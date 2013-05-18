note
	component:   "openEHR ADL Tools"

	description: "[
	              A model of future actions, characterised by time specifications (rather than actual
	              times of occurrence, as found in observations). As time progresses, the lifecycle
	              of an instruction progresses through various states, according to a state machine
	              definition 
			  	- an instruction represents an intent that some acts relating to the subject of care 
			  	  should occur such as taking a medication, having therapy or surgery
				- instructions may result in orders being placed to a filler; an order explicitly
				  requests the resources needed for the instruction to be obtained and made available 
				  for the patient. For example, a prescription is a simple order created from 
				  medication order instructions
				- orders are also modelled using instructions
				 Concrete type representing 'scientific' quantities, i.e. quantities expressed 
				 as a single value and a single, optional units.
			 ]"
	keywords:    "content, clinical, observation"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class INSTRUCTION

inherit
	CARE_ENTRY

feature -- Access

	narrative: DV_TEXT
			-- narrative description of the action to be executed.

	activities: LIST[ACTIVITY]
			-- list of all activities in this Instruction

	wf_definition: DV_PARSABLE
			-- syntax form of workflow definition

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
	Narrative_exists: narrative /= Void
	Activities_valid: activities /= Void implies not activities.is_empty
	
end


