note
	component:   "openEHR ADL Tools"
	description: "Phase 3 validation: validating performed on flattened archetype."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_3_VALIDATOR

inherit
	AOM_VALIDATOR
		redefine
			validate, target, initialise
		end

create
	initialise

feature {ADL15_ENGINE} -- Initialisation

	initialise (a_target_desc: like target_descriptor; an_rm_schema: BMM_SCHEMA)
			-- set target_descriptor
			-- initialise reporting variables
		do
			rm_schema := an_rm_schema
			target_descriptor := a_target_desc
			initialise_authored_resource (target_descriptor.flat_archetype)
		end

feature -- Access

	target: FLAT_ARCHETYPE
			-- flat archetype being validated

feature -- Status Report

	is_validation_candidate (ara: ARCH_CAT_ARCHETYPE): BOOLEAN
		do
			Result := attached ara.flat_archetype
		end

feature -- Validation

	validate
		do
			reset
			validate_definition_codes
			validate_ontology_languages
			validate_ontology_bindings
			validate_occurrences
			validate_internal_references
		end

feature {NONE} -- Implementation

	validate_ontology_languages
			-- Are all `term_codes' and `constraint_codes' found in all languages?
			-- For specialised archetypes, requires flat parent to be available
		local
			langs: ARRAYED_SET [STRING]
		do
			langs := ontology.languages_available
			across langs as langs_csr loop
				across ontology.term_codes as code_csr loop
					if not ontology.has_term_definition (langs_csr.item, code_csr.item) then
						add_error (ec_VONLC, <<code_csr.item, langs_csr.item>>)
					end
				end
				across ontology.constraint_codes as code_csr loop
					if not ontology.has_constraint_definition (langs_csr.item, code_csr.item) then
						add_error (ec_VONLC, <<code_csr.item, langs_csr.item>>)
					end
				end
			end
		end

	validate_definition_codes
			-- Check if all at- and ac-codes found in the definition node tree are in the ontology (including inherited items).
			-- Leave `passed' True if all found node_ids are defined in term_definitions, and term_definitions contains no extras.
			-- For specialised archetypes, requires flat parent to be available
		local
			arch_depth: INTEGER
			cp: TERMINOLOGY_CODE
		do
			arch_depth := target.specialisation_depth
			across target.id_atcodes_index as codes_csr loop
				if specialisation_depth_from_code (codes_csr.key) > arch_depth then
					add_error (ec_VONSD, <<codes_csr.key>>)
				elseif not ontology.has_term_code (codes_csr.key) then
					add_error (ec_VATDF, <<codes_csr.key>>)
				end
			end

			-- see if every term code used in any C_COMPLEX_OBJECT or TERMINOLOGY_CODE is in ontology
			across target.data_codes_index as codes_csr loop
				-- validate local codes for depth & presence in ontology
				if codes_csr.key.starts_with (Term_code_leader) then
					if specialisation_depth_from_code (codes_csr.key) > arch_depth then
						add_error (ec_VATCD, <<codes_csr.key, arch_depth.out>>)
					elseif not ontology.has_term_code (codes_csr.key) then
						add_error (ec_VATDF, <<codes_csr.key>>)
					end
				else
					create cp.make_from_string (codes_csr.key)
					if ts.has_terminology (cp.terminology_id) then
						if not ts.terminology (cp.terminology_id).has_concept_id (cp.code_string) then
							add_error (ec_VETDF, <<codes_csr.key, cp.terminology_id>>)
						end
					else
						add_warning (ec_WETDF, <<cp.as_string, cp.terminology_id>>)
					end
				end
			end

			-- check if all found constraint_codes are defined in constraint_definitions,
			across target.accodes_index as codes_csr loop
				if specialisation_depth_from_code (codes_csr.key) > arch_depth then
					add_error (ec_VATCD, <<codes_csr.key, arch_depth.out>>)
				elseif not ontology.has_constraint_code (codes_csr.key) then
					add_error (ec_VACDF, <<codes_csr.key>>)
				end
			end
		end

	validate_ontology_bindings
			-- Are all `term_bindings' valid, i.e.
			-- for atomic bindings:
			-- 		is every term mentioned in the term_definitions?
			-- for path bindings:
			-- 		does every path mentioned exist in flat archetype?
			--
			-- Are all `constraint_bindings' valid, i.e.
			-- for atomic bindings:
			-- 		is every term mentioned in the constraint_definitions?
			--
		do
			across ontology.term_bindings as bindings_csr loop
				across bindings_csr.item as bindings_for_lang_csr loop
					if not (is_valid_code (bindings_for_lang_csr.key) and then ontology.has_term_code (bindings_for_lang_csr.key) or else
						target.has_path (bindings_for_lang_csr.key))
					then
						add_error (ec_VOTBK, <<bindings_for_lang_csr.key>>)
					end
				end
			end
			across ontology.constraint_bindings as bindings_csr loop
				across bindings_csr.item as bindings_for_lang_csr loop
					if not (is_valid_code (bindings_for_lang_csr.key) and then ontology.has_constraint_code (bindings_for_lang_csr.key)) then
						add_error (ec_VOCBK, <<bindings_for_lang_csr.key>>)
					end
				end
			end
		end

	validate_occurrences
			-- validate occurrences under container attributes, in flat definition
		local
			def_it: C_ITERATOR
		do
			create def_it.make (target.definition)
			def_it.do_all (agent flat_node_enter, agent flat_node_exit)
		end

	validate_internal_references
			-- Validate items in `found_internal_references'.
			-- For specialised archetypes, requires flat parent to be available
		do
			across target.use_node_index as use_refs_csr loop
				if not target.definition.has_path (use_refs_csr.key) then
					add_error (ec_VUNP, <<use_refs_csr.key>>)
				end
			end
		end

feature {NONE} -- Implementation

	flat_node_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				if attached ca.cardinality and then not ca.cardinality.interval.upper_unbounded then
					if ca.occurrences_lower_sum > ca.cardinality.interval.upper then
						add_error (ec_VACMCL, <<ca.path, ca.occurrences_lower_sum.out, ca.cardinality.interval.upper.out>>)
					elseif ca.minimum_child_count > ca.cardinality.interval.upper then
						add_error (ec_VACMCO, <<ca.path, ca.minimum_child_count.out, ca.cardinality.interval.upper.out>>)
					end
				end
			end
		end

	flat_node_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

end


