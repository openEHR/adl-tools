note
	component:   "openEHR Archetype Project"
	description: "Main window"
	keywords:    "AWB, archetypes, workbench"
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
	EV_TITLED_WINDOW
		redefine
			show, initialize, is_in_default_state
		end

	GUI_DEFINITIONS
		undefine
			is_equal, default_create, copy
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

	SHARED_GUI_HISTORY_TOOLBAR
		undefine
			copy, default_create
		end

	SHARED_XML_RULES
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_SERIALISERS
		undefine
			copy, default_create
		end

	SHARED_GUI_AGENTS
		export
			{NONE} all
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

	frozen initialize
			-- Initialize `Current'.
		do
			Precursor {EV_TITLED_WINDOW}

			set_minimum_width (500)
			set_minimum_height (350)
			set_maximum_width (2000)
			set_maximum_height (2000)
			set_title (get_msg ("main_window_title", <<latest_adl_version>>))
			close_request_actions.extend (agent exit_app)
			set_icon_pixmap (adl_workbench_icon)



			create ev_main_vbox
			extend (ev_main_vbox)

			-- ============== Action Bar ==============
			create action_bar
			action_bar.set_minimum_width (600)
			action_bar.set_padding (10)
			action_bar.set_border_width (4)
			ev_main_vbox.extend (action_bar)
			ev_main_vbox.disable_item_expand (action_bar)

			action_bar.extend (history_bar.tool_bar)
			action_bar.disable_item_expand (history_bar.tool_bar)

			-- profile combo
			create archetype_profile_combo
			archetype_profile_combo.set_tooltip (get_msg ("profile_combo_tooltip", Void))
			archetype_profile_combo.set_minimum_width (160)
			archetype_profile_combo.disable_edit
			archetype_profile_combo.select_actions.extend (agent select_profile)
			action_bar.extend (archetype_profile_combo)
			action_bar.disable_item_expand (archetype_profile_combo)

			-- compile tool bar
			create arch_compile_tool_bar
			action_bar.extend (arch_compile_tool_bar)
			action_bar.disable_item_expand (arch_compile_tool_bar)

			create compile_button
			compile_button.set_text (get_text ("compile_button_text"))
			compile_button.set_pixmap (get_icon_pixmap ("tool/compile"))
			compile_button.set_tooltip (get_text ("compile_button_tooltip"))
			compile_button.select_actions.extend (agent compile_toggle)
			arch_compile_tool_bar.extend (compile_button)

			create tool_bar_sep_1
			arch_compile_tool_bar.extend (tool_bar_sep_1)

			-- address bar
			action_bar.extend (address_bar.ev_root_container)

			-- ADL output version hbox
			create arch_output_version_hbox
			action_bar.extend (arch_output_version_hbox)
			action_bar.disable_item_expand (arch_output_version_hbox)

			create arch_output_version_label
			arch_output_version_label.set_text (get_text ("adl_version_label_text"))
			arch_output_version_label.set_tooltip (get_text ("adl_version_label_tooltip"))
			arch_output_version_hbox.extend (arch_output_version_label)
			arch_output_version_hbox.disable_item_expand (arch_output_version_label)

			create arch_output_version_combo
			arch_output_version_combo.set_strings (Adl_versions)
			arch_output_version_combo.set_minimum_width (50)
			arch_output_version_combo.select_actions.extend (agent set_adl_version_from_combo)
			arch_output_version_hbox.extend (arch_output_version_combo)
			arch_output_version_hbox.disable_item_expand (arch_output_version_combo)

			arch_compile_tool_bar.disable_vertical_button_style


			-- ========== main tool view area ==============
			create viewer_main_cell
			ev_main_vbox.extend (viewer_main_cell)


			-- ========== Menu ==============
			create menu
			set_menu_bar (menu)


			-- ============== File Menu ===========
			create file_menu
			file_menu.set_text (get_msg ("file_menu_text", Void))
			menu.extend (file_menu)

			create file_menu_open
			file_menu_open.set_text (get_msg ("file_menu_open_text", Void))
			file_menu_open.select_actions.extend (agent catalogue_tool.open_archetype)
			file_menu_open.set_pixmap (get_icon_pixmap ("tool/open_archetype"))
			file_menu.extend (file_menu_open)

			create l_ev_menu_separator_1
			file_menu.extend (l_ev_menu_separator_1)

			create file_menu_save_as
			file_menu_save_as.set_text (get_msg ("file_menu_save_as_text", Void))
			file_menu_save_as.select_actions.extend (agent catalogue_tool.save_source_archetype_as)
			file_menu.extend (file_menu_save_as)

			create file_menu_export_as
			file_menu_export_as.set_text (get_msg ("file_menu_export_text", Void))
			file_menu_export_as.select_actions.extend (agent catalogue_tool.export_source_archetype_as)
			file_menu.extend (file_menu_export_as)

			create file_menu_export_flat_as
			file_menu_export_flat_as.set_text (get_msg ("file_menu_export_flat_as_text", Void))
			file_menu_export_flat_as.select_actions.extend (agent catalogue_tool.export_flat_archetype_as)
			file_menu.extend (file_menu_export_flat_as)

			create l_ev_menu_separator_2
			file_menu.extend (l_ev_menu_separator_2)

			create file_menu_exit
			file_menu_exit.set_text ("E&xit")
			file_menu_exit.select_actions.extend (agent exit_app)
			file_menu.extend (file_menu_exit)



			-- ================== Edit menu ==================
			create edit_menu
			edit_menu.set_text (get_msg ("edit_menu_text", Void))
			menu.extend (edit_menu)

			create edit_menu_copy
			edit_menu_copy.set_text (get_msg ("edit_menu_text", Void))
			edit_menu_copy.select_actions.extend (agent text_widget_handler.on_copy)
			edit_menu.extend (edit_menu_copy)

			create edit_menu_select_all
			edit_menu_select_all.set_text (get_msg ("edit_menu_select_all_text", Void))
			edit_menu_select_all.select_actions.extend (agent text_widget_handler.on_select_all)
			edit_menu.extend (edit_menu_select_all)

			create l_ev_menu_separator_3
			edit_menu.extend (l_ev_menu_separator_3)

			create edit_menu_clipboard
			edit_menu_clipboard.set_text (get_msg ("edit_menu_clipboard_text", Void))
			edit_menu_clipboard.select_actions.extend (agent show_clipboard)
			edit_menu.extend (edit_menu_clipboard)



			-- ================== View menu ==================
			create view_menu
			view_menu.set_text (get_msg ("view_menu_text", Void))
			menu.extend (view_menu)

			create view_menu_differential
			view_menu_differential.set_pixmap (get_icon_pixmap ("tool/diff_class"))
			view_menu_differential.set_text (get_msg ("view_menu_differential_text", Void))
			view_menu_differential.select_actions.extend (agent on_differential_view)
			view_menu.extend (view_menu_differential)

			create view_menu_flat
			view_menu_flat.set_pixmap (get_icon_pixmap ("tool/flat_class"))
			view_menu_flat.set_text (get_msg ("view_menu_flat_text", Void))
			view_menu_flat.select_actions.extend (agent on_flat_view)
			view_menu.extend (view_menu_flat)

			create view_menu_new_archetype_tool
			view_menu_new_archetype_tool.set_text (get_msg ("view_menu_new_arch_tab_text", Void))
			view_menu_new_archetype_tool.set_pixmap (get_icon_pixmap ("tool/archetype_tool_new"))
			view_menu.extend (view_menu_new_archetype_tool)

			create view_menu_new_class_tool
			view_menu_new_class_tool.set_text (get_msg ("view_menu_new_class_tab_text", Void))
			view_menu_new_class_tool.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
			view_menu.extend (view_menu_new_class_tool)

			create l_ev_menu_separator_4
			view_menu.extend (l_ev_menu_separator_4)

			create view_menu_reset_layout
			view_menu_reset_layout.set_text (get_msg ("view_menu_reset_layout_text", Void))
			view_menu_reset_layout.select_actions.extend (agent on_reset_tool_layout)
			view_menu.extend (view_menu_reset_layout)


			-- ================== History menu ==================

			menu.extend (history_bar.menu)


			-- ================== Repository menu ==================
			create repository_menu
			repository_menu.set_text (get_msg ("repository_menu_text", Void))
			menu.extend (repository_menu)

			create repository_menu_build_all
			repository_menu_build_all.set_text (get_msg ("repository_menu_build_all_text", Void))
			repository_menu_build_all.select_actions.extend (agent build_all)
			repository_menu.extend (repository_menu_build_all)

			create repository_menu_rebuild_all
			repository_menu_rebuild_all.set_text (get_msg ("repository_menu_rebuild_all_text", Void))
			repository_menu_rebuild_all.select_actions.extend (agent rebuild_all)
			repository_menu.extend (repository_menu_rebuild_all)

			create l_ev_menu_separator_5
			repository_menu.extend (l_ev_menu_separator_5)

			create repository_menu_build_subtree
			repository_menu_build_subtree.set_text (get_msg ("repository_menu_build_subtree_text", Void))
			repository_menu_build_subtree.select_actions.extend (agent build_subtree)
			repository_menu.extend (repository_menu_build_subtree)

			create repository_menu_rebuild_subtree
			repository_menu_rebuild_subtree.set_text (get_msg ("repository_menu_rebuild_subtree_text", Void))
			repository_menu_rebuild_subtree.select_actions.extend (agent rebuild_subtree)
			repository_menu.extend (repository_menu_rebuild_subtree)

			create l_ev_menu_separator_6
			repository_menu.extend (l_ev_menu_separator_6)

			create repository_menu_export_html
			repository_menu_export_html.set_text (get_msg ("repository_menu_export_html_text", Void))
			repository_menu_export_html.select_actions.extend (agent export_repository (syntax_type_adl_html))
			repository_menu.extend (repository_menu_export_html)

			create repository_menu_export_json
			repository_menu_export_json.set_text (get_msg ("repository_menu_export_json_text", Void))
			repository_menu_export_json.select_actions.extend (agent export_repository (syntax_type_json))
			repository_menu.extend (repository_menu_export_json)

			create repository_menu_export_yaml
			repository_menu_export_yaml.set_text (get_msg ("repository_menu_export_yaml_text", Void))
			repository_menu_export_yaml.select_actions.extend (agent export_repository (syntax_type_yaml))
			repository_menu.extend (repository_menu_export_yaml)

			create repository_menu_export_xml
			repository_menu_export_xml.set_text (get_msg ("repository_menu_export_xml_text", Void))
			repository_menu_export_xml.select_actions.extend (agent export_repository (syntax_type_xml))
			repository_menu.extend (repository_menu_export_xml)

			create repository_menu_export_repository_report
			repository_menu_export_repository_report.set_text (get_msg ("repository_menu_export_report_text", Void))
			repository_menu_export_repository_report.select_actions.extend (agent export_repository_report)
			repository_menu.extend (repository_menu_export_repository_report)

			create l_ev_menu_separator_7
			repository_menu.extend (l_ev_menu_separator_7)

			create repository_menu_interrupt_build
			repository_menu_interrupt_build.set_text (get_msg ("repository_menu_interrupt_text", Void))
			repository_menu_interrupt_build.disable_sensitive
			repository_menu_interrupt_build.select_actions.extend (agent interrupt_build)
			repository_menu.extend (repository_menu_interrupt_build)

			create repository_menu_refresh
			repository_menu_refresh.set_text (get_msg ("repository_menu_refresh_text", Void))
			repository_menu_refresh.select_actions.extend (agent refresh_directory)
			repository_menu.extend (repository_menu_refresh)

			create l_ev_menu_separator_8
			repository_menu.extend (l_ev_menu_separator_8)

			create repository_menu_set_repository
			repository_menu_set_repository.set_text (get_msg ("repository_menu_configure_text", Void))
			repository_menu_set_repository.set_pixmap (get_icon_pixmap ("tool/tools"))
			repository_menu_set_repository.select_actions.extend (agent configure_profiles)
			repository_menu.extend (repository_menu_set_repository)


			-- ================== RM Schemas menu ==================
			create rm_schemas_menu
			rm_schemas_menu.set_text (get_msg ("rm_schemas_menu_text", Void))
			menu.extend (rm_schemas_menu)

			create rm_schemas_menu_reload_schemas
			rm_schemas_menu_reload_schemas.set_text (get_msg ("rm_schemas_reload_text", Void))
			rm_schemas_menu_reload_schemas.select_actions.extend (agent reload_schemas)
			rm_schemas_menu.extend (rm_schemas_menu_reload_schemas)

			create l_ev_menu_separator_9
			rm_schemas_menu.extend (l_ev_menu_separator_9)

			create rm_schemas_menu_configure_rm_schemas
			rm_schemas_menu_configure_rm_schemas.set_text (get_msg ("rm_schemas_configure_text", Void))
			rm_schemas_menu_configure_rm_schemas.set_pixmap (get_icon_pixmap ("tool/tools"))
			rm_schemas_menu_configure_rm_schemas.select_actions.extend (agent set_rm_schemas)
			rm_schemas_menu.extend (rm_schemas_menu_configure_rm_schemas)


			-- ================== XML menu ==================
			create xml_menu
			xml_menu.set_text (get_msg ("xml_menu_text", Void))
			menu.extend (xml_menu)

			create l_ev_menu_separator_10
			xml_menu.extend (l_ev_menu_separator_10)

			create xml_menu_conv_rules
			xml_menu_conv_rules.set_text (get_msg ("xml_menu_edit_rules_text", Void))
			xml_menu_conv_rules.select_actions.extend (agent set_xml_rules)
			xml_menu.extend (xml_menu_conv_rules)


			-- ================== Tools menu ==================
			create tools_menu
			tools_menu.set_text (get_msg ("tools_menu_text", Void))
			menu.extend (tools_menu)

			create tools_menu_clean_generated_files
			tools_menu_clean_generated_files.set_text (get_msg ("tools_menu_clean_text", Void))
			tools_menu_clean_generated_files.select_actions.extend (agent clean_generated_files)
			tools_menu.extend (tools_menu_clean_generated_files)

			create l_ev_menu_separator_11
			tools_menu.extend (l_ev_menu_separator_11)

			create tools_menu_options
			tools_menu_options.set_text (get_msg ("tools_menu_options_text", Void))
			tools_menu_options.set_pixmap (get_icon_pixmap ("tool/tools"))
			tools_menu_options.select_actions.extend (agent set_options)
			tools_menu.extend (tools_menu_options)


			-- ================== Help menu ==================
			create help_menu
			help_menu.set_text (get_msg ("help_menu_text", Void))
			menu.extend (help_menu)

			create help_menu_contents
			help_menu_contents.set_text (get_msg ("help_menu_online_text", Void))
			help_menu_contents.select_actions.extend (agent show_online_help)
			help_menu.extend (help_menu_contents)

			create help_menu_release_notes
			help_menu_release_notes.set_text (get_msg ("help_menu_release_notes_text", Void))
			help_menu_release_notes.select_actions.extend (agent show_release_notes)
			help_menu.extend (help_menu_release_notes)

			create l_ev_menu_separator_12
			help_menu.extend (l_ev_menu_separator_12)

			create help_menu_clinical_knowledge_manager
			help_menu_clinical_knowledge_manager.set_text (get_msg ("help_menu_ckm_text", Void))
			help_menu_clinical_knowledge_manager.select_actions.extend (agent show_clinical_knowledge_manager)
			help_menu.extend (help_menu_clinical_knowledge_manager)

			create help_menu_report_bug
			help_menu_report_bug.set_text (get_msg ("help_menu_report_bug_text", Void))
			help_menu_report_bug.select_actions.extend (agent show_bug_reporter)
			help_menu.extend (help_menu_report_bug)

			create help_menu_about
			help_menu_about.set_text (get_msg ("help_menu_about_text", Void))
			help_menu_about.select_actions.extend (agent show_about)
			help_menu.extend (help_menu_about)


			-- ================= set up docking ===================
			create docking_manager.make (viewer_main_cell, Current)
			create_new_catalogue_tool
			create_new_rm_schema_explorer
			create_new_console_tool
			create_new_error_tool
			create_new_test_tool
			archetype_tools.create_new_tool
			view_menu_new_archetype_tool.select_actions.extend (agent archetype_tools.create_new_tool)
			view_menu_new_class_tool.select_actions.extend (agent class_tools.create_new_tool)

			-- populate any statically populated controls
			populate_ui_arch_output_version


			-- set UI feedback handlers
			archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
			archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)
			archetype_compiler.set_full_compile_visual_update_action (agent catalogue_tool.on_full_compile)

			-- text widget handling
			text_widget_handler.focus_first_widget (viewer_main_cell)

			-- accelerators
			initialise_accelerators

			-- GUI agents
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
			gui_agents.set_select_archetype_from_gui_data_agent (agent select_archetype_from_gui_node)
			gui_agents.set_show_tool_with_artefact_agent (agent show_tool_with_artefact_agent)
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
			add_menu_shortcut (view_menu_new_archetype_tool, key_t, True, False, False)
			add_menu_shortcut (view_menu_new_class_tool, key_t, True, False, True)

			add_menu_shortcut (history_bar.menu_item_back, key_left, False, True, False)
			add_menu_shortcut (history_bar.menu_item_forward, key_right, False, True, False)

			add_menu_shortcut (repository_menu_build_all, key_f7, False, False, False)
			add_menu_shortcut (repository_menu_rebuild_all, key_f7, False, False, True)
			add_menu_shortcut (repository_menu_build_subtree, key_f7, True, False, False)
			add_menu_shortcut (repository_menu_rebuild_subtree, key_f7, True, False, True)
			add_menu_shortcut (repository_menu_interrupt_build, key_escape, False, False, True)
			add_menu_shortcut (repository_menu_refresh, key_r, True, False, False)

			-- ctrl-L = reload current RM schemas
			add_menu_shortcut (rm_schemas_menu_reload_schemas, key_l, True, False, False)

			-- shift-ctrl-L = show line numbers
			add_shortcut (agent  set_show_line_numbers (not show_line_numbers), key_l, True, False, False)
		end

	initialise_session_ui_basic
			-- initialise visual settings of window remembered from previous session
		do
			if app_x_position > Sane_screen_coord and app_y_position > Sane_screen_coord then
				set_position (app_x_position, app_y_position)
			else
				set_position (10, 10)
			end

			if app_width > 0 and app_height > 0 then
				set_size (app_width, app_height)
			else
				set_size (1024, 768)
			end
		end

	initialise_docking_layout
			-- initialise visual settings of window remembered from previous session
		local
			docking_file_to_use: STRING
		do
			if app_maximised then
				maximize
			end

			-- Determine which Docking layout file to read
			-- if the default one is the only one, or more recent than the user one, use it
			-- else use the user's one
			if file_system.file_exists (default_docking_layout_file_path) then
				if file_system.file_exists (user_docking_layout_file_path) then
					if file_system.file_time_stamp (default_docking_layout_file_path) > file_system.file_time_stamp (user_docking_layout_file_path) then
						docking_file_to_use := default_docking_layout_file_path
					else
						docking_file_to_use := user_docking_layout_file_path
					end
				end
			elseif file_system.file_exists (user_docking_layout_file_path) then
				docking_file_to_use := user_docking_layout_file_path
				console_tool.append_text (get_msg_line ("copy_docking_file", <<user_docking_layout_file_path, default_docking_layout_file_path>>))
				file_system.copy_file (user_docking_layout_file_path, default_docking_layout_file_path)
			else
				console_tool.append_text (get_msg_line ("no_docking_file_found", <<user_docking_layout_file_path, default_docking_layout_file_path>>))
			end

			if attached docking_file_to_use and then not docking_manager.open_config (docking_file_to_use) then
				console_tool.append_text (get_msg_line ("read_docking_file_failed", <<user_docking_layout_file_path>>))
			end

			-- Splitter layout
			initialise_splitter (test_tool.ev_root_container, test_split_position)
		end

feature -- Commands

	show
			-- Do a few adjustments and load the repository before displaying the window.
		do
			append_billboard_to_console

			initialise_session_ui_basic
			Precursor
			initialise_docking_layout

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
				rm_schema_explorer.populate (rm_schemas_access)
				if repository_profiles.current_reference_repository_path.is_empty then
					configure_profiles
				else
					populate_archetype_profile_combo
					refresh_profile_context (True)
				end
			end

			append_billboard_to_console
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

			app_cfg.save

			if not docking_manager.save_data (user_docking_layout_file_path) then
				console_tool.append_text (get_msg_line ("write_docking_file_failed", <<user_docking_layout_file_path>>))
			end

			ev_application.destroy
		end

feature -- View Events

	on_differential_view
			-- set differential view on currently visible Archetype and Class Tools
		do
			archetype_tools.do_all_visible_tools (agent
				(a_tool: GUI_ARCHETYPE_TOOL) do a_tool.select_differential_view end
			)
			class_tools.do_all_visible_tools (agent
				(a_tool: GUI_CLASS_TOOL) do a_tool.select_differential_view end
			)
		end

	on_flat_view
			-- set flat view on currently visible Tool
		do
			archetype_tools.do_all_visible_tools (agent
				(a_tool: GUI_ARCHETYPE_TOOL) do a_tool.select_flat_view end
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
				console_tool.append_text (get_msg_line ("read_docking_file_failed", <<default_docking_layout_file_path>>))
			end
		end


feature {NONE} -- Repository events

	configure_profiles
			-- Display the Repository Settings dialog. This dialog allows changing of
			-- the repository profiles, adding new ones and removal. Removal of the current
			-- repository or changing current repository paths will cause visual update;
			-- adding a new profile won't - the current selection stays.
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
				save_resources
			end

			dialog.destroy

			-- if the list of profiles changed, repopulate the profile combo box selectors
			if dialog.any_profile_changes_made then
				populate_archetype_profile_combo
			end

			-- if the current profile changed or was removed, repopulate the explorers
			if current_profile_removed or current_profile_changed then
				console_tool.clear
				refresh_profile_context (True)
			end
		end

	select_profile
			-- Called by `select_actions' of profile selector
		do
			if not archetype_profile_combo.text.same_string (repository_profiles.current_profile_name) then
				console_tool.clear
				set_current_profile (archetype_profile_combo.text)
			end
			refresh_profile_context (False)
			clear_all_editors
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
			error_tool.clear
			console_tool.show
			do_build_action (agent archetype_compiler.rebuild_all)
		end

	build_subtree
			-- Build the subsystem below the currently selected node.
		do
			console_tool.show
			if catalogue_tool.selection_history.has_selected_item then
				do_build_action (agent archetype_compiler.build_subtree (catalogue_tool.selected_item))
			end
		end

	rebuild_subtree
			-- Force rebuilding of the whole subsystem below the currently selected node.
		do
			console_tool.show
			if catalogue_tool.selection_history.has_selected_item then
				do_build_action (agent archetype_compiler.rebuild_subtree (catalogue_tool.selected_item))
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

	export_repository (a_syntax: STRING)
			-- Generate serialised form of flat archetypes into `export_directory'/syntax.
		require
			Serialise_format_valid: has_archetype_native_serialiser_format (a_syntax) or has_dt_serialiser_format (a_syntax)
		local
			dialog: EV_QUESTION_DIALOG
			yes_text, no_text, cancel_text, export_dir: STRING
			info_dialog: EV_INFORMATION_DIALOG
		do
			create dialog.make_with_text (get_msg_line ("export_question", <<a_syntax>>))
			dialog.set_title (get_msg ("export_in_format_dialog_title", <<a_syntax>>))
			yes_text := get_msg ("build_and_export_all", Void)
			no_text := get_msg ("export_only_built", Void)
			cancel_text := get_msg_line ("cancel_button_text", Void)
			dialog.set_buttons (<<yes_text, no_text, cancel_text>>)

			dialog.set_default_cancel_button (dialog.button (cancel_text))
			dialog.show_modal_to_window (Current)

			if not dialog.selected_button.same_string (cancel_text) then
				export_dir := file_system.pathname (export_directory, a_syntax)
				file_system.recursive_create_directory (export_dir)
				if not file_system.directory_exists (export_dir) then
					create info_dialog.make_with_text (get_msg_line ("could_not_create_file_text", <<export_dir>>))
				else
					if dialog.selected_button.same_string (yes_text) then
						do_build_action (agent archetype_compiler.build_and_export_all (export_dir, a_syntax))
					elseif dialog.selected_button.same_string (no_text) then
						do_build_action (agent archetype_compiler.export_all (export_dir, a_syntax))
					end
				end
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
			save_dialog.set_title (get_msg ("export_report_dialog_title", Void))
			save_dialog.set_file_name (Repository_report_filename)
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
					create question_dialog.make_with_text (get_msg_line ("file_exists_replace_question", <<xml_name>>))
					question_dialog.set_title (get_msg ("export_dialog_title", Void))
					question_dialog.set_buttons (<<get_msg ("yes_response", Void), get_msg ("no_response", Void)>>)
					question_dialog.show_modal_to_window (Current)
					ok_to_write := question_dialog.selected_button.same_string (get_msg ("yes_response", Void))
				end

				if ok_to_write then
					do_with_wait_cursor (Current, agent error_tool.export_repository_report (xml_name))
					if file.exists then
						console_tool.append_text (get_msg_line ("export_repository_report_replace_info", <<xml_name>>))
						show_in_system_browser (xml_name)
					else
						console_tool.append_text (get_msg_line ("export_repository_report_replace_err", <<xml_name>>))
					end
				end
			end
		end

	refresh_directory
			-- reload current directory
		do
			refresh_profile_context (True)
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
				populate_ui_arch_output_version
				if archetype_tools.has_tools then
					update_all_tools_rm_icons_setting
				end
			end
			if dialog.has_changed_navigator_options and repository_profiles.has_current_profile then
				save_resources
				catalogue_tool.populate (current_arch_cat)
				test_tool.populate
			end
		end

	update_all_tools_rm_icons_setting
		do
			archetype_tools.do_all_tools (agent (a_tool: GUI_ARCHETYPE_TOOL) do a_tool.update_rm_icons_setting end)
			class_tools.do_all_tools (agent (a_tool: GUI_CLASS_TOOL) do a_tool.update_rm_icons_setting end)
			catalogue_tool.update_rm_icons_setting
		end

	clean_generated_files
			-- Remove all generated files below the repository directory and repopulate from scratch
		do
			if has_current_profile then
				do_with_wait_cursor (Current, agent current_arch_cat.do_all_archetypes (agent delete_generated_files))
				refresh_profile_context (True)
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
				rm_schemas_access.reload_schemas
				if not rm_schemas_access.found_valid_schemas then
					append_billboard_to_console
				else
					rm_schema_explorer.populate (rm_schemas_access)
					refresh_profile_context (True)
				end
			elseif dialog.has_changed_schema_dir then
				rm_schema_explorer.populate (rm_schemas_access)
				refresh_profile_context (True)
			end
		end

	reload_schemas
			-- user-initiated reload
		do
			rm_schemas_access.reload_schemas
			refresh_profile_context (True)
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
			dialog.set_title (get_msg ("about_awb_dialog_title", Void))
			dialog.set_pixmap (adl_workbench_icon)
			dialog.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
			dialog.set_position (app_x_position + (app_width - dialog.width) // 2, app_y_position + (app_height - dialog.height) // 2)
			dialog.show_modal_to_window (Current)
		end

feature -- Address Bar control

	address_bar: GUI_ADDRESS_BAR
		once
			create Result.make (agent windows_hide_combo_dropdown, agent windows_show_combo_dropdown)
			Result.add_client_control (catalogue_tool)
			Result.add_client_control (rm_schema_explorer)
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

	show_tool_with_artefact_agent (an_id: STRING): BOOLEAN
		do
			Result := class_tools.show_docking_pane_by_tool_artefact_id (an_id) or else archetype_tools.show_docking_pane_by_tool_artefact_id (an_id)
		end

feature -- RM Schema explorer

	rm_schema_explorer: GUI_RM_SCHEMA_EXPLORER
		once
			create Result.make
		end

	create_new_rm_schema_explorer
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (rm_schema_explorer.ev_root_container, get_icon_pixmap ("tool/rm_schema"), get_msg ("reference_models_docking_area_title", Void))
			attached_docking_manager.contents.extend (a_docking_pane)
			rm_schema_explorer.set_docking_pane (a_docking_pane)
			a_docking_pane.set_long_title (get_msg ("reference_models_docking_area_title", Void))
			a_docking_pane.set_short_title (get_msg ("reference_models_docking_area_title", Void))
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
		once
			create Result.make (attached_docking_manager)
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

feature -- Catalogue tool

	catalogue_tool: GUI_CATALOGUE_TOOL
		once
			create Result.make
		end

	create_new_catalogue_tool
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (catalogue_tool.ev_root_container, get_icon_pixmap ("tool/archetype_category"), get_msg ("catalogue_tool_title", Void))
			attached_docking_manager.contents.extend (a_docking_pane)
			catalogue_tool.set_docking_pane (a_docking_pane)
			a_docking_pane.set_long_title (get_msg ("catalogue_tool_title", Void))
			a_docking_pane.set_short_title (get_msg ("catalogue_tool_title", Void))
			a_docking_pane.set_type ({SD_ENUMERATION}.tool)
			a_docking_pane.set_top ({SD_ENUMERATION}.left)
			a_docking_pane.show_actions.extend (agent address_bar.set_current_client (catalogue_tool))
			a_docking_pane.focus_in_actions.extend (agent address_bar.set_current_client (catalogue_tool))
			a_docking_pane.focus_in_actions.extend (agent history_bar.set_active_tool (catalogue_tool))
		end

	select_archetype_from_gui_node (gui_item: EV_SELECTABLE)
			-- Select and display the node of `archetype_file_tree' corresponding to the folder or archetype attached to `gui_item'.
		do
			if attached gui_item and then attached {ARCH_CAT_ITEM} gui_item.data as aci then
				catalogue_tool.select_item_by_id (aci.qualified_key)
			end
		end

