indexing

	description: "Parser token codes"
	generator: "geyacc version 3.8"

class CADL_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_integer_value: INTEGER
	last_real_value: REAL
	last_string_value: STRING
	last_character_value: CHARACTER
	last_c_domain_type_value: C_DOMAIN_TYPE

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
			when V_REAL then
				Result := "V_REAL"
			when V_TYPE_IDENTIFIER then
				Result := "V_TYPE_IDENTIFIER"
			when V_GENERIC_TYPE_IDENTIFIER then
				Result := "V_GENERIC_TYPE_IDENTIFIER"
			when V_ATTRIBUTE_IDENTIFIER then
				Result := "V_ATTRIBUTE_IDENTIFIER"
			when V_FEATURE_CALL_IDENTIFIER then
				Result := "V_FEATURE_CALL_IDENTIFIER"
			when V_STRING then
				Result := "V_STRING"
			when V_LOCAL_CODE then
				Result := "V_LOCAL_CODE"
			when V_LOCAL_TERM_CODE_REF then
				Result := "V_LOCAL_TERM_CODE_REF"
			when V_QUALIFIED_TERM_CODE_REF then
				Result := "V_QUALIFIED_TERM_CODE_REF"
			when V_TERM_CODE_CONSTRAINT then
				Result := "V_TERM_CODE_CONSTRAINT"
			when V_REGEXP then
				Result := "V_REGEXP"
			when V_CHARACTER then
				Result := "V_CHARACTER"
			when V_URI then
				Result := "V_URI"
			when V_ISO8601_EXTENDED_DATE then
				Result := "V_ISO8601_EXTENDED_DATE"
			when V_ISO8601_EXTENDED_TIME then
				Result := "V_ISO8601_EXTENDED_TIME"
			when V_ISO8601_EXTENDED_DATE_TIME then
				Result := "V_ISO8601_EXTENDED_DATE_TIME"
			when V_ISO8601_DURATION then
				Result := "V_ISO8601_DURATION"
			when V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN then
				Result := "V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN"
			when V_ISO8601_TIME_CONSTRAINT_PATTERN then
				Result := "V_ISO8601_TIME_CONSTRAINT_PATTERN"
			when V_ISO8601_DATE_CONSTRAINT_PATTERN then
				Result := "V_ISO8601_DATE_CONSTRAINT_PATTERN"
			when V_ISO8601_DURATION_CONSTRAINT_PATTERN then
				Result := "V_ISO8601_DURATION_CONSTRAINT_PATTERN"
			when V_C_DOMAIN_TYPE then
				Result := "V_C_DOMAIN_TYPE"
			when SYM_START_CBLOCK then
				Result := "SYM_START_CBLOCK"
			when SYM_END_CBLOCK then
				Result := "SYM_END_CBLOCK"
			when SYM_ANY then
				Result := "SYM_ANY"
			when SYM_INTERVAL_DELIM then
				Result := "SYM_INTERVAL_DELIM"
			when SYM_TRUE then
				Result := "SYM_TRUE"
			when SYM_FALSE then
				Result := "SYM_FALSE"
			when SYM_GE then
				Result := "SYM_GE"
			when SYM_LE then
				Result := "SYM_LE"
			when SYM_NE then
				Result := "SYM_NE"
			when SYM_EXISTS then
				Result := "SYM_EXISTS"
			when SYM_FORALL then
				Result := "SYM_FORALL"
			when SYM_THEN then
				Result := "SYM_THEN"
			when SYM_ELSE then
				Result := "SYM_ELSE"
			when SYM_EXISTENCE then
				Result := "SYM_EXISTENCE"
			when SYM_OCCURRENCES then
				Result := "SYM_OCCURRENCES"
			when SYM_CARDINALITY then
				Result := "SYM_CARDINALITY"
			when SYM_UNORDERED then
				Result := "SYM_UNORDERED"
			when SYM_ORDERED then
				Result := "SYM_ORDERED"
			when SYM_UNIQUE then
				Result := "SYM_UNIQUE"
			when SYM_ELLIPSIS then
				Result := "SYM_ELLIPSIS"
			when SYM_INFINITY then
				Result := "SYM_INFINITY"
			when SYM_LIST_CONTINUE then
				Result := "SYM_LIST_CONTINUE"
			when SYM_INVARIANT then
				Result := "SYM_INVARIANT"
			when SYM_MATCHES then
				Result := "SYM_MATCHES"
			when SYM_ALLOW_ARCHETYPE then
				Result := "SYM_ALLOW_ARCHETYPE"
			when SYM_USE_NODE then
				Result := "SYM_USE_NODE"
			when SYM_INCLUDE then
				Result := "SYM_INCLUDE"
			when SYM_EXCLUDE then
				Result := "SYM_EXCLUDE"
			when SYM_DT_UNKNOWN then
				Result := "SYM_DT_UNKNOWN"
			when ERR_CHARACTER then
				Result := "ERR_CHARACTER"
			when ERR_STRING then
				Result := "ERR_STRING"
			when ERR_C_DOMAIN_TYPE then
				Result := "ERR_C_DOMAIN_TYPE"
			when ERR_TERM_CODE_CONSTRAINT then
				Result := "ERR_TERM_CODE_CONSTRAINT"
			when ERR_V_QUALIFIED_TERM_CODE_REF then
				Result := "ERR_V_QUALIFIED_TERM_CODE_REF"
			when ERR_V_ISO8601_DURATION then
				Result := "ERR_V_ISO8601_DURATION"
			when SYM_IMPLIES then
				Result := "SYM_IMPLIES"
			when SYM_OR then
				Result := "SYM_OR"
			when SYM_XOR then
				Result := "SYM_XOR"
			when SYM_AND then
				Result := "SYM_AND"
			when SYM_LT then
				Result := "SYM_LT"
			when SYM_GT then
				Result := "SYM_GT"
			when SYM_DIV then
				Result := "SYM_DIV"
			when SYM_MODULO then
				Result := "SYM_MODULO"
			when SYM_NOT then
				Result := "SYM_NOT"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	V_INTEGER: INTEGER is 258
	V_REAL: INTEGER is 259
	V_TYPE_IDENTIFIER: INTEGER is 260
	V_GENERIC_TYPE_IDENTIFIER: INTEGER is 261
	V_ATTRIBUTE_IDENTIFIER: INTEGER is 262
	V_FEATURE_CALL_IDENTIFIER: INTEGER is 263
	V_STRING: INTEGER is 264
	V_LOCAL_CODE: INTEGER is 265
	V_LOCAL_TERM_CODE_REF: INTEGER is 266
	V_QUALIFIED_TERM_CODE_REF: INTEGER is 267
	V_TERM_CODE_CONSTRAINT: INTEGER is 268
	V_REGEXP: INTEGER is 269
	V_CHARACTER: INTEGER is 270
	V_URI: INTEGER is 271
	V_ISO8601_EXTENDED_DATE: INTEGER is 272
	V_ISO8601_EXTENDED_TIME: INTEGER is 273
	V_ISO8601_EXTENDED_DATE_TIME: INTEGER is 274
	V_ISO8601_DURATION: INTEGER is 275
	V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN: INTEGER is 276
	V_ISO8601_TIME_CONSTRAINT_PATTERN: INTEGER is 277
	V_ISO8601_DATE_CONSTRAINT_PATTERN: INTEGER is 278
	V_ISO8601_DURATION_CONSTRAINT_PATTERN: INTEGER is 279
	V_C_DOMAIN_TYPE: INTEGER is 280
	SYM_START_CBLOCK: INTEGER is 281
	SYM_END_CBLOCK: INTEGER is 282
	SYM_ANY: INTEGER is 283
	SYM_INTERVAL_DELIM: INTEGER is 284
	SYM_TRUE: INTEGER is 285
	SYM_FALSE: INTEGER is 286
	SYM_GE: INTEGER is 287
	SYM_LE: INTEGER is 288
	SYM_NE: INTEGER is 289
	SYM_EXISTS: INTEGER is 290
	SYM_FORALL: INTEGER is 291
	SYM_THEN: INTEGER is 292
	SYM_ELSE: INTEGER is 293
	SYM_EXISTENCE: INTEGER is 294
	SYM_OCCURRENCES: INTEGER is 295
	SYM_CARDINALITY: INTEGER is 296
	SYM_UNORDERED: INTEGER is 297
	SYM_ORDERED: INTEGER is 298
	SYM_UNIQUE: INTEGER is 299
	SYM_ELLIPSIS: INTEGER is 300
	SYM_INFINITY: INTEGER is 301
	SYM_LIST_CONTINUE: INTEGER is 302
	SYM_INVARIANT: INTEGER is 303
	SYM_MATCHES: INTEGER is 304
	SYM_ALLOW_ARCHETYPE: INTEGER is 305
	SYM_USE_NODE: INTEGER is 306
	SYM_INCLUDE: INTEGER is 307
	SYM_EXCLUDE: INTEGER is 308
	SYM_DT_UNKNOWN: INTEGER is 309
	ERR_CHARACTER: INTEGER is 310
	ERR_STRING: INTEGER is 311
	ERR_C_DOMAIN_TYPE: INTEGER is 312
	ERR_TERM_CODE_CONSTRAINT: INTEGER is 313
	ERR_V_QUALIFIED_TERM_CODE_REF: INTEGER is 314
	ERR_V_ISO8601_DURATION: INTEGER is 315
	SYM_IMPLIES: INTEGER is 316
	SYM_OR: INTEGER is 317
	SYM_XOR: INTEGER is 318
	SYM_AND: INTEGER is 319
	SYM_LT: INTEGER is 320
	SYM_GT: INTEGER is 321
	SYM_DIV: INTEGER is 322
	SYM_MODULO: INTEGER is 323
	SYM_NOT: INTEGER is 324

end
