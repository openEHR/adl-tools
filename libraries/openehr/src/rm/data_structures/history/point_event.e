note
	component:   "openEHR ADL Tools"
	
	description: "[
	              A point event in an event series.
			  ]"
	keywords:    "content, temporal, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class POINT_EVENT [G -> ITEM_STRUCTURE]

inherit
	EVENT[G]

feature -- Access

end


