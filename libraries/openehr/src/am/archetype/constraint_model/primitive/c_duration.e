note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of DURATION"
	keywords:    "archetype, date, duration"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DURATION

inherit
	C_TEMPORAL [ISO8601_DURATION]
		redefine
			valid_value, assumed_value, enter_subtree, exit_subtree
		end

create
	make, make_interval, make_value, make_value_list,
	make_from_pattern, make_pattern_with_range_string,
	make_pattern_with_range, make_example,
	default_create

feature {NONE} -- Initialisation

	make_example
		do
			make_from_pattern ("PDTHMS")
		end

	make_pattern_with_range_string (a_pattern, a_lower_str, an_upper_str: detachable STRING; include_lower, include_upper: BOOLEAN)
			-- Create from an ISO8601-based pattern, together with two ISO8601 strings representing an interval.
			-- If either `a_lower' or `an_upper' is Void, the interval is open-ended;
			-- if they are the same, the interval is a single point.
			-- Boolean flags indicate whether to include limits in the range or not.
		require
			not_all_void: a_pattern /= Void or a_lower_str /= Void or an_upper_str /= Void
			valid_pattern: attached a_pattern as p implies valid_iso8601_duration_constraint_pattern (p)
			valid_lower: attached a_lower_str as l_str implies valid_iso8601_duration (l_str)
			valid_upper: attached an_upper_str as u_str implies valid_iso8601_duration (u_str)
			valid_order: (attached a_lower_str as l_str and attached an_upper_str as u_str) implies
				iso8601_string_to_comparable_duration (l_str) <= iso8601_string_to_comparable_duration (u_str)
		local
			lower_duration, upper_duration: detachable ISO8601_DURATION
			ivl: detachable INTERVAL [ISO8601_DURATION]
		do
			default_create
			if attached a_pattern as att_pat then
				pattern_constraint := att_pat
			end

			if attached a_lower_str as lower_dur then
				create lower_duration.make_from_string (lower_dur)
			end

			if attached an_upper_str as upper_dur then
				create upper_duration.make_from_string (upper_dur)
			end

			if attached upper_duration as upper_dur and attached lower_duration as lower_dur then
				if upper_dur.is_equal (lower_dur) then
					create {POINT_INTERVAL [ISO8601_DURATION]} ivl.make (lower_dur)
				else
					create {PROPER_INTERVAL [ISO8601_DURATION]} ivl.make_bounded (lower_dur, upper_dur, include_lower, include_upper)
				end
			elseif attached upper_duration as upper_dur then
				create {PROPER_INTERVAL [ISO8601_DURATION]} ivl.make_lower_unbounded (upper_dur, include_upper)
			elseif attached lower_duration as lower_dur then
				create {PROPER_INTERVAL [ISO8601_DURATION]} ivl.make_upper_unbounded (lower_dur, include_lower)
			end
			check attached ivl as att_ivl then
				constraint.extend (att_ivl)
			end
		end

	make_pattern_with_range (a_pattern: STRING; an_interval: INTERVAL [ISO8601_DURATION])
			-- Create from an ISO8601-based pattern, together with an ISO8601-based interval.
		require
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			default_create
			constraint.extend (an_interval)
			pattern_constraint := a_pattern
		ensure
			pattern_set: pattern_constraint = a_pattern
			interval_set: constraint.has (an_interval)
		end

feature -- Access

	string_to_item (a_str: STRING): ISO8601_DURATION
			-- convert `a_str' to an object of type G
		do
			Result := iso8601_string_to_duration (a_str)
		end

    assumed_value: detachable ISO8601_DURATION
            -- value to be assumed if none sent in data

feature -- Status Report

	valid_value (a_value: ISO8601_DURATION): BOOLEAN
			-- Is `a_value' within `range' and matches `pattern' if it is also defined?
		do
			if not constraint.first.unbounded then
				Result := across constraint as ivl_csr some ivl_csr.item.has (a_value) end
			end
			if not Result and not pattern_constraint.is_empty then
				-- FIXME: TO BE IMPLEMENTED
				Result := Result and True
			end
		end

	valid_string (a_str: STRING): BOOLEAN
			-- True if `a_str' is a valid ISO8601-based duration pattern.
			-- Allowed patterns:
			-- P[Y|y][M|m][D|d][T[H|h][M|m][S|s]] or P[W|w]
		do
			Result := valid_iso8601_duration (a_str)
		end

	valid_pattern_constraint (a_pattern: STRING): BOOLEAN
		do
			Result := valid_iso8601_duration_constraint_pattern (a_pattern)
		end

	valid_pattern_constraint_replacement (a_pattern, an_other_pattern: STRING): BOOLEAN
		do
			Result := valid_duration_constraint_replacement (a_pattern, an_other_pattern)
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_duration (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_duration (Current, depth)
		end

end


