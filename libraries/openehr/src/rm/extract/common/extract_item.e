note
	component:   "openEHR ADL Tools"

	description: "[
				  Abstract definition of container for one content item in Extract. Indicates whether 
				  it was part of the primary set and what it’s original path was.
				  ]"
	keywords:    "ehr, extract"

	design:      "openEHR EHR Extract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	path_of_item (an_item: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Uid_valid: uid /= Void	

end


