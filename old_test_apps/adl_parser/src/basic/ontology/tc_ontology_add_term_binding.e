note
	component:   "openEHR ADL Tools"
	description: "Test case for archetype creation"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

class TC_ONTOLOGY_ADD_TERM_BINDING

inherit
	TEST_CASE
		export
			{NONE} all
		redefine
			prereqs
		end

	SHARED_TEST_ENV
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title: STRING = "Add Term Binding"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TS_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute
		local
			a_code: STRING
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
			a_binding: CODE_PHRASE
		do
			archetype := archetype_compiler.archetype

			-- ontology.add_term_binding
			create a_binding.make_from_string ("ICD10AM::F40.1")
			ontology.add_term_binding (a_binding, "at0001")
			create a_binding.make_from_string ("LO25::3456-7")
			ontology.add_term_binding (a_binding, "at0001")
			create a_binding.make_from_string ("LO25::3456-7")
	--		ontology.add_term_binding (a_binding, "[at0000]/history[at10002]/events/event[3456]")

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string(archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end
		end

end

