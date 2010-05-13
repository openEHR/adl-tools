note
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

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Right_arrow_char: NATURAL_32 = 0x279C

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW)
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		require
			a_main_window /= Void
		do
			gui := a_main_window
   			gui_tree := gui.archetype_file_tree
   			gui_tree.set_minimum_width (gui.max_arch_explorer_width)
		end

feature -- Commands

	populate
			-- Populate `gui_file_tree' from `archetype_directory'.
		do
			gui_tree.wipe_out
 			create gui_tree_item_stack.make (0)
 			arch_dir.do_all (agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
			gui_tree.recursive_do_all (agent ev_tree_expand)
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

						if attached {EV_TREE_NODE} gui_tree.selected_item as node and then attached {ARCH_REP_ITEM} node.data as ari then
							arch_dir.set_selected_item (ari)
							if attached {ARCH_REP_ARCHETYPE} ari as ara then
								gui.parse_archetype
							else
								gui.display_class
							end
						end
					end)
			end

			delay_to_make_keyboard_navigation_practical.set_interval (300)
		end

   	update_tree_node (node: EV_TREE_NODE)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
		require
			node_attached: node /= Void
   		local
			text, tooltip: STRING_32
			pixmap: EV_PIXMAP
		do
			if attached {ARCH_REP_ITEM} node.data as ari then
				text := utf8 (ari.display_name)

				if attached {ARCH_REP_ARCHETYPE} ari as ara then
					tooltip := utf8 (ara.full_path)
					if ara.legacy_is_primary and display_archetype_source then
						text.prepend (utf8("(f) "))
					end

					if ara.has_slots then
						text.append_code (Right_arrow_char)	-- Unicode character: an arrow pointing right
					end

					if ara.has_compiler_status then
						tooltip.append (utf8 ("%N%N" + ara.compiler_status))
					end
	 				node.set_tooltip (tooltip)
	 			else -- it is a model node
	 				text.append (utf8(" (" + ari.subtree_archetype_count.out + ")"))
				end

				node.set_text (text)
				pixmap := pixmaps [ari.group_name]
				if pixmap /= Void then
					node.set_pixmap (pixmap)
				end
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- Main window of system.

	gui_tree: EV_TREE
			-- reference to MAIN_WINDOW.archetype_file_tree

	gui_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]
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
			if (an_item.has_archetypes or else show_entire_ontology) and not an_item.is_root then
				create node
	 			node.set_data (an_item)
	 			update_tree_node (node)

				if gui_tree_item_stack.is_empty then
					gui_tree.extend (node)
				else
					gui_tree_item_stack.item.extend (node)
				end

				gui_tree_item_stack.extend (node)
			end
		end

   	populate_gui_tree_node_exit (an_item: ARCH_REP_ITEM)
   		do
			if (an_item.has_archetypes or else show_entire_ontology) and not an_item.is_root then
				gui_tree_item_stack.remove
			end
		end

	ev_tree_expand(node: EV_TREE_NODE)
			--
		do
	 		if attached {ARCH_REP_MODEL_NODE} node.data as arf then
	 			if (arf.is_abstract_class or arf.is_package) and node.is_expandable then
					node.expand
	 			end
	 		end
		end

invariant
	gui_attached: gui /= Void
	tree_attached: gui_tree /= Void

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
