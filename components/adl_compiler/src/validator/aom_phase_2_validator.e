note
	component:   "openEHR ADL Tools"
	description: "[
				 Phase 2 validation: validate archetype with respect to flat ancestor archetype, in the case 
				 of specialised archetypes.
		         ]"
	keywords:    "constraint model, AOM, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_2_VALIDATOR

inherit
	AOM_VALIDATOR
		redefine
			validate
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

	is_validation_candidate (ara: ARCH_LIB_ARCHETYPE): BOOLEAN
		do
			Result := attached ara.differential_archetype
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

			-- validation requiring valid specialisation ancestor
			if passed then
				if arch_diff_child.is_specialised then
					validate_specialised_basics
					validate_specialised_definition
				end
				validate_rules
			end
		end

feature {NONE} -- Implementation

	validate_rules
			-- validate the rules if any, which entails checking that all path references are valid against
			-- the flat archetype if specialised
			-- update ASSERTION EXPR_ITEM_LEAF object reference nodes with proper type names
			-- obtained from the AOM objects pointed to
		local
			arch_rm_type_name, ref_rm_type_name, arch_path: detachable STRING
			tail_path: STRING
			bmm_class: BMM_CLASS
			og_tail_path: OG_PATH
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
					elseif attached arch_flat_anc and then attached arch_flat_anc.matching_path (ref_path_csr.key) as p then
						arch_path := p
						if arch_flat_anc.has_object_path (arch_path) then
							object_at_matching_path := arch_flat_anc.object_at_path (arch_path)
						end
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
									ref_rm_type_name := bmm_prop.type.base_class.name
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

	validate_specialised_basics
			-- make sure specialised archetype basic relationship to flat ancestor is valid
		require
			Target_specialised: arch_diff_child.is_specialised
		do
			if not arch_diff_child.languages_available.is_subset (arch_flat_anc.languages_available) then
				add_error (ec_VALC, <<arch_diff_child.languages_available_out, arch_flat_anc.languages_available_out>>)
			end
		end

	validate_specialised_definition
			-- validate definition of specialised archetype against flat ancestor
		require
			Target_specialised: arch_diff_child.is_specialised
		local
			def_it: C_ITERATOR
		do
			ancestor_slot_id_index := child_desc.specialisation_ancestor.slot_id_index
			create def_it.make (arch_diff_child.definition)
			def_it.do_if (agent specialised_node_validate, agent specialised_node_validate_test)
		end

	ancestor_slot_id_index: HASH_TABLE [ARRAYED_SET[STRING], STRING]
		attribute
			create Result.make (0)
		end

	slot_filler_archetype_id_exists (a_slot_path, a_filler_archetype_id: STRING): BOOLEAN
			-- Return true if, for a slot path that is known in the ancestor slot index, there are
			-- actually archetypes whose ids match
		require
			ancestor_slot_id_index.has (a_slot_path)
		local
			ids: ARRAYED_SET[STRING]
		do
			check attached ancestor_slot_id_index.item (a_slot_path) as att_ids then
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
				create apa.make_from_string (a_c_node.path)
				ca_path_in_flat := apa.path_at_level (arch_flat_anc.specialisation_depth)
				ca_in_flat_anc := arch_flat_anc.attribute_at_path (ca_path_in_flat)

				if not ca_child_diff.c_conforms_to (ca_in_flat_anc, agent rm_schema.type_conforms_to) then
					if ca_child_diff.is_single and not ca_in_flat_anc.is_single then
						add_error (ec_VSAM1, <<arch_diff_child.annotated_path (ca_child_diff.path, child_desc.archetype_view_language, True)>>)

					elseif not ca_child_diff.is_single and ca_in_flat_anc.is_single then
						add_error (ec_VSAM2, <<arch_diff_child.annotated_path (ca_child_diff.path, child_desc.archetype_view_language, True)>>)

					elseif not ca_child_diff.existence_conforms_to (ca_in_flat_anc) then
						check attached ca_child_diff.existence as ccd_ex and then attached ca_in_flat_anc.existence as cpf_ex then
							add_error (ec_VSANCE, <<arch_diff_child.annotated_path (ca_child_diff.path, child_desc.archetype_view_language, True),
								ccd_ex.as_string, arch_diff_child.annotated_path (ca_in_flat_anc.path, child_desc.archetype_view_language, True),
								cpf_ex.as_string>>)
						end

					elseif not ca_child_diff.cardinality_conforms_to (ca_in_flat_anc) then
						check attached ca_child_diff.cardinality as ccd_card and then attached ca_in_flat_anc.cardinality as cpf_card then
							add_error (ec_VSANCC, <<arch_diff_child.annotated_path (ca_child_diff.path, child_desc.archetype_view_language, True),
								ccd_card.as_string, arch_diff_child.annotated_path (ca_in_flat_anc.path, child_desc.archetype_view_language, True),
								cpf_card.as_string>>)
						end
					end
				end

			-- deal with C_ARCHETYPE_ROOT (slot filler) inheriting from ARCHETYPE_SLOT; or redefined external references
			elseif attached {C_OBJECT} a_c_node as co_child_diff then
				create apa.make_from_string (co_child_diff.path)
				co_in_flat_anc := arch_flat_anc.object_at_path (apa.path_at_level (arch_flat_anc.specialisation_depth))
				co_child_annotated_path := arch_diff_child.annotated_path (co_child_diff.path, child_desc.archetype_view_language, True)
				co_flat_anc_annotated_path := arch_diff_child.annotated_path (co_in_flat_anc.path, child_desc.archetype_view_language, True)
