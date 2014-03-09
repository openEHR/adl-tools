note
	component:   "openEHR ADL Tools"
	description: "Descriptor of a file system directory node in a directory of archetypes representing the physical layout of a repository"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_CAT_FILESYS_NODE

inherit
	ARCH_CAT_MODEL_NODE
		redefine
			put_child
		end

create
	make

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

feature -- Access

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := qualified_key
		end

feature -- Modification

	put_child (a_child: like child_with_qualified_key)
		do
			if children = Void then
				create children.make
			end
			children.extend (a_child)
			if attached {ARCH_CAT_FILESYS_NODE} a_child then
				a_child.set_parent (Current)
			end
			reset_subtree_artefact_count
		end

end



