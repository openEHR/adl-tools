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

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	make (a_target: ARCHETYPE; ara: ARCH_LIB_ARCHETYPE)
			-- set target_descriptor
			-- initialise reporting variables
			-- a_parser_context may contain unhandled structures needed in this stage
		require
			ara.compilation_state >= {COMPILATION_STATES}.Cs_parsed
		do
			create ref_model.default_create
			create att_c_terminology_code_type_mapping
			initialise (a_target, ara)
		end

	initialise (a_target: ARCHETYPE; ara: ARCH_LIB_ARCHETYPE)
			-- set target_descriptor
			-- initialise reporting variables
		require
			ara.compilation_state >= {COMPILATION_STATES}.Cs_parsed
		do
			if ref_model /= ara.ref_model then
				ref_model := ara.ref_model
				if aom_profiles_access.has_profile_for_rm_schema (ref_model.schema_id) then
					aom_profile := aom_profiles_access.profile_for_rm_schema (ref_model.schema_id)
				end
				set_domain_type_mappings
			end
			target := a_target
			if ara.is_specialised then
				flat_ancestor := ara.specialisation_parent.flat_archetype
			else
				flat_ancestor := Void
			end

			-- record if this archetype is a 1.4 archetype, because if so we need to reprocess
			-- more junk silently
			is_adl14_archetype := attached {ARCH_LIB_AUTHORED_ARCHETYPE} ara as auth_ara and then auth_ara.file_mgr.has_legacy_flat_file
		ensure
			Flat_ancestor_valid: attached flat_ancestor as fa implies fa.is_flat
		end

feature -- Access

	target: ARCHETYPE
			-- differential archetype being processed

	flat_ancestor: detachable ARCHETYPE

	ref_model: BMM_MODEL

	aom_profile: detachable AOM_PROFILE

feature -- Status Report

	is_adl14_archetype: BOOLEAN
			-- True if archetype originally parsed from ADL 1.4

feature -- Commands

	execute
		do
			update_aom_mapped_types
			update_lifecycle_state

			if not validation_strict and is_adl14_archetype then
				remove_duplicate_multiplicities
			end
		end

	clear
		do
			c_terminology_code_type_mapping := Void
		end

feature {NONE} -- Implementation

	update_aom_mapped_types
			-- Find any types that have a AOM profile type mapping and write the mapping in
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
			if attached {AUTHORED_ARCHETYPE} target as auth_arch then
				if not valid_resource_lifecycle_state (auth_arch.description.lifecycle_state) and then
					attached aom_profile as att_ap and then att_ap.has_lifecycle_state_mapping (auth_arch.description.lifecycle_state)
				then
					auth_arch.description.set_lifecycle_state (att_ap.aom_lifecycle_mapping (auth_arch.description.lifecycle_state))
				else
					auth_arch.description.set_lifecycle_state (Initial_resource_lifecycle_state)
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
			def_it.do_all_on_entry (agent do_remove_duplicate_multiplicities)
		end

	do_remove_duplicate_multiplicities (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			co_in_flat_anc: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			ca_path_in_flat, co_path_in_flat: STRING
			ca_in_flat_anc: C_ATTRIBUTE
			ref_existence, ref_cardinality: detachable MULTIPLICITY_INTERVAL
			rm_prop_def: BMM_PROPERTY [BMM_TYPE]
			co_parent: C_COMPLEX_OBJECT
		do
			if attached {C_ATTRIBUTE} a_c_node as ca and then (attached ca.existence or attached ca.cardinality) then
				if attached flat_ancestor as att_flat_anc then
					create apa.make (a_c_node.og_path)

					if not apa.is_phantom_path_at_level (att_flat_anc.specialisation_depth) then
						ca_path_in_flat := apa.path_at_level (att_flat_anc.specialisation_depth)

						if att_flat_anc.has_attribute_path (ca_path_in_flat) then
							ca_in_flat_anc := att_flat_anc.attribute_at_path (ca_path_in_flat)

							-- if existence or cardinality are set, they are the reference comparisons
							if attached ca_in_flat_anc.existence as ccd_ex then
								ref_existence := ccd_ex
							end
							if ca_in_flat_anc.is_multiple and then attached ca_in_flat_anc.cardinality as ccd_card then
								ref_cardinality := ccd_card.interval
							end
						end
					end
				end

				-- it may be that for even specialised archetypes, existence and cardinality were not set in the parent, so
				-- we get them from the RM
				check attached ca.parent as cp then
					co_parent := cp
				end
				if ca.has_differential_path then
					rm_prop_def := ref_model.property_definition_at_path (co_parent.rm_type_name, ca.rm_attribute_path)
				else
					rm_prop_def := ref_model.property_definition (co_parent.rm_type_name, ca.rm_attribute_name)
				end
				if not attached ref_existence then
					ref_existence := rm_prop_def.existence
				end
				if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def and not attached ref_cardinality then
					ref_cardinality := rm_cont_prop_def.cardinality
				end

				if attached ca.existence as ca_ex and then attached ref_existence as ref_ex and then ca_ex.is_equal (ref_ex) then
					ca.remove_existence
				end
				if attached ca.cardinality as ca_card and then attached ref_cardinality as ref_card and then ca_card.interval.is_equal (ref_card) then
					ca.remove_cardinality
				end

				-- if there is no constraint remaining, remove the C_ATTRIBUTE altogether
				if ca.is_non_constraining then
					co_parent.remove_attribute (ca)
				end

			elseif attached {C_OBJECT} a_c_node as co_child_diff and then attached co_child_diff.occurrences as ccd_occ then
				-- for all archetypes, remove unnecessary occurrences of {0..*}
				if ccd_occ.is_open then
					co_child_diff.remove_occurrences
				-- specialised archetype nodes - if local occurrences exists and is a copy of that in parent, remove it
				elseif attached flat_ancestor as fa then
					create apa.make (a_c_node.og_path)
					-- node redefines something in parent; check if it is a duplicate
					if not apa.is_phantom_path_at_level (fa.specialisation_depth) then
						co_path_in_flat := apa.path_at_level (fa.specialisation_depth)
						if fa.has_object_path (co_path_in_flat) then
							co_in_flat_anc := fa.object_at_path (co_path_in_flat)
							if attached co_in_flat_anc.occurrences as cpf_occ and then ccd_occ.is_equal (cpf_occ) then
								co_child_diff.remove_occurrences
							end
						end
					end
				end
			end
		end

end


