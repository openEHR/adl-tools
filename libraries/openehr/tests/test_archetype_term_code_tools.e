note
	component:   "openEHR ADL Tools"
	description: "Tests for manipulating archetype codes"
	keywords:    "archetype, ontology, terminology"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009-2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	testing:     "type/manual"

class
	TEST_ARCHETYPE_TERM_CODE_TOOLS

inherit
	OPENEHR_TEST_SET

	ARCHETYPE_TERM_CODE_TOOLS
		undefine
			default_create
		end

feature -- Test routines

	test_code_exists_at_level
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{ARCHETYPE_TERM_CODE_TOOLS}.code_exists_at_level"
		do
			assert_equal (True, code_exists_at_level ("at0000", 0))
			assert_equal (True, code_exists_at_level ("at0000", 1))
			assert_equal (True, code_exists_at_level ("at0000", 2))
			assert_equal (True, code_exists_at_level ("at0000.1", 0))
			assert_equal (True, code_exists_at_level ("at0000.0.1", 0))
			assert_equal (True, code_exists_at_level ("at0000.1", 1))
			assert_equal (True, code_exists_at_level ("at0000.0.1", 1))
			assert_equal (False, code_exists_at_level ("at0.1", 0))
			assert_equal (False, code_exists_at_level ("at0.0.1", 0))
			assert_equal (True, code_exists_at_level ("at0.1", 1))
			assert_equal (False, code_exists_at_level ("at0.0.1", 1))
			assert_equal (True, code_exists_at_level ("at0.1.1", 1))
			assert_equal (True, code_exists_at_level ("at0.1.1", 2))
		end

	test_code_at_level
			-- A code's specialisation parent may be itself if the given level is the same as the code's specialisation depth.
		note
			testing:  "covers/{ARCHETYPE_TERM_CODE_TOOLS}.code_at_level"
		do
			assert_equal ("at0000", code_at_level ("at0000", 0))
			assert_equal ("at0000", code_at_level ("at0000.1", 0))
			assert_equal ("at0000", code_at_level ("at0000.0.1", 0))
			assert_equal ("at0000.1", code_at_level ("at0000.1", 1))
			assert_equal ("at0000", code_at_level ("at0000.0.1", 1))
			assert_equal ("at0.1", code_at_level ("at0.1", 1))
			assert_equal ("at0.1", code_at_level ("at0.1.1", 1))
			assert_equal ("at0.1.1", code_at_level ("at0.1.1", 2))
			assert_equal ("at0009", code_at_level ("at0009.0.1", 0))
			assert_equal ("at0009", code_at_level ("at0009.0.1", 1))
			assert_equal ("at0009.0.1", code_at_level ("at0009.0.1", 2))
			assert_equal ("at0009", code_at_level ("at0009.0.0.1", 0))
			assert_equal ("at0009", code_at_level ("at0009.0.0.1", 1))
			assert_equal ("at0009", code_at_level ("at0009.0.0.1", 2))
			assert_equal ("at0009.0.0.1", code_at_level ("at0009.0.0.1", 3))

		-- the following would be legal if we relaxed the second precondition on the routine,
		-- which could be done, but at the moment nothing in the system expects it
		--	assert_equal ("at0009.0.0.1", code_at_level ("at0009.0.0.1", 4))
		--	assert_equal ("at0009.0.0.1", code_at_level ("at0009.0.0.1", 5))
		end

	test_is_refined_code
			-- A code is specialised if there is a non-zero code index before the last index.
		note
			testing:  "covers/{ARCHETYPE_TERM_CODE_TOOLS}.is_refined_code"
		do
			assert_equal (False, is_refined_code ("at0000"))
			assert_equal (False, is_refined_code ("at0001"))
			assert_equal (False, is_refined_code ("at0.1"))
			assert_equal (False, is_refined_code ("at0.0.1"))
			assert_equal (True, is_refined_code ("at0000.1"))
			assert_equal (True, is_refined_code ("at0001.1"))
			assert_equal (True, is_refined_code ("at0000.0.1"))
			assert_equal (True, is_refined_code ("at0.1.1"))
		end

	test_is_valid_code
			-- A code is specialised if there is a non-zero code index before the last index.
		note
			testing:  "covers/{ARCHETYPE_TERM_CODE_TOOLS}.is_valid_code"
		do
			assert_equal (True, is_valid_code ("at0000"))
			assert_equal (True, is_valid_code ("at0001"))
			assert_equal (True, is_valid_code ("at0.1"))
			assert_equal (True, is_valid_code ("at0.0.1"))
			assert_equal (True, is_valid_code ("at0000.1"))
			assert_equal (True, is_valid_code ("at0001.1"))
			assert_equal (True, is_valid_code ("at0000.0.1"))
			assert_equal (True, is_valid_code ("at0.1.1"))
			assert_equal (False, is_valid_code ("at0"))
			assert_equal (False, is_valid_code ("at0.0"))
			assert_equal (False, is_valid_code ("at0.1.0"))
			assert_equal (False, is_valid_code ("at0003.0"))
			assert_equal (False, is_valid_code ("at000.0"))
			assert_equal (True, is_valid_code ("ac0000"))
			assert_equal (True, is_valid_code ("ac0001"))
			assert_equal (True, is_valid_code ("ac0.1"))
			assert_equal (True, is_valid_code ("ac0.0.1"))
			assert_equal (True, is_valid_code ("ac0000.1"))
			assert_equal (True, is_valid_code ("ac0001.1"))
			assert_equal (True, is_valid_code ("ac0000.0.1"))
			assert_equal (True, is_valid_code ("ac0.1.1"))
			assert_equal (False, is_valid_code ("ac0"))
			assert_equal (False, is_valid_code ("ac0.0"))
			assert_equal (False, is_valid_code ("ac0.1.0"))
			assert_equal (False, is_valid_code ("at0003.0"))
			assert_equal (False, is_valid_code ("at0000.0"))
		end

	test_specialisation_status_from_code
		note
			testing:  "covers/{ARCHETYPE_TERM_CODE_TOOLS}.specialisation_status_from_code"
		do
	 		assert_equal (ss_added, specialisation_status_from_code("at0001", 0).value)
			assert_equal (ss_added, specialisation_status_from_code("at0001.1", 0).value)
			assert_equal (ss_redefined, specialisation_status_from_code("at0001.1", 1).value)
			assert_equal (ss_undefined, specialisation_status_from_code("at0.1", 0).value)
			assert_equal (ss_added, specialisation_status_from_code("at0.1", 1).value)
			assert_equal (ss_undefined, specialisation_status_from_code("at0.1.1", 0).value)
			assert_equal (ss_added, specialisation_status_from_code("at0.1.1", 1).value)
			assert_equal (ss_redefined, specialisation_status_from_code("at0.1.1", 2).value)
			assert_equal (ss_inherited, specialisation_status_from_code("at0.1.1", 4).value)
			assert_equal (ss_added, specialisation_status_from_code("at0009.0.0.1", 0).value)
			assert_equal (ss_inherited, specialisation_status_from_code("at0009.0.0.1", 1).value)
			assert_equal (ss_inherited, specialisation_status_from_code("at0009.0.0.1", 2).value)
			assert_equal (ss_redefined, specialisation_status_from_code("at0009.0.0.1", 3).value)
			assert_equal (ss_inherited, specialisation_status_from_code("at0009.0.0.1", 4).value)
			assert_equal (ss_inherited, specialisation_status_from_code("at0009.0.0.1", 5).value)
		end

end


