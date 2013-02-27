note
	component:   "openEHR Common Information Model"
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
	license:     "See notice at bottom of class"

class RESOURCE_ANNOTATIONS

inherit
	LANGUAGE_TAG_TOOLS

	DT_CONVERTIBLE

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
			-- True if `a_path' is found in  `items'
		do
			if items.has (a_lang) and then attached items.item (a_lang) as item_at_lang then
				Result := item_at_lang.has_path (a_path)
			end
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

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend ("items")
		end

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
--| The Original Code is resource_annotations.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
