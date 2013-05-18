note
	component:   "openEHR ADL Tools"

	description: "[
				  Codes for mapping of a term to a text item:
				  The relative match of the target term with respect to the mapped text item. 
				 	‘>’: the mapping is to a broader term
				 			e.g. orginal text = “arbovirus infection”, target = “viral infection”
				 	‘=’: the mapping is to a (supposedly) equivalent to the original item
				 	‘<’: the mapping is to a narrower term. e.g. original text = “diabetes”, mapping
				 			= “diabetes mellitus”.
				 	‘?’: the kind of mapping is unknown. 
				   The first three values are taken from the ISO standards 2788 (“Guide to Establishment
				   and development of monolingual thesauri”) and 5964 (“Guide to Establishment
				   and development of multilingual thesauri”).
				  ]"
	keywords:    "term, text"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class MATCH_CODES

feature -- Access

	match_codes: HASH_TABLE [STRING, CHARACTER]
			-- correspondence of match codes and meanings
		once
			create Result.make(0)
			Result.put("broader", '>')
			Result.put("equivalent", '=')
			Result.put("narrower", '<')
			Result.put("unknown", '?')
		end

	match_code (a_code: CHARACTER): STRING
		require
			is_valid_match_code (a_code)
		do
			create Result.make_empty
			if attached match_codes.item (a_code) as mc then
				Result.append (mc)
			end
		end

feature -- Status

	is_valid_match_code (c: CHARACTER): BOOLEAN
		do
			Result := c = '<' or c = '=' or c = '>' or c = '?'
		end

end


