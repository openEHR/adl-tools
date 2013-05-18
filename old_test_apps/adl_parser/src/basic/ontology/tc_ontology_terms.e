note
	component:   "openEHR ADL Tools"
	description: "Test case for ADL ontology"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ONTOLOGY_MODIFY

inherit
	TEST_CASE
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

	title: STRING = "Modify ontology terms"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ONTOLOGY_POPULATE">>
		end

feature -- testing

	execute
		local
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
		do
			archetype := archetype_compiler.archetype

			io_message.put_string ("------------------ replace at0001 -------------------%N")
			create a_term.make("at0001")
			a_term.add_item("text", "CHANGED post-natal examination headings")
			a_term.add_item("description", "CHANGED headings for post-natal examination note")
			ontology.replace_term_definition("en", a_term, True)

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end
		end

end

