note
	component:   "openEHR ADL Tools"
	description: "Tests for ISO_OID"
	keywords:    "identifiers"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_ISO_OID

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_make
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{ISO_OID}.make"
		local
			val_uid, uid: ISO_OID
		do
			create val_uid.default_create

			-- proper OID
			assert_equal (True, val_uid.valid_id ("1.3.55.2222.0"))
			create uid.make ("1.3.55.2222.0")

			-- broken OID - non numeric char
			assert_equal (False, val_uid.valid_id ("1.3.55.2x22.0"))

			-- broken OID - wrong kind of delimiter
			assert_equal (False, val_uid.valid_id ("1.3-55.2222.0"))

			-- broken OID - trailing delimiter
			assert_equal (False, val_uid.valid_id ("1.3.55.2222.0."))

			-- broken OID - leading delimiter
			assert_equal (False, val_uid.valid_id (".1.3.55.2222.0"))

			-- broken OID - adjacent delimiters
			assert_equal (False, val_uid.valid_id ("1.3..55.2222.0"))

			-- broken OID - GUID supplied by mistake
			assert_equal (False, val_uid.valid_id ("229F3EC63-43BF-4723-9715-6814985BD2D"))

			-- broken OID - junk
			assert_equal (False, val_uid.valid_id ("324rrevc435t43frwefefg"))
		end

end


