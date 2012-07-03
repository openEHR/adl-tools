note
	component:   "openEHR Archetype Project"
	description: "Class map control - Visualise a reference model class as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
			ev_root_container.set_data (Current)

			create ev_tree

			-- connect widgets
			ev_root_container.extend (ev_tree)

			-- visual characteristics

			-- set events
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


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is adl_node_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
