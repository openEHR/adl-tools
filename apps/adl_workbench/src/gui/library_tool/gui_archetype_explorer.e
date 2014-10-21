note
	component:   "openEHR ADL Tools"
	description: "Populate ontology controls in ADL editor"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ARCHETYPE_EXPLORER

inherit
	GUI_ARTEFACT_EXPLORER
		rename
			make as make_tree_control
		redefine
			on_rotate_view, add_tool_specific_archetype_menu_items, grid_item_select_handler,
				grid_item_event_handler, repopulate, do_clear, do_select_archetype
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_LIBRARIES
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

	make
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		do
			artefact_types := <<{ARTEFACT_TYPE}.archetype, {ARTEFACT_TYPE}.template_overlay, {ARTEFACT_TYPE}.template>>
			make_tree_control
			tool_agents.set_archetype_explorer_select_in_tree_agent (agent select_item_in_tree)

			-- filesys EV_GRID
			create gui_filesys_grid.make (True, True, True, True)
			gui_filesys_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_root_container.extend (gui_filesys_grid.ev_grid)
  			gui_filesys_grid.ev_grid.set_minimum_width (100)
  			gui_filesys_grid.ev_grid.hide_header
  			gui_filesys_grid.ev_grid.hide

			-- set events
			gui_filesys_grid.ev_grid.pointer_button_press_item_actions.extend (agent grid_item_event_handler)
			gui_filesys_grid.ev_grid.item_select_actions.extend (agent grid_item_select_handler)
			gui_filesys_grid.ev_grid.disable_selection_on_click
			gui_filesys_grid.ev_grid.enable_selection_on_single_button_click

			clear

			ev_root_container.set_data (Current)
		end

