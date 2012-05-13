note
	component:   "openEHR Archetype Project"
	description: "RM schemas dialog window"
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	RM_SCHEMA_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
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

	GUI_UTILITIES
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

feature -- Definitions

	Grid_loaded_col: INTEGER = 1
	Grid_name_col: INTEGER = 2
	grid_lifecycle_state_col: INTEGER = 3
	Grid_validated_col: INTEGER = 4
	Grid_edit_col: INTEGER = 5
	Grid_max_cols: INTEGER
		once
			Result := Grid_edit_col
		end

	frame_height: INTEGER = 100

feature {NONE} -- Initialisation

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			-- create widgets
			create ev_root_container
			create ev_cell_1
			create ev_label_1
			create ev_cell_2
			create grid
			create ev_cell_3
			create ev_hbox_1
			create ev_label_2
			create rm_schema_dir_text
			create rm_schema_dir_button
			create ev_hbox_2
			create ev_cell_4
			create ok_button
			create cancel_button

			-- connect widgets
			extend (ev_root_container)
			ev_root_container.extend (ev_cell_1)
			ev_root_container.extend (ev_label_1)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.extend (grid)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.extend (ev_hbox_1)
			ev_hbox_1.extend (ev_label_2)
			ev_hbox_1.extend (rm_schema_dir_text)
			ev_hbox_1.extend (rm_schema_dir_button)
			ev_root_container.extend (ev_hbox_2)
			ev_hbox_2.extend (ev_cell_4)
			ev_hbox_2.extend (ok_button)
			ev_hbox_2.extend (cancel_button)

		--	ev_root_container.set_minimum_width (360)
		--	ev_root_container.set_minimum_height (290)
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_3)
			ev_root_container.disable_item_expand (ev_hbox_1)
			ev_root_container.disable_item_expand (ev_hbox_2)
			ev_cell_1.set_minimum_height (20)
			ev_label_1.set_text ("Reference Model schemas loaded shown below.%NCheck or uncheck to load as required.")
			ev_cell_2.set_minimum_height (20)
			grid.set_minimum_height (150)
			ev_cell_3.set_minimum_height (10)
	--		ev_hbox_1.set_minimum_width (350)
	--		ev_hbox_1.set_minimum_height (30)
			ev_hbox_1.set_padding (Default_padding_width)
			ev_hbox_1.set_border_width (Default_border_width)
			ev_hbox_1.disable_item_expand (ev_label_2)
			ev_hbox_1.disable_item_expand (rm_schema_dir_button)
			ev_label_2.set_text ("RM schema directory: ")
	--		rm_schema_dir_text.set_minimum_width (300)
			rm_schema_dir_text.disable_edit
			rm_schema_dir_button.set_text ("Browse...")
			rm_schema_dir_button.set_minimum_width (65)
			ev_hbox_2.set_minimum_height (34)
			ev_hbox_2.set_padding (15)
			ev_hbox_2.set_border_width (Default_border_width)
			ev_hbox_2.disable_item_expand (ok_button)
			ev_hbox_2.disable_item_expand (cancel_button)
			ev_cell_4.set_minimum_width (100)
			ok_button.set_text ("OK")
			ok_button.set_minimum_width (100)
			ok_button.set_minimum_height (26)
			cancel_button.set_text ("Cancel")
			cancel_button.set_minimum_width (100)
			cancel_button.set_minimum_height (26)
	--		set_minimum_width (550)
	--		set_minimum_height (390)
	--		set_maximum_width (800)
	--		set_maximum_height (800)
			set_title ("ADL Workbench RM Schema Configuration")
			set_icon_pixmap (adl_workbench_icon)

			-- Connect events.
			rm_schema_dir_button.select_actions.extend (agent on_rm_schema_dir_browse)
			ok_button.select_actions.extend (agent on_ok)
			cancel_button.select_actions.extend (agent hide)
			set_default_cancel_button (cancel_button)
			set_default_push_button (ok_button)
			show_actions.extend (agent grid.set_focus)

			populate_grid
			ev_root_container.refresh_now
			rm_schema_dir_text.set_text (rm_schema_directory)

			-- FIXME: this is a complete hack, but I cannot find another way to control the height properly!
		--	set_height (ev_root_container.height + frame_height + ev_root_container.last.minimum_height)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Status

	has_changed_schema_load_list: BOOLEAN
			-- Schema load list has changed; should refresh

	has_changed_schema_dir: BOOLEAN
			-- Schema load directory has changed; should refresh

feature -- Events

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			i: INTEGER
			new_dir: STRING
		do
			hide

			new_dir := rm_schema_dir_text.text.as_string_8
			if not new_dir.same_string (rm_schema_directory) and directory_exists (new_dir) then
				set_rm_schema_directory (new_dir)
				has_changed_schema_dir := True
			end

			-- get the user-chosen list of schemas from the load list Grid
			create {ARRAYED_LIST [STRING]} rm_schemas_ll.make (0)
			rm_schemas_ll.compare_objects
			from i := 1 until i > grid.row_count loop
				if attached {EV_GRID_CHECKABLE_LABEL_ITEM} grid.row (i).item (Grid_loaded_col) as gcli and then gcli.is_checked then
					if attached {EV_GRID_LABEL_ITEM} grid.row (i).item (Grid_name_col) as gli then
						rm_schemas_ll.extend(gli.text)
					end
				end
				i := i + 1
			end

			if not rm_schemas_ll.is_empty and not rm_schemas_ll.is_equal (rm_schemas_load_list) then
				set_rm_schemas_load_list (rm_schemas_ll)
				rm_schemas_access.set_schema_load_list (rm_schemas_ll)
				has_changed_schema_load_list := True
			end
		end

	on_rm_schema_dir_browse
			-- Let the user browse for the directory where RM schemas are found.
			-- if a change is made, reload schemas immediately, then repopulate this dialog
		local
			error_dialog: EV_INFORMATION_DIALOG
			new_dir: STRING
		do
			rm_schema_dir_text.set_text (get_directory (rm_schema_dir_text.text.as_string_8, Current))
			ev_application.process_events
			new_dir := rm_schema_dir_text.text.as_string_8

			if not new_dir.same_string (rm_schema_directory) and directory_exists (new_dir) then
				ok_button.disable_sensitive
				cancel_button.disable_sensitive

				rm_schemas_access.initialise_with_load_list (new_dir, rm_schemas_load_list)

				if not rm_schemas_access.found_valid_schemas then
					post_error (Current, "load_schemas", "model_access_e13", <<new_dir>>)
					create error_dialog.make_with_text (billboard.content)
					billboard.clear
					error_dialog.show_modal_to_window (Current)
				end

				populate_grid

				ok_button.enable_sensitive
				cancel_button.enable_sensitive
			end
		end

