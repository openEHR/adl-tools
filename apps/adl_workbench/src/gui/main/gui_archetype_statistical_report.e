note
	component:   "openEHR ADL Tools"
	description: "GUI display for ARCHETYPE_STATISTICAL_REPORT object"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_ARCHETYPE_STATISTICAL_REPORT

inherit
	GUI_TOOL
		rename
			populate as populate_gui_tool
		redefine
			source
		end

create
	make

feature -- Definitions

	Grid_model_element_name_col: INTEGER = 1
	Grid_model_element_total_col: INTEGER = 2

	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_model_element_name_col, Grid_model_element_total_col>>
		end

	Summary_table_col_titles: ARRAY [STRING]
		once
			Result := <<get_msg (ec_summary_list_metric_col_title, Void),
				get_msg (ec_summary_list_total_col_title, Void),
				get_msg (ec_summary_list_min_col_title, Void),
				get_msg (ec_summary_list_max_col_title, Void),
				get_msg (ec_summary_list_mean_col_title, Void)>>
		end

feature {NONE} -- Initialization

	make
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		do
			create ev_root_container
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

	source: detachable ARCHETYPE_STATISTICAL_REPORT
			-- stats being visualised

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := "archetype stats"
		end

feature -- Status Report

	differential_view: BOOLEAN
			-- flag indicating whether data pertain to differential or flat archetypes

feature -- Commands

	populate (a_stat_report: ARCHETYPE_STATISTICAL_REPORT; diff_flag: BOOLEAN)
		do
			differential_view := diff_flag
			populate_gui_tool (a_stat_report)
		end

