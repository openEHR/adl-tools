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
if yy_act <= 97 then
if yy_act <= 81 then
if yy_act <= 73 then
if yy_act <= 69 then
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
if yy_act = 68 then
--|#line 256 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 256")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 263 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 263")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 71 then
if yy_act = 70 then
--|#line 264 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 264")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 265 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 265")
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

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 273 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 273")
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
--|#line 274 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 274")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 281 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 281")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 76 then
--|#line 282 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 282")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 290 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 290")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 79 then
if yy_act = 78 then
--|#line 291 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 291")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 292 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 292")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 80 then
--|#line 300 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 300")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 307 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 307")
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
--|#line 314 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 314")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 321 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 321")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 84 then
--|#line 322 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 322")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 323 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 323")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 87 then
if yy_act = 86 then
--|#line 335 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 335")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 340 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 340")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 88 then
--|#line 344 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 344")
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
--|#line 379 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 379")
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
--|#line 384 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 384")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 389 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 389")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 92 then
--|#line 395 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 395")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 401 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 401")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 95 then
if yy_act = 94 then
--|#line 407 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 407")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 411 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 411")
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
--|#line 421 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 421")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 428 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 428")
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
--|#line 433 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 433")
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
--|#line 448 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 448")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 100 then
--|#line 449 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 449")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 450 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 450")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 103 then
if yy_act = 102 then
	yy_end := yy_end - 1
