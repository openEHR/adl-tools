note
	component:   "openEHR ADL Tools"
	description: "Tests for UUID"
	keywords:    "identifiers"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_UUID

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_make
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{UUID}.make"
		local
			val_uid, uid: UUID
		do
			create val_uid.default_create

			-- proper GUID
			assert_equal (True, val_uid.valid_id ("228F3EC6-43BF-4723-9715-46814985BD2D"))
			create uid.make ("228F3EC6-43BF-4723-9715-46814985BD2D")

			-- broken GUID - non hex char - pos 3 = 'Z'
			assert_equal (False, val_uid.valid_id ("22ZF3EC6-43BF-4723-9715-46814985BD2D"))

			-- broken GUID - trailing delimiter
			assert_equal (False, val_uid.valid_id ("22ZF3EC6-43BF-4723-9715-46814985BD2D-"))

			-- broken GUID - wrong length (1 short at end)
			assert_equal (False, val_uid.valid_id ("22ZF3EC6-43BF-4723-9715-46814985BD2"))

			-- broken GUID - wrong segment lengths for 1st and last segment
			assert_equal (False, val_uid.valid_id ("229F3EC63-43BF-4723-9715-6814985BD2D"))

			-- broken GUID - ISO oid supplied by mistake
			assert_equal (False, val_uid.valid_id ("1.2.3.4"))

			-- broken GUID - junk
			assert_equal (False, val_uid.valid_id ("324rrevc435t43frwefefg"))
		end

end


