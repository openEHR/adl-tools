note
	component:   "openEHR ADL Tools"
	description: "Main window"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			show, create_interface_objects, initialize, is_in_default_state
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	EVX_UTILITIES
		export
			{NONE} all
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

	SHARED_GUI_HISTORY_TOOLBAR
		undefine
			copy, default_create
		end

	SHARED_XML_RULES
		undefine
			copy, default_create
		end

	SHARED_GUI_AGENTS
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	create_interface_objects
		local
			action_bar: EV_HORIZONTAL_BOX
			arch_compile_tool_bar: EV_TOOL_BAR
			tool_bar_sep_1: EV_TOOL_BAR_SEPARATOR
		do
			create ev_root_vbox

			-- connect the test tool in as an alternate view within ev_root_vbox
			ev_root_vbox.extend (test_tool.ev_root_container)
			test_tool.ev_root_container.hide

			create ev_main_vbox
			ev_root_vbox.extend (ev_main_vbox)


			-- ============== Action Bar ==============
			create action_bar
			action_bar.set_minimum_width (600)
			action_bar.set_padding (10)
			action_bar.set_border_width (4)
			ev_main_vbox.extend (action_bar)
			ev_main_vbox.disable_item_expand (action_bar)

			action_bar.extend (history_bar.tool_bar)
			action_bar.disable_item_expand (history_bar.tool_bar)

			-- repository combo
			create arch_libraries_combo
			arch_libraries_combo.set_tooltip (get_text (ec_library_cfg_combo_tooltip))
			arch_libraries_combo.set_minimum_width (160)
			arch_libraries_combo.disable_edit
			arch_libraries_combo.select_actions.extend (agent select_library)
			action_bar.extend (arch_libraries_combo)
			action_bar.disable_item_expand (arch_libraries_combo)

			-- compile tool bar
			create arch_compile_tool_bar
			action_bar.extend (arch_compile_tool_bar)
			action_bar.disable_item_expand (arch_compile_tool_bar)

			create compile_button
			compile_button.set_text (get_text (ec_compile_button_text))
			compile_button.set_pixmap (get_icon_pixmap ("tool/compile"))
			compile_button.set_tooltip (get_text (ec_compile_button_tooltip))
			compile_button.select_actions.extend (agent compile_toggle)
			arch_compile_tool_bar.extend (compile_button)

			create tool_bar_sep_1
			arch_compile_tool_bar.extend (tool_bar_sep_1)

			-- address bar
			action_bar.extend (address_bar.ev_root_container)
			arch_compile_tool_bar.disable_vertical_button_style


			-- ========== main tool view area ==============
			create viewer_main_cell
			ev_main_vbox.extend (viewer_main_cell)


			-- ========== Menu bar ==============
			create evx_menu_bar.make

			-- ========== File Menu ===========
			evx_menu_bar.add_menu (get_text (ec_menu_file_key), get_text (ec_file_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_file_open_key), get_text (ec_file_menu_open_text), get_icon_pixmap ("tool/open_archetype"), agent library_tool.open_adhoc_archetype)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_file_save_as_key), get_text (ec_file_menu_save_as_text), Void, agent library_tool.save_source_archetype_as)
			evx_menu_bar.add_menu_item (get_text (ec_menu_file_export_key), get_text (ec_file_menu_export_text), Void, agent library_tool.export_source_archetype_as)
			evx_menu_bar.add_menu_item (get_text (ec_menu_file_export_flat_key), get_text (ec_file_menu_export_flat_as_text), Void, agent library_tool.export_flat_archetype_as)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_file_exit_key), "E&xit", Void, agent exit_app)

			-- ================== Edit menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_edit_key), get_text (ec_edit_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_edit_copy_key), get_text (ec_edit_menu_copy_text), Void, agent text_widget_handler.on_copy)
			evx_menu_bar.add_menu_item (get_text (ec_menu_edit_select_all_key), get_text (ec_edit_menu_select_all_text), Void, agent text_widget_handler.on_select_all)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_edit_show_clipboard_key), get_text (ec_edit_menu_clipboard_text), Void, agent show_clipboard)

			-- ================== View menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_view_key), get_text (ec_view_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_view_differential_key), get_text (ec_view_menu_differential_text), get_icon_pixmap ("tool/diff_class"), agent on_differential_view)
			evx_menu_bar.add_menu_item (get_text (ec_menu_view_flat_key), get_text (ec_view_menu_flat_text), get_icon_pixmap ("tool/flat_class"), agent on_flat_view)
			evx_menu_bar.add_menu_item (get_text (ec_menu_view_new_archetype_tool_key), get_text (ec_view_menu_new_arch_tab_text), get_icon_pixmap ("tool/archetype_tool_new"), Void)
			evx_menu_bar.add_menu_item (get_text (ec_menu_view_new_class_tool_key), get_text (ec_view_menu_new_class_tab_text), get_icon_pixmap ("tool/class_tool_new"), Void)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_view_reset_layout_key), get_text (ec_view_menu_reset_layout_text), Void, agent on_reset_tool_layout)

			-- ================== History menu ==================
			history_bar.initialise_menu (evx_menu_bar)

			-- ================== AOM profile menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_aom_profiles_key), get_text (ec_aom_profiles_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_aom_profiles_configure_key), get_text (ec_aom_profiles_menu_configure_text), get_icon_pixmap ("tool/tools"), agent configure_aom_profiles)

			-- ================== Repository menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_archetypes_key), get_text (ec_archetypes_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_build_all_key), get_text (ec_archetypes_menu_build_all_text), Void, agent build_all)
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_rebuild_all_key), get_text (ec_archetypes_menu_rebuild_all_text), Void, agent rebuild_all)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_build_subtree_key), get_text (ec_archetypes_menu_build_subtree_text), Void, agent build_subtree)
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_rebuild_subtree_key), get_text (ec_archetypes_menu_rebuild_subtree_text), Void, agent rebuild_subtree)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_export_html_key), get_text (ec_archetypes_menu_export_html_text), Void, agent export_library (syntax_type_adl_html))
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_export_json_key), get_text (ec_archetypes_menu_export_json_text), Void, agent export_library (syntax_type_json))
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_export_yaml_key), get_text (ec_archetypes_menu_export_yaml_text), Void, agent export_library (syntax_type_yaml))
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_export_xml_key), get_text (ec_archetypes_menu_export_xml_text), Void, agent export_library (syntax_type_xml))
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_report_key), get_text (ec_archetypes_menu_export_report_text), Void, agent export_library_report)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item_disabled (get_text (ec_menu_archetypes_interrupt_build_key), get_text (ec_archetypes_menu_interrupt_text), Void, agent interrupt_build)
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_refresh_key), get_text (ec_archetypes_menu_refresh_text), Void, agent refresh_directory)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_archetypes_configure_key), get_text (ec_archetypes_menu_configure_text), get_icon_pixmap ("tool/tools"), agent configure_repositories)

			-- ================== RM Schemas menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_rm_schemas_key), get_text (ec_rm_schemas_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_rm_schemas_reload_key), get_text (ec_rm_schemas_reload_text), Void, agent reload_schemas)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_rm_schemas_configure_key), get_text (ec_rm_schemas_configure_text), get_icon_pixmap ("tool/tools"), agent set_rm_schemas)

			-- ================== XML menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_xml_key), get_text (ec_xml_menu_text))
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_xml_edit_rules_key), get_text (ec_xml_menu_edit_rules_text), get_icon_pixmap ("tool/tools"), agent set_xml_rules)

			-- ================== Tools menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_tools_key), get_text (ec_tools_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_tools_test_tool_key), get_text (ec_test_tool_title), Void, agent open_test_tool)
			evx_menu_bar.add_menu_item (get_text (ec_menu_tools_clean_files_key), get_text (ec_tools_menu_clean_text), Void, agent clean_generated_files)
			evx_menu_bar.add_menu_item (get_text (ec_menu_tools_adl_roundtrip_key), get_text (ec_tools_menu_adl_roundtrip_text),
				if adl_roundtripping then get_icon_pixmap ("tool/test_passed") else get_icon_pixmap ("tool/test_failed") end, agent toggle_adl_roundtripping)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_tools_options_key), get_text (ec_tools_menu_options_text), get_icon_pixmap ("tool/tools"), agent set_options)

			-- ================== Help menu ==================
			evx_menu_bar.add_menu (get_text (ec_menu_help_key), get_text (ec_help_menu_text))
			evx_menu_bar.add_menu_item (get_text (ec_menu_help_online_help_key), get_text (ec_help_menu_online_text), Void, agent show_online_help)
			evx_menu_bar.add_menu_item (get_text (ec_menu_help_release_notes_key), get_text (ec_help_menu_release_notes_text), Void, agent show_release_notes)
			evx_menu_bar.add_menu_separator
			evx_menu_bar.add_menu_item (get_text (ec_menu_help_external_tools_key), get_text (ec_help_menu_external_tools_text), Void, agent show_external_tools_help_page)
			evx_menu_bar.add_menu_item (get_text (ec_menu_help_ckm_key), get_text (ec_help_menu_ckm_text), Void, agent show_clinical_knowledge_manager)
			evx_menu_bar.add_menu_item (get_text (ec_menu_help_report_bug_key), get_text (ec_help_menu_report_bug_text), Void, agent show_bug_reporter)
			evx_menu_bar.add_menu_item (get_text (ec_menu_help_about_key), get_text (ec_help_menu_about_text), Void, agent show_about)
		end

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_TITLED_WINDOW}

			-- connect external process stdout agent to app console
			set_stderr_agent (agent external_process_console_update)
			set_stdout_agent (agent external_process_console_update)

