note
	component:   "openEHR Archetype Project"
	description: "Statistics display for a single RM"
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
	GUI_RM_INFORMATION_TOOL

inherit
	GUI_RM_TARGETTED_TOOL

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

	Grid_metric_name_col: INTEGER = 1
	Grid_metric_count_col: INTEGER = 2

	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_metric_name_col, Grid_metric_count_col>>
		end

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)

			-- connect widgets

			-- set visual characteristics
		end

feature -- Access

	ev_root_container: EV_GRID

feature {NONE} -- Implementation

	ev_grid: EV_GRID

	do_clear
		do
			ev_root_container.wipe_out
		end

	do_populate
		local
			gli: EV_GRID_LABEL_ITEM
			rm_stats: HASH_TABLE [INTEGER, STRING]
		do
			source.generate_statistics

			ev_grid := ev_root_container

			-- column names
			ev_grid.insert_new_column (Grid_metric_name_col)
			ev_grid.column (Grid_metric_name_col).set_title (create_message_content ("rm_info_grid_metric_col_title", Void))
			ev_grid.insert_new_column (Grid_metric_count_col)
			ev_grid.column (Grid_metric_count_col).set_title (create_message_content ("rm_info_grid_count_col_title", Void))

			rm_stats := source.statistics_table
			from rm_stats.start until rm_stats.off loop
				-- class name in col 1
				create gli.make_with_text (rm_stats.key_for_iteration)
				ev_grid.set_item (Grid_metric_name_col, ev_grid.row_count + 1, gli)

				create gli.make_with_text (rm_stats.item_for_iteration.out)
				ev_grid.set_item (Grid_metric_count_col, ev_grid.row_count, gli)
				rm_stats.forth
			end

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER)
					do
						ev_grid.column (i).resize_to_content
						ev_grid.column(i).set_width ((ev_grid.column (i).width * 1.2).ceiling)
					end
			)
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
