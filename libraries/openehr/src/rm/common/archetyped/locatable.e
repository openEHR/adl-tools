note
	component:   "openEHR ADL Tools"
	description: "[
				 Root class of all information model classes that can be archetyped.
			     ]"
	keywords:    "locator, locatable"

	design:      "openEHR Common Reference Model"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2007 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class LOCATABLE

inherit
	LOCATOR_CONSTANTS
	PATHABLE

feature -- Access
	
	uid: OBJECT_ID
			-- globally unique id for root objects of archetyped structures

	name: DV_TEXT
			-- name of this item in structure; forms an element of runtime path 

	archetype_node_id: STRING
			-- `node_id' from archetype; constitutes the path element from the 
			-- archetype structure, used for re-attaching content to archetypes, 
			-- as well as in querying

	links: SET [LINK]
			-- relationships to other items of any kind

	archetype_details: ARCHETYPED
			-- archetype details if this is an archetype root point

	feeder_audit: FEEDER_AUDIT	
			-- Audit trail from non-openEHR system of original commit of 
			-- information forming the content of the current item.

feature -- Status Report

	is_archetype_root: BOOLEAN
			-- True if root point of an archetyped structure
		do
			Result := archetype_details /= Void
		end

invariant
	Name_exists: name /= Void
	Archetype_node_id_valid: archetype_node_id /= Void and then not archetype_node_id.is_empty
	Archetyped_validity: archetype_details = Void xor is_archetype_root
	Links_valid: links /= Void implies not links.is_empty

end


