note
	component:   "openEHR ADL Tools"
	description: "Test case for archetype creation"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ARCHETYPE_CREATE

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

	title: STRING = "Test Archetype Create"

feature -- testing

	execute
		local
			a_code: STRING
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
		do
			archetype_compiler.create_new_archetype ("openehr", "ehr", "SECTION", "en")
			archetype := archetype_compiler.archetype

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string(archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end
		end

end

