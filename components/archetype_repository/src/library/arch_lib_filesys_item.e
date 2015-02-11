note
	component:   "openEHR ADL Tools"
	description: "Descriptor of a file system directory node in a directory of archetypes representing the physical layout of a repository"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_FILESYS_ITEM

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		undefine
			is_equal
		end

	ARCH_LIB_MODEL_ITEM
		redefine
			put_child
		end

create
	make, make_root

feature -- Initialisation

	make (a_dir_path: STRING)
			-- create with directory pathname
		require
			a_dir_path: not a_dir_path.is_empty
		do
			qualified_name := a_dir_path
			check attached file_system.basename (a_dir_path) as pn then
				name := pn
			end
			group_name := "file_folder"
		ensure
			qualified_name_set: qualified_name.is_equal (a_dir_path)
		end

	make_root
			-- create as top-level directory at root of file system
		do
			create qualified_name.make_empty
			create name.make_empty
			group_name := "file_folder"
		ensure
			qualified_name_set: qualified_name.is_empty
		end

feature -- Access

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := qualified_key
		end

feature -- Modification

	put_child (a_child: like child_with_qualified_key)
		local
			ala_list: attached like children
		do
			if attached children as att_children then
				ala_list := att_children
			else
				create ala_list.make
				children := ala_list
			end
			ala_list.extend (a_child)
			if attached {ARCH_LIB_FILESYS_ITEM} a_child then
				a_child.set_parent (Current)
			end
			reset_subtree_artefact_count
		end

end



