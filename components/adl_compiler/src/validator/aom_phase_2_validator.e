note
	component:   "openEHR ADL Tools"
	description: "[
				 Phase 2 validation: validate archetype with respect to flat ancestor archetype, in the case 
				 of specialised archetypes.
		         ]"
	keywords:    "constraint model, AOM, ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_2_VALIDATOR

inherit
	AOM_VALIDATOR
		rename
			initialise as aom_validator_initialise
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

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (an_arch_diff_child: ARCHETYPE; an_arch_flat_parent: detachable ARCHETYPE;
			a_flat_parent_slot_fillers_index: detachable like flat_parent_slot_fillers_index;
			an_rm: BMM_MODEL; a_display_language: STRING)
		do
			aom_validator_initialise (an_arch_diff_child, an_arch_flat_parent, an_rm)
			display_language := a_display_language
			if attached a_flat_parent_slot_fillers_index then
				flat_parent_slot_fillers_index := a_flat_parent_slot_fillers_index
			end
		end

feature -- Validation

	validate
			-- validate description section
		do
			reset

			-- reference model validation - needed for all archetypes, top-level and
			-- specialised, since specialised archetypes can contain new nodes that need to be
			-- validated all the way through to the RM
			if passed then
				validate_reference_model
			end

			if passed then
				validate_c_object_proxy_references
			end

			-- validation requiring valid specialisation ancestor
			if passed then
				if arch_diff_child.is_specialised then
					validate_specialised_definition
				end
				validate_rules
			end
		end

