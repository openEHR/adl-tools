note
	component:   "openEHR ADL Tools"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class FLAT_ARCHETYPE_TERMINOLOGY

inherit
	ARCHETYPE_TERMINOLOGY

create
	make, make_from_differential

feature -- Initialisation

	make_from_differential (a_diff: DIFFERENTIAL_ARCHETYPE_TERMINOLOGY)
			-- populate from a differential ontology. Finalisation will involve
			-- merging of codes from parent archetype ontologies if this ontology
			-- belongs to a specialised archetype
		local
			a_diff_copy: DIFFERENTIAL_ARCHETYPE_TERMINOLOGY
		do
			a_diff_copy := a_diff.deep_twin

			concept_code := a_diff_copy.concept_code
			original_language := a_diff_copy.original_language

			id_definitions := a_diff_copy.id_definitions
			term_definitions := a_diff_copy.term_definitions
			constraint_definitions := a_diff_copy.constraint_definitions

			term_bindings := a_diff_copy.term_bindings
			constraint_bindings := a_diff_copy.constraint_bindings

			sync_stored_properties
		end

feature -- Modification

	merge (other: FLAT_ARCHETYPE_TERMINOLOGY)
			-- append all the codes from the other terminology to this one; used to create the
			-- terminology for flat-form archetypes. Only languages that exist in the current
			-- terminology are merged from `other'
		require
			Other_valid: semantically_conforms_to (other)
		local
			a_lang: STRING
		do
			-- id definitions
			across other.id_definitions as id_defs_csr loop
				a_lang := id_defs_csr.key
				if has_language (a_lang) then
					if not id_definitions.has (a_lang) then
						id_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_lang)
					end
					across id_defs_csr.item as lang_terms_csr loop
						if has_id_code (lang_terms_csr.key) then
							replace_definition (a_lang, lang_terms_csr.item.deep_twin, False)
						else
							put_new_definition (a_lang, lang_terms_csr.item.deep_twin)
						end
					end
				end
			end

			-- term definitions
			across other.term_definitions as term_defs_csr loop
				a_lang := term_defs_csr.key
				if has_language (a_lang) then
					if not term_definitions.has (a_lang) then
						term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_lang)
					end
					across term_defs_csr.item as lang_terms_csr loop
						if has_term_code (lang_terms_csr.key) then
							replace_definition (a_lang, lang_terms_csr.item.deep_twin, False)
						else
							put_new_definition (a_lang, lang_terms_csr.item.deep_twin)
						end
					end
				end
			end

			-- constraint definitions
			across other.constraint_definitions as constraint_defs_csr loop
				a_lang := constraint_defs_csr.key
				if has_language (a_lang) then
					if not constraint_definitions.has (a_lang) then
						constraint_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_lang)
					end
					across constraint_defs_csr.item as lang_terms_csr loop
						if has_constraint_code (lang_terms_csr.key) then
							replace_definition (a_lang, lang_terms_csr.item.deep_twin, False)
						else
							put_new_definition (a_lang, lang_terms_csr.item.deep_twin)
						end
					end
				end
			end

			-- terminology bindings; first add the bindings to terminologies that are not there at all
			across other.term_bindings as bindings_csr loop
				across bindings_csr.item as bindings_list_csr loop
					put_term_binding (bindings_list_csr.item.deep_twin, bindings_list_csr.key)
				end
			end

			-- constraint bindings; first add the bindings to terminologies that are not there at all
			across other.constraint_bindings as bindings_csr loop
				across bindings_csr.item as bindings_list_csr loop
					put_constraint_binding (bindings_list_csr.item.deep_twin, bindings_csr.key, bindings_list_csr.key)
				end
			end
		ensure
			-- Terminologies_merged: terminologies_available.is_superset (other.terminologies_available)
		end

feature -- Factory

	to_differential: DIFFERENTIAL_ARCHETYPE_TERMINOLOGY
			-- Create a differential version from this flat ontology.
		do
			create Result.make_from_flat (Current)
		end

feature {ARCHETYPE_TERMINOLOGY} -- Implementation

	remove_inherited_codes
			-- remove all at- and ac- codes inherited from ancestor archetypes
		local
			rm_id_codes, rm_term_codes, rm_constraint_codes: ARRAYED_LIST[STRING]
		do
			create rm_id_codes.make(0)
			create rm_term_codes.make(0)
			create rm_constraint_codes.make(0)

			across id_codes as id_codes_csr loop
				if specialisation_depth_from_code (id_codes_csr.item) /= specialisation_depth then
					rm_id_codes.extend (id_codes_csr.item)
				end
			end
			across term_codes as term_codes_csr loop
				if specialisation_depth_from_code (term_codes_csr.item) /= specialisation_depth then
					rm_term_codes.extend (term_codes_csr.item)
				end
			end
			across constraint_codes as constraint_codes_csr loop
				if specialisation_depth_from_code (constraint_codes_csr.item) /= specialisation_depth then
					rm_constraint_codes.extend (constraint_codes_csr.item)
				end
			end

			across rm_id_codes as rm_id_codes_csr loop
				remove_definition (rm_id_codes_csr.item)
			end
			across rm_term_codes as rm_term_codes_csr loop
				remove_definition (rm_term_codes_csr.item)
			end
			across rm_constraint_codes as rm_constraint_codes_csr loop
				remove_definition (rm_constraint_codes_csr.item)
			end
		end

end


