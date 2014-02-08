note
	component:   "EOMF project"
	description: "High level visual control for displaying and filtering a tabular list of data"
	keywords:    "table, UI"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_TABLE_CONTROL

inherit
	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (on_mlist_key_agt: PROCEDURE [ANY, TUPLE [EV_KEY]];
		a_column_titles_agt: like column_titles_agt;
		a_row_filter_names_agt: ARRAYED_LIST [STRING];
		a_row_data_agt: like row_data_agt;
		a_column_filters: like column_filters)
			-- create tree control repersenting archetype files found in repository_path
			-- column_filters is a table of agents keyed by name. For each one, a check-box
			-- with that name is added to the conrol panel on the right hand side. If the 
			-- user clicks one of these, its agent is called with the current value of the checkbox
		local
			evx_cb: EVX_CHECK_BOX_CONTROL
		do
			create ev_root_container
			create gui_controls.make (0)

			-- ================ main path list table ==============
			create evx_mlist.make (agent path_list, 0, 0, column_titles_agt, row_data_agt)
			evx_mlist.ev_data_control.enable_multiple_selection
			ev_root_container.extend (evx_mlist.ev_data_control)
			gui_controls.extend (evx_mlist)

			-- ========== view controls control panel ===========
			create evx_control_panel.make
			ev_root_container.extend (evx_control_panel.ev_root_container)
			ev_root_container.disable_item_expand (evx_control_panel.ev_root_container)

			-- -------- Row view frame --------
			evx_control_panel.create_new_frame (get_text (ec_row_filter_frame_text), False)

			-- -------- Row view combo --------
			create evx_row_filter_combo.make_selectable ("", a_row_filter_names_agt, agent set_row_filter, 0, 80, False)
			if attached evx_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_row_filter_combo.ev_root_container, False)
				gui_controls.extend (evx_row_filter_combo)
			end

			-- -------- Col view frame --------
			evx_control_panel.create_new_frame (get_text (ec_column_frame_text), False)

			-- -------- Col view checkbox --------
			across column_filters as flags_csr loop
				create evx_cb.make_linked (flags_csr.key, Void, flags_csr.item.get_agt, flags_csr.item.update_agt)
				if attached evx_control_panel.last_added_frame as evx_frame then
					evx_frame.extend (evx_cb.ev_data_control, False)
					gui_controls.extend (evx_cb)
				end

			end

			-- set events: key press agent for main list, enables things like 
			-- ctrl-C to do copy
			evx_mlist.ev_data_control.key_press_actions.extend (on_mlist_key_agt)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Commands

	set_row_filter
		do
			if ev_mlist.is_displayed then
				row_filter_selected := evx_row_filter_combo.selected_text
				repopulate
			end
		end

	row_selected_text: STRING
			-- copy a selected path row from the paths control to the OS clipboard
		local
			ev_rows: DYNAMIC_LIST[EV_MULTI_COLUMN_LIST_ROW]
			ev_col: EV_MULTI_COLUMN_LIST_ROW
		do
			ev_rows := ev_mlist.selected_items
			create Result.make (0)

			if not ev_rows.is_empty then
				from ev_rows.start until ev_rows.off loop
					ev_col := ev_rows.item
					from ev_col.start until ev_col.off loop
						Result.append (ev_col.item.string + "%N")
						ev_col.forth
					end
					ev_rows.forth
				end
			end
		end

feature {NONE} -- Implementation

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_mlist: EVX_MULTI_COLUMN_TABLE_CONTROL

	ev_mlist: EV_MULTI_COLUMN_LIST
		do
			Result := evx_mlist.ev_data_control
		end

	evx_control_panel: EVX_CONTROL_PANEL

	evx_row_filter_combo: EVX_COMBO_CONTROL

	column_titles_agt: FUNCTION [ANY, TUPLE, ARRAY [STRING]]

	column_filters: HASH_TABLE [TUPLE [get_agt: FUNCTION [ANY, TUPLE, BOOLEAN]; update_agt: PROCEDURE [ANY, TUPLE [BOOLEAN]]], STRING]

	row_filter_selected: STRING
		attribute
			create Result.make_from_string (row_filter_names.i_th (1))
		end

	row_data_agt: FUNCTION [ANY, TUPLE [STRING], ARRAYED_LIST [STRING_32]]

	clear
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
		end

	populate
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
		end

end
