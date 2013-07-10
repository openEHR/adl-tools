note
	component:   "openEHR ADL Tools"
	description: "[
				 Phase 2 validation: validate archetype with respect to flat parent archetype, in the case 
				 of specialised archetypes.
		         ]"
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_PHASE_2_VALIDATOR

inherit
	ARCHETYPE_VALIDATOR
		redefine
			validate, target
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

create
	initialise

feature -- Status Report

	is_validation_candidate (ara: ARCH_CAT_ARCHETYPE): BOOLEAN
		do
			Result := attached ara.differential_archetype
		end

feature -- Validation

	validate
			-- validate description section
		do
			reset

			-- set flat_parent
			if target_descriptor.is_specialised then
				flat_parent := target_descriptor.specialisation_parent.flat_archetype
 			end

 			-- structure validation
			validate_structure

			-- reference model validation - needed for all archetypes, top-level and
			-- specialised, since specialised archetypes can contain new nodes that need to be
			-- validated all the way through to the RM
			-- FIXME: currently specialised archetypes are not RM_validated because the RM-validation
			-- logic needs to be fixed for them; to see how, change the following line back to just
			-- 'if passed' and see the result
			if passed then -- and not target.is_specialised then
				validate_reference_model
			end

			-- validation requiring the archetype xref tables
			if passed then
				validate_definition_codes
			end

			-- validation of ontology requiring flat parent
			if passed then
				validate_ontology_languages
				validate_ontology_bindings
			end

			-- validation requiring valid specialisation parent
			if passed then
				if target.is_specialised then
					target.build_rolled_up_status
					validate_specialised_basics
					validate_specialised_definition
				end
				validate_internal_references
				validate_assertions
				validate_annotations
			end
		end

