note
	component:   "openEHR ADL Tools"

	description: "[
				  Type of extract designed for synchronisation of Contributions between openEHR servers.
				  ]"
	keywords:    "synchronisation, ehr, extract"

	design:      "openEHR EHR Extract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class SYNC_EXTRACT

inherit 
	LOCATABLE

feature -- Access

	specification: SYNC_EXTRACT_SPEC	
			-- Details of specification of synchronisation request.

	content: SET [X_CONTRIBUTION]	
			-- Content, in the form of a serialised Contributions.

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
	Specification_valid: specification /= Void	

end

