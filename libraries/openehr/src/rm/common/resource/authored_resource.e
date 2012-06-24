note
	component:   "openEHR Common Information Model"
	description: "Abstract model of an online resource authored by a (usually) human author."
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class AUTHORED_RESOURCE

inherit
	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	LANGUAGE_TAG_TOOLS

feature -- Definitions

	Uncontrolled_revision_name: STRING = "(uncontrolled)"

feature -- Initialisation

	make_from_other (other: attached AUTHORED_RESOURCE)
		local
			a_copy: like other
		do
			a_copy := other.deep_twin

			is_controlled := a_copy.is_controlled
			original_language := a_copy.original_language
			translations := a_copy.translations
			description := a_copy.description
			revision_history := a_copy.revision_history
			annotations := a_copy.annotations
		end

feature -- Access

	original_language: attached CODE_PHRASE
			-- Language in which this resource was initially authored. Although there
			-- is no language primacy of resources overall, the language of original
			-- authoring is required to ensure natural language translations can preserve
			-- quality. Language is relevant in both the description and ontology sections.

	translations: detachable HASH_TABLE [TRANSLATION_DETAILS, STRING]
			-- List of details for each natural translation made of this resource, keyed by
			-- language tag. For each translation listed here, there must be corresponding
			-- sections in all language-dependent parts of the resource.

	description: attached RESOURCE_DESCRIPTION
			-- Description and lifecycle information of the resource.

	revision_history: detachable REVISION_HISTORY
			-- The revision history of the resource. Only required if is_controlled = True
			-- (avoids large revision histories for informal or private editing situations).

	annotations: detachable RESOURCE_ANNOTATIONS
			-- list of annotations, keyed by language. Annotations may be present for only one or
			-- some languages; if they are present for more than one, the structures must match

	current_revision: attached STRING
			-- Current revision if revision_history exists else "(uncontrolled)".
		do
			if has_revision_history then
				Result := revision_history.most_recent_version
			else
				Result := uncontrolled_revision_name.twin
			end
		end

	languages_available: attached ARRAYED_SET [STRING]
			-- Total list of languages available in this resource, derived from
			-- original_language and translations. Guaranteed to at least include original_language
		do
			if languages_available_cache = Void then
				create languages_available_cache.make (0)
				languages_available_cache.compare_objects
				languages_available_cache.extend (original_language.code_string)
				if has_translations then
					from translations.start until translations.off loop
						languages_available_cache.extend (translations.key_for_iteration)
						translations.forth
					end
				end
			end
			Result := languages_available_cache
		ensure
			not Result.is_empty
		end

	translation_for_language (a_lang: attached STRING): attached TRANSLATION_DETAILS
			-- get translation details for a_lang
			-- Void if nothing for that language
		require
			Lang_valid: translations.has (a_lang)
		do
			Result := translations.item (a_lang)
		end

	matching_language_tag (a_lang: attached STRING): attached STRING
			-- Currently defined language tag for language `a_lang', e.g.
			-- The current set might be {"en-GB", "es-CL"} and `a_lang' might be "es"
			-- FIXME: this currently returns the FIRST matching tag
		require
			Valid_language: has_matching_language_tag (a_lang)
		do
			from languages_available.start until languages_available.off or language_tag_has_language (languages_available.item, a_lang) loop
				languages_available.forth
			end
			Result := languages_available.item
		end