feature {NONE} -- Implementation

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being validated

	flat_parent: detachable FLAT_ARCHETYPE
			-- flat version of parent archetype, if target is specialised

	validate_ontology_languages
			-- Are all `term_codes' and `constraint_codes' found in all languages?
			-- For specialised archetypes, requires flat parent to be available
		local
			langs: ARRAYED_SET [STRING]
		do
			langs := ontology.languages_available
			across langs as langs_csr loop
				across ontology.term_codes as code_csr loop
					if not (ontology.has_term_definition (langs_csr.item, code_csr.item) or
						target.is_specialised and then flat_parent.ontology.has_term_definition (langs_csr.item, code_csr.item))
					then
						add_error (ec_VONLC, <<code_csr.item, langs_csr.item>>)
					end
				end
				across ontology.constraint_codes as code_csr loop
					if not (ontology.has_constraint_definition (langs_csr.item, code_csr.item) or
						target.is_specialised and then flat_parent.ontology.has_constraint_definition (langs_csr.item, code_csr.item))
					then
						add_error (ec_VONLC, <<code_csr.item, langs_csr.item>>)
					end
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
					if not ((is_valid_code (bindings_for_lang_csr.key) and then ontology.has_term_code (bindings_for_lang_csr.key)) or
						(not target.is_specialised and then target.has_path (bindings_for_lang_csr.key)) or
						(target.is_specialised and then (flat_parent.ontology.has_term_code (bindings_for_lang_csr.key) or target.has_path (bindings_for_lang_csr.key))))
					then
						add_error (ec_VOTBK, <<bindings_for_lang_csr.key>>)
					end
				end
			end
			across ontology.constraint_bindings as bindings_csr loop
				across bindings_csr.item as bindings_for_lang_csr loop
					if not (is_valid_code (bindings_for_lang_csr.key) and then ontology.has_constraint_code (bindings_for_lang_csr.key) or
						target.is_specialised and flat_parent.ontology.has_constraint_code (bindings_for_lang_csr.key))
					then
						add_error (ec_VOCBK, <<bindings_for_lang_csr.key>>)
					end
				end
			end
		end

	validate_definition_codes
			-- Check if all at- and ac-codes found in the definition node tree are in the ontology (including inherited items).
			-- Leave `passed' True if all found node_ids are defined in term_definitions, and term_definitions contains no extras.
			-- For specialised archetypes, requires flat parent to be available
		local
			depth, code_depth: INTEGER
			cp: CODE_PHRASE
		do
			depth := ontology.specialisation_depth

			across target.id_atcodes_index as codes_csr loop
				code_depth := specialisation_depth_from_code (codes_csr.key)
				if code_depth > depth then
					add_error (ec_VONSD, <<codes_csr.key>>)
				elseif code_depth < depth then
					if not flat_parent.ontology.has_term_code (codes_csr.key) then
						add_error (ec_VATDF1, <<codes_csr.key>>)
					end
				elseif not ontology.has_term_code (codes_csr.key) then
					add_error (ec_VATDF2, <<codes_csr.key>>)
				end
			end

			-- see if every term code used in an ORDINAL or a CODE_PHRASE is in ontology
			across target.data_codes_index as codes_csr loop
				-- validate local codes for depth & presence in ontology
				if codes_csr.key.starts_with (Term_code_leader) then
					code_depth := specialisation_depth_from_code (codes_csr.key)
					if code_depth > depth then
						add_error (ec_VATCD, <<codes_csr.key, depth.out>>)
					elseif code_depth < depth then
						if not flat_parent.ontology.has_term_code (codes_csr.key) then
							add_error (ec_VATDF1, <<codes_csr.key>>)
						end
					elseif not ontology.has_term_code (codes_csr.key) then
						add_error (ec_VATDF2, <<codes_csr.key>>)
					end
				else
					create cp.make_from_string (codes_csr.key)
					if ts.has_terminology (cp.terminology_id.value) then
						if not ts.terminology (cp.terminology_id.value).has_concept (cp.code_string) then
							add_error (ec_VETDF, <<codes_csr.key, cp.terminology_id.value>>)
						end
					else
						add_warning (ec_WETDF, <<cp.as_string, cp.terminology_id.value>>)
					end
				end
			end

			-- check if all found constraint_codes are defined in constraint_definitions,
			across target.accodes_index as codes_csr loop
				code_depth := specialisation_depth_from_code (codes_csr.key)
				if code_depth > depth then
					add_error (ec_VATCD, <<codes_csr.key, depth.out>>)
				elseif code_depth < depth then
					if not flat_parent.ontology.has_constraint_code (codes_csr.key) then
						add_error (ec_VACDF1, <<codes_csr.key>>)
					end
				elseif not ontology.has_constraint_code (codes_csr.key) then
					add_error (ec_VACDF2, <<codes_csr.key>>)
				end
			end
		end

	validate_internal_references
			-- Validate items in `found_internal_references'.
			-- For specialised archetypes, requires flat parent to be available
		do
			across target.use_node_index as use_refs_csr loop
				if target.definition.has_path (use_refs_csr.key) then
					convert_use_ref_paths (use_refs_csr.item, use_refs_csr.key, target)
				elseif target.is_specialised and flat_parent.definition.has_path (use_refs_csr.key) then
					check attached flat_parent as fp then
						convert_use_ref_paths (use_refs_csr.item, use_refs_csr.key, fp)
					end
				else
					add_error (ec_VUNP, <<use_refs_csr.key>>)
				end
			end
		end

	validate_structure
			-- validate definition structure of archetype
		local
			def_it: C_ITERATOR
		do
			invalid_types.wipe_out
			create def_it.make (target.definition)
			def_it.do_until_surface (agent structure_validate_node,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := True end)
		end

	structure_validate_node (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				if not target.is_specialised and then ca.has_differential_path then
					add_error (ec_VDIFV, <<ca.path>>)
				end
			end
		end

	validate_assertions
			-- validate the invariants if any, which entails checking that all path references are valid against
			-- the flat archetype if specialised
			-- update ASSERTION EXPR_ITEM_LEAF object reference nodes with proper type names
			-- obtained from the AOM objects pointed to
		local
			arch_rm_type_name, ref_rm_type_name, arch_path: detachable STRING
			tail_path: STRING
			bmm_class: BMM_CLASS_DEFINITION
			og_tail_path: OG_PATH
			object_at_matching_path: detachable C_OBJECT
		do
			if target.has_invariants then
				across target.invariants_index as ref_path_csr loop
					-- get a matching path from archetype - has to be there, either exact or partial
					ref_rm_type_name := Void
					object_at_matching_path := Void
					if attached target.matching_path (ref_path_csr.key) as p then
						arch_path := p
						object_at_matching_path := target.c_object_at_path (arch_path)
					elseif attached flat_parent and then attached flat_parent.matching_path (ref_path_csr.key) as p then
						arch_path := p
						object_at_matching_path := flat_parent.c_object_at_path (arch_path)
					end
					if attached object_at_matching_path as omp and attached arch_path as ap then
						arch_rm_type_name := omp.rm_type_name
						-- if it was a partial match, we have to obtain the real RM type by going into the RM
						if ap.count < ref_path_csr.key.count then
							tail_path := ref_path_csr.key.substring (ap.count+1, ref_path_csr.key.count)
							bmm_class := rm_schema.class_definition (arch_rm_type_name)
							create og_tail_path.make_from_string (tail_path)
							og_tail_path.start
							if bmm_class.has_property_path (og_tail_path) then
								check attached bmm_class.property_definition_at_path (og_tail_path) as bmm_prop then
									ref_rm_type_name := bmm_prop.type.root_class
								end
							else
								add_error (ec_VRRLPRM, <<ref_path_csr.key, tail_path, arch_rm_type_name>>)
							end
						else
							ref_rm_type_name := arch_rm_type_name
						end
					else
						add_error (ec_VRRLPAR, <<ref_path_csr.key>>)
					end
					if attached ref_rm_type_name as rtn then
						across ref_path_csr.item as expr_leaf_csr loop
							expr_leaf_csr.item.update_type (rtn)
						end
					end
				end
			end
		end

	validate_annotations
			-- for each language, ensure that annotations are proper translations of each other (if present)
			-- For specialised archetypes, requires flat parent to be available
		local
			ann_path: STRING
			apa: ARCHETYPE_PATH_ANALYSER
		do
			if target.has_annotations then
				across target.annotations.items as annots_csr loop
					across annots_csr.item.items as annots_for_lang_csr loop
						ann_path := annots_for_lang_csr.key
						create apa.make_from_string (ann_path)

						-- firstly see if annotation path is valid
						if apa.is_archetype_path then
							if not (target.has_path (ann_path) or else (target.is_specialised and then flat_parent.has_path (ann_path))) then
								add_error (ec_VRANP1, <<annots_csr.key, ann_path>>)
							end
						elseif not rm_schema.has_property_path (target.definition.rm_type_name, ann_path) then
							add_error (ec_VRANP2, <<annots_csr.key, ann_path>>)
						end

						-- FIXME: now we should do some other checks to see if contents are of same structure as annotations in other languages
					end
				end
			end
		end

	validate_specialised_basics
			-- make sure specialised archetype basic relationship to flat parent is valid
		require
			Target_specialised: target.is_specialised
		do
			if not target.languages_available.is_subset (flat_parent.languages_available) then
				add_error (ec_VALC, <<target.languages_available_out, flat_parent.languages_available_out>>)
			end
		end

	validate_specialised_definition
			-- validate definition of specialised archetype against flat parent
		require
			Target_specialised: target.is_specialised
		local
			def_it: C_ITERATOR
		do
			parent_slot_id_index := target_descriptor.specialisation_parent.slot_id_index
			create def_it.make (target.definition)
			def_it.do_until_surface (agent specialised_node_validate, agent specialised_node_validate_test)
		end

	parent_slot_id_index: HASH_TABLE [ARRAYED_SET[STRING], STRING]
		attribute
			create Result.make (0)
		end

	specialised_node_validate (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- validate nodes in differential specialised archetype
			-- SIDE-EFFECT: sets is_path_compressible markers on child archetype nodes
		local
			co_parent_flat: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			ca_path_in_flat: STRING
			ca_parent_flat: C_ATTRIBUTE
			cref_conformance_ok: BOOLEAN
		do
			if attached {C_ATTRIBUTE} a_c_node as ca_child_diff then
				create apa.make_from_string (a_c_node.path)
				ca_path_in_flat := apa.path_at_level (flat_parent.specialisation_depth)
				if flat_parent.definition.has_attribute_path (ca_path_in_flat) then
					check attached flat_parent.definition.c_attribute_at_path (ca_path_in_flat) as ca then
						ca_parent_flat := ca
					end
				else -- must be due to an internal ref; look in full attr_path_map
					check attached flat_parent.c_attr_at_path (ca_path_in_flat) as ca then
						ca_parent_flat := ca
					end
				end

				if not ca_child_diff.node_conforms_to (ca_parent_flat, rm_schema) then
					if ca_child_diff.is_single and not ca_parent_flat.is_single then
						add_error (ec_VSAM1, <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.archetype_view_language, True)>>)

					elseif not ca_child_diff.is_single and ca_parent_flat.is_single then
						add_error (ec_VSAM2, <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.archetype_view_language, True)>>)

					else
						if not ca_child_diff.existence_conforms_to (ca_parent_flat) then
							check attached ca_child_diff.existence as ccd_ex and then attached ca_parent_flat.existence as cpf_ex then
								if validation_strict or else not ca_child_diff.existence_matches (ca_parent_flat) then
									add_error (ec_VSANCE, <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.archetype_view_language, True),
										ccd_ex.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.archetype_view_language, True),
										cpf_ex.as_string>>)
								else
									add_warning (ec_VSANCE, <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.archetype_view_language, True),
										ccd_ex.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.archetype_view_language, True),
										cpf_ex.as_string>>)
									ca_child_diff.remove_existence
									if ca_child_diff.parent.is_path_compressible then
