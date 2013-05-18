note
	component:   "openEHR ADL Tools"

	description: "[
			 Contribution comprising one or more versions. A contribution
			 is like a 'change request', i.e. contains the audit information
			 relating to a change, and the list of things changed.
			 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class CONTRIBUTION

create
	make
	
feature -- Initialisation

	make(an_audit: AUDIT_DETAILS)
		require
			Audit_valid: an_audit.description /= Void
		do
			audit := an_audit
		ensure
			audit_set: audit = an_audit
		end

feature -- Access
	
	uid: HIER_OBJECT_ID	
			-- Unique identifier for this contribution.

	versions: SET [OBJECT_REF]
	
	audit: AUDIT_DETAILS

invariant
	Uid_exists: uid /= Void
	Audit_exists: audit /= Void
	Description_valid: audit.description /= Void
	Versions_valid: versions /= Void and then not versions.is_empty

end


