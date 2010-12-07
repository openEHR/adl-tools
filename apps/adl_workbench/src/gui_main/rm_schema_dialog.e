note
	component:   "openEHR Archetype Project"
	description: "RM schemas dialog window"
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	RM_SCHEMA_DIALOG

inherit
	RM_SCHEMA_DIALOG_IMP

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

	SHARED_APP_UI_RESOURCES
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

feature {NONE} -- Initialisation

	user_initialization
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			set_icon_pixmap (adl_workbench_ico)

			-- set up other buttons
			cancel_button.select_actions.extend (agent hide)
			set_default_cancel_button (cancel_button)
			set_default_push_button (ok_button)

			populate_controls

			show_actions.extend (agent grid.set_focus)
		end

feature -- Status

	has_changed_schema_load_list: BOOLEAN
			-- Schema load list has changed; should refresh

	has_changed_schema_dir: BOOLEAN
			-- Schema load directory has changed; should refresh

feature {NONE} -- Implementation

	populate_controls
			-- Set the dialog widgets from shared settings.
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			gcli: EV_GRID_CHECKABLE_LABEL_ITEM
			schema_id: STRING
			i: INTEGER
			schema_meta_data: HASH_TABLE [STRING, STRING]
		do
			-- get rid of previously defined rows
			grid.wipe_out

			-- create row containinng widgets for: check column, name column, status column, edit button column
			from rm_schemas_access.all_schemas.start until rm_schemas_access.all_schemas.off loop
				schema_id := rm_schemas_access.all_schemas.item_for_iteration.schema.schema_id
				schema_meta_data := rm_schemas_access.schema_metadata_table.item (schema_id)

				-- column 1 - check box to indicate loaded; only on top-level schemas
				if rm_schemas_access.all_schemas.item_for_iteration.is_top_level then
					create gcli.make_with_text ("        ")
					gcli.set_is_checked (rm_schemas_load_list.has (schema_id))
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
				if rm_schemas_access.all_schemas.item_for_iteration.passed then
					gli.set_pixmap (pixmaps["star"])
				end
				row.set_item (Grid_validated_col, gli)

				-- column 5 - create edit button and add to row
				create gli.make_with_text ("Edit")
				gli.set_pixmap (pixmaps ["edit"])
				gli.select_actions.extend (agent do_edit_schema(schema_id))
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
					grid.column (i).resize_to_content
					grid.column (i).set_width ((grid.column (i).width * 1.2).ceiling)
					i := i + 1
				end
			end

			-- RM schema dir text field
			rm_schema_dir_text.set_text(rm_schema_directory)
		end

	do_edit_schema(a_schema: STRING)
			-- launch external editor with schema, or info box if none defined
		do
			execution_environment.launch (text_editor_command + " %"" + rm_schemas_access.schema_metadata_table.item (a_schema).item (metadata_schema_path) + "%"")
		end

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			i: INTEGER
		do
			hide

			-- deal with load list Grid
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

			if not rm_schemas_ll.is_equal (rm_schemas_load_list) then
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
		do
			rm_schema_dir_text.set_text (get_directory (rm_schema_dir_text.text.as_string_8, Current))
			ev_application.process_events
			if not rm_schema_dir_text.text.is_equal(rm_schema_directory) then
				rm_schemas_access.initialise(rm_schema_dir_text.text, rm_schemas_load_list)
				rm_schemas_access.load_schemas

				if not rm_schemas_access.found_valid_schemas then
					create error_dialog.make_with_text (billboard.content)
					billboard.clear
					error_dialog.show_modal_to_window (Current)

					-- revert to previous
					rm_schema_dir_text.set_text (rm_schema_directory)
					rm_schemas_access.initialise(rm_schema_directory, rm_schemas_load_list)
					rm_schemas_access.load_schemas
				else
					set_rm_schema_directory(rm_schema_dir_text.text)
					has_changed_schema_dir := True
				end
				populate_controls
			end
		end

feature {NONE} -- Implementation

	rm_schemas_ll: LIST [STRING]
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
