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

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
		end

create
	make

feature {ADL15_ENGINE} -- Initialisation

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
			end
			create id_codes.make
			id_codes.compare_objects
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
			update_constraint_refs
			update_aom_mapped_types
			update_lifecycle_state
			add_id_codes
		end

	clear
		do
			c_terminology_code_type_mapping := Void
		end

feature {NONE} -- Implementation

	update_constraint_refs
			-- populate CONSTRAINT_REF rm_type_name based on RM schema
		local
			bmm_prop_def: BMM_PROPERTY_DEFINITION
			proximal_ca: C_ATTRIBUTE
			proximal_co: C_COMPLEX_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
		do
			across target.accodes_index as ac_codes_csr loop
				across ac_codes_csr.item as cref_list_csr loop
					check attached cref_list_csr.item.parent as p then
						proximal_ca := p
					end
					if proximal_ca.has_differential_path then
						check attached proximal_ca.differential_path as diff_path then
							create apa.make_from_string (diff_path)
						end
						check attached {C_COMPLEX_OBJECT} arch_parent_flat.c_object_at_path (apa.path_at_level (arch_parent_flat.specialisation_depth)) as cco then
							proximal_co := cco
						end
					else
						check attached proximal_ca.parent as p then
							proximal_co := p
						end
					end
					bmm_prop_def := rm_schema.property_definition (proximal_co.rm_type_name, proximal_ca.rm_attribute_name)
					cref_list_csr.item.set_rm_type_name (bmm_prop_def.type.root_class)
				end
			end
		end

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
	--			ctc.set_rm_type_mapping (att_c_terminology_code_type_mapping)
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
			-- make a copy of current ARCHETYPE_INTERNAL_REFs and invariants lists
			-- so that any paths can be corrected
			use_node_index := target.use_node_index
			invariants_index := target.invariants_index

			-- fix definition
			create def_it.make (target.definition)
			def_it.do_all (agent do_add_id_code, Void)
		end

	 do_add_id_code (a_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
	 	local
	 		apa: ARCHETYPE_PATH_ANALYSER
	 		path_in_flat, id_code, parent_id_code, old_path, new_path: STRING
	 		parent_flat: FLAT_ARCHETYPE
	 		parent_ca: C_ATTRIBUTE
	 		parent_co: C_OBJECT
	 	do
	 		if attached {C_OBJECT} a_node as c_obj and then not attached {C_PRIMITIVE_OBJECT} c_obj and then not c_obj.is_addressable then
	 			-- default to a new code; if node is inherited, or redefined an appropriate code will be used
	 			old_path := c_obj.path
 				id_code := new_id_code_at_level (old_path, target.specialisation_depth, id_codes)
	 			if target.is_specialised then
	 				-- generate a path; since the terminal object doesn't currently have any node_id,
	 				-- the path will actually just point to the parent C_ATTRIBUTE
	 				create apa.make_from_string (c_obj.path)
	 				if not apa.is_phantom_path_at_level (target.specialisation_depth - 1) then
		 				path_in_flat := apa.path_at_level (target.specialisation_depth - 1)
		 				check attached arch_parent_flat as att_pf then
		 					parent_flat := att_pf
		 				end
		 				if parent_flat.has_path (path_in_flat) then
		 					parent_ca := parent_flat.c_attr_at_path (path_in_flat)
		 					if parent_ca.has_child_with_rm_type_name (c_obj.rm_type_name) then
		 						parent_co := parent_ca.child_with_rm_type_name (c_obj.rm_type_name)
		 						parent_id_code := parent_co.node_id
	 							id_code := parent_id_code

	 							-- initially assume straight inheritance, so that different node_id is not
	 							-- used as a reason for c_equal() to fail
	 							c_obj.parent.replace_node_id (c_obj.node_id, parent_id_code)
		 						if not c_obj.c_equal (parent_co) then
		 							-- they really are different; use a redefined code instead
				 					id_code := new_refined_code_at_level (parent_id_code, target.specialisation_depth, id_codes)
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

				-- fix any matching invariant nodes with this path
				across invariants_index as invs_idx_csr loop
					if invs_idx_csr.key.starts_with (old_path) then
						across invs_idx_csr.item as invs_csr loop
							if invs_csr.item.reference_type = {EXPR_LEAF}.Ref_type_attribute then
								create new_path.make_from_string (c_obj.path)
								if invs_idx_csr.key.count > old_path.count then
									new_path.append (invs_idx_csr.key.substring (old_path.count + 1, invs_idx_csr.key.count))
								end
								invs_csr.item.make_archetype_definition_ref (new_path)
							end
						end
					end
				end
	 		end
	 	end

	id_codes: TWO_WAY_SORTED_SET [STRING]

	use_node_index: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_INTERNAL_REF], STRING]
		attribute
			create Result.make (0)
		end

	invariants_index: HASH_TABLE [ARRAYED_LIST [EXPR_LEAF], STRING]
		attribute
			create Result.make (0)
		end

end


