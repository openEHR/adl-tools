note
	component:   "openEHR ADL Tools"
	description: "Test case for unused codes in ontology"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

class TC_ONTOLOGY_UNUSED_CODES

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

	title: STRING = "Unused codes"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE">>
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
			io.put_string("-------------- unused TERM codes --------------%N")
			io.put_string(print_list (archetype.ontology_unused_term_codes))
			io.put_string("-------------- unused CONSTRAINT codes --------------%N")
			io.put_string(print_list (archetype.ontology_unused_constraint_codes))
		end

end

