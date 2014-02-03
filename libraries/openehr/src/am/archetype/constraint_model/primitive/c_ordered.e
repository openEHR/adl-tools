note
	component:   "openEHR ADL Tools"
	description: "Abstract constrainer type for instances of comparable primitive types"
	keywords:    "archetype, comparable"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_ORDERED [G -> COMPARABLE create default_create end]

inherit
	C_PRIMITIVE_OBJECT
		redefine
			default_create, constraint, assumed_value, as_string
		end

feature -- Initialisation

	default_create
		do
			precursor
			tuple_constraint.extend (create {like constraint}.make (0))
		end

	make_interval (an_interval: INTERVAL [G])
			-- make single constraint with `an_interval'
		do
			default_create
			constraint.extend (an_interval)
		ensure
			constraint.has (an_interval)
		end

	make_value_list (a_values: LIST [G])
			-- make from a list of values
		require
			Values_valid: not a_values.is_empty
		do
			default_create
			across a_values as vals_csr loop
				constraint.extend (create {POINT_INTERVAL [G]}.make (vals_csr.item))
			end
		end

	make_value (v: G)
		do
			default_create
			constraint.extend (create {POINT_INTERVAL [G]}.make (v))
		end

feature -- Access

	constraint: ARRAYED_LIST [INTERVAL [G]]
			-- single constraint represented by this object; accommodates
			-- single interval, multiple interval, list of single values, mixed values / intervals
		do
			Result := tuple_constraint.first
		end

	prototype_value: G
		do
			if not constraint.is_empty then
				if attached constraint.first.lower as l then
					Result := l
				elseif attached constraint.first.upper as u then
					Result := u
				else
					create Result.default_create
				end
			else
				create Result.default_create
			end
		end

	assumed_value: detachable COMPARABLE

feature -- Status Report

	valid_value (a_value: G): BOOLEAN
		do
			Result := across tuple_constraint as list_ivl_csr some
				(across list_ivl_csr.item as ivl_csr some ivl_csr.item.has (a_value) end)
			end
		end

feature -- Modification

	add_value (a_val: G)
		require
			not is_tuple
		do
			constraint.extend (create {POINT_INTERVAL [G]}.make (a_val))
		end

	add_interval (an_interval: INTERVAL [G])
		require
			not is_tuple
		do
			constraint.extend (an_interval)
		end

feature -- Output

	as_string: STRING
			-- generate `constraint' as string
		do
			Result := constraint_as_string (constraint)
			if attached {G} assumed_value as av then
				Result.append ("; " + format_value (av))
			end
		end

feature {NONE} -- Implementation

	c_equal_constraint (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if `a_constraint' is the same as `other_constraint'
		do
			from a_constraint.start until a_constraint.off or not Result loop
				Result := across other_constraint as other_constraint_csr some other_constraint_csr.item.is_equal (a_constraint.item) end
				a_constraint.forth
			end
		end

	constraint_as_string (a_constraint: like constraint): STRING
			-- <precursor>
		do
			create Result.make_empty
			across a_constraint as ivl_csr loop
				if not ivl_csr.item.is_point then
					Result.append_character ('|')
				end
				Result.append (ivl_csr.item.as_string)
				if not ivl_csr.item.is_point then
					Result.append_character ('|')
				end
				if not ivl_csr.is_last then
					Result.append (", ")
				end
			end
		end

	do_constraint_conforms_to (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			across a_constraint as ivl_csr loop
				Result := across other_constraint as other_ivl_csr some other_ivl_csr.item.contains (ivl_csr.item) end
			end
		end

	format_value (a_val: G): STRING
		do
			Result := a_val.out
		end

end


