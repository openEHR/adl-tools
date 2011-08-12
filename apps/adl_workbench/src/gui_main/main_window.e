note
	component:   "openEHR Archetype Project"
	description: "Main window"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	MAIN_WINDOW

inherit
	MAIN_WINDOW_IMP
		redefine
			show
		end

	WINDOW_ACCELERATORS
		undefine
			copy, default_create
		end

	SHARED_APP_ROOT
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		undefine
			copy, default_create
		end

	SHARED_XML_RULES
		undefine
			copy, default_create
		end

	GUI_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	user_initialization
			-- called by `initialize'.
			-- Any custom user initialization that could not be performed in `initialize',
			-- (due to regeneration of implementation class) can be added here.
		local
			cur_title: STRING
			dv_q: DV_QUANTITY
		do
			-- connect controls
			ev_main_vbox.extend (action_bar)
			action_bar.extend (archetype_profile_combo)
			action_bar.extend (arch_compile_tool_bar)
			arch_compile_tool_bar.extend (compile_button)
			arch_compile_tool_bar.extend (tool_bar_sep_1)
			arch_compile_tool_bar.extend (open_button)
			arch_compile_tool_bar.extend (tool_bar_sep_2)
			arch_compile_tool_bar.extend (history_back_button)
			arch_compile_tool_bar.extend (tool_bar_sep_3)
			arch_compile_tool_bar.extend (history_forward_button)
			action_bar.extend (arch_id_hbox)
			arch_id_hbox.extend (archetype_search_combo)
			arch_id_hbox.extend (arch_search_tool_bar)
			arch_search_tool_bar.extend (search_button)

			-- ADL output version combo
			action_bar.extend (arch_output_version_hbox)
			arch_output_version_hbox.extend (arch_output_version_label)
			arch_output_version_hbox.extend (arch_output_version_combo)

			ev_main_vbox.extend (viewer_main_cell)

			-- set visual characteristics - menu
			set_icon_pixmap (adl_workbench_icon)
			cur_title := title.twin.as_string_8
			cur_title.replace_substring_all ("VER", latest_adl_version)
			set_title (cur_title)

			file_menu_open.set_pixmap (pixmaps ["open_archetype"])
			file_menu_parse.set_pixmap (pixmaps ["parse"])
			file_menu_edit.set_pixmap (pixmaps ["edit"])
			history_menu_back.set_pixmap (pixmaps ["history_back"])
			history_menu_forward.set_pixmap (pixmaps ["history_forward"])

			view_menu_differential.set_pixmap (pixmaps ["diff"])
			view_menu_flat.set_pixmap (pixmaps ["flat"])

			repository_menu_set_repository.set_pixmap (pixmaps ["tools"])
			rm_schemas_menu_configure_rm_schemas.set_pixmap (pixmaps ["tools"])
			tools_menu_options.set_pixmap (pixmaps ["tools"])

			-- set visual characteristics - action bar
			ev_main_vbox.disable_item_expand (action_bar)
			action_bar.set_minimum_width (800)
			action_bar.set_padding (10)
			action_bar.set_border_width (4)
			action_bar.disable_item_expand (archetype_profile_combo)
			action_bar.disable_item_expand (arch_compile_tool_bar)
			archetype_profile_combo.set_tooltip ("Select repository profile")
			archetype_profile_combo.set_minimum_width (160)
			archetype_profile_combo.disable_edit
			arch_compile_tool_bar.disable_vertical_button_style
			compile_button.set_text ("Compile")
			compile_button.set_pixmap (pixmaps ["compile"])
			compile_button.set_tooltip ("Compile all archetypes (F7)")
			open_button.set_text ("Open")
			open_button.set_tooltip ("Open an ad hoc archetype")
			history_back_button.set_tooltip ("Go back one archetype")
			history_forward_button.set_tooltip ("Go forward one archetype")
			arch_id_hbox.disable_item_expand (arch_search_tool_bar)
			archetype_search_combo.set_tooltip ("Display or search for archetype id")
			archetype_search_combo.set_minimum_width (600)
			arch_search_tool_bar.set_minimum_width (20)
			arch_search_tool_bar.set_minimum_height (20)
			arch_search_tool_bar.disable_vertical_button_style
			search_button.set_tooltip ("Search for archetype id")

			open_button.set_pixmap (pixmaps ["open_archetype"])
			history_back_button.set_pixmap (pixmaps ["history_back"])
			history_forward_button.set_pixmap (pixmaps ["history_forward"])
			search_button.set_pixmap (pixmaps ["magnifier"])

			action_bar.disable_item_expand (arch_output_version_hbox)
			arch_output_version_hbox.disable_item_expand (arch_output_version_label)
			arch_output_version_hbox.disable_item_expand (arch_output_version_combo)
			arch_output_version_combo.set_minimum_width (50)
			arch_output_version_label.set_text ("ADL output version: ")
			arch_output_version_label.set_tooltip ("Release of ADL and AOM XSD to use in output serialisation")
			arch_output_version_combo.set_strings (Adl_versions)
			populate_arch_output_version_combo

			-- set up docking
			create docking_manager.make (viewer_main_cell, Current)
			create_new_catalogue_tool
			create_new_console_tool
			create_new_error_tool
			create_new_statistics_tool
			create_new_test_tool
			archetype_tools.create_new_tool

			-- set up events
			edit_menu_copy.select_actions.extend (agent text_widget_handler.on_copy)
			edit_menu_select_all.select_actions.extend (agent text_widget_handler.on_select_all)

			view_menu_differential.select_actions.extend (agent on_differential_view)
			view_menu_flat.select_actions.extend (agent on_flat_view)
			view_menu_new_tab.select_actions.extend (agent archetype_tools.create_new_tool)

			compile_button.select_actions.extend (agent compile)
			open_button.select_actions.extend (agent open_archetype)
			history_back_button.select_actions.extend (agent on_back)
			history_forward_button.select_actions.extend (agent on_forward)
			archetype_search_combo.select_actions.extend (agent select_archetype_from_search_key)
			archetype_search_combo.return_actions.extend (agent find_archetype_by_key)
			search_button.select_actions.extend (agent start_search_by_id)
			archetype_profile_combo.select_actions.extend (agent select_profile)

			arch_output_version_combo.select_actions.extend (agent set_adl_version_from_combo)

			-- set UI feedback handlers
			archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
			archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)

			-- text widget handling
			text_widget_handler.focus_first_widget (viewer_main_cell)

			-- accelerators
			initialise_accelerators
		end

	user_create_interface_objects
			-- Feature for custom user interface object creation, called at end of `create_interface_objects'.
		do
			create action_bar
			create archetype_profile_combo
			create arch_compile_tool_bar
			create compile_button
			create tool_bar_sep_1
			create open_button
			create tool_bar_sep_2
			create history_back_button
			create tool_bar_sep_3
			create history_forward_button
			create arch_id_hbox
			create archetype_search_combo
			create arch_search_tool_bar
			create search_button

			create arch_output_version_hbox
			create arch_output_version_label
			create arch_output_version_combo

			create viewer_main_cell
		end

	initialise_accelerators
			-- Initialise keyboard accelerators for various widgets.
		do
			add_shortcut (agent text_widget_handler.step_focused_notebook_tab (1), key_tab, True, False, False)
			add_shortcut (agent text_widget_handler.step_focused_notebook_tab (-1), key_tab, True, False, True)

			add_menu_shortcut (file_menu_open, key_o, True, False, False)
			add_menu_shortcut (file_menu_save_as, key_s, True, False, False)
			add_menu_shortcut_for_action (edit_menu_copy, agent text_widget_handler.call_unless_text_focused (agent text_widget_handler.on_copy), key_c, True, False, False)
			add_menu_shortcut (edit_menu_select_all, key_a, True, False, False)

			add_menu_shortcut (view_menu_differential, key_d, True, False, True)
			add_menu_shortcut (view_menu_flat, key_f, True, False, True)
			add_menu_shortcut (view_menu_new_tab, key_t, True, False, False)

			add_menu_shortcut (repository_menu_build_all, key_f7, False, False, False)
			add_menu_shortcut (repository_menu_rebuild_all, key_f7, False, False, True)
			add_menu_shortcut (repository_menu_build_subtree, key_f7, True, False, False)
			add_menu_shortcut (repository_menu_rebuild_subtree, key_f7, True, False, True)
			add_menu_shortcut (repository_menu_interrupt_build, key_escape, False, False, True)
			add_menu_shortcut (repository_menu_refresh, key_r, True, False, False)

			add_menu_shortcut (rm_schemas_menu_reload_schemas, key_l, True, False, False)

			add_menu_shortcut (history_menu_back, key_left, False, True, False)
			add_menu_shortcut (history_menu_forward, key_right, False, True, False)
		end

	initialise_session_ui_basic
			-- initialise visual settings of window remembered from previous session
		do
			if app_x_position > Sane_screen_coord and app_y_position > Sane_screen_coord then
				set_position (app_x_position, app_y_position)
			else
				set_position (app_initial_x_position, app_initial_y_position)
			end

			if app_width > 0 and app_height > 0 then
				set_size (app_width, app_height)
			else
				set_size (app_initial_width, app_initial_height)
			end
		end

	initialise_session_ui_layout
			-- initialise visual settings of window remembered from previous session
		do
			if app_maximised then
				maximize
			end

			-- Docking layout
			if file_system.file_exists (user_docking_layout_file_path) then
				if not docking_manager.open_config (user_docking_layout_file_path) then
					console_tool.append_text (create_message_line ("read_docking_file_failed", <<user_docking_layout_file_path>>))
				end
			elseif file_system.file_exists (default_docking_layout_file_path) then
				if not docking_manager.open_config (default_docking_layout_file_path) then
					console_tool.append_text (create_message_line ("read_docking_file_failed", <<default_docking_layout_file_path>>))
				end
			end

			-- Splitter layout
			initialise_splitter (test_tool.ev_root_container, test_split_position)
			initialise_splitter (catalogue_tool.ev_root_container, catalogue_split_position)
		end

feature -- Status setting

	show
			-- Do a few adjustments and load the repository before displaying the window.
		do
			append_billboard_to_status_area

			initialise_session_ui_basic
			Precursor
			initialise_session_ui_layout

			if text_editor_command.is_empty then
				set_text_editor_command (default_text_editor_command)
			end

			if editor_app_command.is_empty then
				set_editor_app_command (default_editor_app_command)
			end

			if difftool_command.is_empty then
				set_difftool_command (default_difftool_command)
			end

			-- if no RM schemas yet available, ask user to configure
			if not directory_exists (rm_schema_directory) or not rm_schemas_access.found_valid_schemas then
				set_rm_schemas
			end

			-- if some RM schemas now found, set up a repository if necessary
			if rm_schemas_access.found_valid_schemas then
				if repository_profiles.current_reference_repository_path.is_empty then
					set_repository
				else
					populate_archetype_profile_combo
					populate_directory_controls (True)
				end
			end

			append_billboard_to_status_area
		end

feature -- File events

	open_archetype
			-- Let the user select an ADL file, and then load and parse it.
		local
			dialog: EV_FILE_OPEN_DIALOG
			fname: STRING
		do
			create dialog
			dialog.set_start_directory (current_work_directory)
			dialog.filters.extend (["*" + File_ext_archetype_source, "ADL source files"])
			dialog.filters.extend (["*" + File_ext_archetype_adl14, "ADL legacy flat files"])
			dialog.show_modal_to_window (Current)
			fname := dialog.file_name.as_string_8

			if not fname.is_empty then
				if not source_repositories.adhoc_source_repository.has_path (fname) then
					set_current_work_directory (file_system.dirname (fname))
					if not file_system.file_exists (fname) then
						(create {EV_INFORMATION_DIALOG}.make_with_text ("%"" + fname + "%" not found.")).show_modal_to_window (Current)
					elseif has_current_profile then
						current_arch_cat.add_adhoc_item (fname)
						catalogue_tool.populate
						console_tool.append_text (billboard.content)
					end
				else
					(create {EV_INFORMATION_DIALOG}.make_with_text ("%"" + fname + "%" already added.")).show_modal_to_window (Current)
				end
			end
		end

	parse_archetype
			-- Load and parse the archetype currently selected in `archetype_directory'.
		do
			if has_current_profile and then attached {ARCH_CAT_ARCHETYPE} current_arch_cat.selected_archetype as ara then
				clear_all_archetype_view_controls
				do_with_wait_cursor (Current, agent archetype_compiler.build_lineage (ara, 0))
				archetype_tools.current_tool.on_select_archetype_notebook
			end
		end

	edit_archetype
			-- Launch the external editor with the archetype currently selected in `archetype_directory'.
		local
			question_dialog: EV_QUESTION_DIALOG
			info_dialog: EV_INFORMATION_DIALOG
			path: STRING
		do
			if has_current_profile and then attached {ARCH_CAT_ARCHETYPE} current_arch_cat.selected_archetype as ara then
				path := ara.differential_path
				if ara.has_differential_file and ara.has_legacy_flat_file then
					create question_dialog.make_with_text (create_message_line("edit_which_file_question", <<file_system.basename (path), file_system.basename (ara.legacy_flat_path)>>))
					question_dialog.set_title ("Edit " + ara.ontological_name)
					question_dialog.set_buttons (<<"Differential", "Legacy (flat)">>)
					question_dialog.show_modal_to_window (Current)

					if question_dialog.selected_button.starts_with ("L") then
						path := ara.legacy_flat_path
					end
				elseif ara.has_legacy_flat_file then
					create info_dialog.make_with_text (create_message_line("edit_legacy_file_info", <<file_system.basename (ara.legacy_flat_path)>>))
					info_dialog.set_title ("Edit " + ara.id.as_string)
					info_dialog.show_modal_to_window (Current)
					path := ara.legacy_flat_path
				end

				execution_environment.launch (editor_app_command + " %"" + path + "%"")
			end
		end

	save_archetype_as
			-- Save to an ADL or HTML file via a GUI file save dialog.
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			name, format: STRING
		do
			if attached current_arch_cat as dir and then dir.has_validated_selected_archetype then
				name := extension_replaced (dir.selected_archetype.full_path, "")

				create save_dialog
				save_dialog.set_title ("Save Archetype")
				save_dialog.set_file_name (name)
				save_dialog.set_start_directory (current_work_directory)

				from archetype_serialiser_formats.start until archetype_serialiser_formats.off loop
					format := archetype_serialiser_formats.item
					save_dialog.filters.extend (["*" + archetype_file_extensions [format], "Save as " + format.as_upper])
					archetype_serialiser_formats.forth
				end

				save_dialog.show_modal_to_window (Current)
				name := save_dialog.file_name.as_string_8

				if not name.is_empty then
					set_current_work_directory (file_system.dirname (name))
					format := archetype_serialiser_formats [save_dialog.selected_filter_index]

					if not file_system.has_extension (name, archetype_file_extensions [format]) then
						name.append (archetype_file_extensions [format])
					end

					ok_to_write := True
					create file.make (name)

					if file.exists then
						create question_dialog.make_with_text (create_message_content ("file_exists_replace_question", <<file_system.basename (name)>>))
						question_dialog.set_title ("Save as " + format.as_upper)
						question_dialog.set_buttons (<<"Yes", "No">>)
						question_dialog.show_modal_to_window (Current)
						ok_to_write := question_dialog.selected_button.same_string ("Yes")
					end

					if ok_to_write then
						dir.selected_archetype.save_differential_as (name, format)
						console_tool.append_text (dir.selected_archetype.status)
					end
				end
			else
				create error_dialog.make_with_text (create_message_content ("compile_before_serialising", Void))
				error_dialog.show_modal_to_window (Current)
			end
		end

	exit_app
			-- Terminate the application, saving the window location.
		do
			set_app_width (width)
			set_app_height (height)
			if not is_minimized then
				set_app_x_position (x_position)
				set_app_y_position (y_position)
			end
			set_app_maximised (is_maximized)
			set_test_split_position (test_tool.ev_root_container.split_position)
			set_catalogue_split_position (catalogue_tool.ev_root_container.split_position)

			app_cfg.save

			if docking_manager.save_data (user_docking_layout_file_path) then
			end

			ev_application.destroy
		end

feature -- View Events

	on_differential_view
		do
			if archetype_tools.has_current_tool then
				archetype_tools.current_tool.select_differential_view
			end
		end

	on_flat_view
		do
			if archetype_tools.has_current_tool then
				archetype_tools.current_tool.select_flat_view
			end
		end

	on_reset_tool_layout
			-- Called by `select_actions' of `view_menu_reset_layout'.
			-- reset visual settings of window remembered to something sane
		do
			-- reset Docking layout
			if file_system.file_exists (default_docking_layout_file_path) then
				file_system.copy_file (default_docking_layout_file_path, user_docking_layout_file_path)
				initialise_session_ui_layout
			else
				console_tool.append_text (create_message_line ("read_docking_file_failed", <<default_docking_layout_file_path>>))
			end
		end


