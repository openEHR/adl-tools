note
	component:   "openEHR ADL Tools"
	description: "Populate ontology controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_TERMINOLOGY_CONTROLS

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate, can_edit, enable_edit, disable_edit, do_display
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make, make_editable

feature {NONE} -- Initialisation

	make_editable (an_undo_redo_chain: like undo_redo_chain)
		do
			undo_redo_chain := an_undo_redo_chain
			make
		end

	make
		do
			-- ======= root container (notebook) ===========
			create ev_root_container

			-- ======= definitions vbox ===========
			create gui_controls.make (0)

			create ev_defs_vbox
			ev_defs_vbox.set_padding (Default_padding_width)
			ev_defs_vbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_defs_vbox)
			ev_root_container.set_item_text (ev_defs_vbox, get_text (ec_term_defs_tab_text))

			create ev_vsplit_1
			ev_defs_vbox.extend (ev_vsplit_1)

			create ev_vsplit_2
			ev_vsplit_1.extend (ev_vsplit_2)
			ev_vsplit_1.enable_item_expand (ev_vsplit_2)

			-- id defs + bindings
			create id_defs_frame_ctl.make (get_msg (ec_id_defs_frame_text, Void), 0, 0, True)
			ev_vsplit_2.extend (id_defs_frame_ctl.ev_root_container)
			ev_vsplit_2.enable_item_expand (id_defs_frame_ctl.ev_root_container)

			create id_defs_mlist_ctl.make_editable (
				agent :LIST [STRING] do Result := terminology.id_codes end,
				Void,
				Void,
				agent update_term_table_item,
				undo_redo_chain,
				0, 0,
				agent term_definition_header,
				agent term_definition_row)
			id_defs_frame_ctl.extend (id_defs_mlist_ctl.ev_root_container, True)
			gui_controls.extend (id_defs_mlist_ctl)

			-- term defs + bindings
			create term_defs_frame_ctl.make (get_msg (ec_term_defs_frame_text, Void), 0, 0, True)
			ev_vsplit_2.extend (term_defs_frame_ctl.ev_root_container)
			ev_vsplit_2.enable_item_expand (term_defs_frame_ctl.ev_root_container)

			create value_defs_mlist_ctl.make_editable (
				agent :LIST [STRING] do Result := terminology.value_codes end,
				Void,
				Void,
				agent update_term_table_item,
				undo_redo_chain,
				0, 0,
				agent term_definition_header,
				agent term_definition_row)
			term_defs_frame_ctl.extend (value_defs_mlist_ctl.ev_root_container, True)
			gui_controls.extend (value_defs_mlist_ctl)

			-- constraint defs + bindings
			create constraint_defs_frame_ctl.make (get_msg (ec_constraint_defs_frame_text, Void), 0, 0, True)
			ev_vsplit_1.extend (constraint_defs_frame_ctl.ev_root_container)
			ev_vsplit_1.disable_item_expand (constraint_defs_frame_ctl.ev_root_container)

			create constraint_defs_mlist_ctl.make_editable (
				agent :LIST [STRING] do Result := terminology.constraint_codes end,
				Void,
				Void,
				agent update_term_table_item,
				undo_redo_chain,
				0, 0,
				agent term_definition_header,
				agent term_definition_row)
			constraint_defs_frame_ctl.extend (constraint_defs_mlist_ctl.ev_root_container, True)
			gui_controls.extend (constraint_defs_mlist_ctl)

			-- ======= value sets vbox ===========
			create ev_vsets_hbox
			ev_vsets_hbox.set_padding (Default_padding_width)
			ev_vsets_hbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_vsets_hbox)
			ev_root_container.set_item_text (ev_vsets_hbox, get_text (ec_value_sets_tab_text))

			-- EV_GRID
			create evx_vsets_grid.make (True, False, True, True)
			evx_vsets_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_vsets_hbox.extend (evx_vsets_grid.ev_grid)

			-- ========== view controls control panel ===========
			create evx_vsets_control_panel.make
			ev_vsets_hbox.extend (evx_vsets_control_panel.ev_root_container)
			ev_vsets_hbox.disable_item_expand (evx_vsets_control_panel.ev_root_container)

			-- tree collapse/expand control
			create evx_vsets_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (evx_vsets_grid),
				agent (a_row: EV_GRID_ROW): BOOLEAN do Result := not attached {BMM_MODEL_ELEMENT} a_row.data end,
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"), get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"))
			evx_vsets_control_panel.add_frame (evx_vsets_treeview_control.ev_root_container, False)

			-- ========= view options  =========

			-- 'View' frame
			create view_frame_ctl.make (get_text (ec_view_detail_controls_text), 85, 100, False)
			evx_vsets_control_panel.add_frame_control (view_frame_ctl, False)

			-- show codes checkbox
			create show_codes_checkbox_ctl.make_linked (get_text (ec_domain_view_add_codes_text), Void,
				agent :BOOLEAN do Result := show_codes end, agent update_show_codes)
			view_frame_ctl.extend (show_codes_checkbox_ctl.ev_data_control, False)
			gui_controls.extend (show_codes_checkbox_ctl)


			-- set editing state
			if not editing_enabled then
				disable_edit
			end

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := True
		end

	show_codes: BOOLEAN
			-- True if codes should be shown

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

	disable_edit
			-- disable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.disable_editable end)
		end

	select_code (a_code: STRING)
			-- select row for a_term_code in term_definitions control
		do
			if is_id_code (a_code) then
				select_coded_term_row (a_code, id_defs_mlist_ctl.ev_data_control)
			elseif is_value_code (a_code) then
				select_coded_term_row (a_code, value_defs_mlist_ctl.ev_data_control)
			elseif is_constraint_code (a_code) then
				select_coded_term_row (a_code, constraint_defs_mlist_ctl.ev_data_control)
			end
		end

