note
	component:   "openEHR ADL Tools"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

			term_definitions := a_diff_copy.term_definitions

			term_bindings := a_diff_copy.term_bindings

			value_sets := a_diff_copy.value_sets

			sync_stored_properties
		ensure
			Specialisation_depth_set: specialisation_depth = a_diff.specialisation_depth
		end

feature {ARCHETYPE_FLATTENER} -- Modification

	merge (other: DIFFERENTIAL_ARCHETYPE_TERMINOLOGY)
			-- merge other's terminology, doing the following:
			--	* replace term_definitions, bindings & value sets with other's, if they are overrides
			-- 	* add new term definitions, bindings and value sets if they are new in other
		require
			Other_valid: semantically_conforms_to (other)
		do
			-- concept code
			concept_code := other.concept_code.twin

			-- term definitions
			across other.term_codes as other_codes_csr loop
				merge_specialised_term_definition (other.term_definitions_for_code (other_codes_csr.item).deep_twin, other_codes_csr.item)
			end

			-- terminology bindings; these are sparse and don't work like term defnition translations so
			-- have to be done individually
			across other.term_bindings as other_bindings_for_terminology_csr loop
				across other_bindings_for_terminology_csr.item as other_bindings_csr loop
					merge_specialised_term_binding (other_bindings_csr.item.twin, other_bindings_for_terminology_csr.key, other_bindings_csr.key)
				end
			end

			-- value sets: here we have to account for replacement of value sets in parent by child
			across other.value_sets as value_sets_csr loop
				merge_specialised_value_set (value_sets_csr.item.deep_twin)
			end

			sync_stored_properties
		ensure
			Specialisation_depth_set: specialisation_depth = other.specialisation_depth
		end

feature {FLAT_ARCHETYPE} -- Modification

	reduce_languages_to (a_langs: ARRAYED_SET [STRING])
			-- remove any languages not in `lang_set'
		do
			across languages_available as langs_csr loop
				if not a_langs.has (langs_csr.item) then
					term_definitions.remove (langs_csr.item)
				end
			end
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
			across value_codes as term_codes_csr loop
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

feature {NONE} -- Implementation

	merge_specialised_term_definition (a_child_term_defs: HASH_TABLE [ARCHETYPE_TERM, STRING]; a_child_code: STRING)
			-- put `a_child_term_defs', which are term definitions keyed by language from a specialised child terminology
			-- into this flat terminology, if necessary, removing any parent version for a parent code of `a_child_code'
		require
			not has_code (a_child_code)
		local
			code_in_parent: STRING
			spec_depth: INTEGER
		do
			-- determine for parent code that might exist in this flat terminology
			if is_refined_code (a_child_code) then
				code_in_parent := a_child_code
				from spec_depth := specialisation_depth until spec_depth = 0 or has_code (code_in_parent) loop
					spec_depth := spec_depth - 1
					code_in_parent := code_at_level (a_child_code, spec_depth)
				end

				if has_code (code_in_parent) then
					remove_definition (code_in_parent)
				end
			end
			put_definition_and_translations (a_child_term_defs, a_child_code)
		end

	merge_specialised_term_binding (a_binding: URI; a_terminology_id, a_child_code: STRING)
			-- merge the binding a_code/a_binding into this terminology, if necessary
			-- removing any existing binding to a parent code of `a_child_code'
		require
			not has_term_binding (a_terminology_id, a_child_code)
		local
			code_in_parent: STRING
			spec_depth: INTEGER
		do
			-- determine for parent code that might exist in this flat terminology
			if is_refined_code (a_child_code) then
				code_in_parent := a_child_code
				from spec_depth := specialisation_depth until spec_depth = 0 or has_term_binding (a_terminology_id, code_in_parent) loop
					spec_depth := spec_depth - 1
					code_in_parent := code_at_level (a_child_code, spec_depth)
				end

				if has_term_binding (a_terminology_id, code_in_parent) then
					remove_term_binding (code_in_parent, a_terminology_id)
				end
			end
			put_term_binding (a_binding, a_terminology_id, a_child_code)
		end

	merge_specialised_value_set (a_value_set: VALUE_SET_RELATION)
			-- merge `a_value_set' into this terminology, if necessary removing any existing
			-- value set bound to a parent code of ac-code a_value_set.id
		local
			code_in_parent: STRING
			spec_depth: INTEGER
		do
			-- determine for parent code that might exist in this flat terminology
			if is_refined_code (a_value_set.id) then
				code_in_parent := a_value_set.id
				from spec_depth := specialisation_depth until spec_depth = 0 or value_sets.has (code_in_parent) loop
					spec_depth := spec_depth - 1
					code_in_parent := code_at_level (a_value_set.id, spec_depth)
				end

				if value_sets.has (code_in_parent) then
					value_sets.remove (code_in_parent)
				end
			end
			value_sets.put (a_value_set, a_value_set.id)
		end

end


