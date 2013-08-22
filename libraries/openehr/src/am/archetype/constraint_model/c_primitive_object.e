note
	component:   "openEHR ADL Tools"
	description: "[
				 Node of simple type in an ADL parse tree. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN. Occurrences set to the default of {1..1}
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
			default_create, out, enter_subtree, exit_subtree, node_conforms_to
		end

feature -- Initialisaiton

	default_create
			-- set `rm_type_name'
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			rm_type_name := generating_type
			rm_type_name.remove_head (2)
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- False since all C_PRIMITIVE_OBJECTs represent some constraint
		do
			Result := False
		end

feature -- Comparison

	node_conforms_to (other: like Current; an_rm_schema: BMM_SCHEMA): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := precursor (other, an_rm_schema) and do_node_conforms_to (other)
		end

feature -- Output

	as_string: STRING
		deferred
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

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		deferred
		end

end


