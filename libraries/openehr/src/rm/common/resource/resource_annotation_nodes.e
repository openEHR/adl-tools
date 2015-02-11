note
	component:   "openEHR ADL Tools"
	description: "Model of tables of annotations keyed by path for a resource."
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class RESOURCE_ANNOTATION_NODES

create
	make

feature -- initialisation

	make
		do
			create items.make (0)
		end

feature -- Access

	items: HASH_TABLE [RESOURCE_ANNOTATION_NODE_ITEMS, STRING]
			-- List of form:
			-- {{tag, value}+, path}

	item_at_path (a_path: STRING): detachable RESOURCE_ANNOTATION_NODE_ITEMS
			-- Return annotations at `a_path' from `items'
		do
			Result := items.item (a_path)
		end

feature -- Status Report

	has_path (a_path: STRING): BOOLEAN
			-- True if `a_path' found in `items'
		do
			Result := items.has (a_path)
		end

feature -- Modification

	replace_items_at_node (a_path: STRING; an_annotations: RESOURCE_ANNOTATION_NODE_ITEMS)
			-- add `an_annotations' at key `a_path'; replace any existing at that path
		do
			items.force (an_annotations, a_path)
		end

	merge_items_at_node (a_path: STRING; an_annotations: RESOURCE_ANNOTATION_NODE_ITEMS)
			-- add `an_annotations' at key `a_path' to existing annotations
		do
			if not items.has (a_path) then
				items.put (create {RESOURCE_ANNOTATION_NODE_ITEMS}.make, a_path)
			end
			across an_annotations.items as annots_csr loop
				if attached items.item (a_path) as att_item then
					att_item.items.force (annots_csr.item, annots_csr.key)
				end
			end
		end

	add_item_at_node (a_path, annot_key, annot_content: STRING)
			-- add an annotation consisting of key `annot_key' & `annot_content' at path `a_path';
			-- replace any existing at same path
		do
			if items.has (a_path) and then attached items.item (a_path) as att_item then
				att_item.add_item (annot_key, annot_content)
			else
				items.put (create {RESOURCE_ANNOTATION_NODE_ITEMS}.make, a_path)
			end
		end

end


