indexing
	component:   "openEHR Data Types"

	description: "A mapping of a term to a text item."
	keywords:    "term, text"

	requirements:"ISO 18308 TS V1.0 STR 4.5"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/text/SCCS/s.term_mapping.e $"
	revision:    "$Revision$"
	last_change: "$Date: 05/06/27 12:42:15+01:00 $"


class TERM_MAPPING

inherit
	EXTERNAL_ENVIRONMENT_ACCESS

	CANONICAL_FRAGMENT
	
	MATCH_CODES
		export
			{NONE} all;
			{ANY} is_valid_match_code
		end
	
create 
	make, make_from_canonical_string

feature -- Initialization

	make(a_target: CODE_PHRASE; a_match: CHARACTER; a_purpose: DV_CODED_TEXT) is
			-- 
		require
			Term_exists: a_target /= Void
			Valid_match_code: is_valid_match_code(a_match)
			Purpose_valid: a_purpose /= Void
		do
			target := a_target
			match := a_match
			purpose := a_purpose			
		ensure
			Target_set: target = a_target
			Match_set: match = a_match
			Purpose_set: purpose = a_purpose
		end

	make_from_canonical_string(str: STRING) is
			-- make from a string of the form:
			--
			-- <target>
			-- 		<terminology_id>
			--			<name>string</name>
			-- 			[<version_id>string</version_id>]
			-- 		</terminology_id>
			-- 		<code_string>string</code_string>
			-- </target>
			-- <match>character</match>
			-- [<purpose>DV_CODED_TEXT</purpose>]
		do
			create target.make_from_canonical_string(xml_extract_from_tags(str, "target", 1))
			match := xml_extract_from_tags(str, "match", 1).item(1)
			if xml_has_tag(str, "purpose", 1) then
				create purpose.make_from_canonical_string(xml_extract_from_tags(str, "purpose", 1))
			end
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "target", 1) and xml_has_tag(str, "match", 1)
		end

feature -- Access

	target: CODE_PHRASE
	
	match: CHARACTER
			-- The relative match of the target term with respect to the mapped text item. 
			-- Result meanings:
			-- 	‘>’: the mapping is to a broader term
			-- 			e.g. orginal text = “arbovirus infection”, target = “viral infection”
			-- 	‘=’: the mapping is to a (supposedly) equivalent to the original item
			--  ‘<’: the mapping is to a narrower term. e.g. original text = “diabetes”, mapping
			-- 			= “diabetes mellitus”.
			-- 	‘?’: the kind of mapping is unknown. 
			-- The first three values are taken from the ISO standards 2788 (“Guide to Establishment
			-- and development of monolingual thesauri”) and 5964 (“Guide to Establishment
			-- and development of multilingual thesauri”).

	purpose: DV_CODED_TEXT
			-- Purpose of the mapping e.g. "automated data mining", "billing", "epidemiology"

feature -- Output

	as_string: STRING is
			-- Result in form "-> <target> (<match>; <purpose>)
		do
			Result := target.as_string + " (" + match_codes.item(match) + "; "
			if purpose /= Void then
				Result.append(purpose.as_string + ")")
			else
				Result.append(")")
			end
		end

	as_canonical_string: STRING is
			-- Result in canonical form
		do
			create Result.make(0)
			Result.append("<target>" + target.as_canonical_string + "</target>")
			Result.append("<match>" + match.out + "</match>")
			if purpose /= Void then
				Result.append("<purpose>" + purpose.as_canonical_string + "</purpose>")
			end
		end

invariant
	Target_exists: target /= Void
	Match_valid: is_valid_match_code(match)
	Purpose_valid: purpose /= Void implies 
		terminology("openehr").codes_for_group_name("term mapping purpose", "en").has(purpose.defining_code)

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
--| The Original Code is term_mapping.e.
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
