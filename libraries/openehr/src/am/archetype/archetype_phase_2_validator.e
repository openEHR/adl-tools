note
	component:   "openEHR Archetype Project"
	description: "[
				 Phase 2 validation: validate archetype with respect to flat parent archetype, in the case 
				 of specialised archetypes.
		         ]"
	keywords:    "constraint model"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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

feature -- Status Report

	validation_candidiate (ara: attached ARCH_CAT_ARCHETYPE): BOOLEAN
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
			if passed and not target.is_specialised then
				validate_reference_model
			end

			-- validation requiring the archetype xref tables
			if passed then
				validate_definition_codes
			end

			-- validation of ontology requiring flat parent
			if passed then
				validate_ontology_languages
			end

			-- validation requiring valid specialisation parent
			if passed then
				if target.is_specialised then
					target.build_rolled_up_status
					validate_specialised_basics
					validate_specialised_definition
				end
				validate_internal_references
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
			from langs.start until langs.off loop
				from ontology.term_codes.start until ontology.term_codes.off loop
					if not ontology.has_term_definition (langs.item, ontology.term_codes.item) then
						add_error ("VONLC", <<ontology.term_codes.item, langs.item>>)
					end
					ontology.term_codes.forth
				end
				from ontology.constraint_codes.start until ontology.constraint_codes.off loop
					if not ontology.has_constraint_definition (langs.item, ontology.constraint_codes.item) then
						add_error ("VONLC", <<ontology.constraint_codes.item, langs.item>>)
					end
					ontology.constraint_codes.forth
				end
				langs.forth
			end
		end

	validate_definition_codes
			-- Check if all at- and ac-codes found in the definition node tree are in the ontology (including inherited items).
			-- Leave `passed' True if all found node_ids are defined in term_definitions,
			-- and term_definitions contains no extras.
			-- For specialised archetypes, requires flat parent to be available
		local
			a_codes: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_CONSTRAINT], STRING]
			depth, code_depth: INTEGER
		do
			depth := ontology.specialisation_depth

			a_codes := target.id_atcodes_index
			from a_codes.start until a_codes.off loop
				code_depth := specialisation_depth_from_code (a_codes.key_for_iteration)
				if code_depth > depth then
					add_error ("VONSD", <<a_codes.key_for_iteration>>)
				elseif code_depth < depth then
					if not flat_parent.ontology.has_term_code (a_codes.key_for_iteration) then
						add_error ("VATDF1", <<a_codes.key_for_iteration>>)
					end
				elseif not ontology.has_term_code (a_codes.key_for_iteration) then
					add_error ("VATDF2", <<a_codes.key_for_iteration>>)
				end
				a_codes.forth
			end

			-- see if every found leaf term code (in an ORDINAL or a CODED_TERM) is in ontology
			a_codes := target.data_atcodes_index
			from a_codes.start until a_codes.off loop
				code_depth := specialisation_depth_from_code (a_codes.key_for_iteration)
				if code_depth > depth then
					add_error ("VATCD", <<a_codes.key_for_iteration>>)
				elseif code_depth < depth then
					if not flat_parent.ontology.has_term_code (a_codes.key_for_iteration) then
						add_error ("VATDF1", <<a_codes.key_for_iteration>>)
					end
				elseif not ontology.has_term_code (a_codes.key_for_iteration) then
					add_error ("VATDF2", <<a_codes.key_for_iteration>>)
				end
				a_codes.forth
			end

			-- check if all found constraint_codes are defined in constraint_definitions,
			a_codes := target.accodes_index
			from a_codes.start until a_codes.off loop
				code_depth := specialisation_depth_from_code (a_codes.key_for_iteration)
				if code_depth > depth then
					add_error ("VATCD", <<a_codes.key_for_iteration>>)
				elseif code_depth < depth then
					if not flat_parent.ontology.has_constraint_code (a_codes.key_for_iteration) then
						add_error ("VACDF1", <<a_codes.key_for_iteration>>)
					end
				elseif not ontology.has_constraint_code (a_codes.key_for_iteration) then
					add_error ("VACDF2", <<a_codes.key_for_iteration>>)
				end
				a_codes.forth
			end
		end

	validate_internal_references
			-- Validate items in `found_internal_references'.
			-- For specialised archetypes, requires flat parent to be available
		local
			use_refs: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_INTERNAL_REF], STRING]
		do
			use_refs := target.use_node_index
			from use_refs.start until use_refs.off loop
				-- check on paths in the current archetype
				if target.definition.has_path (use_refs.key_for_iteration) then
					convert_use_ref_paths (use_refs.item_for_iteration, use_refs.key_for_iteration, target)
				elseif target.is_specialised and flat_parent.definition.has_path (use_refs.key_for_iteration) then
					convert_use_ref_paths (use_refs.item_for_iteration, use_refs.key_for_iteration, flat_parent)
				else
					add_error ("VUNP", <<use_refs.key_for_iteration>>)
				end
				use_refs.forth
			end
		end

	validate_structure
			-- validate definition structure of archetype
		local
			def_it: C_ITERATOR
		do
			create invalid_types.make(0)
			invalid_types.compare_objects
			create def_it.make (target.definition)
			def_it.do_until_surface (agent structure_validate_node, agent structure_validate_test)
		end

	structure_validate_node (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				if not target.is_specialised and then ca.has_differential_path then
					add_error ("VDIFV", <<ca.path>>)
				end
			end
		end

	structure_validate_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- Return True
		do
			Result := True
		end

	validate_annotations
			-- for each language, ensure that annotations are proper translations of each other (if present)
			-- For specialised archetypes, requires flat parent to be available
		local
			ann_for_lang: RESOURCE_ANNOTATION_NODES
		do
			if target.has_annotations then
				from target.annotations.items.start until not passed or target.annotations.items.off loop
					ann_for_lang := target.annotations.items.item_for_iteration
					from ann_for_lang.items.start until not passed or ann_for_lang.items.off loop
						-- firstly see if annotation path is valid
						if not (target.has_path (ann_for_lang.items.key_for_iteration) or else (target.is_specialised and then
							flat_parent.has_path (ann_for_lang.items.key_for_iteration)))
						then
							add_error ("VRANP", <<target.annotations.items.key_for_iteration, ann_for_lang.items.key_for_iteration>>)
						end

						-- FIXME: now we should do some other checks to see if contents are of same structure as annotations in other languages
						ann_for_lang.items.forth
					end
					target.annotations.items.forth
				end
			end
		end

	validate_specialised_basics
			-- make sure specialised archetype basic relationship to flat parent is valid
		require
			Target_specialised: target.is_specialised
		do
			if not target.languages_available.is_subset (flat_parent.languages_available) then
				add_error ("VALC", <<target.languages_available_out, flat_parent.languages_available_out>>)
			end
		end

	validate_specialised_definition
			-- validate definition of specialised archetype against flat parent
		require
			Target_specialised: target.is_specialised
		local
			def_it: C_ITERATOR
		do
			create def_it.make (target.definition)
			def_it.do_until_surface (agent specialised_node_validate, agent specialised_node_validate_test)
		end

	specialised_node_validate (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- validate nodes in differential specialised archetype
			-- SIDE-EFFECT: sets is_path_compressible markers on child archetype nodes
		local
			co_parent_flat: attached C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			slot_id_index: DS_HASH_TABLE [ARRAYED_SET[STRING], STRING]
		do
			if attached {C_ATTRIBUTE} a_c_node as ca_child_diff then
				create apa.make_from_string (a_c_node.path)
				if attached {C_ATTRIBUTE} flat_parent.definition.c_attribute_at_path (apa.path_at_level (flat_parent.specialisation_depth)) as ca_parent_flat then
					if not ca_child_diff.node_conforms_to (ca_parent_flat, rm_schema) then
						if ca_child_diff.is_single and not ca_parent_flat.is_single then
							add_error ("VSAM1", <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.current_language, True)>>)

						elseif not ca_child_diff.is_single and ca_parent_flat.is_single then
							add_error ("VSAM2", <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.current_language, True)>>)

						else
							if not ca_child_diff.existence_conforms_to (ca_parent_flat) then
								if validation_strict or else not ca_child_diff.existence.equal_interval (ca_parent_flat.existence) then
									add_error ("VSANCE", <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.current_language, True),
										ca_child_diff.existence.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.current_language, True),
										ca_parent_flat.existence.as_string>>)
								else
									add_warning ("VSANCE", <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.current_language, True),
										ca_child_diff.existence.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.current_language, True),
										ca_parent_flat.existence.as_string>>)
									ca_child_diff.remove_existence
									if ca_child_diff.parent.is_path_compressible then
