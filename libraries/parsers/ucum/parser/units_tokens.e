note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

class UNITS_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_integer_value: detachable INTEGER
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
			when V_INTEGER then
				Result := "V_INTEGER"
			when V_IDENTIFIER then
				Result := "V_IDENTIFIER"
			when SYM_OPEN_PAREN then
				Result := "SYM_OPEN_PAREN"
			when SYM_CLOSE_PAREN then
				Result := "SYM_CLOSE_PAREN"
			when SYM_START_SUFFIX then
				Result := "SYM_START_SUFFIX"
			when SYM_END_SUFFIX then
				Result := "SYM_END_SUFFIX"
			when SYM_START_ANNOT then
				Result := "SYM_START_ANNOT"
			when SYM_END_ANNOT then
				Result := "SYM_END_ANNOT"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	V_INTEGER: INTEGER = 258
	V_IDENTIFIER: INTEGER = 259
	SYM_OPEN_PAREN: INTEGER = 260
	SYM_CLOSE_PAREN: INTEGER = 261
	SYM_START_SUFFIX: INTEGER = 262
	SYM_END_SUFFIX: INTEGER = 263
	SYM_START_ANNOT: INTEGER = 264
	SYM_END_ANNOT: INTEGER = 265

end
