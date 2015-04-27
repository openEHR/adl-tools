note
	component:   "openEHR ADL Tools"
	description: "Class to send a visitor to every node in an EXPR_ITEM tree."
	keywords:    "assertion, iterator"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"


class EXPR_VISITOR_ITERATOR

create
	make

feature -- Initialisation

	make(a_target: ASSERTION; a_visitor: EXPR_VISITOR)
			-- create a new manager targetted to the parse tree `a_target'
		do
			create tree_iterator.make (a_target)
			visitor := a_visitor
		end

feature -- Command

	do_all
			-- start the serialisation process; the result will be in `serialiser_output'
		do
			tree_iterator.do_all (agent node_enter_action, agent node_exit_action)
		end

feature {NONE} -- Implementation

	tree_iterator: EXPR_ITERATOR

	visitor: EXPR_VISITOR

	node_enter_action (a_node: RULE_ELEMENT; indent_level: INTEGER)
		do
			a_node.enter_subtree (visitor, indent_level)
		end

	node_exit_action (a_node: RULE_ELEMENT; indent_level: INTEGER)
		do
			a_node.exit_subtree (visitor, indent_level)
		end

end


