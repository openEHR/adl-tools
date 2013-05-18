note
	component:   "openEHR ADL Tools"

	description: "[
				  Generic EHR Extract content, capable of carrying any data. Designed to be CEN EN13606 compatible.
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

class GENERIC_EXTRACT_CONTENT

inherit 
	EXTRACT_CONTENT

feature -- Access

	items: LIST [GENERIC_EXTRACT_ITEM]
			-- Items.

invariant
	Items_valid: items /= Void and not items.is_empty	

end

