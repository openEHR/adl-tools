note
	component:   "openEHR ADL Tools"

	description: "[
			 Description of a means of contact of a party. Actual structure is archetyped.
			 ]"
	keywords:    "demographic, contact"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class CONTACT

inherit
	LOCATABLE

feature -- Access

	time_validity: DV_INTERVAL [DV_DATE]	
			-- Valid time interval for this contact descriptor.

	addresses: LIST[ADDRESS]	
			-- A set of address alternatives for this purpose and time validity.

	purpose: DV_TEXT
			-- Purpose for which this contact is used, e.g. “mail”, “daytime phone”, etc. 
			-- Taken from value of inherited name attribute.
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
	Purpose_valid: purpose = name
	Time_validity_exists: time_validity /= Void
	Addresses_exists: addresses /= Void and then not addresses.is_empty	

end



