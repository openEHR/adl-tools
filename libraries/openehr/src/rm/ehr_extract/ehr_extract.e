indexing
	component:   "openEHR EHR Extract Reference Model"

	description: "THe root class of the Electronic Health Record Extract"
	keywords:    "ehr, extract"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Extract Reference Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EHR_EXTRACT 

inherit
	MESSAGE_CONTENT
	
	LOCATABLE

feature -- Access

	time_created: DV_DATE_TIME	
			-- Date/time the extract was created

	ehr_id: STRING	
			-- Id of the EHR from which the extract was created.

	subject_of_care: PARTY_REF	
			-- Id of the subject of care to whom the extract relates.

	originator: PARTY_REF	
			-- Health care agent authorising the extract to be created and sent.

	other_participations: SET[PARTICIPATION]
			-- Any other participations in the extract creation process

	include_multimedia: BOOLEAN	
			-- Indicates whether multimedia content referred to by instances of DV_MULTIMEDIA is included or not.

	follow_links: INTEGER	
			-- Degree of link following DV_LINKs emanating from Transactions originally determined 
			-- to be required for the extract. All Transactions at the target end of followed links 
			-- are also included in the extract.
			-- 0 = don’t follow;
			-- 1 = follow first degree links;
			-- 2 = follow 2nd degree links; 
			-- ....
			-- n = follow nth degree links

	directory: X_FOLDER	
			-- Directory structure of this extract, in which Transactions are contained.

	terminology: X_TERMINOLOGY	
			-- List of full terminology identification details for all terms used in 
			-- Transactions appearing in this extract.

	demographics: X_DEMOGRAPHICS	
			-- List of snapshots of all demographic entities referenced from the Transactions in this extract.

	access_control: X_ACCESS_CONTROL	
			-- List of all access_control settings relevant to the Transactions in this extract.

	path_of_item (a_loc: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

feature -- Status Report

	valid_path (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Is_archetype_root: is_archetype_root
	Originator_valid: originator /= Void
	Other_participations_valid: other_participations /= Void implies not other_participations.empty
	Time_created_exists: time_created /= Void
	Ehr_id_exists: ehr_id /= Void and then not ehr_id.empty
	Subject_of_care_valid: subject_of_care /= Void
	Directory_valid: directory /= Void and directory.is_archetype_root
	Terminology_exists: terminology /= Void
	Demographics_exists: demographics /= Void
	Access_control_exists: access_control /= Void	

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
--| The Original Code is ehr_extract.e.
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
