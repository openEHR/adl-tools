note
	component:   "openEHR ADL Tools"
	description: "[
				 Defines an entry in a revision history, which is logically a list of
				 audits of a versioned resource, keyed by revision number.
				 ]"
	keywords:    "version control"
	design:      "openEHR Common Reference Model 2.0"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REVISION_HISTORY_ITEM

create
	make

feature {NONE} -- Initialization

	make (a_version_id: like version_id; an_audits: like audits)
		do
			version_id := a_version_id
			audits := an_audits
		end

feature -- Access

	version_id: OBJECT_VERSION_ID
			-- Version identifier for this revision.

	audits: LIST [AUDIT_DETAILS]
			-- The audits for this revision; there will always be at least one commit audit
			-- (which may itself be an ATTESTATION), there may also be further attestations

invariant
	Audit_valid: not audits.is_empty

end


