note
	component:   "openEHR ADL Tools"
	description: "Test case for adding a term constraint to an archetype definition"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003,2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ARCHETYPE_ADD_OBJECT_TERM

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

	title: STRING = "Test Archetype Add CADL_OBJECT_TERM node"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE", "TC_ONTOLOGY_OPOULATE">>
		end

feature -- testing

	execute
		local
			archetype: ARCHETYPE
			cf: C_FACTORY
			an_attr_node: C_ATTRIBUTE
			a_term_node: C_CODE_PHRASE
		do
			archetype := archetype_compiler.archetype

			-- set root node term to first term added and make it a SECTION type
			cf := archetype_compiler.constraint_model_factory

			-- set id on root node
			archetype.definition.set_object_id("at0001")

			-- add ordinal node
			an_attr_node := cf.create_c_attribute_single (archetype.definition, "a_term")
			a_term_node := cf.create_c_code_phrase_from_pattern(an_attr_node, "openehr::253, 271, 272, 273")

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io.put_string (archetype.errors)
			end
		end

end

