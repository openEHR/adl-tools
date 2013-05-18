note
	component:   "openEHR ADL Tools"

	description: "[
			 Generic description of a relationship between parties.
			 ]"
	keywords:    "demographic, relationship"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class PARTY_RELATIONSHIP

inherit
	LOCATABLE

feature -- Access

	details: ITEM_STRUCTURE	
			-- The detailed description of the relationship

	time_validity: DV_INTERVAL [DV_DATE]
			-- Valid time interval for this relationship.

	source: OBJECT_REF	
			-- Source of relationship.

	target: OBJECT_REF	
			-- Target of relationship.

	type: DV_TEXT
			-- Type of relationship, such as “employment”, “authority”, “health provision”
		do
		end

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
	Uid_exists: uid /= Void
	Type_validity: type = name
	Source_valid: source /= Void -- and then source.relationships.has(Current)
	Target_valid: target /= Void -- and then not target.reverse_relationships.has(Current)	

end


