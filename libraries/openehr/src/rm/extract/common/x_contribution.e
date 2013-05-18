note
	component:   "openEHR ADL Tools"

	description: "[
				  Extract variant of CONTRIBUTION class.
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

class X_CONTRIBUTION

feature -- Access

	uid: HIER_OBJECT_ID	
			-- Uid of Contribution in source system.

	audit: AUDIT_DETAILS	
			-- Audit of Contribution in source system.

	versions: LIST[VERSION[LOCATABLE]]	
			-- Serialised Versions from Contribution in source system.

invariant
	Uid_valid: uid /= Void
	Audit_valid: audit /= Void
	Versions_valid: versions /= Void and then not versions.is_empty

end

