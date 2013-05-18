note
	component:   "openEHR ADL Tools"

	description: "General concept of a complex data structure"
	keywords:    "data structure"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class DATA_STRUCTURE

inherit
	LOCATABLE

feature -- Conversion

	as_hierarchy: ITEM
			-- the physical representation as a CEN 13606-compliant structure
		deferred
		end
	
invariant
	As_hierarchy: as_hierarchy /= Void

end


