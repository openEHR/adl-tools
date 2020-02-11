note
	component:   "openEHR ADL Tools"
	description: "[
				 Access object for archetype repository. A 'repository' is assumed to contain one
				 or more 'libraries' where a 'library' is a logical collection of archetypes.

				 At the root of the repository will be a file whose name is '_repo.idx'.
				 ]"
	keywords:    "ADL, archetype, repository"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPOSITORY_INTERFACE

inherit
	SHARED_ARCHETYPE_REPOSITORY_INTERFACES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_LIBRARY_INTERFACES
		export
			{NONE} all
		end

	SHARED_EXTERNAL_TOOL_INTERFACES
		export
			{NONE} all;
			{ANY} directory_exists, is_vcs_checkout_area, tool_supported, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make_associate_with_remote, make, make_clone_remote_and_checkout

feature -- Definitions

	Repository_file_name: STRING = "_repo.idx"
			-- name of definition file at root point of repository

	Repository_definition_unavailable: STRING = "(definition not found)"

feature -- Initialisation

	make (a_local_dir: STRING)
		do
			local_directory := a_local_dir
		ensure
			not has_repository_access
		end

	make_clone_remote_and_checkout (a_local_parent_dir, a_remote_url, a_repository_type: STRING)
			-- make with a local directory and remote access URI and type;
			-- perform local repository clone operation
		require
			Valid_repository_type: tool_supported (a_repository_type)
		do
			repository_type := a_repository_type
			check attached {VCS_TOOL_INTERFACE} create_tool_interface (a_repository_type) as att_if then
				repository_access := att_if
			end
			repository_access.initialise_clone_remote_and_checkout (a_local_parent_dir, a_remote_url)
			local_directory := repository_access.local_repository_directory
		ensure
			has_repository_access
		end

	make_associate_with_remote (a_local_dir: STRING)
			-- make with an existing local directory; determine remote from local copy
		require
			Has_checkout: is_vcs_checkout_area (a_local_dir)
		do
			local_directory := a_local_dir
			repository_type := vcs_checkout_area_type (a_local_dir)
			if attached {VCS_TOOL_INTERFACE} create_tool_interface_from_checkout (local_directory) as att_if then
				repository_access := att_if
			end
		ensure
			Local_directory_set: local_directory = a_local_dir
			Repository_type_set: repository_type = vcs_checkout_area_type (a_local_dir)
			Repository_access_if_tool_available: tool_supported (repository_type) implies has_repository_access
		end

feature -- Access

	repository_type: STRING
			-- type of repository, e.g. "git" etc
		attribute
			create Result.make_empty
		end

	local_directory: STRING
			-- repository local file-system root directory
		attribute
			create Result.make_empty
		end

	repository_definition_file_path: STRING
			-- path of definition file in local repository root directory
		require
			has_local_directory
		do
			Result := file_system.pathname (local_directory, Repository_file_name)
		end

	repository_definition: ARCHETYPE_REPOSITORY_DEFINITION
		require
			has_local_directory
		do
			if attached local_definition_cache as att_local_def then
				Result := att_local_def
			else
				if not attached local_definition_file_access then
					create local_definition_file_access.make_load (repository_definition_file_path)
				end
				if attached local_definition_file_access.object as att_obj then
					Result := att_obj
				else
					create Result.make_template ((archetype_repository_interfaces.count + 1).out)
					local_definition_file_access.save (Result, True)
				end
			end
		end

	library_interfaces: HASH_TABLE [ARCHETYPE_LIBRARY_INTERFACE, STRING]
			-- generate list of libraries of this repository, keyed by library id
		require
			has_local_directory
		do
			create Result.make (0)
			across archetype_library_interfaces as lib_interfaces_csr loop
				if lib_interfaces_csr.item.repository_key.is_equal (local_directory) then
					Result.put (lib_interfaces_csr.item, lib_interfaces_csr.key)
				end
			end
		end

	key: STRING
		do
			Result := repository_definition.key
		end

	remote_url: STRING
			-- URL of remote repository
		do
			create Result.make_empty
			if attached repository_access then
				Result.append (repository_access.remote_repository_url)
			end
		end

	remote_repository_type: STRING
			-- type of remote repository if applicable
		do
			if attached repository_access then
				Result := repository_access.tool_name
			else
				create Result.make_empty
			end
		end

	checked_out_branch: STRING
			-- name of branch locally checked out
		do
			if attached repository_access then
				Result := repository_access.checked_out_branch
			else
				create Result.make_empty
			end
		end

	available_branches: ARRAYED_LIST [STRING]
			-- list of all available branches for this repo
		do
			if attached available_branches_cache then
				Result := available_branches_cache
			elseif attached repository_access then
				Result := repository_access.available_branches
				available_branches_cache := Result
			else
				create Result.make (0)
			end
		end

	uncommitted_files: ARRAYED_LIST [TUPLE [status, filename: STRING]]
			-- list of uncommitted changes on current branch
		do
			if attached repository_access then
				Result := repository_access.uncommitted_files
			else
				create Result.make (0)
			end
		end

	get_synchronisation_status
			-- status of sync between local and remote repository
		do
			if attached repository_access then
				last_synchronisation_status := repository_access.synchronisation_status
			end
		end

	last_synchronisation_status: INTEGER
			-- result of last call to `synchronisation_status', usable when calling
			-- context knows that sync status has not changed.

	get_merge_status
			-- merge status of sync between local and remote repository
			-- may be slow!
		do
			if attached repository_access then
				last_merge_status := repository_access.merge_status
			end
		end

	last_merge_status: INTEGER
			-- result of last call to `merge_status', usable when calling
			-- context knows that sync status has not changed.

