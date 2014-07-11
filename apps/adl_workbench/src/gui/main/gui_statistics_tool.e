note
	component:   "openEHR ADL Tools"
	description: "GUI Statistics Tool"
	keywords:    "ADL, archetype workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_STATISTICS_TOOL

inherit
	GUI_CATALOGUE_TARGETTED_TOOL

create
	make

feature {NONE} -- Initialisation

	make
		do
			-- create root widget
			create ev_root_container
			create ev_stats_info_frame
			create ev_term_bindings_info_frame
			create ev_stats_mlist
			create ev_term_bindings_info_list

			-- connect them together
			ev_root_container.extend (ev_stats_info_frame)
			ev_stats_info_frame.extend (ev_stats_mlist)
			ev_root_container.extend (ev_term_bindings_info_frame)
			ev_term_bindings_info_frame.extend (ev_term_bindings_info_list)

			-- set visual characteristics
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.disable_item_expand (ev_stats_info_frame)
			ev_stats_info_frame.set_text (get_msg (ec_stats_frame_text, Void))
			ev_term_bindings_info_frame.set_text (get_msg (ec_term_bindings_frame_text, Void))
			ev_term_bindings_info_list.set_column_titles (<<"terminology", "archetypes">>)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature {NONE} -- Implementation

	do_clear
		do
			ev_stats_mlist.wipe_out
			ev_term_bindings_info_list.wipe_out
		end

	do_populate
			-- Populate the statistics tab.
		local
			list_row: EV_MULTI_COLUMN_LIST_ROW
		do
			-- archetype metrics list
			ev_stats_mlist.set_column_titles (
				<<get_msg (ec_summary_list_metric_col_title, Void),
				get_msg (ec_summary_list_total_col_title, Void)>>
			)
			populate_ev_multi_list_from_hash (ev_stats_mlist, source.library_metrics)
			ev_stats_info_frame.set_minimum_height ((ev_stats_mlist.count + 3) * ev_stats_mlist.row_height)

			-- do terminology bindings statistics
			across source.terminology_bindings_statistics as stats_csr loop
				from ev_term_bindings_info_list.start until ev_term_bindings_info_list.off or
					ev_term_bindings_info_list.item.first.is_equal (stats_csr.key)
				loop
					ev_term_bindings_info_list.forth
				end
				if not ev_term_bindings_info_list.off then
					ev_term_bindings_info_list.item.finish
					ev_term_bindings_info_list.item.remove
					ev_term_bindings_info_list.item.extend (utf8_to_utf32 (stats_csr.item.count.out))
				else
					create list_row
					list_row.extend (utf8_to_utf32 (stats_csr.key))
					list_row.extend (utf8_to_utf32 (stats_csr.item.count.out))
					ev_term_bindings_info_list.extend (list_row)
				end
			end
			resize_ev_multi_list_to_headers (ev_term_bindings_info_list)
		end

	ev_stats_info_frame, ev_term_bindings_info_frame: EV_FRAME

	ev_stats_mlist, ev_term_bindings_info_list: EV_MULTI_COLUMN_LIST

end


