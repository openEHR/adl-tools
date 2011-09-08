note
	component:   "openEHR common definitions"
	
	description: "Names of terminologies defined and used internally by openEHR"
	keywords:    "terminology, vocabulary, identifiers"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OPENEHR_TERMINOLOGY_GROUP_IDENTIFIERS

feature -- Definitions

	Terminology_id_openehr: STRING = "openehr"

	Group_id_audit_change_type: STRING = "audit change type"

	Group_id_attestation_reason: STRING = "attestation reason"

	Group_id_composition_category: STRING = "composition category"

	Group_id_event_math_function: STRING = "event math function"

	Group_id_ism_states: STRING = "ISM states"

	Group_id_ism_transitions: STRING = "ISM transitions"
	
	Group_id_normal_status: STRING = "normal status"

	Group_id_null_flavours: STRING = "null flavours"

	Group_id_measurable_properties: STRING = "measurable properties"

	Group_id_participation_function: STRING = "participation function"

	Group_id_participation_mode: STRING = "participation mode"

	Group_id_related_party_relationship: STRING = "related party relationship"

	Group_id_setting: STRING = "setting"

	Group_id_term_mapping_purpose: STRING = "term mapping purpose"

	Group_id_version_lifecycle_state: STRING = "version lifecycle state"

feature -- Comparison

	valid_terminology_group_id (an_id: STRING): BOOLEAN
			-- True if an_id is in the set defined by this class
		do
			-- FIXME: to be implemented
		end

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
--| The Original Code is openehr_terminology_group_identifiers.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
