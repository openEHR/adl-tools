note
	component:   "ADL editor"

	description: "file handling context for ADL back-end"
	keywords:    "file"

	author:      "Thomas Beale"
	support:     "openEHR support <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2002,2003 Ocean Informatics"
	licence:     "The openEHR Open Source Licence"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	FILE_CONTEXT

inherit
	UC_IMPORTED_UTF8_ROUTINES

create
	make

feature -- Definitions

	UTF8_bom_char_1: CHARACTER = '%/239/'
	UTF8_bom_char_2: CHARACTER = '%/187/'
	UTF8_bom_char_3: CHARACTER = '%/191/'
			-- UTF-8 files don't normally have a BOM (byte order marker) at the start as can be
			-- required by UTF-16 files, but if the file has been converted from UTF-16 or UTF-32
			-- then the BOM in a UTF-8 file will be 0xEF 0xBB 0xBF (dec equivalent: 239, 187, 191)

	Default_current_directory: STRING = "."

feature {NONE} -- Initialisation

	make
			-- basic initialisation
		do
			create current_directory.make_empty
			create current_file_name.make_empty
			create last_op_fail_reason.make_empty
			create file_content.make_empty
		end

feature -- Access

	current_full_path: attached STRING
			-- derive from file name and path
		do
			Result := current_directory + operating_environment.Directory_separator.out + current_file_name
		end

	current_directory: STRING
			-- directory name only

	current_file_name: STRING
			-- name of fle only

	has_byte_order_marker: BOOLEAN
			-- Does the current file have a BOM indicating it is a UTF-8 encoded unicode file?

	last_op_failed: BOOLEAN

	last_op_fail_reason: STRING

	file_content: STRING
			-- Text from current file as a string.

	file_lines: ARRAYED_LIST [STRING]
			-- file split into liines from `read_n_lines', `read_to_line'

	file_timestamp: INTEGER
			-- Last marked change timestamp of file, for file changes to be compared to.

feature -- Status Report

	has_file (a_file_name: STRING): BOOLEAN
			-- Does `a_file_name' exist in `current_directory'?
		require
			File_name_valid: a_file_name /= Void
		local
			a_file: PLAIN_TEXT_FILE
   		do
			create a_file.make (current_directory + operating_environment.Directory_separator.out + a_file_name)
			Result := a_file.exists
		end

	file_writable (a_file_name: STRING): BOOLEAN
			-- True if named file is writable, or else doesn't exist
		require
			File_name_valid: a_file_name /= Void and then not a_file_name.is_empty
		local
			fd: PLAIN_TEXT_FILE
   		do
			create fd.make(a_file_name)
			Result := not fd.exists or else fd.is_writable
		end