debug ("validate")
	io.put_string (" (setting is_path_compressible) %N")
end
										ca_child_diff.set_is_path_compressible
									end
								end
							end
						end

						if not ca_child_diff.cardinality_conforms_to (ca_parent_flat) then
							check attached ca_child_diff.cardinality as ccd_card and then attached ca_parent_flat.cardinality as cpf_card then
								if validation_strict or else not ca_child_diff.cardinality_matches (ca_parent_flat) then
									add_error (ec_VSANCC, <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.archetype_view_language, True),
										ccd_card.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.archetype_view_language, True),
										cpf_card.as_string>>)
								else
									add_warning (ec_VSANCC, <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.archetype_view_language, True),
										ccd_card.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.archetype_view_language, True),
										cpf_card.as_string>>)
									ca_child_diff.remove_cardinality
									if ca_child_diff.parent.is_path_compressible then
debug ("validate")
	io.put_string (" (setting is_path_compressible) %N")
end
										ca_child_diff.set_is_path_compressible
									end
								end
							end
						end
					end

				elseif ca_child_diff.node_congruent_to (ca_parent_flat, rm_schema) and ca_child_diff.parent.is_path_compressible then
debug ("validate")
	io.put_string (">>>>> validate: C_ATTRIBUTE in child at " +
	ca_child_diff.path + " CONGRUENT to parent node " +
	ca_parent_flat.path + " (setting is_path_compressible) %N")
