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

create
	make

feature {ADL_15_ENGINE, ADL_14_ENGINE} -- Initialisation

	make (a_target: ARCHETYPE; ara: ARCH_CAT_ARCHETYPE)
			-- set target_descriptor
			-- initialise reporting variables
			-- a_parser_context may contain unhandled structures needed in this stage
		require
			ara.compilation_state >= {COMPILATION_STATES}.Cs_parsed
		do
			create rm_schema.make ("test", "test", "1.0")
			create att_c_terminology_code_type_mapping
			initialise (a_target, ara)
		end

	initialise (a_target: ARCHETYPE; ara: ARCH_CAT_ARCHETYPE)
			-- set target_descriptor
			-- initialise reporting variables
		require
			ara.compilation_state >= {COMPILATION_STATES}.Cs_parsed
		do
			if rm_schema /= ara.rm_schema then
				rm_schema := ara.rm_schema
				if aom_profiles_access.has_profile_for_rm_schema (rm_schema.schema_id) then
					aom_profile := aom_profiles_access.profile_for_rm_schema (rm_schema.schema_id)
				end
				set_domain_type_mappings
			end
			target := a_target
			if ara.is_specialised then
				flat_ancestor := ara.specialisation_ancestor.flat_archetype
			end
		end

feature -- Access

	target: ARCHETYPE
			-- differential archetype being processed

	flat_ancestor: detachable FLAT_ARCHETYPE

	rm_schema: BMM_SCHEMA

	aom_profile: detachable AOM_PROFILE

feature -- Commands

	execute
		do
			update_aom_mapped_types
			update_lifecycle_state

			if target.is_specialised and not validation_strict then
				remove_duplicate_multiplicities
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
				def_it.do_all_on_entry (agent update_aom_mapped_type)
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

	update_aom_mapped_type (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		do
			if attached {C_TERMINOLOGY_CODE} a_c_node as ctc then
				ctc.set_rm_type_name (att_c_terminology_code_type_mapping.target_class_name)
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

	remove_duplicate_multiplicities
			-- remove any existence, cardinality and occurrences from specialised archetypes
			-- that duplicate the same setting on corresponding node in parent
		local
			def_it: C_ITERATOR
		do
			create def_it.make (target.definition)
			def_it.do_until_surface (agent child_node_remove_multiplicities, agent child_node_test)
		end

	child_node_remove_multiplicities (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			co_in_flat_anc: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			ca_path_in_flat, co_path_in_flat: STRING
			ca_in_flat_anc: C_ATTRIBUTE
		do
			if attached {C_ATTRIBUTE} a_c_node as ca_child_diff then
				create apa.make_from_string (a_c_node.path)
				ca_path_in_flat := apa.path_at_level (flat_ancestor.specialisation_depth)
				ca_in_flat_anc := flat_ancestor.attribute_at_path (ca_path_in_flat)
				if attached ca_child_diff.existence as ccd_ex and then attached ca_in_flat_anc.existence as cpf_ex and then ccd_ex.is_equal (cpf_ex) then
					ca_child_diff.remove_existence
				end
				if attached ca_child_diff.cardinality as ccd_card and then attached ca_in_flat_anc.cardinality as cpf_card and then ccd_card.is_equal (cpf_card) then
					ca_child_diff.remove_cardinality
				end

			elseif attached {C_OBJECT} a_c_node as co_child_diff then
				if attached {C_ARCHETYPE_ROOT} a_c_node as car then
					check attached car.slot_path as att_slot_path then
						create apa.make_from_string (att_slot_path)
					end
				else
					create apa.make_from_string (a_c_node.path)
				end
				co_path_in_flat := apa.path_at_level (flat_ancestor.specialisation_depth)
				co_in_flat_anc := flat_ancestor.object_at_path (co_path_in_flat)

				if attached co_child_diff.occurrences as ccd_occ and then attached co_in_flat_anc.occurrences as cpf_occ and then ccd_occ.is_equal (cpf_occ) then
					co_child_diff.remove_occurrences
				end
			end
		end

	child_node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			if attached {C_ARCHETYPE_ROOT} a_c_node as car then
				if attached car.slot_node_id then						-- slot filler
					check attached car.slot_path as att_slot_path then
						create apa.make_from_string (att_slot_path)
					end
					Result := flat_ancestor.has_object_path (apa.path_at_level (flat_ancestor.specialisation_depth))
				end

			elseif attached {C_OBJECT} a_c_node as co_child then
				if specialisation_depth_from_code (co_child.node_id) <= flat_ancestor.specialisation_depth -- node from previous level
					or else is_refined_code (co_child.node_id)  -- from current level, refined
				then
					create apa.make_from_string (a_c_node.path)
					Result := flat_ancestor.has_object_path (apa.path_at_level (flat_ancestor.specialisation_depth))
				else
					-- it's a new code at this level; don't do anything, this branch will be treated as 'added'
				end

			elseif attached {C_ATTRIBUTE} a_c_node as ca_child then
				create apa.make_from_string (a_c_node.path)
				Result := flat_ancestor.has_attribute_path (apa.path_at_level (flat_ancestor.specialisation_depth))
			end
		end

end


