note
	component:   "openEHR ADL Tools"

	description: "THe root class of the Electronic Health Record"
	keywords:    "ehr, record"

	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EHR_STATUS

inherit
	LOCATABLE

feature -- Access

	subject: PARTY_SELF
			-- The subject of this EHR.

	is_queryable: BOOLEAN
			-- True if querying should be allowed on this EHR

	is_modifiable: BOOLEAN
			-- True if modification should be allowed on this EHR

	other_details: ITEM_STRUCTURE
			-- other archetypable details

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		once
		end
			
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Is_archetype_root: is_archetype_root
	Subject_exists: subject /= Void
	No_parent: parent = Void
	
end


