note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

class ADL_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_string_value: detachable STRING

feature -- Access

	token_name (a_token: INTEGER): STRING
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
			when V_ODIN_TEXT then
				Result := "V_ODIN_TEXT"
			when V_CADL_TEXT then
				Result := "V_CADL_TEXT"
			when V_ASSERTION_TEXT then
				Result := "V_ASSERTION_TEXT"
			when V_DOTTED_NUMERIC then
				Result := "V_DOTTED_NUMERIC"
			when V_VALUE then
				Result := "V_VALUE"
			when SYM_ARCHETYPE then
				Result := "SYM_ARCHETYPE"
			when SYM_TEMPLATE then
				Result := "SYM_TEMPLATE"
			when SYM_TEMPLATE_OVERLAY then
				Result := "SYM_TEMPLATE_OVERLAY"
			when SYM_OPERATIONAL_TEMPLATE then
				Result := "SYM_OPERATIONAL_TEMPLATE"
			when SYM_CONCEPT then
				Result := "SYM_CONCEPT"
			when SYM_SPECIALIZE then
				Result := "SYM_SPECIALIZE"
			when SYM_DEFINITION then
				Result := "SYM_DEFINITION"
			when SYM_LANGUAGE then
				Result := "SYM_LANGUAGE"
			when SYM_ANNOTATIONS then
				Result := "SYM_ANNOTATIONS"
			when SYM_COMPONENT_ONTOLOGIES then
				Result := "SYM_COMPONENT_ONTOLOGIES"
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
			when SYM_UID then
				Result := "SYM_UID"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	V_IDENTIFIER: INTEGER = 258
	V_ARCHETYPE_ID: INTEGER = 259
	V_LOCAL_TERM_CODE_REF: INTEGER = 260
	V_ODIN_TEXT: INTEGER = 261
	V_CADL_TEXT: INTEGER = 262
	V_ASSERTION_TEXT: INTEGER = 263
	V_DOTTED_NUMERIC: INTEGER = 264
	V_VALUE: INTEGER = 265
	SYM_ARCHETYPE: INTEGER = 266
	SYM_TEMPLATE: INTEGER = 267
	SYM_TEMPLATE_OVERLAY: INTEGER = 268
	SYM_OPERATIONAL_TEMPLATE: INTEGER = 269
	SYM_CONCEPT: INTEGER = 270
	SYM_SPECIALIZE: INTEGER = 271
	SYM_DEFINITION: INTEGER = 272
	SYM_LANGUAGE: INTEGER = 273
	SYM_ANNOTATIONS: INTEGER = 274
	SYM_COMPONENT_ONTOLOGIES: INTEGER = 275
	SYM_DESCRIPTION: INTEGER = 276
	SYM_ONTOLOGY: INTEGER = 277
	SYM_INVARIANT: INTEGER = 278
	SYM_ADL_VERSION: INTEGER = 279
	SYM_IS_CONTROLLED: INTEGER = 280
	SYM_IS_GENERATED: INTEGER = 281
	SYM_UID: INTEGER = 282

end
