indexing
	component:   "openEHR Demographic Reference Model"

	description: "[
			 Description of a means of contact of a party. Actual structure is archetyped.
			 ]"
	keywords:    "demographic, contact"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CONTACT

inherit
	LOCATABLE

feature -- Access

	time_validity: DV_INTERVAL [DV_DATE]	
			-- Valid time interval for this contact descriptor.

	addresses: LIST[ADDRESS]	
			-- A set of address alternatives for this purpose and time validity.

	purpose: DV_TEXT is
			-- Purpose for which this contact is used, e.g. “mail”, “daytime phone”, etc. 
			-- Taken from value of inherited name attribute.
		do
			
		end

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
	Purpose_valid: purpose = name
	Time_validity_exists: time_validity /= Void
	Addresses_exists: addresses /= Void and then not addresses.is_empty	

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
--| The Original Code is contact.e.
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
