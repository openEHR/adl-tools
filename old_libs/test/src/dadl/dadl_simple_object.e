note
	component:   "openEHR ADL Tools"
	description: "Test dadl simple object"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DADL_SIMPLE_OBJECT

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Access

	name: STRING

	address: DADL_SIMPLE_ADDRESS

	height: REAL
	
	other_details: HASH_TABLE [STRING, STRING]
	
	generic_nested_data: HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
	
	generic_object_data: ARRAYED_LIST [DADL_SIMPLE_OBJECT_ITEM]

end

