note
	component:   "openEHR Archetype Project"
	description: "Sub-tool for description / meta-data parts of an RM"
	keywords:    "RM, archetype, schema"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_RM_DESCRIPTION_CONTROLS

inherit
	GUI_RM_TARGETTED_TOOL

create
	make

feature -- Definitions

	Grid_attr_group_col: INTEGER = 1
	Grid_attr_col: INTEGER = 2
	grid_attr_val_col: INTEGER = 3
	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_attr_group_col, Grid_attr_col, grid_attr_val_col>>
		end

feature {NONE} -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)
			create ev_grid

			-- connect them together
			ev_root_container.extend (ev_grid)

			-- set visual characteristics
			ev_root_container.set_padding (padding_width)
			ev_root_container.set_border_width (border_width)

			ev_grid.disable_row_height_fixed
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature {NONE} -- Implementation

	ev_grid: EV_GRID

	do_clear
			-- Wipe out content.
		do
			ev_grid.wipe_out
		end

	do_populate
		do
			populate_grid
		end

	populate_grid
		local
			gli: EV_GRID_LABEL_ITEM
			str: STRING
		do
			ev_grid.wipe_out
			ev_grid.enable_column_resize_immediate

			-- column names
			ev_grid.insert_new_column (Grid_attr_group_col)
			ev_grid.column (Grid_attr_group_col).set_title (create_message_content ("rm_desc_attr_group", Void))

			ev_grid.insert_new_column (Grid_attr_col)
			ev_grid.column (Grid_attr_col).set_title (create_message_content ("rm_desc_attr_name", Void))

			ev_grid.insert_new_column (grid_attr_val_col)
			ev_grid.column (grid_attr_val_col).set_title (create_message_content ("rm_desc_attr_value", Void))

			-- schema id attributes
			create gli.make_with_text ("Schema identification")
			ev_grid.set_item (Grid_attr_group_col, ev_grid.row_count + 1, gli)

			create gli.make_with_text ("rm_publisher")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (source.rm_publisher)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_name")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (source.schema_name)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("rm_release")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (source.rm_release)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_id")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (source.schema_id)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			-- schema documentation attributes
			create gli.make_with_text ("Schema documentation")
			ev_grid.set_item (Grid_attr_group_col, ev_grid.row_count + 1, gli)

			create gli.make_with_text ("schema_author")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (source.schema_author)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_contributors")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create str.make_empty
			from source.schema_contributors.start until source.schema_contributors.off loop
				str.append (source.schema_contributors.item)
				if not source.schema_contributors.islast then
					str.append (",%N")
				end
				source.schema_contributors.forth
			end
			create gli.make_with_text (str)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			ev_grid.row (ev_grid.row_count).set_height (ev_grid.row (ev_grid.row_count).height * source.schema_contributors.count)

			create gli.make_with_text ("schema_lifecycle_state")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (source.schema_lifecycle_state)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_description")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text ("View")
			gli.set_pixmap (get_icon_pixmap ("tool/edit"))
			gli.select_actions.extend (agent show_text_in_dialog (source.schema_description))
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			-- archetyping attributes
			create gli.make_with_text ("Archetyping")
			ev_grid.set_item (Grid_attr_group_col, ev_grid.row_count + 1, gli)

			create gli.make_with_text ("archetype_parent_class")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			if attached source.archetype_parent_class then
				create gli.make_with_text (source.archetype_parent_class)
				ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			end

			create gli.make_with_text ("archetype_data_value_parent_class")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			if attached source.archetype_data_value_parent_class then
				create gli.make_with_text (source.archetype_data_value_parent_class)
				ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			end

			create gli.make_with_text ("archetype_rm_closure_packages")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create str.make_empty
			from source.archetype_rm_closure_packages.start until source.archetype_rm_closure_packages.off loop
				str.append (source.archetype_rm_closure_packages.item)
				if not source.archetype_rm_closure_packages.islast then
					str.append (",%N")
				end
				source.archetype_rm_closure_packages.forth
			end
			create gli.make_with_text (str)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			ev_grid.row (ev_grid.row_count).set_height (ev_grid.row (ev_grid.row_count).height * source.archetype_rm_closure_packages.count)

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER)
					do
						ev_grid.column(i).resize_to_content
						ev_grid.column(i).set_width ((ev_grid.column (i).width * 1.2).ceiling)
					end
			)

		end

	show_text_in_dialog (a_text: STRING)
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_text)
			info_dialog.show
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
--| The Original Code is gui_rm_desciptoin_controls.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
