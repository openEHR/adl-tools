note
	component:   "openEHR ADL Tools"
	description: "[
				 Directory representation of a file-system archetype repository.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_FILE_SOURCE

inherit
	ARCHETYPE_LIBRARY_SOURCE

create
	make, make_adhoc

feature {NONE} -- Initialisation

	make (dir_name: STRING)
		require
			dir_name_valid: is_valid_directory (dir_name)
		do
			full_path := dir_name
			create errors.make
		ensure
			root_path_set: full_path = dir_name
		end

	make_adhoc
			-- Create empty, to provide a place to add ad hoc archetypes
		do
			create full_path.make_empty
			create errors.make
		ensure
			root_path_set: full_path.is_empty
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
			arch_phys_id_index.wipe_out
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
			ara: ARCH_LIB_AUTHORED_ARCHETYPE
			amp: ARCHETYPE_MINI_PARSER
		do
			last_added_archetype := Void
			create amp
			amp.parse (a_file_path)
			if amp.passed and then attached amp.last_archetype as arch_thumbnail then
				if not has_model_for_archetype_id (arch_thumbnail.archetype_id) then
					errors.add_error ({ADL_MESSAGES_IDS}.ec_parse_archetype_e4, <<a_file_path, arch_thumbnail.archetype_id.physical_id>>, "")
				elseif not arch_phys_id_index.has (arch_thumbnail.archetype_id.physical_id) then
					if adl_legacy_flat_filename_pattern_regex.matches (file_system.basename (a_file_path)) then
						create ara.make_legacy (a_file_path, Current, arch_thumbnail)

						-- we need to fake the file path to look as if it is the .adls file path
						ara.set_id (arch_thumbnail.archetype_id)
					else
						create ara.make (a_file_path, Current, arch_thumbnail)
					end
					put_archetype (ara)
					last_added_archetype := ara
				else
					errors.add_info ({ADL_MESSAGES_IDS}.ec_pair_filename_i1, <<a_file_path>>, "")
				end
			else
				errors.add_error ({ADL_MESSAGES_IDS}.ec_parse_archetype_e5, <<a_file_path>>, "")
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
				errors.add_info ({ADL_MESSAGES_IDS}.ec_save_as_i1, <<a_file_path>>, "save_text_to_file")
			else
				errors.add_error ({ADL_MESSAGES_IDS}.ec_save_as_e1, <<a_file_path>>, "save_text_to_file")
			end
		end

