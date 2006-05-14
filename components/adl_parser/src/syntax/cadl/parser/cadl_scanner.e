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
--|#line 70 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 70")
end
-- Ignore separators
else
--|#line 71 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 71")
end
in_lineno := in_lineno + text_count
end
else
--|#line 76 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 76")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 77 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 77")
end
in_lineno := in_lineno + 1
else
--|#line 81 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 81")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 82 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 82")
end
last_token := Plus_code
else
--|#line 83 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 83")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 84 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 84")
end
last_token := Slash_code
else
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
last_token := Equal_code
else
--|#line 87 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 87")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 88 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 88")
end
last_token := Semicolon_code
else
--|#line 89 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 89")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Colon_code
else
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Left_parenthesis_code
else
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
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
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Dollar_code
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 20 then
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Question_mark_code
else
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := SYM_INTERVAL_DELIM
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Left_bracket_code
else
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := Right_bracket_code
end
else
if yy_act = 24 then
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := SYM_START_CBLOCK
else
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := SYM_END_CBLOCK
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := SYM_GE
else
--|#line 108 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 108")
end
last_token := SYM_LE
end
else
if yy_act = 28 then
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := SYM_NE
else
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := SYM_LT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 112 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 112")
end
last_token := SYM_GT
else
--|#line 114 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 114")
end
last_token := SYM_MODULO
end
else
if yy_act = 32 then
--|#line 115 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 115")
end
last_token := SYM_DIV
else
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
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
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 122 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 122")
end
last_token := SYM_MATCHES
end
else
if yy_act = 36 then
--|#line 124 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 124")
end
last_token := SYM_MATCHES
else
--|#line 128 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 128")
end
last_token := SYM_THEN
end
end
else
if yy_act <= 39 then
if yy_act = 38 then
--|#line 130 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 130")
end
last_token := SYM_ELSE
else
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_AND
end
else
if yy_act = 40 then
--|#line 134 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 134")
end
last_token := SYM_OR
else
--|#line 136 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 136")
end
last_token := SYM_XOR
end
end
end
else
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_NOT
else
--|#line 140 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 140")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 44 then
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_TRUE
else
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_FALSE
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_FORALL
else
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_EXISTS
end
else
if yy_act = 48 then
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_EXISTENCE
else
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
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
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_CARDINALITY
else
--|#line 158 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 158")
end
last_token := SYM_ORDERED
end
else
if yy_act = 52 then
--|#line 160 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 160")
end
last_token := SYM_UNORDERED
else
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_UNIQUE
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 164 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 164")
end
last_token := SYM_INFINITY
else
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_USE_NODE
end
else
if yy_act = 56 then
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
end
else
if yy_act <= 61 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_INCLUDE
else
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 60 then
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 187 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 187")
end

 					last_token := V_QUALIFIED_TERM_CODE_REF
 					last_string_value := text_substring (2, text_count - 1)
 			
end
end
else
if yy_act <= 63 then
if yy_act = 62 then
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 210 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 210")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
else
if yy_act = 64 then
--|#line 217 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 217")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 223 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 223")
end

				do_nothing
			
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
--|#line 227 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 227")
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
--|#line 249 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 249")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 256 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 256")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 69 then
--|#line 263 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 263")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 264 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 264")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 72 then
if yy_act = 71 then
--|#line 265 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 265")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 272 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 272")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 73 then
--|#line 273 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 273")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 274 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 274")
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
--|#line 281 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 281")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 282 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 282")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 77 then
--|#line 290 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 290")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 291 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 291")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 80 then
if yy_act = 79 then
--|#line 292 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 292")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 298 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 298")
end

				last_token := ERR_V_ISO8601_DURATION
			
end
else
if yy_act = 81 then
--|#line 304 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 304")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 311 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 311")
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
--|#line 318 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 318")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 325 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 325")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 85 then
--|#line 326 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 326")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 327 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 327")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 88 then
if yy_act = 87 then
--|#line 339 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 339")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 344 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 344")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 89 then
--|#line 348 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 348")
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
--|#line 383 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 383")
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
--|#line 388 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 388")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 393 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 393")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 93 then
--|#line 399 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 399")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 405 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 405")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 96 then
if yy_act = 95 then
--|#line 411 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 411")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 415 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 415")
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
--|#line 425 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 425")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 432 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 432")
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
--|#line 437 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 437")
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
--|#line 452 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 452")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 101 then
--|#line 453 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 453")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 454 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 454")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 104 then
if yy_act = 103 then
	yy_end := yy_end - 1
