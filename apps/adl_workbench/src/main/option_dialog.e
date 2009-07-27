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

	SHARED_APPLICATION_CONTEXT
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

	has_changed_options: BOOLEAN
			-- Has the user OK'ed changes?

feature {NONE} -- Implementation

	populate_controls
			-- Set the dialog widgets from shared settings.
		local
			s: STRING
		do
			s := editor_command
			s.replace_substring_all (",", "%N")
			editor_command_text.set_text (s + "%N")

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

			populate_ev_combo_from_hash_keys (parser_error_reporting_level_combo_box, message_type_ids)

			parser_error_reporting_level_combo_box.do_all (
				agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (message_type_names.item (status_reporting_level)) then
							li.enable_select
						end
					end
			)

			if validation_strict then
				validation_strict_check_button.enable_select
			else
				validation_strict_check_button.disable_select
			end

			export_html_text.set_text (html_export_directory)
		end

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			s: STRING
		do
			hide

			s := editor_command_text.text
			s.left_adjust
			s.right_adjust
			s.replace_substring_all ("%N", ",")
			set_editor_command (s)

			set_expand_node_tree (show_definition_tree_expanded_check_button.is_selected)
			set_show_line_numbers (show_line_numbers_check_button.is_selected)
			set_display_archetype_source (display_archetype_source_check_button.is_selected)
			set_validation_strict(validation_strict_check_button.is_selected)
			set_strict_validation(validation_strict_check_button.is_selected)
			set_status_reporting_level (message_type_ids.item (parser_error_reporting_level_combo_box.text))
			set_html_export_directory (export_html_text.text)

			has_changed_options := True
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
			s := get_file (editor_command_text.selected_text, Current)

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
			export_html_text.set_text (get_directory (export_html_text.text, Current))
		end

	on_select_all (text: EV_TEXT_COMPONENT)
			-- Select all text in `text', if any.
		do
			if text /= Void and then text.text_length > 0 then
				text.select_all
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