feature -- Status Report

	is_controlled: BOOLEAN
			-- True if this resource is under any kind of change control (even file
			-- copying), in which case revision history is created.

	has_language (a_lang_tag: attached STRING): BOOLEAN
			-- True if either original_language or translations has a_lang_tag
		do
			Result := original_language.code_string.is_equal (a_lang_tag) or else (has_translations and then translations.has (a_lang_tag))
		end

	has_matching_language_tag (a_lang: attached STRING): BOOLEAN
			-- True if the currently defined language tags match the language `a_lang', e.g.
			-- The current set might be {"en-GB", "es-CL"} and `a_lang' might be "es"
		require
			Valid_language: valid_language_pattern_tag (a_lang)
		do
			from languages_available.start until languages_available.off or language_tag_has_language (languages_available.item, a_lang) loop
				languages_available.forth
			end
			Result := not languages_available.off
		end

	has_translations: BOOLEAN
			-- True if there are translations
		do
			Result := attached translations
		end

	has_revision_history: BOOLEAN
			-- True if there is a revision_history
		do
			Result := attached revision_history
		end

	has_annotations: BOOLEAN
			-- True if there is a revision_history
		do
			Result := attached annotations
		end

	has_annotation_at_path (a_lang, a_path: attached STRING): BOOLEAN
			-- True if `a_path' is found in  `annotations'
		do
			Result := has_annotations and then annotations.has_language (a_lang) and then annotations.has_annotation_at_path (a_lang, a_path)
		end

	has_path (a_path: attached STRING): BOOLEAN
			-- True if `a_path' is found in resource; define in descendants
		require
			a_path_valid: not a_path.is_empty
		deferred
		end

feature -- Modification

	set_description (a_desc: attached RESOURCE_DESCRIPTION)
		require
			Description_valid: a_desc.languages.is_equal(languages_available)
		do
			description := a_desc
		end

	add_default_translation (a_lang_tag: attached STRING)
			-- add a blank translation object for a_lang_tag
		require
			Lang_tag_valid: valid_language_tag(a_lang_tag)
			Lang_tag_not_already_present: not has_language(a_lang_tag)
		local
			a_trans: TRANSLATION_DETAILS
		do
			create a_trans.make_from_language(a_lang_tag)
			a_trans.put_author_item ("name", "unknown")
			add_translation (a_trans)
		end

	add_translation (a_trans: attached TRANSLATION_DETAILS)
			-- add a translation for a_lang
		require
			Translation_valid: not languages_available.has(a_trans.language.code_string)
		do
			if translations = Void then
				create translations.make(0)
			end
			translations.put (a_trans, a_trans.language.code_string)
			languages_available_cache := Void
		ensure
			languages_available.has(a_trans.language.code_string)
		end

	add_language_tag (a_lang_tag: attached STRING)
			-- add a new translation language to the resource, creating appropriate copies
		require
			Lang_tag_valid: valid_language_tag(a_lang_tag)
			Lang_tag_not_already_present: not has_language(a_lang_tag)
		do
			add_default_translation(a_lang_tag)
			description.add_language(a_lang_tag)
			languages_available_cache := Void
		ensure
			has_language(a_lang_tag)
		end

	merge_annotations (a_lang_tag: attached STRING; a_path: attached STRING; an_annotations: attached RESOURCE_ANNOTATION_NODE_ITEMS)
			-- add `an_annotations' at key `a_path'; replace any existing at same path
		do
			if not has_annotations then
				create annotations
			end
			if not annotations.has_language (a_lang_tag) then
				annotations.add_annotation_table (create {RESOURCE_ANNOTATION_NODES}.make, a_lang_tag)
			end
			annotations.merge_annotation_items (a_lang_tag, a_path, an_annotations)
		end

	set_annotations (an_annotations: attached RESOURCE_ANNOTATIONS)
			-- set annotations
		do
			annotations := an_annotations
		end

	merge_annotations_from_resource (other: attached AUTHORED_RESOURCE)
			-- merge annotations, if any found in `other' to current
		do
			if other.has_annotations then
				if not has_annotations then
					annotations := other.annotations.deep_twin
				else
					annotations.merge (other.annotations)
				end
			end
		end

feature -- Status setting

	set_is_controlled
			-- set 'is_controlled'
		do
			is_controlled := True
		end

feature -- Output

	languages_available_out: attached STRING
			-- generate readable comma-separated list of languages available
		do
			create Result.make_empty
			from languages_available.start until languages_available.off loop
				if not Result.is_empty then
					Result.append (", ")
				end
				Result.append (languages_available.item)
				languages_available.forth
			end
		end

feature {ADL15_ENGINE} -- Implementation

	synchronise_adl15
			-- synchronise object representation of resource to forms suitable for serialisation
		do
			-- FIXME - translations are handled like this until ADL2, when the
			-- whole archetype will just be a dADL doc
			create orig_lang_translations.make
			orig_lang_translations.set_original_language (original_language)
			if has_translations then
				orig_lang_translations.set_translations(translations)
			end
			orig_lang_translations.synchronise_to_tree
			description.synchronise_to_tree
			if has_annotations then
				annotations.synchronise_to_tree
			end
		end

	set_translations (a_trans: attached HASH_TABLE [TRANSLATION_DETAILS, STRING])
			-- set translations
		do
			translations := a_trans
			languages_available_cache := Void
		end

	orig_lang_translations: LANGUAGE_TRANSLATIONS
			-- holds a copy of translations for purposes of DT object/dADL reading and writing

feature {NONE} -- Implementation

	languages_available_cache: ARRAYED_SET [STRING]
			-- Total list of languages available in this resource, derived from
			-- original_language and translations. Guaranteed to at least include original_language

invariant
	Original_language_valid: ts.code_set (ts.Code_set_id_languages).has (original_language)
	Revision_history_valid: is_controlled xor revision_history = Void
	Current_revision_valid: not is_controlled implies current_revision.is_equal (Uncontrolled_revision_name)
	Translations_valid: has_translations implies (not translations.is_empty and
		not translations.has (original_language.code_string))
--	Description_valid: has_translations implies (description.details.for_all
--		(agent (d:RESOURCE_DESCRIPTION_ITEM):BOOLEAN do translations.has_key(d.language.code_string) end))

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
--| The Original Code is adl_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
