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
						tid := dynamic_type_from_string(dadl_parser.output.rm_type_name)
						if tid >= 0 then
							c_domain_type ?= dadl_parser.output.as_object(tid)
							if c_domain_type /= Void then
								last_token := V_C_DOMAIN_TYPE
							else
								dadl_parser_error := "Conversion of " + dadl_parser.output.rm_type_name + " failed"
								last_token := ERR_C_DOMAIN_TYPE
							end
						else
							dadl_parser_error := "Domain type " + dadl_parser.output.rm_type_name + " unknown or not visible in type system"
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
--|#line 419 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 419")
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
--|#line 424 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 424")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 429 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 429")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 93 then
--|#line 435 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 435")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 441 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 441")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 96 then
if yy_act = 95 then
--|#line 447 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 447")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 451 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 451")
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
--|#line 461 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 461")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 468 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 468")
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
--|#line 473 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 473")
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
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 101 then
--|#line 489 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 489")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 104 then
if yy_act = 103 then
	yy_end := yy_end - 1
--|#line 494 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 494")
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
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
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
--|#line 496 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 496")
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
--|#line 516 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 516")
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
--|#line 520 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 520")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 526 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 526")
end
in_buffer.append_character ('\')
end
else
if yy_act = 109 then
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
end
in_buffer.append_character ('"')
else
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
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
--|#line 542 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 542")
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
--|#line 556 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 556")
end
in_buffer.append_string (text)
end
else
if yy_act = 113 then
--|#line 558 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 558")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
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
--|#line 574 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 574")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 117 then
--|#line 583 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 583")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
else
if yy_act <= 120 then
if yy_act = 119 then
--|#line 585 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 585")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
else
if yy_act = 121 then
--|#line 587 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 587")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 588 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 588")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 126 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
last_token := V_CHARACTER; last_character_value := '"'
else
--|#line 590 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 590")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
end
else
if yy_act = 125 then
--|#line 595 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 595")
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
--|#line 605 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 605")
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
--|#line 615 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 615")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 616 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 616")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 129 then
--|#line 620 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 620")
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
			create an_array.make (0, 5034)
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
			   69,   70,   71,   72,   14,   74,   74,   79,   79,   75,
			   75,   89,   76,   76,   89,   91,  789,   91,   91,   97,

			   98,  101,  788,  102,  102,  102,  102,  102,  104,  772,
			  105,  156,  106,  106,  106,  106,  106,  112,  112,  166,
			  112,  174,  771,   80,   80,  738,  214,  214,  104,  214,
			  105,  218,  108,  108,  108,  108,  108,   77,   77,  157,
			  216,  216,  114,  216,   99,   90,  526,  167,   90,  175,
			  107,   81,   81,   82,   83,   84,   82,   83,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   85,
			  107,   82,  112,  112,  162,  112,  158,   82,   82,   82,
			   82,   82,   82,  176,  190,  219,  163,  159,  112,  112,
			  192,  112,  721,  168,  169,  112,  112,  114,  112,  170,

			  146,  117,  164,  146,  160,  455,   82,   82,   87,   82,
			  147,  177,  191,  114,  165,  161,  752,  752,  193,  196,
			  114,  171,  172,  447,  691,  201,  115,  173,  116,  117,
			  196,  122,  204,   82,   82,   82,   82,   82,   83,   84,
			   82,   83,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   85,  115,   82,  116,  112,  112,  122,
			  112,   82,   82,   82,   82,   82,   82,  197,  205,  112,
			  112,  178,  112,  202,  676,  675,  112,  112,  197,  112,
			  112,  112,  114,  112,  179,  659,  112,  112,  207,  112,
			   82,   82,   87,   82,  114,  118,  206,  288,  120,  180,

			  198,  114,  198,  198,  619,  114,  119,  535,  186,  126,
			  121,  114,  181,  187,  196,  123,  124,   82,   82,   82,
			   82,  125,  182,  118,  205,  288,  120,  127,  112,  112,
			  183,  112,  112,  112,  119,  112,  188,  126,  121,  112,
			  112,  189,  112,  123,  124,  112,  112,  107,  112,  125,
			  184,  560,  206,  114,  560,  127,  289,  114,  185,  128,
			  209,  210,  197,  209,  114,  542,  112,  112,  530,  112,
			  114,  104,  129,  210,  210,  136,  210,   91,  218,   91,
			   91,  288,  141,  137,  289,  138,  336,  128,  142,  142,
			  139,  114,  484,  142,  142,  241,  241,  241,  241,  241,

			  129,  112,  112,  136,  112,  112,  112,  140,  112,  292,
			  141,  137,  484,  138,  212,  444,  289,  294,  139,  130,
			  130,  130,  130,  130,  346,  294,  114,  212,  213,  210,
			  114,  213,  219,  131,  142,  140,  441,  142,  142,  338,
			  132,  196,  214,  215,  293,  294,  435,  133,  296,  134,
			  284,  135,  216,  295,  238,  238,  238,  238,  238,  112,
			  112,  131,  112,  243,  243,  243,  243,  243,  132,  239,
			  247,  247,  247,  247,  247,  208,  296,  134,  244,  135,
			  146,  285,  212,  146,  114,  198,  196,  198,  198,  197,
			  147,  236,  240,  236,  236,  435,  414,  239,  148,  148,

			  148,  148,  148,  149,  296,  302,  244,  303,  414,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  150,  148,
			  151,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  299,  302,  197,  303,  148,  152,  152,  153,
			  152,  152,  152,  152,  152,  152,  154,  152,  155,  152,
			  152,  152,  152,  152,  153,  152,  152,  152,  152,  146,
			  213,  210,  146,  213,  360,  360,  360,  360,  360,  147,
			  368,  368,  368,  368,  214,  402,  401,  148,  148,  148,
			  148,  148,  149,  302,  216,  303,  356,  355,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  304,  307,  305,  212,  148,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  195,  195,
			  307,  195,  195,  195,  196,  199,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  195,  197,  195,  195,  195,  200,  200,  200,  200,

			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  195,  195,
			  195,  195,  221,  221,  354,  221,  228,  353,  352,  290,
			  229,  291,  291,  291,  291,  291,  806,  806,  348,  230,
			  230,  230,  230,  230,  696,  696,  696,  307,  314,  222,
			  347,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  231,  311,  314,  112,  112,  346,
			  112,  112,  112,  232,  112,  342,  442,  344,  342,  233,
			  558,  806,  104,  234,  105,  235,  245,  245,  245,  245,

			  245,  246,  114,  223,  224,  224,  114,  224,  224,  224,
			  224,  226,  224,  224,  225,  224,  224,  224,  224,  224,
			  224,  224,  224,  112,  112,  250,  112,  283,  224,  224,
			  224,  224,  224,  224,  107,  104,  314,  105,  208,  245,
			  245,  245,  245,  245,  112,  112,  196,  112,  114,  112,
			  112,  308,  112,  250,  309,  283,  196,  224,  224,  224,
			  224,  248,  310,  310,  315,  112,  112,  306,  112,  114,
			  112,  112,  316,  112,  114,  256,  249,  107,  287,  308,
			  112,  112,  309,  112,  224,  224,  224,  224,  286,  248,
			  114,  297,  316,  318,  251,  114,  252,  298,  112,  112,

			  316,  112,  253,  256,  249,  114,  112,  112,  254,  112,
			  112,  112,  744,  112,  145,  112,  112,  319,  112,  297,
			  317,  318,  251,  114,  252,  298,  112,  112,  284,  112,
			  253,  114,  297,  237,  236,  114,  254,  225,  298,  318,
			  114,  258,  255,   95,  259,  319,   92,  319,  257,  112,
			  112,  114,  112,  112,  112,  745,  112,  263,  112,  112,
			  300,  112,  112,  112,  322,  112,  301,  320,  323,  258,
			  255,  260,  259,  322,  114,  321,  257,  323,  114,  112,
			  112,  308,  112,  114,  309,  263,  328,  114,  112,  112,
			  264,  112,  322,  328,  208,  261,  323,  112,  112,  262,

			  112,  324,  194,  332,  114,  325,  145,  111,  271,  312,
			  110,  131,  313,  114,  328,  326,  109,  332,  264,  327,
			  131,  331,  114,  261,  103,  271,  100,  262,  265,   95,
			  276,  332,  266,  277,  271,  267,  134,  112,  112,  131,
			  112,  268,  113,  326,  269,  333,  270,  327,  131,  113,
			  113,  113,  113,  113,  112,  112,  265,  112,  276,   93,
			  266,  277,  114,  267,  134,  112,  112,   92,  112,  268,
			  334,  806,  269,  334,  270,  112,  112,  271,  112,  114,
			  204,  113,  112,  112,  278,  112,  207,  281,  112,  112,
			  114,  112,  806,  272,  272,  272,  272,  272,  334,  326,

			  114,  335,  279,  327,  806,  806,  280,  114,  403,  113,
			  403,  273,  278,  114,  274,  281,  205,  405,  209,  210,
			  275,  209,  205,  405,  806,  407,  282,  329,  806,  806,
			  279,  330,  210,  210,  280,  210,  403,  806,  404,  273,
			  408,  377,  274,  806,  206,  405,  112,  112,  275,  112,
			  206,  406,  377,  407,  282,  806,  343,  343,  806,  343,
			  806,  195,  377,  806,  213,  210,  806,  213,  408,  806,
			  806,  114,  212,  200,  200,  200,  200,  200,  214,  337,
			  377,  806,  806,  222,  210,  210,  212,  210,  216,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  200,  213,  210,  806,  213,  806,  806,  212,  349,
			  357,  357,  357,  357,  357,  806,  214,  350,  351,  351,
			  351,  351,  351,  409,  806,  239,  216,  358,  212,  358,
			  806,  806,  359,  359,  359,  359,  359,  361,  361,  361,
			  361,  361,  369,  369,  369,  369,  369,  806,  240,  112,
			  112,  409,  112,  239,  196,  806,  212,  339,  340,  341,
			  339,  340,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  214,  690,  114,  339,  362,  362,  362,  362,
			  362,  339,  342,  339,  339,  339,  339,  365,  407,  365,

			  370,  363,  366,  366,  366,  366,  366,  112,  112,  806,
			  112,  104,  197,  105,  408,  367,  367,  367,  367,  367,
			  339,  339,  212,  339,  364,  806,  410,  806,  370,  363,
			  112,  112,  114,  112,  806,  409,  413,  112,  112,  371,
			  112,  413,  411,  112,  112,  416,  112,  339,  339,  339,
			  339,  221,  221,  107,  221,  114,  113,  113,  113,  113,
			  113,  806,  114,  412,  413,  806,  806,  371,  114,  415,
			  806,  485,  485,  416,  486,  373,  372,  806,  222,  417,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  373,  372,  112,  112,  417,  112,  112,
			  112,  806,  112,  112,  112,  806,  112,  112,  112,  806,
			  112,  112,  112,  806,  112,  806,  112,  112,  418,  112,
			  114,  806,  223,  806,  114,  806,  112,  112,  114,  112,
			  112,  112,  114,  112,  391,  806,  114,  392,  419,  416,
			  374,  114,  417,  393,  375,  378,  418,  343,  343,  379,
			  343,  114,  418,  380,  806,  114,  806,  112,  112,  376,
			  112,  382,  391,  381,  806,  392,  419,  420,  374,  423,
			  421,  393,  375,  378,  806,  112,  112,  379,  112,  806,
			  422,  380,  114,  113,  113,  113,  113,  113,  806,  382,

			  806,  381,  112,  112,  806,  112,  806,  423,  806,  806,
			  114,  113,  112,  112,  383,  112,  112,  112,  384,  112,
			  385,  385,  385,  385,  385,  112,  112,  114,  112,  806,
			  387,  387,  387,  387,  387,  112,  112,  114,  112,  113,
			  423,  114,  383,  806,  112,  112,  384,  112,  386,  806,
			  114,  806,  806,  388,  388,  388,  388,  388,  112,  112,
			  114,  112,  389,  389,  389,  389,  389,  806,  424,  114,
			  275,  112,  112,  425,  112,  426,  390,  390,  390,  390,
			  390,  386,  425,  114,  112,  112,  426,  112,  112,  112,
			  386,  112,  112,  112,  806,  112,  114,  806,  275,  112,

			  112,  425,  112,  426,  386,  112,  112,  395,  112,  114,
			  427,  394,  806,  114,  428,  112,  112,  114,  112,  112,
			  112,  396,  112,  290,  114,  290,  290,  290,  290,  290,
			  114,  429,  430,  806,  287,  397,  429,  430,  806,  394,
			  114,  806,  433,  398,  114,  377,  434,  433,  290,  396,
			  291,  291,  291,  291,  291,  434,  377,  438,  438,  429,
			  430,  399,  806,  397,  431,  432,  377,  488,  488,  400,
			  433,  398,  806,  806,  434,  436,  340,  341,  806,  340,
			  490,  490,  492,  437,  377,  438,  439,  806,  216,  216,
			  214,  216,  806,  349,  806,  488,  489,  400,  196,  806,

			  342,  350,  351,  351,  351,  351,  351,  806,  490,  491,
			  492,  440,  440,  440,  440,  440,  359,  359,  359,  359,
			  359,  806,  440,  440,  440,  440,  440,  440,  485,  485,
			  212,  485,  445,  445,  445,  445,  445,  806,  446,  446,
			  446,  446,  446,  493,  492,  493,  197,  239,  806,  440,
			  440,  440,  440,  440,  440,  440,  448,  448,  448,  448,
			  448,  449,  449,  449,  449,  449,  603,  603,  603,  603,
			  240,  493,  494,  495,  806,  239,  447,  450,  450,  450,
			  450,  450,  451,  806,  451,  806,  806,  452,  452,  452,
			  452,  452,  363,  453,  453,  453,  453,  453,  366,  366,

			  366,  366,  366,  454,  454,  454,  454,  454,  459,  459,
			  459,  459,  459,  112,  112,  364,  112,  806,  456,  457,
			  363,  458,  458,  458,  458,  458,  460,  460,  460,  460,
			  460,  112,  112,  806,  112,  806,  806,  806,  114,  112,
			  112,  455,  112,  496,  112,  112,  806,  112,  112,  112,
			  806,  112,  112,  112,  467,  112,  114,  112,  112,  806,
			  112,  461,  806,  479,  114,  467,  806,  497,  462,  114,
			  806,  496,  496,  114,  479,  467,  806,  114,  112,  112,
			  806,  112,  114,  806,  479,  465,  466,  112,  112,  461,
			  112,  463,  806,  467,  464,  497,  462,  806,  112,  112,

			  498,  112,  479,  114,  112,  112,  806,  112,  112,  112,
			  806,  112,  114,  465,  466,  468,  806,  112,  112,  463,
			  112,  806,  464,  114,  112,  112,  499,  112,  806,  114,
			  806,  806,  113,  114,  469,  113,  112,  112,  470,  112,
			  806,  113,  114,  468,  471,  112,  112,  806,  112,  114,
			  500,  501,  473,  472,  499,  385,  385,  385,  385,  385,
			  113,  114,  469,  113,  806,  806,  470,  502,  474,  113,
			  114,  806,  471,  266,  112,  112,  475,  112,  500,  501,
			  473,  472,  268,  499,  387,  387,  387,  387,  387,  388,
			  388,  388,  388,  388,  806,  502,  474,  112,  112,  114,

			  112,  266,  113,  265,  475,  390,  390,  390,  390,  390,
			  268,  503,  806,  806,  112,  112,  806,  112,  806,  269,
			  112,  112,  114,  112,  477,  477,  477,  477,  477,  481,
			  113,  265,  389,  389,  389,  389,  389,  113,  113,  114,
			  478,  478,  478,  478,  478,  114,  476,  269,  112,  112,
			  500,  112,  806,  501,  113,  112,  112,  481,  112,  506,
			  806,  506,  508,  509,  508,  113,  113,  480,  509,  512,
			  484,  513,  514,  114,  476,  512,  513,  482,  504,  806,
			  114,  505,  113,  515,  561,  561,  563,  506,  483,  507,
			  508,  509,  510,  806,  806,  480,  511,  512,  806,  513,

			  514,  806,  806,  516,  517,  482,  521,  521,  521,  521,
			  521,  515,  561,  562,  563,  563,  483,  518,  518,  518,
			  518,  518,  445,  445,  445,  445,  445,  806,  518,  518,
			  518,  518,  518,  518,  569,  570,  571,  520,  522,  522,
			  522,  522,  522,  566,  447,  523,  523,  523,  523,  523,
			  452,  452,  452,  452,  452,  518,  518,  518,  518,  518,
			  518,  518,  569,  570,  571,  520,  524,  524,  524,  524,
			  524,  806,  525,  525,  525,  525,  525,  112,  112,  572,
			  112,  363,  527,  527,  527,  527,  527,  528,  528,  528,
			  528,  528,  529,  529,  529,  529,  529,  524,  524,  524,

			  524,  524,  114,  806,  364,  112,  112,  572,  112,  363,
			  526,  457,  531,  458,  458,  458,  458,  458,  532,  806,
			  532,  112,  112,  806,  112,  455,  112,  112,  533,  112,
			  114,  485,  485,  536,  486,  112,  112,  564,  112,  806,
			  531,  112,  112,  806,  112,  537,  114,  112,  112,  565,
			  112,  114,  806,  538,  570,  571,  534,  806,  806,  539,
			  114,  112,  112,  550,  112,  564,  114,  112,  112,  806,
			  112,  540,  114,  537,  550,  112,  112,  565,  112,  541,
			  543,  538,  573,  574,  550,  558,  114,  539,  806,  806,
			  555,  806,  114,  544,  112,  112,  806,  112,  806,  540,

			  114,  555,  550,  572,  545,  576,  806,  541,  543,  112,
			  112,  556,  112,  112,  112,  806,  112,  112,  112,  114,
			  112,  544,  549,  549,  549,  549,  549,  546,  806,  555,
			  806,  575,  545,  576,  114,  806,  113,  806,  114,  806,
			  112,  112,  114,  112,  806,  806,  548,  557,  477,  477,
			  477,  477,  477,  547,  806,  546,  478,  478,  478,  478,
			  478,  576,  113,  386,  113,  114,  564,  112,  112,  392,
			  112,  578,  806,  551,  548,  393,  806,  113,  565,  112,
			  112,  547,  112,  112,  112,  579,  112,  578,  579,  577,
			  113,  582,  114,  583,  567,  806,  806,  392,  559,  578,

			  552,  551,  584,  393,  114,  113,  568,  585,  114,  582,
			  583,  623,  806,  579,  806,  580,  581,  806,  806,  582,
			  806,  583,  623,  553,  554,  698,  699,  698,  552,  806,
			  584,  806,  624,  806,  590,  585,  590,  586,  587,  591,
			  591,  591,  591,  591,  591,  591,  591,  591,  591,  593,
			  623,  553,  554,  588,  588,  588,  588,  588,  592,  592,
			  592,  592,  592,  700,  588,  588,  588,  588,  588,  588,
			  806,  806,  240,  775,  775,  775,  775,  593,  791,  791,
			  791,  791,  447,  524,  524,  524,  524,  524,  806,  806,
			  806,  588,  588,  588,  588,  588,  588,  588,  594,  595,

			  595,  595,  595,  595,  596,  596,  596,  596,  596,  597,
			  597,  597,  597,  597,  598,  598,  598,  598,  598,  599,
			  599,  599,  599,  599,  806,  806,  594,  600,  600,  600,
			  600,  600,  625,  601,  626,  601,  806,  526,  598,  598,
			  598,  598,  598,  602,  602,  602,  602,  602,  112,  112,
			  806,  112,  455,  605,  605,  605,  605,  605,  112,  112,
			  625,  112,  626,  624,  112,  112,  806,  112,  606,  112,
			  112,  612,  112,  114,  624,  112,  112,  607,  112,  112,
			  112,  806,  112,  114,  624,  626,  806,  608,  612,  114,
			  628,  806,  612,  629,  114,  806,  606,  609,  112,  112,

			  114,  112,  624,  806,  114,  607,  628,  112,  112,  610,
			  112,  112,  112,  627,  112,  608,  612,  611,  628,  112,
			  112,  629,  112,  114,  629,  609,  112,  112,  806,  112,
			  112,  112,  114,  112,  630,  806,  114,  610,  112,  112,
			  614,  112,  806,  613,  114,  611,  549,  549,  549,  549,
			  549,  114,  631,  112,  112,  114,  112,  615,  632,  617,
			  633,  634,  618,  114,  616,  635,  806,  113,  614,  112,
			  112,  613,  112,  268,  112,  112,  633,  112,  114,  634,
			  635,  639,  639,  641,  642,  615,  632,  617,  633,  634,
			  618,  641,  616,  635,  114,  113,  642,  620,  645,  114,

			  621,  268,  646,  647,  636,  645,  622,  637,  638,  639,
			  640,  641,  642,  591,  591,  591,  591,  591,  806,  643,
			  112,  112,  806,  112,  644,  620,  645,  806,  621,  806,
			  646,  647,  677,  648,  622,  649,  649,  649,  649,  649,
			  591,  591,  591,  591,  591,  114,  649,  649,  649,  649,
			  649,  649,  651,  651,  651,  651,  651,  652,  806,  652,
			  677,  806,  653,  653,  653,  653,  653,  655,  655,  655,
			  655,  655,  657,  649,  649,  649,  649,  649,  649,  649,
			  654,  806,  654,  806,  806,  655,  655,  655,  655,  655,
			  656,  656,  656,  656,  656,  364,  806,  806,  806,  806,

			  657,  799,  800,  799,  806,  526,  598,  598,  598,  598,
			  598,  658,  658,  658,  658,  658,  598,  598,  598,  598,
			  598,  660,  660,  660,  660,  660,  661,  661,  661,  661,
			  661,  662,  662,  662,  662,  662,  663,  678,  663,  801,
			  668,  664,  664,  664,  664,  664,  657,  112,  112,  678,
			  112,  112,  112,  806,  112,  112,  112,  668,  112,  112,
			  112,  668,  112,  112,  112,  678,  112,  112,  112,  364,
			  112,  680,  114,  806,  657,  806,  114,  679,  112,  112,
			  114,  112,  806,  806,  114,  668,  667,  680,  114,  666,
			  671,  665,  114,  112,  112,  682,  112,  112,  112,  680,

			  112,  112,  112,  114,  112,  112,  112,  671,  112,  112,
			  112,  671,  112,  682,  667,  681,  684,  666,  114,  665,
			  684,  806,  114,  682,  112,  112,  114,  112,  669,  806,
			  114,  686,  687,  688,  114,  671,  686,  670,  672,  806,
			  806,  683,  806,  806,  684,  673,  806,  806,  685,  114,
			  653,  653,  653,  653,  653,  806,  669,  674,  806,  686,
			  687,  688,  806,  806,  689,  670,  672,  692,  692,  692,
			  692,  692,  806,  673,  655,  655,  655,  655,  655,  655,
			  655,  655,  655,  655,  806,  674,  693,  693,  693,  693,
			  693,  694,  806,  694,  806,  806,  695,  695,  695,  695, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  695,  711,  806,  806,  806,  447,  697,  697,  697,  697,
			  697,  597,  597,  597,  597,  597,  664,  664,  664,  664,
			  664,  701,  701,  701,  701,  701,  657,  112,  112,  711,
			  112,  112,  112,  806,  112,  806,  112,  112,  806,  112,
			  112,  112,  806,  112,  806,  112,  112,  806,  112,  364,
			  706,  709,  114,  806,  657,  709,  114,  712,  702,  455,
			  806,  114,  712,  112,  112,  114,  112,  706,  703,  704,
			  114,  706,  709,  806,  112,  112,  705,  112,  112,  112,
			  710,  112,  714,  709,  710,  712,  702,  714,  114,  716,
			  713,  716,  718,  719,  718,  706,  703,  704,  806,  114,

			  806,  710,  806,  114,  705,  732,  707,  806,  806,  733,
			  714,  708,  710,  806,  806,  715,  806,  716,  806,  717,
			  718,  719,  720,  651,  651,  651,  651,  651,  695,  695,
			  695,  695,  695,  732,  707,  112,  112,  733,  112,  708,
			  722,  722,  722,  722,  722,  723,  723,  723,  723,  723,
			  534,  534,  534,  534,  534,  724,  724,  724,  724,  724,
			  114,  447,  725,  725,  725,  725,  725,  658,  658,  658,
			  658,  658,  112,  112,  806,  112,  112,  112,  526,  112,
			  806,  727,  112,  112,  733,  112,  112,  112,  806,  112,
			  735,  112,  112,  735,  112,  737,  730,  114,  731,  746,

			  730,  114,  731,  806,  806,  455,  806,  114,  726,  727,
			  806,  114,  734,  806,  806,  728,  114,  730,  735,  731,
			  747,  736,  806,  737,  806,  806,  806,  746,  730,  806,
			  731,  693,  693,  693,  693,  693,  726,  729,  739,  739,
			  739,  739,  739,  728,  698,  747,  698,  749,  747,  725,
			  725,  725,  725,  725,  112,  112,  749,  112,  112,  112,
			  806,  112,  751,  112,  112,  729,  112,  112,  112,  526,
			  112,  758,  806,  748,  806,  749,  806,  112,  112,  114,
			  112,  759,  700,  114,  750,  806,  806,  740,  114,  806,
			  751,  806,  114,  753,  753,  753,  753,  753,  756,  758,

			  112,  112,  114,  112,  112,  112,  756,  112,  741,  759,
			  765,  766,  742,  743,  757,  740,  806,  112,  112,  756,
			  112,  773,  757,  754,  806,  114,  806,  806,  806,  114,
			  806,  806,  806,  806,  756,  757,  741,  779,  765,  766,
			  742,  743,  114,  760,  760,  760,  760,  760,  806,  773,
			  757,  754,  700,  700,  700,  700,  700,  112,  112,  755,
			  112,  112,  112,  763,  112,  779,  767,  764,  767,  806,
			  806,  763,  806,  806,  806,  764,  768,  112,  112,  806,
			  112,  806,  114,  785,  763,  785,  114,  755,  764,  112,
			  112,  806,  112,  786,  762,  112,  112,  806,  112,  763,

			  806,  806,  114,  764,  769,  777,  778,  761,  774,  774,
			  774,  774,  774,  782,  114,  806,  777,  778,  806,  770,
			  114,  787,  762,  806,  782,  806,  777,  778,  776,  780,
			  780,  780,  780,  780,  782,  761,  781,  781,  781,  781,
			  781,  806,  783,  806,  777,  778,  806,  770,  112,  112,
			  806,  112,  782,  783,  806,  806,  776,  784,  784,  784,
			  784,  784,  792,  783,  769,  769,  769,  769,  769,  793,
			  806,  806,  806,  114,  790,  790,  790,  790,  790,  792,
			  806,  783,  806,  792,  796,  797,  793,  806,  806,  806,
			  793,  794,  794,  794,  794,  794,  795,  795,  795,  795,

			  795,  796,  797,  806,  806,  796,  797,  792,  798,  798,
			  798,  798,  798,  806,  793,  787,  787,  787,  787,  787,
			  802,  802,  802,  802,  802,  806,  806,  806,  806,  796,
			  797,  803,  803,  803,  803,  803,  804,  804,  804,  804,
			  804,  799,  806,  799,  806,  806,  803,  803,  803,  803,
			  803,  805,  805,  805,  805,  805,  801,  801,  801,  801,
			  801,  443,  443,  806,  806,  806,  806,  443,  443,  443,
			  443,  443,  443,  806,  806,  806,  806,  806,  806,  801,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,

			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   94,   94,  806,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  806,   94,   94,   94,   94,   94,   96,   96,  806,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,  113,  113,  113,  806,  806,  806,  806,  806,
			  806,  806,  113,  113,  806,  806,  113,  806,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  806,  806,  113,  113,  113,  143,  143,  806,  143,
			  143,  806,  143,  143,  806,  806,  806,  806,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  806,  806,  143,  143,  143,  144,  144,  806,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,

			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  195,  195,  806,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  197,  197,
			  806,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,

			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  806,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,

			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  211,  211,  211,  806,
			  806,  806,  806,  211,  211,  806,  211,  211,  806,  806,
			  806,  806,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  806,  211,  211,  211,  211,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,

			  217,  217,  217,  217,  217,  217,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  224,  224,  806,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  227,  227,

			  806,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  806,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  142,  142,  806,  142,
			  142,  806,  142,  142,  142,  806,  806,  806,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  806,  806,  142,  142,  142,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,

			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  223,  223,  223,  519,  519,  806,  806,  806,
			  806,  519,  519,  519,  519,  519,  519,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  806,  806,  806,  806,  806,  223,  345,  345,  806,
			  345,  806,  806,  345,  345,  345,  345,  345,  345,  345,
			  345,  345,  345,  345,  345,  345,  345,  345,  345,  345,
			  345,  345,  345,  345,  345,  345,  806,  806,  345,  345,

			  345,  339,  339,  339,  339,  339,  339,  339,  806,  339,
			  339,  339,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  806,  339,  339,  339,  339,  487,  487,  487,
			  806,  806,  806,  806,  487,  487,  806,  487,  487,  806,
			  806,  806,  806,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  806,  806,  487,  487,
			  487,  402,  402,  402,  806,  806,  402,  402,  402,  402,

			  402,  402,  402,  402,  402,  402,  806,  806,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  806,  806,  402,  402,  402,  557,  557,  557,  806,
			  806,  806,  806,  557,  557,  806,  557,  557,  806,  806,
			  806,  806,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  806,  557,  557,  557,  557,
			  589,  589,  806,  806,  806,  806,  589,  589,  589,  589,
			  589,  589,  604,  604,  604,  604,  604,  604,  604,  604,

			  604,  806,  604,  604,  604,  604,  604,  604,  604,  604,
			  604,  604,  604,  604,  604,  604,  604,  604,  604,  604,
			  604,  604,  604,  604,  604,  604,  604,  604,  604,  604,
			  604,  604,  604,  604,  604,  604,  604,  604,  650,  650,
			  806,  806,  806,  806,  650,  650,  650,  650,  650,  650,
			   13,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806, yy_Dummy>>,
			1, 2035, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5034)
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
			    1,    1,    1,    1,    1,    3,    4,    5,    6,    3,
			    4,   11,    3,    4,   12,   15,  783,   15,   15,   20,

			   20,   27,  782,   27,   27,   27,   27,   27,   29,  764,
			   29,   58,   29,   29,   29,   29,   29,   38,   38,   61,
			   38,   63,  763,    5,    6,  723,  214,  214,   30,  214,
			   30,   88,   30,   30,   30,   30,   30,    3,    4,   58,
			  216,  216,   38,  216,   20,   11,  693,   61,   12,   63,
			   29,    5,    6,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			   30,    9,   39,   39,   60,   39,   59,    9,    9,    9,
			    9,    9,    9,   64,   68,   88,   60,   59,   37,   37,
			   69,   37,  691,   62,   62,   42,   42,   39,   42,   62,

			  146,   39,   60,  146,   59,  658,    9,    9,    9,    9,
			  146,   64,   68,   37,   60,   59,  738,  738,   69,   73,
			   42,   62,   62,  651,  650,   77,   37,   62,   37,   39,
			  195,   42,   78,    9,    9,    9,    9,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   37,   10,   37,   40,   40,   42,
			   40,   10,   10,   10,   10,   10,   10,   73,   78,   41,
			   41,   65,   41,   77,  624,  623,   43,   43,  195,   43,
			   44,   44,   40,   44,   65,  600,   45,   45,   80,   45,
			   10,   10,   10,   10,   41,   40,   78,  150,   41,   65,

			   74,   43,   74,   74,  550,   44,   40,  460,   67,   44,
			   41,   45,   65,   67,  199,   43,   43,   10,   10,   10,
			   10,   43,   66,   40,   80,  150,   41,   45,   46,   46,
			   66,   46,   51,   51,   40,   51,   67,   44,   41,   48,
			   48,   67,   48,   43,   43,   49,   49,  460,   49,   43,
			   66,  489,   80,   46,  488,   45,  151,   51,   66,   46,
			   83,   83,  199,   83,   48,  467,   50,   50,  456,   50,
			   49,  449,   46,   84,   84,   48,   84,   91,  217,   91,
			   91,  154,   51,   48,  151,   49,  199,   46,   52,   52,
			   49,   50,  439,   52,   52,  104,  104,  104,  104,  104,

			   46,   47,   47,   48,   47,  112,  112,   50,  112,  154,
			   51,   48,  438,   49,   83,  346,  155,  156,   49,   47,
			   47,   47,   47,   47,  345,  157,   47,   84,   85,   85,
			  112,   85,  217,   47,   52,   50,  339,  143,  143,  208,
			   47,  337,   85,   85,  155,  156,  331,   47,  158,   47,
			  143,   47,   85,  157,  102,  102,  102,  102,  102,  113,
			  113,   47,  113,  105,  105,  105,  105,  105,   47,  102,
			  107,  107,  107,  107,  107,  208,  158,   47,  105,   47,
			   56,  143,   85,   56,  113,  198,  690,  198,  198,  337,
			   56,  236,  102,  236,  236,  328,  305,  102,   56,   56,

			   56,   56,   56,   56,  160,  162,  105,  163,  303,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,  160,  162,  690,  163,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   57,
			   86,   86,   57,   86,  240,  240,  240,  240,  240,   57,
			  246,  246,  246,  246,   86,  287,  284,   57,   57,   57,
			   57,   57,   57,  164,   86,  165,  235,  234,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,  164,  168,  165,   86,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   76,   76,
			  168,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,

			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   89,   89,  233,   89,   99,  232,  231,  153,
			   99,  153,  153,  153,  153,  153,  557,  557,  229,   99,
			   99,   99,   99,   99,  659,  659,  659,  171,  174,   89,
			  228,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   99,  171,  174,  141,  141,  227,
			  141,  117,  117,   99,  117,  342,  342,  226,  342,   99,
			  557,  221,  106,   99,  106,   99,  106,  106,  106,  106,

			  106,  106,  141,   89,   97,   97,  117,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,  115,  115,  117,  115,  141,   97,   97,
			   97,   97,   97,   97,  106,  108,  175,  108,  206,  108,
			  108,  108,  108,  108,  116,  116,  202,  116,  115,  118,
			  118,  169,  118,  117,  169,  141,  197,   97,   97,   97,
			   97,  115,  173,  170,  175,  119,  119,  167,  119,  116,
			  120,  120,  176,  120,  118,  166,  116,  108,  149,  169,
			  122,  122,  169,  122,   97,   97,   97,   97,  147,  115,
			  119,  159,  177,  178,  118,  120,  119,  159,  121,  121,

			  176,  121,  119,  122,  116,  122,  123,  123,  120,  123,
			  124,  124,  730,  124,  144,  125,  125,  179,  125,  159,
			  177,  178,  118,  121,  119,  159,  128,  128,  142,  128,
			  119,  123,  161,  101,  100,  124,  120,   96,  161,  180,
			  125,  124,  121,   94,  124,  179,   92,  181,  123,  126,
			  126,  128,  126,  127,  127,  730,  127,  128,  129,  129,
			  161,  129,  131,  131,  182,  131,  161,  180,  183,  124,
			  121,  125,  124,  184,  126,  181,  123,  185,  127,  134,
			  134,  172,  134,  129,  172,  128,  187,  131,  132,  132,
			  129,  132,  182,  189,   81,  126,  183,  136,  136,  127,

			  136,  184,   70,  190,  134,  185,   55,   36,  131,  172,
			   35,  134,  172,  132,  187,  186,   33,  191,  129,  186,
			  132,  189,  136,  126,   28,  134,   26,  127,  130,   18,
			  136,  190,  130,  136,  132,  130,  132,  137,  137,  134,
			  137,  130,  130,  186,  130,  191,  130,  186,  132,  135,
			  135,  135,  135,  135,  139,  139,  130,  139,  136,   17,
			  130,  136,  137,  130,  132,  138,  138,   16,  138,  130,
			  192,   13,  130,  193,  130,  133,  133,  135,  133,  139,
			  203,  135,  140,  140,  137,  140,  205,  139,  249,  249,
			  138,  249,    0,  133,  133,  133,  133,  133,  192,  188,

			  133,  193,  138,  188,    0,    0,  138,  140,  288,  135,
			  292,  133,  137,  249,  133,  139,  203,  294,  209,  209,
			  133,  209,  205,  295,    0,  296,  140,  188,    0,    0,
			  138,  188,  210,  210,  138,  210,  288,    0,  292,  133,
			  297,  256,  133,    0,  203,  294,  262,  262,  133,  262,
			  205,  295,  256,  296,  140,  148,  222,  222,    0,  222,
			    0,  200,  256,    0,  211,  211,    0,  211,  297,    0,
			    0,  262,  209,  200,  200,  200,  200,  200,  211,  200,
			  256,    0,    0,  222,  341,  341,  210,  341,  211,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  200,  213,  213,    0,  213,    0,    0,  211,  230,
			  238,  238,  238,  238,  238,    0,  213,  230,  230,  230,
			  230,  230,  230,  298,    0,  238,  213,  239,  341,  239,
			    0,    0,  239,  239,  239,  239,  239,  241,  241,  241,
			  241,  241,  247,  247,  247,  247,  247,    0,  238,  248,
			  248,  298,  248,  238,  649,    0,  213,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  649,  248,  215,  243,  243,  243,  243,
			  243,  215,  215,  215,  215,  215,  215,  244,  299,  244,

			  248,  243,  244,  244,  244,  244,  244,  250,  250,    0,
			  250,  245,  649,  245,  300,  245,  245,  245,  245,  245,
			  215,  215,  215,  215,  243,    0,  299,    0,  248,  243,
			  268,  268,  250,  268,    0,  301,  302,  252,  252,  250,
			  252,  304,  300,  251,  251,  307,  251,  215,  215,  215,
			  215,  218,  218,  245,  218,  268,  271,  271,  271,  271,
			  271,    0,  252,  301,  302,    0,    0,  250,  251,  304,
			    0,  401,  401,  307,  401,  252,  251,    0,  218,  308,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  252,  251,  253,  253,  308,  253,  254,
			  254,    0,  254,  255,  255,    0,  255,  257,  257,    0,
			  257,  258,  258,    0,  258,    0,  259,  259,  309,  259,
			  253,    0,  218,    0,  254,    0,  260,  260,  255,  260,
			  261,  261,  257,  261,  272,    0,  258,  272,  310,  311,
			  253,  259,  312,  272,  254,  257,  309,  343,  343,  258,
			  343,  260,  313,  259,    0,  261,    0,  263,  263,  255,
			  263,  261,  272,  260,    0,  272,  310,  311,  253,  314,
			  312,  272,  254,  257,  343,  264,  264,  258,  264,    0,
			  313,  259,  263,  273,  273,  273,  273,  273,    0,  261,

			    0,  260,  265,  265,    0,  265,    0,  314,    0,    0,
			  264,  273,  266,  266,  263,  266,  275,  275,  264,  275,
			  265,  265,  265,  265,  265,  274,  274,  265,  274,    0,
			  266,  266,  266,  266,  266,  267,  267,  266,  267,  273,
			  315,  275,  263,    0,  269,  269,  264,  269,  265,    0,
			  274,    0,    0,  267,  267,  267,  267,  267,  270,  270,
			  267,  270,  269,  269,  269,  269,  269,    0,  315,  269,
			  274,  276,  276,  318,  276,  319,  270,  270,  270,  270,
			  270,  267,  320,  270,  277,  277,  321,  277,  278,  278,
			  269,  278,  279,  279,    0,  279,  276,    0,  274,  280,

			  280,  318,  280,  319,  270,  281,  281,  277,  281,  277,
			  320,  276,    0,  278,  321,  282,  282,  279,  282,  283,
			  283,  278,  283,  290,  280,  290,  290,  290,  290,  290,
			  281,  322,  323,    0,  306,  279,  324,  325,    0,  276,
			  282,    0,  326,  280,  283,  306,  327,  329,  291,  278,
			  291,  291,  291,  291,  291,  330,  306,  334,  335,  322,
			  323,  281,    0,  279,  324,  325,  306,  403,  404,  283,
			  326,  280,    0,    0,  327,  329,  340,  340,    0,  340,
			  405,  406,  408,  330,  306,  334,  335,    0,  442,  442,
			  340,  442,    0,  351,    0,  403,  404,  283,  336,    0,

			  340,  351,  351,  351,  351,  351,  351,    0,  405,  406,
			  408,  336,  336,  336,  336,  336,  358,  358,  358,  358,
			  358,    0,  336,  336,  336,  336,  336,  336,  485,  485,
			  340,  485,  357,  357,  357,  357,  357,    0,  359,  359,
			  359,  359,  359,  409,  411,  412,  336,  357,    0,  336,
			  336,  336,  336,  336,  336,  336,  360,  360,  360,  360,
			  360,  361,  361,  361,  361,  361,  533,  533,  533,  533,
			  357,  409,  411,  412,    0,  357,  359,  362,  362,  362,
			  362,  362,  363,    0,  363,    0,    0,  363,  363,  363,
			  363,  363,  362,  364,  364,  364,  364,  364,  365,  365,

			  365,  365,  365,  366,  366,  366,  366,  366,  368,  368,
			  368,  368,  368,  370,  370,  362,  370,    0,  367,  367,
			  362,  367,  367,  367,  367,  367,  369,  369,  369,  369,
			  369,  371,  371,    0,  371,    0,    0,    0,  370,  372,
			  372,  366,  372,  413,  373,  373,    0,  373,  374,  374,
			    0,  374,  375,  375,  377,  375,  371,  376,  376,    0,
			  376,  370,    0,  395,  372,  377,    0,  414,  371,  373,
			    0,  413,  415,  374,  395,  377,    0,  375,  378,  378,
			    0,  378,  376,    0,  395,  375,  376,  379,  379,  370,
			  379,  373,    0,  377,  374,  414,  371,    0,  380,  380,

			  415,  380,  395,  378,  381,  381,    0,  381,  383,  383,
			    0,  383,  379,  375,  376,  378,    0,  382,  382,  373,
			  382,    0,  374,  380,  384,  384,  416,  384,    0,  381,
			    0,    0,  386,  383,  379,  386,  393,  393,  380,  393,
			    0,  386,  382,  378,  381,  394,  394,    0,  394,  384,
			  417,  418,  383,  382,  416,  385,  385,  385,  385,  385,
			  386,  393,  379,  386,    0,    0,  380,  419,  384,  386,
			  394,    0,  381,  385,  396,  396,  385,  396,  417,  418,
			  383,  382,  385,  420,  387,  387,  387,  387,  387,  388,
			  388,  388,  388,  388,    0,  419,  384,  398,  398,  396,

			  398,  385,  387,  388,  385,  390,  390,  390,  390,  390,
			  385,  420,    0,    0,  389,  389,    0,  389,    0,  388,
			  397,  397,  398,  397,  391,  391,  391,  391,  391,  398,
			  387,  388,  389,  389,  389,  389,  389,  390,  391,  389,
			  392,  392,  392,  392,  392,  397,  389,  388,  399,  399,
			  421,  399,    0,  422,  392,  400,  400,  398,  400,  423,
			    0,  424,  425,  426,  427,  390,  391,  397,  428,  433,
			  400,  434,  435,  399,  389,  436,  437,  399,  421,    0,
			  400,  422,  392,  435,  490,  491,  492,  423,  399,  424,
			  425,  426,  427,    0,    0,  397,  428,  433,    0,  434,

			  435,    0,    0,  436,  437,  399,  446,  446,  446,  446,
			  446,  435,  490,  491,  492,  494,  399,  440,  440,  440,
			  440,  440,  445,  445,  445,  445,  445,    0,  440,  440,
			  440,  440,  440,  440,  497,  499,  500,  445,  447,  447,
			  447,  447,  447,  494,  446,  448,  448,  448,  448,  448,
			  451,  451,  451,  451,  451,  440,  440,  440,  440,  440,
			  440,  440,  497,  499,  500,  445,  450,  450,  450,  450,
			  450,    0,  452,  452,  452,  452,  452,  461,  461,  501,
			  461,  450,  453,  453,  453,  453,  453,  454,  454,  454,
			  454,  454,  455,  455,  455,  455,  455,  457,  457,  457,

			  457,  457,  461,    0,  450,  462,  462,  501,  462,  450,
			  452,  458,  457,  458,  458,  458,  458,  458,  459,    0,
			  459,  463,  463,    0,  463,  454,  464,  464,  459,  464,
			  462,  486,  486,  461,  486,  465,  465,  493,  465,    0,
			  457,  466,  466,    0,  466,  462,  463,  468,  468,  493,
			  468,  464,    0,  463,  503,  504,  459,    0,    0,  464,
			  465,  469,  469,  479,  469,  493,  466,  470,  470,    0,
			  470,  464,  468,  462,  479,  471,  471,  493,  471,  466,
			  468,  463,  503,  504,  479,  486,  469,  464,    0,    0,
			  484,    0,  470,  469,  472,  472,    0,  472,    0,  464,

			  471,  484,  479,  505,  470,  506,    0,  466,  468,  473,
			  473,  484,  473,  474,  474,    0,  474,  476,  476,  472,
			  476,  469,  475,  475,  475,  475,  475,  472,    0,  484,
			    0,  505,  470,  506,  473,    0,  475,    0,  474,    0,
			  480,  480,  476,  480,  487,  487,  474,  487,  477,  477,
			  477,  477,  477,  473,    0,  472,  478,  478,  478,  478,
			  478,  507,  477,  476,  475,  480,  495,  481,  481,  477,
			  481,  508,    0,  480,  474,  477,    0,  478,  495,  482,
			  482,  473,  482,  483,  483,  509,  483,  510,  511,  507,
			  477,  512,  481,  513,  495,    0,    0,  477,  487,  508,

			  481,  480,  514,  477,  482,  478,  495,  515,  483,  516,
			  517,  555,    0,  509,    0,  510,  511,    0,    0,  512,
			    0,  513,  555,  482,  483,  661,  661,  661,  481,    0,
			  514,    0,  555,    0,  520,  515,  520,  516,  517,  520,
			  520,  520,  520,  520,  521,  521,  521,  521,  521,  523,
			  555,  482,  483,  518,  518,  518,  518,  518,  522,  522,
			  522,  522,  522,  661,  518,  518,  518,  518,  518,  518,
			    0,    0,  523,  768,  768,  768,  768,  523,  786,  786,
			  786,  786,  521,  524,  524,  524,  524,  524,    0,    0,
			    0,  518,  518,  518,  518,  518,  518,  518,  524,  525,

			  525,  525,  525,  525,  526,  526,  526,  526,  526,  527,
			  527,  527,  527,  527,  528,  528,  528,  528,  528,  529,
			  529,  529,  529,  529,    0,    0,  524,  530,  530,  530,
			  530,  530,  560,  531,  561,  531,    0,  525,  531,  531,
			  531,  531,  531,  532,  532,  532,  532,  532,  536,  536,
			    0,  536,  528,  535,  535,  535,  535,  535,  537,  537,
			  560,  537,  561,  556,  538,  538,    0,  538,  535,  539,
			  539,  542,  539,  536,  556,  540,  540,  536,  540,  541,
			  541,    0,  541,  537,  556,  562,    0,  537,  542,  538,
			  563,    0,  542,  564,  539,    0,  535,  538,  543,  543,

			  540,  543,  556,    0,  541,  536,  566,  544,  544,  539,
			  544,  545,  545,  562,  545,  537,  542,  541,  563,  546,
			  546,  564,  546,  543,  567,  538,  547,  547,    0,  547,
			  548,  548,  544,  548,  566,    0,  545,  539,  551,  551,
			  544,  551,    0,  543,  546,  541,  549,  549,  549,  549,
			  549,  547,  567,  552,  552,  548,  552,  545,  569,  547,
			  570,  571,  548,  551,  546,  572,    0,  549,  544,  553,
			  553,  543,  553,  549,  554,  554,  573,  554,  552,  574,
			  575,  576,  577,  578,  579,  545,  569,  547,  570,  571,
			  548,  580,  546,  572,  553,  549,  581,  552,  583,  554,

			  553,  549,  584,  585,  573,  587,  554,  574,  575,  576,
			  577,  578,  579,  590,  590,  590,  590,  590,    0,  580,
			  609,  609,    0,  609,  581,  552,  583,    0,  553,    0,
			  584,  585,  625,  587,  554,  588,  588,  588,  588,  588,
			  591,  591,  591,  591,  591,  609,  588,  588,  588,  588,
			  588,  588,  592,  592,  592,  592,  592,  593,    0,  593,
			  625,    0,  593,  593,  593,  593,  593,  595,  595,  595,
			  595,  595,  597,  588,  588,  588,  588,  588,  588,  588,
			  594,    0,  594,    0,    0,  594,  594,  594,  594,  594,
			  596,  596,  596,  596,  596,  597,    0,    0,    0,    0,

			  597,  795,  795,  795,    0,  595,  598,  598,  598,  598,
			  598,  599,  599,  599,  599,  599,  601,  601,  601,  601,
			  601,  602,  602,  602,  602,  602,  603,  603,  603,  603,
			  603,  605,  605,  605,  605,  605,  606,  626,  606,  795,
			  612,  606,  606,  606,  606,  606,  605,  607,  607,  627,
			  607,  608,  608,    0,  608,  610,  610,  612,  610,  611,
			  611,  612,  611,  613,  613,  626,  613,  614,  614,  605,
			  614,  629,  607,    0,  605,    0,  608,  627,  615,  615,
			  610,  615,    0,    0,  611,  612,  610,  631,  613,  608,
			  619,  607,  614,  616,  616,  635,  616,  617,  617,  629,

			  617,  618,  618,  615,  618,  620,  620,  619,  620,  621,
			  621,  619,  621,  638,  610,  631,  641,  608,  616,  607,
			  643,    0,  617,  635,  622,  622,  618,  622,  615,    0,
			  620,  645,  646,  647,  621,  619,  648,  617,  620,    0,
			    0,  638,    0,    0,  641,  621,    0,    0,  643,  622,
			  652,  652,  652,  652,  652,    0,  615,  622,    0,  645,
			  646,  647,    0,    0,  648,  617,  620,  653,  653,  653,
			  653,  653,    0,  621,  654,  654,  654,  654,  654,  655,
			  655,  655,  655,  655,    0,  622,  656,  656,  656,  656,
			  656,  657,    0,  657,    0,    0,  657,  657,  657,  657, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  657,  677,    0,    0,    0,  653,  660,  660,  660,  660,
			  660,  662,  662,  662,  662,  662,  663,  663,  663,  663,
			  663,  664,  664,  664,  664,  664,  662,  665,  665,  677,
			  665,  666,  666,    0,  666,    0,  667,  667,    0,  667,
			  669,  669,    0,  669,    0,  670,  670,    0,  670,  662,
			  671,  675,  665,    0,  662,  675,  666,  678,  665,  664,
			    0,  667,  679,  674,  674,  669,  674,  671,  666,  667,
			  670,  671,  675,    0,  672,  672,  670,  672,  673,  673,
			  676,  673,  680,  675,  676,  678,  665,  681,  674,  684,
			  679,  685,  686,  687,  689,  671,  666,  667,    0,  672,

			    0,  676,    0,  673,  670,  711,  672,    0,    0,  712,
			  680,  673,  676,    0,    0,  681,    0,  684,    0,  685,
			  686,  687,  689,  692,  692,  692,  692,  692,  694,  694,
			  694,  694,  694,  711,  672,  703,  703,  712,  703,  673,
			  695,  695,  695,  695,  695,  696,  696,  696,  696,  696,
			  697,  697,  697,  697,  697,  698,  698,  698,  698,  698,
			  703,  692,  699,  699,  699,  699,  699,  701,  701,  701,
			  701,  701,  702,  702,    0,  702,  704,  704,  695,  704,
			    0,  703,  705,  705,  713,  705,  707,  707,    0,  707,
			  716,  708,  708,  717,  708,  719,  709,  702,  710,  732,

			  709,  704,  710,    0,    0,  701,    0,  705,  702,  703,
			    0,  707,  713,    0,    0,  705,  708,  709,  716,  710,
			  733,  717,    0,  719,    0,    0,    0,  732,  709,    0,
			  710,  722,  722,  722,  722,  722,  702,  708,  724,  724,
			  724,  724,  724,  705,  725,  734,  725,  735,  733,  725,
			  725,  725,  725,  725,  726,  726,  736,  726,  727,  727,
			    0,  727,  737,  729,  729,  708,  729,  728,  728,  722,
			  728,  746,    0,  734,    0,  735,    0,  740,  740,  726,
			  740,  751,  725,  727,  736,    0,    0,  726,  729,    0,
			  737,    0,  728,  739,  739,  739,  739,  739,  744,  746,

			  741,  741,  740,  741,  742,  742,  744,  742,  727,  751,
			  758,  759,  728,  729,  745,  726,    0,  743,  743,  744,
			  743,  765,  745,  740,    0,  741,    0,    0,    0,  742,
			    0,    0,    0,    0,  744,  745,  727,  773,  758,  759,
			  728,  729,  743,  752,  752,  752,  752,  752,    0,  765,
			  745,  740,  753,  753,  753,  753,  753,  754,  754,  743,
			  754,  755,  755,  756,  755,  773,  760,  757,  760,    0,
			    0,  756,    0,    0,    0,  757,  760,  761,  761,    0,
			  761,    0,  754,  781,  756,  781,  755,  743,  757,  762,
			  762,    0,  762,  781,  755,  770,  770,    0,  770,  756,

			    0,    0,  761,  757,  760,  771,  772,  754,  767,  767,
			  767,  767,  767,  777,  762,    0,  771,  772,    0,  761,
			  770,  781,  755,    0,  777,    0,  771,  772,  770,  774,
			  774,  774,  774,  774,  777,  754,  775,  775,  775,  775,
			  775,    0,  778,    0,  771,  772,    0,  761,  776,  776,
			    0,  776,  777,  778,    0,    0,  770,  780,  780,  780,
			  780,  780,  788,  778,  784,  784,  784,  784,  784,  789,
			    0,    0,    0,  776,  785,  785,  785,  785,  785,  788,
			    0,  778,    0,  788,  792,  793,  789,    0,    0,    0,
			  789,  790,  790,  790,  790,  790,  791,  791,  791,  791,

			  791,  792,  793,    0,    0,  792,  793,  788,  794,  794,
			  794,  794,  794,    0,  789,  798,  798,  798,  798,  798,
			  799,  799,  799,  799,  799,    0,    0,    0,    0,  792,
			  793,  800,  800,  800,  800,  800,  802,  802,  802,  802,
			  802,  803,    0,  803,    0,    0,  803,  803,  803,  803,
			  803,  804,  804,  804,  804,  804,  805,  805,  805,  805,
			  805,  833,  833,    0,    0,    0,    0,  833,  833,  833,
			  833,  833,  833,    0,    0,    0,    0,    0,    0,  803,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,

			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,

			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  812,  812,    0,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			    0,  812,  812,  812,  812,  812,  813,  813,    0,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,

			  813,  813,  814,  814,  814,    0,    0,    0,    0,    0,
			    0,    0,  814,  814,    0,    0,  814,    0,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,    0,    0,  814,  814,  814,  815,  815,    0,  815,
			  815,    0,  815,  815,    0,    0,    0,    0,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,    0,    0,  815,  815,  815,  816,  816,    0,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,

			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  817,  817,    0,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  818,  818,
			    0,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,

			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			    0,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,

			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  821,  821,  821,    0,
			    0,    0,    0,  821,  821,    0,  821,  821,    0,    0,
			    0,    0,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,    0,  821,  821,  821,  821,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,

			  822,  822,  822,  822,  822,  822,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  824,  824,    0,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  825,  825,

			    0,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,    0,

			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  828,  828,    0,  828,
			  828,    0,  828,  828,  828,    0,    0,    0,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,    0,    0,  828,  828,  828,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,

			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  830,  830,  830,  836,  836,    0,    0,    0,
			    0,  836,  836,  836,  836,  836,  836,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,    0,    0,    0,    0,    0,  830,  831,  831,    0,
			  831,    0,    0,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,    0,    0,  831,  831,

			  831,  832,  832,  832,  832,  832,  832,  832,    0,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,    0,  832,  832,  832,  832,  834,  834,  834,
			    0,    0,    0,    0,  834,  834,    0,  834,  834,    0,
			    0,    0,    0,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,    0,    0,  834,  834,
			  834,  835,  835,  835,    0,    0,  835,  835,  835,  835,

			  835,  835,  835,  835,  835,  835,    0,    0,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,    0,    0,  835,  835,  835,  837,  837,  837,    0,
			    0,    0,    0,  837,  837,    0,  837,  837,    0,    0,
			    0,    0,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,    0,  837,  837,  837,  837,
			  838,  838,    0,    0,    0,    0,  838,  838,  838,  838,
			  838,  838,  839,  839,  839,  839,  839,  839,  839,  839,

			  839,    0,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  840,  840,
			    0,    0,    0,    0,  840,  840,  840,  840,  840,  840,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806, yy_Dummy>>,
			1, 2035, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   82,   83,   68,   69,    0,    0,  152,
			  236,   62,   65, 1071, 4950,   93, 1064, 1031, 1022, 4950,
			   89, 4950, 4950, 4950, 4950, 4950, 1009,   83, 1005,   92,
			  112, 4950, 4950,  988, 4950,  982,  977,  186,  115,  170,
			  255,  267,  193,  274,  278,  284,  326,  399,  337,  343,
			  364,  330,  376, 4950, 4950,  949,  478,  557,   80,  136,
			  143,   81,  152,   90,  140,  238,  284,  266,  141,  138,
			  983, 4950, 4950,  212,  298, 4950,  637,  218,  213, 4950,
			  269,  939, 4950,  358,  371,  426,  558, 4950,  102,  720,
			 4950,  375,  943, 4950,  936, 4950,  926,  803,    0,  719,

			  931,  915,  434, 4950,  375,  443,  776,  450,  819, 4950,
			 4950, 4950,  403,  457, 4950,  821,  842,  779,  847,  863,
			  868,  896,  878,  904,  908,  913,  947,  951,  924,  956,
			  994,  960,  986, 1073,  977, 1029,  995, 1035, 1063, 1052,
			 1080,  775,  903,  425,  857, 4950,  198,  875, 1130,  859,
			  257,  322,    0,  711,  341,  382,  371,  379,  401,  858,
			  457,  899,  465,  461,  543,  539,  850,  842,  568,  818,
			  805,  703,  948,  804,  700,  788,  824,  844,  860,  883,
			  906,  913,  929,  919,  938,  928,  976,  951, 1060,  958,
			  957,  971, 1018, 1021, 4950,  223, 4950,  849,  483,  307,

			 1153, 4950,  839, 1061, 4950, 1067,  783, 4950,  420, 1116,
			 1130, 1162, 4950, 1210,  124, 1266,  138,  349, 1349, 4950,
			 4950,  762, 1154, 4950, 4950, 4950,  708,  753,  739,  727,
			 1208,  717,  716,  713,  576,  575,  489, 4950, 1200, 1222,
			  544, 1227, 4950, 1266, 1282, 1295,  550, 1232, 1257, 1086,
			 1305, 1341, 1335, 1403, 1407, 1411, 1111, 1415, 1419, 1424,
			 1434, 1438, 1144, 1465, 1483, 1500, 1510, 1533, 1328, 1542,
			 1556, 1336, 1406, 1473, 1523, 1514, 1569, 1582, 1586, 1590,
			 1597, 1603, 1613, 1617,  551, 4950, 4950,  556, 1065,    0,
			 1605, 1630, 1067,    0, 1083, 1089, 1090, 1100, 1186, 1263,

			 1274, 1288, 1289,  450, 1294,  438, 1615, 1305, 1339, 1389,
			 1409, 1409, 1412, 1423, 1446, 1507,    0,    0, 1524, 1540,
			 1533, 1551, 1589, 1597, 1594, 1602, 1597, 1600,  437, 1602,
			 1609,  388,    0,    0, 1605, 1606, 1691,  434, 4950,  433,
			 1674, 1182,  783, 1455,    0,  398,  404, 4950, 4950, 4950,
			 4950, 1682, 4950, 4950, 4950, 4950, 4950, 1712, 1696, 1718,
			 1736, 1741, 1757, 1767, 1773, 1778, 1783, 1801, 1788, 1806,
			 1811, 1829, 1837, 1842, 1846, 1850, 1855, 1824, 1876, 1885,
			 1896, 1902, 1915, 1906, 1922, 1935, 1894, 1964, 1969, 2012,
			 1985, 2004, 2020, 1934, 1943, 1833, 1972, 2018, 1995, 2046,

			 2053, 1369,    0, 1617, 1618, 1641, 1642,    0, 1633, 1695,
			    0, 1695, 1697, 1808, 1836, 1837, 1887, 1901, 1909, 1925,
			 1944, 2001, 2011, 2021, 2023, 2016, 2017, 2018, 2022,    0,
			    0,    0,    0, 2020, 2037, 2041, 2026, 2042,  395,  375,
			 2097, 4950, 1686,    0, 4950, 2102, 2086, 2118, 2125,  355,
			 2146, 2130, 2152, 2162, 2167, 2172,  348, 2177, 2193, 2203,
			  289, 2175, 2203, 2219, 2224, 2233, 2239,  340, 2245, 2259,
			 2265, 2273, 2292, 2307, 2311, 2302, 2315, 2328, 2336, 2233,
			 2338, 2365, 2377, 2381, 2260, 1726, 2229, 2342,  296,  293,
			 2042, 2043, 2052, 2202, 2081, 2331,    0, 2094,    0, 2100,

			 2102, 2140,    0, 2219, 2221, 2264, 2270, 2326, 2325, 2350,
			 2341, 2353, 2356, 2358, 2356, 2364, 2374, 2375, 2433,    0,
			 2419, 2424, 2438, 2414, 2463, 2479, 2484, 2489, 2494, 2499,
			 2507, 2518, 2523, 1746, 4950, 2533, 2546, 2556, 2562, 2567,
			 2573, 2577, 2541, 2596, 2605, 2609, 2617, 2624, 2628, 2626,
			  279, 2636, 2651, 2667, 2672, 2381, 2533,  734, 4950, 4950,
			 2501, 2503, 2554, 2555, 2551,    0, 2571, 2582,    0, 2618,
			 2613, 2626, 2617, 2629, 2644, 2632, 2634, 2635, 2648, 2650,
			 2656, 2662,    0, 2652, 2669, 2669,    0, 2659, 2715,    0,
			 2693, 2720, 2732, 2742, 2765, 2747, 2770, 2737, 2786, 2791,

			  268, 2796, 2801, 2806, 4950, 2811, 2821, 2845, 2849, 2718,
			 2853, 2857, 2810, 2861, 2865, 2876, 2891, 2895, 2899, 2860,
			 2903, 2907, 2922,  258,  257, 2686, 2797, 2809,    0, 2838,
			    0, 2854,    0,    0,    0, 2843,    0,    0, 2861,    0,
			    0, 2874,    0, 2878,    0, 2896, 2894, 2898, 2901, 1257,
			  198,  165, 2930, 2947, 2954, 2959, 2966, 2976,  147,  724,
			 2986, 2410, 2991, 2996, 3001, 3025, 3029, 3034, 4950, 3038,
			 3043, 3020, 3072, 3076, 3061, 3021, 3050, 2968, 3018, 3023,
			 3047, 3052,    0,    0, 3056, 3058, 3058, 3058,    0, 3060,
			  479,  181, 3103,   88, 3108, 3120, 3125, 3130, 3135, 3142,

			 4950, 3147, 3170, 3133, 3174, 3180, 4950, 3184, 3189, 3166,
			 3168, 3067, 3061, 3136,    0,    0, 3155, 3158,    0, 3147,
			    0, 4950, 3211,   77, 3218, 3229, 3252, 3256, 3265, 3261,
			  907, 4950, 3164, 3168, 3193, 3200, 3209, 3210,  196, 3273,
			 3275, 3298, 3302, 3315, 3268, 3284, 3223,    0,    0,    0,
			    0, 3237, 3323, 3332, 3355, 3359, 3333, 3337, 3258, 3276,
			 3351, 3375, 3387,   97,   84, 3277,    0, 3388, 2453, 4950,
			 3393, 3375, 3376, 3302, 3409, 3416, 3446, 3383, 3412,    0,
			 3437, 3368,   77,   71, 3444, 3454, 2458, 4950, 3432, 3439,
			 3471, 3476, 3454, 3455, 3488, 2786, 4950, 4950, 3495, 3500,

			 3511, 4950, 3516, 3526, 3531, 3536, 4950, 3579, 3625, 3671,
			 3717, 3763, 3809, 3855, 3900, 3940, 3985, 4031, 4077, 4123,
			 4169, 4214, 4259, 4305, 4351, 4397, 4443, 4489, 4530, 4575,
			 4620, 4655, 4700, 3549, 4745, 4790, 4613, 4834, 4868, 4891,
			 4926, yy_Dummy>>)
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
			   79,   80,   65,   81,   82,   83,   84,    1,    1,    1,
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
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    1,    1,    6,    7,    1,    1,    8,    9,   10,   11,
			   12,   12,   12,   12,   13,   14,   15,   16,    1,   17,
			    1,   18,   19,   20,   21,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   40,    5,   41,   42,    5,   12,   12,
			   12,   12,   12,   12,   12,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   44,
			   45,    5,    5,   46,    5, yy_Dummy>>)
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

	yyJam_base: INTEGER is 4950
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

feature {NONE} -- Implementation

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

	tid: INTEGER

invariant

	in_buffer_not_void: in_buffer /= Void

end
