note
	component:   "openEHR ADL Tools"
	description: "Test suite for path syntax."
	keywords:    "test, paths, parsing"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_PATH

inherit
	TEST_SUITE

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title:STRING = "Path test suite"

	test_cases: LINKED_LIST[TEST_CASE]
		local
			tc:TEST_CASE
		once
			create Result.make

			create {TC_PATH_BASIC} tc.make(Void) Result.extend(tc)
		end

end

