note
	component:   "openEHR ADL Tools"
	description: "Set of archetype repositories read by tool at startup"
	keywords:    "ADL, archetype, repository"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY_INTERFACES

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

	TABLE_ITERABLE [ARCHETYPE_LIBRARY_INTERFACE, STRING]

create
	make

feature -- Initialisation

	make
		do
			create interfaces.make (0)
		end

feature -- Access

	item (a_lib_short_name: STRING): ARCHETYPE_LIBRARY_INTERFACE
			-- get the library with key `a_lib_short_name'
		require
			has (a_lib_short_name)
		do
			check attached interfaces.item (a_lib_short_name) as att_lib_if then
				Result := att_lib_if
			end
		end

	keys: ARRAYED_LIST [STRING]
			-- list of all library keys
		do
			create Result.make_from_array (interfaces.current_keys)
		ensure
			not is_empty implies not Result.is_empty
		end

feature -- Status Report

	has (a_lib_short_name: STRING): BOOLEAN
			-- True if there is a library with key `a_lib_short_name'
		do
			Result := interfaces.has (a_lib_short_name)
		end

	is_empty: BOOLEAN
			-- True if any valid repositories were found
		do
			Result := interfaces.is_empty
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [ARCHETYPE_LIBRARY_INTERFACE, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := interfaces.new_cursor
		end

feature -- Commands

	wipe_out
			-- remove all repositories
		do
			interfaces.wipe_out
		end

	extend (a_library_path, a_repository_key: STRING)
			-- create library interface for library found at path `a_library_path'; record its
			-- repository key so the reverse relationship to its repository can be determined
		require
			Directory_path_valid: directory_exists (a_library_path)
		local
			arch_lib_if: ARCHETYPE_LIBRARY_INTERFACE
		do
			create arch_lib_if.make (a_library_path, a_repository_key)
			if attached arch_lib_if.library_definition as att_lib_def then
				interfaces.force (arch_lib_if, att_lib_def.key)
			end
		end

feature {NONE} -- Implementation

	interfaces: HASH_TABLE [ARCHETYPE_LIBRARY_INTERFACE, STRING]
			-- library interface objects, keyed by library short name

end



