note
	component:   "openEHR Archetype Project"
	description: "Options dialog window"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	OPTION_DIALOG

inherit
	OPTION_DIALOG_IMP

	GUI_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	user_initialization
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			set_icon_pixmap (adl_workbench_ico)
			cancel_button.select_actions.extend (agent hide)
			set_default_cancel_button (cancel_button)
			set_default_push_button (ok_button)

			export_html_text.focus_in_actions.extend (agent on_select_all (export_html_text))
			save_diff_path_text.focus_in_actions.extend (agent on_select_all (save_diff_path_text))

			text_editor_command_text.focus_in_actions.extend (agent on_select_all (text_editor_command_text))
			editor_app_command_text.focus_in_actions.extend (agent on_select_all (editor_app_command_text))
			difftool_command_text.focus_in_actions.extend (agent on_select_all (difftool_command_text))

			populate_controls
		end

feature -- Status

	has_changed_ui_options: BOOLEAN
			-- Has the user OK'ed changes?

	has_changed_navigator_options: BOOLEAN
			-- True if some option has changed that would require the navigator to be redrawn

feature {NONE} -- Implementation

	populate_controls
			-- Set the dialog widgets from shared settings.
		do
			-- text editor command
			text_editor_command_text.set_text (text_editor_command)

			-- archetype editor app command
			editor_app_command_text.set_text (editor_app_command)

			-- diff tool command
			difftool_command_text.set_text (difftool_command)

			-- GUI options
			if expand_node_tree then
				show_definition_tree_expanded_check_button.enable_select
			else
				show_definition_tree_expanded_check_button.disable_select
			end

			if show_line_numbers then
				show_line_numbers_check_button.enable_select
			else
				show_line_numbers_check_button.disable_select
			end

			if display_archetype_source then
				display_archetype_source_check_button.enable_select
			else
				display_archetype_source_check_button.disable_select
			end

			if show_entire_ontology then
				show_entire_ontology_check_button.enable_select
			else
				show_entire_ontology_check_button.disable_select
			end
			old_show_entire_ontology := show_entire_ontology

			-- compiler options
			populate_ev_combo_from_ds_hash_keys (parser_error_reporting_level_combo_box, error_type_ids)
			parser_error_reporting_level_combo_box.do_all (
				agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (error_type_names.item (error_reporting_level)) then
							li.enable_select
						end
					end
			)

			adl_save_version_combo_box.set_strings(Adl_versions)
			adl_save_version_combo_box.do_all (
				agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (adl_version_for_flat_output) then
							li.enable_select
						end
					end
			)

			if validation_strict then
				validation_strict_check_button.enable_select
			else
				validation_strict_check_button.disable_select
			end

			-- resource / directory options
			export_html_text.set_text (html_export_directory)
			save_diff_path_text.set_text (test_diff_directory)
		end

	on_ok
			-- Set shared settings from the dialog widgets.
		do
			hide

			-- text editor command
			set_text_editor_command (text_editor_command_text.text.as_string_8)

			-- archetype editor app command
			set_editor_app_command (editor_app_command_text.text.as_string_8)

			-- difftool command
			set_difftool_command (difftool_command_text.text.as_string_8)

			-- GUI options
			has_changed_ui_options := True -- for now, just assume changes. since repainting archetype part of gui is cheap
			set_expand_node_tree (show_definition_tree_expanded_check_button.is_selected)
			set_show_line_numbers (show_line_numbers_check_button.is_selected)
			set_display_archetype_source (display_archetype_source_check_button.is_selected)
			set_show_entire_ontology (show_entire_ontology_check_button.is_selected)
			if show_entire_ontology /= old_show_entire_ontology then
				has_changed_navigator_options := True
			else
				has_changed_navigator_options := False
			end

			-- paths options: set directly; NO FURTHER ACTION REQUIRED IN GUI
			set_html_export_directory (export_html_text.text.as_string_8)
			set_test_diff_directory (save_diff_path_text.text.as_string_8)

			-- compilation options: set directly; NO FURTHER ACTION REQUIRED IN GUI
			set_adl_version_for_flat_output(adl_save_version_combo_box.text.as_string_8)
			set_validation_strict(validation_strict_check_button.is_selected)
			set_error_reporting_level (error_type_ids.item (parser_error_reporting_level_combo_box.text.as_string_8))
			billboard.set_error_reporting_level(error_reporting_level)
		end

	on_editor_app_command_browse
			-- Let the user browse for an application that will act as the external archetype editor.
		do
			editor_app_command_text.set_text (get_file (editor_app_command_text.text.as_string_8, Current))
		end

	on_text_editor_command_browse
			-- Let the user browse for a text editor to use in AWB
		do
			text_editor_command_text.set_text (get_file (text_editor_command_text.text.as_string_8, Current))
		end

	on_difftool_command_browse
			-- Let the user browse for an application that will act as the external difftool.
		do
			difftool_command_text.set_text (get_file (difftool_command_text.text.as_string_8, Current))
		end

	on_export_html_browse
			-- Let the user browse for the directory to which HTML will be exported.
		do
			export_html_text.set_text (get_directory (export_html_text.text.as_string_8, Current))
		end

	on_test_diff_path_browse
			-- Called by `select_actions' of `save_diff_path_button'.
		do
			save_diff_path_text.set_text (get_directory (save_diff_path_text.text.as_string_8, Current))
		end

	on_select_all (text: EV_TEXT_COMPONENT)
			-- Select all text in `text', if any.
		do
			if text /= Void and then text.text_length > 0 then
				text.select_all
			end
		end

feature {NONE} -- Implementation

	old_show_entire_ontology: BOOLEAN
			-- value of show_entire_ontology prior to setting by optin dialog

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
