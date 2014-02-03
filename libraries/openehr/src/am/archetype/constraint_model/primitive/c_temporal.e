note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract constrainer type for instances of temporal types; adds a parallel tuple of 
				 string pattern constraints called `tuple_pattern_constraint' that together with 
				 `tuple_constraint' makes up the whole representation. If there is an item in 
				 `tuple_pattern_constraint' at index i, then the entry in `tuple_constraint' is
				 ignored. 
				 
				 An empty string is considered a blank entry in `tuple_pattern_constraint'.
				 
				 An open interval is considered a blank entry in `tuple_constraint'
				 
				 The two tuple arrays are maintained at the same length through all modifications.
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
			default_create, make, make_value, make_value_list, make_interval, c_equal,
			aom_builtin_type, prototype_value, valid_value, as_string, c_conforms_to,
			i_th_tuple_constraint, merge_tuple
		end

	C_DATE_TIME_ROUTINES
		export
			{NONE} all;
		undefine
			default_create, out
		end

feature -- Initialisation

	default_create
		do
			precursor {C_ORDERED}
		end

	make (a_constraint: like constraint)
		do
			precursor (a_constraint)
			tuple_pattern_constraint.extend ("")
		end

	make_interval (an_interval: INTERVAL [G])
			-- make single constraint with `an_interval'
		do
			precursor (an_interval)
			tuple_pattern_constraint.extend ("")
		end

	make_value_list (a_values: LIST [G])
			-- make from a list of values
		do
			precursor (a_values)
			tuple_pattern_constraint.extend ("")
		end

	make_value (v: G)
		do
			precursor (v)
			tuple_pattern_constraint.extend ("")
		end

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
			tuple_pattern_constraint.extend ("")
		ensure
			Lists_synced: tuple_count = tuple_pattern_count
		end

	make_from_pattern (a_pattern: STRING)
			-- create Result from an ISO8601-based pattern like "yyyy-mm-XX"
		require
			a_pattern_valid: valid_pattern_constraint (a_pattern)
		do
			default_create
			tuple_pattern_constraint.extend (a_pattern)
			constraint.extend (create {PROPER_INTERVAL [G]}.make_unbounded)
		ensure
			pattern_set: pattern_constraint = a_pattern
			Lists_synced: tuple_count = tuple_pattern_count
		end

feature -- Access

	tuple_pattern_constraint: ARRAYED_LIST [STRING]
			-- parallel constraint structure containing one or more ISO8601-based pattern based on
			-- concrete types, e.g. "yyyy-mm-??" for date
		attribute
			create Result.make (0)
		end

	tuple_pattern_count: INTEGER
		do
			Result := tuple_pattern_constraint.count
		end

	pattern_constraint: STRING
			-- extract the first item in `tuple_pattern_constraint'
		do
			Result := tuple_pattern_constraint.first
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

	aom_builtin_type: STRING
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			Result := bare_type_name (({G}).name)
		end

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
					else
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
					else
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
		do
			create Result.make_empty
			if not pattern_constraint.is_empty then
				Result.append (pattern_constraint)
			else
				Result := precursor
			end
		end

feature -- Modification

	merge_tuple (other: like Current)
			-- merge the constraints of `other' into this constraint object. We just add items to
			-- the end of lists of constraints in the subtypes, since the constraints may represent
			-- a tuple vector, in which case duplicates are allowed
		do
			if not other.pattern_constraint.is_empty then
				tuple_pattern_constraint.extend (other.pattern_constraint)
				tuple_constraint.extend (create {like constraint}.make (0))
				tuple_constraint.last.extend (create {PROPER_INTERVAL [G]}.make_unbounded)
			else
				tuple_constraint.extend (other.constraint)
				tuple_pattern_constraint.extend ("")
			end
		end

feature {P_C_TEMPORAL} -- Modification

	set_constraint (a_tuple_constraint: detachable like tuple_constraint; a_tuple_pattern_constraint: detachable like tuple_pattern_constraint)
		do
			if attached a_tuple_constraint as att_tpl then
				tuple_constraint := att_tpl
			end
			if attached a_tuple_pattern_constraint as att_tpl then
				tuple_pattern_constraint := att_tpl
			end
		end

end


