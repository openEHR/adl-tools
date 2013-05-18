note
	component:   "openEHR Archetype Project"
	description: "Descriptor of a file system directory node in a directory of archetypes representing the physical layout of a repository"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"



class ARCH_CAT_FILESYS_NODE

inherit
	ARCH_CAT_MODEL_NODE
		redefine
			put_child
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		undefine
			is_equal
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



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