end
					ca_child_diff.set_is_path_compressible
				end

			-- deal with C_ARCHETYPE_ROOT (slot filler) inheriting from ARCHETYPE_SLOT
			elseif attached {C_ARCHETYPE_ROOT} a_c_node as car then
				create apa.make_from_string (car.slot_path)
				if attached {ARCHETYPE_SLOT} flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth)) as a_slot then
					if parent_slot_id_index.has (a_slot.path) then
						if not archetype_id_matches_slot (car.archetype_id, a_slot) then -- doesn't even match the slot definition
							add_error (ec_VARXS, <<ontology.physical_to_logical_path (car.path, target_descriptor.archetype_view_language, True), car.archetype_id>>)

						elseif not parent_slot_id_index.item (a_slot.path).has (car.archetype_id) then -- matches def, but not found in actual list from current repo
							add_error (ec_VARXR, <<ontology.physical_to_logical_path (car.path, target_descriptor.archetype_view_language, True), car.archetype_id>>)

						elseif not car.occurrences_conforms_to (a_slot) then
							if attached car.occurrences as occ and then attached a_slot.occurrences as par_flat_occ and then occ.equal_interval (par_flat_occ) then
								if validation_strict then
									add_error (ec_VSONCO, <<ontology.physical_to_logical_path (car.path, target_descriptor.archetype_view_language, True), car.occurrences_as_string,
										ontology.physical_to_logical_path (a_slot.path, target_descriptor.archetype_view_language, True), a_slot.occurrences.as_string>>)
								else
									add_warning (ec_VSONCO, <<ontology.physical_to_logical_path (car.path, target_descriptor.archetype_view_language, True), car.occurrences_as_string,
										ontology.physical_to_logical_path (a_slot.path, target_descriptor.archetype_view_language, True), a_slot.occurrences.as_string>>)
									car.remove_occurrences
								end
							else
								add_error (ec_VSONCO, <<ontology.physical_to_logical_path (car.path, target_descriptor.archetype_view_language, True), car.occurrences_as_string,
									ontology.physical_to_logical_path (a_slot.path, target_descriptor.archetype_view_language, True), a_slot.occurrences.as_string>>)
							end
						end
					else
						add_error (ec_compiler_unexpected_error, <<"ARCHETYPE_VALIDATOR.specialised_node_validate location 3; descriptor does not have slot match list">>)
					end
				else
					add_error (ec_VARXV, <<ontology.physical_to_logical_path (car.path, target_descriptor.archetype_view_language, True)>>)
				end

			-- any kind of C_OBJECT other than a C_ARCHETYPE_ROOT
			elseif attached {C_OBJECT} a_c_node as co_child_diff then
				create apa.make_from_string (a_c_node.path)
				check attached flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth)) as cpf then
					co_parent_flat := cpf
				end

				-- The above won't work in the case where there are multiple alternative objects with no identifiers
				-- in the flat parent - so we need to do a search based on RM type matching to find the matching C_OBJECT in the flat
				-- NOTE: ADL wil be changed to disallow this case anyway, so now it needs to be detected and banned
				if not co_parent_flat.is_root and not co_child_diff.is_addressable and then co_parent_flat.parent.has_non_identified_alternatives then
					if co_parent_flat.parent.has_child_with_rm_type_name (co_child_diff.rm_type_name) then
						check attached co_parent_flat.parent.child_with_rm_type_name (co_child_diff.rm_type_name) as cpfc then
							co_parent_flat := cpfc
						end
					else
						-- TODO: (12930) find the closest ancestor node
						io.put_string ("ARCHETYPE_PHASE_2_VALIDATOR.specialised_node_validate: %
							%currently unhandled case - co_child_diff.rm_type_name needs to be matched with child at path " + co_parent_flat.parent.path + "%N")

						-- TODO: generate error in case where no type match can be found
					end
				end

debug ("validate")
	io.put_string (">>>>> validate: C_OBJECT in child at " + ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True))
