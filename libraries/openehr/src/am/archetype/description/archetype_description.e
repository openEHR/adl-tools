note
	component:   "openEHR ADL Tools"
	description: "Archetype meta-data"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ARCHETYPE_DESCRIPTION

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

create
	make, make_author

feature -- Definitions

	Default_lifecycle_state: STRING = "initial"

	Default_original_author: STRING = "unknown"

feature -- Initialisation

	default_create
			--
		do
			lifecycle_state := Default_lifecycle_state.twin
			create details.make(0)
			create original_author.make(0)
		ensure then
			lifecycle_state_set: lifecycle_state.is_equal(Default_lifecycle_state)
		end

	make
			-- default make
		do
			default_create
			make_author(Default_original_author)
		end

	make_dt (make_args: ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
			make
		end

	make_author (an_author_name: attached STRING)
			-- make an empty description
		require
			An_author_name_exists: not an_author_name.is_empty
		do
			default_create
			add_original_author_item("name", an_author_name)
		ensure
			Original_author_item_set: original_author.item("name") = an_author_name
		end

feature -- Access

	original_author: HASH_TABLE [STRING, STRING]
			-- Original author of this archetype, with all relevant details,
			-- including organisation.

	archetype_package_uri: detachable URI
			-- URI of archetype package

	details: HASH_TABLE [ARCHETYPE_DESCRIPTION_ITEM, STRING]
			-- list of descriptive details, keyed by language

	lifecycle_state: STRING
			-- Lifecycle state of the archetype. Includes states such as
			-- submitted, experimental, awaiting_approval, approved,
			-- superseded, obsolete. State machine defined by archetype system

	other_contributors: detachable ARRAYED_LIST [STRING]

	other_details: detachable HASH_TABLE [STRING, STRING]

	details_for_lang(a_lang: STRING): detachable ARCHETYPE_DESCRIPTION_ITEM
			-- get details for given language
			-- Void if nothing for that language
		require
			Lang_valid: not a_lang.is_empty
		do
			if details.has(a_lang) then
				Result := details.item(a_lang)
			end
		end

feature -- Modification

	add_original_author_item(a_key, a_value: STRING)
			-- add the key, value pair to original_author
		require
			Key_valid: a_key /= Void and then not a_key.is_empty
			Value_valid: a_value /= Void and then not a_value.is_empty
		do
			original_author.force(a_value, a_key)
		ensure
			Original_author_set: original_author.item(a_key) = a_value
		end

	clear_original_author
			-- wipeout current items in original_author list
		do
			create original_author.make(0)
		end

	add_other_contributor(a_contributor: STRING)
			-- add a_contributor to add_other_contributor
		require
			Contributor_valid: a_contributor /= Void and then not a_contributor.is_empty
		do
			if other_contributors = Void then
				create other_contributors.make(0)
			end
			other_contributors.extend(a_contributor)
		ensure
			Other_contributor_set: other_contributors.has(a_contributor)
		end

	clear_other_contributors
			-- wipeout current items in other_contributors list
		do
			create other_contributors.make(0)
		end

	set_archetype_package_uri(a_uri: STRING)
			-- set archetype_package_uri
		require
			Uri_valid: a_uri /= Void and then not a_uri.is_empty
		do
			create archetype_package_uri.make_from_string(a_uri)
		ensure
			Archetype_package_uri_set: archetype_package_uri.out.is_equal(a_uri)
		end

	set_lifecycle_state(a_lifecycle_state: STRING)
			-- set lifecycle_state
		require
			Lifecycle_state_valid: a_lifecycle_state /= Void and then not a_lifecycle_state.is_empty
		do
			lifecycle_state := a_lifecycle_state
		ensure
			Lifecycle_state_set: lifecycle_state = a_lifecycle_state
		end

	add_detail(a_language: STRING; a_value: ARCHETYPE_DESCRIPTION_ITEM)
			-- add the a_language, value pair to other_details
		require
			Key_valid: a_language /= Void and then not a_language.is_empty
			Value_valid: a_value /= Void and then a_value.language.is_equal(a_language)
		do
			if details = Void then
				create details.make(0)
			end
			details.force(a_value, a_language)
		ensure
			Details_set: details.has(a_language)
		end

	clear_details
			-- wipeout current items in details list
		do
			create details.make(0)
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
			other_details.force(a_value, a_key)
		ensure
			Other_details_set: other_details.item(a_key) = a_value
		end

	clear_other_details
			-- wipeout current items in other_details list
		do
			create other_details.make(0)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend("original_author")
			Result.extend("other_contributors")
			Result.extend("archetype_package_uri")
			Result.extend("details")
			Result.extend("lifecycle_state")
			Result.extend("other_details")
			Result.compare_objects
		end

invariant
	Original_author_exists: original_author /= Void and then not original_author.is_empty
	Lifecycle_state_valid: lifecycle_state /= Void and then not lifecycle_state.is_empty
	Details_valid: details /= Void

end


