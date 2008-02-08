indexing
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

feature {NONE} -- Initialization

	user_initialization is
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
			editor_command_text.focus_in_actions.extend (agent on_select_all (editor_command_text))
			export_html_text.focus_in_actions.extend (agent on_select_all (export_html_text))
			populate_controls
		end

feature -- Status

	has_changed_options: BOOLEAN
			-- Has the user OK'ed changes?

feature {NONE} -- Implementation

	populate_controls
			-- Set the dialog widgets from shared settings.
		do
			editor_command_text.set_text (editor_command)

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

			populate_ev_combo_from_hash_keys (parser_error_reporting_level_combo_box, message_type_ids)

			parser_error_reporting_level_combo_box.do_all (agent (li: EV_LIST_ITEM)
				do
					if li.text.same_string (message_type_names.item (status_reporting_level)) then
						li.enable_select
					end
				end)

			export_html_text.set_text (html_export_directory)
		end

	option_dialog_ok
			-- Set shared settings from the dialog widgets.
		do
			hide
			set_editor_command (editor_command_text.text)
			set_expand_node_tree (show_definition_tree_expanded_check_button.is_selected)
			set_show_line_numbers (show_line_numbers_check_button.is_selected)
			set_status_reporting_level (message_type_ids.item (parser_error_reporting_level_combo_box.text))
			set_html_export_directory (export_html_text.text)
			has_changed_options := True
		end

	get_editor_command_directory
			-- Let the user browse for the application that will act as the external editor.
		do
			editor_command_text.set_text (get_file (editor_command, Current))
		end

	get_html_export_directory
			-- Let the user browse for the directory to which HTML will be exported.
		do
			export_html_text.set_text (get_directory (html_export_directory, Current))
		end

	on_select_all (text: EV_TEXT_FIELD)
			-- Select all text in  `text', if any.
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
