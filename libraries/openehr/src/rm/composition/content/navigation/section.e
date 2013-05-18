note
	component:   "openEHR ADL Tools"

	description: "[
	             The SECTION class models the headings and navigational 
	             structure used by the clinician to organise the items in 
	             a transaction.
			 ]"
	keywords:    "organiser, navigation"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SECTION

inherit
	CONTENT_ITEM

feature -- Access

	items: LIST[CONTENT_ITEM]
			-- clinical organisational (navigational) structure
			-- and content appearing under this organiser

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: PATHABLE
			-- parent node of this node in compositional structure
		do
		end

feature -- Status Report

	valid_path (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Items_exists: items /= Void implies not items.is_empty

end



