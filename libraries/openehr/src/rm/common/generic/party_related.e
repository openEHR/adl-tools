note
	component:   "openEHR ADL Tools"
	
	description: "[
			 	 Model of party proxy which adds in relationship of the party
				 to the subject of the record.
				 ]"
	keywords:    "attestation"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class PARTY_RELATED

inherit
	PARTY_IDENTIFIED

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Initialization

feature -- Access

	relationship: DV_CODED_TEXT	
			-- Relationship of subject of this ENTRY to the subject of the record. 
			-- May be coded. If it is the patient, coded as "self".

invariant
	Relationship_valid: relationship /= Void and then 
		terminology(Terminology_id_openehr).has_code_for_group_id(Group_id_related_party_relationship, relationship.defining_code)
		
end


