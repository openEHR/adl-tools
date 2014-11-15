note
	component:   "openEHR ADL Tools"
	description: "Resource descriptive meta-data"
	keywords:    "resource, meta-data"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class RESOURCE_DESCRIPTION

inherit
	DT_CONVERTIBLE

	TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	RESOURCE_DEFINITIONS
		export
			{NONE} all
		end

create
	make, make_dt, default_create

feature -- Definitions

	Default_original_author: STRING = "????"

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
		end

	make (an_author_name, orig_lang: STRING)
			-- make an empty description
		require
			An_author_name_exists: not an_author_name.is_empty
			Language_valid: not orig_lang.is_empty
		do
			put_original_author_item ("name", an_author_name)
			create original_language.make(default_language_code_set, orig_lang)
		ensure
			Original_author_item_set: original_author.item ("name") = an_author_name
			Original_language_set: original_language.code_string.is_equal(orig_lang)
		end

feature -- Access

	lifecycle_state: STRING
			-- Lifecycle state of the archetype. Includes states such as
			-- submitted, experimental, awaiting_approval, approved,
			-- superseded, obsolete. State machine defined by archetype system
		attribute
			create Result.make_from_string (Initial_resource_lifecycle_state)
		end

	original_language: TERMINOLOGY_CODE
			-- a copy of original_language from parent object
        attribute
            create Result.make (default_language_code_set, default_language)
        end

	original_author: HASH_TABLE [STRING, STRING]
			-- Original author of this archetype, with all relevant details,
			-- including organisation.
        attribute
            create Result.make (0)
            Result.put (Default_original_author, "name")
		end

	original_namespace: detachable INTERNET_ID
			-- Original namespace of this archetype as a reverse domain name

	original_publisher: detachable STRING
			-- Original publisher of this archetype as a string name

	custodian_namespace: detachable INTERNET_ID
			-- Namespace of current custodian organisation of this archetype as a reverse domain name

	custodian_organisation: detachable STRING
			-- Current custodian organisation of this archetype as a string name

	copyright:  detachable STRING
			-- Rights over the archetype as a knowledge resource;
			-- usually copyright and/or license to use.

	licence: detachable STRING
			-- Licence for this archetype if any, typically a short phrase with embedded URL

	ip_acknowledgements: detachable HASH_TABLE [STRING, STRING]
			-- list of IP acknowledgments, keyed by tag name of IP being mentioned

	conversion_details: detachable HASH_TABLE [STRING, STRING]
			-- tagged list of conversion information, where applicable

	details: HASH_TABLE [RESOURCE_DESCRIPTION_ITEM, STRING]
			-- list of descriptive details, keyed by language
        attribute
            create Result.make (0)
        end

	other_contributors: detachable ARRAYED_LIST [STRING]
			-- Other contributors to the resource, probably listed in “name <email>” form

	other_details: detachable HASH_TABLE [STRING, STRING]

	parent_resource: detachable AUTHORED_RESOURCE
			-- Reference to owning resource.

	resource_package_uri: detachable URI
			-- URI of archetype package

	languages: ARRAYED_SET[STRING]
			-- list of all languages in details
		do
			create Result.make(0)
			across details as details_csr loop
				Result.extend (details_csr.key.twin)
			end
		end

	detail_for_language (a_lang: STRING): detachable RESOURCE_DESCRIPTION_ITEM
			-- get the RESOURCE_DESCRIPTION_ITEM for a_lang
		require
			Language_valid: details.has (a_lang)
		do
			Result := details.item (a_lang)
		end

	detail_for_original_language: detachable RESOURCE_DESCRIPTION_ITEM
			-- get the RESOURCE_DESCRIPTION_ITEM for a_lang
		do
			Result := details.item (original_language.code_string)
		end

feature -- Status Report

	has_details: BOOLEAN
			-- True if there are any details
		do
			Result := attached details and not details.is_empty
		end

	has_ip_acknowledgement (a_key: STRING): BOOLEAN
		do
			Result := attached ip_acknowledgements as att_ack and then att_ack.has (a_key)
		end

	has_conversion_detail (a_key: STRING): BOOLEAN
		do
			Result := attached conversion_details as att_cd and then att_cd.has (a_key)
		end

feature -- Comparison

	valid_detail (a_detail: RESOURCE_DESCRIPTION_ITEM): BOOLEAN
			-- True if `a_detail' language is not already in `details'
		do
			Result := not details.has (a_detail.language.code_string)
		end

