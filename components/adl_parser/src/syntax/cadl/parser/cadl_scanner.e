indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"

	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "Mozilla tri-license"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_TOKENS
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

	SHARED_DT_FACTORY
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

	ADL_SYNTAX_CONVERTER
		export 
			{NONE} all
		end

creation

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_C_DOMAIN_TYPE)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 65 then
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 79 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 79")
end
-- Ignore separators
else
--|#line 80 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 80")
end
in_lineno := in_lineno + text_count
end
else
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
in_lineno := in_lineno + 1
else
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Plus_code
else
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Slash_code
else
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Equal_code
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Semicolon_code
else
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Colon_code
else
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Left_parenthesis_code
else
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := Right_parenthesis_code
end
end
end
end
else
if yy_act <= 25 then
if yy_act <= 21 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := Dollar_code
else
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 20 then
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := Question_mark_code
else
--|#line 108 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 108")
end
last_token := SYM_INTERVAL_DELIM
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := Left_bracket_code
else
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := Right_bracket_code
end
else
if yy_act = 24 then
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_START_CBLOCK
else
--|#line 114 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 114")
end
last_token := SYM_END_CBLOCK
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := SYM_GE
else
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_LE
end
else
if yy_act = 28 then
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_NE
else
--|#line 120 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 120")
end
last_token := SYM_LT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
end
last_token := SYM_GT
else
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_MODULO
end
else
if yy_act = 32 then
--|#line 124 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 124")
end
last_token := SYM_DIV
else
--|#line 126 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 126")
end
last_token := SYM_ELLIPSIS
end
end
end
end
end
else
if yy_act <= 49 then
if yy_act <= 41 then
if yy_act <= 37 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 127 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 127")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_MATCHES
end
else
if yy_act = 36 then
--|#line 133 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 133")
end
last_token := SYM_MATCHES
else
--|#line 137 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 137")
end
last_token := SYM_THEN
end
end
else
if yy_act <= 39 then
if yy_act = 38 then
--|#line 139 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 139")
end
last_token := SYM_ELSE
else
--|#line 141 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 141")
end
last_token := SYM_AND
end
else
if yy_act = 40 then
--|#line 143 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 143")
end
last_token := SYM_OR
else
--|#line 145 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 145")
end
last_token := SYM_XOR
end
end
end
else
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 147 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 147")
end
last_token := SYM_NOT
else
--|#line 149 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 149")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 44 then
--|#line 151 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 151")
end
last_token := SYM_TRUE
else
--|#line 153 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 153")
end
last_token := SYM_FALSE
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 155 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 155")
end
last_token := SYM_FORALL
else
--|#line 157 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 157")
end
last_token := SYM_EXISTS
end
else
if yy_act = 48 then
--|#line 161 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 161")
end
last_token := SYM_EXISTENCE
else
--|#line 163 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 163")
end
last_token := SYM_OCCURRENCES
end
end
end
end
else
if yy_act <= 57 then
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 165 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 165")
end
last_token := SYM_CARDINALITY
else
--|#line 167 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 167")
end
last_token := SYM_ORDERED
end
else
if yy_act = 52 then
--|#line 169 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 169")
end
last_token := SYM_UNORDERED
else
--|#line 171 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 171")
end
last_token := SYM_UNIQUE
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 173 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 173")
end
last_token := SYM_INFINITY
else
--|#line 175 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 175")
end
last_token := SYM_USE_NODE
end
else
if yy_act = 56 then
--|#line 177 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 177")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 179 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 179")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
end
else
if yy_act <= 61 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 181 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 181")
end
last_token := SYM_INCLUDE
else
--|#line 183 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 183")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 60 then
--|#line 187 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 187")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 193 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 193")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 63 then
if yy_act = 62 then
--|#line 198 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 198")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 64 then
--|#line 219 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 219")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 226 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 226")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
end
end
end
end
end
else
if yy_act <= 97 then
if yy_act <= 81 then
if yy_act <= 73 then
if yy_act <= 69 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 233 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 233")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 239 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 239")
end

				do_nothing
			
end
else
if yy_act = 68 then
--|#line 243 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 243")
end

				if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
					last_token := ERR_TERM_CODE_CONSTRAINT
				else
					in_buffer.append(text_substring(1, text_count-1))
					str_ := STRING_.make (in_buffer.count)
					str_.append (in_buffer)
					in_buffer.wipe_out
					last_string_value := str_
					last_string_value.prune_all(' ')
					last_string_value.prune_all('%T')
					last_string_value.prune_all('%N')
					last_token := V_TERM_CODE_CONSTRAINT
				end
				set_start_condition (INITIAL)
			
else
--|#line 263 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 263")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
end
else
if yy_act <= 71 then
if yy_act = 70 then
--|#line 270 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 270")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 271 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 271")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 72 then
--|#line 272 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 272")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 279 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 279")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 77 then
if yy_act <= 75 then
if yy_act = 74 then
--|#line 280 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 280")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 293 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 293")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 76 then
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 307 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 307")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 79 then
if yy_act = 78 then
--|#line 308 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 308")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 315 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 315")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 80 then
--|#line 327 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 327")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 334 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 334")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 89 then
if yy_act <= 85 then
if yy_act <= 83 then
if yy_act = 82 then
--|#line 341 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 341")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 348 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 348")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 84 then
--|#line 349 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 349")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 350 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 350")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 87 then
if yy_act = 86 then
--|#line 362 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 362")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 367 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 367")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 88 then
--|#line 371 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 371")
end
 -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of dADL
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_lineno := in_lineno + str_.occurrences('%N')

				-- perform any upgrades to embedded dADL object syntax here by substitution
				convert_c_quantity_property(str_)

				dadl_parser.execute(str_, source_start_line)
				if not dadl_parser.syntax_error then
					if dadl_parser.output.is_typed then
						c_domain_type ?= dadl_parser.output.as_object(dynamic_type_from_string(dadl_parser.output.rm_type_name))
						if c_domain_type /= Void then
							last_token := V_C_DOMAIN_TYPE
						else
							dadl_parser_error := "Conversion of " + dadl_parser.output.rm_type_name + " failed"
							last_token := ERR_C_DOMAIN_TYPE
						end
					else
						dadl_parser_error := "Domain type in dADL section not typed"
						last_token := ERR_C_DOMAIN_TYPE
					end
				else
					dadl_parser_error := dadl_parser.error_text
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
else
--|#line 406 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 406")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
end
else
if yy_act <= 93 then
if yy_act <= 91 then
if yy_act = 90 then
--|#line 411 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 411")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 416 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 416")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 92 then
--|#line 422 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 422")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 428 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 428")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 95 then
if yy_act = 94 then
--|#line 434 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 434")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 438 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 438")
end
 		-- match final segment
				in_buffer.append_string (text)
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
 			
end
else
if yy_act = 96 then
--|#line 448 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 448")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 455 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 455")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
end
end
else
if yy_act <= 113 then
if yy_act <= 105 then
if yy_act <= 101 then
if yy_act <= 99 then
if yy_act = 98 then
--|#line 460 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 460")
end

					last_token := V_INTEGER
					str_ := text
					nb_ := text_count
					from i_ := 1 until i_ > nb_ loop
						char_ := str_.item (i_)
						in_buffer.append_character (char_)
						i_ := i_ + 1
					end
					last_integer_value := in_buffer.to_integer
					in_buffer.wipe_out
			
else
	yy_end := yy_end - 1
--|#line 475 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 475")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 100 then
--|#line 476 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 476")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 477 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 477")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 103 then
if yy_act = 102 then
	yy_end := yy_end - 1
--|#line 481 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 481")
end

						last_token := V_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								in_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_real_value := in_buffer.to_real
						in_buffer.wipe_out
					
else
--|#line 482 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 482")
end

						last_token := V_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								in_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_real_value := in_buffer.to_real
						in_buffer.wipe_out
					
end
else
if yy_act = 104 then
--|#line 483 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 483")
end

						last_token := V_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								in_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_real_value := in_buffer.to_real
						in_buffer.wipe_out
					
