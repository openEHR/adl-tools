indexing
	component:   "openEHR Archetype Project"
	description: "File-system repository of archetypes - implementation of ARCHETYPE_REPOSITORY_I."
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class
	ARCHETYPE_FILE_REPOSITORY_IMP

inherit
	ARCHETYPE_REPOSITORY_I

	SHARED_RESOURCES
		export
			{NONE} all
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

feature -- Access

	source (full_path: STRING): STRING
			-- Source of archetype designated by `full_path' from the repository medium.
		do
			file_context.set_target (full_path)
			file_context.read_file
			Result := file_context.file_content
			source_timestamp := file_context.file_timestamp
		end

	source_timestamp: INTEGER
			-- Modification time of last opened file as an integer, for comparison purposes.

	group_id: INTEGER
			-- Id of the group to which this repository belongs.

feature -- Status Report

	is_valid_path (path: STRING): BOOLEAN
			-- Is `path' a valid, existing file on the repository medium?
		local
			s: STRING
		do
			if path /= Void and then not path.is_empty then
				s := path.twin
				s.prune_all_trailing (os_directory_separator)
				Result := (create {RAW_FILE}.make (s)).exists
			end
		end

	is_valid_directory_part (path: STRING): BOOLEAN
			-- Is the directory part of `path', whose last section is a filename, valid on the repository medium?
		local
			dir_name: STRING
		do
			if path /= Void and then not path.is_empty then
				dir_name := path.substring(1, path.last_index_of (operating_environment.directory_separator, path.count) - 1)
				Result := (create {DIRECTORY}.make (dir_name)).exists
			end
		end

	has_file_changed_on_disk (path: STRING; timestamp: INTEGER): BOOLEAN
			-- Has the loaded archetype designated by `path' changed on disk since last read?
		do
			file_context.set_target (path)
			Result := file_context.file_changed (timestamp)
		end

feature -- Commands

	save_as (full_path, archetype_source: STRING)
			-- Save `archetype_source' to the file designated by `full_path'.
		do
			if file_context.file_writable (full_path) then
				file_context.save_file (full_path, archetype_source)
				source_timestamp := file_context.file_timestamp
				post_info (Current, "save_as", "save_as_i1", <<current_language, full_path>>)
			else
				post_error (Current, "save_as", "save_as_e1", <<full_path>>)
			end
		end

feature {NONE} -- Implementation

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result.make
		ensure
			attached: Result /= Void
		end

	base_name_pattern_regex: LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adl".
		once
			create Result.compile_case_insensitive (".*\." + archetype_file_extension + "$")
		ensure
			attached: Result /= Void
		end

	repository_archetype (root_path, full_path: STRING): ARCHETYPE_REPOSITORY_ARCHETYPE
			-- A descriptor of the archetype designated by `full_path' to this repository.
		require
			root_path_valid: is_valid_path (root_path)
			full_path_valid: is_valid_path (full_path)
			full_path_under_root_path: full_path.substring_index (root_path, 1) = 1
		local
			base_name: STRING
			id: ARCHETYPE_ID
		do
			if (create {RAW_FILE}.make (full_path)).is_plain then
				base_name := file_system.basename (full_path)

				if base_name_pattern_regex.matches (base_name) then
					base_name.remove_tail (1 + archetype_file_extension.count)
					create id

					if id.valid_id (base_name) then
						id.make_from_string (base_name)
						create Result.make (root_path, full_path, group_id, id, id.is_specialised, Current)
					end
				end
			end
		ensure
			has_root_path: Result /= Void implies Result.root_path.is_equal (root_path)
			has_full_path: Result /= Void implies Result.full_path.is_equal (full_path)
			has_group_id: Result /= Void implies Result.group_id = group_id
			has_this_repository: Result /= Void implies Result.repository = Current
		end

invariant
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
--| The Original Code is file_context.e.
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
