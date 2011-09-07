note
	component:   "openEHR Common Reference Model"

	description: "[
			 Generic details of an audit trail
			 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_AUDIT


create
	make

feature -- Initialization

	make(a_committer, a_committer_organisation: STRING; a_time_committed: DV_DATE_TIME; a_change_type: DV_CODED_TEXT)
		require
			a_committer_valid: a_committer /= Void
			a_committer_organisation_valid: a_committer_organisation /= Void implies not a_committer_organisation.is_empty
			a_time_committed_valid: a_time_committed /= Void
			a_change_type_valid: a_change_type /= Void
		do
			committer := a_committer
			committer_organisation := a_committer_organisation
			time_committed := a_time_committed
			change_type := a_change_type
		ensure
			Committer_set: committer = a_committer
			Committer_organisation_set: committer_organisation = a_committer_organisation
			Time_committed_set: time_committed = a_time_committed
		end

feature -- Access

	committer: STRING
			-- Identity of party who committed the item.

	committer_organisation: STRING
			-- Identification of the committer’s organisation.

	time_committed: DV_DATE_TIME
			-- Time of committal of the item.

	change_type: DV_CODED_TEXT
			-- Type of change. Coded using the openEHR Terminology “audit change type” group.

	reason: STRING
			-- description of this change

invariant
	Committer_exists: committer /= Void and then not committer.is_empty
	Committer_organisation_validity: committer_organisation /= Void implies not committer_organisation.is_empty
	Time_committed_exists: time_committed /= Void	
	Change_type_exists: change_type /= Void -- and then 
		-- terminology("openehr").codes_for_group_name("audit change type", "en").has(change_type.defining_code)
	Reason_valid: reason /= Void
	

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
--| The Original Code is audit_details.e.
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
