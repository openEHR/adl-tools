note
	component:   "openEHR ADL Tools"
	description: "Representation of an archetype repository on some medium such as a file system."
	keywords:    "archetype, ADL, file system, library"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class
	ARCHETYPE_LIBRARY_SOURCE

inherit
	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all
		end

	TABLE_ITERABLE [ARCH_LIB_ARCHETYPE, STRING]
		undefine
			default_create
		end

feature -- Access

	full_path: STRING
			-- Path of this library of archetypes.

	text: detachable STRING
			-- Contents of the last opened archetype file.
		deferred
		end

	text_timestamp: INTEGER
			-- Modification time of last opened file as an integer, for comparison purposes.
		deferred
		end

	errors: ERROR_ACCUMULATOR

feature {ARCHETYPE_LIBRARY} -- Access

	item_tree: ARCH_LIB_ARTEFACT_TYPE_ITEM
			-- Tree representing the filesystem structure of the library
		attribute
			create Result.make (Archetype_category.twin)
		end

	archetype_count: INTEGER
			-- Count of all archetype descriptors in directory.
		do
			Result := archetype_id_index.count
		end

	template_count: INTEGER
			-- count of artefacts designated as templates or template_components
		do
			across archetype_id_index as arch_csr loop
				if attached {ARCH_LIB_TEMPLATE} arch_csr.item then
					Result := Result + 1
				end
			end
		end

	archetype_with_id (an_id: STRING): ARCH_LIB_ARCHETYPE
			-- get the archetype with physical id `an_id'
		require
			has_archetype_with_id (an_id)
		do
			check attached archetype_id_index.item (an_id) as aca then
				Result := aca
			end
		end

	last_added_archetype: detachable ARCH_LIB_ARCHETYPE
			-- archetype added by last call to `put_archetype_from_file'

feature -- Validation

	is_valid_path (a_path: STRING): BOOLEAN
			-- Is `a_path' a valid, existing file on this medium?
		deferred
		end

	is_valid_directory (a_path: STRING): BOOLEAN
			-- Is `a_path' a valid, existing directory?
		deferred
		end

feature -- Status Report

	is_adhoc: BOOLEAN
		do
			Result := full_path.is_empty
		end

	has_path (a_path: STRING): BOOLEAN
			-- Has `a_path' been added to this repository?
		do
			Result := attached filesys_node_for_path (a_path)
		end

	is_valid_directory_part (path: STRING): BOOLEAN
			-- Is the directory part of `path' valid on the repository medium?
		deferred
		end

	has_archetype_with_id (an_archetype_id: STRING): BOOLEAN
			-- True if `an_archetype_id' exists in index
		do
			Result := archetype_id_index.has (an_archetype_id)
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [ARCH_LIB_ARCHETYPE, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := archetype_id_index.new_cursor
		end

feature -- Commands

	populate
			-- Make based on `root_path'.
		deferred
		end

	put_archetype (auth_ala: ARCH_LIB_AUTHORED_ARCHETYPE)
			-- put archetype into `archetype_id_index' and the file-system tree
		local
			dir_node: ARCH_LIB_FILESYS_ITEM
		do
			archetype_id_index.force (auth_ala, auth_ala.id.physical_id)

			-- add to file system tree
			if not auth_ala.is_specialised then
				dir_node := create_filesys_node_for_path (auth_ala.file_mgr.source_file_path)
				if not dir_node.has_child (auth_ala) then
					dir_node.put_child (auth_ala)
				end
			end
		end

	remove_archetype (an_archetype_id: ARCHETYPE_HRID)
			-- remove archetype from `archetype_id_index' and from the file-system tree
		require
			has_archetype_with_id (an_archetype_id.physical_id)
		do
			if attached {ARCH_LIB_AUTHORED_ARCHETYPE} archetype_id_index.item (an_archetype_id.physical_id) as auth_ala then
				archetype_id_index.remove (an_archetype_id.physical_id)

				if not auth_ala.is_specialised then
					-- find the archetype in the file system tree
					if attached filesys_node_for_path (auth_ala.file_mgr.source_file_path) as att_node and then att_node.has_child (auth_ala) then
						att_node.remove_child (auth_ala)
					end
				end
			end
		end

	put_archetype_from_file (a_full_path: STRING)
			-- Add the archetype designated by `full_path' to this repository.
		require
			path_valid: is_valid_path (a_full_path)
			hasnt_path: not has_path (a_full_path)
		deferred
		ensure
			added_1_or_none: (0 |..| 1).has (archetype_id_index.count - old archetype_id_index.count)
			has_path: archetype_id_index.count > old archetype_id_index.count implies has_path (a_full_path)
		end

	read_text_from_file (a_full_path: STRING)
			-- Read `text' and `text_timestamp' from the file designated by `a_full_path' on the repository medium.
		require
			path_valid: is_valid_directory_part (a_full_path)
		deferred
		ensure
			text_attached: attached text
		end

	save_text_to_file (a_full_path, a_text: STRING)
			-- Save `a_text' to the file designated by `a_full_path' on the repository medium.
		require
			path_valid: is_valid_directory_part (a_full_path)
			text_valid: not a_text.is_empty
		deferred
		end

