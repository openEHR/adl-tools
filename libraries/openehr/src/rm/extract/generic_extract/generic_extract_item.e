note
	component:   "openEHR ADL Tools"

	description: "[
				  Single item in generic extract.
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

class GENERIC_EXTRACT_ITEM

inherit
	EXTRACT_ITEM

feature -- Access

	item: LOCATABLE
			-- Content item.

	item_type: STRING	
			-- Type of item.

	version_id: STRING	
			-- Version id of this item in original system.

	version_set_id: STRING	
			-- Version set id of this item in original system, where applicable.

	other_details: HASH_TABLE [STRING, STRING]	
			-- Other details about the content item.

invariant
	Item_valid: item /= Void
	Item_type_valid: item_type /= Void and then not item_type.is_empty
	Version_id_valid: version_id /= Void implies not version_id.is_empty
	Version_set_id_valid: version_set_id /= Void implies not version_set_id.is_empty
	Other_details_valid: other_details /= Void implies not other_details.is_empty	

end

