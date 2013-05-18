note
	component:   "openEHR ADL Tools"
	description: "Test suite for simulating Java calls into JNI-wrapped DLL"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_JAVA_SIM_SUITE

inherit
	TEST_SUITE
	
create
	make
	
feature -- Access

	test_cases: LINKED_LIST[TEST_CASE]
			-- the list of tests available
		once
			create Result.make
			Result.extend(create {TC_JS_ARCHETYPE_PARSE}.make(Void))
		end

	title: STRING = "Java simulator test cases"

feature -- Initialisation

	make(arg: ANY)
		do
		end

end

