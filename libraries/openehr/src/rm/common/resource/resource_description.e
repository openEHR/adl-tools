note
	component:   "openEHR Common Information Model"
	description: "Resource descriptive meta-data"
	keywords:    "resource, meta-data"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class RESOURCE_DESCRIPTION

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

	TERMINOLOGY_SERVICE
		export
			{NONE} all
		undefine
			default_create
		end

create
	make, make_dt, default_create

feature -- Definitions

	Default_lifecycle_state: STRING = "initial"

	Default_original_author: STRING = "????"

feature -- Initialisation

	default_create
			--
		do
			lifecycle_state := Default_lifecycle_state.twin
			create details.make (0)
			create original_author.make (0)
			put_original_author_item ("name", Default_original_author)
			create original_language.make (default_language_code_set, default_language)
		ensure then
			lifecycle_state_set: lifecycle_state.is_equal (Default_lifecycle_state)
		end

	make_dt (make_args: ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
			default_create
		end

	make (an_author_name, orig_lang: attached STRING)
			-- make an empty description
		require
			An_author_name_exists: not an_author_name.is_empty
			Language_valid: not orig_lang.is_empty
		do
			default_create
			put_original_author_item ("name", an_author_name)
			create original_language.make(default_language_code_set, orig_lang)
		ensure
			Original_author_item_set: original_author.item ("name") = an_author_name
			Original_language_set: original_language.code_string.is_equal(orig_lang)
		end

feature -- Access

	original_author: HASH_TABLE [STRING, STRING]
			-- Original author of this archetype, with all relevant details,
			-- including organisation.

	resource_package_uri: detachable URI
			-- URI of archetype package

	details: detachable HASH_TABLE [RESOURCE_DESCRIPTION_ITEM, STRING]
			-- list of descriptive details, keyed by language

	lifecycle_state: STRING
			-- Lifecycle state of the archetype. Includes states such as
			-- submitted, experimental, awaiting_approval, approved,
			-- superseded, obsolete. State machine defined by archetype system

	other_contributors: detachable ARRAYED_LIST [STRING]
			-- Other contributors to the resource, probably listed in “name <email>” form

	other_details: detachable HASH_TABLE [STRING, STRING]

	parent_resource: detachable AUTHORED_RESOURCE
			-- Reference to owning resource.

	languages: attached ARRAYED_SET[STRING]
			-- list of all languages in details
		do
			create Result.make(0)
			from details.start until details.off loop
				Result.extend (details.key_for_iteration.twin)
				details.forth
			end
		end

	detail_for_language (a_lang: attached STRING): RESOURCE_DESCRIPTION_ITEM
			-- get the RESOURCE_DESCRIPTION_ITEM for a_lang
		require
			Language_valid: details.has (a_lang)
		do
			Result := details.item(a_lang)
		end

	original_language: CODE_PHRASE
			-- a copy of original_language from parent object

feature -- Comparison

	valid_detail (a_detail: attached RESOURCE_DESCRIPTION_ITEM): BOOLEAN
			-- is a_detail valid to be added to details list? Checks to see
			-- that two detail objects both with is_original_language set
			-- cannot be added.
		do
			if not details.has (a_detail.language.code_string) then
				if a_detail.is_original_language then
					from details.start until details.off or details.item_for_iteration.is_original_language loop
						details.forth
					end
				end
				Result := not details.off
			end
		end

feature -- Modification

	put_original_author_item (a_key, a_value: attached STRING)
			-- add the key, value pair to original_author
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		do
			original_author.force (a_value, a_key)
		ensure
			Original_author_set: original_author.item (a_key) = a_value
		end

	remove_original_author_item (a_key: attached STRING)
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
		end

	add_other_contributor (a_contributor: attached STRING)
			-- add a_contributor to add_other_contributor
		require
			Contributor_valid: not a_contributor.is_empty
		do
			if other_contributors = Void then
				create other_contributors.make(0)
				other_contributors.compare_objects
			end
			other_contributors.extend (a_contributor)
		ensure
			Other_contributor_set: other_contributors.has(a_contributor)
		end

	remove_other_contributor (a_contributor: attached STRING)
			-- add a_contributor to add_other_contributor
		require
			Contributor_valid: other_contributors.has (a_contributor)
		do
			other_contributors.prune_all (a_contributor)
		ensure
			Other_contributor_set: not other_contributors.has(a_contributor)
		end

	clear_other_contributors
			-- wipeout current items in other_contributors list
		do
			create other_contributors.make(0)
		end

	set_resource_package_uri (a_uri: attached STRING)
			-- set resource_package_uri
		require
			Uri_valid: not a_uri.is_empty
		do
			create resource_package_uri.make_from_string(a_uri)
		ensure
			Archetype_package_uri_set: resource_package_uri.out.is_equal(a_uri)
		end

	set_lifecycle_state (a_lifecycle_state: attached STRING)
			-- set lifecycle_state
		require
			Lifecycle_state_valid: not a_lifecycle_state.is_empty
		do
			lifecycle_state := a_lifecycle_state
		ensure
			Lifecycle_state_set: lifecycle_state = a_lifecycle_state
		end

	add_detail (a_detail: attached RESOURCE_DESCRIPTION_ITEM)
			-- Add a language, value pair to `details'.
		require
			Detail_valid: valid_detail(a_detail)
		do
			details.force(a_detail, a_detail.language.code_string)
		ensure
			Details_set: details.has(a_detail.language.code_string)
		end

	add_language (a_new_lang: attached STRING)
			-- add a new details object created from the object for orig_lang,
			-- with all string fields ready for translation
		require
			New_lang_valid: not details.has(a_new_lang)
		do
			add_detail(details.item (original_language.code_string).translated_copy (a_new_lang))
		end

	remove_detail, remove_language (a_lang: attached STRING)
			-- remove details item for a_lang from the resource
		require
			Lang_valid: details.has(a_lang)
		do
			details.remove (a_lang)
		end

	clear_details
			-- wipeout current items in details list
		do
			create details.make(0)
		end

	add_other_detail (a_key, a_value: attached STRING)
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

	set_parent_resource (a_res: attached AUTHORED_RESOURCE)
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
--| The Original Code is archetype_description.e.
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
