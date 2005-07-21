indexing
	component:   "openEHR Archetype Project"
	description: "Archetype meta-data details"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_DESCRIPTION_ITEM

inherit
	DT_CONVERTIBLE
		
create
	make, make_lang
	
feature -- Definitions

	Default_language: STRING is "en"
	
feature -- Initialisation

	make is
			-- 
		do
			create language.make (0)
			language.append(Default_language)
		end
		
	make_lang(a_lang, a_purpose: STRING) is
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

	set_purpose(a_purpose: STRING) is
			-- set purpose
		require
			Purpose_valid: a_purpose /= Void and then not a_purpose.is_empty
		do
			purpose := a_purpose
		ensure
			Purpose_set: purpose = a_purpose
		end

	set_use(a_use: STRING) is
			-- set use
		require
			Purpose_valid: a_use /= Void and then not a_use.is_empty
		do
			use := a_use
		ensure
			Use_set: use = a_use
		end

	set_misuse(a_misuse: STRING) is
			-- set misuse
		require
			Misuse_valid: a_misuse /= Void and then not a_misuse.is_empty
		do
			misuse := a_misuse
		ensure
			Misuse_set: misuse = a_misuse
		end

	set_copyright(a_copyright: STRING) is
			-- set copyright
		require
			Copyright_valid: a_copyright /= Void and then not a_copyright.is_empty
		do
			copyright := a_copyright
		ensure
			Copyright_set: copyright = a_copyright
		end

	add_keyword(a_keyword: STRING) is
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
		
	add_other_detail(a_key, a_value: STRING) is
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

	add_original_resource_uri(a_key, a_value: STRING) is
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
		
feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING] is
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
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