end

				-- meta-type (i.e. AOM type) checking...
				-- this check sees if the node is a C_CODE_PHRASE redefinition of a CONSTRAINT_REF node, which is legal, since we say that
				-- C_CODE_PHRASE conforms to CONSTRAINT_REF. Its validity is not testable in any way (sole exception in AOM) - just warn
				if attached {CONSTRAINT_REF} co_parent_flat as ccr and then not attached {CONSTRAINT_REF} co_child_diff as ccr2 then
					if attached {C_CODE_PHRASE} co_child_diff as ccp then
						add_warning (ec_WCRC, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True)>>)
					else
						add_error (ec_VSCNR, <<co_parent_flat.generating_type, ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
							co_child_diff.generating_type, ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True)>>)
					end

				elseif attached {CONSTRAINT_REF} co_child_diff then
					-- this checks the case where the parent is not a C_CODE_PHRASE, but is a C_COMPLEX_OBJECT whose type is an
					-- AOM type mapping for C_CODE_PHRASE, or else an ancestor of such a type
					-- if not then -> VCRR
					if not attached {C_CODE_PHRASE} co_parent_flat then
						if aom_profiles_access.has_profile_for_rm_schema (rm_schema.schema_id) and then attached aom_profiles_access.profile_for_rm_schema (rm_schema.schema_id) as aom_p then
							if aom_p.aom_rm_type_mappings.has (bare_type_name(({CODE_PHRASE}).name)) and then attached aom_p.aom_rm_type_mappings.item (bare_type_name(({CODE_PHRASE}).name)) as aom_rm_tm then
								if aom_rm_tm.target_class_name.same_string (co_parent_flat.rm_type_name) or else rm_schema.class_definition (aom_rm_tm.target_class_name).has_ancestor (co_parent_flat.rm_type_name) then
									cref_conformance_ok := True
								end
							end
						end
						if not cref_conformance_ok then
							add_error (ec_VCRR, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
								co_parent_flat.rm_type_name, ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True)>>)
						end
					end

				else
					-- if the child is a redefine of a use_node (internal ref), then we have to do the comparison to the use_node target - so
					-- we re-assign co_parent_flat to point to the target structure; unless they both are use_nodes, in which case leave them as is
					if attached {ARCHETYPE_INTERNAL_REF} co_parent_flat as air_p and not attached {ARCHETYPE_INTERNAL_REF} co_child_diff as air_c then
						check attached flat_parent.c_object_at_path (air_p.path) as cpf then
							co_parent_flat := cpf
						end
						if dynamic_type (co_child_diff) /= dynamic_type (co_parent_flat) then
							add_error (ec_VSUNT, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
								co_child_diff.generating_type, ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
								co_parent_flat.generating_type>>)
						end
					end

					-- special case: C_DOMAIN_TYPE replacing a C_COMPLEX_OBJECT
					if attached {C_COMPLEX_OBJECT} co_parent_flat and attached {C_DOMAIN_TYPE} co_child_diff then
						if not rm_schema.type_name_conforms_to (co_child_diff.rm_type_name, co_parent_flat.rm_type_name) then
							add_error (ec_VSONCT, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
								co_child_diff.rm_type_name,
								ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
								co_parent_flat.rm_type_name>>)
						end

					-- by here the AOM meta-types must be the same
					elseif dynamic_type (co_child_diff) /= dynamic_type (co_parent_flat) then
						add_error (ec_VSONT, <<co_child_diff.rm_type_name, ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
							co_child_diff.generating_type, co_parent_flat.rm_type_name,
							ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
							co_parent_flat.generating_type>>)

					-- they should also be conformant as defined by the node_conforms_to() function
					elseif not co_child_diff.node_conforms_to (co_parent_flat, rm_schema) then

						-- RM type non-conformance was the reason
						if not co_child_diff.rm_type_conforms_to (co_parent_flat, rm_schema) then
							add_error (ec_VSONCT, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
								co_child_diff.rm_type_name,
								ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
								co_parent_flat.rm_type_name>>)

						-- occurrences non-conformance was the reason
						elseif not co_child_diff.occurrences_conforms_to (co_parent_flat) then
							-- if the occurrences interval is just a copy of the one in the flat, treat it as an error only if
							-- compiling strict, else remove the duplicate and just warn
							if attached co_child_diff.occurrences as child_occ and then attached co_parent_flat.occurrences as par_flat_occ and then child_occ.equal_interval (par_flat_occ) then
								if validation_strict then
									add_error (ec_VSONCO, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
										co_child_diff.occurrences_as_string,
										ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
										par_flat_occ.as_string>>)
								else
									add_warning (ec_VSONCO, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
										co_child_diff.occurrences_as_string,
										ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
										par_flat_occ.as_string>>)
									co_child_diff.remove_occurrences
									if co_child_diff.is_root or else co_child_diff.parent.is_path_compressible then
debug ("validate")
	io.put_string (" (setting is_path_compressible) %N")
