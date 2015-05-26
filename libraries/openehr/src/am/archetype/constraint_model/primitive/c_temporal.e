note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract constrainer type for instances of temporal types; adds a second string
				 pattern constraint
				 ]"
	keywords:    "archetype, temporal"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_TEMPORAL [G -> ISO8601_TYPE create default_create, make_from_string end]

inherit
	C_ORDERED [G]
		rename
			set_constraint as set_comparable_constraint
		redefine
			c_congruent_to, constrained_typename, assumed_value, prototype_value, valid_value, as_string, c_conforms_to
		end

	C_DATE_TIME_ROUTINES
		export
			{NONE} all;
		undefine
			default_create, out
		end

feature -- Initialisation

	make_string_interval (a_lower_str, an_upper_str: detachable STRING)
			-- make from two iso8601 strings. Either may be Void, indicating an open-ended interval;
			-- they may also be the same, meaning a single point. Limits, where provided, are automatically
			-- included in the interval
		require
			valid_interval: attached a_lower_str or attached an_upper_str
			lower_valid: attached a_lower_str as l_str implies valid_string (l_str)
			upper_valid: attached an_upper_str as u_str implies valid_string (u_str)
			valid_order: (attached a_lower_str as l_str and attached an_upper_str as u_str) implies
						(string_to_item (l_str) <= string_to_item (u_str))
		local
			lower, upper: detachable G
			ivl: detachable INTERVAL [G]
		do
			default_create

			if attached a_lower_str as l_str then
				create lower.make_from_string (l_str)
			end
			if attached an_upper_str as u_str then
				create upper.make_from_string (u_str)
			end

			if attached lower as l and attached upper as u then
				if l.is_equal (u) then
					create {POINT_INTERVAL [G]} ivl.make (l)
				else
					create {PROPER_INTERVAL [G]} ivl.make_bounded (l, u, True, True)
				end
			elseif attached upper as u then
				create {PROPER_INTERVAL [G]} ivl.make_lower_unbounded (u, True)
			elseif attached lower as l then
				create {PROPER_INTERVAL [G]} ivl.make_upper_unbounded (l, True)
			end
			check attached ivl as att_ivl then
				constraint.extend (att_ivl)
			end
		end

	make_from_pattern (a_pattern: STRING)
			-- create Result from an ISO8601-based pattern like "yyyy-mm-XX"
		require
			a_pattern_valid: valid_pattern_constraint (a_pattern)
		do
			default_create
			pattern_constraint := a_pattern
		ensure
			pattern_set: pattern_constraint = a_pattern
		end

feature -- Access

	pattern_constraint: STRING
			-- extract the first item in `tuple_pattern_constraint'
		attribute
			create Result.make_empty
		end

	prototype_value: G
		do
			if not pattern_constraint.is_empty then
				-- FIXME: check against patterns
				create Result.default_create
			else
				create Result.default_create
			end
		end

	string_to_item (a_str: STRING): G
			-- convert `a_str' to an object of type G
		require
			valid_string (a_str)
		deferred
		end

	constrained_typename: STRING
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			Result := bare_type_name (({G}).name)
		end

	assumed_value: detachable ISO8601_TYPE

feature -- Status Report

	valid_value (a_value: G): BOOLEAN
		do
			if not pattern_constraint.is_empty then
				-- FIXME: check against patterns
				Result := True
			else
				Result := precursor (a_value)
			end
		end

	valid_assumed_value (a_value: attached like assumed_value): BOOLEAN
		do
			if attached {G} a_value as val then
				Result := valid_value (val)
			end
		end

	valid_string (a_str: STRING): BOOLEAN
			-- True if `a_str' is a valid string form of the data item G
		deferred
		end

	valid_pattern_constraint (a_pattern: STRING): BOOLEAN
		deferred
		end

	valid_pattern_constraint_replacement (a_pattern, an_other_pattern: STRING): BOOLEAN
		deferred
		end

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a strict subset of `other'
		do
			if node_id_conforms_to (other) and occurrences_conforms_to (other) and
				(rm_type_name.is_case_insensitive_equal (other.rm_type_name) or else rm_type_conformance_checker.item ([rm_type_name, other.rm_type_name])) and
					across constraint as ivl_csr all
						across other.constraint as other_ivl_csr some other_ivl_csr.item.contains (ivl_csr.item) end
					end
			then
				if not pattern_constraint.is_empty and not other.pattern_constraint.is_empty then
					Result := valid_pattern_constraint_replacement (pattern_constraint, other.pattern_constraint)
				else
					Result := pattern_constraint.is_empty and other.pattern_constraint.is_empty
				end
			end
		end

	c_congruent_to (other: like Current): BOOLEAN
			-- True if Current and `other' are semantically the same
		do
			if not attached occurrences and node_id.is_equal (other.node_id) and constrained_typename.is_case_insensitive_equal (other.constrained_typename) and
				constraint.count = other.constraint.count and then
					across constraint as ivl_csr all
						other.constraint.i_th (ivl_csr.cursor_index).is_equal (ivl_csr.item)
					end
			then
				if not pattern_constraint.is_empty and not other.pattern_constraint.is_empty then
					Result := pattern_constraint.is_equal (other.pattern_constraint)
				else
					Result := pattern_constraint.is_empty and other.pattern_constraint.is_empty
				end
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			if not pattern_constraint.is_empty then
				Result.append (pattern_constraint)
			end
			if not constraint.is_empty then
				if not Result.is_empty then
					Result.append_character ('/')
				end
				Result.append (constraint_as_string)
			end
			if attached assumed_value as av then
				Result.append ("; " + av.as_string)
			end
		end

feature {P_C_TEMPORAL} -- Modification

	set_constraint (a_constraint: detachable like constraint; a_pattern_constraint: detachable like pattern_constraint)
		do
			if attached a_constraint as att_tpl then
				constraint := att_tpl
			end
			if attached a_pattern_constraint as att_tpl then
				pattern_constraint := att_tpl
			end
		end

end


