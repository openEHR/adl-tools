note
	component:   "openEHR ADL Tools"

	description: "[
				  Specification of what versions should be included in an Extract. By default, only 
				  latest versions are included in the Extract, in which case this part of the Extract 
				  specification is not needed at all. The attributes includes_all_versions and 
				  commit_time_interval are used to modify this; the former forces all versions to be 
				  included; the latter limits the versions to be those latest versions committed in the 
				  time interval, or if includes_all_versions is True, all versions committed in the 
				  time interval.	
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

class EXTRACT_VERSION_SPEC

feature -- Access

	includes_all_versions: BOOLEAN	
			-- True if all versions of each item in the Extract are included.

	commit_time_interval: DV_INTERVAL [DV_DATE_TIME]	
			-- Specifies commit time interval of items to source repository to include in Extract. 
			-- By default, only latest versions whose commit times fall in the range are included. 
			-- If includes_all_versions is True, then the range includes all versions committed 
			-- within the interval.

	includes_revision_history: BOOLEAN	
			-- True if revision histories of the items in the Extract are included. If included, 
			-- it is always the full revision history.

	includes_data: BOOLEAN	
			-- True if the data of items matched by the content spec should be included. This is the default.
			-- If False, only revision history is included in serialised versions. 
			-- Turning this option on in openEHR systems causes X_VERSIONED_OBJECTs to have revision_history set, 
			-- but versions Void. Useful for interrogating a server without having to look at any content data. 
			-- In other systems it may or may not have a sensible meaing.

invariant
	Includes_revision_history_valid: not includes_data implies includes_revision_history

end


