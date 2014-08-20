note
	component:   "openEHR ADL Tools"
	description: "Set of archetype repositories read by tool at startup"
	keywords:    "ADL, archetype, repository"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPOSITORY_INTERFACES

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

	SHARED_EXTERNAL_TOOL_INTERFACES

	TABLE_ITERABLE [ARCHETYPE_REPOSITORY_INTERFACE, STRING]

create
	make

feature -- Initialisation

	make
		do
			create repositories.make (0)
			create last_duplicate_key_path.make_empty
		end

feature -- Access

	item (a_repo_path: STRING): ARCHETYPE_REPOSITORY_INTERFACE
		require
			has (a_repo_path)
		do
			check attached repositories.item (a_repo_path) as att_repo_if then
				Result := att_repo_if
			end
		end

feature -- Status Report

	has (a_repo_local_path: STRING): BOOLEAN
			-- True if a repository at `a_repo_local_path' already loaded
		do
			Result := repositories.has (a_repo_local_path)
		end

	has_key (a_key: STRING): BOOLEAN
			-- True if a repository with logical key `a_key' already loaded
		do
			Result := across repositories as repos_csr some repos_csr.item.key.is_equal (a_key) end
		end

	has_remote_repository (a_url: STRING): BOOLEAN
			-- True if there is an installed repository with the remote URL `a_url'
		do
			Result := across repositories as repos_csr some
				repos_csr.item.has_remote_repository and then repos_csr.item.remote_url.is_equal (a_url) end
		end

	is_empty: BOOLEAN
			-- True if any valid repositories were found
		do
			Result := repositories.is_empty
		end

	valid_repository_path (a_path: STRING): BOOLEAN
			-- a repository index file exists in this location, but has not been added to
			-- `repositories' - i.e. `a_path' is a valid path to add to `repositories'
		do
			Result := file_system.file_exists (file_system.pathname (a_path, {ARCHETYPE_REPOSITORY_INTERFACE}.repository_file_name)) and
				not repositories.has (a_path)
		end

	valid_candidate_repository (a_path: STRING): BOOLEAN
			-- Check if `a_repository_path' is a valid existing repository that can be loaded.
			-- True if:
			--	- `a_repository_path' exists
			--	- there is not already a repository loaded at that path (can't load same repo twice)
			-- 	- the repository definition on the file system is not a duplicate of one already loaded (e.g. dup of Git repo)
		local
			arch_rep_if: ARCHETYPE_REPOSITORY_INTERFACE
		do
			last_duplicate_key_path.wipe_out
			if valid_repository_path (a_path) then
				create arch_rep_if.make_local (a_path)
				if not has_key (arch_rep_if.key) then
					Result := True
				else
					across repositories as repos_csr loop
						if repos_csr.item.key.is_equal (arch_rep_if.key) then
							last_duplicate_key_path := repos_csr.item.local_directory
						end
					end
				end
			end
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [ARCHETYPE_REPOSITORY_INTERFACE, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := repositories.new_cursor
		end

feature -- Validation

	last_duplicate_key_path: STRING
			-- path of loaded repository which has same key as the candidate repo path in last call to `valid_candidate_repository'

feature -- Commands

	wipe_out
			-- remove all repositories
		do
			repositories.wipe_out
		end

	reload
			-- reload all repositories
		do
			across repositories as repos_csr loop
				repos_csr.item.reload_repository_definition
				repos_csr.item.populate_libraries
			end
		end

	extend (a_repository_path: STRING)
			-- create repository interface for repository at path `a_repository_path'
		require
			Repository_path_valid: valid_candidate_repository (a_repository_path)
		local
			arch_rep_if: ARCHETYPE_REPOSITORY_INTERFACE
		do
			create arch_rep_if.make_local (a_repository_path)
			arch_rep_if.populate_libraries
			repositories.force (arch_rep_if, a_repository_path)
		end

	extend_create_local (a_repository_path: STRING)
			-- create new local repository at path `a_repository_path' and create an interface for it
		require
			Directory_path_valid: directory_exists (a_repository_path)
		local
			arch_rep_if: ARCHETYPE_REPOSITORY_INTERFACE
		do
			create arch_rep_if.make_create_local_only (a_repository_path)
			repositories.force (arch_rep_if, a_repository_path)
		end

	extend_create_local_from_remote (a_local_parent_dir, a_repository_url, a_repo_type: STRING)
			-- create new remote repository proxy using `a_repository_url'
		require
			Url_valid: not a_repository_url.is_empty
			Valid_repo_type: valid_vcs_type (a_repo_type)
		local
			arch_rep_if: ARCHETYPE_REPOSITORY_INTERFACE
		do
			create arch_rep_if.make_create_local_from_remote (a_local_parent_dir, a_repository_url, a_repo_type)
			repositories.force (arch_rep_if, arch_rep_if.local_directory)
		ensure
			has_remote_repository (a_repository_url)
		end

feature {NONE} -- Implementation

	repositories: HASH_TABLE [ARCHETYPE_REPOSITORY_INTERFACE, STRING]
			-- repository interface objects, keyed by repo path

end



