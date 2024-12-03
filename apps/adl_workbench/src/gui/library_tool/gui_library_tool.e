note
	component:   "openEHR ADL Tools"
	description: "[
				 Combined control containing archetype and template artefacts tree views, metrics and 
				 statistics viewers, and various micro-controls along the top.
				 ]"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
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

	EV_DIALOG_NAMES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			library_tool_agents.set_edit_archetype_source_agent (agent edit_archetype)
			library_tool_agents.set_save_archetype_agent (agent save_archetype)
			library_tool_agents.set_update_explorers_and_select_agent (agent update_explorers_and_select)
			library_tool_agents.set_update_archetype_explorer (agent update_archetype_explorer)
			library_tool_agents.set_create_new_non_specialised_archetype_agent (agent create_new_non_specialised_archetype)
			library_tool_agents.set_create_new_specialised_archetype_agent (agent create_new_specialised_archetype)
			library_tool_agents.set_create_new_template_agent (agent create_new_template)

			archetype_compiler.set_progress_agents (agent initialise_progress_agt, agent set_progress_bar_current_value)

			create archetype_explorer.make
			create template_explorer.make
			create compilation_stats_viewer.make
			create archetypes_stats_viewer.make

			-- create widgets
			create ev_root_container

			-- ------------------------ main notebook -----------------------------
			create ev_notebook
			ev_root_container.extend (ev_notebook)

			-- archetype explorer tab
			ev_notebook.extend (archetype_explorer.ev_root_container)
			ev_notebook.item_tab (archetype_explorer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/archetype_catalog"))
			ev_notebook.set_item_text (archetype_explorer.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_library_archetype_tab_text))

			-- template explorer tab
			ev_notebook.extend (template_explorer.ev_root_container)
			ev_notebook.set_item_text (template_explorer.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_library_template_tab_text))

			-- metrics viewer tab
			ev_notebook.extend (compilation_stats_viewer.ev_root_container)
			ev_notebook.set_item_text (compilation_stats_viewer.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_library_metrics_tab_text))

			-- statistics viewer tab
			ev_notebook.extend (archetypes_stats_viewer.ev_root_container)
			ev_notebook.set_item_text (archetypes_stats_viewer.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_library_stats_tab_text))

			set_tabs_appearance

			-- docking pane mini-toolbar
			create gui_mini_tool_bar.make
			gui_mini_tool_bar.add_tool_bar

			-- add view all classes button (class tree shows classes with no archetypes when active)
			gui_mini_tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/view_all_classes_active"), get_icon_pixmap ("tool/view_all_classes_inactive"),
				get_text ({ADL_MESSAGES_IDS}.ec_library_mini_toolbar_view_all_classes), agent on_view_all_classes)
			check attached gui_mini_tool_bar.last_tool_bar_button as tbb then
				view_all_classes_button := tbb
				gui_mini_tool_bar.activate_tool_bar_button (tbb)
			end

			-- add rotate-view button
			gui_mini_tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/view_rotate_active"), get_icon_pixmap ("tool/view_rotate_inactive"),
				get_text ({ADL_MESSAGES_IDS}.ec_library_mini_toolbar_view_rotate), agent on_rotate_view)
			check attached gui_mini_tool_bar.last_tool_bar_button as tbb then
				rotate_view_button := tbb
				gui_mini_tool_bar.activate_tool_bar_button (tbb)
			end

			-- set events: select a notebook tab
			ev_notebook.selection_actions.extend (agent on_select_notebook)

			-- ------------------------ compiler status -----------------------------
--			create ev_status_hb
--			ev_root_container.extend (ev_status_hb)
--			ev_root_container.disable_item_expand (ev_status_hb)

--			create ev_status_label.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_library_compile_status_text))
--			ev_status_hb.extend (ev_status_label)
--			ev_status_hb.disable_item_expand (ev_status_label)

--			create ev_status_text.default_create
--			ev_status_hb.extend (ev_status_text)
--			ev_status_hb.disable_item_expand (ev_status_text)

