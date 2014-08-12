note
	component:   "openEHR ADL Tools"
	description: "[
				 Access object for archetype repository. A 'repository' is assumed to contain one
				 or more 'libraries' where a 'library' is a logical collection of archetypes.

				 At the root of the repository will be a file whose name is '_repo.idx'
				 ]"
	keywords:    "ADL, archetype, repository"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPOSITORY_INTERFACE

inherit
	SHARED_APP_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, standard_is_equal, is_deep_equal, deep_twin, directory_exists
		end

	SHARED_ARCHETYPE_LIBRARY_INTERFACES
		export
			{NONE} all
		end

create
	make, make_new

feature -- Definitions

	Repository_file_name: STRING = "_repo.idx"
			-- name of definition file at root point of repository

	Repository_definition_unavailable: STRING = "(definition not found)"

	Git_control_directory: STRING = ".git"

	Svn_control_directory: STRING = ".svn"

feature -- Initialisation

	make (a_dir: STRING)
		do
			repository_directory := a_dir
			create repository_definition_accessor.make_load (repository_definition_file_path)
			if attached repository_definition_accessor.object as att_obj then
				repository_definition := att_obj

				-- find all the repositories below this point
				populate_libraries
			end
		end

	make_new (a_dir: STRING)
		do
			repository_directory := a_dir
			create repository_definition_accessor.make (repository_definition_file_path)
			create repository_definition.make_template
			repository_definition_accessor.save (repository_definition)
		end

feature -- Access

	repository_directory: STRING
			-- repository root directory

	repository_definition_file_path: STRING
			-- path of definition file in repository root directory
		do
			Result := file_system.pathname (repository_directory, Repository_file_name)
		end

	repository_definition_accessor: ODIN_OBJECT_READER [ARCHETYPE_REPOSITORY_DEFINITION]

	repository_definition: detachable ARCHETYPE_REPOSITORY_DEFINITION
		note
			option: stable
		attribute
		end

	library_interfaces: HASH_TABLE [ARCHETYPE_LIBRARY_INTERFACE, STRING]
			-- generate list of libraries of this repository, keyed by library id
		do
			create Result.make (0)
			across archetype_library_interfaces as lib_interfaces_csr loop
				if lib_interfaces_csr.item.repository_key.is_equal (repository_directory) then
					Result.put (lib_interfaces_csr.item, lib_interfaces_csr.key)
				end
			end
		end

	key: STRING
		do
			if attached repository_definition as att_rep_def then
				Result := att_rep_def.key
			else
				Result := Repository_definition_unavailable
			end
		end

feature -- Status Report

	has_libraries: BOOLEAN
			-- True if the repo has no libraries
		do
			Result := across archetype_library_interfaces as lib_interfaces_csr some
				lib_interfaces_csr.item.repository_key.is_equal (repository_directory) end
		end

	is_git_repository: BOOLEAN
			-- True if the repo has a .git directory
		do
			Result := file_system.directory_exists (file_system.pathname (repository_directory, Git_control_directory))
		end

	is_svn_repository: BOOLEAN
			-- True if the repository has a .svn directory
		do
			Result := file_system.directory_exists (file_system.pathname (repository_directory, Svn_control_directory))
		end

feature -- Validation

	valid_new_library_path (lib_path: STRING): BOOLEAN
			-- path must be a sub-path of the repository directory, but not be a sub-path
			-- or parent path of any existing library
		do
			Result := file_system.is_subpathname (repository_directory, lib_path) and
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
			Result.append (repository_definition_accessor.errors)

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
				if lib_interfaces_csr.item.repository_key.is_equal (repository_directory) then
					Result.extend (lib_interfaces_csr.item)
				end
			end
		end

feature -- Commands

	reload_repository_definition
			-- reload definition file
		do
			repository_definition_accessor.load
			if attached repository_definition_accessor.object as att_obj then
				repository_definition := att_obj
			end
		end

	populate_libraries
			-- populate libraries from the file system or other external medium
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
			create file_rep.make (repository_directory, {ARCHETYPE_LIBRARY_INTERFACE}.lib_file_name)
			across file_rep.matching_paths as lib_def_file_paths_csr loop
				-- this statement just adds the libraries under this repository to the overall library list
				-- which consists of libraries from all repositories
				archetype_library_interfaces.extend (file_system.dirname (lib_def_file_paths_csr.item), repository_directory)
			end
		end

	add_new_library (a_library_path: STRING; remote_flag: BOOLEAN)
			-- create new library at path `a_library_path' and create an interface for it
		require
			Directory_path_valid: directory_exists (a_library_path)
		local
			arch_lib_if: ARCHETYPE_LIBRARY_INTERFACE
		do
			archetype_library_interfaces.extend_new (a_library_path, repository_directory, remote_flag)
		end

	add_new_library_here (remote_flag: BOOLEAN)
			-- create new library repository root and create an interface for it
		local
			arch_lib_if: ARCHETYPE_LIBRARY_INTERFACE
		do
			archetype_library_interfaces.extend_new (repository_directory, repository_directory, remote_flag)
		end

feature {NONE} -- Implementation

	parser: ODIN_PARSER
		once
			create Result.make
		end

end