debug ("validate")
	io.put_string (" (setting is_path_compressible) %N")
end
										ca_child_diff.set_is_path_compressible
									end
								end
							end

							if not ca_child_diff.cardinality_conforms_to (ca_parent_flat) then
								if validation_strict or else not ca_child_diff.cardinality.equal_interval (ca_parent_flat.cardinality) then
									add_error ("VSANCC", <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.current_language, True),
										ca_child_diff.cardinality.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.current_language, True),
										ca_parent_flat.cardinality.as_string>>)
								else
									add_warning ("VSANCC", <<ontology.physical_to_logical_path (ca_child_diff.path, target_descriptor.current_language, True),
										ca_child_diff.cardinality.as_string, ontology.physical_to_logical_path (ca_parent_flat.path, target_descriptor.current_language, True),
										ca_parent_flat.cardinality.as_string>>)
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

					elseif ca_child_diff.node_congruent_to (ca_parent_flat, rm_schema) and ca_child_diff.parent.is_path_compressible then
debug ("validate")
	io.put_string (">>>>> validate: C_ATTRIBUTE in child at " +
	ca_child_diff.path + " CONGRUENT to parent node " +
	ca_parent_flat.path + " (setting is_path_compressible) %N")
end
						ca_child_diff.set_is_path_compressible
					end
				else
					add_error ("compiler_unexpected_error", <<"ARCHETYPE_VALIDATOR.specialised_node_validate location 2">>)
				end

			-- deal with C_ARCHETYPE_ROOT (slot filler) inheriting from ARCHETYPE_SLOT
			elseif attached {C_ARCHETYPE_ROOT} a_c_node as car then
				create apa.make_from_string (car.slot_path)
				co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))

				if attached {ARCHETYPE_SLOT} co_parent_flat as a_slot then
					slot_id_index := target_descriptor.specialisation_parent.slot_id_index
					if attached slot_id_index and then slot_id_index.has (a_slot.path) then
						if not archetype_id_matches_slot (car.archetype_id, a_slot) then -- doesn't even match the slot definition
							add_error ("VARXS", <<ontology.physical_to_logical_path (car.path, target_descriptor.current_language, True), car.archetype_id>>)

						elseif not slot_id_index.item (a_slot.path).has (car.archetype_id) then -- matches def, but not found in actual list from current repo
							add_error ("VARXR", <<ontology.physical_to_logical_path (car.path, target_descriptor.current_language, True), car.archetype_id>>)

						elseif not car.occurrences_conforms_to (a_slot) then
							if attached car.occurrences and then car.occurrences.equal_interval (co_parent_flat.occurrences) then
								if validation_strict then
									add_error ("VSONCO", <<ontology.physical_to_logical_path (car.path, target_descriptor.current_language, True), car.occurrences_as_string,
										ontology.physical_to_logical_path (a_slot.path, target_descriptor.current_language, True), a_slot.occurrences.as_string>>)
								else
									add_warning ("VSONCO", <<ontology.physical_to_logical_path (car.path, target_descriptor.current_language, True), car.occurrences_as_string,
										ontology.physical_to_logical_path (a_slot.path, target_descriptor.current_language, True), a_slot.occurrences.as_string>>)
									car.remove_occurrences
								end
							else
								add_error ("VSONCO", <<ontology.physical_to_logical_path (car.path, target_descriptor.current_language, True), car.occurrences_as_string,
									ontology.physical_to_logical_path (a_slot.path, target_descriptor.current_language, True), a_slot.occurrences.as_string>>)
							end
						end
					else
						add_error ("compiler_unexpected_error", <<"ARCHETYPE_VALIDATOR.specialised_node_validate location 3; descriptor does not have slot match list">>)
					end
				else
					add_error ("VARXV", <<ontology.physical_to_logical_path (car.path, target_descriptor.current_language, True)>>)
				end

			elseif attached {C_OBJECT} a_c_node as co_child_diff then
				create apa.make_from_string (a_c_node.path)
				co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))