--			create ev_status_dummy_text.default_create
--			ev_status_hb.extend (ev_status_dummy_text)

			-- progress control
			create ev_progress_bar.default_create
			ev_progress_bar.set_foreground_color (Progress_bar_colour)
			ev_root_container.extend (ev_progress_bar)
			ev_root_container.disable_item_expand (ev_progress_bar)

			-- set up tool / sub-tool structures
			add_sub_tool (archetype_explorer)
			add_sub_tool (template_explorer)
			add_sub_tool (compilation_stats_viewer)
			add_sub_tool (archetypes_stats_viewer)
			enable_selection_history

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	mini_tool_bar: EV_TOOL_BAR
		do
			check attached gui_mini_tool_bar.last_tool_bar as ltb then
				Result := ltb
			end
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

	update_use_rm_pixmaps_setting
		do
			archetype_explorer.update_rm_icons_setting
			template_explorer.update_rm_icons_setting
		end

--	update_compilation_status (a_total, valid_count, warn_count, err_count: INTEGER)
--			-- update the compilation status text
--		do
--			if a_total \\ 10 = 0 then
--				status_text.wipe_out
--				status_text.append (a_total.out)
--				if valid_count > 0 or warn_count > 0 or err_count > 0 then
--					status_text.append (" (")
--					status_text.append (valid_count.out)
--					status_text.append (", ")
--					status_text.append (warn_count.out)
--					status_text.append (", ")
--					status_text.append (err_count.out)
--					status_text.append_character (')')
--				end
--				ev_status_text.set_text (status_text)
--				ev_status_text.refresh_now
--			end
--		end

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
			dialog.filters.extend (["*" + File_ext_archetype_source, get_text ({ADL_MESSAGES_IDS}.ec_adl_2_source_files)])
			dialog.filters.extend (["*" + File_ext_archetype_adl14, get_text ({ADL_MESSAGES_IDS}.ec_adl_14_files)])
			dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			fname := dialog.file_name.as_string_8

			if not fname.is_empty then
				if not current_library.library_access.adhoc_source.has_path (fname) then
					set_current_work_directory (file_system.dirname (fname))
					if not file_system.file_exists (fname) then
						(create {EV_INFORMATION_DIALOG}.make_with_text (get_msg ({GENERAL_MESSAGES_IDS}.ec_file_not_found, <<fname>>))).show_modal_to_window (proximate_ev_window (ev_root_container))
					else
						safe_source.add_adhoc_archetype (fname)
						if not safe_source.has_errors and attached safe_source.last_added_archetype as arch then
							selection_history.set_selected_item (arch)
							show
							repopulate
						else
							gui_agents.call_console_tool_append_agent (safe_source.error_strings)
						end
					end
				else
					(create {EV_INFORMATION_DIALOG}.make_with_text (get_msg ({GENERAL_MESSAGES_IDS}.ec_file_already_exists, <<fname>>))).show_modal_to_window (proximate_ev_window (ev_root_container))
				end
			end
		end

	save_source_archetype_as
			-- Save source (differential) archetype to a user-specified path
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if selection_history.has_validated_selected_archetype and attached {ARCH_LIB_AUTHORED_ARCHETYPE} selection_history.selected_archetype as auth_aca then
				save_archetype (auth_aca, True, True)
			else
				create error_dialog.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_no_archetype_selected))
				error_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			end
		end

	export_source_archetype_as
			-- Export source archetype to a user-specified path
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if selection_history.has_validated_selected_archetype and attached {ARCH_LIB_AUTHORED_ARCHETYPE} selection_history.selected_archetype as auth_aca then
				save_archetype (auth_aca, True, False)
			else
				create error_dialog.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_no_archetype_selected))
				error_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			end
		end

	export_flat_archetype_as
			-- Export flat archetype to a user-specified path
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if selection_history.has_validated_selected_archetype and attached {ARCH_LIB_AUTHORED_ARCHETYPE} selection_history.selected_archetype as auth_aca then
				save_archetype (auth_aca, False, False)
			else
				create error_dialog.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_no_archetype_selected))
				error_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			end
		end

