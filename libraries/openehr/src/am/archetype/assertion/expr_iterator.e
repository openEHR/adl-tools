note
	component:   "openEHR ADL Tools"
	description: "[
				 Expression tree iterator. This iterator currently supplies the standard 'do_all'
				 function which performs an action on entry to each node, descends, and then performs
				 an action on exiting each node; there are two agent actions supplied: node_enter_action
				 and node_exit_action. This allows signficantly more power than just a single action per 
				 node type.
				 ]"
	keywords:    "expressions, invariant, assertion, recursive iterator"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_ITERATOR

create
	make

feature -- Initialisation

	make (a_target: EXPR_ITEM)
		do
			target := a_target
		end

feature -- Access

	target: EXPR_ITEM

feature -- Traversal

	do_all (node_enter_action: PROCEDURE[ANY, TUPLE[EXPR_ITEM, INTEGER]]; node_exit_action: detachable PROCEDURE[ANY, TUPLE[EXPR_ITEM, INTEGER]])
			-- do enter_action and exit_action to all nodes in the structure
		do
			depth := 0
			do_all_nodes (target, node_enter_action, node_exit_action)
		end

feature {NONE} -- Implementation

	do_all_nodes (a_target: EXPR_ITEM; node_enter_action: PROCEDURE[ANY, TUPLE[EXPR_ITEM, INTEGER]]; node_exit_action: detachable PROCEDURE[ANY, TUPLE[EXPR_ITEM, INTEGER]])
		do
			depth := depth + 1
			node_enter_action.call ([a_target, depth])
			if attached {EXPR_BINARY_OPERATOR} a_target as a_binary_op then
				do_all_nodes (a_binary_op.left_operand, node_enter_action, node_exit_action)
				do_all_nodes (a_binary_op.right_operand, node_enter_action, node_exit_action)
			elseif attached {EXPR_UNARY_OPERATOR} a_target as a_unary_op then
				do_all_nodes (a_unary_op.operand, node_enter_action, node_exit_action)
			elseif attached {ASSERTION} a_target as assn then
				do_all_nodes (assn.expression, node_enter_action, node_exit_action)
			end
			if attached node_exit_action then
				node_exit_action.call ([a_target, depth])
			end
			depth := depth - 1
		end

	depth: INTEGER

end


