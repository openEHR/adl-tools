note
	component:   "openEHR ADL Tools"

	description: "[
				 Original version - the concept of a VERSION created to contain original content, as
				 opposed to an imported version that wraps existing content.
				 Also supports recording the list of input versions to the merge 
				 in addition to standard Version attributes.	
				 ]"
	keywords:    "version"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ORIGINAL_VERSION [G]

inherit
	VERSION [G]

feature -- Access

	uid: OBJECT_VERSION_ID
			-- Stored version of inheritance precursor.

	preceding_version_uid: OBJECT_VERSION_ID	
			-- Stored version of inheritance precursor.
	
	data: G
			-- the data being versioned. If not present, this corresponds to logical deletion.

	attestations: LIST [ATTESTATION]	
			-- Set of attestations relating to this version.

	other_input_version_uids: SET [OBJECT_VERSION_ID]	
			-- Identifiers of the Versions used as input into this merged version, if any. There is 
			-- no guarantee that the identifiers of all Versions contributing to this Version
			-- are included here - this list is merely indicative, but can be used to track 
			-- machine-managed version mreging as well

	lifecycle_state: DV_CODED_TEXT	
			-- Lifecycle state of the content item in this version.
			
feature -- Status Report

	is_merged: BOOLEAN
			-- True if this Version was created from more than just the preceding (checked out) version
		do
			
		end

invariant
	Attestations_valid: attestations /= Void implies not attestations.is_empty
	Other_input_version_uids_valid: other_input_version_uids /= Void xor is_merged	
	Other_input_version_uids_valid: other_input_version_uids /= Void implies not other_input_version_uids.is_empty
	
end


