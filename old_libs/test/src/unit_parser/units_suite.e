note
	component:   "openEHR ADL Tools"
	description: "Test suite for units parser."
	keywords:    "test, units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_UNITS

inherit
	TEST_SUITE

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title:STRING = "Units parser test suite"

	test_cases:LINKED_LIST[TEST_CASE]
		local
			tc:TEST_CASE
		once
			create Result.make

			create {TC_BASE_UNITS} tc.make(Void) Result.extend(tc)
			create {TC_SI_UNITS} tc.make(Void) Result.extend(tc)
			create {TC_ISO1000_UNITS} tc.make(Void) Result.extend(tc)
			create {TC_DIMENSIONLESS_UNITS} tc.make(Void) Result.extend(tc)
		end

end

