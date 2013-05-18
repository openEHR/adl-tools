note
	component:   "openEHR ADL Tools"
	description: "Test dadl simple address"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DADL_SIMPLE_ADDRESS

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Access

	number: INTEGER

	street: STRING

	city: STRING
	
	other_details: ARRAYED_LIST [STRING]

	address_part: DADL_SIMPLE_ADDRESS_PART
	
end

