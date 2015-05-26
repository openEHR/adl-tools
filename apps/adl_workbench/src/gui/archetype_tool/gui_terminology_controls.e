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
			can_edit, enable_edit, disable_edit, do_display
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
			{ANY} is_id_code
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
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"),
				get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"),
				agent do evx_id_terms_grid.resize_columns_to_content_and_fit (id_grid_fixed_cols) end)
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
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"),
				get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"),
				agent do evx_id_terms_grid.resize_columns_to_content_and_fit (id_grid_fixed_cols) end)
			evx_vsets_control_panel.add_frame (evx_vsets_treeview_control.ev_root_container, False)

			-- set editing state
			if not editing_enabled then
				disable_edit
			end

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

feature -- Status Report

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := True
		end

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

	select_id_code (an_id_code: STRING)
			-- select row for `an_id_code' in term_definitions control
		require
			is_id_code (an_id_code)
		local
			a_row: detachable EV_GRID_ROW
		do
			if evx_id_terms_grid.ev_grid.row_count /= 0 then
				a_row := evx_id_terms_grid.matching_sub_row (evx_id_terms_grid.ev_grid.row (1),
					agent (ev_row: EV_GRID_ROW; key: STRING): BOOLEAN
						do
							Result := attached {ARCHETYPE_TERM} ev_row.data as att_term and then att_term.code.is_equal (key)
						end (?, an_id_code)
				)

				if attached a_row as att_row then
					att_row.ensure_visible
					att_row.enable_select
				end
			end
		end

feature {NONE} -- Implementation

	ev_vsets_hbox, ev_id_terms_hbox: EV_HORIZONTAL_BOX

	evx_values_grid, evx_id_terms_grid: EVX_GRID

	evx_vsets_control_panel, evx_id_terms_control_panel: EVX_CONTROL_PANEL

	evx_vsets_treeview_control, evx_id_terms_treeview_control: EVX_TREEVIEW_CONTROL

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	terminology: ARCHETYPE_TERMINOLOGY
			-- access to ontology of selected archetype
		do
			Result := terminology_stack.item
		end

	terminology_stack: ARRAYED_STACK [ARCHETYPE_TERMINOLOGY]
		attribute
			create Result.make (0)
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

			terminology_stack.extend (source_archetype.terminology)

			terminologies := terminology.terminologies_available
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			do_populate_id_terms
			do_populate_values

			terminology_stack.remove
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
			Result.extend (Id_terms_grid_col_code)
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

			elseif attached {C_ARCHETYPE_ROOT} a_c_node as co and then not is_id_code (co.node_id) then
				populate_c_archetype_root_row_data (co.node_id)

				check attached {OPERATIONAL_TEMPLATE} source_archetype as opt then
					terminology_stack.extend (opt.component_terminology (co.node_id))
				end

				check attached evx_id_terms_grid.last_row as lr then
					ev_parent_rows.extend (lr)
				end

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
			ev_row: EV_GRID_ROW
			term_color: EV_COLOR
		do
			check attached selected_language end

			id_term := terminology.term_definition (selected_language, a_node_id)
			if ev_parent_rows.is_empty then
				evx_id_terms_grid.add_row (id_term)
			else
				evx_id_terms_grid.add_sub_row (ev_parent_rows.item, id_term)
			end
			check attached evx_id_terms_grid.last_row as lr then
				ev_row := lr
			end

			if specialisation_depth_from_code (a_node_id) = source_archetype.specialisation_depth then
				term_color := Id_code_color
			else
				term_color := Id_code_color_inherited
			end

			if editing_enabled and specialisation_depth_from_code (a_node_id) = source_archetype.specialisation_depth then
				-- id code column
				evx_id_terms_grid.set_last_row_label_col (Id_terms_grid_col_code, a_node_id, Void, Void, term_color, get_icon_pixmap ("archetype/term_rel_part_of"))
				-- text column	
				evx_id_terms_grid.set_last_row_label_col_editable (Id_terms_grid_col_text, id_term.text, Void, Void, term_color, Void, agent update_term_text (a_node_id, ev_row))
				-- description column
				evx_id_terms_grid.set_last_row_label_col_editable (Id_terms_grid_col_description, id_term.description, Void, Void, term_color, Void, agent update_term_description (a_node_id, ev_row))
			else
				-- id code column
				evx_id_terms_grid.set_last_row_label_col (Id_terms_grid_col_code, a_node_id, Void, Void, term_color, get_icon_pixmap ("archetype/term_rel_part_of"))
				-- text column			
				evx_id_terms_grid.set_last_row_label_col (Id_terms_grid_col_text, id_term.text, Void, Void, term_color, Void)
				-- description column
				evx_id_terms_grid.set_last_row_label_col (Id_terms_grid_col_description, id_term.description, Void, Void, term_color, Void)
			end

			-- populate bindings
			across terminologies as terminologies_csr loop
				if terminology.has_term_binding (terminologies_csr.item, a_node_id) then
					binding_str := terminology.term_binding (terminologies_csr.item, a_node_id).as_string
				else
					create binding_str.make_empty
				end
				evx_id_terms_grid.set_last_row_label_col (id_terms_grid_col_max + terminologies_csr.cursor_index, binding_str, Void, Void, Binding_color, Void)
			end
		end

	populate_id_term_row_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- populate one row of id_terms grid
		do
			if attached {C_PRIMITIVE_OBJECT} a_c_node then
				-- ignore
			elseif attached {C_ARCHETYPE_ROOT} a_c_node as car and then not is_id_code (car.node_id)then
				check attached {OPERATIONAL_TEMPLATE} source_archetype as opt then
					terminology_stack.remove
				end
				ev_parent_rows.remove
			elseif attached {C_OBJECT} a_c_node as co and then terminology.has_id_code (co.node_id) then
				ev_parent_rows.remove
			end
		end

	populate_c_archetype_root_row_data (an_archetype_id: STRING)
			-- populate a row that corresponds to a C_ARCHETYPE_ROOT node in flat form, whose id is an archetypoe_id
		local
			ev_row: EV_GRID_ROW
		do
			check attached selected_language end

			if ev_parent_rows.is_empty then
				evx_id_terms_grid.add_row (an_archetype_id)
			else
				evx_id_terms_grid.add_sub_row (ev_parent_rows.item, an_archetype_id)
			end
			check attached evx_id_terms_grid.last_row as lr then
				ev_row := lr
			end

			evx_id_terms_grid.set_last_row_label_col (Id_terms_grid_col_code, an_archetype_id, Void, Void, Id_code_color, get_icon_pixmap ("archetype/term_rel_part_of"))
		end

	ev_parent_rows: ARRAYED_STACK [EV_GRID_ROW]
		attribute
			create Result.make (0)
		end

	do_populate_values
		local
			ev_last_row: EV_GRID_ROW
			col_titles: ARRAYED_LIST [STRING]
			term_color: EV_COLOR
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
				if specialisation_depth_from_code (vsets_csr.key) = source_archetype.specialisation_depth then
					term_color := Ac_code_color
				else
					term_color := Id_code_color_inherited
				end
				populate_value_row (vsets_csr.key, term_color)

				-- member code rows
				across vsets_csr.item.members as vset_members_csr loop
					if specialisation_depth_from_code (vset_members_csr.item) = source_archetype.specialisation_depth then
						term_color := At_code_color
					else
						term_color := Id_code_color_inherited
					end

					evx_values_grid.add_sub_row (ev_last_row, vset_members_csr.item)
					populate_value_row (vset_members_csr.item, term_color)
				end
			end

			-- ac-codes with bindings only, no value set
			across terminology.value_set_codes as ac_codes_csr loop
				if not terminology.has_value_set (ac_codes_csr.item) then
					evx_values_grid.add_row (ac_codes_csr.item)
					if specialisation_depth_from_code (ac_codes_csr.item) = source_archetype.specialisation_depth then
						term_color := Ac_code_color
					else
						term_color := Id_code_color_inherited
					end
					populate_value_row (ac_codes_csr.item, term_color)
				end
			end

			-- at-codes not in a value set
			across terminology.value_codes as at_codes_csr loop
				if not terminology.has_value_set_value_code (at_codes_csr.item) then
					evx_values_grid.add_row (at_codes_csr.item)
					if specialisation_depth_from_code (at_codes_csr.item) = source_archetype.specialisation_depth then
						term_color := At_code_color
					else
						term_color := Id_code_color_inherited
					end
					populate_value_row (at_codes_csr.item, term_color)
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
			binding_str: STRING
			term_def: ARCHETYPE_TERM
			ev_row: EV_GRID_ROW
		do
			check attached selected_language end

			term_def := safe_source.flat_archetype.terminology.term_definition (selected_language, a_code)
			evx_values_grid.set_last_row_label_col (Value_sets_grid_col_code, a_code, Void, Void, key_item_colour, Void)
			check attached evx_values_grid.last_row as lr then
				ev_row := lr
			end
			if editing_enabled and specialisation_depth_from_code (a_code) = source_archetype.specialisation_depth then
				evx_values_grid.set_last_row_label_col_editable (Value_sets_grid_col_text, term_def.text, Void, Void, Void, Void, agent update_term_text (a_code, ev_row))
				evx_values_grid.set_last_row_label_col_editable (Value_sets_grid_col_description, term_def.description, Void, Void, Void, Void, agent update_term_description (a_code, ev_row))
			else
				evx_values_grid.set_last_row_label_col (Value_sets_grid_col_text, term_def.text, Void, Void, Void, Void)
				evx_values_grid.set_last_row_label_col (Value_sets_grid_col_description, term_def.description, Void, Void, Void, Void)
			end

			-- populate bindings
			across terminologies as terminologies_csr loop
				if terminology.has_term_binding (terminologies_csr.item, a_code) then
					binding_str := terminology.term_binding (terminologies_csr.item, a_code).as_string
				else
					create binding_str.make_empty
				end
				evx_values_grid.set_last_row_label_col (Value_sets_grid_col_description + terminologies_csr.cursor_index, binding_str, Void, Void, Binding_color, Void)
			end
		end

	terminologies: ARRAYED_SET [STRING]
		attribute
			create Result.make (0)
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
			al.append (terminologies)

			Result := al.to_array
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
			-- hide or show description column depending on whether value set node is expanded or not
		local
			code: STRING
			term_def: ARCHETYPE_TERM
			show_desc: BOOLEAN
		do
			check attached selected_language end
			create code.make_empty
			if attached {VALUE_SET} a_grid_row.data as vset then
				code := vset.id
				show_desc := a_grid_row.is_expanded
			elseif attached {STRING} a_grid_row.data as str then
				code := str
				show_desc := True
			end

			term_def := source.flat_archetype.terminology.term_definition (selected_language, code)
			evx_values_grid.set_last_row (a_grid_row)
			if show_desc then
				evx_values_grid.update_last_row_label_col (value_sets_grid_col_description, term_def.description, Void, Void, Void, Void)
			else
				evx_values_grid.update_last_row_label_col (value_sets_grid_col_description, "", Void, Void, Void, Void)
			end
		end

	update_term_text (a_node_id: STRING; an_ev_row: EV_GRID_ROW)
			-- action to perform if text for an id-code is edited by user
		local
			arch_term: ARCHETYPE_TERM
			old_text: STRING
		do
			if attached {EV_GRID_EDITABLE_ITEM} an_ev_row.item (Id_terms_grid_col_text) as att_editable and attached selected_language as att_lang then
				arch_term := source_archetype.terminology.term_definition (att_lang, a_node_id)
				old_text := arch_term.text
				arch_term.set_text (utf32_to_utf8 (att_editable.text))

				undo_redo_chain.add_link (evx_id_terms_grid.ev_grid,
					agent arch_term.set_text (old_text),
					agent repopulate,
					agent arch_term.set_text (utf32_to_utf8 (att_editable.text)),
					agent repopulate)
			end

		end

	update_term_description (a_node_id: STRING; an_ev_row: EV_GRID_ROW)
			-- action to perform if description for an id-code is edited by user
		local
			arch_term: ARCHETYPE_TERM
			old_text: STRING
		do
			if attached {EV_GRID_EDITABLE_ITEM} an_ev_row.item (Id_terms_grid_col_description) as att_editable and attached selected_language as att_lang then
				arch_term := source_archetype.terminology.term_definition (att_lang, a_node_id)
				old_text := arch_term.description
				arch_term.set_description (utf32_to_utf8 (att_editable.text))

				undo_redo_chain.add_link (evx_id_terms_grid.ev_grid,
					agent arch_term.set_description (old_text),
					agent repopulate,
					agent arch_term.set_description (utf32_to_utf8 (att_editable.text)),
					agent repopulate)

				gui_agents.call_refresh_archetype_editors_agent (source_archetype.archetype_id.as_string)
			end

		end

end



