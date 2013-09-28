note
	component:   "openEHR ADL Tools"
	description: "Abstract constrainer type for instances of temporal types; adds a pattern means of constraint"
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
			default_create, prototype_value, valid_value, as_string, do_node_conforms_to
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
			rm_type_name := bare_type_name (({G}).name)
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
				list.extend (att_ivl)
			end
		end

	make_from_pattern (a_pattern: STRING)
			-- create Result from an ISO8601-based pattern like "yyyy-mm-XX"
		require
			a_pattern_valid: valid_pattern_constraint (a_pattern)
		do
			default_create
			pattern := a_pattern
		ensure
			pattern_set: pattern = a_pattern
		end

feature -- Access

	pattern: detachable STRING
			-- ISO8601-based pattern based on concrete type, e.g. "yyyy-mm-??" for date

	prototype_value: G
		do
			if attached pattern as att_pattern then
				-- Result := FIXME - generate a default from a pattern
				create Result.default_create
			else
				Result := precursor
			end
		end

	string_to_item (a_str: STRING): G
			-- convert `a_str' to an object of type G
		require
			valid_string (a_str)
		deferred
		end

feature -- Status Report

	valid_value (a_value: G): BOOLEAN
		do
			if attached pattern as att_pattern then
				-- Result := a_value matches pattern FIXME - to be implemented
				Result := True
			else
				Result := precursor (a_value)
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

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			if attached pattern as att_pattern then
				Result.append (att_pattern)
			else
				Result := precursor
			end
		end

feature -- Modification

	set_constraint (a_list: detachable like list; a_pattern: detachable STRING)
		do
			if attached a_list as att_rng then
				list := att_rng
			end
			pattern := a_pattern
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if attached pattern as p and attached other.pattern as other_p then
				Result := valid_pattern_constraint_replacement (p, other_p)
			else
				Result := precursor (other)
			end
		end

invariant
	Basic_validity: not list.is_empty xor pattern /= Void
	Pattern_validity: attached pattern as p implies valid_pattern_constraint (p)

end