feature {NONE} -- Implementation

	archetype_id_index: HASH_TABLE [ARCH_LIB_AUTHORED_ARCHETYPE, STRING]
			-- list of all archetypes found in this directory tree, keyed by MIXED-CASE physical id
		attribute
			create Result.make (0)
		end

	filesys_node_for_path (a_file_path: STRING): detachable ARCH_LIB_FILESYS_ITEM
			-- find a terminal file system node that corresponds to the path `a_file_path'
		require
			real_file_path: is_valid_path (a_file_path)
		local
			dir_node: ARCH_LIB_FILESYS_ITEM
			ala_path_key: STRING
			pnames: LIST [STRING]
			path_dir_names: ARRAYED_LIST [STRING]
		do
			check attached {ARCH_LIB_FILESYS_ITEM} item_tree.first_child as fs_node then
				dir_node := fs_node
			end
			ala_path_key := file_system.dirname (a_file_path)
			if ala_path_key.starts_with (dir_node.qualified_name) then
				ala_path_key.to_lower
				ala_path_key.remove_head (dir_node.qualified_name.count)
				pnames := ala_path_key.split (os_directory_separator)

				-- there can be empty strings due to leading and trailing '/' so we get rid of them
				create path_dir_names.make (pnames.count)
				across pnames as pname_csr loop
					if not pname_csr.item.is_empty then
						path_dir_names.extend (pname_csr.item)
					end
				end

				-- now step down through the file system tree structure
				from path_dir_names.start until path_dir_names.off or not dir_node.has_child_with_name (path_dir_names.item) loop
					if attached {ARCH_LIB_FILESYS_ITEM} dir_node.child_with_name (path_dir_names.item) as att_dir_node then
						dir_node := att_dir_node
					end
					path_dir_names.forth
				end

				if path_dir_names.off then
					Result := dir_node
				end
			end
		end

	create_filesys_node_for_path (a_file_path: STRING): ARCH_LIB_FILESYS_ITEM
			-- recursively create nodes in local file system tree that corresponds to the path `a_file_path'
			-- if the path exists, no node creation will occur, and the existing matching node will be returned
		require
			real_file_path: is_valid_path (a_file_path) and then a_file_path.starts_with (full_path)
		local
			dir_node, new_dir_node: ARCH_LIB_FILESYS_ITEM
			ala_path_key, path, node_full_path: STRING
			pnames: LIST [STRING]
			path_dir_names: ARRAYED_LIST [STRING]
		do
			check attached {ARCH_LIB_FILESYS_ITEM} item_tree.first_child as fs_node then
				dir_node := fs_node
			end
			ala_path_key := file_system.dirname (a_file_path)
			check ala_path_key.starts_with (dir_node.qualified_name) end
			ala_path_key.to_lower

			create path.make_from_string (ala_path_key)
			node_full_path := dir_node.qualified_name
			path.remove_head (node_full_path.count)
			pnames := path.split (os_directory_separator)

			-- there can be empty strings due to leading and trailing '/' so we get rid of them
			create path_dir_names.make (pnames.count)
			across pnames as pname_csr loop
				if not pname_csr.item.is_empty then
					path_dir_names.extend (pname_csr.item)
				end
			end

			-- now step down through the file system tree structure
			across path_dir_names as dir_name_csr loop
				if dir_node.has_child_with_name (dir_name_csr.item) and then attached {ARCH_LIB_FILESYS_ITEM} dir_node.child_with_name (dir_name_csr.item) as att_dir_node then
					dir_node := att_dir_node
				else
					node_full_path := file_system.pathname (node_full_path, dir_name_csr.item)
					create new_dir_node.make (node_full_path)
					dir_node.put_child (new_dir_node)
					dir_node := new_dir_node
				end
			end

			Result := dir_node
		end

invariant
	timestamp_natural: text_timestamp >= 0

end


