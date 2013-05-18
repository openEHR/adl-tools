note
	component:   "openEHR ADL Tools"
	description: "A mapping of a term to a text item."
	keywords:    "term, text"
	requirements:"ISO 18308 TS V1.0 STR 4.5"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	make (a_target: CODE_PHRASE; a_match: CHARACTER; a_purpose: detachable DV_CODED_TEXT)
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

	purpose: detachable DV_CODED_TEXT
			-- Purpose of the mapping e.g. "automated data mining", "billing", "epidemiology"

feature -- Output

	as_string: STRING
			-- Result in form "-> <target> (<match>; <purpose>)
		do
			Result := target.as_string + " (" + match_code (match) + "; "
			if attached purpose as p then
				Result.append (p.as_string + ")")
			else
				Result.append (")")
			end
		end

invariant
	Match_valid: is_valid_match_code(match)
	Purpose_valid: purpose /= Void implies
		terminology (terminology_id_openehr).has_code_for_value_set (Group_id_term_mapping_purpose, purpose.defining_code)

end


