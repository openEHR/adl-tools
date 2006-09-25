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
if yy_act <= 98 then
if yy_act <= 82 then
if yy_act <= 74 then
if yy_act <= 70 then
if yy_act <= 68 then
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
else
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
end
else
if yy_act <= 72 then
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
else
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
end
end
else
if yy_act <= 78 then
if yy_act <= 76 then
if yy_act = 75 then
--|#line 287 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 287")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 288 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 288")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 77 then
--|#line 295 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 295")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 296 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 296")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 80 then
if yy_act = 79 then
--|#line 303 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 303")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 315 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 315")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 81 then
--|#line 325 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 325")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 330 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 330")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 90 then
if yy_act <= 86 then
if yy_act <= 84 then
if yy_act = 83 then
--|#line 340 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 340")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 346 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 346")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 85 then
--|#line 356 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 356")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 357 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 357")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 88 then
if yy_act = 87 then
--|#line 369 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 369")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 374 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 374")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 89 then
--|#line 378 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 378")
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
--|#line 413 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 413")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
end
else
if yy_act <= 94 then
if yy_act <= 92 then
if yy_act = 91 then
--|#line 418 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 418")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 423 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 423")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 93 then
--|#line 429 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 429")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 435 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 435")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 96 then
if yy_act = 95 then
--|#line 441 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 441")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 445 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 445")
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
if yy_act = 97 then
--|#line 455 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 455")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 462 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 462")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
end
end
else
if yy_act <= 114 then
if yy_act <= 106 then
if yy_act <= 102 then
if yy_act <= 100 then
if yy_act = 99 then
--|#line 467 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 467")
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
--|#line 482 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 482")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 101 then
--|#line 483 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 483")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 104 then
if yy_act = 103 then
	yy_end := yy_end - 1
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
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
--|#line 489 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 489")
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
if yy_act = 105 then
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
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
--|#line 510 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 510")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
end
else
if yy_act <= 110 then
if yy_act <= 108 then
if yy_act = 107 then
--|#line 514 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 514")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 520 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 520")
end
in_buffer.append_character ('\')
end
else
if yy_act = 109 then
--|#line 521 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 521")
end
in_buffer.append_character ('"')
else
--|#line 522 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 522")
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
if yy_act <= 112 then
if yy_act = 111 then
--|#line 536 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 536")
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
--|#line 550 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 550")
end
in_buffer.append_string (text)
end
else
if yy_act = 113 then
--|#line 552 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 552")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
--|#line 557 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 557")
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
if yy_act <= 122 then
if yy_act <= 118 then
if yy_act <= 116 then
if yy_act = 115 then
--|#line 568 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 568")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 576 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 576")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 117 then
--|#line 577 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 577")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 578 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 578")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
else
if yy_act <= 120 then
if yy_act = 119 then
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 580 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 580")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
else
if yy_act = 121 then
--|#line 581 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 581")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 126 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 583 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 583")
end
last_token := V_CHARACTER; last_character_value := '"'
else
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
end
else
if yy_act = 125 then
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
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
--|#line 599 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 599")
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
if yy_act <= 128 then
if yy_act = 127 then
--|#line 609 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 609")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 610 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 610")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 129 then
--|#line 614 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 614")
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
			create an_array.make (0, 5026)
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
			   89,   76,   76,   89,   91,  789,   91,   91,   97,   98,

			  101,  788,  102,  102,  102,  102,  102,  104,  772,  105,
			  156,  106,  106,  106,  106,  106,  112,  112,  166,  112,
			  174,  771,   80,   80,  738,  214,  214,  104,  214,  105,
			  526,  108,  108,  108,  108,  108,   77,   77,  157,  216,
			  216,  114,  216,   99,   90,  721,  167,   90,  175,  107,
			   81,   81,   82,   83,   84,   82,   83,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   85,  107,
			   82,  112,  112,  158,  112,  176,   82,   82,   82,   82,
			   82,   82,  162,  196,  159,  182,  112,  112,  190,  112,
			  186,  168,  169,  183,  163,  187,  114,  170,  455,  192,

			  117,  160,  288,  177,  447,   82,   82,   87,   82,  201,
			  164,  114,  161,  184,  691,  218,  191,  196,  188,  171,
			  172,  185,  165,  189,  115,  173,  116,  193,  117,  196,
			  288,  197,   82,   82,   82,   82,   83,   84,   82,   83,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   85,  115,   82,  116,  112,  112,  202,  112,   82,
			   82,   82,   82,   82,   82,  197,  204,  112,  112,  219,
			  112,  178,  146,  112,  112,  146,  112,  197,  112,  112,
			  114,  112,  147,  198,  179,  198,  198,  676,   82,   82,
			   87,   82,  114,  118,  112,  112,  120,  112,  114,  180,

			  142,  142,  205,  114,  119,  142,  142,  126,  121,  122,
			  289,  675,  181,  207,  338,   82,   82,   82,  196,  114,
			  288,  118,  112,  112,  120,  112,  112,  112,  659,  112,
			  206,  289,  119,  123,  124,  126,  121,  122,  289,  125,
			  112,  112,   91,  112,   91,   91,  142,  114,  292,  205,
			  208,  114,  619,  112,  112,  196,  112,  128,  560,  293,
			  294,  123,  124,  127,  294,  114,  197,  125,  112,  112,
			  129,  112,  209,  210,  218,  209,  136,  206,  114,  296,
			  112,  112,  296,  112,  137,  128,  210,  210,  294,  210,
			  336,  127,  295,  114,  140,  297,  560,  302,  129,  112,

			  112,  298,  112,  197,  136,  114,  303,  296,  138,  297,
			  299,  302,  137,  139,  303,  298,  307,  130,  130,  130,
			  130,  130,  140,  297,  114,  302,  212,  542,  219,  298,
			  141,  131,  213,  210,  303,  213,  138,  300,  132,  304,
			  212,  139,  305,  301,  307,  133,  214,  134,  307,  135,
			  213,  210,  314,  213,  112,  112,  216,  112,  141,  131,
			  112,  112,  530,  112,  214,  215,  132,  241,  241,  241,
			  241,  241,  752,  752,  216,  134,  311,  135,  146,  114,
			  314,  146,  696,  696,  696,  114,  212,  104,  147,  744,
			  243,  243,  243,  243,  243,  484,  148,  148,  148,  148,

			  148,  149,  314,  316,  212,  244,  484,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  150,  148,  151,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  315,  316,  745,  244,  148,  152,  152,  153,  152,  152,
			  152,  152,  152,  152,  154,  152,  155,  152,  152,  152,
			  152,  152,  153,  152,  152,  152,  152,  146,  444,  346,
			  146,  247,  247,  247,  247,  247,  441,  147,  142,  142,
			  198,  435,  198,  198,  435,  148,  148,  148,  148,  148,
			  149,  284,  316,  318,  806,  806,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  414,
			  317,  318,  285,  148,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  195,  195,  558,  195,
			  195,  195,  196,  199,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  195,
			  197,  195,  195,  195,  200,  200,  200,  200,  200,  200,

			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  195,  195,  195,  221,
			  221,  414,  221,  228,  402,  401,  290,  229,  291,  291,
			  291,  291,  291,  356,  535,  355,  230,  230,  230,  230,
			  230,  354,  353,  352,  308,  319,  222,  309,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  231,  308,  319,  107,  309,  343,  343,  348,  343,
			  232,  236,  347,  236,  236,  346,  233,  344,  806,  104,
			  234,  105,  235,  245,  245,  245,  245,  245,  246,  208,

			  223,  224,  224,  222,  224,  224,  224,  224,  226,  224,
			  224,  225,  224,  224,  224,  224,  224,  224,  224,  224,
			  238,  238,  238,  238,  238,  224,  224,  224,  224,  224,
			  224,  107,  104,  318,  105,  239,  245,  245,  245,  245,
			  245,  112,  112,  196,  112,  112,  112,  196,  112,  310,
			  112,  112,  319,  112,  224,  224,  224,  224,  240,  112,
			  112,  320,  112,  239,  112,  112,  114,  112,  112,  112,
			  114,  112,  322,  310,  107,  114,  306,  249,  256,  248,
			  321,  224,  224,  224,  114,  287,  286,  112,  112,  114,
			  112,  145,  284,  114,  250,  252,  112,  112,  323,  112,

			  322,  253,  322,  237,  251,  249,  254,  248,  112,  112,
			  236,  112,  114,  112,  112,  225,  112,  112,  112,  256,
			  112,  114,  250,  252,  112,  112,  323,  112,   95,  253,
			  324,  255,  251,  114,  254,  323,  112,  112,  114,  112,
			  112,  112,  114,  112,  258,   92,  328,  259,  208,  114,
			  257,  112,  112,  326,  112,  112,  112,  327,  112,  255,
			  196,  114,  194,  325,  145,  114,  308,  111,  328,  309,
			  261,  263,  258,  260,  328,  259,  114,  110,  257,  690,
			  114,  326,  262,  264,  109,  327,  326,  332,  112,  112,
			  327,  112,  112,  112,  312,  112,  331,  313,  261,  263,

			  103,  271,  100,  113,  113,  113,  113,  113,  197,  332,
			  262,  264,  265,  114,  329,  332,  266,  114,  330,  267,
			  131,  334,  334,  403,  131,  268,  113,   95,  269,   93,
			  270,  271,   92,  403,  271,  113,  134,  333,  271,  806,
			  265,  204,  112,  112,  266,  112,  405,  267,  131,  334,
			  335,  403,  131,  268,  112,  112,  269,  112,  270,  806,
			  207,  404,  806,  113,  134,  112,  112,  114,  112,  112,
			  112,  405,  112,  806,  405,  276,  806,  205,  277,  114,
			  806,  806,  806,  272,  272,  272,  272,  272,  806,  806,
			  114,  279,  806,  407,  114,  280,  205,  112,  112,  406,

			  112,  273,  806,  276,  274,  206,  277,  408,  112,  112,
			  275,  112,  112,  112,  806,  112,  278,  209,  210,  279,
			  209,  407,  114,  280,  206,  210,  210,  195,  210,  273,
			  281,  409,  274,  114,  806,  408,  806,  114,  275,  200,
			  200,  200,  200,  200,  278,  337,  213,  210,  407,  213,
			  213,  210,  282,  213,  368,  368,  368,  368,  281,  409,
			  214,  806,  283,  806,  214,  360,  360,  360,  360,  360,
			  216,  212,  806,  349,  216,  408,  410,  200,  806,  212,
			  282,  350,  351,  351,  351,  351,  351,  358,  806,  358,
			  283,  806,  359,  359,  359,  359,  359,  806,  342,  442,

			  212,  342,  806,  411,  212,  361,  361,  361,  361,  361,
			  365,  806,  365,  806,  806,  366,  366,  366,  366,  366,
			  369,  369,  369,  369,  369,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  339,  340,  341,
			  339,  340,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  214,  806,  806,  339,  357,  357,  357,  357,
			  357,  339,  342,  339,  339,  339,  339,  409,  806,  413,
			  806,  239,  362,  362,  362,  362,  362,  113,  113,  113,
			  113,  113,  112,  112,  806,  112,  806,  363,  413,  806,

			  339,  339,  212,  339,  240,  412,  104,  413,  105,  239,
			  367,  367,  367,  367,  367,  112,  112,  114,  112,  416,
			  364,  112,  112,  417,  112,  363,  415,  339,  339,  339,
			  221,  221,  290,  221,  290,  290,  290,  290,  290,  290,
			  114,  291,  291,  291,  291,  291,  114,  416,  107,  485,
			  485,  417,  486,  806,  806,  806,  370,  222,  380,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  112,  112,  370,  112,  380,  112,  112,  418,
			  112,  112,  112,  806,  112,  419,  112,  112,  377,  112,

			  112,  112,  806,  112,  416,  112,  112,  114,  112,  377,
			  417,  223,  114,  806,  371,  806,  114,  418,  806,  377,
			  372,  114,  806,  419,  806,  114,  806,  418,  806,  373,
			  114,  423,  420,  112,  112,  806,  112,  377,  421,  423,
			  806,  374,  371,  112,  112,  375,  112,  425,  372,  112,
			  112,  806,  112,  112,  112,  422,  112,  373,  114,  423,
			  426,  376,  112,  112,  806,  112,  806,  424,  114,  374,
			  425,  378,  426,  375,  114,  425,  112,  112,  114,  112,
			  429,  379,  112,  112,  382,  112,  381,  114,  426,  430,
			  429,  112,  112,  430,  112,  806,  433,  434,  427,  378,

			  428,  114,  112,  112,  806,  112,  806,  114,  429,  379,
			  112,  112,  382,  112,  381,  384,  114,  430,  431,  112,
			  112,  432,  112,  383,  433,  434,  806,  114,  385,  385,
			  385,  385,  385,  112,  112,  114,  112,  387,  387,  387,
			  387,  387,  806,  384,  114,  112,  112,  806,  112,  433,
			  806,  383,  806,  806,  112,  112,  386,  112,  114,  216,
			  216,  806,  216,  388,  388,  388,  388,  388,  112,  112,
			  114,  112,  389,  389,  389,  389,  389,  436,  275,  114,
			  113,  113,  113,  113,  113,  806,  390,  390,  390,  390,
			  390,  386,  391,  114,  806,  392,  112,  112,  113,  112,

			  386,  393,  112,  112,  806,  112,  275,  112,  112,  806,
			  112,  434,  112,  112,  386,  112,  112,  112,  806,  112,
			  391,  114,  287,  392,  438,  395,  113,  114,  438,  393,
			  806,  806,  114,  377,  806,  806,  394,  114,  488,  437,
			  396,  114,  112,  112,  377,  112,  112,  112,  806,  112,
			  112,  112,  438,  112,  377,  397,  439,  488,  210,  210,
			  398,  210,  340,  341,  394,  340,  488,  114,  396,  490,
			  806,  114,  377,  490,  492,  114,  214,  343,  343,  806,
			  343,  349,  806,  397,  806,  489,  342,  493,  398,  350,
			  351,  351,  351,  351,  351,  806,  806,  490,  399,  492,

			  400,  491,  492,  806,  806,  359,  359,  359,  359,  359,
			  112,  112,  212,  112,  806,  493,  212,  485,  485,  806,
			  485,  445,  445,  445,  445,  445,  806,  494,  400,  196,
			  446,  446,  446,  446,  446,  114,  239,  448,  448,  448,
			  448,  448,  440,  440,  440,  440,  440,  449,  449,  449,
			  449,  449,  806,  440,  440,  440,  440,  440,  440,  240,
			  806,  493,  806,  806,  239,  806,  112,  112,  447,  112,
			  806,  806,  450,  450,  450,  450,  450,  197,  806,  806,
			  440,  440,  440,  440,  440,  440,  440,  363,  451,  495,
			  451,  114,  806,  452,  452,  452,  452,  452,  453,  453,

			  453,  453,  453,  366,  366,  366,  366,  366,  806,  806,
			  364,  496,  806,  806,  461,  363,  454,  454,  454,  454,
			  454,  456,  457,  806,  458,  458,  458,  458,  458,  459,
			  459,  459,  459,  459,  460,  460,  460,  460,  460,  496,
			  112,  112,  461,  112,  112,  112,  806,  112,  112,  112,
			  806,  112,  806,  467,  455,  112,  112,  806,  112,  497,
			  112,  112,  496,  112,  467,  114,  806,  485,  485,  114,
			  486,  499,  479,  114,  467,  112,  112,  462,  112,  806,
			  114,  112,  112,  479,  112,  114,  500,  497,  465,  466,
			  498,  463,  467,  479,  464,  112,  112,  806,  112,  499,

			  114,  112,  112,  806,  112,  462,  114,  112,  112,  501,
			  112,  479,  468,  806,  500,  806,  465,  466,  502,  463,
			  114,  558,  464,  806,  112,  112,  114,  112,  469,  806,
			  112,  112,  114,  112,  499,  470,  113,  501,  500,  113,
			  468,  471,  501,  472,  806,  113,  502,  112,  112,  114,
			  112,  112,  112,  806,  112,  114,  469,  385,  385,  385,
			  385,  385,  503,  470,  113,  806,  504,  113,  473,  471,
			  505,  472,  114,  113,  474,  266,  114,  506,  475,  387,
			  387,  387,  387,  387,  268,  388,  388,  388,  388,  388,
			  390,  390,  390,  390,  390,  506,  473,  113,  508,  265,

			  806,  806,  474,  266,  806,  506,  475,  806,  509,  806,
			  112,  112,  268,  112,  806,  269,  522,  522,  522,  522,
			  522,  508,  113,  507,  806,  113,  508,  265,  389,  389,
			  389,  389,  389,  806,  509,  114,  509,  477,  477,  477,
			  477,  477,  476,  269,  478,  478,  478,  478,  478,  510,
			  113,  113,  112,  112,  512,  112,  112,  112,  113,  112,
			  112,  112,  511,  112,  112,  112,  513,  112,  512,  806,
			  476,  513,  112,  112,  561,  112,  806,  114,  561,  113,
			  514,  114,  512,  806,  550,  114,  113,  484,  806,  114,
			  806,  515,  481,  482,  513,  550,  516,  114,  806,  517,

			  806,  806,  561,  480,  483,  550,  562,  806,  514,  445,
			  445,  445,  445,  445,  523,  523,  523,  523,  523,  515,
			  481,  482,  563,  550,  520,  521,  521,  521,  521,  521,
			  806,  480,  483,  518,  518,  518,  518,  518,  452,  452,
			  452,  452,  452,  806,  518,  518,  518,  518,  518,  518,
			  563,  806,  520,  524,  524,  524,  524,  524,  527,  527,
			  527,  527,  527,  447,  806,  563,  569,  570,  363,  806,
			  806,  518,  518,  518,  518,  518,  518,  518,  525,  525,
			  525,  525,  525,  528,  528,  528,  528,  528,  806,  112,
			  112,  364,  112,  566,  569,  570,  363,  529,  529,  529,

			  529,  529,  524,  524,  524,  524,  524,  457,  806,  458,
			  458,  458,  458,  458,  114,  555,  526,  531,  532,  806,
			  532,  455,  112,  112,  806,  112,  555,  806,  533,  537,
			  112,  112,  571,  112,  112,  112,  556,  112,  112,  112,
			  806,  112,  806,  112,  112,  531,  112,  114,  806,  112,
			  112,  806,  112,  806,  555,  114,  534,  537,  806,  114,
			  571,  806,  538,  114,  564,  572,  806,  539,  114,  112,
			  112,  570,  112,  806,  114,  806,  565,  806,  536,  540,
			  806,  541,  543,  112,  112,  806,  112,  806,  112,  112,
			  538,  112,  564,  572,  114,  539,  571,  112,  112,  573,

			  112,  544,  112,  112,  565,  112,  806,  540,  114,  541,
			  543,  112,  112,  114,  112,  112,  112,  806,  112,  572,
			  545,  806,  114,  806,  574,  806,  806,  114,  576,  544,
			  546,  549,  549,  549,  549,  549,  114,  698,  699,  698,
			  114,  806,  806,  576,  548,  113,  547,  575,  545,  477,
			  477,  477,  477,  477,  112,  112,  576,  112,  546,  112,
			  112,  386,  112,  113,  478,  478,  478,  478,  478,  564,
			  392,  577,  548,  113,  547,  700,  393,  112,  112,  114,
			  112,  565,  578,  579,  114,  113,  578,  551,  579,  582,
			  806,  113,  552,  112,  112,  583,  112,  567,  392,  584,

			  806,  806,  114,  557,  393,  585,  806,  582,  583,  568,
			  578,  579,  625,  113,  580,  551,  581,  582,  114,  806,
			  552,  553,  626,  583,  593,  626,  806,  584,  592,  592,
			  592,  592,  592,  585,  554,  586,  587,  590,  806,  590,
			  625,  806,  591,  591,  591,  591,  591,  240,  806,  553,
			  626,  806,  593,  627,  559,  591,  591,  591,  591,  591,
			  806,  806,  554,  588,  588,  588,  588,  588,  524,  524,
			  524,  524,  524,  806,  588,  588,  588,  588,  588,  588,
			  628,  629,  628,  594,  595,  595,  595,  595,  595,  603,
			  603,  603,  603,  447,  596,  596,  596,  596,  596,  806,

			  806,  588,  588,  588,  588,  588,  588,  588,  628,  629,
			  630,  594,  597,  597,  597,  597,  597,  598,  598,  598,
			  598,  598,  526,  599,  599,  599,  599,  599,  600,  600,
			  600,  600,  600,  601,  629,  601,  806,  806,  598,  598,
			  598,  598,  598,  602,  602,  602,  602,  602,  605,  605,
			  605,  605,  605,  112,  112,  455,  112,  632,  112,  112,
			  612,  112,  631,  606,  112,  112,  633,  112,  112,  112,
			  806,  112,  806,  112,  112,  806,  112,  612,  114,  634,
			  806,  612,  607,  114,  806,  632,  806,  608,  806,  114,
			  806,  606,  806,  114,  633,  635,  806,  609,  114,  112,

			  112,  623,  112,  112,  112,  612,  112,  634,  610,  806,
			  607,  633,  623,  112,  112,  608,  112,  112,  112,  806,
			  112,  634,  624,  635,  114,  609,  112,  112,  114,  112,
			  806,  112,  112,  806,  112,  806,  610,  611,  114,  636,
			  623,  806,  114,  806,  112,  112,  614,  112,  613,  637,
			  806,  114,  112,  112,  635,  112,  114,  806,  549,  549,
			  549,  549,  549,  615,  617,  611,  806,  624,  806,  114,
			  639,  616,  112,  112,  614,  112,  613,  114,  624,  113,
			  112,  112,  638,  112,  618,  268,  639,  641,  624,  642,
			  806,  615,  617,  112,  112,  641,  112,  114,  639,  616,

			  642,  645,  646,  647,  645,  114,  624,  113,  806,  806,
			  677,  621,  618,  268,  640,  641,  620,  642,  114,  806,
			  806,  806,  678,  643,  678,  622,  806,  806,  644,  645,
			  646,  647,  648,  591,  591,  591,  591,  591,  677,  621,
			  775,  775,  775,  775,  620,  591,  591,  591,  591,  591,
			  678,  806,  679,  622,  649,  649,  649,  649,  649,  651,
			  651,  651,  651,  651,  806,  649,  649,  649,  649,  649,
			  649,  652,  806,  652,  806,  806,  653,  653,  653,  653,
			  653,  654,  806,  654,  806,  806,  655,  655,  655,  655,
			  655,  657,  649,  649,  649,  649,  649,  649,  649,  655,

			  655,  655,  655,  655,  656,  656,  656,  656,  656,  598,
			  598,  598,  598,  598,  364,  791,  791,  791,  791,  657,
			  658,  658,  658,  658,  658,  598,  598,  598,  598,  598,
			  660,  660,  660,  660,  660,  806,  806,  526,  661,  661,
			  661,  661,  661,  662,  662,  662,  662,  662,  663,  806,
			  663,  806,  668,  664,  664,  664,  664,  664,  657,  112,
			  112,  680,  112,  112,  112,  806,  112,  112,  112,  668,
			  112,  112,  112,  668,  112,  112,  112,  671,  112,  112,
			  112,  364,  112,  806,  114,  680,  657,  806,  114,  680,
			  112,  112,  114,  112,  671,  806,  114,  668,  671,  682,

			  114,  666,  667,  665,  114,  682,  806,  112,  112,  806,
			  112,  112,  112,  681,  112,  114,  112,  112,  684,  112,
			  112,  112,  671,  112,  684,  112,  112,  682,  112,  666,
			  667,  665,  114,  683,  112,  112,  114,  112,  686,  112,
			  112,  114,  112,  687,  806,  114,  684,  688,  686,  806,
			  114,  806,  685,  806,  711,  712,  670,  669,  672,  114,
			  806,  799,  800,  799,  114,  806,  686,  806,  806,  712,
			  673,  687,  674,  806,  806,  688,  689,  653,  653,  653,
			  653,  653,  711,  712,  670,  669,  672,  692,  692,  692,
			  692,  692,  655,  655,  655,  655,  655,  713,  673,  801, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  674,  655,  655,  655,  655,  655,  693,  693,  693,  693,
			  693,  694,  806,  694,  806,  806,  695,  695,  695,  695,
			  695,  714,  806,  806,  806,  447,  697,  697,  697,  697,
			  697,  597,  597,  597,  597,  597,  664,  664,  664,  664,
			  664,  701,  701,  701,  701,  701,  657,  112,  112,  714,
			  112,  112,  112,  806,  112,  806,  112,  112,  806,  112,
			  112,  112,  806,  112,  806,  112,  112,  806,  112,  364,
			  706,  709,  114,  806,  657,  709,  114,  714,  702,  455,
			  806,  114,  716,  112,  112,  114,  112,  706,  703,  704,
			  114,  706,  709,  806,  112,  112,  705,  112,  112,  112,

			  710,  112,  716,  709,  710,  715,  702,  718,  114,  719,
			  716,  718,  806,  806,  806,  706,  703,  704,  806,  114,
			  806,  710,  806,  114,  705,  806,  707,  732,  733,  733,
			  717,  708,  710,  112,  112,  718,  112,  719,  806,  720,
			  651,  651,  651,  651,  651,  695,  695,  695,  695,  695,
			  112,  112,  806,  112,  707,  732,  733,  734,  114,  708,
			  722,  722,  722,  722,  722,  723,  723,  723,  723,  723,
			  534,  534,  534,  534,  534,  114,  806,  806,  447,  724,
			  724,  724,  724,  724,  725,  725,  725,  725,  725,  658,
			  658,  658,  658,  658,  112,  112,  727,  112,  526,  806,

			  112,  112,  806,  112,  112,  112,  806,  112,  735,  112,
			  112,  730,  112,  735,  731,  730,  737,  806,  731,  114,
			  112,  112,  806,  112,  727,  114,  746,  455,  747,  114,
			  726,  747,  730,  728,  114,  731,  735,  806,  806,  806,
			  749,  736,  749,  730,  737,  114,  731,  693,  693,  693,
			  693,  693,  806,  740,  746,  729,  747,  806,  726,  748,
			  751,  728,  739,  739,  739,  739,  739,  698,  749,  698,
			  750,  758,  725,  725,  725,  725,  725,  112,  112,  806,
			  112,  740,  806,  729,  806,  526,  112,  112,  751,  112,
			  112,  112,  806,  112,  753,  753,  753,  753,  753,  758,

			  112,  112,  114,  112,  806,  700,  759,  112,  112,  756,
			  112,  114,  757,  112,  112,  114,  112,  756,  112,  112,
			  757,  112,  806,  806,  806,  114,  765,  741,  766,  773,
			  756,  742,  114,  757,  759,  806,  806,  806,  114,  779,
			  743,  112,  112,  114,  112,  756,  754,  806,  757,  760,
			  760,  760,  760,  760,  765,  741,  766,  773,  806,  742,
			  755,  700,  700,  700,  700,  700,  114,  779,  743,  112,
			  112,  763,  112,  806,  754,  764,  767,  806,  767,  763,
			  806,  112,  112,  764,  112,  806,  768,  792,  755,  806,
			  806,  761,  763,  806,  114,  806,  764,  112,  112,  806,

			  112,  806,  762,  806,  792,  806,  114,  763,  792,  112,
			  112,  764,  112,  806,  769,  806,  806,  806,  777,  761,
			  778,  806,  114,  770,  774,  774,  774,  774,  774,  777,
			  762,  778,  792,  806,  114,  112,  112,  782,  112,  777,
			  806,  778,  776,  780,  780,  780,  780,  780,  782,  806,
			  783,  770,  781,  781,  781,  781,  781,  777,  782,  778,
			  114,  783,  784,  784,  784,  784,  784,  785,  806,  785,
			  776,  783,  806,  793,  806,  806,  782,  786,  769,  769,
			  769,  769,  769,  790,  790,  790,  790,  790,  806,  783,
			  793,  796,  797,  806,  793,  794,  794,  794,  794,  794,

			  795,  795,  795,  795,  795,  787,  806,  806,  796,  797,
			  806,  806,  796,  797,  806,  806,  806,  806,  793,  798,
			  798,  798,  798,  798,  787,  787,  787,  787,  787,  802,
			  802,  802,  802,  802,  806,  806,  796,  797,  803,  803,
			  803,  803,  803,  804,  804,  804,  804,  804,  799,  806,
			  799,  806,  806,  803,  803,  803,  803,  803,  805,  805,
			  805,  805,  805,  801,  801,  801,  801,  801,  443,  443,
			  806,  806,  806,  806,  443,  443,  443,  443,  443,  443,
			  806,  806,  806,  806,  806,  806,  801,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,

			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   94,   94,  806,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,  806,   94,   94,   94,   94,   94,   96,   96,  806,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,  113,  113,  113,  806,  806,  806,  806,  806,
			  806,  113,  113,  806,  806,  113,  806,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  806,  806,  113,  113,  113,  143,  143,  806,  143,  143,
			  806,  143,  143,  806,  806,  806,  806,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  806,  806,  143,  143,  143,  144,  144,  806,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,

			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  195,  195,  806,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  197,  197,  806,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,

			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  806,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,

			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  211,  211,  211,  806,  806,  806,  211,  211,  806,  211,
			  211,  806,  806,  806,  806,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  806,  211,
			  211,  211,  211,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  224,  224,  806,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  227,  227,
			  806,  227,  227,  227,  227,  227,  227,  227,  227,  227,

			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  242,  242,
			  242,  242,  242,  242,  242,  242,  806,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  142,  142,  806,  142,  142,  806,  142,
			  142,  142,  806,  806,  806,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  806,  806,
			  142,  142,  142,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,

			  215,  215,  215,  215,  215,  215,  215,  215,  223,  223,
			  223,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  806,  806,  806,  806,
			  806,  223,  345,  345,  806,  345,  806,  806,  345,  345,
			  345,  345,  345,  345,  345,  345,  345,  345,  345,  345,
			  345,  345,  345,  345,  345,  345,  345,  345,  345,  345,
			  345,  806,  806,  345,  345,  345,  339,  339,  339,  339,
			  339,  339,  806,  339,  339,  339,  339,  339,  339,  339,

			  339,  339,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  339,  339,  339,  339,  806,  339,  339,  339,
			  339,  487,  487,  487,  806,  806,  806,  487,  487,  806,
			  487,  487,  806,  806,  806,  806,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  806,
			  806,  487,  487,  487,  402,  402,  402,  806,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  806,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,

			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  519,
			  519,  806,  806,  806,  806,  519,  519,  519,  519,  519,
			  519,  557,  557,  557,  806,  806,  806,  557,  557,  806,
			  557,  557,  806,  806,  806,  806,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  806,
			  557,  557,  557,  557,  589,  589,  806,  806,  806,  806,
			  589,  589,  589,  589,  589,  589,  604,  604,  604,  604,
			  604,  604,  604,  604,  806,  604,  604,  604,  604,  604,

			  604,  604,  604,  604,  604,  604,  604,  604,  604,  604,
			  604,  604,  604,  604,  604,  604,  604,  604,  604,  604,
			  604,  604,  604,  604,  604,  604,  604,  604,  604,  604,
			  604,  650,  650,  806,  806,  806,  806,  650,  650,  650,
			  650,  650,  650,   13,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806, yy_Dummy>>,
			1, 2027, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5026)
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
			   11,    3,    4,   12,   15,  783,   15,   15,   20,   20,

			   27,  782,   27,   27,   27,   27,   27,   29,  764,   29,
			   58,   29,   29,   29,   29,   29,   38,   38,   61,   38,
			   63,  763,    5,    6,  723,  214,  214,   30,  214,   30,
			  693,   30,   30,   30,   30,   30,    3,    4,   58,  216,
			  216,   38,  216,   20,   11,  691,   61,   12,   63,   29,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   30,
			    9,   39,   39,   59,   39,   64,    9,    9,    9,    9,
			    9,    9,   60,   73,   59,   66,   37,   37,   68,   37,
			   67,   62,   62,   66,   60,   67,   39,   62,  658,   69,

			   39,   59,  150,   64,  651,    9,    9,    9,    9,   77,
			   60,   37,   59,   66,  650,   88,   68,  195,   67,   62,
			   62,   66,   60,   67,   37,   62,   37,   69,   39,  337,
			  150,   73,    9,    9,    9,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   37,   10,   37,   40,   40,   77,   40,   10,
			   10,   10,   10,   10,   10,  195,   78,   41,   41,   88,
			   41,   65,  146,   42,   42,  146,   42,  337,   44,   44,
			   40,   44,  146,   74,   65,   74,   74,  624,   10,   10,
			   10,   10,   41,   40,   43,   43,   41,   43,   42,   65,

			   52,   52,   78,   44,   40,   52,   52,   44,   41,   42,
			  151,  623,   65,   80,  208,   10,   10,   10,  199,   43,
			  154,   40,   45,   45,   41,   45,   46,   46,  600,   46,
			   78,  155,   40,   43,   43,   44,   41,   42,  151,   43,
			   48,   48,   91,   48,   91,   91,   52,   45,  154,   80,
			  208,   46,  550,   50,   50,  690,   50,   46,  489,  155,
			  156,   43,   43,   45,  157,   48,  199,   43,   49,   49,
			   46,   49,   83,   83,  217,   83,   48,   80,   50,  158,
			   51,   51,  160,   51,   48,   46,   84,   84,  156,   84,
			  199,   45,  157,   49,   50,  159,  488,  162,   46,   47,

			   47,  159,   47,  690,   48,   51,  163,  158,   49,  161,
			  160,  164,   48,   49,  165,  161,  168,   47,   47,   47,
			   47,   47,   50,  159,   47,  162,   83,  467,  217,  159,
			   51,   47,   86,   86,  163,   86,   49,  161,   47,  164,
			   84,   49,  165,  161,  168,   47,   86,   47,  171,   47,
			   85,   85,  174,   85,  112,  112,   86,  112,   51,   47,
			  113,  113,  456,  113,   85,   85,   47,  104,  104,  104,
			  104,  104,  738,  738,   85,   47,  171,   47,   56,  112,
			  174,   56,  659,  659,  659,  113,   86,  449,   56,  730,
			  105,  105,  105,  105,  105,  439,   56,   56,   56,   56,

			   56,   56,  175,  176,   85,  105,  438,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			  175,  176,  730,  105,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   57,  346,  345,
			   57,  107,  107,  107,  107,  107,  339,   57,  143,  143,
			  198,  331,  198,  198,  328,   57,   57,   57,   57,   57,
			   57,  143,  177,  178,  557,  557,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,  305,
			  177,  178,  143,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   76,   76,  557,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,

			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   89,
			   89,  303,   89,   99,  287,  284,  153,   99,  153,  153,
			  153,  153,  153,  235,  460,  234,   99,   99,   99,   99,
			   99,  233,  232,  231,  169,  179,   89,  169,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   99,  169,  179,  460,  169,  222,  222,  229,  222,
			   99,  236,  228,  236,  236,  227,   99,  226,  221,  106,
			   99,  106,   99,  106,  106,  106,  106,  106,  106,  206,

			   89,   97,   97,  222,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			  102,  102,  102,  102,  102,   97,   97,   97,   97,   97,
			   97,  106,  108,  180,  108,  102,  108,  108,  108,  108,
			  108,  115,  115,  202,  115,  116,  116,  197,  116,  173,
			  117,  117,  181,  117,   97,   97,   97,   97,  102,  118,
			  118,  180,  118,  102,  119,  119,  115,  119,  120,  120,
			  116,  120,  182,  170,  108,  117,  167,  116,  166,  115,
			  181,   97,   97,   97,  118,  149,  147,  121,  121,  119,
			  121,  144,  142,  120,  117,  119,  122,  122,  183,  122,

			  182,  119,  184,  101,  118,  116,  120,  115,  123,  123,
			  100,  123,  121,  124,  124,   96,  124,  125,  125,  122,
			  125,  122,  117,  119,  126,  126,  183,  126,   94,  119,
			  184,  121,  118,  123,  120,  185,  127,  127,  124,  127,
			  128,  128,  125,  128,  124,   92,  187,  124,   81,  126,
			  123,  129,  129,  186,  129,  131,  131,  186,  131,  121,
			  649,  127,   70,  185,   55,  128,  172,   36,  189,  172,
			  126,  128,  124,  125,  187,  124,  129,   35,  123,  649,
			  131,  186,  127,  129,   33,  186,  188,  190,  132,  132,
			  188,  132,  134,  134,  172,  134,  189,  172,  126,  128,

			   28,  131,   26,  135,  135,  135,  135,  135,  649,  191,
			  127,  129,  130,  132,  188,  190,  130,  134,  188,  130,
			  132,  192,  193,  288,  134,  130,  130,   18,  130,   17,
			  130,  135,   16,  292,  132,  135,  132,  191,  134,   13,
			  130,  203,  136,  136,  130,  136,  294,  130,  132,  192,
			  193,  288,  134,  130,  138,  138,  130,  138,  130,    0,
			  205,  292,    0,  135,  132,  133,  133,  136,  133,  137,
			  137,  295,  137,    0,  294,  136,    0,  203,  136,  138,
			    0,    0,    0,  133,  133,  133,  133,  133,    0,    0,
			  133,  138,    0,  296,  137,  138,  205,  139,  139,  295,

			  139,  133,    0,  136,  133,  203,  136,  297,  140,  140,
			  133,  140,  141,  141,    0,  141,  137,  209,  209,  138,
			  209,  296,  139,  138,  205,  210,  210,  200,  210,  133,
			  139,  298,  133,  140,    0,  297,    0,  141,  133,  200,
			  200,  200,  200,  200,  137,  200,  211,  211,  299,  211,
			  213,  213,  140,  213,  246,  246,  246,  246,  139,  298,
			  211,    0,  141,    0,  213,  240,  240,  240,  240,  240,
			  211,  209,    0,  230,  213,  300,  299,  200,    0,  210,
			  140,  230,  230,  230,  230,  230,  230,  239,    0,  239,
			  141,  148,  239,  239,  239,  239,  239,    0,  342,  342,

			  211,  342,    0,  300,  213,  241,  241,  241,  241,  241,
			  244,    0,  244,    0,    0,  244,  244,  244,  244,  244,
			  247,  247,  247,  247,  247,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,    0,    0,  215,  238,  238,  238,  238,
			  238,  215,  215,  215,  215,  215,  215,  301,    0,  302,
			    0,  238,  243,  243,  243,  243,  243,  271,  271,  271,
			  271,  271,  249,  249,    0,  249,    0,  243,  304,    0,

			  215,  215,  215,  215,  238,  301,  245,  302,  245,  238,
			  245,  245,  245,  245,  245,  248,  248,  249,  248,  307,
			  243,  259,  259,  308,  259,  243,  304,  215,  215,  215,
			  218,  218,  290,  218,  290,  290,  290,  290,  290,  291,
			  248,  291,  291,  291,  291,  291,  259,  307,  245,  401,
			  401,  308,  401,    0,    0,    0,  248,  218,  259,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  250,  250,  248,  250,  259,  251,  251,  309,
			  251,  252,  252,    0,  252,  310,  253,  253,  256,  253,

			  254,  254,    0,  254,  311,  255,  255,  250,  255,  256,
			  312,  218,  251,    0,  250,    0,  252,  309,    0,  256,
			  251,  253,    0,  310,    0,  254,    0,  313,    0,  252,
			  255,  314,  311,  257,  257,    0,  257,  256,  312,  315,
			    0,  253,  250,  258,  258,  254,  258,  318,  251,  260,
			  260,    0,  260,  261,  261,  313,  261,  252,  257,  314,
			  319,  255,  262,  262,    0,  262,    0,  315,  258,  253,
			  320,  257,  321,  254,  260,  318,  263,  263,  261,  263,
			  322,  258,  264,  264,  261,  264,  260,  262,  319,  323,
			  324,  268,  268,  325,  268,    0,  326,  327,  320,  257,

			  321,  263,  275,  275,    0,  275,    0,  264,  322,  258,
			  265,  265,  261,  265,  260,  264,  268,  323,  324,  266,
			  266,  325,  266,  263,  326,  327,    0,  275,  265,  265,
			  265,  265,  265,  274,  274,  265,  274,  266,  266,  266,
			  266,  266,    0,  264,  266,  267,  267,    0,  267,  329,
			    0,  263,    0,    0,  269,  269,  265,  269,  274,  442,
			  442,    0,  442,  267,  267,  267,  267,  267,  270,  270,
			  267,  270,  269,  269,  269,  269,  269,  329,  274,  269,
			  273,  273,  273,  273,  273,    0,  270,  270,  270,  270,
			  270,  267,  272,  270,    0,  272,  276,  276,  273,  276,

			  269,  272,  277,  277,    0,  277,  274,  278,  278,    0,
			  278,  330,  279,  279,  270,  279,  280,  280,    0,  280,
			  272,  276,  306,  272,  334,  277,  273,  277,  335,  272,
			    0,    0,  278,  306,    0,    0,  276,  279,  403,  330,
			  278,  280,  281,  281,  306,  281,  282,  282,    0,  282,
			  283,  283,  334,  283,  306,  279,  335,  404,  341,  341,
			  280,  341,  340,  340,  276,  340,  403,  281,  278,  405,
			    0,  282,  306,  406,  408,  283,  340,  343,  343,    0,
			  343,  351,    0,  279,    0,  404,  340,  409,  280,  351,
			  351,  351,  351,  351,  351,    0,    0,  405,  281,  411,

			  283,  406,  408,    0,  343,  358,  358,  358,  358,  358,
			  372,  372,  341,  372,    0,  409,  340,  485,  485,    0,
			  485,  357,  357,  357,  357,  357,    0,  411,  283,  336,
			  359,  359,  359,  359,  359,  372,  357,  360,  360,  360,
			  360,  360,  336,  336,  336,  336,  336,  361,  361,  361,
			  361,  361,    0,  336,  336,  336,  336,  336,  336,  357,
			    0,  412,    0,    0,  357,    0,  370,  370,  359,  370,
			    0,    0,  362,  362,  362,  362,  362,  336,    0,    0,
			  336,  336,  336,  336,  336,  336,  336,  362,  363,  412,
			  363,  370,    0,  363,  363,  363,  363,  363,  364,  364,

			  364,  364,  364,  365,  365,  365,  365,  365,    0,    0,
			  362,  413,    0,    0,  370,  362,  366,  366,  366,  366,
			  366,  367,  367,    0,  367,  367,  367,  367,  367,  368,
			  368,  368,  368,  368,  369,  369,  369,  369,  369,  413,
			  371,  371,  370,  371,  373,  373,    0,  373,  374,  374,
			    0,  374,    0,  377,  366,  375,  375,    0,  375,  414,
			  376,  376,  415,  376,  377,  371,    0,  486,  486,  373,
			  486,  416,  395,  374,  377,  378,  378,  371,  378,    0,
			  375,  379,  379,  395,  379,  376,  417,  414,  375,  376,
			  415,  373,  377,  395,  374,  380,  380,    0,  380,  416,

			  378,  381,  381,    0,  381,  371,  379,  382,  382,  418,
			  382,  395,  378,    0,  417,    0,  375,  376,  419,  373,
			  380,  486,  374,    0,  383,  383,  381,  383,  379,    0,
			  384,  384,  382,  384,  420,  380,  386,  418,  421,  386,
			  378,  381,  422,  382,    0,  386,  419,  393,  393,  383,
			  393,  394,  394,    0,  394,  384,  379,  385,  385,  385,
			  385,  385,  420,  380,  386,    0,  421,  386,  383,  381,
			  422,  382,  393,  386,  384,  385,  394,  423,  385,  387,
			  387,  387,  387,  387,  385,  388,  388,  388,  388,  388,
			  390,  390,  390,  390,  390,  424,  383,  387,  425,  388,

			    0,    0,  384,  385,    0,  423,  385,    0,  426,    0,
			  389,  389,  385,  389,    0,  388,  447,  447,  447,  447,
			  447,  427,  390,  424,    0,  387,  425,  388,  389,  389,
			  389,  389,  389,    0,  428,  389,  426,  391,  391,  391,
			  391,  391,  389,  388,  392,  392,  392,  392,  392,  427,
			  390,  391,  396,  396,  433,  396,  397,  397,  392,  397,
			  398,  398,  428,  398,  399,  399,  434,  399,  436,    0,
			  389,  437,  400,  400,  490,  400,    0,  396,  491,  391,
			  435,  397,  433,    0,  479,  398,  392,  400,    0,  399,
			    0,  435,  398,  399,  434,  479,  436,  400,    0,  437,

			    0,    0,  490,  397,  399,  479,  491,    0,  435,  445,
			  445,  445,  445,  445,  448,  448,  448,  448,  448,  435,
			  398,  399,  492,  479,  445,  446,  446,  446,  446,  446,
			    0,  397,  399,  440,  440,  440,  440,  440,  451,  451,
			  451,  451,  451,    0,  440,  440,  440,  440,  440,  440,
			  492,    0,  445,  450,  450,  450,  450,  450,  453,  453,
			  453,  453,  453,  446,    0,  494,  497,  499,  450,    0,
			    0,  440,  440,  440,  440,  440,  440,  440,  452,  452,
			  452,  452,  452,  454,  454,  454,  454,  454,    0,  462,
			  462,  450,  462,  494,  497,  499,  450,  455,  455,  455,

			  455,  455,  457,  457,  457,  457,  457,  458,    0,  458,
			  458,  458,  458,  458,  462,  484,  452,  457,  459,    0,
			  459,  454,  461,  461,    0,  461,  484,    0,  459,  462,
			  463,  463,  500,  463,  464,  464,  484,  464,  465,  465,
			    0,  465,    0,  466,  466,  457,  466,  461,    0,  468,
			  468,    0,  468,    0,  484,  463,  459,  462,    0,  464,
			  500,    0,  463,  465,  493,  501,    0,  464,  466,  469,
			  469,  503,  469,    0,  468,    0,  493,    0,  461,  464,
			    0,  466,  468,  470,  470,    0,  470,    0,  471,  471,
			  463,  471,  493,  501,  469,  464,  504,  472,  472,  503,

			  472,  469,  473,  473,  493,  473,    0,  464,  470,  466,
			  468,  474,  474,  471,  474,  476,  476,    0,  476,  505,
			  470,    0,  472,    0,  504,    0,    0,  473,  506,  469,
			  472,  475,  475,  475,  475,  475,  474,  661,  661,  661,
			  476,    0,    0,  507,  474,  475,  473,  505,  470,  477,
			  477,  477,  477,  477,  480,  480,  506,  480,  472,  481,
			  481,  476,  481,  477,  478,  478,  478,  478,  478,  495,
			  477,  507,  474,  475,  473,  661,  477,  482,  482,  480,
			  482,  495,  508,  509,  481,  478,  510,  480,  511,  512,
			    0,  477,  481,  483,  483,  513,  483,  495,  477,  514,

			  487,  487,  482,  487,  477,  515,    0,  516,  517,  495,
			  508,  509,  560,  478,  510,  480,  511,  512,  483,    0,
			  481,  482,  561,  513,  523,  562,    0,  514,  522,  522,
			  522,  522,  522,  515,  483,  516,  517,  520,    0,  520,
			  560,    0,  520,  520,  520,  520,  520,  523,    0,  482,
			  561,    0,  523,  562,  487,  521,  521,  521,  521,  521,
			    0,    0,  483,  518,  518,  518,  518,  518,  524,  524,
			  524,  524,  524,    0,  518,  518,  518,  518,  518,  518,
			  563,  564,  566,  524,  525,  525,  525,  525,  525,  533,
			  533,  533,  533,  521,  526,  526,  526,  526,  526,    0,

			    0,  518,  518,  518,  518,  518,  518,  518,  563,  564,
			  566,  524,  527,  527,  527,  527,  527,  528,  528,  528,
			  528,  528,  525,  529,  529,  529,  529,  529,  530,  530,
			  530,  530,  530,  531,  567,  531,    0,    0,  531,  531,
			  531,  531,  531,  532,  532,  532,  532,  532,  535,  535,
			  535,  535,  535,  536,  536,  528,  536,  569,  537,  537,
			  542,  537,  567,  535,  538,  538,  570,  538,  539,  539,
			    0,  539,    0,  540,  540,    0,  540,  542,  536,  571,
			    0,  542,  536,  537,    0,  569,    0,  537,    0,  538,
			    0,  535,    0,  539,  570,  572,    0,  538,  540,  541,

			  541,  555,  541,  543,  543,  542,  543,  571,  539,    0,
			  536,  573,  555,  544,  544,  537,  544,  545,  545,    0,
			  545,  574,  555,  572,  541,  538,  546,  546,  543,  546,
			    0,  547,  547,    0,  547,    0,  539,  541,  544,  573,
			  555,    0,  545,    0,  551,  551,  544,  551,  543,  574,
			    0,  546,  548,  548,  575,  548,  547,    0,  549,  549,
			  549,  549,  549,  545,  547,  541,    0,  556,    0,  551,
			  576,  546,  552,  552,  544,  552,  543,  548,  556,  549,
			  553,  553,  575,  553,  548,  549,  577,  578,  556,  579,
			    0,  545,  547,  554,  554,  580,  554,  552,  576,  546,

			  581,  583,  584,  585,  587,  553,  556,  549,    0,    0,
			  625,  553,  548,  549,  577,  578,  552,  579,  554,    0,
			    0,    0,  626,  580,  627,  554,    0,    0,  581,  583,
			  584,  585,  587,  590,  590,  590,  590,  590,  625,  553,
			  768,  768,  768,  768,  552,  591,  591,  591,  591,  591,
			  626,    0,  627,  554,  588,  588,  588,  588,  588,  592,
			  592,  592,  592,  592,    0,  588,  588,  588,  588,  588,
			  588,  593,    0,  593,    0,    0,  593,  593,  593,  593,
			  593,  594,    0,  594,    0,    0,  594,  594,  594,  594,
			  594,  597,  588,  588,  588,  588,  588,  588,  588,  595,

			  595,  595,  595,  595,  596,  596,  596,  596,  596,  598,
			  598,  598,  598,  598,  597,  786,  786,  786,  786,  597,
			  599,  599,  599,  599,  599,  601,  601,  601,  601,  601,
			  602,  602,  602,  602,  602,    0,    0,  595,  603,  603,
			  603,  603,  603,  605,  605,  605,  605,  605,  606,    0,
			  606,    0,  612,  606,  606,  606,  606,  606,  605,  607,
			  607,  629,  607,  608,  608,    0,  608,  609,  609,  612,
			  609,  610,  610,  612,  610,  611,  611,  619,  611,  613,
			  613,  605,  613,    0,  607,  631,  605,    0,  608,  629,
			  614,  614,  609,  614,  619,    0,  610,  612,  619,  635,

			  611,  608,  610,  607,  613,  638,    0,  615,  615,    0,
			  615,  616,  616,  631,  616,  614,  617,  617,  641,  617,
			  618,  618,  619,  618,  643,  620,  620,  635,  620,  608,
			  610,  607,  615,  638,  621,  621,  616,  621,  645,  622,
			  622,  617,  622,  646,    0,  618,  641,  647,  648,    0,
			  620,    0,  643,    0,  677,  678,  617,  615,  620,  621,
			    0,  795,  795,  795,  622,    0,  645,    0,    0,  679,
			  621,  646,  622,    0,    0,  647,  648,  652,  652,  652,
			  652,  652,  677,  678,  617,  615,  620,  653,  653,  653,
			  653,  653,  654,  654,  654,  654,  654,  679,  621,  795, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  622,  655,  655,  655,  655,  655,  656,  656,  656,  656,
			  656,  657,    0,  657,    0,    0,  657,  657,  657,  657,
			  657,  680,    0,    0,    0,  653,  660,  660,  660,  660,
			  660,  662,  662,  662,  662,  662,  663,  663,  663,  663,
			  663,  664,  664,  664,  664,  664,  662,  665,  665,  680,
			  665,  666,  666,    0,  666,    0,  667,  667,    0,  667,
			  669,  669,    0,  669,    0,  670,  670,    0,  670,  662,
			  671,  675,  665,    0,  662,  675,  666,  681,  665,  664,
			    0,  667,  684,  674,  674,  669,  674,  671,  666,  667,
			  670,  671,  675,    0,  672,  672,  670,  672,  673,  673,

			  676,  673,  685,  675,  676,  681,  665,  686,  674,  687,
			  684,  689,    0,    0,    0,  671,  666,  667,    0,  672,
			    0,  676,    0,  673,  670,    0,  672,  711,  712,  713,
			  685,  673,  676,  704,  704,  686,  704,  687,    0,  689,
			  692,  692,  692,  692,  692,  694,  694,  694,  694,  694,
			  703,  703,    0,  703,  672,  711,  712,  713,  704,  673,
			  695,  695,  695,  695,  695,  696,  696,  696,  696,  696,
			  697,  697,  697,  697,  697,  703,    0,    0,  692,  698,
			  698,  698,  698,  698,  699,  699,  699,  699,  699,  701,
			  701,  701,  701,  701,  702,  702,  703,  702,  695,    0,

			  705,  705,    0,  705,  707,  707,    0,  707,  716,  708,
			  708,  709,  708,  717,  710,  709,  719,    0,  710,  702,
			  726,  726,    0,  726,  703,  705,  732,  701,  733,  707,
			  702,  734,  709,  705,  708,  710,  716,    0,    0,    0,
			  735,  717,  736,  709,  719,  726,  710,  722,  722,  722,
			  722,  722,    0,  726,  732,  708,  733,    0,  702,  734,
			  737,  705,  724,  724,  724,  724,  724,  725,  735,  725,
			  736,  746,  725,  725,  725,  725,  725,  727,  727,    0,
			  727,  726,    0,  708,    0,  722,  728,  728,  737,  728,
			  729,  729,    0,  729,  739,  739,  739,  739,  739,  746,

			  740,  740,  727,  740,    0,  725,  751,  741,  741,  744,
			  741,  728,  745,  742,  742,  729,  742,  744,  743,  743,
			  745,  743,    0,    0,    0,  740,  758,  727,  759,  765,
			  744,  728,  741,  745,  751,    0,    0,    0,  742,  773,
			  729,  754,  754,  743,  754,  744,  740,    0,  745,  752,
			  752,  752,  752,  752,  758,  727,  759,  765,    0,  728,
			  743,  753,  753,  753,  753,  753,  754,  773,  729,  755,
			  755,  756,  755,    0,  740,  757,  760,    0,  760,  756,
			    0,  761,  761,  757,  761,    0,  760,  788,  743,    0,
			    0,  754,  756,    0,  755,    0,  757,  762,  762,    0,

			  762,    0,  755,    0,  788,    0,  761,  756,  788,  770,
			  770,  757,  770,    0,  760,    0,    0,    0,  771,  754,
			  772,    0,  762,  761,  767,  767,  767,  767,  767,  771,
			  755,  772,  788,    0,  770,  776,  776,  777,  776,  771,
			    0,  772,  770,  774,  774,  774,  774,  774,  777,    0,
			  778,  761,  775,  775,  775,  775,  775,  771,  777,  772,
			  776,  778,  780,  780,  780,  780,  780,  781,    0,  781,
			  770,  778,    0,  789,    0,    0,  777,  781,  784,  784,
			  784,  784,  784,  785,  785,  785,  785,  785,    0,  778,
			  789,  792,  793,    0,  789,  790,  790,  790,  790,  790,

			  791,  791,  791,  791,  791,  781,    0,    0,  792,  793,
			    0,    0,  792,  793,    0,    0,    0,    0,  789,  794,
			  794,  794,  794,  794,  798,  798,  798,  798,  798,  799,
			  799,  799,  799,  799,    0,    0,  792,  793,  800,  800,
			  800,  800,  800,  802,  802,  802,  802,  802,  803,    0,
			  803,    0,    0,  803,  803,  803,  803,  803,  804,  804,
			  804,  804,  804,  805,  805,  805,  805,  805,  833,  833,
			    0,    0,    0,    0,  833,  833,  833,  833,  833,  833,
			    0,    0,    0,    0,    0,    0,  803,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,

			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,

			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  812,  812,    0,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,    0,  812,  812,  812,  812,  812,  813,  813,    0,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,

			  813,  813,  814,  814,  814,    0,    0,    0,    0,    0,
			    0,  814,  814,    0,    0,  814,    0,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			    0,    0,  814,  814,  814,  815,  815,    0,  815,  815,
			    0,  815,  815,    0,    0,    0,    0,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			    0,    0,  815,  815,  815,  816,  816,    0,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,

			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  817,  817,    0,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  818,  818,    0,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,

			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,    0,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,

			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  821,  821,  821,    0,    0,    0,  821,  821,    0,  821,
			  821,    0,    0,    0,    0,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,    0,  821,
			  821,  821,  821,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  823,  823,

			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  824,  824,    0,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  825,  825,
			    0,  825,  825,  825,  825,  825,  825,  825,  825,  825,

			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  827,  827,
			  827,  827,  827,  827,  827,  827,    0,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,

			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  828,  828,    0,  828,  828,    0,  828,
			  828,  828,    0,    0,    0,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,    0,    0,
			  828,  828,  828,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,

			  829,  829,  829,  829,  829,  829,  829,  829,  830,  830,
			  830,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,    0,    0,    0,    0,
			    0,  830,  831,  831,    0,  831,    0,    0,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,    0,    0,  831,  831,  831,  832,  832,  832,  832,
			  832,  832,    0,  832,  832,  832,  832,  832,  832,  832,

			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,    0,  832,  832,  832,
			  832,  834,  834,  834,    0,    0,    0,  834,  834,    0,
			  834,  834,    0,    0,    0,    0,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,    0,
			    0,  834,  834,  834,  835,  835,  835,    0,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,    0,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,

			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  836,
			  836,    0,    0,    0,    0,  836,  836,  836,  836,  836,
			  836,  837,  837,  837,    0,    0,    0,  837,  837,    0,
			  837,  837,    0,    0,    0,    0,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,    0,
			  837,  837,  837,  837,  838,  838,    0,    0,    0,    0,
			  838,  838,  838,  838,  838,  838,  839,  839,  839,  839,
			  839,  839,  839,  839,    0,  839,  839,  839,  839,  839,

			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  840,  840,    0,    0,    0,    0,  840,  840,  840,
			  840,  840,  840,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806, yy_Dummy>>,
			1, 2027, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64, 1039, 4943,   92, 1029, 1001, 1020, 4943,
			   88, 4943, 4943, 4943, 4943, 4943,  985,   82,  981,   91,
			  111, 4943, 4943,  956, 4943,  949,  937,  184,  114,  169,
			  253,  265,  271,  292,  276,  320,  324,  397,  338,  366,
			  351,  378,  288, 4943, 4943,  907,  476,  555,   79,  133,
			  151,   80,  150,   89,  132,  238,  147,  148,  145,  147,
			  943, 4943, 4943,  176,  281, 4943,  635,  202,  247, 4943,
			  294,  893, 4943,  370,  384,  448,  430, 4943,  186,  717,
			 4943,  340,  942, 4943,  921, 4943,  904,  800,    0,  716,

			  907,  885,  800, 4943,  447,  470,  773,  541,  816, 4943,
			 4943, 4943,  452,  458, 4943,  839,  843,  848,  857,  862,
			  866,  885,  894,  906,  911,  915,  922,  934,  938,  949,
			  978,  953,  986, 1063,  990,  983, 1040, 1067, 1052, 1095,
			 1106, 1110,  867,  556,  834, 4943,  270,  873, 1166,  866,
			  162,  276,    0,  708,  280,  297,  314,  318,  332,  362,
			  335,  376,  357,  360,  371,  368,  853,  851,  372,  711,
			  815,  404,  933,  791,  404,  454,  455,  534,  550,  711,
			  800,  818,  837,  849,  867,  886,  914,  911,  947,  933,
			  941,  963,  969,  970, 4943,  210, 4943,  840,  568,  311,

			 1119, 4943,  836, 1022, 4943, 1041,  744, 4943,  295, 1115,
			 1123, 1144, 4943, 1148,  123, 1246,  137,  345, 1328, 4943,
			 4943,  759,  774, 4943, 4943, 4943,  708,  759,  771,  767,
			 1162,  732,  731,  730,  724,  722,  779, 4943, 1246, 1172,
			 1145, 1185, 4943, 1262, 1195, 1290, 1134, 1200, 1313, 1290,
			 1380, 1385, 1389, 1394, 1398, 1403, 1368, 1431, 1441, 1319,
			 1447, 1451, 1460, 1474, 1480, 1508, 1517, 1543, 1489, 1552,
			 1566, 1267, 1554, 1560, 1531, 1500, 1594, 1600, 1605, 1610,
			 1614, 1640, 1644, 1648,  700, 4943, 4943,  705,  980,    0,
			 1314, 1321,  990,    0, 1012, 1037, 1058, 1067, 1084, 1113,

			 1135, 1230, 1232,  663, 1251,  551, 1603, 1279, 1283, 1350,
			 1356, 1364, 1370, 1388, 1398, 1406,    0,    0, 1398, 1425,
			 1421, 1437, 1438, 1454, 1448, 1458, 1451, 1451,  516, 1504,
			 1565,  513,    0,    0, 1572, 1576, 1722,  222, 4943,  563,
			 1660, 1656, 1196, 1675,    0,  533,  547, 4943, 4943, 4943,
			 4943, 1670, 4943, 4943, 4943, 4943, 4943, 1701, 1685, 1710,
			 1717, 1727, 1752, 1773, 1778, 1783, 1796, 1804, 1809, 1814,
			 1764, 1838, 1708, 1842, 1846, 1853, 1858, 1823, 1873, 1879,
			 1893, 1899, 1905, 1922, 1928, 1937, 1898, 1959, 1965, 2008,
			 1970, 2017, 2024, 1945, 1949, 1842, 2050, 2054, 2058, 2062,

			 2070, 1347,    0, 1588, 1607, 1630, 1634,    0, 1625, 1639,
			    0, 1650, 1713, 1776, 1828, 1827, 1832, 1837, 1867, 1876,
			 1895, 1889, 1900, 1939, 1957, 1952, 1962, 1975, 1988,    0,
			    0,    0,    0, 2005, 2032, 2049, 2019, 2037,  489,  478,
			 2113, 4943, 1557,    0, 4943, 2089, 2105, 1996, 2094,  471,
			 2133, 2118, 2158, 2138, 2163, 2177,  442, 2182, 2189, 2203,
			  716, 2220, 2187, 2228, 2232, 2236, 2241,  402, 2247, 2267,
			 2281, 2286, 2295, 2300, 2309, 2311, 2313, 2329, 2344, 2054,
			 2352, 2357, 2375, 2391, 2185, 1715, 1865, 2398,  338,  300,
			 2032, 2036, 2088, 2229, 2131, 2334,    0, 2126,    0, 2132,

			 2198, 2226,    0, 2236, 2262, 2280, 2293, 2308, 2336, 2348,
			 2340, 2353, 2354, 2360, 2353, 2362, 2372, 2373, 2443,    0,
			 2422, 2435, 2408, 2389, 2448, 2464, 2474, 2492, 2497, 2503,
			 2508, 2518, 2523, 2469, 4943, 2528, 2551, 2556, 2562, 2566,
			 2571, 2597, 2530, 2601, 2611, 2615, 2624, 2629, 2650, 2638,
			  327, 2642, 2670, 2678, 2691, 2571, 2637,  582, 4943, 4943,
			 2381, 2391, 2394, 2445, 2439,    0, 2447, 2492,    0, 2517,
			 2519, 2544, 2547, 2564, 2586, 2606, 2623, 2639, 2652, 2655,
			 2660, 2666,    0, 2655, 2669, 2669,    0, 2658, 2734,    0,
			 2713, 2725, 2739, 2756, 2766, 2779, 2784, 2756, 2789, 2800,

			  311, 2805, 2810, 2818, 4943, 2823, 2833, 2857, 2861, 2865,
			 2869, 2873, 2822, 2877, 2888, 2905, 2909, 2914, 2918, 2847,
			 2923, 2932, 2937,  294,  270, 2664, 2682, 2684,    0, 2828,
			    0, 2852,    0,    0,    0, 2847,    0,    0, 2853,    0,
			    0, 2876,    0, 2882,    0, 2903, 2905, 2912, 2913,  953,
			  188,  146, 2957, 2967, 2972, 2981, 2986, 2996,  140,  462,
			 3006, 2322, 3011, 3016, 3021, 3045, 3049, 3054, 4943, 3058,
			 3063, 3040, 3092, 3096, 3081, 3041, 3070, 2921, 2916, 2930,
			 2986, 3042,    0,    0, 3049, 3069, 3073, 3074,    0, 3077,
			  348,  134, 3120,   72, 3125, 3140, 3145, 3150, 3159, 3164,

			 4943, 3169, 3192, 3148, 3131, 3198, 4943, 3202, 3207, 3181,
			 3184, 3089, 3080, 3081,    0,    0, 3173, 3178,    0, 3168,
			    0, 4943, 3227,   76, 3242, 3252, 3218, 3275, 3284, 3288,
			  484, 4943, 3191, 3176, 3179, 3193, 3195, 3208,  452, 3274,
			 3298, 3305, 3311, 3316, 3279, 3282, 3223,    0,    0,    0,
			    0, 3262, 3329, 3341, 3339, 3367, 3341, 3345, 3274, 3293,
			 3361, 3379, 3395,   96,   83, 3285,    0, 3404, 2720, 4943,
			 3407, 3388, 3390, 3304, 3423, 3432, 3433, 3407, 3420,    0,
			 3442, 3452,   76,   70, 3458, 3463, 2795, 4943, 3357, 3443,
			 3475, 3480, 3461, 3462, 3499, 2946, 4943, 4943, 3504, 3509,

			 3518, 4943, 3523, 3533, 3538, 3543, 4943, 3586, 3631, 3676,
			 3721, 3766, 3811, 3856, 3900, 3940, 3984, 4029, 4074, 4119,
			 4164, 4208, 4252, 4297, 4342, 4387, 4432, 4477, 4518, 4562,
			 4606, 4641, 4685, 3557, 4729, 4773, 4808, 4829, 4863, 4885,
			 4920, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  806,    1,  807,  807,  808,  808,  809,  809,  810,
			  810,  811,  811,  806,  806,  806,  806,  806,  812,  806,
			  813,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  815,  806,  806,  816,  806,  806,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  806,  806,  806,  817,  806,  806,  806,  818,  819,  806,
			  819,  820,  806,  821,  806,  821,  821,  806,  822,  823,
			  806,  806,  806,  806,  812,  806,  824,  825,  824,  824,

			  826,  806,  806,  806,  806,  827,  806,  806,  806,  806,
			  806,  806,  806,  814,  806,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			   47,  814,  814,  814,  814,   47,  814,  814,  814,  814,
			  814,  814,  828,  815,  816,  806,  806,  806,   57,  806,
			  148,  148,   57,   57,   57,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,   57,  148,  148,
			  148,   57,   57,   57,  148,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,  148,   57,   57,
			  148,   57,  148,   57,  806,  817,  806,  818,  806,  817,

			   76,  806,  818,  819,  806,  819,  820,  806,  820,  821,
			  806,  821,  806,  806,  806,  829,  806,  822,  823,  806,
			  806,  218,  830,  806,  806,  806,  806,  831,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  814,  814,
			  814,  814,  814,  814,  814,  814,  806,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  133,  133,  133,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  806,  806,  806,  806,  148,  148,
			  806,  148,   57,   57,  148,   57,  148,  148,  148,   57,

			   57,   57,  148,  148,   57,   57,  806,  148,  148,  148,
			  148,   57,   57,   57,  148,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,  148,  148,   57,
			   57,   57,  148,   57,  148,   57,  817,  817,  806,  832,
			  832,  806,  832,  830,  833,  831,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  814,  814,  814,  814,  814,  814,  814,  806,  814,  814,
			  814,  814,  814,  814,  814,  133,  133,  385,  385,  814,
			  130,  389,  389,  814,  814,  806,  814,  814,  814,  814,

			  814,  834,  835,  148,   57,  148,   57,  148,  148,  148,
			   57,   57,   57,  148,  148,   57,  148,  148,  148,  148,
			   57,   57,   57,  148,   57,  148,  148,   57,   57,  148,
			  148,   57,   57,  148,  148,  148,   57,   57,  148,   57,
			  336,  806,  806,  836,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  827,  806,  806,
			  806,  814,  814,  814,  814,  814,  814,  806,  814,  814,
			  814,  814,  814,  814,  814,  389,  814,  389,  477,  806,
			  814,  814,  814,  814,  806,  806,  837,  834,  148,   57,
			  148,   57,  148,  148,   57,   57,  148,  148,   57,  148,

			  148,  148,  148,   57,   57,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,  148,  148,   57,   57,  440,  838,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  839,  814,  814,  814,  814,
			  814,  814,  806,  814,  814,  814,  814,  814,  814,  477,
			  806,  814,  814,  814,  814,  806,  806,  837,  806,  806,
			  148,  148,   57,  148,  148,  148,   57,   57,   57,  148,
			  148,  148,  148,   57,   57,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,  148,  148,   57,   57,  518,  840,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  806,  806,  814,  814,  814,
			  814,  814,  806,  814,  814,  814,  814,  814,  814,  806,
			  814,  814,  814,  806,  806,  148,  148,   57,  148,  148,
			   57,   57,  148,  148,  148,  148,   57,   57,   57,  148,
			   57,  148,  148,   57,   57,  148,  148,  148,   57,  817,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  814,  814,  814,  806,  814,
			  814,  806,  814,  814,  814,  806,  806,  148,  148,   57,
			  148,   57,  148,   57,  148,   57,  148,  148,  148,   57,
			  817,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  814,  814,  814,  814,  806,  814,  814,  806,
			  806,  148,  148,   57,  148,   57,  148,   57,  148,  148,
			   57,  806,  806,  806,  806,  806,  814,  814,  814,  814,
			  806,  806,  148,  148,   57,  148,   57,  148,  806,  806,
			  814,  814,  814,  814,  806,  806,  148,  148,   57,  148,
			   57,  148,  806,  806,  814,  814,  806,  806,  148,  148,
			  806,  814,  814,  806,  806,  148,  148,  806,  806,  806,
			  814,  806,  806,  148,  806,  806,  814,  806,  806,  148,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  806,    0,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806, yy_Dummy>>)
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
			    0,    0,    0,  131,  129,    1,    2,   15,  107,   18,
			  129,   16,   17,    7,    6,   13,    5,   11,    8,   98,
			   98,   14,   12,   29,   10,   30,   20,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   78,   91,   91,
			   91,   91,   22,   31,   23,    9,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   24,   21,   25,  112,  113,  114,  112,  115,  130,   96,
			  130,  130,  130,  130,  130,  130,  130,   68,  130,  130,
			   90,    1,    2,   28,  107,  106,  127,  127,  127,  127,

			    3,   33,  102,   32,    0,    0,   98,    0,   98,   27,
			   26,   19,    0,   91,   87,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   40,
			   91,   86,   86,   77,   86,   86,   91,   91,   91,   91,
			   91,   91,    0,    0,    0,   97,    0,    0,   93,    0,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   40,
			   93,   40,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   94,  112,  114,    0,  113,  112,

			  112,  109,  108,    0,   96,    0,    0,   95,    0,    0,
			    0,    0,   68,    0,   66,    0,   65,    0,    0,   90,
			   88,   88,    0,   89,  127,  116,  127,  127,  127,  127,
			  127,  127,  127,  127,  127,  127,    4,   34,  102,    0,
			    0,    0,  100,  102,  100,   98,    0,    0,   91,   39,
			   91,   91,   91,   91,   91,   91,    0,   91,   91,   91,
			   91,   91,   42,   91,   91,   78,   79,   78,   79,   78,
			   78,   85,   91,   85,   85,   85,   91,   91,   91,   91,
			   91,   91,   41,   91,    0,   63,   92,    0,   93,   39,
			   69,   69,   93,   39,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,   93,    0,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   42,   42,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   41,   41,   93,   93,  112,  110,   95,    0,
			    0,   67,   65,    0,    0,    0,    0,  123,  121,  124,
			  128,  128,  122,  120,  117,  118,  119,  102,    0,  102,
			    0,    0,  102,    0,    0,    0,  101,   98,    0,    0,
			   91,   91,   38,   91,   91,   91,   91,    0,   91,   91,
			   91,   91,   91,   91,   91,   91,   77,   91,   91,   91,
			   91,   77,   77,   77,   37,    0,   44,   91,   91,   91,

			   91,   64,   60,   93,   93,   93,   93,   38,   93,   93,
			   38,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   37,
			   44,   37,   44,   93,   93,   93,   93,   93,   93,   93,
			  112,   67,   65,    0,  125,  102,  102,    0,    0,   99,
			  102,    0,  101,    0,  101,    0,    0,    0,   98,   74,
			    0,   91,   91,   91,   91,   45,   91,    0,   91,   91,
			   91,   36,   91,   91,   91,   79,   78,   91,   91,    0,
			   91,   91,   91,   91,    0,   64,   64,    0,   93,   93,
			   93,   93,   93,   93,   93,   93,   45,   93,   45,   93,

			   93,   93,   36,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,  112,    0,
			    0,  102,    0,  105,  102,  101,    0,    0,  101,    0,
			    0,  100,    0,    0,   74,    0,   91,   91,   91,   91,
			   47,   91,    0,   91,   91,   91,   91,   91,   91,   91,
			    0,   53,   91,   91,   91,    0,    0,    0,   62,   61,
			   93,   93,   93,   93,   93,   47,   93,   93,   47,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   53,   93,   93,   93,   53,   93,  112,    0,
			    0,  102,    0,    0,    0,  101,    0,  105,  101,    0,

			   76,    0,    0,    0,  103,  105,  103,   91,   91,   59,
			   91,   46,    0,   43,   58,   91,   35,   91,   51,    0,
			   91,   91,   91,    0,    0,   93,   93,   93,   59,   93,
			   59,   93,   46,   43,   58,   93,   43,   58,   93,   35,
			   35,   93,   51,   93,   51,   93,   93,   93,   93,  112,
			    0,  105,    0,  105,    0,  101,    0,    0,  104,    0,
			    0,   73,  105,    0,  104,   91,   91,   91,   82,   54,
			   91,    0,   91,   91,   55,    0,    0,   93,   93,   93,
			   93,   93,   54,   54,   93,   93,   93,   93,   55,   93,
			  111,    0,  105,  104,    0,  104,    0,    0,    0,    0,

			   73,  104,   91,   91,   48,   91,   81,   52,   91,    0,
			    0,   93,   93,   93,   48,   48,   93,   93,   52,   93,
			   52,  126,  104,   75,    0,   73,   91,   91,   91,   91,
			   80,   80,   93,   93,   93,   93,   93,   93,    0,    0,
			   91,   50,   49,   91,    0,    0,   93,   50,   50,   49,
			   49,   93,    0,    0,   91,   91,    0,    0,   93,   93,
			   72,   91,   56,    0,    0,   93,   56,    0,    0,   72,
			   91,    0,    0,   93,    0,    0,   57,    0,    0,   57,
			    0,   71,    0,    0,    0,    0,    0,   71,    0,    0,
			    0,    0,    0,    0,    0,   70,   83,   84,    0,    0,

			    0,   70,    0,   70,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4943
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 806
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 807
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

	yyNb_rules: INTEGER is 130
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 131
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
