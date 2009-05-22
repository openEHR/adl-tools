note

	description: "Parser token codes"
	generator: "geyacc version 3.7"

class OG_PATH_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
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
			when V_ATTRIBUTE_IDENTIFIER then
				Result := "V_ATTRIBUTE_IDENTIFIER"
			when V_STRING then
				Result := "V_STRING"
			when V_LOCAL_TERM_CODE_REF then
				Result := "V_LOCAL_TERM_CODE_REF"
			when ERR_STRING then
				Result := "ERR_STRING"
			when SYM_MOVABLE_LEADER then
				Result := "SYM_MOVABLE_LEADER"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	V_ATTRIBUTE_IDENTIFIER: INTEGER = 258
	V_STRING: INTEGER = 259
	V_LOCAL_TERM_CODE_REF: INTEGER = 260
	ERR_STRING: INTEGER = 261
	SYM_MOVABLE_LEADER: INTEGER = 262

end