feature {NONE} -- Events

	update_show_codes (a_flag: BOOLEAN)
		do
			show_codes := a_flag
			if attached source then
				redisplay
			end
		end

feature {NONE} -- Implementation

	ev_defs_vbox: EV_VERTICAL_BOX

	ev_vsets_hbox: EV_HORIZONTAL_BOX

	evx_vsets_grid: EVX_GRID

	evx_vsets_control_panel: EVX_CONTROL_PANEL

	evx_vsets_treeview_control: EVX_TREEVIEW_CONTROL

	id_defs_mlist_ctl, value_defs_mlist_ctl, constraint_defs_mlist_ctl: EVX_MULTI_COLUMN_TABLE_CONTROL

	ev_vsplit_1, ev_vsplit_2: EV_VERTICAL_SPLIT_AREA

	view_frame_ctl, id_defs_frame_ctl, term_defs_frame_ctl, constraint_defs_frame_ctl: EVX_FRAME_CONTROL

	show_codes_checkbox_ctl: EVX_CHECK_BOX_CONTROL

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	terminology: attached ARCHETYPE_TERMINOLOGY
			-- access to ontology of selected archetype
		do
			Result := source_archetype.terminology
		end

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	do_clear
			-- wipe out content from ontology-related controls
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
			evx_vsets_grid.wipe_out
		end

	do_populate
		local
			ev_last_row: EV_GRID_ROW
			vset_code_text, vset_code_string, vmem_code_text, vmem_code_string: STRING
		do
			check attached selected_language end

			terminologies := terminology.terminologies_available
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			-- populate the value sets grid
			across terminology.value_sets as vsets_csr loop
				evx_vsets_grid.add_row (vsets_csr.item)
				check attached evx_vsets_grid.last_row as lr then
					ev_last_row := lr
				end
				-- value set ac-code row
				vset_code_text := terminology.term_definition (selected_language, vsets_csr.key).text
				if show_codes then
					vset_code_string := annotated_code (vsets_csr.key, vset_code_text, " ")
				else
					vset_code_string := vset_code_text
				end
				evx_vsets_grid.set_last_row_label_col (Value_sets_grid_col_code, vset_code_string, Void, Void, Void)
				evx_vsets_grid.set_last_row_label_col (Value_sets_grid_col_member_code, "", Void, Void, Void)

				-- member code rows
				across vsets_csr.item.targets as vset_members_csr loop
					evx_vsets_grid.add_sub_row (ev_last_row, vset_members_csr.item)
					vmem_code_text := terminology.term_definition (selected_language, vset_members_csr.item).text
					if show_codes then
						vmem_code_string := annotated_code (vset_members_csr.item, vmem_code_text, " ")
					else
						vmem_code_string := vmem_code_text
					end
					evx_vsets_grid.set_last_row_label_col (Value_sets_grid_col_code, "", Void, Void, Void)
					evx_vsets_grid.set_last_row_label_col (Value_sets_grid_col_member_code, vmem_code_string, Void, Void, Void)
				end
			end

			-- set grid titles
			evx_vsets_grid.set_column_titles (Value_sets_grid_col_names.linear_representation)
			evx_vsets_grid.resize_columns_to_content
		end

	terminologies: detachable ARRAYED_SET [STRING]
		note
			option: stable
		attribute
		end

	term_definition_header: ARRAY [STRING]
			-- generate a set of heading strings for terminology table in ontology viewer
		local
			al: ARRAYED_LIST [STRING]
		do
			-- populate column titles
			create al.make (3)
			al.extend ("code")

			-- term attribute names - text and description
			al.append (archetype_term_keys)

			-- terminology names
			check attached terminologies end
			al.append (terminologies)

			Result := al.to_array
		end

	term_definition_row (a_code: STRING): ARRAYED_LIST [STRING_32]
			-- row of data items for term definitions table, as an ARRAY of UTF-32 Strings
		local
			a_term: ARCHETYPE_TERM
		do
			create Result.make(3)

			-- column #1, 2, 3 - code, text, description
			Result.extend (a_code)
			check attached selected_language end
			a_term := terminology.term_definition (selected_language, a_code)
			Result.extend (utf8_to_utf32 (a_term.text))
			Result.extend (utf8_to_utf32 (a_term.description))

			-- populate bindings
			across terminologies as terminologies_csr loop
				if terminology.has_term_binding (terminologies_csr.item, a_code) then
					Result.extend (utf8_to_utf32 (terminology.term_binding (terminologies_csr.item, a_code).as_string))
				else
					Result.extend ("")
				end
			end
		end

	update_term_table_item (a_col_name, a_code: STRING; a_value: STRING_32)
			-- update either term definition or binding in terminology based on `a_col_name' column in displayed table
		do
			check attached selected_language end
			if archetype_term_keys.has (a_col_name) then
				source_archetype.terminology.replace_term_definition_item (selected_language, a_code, a_col_name, a_value)
			elseif source_archetype.terminology.has_term_binding (a_col_name, a_code) then -- replace an existing binding
				source_archetype.terminology.replace_term_binding (create {URI}.make_from_string (a_value), a_col_name, a_code)
			elseif source_archetype.terminology.has_terminology (a_col_name) then -- terminology known
				source_archetype.terminology.put_term_binding (create {URI}.make_from_string (a_value), a_col_name, a_code)
			end
		end

	select_coded_term_row (a_term_code: STRING; list_control: EV_MULTI_COLUMN_LIST)
			-- Select the row for `a_term_code' in `list_control'.
		local
			found: BOOLEAN
		do
			list_control.remove_selection
			list_control.show
			from list_control.start until list_control.off or found loop
				if list_control.item.first.is_equal (a_term_code) then
					list_control.item.enable_select
					found := True
				--	if list_control.is_displayed then
						list_control.ensure_item_visible (list_control.item)
				--	end
				end
				list_control.forth
			end
		end

	do_display
			-- refresh visual controls
		do
			check attached selected_language end

			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			-- repopulate the value sets grid
			evx_vsets_grid.ev_grid.tree_do_all (agent update_grid_row)

			-- set grid titles
			evx_vsets_grid.resize_columns_to_content
		end

	update_grid_row (a_grid_row: EV_GRID_ROW)
		local
			code, row_str: STRING
			col: INTEGER
			term_def: ARCHETYPE_TERM
		do
			check attached selected_language end
			create code.make_empty
			if attached {VALUE_SET_RELATION} a_grid_row.data as vset then
				code := vset.origin
				col := Value_sets_grid_col_code
			elseif attached {STRING} a_grid_row.data as str then
				code := str
				col := Value_sets_grid_col_member_code
			end

			term_def := terminology.term_definition (selected_language, code)
			if show_codes then
				row_str := annotated_code (code, term_def.text, " ")
			else
				row_str := term_def.text
			end

			evx_vsets_grid.set_last_row (a_grid_row)
			evx_vsets_grid.update_last_row_label_col (col, row_str, term_def.description, Void, Void)
		end

end



