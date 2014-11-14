note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

deferred class ADL_2_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_string_value: STRING

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
			when V_CONCEPT_CODE then
				Result := "V_CONCEPT_CODE"
			when V_ODIN_TEXT then
				Result := "V_ODIN_TEXT"
			when V_CADL_TEXT then
				Result := "V_CADL_TEXT"
			when V_RULES_TEXT then
				Result := "V_RULES_TEXT"
			when V_DOTTED_NUMERIC then
				Result := "V_DOTTED_NUMERIC"
			when V_VALUE then
				Result := "V_VALUE"
			when SYM_ARCHETYPE then
				Result := "SYM_ARCHETYPE"
			when SYM_SPECIALIZE then
				Result := "SYM_SPECIALIZE"
			when SYM_TEMPLATE then
				Result := "SYM_TEMPLATE"
			when SYM_TEMPLATE_OVERLAY then
				Result := "SYM_TEMPLATE_OVERLAY"
			when SYM_OPERATIONAL_TEMPLATE then
				Result := "SYM_OPERATIONAL_TEMPLATE"
			when SYM_CONCEPT then
				Result := "SYM_CONCEPT"
			when SYM_DEFINITION then
				Result := "SYM_DEFINITION"
			when SYM_LANGUAGE then
				Result := "SYM_LANGUAGE"
			when SYM_ANNOTATIONS then
				Result := "SYM_ANNOTATIONS"
			when SYM_COMPONENT_TERMINOLOGIES then
				Result := "SYM_COMPONENT_TERMINOLOGIES"
			when SYM_DESCRIPTION then
				Result := "SYM_DESCRIPTION"
			when SYM_TERMINOLOGY then
				Result := "SYM_TERMINOLOGY"
			when SYM_RULES then
				Result := "SYM_RULES"
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
	V_CONCEPT_CODE: INTEGER = 260
	V_ODIN_TEXT: INTEGER = 261
	V_CADL_TEXT: INTEGER = 262
	V_RULES_TEXT: INTEGER = 263
	V_DOTTED_NUMERIC: INTEGER = 264
	V_VALUE: INTEGER = 265
	SYM_ARCHETYPE: INTEGER = 266
	SYM_SPECIALIZE: INTEGER = 267
	SYM_TEMPLATE: INTEGER = 268
	SYM_TEMPLATE_OVERLAY: INTEGER = 269
	SYM_OPERATIONAL_TEMPLATE: INTEGER = 270
	SYM_CONCEPT: INTEGER = 271
	SYM_DEFINITION: INTEGER = 272
	SYM_LANGUAGE: INTEGER = 273
	SYM_ANNOTATIONS: INTEGER = 274
	SYM_COMPONENT_TERMINOLOGIES: INTEGER = 275
	SYM_DESCRIPTION: INTEGER = 276
	SYM_TERMINOLOGY: INTEGER = 277
	SYM_RULES: INTEGER = 278
	SYM_ADL_VERSION: INTEGER = 279
	SYM_IS_CONTROLLED: INTEGER = 280
	SYM_IS_GENERATED: INTEGER = 281
	SYM_UID: INTEGER = 282

end
