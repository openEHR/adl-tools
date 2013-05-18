note
	component:   "openEHR ADL Tools"
	description: "Test case for ADL ontology"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ONTOLOGY_LANGUAGES

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

	title: STRING = "Add languages to ontology"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ONTOLOGY_POPULATE">>
		end

feature -- testing

	execute
		local
			archetype: ARCHETYPE
		do
			archetype := archetype_compiler.archetype

			io_message.put_string ("------------------ ADD fr -------------------%N")
			ontology.add_language("fr")

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end

			io_message.put_string ("------------------ ADD tr -------------------%N")
			ontology.add_language("tr")

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end

	--		io_message.put_string ("-------------- ADD tr again (expect ERROR) ---------------%N")
	--		ontology.add_language_available("tr")
	--		if archetype.is_valid then
	--			archetype_compiler.serialise_arachetype (serialise_format)
	--			io_message.put_string (archetype_compiler.serialised_archetype)
	--		else
	--			io_message.put_string (archetype.errors)
	--		end
		end

end

