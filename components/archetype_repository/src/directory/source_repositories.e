note
	component:   "openEHR Archetype Project"
	description: "[
				 Source repositories providing access to source archetypes & templates.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/components/archetype_repository/src/directory/arch_directory.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-04-07 06:22:44 +0100 (Mon, 07 Apr 2008) $"


class SOURCE_REPOSITORIES

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
			create repositories.make (0)
			create adhoc_source_repository.make (Group_id_adhoc)

		-- FIXME: probably add adhoc repo to list and treat it as a normal source, although it is missing some features
		--	source_repositories.put (adhoc_source_repository, adhoc_source_repository.group_id)
		end

feature -- Access

	reference_repository: attached ARCHETYPE_INDEXED_REPOSITORY_I
			-- physical reference repository

	work_repository: ARCHETYPE_INDEXED_REPOSITORY_I
			-- physical work repository (optional)

	adhoc_source_repository: attached ARCHETYPE_ADHOC_FILE_REPOSITORY
			-- An additional 'repository' where archetypes may be found, but not necessarily classified
			-- under any structure - used e.g. to represent the file local system where isolated archetypes
			-- may be found, e.g. in c:\temp, /tmp or wherever. This repository is just a list of
			-- archetypes keyed by path on the file system. They are not merged onto the directory
			-- but 'grafted' - a simpler operation.

	repositories: attached DS_HASH_TABLE [attached ARCHETYPE_INDEXED_REPOSITORY_I, INTEGER]
			-- Physical repositories of archetypes, keyed by logical id.
			-- Each such repository consists of archetypes arranged in a directory structure
			-- mimicking an ontological structure, e.g. ehr/entry/observation, etc.

feature -- Comparison

	valid_repository_path (dir_name: STRING): BOOLEAN
			-- Does `dir_name' correspond to a real directory, which is not the same as, or a
			-- parent or child of, any directory already used to populate the tree?
		local
			s1, s2: STRING
		do
			Result := directory_exists (dir_name)

			if Result then
				s1 := file_system.canonical_pathname (dir_name)

				if s1.item (s1.count) /= os_directory_separator then
					s1.append_character (os_directory_separator)
				end

				from repositories.start until repositories.off or not Result loop
					s2 := repositories.item_for_iteration.root_path.twin

					if s2.item (s2.count) /= os_directory_separator then
						s2.append_character (os_directory_separator)
					end

					Result := not s1.starts_with (s2) and not s2.starts_with (s1)
					repositories.forth
				end
			end
		ensure
			false_if_void: Result implies dir_name /= Void
		end

feature -- Modification

	set_reference_repository (dir_name: STRING)
			-- Scan the reference repository at path `dir_name'.
		require
			dir_name_valid: valid_repository_path (dir_name)
		do
			create {ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP} reference_repository.make (file_system.canonical_pathname (dir_name), Group_id_reference)
			repositories.force(reference_repository, reference_repository.group_id)
		ensure
			reference_repository /= Void
		end

	set_work_repository (dir_name: STRING)
			-- Scan the work repository at path `dir_name'.
		require
			dir_name_valid: valid_repository_path (dir_name)
		do
			create {ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP} work_repository.make (file_system.canonical_pathname (dir_name), Group_id_work)
			repositories.force(work_repository, work_repository.group_id)
		ensure
			work_repository /= Void
		end

	remove_work_repository
			-- remove work repository from the surce repositories
		do
			if repositories.has(Group_id_work) then
				repositories.remove(Group_id_work)
				work_repository := Void
			end
		end

invariant
	adhoc_source_repository_group_id: adhoc_source_repository.group_id = 1
	repositories_group_ids: repositories.for_all (agent (repository: attached ARCHETYPE_INDEXED_REPOSITORY_I): BOOLEAN
		do
			Result := repository.group_id > 1
		end)

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
--| The Original Code is source_repositories.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
