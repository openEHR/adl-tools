note
	component:   "openEHR ADL Tools"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_C_DOMAIN_TYPE)
		end

feature {NONE} -- Implementation

	yy_build_tables
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

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
if yy_act <= 68 then
if yy_act <= 34 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 71 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 71")
end
-- Ignore separators
else
--|#line 72 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 72")
end
in_lineno := in_lineno + text_count
end
else
--|#line 77 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 77")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 78 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 78")
end
in_lineno := in_lineno + 1
else
--|#line 82 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 82")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 83 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 83")
end
last_token := Plus_code
else
--|#line 84 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 84")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
last_token := Slash_code
else
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 87 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 87")
end
last_token := Equal_code
else
--|#line 88 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 88")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 89 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 89")
end
last_token := Semicolon_code
else
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Colon_code
else
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Left_parenthesis_code
else
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Right_parenthesis_code
end
end
end
end
else
if yy_act <= 26 then
if yy_act <= 22 then
if yy_act <= 20 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Dollar_code
else
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Question_mark_code
end
else
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := SYM_INTERVAL_DELIM
end
else
if yy_act = 21 then
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
end
else
if yy_act <= 24 then
if yy_act = 23 then
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
else
if yy_act = 25 then
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
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
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
else
if yy_act = 29 then
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
end
else
if yy_act <= 32 then
if yy_act = 31 then
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
else
if yy_act = 33 then
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
end
end
end
end
else
if yy_act <= 51 then
if yy_act <= 43 then
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
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
else
--|#line 130 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 130")
end
last_token := SYM_ELSE
end
else
if yy_act = 38 then
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_AND
else
--|#line 134 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 134")
end
last_token := SYM_OR
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 136 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 136")
end
last_token := SYM_XOR
else
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_NOT
end
else
if yy_act = 42 then
--|#line 140 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 140")
end
last_token := SYM_IMPLIES
else
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_TRUE
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_FALSE
else
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_FORALL
end
else
if yy_act = 46 then
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_EXISTS
else
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_EXISTENCE
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
end
last_token := SYM_OCCURRENCES
else
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 50 then
--|#line 158 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 158")
end
last_token := SYM_ORDERED
else
--|#line 160 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 160")
end
last_token := SYM_UNORDERED
end
end
end
end
else
if yy_act <= 60 then
if yy_act <= 56 then
if yy_act <= 54 then
if yy_act <= 53 then
if yy_act = 52 then
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_UNIQUE
else
--|#line 164 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 164")
end
last_token := SYM_USE_NODE
end
else
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_USE_ARCHETYPE
end
else
if yy_act = 55 then
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
last_token := SYM_INCLUDE
end
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_EXCLUDE
else
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_AFTER
end
else
if yy_act = 59 then
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_BEFORE
else
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_CLOSED
end
end
end
else
if yy_act <= 64 then
if yy_act <= 62 then
if yy_act = 61 then
--|#line 181 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 181")
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
else
if yy_act = 63 then
--|#line 192 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 192")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 199 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 199")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 66 then
if yy_act = 65 then
--|#line 215 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 215")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 223 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 223")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
else
if yy_act = 67 then
--|#line 230 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 230")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 237 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 237")
end
in_lineno := in_lineno + text_count
end
end
end
end
end
end
else
if yy_act <= 102 then
if yy_act <= 85 then
if yy_act <= 77 then
if yy_act <= 73 then
if yy_act <= 71 then
if yy_act <= 70 then
if yy_act = 69 then
--|#line 240 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 240")
end
in_lineno := in_lineno + 1
else
--|#line 242 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 242")
end
 -- match final line, terminating in ']'
				if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
					last_token := ERR_TERM_CODE_CONSTRAINT
				else
					in_buffer.append(text_substring(1, text_count-1))
					create str_.make (in_buffer.count)
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
if yy_act = 72 then
--|#line 269 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 269")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 276 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 276")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 75 then
if yy_act = 74 then
--|#line 277 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 277")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 278 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 278")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 76 then
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 286 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 286")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 81 then
if yy_act <= 79 then
if yy_act = 78 then
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
else
if yy_act = 80 then
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 302 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 302")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 83 then
if yy_act = 82 then
--|#line 309 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 309")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 321 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 321")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 84 then
--|#line 331 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 331")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 336 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 336")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 94 then
if yy_act <= 90 then
if yy_act <= 88 then
if yy_act <= 87 then
if yy_act = 86 then
--|#line 346 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 346")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 352 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 352")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
--|#line 363 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 363")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				last_string_value := text
			
end
else
if yy_act = 89 then
--|#line 364 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 364")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				last_string_value := text
			
else
--|#line 373 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 373")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 92 then
if yy_act = 91 then
--|#line 374 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 374")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 388 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 388")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 93 then
--|#line 395 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 395")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 401 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 401")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 98 then
if yy_act <= 96 then
if yy_act = 95 then
--|#line 407 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 407")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 411 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 411")
end
 -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of ODIN
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_lineno := in_lineno + str_.occurrences('%N')

				-- perform any upgrades to embedded ODIN object syntax here by substitution
				convert_c_dv_names(str_)

				odin_parser_error.wipe_out
				odin_parser.execute (str_, source_start_line + in_lineno)
				if not odin_parser.syntax_error then
					if odin_parser.output.is_typed then
						tid := dynamic_type_from_string(odin_parser.output.im_type_name)
						if tid >= 0 then
							if attached {C_DV_QUANTITY} odin_parser.output.as_object(tid, Void) as cdt then
								last_c_dv_quantity_value := cdt
								last_token := V_C_DV_QUANTITY
							else
								odin_parser_error.add_error (ec_VDTCV, <<odin_parser.output.im_type_name>>, "")
								last_token := ERR_C_DV_QUANTITY
							end
						else
							odin_parser_error.add_error (ec_VDTTU, <<odin_parser.output.im_type_name>>, "")
							last_token := ERR_C_DV_QUANTITY
						end
					else
						odin_parser_error.add_error (ec_VDTNT, Void, "")
						last_token := ERR_C_DV_QUANTITY
					end
				else
					odin_parser_error.append (odin_parser.errors)
					last_token := ERR_C_DV_QUANTITY
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
end
else
if yy_act = 97 then
--|#line 453 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 453")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 459 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 459")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 100 then
if yy_act = 99 then
--|#line 465 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 465")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 471 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 471")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 101 then
--|#line 478 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 478")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_ABS_PATH
				last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 119 then
if yy_act <= 111 then
if yy_act <= 107 then
if yy_act <= 105 then
if yy_act <= 104 then
if yy_act = 103 then
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_REL_PATH
				last_string_value := text
			
else
--|#line 496 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 496")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 106 then
--|#line 507 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 507")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 511 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 511")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 109 then
if yy_act = 108 then
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
end
 		-- match final segment
				in_buffer.append_string (text)

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
	
else
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 110 then
--|#line 534 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 534")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 539 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 539")
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
			
end
end
end
else
if yy_act <= 115 then
if yy_act <= 113 then
if yy_act = 112 then
--|#line 554 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 554")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 555 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 555")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 114 then
--|#line 559 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 559")
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
--|#line 560 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 560")
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
end
else
if yy_act <= 117 then
if yy_act = 116 then
--|#line 561 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 561")
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
--|#line 581 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 581")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 118 then
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 127 then
if yy_act <= 123 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 596 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 596")
end
in_buffer.append_character ('"')
else
--|#line 598 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 598")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 122 then
--|#line 602 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 602")
end
in_buffer.append_string (text)
else
--|#line 604 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 604")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 125 then
if yy_act = 124 then
--|#line 609 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 609")
end
						-- match final end of string
				last_token := V_STRING
				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
