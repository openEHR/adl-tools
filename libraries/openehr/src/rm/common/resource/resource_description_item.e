note
	component:   "openEHR ADL Tools"
	description: "[
				 Language-specific detail of resource description. When a resource 
				 is translated for use in another language environment, each 
				 RESOURCE_DESCRIPTION_ITEM needs to be copied and translated into 
				 the new language.
				 ]"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class RESOURCE_DESCRIPTION_ITEM

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
	make_dt, make, make_from_language

feature -- Definitions

	Default_purpose: STRING = "???"

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			--
		do
			language := Default_language_code
			create purpose.make (0)
			purpose.append (Default_purpose)
		end

	make (a_lang: TERMINOLOGY_CODE; a_purpose: STRING)
		require
			Purpose_valid: not a_purpose.is_empty
		do
			language := a_lang
			purpose := a_purpose
		ensure
			Language_set: language = a_lang
			Purpose_set: purpose = a_purpose
		end

	make_from_language (a_lang_name: STRING)
			-- make using a_lang_name and default language code ste
		require
			Lang_valid: not a_lang_name.is_empty
		do
			create language.make (default_language_code_set, a_lang_name)
			purpose := Default_purpose.twin
		ensure
			Language_set: language.code_string.is_equal (a_lang_name)
			Purpose_set: purpose.is_equal (Default_purpose)
		end

feature -- Access

	language: TERMINOLOGY_CODE
			-- Language of this item

	purpose: STRING
			-- Purpose of the archetype.

	use: detachable STRING
			-- Description of the uses of the archetype,
			-- i.e. contexts in which it could be used.

	keywords:  detachable ARRAYED_LIST [STRING]
			-- Keywords which characterise this archetype, used e.g.
			-- for indexing and searching.

	misuse:  detachable STRING
			-- Description of any misuses of the archetype,
			-- i.e. contexts in which it should not be used.

	original_resource_uri: detachable HASH_TABLE [STRING, STRING]
			-- URIs of precursor resource of archetype, e.g. natural language
			-- document, semi-formal description

	other_details:  detachable HASH_TABLE [STRING, STRING]
			-- Additional language-senstive archetype meta-data, as a list of name/value pairs.

feature -- Status Report

	has_keyword (a_keyword: STRING): BOOLEAN
		do
			Result := attached keywords as att_kw and then att_kw.has (a_keyword)
		end

	has_original_resource_uri (a_key: STRING): BOOLEAN
		do
			Result := attached original_resource_uri as att_oru and then att_oru.has (a_key)
		end

	has_other_details (a_key: STRING): BOOLEAN
		do
			Result := attached other_details as att_od and then att_od.has (a_key)
		end

feature -- Modification

	set_purpose (a_purpose: STRING)
			-- set purpose
		require
			Purpose_valid: not a_purpose.is_empty
		do
			purpose := a_purpose
		ensure
			Purpose_set: purpose = a_purpose
		end

	set_use (a_use: STRING)
			-- set use
		require
			Purpose_valid: not a_use.is_empty
		do
			use := a_use
		ensure
			Use_set: use = a_use
		end

	clear_use
			-- remove `use'
		do
			use := Void
		ensure
			not attached use
		end

	set_misuse (a_misuse: STRING)
			-- set misuse
		require
			Misuse_valid: not a_misuse.is_empty
		do
			misuse := a_misuse
		ensure
			Misuse_set: misuse = a_misuse
		end

	clear_misuse
			-- remove `misuse'
		do
			misuse := Void
		ensure
			not attached misuse
		end

	add_keyword (a_keyword: STRING; i: INTEGER)
			-- add a_keyword to `keywords' at position `i', or end if i is 0
		require
			Keyword_valid: not has_keyword (a_keyword)
			Valid_max_index: attached keywords as att_kw implies i <= att_kw.count
		local
			kw: attached like keywords
		do
			if attached keywords as att_kw then
				kw := att_kw
			else
				create kw.make(0)
				kw.compare_objects
				keywords := kw
			end
			if i > 0 then
				kw.go_i_th (i)
				kw.put_left (a_keyword)
			else
				kw.extend (a_keyword)
			end
		ensure
			Keyword_added: has_keyword (a_keyword)
			Insert_position: i > 0 implies attached keywords as att_kw and then att_kw.i_th (i) = a_keyword
		end

	remove_keyword (a_keyword: STRING)
			-- remove a_keyword from `keywords'
		require
			Contributor_valid: has_keyword (a_keyword)
		do
			if attached keywords as att_kw then
				att_kw.prune (a_keyword)
			end
		ensure
			Keyword_removed: not has_keyword (a_keyword)
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

	put_original_resource_uri_item (a_key, a_value: STRING)
			-- add the key, value pair to original_resource_uri
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		local
			oru: attached like original_resource_uri
		do
			if attached original_resource_uri as att_oru then
				oru := att_oru
			else
				create oru.make (0)
				original_resource_uri := oru
			end
			oru.put (a_value, a_key)
		ensure
			Original_resource_uri_added: attached original_resource_uri as att_oru and then attached att_oru.item (a_key) as att_oru_item and then att_oru_item = a_value
		end

	remove_original_resource_uri_item (a_key: STRING)
			-- remove item with key `a_key' from `original_resource_uri'
		require
			Key_valid: has_original_resource_uri (a_key)
		do
			if attached original_resource_uri as att_oru then
				att_oru.remove (a_key)
				if att_oru.is_empty then
					original_resource_uri := Void
				end
			end
		ensure
			attached old original_resource_uri as att_old_oru and then att_old_oru.count = 1 implies original_resource_uri = Void
		end

feature -- Copying

	translated_copy (a_lang: STRING): RESOURCE_DESCRIPTION_ITEM
			-- generate a copy of this object, with all strings sss replaced by
			-- "*sss(orig_lang)"
		require
			not language.code_string.is_equal(a_lang)
		local
			prefix_str, suffix_str: STRING
		do
			prefix_str := "*"
			suffix_str := "(" + a_lang + ")"
			create Result.make (create {TERMINOLOGY_CODE}.make (Default_language_code_set, a_lang), prefix_str + purpose + suffix_str)
			if attached use as att_use then
				Result.set_use (prefix_str + att_use + suffix_str)
			end
			if attached misuse as att_misuse then
				Result.set_misuse (prefix_str + att_misuse + suffix_str)
			end
			if attached keywords as att_keywords then
				across att_keywords as keywords_csr loop
					Result.add_keyword (prefix_str + keywords_csr.item + suffix_str, 0)
				end
			end
			if attached original_resource_uri as att_uri then
				across att_uri as uri_csr loop
					Result.put_original_resource_uri_item (prefix_str + uri_csr.key + suffix_str, uri_csr.item)
				end
			end
			if attached other_details as att_other_details then
				across att_other_details as other_details_csr loop
					Result.put_other_details_item (prefix_str + other_details_csr.key + suffix_str,
						prefix_str + other_details_csr.item + suffix_str)
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend("language")
			Result.extend("purpose")
			Result.extend("use")
			Result.extend("misuse")
			Result.extend("keywords")
			Result.extend("original_resource_uri")
			Result.extend("other_details")
		end

invariant
	language_valid: code_set (code_set_id_languages).has(language)
	purpose_valid: not purpose.is_empty
	use_valid: attached use as att_use implies not att_use.is_empty
	misuse_valid: attached misuse as att_misuse implies not att_misuse.is_empty

end