--|#line 458 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 458")
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
--|#line 459 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 459")
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
--|#line 460 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 460")
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
--|#line 480 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 480")
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
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
end
in_buffer.append_character ('\')
end
else
if yy_act = 109 then
--|#line 491 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 491")
end
in_buffer.append_character ('"')
else
--|#line 492 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 492")
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
--|#line 506 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 506")
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
--|#line 520 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 520")
end
in_buffer.append_string (text)
end
else
if yy_act = 113 then
--|#line 522 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 522")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
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
--|#line 538 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 538")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 546 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 546")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 117 then
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 548 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 548")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
else
if yy_act <= 120 then
if yy_act = 119 then
--|#line 549 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 549")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 550 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 550")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
else
if yy_act = 121 then
--|#line 551 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 551")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 552 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 552")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 126 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 553 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 553")
end
last_token := V_CHARACTER; last_character_value := '"'
else
--|#line 554 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 554")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
end
else
if yy_act = 125 then
--|#line 559 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 559")
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
--|#line 569 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 569")
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
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 580 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 580")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 129 then
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
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
			create an_array.make (0, 4937)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   14,   19,
			   14,   20,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,   29,   29,   29,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   37,   39,   40,   37,   41,   42,
			   37,   43,   44,   45,   46,   37,   37,   37,   47,   48,
			   37,   49,   50,   37,   51,   52,   53,   54,   14,   55,
			   56,   57,   56,   58,   59,   56,   60,   61,   56,   62,
			   63,   64,   56,   56,   56,   56,   65,   66,   56,   67,
			   68,   69,   70,   71,   73,   73,   78,   78,   74,   74,
			   88,   75,   75,   88,   90,  336,   90,   90,   96,   97,

			  100,  155,  101,  101,  101,  101,  101,  103,  776,  104,
			  165,  105,  105,  105,  105,  105,  110,  110,  173,  110,
			  175,  195,   79,   79,  689,  689,  689,  141,  141,  156,
			  762,  207,  141,  141,  730,  200,   76,   76,  166,  213,
			  213,  112,  213,   98,   89,  522,  174,   89,  176,  106,
			   80,   80,   81,   82,   83,   81,   82,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   84,  196,
			   81,  110,  110,  141,  110,  177,   81,   81,   81,   81,
			   81,   81,  157,  201,  181,  161,  110,  110,  178,  110,
			  185,  189,  182,  158,  191,  186,  112,  162,  711,  197,

			  115,  197,  197,  179,  453,   81,   81,   86,   81,  195,
			  159,  112,  183,  163,  445,  217,  180,  195,  187,  190,
			  184,  160,  192,  188,  113,  164,  114,   90,  115,   90,
			   90,  684,   81,   81,   81,   81,   82,   83,   81,   82,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   84,  113,   81,  114,  110,  110,  196,  110,   81,
			   81,   81,   81,   81,   81,  196,  203,  110,  110,  218,
			  110,  167,  168,  110,  110,  669,  110,  169,  110,  110,
			  112,  110,  206,  195,  208,  209,  286,  208,   81,   81,
			   86,   81,  112,  116,  110,  110,  118,  110,  112,  170,

			  171,  737,  204,  112,  117,  172,  668,  124,  119,  120,
			  209,  209,  217,  209,  286,   81,   81,   81,  204,  112,
			  652,  116,  110,  110,  118,  110,  110,  110,  552,  110,
			  205,  196,  117,  121,  122,  124,  119,  120,  211,  123,
			  110,  110,  552,  110,  737,  145,  205,  112,  145,  110,
			  110,  112,  110,  110,  110,  146,  110,  126,  134,  134,
			  287,  121,  122,  125,  211,  112,  218,  123,  110,  110,
			  127,  110,  212,  209,  112,  212,  135,  535,  112,  286,
			  110,  110,  287,  110,  136,  126,  213,  214,  287,  110,
			  110,  125,  110,  112,  139,  292,  215,  292,  127,  110,

			  110,  294,  110,  526,  135,  112,  294,  290,  137,  295,
			  291,  300,  136,  138,  112,  296,  301,  128,  128,  128,
			  128,  128,  139,  292,  112,  293,  211,  300,  103,  294,
			  140,  129,  212,  209,  297,  212,  137,  295,  130,  300,
			  481,  138,  481,  296,  301,  131,  213,  132,  442,  133,
			  240,  240,  240,  240,  240,  302,  215,  301,  140,  129,
			  344,  242,  242,  242,  242,  242,  130,  245,  245,  245,
			  245,  245,  744,  744,  439,  132,  243,  133,  145,  433,
			  197,  145,  197,  197,  433,  303,  211,  412,  146,  141,
			  141,  215,  215,  412,  215,  400,  147,  147,  147,  147,

			  147,  148,  282,  305,  243,  399,  354,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  149,  147,  150,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  353,  305,  352,  283,  147,  151,  151,  152,  151,  151,
			  151,  151,  151,  151,  153,  151,  154,  151,  151,  151,
			  151,  151,  152,  151,  151,  151,  151,  145,  110,  110,
			  145,  110,  235,  351,  235,  235,  288,  146,  289,  289,
			  289,  289,  289,  350,  346,  147,  147,  147,  147,  147,
			  148,  254,  305,  112,  312,  345,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,

			  147,  147,  147,  147,  147,  147,  147,  147,  147,  344,
			  309,  342,  312,  147,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  194,  194,  791,  194,
			  194,  194,  195,  198,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  194,
			  196,  194,  194,  194,  199,  199,  199,  199,  199,  199,

			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  194,  194,  194,  220,
			  220,  207,  220,  227,  195,  195,  308,  228,  208,  209,
			  308,  208,  340,  440,  304,  340,  229,  229,  229,  229,
			  229,  254,  482,  482,  306,  482,  221,  307,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  230,  306,  110,  110,  307,  110,  285,  110,  110,
			  231,  110,  211,  284,  215,  215,  232,  215,  144,  103,
			  233,  104,  234,  244,  244,  244,  244,  244,  112,  282,

			  222,  223,  223,  112,  223,  223,  223,  223,  225,  223,
			  223,  224,  223,  223,  223,  223,  223,  223,  223,  223,
			  237,  237,  237,  237,  237,  223,  223,  223,  223,  223,
			  223,  106,  236,  235,  258,  238,  110,  110,  312,  110,
			  110,  110,  224,  110,  110,  110,   94,  110,  110,  110,
			  314,  110,  314,   91,  223,  223,  223,  223,  239,  110,
			  110,  112,  110,  238,  207,  112,  313,  110,  110,  112,
			  110,  316,  247,  112,  246,  317,  110,  110,  314,  110,
			  315,  223,  223,  223,  112,  316,  110,  110,  248,  110,
			  250,  193,  112,  249,  110,  110,  251,  110,  144,  316,

			  247,  112,  246,  317,  295,  252,  110,  110,  317,  110,
			  296,  112,  109,  318,  110,  110,  248,  110,  250,  112,
			  253,  249,  320,  108,  251,  261,  110,  110,  255,  110,
			  321,  112,  298,  252,  528,  320,  319,  256,  299,  112,
			  257,  110,  110,  107,  110,  102,  110,  110,  253,  110,
			  320,  112,  306,  261,  321,  307,  255,  326,  321,  326,
			  259,  110,  110,  322,  110,  256,  112,   99,  257,  330,
			  330,  112,  260,  262,  106,   94,  332,  332,  110,  110,
			  310,  110,  323,  311,   92,  326,  112,  329,  259,   91,
			  791,  324,  269,  129,  401,  325,  791,  330,  331,  791,

			  260,  262,  263,  112,  332,  333,  264,  269,  791,  265,
			  129,  110,  110,  401,  110,  266,  111,  130,  267,  324,
			  268,  129,  401,  325,  269,  791,  110,  110,  195,  110,
			  263,  791,  482,  482,  264,  482,  112,  265,  129,  110,
			  110,  402,  110,  266,  275,  130,  267,  120,  268,  110,
			  110,  112,  110,  110,  110,  791,  110,  274,  274,  274,
			  274,  274,  110,  110,  112,  110,  203,  270,  270,  270,
			  270,  270,  275,  276,  112,  120,  196,  324,  112,  110,
			  110,  325,  110,  206,  403,  271,  279,  112,  272,  403,
			  110,  110,  791,  110,  273,  209,  209,  791,  209,  277,

			  334,  276,  204,  278,  112,  327,  791,  791,  791,  328,
			  791,  405,  403,  271,  279,  112,  272,  404,  406,  204,
			  194,  791,  273,  280,  791,  341,  341,  277,  341,  791,
			  205,  278,  199,  199,  199,  199,  199,  791,  335,  405,
			  281,  212,  209,  407,  212,  791,  406,  205,  347,  211,
			  405,  280,  221,  791,  791,  213,  348,  349,  349,  349,
			  349,  349,  791,  791,  406,  215,  407,  791,  281,  791,
			  199,  407,  212,  209,  356,  212,  356,  791,  408,  357,
			  357,  357,  357,  357,  791,  791,  213,  358,  358,  358,
			  358,  358,  409,  791,  410,  211,  215,  359,  359,  359,

			  359,  359,  791,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  791,  211,  337,  338,  339,
			  337,  338,  337,  337,  337,  337,  337,  337,  337,  337,
			  337,  337,  213,  411,  791,  337,  355,  355,  355,  355,
			  355,  337,  340,  337,  337,  337,  337,  411,  791,  414,
			  791,  238,  360,  360,  360,  360,  360,  363,  791,  363,
			  791,  411,  364,  364,  364,  364,  364,  361,  415,  791,
			  337,  337,  211,  337,  239,  413,  103,  414,  104,  238,
			  365,  365,  365,  365,  365,  366,  366,  366,  366,  366,

			  362,  110,  110,  791,  110,  361,  415,  337,  337,  337,
			  220,  220,  791,  220,  111,  111,  111,  111,  111,  791,
			  111,  111,  111,  111,  111,  791,  112,  288,  106,  288,
			  288,  288,  288,  288,  791,  791,  416,  221,  111,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  110,  110,  416,  110,  111,  110,  110,  791,
			  110,  110,  110,  791,  110,  110,  110,  791,  110,  417,
			  110,  110,  791,  110,  414,  110,  110,  112,  110,  791,
			  374,  222,  112,  791,  110,  110,  112,  110,  415,  368,

			  112,  374,  791,  367,  369,  112,  416,  417,  791,  421,
			  112,  374,  418,  370,  110,  110,  421,  110,  791,  112,
			  791,  110,  110,  791,  110,  371,  419,  368,  423,  374,
			  372,  367,  369,  791,  420,  110,  110,  421,  110,  112,
			  791,  370,  110,  110,  422,  110,  112,  791,  110,  110,
			  373,  110,  375,  371,  791,  424,  423,  423,  372,  376,
			  112,  110,  110,  791,  110,  110,  110,  112,  110,  791,
			  424,  791,  377,  112,  110,  110,  427,  110,  791,  378,
			  375,  110,  110,  424,  110,  425,  112,  376,  110,  110,
			  112,  110,  379,  428,  387,  427,  428,  388,  426,  112,

			  377,  791,  791,  389,  427,  791,  112,  378,  110,  110,
			  791,  110,  380,  112,  381,  791,  110,  110,  791,  110,
			  379,  428,  387,  429,  430,  388,  382,  382,  382,  382,
			  382,  389,  431,  112,  384,  384,  384,  384,  384,  791,
			  380,  112,  381,  110,  110,  288,  110,  289,  289,  289,
			  289,  289,  110,  110,  383,  110,  110,  110,  791,  110,
			  431,  385,  385,  385,  385,  385,  110,  110,  112,  110,
			  386,  386,  386,  386,  386,  110,  110,  112,  110,  110,
			  110,  112,  110,  110,  110,  791,  110,  110,  110,  383,
			  110,  112,  390,  791,  390,  791,  110,  110,  383,  110,

			  112,  273,  391,  791,  112,  432,  431,  791,  112,  791,
			  110,  110,  112,  110,  791,  393,  394,  110,  110,  791,
			  110,  112,  110,  110,  432,  110,  285,  436,  436,  273,
			  392,  396,  791,  432,  434,  112,  791,  374,  791,  395,
			  791,  791,  112,  393,  394,  484,  791,  112,  374,  484,
			  338,  339,  435,  338,  791,  436,  437,  486,  374,  396,
			  341,  341,  791,  341,  213,  791,  397,  395,  209,  209,
			  347,  209,  398,  484,  340,  486,  374,  485,  348,  349,
			  349,  349,  349,  349,  791,  486,  791,  791,  357,  357,
			  357,  357,  357,  443,  443,  443,  443,  443,  791,  791,

			  398,  195,  195,  487,  211,  791,  791,  791,  238,  444,
			  444,  444,  444,  444,  438,  438,  438,  438,  438,  791,
			  488,  683,  211,  489,  791,  438,  438,  438,  438,  438,
			  438,  239,  476,  476,  476,  476,  238,  446,  446,  446,
			  446,  446,  447,  447,  447,  447,  447,  445,  488,  196,
			  196,  489,  438,  438,  438,  438,  438,  438,  438,  448,
			  448,  448,  448,  448,  449,  791,  449,  791,  791,  450,
			  450,  450,  450,  450,  361,  451,  451,  451,  451,  451,
			  364,  364,  364,  364,  364,  452,  452,  452,  452,  452,
			  457,  457,  457,  457,  457,  110,  110,  362,  110,  488,

			  454,  455,  361,  456,  456,  456,  456,  456,  110,  110,
			  489,  110,  110,  110,  492,  110,  110,  110,  464,  110,
			  112,  110,  110,  453,  110,  110,  110,  490,  110,  464,
			  791,  110,  110,  112,  110,  791,  493,  112,  491,  464,
			  791,  112,  492,  458,  791,  459,  112,  791,  791,  791,
			  112,  492,  110,  110,  495,  110,  112,  464,  462,  496,
			  463,  791,  791,  460,  493,  110,  110,  461,  110,  110,
			  110,  458,  110,  459,  497,  110,  110,  112,  110,  494,
			  110,  110,  495,  110,  791,  498,  462,  496,  463,  465,
			  112,  460,  791,  791,  112,  461,  791,  495,  110,  110,

			  112,  110,  497,  110,  110,  112,  110,  110,  110,  467,
			  110,  791,  466,  498,  791,  468,  469,  465,  382,  382,
			  382,  382,  382,  112,  111,  499,  496,  111,  112,  791,
			  791,  791,  112,  111,  791,  791,  264,  467,  497,  472,
			  466,  791,  470,  468,  469,  266,  791,  471,  664,  664,
			  664,  664,  111,  502,  500,  111,  384,  384,  384,  384,
			  384,  111,  110,  110,  264,  110,  501,  472,  110,  110,
			  470,  110,  791,  266,  111,  471,  385,  385,  385,  385,
			  385,  502,  386,  386,  386,  386,  386,  112,  110,  110,
			  263,  110,  791,  112,  791,  502,  263,  475,  475,  475,

			  475,  475,  111,  265,  791,  791,  473,  473,  473,  473,
			  473,  791,  791,  112,  110,  110,  791,  110,  263,  110,
			  110,  791,  110,  503,  263,  110,  110,  504,  110,  505,
			  504,  265,  474,  474,  474,  474,  474,  110,  110,  112,
			  110,  791,  110,  110,  112,  110,  505,  508,  110,  110,
			  112,  110,  509,  510,  791,  504,  508,  505,  506,  509,
			  553,  553,  112,  481,  511,  110,  110,  112,  110,  478,
			  555,  479,  477,  112,  507,  508,  791,  791,  555,  561,
			  509,  510,  480,  791,  512,  791,  791,  513,  553,  554,
			  112,  791,  511,  791,  791,  791,  791,  478,  555,  479,

			  477,  443,  443,  443,  443,  443,  558,  561,  791,  791,
			  480,  514,  514,  514,  514,  514,  516,  518,  518,  518,
			  518,  518,  514,  514,  514,  514,  514,  514,  517,  517,
			  517,  517,  517,  519,  519,  519,  519,  519,  450,  450,
			  450,  450,  450,  791,  516,  791,  791,  551,  791,  514,
			  514,  514,  514,  514,  514,  514,  520,  520,  520,  520,
			  520,  523,  523,  523,  523,  523,  445,  110,  110,  562,
			  110,  361,  521,  521,  521,  521,  521,  524,  524,  524,
			  524,  524,  525,  525,  525,  525,  525,  520,  520,  520,
			  520,  520,  112,  791,  362,  110,  110,  562,  110,  361,

			  791,  455,  527,  456,  456,  456,  456,  456,  110,  110,
			  522,  110,  791,  110,  110,  453,  110,  563,  110,  110,
			  112,  110,  791,  529,  110,  110,  791,  110,  110,  110,
			  527,  110,  791,  112,  564,  530,  110,  110,  112,  110,
			  531,  110,  110,  112,  110,  563,  532,  110,  110,  112,
			  110,  110,  110,  112,  110,  562,  534,  536,  533,  556,
			  537,  112,  564,  530,  110,  110,  112,  110,  531,  791,
			  563,  557,  112,  538,  532,  791,  112,  791,  791,  549,
			  539,  791,  791,  565,  534,  536,  533,  556,  537,  112,
			  549,  110,  110,  791,  110,  540,  791,  541,  566,  557,

			  550,  538,  791,  473,  473,  473,  473,  473,  539,  542,
			  542,  542,  542,  542,  791,  791,  112,  791,  549,  791,
			  791,  111,  791,  540,  388,  541,  110,  110,  791,  110,
			  389,  791,  474,  474,  474,  474,  474,  543,  543,  543,
			  543,  543,  544,  544,  544,  544,  544,  110,  110,  111,
			  110,  112,  388,  111,  110,  110,  556,  110,  389,  545,
			  110,  110,  564,  110,  568,  568,  570,  571,  557,  570,
			  791,  571,  112,  791,  574,  575,  576,  577,  574,  112,
			  546,  111,  575,  618,  559,  112,  791,  545,  791,  791,
			  567,  791,  568,  569,  570,  571,  560,  572,  547,  573,

			  585,  548,  574,  575,  576,  577,  578,  582,  546,  582,
			  579,  618,  583,  583,  583,  583,  583,  583,  583,  583,
			  583,  583,  791,  239,  619,  619,  547,  791,  585,  548,
			  580,  580,  580,  580,  580,  584,  584,  584,  584,  584,
			  791,  580,  580,  580,  580,  580,  580,  520,  520,  520,
			  520,  520,  619,  620,  791,  445,  587,  587,  587,  587,
			  587,  791,  586,  588,  588,  588,  588,  588,  580,  580,
			  580,  580,  580,  580,  580,  589,  589,  589,  589,  589,
			  590,  590,  590,  590,  590,  591,  591,  591,  591,  591,
			  586,  791,  621,  791,  522,  592,  592,  592,  592,  592,

			  593,  791,  593,  791,  622,  590,  590,  590,  590,  590,
			  595,  595,  595,  595,  595,  621,  110,  110,  453,  110,
			  621,  110,  110,  616,  110,  596,  110,  110,  622,  110,
			  110,  110,  622,  110,  616,  110,  110,  602,  110,  110,
			  110,  112,  110,  623,  617,  597,  112,  610,  625,  610,
			  598,  112,  626,  596,  602,  112,  624,  611,  602,  599,
			  112,  791,  616,  791,  112,  110,  110,  791,  110,  627,
			  600,  110,  110,  597,  110,  628,  625,  601,  598,  626,
			  626,  627,  602,  110,  110,  612,  110,  599,  110,  110,
			  112,  110,  110,  110,  791,  110,  112,  627,  600,  110,

			  110,  791,  110,  628,  604,  601,  628,  629,  112,  630,
			  603,  110,  110,  112,  110,  791,  791,  112,  542,  542,
			  542,  542,  542,  632,  112,  607,  632,  110,  110,  605,
			  110,  608,  604,  606,  631,  634,  112,  635,  603,  111,
			  609,  609,  609,  609,  609,  266,  634,  110,  110,  617,
			  110,  632,  112,  607,  633,  110,  110,  605,  110,  608,
			  617,  606,  635,  634,  638,  635,  639,  111,  640,  638,
			  617,  613,  112,  266,  636,  791,  791,  670,  614,  791,
			  112,  583,  583,  583,  583,  583,  671,  615,  617,  791,
			  637,  791,  638,  791,  639,  791,  640,  641,  671,  613,

			  583,  583,  583,  583,  583,  670,  614,  644,  644,  644,
			  644,  644,  791,  791,  671,  615,  642,  642,  642,  642,
			  642,  649,  649,  649,  649,  649,  672,  642,  642,  642,
			  642,  642,  642,  645,  791,  645,  791,  791,  646,  646,
			  646,  646,  646,  647,  650,  647,  791,  791,  648,  648,
			  648,  648,  648,  791,  642,  642,  642,  642,  642,  642,
			  642,  648,  648,  648,  648,  648,  791,  362,  110,  110,
			  673,  110,  650,  590,  590,  590,  590,  590,  651,  651,
			  651,  651,  651,  590,  590,  590,  590,  590,  653,  653,
			  653,  653,  653,  112,  110,  110,  791,  110,  673,  522,

			  654,  673,  654,  650,  791,  655,  655,  655,  655,  655,
			  110,  110,  656,  110,  110,  110,  659,  110,  791,  112,
			  791,  110,  110,  675,  110,  791,  362,  110,  110,  674,
			  110,  650,  657,  659,  791,  112,  675,  659,  791,  112,
			  656,  110,  110,  677,  110,  658,  112,  110,  110,  677,
			  110,  675,  112,  110,  110,  791,  110,  791,  791,  791,
			  657,  659,  110,  110,  676,  110,  112,  110,  110,  791,
			  110,  677,  112,  658,  791,  791,  791,  678,  112,  662,
			  662,  662,  662,  662,  679,  110,  110,  112,  110,  680,
			  110,  110,  112,  110,  681,  110,  110,  660,  110,  679,

			  791,  701,  661,  663,  663,  663,  663,  663,  791,  791,
			  112,  791,  679,  791,  791,  112,  791,  680,  665,  791,
			  112,  791,  681,  791,  702,  660,  666,  682,  667,  701,
			  661,  646,  646,  646,  646,  646,  685,  685,  685,  685,
			  685,  648,  648,  648,  648,  648,  665,  648,  648,  648,
			  648,  648,  702,  791,  666,  791,  667,  686,  686,  686,
			  686,  686,  687,  791,  687,  702,  791,  688,  688,  688,
			  688,  688,  791,  791,  445,  589,  589,  589,  589,  589,
			  655,  655,  655,  655,  655,  690,  690,  690,  690,  690,
			  650,  110,  110,  703,  110,  110,  110,  791,  110,  791, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  110,  110,  791,  110,  110,  110,  791,  110,  791,  110,
			  110,  791,  110,  362,  791,  791,  112,  791,  650,  791,
			  112,  791,  691,  453,  791,  112,  791,  110,  110,  112,
			  110,  791,  692,  693,  112,  695,  695,  695,  695,  695,
			  694,  696,  696,  696,  696,  696,  110,  110,  704,  110,
			  691,  699,  112,  110,  110,  699,  110,  704,  706,  697,
			  692,  693,  706,  700,  708,  709,  708,  700,  694,  791,
			  791,  112,  699,  791,  791,  791,  704,  791,  112,  698,
			  791,  791,  791,  699,  700,  705,  706,  697,  791,  791,
			  707,  791,  708,  709,  710,  700,  644,  644,  644,  644,

			  644,  688,  688,  688,  688,  688,  791,  698,  712,  712,
			  712,  712,  712,  713,  713,  713,  713,  713,  651,  651,
			  651,  651,  651,  110,  110,  791,  110,  110,  110,  791,
			  110,  791,  110,  110,  445,  110,  110,  110,  791,  110,
			  717,  717,  717,  717,  717,  791,  522,  724,  112,  725,
			  725,  791,  112,  718,  719,  718,  453,  112,  722,  714,
			  791,  112,  722,  110,  110,  791,  110,  110,  110,  716,
			  110,  727,  723,  715,  727,  724,  723,  725,  726,  722,
			  729,  686,  686,  686,  686,  686,  738,  714,  112,  739,
			  722,  720,  112,  723,  791,  110,  110,  716,  110,  727,

			  791,  715,  728,  791,  723,  791,  791,  791,  729,  110,
			  110,  791,  110,  721,  738,  110,  110,  739,  110,  522,
			  112,  612,  612,  612,  612,  612,  739,  741,  731,  734,
			  734,  734,  734,  734,  112,  735,  735,  735,  735,  735,
			  112,  721,  110,  110,  741,  110,  743,  791,  110,  110,
			  791,  110,  749,  791,  740,  741,  731,  750,  791,  732,
			  733,  110,  110,  791,  110,  110,  110,  112,  110,  791,
			  791,  791,  742,  112,  743,  746,  746,  746,  746,  746,
			  749,  110,  110,  791,  110,  750,  112,  732,  733,  756,
			  112,  718,  736,  718,  745,  748,  735,  735,  735,  735,

			  735,  791,  757,  748,  791,  791,  112,  751,  751,  751,
			  751,  751,  110,  110,  791,  110,  748,  756,  110,  110,
			  736,  110,  745,  747,  753,  753,  753,  753,  753,  720,
			  757,  748,  110,  110,  755,  110,  758,  112,  758,  763,
			  768,  791,  755,  112,  110,  110,  759,  110,  791,  791,
			  791,  747,  767,  791,  773,  755,  773,  112,  791,  791,
			  761,  791,  752,  767,  774,  754,  791,  763,  768,  112,
			  755,  791,  791,  767,  760,  720,  720,  720,  720,  720,
			  764,  764,  764,  764,  764,  791,  110,  110,  761,  110,
			  752,  767,  775,  754,  765,  765,  765,  765,  769,  769,

			  769,  769,  769,  770,  770,  770,  770,  770,  791,  110,
			  110,  112,  110,  791,  771,  778,  778,  778,  778,  766,
			  772,  772,  772,  772,  772,  771,  760,  760,  760,  760,
			  760,  779,  791,  791,  112,  771,  777,  777,  777,  777,
			  777,  780,  780,  780,  780,  780,  782,  766,  779,  784,
			  785,  784,  779,  771,  781,  781,  781,  781,  781,  791,
			  791,  791,  791,  782,  791,  791,  791,  782,  783,  783,
			  783,  783,  783,  791,  791,  791,  779,  775,  775,  775,
			  775,  775,  787,  787,  787,  787,  787,  786,  791,  791,
			  791,  782,  788,  788,  788,  788,  788,  789,  789,  789,

			  789,  789,  784,  791,  784,  791,  791,  788,  788,  788,
			  788,  788,  790,  790,  790,  790,  790,  786,  786,  786,
			  786,  786,  441,  441,  791,  791,  791,  791,  441,  441,
			  441,  441,  441,  441,  791,  791,  791,  791,  791,  791,
			  786,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,

			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   93,   93,  791,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,  791,   93,   93,   93,   93,
			   93,   95,   95,  791,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,  111,  111,  111,  791,
			  791,  791,  791,  791,  791,  111,  111,  791,  791,  111,
			  791,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  791,  791,  111,  111,  111,  142,

			  142,  791,  142,  142,  791,  142,  142,  791,  791,  791,
			  791,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  791,  791,  142,  142,  142,  143,
			  143,  791,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  194,  194,  791,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,

			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  196,
			  196,  791,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,

			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  791,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  210,  210,  210,  791,  791,  791,
			  210,  210,  791,  210,  210,  791,  791,  791,  791,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,

			  210,  210,  791,  210,  210,  210,  210,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  223,  223,  791,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  226,  226,  791,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  241,  241,  241,  241,  241,  241,  241,  241,
			  791,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  141,  141,  791,
			  141,  141,  791,  141,  141,  141,  791,  791,  791,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,

			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  791,  791,  141,  141,  141,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  222,  222,  222,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  791,  791,  791,  791,  791,  222,  343,  343,  791,  343,
			  791,  791,  343,  343,  343,  343,  343,  343,  343,  343,
			  343,  343,  343,  343,  343,  343,  343,  343,  343,  343,
			  343,  343,  343,  343,  343,  791,  791,  343,  343,  343,
			  337,  337,  337,  337,  337,  337,  791,  337,  337,  337,
			  337,  337,  337,  337,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  337,  337,  337,  337,  337,  337,
			  791,  337,  337,  337,  337,  483,  483,  483,  791,  791,
			  791,  483,  483,  791,  483,  483,  791,  791,  791,  791,

			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  791,  791,  483,  483,  483,  400,  400,
			  400,  791,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  791,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  515,  515,  791,  791,  791,  791,  515,
			  515,  515,  515,  515,  515,  581,  581,  791,  791,  791,
			  791,  581,  581,  581,  581,  581,  581,  594,  594,  594,

			  594,  594,  594,  594,  594,  791,  594,  594,  594,  594,
			  594,  594,  594,  594,  594,  594,  594,  594,  594,  594,
			  594,  594,  594,  594,  594,  594,  594,  594,  594,  594,
			  594,  594,  594,  594,  594,  594,  594,  594,  594,  594,
			  594,  594,  643,  643,  791,  791,  791,  791,  643,  643,
			  643,  643,  643,  643,   13,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,

			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791, yy_Dummy>>,
			1, 1938, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4937)
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
			   11,    3,    4,   12,   15,  207,   15,   15,   20,   20,

			   27,   57,   27,   27,   27,   27,   27,   29,  771,   29,
			   60,   29,   29,   29,   29,   29,   37,   37,   62,   37,
			   63,   72,    5,    6,  652,  652,  652,   51,   51,   57,
			  755,  207,   51,   51,  713,   76,    3,    4,   60,  213,
			  213,   37,  213,   20,   11,  686,   62,   12,   63,   29,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   72,
			    9,   38,   38,   51,   38,   64,    9,    9,    9,    9,
			    9,    9,   58,   76,   65,   59,   36,   36,   64,   36,
			   66,   67,   65,   58,   68,   66,   38,   59,  684,   73,

			   38,   73,   73,   64,  651,    9,    9,    9,    9,  194,
			   58,   36,   65,   59,  644,   87,   64,  335,   66,   67,
			   65,   58,   68,   66,   36,   59,   36,   90,   38,   90,
			   90,  643,    9,    9,    9,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   36,   10,   36,   39,   39,  194,   39,   10,
			   10,   10,   10,   10,   10,  335,   77,   40,   40,   87,
			   40,   61,   61,   41,   41,  617,   41,   61,   43,   43,
			   39,   43,   79,  683,   82,   82,  149,   82,   10,   10,
			   10,   10,   40,   39,   42,   42,   40,   42,   41,   61,

			   61,  722,   77,   43,   39,   61,  616,   43,   40,   41,
			   83,   83,  216,   83,  149,   10,   10,   10,   79,   42,
			  592,   39,   44,   44,   40,   44,   45,   45,  485,   45,
			   77,  683,   39,   42,   42,   43,   40,   41,   82,   42,
			   47,   47,  484,   47,  722,  145,   79,   44,  145,  110,
			  110,   45,  110,   49,   49,  145,   49,   45,   47,   47,
			  150,   42,   42,   44,   83,   47,  216,   42,   48,   48,
			   45,   48,   84,   84,  110,   84,   47,  464,   49,  153,
			   50,   50,  154,   50,   47,   45,   84,   84,  150,  111,
			  111,   44,  111,   48,   49,  155,   84,  156,   45,   46,

			   46,  157,   46,  454,   47,   50,  159,  153,   48,  158,
			  154,  161,   47,   48,  111,  158,  162,   46,   46,   46,
			   46,   46,   49,  155,   46,  156,   84,  163,  447,  157,
			   50,   46,   85,   85,  159,   85,   48,  158,   46,  161,
			  437,   48,  436,  158,  162,   46,   85,   46,  344,   46,
			  103,  103,  103,  103,  103,  163,   85,  164,   50,   46,
			  343,  104,  104,  104,  104,  104,   46,  106,  106,  106,
			  106,  106,  730,  730,  337,   46,  104,   46,   55,  329,
			  197,   55,  197,  197,  326,  164,   85,  303,   55,  142,
			  142,  215,  215,  301,  215,  285,   55,   55,   55,   55,

			   55,   55,  142,  167,  104,  282,  234,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			  233,  167,  232,  142,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   56,  120,  120,
			   56,  120,  235,  231,  235,  235,  152,   56,  152,  152,
			  152,  152,  152,  230,  228,   56,   56,   56,   56,   56,
			   56,  120,  170,  120,  173,  227,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,

			   56,   56,   56,   56,   56,   56,   56,   56,   56,  226,
			  170,  225,  173,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   75,   75,  220,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   88,
			   88,  205,   88,   98,  201,  196,  172,   98,  208,  208,
			  169,  208,  340,  340,  166,  340,   98,   98,   98,   98,
			   98,  165,  399,  399,  168,  399,   88,  168,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   98,  168,  132,  132,  168,  132,  148,  123,  123,
			   98,  123,  208,  146,  440,  440,   98,  440,  143,  105,
			   98,  105,   98,  105,  105,  105,  105,  105,  132,  141,

			   88,   96,   96,  123,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			  101,  101,  101,  101,  101,   96,   96,   96,   96,   96,
			   96,  105,  100,   99,  123,  101,  113,  113,  174,  113,
			  114,  114,   95,  114,  115,  115,   93,  115,  116,  116,
			  175,  116,  176,   91,   96,   96,   96,   96,  101,  117,
			  117,  113,  117,  101,   80,  114,  174,  118,  118,  115,
			  118,  177,  114,  116,  113,  178,  119,  119,  175,  119,
			  176,   96,   96,   96,  117,  179,  121,  121,  115,  121,
			  117,   69,  118,  116,  126,  126,  117,  126,   54,  177,

			  114,  119,  113,  178,  160,  118,  122,  122,  180,  122,
			  160,  121,   35,  179,  124,  124,  115,  124,  117,  126,
			  119,  116,  181,   34,  117,  126,  125,  125,  121,  125,
			  182,  122,  160,  118,  457,  183,  180,  122,  160,  124,
			  122,  127,  127,   32,  127,   28,  129,  129,  119,  129,
			  181,  125,  171,  126,  184,  171,  121,  186,  182,  188,
			  124,  130,  130,  183,  130,  122,  127,   26,  122,  189,
			  190,  129,  125,  127,  457,   18,  191,  192,  133,  133,
			  171,  133,  184,  171,   17,  186,  130,  188,  124,   16,
			   13,  185,  129,  130,  286,  185,    0,  189,  190,    0,

			  125,  127,  128,  133,  191,  192,  128,  130,    0,  128,
			  133,  135,  135,  290,  135,  128,  128,  133,  128,  185,
			  128,  130,  286,  185,  133,    0,  136,  136,  198,  136,
			  128,    0,  482,  482,  128,  482,  135,  128,  133,  134,
			  134,  290,  134,  128,  135,  133,  128,  135,  128,  131,
			  131,  136,  131,  138,  138,    0,  138,  134,  134,  134,
			  134,  134,  137,  137,  134,  137,  202,  131,  131,  131,
			  131,  131,  135,  136,  131,  135,  198,  187,  138,  139,
			  139,  187,  139,  204,  292,  131,  138,  137,  131,  293,
			  140,  140,    0,  140,  131,  209,  209,    0,  209,  137,

			  198,  136,  202,  137,  139,  187,    0,    0,    0,  187,
			    0,  294,  292,  131,  138,  140,  131,  293,  295,  204,
			  199,    0,  131,  139,    0,  221,  221,  137,  221,    0,
			  202,  137,  199,  199,  199,  199,  199,    0,  199,  294,
			  140,  210,  210,  296,  210,    0,  295,  204,  229,  209,
			  297,  139,  221,    0,    0,  210,  229,  229,  229,  229,
			  229,  229,    0,    0,  298,  210,  299,    0,  140,  147,
			  199,  296,  212,  212,  238,  212,  238,    0,  297,  238,
			  238,  238,  238,  238,    0,    0,  212,  239,  239,  239,
			  239,  239,  298,    0,  299,  210,  212,  240,  240,  240,

			  240,  240,    0,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,    0,  212,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  300,    0,  214,  237,  237,  237,  237,
			  237,  214,  214,  214,  214,  214,  214,  302,    0,  305,
			    0,  237,  242,  242,  242,  242,  242,  243,    0,  243,
			    0,  300,  243,  243,  243,  243,  243,  242,  306,    0,
			  214,  214,  214,  214,  237,  302,  244,  305,  244,  237,
			  244,  244,  244,  244,  244,  245,  245,  245,  245,  245,

			  242,  247,  247,    0,  247,  242,  306,  214,  214,  214,
			  217,  217,    0,  217,  269,  269,  269,  269,  269,    0,
			  271,  271,  271,  271,  271,    0,  247,  288,  244,  288,
			  288,  288,  288,  288,    0,    0,  307,  217,  271,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  246,  246,  307,  246,  271,  248,  248,    0,
			  248,  249,  249,    0,  249,  250,  250,    0,  250,  308,
			  251,  251,    0,  251,  309,  252,  252,  246,  252,    0,
			  254,  217,  248,    0,  253,  253,  249,  253,  310,  248,

			  250,  254,    0,  246,  249,  251,  311,  308,    0,  312,
			  252,  254,  309,  250,  255,  255,  313,  255,    0,  253,
			    0,  256,  256,    0,  256,  251,  310,  248,  316,  254,
			  252,  246,  249,    0,  311,  257,  257,  312,  257,  255,
			    0,  250,  258,  258,  313,  258,  256,    0,  260,  260,
			  253,  260,  255,  251,    0,  317,  316,  318,  252,  256,
			  257,  259,  259,    0,  259,  261,  261,  258,  261,    0,
			  319,    0,  257,  260,  266,  266,  320,  266,    0,  258,
			  255,  262,  262,  317,  262,  318,  259,  256,  267,  267,
			  261,  267,  259,  321,  270,  322,  323,  270,  319,  266,

			  257,    0,    0,  270,  320,    0,  262,  258,  263,  263,
			    0,  263,  261,  267,  262,    0,  264,  264,    0,  264,
			  259,  321,  270,  322,  323,  270,  263,  263,  263,  263,
			  263,  270,  324,  263,  264,  264,  264,  264,  264,    0,
			  261,  264,  262,  265,  265,  289,  265,  289,  289,  289,
			  289,  289,  268,  268,  263,  268,  272,  272,    0,  272,
			  324,  265,  265,  265,  265,  265,  273,  273,  265,  273,
			  268,  268,  268,  268,  268,  275,  275,  268,  275,  274,
			  274,  272,  274,  276,  276,    0,  276,  278,  278,  265,
			  278,  273,  274,    0,  274,    0,  277,  277,  268,  277,

			  275,  272,  274,    0,  274,  325,  327,    0,  276,    0,
			  279,  279,  278,  279,    0,  275,  276,  280,  280,    0,
			  280,  277,  281,  281,  328,  281,  304,  332,  333,  272,
			  274,  278,    0,  325,  327,  279,    0,  304,    0,  277,
			    0,    0,  280,  275,  276,  401,    0,  281,  304,  402,
			  338,  338,  328,  338,    0,  332,  333,  403,  304,  278,
			  341,  341,    0,  341,  338,    0,  279,  277,  339,  339,
			  349,  339,  281,  401,  338,  404,  304,  402,  349,  349,
			  349,  349,  349,  349,    0,  403,    0,  341,  356,  356,
			  356,  356,  356,  355,  355,  355,  355,  355,    0,    0,

			  281,  334,  642,  404,  338,    0,    0,    0,  355,  357,
			  357,  357,  357,  357,  334,  334,  334,  334,  334,    0,
			  406,  642,  339,  407,    0,  334,  334,  334,  334,  334,
			  334,  355,  391,  391,  391,  391,  355,  358,  358,  358,
			  358,  358,  359,  359,  359,  359,  359,  357,  406,  334,
			  642,  407,  334,  334,  334,  334,  334,  334,  334,  360,
			  360,  360,  360,  360,  361,    0,  361,    0,    0,  361,
			  361,  361,  361,  361,  360,  362,  362,  362,  362,  362,
			  363,  363,  363,  363,  363,  364,  364,  364,  364,  364,
			  366,  366,  366,  366,  366,  367,  367,  360,  367,  409,

			  365,  365,  360,  365,  365,  365,  365,  365,  368,  368,
			  410,  368,  369,  369,  411,  369,  370,  370,  374,  370,
			  367,  371,  371,  364,  371,  372,  372,  409,  372,  374,
			    0,  373,  373,  368,  373,    0,  412,  369,  410,  374,
			    0,  370,  411,  367,    0,  368,  371,    0,    0,    0,
			  372,  413,  375,  375,  414,  375,  373,  374,  372,  415,
			  373,    0,    0,  370,  412,  376,  376,  371,  376,  377,
			  377,  367,  377,  368,  416,  378,  378,  375,  378,  413,
			  379,  379,  414,  379,    0,  417,  372,  415,  373,  375,
			  376,  370,    0,    0,  377,  371,    0,  418,  380,  380,

			  378,  380,  416,  381,  381,  379,  381,  389,  389,  377,
			  389,    0,  376,  417,    0,  378,  379,  375,  382,  382,
			  382,  382,  382,  380,  383,  418,  419,  383,  381,    0,
			    0,    0,  389,  383,    0,    0,  382,  377,  420,  382,
			  376,    0,  380,  378,  379,  382,    0,  381,  611,  611,
			  611,  611,  383,  421,  419,  383,  384,  384,  384,  384,
			  384,  383,  392,  392,  382,  392,  420,  382,  393,  393,
			  380,  393,    0,  382,  384,  381,  385,  385,  385,  385,
			  385,  421,  386,  386,  386,  386,  386,  392,  387,  387,
			  385,  387,    0,  393,    0,  422,  386,  390,  390,  390,

			  390,  390,  384,  386,    0,    0,  387,  387,  387,  387,
			  387,    0,    0,  387,  388,  388,    0,  388,  385,  394,
			  394,    0,  394,  422,  386,  395,  395,  423,  395,  424,
			  425,  386,  388,  388,  388,  388,  388,  396,  396,  388,
			  396,    0,  397,  397,  394,  397,  426,  431,  398,  398,
			  395,  398,  432,  433,    0,  423,  434,  424,  425,  435,
			  486,  487,  396,  398,  433,  462,  462,  397,  462,  396,
			  488,  397,  395,  398,  426,  431,    0,    0,  490,  493,
			  432,  433,  397,    0,  434,    0,    0,  435,  486,  487,
			  462,    0,  433,  483,  483,    0,  483,  396,  488,  397,

			  395,  443,  443,  443,  443,  443,  490,  493,    0,    0,
			  397,  438,  438,  438,  438,  438,  443,  445,  445,  445,
			  445,  445,  438,  438,  438,  438,  438,  438,  444,  444,
			  444,  444,  444,  446,  446,  446,  446,  446,  449,  449,
			  449,  449,  449,    0,  443,    0,    0,  483,    0,  438,
			  438,  438,  438,  438,  438,  438,  448,  448,  448,  448,
			  448,  451,  451,  451,  451,  451,  444,  458,  458,  495,
			  458,  448,  450,  450,  450,  450,  450,  452,  452,  452,
			  452,  452,  453,  453,  453,  453,  453,  455,  455,  455,
			  455,  455,  458,    0,  448,  459,  459,  495,  459,  448,

			    0,  456,  455,  456,  456,  456,  456,  456,  460,  460,
			  450,  460,    0,  461,  461,  452,  461,  496,  463,  463,
			  459,  463,    0,  458,  465,  465,    0,  465,  466,  466,
			  455,  466,    0,  460,  497,  459,  467,  467,  461,  467,
			  460,  468,  468,  463,  468,  496,  461,  469,  469,  465,
			  469,  470,  470,  466,  470,  499,  463,  465,  461,  489,
			  466,  467,  497,  459,  471,  471,  468,  471,  460,    0,
			  500,  489,  469,  467,  461,    0,  470,    0,    0,  481,
			  469,    0,    0,  499,  463,  465,  461,  489,  466,  471,
			  481,  472,  472,    0,  472,  470,    0,  471,  500,  489,

			  481,  467,    0,  473,  473,  473,  473,  473,  469,  472,
			  472,  472,  472,  472,    0,    0,  472,    0,  481,    0,
			    0,  473,    0,  470,  473,  471,  477,  477,    0,  477,
			  473,    0,  474,  474,  474,  474,  474,  475,  475,  475,
			  475,  475,  476,  476,  476,  476,  476,  478,  478,  473,
			  478,  477,  473,  474,  479,  479,  491,  479,  473,  477,
			  480,  480,  501,  480,  502,  503,  504,  505,  491,  506,
			    0,  507,  478,    0,  508,  509,  510,  511,  512,  479,
			  478,  474,  513,  552,  491,  480,    0,  477,    0,    0,
			  501,    0,  502,  503,  504,  505,  491,  506,  479,  507,

			  519,  480,  508,  509,  510,  511,  512,  516,  478,  516,
			  513,  552,  516,  516,  516,  516,  516,  517,  517,  517,
			  517,  517,    0,  519,  553,  554,  479,    0,  519,  480,
			  514,  514,  514,  514,  514,  518,  518,  518,  518,  518,
			    0,  514,  514,  514,  514,  514,  514,  520,  520,  520,
			  520,  520,  553,  554,    0,  517,  521,  521,  521,  521,
			  521,    0,  520,  522,  522,  522,  522,  522,  514,  514,
			  514,  514,  514,  514,  514,  523,  523,  523,  523,  523,
			  524,  524,  524,  524,  524,  525,  525,  525,  525,  525,
			  520,    0,  555,    0,  521,  526,  526,  526,  526,  526,

			  527,    0,  527,    0,  556,  527,  527,  527,  527,  527,
			  528,  528,  528,  528,  528,  558,  529,  529,  524,  529,
			  555,  530,  530,  549,  530,  528,  531,  531,  559,  531,
			  532,  532,  556,  532,  549,  533,  533,  535,  533,  534,
			  534,  529,  534,  558,  549,  529,  530,  544,  561,  544,
			  530,  531,  562,  528,  535,  532,  559,  544,  535,  531,
			  533,    0,  549,    0,  534,  536,  536,    0,  536,  563,
			  532,  537,  537,  529,  537,  564,  561,  534,  530,  565,
			  562,  566,  535,  538,  538,  544,  538,  531,  539,  539,
			  536,  539,  540,  540,    0,  540,  537,  563,  532,  541,

			  541,    0,  541,  564,  537,  534,  567,  565,  538,  566,
			  536,  545,  545,  539,  545,    0,    0,  540,  542,  542,
			  542,  542,  542,  568,  541,  540,  569,  546,  546,  538,
			  546,  541,  537,  539,  567,  570,  545,  571,  536,  542,
			  543,  543,  543,  543,  543,  542,  572,  547,  547,  550,
			  547,  568,  546,  540,  569,  548,  548,  538,  548,  541,
			  550,  539,  573,  570,  575,  571,  576,  542,  577,  579,
			  550,  546,  547,  542,  572,    0,    0,  618,  547,    0,
			  548,  582,  582,  582,  582,  582,  619,  548,  550,    0,
			  573,    0,  575,    0,  576,    0,  577,  579,  620,  546,

			  583,  583,  583,  583,  583,  618,  547,  584,  584,  584,
			  584,  584,    0,    0,  619,  548,  580,  580,  580,  580,
			  580,  588,  588,  588,  588,  588,  620,  580,  580,  580,
			  580,  580,  580,  585,    0,  585,    0,    0,  585,  585,
			  585,  585,  585,  586,  589,  586,    0,    0,  586,  586,
			  586,  586,  586,    0,  580,  580,  580,  580,  580,  580,
			  580,  587,  587,  587,  587,  587,    0,  589,  597,  597,
			  622,  597,  589,  590,  590,  590,  590,  590,  591,  591,
			  591,  591,  591,  593,  593,  593,  593,  593,  595,  595,
			  595,  595,  595,  597,  598,  598,    0,  598,  622,  587,

			  596,  624,  596,  595,    0,  596,  596,  596,  596,  596,
			  599,  599,  597,  599,  600,  600,  602,  600,    0,  598,
			    0,  601,  601,  628,  601,    0,  595,  603,  603,  624,
			  603,  595,  598,  602,    0,  599,  631,  602,    0,  600,
			  597,  604,  604,  634,  604,  600,  601,  605,  605,  636,
			  605,  628,  603,  606,  606,    0,  606,    0,    0,    0,
			  598,  602,  607,  607,  631,  607,  604,  608,  608,    0,
			  608,  634,  605,  600,    0,    0,    0,  636,  606,  609,
			  609,  609,  609,  609,  638,  613,  613,  607,  613,  639,
			  614,  614,  608,  614,  640,  615,  615,  605,  615,  641,

			    0,  670,  607,  610,  610,  610,  610,  610,    0,    0,
			  613,    0,  638,    0,    0,  614,    0,  639,  613,    0,
			  615,    0,  640,    0,  671,  605,  614,  641,  615,  670,
			  607,  645,  645,  645,  645,  645,  646,  646,  646,  646,
			  646,  647,  647,  647,  647,  647,  613,  648,  648,  648,
			  648,  648,  671,    0,  614,    0,  615,  649,  649,  649,
			  649,  649,  650,    0,  650,  672,    0,  650,  650,  650,
			  650,  650,    0,    0,  646,  653,  653,  653,  653,  653,
			  654,  654,  654,  654,  654,  655,  655,  655,  655,  655,
			  653,  656,  656,  672,  656,  657,  657,    0,  657,    0, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  658,  658,    0,  658,  660,  660,    0,  660,    0,  661,
			  661,    0,  661,  653,    0,    0,  656,    0,  653,    0,
			  657,    0,  656,  655,    0,  658,    0,  665,  665,  660,
			  665,    0,  657,  658,  661,  663,  663,  663,  663,  663,
			  661,  664,  664,  664,  664,  664,  666,  666,  673,  666,
			  656,  668,  665,  667,  667,  668,  667,  674,  677,  665,
			  657,  658,  678,  669,  679,  680,  682,  669,  661,    0,
			    0,  666,  668,    0,    0,    0,  673,    0,  667,  666,
			    0,    0,    0,  668,  669,  674,  677,  665,    0,    0,
			  678,    0,  679,  680,  682,  669,  685,  685,  685,  685,

			  685,  687,  687,  687,  687,  687,    0,  666,  688,  688,
			  688,  688,  688,  689,  689,  689,  689,  689,  690,  690,
			  690,  690,  690,  691,  691,    0,  691,  692,  692,    0,
			  692,    0,  693,  693,  685,  693,  694,  694,    0,  694,
			  695,  695,  695,  695,  695,    0,  688,  701,  691,  702,
			  703,    0,  692,  696,  696,  696,  690,  693,  699,  691,
			    0,  694,  699,  697,  697,    0,  697,  698,  698,  694,
			  698,  706,  700,  692,  707,  701,  700,  702,  703,  699,
			  709,  712,  712,  712,  712,  712,  724,  691,  697,  725,
			  699,  696,  698,  700,    0,  714,  714,  694,  714,  706,

			    0,  692,  707,    0,  700,    0,    0,    0,  709,  715,
			  715,    0,  715,  698,  724,  716,  716,  725,  716,  712,
			  714,  717,  717,  717,  717,  717,  726,  727,  714,  718,
			  718,  718,  718,  718,  715,  719,  719,  719,  719,  719,
			  716,  698,  721,  721,  728,  721,  729,    0,  731,  731,
			    0,  731,  738,    0,  726,  727,  714,  743,    0,  715,
			  716,  732,  732,    0,  732,  733,  733,  721,  733,    0,
			    0,    0,  728,  731,  729,  734,  734,  734,  734,  734,
			  738,  736,  736,    0,  736,  743,  732,  715,  716,  749,
			  733,  735,  721,  735,  731,  737,  735,  735,  735,  735,

			  735,    0,  750,  737,    0,    0,  736,  744,  744,  744,
			  744,  744,  745,  745,    0,  745,  737,  749,  752,  752,
			  721,  752,  731,  736,  746,  746,  746,  746,  746,  735,
			  750,  737,  747,  747,  748,  747,  751,  745,  751,  756,
			  763,    0,  748,  752,  754,  754,  751,  754,    0,    0,
			    0,  736,  762,    0,  770,  748,  770,  747,    0,    0,
			  752,    0,  745,  762,  770,  747,    0,  756,  763,  754,
			  748,    0,    0,  762,  751,  753,  753,  753,  753,  753,
			  758,  758,  758,  758,  758,    0,  761,  761,  752,  761,
			  745,  762,  770,  747,  759,  759,  759,  759,  764,  764,

			  764,  764,  764,  765,  765,  765,  765,  765,    0,  766,
			  766,  761,  766,    0,  767,  774,  774,  774,  774,  761,
			  769,  769,  769,  769,  769,  767,  772,  772,  772,  772,
			  772,  776,    0,    0,  766,  767,  773,  773,  773,  773,
			  773,  777,  777,  777,  777,  777,  779,  761,  776,  781,
			  781,  781,  776,  767,  778,  778,  778,  778,  778,    0,
			    0,    0,    0,  779,    0,    0,    0,  779,  780,  780,
			  780,  780,  780,    0,    0,    0,  776,  783,  783,  783,
			  783,  783,  784,  784,  784,  784,  784,  781,    0,    0,
			    0,  779,  785,  785,  785,  785,  785,  787,  787,  787,

			  787,  787,  788,    0,  788,    0,    0,  788,  788,  788,
			  788,  788,  789,  789,  789,  789,  789,  790,  790,  790,
			  790,  790,  818,  818,    0,    0,    0,    0,  818,  818,
			  818,  818,  818,  818,    0,    0,    0,    0,    0,    0,
			  788,  792,  792,  792,  792,  792,  792,  792,  792,  792,
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
			  795,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  797,  797,    0,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,    0,  797,  797,  797,  797,
			  797,  798,  798,    0,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  799,  799,  799,    0,
			    0,    0,    0,    0,    0,  799,  799,    0,    0,  799,
			    0,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,    0,    0,  799,  799,  799,  800,

			  800,    0,  800,  800,    0,  800,  800,    0,    0,    0,
			    0,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,    0,    0,  800,  800,  800,  801,
			  801,    0,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  802,  802,    0,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,

			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  803,
			  803,    0,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,

			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,    0,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  806,  806,  806,    0,    0,    0,
			  806,  806,    0,  806,  806,    0,    0,    0,    0,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,    0,  806,  806,  806,  806,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  809,  809,    0,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  810,  810,    0,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,

			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  812,  812,  812,  812,  812,  812,  812,  812,
			    0,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  813,  813,    0,
			  813,  813,    0,  813,  813,  813,    0,    0,    0,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,

			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,    0,    0,  813,  813,  813,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  815,  815,  815,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,

			    0,    0,    0,    0,    0,  815,  816,  816,    0,  816,
			    0,    0,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,    0,    0,  816,  816,  816,
			  817,  817,  817,  817,  817,  817,    0,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			    0,  817,  817,  817,  817,  819,  819,  819,    0,    0,
			    0,  819,  819,    0,  819,  819,    0,    0,    0,    0,

			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,    0,    0,  819,  819,  819,  820,  820,
			  820,    0,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,    0,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  821,  821,    0,    0,    0,    0,  821,
			  821,  821,  821,  821,  821,  822,  822,    0,    0,    0,
			    0,  822,  822,  822,  822,  822,  822,  823,  823,  823,

			  823,  823,  823,  823,  823,    0,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  824,  824,    0,    0,    0,    0,  824,  824,
			  824,  824,  824,  824,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,

			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791, yy_Dummy>>,
			1, 1938, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64,  990, 4854,   92,  986,  956,  968, 4854,
			   88, 4854, 4854, 4854, 4854, 4854,  950,   82,  926,   91,
			 4854, 4854,  915, 4854,  895,  882,  184,  114,  169,  253,
			  265,  271,  292,  276,  320,  324,  397,  338,  366,  351,
			  378,  115, 4854, 4854,  841,  476,  555,   70,  142,  154,
			   72,  230,   87,   77,  142,  146,  148,  148,  142,  872,
			 4854, 4854,  114,  197, 4854,  635,  128,  247, 4854,  263,
			  809, 4854,  282,  308,  370,  430, 4854,  186,  717, 4854,
			  225,  850, 4854,  839, 4854,  831,  800,    0,  716,  830,

			  814,  800, 4854,  430,  441,  773,  447, 4854, 4854, 4854,
			  347,  387, 4854,  834,  838,  842,  846,  857,  865,  874,
			  556,  884,  904,  776,  912,  924,  892,  939,  968,  944,
			  959, 1047,  771,  976, 1037, 1009, 1024, 1060, 1051, 1077,
			 1088,  774,  477,  731, 4854,  343,  770, 1144,  758,  246,
			  326,    0,  548,  339,  348,  349,  351,  354,  376,  359,
			  871,  371,  370,  387,  411,  716,  709,  459,  711,  672,
			  538,  919,  668,  536,  790,  802,  804,  838,  841,  852,
			  874,  887,  881,  900,  905,  952,  922, 1038,  924,  923,
			  924,  924,  925, 4854,  202, 4854,  718,  478, 1021, 1112,

			 4854,  717, 1047, 4854, 1064,  666, 4854,   76,  726, 1093,
			 1139, 4854, 1170,  137, 1226,  489,  283, 1308, 4854, 4854,
			  609, 1123, 4854, 4854, 4854,  532,  583,  574,  563, 1137,
			  562,  552,  521,  519,  495,  560, 4854, 1226, 1159, 1167,
			 1177, 4854, 1242, 1252, 1270, 1275, 1360, 1299, 1365, 1369,
			 1373, 1378, 1383, 1392, 1360, 1412, 1419, 1433, 1440, 1459,
			 1446, 1463, 1479, 1506, 1514, 1541, 1472, 1486, 1550, 1294,
			 1456, 1300, 1554, 1564, 1577, 1573, 1581, 1594, 1585, 1608,
			 1615, 1620,  480, 4854, 4854,  476,  951,    0, 1309, 1527,
			  970,    0, 1050, 1055, 1076, 1078, 1096, 1115, 1124, 1119,

			 1196,  435, 1210,  429, 1607, 1219, 1238, 1297, 1340, 1344,
			 1358, 1367, 1376, 1383,    0,    0, 1379, 1420, 1408, 1435,
			 1434, 1458, 1453, 1461, 1487, 1559,  426, 1561, 1578,  421,
			    0,    0, 1575, 1576, 1694,  210, 4854,  471, 1648, 1666,
			  730, 1658,    0,  434,  437, 4854, 4854, 4854, 4854, 1659,
			 4854, 4854, 4854, 4854, 4854, 1673, 1668, 1689, 1717, 1722,
			 1739, 1749, 1755, 1760, 1765, 1783, 1770, 1793, 1806, 1810,
			 1814, 1819, 1823, 1829, 1788, 1850, 1863, 1867, 1873, 1878,
			 1896, 1901, 1898, 1886, 1936, 1956, 1962, 1986, 2012, 1905,
			 1977, 1712, 1960, 1966, 2017, 2023, 2035, 2040, 2046,  740,

			    0, 1595, 1599, 1618, 1636,    0, 1671, 1675,    0, 1750,
			 1762, 1779, 1805, 1816, 1815, 1810, 1832, 1843, 1858, 1877,
			 1896, 1915, 1957, 1981, 1983, 1984, 2000,    0,    0,    0,
			    0, 1998, 2018, 2022, 2007, 2025,  425,  423, 2091, 4854,
			  782,    0, 4854, 2081, 2108, 2097, 2113,  412, 2136, 2118,
			 2152, 2141, 2157, 2162,  383, 2167, 2183,  916, 2165, 2193,
			 2206, 2211, 2063, 2216,  352, 2222, 2226, 2234, 2239, 2245,
			 2249, 2262, 2289, 2283, 2312, 2317, 2322, 2324, 2345, 2352,
			 2358, 2249, 1030, 2091,  284,  270, 2018, 2019, 2036, 2224,
			 2044, 2321,    0, 2039,    0, 2134, 2183, 2195,    0, 2220,

			 2236, 2323, 2329, 2330, 2320, 2332, 2323, 2336, 2339, 2340,
			 2330, 2334, 2343, 2347, 2410,    0, 2392, 2397, 2415, 2365,
			 2427, 2436, 2443, 2455, 2460, 2465, 2475, 2485, 2490, 2514,
			 2519, 2524, 2528, 2533, 2537, 2507, 2563, 2569, 2581, 2586,
			 2590, 2597, 2598, 2620, 2532, 2609, 2625, 2645, 2653, 2493,
			 2619, 4854, 2352, 2393, 2394, 2457, 2462,    0, 2480, 2486,
			    0, 2508, 2505, 2534, 2527, 2532, 2546, 2558, 2576, 2579,
			 2600, 2603, 2611, 2628,    0, 2618, 2633, 2634,    0, 2623,
			 2696,    0, 2661, 2680, 2687, 2718, 2728, 2741, 2701, 2709,
			 2753, 2758,  303, 2763, 4854, 2768, 2785, 2766, 2792, 2808,

			 2812, 2819, 2786, 2825, 2839, 2845, 2851, 2860, 2865, 2859,
			 2883, 1928, 4854, 2883, 2888, 2893,  289,  258, 2631, 2646,
			 2658,    0, 2737,    0, 2768,    0,    0,    0, 2771,    0,
			    0, 2784,    0,    0, 2801,    0, 2807,    0, 2849, 2851,
			 2859, 2864, 1695,  205,  156, 2911, 2916, 2921, 2927, 2937,
			 2947,  146,  104, 2955, 2960, 2965, 2989, 2993, 2998, 4854,
			 3002, 3007, 4854, 3015, 3021, 3025, 3044, 3051, 3021, 3033,
			 2868, 2885, 2926, 3013, 3022,    0,    0, 3025, 3029, 3030,
			 3030,    0, 3032,  276,  187, 3076,   87, 3081, 3088, 3093,
			 3098, 3121, 3125, 3130, 3134, 3120, 3138, 3161, 3165, 3128,

			 3142, 3109, 3101, 3102,    0,    0, 3136, 3139,    0, 3132,
			    0, 4854, 3161,   86, 3193, 3207, 3213, 3201, 3209, 3215,
			 4854, 3240,  296, 4854, 3151, 3137, 3174, 3180, 3197, 3194,
			  452, 3246, 3259, 3263, 3255, 3276, 3279, 3265, 3204,    0,
			    0,    0,    0, 3213, 3287, 3310, 3304, 3330, 3304, 3237,
			 3267, 3321, 3316, 3355, 3342,  105, 3295,    0, 3360, 3374,
			 4854, 3384, 3322, 3305, 3378, 3383, 3407, 3384,    0, 3400,
			 3339,   83, 3406, 3416, 3395, 4854, 3401, 3421, 3434, 3416,
			 3448, 3434, 4854, 3457, 3462, 3472, 4854, 3477, 3487, 3492,
			 3497, 4854, 3540, 3585, 3630, 3675, 3720, 3765, 3810, 3854,

			 3894, 3938, 3983, 4028, 4073, 4118, 4162, 4206, 4251, 4296,
			 4341, 4386, 4431, 4472, 4516, 4560, 4595, 4639, 3511, 4683,
			 4727, 4762, 4774, 4796, 4831, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  791,    1,  792,  792,  793,  793,  794,  794,  795,
			  795,  796,  796,  791,  791,  791,  791,  791,  797,  791,
			  798,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  800,  791,  791,  801,  791,  791,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,  791,
			  791,  791,  802,  791,  791,  791,  803,  804,  791,  804,
			  805,  791,  806,  791,  806,  806,  791,  807,  808,  791,
			  791,  791,  791,  797,  791,  809,  810,  809,  809,  811,

			  791,  791,  791,  791,  812,  791,  791,  791,  791,  791,
			  791,  799,  791,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,   46,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  813,  800,  801,  791,  791,  791,   56,  791,  147,
			  147,   56,   56,   56,   56,  147,   56,  147,  147,   56,
			   56,  147,  147,   56,   56,  147,   56,  147,  147,  147,
			   56,   56,   56,  147,   56,  147,   56,  147,  147,   56,
			   56,  147,  147,   56,   56,  147,  147,   56,   56,  147,
			   56,  147,   56,  791,  802,  791,  803,  791,  802,   75,

			  791,  803,  804,  791,  804,  805,  791,  805,  806,  791,
			  806,  791,  791,  791,  814,  791,  807,  808,  791,  791,
			  217,  815,  791,  791,  791,  791,  816,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  799,  799,  799,  799,
			  799,  799,  799,  799,  791,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  131,
			  131,  131,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  791,  791,  791,  791,  147,  147,  791,  147,
			   56,   56,  147,   56,  147,  147,  147,   56,   56,   56,

			  147,  147,   56,   56,  791,  147,  147,  147,  147,   56,
			   56,   56,  147,   56,  147,   56,  147,  147,   56,   56,
			  147,  147,   56,   56,  147,  147,  147,   56,   56,   56,
			  147,   56,  147,   56,  802,  802,  791,  817,  817,  791,
			  817,  815,  818,  816,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  799,  799,  799,
			  799,  799,  799,  799,  791,  799,  799,  799,  799,  799,
			  799,  799,  131,  131,  382,  382,  382,  799,  799,  799,
			  791,  791,  799,  799,  799,  799,  799,  799,  799,  819,

			  820,  147,   56,  147,   56,  147,  147,  147,   56,   56,
			   56,  147,  147,   56,  147,  147,  147,  147,   56,   56,
			   56,  147,   56,  147,  147,   56,   56,  147,  147,   56,
			   56,  147,  147,  147,   56,   56,  147,   56,  334,  791,
			  791,  821,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  812,  791,  791,  799,  799,
			  799,  799,  799,  799,  791,  799,  799,  799,  799,  799,
			  799,  799,  799,  382,  473,  791,  791,  799,  799,  799,
			  799,  791,  791,  819,  147,   56,  147,   56,  147,  147,
			   56,   56,  147,  147,   56,  147,  147,  147,  147,   56,

			   56,   56,  147,   56,  147,  147,   56,   56,  147,  147,
			  147,  147,   56,   56,  438,  822,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  823,  799,
			  799,  799,  799,  799,  799,  791,  799,  799,  799,  799,
			  799,  799,  473,  791,  791,  799,  799,  799,  799,  791,
			  791,  791,  147,  147,   56,  147,  147,  147,   56,   56,
			   56,  147,  147,  147,  147,   56,   56,   56,  147,   56,
			  147,  147,   56,   56,  147,  147,  147,  147,   56,   56,
			  514,  824,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  799,  799,  799,

			  799,  799,  791,  799,  799,  799,  799,  799,  799,  791,
			  791,  791,  791,  799,  799,  799,  791,  791,  147,  147,
			   56,  147,  147,   56,   56,  147,  147,  147,  147,   56,
			   56,   56,  147,   56,  147,  147,   56,   56,  147,  147,
			  147,   56,  802,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  799,  799,  799,  791,
			  799,  799,  791,  791,  791,  799,  799,  799,  791,  791,
			  147,  147,   56,  147,   56,  147,   56,  147,   56,  147,
			  147,  147,   56,  802,  791,  791,  791,  791,  791,  791,
			  791,  799,  799,  799,  799,  791,  791,  799,  799,  791,

			  791,  147,  147,   56,  147,   56,  147,   56,  147,  147,
			   56,  791,  791,  791,  799,  799,  799,  791,  791,  791,
			  791,  799,  791,  791,  147,  147,   56,  147,   56,  147,
			  791,  799,  799,  799,  791,  791,  799,  791,  147,  147,
			   56,  147,   56,  147,  791,  799,  791,  799,  791,  147,
			  147,  791,  799,  791,  799,  791,  147,  147,  791,  791,
			  791,  799,  791,  147,  791,  791,  799,  791,  147,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,    0,  791,  791,  791,  791,  791,  791,  791,  791,

			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791, yy_Dummy>>)
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
			   14,   12,   29,   10,   30,   20,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   79,   91,   91,   91,
			   91,   22,   31,   23,    9,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   24,
			   21,   25,  112,  113,  114,  112,  115,  130,   96,  130,
			  130,  130,  130,  130,  130,  130,   66,  130,  130,   90,
			    1,    2,   28,  107,  106,  127,  127,  127,  127,    3,

			   33,  102,   32,    0,    0,   98,    0,   27,   26,   19,
			    0,   91,   87,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   40,   91,   86,
			   86,   78,   84,   86,   91,   91,   91,   91,   91,   91,
			   91,    0,    0,    0,   97,    0,    0,   93,    0,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   40,   93,
			   40,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   94,  112,  114,    0,  113,  112,  112,

			  109,  108,    0,   96,    0,    0,   95,    0,    0,    0,
			    0,   66,    0,   64,    0,   63,    0,    0,   90,   88,
			   88,    0,   89,  127,  116,  127,  127,  127,  127,  127,
			  127,  127,  127,  127,  127,    4,   34,  102,    0,    0,
			    0,  100,  102,  100,   98,    0,   91,   39,   91,   91,
			   91,   91,   91,   91,    0,   91,   91,   91,   91,   91,
			   42,   91,   91,   79,   80,   79,   80,   77,   79,   85,
			   91,   85,   85,   85,   74,   91,   91,   91,   91,   91,
			   41,   91,    0,   67,   92,    0,   93,   39,   68,   68,
			   93,   39,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,    0,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   42,   42,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   41,   41,   93,   93,  112,  110,   95,    0,    0,   65,
			   63,    0,    0,    0,    0,  123,  121,  124,  128,  128,
			  122,  120,  117,  118,  119,  102,    0,  102,    0,    0,
			  102,    0,    0,    0,  101,   98,    0,   91,   91,   38,
			   91,   91,   91,   91,    0,   91,   91,   91,   91,   91,
			   91,   91,   91,   78,   91,   91,   91,   78,   78,   78,
			    0,    0,   74,   37,   44,   91,   91,   91,   91,   62,

			   60,   93,   93,   93,   93,   38,   93,   93,   38,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   37,   44,   37,
			   44,   93,   93,   93,   93,   93,   93,   93,  112,   65,
			   63,    0,  125,  102,  102,    0,    0,   99,  102,    0,
			  101,    0,  101,    0,    0,    0,   98,    0,   91,   91,
			   91,   91,   45,   91,    0,   91,   91,   91,   36,   91,
			   91,   91,   80,   91,   91,    0,    0,   91,   91,   91,
			   91,    0,   62,    0,   93,   93,   93,   93,   93,   93,
			   93,   93,   45,   93,   45,   93,   93,   93,   36,   93,

			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,  112,    0,    0,  102,    0,  105,
			  102,  101,    0,    0,  101,    0,    0,  100,    0,   91,
			   91,   91,   91,   47,   91,    0,   91,   91,   91,   91,
			   91,   91,   91,    0,   73,   53,   91,   91,   91,    0,
			    0,   61,   93,   93,   93,   93,   93,   47,   93,   93,
			   47,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   53,   93,   93,   93,   53,   93,
			  112,    0,    0,  102,    0,    0,    0,  101,    0,  105,
			  101,    0,   76,    0,  103,  105,  103,   91,   91,   59,

			   91,   46,    0,   43,   58,   91,   35,   91,   51,    0,
			    0,    0,   73,   91,   91,   91,    0,    0,   93,   93,
			   93,   59,   93,   59,   93,   46,   43,   58,   93,   43,
			   58,   93,   35,   35,   93,   51,   93,   51,   93,   93,
			   93,   93,  112,    0,  105,    0,  105,    0,  101,    0,
			    0,  104,    0,  105,    0,  104,   91,   91,   91,   82,
			   54,   91,   74,    0,    0,   91,   91,   55,    0,    0,
			   93,   93,   93,   93,   93,   54,   54,   93,   93,   93,
			   93,   55,   93,  111,    0,  105,  104,    0,  104,    0,
			  104,   91,   91,   48,   91,    0,   72,   52,   91,    0,

			    0,   93,   93,   93,   48,   48,   93,   93,   52,   93,
			   52,  126,  104,   75,   91,   91,   91,    0,    0,    0,
			   72,   91,   81,   81,   93,   93,   93,   93,   93,   93,
			    0,   91,   50,   49,    0,   72,   91,    0,   93,   50,
			   50,   49,   49,   93,    0,   91,    0,   91,    0,   93,
			   93,   71,   91,    0,   56,    0,   93,   56,    0,    0,
			   71,   91,    0,   93,    0,    0,   57,    0,   57,    0,
			   70,    0,    0,    0,    0,   70,    0,    0,    0,    0,
			    0,   69,   83,    0,    0,    0,   69,    0,   69,    0,
			    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4854
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 791
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 792
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
