note
	component:   "openEHR ADL Tools"

	description: "[
	              CLinical statements which are evaluations, including diagnoses and plans.
				  ]"
	keywords:    "content, clinical, evaluation"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EVALUATION

inherit
	CARE_ENTRY

feature -- Access

	data: ITEM_STRUCTURE
			-- The data of this evaluation, in the form of a spatial data structure.

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
	Data_valid: data /= Void

end


