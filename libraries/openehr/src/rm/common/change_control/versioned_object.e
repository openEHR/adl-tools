note
	component:   "openEHR ADL Tools"

	description: "[
			 An abstraction for a versioned repository of any content, such as a source
			 file, an openEHR Composition, Party or other copmplex object. 
			 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class VERSIONED_OBJECT [G]

inherit
	VERSION_NAMES

feature -- Access

	uid: HIER_OBJECT_ID
			-- Unique identifier of this version repository.

	owner_id: OBJECT_REF
			-- Reference to object to which this versioned repository belongs, 
			-- e.g. the id of the containing EHR.

	time_created: DV_DATE_TIME
			-- Time of initial creation of this versioned object.

	all_version_ids: LIST [OBJECT_VERSION_ID]
			-- Return a list of ids of all versions in this object.
		do
		end

	all_versions: LIST [VERSION[G]]
			-- Return a list of all versions in this object.
		do
		end

	version_count: INTEGER
			-- Return the total number of versions in this object
		do
		end

	first_version: VERSION[G]
			-- extract first version
		do
		end
		
	latest_version: VERSION[G]
			-- extract most recent version
		do
		end

	latest_trunk_version: VERSION[G]
			-- extract most recent version on the trunk
		do
		end

	latest_version_id: STRING
			-- id of most recent version; if no transactions, "none"
		do
		end

	version_with_id (a_ver_id: OBJECT_VERSION_ID): VERSION[G]
			-- extract version known by 'a_ver_id'
		require
			Ver_id_valid: a_ver_id /= Void and then has_version_id(a_ver_id)
		do
		end

	version_at_time (a_dt: DV_DATE_TIME): VERSION [G]
			-- extract version for time 'a_dt'
		require
			Ver_time_valid: a_dt /= Void and then has_version_at_time(a_dt)
		do
		end

	revision_history: REVISION_HISTORY	
			-- History of all audits and attestations in this versioned repository.
			
	trunk_lifecycle_state: DV_CODED_TEXT
			-- Return the lifecycle state from the latest trunk version. Useful for 
			-- determining if the version container is logically deleted.
		do		
		ensure
			Result = latest_trunk_version.lifecycle_state
		end

feature -- Status Report

	has_version_id (a_ver_id: OBJECT_VERSION_ID): BOOLEAN
			-- does this VERSIONED<T> include a version known as 'a_ver_id'? 
		require
			Ver_id_exists: a_ver_id /= Void
		do
		end

	has_version_at_time (a_dt: DV_DATE_TIME):BOOLEAN
			-- does this VERSIONED<T> include a version for time 'a_dt'? 
		require
			Ver_time_valid: a_dt /= Void
		do
		end

	is_original_version (a_ver_id: OBJECT_VERSION_ID): BOOLEAN
			-- True if version with an_id is an ORIGINAL_VERSION
		require
			a_ver_id /= Void and has_version_id(a_ver_id)
		do
			
		end

feature -- Modify

	commit_original_version (a_contribution: OBJECT_REF;
				a_new_version_uid, a_preceding_version_uid: OBJECT_VERSION_ID; 
				an_audit: AUDIT_DETAILS; a_lifecycle_state: DV_CODED_TEXT; 
				a_data: G; signing_key: STRING)
			-- commit a new ORIGINAL_VERSION to a VERSIONED_OBJECT; a_preceding_version_uid is compared
			-- to the current latest version on the same branch, to determine if the new version 
			-- can be committed
		require
			Contribution_valid: a_contribution /= Void
			New_version_valid: a_new_version_uid /= Void
			Preceding_version_uid_valid: all_version_ids.has(a_preceding_version_uid) or else version_count = 0
			audit_valid: an_audit /= Void
			data_valid: a_data /= Void
			lifecycle_state_valid: a_lifecycle_state /= Void
		do
			
		end

	commit_original_merged_version (a_contribution: OBJECT_REF;
				a_new_version_uid, a_preceding_version_uid: OBJECT_VERSION_ID; 
				an_audit: AUDIT_DETAILS; a_lifecycle_state: DV_CODED_TEXT;
				a_data: G; an_other_input_uids: SET[OBJECT_VERSION_ID]; signing_key: STRING)
			-- commit a new merged ORIGINAL_VERSION, i.e. one containing content from more than one
			-- other version. This commit function adds a parameter containing the ids of other versions merged 
			-- into the current one.
		require
			Contribution_valid: a_contribution /= Void
			New_version_valid: a_new_version_uid /= Void
			Preceding_version_id_valid: all_version_ids.has(a_preceding_version_uid) or else version_count = 0
			audit_valid: an_audit /= Void
			data_valid: a_data /= Void
			lifecycle_state_valid: a_lifecycle_state /= Void
			Merge_input_ids_valid: an_other_input_uids /= Void	
		do

		end

	commit_imported_version (a_contribution: OBJECT_REF; an_audit: AUDIT_DETAILS; a_version: ORIGINAL_VERSION[G])
			-- Add a new imported version. Details of version id etc come from the ORIGINAL_VERSION being committed.
		require
			Contribution_valid: a_contribution /= Void
			audit_valid: an_audit /= Void
			Version_valid: a_version /= Void	
		do
		end

	commit_attestation (an_attestation: ATTESTATION; a_ver_id: OBJECT_VERSION_ID; signing_key: STRING)
			-- Add a new attestation to a specified original version. Attestations can only be added to Original versions.
		require
			Attestation_valid: an_attestation /= Void
			Version_id_valid: has_version_id(a_ver_id) and is_original_version(a_ver_id)	
		do
		end

invariant
	uid_valid: uid /= Void
	owner_id_valid: owner_id /= Void 
	time_created_valid: time_created /= Void
	version_count_valid: version_count >= 0
	all_version_ids_valid: all_version_ids /= Void and then all_version_ids.count = version_count
	all_versions_valid: all_versions /= Void and then all_versions.count = version_count
	latest_version_valid: version_count > 0 implies latest_version /= Void
	revision_history_valid: revision_history /= Void	

end


