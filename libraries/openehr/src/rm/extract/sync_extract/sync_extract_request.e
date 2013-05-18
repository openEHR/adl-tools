note
	component:   "openEHR ADL Tools"

	description: "[
				  Type of request designed for synchronisation of Contributions between openEHR servers.
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

class SYNC_EXTRACT_REQUEST

--inherit
--	MESSAGE_CONTENT

feature -- Access

	specification: SYNC_EXTRACT_SPEC
			-- Details of specification of synchronisation request.

invariant
	Specification_valid: specification /= Void

end

