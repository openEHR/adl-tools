note
	component:   "openEHR ADL Tools"
	description: "Test suite for object graph parse tree."
	keywords:    "test, parse, parsing, object graph"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_DADL

inherit
	TEST_SUITE

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title:STRING = "dADL test suite"

	test_cases: LINKED_LIST[TEST_CASE]
		local
			tc:TEST_CASE
		once
			create Result.make

			create {TC_DADL2_BASIC_TYPES} tc.make(Void) Result.extend(tc)
		--	create {TC_DADL1_SINGLE_ATTR} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_SINGLE_ATTR} tc.make(Void) Result.extend(tc)
		--	create {TC_DADL1_MULTIPLE_ATTR} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_MULTIPLE_ATTR} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_NESTED_MULTIPLE_ATTR} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_MULTIPLE_ATTR2} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_TYPED} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_TYPED_ANON} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_EMPTY} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_AS_OBJECT_SIMPLE} tc.make(Void) Result.extend(tc)
			create {TC_DADL_EMBEDDED_CADL} tc.make(Void) Result.extend(tc)
			create {TC_DADL2_TERM_CODE} tc.make(Void) Result.extend(tc)

			create {TC_DADL_LINE_BREAK} tc.make(Void) Result.extend(tc)
		end

end

