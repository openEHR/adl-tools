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
if yy_act <= 67 then
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
if yy_act <= 59 then
if yy_act <= 55 then
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
if yy_act = 54 then
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_INCLUDE
else
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 58 then
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_AFTER
else
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_BEFORE
end
end
end
else
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_CLOSED
else
--|#line 181 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 181")
end

	last_token := V_URI
	last_string_value := text

end
else
if yy_act = 62 then
--|#line 187 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 187")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 192 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 192")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 65 then
if yy_act = 64 then
--|#line 199 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 199")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 215 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 215")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
end
else
if yy_act = 66 then
--|#line 223 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 223")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
else
--|#line 230 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 230")
end
	-- match any line, with ',' termination
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
if yy_act <= 100 then
if yy_act <= 84 then
if yy_act <= 76 then
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
--|#line 237 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 237")
end
in_lineno := in_lineno + text_count
else
--|#line 240 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 240")
end
in_lineno := in_lineno + 1
end
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
if yy_act = 71 then
--|#line 263 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 263")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 269 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 269")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 276 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 276")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 277 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 277")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 75 then
--|#line 278 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 278")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 80 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 286 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 286")
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
if yy_act = 79 then
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 82 then
if yy_act = 81 then
--|#line 302 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 302")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 309 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 309")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 83 then
--|#line 321 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 321")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 331 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 331")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
end
end
end
else
if yy_act <= 92 then
if yy_act <= 88 then
if yy_act <= 86 then
if yy_act = 85 then
--|#line 336 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 336")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 346 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 346")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 87 then
--|#line 352 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 352")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 363 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 363")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				last_string_value := text
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
			
end
end
else
if yy_act <= 90 then
if yy_act = 89 then
--|#line 372 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 372")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 386 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 386")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 91 then
--|#line 393 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 393")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 399 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 399")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 96 then
if yy_act <= 94 then
if yy_act = 93 then
--|#line 405 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 405")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 409 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 409")
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
if yy_act = 95 then
--|#line 451 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 451")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 457 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 457")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 98 then
if yy_act = 97 then
--|#line 463 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 463")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 469 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 469")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 99 then
--|#line 476 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 476")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 482 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 482")
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
if yy_act <= 117 then
if yy_act <= 109 then
if yy_act <= 105 then
if yy_act <= 103 then
if yy_act <= 102 then
if yy_act = 101 then
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_REL_PATH
				last_string_value := text
			
