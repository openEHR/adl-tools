indexing
	component:   "openEHR EHR Reference Model"
	description: "[
			 A versioned controlled repository for COMPOSITIONs.  Information 
			 exists in versions corresponding  to  the  different  times at which  
			 each  piece of information  was  created. 
			 ]"
	keywords:    "transaction, version"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class VERSIONED_COMPOSITION

inherit
	VERSIONED_OBJECT [COMPOSITION]

feature -- Status Report

	is_persistent: BOOLEAN is
			-- derived persistent status from type of COMPOSITION
		do
			Result := first_version.data.is_persistent
		end
		
invariant
	Owner_id_valid: owner_id.type.is_equal("EHR")
	-- Meaning_valid: all_versions.for_all ({VERSION[COMPOSITION]}.data.meaning = all_versions.first.data.meaning)
	-- Persistent_valid: all_versions.for_all ({VERSION[COMPOSITION]}.data.is_persistent = all_versions.first.data.is_persistent)

	-- name_value: not is_persistent implies name.value.is_equal(meaning.value + "(" + 
	--	version_with_id(First_version_parent_pseudo_id).audit.committer.as_display_string + "@" + 
	--	version_with_id(First_version_parent_pseudo_id).audit.node + ")")

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
--| The Original Code is versioned_composition.e.
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
