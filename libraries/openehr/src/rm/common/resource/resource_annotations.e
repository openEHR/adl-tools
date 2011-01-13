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
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class RESOURCE_ANNOTATIONS

inherit
	LANGUAGE_TAG_TOOLS
		undefine
			default_create
		end

	DT_CONVERTIBLE
		redefine
			default_create
		end

create
	make_dt, default_create

feature -- Initialisation

	default_create
			--
		do
			create items.make (0)
		end

	make_dt
			-- make used by DT_OBJECT_CONVERTER
		do
			default_create
		end

feature -- Access

	items: attached HASH_TABLE [RESOURCE_ANNOTATION_TABLE, STRING]
			-- list of annotation tables, keyed by language. Annotations may be present for only one or
			-- some languages; if they are present for more than one, the structures must match

	matching_language_tag (a_lang_tag: attached STRING): attached STRING
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

	annotation_at_path (a_lang, a_path: attached STRING): attached RESOURCE_ANNOTATION_ITEMS
			-- Get annotations for `a_lang' at `a_path' from `items'
		require
			has_annotation_at_path (a_lang, a_path)
		do
			Result := items.item (a_lang).item_at_path(a_path)
		end

	annotation_table (a_lang: attached STRING): attached RESOURCE_ANNOTATION_TABLE
			-- Get annotations for `a_lang' at `a_path' from `items'
		require
			has_language (a_lang)
		do
			Result := items.item (a_lang)
		end

feature -- Status Report

	has_language (a_lang_tag: attached STRING): BOOLEAN
			-- True if either original_language or translations has a_lang_tag
		do
			Result := items.has (a_lang_tag)
		end

	has_matching_language_tag (a_lang_tag: attached STRING): BOOLEAN
			-- True if either items has `a_lang_tag' (e.g. "en"), which it might not even if the language is available,
			-- since this section is only optionally populated with respect to languages, or has a matching tag, e.g.
			-- "en-GB"
		do
			Result := items.has (a_lang_tag) or else
				items.current_keys.there_exists (agent language_tag_has_language (?, a_lang_tag))
		end

	has_annotation_at_path (a_lang, a_path: attached STRING): BOOLEAN
			-- True if `a_path' is found in  `items'
		do
			Result := items.has (a_lang) and then items.item (a_lang).has_path(a_path)
		end

feature -- Modification

	add_annotation_table (an_annot_table: attached RESOURCE_ANNOTATION_TABLE; a_lang: attached STRING)
		require
			not has_language (a_lang)
		do
			items.put (an_annot_table, a_lang)
		end

	merge_annotation_items (a_lang_tag: attached STRING; a_path: attached STRING; ann_items: attached RESOURCE_ANNOTATION_ITEMS)
			-- add `ann_items' at key `a_path'; replace any existing at same path
		do
			if not items.has (a_lang_tag) then
				items.put (create {RESOURCE_ANNOTATION_TABLE}.make, a_lang_tag)
			end
			items.item(a_lang_tag).merge_annotation_items(a_path, ann_items)
		end

	merge (other: attached RESOURCE_ANNOTATIONS)
			-- merge annotations in `other' to current
		do
			-- iterate on languages
			from other.items.start until other.items.off loop
				-- iterate on paths
				from other.items.item_for_iteration.items.start until other.items.item_for_iteration.items.off loop
					merge_annotation_items (other.items.key_for_iteration, other.items.item_for_iteration.items.key_for_iteration,
						other.items.item_for_iteration.items.item_for_iteration)
					other.items.item_for_iteration.items.forth
				end
				other.items.forth
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
