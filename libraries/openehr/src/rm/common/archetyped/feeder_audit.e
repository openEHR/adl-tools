note
	component:   "openEHR ADL Tools"
	description: "[
			     Interface to objects which are locatable - i.e. implement 
	             locator_id, and which can locate a sub-object from a path.
			     ]"
	keywords:    "locator, locatable"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class FEEDER_AUDIT

feature -- Initialisation
	
	make(a_system_id:STRING)
		require
			a_system_id_exists: a_system_id /= Void and then not a_system_id.is_empty
		do
		end

feature -- Access

	originating_system_ids: LIST[DV_IDENTIFIER]
			-- Identity of the system where the item was originally committed.

	feeder_system_ids: LIST[DV_IDENTIFIER]
			-- Identity of the system where the item was originally committed.
			
	originating_system_audit: FEEDER_AUDIT_DETAILS	
			-- audit details of information in originating system

	feeder_system_audit: FEEDER_AUDIT_DETAILS	
			-- audit details of information in originating system

invariant
	Originating_system_audit_valid: originating_system_audit /= Void

end


