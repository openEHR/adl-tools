note
	component:   "openEHR ADL Tools"
	description: "Test case for setting description on an archetype"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

class TC_ARCHETYPE_SET_DESCRIPTION

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

	title: STRING = "Test Archetype set Description"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE", "TC_ONTOLOGY_POPULATE">>
		end

feature -- testing

	execute
		local
			archetype: ARCHETYPE
			desc: RESOURCE_DESCRIPTION
			a_desc_item: RESOURCE_DESCRIPTION_ITEM
		do
			archetype := archetype_compiler.archetype
			create desc.make ("Archy Type", "en")
			desc.set_resource_package_uri ("http://archetypes.are.us/package_home")
			desc.add_other_contributor ("Archy's 1st friend")
			desc.add_other_contributor ("Archy's 2nd friend")
			desc.add_original_author_item ("email", "archy@home.com")
			desc.set_lifecycle_state ("review")

			-- Add an english language descriptor
			create a_desc_item.make (create {CODE_PHRASE}.make(default_language_code_set, "en"), "This archetype purpose")
			a_desc_item.add_keyword ("keyword1")
			a_desc_item.add_keyword ("keyword2")
			a_desc_item.add_keyword ("keyword3")
			a_desc_item.add_original_resource_uri ("medline", "http://www.nlm.nih.gov/medlineplus/druginformation.html")
			a_desc_item.add_other_detail ("some other key", "some other detail")
			a_desc_item.set_copyright ("copyright to me 2003")
			a_desc_item.set_use ("This is the main use of the archetype")
			a_desc_item.set_misuse ("This is how the archetype should not be used")

			desc.add_detail (a_desc_item)

			archetype.set_description(desc)


			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io.put_string (archetype.errors)
			end
		end

end

