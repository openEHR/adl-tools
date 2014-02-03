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
			valid_value, as_string, assumed_value, c_equal, c_conforms_to
		end

create
	make, make_interval, make_value, make_value_list,
	make_from_pattern, make_pattern_with_range_string,
	make_pattern_with_range,
	default_create

feature {NONE} -- Initialisation

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
				tuple_pattern_constraint.extend (att_pat)
			else
				tuple_pattern_constraint.extend ("")
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
		ensure
			pattern_set: pattern_constraint = a_pattern
			interval_if_lower_or_upper: (a_lower_str /= Void or an_upper_str /= Void) xor constraint.is_empty
		end

	make_pattern_with_range (a_pattern: STRING; an_interval: INTERVAL [ISO8601_DURATION])
			-- Create from an ISO8601-based pattern, together with an ISO8601-based interval.
		require
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			default_create
			constraint.extend (an_interval)
			tuple_pattern_constraint.extend (a_pattern)
		ensure
			pattern_set: pattern_constraint = a_pattern
			interval_set: constraint.has (an_interval)
		end

feature -- Access

	i_th_tuple_constraint (i: INTEGER): like Current
			-- obtain i-th tuple constraint item
		do
			if not tuple_pattern_constraint.i_th (i).is_empty then
				create Result.make_from_pattern (tuple_pattern_constraint.i_th (i).deep_twin)
			else
				create Result.make (tuple_constraint.i_th (i).deep_twin)
			end
		end

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

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := node_id_conforms_to (other) and occurrences_conforms_to (other) and
				(rm_type_name.is_case_insensitive_equal (other.rm_type_name) or else
				rm_type_conformance_checker.item ([rm_type_name, other.rm_type_name]))

			if Result and tuple_count = other.tuple_count then
				from
					tuple_constraint.start
					tuple_pattern_constraint.start
					other.tuple_constraint.start
					other.tuple_pattern_constraint.start
				until
					tuple_constraint.off or not Result
				loop
					if not tuple_pattern_constraint.item.is_empty and not other.tuple_pattern_constraint.item.is_empty then
						Result := valid_pattern_constraint_replacement (tuple_pattern_constraint.item, other.tuple_pattern_constraint.item)
					end
					if Result and not tuple_constraint.item.first.unbounded then
						Result := do_constraint_conforms_to (tuple_constraint.item, other.tuple_constraint.item)
					end

					tuple_constraint.forth
					tuple_pattern_constraint.forth
					other.tuple_constraint.forth
					other.tuple_pattern_constraint.forth
				end
			end
		end

	c_equal (other: like Current): BOOLEAN
			-- True if Current and `other' are semantically the same locally (child objects may differ)
		do
			Result := occurrences ~ other.occurrences and
				node_id.is_equal (other.node_id) and
				aom_builtin_type.is_case_insensitive_equal (other.aom_builtin_type)
			if Result and tuple_count = other.tuple_count then
				from
					tuple_constraint.start
					tuple_pattern_constraint.start
					other.tuple_constraint.start
					other.tuple_pattern_constraint.start
				until
					tuple_constraint.off or not Result
				loop
					if not tuple_pattern_constraint.item.is_empty and not other.tuple_pattern_constraint.item.is_empty then
						Result := tuple_pattern_constraint.item.is_equal (other.tuple_pattern_constraint.item)
					end
					if Result and not tuple_constraint.item.first.unbounded then
						Result := c_equal_constraint (tuple_constraint.item, other.tuple_constraint.item)
					end

					tuple_constraint.forth
					tuple_pattern_constraint.forth
					other.tuple_constraint.forth
					other.tuple_pattern_constraint.forth
				end
			end
		end

feature -- Output

	as_string: STRING
			-- Textual representation.
		do
			create Result.make_empty
			if not pattern_constraint.is_empty then
				Result.append (pattern_constraint)
			end
			if not constraint.first.unbounded then
				if not Result.is_empty then
					Result.append_character ('/')
				end
				across constraint as ivl_csr loop
					Result.append ("|" + ivl_csr.item.as_string + "|")
					if not ivl_csr.is_last then
						Result.append (", ")
					end
				end
			end
			if attached assumed_value as av then
				Result.append ("; " + av.as_string)
			end
		end

end