else
--|#line 620 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 620")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 126 then
--|#line 629 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 629")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 631 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 631")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 131 then
if yy_act <= 129 then
if yy_act = 128 then
--|#line 632 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 632")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 633 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 633")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 130 then
--|#line 634 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 634")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 635 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 635")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 133 then
if yy_act = 132 then
--|#line 637 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 637")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 638 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 638")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 134 then
--|#line 642 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 642")
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

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2, 3, 4 then
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

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7479)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   12,   13,   14,   13,   13,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   27,
			   28,   28,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   38,   41,   42,   38,   43,
			   44,   45,   46,   38,   38,   38,   47,   48,   38,   49,
			   50,   38,   51,   52,   53,   54,   12,   55,   56,   57,
			   58,   59,   60,   58,   61,   62,   58,   63,   64,   65,
			   58,   58,   58,   58,   66,   67,   58,   58,   68,   69,
			   70,   71,   72,   12,   12,   12,   12,   12,   12,   12,
			   12,   12,   74,   83,   93,   83,   75,   74,   93,  101,

			   95,   75,   95,   95,  105,  239,  106,  106,  106,  106,
			  106,  259,  109,  214,  110,  156,  111,  111,  111,  111,
			  111,  116,  116,  190,  116,  882,  461,  117,   84,   85,
			   84,   85,  109,  157,  110,  157,  113,  113,  113,  113,
			  113,  461,   76,  102,  118,  192,  260,   76,  881,   94,
			  457,  191,  864,   94,  112,  213,  117,  213,  213,  215,
			  240,  163,   95,  163,   95,   95,  261,  261,  261,  261,
			  261,  865,  235,  193,  112,  235,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   86,   86,   91,
			   86,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  116,  116,  157,
			  116,  116,  116,  239,  116,  859,  212,  116,  116,  140,
			  116,  206,  212,  116,  116,  858,  116,  834,  116,  116,

			  118,  116,  116,  116,  118,  116,  734,  163,  503,  119,
			  118,  212,  122,  120,  123,  121,  118,  140,  212,  207,
			  127,  118,  318,  124,  213,  118,  213,  213,  414,  212,
			  116,  116,  128,  116,  125,  157,  129,  119,  240,  269,
			  122,  120,  123,  121,  380,  126,  270,  157,  127,  116,
			  116,  124,  116,  118,  116,  116,  208,  116,  116,  116,
			  128,  116,  125,  163,  129,  217,  814,  130,  131,  216,
			  216,  216,  118,  132,  126,  163,  133,  118,  598,  116,
			  116,  118,  116,  116,  116,  209,  116,  135,  218,  218,
			  218,  116,  116,  134,  116,  130,  131,  217,  156,  222,

			  136,  132,  118,  212,  133,  226,  118,  219,  219,  237,
			  230,  507,  237,  230,  118,  135,  154,  116,  116,  154,
			  116,  134,  148,  782,  155,  144,  507,  149,  136,  116,
			  116,  747,  116,  145,  223,  224,  386,  385,  313,  386,
			  118,  227,  228,  822,  137,  138,  138,  138,  138,  138,
			  148,  157,  118,  144,  212,  146,  149,  746,  182,  139,
			  147,  145,  232,  157,  168,  157,  140,  229,  745,  157,
			  639,  157,  606,  141,  314,  142,  744,  143,  222,  163,
			  220,  220,  220,  146,  823,  639,  183,  139,  147,  315,
			  163,  163,  169,  163,  140,  116,  116,  163,  116,  163,

			  816,  817,  223,  224,  142,  163,  143,  154,  234,  212,
			  154,  234,  112,  223,  224,  155,  387,  385,  267,  387,
			  235,  236,  156,  157,  157,  157,  157,  157,  158,  734,
			  237,  216,  216,  216,  157,  157,  157,  157,  157,  159,
			  157,  157,  157,  160,  157,  161,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  162,  831,  831,
			  232,  157,  163,  163,  164,  163,  163,  165,  163,  163,
			  163,  166,  163,  167,  163,  163,  163,  163,  163,  164,
			  163,  163,  163,  163,  163,  170,  216,  216,  216,  157,
			  157,  816,  817,  157,  171,  157,  157,  266,  266,  266,

			  266,  266,  253,  253,  234,  253,  269,  234,  157,  157,
			  157,  157,  157,  172,  163,  163,  235,  163,  163,  730,
			  259,  163,  173,  163,  163,  397,  237,  157,  156,  163,
			  163,  174,  269,  157,  269,  178,  319,  212,  157,  270,
			  157,  270,  175,  283,  157,  694,  157,  179,  184,  185,
			  157,  157,  163,  268,  186,  163,  232,  157,  157,  176,
			  194,  163,  734,  180,  326,  163,  163,  163,  163,  859,
			  157,  177,  163,  195,  163,  181,  187,  188,  163,  157,
			  163,  157,  189,  157,  157,  157,  163,  229,  196,  157,
			  341,  198,  202,  157,  514,  505,  157,  203,  163,  199,

			  109,  197,  110,  617,  264,  264,  264,  264,  264,  163,
			  602,  157,  163,  212,  378,  378,  378,  157,  341,  200,
			  204,  163,  223,  224,  163,  205,  109,  201,  242,  242,
			  557,  242,  899,  269,  247,  157,  157,  157,  157,  157,
			  345,  415,  112,  248,  248,  248,  248,  248,  254,  230,
			  254,  254,  230,  243,  520,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  249,  256,
			  256,  256,  256,  256,  635,  262,  262,  262,  262,  262,
			  379,  379,  379,  250,  257,  389,  389,  251,  389,  252,

			  263,  232,  385,  552,  212,  109,  553,  110,  244,  264,
			  264,  264,  264,  264,  265,  385,  822,  258,  116,  116,
			  243,  116,  257,  116,  116,  381,  116,  734,  263,  458,
			  212,  268,  269,  454,  347,  552,  268,  269,  552,  270,
			  157,  118,  116,  116,  270,  116,  118,  112,  269,  441,
			  157,  157,  157,  157,  157,  268,  269,  824,  116,  116,
			  415,  116,  347,  270,  226,  118,  414,  272,  157,  402,
			  320,  268,  269,  116,  116,  899,  116,  396,  273,  270,
			  395,  118,  219,  219,  394,  355,  268,  269,  274,  116,
			  116,  157,  116,  393,  270,  272,  118,  390,  327,  899,

			  227,  228,  268,  269,  233,  275,  273,  216,  216,  216,
			  270,  380,  118,  355,  116,  116,  274,  116,  269,  157,
			  157,  157,  157,  157,  157,  899,  381,  268,  269,  116,
			  116,  276,  116,  275,  380,  270,  329,  118,  389,  389,
			  117,  389,  268,  269,  116,  116,  212,  116,  116,  116,
			  270,  116,  118,  277,  117,  307,  117,  268,  269,  276,
			  322,  268,  269,  899,  330,  270,  257,  118,  117,  270,
			  318,  118,  278,  279,  116,  116,  316,  116,  382,  280,
			  153,  277,  313,  307,  281,  117,  291,  268,  269,  258,
			  116,  116,  255,  116,  257,  270,  552,  118,  254,  553, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  278,  279,  253,  268,  269,  116,  116,  280,  116,  246,
			   99,  283,  281,  118,  227,  228,  282,   96,  268,  269,
			  116,  116,  637,  116,  233,  637,  270,  212,  118,  410,
			  410,  410,  410,  268,  269,  210,  153,  116,  116,  638,
			  116,  270,  638,  118,  282,  284,  638,  702,  635,  285,
			  268,  269,  414,  116,  116,  151,  116,  426,  270,  269,
			  118,  157,  157,  157,  157,  157,  268,  269,  426,  116,
			  116,  115,  116,  284,  270,  321,  118,  285,  426,  268,
			  269,  114,  268,  269,  212,  116,  116,  323,  116,  107,
			  270,  286,  118,  157,  104,   99,  426,  287,  268,  269,

			  899,  899,   97,  328,  634,  157,  270,   96,  118,  116,
			  116,  899,  116,  288,  289,  117,  310,  680,  680,  680,
			  680,  163,  268,  269,  234,  287,  899,  234,  212,  117,
			  270,  117,  118,  163,  116,  116,  235,  116,  899,  290,
			  899,  288,  289,  117,  310,  899,  237,  268,  269,  137,
			  212,  116,  116,  636,  116,  270,  637,  118,  688,  637,
			  117,  218,  218,  218,  268,  269,  137,  290,  292,  268,
			  293,  899,  270,  531,  118,  688,  232,  270,  299,  688,
			  638,  139,  899,  899,  531,  157,  294,  729,  899,  899,
			  295,  157,  899,  296,  531,  299,  346,  142,  899,  899,

			  117,  899,  297,  688,  298,  220,  220,  220,  899,  139,
			  406,  899,  531,  157,  294,  729,  117,  305,  295,  157,
			  306,  296,  899,  899,  346,  899,  142,  216,  216,  216,
			  117,  297,  117,  298,  300,  301,  301,  301,  301,  301,
			  899,  899,  899,  899,  117,  305,  899,  899,  306,  117,
			  899,  157,  356,  302,  899,  117,  303,  157,  117,  899,
			  308,  117,  304,  117,  309,  117,  899,  157,  899,  117,
			  311,  117,  117,  157,  117,  899,  899,  117,  899,  157,
			  356,  302,  351,  117,  303,  157,  117,  899,  308,  899,
			  304,  117,  309,  899,  117,  157,  738,  899,  311,  899,

			  117,  157,  899,  117,  899,  117,  899,  117,  154,  312,
			  351,  154,  154,  738,  117,  154,  155,  738,  899,  117,
			  155,  268,  269,  156,  899,  268,  269,  156,  117,  270,
			  117,  154,  899,  270,  154,  899,  117,  899,  312,  155,
			  154,  738,  117,  154,  268,  269,  156,  899,  155,  212,
			  899,  157,  270,  268,  269,  156,  319,  157,  162,  117,
			  899,  270,  162,  899,  342,  899,  740,  320,  268,  324,
			  321,  325,  325,  325,  325,  325,  323,  899,  899,  157,
			  157,  162,  157,  740,  319,  157,  157,  740,  154,  899,
			  162,  154,  342,  899,  157,  320,  155,  899,  321,  899,

			  899,  268,  269,  156,  154,  348,  899,  154,  157,  270,
			  163,  740,  155,  154,  157,  899,  154,  268,  269,  156,
			  329,  155,  163,  899,  899,  270,  268,  269,  156,  373,
			  374,  375,  376,  377,  270,  899,  899,  269,  162,  157,
			  157,  157,  157,  157,  899,  899,  331,  603,  329,  603,
			  268,  269,  332,  157,  162,  899,  318,  604,  323,  157,
			  899,  899,  414,  162,  157,  331,  899,  426,  353,  154,
			  899,  899,  154,  899,  331,  899,  332,  155,  426,  899,
			  332,  157,  268,  269,  156,  605,  154,  157,  426,  154,
			  270,  899,  163,  333,  155,  899,  353,  899,  899,  268,

			  269,  156,  899,  899,  334,  899,  426,  270,  764,  764,
			  764,  157,  335,  359,  157,  336,  899,  157,  899,  162,
			  157,  337,  269,  899,  157,  157,  157,  157,  157,  269,
			  899,  157,  157,  157,  157,  157,  162,  899,  899,  157,
			  335,  359,  157,  336,  336,  157,  899,  157,  157,  337,
			  337,  335,  269,  483,  157,  157,  157,  157,  157,  269,
			  899,  157,  157,  157,  157,  157,  391,  392,  392,  392,
			  392,  392,  339,  899,  341,  157,  212,  899,  340,  338,
			  269,  483,  157,  157,  157,  157,  157,  342,  269,  899,
			  157,  157,  157,  157,  157,  269,  899,  157,  157,  157,

			  157,  157,  343,  347,  899,  899,  346,  269,  899,  157,
			  157,  157,  157,  157,  269,  344,  157,  157,  157,  157,
			  157,  269,  157,  157,  157,  157,  157,  157,  157,  782,
			  782,  350,  782,  899,  349,  348,  355,  351,  360,  899,
			  899,  775,  899,  269,  353,  157,  157,  157,  157,  157,
			  157,  157,  807,  216,  216,  216,  157,  363,  775,  356,
			  899,  364,  775,  157,  357,  352,  360,  899,  899,  157,
			  473,  269,  354,  157,  157,  157,  157,  157,  269,  157,
			  157,  157,  157,  157,  157,  363,  775,  358,  359,  364,
			  157,  157,  365,  268,  269,  899,  157,  157,  473,  899,

			  269,  323,  157,  157,  157,  157,  157,  157,  157,  360,
			  234,  899,  899,  234,  157,  363,  361,  365,  157,  364,
			  365,  369,  235,  269,  157,  157,  157,  157,  157,  157,
			  899,  899,  237,  157,  899,  163,  157,  362,  899,  157,
			  899,  899,  157,  366,  899,  368,  899,  367,  899,  369,
			  899,  369,  371,  269,  486,  157,  157,  157,  157,  157,
			  157,  157,  232,  862,  862,  862,  862,  157,  398,  398,
			  398,  398,  398,  401,  401,  401,  401,  401,  899,  370,
			  899,  371,  486,  257,  399,  899,  399,  371,  157,  400,
			  400,  400,  400,  400,  403,  403,  403,  403,  403,  411,

			  411,  411,  411,  411,  899,  899,  258,  884,  884,  884,
			  884,  257,  899,  899,  899,  899,  372,  383,  384,  385,
			  383,  384,  383,  383,  383,  383,  383,  383,  383,  383,
			  386,  236,  236,  383,  236,  236,  236,  236,  236,  383,
			  387,  383,  383,  383,  383,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  383,  383,
			  388,  383,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  383,  383,  383,  383,

			  383,  383,  383,  383,  383,  383,  383,  383,  242,  242,
			  407,  242,  407,  899,  899,  408,  408,  408,  408,  408,
			  899,  109,  899,  110,  899,  409,  409,  409,  409,  409,
			  899,  899,  899,  243,  899,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  404,  404,
			  404,  404,  404,  112,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  405,  899,  899,  899,  899,  899,  117,
			  416,  899,  899,  117,  899,  899,  419,  899,  244,  117,
			  117,  421,  417,  117,  899,  117,  406,  117,  418,  117, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  405,  117,  117,  117,  117,  117,  117,  416,  117,
			  899,  117,  899,  899,  419,  899,  899,  117,  117,  421,
			  417,  899,  420,  117,  117,  117,  418,  117,  117,  899,
			  117,  117,  837,  422,  117,  117,  899,  117,  626,  899,
			  837,  117,  899,  117,  117,  899,  117,  899,  899,  626,
			  420,  117,  899,  837,  117,  117,  899,  117,  117,  626,
			  117,  422,  899,  899,  423,  117,  899,  117,  837,  899,
			  424,  117,  117,  117,  117,  117,  117,  626,  899,  117,
			  631,  117,  885,  899,  425,  117,  899,  427,  117,  899,
			  886,  632,  423,  899,  899,  117,  117,  117,  424,  885,

			  899,  633,  117,  885,  117,  117,  157,  886,  117,  117,
			  428,  886,  157,  429,  899,  427,  460,  899,  117,  632,
			  117,  899,  117,  899,  117,  899,  117,  885,  430,  117,
			  889,  157,  117,  899,  157,  886,  117,  157,  428,  899,
			  157,  429,  899,  117,  460,  117,  899,  889,  117,  117,
			  698,  889,  899,  117,  117,  432,  430,  117,  899,  157,
			  899,  698,  117,  431,  117,  157,  899,  899,  117,  899,
			  117,  699,  899,  899,  117,  889,  117,  433,  433,  433,
			  433,  433,  117,  432,  434,  434,  434,  434,  434,  698,
			  899,  431,  899,  117,  117,  117,  117,  117,  117,  117,

			  899,  435,  435,  435,  435,  435,  899,  437,  437,  437,
			  437,  437,  899,  899,  899,  117,  117,  117,  117,  117,
			  117,  117,  462,  899,  463,  463,  463,  463,  463,  436,
			  899,  117,  899,  899,  117,  117,  269,  117,  157,  157,
			  157,  157,  157,  117,  400,  400,  400,  400,  400,  117,
			  899,  438,  438,  438,  438,  438,  766,  767,  766,  767,
			  117,  899,  117,  899,  899,  117,  117,  899,  899,  439,
			  439,  439,  439,  439,  899,  899,  899,  300,  899,  436,
			  899,  117,  442,  117,  443,  899,  899,  440,  440,  440,
			  440,  440,  117,  117,  768,  899,  899,  436,  899,  117,

			  899,  117,  899,  899,  444,  304,  117,  445,  117,  300,
			  117,  117,  899,  446,  899,  436,  899,  117,  899,  899,
			  117,  899,  899,  899,  117,  448,  899,  899,  117,  117,
			  899,  117,  444,  304,  117,  445,  899,  117,  117,  447,
			  117,  446,  117,  449,  899,  117,  117,  117,  117,  899,
			  117,  899,  117,  851,  899,  851,  117,  899,  117,  117,
			  899,  520,  117,  852,  117,  899,  899,  447,  899,  117,
			  117,  449,  117,  899,  698,  450,  117,  899,  117,  117,
			  117,  899,  899,  117,  451,  700,  117,  117,  117,  899,
			  899,  853,  117,  838,  899,  701,  157,  117,  459,  117,

			  117,  838,  157,  450,  117,  117,  899,  452,  899,  117,
			  899,  117,  451,  700,  838,  899,  899,  117,  117,  117,
			  117,  117,  899,  453,  157,  899,  459,  899,  117,  838,
			  157,  899,  117,  117,  455,  899,  455,  455,  455,  455,
			  455,  313,  269,  899,  157,  157,  157,  157,  157,  117,
			  117,  456,  453,  456,  456,  456,  456,  456,  313,  324,
			  899,  325,  325,  325,  325,  325,  269,  899,  157,  157,
			  157,  157,  157,  899,  157,  899,  157,  268,  269,  899,
			  157,  899,  157,  459,  157,  323,  466,  268,  269,  899,
			  157,  157,  157,  468,  157,  323,  472,  497,  157,  899,

			  157,  157,  157,  460,  157,  899,  868,  899,  157,  157,
			  157,  464,  157,  466,  466,  157,  899,  868,  157,  163,
			  157,  468,  157,  469,  472,  497,  157,  868,  157,  163,
			  269,  465,  157,  157,  157,  157,  157,  157,  899,  899,
			  899,  467,  899,  157,  899,  868,  468,  899,  899,  899,
			  269,  469,  157,  157,  157,  157,  157,  157,  506,  506,
			  506,  506,  506,  157,  269,  899,  157,  157,  157,  157,
			  157,  474,  899,  899,  470,  899,  157,  157,  899,  469,
			  899,  472,  157,  157,  269,  157,  157,  157,  157,  157,
			  157,  157,  269,  899,  157,  157,  157,  157,  157,  474,

			  899,  479,  157,  899,  157,  157,  473,  471,  157,  475,
			  157,  157,  890,  899,  899,  899,  478,  899,  899,  899,
			  899,  474,  269,  899,  157,  157,  157,  157,  157,  890,
			  157,  899,  899,  890,  476,  269,  157,  157,  157,  157,
			  157,  157,  899,  899,  478,  899,  157,  899,  157,  477,
			  899,  478,  157,  481,  157,  482,  269,  890,  157,  157,
			  157,  157,  157,  269,  899,  157,  157,  157,  157,  157,
			  892,  893,  892,  893,  157,  479,  157,  899,  481,  480,
			  157,  481,  157,  482,  269,  482,  157,  157,  157,  157,
			  157,  157,  157,  899,  489,  899,  899,  157,  157,  486,

			  391,  392,  392,  392,  392,  392,  484,  488,  894,  899,
			  899,  899,  269,  485,  157,  157,  157,  157,  157,  157,
			  157,  899,  489,  899,  899,  157,  157,  487,  269,  899,
			  157,  157,  157,  157,  157,  488,  899,  899,  157,  899,
			  157,  899,  493,  488,  157,  489,  157,  492,  899,  899,
			  899,  899,  269,  899,  157,  157,  157,  157,  157,  157,
			  899,  157,  899,  899,  899,  565,  157,  157,  157,  899,
			  493,  490,  157,  491,  157,  492,  492,  269,  157,  157,
			  157,  157,  157,  157,  157,  157,  498,  157,  899,  157,
			  496,  157,  899,  565,  493,  157,  269,  157,  157,  157,

			  157,  157,  157,  157,  494,  269,  157,  157,  157,  157,
			  157,  157,  157,  157,  899,  899,  501,  899,  496,  157,
			  899,  899,  495,  496,  269,  157,  157,  157,  157,  157,
			  157,  157,  269,  497,  157,  157,  157,  157,  157,  899,
			  384,  385,  899,  384,  269,  501,  157,  157,  157,  157,
			  157,  499,  386,  504,  504,  504,  504,  504,  899,  899,
			  899,  500,  387,  899,  498,  508,  508,  508,  508,  508,
			  509,  509,  509,  509,  509,  510,  899,  510,  501,  899,
			  511,  511,  511,  511,  511,  405,  512,  512,  512,  512,
			  512,  505,  388,  408,  408,  408,  408,  408,  513,  513,

			  513,  513,  513,  899,  899,  899,  899,  502,  406,  899,
			  899,  515,  516,  405,  517,  517,  517,  517,  517,  518,
			  518,  518,  518,  518,  519,  519,  519,  519,  519,  899,
			  899,  899,  899,  899,  899,  899,  514,  899,  899,  440,
			  440,  440,  440,  440,  117,  117,  899,  899,  899,  117,
			  899,  899,  117,  117,  525,  899,  522,  899,  117,  117,
			  117,  523,  899,  117,  524,  117,  117,  117,  117,  117,
			  899,  117,  117,  117,  899,  899,  899,  117,  899,  899,
			  117,  117,  525,  899,  522,  117,  526,  157,  899,  117,
			  523,  117,  524,  157,  117,  899,  899,  117,  117,  117, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  117,  899,  569,  899,  117,  527,  117,  899,  899,
			  117,  117,  529,  117,  526,  157,  899,  899,  899,  117,
			  899,  157,  899,  899,  528,  117,  117,  117,  899,  530,
			  117,  569,  117,  117,  527,  899,  117,  117,  117,  117,
			  529,  534,  532,  899,  899,  899,  117,  117,  117,  117,
			  899,  117,  528,  117,  899,  117,  117,  530,  117,  778,
			  117,  117,  899,  778,  899,  117,  899,  899,  899,  534,
			  532,  899,  117,  533,  117,  899,  899,  117,  117,  117,
			  778,  899,  117,  535,  899,  899,  117,  869,  899,  899,
			  117,  778,  899,  117,  899,  117,  899,  574,  869,  157,

			  117,  533,  536,  117,  117,  157,  117,  117,  869,  899,
			  899,  535,  537,  899,  117,  899,  117,  899,  117,  433,
			  433,  433,  433,  433,  117,  574,  869,  157,  117,  877,
			  536,  877,  899,  157,  117,  117,  899,  117,  157,  878,
			  537,  899,  899,  117,  576,  117,  538,  269,  899,  434,
			  434,  434,  434,  434,  270,  899,  435,  435,  435,  435,
			  435,  899,  117,  899,  899,  117,  157,  879,  414,  899,
			  117,  117,  576,  546,  538,  899,  539,  540,  437,  437,
			  437,  437,  437,  899,  546,  899,  117,  899,  117,  438,
			  438,  438,  438,  438,  546,  899,  117,  899,  117,  899,

			  899,  899,  117,  294,  539,  540,  899,  439,  439,  439,
			  439,  439,  546,  899,  899,  117,  117,  117,  117,  297,
			  899,  541,  899,  899,  117,  542,  542,  542,  542,  542,
			  117,  294,  899,  899,  899,  117,  899,  117,  543,  543,
			  543,  543,  543,  899,  899,  899,  899,  117,  297,  541,
			  899,  544,  544,  544,  544,  544,  899,  545,  545,  545,
			  545,  545,  157,  899,  899,  117,  117,  157,  157,  899,
			  899,  117,  899,  157,  899,  899,  899,  899,  117,  117,
			  558,  117,  899,  899,  117,  117,  899,  117,  899,  117,
			  157,  899,  117,  117,  117,  157,  157,  548,  117,  117,

			  117,  157,  899,  117,  547,  117,  117,  899,  558,  157,
			  117,  117,  117,  117,  899,  157,  117,  117,  551,  549,
			  899,  899,  117,  117,  779,  548,  559,  778,  779,  117,
			  550,  780,  547,  899,  117,  117,  117,  157,  117,  899,
			  899,  899,  117,  157,  899,  779,  899,  549,  780,  117,
			  117,  117,  899,  899,  899,  559,  779,  899,  550,  780,
			  899,  899,  899,  117,  899,  899,  455,  117,  455,  455,
			  455,  455,  455,  313,  593,  593,  593,  593,  593,  456,
			  117,  456,  456,  456,  456,  456,  313,  560,  899,  560,
			  560,  560,  560,  560,  462,  899,  462,  462,  462,  462,

			  462,  899,  899,  324,  555,  463,  463,  463,  463,  463,
			  270,  899,  505,  899,  899,  899,  269,  556,  157,  157,
			  157,  157,  157,  269,  157,  157,  157,  157,  157,  157,
			  157,  594,  594,  594,  594,  594,  269,  563,  157,  157,
			  157,  157,  157,  157,  558,  566,  846,  899,  899,  157,
			  899,  899,  157,  899,  846,  559,  899,  269,  157,  157,
			  157,  157,  157,  157,  563,  563,  899,  846,  899,  899,
			  157,  157,  561,  566,  899,  157,  157,  157,  565,  578,
			  899,  157,  846,  269,  562,  157,  157,  157,  157,  157,
			  570,  269,  564,  157,  157,  157,  157,  157,  157,  157,

			  566,  573,  899,  157,  157,  157,  567,  578,  269,  157,
			  157,  157,  157,  157,  157,  899,  899,  269,  570,  157,
			  157,  157,  157,  157,  157,  899,  899,  157,  568,  573,
			  157,  899,  269,  157,  157,  157,  157,  157,  157,  569,
			  577,  398,  398,  398,  398,  398,  899,  570,  899,  573,
			  899,  269,  157,  157,  157,  157,  157,  157,  157,  269,
			  899,  157,  157,  157,  157,  157,  899,  571,  577,  899,
			  157,  899,  576,  157,  899,  572,  157,  575,  581,  157,
			  899,  899,  269,  583,  157,  157,  157,  157,  157,  269,
			  577,  157,  157,  157,  157,  157,  899,  157,  157,  157,

			  579,  157,  581,  157,  157,  157,  581,  157,  899,  899,
			  584,  583,  511,  511,  511,  511,  511,  583,  580,  599,
			  599,  599,  599,  599,  899,  157,  899,  157,  899,  899,
			  582,  157,  899,  157,  899,  899,  899,  269,  584,  157,
			  157,  157,  157,  157,  269,  585,  157,  157,  157,  157,
			  157,  269,  157,  157,  157,  157,  157,  157,  157,  899,
			  157,  588,  589,  899,  157,  584,  157,  899,  587,  899,
			  157,  899,  269,  590,  157,  157,  157,  157,  157,  269,
			  157,  157,  157,  157,  157,  157,  157,  899,  157,  588,
			  589,  551,  157,  586,  157,  588,  587,  899,  157,  899,

			  779,  590,  899,  587,  781,  551,  269,  157,  157,  157,
			  157,  157,  157,  157,  595,  899,  595,  595,  595,  595,
			  595,  781,  899,  592,  596,  596,  596,  596,  596,  899,
			  899,  591,  781,  899,  899,  157,  899,  899,  899,  405,
			  899,  157,  597,  597,  597,  597,  597,  600,  600,  600,
			  600,  600,  601,  601,  601,  601,  601,  596,  596,  596,
			  596,  596,  406,  899,  899,  899,  516,  405,  517,  517,
			  517,  517,  517,  899,  899,  899,  899,  899,  117,  117,
			  598,  157,  899,  899,  899,  514,  899,  157,  117,  610,
			  899,  899,  117,  117,  117,  117,  899,  520,  612,  899,

			  899,  899,  117,  609,  117,  899,  117,  117,  899,  157,
			  699,  117,  117,  899,  117,  157,  117,  610,  899,  611,
			  613,  701,  899,  117,  117,  117,  612,  117,  899,  899,
			  899,  701,  899,  117,  117,  899,  117,  899,  899,  117,
			  899,  899,  899,  117,  117,  614,  157,  611,  613,  701,
			  117,  899,  157,  117,  899,  899,  117,  615,  117,  616,
			  117,  899,  899,  899,  117,  117,  117,  117,  899,  117,
			  899,  899,  117,  614,  157,  899,  117,  618,  117,  899,
			  157,  117,  899,  619,  899,  615,  117,  616,  899,  117,
			  117,  899,  117,  899,  899,  117,  899,  117,  117,  117,

			  117,  899,  117,  899,  117,  618,  117,  620,  899,  899,
			  899,  619,  899,  899,  117,  899,  117,  622,  899,  899,
			  117,  117,  117,  899,  117,  899,  899,  899,  117,  847,
			  117,  117,  117,  899,  117,  620,  621,  847,  117,  899,
			  117,  899,  899,  899,  117,  622,  899,  899,  899,  899,
			  847,  117,  117,  899,  623,  623,  623,  623,  623,  899,
			  899,  117,  117,  899,  621,  847,  899,  899,  117,  117,
			  542,  542,  542,  542,  542,  899,  436,  899,  117,  899,
			  899,  899,  117,  899,  117,  899,  899,  442,  899,  443,
			  117,  544,  544,  544,  544,  544,  117,  624,  269,  899, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  543,  543,  543,  543,  543,  270,  899,  117,  899,  117,
			  899,  157,  445,  117,  117,  627,  899,  157,  446,  899,
			  545,  545,  545,  545,  545,  624,  899,  625,  117,  899,
			  117,  899,  899,  899,  117,  628,  640,  117,  899,  157,
			  445,  117,  117,  627,  117,  157,  446,  157,  117,  899,
			  117,  899,  899,  157,  654,  625,  629,  899,  117,  117,
			  117,  899,  117,  628,  117,  899,  803,  804,  899,  117,
			  803,  804,  117,  630,  899,  157,  899,  899,  117,  117,
			  117,  157,  654,  899,  629,  899,  803,  803,  804,  117,
			  805,  560,  117,  560,  560,  560,  560,  560,  803,  804,

			  269,  630,  157,  157,  157,  157,  157,  805,  269,  117,
			  157,  157,  157,  157,  157,  157,  899,  642,  805,  899,
			  269,  157,  157,  157,  157,  157,  157,  157,  899,  641,
			  899,  899,  899,  157,  157,  645,  644,  642,  899,  899,
			  157,  899,  899,  157,  899,  642,  157,  648,  640,  157,
			  899,  899,  157,  899,  269,  157,  157,  157,  157,  157,
			  157,  157,  157,  645,  644,  643,  899,  269,  157,  157,
			  157,  157,  157,  157,  157,  648,  899,  899,  644,  157,
			  157,  649,  899,  645,  269,  157,  157,  157,  157,  157,
			  157,  899,  269,  650,  157,  157,  157,  157,  157,  157,

			  648,  899,  157,  899,  655,  157,  646,  157,  157,  649,
			  899,  647,  269,  157,  157,  157,  157,  157,  157,  157,
			  656,  650,  899,  899,  899,  157,  899,  157,  651,  649,
			  157,  804,  655,  157,  899,  806,  157,  157,  899,  659,
			  899,  650,  899,  157,  899,  899,  899,  157,  656,  899,
			  899,  899,  806,  157,  899,  899,  269,  652,  157,  157,
			  157,  157,  157,  806,  157,  157,  662,  659,  899,  653,
			  157,  157,  269,  655,  157,  157,  157,  157,  157,  269,
			  157,  157,  157,  157,  157,  157,  157,  899,  656,  157,
			  899,  665,  157,  661,  662,  157,  659,  899,  157,  899,

			  269,  657,  157,  157,  157,  157,  157,  157,  157,  666,
			  899,  899,  157,  157,  157,  899,  658,  157,  157,  665,
			  157,  661,  899,  157,  660,  667,  157,  269,  661,  157,
			  157,  157,  157,  157,  899,  157,  157,  666,  899,  157,
			  157,  157,  157,  899,  662,  157,  157,  899,  157,  668,
			  899,  899,  899,  667,  157,  899,  663,  269,  899,  157,
			  157,  157,  157,  157,  157,  899,  899,  157,  899,  899,
			  157,  899,  664,  157,  665,  899,  269,  668,  157,  157,
			  157,  157,  157,  671,  671,  671,  671,  671,  899,  899,
			  899,  899,  595,  666,  595,  595,  595,  595,  595,  899,

			  899,  899,  669,  596,  596,  596,  596,  596,  899,  674,
			  674,  674,  674,  674,  899,  899,  899,  899,  673,  899,
			  899,  670,  675,  675,  675,  675,  675,  899,  899,  899,
			  672,  676,  676,  676,  676,  676,  677,  677,  677,  677,
			  677,  678,  678,  678,  678,  678,  673,  598,  679,  679,
			  679,  679,  679,  681,  681,  681,  681,  681,  899,  899,
			  899,  899,  899,  899,  899,  874,  899,  899,  263,  899,
			  683,  899,  899,  117,  117,  684,  874,  117,  117,  899,
			  899,  117,  685,  899,  899,  899,  874,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  263,  117,  683,  117,

			  117,  117,  117,  684,  874,  117,  117,  686,  899,  117,
			  685,  899,  899,  117,  117,  117,  117,  899,  117,  117,
			  899,  899,  117,  117,  899,  899,  117,  117,  117,  899,
			  899,  899,  117,  899,  899,  686,  157,  899,  687,  117,
			  117,  690,  157,  899,  117,  117,  117,  899,  117,  899,
			  899,  899,  689,  117,  117,  117,  117,  899,  117,  899,
			  117,  899,  117,  692,  157,  693,  687,  117,  117,  690,
			  157,  691,  117,  899,  117,  899,  117,  117,  117,  117,
			  689,  117,  899,  899,  117,  117,  117,  899,  117,  899,
			  117,  692,  899,  693,  623,  623,  623,  623,  623,  691,

			  899,  899,  117,  117,  117,  899,  899,  117,  899,  899,
			  117,  899,  117,  899,  899,  117,  117,  704,  899,  157,
			  117,  899,  696,  117,  157,  157,  707,  705,  697,  157,
			  157,  899,  695,  117,  117,  157,  117,  117,  899,  117,
			  117,  899,  117,  117,  117,  704,  899,  157,  117,  899,
			  696,  117,  157,  157,  707,  705,  697,  157,  157,  899,
			  695,  899,  899,  157,  899,  117,  899,  899,  117,  899,
			  899,  899,  703,  117,  703,  703,  703,  703,  703,  269,
			  899,  157,  157,  157,  157,  157,  268,  269,  593,  593,
			  593,  593,  593,  269,  323,  157,  157,  157,  157,  157,

			  705,  157,  899,  157,  719,  899,  899,  157,  899,  157,
			  708,  899,  157,  269,  899,  157,  157,  157,  157,  157,
			  269,  899,  157,  157,  157,  157,  157,  157,  706,  157,
			  707,  157,  719,  157,  711,  157,  157,  157,  708,  899,
			  163,  899,  157,  269,  708,  157,  157,  157,  157,  157,
			  712,  157,  899,  713,  899,  157,  899,  157,  709,  899,
			  899,  157,  711,  269,  157,  157,  157,  157,  157,  157,
			  157,  269,  710,  157,  157,  157,  157,  157,  712,  157,
			  157,  713,  899,  899,  157,  157,  157,  157,  713,  718,
			  157,  899,  712,  157,  716,  269,  899,  157,  157,  157,

			  157,  157,  728,  728,  728,  728,  728,  899,  157,  899,
			  899,  899,  157,  723,  157,  157,  715,  718,  157,  157,
			  714,  157,  716,  269,  716,  157,  157,  157,  157,  157,
			  269,  157,  157,  157,  157,  157,  157,  157,  899,  899,
			  718,  723,  157,  724,  722,  899,  719,  157,  157,  899,
			  899,  269,  717,  157,  157,  157,  157,  157,  269,  157,
			  157,  157,  157,  157,  157,  157,  899,  899,  720,  899,
			  157,  724,  722,  726,  721,  726,  157,  899,  727,  727,
			  727,  727,  727,  899,  899,  899,  722,  727,  727,  727,
			  727,  727,  600,  600,  600,  600,  600,  731,  731,  731,

			  731,  731,  732,  732,  732,  732,  732,  733,  733,  733,
			  733,  733,  899,  899,  725,  899,  899,  899,  899,  875,
			  899,  899,  729,  899,  899,  598,  899,  117,  117,  899,
			  875,  899,  117,  117,  736,  899,  899,  737,  117,  735,
			  875,  117,  117,  117,  117,  406,  117,  117,  117,  117,
			  729,  899,  117,  899,  117,  117,  117,  899,  875,  899,
			  117,  117,  736,  157,  899,  737,  117,  735,  117,  157,
			  751,  899,  117,  117,  117,  157,  899,  117,  117,  117,
			  899,  157,  117,  117,  117,  899,  899,  899,  117,  899,
			  117,  157,  899,  117,  899,  117,  117,  157,  751,  899, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  117,  117,  157,  117,  741,  899,  117,  739,  157,
			  899,  899,  899,  117,  117,  117,  117,  117,  117,  117,
			  117,  899,  899,  899,  117,  899,  117,  899,  117,  117,
			  742,  899,  117,  741,  899,  899,  739,  117,  743,  899,
			  117,  753,  117,  899,  157,  117,  117,  157,  899,  117,
			  157,  117,  899,  117,  117,  899,  899,  703,  742,  703,
			  703,  703,  703,  703,  157,  117,  743,  899,  157,  753,
			  157,  117,  157,  899,  157,  157,  899,  750,  157,  899,
			  899,  269,  117,  157,  157,  157,  157,  157,  899,  899,
			  899,  157,  157,  899,  899,  749,  157,  157,  157,  899,

			  899,  899,  157,  751,  269,  750,  157,  157,  157,  157,
			  157,  269,  899,  157,  157,  157,  157,  157,  269,  157,
			  157,  157,  157,  157,  157,  157,  753,  899,  899,  899,
			  269,  752,  157,  157,  157,  157,  157,  157,  899,  899,
			  899,  899,  269,  157,  157,  157,  157,  157,  157,  157,
			  157,  899,  899,  899,  754,  157,  157,  269,  755,  157,
			  157,  157,  157,  157,  269,  157,  157,  157,  157,  157,
			  157,  157,  899,  157,  157,  757,  759,  157,  157,  157,
			  157,  755,  157,  157,  157,  899,  755,  758,  157,  269,
			  899,  157,  157,  157,  157,  157,  727,  727,  727,  727,

			  727,  157,  157,  757,  759,  899,  757,  157,  157,  756,
			  157,  899,  899,  899,  899,  758,  157,  727,  727,  727,
			  727,  727,  761,  761,  761,  761,  761,  899,  899,  899,
			  762,  899,  762,  899,  760,  763,  763,  763,  763,  763,
			  765,  765,  765,  765,  765,  769,  769,  769,  769,  769,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  729,  899,  783,  899,  771,  117,  117,  899,  157,  774,
			  117,  772,  899,  117,  773,  899,  899,  899,  899,  117,
			  117,  117,  117,  406,  117,  899,  117,  117,  729,  117,
			  783,  776,  771,  117,  117,  899,  157,  774,  117,  772,

			  117,  117,  773,  899,  899,  117,  899,  117,  899,  899,
			  117,  117,  899,  899,  117,  117,  117,  899,  117,  776,
			  157,  117,  777,  157,  899,  786,  784,  899,  117,  157,
			  763,  763,  763,  763,  763,  117,  117,  117,  269,  899,
			  157,  157,  157,  157,  157,  117,  788,  899,  157,  117,
			  777,  157,  157,  786,  784,  899,  734,  157,  269,  784,
			  157,  157,  157,  157,  157,  899,  117,  269,  838,  157,
			  157,  157,  157,  157,  788,  786,  839,  157,  790,  157,
			  157,  791,  788,  157,  157,  157,  899,  785,  899,  839,
			  157,  899,  269,  899,  157,  157,  157,  157,  157,  899,

			  899,  899,  899,  787,  839,  157,  790,  157,  790,  791,
			  789,  157,  157,  157,  899,  899,  899,  899,  157,  793,
			  793,  793,  793,  793,  794,  794,  794,  794,  794,  605,
			  605,  605,  605,  605,  899,  899,  792,  795,  795,  795,
			  795,  795,  796,  796,  796,  796,  796,  797,  797,  797,
			  797,  797,  899,  899,  899,  899,  899,  598,  899,  899,
			  899,  899,  729,  899,  899,  899,  899,  117,  117,  899,
			  157,  799,  899,  117,  899,  899,  157,  899,  117,  801,
			  899,  117,  800,  117,  117,  406,  899,  117,  899,  117,
			  729,  899,  117,  899,  117,  117,  117,  899,  157,  799,

			  899,  117,  899,  117,  157,  157,  117,  801,  117,  157,
			  800,  157,  117,  117,  808,  157,  899,  117,  117,  117,
			  899,  899,  802,  117,  117,  899,  157,  899,  899,  899,
			  899,  117,  157,  157,  899,  899,  117,  157,  899,  157,
			  899,  809,  808,  157,  899,  899,  899,  899,  117,  157,
			  802,  811,  899,  117,  157,  157,  899,  899,  899,  269,
			  157,  157,  157,  157,  157,  157,  899,  899,  269,  809,
			  157,  157,  157,  157,  157,  157,  899,  157,  899,  811,
			  899,  157,  269,  157,  157,  157,  157,  157,  157,  809,
			  813,  269,  157,  157,  157,  157,  157,  157,  157,  811,

			  899,  899,  899,  157,  761,  761,  761,  761,  761,  157,
			  815,  815,  815,  815,  815,  899,  899,  810,  813,  899,
			  157,  899,  899,  766,  899,  766,  157,  812,  796,  796,
			  796,  796,  796,  797,  797,  797,  797,  797,  899,  117,
			  818,  899,  598,  899,  832,  832,  832,  832,  832,  899,
			  899,  899,  899,  117,  899,  117,  899,  899,  117,  899,
			  157,  768,  825,  899,  899,  117,  157,  117,  818,  117,
			  899,  899,  117,  899,  117,  899,  819,  899,  820,  117,
			  899,  117,  899,  117,  117,  117,  117,  821,  157,  157,
			  825,  899,  899,  117,  157,  157,  269,  117,  157,  157,

			  157,  157,  157,  117,  899,  819,  820,  157,  826,  899,
			  117,  899,  157,  157,  117,  899,  821,  157,  157,  899,
			  899,  828,  269,  157,  157,  157,  157,  157,  157,  899,
			  826,  830,  899,  899,  899,  157,  899,  826,  899,  899,
			  157,  157,  899,  899,  899,  899,  157,  117,  117,  828,
			  157,  828,  899,  117,  899,  899,  157,  899,  117,  827,
			  830,  835,  117,  117,  117,  899,  899,  117,  836,  117,
			  899,  899,  117,  899,  117,  117,  117,  899,  157,  829,
			  899,  117,  157,  899,  157,  899,  117,  899,  157,  835,
			  899,  899,  117,  117,  899,  899,  836,  840,  117,  899,

			  899,  899,  269,  117,  157,  157,  157,  157,  157,  269,
			  157,  157,  157,  157,  157,  157,  157,  157,  842,  842,
			  842,  842,  842,  157,  899,  840,  899,  899,  841,  768,
			  768,  768,  768,  768,  843,  843,  843,  843,  843,  117,
			  899,  899,  157,  157,  899,  157,  734,  899,  157,  157,
			  899,  157,  899,  117,  860,  117,  841,  844,  847,  117,
			  845,  849,  899,  157,  899,  850,  848,  117,  899,  157,
			  157,  157,  899,  117,  899,  117,  157,  157,  899,  848,
			  899,  899,  860,  899,  117,  899,  844,  117,  845,  899,
			  849,  157,  899,  850,  848,  899,  899,  157,  899,  899,

			  854,  899,  855,  856,  117,  843,  843,  843,  843,  843,
			  117,  117,  157,  861,  861,  861,  861,  861,  157,  899,
			  857,  899,  899,  899,  117,  117,  117,  117,  863,  863,
			  863,  863,  863,  866,  866,  866,  866,  866,  117,  117,
			  157,  899,  899,  899,  899,  157,  157,  870,  857,  899,
			  899,  157,  899,  899,  899,  117,  117,  899,  117,  867,
			  871,  871,  871,  871,  871,  872,  872,  872,  872,  872,
			  899,  899,  117,  157,  117,  870,  899,  899,  899,  157,
			  863,  863,  863,  863,  863,  864,  117,  867,  863,  863,
			  863,  863,  863,  854,  899,  855,  873,  899,  866,  866, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  866,  866,  866,  117,  157,  899,  899,  899,  899,  117,
			  157,  876,  876,  876,  876,  876,  880,  880,  880,  880,
			  880,  899,  899,  117,  899,  117,  853,  853,  853,  853,
			  853,  899,  157,  899,  899,  899,  899,  117,  157,  883,
			  883,  883,  883,  883,  854,  899,  855,  899,  899,  880,
			  880,  880,  880,  880,  117,  887,  887,  887,  887,  887,
			  888,  888,  888,  888,  888,  891,  891,  891,  891,  891,
			  879,  879,  879,  879,  879,  895,  895,  895,  895,  895,
			  896,  896,  896,  896,  896,  897,  897,  897,  897,  897,
			  892,  899,  892,  899,  899,  896,  896,  896,  896,  896,

			  898,  898,  898,  898,  898,  894,  894,  894,  894,  894,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  317,
			  317,  317,  317,  317,  317,  317,  317,  317,  894,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   98,   98,  899,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  899,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,  100,  100,  899,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  108,  748,  748,  748,  748,  748,
			  748,  748,  748,  748,  899,  899,  899,  899,  899,  899,
			  899,  899,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  117,  117,  117,  899,  899,  899,  899,  899,  899,
			  117,  117,  899,  117,  899,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  899,  899,  899,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  150,  150,  899,  150,
			  899,  150,  150,  899,  899,  899,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  899,  899,  899,  150,  150,

			  150,  150,  150,  150,  150,  150,  150,  152,  152,  899,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  211,  211,  899,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  899,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  231,  899,  231,  899,  899,
			  899,  899,  231,  899,  231,  231,  899,  899,  899,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  899,  899,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,

			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  245,  245,  899,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,

			  245,  103,  899,  899,  899,  103,  103,  899,  899,  899,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  899,
			  899,  899,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  108,  108,
			  108,  899,  899,  899,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  899,  899,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  271,  899,  899,  271,  271,

			  899,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,  899,  899,  899,  271,  271,  271,  271,  271,
			  271,  271,  271,  271,  157,  899,  157,  899,  157,  899,
			  899,  157,  157,  157,  157,  157,  899,  899,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  899,  899,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  899,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  226,  226,  226,  226,

			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  244,  244,  244,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  244,  412,
			  412,  899,  899,  899,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  899,  899,  899,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  413,  413,  899,  899,  899, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  899,
			  899,  899,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  317,  317,  317,  899,  899,  899,  317,  317,  317,
			  317,  317,  317,  317,  317,  317,  317,  899,  899,  317,
			  317,  317,  317,  317,  317,  317,  317,  317,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  521,  521,  521,  521,  521,
			  521,  521,  521,  521,  899,  899,  899,  521,  521,  521,

			  521,  521,  521,  521,  521,  521,  554,  899,  554,  899,
			  899,  899,  899,  554,  899,  554,  554,  899,  899,  899,
			  554,  554,  554,  554,  554,  554,  554,  554,  554,  899,
			  899,  899,  554,  554,  554,  554,  554,  554,  554,  554,
			  554,  458,  458,  458,  899,  899,  458,  458,  458,  458,
			  458,  458,  458,  458,  899,  899,  458,  458,  458,  458,
			  458,  458,  458,  458,  458,  899,  899,  899,  458,  458,
			  458,  458,  458,  458,  458,  458,  458,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  899,  899,  899,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  608,  608,

			  899,  899,  899,  608,  608,  608,  608,  608,  608,  608,
			  608,  608,  899,  899,  899,  608,  608,  608,  608,  608,
			  608,  608,  608,  608,  634,  899,  634,  899,  899,  899,
			  899,  634,  899,  634,  634,  899,  899,  899,  634,  634,
			  634,  634,  634,  634,  634,  634,  634,  899,  899,  634,
			  634,  634,  634,  634,  634,  634,  634,  634,  634,  682,
			  682,  899,  899,  899,  682,  682,  682,  682,  682,  682,
			  682,  682,  682,  899,  899,  899,  682,  682,  682,  682,
			  682,  682,  682,  682,  682,  770,  770,  770,  770,  770,
			  770,  770,  770,  770,  899,  899,  899,  770,  770,  770,

			  770,  770,  770,  770,  770,  770,  748,  899,  899,  899,
			  748,  748,  899,  899,  899,  748,  748,  748,  748,  748,
			  748,  748,  748,  748,  899,  899,  899,  748,  748,  748,
			  748,  748,  748,  748,  748,  748,  798,  798,  899,  899,
			  899,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  899,  899,  899,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  833,  833,  899,  899,  899,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  899,  899,  899,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,   11,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899, yy_Dummy>>,
			1, 480, 7000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7479)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    5,    9,    6,    3,    4,   10,   18,

			   13,    4,   13,   13,   25,   92,   25,   25,   25,   25,
			   25,  108,   27,   76,   27,  317,   27,   27,   27,   27,
			   27,   38,   38,   63,   38,  875,  322,  142,    5,    5,
			    6,    6,   28,   64,   28,   63,   28,   28,   28,   28,
			   28,  322,    3,   18,   38,   64,  108,    4,  874,    9,
			  317,   63,  865,   10,   27,   74,  142,   74,   74,   76,
			   92,   64,   95,   63,   95,   95,  109,  109,  109,  109,
			  109,  855,  235,   64,   28,  235,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,   35,   35,   68,
			   35,   36,   36,  238,   36,  847,   78,   37,   37,  143,
			   37,   68,   77,   40,   40,  846,   40,  817,   39,   39,

			   35,   39,   41,   41,   36,   41,  806,   68,  380,   35,
			   37,   79,   36,   35,   37,   35,   40,  143,  374,   68,
			   40,   39,  323,   37,  213,   41,  213,  213,  323,   80,
			   42,   42,   40,   42,   39,   69,   41,   35,  238,  413,
			   36,   35,   37,   35,  380,   39,  413,   69,   40,   43,
			   43,   37,   43,   42,   44,   44,   69,   44,   45,   45,
			   40,   45,   39,   69,   41,   78,  794,   42,   42,   77,
			   77,   77,   43,   42,   39,   69,   43,   44,  761,   50,
			   50,   45,   50,   49,   49,   69,   49,   45,   79,   79,
			   79,   47,   47,   44,   47,   42,   42,  374,  749,   82,

			   45,   42,   50,   81,   43,   84,   49,   80,   80,  237,
			   87,  402,  237,   87,   47,   45,  154,   48,   48,  154,
			   48,   44,   49,  748,  154,   47,  402,   50,   45,   46,
			   46,  701,   46,   47,   82,   82,  386,  386,  151,  386,
			   48,   84,   84,  803,   46,   46,   46,   46,   46,   46,
			   49,   61,   46,   47,  217,   48,   50,  700,   61,   46,
			   48,   47,   87,   61,   56,   56,   46,   85,  699,   56,
			  557,   56,  519,   46,  151,   46,  698,   46,  221,   61,
			   81,   81,   81,   48,  803,  557,   61,   46,   48,  151,
			   56,   61,   56,   56,   46,  116,  116,   56,  116,   56,

			  798,  798,   85,   85,   46,   56,   46,   55,   89,  218,
			   55,   89,  519,  221,  221,   55,  387,  387,  116,  387,
			   89,   89,   55,   55,   55,   55,   55,   55,   55,  682,
			   89,  217,  217,  217,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,  814,  814,
			   89,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   57,  218,  218,  218,   58,
			   57,  833,  833,   58,   57,   58,   57,  112,  112,  112,

			  112,  112,  253,  253,   90,  253,  165,   90,  165,  165,
			  165,  165,  165,   57,   58,   57,   90,   58,   57,  678,
			  672,   58,   57,   58,   57,  253,   90,   59,  641,   58,
			   57,   59,  539,   59,  625,   60,  165,  219,   62,  539,
			   60,  625,   59,  182,   60,  626,   60,   60,   62,   62,
			   62,  182,   59,  608,   62,   59,   90,  182,   65,   59,
			   65,   59,  848,   60,  165,   60,   62,   59,   60,  848,
			   65,   59,   60,   65,   60,   60,   62,   62,   62,  182,
			   60,   67,   62,  178,   66,  182,   65,  224,   65,  178,
			  178,   66,   67,   67,  600,  593,   66,   67,   65,   66,

			  113,   65,  113,  531,  113,  113,  113,  113,  113,   67,
			  515,  178,   66,  220,  219,  219,  219,  178,  178,   66,
			   67,   67,  224,  224,   66,   67,  508,   66,   93,   93,
			  457,   93,  634,  183,  102,  183,  183,  183,  183,  183,
			  183,  415,  113,  102,  102,  102,  102,  102,  254,  230,
			  254,  254,  230,   93,  412,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,  102,  106,
			  106,  106,  106,  106,  634,  110,  110,  110,  110,  110,
			  220,  220,  220,  102,  106,  243,  243,  102,  243,  102,

			  110,  230,  388,  454,  376,  111,  454,  111,   93,  111,
			  111,  111,  111,  111,  111,  383,  805,  106,  117,  117,
			  243,  117,  106,  119,  119,  382,  119,  805,  110,  318,
			  373,  117,  117,  313,  185,  552,  119,  119,  552,  117,
			  185,  117,  120,  120,  119,  120,  119,  111,  166,  300,
			  166,  166,  166,  166,  166,  120,  120,  805,  121,  121,
			  271,  121,  185,  120,  225,  120,  270,  119,  185,  260,
			  166,  121,  121,  122,  122,  259,  122,  252,  120,  121,
			  251,  121,  376,  376,  250,  194,  122,  122,  121,  123,
			  123,  194,  123,  249,  122,  119,  122,  247,  166,  242,

			  225,  225,  123,  123,  233,  122,  120,  373,  373,  373,
			  123,  228,  123,  194,  124,  124,  121,  124,  169,  194,
			  169,  169,  169,  169,  169,  145,  226,  124,  124,  125,
			  125,  123,  125,  122,  223,  124,  169,  124,  389,  389,
			  145,  389,  125,  125,  126,  126,  211,  126,  127,  127,
			  125,  127,  125,  124,  145,  145,  145,  126,  126,  123,
			  162,  127,  127,  389,  169,  126,  398,  126,  145,  127,
			  158,  127,  125,  126,  128,  128,  155,  128,  227,  126,
			  152,  124,  150,  145,  127,  145,  137,  128,  128,  398,
			  129,  129,  105,  129,  398,  128,  553,  128,  104,  553, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  125,  126,  103,  129,  129,  130,  130,  126,  130,  100,
			   98,  129,  127,  129,  227,  227,  128,   96,  130,  130,
			  131,  131,  556,  131,   88,  556,  130,   73,  130,  265,
			  265,  265,  265,  131,  131,   70,   54,  132,  132,  638,
			  132,  131,  638,  131,  128,  130,  556,  638,  553,  131,
			  132,  132,  283,  133,  133,   51,  133,  283,  132,  167,
			  132,  167,  167,  167,  167,  167,  133,  133,  283,  134,
			  134,   33,  134,  130,  133,  167,  133,  131,  283,  163,
			  163,   31,  134,  134,  375,  135,  135,  163,  135,   26,
			  134,  132,  134,  163,   24,   16,  283,  133,  135,  135,

			  147,  554,   15,  167,  554,  163,  135,   14,  135,  136,
			  136,   11,  136,  134,  135,  147,  147,  604,  604,  604,
			  604,  163,  136,  136,  231,  133,    0,  231,  377,  147,
			  136,  147,  136,  163,  139,  139,  231,  139,    0,  136,
			    0,  134,  135,  147,  147,    0,  231,  139,  139,  139,
			  378,  140,  140,  554,  140,  139,  637,  139,  617,  637,
			  147,  375,  375,  375,  140,  140,  140,  136,  138,  138,
			  138,  138,  140,  426,  140,  617,  231,  138,  139,  617,
			  637,  140,    0,    0,  426,  184,  138,  676,    0,    0,
			  138,  184,    0,  138,  426,  140,  184,  140,    0,    0,

			  138,  144,  138,  617,  138,  377,  377,  377,    0,  140,
			  676,    0,  426,  184,  138,  676,  144,  144,  138,  184,
			  144,  138,    0,    0,  184,    0,  140,  378,  378,  378,
			  144,  138,  144,  138,  141,  141,  141,  141,  141,  141,
			  146,    0,    0,  148,  144,  144,    0,    0,  144,  141,
			    0,  195,  195,  141,    0,  146,  141,  195,  148,    0,
			  146,  144,  141,  141,  146,  141,    0,  190,    0,  146,
			  148,  146,  148,  190,  148,    0,  149,  141,    0,  195,
			  195,  141,  190,  146,  141,  195,  148,    0,  146,    0,
			  141,  149,  146,    0,  141,  190,  688,    0,  148,  274,

			  146,  190,    0,  148,    0,  149,    0,  149,  157,  149,
			  190,  157,  159,  688,  274,  159,  157,  688,    0,  149,
			  159,  157,  157,  157,    0,  159,  159,  159,  274,  157,
			  274,  160,    0,  159,  160,    0,  149,    0,  149,  160,
			  161,  688,  274,  161,  160,  160,  160,    0,  161,  216,
			    0,  179,  160,  161,  161,  161,  159,  179,  157,  274,
			    0,  161,  159,    0,  179,    0,  694,  160,  164,  164,
			  161,  164,  164,  164,  164,  164,  164,    0,    0,  179,
			  186,  160,  164,  694,  159,  179,  186,  694,  168,    0,
			  161,  168,  179,    0,  164,  160,  168,    0,  161,    0,

			    0,  168,  168,  168,  170,  186,    0,  170,  186,  168,
			  164,  694,  170,  171,  186,    0,  171,  170,  170,  170,
			  168,  171,  164,    0,    0,  170,  171,  171,  171,  216,
			  216,  216,  216,  216,  171,    0,    0,  172,  168,  172,
			  172,  172,  172,  172,    0,    0,  170,  518,  168,  518,
			  173,  173,  171,  192,  170,    0,  345,  518,  173,  192,
			    0,    0,  345,  171,  173,  172,    0,  345,  192,  174,
			    0,    0,  174,    0,  170,    0,  173,  174,  345,    0,
			  171,  192,  174,  174,  174,  518,  175,  192,  345,  175,
			  174,    0,  173,  172,  175,    0,  192,    0,    0,  175,

			  175,  175,    0,    0,  173,    0,  345,  175,  730,  730,
			  730,  198,  174,  198,  321,  175,    0,  198,    0,  174,
			  321,  175,  176,    0,  176,  176,  176,  176,  176,  177,
			    0,  177,  177,  177,  177,  177,  175,    0,    0,  198,
			  174,  198,  321,  175,  177,  198,    0,  348,  321,  175,
			  177,  176,  180,  348,  180,  180,  180,  180,  180,  181,
			    0,  181,  181,  181,  181,  181,  248,  248,  248,  248,
			  248,  248,  177,    0,  180,  348,  379,    0,  177,  176,
			  187,  348,  187,  187,  187,  187,  187,  181,  188,    0,
			  188,  188,  188,  188,  188,  189,    0,  189,  189,  189,

			  189,  189,  180,  188,    0,    0,  187,  191,    0,  191,
			  191,  191,  191,  191,  193,  181,  193,  193,  193,  193,
			  193,  196,  199,  196,  196,  196,  196,  196,  199,  782,
			  782,  188,  782,    0,  187,  189,  196,  191,  199,    0,
			    0,  740,    0,  197,  193,  197,  197,  197,  197,  197,
			  199,  202,  782,  379,  379,  379,  199,  202,  740,  197,
			    0,  202,  740,  336,  196,  191,  199,    0,    0,  336,
			  336,  200,  193,  200,  200,  200,  200,  200,  201,  202,
			  201,  201,  201,  201,  201,  202,  740,  197,  200,  202,
			  203,  336,  203,  204,  204,    0,  203,  336,  336,    0,

			  205,  204,  205,  205,  205,  205,  205,  204,  206,  201,
			  234,    0,    0,  234,  206,  204,  200,  205,  203,  204,
			  203,  206,  234,  207,  203,  207,  207,  207,  207,  207,
			    0,    0,  234,  208,    0,  204,  206,  201,    0,  208,
			    0,    0,  206,  204,    0,  205,    0,  204,    0,  206,
			    0,  207,  208,  209,  351,  209,  209,  209,  209,  209,
			  351,  208,  234,  852,  852,  852,  852,  208,  256,  256,
			  256,  256,  256,  258,  258,  258,  258,  258,    0,  207,
			    0,  208,  351,  256,  257,    0,  257,  209,  351,  257,
			  257,  257,  257,  257,  261,  261,  261,  261,  261,  266,

			  266,  266,  266,  266,    0,    0,  256,  878,  878,  878,
			  878,  256,    0,    0,    0,    0,  209,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,

			  236,  236,  236,  236,  236,  236,  236,  236,  239,  239,
			  263,  239,  263,    0,    0,  263,  263,  263,  263,  263,
			    0,  264,    0,  264,    0,  264,  264,  264,  264,  264,
			    0,    0,    0,  239,    0,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  262,  262,
			  262,  262,  262,  264,  272,    0,    0,    0,  273,    0,
			    0,  276,    0,  262,  275,  278,    0,    0,    0,  272,
			  272,    0,    0,  273,    0,    0,  276,    0,  239,  275,
			  278,  278,  273,  272,  277,  272,  262,  273,  275,  273, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  276,  262,  276,  275,  278,  275,  278,  272,  272,  277,
			    0,  273,  279,    0,  276,  288,    0,  275,  278,  278,
			  273,    0,  277,  277,  272,  277,  275,  279,  273,    0,
			  288,  276,  822,  279,  275,  278,  280,  277,  546,    0,
			  822,  279,  281,  279,  288,  282,  288,    0,    0,  546,
			  277,  280,    0,  822,  277,  279,    0,  281,  288,  546,
			  282,  279,    0,    0,  280,  280,  284,  280,  822,    0,
			  281,  281,  279,  281,  282,  288,  282,  546,    0,  280,
			  551,  284,  881,    0,  282,  281,    0,  284,  282,  285,
			  882,  551,  280,  286,    0,  284,  280,  284,  281,  881,

			    0,  551,  281,  881,  285,  282,  320,  882,  286,  284,
			  285,  882,  320,  286,  287,  284,  320,    0,  285,  551,
			  285,    0,  286,    0,  286,    0,  284,  881,  287,  287,
			  885,  353,  285,  289,  320,  882,  286,  353,  285,  290,
			  320,  286,    0,  287,  320,  287,    0,  885,  289,  285,
			  631,  885,    0,  286,  290,  290,  287,  287,    0,  353,
			    0,  631,  289,  289,  289,  353,    0,    0,  290,    0,
			  290,  631,    0,    0,  287,  885,  289,  292,  292,  292,
			  292,  292,  290,  290,  293,  293,  293,  293,  293,  631,
			    0,  289,    0,  289,  299,  299,  299,  299,  299,  290,

			  294,  294,  294,  294,  294,  294,  295,  295,  295,  295,
			  295,  295,    0,    0,    0,  294,  302,  302,  302,  302,
			  302,  295,  324,    0,  324,  324,  324,  324,  324,  294,
			    0,  294,    0,    0,  302,  295,  328,  295,  328,  328,
			  328,  328,  328,  294,  399,  399,  399,  399,  399,  295,
			  296,  296,  296,  296,  296,  296,  732,  732,  732,  732,
			  294,    0,  302,    0,    0,  296,  295,    0,  297,  297,
			  297,  297,  297,  297,    0,    0,    0,  303,    0,  296,
			    0,  296,  301,  297,  301,  301,  298,  298,  298,  298,
			  298,  298,  303,  296,  732,    0,    0,  297,    0,  297,

			    0,  298,    0,    0,  301,  303,  303,  301,  303,  304,
			  296,  297,    0,  301,    0,  298,  305,  298,    0,  306,
			  303,    0,    0,    0,  304,  306,    0,  307,  297,  298,
			    0,  305,  301,  303,  306,  301,    0,  303,  304,  305,
			  304,  301,  307,  307,    0,  305,  298,  305,  306,  308,
			  306,    0,  304,  842,    0,  842,  307,  309,  307,  305,
			    0,  632,  306,  842,  308,    0,    0,  305,  310,  304,
			  307,  307,  309,    0,  632,  308,  305,    0,  308,  306,
			  308,    0,    0,  310,  309,  632,  309,  307,  309,  311,
			  312,  842,  308,  823,    0,  632,  319,  310,  319,  310,

			  309,  823,  319,  308,  311,  312,    0,  310,    0,  308,
			    0,  310,  309,  632,  823,    0,    0,  309,  311,  312,
			  311,  312,    0,  312,  319,    0,  319,    0,  310,  823,
			  319,    0,  311,  312,  314,    0,  314,  314,  314,  314,
			  314,  314,  354,    0,  354,  354,  354,  354,  354,  311,
			  312,  315,  312,  315,  315,  315,  315,  315,  315,  325,
			    0,  325,  325,  325,  325,  325,  326,    0,  326,  326,
			  326,  326,  326,    0,  325,    0,  329,  327,  327,    0,
			  325,    0,  329,  326,  364,  327,  329,  330,  330,    0,
			  364,  327,  331,  331,  335,  330,  335,  364,  331,    0,

			  335,  330,  325,  327,  329,    0,  858,    0,  325,  332,
			  329,  326,  364,  330,  329,  332,    0,  858,  364,  327,
			  331,  331,  335,  332,  335,  364,  331,  858,  335,  330,
			  333,  327,  333,  333,  333,  333,  333,  332,    0,    0,
			    0,  330,    0,  332,    0,  858,  333,    0,    0,    0,
			  334,  332,  334,  334,  334,  334,  334,  337,  401,  401,
			  401,  401,  401,  337,  338,    0,  338,  338,  338,  338,
			  338,  337,    0,    0,  333,    0,  342,  369,    0,  334,
			    0,  338,  342,  369,  339,  337,  339,  339,  339,  339,
			  339,  337,  340,    0,  340,  340,  340,  340,  340,  337,

			    0,  342,  341,    0,  342,  369,  339,  334,  341,  338,
			  342,  369,  886,    0,    0,    0,  341,    0,    0,    0,
			    0,  340,  343,    0,  343,  343,  343,  343,  343,  886,
			  341,    0,    0,  886,  339,  344,  341,  344,  344,  344,
			  344,  344,    0,    0,  341,    0,  346,    0,  347,  340,
			    0,  343,  346,  346,  347,  347,  349,  886,  349,  349,
			  349,  349,  349,  350,    0,  350,  350,  350,  350,  350,
			  888,  888,  888,  888,  346,  344,  347,    0,  349,  343,
			  346,  346,  347,  347,  352,  350,  352,  352,  352,  352,
			  352,  355,  356,    0,  356,    0,    0,  355,  356,  352,

			  392,  392,  392,  392,  392,  392,  349,  355,  888,    0,
			    0,    0,  357,  350,  357,  357,  357,  357,  357,  355,
			  356,    0,  356,    0,    0,  355,  356,  352,  358,    0,
			  358,  358,  358,  358,  358,  355,    0,    0,  359,    0,
			  360,    0,  360,  357,  359,  358,  360,  359,    0,    0,
			    0,    0,  361,    0,  361,  361,  361,  361,  361,  468,
			    0,  365,    0,    0,    0,  468,  359,  365,  360,    0,
			  360,  357,  359,  358,  360,  359,  361,  362,  363,  362,
			  362,  362,  362,  362,  363,  472,  365,  468,    0,  365,
			  363,  472,    0,  468,  362,  365,  366,  371,  366,  366,

			  366,  366,  366,  371,  361,  367,  363,  367,  367,  367,
			  367,  367,  363,  472,    0,    0,  371,    0,  363,  472,
			    0,    0,  362,  366,  368,  371,  368,  368,  368,  368,
			  368,  371,  370,  367,  370,  370,  370,  370,  370,    0,
			  384,  384,    0,  384,  372,  371,  372,  372,  372,  372,
			  372,  366,  384,  400,  400,  400,  400,  400,    0,    0,
			    0,  367,  384,    0,  368,  403,  403,  403,  403,  403,
			  404,  404,  404,  404,  404,  405,    0,  405,  372,    0,
			  405,  405,  405,  405,  405,  404,  406,  406,  406,  406,
			  406,  400,  384,  407,  407,  407,  407,  407,  408,  408,

			  408,  408,  408,    0,    0,    0,    0,  372,  404,    0,
			    0,  409,  409,  404,  409,  409,  409,  409,  409,  410,
			  410,  410,  410,  410,  411,  411,  411,  411,  411,  416,
			  417,    0,    0,    0,  419,    0,  408,  418,  421,  440,
			  440,  440,  440,  440,  416,  417,    0,    0,    0,  419,
			    0,    0,  418,  421,  419,    0,  416,    0,  416,  417,
			  416,  417,    0,  419,  418,  419,  418,  421,  418,  421,
			  420,  440,  416,  417,    0,    0,  422,  419,    0,    0,
			  418,  421,  419,    0,  416,  420,  420,  473,    0,  416,
			  417,  422,  418,  473,  419,  423,  424,  418,  421,  420, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  440,  420,    0,  473,    0,  422,  422,  422,    0,    0,
			  423,  424,  424,  420,  420,  473,    0,  425,  429,  422,
			    0,  473,  427,    0,  423,  424,  423,  424,    0,  425,
			  420,  473,  425,  429,  422,    0,  422,  427,  423,  424,
			  424,  429,  427,  428,    0,    0,  425,  429,  425,  429,
			    0,  427,  423,  427,    0,  423,  424,  425,  428,  744,
			  425,  429,    0,  744,  430,  427,    0,    0,    0,  429,
			  427,    0,  428,  428,  428,  431,    0,  425,  429,  430,
			  744,    0,  427,  430,    0,  432,  428,  859,    0,    0,
			  431,  744,    0,  430,    0,  430,    0,  479,  859,  479,

			  432,  428,  431,  428,  431,  479,  431,  430,  859,    0,
			    0,  430,  432,    0,  432,  436,  432,    0,  431,  433,
			  433,  433,  433,  433,  430,  479,  859,  479,  432,  872,
			  431,  872,    0,  479,  436,  431,    0,  436,  481,  872,
			  432,    0,    0,  436,  481,  432,  433,  434,    0,  434,
			  434,  434,  434,  434,  434,    0,  435,  435,  435,  435,
			  435,    0,  436,    0,    0,  436,  481,  872,  448,    0,
			  435,  436,  481,  448,  433,    0,  434,  435,  437,  437,
			  437,  437,  437,    0,  448,    0,  435,  446,  435,  438,
			  438,  438,  438,  438,  448,    0,  437,    0,  435,    0,

			    0,    0,  446,  438,  434,  435,  439,  439,  439,  439,
			  439,  439,  448,    0,    0,  435,  446,  435,  446,  438,
			    0,  439,    0,    0,  437,  442,  442,  442,  442,  442,
			  446,  438,    0,    0,    0,  439,    0,  439,  443,  443,
			  443,  443,  443,    0,    0,    0,    0,  446,  438,  439,
			  444,  444,  444,  444,  444,  444,  445,  445,  445,  445,
			  445,  445,  492,  447,    0,  444,  439,  459,  492,  449,
			    0,  445,    0,  459,  450,    0,    0,    0,  447,  444,
			  459,  444,  451,    0,  449,  445,    0,  445,    0,  450,
			  492,    0,  447,  444,  447,  459,  492,  451,  449,  445,

			  449,  459,    0,  450,  450,  450,  447,  452,  459,  460,
			  444,  451,  449,  451,    0,  460,  445,  450,  453,  452,
			  453,    0,  452,  447,  745,  451,  460,  746,  745,  449,
			  452,  746,  450,    0,  450,  453,  452,  460,  452,    0,
			    0,    0,  451,  460,    0,  745,    0,  452,  746,  453,
			  452,  453,    0,    0,    0,  460,  745,    0,  452,  746,
			    0,    0,    0,  453,    0,    0,  455,  452,  455,  455,
			  455,  455,  455,  455,  504,  504,  504,  504,  504,  456,
			  453,  456,  456,  456,  456,  456,  456,  461,    0,  461,
			  461,  461,  461,  461,  462,    0,  462,  462,  462,  462,

			  462,    0,    0,  463,  455,  463,  463,  463,  463,  463,
			  463,    0,  504,    0,    0,    0,  464,  456,  464,  464,
			  464,  464,  464,  465,  466,  465,  465,  465,  465,  465,
			  466,  505,  505,  505,  505,  505,  467,  466,  467,  467,
			  467,  467,  467,  469,  464,  469,  837,    0,    0,  469,
			    0,    0,  466,    0,  837,  465,    0,  470,  466,  470,
			  470,  470,  470,  470,  467,  466,    0,  837,    0,    0,
			  483,  469,  464,  469,    0,  474,  483,  469,  470,  483,
			    0,  474,  837,  471,  465,  471,  471,  471,  471,  471,
			  474,  475,  467,  475,  475,  475,  475,  475,  483,  478,

			  471,  478,    0,  474,  483,  478,  470,  483,  476,  474,
			  476,  476,  476,  476,  476,    0,    0,  477,  474,  477,
			  477,  477,  477,  477,  482,    0,    0,  478,  471,  478,
			  482,    0,  480,  478,  480,  480,  480,  480,  480,  476,
			  482,  506,  506,  506,  506,  506,    0,  477,    0,  480,
			    0,  484,  482,  484,  484,  484,  484,  484,  482,  485,
			    0,  485,  485,  485,  485,  485,    0,  476,  482,    0,
			  488,    0,  484,  486,    0,  477,  488,  480,  486,  486,
			    0,    0,  487,  488,  487,  487,  487,  487,  487,  490,
			  485,  490,  490,  490,  490,  490,    0,  489,  488,  493,

			  484,  486,  487,  489,  488,  493,  486,  486,    0,    0,
			  489,  488,  510,  510,  510,  510,  510,  490,  485,  512,
			  512,  512,  512,  512,    0,  489,    0,  493,    0,    0,
			  487,  489,    0,  493,    0,    0,    0,  491,  489,  491,
			  491,  491,  491,  491,  494,  490,  494,  494,  494,  494,
			  494,  495,  496,  495,  495,  495,  495,  495,  496,    0,
			  497,  497,  498,    0,  498,  491,  497,    0,  496,    0,
			  498,    0,  499,  498,  499,  499,  499,  499,  499,  500,
			  496,  500,  500,  500,  500,  500,  496,    0,  497,  497,
			  498,  501,  498,  491,  497,  500,  496,    0,  498,    0,

			  747,  498,    0,  499,  747,  502,  502,  501,  502,  502,
			  502,  502,  502,  501,  507,    0,  507,  507,  507,  507,
			  507,  747,    0,  500,  509,  509,  509,  509,  509,    0,
			    0,  499,  747,    0,    0,  501,    0,    0,    0,  509,
			    0,  501,  511,  511,  511,  511,  511,  513,  513,  513,
			  513,  513,  514,  514,  514,  514,  514,  516,  516,  516,
			  516,  516,  509,  522,  523,    0,  517,  509,  517,  517,
			  517,  517,  517,  524,    0,    0,    0,    0,  522,  523,
			  511,  558,    0,  526,    0,  513,    0,  558,  524,  524,
			    0,    0,  522,  523,  522,  523,  525,  633,  526,    0,

			    0,    0,  524,  523,  524,  527,  522,  523,    0,  558,
			  633,  525,  526,    0,  526,  558,  524,  524,    0,  525,
			  527,  633,    0,  522,  523,  525,  526,  525,    0,  528,
			    0,  633,    0,  524,  527,  529,  527,    0,  530,  525,
			    0,    0,    0,  526,  528,  528,  573,  525,  527,  633,
			  529,    0,  573,  530,    0,    0,  525,  528,  528,  530,
			  528,  532,    0,    0,  529,  527,  529,  530,  533,  530,
			    0,  534,  528,  528,  573,    0,  532,  532,  529,    0,
			  573,  530,    0,  533,    0,  528,  534,  530,    0,  528,
			  532,  535,  532,    0,    0,  529,    0,  533,  530,  533,

			  534,  537,  534,    0,  532,  532,  535,  535,    0,  536,
			    0,  533,    0,    0,  534,    0,  537,  537,    0,    0,
			  535,  532,  535,    0,  536,    0,    0,    0,  533,  838,
			  537,  534,  537,    0,  535,  535,  536,  838,  536,    0,
			  536,    0,    0,    0,  537,  537,    0,  541,    0,    0,
			  838,  535,  536,  540,  540,  540,  540,  540,  540,    0,
			    0,  537,  541,    0,  536,  838,    0,    0,  540,  536,
			  542,  542,  542,  542,  542,    0,  541,    0,  541,    0,
			    0,    0,  540,    0,  540,    0,    0,  544,    0,  544,
			  541,  544,  544,  544,  544,  544,  540,  542,  543,  547, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  543,  543,  543,  543,  543,  543,    0,  541,    0,  544,
			    0,  559,  544,  540,  547,  547,    0,  559,  544,  548,
			  545,  545,  545,  545,  545,  542,    0,  543,  547,  549,
			  547,    0,    0,    0,  548,  548,  559,  544,    0,  559,
			  544,  545,  547,  547,  549,  559,  544,  574,  548,  550,
			  548,    0,    0,  574,  574,  543,  549,    0,  549,  547,
			  549,    0,  548,  548,  550,    0,  778,  779,    0,  545,
			  778,  779,  549,  550,    0,  574,    0,    0,  550,  548,
			  550,  574,  574,    0,  549,    0,  780,  778,  779,  549,
			  780,  560,  550,  560,  560,  560,  560,  560,  778,  779,

			  561,  550,  561,  561,  561,  561,  561,  780,  562,  550,
			  562,  562,  562,  562,  562,  563,    0,  563,  780,    0,
			  564,  563,  564,  564,  564,  564,  564,  565,    0,  560,
			    0,    0,    0,  565,  566,  566,  565,  564,    0,    0,
			  566,    0,    0,  563,    0,  563,  569,  569,  562,  563,
			    0,    0,  569,    0,  567,  565,  567,  567,  567,  567,
			  567,  565,  566,  566,  565,  564,    0,  568,  566,  568,
			  568,  568,  568,  568,  569,  569,    0,    0,  567,  570,
			  569,  570,    0,  568,  571,  570,  571,  571,  571,  571,
			  571,    0,  575,  570,  575,  575,  575,  575,  575,  578,

			  571,    0,  576,    0,  576,  578,  567,  570,  576,  570,
			    0,  568,  572,  570,  572,  572,  572,  572,  572,  577,
			  577,  570,    0,    0,    0,  577,    0,  578,  571,  572,
			  576,  781,  576,  578,    0,  781,  576,  581,    0,  581,
			    0,  572,    0,  581,    0,    0,    0,  577,  577,    0,
			    0,    0,  781,  577,    0,    0,  579,  572,  579,  579,
			  579,  579,  579,  781,  584,  581,  584,  581,    0,  572,
			  584,  581,  580,  579,  580,  580,  580,  580,  580,  582,
			  583,  582,  582,  582,  582,  582,  583,    0,  580,  587,
			    0,  587,  584,  583,  584,  587,  582,    0,  584,    0,

			  585,  579,  585,  585,  585,  585,  585,  588,  583,  588,
			    0,    0,  589,  588,  583,    0,  580,  587,  589,  587,
			  642,  583,    0,  587,  582,  589,  642,  586,  585,  586,
			  586,  586,  586,  586,    0,  588,  645,  588,    0,  590,
			  589,  588,  645,    0,  586,  590,  589,    0,  642,  590,
			    0,    0,    0,  589,  642,    0,  585,  591,    0,  591,
			  591,  591,  591,  591,  645,    0,    0,  590,    0,    0,
			  645,    0,  586,  590,  591,    0,  592,  590,  592,  592,
			  592,  592,  592,  594,  594,  594,  594,  594,    0,    0,
			    0,    0,  595,  592,  595,  595,  595,  595,  595,    0,

			    0,    0,  591,  596,  596,  596,  596,  596,    0,  597,
			  597,  597,  597,  597,    0,    0,    0,    0,  596,    0,
			    0,  592,  598,  598,  598,  598,  598,    0,    0,    0,
			  595,  599,  599,  599,  599,  599,  601,  601,  601,  601,
			  601,  602,  602,  602,  602,  602,  596,  597,  603,  603,
			  603,  603,  603,  606,  606,  606,  606,  606,  609,  610,
			    0,    0,  612,  611,    0,  868,  613,    0,  606,    0,
			  609,    0,    0,  609,  610,  611,  868,  612,  611,    0,
			    0,  613,  613,    0,  614,  615,  868,  609,  610,  609,
			  610,  612,  611,  612,  611,  613,  606,  613,  609,  614,

			  615,  609,  610,  611,  868,  612,  611,  614,    0,  613,
			  613,    0,    0,  614,  615,  614,  615,  616,  609,  610,
			    0,    0,  612,  611,  618,  619,  613,  614,  615,    0,
			    0,    0,  616,    0,    0,  614,  650,    0,  616,  618,
			  619,  619,  650,  620,  614,  615,  616,  621,  616,    0,
			  622,    0,  618,  618,  619,  618,  619,    0,  620,    0,
			  616,    0,  621,  621,  650,  622,  616,  618,  619,  619,
			  650,  620,  620,  627,  620,    0,  621,  616,  621,  622,
			  618,  622,    0,    0,  618,  619,  620,    0,  627,    0,
			  621,  621,    0,  622,  623,  623,  623,  623,  623,  620,

			    0,    0,  627,  620,  627,  628,    0,  621,  629,    0,
			  622,    0,  623,  630,    0,  623,  627,  640,    0,  640,
			  628,    0,  629,  629,  648,  640,  648,  644,  630,  644,
			  648,    0,  628,  627,  628,  644,  628,  629,    0,  629,
			  623,    0,  630,  623,  630,  640,    0,  640,  628,    0,
			  629,  629,  648,  640,  648,  644,  630,  644,  648,    0,
			  628,    0,    0,  644,    0,  628,    0,    0,  629,    0,
			    0,    0,  639,  630,  639,  639,  639,  639,  639,  643,
			    0,  643,  643,  643,  643,  643,  646,  646,  671,  671,
			  671,  671,  671,  647,  646,  647,  647,  647,  647,  647,

			  646,  649,    0,  662,  662,    0,    0,  649,    0,  662,
			  649,    0,  646,  651,    0,  651,  651,  651,  651,  651,
			  652,    0,  652,  652,  652,  652,  652,  654,  646,  649,
			  651,  662,  662,  654,  654,  649,  655,  662,  649,    0,
			  646,    0,  655,  653,  652,  653,  653,  653,  653,  653,
			  655,  656,    0,  656,    0,  654,    0,  656,  651,    0,
			    0,  654,  654,  657,  655,  657,  657,  657,  657,  657,
			  655,  658,  652,  658,  658,  658,  658,  658,  655,  656,
			  659,  656,    0,    0,  665,  656,  659,  661,  658,  661,
			  665,    0,  657,  661,  659,  660,    0,  660,  660,  660,

			  660,  660,  675,  675,  675,  675,  675,    0,  659,    0,
			    0,    0,  665,  667,  659,  661,  658,  661,  665,  667,
			  657,  661,  659,  663,  660,  663,  663,  663,  663,  663,
			  664,  666,  664,  664,  664,  664,  664,  666,    0,    0,
			  663,  667,  668,  668,  666,    0,  664,  667,  668,    0,
			    0,  669,  660,  669,  669,  669,  669,  669,  670,  666,
			  670,  670,  670,  670,  670,  666,    0,    0,  663,    0,
			  668,  668,  666,  673,  664,  673,  668,    0,  673,  673,
			  673,  673,  673,    0,    0,    0,  670,  674,  674,  674,
			  674,  674,  677,  677,  677,  677,  677,  679,  679,  679,

			  679,  679,  680,  680,  680,  680,  680,  681,  681,  681,
			  681,  681,  683,  684,  670,    0,    0,  685,  687,  869,
			    0,    0,  681,  686,    0,  674,    0,  683,  684,    0,
			  869,    0,  685,  687,  684,    0,    0,  686,  686,  683,
			  869,  683,  684,  683,  684,  681,  685,  687,  685,  687,
			  681,    0,  686,  689,  686,  683,  684,    0,  869,  690,
			  685,  687,  684,  705,  691,  686,  686,  683,  689,  705,
			  705,    0,  683,  684,  690,  707,    0,  685,  687,  691,
			    0,  707,  689,  686,  689,  692,  693,    0,  690,  695,
			  690,  705,    0,  691,    0,  691,  689,  705,  705,    0, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  692,  693,  690,  707,  695,  695,    0,  691,  692,  707,
			    0,  696,    0,  689,  692,  693,  692,  693,  695,  690,
			  695,    0,  697,    0,  691,    0,  696,    0,  692,  693,
			  696,    0,  695,  695,    0,    0,  692,  697,  697,    0,
			  696,  708,  696,    0,  711,  692,  693,  708,    0,  695,
			  711,  697,    0,  697,  696,    0,    0,  703,  696,  703,
			  703,  703,  703,  703,  704,  697,  697,    0,  712,  708,
			  704,  696,  711,    0,  712,  708,    0,  704,  711,    0,
			    0,  706,  697,  706,  706,  706,  706,  706,    0,    0,
			    0,  713,  704,    0,    0,  703,  712,  713,  704,    0,

			    0,    0,  712,  706,  709,  704,  709,  709,  709,  709,
			  709,  710,    0,  710,  710,  710,  710,  710,  714,  713,
			  714,  714,  714,  714,  714,  713,  710,    0,    0,    0,
			  715,  706,  715,  715,  715,  715,  715,  716,    0,    0,
			    0,    0,  717,  716,  717,  717,  717,  717,  717,  718,
			  719,    0,    0,    0,  710,  718,  719,  720,  718,  720,
			  720,  720,  720,  720,  721,  716,  721,  721,  721,  721,
			  721,  716,    0,  722,  724,  722,  724,  718,  719,  722,
			  724,  720,  723,  718,  719,    0,  718,  723,  723,  725,
			    0,  725,  725,  725,  725,  725,  726,  726,  726,  726,

			  726,  722,  724,  722,  724,    0,  725,  722,  724,  720,
			  723,    0,    0,    0,    0,  723,  723,  727,  727,  727,
			  727,  727,  728,  728,  728,  728,  728,    0,    0,    0,
			  729,    0,  729,    0,  725,  729,  729,  729,  729,  729,
			  731,  731,  731,  731,  731,  733,  733,  733,  733,  733,
			  735,  736,    0,    0,    0,  739,    0,    0,  737,    0,
			  733,    0,  750,    0,  735,  735,  736,    0,  750,  739,
			  739,  736,    0,  737,  737,    0,  741,    0,    0,  735,
			  736,  735,  736,  733,  739,  743,  739,  737,  733,  737,
			  750,  741,  735,  735,  736,    0,  750,  739,  739,  736,

			  743,  737,  737,    0,    0,  741,  742,  741,    0,    0,
			  735,  736,    0,    0,  743,  739,  743,    0,  737,  741,
			  751,  742,  742,  753,    0,  753,  751,    0,  743,  753,
			  762,  762,  762,  762,  762,  742,  741,  742,  752,    0,
			  752,  752,  752,  752,  752,  743,  755,    0,  751,  742,
			  742,  753,  755,  753,  751,    0,  824,  753,  754,  752,
			  754,  754,  754,  754,  754,    0,  742,  756,  824,  756,
			  756,  756,  756,  756,  755,  754,  824,  757,  757,  758,
			  755,  758,  756,  757,  759,  758,    0,  752,    0,  824,
			  759,    0,  760,    0,  760,  760,  760,  760,  760,    0,

			    0,    0,    0,  754,  824,  757,  757,  758,  760,  758,
			  756,  757,  759,  758,    0,    0,    0,    0,  759,  763,
			  763,  763,  763,  763,  764,  764,  764,  764,  764,  765,
			  765,  765,  765,  765,    0,    0,  760,  766,  766,  766,
			  766,  766,  767,  767,  767,  767,  767,  769,  769,  769,
			  769,  769,  771,  772,    0,    0,    0,  763,  773,    0,
			    0,    0,  769,  774,    0,    0,    0,  771,  772,    0,
			  786,  771,    0,  773,    0,    0,  786,    0,  774,  774,
			    0,  771,  772,  771,  772,  769,    0,  773,  776,  773,
			  769,    0,  774,  777,  774,  771,  772,    0,  786,  771,

			    0,  773,    0,  776,  786,  790,  774,  774,  777,  783,
			  772,  790,  771,  772,  783,  783,    0,  776,  773,  776,
			    0,    0,  777,  774,  777,    0,  784,    0,    0,    0,
			    0,  776,  784,  790,    0,    0,  777,  783,    0,  790,
			    0,  784,  783,  783,    0,    0,    0,    0,  776,  788,
			  777,  788,    0,  777,  784,  788,    0,    0,    0,  785,
			  784,  785,  785,  785,  785,  785,    0,    0,  787,  784,
			  787,  787,  787,  787,  787,  791,    0,  788,    0,  788,
			    0,  791,  789,  788,  789,  789,  789,  789,  789,  785,
			  791,  792,  826,  792,  792,  792,  792,  792,  826,  789,

			    0,    0,    0,  791,  793,  793,  793,  793,  793,  791,
			  795,  795,  795,  795,  795,    0,    0,  785,  791,    0,
			  826,    0,    0,  796,  799,  796,  826,  789,  796,  796,
			  796,  796,  796,  797,  797,  797,  797,  797,    0,  799,
			  799,    0,  793,  800,  815,  815,  815,  815,  815,    0,
			  801,    0,    0,  799,  802,  799,    0,    0,  800,    0,
			  808,  796,  808,    0,    0,  801,  808,  799,  799,  802,
			    0,    0,  800,    0,  800,    0,  800,    0,  801,  801,
			    0,  801,    0,  802,  799,  802,  800,  802,  808,  809,
			  808,    0,    0,  801,  808,  809,  810,  802,  810,  810,

			  810,  810,  810,  800,    0,  800,  801,  811,  809,    0,
			  801,    0,  813,  811,  802,    0,  802,  809,  813,    0,
			    0,  811,  812,  809,  812,  812,  812,  812,  812,    0,
			  810,  813,  818,  819,    0,  811,    0,  809,  820,    0,
			  813,  811,    0,  821,    0,    0,  813,  818,  819,  811,
			  828,  812,    0,  820,    0,    0,  828,    0,  821,  810,
			  813,  818,  819,  818,  819,    0,    0,  820,  821,  820,
			    0,    0,  821,    0,  821,  818,  819,    0,  828,  812,
			    0,  820,  825,    0,  828,    0,  821,    0,  825,  818,
			    0,    0,  818,  819,    0,    0,  821,  825,  820,    0,

			    0,    0,  827,  821,  827,  827,  827,  827,  827,  829,
			  825,  829,  829,  829,  829,  829,  825,  830,  831,  831,
			  831,  831,  831,  830,  835,  825,    0,    0,  830,  832,
			  832,  832,  832,  832,  834,  834,  834,  834,  834,  835,
			    0,    0,  840,  849,  836,  830,  839,    0,  840,  849,
			    0,  830,    0,  835,  849,  835,  830,  835,  839,  836,
			  836,  840,    0,  841,    0,  841,  839,  835,    0,  841,
			  840,  849,    0,  836,    0,  836,  840,  849,    0,  839,
			    0,    0,  849,    0,  835,    0,  835,  836,  836,    0,
			  840,  841,    0,  841,  839,  844,  845,  841,    0,    0,

			  843,    0,  843,  843,  836,  843,  843,  843,  843,  843,
			  844,  845,  850,  851,  851,  851,  851,  851,  850,    0,
			  844,    0,    0,    0,  844,  845,  844,  845,  854,  854,
			  854,  854,  854,  856,  856,  856,  856,  856,  844,  845,
			  850,    0,    0,  857,    0,  860,  850,  860,  844,    0,
			    0,  860,    0,    0,    0,  844,  845,    0,  857,  857,
			  861,  861,  861,  861,  861,  862,  862,  862,  862,  862,
			    0,    0,  857,  860,  857,  860,    0,    0,    0,  860,
			  863,  863,  863,  863,  863,  854,  857,  857,  864,  864,
			  864,  864,  864,  866,  867,  866,  866,    0,  866,  866, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  866,  866,  866,  857,  870,    0,    0,    0,    0,  867,
			  870,  871,  871,  871,  871,  871,  873,  873,  873,  873,
			  873,    0,    0,  867,    0,  867,  876,  876,  876,  876,
			  876,    0,  870,    0,    0,    0,    0,  867,  870,  877,
			  877,  877,  877,  877,  880,    0,  880,    0,    0,  880,
			  880,  880,  880,  880,  867,  883,  883,  883,  883,  883,
			  884,  884,  884,  884,  884,  887,  887,  887,  887,  887,
			  891,  891,  891,  891,  891,  892,  892,  892,  892,  892,
			  893,  893,  893,  893,  893,  895,  895,  895,  895,  895,
			  896,    0,  896,    0,    0,  896,  896,  896,  896,  896,

			  897,  897,  897,  897,  897,  898,  898,  898,  898,  898,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  896,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,

			  901,  901,  901,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  903,  903,    0,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,    0,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  904,  904,    0,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,

			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  906,  937,  937,  937,  937,  937,
			  937,  937,  937,  937,    0,    0,    0,    0,    0,    0,
			    0,    0,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  907,  907,  907,    0,    0,    0,    0,    0,    0,
			  907,  907,    0,  907,    0,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,    0,    0,    0,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  908,  908,    0,  908,
			    0,  908,  908,    0,    0,    0,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,    0,    0,    0,  908,  908,

			  908,  908,  908,  908,  908,  908,  908,  909,  909,    0,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  910,  910,    0,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,    0,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,

			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  913,    0,  913,    0,    0,
			    0,    0,  913,    0,  913,  913,    0,    0,    0,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,    0,    0,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,

			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  916,  916,    0,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,

			  916,  917,    0,    0,    0,  917,  917,    0,    0,    0,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,    0,
			    0,    0,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  919,  919,
			  919,    0,    0,    0,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,    0,    0,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  920,    0,    0,  920,  920,

			    0,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,    0,    0,    0,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  922,    0,  922,    0,  922,    0,
			    0,  922,  922,  922,  922,  922,    0,    0,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,    0,    0,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,    0,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  924,  924,  924,  924,

			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  925,  925,  925,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  925,  926,
			  926,    0,    0,    0,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,    0,    0,    0,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  927,  927,    0,    0,    0, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  927,  927,  927,  927,  927,  927,  927,  927,  927,    0,
			    0,    0,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  928,  928,  928,    0,    0,    0,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,    0,    0,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,    0,    0,    0,  930,  930,  930,

			  930,  930,  930,  930,  930,  930,  931,    0,  931,    0,
			    0,    0,    0,  931,    0,  931,  931,    0,    0,    0,
			  931,  931,  931,  931,  931,  931,  931,  931,  931,    0,
			    0,    0,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  932,  932,  932,    0,    0,  932,  932,  932,  932,
			  932,  932,  932,  932,    0,    0,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,    0,    0,    0,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,    0,    0,    0,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  934,  934,

			    0,    0,    0,  934,  934,  934,  934,  934,  934,  934,
			  934,  934,    0,    0,    0,  934,  934,  934,  934,  934,
			  934,  934,  934,  934,  935,    0,  935,    0,    0,    0,
			    0,  935,    0,  935,  935,    0,    0,    0,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,    0,    0,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  936,
			  936,    0,    0,    0,  936,  936,  936,  936,  936,  936,
			  936,  936,  936,    0,    0,    0,  936,  936,  936,  936,
			  936,  936,  936,  936,  936,  938,  938,  938,  938,  938,
			  938,  938,  938,  938,    0,    0,    0,  938,  938,  938,

			  938,  938,  938,  938,  938,  938,  939,    0,    0,    0,
			  939,  939,    0,    0,    0,  939,  939,  939,  939,  939,
			  939,  939,  939,  939,    0,    0,    0,  939,  939,  939,
			  939,  939,  939,  939,  939,  939,  940,  940,    0,    0,
			    0,  940,  940,  940,  940,  940,  940,  940,  940,  940,
			    0,    0,    0,  940,  940,  940,  940,  940,  940,  940,
			  940,  940,  941,  941,    0,    0,    0,  941,  941,  941,
			  941,  941,  941,  941,  941,  941,    0,    0,    0,  941,
			  941,  941,  941,  941,  941,  941,  941,  941,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899, yy_Dummy>>,
			1, 480, 7000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,  185,    0,   67,
			   71, 1111, 7388,   98, 1104, 1076, 1088, 7388,   90,    0,
			 7388, 7388, 7388, 7388, 1079,   88, 1072,   98,  118, 7388,
			 7388, 1055, 7388, 1045, 7388,  275,  279,  285,  119,  296,
			  291,  300,  328,  347,  352,  356,  427,  389,  415,  381,
			  377,  998, 7388, 7388,  981,  505,  431,  556,  555,  593,
			  606,  422,  609,   94,  104,  629,  655,  652,  250,  306,
			 1018, 7388, 7388, 1020,  153, 7388,  106,  285,  279,  304,
			  322,  396,  382, 7388,  388,  450, 7388,  408, 1021,  506,
			  602, 7388,   78,  726, 7388,  160, 1014, 7388, 1003, 7388,

			 1000,    0,  725,  991,  995,  976,  761, 7388,   94,  148,
			  767,  791,  579,  686, 7388, 7388,  493,  816,    0,  821,
			  840,  856,  871,  887,  912,  927,  942,  946,  972,  988,
			 1003, 1018, 1035, 1051, 1067, 1083, 1107,  904, 1154, 1132,
			 1149, 1217,   79,  250, 1184,  908, 1223, 1083, 1226, 1259,
			  959,  415,  925, 7388,  414,  965,    0, 1306,  953, 1310,
			 1329, 1338,  903, 1064, 1353,  590,  832, 1043, 1386,  902,
			 1402, 1411, 1421, 1435, 1467, 1484, 1506, 1513,  652, 1320,
			 1536, 1543,  620,  717, 1154,  803, 1349, 1564, 1572, 1579,
			 1236, 1591, 1422, 1598,  854, 1220, 1605, 1627, 1480, 1591,

			 1655, 1662, 1620, 1659, 1678, 1684, 1677, 1707, 1702, 1737,
			 7388,  939, 7388,  322, 7388, 7388, 1342,  447,  502,  630,
			  706,  461, 7388,  881,  670,  847,  872,  961,  858, 7388,
			  747, 1122, 7388,  901, 1708,  170, 1816,  407,  256, 1906,
			 7388, 7388,  872,  793, 7388, 7388, 7388,  888, 1549,  884,
			  875,  871,  868,  600,  746, 7388, 1750, 1771, 1755,  858,
			  812, 1776, 1940, 1897, 1907, 1011, 1781, 7388,    0,    0,
			  843,  833, 1947, 1951, 1282, 1957, 1954, 1977, 1958, 1995,
			 2019, 2025, 2028, 1029, 2049, 2072, 2076, 2097, 1998, 2116,
			 2122, 7388, 2159, 2166, 2183, 2189, 2233, 2251, 2269, 2176,

			  767, 2268, 2198, 2260, 2292, 2299, 2302, 2310, 2332, 2340,
			 2351, 2372, 2373,  810, 2418, 2435, 7388,   98,  812, 2365,
			 2075, 1483,   67,  305, 2206, 2443, 2450, 2462, 2220, 2445,
			 2472, 2461, 2478, 2514, 2534, 2463, 1632, 2526, 2548, 2568,
			 2576, 2571, 2545, 2606, 2619, 1439, 2615, 2617, 1516, 2640,
			 2647, 1723, 2668, 2100, 2426, 2660, 2661, 2696, 2712, 2707,
			 2709, 2736, 2761, 2747, 2453, 2730, 2780, 2789, 2808, 2546,
			 2816, 2766, 2828,  823,  311, 1077,  797, 1121, 1143, 1569,
			  291, 7388,  771,  812, 2838, 7388,  434,  514,  799,  936,
			 7388, 7388, 2683, 7388, 7388, 7388, 7388, 7388,  933, 2226,

			 2835, 2540,  352, 2847, 2852, 2862, 2868, 2875, 2880, 2896,
			 2901, 2906,  739,  323,    0,  714, 2912, 2913, 2920, 2917,
			 2953, 2921, 2959, 2978, 2979, 3000, 1145, 3005, 3026, 3001,
			 3047, 3058, 3068, 3101, 3131, 3138, 3098, 3160, 3171, 3189,
			 2921, 7388, 3207, 3220, 3233, 3239, 3170, 3246, 3145, 3252,
			 3257, 3265, 3290, 3303,  801, 3350, 3363,  673,    0, 3236,
			 3278, 3371, 3378, 3387, 3400, 3407, 3393, 3420, 2728, 3412,
			 3441, 3467, 2754, 2956, 3444, 3475, 3492, 3501, 3468, 3068,
			 3516, 3107, 3493, 3439, 3535, 3543, 3542, 3566, 3539, 3566,
			 3573, 3621, 3231, 3568, 3628, 3635, 3621, 3629, 3633, 3656,

			 3663, 3676, 3690, 7388, 3356, 3413, 3523, 3698,  712, 3706,
			 3594, 3724, 3601, 3729, 3734,  692, 3739, 3750, 1434,  456,
			    0,    0, 3746, 3747, 3756, 3779, 3766, 3788, 3812, 3818,
			 3821,  680, 3844, 3851, 3854, 3874, 3892, 3884, 7388,  616,
			 3936, 3930, 3952, 3982, 3973, 4002, 2010, 3982, 4002, 4012,
			 4032, 2052,  833,  994, 1099, 7388, 1020,  411, 3750, 3980,
			 4075, 4084, 4092, 4084, 4104, 4096, 4103, 4138, 4151, 4115,
			 4148, 4168, 4196, 3815, 4016, 4176, 4171, 4188, 4168, 4240,
			 4256, 4206, 4263, 4249, 4233, 4284, 4311, 4258, 4276, 4281,
			 4308, 4341, 4360,  639, 4365, 4376, 4385, 4391, 4404, 4413,

			  638, 4418, 4423, 4430, 1099, 7388, 4435,    0,  638, 4441,
			 4442, 4446, 4445, 4449, 4467, 4468, 4500, 1130, 4507, 4508,
			 4526, 4530, 4533, 4576, 7388,  618,  622, 4556, 4588, 4591,
			 4596, 2122, 2346, 3782,  730, 7388, 7388, 1154, 1037, 4656,
			 4588,  611, 4289, 4663, 4598, 4305, 4671, 4677, 4593, 4670,
			 4505, 4697, 4704, 4727, 4696, 4705, 4720, 4747, 4755, 4749,
			 4779, 4756, 4672, 4807, 4814, 4753, 4800, 4782, 4811, 4835,
			 4842, 4670,  603, 4860, 4869, 4784, 1154, 4874,  604, 4879,
			 4884, 4889,  513, 4895, 4896, 4900, 4906, 4901, 1268, 4936,
			 4942, 4947, 4968, 4969, 1338, 4972, 4994, 5005,  461,  453,

			  442,  416,    0, 5041, 5033, 4932, 5065, 4944, 5010, 5088,
			 5095, 5013, 5037, 5060, 5102, 5114, 5106, 5126, 5118, 5119,
			 5141, 5148, 5142, 5151, 5143, 5173, 5178, 5199, 5204, 5217,
			 1490, 5222, 2243, 5227,    0, 5233, 5234, 5241, 7388, 5238,
			 1613, 5259, 5289, 5268, 3031, 3296, 3299, 3672,  412,  381,
			 5231, 5289, 5322, 5292, 5342, 5315, 5351, 5346, 5348, 5353,
			 5376,  322, 5312, 5401, 5406, 5411, 5419, 5424, 7388, 5429,
			    0, 5435, 5436, 5441, 5446, 7388, 5471, 5476, 4038, 4039,
			 4058, 4203, 1627, 5478, 5495, 5543, 5439, 5552, 5518, 5566,
			 5474, 5544, 5575, 5586,  320, 5592, 5610, 5615,  485, 5607,

			 5626, 5633, 5637,  438, 7388,  811,  290, 7388, 5629, 5658,
			 5680, 5676, 5706, 5681,  540, 5626,    0,  221, 5715, 5716,
			 5721, 5726, 2004, 2365, 5340, 5751, 5561, 5786, 5719, 5793,
			 5786, 5800, 5811,  576, 5816, 5807, 5827, 3418, 3901, 5830,
			 5811, 5832, 2340, 5887, 5878, 5879,  272,  262,  646, 5812,
			 5881, 5895, 1745, 7388, 5910,   99, 5915, 5926, 2478, 3059,
			 5914, 5942, 5947, 5962, 5970,   93, 5980, 5977, 4437, 4891,
			 5973, 5993, 3116, 5998,  125,  102, 6008, 6021, 1789, 7388,
			 6031, 2054, 2062, 6037, 6042, 2102, 2584, 6047, 2657, 7388,
			 7388, 6052, 6057, 6062, 7388, 6067, 6077, 6082, 6087, 7388,

			 6128, 6165, 6202, 6239, 6276, 6094, 6304, 6339, 6370, 6406,
			 6443, 6480, 6517, 6553, 6589, 6626, 6663, 6694, 6730, 6758,
			 6787, 6091, 6822, 6858, 6895, 6931, 6958, 6984, 7011, 7047,
			 7069, 7104, 7140, 7161, 7187, 7222, 7248, 6299, 7269, 7299,
			 7325, 7351, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  899,    1,  900,  900,  901,  901,  899,    7,  902,
			  902,  899,  899,  899,  899,  899,  903,  899,  904,  905,
			  899,  899,  899,  899,  899,  899,  906,  899,  899,  899,
			  899,  899,  899,  899,  899,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  908,  899,  899,  909,  899,   55,   55,   55,   55,
			   55,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			  899,  899,  899,  910,  899,  899,  899,  910,  910,  910,
			  910,  910,  911,  899,  912,  911,  899,  913,  899,  913,
			  913,  899,  914,  915,  899,  899,  899,  899,  903,  899,

			  916,  916,  916,  917,  918,  899,  899,  899,  919,  899,
			  899,  899,  899,  899,  899,  899,  899,  907,  920,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  899,   46,  907,
			  907,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  908,  908,  909,  899,  899,  899,  921,  922,  899,  922,
			  922,  922,  899,   60,   60,  164,  164,  164,  922,  164,
			  922,  922,  164,   60,  922,  922,  164,  164,  175,  175,
			  164,  164,  175,  164,  175,  175,  175,  164,  164,  164,
			  175,  164,  175,  164,  175,  175,  164,  164,  175,  175,

			  164,  164,  175,  175,   60,  164,  175,  164,  175,  164,
			  899,  910,  899,  899,  899,  899,  910,  910,  910,  910,
			  910,  911,  899,  923,  911,  912,  924,  912,  923,  899,
			  913,  913,  899,  899,  899,  899,  899,  899,  914,  915,
			  899,  899,  239,  925,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  906,
			  899,  899,  899,  899,  899,  899,  899,  899,  926,  927,
			  899,  920,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  899,  140,  140,  140,  140,  140,  140,
			  140,  899,  899,  927,  140,  140,  140,  140,  140,  141,

			  899,  141,  141,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  899,  908,  908,  899,  928,  899,  175,
			  175,  175,  899,  899,  927,  175,  164,   60,  164,  175,
			   60,  175,  175,  164,  164,  175,  175,  175,  164,  164,
			  164,  175,  175,  164,  164,  899,  175,  175,  175,  164,
			  164,  175,  164,  175,  164,  175,  175,  164,  164,  175,
			  175,  164,  164,  175,  175,  175,  164,  164,  164,  175,
			  164,  175,  164,  910,  910,  910,  910,  910,  910,  910,
			  923,  899,  924,  929,  929,  899,  929,  929,  929,  925,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  926,  927,  930,  920,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  899,  140,  140,  140,
			  140,  140,  140,  899,  927,  138,  141,  435,  435,  140,
			  138,  899,  899,  927,  140,  140,  140,  140,  899,  140,
			  140,  140,  140,  140,  931,  908,  908,  899,  932,  175,
			  175,  899,  899,  927,  164,  164,  175,  164,  175,  175,
			  164,  164,  175,  175,  175,  164,  164,  164,  175,  175,
			  164,  175,  175,  175,  164,  164,  175,  164,  175,  175,
			  164,  164,  175,  175,  164,  164,  175,  175,  175,  164,

			  164,  175,  164,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  933,  934,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  899,  140,  140,  140,  140,  140,  140,  899,  927,
			  140,  140,  899,  927,  435,  544,  899,  140,  140,  140,
			  140,  926,  899,  935,  931,  899,  899,  899,  175,  175,
			  899,  164,  164,  175,  164,  175,  175,  164,  164,  175,
			  175,  164,  164,  175,  175,  164,  175,  175,  175,  164,
			  164,  175,  164,  175,  175,  164,  164,  175,  175,  175,
			  175,  164,  164,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  936,  934,  140,
			  140,  140,  140,  140,  140,  140,  140,  899,  140,  140,
			  140,  140,  140,  435,  899,  927,  899,  140,  140,  140,
			  140,  899,  926,  926,  935,  899,  899,  899,  899,  899,
			  175,  899,  175,  164,  175,  175,   60,  164,  175,  175,
			  175,  164,  164,  164,  175,  175,  175,  164,  164,  175,
			  164,  175,  175,  164,  164,  175,  175,  175,  175,  164,
			  164,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  936,  140,  140,  140,  140,  140,  899,  140,
			  140,  140,  140,  140,  899,  140,  140,  140,  899,  899,

			  926,  926,  937,  899,  175,  175,  164,  175,  175,  164,
			  164,  175,  175,  175,  164,  164,  175,  164,  175,  175,
			  164,  164,  175,  175,  175,  164,  899,  899,  899,  899,
			  899,  899,  899,  899,  938,  140,  140,  140,  899,  140,
			  899,  140,  140,  140,  899,  899,  933,  933,  939,  899,
			  175,  175,  164,  175,  164,  175,  164,  175,  175,  175,
			  164,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  940,  140,  140,  140,  140,  899,  140,  140,  899,  899,
			  936,  936,  899,  175,  175,  164,  175,  164,  175,  164,
			  175,  175,  164,  899,  899,  899,  899,  899,  940,  140,

			  140,  140,  140,  899,  899,  936,  936,  899,  175,  175,
			  164,  175,  164,  175,  899,  899,  941,  899,  140,  140,
			  140,  140,  899,  899,  936,  175,  175,  164,  175,  164,
			  175,  899,  899,  941,  899,  140,  140,  899,  899,  936,
			  175,  175,  899,  899,  140,  140,  899,  899,  936,  175,
			  175,  899,  899,  899,  899,  899,  899,  140,  899,  899,
			  175,  899,  899,  899,  899,  899,  899,  140,  899,  899,
			  175,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,    0,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    1,    8,    1,    1,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   18,
			   19,   20,   21,   21,   21,   22,   22,   22,   23,   24,
			   25,   26,   27,   28,    1,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   35,   35,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   35,   48,   49,   50,
			   51,   52,   53,   54,   55,   56,    1,   57,   58,   59,

			   60,   61,   62,   63,   64,   65,   63,   63,   66,   67,
			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   63,   80,   81,   82,   83,    1,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,    1,    1,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   88,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   90,   91,   91,   91,   91,   91,   91,   91,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,    9,   10,   11,   11,
			   11,   11,   12,   13,    1,   14,    1,   15,    1,   16,
			   17,   18,   19,   20,   21,   16,   16,   22,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   23,   16,
			   16,   24,   25,   26,   27,    5,   11,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			    5,    5,   37,    5,    1,    1,    1,    1,    1,    1,
			    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  105,  105,    0,    0,    0,
			    0,  136,  134,    1,    2,   15,  118,   18,  134,   16,
			   17,    7,    6,   13,    5,   11,    8,  110,  110,   14,
			   12,   28,   10,   29,   19,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   81,   98,   98,   98,
			   98,   21,   30,   22,    9,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			   23,   20,   24,  122,  123,  124,  125,  122,  122,  122,
			  122,  122,  105,  108,  135,  105,  135,  135,   68,  135,
			  135,   70,  135,  135,   97,    1,    2,   27,  118,  117,

			  132,  132,  132,    0,    3,   32,  116,   31,  102,    0,
			    0,  110,    0,  110,   26,   25,    0,   98,   92,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   39,    0,   98,   91,
			   91,   80,   91,   91,   98,   98,   98,   98,   98,   98,
			    0,    0,    0,  109,    0,    0,    0,  101,    0,  101,
			  101,  101,    0,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,   39,  101,   39,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  104,  122,  124,  123,  120,  119,  121,  122,  122,  122,
			  122,  105,  108,    0,  105,    0,    0,    0,  106,  107,
			    0,    0,   70,   68,    0,   67,    0,   66,    0,    0,
			   97,   95,   95,    0,   96,  132,  126,  132,  132,  132,
			  132,  132,  132,    0,    4,   33,  116,    0,    0,    0,
			    0,    0,  112,    0,  110,    0,    0,   92,    0,    0,
			    0,    0,   98,   98,   38,   98,   98,   98,   98,   98,
			   98,   98,   98,    0,   98,   98,   98,   98,   41,   98,
			   98,   89,    0,    0,   81,   82,   81,   81,   81,   90,

			    0,   98,   90,   90,   90,   98,   98,   98,   98,   98,
			   98,   40,   98,    0,    0,    0,  100,  103,    0,  101,
			  101,   38,    0,    0,   71,   71,  101,  101,   38,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,    0,  101,  101,  101,  101,
			  101,  101,  101,   41,   41,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,   40,
			   40,  101,  101,  122,  122,  122,  122,  122,  122,  122,
			    0,  106,  107,    0,    0,   69,   67,   66,   70,    0,
			  130,  133,  133,  131,  127,  128,  129,   93,  116,    0,

			  116,    0,    0,    0,  112,    0,    0,    0,  115,  110,
			    0,    0,    0,    0,    0,   99,   98,   98,   98,   98,
			   98,   37,   98,   98,   98,   98,    0,   98,   98,   98,
			   98,   98,   98,    0,    0,   98,   80,   98,   98,   98,
			   98,   88,    0,    0,   80,   80,   80,   36,    0,   43,
			   98,   98,   98,   98,   65,    0,    0,    0,   61,  101,
			  101,    0,   71,   71,  101,  101,  101,  101,  101,  101,
			  101,  101,   37,  101,  101,   37,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,   36,   43,   36,   43,  101,  101,  101,  101,

			  101,  101,  101,  107,  116,    0,    0,    0,  111,  112,
			    0,  113,    0,  115,    0,    0,    0,  110,   77,    0,
			    0,    0,   58,   98,   98,   98,   98,   98,   98,   44,
			   98,    0,   98,   98,   35,   98,   98,   98,   82,   82,
			   82,   81,    0,    0,   98,   98,    0,   98,   98,   98,
			   98,    0,   65,   65,    0,   64,   64,    0,   58,  101,
			    0,   58,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,   44,  101,   44,  101,  101,   35,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  116,    0,    0,  112,  113,    0,    0,

			  115,    0,    0,    0,    0,   77,    0,    0,    0,   98,
			   59,   98,   60,   98,   98,   46,   98,    0,   98,   98,
			   98,   98,   98,   98,   80,   80,    0,   52,   98,   98,
			   98,    0,    0,    0,    0,   63,   62,    0,    0,    0,
			  101,    0,   59,   59,  101,   60,  101,   60,  101,  101,
			   46,  101,  101,   46,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,   52,  101,  101,  101,   52,
			  101,    0,  102,    0,  113,    0,  116,    0,   79,    0,
			    0,  114,    0,   98,   98,   57,   98,   45,    0,   42,
			   56,   34,   98,   50,    0,   98,   98,   98,    0,    0,

			    0,    0,    0,    0,  101,  101,  101,   57,  101,   57,
			  101,   45,   42,   56,   42,   56,   34,   34,  101,   50,
			  101,   50,  101,  101,  101,  101,    0,  113,    0,    0,
			    0,    0,   76,  114,    0,   98,   98,   98,   85,   98,
			    0,   98,   98,   53,    0,    0,    0,    0,    0,  103,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,   53,
			  101,  115,    0,  115,    0,    0,    0,    0,   76,  114,
			    0,   98,   98,   47,   98,   84,   51,   98,    0,    0,
			    0,    0,    0,  101,  101,  101,   47,   47,  101,  101,
			   51,  101,   51,  115,   78,    0,   76,  114,    0,   98,

			   98,   98,   98,   83,   83,   83,   83,   94,  101,  101,
			  101,  101,  101,  101,    0,    0,    0,    0,   98,   49,
			   48,   98,    0,    0,    0,  101,   49,   49,   48,   48,
			  101,    0,    0,    0,    0,   98,   98,    0,    0,    0,
			  101,  101,   75,   72,   98,   54,    0,    0,    0,  101,
			   54,    0,    0,   75,    0,    0,    0,   98,    0,    0,
			  101,    0,    0,   72,    0,    0,   72,   55,    0,    0,
			   55,    0,   74,    0,    0,    0,    0,    0,    0,   74,
			   72,    0,    0,    0,    0,    0,    0,    0,   73,   86,
			   87,    0,    0,    0,   73,    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 7388
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 899
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 900
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 135
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 136
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_REGEXP1: INTEGER = 2
	IN_TERM_CONSTRAINT: INTEGER = 3
	IN_C_DOMAIN_TYPE: INTEGER = 4
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
			create odin_parser_error.make
			create str_.make_empty
			create last_string_value.make_empty
			create last_c_dv_quantity_value.default_create
		end

feature -- Commands

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
		end

feature -- Access

	in_buffer: STRING
			-- Buffer for lexical tokens.

	in_lineno: INTEGER
			-- Current line number.

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

	source_start_line: INTEGER
			-- Offset of source in other document, else 0.

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

	odin_parser: ODIN_PARSER
		once
			create Result.make
		end

	odin_parser_error: ERROR_ACCUMULATOR

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

	tid: INTEGER

end
