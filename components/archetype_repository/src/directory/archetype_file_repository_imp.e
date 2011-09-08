note
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

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_APP_RESOURCES
		rename
			file_exists as is_valid_path,
			directory_exists as is_valid_directory
		export
			{NONE} all
		end

feature -- Access

	text: STRING
			-- Contents of the last opened archetype file.

	text_timestamp: INTEGER
			-- Modification time of last opened archetype file as an integer, for comparison purposes.

feature -- Status Report

	is_valid_directory_part (path: STRING): BOOLEAN
			-- Is the directory part of `path', whose last section is a filename, valid on the repository medium?
		do
			if path /= Void and then not path.is_empty then
				Result := is_valid_directory (file_system.dirname (path))
			end
		end

	has_file_changed_on_disk (path: STRING; timestamp: INTEGER): BOOLEAN
			-- Has the loaded archetype designated by `path' changed on disk since last read?
		do
			file_context.set_target (path)
			file_context.read_file_timestamp
			Result := file_context.file_timestamp > timestamp
		end

feature -- Commands

	read_text_from_file (full_path: STRING)
			-- Read `text' and `text_timestamp' from the file designated by `full_path' on the repository medium.
		do
			file_context.set_target (full_path)
			file_context.read_file
			text := file_context.file_content
			text_timestamp := file_context.file_timestamp
		end

	save_text_to_file (full_path, a_text: STRING)
			-- Save `a_text' to the file designated by `full_path' on the repository medium.
		do
			if file_context.file_writable (full_path) then
				file_context.save_file (full_path, a_text)
				text_timestamp := file_context.file_timestamp
				post_info (Current, "save_as", "save_as_i1", <<full_path>>)
			else
				post_error (Current, "save_as", "save_as_e1", <<full_path>>)
			end
		end

feature {NONE} -- Implementation

	file_context: attached FILE_CONTEXT
			-- Access to the file system.
		once
			create Result.make
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