feature -- Status Report

	is_checkout_area: BOOLEAN
			-- is this repository a checkout area of some kind?
		do
			Result := not repository_type.is_empty
		end

	has_local_directory: BOOLEAN
			-- True if a local repository path and definition exists
		do
			Result := not local_directory.is_empty
		end

	has_repository_access: BOOLEAN
			-- True if there is a definition for a remote location corresponding to this repository
		do
			Result := attached repository_access
		end

	has_repository_tool: BOOLEAN
			-- True if the external tool required (e.g. git, svn) for working with the repository is available
		do
			Result := system_has_command (repository_type)
		end

	has_libraries: BOOLEAN
			-- True if the repo has no libraries
		do
			Result := across archetype_library_interfaces as lib_interfaces_csr some
				lib_interfaces_csr.item.repository_key.is_equal (local_directory) end
		end

feature -- Validation

	valid_new_library_path (lib_path: STRING): BOOLEAN
			-- path must be a sub-path of the repository directory, but not be a sub-path
			-- or parent path of any existing library
		do
			Result := file_system.is_subpathname (local_directory, lib_path) and
				(not has_libraries or else
				not across archetype_library_interfaces as lib_interfaces_csr some
						file_system.is_subpathname (lib_interfaces_csr.item.library_path, lib_path) or
						file_system.is_subpathname (lib_path, lib_interfaces_csr.item.library_path)
					end)
		end

	errors: ERROR_ACCUMULATOR
			-- obtain any errors from definition file load
		do
			create Result.make
			Result.append (local_definition_file_access.errors)

			-- errors of loaded libraries
			across library_interfaces as lib_ifs_csr loop
				Result.append (lib_ifs_csr.item.errors)
			end

			-- errors of failed libraries
			across failed_library_interfaces as lib_ifs_csr loop
				Result.append (lib_ifs_csr.item.errors)
			end
		end

	failed_library_interfaces: ARRAYED_LIST [ARCHETYPE_LIBRARY_INTERFACE]
			-- generate list of failed libraries of this repository, for error reporting
		do
			create Result.make (0)
			across archetype_library_interfaces.failed_interfaces as lib_interfaces_csr loop
				if lib_interfaces_csr.item.repository_key.is_equal (local_directory) then
					Result.extend (lib_interfaces_csr.item)
				end
			end
		end

