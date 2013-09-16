note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

deferred class CADL_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_string_value: STRING
	last_integer_value: INTEGER
	last_real_value: REAL
	last_character_value: CHARACTER
	last_c_dv_quantity_value: C_DV_QUANTITY

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when V_ARCHETYPE_ID then
				Result := "V_ARCHETYPE_ID"
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
			when V_ABS_PATH then
				Result := "V_ABS_PATH"
			when V_REL_PATH then
				Result := "V_REL_PATH"
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
			when V_C_DV_QUANTITY then
				Result := "V_C_DV_QUANTITY"
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
			when SYM_LIST_CONTINUE then
				Result := "SYM_LIST_CONTINUE"
			when SYM_MATCHES then
				Result := "SYM_MATCHES"
			when SYM_USE_ARCHETYPE then
				Result := "SYM_USE_ARCHETYPE"
			when SYM_ALLOW_ARCHETYPE then
				Result := "SYM_ALLOW_ARCHETYPE"
			when SYM_USE_NODE then
				Result := "SYM_USE_NODE"
			when SYM_INCLUDE then
				Result := "SYM_INCLUDE"
			when SYM_EXCLUDE then
				Result := "SYM_EXCLUDE"
			when SYM_AFTER then
				Result := "SYM_AFTER"
			when SYM_BEFORE then
				Result := "SYM_BEFORE"
			when SYM_CLOSED then
				Result := "SYM_CLOSED"
			when ERR_CHARACTER then
				Result := "ERR_CHARACTER"
			when ERR_STRING then
				Result := "ERR_STRING"
			when ERR_C_DV_QUANTITY then
				Result := "ERR_C_DV_QUANTITY"
			when ERR_TERM_CODE_CONSTRAINT then
				Result := "ERR_TERM_CODE_CONSTRAINT"
			when ERR_V_ISO8601_DURATION then
				Result := "ERR_V_ISO8601_DURATION"
			when ERR_V_QUALIFIED_TERM_CODE_REF then
				Result := "ERR_V_QUALIFIED_TERM_CODE_REF"
			when SYM_IMPLIES then
				Result := "SYM_IMPLIES"
			when SYM_OR then
				Result := "SYM_OR"
			when SYM_XOR then
				Result := "SYM_XOR"
			when SYM_AND then
				Result := "SYM_AND"
			when SYM_EXISTS then
				Result := "SYM_EXISTS"
			when SYM_FORALL then
				Result := "SYM_FORALL"
			when SYM_NOT then
				Result := "SYM_NOT"
			when SYM_NE then
				Result := "SYM_NE"
			when SYM_LT then
				Result := "SYM_LT"
			when SYM_GT then
				Result := "SYM_GT"
			when SYM_LE then
				Result := "SYM_LE"
			when SYM_GE then
				Result := "SYM_GE"
			when SYM_DIV then
				Result := "SYM_DIV"
			when SYM_MODULO then
				Result := "SYM_MODULO"
			when UNARY_MINUS then
				Result := "UNARY_MINUS"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	V_ARCHETYPE_ID: INTEGER = 258
	V_INTEGER: INTEGER = 259
	V_REAL: INTEGER = 260
	V_TYPE_IDENTIFIER: INTEGER = 261
	V_GENERIC_TYPE_IDENTIFIER: INTEGER = 262
	V_ATTRIBUTE_IDENTIFIER: INTEGER = 263
	V_FEATURE_CALL_IDENTIFIER: INTEGER = 264
	V_STRING: INTEGER = 265
	V_LOCAL_CODE: INTEGER = 266
	V_LOCAL_TERM_CODE_REF: INTEGER = 267
	V_QUALIFIED_TERM_CODE_REF: INTEGER = 268
	V_TERM_CODE_CONSTRAINT: INTEGER = 269
	V_REGEXP: INTEGER = 270
	V_ABS_PATH: INTEGER = 271
	V_REL_PATH: INTEGER = 272
	V_CHARACTER: INTEGER = 273
	V_URI: INTEGER = 274
	V_ISO8601_EXTENDED_DATE: INTEGER = 275
	V_ISO8601_EXTENDED_TIME: INTEGER = 276
	V_ISO8601_EXTENDED_DATE_TIME: INTEGER = 277
	V_ISO8601_DURATION: INTEGER = 278
	V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN: INTEGER = 279
	V_ISO8601_TIME_CONSTRAINT_PATTERN: INTEGER = 280
	V_ISO8601_DATE_CONSTRAINT_PATTERN: INTEGER = 281
	V_ISO8601_DURATION_CONSTRAINT_PATTERN: INTEGER = 282
	V_C_DV_QUANTITY: INTEGER = 283
	SYM_START_CBLOCK: INTEGER = 284
	SYM_END_CBLOCK: INTEGER = 285
	SYM_ANY: INTEGER = 286
	SYM_INTERVAL_DELIM: INTEGER = 287
	SYM_TRUE: INTEGER = 288
	SYM_FALSE: INTEGER = 289
	SYM_THEN: INTEGER = 290
	SYM_ELSE: INTEGER = 291
	SYM_EXISTENCE: INTEGER = 292
	SYM_OCCURRENCES: INTEGER = 293
	SYM_CARDINALITY: INTEGER = 294
	SYM_UNORDERED: INTEGER = 295
	SYM_ORDERED: INTEGER = 296
	SYM_UNIQUE: INTEGER = 297
	SYM_ELLIPSIS: INTEGER = 298
	SYM_LIST_CONTINUE: INTEGER = 299
	SYM_MATCHES: INTEGER = 300
	SYM_USE_ARCHETYPE: INTEGER = 301
	SYM_ALLOW_ARCHETYPE: INTEGER = 302
	SYM_USE_NODE: INTEGER = 303
	SYM_INCLUDE: INTEGER = 304
	SYM_EXCLUDE: INTEGER = 305
	SYM_AFTER: INTEGER = 306
	SYM_BEFORE: INTEGER = 307
	SYM_CLOSED: INTEGER = 308
	ERR_CHARACTER: INTEGER = 309
	ERR_STRING: INTEGER = 310
	ERR_C_DV_QUANTITY: INTEGER = 311
	ERR_TERM_CODE_CONSTRAINT: INTEGER = 312
	ERR_V_ISO8601_DURATION: INTEGER = 313
	ERR_V_QUALIFIED_TERM_CODE_REF: INTEGER = 314
	SYM_IMPLIES: INTEGER = 315
	SYM_OR: INTEGER = 316
	SYM_XOR: INTEGER = 317
	SYM_AND: INTEGER = 318
	SYM_EXISTS: INTEGER = 319
	SYM_FORALL: INTEGER = 320
	SYM_NOT: INTEGER = 321
	SYM_NE: INTEGER = 322
	SYM_LT: INTEGER = 323
	SYM_GT: INTEGER = 324
	SYM_LE: INTEGER = 325
	SYM_GE: INTEGER = 326
	SYM_DIV: INTEGER = 327
	SYM_MODULO: INTEGER = 328
	UNARY_MINUS: INTEGER = 329

end
