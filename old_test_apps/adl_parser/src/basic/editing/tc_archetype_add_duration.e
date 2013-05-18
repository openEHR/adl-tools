note
	component:   "openEHR ADL Tools"
	description: "Test case for adding a duration with assumed value to an archetype definition"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ARCHETYPE_ADD_DURATION

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
			a_duration: C_DURATION
			c_prim: C_PRIMITIVE_OBJECT
		do
			archetype := archetype_compiler.archetype

			-- set root node term to first term added
			cf := archetype_compiler.constraint_model_factory

			-- add duration attribute
			an_attr_node := cf.create_c_attribute_single (archetype.definition, "a_duration")
			a_duration := cf.create_c_duration_make (Void, "P0W", "P55W", True, True)
			a_duration.set_assumed_value (cf.create_iso8601_duration ("P32W4D"))
			c_prim := cf.create_c_primitive_object (an_attr_node, a_duration)

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io.put_string(archetype.errors)
			end
		end

end

