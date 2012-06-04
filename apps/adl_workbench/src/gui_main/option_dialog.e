note
	component:   "openEHR Archetype Project"
	description: "Options dialog window"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	OPTION_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			create gui_controls.make (0)

			-- ========== root container ============
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)
			set_title (get_text ("option_dialog_title"))
			set_icon_pixmap (adl_workbench_icon)
			extend (ev_root_container)

			-- =========== path settings ===========

			-- frame
			create path_settings_frame_ctl.make (get_text ("path_settings_frame_text"), 0, 0, False)
			ev_root_container.extend (path_settings_frame_ctl.ev_root_container)

			-- Export directory setting
			create export_dir_setter.make (get_text ("export_directory_text"), agent export_directory, 0, 500)
			path_settings_frame_ctl.extend (export_dir_setter.ev_root_container, False)
			gui_controls.extend (export_dir_setter)

			-- Save test diff files directory setting
			create test_files_dir_setter.make (get_text ("test_diff_files_directory_text"), agent test_diff_directory, 0, 0)
			path_settings_frame_ctl.extend (test_files_dir_setter.ev_root_container, False)
			gui_controls.extend (test_files_dir_setter)


			-- ========== compiler settings ==========

			-- frame
			create compiler_settings_frame_ctl.make (get_text ("compiler_settings_frame_text"), 0, 0, False)
			ev_root_container.extend (compiler_settings_frame_ctl.ev_root_container)

			-- add a row
			compiler_settings_frame_ctl.add_row (False)

			-- Error reporting level combo			
			create parser_error_reporting_level_combo_box.make_editable (get_text ("error_reporting_level_text"),
				agent error_type_name_table.item (error_reporting_level),
				error_type_names, agent (a_val: STRING) do  end,
				Void, Void, 0, 100)
			compiler_settings_frame_ctl.extend (parser_error_reporting_level_combo_box.ev_root_container, False)
			gui_controls.extend (parser_error_reporting_level_combo_box)

			-- ADL save version
			create adl_save_version_combo_box.make_editable (get_text ("adl_serialisation_level_text"),
				agent adl_version_for_flat_output, adl_versions,
				agent (a_val: STRING) do  end,
				Void, Void, 0, 0)
			compiler_settings_frame_ctl.extend (adl_save_version_combo_box.ev_root_container, False)
			gui_controls.extend (adl_save_version_combo_box)

			-- add a row
			compiler_settings_frame_ctl.add_row (False)

			-- validation strict checkbox
			create validation_strict_check_ctl.make (get_text ("validation_strict_text"), get_text ("validation_strict_tooltip"), agent validation_strict, 0, 0)
			compiler_settings_frame_ctl.extend (validation_strict_check_ctl.ev_data_control, False)
			gui_controls.extend (validation_strict_check_ctl)

			-- RM flattening on checkbox
			create rm_flattening_check_ctl.make (get_text ("rm_flattening_text"), get_text ("rm_flattening_tooltip"), agent rm_flattening_on, 0, 0)
			compiler_settings_frame_ctl.extend (rm_flattening_check_ctl.ev_data_control, False)
			gui_controls.extend (rm_flattening_check_ctl)


			-- ========== UI settings ==========

			-- frame
			create ui_settings_frame_ctl.make (get_text ("ui_settings_frame_text"), 0, 0, False)
			ev_root_container.extend (ui_settings_frame_ctl.ev_root_container)

			-- add a row
			ui_settings_frame_ctl.add_row (False)

			-- Show definition tree expanded
			create expand_definition_tree_check_ctl.make (get_text ("show_definition_tree_expanded_text"),
				get_text ("show_definition_tree_expanded_tooltip"), agent expand_node_tree, 0, 0)
			ui_settings_frame_ctl.extend (expand_definition_tree_check_ctl.ev_data_control, False)
			gui_controls.extend (expand_definition_tree_check_ctl)

			-- Show line numbers in ADL source
			create show_line_numbers_check_ctl.make (get_text ("show_line_numbers"), Void, agent show_line_numbers, 0, 0)
			ui_settings_frame_ctl.extend  (show_line_numbers_check_ctl.ev_data_control, False)
			gui_controls.extend (show_line_numbers_check_ctl)

			-- add a row
			ui_settings_frame_ctl.add_row (False)

			-- show 'lf' marker in archetype tree to indicate original source form (legacy or authored)
			create display_source_check_ctl.make (get_text ("show_source_form_text"), get_text ("show_source_form_tooltip"), agent display_archetype_source, 0, 0)
			ui_settings_frame_ctl.extend (display_source_check_ctl.ev_data_control, False)
			gui_controls.extend (display_source_check_ctl)

			-- show entire class hierarchy in archetype explorer
			create show_all_classes_check_ctl.make (get_text ("show_all_classes_text"), get_text ("show_all_classes_tooltip"), agent show_entire_ontology, 0, 0)
			ui_settings_frame_ctl.extend (show_all_classes_check_ctl.ev_data_control, False)
			gui_controls.extend (show_all_classes_check_ctl)

			-- use RM pixmaps
			create use_rm_icons_check_ctl.make (get_text ("use_rm_icons_text"), get_text ("use_rm_icons_tooltip"), agent use_rm_pixmaps, 0, 0)
			ui_settings_frame_ctl.extend (use_rm_icons_check_ctl.ev_data_control, False)
			gui_controls.extend (use_rm_icons_check_ctl)


			-- ========== external tools settings ==========

			-- frame
			create tool_paths_frame_ctl.make (get_msg ("tool_paths_frame_text", Void), 0, 0, False)
			ev_root_container.extend (tool_paths_frame_ctl.ev_root_container)

			-- Text editor path setter control
			create text_editor_dir_setter.make (get_text ("text_editor_directory_text"), agent text_editor_command, 0, 0)
			tool_paths_frame_ctl.extend (text_editor_dir_setter.ev_root_container, False)
			gui_controls.extend (text_editor_dir_setter)

			-- ADL editor path setter control
			create adl_editor_dir_setter.make (get_text ("adl_editor_directory_text"), agent editor_app_command, 0, 0)
			tool_paths_frame_ctl.extend (adl_editor_dir_setter.ev_root_container, False)
			gui_controls.extend (adl_editor_dir_setter)

			-- Diff tool path setter control
			create diff_tool_dir_setter.make (get_text ("diff_tool_directory_text"), agent difftool_command, 0, 0)
			tool_paths_frame_ctl.extend (diff_tool_dir_setter.ev_root_container, False)
			gui_controls.extend (diff_tool_dir_setter)


			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- add another button to OK/cancel button row to enable edit of options file
			ok_cancel_buttons.add_button (get_text ("option_dialog_edit_file_text"), agent on_edit_options_file)

			enable_edit

			old_show_entire_ontology := show_entire_ontology

			do_populate
		end

