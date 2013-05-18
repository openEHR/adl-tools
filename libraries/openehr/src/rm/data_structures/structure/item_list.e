note
	component:   "openEHR ADL Tools"

	description: "[
	              A data structure in the form of a linear list.
				items:
					item_1: ELEMENT
					item_2: ELEMENT
					...	
					item_N: ELEMENT
		 
	              Valid paths are of the form:
	             	whole list: |<root-name>
	             
	             	nth list item: |<root-name>|item=<n>
	             	named list item: |<root-name>|<value name>
	             	
	             	nth list item: item=<n>
	             	named list item: <value name>
			  ]"
	keywords:    "content, spatial, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ITEM_LIST

inherit
	ITEM_STRUCTURE
	
	CLUSTER
		redefine
			items, path_of_item, item_at_path, path_exists
		end

feature -- Access

	items: LIST [ELEMENT]
			-- Retrieve all items

	item_count: INTEGER
			-- Count of all items
		do
		end

	names: LIST [DV_TEXT]
			-- Retrieve the names of all items
		do
		end

	named_item(a_name:STRING): ELEMENT
			-- Retrieve the item with name ‘a_name’
		do
		end

	ith_item(i:INTEGER): ELEMENT
			-- Retrieve the i-th item with name
		require
			i >= 1 and i <= item_count
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

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

feature -- Conversion

	as_hierarchy: CLUSTER
			-- the physical representation as a CEN 13606-compliant structure
		do
		end

invariant
	-- Valid_structure: representation.items.forall(agent {ITEM}.type = "ELEMENT")

end