end
										co_child_diff.set_is_path_compressible
									end
								end
							else
								add_error (ec_VSONCO, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
									co_child_diff.occurrences_as_string,
									ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
									co_parent_flat.occurrences.as_string>>)
							end

						-- node id non-conformance value mismatch was the reason
						elseif co_child_diff.is_addressable then
							if not co_child_diff.node_id_conforms_to (co_parent_flat) then
								add_error (ec_VSONCI, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
									co_child_diff.node_id,
									ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True),
									co_parent_flat.node_id>>)
							elseif co_child_diff.node_id.is_equal(co_parent_flat.node_id) then -- id same, something else must be different
								if not co_child_diff.rm_type_name.is_equal (co_parent_flat.rm_type_name) then -- has to be that RM type was redefined but at-code wasn't
									add_error (ec_VSONIRrm, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
										co_child_diff.rm_type_name, co_parent_flat.rm_type_name, co_child_diff.node_id>>)
								else -- has to be the occurrences was redefined, but the at-code wasn't
									add_error (ec_VSONIRocc, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
										co_child_diff.occurrences_as_string, co_parent_flat.occurrences_as_string, co_child_diff.node_id>>)
								end
							end

						-- node id non-conformance presence / absence was the reason
						elseif co_parent_flat.is_addressable then
							add_error (ec_VSONI, <<co_child_diff.rm_type_name, ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
								co_parent_flat.rm_type_name,
								ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True)>>)

						-- could be a leaf object value redefinition
						elseif attached {C_PRIMITIVE_OBJECT} co_child_diff as cpo_child and attached {C_PRIMITIVE_OBJECT} co_parent_flat as cpo_flat then
							add_error (ec_VPOV, <<cpo_child.rm_type_name, ontology.physical_to_logical_path (cpo_child.path, target_descriptor.archetype_view_language, True),
								cpo_child.item.as_string, cpo_flat.item.as_string, cpo_flat.rm_type_name,
								ontology.physical_to_logical_path (cpo_flat.path, target_descriptor.archetype_view_language, True)>>)

						elseif attached {C_DOMAIN_TYPE} co_child_diff as cdt_child and attached {C_DOMAIN_TYPE} co_parent_flat as cdt_flat then
							add_error (ec_VSDTV, <<cdt_child.rm_type_name, ontology.physical_to_logical_path (cdt_child.path, target_descriptor.archetype_view_language, True),
								cdt_flat.rm_type_name, ontology.physical_to_logical_path (cdt_flat.path, target_descriptor.archetype_view_language, True)>>)

						else
							add_error (ec_VUNK, <<co_child_diff.rm_type_name, ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
								co_parent_flat.rm_type_name, ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True)>>)

						end
					else
						-- nodes are at least conformant; Now check for congruence for C_COMPLEX_OBJECTs, i.e. if no changes at all, other than possible node_id redefinition,
						-- occurred on this node. This enables the node to be skipped and a compressed path created instead in the final archetype.
						-- FIXME: NOTE that this only applies while uncompressed format differential archetypes are being created by e.g.
						-- diff-tools taking legacy archetypes as input.
						if attached {C_COMPLEX_OBJECT} co_child_diff as cco and co_child_diff.node_congruent_to (co_parent_flat, rm_schema) and
							(co_child_diff.is_root or else co_child_diff.parent.is_path_compressible)
						then
debug ("validate")
	io.put_string (">>>>> validate: C_OBJECT in child at " +
	ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True) + " CONGRUENT to parent node " +
	ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True))
end
							if attached {C_COMPLEX_OBJECT} co_parent_flat as cco_pf then
								-- if this node in the diff archetype is the root, or else if the corresponding node in the flat parent has children,
								-- this node must be an overlay node (in the former case, it is by definition; in the latter, the flat parent node children
								-- need to be preserved)
								if co_child_diff.is_root or cco_pf.has_attributes then
									co_child_diff.set_is_path_compressible
debug ("validate")
	io.put_string (" (setting is_path_compressible) %N")
end
								else
debug ("validate")
	io.put_string ("(not setting is_path_compressible, due to being overlay node)%N")
end
								end
							else
								add_error (ec_compiler_unexpected_error, <<"ARCHETYPE_VALIDATOR.specialised_node_validate location 4">>)
							end
						else
debug ("validate")
	io.put_string (">>>>> validate: C_OBJECT in child at " +
	ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True) + " CONFORMANT to parent node " +
	ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.archetype_view_language, True) + " %N")