else
--|#line 494 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 494")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 501 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 501")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 104 then
--|#line 505 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 505")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 509 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 509")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 107 then
if yy_act = 106 then
--|#line 513 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 513")
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
--|#line 525 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 525")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 108 then
--|#line 532 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 532")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 537 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 537")
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
if yy_act <= 113 then
if yy_act <= 111 then
if yy_act = 110 then
--|#line 552 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 552")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 553 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 553")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 112 then
--|#line 557 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 557")
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
--|#line 558 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 558")
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
if yy_act <= 115 then
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
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 116 then
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 592 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 592")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 125 then
if yy_act <= 121 then
if yy_act <= 119 then
if yy_act = 118 then
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
end
in_buffer.append_character ('"')
else
--|#line 596 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 596")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 120 then
--|#line 600 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 600")
end
in_buffer.append_string (text)
else
--|#line 602 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 602")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 123 then
if yy_act = 122 then
--|#line 607 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 607")
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
--|#line 618 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 618")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 124 then
--|#line 627 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 627")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 629 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 629")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 129 then
if yy_act <= 127 then
if yy_act = 126 then
--|#line 630 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 630")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 631 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 631")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 128 then
--|#line 632 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 632")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 633 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 633")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 131 then
if yy_act = 130 then
--|#line 635 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 635")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 636 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 636")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 132 then
--|#line 640 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 640")
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
			create an_array.make_filled (0, 0, 7456)
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
			  111,  116,  116,  190,  116,  880,  459,  117,   84,   85,
			   84,   85,  109,  157,  110,  157,  113,  113,  113,  113,
			  113,  459,   76,  102,  118,  192,  260,   76,  879,   94,
			  455,  191,  862,   94,  112,  213,  117,  213,  213,  215,
			  240,  163,   95,  163,   95,   95,  261,  261,  261,  261,
			  261,  863,  235,  193,  112,  235,   77,   78,   79,   80,
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
			  116,  116,  116,  239,  116,  857,  212,  116,  116,  140,
			  116,  206,  212,  116,  116,  856,  116,  832,  116,  116,

			  118,  116,  116,  116,  118,  116,  732,  163,  501,  119,
			  118,  212,  122,  120,  123,  121,  118,  140,  212,  207,
			  127,  118,  317,  124,  213,  118,  213,  213,  413,  212,
			  116,  116,  128,  116,  125,  157,  129,  119,  240,  269,
			  122,  120,  123,  121,  379,  126,  270,  157,  127,  116,
			  116,  124,  116,  118,  116,  116,  208,  116,  116,  116,
			  128,  116,  125,  163,  129,  217,  812,  130,  131,  216,
			  216,  216,  118,  132,  126,  163,  133,  118,  596,  116,
			  116,  118,  116,  116,  116,  209,  116,  135,  218,  218,
			  218,  116,  116,  134,  116,  130,  131,  217,  156,  222,

			  136,  132,  118,  212,  133,  226,  118,  219,  219,  237,
			  230,  505,  237,  230,  118,  135,  154,  116,  116,  154,
			  116,  134,  148,  780,  155,  144,  505,  149,  136,  116,
			  116,  745,  116,  145,  223,  224,  385,  384,  312,  385,
			  118,  227,  228,  820,  137,  138,  138,  138,  138,  138,
			  148,  157,  118,  144,  212,  146,  149,  744,  182,  139,
			  147,  145,  232,  157,  168,  157,  140,  229,  743,  157,
			  637,  157,  604,  141,  313,  142,  742,  143,  222,  163,
			  220,  220,  220,  146,  821,  637,  183,  139,  147,  314,
			  163,  163,  169,  163,  140,  116,  116,  163,  116,  163,

			  814,  815,  223,  224,  142,  163,  143,  154,  234,  212,
			  154,  234,  112,  223,  224,  155,  386,  384,  267,  386,
			  235,  236,  156,  157,  157,  157,  157,  157,  158,  732,
			  237,  216,  216,  216,  157,  157,  157,  157,  157,  159,
			  157,  157,  157,  160,  157,  161,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  162,  829,  829,
			  232,  157,  163,  163,  164,  163,  163,  165,  163,  163,
			  163,  166,  163,  167,  163,  163,  163,  163,  163,  164,
			  163,  163,  163,  163,  163,  170,  216,  216,  216,  157,
			  157,  814,  815,  157,  171,  157,  157,  266,  266,  266,

			  266,  266,  253,  253,  234,  253,  269,  234,  157,  157,
			  157,  157,  157,  172,  163,  163,  235,  163,  163,  728,
			  259,  163,  173,  163,  163,  396,  237,  157,  156,  163,
			  163,  174,  269,  157,  269,  178,  318,  212,  157,  270,
			  157,  270,  175,  283,  157,  692,  157,  179,  184,  185,
			  157,  157,  163,  268,  186,  163,  232,  157,  157,  176,
			  194,  163,  732,  180,  325,  163,  163,  163,  163,  857,
			  157,  177,  163,  195,  163,  181,  187,  188,  163,  157,
			  163,  157,  189,  157,  157,  157,  163,  229,  196,  157,
			  340,  198,  202,  157,  512,  503,  157,  203,  163,  199,

			  109,  197,  110,  615,  264,  264,  264,  264,  264,  163,
			  600,  157,  163,  212,  377,  377,  377,  157,  340,  200,
			  204,  163,  223,  224,  163,  205,  109,  201,  242,  242,
			  555,  242,  897,  269,  247,  157,  157,  157,  157,  157,
			  344,  414,  112,  248,  248,  248,  248,  248,  254,  230,
			  254,  254,  230,  243,  518,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  249,  256,
			  256,  256,  256,  256,  633,  262,  262,  262,  262,  262,
			  378,  378,  378,  250,  257,  388,  388,  251,  388,  252,

			  263,  232,  384,  550,  212,  109,  551,  110,  244,  264,
			  264,  264,  264,  264,  265,  384,  820,  258,  116,  116,
			  243,  116,  257,  116,  116,  380,  116,  732,  263,  456,
			  212,  268,  269,  452,  346,  550,  268,  269,  550,  270,
			  157,  118,  116,  116,  270,  116,  118,  112,  269,  414,
			  157,  157,  157,  157,  157,  268,  269,  822,  116,  116,
			  413,  116,  346,  270,  226,  118,  401,  272,  157,  897,
			  319,  268,  269,  116,  116,  395,  116,  394,  273,  270,
			  393,  118,  219,  219,  392,  354,  268,  269,  274,  116,
			  116,  157,  116,  389,  270,  272,  118,  897,  326,  233,

			  227,  228,  268,  269,  379,  275,  273,  216,  216,  216,
			  270,  380,  118,  354,  116,  116,  274,  116,  269,  157,
			  157,  157,  157,  157,  157,  897,  379,  268,  269,  116,
			  116,  276,  116,  275,  212,  270,  328,  118,  388,  388,
			  117,  388,  268,  269,  116,  116,  321,  116,  116,  116,
			  270,  116,  118,  277,  117,  306,  117,  268,  269,  276,
			  317,  268,  269,  897,  329,  270,  257,  118,  117,  270,
			  315,  118,  278,  279,  116,  116,  153,  116,  381,  280,
			  312,  277,  117,  306,  281,  117,  291,  268,  269,  258,
			  116,  116,  255,  116,  257,  270,  117,  118,  117,  254, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  278,  279,  253,  268,  269,  116,  116,  280,  116,  246,
			  117,  283,  281,  118,  227,  228,  282,   99,  268,  269,
			  116,  116,  635,  116,   96,  635,  270,  117,  118,  409,
			  409,  409,  409,  268,  269,  233,  212,  116,  116,  636,
			  116,  270,  636,  118,  282,  284,  636,  700,  210,  285,
			  268,  269,  413,  116,  116,  153,  116,  425,  270,  269,
			  118,  157,  157,  157,  157,  157,  268,  269,  425,  116,
			  116,  151,  116,  284,  270,  320,  118,  285,  425,  268,
			  269,  115,  268,  269,  212,  116,  116,  322,  116,  114,
			  270,  286,  118,  157,  107,  104,  425,  287,  268,  269,

			  897,  550,   99,  327,  551,  157,  270,  529,  118,  116,
			  116,   97,  116,  288,  289,  117,  309,  727,  529,   96,
			  897,  163,  268,  269,  897,  287,  897,  897,  529,  117,
			  270,  117,  118,  163,  116,  116,  897,  116,  897,  290,
			  405,  288,  289,  117,  309,  727,  529,  268,  269,  137,
			  897,  116,  116,  633,  116,  270,  897,  118,  897,  632,
			  117,  218,  218,  218,  268,  269,  137,  290,  292,  268,
			  293,  897,  270,  897,  118,  268,  269,  270,  299,  157,
			  897,  139,  897,  322,  897,  157,  294,  897,  897,  157,
			  295,  897,  341,  296,  897,  299,  897,  142,  897,  897,

			  117,  331,  297,  897,  298,  897,  897,  157,  634,  139,
			  897,  117,  304,  157,  294,  305,  157,  163,  295,  897,
			  341,  296,  157,  897,  897,  117,  142,  117,  897,  333,
			  686,  297,  897,  298,  300,  300,  300,  300,  300,  117,
			  304,  347,  897,  305,  157,  897,  897,  686,  117,  897,
			  157,  686,  301,  897,  897,  302,  117,  154,  897,  897,
			  154,  303,  117,  897,  117,  155,  897,  897,  117,  897,
			  268,  269,  156,  307,  117,  686,  117,  308,  270,  897,
			  301,  117,  117,  302,  117,  897,  310,  897,  117,  303,
			  117,  635,  897,  117,  635,  117,  117,  117,  897,  311,

			  897,  307,  117,  154,  157,  308,  154,  162,  897,  117,
			  157,  155,  897,  117,  310,  636,  268,  269,  156,  117,
			  359,  897,  154,  157,  270,  154,  117,  897,  311,  157,
			  155,  154,  157,  835,  154,  268,  269,  156,  157,  155,
			  212,  835,  370,  270,  268,  269,  156,  318,  359,  157,
			  355,  157,  270,  162,  835,  157,  897,  157,  319,  268,
			  323,  320,  324,  324,  324,  324,  324,  322,  157,  835,
			  897,  370,  162,  157,  157,  318,  897,  157,  355,  154,
			  897,  162,  154,  157,  897,  157,  319,  155,  897,  320,
			  897,  897,  268,  269,  156,  154,  157,  897,  154,  897,

			  270,  163,  157,  155,  154,  897,  897,  154,  268,  269,
			  156,  328,  155,  163,  897,  897,  270,  268,  269,  156,
			  372,  373,  374,  375,  376,  270,  897,  736,  269,  162,
			  157,  157,  157,  157,  157,  897,  157,  330,  154,  328,
			  897,  154,  157,  331,  736,  162,  155,  154,  736,  368,
			  154,  268,  269,  156,  162,  155,  330,  897,  897,  270,
			  268,  269,  156,  234,  157,  330,  234,  897,  270,  897,
			  157,  331,  736,  897,  897,  235,  335,  368,  762,  762,
			  762,  334,  336,  234,  332,  237,  234,  269,  162,  157,
			  157,  157,  157,  157,  897,  235,  269,  162,  157,  157,

			  157,  157,  157,  897,  335,  237,  897,  897,  157,  334,
			  336,  335,  897,  897,  157,  232,  334,  336,  269,  345,
			  157,  157,  157,  157,  157,  269,  897,  157,  157,  157,
			  157,  157,  897,  897,  897,  232,  157,  897,  212,  338,
			  340,  897,  157,  897,  337,  339,  269,  345,  157,  157,
			  157,  157,  157,  341,  269,  897,  157,  157,  157,  157,
			  157,  269,  897,  157,  157,  157,  157,  157,  342,  346,
			  157,  897,  345,  897,  897,  897,  157,  157,  897,  897,
			  897,  343,  738,  157,  269,  350,  157,  157,  157,  157,
			  157,  897,  352,  678,  678,  678,  678,  349,  157,  738,

			  348,  347,  897,  738,  157,  157,  400,  400,  400,  400,
			  400,  157,  897,  350,  350,  220,  220,  220,  897,  269,
			  352,  157,  157,  157,  157,  157,  269,  738,  157,  157,
			  157,  157,  157,  624,  269,  897,  157,  157,  157,  157,
			  157,  354,  351,  212,  624,  157,  157,  358,  364,  352,
			  355,  157,  157,  269,  624,  157,  157,  157,  157,  157,
			  269,  157,  157,  157,  157,  157,  157,  362,  897,  356,
			  358,  363,  624,  157,  157,  358,  364,  353,  357,  157,
			  157,  897,  268,  269,  402,  402,  402,  402,  402,  157,
			  322,  359,  897,  897,  897,  362,  157,  836,  360,  363,

			  897,  897,  776,  897,  362,  836,  776,  897,  363,  269,
			  212,  157,  157,  157,  157,  157,  897,  897,  836,  361,
			  216,  216,  216,  776,  163,  269,  364,  157,  157,  157,
			  157,  157,  365,  836,  776,  269,  366,  157,  157,  157,
			  157,  157,  390,  391,  391,  391,  391,  391,  397,  397,
			  397,  397,  397,  368,  367,  897,  157,  466,  897,  398,
			  897,  398,  157,  257,  399,  399,  399,  399,  399,  370,
			  406,  897,  406,  897,  897,  407,  407,  407,  407,  407,
			  897,  369,  897,  897,  157,  466,  258,  216,  216,  216,
			  157,  257,  410,  410,  410,  410,  410,  897,  371,  382,

			  383,  384,  382,  383,  382,  382,  382,  382,  382,  382,
			  382,  382,  385,  236,  236,  382,  236,  236,  236,  236,
			  236,  382,  386,  382,  382,  382,  382,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  382,  382,  387,  382,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  242,  242,  897,  242,  432,  432,  432,  432,  432,  860,

			  860,  860,  860,  109,  897,  110,  897,  408,  408,  408,
			  408,  408,  897,  897,  897,  243,  897,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  403,  403,  403,  403,  403,  112,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  404,  433,  433,  433,  433,
			  433,  117,  415,  897,  897,  117,  117,  897,  897,  897,
			  244,  897,  897,  897,  416,  117,  897,  117,  405,  117,
			  117,  117,  117,  404,  418,  780,  780,  117,  780,  117,
			  415,  157,  897,  117,  117,  897,  417,  157,  117,  897, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  117,  416,  117,  897,  897,  117,  117,  805,  897,
			  117,  117,  418,  897,  117,  117,  477,  897,  897,  157,
			  419,  117,  897,  117,  417,  157,  897,  422,  117,  117,
			  117,  897,  117,  117,  420,  117,  897,  117,  897,  897,
			  157,  897,  117,  421,  897,  897,  481,  117,  419,  117,
			  897,  117,  117,  117,  897,  422,  117,  897,  897,  117,
			  897,  117,  420,  897,  897,  117,  629,  897,  157,  423,
			  117,  421,  117,  897,  481,  117,  897,  630,  117,  117,
			  897,  897,  117,  897,  117,  426,  897,  631,  117,  117,
			  897,  117,  897,  117,  427,  117,  897,  423,  897,  424,

			  897,  117,  117,  117,  117,  630,  897,  117,  897,  844,
			  429,  117,  157,  426,  457,  117,  117,  844,  157,  897,
			  117,  117,  427,  897,  117,  117,  428,  117,  897,  117,
			  844,  117,  897,  117,  897,  117,  897,  117,  429,  117,
			  157,  897,  457,  117,  897,  844,  157,  117,  897,  117,
			  897,  117,  431,  897,  428,  897,  117,  897,  897,  897,
			  117,  117,  430,  117,  897,  117,  117,  117,  897,  434,
			  434,  434,  434,  434,  897,  117,  897,  897,  897,  117,
			  431,  897,  897,  117,  117,  117,  117,  117,  117,  897,
			  430,  897,  117,  897,  897,  897,  117,  435,  897,  117,

			  897,  436,  436,  436,  436,  436,  399,  399,  399,  399,
			  399,  117,  897,  897,  897,  117,  897,  897,  897,  437,
			  437,  437,  437,  437,  601,  849,  601,  849,  117,  117,
			  897,  117,  897,  117,  602,  850,  897,  438,  438,  438,
			  438,  438,  484,  117,  897,  897,  897,  435,  157,  117,
			  440,  117,  441,  897,  897,  439,  439,  439,  439,  439,
			  117,  117,  603,  851,  897,  435,  897,  117,  897,  117,
			  484,  897,  442,  897,  897,  443,  157,  773,  117,  117,
			  897,  444,  897,  435,  897,  117,  117,  117,  117,  117,
			  117,  696,  117,  897,  773,  897,  117,  117,  773,  117,

			  442,  446,  696,  443,  117,  303,  117,  445,  117,  444,
			  117,  897,  697,  117,  117,  117,  897,  897,  897,  897,
			  117,  897,  773,  157,  117,  897,  117,  117,  897,  157,
			  696,  117,  117,  303,  117,  445,  897,  117,  117,  897,
			  117,  447,  448,  897,  117,  117,  449,  117,  117,  897,
			  117,  157,  897,  897,  117,  117,  117,  157,  897,  117,
			  897,  897,  117,  897,  117,  157,  897,  117,  117,  447,
			  448,  157,  897,  117,  449,  897,  117,  897,  117,  117,
			  117,  117,  897,  117,  897,  117,  897,  117,  450,  117,
			  496,  451,  117,  157,  897,  117,  897,  897,  897,  157,

			  453,  117,  453,  453,  453,  453,  453,  312,  897,  117,
			  897,  460,  117,  461,  461,  461,  461,  461,  117,  454,
			  451,  454,  454,  454,  454,  454,  312,  157,  157,  764,
			  765,  764,  765,  157,  157,  471,  323,  458,  324,  324,
			  324,  324,  324,  269,  897,  157,  157,  157,  157,  157,
			  897,  157,  897,  897,  897,  157,  157,  157,  268,  269,
			  457,  157,  157,  471,  157,  458,  322,  766,  897,  897,
			  157,  269,  157,  157,  157,  157,  157,  157,  467,  157,
			  157,  268,  269,  897,  458,  157,  157,  897,  462,  322,
			  464,  897,  157,  897,  897,  157,  897,  518,  157,  269,

			  163,  157,  157,  157,  157,  157,  467,  464,  157,  897,
			  696,  157,  463,  470,  157,  466,  777,  157,  464,  897,
			  777,  698,  269,  163,  157,  157,  157,  157,  157,  897,
			  157,  699,  875,  897,  875,  465,  157,  777,  897,  157,
			  897,  470,  876,  468,  472,  157,  897,  897,  777,  698,
			  269,  467,  157,  157,  157,  157,  157,  269,  157,  157,
			  157,  157,  157,  157,  157,  897,  897,  470,  897,  897,
			  877,  269,  472,  157,  157,  157,  157,  157,  157,  469,
			  882,  882,  882,  882,  157,  269,  472,  157,  157,  157,
			  157,  157,  476,  471,  269,  473,  157,  157,  157,  157,

			  157,  157,  317,  157,  897,  883,  157,  157,  413,  157,
			  479,  157,  157,  425,  475,  776,  897,  157,  480,  778,
			  476,  474,  883,  476,  425,  477,  883,  897,  897,  157,
			  897,  157,  897,  897,  425,  157,  778,  157,  479,  157,
			  502,  502,  502,  502,  502,  157,  480,  778,  897,  897,
			  883,  478,  425,  269,  897,  157,  157,  157,  157,  157,
			  269,  897,  157,  157,  157,  157,  157,  897,  269,  897,
			  157,  157,  157,  157,  157,  479,  897,  897,  503,  157,
			  897,  897,  480,  484,  269,  157,  157,  157,  157,  157,
			  157,  157,  117,  487,  897,  486,  269,  157,  157,  157,

			  157,  157,  157,  482,  520,  897,  117,  157,  117,  897,
			  483,  485,  269,  157,  157,  157,  157,  157,  157,  157,
			  117,  487,  157,  486,  157,  157,  491,  486,  157,  487,
			  157,  490,  520,  897,  897,  897,  269,  117,  157,  157,
			  157,  157,  157,  269,  897,  157,  157,  157,  157,  157,
			  157,  897,  157,  897,  491,  488,  157,  489,  157,  490,
			  490,  269,  157,  157,  157,  157,  157,  157,  157,  157,
			  494,  897,  897,  157,  494,  157,  897,  897,  491,  563,
			  897,  269,  495,  157,  157,  157,  157,  157,  492,  269,
			  157,  157,  157,  157,  157,  157,  157,  157,  497,  157,

			  897,  157,  494,  157,  897,  157,  493,  563,  897,  495,
			  495,  269,  897,  157,  157,  157,  157,  157,  499,  269,
			  897,  157,  157,  157,  157,  157,  897,  157,  897,  496,
			  897,  897,  897,  157,  897,  897,  897,  498,  383,  384,
			  897,  383,  504,  504,  504,  504,  504,  499,  897,  897,
			  385,  897,  897,  499,  390,  391,  391,  391,  391,  391,
			  386,  506,  506,  506,  506,  506,  507,  507,  507,  507,
			  507,  508,  897,  508,  897,  897,  509,  509,  509,  509,
			  509,  404,  500,  510,  510,  510,  510,  510,  897,  897,
			  387,  407,  407,  407,  407,  407,  511,  511,  511,  511,

			  511,  897,  897,  897,  405,  897,  897,  513,  514,  404,
			  515,  515,  515,  515,  515,  516,  516,  516,  516,  516,
			  517,  517,  517,  517,  517,  897,  897,  897,  897,  897,
			  897,  777,  897,  897,  512,  779,  897,  897,  897,  897,
			  117,  117,  897,  897,  117,  117,  524,  897,  117,  523,
			  897,  117,  779,  522,  117,  117,  521,  117,  117,  117,
			  117,  117,  117,  779,  117,  117,  525,  117,  117,  117,
			  897,  897,  117,  117,  524,  897,  117,  523,  897,  117,
			  897,  522,  897,  897,  884,  521,  117,  897,  897,  117,
			  117,  897,  897,  117,  525,  117,  117,  897,  117,  527, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  528,  884,  117,  117,  897,  884,  117,  530,  897,  526,
			  897,  117,  117,  897,  117,  897,  117,  117,  117,  117,
			  117,  531,  117,  117,  897,  117,  117,  527,  528,  884,
			  117,  117,  897,  532,  117,  530,  897,  526,  897,  117,
			  117,  117,  897,  117,  897,  897,  897,  117,  117,  531,
			  897,  117,  897,  117,  540,  540,  540,  540,  540,  117,
			  117,  532,  897,  533,  413,  157,  897,  117,  897,  544,
			  117,  157,  534,  117,  117,  117,  117,  897,  556,  535,
			  544,  117,  897,  117,  897,  897,  897,  117,  117,  897,
			  544,  533,  897,  157,  897,  117,  897,  897,  897,  157,

			  534,  897,  897,  897,  117,  117,  556,  535,  544,  897,
			  897,  897,  117,  432,  432,  432,  432,  432,  269,  897,
			  433,  433,  433,  433,  433,  270,  157,  434,  434,  434,
			  434,  434,  157,  897,  897,  436,  436,  436,  436,  436,
			  536,  117,  437,  437,  437,  437,  437,  537,  538,  897,
			  897,  897,  117,  117,  157,  117,  294,  117,  897,  117,
			  157,  117,  897,  438,  438,  438,  438,  438,  536,  117,
			  897,  897,  297,  897,  897,  537,  538,  539,  897,  897,
			  117,  117,  887,  117,  294,  897,  117,  518,  117,  117,
			  897,  117,  732,  117,  439,  439,  439,  439,  439,  887,

			  697,  297,  897,  887,  836,  539,  541,  541,  541,  541,
			  541,  699,  837,  897,  542,  542,  542,  542,  542,  897,
			  897,  699,  117,  897,  897,  837,  117,  887,  117,  897,
			  897,  897,  543,  543,  543,  543,  543,  866,  117,  699,
			  837,  157,  117,  564,  117,  897,  117,  157,  866,  897,
			  897,  897,  117,  897,  117,  117,  117,  897,  866,  897,
			  117,  897,  117,  897,  117,  117,  117,  897,  546,  157,
			  897,  564,  117,  117,  117,  157,  866,  897,  117,  117,
			  117,  117,  117,  117,  117,  897,  117,  545,  117,  897,
			  897,  117,  117,  117,  897,  897,  546,  549,  897,  897,

			  117,  547,  897,  897,  117,  890,  891,  890,  891,  117,
			  117,  897,  548,  117,  117,  545,  897,  117,  117,  453,
			  117,  453,  453,  453,  453,  453,  312,  897,  117,  547,
			  117,  454,  117,  454,  454,  454,  454,  454,  312,  157,
			  548,  897,  117,  892,  897,  157,  897,  845,  558,  117,
			  558,  558,  558,  558,  558,  845,  557,  553,  460,  117,
			  460,  460,  460,  460,  460,  897,  897,  157,  845,  554,
			  897,  897,  323,  157,  461,  461,  461,  461,  461,  270,
			  897,  897,  897,  845,  269,  557,  157,  157,  157,  157,
			  157,  269,  157,  157,  157,  157,  157,  157,  157,  591,

			  591,  591,  591,  591,  269,  561,  157,  157,  157,  157,
			  157,  897,  556,  269,  897,  157,  157,  157,  157,  157,
			  157,  897,  897,  557,  897,  269,  157,  157,  157,  157,
			  157,  157,  561,  561,  563,  157,  897,  503,  157,  897,
			  559,  157,  564,  269,  157,  157,  157,  157,  157,  157,
			  897,  567,  560,  568,  592,  592,  592,  592,  592,  157,
			  562,  571,  565,  157,  897,  157,  157,  897,  897,  157,
			  566,  269,  157,  157,  157,  157,  157,  157,  897,  567,
			  269,  568,  157,  157,  157,  157,  157,  157,  572,  571,
			  157,  897,  897,  157,  897,  269,  157,  157,  157,  157,

			  157,  157,  567,  157,  897,  157,  897,  897,  157,  574,
			  568,  157,  571,  897,  157,  897,  572,  576,  157,  897,
			  897,  575,  897,  269,  157,  157,  157,  157,  157,  157,
			  569,  157,  897,  157,  897,  897,  157,  574,  570,  157,
			  573,  157,  157,  897,  574,  576,  579,  157,  269,  575,
			  157,  157,  157,  157,  157,  897,  269,  157,  157,  157,
			  157,  157,  157,  157,  897,  157,  897,  157,  897,  157,
			  581,  157,  577,  157,  579,  157,  579,  897,  582,  575,
			  897,  897,  897,  897,  269,  157,  157,  157,  157,  157,
			  157,  157,  897,  157,  157,  157,  897,  897,  581,  157,

			  157,  157,  157,  897,  580,  897,  582,  578,  157,  897,
			  897,  269,  581,  157,  157,  157,  157,  157,  585,  897,
			  897,  269,  157,  157,  157,  157,  157,  157,  157,  269,
			  157,  157,  157,  157,  157,  157,  157,  157,  586,  582,
			  583,  897,  587,  157,  157,  897,  585,  549,  897,  897,
			  157,  897,  269,  588,  157,  157,  157,  157,  157,  897,
			  897,  897,  897,  157,  897,  157,  586,  584,  897,  157,
			  587,  157,  157,  397,  397,  397,  397,  397,  157,  897,
			  897,  588,  269,  585,  157,  157,  157,  157,  157,  549,
			  269,  157,  157,  157,  157,  157,  157,  157,  586,  593,

			  897,  593,  593,  593,  593,  593,  594,  594,  594,  594,
			  594,  589,  509,  509,  509,  509,  509,  897,  897,  897,
			  897,  404,  897,  897,  897,  897,  590,  595,  595,  595,
			  595,  595,  597,  597,  597,  597,  597,  598,  598,  598,
			  598,  598,  897,  897,  405,  897,  897,  897,  897,  404,
			  599,  599,  599,  599,  599,  594,  594,  594,  594,  594,
			  117,  897,  897,  117,  514,  596,  515,  515,  515,  515,
			  515,  897,  897,  897,  117,  512,  117,  117,  897,  117,
			  897,  897,  897,  897,  897,  897,  610,  607,  117,  157,
			  897,  117,  157,  117,  608,  157,  117,  611,  157,  897,

			  117,  642,  117,  897,  609,  117,  897,  117,  117,  117,
			  117,  117,  117,  117,  610,  897,  897,  157,  897,  897,
			  157,  117,  608,  157,  117,  611,  157,  897,  897,  642,
			  897,  117,  609,  117,  612,  897,  897,  897,  117,  888,
			  897,  117,  117,  117,  897,  897,  613,  117,  897,  117,
			  897,  801,  117,  897,  897,  801,  888,  117,  614,  117,
			  888,  117,  612,  117,  616,  897,  117,  897,  117,  897,
			  897,  117,  801,  897,  613,  157,  897,  117,  117,  117,
			  117,  157,  617,  801,  888,  117,  614,  897,  117,  897,
			  897,  117,  616,  897,  897,  897,  117,  117,  117,  117,

			  897,  117,  897,  157,  117,  618,  897,  897,  117,  157,
			  617,  157,  643,  117,  897,  117,  620,  157,  117,  897,
			  117,  897,  117,  897,  897,  897,  897,  117,  897,  117,
			  117,  117,  117,  618,  619,  157,  117,  640,  117,  157,
			  643,  157,  897,  117,  620,  157,  897,  897,  897,  117,
			  117,  897,  621,  621,  621,  621,  621,  117,  897,  897,
			  117,  897,  619,  157,  897,  640,  117,  117,  897,  157,
			  897,  435,  897,  117,  540,  540,  540,  540,  540,  897,
			  117,  897,  117,  897,  269,  117,  541,  541,  541,  541,
			  541,  270,  897,  269,  117,  157,  157,  157,  157,  157, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  897,  622,  117,  543,  543,  543,  543,  543,  897,  897,
			  897,  117,  440,  623,  441,  897,  542,  542,  542,  542,
			  542,  897,  897,  897,  117,  897,  897,  897,  897,  622,
			  117,  625,  897,  897,  117,  897,  897,  443,  897,  897,
			  117,  623,  897,  444,  117,  897,  117,  897,  897,  628,
			  117,  626,  117,  897,  117,  157,  117,  897,  117,  625,
			  117,  157,  117,  157,  117,  443,  117,  897,  117,  157,
			  652,  444,  627,  867,  117,  117,  117,  628,  117,  626,
			  638,  897,  897,  157,  867,  117,  897,  897,  117,  157,
			  897,  157,  897,  897,  867,  117,  897,  157,  652,  897,

			  627,  897,  897,  897,  558,  117,  558,  558,  558,  558,
			  558,  269,  867,  157,  157,  157,  157,  157,  269,  897,
			  157,  157,  157,  157,  157,  269,  157,  157,  157,  157,
			  157,  157,  157,  897,  269,  640,  157,  157,  157,  157,
			  157,  897,  639,  897,  897,  681,  157,  646,  117,  642,
			  643,  638,  157,  157,  157,  647,  897,  897,  897,  157,
			  157,  897,  117,  641,  117,  897,  269,  648,  157,  157,
			  157,  157,  157,  681,  157,  646,  117,  644,  645,  157,
			  157,  157,  646,  647,  897,  157,  269,  157,  157,  157,
			  157,  157,  157,  117,  269,  648,  157,  157,  157,  157,

			  157,  897,  157,  647,  653,  157,  654,  157,  157,  897,
			  649,  157,  897,  157,  897,  648,  897,  897,  269,  897,
			  157,  157,  157,  157,  157,  669,  669,  669,  669,  669,
			  157,  650,  653,  157,  654,  653,  157,  897,  897,  157,
			  897,  897,  269,  651,  157,  157,  157,  157,  157,  157,
			  157,  657,  660,  802,  157,  157,  157,  802,  654,  157,
			  157,  897,  897,  655,  269,  157,  157,  157,  157,  157,
			  157,  897,  659,  897,  802,  897,  897,  157,  157,  657,
			  660,  657,  157,  157,  157,  802,  656,  157,  157,  897,
			  897,  897,  269,  157,  157,  157,  157,  157,  157,  269,

			  659,  157,  157,  157,  157,  157,  157,  897,  663,  658,
			  801,  157,  157,  664,  803,  157,  660,  157,  157,  157,
			  659,  157,  897,  897,  157,  157,  897,  706,  665,  666,
			  897,  803,  897,  897,  157,  897,  663,  897,  897,  157,
			  157,  664,  803,  157,  662,  157,  157,  157,  661,  157,
			  897,  897,  157,  157,  897,  706,  665,  666,  269,  897,
			  157,  157,  157,  157,  157,  269,  157,  157,  157,  157,
			  157,  157,  157,  897,  593,  663,  593,  593,  593,  593,
			  593,  897,  664,  594,  594,  594,  594,  594,  897,  672,
			  672,  672,  672,  672,  157,  897,  897,  897,  671,  897,

			  157,  897,  897,  667,  673,  673,  673,  673,  673,  897,
			  668,  897,  670,  674,  674,  674,  674,  674,  675,  675,
			  675,  675,  675,  897,  897,  897,  671,  596,  676,  676,
			  676,  676,  676,  677,  677,  677,  677,  677,  679,  679,
			  679,  679,  679,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  263,  897,  157,  682,  897,  117,  117,
			  897,  157,  117,  117,  683,  897,  117,  897,  897,  710,
			  897,  897,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  263,  117,  157,  682,  117,  117,  117,  897,  157,
			  117,  117,  683,  684,  117,  897,  897,  710,  897,  117,

			  897,  117,  732,  117,  117,  897,  872,  117,  117,  897,
			  117,  117,  897,  117,  845,  117,  685,  872,  897,  897,
			  897,  684,  846,  897,  117,  897,  117,  872,  687,  117,
			  117,  117,  897,  117,  688,  846,  897,  897,  117,  897,
			  897,  897,  897,  117,  685,  872,  702,  117,  157,  117,
			  846,  117,  117,  690,  157,  117,  687,  691,  897,  897,
			  117,  117,  688,  897,  689,  117,  117,  117,  117,  897,
			  897,  117,  897,  117,  702,  897,  157,  897,  117,  117,
			  117,  690,  157,  897,  117,  691,  621,  621,  621,  621,
			  621,  897,  689,  157,  897,  897,  117,  117,  117,  157,

			  117,  897,  117,  897,  117,  897,  117,  117,  694,  117,
			  695,  701,  117,  701,  701,  701,  701,  701,  693,  897,
			  117,  157,  117,  117,  117,  117,  117,  157,  897,  117,
			  897,  897,  117,  897,  117,  117,  694,  117,  695,  269,
			  897,  157,  157,  157,  157,  157,  693,  157,  703,  705,
			  157,  117,  897,  157,  117,  117,  157,  268,  269,  591,
			  591,  591,  591,  591,  269,  322,  157,  157,  157,  157,
			  157,  703,  897,  897,  897,  157,  703,  705,  157,  897,
			  897,  157,  897,  157,  157,  269,  897,  157,  157,  157,
			  157,  157,  269,  897,  157,  157,  157,  157,  157,  704,

			  897,  269,  705,  157,  157,  157,  157,  157,  157,  897,
			  897,  163,  897,  897,  157,  709,  706,  157,  897,  711,
			  897,  897,  269,  157,  157,  157,  157,  157,  157,  269,
			  707,  157,  157,  157,  157,  157,  157,  897,  897,  711,
			  157,  897,  157,  709,  708,  157,  157,  711,  897,  721,
			  157,  157,  716,  897,  714,  157,  157,  897,  710,  269,
			  873,  157,  157,  157,  157,  157,  897,  713,  157,  157,
			  717,  873,  897,  897,  157,  157,  897,  721,  157,  897,
			  716,  873,  714,  157,  157,  897,  712,  269,  714,  157,
			  157,  157,  157,  157,  897,  157,  722,  157,  717,  873,

			  157,  157,  897,  157,  716,  269,  157,  157,  157,  157,
			  157,  157,  897,  720,  897,  897,  715,  897,  897,  897,
			  897,  717,  897,  157,  722,  897,  802,  897,  157,  157,
			  804,  897,  718,  269,  157,  157,  157,  157,  157,  157,
			  269,  720,  157,  157,  157,  157,  157,  804,  724,  719,
			  724,  897,  897,  725,  725,  725,  725,  725,  804,  725,
			  725,  725,  725,  725,  897,  897,  897,  897,  720,  726,
			  726,  726,  726,  726,  598,  598,  598,  598,  598,  729,
			  729,  729,  729,  729,  730,  730,  730,  730,  730,  731,
			  731,  731,  731,  731,  897,  897,  723,  596,  897,  897,

			  897,  897,  897,  897,  727,  897,  897,  897,  897,  117,
			  117,  897,  897,  897,  117,  117,  734,  897,  897,  735,
			  117,  733,  897,  117,  117,  117,  117,  405,  117,  117,
			  117,  117,  727,  897,  117,  897,  117,  117,  117,  897,
			  897,  897,  117,  117,  734,  157,  897,  735,  117,  733,
			  117,  157,  749,  897,  117,  117,  117,  157,  897,  117,
			  117,  117,  897,  157,  117,  117,  117,  897,  897,  897,
			  117,  897,  117,  157,  897,  117,  897,  117,  117,  157,
			  749,  897,  117,  117,  117,  157,  117,  739,  897,  117,
			  737,  157,  897,  897,  897,  117,  117,  117,  117,  117, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  117,  117,  897,  897,  897,  117,  897,  117,  897,
			  117,  117,  740,  897,  117,  739,  897,  897,  737,  117,
			  741,  897,  117,  751,  117,  897,  157,  117,  117,  157,
			  897,  117,  157,  117,  897,  117,  117,  897,  897,  701,
			  740,  701,  701,  701,  701,  701,  157,  117,  741,  897,
			  157,  751,  157,  117,  157,  897,  157,  157,  897,  748,
			  157,  897,  897,  269,  117,  157,  157,  157,  157,  157,
			  897,  897,  897,  157,  157,  897,  897,  747,  157,  157,
			  157,  897,  897,  897,  157,  749,  269,  748,  157,  157,
			  157,  157,  157,  269,  897,  157,  157,  157,  157,  157,

			  269,  157,  157,  157,  157,  157,  157,  157,  751,  897,
			  897,  897,  269,  750,  157,  157,  157,  157,  157,  157,
			  897,  897,  897,  897,  269,  157,  157,  157,  157,  157,
			  157,  157,  157,  897,  897,  897,  752,  157,  157,  269,
			  753,  157,  157,  157,  157,  157,  269,  157,  157,  157,
			  157,  157,  157,  157,  897,  157,  157,  755,  757,  157,
			  157,  157,  157,  753,  157,  157,  157,  897,  753,  756,
			  157,  269,  897,  157,  157,  157,  157,  157,  725,  725,
			  725,  725,  725,  157,  157,  755,  757,  897,  755,  157,
			  157,  754,  157,  897,  897,  897,  897,  756,  157,  725,

			  725,  725,  725,  725,  759,  759,  759,  759,  759,  897,
			  897,  897,  760,  897,  760,  897,  758,  761,  761,  761,
			  761,  761,  763,  763,  763,  763,  763,  767,  767,  767,
			  767,  767,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  727,  897,  781,  897,  769,  117,  117,  897,
			  157,  772,  117,  770,  897,  117,  771,  897,  897,  897,
			  897,  117,  117,  117,  117,  405,  117,  897,  117,  117,
			  727,  117,  781,  774,  769,  117,  117,  897,  157,  772,
			  117,  770,  117,  117,  771,  897,  897,  117,  897,  117,
			  897,  897,  117,  117,  897,  897,  117,  117,  117,  897,

			  117,  774,  157,  117,  775,  157,  897,  784,  782,  897,
			  117,  157,  761,  761,  761,  761,  761,  117,  117,  117,
			  269,  897,  157,  157,  157,  157,  157,  117,  786,  897,
			  157,  117,  775,  157,  157,  784,  782,  897,  897,  157,
			  269,  782,  157,  157,  157,  157,  157,  897,  117,  269,
			  897,  157,  157,  157,  157,  157,  786,  784,  897,  157,
			  788,  157,  157,  789,  786,  157,  157,  157,  897,  783,
			  897,  897,  157,  897,  269,  897,  157,  157,  157,  157,
			  157,  897,  897,  897,  897,  785,  897,  157,  788,  157,
			  788,  789,  787,  157,  157,  157,  897,  897,  897,  897,

			  157,  791,  791,  791,  791,  791,  792,  792,  792,  792,
			  792,  603,  603,  603,  603,  603,  897,  897,  790,  793,
			  793,  793,  793,  793,  794,  794,  794,  794,  794,  795,
			  795,  795,  795,  795,  897,  897,  897,  897,  897,  596,
			  897,  897,  897,  897,  727,  897,  897,  897,  897,  117,
			  117,  897,  157,  797,  897,  117,  897,  897,  157,  897,
			  117,  799,  897,  117,  798,  117,  117,  405,  897,  117,
			  897,  117,  727,  897,  117,  897,  117,  117,  117,  897,
			  157,  797,  897,  117,  897,  117,  157,  157,  117,  799,
			  117,  157,  798,  157,  117,  117,  806,  157,  897,  117,

			  117,  117,  897,  897,  800,  117,  117,  897,  157,  897,
			  897,  897,  897,  117,  157,  157,  897,  897,  117,  157,
			  897,  157,  897,  807,  806,  157,  897,  897,  897,  897,
			  117,  157,  800,  809,  897,  117,  157,  157,  897,  897,
			  897,  269,  157,  157,  157,  157,  157,  157,  897,  897,
			  269,  807,  157,  157,  157,  157,  157,  157,  897,  157,
			  897,  809,  897,  157,  269,  157,  157,  157,  157,  157,
			  157,  807,  811,  269,  157,  157,  157,  157,  157,  157,
			  157,  809,  897,  897,  897,  157,  759,  759,  759,  759,
			  759,  157,  813,  813,  813,  813,  813,  897,  897,  808,

			  811,  897,  157,  897,  897,  764,  897,  764,  157,  810,
			  794,  794,  794,  794,  794,  795,  795,  795,  795,  795,
			  897,  117,  816,  897,  596,  897,  830,  830,  830,  830,
			  830,  897,  897,  897,  897,  117,  897,  117,  897,  897,
			  117,  897,  157,  766,  823,  897,  897,  117,  157,  117,
			  816,  117,  897,  897,  117,  897,  117,  897,  817,  897,
			  818,  117,  897,  117,  897,  117,  117,  117,  117,  819,
			  157,  157,  823,  897,  897,  117,  157,  157,  269,  117,
			  157,  157,  157,  157,  157,  117,  897,  817,  818,  157,
			  824,  897,  117,  897,  157,  157,  117,  897,  819,  157,

			  157,  897,  897,  826,  269,  157,  157,  157,  157,  157,
			  157,  897,  824,  828,  897,  897,  897,  157,  897,  824,
			  897,  897,  157,  157,  897,  897,  897,  897,  157,  117,
			  117,  826,  157,  826,  897,  117,  897,  897,  157,  897,
			  117,  825,  828,  833,  117,  117,  117,  897,  897,  117,
			  834,  117,  897,  897,  117,  897,  117,  117,  117,  897,
			  157,  827,  897,  117,  157,  897,  157,  897,  117,  897,
			  157,  833,  897,  897,  117,  117,  897,  897,  834,  838,
			  117,  897,  897,  897,  269,  117,  157,  157,  157,  157,
			  157,  269,  157,  157,  157,  157,  157,  157,  157,  157,

			  840,  840,  840,  840,  840,  157,  897,  838,  897,  897,
			  839,  766,  766,  766,  766,  766,  841,  841,  841,  841,
			  841,  117,  157,  897,  157,  157,  897,  157,  157,  897,
			  157,  157,  897,  157,  897,  117,  858,  117,  839,  842,
			  897,  117,  843,  847,  897,  157,  897,  848,  897,  117,
			  157,  157,  157,  157,  897,  117,  157,  117,  157,  157,
			  897,  897,  897,  897,  858,  897,  117,  897,  842,  117,
			  843,  897,  847,  157,  897,  848,  897,  897,  897,  157,
			  897,  897,  852,  897,  853,  854,  117,  841,  841,  841,
			  841,  841,  117,  117,  859,  859,  859,  859,  859,  157,

			  897,  868,  855,  897,  897,  157,  117,  117,  117,  117,
			  861,  861,  861,  861,  861,  864,  864,  864,  864,  864,
			  117,  117,  897,  897,  897,  897,  897,  157,  897,  868,
			  855,  897,  897,  157,  897,  897,  897,  117,  117,  897,
			  117,  865,  869,  869,  869,  869,  869,  870,  870,  870,
			  870,  870,  897,  897,  117,  897,  117,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  862,  117,  865,
			  852,  897,  853,  871,  897,  864,  864,  864,  864,  864,
			  897,  157,  897,  897,  897,  117,  117,  157,  874,  874,
			  874,  874,  874,  878,  878,  878,  878,  878,  897,  897, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  897,  117,  851,  851,  851,  851,  851,  897,  157,
			  897,  897,  897,  897,  117,  157,  881,  881,  881,  881,
			  881,  852,  897,  853,  897,  897,  878,  878,  878,  878,
			  878,  117,  885,  885,  885,  885,  885,  886,  886,  886,
			  886,  886,  889,  889,  889,  889,  889,  877,  877,  877,
			  877,  877,  893,  893,  893,  893,  893,  894,  894,  894,
			  894,  894,  895,  895,  895,  895,  895,  890,  897,  890,
			  897,  897,  894,  894,  894,  894,  894,  896,  896,  896,
			  896,  896,  892,  892,  892,  892,  892,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  316,  316,  316,  316,

			  316,  316,  316,  316,  316,  892,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   98,   98,  897,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,  897,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,  100,  100,  897,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  108,  746,  746,  746,  746,  746,  746,  746,  746,

			  746,  897,  897,  897,  897,  897,  897,  897,  897,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  117,  117,
			  117,  897,  897,  897,  897,  897,  897,  117,  117,  897,
			  117,  897,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  897,  897,  897,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  150,  150,  897,  150,  897,  150,  150,
			  897,  897,  897,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  897,  897,  897,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  152,  152,  897,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,

			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  211,  211,  897,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  897,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  225,  225,  225,  225,  225,

			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  231,  897,  231,  897,  897,  897,  897,  231,
			  897,  231,  231,  897,  897,  897,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  897,  897,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,

			  238,  238,  238,  238,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  245,  245,  897,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  103,  897,
			  897,  897,  103,  103,  897,  897,  897,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  897,  897,  897,  103,

			  103,  103,  103,  103,  103,  103,  103,  103,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  108,  108,  108,  897,  897,
			  897,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  897,  897,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  271,  897,  897,  271,  271,  897,  271,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  897,
			  897,  897,  271,  271,  271,  271,  271,  271,  271,  271,

			  271,  157,  897,  157,  897,  157,  897,  897,  157,  157,
			  157,  157,  157,  897,  897,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  897,  897,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  897,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,

			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  244,  244,  244,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  244,  411,  411,  897,  897,
			  897,  411,  411,  411,  411,  411,  411,  411,  411,  411,
			  897,  897,  897,  411,  411,  411,  411,  411,  411,  411,
			  411,  411,  412,  412,  897,  897,  897,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  897,  897,  897,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  316,  316, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  316,  897,  897,  897,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  897,  897,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  382,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  897,  897,  897,  519,  519,  519,  519,  519,  519,
			  519,  519,  519,  552,  897,  552,  897,  897,  897,  897,
			  552,  897,  552,  552,  897,  897,  897,  552,  552,  552,

			  552,  552,  552,  552,  552,  552,  897,  897,  897,  552,
			  552,  552,  552,  552,  552,  552,  552,  552,  456,  456,
			  456,  897,  897,  456,  456,  456,  456,  456,  456,  456,
			  456,  897,  897,  456,  456,  456,  456,  456,  456,  456,
			  456,  456,  897,  897,  897,  456,  456,  456,  456,  456,
			  456,  456,  456,  456,  605,  605,  605,  605,  605,  605,
			  605,  605,  605,  897,  897,  897,  605,  605,  605,  605,
			  605,  605,  605,  605,  605,  606,  606,  897,  897,  897,
			  606,  606,  606,  606,  606,  606,  606,  606,  606,  897,
			  897,  897,  606,  606,  606,  606,  606,  606,  606,  606,

			  606,  632,  897,  632,  897,  897,  897,  897,  632,  897,
			  632,  632,  897,  897,  897,  632,  632,  632,  632,  632,
			  632,  632,  632,  632,  897,  897,  632,  632,  632,  632,
			  632,  632,  632,  632,  632,  632,  680,  680,  897,  897,
			  897,  680,  680,  680,  680,  680,  680,  680,  680,  680,
			  897,  897,  897,  680,  680,  680,  680,  680,  680,  680,
			  680,  680,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,  897,  897,  897,  768,  768,  768,  768,  768,  768,
			  768,  768,  768,  746,  897,  897,  897,  746,  746,  897,
			  897,  897,  746,  746,  746,  746,  746,  746,  746,  746,

			  746,  897,  897,  897,  746,  746,  746,  746,  746,  746,
			  746,  746,  746,  796,  796,  897,  897,  897,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  897,  897,  897,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  831,
			  831,  897,  897,  897,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  897,  897,  897,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,   11,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897, yy_Dummy>>,
			1, 457, 7000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7456)
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
			   25,  108,   27,   76,   27,  316,   27,   27,   27,   27,
			   27,   38,   38,   63,   38,  873,  321,  142,    5,    5,
			    6,    6,   28,   64,   28,   63,   28,   28,   28,   28,
			   28,  321,    3,   18,   38,   64,  108,    4,  872,    9,
			  316,   63,  863,   10,   27,   74,  142,   74,   74,   76,
			   92,   64,   95,   63,   95,   95,  109,  109,  109,  109,
			  109,  853,  235,   64,   28,  235,    3,    3,    3,    3,
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
			   35,   36,   36,  238,   36,  845,   78,   37,   37,  143,
			   37,   68,   77,   40,   40,  844,   40,  815,   39,   39,

			   35,   39,   41,   41,   36,   41,  804,   68,  379,   35,
			   37,   79,   36,   35,   37,   35,   40,  143,  373,   68,
			   40,   39,  322,   37,  213,   41,  213,  213,  322,   80,
			   42,   42,   40,   42,   39,   69,   41,   35,  238,  412,
			   36,   35,   37,   35,  379,   39,  412,   69,   40,   43,
			   43,   37,   43,   42,   44,   44,   69,   44,   45,   45,
			   40,   45,   39,   69,   41,   78,  792,   42,   42,   77,
			   77,   77,   43,   42,   39,   69,   43,   44,  759,   50,
			   50,   45,   50,   49,   49,   69,   49,   45,   79,   79,
			   79,   47,   47,   44,   47,   42,   42,  373,  747,   82,

			   45,   42,   50,   81,   43,   84,   49,   80,   80,  237,
			   87,  401,  237,   87,   47,   45,  154,   48,   48,  154,
			   48,   44,   49,  746,  154,   47,  401,   50,   45,   46,
			   46,  699,   46,   47,   82,   82,  385,  385,  151,  385,
			   48,   84,   84,  801,   46,   46,   46,   46,   46,   46,
			   49,   61,   46,   47,  217,   48,   50,  698,   61,   46,
			   48,   47,   87,   61,   56,   56,   46,   85,  697,   56,
			  555,   56,  517,   46,  151,   46,  696,   46,  221,   61,
			   81,   81,   81,   48,  801,  555,   61,   46,   48,  151,
			   56,   61,   56,   56,   46,  116,  116,   56,  116,   56,

			  796,  796,   85,   85,   46,   56,   46,   55,   89,  218,
			   55,   89,  517,  221,  221,   55,  386,  386,  116,  386,
			   89,   89,   55,   55,   55,   55,   55,   55,   55,  680,
			   89,  217,  217,  217,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,  812,  812,
			   89,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   57,  218,  218,  218,   58,
			   57,  831,  831,   58,   57,   58,   57,  112,  112,  112,

			  112,  112,  253,  253,   90,  253,  165,   90,  165,  165,
			  165,  165,  165,   57,   58,   57,   90,   58,   57,  676,
			  670,   58,   57,   58,   57,  253,   90,   59,  639,   58,
			   57,   59,  537,   59,  623,   60,  165,  219,   62,  537,
			   60,  623,   59,  182,   60,  624,   60,   60,   62,   62,
			   62,  182,   59,  606,   62,   59,   90,  182,   65,   59,
			   65,   59,  846,   60,  165,   60,   62,   59,   60,  846,
			   65,   59,   60,   65,   60,   60,   62,   62,   62,  182,
			   60,   67,   62,  178,   66,  182,   65,  224,   65,  178,
			  178,   66,   67,   67,  598,  591,   66,   67,   65,   66,

			  113,   65,  113,  529,  113,  113,  113,  113,  113,   67,
			  513,  178,   66,  220,  219,  219,  219,  178,  178,   66,
			   67,   67,  224,  224,   66,   67,  506,   66,   93,   93,
			  455,   93,  632,  183,  102,  183,  183,  183,  183,  183,
			  183,  414,  113,  102,  102,  102,  102,  102,  254,  230,
			  254,  254,  230,   93,  411,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,  102,  106,
			  106,  106,  106,  106,  632,  110,  110,  110,  110,  110,
			  220,  220,  220,  102,  106,  243,  243,  102,  243,  102,

			  110,  230,  387,  452,  375,  111,  452,  111,   93,  111,
			  111,  111,  111,  111,  111,  382,  803,  106,  117,  117,
			  243,  117,  106,  119,  119,  381,  119,  803,  110,  317,
			  372,  117,  117,  312,  185,  550,  119,  119,  550,  117,
			  185,  117,  120,  120,  119,  120,  119,  111,  166,  271,
			  166,  166,  166,  166,  166,  120,  120,  803,  121,  121,
			  270,  121,  185,  120,  225,  120,  260,  119,  185,  259,
			  166,  121,  121,  122,  122,  252,  122,  251,  120,  121,
			  250,  121,  375,  375,  249,  194,  122,  122,  121,  123,
			  123,  194,  123,  247,  122,  119,  122,  242,  166,  233,

			  225,  225,  123,  123,  228,  122,  120,  372,  372,  372,
			  123,  226,  123,  194,  124,  124,  121,  124,  169,  194,
			  169,  169,  169,  169,  169,  145,  223,  124,  124,  125,
			  125,  123,  125,  122,  211,  124,  169,  124,  388,  388,
			  145,  388,  125,  125,  126,  126,  162,  126,  127,  127,
			  125,  127,  125,  124,  145,  145,  145,  126,  126,  123,
			  158,  127,  127,  388,  169,  126,  397,  126,  145,  127,
			  155,  127,  125,  126,  128,  128,  152,  128,  227,  126,
			  150,  124,  303,  145,  127,  145,  137,  128,  128,  397,
			  129,  129,  105,  129,  397,  128,  303,  128,  303,  104, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  125,  126,  103,  129,  129,  130,  130,  126,  130,  100,
			  303,  129,  127,  129,  227,  227,  128,   98,  130,  130,
			  131,  131,  554,  131,   96,  554,  130,  303,  130,  265,
			  265,  265,  265,  131,  131,   88,   73,  132,  132,  636,
			  132,  131,  636,  131,  128,  130,  554,  636,   70,  131,
			  132,  132,  283,  133,  133,   54,  133,  283,  132,  167,
			  132,  167,  167,  167,  167,  167,  133,  133,  283,  134,
			  134,   51,  134,  130,  133,  167,  133,  131,  283,  163,
			  163,   33,  134,  134,  374,  135,  135,  163,  135,   31,
			  134,  132,  134,  163,   26,   24,  283,  133,  135,  135,

			  147,  551,   16,  167,  551,  163,  135,  425,  135,  136,
			  136,   15,  136,  134,  135,  147,  147,  674,  425,   14,
			   11,  163,  136,  136,    0,  133,    0,    0,  425,  147,
			  136,  147,  136,  163,  139,  139,    0,  139,    0,  136,
			  674,  134,  135,  147,  147,  674,  425,  139,  139,  139,
			    0,  140,  140,  551,  140,  139,  552,  139,    0,  552,
			  147,  374,  374,  374,  140,  140,  140,  136,  138,  138,
			  138,  138,  140,    0,  140,  173,  173,  138,  139,  179,
			    0,  140,    0,  173,    0,  179,  138,    0,    0,  173,
			  138,    0,  179,  138,    0,  140,  144,  140,    0,    0,

			  138,  173,  138,    0,  138,    0,    0,  179,  552,  140,
			    0,  144,  144,  179,  138,  144,  186,  173,  138,    0,
			  179,  138,  186,    0,    0,  144,  140,  144,    0,  173,
			  615,  138,    0,  138,  141,  141,  141,  141,  141,  144,
			  144,  186,    0,  144,  186,    0,    0,  615,  141,    0,
			  186,  615,  141,  146,    0,  141,  144,  157,    0,  148,
			  157,  141,  141,    0,  141,  157,  149,    0,  146,    0,
			  157,  157,  157,  146,  148,  615,  141,  146,  157,    0,
			  141,  149,  146,  141,  146,    0,  148,    0,  148,  141,
			  148,  635,    0,  141,  635,  149,  146,  149,    0,  149,

			    0,  146,  148,  159,  199,  146,  159,  157,    0,  149,
			  199,  159,    0,  146,  148,  635,  159,  159,  159,  148,
			  199,    0,  160,  208,  159,  160,  149,    0,  149,  208,
			  160,  161,  199,  820,  161,  160,  160,  160,  199,  161,
			  216,  820,  208,  160,  161,  161,  161,  159,  199,  195,
			  195,  208,  161,  159,  820,  195,    0,  208,  160,  164,
			  164,  161,  164,  164,  164,  164,  164,  164,  320,  820,
			    0,  208,  160,  164,  320,  159,    0,  195,  195,  168,
			    0,  161,  168,  195,    0,  164,  160,  168,    0,  161,
			    0,    0,  168,  168,  168,  170,  320,    0,  170,    0,

			  168,  164,  320,  170,  171,    0,    0,  171,  170,  170,
			  170,  168,  171,  164,    0,    0,  170,  171,  171,  171,
			  216,  216,  216,  216,  216,  171,    0,  686,  172,  168,
			  172,  172,  172,  172,  172,    0,  206,  170,  174,  168,
			    0,  174,  206,  171,  686,  170,  174,  175,  686,  206,
			  175,  174,  174,  174,  171,  175,  172,    0,    0,  174,
			  175,  175,  175,  231,  206,  170,  231,    0,  175,    0,
			  206,  171,  686,    0,    0,  231,  175,  206,  728,  728,
			  728,  174,  175,  234,  172,  231,  234,  176,  174,  176,
			  176,  176,  176,  176,    0,  234,  177,  175,  177,  177,

			  177,  177,  177,    0,  175,  234,    0,    0,  184,  174,
			  175,  177,    0,    0,  184,  231,  176,  177,  180,  184,
			  180,  180,  180,  180,  180,  181,    0,  181,  181,  181,
			  181,  181,    0,    0,    0,  234,  184,    0,  376,  177,
			  180,    0,  184,    0,  176,  177,  187,  184,  187,  187,
			  187,  187,  187,  181,  188,    0,  188,  188,  188,  188,
			  188,  189,    0,  189,  189,  189,  189,  189,  180,  188,
			  190,    0,  187,    0,    0,    0,  190,  192,    0,    0,
			    0,  181,  692,  192,  191,  190,  191,  191,  191,  191,
			  191,    0,  192,  602,  602,  602,  602,  188,  190,  692,

			  187,  189,    0,  692,  190,  192,  258,  258,  258,  258,
			  258,  192,    0,  190,  191,  376,  376,  376,    0,  193,
			  192,  193,  193,  193,  193,  193,  196,  692,  196,  196,
			  196,  196,  196,  544,  197,    0,  197,  197,  197,  197,
			  197,  196,  191,  377,  544,  198,  203,  198,  203,  193,
			  197,  198,  203,  200,  544,  200,  200,  200,  200,  200,
			  201,  202,  201,  201,  201,  201,  201,  202,    0,  196,
			  200,  202,  544,  198,  203,  198,  203,  193,  197,  198,
			  203,    0,  204,  204,  261,  261,  261,  261,  261,  202,
			  204,  201,    0,    0,    0,  202,  204,  821,  200,  202,

			    0,    0,  742,    0,  204,  821,  742,    0,  204,  205,
			  378,  205,  205,  205,  205,  205,    0,    0,  821,  201,
			  377,  377,  377,  742,  204,  207,  205,  207,  207,  207,
			  207,  207,  204,  821,  742,  209,  204,  209,  209,  209,
			  209,  209,  248,  248,  248,  248,  248,  248,  256,  256,
			  256,  256,  256,  207,  205,    0,  330,  330,    0,  257,
			    0,  257,  330,  256,  257,  257,  257,  257,  257,  209,
			  263,    0,  263,    0,    0,  263,  263,  263,  263,  263,
			    0,  207,    0,    0,  330,  330,  256,  378,  378,  378,
			  330,  256,  266,  266,  266,  266,  266,    0,  209,  236,

			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  239,  239,    0,  239,  292,  292,  292,  292,  292,  850,

			  850,  850,  850,  264,    0,  264,    0,  264,  264,  264,
			  264,  264,    0,    0,    0,  239,    0,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  262,  262,  262,  262,  262,  264,  272,    0,    0,    0,
			  273,  274,    0,    0,    0,  262,  293,  293,  293,  293,
			  293,  272,  272,    0,    0,  273,  274,    0,    0,  276,
			  239,    0,  275,    0,  273,  272,    0,  272,  262,  273,
			  274,  273,  274,  262,  276,  780,  780,  275,  780,  272,
			  272,  341,  277,  273,  274,    0,  275,  341,  276,  280, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  276,  275,  273,  275,    0,    0,  272,  277,  780,    0,
			  273,  274,  276,    0,  280,  275,  341,    0,  278,  341,
			  277,  277,  279,  277,  275,  341,    0,  280,  280,  276,
			  280,    0,  275,  278,  278,  277,    0,  279,    0,    0,
			  347,  281,  280,  279,    0,    0,  347,  278,  277,  278,
			    0,  279,  277,  279,    0,  280,  281,    0,    0,  280,
			  282,  278,  278,    0,  284,  279,  549,    0,  347,  281,
			  281,  279,  281,  285,  347,  282,    0,  549,  278,  284,
			    0,    0,  279,    0,  281,  284,    0,  549,  285,  282,
			    0,  282,    0,  284,  285,  284,  287,  281,    0,  282,

			  288,  281,  285,  282,  285,  549,  286,  284,    0,  835,
			  287,  287,  318,  284,  318,  288,  285,  835,  318,    0,
			  282,  286,  285,    0,  284,  287,  286,  287,    0,  288,
			  835,  288,  289,  285,    0,  286,  290,  286,  287,  287,
			  318,    0,  318,  288,    0,  835,  318,  289,    0,  286,
			    0,  290,  290,    0,  286,    0,  287,    0,    0,    0,
			  288,  289,  289,  289,    0,  290,  286,  290,  294,  294,
			  294,  294,  294,  294,    0,  289,    0,    0,    0,  290,
			  290,    0,    0,  294,  299,  299,  299,  299,  299,    0,
			  289,    0,  289,    0,    0,    0,  290,  294,    0,  294,

			  295,  295,  295,  295,  295,  295,  398,  398,  398,  398,
			  398,  294,    0,    0,    0,  295,    0,    0,  296,  296,
			  296,  296,  296,  296,  516,  840,  516,  840,  294,  295,
			    0,  295,    0,  296,  516,  840,  297,  297,  297,  297,
			  297,  297,  350,  295,    0,    0,    0,  296,  350,  296,
			  300,  297,  300,  300,  298,  298,  298,  298,  298,  298,
			  295,  296,  516,  840,    0,  297,    0,  297,    0,  298,
			  350,    0,  300,    0,    0,  300,  350,  738,  296,  297,
			    0,  300,    0,  298,  304,  298,  301,  301,  301,  301,
			  301,  629,  302,    0,  738,  305,  297,  298,  738,  304,

			  300,  305,  629,  300,  301,  302,  302,  304,  302,  300,
			  305,    0,  629,  304,  298,  304,  307,    0,    0,  308,
			  302,    0,  738,  352,  305,  306,  305,  304,    0,  352,
			  629,  307,  301,  302,  308,  304,    0,  302,  305,    0,
			  306,  306,  307,    0,  304,  307,  308,  307,  308,  309,
			  308,  352,  310,    0,  306,  305,  306,  352,  311,  307,
			    0,    0,  308,    0,  309,  364,    0,  310,  306,  306,
			  307,  364,    0,  311,  308,    0,  307,    0,  309,  308,
			  309,  310,    0,  310,    0,  306,    0,  311,  309,  311,
			  364,  311,  309,  364,    0,  310,    0,    0,    0,  364,

			  313,  311,  313,  313,  313,  313,  313,  313,    0,  309,
			    0,  323,  310,  323,  323,  323,  323,  323,  311,  314,
			  311,  314,  314,  314,  314,  314,  314,  319,  335,  730,
			  730,  730,  730,  319,  335,  335,  324,  319,  324,  324,
			  324,  324,  324,  325,    0,  325,  325,  325,  325,  325,
			    0,  324,    0,    0,    0,  319,  335,  324,  326,  326,
			  325,  319,  335,  335,  331,  319,  326,  730,    0,    0,
			  331,  327,  326,  327,  327,  327,  327,  327,  331,  324,
			  328,  329,  329,    0,  326,  324,  328,    0,  325,  329,
			  328,    0,  331,    0,    0,  329,    0,  630,  331,  332,

			  326,  332,  332,  332,  332,  332,  331,  329,  328,    0,
			  630,  334,  326,  334,  328,  332,  743,  334,  328,    0,
			  743,  630,  333,  329,  333,  333,  333,  333,  333,    0,
			  336,  630,  870,    0,  870,  329,  336,  743,    0,  334,
			    0,  334,  870,  332,  336,  334,    0,    0,  743,  630,
			  337,  333,  337,  337,  337,  337,  337,  339,  336,  339,
			  339,  339,  339,  339,  336,    0,    0,  337,    0,    0,
			  870,  338,  336,  338,  338,  338,  338,  338,  340,  333,
			  876,  876,  876,  876,  340,  343,  339,  343,  343,  343,
			  343,  343,  340,  338,  342,  337,  342,  342,  342,  342,

			  342,  368,  344,  345,    0,  879,  340,  368,  344,  345,
			  345,  346,  340,  344,  339,  744,    0,  346,  346,  744,
			  340,  338,  879,  342,  344,  343,  879,    0,    0,  368,
			    0,  345,    0,    0,  344,  368,  744,  345,  345,  346,
			  399,  399,  399,  399,  399,  346,  346,  744,    0,    0,
			  879,  342,  344,  348,    0,  348,  348,  348,  348,  348,
			  349,    0,  349,  349,  349,  349,  349,    0,  351,    0,
			  351,  351,  351,  351,  351,  348,    0,  415,  399,  354,
			    0,    0,  349,  351,  353,  354,  353,  353,  353,  353,
			  353,  355,  415,  355,    0,  354,  356,  355,  356,  356,

			  356,  356,  356,  348,  415,    0,  415,  354,  415,    0,
			  349,  351,  357,  354,  357,  357,  357,  357,  357,  355,
			  415,  355,  358,  354,  359,  355,  359,  356,  358,  357,
			  359,  358,  415,    0,    0,    0,  360,  415,  360,  360,
			  360,  360,  360,  365,    0,  365,  365,  365,  365,  365,
			  358,    0,  359,    0,  359,  356,  358,  357,  359,  358,
			  360,  361,  362,  361,  361,  361,  361,  361,  362,  363,
			  365,    0,    0,  466,  362,  363,    0,    0,  361,  466,
			    0,  366,  363,  366,  366,  366,  366,  366,  360,  367,
			  362,  367,  367,  367,  367,  367,  362,  363,  365,  370,

			    0,  466,  362,  363,    0,  370,  361,  466,    0,  366,
			  363,  369,    0,  369,  369,  369,  369,  369,  370,  371,
			    0,  371,  371,  371,  371,  371,    0,  370,    0,  367,
			    0,    0,    0,  370,    0,    0,    0,  366,  383,  383,
			    0,  383,  400,  400,  400,  400,  400,  370,    0,    0,
			  383,    0,    0,  371,  391,  391,  391,  391,  391,  391,
			  383,  402,  402,  402,  402,  402,  403,  403,  403,  403,
			  403,  404,    0,  404,    0,    0,  404,  404,  404,  404,
			  404,  403,  371,  405,  405,  405,  405,  405,    0,    0,
			  383,  406,  406,  406,  406,  406,  407,  407,  407,  407,

			  407,    0,    0,    0,  403,    0,    0,  408,  408,  403,
			  408,  408,  408,  408,  408,  409,  409,  409,  409,  409,
			  410,  410,  410,  410,  410,  416,  417,    0,    0,  418,
			  419,  745,    0,  420,  407,  745,  421,    0,    0,    0,
			  416,  417,    0,    0,  418,  419,  419,    0,  420,  418,
			    0,  421,  745,  417,  416,  417,  416,  417,  418,  419,
			  418,  419,  420,  745,  420,  421,  421,  421,  416,  417,
			    0,    0,  418,  419,  419,    0,  420,  418,    0,  421,
			  422,  417,    0,  423,  880,  416,  417,  426,  424,  418,
			  419,  427,    0,  420,  421,  422,  421,    0,  423,  423, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  424,  880,  426,  424,    0,  880,  427,  426,    0,  422,
			  428,  422,  423,    0,  423,    0,  426,  424,  426,  424,
			  427,  427,  427,  422,    0,  428,  423,  423,  424,  880,
			  426,  424,    0,  428,  427,  426,    0,  422,    0,  428,
			  422,  428,    0,  423,  429,  430,    0,  426,  424,  427,
			    0,  427,  431,  428,  440,  440,  440,  440,  440,  429,
			  430,  428,    0,  429,  446,  457,    0,  431,    0,  446,
			  428,  457,  430,  429,  430,  429,  430,    0,  457,  431,
			  446,  431,    0,  431,    0,    0,    0,  429,  430,    0,
			  446,  429,    0,  457,    0,  431,    0,    0,    0,  457,

			  430,    0,    0,    0,  429,  430,  457,  431,  446,    0,
			    0,    0,  431,  432,  432,  432,  432,  432,  433,    0,
			  433,  433,  433,  433,  433,  433,  470,  434,  434,  434,
			  434,  434,  470,  435,    0,  436,  436,  436,  436,  436,
			  432,  434,  437,  437,  437,  437,  437,  433,  434,    0,
			    0,    0,  435,  436,  470,  435,  437,  434,    0,  434,
			  470,  435,  438,  438,  438,  438,  438,  438,  432,  434,
			    0,    0,  437,    0,    0,  433,  434,  438,    0,    0,
			  435,  436,  883,  435,  437,    0,  434,  631,  434,  435,
			    0,  438,  822,  438,  439,  439,  439,  439,  439,  883,

			  631,  437,    0,  883,  822,  438,  441,  441,  441,  441,
			  441,  631,  822,  442,  442,  442,  442,  442,  442,    0,
			    0,  631,  438,  444,    0,  822,  439,  883,  442,    0,
			    0,  443,  443,  443,  443,  443,  443,  856,  444,  631,
			  822,  467,  442,  467,  442,    0,  443,  467,  856,  445,
			  447,    0,  444,  449,  444,  439,  442,  448,  856,    0,
			  443,    0,  443,    0,  445,  447,  444,    0,  449,  467,
			    0,  467,  448,  442,  443,  467,  856,    0,  445,  447,
			  445,  447,  449,  444,  449,    0,  448,  448,  448,  450,
			    0,  443,  445,  447,    0,    0,  449,  451,    0,  451,

			  448,  450,    0,    0,  450,  886,  886,  886,  886,  445,
			  447,    0,  450,  449,  451,  448,    0,  448,  450,  453,
			  450,  453,  453,  453,  453,  453,  453,    0,  451,  450,
			  451,  454,  450,  454,  454,  454,  454,  454,  454,  458,
			  450,    0,  451,  886,    0,  458,    0,  836,  459,  450,
			  459,  459,  459,  459,  459,  836,  458,  453,  460,  451,
			  460,  460,  460,  460,  460,    0,    0,  458,  836,  454,
			    0,    0,  461,  458,  461,  461,  461,  461,  461,  461,
			    0,    0,    0,  836,  462,  458,  462,  462,  462,  462,
			  462,  463,  464,  463,  463,  463,  463,  463,  464,  502,

			  502,  502,  502,  502,  465,  464,  465,  465,  465,  465,
			  465,    0,  462,  468,    0,  468,  468,  468,  468,  468,
			  464,    0,    0,  463,    0,  469,  464,  469,  469,  469,
			  469,  469,  465,  464,  468,  471,    0,  502,  472,    0,
			  462,  471,  469,  473,  472,  473,  473,  473,  473,  473,
			    0,  471,  463,  472,  503,  503,  503,  503,  503,  476,
			  465,  476,  468,  471,    0,  476,  472,    0,    0,  471,
			  469,  474,  472,  474,  474,  474,  474,  474,    0,  471,
			  475,  472,  475,  475,  475,  475,  475,  476,  477,  476,
			  477,    0,    0,  476,    0,  478,  477,  478,  478,  478,

			  478,  478,  474,  479,    0,  480,    0,    0,  481,  479,
			  475,  480,  478,    0,  481,    0,  477,  481,  477,    0,
			    0,  480,    0,  482,  477,  482,  482,  482,  482,  482,
			  474,  479,    0,  480,    0,    0,  481,  479,  475,  480,
			  478,  484,  481,    0,  482,  481,  484,  484,  483,  480,
			  483,  483,  483,  483,  483,    0,  485,  486,  485,  485,
			  485,  485,  485,  486,    0,  487,    0,  490,    0,  484,
			  486,  487,  482,  490,  484,  484,  485,    0,  487,  483,
			    0,    0,    0,    0,  488,  486,  488,  488,  488,  488,
			  488,  486,    0,  487,  491,  490,    0,    0,  486,  487,

			  491,  490,  494,    0,  485,    0,  487,  483,  494,    0,
			    0,  489,  488,  489,  489,  489,  489,  489,  494,    0,
			    0,  492,  491,  492,  492,  492,  492,  492,  491,  493,
			  494,  493,  493,  493,  493,  493,  494,  495,  495,  489,
			  488,    0,  496,  495,  496,    0,  494,  499,    0,    0,
			  496,    0,  497,  496,  497,  497,  497,  497,  497,    0,
			    0,    0,    0,  499,    0,  495,  495,  489,    0,  499,
			  496,  495,  496,  504,  504,  504,  504,  504,  496,    0,
			    0,  496,  498,  497,  498,  498,  498,  498,  498,  500,
			  500,  499,  500,  500,  500,  500,  500,  499,  498,  505,

			    0,  505,  505,  505,  505,  505,  507,  507,  507,  507,
			  507,  497,  508,  508,  508,  508,  508,    0,    0,    0,
			    0,  507,    0,    0,    0,    0,  498,  509,  509,  509,
			  509,  509,  510,  510,  510,  510,  510,  511,  511,  511,
			  511,  511,    0,    0,  507,  520,    0,    0,  521,  507,
			  512,  512,  512,  512,  512,  514,  514,  514,  514,  514,
			  520,    0,    0,  521,  515,  509,  515,  515,  515,  515,
			  515,  524,    0,    0,  520,  511,  520,  521,  522,  521,
			    0,  523,  525,    0,    0,    0,  524,  521,  520,  556,
			    0,  521,  563,  522,  522,  556,  523,  525,  563,    0,

			  524,  563,  524,    0,  523,  520,    0,  522,  521,  522,
			  523,  525,  523,  525,  524,    0,    0,  556,  526,    0,
			  563,  522,  522,  556,  523,  525,  563,    0,  527,  563,
			    0,  524,  523,  526,  526,    0,    0,  528,  522,  884,
			    0,  523,  525,  527,    0,    0,  526,  526,  530,  526,
			    0,  776,  528,    0,    0,  776,  884,  527,  528,  527,
			  884,  526,  526,  530,  530,    0,  528,  531,  528,    0,
			  532,  527,  776,    0,  526,  571,    0,  530,  526,  530,
			  528,  571,  531,  776,  884,  532,  528,    0,  527,  533,
			    0,  530,  530,    0,    0,    0,  531,  528,  531,  532,

			  535,  532,    0,  571,  533,  533,    0,  534,  530,  571,
			  531,  564,  564,  532,    0,  535,  535,  564,  533,    0,
			  533,    0,  534,    0,    0,    0,    0,  531,    0,  535,
			  532,  535,  533,  533,  534,  561,  534,  561,  534,  564,
			  564,  561,  539,  535,  535,  564,    0,    0,    0,  533,
			  534,  538,  538,  538,  538,  538,  538,  539,    0,    0,
			  535,    0,  534,  561,    0,  561,  538,  534,    0,  561,
			    0,  539,    0,  539,  540,  540,  540,  540,  540,    0,
			  538,    0,  538,    0,  541,  539,  541,  541,  541,  541,
			  541,  541,    0,  559,  538,  559,  559,  559,  559,  559, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  540,  539,  543,  543,  543,  543,  543,    0,    0,
			    0,  538,  542,  541,  542,  545,  542,  542,  542,  542,
			  542,    0,    0,    0,  543,  548,    0,    0,    0,  540,
			  545,  545,    0,    0,  542,  546,    0,  542,    0,    0,
			  548,  541,    0,  542,  545,  547,  545,    0,    0,  548,
			  546,  546,  543,    0,  548,  557,  548,    0,  545,  545,
			  547,  557,  542,  572,  546,  542,  546,    0,  548,  572,
			  572,  542,  547,  857,  547,  545,  547,  548,  546,  546,
			  557,    0,    0,  557,  857,  548,    0,    0,  547,  557,
			    0,  572,    0,    0,  857,  546,    0,  572,  572,    0,

			  547,    0,    0,    0,  558,  547,  558,  558,  558,  558,
			  558,  560,  857,  560,  560,  560,  560,  560,  562,    0,
			  562,  562,  562,  562,  562,  565,  576,  565,  565,  565,
			  565,  565,  576,  607,  566,  562,  566,  566,  566,  566,
			  566,    0,  558,    0,    0,  607,  567,  567,  607,  565,
			  566,  560,  567,  568,  576,  568,    0,    0,    0,  568,
			  576,    0,  607,  562,  607,    0,  569,  568,  569,  569,
			  569,  569,  569,  607,  567,  567,  607,  565,  566,  640,
			  567,  568,  569,  568,    0,  640,  570,  568,  570,  570,
			  570,  570,  570,  607,  573,  568,  573,  573,  573,  573,

			  573,    0,  574,  570,  574,  575,  575,  640,  574,    0,
			  569,  575,    0,  640,    0,  570,    0,    0,  577,    0,
			  577,  577,  577,  577,  577,  592,  592,  592,  592,  592,
			  574,  570,  574,  575,  575,  577,  574,    0,    0,  575,
			    0,    0,  578,  570,  578,  578,  578,  578,  578,  579,
			  582,  579,  582,  777,  643,  579,  582,  777,  578,  581,
			  643,    0,    0,  577,  580,  581,  580,  580,  580,  580,
			  580,    0,  581,    0,  777,    0,    0,  579,  582,  579,
			  582,  580,  643,  579,  582,  777,  578,  581,  643,    0,
			    0,    0,  583,  581,  583,  583,  583,  583,  583,  584,

			  581,  584,  584,  584,  584,  584,  585,    0,  585,  580,
			  778,  586,  585,  586,  778,  587,  584,  586,  647,  588,
			  583,  587,    0,    0,  647,  588,    0,  647,  587,  588,
			    0,  778,    0,    0,  585,    0,  585,    0,    0,  586,
			  585,  586,  778,  587,  584,  586,  647,  588,  583,  587,
			    0,    0,  647,  588,    0,  647,  587,  588,  589,    0,
			  589,  589,  589,  589,  589,  590,  648,  590,  590,  590,
			  590,  590,  648,    0,  593,  589,  593,  593,  593,  593,
			  593,    0,  590,  594,  594,  594,  594,  594,    0,  595,
			  595,  595,  595,  595,  648,    0,    0,    0,  594,    0,

			  648,    0,    0,  589,  596,  596,  596,  596,  596,    0,
			  590,    0,  593,  597,  597,  597,  597,  597,  599,  599,
			  599,  599,  599,    0,    0,    0,  594,  595,  600,  600,
			  600,  600,  600,  601,  601,  601,  601,  601,  604,  604,
			  604,  604,  604,  608,  609,    0,    0,  610,  611,    0,
			    0,  613,    0,  604,    0,  653,  609,    0,  608,  609,
			    0,  653,  610,  611,  611,    0,  613,    0,    0,  653,
			  612,    0,  608,  609,  608,  609,  610,  611,  610,  611,
			  613,  604,  613,  653,  609,  612,  608,  609,    0,  653,
			  610,  611,  611,  612,  613,  614,    0,  653,    0,  612,

			  616,  612,  837,  608,  609,    0,  866,  610,  611,    0,
			  614,  613,    0,  612,  837,  616,  614,  866,  617,    0,
			    0,  612,  837,    0,  614,    0,  614,  866,  616,  616,
			  612,  616,    0,  617,  617,  837,  618,  619,  614,    0,
			    0,    0,  620,  616,  614,  866,  638,  617,  638,  617,
			  837,  618,  619,  619,  638,  614,  616,  620,    0,    0,
			  616,  617,  617,    0,  618,  618,  619,  618,  619,  625,
			    0,  620,    0,  620,  638,    0,  638,    0,  617,  618,
			  619,  619,  638,    0,  625,  620,  621,  621,  621,  621,
			  621,  626,  618,  663,  627,  628,  618,  619,  625,  663,

			  625,    0,  620,    0,  621,    0,  626,  621,  627,  627,
			  628,  637,  625,  637,  637,  637,  637,  637,  626,    0,
			  626,  663,  626,  627,  628,  627,  628,  663,    0,  625,
			    0,    0,  621,    0,  626,  621,  627,  627,  628,  641,
			    0,  641,  641,  641,  641,  641,  626,  646,  642,  646,
			  642,  626,    0,  646,  627,  628,  642,  644,  644,  669,
			  669,  669,  669,  669,  645,  644,  645,  645,  645,  645,
			  645,  644,    0,    0,    0,  646,  642,  646,  642,    0,
			    0,  646,    0,  644,  642,  649,    0,  649,  649,  649,
			  649,  649,  650,    0,  650,  650,  650,  650,  650,  644,

			    0,  651,  649,  651,  651,  651,  651,  651,  652,    0,
			    0,  644,    0,    0,  652,  652,  650,  654,    0,  654,
			    0,    0,  656,  654,  656,  656,  656,  656,  656,  655,
			  649,  655,  655,  655,  655,  655,  652,    0,    0,  656,
			  657,    0,  652,  652,  650,  654,  657,  654,    0,  665,
			  659,  654,  659,    0,  657,  665,  659,    0,  655,  658,
			  867,  658,  658,  658,  658,  658,    0,  656,  657,  660,
			  660,  867,    0,    0,  657,  660,    0,  665,  659,    0,
			  659,  867,  657,  665,  659,    0,  655,  661,  658,  661,
			  661,  661,  661,  661,    0,  666,  666,  660,  660,  867,

			  664,  666,    0,  660,  661,  662,  664,  662,  662,  662,
			  662,  662,    0,  664,    0,    0,  658,    0,    0,    0,
			    0,  662,    0,  666,  666,    0,  779,    0,  664,  666,
			  779,    0,  661,  667,  664,  667,  667,  667,  667,  667,
			  668,  664,  668,  668,  668,  668,  668,  779,  671,  662,
			  671,    0,    0,  671,  671,  671,  671,  671,  779,  672,
			  672,  672,  672,  672,    0,    0,    0,    0,  668,  673,
			  673,  673,  673,  673,  675,  675,  675,  675,  675,  677,
			  677,  677,  677,  677,  678,  678,  678,  678,  678,  679,
			  679,  679,  679,  679,  681,  682,  668,  672,    0,  683,

			  685,    0,    0,    0,  679,  684,    0,    0,    0,  681,
			  682,    0,    0,    0,  683,  685,  682,    0,    0,  684,
			  684,  681,    0,  681,  682,  681,  682,  679,  683,  685,
			  683,  685,  679,    0,  684,  687,  684,  681,  682,    0,
			    0,  688,  683,  685,  682,  703,  689,  684,  684,  681,
			  687,  703,  703,    0,  681,  682,  688,  705,    0,  683,
			  685,  689,    0,  705,  687,  684,  687,  690,  691,    0,
			  688,  693,  688,  703,    0,  689,    0,  689,  687,  703,
			  703,    0,  690,  691,  688,  705,  693,  693,    0,  689,
			  690,  705,    0,  694,    0,  687,  690,  691,  690,  691, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  693,  688,  693,    0,  695,    0,  689,    0,  694,    0,
			  690,  691,  694,    0,  693,  693,    0,    0,  690,  695,
			  695,    0,  694,  706,  694,    0,  709,  690,  691,  706,
			    0,  693,  709,  695,    0,  695,  694,    0,    0,  701,
			  694,  701,  701,  701,  701,  701,  702,  695,  695,    0,
			  710,  706,  702,  694,  709,    0,  710,  706,    0,  702,
			  709,    0,    0,  704,  695,  704,  704,  704,  704,  704,
			    0,    0,    0,  711,  702,    0,    0,  701,  710,  711,
			  702,    0,    0,    0,  710,  704,  707,  702,  707,  707,
			  707,  707,  707,  708,    0,  708,  708,  708,  708,  708,

			  712,  711,  712,  712,  712,  712,  712,  711,  708,    0,
			    0,    0,  713,  704,  713,  713,  713,  713,  713,  714,
			    0,    0,    0,    0,  715,  714,  715,  715,  715,  715,
			  715,  716,  717,    0,    0,    0,  708,  716,  717,  718,
			  716,  718,  718,  718,  718,  718,  719,  714,  719,  719,
			  719,  719,  719,  714,    0,  720,  722,  720,  722,  716,
			  717,  720,  722,  718,  721,  716,  717,    0,  716,  721,
			  721,  723,    0,  723,  723,  723,  723,  723,  724,  724,
			  724,  724,  724,  720,  722,  720,  722,    0,  723,  720,
			  722,  718,  721,    0,    0,    0,    0,  721,  721,  725,

			  725,  725,  725,  725,  726,  726,  726,  726,  726,    0,
			    0,    0,  727,    0,  727,    0,  723,  727,  727,  727,
			  727,  727,  729,  729,  729,  729,  729,  731,  731,  731,
			  731,  731,  733,  734,    0,    0,    0,  737,    0,    0,
			  735,    0,  731,    0,  748,    0,  733,  733,  734,    0,
			  748,  737,  737,  734,    0,  735,  735,    0,  739,    0,
			    0,  733,  734,  733,  734,  731,  737,  741,  737,  735,
			  731,  735,  748,  739,  733,  733,  734,    0,  748,  737,
			  737,  734,  741,  735,  735,    0,    0,  739,  740,  739,
			    0,    0,  733,  734,    0,    0,  741,  737,  741,    0,

			  735,  739,  749,  740,  740,  751,    0,  751,  749,    0,
			  741,  751,  760,  760,  760,  760,  760,  740,  739,  740,
			  750,    0,  750,  750,  750,  750,  750,  741,  753,    0,
			  749,  740,  740,  751,  753,  751,  749,    0,    0,  751,
			  752,  750,  752,  752,  752,  752,  752,    0,  740,  754,
			    0,  754,  754,  754,  754,  754,  753,  752,    0,  755,
			  755,  756,  753,  756,  754,  755,  757,  756,    0,  750,
			    0,    0,  757,    0,  758,    0,  758,  758,  758,  758,
			  758,    0,    0,    0,    0,  752,    0,  755,  755,  756,
			  758,  756,  754,  755,  757,  756,    0,    0,    0,    0,

			  757,  761,  761,  761,  761,  761,  762,  762,  762,  762,
			  762,  763,  763,  763,  763,  763,    0,    0,  758,  764,
			  764,  764,  764,  764,  765,  765,  765,  765,  765,  767,
			  767,  767,  767,  767,  769,  770,    0,    0,    0,  761,
			  771,    0,    0,    0,  767,  772,    0,    0,    0,  769,
			  770,    0,  784,  769,    0,  771,    0,    0,  784,    0,
			  772,  772,    0,  769,  770,  769,  770,  767,    0,  771,
			  774,  771,  767,    0,  772,  775,  772,  769,  770,    0,
			  784,  769,    0,  771,    0,  774,  784,  788,  772,  772,
			  775,  781,  770,  788,  769,  770,  781,  781,    0,  774,

			  771,  774,    0,    0,  775,  772,  775,    0,  782,    0,
			    0,    0,    0,  774,  782,  788,    0,    0,  775,  781,
			    0,  788,    0,  782,  781,  781,    0,    0,    0,    0,
			  774,  786,  775,  786,    0,  775,  782,  786,    0,    0,
			    0,  783,  782,  783,  783,  783,  783,  783,    0,    0,
			  785,  782,  785,  785,  785,  785,  785,  789,    0,  786,
			    0,  786,    0,  789,  787,  786,  787,  787,  787,  787,
			  787,  783,  789,  790,  824,  790,  790,  790,  790,  790,
			  824,  787,    0,    0,    0,  789,  791,  791,  791,  791,
			  791,  789,  793,  793,  793,  793,  793,    0,    0,  783,

			  789,    0,  824,    0,    0,  794,  797,  794,  824,  787,
			  794,  794,  794,  794,  794,  795,  795,  795,  795,  795,
			    0,  797,  797,    0,  791,  798,  813,  813,  813,  813,
			  813,    0,  799,    0,    0,  797,  800,  797,    0,    0,
			  798,    0,  806,  794,  806,    0,    0,  799,  806,  797,
			  797,  800,    0,    0,  798,    0,  798,    0,  798,    0,
			  799,  799,    0,  799,    0,  800,  797,  800,  798,  800,
			  806,  807,  806,    0,    0,  799,  806,  807,  808,  800,
			  808,  808,  808,  808,  808,  798,    0,  798,  799,  809,
			  807,    0,  799,    0,  811,  809,  800,    0,  800,  807,

			  811,    0,    0,  809,  810,  807,  810,  810,  810,  810,
			  810,    0,  808,  811,  816,  817,    0,  809,    0,  807,
			  818,    0,  811,  809,    0,  819,    0,    0,  811,  816,
			  817,  809,  826,  810,    0,  818,    0,    0,  826,    0,
			  819,  808,  811,  816,  817,  816,  817,    0,    0,  818,
			  819,  818,    0,    0,  819,    0,  819,  816,  817,    0,
			  826,  810,    0,  818,  823,    0,  826,    0,  819,    0,
			  823,  816,    0,    0,  816,  817,    0,    0,  819,  823,
			  818,    0,    0,    0,  825,  819,  825,  825,  825,  825,
			  825,  827,  823,  827,  827,  827,  827,  827,  823,  828,

			  829,  829,  829,  829,  829,  828,  833,  823,    0,    0,
			  828,  830,  830,  830,  830,  830,  832,  832,  832,  832,
			  832,  833,  848,    0,  838,  847,  834,  828,  848,    0,
			  838,  847,    0,  828,    0,  833,  847,  833,  828,  833,
			    0,  834,  834,  838,    0,  839,    0,  839,    0,  833,
			  848,  839,  838,  847,    0,  834,  848,  834,  838,  847,
			    0,    0,    0,    0,  847,    0,  833,    0,  833,  834,
			  834,    0,  838,  839,    0,  839,    0,  842,  843,  839,
			    0,    0,  841,    0,  841,  841,  834,  841,  841,  841,
			  841,  841,  842,  843,  849,  849,  849,  849,  849,  858,

			    0,  858,  842,    0,    0,  858,  842,  843,  842,  843,
			  852,  852,  852,  852,  852,  854,  854,  854,  854,  854,
			  842,  843,    0,    0,    0,  855,    0,  858,    0,  858,
			  842,    0,    0,  858,    0,    0,    0,  842,  843,    0,
			  855,  855,  859,  859,  859,  859,  859,  860,  860,  860,
			  860,  860,    0,    0,  855,    0,  855,  861,  861,  861,
			  861,  861,  862,  862,  862,  862,  862,  852,  855,  855,
			  864,  865,  864,  864,    0,  864,  864,  864,  864,  864,
			    0,  868,    0,    0,    0,  855,  865,  868,  869,  869,
			  869,  869,  869,  871,  871,  871,  871,  871,    0,    0, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  865,    0,  865,  874,  874,  874,  874,  874,    0,  868,
			    0,    0,    0,    0,  865,  868,  875,  875,  875,  875,
			  875,  878,    0,  878,    0,    0,  878,  878,  878,  878,
			  878,  865,  881,  881,  881,  881,  881,  882,  882,  882,
			  882,  882,  885,  885,  885,  885,  885,  889,  889,  889,
			  889,  889,  890,  890,  890,  890,  890,  891,  891,  891,
			  891,  891,  893,  893,  893,  893,  893,  894,    0,  894,
			    0,    0,  894,  894,  894,  894,  894,  895,  895,  895,
			  895,  895,  896,  896,  896,  896,  896,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  919,  919,  919,  919,

			  919,  919,  919,  919,  919,  894,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,

			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  901,  901,    0,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,    0,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  902,  902,    0,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  904,  935,  935,  935,  935,  935,  935,  935,  935,

			  935,    0,    0,    0,    0,    0,    0,    0,    0,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  905,  905,
			  905,    0,    0,    0,    0,    0,    0,  905,  905,    0,
			  905,    0,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,    0,    0,    0,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  906,  906,    0,  906,    0,  906,  906,
			    0,    0,    0,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,    0,    0,    0,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  907,  907,    0,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  908,  908,    0,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,    0,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  910,  910,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  911,    0,  911,    0,    0,    0,    0,  911,
			    0,  911,  911,    0,    0,    0,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,    0,    0,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,

			  912,  912,  912,  912,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  914,  914,    0,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  915,    0,
			    0,    0,  915,  915,    0,    0,    0,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,    0,    0,    0,  915,

			  915,  915,  915,  915,  915,  915,  915,  915,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  917,  917,  917,    0,    0,
			    0,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,    0,    0,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  918,    0,    0,  918,  918,    0,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,    0,
			    0,    0,  918,  918,  918,  918,  918,  918,  918,  918,

			  918,  920,    0,  920,    0,  920,    0,    0,  920,  920,
			  920,  920,  920,    0,    0,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,    0,    0,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,    0,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,

			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  923,  923,  923,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  923,  924,  924,    0,    0,
			    0,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			    0,    0,    0,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  925,  925,    0,    0,    0,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,    0,    0,    0,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  926,  926, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  926,    0,    0,    0,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,    0,    0,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,    0,    0,    0,  928,  928,  928,  928,  928,  928,
			  928,  928,  928,  929,    0,  929,    0,    0,    0,    0,
			  929,    0,  929,  929,    0,    0,    0,  929,  929,  929,

			  929,  929,  929,  929,  929,  929,    0,    0,    0,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  930,  930,
			  930,    0,    0,  930,  930,  930,  930,  930,  930,  930,
			  930,    0,    0,  930,  930,  930,  930,  930,  930,  930,
			  930,  930,    0,    0,    0,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,    0,    0,    0,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  932,  932,    0,    0,    0,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,    0,
			    0,    0,  932,  932,  932,  932,  932,  932,  932,  932,

			  932,  933,    0,  933,    0,    0,    0,    0,  933,    0,
			  933,  933,    0,    0,    0,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,    0,    0,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  934,  934,    0,    0,
			    0,  934,  934,  934,  934,  934,  934,  934,  934,  934,
			    0,    0,    0,  934,  934,  934,  934,  934,  934,  934,
			  934,  934,  936,  936,  936,  936,  936,  936,  936,  936,
			  936,    0,    0,    0,  936,  936,  936,  936,  936,  936,
			  936,  936,  936,  937,    0,    0,    0,  937,  937,    0,
			    0,    0,  937,  937,  937,  937,  937,  937,  937,  937,

			  937,    0,    0,    0,  937,  937,  937,  937,  937,  937,
			  937,  937,  937,  938,  938,    0,    0,    0,  938,  938,
			  938,  938,  938,  938,  938,  938,  938,    0,    0,    0,
			  938,  938,  938,  938,  938,  938,  938,  938,  938,  939,
			  939,    0,    0,    0,  939,  939,  939,  939,  939,  939,
			  939,  939,  939,    0,    0,    0,  939,  939,  939,  939,
			  939,  939,  939,  939,  939,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897, yy_Dummy>>,
			1, 457, 7000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,  185,    0,   67,
			   71, 1120, 7365,   98, 1116, 1085, 1095, 7365,   90,    0,
			 7365, 7365, 7365, 7365, 1080,   88, 1077,   98,  118, 7365,
			 7365, 1063, 7365, 1055, 7365,  275,  279,  285,  119,  296,
			  291,  300,  328,  347,  352,  356,  427,  389,  415,  381,
			  377, 1014, 7365, 7365, 1000,  505,  431,  556,  555,  593,
			  606,  422,  609,   94,  104,  629,  655,  652,  250,  306,
			 1031, 7365, 7365, 1029,  153, 7365,  106,  285,  279,  304,
			  322,  396,  382, 7365,  388,  450, 7365,  408, 1032,  506,
			  602, 7365,   78,  726, 7365,  160, 1021, 7365, 1010, 7365,

			 1000,    0,  725,  991,  996,  976,  761, 7365,   94,  148,
			  767,  791,  579,  686, 7365, 7365,  493,  816,    0,  821,
			  840,  856,  871,  887,  912,  927,  942,  946,  972,  988,
			 1003, 1018, 1035, 1051, 1067, 1083, 1107,  904, 1154, 1132,
			 1149, 1216,   79,  250, 1179,  908, 1236, 1083, 1242, 1249,
			  957,  415,  921, 7365,  414,  959,    0, 1255,  943, 1301,
			 1320, 1329,  889, 1064, 1344,  590,  832, 1043, 1377,  902,
			 1393, 1402, 1412, 1160, 1436, 1445, 1471, 1480,  652, 1148,
			 1502, 1509,  620,  717, 1477,  803, 1185, 1530, 1538, 1545,
			 1539, 1568, 1546, 1603,  854, 1318, 1610, 1618, 1614, 1273,

			 1637, 1644, 1630, 1615, 1667, 1693, 1405, 1709, 1292, 1719,
			 7365,  927, 7365,  322, 7365, 7365, 1333,  447,  502,  630,
			  706,  461, 7365,  873,  670,  847,  857,  961,  851, 7365,
			  747, 1461, 7365,  896, 1481,  170, 1798,  407,  256, 1888,
			 7365, 7365,  870,  793, 7365, 7365, 7365,  884, 1725,  875,
			  871,  868,  866,  600,  746, 7365, 1730, 1746, 1588,  852,
			  809, 1666, 1922, 1757, 1889, 1011, 1774, 7365,    0,    0,
			  837,  822, 1929, 1933, 1934, 1955, 1952, 1975, 2001, 2005,
			 1982, 2024, 2043, 1029, 2047, 2056, 2089, 2079, 2083, 2115,
			 2119, 7365, 1876, 1938, 2151, 2183, 2201, 2219, 2237, 2166,

			 2236, 2268, 2260,  950, 2267, 2278, 2308, 2299, 2302, 2332,
			 2335, 2341,  810, 2384, 2403, 7365,   98,  812, 2081, 2396,
			 1337,   67,  305, 2395, 2420, 2427, 2443, 2455, 2449, 2466,
			 1725, 2433, 2483, 2506, 2480, 2397, 2499, 2534, 2555, 2541,
			 2547, 1960, 2578, 2569, 2585, 2572, 2580, 2009, 2637, 2644,
			 2211, 2652, 2292, 2668, 2648, 2660, 2680, 2696, 2691, 2693,
			 2720, 2745, 2731, 2738, 2334, 2727, 2765, 2773, 2570, 2795,
			 2768, 2803,  823,  311, 1077,  797, 1531, 1636, 1703,  291,
			 7365,  771,  812, 2836, 7365,  434,  514,  799,  936, 7365,
			 7365, 2837, 7365, 7365, 7365, 7365, 7365,  933, 2188, 2622,

			 2824,  352, 2843, 2848, 2858, 2865, 2873, 2878, 2892, 2897,
			 2902,  739,  323,    0,  714, 2660, 2908, 2909, 2912, 2913,
			 2916, 2919, 2963, 2966, 2971, 1079, 2970, 2974, 2993, 3027,
			 3028, 3035, 3095, 3102, 3109, 3116, 3117, 3124, 3145, 3176,
			 3036, 3188, 3196, 3214, 3206, 3232, 3041, 3233, 3240, 3236,
			 3272, 3282,  801, 3303, 3315,  673,    0, 3034, 3308, 3332,
			 3342, 3356, 3368, 3375, 3361, 3388, 2742, 3210, 3397, 3409,
			 3095, 3404, 3407, 3427, 3455, 3464, 3428, 3459, 3479, 3472,
			 3474, 3477, 3507, 3532, 3510, 3540, 3526, 3534, 3568, 3595,
			 3536, 3563, 3605, 3613, 3571, 3606, 3613, 3636, 3666, 3632,

			 3674, 7365, 3381, 3436, 3655, 3683,  712, 3688, 3694, 3709,
			 3714, 3719, 3732,  692, 3737, 3748, 2211,  456,    0,    0,
			 3728, 3731, 3761, 3764, 3754, 3765, 3801, 3811, 3820,  680,
			 3831, 3850, 3853, 3872, 3890, 3883, 7365,  616, 3934, 3925,
			 3956, 3968, 3998, 3985, 1605, 3998, 4018, 4028, 4008, 2038,
			  833, 1099, 1154, 7365, 1020,  411, 3758, 4024, 4088, 3977,
			 4095, 3904, 4102, 3761, 3880, 4109, 4118, 4115, 4122, 4150,
			 4170, 3844, 4032, 4178, 4171, 4174, 4095, 4202, 4226, 4218,
			 4248, 4228, 4219, 4276, 4283, 4275, 4280, 4284, 4288, 4342,
			 4349,  639, 4207, 4358, 4365, 4371, 4386, 4395,  638, 4400,

			 4410, 4415, 1575, 7365, 4420,    0,  638, 4116, 4426, 4427,
			 4430, 4431, 4453, 4434, 4478, 1202, 4483, 4501, 4519, 4520,
			 4525, 4568, 7365,  618,  622, 4552, 4574, 4577, 4578, 2263,
			 2482, 3172,  730, 7365, 7365, 1289, 1037, 4595, 4517,  611,
			 4148, 4623, 4619, 4223, 4642, 4648, 4616, 4287, 4335, 4669,
			 4676, 4685, 4677, 4424, 4686, 4713, 4706, 4709, 4743, 4719,
			 4738, 4771, 4789, 4562, 4769, 4718, 4764, 4817, 4824, 4641,
			  603, 4835, 4841, 4851, 1084, 4856,  604, 4861, 4866, 4871,
			  513, 4877, 4878, 4882, 4888, 4883, 1399, 4918, 4924, 4929,
			 4950, 4951, 1554, 4954, 4976, 4987,  461,  453,  442,  416,

			    0, 5023, 5015, 4914, 5047, 4926, 4992, 5070, 5077, 4995,
			 5019, 5042, 5084, 5096, 5088, 5108, 5100, 5101, 5123, 5130,
			 5124, 5133, 5125, 5155, 5160, 5181, 5186, 5199, 1460, 5204,
			 2416, 5209,    0, 5215, 5216, 5223, 7365, 5220, 2249, 5241,
			 5271, 5250, 1674, 2488, 2587, 2903,  412,  381, 5213, 5271,
			 5304, 5274, 5324, 5297, 5333, 5328, 5330, 5335, 5358,  322,
			 5294, 5383, 5388, 5393, 5401, 5406, 7365, 5411,    0, 5417,
			 5418, 5423, 5428, 7365, 5453, 5458, 3823, 4225, 4282, 4798,
			 1983, 5460, 5477, 5525, 5421, 5534, 5500, 5548, 5456, 5526,
			 5557, 5568,  320, 5574, 5592, 5597,  485, 5589, 5608, 5615,

			 5619,  438, 7365,  811,  290, 7365, 5611, 5640, 5662, 5658,
			 5688, 5663,  540, 5608,    0,  221, 5697, 5698, 5703, 5708,
			 1305, 1669, 3176, 5733, 5543, 5768, 5701, 5775, 5768, 5782,
			 5793,  576, 5798, 5789, 5809, 2081, 3319, 4486, 5793, 5814,
			 2212, 5869, 5860, 5861,  272,  262,  646, 5794, 5791, 5876,
			 1881, 7365, 5892,   99, 5897, 5908, 3209, 4045, 5868, 5924,
			 5929, 5939, 5944,   93, 5957, 5954, 4478, 4732, 5950, 5970,
			 2519, 5975,  125,  102, 5985, 5998, 2562, 7365, 6008, 2577,
			 2956, 6014, 6019, 3154, 3811, 6024, 3292, 7365, 7365, 6029,
			 6034, 6039, 7365, 6044, 6054, 6059, 6064, 7365, 6105, 6142,

			 6179, 6216, 6253, 6071, 6281, 6316, 6347, 6383, 6420, 6457,
			 6494, 6530, 6566, 6603, 6640, 6671, 6707, 6735, 6764, 6068,
			 6799, 6835, 6872, 6908, 6935, 6961, 6988, 7024, 7046, 7081,
			 7117, 7138, 7164, 7199, 7225, 6276, 7246, 7276, 7302, 7328, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  897,    1,  898,  898,  899,  899,  897,    7,  900,
			  900,  897,  897,  897,  897,  897,  901,  897,  902,  903,
			  897,  897,  897,  897,  897,  897,  904,  897,  897,  897,
			  897,  897,  897,  897,  897,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  906,  897,  897,  907,  897,   55,   55,   55,   55,
			   55,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			  897,  897,  897,  908,  897,  897,  897,  908,  908,  908,
			  908,  908,  909,  897,  910,  909,  897,  911,  897,  911,
			  911,  897,  912,  913,  897,  897,  897,  897,  901,  897,

			  914,  914,  914,  915,  916,  897,  897,  897,  917,  897,
			  897,  897,  897,  897,  897,  897,  897,  905,  918,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  897,   46,  905,
			  905,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  906,  906,  907,  897,  897,  897,  919,  920,  897,  920,
			  920,  920,  897,   60,   60,  164,  164,  164,  920,  164,
			  920,  920,  164,   60,  920,  920,  164,  164,  175,  175,
			  164,  164,  175,  164,  175,  175,  175,  164,  164,  164,
			  175,  164,  175,  164,  175,  175,  164,  164,  175,  175,

			  164,  164,  175,  175,   60,  164,  175,  164,  175,  164,
			  897,  908,  897,  897,  897,  897,  908,  908,  908,  908,
			  908,  909,  897,  921,  909,  910,  922,  910,  921,  897,
			  911,  911,  897,  897,  897,  897,  897,  897,  912,  913,
			  897,  897,  239,  923,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  904,
			  897,  897,  897,  897,  897,  897,  897,  897,  924,  925,
			  897,  918,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  897,  140,  140,  140,  140,  140,  140,
			  140,  897,  897,  925,  140,  140,  140,  140,  140,  141,

			  141,  141,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  897,  906,  906,  897,  926,  897,  175,  175,
			  175,  897,  897,  925,  175,  164,   60,  164,  175,   60,
			  175,  175,  164,  164,  175,  175,  175,  164,  164,  164,
			  175,  175,  164,  164,  897,  175,  175,  175,  164,  164,
			  175,  164,  175,  164,  175,  175,  164,  164,  175,  175,
			  164,  164,  175,  175,  175,  164,  164,  164,  175,  164,
			  175,  164,  908,  908,  908,  908,  908,  908,  908,  921,
			  897,  922,  927,  927,  897,  927,  927,  927,  923,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  924,  925,  928,  918,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  897,  140,  140,  140,  140,
			  140,  140,  897,  925,  138,  141,  434,  434,  140,  138,
			  897,  925,  140,  140,  140,  140,  897,  140,  140,  140,
			  140,  140,  929,  906,  906,  897,  930,  175,  175,  897,
			  897,  925,  164,  164,  175,  164,  175,  175,  164,  164,
			  175,  175,  175,  164,  164,  164,  175,  175,  164,  175,
			  175,  175,  164,  164,  175,  164,  175,  175,  164,  164,
			  175,  175,  164,  164,  175,  175,  175,  164,  164,  175,

			  164,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  931,  932,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  897,
			  140,  140,  140,  140,  140,  140,  897,  925,  140,  140,
			  897,  925,  434,  542,  897,  140,  140,  140,  140,  924,
			  897,  933,  929,  897,  897,  897,  175,  175,  897,  164,
			  164,  175,  164,  175,  175,  164,  164,  175,  175,  164,
			  164,  175,  175,  164,  175,  175,  175,  164,  164,  175,
			  164,  175,  175,  164,  164,  175,  175,  175,  175,  164,
			  164,  897,  897,  897,  897,  897,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  934,  932,  140,  140,  140,
			  140,  140,  140,  140,  140,  897,  140,  140,  140,  140,
			  140,  434,  897,  925,  897,  140,  140,  140,  140,  897,
			  924,  924,  933,  897,  897,  897,  897,  897,  175,  897,
			  175,  164,  175,  175,   60,  164,  175,  175,  175,  164,
			  164,  164,  175,  175,  175,  164,  164,  175,  164,  175,
			  175,  164,  164,  175,  175,  175,  175,  164,  164,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  934,  140,  140,  140,  140,  140,  897,  140,  140,  140,
			  140,  140,  897,  140,  140,  140,  897,  897,  924,  924,

			  935,  897,  175,  175,  164,  175,  175,  164,  164,  175,
			  175,  175,  164,  164,  175,  164,  175,  175,  164,  164,
			  175,  175,  175,  164,  897,  897,  897,  897,  897,  897,
			  897,  897,  936,  140,  140,  140,  897,  140,  897,  140,
			  140,  140,  897,  897,  931,  931,  937,  897,  175,  175,
			  164,  175,  164,  175,  164,  175,  175,  175,  164,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  938,  140,
			  140,  140,  140,  897,  140,  140,  897,  897,  934,  934,
			  897,  175,  175,  164,  175,  164,  175,  164,  175,  175,
			  164,  897,  897,  897,  897,  897,  938,  140,  140,  140,

			  140,  897,  897,  934,  934,  897,  175,  175,  164,  175,
			  164,  175,  897,  897,  939,  897,  140,  140,  140,  140,
			  897,  897,  934,  175,  175,  164,  175,  164,  175,  897,
			  897,  939,  897,  140,  140,  897,  897,  934,  175,  175,
			  897,  897,  140,  140,  897,  897,  934,  175,  175,  897,
			  897,  897,  897,  897,  897,  140,  897,  897,  175,  897,
			  897,  897,  897,  897,  897,  140,  897,  897,  175,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,    0,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,  103,  103,    0,    0,    0,
			    0,  134,  132,    1,    2,   15,  116,   18,  132,   16,
			   17,    7,    6,   13,    5,   11,    8,  108,  108,   14,
			   12,   28,   10,   29,   19,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   81,   96,   96,   96,
			   96,   21,   30,   22,    9,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   23,   20,   24,  120,  121,  122,  123,  120,  120,  120,
			  120,  120,  103,  106,  133,  103,  133,  133,   68,  133,
			  133,   70,  133,  133,   95,    1,    2,   27,  116,  115,

			  130,  130,  130,    0,    3,   32,  114,   31,  100,    0,
			    0,  108,    0,  108,   26,   25,    0,   96,   90,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   39,    0,   96,   89,
			   89,   80,   89,   89,   96,   96,   96,   96,   96,   96,
			    0,    0,    0,  107,    0,    0,    0,   99,    0,   99,
			   99,   99,    0,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   39,   99,   39,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			  102,  120,  122,  121,  118,  117,  119,  120,  120,  120,
			  120,  103,  106,    0,  103,    0,    0,    0,  104,  105,
			    0,    0,   70,   68,    0,   67,    0,   66,    0,    0,
			   95,   93,   93,    0,   94,  130,  124,  130,  130,  130,
			  130,  130,  130,    0,    4,   33,  114,    0,    0,    0,
			    0,    0,  110,    0,  108,    0,    0,   90,    0,    0,
			    0,    0,   96,   96,   38,   96,   96,   96,   96,   96,
			   96,   96,   96,    0,   96,   96,   96,   96,   41,   96,
			   96,   88,    0,    0,   81,   82,   81,   81,   81,   89,

			   96,   89,   89,   89,   96,   96,   96,   96,   96,   96,
			   40,   96,    0,    0,    0,   98,  101,    0,   99,   99,
			   38,    0,    0,   71,   71,   99,   99,   38,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,    0,   99,   99,   99,   99,   99,
			   99,   99,   41,   41,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   40,   40,
			   99,   99,  120,  120,  120,  120,  120,  120,  120,    0,
			  104,  105,    0,    0,   69,   67,   66,   70,    0,  128,
			  131,  131,  129,  125,  126,  127,   91,  114,    0,  114,

			    0,    0,    0,  110,    0,    0,    0,  113,  108,    0,
			    0,    0,    0,    0,   97,   96,   96,   96,   96,   96,
			   37,   96,   96,   96,   96,    0,   96,   96,   96,   96,
			   96,   96,    0,    0,   96,   80,   96,   96,   96,   96,
			    0,    0,   80,   80,   80,   36,    0,   43,   96,   96,
			   96,   96,   65,    0,    0,    0,   61,   99,   99,    0,
			   71,   71,   99,   99,   99,   99,   99,   99,   99,   99,
			   37,   99,   99,   37,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   36,   43,   36,   43,   99,   99,   99,   99,   99,   99,

			   99,  105,  114,    0,    0,    0,  109,  110,    0,  111,
			    0,  113,    0,    0,    0,  108,   77,    0,    0,    0,
			   58,   96,   96,   96,   96,   96,   96,   44,   96,    0,
			   96,   96,   35,   96,   96,   96,   82,   82,   82,   81,
			    0,    0,   96,   96,    0,   96,   96,   96,   96,    0,
			   65,   65,    0,   64,   64,    0,   58,   99,    0,   58,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   44,   99,   44,   99,   99,   35,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  114,    0,    0,  110,  111,    0,    0,  113,    0,

			    0,    0,    0,   77,    0,    0,    0,   96,   59,   96,
			   60,   96,   96,   46,   96,    0,   96,   96,   96,   96,
			   96,   96,   80,   80,    0,   52,   96,   96,   96,    0,
			    0,    0,    0,   63,   62,    0,    0,    0,   99,    0,
			   59,   59,   99,   60,   99,   60,   99,   99,   46,   99,
			   99,   46,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   52,   99,   99,   99,   52,   99,    0,
			  100,    0,  111,    0,  114,    0,   79,    0,    0,  112,
			    0,   96,   96,   57,   96,   45,    0,   42,   56,   34,
			   96,   50,    0,   96,   96,   96,    0,    0,    0,    0,

			    0,    0,   99,   99,   99,   57,   99,   57,   99,   45,
			   42,   56,   42,   56,   34,   34,   99,   50,   99,   50,
			   99,   99,   99,   99,    0,  111,    0,    0,    0,    0,
			   76,  112,    0,   96,   96,   96,   85,   96,    0,   96,
			   96,   53,    0,    0,    0,    0,    0,  101,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   53,   99,  113,
			    0,  113,    0,    0,    0,    0,   76,  112,    0,   96,
			   96,   47,   96,   84,   51,   96,    0,    0,    0,    0,
			    0,   99,   99,   99,   47,   47,   99,   99,   51,   99,
			   51,  113,   78,    0,   76,  112,    0,   96,   96,   96,

			   96,   83,   83,   83,   83,   92,   99,   99,   99,   99,
			   99,   99,    0,    0,    0,    0,   96,   49,   48,   96,
			    0,    0,    0,   99,   49,   49,   48,   48,   99,    0,
			    0,    0,    0,   96,   96,    0,    0,    0,   99,   99,
			   75,   72,   96,   54,    0,    0,    0,   99,   54,    0,
			    0,   75,    0,    0,    0,   96,    0,    0,   99,    0,
			    0,   72,    0,    0,   72,   55,    0,    0,   55,    0,
			   74,    0,    0,    0,    0,    0,    0,   74,   72,    0,
			    0,    0,    0,    0,    0,    0,   73,   86,   87,    0,
			    0,    0,   73,    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 7365
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 897
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 898
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

	yyNb_rules: INTEGER = 133
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 134
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
