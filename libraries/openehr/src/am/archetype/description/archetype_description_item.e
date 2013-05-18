note
	component:   "openEHR ADL Tools"
	description: "Archetype meta-data details"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ARCHETYPE_DESCRIPTION_ITEM

inherit
	DT_CONVERTIBLE

create
	make_lang

feature -- Definitions

	Default_language: STRING = "en"

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
			--
		do
			create language.make (0)
			language.append(Default_language)
		end

	make_lang (a_lang, a_purpose: STRING)
		require
			Lang_valid: a_lang /= Void and then not a_lang.is_empty
			Purpose_valid: a_purpose /= Void and then not a_purpose.is_empty
		do
			language := a_lang
			purpose := a_purpose
		ensure
			Language_set: language = a_lang
			Purpose_set: purpose = a_purpose
		end

feature -- Access

	language: STRING
			-- Language of this item

	purpose: STRING
			-- Purpose of the archetype.

	use: STRING
			-- Description of the uses of the archetype,
			-- i.e. contexts in which it could be used.

	keywords: ARRAYED_LIST [STRING]
			-- Keywords which characterise this archetype, used e.g.
			-- for indexing and searching.

	misuse: STRING
			-- Description of any misuses of the archetype,
			-- i.e. contexts in which it should not be used.

	copyright: STRING
			-- Rights over the archetype as a knowledge resource;
			-- usually copyright and/or license to use.

	original_resource_uri: HASH_TABLE [URI, STRING]
			-- URI of precursor resource of archetype, e.g. natural language
			-- document, semi-formal description

	other_details: HASH_TABLE [STRING, STRING]
			-- Additional language-senstive archetype meta-data, as a list of name/value pairs.

feature -- Modification

	set_purpose(a_purpose: STRING)
			-- set purpose
		require
			Purpose_valid: a_purpose /= Void and then not a_purpose.is_empty
		do
			purpose := a_purpose
		ensure
			Purpose_set: purpose = a_purpose
		end

	set_use(a_use: STRING)
			-- set use
		require
			Purpose_valid: a_use /= Void and then not a_use.is_empty
		do
			use := a_use
		ensure
			Use_set: use = a_use
		end

	set_misuse(a_misuse: STRING)
			-- set misuse
		require
			Misuse_valid: a_misuse /= Void and then not a_misuse.is_empty
		do
			misuse := a_misuse
		ensure
			Misuse_set: misuse = a_misuse
		end

	set_copyright(a_copyright: STRING)
			-- set copyright
		require
			Copyright_valid: a_copyright /= Void and then not a_copyright.is_empty
		do
			copyright := a_copyright
		ensure
			Copyright_set: copyright = a_copyright
		end

	add_keyword(a_keyword: STRING)
			-- add a_keyword to keywords
		require
			Contributor_valid: a_keyword /= Void and then not a_keyword.is_empty
		do
			if keywords = Void then
				create keywords.make(0)
			end
			keywords.extend(a_keyword)
		ensure
			Keyword_added: keywords.has(a_keyword)
		end

	clear_keywords
			-- remove existing keywords
		do
			create keywords.make(0)
		end

	add_other_detail(a_key, a_value: STRING)
			-- add the key, value pair to other_details
		require
			Key_valid: a_key /= Void and then not a_key.is_empty
			Value_valid: a_value /= Void and then not a_value.is_empty
		do
			if other_details = Void then
				create other_details.make(0)
			end
			other_details.put(a_value, a_key)
		ensure
			Other_details_set: other_details.item(a_key) = a_value
		end

	clear_other_details
			-- remove existing other_details
		do
			create other_details.make (0)
		end

	add_original_resource_uri(a_key, a_value: STRING)
			-- add the key, value pair to original_resource_uri
		require
			Key_valid: a_key /= Void and then not a_key.is_empty
			Value_valid: a_value /= Void and then not a_value.is_empty
		do
			if original_resource_uri = Void then
				create original_resource_uri.make (0)
			end
			original_resource_uri.put(create {URI}.make_from_string(a_value), a_key)
		ensure
			Original_resource_uri_added: original_resource_uri.item(a_key).as_string.is_equal(a_value)
		end

	clear_original_resource_uri
			-- remove existing original_resource_uri items
		do
			create original_resource_uri.make(0)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend("language")
			Result.extend("purpose")
			Result.extend("use")
			Result.extend("misuse")
			Result.extend("keywords")
			Result.extend("original_resource_uri")
			Result.extend("copyright")
			Result.extend("other_details")
			Result.compare_objects
		end

invariant
	language_exists: language /= Void
	purpose_exists: purpose /= Void and then not purpose.is_empty
	use_valid: use /= Void implies not use.is_empty
	misuse_valid: misuse /= Void implies not misuse.is_empty
	copyright_valid: copyright /= Void implies not copyright.is_empty

end


