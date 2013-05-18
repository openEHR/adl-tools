note
	component:   "openEHR ADL Tools"
	description: "Test case for adding an ordinal to an archetype definition"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003,2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ARCHETYPE_ADD_OBJECT_ORDINAL

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

	title: STRING = "Test Archetype Add C_DV_ORDINAL node"

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
			an_ordinal_node: C_DV_ORDINAL
			an_ordinal: ORDINAL
			a_term: ARCHETYPE_TERM
		do
			archetype := archetype_compiler.archetype

			-- set root node term to first term added and make it a SECTION type
			cf := archetype_compiler.constraint_model_factory

			-- set id on root node
			archetype.definition.set_object_id("at0001")

			-- add ordinal node
			an_attr_node := cf.create_c_attribute_single (archetype.definition, "an_ordinal")
			an_ordinal_node := cf.create_c_dv_ordinal(an_attr_node)

			-- add some ordinal items to it
			an_ordinal := cf.create_ordinal (0, "local::at0020")
			an_ordinal_node.add_item(an_ordinal)
			an_ordinal := cf.create_ordinal (1, "local::at0021")
			an_ordinal_node.add_item(an_ordinal)
			an_ordinal := cf.create_ordinal (2, "local::at0022")
			an_ordinal_node.add_item(an_ordinal)

			create a_term.make("at0020")
			a_term.add_item("text", "+")
			ontology.add_term_definition("en", a_term)

			create a_term.make("at0021")
			a_term.add_item("text", "++")
			ontology.add_term_definition("en", a_term)

			create a_term.make("at0022")
			a_term.add_item("text", "+++")
			ontology.add_term_definition("en", a_term)

			-- add another ordinal node with no items
			an_attr_node := cf.create_c_attribute_single (archetype.definition, "an_ordinal_empty")
			an_ordinal_node := cf.create_c_dv_ordinal(an_attr_node)

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io.put_string(archetype.errors)
			end
		end

end

