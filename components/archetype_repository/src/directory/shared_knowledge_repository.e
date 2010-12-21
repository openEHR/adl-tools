note
	component:   "openEHR Archetype Project"
	description: "[
				 Shared access to archteype directory.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class SHARED_KNOWLEDGE_REPOSITORY

inherit
	SHARED_APP_RESOURCES

	SHARED_SOURCE_REPOSITORIES

feature -- Access

	current_arch_dir: ARCHETYPE_DIRECTORY
			-- application-wide archetype directory access
		do
			Result := directories.item(repository_profiles.current_profile_name)
		end

	directories: HASH_TABLE[ARCHETYPE_DIRECTORY, STRING]
			-- hash of all archetype directories used so far in the current session
		once
			create Result.make(0)
		end

	use_current_profile (refresh: BOOLEAN)
			-- switch to current profile; refresh flag forces archetype in memory directory to be refreshed from source repository
		local
			new_dir: ARCHETYPE_DIRECTORY
		do
			if not directories.has(repository_profiles.current_profile_name) or else refresh then
				create new_dir.make
				if directory_exists (repository_profiles.reference_repository_path) then
					source_repositories.set_reference_repository (repository_profiles.reference_repository_path)
					if not repository_profiles.work_repository_path.is_empty then
						if source_repositories.valid_working_repository_path (repository_profiles.work_repository_path) then
							source_repositories.set_work_repository (repository_profiles.work_repository_path)
						else
							post_error (Current, "switch_to_profile", "work_repo_not_found", <<repository_profiles.work_repository_path>>)
						end
					else
						source_repositories.remove_work_repository
					end
					new_dir.populate
					directories.force(new_dir, repository_profiles.current_profile_name)
				else
					post_error (Current, "switch_to_profile", "ref_repo_not_found", <<repository_profiles.reference_repository_path>>)
				end
			end
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
