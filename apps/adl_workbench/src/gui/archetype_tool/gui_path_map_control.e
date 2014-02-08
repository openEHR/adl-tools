note
	component:   "openEHR ADL Tools"
	description: "Path map control and logic"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_PATH_MAP_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all;
			{ANY} has_current_repository
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	path_control_filter_names: ARRAYED_LIST [STRING]
			-- names of row filters of path control
		once
			create Result.make (0)
			Result.compare_objects
			Result.fill (<<"All", "Leaf">>)
		end

	path_control_column_names: ARRAY [STRING]
			-- names of columns of path view control
		once
			Result := <<"Path", "RM Type", "AOM Type">>
		end

feature {NONE} -- Initialisation

	make (on_path_map_key_press_agent: PROCEDURE [ANY, TUPLE [EV_KEY]])
			-- create tree control repersenting archetype files found in repository_path
		do
			create ev_root_container
			create gui_controls.make (0)

			-- ================================== ADL 1.5 paths =======================================
			create ev_15_paths_hbox
			ev_root_container.extend (ev_15_paths_hbox)
			ev_root_container.set_item_text (ev_15_paths_hbox, get_text (ec_adl_15_paths_tab_text))

			-- ================ main path list table ==============
			create evx_15_paths_mlist.make (agent path_list, 0, 0, agent path_column_titles, agent adl_15_path_row)
			evx_15_paths_mlist.ev_data_control.enable_multiple_selection
			ev_15_paths_hbox.extend (evx_15_paths_mlist.ev_data_control)
			gui_controls.extend (evx_15_paths_mlist)

			-- ========== view controls control panel ===========
			create evx_15_paths_control_panel.make
			ev_15_paths_hbox.extend (evx_15_paths_control_panel.ev_root_container)
			ev_15_paths_hbox.disable_item_expand (evx_15_paths_control_panel.ev_root_container)

			-- -------- Row view frame --------
			evx_15_paths_control_panel.create_new_frame (get_text (ec_row_filter_frame_text), False)

			-- -------- Row view combo --------
			create evx_15_row_filter_combo.make ("", agent path_control_filter_names,
				agent set_path_row_filter, 0, 80, False)
			if attached evx_15_paths_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_15_row_filter_combo.ev_root_container, False)
				gui_controls.extend (evx_15_row_filter_combo)
			end

			-- -------- Col view frame --------
			evx_15_paths_control_panel.create_new_frame (get_text (ec_column_frame_text), False)

			-- -------- Col view checkbox --------
			create evx_15_nat_lang_paths_cb.make_linked (get_text (ec_nat_lang_checkbox_text), get_text (ec_nat_lang_paths_tooltip),
				agent :BOOLEAN do Result := show_natural_language end, agent update_show_natural_language)
			if attached evx_15_paths_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_15_nat_lang_paths_cb.ev_data_control, False)
				gui_controls.extend (evx_15_nat_lang_paths_cb)
			end

			-- ================================== ADL 1.4 paths =======================================
			create ev_14_paths_hbox
			ev_root_container.extend (ev_14_paths_hbox)
			ev_root_container.set_item_text (ev_14_paths_hbox, get_text (ec_adl_14_paths_tab_text))

			-- ================ main path list table ==============
			create evx_14_paths_mlist.make (agent path_list, 0, 0, agent path_column_titles, agent adl_14_path_row)
			evx_14_paths_mlist.ev_data_control.enable_multiple_selection
			ev_14_paths_hbox.extend (evx_14_paths_mlist.ev_data_control)
			gui_controls.extend (evx_14_paths_mlist)

			-- ========== view controls control panel ===========
			create evx_14_paths_control_panel.make
			ev_14_paths_hbox.extend (evx_14_paths_control_panel.ev_root_container)
			ev_14_paths_hbox.disable_item_expand (evx_14_paths_control_panel.ev_root_container)

			-- -------- Row view frame --------
			evx_14_paths_control_panel.create_new_frame (get_text (ec_row_filter_frame_text), False)

			-- -------- Row view combo --------
			create evx_14_row_filter_combo.make ("", agent path_control_filter_names,
				agent set_path_row_filter, 0, 80, False)
			if attached evx_14_paths_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_14_row_filter_combo.ev_root_container, False)
				gui_controls.extend (evx_14_row_filter_combo)
			end

			-- -------- Col view frame --------
			evx_14_paths_control_panel.create_new_frame (get_text (ec_column_frame_text), False)

			-- -------- Col view checkbox --------
			create evx_14_nat_lang_paths_cb.make_linked (get_text (ec_nat_lang_checkbox_text), get_text (ec_nat_lang_paths_tooltip),
				agent :BOOLEAN do Result := show_natural_language end, agent update_show_natural_language)
			if attached evx_14_paths_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_14_nat_lang_paths_cb.ev_data_control, False)
				gui_controls.extend (evx_14_nat_lang_paths_cb)
			end


			-- ================================== ADL interface tags =======================================
			create ev_interface_paths_hbox
			ev_root_container.extend (ev_interface_paths_hbox)
			ev_root_container.set_item_text (ev_interface_paths_hbox, get_text (ec_adl_interface_tab_text))

			-- ================ main path list table ==============
			create evx_interface_paths_mlist.make (agent path_list, 0, 0, agent path_column_titles, agent adl_interface_row)
			evx_interface_paths_mlist.ev_data_control.enable_multiple_selection
			ev_interface_paths_hbox.extend (evx_interface_paths_mlist.ev_data_control)
			gui_controls.extend (evx_interface_paths_mlist)

			-- ========== view controls control panel ===========
			create evx_interface_paths_control_panel.make
			ev_interface_paths_hbox.extend (evx_interface_paths_control_panel.ev_root_container)
			ev_interface_paths_hbox.disable_item_expand (evx_interface_paths_control_panel.ev_root_container)

			-- -------- Row view frame --------
			evx_interface_paths_control_panel.create_new_frame (get_text (ec_row_filter_frame_text), False)

			-- -------- Row view combo --------
			create evx_interface_row_filter_combo.make ("", agent path_control_filter_names,
				agent set_path_row_filter, 0, 80, False)
			if attached evx_interface_paths_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_interface_row_filter_combo.ev_root_container, False)
				gui_controls.extend (evx_interface_row_filter_combo)
			end

			-- -------- Col view frame --------
			evx_interface_paths_control_panel.create_new_frame (get_text (ec_column_frame_text), False)

			-- -------- Col view checkbox --------
			create evx_interface_nat_lang_paths_cb.make_linked (get_text (ec_nat_lang_checkbox_text), get_text (ec_nat_lang_paths_tooltip),
				agent :BOOLEAN do Result := show_natural_language end, agent update_show_natural_language)
			if attached evx_interface_paths_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_interface_nat_lang_paths_cb.ev_data_control, False)
				gui_controls.extend (evx_interface_nat_lang_paths_cb)
			end



			-- set events: path map
			evx_15_paths_mlist.ev_data_control.key_press_actions.extend (on_path_map_key_press_agent)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

	evx_15_nat_lang_paths_cb: EVX_CHECK_BOX_CONTROL

	evx_14_nat_lang_paths_cb: EVX_CHECK_BOX_CONTROL

	evx_interface_nat_lang_paths_cb: EVX_CHECK_BOX_CONTROL

	show_natural_language: BOOLEAN

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

