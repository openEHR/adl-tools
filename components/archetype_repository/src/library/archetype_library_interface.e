note
	component:   "openEHR ADL Tools"
	description: "[
				 Interface to library containing source archetypes & templates.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY_INTERFACE

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

create
	make, make_new

feature -- Definitions

	Group_id_adhoc: INTEGER = 1

	Group_id_primary: INTEGER = 2

	lib_file_name: STRING = "_repo_lib.idx"
			-- name of definition file at root point of library, within repository

	Library_definition_unavailable: STRING = "(definition not found)"

feature -- Initialisation

	make (a_library_path, a_repository_key: STRING)
		require
			dir_name_valid: directory_exists (a_library_path)
		do
			create {ARCHETYPE_INDEXED_FILE_LIBRARY_IMP} primary_source.make (file_system.canonical_pathname (a_library_path), Group_id_primary)

			-- create adhoc file source, in case it is ever needed - allows user to open any archetype file
			-- outside library and attach it to the library for the duration of the session
			create adhoc_source.make (Group_id_adhoc)
			repository_key := a_repository_key
		end

	make_new (a_library_path, a_repository_key: STRING; remote_flag: BOOLEAN)
		require
			dir_name_valid: directory_exists (a_library_path)
		do
			create {ARCHETYPE_INDEXED_FILE_LIBRARY_IMP} primary_source.make (file_system.canonical_pathname (a_library_path), Group_id_primary)

			-- create adhoc file source, in case it is ever needed - allows user to open any archetype file
			-- outside library and attach it to the library for the duration of the session
			create adhoc_source.make (Group_id_adhoc)
			repository_key := a_repository_key

			-- create library definition file
			save_library_definition (create {ARCHETYPE_LIBRARY_DEFINITION}.make_template (remote_flag))
		end

feature -- Access

	library_definition: detachable ARCHETYPE_LIBRARY_DEFINITION
		require
			has_library_path
		do
			if attached library_definition_cache as att_local_def then
				Result := att_local_def
			else
				if not attached library_definition_file_access then
					create library_definition_file_access.make_load (library_definition_file_path)
				end
				if attached library_definition_file_access.object as att_obj then
					Result := att_obj
				end
			end
		end

	library_path: STRING
			-- directory path of library
		do
			Result := primary_source.full_path
		end

	library_definition_file_path: STRING
			-- directory path of library
		do
			Result := file_system.pathname (library_path, lib_file_name)
		end

	key: STRING
		do
			if attached library_definition as att_lib_def then
				Result := att_lib_def.key
			else
				Result := Library_definition_unavailable
			end
		end

	repository_key: STRING
			-- unique key of the repository to which this library belongs

	primary_source: ARCHETYPE_INDEXED_LIBRARY_I
			-- primary physical artefact source

	adhoc_source: ARCHETYPE_ADHOC_FILE_SOURCE
			-- An additional 'source' where archetypes may be found, but not necessarily classified
			-- under any structure - used e.g. to represent the file local system where isolated archetypes
			-- may be found, e.g. in c:\temp, /tmp or wherever. This repository is just a list of
			-- archetypes keyed by path on the file system. They are not merged onto the directory
			-- but 'grafted' - a simpler operation.

feature -- Status Report

	is_valid: BOOLEAN
			-- True if this repository location exists
		do
			Result := directory_exists (library_path)
		end

	has_library_path: BOOLEAN
			-- rue if `library_path' has been set
		do
			Result := not library_path.is_empty
		end

	has_definition: BOOLEAN
			-- True if the definition file contains a 'remote_copy' section
		do
			Result := attached library_definition
		end

	is_remote: BOOLEAN
			-- True if the definition file contains a 'remote_copy' section
		do
			Result := attached library_definition.remote
		end

feature -- Validation

	errors: ERROR_ACCUMULATOR
			-- obtain any errors from definition file load
		do
			Result := library_definition_file_access.errors
		end

feature {ARCHETYPE_LIBRARY_INTERFACES} -- Commands

	reload_library_definition
			-- reload definition file
		do
			library_definition_file_access.load
			library_definition_cache := Void
		end

	save_library_definition (a_def: ARCHETYPE_LIBRARY_DEFINITION)
			-- save `a_def' to library definition file
		do
			if not attached library_definition_file_access then
				create library_definition_file_access.make_load (library_definition_file_path)
			end
			library_definition_file_access.save (a_def)
		end

feature {SHARED_ARCHETYPE_LIBRARIES} -- Commands

	create_library: ARCHETYPE_LIBRARY
			-- create the in-memory representation of the archetype library file-system and populate it
		do
			create Result.make (Current)
			Result.populate
		end

feature {NONE} -- Implementation

	library_definition_file_access: detachable ODIN_OBJECT_READER [ARCHETYPE_LIBRARY_DEFINITION]

	library_definition_cache: detachable ARCHETYPE_LIBRARY_DEFINITION

end
