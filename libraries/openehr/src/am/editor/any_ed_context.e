note
	component:   "openEHR Archetype Project"
	description: "Interface of any Editor context"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ANY_ED_CONTEXT

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

feature -- Definitions

	c_meaning_colours: HASH_TABLE [EV_COLOR, INTEGER]
			-- foreground colours for meaning (node_id rubric) based on inheritance status
		once
			create Result.make(0)
			Result.put (archetype_rm_type_redefined_color, ss_redefined)
			Result.put (archetype_rm_type_inherited_color, ss_inherited)
		end

	c_constraint_colours: HASH_TABLE [EV_COLOR, INTEGER]
			-- foreground colours for constraints
		once
			create Result.make(0)
			Result.put (archetype_rm_type_inherited_color, ss_inherited)
		end

	c_attribute_colours: HASH_TABLE [EV_COLOR, INTEGER]
			-- foreground colours for meaning (node_id rubric) based on inheritance status
		once
			create Result.make(0)
			Result.put (archetyped_attribute_color, ss_added)
			Result.put (archetype_rm_type_redefined_color, ss_redefined)
			Result.put (archetype_rm_type_inherited_color, ss_inherited)
		end

feature -- Initialisation

	make (an_arch_node: like arch_node; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
		do
			arch_node := an_arch_node
			archetype := an_archetype
			if attached {DIFFERENTIAL_ARCHETYPE} archetype then
				in_differential_view := True
			end
			flat_ontology := a_flat_ontology
			rm_schema := an_rm_schema
		end

feature -- Access

	arch_node: ANY
			-- archetype node being edited in this context

	archetype: ARCHETYPE
			-- owning archetype

	flat_ontology: FLAT_ARCHETYPE_ONTOLOGY
			-- access to archetype flat ontology

	rm_schema: BMM_SCHEMA

	gui_grid: detachable EVX_GRID
			-- note: stable once attached

	gui_grid_row: detachable EV_GRID_ROW
			-- note: stable once attached

feature -- Display Settings

	in_technical_view: BOOLEAN

	in_differential_view: BOOLEAN

	show_rm_inheritance: BOOLEAN

	show_codes: BOOLEAN

	language: STRING

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		deferred
		ensure
			gui_grid_set: gui_grid = a_gui_grid
		end

	display_in_grid (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag: BOOLEAN; a_lang: STRING)
		do
			in_technical_view := in_technical_view_flag
			show_rm_inheritance := show_rm_inheritance_flag
			show_codes := show_codes_flag
			language := a_lang
			gui_grid.set_last_row (gui_grid_row)
		end

feature {NONE} -- Implementation

	c_meaning_colour: EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if show_rm_inheritance and c_meaning_colours.has (node_specialisation_status) then
				Result := c_meaning_colours.item (node_specialisation_status)
			end
		end

	c_constraint_colour: EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if show_rm_inheritance and c_constraint_colours.has (node_specialisation_status) then
				Result := c_constraint_colours.item (node_specialisation_status)
			else
				Result := archetype_constraint_color
			end
		end

	c_attribute_colour: EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if show_rm_inheritance and c_attribute_colours.has (node_specialisation_status) then
				Result := c_attribute_colours.item (node_specialisation_status)
			else
				Result := archetyped_attribute_color
			end
		end

	c_pixmap: EV_PIXMAP
		deferred
		end

	local_term_string (a_code: STRING): STRING
			-- generate a string of the form "code|rubric|" if showing codes
			-- or else "rubric"
		do
			create Result.make_empty
			if attached {ARCHETYPE_TERM} flat_ontology.definition_for_code (language, a_code) as ont_term then
				if show_codes then
					Result.append (a_code + "|" + ont_term.text + "|")
				else
					Result.append (ont_term.text)
				end
			else
				Result.append (a_code)
			end
		end

	term_string (a_terminology_id, a_code: STRING): STRING
			-- generate a string of the form "[code|rubric|]" if in showing codes,
			-- or else "rubric"
		local
			a_term: DV_CODED_TEXT
		do
			create Result.make_empty
			if a_terminology_id.is_equal (Local_terminology_id) then
				Result := local_term_string (a_code)
			elseif ts.has_terminology (a_terminology_id) then
				if ts.terminology (a_terminology_id).has_concept_id (a_code, language) then
					a_term := ts.terminology (a_terminology_id).term (a_code, language)
				else
					a_term := ts.terminology (a_terminology_id).term (a_code, Default_language)
				end
				if show_codes then
					Result.append (a_term.as_string)
				else
					Result.append (a_term.value)
				end
			else
				Result.append (a_code)
			end
		end

	c_code_phrase_str (a_ccp: C_CODE_PHRASE): STRING
		do
			create Result.make_empty
			across a_ccp.code_list as codes_csr loop
				Result.append_string (term_string (a_ccp.terminology_id.value, codes_csr.item))
				if a_ccp.has_assumed_value and then a_ccp.assumed_value.code_string.is_equal (codes_csr.item) then
					Result.append (" (" + get_text ("assumed_text") + ")")
				end
				if codes_csr.cursor_index < a_ccp.code_list.count then
					Result.append_string ("%N")
				end
			end
		end

	node_specialisation_status: INTEGER
			-- specialisation status of `arch_node'
		deferred
		end

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
--| The Original Code is arch_ed_context.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