feature -- Commands

	set_path_row_filter
		do
			if ev_adl_15_path_list.is_displayed then
				path_row_filter_selected := evx_15_row_filter_combo.ev_data_control.selected_text
				repopulate
			end
		end

	selected_text: STRING
			-- copy a selected path row from the paths control to the OS clipboard
		local
			ev_rows: DYNAMIC_LIST[EV_MULTI_COLUMN_LIST_ROW]
			ev_col: EV_MULTI_COLUMN_LIST_ROW
		do
			ev_rows := ev_adl_15_path_list.selected_items
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

	select_path (a_path: STRING)
		require
			not a_path.is_empty
		local
			match_path, l_path: STRING
			found: BOOLEAN
		do
			if show_natural_language and attached selected_language as sel_lang then
				match_path := source_archetype.terminology.annotated_path (a_path, sel_lang, True)
			else
				match_path := a_path
			end

			-- use length comparison for more efficient matching
			from ev_adl_15_path_list.start until ev_adl_15_path_list.off or found loop
				l_path := ev_adl_15_path_list.item.i_th (1).to_string_8
				if l_path.same_string (match_path) then
					ev_adl_15_path_list.item.enable_select
					ev_adl_15_path_list.ensure_item_visible (ev_adl_15_path_list.item)
					found := True
				end
				ev_adl_15_path_list.forth
			end
		end