end
						end

						if attached co_child_diff.sibling_order and then not co_parent_flat.parent.has_child_with_id (co_child_diff.sibling_order.sibling_node_id) then
							add_error (ec_VSSM, <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.archetype_view_language, True),
								co_child_diff.sibling_order.sibling_node_id>>)
						end
					end
				end
			end
		end

	specialised_node_validate_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- return True if a conformant path of a_c_node within the differential archetype is
			-- found within the flat parent archetype - i.e. a_c_node is inherited or redefined from parent (but not new)
			-- and no previous errors encountered
		local
			apa: ARCHETYPE_PATH_ANALYSER
			flat_parent_path: STRING
		do
			-- if it is a C_ARCHETYPE_ROOT, it is either a slot filler or an external reference. If the former, it is
			-- redefining an ARCHETYPE_SLOT node, and needs to be validated; if the latter it is a new node, and will
			-- only have been RM-validated. Either way, we need to use the slot path it replaces rather than its literal path,
			-- to determine if it has a corresponding node in the flat parent.
			if passed then
				if attached {C_ARCHETYPE_ROOT} a_c_node as car then
					create apa.make_from_string(car.slot_path)
					flat_parent_path := apa.path_at_level (flat_parent.specialisation_depth)
					Result := flat_parent.has_path (flat_parent_path)
				else
					-- if check below is False, it means the path is to a node that is new in the current archetype,
					-- and therefore there is nothing in the parent to validate it against. Invalid codes, i.e. the 'unknown' code
					-- (used on non-coded nodes) or else codes that are either the same as the corresponding node in the parent flat,
					-- or else a refinement of that (e.g. at0001.0.2), but not a new code (e.g. at0.0.1)
					if attached {C_OBJECT} a_c_node as a_c_obj then
						if not is_valid_code (a_c_obj.node_id) or else								-- node with no node_id (= "unknown") OR
									(specialisation_depth_from_code (a_c_obj.node_id)
											<= flat_parent.specialisation_depth or else 			-- node with node_id from previous level OR
									is_refined_code (a_c_obj.node_id)) then							-- node id refined (i.e. not new)

							create apa.make_from_string(a_c_node.path)
							flat_parent_path := apa.path_at_level (flat_parent.specialisation_depth)
							Result := flat_parent.has_path (flat_parent_path)
							if not Result and a_c_obj.is_addressable then -- if it is an addressable node it should have a matching node in flat parent
								add_error (ec_VSONIN, <<a_c_obj.node_id, a_c_obj.rm_type_name, ontology.physical_to_logical_path (a_c_obj.path, target_descriptor.archetype_view_language, True),
									ontology.physical_to_logical_path (flat_parent_path, target_descriptor.archetype_view_language, True)>>)
							end

						-- special check: if it is a non-overlay node, but it has a sibling order, then we need to check that the
						-- sibling order refers to a valid node in the parent flat. Arguably this should be done in the main
						-- specialised_node_validate routine, but... I will re-engineer the code before contemplating that
						elseif attached a_c_obj.sibling_order as sib_ord then
							create apa.make_from_string (a_c_node.parent.path)
							check attached flat_parent.definition.c_attribute_at_path (apa.path_at_level (flat_parent.specialisation_depth)) as ca_parent_flat then
								if not ca_parent_flat.has_child_with_id (sib_ord.sibling_node_id) then
									add_error (ec_VSSM, <<ontology.physical_to_logical_path (a_c_obj.path, target_descriptor.archetype_view_language, True), sib_ord.sibling_node_id>>)
								end
							end
						else
debug ("validate")
	io.put_string ("????? specialised_node_validate_test: C_OBJECT at " + ontology.physical_to_logical_path (a_c_node.path, target_descriptor.archetype_view_language, True) + " ignored %N")
