note
	component:   "openEHR Data Types"

	description: "A mapping of a term to a text item."
	keywords:    "term, text"

	requirements:"ISO 18308 TS V1.0 STR 4.5"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class TERM_MAPPING

inherit
	EXTERNAL_ENVIRONMENT_ACCESS

	MATCH_CODES
		export
			{NONE} all;
			{ANY} is_valid_match_code
		end

create
	make

feature -- Initialization

	make (a_target: attached CODE_PHRASE; a_match: CHARACTER; a_purpose: attached DV_CODED_TEXT)
			--
		require
			Valid_match_code: is_valid_match_code(a_match)
		do
			target := a_target
			match := a_match
			purpose := a_purpose
		ensure
			Target_set: target = a_target
			Match_set: match = a_match
			Purpose_set: purpose = a_purpose
		end

feature -- Access

	target: attached CODE_PHRASE

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

	as_string: STRING
			-- Result in form "-> <target> (<match>; <purpose>)
		do
			Result := target.as_string + " (" + match_codes.item(match) + "; "
			if purpose /= Void then
				Result.append (purpose.as_string + ")")
			else
				Result.append (")")
			end
		end

invariant
	Match_valid: is_valid_match_code(match)
	Purpose_valid: purpose /= Void implies
		terminology(terminology_id_openehr).has_code_for_group_id (Group_id_term_mapping_purpose, purpose.defining_code)

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
