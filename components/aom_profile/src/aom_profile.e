note
	component:   "openEHR ADL Tools"
	description: "[
				 Profile of common settings relating to use of reference model(s) and terminology for a
				 given arhetype developing organisation.
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
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
			create rm_aom_primitive_type_mappings.make (0)
			rm_aom_primitive_type_mappings.merge (c_primitive_subtypes)
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
			-- substitute for them in an archetype. E.g. <value = "String", key = "ISO8601_DATE"> means
			-- that if RM property TYPE.some_property is of type String, an ISO8601_DATE is allowed at that
			-- position in the archetype.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	rm_primitive_type_equivalences: detachable HASH_TABLE [STRING, STRING]
			-- Equivalences of RM primitive types to in-built set of primitive types
			-- Used to determine which AOM C_PRIMITIVE_OBJECT descendant is used for a primitive type
			-- Typical entries:
			--  value		key
			--	"Real"		"Double"
			--	"Integer"	"Integer64"
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

	rm_aom_primitive_type_mappings: HASH_TABLE [STRING, STRING]
			-- Mapping from RM primitive types to AOM C_PRIMITIVE_OBJECT descendant type for this schema
			-- Assumed primitive types and their C_XX mappings for all schemas are in `c_primitive_subtypes'
			-- Keyed by RM type upper case

feature -- Status Report

	has_type_substitution (an_aom_type, an_rm_type: STRING): BOOLEAN
			-- is there a type substitution for `an_aom_type', `an_rm_type'?
		local
			a_key: STRING
			finished: BOOLEAN
		do
			if attached aom_rm_type_substitutions as att_type_subs then
				from
					a_key := an_aom_type
				until
					Result or finished
				loop
					if attached att_type_subs.item (a_key) as att_type_subs_item then
						Result := att_type_subs_item.is_case_insensitive_equal (an_rm_type)
						if not Result then
							a_key := att_type_subs_item
						end
					else
						finished := True
					end
				end
			end
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

	has_rm_aom_primitive_type_mapping (an_rm_type, an_aom_type: STRING): BOOLEAN
			-- is there a type equivalence for `an_aom_type', `an_rm_type'?
		do
			Result := attached rm_aom_primitive_type_mappings.item (an_rm_type.as_upper) as att_type_eq_type and then
			att_type_eq_type.is_case_insensitive_equal (an_aom_type)
		end

	has_aom_primitive_type_mapping_for_rm_type (an_rm_type: STRING): BOOLEAN
			-- is there a type equivalence for `an_rm_type'?
		do
			Result := rm_aom_primitive_type_mappings.has (an_rm_type.as_upper)
		end

	aom_primitive_type_mapping_for_rm_type (an_rm_type: STRING): STRING
			-- Return the a type equivalence for `an_aom_type', `an_rm_type'?
		require
			has_aom_primitive_type_mapping_for_rm_type (an_rm_type)
		do
			check attached rm_aom_primitive_type_mappings.item (an_rm_type.as_upper) as att_type_eq_type then
				Result := att_type_eq_type
			end
		end

feature -- Validation

	validate
		local
			sch: BMM_MODEL
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
						if has_ref_model_for_id (schemas_csr.item) then
							sch := ref_model_for_id (schemas_csr.item)
							across aom_tm as type_mappings_csr loop
								rm_class_name := type_mappings_csr.item.target_class_name
								if not sch.has_class_definition (type_mappings_csr.item.target_class_name) then
									add_error (ec_ARP_invalid_class_mapping, <<type_mappings_csr.item.source_class_name,
										rm_class_name, sch.schema_id>>)
								else
									if attached type_mappings_csr.item.property_mappings as prop_mappings then
										across prop_mappings as property_mappings_csr loop
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
			default_rm_type_key: STRING
		do
			if ref_models_access.load_attempted then
				get_regex_matches (rm_schema_pattern)
			else
				add_error (ec_ARP_no_bmm_schemas_loaded, Void)
			end

			-- merge default RM/AOM primitive type mappings into those found in AOM profile
			if attached rm_primitive_type_equivalences as att_rm_prim_type_eqs then
				across att_rm_prim_type_eqs as rm_prim_types_csr loop
					default_rm_type_key := rm_prim_types_csr.item.as_upper
					if rm_aom_primitive_type_mappings.has (default_rm_type_key) and then
						attached rm_aom_primitive_type_mappings.item (default_rm_type_key) as aom_type
					then
						rm_aom_primitive_type_mappings.put (aom_type, rm_prim_types_csr.key.as_upper)
					end
				end
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
			ref_models_access.load_attempted
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



