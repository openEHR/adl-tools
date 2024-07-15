note
	component:   "openEHR ADL Tools"
	description: "[
				 Set of AOM profiles read by tool at startup
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PROFILES_ACCESS

inherit
	ANY_VALIDATOR
		redefine
			ready_to_validate
		end

	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
		end

create
	make

feature -- Initialisation

	make
		do
			reset
			clear
			create profile_directory.make_empty
		end

	initialise (an_absolute_dir: STRING)
		require
			Dir_valid: directory_exists (an_absolute_dir)
		do
			make
			profile_directory := an_absolute_dir
			load_profiles
			if not profile_descriptor_candidates.is_empty then
				validate
			end
		end

feature -- Access

	profile_directory: STRING
			-- home directory for AOM profiles

	profiles: HASH_TABLE [AOM_PROFILE, STRING]
			-- loaded profiles

	profile_descriptors: HASH_TABLE [AOM_PROFILE_ACCESS, STRING]
			-- validated profile descriptor objects

	profile_descriptor_candidates: ARRAYED_LIST [AOM_PROFILE_ACCESS]
			-- found profile descriptor objects

	profiles_for_rm_schemas: HASH_TABLE [AOM_PROFILE, STRING]
			-- table of AOM_PROFILE keyed by RM schema it applies to

	profile_for_rm_schema (an_id: STRING): AOM_PROFILE
		require
			has_profile_for_rm_schema (an_id)
		do
			check attached profiles_for_rm_schemas.item (an_id) as a_prof then
				Result := a_prof
			end
		end

feature -- Status Report

	has_profile_directory: BOOLEAN
			-- true if there is a valid profile directory set
		do
			Result := not profile_directory.is_empty
		end

	found_valid_profiles: BOOLEAN
			-- True if any valid profiles were found
		do
			Result := not profiles.is_empty
		end

	ready_to_validate: BOOLEAN
		do
			Result := not profile_descriptor_candidates.is_empty
		end

	has_profile_for_rm_schema (an_id: STRING): BOOLEAN
		do
			Result := profiles_for_rm_schemas.has (an_id)
		end

	exception_encountered: BOOLEAN
			-- set to True if any processing failed

feature -- Validation

	validate
		local
			a_profile: AOM_PROFILE
		do
			across profile_descriptor_candidates as prof_descs_csr loop
				if prof_descs_csr.item.ready_to_validate then
					prof_descs_csr.item.validate
					if prof_descs_csr.item.passed then
						check attached prof_descs_csr.item.profile as prf then
							a_profile := prf
						end
						if attached profiles.item (a_profile.profile_name) as att_prof then
							add_error ({ADL_MESSAGES_IDS}.ec_aom_profile_duplicate_found, <<a_profile.file_path, att_prof.file_path>>)
						else
							profiles.put (a_profile, a_profile.profile_name)
							profile_descriptors.put (prof_descs_csr.item, a_profile.profile_name)
							across a_profile.matched_model_ids as schema_ids_csr loop
								profiles_for_rm_schemas.put (a_profile, schema_ids_csr.item)
							end
						end
					else
						merge_errors (prof_descs_csr.item.errors)
					end
				end
			end
		end

feature -- Commands

	clear
		do
			create profiles.make (0)
			create profile_descriptors.make (0)
			create profile_descriptor_candidates.make (0)
			create profiles_for_rm_schemas.make (0)
		end

	load_profiles
			-- reload profiles
		require
			has_profile_directory
		local
			dir: KL_DIRECTORY
			file_repo: FILE_REPOSITORY
			aom_pd: AOM_PROFILE_ACCESS
		do
			reset
			clear
			if not exception_encountered then
				profiles.wipe_out
				create dir.make (profile_directory)
				if not (dir.exists and dir.is_readable) then
					add_error ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_not_valid, <<profile_directory>>)
				elseif dir.is_empty then
					add_error ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_contains_no_profiles, <<profile_directory>>)
				else
					create file_repo.make (profile_directory, Aom_profile_file_match_regex)
					across file_repo.matching_paths as paths_csr loop
						create aom_pd.make (paths_csr.item)
						aom_pd.load
						profile_descriptor_candidates.extend (aom_pd)
					end
					if profile_descriptor_candidates.is_empty then
						add_error ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_contains_no_valid_profiles, <<profile_directory>>)
					end
				end
			end
		rescue
			exception_encountered := True
			add_error ({ADL_MESSAGES_IDS}.ec_aom_profile_unknown_exception, Void)
			retry
		end

end



