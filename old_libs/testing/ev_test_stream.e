note
	component:   "openEHR ADL Tools"
      description: "Test input/output stream for Eiffel Vision"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EV_TEST_STREAM

inherit
	TEST_STREAM

create
	make

feature -- Initialisation

	make(an_impl: like implementation)
		require
			an_impl /= Void
		do
			implementation := an_impl
		end

feature -- Access

	put_string (a_text: STRING)
		do
			implementation.append_text (a_text)
		end

	search (str: STRING; start: INTEGER): INTEGER
			-- Position of first occurrence of `str' at or after `start';
			-- 0 if none.
		do
			Result := implementation.search (str, start)
		end

	new_line
		do
			implementation.append_text ("%N")
		end

feature {NONE} -- Implementation

	implementation: EV_TEXT

end

