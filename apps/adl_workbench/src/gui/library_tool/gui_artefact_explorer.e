note
	component:   "openEHR ADL Tools"
	description: "Composite control for viewing archetype or template artefacts"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_ARTEFACT_EXPLORER

inherit
	GUI_LIBRARY_TARGETTED_TOOL
		redefine
			repopulate
		end

feature {NONE} -- Initialisation

	make
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		do
			-- root container
			create ev_root_container

			-- semantic EV_GRID
			create gui_semantic_grid.make (True, True, True, True)
			gui_semantic_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_root_container.extend (gui_semantic_grid.ev_grid)
  			gui_semantic_grid.ev_grid.set_minimum_width (100)
  			gui_semantic_grid.ev_grid.hide_header

  			create gui_semantic_grid_tree_control.make (gui_semantic_grid)

			-- set events
			gui_semantic_grid.ev_grid.pointer_button_press_item_actions.extend (agent grid_item_event_handler)
			gui_semantic_grid.ev_grid.item_select_actions.extend (agent grid_item_select_handler)
			gui_semantic_grid.ev_grid.disable_selection_on_click
			gui_semantic_grid.ev_grid.enable_selection_on_single_button_click
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	gui_semantic_grid: EVX_GRID
			-- grid control for view of archetypes based on RM types & archetype ids

	gui_semantic_grid_tree_control: EVX_TREE_CONTROL_GRID
			-- tree actions controller

