note
	component:   "openEHR ADL Tools"
	description: "Tests for HIER_OBJECT_ID"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_HIER_OBJECT_ID

inherit
	OPENEHR_TEST_SET

	INTERNAL
		undefine
			default_create
		end

feature -- Test routines

	test_make_from_string
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{HIER_OBJECT_ID}.make_from_string"
		local
			hid: HIER_OBJECT_ID
		do
			-- Guid based id
			create hid.make_from_string ("228F3EC6-43BF-4723-9715-46814985BD2D")
			assert_equal (True, field_conforms_to (dynamic_type (hid.root), dynamic_type ((create {UUID}.default_create))))

			-- Oid based id
			create hid.make_from_string ("1.2.3.4")
			assert_equal (True, field_conforms_to (dynamic_type (hid.root), dynamic_type ((create {ISO_OID}.default_create))))
		end

	test_root_extension
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{HIER_OBJECT_ID}.root"
		local
			hid: HIER_OBJECT_ID
		do
			-- Guid based id
			create hid.make_from_string ("228F3EC6-43BF-4723-9715-46814985BD2D")
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D", hid.root.value)
			assert_equal ("", hid.extension)
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D", hid.as_string)

			-- Guid based id + Guid extension
			create hid.make_from_string ("228F3EC6-43BF-4723-9715-46814985BD2D::3CA963D7-0B99-4994-98B6-AD55903931FB")
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D", hid.root.value)
			assert_equal ("3CA963D7-0B99-4994-98B6-AD55903931FB", hid.extension)
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D::3CA963D7-0B99-4994-98B6-AD55903931FB", hid.as_string)

			-- Oid based id
			create hid.make_from_string ("1.2.3.4")
			assert_equal ("1.2.3.4", hid.root.value)
			assert_equal ("", hid.extension)
			assert_equal ("1.2.3.4", hid.as_string)

			-- Oid based id + extension
			create hid.make_from_string ("1.2.3.4::aa")
			assert_equal ("1.2.3.4", hid.root.value)
			assert_equal ("aa", hid.extension)
			assert_equal ("1.2.3.4::aa", hid.as_string)
		end

end


