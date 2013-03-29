note
	component:   "openEHR Archetype Project"
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
	license:     "See notice at bottom of class"

class SHARED_ARCHETYPE_CATALOGUES

inherit
	SHARED_APP_RESOURCES

feature -- Access

	current_arch_cat: ARCHETYPE_CATALOGUE
			-- application-wide archetype directory access
		require
			is_current_repository_valid
		local
			curr_prof_name: STRING
		do
			check attached repository_config_table.current_repository_name as cpn then
				curr_prof_name := cpn
			end
			if not arch_cats.has (curr_prof_name) then
				use_current_repository (False)
			end
			check attached arch_cats.item (curr_prof_name) as ac then
				Result := ac
			end
		end

	use_current_repository (refresh: BOOLEAN)
			-- switch to current repository; refresh flag forces archetype in memory directory to be refreshed from source repository
		require
			is_current_repository_valid
		local
			new_cat: ARCHETYPE_CATALOGUE
			prof_repo_access: PROFILE_REPOSITORY_ACCESS
			curr_prof: STRING
		do
			init_gen_dirs_from_current_repository
			check attached repository_config_table.current_repository_name as cpn then
				curr_prof := cpn
			end
			if not arch_cats.has (curr_prof) or else refresh then
				create prof_repo_access.make (repository_config_table.current_reference_repository_path)
				if repository_config_table.current_repository.has_work_path then
					prof_repo_access.set_work_repository (repository_config_table.current_work_repository_path)
				end
				create new_cat.make (prof_repo_access)
				new_cat.populate
				arch_cats.force (new_cat, curr_prof) -- replace original copy if it was there
			end
		end

feature -- Status Report

	has_current_repository: BOOLEAN
		do
			Result := repository_config_table.has_current_repository
		end

	is_repository_valid (a_repository_name: STRING): BOOLEAN
			-- check validity of repository directories etc - can it be created and loaded?
		do
			Result := repository_config_table.has_repository (a_repository_name) and
				directory_exists (repository_config_table.repository (a_repository_name).reference_path) and
				(repository_config_table.repository (a_repository_name).has_work_path implies
					attached repository_config_table.repository (a_repository_name).work_path as wr_dir and then
					directory_exists (wr_dir))

			-- TODO: potentially other checks as well
		end

	is_current_repository_valid: BOOLEAN
			-- check validity of repository directories etc - can it be created and loaded?
		require
			has_current_repository
		do
			Result := attached repository_config_table.current_repository_name as cpn and then is_repository_valid (cpn)
		end

	invalid_repository_reason (a_repository_name: STRING): STRING
			-- generate reason why repository is not valid
		do
			create Result.make_empty
			if not repository_config_table.has_repository (a_repository_name) then
				Result := get_msg (ec_invalid_repo_cfg, <<a_repository_name>>)
			elseif not directory_exists (repository_config_table.repository (a_repository_name).reference_path) then
				Result := get_msg (ec_ref_repo_not_found, <<repository_config_table.repository (a_repository_name).reference_path>>)
			elseif repository_config_table.repository (a_repository_name).has_work_path and then
				attached repository_config_table.repository (a_repository_name).work_path as wr_dir and then not directory_exists (wr_dir)
			then
				Result := get_msg (ec_work_repo_not_found, <<wr_dir>>)
			end
		end

feature {NONE} -- Implementation

	arch_cats: HASH_TABLE [ARCHETYPE_CATALOGUE, STRING]
			-- hash of all archetype catalogues used so far in the current session;
			-- keyed by repository name;
			-- lazy populated
		once
			create Result.make (0)
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
--| The Original Code is shared_archetype_directory.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2010
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