feature {NONE} -- Implementation

	do_clear
		do
			ev_root_container.wipe_out
		end

	do_populate
		local
			ev_rm_vbox: EV_VERTICAL_BOX
			ev_arch_stats_frame, ev_rm_breakdown_frame: EV_FRAME
			ev_arch_stats_list: EV_MULTI_COLUMN_LIST
			ev_rm_grid: EV_GRID_KBD_MOUSE
			ev_rm_breakdown_nb: EV_NOTEBOOK
			gli: EV_GRID_LABEL_ITEM
			class_row, attr_row: EV_GRID_ROW
			rm_class_stats: HASH_TABLE [RM_CLASS_STATISTICS, STRING]
			class_def: BMM_CLASS_DEFINITION
		do
			-----------------------------------
			-- create widgets
			-----------------------------------
			create ev_rm_vbox

			create ev_arch_stats_frame.make_with_text (get_msg (ec_arch_stats_list_title_diff, Void))
			ev_arch_stats_frame.align_text_left
			create ev_arch_stats_list
			ev_arch_stats_frame.extend (ev_arch_stats_list)
			ev_rm_vbox.extend (ev_arch_stats_frame)
			ev_rm_vbox.disable_item_expand (ev_arch_stats_frame)

			-- notebook for 3 groups of class stats
			create ev_rm_breakdown_frame.make_with_text (get_msg (ec_breakdown_nb_title_diff, Void))
			ev_rm_breakdown_frame.align_text_left
			create ev_rm_breakdown_nb
			ev_rm_breakdown_frame.extend (ev_rm_breakdown_nb)
			ev_rm_vbox.extend (ev_rm_breakdown_frame)

			ev_root_container.extend (ev_rm_vbox)
			ev_root_container.set_item_text (ev_rm_vbox, source.bmm_schema.schema_id)

			-----------------------------------
			-- populate data
			-----------------------------------
			if differential_view then
				ev_arch_stats_frame.set_text (get_msg (ec_arch_metrics_list_title_diff, Void))
				ev_rm_breakdown_frame.set_text (get_msg (ec_breakdown_nb_title_diff, Void))
			else
				ev_arch_stats_frame.set_text (get_msg (ec_arch_metrics_list_title_flat, Void))
				ev_rm_breakdown_frame.set_text (get_msg (ec_breakdown_nb_title_flat, Void))
			end

			-- archetype metrics list
			ev_arch_stats_list.set_column_titles (Summary_table_col_titles)
			populate_ev_multi_list_from_hash (ev_arch_stats_list, source.archetype_metrics)
			ev_arch_stats_frame.set_minimum_height ((ev_arch_stats_list.count + 3) * ev_arch_stats_list.row_height)

			-- breakdown grid
			from source.rm_grouped_class_table.start until source.rm_grouped_class_table.off loop
				-- populate RM breakdown notebook tabs
				create ev_rm_grid
				ev_rm_grid.enable_tree
				ev_rm_breakdown_nb.extend (ev_rm_grid)
				ev_rm_breakdown_nb.set_item_text (ev_rm_grid, source.rm_grouped_class_table.key_for_iteration)

				-- column names
				ev_rm_grid.insert_new_column (Grid_model_element_name_col)
				ev_rm_grid.column (Grid_model_element_name_col).set_title (get_msg (ec_statistics_grid_model_element_name_col_title, Void))
				ev_rm_grid.insert_new_column (Grid_model_element_total_col)
				ev_rm_grid.column (Grid_model_element_total_col).set_title (get_msg (ec_statistics_grid_model_element_count_col_title, Void))

				rm_class_stats := source.rm_grouped_class_table.item_for_iteration
				across rm_class_stats as rm_class_stats_csr loop
					-- class name in col 1
					create gli.make_with_text (rm_class_stats_csr.item.rm_class_name)
					if rm_class_stats_csr.item.is_archetype_root_class then
						gli.text.append (" *")
					end
					class_def := source.bmm_schema.class_definition (rm_class_stats_csr.item.rm_class_name)
					gli.set_pixmap (get_icon_pixmap ("rm/generic/" + class_def.type_category))
					gli.set_data (class_def)
					gli.pointer_button_press_actions.force_extend (agent class_node_handler (gli, ?, ?, ?))
					ev_rm_grid.set_item (Grid_model_element_name_col, ev_rm_grid.row_count + 1, gli)
					class_row := gli.row

					-- class count in col 2
					create gli.make_with_text (rm_class_stats_csr.item.rm_class_count.out)
					class_row.set_item (Grid_model_element_total_col, gli)

					-- attributes in subrows col 1 and 2
					across rm_class_stats_csr.item.rm_attributes as rm_attributes_csr loop
						class_row.insert_subrow (class_row.subrow_count+1)
						attr_row := class_row.subrow (class_row.subrow_count)

						create gli.make_with_text (rm_attributes_csr.key)
						if attached class_def.flat_properties.item (rm_attributes_csr.key) as prop_def then
							gli.set_pixmap (get_icon_pixmap ("rm/generic/" + prop_def.multiplicity_key_string))	-- pixmap
						end
						attr_row.set_item (Grid_model_element_name_col, gli)

						create gli.make_with_text (rm_attributes_csr.item.out)
						attr_row.set_item (Grid_model_element_total_col, gli)
					end
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

		end

	class_node_handler (gli: EV_GRID_LABEL_ITEM; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_CLASS_DEFINITION} gli.data as class_def then
				create menu
				create an_mi.make_with_text_and_action (get_msg (ec_display_in_active_tab, Void), agent display_context_selected_class_in_active_tool (class_def))
				an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool"))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_msg (ec_display_in_new_tab, Void), agent display_context_selected_class_in_new_tool (class_def))
				an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
				menu.extend (an_mi)

				menu.show
			end
		end

	display_context_selected_class_in_active_tool (a_class_def: BMM_CLASS_DEFINITION)
		do
			selection_history.set_selected_item (a_class_def)
			gui_agents.select_class_agent.call ([a_class_def])
			gui_agents.history_update_agent.call([])
		end

	display_context_selected_class_in_new_tool (a_class_def: BMM_CLASS_DEFINITION)
		do
			selection_history.set_selected_item (a_class_def)
			gui_agents.select_class_in_new_tool_agent.call ([a_class_def])
			gui_agents.history_update_agent.call([])
		end

end