feature {NONE} -- Repository events

	set_repository
			-- Display the Repository Settings dialog.
		local
			dialog: REPOSITORY_DIALOG
			any_profile_changes_made: BOOLEAN
			current_profile_removed: BOOLEAN
			current_profile_changed: BOOLEAN
		do
			create dialog
			dialog.show_modal_to_window (Current)

			any_profile_changes_made := dialog.any_profile_changes_made
			if any_profile_changes_made then
				current_profile_removed := dialog.current_profile_removed
				current_profile_changed := dialog.current_profile_changed
				save_resources_and_show_status
			end

			dialog.destroy

			-- if anything changed, repopulate the profile combo box selectors
			if dialog.any_profile_changes_made then
				populate_archetype_profile_combo
			end

			-- if the current profile changed or was removed, repopulate the explorers
			if current_profile_removed or current_profile_changed then
				console_tool.clear
				populate_directory_controls (True)
			end
		end

	select_profile
			-- Called by `select_actions' of `archetype_profile_combo' and `test_profile_combo'
		do
			if not archetype_profile_combo.text.same_string (repository_profiles.current_profile_name) then
				console_tool.clear
				set_current_profile (archetype_profile_combo.text)
			end
			populate_directory_controls (False)
			clear_all_tools
		end

	build_all
			-- Build the whole system.
		do
			do_build_action (agent archetype_compiler.build_all)
		end

	rebuild_all
			-- Force the whole system to rebuild.
		do
			error_tool.clear
			do_build_action (agent archetype_compiler.rebuild_all)
		end

	build_subtree
			-- Build the subsystem below the currently selected node.
		do
			do_build_action (agent archetype_compiler.build_subtree)
		end

	rebuild_subtree
			-- Force rebuilding of the whole subsystem below the currently selected node.
		do
			do_build_action (agent archetype_compiler.rebuild_subtree)
		end

	compile
		do
			if archetype_compiler.is_building then
				interrupt_build
			else
				build_all
			end
		end

	interrupt_build
			-- Cancel the build currently in progress.
		do
			archetype_compiler.signal_interrupt
		end

	export_html
			-- Generate HTML from flat archetypes into `html_export_directory'.
		local
			dialog: EV_QUESTION_DIALOG
			yes_text, no_text: STRING
		do
			create dialog.make_with_text (create_message_line ("export_html_question", Void))
			dialog.set_title ("Export HTML")
			yes_text := create_message_content ("build_and_export_all", Void)
			no_text := create_message_content ("export_only_built", Void)
			dialog.set_buttons (<<yes_text, no_text, "Cancel">>)

			dialog.set_default_cancel_button (dialog.button ("Cancel"))
			dialog.show_modal_to_window (Current)

			if dialog.selected_button.same_string (yes_text) then
				do_build_action (agent archetype_compiler.build_and_export_all_html (html_export_directory))
			elseif dialog.selected_button.same_string (no_text) then
				do_build_action (agent archetype_compiler.export_all_html (html_export_directory))
			end
		end

	export_repository_report
			-- Export the contents of the Errors grid and other statistics to an XML file via a GUI file save dialog.
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			xml_name: STRING
		do
			create save_dialog
			save_dialog.set_title ("Export Repository Report")
			save_dialog.set_file_name ("ArchetypeRepositoryReport.xml")
			save_dialog.set_start_directory (current_work_directory)
			save_dialog.filters.extend (["*.xml", "Save as XML"])
			save_dialog.show_modal_to_window (Current)
			xml_name := save_dialog.file_name.as_string_8

			if not xml_name.is_empty then
				set_current_work_directory (file_system.dirname (xml_name))

				if not file_system.has_extension (xml_name, ".xml") then
					xml_name.append (".xml")
				end

				ok_to_write := True
				create file.make (xml_name)

				if file.exists then
					create question_dialog.make_with_text (create_message_line ("file_exists_replace_question", <<xml_name>>))
					question_dialog.set_title ("Export Repository Report")
					question_dialog.set_buttons (<<"Yes", "No">>)
					question_dialog.show_modal_to_window (Current)
					ok_to_write := question_dialog.selected_button.same_string ("Yes")
				end

				if ok_to_write then
					do_with_wait_cursor (Current, agent error_tool.export_repository_report (xml_name))

					if file.exists then
						console_tool.append_text (create_message_line ("export_repository_report_replace_info", <<xml_name>>))
						show_in_system_browser (xml_name)
					else
						console_tool.append_text (create_message_line ("export_repository_report_replace_err", <<xml_name>>))
					end
				end
			end
		end

	refresh_directory
			-- reload current directory
		do
			populate_directory_controls (True)
		end

feature {NONE} -- History events

	on_history
			-- On opening the History menu, append the list of recent archetypes.
		do
			history_menu.wipe_out
			history_menu.extend (history_menu_back)
			history_menu.extend (history_menu_forward)
			history_menu.extend (history_menu_separator)

			if attached current_arch_cat as cat then
				cat.recently_selected_archetypes (20).do_all (agent (aca: attached ARCH_CAT_ARCHETYPE)
					local
						mi: EV_MENU_ITEM
					do
						create mi.make_with_text (aca.id.as_string)
						mi.select_actions.extend (agent select_archetype_from_gui_data (mi))
						mi.set_data (aca)
						history_menu.extend (mi)
					end)
			end
		end

	on_back
			-- Go back to the last archetype previously selected.
		do
			if attached current_arch_cat as cat then
				if cat.selection_history_has_previous then
					cat.selection_history_back
					catalogue_tool.go_to_selected_archetype
					populate_history_controls
				end
			end
		end

	on_forward
			-- Go forth to the next archetype previously selected.
		do
			if attached current_arch_cat as cat then
				if cat.selection_history_has_next then
					cat.selection_history_forth
					catalogue_tool.go_to_selected_archetype
					populate_history_controls
				end
			end
		end

feature {NONE} -- XML Menu events

	set_xml_rules
			-- Called by `select_actions' of `xml_menu_conv_rules'.
		do
			execution_environment.launch (text_editor_command + " %"" + xml_rules_file_path + "%"")
			mark_xml_rules_put_of_date -- assume that the user makes a change; not very scientific, but good enough for now
		end

