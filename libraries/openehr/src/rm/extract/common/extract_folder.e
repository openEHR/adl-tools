note
	component:   "openEHR ADL Tools"

	description: "[
				  Folder in local Folder structure in an Extract. Empty Folders are allowed.
				  ]"
	keywords:    "ehr, extract"

	design:      "openEHR EHR Extract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class EXTRACT_FOLDER

inherit
	LOCATABLE

feature -- Access

	folders: LIST [EXTRACT_FOLDER]
			-- Sub-folders of this folder, including distinct Folder trees, which may be separately archetyped.

	items: LIST [OBJECT_REF]
			-- List of references to EXTRACT_ITEMs in this Extract.

	path_of_item (an_item: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Folders_valid: folders /= Void implies not folders.is_empty
	Items_valid: items /= Void implies not items.is_empty	

end