debug ("validate")
	io.put_string (">>>>> validate: C_OBJECT in child at " + co_child_annotated_path)
end
				--------------------------------------------------------------------------------------------------------------
				-- this block of tests check conformance for specific cases when the child and parent AOM types are different.
				--------------------------------------------------------------------------------------------------------------

				-- test conformance specific to C_ARCHETYPE_ROOT where C_ARCHETYPE_ROOT redefines ARCHETYPE_SLOT
				if attached {C_ARCHETYPE_ROOT} co_child_diff as car and attached {ARCHETYPE_SLOT} co_in_flat_anc as a_slot then
					if ancestor_slot_id_index.has (a_slot.path) then
						if not archetype_id_matches_slot (car.archetype_ref, a_slot) then -- doesn't match the slot definition
							add_error (ec_VARXS, <<co_child_annotated_path, car.archetype_ref>>)

						-- matches def, but not found in actual list from current repo
						elseif not slot_filler_archetype_id_exists (a_slot.path, car.archetype_ref) then
							add_error (ec_VARXR, <<co_child_annotated_path, car.archetype_ref>>)
						end
					else
						add_error (ec_compiler_unexpected_error, <<generator + ".specialised_node_validate location 3; descriptor does not have slot match list">>)
					end

				-- where C_ARCHETYPE_ROOT redefines C_ARCHETYPE_ROOT
				elseif attached {C_ARCHETYPE_ROOT} co_child_diff as car and attached {C_ARCHETYPE_ROOT} co_in_flat_anc as parent_car then
					-- no archetype matches this ref
					if not current_library.has_archetype_id_for_ref (car.archetype_ref) then
						add_error (ec_VARXRA, <<co_child_annotated_path, car.archetype_ref>>)

					-- matching archetype exists, but not same as or else in lineage of parent archetype
					elseif not car.archetype_ref.is_equal (parent_car.archetype_ref) and
						not current_library.matching_archetype (car.archetype_ref).has_ancestor_descriptor (current_library.matching_archetype (parent_car.archetype_ref))
					then
						add_error (ec_VARXAV, <<co_child_annotated_path, car.archetype_ref, parent_car.archetype_ref>>)
					end

				-- where C_COMPLEX_OBJECT redefines a C_COMPLEX_OBJECT_PROXY
				-- if the child is a redefine of a use_node (internal ref), then we have to do the comparison to the use_node target - so
				-- we re-assign co_in_flat_anc to point to the target structure; unless they both are use_nodes, in which case leave them as is
				elseif attached {C_COMPLEX_OBJECT} co_child_diff and attached {C_COMPLEX_OBJECT_PROXY} co_in_flat_anc as air_p then
					if attached arch_flat_anc.object_at_path (air_p.path) as cpf then
						co_in_flat_anc := cpf
					else
						add_error (ec_VSUNT, <<co_child_annotated_path, co_child_diff.generating_type, co_flat_anc_annotated_path, co_in_flat_anc.generating_type>>)
					end

				-- allow the case where a C_COMPLEX_OBJECT is redefined into objects including C_COMPLEX_OBJECT_PROXY, as long as parent object
				-- has no children
				elseif attached {C_COMPLEX_OBJECT_PROXY} co_child_diff as air_c and attached {C_COMPLEX_OBJECT} co_in_flat_anc as cco_flat then
					if not cco_flat.any_allowed then
						add_error (ec_VSUNC, <<co_child_annotated_path, co_child_diff.generating_type, co_flat_anc_annotated_path, co_in_flat_anc.generating_type>>)
					end

				-- case where a C_COMPLEX_OBJECT is redefined into a slot, only legal if the C_COMPLEX_OBJECT had no children
				elseif attached {ARCHETYPE_SLOT} co_child_diff as air_c and attached {C_COMPLEX_OBJECT} co_in_flat_anc as cco_flat then
					if not cco_flat.any_allowed then
						add_error (ec_VDSSR, <<co_child_annotated_path>>)
					end

				-- else the AOM meta-types must be the same
				elseif dynamic_type (co_child_diff) /= dynamic_type (co_in_flat_anc) then
					add_error (ec_VSONT, <<co_child_diff.rm_type_name, co_child_annotated_path, co_child_diff.generating_type, co_in_flat_anc.rm_type_name,
						co_flat_anc_annotated_path, co_in_flat_anc.generating_type>>)
				end


				-------------------------------------------------------------------------------------------------------
				-- now do generic tests that apply to all AOM node types.
				-------------------------------------------------------------------------------------------------------
				if passed then
					-- Now evaluate c_conforms_to() function
					if not co_child_diff.c_conforms_to (co_in_flat_anc, agent rm_schema.type_conforms_to) then

						-- RM type non-conformance was the reason
						if not rm_schema.type_conforms_to (co_child_diff.rm_type_name, co_in_flat_anc.rm_type_name) then
							add_error (ec_VSONCT, <<co_child_annotated_path, co_child_diff.rm_type_name, co_flat_anc_annotated_path, co_in_flat_anc.rm_type_name>>)

						-- occurrences non-conformance was the reason
						elseif not co_child_diff.occurrences_conforms_to (co_in_flat_anc) then
							add_error (ec_VSONCO, <<co_child_annotated_path, co_child_diff.occurrences_as_string, co_flat_anc_annotated_path, co_in_flat_anc.occurrences.as_string>>)

						-- node id non-conformance value mismatch was the reason
						elseif not co_child_diff.node_id_conforms_to (co_in_flat_anc) then
							add_error (ec_VSONI, <<co_child_annotated_path, co_child_diff.node_id, co_flat_anc_annotated_path, co_in_flat_anc.node_id>>)

						-- leaf object value redefinition
						elseif attached {C_PRIMITIVE_OBJECT} co_child_diff as cpo_child and attached {C_PRIMITIVE_OBJECT} co_in_flat_anc as cpo_flat then
							add_error (ec_VPOV, <<cpo_child.rm_type_name, co_child_annotated_path, cpo_child.as_string, cpo_flat.as_string, cpo_flat.rm_type_name, co_flat_anc_annotated_path>>)
						else
							add_error (ec_VUNK, <<co_child_diff.rm_type_name, co_child_annotated_path, co_in_flat_anc.rm_type_name, co_flat_anc_annotated_path>>)

						end
					else
						-- deal with any tuples under C_COMPLEX_OBJECTs
						if attached {C_COMPLEX_OBJECT} co_child_diff as cco_child and then attached {C_COMPLEX_OBJECT} co_in_flat_anc as cco_flat and then
							attached cco_child.attribute_tuples as child_tuples and then attached cco_flat.attribute_tuples as flat_tuples
						then
							across child_tuples as child_tuples_csr loop
								if cco_flat.has_comparable_attribute_tuple (child_tuples_csr.item) then
									comparable_flat_tuple := cco_flat.comparable_attribute_tuple (child_tuples_csr.item)
									if not child_tuples_csr.item.c_conforms_to (comparable_flat_tuple, agent rm_schema.type_conforms_to) then
										add_error (ec_VTPNC, <<co_child_diff.rm_type_name, co_child_annotated_path, child_tuples_csr.item.signature, co_flat_anc_annotated_path>>)
									end
								else
									across child_tuples_csr.item as child_tuple_attrs_csr loop
										if cco_flat.has_attribute (child_tuple_attrs_csr.item.rm_attribute_name) then
											add_error (ec_VTPIN, <<co_child_diff.rm_type_name, co_child_annotated_path, child_tuples_csr.item.signature,
												child_tuple_attrs_csr.item.rm_attribute_name, co_flat_anc_annotated_path>>)
										end
									end
								end
							end
						end

						-- deal with sibling marker on C_OBJECTs that are redefines of nodes in flat parent
						if attached co_child_diff.sibling_order and then not (co_in_flat_anc.parent.has_child_with_id (co_child_diff.sibling_order.sibling_node_id) or else
							co_in_flat_anc.parent.has_child_with_id (code_at_level (co_child_diff.sibling_order.sibling_node_id, arch_flat_anc.specialisation_depth)))
						then
							add_error (ec_VSSM, <<co_child_annotated_path, co_child_diff.sibling_order.sibling_node_id>>)
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
					co_child_annotated_path := arch_diff_child.annotated_path (c_obj.path, child_desc.archetype_view_language, True)

					-- is it an overlay or new node; if overlay, then check it
					if specialisation_depth_from_code (c_obj.node_id) <= arch_flat_anc.specialisation_depth or else 	-- node with node_id from previous level OR
						is_refined_code (c_obj.node_id) 						-- node id refined (i.e. not new)
					then
						-- either the path can't in principle exist in the flat ancestor (phantom path) or
						-- else it might be possible, but not actually exist. Only if it actually exists is
						-- the result True.
						create apa.make_from_string (a_c_node.path)
						if not apa.is_phantom_path_at_level (arch_flat_anc.specialisation_depth) then
							flat_anc_path := apa.path_at_level (arch_flat_anc.specialisation_depth)
							Result := arch_flat_anc.has_object_path (flat_anc_path)
							if Result then
								flat_anc_obj := arch_flat_anc.object_at_path (flat_anc_path)
								if c_obj.is_prohibited and dynamic_type (c_obj) /= dynamic_type (flat_anc_obj) then
									add_error (ec_VSONPT, <<co_child_annotated_path, c_obj.generating_type, flat_anc_obj.generating_type>>)
								end

							-- FIXME: at the moment all C_PRIMITIVE_OBJECTs have code id9999 created by the parser, so they don't
							-- obey the proper specialisation level rules
							elseif not attached {C_PRIMITIVE_OBJECT} c_obj then
								-- Since we already know above that the node code is either an inherited code, or else a redefined code
								-- it should have a matching node in flat ancestor; if it doesn't, it's an error
								add_error (ec_VSONIN, <<c_obj.node_id, c_obj.rm_type_name, co_child_annotated_path,
									arch_diff_child.annotated_path (flat_anc_path, child_desc.archetype_view_language, True)>>)
							end

						-- in this case, check if the node code appears to be a redefine at this level, which would be an error
						elseif specialisation_status_from_code (c_obj.node_id, arch_diff_child.specialisation_depth) = ss_redefined then
							add_error (ec_VSONIN, <<c_obj.node_id, c_obj.rm_type_name, co_child_annotated_path, "(none)">>)
						end

					-- special checks if it is a non-overlay node...
					else
						-- if it has a sibling order, check that the sibling order refers to a valid node in the flat ancestor.
						if attached c_obj.sibling_order as sib_ord then
							create apa.make_from_string (a_c_node.parent.path)
							ca_in_flat_anc := arch_flat_anc.attribute_at_path (apa.path_at_level (arch_flat_anc.specialisation_depth))
							if not (ca_in_flat_anc.has_child_with_id (sib_ord.sibling_node_id) or else
								ca_in_flat_anc.has_child_with_id (code_at_level (sib_ord.sibling_node_id, arch_flat_anc.specialisation_depth)))
							then
								add_error (ec_VSSM, <<co_child_annotated_path, sib_ord.sibling_node_id>>)
							end
						end

						-- if it has occurrences matches {0}, it's an error because this can only make sense for nodes that exist
						if c_obj.is_prohibited then
							add_error (ec_VSONPO, <<co_child_annotated_path>>)
						end
