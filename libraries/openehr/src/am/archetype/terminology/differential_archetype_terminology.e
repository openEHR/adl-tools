note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype ontology section class for differential, i.e. source form archetypes. The routines in this class
				 correspond to the needs of creating and editing an archetype, i.e. modifying the contents.
				 ]"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DIFFERENTIAL_ARCHETYPE_TERMINOLOGY

inherit
	ARCHETYPE_TERMINOLOGY

create
	make, make_empty, make_from_flat

feature -- Initialisation

	make_empty (an_original_lang: STRING; at_specialisation_depth: INTEGER)
			-- make an empty terminology at specified specialisation depth
		require
			Original_language_valid: not an_original_lang.is_empty
			Valid_specialisation_depth: at_specialisation_depth >= 0
		do
			make (an_original_lang, new_root_id_code_at_level (at_specialisation_depth))
			add_language (an_original_lang)
			initialise_term_definitions (create {ARCHETYPE_TERM}.make (concept_code))
		ensure
			Primary_language_set: original_language = an_original_lang
			Specialisation_level_set: specialisation_depth = at_specialisation_depth
			Concept_code_set: is_valid_root_id_code (concept_code) and specialisation_depth_from_code (concept_code) = at_specialisation_depth
			Concept_code_in_terms: has_id_code (concept_code)
			Concept_items_not_empty: not term_definition (original_language, concept_code).text.is_empty
		end

	make_from_flat (a_flat: FLAT_ARCHETYPE_TERMINOLOGY)
			-- create from a flat terminology
		local
			a_flat_copy: FLAT_ARCHETYPE_TERMINOLOGY
		do
			a_flat_copy := a_flat.deep_twin
			a_flat_copy.remove_inherited_codes

			concept_code := a_flat_copy.concept_code
			original_language := a_flat_copy.original_language

			term_definitions := a_flat_copy.term_definitions
			term_bindings := a_flat_copy.term_bindings

			value_sets := a_flat_copy.value_sets

			sync_stored_properties
		end

feature -- Modification

	add_language (a_language: STRING)
			-- add a new language to list of languages available
			-- No action if language already exists
		require
			Language_valid: not a_language.is_empty
		local
			term_defs_one_lang: detachable HASH_TABLE [ARCHETYPE_TERM, STRING]
		do
			if not term_definitions.has (a_language) then
				create term_defs_one_lang.make (0)
				term_definitions.put (term_defs_one_lang, a_language)

				-- if not the primary language, add set of translation place-holder terms in this language
				if attached original_language and then not a_language.is_equal (original_language) then
					if attached term_definitions.item (original_language) as defs_for_lang then
						across defs_for_lang as defs_csr loop
							term_defs_one_lang.put (defs_csr.item.create_translated_term (original_language), defs_csr.item.code)
						end
					end
				end
			end
		ensure
			Language_added: has_language (a_language)
		end

	initialise_term_definitions (a_term: ARCHETYPE_TERM)
			-- set concept of terminology from a term
		require
			Valid_concept_term: is_valid_root_id_code (a_term.code)
		do
			term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make (0), original_language)
			term_definitions.item (original_language).put (a_term, a_term.code)
		ensure
			Term_definitions_populated: term_definitions.item (original_language).item (concept_code) = a_term
		end

feature -- Conversion

	to_flat: FLAT_ARCHETYPE_TERMINOLOGY
			-- Create a flat version from this differential ontology.
		do
			create Result.make_from_differential (Current)
		end

end


