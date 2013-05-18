note
	component:   "openEHR ADL Tools"
	description: "Test case for ADL ontology population"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ONTOLOGY_POPULATE

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

	title: STRING = "Populate ontology with terms"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute
		local
			code_1: STRING
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
		do
			archetype := archetype_compiler.archetype

			io_message.put_string ("------------------ create term -------------------%N")
			code_1 := ontology.new_non_specialised_term_code
			create a_term.make(code_1)
			a_term.add_item("text", "post-natal examination headings")
			a_term.add_item("description", "headings for post-natal examination note")
			ontology.add_term_definition("en", a_term)	-- FIXME - should add_term_def always be for prim lang?

			-- set id on root node
			-- archetype.set_definition_node_id(code_1)

			io_message.put_string ("------------------ create term -------------------%N")
			create a_term.make(ontology.new_non_specialised_term_code)
			a_term.add_item("text", "post-natal examination")
			a_term.add_item("description", "post-natal examination of mother and newborn children")
			ontology.add_term_definition("en", a_term)

			io_message.put_string ("------------------ create constraint code -------------------%N")
			create a_term.make(ontology.new_constraint_code)
			a_term.add_item("text", "xxxxx")
			a_term.add_item("description", "xxxxxx")
			ontology.add_constraint_definition("en", a_term)

			io_message.put_string ("------------------ create 2nd constraint code -------------------%N")
			create a_term.make(ontology.new_constraint_code)
			a_term.add_item("text", "xxxxx")
			a_term.add_item("description", "xxxxxx")
			ontology.add_constraint_definition("en", a_term)

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end
		end

end

