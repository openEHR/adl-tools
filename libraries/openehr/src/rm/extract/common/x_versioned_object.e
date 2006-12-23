indexing
	component:   "openEHR EHR Reference Model"

	description: "[
				  Extract variant of VERSIONED_OBJECT<T> class.
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

class X_VERSIONED_OBJECT [G -> LOCATABLE] 

inherit
	EXTRACT_ITEM
		redefine
			uid
		end

feature -- Access

	uid: HIER_OBJECT_ID	
			-- Uid of original VERSIONED_OBJECT.

	owner_id: LOCATABLE_REF	
			-- Owner_id from original VERSIONED_OBJECT, which identifies source EHR.

	time_created: DV_DATE_TIME	
			-- Creation time of original VERSIONED_OBJECT.

	total_version_count: INTEGER	
			-- Total number of versions in original VERSIONED_OBJECT at time of 
			-- creation of this X_VERSIONED_OBJECT.

	extract_version_count: INTEGER	
			-- The number of Versions in this extract for this Versioned object, 
			-- i.e. the count of items in the versions attribute. May be 0 if only 

	revision_history: REVISION_HISTORY	
			-- Optional revision history of the original VERSIONED_OBJECT. 
			-- If included, it is the complete revision history.

	versions: LIST [ORIGINAL_VERSION[G]]	
			-- 0 or more Versions from the original VERSIONED_OBJECT, according to the Extract specification.

invariant
	Uid_valid: uid /= Void
	Owner_id_valid: owner_id /= Void
	Time_created_valid: time_created /= Void
	Total_version_count_valid: total_version_count >= 1
	Extract_version_count_valid: extract_version_count >= 0
	Versions_valid: versions /= Void implies not versions.is_empty	

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
