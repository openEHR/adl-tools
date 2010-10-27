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
	Grid_status_col: INTEGER = 3
	Grid_edit_col: INTEGER = 4
	Grid_max_cols: INTEGER = 4

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

			-- set grid column titles
			grid.column (Grid_name_col).set_title ("Name")
		--	grid.column (Grid_loaded_col).set_title ("Loaded")
			grid.column (Grid_status_col).set_title ("Status")
		--	grid.column (Grid_edit_col).set_title ("Edit")

			show_actions.extend (agent grid.set_focus)
		end

feature -- Status

	has_changed_schema_load_list: BOOLEAN
			-- Schema load list has changed; should refresh

feature {NONE} -- Implementation

	populate_controls
			-- Set the dialog widgets from shared settings.
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			gcli: EV_GRID_CHECKABLE_LABEL_ITEM
			schema_name: STRING
			i: INTEGER
		do
			-- get rid of previously defined rows
			grid.wipe_out

			-- create row containinng widgets for: check column, name column, status column, edit button column
			from rm_schemas_access.schema_metadata_table.start until rm_schemas_access.schema_metadata_table.off loop
				schema_name := rm_schemas_access.schema_metadata_table.key_for_iteration

				-- column 1 - check box to indicate loaded
				create gcli
				grid.set_item (Grid_loaded_col, grid.row_count + 1, gcli)
				gcli.set_is_checked (rm_schemas_load_list.has (schema_name))
				row := gcli.row

				-- column 2 - RM schema name
				create gli.make_with_text (schema_name)
				gli.set_tooltip (rm_schemas_access.schema_metadata_table.item_for_iteration.item(metadata_schema_path))
				row.set_item (Grid_name_col, gli)

				-- column 3 - status
				if rm_schemas_access.schema_metadata_table.item_for_iteration.has (Metadata_schema_lifecycle_state) then
					create gli.make_with_text (rm_schemas_access.schema_metadata_table.item_for_iteration.item (Metadata_schema_lifecycle_state))
				else
					create gli.make_with_text ("(unknown)")
				end
				row.set_item (Grid_status_col, gli)

				-- column 4 - create edit button and add to row
				create gli.make_with_text ("Edit")
				gli.set_pixmap (pixmaps ["edit"])
				gli.select_actions.extend (agent do_edit_schema(rm_schemas_access.schema_metadata_table.key_for_iteration))
				row.set_item (Grid_edit_col, gli)

				rm_schemas_access.schema_metadata_table.forth
			end

			-- make the columnn content visible
			from i := 1 until i > Grid_max_cols loop
				grid.column (i).resize_to_content
				grid.column (i).set_width ((grid.column (i).width * 1.2).ceiling)
				i := i + 1
			end
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
			-- RM schemas options
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

			if rm_schemas_ll.is_equal (rm_schemas_load_list) then
				has_changed_schema_load_list := False
			else
				set_rm_schemas_load_list (rm_schemas_ll)
				rm_schemas_access.set_schema_load_list (rm_schemas_ll)
				has_changed_schema_load_list := True
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
