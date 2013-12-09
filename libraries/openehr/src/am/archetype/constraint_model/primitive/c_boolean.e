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
			assumed_value, c_equal
		end

create
	make_true, make_false, make_true_false, make_list, default_create

feature -- Initialisation

	make_true
		do
			default_create
			list.extend (True)
		end

	make_false
		do
			default_create
			list.extend (False)
		end

	make_true_false
		do
			default_create
			list.extend (True)
			list.extend (False)
		end

	make_list (a_list: like list)
		do
			default_create
			list := a_list
		end

feature -- Access

	list: ARRAYED_LIST [BOOLEAN]
		attribute
			create Result.make (0)
		end

	list_count: INTEGER
			-- number of individual constraint items
		do
			Result := list.count
		end

	i_th_constraint (i: INTEGER): BOOLEAN
			-- obtain i-th constraint item
		do
			Result := list.i_th (i)
		end

    assumed_value: detachable BOOLEAN_REF
            -- value to be assumed if none sent in data

	prototype_value: BOOLEAN
		do
			create Result
			Result.set_item (list.first)
		end

feature -- Status Report

	true_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "True"
		do
			Result := across list as list_csr some list_csr.item = True end
		end

	false_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "False"
		do
			Result := across list as list_csr some list_csr.item = False end
		end

	valid_value (a_value: BOOLEAN): BOOLEAN
		do
			Result := (a_value and true_valid) or else (not a_value and false_valid)
		end

	valid_assumed_value (a_value: BOOLEAN_REF): BOOLEAN
		do
			Result := valid_value (a_value.item)
		end

feature -- Comparison

	c_equal (other: like Current): BOOLEAN
			-- True if this node is the same as `other'
		do
			Result := precursor (other) and list_count = other.list_count and then
				across list as list_csr all other.list.has (list_csr.item) end
		end

feature -- Modification

	merge_tuple (other: like Current)
			-- merge the constraints of `other' into this constraint object. We just add items to
			-- the end of lists of constraints in the subtypes, since the constraints may represent
			-- a tuple vector, in which case duplicates are allowed
		do
			list.merge_right (other.list)
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			across list as list_csr loop
				Result.append_boolean (list_csr.item)
				if not list_csr.is_last then
					Result.append(", ")
				end
			end
			if attached assumed_value then
				Result.append ("; " + assumed_value.out)
			end
		end

	i_th_constraint_as_string (i: INTEGER): STRING
			-- serialised form of i-th tuple constraint of this object
		do
			create Result.make(0)
			Result.append_boolean (list.i_th (i))
		end

feature {P_C_BOOLEAN} -- Modification

	set_constraint (a_list: like list)
		do
			list := a_list
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := (true_valid implies other.true_valid) and (false_valid implies other.false_valid)
		end

invariant
	Binary_consistency: true_valid or false_valid
	Default_value_consistency: prototype_value and true_valid or else (not prototype_value and false_valid)

end


