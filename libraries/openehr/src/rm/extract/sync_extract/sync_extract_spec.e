note
	component:   "openEHR ADL Tools"

	description: "[
				  Type of request designed for synchronisation of Contributions between openEHR servers.
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

class SYNC_EXTRACT_SPEC

feature -- Access

	includes_versions: BOOLEAN	
			-- True if the Versions from the Contribution are included; 
			-- False if just the Contribution and its Audit are included.

	contribution_list: LIST [HIER_OBJECT_ID]	
			-- List of Contributions to include / that are included in the Extract.

	contributions_since: DV_DATE_TIME	
			-- Specify Contributions included in Extract by threshold date.

	all_contributions: BOOLEAN	
			-- True if all Contributions in the record are included.

end