feature -- Search

	item_selectable: BOOLEAN
		do
			Result := is_populated
		end

	valid_item_id (a_key: STRING): BOOLEAN
			-- key is a valid identifier of an item managed in this tool
		do
			Result := (create {ARCHETYPE_HRID}.default_create).valid_id (a_key)
		end

	matching_ids (a_regex: STRING): ARRAYED_SET [STRING]
		do
			if attached source as src then
				Result := src.matching_ids (a_regex, Void, Void)
			else
				create Result.make(0)
			end
		end

	select_next
			-- Go to the next match for previous search, if available
		do
		end

	select_previous
			-- Go to the previous match for previous search, if available
		do
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

feature -- Modification

	set_docking_pane (a_docking_pane: SD_CONTENT)
		do
			docking_pane := a_docking_pane
		end

feature -- Events

	on_select_notebook
		do
			if attached source as src and attached ev_notebook.selected_item as sel_item and then attached sel_item.data as att_data then
				if att_data = compilation_stats_viewer then
					if src.can_build_statistics then
						compilation_stats_viewer.populate (src)
					end
				elseif att_data = archetypes_stats_viewer then
					if src.can_build_statistics then
						archetypes_stats_viewer.populate (src.archetype_statistics, True)
					end
				end
			end
		end

	on_full_compile
			-- actions to execute when a complete compile has been done
		do
			set_tabs_appearance
		end

	on_rotate_view
			-- rotate the view seen in the main grid area to the next available view
		do
			if attached ev_notebook.selected_item as att_sel_item and then attached {GUI_LIBRARY_TARGETTED_TOOL} att_sel_item.data as lib_tool and is_populated then
				lib_tool.on_rotate_view
			end
		end

	on_view_all_classes
			-- toggle show all classes in RM in main grid area
		do
			gui_agents.call_on_toggle_view_all_classes_agent (not show_entire_ontology)
		end

	update_explorers_and_select (ali_id: STRING)
			-- Populate archetype and template explorers and select new archetype in the archetype explorer
		do
			if attached source as src then
				archetype_explorer.populate (src)
				template_explorer.populate (src)
				archetype_explorer.select_item_in_tree (ali_id)
			end
		end

	update_archetype_explorer
			-- Populate archetype and template explorers but don't do any selecting
		do
			if attached source as src then
				archetype_explorer.populate (src)
			end
		end

