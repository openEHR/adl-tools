note
	component:   "openEHR ADL Tools"

	description: "[
	              Observational clinical statements, i.e. information about 
				  events or processes in the real world, in the form of data situated 
				  in time. Represented by temporal data structures in which each value 
				  structure has a timepoint.
				  ]"
	keywords:    "content, clinical, observation"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class OBSERVATION

inherit
	CARE_ENTRY

feature -- Access

	data: HISTORY [ITEM_STRUCTURE]
			-- The data of this observation, in the form of a history of values which may be of any complexity.

	state: HISTORY [ITEM_STRUCTURE]
			-- The state of the subject of this observation, 
			-- in the form of a history of values which may be of any complexity.

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
		
invariant
	Data_exists: data /= Void

end


