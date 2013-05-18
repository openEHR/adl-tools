note
	component:   "openEHR ADL Tools"

	description: "[
	              Links used to record bidirectional relationships between archetyped structures 
			  in the record, including across transactions.
			  ]"
	keywords:    "link, path"
	requirements:""

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class LINK
	
create
	make, make_from_display_string, make_from_canonical_string

feature -- Initialization

	make, make_from_display_string(str:STRING)
			-- make from a single string
		do
			-- TO_BE_IMPLEM
		end

	make_from_canonical_string(str:STRING)
			-- make from a canonical string
		do
			-- TO_BE_IMPLEM
		end

feature -- Access

	target: DV_EHR_URI
			-- the LOCATABLE element considered to be the logical target of the link.
			-- Typically an ARCHETYPED element rather than an interior element (such as
			-- an organiser).

	meaning: DV_TEXT
			-- Used to describe the relationship, usually in clinical terms, such as 
			-- "in response to" (the relationship between test results and an order), 
			-- "follow-up to" and so on. Such relationships can represent any clinically 
			-- meaningful connection between pieces of information. 
			-- Value for meaning include those described in Annex C, ENV 13606:2 
			-- under the categories of "generic", "documenting and reporting", 
			-- "organisational", "clinical", "circumstancial", and "view management".

	type: DV_TEXT
			-- indicates a clinical or domain-level meaning for the kind of link, for example 
			-- "problem thread" or "see also". If type values are designed appropriately, they 
			-- can be used by the requestor of EHR extracts to categorise links which must be
			-- followed and which can be broken when the extract is created.
			
feature -- Output

	as_display_string: STRING
			-- string form displayable for humans
		do
			create Result.make(0)
		end
	
	as_canonical_string: STRING
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := "<target>" + target.as_canonical_string + "</target>" +
				"<meaning>" + meaning.as_canonical_string + "</meaning>"
					
		end
		
invariant
	meaning_exists: meaning /= Void
	type_exists: type /= Void
	target_exists: target /= Void

end


