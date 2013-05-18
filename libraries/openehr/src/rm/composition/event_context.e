note
	component:   "openEHR EHR Reference Model"

	description: "[
		       Context of clinical session, which is any business function executed
			 with or for a subject of care, including patient contact, pathology tests etc.
			 ]"
	keywords:    "composition, context, versioning"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"


class EVENT_CONTEXT

inherit
	PATHABLE

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Access

	health_care_facility: PARTY_IDENTIFIED
			-- The HCF in the health system who took part in the encounter; usually, this is
			-- where the encounter physically took place, but not in the case of patient home visits,
			-- internet contacts or emergency care.

	start_time: DV_DATE_TIME
			-- Start time of the clinical session.

	end_time: DV_DATE_TIME
			-- Optional end time of the clinical session.

	participations: LIST [PARTICIPATION]
			-- Parties involved in the clinical session. These would
			-- normally include the physician(s) and often the patient
			-- (but not the latter if the clinical session is a pathology test for example).

	location: STRING
			-- The actual location where the session occurred, e.g.
			-- "microbiol lab 2", "home", "ward A3" and so on.

	setting: DV_CODED_TEXT
			-- The setting in which the event took place.
			-- Coded using the openEHR Terminology, “setting” group.

	other_context: ITEM_STRUCTURE
			-- Other optional context which will be archetyped.

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
				-- TO_BE_IMPLEM
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
				-- TO_BE_IMPLEM
		end

	parent: COMPOSITION
			-- parent node of this node in compositional structure

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
				-- TO_BE_IMPLEM
		end

invariant
	Start_time_exists: start_time /= Void
	Participations_validity: participations /= Void implies not participations.is_empty
	Location_valid: location /= Void implies not location.is_empty
	Setting_valid: setting /= Void and then
			terminology("openehr").codes_for_group_name("setting", "en").has(setting.defining_code)

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
--| The Original Code is event_context.e.
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
