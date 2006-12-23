indexing
	component:   "openEHR EHR Reference Model"

	description: "[
				  Single item in generic extract.
				  ]"
	keywords:    "ehr, extract"

	design:      "openEHR EHR Extract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class GENERIC_EXTRACT_ITEM

inherit
	EXTRACT_ITEM

feature -- Access

	item: LOCATABLE
			-- Content item.

	item_type: STRING	
			-- Type of item.

	version_id: STRING	
			-- Version id of this item in original system.

	version_set_id: STRING	
			-- Version set id of this item in original system, where applicable.

	other_details: HASH_TABLE [STRING, STRING]	
			-- Other details about the content item.

invariant
	Item_valid: item /= Void
	Item_type_valid: item_type /= Void and then not item_type.is_empty
	Version_id_valid: version_id /= Void implies not version_id.is_empty
	Version_set_id_valid: version_set_id /= Void implies not version_set_id.is_empty
	Other_details_valid: other_details /= Void implies not other_details.is_empty	

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
--| The Original Code is ehr_extract_request.e.
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
