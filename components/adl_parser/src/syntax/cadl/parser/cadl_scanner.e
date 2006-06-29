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
if yy_act <= 64 then
if yy_act <= 32 then
if yy_act <= 16 then
if yy_act <= 8 then
if yy_act <= 4 then
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
if yy_act = 3 then
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
-- Ignore comments
else
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Minus_code
else
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Star_code
else
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Caret_code
else
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Dot_code
else
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Comma_code
else
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Exclamation_code
else
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Left_parenthesis_code
end
end
end
end
else
if yy_act <= 24 then
if yy_act <= 20 then
if yy_act <= 18 then
if yy_act = 17 then
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := Right_parenthesis_code
else
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := SYM_DT_UNKNOWN
else
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 108 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 108")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := Left_bracket_code
end
else
if yy_act = 23 then
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := Right_bracket_code
else
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_START_CBLOCK
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 114 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 114")
end
last_token := SYM_END_CBLOCK
else
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := SYM_GE
end
else
if yy_act = 27 then
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_LE
else
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_NE
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 120 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 120")
end
last_token := SYM_LT
else
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
end
last_token := SYM_GT
end
else
if yy_act = 31 then
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_MODULO
else
--|#line 124 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 124")
end
last_token := SYM_DIV
end
end
end
end
end
else
if yy_act <= 48 then
if yy_act <= 40 then
if yy_act <= 36 then
if yy_act <= 34 then
if yy_act = 33 then
--|#line 126 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 126")
end
last_token := SYM_ELLIPSIS
else
--|#line 127 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 127")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 35 then
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_MATCHES
else
--|#line 133 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 133")
end
last_token := SYM_MATCHES
end
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 137 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 137")
end
last_token := SYM_THEN
else
--|#line 139 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 139")
end
last_token := SYM_ELSE
end
else
if yy_act = 39 then
--|#line 141 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 141")
end
last_token := SYM_AND
else
--|#line 143 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 143")
end
last_token := SYM_OR
end
end
end
else
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 145 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 145")
end
last_token := SYM_XOR
else
--|#line 147 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 147")
end
last_token := SYM_NOT
end
else
if yy_act = 43 then
--|#line 149 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 149")
end
last_token := SYM_IMPLIES
else
--|#line 151 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 151")
end
last_token := SYM_TRUE
end
end
else
if yy_act <= 46 then
if yy_act = 45 then
--|#line 153 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 153")
end
last_token := SYM_FALSE
else
--|#line 155 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 155")
end
last_token := SYM_FORALL
end
else
if yy_act = 47 then
--|#line 157 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 157")
end
last_token := SYM_EXISTS
else
--|#line 161 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 161")
end
last_token := SYM_EXISTENCE
end
end
end
end
else
if yy_act <= 56 then
if yy_act <= 52 then
if yy_act <= 50 then
if yy_act = 49 then
--|#line 163 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 163")
end
last_token := SYM_OCCURRENCES
else
--|#line 165 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 165")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 51 then
--|#line 167 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 167")
end
last_token := SYM_ORDERED
else
--|#line 169 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 169")
end
last_token := SYM_UNORDERED
end
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 171 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 171")
end
last_token := SYM_UNIQUE
else
--|#line 173 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 173")
end
last_token := SYM_INFINITY
end
else
if yy_act = 55 then
--|#line 175 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 175")
end
last_token := SYM_USE_NODE
else
--|#line 177 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 177")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
end
else
if yy_act <= 60 then
if yy_act <= 58 then
if yy_act = 57 then
--|#line 179 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 179")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 181 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 181")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 59 then
--|#line 183 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 183")
end
last_token := SYM_EXCLUDE
else
--|#line 187 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 187")
end

	last_token := V_URI
	last_string_value := text

end
end
else
if yy_act <= 62 then
if yy_act = 61 then
--|#line 193 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 193")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 198 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 198")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 63 then
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 219 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 219")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
end
end
end
end
end
end
else
if yy_act <= 96 then
if yy_act <= 80 then
if yy_act <= 72 then
if yy_act <= 68 then
if yy_act <= 66 then
if yy_act = 65 then
--|#line 226 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 226")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
else
--|#line 233 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 233")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
end
else
if yy_act = 67 then
--|#line 239 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 239")
end

				do_nothing
			
else
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
			
