note
	component:   "openEHR Archetype Project"
	description: "Populate ontology controls in ADL editor"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class GUI_VIEW_ARCHETYPE_TREE_CONTROL

inherit
	GUI_ARTEFACT_TREE_CONTROL
		rename
			make as make_tree_control
		redefine
			on_rotate_view
		end

	BMM_DEFINITIONS
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

	Right_arrow_char_utf8: STRING
		once
			create Result.make_empty
			Result.append_character ('%/0xe2/')
			Result.append_character ('%/0x9e/')
			Result.append_character ('%/0x9c/')
		end

feature {NONE} -- Initialisation

	make (an_edit_archetype_agent: like edit_archetype_agent; a_save_archetype_agent: like save_archetype_agent)
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		do
			artefact_types := <<{ARTEFACT_TYPE}.archetype, {ARTEFACT_TYPE}.template_overlay, {ARTEFACT_TYPE}.template>>
			make_tree_control (an_edit_archetype_agent, a_save_archetype_agent)
		end

feature -- Commands

	update_tree_node_for_archetype (aca: attached ARCH_CAT_ARCHETYPE)
			-- update Catalogue tree node with changes in compilation status
		do
			-- update semantic grid
			if semantic_grid_row_map.has (aca.qualified_name) then
				semantic_grid_update_row (semantic_grid_row_map.item (aca.qualified_name), True)
			elseif attached aca.old_id then
				if semantic_grid_row_map.has (aca.old_id.as_string) then
					semantic_grid_row_map.replace_key (aca.qualified_name, aca.old_id.as_string)
					semantic_grid_update_row (semantic_grid_row_map.item (aca.qualified_name), True)
				end
			end

			-- update filesys grid
			if filesys_grid_row_map.has (aca.qualified_name) then
				filesys_grid_update_row (filesys_grid_row_map.item (aca.qualified_name), True)
			elseif attached aca.old_id then
				if filesys_grid_row_map.has (aca.old_id.as_string) then
					filesys_grid_row_map.replace_key (aca.qualified_name, aca.old_id.as_string)
					filesys_grid_update_row (filesys_grid_row_map.item (aca.qualified_name), True)
				end
			end
		end

	select_item_in_tree (ari_global_id: attached STRING)
			-- ensure node with global node id `ari_global_id' is visible in the tree
		local
			grid_row: detachable EV_GRID_ROW
		do
			if semantic_grid_row_map.has (ari_global_id) then
				grid_row := semantic_grid_row_map.item (ari_global_id)
				gui_semantic_grid.ev_grid.ensure_visible (grid_row)
				select_grid_row (grid_row, ari_global_id)
			end
			if filesys_grid_row_map.has (ari_global_id) then
				grid_row := filesys_grid_row_map.item (ari_global_id)
				gui_filesys_grid.ev_grid.ensure_visible (grid_row)
				select_grid_row (grid_row, ari_global_id)
			end
		end

feature -- Events

	on_rotate_view
		do
			if gui_semantic_grid.ev_grid.is_displayed then
				gui_semantic_grid.ev_grid.hide
				gui_filesys_grid.ev_grid.show
			else
				gui_filesys_grid.ev_grid.hide
				gui_semantic_grid.ev_grid.show
			end
		end

feature {NONE} -- Implementation

	do_populate
		do
			-- populate semantic grid by default
	 		source.do_all_semantic (agent ev_semantic_grid_populate_enter, agent ev_semantic_grid_populate_exit)
			gui_semantic_grid.ev_grid.expand_all (agent ev_semantic_tree_expand)
			gui_semantic_grid.resize_columns_to_content

			-- populate filesys grid on demand
	 		source.do_all_filesys (agent ev_filesys_grid_populate_enter, agent ev_filesys_grid_populate_exit)
			gui_filesys_grid.ev_grid.expand_all (agent ev_filesys_tree_expand)
			gui_filesys_grid.resize_columns_to_content
		end

   	ev_semantic_grid_populate_enter (aci: attached ARCH_CAT_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		do
			if not aci.is_root and (aci.subtree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
								(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type))) then
				-- add row to grid
				if ev_tree_item_stack.is_empty then
					gui_semantic_grid.add_row (aci)
				else
					gui_semantic_grid.add_sub_row (ev_tree_item_stack.item, aci)
				end
				ev_tree_item_stack.extend (gui_semantic_grid.last_row)
 				semantic_grid_row_map.put (gui_semantic_grid.last_row, aci.global_artefact_identifier)

 				-- update contents
	 			semantic_grid_update_row (gui_semantic_grid.last_row, False)

				-- select / menu handling
				if attached {EV_GRID_LABEL_ITEM} gui_semantic_grid.last_row.item (1) as gli then
					if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
			 			gli.pointer_button_press_actions.force_extend (agent archetype_node_handler (gui_semantic_grid.last_row, ?, ?, ?))
			 			gli.select_actions.force_extend (agent select_archetype_with_delay (aca))

		 			elseif attached {ARCH_CAT_CLASS_NODE} aci as acc then
			 			gli.pointer_button_press_actions.force_extend (agent class_node_handler (gui_semantic_grid.last_row, ?, ?, ?))
			 			gli.select_actions.force_extend (agent select_class_with_delay (acc))
					end
					gli.pointer_button_press_actions.force_extend (agent do gui_agents.history_set_active_agent.call ([ultimate_parent_tool]) end)
				end
			end
		end

   	ev_semantic_grid_populate_exit (aci: ARCH_CAT_ITEM)
   		do
			if not aci.is_root and (aci.subtree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
				(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type)))
			then
				ev_tree_item_stack.remove
			end
		end

   	semantic_grid_update_row (ev_row: EV_GRID_ROW; update_flag: BOOLEAN)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
   		local
			text, tooltip: STRING
			pixmap: EV_PIXMAP
			col: EV_COLOR
		do
			if attached {ARCH_CAT_ITEM} ev_row.data as aci then
				create text.make_empty
				create tooltip.make_empty

				if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
					-- text
					if aca.has_legacy_flat_file and display_archetype_source then
						text.append ("(lf) ")
					end
					if aca.is_reference_archetype then
						text.append (aci.name.as_upper)
					else
						text.append (aca.name)
					end
					if aca.has_slots then
						text.append (Right_arrow_char_utf8)
					end

					-- tooltip
					tooltip.append (aca.full_path)
					if aca.has_legacy_flat_file and aca.differential_generated then
						tooltip.append ("%N" + get_text ("archetype_tree_node_tooltip"))
					end

					-- pixmap
					pixmap := get_icon_pixmap ("archetype/" + aca.group_name)

					if aca.is_reference_archetype then
						col := archetype_rm_type_color
					end

	 			elseif attached {ARCH_CAT_CLASS_NODE} aci as acc then
					pixmap := catalogue_node_pixmap (acc)
		 	 		tooltip.append (acc.qualified_name + "%N" + acc.class_definition.description)
					text.append (aci.name)
					col := archetype_rm_type_color
	 				text.append (" (" + acc.subtree_artefact_count (artefact_types).out + ")")

	 			elseif attached {ARCH_CAT_CLOSURE_NODE} aci as accl then
	 				text.append (accl.qualified_name)
					pixmap := get_icon_pixmap ("archetype/" + aci.group_name)
					tooltip.append (get_msg ("rm_closure_tree_node_tooltip", <<accl.qualified_name, accl.bmm_schema.schema_id>>))
	 				text.append (" (" + accl.subtree_artefact_count (artefact_types).out + ")")

				end

				-- set text
				if update_flag then
					gui_semantic_grid.set_last_row (ev_row)
					gui_semantic_grid.update_last_row_label_col (1, text, tooltip, col, pixmap)
				else
					gui_semantic_grid.set_last_row_label_col (1, text, tooltip, col, pixmap)
				end
			end
		end

   	ev_filesys_grid_populate_enter (aci: attached ARCH_CAT_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		do
			if not aci.is_root then
				-- add row to grid
				if ev_tree_item_stack.is_empty then
					gui_filesys_grid.add_row (aci)
				else
					gui_filesys_grid.add_sub_row (ev_tree_item_stack.item, aci)
				end
				ev_tree_item_stack.extend (gui_filesys_grid.last_row)
 				filesys_grid_row_map.put (gui_filesys_grid.last_row, aci.global_artefact_identifier)

 				-- update contents
	 			filesys_grid_update_row (gui_filesys_grid.last_row, False)

				-- select / menu handling
				if attached {EV_GRID_LABEL_ITEM} gui_filesys_grid.last_row.item (1) as gli then
					if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
			 			gli.pointer_button_press_actions.force_extend (agent archetype_node_handler (gui_filesys_grid.last_row, ?, ?, ?))
			 			gli.select_actions.force_extend (agent select_archetype_with_delay (aca))
					end
					gli.pointer_button_press_actions.force_extend (agent do gui_agents.history_set_active_agent.call ([ultimate_parent_tool]) end)
				end
			end
		end

   	ev_filesys_grid_populate_exit (aci: ARCH_CAT_ITEM)
   		do
			if not aci.is_root then
				ev_tree_item_stack.remove
			end
		end

   	filesys_grid_update_row (ev_row: EV_GRID_ROW; update_flag: BOOLEAN)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
   		local
			text, tooltip: STRING
			pixmap: EV_PIXMAP
			col: EV_COLOR
		do
			if attached {ARCH_CAT_ITEM} ev_row.data as aci then
				create text.make_empty
				create tooltip.make_empty

				if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
					-- text
					if aca.has_legacy_flat_file and display_archetype_source then
						text.append ("(lf) ")
					end
					if aca.is_reference_archetype then
						text.append (aci.name.as_upper)
					else
						text.append (aca.name)
					end
					if aca.has_slots then
						text.append (Right_arrow_char_utf8)
					end

					-- tooltip
					tooltip.append (aca.full_path)
					if aca.has_legacy_flat_file and aca.differential_generated then
						tooltip.append ("%N" + get_text ("archetype_tree_node_tooltip"))
					end

					-- pixmap
					pixmap := get_icon_pixmap ("archetype/" + aca.group_name)

					if aca.is_reference_archetype then
						col := archetype_rm_type_color
					end

	 			elseif attached {ARCH_CAT_FILESYS_NODE} aci as acfsn then
	 				text.append (acfsn.name)
					pixmap := get_icon_pixmap ("archetype/" + aci.group_name)
	 				text.append (" (" + acfsn.subtree_artefact_count (artefact_types).out + ")")

				end

				-- set text
				if update_flag then
					gui_filesys_grid.set_last_row (ev_row)
					gui_filesys_grid.update_last_row_label_col (1, text, tooltip, col, pixmap)
				else
					gui_filesys_grid.set_last_row_label_col (1, text, tooltip, col, pixmap)
				end
			end
		end

	selected_class_node: ARCH_CAT_CLASS_NODE

	select_class_with_delay (acc: attached ARCH_CAT_CLASS_NODE)
		do
			selected_class_node := acc
			delayed_select_class_agent.set_interval (300)
		end

	delayed_select_class_agent: EV_TIMEOUT
			-- Timer to delay a moment before calling `select_class_agent'.
		once
			create Result
			Result.actions.extend (
				agent
					do
						delayed_select_class_agent.set_interval (0)
						selection_history.set_selected_item (selected_class_node)
						gui_agents.select_class_agent.call ([selected_class_node.class_definition])
					end
			)
		end

	select_archetype_with_delay (aca: ARCH_CAT_ARCHETYPE)
		do
			selected_archetype_node := aca
			delayed_select_archetype_agent.set_interval (300)
		end

	delayed_select_archetype_agent: EV_TIMEOUT
			-- Timer to delay a moment before calling `select_archetype_agent'.
		once
			create Result
			Result.actions.extend (
				agent
					do
						delayed_select_archetype_agent.set_interval (0)
						selection_history.set_selected_item (selected_archetype_node)
						gui_agents.select_archetype_agent.call ([selected_archetype_node])
					end
			)
		end

	ev_semantic_tree_expand (ev_grid_row: EV_GRID_ROW): BOOLEAN
		do
			Result := (attached {ARCH_CAT_CLASS_NODE} ev_grid_row.data as acc and then acc.class_definition.is_abstract or
				attached {ARCH_CAT_CLOSURE_NODE} ev_grid_row.data) and
	 			ev_grid_row.is_expandable
		end

	ev_filesys_tree_expand (ev_grid_row: EV_GRID_ROW): BOOLEAN
		do
			Result := attached {ARCH_CAT_FILESYS_NODE} ev_grid_row.data as acfs and then
				not acfs.has_children_of_type (<<{ARTEFACT_TYPE}.archetype, {ARTEFACT_TYPE}.template>>) and
				ev_grid_row.is_expandable
		end

	class_node_handler (ev_grid_row: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {ARCH_CAT_CLASS_NODE} ev_grid_row.data then
				create menu
				create an_mi.make_with_text_and_action (get_msg ("display_in_active_tab", Void), agent display_context_selected_class_in_active_tool (ev_grid_row))
				an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool"))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_msg ("display_in_new_tab", Void), agent display_context_selected_class_in_new_tool (ev_grid_row))
				an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_msg ("show_class_in_rm", Void), agent display_context_selected_class_in_rm_schema_tool (ev_grid_row))
				an_mi.set_pixmap (get_icon_pixmap ("tool/rm_schema"))
				menu.extend (an_mi)

				menu.show
			end
		end

	display_context_selected_class_in_active_tool (ev_grid_row: EV_GRID_ROW)
		do
			ev_grid_row.enable_select
			if attached {ARCH_CAT_CLASS_NODE} ev_grid_row.data as acc then
				gui_agents.select_class_agent.call ([acc.class_definition])
			end
		end

	display_context_selected_class_in_new_tool (ev_grid_row: EV_GRID_ROW)
		do
			ev_grid_row.enable_select
			if attached {ARCH_CAT_CLASS_NODE} ev_grid_row.data as acc then
				gui_agents.select_class_in_new_tool_agent.call ([acc.class_definition])
			end
		end

	display_context_selected_class_in_rm_schema_tool (ev_grid_row: EV_GRID_ROW)
		do
			ev_grid_row.enable_select
			if attached {ARCH_CAT_CLASS_NODE} ev_grid_row.data as acc then
				gui_agents.select_class_in_rm_schema_tool_agent.call ([acc.class_definition.globally_qualified_path])
			end
		end

	select_grid_row (a_grid_row: EV_GRID_ROW; ari_global_id: STRING)
			-- if an archetype tool already exists with this id, then cause it to be shown
			-- and then select corresponding tree node, but with events off. If no
			-- archetype tool available, treat as if it were a first time request for this archetype
			-- and do a normal tree node select
		do
			if attached a_grid_row then
				if gui_agents.show_tool_with_artefact_agent.item ([ari_global_id]) then
					a_grid_row.select_actions.block
					a_grid_row.enable_select
					a_grid_row.select_actions.resume
				else
					a_grid_row.enable_select
				end
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
