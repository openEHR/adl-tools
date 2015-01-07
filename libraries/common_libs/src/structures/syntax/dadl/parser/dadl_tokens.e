note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

deferred class DADL_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_integer_value: INTEGER
	last_real_value: REAL
	last_string_value: STRING
	last_character_value: CHARACTER

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
			when V_REAL then
				Result := "V_REAL"
			when V_TYPE_IDENTIFIER then
				Result := "V_TYPE_IDENTIFIER"
			when V_GENERIC_TYPE_IDENTIFIER then
				Result := "V_GENERIC_TYPE_IDENTIFIER"
			when V_ATTRIBUTE_IDENTIFIER then
				Result := "V_ATTRIBUTE_IDENTIFIER"
			when V_STRING then
				Result := "V_STRING"
			when V_ISO8601_EXTENDED_DATE then
				Result := "V_ISO8601_EXTENDED_DATE"
			when V_ISO8601_EXTENDED_TIME then
				Result := "V_ISO8601_EXTENDED_TIME"
			when V_ISO8601_EXTENDED_DATE_TIME then
				Result := "V_ISO8601_EXTENDED_DATE_TIME"
			when V_ISO8601_DURATION then
				Result := "V_ISO8601_DURATION"
			when V_CADL_BLOCK then
				Result := "V_CADL_BLOCK"
			when V_LOCAL_CODE then
				Result := "V_LOCAL_CODE"
			when V_QUALIFIED_TERM_CODE_REF then
				Result := "V_QUALIFIED_TERM_CODE_REF"
			when V_LOCAL_TERM_CODE_REF then
				Result := "V_LOCAL_TERM_CODE_REF"
			when V_URI then
				Result := "V_URI"
			when V_CHARACTER then
				Result := "V_CHARACTER"
			when SYM_START_DBLOCK then
				Result := "SYM_START_DBLOCK"
			when SYM_END_DBLOCK then
				Result := "SYM_END_DBLOCK"
			when SYM_EQ then
				Result := "SYM_EQ"
			when SYM_ELLIPSIS then
				Result := "SYM_ELLIPSIS"
			when SYM_LIST_CONTINUE then
				Result := "SYM_LIST_CONTINUE"
			when SYM_INFINITY then
				Result := "SYM_INFINITY"
			when SYM_INTERVAL_DELIM then
				Result := "SYM_INTERVAL_DELIM"
			when SYM_DT_UNKNOWN then
				Result := "SYM_DT_UNKNOWN"
			when SYM_TRUE then
				Result := "SYM_TRUE"
			when SYM_FALSE then
				Result := "SYM_FALSE"
			when SYM_LT then
				Result := "SYM_LT"
			when SYM_GT then
				Result := "SYM_GT"
			when SYM_LE then
				Result := "SYM_LE"
			when SYM_GE then
				Result := "SYM_GE"
			when ERR_CHARACTER then
				Result := "ERR_CHARACTER"
			when ERR_STRING then
				Result := "ERR_STRING"
			when ERR_CADL_MISPLACED then
				Result := "ERR_CADL_MISPLACED"
			when ERR_V_QUALIFIED_TERM_CODE_REF then
				Result := "ERR_V_QUALIFIED_TERM_CODE_REF"
			when ERR_V_LOCAL_TERM_CODE_REF then
				Result := "ERR_V_LOCAL_TERM_CODE_REF"
			when UNARY_MINUS then
				Result := "UNARY_MINUS"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	V_INTEGER: INTEGER = 258
	V_REAL: INTEGER = 259
	V_TYPE_IDENTIFIER: INTEGER = 260
	V_GENERIC_TYPE_IDENTIFIER: INTEGER = 261
	V_ATTRIBUTE_IDENTIFIER: INTEGER = 262
	V_STRING: INTEGER = 263
	V_ISO8601_EXTENDED_DATE: INTEGER = 264
	V_ISO8601_EXTENDED_TIME: INTEGER = 265
	V_ISO8601_EXTENDED_DATE_TIME: INTEGER = 266
	V_ISO8601_DURATION: INTEGER = 267
	V_CADL_BLOCK: INTEGER = 268
	V_LOCAL_CODE: INTEGER = 269
	V_QUALIFIED_TERM_CODE_REF: INTEGER = 270
	V_LOCAL_TERM_CODE_REF: INTEGER = 271
	V_URI: INTEGER = 272
	V_CHARACTER: INTEGER = 273
	SYM_START_DBLOCK: INTEGER = 274
	SYM_END_DBLOCK: INTEGER = 275
	SYM_EQ: INTEGER = 276
	SYM_ELLIPSIS: INTEGER = 277
	SYM_LIST_CONTINUE: INTEGER = 278
	SYM_INFINITY: INTEGER = 279
	SYM_INTERVAL_DELIM: INTEGER = 280
	SYM_DT_UNKNOWN: INTEGER = 281
	SYM_TRUE: INTEGER = 282
	SYM_FALSE: INTEGER = 283
	SYM_LT: INTEGER = 284
	SYM_GT: INTEGER = 285
	SYM_LE: INTEGER = 286
	SYM_GE: INTEGER = 287
	ERR_CHARACTER: INTEGER = 288
	ERR_STRING: INTEGER = 289
	ERR_CADL_MISPLACED: INTEGER = 290
	ERR_V_QUALIFIED_TERM_CODE_REF: INTEGER = 291
	ERR_V_LOCAL_TERM_CODE_REF: INTEGER = 292
	UNARY_MINUS: INTEGER = 293

end
