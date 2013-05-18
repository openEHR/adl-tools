note
	component:   "openEHR ADL Tools"
	description: "[
			 A versioned controlled repository for COMPOSITIONs.  Information 
			 exists in versions corresponding  to  the  different  times at which  
			 each  piece of information  was  created. 
			 ]"
	keywords:    "transaction, version"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class VERSIONED_COMPOSITION

inherit
	VERSIONED_OBJECT [COMPOSITION]

feature -- Status Report

	is_persistent: BOOLEAN
			-- derived persistent status from type of COMPOSITION
		do
			Result := first_version.data.is_persistent
		end
		
invariant
	Owner_id_valid: owner_id.type.is_equal("EHR")
	-- Archetype_node_id_valid: all_versions.for_all ((c:COMPOSITION) c.archetype_node_id.is_equal(all_versions.first.archetype_node_id))
	-- Persistent_valid: all_versions.for_all ((c:COMPOSITION) c.is_persistent = all_versions.first.data.is_persistent)
	
end


