note
	component:   "openEHR ADL Tools"
	description: "Test case for adding a term constraint to an archetype definition"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003,2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ARCHETYPE_ADD_C_QUANTITY

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

	title: STRING = "Test Archetype Add C_DV_QUANTITY node"

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
			a_c_qty: C_DV_QUANTITY
		do
			archetype := archetype_compiler.archetype
			cf := archetype_compiler.constraint_model_factory

			an_attr_node := archetype.definition.c_attribute_at_path ("/items[at0003]/items")

			a_c_qty := cf.create_c_dv_quantity (an_attr_node)
			a_c_qty.set_property (create {CODE_PHRASE}.make_from_string("openehr::271"))
			a_c_qty.add_unit_constraint ("F", cf.create_real_interval_make_bounded (0.0, 40.0, True, True), Void)
			a_c_qty.add_unit_constraint ("C", cf.create_real_interval_make_bounded (0.0, 24.0, True, True), Void)

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io.put_string (archetype.errors)
			end
		end

end