feature -- Commands

	repopulate
			-- repopulate to update GUI settings
		do
			gui_semantic_grid.ev_grid.tree_do_all (agent semantic_grid_update_row (?, True))
			gui_semantic_grid.resize_columns_to_content
		end

	update_tree_node_for_archetype (ara: attached ARCH_LIB_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		deferred
		end

	update_rm_icons_setting
		do
			repopulate
		end

	select_item_in_tree (ari_global_id: STRING)
			-- ensure node with global node id `ari_global_id' is visible in the tree
		deferred
		end

feature {NONE} -- Implementation

	do_clear
		do
			create semantic_grid_row_map.make(0)
			gui_semantic_grid.wipe_out
 			create ev_tree_item_stack.make (0)
 			selected_archetype_node := Void
		end

	semantic_grid_row_map: HASH_TABLE [EV_GRID_ROW, STRING]
			-- list of semantic EV_GRID rows, keyed by artefact id

	artefact_types: ARRAY [INTEGER]
			-- types of artefact in this view

	ev_tree_item_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- Stack used during `populate_ev_tree_node_enter'.

   	semantic_grid_update_row (node: EV_GRID_ROW; update_flag: BOOLEAN)
   		deferred
   		end

	selected_archetype_node: detachable ARCH_LIB_ARCHETYPE

	select_archetype_with_delay (aca: ARCH_LIB_ARCHETYPE)
		do
			selected_archetype_node := aca
			if selection_history.selected_item /= aca then
				delayed_select_archetype_agent.set_interval (300)
			end
		end

	delayed_select_archetype_agent: EV_TIMEOUT
			-- Timer to delay a moment before calling `select_archetype_agent'.
		do
			if attached delayed_select_archetype_agent_cache as dsaa then
				Result := dsaa
			else
				create Result
				Result.actions.extend (
					agent
						do
							delayed_select_archetype_agent.set_interval (0)
							do_select_archetype
						end
				)
				delayed_select_archetype_agent_cache := Result
			end
		end

	do_select_archetype
		do
			check attached selected_archetype_node as aca then
				selection_history.set_selected_item (aca)
				gui_agents.select_archetype_agent.call ([aca])
			end
		end

	grid_item_select_handler (an_ev_grid_item: EV_GRID_ITEM)
			-- left-click selection handler
		do
			if attached {ARCH_LIB_ARCHETYPE} an_ev_grid_item.row.data as aca then
				select_archetype_with_delay (aca)
			end
			gui_agents.history_set_active_agent.call ([ultimate_parent_tool])
		end

	grid_item_event_handler (x,y, button: INTEGER; an_ev_grid_item: detachable EV_GRID_ITEM)
			-- right click context maenu handler
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				if attached an_ev_grid_item and then attached {ARCH_LIB_ARCHETYPE} an_ev_grid_item.row.data as aca then
					build_archetype_node_context_menu (aca)
				end
			end
			gui_agents.history_set_active_agent.call ([ultimate_parent_tool])
		end

	build_archetype_node_context_menu (aca: ARCH_LIB_ARCHETYPE)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu, tree_menu, file_menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			create menu

			-- display archetype in current tool
			create an_mi.make_with_text_and_action (get_text (ec_display_in_active_tab), agent display_archetype_in_active_tool (aca))
			an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool"))
	    	menu.extend (an_mi)

			-- display archetype in new tool
			create an_mi.make_with_text_and_action (get_text (ec_display_in_new_tab), agent display_archetype_in_new_tool (aca))
			an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool_new"))
			menu.extend (an_mi)

			-- edit archetype in visual editor
			if aca.is_valid and not gui_agents.archetype_has_editor_agent.item ([aca]) then -- only offer editor if there is not already one running for this archetype
				create an_mi.make_with_text_and_action (get_text (ec_edit), agent edit_archetype_in_new_tool (aca))
				an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_editor"))
				menu.extend (an_mi)
			end

			add_tool_specific_archetype_menu_items (menu, aca)

			-- add in file submenu
			if attached {ARCH_LIB_AUTHORED_ARCHETYPE} aca as auth_aca then
				-- remove artefact
				if not aca.artefact_type.is_overlay then
					create an_mi.make_with_text_and_action (get_text (ec_remove_artefact), agent remove_artefact (auth_aca))
					an_mi.set_pixmap (get_icon_pixmap ("tool/remove"))
					menu.extend (an_mi)
				end

				create file_menu.make_with_text (get_text (ec_file_menu_text))
				menu.extend (file_menu)
				context_menu_add_file_submenu (file_menu, auth_aca)
			end

			-- add in tree controls
			create tree_menu.make_with_text (get_text (ec_tree_controls))
			menu.extend (tree_menu)
			context_menu_add_tree_controls (tree_menu)

			menu.show
		end

	build_default_context_menu
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
		do
			create menu

			-- add in tree controls
			context_menu_add_tree_controls (menu)

			menu.show
		end

	context_menu_add_tree_controls (a_menu: EV_MENU)
			-- add tree expand, collapse, grow, shrink controls
		local
			an_mi: EV_MENU_ITEM
		do
			create an_mi.make_with_text_and_action (get_text (ec_expand_complete_button_text), agent do gui_semantic_grid_tree_control.expand_all end)
			an_mi.set_pixmap (get_icon_pixmap ("tool/tree_expand_all"))
			a_menu.extend (an_mi)
			create an_mi.make_with_text_and_action (get_text (ec_collapse_complete_button_text), agent do gui_semantic_grid_tree_control.collapse_all end)
			an_mi.set_pixmap (get_icon_pixmap ("tool/tree_collapse_all"))
			a_menu.extend (an_mi)
			create an_mi.make_with_text_and_action (get_text (ec_expand_one_level_button_text), agent do gui_semantic_grid_tree_control.expand_one_level end)
			an_mi.set_pixmap (get_icon_pixmap ("tool/tree_expand"))
			a_menu.extend (an_mi)
			create an_mi.make_with_text_and_action (get_text (ec_collapse_one_level_button_text), agent do gui_semantic_grid_tree_control.collapse_one_level end)
			an_mi.set_pixmap (get_icon_pixmap ("tool/tree_collapse"))
			a_menu.extend (an_mi)
		end

	context_menu_add_file_submenu (a_menu: EV_MENU; aca: ARCH_LIB_AUTHORED_ARCHETYPE)
			-- creates the context menu for file operations
		local
			an_mi: EV_MENU_ITEM
		do
			-- edit archetype source in external tool
			create an_mi.make_with_text_and_action (get_text (ec_edit_source),
				agent (an_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
					do
						tool_agents.edit_archetype_source_agent.call ([an_aca])
					end (aca)
			)
			an_mi.set_pixmap (get_icon_pixmap ("tool/edit"))
			a_menu.extend (an_mi)

			-- save archetype as ...
			create an_mi.make_with_text_and_action (get_text (ec_save_archetype_as),
				agent (an_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
					do
						tool_agents.save_archetype_agent.call ([an_aca, True, True])
					end (aca)
			)
			an_mi.set_pixmap (get_icon_pixmap ("tool/save"))
			a_menu.extend (an_mi)

			-- export archetype as ...
			create an_mi.make_with_text_and_action (get_text (ec_export_archetype_as),
				agent (an_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
					do
						tool_agents.save_archetype_agent.call ([an_aca, True, False])
					end (aca)
			)
			a_menu.extend (an_mi)

			-- export flat archetype as
			create an_mi.make_with_text_and_action (get_text (ec_export_flat_archetype_as),
				agent (an_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
					do
						tool_agents.save_archetype_agent.call ([an_aca, False, False])
					end (aca)
			)
			a_menu.extend (an_mi)
		end

	add_tool_specific_archetype_menu_items (a_menu: EV_MENU; aca: ARCH_LIB_ARCHETYPE)
			-- add further menu items specific to descendant tools
		do
		end

	display_archetype_in_active_tool (aca: ARCH_LIB_ARCHETYPE)
		do
			gui_agents.select_archetype_agent.call ([aca])
		end

	display_archetype_in_new_tool (aca: ARCH_LIB_ARCHETYPE)
		do
			gui_agents.select_archetype_in_new_tool_agent.call ([aca])
		end

	edit_archetype_in_new_tool (aca: ARCH_LIB_ARCHETYPE)
		do
			gui_agents.edit_archetype_in_new_tool_agent.call ([aca])
		end

	delayed_select_archetype_agent_cache: detachable EV_TIMEOUT
			-- Timer to delay a moment before calling `select_archetype_agent'.
		note
			option: stable
		attribute
		end

	remove_artefact (aca: ARCH_LIB_AUTHORED_ARCHETYPE)
		local
			question_dialog: EV_QUESTION_DIALOG
		do
			if attached source as src then
				create question_dialog.make_with_text (get_msg (ec_remove_artefact_question, <<aca.id.physical_id>>))
				question_dialog.set_title (get_text (ec_remove_dialog_title))
				question_dialog.set_buttons (<<get_text (ec_yes_response), get_text (ec_no_response)>>)
				question_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				if question_dialog.selected_button.same_string (get_text (ec_yes_response)) then
					src.remove_artefact (aca)
					aca.remove_file
					check attached aca.specialisation_parent as att_anc then
						tool_agents.update_explorers_and_select_agent.call ([att_anc])
					end
				end
				question_dialog.destroy
			end
		end

invariant
	valid_artefact_types: (create {ARTEFACT_TYPE}).valid_artefact_types (artefact_types)

end


