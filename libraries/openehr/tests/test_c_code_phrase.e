note
	component:   "openEHR ADL Tools"
	description: "Tests for C_CODE_PHRASE"
	keywords:    "archetype, adl, aom"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	testing:     "type/manual"

class
	TEST_C_CODE_PHRASE

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_valid_pattern
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{C_CODE_PHRASE}.valid_pattern"
		local
			a_ccp: C_CODE_PHRASE
		do
			create a_ccp.default_create

			assert_equal (True, a_ccp.valid_pattern ("local::"))
			assert_equal (True, a_ccp.valid_pattern ("local::at0001"))
			assert_equal (True, a_ccp.valid_pattern ("local::at0001,at0002"))
			assert_equal (True, a_ccp.valid_pattern ("local::at0001,at0002,at0003"))
			assert_equal (True, a_ccp.valid_pattern ("local::at0001;at0001"))
			assert_equal (False, a_ccp.valid_pattern ("local::at0001;at0002"))
			assert_equal (True, a_ccp.valid_pattern ("local::at0001,at0002;at0002"))
			assert_equal (False, a_ccp.valid_pattern ("local::at0001,at0002;at0003"))
			assert_equal (True, a_ccp.valid_pattern ("local::at0001, at0002, at0003"))
			assert_equal (True, a_ccp.valid_pattern ("local::at0001,	at0002;	at0002"))
		end

end


