note

	description: "Parser token codes"
	generator: "geyacc"

deferred class CADL_14_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_integer_value: INTEGER
	last_real_value: REAL
	last_string_value: STRING
	last_term_constraint_parse_structure_value: TERM_CONSTRAINT_PARSE_STRUCTURE
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
			when V_ROOT_ID_CODE then
				Result := "V_ROOT_ID_CODE"
			when V_ID_CODE then
				Result := "V_ID_CODE"
			when V_ID_CODE_STR then
				Result := "V_ID_CODE_STR"
			when V_VALUE_SET_REF then
				Result := "V_VALUE_SET_REF"
			when V_REUSED_ID_CODE then
				Result := "V_REUSED_ID_CODE"
			when V_EXPANDED_VALUE_SET_DEF then
				Result := "V_EXPANDED_VALUE_SET_DEF"
			when V_EXTERNAL_VALUE_SET_DEF then
				Result := "V_EXTERNAL_VALUE_SET_DEF"
			when ERR_VALUE_SET_DEF_ASSUMED then
				Result := "ERR_VALUE_SET_DEF_ASSUMED"
			when ERR_VALUE_SET_MISSING_CODES then
				Result := "ERR_VALUE_SET_MISSING_CODES"
			when ERR_VALUE_SET_DEF_DUP_CODE then
				Result := "ERR_VALUE_SET_DEF_DUP_CODE"
			when ERR_VALUE_SET_DEF then
				Result := "ERR_VALUE_SET_DEF"
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
			when V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR then
				Result := "V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR"
			when V_C_DV_QUANTITY then
				Result := "V_C_DV_QUANTITY"
			when ERR_C_DV_QUANTITY_1 then
				Result := "ERR_C_DV_QUANTITY_1"
			when ERR_C_DV_QUANTITY_2 then
				Result := "ERR_C_DV_QUANTITY_2"
			when ERR_C_DV_QUANTITY_3 then
				Result := "ERR_C_DV_QUANTITY_3"
			when ERR_C_DV_QUANTITY_4 then
				Result := "ERR_C_DV_QUANTITY_4"
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

	V_INTEGER: INTEGER = 258
	V_REAL: INTEGER = 259
	V_TYPE_IDENTIFIER: INTEGER = 260
	V_GENERIC_TYPE_IDENTIFIER: INTEGER = 261
	V_ATTRIBUTE_IDENTIFIER: INTEGER = 262
	V_FEATURE_CALL_IDENTIFIER: INTEGER = 263
	V_STRING: INTEGER = 264
	V_ROOT_ID_CODE: INTEGER = 265
	V_ID_CODE: INTEGER = 266
	V_ID_CODE_STR: INTEGER = 267
	V_VALUE_SET_REF: INTEGER = 268
	V_REUSED_ID_CODE: INTEGER = 269
	V_EXPANDED_VALUE_SET_DEF: INTEGER = 270
	V_EXTERNAL_VALUE_SET_DEF: INTEGER = 271
	ERR_VALUE_SET_DEF_ASSUMED: INTEGER = 272
	ERR_VALUE_SET_MISSING_CODES: INTEGER = 273
	ERR_VALUE_SET_DEF_DUP_CODE: INTEGER = 274
	ERR_VALUE_SET_DEF: INTEGER = 275
	V_REGEXP: INTEGER = 276
	V_ABS_PATH: INTEGER = 277
	V_REL_PATH: INTEGER = 278
	V_CHARACTER: INTEGER = 279
	V_URI: INTEGER = 280
	V_ISO8601_EXTENDED_DATE: INTEGER = 281
	V_ISO8601_EXTENDED_TIME: INTEGER = 282
	V_ISO8601_EXTENDED_DATE_TIME: INTEGER = 283
	V_ISO8601_DURATION: INTEGER = 284
	V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN: INTEGER = 285
	V_ISO8601_TIME_CONSTRAINT_PATTERN: INTEGER = 286
	V_ISO8601_DATE_CONSTRAINT_PATTERN: INTEGER = 287
	V_ISO8601_DURATION_CONSTRAINT_PATTERN: INTEGER = 288
	V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR: INTEGER = 289
	V_C_DV_QUANTITY: INTEGER = 290
	ERR_C_DV_QUANTITY_1: INTEGER = 291
	ERR_C_DV_QUANTITY_2: INTEGER = 292
	ERR_C_DV_QUANTITY_3: INTEGER = 293
	ERR_C_DV_QUANTITY_4: INTEGER = 294
	SYM_START_CBLOCK: INTEGER = 295
	SYM_END_CBLOCK: INTEGER = 296
	SYM_ANY: INTEGER = 297
	SYM_INTERVAL_DELIM: INTEGER = 298
	SYM_TRUE: INTEGER = 299
	SYM_FALSE: INTEGER = 300
	SYM_THEN: INTEGER = 301
	SYM_ELSE: INTEGER = 302
	SYM_EXISTENCE: INTEGER = 303
	SYM_OCCURRENCES: INTEGER = 304
	SYM_CARDINALITY: INTEGER = 305
	SYM_UNORDERED: INTEGER = 306
	SYM_ORDERED: INTEGER = 307
	SYM_UNIQUE: INTEGER = 308
	SYM_ELLIPSIS: INTEGER = 309
	SYM_LIST_CONTINUE: INTEGER = 310
	SYM_MATCHES: INTEGER = 311
	SYM_ALLOW_ARCHETYPE: INTEGER = 312
	SYM_USE_NODE: INTEGER = 313
	SYM_INCLUDE: INTEGER = 314
	SYM_EXCLUDE: INTEGER = 315
	SYM_AFTER: INTEGER = 316
	SYM_BEFORE: INTEGER = 317
	SYM_CLOSED: INTEGER = 318
	ERR_CHARACTER: INTEGER = 319
	ERR_STRING: INTEGER = 320
	ERR_V_ISO8601_DURATION: INTEGER = 321
	SYM_IMPLIES: INTEGER = 322
	SYM_OR: INTEGER = 323
	SYM_XOR: INTEGER = 324
	SYM_AND: INTEGER = 325
	SYM_EXISTS: INTEGER = 326
	SYM_FORALL: INTEGER = 327
	SYM_NOT: INTEGER = 328
	SYM_NE: INTEGER = 329
	SYM_LT: INTEGER = 330
	SYM_GT: INTEGER = 331
	SYM_LE: INTEGER = 332
	SYM_GE: INTEGER = 333
	SYM_DIV: INTEGER = 334
	SYM_MODULO: INTEGER = 335
	UNARY_MINUS: INTEGER = 336

end
