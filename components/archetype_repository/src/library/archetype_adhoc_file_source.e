note
	component:   "openEHR ADL Tools"
	description: "[
				 File-system ad hoc library of archetypes - where archetypes are not arranged as a tree
				 but may appear anywhere. Items are added to the library by the user, not by an automatic
				 scan of a directory tree.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_ADHOC_FILE_SOURCE

inherit
	ARCHETYPE_FILE_LIBRARY_IMP

create
	make

feature {NONE} -- Initialisation

	make (a_group_id: INTEGER)
			-- Create as part of `a_group_id'
		require
			group_id_valid: a_group_id > 0
		do
			group_id := a_group_id
			create archetype_id_index.make (0)
			create errors.make
		ensure
			group_id_set: group_id = a_group_id
		end

feature -- Access

	item (full_path: STRING): ARCH_LIB_ARCHETYPE_ITEM
			-- The archetype at `full_path'.
		require
			has_full_path: has_path (full_path)
		do
			check attached archetype_id_index.item (full_path) as aca then
				Result := aca
			end
		end

feature -- Status Report

	has_path (full_path: STRING): BOOLEAN
			-- Has `full_path' been added to this repository?
		do
			Result := archetype_id_index.has (full_path)
		end

feature -- Modification

	add_item (full_path: STRING)
			-- Add the archetype designated by `full_path' to this repository.
		require
			path_valid: is_valid_path (full_path)
			hasnt_path: not has_path (full_path)
		local
			ara: ARCH_LIB_ARCHETYPE_ITEM
			amp: ARCHETYPE_MINI_PARSER
			aof: APP_OBJECT_FACTORY
		do
			create aof
			create amp
			amp.parse (full_path)
			if amp.passed and then attached amp.last_archetype as arch then
				if arch.archetype_id_is_old_style then
					errors.add_error (ec_parse_archetype_e7, <<full_path>>, "")
				elseif arch.is_specialised and then arch.parent_archetype_id_is_old_style and attached arch.parent_archetype_id as pid then
					errors.add_error (ec_parse_archetype_e11, <<full_path, pid>>, "")
				elseif not has_rm_schema_for_archetype_id (arch.archetype_id) then
					errors.add_error (ec_parse_archetype_e4, <<full_path, arch.archetype_id.as_string>>, "")
				elseif not archetype_id_index.has (arch.archetype_id.as_string) then
					if adl_legacy_flat_filename_pattern_regex.matches (file_system.basename (full_path)) then
						ara := aof.create_arch_lib_archetype_make (extension_replaced (full_path, File_ext_archetype_source), Current, arch)
					else
						ara := aof.create_arch_lib_archetype_make (full_path, Current, arch)
					end
					archetype_id_index.force (ara, full_path)
				else
					errors.add_info (ec_pair_filename_i1, <<full_path>>, "")
				end
			else
				errors.add_error (ec_parse_archetype_e5, <<full_path>>, "")
			end
		ensure
			added_1_or_none: (0 |..| 1).has (archetype_id_index.count - old archetype_id_index.count)
			has_path: archetype_id_index.count > old archetype_id_index.count implies has_path (full_path)
		end

end