debug ("validate")
	io.put_string (">>>>> validate: C_OBJECT in child at " + ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True))
end

				-- meta-type (i.e. AOM type) checking...
				-- this check sees if the node is a C_CODE_PHRASE redefinition of a CONSTRAINT_REF node, which is legal, since we say that
				-- C_CODE_PHRASE conforms to CONSTRAINT_REF. Its validity is not testable in any way (sole exception in AOM) - just warn
				if attached {CONSTRAINT_REF} co_parent_flat as ccr and then not attached {CONSTRAINT_REF} co_child_diff as ccr2 then
					if attached {C_CODE_PHRASE} co_child_diff as ccp then
						add_warning ("WCRC", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True)>>)
					else
						add_error ("VSCNR", <<co_parent_flat.generating_type, ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
							co_child_diff.generating_type, ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True)>>)
					end

				else
					-- if the child is a redefine of a use_node (internal ref), then we have to do the comparison to the use_node target - so
					-- we re-assign co_parent_flat to point to the target structure; unless they both are use_nodes, in which case leave them as is
					if attached {ARCHETYPE_INTERNAL_REF} co_parent_flat as air_p and not attached {ARCHETYPE_INTERNAL_REF} co_child_diff as air_c then
						co_parent_flat := flat_parent.c_object_at_path (air_p.path)
						if dynamic_type (co_child_diff) /= dynamic_type (co_parent_flat) then
							add_error ("VSUNT", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
								co_child_diff.generating_type, ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
								co_parent_flat.generating_type>>)
						end
					end

					-- by here the AOM meta-types must be the same; if not, it is an error
					if dynamic_type (co_child_diff) /= dynamic_type (co_parent_flat) then
						add_error ("VSONT", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
							co_child_diff.generating_type,
							ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
							co_parent_flat.generating_type>>)

					-- they should also be conformant as defined by the node_conforms_to() function
					elseif not co_child_diff.node_conforms_to(co_parent_flat, rm_schema) then

						-- RM type non-conformance was the reason
						if not co_child_diff.rm_type_conforms_to (co_parent_flat, rm_schema) then
							add_error ("VSONCT", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
								co_child_diff.rm_type_name,
								ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
								co_parent_flat.rm_type_name>>)

						-- occurrences non-conformance was the reason
						elseif not co_child_diff.occurrences_conforms_to (co_parent_flat) then
							-- if the occurrences interval is just a copy of the one in the flat, treat it as an error only if
							-- compiling strict, else remove the duplicate and just warn
							if co_child_diff.occurrences /= Void and then co_child_diff.occurrences.equal_interval (co_parent_flat.occurrences) then
								if validation_strict then
									add_error ("VSONCO", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
										co_child_diff.occurrences_as_string,
										ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
										co_parent_flat.occurrences.as_string>>)
								else
									add_warning ("VSONCO", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
										co_child_diff.occurrences_as_string,
										ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
										co_parent_flat.occurrences.as_string>>)
									co_child_diff.remove_occurrences
									if co_child_diff.is_root or else co_child_diff.parent.is_path_compressible then