end
end
else
if yy_act <= 70 then
if yy_act = 69 then
--|#line 263 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 263")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 270 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 270")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 71 then
--|#line 271 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 271")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 272 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 272")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 76 then
if yy_act <= 74 then
if yy_act = 73 then
--|#line 279 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 279")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 280 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 280")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 75 then
--|#line 293 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 293")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 78 then
if yy_act = 77 then
--|#line 307 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 307")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 308 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 308")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 79 then
--|#line 315 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 315")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 327 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 327")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 88 then
if yy_act <= 84 then
if yy_act <= 82 then
if yy_act = 81 then
--|#line 334 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 334")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 341 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 341")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 83 then
--|#line 351 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 351")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 352 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 352")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 86 then
if yy_act = 85 then
--|#line 364 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 364")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 369 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 369")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 87 then
--|#line 373 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 373")
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
--|#line 408 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 408")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
end
else
if yy_act <= 92 then
if yy_act <= 90 then
if yy_act = 89 then
--|#line 413 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 413")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 418 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 418")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 91 then
--|#line 424 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 424")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 430 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 430")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 94 then
if yy_act = 93 then
--|#line 436 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 436")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 440 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 440")
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
if yy_act = 95 then
--|#line 450 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 450")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 457 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 457")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
end
end
else
if yy_act <= 112 then
if yy_act <= 104 then
if yy_act <= 100 then
if yy_act <= 98 then
if yy_act = 97 then
--|#line 462 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 462")
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
--|#line 477 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 477")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 99 then
--|#line 478 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 478")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 479 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 479")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 102 then
if yy_act = 101 then
	yy_end := yy_end - 1
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
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
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
if yy_act = 103 then
--|#line 485 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 485")
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
--|#line 505 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 505")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
end
else
if yy_act <= 108 then
if yy_act <= 106 then
if yy_act = 105 then
--|#line 509 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 509")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
end
in_buffer.append_character ('\')
end
else
if yy_act = 107 then
--|#line 516 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 516")
end
in_buffer.append_character ('"')
else
--|#line 517 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 517")
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
if yy_act <= 110 then
if yy_act = 109 then
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
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
--|#line 545 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 545")
end
in_buffer.append_string (text)
end
else
if yy_act = 111 then
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
--|#line 552 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 552")
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
if yy_act <= 120 then
if yy_act <= 116 then
if yy_act <= 114 then
if yy_act = 113 then
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 571 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 571")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 115 then
--|#line 572 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 572")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 573 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 573")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
else
if yy_act <= 118 then
if yy_act = 117 then
--|#line 574 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 574")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 575 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 575")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
else
if yy_act = 119 then
--|#line 576 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 576")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 577 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 577")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 124 then
if yy_act <= 122 then
if yy_act = 121 then
--|#line 578 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 578")
end
last_token := V_CHARACTER; last_character_value := '"'
else
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
end
else
if yy_act = 123 then
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
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
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
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
if yy_act <= 126 then
if yy_act = 125 then
--|#line 604 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 604")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 605 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 605")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 127 then
--|#line 609 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 609")
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
			create an_array.make (0, 4973)
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
			  290,  290,  290,  352,  532,  351,  230,  230,  230,  230,
			  230,  347,  346,  345,  307,  318,  222,  308,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  231,  307,  318,  107,  308,  342,  342,  343,  342,
			  232,  236,  790,  236,  236,  208,  233,  196,  196,  104,
			  234,  105,  235,  245,  245,  245,  245,  245,  246,  309,

			  223,  224,  224,  222,  224,  224,  224,  224,  226,  224,
			  224,  225,  224,  224,  224,  224,  224,  224,  224,  224,
			  238,  238,  238,  238,  238,  224,  224,  224,  224,  224,
			  224,  107,  104,  317,  105,  239,  245,  245,  245,  245,
			  245,  112,  112,  309,  112,  112,  112,  305,  112,  256,
			  112,  112,  318,  112,  224,  224,  224,  224,  240,  112,
			  112,  319,  112,  239,  112,  112,  114,  112,  112,  112,
			  114,  112,  321,  286,  107,  114,  285,  249,  145,  248,
			  320,  224,  224,  224,  114,  283,  237,  112,  112,  114,
			  112,  236,  225,  114,  250,  252,  112,  112,  322,  112,

			  321,  253,  321,   95,  251,  249,  254,  248,  112,  112,
			   92,  112,  114,  112,  112,  208,  112,  112,  112,  256,
			  112,  114,  250,  252,  112,  112,  322,  112,  194,  253,
			  323,  255,  251,  114,  254,  322,  112,  112,  114,  112,
			  112,  112,  114,  112,  258,  145,  327,  259,  111,  114,
			  257,  112,  112,  325,  112,  112,  112,  326,  112,  255,
			  196,  114,  110,  324,  109,  114,  307,  103,  327,  308,
			  261,  263,  258,  260,  327,  259,  114,  100,  257,  684,
			  114,  325,  262,  264,   95,  326,  325,  331,  112,  112,
			  326,  112,  112,  112,  311,  112,  330,  312,  261,  263,

			   93,  271,   92,  113,  113,  113,  113,  113,  197,  331,
			  262,  264,  265,  114,  328,  331,  266,  114,  329,  267,
			  131,  333,  333,  401,  131,  268,  113,  790,  269,  790,
			  270,  271,  790,  401,  271,  113,  134,  332,  271,  790,
			  265,  204,  112,  112,  266,  112,  403,  267,  131,  333,
			  334,  401,  131,  268,  112,  112,  269,  112,  270,  790,
			  207,  402,  790,  113,  134,  112,  112,  114,  112,  112,
			  112,  403,  112,  790,  403,  276,  790,  205,  122,  114,
			  790,  790,  790,  272,  272,  272,  272,  272,  790,  790,
			  114,  278,  790,  405,  114,  279,  205,  112,  112,  404,

			  112,  273,  790,  276,  274,  206,  122,  406,  112,  112,
			  275,  112,  112,  112,  790,  112,  277,  209,  210,  278,
			  209,  405,  114,  279,  206,  210,  210,  195,  210,  273,
			  280,  407,  274,  114,  790,  406,  790,  114,  275,  200,
			  200,  200,  200,  200,  277,  336,  213,  210,  405,  213,
			  213,  210,  281,  213,  367,  367,  367,  367,  280,  407,
			  214,  790,  282,  790,  214,  359,  359,  359,  359,  359,
			  216,  212,  790,  348,  216,  406,  408,  200,  790,  212,
			  281,  349,  350,  350,  350,  350,  350,  357,  790,  357,
			  282,  790,  358,  358,  358,  358,  358,  790,  341,  440,

			  212,  341,  790,  409,  212,  360,  360,  360,  360,  360,
			  364,  790,  364,  790,  790,  365,  365,  365,  365,  365,
			  368,  368,  368,  368,  368,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  338,  339,  340,
			  338,  339,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  214,  790,  790,  338,  356,  356,  356,  356,
			  356,  338,  341,  338,  338,  338,  338,  407,  790,  411,
			  790,  239,  361,  361,  361,  361,  361,  113,  113,  113,
			  113,  113,  112,  112,  790,  112,  790,  362,  411,  790,

			  338,  338,  212,  338,  240,  410,  104,  411,  105,  239,
			  366,  366,  366,  366,  366,  112,  112,  114,  112,  414,
			  363,  112,  112,  415,  112,  362,  413,  338,  338,  338,
			  221,  221,  289,  221,  289,  289,  289,  289,  289,  289,
			  114,  290,  290,  290,  290,  290,  114,  414,  107,  482,
			  482,  415,  483,  790,  790,  790,  369,  222,  379,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  112,  112,  369,  112,  379,  112,  112,  416,
			  112,  112,  112,  790,  112,  417,  112,  112,  376,  112,

			  112,  112,  790,  112,  414,  112,  112,  114,  112,  376,
			  415,  223,  114,  790,  370,  790,  114,  416,  790,  376,
			  371,  114,  790,  417,  790,  114,  790,  416,  790,  372,
			  114,  421,  418,  112,  112,  790,  112,  376,  419,  421,
			  790,  373,  370,  112,  112,  374,  112,  423,  371,  112,
			  112,  790,  112,  112,  112,  420,  112,  372,  114,  421,
			  424,  375,  112,  112,  790,  112,  790,  422,  114,  373,
			  423,  377,  424,  374,  114,  423,  112,  112,  114,  112,
			  427,  378,  112,  112,  381,  112,  380,  114,  424,  428,
			  427,  112,  112,  428,  112,  790,  431,  432,  425,  377,

			  426,  114,  112,  112,  790,  112,  790,  114,  427,  378,
			  112,  112,  381,  112,  380,  383,  114,  428,  429,  112,
			  112,  430,  112,  382,  431,  432,  790,  114,  384,  384,
			  384,  384,  384,  112,  112,  114,  112,  386,  386,  386,
			  386,  386,  790,  383,  114,  112,  112,  790,  112,  431,
			  790,  382,  790,  790,  112,  112,  385,  112,  114,  216,
			  216,  790,  216,  387,  387,  387,  387,  387,  112,  112,
			  114,  112,  388,  388,  388,  388,  388,  434,  275,  114,
			  113,  113,  113,  113,  113,  790,  389,  389,  389,  389,
			  389,  385,  390,  114,  432,  391,  112,  112,  113,  112,

			  385,  392,  112,  112,  790,  112,  275,  112,  112,  790,
			  112,  436,  112,  112,  385,  112,  112,  112,  436,  112,
			  390,  114,  435,  391,  790,  485,  113,  114,  790,  392,
			  112,  112,  114,  112,  485,  394,  393,  114,  286,  436,
			  790,  114,  112,  112,  790,  112,  437,  790,  487,  376,
			  395,  339,  340,  485,  339,  114,  396,  487,  210,  210,
			  376,  210,  486,  394,  393,  214,  790,  114,  342,  342,
			  376,  342,  397,  790,  790,  341,  487,  790,  395,  443,
			  443,  443,  443,  443,  396,  488,  489,  790,  376,  348,
			  112,  112,  398,  112,  239,  790,  790,  349,  350,  350,

			  350,  350,  350,  790,  790,  212,  358,  358,  358,  358,
			  358,  790,  212,  790,  489,  114,  490,  240,  790,  790,
			  398,  196,  239,  444,  444,  444,  444,  444,  446,  446,
			  446,  446,  446,  790,  438,  438,  438,  438,  438,  447,
			  447,  447,  447,  447,  490,  438,  438,  438,  438,  438,
			  438,  448,  448,  448,  448,  448,  451,  451,  451,  451,
			  451,  445,  489,  490,  790,  493,  362,  112,  112,  197,
			  112,  790,  438,  438,  438,  438,  438,  438,  438,  449,
			  790,  449,  790,  790,  450,  450,  450,  450,  450,  363,
			  491,  492,  114,  493,  362,  365,  365,  365,  365,  365,

			  452,  452,  452,  452,  452,  454,  455,  468,  456,  456,
			  456,  456,  456,  457,  457,  457,  457,  457,  458,  458,
			  458,  458,  458,  112,  112,  790,  112,  112,  112,  494,
			  112,  112,  112,  465,  112,  468,  112,  112,  453,  112,
			  112,  112,  493,  112,  465,  790,  496,  790,  114,  497,
			  112,  112,  114,  112,  465,  790,  114,  494,  790,  112,
			  112,  114,  112,  790,  460,  114,  112,  112,  790,  112,
			  495,  459,  465,  463,  496,  114,  498,  497,  461,  464,
			  112,  112,  462,  112,  114,  790,  112,  112,  499,  112,
			  496,  114,  460,  497,  112,  112,  466,  112,  790,  459,

			  790,  463,  498,  790,  498,  114,  461,  464,  503,  503,
			  462,  114,  790,  467,  112,  112,  499,  112,  500,  114,
			  469,  501,  470,  505,  466,  384,  384,  384,  384,  384,
			  502,  113,  482,  482,  113,  482,  503,  504,  471,  114,
			  113,  467,  790,  266,  790,  506,  473,  790,  469,  790,
			  470,  505,  268,  387,  387,  387,  387,  387,  472,  113,
			  112,  112,  113,  112,  505,  790,  471,  265,  113,  112,
			  112,  266,  112,  506,  473,  386,  386,  386,  386,  386,
			  268,  506,  790,  269,  790,  114,  472,  388,  388,  388,
			  388,  388,  507,  113,  114,  265,  389,  389,  389,  389,

			  389,  474,  475,  475,  475,  475,  475,  112,  112,  508,
			  112,  269,  112,  112,  790,  112,  113,  112,  112,  790,
			  112,  113,  476,  476,  476,  476,  476,  790,  113,  474,
			  112,  112,  114,  112,  790,  790,  113,  114,  112,  112,
			  509,  112,  114,  510,  113,  509,  479,  112,  112,  790,
			  112,  510,  557,  557,  511,  114,  113,  480,  790,  529,
			  790,  529,  481,  114,  113,  512,  790,  559,  509,  530,
			  478,  510,  114,  513,  479,  112,  112,  477,  112,  514,
			  557,  558,  511,  790,  790,  480,  443,  443,  443,  443,
			  443,  112,  112,  512,  112,  559,  790,  531,  478,  790,

			  114,  517,  790,  790,  790,  477,  515,  515,  515,  515,
			  515,  519,  519,  519,  519,  519,  114,  515,  515,  515,
			  515,  515,  515,  518,  518,  518,  518,  518,  790,  517,
			  520,  520,  520,  520,  520,  790,  521,  521,  521,  521,
			  521,  790,  790,  790,  515,  515,  515,  515,  515,  515,
			  515,  362,  450,  450,  450,  450,  450,  599,  599,  599,
			  599,  445,  522,  522,  522,  522,  522,  524,  524,  524,
			  524,  524,  112,  112,  363,  112,  790,  790,  790,  362,
			  525,  525,  525,  525,  525,  526,  526,  526,  526,  526,
			  521,  521,  521,  521,  521,  112,  112,  114,  112,  790,

			  523,  790,  790,  559,  455,  528,  456,  456,  456,  456,
			  456,  112,  112,  790,  112,  790,  112,  112,  453,  112,
			  114,  112,  112,  790,  112,  790,  790,  551,  533,  112,
			  112,  562,  112,  528,  790,  534,  114,  565,  551,  112,
			  112,  114,  112,  535,  112,  112,  114,  112,  552,  536,
			  112,  112,  790,  112,  114,  112,  112,  790,  112,  538,
			  566,  537,  540,  534,  114,  565,  551,  482,  482,  114,
			  483,  535,  543,  790,  567,  114,  541,  536,  112,  112,
			  114,  112,  546,  546,  546,  546,  546,  538,  566,  537,
			  540,  790,  542,  790,  544,  790,  113,  568,  112,  112,

			  543,  112,  567,  114,  541,  475,  475,  475,  475,  475,
			  566,  545,  476,  476,  476,  476,  476,  790,  790,  113,
			  542,  554,  544,  114,  113,  568,  391,  112,  112,  790,
			  112,  790,  392,  113,  112,  112,  567,  112,  569,  545,
			  112,  112,  790,  112,  385,  112,  112,  113,  112,  568,
			  790,  790,  114,  553,  391,  572,  560,  560,  790,  114,
			  392,  113,  572,  574,  570,  114,  575,  547,  561,  561,
			  114,  549,  574,  548,  575,  578,  790,  571,  579,  580,
			  581,  578,  579,  572,  560,  563,  550,  692,  693,  692,
			  573,  574,  790,  790,  575,  547,  561,  564,  790,  549,

			  576,  548,  577,  578,  555,  620,  579,  580,  581,  582,
			  583,  790,  790,  790,  550,  584,  584,  584,  584,  584,
			  588,  588,  588,  588,  588,  694,  584,  584,  584,  584,
			  584,  584,  586,  620,  586,  790,  790,  587,  587,  587,
			  587,  587,  587,  587,  587,  587,  587,  589,  521,  521,
			  521,  521,  521,  584,  584,  584,  584,  584,  584,  584,
			  790,  790,  790,  590,  591,  591,  591,  591,  591,  790,
			  240,  764,  764,  764,  764,  589,  777,  777,  777,  777,
			  445,  592,  592,  592,  592,  592,  593,  593,  593,  593,
			  593,  590,  594,  594,  594,  594,  594,  595,  595,  595,

			  595,  595,  523,  596,  596,  596,  596,  596,  597,  621,
			  597,  790,  790,  594,  594,  594,  594,  594,  598,  598,
			  598,  598,  598,  601,  601,  601,  601,  601,  112,  112,
			  453,  112,  621,  112,  112,  608,  112,  621,  602,  112,
			  112,  623,  112,  112,  112,  790,  112,  790,  112,  112,
			  790,  112,  608,  114,  624,  790,  608,  603,  114,  790,
			  622,  790,  604,  790,  114,  790,  602,  790,  114,  623,
			  623,  790,  605,  114,  112,  112,  618,  112,  112,  112,
			  608,  112,  624,  606,  790,  603,  624,  618,  112,  112,
			  604,  112,  112,  112,  790,  112,  627,  619,  625,  114,

			  605,  112,  112,  114,  112,  790,  112,  112,  790,  112,
			  790,  606,  607,  114,  626,  618,  790,  114,  790,  112,
			  112,  610,  112,  609,  627,  790,  114,  112,  112,  628,
			  112,  114,  790,  546,  546,  546,  546,  546,  611,  613,
			  607,  790,  619,  790,  114,  629,  612,  112,  112,  610,
			  112,  609,  114,  619,  113,  112,  112,  628,  112,  614,
			  268,  630,  628,  619,  629,  790,  611,  613,  112,  112,
			  630,  112,  114,  629,  612,  634,  634,  636,  637,  636,
			  114,  619,  113,  637,  640,  641,  616,  614,  268,  630,
			  631,  615,  632,  114,  642,  640,  671,  652,  633,  672,

			  617,  790,  790,  634,  635,  636,  637,  638,  790,  790,
			  790,  639,  640,  641,  616,  790,  790,  790,  790,  615,
			  363,  790,  642,  643,  671,  652,  790,  672,  617,  644,
			  644,  644,  644,  644,  587,  587,  587,  587,  587,  790,
			  644,  644,  644,  644,  644,  644,  587,  587,  587,  587,
			  587,  646,  646,  646,  646,  646,  647,  790,  647,  790,
			  790,  648,  648,  648,  648,  648,  790,  644,  644,  644,
			  644,  644,  644,  644,  649,  790,  649,  790,  790,  650,
			  650,  650,  650,  650,  650,  650,  650,  650,  650,  651,
			  651,  651,  651,  651,  594,  594,  594,  594,  594,  653,

			  653,  653,  653,  653,  594,  594,  594,  594,  594,  655,
			  655,  655,  655,  655,  656,  656,  656,  656,  656,  790,
			  790,  790,  523,  657,  657,  657,  657,  657,  658,  672,
			  658,  790,  663,  659,  659,  659,  659,  659,  652,  112,
			  112,  674,  112,  112,  112,  790,  112,  112,  112,  663,
			  112,  112,  112,  663,  112,  112,  112,  673,  112,  112,
			  112,  363,  112,  790,  114,  674,  652,  790,  114,  674,
			  112,  112,  114,  112,  676,  790,  114,  663,  790,  676,
			  114,  661,  662,  660,  114,  678,  790,  112,  112,  790,
			  112,  112,  112,  675,  112,  114,  112,  112,  678,  112,

			  112,  112,  676,  112,  680,  112,  112,  677,  112,  661,
			  662,  660,  114,  678,  112,  112,  114,  112,  681,  112,
			  112,  114,  112,  682,  790,  114,  679,  680,  112,  112,
			  114,  112,  680,  704,  705,  705,  665,  664,  666,  114,
			  790,  783,  784,  783,  114,  790,  681,  790,  790,  707,
			  667,  682,  668,  114,  790,  683,  648,  648,  648,  648,
			  648,  704,  705,  706,  665,  664,  666,  686,  686,  686,
			  686,  686,  650,  650,  650,  650,  650,  707,  667,  785,
			  668,  650,  650,  650,  650,  650,  687,  687,  687,  687,
			  687,  688,  790,  688,  790,  790,  689,  689,  689,  689, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  689,  707,  790,  790,  790,  445,  691,  691,  691,  691,
			  691,  593,  593,  593,  593,  593,  659,  659,  659,  659,
			  659,  695,  695,  695,  695,  695,  652,  112,  112,  708,
			  112,  112,  112,  790,  112,  790,  112,  112,  790,  112,
			  112,  112,  790,  112,  790,  112,  112,  790,  112,  363,
			  112,  112,  114,  112,  652,  790,  114,  709,  696,  453,
			  790,  114,  709,  112,  112,  114,  112,  790,  697,  698,
			  114,  699,  702,  711,  703,  114,  702,  700,  703,  712,
			  711,  725,  726,  701,  790,  709,  696,  790,  114,  790,
			  710,  790,  790,  702,  790,  703,  697,  698,  790,  699,

			  790,  711,  790,  790,  702,  700,  703,  712,  713,  725,
			  726,  701,  646,  646,  646,  646,  646,  689,  689,  689,
			  689,  689,  715,  715,  715,  715,  715,  716,  716,  716,
			  716,  716,  531,  531,  531,  531,  531,  717,  717,  717,
			  717,  717,  718,  718,  718,  718,  718,  726,  790,  728,
			  445,  653,  653,  653,  653,  653,  112,  112,  790,  112,
			  523,  112,  112,  723,  112,  112,  112,  723,  112,  112,
			  112,  728,  112,  112,  112,  727,  112,  728,  730,  112,
			  112,  114,  112,  790,  723,  790,  114,  724,  790,  453,
			  114,  724,  719,  790,  114,  723,  790,  790,  114,  729,

			  738,  790,  721,  790,  114,  790,  730,  720,  724,  687,
			  687,  687,  687,  687,  732,  732,  732,  732,  732,  724,
			  719,  112,  112,  790,  112,  722,  112,  112,  738,  112,
			  721,  692,  739,  692,  739,  720,  718,  718,  718,  718,
			  718,  112,  112,  741,  112,  741,  114,  523,  790,  112,
			  112,  114,  112,  722,  733,  743,  790,  790,  790,  790,
			  739,  790,  740,  790,  112,  112,  114,  112,  749,  694,
			  750,  741,  790,  742,  114,  755,  734,  745,  745,  745,
			  745,  745,  733,  743,  112,  112,  735,  112,  756,  114,
			  112,  112,  748,  112,  112,  112,  749,  112,  750,  736,

			  748,  790,  790,  755,  734,  790,  790,  790,  790,  114,
			  746,  790,  790,  748,  735,  114,  756,  790,  754,  114,
			  751,  751,  751,  751,  751,  790,  754,  736,  748,  694,
			  694,  694,  694,  694,  112,  112,  747,  112,  746,  754,
			  112,  112,  757,  112,  757,  112,  112,  766,  112,  762,
			  112,  112,  758,  112,  754,  767,  790,  790,  766,  114,
			  112,  112,  790,  112,  747,  114,  790,  790,  766,  790,
			  114,  790,  790,  753,  790,  114,  790,  762,  790,  790,
			  759,  790,  790,  767,  752,  114,  766,  760,  763,  763,
			  763,  763,  763,  765,  768,  768,  768,  768,  768,  790,

			  790,  753,  769,  769,  769,  769,  769,  112,  112,  770,
			  112,  790,  752,  790,  790,  760,  790,  772,  790,  772,
			  770,  765,  771,  771,  771,  771,  771,  773,  778,  790,
			  770,  790,  114,  759,  759,  759,  759,  759,  776,  776,
			  776,  776,  776,  790,  781,  778,  790,  790,  770,  778,
			  779,  779,  779,  779,  779,  774,  780,  780,  780,  780,
			  780,  781,  790,  790,  790,  781,  782,  782,  782,  782,
			  782,  790,  790,  778,  774,  774,  774,  774,  774,  786,
			  786,  786,  786,  786,  787,  787,  787,  787,  787,  781,
			  788,  788,  788,  788,  788,  783,  790,  783,  790,  790,

			  787,  787,  787,  787,  787,  789,  789,  789,  789,  789,
			  785,  785,  785,  785,  785,  441,  441,  790,  790,  790,
			  790,  441,  441,  441,  441,  441,  441,  790,  790,  790,
			  790,  790,  790,  785,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   94,
			   94,  790,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,  790,   94,

			   94,   94,   94,   94,   96,   96,  790,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,  113,
			  113,  113,  790,  790,  790,  790,  790,  790,  113,  113,
			  790,  790,  113,  790,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  790,  790,  113,
			  113,  113,  143,  143,  790,  143,  143,  790,  143,  143,

			  790,  790,  790,  790,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  790,  790,  143,
			  143,  143,  144,  144,  790,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  195,  195,  790,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,

			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  197,  197,  790,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,

			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  790,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  211,  211,  211,
			  790,  790,  790,  211,  211,  790,  211,  211,  790,  790,
			  790,  790,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  790,  211,  211,  211,  211,

			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  224,  224,  790,  224,  224,  224,  224,  224,  224,  224,

			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  227,  227,  790,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  242,  242,  242,  242,  242,
			  242,  242,  242,  790,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  142,  142,  790,  142,  142,  790,  142,  142,  142,  790,
			  790,  790,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,

			  142,  142,  142,  142,  142,  790,  790,  142,  142,  142,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  223,  223,  223,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  790,  790,  790,  790,  790,  223,  344,

			  344,  790,  344,  790,  790,  344,  344,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  344,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  344,  344,  790,  790,
			  344,  344,  344,  338,  338,  338,  338,  338,  338,  790,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  790,  338,  338,  338,  338,  484,  484,
			  484,  790,  790,  790,  484,  484,  790,  484,  484,  790,
			  790,  790,  790,  484,  484,  484,  484,  484,  484,  484,

			  484,  484,  484,  484,  484,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  790,  790,  484,  484,
			  484,  400,  400,  400,  790,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  790,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  516,  516,  790,  790,
			  790,  790,  516,  516,  516,  516,  516,  516,  553,  553,
			  553,  790,  790,  790,  553,  553,  790,  553,  553,  790,
			  790,  790,  790,  553,  553,  553,  553,  553,  553,  553,

			  553,  553,  553,  553,  553,  553,  553,  553,  553,  553,
			  553,  553,  553,  553,  553,  553,  790,  553,  553,  553,
			  553,  585,  585,  790,  790,  790,  790,  585,  585,  585,
			  585,  585,  585,  600,  600,  600,  600,  600,  600,  600,
			  600,  790,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  645,  645,
			  790,  790,  790,  790,  645,  645,  645,  645,  645,  645,
			   13,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790, yy_Dummy>>,
			1, 1974, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4973)
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
			  153,  153,  153,  232,  458,  231,   99,   99,   99,   99,
			   99,  229,  228,  227,  169,  179,   89,  169,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   99,  169,  179,  458,  169,  222,  222,  226,  222,
			   99,  236,  221,  236,  236,  206,   99,  202,  197,  106,
			   99,  106,   99,  106,  106,  106,  106,  106,  106,  173,

			   89,   97,   97,  222,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			  102,  102,  102,  102,  102,   97,   97,   97,   97,   97,
			   97,  106,  108,  180,  108,  102,  108,  108,  108,  108,
			  108,  115,  115,  170,  115,  116,  116,  167,  116,  166,
			  117,  117,  181,  117,   97,   97,   97,   97,  102,  118,
			  118,  180,  118,  102,  119,  119,  115,  119,  120,  120,
			  116,  120,  182,  149,  108,  117,  147,  116,  144,  115,
			  181,   97,   97,   97,  118,  142,  101,  121,  121,  119,
			  121,  100,   96,  120,  117,  119,  122,  122,  183,  122,

			  182,  119,  184,   94,  118,  116,  120,  115,  123,  123,
			   92,  123,  121,  124,  124,   81,  124,  125,  125,  122,
			  125,  122,  117,  119,  126,  126,  183,  126,   70,  119,
			  184,  121,  118,  123,  120,  185,  127,  127,  124,  127,
			  128,  128,  125,  128,  124,   55,  187,  124,   36,  126,
			  123,  129,  129,  186,  129,  131,  131,  186,  131,  121,
			  644,  127,   35,  185,   33,  128,  172,   28,  189,  172,
			  126,  128,  124,  125,  187,  124,  129,   26,  123,  644,
			  131,  186,  127,  129,   18,  186,  188,  190,  132,  132,
			  188,  132,  134,  134,  172,  134,  189,  172,  126,  128,

			   17,  131,   16,  135,  135,  135,  135,  135,  644,  191,
			  127,  129,  130,  132,  188,  190,  130,  134,  188,  130,
			  132,  192,  193,  287,  134,  130,  130,   13,  130,    0,
			  130,  135,    0,  291,  132,  135,  132,  191,  134,    0,
			  130,  203,  136,  136,  130,  136,  293,  130,  132,  192,
			  193,  287,  134,  130,  138,  138,  130,  138,  130,    0,
			  205,  291,    0,  135,  132,  133,  133,  136,  133,  137,
			  137,  294,  137,    0,  293,  136,    0,  203,  136,  138,
			    0,    0,    0,  133,  133,  133,  133,  133,    0,    0,
			  133,  138,    0,  295,  137,  138,  205,  139,  139,  294,

			  139,  133,    0,  136,  133,  203,  136,  296,  140,  140,
			  133,  140,  141,  141,    0,  141,  137,  209,  209,  138,
			  209,  295,  139,  138,  205,  210,  210,  200,  210,  133,
			  139,  297,  133,  140,    0,  296,    0,  141,  133,  200,
			  200,  200,  200,  200,  137,  200,  211,  211,  298,  211,
			  213,  213,  140,  213,  246,  246,  246,  246,  139,  297,
			  211,    0,  141,    0,  213,  240,  240,  240,  240,  240,
			  211,  209,    0,  230,  213,  299,  298,  200,    0,  210,
			  140,  230,  230,  230,  230,  230,  230,  239,    0,  239,
			  141,  148,  239,  239,  239,  239,  239,    0,  341,  341,

			  211,  341,    0,  299,  213,  241,  241,  241,  241,  241,
			  244,    0,  244,    0,    0,  244,  244,  244,  244,  244,
			  247,  247,  247,  247,  247,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,    0,    0,  215,  238,  238,  238,  238,
			  238,  215,  215,  215,  215,  215,  215,  300,    0,  301,
			    0,  238,  243,  243,  243,  243,  243,  271,  271,  271,
			  271,  271,  249,  249,    0,  249,    0,  243,  303,    0,

			  215,  215,  215,  215,  238,  300,  245,  301,  245,  238,
			  245,  245,  245,  245,  245,  248,  248,  249,  248,  306,
			  243,  259,  259,  307,  259,  243,  303,  215,  215,  215,
			  218,  218,  289,  218,  289,  289,  289,  289,  289,  290,
			  248,  290,  290,  290,  290,  290,  259,  306,  245,  399,
			  399,  307,  399,    0,    0,    0,  248,  218,  259,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  250,  250,  248,  250,  259,  251,  251,  308,
			  251,  252,  252,    0,  252,  309,  253,  253,  256,  253,

			  254,  254,    0,  254,  310,  255,  255,  250,  255,  256,
			  311,  218,  251,    0,  250,    0,  252,  308,    0,  256,
			  251,  253,    0,  309,    0,  254,    0,  312,    0,  252,
			  255,  313,  310,  257,  257,    0,  257,  256,  311,  314,
			    0,  253,  250,  258,  258,  254,  258,  317,  251,  260,
			  260,    0,  260,  261,  261,  312,  261,  252,  257,  313,
			  318,  255,  262,  262,    0,  262,    0,  314,  258,  253,
			  319,  257,  320,  254,  260,  317,  263,  263,  261,  263,
			  321,  258,  264,  264,  261,  264,  260,  262,  318,  322,
			  323,  268,  268,  324,  268,    0,  325,  326,  319,  257,

			  320,  263,  275,  275,    0,  275,    0,  264,  321,  258,
			  265,  265,  261,  265,  260,  264,  268,  322,  323,  266,
			  266,  324,  266,  263,  325,  326,    0,  275,  265,  265,
			  265,  265,  265,  274,  274,  265,  274,  266,  266,  266,
			  266,  266,    0,  264,  266,  267,  267,    0,  267,  328,
			    0,  263,    0,    0,  269,  269,  265,  269,  274,  440,
			  440,    0,  440,  267,  267,  267,  267,  267,  270,  270,
			  267,  270,  269,  269,  269,  269,  269,  328,  274,  269,
			  273,  273,  273,  273,  273,    0,  270,  270,  270,  270,
			  270,  267,  272,  270,  329,  272,  276,  276,  273,  276,

			  269,  272,  277,  277,    0,  277,  274,  278,  278,    0,
			  278,  333,  279,  279,  270,  279,  280,  280,  334,  280,
			  272,  276,  329,  272,    0,  401,  273,  277,    0,  272,
			  281,  281,  278,  281,  402,  277,  276,  279,  305,  333,
			    0,  280,  282,  282,    0,  282,  334,    0,  403,  305,
			  278,  339,  339,  401,  339,  281,  279,  404,  340,  340,
			  305,  340,  402,  277,  276,  339,    0,  282,  342,  342,
			  305,  342,  280,    0,    0,  339,  403,    0,  278,  356,
			  356,  356,  356,  356,  279,  404,  406,    0,  305,  350,
			  371,  371,  282,  371,  356,  342,    0,  350,  350,  350,

			  350,  350,  350,    0,    0,  339,  357,  357,  357,  357,
			  357,    0,  340,    0,  406,  371,  407,  356,    0,    0,
			  282,  335,  356,  358,  358,  358,  358,  358,  359,  359,
			  359,  359,  359,    0,  335,  335,  335,  335,  335,  360,
			  360,  360,  360,  360,  407,  335,  335,  335,  335,  335,
			  335,  361,  361,  361,  361,  361,  363,  363,  363,  363,
			  363,  358,  409,  410,    0,  411,  361,  379,  379,  335,
			  379,    0,  335,  335,  335,  335,  335,  335,  335,  362,
			    0,  362,    0,    0,  362,  362,  362,  362,  362,  361,
			  409,  410,  379,  411,  361,  364,  364,  364,  364,  364,

			  365,  365,  365,  365,  365,  366,  366,  379,  366,  366,
			  366,  366,  366,  367,  367,  367,  367,  367,  368,  368,
			  368,  368,  368,  369,  369,    0,  369,  370,  370,  412,
			  370,  372,  372,  376,  372,  379,  373,  373,  365,  373,
			  374,  374,  413,  374,  376,    0,  414,    0,  369,  415,
			  375,  375,  370,  375,  376,    0,  372,  412,    0,  377,
			  377,  373,  377,    0,  370,  374,  378,  378,    0,  378,
			  413,  369,  376,  374,  414,  375,  416,  415,  372,  375,
			  380,  380,  373,  380,  377,    0,  381,  381,  417,  381,
			  418,  378,  370,  419,  382,  382,  377,  382,    0,  369,

			    0,  374,  420,    0,  416,  380,  372,  375,  421,  422,
			  373,  381,    0,  378,  383,  383,  417,  383,  418,  382,
			  380,  419,  381,  423,  377,  384,  384,  384,  384,  384,
			  420,  385,  482,  482,  385,  482,  421,  422,  382,  383,
			  385,  378,    0,  384,    0,  424,  384,    0,  380,    0,
			  381,  423,  384,  387,  387,  387,  387,  387,  383,  385,
			  392,  392,  385,  392,  425,    0,  382,  387,  385,  388,
			  388,  384,  388,  424,  384,  386,  386,  386,  386,  386,
			  384,  426,    0,  387,    0,  392,  383,  388,  388,  388,
			  388,  388,  425,  386,  388,  387,  389,  389,  389,  389,

			  389,  388,  390,  390,  390,  390,  390,  393,  393,  426,
			  393,  387,  394,  394,    0,  394,  390,  397,  397,    0,
			  397,  386,  391,  391,  391,  391,  391,    0,  389,  388,
			  395,  395,  393,  395,    0,    0,  391,  394,  396,  396,
			  431,  396,  397,  432,  390,  434,  397,  398,  398,    0,
			  398,  435,  487,  488,  433,  395,  389,  397,    0,  457,
			    0,  457,  398,  396,  391,  433,    0,  489,  431,  457,
			  396,  432,  398,  434,  397,  463,  463,  395,  463,  435,
			  487,  488,  433,    0,    0,  397,  443,  443,  443,  443,
			  443,  469,  469,  433,  469,  489,    0,  457,  396,    0,

			  463,  443,    0,    0,    0,  395,  438,  438,  438,  438,
			  438,  445,  445,  445,  445,  445,  469,  438,  438,  438,
			  438,  438,  438,  444,  444,  444,  444,  444,    0,  443,
			  446,  446,  446,  446,  446,    0,  448,  448,  448,  448,
			  448,    0,    0,    0,  438,  438,  438,  438,  438,  438,
			  438,  448,  449,  449,  449,  449,  449,  530,  530,  530,
			  530,  444,  450,  450,  450,  450,  450,  451,  451,  451,
			  451,  451,  459,  459,  448,  459,    0,    0,    0,  448,
			  452,  452,  452,  452,  452,  453,  453,  453,  453,  453,
			  455,  455,  455,  455,  455,  460,  460,  459,  460,    0,

			  450,    0,    0,  491,  456,  455,  456,  456,  456,  456,
			  456,  461,  461,    0,  461,    0,  462,  462,  452,  462,
			  460,  464,  464,    0,  464,    0,    0,  481,  459,  466,
			  466,  491,  466,  455,    0,  460,  461,  494,  481,  470,
			  470,  462,  470,  461,  467,  467,  464,  467,  481,  462,
			  471,  471,    0,  471,  466,  468,  468,    0,  468,  464,
			  496,  462,  466,  460,  470,  494,  481,  483,  483,  467,
			  483,  461,  470,    0,  497,  471,  467,  462,  472,  472,
			  468,  472,  473,  473,  473,  473,  473,  464,  496,  462,
			  466,    0,  468,    0,  471,    0,  473,  498,  474,  474,

			  470,  474,  497,  472,  467,  475,  475,  475,  475,  475,
			  500,  472,  476,  476,  476,  476,  476,    0,    0,  475,
			  468,  483,  471,  474,  473,  498,  475,  479,  479,    0,
			  479,    0,  475,  476,  477,  477,  501,  477,  500,  472,
			  478,  478,    0,  478,  474,  480,  480,  475,  480,  502,
			  484,  484,  479,  484,  475,  503,  490,  492,    0,  477,
			  475,  476,  504,  505,  501,  478,  506,  477,  490,  492,
			  480,  479,  507,  478,  508,  509,    0,  502,  510,  511,
			  512,  513,  514,  503,  490,  492,  480,  656,  656,  656,
			  504,  505,    0,    0,  506,  477,  490,  492,    0,  479,

			  507,  478,  508,  509,  484,  556,  510,  511,  512,  513,
			  514,    0,    0,    0,  480,  515,  515,  515,  515,  515,
			  519,  519,  519,  519,  519,  656,  515,  515,  515,  515,
			  515,  515,  517,  556,  517,    0,    0,  517,  517,  517,
			  517,  517,  518,  518,  518,  518,  518,  520,  521,  521,
			  521,  521,  521,  515,  515,  515,  515,  515,  515,  515,
			    0,    0,    0,  521,  522,  522,  522,  522,  522,    0,
			  520,  758,  758,  758,  758,  520,  773,  773,  773,  773,
			  518,  523,  523,  523,  523,  523,  524,  524,  524,  524,
			  524,  521,  525,  525,  525,  525,  525,  526,  526,  526,

			  526,  526,  522,  527,  527,  527,  527,  527,  528,  557,
			  528,    0,    0,  528,  528,  528,  528,  528,  529,  529,
			  529,  529,  529,  532,  532,  532,  532,  532,  533,  533,
			  525,  533,  558,  534,  534,  539,  534,  557,  532,  535,
			  535,  559,  535,  536,  536,    0,  536,    0,  537,  537,
			    0,  537,  539,  533,  560,    0,  539,  533,  534,    0,
			  558,    0,  534,    0,  535,    0,  532,    0,  536,  559,
			  562,    0,  535,  537,  538,  538,  551,  538,  540,  540,
			  539,  540,  560,  536,    0,  533,  563,  551,  541,  541,
			  534,  541,  542,  542,    0,  542,  565,  551,  562,  538,

			  535,  543,  543,  540,  543,    0,  544,  544,    0,  544,
			    0,  536,  538,  541,  563,  551,    0,  542,    0,  547,
			  547,  541,  547,  540,  565,    0,  543,  545,  545,  566,
			  545,  544,    0,  546,  546,  546,  546,  546,  542,  544,
			  538,    0,  552,    0,  547,  567,  543,  548,  548,  541,
			  548,  540,  545,  552,  546,  549,  549,  566,  549,  545,
			  546,  568,  569,  552,  570,    0,  542,  544,  550,  550,
			  571,  550,  548,  567,  543,  572,  573,  574,  575,  576,
			  549,  552,  546,  577,  579,  580,  549,  545,  546,  568,
			  569,  548,  570,  550,  581,  583,  620,  593,  571,  621,

			  550,    0,    0,  572,  573,  574,  575,  576,    0,    0,
			    0,  577,  579,  580,  549,    0,    0,    0,    0,  548,
			  593,    0,  581,  583,  620,  593,    0,  621,  550,  584,
			  584,  584,  584,  584,  586,  586,  586,  586,  586,    0,
			  584,  584,  584,  584,  584,  584,  587,  587,  587,  587,
			  587,  588,  588,  588,  588,  588,  589,    0,  589,    0,
			    0,  589,  589,  589,  589,  589,    0,  584,  584,  584,
			  584,  584,  584,  584,  590,    0,  590,    0,    0,  590,
			  590,  590,  590,  590,  591,  591,  591,  591,  591,  592,
			  592,  592,  592,  592,  594,  594,  594,  594,  594,  595,

			  595,  595,  595,  595,  597,  597,  597,  597,  597,  598,
			  598,  598,  598,  598,  599,  599,  599,  599,  599,    0,
			    0,    0,  591,  601,  601,  601,  601,  601,  602,  622,
			  602,    0,  608,  602,  602,  602,  602,  602,  601,  603,
			  603,  624,  603,  604,  604,    0,  604,  605,  605,  608,
			  605,  606,  606,  608,  606,  607,  607,  622,  607,  609,
			  609,  601,  609,    0,  603,  626,  601,    0,  604,  624,
			  610,  610,  605,  610,  630,    0,  606,  608,    0,  633,
			  607,  604,  606,  603,  609,  636,    0,  611,  611,    0,
			  611,  612,  612,  626,  612,  610,  613,  613,  638,  613,

			  614,  614,  630,  614,  640,  615,  615,  633,  615,  604,
			  606,  603,  611,  636,  616,  616,  612,  616,  641,  617,
			  617,  613,  617,  642,    0,  614,  638,  643,  664,  664,
			  615,  664,  640,  671,  672,  673,  613,  611,  615,  616,
			    0,  780,  780,  780,  617,    0,  641,    0,    0,  674,
			  616,  642,  617,  664,    0,  643,  647,  647,  647,  647,
			  647,  671,  672,  673,  613,  611,  615,  648,  648,  648,
			  648,  648,  649,  649,  649,  649,  649,  674,  616,  780,
			  617,  650,  650,  650,  650,  650,  651,  651,  651,  651,
			  651,  652,    0,  652,    0,    0,  652,  652,  652,  652, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  652,  675,    0,    0,    0,  648,  655,  655,  655,  655,
			  655,  657,  657,  657,  657,  657,  658,  658,  658,  658,
			  658,  659,  659,  659,  659,  659,  657,  660,  660,  675,
			  660,  661,  661,    0,  661,    0,  662,  662,    0,  662,
			  665,  665,    0,  665,    0,  666,  666,    0,  666,  657,
			  667,  667,  660,  667,  657,    0,  661,  678,  660,  659,
			    0,  662,  679,  668,  668,  665,  668,    0,  661,  662,
			  666,  665,  669,  680,  670,  667,  669,  666,  670,  681,
			  683,  704,  705,  667,    0,  678,  660,    0,  668,    0,
			  679,    0,    0,  669,    0,  670,  661,  662,    0,  665,

			    0,  680,    0,    0,  669,  666,  670,  681,  683,  704,
			  705,  667,  686,  686,  686,  686,  686,  688,  688,  688,
			  688,  688,  689,  689,  689,  689,  689,  690,  690,  690,
			  690,  690,  691,  691,  691,  691,  691,  692,  692,  692,
			  692,  692,  693,  693,  693,  693,  693,  706,    0,  709,
			  686,  695,  695,  695,  695,  695,  696,  696,    0,  696,
			  689,  697,  697,  702,  697,  698,  698,  702,  698,  699,
			  699,  710,  699,  700,  700,  706,  700,  709,  712,  701,
			  701,  696,  701,    0,  702,    0,  697,  703,    0,  695,
			  698,  703,  696,    0,  699,  702,    0,    0,  700,  710,

			  725,    0,  699,    0,  701,    0,  712,  697,  703,  715,
			  715,  715,  715,  715,  717,  717,  717,  717,  717,  703,
			  696,  719,  719,    0,  719,  701,  720,  720,  725,  720,
			  699,  718,  726,  718,  727,  697,  718,  718,  718,  718,
			  718,  721,  721,  728,  721,  729,  719,  715,    0,  722,
			  722,  720,  722,  701,  719,  730,    0,    0,    0,    0,
			  726,    0,  727,    0,  733,  733,  721,  733,  738,  718,
			  743,  728,    0,  729,  722,  749,  720,  732,  732,  732,
			  732,  732,  719,  730,  734,  734,  721,  734,  750,  733,
			  735,  735,  737,  735,  736,  736,  738,  736,  743,  722,

			  737,    0,    0,  749,  720,    0,    0,    0,    0,  734,
			  733,    0,    0,  737,  721,  735,  750,    0,  748,  736,
			  744,  744,  744,  744,  744,    0,  748,  722,  737,  745,
			  745,  745,  745,  745,  746,  746,  736,  746,  733,  748,
			  747,  747,  751,  747,  751,  752,  752,  761,  752,  755,
			  753,  753,  751,  753,  748,  762,    0,    0,  761,  746,
			  760,  760,    0,  760,  736,  747,    0,    0,  761,    0,
			  752,    0,    0,  747,    0,  753,    0,  755,    0,    0,
			  751,    0,    0,  762,  746,  760,  761,  752,  757,  757,
			  757,  757,  757,  760,  763,  763,  763,  763,  763,    0,

			    0,  747,  764,  764,  764,  764,  764,  765,  765,  766,
			  765,    0,  746,    0,    0,  752,    0,  769,    0,  769,
			  766,  760,  768,  768,  768,  768,  768,  769,  775,    0,
			  766,    0,  765,  771,  771,  771,  771,  771,  772,  772,
			  772,  772,  772,    0,  778,  775,    0,    0,  766,  775,
			  776,  776,  776,  776,  776,  769,  777,  777,  777,  777,
			  777,  778,    0,    0,    0,  778,  779,  779,  779,  779,
			  779,    0,    0,  775,  782,  782,  782,  782,  782,  783,
			  783,  783,  783,  783,  784,  784,  784,  784,  784,  778,
			  786,  786,  786,  786,  786,  787,    0,  787,    0,    0,

			  787,  787,  787,  787,  787,  788,  788,  788,  788,  788,
			  789,  789,  789,  789,  789,  817,  817,    0,    0,    0,
			    0,  817,  817,  817,  817,  817,  817,    0,    0,    0,
			    0,    0,    0,  787,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,

			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,

			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  796,
			  796,    0,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,    0,  796,

			  796,  796,  796,  796,  797,  797,    0,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  798,
			  798,  798,    0,    0,    0,    0,    0,    0,  798,  798,
			    0,    0,  798,    0,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,    0,    0,  798,
			  798,  798,  799,  799,    0,  799,  799,    0,  799,  799,

			    0,    0,    0,    0,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,    0,    0,  799,
			  799,  799,  800,  800,    0,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  801,  801,    0,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,

			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  802,  802,    0,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,    0,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  805,  805,  805,
			    0,    0,    0,  805,  805,    0,  805,  805,    0,    0,
			    0,    0,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,    0,  805,  805,  805,  805,

			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  808,  808,    0,  808,  808,  808,  808,  808,  808,  808,

			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  809,  809,    0,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,

			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  811,  811,  811,  811,  811,
			  811,  811,  811,    0,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  812,  812,    0,  812,  812,    0,  812,  812,  812,    0,
			    0,    0,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,

			  812,  812,  812,  812,  812,    0,    0,  812,  812,  812,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  814,  814,  814,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,    0,    0,    0,    0,    0,  814,  815,

			  815,    0,  815,    0,    0,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,    0,    0,
			  815,  815,  815,  816,  816,  816,  816,  816,  816,    0,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,    0,  816,  816,  816,  816,  818,  818,
			  818,    0,    0,    0,  818,  818,    0,  818,  818,    0,
			    0,    0,    0,  818,  818,  818,  818,  818,  818,  818,

			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,    0,    0,  818,  818,
			  818,  819,  819,  819,    0,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,    0,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  820,  820,    0,    0,
			    0,    0,  820,  820,  820,  820,  820,  820,  821,  821,
			  821,    0,    0,    0,  821,  821,    0,  821,  821,    0,
			    0,    0,    0,  821,  821,  821,  821,  821,  821,  821,

			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,    0,  821,  821,  821,
			  821,  822,  822,    0,    0,    0,    0,  822,  822,  822,
			  822,  822,  822,  823,  823,  823,  823,  823,  823,  823,
			  823,    0,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  824,  824,
			    0,    0,    0,    0,  824,  824,  824,  824,  824,  824,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790, yy_Dummy>>,
			1, 1974, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64, 1027, 4890,   92,  999,  972,  977, 4890,
			   88, 4890, 4890, 4890, 4890, 4890,  960,   82,  948,   91,
			  111, 4890, 4890,  936, 4890,  934,  918,  184,  114,  169,
			  253,  265,  271,  292,  276,  320,  324,  397,  338,  366,
			  351,  378,  288, 4890, 4890,  888,  476,  555,   79,  133,
			  151,   80,  150,   89,  132,  238,  147,  148,  145,  147,
			  909, 4890, 4890,  176,  281, 4890,  635,  202,  247, 4890,
			  294,  860, 4890,  370,  384,  448,  430, 4890,  186,  717,
			 4890,  340,  907, 4890,  896, 4890,  881,  800,    0,  716,

			  888,  868,  800, 4890,  447,  470,  773,  541,  816, 4890,
			 4890, 4890,  452,  458, 4890,  839,  843,  848,  857,  862,
			  866,  885,  894,  906,  911,  915,  922,  934,  938,  949,
			  978,  953,  986, 1063,  990,  983, 1040, 1067, 1052, 1095,
			 1106, 1110,  860,  556,  821, 4890,  270,  863, 1166,  854,
			  162,  276,    0,  708,  280,  297,  314,  318,  332,  362,
			  335,  376,  357,  360,  371,  368,  824,  822,  372,  711,
			  785,  404,  933,  741,  404,  454,  455,  534,  550,  711,
			  800,  818,  837,  849,  867,  886,  914,  911,  947,  933,
			  941,  963,  969,  970, 4890,  210, 4890,  781,  568,  311,

			 1119, 4890,  780, 1022, 4890, 1041,  730, 4890,  295, 1115,
			 1123, 1144, 4890, 1148,  123, 1246,  137,  345, 1328, 4890,
			 4890,  753,  774, 4890, 4890, 4890,  699,  717,  731,  730,
			 1162,  724,  722,  714,  713,  710,  779, 4890, 1246, 1172,
			 1145, 1185, 4890, 1262, 1195, 1290, 1134, 1200, 1313, 1290,
			 1380, 1385, 1389, 1394, 1398, 1403, 1368, 1431, 1441, 1319,
			 1447, 1451, 1460, 1474, 1480, 1508, 1517, 1543, 1489, 1552,
			 1566, 1267, 1554, 1560, 1531, 1500, 1594, 1600, 1605, 1610,
			 1614, 1628, 1640,  584, 4890, 4890,  555,  980,    0, 1314,
			 1321,  990,    0, 1012, 1037, 1058, 1067, 1084, 1113, 1135,

			 1230, 1232,  513, 1251,  508, 1619, 1279, 1283, 1350, 1356,
			 1364, 1370, 1388, 1398, 1406,    0,    0, 1398, 1425, 1421,
			 1437, 1438, 1454, 1448, 1458, 1451, 1451,  501, 1504, 1548,
			  500,    0,    0, 1559, 1566, 1714,  222, 4890,  503, 1649,
			 1656, 1196, 1666,    0,  469,  476, 4890, 4890, 4890, 4890,
			 1678, 4890, 4890, 4890, 4890, 4890, 1659, 1686, 1703, 1708,
			 1719, 1731, 1764, 1736, 1775, 1780, 1788, 1793, 1798, 1821,
			 1825, 1688, 1829, 1834, 1838, 1848, 1803, 1857, 1864, 1765,
			 1878, 1884, 1892, 1912, 1905, 1893, 1955, 1933, 1967, 1976,
			 1982, 2002, 1958, 2005, 2010, 2028, 2036, 2015, 2045, 1347,

			    0, 1575, 1584, 1609, 1618,    0, 1637, 1668,    0, 1713,
			 1715, 1730, 1798, 1807, 1807, 1800, 1834, 1846, 1851, 1844,
			 1860, 1870, 1871, 1877, 1899, 1918, 1935,    0,    0,    0,
			    0, 1991, 2009, 2023, 1996, 2017,  445,  410, 2086, 4890,
			 1557,    0, 4890, 2066, 2103, 2091, 2110,  380, 2116, 2132,
			 2142, 2147, 2160, 2165,  338, 2170, 2186, 2044,  716, 2170,
			 2193, 2209, 2214, 2073, 2219,  327, 2227, 2242, 2253, 2089,
			 2237, 2248, 2276, 2262, 2296, 2285, 2292, 2332, 2338, 2325,
			 2343, 2197, 1930, 2265, 2348,  270,  253, 2010, 2011, 2033,
			 2321, 2169, 2322,    0, 2197,    0, 2225, 2240, 2258,    0,

			 2275, 2302, 2310, 2320, 2327, 2317, 2331, 2326, 2339, 2340,
			 2343, 2333, 2337, 2346, 2347, 2395,    0, 2417, 2422, 2400,
			 2412, 2428, 2444, 2461, 2466, 2472, 2477, 2483, 2493, 2498,
			 2137, 4890, 2503, 2526, 2531, 2537, 2541, 2546, 2572, 2505,
			 2576, 2586, 2590, 2599, 2604, 2625, 2613, 2617, 2645, 2653,
			 2666, 2546, 2612,  582, 4890, 4890, 2374, 2478, 2501, 2506,
			 2512,    0, 2535, 2544,    0, 2556, 2582, 2610, 2613, 2615,
			 2629, 2622, 2628, 2629, 2642, 2644, 2644, 2649,    0, 2638,
			 2652, 2660,    0, 2649, 2709,    0, 2714, 2726, 2731, 2741,
			 2759, 2764, 2769, 2662, 2774, 2779,  270, 2784, 2789, 2794,

			 4890, 2803, 2813, 2837, 2841, 2845, 2849, 2853, 2802, 2857,
			 2868, 2885, 2889, 2894, 2898, 2903, 2912, 2917,  197,  187,
			 2650, 2659, 2789,    0, 2808,    0, 2832,    0,    0,    0,
			 2822,    0,    0, 2827,    0,    0, 2843,    0, 2856,    0,
			 2869, 2880, 2888, 2892,  953,  172,   87, 2936, 2947, 2952,
			 2961, 2966, 2976,   72,  462, 2986, 2372, 2991, 2996, 3001,
			 3025, 3029, 3034, 4890, 2926, 3038, 3043, 3048, 3061, 3042,
			 3044, 2900, 2895, 2896, 2914, 2966,    0,    0, 3024, 3029,
			 3039, 3044,    0, 3046,  348,  113, 3092,   63, 3097, 3102,
			 3107, 3112, 3117, 3122, 4890, 3131, 3154, 3159, 3163, 3167,

			 3171, 3177, 3133, 3157, 3043, 3034, 3099,    0,    0, 3114,
			 3136,    0, 3130,    0, 4890, 3189,   60, 3194, 3216, 3219,
			 3224, 3239, 3247,  484, 4890, 3165, 3180, 3182, 3196, 3198,
			 3203,  452, 3257, 3262, 3282, 3288, 3292, 3262, 3220,    0,
			    0,    0,    0, 3226, 3300, 3309, 3332, 3338, 3288, 3223,
			 3253, 3327, 3343, 3348,   76, 3305,    0, 3368, 2451, 4890,
			 3358, 3317, 3320, 3374, 3382, 3405, 3379,    0, 3402, 3402,
			   70, 3413, 3418, 2456, 4890, 3398, 3430, 3436, 3414, 3446,
			 2926, 4890, 3454, 3459, 3464, 4890, 3470, 3480, 3485, 3490,
			 4890, 3533, 3578, 3623, 3668, 3713, 3758, 3803, 3847, 3887,

			 3931, 3976, 4021, 4066, 4111, 4155, 4199, 4244, 4289, 4334,
			 4379, 4424, 4465, 4509, 4553, 4588, 4632, 3504, 4676, 4720,
			 4755, 4776, 4810, 4832, 4867, yy_Dummy>>)
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
			   47,  798,  798,  798,  798,   47,  798,  798,  798,  798,
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
			    0,    0,    0,  129,  127,    1,    2,   15,  105,   18,
			  127,   16,   17,    7,    6,   13,    5,   11,    8,   96,
			   96,   14,   12,   29,   10,   30,   20,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   78,   89,   89,
			   89,   89,   22,   31,   23,    9,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   24,   21,   25,  110,  111,  112,  110,  113,  128,   94,
			  128,  128,  128,  128,  128,  128,  128,   68,  128,  128,
			   88,    1,    2,   28,  105,  104,  125,  125,  125,  125,

			    3,   33,  100,   32,    0,    0,   96,    0,   96,   27,
			   26,   19,    0,   89,   85,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   40,
			   89,   84,   84,   77,   84,   84,   89,   89,   89,   89,
			   89,   89,    0,    0,    0,   95,    0,    0,   91,    0,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   40,
			   91,   40,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   92,  110,  112,    0,  111,  110,

			  110,  107,  106,    0,   94,    0,    0,   93,    0,    0,
			    0,    0,   68,    0,   66,    0,   65,    0,    0,   88,
			   86,   86,    0,   87,  125,  114,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,    4,   34,  100,    0,
			    0,    0,   98,  100,   98,   96,    0,    0,   89,   39,
			   89,   89,   89,   89,   89,   89,    0,   89,   89,   89,
			   89,   89,   42,   89,   89,   78,   79,   78,   79,   78,
			   78,   83,   89,   83,   83,   83,   89,   89,   89,   89,
			   89,   41,   89,    0,   63,   90,    0,   91,   39,   69,
			   69,   91,   39,   91,   91,   91,   91,   91,   91,   91,

			   91,   91,   91,   91,   91,    0,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   42,   42,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   41,   41,   91,   91,  110,  108,   93,    0,    0,
			   67,   65,    0,    0,    0,    0,  121,  119,  122,  126,
			  126,  120,  118,  115,  116,  117,  100,    0,  100,    0,
			    0,  100,    0,    0,    0,   99,   96,    0,    0,   89,
			   89,   38,   89,   89,   89,   89,    0,   89,   89,   89,
			   89,   89,   89,   89,   89,   77,   89,   89,   89,   89,
			   77,   77,   77,   37,   44,   89,   89,   89,   89,   64,

			   60,   91,   91,   91,   91,   38,   91,   91,   38,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   37,   44,   37,
			   44,   91,   91,   91,   91,   91,   91,   91,  110,   67,
			   65,    0,  123,  100,  100,    0,    0,   97,  100,    0,
			   99,    0,   99,    0,    0,    0,   96,   74,    0,   89,
			   89,   89,   89,   45,   89,    0,   89,   89,   89,   36,
			   89,   89,   89,   79,   78,   89,   89,   89,   89,   89,
			   89,    0,   64,   64,    0,   91,   91,   91,   91,   91,
			   91,   91,   91,   45,   91,   45,   91,   91,   91,   36,

			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,  110,    0,    0,  100,    0,
			  103,  100,   99,    0,    0,   99,    0,    0,   98,    0,
			    0,   74,    0,   89,   89,   89,   89,   47,   89,    0,
			   89,   89,   89,   89,   89,   89,   89,   53,   89,   89,
			   89,    0,    0,    0,   62,   61,   91,   91,   91,   91,
			   91,   47,   91,   91,   47,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   53,   91,
			   91,   91,   53,   91,  110,    0,    0,  100,    0,    0,
			    0,   99,    0,  103,   99,    0,   76,    0,    0,    0,

			  101,  103,  101,   89,   89,   59,   89,   46,    0,   43,
			   58,   89,   35,   89,   51,   89,   89,   89,    0,    0,
			   91,   91,   91,   59,   91,   59,   91,   46,   43,   58,
			   91,   43,   58,   91,   35,   35,   91,   51,   91,   51,
			   91,   91,   91,   91,  110,    0,  103,    0,  103,    0,
			   99,    0,    0,  102,    0,    0,   73,  103,    0,  102,
			   89,   89,   89,   81,   54,   89,   89,   89,   55,    0,
			    0,   91,   91,   91,   91,   91,   54,   54,   91,   91,
			   91,   91,   55,   91,  109,    0,  103,  102,    0,  102,
			    0,    0,    0,    0,   73,  102,   89,   89,   48,   89,

			   52,   89,    0,    0,   91,   91,   91,   48,   48,   91,
			   91,   52,   91,   52,  124,  102,   75,    0,   73,   89,
			   89,   89,   89,   80,   80,   91,   91,   91,   91,   91,
			   91,    0,    0,   89,   50,   49,   89,    0,   91,   50,
			   50,   49,   49,   91,    0,    0,   89,   89,    0,   91,
			   91,   72,   89,   56,    0,   91,   56,    0,    0,   72,
			   89,    0,   91,    0,    0,   57,    0,   57,    0,   71,
			    0,    0,    0,    0,   71,    0,    0,    0,    0,    0,
			   70,   82,    0,    0,    0,   70,    0,   70,    0,    0,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4890
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

	yyNb_rules: INTEGER is 128
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 129
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
