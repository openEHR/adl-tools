note
	component:   "openEHR ADL Tools"
	description: "Test case for extracted archetype paths"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ARCHETYPE_SHOW_PATHS

inherit
	TEST_CASE
		export
			{NONE} all
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

	title: STRING = "Test Archetype Show Paths"

feature -- testing

	execute
		local
			a_code: STRING
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
		do
			archetype := archetype_compiler.archetype
			io_message.put_string ("------------------ definition paths -------------------%N")
			io_message.put_string(print_list (archetype.physical_paths))
			io_message.put_string ("------------------ definition paths -------------------%N")
		end

end

