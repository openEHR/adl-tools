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
			create gui_controls.make (0)


			-- ==================================== id terms grid ===========================================
			create ev_id_terms_hbox
			ev_id_terms_hbox.set_padding (Default_padding_width)
			ev_id_terms_hbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_id_terms_hbox)
			ev_root_container.set_item_text (ev_id_terms_hbox, get_text (ec_term_defs_tab_text))

			-- EV_GRID
			create evx_id_terms_grid.make (True, False, True, True)
			evx_id_terms_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_id_terms_hbox.extend (evx_id_terms_grid.ev_grid)

			-- ========== view controls control panel ===========
			create evx_id_terms_control_panel.make
			ev_id_terms_hbox.extend (evx_id_terms_control_panel.ev_root_container)
			ev_id_terms_hbox.disable_item_expand (evx_id_terms_control_panel.ev_root_container)

			-- tree collapse/expand control
			create evx_id_terms_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (evx_id_terms_grid),
				agent (a_row: EV_GRID_ROW): BOOLEAN do Result := not attached {BMM_MODEL_ELEMENT} a_row.data end,
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"), get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"))
			evx_id_terms_control_panel.add_frame (evx_id_terms_treeview_control.ev_root_container, False)


			-- ==================================== value sets grid ===========================================
			-- value sets VBOX
			create ev_vsets_hbox
			ev_vsets_hbox.set_padding (Default_padding_width)
			ev_vsets_hbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_vsets_hbox)
			ev_root_container.set_item_text (ev_vsets_hbox, get_text (ec_value_sets_tab_text))

			-- EV_GRID
			create evx_values_grid.make (True, False, True, True)
			evx_values_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_vsets_hbox.extend (evx_values_grid.ev_grid)

			-- ========== view controls control panel ===========
			create evx_vsets_control_panel.make
			ev_vsets_hbox.extend (evx_vsets_control_panel.ev_root_container)
			ev_vsets_hbox.disable_item_expand (evx_vsets_control_panel.ev_root_container)

			-- tree collapse/expand control
			create evx_vsets_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (evx_values_grid),
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
--			if is_id_code (a_code) then
--				select_coded_term_row (a_code, id_defs_mlist_ctl.ev_data_control)
--			elseif is_value_code (a_code) then
--				select_coded_term_row (a_code, value_defs_mlist_ctl.ev_data_control)
--			elseif is_constraint_code (a_code) then
--				select_coded_term_row (a_code, constraint_defs_mlist_ctl.ev_data_control)
--			end
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

	ev_vsets_hbox, ev_id_terms_hbox: EV_HORIZONTAL_BOX

	evx_values_grid, evx_id_terms_grid: EVX_GRID

	evx_vsets_control_panel, evx_id_terms_control_panel: EVX_CONTROL_PANEL

	evx_vsets_treeview_control, evx_id_terms_treeview_control: EVX_TREEVIEW_CONTROL

	view_frame_ctl: EVX_FRAME_CONTROL

	show_codes_checkbox_ctl: EVX_CHECK_BOX_CONTROL

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	terminology: ARCHETYPE_TERMINOLOGY
			-- access to ontology of selected archetype
		do
			Result := source_archetype.terminology
		end

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	do_clear
			-- wipe out content from ontology-related controls
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
			evx_values_grid.wipe_out
			evx_id_terms_grid.wipe_out
		end

	do_populate
		do
			check attached selected_language end

			terminologies := terminology.terminologies_available
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			do_populate_id_terms
			do_populate_values
		end

	do_populate_id_terms
		local
			def_it: C_ITERATOR
			col_titles: ARRAYED_LIST [STRING]
		do
			evx_id_terms_grid.wipe_out
			ev_parent_rows.wipe_out

			evx_id_terms_grid.ev_grid.lock_update
			check attached selected_language end
			create def_it.make (source_archetype.definition)
			def_it.do_all (agent populate_id_term_row_enter, agent populate_id_term_row_exit)
			evx_id_terms_grid.ev_grid.unlock_update

			-- set grid titles
			create col_titles.make (0)
			col_titles.append (Id_terms_grid_col_names.linear_representation)
			across terminologies as terminologies_csr loop
				col_titles.extend (terminologies_csr.item)
			end
			evx_id_terms_grid.set_column_titles (col_titles)

			evx_id_terms_grid.expand_tree
			evx_id_terms_grid.resize_columns_to_content_and_fit (id_grid_fixed_cols)
		end

	id_grid_fixed_cols: ARRAYED_LIST [INTEGER]
		do
			create Result.make (0)
			Result.extend (Id_terms_grid_col_text)
			across terminologies as terminologies_csr loop
				Result.extend (id_terms_grid_col_max + terminologies.count)
			end
		end

	populate_id_term_row_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- populate one row of id_terms grid
		local
			og_path: OG_PATH
		do
			-- if it's a differential path, get the id-codes from the path
			if attached {C_ATTRIBUTE} a_c_node as ca and then attached ca.differential_path as diff_path then
				create og_path.make_from_string (diff_path)
				across og_path as path_csr loop
					if path_csr.item.is_addressable and terminology.has_id_code (path_csr.item.object_id) then
						populate_id_term_row_data (path_csr.item.object_id)
					end
				end
			elseif attached {C_PRIMITIVE_OBJECT} a_c_node then
				-- ignore
			elseif attached {C_OBJECT} a_c_node as co and then terminology.has_id_code (co.node_id) then
				populate_id_term_row_data (co.node_id)
				check attached evx_id_terms_grid.last_row as lr then
					ev_parent_rows.extend (lr)
				end
			end
		end

	populate_id_term_row_data (a_node_id: STRING)
		local
			id_term: ARCHETYPE_TERM
			binding_str: STRING
		do
			check attached selected_language end

			id_term := terminology.term_definition (selected_language, a_node_id)
			if ev_parent_rows.is_empty then
				evx_id_terms_grid.add_row (id_term)
			else
				evx_id_terms_grid.add_sub_row (ev_parent_rows.item, id_term)
			end
			evx_id_terms_grid.set_last_row_label_col (Id_terms_grid_col_text, annotated_code (a_node_id, id_term.text, " "), Void, Id_code_color, get_icon_pixmap ("archetype/term_rel_part_of"))
			evx_id_terms_grid.set_last_row_label_col (Id_terms_grid_col_description, id_term.description, Void, Void, Void)

			-- populate bindings
			across terminologies as terminologies_csr loop
				if terminology.has_term_binding (terminologies_csr.item, a_node_id) then
					binding_str := terminology.term_binding (terminologies_csr.item, a_node_id).as_string
				else
					create binding_str.make_empty
				end
				evx_id_terms_grid.set_last_row_label_col (id_terms_grid_col_max + terminologies_csr.cursor_index, binding_str, Void, Binding_color, Void)
			end
		end

	populate_id_term_row_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- populate one row of id_terms grid
		do
			if attached {C_PRIMITIVE_OBJECT} a_c_node then
				-- ignore
			elseif attached {C_OBJECT} a_c_node as co and then terminology.has_id_code (co.node_id) then
				ev_parent_rows.remove
			end
		end

	ev_parent_rows: ARRAYED_STACK [EV_GRID_ROW]
		attribute
			create Result.make (0)
		end

	do_populate_values
		local
			ev_last_row: EV_GRID_ROW
			col_titles: ARRAYED_LIST [STRING]
		do
			evx_values_grid.wipe_out

			evx_values_grid.ev_grid.lock_update

			-- value sets
			across terminology.value_sets as vsets_csr loop
				evx_values_grid.add_row (vsets_csr.item)
				check attached evx_values_grid.last_row as lr then
					ev_last_row := lr
				end

				-- value set ac-code row
				populate_value_row (vsets_csr.key, Ac_code_color)

				-- member code rows
				across vsets_csr.item.members as vset_members_csr loop
					evx_values_grid.add_sub_row (ev_last_row, vset_members_csr.item)
					populate_value_row (vset_members_csr.item, At_code_color)
				end
			end

			-- ac-codes with bindings only, no value set
			across terminology.constraint_codes as ac_codes_csr loop
				if not terminology.has_value_set (ac_codes_csr.item) then
					evx_values_grid.add_row (ac_codes_csr.item)
					populate_value_row (ac_codes_csr.item, Ac_code_color)
				end
			end

			-- at-codes not in a value set
			across terminology.value_codes as at_codes_csr loop
				if not terminology.is_value_set_value_code (at_codes_csr.item) then
					evx_values_grid.add_row (at_codes_csr.item)
					populate_value_row (at_codes_csr.item, At_code_color)
				end
			end

			evx_values_grid.ev_grid.unlock_update

			-- set grid titles
			create col_titles.make (0)
			col_titles.append (Value_sets_grid_col_names.linear_representation)
			across terminologies as terminologies_csr loop
				col_titles.extend (terminologies_csr.item)
			end
			evx_values_grid.set_column_titles (col_titles)
			evx_values_grid.resize_columns_to_content_and_fit (Value_grid_fixed_cols)
		end

	Value_grid_fixed_cols: ARRAYED_LIST [INTEGER]
		do
			create Result.make (0)
			Result.extend (Value_sets_grid_col_code)
			across terminologies as terminologies_csr loop
				Result.extend (Value_sets_grid_col_max + terminologies.count)
			end
		end

	populate_value_row (a_code: STRING; key_item_colour: EV_COLOR)
		local
			vset_code_text, vset_code_string, binding_str: STRING
			term_def: ARCHETYPE_TERM
		do
			check attached selected_language end

			term_def := source.flat_archetype.terminology.term_definition (selected_language, a_code)
			vset_code_text := term_def.text
			if show_codes then
				vset_code_string := annotated_code (a_code, vset_code_text, " ")
			else
				vset_code_string := vset_code_text
			end
			evx_values_grid.set_last_row_label_col (Value_sets_grid_col_code, vset_code_string, Void, key_item_colour, Void)
			evx_values_grid.set_last_row_label_col (Value_sets_grid_col_definition, term_def.description, Void, Void, Void)

			-- populate bindings
			across terminologies as terminologies_csr loop
				if terminology.has_term_binding (terminologies_csr.item, a_code) then
					binding_str := terminology.term_binding (terminologies_csr.item, a_code).as_string
				else
					create binding_str.make_empty
				end
				evx_values_grid.set_last_row_label_col (Value_sets_grid_col_definition + terminologies_csr.cursor_index, binding_str, Void, Binding_color, Void)
			end
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
			evx_values_grid.ev_grid.tree_do_all (agent update_grid_row)

			-- set grid titles
			evx_values_grid.resize_columns_to_content
		end

	update_grid_row (a_grid_row: EV_GRID_ROW)
		local
			code, row_str: STRING
			term_def: ARCHETYPE_TERM
			show_desc: BOOLEAN
		do
			check attached selected_language end
			create code.make_empty
			if attached {VALUE_SET_RELATION} a_grid_row.data as vset then
				code := vset.id
				show_desc := a_grid_row.is_expanded
			elseif attached {STRING} a_grid_row.data as str then
				code := str
				show_desc := True
			end

			term_def := source.flat_archetype.terminology.term_definition (selected_language, code)
			if show_codes then
				row_str := annotated_code (code, term_def.text, " ")
			else
				row_str := term_def.text
			end

			evx_values_grid.set_last_row (a_grid_row)
			evx_values_grid.update_last_row_label_col (Value_sets_grid_col_code, row_str, Void, Void, Void)

			-- hide or show description column depending on whether value set node is expanded or not
			if show_desc then
				evx_values_grid.update_last_row_label_col (value_sets_grid_col_definition, term_def.description, Void, Void, Void)
			else
				evx_values_grid.update_last_row_label_col (value_sets_grid_col_definition, "", Void, Void, Void)
			end
		end

end



