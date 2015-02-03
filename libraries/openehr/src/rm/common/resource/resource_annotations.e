note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract model of annotations on a resource, structured as follows:
				 	lang1
						path1
							key	val
							key	val
							...
						path2
							key	val
							key	val
							...
						pathN
				 	lang2
						path1
							key	val
							key	val

				 The population of languages can be sparse, i.e. does not have the same requirement
				 as other parts of an archetype.
				 ]"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class RESOURCE_ANNOTATIONS

inherit
	LANGUAGE_TAG_TOOLS

	DT_CONVERTIBLE

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all;
		end

create
	make_dt

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
		end

feature -- Access

	items: HASH_TABLE [RESOURCE_ANNOTATION_NODES, STRING]
			-- list of annotation tables, keyed by language. Annotations may be present for only one or
			-- some languages; if they are present for more than one, the structures must match
		attribute
			create Result.make (0)
		end

	matching_language_tag (a_lang_tag: STRING): STRING
			-- The actual language tag e.g. "en-GB" matching `a_lang_tag' in `items'
		require
			has_matching_language_tag (a_lang_tag)
		do
			if items.has (a_lang_tag) then
				Result := a_lang_tag
			else
				from items.start until items.off or language_tag_has_language (items.key_for_iteration, a_lang_tag) loop
					items.forth
				end
				Result := items.key_for_iteration
			end
		end

	annotations_at_path (a_lang, a_path: STRING): detachable RESOURCE_ANNOTATION_NODE_ITEMS
			-- Get annotations for `a_lang' at `a_path' from `items'
		require
			has_annotation_at_path (a_lang, a_path)
		do
			if attached items.item (a_lang) as item_at_lang then
				Result := item_at_lang.item_at_path (a_path)
			end
		end

	node_table_for_language (a_lang: STRING): detachable RESOURCE_ANNOTATION_NODES
			-- Get annotations for `a_lang' at `a_path' from `items'
		require
			has_language (a_lang)
		do
			Result := items.item (a_lang)
		end

feature -- Status Report

	has_language (a_lang_tag: STRING): BOOLEAN
			-- True if either original_language or translations has a_lang_tag
		do
			Result := items.has (a_lang_tag)
		end

	has_matching_language_tag (a_lang_tag: STRING): BOOLEAN
			-- True if either items has `a_lang_tag' (e.g. "en"), which it might not even if the language is available,
			-- since this section is only optionally populated with respect to languages, or has a matching tag, e.g.
			-- "en-GB"
		do
			Result := items.has (a_lang_tag) or else
				items.current_keys.there_exists (agent language_tag_has_language (?, a_lang_tag))
		end

	has_annotation_at_path (a_lang, a_path: STRING): BOOLEAN
			-- True if `a_path' is found in  `items' for `a_lang'
		do
			if items.has (a_lang) and then attached items.item (a_lang) as item_at_lang then
				Result := item_at_lang.has_path (a_path)
			end
		end

	has_any_annotation_at_path (a_path: STRING): BOOLEAN
			-- True if `a_path' is found in `items' for any language
		do
			Result := across items as anns_for_lang_csr some anns_for_lang_csr.item.items.has (a_path) end
		end

feature -- Modification

	add_annotation_table (an_annot_table: RESOURCE_ANNOTATION_NODES; a_lang: STRING)
		require
			not has_language (a_lang)
		do
			items.put (an_annot_table, a_lang)
		end

	merge_annotation_items (a_lang_tag: STRING; a_path: STRING; ann_items: RESOURCE_ANNOTATION_NODE_ITEMS)
			-- add `ann_items' at key `a_path'; replace any existing at same path
		do
			if not items.has (a_lang_tag) then
				items.put (create {RESOURCE_ANNOTATION_NODES}.make, a_lang_tag)
			end
			items.item(a_lang_tag).merge_items_at_node(a_path, ann_items)
		end

	merge (other: RESOURCE_ANNOTATIONS)
			-- merge annotations in `other' to current
		do
			-- iterate on languages
			across other.items as other_items_csr loop
				-- iterate on paths
				across other_items_csr.item.items as paths_csr loop
					merge_annotation_items (other_items_csr.key, paths_csr.key, paths_csr.item)
				end
			end
		end

	update_annotation_path (old_path, new_path: STRING)
			-- replace `old_path' where it occurs as annotation key with `new_path',
			-- including partial path replacements in larger paths
		local
			conv_paths: HASH_TABLE [STRING, STRING]
			annot_path, old_og_path, new_og_path: OG_PATH
		do
			create old_og_path.make_from_string (old_path)
			create new_og_path.make_from_string (new_path)
			across items as anns_for_lang_csr loop
				create conv_paths.make (0)
				across anns_for_lang_csr.item.items as annots_csr loop
					create annot_path.make_from_string (annots_csr.key)
					if annots_csr.key.is_equal (old_path) then
						conv_paths.put (new_path, old_path)
					elseif annots_csr.key.starts_with (old_path) and not annot_path.i_th (old_og_path.count).is_addressable then
						annot_path.i_th (old_og_path.count).set_object_id (new_og_path.last_object_node_id)
						conv_paths.put (annot_path.as_string, annots_csr.key)
					end
				end
				across conv_paths as conv_paths_csr loop
					anns_for_lang_csr.item.items.replace_key (conv_paths_csr.item, conv_paths_csr.key)
				end
			end
		end

	remove_language (a_lang_tag: STRING)
		require
			has_language (a_lang_tag)
		do
			items.remove (a_lang_tag)
		ensure
			not items.has (a_lang_tag)
		end

feature {DT_OBJECT_CONVERTER} -- Serialisation

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend ("items")
		end

end


