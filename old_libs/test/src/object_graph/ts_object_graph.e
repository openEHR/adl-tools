note
	component:   "openEHR ADL Tools"
	description: "Test suite for object graph parse tree."
	keywords:    "test, parse, parsing, object graph"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_OBJECT_GRAPH

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

			create {TC_OG_CREATE} tc.make(Void) Result.extend(tc)
			create {TC_OG_HAS_PATH} tc.make(Void) Result.extend(tc)
			create {TC_OG_HAS_MOVABLE_PATH} tc.make(Void) Result.extend(tc)
			create {TC_OG_MODIFY} tc.make(Void) Result.extend(tc)
		end

end

