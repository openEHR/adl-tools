note
	component:   "openEHR ADL Tools"
	
	description: "[
	              An event in an event series.
			  ]"
	keywords:    "content, temporal, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class EVENT [G -> ITEM_STRUCTURE]

inherit
	LOCATABLE

feature -- Access

	data: G
			-- the data of this event

	time: DV_DATE_TIME
			-- time point at the end of this event

	offset: DV_DURATION
			-- offset of this sample from the origin of the history
		do
			Result := time.diff(parent.origin)
		end
		
	state: ITEM_STRUCTURE
			-- data representing the state of the observed entity, which is relevant
			-- to the interpretation of the data

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: HISTORY[G]
			-- parent node of this node in compositional structure

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Data_exists: data /= Void	
	Time_exists: time /= Void	
	Offset_validity: offset /= Void and then offset = time.diff(parent.origin)

end


