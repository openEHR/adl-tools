indexing
	component:   "openEHR Archetype Project"
	description: "Descriptor of a node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: $"


deferred class ARCH_REP_ITEM

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

feature {NONE} -- initialisation

	make (a_root_path, a_full_path: STRING; a_source_repository: ARCHETYPE_REPOSITORY_I)
			-- Make to represent the directory or archetype file at `full_path',
			-- belonging to `a_repository' at `a_root_path'.
		require
			repository_attached: a_source_repository /= Void
			root_path_valid: a_source_repository.is_valid_directory (a_root_path)
			full_path_valid: a_full_path /= Void and then a_full_path.substring_index (a_root_path, 1) = 1
		do
			root_path := a_root_path
			full_path := a_full_path
			file_repository := a_source_repository
			make_ontological_paths
		ensure
			root_path_set: root_path = a_root_path
			full_path_set: full_path = a_full_path
			source_repository_set: file_repository = a_source_repository
		end

feature -- Access

	root_path: STRING
			-- Root path of repository on storage medium containing this item.

	full_path: STRING
			-- Full path to the item on the storage medium.

	base_name: STRING
			-- Name of last segment of `ontological_path'.

	ontological_path: STRING
			-- Logical ontological path of item with respect to `root_path'; for folder nodes,
			-- this will look like the directory path; for archetype nodes, this will be
			-- the concatenation of the directory path and a path pseudo-path constructed
			-- by replacing the '-'s in an archetype concept with '/', enabling specialised
			-- archetypes to be treated as subnodes of their parent.

	ontological_parent_path: STRING
			-- Logical path of parent node (empty if `ontological_path' is already the root).

	file_repository: ARCHETYPE_REPOSITORY_I
			-- The source repository on which this item is found.

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		deferred
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

feature -- Status Report

	is_valid_path (path: STRING): BOOLEAN
			-- Is `path' a valid, existing directory or file on `repository'?
		do
			Result := file_repository.is_valid_path (path)
		ensure
			false_if_void: Result implies path /= Void
		end

	is_valid_directory (path: STRING): BOOLEAN
			-- Is `path' a valid, existing directory or file on `repository'?
		do
			Result := file_repository.is_valid_directory (path)
		ensure
			false_if_void: Result implies path /= Void
		end

	is_valid_directory_part (path: STRING): BOOLEAN
			-- Is the directory part of `path', whose last section is a filename, valid on `repository'?
		do
			Result := file_repository.is_valid_directory_part (path)
		ensure
			false_if_void: Result implies path /= Void
		end

feature {NONE} -- Implementation

	make_ontological_paths
			-- Make `base_name', `ontological_path' and `ontological_parent_path'.
		deferred
		end

invariant
	repository_attached: file_repository /= Void
	root_path_valid: is_valid_directory (root_path)
	full_path_attached: full_path /= Void
	full_path_not_empty: not full_path.is_empty
	ontological_path_attached: ontological_path /= Void
	ontological_parent_path_attached: ontological_parent_path /= Void
	ontological_path_absolute: ontological_path.substring_index (ontological_path_separator, 1) = 1
	ontological_parent_path_valid: ontological_path.substring_index (ontological_parent_path, 1) = 1
	base_name_attached: base_name /= Void

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
