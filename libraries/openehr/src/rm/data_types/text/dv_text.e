note
	component:   "openEHR Data Types"

	description: "[
				 Abstract type representing any kind of atomic text item, coded or uncoded. 
				 Note that 'atomic text item' includes coded items, i.e. TERM_TEXTs, which
				 themselves may be a code phrase, since TERM_TEXT allows qualifiers.
				 ]"
	keywords:    "text, data"

	requirements:"ISO 18308 TS V1.0 STR 2.6, 2.9"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_TEXT

inherit
	DATA_VALUE
		undefine
			is_equal
		redefine
			default_create
		end

	HASHABLE
		export
			{NONE} all
		undefine
			default_create
		redefine
			is_equal
		end

	MATCH_CODES
		export
			{NONE} all;
			{ANY} is_valid_match_code, generating_type, twin
		undefine
			is_equal, default_create
		end

	EXTERNAL_ENVIRONMENT_ACCESS
		undefine
			default_create, is_equal
		end

create
	default_create,
	make, make_from_string

feature -- Definitions

	Default_value: STRING = "(default)"

feature -- Initialization

	default_create
		do
			language := Default_language_code.deep_twin
			value := Default_value.twin
		ensure then
			Value_set: value.is_equal(Default_value)
			Language_set: language.code_string.is_equal(default_language)
		end

	make, make_from_string (str: STRING)
			-- make from str of form "xxxxx(terminology::lang_code)"
			-- e.g. "tension de sang(ISO:639-1(1988)::fr-fr)"
		do
			value := str
		ensure then
			Value_set: value.is_equal(str)
		end

feature -- Access

	value: attached STRING
			-- displayable rendition of the item, regardless of its underlying structure

	mappings: LINKED_LIST [TERM_MAPPING]
			-- terms mapped to this term

	formatting: STRING
			-- optional format string of the form "name:value; name:value...",
			-- e.g. "font-weight : bold; font-family : Arial; font-size : 12pt;".
			-- Values taken from W3C CSS2 properties lists "background" and "font".

	hyperlink: DV_URI
			-- optional link behind this item of text

	language: attached CODE_PHRASE
			-- The localised language in which the value is written. Coded from
			-- openEHR Code Set “languages”.

	encoding: attached CODE_PHRASE
			-- Name of character set in which value expressed. Coded from openEHR
			-- Code Set “character sets”.

feature -- Status Report

	has_mapping (other: attached CODE_PHRASE): BOOLEAN
			-- True if there is any mapping `other' in the list of mappings
		do
			if attached mappings then
				from mappings.start until mappings.off or else mappings.item.target.is_equal(other) loop
					mappings.forth
				end
				Result := not mappings.off
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- two DV_TEXTs are equal as long as their values (rubrics) are lexically the same
		do
			Result := value.is_equal (other.value)
		end

feature -- Modification

	add_mapping (a_target: CODE_PHRASE; a_match:CHARACTER; a_purpose: DV_CODED_TEXT)
		require
			mapping: a_target /= void and then not has_mapping (a_target)
			match: is_valid_match_code(a_match)
			purpose_valid: a_purpose /= void
		local
			tm: TERM_MAPPING
		do
			if mappings = void then
				create mappings.make
				mappings.compare_objects
			end
			create tm.make(a_target, a_match, a_purpose)
			mappings.extend (tm)
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)

		end

feature {DV_TEXT} -- Implementation

	hash_code: INTEGER
		do
			Result := value.hash_code
		end

invariant
	Value_valid: not value.is_empty and then not
		(value.has(CR) or value.has(LF))
	Mappings_valid: mappings /= void implies not mappings.is_empty
	Formatting_valid: formatting /= void implies not formatting.is_empty

	Language_valid: code_set(Code_set_id_languages).has(language)
	Encoding_valid: code_set(Code_set_id_character_sets).has(encoding)

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
--| The Original Code is dv_text.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
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