--			-- basic UI parameters
--			set_minimum_width (500)
--			set_minimum_height (350)

			-- ensure size controlled
--			set_max_size_to_monitor (Current)

			set_title (get_msg (ec_main_window_title, <<latest_adl_version>>))
			close_request_actions.extend (agent exit_app)
			set_icon_pixmap (adl_workbench_logo)
			extend (ev_root_vbox)
			set_menu_bar (evx_menu_bar.ev_menu_bar)

			-- set up docking & tools
			create internal_docking_manager.make (viewer_main_cell, Current)
			create_new_library_tool
			create_new_rm_schema_explorer
			create_new_console_tool
			create_new_error_tool
			archetype_viewers.create_new_tool

			-- set up anything else dependent on docking
			evx_menu_bar.menu_item (get_text (ec_menu_view_new_class_tool_key)).select_actions.extend (agent class_tools.create_new_tool)
			evx_menu_bar.menu_item (get_text (ec_menu_view_new_archetype_tool_key)).select_actions.extend (agent archetype_viewers.create_new_tool)

			-- set UI feedback handlers
			archetype_compiler.set_console_update_action (agent compiler_console_update)
			archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)
			archetype_compiler.set_full_compile_visual_update_action (agent library_tool.on_full_compile)
			archetype_compiler.set_update_compilation_status (agent library_tool.update_compilation_status)

			-- accelerators
			initialise_accelerators

			-- UI callback agents
			initialise_ui_agents

			-- UI text widget handler set up (should be built into Vision)
			text_widget_handler.set_root (Current)

			-- UI app location
			initialise_ui_basic

			-- UI docking
			initialise_docking_layout

			-- permanent dialogs
			initialise_dialogs
		end

	initialise_ui_agents
			-- GUI agents
		do
			gui_agents.set_history_update_agent	(agent history_bar.populate)
			gui_agents.set_history_set_active_agent	(agent history_bar.set_active_tool)
			gui_agents.set_console_tool_append_agent (agent console_tool.append_text)
			gui_agents.set_select_archetype_agent (agent display_archetype)
			gui_agents.set_select_archetype_in_new_tool_agent (agent display_archetype_in_new_tool)
			gui_agents.set_edit_archetype_in_new_tool_agent (agent edit_archetype_in_new_tool)
			gui_agents.set_archetype_has_editor_agent (agent archetype_has_editor)
			gui_agents.set_select_class_agent (agent display_class)
			gui_agents.set_select_class_in_new_tool_agent (agent display_class_in_new_tool)
			gui_agents.set_select_class_in_rm_schema_tool_agent (agent select_class_in_rm_schema_tool)
			gui_agents.set_select_rm_agent (agent display_rm)
			gui_agents.set_select_rm_in_new_tool_agent (agent display_rm_in_new_tool)
			gui_agents.set_update_all_tools_rm_icons_setting_agent (agent update_all_tools_rm_icons_setting)
			gui_agents.set_refresh_archetype_viewers_agent (agent refresh_archetype_viewers)
			gui_agents.set_refresh_archetype_editors_agent (agent refresh_archetype_editors)
			gui_agents.set_select_archetype_from_gui_data_agent (agent select_archetype_from_gui_node)
			gui_agents.set_show_tool_with_artefact_agent (agent show_tool_with_artefact_agent)
			gui_agents.set_close_test_tool_agent (agent close_test_tool)
		end

	initialise_accelerators
			-- Initialise keyboard accelerators for various widgets.
		local
			evx_accelerators: EVX_ACCELERATORS
		do
			create evx_accelerators.make (accelerators)
			evx_menu_bar.set_accelerators (evx_accelerators)

			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_file_open_key), key_o, True, False, False)
			evx_menu_bar.add_menu_shortcut_for_action (get_text (ec_menu_edit_copy_key), agent text_widget_handler.call_unless_text_focused (agent text_widget_handler.on_copy), key_c, True, False, False)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_edit_select_all_key), key_a, True, False, False)

			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_view_differential_key), key_d, True, False, True)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_view_flat_key), key_f, True, False, True)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_view_new_archetype_tool_key), key_t, True, False, False)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_view_new_class_tool_key), key_t, True, False, True)

			history_bar.add_shortcuts

			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_archetypes_refresh_key), key_r, True, False, False)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_archetypes_interrupt_build_key), key_escape, False, False, True)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_archetypes_rebuild_subtree_key), key_f7, True, False, True)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_archetypes_build_subtree_key), key_f7, True, False, False)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_archetypes_rebuild_all_key), key_f7, False, False, True)
			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_archetypes_build_all_key), key_f7, False, False, False)

			evx_menu_bar.add_menu_shortcut (get_text (ec_menu_rm_schemas_reload_key), key_l, True, False, False)

			evx_accelerators.add_shortcut (agent text_widget_handler.step_focused_notebook_tab (1), key_tab, True, False, False)
			evx_accelerators.add_shortcut (agent text_widget_handler.step_focused_notebook_tab (-1), key_tab, True, False, True)
			evx_accelerators.add_shortcut (agent set_show_line_numbers (not show_line_numbers), key_l, True, False, False)
		end

	initialise_ui_basic
			-- initialise visual settings of window remembered from previous session
		do
			-- text widget handling
			text_widget_handler.focus_first_widget (viewer_main_cell)

			-- set app x,y position on screen
			if app_x_position > Sane_screen_coord and app_y_position > Sane_screen_coord then
				set_position (app_x_position, app_y_position)
			else
				set_position (10, 10)
			end

			-- set app width and height
			if app_width > 0 and app_height > 0 then
				set_size (app_width, app_height)
			else
				set_size (1024, 768)
			end
		end

	initialise_docking_layout
			-- initialise visual settings of window remembered from previous session
		local
			docking_file_to_use: detachable STRING
			docking_exception: BOOLEAN
		do
			if app_maximised then
				maximize
			end

			if not docking_exception then
				-- Determine which Docking layout file to read
				-- if the default one is the only one, or more recent than the user one, use it
				-- else use the user's one
				if file_system.file_exists (default_docking_layout_file_path) then
					if file_system.file_exists (user_docking_layout_file_path) then
						-- if the default docking layout is newer than the app's current one, then use it.
						if file_system.file_time_stamp (default_docking_layout_file_path) > file_system.file_time_stamp (user_docking_layout_file_path) or
							not last_exec_app_version.starts_with (app_version.version_to_minor)
						then
							docking_file_to_use := default_docking_layout_file_path
						else
							docking_file_to_use := user_docking_layout_file_path
						end
					end
				elseif file_system.file_exists (user_docking_layout_file_path) then
					docking_file_to_use := user_docking_layout_file_path
					console_tool.append_text (get_msg_line (ec_copy_docking_file, <<user_docking_layout_file_path, default_docking_layout_file_path>>))
					file_system.copy_file (user_docking_layout_file_path, default_docking_layout_file_path)
				else
					console_tool.append_text (get_msg_line (ec_no_docking_file_found, <<user_docking_layout_file_path, default_docking_layout_file_path>>))
				end

				if attached docking_file_to_use and then not internal_docking_manager.open_config_with_path (create {PATH}.make_from_string (docking_file_to_use)) then
					console_tool.append_text (get_msg_line (ec_read_docking_file_failed, <<user_docking_layout_file_path>>))
				end
			end
		rescue
			docking_exception := True
		end

	initialise_dialogs
			-- intiialise permanent dialogs
		do
			repository_dialog.do_nothing
		end

