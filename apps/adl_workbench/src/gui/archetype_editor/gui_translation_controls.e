note
	component:   "openEHR ADL Tools"
	description: "Populate translation controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class GUI_TRANSLATION_CONTROLS

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_edit, disable_edit, enable_edit
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make_editable, make

feature -- Definitions

	Default_original_text_size: INTEGER = 5000

feature {NONE} -- Initialisation

	make_editable (an_undo_redo_update_agent: attached like undo_redo_update_agent)
		do
			undo_redo_update_agent := an_undo_redo_update_agent
			create undo_redo_chain.make (an_undo_redo_update_agent)
			make
		end

	make
		do
			create translated_terms.make (0)
			create attr_buffer.make_empty
			create original_text.make_empty

			-- set commit handling
			create gui_controls.make (0)

			-- ======= root container ===========
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ========== Main split area =======================
			create ev_main_split_area
			ev_root_container.extend (ev_main_split_area)

			-- original text in a tabbed tree format - multi-line text field
			create original_text_ctl.make (get_text ({ADL_MESSAGES_IDS}.ec_translation_original_label_text),
				agent :STRING
					do
						check attached source_archetype as arch then
							Result := extract_original_text (arch)
						end
					end,
				0, 0, False)
			gui_controls.extend (original_text_ctl)
			ev_main_split_area.extend (original_text_ctl.ev_root_container)
			gui_controls.extend (original_text_ctl)

			-- translated text in a tabbed tree format - multi-line text field
			create translated_text.make (0)
			create translated_text_ctl.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_translation_translated_label_text),
				agent :STRING do Result := translated_text end,
				agent (a_str: STRING) do translated_text := a_str end,
				Void, undo_redo_chain,
				0, 0, False)
			gui_controls.extend (translated_text_ctl)
			ev_main_split_area.extend (translated_text_ctl.ev_root_container)
			gui_controls.extend (translated_text_ctl)

			-- ========== control panel ===========
			create gui_control_panel.make
			ev_root_container.extend (gui_control_panel.ev_root_container)
			ev_root_container.disable_item_expand (gui_control_panel.ev_root_container)

			-- 'add translation' button
			create gui_translate_button.make_with_text_and_action (get_text ({ADL_MESSAGES_IDS}.ec_translate_button_text), agent add_translation)
			-- gui_control_panel.xx

			ev_main_split_area.set_proportion (0.5)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	translated_text: STRING

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

feature {NONE} -- Implementation

	ev_main_split_area: EV_VERTICAL_SPLIT_AREA

	gui_control_panel: EVX_CONTROL_PANEL

	gui_translate_button: EV_BUTTON

	original_text_ctl, translated_text_ctl: EVX_MULTILINE_TEXT_CONTROL

	undo_redo_update_agent: detachable PROCEDURE [ANY, TUPLE [UNDO_REDO_CHAIN]]

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	do_clear
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
		end

	do_populate
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
		end

	extract_original_text (an_archetype: ARCHETYPE): STRING
		local
			def_it: C_ITERATOR
		do
			create original_text.make (Default_original_text_size)
			create attr_buffer.make (500)
			create def_it.make (an_archetype.definition)
			def_it.do_all (agent c_node_enter, agent c_node_exit)
			Result := original_text
		end

	c_node_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
			if depth < last_depth then
				attr_buffer.wipe_out
			end
			if attached {C_OBJECT} a_c_node as co then
				original_text.append (attr_buffer)
				original_text.append (tab_string.substring (1, depth*2))
				original_text.append (local_term_string (co.node_id))
				original_text.append ("%N")
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				attr_buffer.append (tab_string.substring (1, depth*2))
				attr_buffer.append (ca.rm_attribute_name)
				attr_buffer.append ("%N")
			end
			last_depth := depth
		end

	c_node_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

	last_depth: INTEGER

	original_text: STRING

	attr_buffer: STRING

	tab_string: STRING
		once
			create Result.make_filled (' ', 100)
		end

	local_term_string (a_code: STRING): STRING
			-- generate a string of the form "[code|rubric|]" if in technical mode,
			-- or else "rubric"
		local
			rubric: STRING
		do
			create Result.make_empty
			if is_valid_code (a_code) and attached selected_language as sel_lang then
				if is_value_code (a_code) then
					rubric := source_archetype.terminology.term_definition (sel_lang, a_code).text
				else
					rubric := source_archetype.terminology.term_definition (sel_lang, a_code).text
				end
				Result.append (annotated_code (a_code, rubric, " "))
			end
		end

	add_translation
		local
			i, at_code_pos, lbar_pos, rbar_pos: INTEGER
		do
			create translated_terms.make (0)
			from
				i := 1
			until
				i > translated_text.count
			loop
				at_code_pos := translated_text.substring_index (Value_code_leader, i)
				lbar_pos := translated_text.substring_index (Annotated_code_text_delimiter_string, at_code_pos)
				rbar_pos := translated_text.substring_index (Annotated_code_text_delimiter_string, lbar_pos + 1)
				if lbar_pos > 0 and rbar_pos > lbar_pos then
					if value_code_regex_matcher.recognizes (translated_text.substring (at_code_pos, lbar_pos - 1)) then
						translated_terms.put (translated_text.substring (lbar_pos + 1, rbar_pos - 1), translated_text.substring (at_code_pos, lbar_pos - 1))
						i := rbar_pos + 1
					else
						i := rbar_pos + 1
					end
				else
					i := translated_text.count + 1
				end
			end

--			if source_archetype.has_language (a_lang_tag: [detachable] STRING_8) then
--				
--			end
		end

	translated_terms: HASH_TABLE [STRING, STRING]

end



