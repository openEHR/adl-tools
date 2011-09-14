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

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Right_arrow_char: NATURAL_32 = 0x279C

feature {NONE} -- Initialisation

	make (a_select_archetype_agent, an_edit_archetype_agent, a_select_archetype_in_new_tool_agent: like select_archetype_agent
			a_select_class_agent, a_select_class_in_new_tool_agent: like select_class_agent)
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		do
			select_archetype_agent := a_select_archetype_agent
			edit_archetype_agent := an_edit_archetype_agent
			select_archetype_in_new_tool_agent := a_select_archetype_in_new_tool_agent
			select_class_agent := a_select_class_agent
			select_class_in_new_tool_agent := a_select_class_in_new_tool_agent

			-- make UI
			make_ui
  			ev_root_container.set_minimum_height (200)

			artefact_types := <<{ARTEFACT_TYPE}.archetype, {ARTEFACT_TYPE}.template_component, {ARTEFACT_TYPE}.template>>
		end

feature -- Commands

	update_tree_node_for_archetype (aca: attached ARCH_CAT_ARCHETYPE)
			-- update Catalogue tree node with changes in compilation status
		local
			an_id: STRING
		do
			an_id := aca.id.as_string
			if ev_node_descriptor_map.has (an_id) then
				update_tree_node (ev_node_descriptor_map.item (aca.ontological_name))
			elseif attached aca.old_id then
				if ev_node_descriptor_map.has (aca.old_id.as_string) then
					ev_node_descriptor_map.replace_key (aca.ontological_name, aca.old_id.as_string)
					update_tree_node (ev_node_descriptor_map.item (aca.ontological_name))
				end
			end
		end

	select_item (ari_ont_id: attached STRING)
			-- ensure node with ontological node id `ari_ont_id' is visible in the tree
		do
			if ev_node_descriptor_map.has (ari_ont_id) and ev_root_container.is_displayed then
				ev_root_container.ensure_item_visible (ev_node_descriptor_map.item (ari_ont_id))
				ev_node_descriptor_map.item (ari_ont_id).enable_select
			end
		end

	ensure_item_visible (ari_ont_id: attached STRING)
			-- ensure node with ontological node id `ari_ont_id' is visible in the tree
		do
			if ev_node_descriptor_map.has(ari_ont_id) and ev_root_container.is_displayed then
				ev_root_container.ensure_item_visible (ev_node_descriptor_map.item (ari_ont_id))
			end
		end

