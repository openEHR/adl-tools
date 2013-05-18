note
	component:   "openEHR ADL Tools"

	description: "[
			 Abstract model of one Version within a Version container, containing data, commit audit trail, 
			 and the identifier of its Contribution..
			 ]"
	keywords:    "version"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class VERSION [G]

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Access

	uid: OBJECT_VERSION_ID
			-- Unique identifier of this version, containing owner_id, version_tree_id and 
			-- creating_system_id.
		deferred
		end

	preceding_version_uid: OBJECT_VERSION_ID
			-- Unique identifier of the version of which this version is a modification; 
			-- Void if this is the first version.
		deferred
		end
	
	commit_audit: AUDIT_DETAILS
			-- Audit trail corresponding to the committal of this version to the 
			-- VERSIONED_OBJECT where it was first created..

	contribution: OBJECT_REF
			-- Contribution in which this version was added.

	owner_id: HIER_OBJECT_ID
			-- Unique identifier of the owning VERSIONED_OBJECT.
		do
		end
		
	data: G
			-- content of this Version
		deferred
		end

	lifecycle_state: DV_CODED_TEXT	
			-- Lifecycle state of this version; coded by openEHR vocabulary “version lifecycle state”
		deferred
		end

	signature: STRING
			-- OpenPGP digital signature or digest of content committed in this Version.

feature -- Status Report

	is_branch: BOOLEAN
			-- True if this Version represents a branch; derived from uid attribute
		do
		end

feature -- Conversion
	
	canonical_form: STRING	
			-- Canonical form of Version object, created by serialising all attributes except signature.
		do
			
		end

invariant
	Uid_valid: uid /= Void
	Owner_id_valid: owner_id /= Void and then owner_id.value.is_equal(uid.object_id.value)
	Commit_audit_valid: commit_audit /= Void
	Contribution_valid: contribution /= Void and contribution.type.is_equal("CONTRIBUTION")
	Preceding_version_uid_validity: uid.version_tree_id.is_first xor preceding_version_uid /= Void
	Lifecycle_state_valid: lifecycle_state /= Void and then 
		terminology(terminology_id_openehr).has_code_for_group_id(group_id_version_lifecycle_state, lifecycle_state.defining_code)
	
end


