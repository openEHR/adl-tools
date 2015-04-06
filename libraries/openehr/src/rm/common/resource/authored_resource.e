note
	component:   "openEHR ADL Tools"
	description: "Abstract model of an informational resource / artefact created by a (usually) human author."
	keywords:    "resource, document"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class AUTHORED_RESOURCE

inherit
	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	BASIC_DEFINITIONS
		export
			{NONE} all
		end

	LINGUISTIC_RESOURCE

feature -- Definitions

	Uncontrolled_revision_name: STRING = "(uncontrolled)"

feature {P_AUTHORED_ARCHETYPE} -- Initialisation

	make_from_other (other: AUTHORED_RESOURCE)
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
			uid := other.uid
		end

feature -- Access

	uid: detachable HIER_OBJECT_ID
			-- Unique identifier of the family of archetypes having the same interface identifier (same major version).

	original_language: TERMINOLOGY_CODE
			-- Language in which this resource was initially authored. Although there
			-- is no language primacy of resources overall, the language of original
			-- authoring is required to ensure natural language translations can preserve
			-- quality. Language is relevant in both the description and ontology sections.
		attribute
			create Result.default_create
		end

	translations: detachable HASH_TABLE [TRANSLATION_DETAILS, STRING]
			-- List of details for each natural translation made of this resource, keyed by
			-- language tag. For each translation listed here, there must be corresponding
			-- sections in all language-dependent parts of the resource.

	description: RESOURCE_DESCRIPTION
			-- Description and lifecycle information of the resource.

	revision_history: detachable REVISION_HISTORY
			-- The revision history of the resource. Only required if is_controlled = True
			-- (avoids large revision histories for informal or private editing situations).

	annotations: detachable RESOURCE_ANNOTATIONS
			-- list of annotations, keyed by language. Annotations may be present for only one or
			-- some languages; if they are present for more than one, the structures must match

	current_revision: STRING
			-- Current revision if revision_history exists else "(uncontrolled)".
		do
			if attached revision_history as att_rev_hist then
				Result := att_rev_hist.most_recent_version
			else
				Result := uncontrolled_revision_name.twin
			end
		end

	languages_available: ARRAYED_SET [STRING]
			-- Total list of languages available in this resource, derived from
			-- `original_language' and `translations'. Guaranteed to at least include `original_language'
		do
			if languages_available_cache.is_empty then
				languages_available_cache.extend (original_language.code_string)
				if attached translations as trans then
					across trans as trans_csr loop
						languages_available_cache.extend (trans_csr.key)
					end
				end
			end
			Result := languages_available_cache
		end

	translation_for_language (a_lang: STRING): detachable TRANSLATION_DETAILS
			-- get translation details for a_lang
			-- Void if nothing for that language
		require
			Lang_valid: attached translations as att_trans and then att_trans.has (a_lang)
		do
			if attached translations as att_trans then
				Result := att_trans.item (a_lang)
			end
		end

	annotations_at_path (a_lang, a_path: STRING): detachable RESOURCE_ANNOTATION_NODE_ITEMS
			-- Obtain annotation at `a_path'
		require
			has_annotations_at_path:  has_annotations_at_path (a_lang, a_path)
		do
			if attached annotations as att_ann then
				Result := att_ann.annotations_at_path (a_lang, a_path)
			end
		end

feature -- Status Report

	is_controlled: BOOLEAN
			-- True if this resource is under any kind of change control (even file
			-- copying), in which case revision history is created.

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

	has_annotations_at_path (a_lang, a_path: STRING): BOOLEAN
			-- True if `a_path' is found in  `annotations'
		do
			Result := attached annotations as att_ann and then att_ann.has_language (a_lang) and then att_ann.has_annotation_at_path (a_lang, a_path)
		end

	has_path (a_path: STRING): BOOLEAN
			-- True if `a_path' is found in resource; define in descendants
		require
			a_path_valid: not a_path.is_empty
		deferred
		end

feature -- Modification

	set_uid (a_uid: STRING)
		do
			create uid.make_from_string (a_uid)
		end

	set_original_language (a_lang: TERMINOLOGY_CODE)
		do
			original_language := a_lang
		end

	set_description (a_desc: RESOURCE_DESCRIPTION)
		require
			Description_valid: a_desc.languages.is_equal(languages_available)
		do
			description := a_desc
		end

	add_default_translation (a_lang_tag: STRING)
			-- add a blank translation object for a_lang_tag
		require
			Lang_tag_valid: valid_language_tag(a_lang_tag)
			Lang_tag_not_already_present: not has_language(a_lang_tag)
		local
			a_trans: TRANSLATION_DETAILS
		do
			create a_trans.make_from_language (a_lang_tag)
			a_trans.put_author_item ("name", "unknown")
			add_translation (a_trans)
		end

	add_translation (a_trans: TRANSLATION_DETAILS)
			-- add a translation for a_lang
		require
			Translation_valid: not languages_available.has(a_trans.language.code_string)
		local
			trans: attached like translations
		do
			if attached translations as att_trans then
				trans := att_trans
			else
				create trans.make(0)
				translations := trans
			end
			trans.put (a_trans, a_trans.language.code_string)
			languages_available_cache.wipe_out
		ensure
			languages_available.has (a_trans.language.code_string)
		end

	add_language (a_lang_tag: STRING)
			-- add a new translation language to the resource, creating appropriate copies
		do
			add_default_translation (a_lang_tag)
			description.add_language (a_lang_tag)
			languages_available_cache.wipe_out
		end

	merge_annotations (a_lang_tag: STRING; a_path: STRING; an_annotations: RESOURCE_ANNOTATION_NODE_ITEMS)
			-- add `an_annotations' at key `a_path'; replace any existing at same path
		local
			annots: RESOURCE_ANNOTATIONS
		do
			if attached annotations as att_annot then
				annots := att_annot
			else
				create annots.make_dt (Void)
				annotations := annots
			end
			if not annots.has_language (a_lang_tag) then
				annots.add_annotation_table (create {RESOURCE_ANNOTATION_NODES}.make, a_lang_tag)
			end
			annots.merge_annotation_items (a_lang_tag, a_path, an_annotations)
		end

	set_annotations (an_annotations: RESOURCE_ANNOTATIONS)
			-- set annotations
		do
			annotations := an_annotations
		end

	merge_annotations_from_resource (other: AUTHORED_RESOURCE)
			-- merge annotations, if any found in `other' to current
		do
			if attached other.annotations as other_anns then
				if attached annotations as anns then
					anns.merge (other_anns)
				else
					annotations := other_anns.deep_twin
				end
			end
		end

	set_authoring_default_details (an_author_name, an_author_org, a_lifecycle_state, a_copyright: STRING)
		do
			description.put_original_author_item ("name", an_author_name)
			description.put_original_author_item ("organisation", an_author_org)
			description.set_lifecycle_state (a_lifecycle_state)
			description.add_original_language_details
			description.set_copyright (a_copyright)
		end

feature -- Status setting

	set_is_controlled
			-- set 'is_controlled'
		do
			is_controlled := True
		end

feature {ARCHETYPE} -- Flattening

	reduce_languages_to (a_langs: ARRAYED_SET [STRING])
			-- remove any languages not in `a_langs'
		do
			across languages_available as langs_csr loop
				if not a_langs.has (langs_csr.item) then
					if attached translations as trans then
						trans.remove (langs_csr.item)
					end
					description.remove_language (langs_csr.item)
					if attached annotations as annots then
						annots.remove_language (langs_csr.item)
					end
				end
			end
		end

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Implementation

	set_translations (a_trans: HASH_TABLE [TRANSLATION_DETAILS, STRING])
			-- set translations
		do
			translations := a_trans
			languages_available_cache.wipe_out
		end

	orig_lang_translations: LANGUAGE_TRANSLATIONS
			-- holds a copy of translations for purposes of DT object/dADL reading and writing
		do
			create Result.make
			Result.set_original_language (original_language)
			if attached translations as tr then
				Result.set_translations (tr)
			end
		end

feature {NONE} -- Implementation

	languages_available_cache: ARRAYED_SET [STRING]
			-- Total list of languages available in this resource, derived from
			-- original_language and translations. Guaranteed to at least include original_language
		attribute
			create Result.make (0)
			Result.compare_objects
		end

invariant
	Original_language_valid: ts.code_set (ts.Code_set_id_languages).has (original_language)
	Revision_history_valid: is_controlled xor revision_history = Void
	Current_revision_valid: not is_controlled implies current_revision.is_equal (Uncontrolled_revision_name)
	Translations_valid: attached translations as att_trans implies (not att_trans.is_empty and
		not att_trans.has (original_language.code_string))
--	Description_valid: has_translations implies (description.details.for_all
--		(agent (d:RESOURCE_DESCRIPTION_ITEM):BOOLEAN do translations.has_key(d.language.code_string) end))

end


