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

deferred class ARCHETYPE_INDEXED_LIBRARY_I

inherit
	ARCHETYPE_LIBRARY_I

feature {NONE} -- Initialisation

	make (dir_name: attached STRING; a_group_id: INTEGER)
			-- Create as part of `a_group_id', based on valid directory path.
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

feature -- Access

	full_path: STRING
			-- Path of file-system repository of archetypes.

feature {ARCHETYPE_LIBRARY} -- Access

	fast_archetype_list: ARRAYED_LIST [ARCH_LIB_ARCHETYPE]
			-- linear index list for efficient processing
		attribute
			create Result.make (0)
		end

feature -- Commands

	populate
			-- Make based on `root_path'.
		do
			archetype_id_index.wipe_out
			fast_archetype_list.wipe_out
			get_archetypes_in_folder (full_path)
			across archetype_id_index as arch_ids_csr loop
				fast_archetype_list.extend (arch_ids_csr.item)
			end
		end

feature {NONE} -- Implementation

	get_archetypes_in_folder (a_path: STRING)
			-- Build a literal representation of the archetype and folder structure
			-- in the repository path, as a tree; each node carries some meta-data.
		require
			Path_valid: not a_path.is_empty
   		deferred
		end

invariant
	repository_path_valid: is_valid_directory (full_path)

end


