note
	component:   "openEHR ADL Tools"
	description: "[
				 Helper class containing just the translations attribute of AUTHORED_RESOURCE;
				 used by pre-ADL1.5 parsing to convert ODIN text of translations in language section
				 of archetype into an object that can then be pasted into the archetype.
				 ]"
	keywords:    "archetype, translation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class LANGUAGE_TRANSLATIONS

inherit
	DT_CONVERTIBLE

	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

create
	make, make_dt

feature -- Initialisation

	make
			-- default make
		do
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
		end

feature -- Access

	original_language: TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

	translations: HASH_TABLE [TRANSLATION_DETAILS, STRING]
			-- List of details for each natural translation made of this resource, keyed by
			-- language. For each translation listed here, there must be corresponding
			-- sections in all language-dependent parts of the resource.
		attribute
			create Result.make (0)
		end

feature -- Modification

	set_translations (a_trans: HASH_TABLE [TRANSLATION_DETAILS, STRING])
			-- set translations
		do
			translations := a_trans
		end

	set_original_language (a_lang: TERMINOLOGY_CODE)
			--
		do
			original_language := a_lang
		end

	set_original_language_from_string (a_lang: STRING)
			--
		do
			create original_language.make (ts.Default_language_code_set, a_lang)
		end

	add_new_translation (a_lang: STRING)
			-- add a blank translation object for a_lang
		local
			trans_tbl: attached like translations
		do
			if attached translations as att_trans_tbl then
				trans_tbl := att_trans_tbl
			else
				create trans_tbl.make(0)
				translations := trans_tbl
			end
			trans_tbl.put (create {TRANSLATION_DETAILS}.make_from_language (a_lang), a_lang)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend ("original_language")
			Result.extend ("translations")
			Result.compare_objects
		end

end


