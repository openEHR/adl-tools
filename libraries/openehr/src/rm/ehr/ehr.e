note
	component:   "openEHR ADL Tools"

	description: "THe root class of the Electronic Health Record"
	keywords:    "ehr, record"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EHR 

feature -- Access

	system_id: STRING
			-- originating EHR node. Sources are globally uniquely identified, and node identifiers
			-- are assumed to be valid forever. This means that ids of nodes which are amalgamated into
			-- other nodes are still valid at the new node. Source ids are managed online, and it
			-- is via online interrogation of the global ehr_node domain repository that the HCF identification
			-- of a node can be discovered.

	ehr_id: HIER_OBJECT_ID
			-- The identifier of this EHR - this is an immutable Id and is not
			-- related to the id of the patient

	time_created: DV_DATE_TIME	
			-- Time of creation of the EHR

	contributions: LIST [OBJECT_REF]
			-- List of contributions causing changes to this EHR. Each 
			-- contribution contains a list of versions, which may include 
			-- paths pointing to any number of VERSIONABLE items, i.e. items 
			-- of type TRANSACTION and FOLDER_TREE.

	ehr_status: OBJECT_REF
			-- Optional directory structure for this EHR.

	directory: OBJECT_REF
			-- Optional directory structure for this EHR.

	compositions: LINKED_LIST [OBJECT_REF]	
			-- Master list of all transaction references in this EHR

feature -- Status Setting

	set_historical_state (dt: DV_DATE_TIME)
			-- 
		do
			
		end
		
invariant
	System_id_exists: system_id /= Void
	Ehr_id_exists: ehr_id /= Void
	Time_created_exists: time_created /= Void
	Ehr_status_valid: ehr_status /= Void and then ehr_status.type.is_equal("VERSIONED_EHR_STATUS")
	Contributions_valid: contributions /= Void -- and then contributions.for_all(type.is_equal("CONTRIBUTION"))
	Compositions_valid: compositions /= Void -- and then compositions.for_all(type.is_equal("VERSIONED_COMPOSITION"))
	Directory_valid: directory /= Void implies directory.type.is_equal("VERSIONED_FOLDER")

end