feature -- Commands

	show
		local
			missing_external_tools: ARRAYED_SET [STRING]
			missing_external_tools_msg: STRING
		do
			Precursor

			-- if no RM schemas yet available, ask user to configure
			if not directory_exists (rm_schema_directory) or not rm_schemas_access.found_valid_schemas then
				set_rm_schemas
			end

			-- if no repository access tool (git, svn etc), notify user
			create missing_external_tools.make (0)
			missing_external_tools.compare_objects
			across archetype_repository_interfaces as repos_csr loop
				if repos_csr.item.is_checkout_area and then not repos_csr.item.has_repository_tool then
					missing_external_tools.extend (repos_csr.item.repository_type)
				end
			end
			if not missing_external_tools.is_empty then
				create missing_external_tools_msg.make_empty
				across missing_external_tools as tool_names_csr loop
					missing_external_tools_msg.append (get_msg_line (ec_repository_tool_unavailable, <<tool_names_csr.item>>))
				end
				missing_external_tools_msg.append (get_text (ec_external_tools_help_text))
				info_feedback (missing_external_tools_msg)
			end

			-- if some RM schemas now found, set up a repository if necessary
			if rm_schemas_access.found_valid_schemas then
				rm_schema_explorer.populate (rm_schemas_access)
				if archetype_repository_interfaces.is_empty or archetype_library_interfaces.is_empty then
					configure_repositories
				else
					populate_arch_libraries_combo
					refresh_archetype_library (True)
				end
			end

			-- if no AOM profiles yet available, ask user to configure
			if not directory_exists (aom_profile_directory) or not aom_profiles_access.found_valid_profiles then
				configure_aom_profiles
			end

			console_tool.append_text (app_root.error_strings)
			console_tool.append_text (rm_schemas_access.error_strings)
		end

	open_test_tool
		do
			test_tool.ev_root_container.show
			ev_main_vbox.hide
			do_with_wait_cursor (Current, agent test_tool.populate)
		end

	close_test_tool
		do
			test_tool.ev_root_container.hide
			ev_main_vbox.show
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
			set_last_exec_app_version (app_version.out)

			app_cfg.save

			if test_tool.ev_root_container.is_show_requested then
				close_test_tool
			end
			if not internal_docking_manager.save_data_with_path (create {PATH}.make_from_string (user_docking_layout_file_path)) then
				console_tool.append_text (get_msg_line (ec_write_docking_file_failed, <<user_docking_layout_file_path>>))
			end

			ev_application.destroy
		end

