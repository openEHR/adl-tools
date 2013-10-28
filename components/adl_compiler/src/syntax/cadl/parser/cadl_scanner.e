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
--|#line 362 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 362")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 90 then
if yy_act = 89 then
--|#line 363 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 363")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 377 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 377")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 91 then
--|#line 384 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 384")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 390 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 390")
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
--|#line 396 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 396")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 400 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 400")
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
--|#line 442 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 442")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 448 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 448")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 98 then
if yy_act = 97 then
--|#line 454 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 454")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 460 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 460")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 99 then
--|#line 467 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 467")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 473 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 473")
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
--|#line 479 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 479")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_REL_PATH
				last_string_value := text
			
else
--|#line 485 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 485")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 492 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 492")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 104 then
--|#line 496 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 496")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 500 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 500")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 107 then
if yy_act = 106 then
--|#line 504 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 504")
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
--|#line 516 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 516")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 108 then
--|#line 523 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 523")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
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
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 544 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 544")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 112 then
--|#line 548 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 548")
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
--|#line 549 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 549")
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
--|#line 550 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 550")
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
--|#line 570 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 570")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 116 then
--|#line 575 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 575")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 583 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 583")
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
--|#line 585 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 585")
end
in_buffer.append_character ('"')
else
--|#line 587 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 587")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 120 then
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
end
in_buffer.append_string (text)
else
--|#line 593 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 593")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 123 then
if yy_act = 122 then
--|#line 598 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 598")
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
--|#line 609 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 609")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 124 then
--|#line 618 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 618")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 620 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 620")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 129 then
if yy_act <= 127 then
if yy_act = 126 then
--|#line 621 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 621")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 622 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 622")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 128 then
--|#line 623 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 623")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 624 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 624")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 131 then
if yy_act = 130 then
--|#line 626 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 626")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 627 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 627")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 132 then
--|#line 631 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 631")
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
			create an_array.make_filled (0, 0, 7183)
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

			   95,   75,   95,   95,  105,  238,  106,  106,  106,  106,
			  106,  258,  109,  213,  110,  155,  111,  111,  111,  111,
			  111,  116,  116,  189,  116,  878,  457,  117,   84,   85,
			   84,   85,  109,  156,  110,  156,  113,  113,  113,  113,
			  113,  457,   76,  102,  118,  191,  259,   76,  877,   94,
			  453,  190,  860,   94,  112,  212,  117,  212,  212,  214,
			  239,  162,   95,  162,   95,   95,  260,  260,  260,  260,
			  260,  861,  234,  192,  112,  234,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   86,   86,   91,
			   86,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  116,  116,  156,
			  116,  116,  116,  238,  116,  855,  211,  116,  116,  139,
			  116,  205,  211,  116,  116,  854,  116,  830,  116,  116,

			  118,  116,  116,  116,  118,  116,  730,  162,  499,  119,
			  118,  211,  122,  120,  123,  121,  118,  139,  211,  206,
			  127,  118,  315,  124,  212,  118,  212,  212,  411,  211,
			  116,  116,  128,  116,  125,  156,  129,  119,  239,  268,
			  122,  120,  123,  121,  377,  126,  269,  156,  127,  116,
			  116,  124,  116,  118,  116,  116,  207,  116,  116,  116,
			  128,  116,  125,  162,  129,  216,  810,  130,  131,  215,
			  215,  215,  118,  132,  126,  162,  133,  118,  594,  116,
			  116,  118,  116,  116,  116,  208,  116,  135,  217,  217,
			  217,  116,  116,  134,  116,  130,  131,  216,  268,  221,

			  136,  132,  118,  228,  133,  269,  118,  218,  218,  236,
			  229,  503,  236,  229,  118,  135,  153,  116,  116,  153,
			  116,  134,  147,  211,  154,  143,  503,  148,  136,  116,
			  116,  225,  116,  144,  222,  223,  268,  155,  222,  223,
			  118,  778,  156,  269,  193,  137,  137,  137,  137,  137,
			  147,  156,  118,  143,  156,  145,  148,  194,  181,  138,
			  146,  144,  231,  156,  167,  156,  139,  226,  227,  156,
			  162,  156,  195,  140,  635,  141,  225,  142,  310,  162,
			  211,  221,  162,  145,  743,  196,  182,  138,  146,  635,
			  162,  162,  168,  162,  139,  116,  116,  162,  116,  162,

			  219,  219,  219,  742,  141,  162,  142,  153,  233,  211,
			  153,  233,  226,  227,  311,  154,  222,  223,  266,  741,
			  234,  235,  155,  156,  156,  156,  156,  156,  157,  312,
			  236,  760,  760,  760,  156,  156,  156,  156,  156,  158,
			  156,  156,  156,  159,  156,  160,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  161,  218,  218,
			  231,  156,  162,  162,  163,  162,  162,  164,  162,  162,
			  162,  165,  162,  166,  162,  162,  162,  162,  162,  163,
			  162,  162,  162,  162,  162,  169,  215,  215,  215,  156,
			  156,  344,  282,  156,  170,  156,  156,  156,  818,  246,

			  156,  228,  383,  382,  233,  383,  156,  233,  247,  247,
			  247,  247,  247,  171,  162,  162,  234,  162,  162,  344,
			  602,  162,  172,  162,  162,  156,  236,  156,  156,  162,
			  162,  173,  740,  156,  156,  177,  222,  223,  156,  819,
			  156,  730,  174,  248,  156,  726,  156,  178,  183,  184,
			  156,  258,  162,  155,  185,  162,  231,  211,  249,  175,
			  112,  162,  250,  179,  251,  162,  162,  162,  162,  812,
			  813,  176,  162,  156,  162,  180,  186,  187,  162,  156,
			  162,  156,  188,  690,  201,  156,  197,  156,  338,  202,
			  253,  156,  253,  253,  198,  255,  255,  255,  255,  255,

			  267,  162,  265,  265,  265,  265,  265,  162,  548,  156,
			  256,  549,  203,  162,  199,  156,  338,  204,  548,  162,
			  510,  548,  200,  241,  241,  268,  241,  156,  156,  156,
			  156,  156,  342,  257,  215,  215,  215,  109,  256,  110,
			  730,  263,  263,  263,  263,  263,  264,  855,  242,  501,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  261,  261,  261,  261,  261,  109,  112,
			  110,  895,  263,  263,  263,  263,  263,  153,  262,  613,
			  153,  116,  116,  598,  116,  154,  116,  116,  109,  116,

			  267,  268,  155,  243,  267,  268,  827,  827,  269,  267,
			  268,  553,  269,  412,  118,  117,  262,  269,  516,  118,
			  112,  116,  116,  382,  116,  116,  116,  382,  116,  117,
			  304,  117,  378,  631,  267,  268,  454,  161,  267,  268,
			  271,  352,  269,  117,  118,  156,  269,  156,  118,  116,
			  116,  156,  116,  116,  116,  273,  116,  272,  304,  156,
			  117,  357,  267,  268,  450,  156,  267,  268,  271,  352,
			  269,  412,  118,  156,  269,  156,  118,  116,  116,  156,
			  116,  274,  411,  273,  345,  272,  399,  156,  895,  357,
			  267,  268,  379,  156,  229,  275,  117,  229,  269,  233,

			  118,  393,  233,  256,  116,  116,  392,  116,  391,  274,
			  117,  234,  117,  390,  309,  387,  276,  267,  268,  116,
			  116,  236,  116,  275,  117,  269,  257,  118,  226,  227,
			  895,  256,  267,  268,  812,  813,  116,  116,  232,  116,
			  269,  117,  118,  309,  276,  377,  231,  277,  278,  267,
			  268,  231,  384,  382,  279,  384,  156,  269,  211,  118,
			  116,  116,  156,  116,  116,  116,  378,  116,  527,  339,
			  377,  211,  280,  267,  268,  277,  278,  267,  268,  527,
			  319,  269,  279,  118,  156,  282,  315,  118,  818,  527,
			  156,  116,  116,  211,  116,  116,  116,  339,  116,  730, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  280,  313,  281,  634,  267,  268,  634,  527,  267,  268,
			  633,  698,  269,  633,  118,  152,  269,  310,  118,  116,
			  116,  156,  116,  356,  284,  116,  116,  156,  116,  820,
			  281,  283,  267,  268,  634,  375,  375,  375,  267,  268,
			  269,  254,  118,  253,  116,  116,  269,  116,  118,  156,
			  252,  356,  284,  252,  252,  156,  252,  267,  268,  283,
			  548,  116,  116,  549,  116,  269,  245,  118,   99,  286,
			  376,  376,  376,  285,  267,  268,  394,   96,  116,  116,
			  895,  116,  269,  630,  118,  232,  211,  156,  287,  117,
			  288,  267,  268,  156,  305,  209,  152,  286,  306,  269,

			  150,  118,  348,  117,  115,  117,  116,  116,  289,  116,
			  116,  116,  631,  116,  622,  156,  287,  117,  288,  267,
			  268,  156,  305,  267,  268,  622,  306,  269,  114,  118,
			  348,  269,  632,  118,  117,  622,  289,  290,  267,  291,
			  138,  398,  398,  398,  398,  398,  269,  117,  302,  725,
			  297,  303,  107,  622,  297,  292,  141,  633,  104,  293,
			  633,  117,  294,  117,   99,   97,  117,  307,  138,  117,
			   96,  295,  403,  296,  895,  117,  302,  725,  895,  303,
			  117,  634,  117,  292,  895,  141,  895,  293,  386,  386,
			  294,  386,  117,  895,  117,  307,  895,  627,  117,  895,

			  295,  895,  296,  298,  298,  298,  298,  298,  628,  895,
			  308,  117,  117,  242,  117,  267,  268,  117,  629,  156,
			  353,  299,  895,  320,  300,  156,  117,  895,  895,  156,
			  301,  117,  895,  117,  233,  895,  628,  233,  308,  895,
			  599,  156,  599,  117,  895,  117,  234,  156,  353,  299,
			  600,  153,  300,  156,  153,  895,  236,  162,  301,  154,
			  153,  895,  117,  153,  267,  268,  155,  774,  154,  162,
			  895,  774,  269,  267,  268,  155,  153,  211,  601,  153,
			  895,  269,  895,  895,  154,  895,  231,  895,  774,  267,
			  268,  155,  895,  895,  156,  316,  317,  269,  895,  774,

			  156,  161,  407,  407,  407,  407,  318,  366,  895,  895,
			  161,  267,  321,  895,  322,  322,  322,  322,  322,  320,
			  895,  211,  156,  316,  317,  156,  161,  268,  156,  156,
			  156,  156,  156,  156,  318,  366,  268,  156,  156,  156,
			  156,  156,  156,  268,  895,  156,  156,  156,  156,  156,
			  694,  895,  895,  162,  215,  215,  215,  316,  317,  318,
			  153,  694,  895,  153,  895,  162,  895,  895,  154,  153,
			  895,  695,  153,  267,  268,  155,  895,  154,  895,  895,
			  895,  269,  267,  268,  155,  323,  324,  325,  895,  694,
			  269,  268,  326,  156,  156,  156,  156,  156,  217,  217,

			  217,  268,  895,  156,  156,  156,  156,  156,  156,  326,
			  161,  328,  895,  153,  156,  895,  153,  267,  268,  161,
			  326,  154,  895,  350,  895,  320,  267,  268,  155,  328,
			  895,  156,  153,  895,  269,  153,  156,  327,  895,  328,
			  154,  153,  156,  329,  153,  267,  268,  155,  895,  154,
			  895,  350,  329,  269,  267,  268,  155,  330,  895,  162,
			  895,  895,  269,  161,  388,  389,  389,  389,  389,  389,
			  333,  331,  156,  895,  895,  332,  334,  895,  156,  895,
			  329,  268,  161,  156,  156,  156,  156,  156,  864,  895,
			  268,  161,  156,  156,  156,  156,  156,  895,  333,  864,

			  156,  156,  156,  332,  334,  333,  156,  156,  156,  864,
			  332,  334,  268,  343,  156,  156,  156,  156,  156,  268,
			  368,  156,  156,  156,  156,  156,  895,  864,  895,  156,
			  156,  895,  895,  336,  338,  156,  156,  895,  335,  337,
			  268,  343,  156,  156,  156,  156,  156,  339,  268,  368,
			  156,  156,  156,  156,  156,  268,  895,  156,  156,  156,
			  156,  156,  340,  344,  211,  895,  343,  268,  211,  156,
			  156,  156,  156,  156,  268,  341,  156,  156,  156,  156,
			  156,  268,  895,  156,  156,  156,  156,  156,  895,  895,
			  865,  347,  156,  895,  346,  345,  352,  348,  360,  895,

			  895,  865,  361,  268,  350,  156,  156,  156,  156,  156,
			  268,  865,  156,  156,  156,  156,  156,  895,  895,  353,
			  156,  895,  895,  895,  354,  349,  360,  356,  895,  865,
			  361,  268,  351,  156,  156,  156,  156,  156,  156,  895,
			  362,  219,  219,  219,  156,  267,  268,  355,  370,  371,
			  372,  373,  374,  320,  895,  358,  895,  895,  895,  156,
			  775,  895,  357,  895,  775,  895,  156,  360,  362,  895,
			  895,  361,  156,  211,  268,  895,  156,  156,  156,  156,
			  156,  775,  395,  395,  395,  395,  395,  162,  211,  895,
			  359,  362,  775,  386,  386,  363,  386,  256,  268,  364,

			  156,  156,  156,  156,  156,  268,  895,  156,  156,  156,
			  156,  156,  400,  400,  400,  400,  400,  895,  895,  365,
			  257,  895,  396,  895,  396,  256,  366,  397,  397,  397,
			  397,  397,  895,  895,  895,  404,  895,  404,  895,  368,
			  405,  405,  405,  405,  405,  408,  408,  408,  408,  408,
			  215,  215,  215,  895,  367,  430,  430,  430,  430,  430,
			  431,  431,  431,  431,  431,  215,  215,  215,  369,  380,
			  381,  382,  380,  381,  380,  380,  380,  380,  380,  380,
			  380,  380,  383,  235,  235,  380,  235,  235,  235,  235,
			  235,  380,  384,  380,  380,  380,  380,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  380,  380,  385,  380,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  241,  241,  895,  241,  117,  117,  117,  117,  117,  676,
			  676,  676,  676,  109,  895,  110,  895,  406,  406,  406,
			  406,  406,  895,  895,  895,  242,  895,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,

			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  401,  401,  401,  401,  401,  112,  117,  413,  895,  117,
			  895,  895,  117,  416,  895,  402,  895,  895,  414,  895,
			  117,  895,  117,  117,  895,  117,  117,  117,  117,  117,
			  243,  895,  895,  117,  117,  413,  895,  117,  403,  117,
			  117,  416,  415,  402,  895,  895,  414,  117,  117,  117,
			  895,  117,  417,  117,  117,  117,  895,  117,  117,  117,
			  418,  117,  117,  117,  117,  895,  895,  117,  895,  419,
			  415,  895,  422,  117,  895,  117,  117,  117,  117,  117,
			  417,  895,  117,  895,  117,  411,  156,  117,  418,  117, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  423,  117,  479,  117,  895,  420,  117,  419,  117,  895,
			  895,  423,  421,  117,  117,  117,  895,  895,  117,  895,
			  117,  423,  117,  895,  156,  895,  895,  117,  424,  117,
			  479,  778,  778,  420,  778,  425,  117,  117,  117,  423,
			  421,  895,  895,  117,  117,  117,  895,  895,  117,  895,
			  117,  427,  117,  426,  803,  117,  424,  117,  895,  117,
			  429,  895,  117,  425,  117,  516,  117,  117,  117,  117,
			  117,  117,  895,  117,  117,  117,  117,  895,  694,  427,
			  117,  426,  833,  117,  117,  428,  117,  117,  429,  696,
			  833,  895,  847,  117,  847,  895,  895,  117,  117,  697,

			  117,  895,  848,  833,  117,  432,  432,  432,  432,  432,
			  895,  895,  895,  428,  895,  117,  895,  696,  833,  117,
			  434,  434,  434,  434,  434,  435,  435,  435,  435,  435,
			  849,  895,  156,  433,  117,  117,  895,  895,  156,  117,
			  436,  436,  436,  436,  436,  895,  895,  117,  117,  117,
			  117,  895,  895,  433,  117,  117,  438,  475,  439,  895,
			  156,  895,  117,  117,  117,  117,  156,  117,  433,  895,
			  117,  895,  437,  437,  437,  437,  437,  117,  440,  117,
			  834,  441,  117,  895,  117,  895,  117,  442,  834,  117,
			  117,  117,  117,  117,  117,  895,  444,  117,  895,  117,

			  433,  834,  117,  895,  117,  117,  440,  117,  895,  441,
			  301,  117,  443,  117,  117,  442,  834,  895,  117,  117,
			  117,  117,  895,  117,  445,  117,  858,  858,  858,  858,
			  117,  117,  117,  117,  895,  117,  895,  117,  301,  117,
			  443,  446,  117,  117,  117,  895,  117,  895,  117,  117,
			  117,  117,  445,  842,  895,  447,  895,  117,  117,  117,
			  895,  842,  117,  117,  117,  895,  117,  895,  117,  446,
			  895,  117,  448,  895,  842,  117,  117,  117,  895,  117,
			  117,  895,  117,  447,  449,  870,  895,  895,  117,  842,
			  895,  117,  895,  117,  117,  451,  870,  451,  451,  451,

			  451,  451,  310,  156,  895,  455,  870,  895,  117,  156,
			  895,  117,  452,  449,  452,  452,  452,  452,  452,  310,
			  156,  895,  516,  315,  870,  895,  156,  895,  895,  411,
			  456,  156,  895,  455,  423,  695,  458,  156,  459,  459,
			  459,  459,  459,  895,  895,  423,  697,  321,  156,  322,
			  322,  322,  322,  322,  156,  423,  697,  895,  456,  684,
			  895,  268,  156,  156,  156,  156,  156,  156,  156,  267,
			  268,  895,  895,  423,  697,  895,  684,  320,  455,  895,
			  684,  895,  268,  156,  156,  156,  156,  156,  156,  895,
			  156,  156,  156,  464,  895,  456,  156,  156,  156,  156,

			  895,  462,  267,  268,  684,  156,  460,  895,  895,  843,
			  320,  162,  156,  465,  468,  895,  156,  843,  156,  156,
			  156,  464,  895,  461,  895,  156,  156,  156,  462,  462,
			  843,  895,  268,  156,  156,  156,  156,  156,  156,  895,
			  156,  465,  468,  895,  162,  843,  156,  895,  464,  268,
			  895,  156,  156,  156,  156,  156,  463,  156,  895,  156,
			  895,  156,  895,  156,  469,  156,  268,  156,  156,  156,
			  156,  156,  156,  470,  156,  474,  466,  895,  465,  895,
			  156,  477,  895,  468,  482,  156,  895,  156,  895,  156,
			  156,  156,  469,  156,  268,  156,  156,  156,  156,  156,

			  156,  470,  156,  474,  871,  895,  467,  895,  156,  477,
			  895,  471,  482,  895,  895,  871,  469,  268,  156,  156,
			  156,  156,  156,  156,  268,  871,  156,  156,  156,  156,
			  156,  268,  156,  156,  156,  156,  156,  156,  156,  478,
			  895,  895,  895,  871,  472,  268,  470,  156,  156,  156,
			  156,  156,  268,  474,  156,  156,  156,  156,  156,  268,
			  156,  156,  156,  156,  156,  156,  156,  478,  774,  485,
			  895,  475,  776,  268,  473,  156,  156,  156,  156,  156,
			  268,  476,  156,  156,  156,  156,  156,  895,  268,  776,
			  156,  156,  156,  156,  156,  477,  895,  487,  156,  156,

			  776,  156,  478,  482,  156,  156,  156,  156,  485,  895,
			  488,  873,  156,  873,  268,  484,  156,  156,  156,  156,
			  156,  874,  156,  480,  489,  895,  156,  156,  156,  156,
			  481,  483,  156,  156,  156,  156,  485,  895,  488,  895,
			  156,  895,  156,  484,  895,  484,  895,  156,  156,  875,
			  156,  895,  489,  156,  492,  268,  156,  156,  156,  156,
			  156,  156,  895,  268,  895,  156,  156,  156,  156,  156,
			  156,  156,  494,  486,  895,  156,  156,  156,  895,  488,
			  489,  156,  492,  268,  493,  156,  156,  156,  156,  156,
			  268,  156,  156,  156,  156,  156,  156,  156,  268,  156,

			  156,  156,  156,  156,  156,  156,  895,  490,  491,  895,
			  492,  268,  493,  156,  156,  156,  156,  156,  493,  156,
			  156,  381,  382,  895,  381,  156,  156,  397,  397,  397,
			  397,  397,  497,  383,  762,  763,  762,  763,  495,  497,
			  895,  895,  895,  384,  895,  895,  496,  895,  156,  895,
			  895,  494,  895,  895,  156,  388,  389,  389,  389,  389,
			  389,  498,  500,  500,  500,  500,  500,  895,  497,  895,
			  895,  895,  764,  385,  502,  502,  502,  502,  502,  504,
			  504,  504,  504,  504,  505,  505,  505,  505,  505,  506,
			  895,  506,  895,  895,  507,  507,  507,  507,  507,  402,

			  501,  508,  508,  508,  508,  508,  405,  405,  405,  405,
			  405,  509,  509,  509,  509,  509,  514,  514,  514,  514,
			  514,  895,  403,  734,  895,  511,  512,  402,  513,  513,
			  513,  513,  513,  515,  515,  515,  515,  515,  117,  117,
			  734,  895,  117,  895,  734,  117,  895,  521,  736,  510,
			  518,  895,  117,  117,  117,  519,  117,  520,  117,  117,
			  117,  117,  895,  117,  522,  736,  117,  117,  734,  736,
			  117,  895,  895,  117,  117,  521,  117,  117,  518,  117,
			  895,  117,  895,  117,  519,  520,  117,  117,  117,  895,
			  117,  117,  522,  736,  895,  117,  523,  117,  895,  411,

			  524,  895,  117,  895,  542,  117,  117,  525,  117,  117,
			  526,  895,  156,  117,  117,  542,  117,  895,  561,  895,
			  117,  528,  117,  895,  523,  542,  117,  117,  524,  117,
			  117,  117,  117,  895,  117,  525,  156,  895,  526,  117,
			  156,  117,  156,  542,  117,  895,  561,  895,  895,  528,
			  895,  117,  117,  117,  529,  117,  895,  895,  117,  117,
			  530,  117,  117,  531,  156,  117,  117,  117,  117,  895,
			  156,  895,  895,  117,  532,  117,  117,  533,  117,  117,
			  117,  117,  529,  895,  117,  775,  895,  117,  530,  777,
			  117,  531,  895,  117,  895,  895,  895,  117,  880,  880, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  880,  880,  532,  895,  117,  533,  777,  117,  895,  895,
			  117,  430,  430,  430,  430,  430,  268,  777,  431,  431,
			  431,  431,  431,  269,  290,  895,  291,  895,  432,  432,
			  432,  432,  432,  117,  895,  156,  117,  156,  534,  562,
			  895,  156,  117,  156,  895,  535,  293,  895,  554,  536,
			  434,  434,  434,  434,  434,  117,  538,  538,  538,  538,
			  538,  117,  895,  156,  117,  156,  534,  562,  117,  156,
			  117,  156,  895,  535,  293,  895,  554,  536,  435,  435,
			  435,  435,  435,  117,  436,  436,  436,  436,  436,  895,
			  895,  895,  292,  895,  895,  895,  117,  895,  537,  437,

			  437,  437,  437,  437,  156,  895,  569,  895,  295,  799,
			  156,  895,  117,  799,  117,  539,  539,  539,  539,  539,
			  292,  540,  540,  540,  540,  540,  537,  895,  895,  895,
			  799,  117,  156,  895,  569,  117,  117,  295,  156,  117,
			  117,  799,  895,  117,  541,  541,  541,  541,  541,  117,
			  117,  117,  117,  117,  117,  117,  117,  895,  117,  895,
			  117,  117,  895,  117,  117,  895,  547,  117,  117,  800,
			  895,  895,  117,  800,  117,  117,  543,  117,  895,  544,
			  117,  117,  895,  117,  117,  117,  117,  895,  895,  117,
			  800,  545,  895,  117,  117,  117,  895,  117,  895,  117,

			  895,  800,  546,  117,  543,  895,  117,  544,  117,  895,
			  117,  117,  556,  895,  556,  556,  556,  556,  556,  545,
			  156,  895,  117,  895,  117,  895,  156,  895,  117,  451,
			  546,  451,  451,  451,  451,  451,  310,  555,  452,  117,
			  452,  452,  452,  452,  452,  310,  895,  458,  156,  458,
			  458,  458,  458,  458,  156,  321,  895,  459,  459,  459,
			  459,  459,  269,  895,  895,  895,  555,  551,  268,  895,
			  156,  156,  156,  156,  156,  268,  552,  156,  156,  156,
			  156,  156,  156,  895,  895,  895,  895,  268,  156,  156,
			  156,  156,  156,  156,  895,  559,  554,  268,  156,  156,

			  156,  156,  156,  156,  156,  156,  156,  555,  895,  895,
			  156,  156,  572,  566,  895,  559,  156,  895,  561,  895,
			  895,  565,  895,  559,  557,  268,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  895,  558,  895,  895,  156,
			  572,  566,  562,  560,  895,  895,  563,  895,  268,  565,
			  156,  156,  156,  156,  156,  268,  895,  156,  156,  156,
			  156,  156,  268,  895,  156,  156,  156,  156,  156,  570,
			  564,  156,  895,  895,  895,  895,  268,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  565,  895,  577,  156,
			  156,  156,  566,  569,  574,  895,  895,  570,  895,  156,

			  573,  895,  895,  895,  268,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  567,  895,  577,  156,  156,  156,
			  568,  571,  574,  895,  895,  572,  895,  268,  573,  156,
			  156,  156,  156,  156,  268,  156,  156,  156,  156,  156,
			  156,  156,  895,  156,  156,  156,  156,  584,  579,  156,
			  156,  156,  156,  575,  577,  895,  580,  895,  573,  895,
			  895,  895,  268,  156,  156,  156,  156,  156,  156,  156,
			  895,  156,  156,  156,  156,  584,  579,  156,  156,  156,
			  156,  895,  578,  895,  580,  895,  576,  895,  895,  268,
			  579,  156,  156,  156,  156,  156,  268,  895,  156,  156,

			  156,  156,  156,  268,  156,  156,  156,  156,  156,  156,
			  156,  585,  799,  156,  547,  895,  801,  580,  581,  156,
			  583,  268,  586,  156,  156,  156,  156,  156,  895,  895,
			  156,  895,  156,  801,  895,  895,  156,  895,  156,  585,
			  895,  156,  895,  895,  801,  582,  895,  156,  583,  895,
			  586,  268,  583,  156,  156,  156,  156,  156,  156,  589,
			  589,  589,  589,  589,  156,  547,  268,  584,  156,  156,
			  156,  156,  156,  590,  590,  590,  590,  590,  895,  895,
			  587,  395,  395,  395,  395,  395,  591,  895,  591,  591,
			  591,  591,  591,  895,  895,  588,  895,  501,  592,  592,

			  592,  592,  592,  507,  507,  507,  507,  507,  593,  593,
			  593,  593,  593,  402,  595,  595,  595,  595,  595,  596,
			  596,  596,  596,  596,  597,  597,  597,  597,  597,  592,
			  592,  592,  592,  592,  895,  895,  403,  895,  117,  117,
			  895,  402,  117,  606,  895,  512,  594,  513,  513,  513,
			  513,  513,  117,  117,  117,  117,  117,  510,  117,  895,
			  117,  608,  895,  605,  609,  117,  117,  117,  607,  895,
			  117,  606,  895,  895,  117,  117,  117,  117,  117,  117,
			  117,  117,  895,  117,  117,  117,  610,  117,  117,  608,
			  895,  895,  609,  117,  156,  771,  607,  895,  611,  117,

			  156,  117,  895,  895,  615,  117,  117,  117,  614,  117,
			  117,  117,  771,  117,  610,  117,  771,  612,  117,  895,
			  117,  117,  156,  117,  895,  117,  611,  117,  156,  117,
			  117,  117,  615,  895,  117,  117,  614,  117,  616,  117,
			  771,  117,  618,  117,  895,  612,  617,  117,  117,  117,
			  117,  117,  117,  117,  895,  117,  117,  117,  895,  895,
			  117,  433,  117,  117,  895,  117,  616,  895,  895,  117,
			  618,  895,  895,  895,  617,  117,  895,  895,  895,  117,
			  895,  895,  117,  895,  895,  895,  117,  619,  619,  619,
			  619,  619,  117,  538,  538,  538,  538,  538,  895,  895,

			  117,  117,  268,  895,  539,  539,  539,  539,  539,  269,
			  895,  895,  625,  895,  117,  117,  117,  117,  895,  438,
			  620,  439,  895,  540,  540,  540,  540,  540,  117,  117,
			  895,  621,  541,  541,  541,  541,  541,  895,  117,  623,
			  625,  117,  117,  624,  441,  117,  117,  895,  620,  895,
			  442,  156,  117,  117,  117,  895,  117,  156,  117,  621,
			  667,  667,  667,  667,  667,  895,  117,  623,  117,  117,
			  117,  624,  441,  895,  895,  895,  636,  626,  442,  156,
			  895,  117,  117,  117,  117,  156,  556,  117,  556,  556,
			  556,  556,  556,  895,  881,  268,  117,  156,  156,  156,

			  156,  156,  895,  895,  268,  626,  156,  156,  156,  156,
			  156,  881,  156,  117,  638,  881,  895,  268,  156,  156,
			  156,  156,  156,  156,  637,  895,  156,  156,  641,  895,
			  156,  644,  156,  156,  638,  640,  156,  895,  895,  881,
			  156,  895,  638,  895,  636,  268,  156,  156,  156,  156,
			  156,  156,  895,  895,  156,  156,  641,  895,  156,  644,
			  156,  156,  639,  640,  156,  895,  895,  895,  268,  640,
			  156,  156,  156,  156,  156,  156,  895,  645,  895,  895,
			  156,  156,  895,  895,  641,  895,  156,  895,  268,  646,
			  156,  156,  156,  156,  156,  895,  268,  642,  156,  156, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  156,  156,  156,  156,  644,  645,  895,  895,  156,  156,
			  156,  652,  643,  645,  156,  156,  156,  646,  895,  895,
			  895,  156,  650,  895,  268,  646,  156,  156,  156,  156,
			  156,  156,  647,  651,  156,  895,  895,  156,  156,  652,
			  156,  648,  895,  156,  156,  895,  895,  895,  895,  156,
			  650,  895,  268,  649,  156,  156,  156,  156,  156,  156,
			  895,  651,  156,  800,  895,  156,  895,  802,  156,  651,
			  268,  895,  156,  156,  156,  156,  156,  156,  895,  655,
			  895,  895,  895,  156,  802,  268,  652,  156,  156,  156,
			  156,  156,  156,  156,  658,  802,  895,  653,  156,  156,

			  895,  895,  655,  895,  895,  156,  657,  655,  895,  895,
			  895,  156,  730,  268,  654,  156,  156,  156,  156,  156,
			  156,  156,  658,  156,  834,  661,  156,  156,  895,  156,
			  656,  895,  835,  268,  657,  156,  156,  156,  156,  156,
			  156,  657,  662,  156,  895,  835,  156,  895,  156,  156,
			  658,  156,  895,  661,  156,  895,  663,  156,  664,  895,
			  835,  591,  895,  591,  591,  591,  591,  591,  156,  659,
			  662,  156,  895,  895,  156,  895,  156,  156,  660,  895,
			  895,  895,  156,  895,  663,  268,  664,  156,  156,  156,
			  156,  156,  268,  895,  156,  156,  156,  156,  156,  668,

			  895,  895,  661,  592,  592,  592,  592,  592,  895,  662,
			  670,  670,  670,  670,  670,  895,  895,  895,  669,  671,
			  671,  671,  671,  671,  672,  672,  672,  672,  672,  895,
			  665,  673,  673,  673,  673,  673,  895,  666,  674,  674,
			  674,  674,  674,  895,  679,  895,  669,  117,  594,  675,
			  675,  675,  675,  675,  677,  677,  677,  677,  677,  895,
			  117,  117,  680,  117,  895,  117,  117,  895,  895,  262,
			  117,  681,  679,  117,  117,  117,  117,  895,  895,  117,
			  117,  117,  117,  895,  117,  895,  117,  117,  117,  117,
			  680,  895,  117,  117,  117,  895,  895,  262,  117,  681,

			  117,  117,  895,  117,  895,  117,  117,  686,  682,  683,
			  117,  117,  895,  117,  117,  117,  117,  117,  117,  117,
			  117,  895,  117,  895,  117,  688,  685,  117,  117,  117,
			  895,  117,  895,  117,  117,  686,  682,  683,  117,  895,
			  117,  117,  895,  689,  895,  117,  687,  117,  117,  117,
			  895,  117,  117,  688,  685,  895,  117,  117,  117,  117,
			  895,  117,  619,  619,  619,  619,  619,  895,  895,  117,
			  117,  689,  117,  895,  687,  117,  693,  700,  117,  156,
			  117,  692,  117,  117,  117,  156,  895,  691,  117,  117,
			  117,  117,  117,  895,  895,  895,  117,  895,  117,  895,

			  895,  117,  895,  117,  693,  700,  156,  156,  117,  692,
			  117,  117,  156,  156,  701,  691,  156,  156,  895,  895,
			  117,  117,  156,  156,  895,  895,  699,  117,  699,  699,
			  699,  699,  699,  268,  156,  156,  156,  156,  156,  156,
			  156,  895,  701,  156,  156,  156,  267,  268,  882,  156,
			  156,  156,  704,  268,  320,  156,  156,  156,  156,  156,
			  701,  156,  156,  703,  895,  882,  895,  156,  156,  882,
			  895,  156,  156,  895,  895,  895,  895,  156,  895,  895,
			  704,  268,  895,  156,  156,  156,  156,  156,  702,  156,
			  156,  703,  895,  882,  895,  156,  156,  895,  703,  268,

			  162,  156,  156,  156,  156,  156,  268,  156,  156,  156,
			  156,  156,  156,  156,  707,  156,  156,  895,  709,  156,
			  715,  156,  156,  704,  895,  156,  705,  895,  895,  708,
			  895,  895,  895,  895,  268,  156,  156,  156,  156,  156,
			  156,  156,  707,  156,  156,  895,  709,  156,  715,  156,
			  156,  706,  895,  156,  895,  895,  268,  708,  156,  156,
			  156,  156,  156,  708,  156,  156,  156,  714,  719,  156,
			  156,  156,  156,  709,  156,  156,  747,  895,  712,  268,
			  895,  156,  156,  156,  156,  156,  589,  589,  589,  589,
			  589,  710,  156,  156,  156,  714,  719,  156,  156,  156,

			  156,  711,  156,  156,  747,  895,  712,  268,  712,  156,
			  156,  156,  156,  156,  268,  156,  156,  156,  156,  156,
			  156,  156,  895,  895,  714,  156,  720,  895,  718,  895,
			  715,  156,  895,  895,  895,  268,  713,  156,  156,  156,
			  156,  156,  268,  156,  156,  156,  156,  156,  156,  156,
			  895,  895,  716,  156,  720,  722,  718,  722,  717,  156,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  718,  724,  724,  724,  724,  724,  596,  596,  596,  596,
			  596,  727,  727,  727,  727,  727,  728,  728,  728,  728,
			  728,  729,  729,  729,  729,  729,  117,  895,  721,  117,

			  117,  895,  895,  594,  895,  732,  725,  895,  731,  895,
			  117,  895,  117,  117,  117,  117,  117,  895,  895,  895,
			  733,  117,  895,  895,  117,  895,  117,  117,  117,  403,
			  895,  895,  895,  732,  725,  117,  731,  117,  895,  117,
			  117,  117,  117,  895,  117,  117,  117,  117,  733,  117,
			  895,  895,  156,  117,  117,  117,  895,  895,  156,  895,
			  117,  117,  117,  117,  895,  117,  117,  117,  895,  117,
			  895,  117,  895,  735,  117,  117,  895,  895,  895,  117,
			  156,  117,  895,  117,  117,  117,  156,  895,  117,  737,
			  749,  117,  117,  117,  895,  117,  156,  117,  895,  738,

			  895,  735,  117,  895,  117,  895,  117,  739,  895,  117,
			  117,  117,  895,  895,  117,  895,  117,  737,  749,  895,
			  117,  895,  117,  117,  156,  772,  699,  738,  699,  699,
			  699,  699,  699,  117,  117,  739,  895,  156,  895,  117,
			  117,  117,  268,  156,  156,  156,  156,  156,  156,  895,
			  746,  117,  268,  772,  156,  156,  156,  156,  156,  895,
			  156,  156,  156,  156,  745,  156,  156,  156,  156,  156,
			  117,  156,  895,  895,  747,  895,  895,  268,  746,  156,
			  156,  156,  156,  156,  895,  895,  895,  895,  156,  156,
			  156,  156,  749,  895,  156,  156,  156,  156,  895,  895,

			  895,  268,  748,  156,  156,  156,  156,  156,  268,  156,
			  156,  156,  156,  156,  156,  156,  895,  895,  751,  268,
			  750,  156,  156,  156,  156,  156,  156,  156,  895,  753,
			  895,  895,  156,  156,  895,  885,  268,  156,  156,  156,
			  156,  156,  156,  156,  895,  268,  751,  156,  156,  156,
			  156,  156,  885,  156,  156,  156,  885,  753,  754,  156,
			  156,  156,  156,  895,  755,  895,  895,  895,  156,  751,
			  895,  268,  886,  156,  156,  156,  156,  156,  895,  895,
			  885,  156,  895,  895,  895,  895,  754,  156,  753,  886,
			  156,  895,  755,  886,  895,  895,  156,  752,  723,  723, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  723,  723,  723,  723,  723,  723,  723,  723,  757,  757,
			  757,  757,  757,  758,  895,  758,  756,  886,  759,  759,
			  759,  759,  759,  761,  761,  761,  761,  761,  765,  765,
			  765,  765,  765,  767,  117,  117,  895,  895,  895,  779,
			  768,  117,  769,  725,  730,  156,  895,  895,  117,  117,
			  117,  117,  895,  895,  895,  117,  843,  117,  895,  770,
			  117,  767,  117,  117,  844,  895,  403,  779,  768,  117,
			  769,  725,  156,  156,  117,  117,  117,  844,  780,  117,
			  117,  117,  773,  895,  784,  895,  117,  770,  117,  117,
			  156,  117,  844,  895,  895,  117,  156,  117,  895,  895,

			  156,  895,  156,  117,  895,  117,  780,  895,  895,  117,
			  773,  268,  784,  156,  156,  156,  156,  156,  156,  156,
			  117,  782,  156,  786,  156,  156,  117,  895,  156,  895,
			  156,  268,  780,  156,  156,  156,  156,  156,  895,  268,
			  895,  156,  156,  156,  156,  156,  156,  156,  782,  782,
			  156,  786,  156,  156,  784,  156,  156,  787,  895,  895,
			  781,  156,  268,  895,  156,  156,  156,  156,  156,  759,
			  759,  759,  759,  759,  156,  895,  783,  895,  786,  895,
			  156,  895,  785,  156,  895,  787,  895,  895,  895,  156,
			  789,  789,  789,  789,  789,  790,  790,  790,  790,  790,

			  601,  601,  601,  601,  601,  895,  788,  791,  791,  791,
			  791,  791,  792,  792,  792,  792,  792,  793,  793,  793,
			  793,  793,  117,  117,  895,  895,  795,  895,  594,  117,
			  117,  797,  725,  117,  895,  156,  117,  796,  117,  117,
			  895,  156,  895,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  895,  895,  795,  403,  895,  117,  117,  797,
			  725,  117,  798,  156,  117,  796,  156,  117,  117,  156,
			  895,  804,  156,  156,  117,  117,  117,  895,  117,  156,
			  268,  895,  156,  156,  156,  156,  156,  895,  805,  156,
			  798,  807,  895,  117,  156,  156,  895,  895,  895,  804,

			  156,  156,  757,  757,  757,  757,  757,  156,  895,  268,
			  805,  156,  156,  156,  156,  156,  805,  156,  895,  807,
			  895,  895,  268,  156,  156,  156,  156,  156,  156,  156,
			  811,  811,  811,  811,  811,  156,  117,  814,  806,  807,
			  594,  895,  895,  268,  809,  156,  156,  156,  156,  156,
			  117,  895,  117,  762,  895,  762,  895,  156,  792,  792,
			  792,  792,  792,  156,  117,  814,  117,  808,  895,  117,
			  895,  895,  809,  793,  793,  793,  793,  793,  895,  117,
			  117,  117,  117,  117,  815,  117,  895,  817,  895,  895,
			  895,  764,  816,  117,  117,  117,  895,  117,  156,  156,

			  821,  895,  895,  895,  156,  156,  895,  117,  895,  895,
			  895,  117,  895,  815,  117,  156,  817,  895,  822,  895,
			  816,  156,  895,  895,  117,  895,  156,  156,  821,  824,
			  117,  895,  156,  156,  268,  895,  156,  156,  156,  156,
			  156,  895,  895,  156,  831,  895,  117,  822,  268,  156,
			  156,  156,  156,  156,  156,  156,  895,  824,  117,  895,
			  895,  156,  828,  828,  828,  828,  828,  156,  822,  895,
			  117,  117,  831,  156,  826,  117,  895,  824,  895,  895,
			  117,  895,  836,  156,  117,  117,  117,  117,  895,  156,
			  832,  895,  895,  895,  117,  156,  117,  823,  117,  117,

			  156,  156,  895,  826,  895,  825,  156,  156,  117,  895,
			  836,  895,  895,  156,  895,  117,  117,  268,  832,  156,
			  156,  156,  156,  156,  895,  117,  895,  268,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  895,  895,  895,
			  895,  156,  156,  895,  895,  895,  895,  837,  838,  838,
			  838,  838,  838,  764,  764,  764,  764,  764,  839,  839,
			  839,  839,  839,  117,  156,  156,  117,  841,  895,  895,
			  156,  156,  156,  895,  846,  837,  895,  117,  156,  117,
			  117,  840,  117,  895,  845,  857,  857,  857,  857,  857,
			  895,  117,  895,  156,  117,  841,  895,  156,  895,  156,

			  156,  895,  846,  156,  895,  895,  156,  895,  117,  895,
			  840,  117,  850,  845,  851,  852,  117,  839,  839,  839,
			  839,  839,  117,  156,  895,  156,  853,  895,  895,  156,
			  117,  156,  117,  895,  856,  895,  117,  895,  117,  859,
			  859,  859,  859,  859,  117,  862,  862,  862,  862,  862,
			  117,  156,  117,  863,  853,  895,  895,  156,  156,  156,
			  866,  117,  856,  895,  156,  156,  117,  117,  117,  867,
			  867,  867,  867,  867,  868,  868,  868,  868,  868,  895,
			  117,  863,  895,  895,  895,  895,  156,  156,  866,  895,
			  895,  895,  156,  156,  895,  895,  860,  117,  859,  859,

			  859,  859,  859,  859,  859,  859,  859,  859,  850,  117,
			  851,  869,  895,  862,  862,  862,  862,  862,  872,  872,
			  872,  872,  872,  117,  895,  117,  876,  876,  876,  876,
			  876,  849,  849,  849,  849,  849,  895,  117,  879,  879,
			  879,  879,  879,  850,  895,  851,  895,  895,  876,  876,
			  876,  876,  876,  895,  117,  883,  883,  883,  883,  883,
			  884,  884,  884,  884,  884,  887,  887,  887,  887,  887,
			  888,  889,  888,  889,  875,  875,  875,  875,  875,  891,
			  891,  891,  891,  891,  892,  892,  892,  892,  892,  893,
			  893,  893,  893,  893,  888,  895,  888,  895,  895,  892,

			  892,  892,  892,  892,  895,  895,  895,  895,  890,  894,
			  894,  894,  894,  894,  890,  890,  890,  890,  890,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  895,  895,
			  895,  895,  890,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   98,   98,  895,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,  895,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,  100,  100,  895,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  108,  314,
			  314,  314,  314,  314,  314,  314,  314,  314,  895,  895,
			  895,  895,  895,  895,  895,  895,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  117,  117,  117,  895,  895,
			  895,  895,  895,  895,  117,  117,  895,  117,  895,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  895,  895,
			  895,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  149,  149,  895,  149,  895,  149,  149,  895,  895,  895,
			  149,  149,  149,  149,  149,  149,  149,  149,  149,  895,

			  895,  895,  149,  149,  149,  149,  149,  149,  149,  149,
			  149,  151,  151,  895,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  210,  210,
			  895,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  895,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  230,
			  895,  230,  895,  895,  895,  895,  230,  895,  230,  230,
			  895,  895,  895,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  895,  895,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  237,  237,  237,  237,  237,  237,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  244,  244,
			  895,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,

			  244,  244,  244,  244,  244,  103,  895,  895,  895,  103,
			  103,  895,  895,  895,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  895,  895,  895,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  108,  108,  108,  895,  895,  895,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  895,  895,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  270,

			  895,  895,  270,  270,  895,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  895,  895,  895,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  156,  895,
			  156,  895,  156,  895,  895,  156,  156,  156,  156,  156,
			  895,  895,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  895,  895,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  895,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  243,  243,  243,
			  744,  744,  744,  744,  744,  744,  744,  744,  744,  895,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  243,  409,  409,  895,  895,  895,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  895,  895,  895,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  410,

			  410,  895,  895,  895,  410,  410,  410,  410,  410,  410,
			  410,  410,  410,  895,  895,  895,  410,  410,  410,  410,
			  410,  410,  410,  410,  410,  314,  314,  314,  895,  895,
			  895,  314,  314,  314,  314,  314,  314,  314,  314,  314,
			  314,  895,  895,  314,  314,  314,  314,  314,  314,  314,
			  314,  314,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  517,
			  517,  517,  517,  517,  517,  517,  517,  517,  895,  895,

			  895,  517,  517,  517,  517,  517,  517,  517,  517,  517,
			  550,  895,  550,  895,  895,  895,  895,  550,  895,  550,
			  550,  895,  895,  895,  550,  550,  550,  550,  550,  550,
			  550,  550,  550,  895,  895,  895,  550,  550,  550,  550,
			  550,  550,  550,  550,  550,  454,  454,  454,  895,  895,
			  454,  454,  454,  454,  454,  454,  454,  454,  895,  895,
			  454,  454,  454,  454,  454,  454,  454,  454,  454,  895,
			  895,  895,  454,  454,  454,  454,  454,  454,  454,  454,
			  454,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  895,  895,  895,  603,  603,  603,  603,  603,  603,  603,

			  603,  603,  604,  604,  895,  895,  895,  604,  604,  604,
			  604,  604,  604,  604,  604,  604,  895,  895,  895,  604,
			  604,  604,  604,  604,  604,  604,  604,  604,  630,  895,
			  630,  895,  895,  895,  895,  630,  895,  630,  630,  895,
			  895,  895,  630,  630,  630,  630,  630,  630,  630,  630,
			  630,  895,  895,  630,  630,  630,  630,  630,  630,  630,
			  630,  630,  630,  678,  678,  895,  895,  895,  678,  678,
			  678,  678,  678,  678,  678,  678,  678,  895,  895,  895,
			  678,  678,  678,  678,  678,  678,  678,  678,  678,  766,
			  766,  766,  766,  766,  766,  766,  766,  766,  895,  895, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  895,  766,  766,  766,  766,  766,  766,  766,  766,  766,
			  744,  895,  895,  895,  744,  744,  895,  895,  895,  744,
			  744,  744,  744,  744,  744,  744,  744,  744,  895,  895,
			  895,  744,  744,  744,  744,  744,  744,  744,  744,  744,
			  794,  794,  895,  895,  895,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  895,  895,  895,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  829,  829,  895,  895,
			  895,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  895,  895,  895,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,   11,  895,  895,  895,  895,  895,  895,  895,

			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895, yy_Dummy>>,
			1, 184, 7000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7183)
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
			   25,  108,   27,   76,   27,  314,   27,   27,   27,   27,
			   27,   38,   38,   63,   38,  871,  319,  141,    5,    5,
			    6,    6,   28,   64,   28,   63,   28,   28,   28,   28,
			   28,  319,    3,   18,   38,   64,  108,    4,  870,    9,
			  314,   63,  861,   10,   27,   74,  141,   74,   74,   76,
			   92,   64,   95,   63,   95,   95,  109,  109,  109,  109,
			  109,  851,  234,   64,   28,  234,    3,    3,    3,    3,
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
			   35,   36,   36,  237,   36,  843,   78,   37,   37,  142,
			   37,   68,   77,   40,   40,  842,   40,  813,   39,   39,

			   35,   39,   41,   41,   36,   41,  802,   68,  377,   35,
			   37,   79,   36,   35,   37,   35,   40,  142,  371,   68,
			   40,   39,  320,   37,  212,   41,  212,  212,  320,   80,
			   42,   42,   40,   42,   39,   69,   41,   35,  237,  410,
			   36,   35,   37,   35,  377,   39,  410,   69,   40,   43,
			   43,   37,   43,   42,   44,   44,   69,   44,   45,   45,
			   40,   45,   39,   69,   41,   78,  790,   42,   42,   77,
			   77,   77,   43,   42,   39,   69,   43,   44,  757,   50,
			   50,   45,   50,   49,   49,   69,   49,   45,   79,   79,
			   79,   47,   47,   44,   47,   42,   42,  371,  535,   82,

			   45,   42,   50,   85,   43,  535,   49,   80,   80,  236,
			   87,  399,  236,   87,   47,   45,  153,   48,   48,  153,
			   48,   44,   49,   81,  153,   47,  399,   50,   45,   46,
			   46,   84,   46,   47,   82,   82,  621,  745,   85,   85,
			   48,  744,   65,  621,   65,   46,   46,   46,   46,   46,
			   49,   61,   46,   47,   65,   48,   50,   65,   61,   46,
			   48,   47,   87,   61,   56,   56,   46,   84,   84,   56,
			   65,   56,   65,   46,  553,   46,  224,   46,  150,   61,
			  373,  220,   65,   48,  697,   65,   61,   46,   48,  553,
			   56,   61,   56,   56,   46,  116,  116,   56,  116,   56,

			   81,   81,   81,  696,   46,   56,   46,   55,   89,  216,
			   55,   89,  224,  224,  150,   55,  220,  220,  116,  695,
			   89,   89,   55,   55,   55,   55,   55,   55,   55,  150,
			   89,  726,  726,  726,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,  373,  373,
			   89,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   57,  216,  216,  216,   58,
			   57,  184,  181,   58,   57,   58,   57,  184,  799,  102,

			  181,  223,  383,  383,   90,  383,  181,   90,  102,  102,
			  102,  102,  102,   57,   58,   57,   90,   58,   57,  184,
			  515,   58,   57,   58,   57,  184,   90,   59,  181,   58,
			   57,   59,  694,   59,  181,   60,  223,  223,   62,  799,
			   60,  678,   59,  102,   60,  674,   60,   60,   62,   62,
			   62,  668,   59,  637,   62,   59,   90,  217,  102,   59,
			  515,   59,  102,   60,  102,   60,   62,   59,   60,  794,
			  794,   59,   60,   67,   60,   60,   62,   62,   62,   66,
			   60,  177,   62,  622,   67,   67,   66,  177,  177,   67,
			  253,   66,  253,  253,   66,  106,  106,  106,  106,  106,

			  604,   67,  112,  112,  112,  112,  112,   66,  450,  177,
			  106,  450,   67,   67,   66,  177,  177,   67,  548,   66,
			  596,  548,   66,   93,   93,  182,   93,  182,  182,  182,
			  182,  182,  182,  106,  217,  217,  217,  111,  106,  111,
			  844,  111,  111,  111,  111,  111,  111,  844,   93,  589,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,  110,  110,  110,  110,  110,  113,  111,
			  113,  630,  113,  113,  113,  113,  113,  156,  110,  527,
			  156,  117,  117,  511,  117,  156,  119,  119,  504,  119,

			  156,  156,  156,   93,  117,  117,  810,  810,  156,  119,
			  119,  453,  117,  412,  117,  144,  110,  119,  409,  119,
			  113,  120,  120,  385,  120,  121,  121,  380,  121,  144,
			  144,  144,  379,  630,  120,  120,  315,  156,  121,  121,
			  119,  193,  120,  144,  120,  198,  121,  193,  121,  122,
			  122,  198,  122,  123,  123,  121,  123,  120,  144,  185,
			  144,  198,  122,  122,  310,  185,  123,  123,  119,  193,
			  122,  270,  122,  198,  123,  193,  123,  124,  124,  198,
			  124,  122,  269,  121,  185,  120,  259,  185,  258,  198,
			  124,  124,  226,  185,  229,  123,  148,  229,  124,  230,

			  124,  251,  230,  395,  125,  125,  250,  125,  249,  122,
			  148,  230,  148,  248,  148,  246,  124,  125,  125,  126,
			  126,  230,  126,  123,  148,  125,  395,  125,  226,  226,
			  241,  395,  126,  126,  829,  829,  127,  127,  232,  127,
			  126,  148,  126,  148,  124,  227,  229,  125,  126,  127,
			  127,  230,  384,  384,  126,  384,  178,  127,  218,  127,
			  128,  128,  178,  128,  129,  129,  225,  129,  423,  178,
			  222,  210,  127,  128,  128,  125,  126,  129,  129,  423,
			  161,  128,  126,  128,  178,  129,  157,  129,  801,  423,
			  178,  130,  130,  219,  130,  131,  131,  178,  131,  801, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  127,  154,  128,  634,  130,  130,  634,  423,  131,  131,
			  552,  634,  130,  552,  130,  151,  131,  149,  131,  132,
			  132,  197,  132,  197,  131,  133,  133,  197,  133,  801,
			  128,  130,  132,  132,  552,  218,  218,  218,  133,  133,
			  132,  105,  132,  104,  134,  134,  133,  134,  133,  197,
			  103,  197,  131,  252,  252,  197,  252,  134,  134,  130,
			  549,  135,  135,  549,  135,  134,  100,  134,   98,  133,
			  219,  219,  219,  132,  135,  135,  252,   96,  136,  136,
			  550,  136,  135,  550,  135,   88,   73,  189,  134,  145,
			  135,  136,  136,  189,  145,   70,   54,  133,  145,  136,

			   51,  136,  189,  145,   33,  145,  138,  138,  136,  138,
			  139,  139,  549,  139,  542,  189,  134,  145,  135,  138,
			  138,  189,  145,  139,  139,  542,  145,  138,   31,  138,
			  189,  139,  550,  139,  145,  542,  136,  137,  137,  137,
			  139,  257,  257,  257,  257,  257,  137,  143,  143,  672,
			  138,  143,   26,  542,  139,  137,  139,  633,   24,  137,
			  633,  143,  137,  143,   16,   15,  146,  146,  139,  137,
			   14,  137,  672,  137,   11,  143,  143,  672,    0,  143,
			  146,  633,  146,  137,    0,  139,    0,  137,  242,  242,
			  137,  242,  143,    0,  146,  146,    0,  547,  147,    0,

			  137,    0,  137,  140,  140,  140,  140,  140,  547,    0,
			  147,  146,  147,  242,  147,  162,  162,  140,  547,  194,
			  194,  140,    0,  162,  140,  194,  147,    0,    0,  162,
			  140,  140,    0,  140,  233,    0,  547,  233,  147,    0,
			  514,  162,  514,  147,    0,  140,  233,  194,  194,  140,
			  514,  158,  140,  194,  158,    0,  233,  162,  140,  158,
			  159,    0,  140,  159,  158,  158,  158,  740,  159,  162,
			    0,  740,  158,  159,  159,  159,  160,  370,  514,  160,
			    0,  159,    0,    0,  160,    0,  233,    0,  740,  160,
			  160,  160,    0,    0,  205,  158,  159,  160,    0,  740,

			  205,  158,  264,  264,  264,  264,  160,  205,    0,    0,
			  159,  163,  163,    0,  163,  163,  163,  163,  163,  163,
			    0,  372,  205,  158,  159,  163,  160,  164,  205,  164,
			  164,  164,  164,  164,  160,  205,  165,  163,  165,  165,
			  165,  165,  165,  166,    0,  166,  166,  166,  166,  166,
			  627,    0,    0,  163,  370,  370,  370,  164,  165,  166,
			  167,  627,    0,  167,    0,  163,    0,    0,  167,  169,
			    0,  627,  169,  167,  167,  167,    0,  169,    0,    0,
			    0,  167,  169,  169,  169,  164,  165,  166,    0,  627,
			  169,  168,  167,  168,  168,  168,  168,  168,  372,  372,

			  372,  171,    0,  171,  171,  171,  171,  171,  191,  168,
			  167,  169,    0,  170,  191,    0,  170,  172,  172,  169,
			  167,  170,    0,  191,    0,  172,  170,  170,  170,  171,
			    0,  172,  173,    0,  170,  173,  191,  168,    0,  169,
			  173,  174,  191,  172,  174,  173,  173,  173,    0,  174,
			    0,  191,  170,  173,  174,  174,  174,  171,    0,  172,
			    0,    0,  174,  170,  247,  247,  247,  247,  247,  247,
			  174,  172,  318,    0,    0,  173,  174,    0,  318,    0,
			  170,  175,  173,  175,  175,  175,  175,  175,  854,    0,
			  176,  174,  176,  176,  176,  176,  176,    0,  174,  854,

			  318,  207,  183,  173,  174,  176,  318,  207,  183,  854,
			  175,  176,  179,  183,  179,  179,  179,  179,  179,  180,
			  207,  180,  180,  180,  180,  180,    0,  854,    0,  207,
			  183,    0,    0,  176,  179,  207,  183,    0,  175,  176,
			  186,  183,  186,  186,  186,  186,  186,  180,  187,  207,
			  187,  187,  187,  187,  187,  188,    0,  188,  188,  188,
			  188,  188,  179,  187,  374,    0,  186,  190,  215,  190,
			  190,  190,  190,  190,  192,  180,  192,  192,  192,  192,
			  192,  195,    0,  195,  195,  195,  195,  195,    0,    0,
			  855,  187,  201,    0,  186,  188,  195,  190,  201,    0,

			    0,  855,  201,  196,  192,  196,  196,  196,  196,  196,
			  199,  855,  199,  199,  199,  199,  199,    0,    0,  196,
			  201,    0,    0,    0,  195,  190,  201,  199,    0,  855,
			  201,  200,  192,  200,  200,  200,  200,  200,  202,    0,
			  202,  374,  374,  374,  202,  203,  203,  196,  215,  215,
			  215,  215,  215,  203,    0,  199,    0,    0,    0,  203,
			  741,    0,  200,    0,  741,    0,  202,  203,  202,    0,
			    0,  203,  202,  375,  204,    0,  204,  204,  204,  204,
			  204,  741,  255,  255,  255,  255,  255,  203,  376,    0,
			  200,  204,  741,  386,  386,  203,  386,  255,  206,  203,

			  206,  206,  206,  206,  206,  208,    0,  208,  208,  208,
			  208,  208,  260,  260,  260,  260,  260,    0,  386,  204,
			  255,    0,  256,    0,  256,  255,  206,  256,  256,  256,
			  256,  256,    0,    0,    0,  262,    0,  262,    0,  208,
			  262,  262,  262,  262,  262,  265,  265,  265,  265,  265,
			  375,  375,  375,    0,  206,  290,  290,  290,  290,  290,
			  291,  291,  291,  291,  291,  376,  376,  376,  208,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  238,  238,    0,  238,  297,  297,  297,  297,  297,  600,
			  600,  600,  600,  263,    0,  263,    0,  263,  263,  263,
			  263,  263,    0,    0,    0,  238,    0,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,

			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  261,  261,  261,  261,  261,  263,  271,  271,    0,  272,
			    0,    0,  273,  275,    0,  261,    0,    0,  272,    0,
			  271,    0,  271,  272,    0,  272,  273,  275,  273,  275,
			  238,    0,    0,  274,  271,  271,    0,  272,  261,  276,
			  273,  275,  274,  261,    0,    0,  272,  274,  281,  274,
			    0,  271,  276,  276,  272,  276,    0,  273,  275,  277,
			  277,  274,  281,  278,  281,    0,    0,  276,    0,  278,
			  274,    0,  281,  277,    0,  277,  281,  278,  274,  278,
			  276,    0,  279,    0,  276,  282,  345,  277,  277,  280, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  282,  278,  345,  281,    0,  279,  279,  278,  279,    0,
			    0,  282,  280,  280,  277,  280,    0,    0,  278,    0,
			  279,  282,  283,    0,  345,    0,    0,  280,  283,  284,
			  345,  778,  778,  279,  778,  284,  283,  279,  283,  282,
			  280,    0,    0,  284,  280,  284,    0,    0,  285,    0,
			  283,  286,  286,  285,  778,  287,  283,  284,    0,  289,
			  289,    0,  285,  284,  285,  628,  286,  283,  286,  287,
			  288,  287,    0,  289,  284,  289,  285,    0,  628,  286,
			  286,  285,  818,  287,  288,  288,  288,  289,  289,  628,
			  818,    0,  838,  285,  838,    0,    0,  286,  288,  628,

			  287,    0,  838,  818,  289,  292,  292,  292,  292,  292,
			    0,    0,    0,  288,    0,  288,    0,  628,  818,  292,
			  293,  293,  293,  293,  293,  294,  294,  294,  294,  294,
			  838,    0,  339,  292,  293,  292,    0,    0,  339,  294,
			  295,  295,  295,  295,  295,    0,    0,  292,  293,  301,
			  293,    0,    0,  294,  295,  294,  298,  339,  298,    0,
			  339,    0,  293,  301,  292,  301,  339,  294,  295,    0,
			  295,    0,  296,  296,  296,  296,  296,  301,  298,  293,
			  819,  298,  295,    0,  294,    0,  296,  298,  819,  299,
			  299,  299,  299,  299,  301,    0,  303,  300,    0,  295,

			  296,  819,  296,    0,  302,  303,  298,  299,    0,  298,
			  300,  300,  302,  300,  296,  298,  819,    0,  302,  303,
			  302,  303,    0,  304,  304,  300,  848,  848,  848,  848,
			  305,  296,  302,  303,    0,  299,    0,  304,  300,  304,
			  302,  305,  300,  306,  305,    0,  305,    0,  307,  302,
			  303,  304,  304,  833,    0,  306,    0,  306,  305,  306,
			    0,  833,  307,  308,  307,    0,  309,    0,  304,  305,
			    0,  306,  307,    0,  833,  305,  307,  308,    0,  308,
			  309,    0,  309,  306,  309,  864,    0,    0,  306,  833,
			    0,  308,    0,  307,  309,  311,  864,  311,  311,  311,

			  311,  311,  311,  316,    0,  316,  864,    0,  308,  316,
			    0,  309,  312,  309,  312,  312,  312,  312,  312,  312,
			  317,    0,  629,  342,  864,    0,  317,    0,    0,  342,
			  317,  316,    0,  316,  342,  629,  321,  316,  321,  321,
			  321,  321,  321,    0,    0,  342,  629,  322,  317,  322,
			  322,  322,  322,  322,  317,  342,  629,    0,  317,  613,
			    0,  323,  322,  323,  323,  323,  323,  323,  322,  324,
			  324,    0,    0,  342,  629,    0,  613,  324,  323,    0,
			  613,    0,  325,  324,  325,  325,  325,  325,  325,    0,
			  322,  326,  328,  328,    0,  324,  322,  326,  328,  329,

			    0,  326,  327,  327,  613,  329,  323,    0,    0,  834,
			  327,  324,  332,  329,  332,    0,  327,  834,  332,  326,
			  328,  328,    0,  324,    0,  326,  328,  329,  327,  326,
			  834,    0,  330,  329,  330,  330,  330,  330,  330,    0,
			  332,  329,  332,    0,  327,  834,  332,    0,  330,  331,
			    0,  331,  331,  331,  331,  331,  327,  333,    0,  334,
			    0,  338,    0,  333,  333,  334,  335,  338,  335,  335,
			  335,  335,  335,  334,  343,  338,  330,    0,  331,    0,
			  343,  343,    0,  335,  348,  333,    0,  334,    0,  338,
			  348,  333,  333,  334,  336,  338,  336,  336,  336,  336,

			  336,  334,  343,  338,  865,    0,  331,    0,  343,  343,
			    0,  335,  348,    0,    0,  865,  336,  337,  348,  337,
			  337,  337,  337,  337,  340,  865,  340,  340,  340,  340,
			  340,  341,  344,  341,  341,  341,  341,  341,  344,  344,
			    0,    0,    0,  865,  336,  351,  337,  351,  351,  351,
			  351,  351,  355,  340,  355,  355,  355,  355,  355,  367,
			  344,  367,  367,  367,  367,  367,  344,  344,  742,  355,
			    0,  341,  742,  346,  337,  346,  346,  346,  346,  346,
			  347,  340,  347,  347,  347,  347,  347,    0,  349,  742,
			  349,  349,  349,  349,  349,  346,    0,  355,  350,  352,

			  742,  356,  347,  349,  350,  352,  353,  356,  353,    0,
			  356,  868,  353,  868,  354,  352,  354,  354,  354,  354,
			  354,  868,  357,  346,  357,    0,  350,  352,  357,  356,
			  347,  349,  350,  352,  353,  356,  353,    0,  356,    0,
			  353,    0,  360,  352,    0,  354,    0,  362,  360,  868,
			  357,    0,  357,  362,  360,  358,  357,  358,  358,  358,
			  358,  358,    0,  359,    0,  359,  359,  359,  359,  359,
			  360,  361,  362,  354,    0,  362,  360,  361,    0,  358,
			  359,  362,  360,  363,  361,  363,  363,  363,  363,  363,
			  364,  366,  364,  364,  364,  364,  364,  366,  369,  361,

			  369,  369,  369,  369,  369,  361,    0,  358,  359,    0,
			  363,  365,  361,  365,  365,  365,  365,  365,  364,  366,
			  368,  381,  381,    0,  381,  366,  368,  396,  396,  396,
			  396,  396,  369,  381,  728,  728,  728,  728,  363,  368,
			    0,    0,    0,  381,    0,    0,  364,    0,  368,    0,
			    0,  365,    0,    0,  368,  389,  389,  389,  389,  389,
			  389,  369,  397,  397,  397,  397,  397,    0,  368,    0,
			    0,    0,  728,  381,  398,  398,  398,  398,  398,  400,
			  400,  400,  400,  400,  401,  401,  401,  401,  401,  402,
			    0,  402,    0,    0,  402,  402,  402,  402,  402,  401,

			  397,  403,  403,  403,  403,  403,  404,  404,  404,  404,
			  404,  405,  405,  405,  405,  405,  407,  407,  407,  407,
			  407,    0,  401,  684,    0,  406,  406,  401,  406,  406,
			  406,  406,  406,  408,  408,  408,  408,  408,  413,  414,
			  684,    0,  416,    0,  684,  415,    0,  416,  690,  405,
			  413,    0,  413,  414,  413,  414,  416,  415,  416,  415,
			  418,  415,    0,  417,  417,  690,  413,  414,  684,  690,
			  416,    0,    0,  415,  418,  416,  418,  417,  413,  417,
			    0,  419,    0,  413,  414,  415,  420,  416,  418,    0,
			  415,  417,  417,  690,    0,  419,  419,  419,    0,  444,

			  420,    0,  420,    0,  444,  418,  421,  421,  417,  419,
			  422,    0,  464,  422,  420,  444,  424,    0,  464,    0,
			  421,  424,  421,    0,  419,  444,  419,  422,  420,  422,
			  424,  420,  424,    0,  421,  421,  468,    0,  422,  425,
			  464,  422,  468,  444,  424,    0,  464,    0,    0,  424,
			    0,  421,  426,  425,  425,  425,    0,    0,  422,  427,
			  426,  424,  428,  427,  468,  429,  426,  425,  426,    0,
			  468,    0,    0,  427,  428,  427,  428,  429,  428,  429,
			  426,  429,  425,    0,  425,  743,    0,  427,  426,  743,
			  428,  427,    0,  429,    0,    0,    0,  426,  874,  874, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  874,  874,  428,    0,  427,  429,  743,  428,    0,    0,
			  429,  430,  430,  430,  430,  430,  431,  743,  431,  431,
			  431,  431,  431,  431,  432,    0,  432,    0,  432,  432,
			  432,  432,  432,  433,    0,  455,  433,  465,  430,  465,
			    0,  455,  433,  465,    0,  431,  432,    0,  455,  432,
			  434,  434,  434,  434,  434,  432,  438,  438,  438,  438,
			  438,  433,    0,  455,  433,  465,  430,  465,  434,  455,
			  433,  465,    0,  431,  432,    0,  455,  432,  435,  435,
			  435,  435,  435,  432,  436,  436,  436,  436,  436,    0,
			    0,    0,  435,    0,    0,    0,  434,    0,  436,  437,

			  437,  437,  437,  437,  474,    0,  474,    0,  435,  774,
			  474,    0,  436,  774,  436,  439,  439,  439,  439,  439,
			  435,  440,  440,  440,  440,  440,  436,    0,    0,    0,
			  774,  437,  474,    0,  474,  440,  442,  435,  474,  443,
			  445,  774,    0,  436,  441,  441,  441,  441,  441,  440,
			  442,  440,  442,  443,  445,  443,  445,    0,  441,    0,
			  437,  446,    0,  440,  442,    0,  449,  443,  445,  775,
			    0,    0,  441,  775,  441,  446,  446,  446,    0,  447,
			  440,  442,    0,  449,  443,  445,  441,    0,    0,  446,
			  775,  448,    0,  447,  448,  447,    0,  449,    0,  449,

			    0,  775,  448,  441,  446,    0,  446,  447,  448,    0,
			  448,  449,  457,    0,  457,  457,  457,  457,  457,  448,
			  456,    0,  448,    0,  447,    0,  456,    0,  449,  451,
			  448,  451,  451,  451,  451,  451,  451,  456,  452,  448,
			  452,  452,  452,  452,  452,  452,    0,  458,  456,  458,
			  458,  458,  458,  458,  456,  459,    0,  459,  459,  459,
			  459,  459,  459,    0,    0,    0,  456,  451,  460,    0,
			  460,  460,  460,  460,  460,  461,  452,  461,  461,  461,
			  461,  461,  462,    0,    0,    0,    0,  463,  462,  463,
			  463,  463,  463,  463,    0,  462,  460,  466,  470,  466,

			  466,  466,  466,  466,  470,  469,  477,  461,    0,    0,
			  462,  469,  477,  470,    0,  463,  462,    0,  466,    0,
			    0,  469,    0,  462,  460,  467,  470,  467,  467,  467,
			  467,  467,  470,  469,  477,    0,  461,    0,    0,  469,
			  477,  470,  467,  463,    0,    0,  466,    0,  471,  469,
			  471,  471,  471,  471,  471,  472,    0,  472,  472,  472,
			  472,  472,  473,    0,  473,  473,  473,  473,  473,  475,
			  467,  475,    0,    0,    0,    0,  476,  475,  476,  476,
			  476,  476,  476,  482,  478,  479,  472,    0,  482,  482,
			  478,  479,  473,  476,  479,    0,    0,  475,    0,  475,

			  478,    0,    0,    0,  480,  475,  480,  480,  480,  480,
			  480,  482,  478,  479,  472,    0,  482,  482,  478,  479,
			  473,  476,  479,    0,    0,  480,    0,  481,  478,  481,
			  481,  481,  481,  481,  483,  484,  483,  483,  483,  483,
			  483,  484,    0,  485,  488,  489,  493,  493,  484,  485,
			  488,  489,  493,  480,  483,    0,  485,    0,  481,    0,
			    0,    0,  486,  484,  486,  486,  486,  486,  486,  484,
			    0,  485,  488,  489,  493,  493,  484,  485,  488,  489,
			  493,    0,  483,    0,  485,    0,  481,    0,    0,  487,
			  486,  487,  487,  487,  487,  487,  490,    0,  490,  490,

			  490,  490,  490,  491,  492,  491,  491,  491,  491,  491,
			  492,  494,  776,  494,  497,    0,  776,  487,  486,  494,
			  492,  495,  494,  495,  495,  495,  495,  495,    0,    0,
			  497,    0,  492,  776,    0,    0,  497,    0,  492,  494,
			    0,  494,    0,    0,  776,  487,    0,  494,  492,    0,
			  494,  496,  495,  496,  496,  496,  496,  496,  497,  500,
			  500,  500,  500,  500,  497,  498,  498,  496,  498,  498,
			  498,  498,  498,  501,  501,  501,  501,  501,    0,    0,
			  495,  502,  502,  502,  502,  502,  503,    0,  503,  503,
			  503,  503,  503,    0,    0,  496,    0,  500,  505,  505,

			  505,  505,  505,  506,  506,  506,  506,  506,  507,  507,
			  507,  507,  507,  505,  508,  508,  508,  508,  508,  509,
			  509,  509,  509,  509,  510,  510,  510,  510,  510,  512,
			  512,  512,  512,  512,    0,    0,  505,    0,  518,  519,
			    0,  505,  520,  520,    0,  513,  507,  513,  513,  513,
			  513,  513,  518,  519,  518,  519,  520,  509,  520,    0,
			  521,  522,    0,  519,  523,  525,  518,  519,  521,    0,
			  520,  520,    0,    0,  521,  522,  521,  522,  523,  525,
			  523,  525,    0,  518,  519,  524,  524,  520,  521,  522,
			    0,    0,  523,  525,  554,  736,  521,    0,  524,  524,

			  554,  524,    0,    0,  529,  521,  522,  528,  528,  523,
			  525,  526,  736,  524,  524,  530,  736,  526,  529,    0,
			  529,  528,  554,  528,    0,  526,  524,  526,  554,  530,
			  524,  530,  529,    0,  532,  528,  528,  531,  531,  526,
			  736,  533,  533,  530,    0,  526,  532,  537,  532,  529,
			  532,  531,  528,  531,    0,  533,  526,  533,    0,    0,
			  530,  537,  532,  537,    0,  531,  531,    0,    0,  533,
			  533,    0,    0,    0,  532,  537,    0,    0,    0,  532,
			    0,    0,  531,    0,    0,    0,  533,  536,  536,  536,
			  536,  536,  537,  538,  538,  538,  538,  538,    0,    0,

			  545,  536,  539,    0,  539,  539,  539,  539,  539,  539,
			    0,    0,  545,    0,  545,  536,  545,  536,    0,  540,
			  538,  540,    0,  540,  540,  540,  540,  540,  545,  536,
			    0,  539,  541,  541,  541,  541,  541,    0,  543,  543,
			  545,  540,  544,  544,  540,  545,  536,    0,  538,    0,
			  540,  555,  543,  541,  543,    0,  544,  555,  544,  539,
			  590,  590,  590,  590,  590,    0,  543,  543,  546,  540,
			  544,  544,  540,    0,    0,    0,  555,  546,  540,  555,
			    0,  541,  546,  543,  546,  555,  556,  544,  556,  556,
			  556,  556,  556,    0,  877,  557,  546,  557,  557,  557,

			  557,  557,    0,    0,  558,  546,  558,  558,  558,  558,
			  558,  877,  559,  546,  559,  877,    0,  560,  559,  560,
			  560,  560,  560,  560,  556,    0,  561,  562,  562,    0,
			  565,  565,  561,  562,  560,  561,  565,    0,    0,  877,
			  559,    0,  559,    0,  558,  563,  559,  563,  563,  563,
			  563,  563,    0,    0,  561,  562,  562,    0,  565,  565,
			  561,  562,  560,  561,  565,    0,    0,    0,  564,  563,
			  564,  564,  564,  564,  564,  566,    0,  566,    0,    0,
			  569,  566,    0,    0,  564,    0,  569,    0,  567,  566,
			  567,  567,  567,  567,  567,    0,  568,  563,  568,  568, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  568,  568,  568,  566,  567,  566,    0,    0,  569,  566,
			  573,  573,  564,  568,  569,  570,  573,  566,    0,    0,
			    0,  570,  570,    0,  571,  568,  571,  571,  571,  571,
			  571,  572,  567,  572,  574,    0,    0,  572,  573,  573,
			  574,  568,    0,  570,  573,    0,    0,    0,    0,  570,
			  570,    0,  575,  568,  575,  575,  575,  575,  575,  572,
			    0,  572,  574,  777,    0,  572,    0,  777,  574,  575,
			  576,    0,  576,  576,  576,  576,  576,  577,    0,  577,
			    0,    0,    0,  577,  777,  578,  576,  578,  578,  578,
			  578,  578,  580,  579,  580,  777,    0,  575,  580,  579,

			    0,    0,  578,    0,    0,  577,  579,  577,    0,    0,
			    0,  577,  820,  581,  576,  581,  581,  581,  581,  581,
			  580,  579,  580,  583,  820,  583,  580,  579,    0,  583,
			  578,    0,  820,  582,  579,  582,  582,  582,  582,  582,
			  584,  581,  584,  585,    0,  820,  584,    0,  586,  585,
			  582,  583,    0,  583,  586,    0,  585,  583,  586,    0,
			  820,  591,    0,  591,  591,  591,  591,  591,  584,  581,
			  584,  585,    0,    0,  584,    0,  586,  585,  582,    0,
			    0,    0,  586,    0,  585,  587,  586,  587,  587,  587,
			  587,  587,  588,    0,  588,  588,  588,  588,  588,  591,

			    0,    0,  587,  592,  592,  592,  592,  592,    0,  588,
			  593,  593,  593,  593,  593,    0,    0,    0,  592,  594,
			  594,  594,  594,  594,  595,  595,  595,  595,  595,    0,
			  587,  597,  597,  597,  597,  597,    0,  588,  598,  598,
			  598,  598,  598,    0,  605,    0,  592,  605,  593,  599,
			  599,  599,  599,  599,  602,  602,  602,  602,  602,    0,
			  606,  605,  607,  605,    0,  607,  608,    0,    0,  602,
			  609,  609,  605,  611,  606,  605,  606,    0,    0,  607,
			  608,  607,  608,    0,  609,    0,  609,  611,  606,  611,
			  607,    0,  605,  607,  608,    0,    0,  602,  609,  609,

			  610,  611,    0,  612,    0,  606,  615,  615,  610,  612,
			  607,  608,    0,  614,  610,  609,  610,  612,  611,  612,
			  615,    0,  615,    0,  617,  617,  614,  614,  610,  614,
			    0,  612,    0,  616,  615,  615,  610,  612,  617,    0,
			  617,  614,    0,  618,    0,  610,  616,  616,  612,  616,
			    0,  615,  617,  617,  614,    0,  623,  618,  614,  618,
			    0,  616,  619,  619,  619,  619,  619,    0,    0,  617,
			  623,  618,  623,    0,  616,  624,  626,  636,  616,  636,
			  619,  625,  625,  619,  623,  636,    0,  624,  618,  624,
			  626,  624,  626,    0,    0,    0,  625,    0,  625,    0,

			    0,  623,    0,  624,  626,  636,  638,  636,  619,  625,
			  625,  619,  638,  636,  640,  624,  640,  641,    0,    0,
			  624,  626,  640,  641,    0,    0,  635,  625,  635,  635,
			  635,  635,  635,  639,  638,  639,  639,  639,  639,  639,
			  638,    0,  640,  645,  640,  641,  642,  642,  878,  645,
			  640,  641,  645,  643,  642,  643,  643,  643,  643,  643,
			  642,  644,  646,  644,    0,  878,    0,  644,  646,  878,
			    0,  645,  642,    0,    0,    0,    0,  645,    0,    0,
			  645,  647,    0,  647,  647,  647,  647,  647,  642,  644,
			  646,  644,    0,  878,    0,  644,  646,    0,  647,  648,

			  642,  648,  648,  648,  648,  648,  649,  650,  649,  649,
			  649,  649,  649,  650,  650,  651,  652,    0,  652,  658,
			  658,  651,  652,  648,    0,  658,  647,    0,    0,  651,
			    0,    0,    0,    0,  653,  650,  653,  653,  653,  653,
			  653,  650,  650,  651,  652,    0,  652,  658,  658,  651,
			  652,  648,    0,  658,    0,    0,  654,  651,  654,  654,
			  654,  654,  654,  653,  655,  657,  661,  657,  663,  701,
			  655,  657,  661,  654,  663,  701,  701,    0,  655,  656,
			    0,  656,  656,  656,  656,  656,  667,  667,  667,  667,
			  667,  653,  655,  657,  661,  657,  663,  701,  655,  657,

			  661,  654,  663,  701,  701,    0,  655,  659,  656,  659,
			  659,  659,  659,  659,  660,  662,  660,  660,  660,  660,
			  660,  662,    0,    0,  659,  664,  664,    0,  662,    0,
			  660,  664,    0,    0,    0,  665,  656,  665,  665,  665,
			  665,  665,  666,  662,  666,  666,  666,  666,  666,  662,
			    0,    0,  659,  664,  664,  669,  662,  669,  660,  664,
			  669,  669,  669,  669,  669,  670,  670,  670,  670,  670,
			  666,  671,  671,  671,  671,  671,  673,  673,  673,  673,
			  673,  675,  675,  675,  675,  675,  676,  676,  676,  676,
			  676,  677,  677,  677,  677,  677,  679,    0,  666,  680,

			  681,    0,    0,  670,    0,  680,  677,    0,  679,    0,
			  679,    0,  679,  680,  681,  680,  681,    0,    0,    0,
			  682,  682,    0,    0,  679,    0,  683,  680,  681,  677,
			    0,    0,    0,  680,  677,  682,  679,  682,    0,  685,
			  683,  679,  683,    0,  680,  681,  686,  687,  682,  682,
			    0,    0,  703,  685,  683,  685,    0,    0,  703,    0,
			  686,  687,  686,  687,    0,  688,  682,  685,    0,  689,
			    0,  683,    0,  688,  686,  687,    0,    0,    0,  688,
			  703,  688,    0,  689,  685,  689,  703,    0,  691,  691,
			  704,  686,  687,  688,    0,  692,  704,  689,    0,  692,

			    0,  688,  691,    0,  691,    0,  693,  693,    0,  692,
			  688,  692,    0,    0,  689,    0,  691,  691,  704,    0,
			  693,    0,  693,  692,  704,  737,  699,  692,  699,  699,
			  699,  699,  699,  691,  693,  693,    0,  700,    0,  737,
			  692,  737,  705,  700,  705,  705,  705,  705,  705,    0,
			  700,  693,  702,  737,  702,  702,  702,  702,  702,    0,
			  707,  708,  709,  712,  699,  700,  707,  708,  709,  712,
			  737,  700,    0,    0,  702,    0,    0,  706,  700,  706,
			  706,  706,  706,  706,    0,    0,    0,    0,  707,  708,
			  709,  712,  706,    0,  707,  708,  709,  712,    0,    0,

			    0,  710,  702,  710,  710,  710,  710,  710,  711,  714,
			  711,  711,  711,  711,  711,  714,    0,    0,  714,  713,
			  706,  713,  713,  713,  713,  713,  715,  718,    0,  718,
			    0,    0,  715,  718,    0,  881,  717,  714,  717,  717,
			  717,  717,  717,  714,    0,  716,  714,  716,  716,  716,
			  716,  716,  881,  719,  715,  718,  881,  718,  719,  719,
			  715,  718,  720,    0,  720,    0,    0,    0,  720,  716,
			    0,  721,  882,  721,  721,  721,  721,  721,    0,    0,
			  881,  719,    0,    0,    0,    0,  719,  719,  721,  882,
			  720,    0,  720,  882,    0,    0,  720,  716,  722,  722, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  722,  722,  722,  723,  723,  723,  723,  723,  724,  724,
			  724,  724,  724,  725,    0,  725,  721,  882,  725,  725,
			  725,  725,  725,  727,  727,  727,  727,  727,  729,  729,
			  729,  729,  729,  731,  731,  732,    0,    0,    0,  746,
			  732,  733,  733,  729,  835,  746,    0,    0,  731,  732,
			  731,  732,    0,    0,    0,  733,  835,  733,    0,  735,
			  735,  731,  731,  732,  835,    0,  729,  746,  732,  733,
			  733,  729,  747,  746,  735,  739,  735,  835,  747,  731,
			  732,  738,  738,    0,  751,    0,  733,  735,  735,  739,
			  751,  739,  835,    0,    0,  738,  755,  738,    0,    0,

			  747,    0,  755,  739,    0,  735,  747,    0,    0,  738,
			  738,  748,  751,  748,  748,  748,  748,  748,  751,  749,
			  739,  749,  753,  753,  755,  749,  738,    0,  753,    0,
			  755,  750,  748,  750,  750,  750,  750,  750,    0,  752,
			    0,  752,  752,  752,  752,  752,  782,  749,  750,  749,
			  753,  753,  782,  749,  752,  754,  753,  754,    0,    0,
			  748,  754,  756,    0,  756,  756,  756,  756,  756,  758,
			  758,  758,  758,  758,  782,    0,  750,    0,  756,    0,
			  782,    0,  752,  754,    0,  754,    0,    0,    0,  754,
			  759,  759,  759,  759,  759,  760,  760,  760,  760,  760,

			  761,  761,  761,  761,  761,    0,  756,  762,  762,  762,
			  762,  762,  763,  763,  763,  763,  763,  765,  765,  765,
			  765,  765,  767,  768,    0,    0,  767,    0,  759,  769,
			  770,  770,  765,  772,    0,  786,  767,  768,  767,  768,
			    0,  786,    0,  769,  770,  769,  770,  772,  773,  772,
			  767,  768,    0,    0,  767,  765,    0,  769,  770,  770,
			  765,  772,  773,  786,  773,  768,  779,  767,  768,  786,
			    0,  779,  779,  780,  769,  770,  773,    0,  772,  780,
			  781,    0,  781,  781,  781,  781,  781,    0,  780,  784,
			  773,  784,    0,  773,  779,  784,    0,    0,    0,  779,

			  779,  780,  789,  789,  789,  789,  789,  780,    0,  783,
			  781,  783,  783,  783,  783,  783,  780,  784,    0,  784,
			    0,    0,  785,  784,  785,  785,  785,  785,  785,  787,
			  791,  791,  791,  791,  791,  787,  795,  795,  781,  785,
			  789,    0,    0,  788,  787,  788,  788,  788,  788,  788,
			  795,    0,  795,  792,    0,  792,    0,  787,  792,  792,
			  792,  792,  792,  787,  795,  795,  796,  785,    0,  798,
			    0,    0,  787,  793,  793,  793,  793,  793,    0,  797,
			  796,  795,  796,  798,  796,  798,    0,  798,    0,    0,
			    0,  792,  797,  797,  796,  797,    0,  798,  804,  805,

			  804,    0,    0,    0,  804,  805,    0,  797,    0,    0,
			    0,  796,    0,  796,  798,  807,  798,    0,  805,    0,
			  797,  807,    0,    0,  797,    0,  804,  805,  804,  807,
			  814,    0,  804,  805,  806,    0,  806,  806,  806,  806,
			  806,    0,    0,  807,  814,    0,  814,  805,  808,  807,
			  808,  808,  808,  808,  808,  809,    0,  807,  814,    0,
			    0,  809,  811,  811,  811,  811,  811,  821,  806,    0,
			  815,  816,  814,  821,  809,  814,    0,  808,    0,    0,
			  817,    0,  821,  809,  815,  816,  815,  816,    0,  809,
			  817,    0,    0,    0,  817,  821,  817,  806,  815,  816,

			  822,  821,    0,  809,    0,  808,  822,  824,  817,    0,
			  821,    0,    0,  824,    0,  815,  816,  823,  817,  823,
			  823,  823,  823,  823,    0,  817,    0,  825,  822,  825,
			  825,  825,  825,  825,  822,  824,  826,    0,    0,    0,
			    0,  824,  826,    0,    0,    0,    0,  826,  827,  827,
			  827,  827,  827,  828,  828,  828,  828,  828,  830,  830,
			  830,  830,  830,  831,  826,  836,  832,  832,    0,    0,
			  826,  836,  837,    0,  837,  826,    0,  831,  837,  831,
			  832,  831,  832,    0,  836,  847,  847,  847,  847,  847,
			    0,  831,    0,  836,  832,  832,    0,  846,    0,  836,

			  837,    0,  837,  846,    0,    0,  837,    0,  831,    0,
			  831,  832,  839,  836,  839,  839,  840,  839,  839,  839,
			  839,  839,  841,  845,    0,  846,  840,    0,    0,  845,
			  840,  846,  840,    0,  845,    0,  841,    0,  841,  850,
			  850,  850,  850,  850,  840,  852,  852,  852,  852,  852,
			  841,  845,  853,  853,  840,    0,    0,  845,  856,  866,
			  856,  840,  845,    0,  856,  866,  853,  841,  853,  857,
			  857,  857,  857,  857,  858,  858,  858,  858,  858,    0,
			  853,  853,    0,    0,    0,    0,  856,  866,  856,    0,
			    0,    0,  856,  866,    0,    0,  850,  853,  859,  859,

			  859,  859,  859,  860,  860,  860,  860,  860,  862,  863,
			  862,  862,    0,  862,  862,  862,  862,  862,  867,  867,
			  867,  867,  867,  863,    0,  863,  869,  869,  869,  869,
			  869,  872,  872,  872,  872,  872,    0,  863,  873,  873,
			  873,  873,  873,  876,    0,  876,    0,    0,  876,  876,
			  876,  876,  876,    0,  863,  879,  879,  879,  879,  879,
			  880,  880,  880,  880,  880,  883,  883,  883,  883,  883,
			  884,  884,  884,  884,  887,  887,  887,  887,  887,  888,
			  888,  888,  888,  888,  889,  889,  889,  889,  889,  891,
			  891,  891,  891,  891,  892,    0,  892,    0,    0,  892,

			  892,  892,  892,  892,    0,    0,    0,    0,  884,  893,
			  893,  893,  893,  893,  894,  894,  894,  894,  894,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,    0,    0,
			    0,    0,  892,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  899,  899,    0,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,    0,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  900,  900,    0,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  902,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,    0,    0,
			    0,    0,    0,    0,    0,    0,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  903,  903,  903,    0,    0,
			    0,    0,    0,    0,  903,  903,    0,  903,    0,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,    0,    0,
			    0,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  904,  904,    0,  904,    0,  904,  904,    0,    0,    0,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,    0,

			    0,    0,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  905,  905,    0,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  906,  906,
			    0,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,    0,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  909,
			    0,  909,    0,    0,    0,    0,  909,    0,  909,  909,
			    0,    0,    0,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,    0,    0,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  910,  910,  910,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  912,  912,
			    0,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,

			  912,  912,  912,  912,  912,  913,    0,    0,    0,  913,
			  913,    0,    0,    0,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,    0,    0,    0,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  915,  915,  915,    0,    0,    0,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,    0,    0,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  916,

			    0,    0,  916,  916,    0,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,    0,    0,    0,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  918,    0,
			  918,    0,  918,    0,    0,  918,  918,  918,  918,  918,
			    0,    0,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,    0,    0,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,    0,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,

			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  921,  921,  921,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,    0,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  921,  922,  922,    0,    0,    0,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,    0,    0,    0,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  923,

			  923,    0,    0,    0,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,    0,    0,    0,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  924,  924,  924,    0,    0,
			    0,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,    0,    0,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,    0,    0,

			    0,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  927,    0,  927,    0,    0,    0,    0,  927,    0,  927,
			  927,    0,    0,    0,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,    0,    0,    0,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  928,  928,  928,    0,    0,
			  928,  928,  928,  928,  928,  928,  928,  928,    0,    0,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,    0,
			    0,    0,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			    0,    0,    0,  929,  929,  929,  929,  929,  929,  929,

			  929,  929,  930,  930,    0,    0,    0,  930,  930,  930,
			  930,  930,  930,  930,  930,  930,    0,    0,    0,  930,
			  930,  930,  930,  930,  930,  930,  930,  930,  931,    0,
			  931,    0,    0,    0,    0,  931,    0,  931,  931,    0,
			    0,    0,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,    0,    0,  931,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,  932,  932,    0,    0,    0,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,    0,    0,    0,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,  934,
			  934,  934,  934,  934,  934,  934,  934,  934,    0,    0, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  934,  934,  934,  934,  934,  934,  934,  934,  934,
			  935,    0,    0,    0,  935,  935,    0,    0,    0,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,    0,    0,
			    0,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  936,  936,    0,    0,    0,  936,  936,  936,  936,  936,
			  936,  936,  936,  936,    0,    0,    0,  936,  936,  936,
			  936,  936,  936,  936,  936,  936,  937,  937,    0,    0,
			    0,  937,  937,  937,  937,  937,  937,  937,  937,  937,
			    0,    0,    0,  937,  937,  937,  937,  937,  937,  937,
			  937,  937,  895,  895,  895,  895,  895,  895,  895,  895,

			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895, yy_Dummy>>,
			1, 184, 7000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,  185,    0,   67,
			   71, 1174, 7092,   98, 1167, 1139, 1157, 7092,   90,    0,
			 7092, 7092, 7092, 7092, 1143,   88, 1135,   98,  118, 7092,
			 7092, 1102, 7092, 1078, 7092,  275,  279,  285,  119,  296,
			  291,  300,  328,  347,  352,  356,  427,  389,  415,  381,
			  377, 1043, 7092, 7092, 1041,  505,  431,  556,  555,  593,
			  606,  422,  609,   94,  104,  413,  650,  644,  250,  306,
			 1078, 7092, 7092, 1079,  153, 7092,  106,  285,  279,  304,
			  322,  416,  382, 7092,  414,  386, 7092,  408, 1082,  506,
			  602, 7092,   78,  721, 7092,  160, 1074, 7092, 1061, 7092,

			 1057,    0,  590, 1039, 1040, 1025,  677, 7092,   94,  148,
			  755,  723,  684,  764, 7092, 7092,  493,  789,    0,  794,
			  819,  823,  847,  851,  875,  902,  917,  934,  958,  962,
			  989,  993, 1017, 1023, 1042, 1059, 1076, 1123, 1104, 1108,
			 1185,   79,  250, 1115,  783, 1057, 1134, 1166,  864,  994,
			  455,  960, 7092,  414,  990,    0,  785,  969, 1249, 1258,
			 1274,  923, 1200, 1296, 1311, 1320, 1327, 1358, 1375, 1367,
			 1411, 1385, 1402, 1430, 1439, 1465, 1474,  650,  925, 1496,
			 1503,  569,  709, 1471,  560,  828, 1524, 1532, 1539, 1056,
			 1551, 1377, 1558,  810, 1188, 1565, 1587,  990,  814, 1594,

			 1615, 1561, 1607, 1630, 1658, 1263, 1682, 1470, 1689, 7092,
			  964, 7092,  322, 7092, 7092, 1561,  502,  650,  951,  986,
			  464, 7092,  917,  584,  459,  912,  875,  892, 7092,  892,
			  897, 7092,  935, 1232,  170, 1768,  407,  256, 1858, 7092,
			 7092,  903, 1186, 7092, 7092, 7092,  906, 1447,  904,  899,
			  897,  892, 1051,  688, 7092, 1664, 1709, 1123,  871,  829,
			 1694, 1892, 1722, 1859, 1284, 1727, 7092,    0,    0,  859,
			  844, 1884, 1887, 1890, 1911, 1891, 1917, 1937, 1941, 1960,
			 1967, 1926, 1972, 1990, 1997, 2016, 2020, 2023, 2038, 2027,
			 1737, 1742, 2087, 2102, 2107, 2122, 2154, 1846, 2142, 2171,

			 2165, 2117, 2172, 2173, 2191, 2198, 2211, 2216, 2231, 2234,
			  841, 2279, 2296, 7092,   98,  819, 2272, 2289, 1441,   67,
			  305, 2320, 2331, 2345, 2354, 2366, 2360, 2387, 2361, 2368,
			 2416, 2433, 2381, 2426, 2428, 2450, 2478, 2501, 2430, 2101,
			 2508, 2515, 2306, 2443, 2501, 1965, 2557, 2564, 2453, 2572,
			 2567, 2529, 2568, 2575, 2598, 2536, 2570, 2591, 2639, 2647,
			 2611, 2640, 2616, 2667, 2674, 2695, 2660, 2543, 2689, 2682,
			 1270,  311, 1314,  473, 1557, 1666, 1681,  291, 7092,  778,
			  824, 2719, 7092,  600,  950,  820, 1691, 7092, 7092, 2738,
			 7092, 7092, 7092, 7092, 7092,  870, 2709, 2744, 2756,  352,

			 2761, 2766, 2776, 2783, 2788, 2793, 2810, 2798, 2815,  803,
			  323,    0,  786, 2806, 2807, 2813, 2810, 2831, 2828, 2849,
			 2854, 2874, 2881,  940, 2884, 2907, 2920, 2927, 2930, 2933,
			 2993, 3000, 3010, 2997, 3032, 3060, 3066, 3081, 3038, 3097,
			 3103, 3126, 3104, 3107, 2876, 3108, 3129, 3147, 3162, 3151,
			  706, 3213, 3222,  754,    0, 3004, 3189, 3196, 3231, 3239,
			 3252, 3259, 3251, 3271, 2881, 3006, 3281, 3309, 2905, 3274,
			 3267, 3332, 3339, 3346, 3073, 3340, 3360, 3275, 3353, 3354,
			 3388, 3411, 3352, 3418, 3404, 3412, 3446, 3473, 3413, 3414,
			 3480, 3487, 3473, 3415, 3482, 3505, 3535, 3499, 3550, 7092,

			 3541, 3555, 3563, 3570,  784, 3580, 3585, 3590, 3596, 3601,
			 3606,  775, 3611, 3629, 1227,  604,    0,    0, 3606, 3607,
			 3610, 3628, 3629, 3632, 3653, 3633, 3679,  766, 3675, 3672,
			 3683, 3705, 3702, 3709, 7092,  382, 3769, 3715, 3775, 3786,
			 3805, 3814, 1086, 3806, 3810, 3768, 3836, 1169,  716, 1058,
			 1078, 7092, 1008,  415, 3663, 3820, 3870, 3879, 3888, 3881,
			 3901, 3895, 3896, 3929, 3952, 3899, 3944, 3972, 3980, 3949,
			 3984, 4008, 4000, 3979, 4003, 4036, 4054, 4046, 4069, 4062,
			 4061, 4097, 4117, 4092, 4109, 4112, 4117, 4169, 4176,  693,
			 3842, 4145, 4185, 4192, 4201, 4206,  664, 4213, 4220, 4231,

			 1851, 7092, 4236,    0,  685, 4215, 4228, 4233, 4234, 4238,
			 4268, 4241, 4271, 2331, 4281, 4274, 4301, 4292, 4311, 4344,
			 7092,  420,  660, 4324, 4343, 4350, 4344, 1322, 2050, 2307,
			  779, 7092, 7092, 1155, 1001, 4410, 4348,  636, 4375, 4417,
			 4385, 4386, 4431, 4437, 4430, 4412, 4431, 4465, 4483, 4490,
			 4476, 4484, 4485, 4518, 4540, 4533, 4563, 4534, 4488, 4591,
			 4598, 4535, 4584, 4537, 4594, 4619, 4626, 4568,  634, 4642,
			 4647, 4653, 1116, 4658,  630, 4663, 4668, 4673,  625, 4664,
			 4667, 4668, 4689, 4694, 2795, 4707, 4714, 4715, 4733, 4737,
			 2820, 4756, 4763, 4774,  617,  504,  488,  469,    0, 4810,

			 4806, 4538, 4836, 4721, 4759, 4826, 4861, 4829, 4830, 4831,
			 4885, 4892, 4832, 4903, 4878, 4895, 4929, 4920, 4896, 4922,
			 4931, 4955, 4980, 4985, 4990, 5000,  513, 5005, 2721, 5010,
			    0, 5002, 5003, 5009, 7092, 5028, 3667, 4793, 5049, 5043,
			 1239, 1632, 2540, 2957,  430,  420, 5008, 5041, 5095, 5088,
			 5115, 5053, 5123, 5091, 5124, 5065, 5146,  322, 5151, 5172,
			 5177, 5182, 5189, 5194, 7092, 5199,    0, 5190, 5191, 5197,
			 5198, 7092, 5201, 5216, 3081, 3141, 3484, 4035, 2029, 5235,
			 5242, 5264, 5115, 5293, 5258, 5306, 5204, 5298, 5327, 5284,
			  320, 5312, 5340, 5355,  654, 5304, 5334, 5347, 5337,  593,

			 7092,  983,  290, 7092, 5367, 5368, 5418, 5384, 5432, 5424,
			  788, 5444,    0,  221, 5398, 5438, 5439, 5448, 2054, 2152,
			 4096, 5436, 5469, 5501, 5476, 5511, 5505, 5530, 5535,  919,
			 5540, 5531, 5534, 2225, 2381, 5028, 5534, 5541, 2079, 5599,
			 5584, 5590,  272,  262,  724, 5592, 5566, 5567, 2208, 7092,
			 5621,   99, 5627, 5620, 1460, 1562, 5627, 5651, 5656, 5680,
			 5685,   93, 5695, 5677, 2257, 2476, 5628, 5700, 2598, 5708,
			  125,  102, 5713, 5720, 2980, 7092, 5730, 3866, 4420, 5737,
			 5742, 4907, 4944, 5747, 5757, 7092, 7092, 5756, 5761, 5766,
			 7092, 5771, 5781, 5791, 5796, 7092, 5832, 5869, 5906, 5943,

			 5980, 5803, 6008, 6043, 6074, 6110, 6147, 6184, 6221, 6257,
			 6293, 6330, 6367, 6398, 6434, 6462, 6491, 5991, 6526, 6562,
			 6599, 6635, 6662, 6688, 6715, 6751, 6773, 6808, 6844, 6865,
			 6891, 6926, 6952, 6624, 6973, 7003, 7029, 7055, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  895,    1,  896,  896,  897,  897,  895,    7,  898,
			  898,  895,  895,  895,  895,  895,  899,  895,  900,  901,
			  895,  895,  895,  895,  895,  895,  902,  895,  895,  895,
			  895,  895,  895,  895,  895,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  904,  895,  895,  905,  895,   55,   55,   55,   55,
			   55,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			  895,  895,  895,  906,  895,  895,  895,  906,  906,  906,
			  906,  906,  907,  895,  908,  907,  895,  909,  895,  909,
			  909,  895,  910,  911,  895,  895,  895,  895,  899,  895,

			  912,  912,  912,  913,  914,  895,  895,  895,  915,  895,
			  895,  895,  895,  895,  895,  895,  895,  903,  916,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,   46,  903,  903,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  904,
			  904,  905,  895,  895,  895,  917,  918,  895,  918,  918,
			  918,  895,   60,   60,  163,  163,  163,  918,  163,  918,
			  918,  163,   60,  918,  918,  163,  163,  174,  174,  163,
			  163,  174,  163,  174,  174,  174,  163,  163,  163,  174,
			  163,  174,  163,  174,  174,  163,  163,  174,  174,  163,

			  163,  174,  174,   60,  163,  174,  163,  174,  163,  895,
			  906,  895,  895,  895,  895,  906,  906,  906,  906,  906,
			  907,  895,  919,  907,  908,  920,  908,  919,  895,  909,
			  909,  895,  895,  895,  895,  895,  895,  910,  911,  895,
			  895,  238,  921,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  902,  895,
			  895,  895,  895,  895,  895,  895,  895,  922,  923,  895,
			  916,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  895,  139,  139,  139,  139,  139,  139,  139,
			  895,  923,  139,  139,  139,  139,  139,  140,  140,  140,

			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  895,  904,  904,  895,  924,  895,  174,  174,  174,  895,
			  895,  923,  174,  163,   60,  163,  174,   60,  174,  174,
			  163,  163,  174,  174,  174,  163,  163,  163,  174,  174,
			  163,  163,  895,  174,  174,  174,  163,  163,  174,  163,
			  174,  163,  174,  174,  163,  163,  174,  174,  163,  163,
			  174,  174,  174,  163,  163,  163,  174,  163,  174,  163,
			  906,  906,  906,  906,  906,  906,  906,  919,  895,  920,
			  925,  925,  895,  925,  925,  925,  921,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,

			  895,  895,  895,  895,  895,  895,  895,  895,  895,  922,
			  923,  926,  916,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  895,  139,  139,  139,  139,  139,  139,
			  895,  923,  140,  140,  432,  432,  139,  137,  895,  923,
			  139,  139,  139,  139,  895,  139,  139,  139,  139,  139,
			  927,  904,  904,  895,  928,  174,  174,  895,  895,  923,
			  163,  163,  174,  163,  174,  174,  163,  163,  174,  174,
			  174,  163,  163,  163,  174,  174,  163,  174,  174,  174,
			  163,  163,  174,  163,  174,  174,  163,  163,  174,  174,
			  163,  163,  174,  174,  174,  163,  163,  174,  163,  895,

			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  929,  930,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  895,  139,  139,
			  139,  139,  139,  139,  895,  923,  139,  139,  895,  923,
			  432,  540,  895,  139,  139,  139,  139,  922,  895,  931,
			  927,  895,  895,  895,  174,  174,  895,  163,  163,  174,
			  163,  174,  174,  163,  163,  174,  174,  163,  163,  174,
			  174,  163,  174,  174,  174,  163,  163,  174,  163,  174,
			  174,  163,  163,  174,  174,  174,  174,  163,  163,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,

			  895,  895,  895,  932,  930,  139,  139,  139,  139,  139,
			  139,  139,  139,  895,  139,  139,  139,  139,  139,  432,
			  895,  923,  895,  139,  139,  139,  139,  895,  922,  922,
			  931,  895,  895,  895,  895,  895,  174,  895,  174,  163,
			  174,  174,   60,  163,  174,  174,  174,  163,  163,  163,
			  174,  174,  174,  163,  163,  174,  163,  174,  174,  163,
			  163,  174,  174,  174,  174,  163,  163,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  932,  139,
			  139,  139,  139,  139,  895,  139,  139,  139,  139,  139,
			  895,  139,  139,  139,  895,  895,  922,  922,  933,  895,

			  174,  174,  163,  174,  174,  163,  163,  174,  174,  174,
			  163,  163,  174,  163,  174,  174,  163,  163,  174,  174,
			  174,  163,  895,  895,  895,  895,  895,  895,  895,  895,
			  934,  139,  139,  139,  895,  139,  895,  139,  139,  139,
			  895,  895,  929,  929,  935,  895,  174,  174,  163,  174,
			  163,  174,  163,  174,  174,  174,  163,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  936,  139,  139,  139,
			  139,  895,  139,  139,  895,  895,  932,  932,  895,  174,
			  174,  163,  174,  163,  174,  163,  174,  174,  163,  895,
			  895,  895,  895,  895,  936,  139,  139,  139,  139,  895,

			  895,  932,  932,  895,  174,  174,  163,  174,  163,  174,
			  895,  895,  937,  895,  139,  139,  139,  139,  895,  895,
			  932,  174,  174,  163,  174,  163,  174,  895,  895,  937,
			  895,  139,  139,  895,  895,  932,  174,  174,  895,  895,
			  139,  139,  895,  895,  932,  174,  174,  895,  895,  895,
			  895,  895,  895,  139,  895,  895,  174,  895,  895,  895,
			  895,  895,  895,  139,  895,  895,  174,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,    0,  895,  895,  895,  895,

			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895, yy_Dummy>>)
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
			   96,   96,   96,   96,   96,   96,   39,   96,   89,   89,
			   80,   89,   89,   96,   96,   96,   96,   96,   96,    0,
			    0,    0,  107,    0,    0,    0,   99,    0,   99,   99,
			   99,    0,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   39,   99,   39,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,   99,  102,
			  120,  122,  121,  118,  117,  119,  120,  120,  120,  120,
			  103,  106,    0,  103,    0,    0,    0,  104,  105,    0,
			    0,   70,   68,    0,   67,    0,   66,    0,    0,   95,
			   93,   93,    0,   94,  130,  124,  130,  130,  130,  130,
			  130,  130,    0,    4,   33,  114,    0,    0,    0,    0,
			    0,  110,    0,  108,    0,    0,   90,    0,    0,    0,
			    0,   96,   96,   38,   96,   96,   96,   96,   96,   96,
			   96,   96,    0,   96,   96,   96,   96,   41,   96,   96,
			    0,    0,   81,   82,   81,   81,   81,   88,   96,   88,

			   88,   88,   96,   96,   96,   96,   96,   96,   40,   96,
			    0,    0,    0,   98,  101,    0,   99,   99,   38,    0,
			    0,   71,   71,   99,   99,   38,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,    0,   99,   99,   99,   99,   99,   99,   99,
			   41,   41,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   40,   40,   99,   99,
			  120,  120,  120,  120,  120,  120,  120,    0,  104,  105,
			    0,    0,   69,   67,   66,   70,    0,  128,  131,  131,
			  129,  125,  126,  127,   91,  114,    0,  114,    0,    0,

			    0,  110,    0,    0,    0,  113,  108,    0,    0,    0,
			    0,    0,   97,   96,   96,   96,   96,   96,   37,   96,
			   96,   96,   96,    0,   96,   96,   96,   96,   96,   96,
			    0,    0,   96,   80,   96,   96,   96,   96,    0,    0,
			   80,   80,   80,   36,    0,   43,   96,   96,   96,   96,
			   65,    0,    0,    0,   61,   99,   99,    0,   71,   71,
			   99,   99,   99,   99,   99,   99,   99,   99,   37,   99,
			   99,   37,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   36,   43,
			   36,   43,   99,   99,   99,   99,   99,   99,   99,  105,

			  114,    0,    0,    0,  109,  110,    0,  111,    0,  113,
			    0,    0,    0,  108,   77,    0,    0,    0,   58,   96,
			   96,   96,   96,   96,   96,   44,   96,    0,   96,   96,
			   35,   96,   96,   96,   82,   82,   82,   81,    0,    0,
			   96,   96,    0,   96,   96,   96,   96,    0,   65,   65,
			    0,   64,   64,    0,   58,   99,    0,   58,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   44,
			   99,   44,   99,   99,   35,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,  114,
			    0,    0,  110,  111,    0,    0,  113,    0,    0,    0,

			    0,   77,    0,    0,    0,   96,   59,   96,   60,   96,
			   96,   46,   96,    0,   96,   96,   96,   96,   96,   96,
			   80,   80,    0,   52,   96,   96,   96,    0,    0,    0,
			    0,   63,   62,    0,    0,    0,   99,    0,   59,   59,
			   99,   60,   99,   60,   99,   99,   46,   99,   99,   46,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   52,   99,   99,   99,   52,   99,    0,  100,    0,
			  111,    0,  114,    0,   79,    0,    0,  112,    0,   96,
			   96,   57,   96,   45,    0,   42,   56,   34,   96,   50,
			    0,   96,   96,   96,    0,    0,    0,    0,    0,    0,

			   99,   99,   99,   57,   99,   57,   99,   45,   42,   56,
			   42,   56,   34,   34,   99,   50,   99,   50,   99,   99,
			   99,   99,    0,  111,    0,    0,    0,    0,   76,  112,
			    0,   96,   96,   96,   85,   96,    0,   96,   96,   53,
			    0,    0,    0,    0,    0,  101,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   53,   99,  113,    0,  113,
			    0,    0,    0,    0,   76,  112,    0,   96,   96,   47,
			   96,   84,   51,   96,    0,    0,    0,    0,    0,   99,
			   99,   99,   47,   47,   99,   99,   51,   99,   51,  113,
			   78,    0,   76,  112,    0,   96,   96,   96,   96,   83,

			   83,   83,   83,   92,   99,   99,   99,   99,   99,   99,
			    0,    0,    0,    0,   96,   49,   48,   96,    0,    0,
			    0,   99,   49,   49,   48,   48,   99,    0,    0,    0,
			    0,   96,   96,    0,    0,    0,   99,   99,   75,   72,
			   96,   54,    0,    0,    0,   99,   54,    0,    0,   75,
			    0,    0,    0,   96,    0,    0,   99,    0,    0,   72,
			    0,    0,   72,   55,    0,    0,   55,    0,   74,    0,
			    0,    0,    0,    0,    0,   74,   72,    0,    0,    0,
			    0,    0,    0,    0,   73,   86,   87,    0,    0,    0,
			   73,    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 7092
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 895
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 896
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
