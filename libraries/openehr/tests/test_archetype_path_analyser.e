note
	component:   "openEHR ADL Tools"
	description: "Tests for ARCHETYPE_PATH_ANALYSER class"
	keywords:    "archetype, paths"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	testing:     "type/manual"

class
	TEST_ARCHETYPE_PATH_ANALYSER

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_path_at_level
			-- path at level should return a valid path for a given specialisation level, as long as the path is deep enough
		note
			testing:  "covers/{ARCHETYPE_PATH_ANALYSER}.path_at_level"
		local
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
		do
			create apa.make_from_string("/items")
			a_path := apa.path_at_level(0)
			assert_equal ("/items", a_path)

			create apa.make_from_string("/items[at0001]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0001]", a_path)

			create apa.make_from_string("/items[at0002.1]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0002]", a_path)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0002.1]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0002.1]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0002.1]", a_path)

			create apa.make_from_string("/items[at0003.0.1]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0003]", a_path)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0003]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0003.0.1]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0003.0.1]", a_path)
			a_path := apa.path_at_level(4)
			assert_equal ("/items[at0003.0.1]", a_path)

			create apa.make_from_string("/items[at0004.0.0.1]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0004]", a_path)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0004]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0004]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0004.0.0.1]", a_path)
			a_path := apa.path_at_level(4)
			assert_equal ("/items[at0004.0.0.1]", a_path)
			a_path := apa.path_at_level(5)
			assert_equal ("/items[at0004.0.0.1]", a_path)

			create apa.make_from_string("/items[at0.1]")
			-- a_path := apa.path_at_level(0)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0.1]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0.1]", a_path)

			create apa.make_from_string("/items[at0.0.2]")
			-- a_path := apa.path_at_level(0)
			-- a_path := apa.path_at_level(1)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0.0.2]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0.0.2]", a_path)
		end

	test_is_phantom_path_at_level
		note
			testing:  "covers/{ARCHETYPE_PATH_ANALYSER}.is_phantom_path_at_level"
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			create apa.make_from_string("/items[at0004.0.0.1]")
			assert_equal (False, apa.is_phantom_path_at_level(0))
			assert_equal (False, apa.is_phantom_path_at_level(1))
			assert_equal (False, apa.is_phantom_path_at_level(2))
			assert_equal (False, apa.is_phantom_path_at_level(3))

			create apa.make_from_string("/items[at0.0.0.1]")
			assert_equal (True, apa.is_phantom_path_at_level(0))
			assert_equal (True, apa.is_phantom_path_at_level(1))
			assert_equal (True, apa.is_phantom_path_at_level(2))
			assert_equal (False, apa.is_phantom_path_at_level(3))
		end

end


