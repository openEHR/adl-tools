note
	component:   "openEHR ADL Tools"

	description: "[
			 Capability of a role, such as “ehr modifier”, “health care provider”. 
			 Capability should be backed up by credentials.
			 ]"
	keywords:    "demographic, capability"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class CAPABILITY

inherit
	LOCATABLE

feature -- Access

	credentials: ITEM_STRUCTURE	
			-- The qualifications of the performer of the role for this capability. 
			-- This might include professional qualifications and official 
			-- identifications such as provider numbers etc.

	time_validity: DV_INTERVAL [DV_DATE]	
			-- Valid time interval for this role.

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: PARTY
			-- parent node of this node in compositional structure
				
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Credentials_exists: credentials /= Void
	Time_validity_exists: time_validity /= Void	

end



