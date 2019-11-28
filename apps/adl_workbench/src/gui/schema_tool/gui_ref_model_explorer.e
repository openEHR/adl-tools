note
	component:   "openEHR ADL Tools"
	description: "Combined control for viewing archetype and template artefacts in 2 trees"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_REF_MODEL_EXPLORER

inherit
	STRING_UTILITIES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	GUI_SEARCHABLE_TOOL

	GUI_TOOL
		redefine
			source, go_to_selected_item
		end

	SHARED_DT_SERIALISERS
		export
			{NONE} all;
			{ANY} has_dt_serialiser_format
		end

	ODIN_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container

			-- EV_GRID
			create gui_grid.make (True, True, True, True)
			gui_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_root_container.extend (gui_grid.ev_grid)
  			gui_grid.ev_grid.set_minimum_width (100)
  			gui_grid.ev_grid.hide_header

			-- events
			enable_selection_history

			clear

			ev_root_container.set_data (Current)
		end

feature -- Access

	source: detachable BMM_MODEL_ACCESS

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := "RM schemas"
		end

	ev_root_container: EV_VERTICAL_BOX

	matching_ids (a_regex: STRING): ARRAYED_SET[STRING]
			-- generate list of schema elemtn ids (packages and classes)
		local
			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		do
			create Result.make (0)
			create regex_matcher.make
			regex_matcher.set_case_insensitive (True)
			regex_matcher.compile (a_regex)
			if regex_matcher.is_compiled then
				Result.compare_objects
				across ev_node_map as ev_node_map_csr loop
					if regex_matcher.matches (ev_node_map_csr.key) then
						Result.extend (ev_node_map_csr.key)
					end
				end
			else
				Result.extend (get_msg_line ("regex_e1", <<a_regex>>))
			end
		end

feature -- Status Report

	item_selectable: BOOLEAN
		do
			Result := True
		end

	valid_item_id (a_key: STRING): BOOLEAN
			-- key is a valid identifier of an item managed in this tool
		do
			Result := ev_node_map.has (a_key)
		end

feature -- Commands

	select_item_by_id (id: STRING)
			-- show class in RM explorer and display it in a class tool
		local
			row: EV_GRID_ROW
		do
			if ev_node_map.has (id) and gui_grid.ev_grid.is_displayed then
				check attached ev_node_map.item (id) as gr then
					row := gr
				end
				gui_grid.ev_grid.ensure_visible (row)

				-- if a class tool already exists with this id, then cause it to be shown
				-- and then select corresponding tree node, but with events off. If no
				-- class tool available, treat as if it were a first tme request for this class
				-- and do a normal tree node select
				if gui_agents.call_show_tool_with_artefact_agent (id) then
					row.select_actions.block
					row.enable_select
					row.select_actions.resume
				else
					row.enable_select
				end
			end
		end

	show_item (id: STRING)
			-- show class in RM explorer
		do
			if ev_node_map.has (id) and gui_grid.ev_grid.is_displayed then
				ev_node_map.item (id).ensure_visible
			end
		end

	go_to_selected_item
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_catalogue'.
			-- No events will be processed because archetype selected in ARCHETYPE_CATALOGUE already matches selected tree node
		do
			if selection_history.has_selected_item then
				select_item_by_id (selection_history.selected_item.global_artefact_identifier)
				docking_pane.set_focus
			end
		end

feature -- Modification

	set_docking_pane (a_docking_pane: SD_CONTENT)
		do
			docking_pane := a_docking_pane
		end

