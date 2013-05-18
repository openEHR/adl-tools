note
	component:   "openEHR ADL Tools"

	description: "[
				  Generic flavour of Extract specification; identifies EHR by subject id.
				  ]"
	keywords:    "ehr, extract, EN13606"

	design:      "openEHR EHR Extract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class GENERIC_EXTRACT_SPEC

inherit 
	EXTRACT_SPEC

feature -- Access

	subject: STRING	
			-- Id of the subject of care to whom the Extract relates.

	subject_type: STRING	
			-- type of subject

invariant
	Identification: subject /= Void	

end

