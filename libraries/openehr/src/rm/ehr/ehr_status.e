note
	component:   "openEHR EHR Reference Model"

	description: "THe root class of the Electronic Health Record"
	keywords:    "ehr, record"

	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EHR_STATUS

inherit
	LOCATABLE

feature -- Access

	subject: PARTY_SELF
			-- The subject of this EHR.

	is_queryable: BOOLEAN
			-- True if querying should be allowed on this EHR

	is_modifiable: BOOLEAN
			-- True if modification should be allowed on this EHR

	other_details: ITEM_STRUCTURE
			-- other archetypable details

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		once
		end
			
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Is_archetype_root: is_archetype_root
	Subject_exists: subject /= Void
	No_parent: parent = Void
	
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
