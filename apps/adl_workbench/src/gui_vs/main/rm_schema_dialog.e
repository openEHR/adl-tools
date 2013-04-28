note
	component:   "openEHR Archetype Project"
	description: "RM schemas dialog window"
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	RM_SCHEMA_DIALOG

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

	SHARED_REFERENCE_MODEL_ACCESS
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

feature -- Definitions

	Grid_schema_col: INTEGER = 1
	Grid_lifecycle_state_col: INTEGER = 2
	Grid_validated_col: INTEGER = 3
	Grid_edit_col: INTEGER = 4
	Grid_xml_export_col: INTEGER = 5
	Grid_max_cols: INTEGER
		once
			Result := Grid_xml_export_col
		end

	frame_height: INTEGER = 150

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
			ev_label_1.set_text (get_text (ec_rm_schema_dialog_header_label))
			ev_root_container.extend (ev_label_1)
			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ main grid ============
			create grid
			grid.enable_tree
			ev_root_container.extend (grid)
			grid.set_minimum_height (frame_height)

			-- space cell
			create ev_cell_3
			ev_cell_3.set_minimum_height (10)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.disable_item_expand (ev_cell_3)

			-- ============ RM schema directory getter ============
			create rm_dir_setter.make (get_text (ec_rm_schema_dir_text), agent :STRING do Result := rm_schema_directory end, 0, 0)
			rm_dir_setter.set_post_select_agent (agent on_set_rm_schema_dir)
			ev_root_container.extend (rm_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (rm_dir_setter.ev_root_container)
			gui_controls.extend (rm_dir_setter)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent on_cancel)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor
			extend (ev_root_container)
			set_title (get_text (ec_rm_schema_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- Connect events.
			show_actions.extend (agent grid.set_focus)

			-- add a reload button to the left of Ok/ Cancel
			ok_cancel_buttons.add_button (get_text (ec_rm_schema_dialog_reload_button_text), agent on_reload)

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

	on_reload
			-- alow user reload after manual changes while correcting schemas
		do
			do_with_wait_cursor (Current, agent reload)
		end

	reload
			-- alow user reload after manual changes while correcting schemas
		do
			reset_rm_schemas_load_list
			rm_schemas_access.reload_schemas
			do_populate
		end

feature -- Events

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			-- we do this call again, even though it might have alredy been executed due to the user using the
			-- directory browse button (multiple times). We do it here because the user might have also set the
			-- directory by directly typing in the directory text box (in which case there is no other event to
			-- link this call to)
			on_set_rm_schema_dir

			-- case where the directory no longer exists or is readable
			if not directory_exists (last_populated_rm_schema_dir) then
				create error_dialog.make_with_text (get_msg (ec_bmm_schema_dir_not_valid, <<last_populated_rm_schema_dir>>))
				error_dialog.show_modal_to_window (Current)
			else
				hide
				if not last_populated_rm_schema_dir.same_string (rm_schema_directory) and directory_exists (last_populated_rm_schema_dir) then
					set_rm_schema_directory (last_populated_rm_schema_dir)
					has_changed_schema_dir := True
				end
				reset_rm_schemas_load_list
			end
		end

	on_cancel
			-- Set shared settings from the dialog widgets.
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if not directory_exists (last_populated_rm_schema_dir) then
				create error_dialog.make_with_text (get_msg (ec_bmm_schema_dir_not_valid, <<last_populated_rm_schema_dir>>))
				error_dialog.show_modal_to_window (Current)
			else
				hide
			end
		end

	on_set_rm_schema_dir
			-- Let the user browse for the directory where RM schemas are found.
			-- if a change is made, reload schemas immediately, then repopulate this dialog
		local
			error_dialog: EV_INFORMATION_DIALOG
			new_rm_dir: STRING
		do
			new_rm_dir := rm_dir_setter.data_control_text
			if not new_rm_dir.same_string (last_populated_rm_schema_dir) and directory_exists (new_rm_dir) then
				ok_cancel_buttons.disable_sensitive
				rm_schemas_access.initialise_with_load_list (new_rm_dir, rm_schemas_load_list)
				if not rm_schemas_access.found_valid_schemas then
					create error_dialog.make_with_text (get_msg (ec_bmm_schema_dir_contains_no_valid_schemas, <<new_rm_dir>>))
					error_dialog.show_modal_to_window (Current)
				end
				populate_grid
				ok_cancel_buttons.enable_sensitive
				last_populated_rm_schema_dir := new_rm_dir
			end
		end

	last_populated_rm_schema_dir: STRING

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
			populate_grid
		end

	reset_rm_schemas_load_list
			-- get the user-chosen list of schemas from the load list Grid first column check boxes
		local
			rm_schemas_ll: LIST [STRING]
			i: INTEGER
		do
			create {ARRAYED_LIST [STRING]} rm_schemas_ll.make (0)
			rm_schemas_ll.compare_objects
			from i := 1 until i > grid.row_count loop
				if attached {EV_GRID_CHECKABLE_LABEL_ITEM} grid.row (i).item (Grid_schema_col) as gcli and then gcli.is_checked then
					rm_schemas_ll.extend (gcli.text)
				end
				i := i + 1
			end

			if not rm_schemas_ll.is_empty and not rm_schemas_ll.is_equal (rm_schemas_load_list) then
				set_rm_schemas_load_list (rm_schemas_ll)
				rm_schemas_access.set_schema_load_list (rm_schemas_ll)
				has_changed_schema_load_list := True
			end
		end

	populate_grid
			-- Set the grid from shared settings.
		local
			i: INTEGER
			form_width: INTEGER
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
		do
			-- get rid of previously defined rows
			grid.wipe_out
			grid.enable_column_resize_immediate
			grid.set_minimum_height (rm_schemas_access.all_schemas.count * grid.row_height + grid.header.height)

			-- create row containing widgets for each top-level schema, with child schemas in tree
			across rm_schemas_access.top_level_schemas_by_publisher as pub_csr loop
				create gli.make_with_text (pub_csr.key)
				gli.set_pixmap (get_icon_pixmap ("tool/globe"))
				grid.set_item (Grid_schema_col, grid.row_count + 1, gli)
				row := gli.row
				across pub_csr.item as pub_schemas_csr loop
					add_schema_publisher_grid_rows (pub_schemas_csr.item, row)
				end
				if row.is_expandable then
					row.expand
				end
			end

			-- make the columnn content visible
			if grid.row_count > 0 then
				-- set grid column titles
				grid.column (Grid_schema_col).set_title (get_text (ec_rm_schema_grid_schema_col_title))
				grid.column (grid_lifecycle_state_col).set_title (get_text (ec_rm_schema_grid_lifecycle_state_col_title))
				grid.column (Grid_validated_col).set_title (get_text (ec_rm_schema_grid_validated_col_title))
				grid.column (grid_edit_col).set_title (get_text (ec_rm_schema_grid_edit_col_title))
				grid.column (grid_xml_export_col).set_title (get_text (ec_rm_schema_grid_xml_schema_export_col_title))

				grid.resize_columns_to_content (Grid_expansion_factor)
				from i := 1 until i > grid.column_count loop
					form_width := form_width + grid.column (i).width
					i := i + 1
				end
			end

			set_width (form_width + Default_padding_width * (grid.column_count + 1) + Default_border_width * 2)
		end

	add_schema_publisher_grid_rows (a_schema_desc: SCHEMA_DESCRIPTOR; parent_row: detachable EV_GRID_ROW)
			-- add rows for `schema_id' and its children, recursively
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			gcli: EV_GRID_CHECKABLE_LABEL_ITEM
		do
			-- column 1 - name + check box to indicate loaded on top-level schemas
			parent_row.insert_subrow (parent_row.subrow_count + 1)
			row := parent_row.subrow (parent_row.subrow_count)
			if a_schema_desc.is_top_level then
				create gcli.make_with_text (a_schema_desc.schema_id)
				gcli.set_is_checked (rm_schemas_access.schemas_load_list.has (a_schema_desc.schema_id))
				row.set_item (Grid_schema_col, gcli)
			else
				create gli.make_with_text (a_schema_desc.schema_id)
				row.set_item (Grid_schema_col, gli)
			end

			-- column 2 - lifecycle state
			if a_schema_desc.meta_data.has (Metadata_schema_lifecycle_state) and then attached a_schema_desc.meta_data.item (Metadata_schema_lifecycle_state) as ls then
				create gli.make_with_text (ls)
			else
				create gli.make_with_text ("(unknown)")
			end
			row.set_item (grid_lifecycle_state_col, gli)

			-- column 3 - validated
			create gli.make_with_text ("         ")
			if a_schema_desc.passed and not a_schema_desc.errors.has_warnings then
				gli.set_pixmap (get_icon_pixmap ("tool/star"))
			else
				if a_schema_desc.errors.has_errors then
					gli.set_pixmap (get_icon_pixmap ("tool/errors"))
				else
					gli.set_pixmap (get_icon_pixmap ("tool/info"))
				end
				gli.select_actions.extend (agent show_schema_validation (a_schema_desc.schema_id))
			end
			row.set_item (Grid_validated_col, gli)

			-- column 4 - create edit button and add to row
			create gli.make_with_text ("         ")
			gli.set_pixmap (get_icon_pixmap ("tool/edit"))
			gli.select_actions.extend (agent do_edit_schema (a_schema_desc))
			row.set_item (Grid_edit_col, gli)

			-- column 5 - create XML export button and add to row
			create gli.make_with_text ("         ")
			gli.set_pixmap (get_icon_pixmap ("tool/xml"))
			gli.select_actions.extend (agent do_export_schema (a_schema_desc))
			row.set_item (Grid_xml_export_col, gli)

			-- now do child schemas
			across a_schema_desc.includes as includes_csr loop
				check attached rm_schemas_access.all_schemas.item (includes_csr.item) as sch then
					add_schema_publisher_grid_rows (sch, row)
				end
			end
		end

	do_edit_schema (a_schema: SCHEMA_DESCRIPTOR)
			-- launch external editor with schema, or info box if none defined
		do
			check attached a_schema.meta_data.item (metadata_schema_path) as msp then
				execution_environment.launch (text_editor_command + " %"" + msp + "%"")
			end
		end

	do_export_schema (schema_desc: SCHEMA_DESCRIPTOR)
			-- export model as XML and allow saving
		local
			serialise_engine: DADL_ENGINE
			path: STRING
			fd: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
		do
			schema_desc.p_schema.synchronise_to_tree

			create serialise_engine.make
			serialise_engine.set_tree (schema_desc.p_schema.dt_representation)
			serialise_engine.serialise (syntax_type_xml, False, False)

			create save_dialog
			save_dialog.set_title (get_text (ec_export_bmm_schema_dialog_title))
			save_dialog.set_file_name (schema_desc.schema_id + ".xml")
			save_dialog.set_start_directory (export_directory)
			save_dialog.filters.extend (["*.xml", get_msg (ec_save_schema_as, <<"XML">>)])
			check attached proximate_ev_window (ev_root_container) as prox_win then
				save_dialog.show_modal_to_window (prox_win)
			end
			path := save_dialog.file_name.as_string_8

			if not path.is_empty then
				create fd.make_create_read_write (path)
				fd.put_string (serialise_engine.serialised)
				fd.close
			end
		end

	show_schema_validation (a_schema_id: STRING)
			-- display info dialog with validity report
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (rm_schemas_access.all_schemas.item (a_schema_id).errors.as_string)
			info_dialog.show_modal_to_window (Current)
		end

	ev_cell_1, ev_cell_2, ev_cell_3: EV_CELL

	ev_label_1: EV_LABEL

	grid: EV_GRID_KBD_MOUSE

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	rm_dir_setter: EVX_DIRECTORY_SETTER

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
