indexing

	description: "Parser token codes"
	generator: "geyacc version 3.7"

class UNITS_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_integer_value: INTEGER
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

	V_INTEGER: INTEGER is 258
	V_IDENTIFIER: INTEGER is 259
	SYM_OPEN_PAREN: INTEGER is 260
	SYM_CLOSE_PAREN: INTEGER is 261
	SYM_START_SUFFIX: INTEGER is 262
	SYM_END_SUFFIX: INTEGER is 263
	SYM_START_ANNOT: INTEGER is 264
	SYM_END_ANNOT: INTEGER is 265

end
