note
	component:   "openEHR ADL Tools"

	description: "[
				 Versions whose content is an ORIGINAL_VERSION copied from another location; this class 
				 inherits commit_audit and contribution from VERSION<T>, providing imported versions 
				 with their own audit trail and Contribution, distinct from those of the imported 
				 ORIGINAL_VERSION.	
				 ]"
	keywords:    "version"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class IMPORTED_VERSION [G]

inherit
	VERSION [G]

feature -- Access

	uid: OBJECT_VERSION_ID
			-- Unique identifier of this version, containing owner_id, version_tree_id and 
			-- creating_system_id.
		do
			Result := item.uid
		end

	preceding_version_uid: OBJECT_VERSION_ID
			-- Computed version of inheritance precursor, derived as item.preceding_version_uid.
		do
			Result := item.preceding_version_uid
		end

	item: ORIGINAL_VERSION [G]
			-- the original version wrapped by this imported version
			
	data: G
			-- content of the original Version
		do
			Result := item.data
		end
		
	lifecycle_state: DV_CODED_TEXT
			-- Lifecycle state of the content item in this version, derived as item.lifecycle_state.
		do
			Result := item.lifecycle_state
		end
			
invariant
	Item_valid: item /= Void
	
end


