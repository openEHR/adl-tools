note
	component:   "openEHR ADL Tools"

	description: "[
				  Extract variant of VERSIONED_OBJECT<T> class.
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

class X_VERSIONED_OBJECT [G -> LOCATABLE] 

inherit
	EXTRACT_ITEM
		redefine
			uid
		end

feature -- Access

	uid: HIER_OBJECT_ID	
			-- Uid of original VERSIONED_OBJECT.

	owner_id: LOCATABLE_REF	
			-- Owner_id from original VERSIONED_OBJECT, which identifies source EHR.

	time_created: DV_DATE_TIME	
			-- Creation time of original VERSIONED_OBJECT.

	total_version_count: INTEGER	
			-- Total number of versions in original VERSIONED_OBJECT at time of 
			-- creation of this X_VERSIONED_OBJECT.

	extract_version_count: INTEGER	
			-- The number of Versions in this extract for this Versioned object, 
			-- i.e. the count of items in the versions attribute. May be 0 if only 

	revision_history: REVISION_HISTORY	
			-- Optional revision history of the original VERSIONED_OBJECT. 
			-- If included, it is the complete revision history.

	versions: LIST [ORIGINAL_VERSION[G]]	
			-- 0 or more Versions from the original VERSIONED_OBJECT, according to the Extract specification.

invariant
	Uid_valid: uid /= Void
	Owner_id_valid: owner_id /= Void
	Time_created_valid: time_created /= Void
	Total_version_count_valid: total_version_count >= 1
	Extract_version_count_valid: extract_version_count >= 0
	Versions_valid: versions /= Void implies not versions.is_empty	

end

