note
	component:   "openEHR ADL Tools"
	description: "File-system repository of archetypes - implementation of ARCHETYPE_INDEXED_REPOSITORY_I."
	keywords:    "ADL, archetype, file access"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP

inherit
	ARCHETYPE_INDEXED_REPOSITORY_I

	ARCHETYPE_FILE_REPOSITORY_IMP

create
	make

feature {NONE} -- Implementation

	get_archetypes_in_folder (a_path: STRING)
			-- Add archetype and folder meta-data nodes to `archetypes' list, and call recursively to folders below
		local
			fn, l_full_path: STRING
			a_dir: DIRECTORY
			fs_node_names: ARRAYED_LIST [STRING]
			dir_name_index: SORTED_TWO_WAY_LIST [STRING]
			ara: ARCH_CAT_ARCHETYPE
			amp: ARCHETYPE_MINI_PARSER
			aof: APP_OBJECT_FACTORY
   		do
   			create aof

   			-- generate lists of immediate child directory and archetype file names
   			-- in the current directory 'a_parent_node.item.full_path'
   			debug("arch_dir")
   				io.put_string(shifter + "---> " + a_path + "%N")
   				shifter.extend ('%T')
   			end

			create amp
			create a_dir.make (a_path)

			if a_dir.exists then
				a_dir.open_read
				fs_node_names := a_dir.linear_representation
				create dir_name_index.make

				-- deal with legacy archetype files and directories first
				across fs_node_names as fs_node_names_csr loop
					fn := fs_node_names_csr.item
					if fn.item (1) /= '.' then
						l_full_path := file_system.pathname (a_path, fn)
						if file_system.directory_exists (l_full_path) then
							dir_name_index.extend (fn)
						elseif adl_legacy_flat_filename_pattern_regex.matches (fn) then
							-- perform a mini-parse of the file, getting the archetype id, the specialisation status and the specialisation parent
							amp.parse (l_full_path)
							if amp.passed and then attached amp.last_archetype as arch then
								if arch.archetype_id_is_old_style then
									errors.add_error (ec_parse_archetype_e7, <<fn, arch.archetype_id.as_string>>, "")
								elseif arch.is_specialised and arch.parent_archetype_id_is_old_style then
									errors.add_error (ec_parse_archetype_e11, <<fn, arch.parent_archetype_id.as_string>>, "")
								elseif not has_rm_schema_for_archetype_id (arch.archetype_id) then
									errors.add_error (ec_parse_archetype_e4, <<fn, arch.archetype_id.as_string>>, "")
								else -- create the descriptor and put it into a local Hash for this node
									ara := aof.create_arch_cat_archetype_make_legacy (l_full_path, Current, arch)
									archetype_id_index.force (ara, ara.id.as_string)
								end
							else
								errors.add_error (ec_general, <<amp.error_strings>>, "")
							end
						end
					end
				end

				-- deal with differential files; can be generated from legacy, or may be the primary artefact
				across fs_node_names as fs_node_names_csr loop
					fn := fs_node_names_csr.item
					if fn.item (1) /= '.' then
						if adl_differential_filename_pattern_regex.matches (fn) then
							l_full_path := file_system.pathname (a_path, fn)
							amp.parse (l_full_path)
							if amp.passed and then attached amp.last_archetype as arch then
								if not has_rm_schema_for_archetype_id (arch.archetype_id) then
									errors.add_error (ec_parse_archetype_e4, <<fn, arch.archetype_id.as_string>>, "")
								elseif not archetype_id_index.has (arch.archetype_id.as_string) then
									ara := aof.create_arch_cat_archetype_make (l_full_path, Current, arch)
									archetype_id_index.force (ara, ara.id.as_string)
								else
									-- ignore, because there is already a legacy archetype for this id
								end
							else
								errors.add_error (ec_general, <<amp.error_strings>>, "")
							end
						end
					end
				end
				-- for all directories below this one, call this routine recursively
				across dir_name_index as dir_names_csr loop
					get_archetypes_in_folder (file_system.pathname (a_path, dir_names_csr.item))
				end
			end

   			debug("arch_dir")
   				shifter.remove_tail (1)
   				io.put_string(shifter + "<---%N")
   			end
		end

	shifter: STRING
			-- Debug indenter.
		once
			create Result.make_empty
		end

end


