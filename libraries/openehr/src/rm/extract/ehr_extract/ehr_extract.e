note
	component:   "openEHR ADL Tools"

	description: "[
				  openEHR Extract from EHR system.
				  ]"
	keywords:    "ehr, extract"

	design:      "openEHR EHR Extract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class EHR_EXTRACT

inherit 
	EXTRACT [EHR_EXTRACT_SPEC, EHR_EXTRACT_CONTENT]

feature -- Access

end

