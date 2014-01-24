note
	component:   "openEHR ADL Tools"
	description: "Perform post parse construction of the AOM structure."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_POST_PARSE_PROCESSOR

inherit
	ADL_SYNTAX_CONVERTER
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all;
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all;
		end

create
	make

feature -- Definitions

	Adl_14_legacy_fake_code_text: STRING = "@ internal @"

feature {ADL_15_ENGINE, ADL_14_ENGINE} -- Initialisation

	make (a_target: ARCHETYPE; ara: ARCH_CAT_ARCHETYPE; an_rm_schema: BMM_SCHEMA)
			-- set target_descriptor
			-- initialise reporting variables
		require
			ara.compilation_state >= {COMPILATION_STATES}.Cs_parsed
		do
			create rm_schema.make ("test", "test", "1.0")
			create att_c_terminology_code_type_mapping
			initialise (a_target, ara, an_rm_schema)
		end

	initialise (a_target: ARCHETYPE; ara: ARCH_CAT_ARCHETYPE; an_rm_schema: BMM_SCHEMA)
			-- set target_descriptor
			-- initialise reporting variables
		require
			ara.compilation_state >= {COMPILATION_STATES}.Cs_parsed
		do
			if rm_schema /= an_rm_schema then
				rm_schema := an_rm_schema
				if aom_profiles_access.has_profile_for_rm_schema (rm_schema.schema_id) then
					aom_profile := aom_profiles_access.profile_for_rm_schema (rm_schema.schema_id)
				end
				set_domain_type_mappings
			end
			target := a_target
			if ara.is_specialised then
				arch_parent_flat := ara.specialisation_ancestor.flat_archetype
				arch_parent_flat.rebuild
			else
				highest_added_id_code := 0
				highest_added_ac_code := 0
				highest_refined_code_index.wipe_out
			end
		end

feature -- Access

	target: ARCHETYPE
			-- differential archetype being processed

	arch_parent_flat: detachable FLAT_ARCHETYPE

	rm_schema: BMM_SCHEMA

	aom_profile: detachable AOM_PROFILE

feature -- Commands

	execute
		do
			update_aom_mapped_types
			update_lifecycle_state
			extract_value_sets
			add_id_codes
			if target.adl_version.starts_with (Adl_14_version) then
				remove_fake_id_codes
			end
		end

	clear
		do
			c_terminology_code_type_mapping := Void
		end

