note
	component:   "openEHR EHR Reference Model"

	description: "THe root class of the Electronic Health Record"
	keywords:    "ehr, record"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EHR 

feature -- Access

	system_id: STRING
			-- originating EHR node. Sources are globally uniquely identified, and node identifiers
			-- are assumed to be valid forever. This means that ids of nodes which are amalgamated into
			-- other nodes are still valid at the new node. Source ids are managed online, and it
			-- is via online interrogation of the global ehr_node domain repository that the HCF identification
			-- of a node can be discovered.

	ehr_id: HIER_OBJECT_ID
			-- The identifier of this EHR - this is an immutable Id and is not
			-- related to the id of the patient

	time_created: DV_DATE_TIME	
			-- Time of creation of the EHR

	contributions: LIST [OBJECT_REF]
			-- List of contributions causing changes to this EHR. Each 
			-- contribution contains a list of versions, which may include 
			-- paths pointing to any number of VERSIONABLE items, i.e. items 
			-- of type TRANSACTION and FOLDER_TREE.

	ehr_status: OBJECT_REF
			-- Optional directory structure for this EHR.

	directory: OBJECT_REF
			-- Optional directory structure for this EHR.

	compositions: LINKED_LIST [OBJECT_REF]	
			-- Master list of all transaction references in this EHR

feature -- Status Setting

	set_historical_state (dt: DV_DATE_TIME)
			-- 
		do
			
		end
		
invariant
	System_id_exists: system_id /= Void
	Ehr_id_exists: ehr_id /= Void
	Time_created_exists: time_created /= Void
	Ehr_status_valid: ehr_status /= Void and then ehr_status.type.is_equal("VERSIONED_EHR_STATUS")
	Contributions_valid: contributions /= Void -- and then contributions.for_all(type.is_equal("CONTRIBUTION"))
	Compositions_valid: compositions /= Void -- and then compositions.for_all(type.is_equal("VERSIONED_COMPOSITION"))
	Directory_valid: directory /= Void implies directory.type.is_equal("VERSIONED_FOLDER")

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
--| The Original Code is ehr.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
