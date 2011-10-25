note
	component:   "openEHR Archetype Project"
	description: "GUI display for ARCHETYPE_STATISTICAL_REPORT object"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	GUI_ARCHETYPE_STATISTICAL_REPORT

inherit
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

	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_class_name_col, Grid_class_count_col, Grid_attr_name_col, Grid_attr_count_col>>
		end

feature {NONE} -- Initialization

	make
		do
			create ev_root_container
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

	source: ARCHETYPE_STATISTICAL_REPORT
			-- stats being visualised

	last_populate_timestamp: DATE_TIME

feature -- Status Report

	differential_view: BOOLEAN
			-- flag indicating whether data pertain to differential or flat archetypes

feature -- Commands

	clear
		do
			ev_root_container.wipe_out
			last_populate_timestamp := Void
		end

	populate (a_stat_report: ARCHETYPE_STATISTICAL_REPORT; diff_flag: BOOLEAN)
		do
			differential_view := diff_flag
			source := a_stat_report
			clear
			do_populate (a_stat_report.bmm_schema)
			create last_populate_timestamp.make_now
		end

feature {NONE} -- Implementation

	do_populate (a_bmm_schema: BMM_SCHEMA)
		local
			ev_rm_vbox: EV_VERTICAL_BOX
			ev_arch_stats_frame, ev_rm_stats_frame, ev_rm_breakdown_frame: EV_FRAME
			ev_arch_stats_list, ev_rm_stats_list: EV_MULTI_COLUMN_LIST
			ev_rm_grid: EV_GRID
			grid_controller: GUI_GRID_CONTROLLER
			ev_rm_breakdown_nb: EV_NOTEBOOK
			gli: EV_GRID_LABEL_ITEM
			class_row, attr_row: EV_GRID_ROW
			rm_class_stats: HASH_TABLE [RM_CLASS_STATISTICS, STRING]
		do
			-----------------------------------
			-- create widgets
			-----------------------------------
			create ev_rm_vbox

			create ev_arch_stats_frame.make_with_text (create_message_content ("arch_stats_list_title_diff", Void))
			ev_arch_stats_frame.align_text_left
			create ev_arch_stats_list
			ev_arch_stats_frame.extend (ev_arch_stats_list)
			ev_rm_vbox.extend (ev_arch_stats_frame)
			ev_rm_vbox.disable_item_expand (ev_arch_stats_frame)

			create ev_rm_stats_frame.make_with_text (create_message_content ("rm_stats_list_title_diff", Void))
			ev_rm_stats_frame.align_text_left
			create ev_rm_stats_list
			ev_rm_stats_frame.extend (ev_rm_stats_list)
			ev_rm_vbox.extend (ev_rm_stats_frame)
			ev_rm_vbox.disable_item_expand (ev_rm_stats_frame)

			-- notebook for 3 groups of class stats
			create ev_rm_breakdown_frame.make_with_text (create_message_content ("breakdown_nb_title_diff", Void))
			ev_rm_breakdown_frame.align_text_left
			create ev_rm_breakdown_nb
			ev_rm_breakdown_frame.extend (ev_rm_breakdown_nb)
			ev_rm_vbox.extend (ev_rm_breakdown_frame)

			ev_root_container.extend (ev_rm_vbox)
			ev_root_container.set_item_text (ev_rm_vbox, a_bmm_schema.schema_id)

			-----------------------------------
			-- populate data
			-----------------------------------
			if differential_view then
				ev_arch_stats_frame.set_text (create_message_content ("arch_metrics_list_title_diff", Void))
				ev_rm_stats_frame.set_text (create_message_content ("rm_metrics_list_title_diff", Void))
				ev_rm_breakdown_frame.set_text (create_message_content ("breakdown_nb_title_diff", Void))
			else
				ev_arch_stats_frame.set_text (create_message_content ("arch_metrics_list_title_flat", Void))
				ev_rm_stats_frame.set_text (create_message_content ("rm_metrics_list_title_flat", Void))
				ev_rm_breakdown_frame.set_text (create_message_content ("breakdown_nb_title_flat", Void))
			end

			-- archetype metrics list
			ev_arch_stats_list.set_column_titles (
				<<create_message_content ("summary_list_metric_col_title", Void),
				create_message_content ("summary_list_occurrences_col_title", Void)>>
			)
			populate_ev_multi_list_from_hash (ev_arch_stats_list, source.archetype_metrics)
			ev_arch_stats_list.resize_column_to_content (1)
			ev_arch_stats_list.set_column_width (100, 2) -- FIXME: this is a hack, but there is no auto-resize based on column title...

			-- RM metrics list
			ev_rm_stats_list.set_column_titles (
				<<create_message_content ("summary_list_metric_col_title", Void),
				create_message_content ("summary_list_occurrences_col_title", Void)>>
			)
			populate_ev_multi_list_from_hash (ev_rm_stats_list, source.rm_metrics)
			ev_rm_stats_list.resize_column_to_content (1)
			ev_rm_stats_list.set_column_width (100, 2) -- FIXME: this is a hack, but there is no auto-resize based on column title...

			-- breakdown grid
			from source.rm_grouped_class_table.start until source.rm_grouped_class_table.off loop
				-- populate RM breakdown notebook tabs
				create ev_rm_grid
				ev_rm_grid.enable_tree
				create grid_controller.make_for_grid (ev_rm_grid)
				ev_rm_breakdown_nb.extend (ev_rm_grid)
				ev_rm_breakdown_nb.set_item_text (ev_rm_grid, source.rm_grouped_class_table.key_for_iteration)

				-- column names
				ev_rm_grid.insert_new_column (Grid_class_name_col)
				ev_rm_grid.column (Grid_class_name_col).set_title (create_message_content ("statistics_grid_class_name_col_title", Void))
				ev_rm_grid.insert_new_column (Grid_class_count_col)
				ev_rm_grid.column (Grid_class_count_col).set_title (create_message_content ("statistics_grid_class_count_col_title", Void))
				ev_rm_grid.insert_new_column (Grid_attr_name_col)
				ev_rm_grid.column (Grid_attr_name_col).set_title (create_message_content ("statistics_grid_attr_name_col_title", Void))
				ev_rm_grid.insert_new_column (Grid_attr_count_col)
				ev_rm_grid.column (Grid_attr_count_col).set_title (create_message_content ("statistics_grid_attr_count_col_title", Void))

				rm_class_stats := source.rm_grouped_class_table.item_for_iteration
				from rm_class_stats.start until rm_class_stats.off loop
					-- class name in col 1
					create gli.make_with_text (rm_class_stats.item_for_iteration.rm_class_name)
					if rm_class_stats.item_for_iteration.is_archetype_root_class then
						gli.text.append (" *")
					end
					ev_rm_grid.set_item (Grid_class_name_col, ev_rm_grid.row_count + 1, gli)
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
					rm_class_stats.forth
				end

				-- resize grid cols properly
				Grid_column_ids.do_all (
					agent (i: INTEGER; a_grid: EV_GRID)
						do
							a_grid.column (i).resize_to_content
							a_grid.column(i).set_width ((a_grid.column (i).width * 1.1).ceiling)
						end (?, ev_rm_grid)
				)
				source.rm_grouped_class_table.forth
			end

			-- resize mlists properly
			ev_arch_stats_frame.set_minimum_height ((ev_arch_stats_list.count + 3) * ev_arch_stats_list.row_height)
			ev_rm_stats_frame.set_minimum_height ((ev_rm_stats_list.count + 3) * ev_rm_stats_list.row_height)
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
