note
	component:   "openEHR ADL Tools"

	description: "[
	             This class models the general idea of a folder, i.e. a named
			 group of transactions, referenced by paths. More than one folder can
			 reference the same transaction.
			 ]"
	keywords:    "ehr, record"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class FOLDER 

inherit
	LOCATABLE

feature -- Access

	folders: LIST[FOLDER]
			-- Sub-folders of this FOLDER.

	items: LIST[OBJECT_REF]	
			-- The list of references to versioned transactions in this folder. 
			-- Since more than one folder can include the same transaction, 
			-- this relationship is an association.

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: FOLDER
			-- parent node of this node in compositional structure

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Folders_valid: folders /= Void implies not folders.is_empty
	Items_valid: items /= Void implies not items.is_empty 

end


