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


deferred class ARCHETYPE_REPOSITORY_ITEM

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

feature -- initialisation

	make(a_root_path, a_full_path: STRING; a_group_id: INTEGER; a_repository: ARCHETYPE_REPOSITORY_I) is
			-- make using root-path to archetype repository tree, full path to directory or archetype file
			-- and group id, to distinguish repository with respect to others in ARCHETYPE_DIRECTORY
		require
			Repository_exists: a_repository /= Void
			Root_path_valid: a_repository.is_valid_path (a_root_path)
			Full_path_valid: a_full_path /= Void and then a_full_path.substring_index (a_root_path, 1) = 1
			Group_id_valid: a_group_id > 0
		do
			root_path := a_root_path
			full_path := a_full_path
			group_id := a_group_id
			repository := a_repository
			make_ontological_paths
		end

feature -- Access

	root_path: STRING
			-- root path of repository on storage medium containing this item

	full_path: STRING
			-- full path to item on storage medium

	ontological_path: STRING
			-- logical ontological path of item with respect to root; for folder nodes,
			-- this will look like the directory path; for archetype nodes, this will be
			-- the concatenation of the directory path and a path pseudo-path constructed
			-- by replacing the '-'s in an archetype concept with '/', enabling specialised
			-- archetypes to be treated as subnodes of their parent

	ontological_parent_path: STRING
			-- logical path of parent node (empty if relative_path is already the root)			

	group_id: INTEGER
			-- id of repository containing this item (e.g. it might be in the reference tree
			-- or in another repository designed to be overlaid on the reference)

	repository: ARCHETYPE_REPOSITORY_I
			-- the repository on which this item is found

feature -- Status Report

	is_valid_path (path: STRING): BOOLEAN is
			-- Is `path' a valid, existing directory or file on `repository'?
		do
			Result := repository.is_valid_path (path)
		end

	is_valid_directory_part (path: STRING): BOOLEAN is
			-- Is the directory part of `path', whose last section is a filename, valid on `repository'?
		do
			Result := repository.is_valid_directory_part (path)
		end

feature {NONE} -- Implementation

	make_ontological_paths is
			-- make ontological_path and ontological_parent_path
		deferred
		end

invariant
	repository_attached: repository /= Void
	root_path_valid: is_valid_path (root_path)
	full_path_valid: full_path /= Void and then not full_path.is_empty
	group_id_valid: group_id > 0

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