else
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
end
else
if yy_act <= 109 then
if yy_act <= 107 then
if yy_act = 106 then
--|#line 507 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 507")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 513 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 513")
end
in_buffer.append_character ('\')
end
else
if yy_act = 108 then
--|#line 514 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 514")
end
in_buffer.append_character ('"')
else
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
end
	-- match ISO special character pattern &char_name;
				-- look up the code in an ISO table
				-- if a valid code then
				-- 	convert to actual character?
				--	in_buffer.append_character (converted character)
				-- else
				--	last_token := ERR_STRING
				--	set_start_condition (INITIAL)
				-- end
			
				-- current simple approach: just copy the pattern into the buffer
				--
				in_buffer.append_string (text)
			
end
end
else
if yy_act <= 111 then
if yy_act = 110 then
--|#line 529 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 529")
end
	-- match W3C XML special character pattern &#xHHHH;
				-- look up the code in an W3C table
				-- if a valid code then
				-- 	convert to actual character?
				--	in_buffer.append_character (converted character)
				-- else
				--	last_token := ERR_STRING
				--	set_start_condition (INITIAL)
				-- end
			
				-- current simple approach: just copy the pattern into the buffer
				--
				in_buffer.append_string (text)
			
else
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
end
in_buffer.append_string (text)
end
else
if yy_act = 112 then
--|#line 545 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 545")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
--|#line 550 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 550")
end
						-- match final end of string
				last_token := V_STRING
				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
end
end
end
end
else
if yy_act <= 121 then
if yy_act <= 117 then
if yy_act <= 115 then
if yy_act = 114 then
--|#line 561 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 561")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 569 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 569")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 116 then
--|#line 570 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 570")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 571 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 571")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
else
if yy_act <= 119 then
if yy_act = 118 then
--|#line 572 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 572")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 573 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 573")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
else
if yy_act = 120 then
--|#line 574 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 574")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 575 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 575")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 125 then
if yy_act <= 123 then
if yy_act = 122 then
--|#line 576 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 576")
end
last_token := V_CHARACTER; last_character_value := '"'
else
--|#line 577 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 577")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
end
else
if yy_act = 124 then
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end
	-- match ISO special character pattern &char_name;
				-- look up the code in an ISO table
				-- if a valid code then
				--	last_token := V_CHARACTER
				-- 	convert to actual character?
				--	last_character_value := converted character
				-- else
				--	last_token := ERR_CHARACTER
				-- end
			
else
--|#line 592 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 592")
end
	-- match W3C XML special character pattern &#xHHHH;
				-- look up the code in an W3C table
				-- if a valid code then
				--	last_token := V_CHARACTER
				-- 	convert to actual character?
				--	last_character_value := converted character
				-- else
				--	last_token := ERR_CHARACTER
				-- end
			
end
end
else
if yy_act <= 127 then
if yy_act = 126 then
--|#line 602 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 602")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 603 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 603")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 128 then
--|#line 607 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 607")
end
;
else
--|#line 0 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 0")
end
default_action
end
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2, 3, 4, 5 then
--|#line 0 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4955)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   14,   19,
			   14,   20,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,   29,   30,   30,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   38,   40,   41,   38,   42,   43,
			   38,   44,   45,   46,   47,   38,   38,   38,   48,   49,
			   38,   50,   51,   38,   52,   53,   54,   55,   14,   56,
			   57,   58,   57,   59,   60,   57,   61,   62,   57,   63,
			   64,   65,   57,   57,   57,   57,   66,   67,   57,   68,
			   69,   70,   71,   72,   74,   74,   79,   79,   75,   75,
			   89,   76,   76,   89,   91,  775,   91,   91,   97,   98,

			  101,  761,  102,  102,  102,  102,  102,  104,  731,  105,
			  156,  106,  106,  106,  106,  106,  112,  112,  166,  112,
			  174,  523,   80,   80,  714,  214,  214,  104,  214,  105,
			  453,  108,  108,  108,  108,  108,   77,   77,  157,  216,
			  216,  114,  216,   99,   90,  445,  167,   90,  175,  107,
			   81,   81,   82,   83,   84,   82,   83,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   85,  107,
			   82,  112,  112,  158,  112,  176,   82,   82,   82,   82,
			   82,   82,  162,  196,  159,  182,  112,  112,  190,  112,
			  186,  168,  169,  183,  163,  187,  114,  170,  685,  192,

			  117,  160,  287,  177,  670,   82,   82,   87,   82,  201,
			  164,  114,  161,  184,  669,  218,  191,  196,  188,  171,
			  172,  185,  165,  189,  115,  173,  116,  193,  117,  196,
			  287,  197,   82,   82,   82,   82,   83,   84,   82,   83,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   85,  115,   82,  116,  112,  112,  202,  112,   82,
			   82,   82,   82,   82,   82,  197,  204,  112,  112,  219,
			  112,  178,  146,  112,  112,  146,  112,  197,  112,  112,
			  114,  112,  147,  198,  179,  198,  198,  654,   82,   82,
			   87,   82,  114,  118,  112,  112,  120,  112,  114,  180,

			  142,  142,  205,  114,  119,  142,  142,  126,  121,  122,
			  288,  556,  181,  207,  337,   82,   82,   82,  196,  114,
			  287,  118,  112,  112,  120,  112,  112,  112,  556,  112,
			  206,  288,  119,  123,  124,  126,  121,  122,  288,  125,
			  112,  112,   91,  112,   91,   91,  142,  114,  291,  205,
			  208,  114,  539,  112,  112,  196,  112,  128,  527,  292,
			  293,  123,  124,  127,  293,  114,  197,  125,  112,  112,
			  129,  112,  209,  210,  218,  209,  136,  206,  114,  295,
			  112,  112,  295,  112,  137,  128,  210,  210,  293,  210,
			  335,  127,  294,  114,  140,  296,  104,  301,  129,  112,

			  112,  297,  112,  197,  136,  114,  302,  295,  138,  296,
			  298,  301,  137,  139,  302,  297,  306,  130,  130,  130,
			  130,  130,  140,  296,  114,  301,  212,  481,  219,  297,
			  141,  131,  213,  210,  302,  213,  138,  299,  132,  303,
			  212,  139,  304,  300,  306,  133,  214,  134,  306,  135,
			  213,  210,  313,  213,  112,  112,  216,  112,  141,  131,
			  112,  112,  481,  112,  214,  215,  132,  241,  241,  241,
			  241,  241,  744,  744,  216,  134,  310,  135,  146,  114,
			  313,  146,  690,  690,  690,  114,  212,  442,  147,  737,
			  243,  243,  243,  243,  243,  345,  148,  148,  148,  148,

			  148,  149,  313,  315,  212,  244,  439,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  150,  148,  151,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  314,  315,  737,  244,  148,  152,  152,  153,  152,  152,
			  152,  152,  152,  152,  154,  152,  155,  152,  152,  152,
			  152,  152,  153,  152,  152,  152,  152,  146,  433,  433,
			  146,  247,  247,  247,  247,  247,  412,  147,  142,  142,
			  198,  412,  198,  198,  400,  148,  148,  148,  148,  148,
			  149,  283,  315,  317,  790,  790,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  399,
			  316,  317,  284,  148,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  195,  195,  554,  195,
			  195,  195,  196,  199,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  195,
			  197,  195,  195,  195,  200,  200,  200,  200,  200,  200,

			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  195,  195,  195,  221,
			  221,  355,  221,  228,  354,  353,  289,  229,  290,  290,
			  290,  290,  290,  352,  351,  347,  230,  230,  230,  230,
			  230,  346,  345,  343,  318,  317,  222,  532,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  231,  318,  319,  112,  112,  236,  112,  236,  236,
			  232,  359,  359,  359,  359,  359,  233,  107,  790,  104,
			  234,  105,  235,  245,  245,  245,  245,  245,  246,  114,

			  223,  224,  224,  208,  224,  224,  224,  224,  226,  224,
			  224,  225,  224,  224,  224,  224,  224,  224,  224,  224,
			  238,  238,  238,  238,  238,  224,  224,  224,  224,  224,
			  224,  107,  104,  318,  105,  239,  245,  245,  245,  245,
			  245,  112,  112,  196,  112,  112,  112,  196,  112,  309,
			  112,  112,  321,  112,  224,  224,  224,  224,  240,  112,
			  112,  320,  112,  239,  112,  112,  114,  112,  112,  112,
			  114,  112,  322,  309,  107,  114,  305,  249,  256,  248,
			  321,  224,  224,  224,  114,  286,  285,  112,  112,  114,
			  112,  145,  283,  114,  250,  252,  112,  112,  321,  112,

			  322,  253,  322,  237,  251,  249,  254,  248,  112,  112,
			  236,  112,  114,  112,  112,  225,  112,  112,  112,  256,
			  112,  114,  250,  252,  112,  112,  323,  112,   95,  253,
			  324,  255,  251,  114,  254,   92,  112,  112,  114,  112,
			  112,  112,  114,  112,  258,  208,  327,  259,  194,  114,
			  257,  112,  112,  325,  112,  112,  112,  326,  112,  255,
			  145,  114,  111,  112,  112,  114,  112,  110,  327,  331,
			  261,  263,  258,  260,  327,  259,  114,  204,  257,  331,
			  114,  325,  262,  264,  109,  326,  333,  103,  114,  100,
			  112,  112,   95,  112,   93,  131,  330,  331,  261,  263,

			   92,  271,  112,  112,  333,  112,  401,  332,  790,  271,
			  262,  264,  265,  205,  333,  114,  266,  112,  112,  267,
			  112,  307,  131,  131,  308,  268,  113,  114,  269,  132,
			  270,  790,  334,  325,  401,  276,  271,  326,  122,  790,
			  265,  206,  114,  790,  266,  112,  112,  267,  112,  307,
			  131,  790,  308,  268,  790,  401,  269,  132,  270,  112,
			  112,  328,  112,  276,  277,  329,  122,  207,  112,  112,
			  114,  112,  112,  112,  790,  112,  790,  272,  272,  272,
			  272,  272,  278,  402,  114,  403,  279,  112,  112,  790,
			  112,  307,  277,  114,  308,  273,  376,  114,  274,  209,

			  210,  280,  209,  205,  275,  210,  210,  376,  210,  790,
			  278,  790,  114,  403,  279,  790,  281,  376,  403,  311,
			  790,  790,  312,  273,  405,  790,  274,  195,  406,  280,
			  407,  206,  275,  213,  210,  376,  213,  282,  790,  200,
			  200,  200,  200,  200,  281,  336,  404,  214,  342,  342,
			  790,  342,  405,  212,  790,  405,  406,  216,  407,  212,
			  360,  360,  360,  360,  360,  282,  790,  790,  213,  210,
			  790,  213,  790,  341,  440,  222,  341,  200,  367,  367,
			  367,  367,  214,  408,  790,  348,  790,  212,  482,  482,
			  790,  483,  216,  349,  350,  350,  350,  350,  350,  790,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  212,  338,  339,  340,  338,  339,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  214,  406,
			  790,  338,  356,  356,  356,  356,  356,  338,  341,  338,
			  338,  338,  338,  357,  407,  357,  411,  239,  358,  358,
			  358,  358,  358,  364,  790,  364,  790,  409,  365,  365,
			  365,  365,  365,  790,  411,  790,  338,  338,  212,  338,
			  240,  790,  410,  790,  411,  239,  361,  361,  361,  361,
			  361,  790,  104,  414,  105,  415,  366,  366,  366,  366,

			  366,  362,  413,  338,  338,  338,  221,  221,  790,  221,
			  368,  368,  368,  368,  368,  113,  113,  113,  113,  113,
			  790,  414,  790,  415,  363,  216,  216,  790,  216,  362,
			  790,  790,  416,  222,  107,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  112,  112,
			  416,  112,  417,  112,  112,  790,  112,  790,  112,  112,
			  790,  112,  112,  112,  414,  112,  112,  112,  790,  112,
			  790,  112,  112,  114,  112,  790,  790,  223,  114,  415,
			  417,  112,  112,  114,  112,  112,  112,  114,  112,  369,

			  370,  114,  418,  416,  790,  371,  114,  112,  112,  790,
			  112,  790,  112,  112,  372,  112,  114,  419,  112,  112,
			  114,  112,  112,  112,  421,  112,  373,  369,  370,  790,
			  790,  420,  114,  371,  421,  790,  374,  114,  112,  112,
			  790,  112,  372,  114,  790,  377,  790,  114,  423,  424,
			  378,  375,  421,  423,  373,  379,  424,  112,  112,  380,
			  112,  790,  422,  114,  374,  112,  112,  427,  112,  381,
			  790,  112,  112,  377,  112,  428,  423,  424,  378,  790,
			  790,  425,  114,  379,  426,  790,  427,  380,  112,  112,
			  114,  112,  790,  428,  431,  427,  114,  381,  112,  112,

			  790,  112,  432,  428,  383,  431,  384,  384,  384,  384,
			  384,  790,  382,  114,  429,  790,  386,  386,  386,  386,
			  386,  430,  431,  114,  112,  112,  790,  112,  112,  112,
			  432,  112,  383,  434,  385,  432,  112,  112,  790,  112,
			  382,  790,  387,  387,  387,  387,  387,  112,  112,  114,
			  112,  436,  790,  114,  388,  388,  388,  388,  388,  790,
			  790,  114,  436,  435,  485,  389,  389,  389,  389,  389,
			  385,  390,  114,  790,  391,  112,  112,  485,  112,  436,
			  392,  790,  385,  113,  113,  113,  113,  113,  112,  112,
			  437,  112,  485,  385,  112,  112,  790,  112,  487,  390,

			  114,  113,  391,  112,  112,  486,  112,  487,  392,  210,
			  210,  790,  210,  114,  112,  112,  790,  112,  790,  114,
			  275,  112,  112,  790,  112,  489,  487,  790,  114,  113,
			  112,  112,  490,  112,  393,  488,  394,  339,  340,  114,
			  339,  112,  112,  790,  112,  790,  114,  790,  275,  112,
			  112,  214,  112,  489,  489,  114,  490,  395,  790,  790,
			  490,  341,  393,  212,  394,  396,  114,  289,  493,  289,
			  289,  289,  289,  289,  114,  289,  286,  290,  290,  290,
			  290,  290,  491,  790,  492,  395,  397,  376,  790,  342,
			  342,  212,  342,  396,  348,  790,  493,  494,  376,  398,

			  790,  790,  349,  350,  350,  350,  350,  350,  376,  358,
			  358,  358,  358,  358,  482,  482,  790,  482,  790,  790,
			  443,  443,  443,  443,  443,  494,  376,  398,  196,  444,
			  444,  444,  444,  444,  493,  239,  446,  446,  446,  446,
			  446,  438,  438,  438,  438,  438,  447,  447,  447,  447,
			  447,  790,  438,  438,  438,  438,  438,  438,  240,  196,
			  496,  790,  495,  239,  790,  112,  112,  445,  112,  790,
			  790,  448,  448,  448,  448,  448,  197,  790,  684,  438,
			  438,  438,  438,  438,  438,  438,  362,  449,  496,  449,
			  114,  790,  450,  450,  450,  450,  450,  451,  451,  451,

			  451,  451,  365,  365,  365,  365,  365,  197,  790,  363,
			  497,  790,  790,  459,  362,  452,  452,  452,  452,  452,
			  454,  455,  790,  456,  456,  456,  456,  456,  457,  457,
			  457,  457,  457,  458,  458,  458,  458,  458,  497,  112,
			  112,  459,  112,  112,  112,  465,  112,  112,  112,  790,
			  112,  790,  790,  453,  112,  112,  465,  112,  112,  112,
			  790,  112,  112,  112,  114,  112,  465,  790,  114,  498,
			  112,  112,  114,  112,  790,  499,  460,  112,  112,  114,
			  112,  790,  790,  114,  465,  112,  112,  114,  112,  496,
			  790,  463,  497,  498,  461,  114,  790,  498,  790,  464,

			  462,  503,  114,  499,  460,  112,  112,  503,  112,  467,
			  114,  505,  790,  790,  466,  112,  112,  500,  112,  463,
			  501,  502,  461,  112,  112,  468,  112,  464,  462,  503,
			  114,  112,  112,  790,  112,  504,  506,  467,  505,  505,
			  114,  113,  466,  790,  113,  469,  112,  112,  114,  112,
			  113,  470,  790,  468,  790,  790,  114,  790,  790,  384,
			  384,  384,  384,  384,  506,  506,  507,  471,  509,  113,
			  510,  114,  113,  469,  509,  472,  510,  266,  113,  470,
			  473,  386,  386,  386,  386,  386,  268,  387,  387,  387,
			  387,  387,  790,  508,  790,  471,  509,  557,  510,  113,

			  557,  265,  513,  472,  514,  266,  482,  482,  473,  483,
			  790,  790,  112,  112,  268,  112,  790,  269,  389,  389,
			  389,  389,  389,  112,  112,  557,  112,  113,  558,  265,
			  388,  388,  388,  388,  388,  790,  790,  114,  475,  475,
			  475,  475,  475,  790,  474,  269,  112,  112,  114,  112,
			  113,  790,  113,  476,  476,  476,  476,  476,  112,  112,
			  554,  112,  112,  112,  511,  112,  790,  113,  551,  559,
			  790,  114,  474,  112,  112,  512,  112,  790,  113,  551,
			  113,  112,  112,  114,  112,  790,  790,  114,  553,  552,
			  790,  529,  511,  529,  478,  113,  481,  559,  114,  790,

			  790,  530,  479,  512,  559,  477,  114,  551,  443,  443,
			  443,  443,  443,  480,  518,  518,  518,  518,  518,  565,
			  566,  567,  478,  517,  519,  519,  519,  519,  519,  531,
			  479,  790,  562,  477,  520,  520,  520,  520,  520,  555,
			  790,  480,  515,  515,  515,  515,  515,  565,  566,  567,
			  790,  517,  445,  515,  515,  515,  515,  515,  515,  521,
			  521,  521,  521,  521,  450,  450,  450,  450,  450,  522,
			  522,  522,  522,  522,  362,  524,  524,  524,  524,  524,
			  515,  515,  515,  515,  515,  515,  515,  525,  525,  525,
			  525,  525,  526,  526,  526,  526,  526,  363,  568,  566,

			  790,  567,  362,  112,  112,  790,  112,  523,  521,  521,
			  521,  521,  521,  455,  790,  456,  456,  456,  456,  456,
			  568,  112,  112,  528,  112,  453,  568,  569,  114,  570,
			  112,  112,  790,  112,  790,  112,  112,  572,  112,  112,
			  112,  790,  112,  790,  112,  112,  114,  112,  571,  112,
			  112,  528,  112,  112,  112,  114,  112,  572,  790,  533,
			  114,  534,  535,  790,  114,  572,  790,  790,  536,  114,
			  112,  112,  790,  112,  114,  790,  112,  112,  114,  112,
			  537,  541,  538,  790,  790,  573,  540,  790,  790,  534,
			  535,  112,  112,  790,  112,  114,  536,  112,  112,  560,

			  112,  114,  574,  112,  112,  575,  112,  542,  537,  541,
			  538,  561,  112,  112,  540,  112,  114,  546,  546,  546,
			  546,  546,  114,  574,  543,  790,  790,  560,  114,  790,
			  574,  113,  790,  575,  575,  542,  545,  114,  790,  561,
			  790,  544,  578,  790,  579,  790,  475,  475,  475,  475,
			  475,  576,  543,  476,  476,  476,  476,  476,  385,  113,
			  113,  580,  577,  581,  545,  112,  112,  391,  112,  544,
			  578,  560,  579,  392,  113,  112,  112,  578,  112,  112,
			  112,  790,  112,  561,  112,  112,  579,  112,  113,  580,
			  114,  581,  790,  790,  790,  391,  790,  790,  547,  563,

			  114,  392,  113,  790,  114,  582,  790,  790,  548,  114,
			  586,  564,  586,  790,  583,  587,  587,  587,  587,  587,
			  589,  112,  112,  549,  112,  550,  547,  588,  588,  588,
			  588,  588,  599,  599,  599,  599,  548,  587,  587,  587,
			  587,  587,  790,  240,  620,  621,  114,  790,  589,  790,
			  790,  549,  790,  550,  584,  584,  584,  584,  584,  521,
			  521,  521,  521,  521,  790,  584,  584,  584,  584,  584,
			  584,  621,  620,  621,  590,  445,  591,  591,  591,  591,
			  591,  592,  592,  592,  592,  592,  593,  593,  593,  593,
			  593,  790,  584,  584,  584,  584,  584,  584,  584,  622,

			  790,  790,  590,  594,  594,  594,  594,  594,  595,  595,
			  595,  595,  595,  790,  523,  596,  596,  596,  596,  596,
			  597,  790,  597,  608,  623,  594,  594,  594,  594,  594,
			  598,  598,  598,  598,  598,  601,  601,  601,  601,  601,
			  608,  453,  112,  112,  608,  112,  624,  623,  112,  112,
			  602,  112,  623,  790,  112,  112,  790,  112,  112,  112,
			  790,  112,  624,  112,  112,  618,  112,  114,  608,  112,
			  112,  603,  112,  114,  624,  625,  618,  604,  602,  114,
			  790,  112,  112,  114,  112,  627,  619,  605,  114,  790,
			  626,  619,  112,  112,  114,  112,  628,  790,  606,  603,

			  629,  607,  619,  630,  618,  604,  114,  112,  112,  790,
			  112,  628,  619,  627,  609,  605,  629,  114,  112,  112,
			  790,  112,  630,  790,  628,  610,  606,  611,  629,  607,
			  619,  630,  114,  112,  112,  790,  112,  112,  112,  631,
			  112,  634,  609,  114,  632,  546,  546,  546,  546,  546,
			  633,  613,  612,  610,  634,  611,  112,  112,  114,  112,
			  112,  112,  114,  112,  790,  614,  113,  112,  112,  634,
			  112,  790,  268,  636,  637,  636,  790,  637,  640,  613,
			  612,  114,  635,  641,  642,  114,  640,  616,  112,  112,
			  790,  112,  114,  614,  113,  764,  764,  764,  764,  617,

			  268,  636,  637,  638,  615,  639,  640,  777,  777,  777,
			  777,  641,  642,  114,  643,  616,  587,  587,  587,  587,
			  587,  587,  587,  587,  587,  587,  661,  617,  112,  112,
			  790,  112,  615,  644,  644,  644,  644,  644,  646,  646,
			  646,  646,  646,  790,  644,  644,  644,  644,  644,  644,
			  647,  790,  647,  114,  661,  648,  648,  648,  648,  648,
			  649,  790,  649,  790,  790,  650,  650,  650,  650,  650,
			  652,  644,  644,  644,  644,  644,  644,  644,  650,  650,
			  650,  650,  650,  651,  651,  651,  651,  651,  594,  594,
			  594,  594,  594,  363,  790,  790,  790,  790,  652,  653,

			  653,  653,  653,  653,  594,  594,  594,  594,  594,  655,
			  655,  655,  655,  655,  790,  790,  523,  656,  656,  656,
			  656,  656,  657,  657,  657,  657,  657,  658,  671,  658,
			  790,  663,  659,  659,  659,  659,  659,  652,  112,  112,
			  672,  112,  112,  112,  790,  112,  112,  112,  663,  112,
			  112,  112,  663,  112,  112,  112,  671,  112,  112,  112,
			  363,  112,  672,  114,  674,  652,  790,  114,  672,  112,
			  112,  114,  112,  662,  790,  114,  663,  112,  112,  114,
			  112,  790,  660,  114,  112,  112,  674,  112,  112,  112,
			  673,  112,  674,  790,  114,  112,  112,  676,  112,  676,

			  678,  662,  114,  790,  112,  112,  678,  112,  664,  114,
			  660,  680,  681,  114,  675,  682,  680,  665,  790,  790,
			  114,  666,  790,  790,  790,  676,  790,  677,  678,  114,
			  704,  667,  112,  112,  679,  112,  664,  668,  790,  680,
			  681,  790,  790,  682,  683,  665,  692,  693,  692,  666,
			  648,  648,  648,  648,  648,  790,  790,  114,  704,  667,
			  686,  686,  686,  686,  686,  668,  650,  650,  650,  650,
			  650,  650,  650,  650,  650,  650,  687,  687,  687,  687,
			  687,  688,  790,  688,  694,  790,  689,  689,  689,  689,
			  689,  691,  691,  691,  691,  691,  790,  790,  445,  593, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  593,  593,  593,  593,  659,  659,  659,  659,  659,  695,
			  695,  695,  695,  695,  652,  112,  112,  705,  112,  112,
			  112,  790,  112,  790,  112,  112,  790,  112,  112,  112,
			  790,  112,  790,  112,  112,  790,  112,  363,  112,  112,
			  114,  112,  652,  790,  114,  705,  696,  453,  790,  114,
			  705,  112,  112,  114,  112,  790,  697,  698,  114,  699,
			  702,  707,  703,  114,  702,  700,  703,  707,  709,  709,
			  711,  701,  712,  711,  696,  790,  114,  790,  706,  790,
			  790,  702,  790,  703,  697,  698,  790,  699,  790,  707,
			  790,  790,  702,  700,  703,  708,  709,  710,  711,  701,

			  712,  713,  646,  646,  646,  646,  646,  689,  689,  689,
			  689,  689,  715,  715,  715,  715,  715,  716,  716,  716,
			  716,  716,  531,  531,  531,  531,  531,  717,  717,  717,
			  717,  717,  718,  718,  718,  718,  718,  725,  790,  726,
			  445,  653,  653,  653,  653,  653,  112,  112,  790,  112,
			  523,  112,  112,  723,  112,  112,  112,  723,  112,  112,
			  112,  726,  112,  112,  112,  725,  112,  726,  728,  112,
			  112,  114,  112,  728,  723,  730,  114,  724,  790,  453,
			  114,  724,  719,  738,  114,  723,  739,  790,  114,  727,
			  739,  790,  721,  741,  114,  741,  728,  720,  724,  112,

			  112,  729,  112,  730,  687,  687,  687,  687,  687,  724,
			  719,  738,  790,  790,  739,  722,  112,  112,  740,  112,
			  721,  741,  790,  742,  114,  720,  732,  732,  732,  732,
			  732,  692,  733,  692,  743,  749,  718,  718,  718,  718,
			  718,  114,  523,  722,  790,  112,  112,  790,  112,  112,
			  112,  790,  112,  745,  745,  745,  745,  745,  112,  112,
			  733,  112,  743,  749,  112,  112,  734,  112,  750,  694,
			  114,  748,  112,  112,  114,  112,  790,  112,  112,  748,
			  112,  790,  790,  114,  751,  751,  751,  751,  751,  114,
			  735,  790,  748,  755,  734,  790,  750,  114,  756,  736,

			  112,  112,  114,  112,  746,  762,  790,  748,  694,  694,
			  694,  694,  694,  112,  112,  754,  112,  790,  735,  747,
			  757,  755,  757,  754,  767,  114,  756,  736,  112,  112,
			  758,  112,  746,  762,  112,  112,  754,  112,  114,  763,
			  763,  763,  763,  763,  790,  766,  753,  747,  790,  790,
			  752,  754,  767,  114,  112,  112,  766,  112,  759,  114,
			  768,  768,  768,  768,  768,  770,  766,  790,  112,  112,
			  760,  112,  790,  772,  753,  772,  770,  790,  752,  114,
			  790,  790,  790,  773,  766,  790,  770,  765,  769,  769,
			  769,  769,  769,  114,  790,  790,  790,  790,  760,  771,

			  771,  771,  771,  771,  770,  759,  759,  759,  759,  759,
			  778,  774,  783,  784,  783,  765,  776,  776,  776,  776,
			  776,  779,  779,  779,  779,  779,  781,  778,  790,  790,
			  790,  778,  780,  780,  780,  780,  780,  782,  782,  782,
			  782,  782,  790,  781,  790,  790,  790,  781,  790,  790,
			  785,  790,  790,  790,  790,  778,  774,  774,  774,  774,
			  774,  786,  786,  786,  786,  786,  787,  787,  787,  787,
			  787,  781,  788,  788,  788,  788,  788,  783,  790,  783,
			  790,  790,  787,  787,  787,  787,  787,  789,  789,  789,
			  789,  789,  785,  785,  785,  785,  785,  441,  441,  790,

			  790,  790,  790,  441,  441,  441,  441,  441,  441,  790,
			  790,  790,  790,  790,  790,  785,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   88,   88,   88,   88,

			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   94,   94,  790,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  790,   94,   94,   94,   94,   94,   96,   96,  790,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,  113,  113,  113,  790,  790,  790,  790,  790,  790,
			  113,  113,  790,  790,  113,  790,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  790,
			  790,  113,  113,  113,  143,  143,  790,  143,  143,  790,
			  143,  143,  790,  790,  790,  790,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,

			  143,  143,  143,  143,  143,  143,  143,  143,  143,  790,
			  790,  143,  143,  143,  144,  144,  790,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  195,
			  195,  790,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,

			  195,  195,  195,  195,  197,  197,  790,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  206,  206,  206,  206,  206,  206,

			  206,  206,  206,  790,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  211,
			  211,  211,  790,  790,  790,  211,  211,  790,  211,  211,
			  790,  790,  790,  790,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  790,  211,  211,
			  211,  211,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,

			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  224,  224,  790,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,

			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  227,  227,  790,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  100,  242,  242,  242,
			  242,  242,  242,  242,  242,  790,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  142,  142,  790,  142,  142,  790,  142,  142,
			  142,  790,  790,  790,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  790,  790,  142,
			  142,  142,  215,  215,  215,  215,  215,  215,  215,  215,

			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  223,  223,  223,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  790,  790,  790,  790,  790,
			  223,  344,  344,  790,  344,  790,  790,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  344,  344,  344,  344,

			  344,  344,  344,  344,  344,  344,  344,  344,  344,  344,
			  790,  790,  344,  344,  344,  338,  338,  338,  338,  338,
			  338,  790,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  790,  338,  338,  338,  338,
			  484,  484,  484,  790,  790,  790,  484,  484,  790,  484,
			  484,  790,  790,  790,  790,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  484,  484,  790,  790,

			  484,  484,  484,  400,  400,  400,  790,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  790,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  516,  516,
			  790,  790,  790,  790,  516,  516,  516,  516,  516,  516,
			  553,  553,  553,  790,  790,  790,  553,  553,  790,  553,
			  553,  790,  790,  790,  790,  553,  553,  553,  553,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  553,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  790,  553,

			  553,  553,  553,  585,  585,  790,  790,  790,  790,  585,
			  585,  585,  585,  585,  585,  600,  600,  600,  600,  600,
			  600,  600,  600,  790,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  645,  645,  790,  790,  790,  790,  645,  645,  645,  645,
			  645,  645,   13,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790, yy_Dummy>>,
			1, 1956, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4955)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    4,    5,    6,    3,    4,
			   11,    3,    4,   12,   15,  770,   15,   15,   20,   20,

			   27,  754,   27,   27,   27,   27,   27,   29,  716,   29,
			   58,   29,   29,   29,   29,   29,   38,   38,   61,   38,
			   63,  687,    5,    6,  685,  214,  214,   30,  214,   30,
			  653,   30,   30,   30,   30,   30,    3,    4,   58,  216,
			  216,   38,  216,   20,   11,  646,   61,   12,   63,   29,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   30,
			    9,   39,   39,   59,   39,   64,    9,    9,    9,    9,
			    9,    9,   60,   73,   59,   66,   37,   37,   68,   37,
			   67,   62,   62,   66,   60,   67,   39,   62,  645,   69,

			   39,   59,  150,   64,  619,    9,    9,    9,    9,   77,
			   60,   37,   59,   66,  618,   88,   68,  195,   67,   62,
			   62,   66,   60,   67,   37,   62,   37,   69,   39,  336,
			  150,   73,    9,    9,    9,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   37,   10,   37,   40,   40,   77,   40,   10,
			   10,   10,   10,   10,   10,  195,   78,   41,   41,   88,
			   41,   65,  146,   42,   42,  146,   42,  336,   44,   44,
			   40,   44,  146,   74,   65,   74,   74,  596,   10,   10,
			   10,   10,   41,   40,   43,   43,   41,   43,   42,   65,

			   52,   52,   78,   44,   40,   52,   52,   44,   41,   42,
			  151,  486,   65,   80,  208,   10,   10,   10,  199,   43,
			  154,   40,   45,   45,   41,   45,   46,   46,  485,   46,
			   78,  155,   40,   43,   43,   44,   41,   42,  151,   43,
			   48,   48,   91,   48,   91,   91,   52,   45,  154,   80,
			  208,   46,  465,   50,   50,  684,   50,   46,  454,  155,
			  156,   43,   43,   45,  157,   48,  199,   43,   49,   49,
			   46,   49,   83,   83,  217,   83,   48,   80,   50,  158,
			   51,   51,  160,   51,   48,   46,   84,   84,  156,   84,
			  199,   45,  157,   49,   50,  159,  447,  162,   46,   47,

			   47,  159,   47,  684,   48,   51,  163,  158,   49,  161,
			  160,  164,   48,   49,  165,  161,  168,   47,   47,   47,
			   47,   47,   50,  159,   47,  162,   83,  437,  217,  159,
			   51,   47,   86,   86,  163,   86,   49,  161,   47,  164,
			   84,   49,  165,  161,  168,   47,   86,   47,  171,   47,
			   85,   85,  174,   85,  112,  112,   86,  112,   51,   47,
			  113,  113,  436,  113,   85,   85,   47,  104,  104,  104,
			  104,  104,  731,  731,   85,   47,  171,   47,   56,  112,
			  174,   56,  654,  654,  654,  113,   86,  345,   56,  723,
			  105,  105,  105,  105,  105,  344,   56,   56,   56,   56,

			   56,   56,  175,  176,   85,  105,  338,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			  175,  176,  723,  105,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   57,  330,  327,
			   57,  107,  107,  107,  107,  107,  304,   57,  143,  143,
			  198,  302,  198,  198,  286,   57,   57,   57,   57,   57,
			   57,  143,  177,  178,  553,  553,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,  283,
			  177,  178,  143,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   76,   76,  553,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,

			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   89,
			   89,  235,   89,   99,  234,  233,  153,   99,  153,  153,
			  153,  153,  153,  232,  231,  229,   99,   99,   99,   99,
			   99,  228,  227,  226,  179,  180,   89,  458,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   99,  179,  180,  134,  134,  236,  134,  236,  236,
			   99,  240,  240,  240,  240,  240,   99,  458,  221,  106,
			   99,  106,   99,  106,  106,  106,  106,  106,  106,  134,

			   89,   97,   97,  206,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			  102,  102,  102,  102,  102,   97,   97,   97,   97,   97,
			   97,  106,  108,  181,  108,  102,  108,  108,  108,  108,
			  108,  115,  115,  202,  115,  116,  116,  197,  116,  173,
			  117,  117,  182,  117,   97,   97,   97,   97,  102,  118,
			  118,  181,  118,  102,  119,  119,  115,  119,  120,  120,
			  116,  120,  183,  170,  108,  117,  167,  116,  166,  115,
			  182,   97,   97,   97,  118,  149,  147,  121,  121,  119,
			  121,  144,  142,  120,  117,  119,  122,  122,  184,  122,

			  183,  119,  185,  101,  118,  116,  120,  115,  123,  123,
			  100,  123,  121,  124,  124,   96,  124,  125,  125,  122,
			  125,  122,  117,  119,  126,  126,  184,  126,   94,  119,
			  185,  121,  118,  123,  120,   92,  127,  127,  124,  127,
			  128,  128,  125,  128,  124,   81,  187,  124,   70,  126,
			  123,  129,  129,  186,  129,  131,  131,  186,  131,  121,
			   55,  127,   36,  132,  132,  128,  132,   35,  189,  190,
			  126,  128,  124,  125,  187,  124,  129,  203,  123,  191,
			  131,  186,  127,  129,   33,  186,  192,   28,  132,   26,
			  135,  135,   18,  135,   17,  132,  189,  190,  126,  128,

			   16,  131,  136,  136,  193,  136,  287,  191,   13,  132,
			  127,  129,  130,  203,  192,  135,  130,  137,  137,  130,
			  137,  169,  135,  132,  169,  130,  130,  136,  130,  135,
			  130,    0,  193,  188,  287,  136,  135,  188,  136,    0,
			  130,  203,  137,    0,  130,  138,  138,  130,  138,  169,
			  135,    0,  169,  130,    0,  291,  130,  135,  130,  133,
			  133,  188,  133,  136,  137,  188,  136,  205,  139,  139,
			  138,  139,  140,  140,    0,  140,    0,  133,  133,  133,
			  133,  133,  138,  291,  133,  293,  138,  141,  141,    0,
			  141,  172,  137,  139,  172,  133,  256,  140,  133,  209,

			  209,  139,  209,  205,  133,  210,  210,  256,  210,    0,
			  138,    0,  141,  293,  138,    0,  140,  256,  294,  172,
			    0,    0,  172,  133,  295,    0,  133,  200,  296,  139,
			  297,  205,  133,  211,  211,  256,  211,  141,    0,  200,
			  200,  200,  200,  200,  140,  200,  294,  211,  222,  222,
			    0,  222,  295,  209,    0,  298,  296,  211,  297,  210,
			  241,  241,  241,  241,  241,  141,  148,    0,  213,  213,
			    0,  213,    0,  341,  341,  222,  341,  200,  246,  246,
			  246,  246,  213,  298,    0,  230,    0,  211,  399,  399,
			    0,  399,  213,  230,  230,  230,  230,  230,  230,    0,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  213,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  299,
			    0,  215,  238,  238,  238,  238,  238,  215,  215,  215,
			  215,  215,  215,  239,  300,  239,  301,  238,  239,  239,
			  239,  239,  239,  244,    0,  244,    0,  299,  244,  244,
			  244,  244,  244,    0,  303,    0,  215,  215,  215,  215,
			  238,    0,  300,    0,  301,  238,  243,  243,  243,  243,
			  243,    0,  245,  306,  245,  307,  245,  245,  245,  245,

			  245,  243,  303,  215,  215,  215,  218,  218,    0,  218,
			  247,  247,  247,  247,  247,  271,  271,  271,  271,  271,
			    0,  306,    0,  307,  243,  440,  440,    0,  440,  243,
			    0,    0,  308,  218,  245,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  248,  248,
			  308,  248,  309,  249,  249,    0,  249,    0,  250,  250,
			    0,  250,  251,  251,  310,  251,  252,  252,    0,  252,
			    0,  253,  253,  248,  253,    0,    0,  218,  249,  311,
			  309,  254,  254,  250,  254,  255,  255,  251,  255,  248,

			  250,  252,  310,  312,    0,  251,  253,  257,  257,    0,
			  257,    0,  258,  258,  252,  258,  254,  311,  259,  259,
			  255,  259,  260,  260,  313,  260,  253,  248,  250,    0,
			    0,  312,  257,  251,  314,    0,  254,  258,  261,  261,
			    0,  261,  252,  259,    0,  257,    0,  260,  317,  318,
			  258,  255,  313,  319,  253,  259,  320,  262,  262,  260,
			  262,    0,  314,  261,  254,  263,  263,  321,  263,  261,
			    0,  264,  264,  257,  264,  322,  317,  318,  258,    0,
			    0,  319,  262,  259,  320,    0,  323,  260,  265,  265,
			  263,  265,    0,  324,  325,  321,  264,  261,  266,  266,

			    0,  266,  326,  322,  264,  328,  265,  265,  265,  265,
			  265,    0,  263,  265,  323,    0,  266,  266,  266,  266,
			  266,  324,  325,  266,  267,  267,    0,  267,  268,  268,
			  326,  268,  264,  328,  265,  329,  269,  269,    0,  269,
			  263,    0,  267,  267,  267,  267,  267,  270,  270,  267,
			  270,  333,    0,  268,  269,  269,  269,  269,  269,    0,
			    0,  269,  334,  329,  401,  270,  270,  270,  270,  270,
			  267,  272,  270,    0,  272,  274,  274,  402,  274,  333,
			  272,    0,  269,  273,  273,  273,  273,  273,  275,  275,
			  334,  275,  401,  270,  276,  276,    0,  276,  403,  272,

			  274,  273,  272,  277,  277,  402,  277,  404,  272,  340,
			  340,    0,  340,  275,  278,  278,    0,  278,    0,  276,
			  274,  279,  279,    0,  279,  406,  403,    0,  277,  273,
			  280,  280,  407,  280,  276,  404,  277,  339,  339,  278,
			  339,  281,  281,    0,  281,    0,  279,    0,  274,  282,
			  282,  339,  282,  406,  409,  280,  410,  278,    0,    0,
			  407,  339,  276,  340,  277,  279,  281,  289,  411,  289,
			  289,  289,  289,  289,  282,  290,  305,  290,  290,  290,
			  290,  290,  409,    0,  410,  278,  280,  305,    0,  342,
			  342,  339,  342,  279,  350,    0,  411,  412,  305,  282,

			    0,    0,  350,  350,  350,  350,  350,  350,  305,  357,
			  357,  357,  357,  357,  482,  482,  342,  482,    0,    0,
			  356,  356,  356,  356,  356,  412,  305,  282,  335,  358,
			  358,  358,  358,  358,  413,  356,  359,  359,  359,  359,
			  359,  335,  335,  335,  335,  335,  360,  360,  360,  360,
			  360,    0,  335,  335,  335,  335,  335,  335,  356,  644,
			  414,    0,  413,  356,    0,  369,  369,  358,  369,    0,
			    0,  361,  361,  361,  361,  361,  335,    0,  644,  335,
			  335,  335,  335,  335,  335,  335,  361,  362,  414,  362,
			  369,    0,  362,  362,  362,  362,  362,  363,  363,  363,

			  363,  363,  364,  364,  364,  364,  364,  644,    0,  361,
			  415,    0,    0,  369,  361,  365,  365,  365,  365,  365,
			  366,  366,    0,  366,  366,  366,  366,  366,  367,  367,
			  367,  367,  367,  368,  368,  368,  368,  368,  415,  370,
			  370,  369,  370,  371,  371,  376,  371,  372,  372,    0,
			  372,    0,    0,  365,  373,  373,  376,  373,  374,  374,
			    0,  374,  378,  378,  370,  378,  376,    0,  371,  416,
			  375,  375,  372,  375,    0,  417,  370,  377,  377,  373,
			  377,    0,    0,  374,  376,  379,  379,  378,  379,  418,
			    0,  374,  419,  420,  372,  375,    0,  416,    0,  375,

			  373,  421,  377,  417,  370,  380,  380,  422,  380,  378,
			  379,  423,    0,    0,  377,  381,  381,  418,  381,  374,
			  419,  420,  372,  382,  382,  379,  382,  375,  373,  421,
			  380,  383,  383,    0,  383,  422,  424,  378,  425,  423,
			  381,  385,  377,    0,  385,  380,  392,  392,  382,  392,
			  385,  381,    0,  379,    0,    0,  383,    0,    0,  384,
			  384,  384,  384,  384,  424,  426,  425,  382,  431,  385,
			  432,  392,  385,  380,  434,  383,  435,  384,  385,  381,
			  384,  386,  386,  386,  386,  386,  384,  387,  387,  387,
			  387,  387,    0,  426,    0,  382,  431,  487,  432,  386,

			  488,  387,  434,  383,  435,  384,  483,  483,  384,  483,
			    0,    0,  388,  388,  384,  388,    0,  387,  389,  389,
			  389,  389,  389,  393,  393,  487,  393,  386,  488,  387,
			  388,  388,  388,  388,  388,    0,    0,  388,  390,  390,
			  390,  390,  390,    0,  388,  387,  394,  394,  393,  394,
			  389,    0,  390,  391,  391,  391,  391,  391,  395,  395,
			  483,  395,  396,  396,  433,  396,    0,  391,  481,  489,
			    0,  394,  388,  397,  397,  433,  397,    0,  389,  481,
			  390,  398,  398,  395,  398,  484,  484,  396,  484,  481,
			    0,  457,  433,  457,  396,  391,  398,  489,  397,    0,

			    0,  457,  397,  433,  491,  395,  398,  481,  443,  443,
			  443,  443,  443,  397,  444,  444,  444,  444,  444,  494,
			  496,  497,  396,  443,  445,  445,  445,  445,  445,  457,
			  397,    0,  491,  395,  446,  446,  446,  446,  446,  484,
			    0,  397,  438,  438,  438,  438,  438,  494,  496,  497,
			    0,  443,  444,  438,  438,  438,  438,  438,  438,  448,
			  448,  448,  448,  448,  449,  449,  449,  449,  449,  450,
			  450,  450,  450,  450,  448,  451,  451,  451,  451,  451,
			  438,  438,  438,  438,  438,  438,  438,  452,  452,  452,
			  452,  452,  453,  453,  453,  453,  453,  448,  498,  500,

			    0,  501,  448,  459,  459,    0,  459,  450,  455,  455,
			  455,  455,  455,  456,    0,  456,  456,  456,  456,  456,
			  502,  460,  460,  455,  460,  452,  498,  500,  459,  501,
			  461,  461,    0,  461,    0,  462,  462,  503,  462,  463,
			  463,    0,  463,    0,  464,  464,  460,  464,  502,  467,
			  467,  455,  467,  466,  466,  461,  466,  504,    0,  459,
			  462,  460,  461,    0,  463,  503,    0,    0,  462,  464,
			  468,  468,    0,  468,  467,    0,  469,  469,  466,  469,
			  462,  467,  464,    0,    0,  504,  466,    0,    0,  460,
			  461,  470,  470,    0,  470,  468,  462,  471,  471,  490,

			  471,  469,  505,  472,  472,  506,  472,  468,  462,  467,
			  464,  490,  474,  474,  466,  474,  470,  473,  473,  473,
			  473,  473,  471,  507,  470,    0,    0,  490,  472,    0,
			  505,  473,    0,  506,  508,  468,  472,  474,    0,  490,
			    0,  471,  509,    0,  510,    0,  475,  475,  475,  475,
			  475,  507,  470,  476,  476,  476,  476,  476,  474,  473,
			  475,  511,  508,  512,  472,  477,  477,  475,  477,  471,
			  509,  492,  510,  475,  476,  478,  478,  513,  478,  479,
			  479,    0,  479,  492,  480,  480,  514,  480,  475,  511,
			  477,  512,    0,    0,    0,  475,    0,    0,  477,  492,

			  478,  475,  476,    0,  479,  513,    0,    0,  478,  480,
			  517,  492,  517,    0,  514,  517,  517,  517,  517,  517,
			  520,  537,  537,  479,  537,  480,  477,  519,  519,  519,
			  519,  519,  530,  530,  530,  530,  478,  518,  518,  518,
			  518,  518,    0,  520,  556,  557,  537,    0,  520,    0,
			    0,  479,    0,  480,  515,  515,  515,  515,  515,  521,
			  521,  521,  521,  521,    0,  515,  515,  515,  515,  515,
			  515,  558,  556,  557,  521,  518,  522,  522,  522,  522,
			  522,  523,  523,  523,  523,  523,  524,  524,  524,  524,
			  524,    0,  515,  515,  515,  515,  515,  515,  515,  558,

			    0,    0,  521,  525,  525,  525,  525,  525,  526,  526,
			  526,  526,  526,    0,  522,  527,  527,  527,  527,  527,
			  528,    0,  528,  539,  559,  528,  528,  528,  528,  528,
			  529,  529,  529,  529,  529,  532,  532,  532,  532,  532,
			  539,  525,  533,  533,  539,  533,  560,  562,  534,  534,
			  532,  534,  559,    0,  535,  535,    0,  535,  536,  536,
			    0,  536,  563,  538,  538,  551,  538,  533,  539,  540,
			  540,  533,  540,  534,  560,  562,  551,  534,  532,  535,
			    0,  542,  542,  536,  542,  565,  551,  535,  538,    0,
			  563,  552,  541,  541,  540,  541,  566,    0,  536,  533,

			  567,  538,  552,  568,  551,  534,  542,  543,  543,    0,
			  543,  569,  552,  565,  540,  535,  570,  541,  544,  544,
			    0,  544,  571,    0,  566,  541,  536,  542,  567,  538,
			  552,  568,  543,  545,  545,    0,  545,  547,  547,  569,
			  547,  572,  540,  544,  570,  546,  546,  546,  546,  546,
			  571,  544,  543,  541,  573,  542,  549,  549,  545,  549,
			  548,  548,  547,  548,    0,  545,  546,  550,  550,  572,
			  550,    0,  546,  574,  575,  576,    0,  577,  579,  544,
			  543,  549,  573,  580,  581,  548,  583,  549,  604,  604,
			    0,  604,  550,  545,  546,  758,  758,  758,  758,  550,

			  546,  574,  575,  576,  548,  577,  579,  773,  773,  773,
			  773,  580,  581,  604,  583,  549,  586,  586,  586,  586,
			  586,  587,  587,  587,  587,  587,  604,  550,  605,  605,
			    0,  605,  548,  584,  584,  584,  584,  584,  588,  588,
			  588,  588,  588,    0,  584,  584,  584,  584,  584,  584,
			  589,    0,  589,  605,  604,  589,  589,  589,  589,  589,
			  590,    0,  590,    0,    0,  590,  590,  590,  590,  590,
			  593,  584,  584,  584,  584,  584,  584,  584,  591,  591,
			  591,  591,  591,  592,  592,  592,  592,  592,  594,  594,
			  594,  594,  594,  593,    0,    0,    0,    0,  593,  595,

			  595,  595,  595,  595,  597,  597,  597,  597,  597,  598,
			  598,  598,  598,  598,    0,    0,  591,  599,  599,  599,
			  599,  599,  601,  601,  601,  601,  601,  602,  620,  602,
			    0,  608,  602,  602,  602,  602,  602,  601,  603,  603,
			  621,  603,  606,  606,    0,  606,  607,  607,  608,  607,
			  609,  609,  608,  609,  610,  610,  620,  610,  611,  611,
			  601,  611,  622,  603,  624,  601,    0,  606,  621,  612,
			  612,  607,  612,  606,    0,  609,  608,  613,  613,  610,
			  613,    0,  603,  611,  614,  614,  626,  614,  615,  615,
			  622,  615,  624,    0,  612,  616,  616,  630,  616,  633,

			  636,  606,  613,    0,  617,  617,  638,  617,  611,  614,
			  603,  640,  641,  615,  626,  642,  643,  613,    0,    0,
			  616,  615,    0,    0,    0,  630,    0,  633,  636,  617,
			  671,  616,  664,  664,  638,  664,  611,  617,    0,  640,
			  641,    0,    0,  642,  643,  613,  656,  656,  656,  615,
			  647,  647,  647,  647,  647,    0,    0,  664,  671,  616,
			  648,  648,  648,  648,  648,  617,  649,  649,  649,  649,
			  649,  650,  650,  650,  650,  650,  651,  651,  651,  651,
			  651,  652,    0,  652,  656,    0,  652,  652,  652,  652,
			  652,  655,  655,  655,  655,  655,    0,    0,  648,  657, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  657,  657,  657,  657,  658,  658,  658,  658,  658,  659,
			  659,  659,  659,  659,  657,  660,  660,  672,  660,  661,
			  661,    0,  661,    0,  662,  662,    0,  662,  665,  665,
			    0,  665,    0,  666,  666,    0,  666,  657,  667,  667,
			  660,  667,  657,    0,  661,  672,  660,  659,    0,  662,
			  673,  668,  668,  665,  668,    0,  661,  662,  666,  665,
			  669,  674,  670,  667,  669,  666,  670,  675,  678,  679,
			  680,  667,  681,  683,  660,    0,  668,    0,  673,    0,
			    0,  669,    0,  670,  661,  662,    0,  665,    0,  674,
			    0,    0,  669,  666,  670,  675,  678,  679,  680,  667,

			  681,  683,  686,  686,  686,  686,  686,  688,  688,  688,
			  688,  688,  689,  689,  689,  689,  689,  690,  690,  690,
			  690,  690,  691,  691,  691,  691,  691,  692,  692,  692,
			  692,  692,  693,  693,  693,  693,  693,  704,    0,  705,
			  686,  695,  695,  695,  695,  695,  696,  696,    0,  696,
			  689,  697,  697,  702,  697,  698,  698,  702,  698,  699,
			  699,  706,  699,  700,  700,  704,  700,  705,  709,  701,
			  701,  696,  701,  710,  702,  712,  697,  703,    0,  695,
			  698,  703,  696,  725,  699,  702,  726,    0,  700,  706,
			  727,    0,  699,  728,  701,  729,  709,  697,  703,  719,

			  719,  710,  719,  712,  715,  715,  715,  715,  715,  703,
			  696,  725,    0,    0,  726,  701,  720,  720,  727,  720,
			  699,  728,    0,  729,  719,  697,  717,  717,  717,  717,
			  717,  718,  719,  718,  730,  738,  718,  718,  718,  718,
			  718,  720,  715,  701,    0,  721,  721,    0,  721,  722,
			  722,    0,  722,  732,  732,  732,  732,  732,  733,  733,
			  719,  733,  730,  738,  734,  734,  720,  734,  743,  718,
			  721,  737,  735,  735,  722,  735,    0,  736,  736,  737,
			  736,    0,    0,  733,  744,  744,  744,  744,  744,  734,
			  721,    0,  737,  749,  720,    0,  743,  735,  750,  722,

			  746,  746,  736,  746,  733,  755,    0,  737,  745,  745,
			  745,  745,  745,  747,  747,  748,  747,    0,  721,  736,
			  751,  749,  751,  748,  762,  746,  750,  722,  752,  752,
			  751,  752,  733,  755,  753,  753,  748,  753,  747,  757,
			  757,  757,  757,  757,    0,  761,  747,  736,    0,    0,
			  746,  748,  762,  752,  760,  760,  761,  760,  751,  753,
			  763,  763,  763,  763,  763,  766,  761,    0,  765,  765,
			  752,  765,    0,  769,  747,  769,  766,    0,  746,  760,
			    0,    0,    0,  769,  761,    0,  766,  760,  764,  764,
			  764,  764,  764,  765,    0,    0,    0,    0,  752,  768,

			  768,  768,  768,  768,  766,  771,  771,  771,  771,  771,
			  775,  769,  780,  780,  780,  760,  772,  772,  772,  772,
			  772,  776,  776,  776,  776,  776,  778,  775,    0,    0,
			    0,  775,  777,  777,  777,  777,  777,  779,  779,  779,
			  779,  779,    0,  778,    0,    0,    0,  778,    0,    0,
			  780,    0,    0,    0,    0,  775,  782,  782,  782,  782,
			  782,  783,  783,  783,  783,  783,  784,  784,  784,  784,
			  784,  778,  786,  786,  786,  786,  786,  787,    0,  787,
			    0,    0,  787,  787,  787,  787,  787,  788,  788,  788,
			  788,  788,  789,  789,  789,  789,  789,  817,  817,    0,

			    0,    0,    0,  817,  817,  817,  817,  817,  817,    0,
			    0,    0,    0,    0,    0,  787,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,

			  792,  792,  792,  792,  792,  792,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  795,  795,  795,  795,

			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  796,  796,    0,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			    0,  796,  796,  796,  796,  796,  797,  797,    0,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  798,  798,  798,    0,    0,    0,    0,    0,    0,
			  798,  798,    0,    0,  798,    0,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,    0,
			    0,  798,  798,  798,  799,  799,    0,  799,  799,    0,
			  799,  799,    0,    0,    0,    0,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,

			  799,  799,  799,  799,  799,  799,  799,  799,  799,    0,
			    0,  799,  799,  799,  800,  800,    0,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  801,
			  801,    0,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,

			  801,  801,  801,  801,  802,  802,    0,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  804,  804,  804,  804,  804,  804,

			  804,  804,  804,    0,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  805,
			  805,  805,    0,    0,    0,  805,  805,    0,  805,  805,
			    0,    0,    0,    0,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,    0,  805,  805,
			  805,  805,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  808,  808,    0,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,

			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  809,  809,    0,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,

			  810,  810,  810,  810,  810,  810,  810,  811,  811,  811,
			  811,  811,  811,  811,  811,    0,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  812,  812,    0,  812,  812,    0,  812,  812,
			  812,    0,    0,    0,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,    0,    0,  812,
			  812,  812,  813,  813,  813,  813,  813,  813,  813,  813,

			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  814,  814,  814,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,    0,    0,    0,    0,    0,
			  814,  815,  815,    0,  815,    0,    0,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,

			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			    0,    0,  815,  815,  815,  816,  816,  816,  816,  816,
			  816,    0,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,    0,  816,  816,  816,  816,
			  818,  818,  818,    0,    0,    0,  818,  818,    0,  818,
			  818,    0,    0,    0,    0,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,    0,    0,

			  818,  818,  818,  819,  819,  819,    0,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,    0,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  820,  820,
			    0,    0,    0,    0,  820,  820,  820,  820,  820,  820,
			  821,  821,  821,    0,    0,    0,  821,  821,    0,  821,
			  821,    0,    0,    0,    0,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,    0,  821,

			  821,  821,  821,  822,  822,    0,    0,    0,    0,  822,
			  822,  822,  822,  822,  822,  823,  823,  823,  823,  823,
			  823,  823,  823,    0,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  824,  824,    0,    0,    0,    0,  824,  824,  824,  824,
			  824,  824,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790, yy_Dummy>>,
			1, 1956, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64, 1008, 4872,   92,  997,  966,  985, 4872,
			   88, 4872, 4872, 4872, 4872, 4872,  972,   82,  968,   91,
			  111, 4872, 4872,  956, 4872,  939,  932,  184,  114,  169,
			  253,  265,  271,  292,  276,  320,  324,  397,  338,  366,
			  351,  378,  288, 4872, 4872,  903,  476,  555,   79,  133,
			  151,   80,  150,   89,  132,  238,  147,  148,  145,  147,
			  929, 4872, 4872,  176,  281, 4872,  635,  202,  247, 4872,
			  294,  890, 4872,  370,  384,  448,  430, 4872,  186,  717,
			 4872,  340,  932, 4872,  921, 4872,  904,  800,    0,  716,

			  907,  885,  800, 4872,  447,  470,  773,  541,  816, 4872,
			 4872, 4872,  452,  458, 4872,  839,  843,  848,  857,  862,
			  866,  885,  894,  906,  911,  915,  922,  934,  938,  949,
			  978,  953,  961, 1057,  772,  988, 1000, 1015, 1043, 1066,
			 1070, 1085,  867,  556,  834, 4872,  270,  873, 1141,  866,
			  162,  276,    0,  708,  280,  297,  314,  318,  332,  362,
			  335,  376,  357,  360,  371,  368,  853,  851,  372,  988,
			  815,  404, 1058,  791,  404,  454,  455,  534,  550,  710,
			  712,  799,  817,  823,  863,  853,  914,  911,  994,  933,
			  923,  933,  934,  952, 4872,  210, 4872,  840,  568,  311,

			 1119, 4872,  836,  958, 4872, 1048,  748, 4872,  295, 1097,
			 1103, 1131, 4872, 1166,  123, 1222,  137,  345, 1304, 4872,
			 4872,  759, 1146, 4872, 4872, 4872,  664,  716,  730,  724,
			 1174,  723,  722,  714,  713,  710,  774, 4872, 1222, 1238,
			  761, 1140, 4872, 1266, 1248, 1276, 1158, 1290, 1356, 1361,
			 1366, 1370, 1374, 1379, 1389, 1393, 1066, 1405, 1410, 1416,
			 1420, 1436, 1455, 1463, 1469, 1486, 1496, 1522, 1526, 1534,
			 1545, 1295, 1533, 1563, 1573, 1586, 1592, 1601, 1612, 1619,
			 1628, 1639, 1647,  584, 4872, 4872,  555,  963,    0, 1649,
			 1657, 1012,    0, 1051, 1084, 1089, 1088, 1083, 1120, 1199,

			 1207, 1209,  513, 1227,  508, 1657, 1253, 1255, 1293, 1323,
			 1334, 1349, 1364, 1391, 1401,    0,    0, 1399, 1414, 1404,
			 1421, 1425, 1440, 1444, 1458, 1449, 1456,  501, 1460, 1489,
			  500,    0,    0, 1499, 1510, 1721,  222, 4872,  503, 1635,
			 1607, 1171, 1687,    0,  469,  476, 4872, 4872, 4872, 4872,
			 1683, 4872, 4872, 4872, 4872, 4872, 1700, 1689, 1709, 1716,
			 1726, 1751, 1772, 1777, 1782, 1795, 1803, 1808, 1813, 1763,
			 1837, 1841, 1845, 1852, 1856, 1868, 1815, 1875, 1860, 1883,
			 1903, 1913, 1921, 1929, 1939, 1903, 1961, 1967, 2010, 1998,
			 2018, 2033, 1944, 2021, 2044, 2056, 2060, 2071, 2079, 1186,

			    0, 1514, 1527, 1559, 1568,    0, 1576, 1584,    0, 1605,
			 1608, 1633, 1666, 1699, 1721, 1761, 1827, 1833, 1850, 1843,
			 1851, 1863, 1869, 1865, 1890, 1892, 1919,    0,    0,    0,
			    0, 1919, 1936, 2033, 1925, 1942,  445,  410, 2122, 4872,
			 1323,    0, 4872, 2088, 2094, 2104, 2114,  380, 2139, 2144,
			 2149, 2155, 2167, 2172,  338, 2188, 2195, 2076,  729, 2201,
			 2219, 2228, 2233, 2237, 2242,  327, 2251, 2247, 2268, 2274,
			 2289, 2295, 2301, 2297, 2310, 2326, 2333, 2363, 2373, 2377,
			 2382, 2038, 1712, 2004, 2083,  270,  253, 1955, 1958, 2035,
			 2264, 2070, 2336,    0, 2079,    0, 2085, 2087, 2159,    0,

			 2164, 2167, 2181, 2202, 2222, 2256, 2270, 2277, 2299, 2307,
			 2309, 2315, 2320, 2342, 2351, 2434,    0, 2395, 2417, 2407,
			 2385, 2439, 2456, 2461, 2466, 2483, 2488, 2495, 2505, 2510,
			 2412, 4872, 2515, 2540, 2546, 2552, 2556, 2419, 2561, 2493,
			 2567, 2590, 2579, 2605, 2616, 2631, 2625, 2635, 2658, 2654,
			 2665, 2535, 2561,  582, 4872, 4872, 2413, 2414, 2440, 2489,
			 2504,    0, 2512, 2520,    0, 2545, 2549, 2565, 2555, 2564,
			 2581, 2574, 2594, 2607, 2638, 2640, 2640, 2643,    0, 2632,
			 2650, 2650,    0, 2640, 2713,    0, 2696, 2701, 2718, 2735,
			 2745, 2758, 2763, 2735, 2768, 2779,  270, 2784, 2789, 2797,

			 4872, 2802, 2812, 2836, 2686, 2726, 2840, 2844, 2801, 2848,
			 2852, 2856, 2867, 2875, 2882, 2886, 2893, 2902,  197,  187,
			 2782, 2800, 2822,    0, 2831,    0, 2853,    0,    0,    0,
			 2845,    0,    0, 2847,    0,    0, 2858,    0, 2864,    0,
			 2876, 2874, 2880, 2881, 1752,  172,   87, 2930, 2940, 2946,
			 2951, 2956, 2966,   72,  462, 2971, 2931, 2979, 2984, 2989,
			 3013, 3017, 3022, 4872, 2930, 3026, 3031, 3036, 3049, 3030,
			 3032, 2897, 2978, 3011, 3026, 3032,    0,    0, 3035, 3036,
			 3036, 3037,    0, 3039,  348,  113, 3082,   63, 3087, 3092,
			 3097, 3102, 3107, 3112, 4872, 3121, 3144, 3149, 3153, 3157,

			 3161, 3167, 3123, 3147, 3099, 3091, 3113,    0,    0, 3133,
			 3138,    0, 3127,    0, 4872, 3184,   60, 3206, 3216, 3197,
			 3214, 3243, 3247,  484, 4872, 3148, 3134, 3138, 3146, 3148,
			 3182,  452, 3233, 3256, 3262, 3270, 3275, 3241, 3187,    0,
			    0,    0,    0, 3224, 3264, 3288, 3298, 3311, 3285, 3241,
			 3263, 3305, 3326, 3332,   76, 3261,    0, 3319, 2675, 4872,
			 3352, 3315, 3289, 3340, 3368, 3366, 3335,    0, 3379, 3358,
			   70, 3385, 3396, 2687, 4872, 3380, 3401, 3412, 3396, 3417,
			 3397, 4872, 3436, 3441, 3446, 4872, 3452, 3462, 3467, 3472,
			 4872, 3515, 3560, 3605, 3650, 3695, 3740, 3785, 3829, 3869,

			 3913, 3958, 4003, 4048, 4093, 4137, 4181, 4226, 4271, 4316,
			 4361, 4406, 4447, 4491, 4535, 4570, 4614, 3486, 4658, 4702,
			 4737, 4758, 4792, 4814, 4849, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  790,    1,  791,  791,  792,  792,  793,  793,  794,
			  794,  795,  795,  790,  790,  790,  790,  790,  796,  790,
			  797,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  799,  790,  790,  800,  790,  790,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  790,  790,  790,  801,  790,  790,  790,  802,  803,  790,
			  803,  804,  790,  805,  790,  805,  805,  790,  806,  807,
			  790,  790,  790,  790,  796,  790,  808,  809,  808,  808,

			  810,  790,  790,  790,  790,  811,  790,  790,  790,  790,
			  790,  790,  790,  798,  790,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			   47,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  812,  799,  800,  790,  790,  790,   57,  790,
			  148,  148,   57,   57,   57,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,   57,  148,  148,
			  148,   57,   57,   57,  148,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,  148,   57,   57,
			  148,   57,  148,   57,  790,  801,  790,  802,  790,  801,

			   76,  790,  802,  803,  790,  803,  804,  790,  804,  805,
			  790,  805,  790,  790,  790,  813,  790,  806,  807,  790,
			  790,  218,  814,  790,  790,  790,  790,  815,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  798,  798,
			  798,  798,  798,  798,  798,  798,  790,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  133,  133,  133,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  790,  790,  790,  790,  148,  148,  790,
			  148,   57,   57,  148,   57,  148,  148,  148,   57,   57,

			   57,  148,  148,   57,   57,  790,  148,  148,  148,  148,
			   57,   57,   57,  148,   57,  148,   57,  148,  148,   57,
			   57,  148,  148,   57,   57,  148,  148,  148,   57,   57,
			   57,  148,   57,  148,   57,  801,  801,  790,  816,  816,
			  790,  816,  814,  817,  815,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  798,
			  798,  798,  798,  798,  798,  798,  790,  798,  798,  798,
			  798,  798,  798,  798,  133,  133,  384,  384,  798,  130,
			  388,  388,  798,  798,  798,  798,  798,  798,  798,  818,

			  819,  148,   57,  148,   57,  148,  148,  148,   57,   57,
			   57,  148,  148,   57,  148,  148,  148,  148,   57,   57,
			   57,  148,   57,  148,  148,   57,   57,  148,  148,   57,
			   57,  148,  148,  148,   57,   57,  148,   57,  335,  790,
			  790,  820,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  811,  790,  790,  790,  798,
			  798,  798,  798,  798,  798,  790,  798,  798,  798,  798,
			  798,  798,  798,  388,  798,  388,  475,  798,  798,  798,
			  798,  790,  790,  821,  818,  148,   57,  148,   57,  148,
			  148,   57,   57,  148,  148,   57,  148,  148,  148,  148,

			   57,   57,   57,  148,   57,  148,  148,   57,   57,  148,
			  148,  148,  148,   57,   57,  438,  822,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  823,  798,  798,  798,  798,  798,  798,  790,
			  798,  798,  798,  798,  798,  798,  475,  798,  798,  798,
			  798,  790,  790,  821,  790,  790,  148,  148,   57,  148,
			  148,  148,   57,   57,   57,  148,  148,  148,  148,   57,
			   57,   57,  148,   57,  148,  148,   57,   57,  148,  148,
			  148,  148,   57,   57,  515,  824,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  798,  798,  798,  798,  798,  790,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  790,  790,
			  148,  148,   57,  148,  148,   57,   57,  148,  148,  148,
			  148,   57,   57,   57,  148,   57,  148,  148,   57,   57,
			  148,  148,  148,   57,  801,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  798,  798,  798,  790,  798,  798,  798,  798,  798,  790,
			  790,  148,  148,   57,  148,   57,  148,   57,  148,   57,
			  148,  148,  148,   57,  801,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  798,  798,  798,  798,

			  798,  798,  790,  790,  148,  148,   57,  148,   57,  148,
			   57,  148,  148,   57,  790,  790,  790,  790,  790,  798,
			  798,  798,  798,  790,  790,  148,  148,   57,  148,   57,
			  148,  790,  790,  798,  798,  798,  798,  790,  148,  148,
			   57,  148,   57,  148,  790,  790,  798,  798,  790,  148,
			  148,  790,  798,  798,  790,  148,  148,  790,  790,  790,
			  798,  790,  148,  790,  790,  798,  790,  148,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			    0,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    8,    9,    1,   10,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,   20,
			   21,   22,   23,   23,   23,   24,   24,   24,   25,   26,
			   27,   28,   29,   30,    1,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   37,   37,   40,   41,   42,   43,
			   44,   45,   46,   47,   48,   49,   37,   50,   51,   52,
			   53,   54,   55,   56,   57,   58,    1,   59,   60,   61,

			   62,   63,   64,   65,   66,   67,   65,   65,   68,   69,
			   70,   71,   72,   73,   74,   75,   76,   77,   65,   78,
			   79,   80,   65,   81,   82,   83,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    1,    1,    5,    6,    1,    1,    7,    8,    9,   10,
			   11,   11,   11,   11,   12,   13,   14,   15,    1,   16,
			    1,   17,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,    1,   40,   41,    1,   11,   11,
			   11,   11,   11,   11,   11,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   43,
			   44,    1,    1,   45, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  130,  128,    1,    2,   15,  106,   18,
			  128,   16,   17,    7,    6,   13,    5,   11,    8,   97,
			   97,   14,   12,   29,   10,   30,   20,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   78,   90,   90,
			   90,   90,   22,   31,   23,    9,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   24,   21,   25,  111,  112,  113,  111,  114,  129,   95,
			  129,  129,  129,  129,  129,  129,  129,   68,  129,  129,
			   89,    1,    2,   28,  106,  105,  126,  126,  126,  126,

			    3,   33,  101,   32,    0,    0,   97,    0,   97,   27,
			   26,   19,    0,   90,   86,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   40,
			   90,   85,   85,   77,   83,   85,   90,   90,   90,   90,
			   90,   90,    0,    0,    0,   96,    0,    0,   92,    0,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   40,
			   92,   40,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   93,  111,  113,    0,  112,  111,

			  111,  108,  107,    0,   95,    0,    0,   94,    0,    0,
			    0,    0,   68,    0,   66,    0,   65,    0,    0,   89,
			   87,   87,    0,   88,  126,  115,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,    4,   34,  101,    0,
			    0,    0,   99,  101,   99,   97,    0,    0,   90,   39,
			   90,   90,   90,   90,   90,   90,    0,   90,   90,   90,
			   90,   90,   42,   90,   90,   78,   79,   78,   79,   78,
			   78,   84,   90,   84,   84,   84,   90,   90,   90,   90,
			   90,   41,   90,    0,   63,   91,    0,   92,   39,   69,
			   69,   92,   39,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   92,    0,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   42,   42,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   41,   41,   92,   92,  111,  109,   94,    0,    0,
			   67,   65,    0,    0,    0,    0,  122,  120,  123,  127,
			  127,  121,  119,  116,  117,  118,  101,    0,  101,    0,
			    0,  101,    0,    0,    0,  100,   97,    0,    0,   90,
			   90,   38,   90,   90,   90,   90,    0,   90,   90,   90,
			   90,   90,   90,   90,   90,   77,   90,   90,   90,   90,
			   77,   77,   77,   37,   44,   90,   90,   90,   90,   64,

			   60,   92,   92,   92,   92,   38,   92,   92,   38,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   37,   44,   37,
			   44,   92,   92,   92,   92,   92,   92,   92,  111,   67,
			   65,    0,  124,  101,  101,    0,    0,   98,  101,    0,
			  100,    0,  100,    0,    0,    0,   97,   74,    0,   90,
			   90,   90,   90,   45,   90,    0,   90,   90,   90,   36,
			   90,   90,   90,   79,   78,   90,   90,   90,   90,   90,
			   90,    0,   64,   64,    0,   92,   92,   92,   92,   92,
			   92,   92,   92,   45,   92,   45,   92,   92,   92,   36,

			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,  111,    0,    0,  101,    0,
			  104,  101,  100,    0,    0,  100,    0,    0,   99,    0,
			    0,   74,    0,   90,   90,   90,   90,   47,   90,    0,
			   90,   90,   90,   90,   90,   90,   90,   53,   90,   90,
			   90,    0,    0,    0,   62,   61,   92,   92,   92,   92,
			   92,   47,   92,   92,   47,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   53,   92,
			   92,   92,   53,   92,  111,    0,    0,  101,    0,    0,
			    0,  100,    0,  104,  100,    0,   76,    0,    0,    0,

			  102,  104,  102,   90,   90,   59,   90,   46,    0,   43,
			   58,   90,   35,   90,   51,   90,   90,   90,    0,    0,
			   92,   92,   92,   59,   92,   59,   92,   46,   43,   58,
			   92,   43,   58,   92,   35,   35,   92,   51,   92,   51,
			   92,   92,   92,   92,  111,    0,  104,    0,  104,    0,
			  100,    0,    0,  103,    0,    0,   73,  104,    0,  103,
			   90,   90,   90,   81,   54,   90,   90,   90,   55,    0,
			    0,   92,   92,   92,   92,   92,   54,   54,   92,   92,
			   92,   92,   55,   92,  110,    0,  104,  103,    0,  103,
			    0,    0,    0,    0,   73,  103,   90,   90,   48,   90,

			   52,   90,    0,    0,   92,   92,   92,   48,   48,   92,
			   92,   52,   92,   52,  125,  103,   75,    0,   73,   90,
			   90,   90,   90,   80,   80,   92,   92,   92,   92,   92,
			   92,    0,    0,   90,   50,   49,   90,    0,   92,   50,
			   50,   49,   49,   92,    0,    0,   90,   90,    0,   92,
			   92,   72,   90,   56,    0,   92,   56,    0,    0,   72,
			   90,    0,   92,    0,    0,   57,    0,   57,    0,   71,
			    0,    0,    0,    0,   71,    0,    0,    0,    0,    0,
			   70,   82,    0,    0,    0,   70,    0,   70,    0,    0,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4872
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 790
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 791
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 129
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 130
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
	IN_REGEXP1: INTEGER is 2
	IN_REGEXP2: INTEGER is 3
	IN_TERM_CONSTRAINT: INTEGER is 4
	IN_C_DOMAIN_TYPE: INTEGER is 5
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make is
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			in_buffer := string_.make (Init_buffer_size)
			in_lineno := 1
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
		end

feature -- Access

	in_buffer: STRING
			-- Buffer for lexical tokens

	in_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

	source_start_line: INTEGER
			-- offset of source in other document, else 0

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

	dadl_parser: DADL2_VALIDATOR is
		once
			create Result.make
		end

	dadl_parser_error: STRING

	term_code_count: INTEGER
			-- number of term codes found so far parsing a  TERM_CONSTRAINT

	assumed_term_code_index: INTEGER
			-- index of term code in 'assumed' position when parsing a  TERM_CONSTRAINT

	c_domain_type: C_DOMAIN_TYPE

invariant

	in_buffer_not_void: in_buffer /= Void

end
