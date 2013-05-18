note
	component:   "openEHR ADL Tools"

	description: "[
			 Ancestor of all real-world types, including people and organisations. 
			 An actor is any real-world entity capable of taking on a role.
			 ]"
	keywords:    "demographic, actor"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class ACTOR

inherit
	PARTY

feature -- Access

	roles: SET[PARTY_REF]
			-- Roles played by this party.

	languages: SET[DV_TEXT]	
			-- Languages which can be used to communicate with this actor.
			
	has_legal_identity: BOOLEAN	
			-- True if one there is an identity with purpose “legal identity”

invariant
	Roles_valid: roles /= Void implies not roles.is_empty
	Legal_identity_exists: has_legal_identity	
	Languages_valid: languages /= Void implies not languages.is_empty

end