feature {NONE} -- Implementation

	populate_grid
			-- Set the grid from shared settings.
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			gcli: EV_GRID_CHECKABLE_LABEL_ITEM
			schema_id: STRING
			i: INTEGER
			schema_meta_data: HASH_TABLE [STRING, STRING]
			form_width: INTEGER
		do
			-- get rid of previously defined rows
			grid.wipe_out
			grid.enable_column_resize_immediate
			grid.set_minimum_height (rm_schemas_access.all_schemas.count * grid.row_height + grid.header.height)

			-- create row containinng widgets for: check column, name column, status column, edit button column
			from rm_schemas_access.all_schemas.start until rm_schemas_access.all_schemas.off loop
				schema_id := rm_schemas_access.all_schemas.key_for_iteration
				schema_meta_data := rm_schemas_access.all_schemas.item (schema_id).meta_data

				-- column 1 - check box to indicate loaded; only on top-level schemas
				if rm_schemas_access.all_schemas.item_for_iteration.is_top_level then
					create gcli.make_with_text ("        ")
					gcli.set_is_checked (rm_schemas_access.schemas_load_list.has (schema_id))
					grid.set_item (Grid_loaded_col, grid.row_count + 1, gcli)
					row := gcli.row
				else
					create gli.make_with_text ("        ")
					grid.set_item (Grid_loaded_col, grid.row_count + 1, gli)
					row := gli.row
				end

				-- column 2 - RM schema name
				create gli.make_with_text (schema_id)
				gli.set_tooltip (schema_meta_data.item(metadata_schema_path))
				row.set_item (Grid_name_col, gli)

				-- column 3 - lifecycle state
				if schema_meta_data.has (Metadata_schema_lifecycle_state) then
					create gli.make_with_text (schema_meta_data.item (Metadata_schema_lifecycle_state))
				else
					create gli.make_with_text ("(unknown)")
				end
				row.set_item (grid_lifecycle_state_col, gli)

				-- column 4 - validated
				create gli.make_with_text ("         ")
				if rm_schemas_access.all_schemas.item_for_iteration.passed and not rm_schemas_access.all_schemas.item_for_iteration.errors.has_warnings then
					gli.set_pixmap (get_icon_pixmap ("tool/star"))
				else
					if rm_schemas_access.all_schemas.item_for_iteration.errors.has_errors then
						gli.set_pixmap (get_icon_pixmap ("tool/errors"))
					else
						gli.set_pixmap (get_icon_pixmap ("tool/info"))
					end
					gli.select_actions.extend (agent show_schema_validation (schema_id))
				end
				row.set_item (Grid_validated_col, gli)

				-- column 5 - create edit button and add to row
				create gli.make_with_text ("Edit")
				gli.set_pixmap (get_icon_pixmap ("tool/edit"))
				gli.select_actions.extend (agent do_edit_schema (schema_id))
				row.set_item (Grid_edit_col, gli)
				rm_schemas_access.all_schemas.forth
			end

			-- make the columnn content visible
			if grid.row_count > 0 then
				-- set grid column titles
				grid.column (Grid_loaded_col).set_title ("Loaded")
				grid.column (Grid_name_col).set_title ("Name")
				grid.column (grid_lifecycle_state_col).set_title ("Lifecycle state")
				grid.column (Grid_validated_col).set_title ("Validated")

				from i := 1 until i > Grid_max_cols loop
					grid.column(i).resize_to_content
					grid.column(i).set_width ((grid.column (i).width * 1.2).ceiling)
					form_width := form_width + grid.column (i).width
					i := i + 1
				end
			end

			set_width (form_width + Default_padding_width * (grid.column_count + 1) + Default_border_width * 2)
		end

	do_edit_schema (a_schema_id: STRING)
			-- launch external editor with schema, or info box if none defined
		do
			execution_environment.launch (text_editor_command + " %"" + rm_schemas_access.all_schemas.item (a_schema_id).meta_data.item (metadata_schema_path) + "%"")
		end

	show_schema_validation (a_schema_id: STRING)
			-- display info dialog with validity report
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (rm_schemas_access.all_schemas.item (a_schema_id).errors.as_string)
			info_dialog.show_modal_to_window (Current)
		end

	rm_schemas_ll: LIST [STRING]
			-- list of checked schemas in options dialog

	ev_cell_1, ev_cell_2, ev_cell_3, ev_cell_4: EV_CELL
	ev_label_1, ev_label_2: EV_LABEL
	grid: EV_GRID
	ev_hbox_1, ev_hbox_2: EV_HORIZONTAL_BOX
	rm_schema_dir_text: EV_TEXT_FIELD
	rm_schema_dir_button, ok_button, cancel_button: EV_BUTTON

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
