note
	component:   "openEHR ADL Tools"
	description: "Partial abstract interface of a language-enabled resource"
	keywords:    "resource, language"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class LINGUISTIC_RESOURCE

inherit
	LANGUAGE_TAG_TOOLS

feature -- Access

	original_language: TERMINOLOGY_CODE
			-- Language in which this resource was initially authored. Although there
			-- is no language primacy of resources overall, the language of original
			-- authoring is required to ensure natural language translations can preserve
			-- quality. Language is relevant in both the description and ontology sections.
		deferred
		end

	languages_available: ARRAYED_SET [STRING]
			-- Total list of languages available in this resource, derived from
			-- `original_language' and `translations'. Guaranteed to at least include `original_language'
		deferred
		ensure
			not Result.is_empty
		end

	matching_language_tag (a_lang: STRING): STRING
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

	has_language (a_lang: STRING): BOOLEAN
			-- True if either original_language or translations has a_lang_tag
		do
			Result := across languages_available as langs_csr some langs_csr.item.is_equal (a_lang) end
		end

	has_matching_language_tag (a_lang_tag: STRING): BOOLEAN
			-- True if the currently defined language tags match the language `a_lang', e.g.
			-- The current set might be {"en-GB", "es-CL"} and `a_lang' might be "es"
		require
			Valid_language: valid_language_pattern_tag (a_lang_tag)
		do
			Result := across languages_available as langs_csr some language_tag_has_language (langs_csr.item, a_lang_tag) end
		end

feature -- Modification

	set_original_language (a_lang: TERMINOLOGY_CODE)
		deferred
		ensure
			original_language.as_string.is_equal (a_lang.as_string)
		end

	add_language (a_lang_tag: STRING)
			-- add a new translation language to the resource, creating appropriate copies
		require
			Lang_tag_valid: valid_language_tag (a_lang_tag)
			Lang_tag_not_already_present: not has_language (a_lang_tag)
		deferred
		ensure
			has_language (a_lang_tag)
		end

feature {ARCHETYPE} -- Flattening

	reduce_languages_to (a_langs: ARRAYED_SET [STRING])
			-- remove any languages not in `a_langs'
		require
			a_langs.is_subset (languages_available)
		deferred
		ensure
			languages_available.is_subset (a_langs) and languages_available.count = a_langs.count
		end

end


