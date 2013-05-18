note
	component:   "openEHR ADL Tools"
	description: "dotNet wrapper for CADL Tree cursor"
	keywords:    "test, ADL, CADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DOTNET_ADL_INTERFACE

inherit 
	ADL_INTERFACE

create
	make

feature {NONE} -- Implementation
	
	dotnet_cadl_tree_iterator: DOTNET_ARCHETYPE_ITERATOR

end


