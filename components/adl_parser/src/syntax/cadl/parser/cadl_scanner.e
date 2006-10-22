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
if yy_act <= 66 then
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
if yy_act <= 50 then
if yy_act <= 42 then
if yy_act <= 38 then
if yy_act <= 36 then
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
--|#line 133 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 133")
end
last_token := SYM_MATCHES
end
else
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
end
else
if yy_act <= 40 then
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
else
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
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
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
else
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
end
else
if yy_act <= 48 then
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
else
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
end
end
end
else
if yy_act <= 58 then
if yy_act <= 54 then
if yy_act <= 52 then
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
else
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
end
else
if yy_act <= 56 then
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
else
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
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
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
else
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
end
else
if yy_act <= 64 then
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
else
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
end
end
end
end
end
else
if yy_act <= 99 then
if yy_act <= 83 then
if yy_act <= 75 then
if yy_act <= 71 then
if yy_act <= 69 then
if yy_act <= 68 then
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
else
--|#line 263 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 263")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
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
end
else
if yy_act <= 73 then
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
else
if yy_act = 74 then
--|#line 280 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 280")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 287 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 287")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
end
else
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act = 76 then
--|#line 288 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 288")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 295 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 295")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 78 then
--|#line 296 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 296")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 303 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 303")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 315 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 315")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 325 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 325")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 82 then
--|#line 330 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 330")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 340 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 340")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
end
end
else
if yy_act <= 91 then
if yy_act <= 87 then
if yy_act <= 85 then
if yy_act = 84 then
--|#line 346 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 346")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 356 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 356")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 86 then
--|#line 357 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 357")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 369 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 369")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 374 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 374")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
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
 			
