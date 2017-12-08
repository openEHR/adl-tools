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
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
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

	documentation: HASH_TABLE [HASH_TABLE [HASH_TABLE [STRING, STRING], STRING], STRING]
			-- documentary annotations, keyed by language. Annotations may be present for only one or
			-- some languages; if they are present for more than one, the structures must match
		attribute
			create Result.make (0)
		end

	matching_language_tag (a_lang_tag: STRING): STRING
			-- The actual language tag e.g. "en-GB" matching `a_lang_tag' in `documentation'
		require
			has_matching_language_tag (a_lang_tag)
		do
			if documentation.has (a_lang_tag) then
				Result := a_lang_tag
			else
				from documentation.start until documentation.off or language_tag_has_language (documentation.key_for_iteration, a_lang_tag) loop
					documentation.forth
				end
				Result := documentation.key_for_iteration
			end
		end

	annotations_at_path_in_lang (a_lang, a_path: STRING): detachable HASH_TABLE [STRING, STRING]
			-- Get annotations for `a_lang' at `a_path' from `documentation'
		require
			has_annotation_at_path (a_lang, a_path)
		do
			if attached documentation.item (a_lang) as lang_table then
				Result := (create {RESOURCE_ANNOTATION_PATH_TABLE}.make (lang_table)).values_at_path (a_path)
			end
		end

	path_table_for_language (a_lang: STRING): detachable RESOURCE_ANNOTATION_PATH_TABLE
			-- Get annotations for `a_lang' at `a_path' from `documentation'
		require
			has_language (a_lang)
		do
			if documentation.has (a_lang) and then attached documentation.item (a_lang) as path_table_ht then
				create Result.make (path_table_ht)
			end
		end

feature -- Status Report

	has_language (a_lang_tag: STRING): BOOLEAN
			-- True if either original_language or translations has a_lang_tag
		do
			Result := documentation.has (a_lang_tag)
		end

	has_matching_language_tag (a_lang_tag: STRING): BOOLEAN
			-- True if either items has `a_lang_tag' (e.g. "en"), which it might not even if the language is available,
			-- since this section is only optionally populated with respect to languages, or has a matching tag, e.g.
			-- "en-GB"
		do
			Result := documentation.has (a_lang_tag) or else
				documentation.current_keys.there_exists (agent language_tag_has_language (?, a_lang_tag))
		end

	has_annotation_at_path (a_lang, a_path: STRING): BOOLEAN
			-- True if `a_path' is found in  `documentation' for `a_lang'
		do
			if documentation.has (a_lang) and then attached documentation.item (a_lang) as lang_table then
				Result := (create {RESOURCE_ANNOTATION_PATH_TABLE}.make (lang_table)).has_path (a_path)
			end
		end

	has_any_annotation_at_path (a_path: STRING): BOOLEAN
			-- True if `a_path' is found in `documentation' for any language
		do
			Result := across documentation as anns_for_lang_csr some anns_for_lang_csr.item.has (a_path) end
		end

feature -- Modification

	add_annotation_table (an_annot_table: RESOURCE_ANNOTATION_PATH_TABLE; a_lang: STRING)
		require
			not has_language (a_lang)
		do
			documentation.put (an_annot_table.path_table, a_lang)
		end

	merge_annotation_items (a_lang_tag: STRING; a_path: STRING; value_table: HASH_TABLE [STRING, STRING])
			-- add `ann_items' at key `a_path'; replace any existing at same path
		local
			path_table: RESOURCE_ANNOTATION_PATH_TABLE
		do
			if attached documentation.item (a_lang_tag) as lang_table then
				create path_table.make (lang_table)
			else
				create path_table.make_empty
				documentation.put (path_table.path_table, a_lang_tag)
			end
			path_table.merge_values_at_path (a_path, value_table)
		end

	merge (other: RESOURCE_ANNOTATIONS)
			-- merge annotations in `other' to current
		do
			-- iterate on languages
			across other.documentation as other_lang_table loop
				-- iterate on paths
				across other_lang_table.item as paths_csr loop
					merge_annotation_items (other_lang_table.key, paths_csr.key, paths_csr.item)
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
			across documentation as anns_for_lang_csr loop
				create conv_paths.make (0)
				across anns_for_lang_csr.item as annots_csr loop
					create annot_path.make_from_string (annots_csr.key)
					if annots_csr.key.is_equal (old_path) then
						conv_paths.put (new_path, old_path)
					elseif annots_csr.key.starts_with (old_path) and not annot_path.i_th (old_og_path.count).is_addressable then
						annot_path.i_th (old_og_path.count).set_object_id (new_og_path.last_object_node_id)
						conv_paths.put (annot_path.as_string, annots_csr.key)
					end
				end
				across conv_paths as conv_paths_csr loop
					anns_for_lang_csr.item.replace_key (conv_paths_csr.item, conv_paths_csr.key)
				end
			end
		end

	remove_language (a_lang_tag: STRING)
		require
			has_language (a_lang_tag)
		do
			documentation.remove (a_lang_tag)
		ensure
			not documentation.has (a_lang_tag)
		end

feature {DT_OBJECT_CONVERTER} -- Serialisation

	persistent_attributes: detachable ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

end
