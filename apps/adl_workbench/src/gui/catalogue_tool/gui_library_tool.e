note
	component:   "openEHR ADL Tools"
	description: "Combined control for viewing archetype and template artefacts in 2 trees"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_LIBRARY_TOOL

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_native_serialiser_format, archetype_native_serialiser_formats
		end

	GUI_SEARCHABLE_TOOL

	GUI_LIBRARY_TARGETTED_TOOL
		redefine
			go_to_selected_item, on_rotate_view, mini_tool_bar
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			tool_agents.set_edit_archetype_source_agent (agent edit_archetype)
			tool_agents.set_save_archetype_agent (agent save_archetype)

			create archetype_explorer.make
			create template_explorer.make
			create metrics_viewer.make
			create stats_viewer.make

			-- create widgets
			create ev_root_container

			-- connect widgets
			ev_root_container.extend (archetype_explorer.ev_root_container)
			ev_root_container.extend (template_explorer.ev_root_container)
			ev_root_container.extend (metrics_viewer.ev_root_container)
			ev_root_container.extend (stats_viewer.ev_root_container)

			-- visual characteristics
			ev_root_container.set_item_text (archetype_explorer.ev_root_container, get_text (ec_library_archetype_tab_text))
			ev_root_container.item_tab (archetype_explorer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/archetype_catalog"))

			ev_root_container.set_item_text (template_explorer.ev_root_container, get_text (ec_library_template_tab_text))

			ev_root_container.set_item_text (metrics_viewer.ev_root_container, get_text (ec_library_metrics_tab_text))
			ev_root_container.set_item_text (stats_viewer.ev_root_container, get_text (ec_library_stats_tab_text))
			set_stats_metric_tab_appearance

			-- docking pane mini-toolbar with rotate-view button
			create gui_mini_tool_bar.make
			gui_mini_tool_bar.add_tool_bar
			gui_mini_tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/view_rotate_active"), get_icon_pixmap ("tool/view_rotate_inactive"),
				get_text (ec_library_mini_toolbar_view_rotate), agent on_rotate_view)
			check attached gui_mini_tool_bar.last_tool_bar_button as tbb then
				rotate_view_button := tbb
				gui_mini_tool_bar.activate_tool_bar_button (tbb)
			end

			-- set events: select a notebook tab
			ev_root_container.selection_actions.extend (agent on_select_notebook)

			-- set up tool / sub-tool structures
			add_sub_tool (archetype_explorer)
			add_sub_tool (template_explorer)
			add_sub_tool (metrics_viewer)
			add_sub_tool (stats_viewer)
			enable_selection_history

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

	matching_ids (a_key: STRING): ARRAYED_SET [STRING]
		do
			if attached source then
				Result := source.matching_ids (a_key, Void, Void)
			else
				create Result.make(0)
			end
		end

	mini_tool_bar: EV_TOOL_BAR
		do
			check attached gui_mini_tool_bar.last_tool_bar as ltb then
				Result := ltb
			end
		end

feature -- Status Report

	item_selectable: BOOLEAN
		do
			Result := is_populated
		end

	valid_item_id (a_key: STRING): BOOLEAN
			-- key is a valid identifier of an item managed in this tool
		do
			Result := (create {ARCHETYPE_HRID}.default_create).valid_id (a_key)
		end

