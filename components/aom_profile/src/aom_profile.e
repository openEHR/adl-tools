note
	component:   "openEHR ADL Tools"
	description: "[
				 Profile of common settings relating to use of reference model(s) and terminology for a
				 given arhetype developing organisation.
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PROFILE

inherit
	ANY_VALIDATOR

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	SHARED_REFERENCE_MODEL_ACCESS

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	ADL_MESSAGES_IDS
		export
			{NONE} all
		end

create
	make_dt

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			reset
			create profile_name.make_from_string (Default_aom_profile_name)
			create rm_schema_pattern.make_empty
			create rm_schema_ids.make (0)
			create file_path.make_empty
		end

feature -- Identification

	profile_name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

feature -- Access (attributes from file)

	rm_schema_pattern: STRING
			-- PERL regex based on id of publisher of Reference Models to which this profile applies.
			-- This is used to match the 'schema_id' generated in BMM_SCHEMA class based on model
			-- publisher, model name, model release found in .bmm files.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	terminology_profile: detachable AOM_TERMINOLOGY_PROFILE
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	archetype_visualise_descendants_of: detachable STRING
			-- The effect of this attribute in visualisation is to generate the most natural tree or
			-- grid-based view of an archetype definition, from the semantic viewpoint.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	aom_rm_type_mappings: detachable HASH_TABLE [AOM_TYPE_MAPPING, STRING]
			-- mappings from AOM built-in types to actual types in RM: whenever
			-- the type name is encountered in an archetype, it is mapped to a specific RM type
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	aom_rm_type_substitutions: detachable HASH_TABLE [STRING, STRING]
			-- allowed type substitutions: Actual RM type names keyed by AOM built-in types which can
			-- subsitute for them in an archetype. E.g. <value = "String", key = "ISO8601_DATE"> means
			-- that if RM property TYPE.some_property is of type String, an ISO8601_DATE is allowed at that
			-- position in the archetype.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	aom_lifecycle_mappings: detachable HASH_TABLE [STRING, STRING]
			-- list of mappings of lifecycle state names used in archetypes to AOM lifecycle state
			-- names. value = AOM lifecycle state; key = source lifecycle state

	aom_lifecycle_mapping (a_state_name: STRING): STRING
		require
			has_lifecycle_state_mapping (a_state_name)
		do
			check attached aom_lifecycle_mappings as att_ls and then attached att_ls.item (a_state_name.as_lower) as map_state then
				Result := map_state
			end
		end

feature -- Access

	file_path: STRING

	rm_schema_ids: ARRAYED_LIST [STRING]
			-- list of rm schemas matched by `rm_schema_patterns'

feature -- Status Report

	has_type_substitution (an_aom_type, an_rm_type: STRING): BOOLEAN
			-- is there a type substitution for `an_aom_type', `an_rm_type'?
		do
			Result := attached aom_rm_type_substitutions as att_type_subs and then
				attached att_type_subs.item (an_aom_type) as att_type_subs_item and then att_type_subs_item.is_case_insensitive_equal (an_rm_type)
		end

	has_any_type_substitution (an_aom_type: STRING): BOOLEAN
			-- is there any type substitution for `an_aom_type'?
		do
			Result := attached aom_rm_type_substitutions as att_type_subs and then att_type_subs.has (an_aom_type)
		end

	has_lifecycle_state_mapping (a_state_name: STRING): BOOLEAN
			-- is there an AOM lifecycle state for `a_state_name'?
		do
			Result := attached aom_lifecycle_mappings as att_ls and then att_ls.has (a_state_name.as_lower)
		end

feature -- Validation

	validate
		local
			sch: BMM_SCHEMA
			rm_class_name: STRING
		do
			if profile_name.is_equal (Default_aom_profile_name) then
				add_error (ec_ARP_no_profile_name, <<file_path>>)
			end
			if rm_schema_ids.is_empty then
				add_error (ec_ARP_no_matching_schemas, <<file_path>>)
			else
				if attached aom_rm_type_mappings as aom_tm then
					-- check that all type mappings are found in all mentioned schemas
					across rm_schema_ids as schemas_csr loop
						if has_rm_schema_for_id (schemas_csr.item) then
							sch := rm_schema_for_id (schemas_csr.item)
							across aom_tm as type_mappings_csr loop
								rm_class_name := type_mappings_csr.item.target_class_name
								if not sch.has_class_definition (type_mappings_csr.item.target_class_name) then
									add_error (ec_ARP_invalid_class_mapping, <<type_mappings_csr.item.source_class_name,
										rm_class_name, sch.schema_id>>)
								else
									across type_mappings_csr.item.property_mappings as property_mappings_csr loop
										if not sch.has_property (rm_class_name, property_mappings_csr.item.target_property_name) then
											add_error (ec_ARP_invalid_property_mapping, <<type_mappings_csr.item.source_class_name,
												property_mappings_csr.item.source_property_name,
												rm_class_name, property_mappings_csr.item.target_property_name, sch.schema_id>>)
										end
									end
								end
							end
						end
					end
				end

				-- check lifecycle state mappings
				if attached aom_lifecycle_mappings as att_ls then
					across att_ls as ls_csr loop
						if not Resource_lifecycle_states.has (ls_csr.item) then
							add_error (ec_ARP_invalid_lifecycle_state_mapping, <<ls_csr.key, ls_csr.item, profile_name>>)
						end
					end
				end
			end
		end

feature -- Modification

	set_file_path (a_path: STRING)
		do
			file_path := a_path
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- Finalisation work: evaluate rm schema regexes
		local
			lc_aom_lifecycle_mappings: detachable HASH_TABLE [STRING, STRING]
		do
			if rm_schemas_access.load_attempted then
				get_regex_matches (rm_schema_pattern)
			else
				add_error (ec_ARP_no_bmm_schemas_loaded, Void)
			end

			-- convert lifecycle states table to all lower case
			if attached aom_lifecycle_mappings as aom_ls_mappings then
				create lc_aom_lifecycle_mappings.make (0)
				across aom_ls_mappings as state_mappings_csr loop
					lc_aom_lifecycle_mappings.put (state_mappings_csr.item.as_lower, state_mappings_csr.key.as_lower)
				end
				aom_lifecycle_mappings := lc_aom_lifecycle_mappings
			end
		end

	get_regex_matches (a_regex: STRING)
			-- Finalisation work: evaluate rm schema regexes
		require
			rm_schemas_access.load_attempted
		local
			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		do
			-- deal with RM schema regexes
			create regex_matcher.make
			regex_matcher.set_case_insensitive (True)
			regex_matcher.compile (a_regex)
			if regex_matcher.is_compiled then
				across rm_schema_all_ids as sch_ids_csr loop
					if regex_matcher.recognizes (sch_ids_csr.item) then
						rm_schema_ids.extend (sch_ids_csr.item)
					end
				end
			else
				add_error (ec_regex_e1, <<a_regex>>)
			end
		end

end