feature -- Status

	has_changed_ui_options: BOOLEAN
			-- Has the user OK'ed changes?

	has_changed_navigator_options: BOOLEAN
			-- True if some option has changed that would require the navigator to be redrawn

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
				-- GUI options
				has_changed_ui_options := True -- for now, just assume changes. since repainting archetype part of gui is cheap
				set_expand_node_tree (expand_definition_tree_check_ctl.is_selected)
				set_show_line_numbers (show_line_numbers_check_ctl.is_selected)
				set_display_archetype_source (display_source_check_ctl.is_selected)
				set_use_rm_pixmaps (use_rm_icons_check_ctl.is_selected)
				set_show_entire_ontology (show_all_classes_check_ctl.is_selected)
				if show_entire_ontology /= old_show_entire_ontology then
					has_changed_navigator_options := True
				else
					has_changed_navigator_options := False
				end

				-- paths options: set directly; NO FURTHER ACTION REQUIRED IN GUI
				set_export_directory (export_dir_setter.data_control_text)
				set_test_diff_directory (test_files_dir_setter.data_control_text)

				-- compilation options: set directly; NO FURTHER ACTION REQUIRED IN GUI
				set_adl_version_for_flat_output (adl_save_version_combo_box.data_control_text)
				set_validation_strict (validation_strict_check_ctl.is_selected)
				set_rm_flattening_on (rm_flattening_check_ctl.is_selected)
				set_error_reporting_level (error_type_id_table.item (parser_error_reporting_level_combo_box.data_control_text))
				billboard.set_error_reporting_level (error_reporting_level)

				-- tool commands
				set_text_editor_command (text_editor_dir_setter.data_control_text)
				set_editor_app_command (adl_editor_dir_setter.data_control_text)
				set_difftool_command (diff_tool_dir_setter.data_control_text)
			end
		end

	on_edit_options_file
		do
			execution_environment.launch (text_editor_command + " %"" + user_config_file_path + "%"")
			has_edited_options_file := True -- might not be true, but we assume it changed
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do if an_item.can_edit then an_item.enable_edit end end)
		end

feature {NONE} -- Implementation

	old_show_entire_ontology: BOOLEAN
			-- value of show_entire_ontology prior to setting by optin dialog

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.do_populate end)
		end

	gui_controls: ARRAYED_LIST [GUI_DATA_CONTROL]

	export_dir_setter, test_files_dir_setter: GUI_DIRECTORY_SETTER

	text_editor_dir_setter, adl_editor_dir_setter, diff_tool_dir_setter: GUI_FILE_PATH_SETTER

	path_settings_frame_ctl, tool_paths_frame_ctl, compiler_settings_frame_ctl, ui_settings_frame_ctl: GUI_FRAME_CONTROL

	ev_root_container: EV_VERTICAL_BOX

	parser_error_reporting_level_combo_box, adl_save_version_combo_box: GUI_COMBO_TEXT_SELECTOR_CONTROL

	validation_strict_check_ctl, rm_flattening_check_ctl, expand_definition_tree_check_ctl, show_line_numbers_check_ctl: GUI_CHECK_BOX_CONTROL

	display_source_check_ctl, show_all_classes_check_ctl, use_rm_icons_check_ctl: GUI_CHECK_BOX_CONTROL

	ok_cancel_buttons: GUI_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
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
--| The Original Code is option_dialog.e.
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
