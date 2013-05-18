note
	component:   "openEHR ADL Tools"
	description: "[
		       Access to the contents of a text file, in memory, 
	             ignoring comments & blank lines.
			 ]"
	keywords:    "text file access"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class TEXT_FILE_ACCESS

feature -- Initialisation

	make (a_file_name: STRING)
			-- initialise config file
		require
			file_name_not_empty: not a_file_name.is_empty
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

	file_name: STRING

	file_default_cmt_char: CHARACTER = ';'

	file_cmt_char: CHARACTER

feature -- Status

	exists: BOOLEAN
			-- file exists

	writable: BOOLEAN
			-- file writable

feature -- Modification

	set_file_cmt_char (c: CHARACTER)
		do
			file_cmt_char := c
		end

feature {NONE} -- Implementation

	file: RAW_FILE

	linebuf: STRING

	read_file
			-- read the whole file
		do
			read_initialise
			read_process_file
			read_finalise
		end

	read_line
			-- read a significant line, i.e. a non-blank, non-comment line
		local
			pos: INTEGER
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

	initialise
			-- once-only initialisation for file access
		deferred
		end

	read_initialise
			-- do any specific initialisation before each read of file
		deferred
		end

	read_finalise
			-- do any specific finalisation after each read of file
		deferred
		end

	read_process_file
			-- process linebuf contents; guaranteed to be leading and trailing
			-- space stripped; no blank lines or comment lines
		deferred
		end

	is_valid:BOOLEAN
		deferred
		ensure
			Is_valid: not Result implies fail_reason /= Void
		end

	write_file
		deferred
		ensure
			File_closed: file.is_closed
		end

end


