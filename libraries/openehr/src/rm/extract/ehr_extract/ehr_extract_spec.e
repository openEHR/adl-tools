note
	component:   "openEHR ADL Tools"

	description: "[
				  EHR flavour of Extract specification; identifies EHR by either EHR id or subject.
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

class EHR_EXTRACT_SPEC

inherit 
	EXTRACT_SPEC

feature -- Access

	ehr_id: HIER_OBJECT_ID	
			-- Id of the EHR from which the Extract will be or was created.

	subject: PARTY_IDENTIFIED
			-- Id of the subject of care to whom the Extract relates.

invariant
	Identification: ehr_id /= Void xor subject /= Void	

end

