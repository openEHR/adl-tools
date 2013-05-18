note
	component:   "openEHR ADL Tools"

	description: "[
	              Record of Instruction State Machine transition and current
				  state due to a workflow step being executed.
				  ]"
	keywords:    "content, clinical, instruction, action, workflow"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ISM_TRANSITION

inherit
	PATHABLE

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Access

	current_state: DV_CODED_TEXT
			-- current state in ISM at completion of this action

	transition: DV_CODED_TEXT
			-- ISM transition that occurred due to this step

	careflow_step: DV_CODED_TEXT
			-- careflow step, as coded term from archetype

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		do
		end

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Current_state_valid: current_state /= Void and then
		terminology(Terminology_id_openehr).has_code_for_group_id(group_id_ism_states, current_state.defining_code)
	Transition_valid: transition /= Void implies
		terminology(Terminology_id_openehr).has_code_for_group_id(group_id_ism_transitions, transition.defining_code)

end