feature {NONE} -- Implementation

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	ev_15_paths_hbox: EV_HORIZONTAL_BOX

	evx_15_paths_mlist: EVX_MULTI_COLUMN_TABLE_CONTROL

	ev_adl_15_path_list: EV_MULTI_COLUMN_LIST
		do
			Result := evx_15_paths_mlist.ev_data_control
		end

	evx_15_paths_control_panel: EVX_CONTROL_PANEL

	evx_15_row_filter_combo: EVX_COMBO_CONTROL

	path_row_filter_selected: STRING
		attribute
			create Result.make_from_string (path_control_filter_names.i_th (1))
		end

	update_show_natural_language (a_flag: BOOLEAN)
		do
			show_natural_language := a_flag
			repopulate
		end

	ev_14_paths_hbox: EV_HORIZONTAL_BOX

	evx_14_paths_mlist: EVX_MULTI_COLUMN_TABLE_CONTROL

	ev_adl_14_path_list: EV_MULTI_COLUMN_LIST
		do
			Result := evx_14_paths_mlist.ev_data_control
		end

	evx_14_paths_control_panel: EVX_CONTROL_PANEL

	evx_14_row_filter_combo: EVX_COMBO_CONTROL

	ev_interface_paths_hbox: EV_HORIZONTAL_BOX

	evx_interface_paths_mlist: EVX_MULTI_COLUMN_TABLE_CONTROL

	ev_adl_interface_path_list: EV_MULTI_COLUMN_LIST
		do
			Result := evx_interface_paths_mlist.ev_data_control
		end

	evx_interface_paths_control_panel: EVX_CONTROL_PANEL

	evx_interface_row_filter_combo: EVX_COMBO_CONTROL

	path_column_titles: ARRAY [STRING]
		do
			create Result.make_filled ("", 1, path_control_column_names.count + 1)
			Result.fill (path_control_column_names)
		end

	do_clear
			-- wipe out content from controls
		do
			all_paths_cache := Void
			leaf_paths_cache := Void
			interface_paths_cache := Void
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
		end

	do_populate
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
		end

	adl_15_path_row (a_path: STRING): ARRAYED_LIST [STRING_32]
		local
			co: C_OBJECT
		do
			create Result.make (0)
			if source_archetype.has_object_path (a_path) then
				check attached source end
				check attached selected_language end

				-- first column: path
				if show_natural_language then
					Result.extend (utf8_to_utf32 (source.flat_archetype.terminology.annotated_path (a_path, selected_language, True)))
				else
					Result.extend (utf8_to_utf32 (a_path))
				end

				co := source_archetype.object_at_path (a_path)

				-- second column: RM type name
				Result.extend (utf8_to_utf32 (co.rm_type_name))

				-- third column: AOM type
				Result.extend (utf8_to_utf32 (co.generating_type))

				-- add an empty column to help display on all platforms
				Result.extend ("")
			end
		end

	adl_14_path_row (a_path: STRING): ARRAYED_LIST [STRING_32]
		local
			co: C_OBJECT
			path_str: STRING
		do
			create Result.make (0)
			if source_archetype.has_object_path (a_path) then
				check attached source end
				check attached selected_language end

				-- first column: path
				if show_natural_language then
					path_str := source.flat_archetype.terminology.annotated_path (a_path, selected_language, True)
				else
					path_str := a_path
				end
				Result.extend (utf8_to_utf32 (adl_15_path_converted (path_str)))

				co := source_archetype.object_at_path (a_path)

				-- second column: RM type name
				Result.extend (utf8_to_utf32 (co.rm_type_name))

				-- third column: AOM type
				Result.extend (utf8_to_utf32 (co.generating_type))

				-- add an empty column to help display on all platforms
				Result.extend ("")
			end
		end

	adl_interface_row (a_path: STRING): ARRAYED_LIST [STRING_32]
		local
			tag_str: STRING
		do
			create Result.make (0)
			if interface_paths.has (a_path) then
				check attached source end
				check attached selected_language end

				-- first column: interface tag
				check attached interface_paths.item (a_path) as att_tag then
					tag_str := att_tag
				end
				Result.extend (utf8_to_utf32 (tag_str))

				-- second column: path
				Result.extend (utf8_to_utf32 (a_path))
			end
		end

	path_list: ARRAYED_LIST [STRING]
		do
			if path_row_filter_selected.is_equal (path_control_filter_names.i_th (1)) then
				Result := all_paths
			else
				Result := leaf_paths
			end
		end

	all_paths: ARRAYED_LIST[STRING]
		do
			if attached all_paths_cache as att_cache then
				Result := att_cache
			else
				Result := source_archetype.all_paths
				all_paths_cache := Result
			end
		end

	leaf_paths: ARRAYED_LIST[STRING]
		do
			if attached leaf_paths_cache as att_cache then
				Result := att_cache
			else
				Result := source_archetype.leaf_paths
				leaf_paths_cache := Result
			end
		end

	interface_paths: HASH_TABLE [STRING, STRING]
		do
			if attached interface_paths_cache as att_cache then
				Result := att_cache
			else
				check attached selected_language end
				Result := source_archetype.interface_paths (selected_language)
				interface_paths_cache := Result
			end
		end

	all_paths_cache: detachable ARRAYED_LIST[STRING]

	leaf_paths_cache: detachable ARRAYED_LIST[STRING]

	interface_paths_cache: detachable HASH_TABLE [STRING, STRING]

end