feature {NONE} -- Implementation

	select_class_agent, select_class_in_new_tool_agent: PROCEDURE [ANY, TUPLE [BMM_CLASS_DEFINITION]]

	populate_tree
		do
	 		current_arch_cat.do_all (agent ev_tree_node_populate_enter, agent ev_tree_node_populate_exit)
			ev_root_container.recursive_do_all (agent ev_tree_expand)
		end

   	ev_tree_node_populate_enter (aci: attached ARCH_CAT_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
   		local
			ev_node: EV_TREE_ITEM
		do
			if not aci.is_root and (aci.sub_tree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
								(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has(aca.artefact_type))) then
				create ev_node
	 			ev_node.set_data (aci)

 				ev_node_descriptor_map.put (ev_node, aci.ontological_name)

	 			update_tree_node (ev_node)

				-- select / menu handling					
				if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
		 			ev_node.pointer_button_press_actions.force_extend (agent archetype_node_handler (ev_node, ?, ?, ?))
		 			ev_node.select_actions.force_extend (agent select_archetype_with_delay (aca))

	 			elseif attached {ARCH_CAT_MODEL_NODE} aci as acmn and then acmn.is_class then -- it is a model node
		 			ev_node.pointer_button_press_actions.force_extend (agent class_node_handler (ev_node, ?, ?, ?))
		 			ev_node.select_actions.force_extend (agent select_class_with_delay (acmn))
				end

				if ev_tree_item_stack.is_empty then
					ev_root_container.extend (ev_node)
				else
					ev_tree_item_stack.item.extend (ev_node)
				end

				ev_tree_item_stack.extend (ev_node)
			end
		end

   	ev_tree_node_populate_exit (aci: attached ARCH_CAT_ITEM)
   		do
			if not aci.is_root and (aci.sub_tree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
				(attached {ARCH_CAT_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type)))
			then
				ev_tree_item_stack.remove
			end
		end

   	update_tree_node (ev_node: attached EV_TREE_ITEM)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
   		local
			text, tooltip: STRING_32
			pixmap: EV_PIXMAP
		do
			if attached {ARCH_CAT_ITEM} ev_node.data as aci then
				text := utf8 (aci.display_name)

				if attached {ARCH_CAT_ARCHETYPE} aci as aca then -- archetype / template node
					-- text
					if aca.has_legacy_flat_file and display_archetype_source then
						text.prepend (utf8("(lf) "))
					end
					if aca.has_slots then
						text.append_code (Right_arrow_char)	-- Unicode character: an arrow pointing right
					end

					-- tooltip
					tooltip := utf8 (aca.full_path)
					if aca.has_legacy_flat_file and aca.differential_generated then
						tooltip.append ("%N(source = legacy flat)")
					end
					if not aca.errors.is_empty then
						tooltip.append (utf8 ("%N%N" + aca.errors.as_string))
					end
	 				ev_node.set_tooltip (tooltip)

					-- pixmap
					pixmap := pixmaps [aci.group_name]

	 			elseif attached {ARCH_CAT_MODEL_NODE} aci as acmn then -- it is a model node
	 				-- text
	 				text.append (utf8(" (" + acmn.sub_tree_artefact_count (artefact_types).out + ")"))

					-- pixmap
					if acmn.is_class then
						pixmap := object_node_pixmap (acmn)
					else
						pixmap := pixmaps [aci.group_name]
					end

				end

				-- set text
				ev_node.set_text (text)
				if attached pixmap then
					ev_node.set_pixmap (pixmap)
				end
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
						current_arch_cat.set_selected_item (selected_class_node)
						select_class_agent.call ([selected_class_node.class_definition])
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
						current_arch_cat.set_selected_item (selected_archetype_node)
						select_archetype_agent.call ([])
					end
			)
		end

	ev_tree_expand (node: EV_TREE_NODE)
			--
		do
	 		if attached {ARCH_CAT_MODEL_NODE} node.data as arf then
	 			if (arf.is_abstract_class or arf.is_model_group) and node.is_expandable then
					node.expand
	 			end
	 		end
		end

	class_node_handler (ev_ti: EV_TREE_ITEM; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {ARCH_CAT_MODEL_NODE} ev_ti.data as acmn then
				create menu
				create an_mi.make_with_text_and_action ("Display", agent display_context_selected_class_in_active_tool (ev_ti))
				an_mi.set_pixmap (pixmaps ["class_tool"])
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action ("Display in new tab", agent display_context_selected_class_in_new_tool (ev_ti))
				an_mi.set_pixmap (pixmaps ["class_tool_new"])
				menu.extend (an_mi)

				menu.show
			end
		end

	display_context_selected_class_in_active_tool (ev_ti: EV_TREE_ITEM)
		do
			if not ev_ti.is_selected then
				ev_ti.enable_select
			end
			if attached {ARCH_CAT_MODEL_NODE} ev_ti.data as acmn then
				current_arch_cat.set_selected_item (acmn)
				select_class_agent.call ([current_arch_cat.selected_class.class_definition])
			end
		end

	display_context_selected_class_in_new_tool (ev_ti: EV_TREE_ITEM)
		do
			if not ev_ti.is_selected then
				ev_ti.enable_select
			end
			if attached {ARCH_CAT_MODEL_NODE} ev_ti.data as acmn then
				current_arch_cat.set_selected_item (acmn)
				select_class_in_new_tool_agent.call ([current_arch_cat.selected_class.class_definition])
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
