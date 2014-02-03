note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of BOOLEAN"
	keywords:    "archetype, boolean, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_BOOLEAN

inherit
	C_PRIMITIVE_OBJECT
		redefine
			default_create, constraint, assumed_value
		end

create
	make, make_true, make_false, make_true_false, default_create

feature -- Initialisation

	default_create
			-- set `rm_type_name'
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			precursor
			tuple_constraint.extend (create {like constraint}.make (0))
		end

	make_true
		do
			default_create
			constraint.extend (True)
		end

	make_false
		do
			default_create
			constraint.extend (False)
		end

	make_true_false
		do
			default_create
			constraint.extend (False)
			constraint.extend (True)
		end

feature -- Access

	i_th_tuple_constraint (i: INTEGER): like Current
			-- obtain i-th tuple constraint item
		do
			create Result.make (tuple_constraint.i_th (i).deep_twin)
		end

	constraint: ARRAYED_LIST [BOOLEAN]
			-- <precursor>
		do
			Result := tuple_constraint.first
		end

    assumed_value: detachable BOOLEAN_REF
            -- value to be assumed if none sent in data

	prototype_value: BOOLEAN
		do
			 Result := constraint.first
		end

feature -- Status Report

	true_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "True"
		do
			Result := across tuple_constraint as tuple_csr some tuple_csr.item.has (True) end
		end

	false_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "False"
		do
			Result := across tuple_constraint as tuple_csr some tuple_csr.item.has (False) end
		end

	valid_value (a_value: BOOLEAN): BOOLEAN
		do
			Result := across tuple_constraint as tuple_csr some tuple_csr.item.has (a_value) end
		end

	valid_assumed_value (a_value: BOOLEAN_REF): BOOLEAN
		do
			Result := valid_value (a_value.item)
		end

feature {NONE} -- Implementation

	c_equal_constraint (a_constraint, other_constraint: like constraint): BOOLEAN
			-- <precursor>
		do
			Result := across a_constraint as constraint_csr all other_constraint.has (constraint_csr.item) end
		end

	constraint_as_string (a_constraint: like constraint): STRING
			-- generate `constraint' as string
		do
			create Result.make(0)
			across a_constraint as constraint_csr loop
				Result.append_boolean (constraint_csr.item)
				if not constraint_csr.is_last then
					Result.append(", ")
				end
			end
		end

	do_constraint_conforms_to (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := (a_constraint.has (True) implies other_constraint.has (True)) and
				(a_constraint.has (False) implies other_constraint.has (False))
		end

invariant
	Binary_consistency: true_valid or false_valid
	Default_value_consistency: prototype_value and true_valid or else (not prototype_value and false_valid)

end