feature -- Archetype tools

	archetype_tools: GUI_ARCHETYPE_TOOLS_CONTROLLER
		once
			create Result.make (attached_docking_manager)
		end

	display_archetype (aca: ARCH_CAT_ARCHETYPE)
		do
			do_with_wait_cursor (Current, agent archetype_compiler.build_lineage (aca, 0))
			if attached aca.last_compile_attempt_timestamp then
				error_tool.extend_and_select (aca)
			end
			archetype_tools.populate_active_tool (aca)
			archetype_tools.active_tool.on_select_notebook
		end

	display_archetype_in_new_tool (aca: ARCH_CAT_ARCHETYPE)
		do
			archetype_tools.create_new_tool
			display_archetype (aca)
		end

feature -- Archetype editors

	archetype_editors: GUI_ARCHETYPE_EDITORS_CONTROLLER
		once
			create Result.make (attached_docking_manager)
		end

	edit_archetype_in_new_tool (aca: ARCH_CAT_ARCHETYPE)
		do
			archetype_editors.create_new_tool
			archetype_editors.active_tool.enable_edit
			archetype_editors.populate_active_tool (aca)
			archetype_editors.active_tool.on_select_notebook
		end

	archetype_has_editor (aca: ARCH_CAT_ARCHETYPE): BOOLEAN
		do
			Result := archetype_editors.has_docking_pane_with_tool_artefact_id (aca.id.as_string)
		end

	refresh_archetype_viewers (an_archetype_id: STRING)
			-- refresh all viewers of archetype with `an_archetype_id'
		do
			archetype_tools.do_all_tools (
				agent (a_tool: GUI_ARCHETYPE_TOOL; an_id: STRING)
					do
						if a_tool.source.id.as_string.same_string (an_id) then
							a_tool.repopulate
						end
					end (?, an_archetype_id)
			)
		end

feature -- Class tool

	class_tools: GUI_CLASS_TOOL_CONTROLLER
		once
			create Result.make (attached_docking_manager)
		end

	display_class_in_new_tool (a_class_def: BMM_CLASS_DEFINITION)
		do
			class_tools.create_new_tool
			display_class (a_class_def)
		end

	display_class (a_class_def: BMM_CLASS_DEFINITION)
			-- display a class selected in some tool
		do
			class_tools.populate_active_tool (a_class_def)
		end

feature -- Test tool

	test_tool: GUI_TEST_ARCHETYPE_TREE_CONTROL
		once
			create Result.make (agent info_feedback)
		end

	create_new_test_tool
		local
			a_docking_pane: SD_CONTENT
		do
			create a_docking_pane.make_with_widget_title_pixmap (test_tool.ev_root_container, get_icon_pixmap ("tool/tools"), get_msg ("test_tool_title", Void))
			attached_docking_manager.contents.extend (a_docking_pane)
			a_docking_pane.set_long_title (get_msg ("test_tool_title", Void))
			a_docking_pane.set_short_title (get_msg ("test_tool_title", Void))
			a_docking_pane.set_type ({SD_ENUMERATION}.tool)
			a_docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
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
			create docking_pane.make_with_widget_title_pixmap (console_tool.ev_console, get_icon_pixmap ("tool/console"), get_msg ("console_tool_title", Void))
			console_tool.set_docking_pane (docking_pane)
			attached_docking_manager.contents.extend (docking_pane)
			docking_pane.set_type ({SD_ENUMERATION}.tool)
			docking_pane.set_long_title (get_msg ("console_tool_title", Void))
			docking_pane.set_short_title (get_msg ("console_tool_title", Void))
			docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

feature -- Error Tool

	error_tool: GUI_ERROR_TOOL
		once
			create Result.make (agent select_archetype_from_gui_node, agent error_tool_title_update)
		end

	error_docking_pane: SD_CONTENT

	create_new_error_tool
		do
			create error_docking_pane.make_with_widget_title_pixmap (error_tool.ev_grid, get_icon_pixmap ("tool/errors"), get_msg ("error_tool_title", Void))
			attached_docking_manager.contents.extend (error_docking_pane)
			error_docking_pane.set_type ({SD_ENUMERATION}.tool)
			error_docking_pane.set_long_title (get_msg ("error_tool_title", Void))
			error_docking_pane.set_short_title (get_msg ("error_tool_title", Void))
			error_docking_pane.set_auto_hide ({SD_ENUMERATION}.bottom)
		end

	error_tool_title_update (parse_error_count, validity_error_count, warning_count: NATURAL)
		do
			error_docking_pane.set_short_title (get_msg ("error_tool_title", Void) + " (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
			error_docking_pane.set_long_title (get_msg ("error_tool_title", Void) + " (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
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

	append_billboard_to_console
			-- Append bilboard contents to console and clear billboard.
		do
			console_tool.append_text (billboard.content)
			billboard.clear
		end

	save_resources
			-- Save the application configuration file and update the status area.
		do
			app_cfg.save
			post_info (Current, "save_resources_and_show_status", "cfg_file_i1", <<user_config_file_path>>)
		end

	refresh_profile_context (refresh_from_repository: BOOLEAN)
			-- Rebuild archetype directory & repopulate relevant GUI parts.
		do
			do_with_wait_cursor (Current, agent do_refresh_profile_context (refresh_from_repository))
		end

	do_refresh_profile_context (refresh_from_repository: BOOLEAN)
		do
			console_tool.show
			console_tool.append_text (get_msg_line ("populating_directory_start", <<repository_profiles.current_profile_name>>))
			use_current_profile (refresh_from_repository)
			console_tool.append_text (get_msg_line ("populating_directory_complete", Void))

			clear_toolbar_controls
			error_tool.clear
			clear_all_editors

			append_billboard_to_console

			catalogue_tool.populate (current_arch_cat)
			test_tool.populate
		end

	clear_toolbar_controls
			-- Wipe out content from visual controls.
		do
			history_bar.clear
			address_bar.clear
		end

	clear_all_editors
		do
		--	archetype_tools.clear_all_tools_content
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
				compile_button.set_pixmap (get_icon_pixmap ("tool/compile"))
			else
				compile_button.set_pixmap (get_icon_pixmap ("tool/pause"))
			end
		end

	populate_ui_arch_output_version
			-- populate ADL output version wherever it appears in the UI
		do
			-- main form combo
			arch_output_version_combo.do_all (
				agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (adl_version_for_flat_output) then
							li.enable_select
						end
					end
			)

			-- archetype tool
			if archetype_tools.has_tools then
				archetype_tools.active_tool.change_adl_serialisation_version
			end
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

	compiler_global_gui_update (a_msg: attached STRING)
			-- Update GUI with progress on build.
		do
			populate_compile_button
			console_tool.append_text (a_msg)
		--	ev_application.process_events
		end

	compiler_archetype_gui_update (a_msg: attached STRING; aca: attached ARCH_CAT_ARCHETYPE; dependency_depth: INTEGER)
			-- Update GUI with progress on build.
		do
			if not a_msg.is_empty then
				console_tool.append_text (indented (a_msg, create {STRING}.make_filled ('%T', dependency_depth)))
			end

			catalogue_tool.update_tree_node (aca)
			test_tool.do_row_for_item (aca)
			error_tool.extend_and_select (aca)

			ev_application.process_events
		end

	set_adl_version_from_combo
			-- set ADL version
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			if arch_output_version_combo.has_selection then
				set_adl_version_for_flat_output (arch_output_version_combo.selected_text.as_string_8)
			end

			-- update archetype tool
			if archetype_tools.has_tools then
				archetype_tools.active_tool.change_adl_serialisation_version
			end

			-- for the moment, post a message about ADL 1.4 XML not being available
			if adl_version_for_flat_output_numeric < 150 then
				create info_dialog.make_with_text (get_msg ("xml_14_not_available_message", Void))
				info_dialog.set_title (get_msg ("config_warning_text", Void))
				info_dialog.show_modal_to_window (Current)
			end
		end

feature {NONE} -- GUI Widgets

	action_bar, arch_output_version_hbox: EV_HORIZONTAL_BOX
	archetype_profile_combo, arch_output_version_combo: EV_COMBO_BOX
	arch_compile_tool_bar: EV_TOOL_BAR
	compile_button, open_button: EV_TOOL_BAR_BUTTON
	tool_bar_sep_1: EV_TOOL_BAR_SEPARATOR
	arch_output_version_label: EV_LABEL

	viewer_main_cell: EV_CELL

	menu: EV_MENU_BAR
	file_menu, edit_menu, view_menu, repository_menu, rm_schemas_menu, xml_menu, tools_menu, help_menu: EV_MENU
	file_menu_open, file_menu_save_as, file_menu_export_as, file_menu_export_flat_as, file_menu_exit, edit_menu_copy,
	edit_menu_select_all, edit_menu_clipboard, view_menu_differential, view_menu_flat, view_menu_new_archetype_tool,
	view_menu_new_class_tool, view_menu_reset_layout, repository_menu_build_all,
	repository_menu_rebuild_all, repository_menu_build_subtree, repository_menu_rebuild_subtree,
	repository_menu_export_html, repository_menu_export_json, repository_menu_export_yaml, repository_menu_export_xml,
	repository_menu_export_repository_report, repository_menu_interrupt_build,
	repository_menu_refresh, repository_menu_set_repository, rm_schemas_menu_reload_schemas,
	rm_schemas_menu_configure_rm_schemas, xml_menu_conv_rules, tools_menu_clean_generated_files,
	tools_menu_options, help_menu_contents, help_menu_release_notes, help_menu_icons,
	help_menu_clinical_knowledge_manager, help_menu_report_bug, help_menu_about: EV_MENU_ITEM
	l_ev_menu_separator_1, l_ev_menu_separator_2, l_ev_menu_separator_3, l_ev_menu_separator_4,
	l_ev_menu_separator_5, l_ev_menu_separator_6, l_ev_menu_separator_7, l_ev_menu_separator_8,
	l_ev_menu_separator_9, l_ev_menu_separator_10, l_ev_menu_separator_11, l_ev_menu_separator_12: EV_MENU_SEPARATOR
	ev_main_vbox: EV_VERTICAL_BOX

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