feature -- Modification

	put_original_author_item (a_key, a_value: STRING)
			-- add the key, value pair to original_author
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		do
			original_author.force (a_value, a_key)
		ensure
			Original_author_set: original_author.item (a_key) = a_value
		end

	remove_original_author_item (a_key: STRING)
			-- remove the key, value pair from `original_author'
		require
			Key_valid: original_author.has (a_key)
		do
			original_author.remove (a_key)
		ensure
			Item_removed: not original_author.has (a_key)
		end

	clear_original_author
			-- wipeout current items in original_author list
		do
			create original_author.make(0)
		ensure
			original_author.is_empty
		end

	set_original_namespace (a_namespace: INTERNET_ID)
		do
			original_namespace := a_namespace
		ensure
			original_namespace = a_namespace
		end

	clear_original_namespace
		do
			original_namespace := Void
		ensure
			not attached original_namespace
		end

	set_original_publisher (a_name: STRING)
		do
			original_publisher := a_name
		ensure
			original_publisher = a_name
		end

	clear_original_publisher
		do
			original_publisher := Void
		ensure
			not attached original_publisher
		end

	set_custodian_namespace (a_namespace: INTERNET_ID)
		do
			custodian_namespace := a_namespace
		ensure
			custodian_namespace = a_namespace
		end

	clear_custodian_namespace
		do
			custodian_namespace := Void
		ensure
			not attached custodian_namespace
		end

	set_custodian_organisation (a_name: STRING)
		do
			custodian_organisation := a_name
		ensure
			custodian_organisation = a_name
		end

	clear_custodian_organisation
		do
			custodian_organisation := Void
		ensure
			not attached custodian_organisation
		end

	set_copyright (a_copyright: STRING)
			-- set copyright
		require
			Copyright_valid: not a_copyright.is_empty
		do
			copyright := a_copyright
		ensure
			Copyright_set: copyright = a_copyright
		end

	clear_copyright
		do
			copyright := Void
		ensure
			not attached copyright
		end

	set_licence (a_text: STRING)
		do
			licence := a_text
		ensure
			licence = a_text
		end

	clear_licence
		do
			licence := Void
		ensure
			not attached licence
		end

	put_ip_acknowledgements_item (a_key, a_value: STRING)
			-- add the key, value pair to `ip_acknowledgements'; if it does not exist, create it
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		do
			if not attached ip_acknowledgements then
				create ip_acknowledgements.make (0)
			end
			ip_acknowledgements.force (a_value, a_key)
		ensure
			Item_added: attached ip_acknowledgements as att_ack and then att_ack.item (a_key) = a_value
		end

	remove_ip_acknowledgements_item (a_key: STRING)
			-- remove the key, value pair from `ip_acknowledgements'
		require
			Key_valid: ip_acknowledgements.has (a_key)
			Ip_acknowledgements_exists: attached ip_acknowledgements
		do
			if attached ip_acknowledgements as ack then
				ack.remove (a_key)
				if ack.is_empty then
					ip_acknowledgements := Void
				end
			end
		ensure
			Item_removed: not has_ip_acknowledgement (a_key)
			If_last_then_removed: old ip_acknowledgements.count = 1 implies not attached ip_acknowledgements
		end

	clear_ip_acknowledgements
			-- wipeout current items in `ip_acknowledgements' list
		do
			ip_acknowledgements := Void
		ensure
			not attached ip_acknowledgements
		end

	put_conversion_details_item (a_key, a_value: STRING)
			-- add the key, value pair to `conversion_details'; if it does not exist, create it
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		do
			if not attached conversion_details as att_cd then
				create conversion_details.make (0)
			end
			conversion_details.force (a_value, a_key)
		ensure
			Item_added: attached conversion_details as att_cd and then att_cd.item (a_key) = a_value
		end

	remove_conversion_details_item (a_key: STRING)
			-- remove the key, value pair from `conversion_details'
		require
			Key_valid: conversion_details.has (a_key)
		do
			if attached conversion_details as cd then
				cd.remove (a_key)
				if cd.is_empty then
					conversion_details := Void
				end
			end
		ensure
			Item_removed: not has_conversion_detail (a_key)
			If_last_then_removed: old conversion_details.count = 1 implies not attached conversion_details
		end

	clear_conversion_details
			-- wipeout current items in `conversion_details' list
		do
			conversion_details := Void
		ensure
			not attached conversion_details
		end

	add_other_contributor (a_contributor: STRING; at_pos: INTEGER)
			-- add a_contributor to `add_other_contributor' at position `at_pos', or end if i is 0
		require
			Contributor_valid: not a_contributor.is_empty
			Valid_max_index: attached other_contributors implies at_pos <= other_contributors.count
		do
			if other_contributors = Void then
				create other_contributors.make(0)
				other_contributors.compare_objects
			end
			if at_pos > 0 then
				other_contributors.go_i_th (at_pos)
				other_contributors.put_left (a_contributor)
			else
				other_contributors.extend (a_contributor)
			end
		ensure
			Other_contributor_set: other_contributors.has (a_contributor)
			Insert_position: at_pos > 0 implies other_contributors.i_th (at_pos) = a_contributor
		end

	remove_other_contributor (a_contributor: STRING)
			-- add a_contributor to add_other_contributor
		require
			Contributor_valid: other_contributors.has (a_contributor)
		do
			other_contributors.prune_all (a_contributor)
		ensure
			Other_contributor_set: not other_contributors.has (a_contributor)
		end

	clear_other_contributors
			-- wipeout current items in other_contributors list
		do
			other_contributors := Void
		ensure
			not attached other_contributors
		end

	set_resource_package_uri (a_uri: STRING)
			-- set `resource_package_uri'
		require
			Uri_valid: not a_uri.is_empty
		do
			create resource_package_uri.make_from_string (a_uri)
		ensure
			Archetype_package_uri_set: resource_package_uri.out.is_equal(a_uri)
		end

	clear_resource_package_uri
			-- clear `resource_package_uri'
		do
			resource_package_uri := Void
		ensure
			not attached resource_package_uri
		end

	set_lifecycle_state (a_lifecycle_state: STRING)
			-- set lifecycle_state
		require
			Lifecycle_state_valid: not a_lifecycle_state.is_empty
		do
			lifecycle_state := a_lifecycle_state
		ensure
			Lifecycle_state_set: lifecycle_state = a_lifecycle_state
		end

	add_detail (a_detail: RESOURCE_DESCRIPTION_ITEM)
			-- Add a language, value pair to `details'.
		require
			Detail_valid: valid_detail (a_detail)
		do
			details.put (a_detail, a_detail.language.code_string)
		ensure
			Details_set: details.has (a_detail.language.code_string)
		end

	add_original_language_details
			-- add a details object for the original language of the archetype
		do
			add_detail (create {RESOURCE_DESCRIPTION_ITEM}.make_from_language (original_language.code_string))
		end

	add_language (a_new_lang: STRING)
			-- add a new details object created from the object for orig_lang,
			-- with all string fields ready for translation
		require
			New_lang_valid: not details.has(a_new_lang)
		do
			add_detail (details.item (original_language.code_string).translated_copy (a_new_lang))
		end

	remove_detail, remove_language (a_lang: STRING)
			-- remove details item for a_lang from the resource
		require
			Lang_valid: details.has (a_lang)
		do
			details.remove (a_lang)
		end

	clear_details
			-- wipeout current items in details list
		do
			create details.make(0)
		end

	add_other_detail (a_key, a_value: STRING)
			-- Add the key, value pair to `other_details'.
		require
			Key_valid: not a_key.is_empty
		do
			if other_details = Void then
				create other_details.make (0)
			end

			if not a_value.is_empty then
				other_details.force (a_value, a_key)
			else
				other_details.remove (a_key)
			end
		ensure
			other_details_attached: attached other_details
			other_details_set: not a_value.is_empty implies other_details.item (a_key) = a_value
			other_details_removed: a_value.is_empty implies not other_details.has (a_key)
		end

	set_parent_resource (a_res: AUTHORED_RESOURCE)
			-- set parent_resource
		do
			parent_resource := a_res
		ensure
			Parent_resource_set: parent_resource = a_res
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("original_author")
			Result.extend ("original_namespace")
			Result.extend ("original_publisher")
			Result.extend ("custodian_namespace")
			Result.extend ("custodian_organisation")
			Result.extend ("copyright")
			Result.extend ("licence")
			Result.extend ("ip_acknowledgements")
			Result.extend ("other_contributors")
			Result.extend ("resource_package_uri")
			Result.extend ("details")
			Result.extend ("lifecycle_state")
			Result.extend ("other_details")
		end

invariant
	Original_author_valid: not original_author.is_empty
	Lifecycle_state_valid: not lifecycle_state.is_empty
	Parent_resource_valid: attached parent_resource implies parent_resource.description = Current
	Language_valid: attached parent_resource implies details.linear_representation.for_all
		(agent (rdi: RESOURCE_DESCRIPTION_ITEM):BOOLEAN do Result := parent_resource.languages_available.has(rdi.language.code_string) end)
	Copyright_valid: attached copyright as att_copyright implies not att_copyright.is_empty
	Ip_acknowledgements_valid: attached ip_acknowledgements as att_ack implies not att_ack.is_empty

end