feature -- View Events

	on_differential_view
			-- set differential view on currently visible Archetype and Class Tools
		do
			archetype_viewers.do_all_visible_tools (agent
				(a_viewer: GUI_ARCHETYPE_VIEWER) do a_viewer.select_differential_view end
			)
			class_tools.do_all_visible_tools (agent
				(a_tool: GUI_CLASS_TOOL) do a_tool.select_differential_view end
			)
		end

	on_flat_view
			-- set flat view on currently visible Tool
		do
			archetype_viewers.do_all_visible_tools (agent
				(a_viewer: GUI_ARCHETYPE_VIEWER) do a_viewer.select_flat_view end
			)
			class_tools.do_all_visible_tools (agent
				(a_tool: GUI_CLASS_TOOL) do a_tool.select_flat_view end
			)
		end

	on_reset_tool_layout
			-- Called by `select_actions' of `view_menu_reset_layout'.
			-- reset visual settings of window remembered to something sane
		do
			-- reset Docking layout
			if file_system.file_exists (default_docking_layout_file_path) then
				file_system.copy_file (default_docking_layout_file_path, user_docking_layout_file_path)
				initialise_docking_layout
			else
				console_tool.append_text (get_msg_line (ec_read_docking_file_failed, <<default_docking_layout_file_path>>))
			end
		end

feature {NONE} -- AOM profiles events

	configure_aom_profiles
		local
			dialog: AOM_PROFILE_DIALOG
		do
			create dialog
			dialog.show_modal_to_window (Current)

			dialog.destroy
		end

