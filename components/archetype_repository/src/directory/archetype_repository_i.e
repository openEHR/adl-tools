note
	component:   "openEHR ADL Tools"
	description: "Representation of an archetype repository in some medium."
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class
	ARCHETYPE_REPOSITORY_I

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	text: detachable STRING
			-- Contents of the last opened archetype file.
		deferred
		end

	text_timestamp: INTEGER
			-- Modification time of last opened file as an integer, for comparison purposes.
		deferred
		end

	group_id: INTEGER
			-- Id of the group to which this repository belongs.

	errors: ERROR_ACCUMULATOR

feature {ARCHETYPE_CATALOGUE} -- Access

	archetype_id_index: HASH_TABLE [ARCH_CAT_ARCHETYPE, STRING]
			-- list of all archetypes found in this directory tree, keyed by id
		attribute
			create Result.make (0)
		end

feature -- Status Report

	is_valid_path (path: STRING): BOOLEAN
			-- Is `path' a valid, existing file on the repository medium?
		deferred
		ensure
			false_if_void: Result implies attached path
		end

	is_valid_directory (path: STRING): BOOLEAN
			-- Is `path' a valid, existing directory on the repository medium?
		deferred
		ensure
			false_if_void: Result implies attached path
		end

	is_valid_directory_part (path: STRING): BOOLEAN
			-- Is the directory part of `path' valid on the repository medium?
		deferred
		ensure
			false_if_void: Result implies attached path
		end

	has_file_changed_on_disk (a_path: STRING; a_timestamp: INTEGER): BOOLEAN
			-- Has the loaded archetype designated by `path' changed on disk since last read?
		require
			path_valid: not a_path.is_empty
		deferred
		end

feature -- Commands

	read_text_from_file (full_path: STRING)
			-- Read `text' and `text_timestamp' from the file designated by `full_path' on the repository medium.
		require
			path_valid: is_valid_directory_part (full_path)
		deferred
		ensure
			text_attached: attached text
		end

	save_text_to_file (full_path, a_text: STRING)
			-- Save `a_text' to the file designated by `full_path' on the repository medium.
		require
			path_valid: is_valid_directory_part (full_path)
			text_valid: not a_text.is_empty
		deferred
		end

	delete_file (full_path: STRING)
			-- Delete file designated by `full_path' on the repository medium.
		require
			path_valid: is_valid_directory_part (full_path)
		deferred
		end

invariant
	timestamp_natural: text_timestamp >= 0
	group_id_valid: group_id > 0

end