feature {NONE} -- Implementation

	status_text: STRING
		once
			create Result.make (20)
		end

	ev_notebook: EV_NOTEBOOK

	do_clear
		do
			compilation_stats_viewer.clear
			archetypes_stats_viewer.clear
			archetype_explorer.clear
			ev_notebook.select_item (archetype_explorer.ev_root_container)
		end

	do_populate
			-- Populate content from visual controls.
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			docking_pane.set_short_title (get_text ({ADL_MESSAGES_IDS}.ec_library_tool_title))
			docking_pane.set_long_title (get_text ({ADL_MESSAGES_IDS}.ec_library_tool_title) + " " + current_library_name)
			if attached source as src then
				if src.archetype_count = 0 and not show_entire_ontology then
					create info_dialog.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_library_no_archetypes_found))
					info_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				else
					archetype_explorer.populate (src)
					if not old_current_library_name.is_equal (current_library_name) then
						archetype_explorer.set_semantic_view
					end
					template_explorer.populate (src)
					set_tabs_appearance
					on_select_notebook
					go_to_selected_item
				end
			end

			-- save this library name, so we can distinguish between a later change or refresh
			old_current_library_name := current_library_name.twin
		end

	docking_pane: detachable SD_CONTENT
		note
			option: stable
		attribute
		end

	old_current_library_name: STRING
		attribute
			create Result.make_empty
		end

	gui_mini_tool_bar: EVX_TOOL_BAR

	ev_progress_bar: EV_HORIZONTAL_PROGRESS_BAR

	initialise_progress_agt (a_val: INTEGER)
		do
			ev_progress_bar.value_range.resize_exactly (0, a_val)
		end

	set_progress_bar_current_value (a_val: INTEGER)
		do
			ev_progress_bar.set_value (a_val)
		end

	rotate_view_button: detachable EV_TOOL_BAR_BUTTON

	view_all_classes_button: detachable EV_TOOL_BAR_BUTTON

	archetype_explorer: GUI_ARCHETYPE_EXPLORER

	template_explorer: GUI_TEMPLATE_EXPLORER

	compilation_stats_viewer: GUI_COMPILATION_STATS_TOOL

	archetypes_stats_viewer: GUI_ARCHETYPE_STATISTICAL_REPORT

	set_tabs_appearance
			-- set visual appearance of stats & metric tab according to whether there are errors or not
		do
			if attached source as src and then src.can_build_statistics then
				ev_notebook.item_tab (compilation_stats_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/metrics"))
				ev_notebook.item_tab (archetypes_stats_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics"))
			else
				ev_notebook.item_tab (compilation_stats_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/metrics_grey"))
				ev_notebook.item_tab (archetypes_stats_viewer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics_grey"))
			end
			if attached source as src and then src.template_count > 0 then
				ev_notebook.item_tab (template_explorer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/template_catalog"))
			else
				ev_notebook.item_tab (template_explorer.ev_root_container).set_pixmap (get_icon_pixmap ("tool/template_catalog_grey"))
			end
		end

	save_archetype (aca: ARCH_LIB_AUTHORED_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN)
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
					dialog_title := get_text ({ADL_MESSAGES_IDS}.ec_save_archetype_title)
				else
					format_list := archetype_all_serialiser_formats
					dialog_title := get_text ({ADL_MESSAGES_IDS}.ec_export_archetype_title)
				end
				name := extension_replaced (aca.source_file_path, "")

				create save_dialog
				save_dialog.set_title (dialog_title)
				save_dialog.set_file_name (name)
				save_dialog.set_start_directory (last_user_save_directory)

				-- ask the user what format
				across format_list as formats_csr loop
					check attached archetype_file_extensions [formats_csr.item] as file_ext then
						save_dialog.filters.extend (["*" + file_ext,
							get_msg ({ADL_MESSAGES_IDS}.ec_save_archetype_as_type, <<formats_csr.item.as_upper>>)])
					end
				end

				save_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))

				if attached save_dialog.selected_button_name as save_sel_btn and then not save_sel_btn.is_equal (ev_cancel) then
					name := save_dialog.file_name.as_string_8
					if not name.is_empty then
						-- finalise the file path & create a handle
						set_last_user_save_directory (file_system.dirname (name))
						format := format_list [save_dialog.selected_filter_index]
						ext := archetype_file_extension (not diff_flag, format)
						if not file_system.has_extension (name, ext) then
							name.append (ext)
						end
						create file.make (name)

						-- if the file already exists, ask user about overwrite
						ok_to_write := True
						if file.exists then
							create question_dialog.make_with_text (get_msg ({GENERAL_MESSAGES_IDS}.ec_file_exists_replace_question, <<file_system.basename (name)>>))
							question_dialog.set_title (get_msg ({ADL_MESSAGES_IDS}.ec_save_archetype_as_type, <<format.as_upper>>))
							question_dialog.set_buttons (<<get_text ({GENERAL_MESSAGES_IDS}.ec_yes_response), get_text ({GENERAL_MESSAGES_IDS}.ec_no_response)>>)
							question_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
							ok_to_write := attached question_dialog.selected_button as q_sel_btn and then q_sel_btn.same_string (get_text ({GENERAL_MESSAGES_IDS}.ec_yes_response))
						end
						if ok_to_write then
							if diff_flag then
								aca.save_differential_as (name, format)
							else
								aca.save_flat_as (name, format, False)
							end
							gui_agents.call_console_tool_append_agent (aca.status)
						end
					end
				end
			else
				create error_dialog.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_compile_before_serialising))
				error_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			end
		end

	edit_archetype (auth_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
			-- Launch the external editor with the archetype currently selected in `archetype_directory'.
		local
			question_dialog: EV_QUESTION_DIALOG
			info_dialog: EV_INFORMATION_DIALOG
			path: STRING
			legacy_path: detachable STRING
			orig_time_stamp: INTEGER
		do
			-- figure out what file to edit
			path := auth_aca.source_file_path
			if auth_aca.file_mgr.has_legacy_flat_file then
				check attached auth_aca.file_mgr.legacy_flat_path as lfp then
					legacy_path := lfp
				end
				if auth_aca.has_source_file then
					create question_dialog.make_with_text (get_msg_line ({ADL_MESSAGES_IDS}.ec_edit_which_file_question,
						<<file_system.basename (path), file_system.basename (legacy_path)>>))
					question_dialog.set_title (get_msg ({ADL_MESSAGES_IDS}.ec_library_edit_differential_button_text, <<auth_aca.qualified_name>>))
					question_dialog.set_buttons (<<get_text ({ADL_MESSAGES_IDS}.ec_library_edit_differential_button_text), get_text ({ADL_MESSAGES_IDS}.ec_library_edit_adl14_button_text)>>)
					question_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
					if attached question_dialog.selected_button as att_sel_btn and then att_sel_btn.is_equal (get_text ({ADL_MESSAGES_IDS}.ec_library_edit_adl14_button_text)) then
						path := legacy_path
					end
				else
					create info_dialog.make_with_text (get_msg_line ({ADL_MESSAGES_IDS}.ec_edit_legacy_file_info,
						<<file_system.basename (legacy_path)>>))
					info_dialog.set_title (get_msg ({ADL_MESSAGES_IDS}.ec_library_edit_differential_button_text, <<auth_aca.id.physical_id>>))
					info_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
					path := legacy_path
				end
			end

			-- lauch editor process and wait for it
			orig_time_stamp := file_system.file_time_stamp (path)
			do_system_run_command_synchronous (editor_app_command + " %"" + path + "%"", Void)
			if file_system.file_time_stamp (path) > orig_time_stamp then
				gui_agents.call_select_archetype_agent (auth_aca)
			end
		end

	create_new_non_specialised_archetype (accn: ARCH_LIB_CLASS; an_arch_agent: detachable PROCEDURE [ANY, TUPLE[ARCHETYPE]])
		local
			dialog: NEW_ARCHETYPE_DIALOG
			match_ids: ARRAYED_SET [STRING]
			in_dir_path: STRING
			found: BOOLEAN
		do
			if attached source as src then
				-- default creation directory: top of library area
				in_dir_path := src.library_access.library_path

				-- try for a better path as the path of some other archetype of the same class
				match_ids := src.matching_ids (".*", accn.class_definition.name, Void)
				if not match_ids.is_empty then
					from match_ids.start until match_ids.off or found loop
						if attached {ARCH_LIB_AUTHORED_ARCHETYPE} src.archetype_with_id (match_ids.item) as alaa then
							in_dir_path := file_system.dirname (alaa.source_file_path)
							found := True
						end
						match_ids.forth
					end
				end

				-- display dialog for naming, file system location
				create dialog.make (in_dir_path, create {ARCHETYPE_HRID}.make_new (accn.qualified_name), src)
				dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				if dialog.is_valid then
					src.add_new_non_specialised_archetype (dialog.archetype_id, dialog.archetype_directory)

					if attached src.last_added_archetype as new_arch_lib_arch then
						-- execute agent on archetype, if passed
						if attached an_arch_agent as arch_agent and attached new_arch_lib_arch.differential_archetype as new_arch then
							an_arch_agent.call ([new_arch])
							new_arch_lib_arch.commit
						end
						archetype_explorer.populate (src)
						library_tool_agents.call_archetype_explorer_select_in_tree_agent (new_arch_lib_arch.id.physical_id)
					end
				end
				dialog.destroy
			end
		end

	create_new_specialised_archetype (parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
		local
			dialog: NEW_ARCHETYPE_DIALOG
		do
			if attached source as src then
				create dialog.make_specialised (file_system.dirname (parent_aca.source_file_path), parent_aca.id.deep_twin, parent_aca.id, src)
				dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				if dialog.is_valid then
					src.add_new_specialised_archetype (parent_aca, dialog.archetype_id, dialog.archetype_directory)
					archetype_explorer.populate (src)
					library_tool_agents.call_archetype_explorer_select_in_tree_agent (src.last_added_archetype.id.physical_id)
				end
				dialog.destroy
			end
		end

	create_new_template (parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
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
					check attached {ARCH_LIB_AUTHORED_ARCHETYPE} src.last_added_archetype as att_arch then
						library_tool_agents.call_update_explorers_and_select_agent (att_arch.id.as_string)
					end
				end
				dialog.destroy
			end
		end

end


