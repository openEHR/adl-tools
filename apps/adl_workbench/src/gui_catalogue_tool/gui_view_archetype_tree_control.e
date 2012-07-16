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
	GUI_ARTEFACT_TREE_CONTROL
		rename
			make as make_tree_control
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
			if ev_node_descriptor_map.has (aca.qualified_name) then
				update_tree_node (ev_node_descriptor_map.item (aca.qualified_name))
			elseif attached aca.old_id then
				if ev_node_descriptor_map.has (aca.old_id.as_string) then
					ev_node_descriptor_map.replace_key (aca.qualified_name, aca.old_id.as_string)
					update_tree_node (ev_node_descriptor_map.item (aca.qualified_name))
				end
			end
		end

	select_item_in_tree (ari_global_id: attached STRING)
			-- ensure node with global node id `ari_global_id' is visible in the tree
		do
			if ev_node_descriptor_map.has (ari_global_id) and gui_grid.ev_grid.is_displayed then
				ev_node_descriptor_map.item (ari_global_id).ensure_visible

				-- if a class tool already exists with this id, then cause it to be shown
				-- and then select corresponding tree node, but with events off. If no
				-- class tool available, treat as if it were a first tme request for this class
				-- and do a normal tree node select
				if gui_agents.show_tool_with_artefact_agent.item ([ari_global_id]) then
					ev_node_descriptor_map.item (ari_global_id).select_actions.block
					ev_node_descriptor_map.item (ari_global_id).enable_select
					ev_node_descriptor_map.item (ari_global_id).select_actions.resume
				else
					ev_node_descriptor_map.item (ari_global_id).enable_select
				end
			end
		end

	ensure_item_visible (ari_global_id: attached STRING)
			-- ensure node with ontological node id `ari_global_id' is visible in the tree
		do
			if ev_node_descriptor_map.has (ari_global_id) and gui_grid.ev_grid.is_displayed then
				ev_node_descriptor_map.item (ari_global_id).ensure_visible
			end
		end

feature {NONE} -- Implementation

	do_populate
		do
	 		source.do_all (agent ev_tree_node_populate_enter, agent ev_tree_node_populate_exit)
			gui_grid.ev_grid.expand_all (agent ev_tree_expand)
			gui_grid.resize_columns_to_content
		end

   	ev_tree_node_populate_enter (aci: attached ARCH_CAT_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		do
			if not aci.is_root and (aci.subtree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
								(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type))) then
				-- add row to grid
				if ev_tree_item_stack.is_empty then
					gui_grid.add_row (aci)
				else
					gui_grid.add_sub_row (ev_tree_item_stack.item, aci)
				end
				ev_tree_item_stack.extend (gui_grid.last_row)
 				ev_node_descriptor_map.put (gui_grid.last_row, aci.global_artefact_identifier)

 				-- update contents
	 			update_tree_node (gui_grid.last_row)

				-- select / menu handling
				if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (1) as gli then
					if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
			 			gli.pointer_button_press_actions.force_extend (agent archetype_node_handler (gui_grid.last_row, ?, ?, ?))
			 			gli.select_actions.force_extend (agent select_archetype_with_delay (aca))

		 			elseif attached {ARCH_CAT_MODEL_NODE} aci as acmn and then acmn.is_class then -- it is a model node
			 			gli.pointer_button_press_actions.force_extend (agent class_node_handler (gui_grid.last_row, ?, ?, ?))
			 			gli.select_actions.force_extend (agent select_class_with_delay (acmn))
					end
					gli.pointer_button_press_actions.force_extend (agent do gui_agents.history_set_active_agent.call ([ultimate_parent_tool]) end)
				end
			end
		end

   	ev_tree_node_populate_exit (aci: ARCH_CAT_ITEM)
   		do
			if not aci.is_root and (aci.subtree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
				(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type)))
			then
				ev_tree_item_stack.remove
			end
		end

   	update_tree_node (ev_row: EV_GRID_ROW)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
   		local
			text, tooltip: STRING
			pixmap: EV_PIXMAP
			col: EV_COLOR
		do
			if attached {ARCH_CAT_ITEM} ev_row.data as aci then
				create text.make_empty

				if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
					-- text
					if aca.has_legacy_flat_file and display_archetype_source then
						text.append ("(lf) ")
					end
					text.append (aci.name)
					if aca.has_slots then
						text.append (Right_arrow_char_utf8)
					end

					-- tooltip		
					tooltip := aca.full_path.twin
					if aca.has_legacy_flat_file and aca.differential_generated then
						tooltip.append ("%N" + get_text ("archetype_tree_node_tooltip"))
					end

					-- pixmap
					pixmap := get_icon_pixmap ("archetype/" + aca.group_name)

					if aca.is_reference_archetype then
						col := archetype_rm_type_color
					end

	 			elseif attached {ARCH_CAT_MODEL_NODE} aci as acmn then -- it is a model node
					if acmn.is_class then
						pixmap := catalogue_node_pixmap (acmn)
			 	 		tooltip := acmn.qualified_name + "%N" + acmn.class_definition.description
						text.append (aci.name)
						col := archetype_rm_type_color
					else
		 				text.append (acmn.qualified_name)
						pixmap := get_icon_pixmap ("archetype/" + aci.group_name)
						tooltip := get_msg ("rm_closure_tree_node_tooltip", <<acmn.qualified_name, acmn.bmm_schema.schema_id>>)
					end
	 				text.append (" (" + acmn.subtree_artefact_count (artefact_types).out + ")")

				end

				-- set text
				gui_grid.set_last_row (ev_row)
				gui_grid.set_last_row_label_col (1, text, tooltip, col, pixmap)
			end
		end

	selected_class_node: ARCH_CAT_MODEL_NODE

	select_class_with_delay (acmn: attached ARCH_CAT_MODEL_NODE)
		do
			selected_class_node := acmn
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

	ev_tree_expand (ev_grid_row: EV_GRID_ROW): BOOLEAN
		do
			if attached {ARCH_CAT_MODEL_NODE} ev_grid_row.data as acmn then
	 			Result := (acmn.is_abstract_class or acmn.is_rm_closure) and ev_grid_row.is_expandable
	 		end
		end

	class_node_handler (ev_grid_row: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {ARCH_CAT_MODEL_NODE} ev_grid_row.data as acmn then
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
			if attached {ARCH_CAT_MODEL_NODE} ev_grid_row.data as acmn then
				gui_agents.select_class_agent.call ([acmn.class_definition])
			end
		end

	display_context_selected_class_in_new_tool (ev_grid_row: EV_GRID_ROW)
		do
			ev_grid_row.enable_select
			if attached {ARCH_CAT_MODEL_NODE} ev_grid_row.data as acmn then
				gui_agents.select_class_in_new_tool_agent.call ([acmn.class_definition])
			end
		end

	display_context_selected_class_in_rm_schema_tool (ev_grid_row: EV_GRID_ROW)
		do
			ev_grid_row.enable_select
			if attached {ARCH_CAT_MODEL_NODE} ev_grid_row.data as acmn then
				gui_agents.select_class_in_rm_schema_tool_agent.call ([acmn.class_definition.globally_qualified_path])
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
