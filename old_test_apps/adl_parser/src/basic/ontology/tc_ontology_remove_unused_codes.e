note
	component:   "openEHR ADL Tools"
	description: "Test case for removing unused codes in ontology"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

class TC_ONTOLOGY_REMOVE_UNUSED_CODES

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

	title: STRING = "Remove unused codes"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute
		local
			archetype: ARCHETYPE
		do
			archetype := archetype_compiler.archetype
			archetype.ontology_remove_unused_codes
			io.put_string("-------------- after REMOVING unused codes --------------%N")

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string(archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end
		end

end

