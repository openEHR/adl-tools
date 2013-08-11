note
	component:   "openEHR ADL Tools"
	description: "[
			 Code phrase, possibly coordinated by terminology service; consisting of
			 a key, which is parsable into a terminology id and a code string,
			 representing the key within the terminology service for the intended
			 concept, from the given terminology.
			 The format of the key is:
			 	terminology_id SEP code_string
			 ]"
	keywords:    "text, data"
	requirements:"ISO 18308 TS V1.0 STR 4.2"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CODE_PHRASE

inherit
	COMPARABLE
		undefine
			out
		end

create
	default_create, make, make_from_string, make_from_terminology_code

convert
	make_from_terminology_code ({TERMINOLOGY_CODE}),
	as_terminology_code: {TERMINOLOGY_CODE}

feature -- Definitions

	default_code_string: STRING = "000001"

	separator: STRING = "::"

feature -- Initialization

	make_from_terminology_code (a_terminology_code: TERMINOLOGY_CODE)
			-- create from the ODIN primitive type TERMINOLOGY_CODE
		do
			create terminology_id.make (a_terminology_code.terminology_id)
			create code_string.make_from_string (a_terminology_code.code_string)
		end

	make_from_string (a_key: STRING)
			-- make from a string of the form terminology_id::code_string, e.g. ICD10(1998)::M10
			-- the form terminology_id:: is also allowable, in which case the default_code_string will
			-- be used
		require
			Key_valid: not a_key.is_empty
		local
			sep_pos: INTEGER
		do
			sep_pos := a_key.substring_index (separator, 1)
			create terminology_id.make (a_key.substring (1, sep_pos-1))
			if a_key.count >= sep_pos + separator.count then
				code_string := a_key.substring (sep_pos+separator.count, a_key.count)
			else
				code_string := default_code_string.twin
			end
		end

	make (a_terminology_id, a_code_string: STRING)
			-- make from two strings
		require
			Terminology_id_valid: not a_terminology_id.is_empty
			Code_string_valid: not a_code_string.is_empty
		do
			create terminology_id.make (a_terminology_id)
			code_string := a_code_string
		ensure
			Terminology_id_set: terminology_id.value.is_equal(a_terminology_id)
			Code_string_set: code_string = a_code_string
		end

feature -- Status Report

	is_local: BOOLEAN
			-- True if this terminology id = "local"
		do
			Result := terminology_id.is_local
		end

feature -- Access

	terminology_id: TERMINOLOGY_ID
			-- Identifier of the distinct terminology from which the code_string
			-- (or its elements) was extracted
		attribute
			create Result.default_create
		end

	code_string: STRING
			-- The key used by the terminology service to identify a concept or
			-- coordination of concepts. This string is most likely parsable inside
			-- the terminology service, but nothing can be assumed about its syntax
			-- outside that context.
		attribute
			create Result.make_from_string (default_code_string)
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Compare two terms
		local
			s, s_other: STRING
		do
			create s.make(0)
			s.append (terminology_id.value)
			s.append (code_string)

			create s_other.make(0)
			s_other.append (other.terminology_id.value)
			s_other.append (other.code_string)

			Result := s < s_other
		end

feature -- Conversion

	as_terminology_code: TERMINOLOGY_CODE
		do
			create Result.make (terminology_id.value, code_string)
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans - e.g. ICD9(1989)::M17
		do
			create Result.make(0)
			Result.append (terminology_id.value)
			Result.append (separator)
			Result.append (code_string)
		end

	out: STRING
			-- '['  + `as_string' + ']'
		do
			Result := as_string
		--	Result := "[" + as_string + "]"
		end

invariant
	code_string_valid: not code_string.is_empty

end


