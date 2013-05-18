note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract type representing any kind of atomic text item, coded or uncoded. 
				 Note that 'atomic text item' includes coded items, i.e. TERM_TEXTs, which
				 themselves may be a code phrase, since TERM_TEXT allows qualifiers.
				 ]"
	keywords:    "text, data"
	requirements:"ISO 18308 TS V1.0 STR 2.6, 2.9"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DV_TEXT

inherit
	DATA_VALUE
		undefine
			is_equal
		end

	HASHABLE
		export
			{NONE} all
		redefine
			is_equal
		end

	MATCH_CODES
		export
			{NONE} all;
			{ANY} is_valid_match_code, generating_type, twin
		undefine
			is_equal
		end

	EXTERNAL_ENVIRONMENT_ACCESS
		undefine
			is_equal
		end

create
	make, make_from_string

feature -- Definitions

	Default_value: STRING = "(default)"

feature -- Initialization

	make, make_from_string (str: STRING)
			-- make from str of form "xxxxx(terminology::lang_code)"
			-- e.g. "tension de sang(ISO:639-1(1988)::fr-fr)"
		do
			value := str
		ensure then
			Value_set: value.is_equal (str)
		end

feature -- Access

	value: STRING
			-- displayable rendition of the item, regardless of its underlying structure
		attribute
			create Result.make_from_string (Default_value)
		end

	mappings: detachable LINKED_LIST [TERM_MAPPING]
			-- terms mapped to this term

	formatting: detachable STRING
			-- optional format string of the form "name:value; name:value...",
			-- e.g. "font-weight : bold; font-family : Arial; font-size : 12pt;".
			-- Values taken from W3C CSS2 properties lists "background" and "font".

	hyperlink: detachable DV_URI
			-- optional link behind this item of text

	language: CODE_PHRASE
			-- The localised language in which the value is written. Coded from
			-- openEHR Code Set “languages”.
		attribute
			Result := Default_language_code
		end

	encoding: CODE_PHRASE
			-- Name of character set in which value expressed. Coded from openEHR
			-- Code Set “character sets”.
		attribute
			Result := Default_encoding_code
		end

feature -- Status Report

	has_mapping (other: CODE_PHRASE): BOOLEAN
			-- True if there is any mapping `other' in the list of mappings
		do
			if attached mappings as mpgs then
				Result := across mpgs as mpgs_csr some mpgs_csr.item.target.is_equal(other) end
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- two DV_TEXTs are equal as long as their values (rubrics) are lexically the same
		do
			Result := value.is_equal (other.value)
		end

feature -- Modification

	add_mapping (a_target: CODE_PHRASE; a_match: CHARACTER; a_purpose: DV_CODED_TEXT)
		require
			mapping: not has_mapping (a_target)
			match: is_valid_match_code (a_match)
		local
			tm: TERM_MAPPING
			new_mappings: LINKED_LIST [TERM_MAPPING]
		do
			create tm.make (a_target, a_match, a_purpose)
			if attached mappings as mpgs then
				mpgs.extend (tm)
			else
				create new_mappings.make
				mappings := new_mappings
				new_mappings.compare_objects
				new_mappings.extend (tm)
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			Result.append (value)
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


