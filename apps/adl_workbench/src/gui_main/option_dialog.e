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

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			-- create widgets
			create ev_vbox_1
			create paths_setting_frame
			create ev_vbox_2
			create ev_hbox_1
			create ev_label_1
			create export_text
			create export_browse_button
			create ev_hbox_2
			create ev_label_2
			create save_diff_path_text
			create save_diff_path_button
			create compiler_settings_frame
			create ev_vbox_3
			create ev_hbox_3
			create ev_hbox_4
			create ev_label_3
			create parser_error_reporting_level_combo_box
			create ev_hbox_5
			create ev_label_4
			create adl_save_version_combo_box
			create ev_hbox_6
			create validation_strict_check_button
			create rm_flattening_on_check_button
			create archetype_view_frame
			create ev_vbox_4
			create ev_hbox_7
			create show_definition_tree_expanded_check_button
			create show_line_numbers_check_button
			create ev_hbox_8
			create display_archetype_source_check_button
			create show_entire_ontology_check_button
			create use_rm_pixmaps_check_button
			create ev_frame_1
			create ev_vbox_5
			create ev_hbox_9
			create ev_label_5
			create text_editor_command_text
			create text_editor_command_browse_button
			create ev_hbox_10
			create ev_label_6
			create editor_app_command_text
			create editor_app_command_browse_button
			create ev_hbox_11
			create ev_label_7
			create difftool_command_text
			create difftool_command_browse_button
			create ev_hbox_12
			create ev_cell_1
			create ok_button
			create cancel_button

			-- Build widget structure.
			extend (ev_vbox_1)
			ev_vbox_1.extend (paths_setting_frame)
			paths_setting_frame.extend (ev_vbox_2)
			ev_vbox_2.extend (ev_hbox_1)
			ev_hbox_1.extend (ev_label_1)
			ev_hbox_1.extend (export_text)
			ev_hbox_1.extend (export_browse_button)
			ev_vbox_2.extend (ev_hbox_2)
			ev_hbox_2.extend (ev_label_2)
			ev_hbox_2.extend (save_diff_path_text)
			ev_hbox_2.extend (save_diff_path_button)
			ev_vbox_1.extend (compiler_settings_frame)

			compiler_settings_frame.extend (ev_vbox_3)
			ev_vbox_3.extend (ev_hbox_3)
			ev_hbox_3.extend (ev_hbox_4)
			ev_hbox_4.extend (ev_label_3)
			ev_hbox_4.extend (parser_error_reporting_level_combo_box)
			ev_hbox_3.extend (ev_hbox_5)
			ev_hbox_5.extend (ev_label_4)
			ev_hbox_5.extend (adl_save_version_combo_box)
			ev_vbox_3.extend (ev_hbox_6)
			ev_hbox_6.extend (validation_strict_check_button)
			ev_hbox_6.extend (rm_flattening_on_check_button)
			ev_vbox_1.extend (archetype_view_frame)

			archetype_view_frame.extend (ev_vbox_4)
			ev_vbox_4.extend (ev_hbox_7)
			ev_hbox_7.extend (show_definition_tree_expanded_check_button)
			ev_hbox_7.extend (show_line_numbers_check_button)
			ev_vbox_4.extend (ev_hbox_8)
			ev_hbox_8.extend (display_archetype_source_check_button)
			ev_hbox_8.extend (show_entire_ontology_check_button)
			ev_hbox_8.extend (use_rm_pixmaps_check_button)
			ev_vbox_1.extend (ev_frame_1)

			ev_frame_1.extend (ev_vbox_5)
			ev_vbox_5.extend (ev_hbox_9)
			ev_hbox_9.extend (ev_label_5)
			ev_hbox_9.extend (text_editor_command_text)
			ev_hbox_9.extend (text_editor_command_browse_button)
			ev_vbox_5.extend (ev_hbox_10)
			ev_hbox_10.extend (ev_label_6)
			ev_hbox_10.extend (editor_app_command_text)
			ev_hbox_10.extend (editor_app_command_browse_button)
			ev_vbox_5.extend (ev_hbox_11)
			ev_hbox_11.extend (ev_label_7)
			ev_hbox_11.extend (difftool_command_text)
			ev_hbox_11.extend (difftool_command_browse_button)
			ev_vbox_1.extend (ev_hbox_12)
			ev_hbox_12.extend (ev_cell_1)
			ev_hbox_12.extend (ok_button)
			ev_hbox_12.extend (cancel_button)

			ev_vbox_1.set_minimum_width (200)
			ev_vbox_1.set_minimum_height (290)
			ev_vbox_1.set_padding (Default_padding_width)
			ev_vbox_1.set_border_width (Default_border_width)
			ev_vbox_1.disable_item_expand (ev_hbox_12)
			paths_setting_frame.set_font (screen_10_pt_regular_font)
			paths_setting_frame.set_text ("Paths and resources")
			paths_setting_frame.set_minimum_height (60)
			ev_vbox_2.set_minimum_width (360)
			ev_vbox_2.set_minimum_height (60)
			ev_vbox_2.set_padding (Default_padding_width)
			ev_vbox_2.set_border_width (Default_border_width)
			ev_vbox_2.disable_item_expand (ev_hbox_1)
			ev_vbox_2.disable_item_expand (ev_hbox_2)
			ev_hbox_1.set_minimum_width (350)
			ev_hbox_1.set_minimum_height (30)
			ev_hbox_1.set_padding (Default_padding_width)
			ev_hbox_1.set_border_width (Default_border_width)
			ev_hbox_1.disable_item_expand (ev_label_1)
			ev_hbox_1.disable_item_expand (export_browse_button)
			ev_label_1.set_text ("Export directory")
			export_text.set_background_color (editable_colour)
			export_text.set_minimum_width (300)
			export_browse_button.set_text ("Browse...")
			export_browse_button.set_minimum_width (65)
			ev_hbox_2.set_minimum_width (350)
			ev_hbox_2.set_minimum_height (30)
			ev_hbox_2.set_padding (Default_padding_width)
			ev_hbox_2.set_border_width (Default_border_width)
			ev_hbox_2.disable_item_expand (ev_label_2)
			ev_hbox_2.disable_item_expand (save_diff_path_button)
			ev_label_2.set_text ("Save test diff files to:")
			save_diff_path_text.set_background_color (editable_colour)
			save_diff_path_text.set_minimum_width (300)
			save_diff_path_button.set_text ("Browse...")
			save_diff_path_button.set_minimum_width (65)
			compiler_settings_frame.set_font (screen_10_pt_regular_font)
			compiler_settings_frame.set_text ("Compiler settings")
			compiler_settings_frame.set_minimum_height (55)
			ev_vbox_3.set_padding (Default_padding_width)
			ev_vbox_3.set_border_width (Default_border_width)
			ev_vbox_3.disable_item_expand (ev_hbox_3)
			ev_vbox_3.disable_item_expand (ev_hbox_6)
			ev_hbox_4.set_minimum_height (23)
			ev_hbox_4.set_padding (Default_padding_width)
			ev_hbox_4.set_border_width (Default_border_width)
			ev_hbox_4.disable_item_expand (ev_label_3)
			ev_hbox_4.disable_item_expand (parser_error_reporting_level_combo_box)
			ev_label_3.set_text ("Error reporting level:")
			ev_label_3.set_minimum_height (14)
			parser_error_reporting_level_combo_box.set_text ("Status Reporting Level")
			parser_error_reporting_level_combo_box.set_tooltip ("Select the level of parser messages to display. All levels >= this level displayed.")
			parser_error_reporting_level_combo_box.set_minimum_width (100)
			ev_hbox_5.set_minimum_height (26)
			ev_hbox_5.set_padding (Default_padding_width)
			ev_hbox_5.set_border_width (Default_border_width)
			ev_hbox_5.disable_item_expand (ev_label_4)
			ev_hbox_5.disable_item_expand (adl_save_version_combo_box)
			ev_label_4.set_text ("ADL version for serialisation")
			ev_label_4.set_tooltip ("which version of the ADL syntax to use when saving archetypes")
			ev_label_4.set_minimum_height (14)
			adl_save_version_combo_box.disable_edit
			ev_hbox_6.set_minimum_height (23)
			ev_hbox_6.set_padding (Default_padding_width)
			ev_hbox_6.set_border_width (Default_border_width)
			validation_strict_check_button.set_text ("Validation strict")
			rm_flattening_on_check_button.set_text ("RM flattening on")
			rm_flattening_on_check_button.set_tooltip ("Include RM class attribute existence and cardinality in flattened archetypes.")
			archetype_view_frame.set_font (screen_10_pt_regular_font)
			archetype_view_frame.set_text ("User interface settings")
			archetype_view_frame.set_minimum_height (50)
			ev_vbox_4.set_minimum_height (50)
			ev_vbox_4.set_padding (Default_padding_width)
			ev_vbox_4.set_border_width (Default_border_width)
			ev_vbox_4.disable_item_expand (ev_hbox_7)
			ev_vbox_4.disable_item_expand (ev_hbox_8)
			ev_hbox_7.set_minimum_height (25)
			ev_hbox_7.set_padding (Default_padding_width)
			ev_hbox_7.set_border_width (Default_border_width)
			show_definition_tree_expanded_check_button.set_text ("Show definition tree expanded")
			show_line_numbers_check_button.set_text ("Show line numbers in ADL source")
			ev_hbox_8.set_minimum_height (25)
			ev_hbox_8.set_padding (Default_padding_width)
			ev_hbox_8.set_border_width (Default_border_width)
			display_archetype_source_check_button.set_text ("Show original creation form")
			display_archetype_source_check_button.set_tooltip ("Indicate original format  - ADL 1.4 legacy flat, ADL 1.5, etc")
			show_entire_ontology_check_button.set_text ("Show all classes in explorer")
			show_entire_ontology_check_button.set_tooltip ("Show all archetypable classes in RM even if there are no archetypes based on them in the current repository.")
			use_rm_pixmaps_check_button.set_text ("Use RM icons")
			use_rm_pixmaps_check_button.set_tooltip ("Use RM-specific icons in visualisation of archetype definition?")
			ev_frame_1.set_text ("External Tools")
			ev_frame_1.set_minimum_width (80)
			ev_frame_1.set_minimum_height (90)
			ev_vbox_5.set_minimum_height (90)
			ev_vbox_5.set_padding (Default_border_width)
			ev_vbox_5.set_border_width (Default_padding_width)
			ev_vbox_5.disable_item_expand (ev_hbox_9)
			ev_vbox_5.disable_item_expand (ev_hbox_10)
			ev_vbox_5.disable_item_expand (ev_hbox_11)
			ev_hbox_9.set_minimum_width (80)
			ev_hbox_9.set_minimum_height (30)
			ev_hbox_9.set_padding (Default_padding_width)
			ev_hbox_9.set_border_width (Default_border_width)
			ev_hbox_9.disable_item_expand (ev_label_5)
			ev_hbox_9.disable_item_expand (text_editor_command_browse_button)
			ev_label_5.set_text ("Text Editor: ")
			text_editor_command_text.set_minimum_height (22)
			text_editor_command_browse_button.set_text ("Browse...")
			text_editor_command_browse_button.set_minimum_width (65)
			ev_hbox_10.set_minimum_width (80)
			ev_hbox_10.set_minimum_height (30)
			ev_hbox_10.set_padding (Default_padding_width)
			ev_hbox_10.set_border_width (Default_border_width)
			ev_hbox_10.disable_item_expand (ev_label_6)
			ev_hbox_10.disable_item_expand (editor_app_command_browse_button)
			ev_label_6.set_text (" ADL Editor:")
			editor_app_command_text.set_minimum_height (22)
			editor_app_command_browse_button.set_text ("Browse...")
			editor_app_command_browse_button.set_minimum_width (65)
			ev_hbox_11.set_minimum_width (80)
			ev_hbox_11.set_minimum_height (30)
			ev_hbox_11.set_padding (Default_padding_width)
			ev_hbox_11.set_border_width (Default_border_width)
			ev_hbox_11.disable_item_expand (ev_label_7)
			ev_hbox_11.disable_item_expand (difftool_command_browse_button)
			ev_label_7.set_text ("    Diff Tool: ")
			difftool_command_text.set_minimum_height (22)
			difftool_command_browse_button.set_text ("Browse...")
			difftool_command_browse_button.set_minimum_width (65)
			ev_hbox_12.set_minimum_height (34)
			ev_hbox_12.set_padding (15)
			ev_hbox_12.set_border_width (Default_border_width)
			ev_hbox_12.disable_item_expand (ok_button)
			ev_hbox_12.disable_item_expand (cancel_button)
			ev_cell_1.set_minimum_width (100)
			ok_button.set_text ("OK")
			ok_button.set_minimum_width (100)
			ok_button.set_minimum_height (26)
			cancel_button.set_text ("Cancel")
			cancel_button.set_minimum_width (100)
			cancel_button.set_minimum_height (26)
			set_minimum_width (600)
			set_minimum_height (480)
			set_maximum_width (2000)
			set_maximum_height (1200)
			set_title ("ADL Workbench Options")
			set_icon_pixmap (adl_workbench_icon)
			cancel_button.select_actions.extend (agent hide)
			set_default_cancel_button (cancel_button)
			set_default_push_button (ok_button)

				-- Connect events.
			export_browse_button.select_actions.extend (agent on_export_browse)
			save_diff_path_button.select_actions.extend (agent on_test_diff_path_browse)
			text_editor_command_browse_button.select_actions.extend (agent on_text_editor_command_browse)
			editor_app_command_browse_button.select_actions.extend (agent on_editor_app_command_browse)
			difftool_command_browse_button.select_actions.extend (agent on_difftool_command_browse)
			ok_button.select_actions.extend (agent on_ok)
			export_text.focus_in_actions.extend (agent on_select_all (export_text))
			save_diff_path_text.focus_in_actions.extend (agent on_select_all (save_diff_path_text))

			text_editor_command_text.focus_in_actions.extend (agent on_select_all (text_editor_command_text))
			editor_app_command_text.focus_in_actions.extend (agent on_select_all (editor_app_command_text))
			difftool_command_text.focus_in_actions.extend (agent on_select_all (difftool_command_text))

			-- populate
			populate_controls
		end

