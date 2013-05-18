note
	component:   "openEHR ADL Tools"
	description: "Test suite for date/time types."
	keywords:    "test, date, time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_DATE_TIME

inherit
	TEST_SUITE

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title:STRING = "ISO 8601 Date/time test suite"

	test_cases: LINKED_LIST[TEST_CASE]
		local
			tc:TEST_CASE
		once
			create Result.make

			create {TC_ISO8601_DATE} tc.make(Void) Result.extend(tc)
			create {TC_ISO8601_TIME} tc.make(Void) Result.extend(tc)
			create {TC_ISO8601_DATE_TIME} tc.make(Void) Result.extend(tc)
			create {TC_ISO8601_DURATION} tc.make(Void) Result.extend(tc)
		end

end