feature {NONE} -- Implementation

	get_archetypes_in_folder (a_path: STRING)
			-- Add archetype and folder meta-data nodes to `archetypes' list, and call recursively to folders below
		local
			fn, new_arch_fn, arch_full_path, new_full_path, arch_id: STRING
			a_dir: DIRECTORY
			fs_node_names: ARRAYED_LIST [STRING]
			arch_semantic_ids: HASH_TABLE [ARCH_LIB_AUTHORED_ARCHETYPE, STRING]
			dir_name_index: SORTED_TWO_WAY_LIST [STRING]
			ara: ARCH_LIB_AUTHORED_ARCHETYPE
			amp: ARCHETYPE_MINI_PARSER
			folder_node: ARCH_LIB_FILESYS_ITEM
			keep: BOOLEAN
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

				-- keep track of archetype interface ids for ADL2 archetypes, so that we can compare ADL 1.4
				-- archetypes to them to know if we are doubling up or not.
				create arch_semantic_ids.make (0)

				-- deal with differential files; can be generated from legacy, or may be the primary artefact
				across fs_node_names as fs_node_names_csr loop
					fn := fs_node_names_csr.item
					if fn.item (1) /= '.' then

						-- FIXME: legacy ADL 1.4 & LEGACY ADL 1.5 files
						-- if we match old-style generated .adls file with just .vN rather than .vN.M.P
						-- and there is a .adl file of the same name in the same directory, delete
						-- the .adls file.
						if adl_old_differential_filename_pattern_regex.matches (fn) then
							keep := False
							arch_full_path := file_system.pathname (a_path, fn)
							amp.parse (arch_full_path)

							-- .adls file generated from a .adl (1.4) file
							if amp.is_generated then
								-- if a .ald file of this name exists, delete the generated .adls file (it will be regenerated) - IGNORE
								if file_system.file_exists (extension_replaced (arch_full_path, File_ext_archetype_adl14)) then
									file_system.delete_file (arch_full_path)
								end
							-- not generated; has thumbnail
							elseif attached amp.last_archetype as arch_tn then
								new_arch_fn := arch_tn.archetype_id.as_filename + File_ext_archetype_source
								new_full_path := file_system.pathname (a_path, new_arch_fn)
								-- perform a rename - KEEP
								if not file_system.file_exists (new_full_path) then
									file_system.rename_file (arch_full_path, new_full_path)
									errors.add_warning ({ADL_MESSAGES_IDS}.ec_renamed_old_adls_filename, <<arch_full_path, new_full_path>>, "")
									fn := new_arch_fn
									keep := True
								else
									-- both a new and an old version exist; needs manual intervention - IGNORE
									errors.add_warning ({ADL_MESSAGES_IDS}.ec_old_and_new_adls_filename, <<arch_full_path, new_full_path>>, "")
								end
							-- something wrong with the file - no thumbnail - IGNORE
							else
								errors.add_warning ({ADL_MESSAGES_IDS}.ec_faulty_old_adls_filename, <<arch_full_path>>, "")
							end
						else
							keep := True
						end

						-- normal .adls file
						if keep and adl_differential_filename_pattern_regex.matches (fn) then
							arch_full_path := file_system.pathname (a_path, fn)
							amp.parse (arch_full_path)
							if amp.passed and then attached amp.last_archetype as arch_tn then
								arch_id := arch_tn.archetype_id.physical_id
								if not has_model_for_archetype_id (arch_tn.archetype_id) then
									errors.add_error ({ADL_MESSAGES_IDS}.ec_parse_archetype_e4, <<fn, arch_id>>, "")
								elseif not arch_phys_id_index.has (arch_id) then
									if arch_tn.is_template then
										create {ARCH_LIB_TEMPLATE} ara.make (arch_full_path, Current, arch_tn)
									else
										create ara.make (arch_full_path, Current, arch_tn)
									end
									arch_phys_id_index.force (ara, arch_id)
									arch_semantic_ids.put (ara, arch_tn.archetype_id.semantic_id)
									if not ara.is_specialised then
										folder_node.put_child (ara)
									end
								else
									errors.add_error ({ADL_MESSAGES_IDS}.ec_arch_cat_dup_archetype, <<arch_full_path>>, "")
								end
							else
								errors.add_error ({GENERAL_MESSAGES_IDS}.ec_general, <<amp.error_strings>>, "")
							end
						end
					end
				end

				-- deal with ADL 1.4 archetype files
				across fs_node_names as fs_node_names_csr loop
					fn := fs_node_names_csr.item
					if fn.item (1) /= '.' then
						arch_full_path := file_system.pathname (a_path, fn)
						if file_system.directory_exists (arch_full_path) then
							dir_name_index.extend (fn)
						elseif adl_legacy_flat_filename_pattern_regex.matches (fn) then
							-- perform a mini-parse of the file, getting the archetype id, the specialisation status and the specialisation parent
							amp.parse (arch_full_path)
							if amp.passed and then attached amp.last_archetype as arch_tn then
								arch_id := arch_tn.archetype_id.physical_id
								if not has_model_for_archetype_id (arch_tn.archetype_id) then
									errors.add_error ({ADL_MESSAGES_IDS}.ec_parse_archetype_e4, <<fn, arch_id>>, "")

								-- here we check for an exact match first (physical_id) and then a match on semantic_id (down to major ver).
								-- The reason for this is that in a previous compilation, an ADL 1.4 archetype that contains revision meta-data
								-- in its 'other_details' section will ahve been saved as some other version, and the physical id won't match
								-- the default parsed id of the original ADL 1.4 file.
								elseif not arch_semantic_ids.has (arch_tn.archetype_id.semantic_id) then
									create ara.make_legacy (arch_full_path, Current, arch_tn)
									arch_phys_id_index.force (ara, arch_id)
									if not ara.is_specialised then
										folder_node.put_child (ara)
									end
								else
									check attached arch_semantic_ids.item (arch_tn.archetype_id.semantic_id) as att_aca then
										ara := att_aca
									end
									ara.file_mgr.add_legacy_archetype (arch_full_path)
								end
							else
								errors.add_error ({GENERAL_MESSAGES_IDS}.ec_general, <<amp.error_strings>>, "")
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

	adl_old_differential_filename_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".vN.adls", which are
			-- now replaced with ".vN.M.P.adls"
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (".*\.v[0-9]+\" + File_ext_archetype_source + "$")
		end

invariant
	library_path_valid: is_valid_directory (full_path)

end