feature {NONE} -- Implementation

	gui_grid: EVX_GRID

	docking_pane: detachable SD_CONTENT
		note
			option: stable
		attribute
		end

	do_clear
			-- Wipe out content from visual controls and reset controls to reasonable state
		do
			gui_grid.wipe_out
			create ev_node_map.make(0)
		end

	do_populate
		do
			across safe_source.bmm_models as rm_csr loop
				populate_model (rm_csr.item)
			end
			gui_grid.resize_columns_to_content
		end

	populate_model (a_model: BMM_MODEL)
		local
			pkg_row: EV_GRID_ROW
		do
			-- add row to grid
			gui_grid.add_row (a_model)
			gui_grid.set_last_row_label_col (1, a_model.model_id, Void, Void, Void, get_icon_pixmap ("tool/rm_schema"))
			check attached gui_grid.last_row as a_row then
				pkg_row := a_row
			end
			gui_grid.add_last_row_pointer_button_press_actions (1, agent schema_node_handler (pkg_row, ?, ?, ?))
			across a_model.packages as pkgs_csr loop
 				populate_packages (pkg_row, pkgs_csr.item)
			end
		end

	populate_packages (ev_parent_node: EV_GRID_ROW; a_pkg: BMM_PACKAGE)
		local
			pkg_row: EV_GRID_ROW
		do
			-- add subrow
			gui_grid.add_sub_row (ev_parent_node, a_pkg)
			gui_grid.set_last_row_label_col (1, a_pkg.name, "Package " + a_pkg.path, Void, Void, get_icon_pixmap ("rm/generic/package"))
			check attached gui_grid.last_row as a_row then
				pkg_row := a_row
			end
			ev_node_map.put (pkg_row, a_pkg.globally_qualified_path)

			-- do the classes
			across a_pkg.classes as classes_csr loop
 				-- only do top classes in each package; if this class has an ancestor in the same package,
 				-- don't do this class, it will get taken care of via the parent
 				if not across classes_csr.item.ancestors as anc_csr some anc_csr.item.defining_class.package = a_pkg end then
	 				populate_classes (pkg_row, classes_csr.item)
	 			end
			end

			-- do the child packages
			across a_pkg.packages as pkgs_csr loop
 				populate_packages (pkg_row, pkgs_csr.item)
			end
		end

	populate_classes (ev_parent_node: EV_GRID_ROW; a_class_def: BMM_CLASS)
		local
			pixmap_name: STRING
			ev_class_row: EV_GRID_ROW
		do
			-- add subrow
			gui_grid.add_sub_row (ev_parent_node, a_class_def)
 			pixmap_name := "rm/generic/" + a_class_def.entity_category
			gui_grid.set_last_row_label_col (1, a_class_def.type.type_signature, a_class_def.description, Void, Void, get_icon_pixmap (pixmap_name))
			check attached gui_grid.last_row as lr then
				ev_class_row := lr
			end
			ev_node_map.put (ev_class_row, a_class_def.global_artefact_identifier)

			-- context menu
			gui_grid.add_last_row_pointer_button_press_actions (1, agent class_node_handler (ev_class_row, ?, ?, ?))
			gui_grid.add_last_row_pointer_button_press_actions (1, agent do gui_agents.call_history_set_active_agent (ultimate_parent_tool) end)
			gui_grid.add_last_row_select_actions (1, agent select_class_with_delay (a_class_def))

			-- do any descendants in same package
			across a_class_def.immediate_descendants as imm_descs_csr loop
				if imm_descs_csr.item.package_path.same_string (a_class_def.package_path) then
					populate_classes (ev_class_row, imm_descs_csr.item)
				end
			end
		end

	ev_tree_expand (node: EV_GRID_ROW): BOOLEAN
			--
		do
	 		Result := attached {BMM_PACKAGE} node.data as pkg_def and node.is_expandable
		end

	class_node_handler (ev_ti: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if attached {BMM_CLASS} ev_ti.data as a_class_def then
				if button = {EV_POINTER_CONSTANTS}.left then
					select_class_with_delay (a_class_def)

				elseif button = {EV_POINTER_CONSTANTS}.right then
					create menu
					create an_mi.make_with_text_and_action (get_msg (ec_display_in_active_tab, Void), agent display_context_selected_class_in_active_tool (ev_ti))
					an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool"))
			    	menu.extend (an_mi)

					create an_mi.make_with_text_and_action (get_msg (ec_display_in_new_tab, Void), agent display_context_selected_class_in_new_tool (ev_ti))
					an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
					menu.extend (an_mi)

					create an_mi.make_with_text_and_action (get_msg (ec_edit_source_schema, Void), agent do_edit_schema (a_class_def.source_schema_id))
					an_mi.set_pixmap (get_icon_pixmap ("tool/edit"))
					menu.extend (an_mi)

					menu.show
				end
			end
		end

	schema_node_handler (ev_ti: EV_GRID_ROW; x,y, button: INTEGER)
			-- dynamically initializes the context menu for this tree
		local
			menu, tree_menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_MODEL} ev_ti.data as bm then
				create menu

				create an_mi.make_with_text_and_action (get_text (ec_display_in_active_tab), agent display_context_selected_rm_in_active_tool (ev_ti))
		    	menu.extend (an_mi)
				an_mi.set_pixmap (get_icon_pixmap ("tool/rm_schema_tool"))

				create an_mi.make_with_text_and_action (get_text (ec_display_in_new_tab), agent display_context_selected_rm_in_new_tool (ev_ti))
		    	menu.extend (an_mi)
				an_mi.set_pixmap (get_icon_pixmap ("tool/rm_schema_tool_new"))

				create an_mi.make_with_text_and_action (get_text (ec_edit_source_schema), agent do_edit_schema (bm.source_schema.schema_id))
				an_mi.set_pixmap (get_icon_pixmap ("tool/edit"))
		    	menu.extend (an_mi)

				-- P_BMM_SCHEMA export

				create an_mi.make_with_text_and_action (get_text (ec_export_schema_as_xml), agent do_schema_export (bm.source_schema.schema_id, syntax_type_xml))
				an_mi.set_pixmap (get_icon_pixmap ("tool/xml"))
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_text (ec_export_schema_as_json), agent do_schema_export (bm.source_schema.schema_id, syntax_type_json))
				an_mi.set_pixmap (get_icon_pixmap ("tool/json"))
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_text (ec_export_schema_as_odin), agent do_schema_export (bm.source_schema.schema_id, syntax_type_odin))
				menu.extend (an_mi)

				-- tree controls
				create tree_menu.make_with_text (get_text (ec_tree_controls))
				menu.extend (tree_menu)
				create an_mi.make_with_text_and_action (get_text (ec_expand_button_expand_text), agent schema_expand_all (ev_ti))
		    	tree_menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_text (ec_expand_packages), agent schema_expand_packages (ev_ti))
		    	tree_menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_text (ec_expand_button_collapse_text), agent schema_collapse (ev_ti))
		    	tree_menu.extend (an_mi)

				menu.show
		    end
		end

	schema_expand_all (a_schema_node: EV_GRID_ROW)
		do
			gui_grid.ev_grid.expand_tree (a_schema_node, Void)
		end

	schema_expand_packages (a_schema_node: EV_GRID_ROW)
		do
			gui_grid.ev_grid.expand_tree (a_schema_node,
				agent (a_row: attached EV_GRID_ROW): BOOLEAN
					do
						Result := attached {BMM_MODEL} a_row.data or
							attached {BMM_PACKAGE} a_row.data and then
							not gui_grid.has_matching_sub_row (a_row, agent (a_tn: EV_GRID_ROW): BOOLEAN do Result := attached {BMM_CLASS} a_tn.data end)
					end
			)
		end

	schema_collapse (a_schema_node: EV_GRID_ROW)
		do
			gui_grid.ev_grid.collapse_tree (a_schema_node)
		end

	display_context_selected_class_in_active_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_CLASS} a_row.data as a_class_def then
				gui_agents.call_select_class_agent (a_class_def)
			end
		end

	display_context_selected_class_in_new_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_CLASS} a_row.data as a_class_def then
				gui_agents.call_select_class_in_new_tool_agent (a_class_def)
			end
		end

	display_context_selected_rm_in_active_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_MODEL} a_row.data as a_bmm then
				gui_agents.call_select_rm_agent (a_bmm)
			end
		end

	display_context_selected_rm_in_new_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_MODEL} a_row.data as a_bmm then
				gui_agents.call_select_rm_in_new_tool_agent (a_bmm)
			end
		end

	do_edit_schema (a_schema_id: STRING)
			-- launch edit dialog
		local
			orig_time_stamp: INTEGER
		do
			if attached source as src and then attached src.all_schemas.item (a_schema_id) as sch
				and then attached sch.meta_data.item (metadata_schema_path) as sch_path
			then
				orig_time_stamp := file_system.file_time_stamp (sch_path)
				do_system_run_command_synchronous (text_editor_command + " %"" + sch_path + "%"", Void)
				if file_system.file_time_stamp (sch_path) > orig_time_stamp then
					src.reload_schemas
					populate (src, Void)
				end
			end
		end

	do_schema_export (a_schema_id, a_syntax_type: STRING)
			-- export schema in a specified format
		require
			Format_valid: has_dt_serialiser_format (a_syntax_type)
		local
			path, file_ext: STRING
			save_dialog: EV_FILE_SAVE_DIALOG
		do
			if attached safe_source.all_schemas.item (a_schema_id) as schema_desc then
				check attached odin_serialiser_file_extensions.item(a_syntax_type) as fx then
					file_ext := fx
				end
				create save_dialog
				save_dialog.set_title (get_text (ec_export_bmm_schema_dialog_title))
				save_dialog.set_file_name (schema_desc.schema_id + ".bmm" + file_ext)
				save_dialog.set_start_directory (export_directory)
				save_dialog.filters.extend (["*" + file_ext, get_msg (ec_save_schema_as, <<a_syntax_type.tail (a_syntax_type.count-1)>>)])
				save_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				path := save_dialog.file_name.as_string_8

				if not path.is_empty then
					schema_desc.export_schema (a_syntax_type, path)
				end
			end
		end

	selected_class_def: detachable BMM_CLASS
		note
			option: stable
		attribute
		end

	select_class_with_delay (a_class_def: BMM_CLASS)
		do
			selected_class_def := a_class_def
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
						check attached selected_class_def as scd then
							selection_history.set_selected_item (scd)
							gui_agents.call_select_class_agent (scd)
						end
					end
			)
		end

	ev_node_map: HASH_TABLE [EV_GRID_ROW, STRING]
			-- list of GUI explorer nodes, keyed by artefact id

end


