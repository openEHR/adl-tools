note
	component:   "openEHR ADL Tools"
	description: "[
				 Node of simple type in an ADL parse tree. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_PRIMITIVE_OBJECT

inherit
	C_LEAF_OBJECT
		redefine
			default_create, out, enter_subtree, exit_subtree, c_conforms_to, c_equal
		end

feature -- Initialisaiton

	default_create
			-- set `rm_type_name'
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			rm_type_name := aom_builtin_type
			set_node_id (Primitive_node_id)
		end

	make (a_constraint: like constraint)
		do
			default_create
			if tuple_constraint.is_empty then
				tuple_constraint.extend (a_constraint)
			else
				tuple_constraint.put_i_th (a_constraint, 1)
			end
		end

feature -- Access

	constraint: ANY
			-- single constraint represented by this object
		do
			Result := tuple_constraint.first
		end

	tuple_constraint: ARRAYED_LIST [like constraint]
			-- tuple constraint represented by this object
		attribute
			create Result.make (0)
		end

	tuple_count: INTEGER
			-- number of tuple constraint items
		do
			Result := tuple_constraint.count
		end

	i_th_tuple_constraint (i: INTEGER): like Current
			-- obtain i-th tuple constraint item
		require
			Is_tuple: is_tuple
			valid_index: i > 0 and i <= tuple_count
		deferred
		end

	aom_builtin_type: STRING
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			Result := generating_type
			Result.remove_head (2)
		end

    assumed_value: detachable ANY
            -- value to be assumed if none sent in data

feature -- Status Report

	is_tuple: BOOLEAN
			-- True if there is more than one constraint
		do
			Result := tuple_count > 1
		end

	has_assumed_value: BOOLEAN
			-- True if there is an assumed value
		do
			Result := attached assumed_value
		end

	valid_assumed_value (a_value: like assumed_value): BOOLEAN
		deferred
		end

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := precursor (other, rm_type_conformance_checker) and
				tuple_count <= other.tuple_count and then
				across tuple_constraint as tuple_csr all
					do_constraint_conforms_to (tuple_csr.item, other.tuple_constraint.i_th (tuple_csr.target_index))
				end
		end

	c_equal (other: like Current): BOOLEAN
			-- True if Current and `other' are semantically the same locally (child objects may differ)
		do
			Result := occurrences ~ other.occurrences and
				node_id.is_equal (other.node_id) and
				aom_builtin_type.is_case_insensitive_equal (other.aom_builtin_type) and
				tuple_count = other.tuple_count and
				across tuple_constraint as tuple_csr all
					c_equal_constraint (tuple_csr.item, other.tuple_constraint.i_th (tuple_csr.target_index))
				end
		end

feature -- Modification

	set_assumed_value (a_value: attached like assumed_value)
			-- set `assumed_value'
		require
			valid_assumed_value (a_value)
		do
			assumed_value := a_value
		ensure
			assumed_value_set: assumed_value = a_value
		end

	merge_tuple (other: like Current)
			-- merge the constraints of `other' into this constraint object. We just add items to
			-- the end of lists of constraints in the subtypes, since the constraints may represent
			-- a tuple vector, in which case duplicates are allowed
		require
			not other.is_tuple
		do
			tuple_constraint.extend (other.constraint)
		end

feature {P_C_PRIMITIVE_OBJECT} -- Modification

	set_constraint (a_tuple_constraint: like tuple_constraint)
		do
			tuple_constraint := a_tuple_constraint
		end

feature -- Output

	as_string: STRING
			-- generate `constraint' as string
--		require
--			not is_tuple
		do
			create Result.make (0)
			Result.append (constraint_as_string (constraint))
			if attached assumed_value then
				Result.append ("; " + assumed_value.out)
			end
		end

	i_th_tuple_constraint_as_string (i: INTEGER): STRING
			-- serialised form of i-th tuple constraint of this object
			-- assumed value is omitted
		require
			i > 0 and i <= tuple_count
		local
			a_constraint: like constraint
		do
			Result := constraint_as_string (tuple_constraint.i_th (i))
		end

	out: STRING
		do
			Result := as_string
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_primitive_object (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_primitive_object (Current, depth)
		end

feature {NONE} -- Implementation

	c_equal_constraint (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if `a_constraint' is the same as `other_constraint'
		deferred
		end

	constraint_as_string (a_constraint: like constraint): STRING
			-- generate `constraint' as string
		deferred
		end

	do_constraint_conforms_to (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if `a_constraint' is a subset of, or the same as `other_constraint'
		deferred
		end

invariant
	Assumed_value_valid: attached assumed_value as av implies valid_value (av)

end


