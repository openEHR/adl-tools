note
	component:   "openEHR ADL Tools"
	description: "Statistics display for a single RM"
	keywords:    "statistics"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_RM_INFORMATION_TOOL

inherit
	GUI_RM_TARGETTED_TOOL

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
		end

feature -- Access

	ev_root_container: EV_GRID

feature {NONE} -- Implementation

	do_clear
		do
			ev_root_container.wipe_out
		end

	do_populate
		local
			gli: EV_GRID_LABEL_ITEM
			rm_stats: HASH_TABLE [INTEGER, STRING]
		do
			safe_source.generate_statistics

			-- column names
			ev_root_container.insert_new_column (Grid_metric_name_col)
			ev_root_container.column (Grid_metric_name_col).set_title (get_msg (ec_rm_info_grid_metric_col_title, Void))
			ev_root_container.insert_new_column (Grid_metric_count_col)
			ev_root_container.column (Grid_metric_count_col).set_title (get_msg (ec_rm_info_grid_count_col_title, Void))

			rm_stats := safe_source.statistics_table
			across rm_stats as rm_stats_csr loop
				-- class name in col 1
				create gli.make_with_text (rm_stats_csr.key)
				ev_root_container.set_item (Grid_metric_name_col, ev_root_container.row_count + 1, gli)

				create gli.make_with_text (rm_stats_csr.item.out)
				ev_root_container.set_item (Grid_metric_count_col, ev_root_container.row_count, gli)
			end

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER)
					do
						ev_root_container.column (i).resize_to_content
						ev_root_container.column(i).set_width ((ev_root_container.column (i).width * 1.2).ceiling)
					end
			)
		end

end


