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
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
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
			create an_array.make_filled (0, 0, 7431)
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

			   95,   75,   95,   95,  105,  151,  106,  106,  106,  106,
			  106,  240,  109,  152,  110,  260,  111,  111,  111,  111,
			  111,  116,  116,  191,  116,  215,  888,  117,   84,   85,
			   84,   85,  109,  158,  110,  158,  113,  113,  113,  113,
			  113,  140,   76,  102,  118,  193,  887,   76,  870,   94,
			  261,  192,  322,   94,  112,  214,  117,  214,  214,  871,
			  323,  164,   95,  164,   95,   95,  241,  155,  865,  140,
			  155,  216,  864,  194,  112,  156,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   86,   86,   91,
			   86,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  116,  116,  158,
			  116,  116,  116,  240,  116,  313,  213,  116,  116,  402,
			  116,  207,  213,  116,  116,  840,  116,  403,  116,  116,

			  118,  116,  116,  116,  118,  116,  740,  164,  503,  119,
			  118,  213,  122,  120,  123,  121,  118,  820,  213,  208,
			  127,  118,  314,  124,  214,  118,  214,  214,  603,  213,
			  116,  116,  128,  116,  125,  158,  129,  119,  241,  270,
			  122,  120,  123,  121,  380,  126,  271,  158,  127,  116,
			  116,  124,  116,  118,  116,  116,  209,  116,  116,  116,
			  128,  116,  125,  164,  129,  218,  157,  130,  131,  217,
			  217,  217,  118,  132,  126,  164,  133,  118,  788,  116,
			  116,  118,  116,  116,  116,  210,  116,  135,  219,  219,
			  219,  116,  116,  134,  116,  130,  131,  218,  753,  223,

			  136,  132,  118,  213,  133,  227,  118,  220,  220,  236,
			  231,  752,  236,  231,  118,  135,  231,  116,  116,  231,
			  116,  134,  148,  238,  270,  144,  238,  149,  136,  116,
			  116,  271,  116,  145,  224,  225,  552,  157,  313,  553,
			  118,  228,  229,  751,  137,  138,  138,  138,  138,  138,
			  148,  158,  118,  144,  213,  146,  149,  750,  183,  139,
			  147,  145,  233,  158,  169,  158,  140,  230,  233,  158,
			  318,  158,  458,  141,  314,  142,  415,  143,  223,  164,
			  221,  221,  221,  146,  822,  823,  184,  139,  147,  315,
			  164,  164,  170,  164,  140,  116,  116,  164,  116,  164,

			  837,  837,  224,  225,  142,  164,  143,  155,  235,  213,
			  155,  235,  740,  224,  225,  156,  386,  385,  268,  386,
			  236,  237,  157,  158,  158,  158,  158,  158,  159,  736,
			  238,  217,  217,  217,  158,  158,  158,  158,  158,  160,
			  158,  158,  158,  161,  158,  162,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  163,  822,  823,
			  233,  158,  164,  164,  165,  164,  164,  166,  164,  164,
			  164,  167,  164,  168,  164,  164,  164,  164,  164,  165,
			  164,  164,  164,  164,  164,  171,  217,  217,  217,  158,
			  158,  260,  611,  158,  172,  158,  158,  262,  262,  262,

			  262,  262,  254,  254,  235,  254,  157,  235,  267,  267,
			  267,  267,  267,  173,  164,  164,  236,  164,  164,  700,
			  560,  164,  174,  164,  164,  397,  238,  158,  561,  164,
			  164,  175,  112,  158,  552,  179,  213,  552,  158,  269,
			  158,  514,  176,  284,  158,  505,  158,  180,  185,  186,
			  158,  158,  164,  828,  187,  164,  233,  158,  158,  177,
			  195,  164,  645,  181,  905,  164,  164,  164,  164,  165,
			  158,  178,  164,  196,  164,  182,  188,  189,  164,  158,
			  164,  158,  190,  158,  158,  158,  164,  230,  197,  158,
			  341,  199,  203,  158,  829,  645,  158,  204,  164,  200,

			  109,  198,  110,  270,  265,  265,  265,  265,  265,  164,
			  271,  158,  164,  378,  378,  378,  640,  158,  341,  201,
			  205,  164,  224,  225,  164,  206,  622,  202,  243,  243,
			  255,  243,  255,  255,  248,  158,  158,  158,  158,  158,
			  345,  607,  112,  249,  249,  249,  249,  249,  401,  401,
			  401,  401,  401,  244,  227,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  250,  257,
			  257,  257,  257,  257,  109,  263,  263,  263,  263,  263,
			  228,  229,  416,  251,  258,  389,  389,  252,  389,  253,

			  264,  411,  411,  411,  411,  109,  520,  110,  245,  265,
			  265,  265,  265,  265,  266,  507,  507,  259,  116,  116,
			  244,  116,  258,  116,  116,  385,  116,  531,  264,  385,
			  213,  269,  270,  381,  347,  462,  269,  270,  531,  271,
			  158,  118,  116,  116,  271,  116,  118,  112,  531,  158,
			  158,  158,  158,  158,  258,  269,  270,  462,  116,  116,
			  213,  116,  347,  271,  382,  118,  531,  273,  158,  320,
			  459,  269,  270,  116,  116,  454,  116,  259,  274,  271,
			  557,  118,  258,  557,  416,  158,  269,  270,  275,  116,
			  116,  158,  116,  415,  271,  273,  118,  327,  342,  905,

			  228,  229,  269,  270,  643,  276,  274,  379,  379,  379,
			  271,  396,  118,  158,  116,  116,  275,  116,  735,  158,
			  158,  158,  158,  158,  158,  905,  342,  269,  270,  116,
			  116,  277,  116,  276,  395,  271,  329,  118,  220,  220,
			  117,  407,  269,  270,  116,  116,  735,  116,  116,  116,
			  271,  116,  118,  278,  117,  307,  117,  269,  270,  277,
			  394,  269,  270,  552,  330,  271,  553,  118,  117,  271,
			  393,  118,  279,  280,  116,  116,  608,  116,  608,  281,
			  390,  278,  740,  307,  282,  117,  609,  269,  270,  865,
			  116,  116,  905,  116,  234,  271,  355,  118,  828,  380, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  279,  280,  158,  269,  270,  116,  116,  281,  116,  740,
			  381,  284,  282,  118,  610,  640,  283,  213,  269,  270,
			  116,  116,  380,  116,  355,  213,  271,  213,  118,  905,
			  158,  415,  639,  269,  270,  318,  427,  116,  116,  830,
			  116,  271,  316,  118,  283,  285,  154,  427,  313,  286,
			  269,  270,  292,  116,  116,  256,  116,  427,  271,  255,
			  118,  158,  158,  158,  158,  158,  269,  270,  254,  116,
			  116,  247,  116,  285,  271,  427,  118,  286,   99,  269,
			  270,  641,  269,  270,  213,  116,  116,  324,  116,  319,
			  271,  287,  118,  158,  217,  217,  217,  288,  269,  270,

			  905,   96,  219,  219,  219,  158,  271,  234,  118,  116,
			  116,  213,  116,  289,  290,  117,  310,  326,  770,  770,
			  770,  164,  269,  270,  235,  288,  211,  235,  154,  117,
			  271,  117,  118,  164,  116,  116,  236,  116,  115,  291,
			  114,  289,  290,  117,  310,  107,  238,  269,  270,  137,
			  643,  116,  116,  643,  116,  271,  557,  118,  708,  557,
			  117,  221,  221,  221,  269,  270,  137,  291,  293,  269,
			  294,  905,  271,  158,  118,  104,  233,  271,  300,  158,
			  643,  139,  387,  385,   99,  387,  295,   97,  158,  356,
			  296,   96,  905,  297,  158,  300,  905,  142,  348,  905,

			  117,  158,  298,  905,  299,  788,  788,  158,  788,  139,
			  905,  117,  305,  158,  295,  306,  158,  356,  296,  363,
			  905,  297,  158,  364,  905,  117,  142,  117,  813,  905,
			  117,  298,  905,  299,  301,  301,  301,  301,  301,  117,
			  305,  158,  905,  306,  117,  905,  117,  363,  117,  905,
			  905,  364,  302,  905,  905,  303,  117,  155,  117,  905,
			  155,  304,  117,  213,  117,  156,  905,  905,  117,  905,
			  269,  270,  157,  308,  117,  117,  117,  309,  271,  843,
			  302,  117,  117,  303,  117,  905,  311,  843,  117,  304,
			  117,  905,  213,  117,  905,  117,  117,  117,  905,  312,

			  843,  308,  117,  155,  158,  309,  155,  163,  905,  117,
			  158,  156,  694,  117,  311,  843,  269,  270,  157,  117,
			  360,  158,  155,  359,  271,  155,  117,  158,  312,  694,
			  156,  155,  158,  694,  155,  269,  270,  157,  158,  156,
			  217,  217,  217,  271,  269,  270,  157,  319,  360,  158,
			  905,  359,  271,  163,  905,  158,  905,  694,  320,  269,
			  270,  321,  325,  325,  325,  325,  325,  324,  158,  217,
			  217,  217,  163,  158,  158,  319,  158,  158,  158,  158,
			  158,  163,  905,  351,  155,  158,  320,  155,  905,  321,
			  321,  905,  156,  857,  905,  857,  158,  269,  270,  157,

			  905,  164,  158,  858,  905,  271,  155,  389,  389,  155,
			  389,  351,  744,  164,  156,  905,  329,  905,  328,  269,
			  270,  157,  155,  905,  905,  155,  905,  271,  905,  744,
			  156,  859,  905,  744,  163,  269,  270,  157,  158,  158,
			  158,  158,  158,  271,  329,  905,  746,  631,  331,  158,
			  158,  158,  158,  158,  158,  158,  163,  744,  631,  905,
			  346,  332,  905,  746,  331,  158,  155,  746,  631,  155,
			  905,  158,  163,  332,  156,  905,  331,  158,  905,  269,
			  270,  157,  155,  158,  371,  155,  631,  271,  346,  332,
			  156,  746,  333,  158,  905,  269,  270,  157,  905,  158,

			  883,  334,  883,  271,  158,  158,  158,  158,  158,  335,
			  884,  336,  905,  371,  905,  905,  163,  337,  905,  905,
			  905,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  335,  163,  905,  336,  905,  905,  335,  885,  336,
			  337,  686,  686,  686,  686,  337,  341,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  905,  905,  338,
			  905,  905,  339,  158,  158,  158,  158,  158,  340,  905,
			  905,  781,  905,  342,  343,  905,  346,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  781,  905,
			  347,  351,  781,  158,  158,  158,  158,  158,  158,  905,

			  905,  344,  353,  905,  349,  404,  404,  404,  404,  404,
			  158,  158,  158,  158,  158,  158,  781,  905,  350,  352,
			  348,  158,  353,  355,  158,  158,  158,  158,  158,  905,
			  353,  158,  158,  158,  158,  158,  905,  905,  356,  158,
			  158,  158,  158,  158,  213,  905,  359,  158,  905,  365,
			  354,  357,  905,  158,  905,  905,  905,  158,  158,  158,
			  158,  158,  868,  868,  868,  868,  358,  905,  360,  158,
			  158,  158,  158,  158,  361,  158,  363,  365,  905,  158,
			  364,  158,  636,  905,  365,  158,  158,  158,  158,  158,
			  158,  905,  369,  637,  905,  905,  362,  158,  158,  158,

			  158,  158,  905,  638,  366,  905,  905,  158,  367,  905,
			  905,  905,  368,  158,  772,  773,  772,  773,  371,  235,
			  369,  637,  235,  369,  373,  374,  375,  376,  377,  905,
			  905,  236,  391,  392,  392,  392,  392,  392,  905,  905,
			  905,  238,  412,  412,  412,  412,  412,  372,  399,  905,
			  399,  370,  774,  400,  400,  400,  400,  400,  408,  905,
			  408,  905,  905,  409,  409,  409,  409,  409,  905,  905,
			  905,  233,  383,  384,  385,  383,  384,  383,  383,  383,
			  383,  383,  383,  383,  383,  386,  237,  237,  383,  237,
			  237,  237,  237,  237,  383,  387,  383,  383,  383,  383,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  383,  383,  388,  383,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  243,  243,  905,  243,  434,  434,  434,
			  434,  434,  890,  890,  890,  890,  109,  905,  110,  905,
			  410,  410,  410,  410,  410,  905,  905,  905,  244,  905,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,

			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  398,  398,  398,  398,  398,  112,  405,
			  405,  405,  405,  405,  905,  905,  905,  704,  258,  905,
			  905,  905,  905,  905,  406,  158,  905,  905,  704,  117,
			  417,  158,  905,  245,  117,  117,  905,  905,  705,  905,
			  905,  259,  905,  117,  418,  117,  258,  407,  117,  117,
			  117,  117,  406,  158,  420,  117,  704,  117,  417,  158,
			  905,  415,  117,  117,  419,  905,  546,  905,  117,  117,
			  117,  117,  418,  905,  117,  117,  905,  546,  905,  117,
			  117,  905,  420,  117,  520,  905,  905,  546,  421,  117, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  844,  117,  419,  117,  422,  905,  117,  704,  844,  117,
			  117,  117,  423,  117,  905,  546,  905,  117,  706,  117,
			  117,  844,  117,  905,  424,  117,  421,  117,  707,  117,
			  117,  117,  422,  905,  117,  905,  844,  905,  905,  117,
			  423,  905,  425,  117,  905,  117,  706,  905,  117,  905,
			  905,  117,  424,  117,  158,  158,  117,  117,  905,  117,
			  158,  483,  117,  905,  461,  428,  905,  117,  429,  117,
			  425,  905,  905,  117,  117,  117,  117,  426,  117,  905,
			  905,  117,  158,  158,  905,  905,  117,  117,  158,  483,
			  117,  430,  461,  428,  431,  117,  429,  905,  117,  117,

			  117,  905,  117,  905,  117,  905,  905,  117,  905,  117,
			  905,  117,  905,  117,  117,  117,  852,  905,  117,  430,
			  905,  905,  431,  117,  852,  117,  433,  117,  905,  905,
			  905,  117,  117,  432,  117,  905,  905,  852,  905,  117,
			  117,  117,  905,  905,  117,  905,  117,  435,  435,  435,
			  435,  435,  852,  117,  433,  117,  117,  117,  117,  117,
			  905,  432,  905,  117,  905,  436,  436,  436,  436,  436,
			  117,  905,  438,  438,  438,  438,  438,  905,  905,  117,
			  117,  117,  117,  117,  117,  905,  117,  455,  455,  455,
			  455,  455,  313,  437,  905,  117,  905,  905,  117,  158,

			  117,  460,  117,  905,  905,  158,  905,  117,  905,  439,
			  439,  439,  439,  439,  117,  905,  440,  440,  440,  440,
			  440,  905,  905,  117,  117,  905,  117,  158,  905,  460,
			  117,  117,  905,  158,  905,  905,  905,  437,  442,  117,
			  443,  905,  905,  905,  437,  784,  117,  905,  117,  784,
			  905,  117,  905,  441,  441,  441,  441,  441,  117,  905,
			  444,  304,  117,  445,  117,  905,  784,  117,  117,  446,
			  905,  905,  905,  905,  905,  117,  117,  784,  448,  905,
			  905,  437,  905,  117,  905,  905,  117,  117,  444,  304,
			  905,  445,  905,  117,  447,  117,  905,  446,  905,  905,

			  117,  117,  117,  117,  905,  117,  449,  905,  905,  853,
			  158,  905,  117,  117,  117,  117,  158,  853,  905,  117,
			  466,  117,  447,  117,  450,  905,  905,  117,  905,  117,
			  853,  117,  117,  117,  449,  451,  486,  117,  158,  117,
			  905,  117,  158,  117,  158,  853,  905,  905,  466,  905,
			  117,  117,  450,  898,  899,  898,  899,  117,  117,  117,
			  905,  117,  117,  451,  486,  905,  905,  452,  117,  905,
			  158,  117,  905,  905,  905,  117,  117,  117,  117,  456,
			  453,  457,  457,  457,  457,  457,  313,  905,  117,  117,
			  117,  900,  905,  463,  905,  325,  325,  325,  325,  325,

			  158,  158,  158,  158,  158,  905,  117,  117,  158,  453,
			  905,  905,  905,  905,  158,  460,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  468,  905,  158,  905,  158,  158,  905,  461,
			  158,  905,  158,  464,  905,  905,  740,  905,  469,  466,
			  158,  158,  158,  158,  158,  158,  905,  472,  844,  158,
			  468,  158,  158,  905,  468,  158,  845,  465,  158,  158,
			  158,  158,  158,  158,  158,  905,  469,  467,  785,  845,
			  158,  473,  785,  158,  158,  472,  905,  905,  905,  158,
			  158,  905,  470,  905,  845,  905,  469,  905,  474,  785,

			  905,  905,  158,  158,  158,  158,  158,  158,  158,  473,
			  785,  905,  158,  158,  158,  158,  158,  158,  158,  158,
			  905,  158,  905,  473,  471,  158,  474,  158,  472,  905,
			  158,  158,  158,  158,  158,  478,  905,  158,  158,  158,
			  158,  158,  905,  905,  479,  905,  784,  158,  905,  158,
			  786,  476,  905,  158,  905,  158,  475,  474,  158,  158,
			  158,  158,  158,  478,  478,  318,  158,  786,  905,  905,
			  905,  415,  158,  481,  158,  905,  427,  905,  786,  905,
			  158,  482,  905,  905,  905,  477,  905,  427,  905,  905,
			  905,  905,  480,  158,  158,  905,  479,  427,  905,  158,

			  158,  481,  158,  158,  158,  158,  158,  158,  158,  482,
			  158,  158,  158,  158,  158,  427,  158,  158,  158,  158,
			  158,  158,  158,  481,  905,  905,  905,  158,  158,  486,
			  482,  158,  158,  158,  158,  158,  905,  158,  488,  489,
			  905,  905,  905,  158,  158,  158,  158,  158,  158,  905,
			  158,  484,  905,  905,  905,  905,  158,  487,  485,  158,
			  158,  158,  158,  158,  905,  158,  488,  489,  905,  158,
			  158,  158,  493,  488,  489,  158,  158,  905,  492,  905,
			  905,  905,  158,  158,  158,  158,  158,  158,  158,  905,
			  905,  905,  158,  158,  158,  158,  158,  158,  158,  905,

			  493,  490,  491,  158,  158,  492,  492,  493,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  570,  158,  158,
			  496,  905,  497,  905,  158,  158,  158,  158,  158,  905,
			  905,  905,  905,  494,  905,  495,  158,  158,  498,  158,
			  158,  158,  158,  158,  905,  570,  158,  158,  496,  496,
			  497,  905,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  905,  158,  158,
			  158,  158,  158,  158,  158,  905,  905,  499,  497,  905,
			  905,  384,  385,  891,  384,  905,  905,  501,  400,  400,
			  400,  400,  400,  386,  905,  498,  158,  905,  905,  905,

			  891,  501,  158,  387,  891,  905,  500,  391,  392,  392,
			  392,  392,  392,  905,  905,  905,  501,  504,  504,  504,
			  504,  504,  506,  506,  506,  506,  506,  905,  891,  905,
			  502,  905,  905,  388,  508,  508,  508,  508,  508,  509,
			  509,  509,  509,  509,  510,  905,  510,  905,  905,  511,
			  511,  511,  511,  511,  406,  505,  512,  512,  512,  512,
			  512,  409,  409,  409,  409,  409,  513,  513,  513,  513,
			  513,  518,  518,  518,  518,  518,  905,  407,  905,  905,
			  515,  516,  406,  517,  517,  517,  517,  517,  519,  519,
			  519,  519,  519,  117,  117,  905,  905,  905,  905,  905,

			  905,  905,  905,  905,  514,  522,  905,  117,  117,  117,
			  523,  905,  117,  117,  874,  905,  117,  526,  525,  905,
			  905,  117,  117,  905,  524,  874,  117,  117,  117,  117,
			  117,  158,  117,  522,  117,  874,  905,  158,  117,  523,
			  117,  117,  905,  892,  117,  526,  525,  574,  117,  905,
			  117,  905,  524,  874,  905,  905,  905,  117,  117,  158,
			  892,  117,  117,  905,  892,  158,  117,  158,  905,  571,
			  117,  117,  529,  158,  905,  574,  905,  905,  905,  117,
			  117,  527,  117,  905,  528,  117,  117,  117,  892,  530,
			  740,  117,  117,  905,  117,  158,  532,  571,  117,  117, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  529,  158,  853,  905,  905,  117,  117,  117,  117,  527,
			  854,  117,  528,  905,  905,  117,  117,  530,  117,  117,
			  117,  905,  905,  854,  532,  905,  905,  441,  441,  441,
			  441,  441,  117,  533,  117,  905,  117,  117,  854,  905,
			  117,  117,  905,  158,  905,  535,  117,  905,  534,  581,
			  117,  905,  905,  905,  117,  117,  117,  117,  905,  117,
			  905,  533,  536,  117,  117,  905,  117,  905,  117,  117,
			  905,  158,  905,  535,  905,  117,  534,  581,  117,  434,
			  434,  434,  434,  434,  905,  117,  117,  537,  117,  117,
			  536,  117,  905,  905,  270,  117,  435,  435,  435,  435,

			  435,  271,  905,  117,  905,  905,  538,  436,  436,  436,
			  436,  436,  905,  905,  905,  537,  905,  905,  905,  158,
			  117,  117,  905,  539,  117,  158,  905,  117,  540,  158,
			  905,  578,  562,  117,  538,  158,  905,  117,  905,  117,
			  438,  438,  438,  438,  438,  905,  905,  158,  905,  117,
			  905,  539,  117,  158,  905,  117,  540,  158,  117,  578,
			  562,  117,  905,  158,  905,  905,  117,  895,  117,  439,
			  439,  439,  439,  439,  905,  440,  440,  440,  440,  440,
			  905,  785,  905,  295,  895,  787,  117,  905,  895,  541,
			  542,  542,  542,  542,  542,  905,  579,  905,  158,  298,

			  905,  520,  787,  117,  158,  117,  543,  543,  543,  543,
			  543,  295,  895,  787,  705,  117,  905,  541,  905,  544,
			  544,  544,  544,  544,  579,  707,  158,  905,  298,  117,
			  905,  117,  158,  117,  117,  707,  905,  545,  545,  545,
			  545,  545,  117,  117,  905,  905,  905,  117,  905,  117,
			  905,  117,  905,  707,  905,  905,  117,  905,  117,  905,
			  117,  117,  905,  905,  905,  117,  158,  117,  905,  117,
			  117,  905,  158,  905,  117,  905,  905,  548,  117,  117,
			  905,  905,  551,  117,  905,  117,  905,  117,  117,  547,
			  117,  117,  549,  117,  158,  117,  117,  117,  905,  117,

			  158,  905,  117,  550,  905,  548,  905,  896,  905,  117,
			  905,  117,  905,  117,  117,  117,  905,  547,  905,  117,
			  549,  905,  117,  117,  896,  905,  905,  117,  896,  905,
			  555,  550,  455,  455,  455,  455,  455,  313,  905,  905,
			  117,  905,  905,  456,  117,  456,  456,  456,  456,  456,
			  313,  558,  896,  457,  457,  457,  457,  457,  313,  158,
			  565,  565,  565,  565,  565,  158,  905,  564,  556,  564,
			  564,  564,  564,  564,  905,  905,  563,  905,  905,  905,
			  905,  557,  158,  158,  158,  158,  158,  158,  875,  559,
			  905,  905,  905,  158,  158,  158,  158,  158,  158,  875,

			  158,  905,  905,  905,  905,  563,  158,  905,  562,  875,
			  905,  905,  905,  568,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  563,  905,  905,  875,  158,  158,
			  158,  158,  158,  158,  158,  905,  566,  158,  570,  905,
			  568,  568,  905,  158,  571,  158,  158,  158,  158,  158,
			  905,  905,  575,  567,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  905,  158,  572,  905,  569,  905,
			  905,  158,  573,  158,  158,  158,  158,  158,  158,  905,
			  575,  905,  905,  574,  158,  158,  158,  575,  578,  809,
			  586,  158,  158,  809,  582,  583,  905,  905,  158,  158,

			  158,  158,  158,  905,  905,  905,  158,  905,  905,  905,
			  809,  576,  158,  158,  158,  577,  580,  581,  586,  158,
			  158,  809,  582,  583,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  593,  905,
			  158,  158,  158,  158,  158,  584,  905,  586,  588,  589,
			  158,  905,  905,  582,  158,  158,  158,  158,  158,  905,
			  905,  905,  158,  158,  158,  158,  593,  905,  158,  158,
			  158,  158,  158,  905,  905,  587,  588,  589,  158,  905,
			  588,  585,  905,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  594,

			  905,  158,  905,  905,  158,  158,  905,  158,  590,  589,
			  595,  158,  905,  905,  592,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  551,  158,  594,  905,  158,
			  646,  905,  158,  158,  593,  158,  905,  591,  595,  158,
			  158,  158,  592,  905,  592,  551,  158,  158,  158,  158,
			  158,  158,  158,  598,  598,  598,  598,  598,  905,  905,
			  905,  905,  597,  599,  599,  599,  599,  599,  158,  158,
			  905,  905,  596,  905,  158,  158,  398,  398,  398,  398,
			  398,  600,  905,  600,  600,  600,  600,  600,  905,  905,
			  905,  505,  601,  601,  601,  601,  601,  511,  511,  511,

			  511,  511,  602,  602,  602,  602,  602,  406,  604,  604,
			  604,  604,  604,  605,  605,  605,  605,  605,  606,  606,
			  606,  606,  606,  601,  601,  601,  601,  601,  905,  905,
			  407,  905,  905,  905,  905,  406,  905,  905,  905,  516,
			  603,  517,  517,  517,  517,  517,  117,  117,  158,  905,
			  905,  514,  117,  615,  158,  905,  905,  650,  905,  905,
			  117,  117,  117,  117,  905,  905,  117,  905,  117,  905,
			  117,  614,  905,  617,  117,  117,  158,  158,  616,  618,
			  117,  615,  158,  158,  117,  650,  117,  117,  905,  117,
			  905,  117,  117,  117,  905,  117,  905,  117,  117,  905,

			  905,  617,  905,  117,  619,  158,  616,  618,  905,  117,
			  905,  158,  905,  905,  624,  117,  620,  117,  117,  117,
			  905,  905,  905,  117,  117,  117,  905,  117,  117,  905,
			  117,  117,  619,  621,  905,  117,  623,  117,  905,  905,
			  905,  117,  624,  117,  620,  905,  905,  905,  117,  117,
			  905,  117,  905,  117,  117,  117,  905,  905,  905,  117,
			  158,  621,  905,  117,  623,  905,  158,  117,  905,  117,
			  905,  810,  117,  117,  625,  810,  905,  117,  627,  905,
			  117,  117,  905,  117,  905,  905,  905,  117,  158,  117,
			  905,  117,  810,  117,  158,  626,  905,  117,  117,  117,

			  905,  117,  625,  810,  905,  117,  627,  905,  905,  905,
			  905,  117,  905,  628,  628,  628,  628,  628,  117,  117,
			  905,  905,  117,  626,  905,  905,  905,  117,  117,  905,
			  905,  905,  905,  437,  905,  117,  542,  542,  542,  542,
			  542,  117,  905,  117,  905,  905,  270,  117,  543,  543,
			  543,  543,  543,  271,  442,  117,  443,  905,  544,  544,
			  544,  544,  544,  629,  117,  545,  545,  545,  545,  545,
			  905,  905,  117,  905,  905,  630,  117,  905,  809,  445,
			  905,  905,  811,  905,  158,  446,  117,  905,  905,  905,
			  158,  629,  117,  632,  674,  117,  633,  905,  905,  811, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  905,  905,  905,  630,  117,  905,  117,  445,  117,  117,
			  811,  117,  158,  446,  117,  117,  117,  880,  158,  905,
			  117,  632,  674,  117,  633,  635,  905,  634,  880,  117,
			  117,  117,  117,  905,  905,  905,  905,  117,  880,  905,
			  117,  905,  905,  117,  117,  642,  642,  642,  642,  642,
			  313,  905,  905,  635,  905,  634,  880,  905,  905,  905,
			  117,  117,  456,  905,  644,  644,  644,  644,  644,  313,
			  564,  905,  564,  564,  564,  564,  564,  463,  905,  565,
			  565,  565,  565,  565,  271,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  905,  648,  905,  905,

			  557,  158,  158,  158,  158,  158,  158,  905,  647,  158,
			  651,  905,  905,  905,  905,  158,  905,  648,  158,  158,
			  158,  158,  158,  158,  905,  648,  905,  905,  646,  158,
			  158,  158,  158,  158,  158,  158,  654,  158,  651,  905,
			  650,  158,  905,  158,  651,  649,  158,  905,  655,  905,
			  881,  905,  158,  158,  158,  158,  158,  158,  810,  158,
			  656,  881,  812,  158,  654,  158,  660,  654,  652,  158,
			  905,  881,  653,  905,  158,  905,  655,  905,  905,  812,
			  158,  158,  158,  158,  158,  158,  905,  158,  656,  881,
			  812,  905,  905,  158,  660,  657,  655,  158,  158,  158,

			  158,  158,  905,  158,  905,  661,  158,  662,  656,  158,
			  905,  905,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  658,  665,  905,  905,  661,  158,
			  905,  158,  662,  661,  158,  662,  659,  158,  905,  905,
			  158,  905,  158,  158,  158,  158,  158,  158,  158,  905,
			  905,  158,  905,  665,  905,  667,  663,  158,  665,  158,
			  664,  668,  905,  905,  905,  158,  905,  905,  905,  905,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  667,  671,  158,  666,  158,  158,  668,
			  905,  158,  668,  158,  158,  905,  672,  667,  673,  905,

			  158,  905,  158,  158,  158,  158,  158,  905,  905,  905,
			  158,  905,  671,  158,  905,  905,  158,  671,  905,  158,
			  670,  905,  158,  905,  672,  669,  673,  905,  158,  158,
			  158,  158,  158,  158,  677,  677,  677,  677,  677,  601,
			  601,  601,  601,  601,  672,  675,  600,  905,  600,  600,
			  600,  600,  600,  905,  679,  680,  680,  680,  680,  680,
			  681,  681,  681,  681,  681,  682,  682,  682,  682,  682,
			  905,  905,  676,  683,  683,  683,  683,  683,  905,  905,
			  905,  905,  679,  905,  678,  684,  684,  684,  684,  684,
			  905,  905,  905,  603,  685,  685,  685,  685,  685,  687,

			  687,  687,  687,  687,  689,  905,  117,  117,  905,  905,
			  905,  905,  905,  905,  264,  905,  905,  905,  905,  905,
			  117,  117,  117,  117,  905,  117,  905,  690,  905,  905,
			  117,  905,  689,  905,  117,  117,  905,  905,  905,  117,
			  905,  117,  264,  905,  117,  905,  117,  905,  117,  691,
			  905,  117,  117,  117,  905,  690,  905,  905,  117,  905,
			  905,  905,  117,  905,  117,  158,  158,  158,  158,  158,
			  117,  117,  117,  905,  158,  117,  117,  691,  117,  692,
			  158,  905,  905,  905,  693,  117,  117,  117,  117,  905,
			  905,  905,  117,  117,  117,  905,  905,  117,  905,  117,

			  117,  905,  158,  905,  117,  696,  117,  692,  158,  905,
			  695,  117,  693,  117,  905,  905,  117,  117,  117,  905,
			  117,  905,  905,  117,  905,  117,  905,  905,  905,  905,
			  117,  905,  117,  696,  117,  698,  905,  699,  695,  905,
			  905,  905,  117,  697,  117,  905,  117,  905,  117,  117,
			  117,  117,  905,  117,  905,  905,  905,  905,  117,  905,
			  117,  905,  117,  698,  905,  699,  628,  628,  628,  628,
			  628,  697,  905,  905,  117,  117,  117,  905,  905,  117,
			  905,  905,  117,  905,  117,  905,  905,  117,  117,  710,
			  905,  158,  117,  905,  702,  117,  158,  158,  713,  711,

			  703,  158,  158,  905,  701,  117,  117,  158,  117,  117,
			  905,  117,  117,  905,  117,  117,  117,  710,  905,  158,
			  117,  905,  702,  117,  158,  158,  713,  711,  703,  158,
			  158,  905,  701,  905,  905,  158,  905,  117,  905,  905,
			  117,  905,  905,  905,  555,  117,  642,  642,  642,  642,
			  642,  313,  558,  905,  644,  644,  644,  644,  644,  313,
			  709,  905,  709,  709,  709,  709,  709,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  711,  158,
			  905,  905,  556,  158,  905,  158,  714,  905,  905,  905,
			  559,  905,  905,  158,  158,  158,  158,  158,  158,  158,

			  158,  158,  158,  158,  905,  158,  712,  158,  713,  158,
			  717,  158,  905,  158,  714,  158,  158,  158,  158,  158,
			  714,  158,  158,  905,  719,  905,  905,  158,  158,  905,
			  905,  158,  905,  905,  905,  718,  715,  158,  717,  158,
			  158,  158,  158,  158,  905,  905,  905,  905,  716,  158,
			  158,  905,  719,  905,  905,  158,  158,  158,  158,  158,
			  158,  158,  158,  718,  905,  158,  718,  724,  158,  158,
			  725,  158,  719,  905,  905,  158,  722,  905,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  905,  905,
			  158,  905,  905,  158,  720,  724,  158,  158,  725,  158,

			  721,  905,  905,  158,  722,  722,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  729,  905,
			  905,  724,  158,  158,  158,  725,  158,  730,  905,  905,
			  728,  905,  158,  723,  905,  158,  158,  158,  158,  158,
			  905,  905,  905,  117,  158,  158,  729,  905,  905,  726,
			  158,  158,  158,  727,  158,  730,  905,  117,  728,  117,
			  158,  728,  598,  598,  598,  598,  598,  732,  905,  732,
			  905,  117,  733,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  734,  734,  734,  734,  734,  905,  117,  731,
			  605,  605,  605,  605,  605,  737,  737,  737,  737,  737,

			  738,  738,  738,  738,  738,  739,  739,  739,  739,  739,
			  905,  905,  905,  905,  905,  603,  905,  905,  905,  905,
			  735,  905,  905,  905,  905,  117,  117,  905,  905,  905,
			  743,  117,  742,  905,  905,  905,  117,  741,  905,  117,
			  117,  117,  117,  407,  905,  117,  905,  117,  735,  905,
			  117,  905,  117,  117,  117,  905,  158,  905,  743,  117,
			  742,  117,  158,  905,  117,  741,  117,  905,  905,  756,
			  117,  117,  117,  905,  905,  117,  117,  117,  905,  905,
			  117,  117,  117,  905,  158,  158,  117,  905,  117,  117,
			  158,  158,  905,  117,  117,  905,  905,  756,  117,  905, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  745,  117,  747,  905,  905,  117,  117,  905,  117,
			  905,  117,  117,  158,  117,  905,  117,  117,  117,  158,
			  117,  117,  905,  905,  748,  905,  117,  905,  905,  745,
			  117,  747,  905,  905,  117,  905,  117,  905,  117,  158,
			  117,  749,  905,  117,  905,  158,  757,  117,  117,  905,
			  905,  905,  748,  905,  117,  709,  117,  709,  709,  709,
			  709,  709,  905,  905,  759,  117,  158,  158,  117,  749,
			  158,  905,  158,  158,  757,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  117,  158,  158,  158,  158,
			  158,  158,  759,  755,  158,  757,  158,  158,  158,  759,

			  158,  905,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  905,  158,  905,  158,  905,  905,  158,
			  158,  905,  158,  758,  158,  158,  905,  760,  905,  905,
			  158,  158,  158,  158,  158,  158,  905,  158,  905,  905,
			  905,  905,  158,  158,  158,  905,  761,  905,  158,  905,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  905,  763,  158,  158,  158,  158,  765,  764,
			  158,  158,  158,  761,  761,  158,  158,  158,  158,  158,
			  733,  733,  733,  733,  733,  905,  905,  905,  905,  158,
			  763,  763,  158,  905,  158,  158,  765,  764,  158,  905,

			  158,  762,  733,  733,  733,  733,  733,  767,  767,  767,
			  767,  767,  905,  905,  768,  905,  768,  905,  766,  769,
			  769,  769,  769,  769,  771,  771,  771,  771,  771,  775,
			  775,  775,  775,  775,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  735,  905,  789,  905,  777,  117,
			  117,  905,  158,  780,  117,  778,  905,  117,  779,  905,
			  905,  905,  905,  117,  117,  117,  117,  407,  117,  905,
			  117,  117,  735,  117,  789,  782,  777,  117,  117,  905,
			  158,  780,  117,  778,  117,  117,  779,  905,  905,  117,
			  905,  117,  905,  905,  117,  117,  905,  905,  117,  117,

			  117,  905,  117,  782,  158,  117,  783,  905,  794,  158,
			  790,  792,  117,  905,  158,  158,  905,  905,  905,  117,
			  117,  117,  158,  158,  158,  158,  158,  905,  905,  117,
			  905,  905,  158,  117,  783,  905,  794,  158,  790,  792,
			  905,  790,  158,  158,  158,  158,  158,  158,  158,  905,
			  117,  158,  158,  158,  158,  158,  158,  796,  905,  792,
			  158,  158,  158,  797,  794,  905,  158,  158,  905,  791,
			  905,  905,  158,  158,  158,  158,  158,  769,  769,  769,
			  769,  769,  905,  905,  158,  796,  796,  793,  158,  158,
			  158,  797,  795,  905,  158,  158,  799,  799,  799,  799,

			  799,  800,  800,  800,  800,  800,  610,  610,  610,  610,
			  610,  905,  905,  905,  798,  801,  801,  801,  801,  801,
			  802,  802,  802,  802,  802,  803,  803,  803,  803,  803,
			  905,  905,  905,  905,  603,  905,  905,  905,  905,  905,
			  735,  905,  905,  905,  905,  117,  117,  905,  905,  805,
			  117,  117,  807,  905,  905,  905,  117,  905,  905,  117,
			  806,  117,  117,  407,  117,  117,  117,  117,  735,  117,
			  117,  905,  117,  117,  117,  905,  158,  805,  117,  117,
			  807,  814,  158,  808,  117,  117,  905,  158,  806,  905,
			  117,  117,  905,  158,  158,  117,  117,  117,  905,  905,

			  158,  117,  815,  905,  158,  905,  158,  158,  817,  814,
			  158,  808,  158,  158,  117,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  905,
			  815,  905,  905,  905,  158,  158,  817,  158,  905,  905,
			  158,  158,  905,  158,  815,  158,  158,  158,  158,  158,
			  905,  905,  819,  158,  158,  158,  158,  158,  905,  905,
			  817,  905,  905,  905,  905,  158,  767,  767,  767,  767,
			  767,  158,  816,  821,  821,  821,  821,  821,  905,  905,
			  819,  905,  905,  905,  772,  905,  772,  905,  818,  802,
			  802,  802,  802,  802,  803,  803,  803,  803,  803,  905,

			  117,  824,  905,  905,  603,  838,  838,  838,  838,  838,
			  905,  905,  905,  905,  117,  905,  117,  905,  117,  905,
			  905,  158,  774,  831,  158,  117,  117,  158,  117,  824,
			  158,  905,  117,  905,  117,  905,  825,  905,  826,  117,
			  117,  117,  117,  832,  827,  117,  117,  905,  905,  158,
			  905,  831,  158,  117,  117,  158,  905,  905,  158,  905,
			  905,  905,  905,  117,  905,  825,  826,  905,  905,  905,
			  117,  117,  832,  827,  158,  158,  158,  158,  158,  158,
			  905,  905,  905,  905,  905,  158,  905,  158,  158,  158,
			  158,  158,  158,  834,  905,  905,  117,  905,  158,  905,

			  905,  117,  158,  905,  905,  905,  832,  158,  158,  117,
			  841,  836,  117,  158,  834,  117,  158,  117,  905,  905,
			  158,  834,  158,  117,  117,  117,  158,  905,  905,  117,
			  158,  846,  905,  117,  905,  833,  158,  117,  841,  158,
			  836,  117,  835,  842,  158,  158,  117,  117,  905,  117,
			  158,  905,  905,  905,  117,  905,  905,  905,  905,  846,
			  905,  117,  158,  158,  158,  158,  158,  158,  905,  905,
			  905,  842,  905,  158,  905,  905,  905,  905,  117,  158,
			  158,  158,  158,  158,  158,  848,  848,  848,  848,  848,
			  158,  905,  117,  905,  905,  847,  774,  774,  774,  774,

			  774,  849,  849,  849,  849,  849,  117,  158,  117,  905,
			  850,  905,  158,  158,  905,  158,  905,  856,  158,  905,
			  117,  158,  905,  847,  117,  851,  855,  905,  905,  905,
			  158,  905,  905,  905,  905,  158,  158,  117,  117,  850,
			  117,  158,  158,  158,  876,  856,  905,  905,  158,  158,
			  905,  905,  117,  851,  860,  855,  861,  862,  158,  849,
			  849,  849,  849,  849,  158,  117,  117,  158,  905,  117,
			  158,  905,  876,  158,  905,  863,  158,  905,  866,  117,
			  117,  117,  117,  867,  867,  867,  867,  867,  869,  869,
			  869,  869,  869,  117,  117,  158,  872,  872,  872,  872,

			  872,  158,  905,  863,  905,  905,  866,  905,  905,  905,
			  117,  117,  877,  877,  877,  877,  877,  905,  905,  117,
			  873,  878,  878,  878,  878,  878,  869,  869,  869,  869,
			  869,  905,  905,  117,  905,  117,  869,  869,  869,  869,
			  869,  905,  905,  905,  158,  870,  117,  117,  873,  860,
			  158,  861,  879,  905,  872,  872,  872,  872,  872,  905,
			  117,  905,  117,  905,  117,  882,  882,  882,  882,  882,
			  905,  905,  158,  905,  117,  905,  905,  905,  158,  886,
			  886,  886,  886,  886,  859,  859,  859,  859,  859,  905,
			  905,  117,  889,  889,  889,  889,  889,  860,  905,  861, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  905,  905,  886,  886,  886,  886,  886,  893,  893,  893,
			  893,  893,  894,  894,  894,  894,  894,  897,  897,  897,
			  897,  897,  885,  885,  885,  885,  885,  901,  901,  901,
			  901,  901,  902,  902,  902,  902,  902,  903,  903,  903,
			  903,  903,  898,  905,  898,  905,  905,  902,  902,  902,
			  902,  902,  904,  904,  904,  904,  904,  900,  900,  900,
			  900,  900,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  317,  317,  317,  317,  317,  317,  317,  317,  317,
			  900,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   98,   98,  905,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,  905,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,  100,
			  100,  905,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  108,  754,  754,  754,
			  754,  754,  754,  754,  754,  754,  905,  905,  905,  905,
			  905,  905,  905,  905,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  117,  117,  117,  905,  905,  905,  905,

			  905,  905,  117,  117,  905,  117,  905,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  905,  905,  905,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  150,  150,
			  905,  150,  905,  150,  150,  905,  905,  905,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  905,  905,  905,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  153,
			  153,  905,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  212,  212,  905,  212,

			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  905,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,

			  226,  226,  226,  226,  226,  226,  226,  232,  905,  232,
			  905,  905,  905,  905,  232,  905,  232,  232,  905,  905,
			  905,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  905,  905,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  246,  246,  905,  246,
			  246,  246,  246,  246,  246,  246,  246,  246,  246,  246,
			  246,  246,  246,  246,  246,  246,  246,  246,  246,  246,
			  246,  246,  246,  246,  246,  246,  246,  246,  246,  246,
			  246,  246,  246,  103,  905,  905,  905,  103,  103,  905,
			  905,  905,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  905,  905,  905,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  108,  108,  108,  905,  905,  905,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  905,  905,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  272,  905,  905,
			  272,  272,  905,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  905,  905,  905,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  158,  905,  158,  905,
			  158,  905,  905,  158,  158,  158,  158,  158,  905,  905,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,

			  905,  905,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  905,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  245,  245,  245,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  245,  245,

			  245,  245,  245,  245,  245,  245,  245,  245,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  245,  413,  413,  905,  905,  905,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  905,  905,  905,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  414,  414,  905,
			  905,  905,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  905,  905,  905,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  317,  317,  317,  905,  905,  905,  317,
			  317,  317,  317,  317,  317,  317,  317,  317,  317,  905,
			  905,  317,  317,  317,  317,  317,  317,  317,  317,  317, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  521,  521,  521,
			  521,  521,  521,  521,  521,  521,  905,  905,  905,  521,
			  521,  521,  521,  521,  521,  521,  521,  521,  554,  905,
			  554,  905,  905,  905,  905,  554,  905,  554,  554,  905,
			  905,  905,  554,  554,  554,  554,  554,  554,  554,  554,
			  554,  905,  905,  905,  554,  554,  554,  554,  554,  554,
			  554,  554,  554,  459,  459,  459,  905,  905,  459,  459,

			  459,  459,  459,  459,  459,  459,  905,  905,  459,  459,
			  459,  459,  459,  459,  459,  459,  459,  905,  905,  905,
			  459,  459,  459,  459,  459,  459,  459,  459,  459,  612,
			  612,  612,  612,  612,  612,  612,  612,  612,  905,  905,
			  905,  612,  612,  612,  612,  612,  612,  612,  612,  612,
			  613,  613,  905,  905,  905,  613,  613,  613,  613,  613,
			  613,  613,  613,  613,  905,  905,  905,  613,  613,  613,
			  613,  613,  613,  613,  613,  613,  639,  905,  639,  905,
			  905,  905,  905,  639,  905,  639,  639,  905,  905,  905,
			  639,  639,  639,  639,  639,  639,  639,  639,  639,  905,

			  905,  639,  639,  639,  639,  639,  639,  639,  639,  639,
			  639,  688,  688,  905,  905,  905,  688,  688,  688,  688,
			  688,  688,  688,  688,  688,  905,  905,  905,  688,  688,
			  688,  688,  688,  688,  688,  688,  688,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  905,  905,  905,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  754,  905,
			  905,  905,  754,  754,  905,  905,  905,  754,  754,  754,
			  754,  754,  754,  754,  754,  754,  905,  905,  905,  754,
			  754,  754,  754,  754,  754,  754,  754,  754,  804,  804,
			  905,  905,  905,  804,  804,  804,  804,  804,  804,  804,

			  804,  804,  905,  905,  905,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  839,  839,  905,  905,  905,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  905,  905,
			  905,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			   11,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905, yy_Dummy>>,
			1, 432, 7000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7431)
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

			   13,    4,   13,   13,   25,   51,   25,   25,   25,   25,
			   25,   92,   27,   51,   27,  108,   27,   27,   27,   27,
			   27,   38,   38,   63,   38,   76,  881,  142,    5,    5,
			    6,    6,   28,   64,   28,   63,   28,   28,   28,   28,
			   28,  143,    3,   18,   38,   64,  880,    4,  871,    9,
			  108,   63,  163,   10,   27,   74,  142,   74,   74,  861,
			  163,   64,   95,   63,   95,   95,   92,  155,  853,  143,
			  155,   76,  852,   64,   28,  155,    3,    3,    3,    3,
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
			   35,   36,   36,  239,   36,  152,   78,   37,   37,  261,
			   37,   68,   77,   40,   40,  823,   40,  261,   39,   39,

			   35,   39,   41,   41,   36,   41,  812,   68,  380,   35,
			   37,   79,   36,   35,   37,   35,   40,  800,  374,   68,
			   40,   39,  152,   37,  214,   41,  214,  214,  767,   80,
			   42,   42,   40,   42,   39,   69,   41,   35,  239,  414,
			   36,   35,   37,   35,  380,   39,  414,   69,   40,   43,
			   43,   37,   43,   42,   44,   44,   69,   44,   45,   45,
			   40,   45,   39,   69,   41,   78,  755,   42,   42,   77,
			   77,   77,   43,   42,   39,   69,   43,   44,  754,   50,
			   50,   45,   50,   49,   49,   69,   49,   45,   79,   79,
			   79,   47,   47,   44,   47,   42,   42,  374,  707,   82,

			   45,   42,   50,   81,   43,   84,   49,   80,   80,  236,
			   87,  706,  236,   87,   47,   45,  231,   48,   48,  231,
			   48,   44,   49,  238,  539,   47,  238,   50,   45,   46,
			   46,  539,   46,   47,   82,   82,  454,  317,  151,  454,
			   48,   84,   84,  705,   46,   46,   46,   46,   46,   46,
			   49,   61,   46,   47,  218,   48,   50,  704,   61,   46,
			   48,   47,   87,   61,   56,   56,   46,   85,  231,   56,
			  324,   56,  317,   46,  151,   46,  324,   46,  222,   61,
			   81,   81,   81,   48,  804,  804,   61,   46,   48,  151,
			   56,   61,   56,   56,   46,  116,  116,   56,  116,   56,

			  820,  820,   85,   85,   46,   56,   46,   55,   89,  219,
			   55,   89,  688,  222,  222,   55,  386,  386,  116,  386,
			   89,   89,   55,   55,   55,   55,   55,   55,   55,  684,
			   89,  218,  218,  218,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,  839,  839,
			   89,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   57,  219,  219,  219,   58,
			   57,  678,  519,   58,   57,   58,   57,  109,  109,  109,

			  109,  109,  254,  254,   90,  254,  647,   90,  112,  112,
			  112,  112,  112,   57,   58,   57,   90,   58,   57,  631,
			  458,   58,   57,   58,   57,  254,   90,   59,  458,   58,
			   57,   59,  519,   59,  552,   60,  220,  552,   62,  613,
			   60,  605,   59,  183,   60,  598,   60,   60,   62,   62,
			   62,  183,   59,  809,   62,   59,   90,  183,   65,   59,
			   65,   59,  561,   60,  639,   60,   62,   59,   60,   62,
			   65,   59,   60,   65,   60,   60,   62,   62,   62,  183,
			   60,   67,   62,  179,   66,  183,   65,  225,   65,  179,
			  179,   66,   67,   67,  809,  560,   66,   67,   65,   66,

			  113,   65,  113,  630,  113,  113,  113,  113,  113,   67,
			  630,  179,   66,  220,  220,  220,  639,  179,  179,   66,
			   67,   67,  225,  225,   66,   67,  531,   66,   93,   93,
			  255,   93,  255,  255,  102,  184,  184,  184,  184,  184,
			  184,  515,  113,  102,  102,  102,  102,  102,  259,  259,
			  259,  259,  259,   93,  226,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,  102,  106,
			  106,  106,  106,  106,  508,  110,  110,  110,  110,  110,
			  226,  226,  416,  102,  106,  244,  244,  102,  244,  102,

			  110,  266,  266,  266,  266,  111,  413,  111,   93,  111,
			  111,  111,  111,  111,  111,  403,  402,  106,  117,  117,
			  244,  117,  106,  119,  119,  388,  119,  427,  110,  383,
			  221,  117,  117,  382,  186,  323,  119,  119,  427,  117,
			  186,  117,  120,  120,  119,  120,  119,  111,  427,  167,
			  167,  167,  167,  167,  398,  120,  120,  322,  121,  121,
			  376,  121,  186,  120,  228,  120,  427,  119,  186,  167,
			  318,  121,  121,  122,  122,  313,  122,  398,  120,  121,
			  557,  121,  398,  557,  272,  180,  122,  122,  121,  123,
			  123,  180,  123,  271,  122,  119,  122,  167,  180,  260,

			  228,  228,  123,  123,  557,  122,  120,  221,  221,  221,
			  123,  253,  123,  180,  124,  124,  121,  124,  682,  180,
			  170,  170,  170,  170,  170,  145,  180,  124,  124,  125,
			  125,  123,  125,  122,  252,  124,  170,  124,  376,  376,
			  145,  682,  125,  125,  126,  126,  682,  126,  127,  127,
			  125,  127,  125,  124,  145,  145,  145,  126,  126,  123,
			  251,  127,  127,  553,  170,  126,  553,  126,  145,  127,
			  250,  127,  125,  126,  128,  128,  518,  128,  518,  126,
			  248,  124,  854,  145,  127,  145,  518,  128,  128,  854,
			  129,  129,  243,  129,  234,  128,  195,  128,  811,  229, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  125,  126,  195,  129,  129,  130,  130,  126,  130,  811,
			  227,  129,  127,  129,  518,  553,  128,  373,  130,  130,
			  131,  131,  224,  131,  195,  375,  130,  212,  130,  554,
			  195,  284,  554,  131,  131,  159,  284,  132,  132,  811,
			  132,  131,  156,  131,  128,  130,  153,  284,  150,  131,
			  132,  132,  137,  133,  133,  105,  133,  284,  132,  104,
			  132,  166,  166,  166,  166,  166,  133,  133,  103,  134,
			  134,  100,  134,  130,  133,  284,  133,  131,   98,  164,
			  164,  554,  134,  134,  377,  135,  135,  164,  135,  166,
			  134,  132,  134,  164,  373,  373,  373,  133,  135,  135,

			  147,   96,  375,  375,  375,  164,  135,   88,  135,  136,
			  136,   73,  136,  134,  135,  147,  147,  166,  736,  736,
			  736,  164,  136,  136,  232,  133,   70,  232,   54,  147,
			  136,  147,  136,  164,  139,  139,  232,  139,   33,  136,
			   31,  134,  135,  147,  147,   26,  232,  139,  139,  139,
			  643,  140,  140,  643,  140,  139,  559,  139,  643,  559,
			  147,  377,  377,  377,  140,  140,  140,  136,  138,  138,
			  138,  138,  140,  187,  140,   24,  232,  138,  139,  187,
			  559,  140,  387,  387,   16,  387,  138,   15,  196,  196,
			  138,   14,   11,  138,  196,  140,  144,  140,  187,    0,

			  138,  187,  138,    0,  138,  788,  788,  187,  788,  140,
			    0,  144,  144,  203,  138,  144,  196,  196,  138,  203,
			    0,  138,  196,  203,    0,  144,  140,  144,  788,    0,
			  304,  138,    0,  138,  141,  141,  141,  141,  141,  144,
			  144,  203,    0,  144,  304,    0,  304,  203,  141,    0,
			    0,  203,  141,  146,    0,  141,  144,  158,  304,  148,
			  158,  141,  141,  378,  141,  158,  149,    0,  146,    0,
			  158,  158,  158,  146,  148,  304,  141,  146,  158,  828,
			  141,  149,  146,  141,  146,    0,  148,  828,  148,  141,
			  148,    0,  379,  141,    0,  149,  146,  149,    0,  149,

			  828,  146,  148,  160,  200,  146,  160,  158,    0,  149,
			  200,  160,  622,  146,  148,  828,  160,  160,  160,  148,
			  200,  199,  161,  199,  160,  161,  149,  199,  149,  622,
			  161,  162,  200,  622,  162,  161,  161,  161,  200,  162,
			  378,  378,  378,  161,  162,  162,  162,  160,  200,  199,
			    0,  199,  162,  160,    0,  199,    0,  622,  161,  165,
			  165,  162,  165,  165,  165,  165,  165,  165,  191,  379,
			  379,  379,  161,  165,  191,  160,  168,  168,  168,  168,
			  168,  162,    0,  191,  169,  165,  161,  169,    0,  162,
			  168,    0,  169,  848,    0,  848,  191,  169,  169,  169,

			    0,  165,  191,  848,    0,  169,  171,  389,  389,  171,
			  389,  191,  694,  165,  171,    0,  169,    0,  168,  171,
			  171,  171,  172,    0,    0,  172,    0,  171,    0,  694,
			  172,  848,  389,  694,  169,  172,  172,  172,  173,  173,
			  173,  173,  173,  172,  169,    0,  700,  546,  171,  185,
			  174,  174,  174,  174,  174,  185,  171,  694,  546,    0,
			  185,  172,    0,  700,  173,  209,  175,  700,  546,  175,
			    0,  209,  172,  174,  175,    0,  171,  185,    0,  175,
			  175,  175,  176,  185,  209,  176,  546,  175,  185,  172,
			  176,  700,  173,  209,    0,  176,  176,  176,    0,  209,

			  878,  174,  878,  176,  177,  177,  177,  177,  177,  175,
			  878,  176,    0,  209,    0,    0,  175,  176,    0,    0,
			    0,  178,  178,  178,  178,  178,  181,  181,  181,  181,
			  181,  177,  176,    0,  178,    0,    0,  175,  878,  176,
			  178,  609,  609,  609,  609,  176,  181,  182,  182,  182,
			  182,  182,  188,  188,  188,  188,  188,    0,    0,  177,
			    0,    0,  178,  192,  192,  192,  192,  192,  178,    0,
			    0,  746,    0,  182,  181,    0,  188,  189,  189,  189,
			  189,  189,  190,  190,  190,  190,  190,  193,  746,    0,
			  189,  192,  746,  193,  194,  194,  194,  194,  194,    0,

			    0,  182,  193,    0,  188,  262,  262,  262,  262,  262,
			  197,  197,  197,  197,  197,  193,  746,    0,  189,  192,
			  190,  193,  194,  197,  198,  198,  198,  198,  198,    0,
			  193,  201,  201,  201,  201,  201,    0,    0,  198,  202,
			  202,  202,  202,  202,  217,    0,  201,  204,    0,  204,
			  194,  197,    0,  204,    0,    0,    0,  205,  205,  205,
			  205,  205,  858,  858,  858,  858,  198,    0,  202,  206,
			  206,  206,  206,  206,  201,  204,  205,  204,    0,  207,
			  205,  204,  551,    0,  206,  207,  210,  210,  210,  210,
			  210,    0,  207,  551,    0,    0,  202,  208,  208,  208,

			  208,  208,    0,  551,  205,    0,    0,  207,  205,    0,
			    0,    0,  206,  207,  738,  738,  738,  738,  210,  235,
			  207,  551,  235,  208,  217,  217,  217,  217,  217,    0,
			    0,  235,  249,  249,  249,  249,  249,  249,    0,    0,
			    0,  235,  267,  267,  267,  267,  267,  210,  258,    0,
			  258,  208,  738,  258,  258,  258,  258,  258,  264,    0,
			  264,    0,    0,  264,  264,  264,  264,  264,    0,    0,
			    0,  235,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  240,  240,    0,  240,  293,  293,  293,
			  293,  293,  884,  884,  884,  884,  265,    0,  265,    0,
			  265,  265,  265,  265,  265,    0,    0,    0,  240,    0,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,

			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  257,  257,  257,  257,  257,  265,  263,
			  263,  263,  263,  263,  273,    0,    0,  636,  257,  275,
			  274,    0,    0,    0,  263,  321,    0,    0,  636,  273,
			  273,  321,    0,  240,  275,  274,    0,    0,  636,  277,
			  276,  257,    0,  273,  274,  273,  257,  263,  275,  274,
			  275,  274,  263,  321,  277,  276,  636,  273,  273,  321,
			  278,  448,  275,  274,  276,    0,  448,    0,  277,  276,
			  277,  276,  274,    0,  273,  278,    0,  448,  279,  275,
			  274,  280,  277,  276,  637,    0,  281,  448,  278,  278, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  829,  278,  276,  279,  279,    0,  280,  637,  829,  277,
			  276,  281,  280,  278,  282,  448,    0,  279,  637,  279,
			  280,  829,  280,    0,  281,  281,  278,  281,  637,  282,
			  278,  279,  279,    0,  280,    0,  829,    0,  283,  281,
			  280,    0,  282,  282,  285,  282,  637,  286,  279,    0,
			    0,  280,  281,  283,  320,  348,  281,  282,    0,  285,
			  320,  348,  286,    0,  320,  285,    0,  283,  286,  283,
			  282,  287,    0,  285,  282,  285,  286,  283,  286,    0,
			  288,  283,  320,  348,  289,    0,  287,  285,  320,  348,
			  286,  287,  320,  285,  288,  288,  286,    0,  283,  289,

			  287,    0,  287,  290,  285,    0,    0,  286,    0,  288,
			  291,  288,    0,  289,  287,  289,  843,    0,  290,  287,
			    0,    0,  288,  288,  843,  291,  291,  289,    0,    0,
			    0,  287,  290,  290,  290,    0,    0,  843,    0,  291,
			  288,  291,    0,    0,  289,    0,  290,  294,  294,  294,
			  294,  294,  843,  291,  291,  300,  300,  300,  300,  300,
			    0,  290,    0,  290,  295,  295,  295,  295,  295,  295,
			  291,  296,  296,  296,  296,  296,  296,    0,    0,  295,
			  302,  302,  302,  302,  302,    0,  296,  314,  314,  314,
			  314,  314,  314,  295,    0,  295,    0,    0,  302,  319,

			  296,  319,  296,    0,    0,  319,    0,  295,  297,  297,
			  297,  297,  297,  297,  296,  298,  298,  298,  298,  298,
			  298,    0,    0,  297,  295,    0,  302,  319,    0,  319,
			  298,  296,    0,  319,    0,    0,    0,  297,  301,  297,
			  301,  301,    0,    0,  298,  750,  298,    0,  303,  750,
			    0,  297,  299,  299,  299,  299,  299,  299,  298,    0,
			  301,  303,  303,  301,  303,    0,  750,  299,  297,  301,
			    0,  305,  306,    0,    0,  298,  303,  750,  306,    0,
			    0,  299,    0,  299,    0,    0,  305,  306,  301,  303,
			  307,  301,    0,  303,  305,  299,    0,  301,  308,    0,

			  305,  306,  305,  306,    0,  307,  307,    0,  309,  844,
			  329,    0,  299,  308,  305,  306,  329,  844,    0,  307,
			  329,  307,  305,  309,  308,    0,    0,  308,  310,  308,
			  844,  305,  306,  307,  307,  309,  351,  309,  329,  309,
			    0,  308,  351,  310,  329,  844,  311,  312,  329,    0,
			  307,  309,  308,  894,  894,  894,  894,  310,  308,  310,
			    0,  311,  312,  309,  351,    0,    0,  310,  309,    0,
			  351,  310,    0,    0,    0,  311,  312,  311,  312,  315,
			  312,  315,  315,  315,  315,  315,  315,    0,  310,  311,
			  312,  894,    0,  325,    0,  325,  325,  325,  325,  325,

			  326,  326,  326,  326,  326,    0,  311,  312,  325,  312,
			    0,    0,    0,    0,  325,  326,  327,  327,  327,  327,
			  327,  328,  328,  328,  328,  328,  330,  330,  330,  330,
			  330,  331,  331,    0,  332,    0,  325,  331,    0,  327,
			  332,    0,  325,  326,    0,    0,  830,    0,  332,  330,
			  333,  333,  333,  333,  333,  335,    0,  335,  830,  331,
			  331,  335,  332,    0,  333,  331,  830,  327,  332,  334,
			  334,  334,  334,  334,  336,    0,  332,  330,  751,  830,
			  336,  336,  751,  335,  337,  335,    0,    0,    0,  335,
			  337,    0,  333,    0,  830,    0,  334,    0,  337,  751,

			    0,    0,  336,  339,  339,  339,  339,  339,  336,  336,
			  751,    0,  337,  338,  338,  338,  338,  338,  337,  342,
			    0,  341,    0,  339,  334,  342,  337,  341,  338,    0,
			  340,  340,  340,  340,  340,  341,    0,  343,  343,  343,
			  343,  343,    0,    0,  342,    0,  752,  342,    0,  341,
			  752,  339,    0,  342,    0,  341,  338,  340,  344,  344,
			  344,  344,  344,  341,  343,  345,  346,  752,    0,    0,
			    0,  345,  346,  346,  347,    0,  345,    0,  752,    0,
			  347,  347,    0,    0,    0,  340,    0,  345,    0,    0,
			    0,    0,  343,  353,  346,    0,  344,  345,    0,  353,

			  346,  346,  347,  349,  349,  349,  349,  349,  347,  347,
			  350,  350,  350,  350,  350,  345,  352,  352,  352,  352,
			  352,  353,  355,  349,    0,    0,    0,  353,  355,  352,
			  350,  354,  354,  354,  354,  354,    0,  356,  355,  356,
			    0,    0,    0,  356,  357,  357,  357,  357,  357,    0,
			  355,  349,    0,    0,    0,    0,  355,  352,  350,  358,
			  358,  358,  358,  358,    0,  356,  355,  356,    0,  359,
			  360,  356,  360,  357,  358,  359,  360,    0,  359,    0,
			    0,    0,  369,  361,  361,  361,  361,  361,  369,    0,
			    0,    0,  362,  362,  362,  362,  362,  359,  360,    0,

			  360,  357,  358,  359,  360,  361,  359,  362,  363,  364,
			  369,  468,  472,  365,  363,  364,  369,  468,  472,  365,
			  363,    0,  364,    0,  366,  366,  366,  366,  366,    0,
			    0,    0,    0,  361,    0,  362,  363,  364,  365,  468,
			  472,  365,  363,  364,    0,  468,  472,  365,  363,  366,
			  364,    0,  367,  367,  367,  367,  367,  368,  368,  368,
			  368,  368,  370,  370,  370,  370,  370,    0,  371,  372,
			  372,  372,  372,  372,  371,    0,    0,  366,  367,    0,
			    0,  384,  384,  887,  384,    0,    0,  371,  399,  399,
			  399,  399,  399,  384,    0,  368,  371,    0,    0,    0,

			  887,  372,  371,  384,  887,    0,  367,  392,  392,  392,
			  392,  392,  392,    0,    0,    0,  371,  400,  400,  400,
			  400,  400,  401,  401,  401,  401,  401,    0,  887,    0,
			  372,    0,    0,  384,  404,  404,  404,  404,  404,  405,
			  405,  405,  405,  405,  406,    0,  406,    0,    0,  406,
			  406,  406,  406,  406,  405,  400,  407,  407,  407,  407,
			  407,  408,  408,  408,  408,  408,  409,  409,  409,  409,
			  409,  411,  411,  411,  411,  411,    0,  405,  417,  418,
			  410,  410,  405,  410,  410,  410,  410,  410,  412,  412,
			  412,  412,  412,  417,  418,    0,    0,  419,  420,    0,

			    0,  421,    0,    0,  409,  417,    0,  417,  418,  417,
			  418,    0,  419,  420,  864,    0,  421,  421,  420,  422,
			    0,  417,  418,    0,  419,  864,  419,  420,  419,  420,
			  421,  473,  421,  417,  422,  864,    0,  473,  417,  418,
			  419,  420,    0,  888,  421,  421,  420,  473,  422,    0,
			  422,  423,  419,  864,    0,  424,  425,  419,  420,  473,
			  888,  421,  422,    0,  888,  473,  423,  469,    0,  469,
			  424,  425,  425,  469,    0,  473,  428,  426,    0,  422,
			  423,  423,  423,    0,  424,  425,  424,  425,  888,  426,
			  845,  428,  426,    0,  423,  469,  428,  469,  424,  425, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  425,  469,  845,  429,    0,  428,  426,  428,  426,  423,
			  845,  423,  424,    0,    0,  424,  425,  426,  429,  428,
			  426,    0,    0,  845,  428,  430,  431,  441,  441,  441,
			  441,  441,  429,  429,  429,  432,  428,  426,  845,    0,
			  430,  431,    0,  481,    0,  431,  429,    0,  430,  481,
			  432,    0,    0,    0,  430,  431,  430,  431,    0,  441,
			  433,  429,  432,  429,  432,    0,  432,    0,  430,  431,
			    0,  481,    0,  431,    0,  433,  430,  481,  432,  434,
			  434,  434,  434,  434,    0,  430,  431,  433,  441,  433,
			  432,  433,    0,    0,  435,  432,  435,  435,  435,  435,

			  435,  435,    0,  433,    0,  437,  434,  436,  436,  436,
			  436,  436,    0,    0,    0,  433,    0,    0,    0,  460,
			  433,  436,    0,  435,  437,  460,    0,  437,  436,  478,
			    0,  478,  460,  437,  434,  478,    0,  436,    0,  436,
			  438,  438,  438,  438,  438,    0,    0,  460,    0,  436,
			    0,  435,  437,  460,    0,  437,  436,  478,  438,  478,
			  460,  437,    0,  478,    0,    0,  436,  891,  436,  439,
			  439,  439,  439,  439,  440,  440,  440,  440,  440,  440,
			    0,  753,    0,  439,  891,  753,  438,    0,  891,  440,
			  442,  442,  442,  442,  442,    0,  479,    0,  479,  439,

			  446,  638,  753,  440,  479,  440,  443,  443,  443,  443,
			  443,  439,  891,  753,  638,  446,    0,  440,  444,  444,
			  444,  444,  444,  444,  479,  638,  479,  447,  439,  446,
			    0,  446,  479,  444,  440,  638,  445,  445,  445,  445,
			  445,  445,  447,  446,    0,    0,    0,  444,    0,  444,
			    0,  445,    0,  638,  449,    0,  447,    0,  447,  450,
			  446,  444,  451,    0,    0,  445,  492,  445,    0,  449,
			  447,    0,  492,    0,  450,    0,    0,  451,  444,  445,
			  452,    0,  453,  449,  453,  449,    0,  447,  450,  450,
			  450,  451,  452,  451,  492,  452,  445,  449,    0,  453,

			  492,    0,  450,  452,    0,  451,    0,  892,    0,  452,
			    0,  452,    0,  453,  449,  453,    0,  450,    0,  450,
			  452,    0,  451,  452,  892,    0,    0,  453,  892,    0,
			  455,  452,  455,  455,  455,  455,  455,  455,    0,    0,
			  452,    0,    0,  456,  453,  456,  456,  456,  456,  456,
			  456,  457,  892,  457,  457,  457,  457,  457,  457,  461,
			  463,  463,  463,  463,  463,  461,    0,  462,  455,  462,
			  462,  462,  462,  462,    0,    0,  461,    0,    0,    0,
			    0,  456,  464,  464,  464,  464,  464,  461,  865,  457,
			    0,    0,    0,  461,  465,  465,  465,  465,  465,  865,

			  466,    0,    0,    0,    0,  461,  466,    0,  464,  865,
			    0,    0,    0,  466,  467,  467,  467,  467,  467,  470,
			  470,  470,  470,  470,  465,    0,    0,  865,  466,  471,
			  471,  471,  471,  471,  466,    0,  464,  474,  470,    0,
			  467,  466,    0,  474,  471,  475,  475,  475,  475,  475,
			    0,    0,  474,  465,  476,  476,  476,  476,  476,  477,
			  477,  477,  477,  477,    0,  474,  470,    0,  467,    0,
			    0,  474,  471,  480,  480,  480,  480,  480,  482,    0,
			  474,    0,    0,  476,  482,  486,  483,  477,  480,  784,
			  486,  486,  483,  784,  482,  483,    0,    0,  484,  484,

			  484,  484,  484,    0,    0,    0,  482,    0,    0,    0,
			  784,  476,  482,  486,  483,  477,  480,  484,  486,  486,
			  483,  784,  482,  483,  485,  485,  485,  485,  485,  487,
			  487,  487,  487,  487,  493,  488,  489,  497,  497,    0,
			  493,  488,  489,  497,  562,  484,    0,  487,  488,  489,
			  562,    0,    0,  485,  490,  490,  490,  490,  490,    0,
			    0,    0,  493,  488,  489,  497,  497,    0,  493,  488,
			  489,  497,  562,    0,    0,  487,  488,  489,  562,    0,
			  490,  485,    0,  491,  491,  491,  491,  491,  494,  494,
			  494,  494,  494,  495,  495,  495,  495,  495,  496,  498,

			    0,  498,    0,    0,  496,  563,    0,  498,  490,  491,
			  498,  563,    0,    0,  496,  499,  499,  499,  499,  499,
			  500,  500,  500,  500,  500,  501,  496,  498,    0,  498,
			  563,    0,  496,  563,  500,  498,    0,  491,  498,  563,
			  578,  501,  496,    0,  499,  502,  578,  501,  502,  502,
			  502,  502,  502,  504,  504,  504,  504,  504,    0,    0,
			    0,    0,  500,  505,  505,  505,  505,  505,  578,  501,
			    0,    0,  499,    0,  578,  501,  506,  506,  506,  506,
			  506,  507,    0,  507,  507,  507,  507,  507,    0,    0,
			    0,  504,  509,  509,  509,  509,  509,  510,  510,  510,

			  510,  510,  511,  511,  511,  511,  511,  509,  512,  512,
			  512,  512,  512,  513,  513,  513,  513,  513,  514,  514,
			  514,  514,  514,  516,  516,  516,  516,  516,    0,    0,
			  509,  522,  523,    0,    0,  509,    0,  524,    0,  517,
			  511,  517,  517,  517,  517,  517,  522,  523,  570,    0,
			    0,  513,  524,  524,  570,  525,    0,  570,  526,    0,
			  522,  523,  522,  523,  527,    0,  524,    0,  524,    0,
			  525,  523,    0,  526,  522,  523,  570,  583,  525,  527,
			  524,  524,  570,  583,  525,  570,  525,  526,  528,  526,
			    0,  522,  523,  527,  529,  527,    0,  524,  525,  533,

			    0,  526,    0,  528,  528,  583,  525,  527,    0,  529,
			    0,  583,  530,    0,  533,  525,  528,  528,  526,  528,
			  532,    0,    0,  529,  527,  529,    0,  530,  533,    0,
			  533,  528,  528,  530,    0,  532,  532,  529,  534,    0,
			    0,  530,  533,  530,  528,    0,    0,    0,  528,  532,
			    0,  532,    0,  534,  529,  530,    0,    0,  535,  533,
			  648,  530,  537,  532,  532,    0,  648,  534,  536,  534,
			    0,  785,  530,  535,  535,  785,    0,  537,  537,    0,
			  532,  534,    0,  536,    0,    0,    0,  535,  648,  535,
			    0,  537,  785,  537,  648,  536,    0,  536,  534,  536,

			    0,  535,  535,  785,  541,  537,  537,    0,    0,    0,
			    0,  536,  540,  540,  540,  540,  540,  540,  535,  541,
			    0,    0,  537,  536,    0,    0,    0,  540,  536,    0,
			    0,    0,    0,  541,    0,  541,  542,  542,  542,  542,
			  542,  540,    0,  540,    0,    0,  543,  541,  543,  543,
			  543,  543,  543,  543,  544,  540,  544,    0,  544,  544,
			  544,  544,  544,  542,  541,  545,  545,  545,  545,  545,
			    0,    0,  540,    0,    0,  543,  544,  547,  786,  544,
			  548,    0,  786,    0,  595,  544,  545,    0,    0,    0,
			  595,  542,  547,  547,  595,  548,  548,    0,    0,  786, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  549,  550,    0,  543,  544,    0,  547,  544,  547,  548,
			  786,  548,  595,  544,  545,  549,  550,  874,  595,    0,
			  547,  547,  595,  548,  548,  550,    0,  549,  874,  549,
			  550,  549,  550,    0,    0,    0,    0,  547,  874,    0,
			  548,    0,    0,  549,  550,  555,  555,  555,  555,  555,
			  555,    0,    0,  550,    0,  549,  874,    0,    0,    0,
			  549,  550,  558,    0,  558,  558,  558,  558,  558,  558,
			  564,    0,  564,  564,  564,  564,  564,  565,    0,  565,
			  565,  565,  565,  565,  565,  566,  566,  566,  566,  566,
			  567,  567,  567,  567,  567,  568,    0,  568,    0,    0,

			  558,  568,  569,  569,  569,  569,  569,    0,  564,  571,
			  571,    0,    0,    0,    0,  571,    0,  569,  572,  572,
			  572,  572,  572,  568,    0,  568,    0,    0,  567,  568,
			  573,  573,  573,  573,  573,  574,  574,  571,  571,    0,
			  572,  574,    0,  571,  573,  569,  575,    0,  575,    0,
			  875,    0,  575,  576,  576,  576,  576,  576,  787,  579,
			  575,  875,  787,  574,  574,  579,  579,  576,  572,  574,
			    0,  875,  573,    0,  575,    0,  575,    0,    0,  787,
			  575,  577,  577,  577,  577,  577,    0,  579,  575,  875,
			  787,    0,    0,  579,  579,  576,  577,  580,  580,  580,

			  580,  580,    0,  581,    0,  581,  582,  582,  577,  581,
			    0,    0,  582,  584,  584,  584,  584,  584,  585,  585,
			  585,  585,  585,  586,  577,  586,    0,    0,  584,  586,
			    0,  581,  585,  581,  582,  582,  577,  581,    0,    0,
			  582,    0,  588,  587,  587,  587,  587,  587,  588,    0,
			    0,  586,    0,  586,    0,  588,  584,  586,  587,  589,
			  585,  589,    0,    0,    0,  589,    0,    0,    0,    0,
			  588,  590,  590,  590,  590,  590,  588,  591,  591,  591,
			  591,  591,  592,  588,  592,  594,  587,  589,  592,  589,
			    0,  594,  591,  589,  593,    0,  593,  590,  594,    0,

			  593,    0,  596,  596,  596,  596,  596,    0,    0,    0,
			  592,    0,  592,  594,    0,    0,  592,  596,    0,  594,
			  591,    0,  593,    0,  593,  590,  594,    0,  593,  597,
			  597,  597,  597,  597,  599,  599,  599,  599,  599,  601,
			  601,  601,  601,  601,  597,  596,  600,    0,  600,  600,
			  600,  600,  600,    0,  601,  602,  602,  602,  602,  602,
			  603,  603,  603,  603,  603,  604,  604,  604,  604,  604,
			    0,    0,  597,  606,  606,  606,  606,  606,    0,    0,
			    0,    0,  601,    0,  600,  607,  607,  607,  607,  607,
			    0,  615,  614,  602,  608,  608,  608,  608,  608,  611,

			  611,  611,  611,  611,  614,    0,  615,  614,    0,    0,
			  617,    0,    0,    0,  611,  616,    0,    0,    0,    0,
			  615,  614,  615,  614,    0,  617,    0,  616,    0,    0,
			  616,    0,  614,  618,  615,  614,    0,    0,    0,  617,
			    0,  617,  611,    0,  616,    0,  616,    0,  618,  618,
			    0,  615,  614,  617,    0,  616,  619,  620,  616,    0,
			    0,    0,  618,  621,  618,  649,  649,  649,  649,  649,
			  617,  619,  620,    0,  651,  616,  618,  618,  621,  619,
			  651,    0,  623,    0,  621,  619,  620,  619,  620,  624,
			    0,    0,  621,  618,  621,    0,    0,  623,    0,  619,

			  620,    0,  651,    0,  624,  624,  621,  619,  651,    0,
			  623,  623,  621,  623,    0,  625,  619,  620,  624,  626,
			  624,    0,  627,  621,    0,  623,    0,    0,    0,    0,
			  625,    0,  624,  624,  626,  626,    0,  627,  623,    0,
			    0,    0,  623,  625,  625,  632,  625,    0,  626,  624,
			  626,  627,    0,  627,    0,    0,    0,    0,  625,    0,
			  632,    0,  626,  626,    0,  627,  628,  628,  628,  628,
			  628,  625,    0,    0,  632,  625,  632,  633,    0,  626,
			  634,    0,  627,    0,  628,  635,    0,  628,  632,  646,
			    0,  646,  633,    0,  634,  634,  654,  646,  654,  650,

			  635,  650,  654,    0,  633,  632,  633,  650,  633,  634,
			    0,  634,  628,    0,  635,  628,  635,  646,    0,  646,
			  633,    0,  634,  634,  654,  646,  654,  650,  635,  650,
			  654,    0,  633,    0,    0,  650,    0,  633,    0,    0,
			  634,    0,    0,    0,  642,  635,  642,  642,  642,  642,
			  642,  642,  644,    0,  644,  644,  644,  644,  644,  644,
			  645,    0,  645,  645,  645,  645,  645,  652,  652,  652,
			  652,  652,  653,  653,  653,  653,  653,  655,  652,  656,
			    0,    0,  642,  655,    0,  656,  655,    0,    0,    0,
			  644,    0,    0,  657,  657,  657,  657,  657,  658,  658,

			  658,  658,  658,  660,    0,  655,  652,  656,  657,  660,
			  660,  655,    0,  656,  655,  659,  659,  659,  659,  659,
			  658,  661,  662,    0,  662,    0,    0,  661,  662,    0,
			    0,  660,    0,    0,    0,  661,  657,  660,  660,  663,
			  663,  663,  663,  663,    0,    0,    0,    0,  658,  661,
			  662,    0,  662,    0,    0,  661,  662,  664,  664,  664,
			  664,  664,  665,  661,    0,  667,  663,  667,  665,  668,
			  668,  667,  664,    0,    0,  668,  665,    0,  666,  666,
			  666,  666,  666,  675,  675,  675,  675,  675,    0,    0,
			  665,    0,    0,  667,  663,  667,  665,  668,  668,  667,

			  664,    0,    0,  668,  665,  666,  669,  669,  669,  669,
			  669,  670,  670,  670,  670,  670,  671,  672,  673,    0,
			    0,  669,  671,  672,  673,  670,  674,  674,  691,    0,
			  672,    0,  674,  666,    0,  676,  676,  676,  676,  676,
			    0,    0,    0,  691,  671,  672,  673,    0,    0,  669,
			  671,  672,  673,  670,  674,  674,    0,  691,  672,  691,
			  674,  676,  677,  677,  677,  677,  677,  679,    0,  679,
			    0,  691,  679,  679,  679,  679,  679,  680,  680,  680,
			  680,  680,  681,  681,  681,  681,  681,    0,  691,  676,
			  683,  683,  683,  683,  683,  685,  685,  685,  685,  685,

			  686,  686,  686,  686,  686,  687,  687,  687,  687,  687,
			  689,  690,    0,    0,    0,  680,  692,    0,    0,    0,
			  687,  693,    0,    0,    0,  689,  690,    0,    0,    0,
			  692,  692,  690,    0,    0,    0,  693,  689,    0,  689,
			  690,  689,  690,  687,    0,  692,  695,  692,  687,    0,
			  693,  696,  693,  689,  690,    0,  710,  697,  692,  692,
			  690,  695,  710,    0,  693,  689,  696,    0,    0,  710,
			  689,  690,  697,    0,    0,  695,  692,  695,  698,    0,
			  696,  693,  696,  699,  710,  713,  697,  701,  697,  695,
			  710,  713,    0,  698,  696,    0,    0,  710,  699,    0, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  697,  698,  701,  701,    0,  702,  695,  698,    0,  698,
			    0,  696,  699,  713,  699,    0,  701,  697,  701,  713,
			  702,  698,    0,    0,  702,  703,  699,    0,    0,  698,
			  701,  701,    0,    0,  702,    0,  702,    0,  698,  711,
			  703,  703,    0,  699,    0,  711,  711,  701,  702,    0,
			    0,    0,  702,    0,  703,  709,  703,  709,  709,  709,
			  709,  709,    0,    0,  714,  702,  717,  711,  703,  703,
			  714,    0,  717,  711,  711,  712,  712,  712,  712,  712,
			  715,  715,  715,  715,  715,  703,  716,  716,  716,  716,
			  716,  718,  714,  709,  717,  712,  719,  718,  714,  716,

			  717,    0,  719,  720,  720,  720,  720,  720,  721,  721,
			  721,  721,  721,    0,  722,    0,  725,    0,    0,  718,
			  722,    0,  725,  712,  719,  718,    0,  716,    0,    0,
			  719,  723,  723,  723,  723,  723,    0,  724,    0,    0,
			    0,    0,  722,  724,  725,    0,  724,    0,  722,    0,
			  725,  726,  726,  726,  726,  726,  727,  727,  727,  727,
			  727,  728,    0,  728,  729,  724,  730,  728,  730,  729,
			  729,  724,  730,  726,  724,  731,  731,  731,  731,  731,
			  732,  732,  732,  732,  732,    0,    0,    0,    0,  728,
			  731,  728,  729,    0,  730,  728,  730,  729,  729,    0,

			  730,  726,  733,  733,  733,  733,  733,  734,  734,  734,
			  734,  734,    0,    0,  735,    0,  735,    0,  731,  735,
			  735,  735,  735,  735,  737,  737,  737,  737,  737,  739,
			  739,  739,  739,  739,  741,  742,    0,    0,    0,  745,
			    0,    0,  743,    0,  739,    0,  756,    0,  741,  741,
			  742,    0,  756,  745,  745,  742,    0,  743,  743,    0,
			  747,    0,    0,  741,  742,  741,  742,  739,  745,  749,
			  745,  743,  739,  743,  756,  747,  741,  741,  742,    0,
			  756,  745,  745,  742,  749,  743,  743,    0,    0,  747,
			  748,  747,    0,    0,  741,  742,    0,    0,  749,  745,

			  749,    0,  743,  747,  757,  748,  748,    0,  761,  759,
			  757,  759,  749,    0,  761,  759,    0,    0,    0,  748,
			  747,  748,  758,  758,  758,  758,  758,    0,    0,  749,
			    0,    0,  757,  748,  748,    0,  761,  759,  757,  759,
			    0,  758,  761,  759,  760,  760,  760,  760,  760,    0,
			  748,  762,  762,  762,  762,  762,  763,  763,    0,  760,
			  765,  764,  763,  764,  762,    0,  765,  764,    0,  758,
			    0,    0,  766,  766,  766,  766,  766,  768,  768,  768,
			  768,  768,    0,    0,  763,  763,  766,  760,  765,  764,
			  763,  764,  762,    0,  765,  764,  769,  769,  769,  769,

			  769,  770,  770,  770,  770,  770,  771,  771,  771,  771,
			  771,    0,    0,    0,  766,  772,  772,  772,  772,  772,
			  773,  773,  773,  773,  773,  775,  775,  775,  775,  775,
			  777,  778,    0,    0,  769,  779,  780,    0,    0,    0,
			  775,  782,    0,    0,    0,  777,  778,    0,    0,  777,
			  779,  780,  780,    0,  783,    0,  782,    0,    0,  777,
			  778,  777,  778,  775,  779,  780,  779,  780,  775,  783,
			  782,    0,  782,  777,  778,    0,  789,  777,  779,  780,
			  780,  789,  789,  783,  782,  783,    0,  790,  778,    0,
			  777,  778,    0,  790,  792,  779,  780,  783,    0,    0,

			  792,  782,  790,    0,  789,    0,  794,  796,  794,  789,
			  789,  783,  794,  796,  783,  790,  791,  791,  791,  791,
			  791,  790,  792,  793,  793,  793,  793,  793,  792,    0,
			  790,    0,    0,    0,  794,  796,  794,  797,    0,    0,
			  794,  796,    0,  797,  791,  795,  795,  795,  795,  795,
			    0,    0,  797,  798,  798,  798,  798,  798,    0,    0,
			  795,    0,    0,    0,    0,  797,  799,  799,  799,  799,
			  799,  797,  791,  801,  801,  801,  801,  801,    0,    0,
			  797,    0,    0,    0,  802,  805,  802,    0,  795,  802,
			  802,  802,  802,  802,  803,  803,  803,  803,  803,    0,

			  805,  805,    0,  806,  799,  821,  821,  821,  821,  821,
			  807,  808,    0,    0,  805,    0,  805,    0,  806,    0,
			    0,  814,  802,  814,  815,  807,  808,  814,  805,  805,
			  815,    0,  806,    0,  806,    0,  806,    0,  807,  807,
			  808,  807,  808,  815,  808,  805,  806,    0,    0,  814,
			    0,  814,  815,  807,  808,  814,    0,    0,  815,    0,
			    0,    0,    0,  806,    0,  806,  807,    0,    0,    0,
			  807,  808,  815,  808,  816,  816,  816,  816,  816,  817,
			    0,  824,    0,    0,    0,  817,  825,  818,  818,  818,
			  818,  818,  819,  817,  826,    0,  824,    0,  819,    0,

			    0,  825,  832,    0,    0,    0,  816,  817,  832,  826,
			  824,  819,  824,  817,  818,  825,  831,  825,  827,    0,
			  819,  817,  831,  826,  824,  826,  819,    0,    0,  825,
			  832,  831,    0,  827,    0,  816,  832,  826,  824,  834,
			  819,  824,  818,  827,  831,  834,  825,  827,    0,  827,
			  831,    0,    0,    0,  826,    0,    0,    0,    0,  831,
			    0,  827,  833,  833,  833,  833,  833,  834,    0,    0,
			    0,  827,    0,  834,    0,    0,    0,  841,  827,  835,
			  835,  835,  835,  835,  836,  837,  837,  837,  837,  837,
			  836,    0,  841,    0,    0,  836,  838,  838,  838,  838,

			  838,  840,  840,  840,  840,  840,  841,  846,  841,  842,
			  841,    0,  836,  846,    0,  847,    0,  847,  836,    0,
			  841,  847,    0,  836,  842,  842,  846,    0,    0,    0,
			  856,    0,    0,    0,    0,  846,  856,  841,  842,  841,
			  842,  846,  866,  847,  866,  847,    0,    0,  866,  847,
			  850,  851,  842,  842,  849,  846,  849,  849,  856,  849,
			  849,  849,  849,  849,  856,  850,  851,  855,    0,  842,
			  866,    0,  866,  855,    0,  850,  866,    0,  855,  850,
			  851,  850,  851,  857,  857,  857,  857,  857,  860,  860,
			  860,  860,  860,  850,  851,  855,  862,  862,  862,  862,

			  862,  855,    0,  850,  863,    0,  855,    0,    0,    0,
			  850,  851,  867,  867,  867,  867,  867,    0,    0,  863,
			  863,  868,  868,  868,  868,  868,  869,  869,  869,  869,
			  869,  873,    0,  863,    0,  863,  870,  870,  870,  870,
			  870,    0,    0,    0,  876,  860,  873,  863,  863,  872,
			  876,  872,  872,    0,  872,  872,  872,  872,  872,    0,
			  873,    0,  873,    0,  863,  877,  877,  877,  877,  877,
			    0,    0,  876,    0,  873,    0,    0,    0,  876,  879,
			  879,  879,  879,  879,  882,  882,  882,  882,  882,    0,
			    0,  873,  883,  883,  883,  883,  883,  886,    0,  886, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  886,  886,  886,  886,  886,  889,  889,  889,
			  889,  889,  890,  890,  890,  890,  890,  893,  893,  893,
			  893,  893,  897,  897,  897,  897,  897,  898,  898,  898,
			  898,  898,  899,  899,  899,  899,  899,  901,  901,  901,
			  901,  901,  902,    0,  902,    0,    0,  902,  902,  902,
			  902,  902,  903,  903,  903,  903,  903,  904,  904,  904,
			  904,  904,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  902,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,

			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  909,  909,    0,  909,  909,  909,  909,  909,

			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,    0,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  910,
			  910,    0,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  912,  943,  943,  943,
			  943,  943,  943,  943,  943,  943,    0,    0,    0,    0,
			    0,    0,    0,    0,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  913,  913,  913,    0,    0,    0,    0,

			    0,    0,  913,  913,    0,  913,    0,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,    0,    0,    0,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  914,  914,
			    0,  914,    0,  914,  914,    0,    0,    0,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,    0,    0,    0,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  915,
			  915,    0,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  916,  916,    0,  916,

			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,    0,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,

			  918,  918,  918,  918,  918,  918,  918,  919,    0,  919,
			    0,    0,    0,    0,  919,    0,  919,  919,    0,    0,
			    0,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			    0,    0,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,

			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  922,  922,    0,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  923,    0,    0,    0,  923,  923,    0,
			    0,    0,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,    0,    0,    0,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,

			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  925,  925,  925,    0,    0,    0,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,    0,    0,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  926,    0,    0,
			  926,  926,    0,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,    0,    0,    0,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  928,    0,  928,    0,
			  928,    0,    0,  928,  928,  928,  928,  928,    0,    0,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,

			    0,    0,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			    0,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  930,  930,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  930,  931,  931,  931,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  931,  931,

			  931,  931,  931,  931,  931,  931,  931,  931,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  931,  932,  932,    0,    0,    0,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,    0,    0,    0,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  933,  933,    0,
			    0,    0,  933,  933,  933,  933,  933,  933,  933,  933,
			  933,    0,    0,    0,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  934,  934,  934,    0,    0,    0,  934,
			  934,  934,  934,  934,  934,  934,  934,  934,  934,    0,
			    0,  934,  934,  934,  934,  934,  934,  934,  934,  934, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  936,  936,  936,
			  936,  936,  936,  936,  936,  936,    0,    0,    0,  936,
			  936,  936,  936,  936,  936,  936,  936,  936,  937,    0,
			  937,    0,    0,    0,    0,  937,    0,  937,  937,    0,
			    0,    0,  937,  937,  937,  937,  937,  937,  937,  937,
			  937,    0,    0,    0,  937,  937,  937,  937,  937,  937,
			  937,  937,  937,  938,  938,  938,    0,    0,  938,  938,

			  938,  938,  938,  938,  938,  938,    0,    0,  938,  938,
			  938,  938,  938,  938,  938,  938,  938,    0,    0,    0,
			  938,  938,  938,  938,  938,  938,  938,  938,  938,  939,
			  939,  939,  939,  939,  939,  939,  939,  939,    0,    0,
			    0,  939,  939,  939,  939,  939,  939,  939,  939,  939,
			  940,  940,    0,    0,    0,  940,  940,  940,  940,  940,
			  940,  940,  940,  940,    0,    0,    0,  940,  940,  940,
			  940,  940,  940,  940,  940,  940,  941,    0,  941,    0,
			    0,    0,    0,  941,    0,  941,  941,    0,    0,    0,
			  941,  941,  941,  941,  941,  941,  941,  941,  941,    0,

			    0,  941,  941,  941,  941,  941,  941,  941,  941,  941,
			  941,  942,  942,    0,    0,    0,  942,  942,  942,  942,
			  942,  942,  942,  942,  942,    0,    0,    0,  942,  942,
			  942,  942,  942,  942,  942,  942,  942,  944,  944,  944,
			  944,  944,  944,  944,  944,  944,    0,    0,    0,  944,
			  944,  944,  944,  944,  944,  944,  944,  944,  945,    0,
			    0,    0,  945,  945,    0,    0,    0,  945,  945,  945,
			  945,  945,  945,  945,  945,  945,    0,    0,    0,  945,
			  945,  945,  945,  945,  945,  945,  945,  945,  946,  946,
			    0,    0,    0,  946,  946,  946,  946,  946,  946,  946,

			  946,  946,    0,    0,    0,  946,  946,  946,  946,  946,
			  946,  946,  946,  946,  947,  947,    0,    0,    0,  947,
			  947,  947,  947,  947,  947,  947,  947,  947,    0,    0,
			    0,  947,  947,  947,  947,  947,  947,  947,  947,  947,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905, yy_Dummy>>,
			1, 432, 7000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,  185,    0,   67,
			   71, 1192, 7340,   98, 1188, 1161, 1177, 7340,   90,    0,
			 7340, 7340, 7340, 7340, 1160,   88, 1128,   98,  118, 7340,
			 7340, 1114, 7340, 1112, 7340,  275,  279,  285,  119,  296,
			  291,  300,  328,  347,  352,  356,  427,  389,  415,  381,
			  377,   48, 7340, 7340, 1073,  505,  431,  556,  555,  593,
			  606,  422,  609,   94,  104,  629,  655,  652,  250,  306,
			 1109, 7340, 7340, 1104,  153, 7340,  118,  285,  279,  304,
			  322,  396,  382, 7340,  388,  450, 7340,  408, 1104,  506,
			  602, 7340,   84,  726, 7340,  160, 1098, 7340, 1071, 7340,

			 1062,    0,  725, 1057, 1056, 1039,  761, 7340,   98,  579,
			  767,  791,  590,  686, 7340, 7340,  493,  816,    0,  821,
			  840,  856,  871,  887,  912,  927,  942,  946,  972,  988,
			 1003, 1018, 1035, 1051, 1067, 1083, 1107,  970, 1154, 1132,
			 1149, 1216,   79,  102, 1179,  908, 1236, 1083, 1242, 1249,
			 1025,  415,  262,  991, 7340,  165, 1031,    0, 1255, 1018,
			 1301, 1320, 1329,   95, 1064, 1344, 1043,  831, 1358, 1382,
			  902, 1404, 1420, 1420, 1432, 1464, 1480, 1486, 1503,  652,
			  854, 1508, 1529,  620,  717, 1418,  803, 1142, 1534, 1559,
			 1564, 1337, 1545, 1556, 1576,  965, 1157, 1592, 1606, 1290,

			 1273, 1613, 1621, 1182, 1616, 1639, 1651, 1648, 1679, 1434,
			 1668, 7340, 1020, 7340,  322, 7340, 7340, 1637,  447,  502,
			  629,  823,  461, 7340,  969,  670,  737,  956,  847,  946,
			 7340,  414, 1122, 7340,  991, 1717,  407, 1771,  421,  256,
			 1861, 7340, 7340,  965,  793, 7340, 7340, 7340,  971, 1715,
			  961,  951,  925,  902,  600,  728, 7340, 1895, 1735,  730,
			  882,  232, 1587, 1901, 1745, 1862,  783, 1724, 7340,    0,
			    0,  870,  857, 1907, 1913, 1912, 1933, 1932, 1953, 1971,
			 1974, 1979, 1997, 2021, 1008, 2027, 2030, 2054, 2063, 2067,
			 2086, 2093, 7340, 1849, 2129, 2147, 2154, 2191, 2198, 2235,

			 2137, 2224, 2162, 2216, 1198, 2254, 2255, 2273, 2281, 2291,
			 2311, 2329, 2330,  852, 2169, 2363, 7340,  420,  853, 2168,
			 2023, 1904,  783,  775,  453, 2377, 2382, 2398, 2403, 2279,
			 2408, 2400, 2403, 2432, 2451, 2424, 2443, 2453, 2495, 2485,
			 2512, 2490, 2488, 2519, 2540, 2548, 2535, 2543, 2024, 2585,
			 2592, 2305, 2598, 2562, 2613, 2591, 2606, 2626, 2641, 2638,
			 2639, 2665, 2674, 2677, 2678, 2682, 2706, 2734, 2739, 2651,
			 2744, 2737, 2751, 1010,  311, 1018,  853, 1077, 1256, 1285,
			  291, 7340,  779,  826, 2779, 7340,  514, 1180,  822, 1405,
			 7340, 7340, 2790, 7340, 7340, 7340, 7340, 7340,  821, 2770,

			 2799, 2804,  742,  755, 2816, 2821, 2831, 2838, 2843, 2848,
			 2865, 2853, 2870,  791,  323,    0,  765, 2861, 2862, 2880,
			 2881, 2884, 2902, 2934, 2938, 2939, 2960,  799, 2959, 2986,
			 3008, 3009, 3018, 3043, 3061, 3078, 3089, 3088, 3122, 3151,
			 3157, 3009, 3172, 3188, 3201, 3219, 3183, 3210, 1948, 3237,
			 3242, 3245, 3263, 3267,  434, 3314, 3327, 3335,  563,    0,
			 3088, 3328, 3351, 3342, 3364, 3376, 3369, 3396, 2680, 2936,
			 3401, 3411, 2681, 2900, 3406, 3427, 3436, 3441, 3098, 3167,
			 3455, 3012, 3447, 3455, 3480, 3506, 3454, 3511, 3504, 3505,
			 3536, 3565, 3235, 3503, 3570, 3575, 3567, 3506, 3570, 3597,

			 3602, 3610, 3630, 7340, 3635, 3645, 3658, 3665,  770, 3674,
			 3679, 3684, 3690, 3695, 3700,  723, 3705, 3723,  963,  576,
			    0,    0, 3714, 3715, 3720, 3738, 3741, 3747, 3771, 3777,
			 3795,  703, 3803, 3782, 3821, 3841, 3851, 3845, 7340,  408,
			 3895, 3887, 3918, 3930, 3940, 3947, 1419, 3960, 3963, 3983,
			 3984, 1654,  632,  961, 1027, 4027, 7340,  878, 4046, 1154,
			  621,  602, 3513, 3574, 4054, 4061, 4067, 4072, 4064, 4084,
			 3717, 4078, 4100, 4112, 4104, 4115, 4135, 4163, 3609, 4128,
			 4179, 4172, 4175, 3746, 4195, 4200, 4192, 4225, 4211, 4228,
			 4253, 4259, 4251, 4263, 4254, 3953, 4284, 4311,  589, 4316,

			 4330, 4321, 4337, 4342, 4347,  585, 4355, 4367, 4376, 1523,
			 7340, 4381,    0,  624, 4375, 4374, 4398, 4393, 4416, 4439,
			 4440, 4446, 1284, 4465, 4472, 4498, 4502, 4505, 4548, 7340,
			  687,  596, 4528, 4560, 4563, 4568, 1899, 1979, 3186,  662,
			 7340, 7340, 4628, 1148, 4636, 4644, 4560,  589, 3829, 4447,
			 4570, 4443, 4649, 4654, 4565, 4646, 4648, 4675, 4680, 4697,
			 4672, 4690, 4691, 4721, 4739, 4731, 4760, 4734, 4738, 4788,
			 4793, 4785, 4786, 4787, 4795, 4765, 4817, 4844,  574, 4854,
			 4859, 4864,  885, 4872,  514, 4877, 4882, 4887,  496, 4893,
			 4894, 4811, 4899, 4904, 1384, 4929, 4934, 4940, 4961, 4966,

			 1418, 4970, 4988, 5008,  442,  428,  396,  383,    0, 5039,
			 4925, 5008, 5057, 4954, 5033, 5062, 5068, 5035, 5060, 5065,
			 5085, 5090, 5083, 5113, 5106, 5085, 5133, 5138, 5130, 5133,
			 5135, 5157, 5162, 5184, 5189, 5201, 1100, 5206, 1701, 5211,
			    0, 5217, 5218, 5225, 7340, 5222, 1543, 5243, 5273, 5252,
			 2217, 2450, 2518, 3153,  367,  349, 5215, 5273, 5304, 5278,
			 5326, 5277, 5333, 5325, 5330, 5329, 5354,  272, 5359, 5378,
			 5383, 5388, 5397, 5402, 7340, 5407,    0, 5413, 5414, 5418,
			 5419, 7340, 5424, 5437, 3461, 3843, 3950, 4130, 1203, 5445,
			 5456, 5498, 5463, 5505, 5475, 5527, 5476, 5506, 5535, 5548,

			  271, 5555, 5571, 5576,  469, 5568, 5586, 5593, 5594,  648,
			 7340,  993,  290, 7340, 5590, 5593, 5656, 5648, 5669, 5661,
			  482, 5587,    0,  219, 5664, 5669, 5677, 5701, 1251, 1972,
			 2430, 5685, 5671, 5744, 5708, 5761, 5753, 5767, 5778,  543,
			 5783, 5760, 5792, 2088, 2281, 2974, 5776, 5784, 1380, 5841,
			 5833, 5834,  149,  145,  966, 5836, 5799, 5865, 1644, 7340,
			 5870,   87, 5878, 5887, 2886, 3360, 5811, 5894, 5903, 5908,
			 5918,   89, 5936, 5914, 3989, 4122, 5913, 5947, 1487, 5961,
			  123,  103, 5966, 5974, 1854, 7340, 5984, 2755, 2915, 5989,
			 5994, 3139, 3279, 5999, 2340, 7340, 7340, 6004, 6009, 6014,

			 7340, 6019, 6029, 6034, 6039, 7340, 6080, 6117, 6154, 6191,
			 6228, 6046, 6256, 6291, 6322, 6358, 6395, 6432, 6469, 6505,
			 6541, 6578, 6615, 6646, 6682, 6710, 6739, 6043, 6774, 6810,
			 6847, 6883, 6910, 6936, 6963, 6999, 7021, 7056, 7092, 7113,
			 7139, 7174, 7200, 6251, 7221, 7251, 7277, 7303, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  905,    1,  906,  906,  907,  907,  905,    7,  908,
			  908,  905,  905,  905,  905,  905,  909,  905,  910,  911,
			  905,  905,  905,  905,  905,  905,  912,  905,  905,  905,
			  905,  905,  905,  905,  905,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  914,  905,  905,  915,  905,   55,   55,   55,   55,
			   55,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			  905,  905,  905,  916,  905,  905,  905,  916,  916,  916,
			  916,  916,  917,  905,  918,  917,  905,  919,  905,  919,
			  919,  905,  920,  921,  905,  905,  905,  905,  909,  905,

			  922,  922,  922,  923,  924,  905,  905,  905,  925,  905,
			  905,  905,  905,  905,  905,  905,  905,  913,  926,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  905,   46,  913,
			  913,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  914,  914,  914,  915,  905,  905,  905,  927,  928,  905,
			  928,  928,  928,  905,   60,   60,  165,  165,  165,  928,
			  165,  928,  928,  165,  165,  928,  928,  165,  165,  176,
			  176,  165,  165,  176,  165,  176,  176,  176,  165,  165,
			  165,  176,  165,  176,  165,  176,  176,  165,  165,  176,

			  176,  165,  165,  176,  176,  165,  165,  176,  165,  176,
			  165,  905,  916,  905,  905,  905,  905,  916,  916,  916,
			  916,  916,  917,  905,  929,  917,  918,  930,  918,  929,
			  905,  919,  919,  905,  905,  905,  905,  905,  905,  920,
			  921,  905,  905,  240,  931,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  912,  905,  905,  905,  905,  905,  905,  905,  905,  932,
			  933,  905,  926,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  905,  140,  140,  140,  140,  140,
			  140,  140,  905,  905,  933,  140,  140,  140,  140,  140,

			  141,  141,  141,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  905,  914,  914,  905,  934,  905,  176,
			  176,  176,  905,  905,  905,  176,  165,  165,  165,  176,
			  165,  176,  176,  165,  165,  176,  176,  176,  165,  165,
			  165,  176,  176,  165,  165,  905,  176,  176,  176,  165,
			  165,  176,  165,  176,  165,  176,  176,  165,  165,  176,
			  176,  165,  165,  176,  176,  176,  165,  165,  165,  176,
			  165,  176,  165,  916,  916,  916,  916,  916,  916,  916,
			  929,  905,  930,  935,  935,  905,  935,  935,  935,  931,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  932,  933,  936,  926,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  905,  140,  140,
			  140,  140,  140,  140,  905,  933,  138,  141,  436,  436,
			  140,  138,  905,  933,  140,  140,  140,  140,  905,  140,
			  140,  140,  140,  140,  937,  914,  914,  914,  905,  938,
			  176,  176,  905,  933,  165,  165,  176,  165,  176,  176,
			  165,  165,  176,  176,  176,  165,  165,  165,  176,  176,
			  165,  176,  176,  176,  165,  165,  176,  165,  176,  176,
			  165,  165,  176,  176,  165,  165,  176,  176,  176,  165,

			  165,  176,  165,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  939,  940,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  905,  140,  140,  140,  140,  140,  140,  905,  933,
			  140,  140,  905,  933,  436,  544,  905,  140,  140,  140,
			  140,  932,  905,  941,  937,  914,  905,  905,  914,  905,
			  905,  905,  176,  176,  905,  933,  165,  165,  176,  165,
			  176,  176,  165,  165,  176,  176,  165,  165,  176,  176,
			  165,  176,  176,  176,  165,  165,  176,  165,  176,  176,
			  165,  165,  176,  176,  176,  176,  165,  165,  905,  905,

			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  942,  940,  140,  140,  140,  140,  140,  140,
			  140,  140,  905,  140,  140,  140,  140,  140,  436,  905,
			  933,  905,  140,  140,  140,  140,  905,  932,  932,  941,
			  905,  905,  914,  905,  914,  905,  176,  905,  176,  165,
			  176,  176,  165,  165,  176,  176,  176,  165,  165,  165,
			  176,  176,  176,  165,  165,  176,  165,  176,  176,  165,
			  165,  176,  176,  176,  176,  165,  165,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  942,  140,
			  140,  140,  140,  140,  905,  140,  140,  140,  140,  140,

			  905,  140,  140,  140,  905,  905,  932,  932,  943,  905,
			  176,  176,  165,  176,  176,  165,  165,  176,  176,  176,
			  165,  165,  176,  165,  176,  176,  165,  165,  176,  176,
			  176,  165,  905,  905,  905,  905,  905,  905,  905,  905,
			  944,  140,  140,  140,  905,  140,  905,  140,  140,  140,
			  905,  905,  939,  939,  945,  905,  176,  176,  165,  176,
			  165,  176,  165,  176,  176,  176,  165,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  946,  140,  140,  140,
			  140,  905,  140,  140,  905,  905,  942,  942,  905,  176,
			  176,  165,  176,  165,  176,  165,  176,  176,  165,  905,

			  905,  905,  905,  905,  946,  140,  140,  140,  140,  905,
			  905,  942,  942,  905,  176,  176,  165,  176,  165,  176,
			  905,  905,  947,  905,  140,  140,  140,  140,  905,  905,
			  942,  176,  176,  165,  176,  165,  176,  905,  905,  947,
			  905,  140,  140,  905,  905,  942,  176,  176,  905,  905,
			  140,  140,  905,  905,  942,  176,  176,  905,  905,  905,
			  905,  905,  905,  140,  905,  905,  176,  905,  905,  905,
			  905,  905,  905,  140,  905,  905,  176,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,  905,  905,  905,    0,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905, yy_Dummy>>)
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
			    0,    0,    0,    0,  107,    0,    0,    0,   99,    0,
			   99,   99,   99,    0,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   39,   99,   39,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  102,  120,  122,  121,  118,  117,  119,  120,  120,
			  120,  120,  103,  106,    0,  103,    0,    0,    0,  104,
			  105,    0,    0,   70,   68,    0,   67,    0,   66,    0,
			    0,   95,   93,   93,    0,   94,  130,  124,  130,  130,
			  130,  130,  130,  130,    0,    4,   33,  114,    0,    0,
			    0,    0,    0,  110,    0,  108,    0,    0,   90,    0,
			    0,    0,    0,   96,   96,   38,   96,   96,   96,   96,
			   96,   96,   96,   96,    0,   96,   96,   96,   96,   41,
			   96,   96,   88,    0,    0,   81,   82,   81,   81,   81,

			   89,   96,   89,   89,   89,   96,   96,   96,   96,   96,
			   96,   40,   96,    0,    0,    0,   98,  101,    0,   99,
			   99,   38,    0,    0,    0,   71,   99,   99,   38,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,    0,   99,   99,   99,   99,
			   99,   99,   99,   41,   41,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   40,
			   40,   99,   99,  120,  120,  120,  120,  120,  120,  120,
			    0,  104,  105,    0,    0,   69,   67,   66,   70,    0,
			  128,  131,  131,  129,  125,  126,  127,   91,  114,    0,

			  114,    0,    0,    0,    0,  110,    0,    0,    0,  113,
			  108,    0,    0,    0,    0,    0,   97,   96,   96,   96,
			   96,   96,   37,   96,   96,   96,   96,    0,   96,   96,
			   96,   96,   96,   96,    0,    0,   96,   80,   96,   96,
			   96,   96,    0,    0,   80,   80,   80,   36,    0,   43,
			   96,   96,   96,   96,   65,    0,    0,    0,    0,   61,
			   99,   99,    0,    0,   99,   99,   99,   99,   99,   99,
			   99,   99,   37,   99,   99,   37,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   36,   43,   36,   43,   99,   99,   99,   99,

			   99,   99,   99,  105,  114,    0,    0,    0,  109,  110,
			    0,  111,    0,  113,    0,    0,    0,  108,   77,    0,
			    0,    0,   58,   96,   96,   96,   96,   96,   96,   44,
			   96,    0,   96,   96,   35,   96,   96,   96,   82,   82,
			   82,   81,    0,    0,   96,   96,    0,   96,   96,   96,
			   96,    0,   65,   65,    0,    0,   64,    0,    0,   64,
			    0,    0,   58,   99,    0,   71,   58,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   44,   99,
			   44,   99,   99,   35,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,  114,    0,

			    0,  110,  111,    0,    0,  113,    0,    0,    0,    0,
			   77,    0,    0,    0,   96,   59,   96,   60,   96,   96,
			   46,   96,    0,   96,   96,   96,   96,   96,   96,   80,
			   80,    0,   52,   96,   96,   96,    0,    0,    0,    0,
			   63,   62,    0,    0,    0,    0,   99,    0,   59,   59,
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

	yyJam_base: INTEGER = 7340
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 905
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 906
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
