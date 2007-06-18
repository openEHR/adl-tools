indexing
	component:   "openEHR Archetype Project"
	description: "[
				 File-system ad hoc repository of archetypes - where archetypes are not arranged as a tree
				 but may appear anywhere. Items are added to the repository by the user, not by an automatic
				 scan of a directory tree.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: $"


class ARCHETYPE_ADHOC_FILE_REPOSITORY

inherit
	ARCHETYPE_FILE_REPOSITORY_IMP

create
	make

feature {NONE} -- Initialisation

	make
			-- Create with a sensible default `work_path'.
		do
			work_path := system_temp_file_directory.twin
			create directory.make (0)
		end

feature -- Access

	work_path: STRING assign set_work_path
			-- The current work path on the file system, normally used to tell GUI or other
			-- file searching method where to start looking.

	directory: DS_HASH_TABLE [ARCHETYPE_REPOSITORY_ARCHETYPE, STRING]
			-- The directory of archetypes added to this ad hoc repository
			-- as a list of descriptors keyed by full path.

	group_id: INTEGER = 1
			-- TODO: Figure out how to implement this properly!

feature -- Status Report

	is_valid_work_path (path: STRING): BOOLEAN
			-- Is `path' a valid value for `work_path'?
		do
			if path /= Void and then not path.is_empty then
				Result := (create {DIRECTORY}.make (path)).exists and path @ path.count = os_directory_separator
			end
		end

feature -- Modification

	set_work_path (path: STRING)
			-- Set `work_path'.
		require
			path_attached: path /= Void
			path_not_empty: is_valid_work_path (path)
		do
			work_path := path.twin
		ensure
			work_path_set: work_path.is_equal (path)
			work_path_not_same: work_path /= path
		end

	add_item (full_path: STRING)
			-- Add the archetype designated by `full_path' to this repository.
		require
			path_valid: is_valid_path (full_path)
			path_under_work_path: full_path.substring_index (work_path, 1) = 1
		local
			ara: ARCHETYPE_REPOSITORY_ARCHETYPE
		do
			create ara.make (work_path, full_path, group_id, Void, False, Current)
			-- TODO: implement this routine :-
			-- Create the above ARCHETYPE_REPOSITORY_ARCHETYPE with a proper ARCHETYPE_ID.
			-- Include empty ontological paths, since the latter are unknown
			-- for archetypes found in ad hoc places like c:\temp, /tmp etc
		end

invariant
	work_path_valid: is_valid_work_path (work_path)
	directory_attached: directory /= Void

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