feature -- Commands

	read_file_timestamp
			-- Set `file_timestamp' from the file modification date of `current_full_path'.
		local
			file: PLAIN_TEXT_FILE
		do
			create file.make (current_full_path)

			if file.exists then
				file_timestamp := file.date
			else
				file_timestamp := 0
			end
		end

	read_n_lines (n: INTEGER)
			-- Read first line from current file as a string.
		require
			n > 0
		local
			in_file: PLAIN_TEXT_FILE
			i: INTEGER
   		do
   			last_op_failed := False
			create in_file.make(current_full_path)
			create file_lines.make(0)

			if in_file.exists then
				in_file.open_read
				from i := 1 until i > n or in_file.end_of_file loop
					in_file.read_line
					file_lines.extend (in_file.last_string.twin)
					file_lines.last.prune_all('%R')
					i := i + 1
				end
				in_file.close
				if file_lines.count >= 1 then
					clean_utf(file_lines[1])
				end
			else
				last_op_failed := True
				last_op_fail_reason := "Read failed; file " + current_full_path + " does not exist"
			end
		ensure
			file_lines_empty_on_failure: last_op_failed implies file_lines.is_empty
		end

	read_matching_lines (start_patterns: attached ARRAY[STRING]; ignore_pattern: STRING; max_lines: INTEGER)
			-- Read lines starting with `start_patterns', ignoring lines starting with `ignore_pattern',
			-- up to a maximum of `max_lines' non-ignored lines. Output line, if any, in `file_lines'
		require
			Start_patterns_valid: not start_patterns.is_empty
			Ignore_pattern_valid: attached ignore_pattern implies not ignore_pattern.is_empty
			Valid_max_lines: max_lines > 0
		local
			in_file: PLAIN_TEXT_FILE
			i, j: INTEGER
			items_found: ARRAY[BOOLEAN]
   		do
   			last_op_failed := False
			create in_file.make(current_full_path)
			create file_lines.make(0)

			if in_file.exists then
				in_file.open_read
				create items_found.make (start_patterns.lower, start_patterns.upper)
				from i := 1 until i > max_lines or file_lines.count = start_patterns.count or in_file.end_of_file loop
					in_file.read_line
					if not in_file.last_string.starts_with (ignore_pattern) then
						from j := start_patterns.lower until j > start_patterns.upper loop
							if not items_found[j] and in_file.last_string.starts_with (start_patterns[j]) then
								file_lines.extend (in_file.last_string.twin)
								file_lines.last.prune_all('%R')
								items_found[j] := True
							end
							j := j + 1
						end
						i := i + 1
					end
				end
				in_file.close
				if file_lines.count >= 1 then
					clean_utf(file_lines[1])
				end
			else
				last_op_failed := True
				last_op_fail_reason := "Read failed; file " + current_full_path + " does not exist"
			end
		ensure
			file_lines_empty_on_failure: last_op_failed implies file_lines.is_empty
		end

	read_file
			-- Read text from current file into `file_content'.
		local
			in_file: PLAIN_TEXT_FILE
   		do
   			last_op_failed := False
			create file_content.make_empty
			create in_file.make(current_full_path)
			has_byte_order_marker := False

			if in_file.exists then
				file_timestamp := in_file.date
				in_file.open_read
				in_file.read_stream (in_file.count)
				file_content := in_file.last_string
				in_file.close

				file_content.prune_all ('%R')
				clean_utf(file_content)
				if not utf8.valid_utf8 (file_content) then
					if has_byte_order_marker then
						create file_content.make_empty
						last_op_failed := True
						last_op_fail_reason := "Read failed; file " + current_full_path + " has UTF-8 marker but is not valid UTF-8"
					else
						file_content := utf8.to_utf8 (file_content)
					end
				end
			else
				last_op_failed := True
				last_op_fail_reason := "Read failed; file " + current_full_path + " does not exist"
			end
		ensure
			file_content_empty_on_failure: last_op_failed implies file_content.is_empty
		end

	save_file (a_file_name, content: STRING)
			-- Write `content' out to file `a_file_name' in `current_directory'.
		require
			Arch_id_valid: a_file_name /= Void
			Content_valid: content /= Void
			File_writable: file_writable (a_file_name)
		local
			out_file: PLAIN_TEXT_FILE
   		do
   			last_op_failed := False
			create out_file.make_create_read_write (a_file_name)

			if out_file.exists then
				if has_byte_order_marker then
					-- only safe if the file was last read using this object
					out_file.put_character (UTF8_bom_char_1)
					out_file.put_character (UTF8_bom_char_2)
					out_file.put_character (UTF8_bom_char_3)
				end

				file_content := content.twin
				file_content.replace_substring_all ("%R%N", "%N")
				out_file.put_string (file_content)
				out_file.close
				file_timestamp := out_file.date
			else
				last_op_failed := True
				last_op_fail_reason := "Write failed; file " + a_file_name + " does not exist"
			end
		end

	set_target (a_file_path: STRING)
			-- set context to `a_file_path'
		require
			a_file_path_valid: a_file_path /= Void and then not a_file_path.is_empty
		local
			sep_pos: INTEGER
		do
			sep_pos := a_file_path.last_index_of(operating_environment.Directory_separator, a_file_path.count)

			if sep_pos > 0 then -- there is a directory
				current_directory := a_file_path.substring(1, sep_pos - 1)
				current_file_name := a_file_path.substring(sep_pos + 1, a_file_path.count)
			else
				current_directory := Default_current_directory
				current_file_name := a_file_path
			end
		end

	set_current_file_name (a_file_name: STRING)
		require
			a_file_name_valid: a_file_name /= Void and then not a_file_name.is_empty
		do
			current_file_name := a_file_name
		end

	set_current_directory (a_dir: STRING)
		require
			a_dir_valid: a_dir /= Void and then not a_dir.is_empty
		do
			current_directory := a_dir
		end

feature {NONE} -- Implementation

	clean_utf(s: STRING) is
			-- remove UTF BOM
		do
			if s.count >= 3 then
				if utf8.is_endian_detection_character (s.item (1), s.item (2), s.item (3)) then
					s.remove_head (3)
					has_byte_order_marker := True
				end
			end
		end

invariant
	directory_attached: current_directory /= Void
	file_name_attached: current_file_name /= Void
	last_op_fail_reason_attached: last_op_fail_reason /= Void
	content_attached: file_content /= Void
	timestamp_natural: file_timestamp >= 0

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
