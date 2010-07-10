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

	GUI_CONTROLLER_TOOLS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_REFERENCE_MODEL_ACCESS
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
			show_actions.extend (agent editor_command_text.set_focus)
			editor_command_text.disable_word_wrapping
			export_html_text.focus_in_actions.extend (agent on_select_all (export_html_text))
			populate_controls
		end

feature -- Status

	has_changed_archetype_options: BOOLEAN
			-- Has the user OK'ed changes?

	has_changed_navigator_options: BOOLEAN
			-- True if some option has changed that would require the navigator to be redrawn

	has_changed_schema_load_list: BOOLEAN
			-- Schema load list has changed; should refresh

feature -- Access

	old_rm_schemas_load_list: ARRAYED_LIST [STRING]
			-- previous state of schemas load list

feature {NONE} -- Implementation

	populate_controls
			-- Set the dialog widgets from shared settings.
		local
			s: STRING
		do
			s := editor_command
			s.replace_substring_all (",", "%N")
			editor_command_text.set_text (s + "%N")

			-- archetype viewing settings
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

			-- compiler settings
			populate_ev_combo_from_hash_keys (parser_error_reporting_level_combo_box, message_type_ids)
			parser_error_reporting_level_combo_box.do_all (
				agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (message_type_names.item (status_reporting_level)) then
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

			-- resource / directory settings
			export_html_text.set_text (html_export_directory)
			populate_ev_list_from_hash_keys (rm_schemas_checkable_list, rm_schema_metadata_table)
			rm_schemas_checkable_list.do_all (
				agent (li: EV_LIST_ITEM)
					do
						if rm_schemas_load_list.has (li.text) or else rm_schemas_load_list.is_empty then
							rm_schemas_checkable_list.check_item (li)
						else
							rm_schemas_checkable_list.uncheck_item (li)
						end
					end
			)
		end

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			s: STRING
		do
			hide

			s := editor_command_text.text.as_string_8
			s.left_adjust
			s.right_adjust
			s.replace_substring_all ("%N", ",")
			set_editor_command (s)

			set_expand_node_tree (show_definition_tree_expanded_check_button.is_selected)
			set_show_line_numbers (show_line_numbers_check_button.is_selected)
			set_show_entire_ontology (show_entire_ontology_check_button.is_selected)
			set_display_archetype_source (display_archetype_source_check_button.is_selected)
			set_validation_strict(validation_strict_check_button.is_selected)

			set_status_reporting_level (message_type_ids.item (parser_error_reporting_level_combo_box.text.as_string_8))
			billboard.set_status_reporting_level(status_reporting_level)

			has_changed_archetype_options := True
			if show_entire_ontology /= old_show_entire_ontology then
				has_changed_navigator_options := True
			end

			set_html_export_directory (export_html_text.text.as_string_8)
			set_adl_version_for_flat_output(adl_save_version_combo_box.text.as_string_8)

			create rm_schemas_ll.make(0)
			rm_schemas_ll.compare_objects
			rm_schemas_checkable_list.checked_items.do_all (
				agent (li: EV_LIST_ITEM)
					do
						rm_schemas_ll.extend(li.text)
					end
			)
			if rm_schemas_ll.is_equal (rm_schemas_load_list) then
				has_changed_schema_load_list := False
			else
				old_rm_schemas_load_list := rm_schemas_load_list
				set_rm_schemas_load_list (rm_schemas_ll)
				has_changed_schema_load_list := True
			end
		end

	on_editor_command_add
			-- Add a new line to `editor_command_text'.
		do
			editor_command_text.append_text ("%N")
			editor_command_text.set_focus
			editor_command_text.select_lines (editor_command_text.line_count, editor_command_text.line_count + 1)
		end

	on_editor_command_browse
			-- Let the user browse for an application that will act as the external editor.
		local
			s: STRING
		do
			editor_command_text.select_lines (editor_command_text.current_line_number, editor_command_text.current_line_number)
			s := get_file (editor_command_text.selected_text.as_string_8, Current)

			if editor_command_text.has_selection then
				editor_command_text.delete_selection
			end

			editor_command_text.insert_text (s + "%N")
			editor_command_text.set_focus
			editor_command_text.select_lines (editor_command_text.current_line_number, editor_command_text.current_line_number)
		end

	on_export_html_browse
			-- Let the user browse for the directory to which HTML will be exported.
		do
			export_html_text.set_text (get_directory (export_html_text.text.as_string_8, Current))
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

	rm_schemas_ll: ARRAYED_LIST [STRING]
			-- list of checked schemas in options dialog


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
