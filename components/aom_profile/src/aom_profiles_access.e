note
	component:   "openEHR Archetype Project"
	description: "[
				 Set of AOM profiles read by tool at startup
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

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

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all
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
			validate
		end

feature -- Access

	profile_directory: STRING
			-- home directory for AOM profiles

	profiles: HASH_TABLE [AOM_PROFILE, STRING]
			-- loaded profiles

	profile_descriptors: HASH_TABLE [AOM_PROFILE_DESCRIPTOR, STRING]
			-- validated profile descriptor objects

	profile_descriptor_candidates: ARRAYED_LIST [AOM_PROFILE_DESCRIPTOR]
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
						if not profiles.has (a_profile.profile_name) then
							profiles.put (a_profile, a_profile.profile_name)
							profile_descriptors.put (prof_descs_csr.item, a_profile.profile_name)
							across a_profile.rm_schema_ids as schema_ids_csr loop
								profiles_for_rm_schemas.put (a_profile, schema_ids_csr.item)
							end
						else
							add_error (ec_aom_profile_duplicate_found, <<a_profile.file_path, profiles.item (a_profile.profile_name).file_path>>)
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
			aom_pd: AOM_PROFILE_DESCRIPTOR
		do
			reset
			clear
			if not exception_encountered then
				profiles.wipe_out
				create dir.make (profile_directory)
				if not (dir.exists and dir.is_readable) then
					add_error (ec_aom_profile_dir_not_valid, <<profile_directory>>)
				elseif dir.is_empty then
					add_error (ec_aom_profile_dir_contains_no_profiles, <<profile_directory>>)
				else
					create file_repo.make (profile_directory, Aom_profile_file_match_regex)
					across file_repo.matching_paths as paths_csr loop
						create aom_pd.make (paths_csr.item)
						aom_pd.load
						profile_descriptor_candidates.extend (aom_pd)
					end
					if profiles.is_empty then
						add_error (ec_aom_profile_dir_contains_no_valid_profiles, <<profile_directory>>)
					end
				end
			end
		rescue
			exception_encountered := True
			add_error (ec_aom_profile_unknown_exception, Void)
			retry
		end

end



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
