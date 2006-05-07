indexing
	component:   "openEHR Reusable Libraries"
	description: "[
		       Access to the contents of a text file, in memory, 
	             ignoring comments & blank lines.
			 ]"
	keywords:    "text file access"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class TEXT_FILE_ACCESS

inherit
	ERROR_STATUS

feature -- Initialisation

	make(a_file_name:STRING) is
			-- initialise config file
		require
			Args_valid: a_file_name /= Void and then not a_file_name.is_empty
		do
			file_name := a_file_name.twin
			file_cmt_char := file_default_cmt_char

			create file.make(file_name)
        
			if not file.exists then
				set_fail_reason("File " + file_name + " does not exist")

			elseif not file.is_readable then
				set_fail_reason("File " + file_name + " not readable")

			else
				exists := True
				writable := file.is_writable

				file.open_read
				create linebuf.make(0)

                initialise
				read_file

				file.close
			end
 		ensure
			File_closed: file.is_closed
		end

feature -- Access

	file_name:STRING

	file_default_cmt_char:CHARACTER is ';'

	file_cmt_char:CHARACTER

feature -- Status

	exists: BOOLEAN
			-- file exists

	writable: BOOLEAN
			-- file writable

feature -- Modification

	set_file_cmt_char(c:CHARACTER) is
		do
			file_cmt_char := c
		end

feature {NONE} -- Implementation

	file:RAW_FILE

	linebuf:STRING

	read_file is
			-- read the whole file
		do
			read_initialise
			read_process_file
			read_finalise
		end

	read_line is
			-- read a significant line, i.e. a non-blank, non-comment line
		local
			pos:INTEGER
		do
			from
				linebuf.wipe_out
			until
				not linebuf.is_empty or file.end_of_file
			loop
				file.readline

				-- ignore blank lines & comment lines (lines or part lines starting with a semicolon)
				linebuf := file.laststring.twin
 				linebuf.left_adjust -- remove leading spaces
				linebuf.right_adjust -- remove trailing white space
				if not linebuf.is_empty then
					-- see if it is a comment
					if linebuf.item(1) = file_cmt_char then
						linebuf.wipe_out
					else
						-- must be a real line; strip out in-line comments
						pos := linebuf.index_of(file_cmt_char,1)
						if pos > 0 then
							linebuf.replace_substring("", pos, linebuf.count)
						end
					end
				end
			end
		ensure
			not linebuf.is_empty or else file.end_of_file
		end

feature -- template routines

	initialise is
			-- once-only initialisation for file access
		deferred
		end

	read_initialise is
			-- do any specific initialisation before each read of file
		deferred
		end

	read_finalise is
			-- do any specific finalisation after each read of file
		deferred
		end

	read_process_file is
			-- process linebuf contents; guaranteed to be leading and trailing
			-- space stripped; no blank lines or comment lines
		deferred
		end
        
	is_valid:BOOLEAN is
		deferred
		ensure
			Is_valid: not Result implies fail_reason /= Void
		end

	write_file is
		deferred
		ensure
			File_closed: file.is_closed
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
--| The Original Code is text_file_access.e.
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
