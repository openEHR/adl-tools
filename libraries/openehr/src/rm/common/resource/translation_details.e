note
	component:   "openEHR ADL Tools"
	description: "Resource translation meta-data"
	keywords:    "resource, meta-data, translation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TRANSLATION_DETAILS

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	DT_CONVERTIBLE
		export
			{NONE} all
		end

create
	make_from_language, make_dt

feature -- Initialisation


	make_from_language (a_lang: STRING)
			-- make
		require
			Language_valid: not a_lang.is_empty
		do
			create language.make (default_language_code_set, a_lang)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
		end

feature -- Access

	language: TERMINOLOGY_CODE
			-- Language of translation
		attribute
			Result := default_language_code.deep_twin
		end

	author: STRING_TABLE [STRING]
			-- Translator name and other demographic details
		attribute
			create Result.make (0)
			Result.force ("????", "name")
		end

	accreditation: detachable STRING
			-- Accreditation of translator, usually a national translator's association id

	other_details: detachable STRING_TABLE [STRING]
			-- Any other meta-data

feature -- Status Report

	has_other_details (a_key: STRING): BOOLEAN
		do
			Result := attached other_details as att_od and then att_od.has (a_key)
		end

feature -- Modification

	set_language (a_lang: TERMINOLOGY_CODE)
			-- set language
		do
			language := a_lang
		end

	set_author (auth_details: STRING_TABLE [STRING])
			-- set author from a complete hash table
		require
			not auth_details.is_empty
		do
			author := auth_details
		end

	set_accreditation (an_accreditation: STRING)
			-- set accreditation
		require
			not an_accreditation.is_empty
		do
			accreditation := an_accreditation
		ensure
			accreditation = an_accreditation
		end

	clear_accreditation
			-- clear accreditation
		do
			accreditation := Void
		ensure
			not attached accreditation
		end

	put_author_item (a_key, a_value: STRING)
			-- set key=value pair into author
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		do
			author.force (a_value, a_key)
		end

	remove_author_item (a_key: STRING)
			-- remove item with key `a_key' from author
		require
			Key_valid: author.has (a_key)
		do
			author.remove (a_key)
		end

	put_other_details_item (a_key, a_value: STRING)
			-- put the key, value pair to other_details
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		local
			od: attached like other_details
		do
			if attached other_details as att_od then
				od := att_od
			else
				create od.make(0)
				other_details := od
			end
			od.force (a_value, a_key)
		ensure
			Other_details_set: attached other_details as att_od and then attached att_od.item(a_key) as att_od_item and then att_od_item = a_value
		end

	remove_other_details_item (a_key: STRING)
			-- remove item with key `a_key' from other_details
		require
			Key_valid: has_other_details (a_key)
		do
			if attached other_details as att_od then
				att_od.remove (a_key)
				if att_od.is_empty then
					other_details := Void
				end
			end
		ensure
			attached old other_details as att_old_od and then att_old_od.count = 1 implies other_details = Void
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("language")
			Result.extend ("author")
			Result.extend ("accreditation")
			Result.extend ("other_details")
		end

invariant
	Language_valid: code_set(code_set_id_languages).has(language)

end


