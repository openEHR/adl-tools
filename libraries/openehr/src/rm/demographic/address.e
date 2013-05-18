note
	component:   "openEHR ADL Tools"

	description: "[
			 Address of contact, which may be electronic or geographic.
			 ]"
	keywords:    "demographic, address"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ADDRESS

inherit
	LOCATABLE

feature -- Access

	details: ITEM_STRUCTURE	
			-- The details of the address, in the form of a STRUCTURE. 
			-- This may take the form of a SINGLE_S, whose data item is a 
			-- parsable string or a list or tree of many parts.

	type: DV_TEXT
			-- Type of address, e.g. “electronic”, “locality”. Taken from value of inherited name attribute.
		do
			Result := name.twin
		end

	as_string: STRING	
			-- Address in the form of a single string.

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: CONTACT
			-- parent node of this node in compositional structure
			
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Type_valid: type.is_equal(name)
	Details_exists: details /= Void	

end


