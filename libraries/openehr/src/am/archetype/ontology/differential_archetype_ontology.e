note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype ontology section class for differential, i.e. source form archetypes. The routines in this class
				 correspond to the needs of creating and editing an archetype, i.e. modifying the contents.
				 ]"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"


class DIFFERENTIAL_ARCHETYPE_ONTOLOGY

inherit
	ARCHETYPE_ONTOLOGY

create
	make, make_empty, make_from_flat

feature -- Initialisation

	make_empty (an_original_lang: STRING; at_specialisation_depth: INTEGER)
			-- make an empty ontology at specified specialisation depth
		require
			Original_language_valid: not an_original_lang.is_empty
			Valid_specialisation_depth: at_specialisation_depth >= 0
		do
			make (an_original_lang, new_concept_code_at_level (at_specialisation_depth))
			add_language (an_original_lang)
			initialise_term_definitions (create {ARCHETYPE_TERM}.make (concept_code))
		ensure
			Primary_language_set: original_language = an_original_lang
			Specialisation_level_set: specialisation_depth = at_specialisation_depth
			Concept_code_set: is_valid_concept_code(concept_code) and specialisation_depth_from_code (concept_code) = at_specialisation_depth
			Concept_code_in_terms: has_term_code (concept_code)
			Concept_items_not_empty: not term_definition (original_language, concept_code).text.is_empty
		end

	make_from_flat (a_flat: FLAT_ARCHETYPE_ONTOLOGY)
			-- create from a flat ontology
		local
			a_flat_copy: FLAT_ARCHETYPE_ONTOLOGY
		do
			a_flat_copy := a_flat.deep_twin
			a_flat_copy.remove_inherited_codes

			concept_code := a_flat_copy.concept_code
			original_language := a_flat_copy.original_language

			term_definitions := a_flat_copy.term_definitions
			constraint_definitions := a_flat_copy.constraint_definitions

			term_codes := a_flat_copy.term_codes
			constraint_codes := a_flat_copy.constraint_codes

			term_bindings := a_flat_copy.term_bindings
			constraint_bindings := a_flat_copy.constraint_bindings
			highest_refined_code_index := a_flat_copy.highest_refined_code_index
		end

feature -- Modification

	add_language (a_language: STRING)
			-- add a new language to list of languages available
			-- No action if language already exists
		require
			Language_valid: not a_language.is_empty
		local
			term_defs_one_lang, constraint_defs_one_lang: detachable HASH_TABLE[ARCHETYPE_TERM, STRING]
		do
			if not term_definitions.has (a_language) then
				create term_defs_one_lang.make (0)
				term_definitions.put (term_defs_one_lang, a_language)
				if not constraint_definitions.is_empty then
					create constraint_defs_one_lang.make(0)
					constraint_definitions.put (constraint_defs_one_lang, a_language)
				end

				-- if not the primary language, add set of translation place-holder terms in this language
				if attached original_language and then not a_language.is_equal (original_language) then
					if attached term_definitions.item (original_language) as defs_for_lang then
						-- term definitions
						across defs_for_lang as defs_csr loop
							term_defs_one_lang.put (defs_csr.item.create_translated_term (original_language), defs_csr.item.code)
						end
					end

					-- do constraint definitions as well
					if attached constraint_defs_one_lang and then attached constraint_definitions.item (original_language) as defs_for_lang then
						across defs_for_lang as defs_csr loop
							constraint_defs_one_lang.put (defs_csr.item.create_translated_term (original_language), defs_csr.item.code)
						end
					end
				end
			end
		ensure
			Language_added: has_language (a_language)
		end

	initialise_term_definitions (a_term: ARCHETYPE_TERM)
			-- set concept of ontology from a term
		do
			term_codes.extend (a_term.code)
			term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make (0), original_language)
			term_definitions.item (original_language).put (a_term, a_term.code)
		ensure
			Term_definitions_populated: term_definitions.item (original_language).item (concept_code) = a_term
		end

feature -- Conversion

	to_flat: FLAT_ARCHETYPE_ONTOLOGY
			-- Create a flat version from this differential ontology.
		do
			create Result.make_from_differential (Current)
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
--| The Original Code is differential_archetype_ontology.e.
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