debug ("validate")
	io.put_string (" (setting is_path_compressible) %N")
end
										co_child_diff.set_is_path_compressible
									end
								end
							else
								add_error ("VSONCO", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
									co_child_diff.occurrences_as_string,
									ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
									co_parent_flat.occurrences.as_string>>)
							end

						-- node id non-conformance value mismatch was the reason
						elseif co_child_diff.is_addressable then
							if not co_child_diff.node_id_conforms_to (co_parent_flat) then
								add_error ("VSONCI", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
									co_child_diff.node_id,
									ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True),
									co_parent_flat.node_id>>)
							elseif co_child_diff.node_id.is_equal(co_parent_flat.node_id) then -- id same, something else must be different
								if not co_child_diff.rm_type_name.is_equal (co_parent_flat.rm_type_name) then -- has to be that RM type was redefined but at-code wasn't
									add_error ("VSONIRrm", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
										co_child_diff.rm_type_name, co_parent_flat.rm_type_name, co_child_diff.node_id>>)
								else -- has to be the occurrences was redefined, but the at-code wasn't
									add_error ("VSONIRocc", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
										co_child_diff.occurrences_as_string, co_parent_flat.occurrences_as_string, co_child_diff.node_id>>)
								end
							end

						-- node id non-conformance presence / absence was the reason
						elseif co_parent_flat.is_addressable then
							add_error("VSONI", <<co_child_diff.rm_type_name, ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True),
								co_parent_flat.rm_type_name,
								ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True)>>)

						-- could be a leaf object value redefinition
						elseif attached {C_PRIMITIVE_OBJECT} co_child_diff as cpo_child and attached {C_PRIMITIVE_OBJECT} co_parent_flat as cpo_flat then
							add_error("VPOV", <<cpo_child.rm_type_name, ontology.physical_to_logical_path (cpo_child.path, target_descriptor.current_language, True),
								cpo_child.item.as_string, cpo_flat.item.as_string, cpo_flat.rm_type_name,
								ontology.physical_to_logical_path (cpo_flat.path, target_descriptor.current_language, True)>>)
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
	ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True) + " CONGRUENT to parent node " +
	ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True))