feature {NONE} -- Tools menu events

	set_options
			-- Display the Options dialog.
		local
			dialog: OPTION_DIALOG
		do
			create dialog
			dialog.show_modal_to_window (Current)

			if dialog.has_changed_ui_options then
				save_resources_and_show_status
				populate_arch_output_version_combo
				if repository_profiles.has_current_profile and then current_arch_cat.has_selected_archetype then
					archetype_tools.populate_current_tool
				end
			end
			if dialog.has_changed_navigator_options and repository_profiles.has_current_profile then
				catalogue_tool.populate
				test_tool.populate
			end
		end

	clean_generated_files
			-- Remove all generated files below the repository directory and repopulate from scratch
		do
			if has_current_profile then
				do_with_wait_cursor (Current, agent current_arch_cat.do_all_archetypes (agent delete_generated_files))
				populate_directory_controls (True)
			end
		end

	delete_generated_files (ara: attached ARCH_CAT_ARCHETYPE)
			-- delete a generated file associated with `ara'
		do
			ara.clean_generated
			console_tool.append_text (ara.status)
		end

feature -- RM Schemas Events

	set_rm_schemas
			-- Called by `select_actions' of `tools_menu_rm_schemas'.
		local
			dialog: RM_SCHEMA_DIALOG
		do
			create dialog
			dialog.show_modal_to_window (Current)

			populate_archetype_profile_combo
			if dialog.has_changed_schema_load_list then
				console_tool.clear
				rm_schemas_access.load_schemas
				if not rm_schemas_access.found_valid_schemas then
					append_billboard_to_status_area

					-- FIXME: reset rm schema load list back?
				else
					populate_directory_controls(True)
				end
			elseif dialog.has_changed_schema_dir then
				populate_directory_controls(True)
			end
		end

	reload_schemas
			-- user-initiated reload
		do
			rm_schemas_access.load_schemas
			populate_directory_controls(True)
		end