feature -- Commands

	update_tree_node (aca: ARCH_LIB_ARCHETYPE)
		do
			archetype_explorer.update_tree_node_for_archetype (aca)
			template_explorer.update_tree_node_for_archetype (aca)
		end

	go_to_selected_item
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_library'.
			-- No events will be processed because archetype selected in ARCHETYPE_LIBRARY already matches selected tree node
		do
			if selection_history.has_selected_item and then source.has_item_with_id (selection_history.selected_item.global_artefact_identifier) then
				archetype_explorer.select_item_in_tree (selection_history.selected_item.global_artefact_identifier)
				docking_pane.set_focus
			end
		end

	select_item_by_id (a_globally_qualified_id: STRING)
			-- Select `a_globally_qualified_id' in the GUI library tree, unless it is the same as the current selection
		do
			if not selection_history.has_selected_archetype or else not a_globally_qualified_id.is_equal (selection_history.selected_archetype.qualified_name) then
				if source.has_item_with_id (a_globally_qualified_id) then
					archetype_explorer.select_item_in_tree (a_globally_qualified_id)
				end
			end
		end

	update_rm_icons_setting
		do
			archetype_explorer.update_rm_icons_setting
			template_explorer.update_rm_icons_setting
		end

	show
		do
			docking_pane.show
		end

	open_adhoc_archetype
			-- open currently selected archetype
		local
			dialog: EV_FILE_OPEN_DIALOG
			fname: STRING
		do
			create dialog
			dialog.set_start_directory (current_work_directory)
			dialog.filters.extend (["*" + File_ext_archetype_source, get_text (ec_adl_15_source_files)])
			dialog.filters.extend (["*" + File_ext_archetype_adl14, get_text (ec_adl_14_files)])
			dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			fname := dialog.file_name.as_string_8

			if not fname.is_empty then
				if not current_library.library_access.adhoc_source.has_path (fname) then
					set_current_work_directory (file_system.dirname (fname))
					if not file_system.file_exists (fname) then
						(create {EV_INFORMATION_DIALOG}.make_with_text (get_msg (ec_file_not_found, <<fname>>))).show_modal_to_window (proximate_ev_window (ev_root_container))
					else
						source.add_adhoc_archetype (fname)
						if not source.has_errors and attached source.last_added_archetype as arch then
							selection_history.set_selected_item (arch)
							show
							repopulate
						else
							gui_agents.console_tool_append_agent.call ([source.error_strings])
						end
					end
				else
					(create {EV_INFORMATION_DIALOG}.make_with_text (get_msg (ec_file_already_exists, <<fname>>))).show_modal_to_window (proximate_ev_window (ev_root_container))
				end
			end
		end

	save_source_archetype_as
			-- Save source (differential) archetype to a user-specified path
		do
			if selection_history.has_validated_selected_archetype and attached selection_history.selected_archetype as aca then
				save_archetype (aca, True, True)
			end
		end

	export_source_archetype_as
			-- Export source archetype to a user-specified path
		do
			if selection_history.has_validated_selected_archetype and attached selection_history.selected_archetype as aca then
				save_archetype (aca, True, False)
			end
		end

	export_flat_archetype_as
			-- Export flat archetype to a user-specified path
		do
			if selection_history.has_validated_selected_archetype and attached selection_history.selected_archetype as aca then
				save_archetype (aca, False, False)
			end
		end

feature -- Modification

	set_docking_pane (a_docking_pane: SD_CONTENT)
		do
			docking_pane := a_docking_pane
		end

feature -- Events

	on_select_notebook
		do
			if attached source as src then
				if ev_root_container.selected_item.data = metrics_viewer then
					if src.can_build_statistics then
						src.build_detailed_statistics
						if not attached metrics_viewer.last_populate_timestamp or else metrics_viewer.last_populate_timestamp < src.last_stats_build_timestamp then
							metrics_viewer.populate (src)
						end
					end
				elseif ev_root_container.selected_item.data = stats_viewer then
					if src.can_build_statistics then
						src.build_detailed_statistics
						if not attached stats_viewer.last_populate_timestamp or else stats_viewer.last_populate_timestamp < src.last_stats_build_timestamp then
							across src.stats as stats_csr loop
								stats_viewer.populate (stats_csr.item, True)
							end
						end
					end
				end
			end
		end

	on_full_compile
			-- actions to execute when a complete compile has been done
		do
			set_stats_metric_tab_appearance
		end

	on_rotate_view
		do
			if attached {GUI_LIBRARY_TARGETTED_TOOL} ev_root_container.selected_item.data as cat_tool and attached source then
				cat_tool.on_rotate_view
			end
		end

feature {NONE} -- Implementation

	do_clear
		do
			metrics_viewer.clear
			stats_viewer.clear
			ev_root_container.select_item (archetype_explorer.ev_root_container)
		end

	do_populate
			-- Populate content from visual controls.
		do
			docking_pane.set_short_title (get_text (ec_library_tool_title))
			docking_pane.set_long_title (get_text (ec_library_tool_title) + " " + current_library_name)
			if attached source as src then
				archetype_explorer.populate (src)
				template_explorer.populate (src)
				set_stats_metric_tab_appearance
				on_select_notebook
				go_to_selected_item
			end
		end

	docking_pane: detachable SD_CONTENT
		note
			option: stable
		attribute
		end

	gui_mini_tool_bar: EVX_TOOL_BAR

	rotate_view_button: detachable EV_TOOL_BAR_BUTTON

	archetype_explorer: GUI_ARCHETYPE_EXPLORER

	template_explorer: GUI_TEMPLATE_EXPLORER

	metrics_viewer: GUI_STATISTICS_TOOL

	stats_viewer: GUI_ARCHETYPE_STATISTICAL_REPORT

	set_stats_metric_tab_appearance
			-- set visual appearance of stats & metric tab according to whether there are errors or not
		do
			if attached source and then source.can_build_statistics then
				ev_root_container.item_tab (metrics_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/metrics"))
				ev_root_container.item_tab (stats_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics"))
			else
				ev_root_container.item_tab (metrics_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/metrics_grey"))
				ev_root_container.item_tab (stats_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics_grey"))
			end
			if attached source and then source.template_count > 0 then
				ev_root_container.item_tab (template_explorer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/template_catalog"))
			else
				ev_root_container.item_tab (template_explorer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/template_catalog_grey"))
			end
		end

	save_archetype (aca: ARCH_LIB_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN)
			-- Export differential or flat archetype to a user-specified path
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			name, format, ext: STRING
			format_list: ARRAYED_LIST [STRING]
			dialog_title: STRING
		do
			if aca.is_valid then
				if native_format_flag then
					format_list := archetype_native_serialiser_formats
					dialog_title := get_text (ec_save_archetype_title)
				else
					format_list := archetype_all_serialiser_formats
					dialog_title := get_text (ec_export_archetype_title)
				end
				name := extension_replaced (aca.source_file_path, "")

				create save_dialog
				save_dialog.set_title (dialog_title)
				save_dialog.set_file_name (name)
				save_dialog.set_start_directory (current_work_directory)

				-- ask the user what format
				across format_list as formats_csr loop
					check attached archetype_file_extensions [formats_csr.item] as file_ext then
						save_dialog.filters.extend (["*" + file_ext,
							get_msg (ec_save_archetype_as_type, <<formats_csr.item.as_upper>>)])
					end
				end

				save_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				name := save_dialog.file_name.as_string_8

				if not name.is_empty then
					-- finalise the file path & create a handle
					set_current_work_directory (file_system.dirname (name))
					format := format_list [save_dialog.selected_filter_index]
					ext := archetype_file_extension (diff_flag, format)
					if not file_system.has_extension (name, ext) then
						name.append (ext)
					end
					create file.make (name)

					-- if the file already exists, ask user about overwrite
					ok_to_write := True
					if file.exists then
						create question_dialog.make_with_text (get_msg (ec_file_exists_replace_question, <<file_system.basename (name)>>))
						question_dialog.set_title (get_msg (ec_save_archetype_as_type, <<format.as_upper>>))
						question_dialog.set_buttons (<<get_text (ec_yes_response), get_text (ec_no_response)>>)
						question_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
						ok_to_write := question_dialog.selected_button.same_string (get_text (ec_yes_response))
					end
					if ok_to_write then
						if diff_flag then
							aca.save_differential_as (name, format)
						else
							aca.save_flat_as (name, format)
						end
						gui_agents.console_tool_append_agent.call ([aca.status])
					end
				end
			else
				create error_dialog.make_with_text (get_text (ec_compile_before_serialising))
				error_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			end
		end

	edit_archetype (aca: ARCH_LIB_ARCHETYPE_EDITABLE)
			-- Launch the external editor with the archetype currently selected in `archetype_directory'.
		local
			question_dialog: EV_QUESTION_DIALOG
			info_dialog: EV_INFORMATION_DIALOG
			path: STRING
			legacy_path: detachable STRING
			orig_time_stamp: INTEGER
		do
			-- figure out what file to edit
			path := aca.source_file_path
			if aca.file_mgr.has_legacy_flat_file then
				check attached aca.file_mgr.legacy_flat_path as lfp then
					legacy_path := lfp
				end
				if aca.has_source_file then
					create question_dialog.make_with_text (get_msg_line (ec_edit_which_file_question,
						<<file_system.basename (path), file_system.basename (legacy_path)>>))
					question_dialog.set_title (get_msg (ec_library_edit_differential_button_text, <<aca.qualified_name>>))
					question_dialog.set_buttons (<<get_text (ec_library_edit_differential_button_text), get_text (ec_library_edit_adl14_button_text)>>)
					question_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
					if question_dialog.selected_button.is_equal (get_text (ec_library_edit_adl14_button_text)) then
						path := legacy_path
					end
				else
					create info_dialog.make_with_text (get_msg_line (ec_edit_legacy_file_info,
						<<file_system.basename (legacy_path)>>))
					info_dialog.set_title (get_msg (ec_library_edit_differential_button_text, <<aca.id.as_string>>))
					info_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
					path := legacy_path
				end
			end

			-- lauch editor process and wait for it
			orig_time_stamp := file_system.file_time_stamp (path)
			do_system_run_command_synchronous (editor_app_command + " %"" + path + "%"", Void)
			if file_system.file_time_stamp (path) > orig_time_stamp then
				gui_agents.select_archetype_agent.call ([aca])
			end
		end

end


