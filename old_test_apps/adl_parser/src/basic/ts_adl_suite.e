note
	component:   "openEHR ADL Tools"
	description: "Test suite for ADL archetype test cases"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_ADL_SUITE

inherit
	TEST_SUITE
	
create
	make
	
feature -- Access

	test_cases: LINKED_LIST[TEST_CASE]
			-- the list of tests available
		once
			create Result.make
			Result.extend(create {TC_ARCHETYPE_CREATE}.make(Void))
			Result.extend(create {TC_ARCHETYPE_SHOW_PATHS}.make(Void))

			Result.extend(create {TC_ONTOLOGY_POPULATE}.make(Void))
			Result.extend(create {TC_ONTOLOGY_MODIFY}.make(Void))
			Result.extend(create {TC_ONTOLOGY_LANGUAGES}.make(Void))
			Result.extend(create {TC_ONTOLOGY_ADD_TERM_BINDING}.make(Void))
			Result.extend(create {TC_ONTOLOGY_REMOVE_TERM_BINDING}.make(Void))
			Result.extend(create {TC_ONTOLOGY_ADD_CONSTRAINT_BINDING}.make(Void))
			Result.extend(create {TC_ONTOLOGY_REMOVE_CONSTRAINT_BINDING}.make(Void))
			-- Result.extend(create {TC_ONTOLOGY_SHOW_PATHS}.make(Void))

			Result.extend(create {TC_ARCHETYPE_ADD_NODES}.make(Void))
			Result.extend(create {TC_ONTOLOGY_UNUSED_CODES}.make(Void))
			Result.extend(create {TC_ONTOLOGY_REMOVE_UNUSED_CODES}.make(Void))
			Result.extend(create {TC_ARCHETYPE_ADD_DURATION}.make(Void))
			Result.extend(create {TC_ARCHETYPE_ADD_C_QUANTITY}.make(Void))
			Result.extend(create {TC_ARCHETYPE_ADD_OBJECT_ORDINAL}.make(Void))
			Result.extend(create {TC_ARCHETYPE_ADD_OBJECT_TERM}.make(Void))
			Result.extend(create {TC_ARCHETYPE_ADD_INVARIANTS}.make(Void))

			Result.extend(create {TC_ARCHETYPE_SPECIALISE}.make(Void))
			Result.extend(create {TC_ARCHETYPE_SET_DESCRIPTION}.make(Void))

			Result.extend(create {TC_CVT_C_QUANTITY}.make(Void))
		end

	title: STRING = "ADL test cases"

feature -- Initialisation

	make(arg: ANY)
		do
		end

end