end
else
if yy_act = 90 then
--|#line 419 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 419")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 424 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 424")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
if yy_act = 92 then
--|#line 429 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 429")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 434 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 434")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 94 then
--|#line 440 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 440")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 446 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 446")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 452 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 452")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 456 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 456")
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
if yy_act = 98 then
--|#line 466 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 466")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 473 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 473")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
end
end
else
if yy_act <= 115 then
if yy_act <= 107 then
if yy_act <= 103 then
if yy_act <= 101 then
if yy_act = 100 then
--|#line 478 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 478")
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
--|#line 493 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 493")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 102 then
--|#line 494 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 494")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 105 then
if yy_act = 104 then
	yy_end := yy_end - 1
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
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
--|#line 500 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 500")
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
if yy_act = 106 then
--|#line 501 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 501")
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
--|#line 521 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 521")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
end
else
if yy_act <= 111 then
if yy_act <= 109 then
if yy_act = 108 then
--|#line 525 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 525")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
end
in_buffer.append_character ('\')
end
else
if yy_act = 110 then
--|#line 532 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 532")
end
in_buffer.append_character ('"')
else
--|#line 533 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 533")
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
if yy_act <= 113 then
if yy_act = 112 then
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
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
--|#line 561 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 561")
end
in_buffer.append_string (text)
end
else
if yy_act = 114 then
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
--|#line 568 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 568")
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
if yy_act <= 123 then
if yy_act <= 119 then
if yy_act <= 117 then
if yy_act = 116 then
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 587 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 587")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 118 then
--|#line 588 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 588")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
else
if yy_act <= 121 then
if yy_act = 120 then
--|#line 590 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 590")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
else
if yy_act = 122 then
--|#line 592 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 592")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 593 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 593")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 127 then
if yy_act <= 125 then
if yy_act = 124 then
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
end
last_token := V_CHARACTER; last_character_value := '"'
else
--|#line 595 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 595")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
end
else
if yy_act = 126 then
--|#line 600 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 600")
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
--|#line 610 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 610")
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
if yy_act <= 129 then
if yy_act = 128 then
--|#line 620 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 620")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 621 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 621")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 130 then
--|#line 625 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 625")
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
			create an_array.make (0, 5072)
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
			   75,   89,   76,   76,   89,   91,  792,   91,   91,   97,

			   98,  101,  791,  102,  102,  102,  102,  102,  104,  775,
			  105,  156,  106,  106,  106,  106,  106,  112,  112,  166,
			  112,  174,  774,   80,   80,  741,  214,  214,  104,  214,
			  105,  218,  108,  108,  108,  108,  108,   77,   77,  157,
			  216,  216,  114,  216,   99,   90,  529,  167,   90,  175,
			  107,   81,   81,   82,   83,   84,   82,   83,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   85,
			  107,   82,  112,  112,  162,  112,  158,   82,   82,   82,
			   82,   82,   82,  176,  190,  219,  163,  159,  112,  112,
			  192,  112,  724,  168,  169,  112,  112,  114,  112,  170,

			  146,  117,  164,  146,  160,  458,   82,   82,   87,   82,
			  147,  177,  191,  114,  165,  161,  755,  755,  193,  196,
			  114,  171,  172,  450,  694,  201,  115,  173,  116,  117,
			  196,  122,  204,   82,   82,   82,   82,   82,   83,   84,
			   82,   83,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   85,  115,   82,  116,  112,  112,  122,
			  112,   82,   82,   82,   82,   82,   82,  197,  205,  112,
			  112,  178,  112,  202,  679,  678,  112,  112,  197,  112,
			  112,  112,  114,  112,  179,  662,  112,  112,  207,  112,
			   82,   82,   87,   82,  114,  118,  206,  290,  120,  180,

			  198,  114,  198,  198,  622,  114,  119,  538,  186,  126,
			  121,  114,  181,  187,  196,  123,  124,   82,   82,   82,
			   82,  125,  182,  118,  205,  290,  120,  127,  112,  112,
			  183,  112,  112,  112,  119,  112,  188,  126,  121,  112,
			  112,  189,  112,  123,  124,  112,  112,  107,  112,  125,
			  184,  563,  206,  114,  563,  127,  291,  114,  185,  128,
			  209,  210,  197,  209,  114,  545,  112,  112,  533,  112,
			  114,  104,  129,  210,  210,  136,  210,   91,  218,   91,
			   91,  290,  141,  137,  291,  138,  338,  128,  142,  142,
			  139,  114,  487,  142,  142,  241,  241,  241,  241,  241,

			  129,  112,  112,  136,  112,  112,  112,  140,  112,  294,
			  141,  137,  487,  138,  212,  372,  291,  296,  139,  130,
			  130,  130,  130,  130,  447,  296,  114,  212,  213,  210,
			  248,  213,  219,  131,  142,  140,  348,  142,  142,  340,
			  132,  196,  214,  215,  295,  296,  444,  133,  298,  134,
			  286,  135,  216,  297,  238,  238,  238,  238,  238,  112,
			  112,  131,  112,  243,  243,  243,  243,  243,  132,  239,
			  247,  247,  247,  247,  247,  208,  298,  134,  244,  135,
			  146,  287,  212,  146,  114,  198,  196,  198,  198,  197,
			  147,  236,  240,  236,  236,  438,  438,  239,  148,  148,

			  148,  148,  148,  149,  298,  304,  244,  305,  417,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  150,  148,
			  151,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  301,  304,  197,  305,  148,  152,  152,  153,
			  152,  152,  152,  152,  152,  152,  154,  152,  155,  152,
			  152,  152,  152,  152,  153,  152,  152,  152,  152,  146,
			  213,  210,  146,  213,  362,  362,  362,  362,  362,  147,
			  370,  370,  370,  370,  214,  417,  405,  148,  148,  148,
			  148,  148,  149,  304,  216,  305,  404,  372,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  306,  309,  307,  212,  148,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  195,  195,
			  309,  195,  195,  195,  196,  199,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  195,  197,  195,  195,  195,  200,  200,  200,  200,

			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  195,  195,
			  195,  195,  221,  221,  358,  221,  228,  357,  356,  292,
			  229,  293,  293,  293,  293,  293,  809,  809,  355,  230,
			  230,  230,  230,  230,  699,  699,  699,  309,  316,  222,
			  354,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  231,  313,  316,  112,  112,  350,
			  112,  112,  112,  232,  112,  344,  445,  349,  344,  233,
			  561,  348,  104,  234,  105,  235,  245,  245,  245,  245,

			  245,  246,  114,  223,  224,  224,  114,  224,  224,  224,
			  224,  226,  224,  224,  225,  224,  224,  224,  224,  224,
			  224,  224,  224,  112,  112,  252,  112,  285,  224,  224,
			  224,  224,  224,  224,  107,  104,  316,  105,  346,  245,
			  245,  245,  245,  245,  112,  112,  809,  112,  114,  112,
			  112,  310,  112,  252,  311,  285,  208,  224,  224,  224,
			  224,  250,  196,  196,  317,  112,  112,  312,  112,  114,
			  112,  112,  318,  112,  114,  312,  251,  107,  308,  310,
			  112,  112,  311,  112,  224,  224,  224,  224,  258,  250,
			  114,  299,  318,  320,  253,  114,  254,  300,  112,  112,

			  318,  112,  255,  258,  251,  114,  112,  112,  256,  112,
			  112,  112,  747,  112,  289,  112,  112,  321,  112,  299,
			  319,  320,  253,  114,  254,  300,  112,  112,  288,  112,
			  255,  114,  299,  145,  286,  114,  256,  237,  300,  320,
			  114,  260,  257,  236,  261,  321,  225,  321,  259,  112,
			  112,  114,  112,  112,  112,  748,  112,  265,  112,  112,
			  302,  112,  112,  112,  324,  112,  303,  322,  325,  260,
			  257,  262,  261,  324,  114,  323,  259,  325,  114,  112,
			  112,  310,  112,  114,  311,  265,  330,  114,  112,  112,
			  266,  112,  324,  330,   95,  263,  325,  112,  112,  264,

			  112,  326,   92,  334,  114,  327,  208,  194,  273,  314,
			  145,  131,  315,  114,  330,  328,  111,  334,  266,  329,
			  131,  333,  114,  263,  110,  273,  109,  264,  267,  103,
			  278,  334,  268,  279,  273,  269,  134,  112,  112,  131,
			  112,  270,  113,  328,  271,  335,  272,  329,  131,  113,
			  113,  113,  113,  113,  112,  112,  267,  112,  278,  100,
			  268,  279,  114,  269,  134,  112,  112,   95,  112,  270,
			  336,   93,  271,  336,  272,  112,  112,  273,  112,  114,
			  204,  113,  112,  112,  280,  112,  207,  283,  112,  112,
			  114,  112,   92,  274,  274,  274,  274,  274,  336,  328,

			  114,  337,  281,  329,  809,  809,  282,  114,  406,  113,
			  406,  275,  280,  114,  276,  283,  205,  408,  209,  210,
			  277,  209,  205,  408,  809,  410,  284,  331,  809,  809,
			  281,  332,  210,  210,  282,  210,  406,  809,  407,  275,
			  411,  380,  276,  809,  206,  408,  112,  112,  277,  112,
			  206,  409,  380,  410,  284,  809,  345,  345,  809,  345,
			  809,  195,  380,  809,  213,  210,  809,  213,  411,  809,
			  809,  114,  212,  200,  200,  200,  200,  200,  214,  339,
			  380,  809,  809,  222,  210,  210,  212,  210,  216,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  200,  213,  210,  809,  213,  809,  809,  212,  351,
			  359,  359,  359,  359,  359,  809,  214,  352,  353,  353,
			  353,  353,  353,  412,  809,  239,  216,  360,  212,  360,
			  809,  809,  361,  361,  361,  361,  361,  363,  363,  363,
			  363,  363,  371,  371,  371,  371,  371,  809,  240,  112,
			  112,  412,  112,  239,  196,  809,  212,  341,  342,  343,
			  341,  342,  341,  341,  341,  341,  341,  341,  341,  341,
			  341,  341,  214,  693,  114,  341,  364,  364,  364,  364,
			  364,  341,  344,  341,  341,  341,  341,  367,  410,  367,

			  373,  365,  368,  368,  368,  368,  368,  112,  112,  809,
			  112,  104,  197,  105,  411,  369,  369,  369,  369,  369,
			  341,  341,  212,  341,  366,  809,  413,  809,  373,  365,
			  112,  112,  114,  112,  809,  412,  416,  112,  112,  374,
			  112,  416,  414,  112,  112,  419,  112,  341,  341,  341,
			  341,  221,  221,  107,  221,  114,  113,  113,  113,  113,
			  113,  809,  114,  415,  416,  809,  809,  374,  114,  418,
			  809,  488,  488,  419,  489,  376,  375,  809,  222,  420,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  376,  375,  112,  112,  420,  112,  112,
			  112,  809,  112,  112,  112,  809,  112,  112,  112,  809,
			  112,  112,  112,  809,  112,  809,  112,  112,  421,  112,
			  114,  809,  223,  809,  114,  809,  112,  112,  114,  112,
			  112,  112,  114,  112,  394,  809,  114,  395,  422,  419,
			  377,  114,  420,  396,  378,  381,  421,  345,  345,  382,
			  345,  114,  421,  383,  809,  114,  809,  112,  112,  379,
			  112,  385,  394,  384,  809,  395,  422,  423,  377,  426,
			  424,  396,  378,  381,  809,  112,  112,  382,  112,  809,
			  425,  383,  114,  113,  113,  113,  113,  113,  809,  385,

			  809,  384,  112,  112,  809,  112,  809,  426,  809,  809,
			  114,  113,  112,  112,  386,  112,  112,  112,  387,  112,
			  388,  388,  388,  388,  388,  112,  112,  114,  112,  809,
			  390,  390,  390,  390,  390,  112,  112,  114,  112,  113,
			  426,  114,  386,  809,  112,  112,  387,  112,  389,  809,
			  114,  809,  809,  391,  391,  391,  391,  391,  112,  112,
			  114,  112,  392,  392,  392,  392,  392,  809,  427,  114,
			  277,  112,  112,  428,  112,  429,  393,  393,  393,  393,
			  393,  389,  428,  114,  112,  112,  429,  112,  112,  112,
			  389,  112,  112,  112,  809,  112,  114,  809,  277,  112,

			  112,  428,  112,  429,  389,  112,  112,  398,  112,  114,
			  430,  397,  809,  114,  431,  112,  112,  114,  112,  112,
			  112,  399,  112,  292,  114,  292,  292,  292,  292,  292,
			  114,  432,  433,  809,  289,  400,  432,  433,  809,  397,
			  114,  809,  436,  401,  114,  380,  437,  436,  292,  399,
			  293,  293,  293,  293,  293,  437,  380,  441,  441,  432,
			  433,  402,  809,  400,  434,  435,  380,  491,  491,  403,
			  436,  401,  809,  809,  437,  439,  342,  343,  809,  342,
			  493,  493,  495,  440,  380,  441,  442,  809,  216,  216,
			  214,  216,  809,  351,  809,  491,  492,  403,  196,  809,

			  344,  352,  353,  353,  353,  353,  353,  809,  493,  494,
			  495,  443,  443,  443,  443,  443,  361,  361,  361,  361,
			  361,  809,  443,  443,  443,  443,  443,  443,  488,  488,
			  212,  488,  448,  448,  448,  448,  448,  809,  449,  449,
			  449,  449,  449,  496,  495,  496,  197,  239,  809,  443,
			  443,  443,  443,  443,  443,  443,  451,  451,  451,  451,
			  451,  452,  452,  452,  452,  452,  606,  606,  606,  606,
			  240,  496,  497,  498,  809,  239,  450,  453,  453,  453,
			  453,  453,  454,  809,  454,  809,  809,  455,  455,  455,
			  455,  455,  365,  456,  456,  456,  456,  456,  368,  368,

			  368,  368,  368,  457,  457,  457,  457,  457,  462,  462,
			  462,  462,  462,  112,  112,  366,  112,  809,  459,  460,
			  365,  461,  461,  461,  461,  461,  463,  463,  463,  463,
			  463,  112,  112,  809,  112,  809,  809,  809,  114,  112,
			  112,  458,  112,  499,  112,  112,  809,  112,  112,  112,
			  809,  112,  112,  112,  470,  112,  114,  112,  112,  809,
			  112,  464,  809,  482,  114,  470,  809,  500,  465,  114,
			  809,  499,  499,  114,  482,  470,  809,  114,  112,  112,
			  809,  112,  114,  809,  482,  468,  469,  112,  112,  464,
			  112,  466,  809,  470,  467,  500,  465,  809,  112,  112,

			  501,  112,  482,  114,  112,  112,  809,  112,  112,  112,
			  809,  112,  114,  468,  469,  471,  809,  112,  112,  466,
			  112,  809,  467,  114,  112,  112,  502,  112,  809,  114,
			  809,  809,  113,  114,  472,  113,  112,  112,  473,  112,
			  809,  113,  114,  471,  474,  112,  112,  809,  112,  114,
			  503,  504,  476,  475,  502,  388,  388,  388,  388,  388,
			  113,  114,  472,  113,  809,  809,  473,  505,  477,  113,
			  114,  809,  474,  268,  112,  112,  478,  112,  503,  504,
			  476,  475,  270,  502,  390,  390,  390,  390,  390,  391,
			  391,  391,  391,  391,  809,  505,  477,  112,  112,  114,

			  112,  268,  113,  267,  478,  393,  393,  393,  393,  393,
			  270,  506,  809,  809,  112,  112,  809,  112,  809,  271,
			  112,  112,  114,  112,  480,  480,  480,  480,  480,  484,
			  113,  267,  392,  392,  392,  392,  392,  113,  113,  114,
			  481,  481,  481,  481,  481,  114,  479,  271,  112,  112,
			  503,  112,  809,  504,  113,  112,  112,  484,  112,  509,
			  809,  509,  511,  512,  511,  113,  113,  483,  512,  515,
			  487,  516,  517,  114,  479,  515,  516,  485,  507,  809,
			  114,  508,  113,  518,  564,  564,  566,  509,  486,  510,
			  511,  512,  513,  809,  809,  483,  514,  515,  809,  516,

			  517,  809,  809,  519,  520,  485,  524,  524,  524,  524,
			  524,  518,  564,  565,  566,  566,  486,  521,  521,  521,
			  521,  521,  448,  448,  448,  448,  448,  809,  521,  521,
			  521,  521,  521,  521,  572,  573,  574,  523,  525,  525,
			  525,  525,  525,  569,  450,  526,  526,  526,  526,  526,
			  455,  455,  455,  455,  455,  521,  521,  521,  521,  521,
			  521,  521,  572,  573,  574,  523,  527,  527,  527,  527,
			  527,  809,  528,  528,  528,  528,  528,  112,  112,  575,
			  112,  365,  530,  530,  530,  530,  530,  531,  531,  531,
			  531,  531,  532,  532,  532,  532,  532,  527,  527,  527,

			  527,  527,  114,  809,  366,  112,  112,  575,  112,  365,
			  529,  460,  534,  461,  461,  461,  461,  461,  535,  809,
			  535,  112,  112,  809,  112,  458,  112,  112,  536,  112,
			  114,  488,  488,  539,  489,  112,  112,  567,  112,  809,
			  534,  112,  112,  809,  112,  540,  114,  112,  112,  568,
			  112,  114,  809,  541,  573,  574,  537,  809,  809,  542,
			  114,  112,  112,  553,  112,  567,  114,  112,  112,  809,
			  112,  543,  114,  540,  553,  112,  112,  568,  112,  544,
			  546,  541,  576,  577,  553,  561,  114,  542,  809,  809,
			  558,  809,  114,  547,  112,  112,  809,  112,  809,  543,

			  114,  558,  553,  575,  548,  579,  809,  544,  546,  112,
			  112,  559,  112,  112,  112,  809,  112,  112,  112,  114,
			  112,  547,  552,  552,  552,  552,  552,  549,  809,  558,
			  809,  578,  548,  579,  114,  809,  113,  809,  114,  809,
			  112,  112,  114,  112,  809,  809,  551,  560,  480,  480,
			  480,  480,  480,  550,  809,  549,  481,  481,  481,  481,
			  481,  579,  113,  389,  113,  114,  567,  112,  112,  395,
			  112,  581,  809,  554,  551,  396,  809,  113,  568,  112,
			  112,  550,  112,  112,  112,  582,  112,  581,  582,  580,
			  113,  585,  114,  586,  570,  809,  809,  395,  562,  581,

			  555,  554,  587,  396,  114,  113,  571,  588,  114,  585,
			  586,  626,  809,  582,  809,  583,  584,  809,  809,  585,
			  809,  586,  626,  556,  557,  701,  702,  701,  555,  809,
			  587,  809,  627,  809,  593,  588,  593,  589,  590,  594,
			  594,  594,  594,  594,  594,  594,  594,  594,  594,  596,
			  626,  556,  557,  591,  591,  591,  591,  591,  595,  595,
			  595,  595,  595,  703,  591,  591,  591,  591,  591,  591,
			  809,  809,  240,  778,  778,  778,  778,  596,  794,  794,
			  794,  794,  450,  527,  527,  527,  527,  527,  809,  809,
			  809,  591,  591,  591,  591,  591,  591,  591,  597,  598,

			  598,  598,  598,  598,  599,  599,  599,  599,  599,  600,
			  600,  600,  600,  600,  601,  601,  601,  601,  601,  602,
			  602,  602,  602,  602,  809,  809,  597,  603,  603,  603,
			  603,  603,  628,  604,  629,  604,  809,  529,  601,  601,
			  601,  601,  601,  605,  605,  605,  605,  605,  112,  112,
			  809,  112,  458,  608,  608,  608,  608,  608,  112,  112,
			  628,  112,  629,  627,  112,  112,  809,  112,  609,  112,
			  112,  615,  112,  114,  627,  112,  112,  610,  112,  112,
			  112,  809,  112,  114,  627,  629,  809,  611,  615,  114,
			  631,  809,  615,  632,  114,  809,  609,  612,  112,  112,

			  114,  112,  627,  809,  114,  610,  631,  112,  112,  613,
			  112,  112,  112,  630,  112,  611,  615,  614,  631,  112,
			  112,  632,  112,  114,  632,  612,  112,  112,  809,  112,
			  112,  112,  114,  112,  633,  809,  114,  613,  112,  112,
			  617,  112,  809,  616,  114,  614,  552,  552,  552,  552,
			  552,  114,  634,  112,  112,  114,  112,  618,  635,  620,
			  636,  637,  621,  114,  619,  638,  809,  113,  617,  112,
			  112,  616,  112,  270,  112,  112,  636,  112,  114,  637,
			  638,  642,  642,  644,  645,  618,  635,  620,  636,  637,
			  621,  644,  619,  638,  114,  113,  645,  623,  648,  114,

			  624,  270,  649,  650,  639,  648,  625,  640,  641,  642,
			  643,  644,  645,  594,  594,  594,  594,  594,  809,  646,
			  112,  112,  809,  112,  647,  623,  648,  809,  624,  809,
			  649,  650,  680,  651,  625,  652,  652,  652,  652,  652,
			  594,  594,  594,  594,  594,  114,  652,  652,  652,  652,
			  652,  652,  654,  654,  654,  654,  654,  655,  809,  655,
			  680,  809,  656,  656,  656,  656,  656,  658,  658,  658,
			  658,  658,  660,  652,  652,  652,  652,  652,  652,  652,
			  657,  809,  657,  809,  809,  658,  658,  658,  658,  658,
			  659,  659,  659,  659,  659,  366,  809,  809,  809,  809,

			  660,  802,  803,  802,  809,  529,  601,  601,  601,  601,
			  601,  661,  661,  661,  661,  661,  601,  601,  601,  601,
			  601,  663,  663,  663,  663,  663,  664,  664,  664,  664,
			  664,  665,  665,  665,  665,  665,  666,  681,  666,  804,
			  671,  667,  667,  667,  667,  667,  660,  112,  112,  681,
			  112,  112,  112,  809,  112,  112,  112,  671,  112,  112,
			  112,  671,  112,  112,  112,  681,  112,  112,  112,  366,
			  112,  683,  114,  809,  660,  809,  114,  682,  112,  112,
			  114,  112,  809,  809,  114,  671,  670,  683,  114,  669,
			  674,  668,  114,  112,  112,  685,  112,  112,  112,  683,

			  112,  112,  112,  114,  112,  112,  112,  674,  112,  112,
			  112,  674,  112,  685,  670,  684,  687,  669,  114,  668,
			  687,  809,  114,  685,  112,  112,  114,  112,  672,  809,
			  114,  689,  690,  691,  114,  674,  689,  673,  675,  809,
			  809,  686,  809,  809,  687,  676,  809,  809,  688,  114,
			  656,  656,  656,  656,  656,  809,  672,  677,  809,  689,
			  690,  691,  809,  809,  692,  673,  675,  695,  695,  695,
			  695,  695,  809,  676,  658,  658,  658,  658,  658,  658,
			  658,  658,  658,  658,  809,  677,  696,  696,  696,  696,
			  696,  697,  809,  697,  809,  809,  698,  698,  698,  698, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  698,  714,  809,  809,  809,  450,  700,  700,  700,  700,
			  700,  600,  600,  600,  600,  600,  667,  667,  667,  667,
			  667,  704,  704,  704,  704,  704,  660,  112,  112,  714,
			  112,  112,  112,  809,  112,  809,  112,  112,  809,  112,
			  112,  112,  809,  112,  809,  112,  112,  809,  112,  366,
			  709,  712,  114,  809,  660,  712,  114,  715,  705,  458,
			  809,  114,  715,  112,  112,  114,  112,  709,  706,  707,
			  114,  709,  712,  809,  112,  112,  708,  112,  112,  112,
			  713,  112,  717,  712,  713,  715,  705,  717,  114,  719,
			  716,  719,  721,  722,  721,  709,  706,  707,  809,  114,

			  809,  713,  809,  114,  708,  735,  710,  809,  809,  736,
			  717,  711,  713,  809,  809,  718,  809,  719,  809,  720,
			  721,  722,  723,  654,  654,  654,  654,  654,  698,  698,
			  698,  698,  698,  735,  710,  112,  112,  736,  112,  711,
			  725,  725,  725,  725,  725,  726,  726,  726,  726,  726,
			  537,  537,  537,  537,  537,  727,  727,  727,  727,  727,
			  114,  450,  728,  728,  728,  728,  728,  661,  661,  661,
			  661,  661,  112,  112,  809,  112,  112,  112,  529,  112,
			  809,  730,  112,  112,  736,  112,  112,  112,  809,  112,
			  738,  112,  112,  738,  112,  740,  733,  114,  734,  749,

			  733,  114,  734,  809,  809,  458,  809,  114,  729,  730,
			  809,  114,  737,  809,  809,  731,  114,  733,  738,  734,
			  750,  739,  809,  740,  809,  809,  809,  749,  733,  809,
			  734,  696,  696,  696,  696,  696,  729,  732,  742,  742,
			  742,  742,  742,  731,  701,  750,  701,  752,  750,  728,
			  728,  728,  728,  728,  112,  112,  752,  112,  112,  112,
			  809,  112,  754,  112,  112,  732,  112,  112,  112,  529,
			  112,  761,  809,  751,  809,  752,  809,  112,  112,  114,
			  112,  762,  703,  114,  753,  809,  809,  743,  114,  809,
			  754,  809,  114,  756,  756,  756,  756,  756,  759,  761,

			  112,  112,  114,  112,  112,  112,  759,  112,  744,  762,
			  768,  769,  745,  746,  760,  743,  809,  112,  112,  759,
			  112,  776,  760,  757,  809,  114,  809,  809,  809,  114,
			  809,  809,  809,  809,  759,  760,  744,  782,  768,  769,
			  745,  746,  114,  763,  763,  763,  763,  763,  809,  776,
			  760,  757,  703,  703,  703,  703,  703,  112,  112,  758,
			  112,  112,  112,  766,  112,  782,  770,  767,  770,  809,
			  809,  766,  809,  809,  809,  767,  771,  112,  112,  809,
			  112,  809,  114,  788,  766,  788,  114,  758,  767,  112,
			  112,  809,  112,  789,  765,  112,  112,  809,  112,  766,

			  809,  809,  114,  767,  772,  780,  781,  764,  777,  777,
			  777,  777,  777,  785,  114,  809,  780,  781,  809,  773,
			  114,  790,  765,  809,  785,  809,  780,  781,  779,  783,
			  783,  783,  783,  783,  785,  764,  784,  784,  784,  784,
			  784,  809,  786,  809,  780,  781,  809,  773,  112,  112,
			  809,  112,  785,  786,  809,  809,  779,  787,  787,  787,
			  787,  787,  795,  786,  772,  772,  772,  772,  772,  796,
			  809,  809,  809,  114,  793,  793,  793,  793,  793,  795,
			  809,  786,  809,  795,  799,  800,  796,  809,  809,  809,
			  796,  797,  797,  797,  797,  797,  798,  798,  798,  798,

			  798,  799,  800,  809,  809,  799,  800,  795,  801,  801,
			  801,  801,  801,  809,  796,  790,  790,  790,  790,  790,
			  805,  805,  805,  805,  805,  809,  809,  809,  809,  799,
			  800,  806,  806,  806,  806,  806,  807,  807,  807,  807,
			  807,  802,  809,  802,  809,  809,  806,  806,  806,  806,
			  806,  808,  808,  808,  808,  808,  804,  804,  804,  804,
			  804,  446,  446,  809,  809,  809,  809,  446,  446,  446,
			  446,  446,  446,  809,  809,  809,  809,  809,  809,  804,
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
			   94,   94,  809,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  809,   94,   94,   94,   94,   94,   96,   96,  809,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,  113,  113,  113,  809,  809,  809,  809,  809,
			  809,  809,  113,  113,  809,  809,  113,  809,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  809,  809,  113,  113,  113,  143,  143,  809,  143,
			  143,  809,  143,  143,  809,  809,  809,  809,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  809,  809,  143,  143,  143,  144,  144,  809,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,

			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  195,  195,  809,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  197,  197,
			  809,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,

			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  809,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,

			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  211,  211,  211,  809,
			  809,  809,  809,  211,  211,  809,  211,  211,  809,  809,
			  809,  809,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  809,  211,  211,  211,  211,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,

			  217,  217,  217,  217,  217,  217,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  224,  224,  809,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  227,  227,

			  809,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  809,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  249,  809,  809,  809,
			  249,  249,  809,  809,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  809,
			  809,  249,  249,  249,  142,  142,  809,  142,  142,  809,
			  142,  142,  142,  809,  809,  809,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,

			  142,  142,  142,  142,  142,  142,  142,  142,  142,  809,
			  809,  142,  142,  142,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  223,  223,  223,  522,  522,  809,  809,  809,  809,  522,
			  522,  522,  522,  522,  522,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  809,

			  809,  809,  809,  809,  223,  347,  347,  809,  347,  809,
			  809,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  809,  809,  347,  347,  347,  341,
			  341,  341,  341,  341,  341,  341,  809,  341,  341,  341,
			  341,  341,  341,  341,  341,  341,  341,  341,  341,  341,
			  341,  341,  341,  341,  341,  341,  341,  341,  341,  341,
			  341,  341,  341,  341,  341,  341,  341,  341,  341,  341,
			  809,  341,  341,  341,  341,  490,  490,  490,  809,  809,
			  809,  809,  490,  490,  809,  490,  490,  809,  809,  809,

			  809,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  809,  809,  490,  490,  490,  405,
			  405,  405,  809,  809,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  809,  809,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  809,
			  809,  405,  405,  405,  560,  560,  560,  809,  809,  809,
			  809,  560,  560,  809,  560,  560,  809,  809,  809,  809,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,

			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  809,  560,  560,  560,  560,  592,  592,
			  809,  809,  809,  809,  592,  592,  592,  592,  592,  592,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  809,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  653,  653,  809,  809,
			  809,  809,  653,  653,  653,  653,  653,  653,   13,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809, yy_Dummy>>,
			1, 2073, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5072)
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
			    4,   11,    3,    4,   12,   15,  786,   15,   15,   20,

			   20,   27,  785,   27,   27,   27,   27,   27,   29,  767,
			   29,   58,   29,   29,   29,   29,   29,   38,   38,   61,
			   38,   63,  766,    5,    6,  726,  214,  214,   30,  214,
			   30,   88,   30,   30,   30,   30,   30,    3,    4,   58,
			  216,  216,   38,  216,   20,   11,  696,   61,   12,   63,
			   29,    5,    6,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			   30,    9,   39,   39,   60,   39,   59,    9,    9,    9,
			    9,    9,    9,   64,   68,   88,   60,   59,   37,   37,
			   69,   37,  694,   62,   62,   42,   42,   39,   42,   62,

			  146,   39,   60,  146,   59,  661,    9,    9,    9,    9,
			  146,   64,   68,   37,   60,   59,  741,  741,   69,   73,
			   42,   62,   62,  654,  653,   77,   37,   62,   37,   39,
			  195,   42,   78,    9,    9,    9,    9,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   37,   10,   37,   40,   40,   42,
			   40,   10,   10,   10,   10,   10,   10,   73,   78,   41,
			   41,   65,   41,   77,  627,  626,   43,   43,  195,   43,
			   44,   44,   40,   44,   65,  603,   45,   45,   80,   45,
			   10,   10,   10,   10,   41,   40,   78,  150,   41,   65,

			   74,   43,   74,   74,  553,   44,   40,  463,   67,   44,
			   41,   45,   65,   67,  199,   43,   43,   10,   10,   10,
			   10,   43,   66,   40,   80,  150,   41,   45,   46,   46,
			   66,   46,   51,   51,   40,   51,   67,   44,   41,   48,
			   48,   67,   48,   43,   43,   49,   49,  463,   49,   43,
			   66,  492,   80,   46,  491,   45,  151,   51,   66,   46,
			   83,   83,  199,   83,   48,  470,   50,   50,  459,   50,
			   49,  452,   46,   84,   84,   48,   84,   91,  217,   91,
			   91,  154,   51,   48,  151,   49,  199,   46,   52,   52,
			   49,   50,  442,   52,   52,  104,  104,  104,  104,  104,

			   46,   47,   47,   48,   47,  112,  112,   50,  112,  154,
			   51,   48,  441,   49,   83,  372,  155,  156,   49,   47,
			   47,   47,   47,   47,  348,  157,   47,   84,   85,   85,
			  112,   85,  217,   47,   52,   50,  347,  143,  143,  208,
			   47,  339,   85,   85,  155,  156,  341,   47,  158,   47,
			  143,   47,   85,  157,  102,  102,  102,  102,  102,  113,
			  113,   47,  113,  105,  105,  105,  105,  105,   47,  102,
			  107,  107,  107,  107,  107,  208,  158,   47,  105,   47,
			   56,  143,   85,   56,  113,  198,  693,  198,  198,  339,
			   56,  236,  102,  236,  236,  333,  330,  102,   56,   56,

			   56,   56,   56,   56,  160,  162,  105,  163,  307,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,  160,  162,  693,  163,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   57,
			   86,   86,   57,   86,  240,  240,  240,  240,  240,   57,
			  246,  246,  246,  246,   86,  305,  289,   57,   57,   57,
			   57,   57,   57,  164,   86,  165,  286,  249,   57,   57,
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
			   76,   76,   89,   89,  235,   89,   99,  234,  233,  153,
			   99,  153,  153,  153,  153,  153,  560,  560,  232,   99,
			   99,   99,   99,   99,  662,  662,  662,  171,  174,   89,
			  231,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   99,  171,  174,  141,  141,  229,
			  141,  117,  117,   99,  117,  344,  344,  228,  344,   99,
			  560,  227,  106,   99,  106,   99,  106,  106,  106,  106,

			  106,  106,  141,   89,   97,   97,  117,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,  115,  115,  117,  115,  141,   97,   97,
			   97,   97,   97,   97,  106,  108,  175,  108,  226,  108,
			  108,  108,  108,  108,  116,  116,  221,  116,  115,  118,
			  118,  169,  118,  117,  169,  141,  206,   97,   97,   97,
			   97,  115,  202,  197,  175,  119,  119,  173,  119,  116,
			  120,  120,  176,  120,  118,  170,  116,  108,  167,  169,
			  122,  122,  169,  122,   97,   97,   97,   97,  166,  115,
			  119,  159,  177,  178,  118,  120,  119,  159,  121,  121,

			  176,  121,  119,  122,  116,  122,  123,  123,  120,  123,
			  124,  124,  733,  124,  149,  125,  125,  179,  125,  159,
			  177,  178,  118,  121,  119,  159,  128,  128,  147,  128,
			  119,  123,  161,  144,  142,  124,  120,  101,  161,  180,
			  125,  124,  121,  100,  124,  179,   96,  181,  123,  126,
			  126,  128,  126,  127,  127,  733,  127,  128,  129,  129,
			  161,  129,  131,  131,  182,  131,  161,  180,  183,  124,
			  121,  125,  124,  184,  126,  181,  123,  185,  127,  134,
			  134,  172,  134,  129,  172,  128,  187,  131,  132,  132,
			  129,  132,  182,  189,   94,  126,  183,  136,  136,  127,

			  136,  184,   92,  190,  134,  185,   81,   70,  131,  172,
			   55,  134,  172,  132,  187,  186,   36,  191,  129,  186,
			  132,  189,  136,  126,   35,  134,   33,  127,  130,   28,
			  136,  190,  130,  136,  132,  130,  132,  137,  137,  134,
			  137,  130,  130,  186,  130,  191,  130,  186,  132,  135,
			  135,  135,  135,  135,  139,  139,  130,  139,  136,   26,
			  130,  136,  137,  130,  132,  138,  138,   18,  138,  130,
			  192,   17,  130,  193,  130,  133,  133,  135,  133,  139,
			  203,  135,  140,  140,  137,  140,  205,  139,  251,  251,
			  138,  251,   16,  133,  133,  133,  133,  133,  192,  188,

			  133,  193,  138,  188,   13,    0,  138,  140,  290,  135,
			  294,  133,  137,  251,  133,  139,  203,  296,  209,  209,
			  133,  209,  205,  297,    0,  298,  140,  188,    0,    0,
			  138,  188,  210,  210,  138,  210,  290,    0,  294,  133,
			  299,  258,  133,    0,  203,  296,  264,  264,  133,  264,
			  205,  297,  258,  298,  140,  148,  222,  222,    0,  222,
			    0,  200,  258,    0,  211,  211,    0,  211,  299,    0,
			    0,  264,  209,  200,  200,  200,  200,  200,  211,  200,
			  258,    0,    0,  222,  343,  343,  210,  343,  211,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  200,  213,  213,    0,  213,    0,    0,  211,  230,
			  238,  238,  238,  238,  238,    0,  213,  230,  230,  230,
			  230,  230,  230,  300,    0,  238,  213,  239,  343,  239,
			    0,    0,  239,  239,  239,  239,  239,  241,  241,  241,
			  241,  241,  247,  247,  247,  247,  247,    0,  238,  250,
			  250,  300,  250,  238,  652,    0,  213,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  652,  250,  215,  243,  243,  243,  243,
			  243,  215,  215,  215,  215,  215,  215,  244,  301,  244,

			  250,  243,  244,  244,  244,  244,  244,  252,  252,    0,
			  252,  245,  652,  245,  302,  245,  245,  245,  245,  245,
			  215,  215,  215,  215,  243,    0,  301,    0,  250,  243,
			  270,  270,  252,  270,    0,  303,  304,  254,  254,  252,
			  254,  306,  302,  253,  253,  309,  253,  215,  215,  215,
			  215,  218,  218,  245,  218,  270,  273,  273,  273,  273,
			  273,    0,  254,  303,  304,    0,    0,  252,  253,  306,
			    0,  404,  404,  309,  404,  254,  253,    0,  218,  310,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  254,  253,  255,  255,  310,  255,  256,
			  256,    0,  256,  257,  257,    0,  257,  259,  259,    0,
			  259,  260,  260,    0,  260,    0,  261,  261,  311,  261,
			  255,    0,  218,    0,  256,    0,  262,  262,  257,  262,
			  263,  263,  259,  263,  274,    0,  260,  274,  312,  313,
			  255,  261,  314,  274,  256,  259,  311,  345,  345,  260,
			  345,  262,  315,  261,    0,  263,    0,  265,  265,  257,
			  265,  263,  274,  262,    0,  274,  312,  313,  255,  316,
			  314,  274,  256,  259,  345,  266,  266,  260,  266,    0,
			  315,  261,  265,  275,  275,  275,  275,  275,    0,  263,

			    0,  262,  267,  267,    0,  267,    0,  316,    0,    0,
			  266,  275,  268,  268,  265,  268,  277,  277,  266,  277,
			  267,  267,  267,  267,  267,  276,  276,  267,  276,    0,
			  268,  268,  268,  268,  268,  269,  269,  268,  269,  275,
			  317,  277,  265,    0,  271,  271,  266,  271,  267,    0,
			  276,    0,    0,  269,  269,  269,  269,  269,  272,  272,
			  269,  272,  271,  271,  271,  271,  271,    0,  317,  271,
			  276,  278,  278,  320,  278,  321,  272,  272,  272,  272,
			  272,  269,  322,  272,  279,  279,  323,  279,  280,  280,
			  271,  280,  281,  281,    0,  281,  278,    0,  276,  282,

			  282,  320,  282,  321,  272,  283,  283,  279,  283,  279,
			  322,  278,    0,  280,  323,  284,  284,  281,  284,  285,
			  285,  280,  285,  292,  282,  292,  292,  292,  292,  292,
			  283,  324,  325,    0,  308,  281,  326,  327,    0,  278,
			  284,    0,  328,  282,  285,  308,  329,  331,  293,  280,
			  293,  293,  293,  293,  293,  332,  308,  336,  337,  324,
			  325,  283,    0,  281,  326,  327,  308,  406,  407,  285,
			  328,  282,    0,    0,  329,  331,  342,  342,    0,  342,
			  408,  409,  411,  332,  308,  336,  337,    0,  445,  445,
			  342,  445,    0,  353,    0,  406,  407,  285,  338,    0,

			  342,  353,  353,  353,  353,  353,  353,    0,  408,  409,
			  411,  338,  338,  338,  338,  338,  360,  360,  360,  360,
			  360,    0,  338,  338,  338,  338,  338,  338,  488,  488,
			  342,  488,  359,  359,  359,  359,  359,    0,  361,  361,
			  361,  361,  361,  412,  414,  415,  338,  359,    0,  338,
			  338,  338,  338,  338,  338,  338,  362,  362,  362,  362,
			  362,  363,  363,  363,  363,  363,  536,  536,  536,  536,
			  359,  412,  414,  415,    0,  359,  361,  364,  364,  364,
			  364,  364,  365,    0,  365,    0,    0,  365,  365,  365,
			  365,  365,  364,  366,  366,  366,  366,  366,  367,  367,

			  367,  367,  367,  368,  368,  368,  368,  368,  370,  370,
			  370,  370,  370,  373,  373,  364,  373,    0,  369,  369,
			  364,  369,  369,  369,  369,  369,  371,  371,  371,  371,
			  371,  374,  374,    0,  374,    0,    0,    0,  373,  375,
			  375,  368,  375,  416,  376,  376,    0,  376,  377,  377,
			    0,  377,  378,  378,  380,  378,  374,  379,  379,    0,
			  379,  373,    0,  398,  375,  380,    0,  417,  374,  376,
			    0,  416,  418,  377,  398,  380,    0,  378,  381,  381,
			    0,  381,  379,    0,  398,  378,  379,  382,  382,  373,
			  382,  376,    0,  380,  377,  417,  374,    0,  383,  383,

			  418,  383,  398,  381,  384,  384,    0,  384,  386,  386,
			    0,  386,  382,  378,  379,  381,    0,  385,  385,  376,
			  385,    0,  377,  383,  387,  387,  419,  387,    0,  384,
			    0,    0,  389,  386,  382,  389,  396,  396,  383,  396,
			    0,  389,  385,  381,  384,  397,  397,    0,  397,  387,
			  420,  421,  386,  385,  419,  388,  388,  388,  388,  388,
			  389,  396,  382,  389,    0,    0,  383,  422,  387,  389,
			  397,    0,  384,  388,  399,  399,  388,  399,  420,  421,
			  386,  385,  388,  423,  390,  390,  390,  390,  390,  391,
			  391,  391,  391,  391,    0,  422,  387,  401,  401,  399,

			  401,  388,  390,  391,  388,  393,  393,  393,  393,  393,
			  388,  423,    0,    0,  392,  392,    0,  392,    0,  391,
			  400,  400,  401,  400,  394,  394,  394,  394,  394,  401,
			  390,  391,  392,  392,  392,  392,  392,  393,  394,  392,
			  395,  395,  395,  395,  395,  400,  392,  391,  402,  402,
			  424,  402,    0,  425,  395,  403,  403,  401,  403,  426,
			    0,  427,  428,  429,  430,  393,  394,  400,  431,  436,
			  403,  437,  438,  402,  392,  439,  440,  402,  424,    0,
			  403,  425,  395,  438,  493,  494,  495,  426,  402,  427,
			  428,  429,  430,    0,    0,  400,  431,  436,    0,  437,

			  438,    0,    0,  439,  440,  402,  449,  449,  449,  449,
			  449,  438,  493,  494,  495,  497,  402,  443,  443,  443,
			  443,  443,  448,  448,  448,  448,  448,    0,  443,  443,
			  443,  443,  443,  443,  500,  502,  503,  448,  450,  450,
			  450,  450,  450,  497,  449,  451,  451,  451,  451,  451,
			  454,  454,  454,  454,  454,  443,  443,  443,  443,  443,
			  443,  443,  500,  502,  503,  448,  453,  453,  453,  453,
			  453,    0,  455,  455,  455,  455,  455,  464,  464,  504,
			  464,  453,  456,  456,  456,  456,  456,  457,  457,  457,
			  457,  457,  458,  458,  458,  458,  458,  460,  460,  460,

			  460,  460,  464,    0,  453,  465,  465,  504,  465,  453,
			  455,  461,  460,  461,  461,  461,  461,  461,  462,    0,
			  462,  466,  466,    0,  466,  457,  467,  467,  462,  467,
			  465,  489,  489,  464,  489,  468,  468,  496,  468,    0,
			  460,  469,  469,    0,  469,  465,  466,  471,  471,  496,
			  471,  467,    0,  466,  506,  507,  462,    0,    0,  467,
			  468,  472,  472,  482,  472,  496,  469,  473,  473,    0,
			  473,  467,  471,  465,  482,  474,  474,  496,  474,  469,
			  471,  466,  506,  507,  482,  489,  472,  467,    0,    0,
			  487,    0,  473,  472,  475,  475,    0,  475,    0,  467,

			  474,  487,  482,  508,  473,  509,    0,  469,  471,  476,
			  476,  487,  476,  477,  477,    0,  477,  479,  479,  475,
			  479,  472,  478,  478,  478,  478,  478,  475,    0,  487,
			    0,  508,  473,  509,  476,    0,  478,    0,  477,    0,
			  483,  483,  479,  483,  490,  490,  477,  490,  480,  480,
			  480,  480,  480,  476,    0,  475,  481,  481,  481,  481,
			  481,  510,  480,  479,  478,  483,  498,  484,  484,  480,
			  484,  511,    0,  483,  477,  480,    0,  481,  498,  485,
			  485,  476,  485,  486,  486,  512,  486,  513,  514,  510,
			  480,  515,  484,  516,  498,    0,    0,  480,  490,  511,

			  484,  483,  517,  480,  485,  481,  498,  518,  486,  519,
			  520,  558,    0,  512,    0,  513,  514,    0,    0,  515,
			    0,  516,  558,  485,  486,  664,  664,  664,  484,    0,
			  517,    0,  558,    0,  523,  518,  523,  519,  520,  523,
			  523,  523,  523,  523,  524,  524,  524,  524,  524,  526,
			  558,  485,  486,  521,  521,  521,  521,  521,  525,  525,
			  525,  525,  525,  664,  521,  521,  521,  521,  521,  521,
			    0,    0,  526,  771,  771,  771,  771,  526,  789,  789,
			  789,  789,  524,  527,  527,  527,  527,  527,    0,    0,
			    0,  521,  521,  521,  521,  521,  521,  521,  527,  528,

			  528,  528,  528,  528,  529,  529,  529,  529,  529,  530,
			  530,  530,  530,  530,  531,  531,  531,  531,  531,  532,
			  532,  532,  532,  532,    0,    0,  527,  533,  533,  533,
			  533,  533,  563,  534,  564,  534,    0,  528,  534,  534,
			  534,  534,  534,  535,  535,  535,  535,  535,  539,  539,
			    0,  539,  531,  538,  538,  538,  538,  538,  540,  540,
			  563,  540,  564,  559,  541,  541,    0,  541,  538,  542,
			  542,  545,  542,  539,  559,  543,  543,  539,  543,  544,
			  544,    0,  544,  540,  559,  565,    0,  540,  545,  541,
			  566,    0,  545,  567,  542,    0,  538,  541,  546,  546,

			  543,  546,  559,    0,  544,  539,  569,  547,  547,  542,
			  547,  548,  548,  565,  548,  540,  545,  544,  566,  549,
			  549,  567,  549,  546,  570,  541,  550,  550,    0,  550,
			  551,  551,  547,  551,  569,    0,  548,  542,  554,  554,
			  547,  554,    0,  546,  549,  544,  552,  552,  552,  552,
			  552,  550,  570,  555,  555,  551,  555,  548,  572,  550,
			  573,  574,  551,  554,  549,  575,    0,  552,  547,  556,
			  556,  546,  556,  552,  557,  557,  576,  557,  555,  577,
			  578,  579,  580,  581,  582,  548,  572,  550,  573,  574,
			  551,  583,  549,  575,  556,  552,  584,  555,  586,  557,

			  556,  552,  587,  588,  576,  590,  557,  577,  578,  579,
			  580,  581,  582,  593,  593,  593,  593,  593,    0,  583,
			  612,  612,    0,  612,  584,  555,  586,    0,  556,    0,
			  587,  588,  628,  590,  557,  591,  591,  591,  591,  591,
			  594,  594,  594,  594,  594,  612,  591,  591,  591,  591,
			  591,  591,  595,  595,  595,  595,  595,  596,    0,  596,
			  628,    0,  596,  596,  596,  596,  596,  598,  598,  598,
			  598,  598,  600,  591,  591,  591,  591,  591,  591,  591,
			  597,    0,  597,    0,    0,  597,  597,  597,  597,  597,
			  599,  599,  599,  599,  599,  600,    0,    0,    0,    0,

			  600,  798,  798,  798,    0,  598,  601,  601,  601,  601,
			  601,  602,  602,  602,  602,  602,  604,  604,  604,  604,
			  604,  605,  605,  605,  605,  605,  606,  606,  606,  606,
			  606,  608,  608,  608,  608,  608,  609,  629,  609,  798,
			  615,  609,  609,  609,  609,  609,  608,  610,  610,  630,
			  610,  611,  611,    0,  611,  613,  613,  615,  613,  614,
			  614,  615,  614,  616,  616,  629,  616,  617,  617,  608,
			  617,  632,  610,    0,  608,    0,  611,  630,  618,  618,
			  613,  618,    0,    0,  614,  615,  613,  634,  616,  611,
			  622,  610,  617,  619,  619,  638,  619,  620,  620,  632,

			  620,  621,  621,  618,  621,  623,  623,  622,  623,  624,
			  624,  622,  624,  641,  613,  634,  644,  611,  619,  610,
			  646,    0,  620,  638,  625,  625,  621,  625,  618,    0,
			  623,  648,  649,  650,  624,  622,  651,  620,  623,    0,
			    0,  641,    0,    0,  644,  624,    0,    0,  646,  625,
			  655,  655,  655,  655,  655,    0,  618,  625,    0,  648,
			  649,  650,    0,    0,  651,  620,  623,  656,  656,  656,
			  656,  656,    0,  624,  657,  657,  657,  657,  657,  658,
			  658,  658,  658,  658,    0,  625,  659,  659,  659,  659,
			  659,  660,    0,  660,    0,    0,  660,  660,  660,  660, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  660,  680,    0,    0,    0,  656,  663,  663,  663,  663,
			  663,  665,  665,  665,  665,  665,  666,  666,  666,  666,
			  666,  667,  667,  667,  667,  667,  665,  668,  668,  680,
			  668,  669,  669,    0,  669,    0,  670,  670,    0,  670,
			  672,  672,    0,  672,    0,  673,  673,    0,  673,  665,
			  674,  678,  668,    0,  665,  678,  669,  681,  668,  667,
			    0,  670,  682,  677,  677,  672,  677,  674,  669,  670,
			  673,  674,  678,    0,  675,  675,  673,  675,  676,  676,
			  679,  676,  683,  678,  679,  681,  668,  684,  677,  687,
			  682,  688,  689,  690,  692,  674,  669,  670,    0,  675,

			    0,  679,    0,  676,  673,  714,  675,    0,    0,  715,
			  683,  676,  679,    0,    0,  684,    0,  687,    0,  688,
			  689,  690,  692,  695,  695,  695,  695,  695,  697,  697,
			  697,  697,  697,  714,  675,  706,  706,  715,  706,  676,
			  698,  698,  698,  698,  698,  699,  699,  699,  699,  699,
			  700,  700,  700,  700,  700,  701,  701,  701,  701,  701,
			  706,  695,  702,  702,  702,  702,  702,  704,  704,  704,
			  704,  704,  705,  705,    0,  705,  707,  707,  698,  707,
			    0,  706,  708,  708,  716,  708,  710,  710,    0,  710,
			  719,  711,  711,  720,  711,  722,  712,  705,  713,  735,

			  712,  707,  713,    0,    0,  704,    0,  708,  705,  706,
			    0,  710,  716,    0,    0,  708,  711,  712,  719,  713,
			  736,  720,    0,  722,    0,    0,    0,  735,  712,    0,
			  713,  725,  725,  725,  725,  725,  705,  711,  727,  727,
			  727,  727,  727,  708,  728,  737,  728,  738,  736,  728,
			  728,  728,  728,  728,  729,  729,  739,  729,  730,  730,
			    0,  730,  740,  732,  732,  711,  732,  731,  731,  725,
			  731,  749,    0,  737,    0,  738,    0,  743,  743,  729,
			  743,  754,  728,  730,  739,    0,    0,  729,  732,    0,
			  740,    0,  731,  742,  742,  742,  742,  742,  747,  749,

			  744,  744,  743,  744,  745,  745,  747,  745,  730,  754,
			  761,  762,  731,  732,  748,  729,    0,  746,  746,  747,
			  746,  768,  748,  743,    0,  744,    0,    0,    0,  745,
			    0,    0,    0,    0,  747,  748,  730,  776,  761,  762,
			  731,  732,  746,  755,  755,  755,  755,  755,    0,  768,
			  748,  743,  756,  756,  756,  756,  756,  757,  757,  746,
			  757,  758,  758,  759,  758,  776,  763,  760,  763,    0,
			    0,  759,    0,    0,    0,  760,  763,  764,  764,    0,
			  764,    0,  757,  784,  759,  784,  758,  746,  760,  765,
			  765,    0,  765,  784,  758,  773,  773,    0,  773,  759,

			    0,    0,  764,  760,  763,  774,  775,  757,  770,  770,
			  770,  770,  770,  780,  765,    0,  774,  775,    0,  764,
			  773,  784,  758,    0,  780,    0,  774,  775,  773,  777,
			  777,  777,  777,  777,  780,  757,  778,  778,  778,  778,
			  778,    0,  781,    0,  774,  775,    0,  764,  779,  779,
			    0,  779,  780,  781,    0,    0,  773,  783,  783,  783,
			  783,  783,  791,  781,  787,  787,  787,  787,  787,  792,
			    0,    0,    0,  779,  788,  788,  788,  788,  788,  791,
			    0,  781,    0,  791,  795,  796,  792,    0,    0,    0,
			  792,  793,  793,  793,  793,  793,  794,  794,  794,  794,

			  794,  795,  796,    0,    0,  795,  796,  791,  797,  797,
			  797,  797,  797,    0,  792,  801,  801,  801,  801,  801,
			  802,  802,  802,  802,  802,    0,    0,    0,    0,  795,
			  796,  803,  803,  803,  803,  803,  805,  805,  805,  805,
			  805,  806,    0,  806,    0,    0,  806,  806,  806,  806,
			  806,  807,  807,  807,  807,  807,  808,  808,  808,  808,
			  808,  837,  837,    0,    0,    0,    0,  837,  837,  837,
			  837,  837,  837,    0,    0,    0,    0,    0,    0,  806,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,

			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,

			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,

			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  815,  815,    0,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			    0,  815,  815,  815,  815,  815,  816,  816,    0,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,

			  816,  816,  817,  817,  817,    0,    0,    0,    0,    0,
			    0,    0,  817,  817,    0,    0,  817,    0,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,    0,    0,  817,  817,  817,  818,  818,    0,  818,
			  818,    0,  818,  818,    0,    0,    0,    0,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,    0,    0,  818,  818,  818,  819,  819,    0,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,

			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  820,  820,    0,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  821,  821,
			    0,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,

			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			    0,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,

			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  824,  824,  824,    0,
			    0,    0,    0,  824,  824,    0,  824,  824,    0,    0,
			    0,    0,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,    0,  824,  824,  824,  824,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,

			  825,  825,  825,  825,  825,  825,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  827,  827,    0,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  828,  828,

			    0,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,    0,

			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  831,    0,    0,    0,
			  831,  831,    0,    0,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,    0,
			    0,  831,  831,  831,  832,  832,    0,  832,  832,    0,
			  832,  832,  832,    0,    0,    0,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,

			  832,  832,  832,  832,  832,  832,  832,  832,  832,    0,
			    0,  832,  832,  832,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  834,  834,  834,  840,  840,    0,    0,    0,    0,  840,
			  840,  840,  840,  840,  840,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,    0,

			    0,    0,    0,    0,  834,  835,  835,    0,  835,    0,
			    0,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,    0,    0,  835,  835,  835,  836,
			  836,  836,  836,  836,  836,  836,    0,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			    0,  836,  836,  836,  836,  838,  838,  838,    0,    0,
			    0,    0,  838,  838,    0,  838,  838,    0,    0,    0,

			    0,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,    0,    0,  838,  838,  838,  839,
			  839,  839,    0,    0,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,    0,    0,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,    0,
			    0,  839,  839,  839,  841,  841,  841,    0,    0,    0,
			    0,  841,  841,    0,  841,  841,    0,    0,    0,    0,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,

			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,    0,  841,  841,  841,  841,  842,  842,
			    0,    0,    0,    0,  842,  842,  842,  842,  842,  842,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,    0,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  843,  843,  843,  843,  843,  844,  844,    0,    0,
			    0,    0,  844,  844,  844,  844,  844,  844,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809, yy_Dummy>>,
			1, 2073, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   82,   83,   68,   69,    0,    0,  152,
			  236,   62,   65, 1104, 4988,   93, 1089, 1043, 1060, 4988,
			   89, 4988, 4988, 4988, 4988, 4988, 1042,   83, 1010,   92,
			  112, 4988, 4988,  998, 4988,  996,  986,  186,  115,  170,
			  255,  267,  193,  274,  278,  284,  326,  399,  337,  343,
			  364,  330,  376, 4988, 4988,  953,  478,  557,   80,  136,
			  143,   81,  152,   90,  140,  238,  284,  266,  141,  138,
			  988, 4988, 4988,  212,  298, 4988,  637,  218,  213, 4988,
			  269,  951, 4988,  358,  371,  426,  558, 4988,  102,  720,
			 4988,  375,  999, 4988,  987, 4988,  935,  803,    0,  719,

			  940,  919,  434, 4988,  375,  443,  776,  450,  819, 4988,
			 4988, 4988,  403,  457,    0,  821,  842,  779,  847,  863,
			  868,  896,  878,  904,  908,  913,  947,  951,  924,  956,
			  994,  960,  986, 1073,  977, 1029,  995, 1035, 1063, 1052,
			 1080,  775,  909,  425,  876, 4988,  198,  915, 1130,  895,
			  257,  322,    0,  711,  341,  382,  371,  379,  401,  858,
			  457,  899,  465,  461,  543,  539,  863,  853,  568,  818,
			  817,  703,  948,  809,  700,  788,  824,  844,  860,  883,
			  906,  913,  929,  919,  938,  928,  976,  951, 1060,  958,
			  957,  971, 1018, 1021, 4988,  223, 4988,  856,  483,  307,

			 1153, 4988,  855, 1061, 4988, 1067,  801, 4988,  420, 1116,
			 1130, 1162, 4988, 1210,  124, 1266,  138,  349, 1349, 4988,
			 4988,  817, 1154, 4988, 4988, 4988,  759,  765,  776,  768,
			 1208,  739,  727,  717,  716,  713,  489, 4988, 1200, 1222,
			  544, 1227, 4988, 1266, 1282, 1295,  550, 1232, 4988,  558,
			 1257, 1086, 1305, 1341, 1335, 1403, 1407, 1411, 1111, 1415,
			 1419, 1424, 1434, 1438, 1144, 1465, 1483, 1500, 1510, 1533,
			 1328, 1542, 1556, 1336, 1406, 1473, 1523, 1514, 1569, 1582,
			 1586, 1590, 1597, 1603, 1613, 1617,  561, 4988, 4988,  557,
			 1065,    0, 1605, 1630, 1067,    0, 1083, 1089, 1090, 1100,

			 1186, 1263, 1274, 1288, 1289,  517, 1294,  450, 1615, 1305,
			 1339, 1389, 1409, 1409, 1412, 1423, 1446, 1507,    0,    0,
			 1524, 1540, 1533, 1551, 1589, 1597, 1594, 1602, 1597, 1600,
			  438, 1602, 1609,  437,    0,    0, 1605, 1606, 1691,  434,
			 4988,  443, 1674, 1182,  783, 1455,    0,  410,  413, 4988,
			 4988, 4988, 4988, 1682, 4988, 4988, 4988, 4988, 4988, 1712,
			 1696, 1718, 1736, 1741, 1757, 1767, 1773, 1778, 1783, 1801,
			 1788, 1806,  386, 1811, 1829, 1837, 1842, 1846, 1850, 1855,
			 1824, 1876, 1885, 1896, 1902, 1915, 1906, 1922, 1935, 1894,
			 1964, 1969, 2012, 1985, 2004, 2020, 1934, 1943, 1833, 1972,

			 2018, 1995, 2046, 2053, 1369,    0, 1617, 1618, 1641, 1642,
			    0, 1633, 1695,    0, 1695, 1697, 1808, 1836, 1837, 1887,
			 1901, 1909, 1925, 1944, 2001, 2011, 2021, 2023, 2016, 2017,
			 2018, 2022,    0,    0,    0,    0, 2020, 2037, 2041, 2026,
			 2042,  395,  375, 2097, 4988, 1686,    0, 4988, 2102, 2086,
			 2118, 2125,  355, 2146, 2130, 2152, 2162, 2167, 2172,  348,
			 2177, 2193, 2203,  289, 2175, 2203, 2219, 2224, 2233, 2239,
			  340, 2245, 2259, 2265, 2273, 2292, 2307, 2311, 2302, 2315,
			 2328, 2336, 2233, 2338, 2365, 2377, 2381, 2260, 1726, 2229,
			 2342,  296,  293, 2042, 2043, 2052, 2202, 2081, 2331,    0,

			 2094,    0, 2100, 2102, 2140,    0, 2219, 2221, 2264, 2270,
			 2326, 2325, 2350, 2341, 2353, 2356, 2358, 2356, 2364, 2374,
			 2375, 2433,    0, 2419, 2424, 2438, 2414, 2463, 2479, 2484,
			 2489, 2494, 2499, 2507, 2518, 2523, 1746, 4988, 2533, 2546,
			 2556, 2562, 2567, 2573, 2577, 2541, 2596, 2605, 2609, 2617,
			 2624, 2628, 2626,  279, 2636, 2651, 2667, 2672, 2381, 2533,
			  734, 4988, 4988, 2501, 2503, 2554, 2555, 2551,    0, 2571,
			 2582,    0, 2618, 2613, 2626, 2617, 2629, 2644, 2632, 2634,
			 2635, 2648, 2650, 2656, 2662,    0, 2652, 2669, 2669,    0,
			 2659, 2715,    0, 2693, 2720, 2732, 2742, 2765, 2747, 2770,

			 2737, 2786, 2791,  268, 2796, 2801, 2806, 4988, 2811, 2821,
			 2845, 2849, 2718, 2853, 2857, 2810, 2861, 2865, 2876, 2891,
			 2895, 2899, 2860, 2903, 2907, 2922,  258,  257, 2686, 2797,
			 2809,    0, 2838,    0, 2854,    0,    0,    0, 2843,    0,
			    0, 2861,    0,    0, 2874,    0, 2878,    0, 2896, 2894,
			 2898, 2901, 1257,  198,  165, 2930, 2947, 2954, 2959, 2966,
			 2976,  147,  724, 2986, 2410, 2991, 2996, 3001, 3025, 3029,
			 3034, 4988, 3038, 3043, 3020, 3072, 3076, 3061, 3021, 3050,
			 2968, 3018, 3023, 3047, 3052,    0,    0, 3056, 3058, 3058,
			 3058,    0, 3060,  479,  181, 3103,   88, 3108, 3120, 3125,

			 3130, 3135, 3142, 4988, 3147, 3170, 3133, 3174, 3180, 4988,
			 3184, 3189, 3166, 3168, 3067, 3061, 3136,    0,    0, 3155,
			 3158,    0, 3147,    0, 4988, 3211,   77, 3218, 3229, 3252,
			 3256, 3265, 3261,  907, 4988, 3164, 3168, 3193, 3200, 3209,
			 3210,  196, 3273, 3275, 3298, 3302, 3315, 3268, 3284, 3223,
			    0,    0,    0,    0, 3237, 3323, 3332, 3355, 3359, 3333,
			 3337, 3258, 3276, 3351, 3375, 3387,   97,   84, 3277,    0,
			 3388, 2453, 4988, 3393, 3375, 3376, 3302, 3409, 3416, 3446,
			 3383, 3412,    0, 3437, 3368,   77,   71, 3444, 3454, 2458,
			 4988, 3432, 3439, 3471, 3476, 3454, 3455, 3488, 2786, 4988,

			 4988, 3495, 3500, 3511, 4988, 3516, 3526, 3531, 3536, 4988,
			 3579, 3625, 3671, 3717, 3763, 3809, 3855, 3900, 3940, 3985,
			 4031, 4077, 4123, 4169, 4214, 4259, 4305, 4351, 4397, 4443,
			 4489, 4528, 4568, 4613, 4658, 4693, 4738, 3549, 4783, 4828,
			 4651, 4872, 4906, 4929, 4964, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  809,    1,  810,  810,  811,  811,  812,  812,  813,
			  813,  814,  814,  809,  809,  809,  809,  809,  815,  809,
			  816,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  818,  809,  809,  819,  809,  809,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  809,  809,  809,  820,  809,  809,  809,  821,  822,  809,
			  822,  823,  809,  824,  809,  824,  824,  809,  825,  826,
			  809,  809,  809,  809,  815,  809,  827,  828,  827,  827,

			  829,  809,  809,  809,  809,  830,  809,  809,  809,  809,
			  809,  809,  809,  817,  831,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			   47,  817,  817,  817,  817,   47,  817,  817,  817,  817,
			  817,  817,  832,  818,  819,  809,  809,  809,   57,  809,
			  148,  148,   57,   57,   57,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,   57,  148,  148,
			  148,   57,   57,   57,  148,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,  148,   57,   57,
			  148,   57,  148,   57,  809,  820,  809,  821,  809,  820,

			   76,  809,  821,  822,  809,  822,  823,  809,  823,  824,
			  809,  824,  809,  809,  809,  833,  809,  825,  826,  809,
			  809,  218,  834,  809,  809,  809,  809,  835,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  831,
			  817,  817,  817,  817,  817,  817,  817,  817,  809,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  133,  133,  133,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  809,  809,  809,  809,
			  148,  148,  809,  148,   57,   57,  148,   57,  148,  148,

			  148,   57,   57,   57,  148,  148,   57,   57,  809,  148,
			  148,  148,  148,   57,   57,   57,  148,   57,  148,   57,
			  148,  148,   57,   57,  148,  148,   57,   57,  148,  148,
			  148,   57,   57,   57,  148,   57,  148,   57,  820,  820,
			  809,  836,  836,  809,  836,  834,  837,  835,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  831,  817,  817,  817,  817,  817,  817,  817,
			  809,  817,  817,  817,  817,  817,  817,  817,  133,  133,
			  388,  388,  817,  130,  392,  392,  817,  817,  809,  817,

			  817,  817,  817,  817,  838,  839,  148,   57,  148,   57,
			  148,  148,  148,   57,   57,   57,  148,  148,   57,  148,
			  148,  148,  148,   57,   57,   57,  148,   57,  148,  148,
			   57,   57,  148,  148,   57,   57,  148,  148,  148,   57,
			   57,  148,   57,  338,  809,  809,  840,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  830,  809,  809,  809,  817,  817,  817,  817,  817,  817,
			  809,  817,  817,  817,  817,  817,  817,  817,  392,  817,
			  392,  480,  809,  817,  817,  817,  817,  809,  809,  841,
			  838,  148,   57,  148,   57,  148,  148,   57,   57,  148,

			  148,   57,  148,  148,  148,  148,   57,   57,   57,  148,
			   57,  148,  148,   57,   57,  148,  148,  148,  148,   57,
			   57,  443,  842,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  843,  817,
			  817,  817,  817,  817,  817,  809,  817,  817,  817,  817,
			  817,  817,  480,  809,  817,  817,  817,  817,  809,  809,
			  841,  809,  809,  148,  148,   57,  148,  148,  148,   57,
			   57,   57,  148,  148,  148,  148,   57,   57,   57,  148,
			   57,  148,  148,   57,   57,  148,  148,  148,  148,   57,
			   57,  521,  844,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  817,  817,  817,  817,  817,  809,  817,  817,  817,  817,
			  817,  817,  809,  817,  817,  817,  809,  809,  148,  148,
			   57,  148,  148,   57,   57,  148,  148,  148,  148,   57,
			   57,   57,  148,   57,  148,  148,   57,   57,  148,  148,
			  148,   57,  820,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  817,  817,
			  817,  809,  817,  817,  809,  817,  817,  817,  809,  809,
			  148,  148,   57,  148,   57,  148,   57,  148,   57,  148,
			  148,  148,   57,  820,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  817,  817,  817,  817,  809,
			  817,  817,  809,  809,  148,  148,   57,  148,   57,  148,
			   57,  148,  148,   57,  809,  809,  809,  809,  809,  817,
			  817,  817,  817,  809,  809,  148,  148,   57,  148,   57,
			  148,  809,  809,  817,  817,  817,  817,  809,  809,  148,
			  148,   57,  148,   57,  148,  809,  809,  817,  817,  809,
			  809,  148,  148,  809,  817,  817,  809,  809,  148,  148,
			  809,  809,  809,  817,  809,  809,  148,  809,  809,  817,
			  809,  809,  148,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,    0,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809, yy_Dummy>>)
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
			    0,    0,    0,  132,  130,    1,    2,   15,  108,   18,
			  130,   16,   17,    7,    6,   13,    5,   11,    8,   99,
			   99,   14,   12,   29,   10,   30,   20,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   78,   91,   91,
			   91,   91,   22,   31,   23,    9,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   24,   21,   25,  113,  114,  115,  113,  116,  131,   97,
			  131,  131,  131,  131,  131,  131,  131,   68,  131,  131,
			   90,    1,    2,   28,  108,  107,  128,  128,  128,  128,

			    3,   33,  103,   32,    0,    0,   99,    0,   99,   27,
			   26,   19,    0,   91,   87,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   40,
			   91,   86,   86,   77,   86,   86,   91,   91,   91,   91,
			   91,   91,    0,    0,    0,   98,    0,    0,   94,    0,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   40,
			   94,   40,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   95,  113,  115,    0,  114,  113,

			  113,  110,  109,    0,   97,    0,    0,   96,    0,    0,
			    0,    0,   68,    0,   66,    0,   65,    0,    0,   90,
			   88,   88,    0,   89,  128,  117,  128,  128,  128,  128,
			  128,  128,  128,  128,  128,  128,    4,   34,  103,    0,
			    0,    0,  101,  103,  101,   99,    0,    0,   87,    0,
			   91,   39,   91,   91,   91,   91,   91,   91,    0,   91,
			   91,   91,   91,   91,   42,   91,   91,   78,   79,   78,
			   79,   78,   78,   85,   91,   85,   85,   85,   91,   91,
			   91,   91,   91,   91,   41,   91,    0,   63,   93,    0,
			   94,   39,   69,   69,   94,   39,   94,   94,   94,   94,

			   94,   94,   94,   94,   94,   94,   94,   94,    0,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   42,   42,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   41,   41,   94,   94,  113,  111,
			   96,    0,    0,   67,   65,    0,    0,    0,    0,  124,
			  122,  125,  129,  129,  123,  121,  118,  119,  120,  103,
			    0,  103,    0,    0,  103,    0,    0,    0,  102,   99,
			    0,    0,   92,   91,   91,   38,   91,   91,   91,   91,
			    0,   91,   91,   91,   91,   91,   91,   91,   91,   77,
			   91,   91,   91,   91,   77,   77,   77,   37,    0,   44,

			   91,   91,   91,   91,   64,   60,   94,   94,   94,   94,
			   38,   94,   94,   38,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   37,   44,   37,   44,   94,   94,   94,   94,
			   94,   94,   94,  113,   67,   65,    0,  126,  103,  103,
			    0,    0,  100,  103,    0,  102,    0,  102,    0,    0,
			    0,   99,   74,    0,   91,   91,   91,   91,   45,   91,
			    0,   91,   91,   91,   36,   91,   91,   91,   79,   78,
			   91,   91,    0,   91,   91,   91,   91,    0,   64,   64,
			    0,   94,   94,   94,   94,   94,   94,   94,   94,   45,

			   94,   45,   94,   94,   94,   36,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,  113,    0,    0,  103,    0,  106,  103,  102,    0,
			    0,  102,    0,    0,  101,    0,    0,   74,    0,   91,
			   91,   91,   91,   47,   91,    0,   91,   91,   91,   91,
			   91,   91,   91,    0,   53,   91,   91,   91,    0,    0,
			    0,   62,   61,   94,   94,   94,   94,   94,   47,   94,
			   94,   47,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   53,   94,   94,   94,   53,
			   94,  113,    0,    0,  103,    0,    0,    0,  102,    0,

			  106,  102,    0,   76,    0,    0,    0,  104,  106,  104,
			   91,   91,   59,   91,   46,    0,   43,   58,   91,   35,
			   91,   51,    0,   91,   91,   91,    0,    0,   94,   94,
			   94,   59,   94,   59,   94,   46,   43,   58,   94,   43,
			   58,   94,   35,   35,   94,   51,   94,   51,   94,   94,
			   94,   94,  113,    0,  106,    0,  106,    0,  102,    0,
			    0,  105,    0,    0,   73,  106,    0,  105,   91,   91,
			   91,   82,   54,   91,    0,   91,   91,   55,    0,    0,
			   94,   94,   94,   94,   94,   54,   54,   94,   94,   94,
			   94,   55,   94,  112,    0,  106,  105,    0,  105,    0,

			    0,    0,    0,   73,  105,   91,   91,   48,   91,   81,
			   52,   91,    0,    0,   94,   94,   94,   48,   48,   94,
			   94,   52,   94,   52,  127,  105,   75,    0,   73,   91,
			   91,   91,   91,   80,   80,   94,   94,   94,   94,   94,
			   94,    0,    0,   91,   50,   49,   91,    0,    0,   94,
			   50,   50,   49,   49,   94,    0,    0,   91,   91,    0,
			    0,   94,   94,   72,   91,   56,    0,    0,   94,   56,
			    0,    0,   72,   91,    0,    0,   94,    0,    0,   57,
			    0,    0,   57,    0,   71,    0,    0,    0,    0,    0,
			   71,    0,    0,    0,    0,    0,    0,    0,   70,   83,

			   84,    0,    0,    0,   70,    0,   70,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4988
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 809
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 810
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

	yyNb_rules: INTEGER is 131
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 132
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
