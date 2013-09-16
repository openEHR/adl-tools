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
			valid_value, as_string, do_node_conforms_to
		end

create
	make,
	make_interval,
	make_list, make_list_simple, make_simple, 
	make_from_pattern,
	make_pattern_with_range,
	default_create

feature {NONE} -- Initialisation

	make (a_pattern, a_lower_str, an_upper_str: detachable STRING; include_lower, include_upper: BOOLEAN)
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
			pattern := a_pattern

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
				list.extend (att_ivl)
			end
		ensure
			pattern_set: pattern = a_pattern
			interval_if_lower_or_upper: (a_lower_str /= Void or an_upper_str /= Void) xor list.is_empty
		end

	make_pattern_with_range (a_pattern: STRING; an_interval: INTERVAL [ISO8601_DURATION])
			-- Create from an ISO8601-based pattern, together with an ISO8601-based interval.
		require
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			default_create
			create list.make (0)
			list.extend (an_interval)
			pattern := a_pattern
		ensure
			pattern_set: pattern = a_pattern
			interval_set: list.has (an_interval)
		end

feature -- Access

	string_to_item (a_str: STRING): ISO8601_DURATION
			-- convert `a_str' to an object of type G
		do
			Result := iso8601_string_to_duration (a_str)
		end

feature -- Status Report

	valid_value (a_value: ISO8601_DURATION): BOOLEAN
			-- Is `a_value' within `range' and matches `pattern' if it is also defined?
		do
			if attached list as att_range then
				Result := across att_range as ivl_csr some ivl_csr.item.has (a_value) end
			end
			if attached pattern then
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
		end

feature -- Output

	as_string: STRING
			-- Textual representation.
		do
			create Result.make_empty
			if attached pattern as pat then
				Result.append (pat)
			end
			if attached list as att_range then
				if attached pattern then
					Result.append_character ('/')
				end
				across att_range as ivl_csr loop
					Result.append ("|" + ivl_csr.item.as_string + "|")
					if not ivl_csr.is_last then
						Result.append (", ")
					end
				end
			end
			if attached assumed_value as av then
				Result.append ("; " + av.as_string)
			end
		ensure then
			not_empty: not Result.is_empty
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node constraint is a subset of `other'
		do
			Result := pattern_conforms_to (other) and range_conforms_to (other)
		end

	pattern_conforms_to (other: like Current): BOOLEAN
			-- True if the pattern of this node is or narrower than that in `other'
		do
			if attached pattern as att_pattern and attached other.pattern as att_other_pattern then
				Result := valid_pattern_constraint_replacement (att_pattern, att_other_pattern)
			else
				Result := True
			end
		end

	range_conforms_to (other: like Current): BOOLEAN
			-- True if the pattern of this node is or narrower than that in `other'
		do
			if attached list as rng and attached other.list as other_rng then
				across rng as ivl_csr loop
					Result := across other_rng as other_ivl_csr some other_ivl_csr.item.contains (ivl_csr.item) end
				end
			else
				Result := True
			end
		end

invariant
	basic_validity: attached pattern or attached list

end