end
						end

					elseif attached {C_ATTRIBUTE} a_c_node as ca then
						create apa.make_from_string (a_c_node.path)
						flat_parent_path := apa.path_at_level (flat_parent.specialisation_depth)
						Result := flat_parent.has_path (flat_parent_path)
						if not Result and ca.has_differential_path then
							add_error (ec_VDIFP1, <<ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
								ontology.physical_to_logical_path (flat_parent_path, target_descriptor.archetype_view_language, True)>>)
						end
					end
				end
			end
		end

	validate_reference_model
			-- validate definition of archetype against reference model
		local
			def_it: C_ITERATOR
		do
			invalid_types.wipe_out
			create def_it.make (target.definition)
			def_it.do_until_surface (agent rm_node_validate, agent rm_node_validate_test)
		end

	rm_node_validate (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		local
			arch_parent_attr_type, model_attr_class: STRING
			apa: ARCHETYPE_PATH_ANALYSER
			rm_prop_def: BMM_PROPERTY_DEFINITION
		do
			if attached {C_OBJECT} a_c_node as co then
				if not co.is_root then -- now check if this object a valid type of its owning attribute
					if target.is_specialised and then co.parent.has_differential_path then
						check attached co.parent.differential_path as diff_path then
							create apa.make_from_string (diff_path)
						end
						check attached flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth)) as co_parent_flat then
							arch_parent_attr_type := co_parent_flat.rm_type_name
						end
					else
						arch_parent_attr_type := co.parent.parent.rm_type_name
					end

					if not invalid_types.has (arch_parent_attr_type) then
						if rm_schema.has_property (arch_parent_attr_type, co.parent.rm_attribute_name) and not
											rm_schema.valid_property_type (arch_parent_attr_type, co.parent.rm_attribute_name, co.rm_type_name) then
							model_attr_class := rm_schema.property_type (arch_parent_attr_type, co.parent.rm_attribute_name)

							-- check for type substitutions such as ISO8601_DATE which appear in the archetype as a String
							if rm_schema.substitutions.has (co.rm_type_name) and then rm_schema.substitutions.item (co.rm_type_name).is_equal (model_attr_class) then
								add_info (ec_ICORMTS, <<co.rm_type_name, ontology.physical_to_logical_path (co.path, target_descriptor.archetype_view_language, True), model_attr_class,
									arch_parent_attr_type, co.parent.rm_attribute_name>>)
							else
								add_error (ec_VCORMT, <<co.rm_type_name, ontology.physical_to_logical_path (co.path, target_descriptor.archetype_view_language, True),
									model_attr_class, arch_parent_attr_type, co.parent.rm_attribute_name>>)
								invalid_types.extend (co.rm_type_name)
							end
						end
					end
				end
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				if target.is_specialised and then ca.has_differential_path then
					check attached ca.differential_path as diff_path then
						create apa.make_from_string (diff_path)
					end
					check attached flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth)) as co_parent_flat then
						arch_parent_attr_type := co_parent_flat.rm_type_name
					end
				else
					arch_parent_attr_type := ca.parent.rm_type_name -- can be a generic type like DV_INTERVAL <DV_QUANTITY>
				end
				if not rm_schema.has_property (arch_parent_attr_type, ca.rm_attribute_name) then
					add_error (ec_VCARM, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True), arch_parent_attr_type>>)
				else
					rm_prop_def := rm_schema.property_definition (arch_parent_attr_type, ca.rm_attribute_name)
					if attached ca.existence as ca_ex then
						if not rm_prop_def.existence.contains (ca_ex) then
							if not target.is_specialised and rm_prop_def.existence.equal_interval (ca_ex) then
								add_warning (ec_WCAEX, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
									ca_ex.as_string>>)
								if not validation_strict then
									ca.remove_existence
								end
							else
								add_error (ec_VCAEX, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
									ca_ex.as_string, rm_prop_def.existence.as_string>>)
							end
						end
					end
					if ca.is_multiple then
						if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as cont_prop then
							if attached ca.cardinality as ca_card then
								if not cont_prop.cardinality.contains (ca_card.interval) then
									if not target.is_specialised and cont_prop.cardinality.equal_interval (ca_card.interval) then
										add_warning (ec_WCACA, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
											ca_card.interval.as_string>>)
										if not validation_strict then
											ca.remove_cardinality
										end
									else
										add_error (ec_VCACA, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
											ca_card.interval.as_string, cont_prop.cardinality.as_string>>)
									end
								end
							end
						else -- archetype has multiple attribute but RM does not
							add_error (ec_VCAM, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
								ca.cardinality.as_string, "(single-valued)">>)
						end
					elseif attached {BMM_CONTAINER_PROPERTY} rm_prop_def as cont_prop_2 then
						add_error (ec_VCAM, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
							"(single-valued)", cont_prop_2.cardinality.as_string>>)
					end
					if rm_prop_def.is_computed then
						-- flag if this is a computed property constraint (i.e. a constraint on a function from the RM)
						add_warning (ec_WCARMC, <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
							arch_parent_attr_type>>)
					end
				end
			end
		end

	invalid_types: ARRAYED_LIST [STRING]
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	rm_node_validate_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- Return True if node is a C_OBJECT and class is known in RM, or if it is a C_ATTRIBUTE
		local
			apa: ARCHETYPE_PATH_ANALYSER
			flat_parent_path: STRING
		do
			Result := True
			if attached {C_OBJECT} a_c_node as co and then not rm_schema.has_class_definition (co.rm_type_name) then
				if attached {C_DOMAIN_TYPE} co then
					-- normally just report an error, but C_DOMAIN_TYPEs like C_DV_QUANTITY are a special case - they may be used
					-- in archetypes based on a non-openEHR RM, which means the type DV_QUANTITY might not be there, but nevertheless
					-- C_DV_QUANTITY is used
					add_error (ec_VCORM, <<co.rm_type_name, ontology.physical_to_logical_path (co.path, target_descriptor.archetype_view_language, True)>>)
					Result := False
				else
					if not invalid_types.has (co.rm_type_name) then
						add_error (ec_VCORM, <<co.rm_type_name, ontology.physical_to_logical_path (co.path, target_descriptor.archetype_view_language, True)>>)
						invalid_types.extend (co.rm_type_name)
					end
					Result := False
				end
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				if target.is_specialised then
					create apa.make_from_string (a_c_node.path)
					if not apa.is_phantom_path_at_level (flat_parent.specialisation_depth) then
						flat_parent_path := apa.path_at_level (flat_parent.specialisation_depth)
						if not flat_parent.has_path (flat_parent_path) and ca.has_differential_path then
							add_error (ec_VDIFP1, <<ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True),
								ontology.physical_to_logical_path (flat_parent_path, target_descriptor.archetype_view_language, True)>>)
							Result := False
						end
					elseif ca.has_differential_path then
						add_error (ec_VDIFP3, <<ontology.physical_to_logical_path (ca.path, target_descriptor.archetype_view_language, True)>>)
						Result := False
					end
				end
			end
		end

end


