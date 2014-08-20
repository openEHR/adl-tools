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
			create failed_interfaces.make (0)
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

	has (a_lib_key: STRING): BOOLEAN
			-- True if there is a library with key `a_lib_key', which should be of the form
			-- "maintainer-short_name"
		do
			Result := interfaces.has (a_lib_key)
		end

	has_item (a_lib_if: ARCHETYPE_LIBRARY_INTERFACE): BOOLEAN
			-- True if `a_lib_if' exists in libraries list
		do
			Result := interfaces.has_item (a_lib_if)
		end

	is_empty: BOOLEAN
			-- True if any valid repositories were found
		do
			Result := interfaces.is_empty
		end

feature -- Validation

	failed_interfaces: ARRAYED_LIST [ARCHETYPE_LIBRARY_INTERFACE]
			-- library interface objects that failed to properly load

	remove_failed_interface (a_lib_if: ARCHETYPE_LIBRARY_INTERFACE)
			-- remove `a_lib_if' from failed interfaces
		do
			if failed_interfaces.has (a_lib_if) then
				failed_interfaces.prune (a_lib_if)
			end
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [ARCHETYPE_LIBRARY_INTERFACE, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := interfaces.new_cursor
		end

feature {ARCHETYPE_REPOSITORY_INTERFACE} -- Modification

	wipe_out
			-- remove all repositories
		do
			interfaces.wipe_out
		end

	remove (a_repository_key: STRING)
			-- remove library with key `a_repository_key'
		require
			has (a_repository_key)
		do
			interfaces.remove (a_repository_key)
		ensure
			not has (a_repository_key)
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
			if arch_lib_if.has_definition then
				interfaces.force (arch_lib_if, arch_lib_if.key)
			else
				failed_interfaces.extend (arch_lib_if)
			end
		end

	extend_new (a_library_path, a_repository_key: STRING; remote_flag: BOOLEAN)
			-- create new library at path `a_library_path' and create an interface for it
		require
			Directory_path_valid: directory_exists (a_library_path)
		local
			arch_lib_if: ARCHETYPE_LIBRARY_INTERFACE
		do
			create arch_lib_if.make_new (a_library_path, a_repository_key, remote_flag)
			interfaces.force (arch_lib_if, arch_lib_if.key)
		end

feature -- Modification

	reload (arch_lib_if: ARCHETYPE_LIBRARY_INTERFACE)
			-- reload an existing library interface's definition, which could change its key
		require
			arch_lib_if.has_definition and has (arch_lib_if.key)
		local
			old_key: STRING
		do
			old_key := arch_lib_if.key
			arch_lib_if.reload_library_definition
			if not arch_lib_if.key.is_equal (old_key) then
				interfaces.replace_key (arch_lib_if.key, old_key)
			end
		end

feature {NONE} -- Implementation

	interfaces: HASH_TABLE [ARCHETYPE_LIBRARY_INTERFACE, STRING]
			-- library interface objects, keyed by library short name

end