debug ("validate")
	io.put_string ("????? specialised_node_validate_test: C_OBJECT at " +
		co_child_annotated_path + " ignored %N")
end
					end

				elseif attached {C_ATTRIBUTE} a_c_node as ca and then not ca.is_second_order_constrained then
					-- consider a C_ATTRIBUTE path to be an overlay path if either it exists in flat ancestor
					-- or its C_OBJECT parent path exists in flat ancestor
					create apa.make_from_string (a_c_node.path)
					Result := not apa.is_phantom_path_at_level (arch_flat_anc.specialisation_depth) and then
						arch_flat_anc.has_path (apa.path_at_level (arch_flat_anc.specialisation_depth))
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
			rm_prop_def: BMM_PROPERTY [BMM_TYPE]
			bmm_enum: BMM_ENUMERATION [COMPARABLE]
		do
			if attached {C_OBJECT} a_c_node as co then
				if not co.is_root then -- now check if this object a valid type of its owning attribute
					if arch_diff_child.is_specialised and then co.parent.has_differential_path then
						check attached co.parent.differential_path as diff_path then
							create apa.make_from_string (diff_path)
						end
						attr_rm_type_in_flat_anc := arch_flat_anc.object_at_path (apa.path_at_level (arch_flat_anc.specialisation_depth)).rm_type_name
					else
						attr_rm_type_in_flat_anc := co.parent.parent.rm_type_name
					end

					if not invalid_types.has (attr_rm_type_in_flat_anc) then
						if rm_schema.has_property (attr_rm_type_in_flat_anc, co.parent.rm_attribute_name) then
							rm_attr_type := rm_schema.effective_property_type (attr_rm_type_in_flat_anc, co.parent.rm_attribute_name)

							if not rm_schema.ms_conformant_property_type (attr_rm_type_in_flat_anc, co.parent.rm_attribute_name, co.rm_type_name) then

								-- check if the property type is an enumeration and if the archetype node rm_type_name is
								-- a compatible primitive type
								if rm_schema.enumeration_types.has (rm_attr_type) then
									bmm_enum := rm_schema.enumeration_definition (rm_attr_type)
									if bmm_enum.underlying_type_name.is_case_insensitive_equal (co.rm_type_name) then
										if attached {C_INTEGER} co as c_int and attached {BMM_ENUMERATION_INTEGER} bmm_enum as bmm_enum_int then
											if not across c_int.constraint_values as int_vals_csr all bmm_enum_int.item_values.has (int_vals_csr.item) end then
												add_error (ec_VCORMENV, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, child_desc.archetype_view_language, True),
													rm_attr_type, attr_rm_type_in_flat_anc, co.parent.rm_attribute_name, c_int.single_value.out>>)
											else
												c_int.set_rm_type_name (rm_attr_type)
												c_int.set_enumerated_type_constraint
											end

										elseif attached {C_STRING} co as c_str and attached {BMM_ENUMERATION_STRING} bmm_enum as bmm_enum_str then
											if not across c_str.constraint as str_vals_csr all bmm_enum_str.item_values.has (str_vals_csr.item) end then
												add_error (ec_VCORMENV, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, child_desc.archetype_view_language, True),
													rm_attr_type, attr_rm_type_in_flat_anc, co.parent.rm_attribute_name, c_str.single_value>>)
											else
												c_str.set_rm_type_name (rm_attr_type)
												c_str.set_enumerated_type_constraint
											end

										else
											-- error - unsupported subtype of BMM_ENUMERATION
											add_error (ec_VCORMEN, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, child_desc.archetype_view_language, True),
												rm_attr_type, attr_rm_type_in_flat_anc, co.parent.rm_attribute_name>>)

										end

									else
										-- RM property type is an enumerated type, but current node RM type doesn't conform
										add_error (ec_VCORMENU, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, child_desc.archetype_view_language, True),
											rm_attr_type, attr_rm_type_in_flat_anc, co.parent.rm_attribute_name>>)
									end

								-- check for type substitutions e.g. ISO8601_DATE appears in the archetype but the RM
								-- has a String field (within some other kind of DATE class)
								elseif has_type_substitution (co.rm_type_name, rm_attr_type) then
									add_info (ec_ICORMTS, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, child_desc.archetype_view_language, True),
										rm_attr_type, attr_rm_type_in_flat_anc, co.parent.rm_attribute_name>>)
									co.set_rm_type_name (rm_attr_type)
								else
									add_error (ec_VCORMT, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, child_desc.archetype_view_language, True),
										rm_attr_type, attr_rm_type_in_flat_anc, co.parent.rm_attribute_name>>)
									invalid_types.extend (co.rm_type_name)
								end
							end
						else
							add_error (ec_VCARM, <<co.parent.rm_attribute_name, arch_diff_child.annotated_path (co.parent.path, child_desc.archetype_view_language, True),
								attr_rm_type_in_flat_anc>>)
						end
					end
				end
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				if arch_diff_child.is_specialised and then ca.has_differential_path then
					check attached ca.differential_path as diff_path then
						create apa.make_from_string (diff_path)
					end
					attr_rm_type_in_flat_anc := arch_flat_anc.object_at_path (apa.path_at_level (arch_flat_anc.specialisation_depth)).rm_type_name
				else
					attr_rm_type_in_flat_anc := ca.parent.rm_type_name -- can be a generic type like DV_INTERVAL <DV_QUANTITY>
				end
				if not rm_schema.has_property (attr_rm_type_in_flat_anc, ca.rm_attribute_name) then
					add_error (ec_VCARM, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True), attr_rm_type_in_flat_anc>>)
				else
					rm_prop_def := rm_schema.property_definition (attr_rm_type_in_flat_anc, ca.rm_attribute_name)
					if attached ca.existence as ca_ex then
						if not rm_prop_def.existence.contains (ca_ex) then
							if not arch_diff_child.is_specialised and rm_prop_def.existence.is_equal (ca_ex) then
								add_warning (ec_WCAEX, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
									ca_ex.as_string>>)
								if not validation_strict then
									ca.remove_existence
								end
							else
								add_error (ec_VCAEX, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
									ca_ex.as_string, rm_prop_def.existence.as_string>>)
							end
						end
					end
					if ca.is_multiple then
						-- RM also has container property here
						if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def then
							if attached ca.cardinality as ca_card and then not rm_cont_prop_def.cardinality.contains (ca_card.interval) then
								if rm_cont_prop_def.cardinality.is_equal (ca_card.interval) then
									if validation_strict then
										add_error (ec_VCACA, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
											ca_card.interval.as_string, rm_cont_prop_def.cardinality.as_string>>)
									else
										add_warning (ec_WCACA, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
											ca_card.interval.as_string>>)
										ca.remove_cardinality
									end
								else
									add_error (ec_VCACA, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
										ca_card.interval.as_string, rm_cont_prop_def.cardinality.as_string>>)
								end
							end
						else -- archetype has multiple attribute but RM does not
							add_error (ec_VCAMm, <<arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
								ca.cardinality.as_string>>)
						end

					-- archetype attribute is single-valued, but RM has a container attribute
					elseif attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def then
						add_error (ec_VCAMs, <<arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
							rm_cont_prop_def.cardinality.as_string>>)
					end

					if rm_prop_def.is_computed then
						-- flag if this is a computed property constraint (i.e. a constraint on a function from the RM)
						add_warning (ec_WCARMC, <<ca.rm_attribute_name, arch_diff_child.annotated_path (ca.path, child_desc.archetype_view_language, True),
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
			if attached {C_OBJECT} a_c_node as co and then not rm_schema.has_class_definition (co.rm_type_name) and then
				not invalid_types.has (co.rm_type_name) and then not has_any_type_substitution (co.rm_type_name)
			then
				add_error (ec_VCORM, <<co.rm_type_name, arch_diff_child.annotated_path (co.path, child_desc.archetype_view_language, True)>>)
				invalid_types.extend (co.rm_type_name)
				Result := False
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				-- nothing special to do
			end
		end

end


