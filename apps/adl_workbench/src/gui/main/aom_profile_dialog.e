note
	component:   "openEHR Archetype Project"
	description: "RM schemas dialog window"
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	AOM_PROFILE_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		undefine
			is_equal, default_create, copy
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature -- Definitions

	Grid_profile_col: INTEGER = 1
	Grid_rm_schemas_col: INTEGER = 2
	Grid_validated_col: INTEGER = 3
	Grid_edit_col: INTEGER = 4
	Grid_max_cols: INTEGER
		once
			Result := Grid_edit_col
		end

	frame_height: INTEGER = 50

	Grid_expansion_factor: REAL = 1.2

feature {NONE} -- Initialisation

	create_interface_objects
			-- Initialize `Current'.
		do
			create gui_controls.make (0)
			last_populated_rm_schema_dir := rm_schema_directory.twin

			Precursor {EV_DIALOG}

			-- ============ root container ============
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ top label ============
			create ev_cell_1
			ev_cell_1.set_minimum_height (20)
			ev_root_container.extend (ev_cell_1)
			create ev_label_1
			ev_label_1.set_text (get_text ("aom_profile_dialog_header_label"))
			ev_root_container.extend (ev_label_1)
			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ main grid ============
			create grid.make
			-- grid.enable_tree
			ev_root_container.extend (grid)
			grid.set_minimum_height (50)

			-- space cell
			create ev_cell_3
			ev_cell_3.set_minimum_height (10)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.disable_item_expand (ev_cell_3)

			-- ============ AOM profile directory getter ============
			create dir_setter.make (get_text ("aom_profile_dir_text"), agent :STRING do Result := aom_profile_directory end, 0, 0)
			dir_setter.set_post_select_agent (agent on_set_aom_profile_dir)
			ev_root_container.extend (dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (dir_setter.ev_root_container)
			gui_controls.extend (dir_setter)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent on_cancel)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor
			extend (ev_root_container)
			set_title (get_text ("aom_profile_dialog_title"))
			set_icon_pixmap (adl_workbench_logo)

			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- Connect events.
			show_actions.extend (agent grid.set_focus)

			enable_edit
			do_populate
			ev_root_container.refresh_now
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Status

	has_changed_schema_load_list: BOOLEAN
			-- Schema load list has changed; should refresh

	has_changed_schema_dir: BOOLEAN
			-- Schema load directory has changed; should refresh

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature -- Events

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			i: INTEGER
			error_dialog: EV_INFORMATION_DIALOG
		do
			-- we do this call again, even though it might have alredy been executed due to the user using the
			-- directory browse button (multiple times). We do it here because the user might have also set the
			-- directory by directly typing in the directory text box (in which case there is no other event to
			-- link this call to)
			on_set_aom_profile_dir

			-- case where the directory no longer exists or is readable
			if not directory_exists (last_populated_aom_profile_dir) then
				post_error (generator, "load_schemas", "model_access_e5", <<last_populated_aom_profile_dir>>)
				create error_dialog.make_with_text (billboard.content)
				billboard.clear
				error_dialog.show_modal_to_window (Current)
			else
				hide
				if not last_populated_aom_profile_dir.same_string (aom_profile_directory) and directory_exists (last_populated_aom_profile_dir) then
					set_aom_profile_directory (last_populated_aom_profile_dir)
					has_changed_schema_dir := True
				end

				-- get the user-chosen list of schemas from the load list Grid
				aom_profiles_ll.wipe_out
				from i := 1 until i > grid.row_count loop
					if attached {EV_GRID_CHECKABLE_LABEL_ITEM} grid.row (i).item (Grid_schema_col) as gcli and then gcli.is_checked then
						aom_profiles_ll.extend (gcli.text)
					end
					i := i + 1
				end

				if not aom_profiles_ll.is_empty and not aom_profiles_ll.is_equal (aom_profiles_load_list) then
					set_aom_profiles_load_list (aom_profiles_ll)
					aom_profiles_access.set_schema_load_list (aom_profiles_ll)
					has_changed_schema_load_list := True
				end
			end
		end

	on_cancel
			-- Set shared settings from the dialog widgets.
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if not directory_exists (last_populated_aom_profile_dir) then
				post_error (generator, "load_schemas", "model_access_e5", <<last_populated_aom_profile_dir>>)
				create error_dialog.make_with_text (billboard.content)
				billboard.clear
				error_dialog.show_modal_to_window (Current)
			else
				hide
			end
		end

	on_set_aom_profile_dir
			-- Let the user browse for the directory where AOM profiles are found.
			-- if a change is made, reload profiles immediately, then repopulate this dialog
		local
			error_dialog: EV_INFORMATION_DIALOG
			new_dir: STRING
		do
			new_dir := dir_setter.data_control_text
			if not new_dir.same_string (last_populated_aom_profile_dir) and directory_exists (new_dir) then
				ok_cancel_buttons.disable_sensitive
				aom_profiles_access.initialise (new_dir)
				if not aom_profiles_access.found_valid_profiles then
					post_error (generator, "load_schemas", "aom_profile_no_valid_profiles_in_dir", <<new_dir>>)
					create error_dialog.make_with_text (billboard.content)
					billboard.clear
					error_dialog.show_modal_to_window (Current)
				end
				populate_grid
				ok_cancel_buttons.enable_sensitive
				last_populated_aom_profile_dir := new_dir
			end
		end

	last_populated_aom_profile_dir: STRING

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
			populate_grid
		end

	populate_grid
			-- Set the grid from shared settings.
		local
			i: INTEGER
			form_width: INTEGER
			gli: EV_GRID_LABEL_ITEM
			gci: EV_GRID_COMBO_ITEM 
			row: EV_GRID_ROW
		do
			-- get rid of previously defined rows
			grid.wipe_out
			grid.enable_column_resize_immediate
			grid.set_minimum_height (aom_profiles_access.profiles.count * grid.row_height + grid.header.height)

			-- create row containinng widgets for each profile
			across aom_profiles.profiles as profs_csr loop
				-- column 1 - profile name
				create gli.make_with_text (a_profile.profile_name)
				grid.set_item (Grid_profile_col, grid.row_count + 1, gli)
				row := gli.row

				-- column 2 - matched Reference Models list
				create gci
				gci.set_item_strings (a_profile.rm_schemas)
				row.set_item (Grid_rm_schemas_col, gci)

				-- column 3 - validated
				create gli.make_with_text ("         ")
				if a_profile.passed and not a_profile.errors.has_warnings then
					gli.set_pixmap (get_icon_pixmap ("tool/star"))
				else
					if a_profile.errors.has_errors then
						gli.set_pixmap (get_icon_pixmap ("tool/errors"))
					else
						gli.set_pixmap (get_icon_pixmap ("tool/info"))
					end
					gli.select_actions.extend (agent show_schema_validation (a_profile.schema_id))
				end
				row.set_item (Grid_validated_col, gli)

				-- column 4 - create edit button and add to row
				create gli.make_with_text ("Edit")
				gli.set_pixmap (get_icon_pixmap ("tool/edit"))
				gli.select_actions.extend (agent do_edit_schema (a_profile))
				row.set_item (Grid_edit_col, gli)
			end

			-- make the columnn content visible
			if grid.row_count > 0 then
				-- set grid column titles
				grid.column (Grid_schema_col).set_title (get_text ("aom_profile_grid_profile_col_title"))
				grid.column (Grid_rm_schemas_col).set_title (get_text ("aom_profile_grid_rm_col_title"))
				grid.column (Grid_validated_col).set_title (get_text ("aom_profile_grid_validated_col_title"))
				grid.column (Grid_edit_col).set_title (get_text ("aom_profile_grid_edit_col_title"))

				grid.resize_columns_to_content (Grid_expansion_factor)
				from i := 1 until i > grid.column_count loop
					form_width := form_width + grid.column (i).width
					i := i + 1
				end
			end

			set_width (form_width + Default_padding_width * (grid.column_count + 1) + Default_border_width * 2)
		end

	do_edit_schema (a_profile: AOM_PROFILE)
			-- launch external editor with schema, or info box if none defined
		do
			execution_environment.launch (text_editor_command + " %"" + a_profile.file_path + "%"")
		end

	show_schema_validation (a_profile_id: STRING)
			-- display info dialog with validity report
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (aom_profiles_access.profiles.item (a_profile_id).errors_strings)
			info_dialog.show_modal_to_window (Current)
		end

	ev_cell_1, ev_cell_2, ev_cell_3: EV_CELL

	ev_label_1: EV_LABEL

	grid: EV_GRID_KBD_MOUSE

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	dir_setter: EVX_DIRECTORY_SETTER

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

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
--| The Original Code is rm_schema_dialog.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
