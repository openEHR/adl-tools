note
	component:   "openEHR ADL Tools"
	description: "Tests for ADL differential ontology class"
	keywords:    "archetype, ontology, terminology"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	testing:     "type/manual"

class
	TEST_DIFFERENTIAL_ARCHETYPE_ONTOLOGY

inherit
	OPENEHR_TEST_SET
		redefine
			on_prepare
		end

	DIFFERENTIAL_ARCHETYPE
		undefine
			default_create
		end

feature {NONE} -- Initialisation

	on_prepare
			-- Satisfy the invariant of `DIFFERENTIAL_ARCHETYPE'.
		do
			make_minimal (create {ARTEFACT_TYPE}, create {ARCHETYPE_ID}, "en")
		end

	create_parented_target
			-- Create `target' with `parent'.
		do
			create target.make_empty ("en", 1)
			create parent.make_empty ("en", 0)
		end

feature {NONE} -- Targets

	target, parent: detachable DIFFERENTIAL_ARCHETYPE_ONTOLOGY

feature -- Test routines

	test_make_from_tree_anonymous
			-- The ontology can be made from an anonymous tree node.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE_ONTOLOGY}.make_from_tree"
		do
			create target.make ("en", default_concept_code)
			assert_equal (default_concept_code, target.concept_code)
		end

	test_make_from_tree_identified
			-- The ontology can be made from an identified tree node.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE_ONTOLOGY}.make_from_tree"
		do
			create target.make ("en", default_concept_code)
			assert_equal (default_concept_code, target.concept_code)
		end

	test_new_non_specialised_term_code
			-- Each new non-specialised term code tail keeps increasing by 1, including double-digit tails.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE_ONTOLOGY}.new_non_specialised_term_code"
		local
			code: STRING
			i: INTEGER
		do
			create_parented_target

			from i := 1 until i = 12 loop
				code := target.new_non_refined_term_code
				assert_equal ("at0." + i.out, code)
				target.merge_term_definition ("en", create {ARCHETYPE_TERM}.make (code))
				i := i + 1
			end
		end

	test_new_specialised_term_code
			-- Each new specialised term code tail keeps increasing by 1, including double-digit tails.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE_ONTOLOGY}.new_specialised_term_code"
		local
			code: STRING
			i: INTEGER
		do
			create_parented_target
			parent.merge_term_definition ("en", create {ARCHETYPE_TERM}.make ("at0001"))

			from i := 1 until i = 12 loop
				code := target.new_refined_term_code ("at0001")
				assert_equal ("at0001." + i.out, code)
				target.merge_term_definition ("en", create {ARCHETYPE_TERM}.make (code))
				i := i + 1
			end
		end

	test_new_non_specialised_constraint_code
			-- Each new non-specialised constraint code tail keeps increasing by 1, including double-digit tails.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE_ONTOLOGY}.new_non_specialised_constraint_code"
		local
			code: STRING
			i: INTEGER
		do
			create_parented_target

			from i := 1 until i = 12 loop
				code := target.new_non_refined_constraint_code
				assert_equal ("ac0." + i.out, code)
				target.merge_constraint_definition ("en", create {ARCHETYPE_TERM}.make (code))
				i := i + 1
			end
		end

	test_new_specialised_constraint_code
			-- Each new specialised constraint code tail keeps increasing by 1, including double-digit tails.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE_ONTOLOGY}.new_specialised_constraint_code"
		local
			code: STRING
			i: INTEGER
		do
			create_parented_target
			parent.merge_constraint_definition ("en", create {ARCHETYPE_TERM}.make ("ac0001"))

			from i := 1 until i = 12 loop
				code := target.new_refined_constraint_code ("ac0001")
				assert_equal ("ac0001." + i.out, code)
				target.merge_constraint_definition ("en", create {ARCHETYPE_TERM}.make (code))
				i := i + 1
			end
		end

end


