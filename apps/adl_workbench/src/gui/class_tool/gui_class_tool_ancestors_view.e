note
	component:   "openEHR ADL Tools"
	description: "Class map control - Visualise a reference model class as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_CLASS_TOOL_ANCESTORS_VIEW

inherit
	GUI_CLASS_TARGETTED_TOOL

create
	make

feature -- Definitions

	Default_closure_depth: INTEGER = 2
			-- default depth to explore supplier closure

feature -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container
			create ev_tree

			-- connect widgets
			ev_root_container.extend (ev_tree)
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_CELL

feature {NONE} -- Implementation

	ev_tree: EV_TREE

	do_clear
		do
 			ev_tree.wipe_out
		end

	do_populate
			-- populate the ADL tree control by creating it from scratch
   		local
			a_ti: EV_TREE_ITEM
		do
 			create ev_tree_item_stack.make (0)
 			a_ti := create_node (source)
 			ev_tree.extend (a_ti)
			ev_tree_item_stack.extend (a_ti)
			populate_ancestor_nodes (source)
			ev_tree.recursive_do_all (agent ev_tree_item_expand)
		end

	ev_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]

   	create_node (a_class_def: attached BMM_CLASS_DEFINITION): EV_TREE_ITEM
			-- create a node for `a_class_def'
 		do
			create Result
			Result.set_text (a_class_def.name)
			Result.set_data (a_class_def)
			Result.set_pixmap (get_icon_pixmap ("rm/generic/" + a_class_def.type_category))
		end

   	populate_ancestor_nodes (a_class_def: attached BMM_CLASS_DEFINITION)
			-- Add sub node node
   		local
			a_ti: EV_TREE_ITEM
		do
			from a_class_def.ancestors.start until a_class_def.ancestors.off loop
				a_ti := create_node (a_class_def.ancestors.item_for_iteration)
	 	 		a_ti.pointer_button_press_actions.force_extend (agent class_node_handler (a_ti, ?, ?, ?))
				ev_tree_item_stack.item.extend (a_ti)
				ev_tree_item_stack.extend (a_ti)
				populate_ancestor_nodes (a_class_def.ancestors.item_for_iteration)
				ev_tree_item_stack.remove
				a_class_def.ancestors.forth
			end
		end

	ev_tree_item_expand (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expandable then -- and node_data.is_addressable then
				an_ev_tree_node.expand
			end
		end

	class_node_handler (eti: EV_SELECTABLE; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			menu: EV_MENU
		do
			if attached {BMM_CLASS_DEFINITION} eti.data as bmm_class_def and button = {EV_POINTER_CONSTANTS}.right then
				create menu
				add_class_context_menu (menu, bmm_class_def)
				menu.show
			end
		end

end