--|#line 454 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 454")
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
--|#line 455 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 455")
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
--|#line 456 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 456")
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
--|#line 476 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 476")
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
--|#line 480 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 480")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 486 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 486")
end
in_buffer.append_character ('\')
end
else
if yy_act = 108 then
--|#line 487 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 487")
end
in_buffer.append_character ('"')
else
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
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
--|#line 502 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 502")
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
--|#line 516 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 516")
end
in_buffer.append_string (text)
end
else
if yy_act = 112 then
--|#line 518 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 518")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
--|#line 523 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 523")
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
--|#line 534 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 534")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 542 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 542")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 116 then
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 544 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 544")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
else
if yy_act <= 119 then
if yy_act = 118 then
--|#line 545 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 545")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 546 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 546")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
else
if yy_act = 120 then
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 548 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 548")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 125 then
if yy_act <= 123 then
if yy_act = 122 then
--|#line 549 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 549")
end
last_token := V_CHARACTER; last_character_value := '"'
else
--|#line 550 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 550")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
end
else
if yy_act = 124 then
--|#line 555 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 555")
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
--|#line 565 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 565")
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
--|#line 575 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 575")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 576 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 576")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 128 then
--|#line 580 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 580")
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
			create an_array.make (0, 4855)
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
			   88,   75,   75,   88,   90,  334,   90,   90,   96,   97,

			  100,  155,  101,  101,  101,  101,  101,  103,  770,  104,
			  165,  105,  105,  105,  105,  105,  110,  110,  173,  110,
			  175,  195,   79,   79,  683,  683,  683,  141,  141,  156,
			  756,  207,  141,  141,  724,  200,   76,   76,  166,  213,
			  213,  112,  213,   98,   89,  517,  174,   89,  176,  106,
			   80,   80,   81,   82,   83,   81,   82,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   84,  196,
			   81,  110,  110,  141,  110,  177,   81,   81,   81,   81,
			   81,   81,  157,  201,  181,  161,  110,  110,  178,  110,
			  185,  189,  182,  158,  191,  186,  112,  162,  705,  197,

			  115,  197,  197,  179,  449,   81,   81,   86,   81,  195,
			  159,  112,  183,  163,  441,  217,  180,  195,  187,  190,
			  184,  160,  192,  188,  113,  164,  114,   90,  115,   90,
			   90,  678,   81,   81,   81,   81,   82,   83,   81,   82,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   84,  113,   81,  114,  110,  110,  196,  110,   81,
			   81,   81,   81,   81,   81,  196,  203,  110,  110,  218,
			  110,  167,  168,  110,  110,  663,  110,  169,  110,  110,
			  112,  110,  206,  195,  208,  209,  284,  208,   81,   81,
			   86,   81,  112,  116,  110,  110,  118,  110,  112,  170,

			  171,  731,  204,  112,  117,  172,  662,  124,  119,  120,
			  209,  209,  217,  209,  284,   81,   81,   81,  204,  112,
			  646,  116,  110,  110,  118,  110,  110,  110,  546,  110,
			  205,  196,  117,  121,  122,  124,  119,  120,  211,  123,
			  110,  110,  546,  110,  731,  145,  205,  112,  145,  110,
			  110,  112,  110,  110,  110,  146,  110,  126,  134,  134,
			  285,  121,  122,  125,  211,  112,  218,  123,  110,  110,
			  127,  110,  212,  209,  112,  212,  135,  530,  112,  284,
			  110,  110,  285,  110,  136,  126,  213,  214,  285,  110,
			  110,  125,  110,  112,  139,  290,  215,  290,  127,  110,

			  110,  292,  110,  521,  135,  112,  292,  288,  137,  293,
			  289,  298,  136,  138,  112,  294,  299,  128,  128,  128,
			  128,  128,  139,  290,  112,  291,  211,  298,  103,  292,
			  140,  129,  212,  209,  295,  212,  137,  293,  130,  298,
			  476,  138,  476,  294,  299,  131,  213,  132,  438,  133,
			  240,  240,  240,  240,  240,  300,  215,  299,  140,  129,
			  342,  242,  242,  242,  242,  242,  130,  245,  245,  245,
			  245,  245,  738,  738,  435,  132,  243,  133,  145,  429,
			  197,  145,  197,  197,  429,  301,  211,  408,  146,  141,
			  141,  215,  215,  408,  215,  396,  147,  147,  147,  147,

			  147,  148,  280,  303,  243,  395,  352,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  149,  147,  150,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  351,  303,  350,  281,  147,  151,  151,  152,  151,  151,
			  151,  151,  151,  151,  153,  151,  154,  151,  151,  151,
			  151,  151,  152,  151,  151,  151,  151,  145,  110,  110,
			  145,  110,  235,  349,  235,  235,  286,  146,  287,  287,
			  287,  287,  287,  348,  344,  147,  147,  147,  147,  147,
			  148,  254,  303,  112,  310,  343,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,

			  147,  147,  147,  147,  147,  147,  147,  147,  147,  342,
			  307,  340,  310,  147,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  194,  194,  785,  194,
			  194,  194,  195,  198,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  194,
			  196,  194,  194,  194,  199,  199,  199,  199,  199,  199,

			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  194,  194,  194,  220,
			  220,  207,  220,  227,  195,  195,  306,  228,  208,  209,
			  306,  208,  338,  436,  302,  338,  229,  229,  229,  229,
			  229,  254,  477,  477,  304,  477,  221,  305,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  230,  304,  110,  110,  305,  110,  283,  110,  110,
			  231,  110,  211,  282,  215,  215,  232,  215,  144,  103,
			  233,  104,  234,  244,  244,  244,  244,  244,  112,  280,

			  222,  223,  223,  112,  223,  223,  223,  223,  225,  223,
			  223,  224,  223,  223,  223,  223,  223,  223,  223,  223,
			  237,  237,  237,  237,  237,  223,  223,  223,  223,  223,
			  223,  106,  236,  235,  258,  238,  110,  110,  310,  110,
			  110,  110,  224,  110,  110,  110,   94,  110,  110,  110,
			  312,  110,  312,   91,  223,  223,  223,  223,  239,  110,
			  110,  112,  110,  238,  207,  112,  311,  110,  110,  112,
			  110,  314,  247,  112,  246,  315,  110,  110,  312,  110,
			  313,  223,  223,  223,  112,  314,  110,  110,  248,  110,
			  250,  193,  112,  249,  110,  110,  251,  110,  144,  314,

			  247,  112,  246,  315,  293,  252,  110,  110,  109,  110,
			  294,  112,  108,  316,  110,  110,  248,  110,  250,  112,
			  253,  249,  107,  102,  251,  261,  110,  110,  255,  110,
			  195,  112,  296,  252,  315,  318,  263,  256,  297,  112,
			  257,  110,  110,  264,  110,   99,  523,   94,  253,  677,
			  111,  112,  265,  261,  266,   92,  255,   91,  110,  110,
			  259,  110,  317,  318,  263,  256,  112,  195,  257,  319,
			  318,  264,  260,  262,  110,  110,  785,  110,  196,  319,
			  265,  785,  266,  112,  110,  110,  106,  110,  259,  785,
			  324,  304,  110,  110,  305,  110,  324,  319,  320,  112,

			  260,  262,  110,  110,  267,  110,  129,  321,  785,  112,
			  272,  272,  272,  272,  272,  196,  129,  112,  324,  308,
			  267,  785,  309,  130,  327,  110,  110,  112,  110,  785,
			  267,  328,  785,  785,  129,  110,  110,  785,  110,  332,
			  785,  785,  110,  110,  129,  110,  785,  785,  785,  274,
			  112,  130,  785,  268,  268,  268,  268,  268,  273,  328,
			  112,  120,  110,  110,  322,  110,  785,  112,  323,  110,
			  110,  269,  110,  328,  270,  110,  110,  274,  110,  275,
			  271,  330,  330,  276,  322,  785,  273,  112,  323,  120,
			  785,  203,  322,  206,  112,  277,  323,  785,  397,  269,

			  112,  329,  270,  397,  399,  785,  194,  275,  271,  330,
			  331,  276,  325,  278,  209,  209,  326,  209,  199,  199,
			  199,  199,  199,  277,  333,  279,  397,  204,  785,  204,
			  785,  398,  399,  339,  339,  345,  339,  785,  399,  110,
			  110,  278,  110,  346,  347,  347,  347,  347,  347,  110,
			  110,  785,  110,  279,  785,  205,  199,  205,  212,  209,
			  221,  212,  212,  209,  112,  212,  400,  785,  211,  785,
			  477,  477,  213,  477,  112,  785,  213,  356,  356,  356,
			  356,  356,  215,  401,  785,  402,  215,  368,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,

			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  785,  401,  211,  402,  785,  368,  211,  335,  336,  337,
			  335,  336,  335,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  213,  785,  785,  335,  353,  353,  353,  353,
			  353,  335,  338,  335,  335,  335,  335,  354,  403,  354,
			  785,  238,  355,  355,  355,  355,  355,  357,  357,  357,
			  357,  357,  364,  364,  364,  364,  364,  372,  401,  785,
			  335,  335,  211,  335,  239,  785,  403,  402,  372,  238,
			  358,  358,  358,  358,  358,  361,  403,  361,  372,  407,
			  362,  362,  362,  362,  362,  359,  404,  335,  335,  335,

			  220,  220,  785,  220,  785,  405,  372,  111,  111,  111,
			  111,  111,  785,  785,  406,  785,  785,  407,  360,  471,
			  471,  471,  471,  359,  785,  407,  785,  221,  785,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  103,  409,  104,  410,  363,  363,  363,  363,
			  363,  110,  110,  785,  110,  110,  110,  785,  110,  785,
			  110,  110,  411,  110,  110,  110,  785,  110,  412,  110,
			  110,  222,  110,  410,  110,  110,  112,  110,  110,  110,
			  112,  110,  785,  413,  106,  112,  785,  366,  785,  112,

			  411,  410,  365,  367,  112,  411,  412,  110,  110,  112,
			  110,  110,  110,  112,  110,  785,  785,  110,  110,  369,
			  110,  413,  785,  785,  370,  366,  373,  785,  785,  414,
			  365,  367,  112,  415,  110,  110,  112,  110,  110,  110,
			  371,  110,  112,  110,  110,  374,  110,  369,  375,  412,
			  110,  110,  370,  110,  373,  110,  110,  785,  110,  112,
			  417,  110,  110,  112,  110,  417,  785,  785,  112,  377,
			  785,  376,  785,  374,  785,  112,  375,  416,  785,  419,
			  112,  785,  420,  379,  110,  110,  112,  110,  417,  785,
			  378,  383,  785,  418,  384,  110,  110,  377,  110,  376,

			  385,  380,  381,  381,  381,  381,  381,  419,  785,  112,
			  420,  379,  419,  382,  382,  382,  382,  382,  378,  383,
			  112,  785,  384,  110,  110,  785,  110,  785,  385,  785,
			  380,  111,  111,  111,  111,  111,  110,  110,  785,  110,
			  421,  380,  110,  110,  785,  110,  785,  785,  112,  111,
			  110,  110,  785,  110,  785,  386,  785,  386,  420,  110,
			  110,  112,  110,  110,  110,  387,  110,  112,  271,  110,
			  110,  423,  110,  110,  110,  112,  110,  111,  110,  110,
			  283,  110,  110,  110,  112,  110,  422,  424,  112,  423,
			  389,  372,  390,  388,  112,  785,  271,  785,  112,  423,

			  424,  785,  372,  112,  785,  785,  391,  112,  209,  209,
			  785,  209,  372,  392,  427,  424,  428,  425,  389,  286,
			  390,  286,  286,  286,  286,  286,  427,  428,  426,  393,
			  372,  432,  394,  286,  391,  287,  287,  287,  287,  287,
			  432,  392,  427,  785,  428,  785,  785,  336,  337,  785,
			  336,  479,  479,  481,  430,  431,  785,  785,  785,  432,
			  394,  213,  211,  339,  339,  345,  339,  785,  433,  195,
			  785,  338,  481,  346,  347,  347,  347,  347,  347,  479,
			  480,  481,  434,  434,  434,  434,  434,  483,  110,  110,
			  785,  110,  785,  434,  434,  434,  434,  434,  434,  785,

			  482,  211,  785,  439,  439,  439,  439,  439,  355,  355,
			  355,  355,  355,  112,  484,  483,  483,  196,  238,  785,
			  434,  434,  434,  434,  434,  434,  434,  440,  440,  440,
			  440,  440,  442,  442,  442,  442,  442,  110,  110,  785,
			  110,  239,  484,  785,  485,  785,  238,  443,  443,  443,
			  443,  443,  444,  444,  444,  444,  444,  447,  447,  447,
			  447,  447,  112,  484,  445,  441,  445,  359,  785,  446,
			  446,  446,  446,  446,  362,  362,  362,  362,  362,  448,
			  448,  448,  448,  448,  453,  453,  453,  453,  453,  785,
			  360,  486,  487,  450,  451,  359,  452,  452,  452,  452,

			  452,  110,  110,  785,  110,  110,  110,  488,  110,  110,
			  110,  460,  110,  110,  110,  785,  110,  449,  110,  110,
			  487,  110,  460,  785,  487,  785,  112,  490,  110,  110,
			  112,  110,  460,  785,  112,  488,  110,  110,  112,  110,
			  491,  785,  455,  112,  110,  110,  785,  110,  492,  454,
			  460,  458,  489,  112,  493,  490,  456,  459,  490,  457,
			  785,  112,  785,  110,  110,  491,  110,  492,  491,  112,
			  455,  110,  110,  461,  110,  785,  492,  454,  497,  458,
			  110,  110,  493,  110,  456,  459,  494,  457,  112,  110,
			  110,  462,  110,  495,  785,  496,  112,  110,  110,  111,

			  110,  461,  111,  463,  497,  112,  497,  785,  111,  785,
			  499,  464,  500,  785,  112,  499,  465,  110,  110,  462,
			  110,  785,  112,  500,  785,  785,  785,  111,  785,  785,
			  111,  463,  498,  466,  110,  110,  111,  110,  499,  464,
			  500,  467,  112,  501,  465,  785,  382,  382,  382,  382,
			  382,  502,  381,  381,  381,  381,  381,  110,  110,  112,
			  110,  466,  110,  110,  503,  110,  263,  264,  785,  467,
			  468,  468,  468,  468,  468,  469,  469,  469,  469,  469,
			  110,  110,  112,  110,  111,  110,  110,  112,  110,  111,
			  110,  110,  503,  110,  263,  264,  470,  470,  470,  470,

			  470,  110,  110,  504,  110,  112,  503,  505,  504,  785,
			  112,  785,  111,  785,  474,  112,  476,  111,  506,  547,
			  110,  110,  473,  110,  785,  475,  112,  472,  785,  110,
			  110,  504,  110,  785,  507,  505,  508,  439,  439,  439,
			  439,  439,  474,  785,  785,  112,  506,  547,  785,  785,
			  473,  547,  511,  475,  112,  472,  509,  509,  509,  509,
			  509,  513,  513,  513,  513,  513,  785,  509,  509,  509,
			  509,  509,  509,  512,  512,  512,  512,  512,  785,  548,
			  511,  514,  514,  514,  514,  514,  515,  515,  515,  515,
			  515,  785,  785,  785,  509,  509,  509,  509,  509,  509,

			  509,  359,  446,  446,  446,  446,  446,  658,  658,  658,
			  658,  441,  516,  516,  516,  516,  516,  518,  518,  518,
			  518,  518,  110,  110,  360,  110,  785,  785,  785,  359,
			  519,  519,  519,  519,  519,  520,  520,  520,  520,  520,
			  515,  515,  515,  515,  515,  110,  110,  112,  110,  785,
			  517,  785,  785,  549,  451,  522,  452,  452,  452,  452,
			  452,  110,  110,  785,  110,  785,  110,  110,  449,  110,
			  112,  110,  110,  785,  110,  785,  785,  543,  524,  110,
			  110,  549,  110,  522,  785,  525,  112,  549,  543,  110,
			  110,  112,  110,  526,  110,  110,  112,  110,  544,  527,

			  110,  110,  785,  110,  112,  110,  110,  785,  110,  529,
			  555,  528,  531,  525,  112,  552,  543,  785,  785,  112,
			  785,  526,  534,  556,  557,  112,  532,  527,  110,  110,
			  112,  110,  537,  537,  537,  537,  537,  529,  555,  528,
			  531,  785,  533,  785,  535,  469,  469,  469,  469,  469,
			  534,  556,  557,  112,  532,  468,  468,  468,  468,  468,
			  558,  536,  110,  110,  556,  110,  111,  785,  557,  111,
			  533,  545,  535,  550,  785,  558,  384,  538,  538,  538,
			  538,  538,  385,  110,  110,  551,  110,  112,  558,  536,
			  110,  110,  559,  110,  111,  539,  560,  111,  562,  110,

			  110,  550,  110,  561,  384,  550,  785,  562,  112,  564,
			  385,  565,  785,  551,  564,  112,  540,  551,  565,  568,
			  569,  570,  571,  539,  112,  568,  562,  569,  577,  577,
			  577,  577,  577,  553,  541,  563,  785,  564,  785,  565,
			  542,  604,  566,  604,  540,  554,  567,  568,  569,  570,
			  571,  605,  576,  572,  576,  573,  785,  577,  577,  577,
			  577,  577,  541,  579,  110,  110,  441,  110,  542,  574,
			  574,  574,  574,  574,  578,  578,  578,  578,  578,  606,
			  574,  574,  574,  574,  574,  574,  239,  785,  785,  112,
			  785,  579,  581,  581,  581,  581,  581,  785,  785,  515,

			  515,  515,  515,  515,  785,  785,  785,  574,  574,  574,
			  574,  574,  574,  574,  580,  582,  582,  582,  582,  582,
			  583,  583,  583,  583,  583,  584,  584,  584,  584,  584,
			  517,  585,  585,  585,  585,  585,  586,  586,  586,  586,
			  586,  587,  580,  587,  785,  612,  584,  584,  584,  584,
			  584,  589,  589,  589,  589,  589,  110,  110,  785,  110,
			  613,  110,  110,  449,  110,  613,  590,  110,  110,  615,
			  110,  110,  110,  612,  110,  785,  110,  110,  596,  110,
			  785,  112,  785,  785,  616,  591,  112,  785,  613,  785,
			  592,  785,  112,  614,  590,  596,  112,  615,  615,  596,

			  593,  112,  110,  110,  610,  110,  616,  110,  110,  619,
			  110,  594,  616,  591,  595,  610,  110,  110,  592,  110,
			  785,  110,  110,  596,  110,  611,  617,  112,  593,  620,
			  110,  110,  112,  110,  618,  110,  110,  619,  110,  594,
			  598,  112,  595,  610,  621,  785,  112,  597,  603,  603,
			  603,  603,  603,  110,  110,  112,  110,  620,  110,  110,
			  112,  110,  599,  601,  622,  620,  600,  602,  598,  785,
			  785,  621,  621,  110,  110,  597,  110,  622,  112,  785,
			  626,  110,  110,  112,  110,  785,  611,  626,  628,  629,
			  599,  601,  622,  623,  600,  602,  628,  611,  112,  624,

			  629,  632,  607,  633,  608,  625,  112,  611,  626,  634,
			  632,  644,  664,  609,  785,  627,  628,  629,  577,  577,
			  577,  577,  577,  785,  630,  611,  785,  785,  631,  632,
			  607,  633,  608,  785,  360,  785,  785,  634,  635,  644,
			  664,  609,  636,  636,  636,  636,  636,  577,  577,  577,
			  577,  577,  785,  636,  636,  636,  636,  636,  636,  638,
			  638,  638,  638,  638,  639,  785,  639,  785,  785,  640,
			  640,  640,  640,  640,  642,  642,  642,  642,  642,  785,
			  636,  636,  636,  636,  636,  636,  636,  641,  785,  641,
			  785,  785,  642,  642,  642,  642,  642,  643,  643,  643,

			  643,  643,  584,  584,  584,  584,  584,  645,  645,  645,
			  645,  645,  517,  584,  584,  584,  584,  584,  647,  647,
			  647,  647,  647,  648,  665,  648,  785,  653,  649,  649,
			  649,  649,  649,  644,  110,  110,  665,  110,  110,  110,
			  785,  110,  110,  110,  653,  110,  110,  110,  653,  110,
			  110,  110,  665,  110,  110,  110,  360,  110,  785,  112,
			  667,  644,  785,  112,  666,  110,  110,  112,  110,  667,
			  785,  112,  653,  785,  785,  112,  651,  652,  650,  112,
			  669,  785,  110,  110,  785,  110,  110,  110,  667,  110,
			  112,  110,  110,  785,  110,  110,  110,  668,  110,  656,

			  656,  656,  656,  656,  651,  652,  650,  112,  669,  110,
			  110,  112,  110,  785,  110,  110,  112,  110,  669,  671,
			  112,  657,  657,  657,  657,  657,  671,  673,  674,  675,
			  673,  655,  654,  695,  112,  696,  696,  785,  698,  112,
			  110,  110,  659,  110,  698,  785,  670,  671,  700,  785,
			  660,  785,  785,  785,  672,  673,  674,  675,  676,  655,
			  654,  695,  785,  696,  697,  112,  698,  785,  785,  785,
			  659,  785,  699,  661,  110,  110,  700,  110,  660,  640,
			  640,  640,  640,  640,  679,  679,  679,  679,  679,  642,
			  642,  642,  642,  642,  642,  642,  642,  642,  642,  112,

			  785,  661,  680,  680,  680,  680,  680,  681,  785,  681,
			  700,  686,  682,  682,  682,  682,  682,  583,  583,  583,
			  583,  583,  441,  649,  649,  649,  649,  649,  110,  110,
			  702,  110,  644,  684,  684,  684,  684,  684,  701,  686,
			  110,  110,  785,  110,  110,  110,  785,  110,  785,  110,
			  110,  785,  110,  112,  785,  360,  785,  785,  702,  685,
			  644,  110,  110,  785,  110,  112,  785,  110,  110,  112,
			  110,  449,  785,  687,  112,  689,  689,  689,  689,  689,
			  688,  690,  690,  690,  690,  690,  112,  685,  110,  110,
			  693,  110,  112,  691,  693,  694,  703,  702,  718,  694, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  692,  687,  638,  638,  638,  638,  638,  785,  688,  785,
			  785,  693,  785,  112,  110,  110,  694,  110,  785,  785,
			  785,  691,  693,  785,  703,  704,  718,  694,  692,  682,
			  682,  682,  682,  682,  706,  706,  706,  706,  706,  112,
			  441,  707,  707,  707,  707,  707,  645,  645,  645,  645,
			  645,  110,  110,  785,  110,  110,  110,  785,  110,  785,
			  709,  110,  110,  785,  110,  711,  711,  711,  711,  711,
			  719,  719,  517,  712,  713,  712,  112,  721,  110,  110,
			  112,  110,  110,  110,  449,  110,  112,  708,  709,  716,
			  721,  717,  723,  716,  710,  717,  785,  785,  719,  720,

			  785,  110,  110,  112,  110,  721,  785,  112,  732,  733,
			  716,  714,  717,  110,  110,  708,  110,  785,  722,  785,
			  723,  716,  710,  717,  110,  110,  112,  110,  715,  680,
			  680,  680,  680,  680,  725,  785,  732,  733,  112,  606,
			  606,  606,  606,  606,  728,  728,  728,  728,  728,  112,
			  729,  729,  729,  729,  729,  733,  715,  110,  110,  735,
			  110,  735,  725,  726,  737,  110,  110,  517,  110,  727,
			  110,  110,  785,  110,  110,  110,  785,  110,  743,  785,
			  785,  785,  112,  734,  744,  785,  785,  735,  742,  736,
			  112,  726,  737,  785,  750,  112,  742,  727,  785,  112,

			  740,  740,  740,  740,  740,  785,  743,  730,  712,  742,
			  712,  739,  744,  729,  729,  729,  729,  729,  110,  110,
			  785,  110,  750,  785,  742,  745,  745,  745,  745,  745,
			  110,  110,  785,  110,  785,  730,  749,  110,  110,  739,
			  110,  751,  785,  112,  749,  785,  714,  747,  747,  747,
			  747,  747,  785,  757,  752,  112,  752,  749,  110,  110,
			  741,  110,  112,  762,  753,  110,  110,  785,  110,  751,
			  748,  785,  749,  714,  714,  714,  714,  714,  761,  785,
			  746,  757,  785,  112,  759,  759,  759,  759,  741,  761,
			  112,  762,  754,  758,  758,  758,  758,  758,  748,  761,

			  755,  110,  110,  785,  110,  767,  785,  767,  746,  763,
			  763,  763,  763,  763,  785,  768,  785,  761,  764,  764,
			  764,  764,  764,  785,  110,  110,  112,  110,  755,  765,
			  772,  772,  772,  772,  760,  766,  766,  766,  766,  766,
			  765,  785,  773,  769,  754,  754,  754,  754,  754,  112,
			  765,  771,  771,  771,  771,  771,  778,  779,  778,  773,
			  785,  785,  760,  773,  776,  785,  785,  785,  765,  774,
			  774,  774,  774,  774,  775,  775,  775,  775,  775,  785,
			  785,  776,  785,  785,  785,  776,  785,  773,  777,  777,
			  777,  777,  777,  785,  780,  769,  769,  769,  769,  769,

			  781,  781,  781,  781,  781,  785,  785,  785,  785,  776,
			  782,  782,  782,  782,  782,  783,  783,  783,  783,  783,
			  778,  785,  778,  785,  785,  782,  782,  782,  782,  782,
			  784,  784,  784,  784,  784,  780,  780,  780,  780,  780,
			  437,  437,  785,  785,  785,  785,  437,  437,  437,  437,
			  437,  437,  785,  785,  785,  785,  785,  785,  780,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,

			   72,   72,   72,   72,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   85,   85,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   93,   93,  785,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,  785,   93,   93,   93,   93,   93,   95,
			   95,  785,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,  111,  111,  111,  785,  785,  785,
			  785,  785,  785,  111,  111,  785,  785,  111,  785,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,

			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  785,  785,  111,  111,  111,  142,  142,  785,
			  142,  142,  785,  142,  142,  785,  785,  785,  785,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  785,  785,  142,  142,  142,  143,  143,  785,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,

			  143,  143,  194,  194,  785,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  196,  196,  785,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  202,  202,  202,  202,  202,  202,  202,  202,

			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  785,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  210,  210,  210,  785,  785,  785,  210,  210,
			  785,  210,  210,  785,  785,  785,  785,  210,  210,  210,

			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  785,  210,  210,  210,  210,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,

			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  223,  223,  785,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  226,  226,  785,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,

			  226,  226,  226,  226,  226,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			  241,  241,  241,  241,  241,  241,  241,  241,  785,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  141,  141,  785,  141,  141,

			  785,  141,  141,  141,  785,  785,  785,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  785,  785,  141,  141,  141,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  222,  222,  222,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  785,  785,
			  785,  785,  785,  222,  341,  341,  785,  341,  785,  785,
			  341,  341,  341,  341,  341,  341,  341,  341,  341,  341,
			  341,  341,  341,  341,  341,  341,  341,  341,  341,  341,
			  341,  341,  341,  785,  785,  341,  341,  341,  335,  335,
			  335,  335,  335,  335,  785,  335,  335,  335,  335,  335,
			  335,  335,  335,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,  335,  335,  335,  335,  335,  785,  335,

			  335,  335,  335,  478,  478,  478,  785,  785,  785,  478,
			  478,  785,  478,  478,  785,  785,  785,  785,  478,  478,
			  478,  478,  478,  478,  478,  478,  478,  478,  478,  478,
			  478,  478,  478,  478,  478,  478,  478,  478,  478,  478,
			  478,  785,  785,  478,  478,  478,  396,  396,  396,  785,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  785,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  510,  510,  785,  785,  785,  785,  510,  510,  510,

			  510,  510,  510,  575,  575,  785,  785,  785,  785,  575,
			  575,  575,  575,  575,  575,  588,  588,  588,  588,  588,
			  588,  588,  588,  785,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  637,  637,  785,  785,  785,  785,  637,  637,  637,  637,
			  637,  637,   13,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,

			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785, yy_Dummy>>,
			1, 1856, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4855)
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

			   27,   57,   27,   27,   27,   27,   27,   29,  765,   29,
			   60,   29,   29,   29,   29,   29,   37,   37,   62,   37,
			   63,   72,    5,    6,  646,  646,  646,   51,   51,   57,
			  749,  207,   51,   51,  707,   76,    3,    4,   60,  213,
			  213,   37,  213,   20,   11,  680,   62,   12,   63,   29,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   72,
			    9,   38,   38,   51,   38,   64,    9,    9,    9,    9,
			    9,    9,   58,   76,   65,   59,   36,   36,   64,   36,
			   66,   67,   65,   58,   68,   66,   38,   59,  678,   73,

			   38,   73,   73,   64,  645,    9,    9,    9,    9,  194,
			   58,   36,   65,   59,  638,   87,   64,  333,   66,   67,
			   65,   58,   68,   66,   36,   59,   36,   90,   38,   90,
			   90,  637,    9,    9,    9,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   36,   10,   36,   39,   39,  194,   39,   10,
			   10,   10,   10,   10,   10,  333,   77,   40,   40,   87,
			   40,   61,   61,   41,   41,  611,   41,   61,   43,   43,
			   39,   43,   79,  677,   82,   82,  149,   82,   10,   10,
			   10,   10,   40,   39,   42,   42,   40,   42,   41,   61,

			   61,  716,   77,   43,   39,   61,  610,   43,   40,   41,
			   83,   83,  216,   83,  149,   10,   10,   10,   79,   42,
			  586,   39,   44,   44,   40,   44,   45,   45,  480,   45,
			   77,  677,   39,   42,   42,   43,   40,   41,   82,   42,
			   47,   47,  479,   47,  716,  145,   79,   44,  145,  110,
			  110,   45,  110,   49,   49,  145,   49,   45,   47,   47,
			  150,   42,   42,   44,   83,   47,  216,   42,   48,   48,
			   45,   48,   84,   84,  110,   84,   47,  460,   49,  153,
			   50,   50,  154,   50,   47,   45,   84,   84,  150,  111,
			  111,   44,  111,   48,   49,  155,   84,  156,   45,   46,

			   46,  157,   46,  450,   47,   50,  159,  153,   48,  158,
			  154,  161,   47,   48,  111,  158,  162,   46,   46,   46,
			   46,   46,   49,  155,   46,  156,   84,  163,  443,  157,
			   50,   46,   85,   85,  159,   85,   48,  158,   46,  161,
			  433,   48,  432,  158,  162,   46,   85,   46,  342,   46,
			  103,  103,  103,  103,  103,  163,   85,  164,   50,   46,
			  341,  104,  104,  104,  104,  104,   46,  106,  106,  106,
			  106,  106,  724,  724,  335,   46,  104,   46,   55,  327,
			  197,   55,  197,  197,  324,  164,   85,  301,   55,  142,
			  142,  215,  215,  299,  215,  283,   55,   55,   55,   55,

			   55,   55,  142,  167,  104,  280,  234,   55,   55,   55,
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
			  169,  208,  338,  338,  166,  338,   98,   98,   98,   98,
			   98,  165,  395,  395,  168,  395,   88,  168,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   98,  168,  132,  132,  168,  132,  148,  123,  123,
			   98,  123,  208,  146,  436,  436,   98,  436,  143,  105,
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

			  114,  119,  113,  178,  160,  118,  122,  122,   35,  122,
			  160,  121,   34,  179,  124,  124,  115,  124,  117,  126,
			  119,  116,   32,   28,  117,  126,  125,  125,  121,  125,
			  636,  122,  160,  118,  180,  181,  128,  122,  160,  124,
			  122,  127,  127,  128,  127,   26,  453,   18,  119,  636,
			  128,  125,  128,  126,  128,   17,  121,   16,  129,  129,
			  124,  129,  180,  181,  128,  122,  127,  198,  122,  182,
			  183,  128,  125,  127,  130,  130,   13,  130,  636,  184,
			  128,    0,  128,  129,  133,  133,  453,  133,  124,    0,
			  186,  171,  134,  134,  171,  134,  188,  182,  183,  130,

			  125,  127,  136,  136,  129,  136,  130,  184,    0,  133,
			  134,  134,  134,  134,  134,  198,  133,  134,  186,  171,
			  130,    0,  171,  133,  188,  135,  135,  136,  135,    0,
			  133,  189,    0,    0,  130,  131,  131,    0,  131,  198,
			    0,    0,  137,  137,  133,  137,    0,    0,    0,  136,
			  135,  133,    0,  131,  131,  131,  131,  131,  135,  189,
			  131,  135,  138,  138,  185,  138,    0,  137,  185,  139,
			  139,  131,  139,  190,  131,  140,  140,  136,  140,  137,
			  131,  191,  192,  137,  187,    0,  135,  138,  187,  135,
			    0,  202,  185,  204,  139,  138,  185,    0,  284,  131,

			  140,  190,  131,  288,  290,    0,  199,  137,  131,  191,
			  192,  137,  187,  139,  209,  209,  187,  209,  199,  199,
			  199,  199,  199,  138,  199,  140,  284,  202,    0,  204,
			    0,  288,  290,  221,  221,  229,  221,    0,  291,  247,
			  247,  139,  247,  229,  229,  229,  229,  229,  229,  250,
			  250,    0,  250,  140,  147,  202,  199,  204,  210,  210,
			  221,  210,  212,  212,  247,  212,  291,    0,  209,    0,
			  477,  477,  210,  477,  250,    0,  212,  239,  239,  239,
			  239,  239,  210,  292,    0,  293,  212,  250,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,

			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			    0,  292,  210,  293,    0,  250,  212,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,    0,    0,  214,  237,  237,  237,  237,
			  237,  214,  214,  214,  214,  214,  214,  238,  294,  238,
			    0,  237,  238,  238,  238,  238,  238,  240,  240,  240,
			  240,  240,  245,  245,  245,  245,  245,  254,  295,    0,
			  214,  214,  214,  214,  237,    0,  294,  296,  254,  237,
			  242,  242,  242,  242,  242,  243,  297,  243,  254,  298,
			  243,  243,  243,  243,  243,  242,  295,  214,  214,  214,

			  217,  217,    0,  217,    0,  296,  254,  267,  267,  267,
			  267,  267,    0,    0,  297,    0,    0,  298,  242,  387,
			  387,  387,  387,  242,    0,  300,    0,  217,    0,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  244,  300,  244,  303,  244,  244,  244,  244,
			  244,  246,  246,    0,  246,  248,  248,    0,  248,    0,
			  249,  249,  304,  249,  251,  251,    0,  251,  305,  252,
			  252,  217,  252,  303,  253,  253,  246,  253,  255,  255,
			  248,  255,    0,  306,  244,  249,    0,  248,    0,  251,

			  304,  307,  246,  249,  252,  308,  305,  256,  256,  253,
			  256,  257,  257,  255,  257,    0,    0,  260,  260,  251,
			  260,  306,    0,    0,  252,  248,  255,    0,    0,  307,
			  246,  249,  256,  308,  258,  258,  257,  258,  259,  259,
			  253,  259,  260,  261,  261,  256,  261,  251,  257,  309,
			  262,  262,  252,  262,  255,  263,  263,    0,  263,  258,
			  310,  265,  265,  259,  265,  311,    0,    0,  261,  259,
			    0,  258,    0,  256,    0,  262,  257,  309,    0,  314,
			  263,    0,  315,  262,  264,  264,  265,  264,  310,    0,
			  261,  268,    0,  311,  268,  266,  266,  259,  266,  258,

			  268,  263,  264,  264,  264,  264,  264,  314,    0,  264,
			  315,  262,  316,  266,  266,  266,  266,  266,  261,  268,
			  266,    0,  268,  270,  270,    0,  270,    0,  268,    0,
			  264,  269,  269,  269,  269,  269,  271,  271,    0,  271,
			  316,  266,  272,  272,    0,  272,    0,    0,  270,  269,
			  273,  273,    0,  273,    0,  272,    0,  272,  317,  274,
			  274,  271,  274,  275,  275,  272,  275,  272,  270,  276,
			  276,  318,  276,  277,  277,  273,  277,  269,  278,  278,
			  302,  278,  279,  279,  274,  279,  317,  319,  275,  320,
			  273,  302,  274,  272,  276,    0,  270,    0,  277,  318,

			  321,    0,  302,  278,    0,    0,  275,  279,  337,  337,
			    0,  337,  302,  276,  322,  319,  323,  320,  273,  286,
			  274,  286,  286,  286,  286,  286,  325,  326,  321,  277,
			  302,  330,  279,  287,  275,  287,  287,  287,  287,  287,
			  331,  276,  322,    0,  323,    0,    0,  336,  336,    0,
			  336,  397,  398,  399,  325,  326,    0,    0,    0,  330,
			  279,  336,  337,  339,  339,  347,  339,    0,  331,  332,
			    0,  336,  400,  347,  347,  347,  347,  347,  347,  397,
			  398,  399,  332,  332,  332,  332,  332,  402,  367,  367,
			  339,  367,    0,  332,  332,  332,  332,  332,  332,    0,

			  400,  336,    0,  353,  353,  353,  353,  353,  354,  354,
			  354,  354,  354,  367,  403,  402,  405,  332,  353,    0,
			  332,  332,  332,  332,  332,  332,  332,  355,  355,  355,
			  355,  355,  356,  356,  356,  356,  356,  385,  385,    0,
			  385,  353,  403,    0,  405,    0,  353,  357,  357,  357,
			  357,  357,  358,  358,  358,  358,  358,  360,  360,  360,
			  360,  360,  385,  406,  359,  355,  359,  358,    0,  359,
			  359,  359,  359,  359,  361,  361,  361,  361,  361,  362,
			  362,  362,  362,  362,  364,  364,  364,  364,  364,    0,
			  358,  406,  407,  363,  363,  358,  363,  363,  363,  363,

			  363,  365,  365,    0,  365,  366,  366,  408,  366,  368,
			  368,  372,  368,  369,  369,    0,  369,  362,  370,  370,
			  407,  370,  372,    0,  409,    0,  365,  410,  371,  371,
			  366,  371,  372,    0,  368,  408,  373,  373,  369,  373,
			  411,    0,  366,  370,  374,  374,    0,  374,  412,  365,
			  372,  370,  409,  371,  413,  410,  368,  371,  414,  369,
			    0,  373,    0,  375,  375,  415,  375,  416,  411,  374,
			  366,  376,  376,  373,  376,    0,  412,  365,  417,  370,
			  377,  377,  413,  377,  368,  371,  414,  369,  375,  378,
			  378,  374,  378,  415,    0,  416,  376,  379,  379,  380,

			  379,  373,  380,  375,  418,  377,  417,    0,  380,    0,
			  419,  376,  420,    0,  378,  421,  377,  388,  388,  374,
			  388,    0,  379,  422,    0,    0,    0,  380,    0,    0,
			  380,  375,  418,  378,  381,  381,  380,  381,  419,  376,
			  420,  379,  388,  421,  377,    0,  382,  382,  382,  382,
			  382,  422,  381,  381,  381,  381,  381,  389,  389,  381,
			  389,  378,  390,  390,  427,  390,  381,  382,    0,  379,
			  383,  383,  383,  383,  383,  384,  384,  384,  384,  384,
			  391,  391,  389,  391,  383,  393,  393,  390,  393,  384,
			  392,  392,  427,  392,  381,  382,  386,  386,  386,  386,

			  386,  394,  394,  428,  394,  391,  430,  429,  431,    0,
			  393,    0,  383,    0,  393,  392,  394,  384,  429,  481,
			  458,  458,  392,  458,    0,  393,  394,  391,    0,  464,
			  464,  428,  464,    0,  430,  429,  431,  439,  439,  439,
			  439,  439,  393,    0,    0,  458,  429,  481,    0,    0,
			  392,  482,  439,  393,  464,  391,  434,  434,  434,  434,
			  434,  441,  441,  441,  441,  441,    0,  434,  434,  434,
			  434,  434,  434,  440,  440,  440,  440,  440,    0,  482,
			  439,  442,  442,  442,  442,  442,  444,  444,  444,  444,
			  444,    0,    0,    0,  434,  434,  434,  434,  434,  434,

			  434,  444,  445,  445,  445,  445,  445,  605,  605,  605,
			  605,  440,  446,  446,  446,  446,  446,  447,  447,  447,
			  447,  447,  454,  454,  444,  454,    0,    0,    0,  444,
			  448,  448,  448,  448,  448,  449,  449,  449,  449,  449,
			  451,  451,  451,  451,  451,  455,  455,  454,  455,    0,
			  446,    0,    0,  483,  452,  451,  452,  452,  452,  452,
			  452,  456,  456,    0,  456,    0,  457,  457,  448,  457,
			  455,  459,  459,    0,  459,    0,    0,  476,  454,  461,
			  461,  483,  461,  451,    0,  455,  456,  485,  476,  465,
			  465,  457,  465,  456,  462,  462,  459,  462,  476,  457,

			  466,  466,    0,  466,  461,  463,  463,    0,  463,  459,
			  488,  457,  461,  455,  465,  485,  476,  478,  478,  462,
			  478,  456,  465,  490,  491,  466,  462,  457,  467,  467,
			  463,  467,  470,  470,  470,  470,  470,  459,  488,  457,
			  461,    0,  463,    0,  466,  469,  469,  469,  469,  469,
			  465,  490,  491,  467,  462,  468,  468,  468,  468,  468,
			  492,  467,  472,  472,  494,  472,  469,    0,  495,  468,
			  463,  478,  466,  484,    0,  496,  468,  471,  471,  471,
			  471,  471,  468,  473,  473,  484,  473,  472,  492,  467,
			  474,  474,  494,  474,  469,  472,  495,  468,  497,  475,

			  475,  484,  475,  496,  468,  486,    0,  498,  473,  499,
			  468,  500,    0,  484,  501,  474,  473,  486,  502,  503,
			  504,  505,  506,  472,  475,  507,  497,  508,  512,  512,
			  512,  512,  512,  486,  474,  498,    0,  499,    0,  500,
			  475,  538,  501,  538,  473,  486,  502,  503,  504,  505,
			  506,  538,  511,  507,  511,  508,    0,  511,  511,  511,
			  511,  511,  474,  514,  528,  528,  512,  528,  475,  509,
			  509,  509,  509,  509,  513,  513,  513,  513,  513,  538,
			  509,  509,  509,  509,  509,  509,  514,    0,    0,  528,
			    0,  514,  516,  516,  516,  516,  516,    0,    0,  515,

			  515,  515,  515,  515,    0,    0,    0,  509,  509,  509,
			  509,  509,  509,  509,  515,  517,  517,  517,  517,  517,
			  518,  518,  518,  518,  518,  519,  519,  519,  519,  519,
			  516,  520,  520,  520,  520,  520,  521,  521,  521,  521,
			  521,  522,  515,  522,    0,  546,  522,  522,  522,  522,
			  522,  523,  523,  523,  523,  523,  524,  524,    0,  524,
			  547,  525,  525,  519,  525,  548,  523,  526,  526,  549,
			  526,  527,  527,  546,  527,    0,  529,  529,  530,  529,
			    0,  524,    0,    0,  550,  524,  525,    0,  547,    0,
			  525,    0,  526,  548,  523,  530,  527,  549,  552,  530,

			  526,  529,  531,  531,  543,  531,  553,  532,  532,  555,
			  532,  527,  550,  524,  529,  543,  533,  533,  525,  533,
			    0,  534,  534,  530,  534,  543,  552,  531,  526,  556,
			  535,  535,  532,  535,  553,  536,  536,  555,  536,  527,
			  532,  533,  529,  543,  557,    0,  534,  531,  537,  537,
			  537,  537,  537,  539,  539,  535,  539,  556,  540,  540,
			  536,  540,  533,  535,  558,  559,  534,  536,  532,    0,
			    0,  560,  557,  541,  541,  531,  541,  561,  539,    0,
			  562,  542,  542,  540,  542,    0,  544,  563,  564,  565,
			  533,  535,  558,  559,  534,  536,  566,  544,  541,  560,

			  567,  569,  540,  570,  541,  561,  542,  544,  562,  571,
			  573,  583,  612,  542,    0,  563,  564,  565,  576,  576,
			  576,  576,  576,    0,  566,  544,    0,    0,  567,  569,
			  540,  570,  541,    0,  583,    0,    0,  571,  573,  583,
			  612,  542,  574,  574,  574,  574,  574,  577,  577,  577,
			  577,  577,    0,  574,  574,  574,  574,  574,  574,  578,
			  578,  578,  578,  578,  579,    0,  579,    0,    0,  579,
			  579,  579,  579,  579,  581,  581,  581,  581,  581,    0,
			  574,  574,  574,  574,  574,  574,  574,  580,    0,  580,
			    0,    0,  580,  580,  580,  580,  580,  582,  582,  582,

			  582,  582,  584,  584,  584,  584,  584,  585,  585,  585,
			  585,  585,  581,  587,  587,  587,  587,  587,  589,  589,
			  589,  589,  589,  590,  613,  590,    0,  596,  590,  590,
			  590,  590,  590,  589,  591,  591,  614,  591,  592,  592,
			    0,  592,  593,  593,  596,  593,  594,  594,  596,  594,
			  595,  595,  613,  595,  597,  597,  589,  597,    0,  591,
			  616,  589,    0,  592,  614,  598,  598,  593,  598,  618,
			    0,  594,  596,    0,    0,  595,  592,  594,  591,  597,
			  622,    0,  599,  599,    0,  599,  600,  600,  616,  600,
			  598,  601,  601,    0,  601,  602,  602,  618,  602,  603,

			  603,  603,  603,  603,  592,  594,  591,  599,  622,  607,
			  607,  600,  607,    0,  608,  608,  601,  608,  625,  628,
			  602,  604,  604,  604,  604,  604,  630,  632,  633,  634,
			  635,  601,  599,  664,  607,  665,  666,    0,  667,  608,
			  609,  609,  607,  609,  668,    0,  625,  628,  671,    0,
			  608,    0,    0,    0,  630,  632,  633,  634,  635,  601,
			  599,  664,    0,  665,  666,  609,  667,    0,    0,    0,
			  607,    0,  668,  609,  651,  651,  671,  651,  608,  639,
			  639,  639,  639,  639,  640,  640,  640,  640,  640,  641,
			  641,  641,  641,  641,  642,  642,  642,  642,  642,  651,

			    0,  609,  643,  643,  643,  643,  643,  644,    0,  644,
			  672,  651,  644,  644,  644,  644,  644,  647,  647,  647,
			  647,  647,  640,  648,  648,  648,  648,  648,  650,  650,
			  673,  650,  647,  649,  649,  649,  649,  649,  672,  651,
			  652,  652,    0,  652,  654,  654,    0,  654,    0,  655,
			  655,    0,  655,  650,    0,  647,    0,    0,  673,  650,
			  647,  659,  659,    0,  659,  652,    0,  660,  660,  654,
			  660,  649,    0,  652,  655,  657,  657,  657,  657,  657,
			  655,  658,  658,  658,  658,  658,  659,  650,  661,  661,
			  662,  661,  660,  659,  662,  663,  674,  676,  695,  663, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  660,  652,  679,  679,  679,  679,  679,    0,  655,    0,
			    0,  662,    0,  661,  686,  686,  663,  686,    0,    0,
			    0,  659,  662,    0,  674,  676,  695,  663,  660,  681,
			  681,  681,  681,  681,  682,  682,  682,  682,  682,  686,
			  679,  683,  683,  683,  683,  683,  684,  684,  684,  684,
			  684,  685,  685,    0,  685,  687,  687,    0,  687,    0,
			  686,  688,  688,    0,  688,  689,  689,  689,  689,  689,
			  696,  697,  682,  690,  690,  690,  685,  700,  691,  691,
			  687,  691,  692,  692,  684,  692,  688,  685,  686,  693,
			  701,  694,  703,  693,  688,  694,    0,    0,  696,  697,

			    0,  708,  708,  691,  708,  700,    0,  692,  718,  719,
			  693,  690,  694,  709,  709,  685,  709,    0,  701,    0,
			  703,  693,  688,  694,  710,  710,  708,  710,  692,  706,
			  706,  706,  706,  706,  708,    0,  718,  719,  709,  711,
			  711,  711,  711,  711,  712,  712,  712,  712,  712,  710,
			  713,  713,  713,  713,  713,  720,  692,  715,  715,  721,
			  715,  722,  708,  709,  723,  725,  725,  706,  725,  710,
			  726,  726,    0,  726,  727,  727,    0,  727,  732,    0,
			    0,    0,  715,  720,  737,    0,    0,  721,  731,  722,
			  725,  709,  723,    0,  743,  726,  731,  710,    0,  727,

			  728,  728,  728,  728,  728,    0,  732,  715,  729,  731,
			  729,  725,  737,  729,  729,  729,  729,  729,  730,  730,
			    0,  730,  743,    0,  731,  738,  738,  738,  738,  738,
			  739,  739,    0,  739,    0,  715,  742,  741,  741,  725,
			  741,  744,    0,  730,  742,    0,  729,  740,  740,  740,
			  740,  740,    0,  750,  745,  739,  745,  742,  746,  746,
			  730,  746,  741,  757,  745,  748,  748,    0,  748,  744,
			  741,    0,  742,  747,  747,  747,  747,  747,  756,    0,
			  739,  750,    0,  746,  753,  753,  753,  753,  730,  756,
			  748,  757,  745,  752,  752,  752,  752,  752,  741,  756,

			  746,  755,  755,    0,  755,  764,    0,  764,  739,  758,
			  758,  758,  758,  758,    0,  764,    0,  756,  759,  759,
			  759,  759,  759,    0,  760,  760,  755,  760,  746,  761,
			  768,  768,  768,  768,  755,  763,  763,  763,  763,  763,
			  761,    0,  770,  764,  766,  766,  766,  766,  766,  760,
			  761,  767,  767,  767,  767,  767,  775,  775,  775,  770,
			    0,    0,  755,  770,  773,    0,    0,    0,  761,  771,
			  771,  771,  771,  771,  772,  772,  772,  772,  772,    0,
			    0,  773,    0,    0,    0,  773,    0,  770,  774,  774,
			  774,  774,  774,    0,  775,  777,  777,  777,  777,  777,

			  778,  778,  778,  778,  778,    0,    0,    0,    0,  773,
			  779,  779,  779,  779,  779,  781,  781,  781,  781,  781,
			  782,    0,  782,    0,    0,  782,  782,  782,  782,  782,
			  783,  783,  783,  783,  783,  784,  784,  784,  784,  784,
			  812,  812,    0,    0,    0,    0,  812,  812,  812,  812,
			  812,  812,    0,    0,    0,    0,    0,    0,  782,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,

			  786,  786,  786,  786,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  789,  789,  789,  789,  789,  789,

			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  791,  791,    0,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,

			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,    0,  791,  791,  791,  791,  791,  792,
			  792,    0,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  793,  793,  793,    0,    0,    0,
			    0,    0,    0,  793,  793,    0,    0,  793,    0,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,

			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,    0,    0,  793,  793,  793,  794,  794,    0,
			  794,  794,    0,  794,  794,    0,    0,    0,    0,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,    0,    0,  794,  794,  794,  795,  795,    0,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,

			  795,  795,  796,  796,    0,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  797,  797,    0,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  798,  798,  798,  798,  798,  798,  798,  798,

			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,    0,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  800,  800,  800,    0,    0,    0,  800,  800,
			    0,  800,  800,    0,    0,    0,    0,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			    0,  800,  800,  800,  800,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,

			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  803,  803,    0,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  804,  804,    0,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,

			  804,  804,  804,  804,  804,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  806,  806,  806,  806,  806,  806,  806,  806,    0,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  807,  807,    0,  807,  807,

			    0,  807,  807,  807,    0,    0,    0,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			    0,    0,  807,  807,  807,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  809,  809,  809,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,    0,    0,
			    0,    0,    0,  809,  810,  810,    0,  810,    0,    0,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,    0,    0,  810,  810,  810,  811,  811,
			  811,  811,  811,  811,    0,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,    0,  811,

			  811,  811,  811,  813,  813,  813,    0,    0,    0,  813,
			  813,    0,  813,  813,    0,    0,    0,    0,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,    0,    0,  813,  813,  813,  814,  814,  814,    0,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,    0,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  815,  815,    0,    0,    0,    0,  815,  815,  815,

			  815,  815,  815,  816,  816,    0,    0,    0,    0,  816,
			  816,  816,  816,  816,  816,  817,  817,  817,  817,  817,
			  817,  817,  817,    0,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  818,  818,    0,    0,    0,    0,  818,  818,  818,  818,
			  818,  818,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,

			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785, yy_Dummy>>,
			1, 1856, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64,  976, 4772,   92,  954,  927,  940, 4772,
			   88, 4772, 4772, 4772, 4772, 4772,  928,   82,  904,   91,
			 4772, 4772,  894, 4772,  884,  878,  184,  114,  169,  253,
			  265,  271,  292,  276,  320,  324,  397,  338,  366,  351,
			  378,  115, 4772, 4772,  841,  476,  555,   70,  142,  154,
			   72,  230,   87,   77,  142,  146,  148,  148,  142,  872,
			 4772, 4772,  114,  197, 4772,  635,  128,  247, 4772,  263,
			  809, 4772,  282,  308,  370,  430, 4772,  186,  717, 4772,
			  225,  850, 4772,  839, 4772,  831,  800,    0,  716,  830,

			  814,  800, 4772,  430,  441,  773,  447, 4772, 4772, 4772,
			  347,  387, 4772,  834,  838,  842,  846,  857,  865,  874,
			  556,  884,  904,  776,  912,  924,  892,  939,  902,  956,
			  972, 1033,  771,  982,  990, 1023, 1000, 1040, 1060, 1067,
			 1073,  774,  477,  731, 4772,  343,  770, 1129,  758,  246,
			  326,    0,  548,  339,  348,  349,  351,  354,  376,  359,
			  871,  371,  370,  387,  411,  716,  709,  459,  711,  672,
			  538,  958,  668,  536,  790,  802,  804,  838,  841,  852,
			  900,  900,  920,  935,  930, 1025,  955, 1045,  961,  985,
			 1027, 1029, 1030, 4772,  202, 4772,  718,  478,  960, 1098,

			 4772,  717, 1072, 4772, 1074,  666, 4772,   76,  726, 1112,
			 1156, 4772, 1160,  137, 1216,  489,  283, 1298, 4772, 4772,
			  609, 1131, 4772, 4772, 4772,  532,  583,  574,  563, 1124,
			  562,  552,  521,  519,  495,  560, 4772, 1216, 1232, 1157,
			 1237, 4772, 1260, 1270, 1336, 1242, 1359, 1137, 1363, 1368,
			 1147, 1372, 1377, 1382, 1237, 1386, 1405, 1409, 1432, 1436,
			 1415, 1441, 1448, 1453, 1482, 1459, 1493, 1287, 1453, 1511,
			 1521, 1534, 1540, 1548, 1557, 1561, 1567, 1571, 1576, 1580,
			  480, 4772, 4772,  476, 1055,    0, 1601, 1615, 1060,    0,
			 1070, 1104, 1148, 1145, 1201, 1233, 1237, 1239, 1242,  435,

			 1278,  429, 1561, 1315, 1332, 1339, 1354, 1361, 1365, 1410,
			 1427, 1432,    0,    0, 1430, 1447, 1463, 1523, 1529, 1552,
			 1547, 1565, 1569, 1570,  426, 1581, 1581,  421,    0,    0,
			 1579, 1588, 1662,  210, 4772,  471, 1645, 1606,  730, 1661,
			    0,  434,  437, 4772, 4772, 4772, 4772, 1654, 4772, 4772,
			 4772, 4772, 4772, 1683, 1688, 1707, 1712, 1727, 1732, 1749,
			 1737, 1754, 1759, 1776, 1764, 1799, 1803, 1686, 1807, 1811,
			 1816, 1826, 1781, 1834, 1842, 1861, 1869, 1878, 1887, 1895,
			 1861, 1932, 1926, 1950, 1955, 1735, 1976, 1299, 1915, 1955,
			 1960, 1978, 1988, 1983, 1999,  740,    0, 1601, 1602, 1614,

			 1633,    0, 1638, 1666,    0, 1667, 1715, 1757, 1776, 1789,
			 1788, 1791, 1806, 1812, 1819, 1816, 1825, 1840, 1866, 1864,
			 1866, 1869, 1877,    0,    0,    0,    0, 1915, 1969, 1976,
			 1957, 1974,  425,  423, 2036, 4772,  782,    0, 4772, 2017,
			 2053, 2041, 2061,  412, 2066, 2082, 2092, 2097, 2110, 2115,
			  383, 2120, 2136,  928, 2120, 2143, 2159, 2164, 2018, 2169,
			  352, 2177, 2192, 2203, 2027, 2187, 2198, 2226, 2235, 2225,
			 2212, 2257, 2260, 2281, 2288, 2297, 2147, 1168, 2215,  284,
			  270, 1977, 2009, 2119, 2238, 2153, 2270,    0, 2170,    0,
			 2188, 2190, 2221,    0, 2229, 2234, 2236, 2263, 2272, 2263,

			 2276, 2268, 2283, 2284, 2285, 2275, 2279, 2290, 2292, 2349,
			    0, 2337, 2308, 2354, 2328, 2379, 2372, 2395, 2400, 2405,
			 2411, 2416, 2426, 2431, 2454, 2459, 2465, 2469, 2362, 2474,
			 2448, 2500, 2505, 2514, 2519, 2528, 2533, 2528, 2326, 2551,
			 2556, 2571, 2579, 2474, 2556, 4772, 2414, 2429, 2434, 2434,
			 2442,    0, 2463, 2464,    0, 2469, 2482, 2509, 2516, 2518,
			 2536, 2529, 2533, 2540, 2553, 2555, 2561, 2566,    0, 2555,
			 2570, 2575,    0, 2564, 2622,    0, 2598, 2627, 2639, 2649,
			 2672, 2654, 2677, 2576, 2682, 2687,  303, 2693, 4772, 2698,
			 2708, 2732, 2736, 2740, 2744, 2748, 2697, 2752, 2763, 2780,

			 2784, 2789, 2793, 2779, 2801, 2087, 4772, 2807, 2812, 2838,
			  289,  258, 2566, 2684, 2696,    0, 2727,    0, 2736,    0,
			    0,    0, 2728,    0,    0, 2766,    0,    0, 2777,    0,
			 2784,    0, 2792, 2790, 2794, 2795,  923,  205,  156, 2859,
			 2864, 2869, 2874, 2882, 2892,  146,  104, 2897, 2903, 2913,
			 2926, 2872, 2938, 4772, 2942, 2947, 4772, 2955, 2961, 2959,
			 2965, 2986, 2960, 2965, 2800, 2796, 2797, 2803, 2809,    0,
			    0, 2815, 2877, 2896, 2961,    0, 2963,  276,  187, 2982,
			   87, 3009, 3014, 3021, 3026, 3049, 3012, 3053, 3059, 3045,
			 3058, 3076, 3080, 3059, 3061, 2960, 3022, 3023,    0,    0,

			 3042, 3055,    0, 3044,    0, 4772, 3109,   86, 3099, 3111,
			 3122, 3119, 3124, 3130, 4772, 3155,  296, 4772, 3073, 3057,
			 3103, 3112, 3114, 3112,  452, 3163, 3168, 3172, 3180, 3193,
			 3216, 3158, 3130,    0,    0,    0,    0, 3140, 3205, 3228,
			 3227, 3235, 3206, 3142, 3206, 3239, 3256, 3253, 3263,  105,
			 3209,    0, 3273, 3264, 4772, 3299, 3248, 3228, 3289, 3298,
			 3322, 3299,    0, 3315, 3290,   83, 3324, 3331, 3310, 4772,
			 3312, 3349, 3354, 3334, 3368, 3341, 4772, 3375, 3380, 3390,
			 4772, 3395, 3405, 3410, 3415, 4772, 3458, 3503, 3548, 3593,
			 3638, 3683, 3728, 3772, 3812, 3856, 3901, 3946, 3991, 4036,

			 4080, 4124, 4169, 4214, 4259, 4304, 4349, 4390, 4434, 4478,
			 4513, 4557, 3429, 4601, 4645, 4680, 4692, 4714, 4749, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  785,    1,  786,  786,  787,  787,  788,  788,  789,
			  789,  790,  790,  785,  785,  785,  785,  785,  791,  785,
			  792,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  794,  785,  785,  795,  785,  785,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,  785,
			  785,  785,  796,  785,  785,  785,  797,  798,  785,  798,
			  799,  785,  800,  785,  800,  800,  785,  801,  802,  785,
			  785,  785,  785,  791,  785,  803,  804,  803,  803,  805,

			  785,  785,  785,  785,  806,  785,  785,  785,  785,  785,
			  785,  793,  785,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,   46,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  807,  794,  795,  785,  785,  785,   56,  785,  147,
			  147,   56,   56,   56,   56,  147,   56,  147,  147,   56,
			   56,  147,  147,   56,   56,  147,   56,  147,  147,  147,
			   56,   56,   56,  147,   56,  147,   56,  147,  147,   56,
			   56,  147,  147,   56,   56,  147,  147,   56,   56,  147,
			   56,  147,   56,  785,  796,  785,  797,  785,  796,   75,

			  785,  797,  798,  785,  798,  799,  785,  799,  800,  785,
			  800,  785,  785,  785,  808,  785,  801,  802,  785,  785,
			  217,  809,  785,  785,  785,  785,  810,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  793,  793,  793,  793,
			  793,  793,  793,  793,  785,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  131,  131,  131,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  785,  785,  785,  785,  147,  147,  785,  147,   56,   56,
			  147,   56,  147,  147,  147,   56,   56,   56,  147,  147,

			   56,   56,  785,  147,  147,  147,  147,   56,   56,   56,
			  147,   56,  147,   56,  147,  147,   56,   56,  147,  147,
			   56,   56,  147,  147,  147,   56,   56,   56,  147,   56,
			  147,   56,  796,  796,  785,  811,  811,  785,  811,  809,
			  812,  810,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  793,  793,  793,  793,  793,
			  793,  793,  785,  793,  793,  793,  793,  793,  793,  793,
			  131,  793,  381,  381,  381,  793,  785,  785,  793,  793,
			  793,  793,  793,  793,  793,  813,  814,  147,   56,  147,

			   56,  147,  147,  147,   56,   56,   56,  147,  147,   56,
			  147,  147,  147,  147,   56,   56,   56,  147,   56,  147,
			  147,   56,   56,  147,  147,   56,   56,  147,  147,  147,
			   56,   56,  147,   56,  332,  785,  785,  815,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  806,  785,  785,  793,  793,  793,  793,  793,  793,
			  785,  793,  793,  793,  793,  793,  793,  793,  381,  468,
			  785,  785,  793,  793,  793,  793,  785,  785,  813,  147,
			   56,  147,   56,  147,  147,   56,   56,  147,  147,   56,
			  147,  147,  147,  147,   56,   56,   56,  147,   56,  147,

			  147,   56,   56,  147,  147,  147,  147,   56,   56,  434,
			  816,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  817,  793,  793,  793,  793,  793,  793,
			  785,  793,  793,  793,  793,  793,  793,  785,  785,  793,
			  793,  793,  793,  785,  785,  785,  147,  147,   56,  147,
			  147,  147,   56,   56,   56,  147,  147,  147,  147,   56,
			   56,   56,  147,   56,  147,  147,   56,   56,  147,  147,
			  147,  147,   56,   56,  509,  818,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  793,  793,  793,  793,  793,  785,  793,  793,  793,

			  793,  793,  793,  785,  785,  785,  785,  793,  793,  793,
			  785,  785,  147,  147,   56,  147,  147,   56,   56,  147,
			  147,  147,  147,   56,   56,   56,  147,   56,  147,  147,
			   56,   56,  147,  147,  147,   56,  796,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  793,  793,  793,  785,  793,  793,  785,  785,  785,  793,
			  793,  793,  785,  785,  147,  147,   56,  147,   56,  147,
			   56,  147,   56,  147,  147,  147,   56,  796,  785,  785,
			  785,  785,  785,  785,  785,  793,  793,  793,  793,  785,
			  785,  793,  793,  785,  785,  147,  147,   56,  147,   56,

			  147,   56,  147,  147,   56,  785,  785,  785,  793,  793,
			  793,  785,  785,  785,  785,  793,  785,  785,  147,  147,
			   56,  147,   56,  147,  785,  793,  793,  793,  785,  785,
			  793,  785,  147,  147,   56,  147,   56,  147,  785,  793,
			  785,  793,  785,  147,  147,  785,  793,  785,  793,  785,
			  147,  147,  785,  785,  785,  793,  785,  147,  785,  785,
			  793,  785,  147,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,    0,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,

			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785, yy_Dummy>>)
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
			   14,   12,   29,   10,   30,   20,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   79,   90,   90,   90,
			   90,   22,   31,   23,    9,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   24,
			   21,   25,  111,  112,  113,  111,  114,  129,   95,  129,
			  129,  129,  129,  129,  129,  129,   66,  129,  129,   89,
			    1,    2,   28,  106,  105,  126,  126,  126,  126,    3,

			   33,  101,   32,    0,    0,   97,    0,   27,   26,   19,
			    0,   90,   86,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   40,   90,   85,
			   85,   78,   83,   85,   90,   90,   90,   90,   90,   90,
			   90,    0,    0,    0,   96,    0,    0,   92,    0,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   40,   92,
			   40,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   93,  111,  113,    0,  112,  111,  111,

			  108,  107,    0,   95,    0,    0,   94,    0,    0,    0,
			    0,   66,    0,   64,    0,   63,    0,    0,   89,   87,
			   87,    0,   88,  126,  115,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,    4,   34,  101,    0,    0,
			    0,   99,  101,   99,   97,    0,   90,   39,   90,   90,
			   90,   90,   90,   90,    0,   90,   90,   90,   90,   90,
			   42,   90,   90,   79,   79,   77,   79,   84,   90,   84,
			   84,   84,   74,   90,   90,   90,   90,   90,   41,   90,
			    0,   67,   91,    0,   92,   39,   68,   68,   92,   39,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,    0,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   42,   42,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   41,   41,
			   92,   92,  111,  109,   94,    0,    0,   65,   63,    0,
			    0,    0,    0,  122,  120,  123,  127,  127,  121,  119,
			  116,  117,  118,  101,    0,  101,    0,    0,  101,    0,
			    0,    0,  100,   97,    0,   90,   90,   38,   90,   90,
			   90,   90,    0,   90,   90,   90,   90,   90,   90,   90,
			   78,   90,   90,   78,   78,   78,    0,    0,   74,   37,
			   44,   90,   90,   90,   90,   62,   60,   92,   92,   92,

			   92,   38,   92,   92,   38,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   37,   44,   37,   44,   92,   92,   92,
			   92,   92,   92,   92,  111,   65,   63,    0,  124,  101,
			  101,    0,    0,   98,  101,    0,  100,    0,  100,    0,
			    0,    0,   97,    0,   90,   90,   90,   90,   45,   90,
			    0,   90,   90,   90,   36,   90,   90,   90,   90,   90,
			    0,    0,   90,   90,   90,   90,    0,   62,    0,   92,
			   92,   92,   92,   92,   92,   92,   92,   45,   92,   45,
			   92,   92,   92,   36,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   92,   92,   92,   92,   92,  111,
			    0,    0,  101,    0,  104,  101,  100,    0,    0,  100,
			    0,    0,   99,    0,   90,   90,   90,   90,   47,   90,
			    0,   90,   90,   90,   90,   90,   90,    0,   73,   53,
			   90,   90,   90,    0,    0,   61,   92,   92,   92,   92,
			   92,   47,   92,   92,   47,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   53,   92,
			   92,   92,   53,   92,  111,    0,    0,  101,    0,    0,
			    0,  100,    0,  104,  100,    0,   76,    0,  102,  104,
			  102,   90,   90,   59,   90,   46,    0,   43,   58,   90,

			   35,   90,   51,    0,    0,    0,   73,   90,   90,   90,
			    0,    0,   92,   92,   92,   59,   92,   59,   92,   46,
			   43,   58,   92,   43,   58,   92,   35,   35,   92,   51,
			   92,   51,   92,   92,   92,   92,  111,    0,  104,    0,
			  104,    0,  100,    0,    0,  103,    0,  104,    0,  103,
			   90,   90,   90,   81,   54,   90,   74,    0,    0,   90,
			   90,   55,    0,    0,   92,   92,   92,   92,   92,   54,
			   54,   92,   92,   92,   92,   55,   92,  110,    0,  104,
			  103,    0,  103,    0,  103,   90,   90,   48,   90,    0,
			   72,   52,   90,    0,    0,   92,   92,   92,   48,   48,

			   92,   92,   52,   92,   52,  125,  103,   75,   90,   90,
			   90,    0,    0,    0,   72,   90,   80,   80,   92,   92,
			   92,   92,   92,   92,    0,   90,   50,   49,    0,   72,
			   90,    0,   92,   50,   50,   49,   49,   92,    0,   90,
			    0,   90,    0,   92,   92,   71,   90,    0,   56,    0,
			   92,   56,    0,    0,   71,   90,    0,   92,    0,    0,
			   57,    0,   57,    0,   70,    0,    0,    0,    0,   70,
			    0,    0,    0,    0,    0,   69,   82,    0,    0,    0,
			   69,    0,   69,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4772
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 785
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 786
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
