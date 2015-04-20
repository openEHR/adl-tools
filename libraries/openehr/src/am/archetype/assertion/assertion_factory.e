note
	component:   "openEHR ADL Tools"
	description: "operand in an expression tree"
	keywords:    "assertion, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ASSERTION_FACTORY

feature -- Factory

	create_expr_leaf_archetype_definition_ref (an_absolute_path: STRING): EXPR_LEAF
			-- node refers to a feature in an archetype definition
		require
			path_exists: not an_absolute_path.is_empty
		do
			create Result.make_archetype_definition_ref(an_absolute_path)
		end

	create_expr_leaf_archetype_ref (a_rel_path: STRING): EXPR_LEAF
			-- node refers to a feature in an outer archetype structure (not the
			-- definition - use create_expr_leaf_archetype_definition_ref for that)
			-- e.g. 'archetype_id' - see AOM for allowable features; / notation
			-- can be used if need to go deeper
		require
			ref_exists: not a_rel_path.is_empty
		do
			create Result.make_archetype_ref(a_rel_path)
		end

	create_expr_leaf_boolean(an_item: BOOLEAN): EXPR_LEAF
			-- node is a boolean value
   		do
			create Result.make_boolean(an_item)
		end

	create_expr_leaf_real(an_item: REAL): EXPR_LEAF
			-- node is a real value
   		do
			create Result.make_real(an_item)
		end

	create_expr_leaf_integer(an_item: INTEGER): EXPR_LEAF
			-- node is an integer value
   		do
			create Result.make_integer(an_item)
		end

	create_expr_leaf_string (an_item: STRING): EXPR_LEAF
			-- node is a string value
   		do
			create Result.make_string(an_item)
		end

	create_expr_leaf_character(an_item: CHARACTER): EXPR_LEAF
			-- node is a character value
   		do
			create Result.make_character(an_item)
		end

	create_expr_leaf_coded_term (an_item: C_TERMINOLOGY_CODE): EXPR_LEAF
			-- node is a coded term value
   		do
			create Result.make_coded_term (an_item)
		end

	create_expr_leaf_constraint(an_item: C_PRIMITIVE_OBJECT): EXPR_LEAF
			-- node is a constraint on a primitive type; can only be used with "matches" function
			-- an_item is C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN
   		do
			create Result.make_constraint(an_item)
		end

	create_expr_unary_operator_node (an_operator: OPERATOR_KIND; an_operand: EXPR_ITEM): EXPR_UNARY_OPERATOR
			-- operators with one operand, e.g. not x, -5 etc
   		do
			create Result.make(an_operator, an_operand)
		end

	create_expr_binary_operator_node (an_operator: OPERATOR_KIND; a_left_operand, a_right_operand: EXPR_ITEM): EXPR_BINARY_OPERATOR
			-- operators with boolean results, e.g.
			-- and, or, xor, etc
   		do
			create Result.make (an_operator, a_left_operand, a_right_operand)
		end

	create_assertion (an_expr: EXPR_ITEM; a_tag: STRING): ASSERTION
			-- make assertion with an expression and an optional tag
		require
			Tag_valid: not a_tag.is_empty
   		do
			create Result.make_with_tag(an_expr, a_tag)
		end

end