feature {NONE} -- Help events

	show_online_help
			-- Display the application's online help in an external browser.
		do
			show_in_system_browser (adl_help_page_url)
		end

	show_icon_help
			-- Display the icons help dialog.
		do
			(create {ICON_DIALOG}).show_modal_to_window (Current)
		end

	show_release_notes
			-- Display news about the latest release.
		do
			show_in_system_browser (Release_notes_file_path)
		end

	show_clinical_knowledge_manager
			-- Display CKM in an external browser.
		do
			show_in_system_browser (clinical_knowledge_manager_url)
		end

	show_bug_reporter
			-- Display the problem reporter in an external browser.
		do
			show_in_system_browser (bug_reporter_url)
		end

	show_about
			-- Display the application's About box.
		local
			dialog: EV_INFORMATION_DIALOG
		do
			create dialog.make_with_text (splash_text)
			dialog.set_title ("About ADL Workbench")
			dialog.set_pixmap (pixmaps ["adl_workbench_logo"])
			dialog.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
			dialog.set_position (app_x_position + (app_width - dialog.width) // 2, app_y_position + (app_height - dialog.height) // 2)
			dialog.show_modal_to_window (Current)
		end

feature -- Archetype Events

	find_archetype_by_key
			-- Called by `return_actions' of `archetype_search_combo'.
		local
			key: STRING
			matching_ids: attached ARRAYED_SET[STRING]
		do
			key := archetype_search_combo.text

			if is_windows and archetype_search_combo.is_list_shown then
				if attached {EV_COMBO_BOX_IMP} archetype_search_combo.implementation as imp then
					(create {GUI_PLATFORM_SPECIFIC_TOOLS}).hide_combo_box_list (imp)
				end
				catalogue_tool.select_archetype (key)

			elseif key.count > 0 then
				archetype_search_combo.select_actions.block

				-- check if it is a full archetype id, e.g. created by slightly modifying current archetype id
				if (create {ARCHETYPE_ID}.default_create).valid_id (key) then
					catalogue_tool.select_archetype (key)
				elseif key.count >= 3 then
					 -- it is a partial id, get a list of candidates
					if attached current_arch_cat as dir then
						matching_ids := dir.matching_ids (regex_from_string(key), Void, Void)
						if matching_ids.count > 0 then
							archetype_search_combo.set_strings (matching_ids)
							if attached {EV_COMBO_BOX_IMP} archetype_search_combo.implementation as imp then
								(create {GUI_PLATFORM_SPECIFIC_TOOLS}).show_combo_box_list (imp)
							end
						else
							archetype_search_combo.set_text (create_message_content ("no_match_found", Void))
							archetype_search_combo.set_focus
							archetype_search_combo.select_all
						end
					end

					if archetype_search_combo.count = 1 then
						catalogue_tool.select_archetype (key)
					end
				else -- key too short
					archetype_search_combo.set_text (create_message_content ("key_too_short", Void))
					archetype_search_combo.set_focus
					archetype_search_combo.select_all
				end

				archetype_search_combo.select_actions.resume
			end
		end

	select_archetype_from_search_key
			-- Called by `select_actions' of `archetype_search_combo'.
			-- archetype_search_combo.text is guaranteed to be a valid archetype id, and one that is in the current repository
		do
			if not (is_windows and archetype_search_combo.is_list_shown) then
				catalogue_tool.select_archetype (archetype_search_combo.text)
			end
		end

	start_search_by_id
			-- Called by `select_actions' of `search_button'.
		do
			archetype_search_combo.wipe_out
			archetype_search_combo.set_text (create_message_content ("enter_search_string", Void))
			archetype_search_combo.set_focus
			archetype_search_combo.select_all
		end

	select_archetype_from_gui_data (gui_item: EV_ANY)
			-- Select and display the node of `archetype_file_tree' corresponding to the folder or archetype attached to `gui_item'.
		do
			if attached gui_item and has_current_profile then
				if attached {ARCH_CAT_ITEM} gui_item.data as aci then
					current_arch_cat.set_selected_item (aci)
					catalogue_tool.go_to_selected_archetype
				end
			end
		end

	display_class
			-- display the class currently selected in `archetype_catalogue'.
		do
			if attached current_arch_cat as cat and then cat.has_selected_class then
				class_map_tools.populate_current_tool
			end
		end

feature -- Docking controls

	attached_docking_manager: SD_DOCKING_MANAGER
			-- Attached `manager'
		require
			not_void: docking_manager /= Void
		local
			l_result: like docking_manager
		do
			l_result := docking_manager
			check l_result /= Void end -- Implied by precondition `not_void'
			Result := l_result
		ensure
			not_void: Result /= Void
		end

	docking_manager: detachable SD_DOCKING_MANAGER
			-- Docking manager

	tool_bar_content: detachable SD_TOOL_BAR_CONTENT
			-- Tool bar content

feature -- Catalogue tool

	catalogue_tool: GUI_CATALOGUE_TOOL
		once
			create Result.make (agent parse_archetype, agent edit_archetype, agent create_and_populate_new_archetype_tool, agent display_class, agent create_and_populate_new_class_tool)
		end

	create_new_catalogue_tool
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (catalogue_tool.ev_root_container, pixmaps ["archetype_category"], "Catalogue")
			attached_docking_manager.contents.extend (a_docking_pane)
			a_docking_pane.set_long_title ("Catalogue")
			a_docking_pane.set_short_title ("Catalogue")
			a_docking_pane.set_type ({SD_ENUMERATION}.tool)
			a_docking_pane.set_top ({SD_ENUMERATION}.left)
		end

feature -- Test tool

	test_tool: GUI_TEST_ARCHETYPE_TREE_CONTROL
		once
			create Result.make (agent statistics_tool.populate, agent info_feedback)
		end

	create_new_test_tool
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (test_tool.ev_root_container, pixmaps ["tools"], "Test")
			attached_docking_manager.contents.extend (a_docking_pane)
			a_docking_pane.set_long_title ("Test")
			a_docking_pane.set_short_title ("Test")
			a_docking_pane.set_type ({SD_ENUMERATION}.tool)
			a_docking_pane.set_auto_hide ({SD_ENUMERATION}.right)
		end

feature -- Archetype tools

	archetype_tools: GUI_ARCHETYPE_TOOLS_CONTROLLER
		once
			create Result.make (attached_docking_manager, agent select_archetype_from_gui_data)
		end

	create_and_populate_new_archetype_tool
		do
			archetype_tools.create_new_tool
			if current_arch_cat.has_selected_archetype then
				archetype_tools.populate_current_tool
			end
		end

feature -- Class map tool

	class_map_tools: GUI_CLASS_MAP_TOOL_CONTROLLER
		once
			create Result.make (attached_docking_manager)
		end

	create_and_populate_new_class_tool
		do
			class_map_tools.create_new_tool
			if current_arch_cat.has_selected_class then
				class_map_tools.populate_current_tool
			end
		end

feature -- Console Tool

	console_tool: GUI_CONSOLE_TOOL
		once
			create Result.make
		end

	create_new_console_tool
		local
			docking_pane: SD_CONTENT
		do
			create docking_pane.make_with_widget_title_pixmap (console_tool.ev_console, pixmaps ["console"], "Console")
			attached_docking_manager.contents.extend (docking_pane)
			docking_pane.set_type ({SD_ENUMERATION}.tool)
			docking_pane.set_long_title ("Console")
			docking_pane.set_short_title ("Console")
			docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

feature -- Error Tool

	error_tool: GUI_ERROR_TOOL
		once
			create Result.make (agent select_archetype_from_gui_data, agent error_tool_title_update)
		end

	error_docking_pane: SD_CONTENT

	create_new_error_tool
		do
			create error_docking_pane.make_with_widget_title_pixmap (error_tool.grid, pixmaps ["errors"], "Errors")
			attached_docking_manager.contents.extend (error_docking_pane)
			error_docking_pane.set_type ({SD_ENUMERATION}.tool)
			error_docking_pane.set_long_title ("Errors")
			error_docking_pane.set_short_title ("Errors")
			error_docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

	error_tool_title_update (parse_error_count, validity_error_count, warning_count: NATURAL)
		do
			error_docking_pane.set_short_title ("Errors (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
			error_docking_pane.set_long_title ("Errors (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
		end

feature -- Statistics Tool

	statistics_tool: GUI_STATISTICS_TOOL
		once
			create Result.make
		end

	create_new_statistics_tool
		local
			docking_pane: SD_CONTENT
		do
			create docking_pane.make_with_widget_title_pixmap (statistics_tool.ev_root_container, pixmaps ["info"], "Statistics")
			attached_docking_manager.contents.extend (docking_pane)
			docking_pane.set_type ({SD_ENUMERATION}.tool)
			docking_pane.set_long_title ("Statistics")
			docking_pane.set_short_title ("Statistics")
			docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

feature -- Clipboard

	show_clipboard
			-- Display the current contents of the clipboard.
		local
			dialog: EV_INFORMATION_DIALOG
		do
			create dialog.make_with_text (ev_application.clipboard.text)
			dialog.set_title ("Clipboard Contents")
			dialog.show_modal_to_window (Current)
		end

feature {NONE} -- Implementation

	info_feedback (a_message: attached STRING)
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_message)
			info_dialog.set_title ("Information")
			info_dialog.show_modal_to_window (Current)
		end

	text_widget_handler: GUI_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours
		once
			create Result.make (Current)
		end

	append_billboard_to_status_area
			-- Append bilboard contents to `parser_status_area' and clear billboard.
		do
			console_tool.append_text (billboard.content)
			billboard.clear
		end

	save_resources_and_show_status
			-- Save the application configuration file and update the status area.
		do
			app_cfg.save
			post_info (Current, "save_resources_and_show_status", "cfg_file_i1", <<user_config_file_path>>)
		end

	populate_directory_controls (refresh: BOOLEAN)
			-- Rebuild archetype directory & repopulate relevant GUI parts.
		do
			do_with_wait_cursor (Current, agent do_populate_directory_controls (refresh))
		end

	do_populate_directory_controls (refresh: BOOLEAN)
		do
			if title.has_substring (" - ") then
				set_title (title.substring (title.substring_index (" - ", 1) + 3, title.count))
			end

			set_title (repository_profiles.current_reference_repository_path + " - " + title)

			console_tool.append_text (create_message_line ("populating_directory_start", <<repository_profiles.current_profile_name>>))
			use_current_profile (refresh)
			console_tool.append_text (create_message_line ("populating_directory_complete", Void))

			clear_all_archetype_view_controls
			error_tool.clear

			append_billboard_to_status_area

			catalogue_tool.populate
			test_tool.populate
			statistics_tool.populate
		end

	clear_all_archetype_view_controls
			-- Wipe out content from visual controls.
		do
			populate_history_controls
			archetype_search_combo.remove_text
		end

	clear_all_tools
		do
			class_map_tools.clear
			archetype_tools.clear
		end

	populate_archetype_profile_combo
			-- Initialise the dialog's widgets from shared settings.
		do
			archetype_profile_combo.select_actions.block
			archetype_profile_combo.change_actions.block
			if not repository_profiles.is_empty then
				archetype_profile_combo.set_strings (repository_profiles.names)
				if repository_profiles.has_current_profile then
					archetype_profile_combo.do_all (agent (li: EV_LIST_ITEM) do if li.text.same_string (repository_profiles.current_profile_name) then li.enable_select end end)
				end
			else
				archetype_profile_combo.wipe_out
			end
			archetype_profile_combo.select_actions.resume
			archetype_profile_combo.change_actions.resume
		end

	populate_compile_button
		do
			if not archetype_compiler.is_building then
				compile_button.set_pixmap (pixmaps ["compile"])
			else
				compile_button.set_pixmap (pixmaps ["pause"])
			end
		end

	populate_history_controls
		do
			if has_current_profile and then current_arch_cat.selection_history_has_previous then
				history_menu_back.enable_sensitive
				history_back_button.enable_sensitive
			else
				history_menu_back.disable_sensitive
				history_back_button.disable_sensitive
			end

			if has_current_profile and then current_arch_cat.selection_history_has_next then
				history_menu_forward.enable_sensitive
				history_forward_button.enable_sensitive
			else
				history_menu_forward.disable_sensitive
				history_forward_button.disable_sensitive
			end
		end

	populate_arch_output_version_combo
		do
			arch_output_version_combo.do_all (
				agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (adl_version_for_flat_output) then
							li.enable_select
						end
					end
			)
		end

feature {GUI_TEST_ARCHETYPE_TREE_CONTROL} -- Statistics

	populate_statistics
			-- Populate the statistics tab.
		do
			statistics_tool.populate
		end

feature {NONE} -- Build commands

	do_build_action (action: attached PROCEDURE [ANY, TUPLE])
			-- Perform `action', with an hourglass mouse cursor and disabling the build menus, until done.
		local
			menu_items: ARRAY [EV_MENU_ITEM]
		do
			if menu_items = Void then
				menu_items := <<
					repository_menu_build_all,
					repository_menu_rebuild_all,
					repository_menu_build_subtree,
					repository_menu_rebuild_subtree,
					repository_menu_export_html
				>>

				menu_items.do_all (agent {EV_MENU_ITEM}.disable_sensitive)
				repository_menu_interrupt_build.enable_sensitive
				do_with_wait_cursor (Current, action)
			end

			menu_items.do_all (agent {EV_MENU_ITEM}.enable_sensitive)
			repository_menu_interrupt_build.disable_sensitive
		rescue
			retry
		end

	compiler_global_gui_update (msg: attached STRING)
			-- Update GUI with progress on build.
		do
			populate_compile_button
			console_tool.append_text (msg)
			ev_application.process_events
		end

	compiler_archetype_gui_update (msg: attached STRING; aca: attached ARCH_CAT_ARCHETYPE; dependency_depth: INTEGER)
			-- Update GUI with progress on build.
		do
			if not msg.is_empty then
				console_tool.append_text (indented (msg, create {STRING}.make_filled ('%T', dependency_depth)))
			end

			catalogue_tool.update (aca)

			test_tool.do_row_for_item (aca)

			if aca.last_compile_attempt_timestamp /= Void then
				error_tool.extend_and_select (aca)
				statistics_tool.populate

				if attached current_arch_cat then
					if aca = current_arch_cat.selected_archetype then
						archetype_tools.populate_current_tool
					end
				end
			end

			ev_application.process_events
		end

	set_adl_version_from_combo
			-- set ADL version
		do
			set_adl_version_for_flat_output (arch_output_version_combo.selected_text.as_string_8)
		end

feature {NONE} -- GUI Widgets

	action_bar, arch_id_hbox, arch_output_version_hbox: EV_HORIZONTAL_BOX
	archetype_profile_combo, archetype_search_combo, arch_output_version_combo: EV_COMBO_BOX
	arch_compile_tool_bar, arch_search_tool_bar: EV_TOOL_BAR
	compile_button, open_button, history_back_button, history_forward_button, search_button: EV_TOOL_BAR_BUTTON
	tool_bar_sep_1, tool_bar_sep_2, tool_bar_sep_3: EV_TOOL_BAR_SEPARATOR
	arch_output_version_label: EV_LABEL

	viewer_main_cell: EV_CELL

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
--| The Original Code is main_window.e.
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
