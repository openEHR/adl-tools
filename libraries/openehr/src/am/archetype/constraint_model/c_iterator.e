note
	component:   "openEHR ADL Tools"
	description: "[
				 Generic Iterator for C_XXX class structures; this just applies various routines to
				 Constraint model nodes. To send a visitor around, use C_VISITOR_ITERATOR.
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ITERATOR

inherit
	SPECIALISATION_STATUSES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Initialisation

	make (a_target: C_COMPLEX_OBJECT)
			-- create a new iterator targetted to the parse tree `a_target'
		do
			target := a_target
			create tree_iterator.make (a_target.representation)

			-- this assignment to ensure void-safety of arch_node; it will be re-assigned during exeuction of the iterator
			arch_node := target
		end

feature -- Access

	target: C_COMPLEX_OBJECT

	c_node_enter_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT, INTEGER]]
		attribute
			Result := agent no_op
		end

	c_node_exit_action: detachable PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT, INTEGER]]

	c_node_test: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN]
		attribute
			Result := agent no_op_test
		end

feature -- Command

	do_all (a_c_node_enter_action: like c_node_enter_action; a_c_node_exit_action: like c_node_exit_action)
		do
			c_node_enter_action := a_c_node_enter_action
			c_node_exit_action := a_c_node_exit_action
			tree_iterator.do_all (agent node_enter_action, agent node_exit_action)
		end

	do_at_surface (a_c_node_enter_action: like c_node_enter_action; a_c_node_test: like c_node_test)
			-- do the enter action at the surface detected by a_c_node_test
		do
			c_node_enter_action := a_c_node_enter_action
			c_node_test := a_c_node_test
			tree_iterator.do_at_surface (agent node_action, agent node_is_included)
		end

	do_until_surface (a_c_node_enter_action: like c_node_enter_action; a_c_node_test: like c_node_test)
			-- do the enter action while a_c_node_test returns true; where it is false, stop processing child nodes
		do
			c_node_enter_action := a_c_node_enter_action
			c_node_test := a_c_node_test
			tree_iterator.do_until_surface (agent node_action, agent node_is_included)
		end

feature {NONE} -- Implementation

	tree_iterator: OG_ITERATOR

	node_enter_action (a_node: OG_ITEM; depth: INTEGER)
		do
			if attached {ARCHETYPE_CONSTRAINT} a_node.content_item as ac then
				arch_node := ac
				c_node_enter_action.call ([arch_node, depth])
			end
		end

	node_exit_action (a_node: OG_ITEM; depth: INTEGER)
		do
			if attached c_node_exit_action as ea then
				ea.call ([arch_node, depth])
			end
		end

	node_is_included (a_node: OG_ITEM): BOOLEAN
		do
			if attached {ARCHETYPE_CONSTRAINT} a_node.content_item as ac then
				arch_node := ac
				Result := c_node_test.item ([arch_node])
			end
		end

	node_action (a_node: OG_ITEM; depth: INTEGER)
		do
			c_node_enter_action.call ([arch_node, depth])
		end

	arch_node: ARCHETYPE_CONSTRAINT

	no_op (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

	no_op_test (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER): BOOLEAN
		do
		end

end


