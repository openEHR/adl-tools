note
	component:   "openEHR Archetype Project"
	description: "Populate translation controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"


class GUI_TRANSLATION_CONTROLS

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate, can_edit, disable_edit, enable_edit
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make_editable, make

feature -- Definitions

	Default_original_text_size: INTEGER = 5000

feature {NONE} -- Initialisation

	make_editable (an_undo_redo_update_agent: like undo_redo_update_agent)
		do
			undo_redo_update_agent := an_undo_redo_update_agent
			create undo_redo_chain.make (undo_redo_update_agent)
			make
		end

	make
		do
			-- set commit handling
			create gui_controls.make (0)

			-- ======= root container ===========
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.set_data (Current)

			-- ========== Main split area =======================
			create ev_main_split_area
			ev_root_container.extend (ev_main_split_area)

			-- original text in a tabbed tree format - multi-line text field
			create original_text_ctl.make (get_text ("translation_original_label_text"),
				agent :STRING do Result := extract_original_text (source_archetype) end,
				0, 0, False)
			gui_controls.extend (original_text_ctl)
			ev_main_split_area.extend (original_text_ctl.ev_root_container)
			gui_controls.extend (original_text_ctl)

			-- translated text in a tabbed tree format - multi-line text field
			create translated_text.make (0)
			create translated_text_ctl.make_linked (get_text ("translation_translated_label_text"),
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
			create gui_translate_button.make_with_text_and_action (get_text ("translate_button_text"), agent add_translation)
			-- gui_control_panel.xx

			ev_main_split_area.set_proportion (0.5)

		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	translated_text: STRING

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
			if attached {C_OBJECT} a_c_node as co and then co.is_addressable then
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
			if is_valid_code (a_code) then
				if is_term_code (a_code) then
					rubric := source_archetype.ontology.term_definition (selected_language, a_code).text
				else
					rubric := source_archetype.ontology.constraint_definition (selected_language, a_code).text
				end
				Result.append (annotated_code (a_code, rubric))
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
				at_code_pos := translated_text.substring_index (term_code_leader, i)
				lbar_pos := translated_text.substring_index (Annotated_code_text_delimiter_string, at_code_pos)
				rbar_pos := translated_text.substring_index (Annotated_code_text_delimiter_string, lbar_pos + 1)
				if lbar_pos > 0 and rbar_pos > lbar_pos then
					if term_code_regex_matcher.matches (translated_text.substring (at_code_pos, lbar_pos - 1)) then
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



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is adl_ontology_controls.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