feature -- Status

	has_changed_ui_options: BOOLEAN
			-- Has the user OK'ed changes?

	has_changed_navigator_options: BOOLEAN
			-- True if some option has changed that would require the navigator to be redrawn

feature -- Events

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
			set_use_rm_pixmaps (use_rm_pixmaps_check_button.is_selected)
			set_show_entire_ontology (show_entire_ontology_check_button.is_selected)
			if show_entire_ontology /= old_show_entire_ontology then
				has_changed_navigator_options := True
			else
				has_changed_navigator_options := False
			end

			-- paths options: set directly; NO FURTHER ACTION REQUIRED IN GUI
			set_export_directory (export_text.text.as_string_8)
			set_test_diff_directory (save_diff_path_text.text.as_string_8)

			-- compilation options: set directly; NO FURTHER ACTION REQUIRED IN GUI
			set_adl_version_for_flat_output (adl_save_version_combo_box.text.as_string_8)
			set_validation_strict (validation_strict_check_button.is_selected)
			set_rm_flattening_on (rm_flattening_on_check_button.is_selected)
			set_error_reporting_level (error_type_ids.item (parser_error_reporting_level_combo_box.text.as_string_8))
			billboard.set_error_reporting_level (error_reporting_level)
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

	on_export_browse
			-- Let the user browse for the directory to which serialised files will be exported.
		do
			export_text.set_text (get_directory (export_text.text.as_string_8, Current))
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

			if use_rm_pixmaps then
				use_rm_pixmaps_check_button.enable_select
			else
				use_rm_pixmaps_check_button.disable_select
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

			if rm_flattening_on then
				rm_flattening_on_check_button.enable_select
			else
				rm_flattening_on_check_button.disable_select
			end

			-- resource / directory options
			export_text.set_text (export_directory)
			save_diff_path_text.set_text (test_diff_directory)
		end

	ev_vbox_1, ev_vbox_2, ev_vbox_3, ev_vbox_4, ev_vbox_5: EV_VERTICAL_BOX
	paths_setting_frame, compiler_settings_frame, archetype_view_frame, ev_frame_1: EV_FRAME
	ev_hbox_1, ev_hbox_2, ev_hbox_3, ev_hbox_4, ev_hbox_5, ev_hbox_6, ev_hbox_7, ev_hbox_8, ev_hbox_9, ev_hbox_10, ev_hbox_11, ev_hbox_12: EV_HORIZONTAL_BOX
	ev_label_1, ev_label_2, ev_label_3, ev_label_4, ev_label_5, ev_label_6, ev_label_7: EV_LABEL
	export_text, save_diff_path_text, text_editor_command_text, editor_app_command_text, difftool_command_text: EV_TEXT_FIELD
	export_browse_button, save_diff_path_button, text_editor_command_browse_button: EV_BUTTON
	editor_app_command_browse_button, difftool_command_browse_button, ok_button, cancel_button: EV_BUTTON
	parser_error_reporting_level_combo_box, adl_save_version_combo_box: EV_COMBO_BOX
	validation_strict_check_button, rm_flattening_on_check_button, show_definition_tree_expanded_check_button, show_line_numbers_check_button: EV_CHECK_BUTTON
	display_archetype_source_check_button, show_entire_ontology_check_button, use_rm_pixmaps_check_button: EV_CHECK_BUTTON
	ev_cell_1: EV_CELL

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
