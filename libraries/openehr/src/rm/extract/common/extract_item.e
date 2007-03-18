indexing
	component:   "openEHR EHR Reference Model"

	description: "[
				  Abstract definition of container for one content item in Extract. Indicates whether 
				  it was part of the primary set and what it’s original path was.
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

deferred class EXTRACT_ITEM

inherit
	LOCATABLE
		redefine
			uid
		end

feature -- Access

	uid: HIER_OBJECT_ID	
			-- Unique id of this Extract item; used for all referencing from elsewhere in Extract, 
			-- including from Extract Folders.

	is_primary: BOOLEAN	
			-- True if the content item carried in this container was part of the primary set for 
			-- the Extract , i.e. not added due to link-following.

	is_changed: BOOLEAN
			-- True if the content item carried in this container is any kind of change since last send, 
			-- in repeat sending situations.

	original_path: DV_URI
			-- The original path of the item in the source repository, used for matching items in the 
			-- receiver’s repository.

	is_masked: BOOLEAN	
			-- True if the content of this item has not been included due to insufficient access rights 
			-- of requestor.

	path_of_item (an_item: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Uid_valid: uid /= Void	

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
--| The Original Code is extract_item.e.
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
