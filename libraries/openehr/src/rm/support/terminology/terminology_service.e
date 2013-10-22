note
	component:   "openEHR ADL Tools"

	description: "Simple terminology service interface definition"
	keywords:    "terminology, vocabulary, identifiers"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TERMINOLOGY_SERVICE

inherit
	BASIC_DEFINITIONS

	OPENEHR_TERMINOLOGY_GROUP_IDENTIFIERS

	OPENEHR_CODE_SET_IDENTIFIERS

feature -- Definitions

	Default_language_code_set: STRING = "ISO_639-1"

	Default_language_code: TERMINOLOGY_CODE
		once
			create Result.make (Default_language_code_set, Default_language)
		end

	Default_encoding_code_set: STRING = "IANA_RFC2978"

	Default_encoding_code: TERMINOLOGY_CODE
		once
			create Result.make (Default_encoding_code_set, Default_encoding)
		end

feature -- Access

	terminology (name: STRING): TERMINOLOGY_ACCESS
			-- return a terminology access object for a terminology identified in openEHR by openehr_id
			-- Allowable names are:
			--    * official names from the US NLM UMLS meta-data list at http://www.nlm.nih.gov/research/umls/metaa1.html
			--    * "openehr"
			--    * "cen13606-3"
		require
			id_valid: has_terminology (name)
		do
			check attached terminologies.item (name.as_lower) as t then Result := t end
		end

	code_set (code_set_id: STRING): CODE_SET_ACCESS
			-- Allowable names are taken from OPENEHR_CODE_SET_IDENTIFIERS class
		require
			id_valid: has_code_set (code_set_id)
		do
			check attached code_sets.item (code_set_id.as_lower) as c then Result := c end
		end

feature -- Status Report

	has_terminology (a_name: STRING): BOOLEAN
			-- True if terminology with name is known by this service
			-- Allowable names are:
			--    * official names from the US NLM UMLS meta-data list at http://www.nlm.nih.gov/research/umls/metaa1.html
			--    * "openehr"
			--    * "cen13606-3"
		require
			name_valid: not a_name.is_empty
		do
			Result := terminologies.has (a_name.as_lower)
		end

	has_code_set (name: STRING): BOOLEAN
			-- True if code set with name is known by this service
			-- Allowable names are taken from OPENEHR_CODE_SET_IDENTIFIERS class
		require
			name_valid: not name.is_empty
		do
			Result := code_sets.has (name.as_lower)
		end

feature -- Modification

	add_terminology (a_name: STRING)
		require
			not has_terminology (a_name)
		do
			terminologies.put (create {TERMINOLOGY_ACCESS}.make (a_name), a_name.as_lower)
		end

feature {NONE} -- Implementation

	terminologies: HASH_TABLE [TERMINOLOGY_ACCESS, STRING]
		once
			create Result.make (0)
		end

	code_sets: HASH_TABLE [CODE_SET_ACCESS, STRING]
		once
			create Result.make (0)
		end

end



