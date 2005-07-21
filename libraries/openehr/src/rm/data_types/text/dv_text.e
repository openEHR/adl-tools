indexing
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

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/text/SCCS/s.dv_text.e $"
	revision:    "$Revision$"
	last_change: "$Date: 05/06/27 12:42:15+01:00 $"

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
	make, make_from_string, make_from_canonical_string

feature -- Definitions

	Default_language: CODE_PHRASE is 
			-- default is "en-au"
		once
			create Result.make("ISO:639-1(1988)::en-au")
		end
	
	Default_value:STRING is "(default)"

feature -- Initialization

	default_create is
		do
			language := Default_language.twin
			value := Default_value.twin
		ensure then
			Value_set: value.is_equal(Default_value)
			Language_set: language.is_equal(default_language)
		end

	make, make_from_string(str:STRING) is
			-- make from str of form "xxxxx(terminology::lang_code)"
			-- e.g. "tension de sang(ISO:639-1(1988)::fr-fr)"
		do
			value := str
		ensure then
			Value_set: value.is_equal(str)
		end

	make_from_canonical_string(str:STRING) is
			-- make from a string of the form
			-- <value>xxxx</value>
			-- <language>
			-- 		<terminology_id>
			--			<name>string</name>
			-- 			[<version_id>string</version_id>]
			-- 		</terminology_id>
			-- 		<code_string>string</code_string>
			-- </language>
			-- <charset>
			-- 		<terminology_id>
			--			<name>string</name>
			-- 			[<version_id>string</version_id>]
			-- 		</terminology_id>
			-- 		<code_string>string</code_string>
			-- </charset>
			-- [<hyperlink>DV_URI</hyperlink>]
			-- [<formatting>xxxx</formatting>]
			-- [<mappings>
			--		<item>
			-- 			<target>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 			</target>
			-- 			<match>character</match>
			-- 			[<purpose>DV_CODED_TEXT</purpose>]			
			-- 		</item>
			--		<item>TERM_MAPPING</item>
			-- <mappings>]
		local
			a_tm: TERM_MAPPING
			csr: INTEGER
		do
			value := xml_extract_from_tags(str, "value", 1)
			create language.make_from_canonical_string(xml_extract_from_tags(str, "language", 1))
			create encoding.make_from_canonical_string(xml_extract_from_tags(str, "encoding", 1))
			
			if xml_has_tag(str, "hyperlink", 1) then
				create hyperlink.make_from_canonical_string(xml_extract_from_tags(str, "hyperlink", 1))
			end
			
			if xml_has_tag(str, "formatting", 1) then
				formatting := xml_extract_from_tags(str, "formatting", 1)
			end
			
			csr := xml_tag_position(str, "mappings", 1)
			if csr > 0 then
				create mappings.make
				from
					csr := xml_tag_position(str, "item", csr)
				until
					csr = 0
				loop
					create a_tm.make_from_canonical_string(xml_extract_from_tags(str, "item", csr))
					mappings.extend(a_tm)
					csr := xml_tag_position(str, "item", csr)
				end
			end
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "value", 1) and xml_has_tag(str, "language", 1) and xml_has_tag(str, "charset", 1)
		end

feature -- Access

	value:STRING
			-- displayable rendition of the item, regardless of its underlying structure

	mappings: LINKED_LIST [TERM_MAPPING]
			-- terms mapped to this term

	formatting: STRING
			-- optional format string of the form "name:value; name:value...", 
			-- e.g. "font-weight : bold; font-family : Arial; font-size : 12pt;". 
			-- Values taken from W3C CSS2 properties lists "background" and "font".
	
	hyperlink: DV_URI
			-- optional link behind this item of text

	language: CODE_PHRASE
			-- The localised language in which the value is written. Coded from 
			-- openEHR Code Set “languages”.

	encoding: CODE_PHRASE
			-- Name of character set in which value expressed. Coded from openEHR 
			-- Code Set “character sets”.

feature -- Status Report

	has_mapping (other: CODE_PHRASE): BOOLEAN is
			-- True if there is any mapping `other' in the list of mappings
		do
			if mappings /= void then
				from
					mappings.start
				until
					mappings.off or else mappings.item.target.is_equal(other)
				loop
					mappings.forth
				end
				Result := not mappings.off
			end
		end
	
feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- two DV_TEXTs are equal as long as their values (rubrics) are lexically the same
		do
			Result := value.is_equal (other.value)
		end
	
feature -- Modification

	add_mapping (a_target: CODE_PHRASE; a_match:CHARACTER; a_purpose: DV_CODED_TEXT) is
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

	as_string: STRING is
		do
			create Result.make(0)

		end
	
	as_canonical_string: STRING is
		do
			create Result.make(0)
			Result.append("<value>" + value + "</value>")
			if language /= Void then
				Result.append("<language>" + language.as_canonical_string + "</language>")			
			end
			if encoding /= Void then
				Result.append("<encoding>" + encoding.as_canonical_string + "</encoding>")				
			end
			
			if mappings /= Void then
				Result.append("<mappings>")
				from mappings.start
				until mappings.off
				loop Result.append("<item>" + mappings.item.as_canonical_string + "</item>")
				end
				Result.append("</mappings>")
			end
			
			if formatting /= Void then
				Result.append("<formatting>" + formatting + "</formatting>")
			end
			
			if hyperlink /= Void then
				Result.append("<hyperlink>" + hyperlink.as_canonical_string + "</hyperlink>")
			end
		end
	
feature {DV_TEXT} -- Implementation

	hash_code: INTEGER is
		do
			Result := value.hash_code
		end
	
invariant
	Value_valid: value /= void and then not value.is_empty and then not 
		(value.has(CR) or value.has(LF))	
	Mappings_valid: mappings /= void implies not mappings.is_empty
	Formatting_valid: formatting /= void implies not formatting.is_empty

	Language_valid: language /= Void and then code_set("languages").has(language)
	Encoding_valid: encoding /= Void and then code_set("character sets").has(encoding)

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
