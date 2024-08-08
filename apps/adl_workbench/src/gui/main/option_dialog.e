note
	component:   "openEHR ADL Tools"
	description: "Options dialog window"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	OPTION_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
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
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			create gui_controls.make (0)

			-- ========== root container ============
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- =========== notebook ===========
			create ev_notebook
			ev_root_container.extend (ev_notebook)

			-- =========== Tab 1 - container ===========
			create ev_notebook_paths_vb
			ev_notebook.extend (ev_notebook_paths_vb)
			ev_notebook.set_item_text (ev_notebook_paths_vb, get_text ({ADL_MESSAGES_IDS}.ec_options_path_tab_text))

			-- =========== Tab 1 - path settings ===========

			-- frame
			create evx_path_settings_frame.make (get_text ({ADL_MESSAGES_IDS}.ec_path_settings_frame_text), False)
			ev_notebook_paths_vb.extend (evx_path_settings_frame.ev_root_container)

			-- Terminology directory setting
			create evx_terminology_dir_setter.make (get_text ({ADL_MESSAGES_IDS}.ec_terminology_directory_text), agent terminology_directory, 0)
			evx_path_settings_frame.extend (evx_terminology_dir_setter.ev_root_container, False)
			gui_controls.extend (evx_terminology_dir_setter)

			-- Export directory setting
			create evx_export_dir_setter.make (get_text ({ADL_MESSAGES_IDS}.ec_export_directory_text), agent export_directory, 0)
			evx_path_settings_frame.extend (evx_export_dir_setter.ev_root_container, False)
			gui_controls.extend (evx_export_dir_setter)

			-- Save test diff files directory setting
			create evx_test_files_dir_setter.make (get_text ({ADL_MESSAGES_IDS}.ec_test_diff_files_directory_text), agent test_diff_directory, 0)
			evx_path_settings_frame.extend (evx_test_files_dir_setter.ev_root_container, False)
			gui_controls.extend (evx_test_files_dir_setter)


			-- ========== Tab 1 - external tools settings ==========

			-- frame
			create evx_tool_paths_frame.make (get_msg ({ADL_MESSAGES_IDS}.ec_tool_paths_frame_text, Void), False)
			ev_notebook_paths_vb.extend (evx_tool_paths_frame.ev_root_container)

			-- Text editor path setter control
			create evx_text_editor_dir_setter.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_text_editor_directory_text), agent text_editor_command, agent set_text_editor_command, Void, Void, 0)
			evx_tool_paths_frame.extend (evx_text_editor_dir_setter.ev_root_container, False)
			gui_controls.extend (evx_text_editor_dir_setter)

			-- ADL editor path setter control
			create evx_adl_editor_dir_setter.make (get_text ({ADL_MESSAGES_IDS}.ec_adl_editor_directory_text), agent editor_app_command, 0)
			evx_tool_paths_frame.extend (evx_adl_editor_dir_setter.ev_root_container, False)
			gui_controls.extend (evx_adl_editor_dir_setter)

			-- Diff tool path setter control
			create evx_diff_tool_dir_setter.make (get_text ({ADL_MESSAGES_IDS}.ec_diff_tool_directory_text), agent difftool_command, 0)
			evx_tool_paths_frame.extend (evx_diff_tool_dir_setter.ev_root_container, False)
			gui_controls.extend (evx_diff_tool_dir_setter)


			-- ========== Tab 2 - compiler settings ==========

			create ev_notebook_compiler_settings_vb
			ev_notebook.extend (ev_notebook_compiler_settings_vb)
			ev_notebook.set_item_text (ev_notebook_compiler_settings_vb, get_text ({ADL_MESSAGES_IDS}.ec_options_compiler_settings_tab_text))

			-- Error reporting level combo			
			create evx_parser_error_reporting_level_cob.make (get_text ({ADL_MESSAGES_IDS}.ec_error_reporting_level_text), get_text ({ADL_MESSAGES_IDS}.ec_error_reporting_level_tooltip),
				agent :STRING
					do
						check attached error_type_name_table.item (error_reporting_level) as errname then
							Result := errname
						end
					end,
				error_type_names, 15)
			ev_notebook_compiler_settings_vb.extend (evx_parser_error_reporting_level_cob.ev_root_container)
			ev_notebook_compiler_settings_vb.disable_item_expand (evx_parser_error_reporting_level_cob.ev_root_container)
			gui_controls.extend (evx_parser_error_reporting_level_cob)

			-- validation strict checkbox
			create evx_validation_strict_cb.make (get_text ({ADL_MESSAGES_IDS}.ec_validation_strict_text),
				get_text ({ADL_MESSAGES_IDS}.ec_validation_strict_tooltip), agent validation_strict)
			ev_notebook_compiler_settings_vb.extend (evx_validation_strict_cb.ev_data_control)
			ev_notebook_compiler_settings_vb.disable_item_expand (evx_validation_strict_cb.ev_data_control)
			gui_controls.extend (evx_validation_strict_cb)

			-- RM flattening on checkbox
			create evx_rm_flattening_cb.make (get_text ({ADL_MESSAGES_IDS}.ec_rm_flattening_text), get_text ({ADL_MESSAGES_IDS}.ec_rm_flattening_tooltip), agent rm_flattening_on)
			ev_notebook_compiler_settings_vb.extend (evx_rm_flattening_cb.ev_data_control)
			ev_notebook_compiler_settings_vb.disable_item_expand (evx_rm_flattening_cb.ev_data_control)
			gui_controls.extend (evx_rm_flattening_cb)

			-- Quiet mode checkbox
			create evx_quiet_mode_cb.make (get_text ({ADL_MESSAGES_IDS}.ec_compiler_quiet_text), get_text ({ADL_MESSAGES_IDS}.ec_compiler_quiet_tooltip), agent compiler_quiet)
			ev_notebook_compiler_settings_vb.extend (evx_quiet_mode_cb.ev_data_control)
			ev_notebook_compiler_settings_vb.disable_item_expand (evx_quiet_mode_cb.ev_data_control)
			gui_controls.extend (evx_quiet_mode_cb)


			-- ========== Tab 3 - UI settings ==========

			create ev_notebook_ui_settings_hb
			ev_notebook.extend (ev_notebook_ui_settings_hb)
			create ev_notebook_ui_settings_1_vb
			ev_notebook_ui_settings_hb.extend (ev_notebook_ui_settings_1_vb)
			ev_notebook.set_item_text (ev_notebook_ui_settings_hb, get_text ({ADL_MESSAGES_IDS}.ec_options_ui_settings_tab_text))

			-- show entire class hierarchy in archetype explorer
			create evx_show_all_classes_cb.make (get_text ({ADL_MESSAGES_IDS}.ec_show_all_classes_text), get_text ({ADL_MESSAGES_IDS}.ec_show_all_classes_tooltip), agent show_entire_ontology)
			ev_notebook_ui_settings_1_vb.extend (evx_show_all_classes_cb.ev_data_control)
			gui_controls.extend (evx_show_all_classes_cb)

			-- show 'lf' marker in archetype tree to indicate original source form (legacy or authored)
			create evx_display_source_cb.make (get_text ({ADL_MESSAGES_IDS}.ec_show_source_format_text), get_text ({ADL_MESSAGES_IDS}.ec_show_source_format_tooltip), agent display_archetype_source)
			ev_notebook_ui_settings_1_vb.extend (evx_display_source_cb.ev_data_control)
			gui_controls.extend (evx_display_source_cb)

			-- Show flat form by default
			create evx_show_flat_form.make (get_text ({ADL_MESSAGES_IDS}.ec_show_flat_form_text),
				get_text ({ADL_MESSAGES_IDS}.ec_show_flat_form_tooltip), agent show_flat_form)
			ev_notebook_ui_settings_1_vb.extend (evx_show_flat_form.ev_data_control)
			gui_controls.extend (evx_show_flat_form)

			-- Show definition tree expanded
			create evx_expand_definition_tree_cb.make (get_text ({ADL_MESSAGES_IDS}.ec_show_definition_tree_expanded_text),
				get_text ({ADL_MESSAGES_IDS}.ec_show_definition_tree_expanded_tooltip), agent expand_definition_tree)
			ev_notebook_ui_settings_1_vb.extend (evx_expand_definition_tree_cb.ev_data_control)
			gui_controls.extend (evx_expand_definition_tree_cb)

			-- Show line numbers in ADL source tab
			create evx_show_line_numbers_cb.make (get_text ({ADL_MESSAGES_IDS}.ec_show_line_numbers), Void, agent show_line_numbers)
			ev_notebook_ui_settings_1_vb.extend  (evx_show_line_numbers_cb.ev_data_control)
			gui_controls.extend (evx_show_line_numbers_cb)


			create ev_notebook_ui_settings_2_vb
			ev_notebook_ui_settings_hb.extend (ev_notebook_ui_settings_2_vb)

			-- Tool tab combo
			create evx_tool_tab_cob.make (get_text ({ADL_MESSAGES_IDS}.ec_options_tool_tab_text), get_text ({ADL_MESSAGES_IDS}.ec_options_tool_tab_tooltip),
				agent :STRING
					do
						check attached Tool_tab_index.item (default_tool_tab) as tt then
							Result := tt
						end
					end,
				Tool_tab_names, 15)
			ev_notebook_ui_settings_2_vb.extend (evx_tool_tab_cob.ev_root_container)
			ev_notebook_ui_settings_2_vb.disable_item_expand (evx_tool_tab_cob.ev_root_container)
			gui_controls.extend (evx_tool_tab_cob)


			-- ========== Tab 4 - Authoring settings ==========

			create ev_notebook_authoring_vb
			ev_notebook.extend (ev_notebook_authoring_vb)
			ev_notebook.set_item_text (ev_notebook_authoring_vb, get_text ({ADL_MESSAGES_IDS}.ec_options_authoring_tab_text))

			create evx_auth_name_text.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_options_auth_name_label),
				agent :STRING do Result := author_name end,
				agent (a_str :STRING) do set_author_name (a_str) end,
				agent do set_author_name ("") end,
				Void, 0, True)
			ev_notebook_authoring_vb.extend (evx_auth_name_text.ev_root_container)
			ev_notebook_authoring_vb.disable_item_expand (evx_auth_name_text.ev_root_container)
			gui_controls.extend (evx_auth_name_text)

			create evx_auth_org_text.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_options_auth_org_label),
				agent :STRING do Result := author_org end,
				agent (a_str :STRING) do set_author_org (a_str) end,
				agent do set_author_org ("") end,
				Void,
				0, True)
			ev_notebook_authoring_vb.extend (evx_auth_org_text.ev_root_container)
			ev_notebook_authoring_vb.disable_item_expand (evx_auth_org_text.ev_root_container)
			gui_controls.extend (evx_auth_org_text)

			create evx_auth_copyright_text.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_options_auth_copyright_label),
				agent :STRING do Result := author_copyright end,
				agent (a_str :STRING) do set_author_copyright (a_str) end,
				agent do set_author_copyright ("") end,
				Void, 0, True)
			ev_notebook_authoring_vb.extend (evx_auth_copyright_text.ev_root_container)
			ev_notebook_authoring_vb.disable_item_expand (evx_auth_copyright_text.ev_root_container)
			gui_controls.extend (evx_auth_copyright_text)

			create evx_auth_language_text.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_options_auth_language_label),
				agent :STRING do Result := author_language end,
				agent (a_str :STRING) do set_author_language (a_str) end,
				agent do set_author_language ("") end,
				Void, 0, True)
			ev_notebook_authoring_vb.extend (evx_auth_language_text.ev_root_container)
			ev_notebook_authoring_vb.disable_item_expand (evx_auth_language_text.ev_root_container)
			gui_controls.extend (evx_auth_language_text)

			-- ========== Tab 5 - Namespace settings ==========

			create ev_notebook_namespaces_vb
			ev_notebook.extend (ev_notebook_namespaces_vb)
			ev_notebook.set_item_text (ev_notebook_namespaces_vb, get_text ({ADL_MESSAGES_IDS}.ec_options_namespaces_tab_text))

			create evx_namespaces.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_options_namespaces_tab_text),
				agent :STRING_TABLE [STRING] do Result := namespace_table.namespaces end,
				agent (a_key, a_val: STRING) do namespace_table.put_namespace (a_key, a_val) end,
				agent (a_key: STRING) do namespace_table.remove_namespace (a_key) end,
				Void,
				0, 25, False, Void)

			ev_notebook_namespaces_vb.extend (evx_namespaces.ev_root_container)
			gui_controls.extend (evx_namespaces)


			-- ========== Tab 6 - Terminology settings ==========

			create ev_notebook_terminology_settings_vb
			ev_notebook.extend (ev_notebook_terminology_settings_vb)
			ev_notebook.set_item_text (ev_notebook_terminology_settings_vb, get_text ({ADL_MESSAGES_IDS}.ec_options_terminology_uris_tab_text))

			create evx_terminology_settings.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_options_terminology_uris_tab_text),
				agent :STRING_TABLE [STRING] do Result := terminology_settings.uri_templates end,
				agent (a_key, a_val: STRING) do terminology_settings.put_uri (a_key, a_val) end,
				agent (a_key: STRING) do terminology_settings.remove_uri (a_key) end,
				Void,
				0, 25, False, Void)

			ev_notebook_terminology_settings_vb.extend (evx_terminology_settings.ev_root_container)
			gui_controls.extend (evx_terminology_settings)


			-- ============ Ok/Cancel buttons ============
			create evx_ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (evx_ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (evx_ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor

			set_minimum_width (700)
			set_title (get_text ({ADL_MESSAGES_IDS}.ec_option_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

			extend (ev_root_container)
			set_default_cancel_button (evx_ok_cancel_buttons.cancel_button)
			set_default_push_button (evx_ok_cancel_buttons.ok_button)

			-- add another button to OK/cancel button row to enable edit of options file
			evx_ok_cancel_buttons.add_button (get_text ({ADL_MESSAGES_IDS}.ec_option_dialog_edit_file_text), agent on_edit_options_file)
			enable_edit
			do_populate
		end

feature -- Status

	has_edited_options_file: BOOLEAN
			-- True if options file was updated directly by user

feature -- Events

	on_ok
			-- Set shared settings from the dialog widgets.
		do
			hide

			if has_edited_options_file then
				app_cfg.load
			else
				-- paths options: set directly; NO FURTHER ACTION REQUIRED IN GUI
				set_terminology_directory (evx_terminology_dir_setter.data_control_text)
				set_export_directory (evx_export_dir_setter.data_control_text)
				set_test_diff_directory (evx_test_files_dir_setter.data_control_text)

				-- tool commands
				set_editor_app_command (evx_adl_editor_dir_setter.data_control_text)
				set_difftool_command (evx_diff_tool_dir_setter.data_control_text)

				-- compilation options: set directly; NO FURTHER ACTION REQUIRED IN GUI
				set_validation_strict (evx_validation_strict_cb.is_selected)
				set_rm_flattening_on (evx_rm_flattening_cb.is_selected)
				set_compiler_quiet (evx_quiet_mode_cb.is_selected)
				set_global_error_reporting_level (error_type_id_table.item (evx_parser_error_reporting_level_cob.data_control_text))
				set_error_reporting_level (global_error_reporting_level)

				-- GUI options
				set_expand_definition_tree (evx_expand_definition_tree_cb.is_selected)
				set_show_line_numbers (evx_show_line_numbers_cb.is_selected)
				set_show_flat_form (evx_show_flat_form.is_selected)
				set_display_archetype_source (evx_display_source_cb.is_selected)

				gui_agents.call_on_toggle_view_all_classes_agent (evx_show_all_classes_cb.is_selected)

				set_default_tool_tab (Tool_tab_reverse_index.item (evx_tool_tab_cob.data_control_text))

				-- namespaces
				set_namespace_table (namespace_table)

				-- terminology template URIs
				set_terminology_settings (terminology_settings)

				-- save resources file
				gui_agents.call_save_resources_agent
			end
		end

	on_edit_options_file
			-- launch edit dialog
		local
			orig_time_stamp: INTEGER
		do
			if app_cfg.is_dirty then
				app_cfg.save
			end
			orig_time_stamp := file_system.file_time_stamp (user_config_file_path)
			do_system_run_command_synchronous (text_editor_command + " %"" + user_config_file_path + "%"", Void)
			if file_system.file_time_stamp (user_config_file_path) > orig_time_stamp then
				app_cfg.load
				do_populate
			end
			has_edited_options_file := True
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
		end

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_terminology_dir_setter, evx_export_dir_setter, evx_test_files_dir_setter: EVX_DIRECTORY_SETTER

	evx_text_editor_dir_setter, evx_adl_editor_dir_setter, evx_diff_tool_dir_setter: EVX_FILE_PATH_SETTER

	evx_path_settings_frame, evx_tool_paths_frame: EVX_FRAME_CONTROL

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

	ev_notebook_paths_vb, ev_notebook_compiler_settings_vb, ev_notebook_ui_settings_1_vb, ev_notebook_ui_settings_2_vb: EV_VERTICAL_BOX

	ev_notebook_authoring_vb, ev_notebook_namespaces_vb, ev_notebook_terminology_settings_vb: EV_VERTICAL_BOX

	ev_notebook_ui_settings_hb: EV_HORIZONTAL_BOX

	evx_parser_error_reporting_level_cob: EVX_COMBO_TEXT_SELECTOR_CONTROL

	evx_tool_tab_cob: EVX_COMBO_TEXT_SELECTOR_CONTROL

	evx_quiet_mode_cb, evx_validation_strict_cb, evx_rm_flattening_cb, evx_expand_definition_tree_cb, evx_show_line_numbers_cb: EVX_CHECK_BOX_CONTROL

	evx_display_source_cb, evx_show_all_classes_cb, evx_show_flat_form: EVX_CHECK_BOX_CONTROL

	evx_auth_name_text, evx_auth_org_text, evx_auth_copyright_text, evx_auth_language_text: EVX_SINGLE_LINE_TEXT_CONTROL

	evx_namespaces, evx_terminology_settings: EVX_HASH_TABLE_CONTROL

	evx_ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


