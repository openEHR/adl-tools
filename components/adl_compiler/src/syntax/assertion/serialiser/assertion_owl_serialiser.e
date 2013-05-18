note
	component:   "openEHR ADL Tools"
	description: "[
			 Serialise archetype assertions to OWL abstract syntax
	             ]"
	keywords:    "serialiser, OWL, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ASSERTION_OWL_SERIALISER 

inherit
	ASSERTION_SERIALISER
	
	OWL_DEFINITIONS
	
create
	make

feature -- Modification

	start_assertion(a_node: ARRAYED_LIST[ASSERTION]; depth: INTEGER)
			-- start serialising an ASSERTION
		do
		end
		
	end_assertion(a_node: ARRAYED_LIST[ASSERTION]; depth: INTEGER)
			-- end serialising an ASSERTION
		do	
		end

end