end
							-- if the parent C_ATTRIBUTE of the object node in the flat parent has no children, this object can be assumed to be a total
							-- replacement, so don't mark it as an overlay
							if attached {C_COMPLEX_OBJECT} co_parent_flat as cco_pf then
								if co_child_diff.is_root or cco_pf.has_attributes then
									co_child_diff.set_is_path_compressible
debug ("validate")
	io.put_string (" (setting is_path_compressible) %N")
end
								else
debug ("validate")
	io.put_string ("(not setting is_path_compressible, due to being replacement)%N")
end
								end
							else
								add_error ("compiler_unexpected_error", <<"ARCHETYPE_VALIDATOR.specialised_node_validate location 4">>)
							end
						else
debug ("validate")
	io.put_string (">>>>> validate: C_OBJECT in child at " +
	ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True) + " CONFORMANT to parent node " +
	ontology.physical_to_logical_path (co_parent_flat.path, target_descriptor.current_language, True) + " %N")
end
						end

						if attached co_child_diff.sibling_order and then not co_parent_flat.parent.has_child_with_id (co_child_diff.sibling_order.sibling_node_id) then
							add_error ("VSSM", <<ontology.physical_to_logical_path (co_child_diff.path, target_descriptor.current_language, True), co_child_diff.sibling_order.sibling_node_id>>)
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
			ca_parent_flat: attached C_ATTRIBUTE
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
									is_refined_code(a_c_obj.node_id)) then							-- node id refined (i.e. not new)

							create apa.make_from_string(a_c_node.path)
							flat_parent_path := apa.path_at_level (flat_parent.specialisation_depth)
							Result := flat_parent.has_path (flat_parent_path)
							if not Result and a_c_obj.is_addressable then -- if it is an addressable node it should have a matching node in flat parent
								add_error ("VSONIN", <<a_c_obj.node_id, a_c_obj.rm_type_name, ontology.physical_to_logical_path (a_c_obj.path, target_descriptor.current_language, True),
									ontology.physical_to_logical_path (flat_parent_path, target_descriptor.current_language, True)>>)
							end

						-- special check: if it is a non-overlay node, but it has a sibling order, then we need to check that the
						-- sibling order refers to a valid node in the parent flat. Arguably this should be done in the main
						-- specialised_node_validate routine, but... I will re-engineer the code before contemplating that
						elseif a_c_obj.sibling_order /= Void then
							create apa.make_from_string(a_c_node.parent.path)
							ca_parent_flat := flat_parent.definition.c_attribute_at_path (apa.path_at_level (flat_parent.specialisation_depth))
							if not ca_parent_flat.has_child_with_id (a_c_obj.sibling_order.sibling_node_id) then
								add_error ("VSSM", <<ontology.physical_to_logical_path (a_c_obj.path, target_descriptor.current_language, True), a_c_obj.sibling_order.sibling_node_id>>)
							end
						else
debug ("validate")
	io.put_string ("????? specialised_node_validate_test: C_OBJECT at " + ontology.physical_to_logical_path (a_c_node.path, target_descriptor.current_language, True) + " ignored %N")
