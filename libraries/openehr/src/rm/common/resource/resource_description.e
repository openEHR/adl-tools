note
	component:   "openEHR ADL Tools"
	description: "Resource descriptive meta-data"
	keywords:    "resource, meta-data"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
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
	make, make_dt, make_language

feature -- Definitions

	Default_original_author: STRING = "????"

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
		end

	make (an_author_name, orig_lang: STRING)
			-- make a description with author name and language
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

	make_language (orig_lang: STRING)
			-- make a description with just language
		require
			Language_valid: not orig_lang.is_empty
		do
			create original_language.make(default_language_code_set, orig_lang)
		ensure
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

	original_namespace: detachable STRING
			-- Original namespace of this archetype as a reverse domain name

	original_publisher: detachable STRING
			-- Original publisher of this archetype as a string name

	custodian_namespace: detachable STRING
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
			-- list of translatable descriptive details, keyed by language
        attribute
            create Result.make (0)
        end

	other_contributors: detachable ARRAYED_LIST [STRING]
			-- Other contributors to the resource, probably listed in “name <email>” form

	references: detachable HASH_TABLE [STRING, STRING]

	other_details: detachable HASH_TABLE [STRING, STRING]

	parent_resource: detachable AUTHORED_RESOURCE
			-- Reference to owning resource.

	resource_package_uri: detachable URI
			-- URI of archetype package

	languages: ARRAYED_SET [STRING]
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

	has_ip_acknowledgements (a_key: STRING): BOOLEAN
		do
			Result := attached ip_acknowledgements as att_ack and then att_ack.has (a_key)
		end

	has_conversion_details (a_key: STRING): BOOLEAN
		do
			Result := attached conversion_details as att_cd and then att_cd.has (a_key)
		end

	has_other_contributors (a_key: STRING): BOOLEAN
		do
			Result := attached other_contributors as att_oc and then att_oc.has (a_key)
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

	set_original_namespace (a_namespace: STRING)
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

	set_custodian_namespace (a_namespace: STRING)
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
		local
			ipa: attached like ip_acknowledgements
		do
			if attached ip_acknowledgements as att_ipa then
				ipa := att_ipa
			else
				create ipa.make (0)
				ip_acknowledgements := ipa
			end
			ipa.force (a_value, a_key)
		ensure
			Item_added: attached ip_acknowledgements as att_ipa and then att_ipa.item (a_key) = a_value
		end

	remove_ip_acknowledgements_item (a_key: STRING)
			-- remove the key, value pair from `ip_acknowledgements'
		require
			Key_valid: has_ip_acknowledgements (a_key)
			Ip_acknowledgements_exists: attached ip_acknowledgements
		do
			if attached ip_acknowledgements as att_ipa then
				att_ipa.remove (a_key)
				if att_ipa.is_empty then
					ip_acknowledgements := Void
				end
			end
		ensure
			Item_removed: not has_ip_acknowledgements (a_key)
			If_last_then_removed: attached old ip_acknowledgements as att_old_ipa and then att_old_ipa.count = 1 implies not attached ip_acknowledgements
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
		local
			cd: attached like conversion_details
		do
			if attached conversion_details as att_cd then
				cd := att_cd
			else
				create cd.make (0)
				conversion_details := cd
			end
			cd.force (a_value, a_key)
		ensure
			Item_added: attached conversion_details as att_cd and then att_cd.item (a_key) = a_value
		end

	remove_conversion_details_item (a_key: STRING)
			-- remove the key, value pair from `conversion_details'
		require
			Key_valid: has_conversion_details (a_key)
		do
			if attached conversion_details as att_cd then
				att_cd.remove (a_key)
				if att_cd.is_empty then
					conversion_details := Void
				end
			end
		ensure
			Item_removed: not has_conversion_details (a_key)
			If_last_then_removed: attached old conversion_details as att_old_cd and then att_old_cd.count = 1 implies not attached conversion_details
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
			Valid_max_index: attached other_contributors as att_oc implies at_pos <= att_oc.count
		local
			oc: attached like other_contributors
		do
			if attached other_contributors as att_oc then
				oc := att_oc
			else
				create oc.make(0)
				oc.compare_objects
				other_contributors := oc
			end
			if at_pos > 0 then
				oc.go_i_th (at_pos)
				oc.put_left (a_contributor)
			else
				oc.extend (a_contributor)
			end
		ensure
			attached other_contributors as att_oc and then (att_oc.has (a_contributor) and
				at_pos > 0 implies att_oc.i_th (at_pos) = a_contributor)
		end

	remove_other_contributor (a_contributor: STRING)
			-- add a_contributor to add_other_contributor
		require
			Contributor_valid: has_other_contributors (a_contributor)
		do
			if attached other_contributors as att_oc then
				att_oc.prune_all (a_contributor)
			end
		ensure
			Other_contributor_set: not has_other_contributors (a_contributor)
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
			Archetype_package_uri_set: attached resource_package_uri as att_rpu and then att_rpu.out.is_equal (a_uri)
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
			if attached details.item (original_language.code_string) as att_details then
				add_detail (att_details.translated_copy (a_new_lang))
			end
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

	put_other_details_item (a_key, a_value: STRING)
			-- Add the key, value pair to `other_details'. Will replace any
			-- existing value for the same key
		require
			Key_valid: not a_key.is_empty
		local
			dets: attached like other_details
		do
			if attached other_details as att_od then
				dets := att_od
			else
				create dets.make (0)
				other_details := dets
			end

			dets.force (a_value, a_key)
		ensure
			other_details_attached: attached other_details as od and then od.item (a_key) = a_value
		end

	remove_other_details_item (a_key: STRING)
			-- Remove the key, value pair from `other_details'.
		require
			Key_valid: not a_key.is_empty
		do
			if attached other_details as att_od then
				att_od.remove (a_key)
			end
		ensure
			key_removed: attached other_details as od and then not od.has (a_key)
		end

	put_references_item (a_key, a_value: STRING)
			-- Add the key, value pair to `references'. Will replace any
			-- existing value for the same key
		require
			Key_valid: not a_key.is_empty
		local
			dets: attached like references
		do
			if attached references as att_od then
				dets := att_od
			else
				create dets.make (0)
				references := dets
			end

			dets.force (a_value, a_key)
		ensure
			references_attached: attached references as od and then od.item (a_key) = a_value
		end

	remove_references_item (a_key: STRING)
			-- Remove the key, value pair from `references'.
		require
			Key_valid: not a_key.is_empty
		do
			if attached references as att_od then
				att_od.remove (a_key)
			end
		ensure
			key_removed: attached references as od and then not od.has (a_key)
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
			Result.extend ("references")
			Result.extend ("conversion_details")
			Result.extend ("other_details")
		end

invariant
	Original_author_valid: not original_author.is_empty
	Lifecycle_state_valid: not lifecycle_state.is_empty
	Parent_resource_valid: attached parent_resource as att_pr implies att_pr.description = Current
	Language_valid: attached parent_resource as att_pr implies details.linear_representation.for_all
		(agent (rdi: RESOURCE_DESCRIPTION_ITEM; auth_res: AUTHORED_RESOURCE): BOOLEAN do Result := auth_res.languages_available.has (rdi.language.code_string) end (?, att_pr))
	Copyright_valid: attached copyright as att_copyright implies not att_copyright.is_empty
	Ip_acknowledgements_valid: attached ip_acknowledgements as att_ipa implies not att_ipa.is_empty

end


