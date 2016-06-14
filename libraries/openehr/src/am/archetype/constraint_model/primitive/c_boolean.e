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
			default_create, constraint, assumed_value, enter_subtree, exit_subtree, c_congruent_to, c_conforms_to
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
			create constraint.make (0)
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

	constraint: ARRAYED_LIST [BOOLEAN]
			-- <precursor>

    assumed_value: detachable BOOLEAN_REF
            -- value to be assumed if none sent in data

	prototype_value: BOOLEAN
		do
			 Result := constraint.first
		end

	single_value: BOOLEAN
			-- single value if single-valued
		do
			Result := constraint.first
		end

feature -- Status Report

	is_single_value: BOOLEAN
			-- true if constraint is a single value
		do
			Result := constraint.count = 1
		end

	true_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "True"
		do
			Result := constraint.has (True)
		end

	false_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "False"
		do
			Result := constraint.has (False)
		end

	valid_value (a_value: BOOLEAN): BOOLEAN
		do
			Result := constraint.has (a_value)
		end

	valid_assumed_value (a_value: BOOLEAN_REF): BOOLEAN
		do
			Result := valid_value (a_value.item)
		end

feature -- Comparison

	c_congruent_to (other: like Current): BOOLEAN
			-- True if this node is identical to `other'
		do
			Result := precursor (other) and
				constraint.count = other.constraint.count and
				across constraint as val_csr all other.constraint.has (val_csr.item) end
		end

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a strict subset of `other'
		do
			Result := precursor (other, rm_type_conformance_checker) and
				constraint.count < other.constraint.count and
				across constraint as val_csr all other.constraint.has (val_csr.item) end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_boolean (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_boolean (Current, depth)
		end

feature {NONE} -- Implementation

	constraint_as_string: STRING
			-- generate `constraint' as string
		do
			create Result.make(0)
			across constraint as constraint_csr loop
				Result.append_boolean (constraint_csr.item)
				if not constraint_csr.is_last then
					Result.append(", ")
				end
			end
		end

end


