note
	component:   "openEHR ADL Tools"
	description: "Tests for ADL differential terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Peter Gummer <petre.gummer@OceanInformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TEST_DIFFERENTIAL_ARCHETYPE

inherit
	OPENEHR_TEST_SET

	ARCHETYPE_TERM_CODE_TOOLS
		undefine
			default_create
		end

feature {NONE} -- Targets

	target: detachable DIFFERENTIAL_ARCHETYPE

feature -- Test routines

	test_make_minimal
			-- A newly-created minimal archetype should be valid.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE}.make_minimal"
		local
			id: ARCHETYPE_ID
			term: ARCHETYPE_TERM
		do
			create id.make_from_string ("openEHR-EHR-CLUSTER.test.v1")
			create target.make_minimal (create {ARTEFACT_TYPE}, id, "en")
			assert_equal (default_concept_code, target.ontology.concept_code)

			term := target.ontology.term_definition ("en", default_concept_code)
			assert ("text", term.keys.has ("text"))
			assert ("description", term.keys.has ("description"))
		end

end


