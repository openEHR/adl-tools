indexing
	component:   "openEHR Common Reference Model"

	description: "[
			 Versionable objects.
			 ]"
	keywords:    "version"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class VERSION [G]

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Access

	data: G

	audit: AUDIT_DETAILS

	lifecycle_state: DV_STATE

	attestations: SET [ATTESTATION]

	version_id: STRING
			-- Unique identifier of this version.
			
	owner_id: OBJECT_ID	
			-- A copy of the uid of the version repository to which this version was added.
			
	uid: OBJECT_ID is
			-- Unique identifier of this version, derived from version repository id and version id.
		do
			Result := owner_id.twin
		--	Result.set_version_id(version_id)
		end
	
	parent_version_id: STRING
			-- Unique identifier of the version on which this version was based. May be the pseudo-version “first”.

	contribution: DV_EHR_URI
			-- the contribution to which this version belongs

invariant
	Audit_exists: audit /= Void
	Attestations_validity: attestations /= Void implies attestations.is_empty

	lifecycle_state_valid: lifecycle_state /= Void and then 
		terminology("openehr").codes_for_group_name("version lifecycle state", "en").has(lifecycle_state.value.defining_code)

	version_id_exists: version_id /= Void and then not version_id.is_empty
	parent_version_id_exists: parent_version_id /= Void and then not parent_version_id.is_empty
	owner_id_exists: owner_id /= Void
	
	Contribution_exists: contribution /= Void

	uid_valid: uid /= Void and uid.version_id.is_equal(version_id)
	
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
--| The Original Code is versionable.e.
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