feature {NONE} -- Implementation

	display_language: STRING

	flat_parent_slot_fillers_index: HASH_TABLE [ARRAYED_SET[STRING], STRING]
		attribute
			create Result.make (0)
		end

	validate_c_object_proxy_references
			-- Validate items in `found_internal_references'.
			-- For specialised archetypes, requires flat ancestor to be available
		do
			across arch_diff_child.use_node_index as use_refs_csr loop
				if not (arch_diff_child.definition.has_path (use_refs_csr.key) or else
					arch_diff_child.is_specialised and arch_flat_parent.definition.has_path (use_refs_csr.key))
				then
					add_error ({ADL_MESSAGES_IDS}.ec_VUNP, <<use_refs_csr.key>>)
				end
			end
		end

	validate_rules
			-- validate the rules if any, which entails checking that all path references are valid against
			-- the flat archetype if specialised
			-- update ASSERTION EXPR_ITEM_LEAF object reference nodes with proper type names
			-- obtained from the AOM objects pointed to
		local
			arch_rm_type_name, ref_rm_type_name, arch_path: detachable STRING
			tail_path: STRING
			object_at_matching_path: detachable C_OBJECT
		do
			if arch_diff_child.has_rules then
				across arch_diff_child.rules_index as ref_path_csr loop
					-- get a matching path from archetype - has to be there, either exact or partial
					ref_rm_type_name := Void
					object_at_matching_path := Void
					if attached arch_diff_child.matching_path (ref_path_csr.key) as p then
						arch_path := p
						if arch_diff_child.has_object_path (arch_path) then
							object_at_matching_path := arch_diff_child.object_at_path (arch_path)
						end
					elseif attached arch_flat_parent.matching_path (ref_path_csr.key) as p then
						arch_path := p
						if arch_flat_parent.has_object_path (arch_path) then
							object_at_matching_path := arch_flat_parent.object_at_path (arch_path)
						end
					end
					if attached object_at_matching_path as omp and attached arch_path as ap then
						arch_rm_type_name := omp.rm_type_name
						-- if it was a partial match, we have to obtain the real RM type by going into the RM
						if ap.count < ref_path_csr.key.count then
							tail_path := ref_path_csr.key.substring (ap.count+1, ref_path_csr.key.count)
							if ref_model.has_property_path (arch_rm_type_name, tail_path) then
								check attached ref_model.property_at_path (arch_rm_type_name, tail_path) as bmm_prop then
									ref_rm_type_name := bmm_prop.bmm_type.effective_type.type_base_name
								end
							else
								add_error ({ADL_MESSAGES_IDS}.ec_VRRLPRM, <<ref_path_csr.key, tail_path, arch_rm_type_name>>)
							end
						else
							ref_rm_type_name := arch_rm_type_name
						end
					else
						add_error ({ADL_MESSAGES_IDS}.ec_VRRLPAR, <<ref_path_csr.key>>)
					end
					if attached ref_rm_type_name as rtn then
						across ref_path_csr.item as expr_leaf_csr loop
							expr_leaf_csr.item.update_type (rtn)
						end
					end
				end
			end
		end

	validate_specialised_definition
			-- validate definition of specialised archetype against flat parent
		require
			Target_specialised: arch_diff_child.is_specialised
		local
			def_it: C_ITERATOR
		do
			create def_it.make (arch_diff_child.definition)
			def_it.do_if (agent specialised_node_validate, agent specialised_node_validate_test)
		end

	slot_filler_valid (a_slot_path, a_filler_archetype_id: STRING): BOOLEAN
			-- Return true if, for a slot path that is in the ancestor slot index, the filler id
			-- `a_filler_archetype_id` is valid. Allow for different minor / patch versions.
		require
			flat_parent_slot_fillers_index.has (a_slot_path)
		local
			ids: ARRAYED_SET[STRING]
		do
			check attached flat_parent_slot_fillers_index.item (a_slot_path) as att_ids then
				ids := att_ids
			end

			-- try for direct match, or else filler id is compatible with available actual ids
			-- e.g. filler id is 'openEHR-EHR-COMPOSITION.discharge.v1' and list contains things
			-- like 'openEHR-EHR-COMPOSITION.discharge.v1.3.28'
			Result := ids.has (a_filler_archetype_id) or else
				across ids as actual_ids_csr some actual_ids_csr.item.starts_with (a_filler_archetype_id) end
		end

	specialised_node_validate (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- validate nodes in differential specialised archetype; nodes are pre-tested
			-- and can be assumed to have a matching path in ancestor archetype
		local
			co_in_flat_anc: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			ca_in_flat_anc: C_ATTRIBUTE
			comparable_flat_tuple: C_ATTRIBUTE_TUPLE
			ca_path_in_flat, co_child_annotated_path, co_flat_anc_annotated_path: STRING
		do
			if attached {C_ATTRIBUTE} a_c_node as ca_child_diff then
debug ("validate")
	io.put_string ("C_ATTRIBUTE - " + a_c_node.path  + "%N")
end
				create apa.make (a_c_node.og_path)
				ca_path_in_flat := apa.path_at_level (arch_flat_parent.specialisation_depth)
				ca_in_flat_anc := arch_flat_parent.attribute_at_path (ca_path_in_flat)


				if not ca_child_diff.c_conforms_to (ca_in_flat_anc, agent ref_model.type_conforms_to) then
					if ca_child_diff.is_single and not ca_in_flat_anc.is_single then
						add_error ({ADL_MESSAGES_IDS}.ec_VSAM1, <<arch_diff_child.annotated_path (ca_child_diff.path, display_language, True)>>)

					elseif not ca_child_diff.is_single and ca_in_flat_anc.is_single then
						add_error ({ADL_MESSAGES_IDS}.ec_VSAM2, <<arch_diff_child.annotated_path (ca_child_diff.path, display_language, True)>>)

					elseif not ca_child_diff.existence_conforms_to (ca_in_flat_anc) then
						check attached ca_child_diff.existence as ccd_ex and then attached ca_in_flat_anc.existence as cpf_ex then
							add_error ({ADL_MESSAGES_IDS}.ec_VSANCE, <<arch_diff_child.annotated_path (ca_child_diff.path, display_language, True),
								ccd_ex.as_string, arch_diff_child.annotated_path (ca_in_flat_anc.path, display_language, True),
								cpf_ex.as_string>>)
						end

					elseif not ca_child_diff.cardinality_conforms_to (ca_in_flat_anc) then
						check attached ca_child_diff.cardinality as ccd_card and then attached ca_in_flat_anc.cardinality as cpf_card then
							add_error ({ADL_MESSAGES_IDS}.ec_VSANCC, <<arch_diff_child.annotated_path (ca_child_diff.path, display_language, True),
								ccd_card.as_string, arch_diff_child.annotated_path (ca_in_flat_anc.path, display_language, True),
								cpf_card.as_string>>)
						end
					end
				end

			elseif attached {C_OBJECT} a_c_node as co_child_diff then
				create apa.make (co_child_diff.og_path)
				co_in_flat_anc := arch_flat_parent.object_at_path (apa.path_at_level (arch_flat_parent.specialisation_depth))
				co_child_annotated_path := arch_diff_child.annotated_path (co_child_diff.path, display_language, True)
				co_flat_anc_annotated_path := arch_diff_child.annotated_path (co_in_flat_anc.path, display_language, True)
debug ("validate")
	io.put_string (">>>>> validate: C_OBJECT in child at " + co_child_annotated_path)
end
				--------------------------------------------------------------------------------------------------------------
				-- this block of tests check conformance for specific cases when the child and parent AOM types are different.
				--------------------------------------------------------------------------------------------------------------

				-- C_ARCHETYPE_ROOT specialises (i.e. fills) an ARCHETYPE_SLOT
				if attached {C_ARCHETYPE_ROOT} co_child_diff as car and attached {ARCHETYPE_SLOT} co_in_flat_anc as parent_slot then
					if flat_parent_slot_fillers_index.has (parent_slot.path) then
						if not archetype_ref_matches_slot (car.archetype_ref, parent_slot) then -- doesn't match the slot definition
							add_error ({ADL_MESSAGES_IDS}.ec_VARXS, <<co_child_annotated_path, car.archetype_ref>>)

						-- matches def, but not found in actual list from current repo
						elseif not slot_filler_valid (parent_slot.path, car.archetype_ref) then
							add_error ({ADL_MESSAGES_IDS}.ec_VARXR, <<co_child_annotated_path, car.archetype_ref>>)

						-- filler id is not specialised
						elseif specialisation_depth_from_code (car.node_id) /= arch_diff_child.specialisation_depth then
							add_error ({ADL_MESSAGES_IDS}.ec_VARXID, <<car.node_id, co_child_annotated_path, parent_slot.node_id>>)
						end
					else
						add_error ({ADL_MESSAGES_IDS}.ec_compiler_unexpected_error, <<generator + ".specialised_node_validate location 3; descriptor does not have slot match list">>)
					end

				-- ARCHETYPE_SLOT redefines ARCHETYPE_SLOT
				elseif attached {ARCHETYPE_SLOT} co_child_diff as child_slot and attached {ARCHETYPE_SLOT} co_in_flat_anc as parent_slot then
					if not child_slot.node_id.same_string (parent_slot.node_id) then
						add_error ({ADL_MESSAGES_IDS}.ec_VDSSID, <<child_slot.node_id, co_child_annotated_path, parent_slot.node_id>>)
					end

				-- C_ARCHETYPE_ROOT redefines C_ARCHETYPE_ROOT
				elseif attached {C_ARCHETYPE_ROOT} co_child_diff as car and attached {C_ARCHETYPE_ROOT} co_in_flat_anc as parent_car then
					if attached current_library.archetype_matching_ref (car.archetype_ref) as att_matched_child then
						-- matching archetype exists, but not same as or else in lineage of parent archetype
						if not car.archetype_ref.is_equal (parent_car.archetype_ref) then
							-- the following attachment has to work, because the parent is already validated
							if attached current_library.archetype_matching_ref (parent_car.archetype_ref) as att_matched_parent then
								if not att_matched_child.has_ancestor_descriptor (att_matched_parent) then
									add_error ({ADL_MESSAGES_IDS}.ec_VARXAV, <<co_child_annotated_path, car.archetype_ref, parent_car.archetype_ref>>)
								end
							end
						end
					else
						add_error ({ADL_MESSAGES_IDS}.ec_VARXRA, <<co_child_annotated_path, car.archetype_ref>>)
					end

				-- where C_COMPLEX_OBJECT redefines a C_COMPLEX_OBJECT_PROXY
				-- if the child is a redefine of a use_node (internal ref), then we have to do the comparison to the use_node target - so
				-- we re-assign co_in_flat_anc to point to the target structure; unless they both are use_nodes, in which case leave them as is
				elseif attached {C_COMPLEX_OBJECT} co_child_diff and attached {C_COMPLEX_OBJECT_PROXY} co_in_flat_anc as air_p then
					if attached arch_flat_parent.object_at_path (air_p.path) as cpf then
						co_in_flat_anc := cpf
					else
						add_error ({ADL_MESSAGES_IDS}.ec_VSUNT, <<co_child_annotated_path, co_child_diff.generating_type.name, co_flat_anc_annotated_path, co_in_flat_anc.generating_type.name>>)
					end

				-- a C_COMPLEX_OBJECT with any_allowed = True to be redefined into anything. (Basic conformance - RM type, occurrences - checked below)
				elseif attached {C_COMPLEX_OBJECT} co_in_flat_anc as cco_flat and then cco_flat.any_allowed then
					-- nothing to do

				-- else the AOM meta-types must be the same
				elseif dynamic_type (co_child_diff) /= dynamic_type (co_in_flat_anc) then
					add_error ({ADL_MESSAGES_IDS}.ec_VSONT, <<co_child_diff.rm_type_name, co_child_annotated_path, co_child_diff.generating_type.name, co_in_flat_anc.rm_type_name,
						co_flat_anc_annotated_path, co_in_flat_anc.generating_type.name>>)
				end


				-------------------------------------------------------------------------------------------------------
				-- now do generic tests that apply to all AOM node types.
				-------------------------------------------------------------------------------------------------------
				if passed then
					-- Now evaluate c_conforms_to() function
					if not co_child_diff.c_conforms_to (co_in_flat_anc, agent ref_model.type_conforms_to) then

						-- RM type non-conformance was the reason
						if not ref_model.type_conforms_to (co_child_diff.rm_type_name, co_in_flat_anc.rm_type_name) then
							add_error ({ADL_MESSAGES_IDS}.ec_VSONCT, <<co_child_annotated_path, co_child_diff.rm_type_name, co_flat_anc_annotated_path, co_in_flat_anc.rm_type_name>>)

						-- occurrences non-conformance was the reason
						elseif not co_child_diff.occurrences_conforms_to (co_in_flat_anc) then
							add_error ({ADL_MESSAGES_IDS}.ec_VSONCO, <<co_child_annotated_path, co_child_diff.occurrences_as_string, co_flat_anc_annotated_path, co_in_flat_anc.occurrences.as_string>>)

						-- node id non-conformance value mismatch was the reason
						elseif not co_child_diff.node_id_conforms_to (co_in_flat_anc) then
							add_error ({ADL_MESSAGES_IDS}.ec_VSONI, <<co_child_annotated_path, co_child_diff.node_id, co_flat_anc_annotated_path, co_in_flat_anc.node_id>>)

						-- leaf object value redefinition
						elseif attached {C_PRIMITIVE_OBJECT} co_child_diff as cpo_child and attached {C_PRIMITIVE_OBJECT} co_in_flat_anc as cpo_flat then
							add_error ({ADL_MESSAGES_IDS}.ec_VPOV, <<cpo_child.rm_type_name, co_child_annotated_path, cpo_child.as_string, cpo_flat.as_string, cpo_flat.rm_type_name, co_flat_anc_annotated_path>>)
						else
							add_error ({ADL_MESSAGES_IDS}.ec_VUNK, <<co_child_diff.rm_type_name, co_child_annotated_path, co_in_flat_anc.rm_type_name, co_flat_anc_annotated_path>>)

						end

					-- process nodes that redefine multiple-occurrence object nodes
					elseif attached co_child_diff.parent as ca_child and then attached co_in_flat_anc.occurrences as co_anc_occ
							and then co_anc_occ.is_multiple
							and then not ca_child.collective_occurrences_of (co_in_flat_anc, agent ref_model.property_object_multiplicity).intersects (co_anc_occ) then
						add_error ({ADL_MESSAGES_IDS}.ec_VSONCOm, <<co_child_annotated_path, ca_child.collective_occurrences_of (co_in_flat_anc, agent ref_model.property_object_multiplicity).as_string, co_flat_anc_annotated_path, co_in_flat_anc.occurrences.as_string>>)

					else
						-- deal with any tuples under C_COMPLEX_OBJECTs
						if attached {C_COMPLEX_OBJECT} co_child_diff as cco_child and then attached {C_COMPLEX_OBJECT} co_in_flat_anc as cco_flat and then
							attached cco_child.attribute_tuples as child_tuples and then attached cco_flat.attribute_tuples as flat_tuples
						then
							across child_tuples as child_tuples_csr loop
								if cco_flat.has_comparable_attribute_tuple (child_tuples_csr.item) then
									comparable_flat_tuple := cco_flat.comparable_attribute_tuple (child_tuples_csr.item)
									if not child_tuples_csr.item.c_conforms_to (comparable_flat_tuple, agent ref_model.type_conforms_to) then
										add_error ({ADL_MESSAGES_IDS}.ec_VTPNC, <<co_child_diff.rm_type_name, co_child_annotated_path, child_tuples_csr.item.signature, co_flat_anc_annotated_path>>)
									end
								else
									across child_tuples_csr.item as child_tuple_attrs_csr loop
										if cco_flat.has_attribute (child_tuple_attrs_csr.item.rm_attribute_name) then
											add_error ({ADL_MESSAGES_IDS}.ec_VTPIN, <<co_child_diff.rm_type_name, co_child_annotated_path, child_tuples_csr.item.signature,
												child_tuple_attrs_csr.item.rm_attribute_name, co_flat_anc_annotated_path>>)
										end
									end
								end
							end
						end

						-- deal with sibling marker on C_OBJECTs that are redefines of nodes in flat parent
						if attached co_child_diff.sibling_order as att_so and then not co_in_flat_anc.parent.has_child_with_id (att_so.sibling_node_id) then
							add_error ({ADL_MESSAGES_IDS}.ec_VSSM, <<co_child_annotated_path, att_so.sibling_node_id>>)
						end
					end
				end
			end
		end

	specialised_node_validate_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- return True if a conformant path of a_c_node within the differential archetype is
			-- found within the flat ancestor archetype - i.e. a_c_node is inherited or redefined from ancestor (but not new)
			-- and no previous errors encountered
		local
			apa: ARCHETYPE_PATH_ANALYSER
			flat_anc_path, co_child_annotated_path: STRING
			ca_in_flat_anc: C_ATTRIBUTE
			flat_anc_obj: C_OBJECT
		do
			-- if it is a C_ARCHETYPE_ROOT, it is either a slot filler or an external reference. If the former, it is
			-- redefining an ARCHETYPE_SLOT node, and needs to be validated; if the latter it is a new node, and will
			-- only have been RM-validated. Either way, we need to use the slot path it replaces rather than its literal path,
			-- to determine if it has a corresponding node in the flat ancestor.
			if passed then
				-- ignore second order constrained object nodes
				if attached {C_OBJECT} a_c_node as c_obj and then (c_obj.is_root or else not (attached c_obj.parent as c_attr and then c_attr.is_second_order_constrained)) then
					co_child_annotated_path := arch_diff_child.annotated_path (c_obj.path, display_language, True)

					-- is it an overlay or new node; if overlay, then check it
					if specialisation_depth_from_code (c_obj.node_id) <= arch_flat_parent.specialisation_depth or else 	-- node with node_id from previous level OR
						is_redefined_code (c_obj.node_id) 						-- node id refined (i.e. not new)
					then
						-- either the path can't in principle exist in the flat ancestor (phantom path) or
						-- else it might be possible, but not actually exist. Only if it actually exists is
						-- the result True.
						create apa.make (a_c_node.og_path)
						if not apa.is_phantom_path_at_level (arch_flat_parent.specialisation_depth) then
							flat_anc_path := apa.path_at_level (arch_flat_parent.specialisation_depth)
							Result := arch_flat_parent.has_object_path (flat_anc_path)
							if Result then
								flat_anc_obj := arch_flat_parent.object_at_path (flat_anc_path)
								if c_obj.is_prohibited then
									if dynamic_type (c_obj) /= dynamic_type (flat_anc_obj) then
										add_error ({ADL_MESSAGES_IDS}.ec_VSONPT, <<co_child_annotated_path, c_obj.generating_type.name, flat_anc_obj.generating_type.name>>)
									elseif not flat_anc_obj.node_id.is_equal (c_obj.node_id) then
										add_error ({ADL_MESSAGES_IDS}.ec_VSONPI, <<co_child_annotated_path, flat_anc_obj.node_id>>)
									end
								end

							-- FIXME: at the moment all C_PRIMITIVE_OBJECTs have code id9999 created by the parser, so they don't
							-- obey the proper specialisation level rules
							elseif not attached {C_PRIMITIVE_OBJECT} c_obj then
								-- Since we already know above that the node code is either an inherited code, or else a redefined code
								-- it should have a matching node in flat ancestor; if it doesn't, it's an error
								add_error ({ADL_MESSAGES_IDS}.ec_VSONIN, <<c_obj.node_id, c_obj.rm_type_name, co_child_annotated_path,
									arch_diff_child.annotated_path (flat_anc_path, display_language, True)>>)
							end

						-- in this case, check if the node code appears to be a redefine at this level, which would be an error
						elseif specialisation_status_from_code (c_obj.node_id, arch_diff_child.specialisation_depth) = ss_redefined then
							add_error ({ADL_MESSAGES_IDS}.ec_VSONIN, <<c_obj.node_id, c_obj.rm_type_name, co_child_annotated_path, "(none)">>)
						end

					-- special checks if it is a non-overlay node...
					else
						-- if it has a sibling order, check that the sibling order refers to a valid node in the flat ancestor.
						if attached c_obj.sibling_order as sib_ord then
							create apa.make (a_c_node.parent.og_path)
							ca_in_flat_anc := arch_flat_parent.attribute_at_path (apa.path_at_level (arch_flat_parent.specialisation_depth))
							if not (ca_in_flat_anc.has_child_with_id (sib_ord.sibling_node_id) or else
								ca_in_flat_anc.has_child_with_id (code_at_level (sib_ord.sibling_node_id, arch_flat_parent.specialisation_depth)))
							then
								add_error ({ADL_MESSAGES_IDS}.ec_VSSM, <<co_child_annotated_path, sib_ord.sibling_node_id>>)
							end
						end

						-- if it has occurrences matches {0}, it's an error because this can only make sense for nodes that exist
						if c_obj.is_prohibited then
							add_error ({ADL_MESSAGES_IDS}.ec_VSONPO, <<co_child_annotated_path>>)
						end
debug ("validate")
	io.put_string ("????? specialised_node_validate_test: C_OBJECT at " +
		co_child_annotated_path + " ignored %N")
end
					end

				elseif attached {C_ATTRIBUTE} a_c_node as ca and then not ca.is_second_order_constrained then
					-- consider a C_ATTRIBUTE path to be an overlay path if either it exists in flat ancestor
					-- or its C_OBJECT parent path exists in flat ancestor
					create apa.make (a_c_node.og_path)
					Result := not apa.is_phantom_path_at_level (arch_flat_parent.specialisation_depth) and then
						arch_flat_parent.has_path (apa.path_at_level (arch_flat_parent.specialisation_depth))
				end
			end
		end

	validate_reference_model
			-- validate definition of archetype against reference model
		local
			def_it: C_ITERATOR
		do
			invalid_types.wipe_out
			create def_it.make (arch_diff_child.definition)
			def_it.do_until_surface (agent rm_node_validate, agent rm_node_validate_test)
		end

	rm_node_validate (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		local
			attr_rm_type_in_flat_anc, rm_attr_type: STRING
			apa: ARCHETYPE_PATH_ANALYSER
			rm_prop_def: BMM_PROPERTY
			bmm_enum: BMM_ENUMERATION
			vcormt_fail: BOOLEAN
		do
			if attached {C_OBJECT} a_c_node as co then
				-- now check if this object is a valid type of its owning attribute
				if attached co.parent as att_parent_ca then
					if att_parent_ca.has_differential_path then
						check attached att_parent_ca.differential_path as diff_path then
							create apa.make_from_string (diff_path)
						end
						attr_rm_type_in_flat_anc := arch_flat_parent.object_at_path (apa.path_at_level (arch_flat_parent.specialisation_depth)).rm_type_name
					else
						attr_rm_type_in_flat_anc := att_parent_ca.parent.rm_type_name
					end

					if not invalid_types.has (attr_rm_type_in_flat_anc) then
						if ref_model.has_property (attr_rm_type_in_flat_anc, co.parent.rm_attribute_name) then
							rm_attr_type := ref_model.effective_property_type (attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name)

							-- check for exact conformance, if not, check for various kinds of exceptions on C_PRIMITIVE_OBJECTs
							if not ref_model.ms_conformant_property_type (attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name, co.rm_type_name) then
								if attached {C_PRIMITIVE_OBJECT} co as cpo then

									-- check for type equivalance, which occurs with primitive types, e.g. the AOM 'REAL' type
									-- will match RM 'Real', 'Real32', 'Real64', and 'Double' types if these equivalences are encoded into the AOM_PROFILE
									-- rm_aom_primitive_type_equivalences table. If one is found, that type is written into the C_PRIMITIVE_OBJECT.rm_type_name
									if has_rm_aom_type_mapping (rm_attr_type, co.generator) then
										co.set_rm_type_name (rm_attr_type)

									-- check if the property type is an enumeration and if the archetype node rm_type_name is
									-- a compatible primitive type
									elseif ref_model.is_enumerated_type (rm_attr_type) then
										bmm_enum := ref_model.enumeration_definition (rm_attr_type)

										-- if the enumerated type was parsed in short form of a primitive (i.e. no class name) then
										-- its type in the C_PRIMITIVE_OBJECT will just be Integer or String. This can be reset
										-- from the RM.
										if bmm_enum.underlying_type_name.is_case_insensitive_equal (co.rm_type_name) then
											if attached {C_INTEGER} co as c_int and attached {BMM_ENUMERATION_INTEGER} bmm_enum as bmm_enum_int then
												c_int.set_rm_type_name (rm_attr_type)
												c_int.set_enumerated_type_constraint
												from c_int.enumeration_values.start until c_int.enumeration_values.off or not bmm_enum_int.has_value (c_int.enumeration_values.item) loop
													c_int.enumeration_values.forth
												end
												if not c_int.enumeration_values.off then
													add_error ({ADL_MESSAGES_IDS}.ec_VCORMENV, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, display_language, True),
														rm_attr_type, attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name, c_int.enumeration_values.item.out>>)
												end

											elseif attached {C_STRING} co as c_str and attached {BMM_ENUMERATION_STRING} bmm_enum as bmm_enum_str then
												c_str.set_rm_type_name (rm_attr_type)
												c_str.set_enumerated_type_constraint
												from c_str.constraint.start until c_str.constraint.off or not bmm_enum_str.has_value (c_str.constraint.item) loop
													c_str.constraint.forth
												end
												if not c_str.constraint.off then
													add_error ({ADL_MESSAGES_IDS}.ec_VCORMENV, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, display_language, True),
														rm_attr_type, attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name, c_str.constraint.item>>)
												end

											else
												-- error - unsupported subtype of BMM_ENUMERATION
												add_error ({ADL_MESSAGES_IDS}.ec_VCORMEN, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, display_language, True),
													rm_attr_type, attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name>>)
											end

										-- otherwise the enum was parsed in regular form, and its type name was included; here we
										-- check that the type name matches that in the RM.
										elseif not rm_attr_type.is_case_insensitive_equal (co.rm_type_name) then

											-- node RM type doesn't conform
											add_error ({ADL_MESSAGES_IDS}.ec_VCORMENU, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, display_language, True),
												rm_attr_type, attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name>>)
										end

									-- check for type substitutions e.g. ISO8601_DATE appears in the archetype but the RM
									-- has a String field (possibly within some other kind of DATE class)
									elseif has_type_substitution (co.rm_type_name, rm_attr_type) then
										add_info ({ADL_MESSAGES_IDS}.ec_ICORMTS, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, display_language, True),
											rm_attr_type, attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name>>)
										co.set_rm_type_name (rm_attr_type)

									else
										vcormt_fail := True
									end
								else
									vcormt_fail := True
								end
								if vcormt_fail then
									add_error ({ADL_MESSAGES_IDS}.ec_VCORMT, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, display_language, True),
										rm_attr_type, attr_rm_type_in_flat_anc, att_parent_ca.rm_attribute_name>>)
									invalid_types.extend (co.rm_type_name)
								end
							end
						else
							add_error ({ADL_MESSAGES_IDS}.ec_VCARM, <<att_parent_ca.rm_attribute_name, arch_diff_child.annotated_path (co.path, display_language, True),
								attr_rm_type_in_flat_anc>>)
						end
					end
				end
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				if ca.has_differential_path then
					check attached ca.differential_path as diff_path then
						create apa.make_from_string (diff_path)
					end
					attr_rm_type_in_flat_anc := arch_flat_parent.object_at_path (apa.path_at_level (arch_flat_parent.specialisation_depth)).rm_type_name
				else
					attr_rm_type_in_flat_anc := ca.parent.rm_type_name -- can be a generic type like DV_INTERVAL <DV_QUANTITY>
				end
				if not ref_model.has_property (attr_rm_type_in_flat_anc, ca.rm_attribute_name) then
					add_error ({ADL_MESSAGES_IDS}.ec_VCARM, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, display_language, True), attr_rm_type_in_flat_anc>>)
				else
					rm_prop_def := ref_model.property_definition (attr_rm_type_in_flat_anc, ca.rm_attribute_name)
					if attached ca.existence as ca_ex then
						if not rm_prop_def.existence.contains (ca_ex) then
							if not arch_diff_child.is_specialised and rm_prop_def.existence.is_equal (ca_ex) then
								add_warning ({ADL_MESSAGES_IDS}.ec_WCAEX, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, display_language, True),
									ca_ex.as_string>>)
								if not validation_strict then
									ca.remove_existence
								end
							else
								add_error ({ADL_MESSAGES_IDS}.ec_VCAEX, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, display_language, True),
									ca_ex.as_string, rm_prop_def.existence.as_string>>)
							end
						end
					end
					if ca.is_multiple then
						-- RM also has container property here
						if attached ca.cardinality as ca_card then
							if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def then
								if not rm_cont_prop_def.cardinality.contains (ca_card.interval) then
									if rm_cont_prop_def.cardinality.is_equal (ca_card.interval) then
										if validation_strict then
											add_error ({ADL_MESSAGES_IDS}.ec_VCACA, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, display_language, True),
												ca_card.interval.as_string, rm_cont_prop_def.cardinality.as_string>>)
										else
											add_warning ({ADL_MESSAGES_IDS}.ec_WCACA, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, display_language, True),
												ca_card.interval.as_string>>)
											ca.remove_cardinality
										end
									else
										add_error ({ADL_MESSAGES_IDS}.ec_VCACA, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, display_language, True),
											ca_card.interval.as_string, rm_cont_prop_def.cardinality.as_string>>)
									end
								end
							else -- archetype has multiple attribute but RM does not
								add_error ({ADL_MESSAGES_IDS}.ec_VCAMm, <<arch_diff_child.annotated_path (ca.path, display_language, True), ca_card.as_string>>)
							end
						end

					-- archetype attribute is single-valued, but RM has a container attribute
					elseif attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def then
						add_error ({ADL_MESSAGES_IDS}.ec_VCAMs, <<arch_diff_child.annotated_path (ca.path, display_language, True),
							rm_cont_prop_def.cardinality.as_string>>)
					end

					if rm_prop_def.is_computed then
						-- flag if this is a computed property constraint (i.e. a constraint on a function from the RM)
						add_warning ({ADL_MESSAGES_IDS}.ec_WCARMC, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, display_language, True),
							attr_rm_type_in_flat_anc>>)
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
		do
			Result := True
			if attached {C_OBJECT} a_c_node as co and then not ref_model.has_class_definition (co.rm_type_name) and then
				not invalid_types.has (co.rm_type_name) and then not has_any_type_substitution (co.rm_type_name)
			then
				add_error ({ADL_MESSAGES_IDS}.ec_VCORM, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, display_language, True)>>)
				invalid_types.extend (co.rm_type_name)
				Result := False
			elseif attached {C_ATTRIBUTE} a_c_node then
				-- nothing special to do
			end
		end

end


