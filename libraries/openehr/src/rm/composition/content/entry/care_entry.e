note
	component:   "openEHR ADL Tools"

	description: "[
	              Abstract type corresponding to entries created during the
				  care process, as opposed to administrative entries which are
				  peripheral to the care process.
				  ]"
	keywords:    "content, clinical"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class CARE_ENTRY

inherit
	ENTRY

feature -- Access

	protocol: ITEM_STRUCTURE
			-- method of obtaining information: observation method; method of arriving at
			-- subjective or prescriptive information
			-- Description of why the information in this entry was arrived at. 
			-- This may take the form of references to guidelines, including manually 
			-- followed and executable; knowledge references such as a paper in 
			-- Medline; clinical reasons within a largercare process.

	guideline_id: OBJECT_REF	
			-- Identifier of guideline creating this action if relevant

end


