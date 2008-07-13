indexing

	description: "Parser token codes"
	generator: "geyacc version 3.7"

class ADL_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_string_value: STRING

feature -- Access

	token_name (a_token: INTEGER): STRING is
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when V_IDENTIFIER then
				Result := "V_IDENTIFIER"
			when V_ARCHETYPE_ID then
				Result := "V_ARCHETYPE_ID"
			when V_LOCAL_TERM_CODE_REF then
				Result := "V_LOCAL_TERM_CODE_REF"
			when V_DADL_TEXT then
				Result := "V_DADL_TEXT"
			when V_CADL_TEXT then
				Result := "V_CADL_TEXT"
			when V_ASSERTION_TEXT then
				Result := "V_ASSERTION_TEXT"
			when V_VERSION_STRING then
				Result := "V_VERSION_STRING"
			when SYM_ARCHETYPE then
				Result := "SYM_ARCHETYPE"
			when SYM_CONCEPT then
				Result := "SYM_CONCEPT"
			when SYM_SPECIALIZE then
				Result := "SYM_SPECIALIZE"
			when SYM_DEFINITION then
				Result := "SYM_DEFINITION"
			when SYM_LANGUAGE then
				Result := "SYM_LANGUAGE"
			when SYM_DESCRIPTION then
				Result := "SYM_DESCRIPTION"
			when SYM_ONTOLOGY then
				Result := "SYM_ONTOLOGY"
			when SYM_INVARIANT then
				Result := "SYM_INVARIANT"
			when SYM_ADL_VERSION then
				Result := "SYM_ADL_VERSION"
			when SYM_IS_CONTROLLED then
				Result := "SYM_IS_CONTROLLED"
			when SYM_IS_GENERATED then
				Result := "SYM_IS_GENERATED"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	V_IDENTIFIER: INTEGER is 258
	V_ARCHETYPE_ID: INTEGER is 259
	V_LOCAL_TERM_CODE_REF: INTEGER is 260
	V_DADL_TEXT: INTEGER is 261
	V_CADL_TEXT: INTEGER is 262
	V_ASSERTION_TEXT: INTEGER is 263
	V_VERSION_STRING: INTEGER is 264
	SYM_ARCHETYPE: INTEGER is 265
	SYM_CONCEPT: INTEGER is 266
	SYM_SPECIALIZE: INTEGER is 267
	SYM_DEFINITION: INTEGER is 268
	SYM_LANGUAGE: INTEGER is 269
	SYM_DESCRIPTION: INTEGER is 270
	SYM_ONTOLOGY: INTEGER is 271
	SYM_INVARIANT: INTEGER is 272
	SYM_ADL_VERSION: INTEGER is 273
	SYM_IS_CONTROLLED: INTEGER is 274
	SYM_IS_GENERATED: INTEGER is 275

end
