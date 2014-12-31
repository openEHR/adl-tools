note
	component:   "openEHR ADL Tools"
	description: "[
				 Directory representation of a file-system archetype repository.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_FILE_SOURCE

inherit
	ARCHETYPE_LIBRARY_SOURCE

create
	make, make_adhoc

feature {NONE} -- Initialisation

	make (dir_name: STRING; a_group_id: INTEGER)
			-- The `a_group_id', number is used to distinguish archetype library
			-- archetypes from those found in ad hoc locations
		require
			dir_name_valid: is_valid_directory (dir_name)
			group_id_valid: a_group_id > 0
		do
			group_id := a_group_id
			full_path := dir_name
			create errors.make
		ensure
			root_path_set: full_path = dir_name
			group_id_set: group_id = a_group_id
		end

	make_adhoc (a_group_id: INTEGER)
			-- Create empty, to provide a place to add ad hoc archetypes
		require
			group_id_valid: a_group_id > 0
		do
			group_id := a_group_id
			create full_path.make_empty
			create errors.make
		ensure
			root_path_set: full_path.is_empty
			group_id_set: group_id = a_group_id
		end

feature -- Access

	text: detachable STRING
			-- Contents of the last opened archetype file.

	text_timestamp: INTEGER
			-- Modification time of last opened archetype file as an integer, for comparison purposes.

feature -- Comparison

	is_valid_path (a_file_path: STRING): BOOLEAN
			-- Is `a_file_path' a valid, existing file on this medium?
		do
			Result := file_exists (a_file_path)
		end

	is_valid_directory (a_dir_path: STRING): BOOLEAN
			-- Is `a_dir_path' a valid, existing directory?
		do
			Result := directory_exists (a_dir_path)
		end

	is_valid_directory_part (a_file_path: STRING): BOOLEAN
			-- Is the directory part of `a_file_path', whose last section is a filename, valid on the repository medium?
		do
			if not a_file_path.is_empty and attached file_system.dirname (a_file_path) as dn then
				Result := file_system.directory_exists (dn)
			end
		end

feature -- Commands

	populate
			-- Make based on `root_path'.
		local
			folder_node: ARCH_LIB_FILESYS_ITEM
 		do
			create errors.make
			archetype_id_index.wipe_out
			archetype_ref_index.wipe_out
			create item_tree.make (Archetype_category.twin)

			if is_adhoc then
				create folder_node.make_root
				item_tree.put_child (folder_node)
			else
				folder_stack.wipe_out
				folder_stack.put (item_tree)
				get_archetypes_in_folder (full_path)

				-- go through `item_tree' and remove directory nodes containing no items
				-- TODO
			end
		end

	put_archetype_from_file (a_file_path: STRING)
			-- Add the archetype designated by `a_file_path' to this repository.
		local
			ara: ARCH_LIB_ARCHETYPE
			amp: ARCHETYPE_MINI_PARSER
		do
			last_added_archetype := Void
			create amp
			amp.parse (a_file_path)
			if amp.passed and then attached amp.last_archetype as arch_thumbnail then
				if arch_thumbnail.archetype_id_is_old_style then
					errors.add_error (ec_parse_archetype_e7, <<a_file_path>>, "")
				elseif arch_thumbnail.is_specialised and then arch_thumbnail.parent_archetype_id_is_old_style and attached arch_thumbnail.parent_archetype_id as pid then
					errors.add_error (ec_parse_archetype_e11, <<a_file_path, pid>>, "")
				elseif not has_rm_schema_for_archetype_id (arch_thumbnail.archetype_id) then
					errors.add_error (ec_parse_archetype_e4, <<a_file_path, arch_thumbnail.archetype_id.physical_id>>, "")
				elseif not archetype_id_index.has (arch_thumbnail.archetype_id.physical_id) then
					if adl_legacy_flat_filename_pattern_regex.matches (file_system.basename (a_file_path)) then
						create ara.make (extension_replaced (a_file_path, File_ext_archetype_source), Current, arch_thumbnail)
					else
						create ara.make (a_file_path, Current, arch_thumbnail)
					end
					put_archetype (ara)
					last_added_archetype := ara
				else
					errors.add_info (ec_pair_filename_i1, <<a_file_path>>, "")
				end
			else
				errors.add_error (ec_parse_archetype_e5, <<a_file_path>>, "")
			end
		end

	read_text_from_file (a_file_path: STRING)
			-- Read `text' and `text_timestamp' from the file designated by `a_file_path' on the repository medium.
		do
			file_context.set_target (a_file_path)
			file_context.read_file
			text := file_context.file_content
			text_timestamp := file_context.file_timestamp
		end

	save_text_to_file (a_file_path, a_text: STRING)
			-- Save `a_text' to the file designated by `a_file_path' on the repository medium.
		do
			if file_context.file_writable (a_file_path) then
				file_context.save_file (a_file_path, a_text)
				text_timestamp := file_context.file_timestamp
				errors.add_info (ec_save_as_i1, <<a_file_path>>, "save_text_to_file")
			else
				errors.add_error (ec_save_as_e1, <<a_file_path>>, "save_text_to_file")
			end
		end

