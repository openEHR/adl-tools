indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Directory representation of a file-system archetype repository.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: $"


deferred class ARCHETYPE_INDEXED_REPOSITORY_I

inherit
	ARCHETYPE_REPOSITORY_I

feature {NONE} -- Initialisation

	make (dir_name: STRING; a_group_id: INTEGER)
			-- Create as part of `a_group_id', based on valid directory path.
		require
			dir_name_valid: is_valid_path (dir_name)
			group_id_valid: a_group_id > 0
		do
			group_id := a_group_id
			root_path := dir_name
			clear
		ensure
			root_path_set: root_path = dir_name
			group_id_set: group_id = a_group_id
		end

feature -- Access

	root_path: STRING
			-- Path of file-system repository of archetypes.

feature {ARCH_DIRECTORY} -- Access

	directory: TWO_WAY_TREE [ARCH_REP_ITEM]
			-- Tree-structured directory of folders and archetypes.

feature -- Commands

	clear
			-- Reinitialise `directory' to empty.
		do
			directory := new_folder_node (root_path)
		end

	repopulate
			-- Rebuild `directory' based on existing paths.
		do
			clear
			populate
		end

	populate
			-- Make based on `root_path'.
		do
			build_directory (directory)
		end

feature {NONE} -- Implementation

	build_directory (tree: like directory)
			-- Build a literal representation of the archetype and folder structure
			-- in the repository path, as a tree; each node carries some meta-data.
		require
			tree_attached: tree /= Void
   		deferred
		end

	new_folder_node (path: STRING): like directory
			-- A newly-created folder for `path', ready to be added to `directory'.
		require
			path_valid: path /= Void and then path.substring_index (root_path, 1) = 1
   		do
			create Result.make (create {ARCH_REP_FOLDER}.make (root_path, path, Current))
		ensure
			attached: Result /= Void
			root_path_set: Result.item.root_path = root_path
			full_path_set: Result.item.full_path = path
			repository_set: Result.item.source_repository = Current
		end

invariant
	repository_path_valid: is_valid_path (root_path)
	directory_attached: directory /= Void
	directory_root_path: directory.item.root_path = root_path
	directory_full_path: directory.item.full_path = root_path
	directory_repository: directory.item.source_repository = Current

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
--| The Original Code is adl_node_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
