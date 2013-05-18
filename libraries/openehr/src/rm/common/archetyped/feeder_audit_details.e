note
	component:   "openEHR ADL Tools"
	description: "[
			     Audit details from any system in feeder audit chain
			     ]"
	keywords:    "locator, locatable"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class FEEDER_AUDIT_DETAILS

feature -- Initialisation
	
	make(a_system_id:STRING)
		require
			a_system_id_exists: a_system_id /= Void and then not a_system_id.is_empty
		do
		end

feature -- Access

	system_id: STRING	
			-- Identifier of the system which handled the information item.

	provider: PARTY_IDENTIFIED	
			-- Optional provider(s) who created, committed, forwarded or otherwise 
			-- handled the item.

	location: PARTY_IDENTIFIED	
			-- Identifier of the particular site/facility within an organisation which 
			-- handled the item. For computability, this identifier needs to be e.g. a 
			-- PKI identifier which can be included in the identifier list of the 
			-- PARTY_IDENTIFIED object.

	time: DV_DATE_TIME	
			-- Time of handling the item.

	subject: PARTY_PROXY	
			-- Identifiers for subject of the received information item.

	version_id: STRING	
			-- Any identifier used in the system such as "interim", "final", or 
			-- numeric versions if available.

invariant
	System_id_valid: system_id /= Void implies not system_id.is_empty	

end


