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

	make (a_group_id: INTEGER)
			-- Create as part of `a_group_id', with a sensible default `work_path'.
		require
			group_id_valid: a_group_id > 0
		do
			group_id := a_group_id
			work_path := system_temp_file_directory.twin
			create directory.make (0)
		ensure
			group_id_set: group_id = a_group_id
		end

feature -- Access

	work_path: STRING assign set_work_path
			-- The current work path on the file system, normally used to tell GUI or other
			-- file searching method where to start looking.

	item alias "[]" (full_path: STRING): ARCH_REP_ARCHETYPE
			-- The archetype at `full_path'.
		require
			has_full_path: has (full_path)
		do
			Result := directory [full_path]
		ensure
			attached: Result /= Void
		end

feature -- Status Report

	has (full_path: STRING): BOOLEAN
			-- Has `full_path' been added to this repository?
		do
			Result := directory [full_path] /= Void
		end

feature -- Modification

	set_work_path (path: STRING)
			-- Set `work_path'.
		require
			path_attached: path /= Void
			path_not_empty: is_valid_directory (path)
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
			hasnt_path: not has (full_path)
		local
			ara: ARCH_REP_ARCHETYPE
			arch_id_str: STRING
		do
			arch_id_str := archteype_id_from_path(full_path)
			if arch_id_str /= Void then
				if not archetype_directory.archetype_id_index.has (arch_id_str) then
					create ara.make (file_system.dirname (full_path), full_path, create {!ARCHETYPE_ID}.make_from_string(arch_id_str), Current)
					directory [full_path] := ara
				else
					post_info (Current, "build_directory", "pair_filename_i1", <<full_path>>)
				end
			else
	-- FIXME: to support old-style archetype ids with 'draft' in the name; remove when appropriate
	arch_id_str := old_archteype_id_from_path(full_path)
	if arch_id_str /= Void then
		if not archetype_directory.archetype_id_index.has (arch_id_str) then
			create ara.make (file_system.dirname (full_path), full_path, create {!ARCHETYPE_ID}.old_make_from_string(arch_id_str), Current)
			directory [full_path] := ara
			post_warning (Current, "build_directory", "invalid_filename_e1", <<full_path>>)
		else
			post_warning (Current, "build_directory", "pair_filename_i1", <<full_path>>)
		end
	else
				post_error (Current, "build_directory", "invalid_filename_e1", <<full_path>>)
	end
			end
		ensure
			added_1_or_none: (0 |..| 1).has (directory.count - old directory.count)
			has_path: directory.count > old directory.count implies has (full_path)
		end

feature {NONE} -- Implementation

	directory: HASH_TABLE [ARCH_REP_ARCHETYPE, STRING]
			-- The directory of archetypes added to this ad hoc repository
			-- as a list of descriptors keyed by full path.

invariant
	work_path_valid: is_valid_directory (work_path)
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
