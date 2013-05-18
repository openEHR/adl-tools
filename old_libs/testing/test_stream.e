note
	component:   "openEHR ADL Tools"
      description: "Test input/output streams"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class TEST_STREAM

feature -- Access

	put_string (a_text: STRING)
		require
			text_not_void: a_text /= void
		deferred
		end

	search (str: STRING; start: INTEGER): INTEGER
			-- Position of first occurrence of `str' at or after `start';
			-- 0 if none.
		require
			valid_string: str /= void
			valid_start: start > 0
		deferred
		end

	new_line
		deferred
		end

end

