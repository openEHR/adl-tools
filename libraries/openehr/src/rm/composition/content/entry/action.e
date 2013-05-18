note
	component:   "openEHR ADL Tools"

	description: "[
	              Details of part of Instruction which caused an action which
				  to be executed.
				  ]"
	keywords:    "content, clinical, instruction, action, workflow"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ACTION

inherit
	CARE_ENTRY

feature -- Access

	time: DV_DATE_TIME
			-- time at which activity occurred

	description: ITEM_STRUCTURE
			-- description of activity that occured

	ism_transition: ISM_TRANSITION
			-- transition that occurred due to this action

	instruction_details: INSTRUCTION_DETAILS
			-- details of Instruction corresponding to this Action, if
			-- relevant

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
	Time_exists: time /= Void
	Description_exists: description /= Void
	Ism_transition_exists: ism_transition /= Void

end


