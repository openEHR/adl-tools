note
	component:   "openEHR Archetype Project"
	description: "Statistics display for a single archetype"
	keywords:    "statistics"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	GUI_ARCHETYPE_INFORMATION_TOOL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

	GUI_DEFINITIONS
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Grid_class_name_col: INTEGER = 1
	Grid_class_count_col: INTEGER = 2
	Grid_attr_name_col: INTEGER = 3
	Grid_attr_count_col: INTEGER = 4

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)
			create ev_summary_vbox
			create ev_summary_label.make_with_text (create_message_content ("summary_list_title", Void))
			ev_summary_label.align_text_left
			create ev_summary_list
			create ev_breakdown_vbox
			create ev_breakdown_label.make_with_text (create_message_content ("breakdown_grid_title", Void))
			ev_breakdown_label.align_text_left
			create ev_breakdown_grid

			-- connect widgets
			ev_root_container.extend (ev_summary_vbox)
			ev_summary_vbox.extend (ev_summary_label)
			ev_summary_vbox.extend (ev_summary_list)
			ev_summary_vbox.disable_item_expand (ev_summary_label)
			ev_root_container.extend (ev_breakdown_vbox)
			ev_breakdown_vbox.extend (ev_breakdown_label)
			ev_breakdown_vbox.extend (ev_breakdown_grid)
			ev_breakdown_vbox.disable_item_expand (ev_breakdown_label)

			-- set visual characteristics
			ev_summary_vbox.set_border_width (border_width)
			ev_summary_vbox.set_padding_width (padding_width)
			ev_breakdown_vbox.set_border_width (border_width)
			ev_breakdown_vbox.set_padding_width (padding_width)

			ev_breakdown_grid.enable_tree
			create grid_controller.make_for_grid (ev_breakdown_grid)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_SPLIT_AREA

feature -- Commands

	clear
		do
			ev_summary_list.wipe_out
			ev_breakdown_grid.wipe_out
		end

feature {NONE} -- Implementation

	do_populate
		local
			gli: EV_GRID_LABEL_ITEM
			class_row, attr_row: EV_GRID_ROW
			rm_class_stats: HASH_TABLE [RM_CLASS_STATISTICS, STRING]
		do
			-- summary list
			ev_summary_list.set_column_titles (<<create_message_content ("summary_list_metric_col_title", Void), create_message_content ("summary_list_occurrences_col_title", Void)>>)
			target_archetype_descriptor.generate_statistics
			populate_ev_multi_list_from_hash (ev_summary_list, target_archetype_descriptor.statistical_analyser.summed_results)
			ev_summary_list.resize_column_to_content (1)
			ev_summary_list.set_column_width (100, 2) -- FIXME: this is a hack, but there is no auto-resize based on column title...

			-- breakdown grid
			rm_class_stats := target_archetype_descriptor.statistical_analyser.rm_class_table
			from rm_class_stats.start until rm_class_stats.off loop
				-- class name in col 1
				create gli.make_with_text (rm_class_stats.item_for_iteration.rm_class_name)
				ev_breakdown_grid.set_item (Grid_class_name_col, ev_breakdown_grid.row_count + 1, gli)
				class_row := gli.row

				-- class count in col 2
				create gli.make_with_text (rm_class_stats.item_for_iteration.rm_class_count.out)
				class_row.set_item (Grid_class_count_col, gli)

				-- attributes in subrows
				from rm_class_stats.item_for_iteration.rm_attributes.start until rm_class_stats.item_for_iteration.rm_attributes.off loop
					class_row.insert_subrow (class_row.subrow_count+1)
					attr_row := class_row.subrow (class_row.subrow_count)

					create gli.make_with_text (rm_class_stats.item_for_iteration.rm_attributes.key_for_iteration)
					attr_row.set_item (Grid_attr_name_col, gli)

					create gli.make_with_text (rm_class_stats.item_for_iteration.rm_attributes.item_for_iteration.out)
					attr_row.set_item (Grid_attr_count_col, gli)

					rm_class_stats.item_for_iteration.rm_attributes.forth
				end
				if class_row.is_expandable then
					class_row.expand
				end
				rm_class_stats.forth
			end

			-- column names
			ev_breakdown_grid.column (Grid_class_name_col).set_title (create_message_content ("statistics_grid_class_name_col_title", Void))
			ev_breakdown_grid.column (Grid_class_name_col).resize_to_content
			ev_breakdown_grid.column (Grid_class_count_col).set_title (create_message_content ("statistics_grid_class_count_col_title", Void))
			ev_breakdown_grid.column (Grid_class_count_col).resize_to_content
			ev_breakdown_grid.column (Grid_attr_name_col).set_title (create_message_content ("statistics_grid_attr_name_col_title", Void))
			ev_breakdown_grid.column (Grid_attr_name_col).resize_to_content
			ev_breakdown_grid.column (Grid_attr_count_col).set_title (create_message_content ("statistics_grid_attr_count_col_title", Void))
			ev_breakdown_grid.column (Grid_attr_count_col).resize_to_content

			-- set a reasonable split position: label + summary table title row height + nr rows x row height + one more row for padding
			ev_root_container.set_split_position (ev_summary_label.height + ev_summary_list.row_height + ev_summary_list.row_height * ev_summary_list.count + ev_summary_list.row_height)
		end

	ev_summary_label, ev_breakdown_label: EV_LABEL

	ev_summary_vbox, ev_breakdown_vbox: EV_VERTICAL_BOX

	ev_summary_list: EV_MULTI_COLUMN_LIST

	ev_breakdown_grid: EV_GRID

	grid_controller: GUI_GRID_CONTROLLER

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
--| The Original Code is gui_archetype_information_tool.e.
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
