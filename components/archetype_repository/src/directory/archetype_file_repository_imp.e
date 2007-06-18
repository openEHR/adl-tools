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

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result.make
		ensure
			attached: Result /= Void
		end

	source (full_path: STRING): STRING
			-- Source of archetype designated by `full_path' from the repository medium.
		do
			file_context.set_target (full_path)
			file_context.read_file
			Result := file_context.file_content
		end

	source_timestamp: INTEGER
			-- Modification time of last opened file as an integer, for comparison purposes.
		do
			Result := file_context.file_timestamp
		end

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
				post_info (Current, "save_as", "save_archetype_i1", <<current_language, full_path>>)
			else
				post_error (Current, "save_as", "save_archetype_e1", <<full_path>>)
			end
		end

end
