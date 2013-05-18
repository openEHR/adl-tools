note
	component:   "openEHR ADL Tools"

	description: "[
				  openEHR EHR Extract content
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

class EHR_EXTRACT_CONTENT

inherit 
	EXTRACT_CONTENT

feature -- Access

	folder_tree: X_VERSIONED_OBJECT [FOLDER]	
			-- Folder tree from source EHR.

	compositions: SET [X_VERSIONED_OBJECT [COMPOSITION]]	
			-- Compositions from source EHR.

	demographics: SET [X_VERSIONED_OBJECT [PARTY]]	
			-- Demographic entities from source EHR.

	other_items: SET [X_VERSIONED_OBJECT [LOCATABLE]]	
			-- Other items from source EHR.

invariant
	Compositions_valid: compositions /= Void implies not compositions.is_empty
	Demographics_valid: demographics /= Void implies not demographics.is_empty
	Other_items_valid: other_items /= Void implies not other_items.is_empty	

end

