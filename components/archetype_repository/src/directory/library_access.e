note
	component:   "openEHR ADL Tools"
	description: "[
				 Source repositories providing access to source archetypes & templates.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class LIBRARY_ACCESS

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

create
	make

feature -- Definitions

	Group_id_adhoc: INTEGER = 1

	Group_id_reference: INTEGER = 2

	Group_id_work: INTEGER = 3

feature -- Initialisation

	make (a_ref_repo_dir_path: STRING)
		require
			dir_name_valid: directory_exists (a_ref_repo_dir_path)
		local
			ref_repo: attached like reference_repository
		do
			create repositories.make (0)
			create adhoc_source_repository.make (Group_id_adhoc)
			check attached file_system.canonical_pathname (a_ref_repo_dir_path) as cpn then
				create {ARCHETYPE_INDEXED_FILE_LIBRARY_IMP} ref_repo.make (cpn, Group_id_reference)
			end
			repositories.force (ref_repo, ref_repo.group_id)
			reference_repository := ref_repo
		ensure
			Ref_repo_attached: attached reference_repository
			Work_repo_cleared: not attached work_repository
		end

feature -- Access

	reference_repository: detachable ARCHETYPE_INDEXED_LIBRARY_I
			-- physical reference repository

	work_repository: detachable ARCHETYPE_INDEXED_LIBRARY_I
			-- physical work repository (optional)

	adhoc_source_repository: ARCHETYPE_ADHOC_FILE_LIBRARY
			-- An additional 'repository' where archetypes may be found, but not necessarily classified
			-- under any structure - used e.g. to represent the file local system where isolated archetypes
			-- may be found, e.g. in c:\temp, /tmp or wherever. This repository is just a list of
			-- archetypes keyed by path on the file system. They are not merged onto the directory
			-- but 'grafted' - a simpler operation.

	repositories: HASH_TABLE [ARCHETYPE_INDEXED_LIBRARY_I, INTEGER]
			-- Physical repositories of archetypes, keyed by logical id.
			-- Each such repository consists of archetypes arranged in a directory structure
			-- mimicking an ontological structure, e.g. ehr/entry/observation, etc.

feature -- Comparison

	valid_working_repository_path (dir_name: STRING): BOOLEAN
			-- Does `dir_name' correspond to a real directory, which is not the same as, or a parent or child of,
			-- any directory (except the working repository) already used to populate the tree?
		local
			s1, s2: STRING
		do
			Result := directory_exists (dir_name)
			if Result then
				check attached file_system.canonical_pathname (dir_name) as cpn then
					s1 := cpn
				end
				if s1.item (s1.count) /= os_directory_separator then
					s1.append_character (os_directory_separator)
				end
				from repositories.start until repositories.off or not Result loop
					if not repositories.key_for_iteration.is_equal (group_id_work) then
						s2 := repositories.item_for_iteration.full_path.twin
						if s2.item (s2.count) /= os_directory_separator then
							s2.append_character (os_directory_separator)
						end
						Result := not s1.starts_with (s2) and not s2.starts_with (s1)
					end
					repositories.forth
				end
			end
		end

feature -- Modification

	set_work_repository (a_work_repo_dir_path: STRING)
			-- Scan the work repository at path `a_work_repo_dir_path'.
		require
			dir_name_valid: valid_working_repository_path (a_work_repo_dir_path)
		local
			work_repo: attached like work_repository
		do
			check attached file_system.canonical_pathname (a_work_repo_dir_path) as wdp then
				create {ARCHETYPE_INDEXED_FILE_LIBRARY_IMP} work_repo.make (wdp, Group_id_work)
			end
			repositories.force (work_repo, work_repo.group_id)
			work_repository := work_repo
		ensure
			Work_repo_attached: attached work_repository
		end

	remove_work_repository
			-- remove work repository from the surce repositories
		do
			if repositories.has (Group_id_work) then
				repositories.remove (Group_id_work)
				work_repository := Void
			end
		ensure
			Work_repo_cleared: not attached work_repository
		end

invariant
	adhoc_source_repository_group_id: adhoc_source_repository.group_id = 1
	repositories_group_ids: repositories.linear_representation.for_all (agent (repo: ARCHETYPE_INDEXED_LIBRARY_I): BOOLEAN do Result := repo.group_id > 1 end)

end


