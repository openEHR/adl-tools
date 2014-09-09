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
	SHARED_EXTERNAL_TOOL_INTERFACES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists, tool_supported, is_checkout_area
		end

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

	last_repository_interface: detachable ARCHETYPE_REPOSITORY_INTERFACE
			-- repository interface created by most recent create operation
		note
			option: stable
		attribute
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

	repository_exists_at_path (a_path: STRING): BOOLEAN
			-- a repository index file exists in this location
		do
			Result := file_system.file_exists (file_system.pathname (a_path, {ARCHETYPE_REPOSITORY_INTERFACE}.repository_file_name))
		end

	valid_new_repository_path (a_path: STRING): BOOLEAN
			-- True if a new repository can be established at `a_path'. This will fail if:
			--	`a_path' already exists OR
			--	`a_path' is a parent or child path of any other installed repository path
			--	`a_path' is a parent or child of any other repository that isn't yet installed
			--		(determined by checking for _repo.idx control files)
		do
			Result := not file_system.file_exists (file_system.pathname (a_path, {ARCHETYPE_REPOSITORY_INTERFACE}.repository_file_name)) and
				not across repositories as repos_csr some
						file_system.is_subpathname (repos_csr.key, a_path) or
						file_system.is_subpathname (a_path, repos_csr.key)
					end
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
			if repository_exists_at_path (a_path) and not repositories.has (a_path) then
				create arch_rep_if.make_associate_with_remote (a_path)
				if not has_key (arch_rep_if.key) then
					Result := True
				else
					across repositories as repos_csr loop
						if repos_csr.item.key.is_equal (arch_rep_if.key) then
							last_duplicate_key_path.append (repos_csr.item.local_directory)
						end
					end
				end
			end
		end

	valid_clone_directory (a_parent_dir, a_repository_url, a_repo_type: STRING): BOOLEAN
			-- `a_parent_dir' is a valid directory to create a clone of the repo with `a_repository_url' and `a_repo_type'
			-- if there is no directory under `a_parent_dir' of the repository name (derived from the URL), or else there
			-- is but it is empty
		local
			repo_path: STRING
		do
			repo_path := file_system.pathname (a_parent_dir, repository_name_from_url (a_repository_url, a_repo_type))
			Result := not file_system.directory_exists (repo_path) or else file_system.is_directory_empty (repo_path)
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
		do
			create last_repository_interface.make (a_repository_path)
			last_repository_interface.populate_libraries
			repositories.force (last_repository_interface, a_repository_path)
		end

	extend_create_local (a_repository_path: STRING)
			-- create new local repository at path `a_repository_path' and create an interface for it
		require
			Directory_path_valid: directory_exists (a_repository_path)
		do
			create last_repository_interface.make (a_repository_path)
			repositories.force (last_repository_interface, a_repository_path)
		end

	extend_associate_with_remote (a_repository_path: STRING)
			-- create new local repository at path `a_repository_path' and create an interface for it
		require
			Directory_path_valid: valid_candidate_repository (a_repository_path) and is_checkout_area (a_repository_path)
		do
			create last_repository_interface.make_associate_with_remote (a_repository_path)
			last_repository_interface.populate_libraries
			repositories.force (last_repository_interface, a_repository_path)
		end

	extend_checkout_from_remote (a_parent_dir, a_repository_url, a_repo_type: STRING)
			-- create new remote repository proxy using `a_repository_url'
		require
			Url_valid: not a_repository_url.is_empty
			Valid_repo_type: tool_supported (a_repo_type)
			Valid_repo_clone_directory: valid_clone_directory (a_parent_dir, a_repository_url, a_repo_type)
		do
			create last_repository_interface.make_checkout_from_remote (a_parent_dir, a_repository_url, a_repo_type)
			if last_command_succeeded then
				last_repository_interface.populate_libraries
				repositories.force (last_repository_interface, last_repository_interface.local_directory)
			end
		ensure
			has_remote_repository (a_repository_url)
		end

feature {NONE} -- Implementation

	repositories: HASH_TABLE [ARCHETYPE_REPOSITORY_INTERFACE, STRING]
			-- repository interface objects, keyed by repo path

end



