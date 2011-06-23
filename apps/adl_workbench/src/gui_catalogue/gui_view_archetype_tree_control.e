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
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
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

	make (a_main_window: attached MAIN_WINDOW; a_tree_control: attached EV_TREE; a_label: attached EV_LABEL; artefact_types_list: ARRAY [INTEGER])
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		require
			valid_artefact_type: (create {ARTEFACT_TYPE}).valid_artefact_types(artefact_types_list)
		do
			gui := a_main_window
   			gui_tree := a_tree_control
   			explorer_label := a_label
   			gui_tree.set_minimum_width (gui.max_arch_explorer_width)
   			artefact_types := artefact_types_list
		end

feature -- Commands

	display_details_of_selected_item_after_delay
			-- When the user selects an item in `gui_file_tree', delay before displaying it.
		do
			if delay_to_make_keyboard_navigation_practical = Void then
				create delay_to_make_keyboard_navigation_practical

				delay_to_make_keyboard_navigation_practical.actions.extend (agent
					do
						delay_to_make_keyboard_navigation_practical.set_interval (0)

						if attached gui_tree.selected_item then
							if attached {ARCH_CAT_ITEM} gui_tree.selected_item.data as aci then
								if attached current_arch_cat as dir then
									dir.set_selected_item (aci)
								end

								if attached {ARCH_CAT_ARCHETYPE} aci then
									gui.parse_archetype
								else
									gui.display_class
								end
							end
						end
					end)
			end

			delay_to_make_keyboard_navigation_practical.set_interval (300)
		end

	populate
			-- Populate `gui_file_tree' from `archetype_directory'.
		do
			-- update tree
			create gui_node_descriptor_map.make(0)
			gui_tree.wipe_out
 			create gui_tree_item_stack.make (0)

 			if has_current_profile then
	 			current_arch_cat.do_all (agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
				gui_tree.recursive_do_all (agent ev_tree_expand)
				gui.go_to_selected_archetype
 			end
		end

	update_tree_node_for_archetype (aca: attached ARCH_CAT_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		local
			an_id: STRING
		do
			an_id := aca.id.as_string
			if gui_node_descriptor_map.has (an_id) then
				update_tree_node (gui_node_descriptor_map.item (aca.ontological_name))
			elseif attached aca.old_id then
				if gui_node_descriptor_map.has (aca.old_id.as_string) then
					gui_node_descriptor_map.replace_key (aca.ontological_name, aca.old_id.as_string)
					update_tree_node (gui_node_descriptor_map.item (aca.ontological_name))
				end
			end
		end

	select_item (ari_ont_id: attached STRING)
			-- ensure node with ontological node id `ari_ont_id' is visible in the tree
		do
			if gui_node_descriptor_map.has (ari_ont_id) and gui_tree.is_displayed then
				gui_tree.ensure_item_visible (gui_node_descriptor_map.item (ari_ont_id))
				gui_node_descriptor_map.item (ari_ont_id).enable_select
			end
		end

	ensure_item_visible (ari_ont_id: attached STRING)
			-- ensure node with ontological node id `ari_ont_id' is visible in the tree
		do
			if gui_node_descriptor_map.has(ari_ont_id) and gui_tree.is_displayed then
				gui_tree.ensure_item_visible (gui_node_descriptor_map.item (ari_ont_id))
			end
		end

feature {NONE} -- Implementation

	gui_node_descriptor_map: HASH_TABLE [EV_TREE_ITEM, STRING]
			-- list of GUI explorer nodes, keyed by artefact id

	artefact_types: attached ARRAY [INTEGER]
			-- types of artefact in this view

	explorer_label: EV_LABEL
			-- label of explorer control in GUI

	gui: attached MAIN_WINDOW
			-- Main window of system.

	gui_tree: attached EV_TREE
			-- reference to MAIN_WINDOW.archetype_file_tree

	gui_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]
			-- Stack used during `populate_gui_tree_node_enter'.

	delay_to_make_keyboard_navigation_practical: EV_TIMEOUT
			-- Timer to delay a moment before calling `display_details_of_selected_item'.

   	populate_gui_tree_node_enter (aci: attached ARCH_CAT_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
   		local
			node: EV_TREE_ITEM
		do
			if not aci.is_root and (aci.sub_tree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
								(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has(aca.artefact_type))) then
				create node
	 			node.set_data (aci)

	 			if attached {ARCH_CAT_ARCHETYPE} aci as aca then
	 				gui_node_descriptor_map.put (node, aca.ontological_name)
		 			node.set_pebble_function (agent pebble_function)
					node.set_configurable_target_menu_handler (agent context_menu_handler)
					node.set_configurable_target_menu_mode
	 			end

	 			update_tree_node (node)

				if gui_tree_item_stack.is_empty then
					gui_tree.extend (node)
				else
					gui_tree_item_stack.item.extend (node)
				end

				gui_tree_item_stack.extend (node)

			end
		end

   	populate_gui_tree_node_exit (aci: attached ARCH_CAT_ITEM)
   		do
			if not aci.is_root and (aci.sub_tree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
				(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type)))
			then
				gui_tree_item_stack.remove
			end
		end

   	update_tree_node (node: attached EV_TREE_NODE)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
   		local
			text, tooltip: STRING_32
			pixmap: EV_PIXMAP
		do
			if attached {ARCH_CAT_ITEM} node.data as aci then
				text := utf8 (aci.display_name)

				if attached {ARCH_CAT_ARCHETYPE} aci as aca then
					tooltip := utf8 (aca.full_path)
					if aca.has_legacy_flat_file and display_archetype_source then
						text.prepend (utf8("(lf) "))
					end

					if aca.has_slots then
						text.append_code (Right_arrow_char)	-- Unicode character: an arrow pointing right
					end

					if not aca.errors.is_empty then
						tooltip.append (utf8 ("%N%N" + aca.errors.as_string))
					end
	 				node.set_tooltip (tooltip)
	 			else -- it is a model node
	 				text.append (utf8(" (" + aci.sub_tree_artefact_count (artefact_types).out + ")"))
				end

				node.set_text (text)
				pixmap := pixmaps [aci.group_name]
				if pixmap /= Void then
					node.set_pixmap (pixmap)
				end
			end
		end

	ev_tree_expand (node: EV_TREE_NODE)
			--
		do
	 		if attached {ARCH_CAT_MODEL_NODE} node.data as arf then
	 			if (arf.is_abstract_class or arf.is_package) and node.is_expandable then
					node.expand
	 			end
	 		end
		end

	context_menu_handler (a_menu: EV_MENU; a_target_list: ARRAYED_LIST [EV_PND_TARGET_DATA]; a_source: EV_PICK_AND_DROPABLE; a_pebble: ANY)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		do
			if attached {EV_TREE_ITEM} a_source as eti and then attached {ARCH_CAT_ARCHETYPE} eti.data as aca then
				create_context_menu (a_menu, aca.ontological_name, a_pebble)
			end
		end

--	context_menu_agent: PROCEDURE [ANY, TUPLE [EV_MENU]]
--			-- Procedure that sets up a context menu

	create_context_menu (menu: EV_MENU; arch_id: STRING; a_pebble: ANY)
			-- dynamically initializes the context menu for this tree
		local
			parse_mi, edit_source_mi, new_tool_mi: EV_MENU_ITEM
		do
			create parse_mi.make_with_text_and_action ("Parse", agent gui.parse_archetype)
			parse_mi.set_pixmap (pixmaps ["parse"])
	    	menu.extend (parse_mi)

			create edit_source_mi.make_with_text_and_action ("Edit source", agent gui.edit_archetype)
			edit_source_mi.set_pixmap (pixmaps ["edit"])
			menu.extend (edit_source_mi)

			create new_tool_mi.make_with_text_and_action ("New tool", agent gui.create_and_populate_new_archetype_tool)
			new_tool_mi.set_pixmap (pixmaps ["archetype_2"])
			menu.extend (new_tool_mi)
		end

	pebble_function (a_x, a_y: INTEGER): ANY
			-- Pebble function for pebble source
		do
			Result := "pebble"
		end

	on_pointer_button (a_x: INTEGER; a_y: INTEGER; a_button: INTEGER; a_x_tilt: DOUBLE; a_y_tilt: DOUBLE; a_pressure: DOUBLE; a_screen_x: INTEGER; a_screen_y: INTEGER)
		do

		end


invariant
	valid_artefact_types: (create {ARTEFACT_TYPE}).valid_artefact_types(artefact_types)

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