feature {NONE} -- Implementation

	update_aom_mapped_types
			-- Find any types that have a AOM profile type mapping and write the
			-- mapping in
		local
			def_it: C_ITERATOR
		do
			if attached c_terminology_code_type_mapping as ctc_tm then
				att_c_terminology_code_type_mapping := ctc_tm
				create def_it.make (target.definition)
				def_it.do_all (agent update_aom_mapped_type, Void)
			end
		end

	update_aom_mapped_type (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		do
			if attached {C_TERMINOLOGY_CODE} a_c_node as ctc then
				ctc.set_rm_type_name (att_c_terminology_code_type_mapping.target_class_name)
			end
		end

	update_lifecycle_state
		do
			if attached target.description as att_desc then
				if not valid_resource_lifecycle_state (att_desc.lifecycle_state) and then
					attached aom_profile as att_ap and then att_ap.has_lifecycle_state_mapping (att_desc.lifecycle_state)
				then
					att_desc.set_lifecycle_state (aom_profile.aom_lifecycle_mapping (att_desc.lifecycle_state))
				else
					att_desc.set_lifecycle_state (Initial_resource_lifecycle_state)
				end
			end
		end

	extract_value_sets
			-- when this is called, the value sets are already in the terminology, but with fake ac-codes
			-- A real ac-code needs to be created, written into each value set, and also into the main
			-- terminology term_definitions. The definition text/description is copied from the proximate
			-- id-code going up the tree from the C_TERMINOLOGY_CODE.
		local
			term_vsets: HASH_TABLE [VALUE_SET_RELATION, STRING]
			arch_c_terms: HASH_TABLE [C_TERMINOLOGY_CODE, STRING]
			ac_code, parent_code, parent_ac_code, old_path, path_in_flat, code_number: STRING
			old_ac_code: STRING
			spec_depth: INTEGER
	 		apa: ARCHETYPE_PATH_ANALYSER
	 		parent_ca: C_ATTRIBUTE
	 		og_path: OG_PATH
	 		parent_flat: FLAT_ARCHETYPE
	 		co_csr: C_OBJECT
	 		ctc: C_TERMINOLOGY_CODE
		do
			term_vsets := target.terminology.value_sets
			arch_c_terms := target.term_constraints_index

			if not arch_c_terms.is_empty then
				-- first find highest non-fake ac-code in archetype
				across arch_c_terms as arch_c_terms_csr loop
					if not arch_c_terms_csr.key.starts_with (Fake_adl_14_ac_code_base) then
						spec_depth := specialisation_depth_from_code (arch_c_terms_csr.key)
						code_number := index_from_code_at_level (arch_c_terms_csr.key, spec_depth)
						if spec_depth = 0 then
							highest_added_ac_code := highest_added_ac_code.max (code_number.to_integer)
						else
							parent_code := specialisation_parent_from_code (arch_c_terms_csr.key)
							if not highest_refined_code_index.has (parent_code) then
								highest_refined_code_index.put (code_number.to_integer, parent_code)
							else
								highest_refined_code_index.replace (highest_refined_code_index.item (parent_code).max (code_number.to_integer), parent_code)
							end
						end
					end
				end

				-- update fake ac-codes to real codes and create a new ac-term and add it to terminology
				across arch_c_terms as arch_c_terms_csr loop
					old_ac_code := arch_c_terms_csr.key
					ctc := arch_c_terms_csr.item
					if old_ac_code.starts_with (Fake_adl_14_ac_code_base) then
						-- now determine the new ac-code
			 			create og_path.make_from_string (ctc.path)
			 			og_path.last.set_object_id ("")
			 			old_path := og_path.as_string
		 				ac_code := new_added_constraint_code_at_level (target.specialisation_depth, highest_added_ac_code)
		 				highest_added_ac_code := highest_added_ac_code + 1
			 			if target.is_specialised then
			 				-- generate a path; since the terminal object doesn't currently have any node_id,
			 				-- the path will actually just point to the parent C_ATTRIBUTE
			 				create apa.make_from_string (old_path)
			 				if not apa.is_phantom_path_at_level (target.specialisation_depth - 1) then
				 				path_in_flat := apa.path_at_level (target.specialisation_depth - 1)
				 				check attached arch_parent_flat as att_pf then
				 					parent_flat := att_pf
				 				end
				 				if parent_flat.has_path (path_in_flat) then
				 					parent_ca := parent_flat.attribute_at_path (path_in_flat)
				 					if parent_ca.has_child_with_rm_type_name (ctc.rm_type_name) and then
				 						attached {C_TERMINOLOGY_CODE} parent_ca.child_with_rm_type_name (ctc.rm_type_name) as parent_ctc
				 					then
					 					parent_ac_code := parent_ctc.value_set_code
				 						ac_code := parent_ac_code

				 						-- check if any overrides
					 					if not ctc.c_equal (parent_ctc) then
					 						-- they really are different; use a redefined code instead
					 						if not highest_refined_code_index.has (parent_ac_code) then
					 							highest_refined_code_index.put (1, parent_ac_code)
					 						end
							 				ac_code := new_refined_code_at_level (parent_ac_code, target.specialisation_depth, highest_refined_code_index.item (parent_ac_code))
							 				highest_refined_code_index.replace (highest_refined_code_index.item (parent_ac_code) + 1, parent_ac_code)
					 					end
					 				end
				 				end
			 				end
			 			end
						ctc.set_value_set_code (ac_code)

						-- update value set in terminology
						if term_vsets.has (old_ac_code) then
							term_vsets.replace_key (ac_code, old_ac_code)
							check attached term_vsets.item (ac_code) as vsd then
								vsd.set_origin (ac_code)
							end
						end

						-- obtain the nearest id-code that is defined in the terminology, to use in creating
						-- a new ac-code
						from co_csr := ctc until not co_csr.node_id.is_equal (Primitive_node_id) and not co_csr.node_id.starts_with (fake_adl_14_node_id_base) loop
							if attached co_csr.parent as ca_csr and then attached ca_csr.parent as co then
								co_csr := co
							end
						end
						target.terminology.replicate_term_definition (co_csr.node_id, ac_code)
					end
				end
			end
		end

	set_domain_type_mappings
			-- find out if any mappings exist in an AOM_PROFILE
		do
			if attached aom_profile as att_ap then
				if attached att_ap.aom_rm_type_mappings as aom_tm and then aom_tm.has (bare_type_name (({TERMINOLOGY_CODE}).name)) then
					c_terminology_code_type_mapping := aom_tm.item (bare_type_name (({TERMINOLOGY_CODE}).name))
				else
					clear
				end
			else
				clear
			end
		end

	c_terminology_code_type_mapping: detachable AOM_TYPE_MAPPING

	att_c_terminology_code_type_mapping: AOM_TYPE_MAPPING
			-- logically attached version of c_terminology_code_type_mapping

	add_id_codes
			-- add id-codes on nodes with no code
		local
			def_it: C_ITERATOR
		do
			-- make a copy of current ARCHETYPE_INTERNAL_REFs and rules lists
			-- so that any paths can be corrected
			use_node_index := target.use_node_index
			rules_index := target.rules_index

			if is_valid_code (target.definition.node_id) then
				-- get current highest code ids
				create def_it.make (target.definition)
				def_it.do_all (agent do_get_highest_id_codes_and_paths, Void)

				-- now add missing codes
				def_it.do_all (agent do_add_id_code, Void)

				-- update C_ATTRIBUTE differential paths
				if target.is_specialised and then attached arch_parent_flat as pf then
					def_it.do_all (agent do_rewrite_diff_path (?, ?, pf), Void)
				end
			end
		end

	do_rewrite_diff_path (a_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; parent_flat: FLAT_ARCHETYPE)
		local
	 		apa: ARCHETYPE_PATH_ANALYSER
	 		path_in_flat: STRING
		do
	 		if attached {C_ATTRIBUTE} a_node as ca and then attached ca.differential_path as dp then
	 			create apa.make_from_string (dp)
	 			if not apa.is_phantom_path_at_level (target.specialisation_depth - 1) then
		 			path_in_flat := apa.path_at_level (target.specialisation_depth - 1)
		 			if parent_flat.has_attribute_path (path_in_flat) then
		 				ca.set_differential_path (parent_flat.object_at_path (path_in_flat).path)
		 			end
		 		end
			end
		end

	do_get_highest_id_codes_and_paths (a_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
	 	local
	 		code_number, parent_code: STRING
	 		spec_depth: INTEGER
	 	do
	 		if attached {C_OBJECT} a_node as c_obj and then not attached {C_PRIMITIVE_OBJECT} c_obj and then
	 			is_valid_id_code (c_obj.node_id) and then not c_obj.node_id.starts_with (fake_adl_14_node_id_base)
	 		then
				spec_depth := specialisation_depth_from_code (c_obj.node_id)
				code_number := index_from_code_at_level (c_obj.node_id, spec_depth)
				if spec_depth = 0 then
					highest_added_id_code := highest_added_id_code.max (code_number.to_integer)
				else
					parent_code := specialisation_parent_from_code (c_obj.node_id)
					if not highest_refined_code_index.has (parent_code) then
						highest_refined_code_index.put (code_number.to_integer, parent_code)
					else
						highest_refined_code_index.replace (highest_refined_code_index.item (parent_code).max (code_number.to_integer), parent_code)
					end
				end
			end
		end

	 do_add_id_code (a_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
	 	local
	 		apa: ARCHETYPE_PATH_ANALYSER
	 		path_in_flat, id_code, parent_id_code, old_path, new_path: STRING
	 		parent_flat: FLAT_ARCHETYPE
	 		parent_ca: C_ATTRIBUTE
	 		parent_co: C_OBJECT
	 		og_path: OG_PATH
	 	do
	 		if attached {C_OBJECT} a_node as c_obj and then not attached {C_PRIMITIVE_OBJECT} c_obj and then c_obj.node_id.starts_with (fake_adl_14_node_id_base) then
	 			-- default to a new code; if node is inherited, or redefined an appropriate code will be used
	 			create og_path.make_from_string (c_obj.path)
	 			og_path.last.set_object_id ("")
	 			old_path := og_path.as_string
 				id_code := new_added_id_code_at_level (target.specialisation_depth, highest_added_id_code)
 				highest_added_id_code := highest_added_id_code + 1
	 			if target.is_specialised then
	 				-- generate a path; since the terminal object doesn't currently have any node_id,
	 				-- the path will actually just point to the parent C_ATTRIBUTE
	 				create apa.make_from_string (old_path)
	 				if not apa.is_phantom_path_at_level (target.specialisation_depth - 1) then
		 				path_in_flat := apa.path_at_level (target.specialisation_depth - 1)
		 				check attached arch_parent_flat as att_pf then
		 					parent_flat := att_pf
		 				end
		 				if parent_flat.has_path (path_in_flat) then
		 					parent_ca := parent_flat.attribute_at_path (path_in_flat)
		 					if parent_ca.has_child_with_rm_type_name (c_obj.rm_type_name) then
		 						parent_co := parent_ca.child_with_rm_type_name (c_obj.rm_type_name)
		 						parent_id_code := parent_co.node_id
	 							id_code := parent_id_code

	 							-- initially assume straight inheritance, so that different node_id is not
	 							-- used as a reason for c_equal() to fail
	 							c_obj.parent.replace_node_id (c_obj.node_id, parent_id_code)
		 						if not c_obj.c_equal (parent_co) then
		 							-- they really are different; use a redefined code instead
		 							if not highest_refined_code_index.has (parent_id_code) then
		 								highest_refined_code_index.put (1, parent_id_code)
		 							end
				 					id_code := new_refined_code_at_level (parent_id_code, target.specialisation_depth, highest_refined_code_index.item (parent_id_code))
				 					highest_refined_code_index.replace (highest_refined_code_index.item (parent_id_code) + 1, parent_id_code)
		 						end
			 				end
		 				end
	 				end
	 			end
				c_obj.parent.replace_node_id (c_obj.node_id, id_code)

				-- fix any matching use nodes with this path
				across use_node_index as use_node_idx_csr loop
					if use_node_idx_csr.key.starts_with (old_path) then
						across use_node_idx_csr.item as use_nodes_csr loop
							create new_path.make_from_string (c_obj.path)
							if use_node_idx_csr.key.count > old_path.count then
								new_path.append (use_node_idx_csr.key.substring (old_path.count + 1, use_node_idx_csr.key.count))
							end
							use_nodes_csr.item.set_target_path (new_path)
						end
					end
				end

				-- fix any matching rules nodes with this path
				across rules_index as rules_idx_csr loop
					if rules_idx_csr.key.starts_with (old_path) then
						across rules_idx_csr.item as rules_csr loop
							if rules_csr.item.reference_type = {EXPR_LEAF}.Ref_type_attribute then
								create new_path.make_from_string (c_obj.path)
								if rules_idx_csr.key.count > old_path.count then
									new_path.append (rules_idx_csr.key.substring (old_path.count + 1, rules_idx_csr.key.count))
								end
								rules_csr.item.make_archetype_definition_ref (new_path)
							end
						end
					end
				end

				-- fix any matching annotations nodes with this path
				if attached target.annotations as att_ann then
					att_ann.update_annotation_path (old_path, c_obj.path)
				end
	 		end
	 	end

	highest_added_id_code: INTEGER

	highest_added_ac_code: INTEGER

	highest_refined_code_index: HASH_TABLE [INTEGER, STRING]
			-- Table of current highest code keyed by its parent code, for all specialised codes
			-- in this terminology at its level of specialisation.
			-- For example the entry for key 'at0007' could be 5, meaning that current top child
			-- code of 'at7' is 'at7.5'
        attribute
            create Result.make (0)
        end

	use_node_index: HASH_TABLE [ARRAYED_LIST [C_COMPLEX_OBJECT_PROXY], STRING]
		attribute
			create Result.make (0)
		end

	rules_index: HASH_TABLE [ARRAYED_LIST [EXPR_LEAF], STRING]
		attribute
			create Result.make (0)
		end

	remove_fake_id_codes
			-- remove term code definitions with text = "@ internal @"
		do
			if target.terminology.term_definitions.has_key ("en") then
				across target.terminology.id_codes as id_code_csr loop
					if target.terminology.term_definition ("en", id_code_csr.item).description.is_equal (Adl_14_legacy_fake_code_text) then
						target.terminology.remove_definition (id_code_csr.item)
					end
				end
			end
		end

end


