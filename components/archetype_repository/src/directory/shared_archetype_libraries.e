note
	component:   "openEHR ADL Tools"
	description: "[
				 Shared access to 'archteype directories'. An archetype directory is an in-memory logical catalogue of
				 archetypes & templates corresponding to a single 'repository'. Each repository may reference one or more 
				 source locations, providing reference and working repositories, with the pseudo-location 'adhoc'
				 enabling archetypes to be added adhoc to a directory.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_LIBRARIES

inherit
	SHARED_ADL_APP_RESOURCES

feature -- Access

	current_arch_lib: ARCHETYPE_LIBRARY
			-- application-wide archetype directory access
		require
			is_current_library_valid
		local
			curr_prof_name: STRING
		do
			check attached repository_config_table.current_repository_name as cpn then
				curr_prof_name := cpn
			end
			if not arch_libs.has (curr_prof_name) then
				use_current_library (False)
			end
			check attached arch_libs.item (curr_prof_name) as ac then
				Result := ac
			end
		end

	use_current_library (refresh: BOOLEAN)
			-- switch to current repository; refresh flag forces archetype in memory directory to be refreshed from source repository
		require
			is_current_library_valid
		local
			new_cat: ARCHETYPE_LIBRARY
			prof_repo_access: LIBRARY_ACCESS
			curr_prof: STRING
		do
			init_gen_dirs_from_current_repository
			check attached repository_config_table.current_repository_name as cpn then
				curr_prof := cpn
			end
			if not arch_libs.has (curr_prof) or else refresh then
				create prof_repo_access.make (repository_config_table.current_reference_repository_path)
				create new_cat.make (prof_repo_access)
				new_cat.populate
				arch_libs.force (new_cat, curr_prof) -- replace original copy if it was there
			end
		end

feature -- Status Report

	has_current_library: BOOLEAN
		do
			Result := repository_config_table.has_current_repository
		end

	is_library_valid (a_lib_name: STRING): BOOLEAN
			-- check validity of repository directories etc - can it be created and loaded?
		do
			Result := repository_config_table.has_repository (a_lib_name) and
				directory_exists (repository_config_table.repository (a_lib_name).reference_path)

			-- TODO: potentially other checks as well
		end

	is_current_library_valid: BOOLEAN
			-- check validity of library directories etc - can it be created and loaded?
		require
			has_current_library
		do
			Result := attached repository_config_table.current_repository_name as cpn and then is_library_valid (cpn)
		end

	invalid_library_reason (a_lib_name: STRING): STRING
			-- generate reason why library is not valid
		do
			create Result.make_empty
			if not repository_config_table.has_repository (a_lib_name) then
				Result := get_msg (ec_invalid_library_cfg, <<a_lib_name>>)
			elseif not directory_exists (repository_config_table.repository (a_lib_name).reference_path) then
				Result := get_msg (ec_ref_library_not_found, <<repository_config_table.repository (a_lib_name).reference_path>>)
			end
		end

feature {NONE} -- Implementation

	arch_libs: HASH_TABLE [ARCHETYPE_LIBRARY, STRING]
			-- hash of all archetype libraries used so far in the current session;
			-- keyed by library name;
			-- lazy populated
		once
			create Result.make (0)
		end

end


