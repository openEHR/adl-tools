note
	component:   "openEHR ADL Tools"
	description: "[
				 Shared access to 'archteype directories'. An archetype directory is an in-memory logical catalogue of
				 archetypes & templates corresponding to a single 'repository'. Each repository may reference one or more 
				 source locations, providing reference and working repositories, with the pseudo-location 'adhoc'
				 enabling archetypes to be added adhoc to a directory.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_LIBRARIES

inherit
	SHARED_ADL_APP_RESOURCES

	SHARED_ARCHETYPE_LIBRARY_INTERFACES
		export
			{NONE} all
		end

feature -- Access

	current_library: ARCHETYPE_LIBRARY
			-- application-wide archetype directory access
		require
			is_current_library_valid
		do
			if not libraries.has (current_library_name) then
				use_current_library (False)
			end
			check attached libraries.item (current_library_name) as ac then
				Result := ac
			end
		end

	use_current_library (refresh: BOOLEAN)
			-- switch to current library; refresh flag forces archetype in-memory library to be refreshed from source location
		require
			is_current_library_valid
		local
			new_lib: ARCHETYPE_LIBRARY
		do
			init_gen_dirs_from_current_library
			if not libraries.has (current_library_name) or else refresh then
				new_lib := archetype_library_interfaces.item (current_library_name).create_library
				libraries.force (new_lib, current_library_name) -- replace original copy if it was there
			end
		end

	current_library_interface: ARCHETYPE_LIBRARY_INTERFACE
		require
			has_current_library
		do
			Result := archetype_library_interfaces.item (current_library_name)
		end

feature -- Status Report

	has_libraries: BOOLEAN
		do
			Result := not archetype_library_interfaces.is_empty
		end

	has_current_library: BOOLEAN
		do
			Result := archetype_library_interfaces.has (current_library_name)
		end

	has_library (a_key: STRING): BOOLEAN
		do
			Result := archetype_library_interfaces.has (a_key)
		end

	is_current_library_valid: BOOLEAN
			-- check validity of library directories etc - can it be created and loaded?
		require
			has_current_library
		do
			Result := has_current_library and then archetype_library_interfaces.item (current_library_name).is_valid
		end

feature {NONE} -- Implementation

	libraries: HASH_TABLE [ARCHETYPE_LIBRARY, STRING]
			-- hash of all archetype libraries used so far in the current session;
			-- keyed by library name;
			-- lazy populated
		once ("PROCESS")
			create Result.make (0)
		end

end


