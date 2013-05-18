note
	component:   "openEHR ADL Tools"

	description: "[
	              A data structure containing only one element, as used for simple 
			  measurements like height, weight etc.
			  ]"
	keywords:    "content, spatial, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ITEM_SINGLE

inherit
	ITEM_STRUCTURE
	
	ELEMENT

feature -- Conversion

	as_hierarchy: ELEMENT
			-- the physical representation as a CEN 13606-compliant structure
		do
			create Result
			
		end

end


