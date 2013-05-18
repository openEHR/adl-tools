note
	component:   "openEHR ADL Tools"

	description: "[
			 An identity “owned” by a PARTY, such as a person name or company name, 
			 and which is used by the party to identify itself. Actual structure is archetyped.
			 ]"
	keywords:    "demographic, identity"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class PARTY_IDENTITY

inherit
	LOCATABLE

feature -- Access

	details: ITEM_STRUCTURE	
			-- The value of the indentity. This will often taken the form of a parsable string or a small structure of strings.

	purpose: DV_TEXT
			-- Purpose of identity, e.g. “legal”, “stagename”, “nickname”, “tribal name”, 
			-- “trading name”. Taken from value of inherited name attribute.
		do
			
		end

	as_string: STRING	
			-- Identity in the form of a single string.

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
	Purpose_valid: purpose = name
	Details_exists: details /= Void	

end



