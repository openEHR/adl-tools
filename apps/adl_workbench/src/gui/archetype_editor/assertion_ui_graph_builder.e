note
	component:   "openEHR ADL Tools"
	description: "Generic visitor class for ASSERTION objects"
	keywords:    "visitor, assertion expressions"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ASSERTION_UI_GRAPH_BUILDER

inherit
	EXPR_VISITOR
		redefine
			start_assertion, start_expr_binary_operator, end_expr_binary_operator, start_expr_unary_operator, end_expr_unary_operator, start_expr_leaf
		end

create
	make

feature -- Initialisation

	make (a_ui_graph_state: ARCHETYPE_UI_GRAPH_STATE)
		do
			create expr_stack.make (0)
			ui_graph_state := a_ui_graph_state
		end

feature -- Access

	root_node: detachable ASSERTION_UI_NODE
		note
			option: stable
		attribute
		end

	ui_graph_state: ARCHETYPE_UI_GRAPH_STATE

feature -- Visitor

	start_assertion (a_node: ASSERTION; depth: INTEGER)
			-- enter an ASSERTION
		local
			ui_node: ASSERTION_UI_NODE
		do
			create ui_node.make (a_node, ui_graph_state)
			root_node := ui_node
		end

	start_expr_binary_operator (a_node: EXPR_BINARY_OPERATOR; depth: INTEGER)
			-- enter an EXPR_BINARY_OPERATOR
		local
			ui_node: EXPR_BINARY_OP_UI_NODE
		do
			create ui_node.make (a_node, ui_graph_state)
			attach_to_tree (a_node, ui_node)
			expr_stack.extend (ui_node)
		end

	end_expr_binary_operator (a_node: EXPR_BINARY_OPERATOR; depth: INTEGER)
			-- exit an EXPR_BINARY_OPERATOR
		do
			expr_stack.remove
		end

	start_expr_unary_operator (a_node: EXPR_UNARY_OPERATOR; depth: INTEGER)
			-- enter an EXPR_UNARY_OPERATOR
		local
			ui_node: EXPR_UNARY_OP_UI_NODE
		do
			create ui_node.make (a_node, ui_graph_state)
			attach_to_tree (a_node, ui_node)
			expr_stack.extend (ui_node)
		end

	end_expr_unary_operator (a_node: EXPR_UNARY_OPERATOR; depth: INTEGER)
			-- exit an EXPR_UNARY_OPERATOR
		do
			expr_stack.remove
		end

	start_expr_leaf (a_node: EXPR_LEAF; depth: INTEGER)
			-- enter an EXPR_LEAF
		local
			ui_node: EXPR_LEAF_UI_NODE
		do
			create ui_node.make (a_node, ui_graph_state)
			attach_to_tree (a_node, ui_node)
		end

feature {NONE} -- Implementation

	expr_stack: ARRAYED_STACK [EXPR_ITEM_UI_NODE]

	attach_to_tree (a_node: EXPR_ITEM; an_ed_node: EXPR_ITEM_UI_NODE)
		do
			if expr_stack.is_empty then
				check attached root_node as att_rn then
					att_rn.set_expression_context (an_ed_node)
				end
			elseif attached {EXPR_BINARY_OP_UI_NODE} expr_stack.item as bin_op_ctxt and attached {EXPR_BINARY_OPERATOR} a_node.parent as binop then
				if a_node = binop.left_operand then
					bin_op_ctxt.set_left_operand_ed_context (an_ed_node)
				else
					bin_op_ctxt.set_right_operand_ed_context (an_ed_node)
				end
			elseif attached {EXPR_UNARY_OP_UI_NODE} expr_stack.item as un_op_ctxt then
				un_op_ctxt.set_operand_ed_context (an_ed_node)
			end
		end

end