feature {NONE} -- Library events

	repository_dialog: REPOSITORY_DIALOG
		once ("PROCESS")
			create Result
		end

	configure_repositories
			-- Display the Repository dialog.
		do
			repository_dialog.show_modal_to_window (Current)
			repository_dialog.hide

			if repository_dialog.current_library_changed then
				save_resources
			end

			-- populate the profile combo box selectors
			populate_arch_libraries_combo

			-- if the current profile changed or was removed, repopulate the explorers
			if repository_dialog.current_library_changed then
				console_tool.clear
				if has_libraries then
					refresh_archetype_library (True)
				else
					library_tool.clear
				end
			end
		end

	select_library
			-- Called by `select_actions' of library selector
		do
			if not arch_libraries_combo.text.same_string (current_library_name) then
				console_tool.clear
				set_current_library_name (arch_libraries_combo.text)
			end
			refresh_archetype_library (False)
		end

	build_all
			-- Build the whole system.
		do
			console_tool.show
			do_build_action (agent archetype_compiler.build_all)
		end

	rebuild_all
			-- Force the whole system to rebuild.
		do
			console_tool.show
			do_build_action (agent archetype_compiler.rebuild_all)
		end

	build_subtree
			-- Build the subsystem below the currently selected node.
		do
			console_tool.show
			if library_tool.selection_history.has_selected_item and then attached library_tool.selected_item as sel_item then
				do_build_action (agent archetype_compiler.build_subtree (sel_item))
			end
		end

	rebuild_subtree
			-- Force rebuilding of the whole subsystem below the currently selected node.
		do
			console_tool.show
			if library_tool.selection_history.has_selected_item and then attached library_tool.selected_item as sel_item then
				do_build_action (agent archetype_compiler.rebuild_subtree (sel_item))
			end
		end

	compile_toggle
			-- start or stop current compilation
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

	export_library (a_syntax: STRING)
			-- Generate serialised form of flat archetypes into `export_library'/syntax.
		require
			Serialise_format_valid: has_archetype_native_serialiser_format (a_syntax) or has_dt_serialiser_format (a_syntax)
		local
			question_dialog: EV_QUESTION_DIALOG
			yes_text, no_text, cancel_text, export_dir: STRING
		do
			create question_dialog.make_with_text (get_msg_line (ec_export_question, <<a_syntax>>))
			question_dialog.set_title (get_msg (ec_export_in_format_dialog_title, <<a_syntax>>))
			yes_text := get_text (ec_build_and_export_all)
			no_text := get_text (ec_export_only_built)
			cancel_text := get_msg_line (ec_cancel_button_text, Void)
			question_dialog.set_buttons (<<yes_text, no_text, cancel_text>>)

			question_dialog.set_default_cancel_button (question_dialog.button (cancel_text))
			question_dialog.show_modal_to_window (Current)

			if not question_dialog.selected_button.same_string (cancel_text) then
				export_dir := file_system.pathname (export_directory, a_syntax)
				file_system.recursive_create_directory (export_dir)
				if not file_system.directory_exists (export_dir) then
					info_feedback (get_msg_line (ec_could_not_create_file_text, <<export_dir>>))
				else
					if question_dialog.selected_button.same_string (yes_text) then
						do_build_action (agent archetype_compiler.build_and_export_all (export_dir, a_syntax))
					elseif question_dialog.selected_button.same_string (no_text) then
						do_build_action (agent archetype_compiler.export_all (export_dir, a_syntax))
					end
				end
			end
		end

	export_library_report
			-- Export the contents of the current library Errors grid and other statistics to an XML file via a GUI file save dialog.
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			xml_name: STRING
		do
			if current_library.has_statistics then
				create save_dialog
				save_dialog.set_title (get_text (ec_export_report_dialog_title))
				save_dialog.set_file_name (Library_report_filename)
				save_dialog.set_start_directory (current_work_directory)
				save_dialog.filters.extend (["*" + File_ext_xml_default, get_msg (ec_save_archetype_as_type, <<Syntax_type_xml.as_upper>>)])
				save_dialog.show_modal_to_window (Current)
				xml_name := save_dialog.file_name.as_string_8

				if not xml_name.is_empty then
					set_current_work_directory (file_system.dirname (xml_name))

					if not file_system.has_extension (xml_name, File_ext_xml_default) then
						xml_name.append (File_ext_xml_default)
					end

					ok_to_write := True
					create file.make (xml_name)

					if file.exists then
						create question_dialog.make_with_text (get_msg_line (ec_file_exists_replace_question, <<xml_name>>))
						question_dialog.set_title (get_text (ec_export_report_dialog_title))
						question_dialog.set_buttons (<<get_text (ec_yes_response), get_text (ec_no_response)>>)
						question_dialog.show_modal_to_window (Current)
						ok_to_write := question_dialog.selected_button.same_string (get_text (ec_yes_response))
					end

					if ok_to_write then
						do_with_wait_cursor (Current, agent error_tool.export_library_report (xml_name))
						if file.exists then
							console_tool.append_text (get_msg (ec_export_library_report_replace_info, <<xml_name>>))
							show_in_system_browser (xml_name)
						else
							console_tool.append_text (get_msg (ec_export_library_report_replace_err, <<xml_name>>))
						end
					end
				end
			else
				info_feedback (get_text (ec_export_errors_stats_requires_build_text))
			end
		end

	refresh_directory
			-- reload current directory
		do
			refresh_archetype_library (True)
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
				save_resources
				if archetype_viewers.has_tools then
					update_all_tools_rm_icons_setting
				end
			end
			if dialog.has_changed_navigator_options and has_current_library then
				save_resources
				library_tool.populate (current_library)
				if test_tool.ev_root_container.is_displayed then
					test_tool.populate
				end
			end
		end

	update_all_tools_rm_icons_setting
		do
			archetype_viewers.do_all_tools (agent (a_tool: GUI_ARCHETYPE_VIEWER) do a_tool.update_rm_icons_setting end)
			class_tools.do_all_tools (agent (a_tool: GUI_CLASS_TOOL) do a_tool.update_rm_icons_setting end)
			library_tool.update_rm_icons_setting
		end

	clean_generated_files
			-- Remove all generated files in the current library and repopulate from scratch
		do
			if has_current_library then
				do_with_wait_cursor (Current, agent current_library.do_all_archetypes (agent delete_generated_files))
				refresh_archetype_library (True)
			end
		end

	delete_generated_files (ara: ARCH_LIB_ARCHETYPE_ITEM)
			-- delete a generated file associated with `ara'
		do
			ara.clean_generated
			console_tool.append_text (ara.status)
		end

	toggle_adl_roundtripping
			-- toggle roundtripping of successfully compiled ADL files, i.e. successful compile always causes a
			-- save (overwrite) of existing ADL source file with serialised. Used primarily to a) upgrade syntax
			-- and b) to get better whitespace formatting in source files.
		local
			question_dialog: EV_QUESTION_DIALOG
			yes_text, no_text, cancel_text: STRING
		do
			if not adl_roundtripping then
				create question_dialog.make_with_text (get_text (ec_roundtripping_question))
				question_dialog.set_title (get_text (ec_roundtripping_dialog_title))
				yes_text := get_text (ec_yes_response)
				no_text := get_text (ec_no_response)
				cancel_text := get_text (ec_cancel_button_text)
				question_dialog.set_buttons (<<yes_text, no_text, cancel_text>>)

				question_dialog.set_default_cancel_button (question_dialog.button (cancel_text))
				question_dialog.show_modal_to_window (Current)

				if question_dialog.selected_button.same_string (yes_text) then
					set_adl_roundtripping (True)
				end
			else
				set_adl_roundtripping (False)
			end
			evx_menu_bar.menu_item (get_text (ec_menu_tools_adl_roundtrip_key)).set_pixmap (
				if adl_roundtripping then get_icon_pixmap ("tool/test_passed") else
				get_icon_pixmap ("tool/test_failed") end)
		end

feature -- RM Schemas Events

	rm_schema_dialog: RM_SCHEMA_DIALOG
		once ("PROCESS")
			create Result
		end

	set_rm_schemas
			-- Called by `select_actions' of `tools_menu_rm_schemas'.
		do
			rm_schema_dialog.show_modal_to_window (Current)

			populate_arch_libraries_combo
			if rm_schema_dialog.has_changed_schema_load_list then
				console_tool.clear
				rm_schemas_access.reload_schemas
				if not rm_schemas_access.found_valid_schemas then
					console_tool.append_text (rm_schemas_access.error_strings)
				else
					rm_schema_explorer.populate (rm_schemas_access)
					if has_current_library then
						refresh_archetype_library (True)
					end
				end
			elseif rm_schema_dialog.has_changed_schema_dir then
				rm_schema_explorer.populate (rm_schemas_access)
				refresh_archetype_library (True)
			end
		end

	reload_schemas
			-- user-initiated reload
		do
			rm_schemas_access.reload_schemas
			refresh_archetype_library (True)
			rm_schema_explorer.populate (rm_schemas_access)
		end

