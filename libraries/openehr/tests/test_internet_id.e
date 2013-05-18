note
	component:   "openEHR ADL Tools"
	description: "Tests for INTERNET_ID"
	keywords:    "identifiers"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_INTERNET_ID

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_make
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{INTERNET_ID}.make"
		local
			val_uid, uid: INTERNET_ID
		do
			create val_uid.default_create

			-- proper reverse domain name
			assert_equal (True, val_uid.valid_id ("org.openehr.ckm"))
			create uid.make ("ckm.org.openehr")

			-- proper reverse domain name
			assert_equal (True, val_uid.valid_id ("org.open-ehr.ckm"))
			create uid.make ("ckm.org.open-ehr")

			-- broken domain name - illegal char ' '
			assert_equal (False, val_uid.valid_id ("org.open ehr.ckm"))

			-- broken domain name - illegal char '_'
			assert_equal (False, val_uid.valid_id ("org.openehr.ckm_1"))

			-- broken domain name - leading numeric
			assert_equal (False, val_uid.valid_id ("1org.openehr.ckm"))

			-- broken domain name - trailing '-' in segment
			assert_equal (False, val_uid.valid_id ("org.openehr.ckm-"))

			-- broken domain name - trailing '-' in segment
			assert_equal (False, val_uid.valid_id ("org.openehr-.ckm"))

			-- broken domain name - GUID supplied by mistake
			assert_equal (False, val_uid.valid_id ("229F3EC63-43BF-4723-9715-6814985BD2D"))

			-- broken domain name - junk
			assert_equal (False, val_uid.valid_id ("324rrevc435t43frwefefg"))
		end

end


