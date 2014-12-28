note
	component:   "openEHR ADL Tools"
	description: "File-system repository of archetypes - implementation of ARCHETYPE_LIBRARY_I."
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class
	ARCHETYPE_FILE_LIBRARY_IMP

inherit
	ARCHETYPE_LIBRARY_SOURCE

	SHARED_ADL_APP_RESOURCES
		rename
			file_exists as is_valid_path,
			directory_exists as is_valid_directory
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all
		end

feature -- Access

	text: detachable STRING
			-- Contents of the last opened archetype file.

	text_timestamp: INTEGER
			-- Modification time of last opened archetype file as an integer, for comparison purposes.

feature -- Status Report

	is_valid_directory_part (path: STRING): BOOLEAN
			-- Is the directory part of `path', whose last section is a filename, valid on the repository medium?
		do
			if not path.is_empty and attached file_system.dirname (path) as dn then
				Result := file_system.directory_exists (dn)
			end
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
				errors.add_info (ec_save_as_i1, <<full_path>>, "save_text_to_file")
			else
				errors.add_error (ec_save_as_e1, <<full_path>>, "save_text_to_file")
			end
		end

	delete_file (full_path: STRING)
			-- Delete file designated by `full_path' on the repository medium.
		do
			file_system.delete_file (full_path)
		end

feature {NONE} -- Implementation

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result
		end

	adl_legacy_flat_filename_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adl".
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (".*\" + File_ext_archetype_adl14 + "$")
		end

	adl_differential_filename_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adls".
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (".*\" + File_ext_archetype_source + "$")
		end

end