end
						end

					elseif attached {C_ATTRIBUTE} a_c_node as ca then
						create apa.make_from_string(a_c_node.path)
						flat_parent_path := apa.path_at_level (flat_parent.specialisation_depth)
						Result := flat_parent.has_path (flat_parent_path)
						if not Result and ca.has_differential_path then
							add_error ("VDIFP1", <<ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True),
								ontology.physical_to_logical_path (flat_parent_path, target_descriptor.current_language, True)>>)
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
			create invalid_types.make(0)
			invalid_types.compare_objects
			create def_it.make (target.definition)
			def_it.do_until_surface (agent rm_node_validate, agent rm_node_validate_test)
		end

	rm_node_validate (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		local
			arch_parent_attr_type, model_attr_class: STRING
			co_parent_flat: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			rm_prop_def: BMM_PROPERTY_DEFINITION
		do
			if attached {C_OBJECT} a_c_node as co then
				if not co.is_root then -- now check if this object a valid type of its owning attribute
					if target.is_specialised and then co.parent.has_differential_path then
						create apa.make_from_string (co.parent.differential_path)
						co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))
						arch_parent_attr_type := co_parent_flat.rm_type_name
					else
						arch_parent_attr_type := co.parent.parent.rm_type_name
					end

					if not invalid_types.has (arch_parent_attr_type) then
						-- check for type substitutions such as ISO8601_DATE which appear in the archetype as a String
						if rm_schema.has_property (arch_parent_attr_type, co.parent.rm_attribute_name) and not
											rm_schema.valid_property_type (arch_parent_attr_type, co.parent.rm_attribute_name, co.rm_type_name) then
							model_attr_class := rm_schema.property_type (arch_parent_attr_type, co.parent.rm_attribute_name)

							-- flag if constraint is equal to reference model; FUTURE: remove if equal
							if rm_schema.substitutions.has (co.rm_type_name) and then rm_schema.substitutions.item (co.rm_type_name).is_equal (model_attr_class) then
								add_info ("ICORMTS", <<co.rm_type_name, ontology.physical_to_logical_path (co.path, target_descriptor.current_language, True), model_attr_class,
									arch_parent_attr_type, co.parent.rm_attribute_name>>)
							else
								add_error ("VCORMT", <<co.rm_type_name, ontology.physical_to_logical_path (co.path, target_descriptor.current_language, True), model_attr_class, arch_parent_attr_type, co.parent.rm_attribute_name>>)
								invalid_types.extend (co.rm_type_name)
							end
						end
					end
				end
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				if target.is_specialised and then ca.has_differential_path then
					create apa.make_from_string (ca.differential_path)
					co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))
					arch_parent_attr_type := co_parent_flat.rm_type_name
				else
					arch_parent_attr_type := ca.parent.rm_type_name -- can be a generic type like DV_INTERVAL <DV_QUANTITY>
				end
				if not rm_schema.has_property (arch_parent_attr_type, ca.rm_attribute_name) then
					add_error ("VCARM", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True), arch_parent_attr_type>>)
				else
					rm_prop_def := rm_schema.property_definition (arch_parent_attr_type, ca.rm_attribute_name)
					if attached ca.existence then
						if not rm_prop_def.existence.contains (ca.existence) then
							if not target.is_specialised and rm_prop_def.existence.equal_interval(ca.existence) then
								add_warning ("WCAEX", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True), ca.existence.as_string>>)
								if not validation_strict then
									ca.remove_existence
								end
							else
								add_error ("VCAEX", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True), ca.existence.as_string, rm_prop_def.existence.as_string>>)
							end
						end
					end
					if ca.is_multiple then
						if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as cont_prop then
							if attached ca.cardinality then
								if not cont_prop.cardinality.contains (ca.cardinality.interval) then
									if not target.is_specialised and cont_prop.cardinality.equal_interval (ca.cardinality.interval) then
										add_warning ("WCACA", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True),
											ca.cardinality.interval.as_string>>)
										if not validation_strict then
											ca.remove_cardinality
										end
									else
										add_error ("VCACA", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True),
											ca.cardinality.interval.as_string, cont_prop.cardinality.as_string>>)
									end
								end
							end
						else -- archetype has multiple attribute but RM does not
							add_error ("VCAM", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True),
								ca.cardinality.as_string, "(single-valued)">>)
						end
					elseif attached {BMM_CONTAINER_PROPERTY} rm_prop_def as cont_prop_2 then
						add_error ("VCAM", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True),
							"(single-valued)", cont_prop_2.cardinality.as_string>>)
					end
					if rm_prop_def.is_computed then
						-- flag if this is a computed property constraint (i.e. a constraint on a function from the RM)
						add_warning ("WCARMC", <<ca.rm_attribute_name, ontology.physical_to_logical_path (ca.path, target_descriptor.current_language, True),
							arch_parent_attr_type>>)
					end
				end
			end
		end

	invalid_types: ARRAYED_LIST [STRING]

	rm_node_validate_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- Return True if node is a C_OBJECT and class is known in RM, or if it is a C_ATTRIBUTE
		do
			Result := True
			if attached {C_OBJECT} a_c_node as co then
				if not rm_schema.has_class_definition(co.rm_type_name) then
					if not invalid_types.has(co.rm_type_name) then
						add_error ("VCORM", <<co.rm_type_name, ontology.physical_to_logical_path (co.path, target_descriptor.current_language, True)>>)
						invalid_types.extend (co.rm_type_name)
					end
					Result := False
				end
			end
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
--| The Original Code is archetype_phase_2_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007-2011
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