feature -- Commands

	pull_from_remote
			-- Update local checkout/clone from remote; result in last_result
		require
			has_repository_access
		do
			check attached repository_access as att_rm_acc then
				att_rm_acc.do_pull
			end
		end

	fetch_from_remote
			-- Do fetch from remote to update local index; result in last_result
		require
			has_repository_access
		do
			check attached repository_access then
				repository_access.do_fetch
			end
		end

	stage_all
			-- stage all changes from local file system to local repository
		require
			has_repository_access
		do
			check attached repository_access then
				repository_access.do_stage_all
			end
		end

	stage_files (a_file_list: ARRAYED_LIST [STRING])
			-- stage changes from local file system to local repository
		require
			has_repository_access
		do
			check attached repository_access then
				repository_access.do_stage_files (a_file_list)
			end
		end

	clean_files (a_file_list: ARRAYED_LIST [STRING])
			-- clean untracked files from local file system
		require
			has_repository_access
		do
			check attached repository_access then
				repository_access.do_clean_files (a_file_list)
			end
		end

	revert_files (a_file_list: ARRAYED_LIST [STRING])
			-- revert changes to tracked files from local file system
		require
			has_repository_access
		do
			check attached repository_access then
				repository_access.do_revert_files (a_file_list)
			end
		end

	commit (a_commit_msg: STRING)
			-- Commit changes staged from local file system to local repository
		require
			has_repository_access
		do
			check attached repository_access then
				repository_access.do_commit (a_commit_msg)
			end
		end

	push_to_remote
			-- Push changes from local checkout/clone to remote; result in last_result
		require
			has_repository_access
		do
			check attached repository_access then
				repository_access.do_push
			end
		end

	checkout_branch (a_branch_name: STRING)
			-- checkout a different branch locally
		require
			Repository_valid: has_repository_access
			Branch_valid: available_branches.has (a_branch_name) and not a_branch_name.is_equal (checked_out_branch)
		do
			check attached repository_access then
				repository_access.do_checkout_branch (a_branch_name)
			end
		end

	reload_repository_definition
			-- reload definition file
		require
			has_local_directory
		do
			local_definition_file_access.load
			local_definition_cache := Void
		end

	populate_libraries
			-- populate libraries from the file system or other external medium
		require
			has_local_directory
		local
			file_rep: FILE_REPOSITORY
		do
			-- this may not be a first time call, so we need to get rid of libraries currently listed for
			-- this repository in the main library list
			across library_interfaces as libs_csr loop
				archetype_library_interfaces.remove (libs_csr.key)
			end

			across failed_library_interfaces as libs_csr loop
				archetype_library_interfaces.remove_failed_interface (libs_csr.item)
			end

			-- now re-evaluate from the file system
			create file_rep.make_fixed (local_directory, {ARCHETYPE_LIBRARY_INTERFACE}.lib_file_name)
			across file_rep.matching_paths as lib_def_file_paths_csr loop
				-- this statement just adds the libraries under this repository to the overall library list
				-- which consists of libraries from all repositories
				archetype_library_interfaces.extend (file_system.dirname (lib_def_file_paths_csr.item), local_directory)
			end
		end

	add_new_library (a_library_path: STRING; remote_flag: BOOLEAN)
			-- create new library at path `a_library_path' and create an interface for it
		require
			Directory_path_valid: directory_exists (a_library_path)
			Local_repository_exists: has_local_directory
		do
			archetype_library_interfaces.extend_new (a_library_path, local_directory, remote_flag)
		end

	add_new_library_here (remote_flag: BOOLEAN)
			-- create new library repository root and create an interface for it
		require
			Local_repository_exists: has_local_directory
		do
			archetype_library_interfaces.extend_new (local_directory, local_directory, remote_flag)
		end

feature {NONE} -- Implementation

	available_branches_cache: detachable ARRAYED_LIST [STRING]
		note
			option: stable
		attribute
		end

	repository_access: detachable VCS_TOOL_INTERFACE
			-- repo access object; specific subtype for remote repository type

	local_definition_file_access: detachable ODIN_OBJECT_READER [ARCHETYPE_REPOSITORY_DEFINITION]
			-- file accessor for the local definition file
		note
			option: stable
		attribute
		end

	parser: ODIN_PARSER
		once
			create Result.make
		end

	local_definition_cache: detachable ARCHETYPE_REPOSITORY_DEFINITION

end

