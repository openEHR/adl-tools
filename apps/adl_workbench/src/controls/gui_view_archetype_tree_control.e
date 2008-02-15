indexing
	component:   "openEHR Archetype Project"
	description: "Populate ontology controls in ADL editor"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_VIEW_ARCHETYPE_TREE_CONTROL

inherit
	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_PARSER
		export
			{NONE} all
		end

	STRING_UTILITIES

create
	make

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW) is
			-- Create tree control repersenting archetype files found in `archetype_directory'.
		require
			a_main_window /= Void
		do
			gui := a_main_window
   			gui_file_tree := gui.archetype_file_tree
   			gui_file_tree.set_minimum_width (gui.max_arch_explorer_width)
		end

feature -- Commands

	populate is
			-- Populate `gui_file_tree' from `archetype_directory'.
		do
			gui_file_tree.wipe_out
 			create gui_tree_item_stack.make (0)
 			archetype_directory.do_subtree (archetype_directory.directory, agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
			gui.select_node_in_archetype_tree_view
		end

	display_details_of_selected_item_after_delay
			-- When the user selects an item in `gui_file_tree', delay before displaying it.
		do
			if delay_to_make_keyboard_navigation_practical = Void then
				create delay_to_make_keyboard_navigation_practical

				delay_to_make_keyboard_navigation_practical.actions.extend (agent
					do
						delay_to_make_keyboard_navigation_practical.set_interval (0)
						gui.select_archetype_from_gui_data (gui_file_tree.selected_item)
					end)
			end

			delay_to_make_keyboard_navigation_practical.set_interval (300)
		end

   	set_node_pixmap (node: EV_TREE_NODE)
   			-- Set the icon appropriate to the item attached to `node'.
		require
			node_attached: node /= Void
   		local
   			item: ARCH_REP_ITEM
			pixmap: EV_PIXMAP
   		do
   			item ?= node.data

			if item /= Void then
				pixmap := pixmaps [item.group_name]

				if pixmap /= Void then
					node.set_pixmap (pixmap)
				end
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	gui_file_tree: EV_TREE
			-- reference to MAIN_WINDOW.archetype_file_tree

	gui_tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]
			-- Stack used during `populate_gui_tree_node_enter'.

	delay_to_make_keyboard_navigation_practical: EV_TIMEOUT
			-- Timer to delay a moment before calling `display_details_of_selected_item'.

   	populate_gui_tree_node_enter (an_item: ARCH_REP_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		require
			item_attached: an_item /= Void
   		local
			node: EV_TREE_ITEM
		do
			create node.make_with_text (utf8 (an_item.base_name))
 			node.set_data (an_item)
 			set_node_pixmap (node)
 			node.set_tooltip (utf8 (an_item.full_path))

			if gui_tree_item_stack.is_empty then
				gui_file_tree.extend (node)
			else
				gui_tree_item_stack.item.extend (node)
			end

			gui_tree_item_stack.extend (node)
		end

   	populate_gui_tree_node_exit (an_item: ARCH_REP_ITEM)
   		do
			gui_tree_item_stack.remove
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
--| The Original Code is adl_node_control.e.
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
