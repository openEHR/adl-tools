note
	component:   "openEHR ADL Tools"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_BINARY_OPERATOR

inherit
	EXPR_OPERATOR
		rename
			make as make_operator
		end

create
	make

feature -- Initialisation

	make (an_op: OPERATOR_KIND; a_left_item, a_right_item: EXPR_ITEM)
   		do
			make_operator (an_op)
			left_operand := a_left_item
			right_operand := a_right_item
			a_left_item.set_parent (Current)
			a_right_item.set_parent (Current)
		end

feature -- Access

	left_operand: EXPR_ITEM

	right_operand: EXPR_ITEM

feature -- Modification

	set_left_operand (an_item: EXPR_ITEM)
		do
			left_operand := an_item
			an_item.set_parent (Current)
		end

	set_right_operand (an_item: EXPR_ITEM)
		do
			right_operand := an_item
			an_item.set_parent (Current)
		end

feature -- Conversion

	as_string: STRING
		do
			create Result.make_empty
			Result.append (left_operand.as_string)
			Result.append (" " + operator.out + " ")
			Result.append (right_operand.as_string)
		end

feature -- Visitor

	enter_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_expr_binary_operator (Current, depth)
		end

	exit_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_expr_binary_operator (Current, depth)
		end

end