feature -- Commands

	repopulate
			-- repopulate to update GUI settings
		do
			precursor

			if gui_filesys_grid.ev_grid.is_displayed then
				gui_filesys_grid.ev_grid.tree_do_all (agent filesys_grid_update_row (?, True))
				gui_filesys_grid.resize_columns_to_content
			end
		end

	update_tree_node_for_archetype (aca: ARCH_LIB_ARCHETYPE)
			-- update Library tree node with changes in compilation status
		do
			-- update semantic grid
			if semantic_grid_row_map.has (aca.qualified_name) and then attached semantic_grid_row_map.item (aca.qualified_name) as gr then
				semantic_grid_update_row (gr, True)
			elseif attached aca.old_id then
				if semantic_grid_row_map.has (aca.old_id.as_string) then
					semantic_grid_row_map.replace_key (aca.qualified_name, aca.old_id.as_string)
					if attached semantic_grid_row_map.item (aca.qualified_name) as gr then
						semantic_grid_update_row (gr, True)
					end
				end
			end

			-- update filesys grid
			if filesys_grid_row_map.has (aca.qualified_name) and then attached filesys_grid_row_map.item (aca.qualified_name) as gr then
				filesys_grid_update_row (gr, True)
			elseif attached aca.old_id then
				if filesys_grid_row_map.has (aca.old_id.as_string) then
					filesys_grid_row_map.replace_key (aca.qualified_name, aca.old_id.as_string)
					if attached filesys_grid_row_map.item (aca.qualified_name) as gr then
						filesys_grid_update_row (gr, True)
					end
				end
			end
		end

	select_item_in_tree (ari_global_id: STRING)
			-- ensure node with global node id `ari_global_id' is visible in the tree
		local
			grid_row: EV_GRID_ROW
		do
			if semantic_grid_row_map.has (ari_global_id) then
				check attached semantic_grid_row_map.item (ari_global_id) as gr then
					grid_row := gr
				end
				gui_semantic_grid.ev_grid.ensure_visible (grid_row)
				select_item_in_grid (grid_row, ari_global_id)
			end
			if filesys_grid_row_map.has (ari_global_id) then
				check attached filesys_grid_row_map.item (ari_global_id) as gr then
					grid_row := gr
				end
				gui_filesys_grid.ev_grid.ensure_visible (grid_row)
				select_item_in_grid (grid_row, ari_global_id)
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

	gui_filesys_grid: EVX_GRID
			-- grid control for view of archetypes based on file-system structure in profile

	filesys_grid_row_map: HASH_TABLE [EV_GRID_ROW, STRING]
			-- list of filesys EV_GRID rows, keyed by artefact id

	do_clear
		do
			precursor
			create filesys_grid_row_map.make(0)
			gui_filesys_grid.wipe_out
			selected_class_node := Void
 		end

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

   	ev_semantic_grid_populate_enter (aci: ARCH_LIB_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		do
			if not aci.is_root and (aci.subtree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
								(attached {ARCH_LIB_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type.value))) then
				-- add row to grid
				if ev_tree_item_stack.is_empty then
					gui_semantic_grid.add_row (aci)
				else
					gui_semantic_grid.add_sub_row (ev_tree_item_stack.item, aci)
				end
				check attached gui_semantic_grid.last_row as lr then
					ev_tree_item_stack.extend (lr)
	 				semantic_grid_row_map.put (lr, aci.global_artefact_identifier)

	 				-- update contents
		 			semantic_grid_update_row (lr, False)
				end
			end
		end

   	ev_semantic_grid_populate_exit (aci: ARCH_LIB_ITEM)
   		do
			if not aci.is_root and (aci.subtree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
				(attached {ARCH_LIB_ARCHETYPE} aci as aca and then artefact_types.has (aca.artefact_type.value)))
			then
				ev_tree_item_stack.remove
			end
		end

   	semantic_grid_update_row (ev_row: EV_GRID_ROW; update_flag: BOOLEAN)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
   		local
			text, tooltip: STRING
			pixmap: detachable EV_PIXMAP
			col: detachable EV_COLOR
		do
			if attached {ARCH_LIB_ITEM} ev_row.data as aci then
				create text.make_empty
				create tooltip.make_empty

				if attached {ARCH_LIB_ARCHETYPE} aci as aca then -- archetype / template node
					-- text
					if display_archetype_source and not aca.file_mgr.adl_version.is_equal (latest_adl_version) then
						text.append ("(" + aca.file_mgr.adl_version + ") ")
					end
					if aca.file_mgr.is_reference_archetype then
						text.append (aci.name.as_upper)
					else
						text.append (aca.semantic_id)
					end
					if aca.has_slots then
						text.append (Right_arrow_char_utf8)
					end

					-- tooltip
					tooltip.append (aca.source_file_path)
					if aca.file_mgr.has_legacy_flat_file and aca.file_mgr.is_source_generated then
						tooltip.append ("%N" + get_text (ec_archetype_tree_node_tooltip))
					end

					if aca.file_mgr.is_reference_archetype then
						col := archetype_rm_type_color
					end

	 			elseif attached {ARCH_LIB_CLASS_NODE} aci as acc then
		 	 		tooltip.append (acc.qualified_name + "%N" + acc.class_definition.description)
					text.append (aci.name)
					col := archetype_rm_type_color
	 				text.append (" (" + acc.subtree_artefact_count (artefact_types).out + ")")

	 			elseif attached {ARCH_LIB_CLOSURE_NODE} aci as accl then
	 				text.append (accl.qualified_name)
					tooltip.append (get_msg (ec_rm_closure_tree_node_tooltip, <<accl.qualified_name, accl.bmm_schema.schema_id>>))
	 				text.append (" (" + accl.subtree_artefact_count (artefact_types).out + ")")
				end

				-- pixmap
				pixmap := library_node_pixmap (aci)

				-- set text
				if update_flag then
					gui_semantic_grid.set_last_row (ev_row)
					gui_semantic_grid.update_last_row_label_col (1, text, tooltip, col, pixmap)
				else
					gui_semantic_grid.set_last_row_label_col (1, text, tooltip, col, pixmap)
				end
			end
		end

   	ev_filesys_grid_populate_enter (aci: ARCH_LIB_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		do
			if not aci.is_root then
				-- add row to grid
				if ev_tree_item_stack.is_empty then
					gui_filesys_grid.add_row (aci)
				else
					gui_filesys_grid.add_sub_row (ev_tree_item_stack.item, aci)
				end
				check attached gui_filesys_grid.last_row as lr then
					ev_tree_item_stack.extend (lr)
	 				filesys_grid_row_map.put (lr, aci.global_artefact_identifier)

	 				-- update contents
		 			filesys_grid_update_row (lr, False)
				end
			end
		end

   	ev_filesys_grid_populate_exit (aci: ARCH_LIB_ITEM)
   		do
			if not aci.is_root then
				ev_tree_item_stack.remove
			end
		end

   	filesys_grid_update_row (ev_row: EV_GRID_ROW; update_flag: BOOLEAN)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
   		local
			text, tooltip: STRING
			pixmap: detachable EV_PIXMAP
			col: detachable EV_COLOR
		do
			if attached {ARCH_LIB_ITEM} ev_row.data as aci then
				create text.make_empty
				create tooltip.make_empty

				if attached {ARCH_LIB_ARCHETYPE} aci as aca then -- archetype / template node
					-- text
					if display_archetype_source and not aca.file_mgr.adl_version.is_equal (latest_adl_version) then
						text.append ("(" + aca.file_mgr.adl_version + ") ")
					end
					if aca.file_mgr.is_reference_archetype then
						text.append (aci.name.as_upper)
					else
						text.append (aca.semantic_id)
					end
					if aca.has_slots then
						text.append (Right_arrow_char_utf8)
					end

					-- tooltip
					tooltip.append (aca.source_file_path)
					if aca.file_mgr.has_legacy_flat_file and aca.file_mgr.is_source_generated then
						tooltip.append ("%N" + get_text (ec_archetype_tree_node_tooltip))
					end

					-- pixmap
					pixmap := get_icon_pixmap ("archetype/" + aca.group_name)

					if aca.file_mgr.is_reference_archetype then
						col := archetype_rm_type_color
					end

	 			elseif attached {ARCH_LIB_FILESYS_NODE} aci as acfsn then
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

	selected_class_node: detachable ARCH_LIB_CLASS_NODE

	select_class_with_delay (acc: ARCH_LIB_CLASS_NODE)
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
						check attached selected_class_node as scn then
							selection_history.set_selected_item (scn)
							gui_agents.select_class_agent.call ([scn.class_definition])
						end
					end
			)
		end

	do_select_archetype
		local
			arch_id: STRING
			grid_row: EV_GRID_ROW
		do
			check attached selected_archetype_node as aca then
				selection_history.set_selected_item (aca)

				-- ensure selection is reflected in the grid not displayed
				arch_id := aca.global_artefact_identifier
				if gui_semantic_grid.ev_grid.is_displayed then
					if filesys_grid_row_map.has (arch_id) then
						check attached filesys_grid_row_map.item (arch_id) as gr then
							grid_row := gr
						end
						gui_filesys_grid.ev_grid.ensure_visible (grid_row)
						select_item_in_grid (grid_row, arch_id)
					end
				else
					if semantic_grid_row_map.has (arch_id) then
						check attached semantic_grid_row_map.item (arch_id) as gr then
							grid_row := gr
						end
						gui_semantic_grid.ev_grid.ensure_visible (grid_row)
						select_item_in_grid (grid_row, arch_id)
					end
				end

				gui_agents.select_archetype_agent.call ([aca])
			end
		end

	ev_semantic_tree_expand (ev_grid_row: EV_GRID_ROW): BOOLEAN
		do
			Result := (attached {ARCH_LIB_CLASS_NODE} ev_grid_row.data as acc and then acc.class_definition.is_abstract or
				attached {ARCH_LIB_CLOSURE_NODE} ev_grid_row.data) and
	 			ev_grid_row.is_expandable
		end

	ev_filesys_tree_expand (ev_grid_row: EV_GRID_ROW): BOOLEAN
		do
			Result := attached {ARCH_LIB_FILESYS_NODE} ev_grid_row.data as acfs and then
				acfs.has_matching_children (agent (aci: ARCH_LIB_ITEM): BOOLEAN do Result := attached {ARCH_LIB_FILESYS_NODE} aci end) and
				ev_grid_row.is_expandable
		end

	grid_item_select_handler (an_ev_grid_item: EV_GRID_ITEM)
			-- handler for any button, which causes a selection of the node
		do
			if attached {ARCH_LIB_ARCHETYPE_EDITABLE} an_ev_grid_item.row.data as aca then
				select_archetype_with_delay  (aca)
			elseif attached {ARCH_LIB_CLASS_NODE} an_ev_grid_item.row.data as accn then
				select_class_with_delay (accn)
			end
			gui_agents.history_set_active_agent.call ([ultimate_parent_tool])
		end

	grid_item_event_handler (x,y, button: INTEGER; an_ev_grid_item: detachable EV_GRID_ITEM)
			-- right-click handler
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				if attached an_ev_grid_item then
					if attached {ARCH_LIB_ARCHETYPE_EDITABLE} an_ev_grid_item.row.data as aca then
						build_archetype_node_context_menu (aca)
					elseif attached {ARCH_LIB_CLASS_NODE} an_ev_grid_item.row.data as accn then
						build_class_node_context_menu (accn)
					else
						build_default_context_menu
					end
				end
			end
			gui_agents.history_set_active_agent.call ([ultimate_parent_tool])
		end

	build_class_node_context_menu (accn: ARCH_LIB_CLASS_NODE)
			-- creates the context menu for a right click action for an ARCH_CAT_CLASS_NODE node
		local
			menu, tree_menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			create menu

			-- show class in current tab
			create an_mi.make_with_text_and_action (get_msg (ec_display_in_active_tab, Void), agent display_context_selected_class_in_active_tool (accn))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool"))
	    	menu.extend (an_mi)

			-- show class in new tab
			create an_mi.make_with_text_and_action (get_msg (ec_display_in_new_tab, Void), agent display_context_selected_class_in_new_tool (accn))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
			menu.extend (an_mi)

			-- show class in RM
			create an_mi.make_with_text_and_action (get_msg (ec_show_class_in_rm, Void), agent display_context_selected_class_in_rm_schema_tool (accn))
			an_mi.set_pixmap (get_icon_pixmap ("tool/rm_schema"))
			menu.extend (an_mi)

			-- create a new non-specialised archetype
			create an_mi.make_with_text_and_action (get_msg (ec_create_new_archetype, Void), agent create_new_non_specialised_archetype (accn))
			an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool_new"))
			menu.extend (an_mi)

			-- add in tree controls
			create tree_menu.make_with_text (get_text (ec_tree_controls))
			menu.extend (tree_menu)
			context_menu_add_tree_controls (tree_menu)

			menu.show
		end

	display_context_selected_class_in_active_tool (accn: ARCH_LIB_CLASS_NODE)
		do
			gui_agents.select_class_agent.call ([accn.class_definition])
		end

	display_context_selected_class_in_new_tool (accn: ARCH_LIB_CLASS_NODE)
		do
			gui_agents.select_class_in_new_tool_agent.call ([accn.class_definition])
		end

	display_context_selected_class_in_rm_schema_tool (accn: ARCH_LIB_CLASS_NODE)
		do
			gui_agents.select_class_in_rm_schema_tool_agent.call ([accn.class_definition.globally_qualified_path])
		end

	select_item_in_grid (an_ev_grid_row: EV_GRID_ROW; ari_global_id: STRING)
			-- if an archetype tool already exists with this id, then cause it to be shown
			-- and then select corresponding tree node, but with events off. If no
			-- archetype tool available, treat as if it were a first time request for this archetype
			-- and do a normal tree node select
		do
			if attached {EV_GRID_LABEL_ITEM} an_ev_grid_row.item (1) as gli then
				gli.select_actions.block
				gli.enable_select
				if not gui_agents.show_tool_with_artefact_agent.item ([ari_global_id]) and
					attached {ARCH_LIB_ARCHETYPE_EDITABLE} current_library.archetype_with_id (ari_global_id) as ala
				then
					gui_agents.select_archetype_agent.call ([ala])
				end
				gli.select_actions.resume
			end
		end

	add_tool_specific_archetype_menu_items (a_menu: EV_MENU; aca: ARCH_LIB_ARCHETYPE_EDITABLE)
			-- add further menu items specific to descendant tools
		local
			an_mi: EV_MENU_ITEM
		do
			if aca.is_valid then
				-- create new specialised archetype
				create an_mi.make_with_text_and_action (get_text (ec_create_new_child_archetype), agent create_new_specialised_archetype (aca))
				an_mi.set_pixmap (get_icon_pixmap ("tool/new_archetype"))
				a_menu.extend (an_mi)

				-- create new template
				create an_mi.make_with_text_and_action (get_text (ec_create_new_template), agent create_new_template (aca))
				an_mi.set_pixmap (get_icon_pixmap ("tool/new_archetype"))
				a_menu.extend (an_mi)
			end
		end

	create_new_specialised_archetype (parent_aca: ARCH_LIB_ARCHETYPE_EDITABLE)
		local
			dialog: NEW_ARCHETYPE_DIALOG
		do
			if attached source as src then
				create dialog.make_specialised (file_system.dirname (parent_aca.source_file_path), parent_aca.id.deep_twin, parent_aca.id, src)
				check attached proximate_ev_window (ev_root_container) as prox_win then
					dialog.show_modal_to_window (prox_win)
				end
				if dialog.is_valid then
					src.add_new_specialised_archetype (parent_aca, dialog.archetype_id, dialog.archetype_directory)
					populate (src)
					select_item_in_tree (src.last_added_archetype.id.as_string)
				end
				dialog.destroy
			end
		end

	create_new_template (parent_aca: ARCH_LIB_ARCHETYPE_EDITABLE)
		local
			dialog: NEW_ARCHETYPE_DIALOG
			new_id: ARCHETYPE_HRID
		do
			if attached source as src then
				new_id := parent_aca.id.deep_twin
				new_id.set_concept_id ("t_" + new_id.concept_id)
				create dialog.make_specialised (file_system.dirname (parent_aca.source_file_path), new_id, parent_aca.id, src)
				dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				if dialog.is_valid then
					src.add_new_template (parent_aca, dialog.archetype_id, dialog.archetype_directory)
					check attached src.last_added_archetype as att_arch then
						tool_agents.update_explorers_and_select_agent.call ([att_arch])
					end
				end
				dialog.destroy
			end
		end

	create_new_non_specialised_archetype (accn: ARCH_LIB_CLASS_NODE)
		local
			dialog: NEW_ARCHETYPE_DIALOG
			matching_ids: ARRAYED_SET [STRING]
			in_dir_path: STRING
		do
			-- figure out a reasonable path as the path of some other archetype of the same class
			matching_ids := source.matching_ids (".*", accn.class_definition.name, Void)
			if not matching_ids.is_empty then
				matching_ids.start
				in_dir_path := file_system.dirname (source.archetype_with_id (matching_ids.item).source_file_path)
			else
				in_dir_path := current_library_interface.library_path
			end

			if attached source as src then
				create dialog.make (in_dir_path, create {ARCHETYPE_HRID}.make_new (accn.qualified_name), src)
				dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				if dialog.is_valid then
					src.add_new_non_specialised_archetype (accn, dialog.archetype_id, dialog.archetype_directory)
					populate (src)
					select_item_in_tree (src.last_added_archetype.id.as_string)
				end
				dialog.destroy
			end
		end

end


