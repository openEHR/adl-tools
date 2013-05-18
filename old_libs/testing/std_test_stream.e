note
	component:   "openEHR ADL Tools"
      description: "Std file input/output stream"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class STD_TEST_STREAM

inherit
	TEST_STREAM

feature -- Access

	put_string (a_text: STRING)
		do
			io.put_string (a_text)
		end

	search (str: STRING; start: INTEGER): INTEGER
			-- Position of first occurrence of `str' at or after `start';
			-- 0 if none.
		do
			Result := 0
		end

	new_line
		do
			io.new_line
		end

end

