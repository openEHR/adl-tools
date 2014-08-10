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
			{ANY} deep_copy, standard_is_equal, is_deep_equal, deep_twin
		end

	SHARED_ARCHETYPE_LIBRARY_INTERFACES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Repository_file_name: STRING = "_repo.idx"
			-- name of definition file at root point of repository

	Repository_definition_unavailable: STRING = "(definition not found)"

feature -- Initialisation

	make (a_dir: STRING)
		do
			repository_directory := a_dir
			create repository_definition_accessor.make (repository_definition_file_path)
			if attached repository_definition_accessor.object as att_obj then
				repository_definition := att_obj

				-- find all the repositories below this point
				populate_libraries
			end
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
		local
			file_rep: FILE_REPOSITORY
		do
			-- this may not be a first time call, so we need to get rid of libraries currently listed for
			-- this repository in the main library list
			across library_interfaces as libs_csr loop
				archetype_library_interfaces.remove (libs_csr.key)
			end

			-- now re-evaluate from the file system
			create file_rep.make (repository_directory, {ARCHETYPE_LIBRARY_INTERFACE}.lib_file_name)
			across file_rep.matching_paths as lib_def_file_paths_csr loop
				-- this statement just adds the libraries under this repository to the overall library list
				-- which consists of libraries from all repositories
				archetype_library_interfaces.extend (file_system.dirname (lib_def_file_paths_csr.item), repository_directory)
			end
		end

feature {NONE} -- Implementation

	parser: ODIN_PARSER
		once
			create Result.make
		end

end

