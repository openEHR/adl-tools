indexing
	component:   "openEHR Archetype Project"
	description: "Descriptor of a node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class ARCHETYPE_DIRECTORY_ITEM 

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

feature -- initialisation

	make(a_root_path, a_full_path: STRING; a_group_id: INTEGER) is
			-- make using root-path to archetype file-system tree, full path to directory or archetype file
			-- and group id, to distinguish file-system tree
		require
			Root_path_valid: a_root_path /= Void and then not a_root_path.is_empty
			Full_path_valid: a_full_path /= Void and then not a_full_path.is_empty and then a_full_path.substring_index (a_root_path, 1) = 1
			Group_id_valid: a_group_id > 0
		do
			root_path := a_root_path
			full_path := a_full_path			
			group_id := a_group_id
			make_semantic_paths
		end

feature -- Access

	root_path: STRING
			-- root path of repository containing this item
			
	full_path: STRING
			-- full path to item on file_system

	semantic_path: STRING
			-- relative semantic path of item with respect to root; for folder nodes, 
			-- this will look like the directory path; for archetype nodes, this will be
			-- the concatenation of the directory path and archetype specialisation parent path

	semantic_parent_path: STRING
			-- relative path of parent node (empty if relative_path is already the root)			
			
	group_id: INTEGER
			-- id of group of archetypes found in one directory hierarchy
			
feature {NONE} -- Implementation

	make_semantic_paths is
			-- make semantic_path and semantic_parent_path
		deferred
		end

invariant
	Valid_path: full_path /= Void and then not full_path.is_empty
	
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
