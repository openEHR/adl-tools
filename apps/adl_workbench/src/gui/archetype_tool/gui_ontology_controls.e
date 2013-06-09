note
	component:   "openEHR ADL Tools"
	description: "Populate ontology controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ONTOLOGY_CONTROLS

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate, can_edit, enable_edit, disable_edit, on_selected
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make, make_editable

feature {NONE} -- Initialisation

	make_editable (an_undo_redo_update_agent: like undo_redo_update_agent)
		do
			undo_redo_update_agent := an_undo_redo_update_agent
			create undo_redo_chain.make (undo_redo_update_agent)
			make
		end

	make
		do
			-- ======= root container ===========
			create gui_controls.make (0)

			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			create ev_vsplit
			ev_root_container.extend (ev_vsplit)

			-- create Fames
			create term_defs_frame_ctl.make (get_msg (ec_term_defs_frame_text, Void), 0, 0, True)
			ev_vsplit.extend (term_defs_frame_ctl.ev_root_container)
			ev_vsplit.enable_item_expand (term_defs_frame_ctl.ev_root_container)

			-- term defs + bindings
			create term_defs_mlist_ctl.make_editable (
				agent :LIST [STRING] do Result := ontology.term_codes end,
				Void,
				Void,
				agent update_term_table_item,
				undo_redo_chain,
				0, 0,
				agent term_definition_header,
				agent term_definition_row)
			term_defs_frame_ctl.extend (term_defs_mlist_ctl.ev_root_container, True)
			gui_controls.extend (term_defs_mlist_ctl)

			-- constraint defs + bindings
			create constraint_defs_frame_ctl.make (get_msg (ec_constraint_defs_frame_text, Void), 0, 0, True)
			ev_vsplit.extend (constraint_defs_frame_ctl.ev_root_container)
			ev_vsplit.disable_item_expand (constraint_defs_frame_ctl.ev_root_container)

			create constraint_defs_mlist_ctl.make_editable (
				agent :LIST [STRING] do Result := ontology.constraint_codes end,
				Void,
				Void,
				agent update_constraint_table_item,
				undo_redo_chain,
				0, 0,
				agent term_definition_header,
				agent constraint_definition_row)
			constraint_defs_frame_ctl.extend (constraint_defs_mlist_ctl.ev_root_container, True)
			gui_controls.extend (constraint_defs_mlist_ctl)

			if not editing_enabled then
				disable_edit
			end

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

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

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_TITLED_DATA_CONTROL) do an_item.enable_editable end)
		end

	disable_edit
			-- disable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_TITLED_DATA_CONTROL) do an_item.disable_editable end)
		end

	select_term (a_term_code: attached STRING)
			-- select row for a_term_code in term_definitions control
		do
			select_coded_term_row (a_term_code, term_defs_mlist_ctl.ev_data_control)
		end

	select_constraint (a_term_code: attached STRING)
			-- select row for a_term_code in term_definitions control
		do
			select_coded_term_row (a_term_code, constraint_defs_mlist_ctl.ev_data_control)
		end

feature -- Events

	on_selected
			-- perform when this tool made visible, e.g. by selection of parent notebook tab
		do
			if editing_enabled then
				undo_redo_update_agent.call ([undo_redo_chain])
			end
		end

feature {NONE} -- Implementation

	term_defs_mlist_ctl, constraint_defs_mlist_ctl: EVX_MULTI_COLUMN_TABLE_CONTROL

	ev_vsplit: EV_VERTICAL_SPLIT_AREA

	term_defs_frame_ctl, constraint_defs_frame_ctl: EVX_FRAME_CONTROL

	undo_redo_update_agent: detachable PROCEDURE [ANY, TUPLE [UNDO_REDO_CHAIN]]

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	ontology: attached ARCHETYPE_ONTOLOGY
			-- access to ontology of selected archetype
		do
			Result := source_archetype.ontology
		end

	gui_controls: ARRAYED_LIST [EVX_TITLED_DATA_CONTROL]

	do_clear
			-- wipe out content from ontology-related controls
		do
			gui_controls.do_all (agent (an_item: EVX_TITLED_DATA_CONTROL) do an_item.clear end)
		end

	do_populate
		do
			terminologies := ontology.terminologies_available
			gui_controls.do_all (agent (an_item: EVX_TITLED_DATA_CONTROL) do an_item.populate end)
		end

	terminologies: ARRAYED_SET [STRING]

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

	term_definition_row (a_code: STRING): ARRAYED_LIST [STRING_32]
			-- row of data items for term definitions table, as an ARRAY of UTF-32 Strings
		local
			a_term: ARCHETYPE_TERM
		do
			create Result.make(3)

			-- column #1, 2, 3 - code, text, description
			Result.extend (a_code)
			a_term := ontology.term_definition (selected_language, a_code)
			Result.extend (utf8_to_utf32 (a_term.text))
			Result.extend (utf8_to_utf32 (a_term.description))

			-- populate bindings
			across terminologies as terminologies_csr loop
				if ontology.has_term_binding (terminologies_csr.item, a_term.code) then
					Result.extend (utf8_to_utf32 (ontology.term_binding (terminologies_csr.item, a_term.code).as_string))
				else
					Result.extend ("")
				end
			end
		end

	constraint_definition_row (a_code: STRING): ARRAYED_LIST [STRING_32]
			-- row of data items for constraint definitions table, as an ARRAY of UTF-32 Strings
		local
			a_term: ARCHETYPE_TERM
		do
			create Result.make(3)

			-- column #1, 2, 3 - code, text, description
			Result.extend (a_code)
			a_term := ontology.constraint_definition (selected_language, a_code)
			Result.extend (utf8_to_utf32 (a_term.text))
			Result.extend (utf8_to_utf32 (a_term.description))

			-- populate bindings
			across terminologies as terminologies_csr loop
				if ontology.has_constraint_binding (terminologies_csr.item, a_term.code) then
					Result.extend (utf8_to_utf32 (ontology.constraint_binding (terminologies_csr.item, a_term.code).as_string))
				else
					Result.extend ("")
				end
			end
		end

	update_term_table_item (a_col_name, a_code: STRING; a_value: STRING_32)
			-- update either term definition or binding in ontology based on `a_col_name' column in displayed table
		do
			if archetype_term_keys.has (a_col_name) then
				source_archetype.ontology.replace_term_definition_item (selected_language, a_code, a_col_name, a_value)
			elseif source_archetype.ontology.has_term_binding (a_col_name, a_code) then -- replace an existing binding
				source_archetype.ontology.replace_term_binding (create {CODE_PHRASE}.make_from_string (a_value), a_code)
			elseif source_archetype.ontology.has_terminology (a_col_name) then -- terminology known
				source_archetype.ontology.add_term_binding (create {CODE_PHRASE}.make_from_string (a_value), a_code)
			end
		end

	update_constraint_table_item (a_col_name, a_code: STRING; a_value: STRING_32)
			-- update either constraint definition or binding in ontology based on `a_col_name' column in displayed table
		do
			if archetype_term_keys.has (a_col_name) then
				source_archetype.ontology.replace_constraint_definition_item (selected_language, a_code, a_col_name, a_value)
			elseif source_archetype.ontology.has_constraint_binding (a_col_name, a_code) then -- replace an existing binding
				source_archetype.ontology.replace_constraint_binding (create {URI}.make_from_string (a_value), a_col_name, a_code)
			elseif source_archetype.ontology.has_terminology (a_col_name) then -- terminology known
				source_archetype.ontology.add_constraint_binding (create {URI}.make_from_string (a_value), a_col_name, a_code)
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

end



