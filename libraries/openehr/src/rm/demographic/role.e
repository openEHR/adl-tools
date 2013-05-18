note
	component:   "openEHR ADL Tools"

	description: "[
			 Generic description of a role performed by an actor. The role corresponds 
			 to a competency of the party. Roles are used to define the responsibilities 
			 undertaken by a party for a purpose. Roles should have credentials 
			 qualifying the performer to perform the role.
			 ]"
	keywords:    "demographic, role"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ROLE

inherit
	PARTY

feature -- Access

	capabilities: LIST [CAPABILITY]	
			-- The capabilities of this role.

	time_validity: DV_INTERVAL [DV_DATE]	
			-- Valid time interval for this role.

	performer: PARTY_REF	
			-- Actor playing the role.
		
invariant
	Capabilities_valid: capabilities /= Void implies not capabilities.is_empty
	Performer_exists: performer /= Void

end