feature {NONE} -- Help events

	show_online_help
			-- Display the application's online help in an external browser.
		do
			show_in_system_browser (adl_help_page_url)
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

	show_external_tools_help_page
			-- external tools help page in an external browser.
		do
			show_in_system_browser (external_tools_help_page_url)
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
			dialog.set_title (get_text (ec_about_awb_dialog_title))
			dialog.set_pixmap (adl_workbench_logo)
			dialog.set_background_color (Off_white_background_color)
--			dialog.set_position (app_x_position + (app_width - dialog.width) // 2, app_y_position + (app_height - dialog.height) // 2)
			dialog.show_modal_to_window (Current)
		end

feature -- Address Bar control

	address_bar: GUI_ADDRESS_BAR
		once ("PROCESS")
			create Result.make (agent windows_hide_combo_dropdown, agent windows_show_combo_dropdown)
			Result.add_client_control (library_tool)
			Result.add_client_control (rm_schema_explorer)
		end

feature -- Docking controls

	docking_manager: SD_DOCKING_MANAGER
			-- Attached `manager'
		require
			not_void: docking_manager_set
		local
			l_result: like internal_docking_manager
		do
			l_result := internal_docking_manager
			check attached l_result end
			Result := l_result
		end

	docking_manager_set: BOOLEAN
			-- If `internal_docking_manager' has been set?
		do
			Result := attached internal_docking_manager
		end

	tool_bar_content: detachable SD_TOOL_BAR_CONTENT
			-- Tool bar content

	show_tool_with_artefact_agent (an_id: STRING): BOOLEAN
		do
			Result := class_tools.show_docking_pane_by_tool_artefact_id (an_id) or else archetype_viewers.show_docking_pane_by_tool_artefact_id (an_id)
		end

feature -- RM Schema explorer

	rm_schema_explorer: GUI_RM_SCHEMA_EXPLORER
		once ("PROCESS")
			create Result.make
		end

	create_new_rm_schema_explorer
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (rm_schema_explorer.ev_root_container, get_icon_pixmap ("tool/rm_schema"), get_msg (ec_reference_models_docking_area_title, Void))
			docking_manager.contents.extend (a_docking_pane)
			rm_schema_explorer.set_docking_pane (a_docking_pane)
			a_docking_pane.set_long_title (get_msg (ec_reference_models_docking_area_title, Void))
			a_docking_pane.set_short_title (get_msg (ec_reference_models_docking_area_title, Void))
			a_docking_pane.set_type ({SD_ENUMERATION}.tool)
			a_docking_pane.set_auto_hide ({SD_ENUMERATION}.left)
			a_docking_pane.show_actions.extend (agent address_bar.set_current_client (rm_schema_explorer))
			a_docking_pane.focus_in_actions.extend (agent address_bar.set_current_client (rm_schema_explorer))
			a_docking_pane.focus_in_actions.extend (agent history_bar.set_active_tool (rm_schema_explorer))
		end

	select_class_in_rm_schema_tool (a_key: STRING)
			-- display a particular class in the RM schema tool
		do
			if rm_schema_explorer.valid_item_id (a_key) then
				rm_schema_explorer.select_item_by_id (a_key)
			end
		end

feature -- RM tools

	rm_tools: GUI_RM_TOOLS_CONTROLLER
		once ("PROCESS")
			create Result.make (docking_manager)
		end

	display_rm_in_new_tool (an_rm: BMM_SCHEMA)
		do
			rm_tools.create_new_tool
			rm_tools.populate_active_tool (an_rm)
		end

	display_rm (an_rm: BMM_SCHEMA)
			-- display a class selected in some tool
		do
			rm_tools.populate_active_tool (an_rm)
		end

feature -- library tool

	library_tool: GUI_LIBRARY_TOOL
		once ("PROCESS")
			create Result.make
		end

	create_new_library_tool
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (library_tool.ev_root_container, get_icon_pixmap ("tool/archetype_category"), get_msg (ec_library_tool_title, Void))
			if attached library_tool.mini_tool_bar then
				a_docking_pane.set_mini_toolbar (library_tool.mini_tool_bar)
			end
			library_tool.set_docking_pane (a_docking_pane)
			docking_manager.contents.extend (a_docking_pane)
			a_docking_pane.set_long_title (get_msg (ec_library_tool_title, Void))
			a_docking_pane.set_short_title (get_msg (ec_library_tool_title, Void))
			a_docking_pane.set_type ({SD_ENUMERATION}.tool)
			a_docking_pane.set_top ({SD_ENUMERATION}.left)
			a_docking_pane.show_actions.extend (agent address_bar.set_current_client (library_tool))
			a_docking_pane.focus_in_actions.extend (agent address_bar.set_current_client (library_tool))
			a_docking_pane.focus_in_actions.extend (agent history_bar.set_active_tool (library_tool))
		end

	select_archetype_from_gui_node (gui_item: EV_SELECTABLE)
			-- Select and display the node of `archetype_file_tree' corresponding to the folder or archetype attached to `gui_item'.
		do
			if attached gui_item and then attached {ARCH_LIB_ITEM} gui_item.data as aci then
				library_tool.select_item_by_id (aci.qualified_key)
			end
		end

feature -- Archetype viewers

	archetype_viewers: GUI_ARCHETYPE_VIEWERS_CONTROLLER
		once ("PROCESS")
			create Result.make (docking_manager)
		end

	display_archetype (aca: ARCH_LIB_ARCHETYPE_EDITABLE)
		do
			do_with_wait_cursor (Current, agent archetype_compiler.build_lineage (aca, 0))
			archetype_viewers.populate_active_tool (aca)
			archetype_viewers.active_tool.on_select_notebook
		end

	display_archetype_in_new_tool (aca: ARCH_LIB_ARCHETYPE_EDITABLE)
		do
			archetype_viewers.create_new_tool
			display_archetype (aca)
		end

feature -- Archetype editors

	archetype_editors: GUI_ARCHETYPE_EDITORS_CONTROLLER
		once ("PROCESS")
			create Result.make (docking_manager)
		end

	refresh_archetype_editors (an_archetype_id: READABLE_STRING_8)
			-- repopulate all editors of archetype with `an_archetype_id'
		do
			archetype_editors.do_all_tools (
				agent (a_tool: GUI_ARCHETYPE_EDITOR; an_id: READABLE_STRING_8)
					do
						if a_tool.source.id.physical_id.same_string (an_id) then
							a_tool.repopulate
						end
					end (?, an_archetype_id)
			)
		end

	edit_archetype_in_new_tool (aca: ARCH_LIB_ARCHETYPE_EDITABLE)
		do
			archetype_editors.create_new_tool
			archetype_editors.active_tool.enable_edit
			archetype_editors.populate_active_tool (aca)
			archetype_editors.active_tool.on_select_notebook
		end

	archetype_has_editor (aca: ARCH_LIB_ARCHETYPE_EDITABLE): BOOLEAN
		do
			Result := archetype_editors.has_docking_pane_with_tool_artefact_id (aca.id.physical_id)
		end

	refresh_archetype_viewers (an_archetype_id: READABLE_STRING_8)
			-- repopulate all viewers of archetype with `an_archetype_id'
		do
			archetype_viewers.do_all_tools (
				agent (a_tool: GUI_ARCHETYPE_VIEWER; an_id: READABLE_STRING_8)
					do
						if a_tool.source.id.physical_id.same_string (an_id) then
							a_tool.repopulate
						end
					end (?, an_archetype_id)
			)
		end

feature -- Class tool

	class_tools: GUI_CLASS_TOOL_CONTROLLER
		once
			create Result.make (docking_manager)
		end

	display_class_in_new_tool (a_class_def: BMM_CLASS)
		do
			class_tools.create_new_tool
			display_class (a_class_def)
		end

	display_class (a_class_def: BMM_CLASS)
			-- display a class selected in some tool
		do
			class_tools.populate_active_tool (a_class_def)
		end

feature -- Test tool

	test_tool: GUI_TEST_TOOL
		once ("PROCESS")
			create Result.make (agent info_feedback)
		end

	create_new_test_tool
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (test_tool.ev_root_container, get_icon_pixmap ("tool/tools"), get_text (ec_test_tool_title))
			docking_manager.contents.extend (a_docking_pane)
			a_docking_pane.set_long_title (get_text (ec_test_tool_title))
			a_docking_pane.set_short_title (get_text (ec_test_tool_title))
			a_docking_pane.set_type ({SD_ENUMERATION}.tool)
			a_docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

feature -- Console Tool

	console_tool: GUI_CONSOLE_TOOL
		once ("PROCESS")
			create Result.make
		end

	create_new_console_tool
		local
			docking_pane: SD_CONTENT
		do
			create docking_pane.make_with_widget_title_pixmap (console_tool.ev_console, get_icon_pixmap ("tool/console"), get_text (ec_console_tool_title))
			console_tool.set_docking_pane (docking_pane)
			docking_manager.contents.extend (docking_pane)
			docking_pane.set_type ({SD_ENUMERATION}.tool)
			docking_pane.set_long_title (get_text (ec_console_tool_title))
			docking_pane.set_short_title (get_text (ec_console_tool_title))
			docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

feature -- Error Tool

	error_tool: GUI_ERROR_TOOL
		once
			create Result.make (agent error_tool_title_update)
		end

	error_docking_pane: detachable SD_CONTENT
		note
			option: stable
		attribute
		end

	create_new_error_tool
		do
			create error_docking_pane.make_with_widget_title_pixmap (error_tool.ev_grid, get_icon_pixmap ("tool/errors"), get_text (ec_error_tool_title))
			docking_manager.contents.extend (error_docking_pane)
			error_docking_pane.set_type ({SD_ENUMERATION}.tool)
			error_docking_pane.set_long_title (get_msg (ec_error_tool_title, Void))
			error_docking_pane.set_short_title (get_msg (ec_error_tool_title, Void))
			error_docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

	error_tool_title_update (parse_error_count, validity_error_count, warning_count: INTEGER)
		do
			error_docking_pane.set_short_title (get_msg (ec_error_tool_title, Void) + " (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
			error_docking_pane.set_long_title (get_msg (ec_error_tool_title, Void) + " (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
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

	info_feedback (a_message: STRING)
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_message)
			info_dialog.set_title ("Information")
			info_dialog.show_modal_to_window (Current)
		end

	text_widget_handler: EVX_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours
		once
			-- FIXME: create with a dummy EV_CONTAINER initially; the argument should be 'Current', i.e the MAIN_WINDOW,
			-- but we can't supply it when this call gets made because 'make' has not finished yet, and 'Current' doesn't
			-- pass the void-safety test. So we give it a fake for now, and set the real root at the end of the make routine
			create Result.set_root (create {EV_CELL})
		end

	save_resources
			-- Save the application configuration file and update the status area.
		do
			app_cfg.save
			console_tool.append_text (get_msg (ec_cfg_file_i1, <<user_config_file_path>>))
		end

	refresh_archetype_library (refresh_from_source: BOOLEAN)
			-- Rebuild archetype library & repopulate relevant GUI parts.
		do
			do_with_wait_cursor (Current, agent do_refresh_archetype_library (refresh_from_source))
		end

	do_refresh_archetype_library (refresh_from_source: BOOLEAN)
			-- refresh current archetype library - revert to uncompiled state for all archetypes.
			-- If `refresh_from_source' is true, then re-read files from library source location as well
		do
			console_tool.show
			if has_current_library then
				console_tool.append_text (get_msg_line (ec_populating_directory_start, <<current_library_name>>))
				use_current_library (refresh_from_source)
				console_tool.append_text (current_library.error_strings)
				console_tool.append_text (get_msg_line (ec_populating_directory_complete, Void))

				clear_toolbar_controls
				error_tool.clear

				library_tool.populate (current_library)
			else
				clear_toolbar_controls
				library_tool.clear
			end
		end

	clear_toolbar_controls
			-- Wipe out content from visual controls.
		do
			history_bar.clear
			address_bar.clear
		end

	populate_arch_libraries_combo
			-- Initialise the dialog's widgets from shared settings.
		do
			arch_libraries_combo.select_actions.block
			arch_libraries_combo.change_actions.block
			if not archetype_library_interfaces.is_empty then
				arch_libraries_combo.set_strings (archetype_library_interfaces.keys)
				if has_current_library then
					arch_libraries_combo.do_all (
						agent (li: EV_LIST_ITEM)
							do
								if li.text.same_string (current_library_name) then li.enable_select end
							end
					)
				end
			else
				arch_libraries_combo.wipe_out
			end
			arch_libraries_combo.select_actions.resume
			arch_libraries_combo.change_actions.resume
		end

	populate_compile_button
		do
			if not archetype_compiler.is_building then
				compile_button.set_pixmap (get_icon_pixmap ("tool/compile"))
			else
				compile_button.set_pixmap (get_icon_pixmap ("tool/pause"))
			end
		end

feature {NONE} -- Build commands

	do_build_action (action: PROCEDURE [ANY, TUPLE])
			-- Perform `action', with an wait mouse cursor and disabling the build menus, until done.
		local
			build_started: BOOLEAN
		do
			if not build_started then
				evx_menu_bar.disable_menu_items (<<get_text (ec_menu_archetypes_build_all_key), get_text (ec_menu_archetypes_rebuild_all_key),
					get_text (ec_menu_archetypes_build_subtree_key), get_text (ec_menu_archetypes_rebuild_subtree_key), get_text (ec_menu_archetypes_export_html_key)>>)
				evx_menu_bar.enable_menu_items (<<get_text (ec_menu_archetypes_interrupt_build_key)>>)
				build_started := True
				do_with_wait_cursor (Current, action)
			end

			evx_menu_bar.enable_menu_items (<<get_text (ec_menu_archetypes_build_all_key), get_text (ec_menu_archetypes_rebuild_all_key),
					get_text (ec_menu_archetypes_build_subtree_key), get_text (ec_menu_archetypes_rebuild_subtree_key), get_text (ec_menu_archetypes_export_html_key)>>)
			evx_menu_bar.disable_menu_items (<<get_text (ec_menu_archetypes_interrupt_build_key)>>)
		rescue
			retry
		end

	compiler_console_update (a_msg: STRING)
			-- Update GUI with progress on build.
		do
			populate_compile_button
			console_tool.append_text (a_msg)
		end

	compiler_archetype_gui_update (aca: ARCH_LIB_ARCHETYPE_ITEM)
			-- Update GUI with progress on build.
		do
			library_tool.update_tree_node (aca)
			ev_application.process_events
		end

	external_process_console_update (a_msg: STRING)
			-- Update GUI with progress on build.
		do
			ev_application.do_once_on_idle (agent console_tool.append_text (a_msg))
		end

feature {NONE} -- GUI Widgets

	internal_docking_manager: detachable SD_DOCKING_MANAGER
			-- Docking manager

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

	windows_hide_combo_dropdown (a_combo: EV_COMBO_BOX)
		do
			if attached {EV_COMBO_BOX_IMP} a_combo.implementation as imp then
				(create {GUI_PLATFORM_SPECIFIC_TOOLS}).hide_combo_box_list (imp)
			end
		end

	windows_show_combo_dropdown (a_combo: EV_COMBO_BOX)
		do
			if attached {EV_COMBO_BOX_IMP} a_combo.implementation as imp then
				(create {GUI_PLATFORM_SPECIFIC_TOOLS}).show_combo_box_list (imp)
			end
		end

	ev_main_vbox, ev_root_vbox: EV_VERTICAL_BOX
	viewer_main_cell: EV_CELL
	evx_menu_bar: EVX_MENU_BAR
	arch_libraries_combo: EV_COMBO_BOX
	compile_button: EV_TOOL_BAR_BUTTON

end


