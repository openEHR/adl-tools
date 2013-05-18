note
	component:   "openEHR EHR Reference Model"

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
	license:     "See notice at bottom of class"


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


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is instruction.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2005
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
