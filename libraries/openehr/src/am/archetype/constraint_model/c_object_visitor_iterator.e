note
	component:   "openEHR ADL Tools"
	description: "[
				 Tree iterator for C_OBJECT structures. This iterator supplies the standard 'do_all'
				 function which performs an action on entry to each node, descends, and then performs
				 an action on exiting each node; there are two agent actions supplied: node_enter_action
				 and node_exit_action.
				 ]"
	keywords:    "c_object, recursive iterator"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_OBJECT_VISITOR_ITERATOR

create
	make

feature -- Initialisation

	make (a_target: attached C_COMPLEX_OBJECT; a_visitor: C_VISITOR;
			differential_view_flag, update_rm_nodes_flag: BOOLEAN; an_rm_schema: BMM_SCHEMA)
		do
			target := a_target
			visitor := a_visitor
			update_rm_nodes := update_rm_nodes_flag
			differential_view := differential_view_flag
			rm_schema := an_rm_schema
		end

feature -- Access

	target: C_COMPLEX_OBJECT

	visitor: C_VISITOR

	rm_schema: BMM_SCHEMA

feature -- Status Report

	update_rm_nodes: BOOLEAN

	differential_view: BOOLEAN

feature -- Traversal

	do_all
			-- do enter_action and exit_action to all nodes in the structure
		do
			depth := 0
			do_all_nodes (target)
		end

feature {NONE} -- Implementation

	c_visitor_enter (a_node: ARCHETYPE_CONSTRAINT; indent_level: INTEGER)
		do
			a_node.enter_subtree (visitor, indent_level)
		end

	c_visitor_exit (a_node: ARCHETYPE_CONSTRAINT; indent_level: INTEGER)
		do
			a_node.exit_subtree (visitor, indent_level)
		end

	do_all_nodes (a_target: attached ARCHETYPE_CONSTRAINT)
		local
			props: HASH_TABLE [BMM_PROPERTY, STRING]
			last_cco: C_COMPLEX_OBJECT
		do
			depth := depth + 1

			-- node entry
			c_visitor_enter (a_target, depth)

			-- main recursion
			if attached {C_COMPLEX_OBJECT} a_target as cco then
				last_cco := cco
				across cco.attributes as attrs_csr loop
					do_all_nodes (attrs_csr.item)
				end
			elseif attached {C_ATTRIBUTE} a_target as ca then
				across ca.children as co_csr loop
					do_all_nodes (co_csr.item)
				end
			end

			-- deal with RM visitor functions
			if update_rm_nodes and then attached {C_OBJECT} a_target as co then
				if rm_schema.has_class_definition (co.rm_type_name) then
					visitor.do_rm_class (rm_schema.class_definition (co.rm_type_name), co, depth)
					if differential_view then
						props := rm_schema.class_definition (co.rm_type_name).properties
					else
						props := rm_schema.class_definition (co.rm_type_name).flat_properties
					end
					across props as props_csr loop
						visitor.do_rm_property (props_csr.item, co, depth)
					end
				end
			end

			-- node exit
			c_visitor_exit (a_target, depth)
			depth := depth - 1
		end

	depth: INTEGER

end