feature {NONE} -- Implementation

	get_archetypes_in_folder (a_path: STRING)
			-- Add archetype and folder meta-data nodes to `archetypes' list, and call recursively to folders below
		local
			fn, l_full_path, arch_id: STRING
			a_dir: DIRECTORY
			fs_node_names: ARRAYED_LIST [STRING]
			dir_name_index: SORTED_TWO_WAY_LIST [STRING]
			ara: ARCH_LIB_ARCHETYPE
			amp: ARCHETYPE_MINI_PARSER
			folder_node: ARCH_LIB_FILESYS_ITEM
  		do
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

				create folder_node.make (a_path)
				folder_stack.item.put_child (folder_node)
				folder_stack.put (folder_node)

				-- deal with differential files; can be generated from legacy, or may be the primary artefact
				across fs_node_names as fs_node_names_csr loop
					fn := fs_node_names_csr.item
					if fn.item (1) /= '.' then
						if adl_differential_filename_pattern_regex.matches (fn) then
							l_full_path := file_system.pathname (a_path, fn)
							amp.parse (l_full_path)
							if amp.passed and then attached amp.last_archetype as arch_tn then
								if not has_rm_schema_for_archetype_id (arch_tn.archetype_id) then
									errors.add_error (ec_parse_archetype_e4, <<fn, arch_tn.archetype_id.physical_id>>, "")
								else
									create ara.make (l_full_path, Current, arch_tn)
									archetype_id_index.force (ara, ara.id.physical_id)
									if not ara.is_specialised then
										folder_node.put_child (ara)
									end
								end
							else
								errors.add_error (ec_general, <<amp.error_strings>>, "")
							end
						end
					end
				end

				-- deal with ADL 1.4 archetype files
				across fs_node_names as fs_node_names_csr loop
					fn := fs_node_names_csr.item
					if fn.item (1) /= '.' then
						l_full_path := file_system.pathname (a_path, fn)
						if file_system.directory_exists (l_full_path) then
							dir_name_index.extend (fn)
						elseif adl_legacy_flat_filename_pattern_regex.matches (fn) then
							-- perform a mini-parse of the file, getting the archetype id, the specialisation status and the specialisation parent
							amp.parse (l_full_path)
							if amp.passed and then attached amp.last_archetype as arch_tn then
								arch_id := arch_tn.archetype_id.physical_id
								if arch_tn.archetype_id_is_old_style then
									errors.add_error (ec_parse_archetype_e7, <<fn, arch_id>>, "")
								elseif arch_tn.is_specialised and arch_tn.parent_archetype_id_is_old_style and attached arch_tn.parent_archetype_id as pid then
									errors.add_error (ec_parse_archetype_e11, <<fn, pid>>, "")
								elseif not has_rm_schema_for_archetype_id (arch_tn.archetype_id) then
									errors.add_error (ec_parse_archetype_e4, <<fn, arch_id>>, "")
								elseif not archetype_id_index.has (arch_id) then
									create ara.make (extension_replaced (l_full_path, File_ext_archetype_source), Current, arch_tn)
									archetype_id_index.force (ara, arch_id)
									if not ara.is_specialised then
										folder_node.put_child (ara)
									end
								else
									check attached archetype_id_index.item (arch_id) as att_aca then
										ara := att_aca
									end
									ara.file_mgr.add_legacy_archetype (l_full_path)
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

				folder_stack.remove
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

	folder_stack: ARRAYED_STACK [ARCH_LIB_ITEM]
		attribute
			create Result.make (0)
		end

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result
		end

	adl_legacy_flat_filename_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adl".
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (".*\" + File_ext_archetype_adl14 + "$")
		end

	adl_differential_filename_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adls".
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (".*\" + File_ext_archetype_source + "$")
		end

invariant
	library_path_valid: is_valid_directory (full_path)

end


