note
	component:   "openEHR ADL Tools"

	description: "[
				  Generic Request for Extract from EHR system. Designed for
				  compatibility with CEN EN13606.
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

deferred class GENERIC_EXTRACT_REQUEST

inherit
	EXTRACT_REQUEST [GENERIC_EXTRACT_SPEC]

feature -- Access

end

