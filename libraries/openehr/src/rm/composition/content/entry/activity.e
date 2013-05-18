note
	component:   "openEHR ADL Tools"

	description: "[
				 Definition of an activity node in a workflow. The description of the 
				 activiy is in the form of an archetypable ITEM_STRUCTURE. Its timing
				 is expressed in the form of a time specification.
				 Informational inputs and outputs can also be specified.
				 ]"
	keywords:    "workflow, instruction, entry"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ACTIVITY

inherit
	LOCATABLE

feature -- Access

	description: ITEM_STRUCTURE
			-- Description of the activity to be performed, in the form of an archetyped structure.

	timing: DV_PARSABLE
			-- Timing information for the activity, in a parsable form such as HL7 GTS.

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: INSTRUCTION
			-- parent node of this node in compositional structure

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Description_exists: description /= Void
	Timing_exists: timing /= Void

end


