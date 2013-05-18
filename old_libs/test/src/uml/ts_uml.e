note
	component:   "openEHR ADL Tools"
	description: "Test suite for UML classes"
	keywords:    "test, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class TS_UML

inherit
	TEST_SUITE

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title:STRING = "Object Graph test suite"

	test_cases: LINKED_LIST[TEST_CASE]
		local
			tc:TEST_CASE
		once
			create Result.make

			create {TC_UML_CREATE_CLASS} tc.make(Void) Result.extend(tc)
		end

end

