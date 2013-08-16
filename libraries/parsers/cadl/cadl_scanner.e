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
if yy_act <= 26 then
if yy_act <= 22 then
if yy_act <= 20 then
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
last_token := Question_mark_code
end
else
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := SYM_INTERVAL_DELIM
end
else
if yy_act = 21 then
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Left_bracket_code
else
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Right_bracket_code
end
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := SYM_START_CBLOCK
else
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := SYM_END_CBLOCK
end
else
if yy_act = 25 then
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := SYM_GE
else
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := SYM_LE
end
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 108 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 108")
end
last_token := SYM_NE
else
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := SYM_LT
end
else
if yy_act = 29 then
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := SYM_GT
else
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_MODULO
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 114 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 114")
end
last_token := SYM_DIV
else
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := SYM_ELLIPSIS
end
else
if yy_act = 33 then
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
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
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_MATCHES
else
--|#line 127 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 127")
end
last_token := SYM_THEN
end
else
--|#line 129 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 129")
end
last_token := SYM_ELSE
end
else
if yy_act = 38 then
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_AND
else
--|#line 133 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 133")
end
last_token := SYM_OR
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 135 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 135")
end
last_token := SYM_XOR
else
--|#line 137 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 137")
end
last_token := SYM_NOT
end
else
if yy_act = 42 then
--|#line 139 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 139")
end
last_token := SYM_IMPLIES
else
--|#line 141 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 141")
end
last_token := SYM_TRUE
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 143 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 143")
end
last_token := SYM_FALSE
else
--|#line 145 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 145")
end
last_token := SYM_FORALL
end
else
if yy_act = 46 then
--|#line 147 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 147")
end
last_token := SYM_EXISTS
else
--|#line 151 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 151")
end
last_token := SYM_EXISTENCE
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 153 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 153")
end
last_token := SYM_OCCURRENCES
else
--|#line 155 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 155")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 50 then
--|#line 157 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 157")
end
last_token := SYM_ORDERED
else
--|#line 159 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 159")
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
--|#line 161 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 161")
end
last_token := SYM_UNIQUE
else
--|#line 163 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 163")
end
last_token := SYM_USE_NODE
end
else
if yy_act = 54 then
--|#line 165 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 165")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 167 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 167")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 169 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 169")
end
last_token := SYM_INCLUDE
else
--|#line 171 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 171")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 58 then
--|#line 173 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 173")
end
last_token := SYM_AFTER
else
--|#line 175 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 175")
end
last_token := SYM_BEFORE
end
end
end
else
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 177 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 177")
end
last_token := SYM_CLOSED
else
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end

	last_token := V_URI
	last_string_value := text

end
else
if yy_act = 62 then
--|#line 186 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 186")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 191 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 191")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 65 then
if yy_act = 64 then
--|#line 198 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 198")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 214 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 214")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
end
else
if yy_act = 66 then
--|#line 222 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 222")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
else
--|#line 229 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 229")
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
--|#line 236 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 236")
end
in_lineno := in_lineno + text_count
else
--|#line 239 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 239")
end
in_lineno := in_lineno + 1
end
else
--|#line 241 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 241")
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
--|#line 262 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 262")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 268 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 268")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 275 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 275")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 276 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 276")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 75 then
--|#line 277 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 277")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 284 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 284")
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
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 292 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 292")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 79 then
--|#line 293 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 293")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 300 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 300")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 82 then
if yy_act = 81 then
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 308 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 308")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 83 then
--|#line 320 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 320")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 330 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 330")
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
--|#line 335 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 335")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 345 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 345")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 87 then
--|#line 351 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 351")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 361 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 361")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 90 then
if yy_act = 89 then
--|#line 362 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 362")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 376 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 376")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 91 then
--|#line 383 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 383")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 389 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 389")
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
--|#line 395 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 395")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 399 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 399")
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
							if attached {C_DOMAIN_TYPE} odin_parser.output.as_object(tid, Void) as cdt then
								c_domain_type := cdt
								last_token := V_C_DOMAIN_TYPE
							else
								odin_parser_error.add_error (ec_VDTCV, <<odin_parser.output.im_type_name>>, "")
								last_token := ERR_C_DOMAIN_TYPE
							end
						else
							odin_parser_error.add_error (ec_VDTTU, <<odin_parser.output.im_type_name>>, "")
							last_token := ERR_C_DOMAIN_TYPE
						end
					else
						odin_parser_error.add_error (ec_VDTNT, Void, "")
						last_token := ERR_C_DOMAIN_TYPE
					end
				else
					odin_parser_error.append (odin_parser.errors)
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
end
else
if yy_act = 95 then
--|#line 441 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 441")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 447 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 447")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 98 then
if yy_act = 97 then
--|#line 453 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 453")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 459 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 459")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 99 then
--|#line 466 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 466")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 472 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 472")
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
--|#line 478 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 478")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_REL_PATH
				last_string_value := text
			
else
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 491 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 491")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 104 then
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 107 then
if yy_act = 106 then
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
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
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 108 then
--|#line 522 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 522")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
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
--|#line 542 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 542")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 112 then
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
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
			
end
end
else
if yy_act <= 115 then
if yy_act = 114 then
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
			
else
--|#line 569 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 569")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 116 then
--|#line 574 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 574")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
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
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
end
in_buffer.append_character ('"')
else
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 120 then
--|#line 590 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 590")
end
in_buffer.append_string (text)
else
--|#line 592 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 592")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 123 then
if yy_act = 122 then
--|#line 597 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 597")
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
--|#line 608 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 608")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 124 then
--|#line 617 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 617")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 619 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 619")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 129 then
if yy_act <= 127 then
if yy_act = 126 then
--|#line 620 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 620")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 621 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 621")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 128 then
--|#line 622 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 622")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 623 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 623")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 131 then
if yy_act = 130 then
--|#line 625 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 625")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 626 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 626")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 132 then
--|#line 630 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 630")
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
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5352)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   12,   13,   14,   13,   13,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   27,
			   27,   28,   28,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   38,   41,   42,   38,
			   43,   44,   45,   46,   38,   38,   38,   47,   48,   38,
			   49,   50,   38,   51,   52,   53,   54,   12,   55,   56,
			   57,   58,   59,   60,   58,   61,   62,   58,   63,   64,
			   65,   58,   58,   58,   58,   66,   67,   58,   58,   68,
			   69,   70,   71,   72,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   74,   83,   93,   83,   75,   74,   93,

			  101,   95,   75,   95,   95,  105,  856,  106,  106,  106,
			  106,  106,  106,  109,  225,  110,  238,  111,  111,  111,
			  111,  111,  111,  116,  116,  177,  116,  181,  267,  189,
			   84,   85,   84,   85,  109,  173,  110,  178,  113,  113,
			  113,  113,  113,  113,   76,  102,  174,  118,  191,   76,
			   94,  226,  227,  179,   94,  182,  112,  190,  212,  267,
			  212,  212,  855,  175,   95,  180,   95,   95,  338,  234,
			  341,  239,  234,  585,  585,  176,  192,  112,   77,   78,
			   79,   80,   81,   77,   78,   79,   80,   81,   86,   87,
			   88,   86,   87,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   89,   90,   86,   90,   90,   90,   90,   90,
			   90,   86,   86,   86,   86,   86,   86,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   86,   86,   91,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			  116,  116,  193,  116,  116,  116,  207,  116,  813,  814,
			  116,  116,  205,  116,  313,  194,  213,  197,  211,  236,

			  116,  116,  236,  116,  118,  198,  116,  116,  118,  116,
			  195,  839,  211,  119,  118,  208,  122,  120,  123,  121,
			  206,  201,  313,  196,  118,  199,  202,  124,  116,  116,
			  118,  116,  589,  200,  133,  116,  116,  125,  116,  116,
			  116,  119,  116,  214,  122,  120,  123,  121,  126,  203,
			  116,  116,  118,  116,  204,  124,  127,  116,  116,  118,
			  116,  211,  133,  118,  364,  125,  116,  116,  128,  116,
			  129,  314,  221,  112,  118,  838,  211,  126,  216,  134,
			  449,  118,  228,  489,  127,  258,  824,  135,  130,  131,
			  118,  218,  218,  364,  132,  449,  128,  267,  129,  314,

			  136,  116,  116,  211,  116,  145,  307,  134,  222,  223,
			  146,  116,  116,  267,  116,  135,  130,  131,  222,  223,
			  373,  259,  132,  153,  229,  118,  153,  229,  136,  116,
			  116,  154,  116,  145,  211,  118,  143,  487,  146,  215,
			  215,  215,  308,  315,  144,  137,  137,  137,  137,  137,
			  137,  147,  267,  118,  217,  217,  217,  309,  535,  322,
			  138,  536,  116,  116,  143,  116,  487,  139,  167,  156,
			  267,  315,  144,  156,  140,  156,  141,  231,  142,  147,
			  169,  219,  219,  219,  313,  156,  118,  322,  138,  170,
			  751,  156,  183,  184,  162,  139,  168,  162,  185,  116,

			  116,  162,  116,  162,  267,  141,  364,  142,  171,  162,
			  162,  148,  319,  162,  216,  233,  267,  172,  233,  162,
			  186,  187,  315,  266,  324,  162,  188,  234,  235,  260,
			  260,  260,  260,  260,  260,  365,  322,  795,  236,  325,
			  148,  153,  233,  535,  153,  233,  535,  751,  267,  154,
			  321,  267,  324,  581,  234,  839,  155,  156,  156,  156,
			  156,  156,  156,  157,  323,  236,  267,  325,  231,  156,
			  156,  156,  156,  156,  158,  156,  156,  156,  159,  156,
			  160,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  161,  325,  873,  231,  156,  162,  162,  163,

			  162,  162,  164,  162,  162,  162,  165,  162,  166,  162,
			  162,  162,  162,  162,  163,  162,  162,  162,  162,  162,
			  153,  327,  267,  153,  212,  155,  212,  212,  154,  261,
			  261,  261,  261,  261,  261,  155,  156,  156,  156,  156,
			  156,  156,  157,  211,  328,  262,  314,  616,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  161,  328,  262,  320,  156,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  241,

			  241,  253,  241,  253,  253,  246,  265,  265,  265,  265,
			  265,  265,  813,  814,  247,  247,  247,  247,  247,  247,
			  225,  215,  215,  215,  221,  242,  375,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  248,  255,  255,  255,  255,  255,  255,  226,  227,  267,
			  222,  223,  267,  226,  227,  249,  155,  256,  109,  250,
			  110,  251,  263,  263,  263,  263,  263,  263,  264,  109,
			  243,  110,  334,  263,  263,  263,  263,  263,  263,  324,
			  257,  116,  116,  328,  116,  256,  116,  116,  238,  116,

			  116,  116,  445,  116,  267,  116,  116,  335,  116,  267,
			  334,  112,  763,  267,  267,  118,  751,  326,  267,  542,
			  118,  331,  112,  339,  118,  116,  116,  340,  116,  118,
			  116,  116,  267,  116,  228,  335,  271,  270,  267,  116,
			  116,  269,  116,  267,  116,  116,  267,  116,  542,  118,
			  267,  339,  267,  239,  118,  340,  465,  267,  272,  116,
			  116,  267,  116,  118,  271,  270,  267,  267,  118,  269,
			  222,  223,  267,  273,  116,  116,  335,  116,  339,  274,
			  267,  116,  116,  118,  116,  334,  272,  267,  275,  276,
			  116,  116,  267,  116,  267,  277,  116,  116,  118,  116,

			  542,  273,  329,  267,  337,  118,  342,  274,  330,  267,
			  267,  278,  280,  336,  118,  267,  275,  276,  116,  116,
			  118,  116,  344,  277,  279,  116,  116,  267,  116,  545,
			  329,  267,  116,  116,  346,  116,  330,  281,  267,  278,
			  116,  116,  118,  116,  340,  267,  211,  344,  282,  118,
			  344,  267,  279,  267,  116,  116,  118,  116,  116,  116,
			  267,  116,  346,  267,  118,  281,  267,  267,  329,  348,
			  349,  267,  343,  352,  330,  345,  282,  284,  118,  728,
			  283,  267,  118,  727,  286,  285,  353,  116,  116,  287,
			  116,  116,  116,  353,  116,  346,  332,  348,  349,  349, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  267,  352,  333,  726,  267,  284,  358,  267,  484,  267,
			  267,  118,  286,  285,  353,  118,  267,  287,  288,  267,
			  288,  355,  138,  347,  348,  218,  218,  351,  352,  358,
			  116,  116,  294,  116,  358,  725,  294,  289,  141,  229,
			  362,  290,  229,  267,  291,  493,  362,  711,  258,  620,
			  138,  117,  350,  292,  118,  293,  354,  361,  267,  356,
			  493,  138,  447,  357,  620,  289,  267,  141,  362,  290,
			  116,  116,  291,  116,  363,  294,  252,  252,  267,  252,
			  448,  267,  292,  267,  293,  116,  116,  356,  116,  138,
			  447,  357,  231,  806,  118,  267,  211,  155,  267,  675,

			  390,  295,  295,  295,  295,  295,  295,  267,  448,  118,
			  117,  117,  117,  117,  117,  117,  301,  500,  116,  116,
			  296,  116,  806,  297,  491,  116,  116,  211,  116,  298,
			  211,  267,  116,  116,  267,  116,  267,  621,  267,  294,
			  452,  417,  118,  117,  301,  267,  211,  267,  296,  118,
			  299,  297,  417,  300,  621,  267,  118,  298,  454,  356,
			  599,  302,  417,  357,  304,  303,  116,  116,  452,  116,
			  116,  116,  117,  116,  215,  215,  215,  590,  299,  267,
			  417,  300,  448,  267,  109,  233,  454,  359,  233,  302,
			  118,  360,  304,  303,  118,  267,  317,  234,  318,  318,

			  318,  318,  318,  318,  267,  371,  371,  371,  236,  305,
			  451,  366,  367,  368,  369,  370,  534,  233,  534,  306,
			  233,  267,  455,  447,  372,  372,  372,  382,  382,  234,
			  382,  394,  394,  394,  394,  394,  394,  305,  231,  802,
			  236,  384,  385,  385,  385,  385,  385,  385,  306,  267,
			  455,  450,  455,  242,  392,  267,  392,  267,  873,  393,
			  393,  393,  393,  393,  393,  403,  403,  403,  403,  403,
			  231,  396,  396,  396,  396,  396,  396,  400,  267,  400,
			  457,  803,  401,  401,  401,  401,  401,  401,  379,  378,
			  540,  379,  156,  156,  156,  156,  156,  156,  156,  156,

			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  376,  377,  378,  376,  377,
			  376,  376,  376,  376,  376,  376,  376,  376,  379,  235,
			  235,  376,  235,  235,  235,  235,  235,  235,  376,  380,
			  376,  376,  376,  376,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  376,  376,  381,
			  376,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  376,  376,  376,  376,  376,

			  376,  376,  376,  376,  376,  376,  376,  241,  241,  406,
			  241,  404,  404,  404,  404,  404,  404,  424,  424,  424,
			  424,  424,  424,  428,  428,  428,  428,  428,  428,  380,
			  378,  378,  380,  242,  378,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  391,  391,
			  391,  391,  391,  391,  397,  397,  397,  397,  397,  397,
			  618,  267,  458,  618,  256,  374,  810,  109,  267,  110,
			  398,  402,  402,  402,  402,  402,  402,  484,  243,  454,
			  459,  116,  116,  460,  116,  619,  464,  257,  116,  116,

			  458,  116,  256,  399,  267,  810,  116,  116,  398,  116,
			  267,  267,  467,  116,  116,  118,  116,  456,  459,  267,
			  112,  460,  118,  407,  464,  267,  267,  465,  116,  116,
			  118,  116,  116,  116,  267,  116,  446,  118,  408,  267,
			  467,  267,  442,  406,  267,  267,  267,  116,  116,  459,
			  116,  407,  118,  409,  116,  116,  118,  116,  458,  410,
			  267,  116,  116,  267,  116,  618,  408,  267,  618,  116,
			  116,  118,  116,  452,  267,  460,  411,  462,  118,  412,
			  468,  409,  267,  395,  873,  118,  461,  410,  389,  469,
			  619,  413,  388,  118,  464,  472,  116,  116,  312,  116,

			  387,  453,  267,  463,  411,  414,  386,  412,  468,  267,
			  417,  116,  116,  415,  116,  116,  116,  469,  116,  413,
			  118,  417,  466,  472,  267,  383,  467,  474,  267,  116,
			  116,  417,  116,  414,  267,  118,  475,  116,  116,  118,
			  116,  415,  267,  478,  116,  116,  873,  116,  418,  417,
			  267,  416,  419,  118,  470,  474,  267,  267,  468,  116,
			  116,  118,  116,  232,  475,  420,  267,  421,  118,  267,
			  830,  478,  267,  472,  116,  116,  418,  116,  373,  211,
			  419,  619,  374,  118,  619,  475,  471,  267,  373,  683,
			  211,  116,  116,  420,  116,  421,  341,  280,  118,  830,

			  479,  473,  474,  267,  267,  422,  423,  425,  425,  425,
			  425,  425,  425,  477,  316,  118,  427,  427,  427,  427,
			  427,  427,  429,  429,  429,  429,  429,  429,  479,  431,
			  476,  431,  482,  422,  423,  312,  426,  430,  430,  430,
			  430,  430,  430,  483,  310,  117,  117,  117,  117,  117,
			  117,  117,  432,  267,  267,  433,  267,  215,  215,  215,
			  482,  434,  117,  117,  117,  117,  117,  117,  152,  116,
			  116,  483,  116,  116,  116,  479,  116,  307,  541,  478,
			  432,  117,  267,  433,  483,  254,  267,  116,  116,  434,
			  116,  116,  116,  118,  116,  116,  116,  118,  116,  546,

			  267,  267,  253,  481,  267,  211,  541,  480,  267,  117,
			  267,  118,  486,  298,  211,  118,  252,  436,  267,  118,
			  245,  116,  116,  437,  116,   99,  435,  546,  802,  116,
			  116,  267,  116,   96,  267,  116,  116,  487,  116,  751,
			  541,  298,  267,  116,  116,  118,  116,  482,  267,  116,
			  116,  437,  116,  118,  435,  211,  267,  232,  211,  118,
			  548,  546,  267,  438,  211,  209,  488,  118,  544,  549,
			  804,  152,  439,  118,  443,  485,  443,  443,  443,  443,
			  443,  443,  307,  217,  217,  217,  150,  115,  548,  547,
			  440,  438,  219,  219,  219,  114,  552,  549,  441,  444,

			  439,  444,  444,  444,  444,  444,  444,  307,  317,  107,
			  317,  317,  317,  317,  317,  317,  317,  104,  318,  318,
			  318,  318,  318,  318,  552,   99,   97,  441,  377,  378,
			   96,  377,  873,  215,  215,  215,  215,  215,  215,  873,
			  379,  382,  382,  256,  382,  393,  393,  393,  393,  393,
			  393,  380,  384,  385,  385,  385,  385,  385,  385,  490,
			  490,  490,  490,  490,  490,  267,  257,  873,  553,  873,
			  267,  256,  492,  492,  492,  492,  492,  492,  267,  873,
			  873,  381,  494,  494,  494,  494,  494,  494,  495,  495,
			  495,  495,  495,  495,  873,  556,  553,  553,  491,  873, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  496,  548,  496,  552,  398,  497,  497,  497,  497,  497,
			  497,  498,  498,  498,  498,  498,  498,  401,  401,  401,
			  401,  401,  401,  556,  873,  555,  873,  399,  873,  550,
			  873,  554,  398,  499,  499,  499,  499,  499,  499,  501,
			  502,  873,  503,  503,  503,  503,  503,  503,  504,  504,
			  504,  504,  504,  504,  505,  505,  505,  505,  505,  505,
			  116,  116,  873,  116,  116,  116,  557,  116,  873,  516,
			  267,  873,  500,  267,  811,  811,  811,  267,  116,  116,
			  516,  116,  116,  116,  118,  116,  267,  873,  118,  549,
			  516,  267,  873,  529,  557,  267,  116,  116,  873,  116,

			  873,  873,  118,  507,  529,  556,  118,  873,  516,  267,
			  559,  508,  116,  116,  529,  116,  873,  551,  510,  873,
			  118,  509,  873,  560,  561,  267,  116,  116,  511,  116,
			  873,  507,  529,  558,  116,  116,  118,  116,  559,  267,
			  508,  116,  116,  564,  116,  873,  510,  267,  873,  509,
			  118,  560,  561,  873,  267,  873,  511,  267,  118,  566,
			  267,  116,  116,  873,  116,  118,  873,  116,  116,  567,
			  116,  564,  512,  514,  267,  116,  116,  873,  116,  513,
			  267,  116,  116,  559,  116,  118,  873,  566,  267,  515,
			  560,  118,  873,  267,  267,  116,  116,  567,  116,  118,

			  512,  514,  873,  517,  267,  118,  873,  513,  267,  116,
			  116,  562,  116,  116,  116,  873,  116,  515,  563,  118,
			  519,  518,  267,  566,  873,  873,  267,  288,  267,  288,
			  520,  517,  873,  118,  567,  873,  570,  118,  424,  424,
			  424,  424,  424,  424,  535,  873,  267,  536,  519,  518,
			  290,  568,  521,  524,  117,  571,  522,  117,  520,  572,
			  117,  570,  569,  117,  570,  873,  523,  288,  564,  288,
			  573,  427,  427,  427,  427,  427,  427,  873,  290,  873,
			  521,  524,  117,  571,  522,  117,  873,  572,  873,  574,
			  873,  117,  873,  524,  523,  615,  565,  616,  573,  873,

			  117,  428,  428,  428,  428,  428,  428,  429,  429,  429,
			  429,  429,  429,  430,  430,  430,  430,  430,  430,  623,
			  625,  524,  525,  524,  526,  526,  526,  526,  526,  526,
			  873,  873,  626,  586,  117,  586,  117,  527,  527,  527,
			  527,  527,  527,  873,  587,  617,  117,  623,  625,  873,
			  525,  524,  528,  528,  528,  528,  528,  528,  116,  116,
			  626,  116,  873,  117,  116,  116,  117,  116,  873,  267,
			  873,  267,  588,  116,  116,  117,  116,  267,  873,  873,
			  873,  117,  118,  873,  607,  267,  267,  571,  118,  116,
			  116,  629,  116,  116,  116,  607,  116,  118,  116,  116,

			  635,  116,  267,  873,  623,  607,  267,  116,  116,  873,
			  116,  267,  873,  118,  873,  575,  267,  118,  873,  629,
			  534,  873,  118,  607,  531,  873,  532,  873,  635,  873,
			  873,  118,  624,  873,  626,  530,  443,  533,  443,  443,
			  443,  443,  443,  443,  307,  576,  576,  576,  576,  576,
			  576,  873,  531,  444,  532,  444,  444,  444,  444,  444,
			  444,  307,  628,  530,  543,  533,  543,  543,  543,  543,
			  543,  543,  873,  873,  873,  538,  577,  577,  577,  577,
			  577,  577,  873,  873,  491,  391,  391,  391,  391,  391,
			  391,  578,  539,  578,  578,  578,  578,  578,  578,  579,

			  579,  579,  579,  579,  579,  497,  497,  497,  497,  497,
			  497,  267,  873,  636,  873,  398,  580,  580,  580,  580,
			  580,  580,  582,  582,  582,  582,  582,  582,  583,  583,
			  583,  583,  583,  583,  873,  873,  637,  625,  399,  116,
			  116,  636,  116,  398,  584,  584,  584,  584,  584,  584,
			  873,  873,  267,  873,  873,  581,  579,  579,  579,  579,
			  579,  579,  267,  118,  637,  627,  502,  500,  503,  503,
			  503,  503,  503,  503,  116,  116,  873,  116,  116,  116,
			  629,  116,  116,  116,  640,  116,  642,  267,  643,  267,
			  646,  267,  267,  873,  873,  267,  116,  116,  118,  116,

			  116,  116,  118,  116,  116,  116,  118,  116,  632,  267,
			  592,  636,  640,  267,  642,  267,  643,  267,  646,  642,
			  118,  593,  116,  116,  118,  116,  873,  594,  118,  591,
			  873,  595,  873,  637,  647,  267,  596,  267,  592,  638,
			  630,  116,  116,  648,  116,  873,  118,  644,  597,  593,
			  116,  116,  631,  116,  267,  594,  640,  116,  116,  595,
			  116,  639,  647,  267,  596,  118,  116,  116,  630,  116,
			  267,  648,  116,  116,  118,  116,  597,  873,  598,  267,
			  631,  118,  600,  873,  641,  267,  267,  649,  601,  267,
			  118,  685,  612,  686,  116,  116,  118,  116,  116,  116,

			  873,  116,  873,  613,  602,  643,  598,  267,  646,  873,
			  600,  267,  873,  614,  873,  649,  601,  873,  118,  685,
			  873,  686,  118,  605,  605,  605,  605,  605,  605,  873,
			  604,  613,  602,  645,  873,  267,  650,  603,  117,  117,
			  117,  117,  117,  117,  526,  526,  526,  526,  526,  526,
			  873,  873,  117,  267,  647,  431,  267,  431,  604,  527,
			  527,  527,  527,  527,  527,  603,  116,  116,  873,  116,
			  873,  686,  606,  528,  528,  528,  528,  528,  528,  267,
			  873,  433,  651,  873,  669,  267,  873,  434,  117,  806,
			  118,  688,  873,  116,  116,  117,  116,  873,  608,  687,

			  606,  669,  689,  873,  630,  669,  267,  116,  116,  433,
			  116,  116,  116,  873,  116,  434,  631,  118,  807,  688,
			  267,  873,  679,  117,  267,  609,  608,  873,  873,  669,
			  689,  118,  633,  679,  543,  118,  543,  543,  543,  543,
			  543,  543,  692,  680,  634,  661,  661,  661,  661,  661,
			  610,  611,  873,  609,  652,  652,  652,  652,  652,  652,
			  578,  679,  578,  578,  578,  578,  578,  578,  873,  693,
			  692,  873,  873,  622,  745,  745,  745,  745,  610,  611,
			  579,  579,  579,  579,  579,  579,  655,  655,  655,  655,
			  655,  655,  873,  873,  873,  873,  654,  693,  873,  653,

			  656,  656,  656,  656,  656,  656,  657,  657,  657,  657,
			  657,  657,  658,  658,  658,  658,  658,  658,  659,  659,
			  659,  659,  659,  659,  654,  581,  660,  660,  660,  660,
			  660,  660,  662,  662,  662,  662,  662,  662,  116,  116,
			  873,  116,  267,  116,  116,  267,  116,  873,  262,  873,
			  873,  267,  679,  873,  680,  694,  267,  116,  116,  873,
			  116,  873,  118,  681,  688,  682,  664,  118,  689,  267,
			  267,  116,  116,  682,  116,  682,  262,  116,  116,  697,
			  116,  118,  873,  694,  267,  665,  116,  116,  873,  116,
			  267,  681,  690,  682,  664,  118,  691,  873,  873,  267, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  693,  118,  116,  116,  699,  116,  700,  697,  873,  666,
			  118,  116,  116,  665,  116,  267,  116,  116,  873,  116,
			  116,  116,  873,  116,  267,  667,  118,  873,  695,  267,
			  703,  267,  699,  267,  700,  118,  267,  666,  116,  116,
			  118,  116,  116,  116,  118,  116,  116,  116,  668,  116,
			  694,  267,  671,  667,  873,  267,  873,  873,  703,  267,
			  670,  873,  118,  873,  873,  873,  118,  697,  873,  704,
			  118,  873,  873,  873,  673,  873,  668,  674,  696,  873,
			  671,  267,  672,  116,  116,  288,  116,  288,  670,  605,
			  605,  605,  605,  605,  605,  698,  267,  704,  116,  116,

			  699,  116,  673,  116,  116,  674,  116,  118,  267,  705,
			  672,  267,  116,  116,  873,  116,  267,  873,  117,  873,
			  267,  873,  118,  731,  732,  267,  700,  118,  701,  763,
			  763,  873,  763,  677,  873,  873,  118,  705,  873,  873,
			  873,  676,  684,  678,  684,  684,  684,  684,  684,  684,
			  703,  731,  732,  788,  702,  576,  576,  576,  576,  576,
			  576,  677,  708,  708,  708,  708,  708,  708,  710,  676,
			  734,  678,  736,  873,  707,  873,  707,  873,  706,  708,
			  708,  708,  708,  708,  708,  709,  709,  709,  709,  709,
			  709,  399,  873,  873,  873,  873,  710,  873,  734,  873,

			  736,  581,  583,  583,  583,  583,  583,  583,  712,  712,
			  712,  712,  712,  712,  713,  713,  713,  713,  713,  713,
			  714,  714,  714,  714,  714,  714,  116,  116,  873,  116,
			  116,  116,  267,  116,  116,  116,  710,  116,  873,  267,
			  267,  873,  267,  267,  873,  719,  873,  267,  116,  116,
			  118,  116,  116,  116,  118,  116,  732,  734,  118,  399,
			  873,  267,  719,  873,  710,  267,  719,  717,  736,  716,
			  116,  116,  118,  116,  116,  116,  118,  116,  718,  116,
			  116,  873,  116,  267,  733,  735,  873,  267,  116,  116,
			  719,  116,  267,  721,  118,  717,  737,  716,  118,  873,

			  873,  267,  873,  118,  116,  116,  718,  116,  116,  116,
			  721,  116,  118,  738,  721,  873,  739,  267,  267,  873,
			  873,  267,  116,  116,  873,  116,  873,  720,  118,  873,
			  116,  116,  118,  116,  873,  267,  740,  738,  721,  764,
			  722,  738,  873,  267,  739,  684,  118,  684,  684,  684,
			  684,  684,  684,  765,  118,  720,  873,  723,  873,  873,
			  873,  873,  724,  873,  740,  741,  873,  764,  722,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  765,  873,  873,  730,  723,  747,  748,  747,  748,
			  724,  742,  742,  742,  742,  742,  742,  743,  767,  743,

			  873,  873,  744,  744,  744,  744,  744,  744,  746,  746,
			  746,  746,  746,  746,  750,  750,  750,  750,  750,  750,
			  116,  116,  873,  116,  873,  749,  767,  267,  116,  116,
			  710,  116,  873,  267,  267,  116,  116,  873,  116,  756,
			  873,  267,  116,  116,  118,  116,  767,  759,  267,  873,
			  752,  759,  118,  399,  769,  267,  756,  765,  710,  118,
			  756,  873,  116,  116,  753,  116,  118,  754,  759,  873,
			  116,  116,  755,  116,  768,  267,  760,  759,  752,  759,
			  760,  761,  769,  267,  756,  766,  118,  267,  116,  116,
			  771,  116,  753,  757,  118,  754,  772,  760,  761,  760,

			  755,  267,  758,  762,  769,  267,  873,  873,  760,  761,
			  873,  873,  118,  836,  836,  836,  836,  836,  771,  873,
			  762,  757,  873,  771,  772,  842,  842,  842,  842,  842,
			  758,  762,  770,  744,  744,  744,  744,  744,  744,  774,
			  774,  774,  774,  774,  774,  775,  775,  775,  775,  775,
			  775,  773,  588,  588,  588,  588,  588,  588,  776,  776,
			  776,  776,  776,  776,  777,  777,  777,  777,  777,  777,
			  778,  778,  778,  778,  778,  778,  116,  116,  581,  116,
			  116,  116,  873,  116,  116,  116,  710,  116,  873,  267,
			  789,  873,  784,  267,  790,  873,  784,  267,  267,  873,

			  118,  873,  116,  116,  118,  116,  785,  873,  118,  399,
			  785,  780,  873,  784,  710,  267,  116,  116,  789,  116,
			  116,  116,  790,  116,  784,  781,  118,  785,  784,  267,
			  790,  785,  786,  267,  782,  787,  792,  267,  785,  780,
			  118,  794,  873,  873,  118,  873,  873,  873,  873,  786,
			  873,  873,  787,  781,  805,  808,  792,  267,  791,  820,
			  786,  873,  782,  787,  792,  783,  873,  873,  873,  794,
			  742,  742,  742,  742,  742,  742,  796,  796,  796,  796,
			  796,  796,  805,  808,  793,  821,  873,  820,  808,  747,
			  831,  747,  873,  783,  777,  777,  777,  777,  777,  777,

			  778,  778,  778,  778,  778,  778,  873,  116,  116,  581,
			  116,  116,  116,  821,  116,  832,  809,  832,  831,  873,
			  267,  873,  873,  873,  267,  873,  833,  873,  749,  116,
			  116,  118,  116,  116,  116,  118,  116,  840,  846,  798,
			  873,  873,  267,  873,  873,  873,  267,  812,  812,  812,
			  812,  812,  812,  118,  834,  116,  116,  118,  116,  873,
			  799,  116,  116,  873,  116,  840,  846,  798,  267,  817,
			  859,  873,  873,  800,  267,  116,  116,  817,  116,  118,
			  116,  116,  801,  116,  873,  118,  818,  859,  267,  799,
			  817,  859,  873,  267,  818,  751,  873,  873,  873,  118,

			  815,  800,  873,  873,  118,  817,  873,  818,  818,  873,
			  873,  801,  873,  873,  873,  859,  819,  866,  867,  866,
			  867,  816,  818,  858,  858,  858,  858,  858,  815,  819,
			  822,  822,  822,  822,  822,  822,  749,  749,  749,  749,
			  749,  749,  116,  116,  819,  116,  827,  116,  116,  816,
			  116,  828,  751,  873,  827,  267,  868,  873,  873,  828,
			  267,  116,  116,  873,  116,  828,  118,  827,  873,  873,
			  873,  118,  828,  829,  267,  116,  116,  873,  116,  826,
			  873,  873,  827,  873,  873,  118,  829,  828,  267,  873,
			  873,  825,  841,  841,  841,  841,  841,  841,  873,  118,

			  873,  829,  837,  116,  116,  873,  116,  826,  836,  836,
			  836,  836,  836,  836,  873,  844,  267,  845,  873,  873,
			  825,  852,  873,  852,  873,  873,  844,  118,  845,  873,
			  837,  873,  853,  873,  873,  843,  844,  873,  845,  847,
			  847,  847,  847,  847,  847,  848,  848,  848,  848,  848,
			  848,  849,  116,  116,  844,  116,  845,  850,  873,  873,
			  854,  873,  849,  843,  873,  267,  873,  873,  850,  873,
			  860,  873,  849,  873,  873,  873,  118,  873,  850,  851,
			  851,  851,  851,  851,  851,  873,  873,  860,  873,  873,
			  849,  860,  873,  873,  873,  873,  850,  834,  834,  834, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  834,  834,  834,  857,  857,  857,  857,  857,  857,  861,
			  861,  861,  861,  861,  861,  860,  862,  862,  862,  862,
			  862,  862,  863,  864,  865,  865,  865,  865,  865,  865,
			  854,  854,  854,  854,  854,  854,  873,  873,  873,  863,
			  864,  873,  873,  863,  864,  869,  869,  869,  869,  869,
			  869,  870,  870,  870,  870,  870,  870,  871,  871,  871,
			  871,  871,  871,  873,  866,  873,  866,  863,  864,  870,
			  870,  870,  870,  870,  870,  872,  872,  872,  872,  872,
			  872,  868,  868,  868,  868,  868,  868,  103,  103,  103,
			  103,  103,  103,  103,  103,  729,  729,  729,  729,  729,

			  729,  729,  729,  868,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   98,   98,  873,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,  873,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,  100,  100,
			  873,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  108,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  873,  873,  873,  873,  873,  873,

			  873,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  117,  117,  117,  873,  873,  873,  873,  873,  873,  117,
			  117,  117,  117,  873,  117,  117,  117,  117,  117,  117,
			  117,  117,  873,  873,  873,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  149,  149,  873,  149,  873,  149,
			  149,  149,  873,  873,  149,  149,  149,  149,  149,  149,
			  149,  149,  873,  873,  873,  149,  149,  149,  149,  149,
			  149,  149,  149,  149,  151,  151,  873,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  210,  210,  873,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  873,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,

			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  230,  873,
			  230,  873,  873,  873,  873,  230,  873,  230,  230,  230,
			  873,  873,  230,  230,  230,  230,  230,  230,  230,  230,
			  873,  873,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,

			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  244,  244,  873,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  103,  873,  873,  873,  103,  103,  103,  873,  873,  103,
			  103,  103,  103,  103,  103,  103,  103,  873,  873,  873,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  108,  108,  108,  108,  873,
			  873,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  873,  873,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  268,  873,  873,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  873,  873,  873,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  873,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  243,  243,  243,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  243,  405,  405,  405,  405,
			  405,  405,  405,  405,  873,  873,  873,  405,  405,  405,

			  405,  405,  405,  405,  405,  405,  311,  311,  311,  311,
			  873,  873,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  873,  873,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  376,  376,  376,  376,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  506,  506,
			  506,  873,  873,  506,  506,  506,  506,  506,  506,  506,
			  506,  873,  873,  873,  506,  506,  506,  506,  506,  506,
			  506,  506,  506,  537,  873,  537,  873,  873,  873,  873, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  537,  873,  537,  537,  537,  873,  873,  537,  537,  537,
			  537,  537,  537,  537,  537,  873,  873,  873,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  446,  446,  446,
			  873,  873,  446,  446,  446,  446,  446,  446,  446,  446,
			  873,  873,  446,  446,  446,  446,  446,  446,  446,  446,
			  873,  873,  873,  446,  446,  446,  446,  446,  446,  446,
			  446,  446,  615,  873,  615,  873,  873,  873,  873,  615,
			  873,  615,  615,  615,  873,  873,  615,  615,  615,  615,
			  615,  615,  615,  615,  873,  873,  615,  615,  615,  615,
			  615,  615,  615,  615,  615,  615,  663,  663,  663,  663,

			  663,  663,  663,  663,  873,  873,  873,  663,  663,  663,
			  663,  663,  663,  663,  663,  663,  715,  715,  715,  873,
			  873,  715,  715,  715,  715,  715,  715,  715,  715,  873,
			  873,  873,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  729,  873,  873,  873,  729,  729,  729,  873,  873,
			  729,  729,  729,  729,  729,  729,  729,  729,  873,  873,
			  873,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  779,  779,  779,  779,  779,  779,  779,  779,  873,  873,
			  873,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  797,  797,  797,  873,  873,  797,  797,  797,  797,  797,

			  797,  797,  797,  873,  873,  873,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  823,  823,  823,  823,  823,
			  823,  823,  823,  873,  873,  873,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  835,  835,  835,  873,  873,
			  835,  835,  835,  835,  835,  835,  835,  835,  873,  873,
			  873,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			   11,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873, yy_Dummy>>,
			1, 353, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5352)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
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
			    1,    1,    1,    3,    5,    9,    6,    3,    4,   10,

			   18,   13,    4,   13,   13,   25,  850,   25,   25,   25,
			   25,   25,   25,   27,   84,   27,   92,   27,   27,   27,
			   27,   27,   27,   38,   38,   60,   38,   61,  188,   63,
			    5,    5,    6,    6,   28,   59,   28,   60,   28,   28,
			   28,   28,   28,   28,    3,   18,   59,   38,   64,    4,
			    9,   84,   84,   60,   10,   61,   27,   63,   74,  182,
			   74,   74,  849,   59,   95,   60,   95,   95,  182,  234,
			  188,   92,  234,  501,  501,   59,   64,   28,    3,    3,
			    3,    3,    3,    4,    4,    4,    4,    4,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			   35,   35,   65,   35,   36,   36,   69,   36,  797,  797,
			   37,   37,   68,   37,  158,   65,   76,   66,   78,  236,

			   39,   39,  236,   39,   35,   66,   43,   43,   36,   43,
			   65,  828,   80,   35,   37,   69,   36,   35,   37,   35,
			   68,   67,  158,   65,   39,   66,   67,   37,   40,   40,
			   43,   40,  505,   66,   43,   41,   41,   39,   41,   44,
			   44,   35,   44,   76,   36,   35,   37,   35,   39,   67,
			   42,   42,   40,   42,   67,   37,   40,   45,   45,   41,
			   45,   77,   43,   44,  207,   39,   48,   48,   40,   48,
			   41,  159,   82,  505,   42,  827,   79,   39,   78,   44,
			  316,   45,   85,  373,   40,  108,  814,   45,   42,   42,
			   48,   80,   80,  207,   42,  316,   40,  809,   41,  159,

			   45,   47,   47,   81,   47,   48,  150,   44,   82,   82,
			   48,   49,   49,  807,   49,   45,   42,   42,   85,   85,
			  373,  108,   42,  153,   87,   47,  153,   87,   45,   46,
			   46,  153,   46,   48,  367,   49,   47,  364,   48,   77,
			   77,   77,  150,  160,   47,   46,   46,   46,   46,   46,
			   46,   49,  164,   46,   79,   79,   79,  150,  442,  167,
			   46,  442,   50,   50,   47,   50,  364,   46,   56,   56,
			  208,  160,   47,   56,   46,   56,   46,   87,   46,   49,
			   57,   81,   81,   81,  164,   57,   50,  167,   46,   57,
			  787,   57,   62,   62,   56,   46,   56,   56,   62,  116,

			  116,   56,  116,   56,  166,   46,  208,   46,   57,   56,
			   57,   50,  164,   57,  367,   89,  168,   57,   89,   57,
			   62,   62,  166,  116,  169,   57,   62,   89,   89,  109,
			  109,  109,  109,  109,  109,  208,  168,  775,   89,  170,
			   50,   55,   90,  535,   55,   90,  535,  829,  773,   55,
			  166,  768,  169,  742,   90,  829,   55,   55,   55,   55,
			   55,   55,   55,   55,  168,   90,  172,  170,   89,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,  172,  615,   90,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   58,  172,  165,   58,  212,  730,  212,  212,   58,  110,
			  110,  110,  110,  110,  110,   58,   58,   58,   58,   58,
			   58,   58,   58,  216,  173,  110,  165,  615,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  173,  110,  165,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   93,

			   93,  253,   93,  253,  253,  102,  112,  112,  112,  112,
			  112,  112,  835,  835,  102,  102,  102,  102,  102,  102,
			  224,  216,  216,  216,  220,   93,  226,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			  102,  106,  106,  106,  106,  106,  106,  224,  224,  171,
			  220,  220,  175,  226,  226,  102,  311,  106,  111,  102,
			  111,  102,  111,  111,  111,  111,  111,  111,  111,  113,
			   93,  113,  177,  113,  113,  113,  113,  113,  113,  171,
			  106,  117,  117,  175,  117,  106,  119,  119,  237,  119,

			  120,  120,  311,  120,  117,  121,  121,  178,  121,  119,
			  177,  111,  729,  120,  337,  117,  715,  171,  121,  448,
			  119,  175,  113,  183,  120,  122,  122,  184,  122,  121,
			  123,  123,  702,  123,  223,  178,  121,  120,  122,  124,
			  124,  119,  124,  123,  125,  125,  180,  125,  448,  122,
			  186,  183,  124,  237,  123,  184,  337,  125,  122,  126,
			  126,  179,  126,  124,  121,  120,  451,  698,  125,  119,
			  223,  223,  126,  123,  127,  127,  180,  127,  186,  124,
			  696,  128,  128,  126,  128,  179,  122,  127,  125,  126,
			  129,  129,  695,  129,  128,  126,  130,  130,  127,  130,

			  451,  123,  174,  129,  180,  128,  186,  124,  174,  130,
			  690,  127,  129,  179,  129,  190,  125,  126,  131,  131,
			  130,  131,  189,  126,  128,  132,  132,  187,  132,  451,
			  174,  131,  133,  133,  191,  133,  174,  130,  132,  127,
			  134,  134,  131,  134,  187,  133,  369,  190,  131,  132,
			  189,  176,  128,  134,  135,  135,  133,  135,  136,  136,
			  200,  136,  191,  192,  134,  130,  361,  135,  176,  193,
			  194,  136,  187,  197,  176,  190,  131,  133,  135,  682,
			  132,  196,  136,  681,  135,  134,  198,  138,  138,  136,
			  138,  139,  139,  200,  139,  192,  176,  193,  194,  196, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  138,  197,  176,  680,  139,  133,  202,  195,  361,  199,
			  204,  138,  135,  134,  198,  139,  206,  136,  137,  137,
			  137,  200,  139,  192,  195,  369,  369,  196,  199,  204,
			  141,  141,  138,  141,  202,  679,  139,  137,  139,  229,
			  205,  137,  229,  141,  137,  395,  206,  659,  653,  540,
			  139,  137,  195,  137,  141,  137,  199,  204,  650,  201,
			  395,  141,  313,  201,  540,  137,  634,  139,  205,  137,
			  144,  144,  137,  144,  206,  141,  252,  252,  628,  252,
			  314,  624,  137,  144,  137,  140,  140,  201,  140,  141,
			  313,  201,  229,  790,  144,  545,  217,  622,  140,  607,

			  252,  140,  140,  140,  140,  140,  140,  142,  314,  140,
			  142,  142,  142,  142,  142,  142,  144,  583,  143,  143,
			  140,  143,  790,  140,  576,  145,  145,  218,  145,  140,
			  215,  143,  146,  146,  558,  146,  203,  545,  145,  142,
			  322,  280,  143,  142,  144,  146,  219,  544,  140,  145,
			  143,  140,  280,  143,  542,  320,  146,  140,  324,  203,
			  516,  145,  280,  203,  146,  145,  147,  147,  322,  147,
			  148,  148,  142,  148,  217,  217,  217,  506,  143,  147,
			  280,  143,  320,  148,  494,  230,  324,  203,  230,  145,
			  147,  203,  146,  145,  148,  163,  163,  230,  163,  163,

			  163,  163,  163,  163,  319,  218,  218,  218,  230,  147,
			  320,  215,  215,  215,  215,  215,  488,  233,  487,  148,
			  233,  327,  325,  319,  219,  219,  219,  242,  242,  233,
			  242,  257,  257,  257,  257,  257,  257,  147,  230,  784,
			  233,  247,  247,  247,  247,  247,  247,  247,  148,  156,
			  325,  319,  327,  242,  256,  481,  256,  480,  156,  256,
			  256,  256,  256,  256,  256,  264,  264,  264,  264,  264,
			  233,  260,  260,  260,  260,  260,  260,  262,  461,  262,
			  327,  784,  262,  262,  262,  262,  262,  262,  379,  379,
			  445,  379,  156,  156,  156,  156,  156,  156,  156,  156,

			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  238,  238,  406,
			  238,  265,  265,  265,  265,  265,  265,  288,  288,  288,
			  288,  288,  288,  291,  291,  291,  291,  291,  291,  380,
			  380,  381,  380,  238,  376,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  255,  255,
			  255,  255,  255,  255,  261,  261,  261,  261,  261,  261,
			  539,  326,  328,  539,  255,  375,  794,  263,  363,  263,
			  261,  263,  263,  263,  263,  263,  263,  358,  238,  326,
			  329,  269,  269,  330,  269,  539,  334,  255,  270,  270,

			  328,  270,  255,  261,  269,  794,  271,  271,  261,  271,
			  347,  270,  339,  272,  272,  269,  272,  326,  329,  271,
			  263,  330,  270,  269,  334,  332,  272,  335,  273,  273,
			  271,  273,  274,  274,  321,  274,  312,  272,  270,  331,
			  339,  273,  307,  268,  333,  274,  323,  275,  275,  332,
			  275,  269,  273,  272,  276,  276,  274,  276,  331,  273,
			  275,  277,  277,  336,  277,  618,  270,  276,  618,  278,
			  278,  275,  278,  323,  277,  333,  274,  332,  276,  275,
			  340,  272,  278,  259,  258,  277,  331,  273,  251,  341,
			  618,  276,  250,  278,  336,  344,  279,  279,  338,  279,

			  249,  323,  342,  333,  274,  277,  248,  275,  340,  279,
			  338,  281,  281,  278,  281,  282,  282,  341,  282,  276,
			  279,  338,  336,  344,  281,  246,  342,  348,  282,  283,
			  283,  338,  283,  277,  343,  281,  349,  284,  284,  282,
			  284,  278,  283,  352,  285,  285,  241,  285,  281,  338,
			  284,  279,  282,  283,  342,  348,  345,  285,  343,  286,
			  286,  284,  286,  232,  349,  283,  351,  284,  285,  350,
			  820,  352,  286,  345,  287,  287,  281,  287,  227,  366,
			  282,  619,  225,  286,  619,  351,  343,  287,  222,  619,
			  210,  289,  289,  283,  289,  284,  185,  181,  287,  820,

			  353,  345,  350,  162,  289,  286,  287,  289,  289,  289,
			  289,  289,  289,  351,  161,  289,  290,  290,  290,  290,
			  290,  290,  292,  292,  292,  292,  292,  292,  353,  295,
			  350,  295,  356,  286,  287,  157,  289,  293,  293,  293,
			  293,  293,  293,  357,  154,  290,  294,  294,  294,  294,
			  294,  294,  295,  354,  360,  295,  355,  366,  366,  366,
			  356,  295,  296,  296,  296,  296,  296,  296,  151,  297,
			  297,  357,  297,  298,  298,  355,  298,  149,  447,  354,
			  295,  296,  297,  295,  360,  105,  298,  299,  299,  295,
			  299,  301,  301,  297,  301,  300,  300,  298,  300,  452,

			  299,  365,  104,  355,  301,  368,  447,  354,  300,  296,
			  450,  299,  360,  297,  370,  301,  103,  300,  359,  300,
			  100,  302,  302,  301,  302,   98,  299,  452,  786,  303,
			  303,  453,  303,   96,  302,  304,  304,  365,  304,  786,
			  450,  297,  303,  305,  305,  302,  305,  359,  304,  306,
			  306,  301,  306,  303,  299,  371,  305,   88,  372,  304,
			  454,  453,  306,  302,   73,   70,  365,  305,  450,  455,
			  786,   54,  303,  306,  308,  359,  308,  308,  308,  308,
			  308,  308,  308,  368,  368,  368,   51,   33,  454,  453,
			  304,  302,  370,  370,  370,   31,  459,  455,  306,  309,

			  303,  309,  309,  309,  309,  309,  309,  309,  317,   26,
			  317,  317,  317,  317,  317,  317,  318,   24,  318,  318,
			  318,  318,  318,  318,  459,   16,   15,  306,  377,  377,
			   14,  377,   11,  371,  371,  371,  372,  372,  372,    0,
			  377,  382,  382,  391,  382,  392,  392,  392,  392,  392,
			  392,  377,  385,  385,  385,  385,  385,  385,  385,  393,
			  393,  393,  393,  393,  393,  463,  391,  382,  460,    0,
			  462,  391,  394,  394,  394,  394,  394,  394,  456,    0,
			    0,  377,  396,  396,  396,  396,  396,  396,  397,  397,
			  397,  397,  397,  397,    0,  464,  460,  463,  393,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  398,  456,  398,  462,  397,  398,  398,  398,  398,  398,
			  398,  399,  399,  399,  399,  399,  399,  400,  400,  400,
			  400,  400,  400,  464,    0,  463,    0,  397,    0,  456,
			    0,  462,  397,  401,  401,  401,  401,  401,  401,  402,
			  402,    0,  402,  402,  402,  402,  402,  402,  403,  403,
			  403,  403,  403,  403,  404,  404,  404,  404,  404,  404,
			  407,  407,    0,  407,  408,  408,  465,  408,    0,  417,
			  457,    0,  401,  407,  795,  795,  795,  408,  409,  409,
			  417,  409,  410,  410,  407,  410,  466,    0,  408,  457,
			  417,  409,    0,  436,  465,  410,  411,  411,    0,  411,

			    0,    0,  409,  407,  436,  466,  410,    0,  417,  411,
			  467,  408,  412,  412,  436,  412,    0,  457,  410,    0,
			  411,  409,    0,  468,  469,  412,  413,  413,  411,  413,
			    0,  407,  436,  466,  414,  414,  412,  414,  467,  413,
			  408,  415,  415,  472,  415,    0,  410,  414,    0,  409,
			  413,  468,  469,    0,  415,    0,  411,  471,  414,  474,
			  470,  416,  416,    0,  416,  415,    0,  418,  418,  475,
			  418,  472,  413,  415,  416,  419,  419,    0,  419,  414,
			  418,  420,  420,  470,  420,  416,    0,  474,  419,  416,
			  471,  418,    0,  476,  420,  421,  421,  475,  421,  419,

			  413,  415,    0,  418,  477,  420,    0,  414,  421,  422,
			  422,  470,  422,  423,  423,    0,  423,  416,  471,  421,
			  420,  419,  422,  476,    0,    0,  423,  425,  485,  425,
			  421,  418,    0,  422,  477,    0,  482,  423,  424,  424,
			  424,  424,  424,  424,  536,    0,  473,  536,  420,  419,
			  425,  476,  422,  425,  426,  483,  423,  426,  421,  484,
			  425,  485,  477,  426,  482,    0,  424,  427,  473,  427,
			  484,  427,  427,  427,  427,  427,  427,    0,  425,    0,
			  422,  425,  426,  483,  423,  426,    0,  484,    0,  485,
			    0,  426,  537,  427,  424,  537,  473,  536,  484,    0,

			  427,  428,  428,  428,  428,  428,  428,  429,  429,  429,
			  429,  429,  429,  430,  430,  430,  430,  430,  430,  546,
			  548,  427,  429,  428,  431,  431,  431,  431,  431,  431,
			    0,    0,  549,  504,  428,  504,  429,  432,  432,  432,
			  432,  432,  432,    0,  504,  537,  430,  546,  548,    0,
			  429,  428,  433,  433,  433,  433,  433,  433,  434,  434,
			  549,  434,    0,  428,  435,  435,  432,  435,    0,  486,
			    0,  434,  504,  437,  437,  430,  437,  435,    0,    0,
			    0,  433,  434,    0,  529,  547,  437,  486,  435,  438,
			  438,  552,  438,  439,  439,  529,  439,  437,  440,  440,

			  557,  440,  438,    0,  547,  529,  439,  441,  441,    0,
			  441,  440,    0,  438,    0,  486,  551,  439,    0,  552,
			  441,    0,  440,  529,  439,    0,  440,    0,  557,    0,
			    0,  441,  547,    0,  551,  438,  443,  440,  443,  443,
			  443,  443,  443,  443,  443,  490,  490,  490,  490,  490,
			  490,    0,  439,  444,  440,  444,  444,  444,  444,  444,
			  444,  444,  551,  438,  449,  440,  449,  449,  449,  449,
			  449,  449,    0,    0,    0,  443,  491,  491,  491,  491,
			  491,  491,    0,    0,  490,  492,  492,  492,  492,  492,
			  492,  493,  444,  493,  493,  493,  493,  493,  493,  495,

			  495,  495,  495,  495,  495,  496,  496,  496,  496,  496,
			  496,  550,    0,  559,    0,  495,  497,  497,  497,  497,
			  497,  497,  498,  498,  498,  498,  498,  498,  499,  499,
			  499,  499,  499,  499,    0,    0,  560,  550,  495,  507,
			  507,  559,  507,  495,  500,  500,  500,  500,  500,  500,
			    0,    0,  507,    0,    0,  497,  502,  502,  502,  502,
			  502,  502,  554,  507,  560,  550,  503,  499,  503,  503,
			  503,  503,  503,  503,  508,  508,    0,  508,  509,  509,
			  554,  509,  510,  510,  564,  510,  566,  508,  567,  568,
			  570,  509,  562,    0,    0,  510,  511,  511,  508,  511,

			  512,  512,  509,  512,  513,  513,  510,  513,  554,  511,
			  509,  562,  564,  512,  566,  563,  567,  513,  570,  568,
			  511,  510,  514,  514,  512,  514,    0,  511,  513,  508,
			    0,  512,    0,  563,  571,  514,  513,  565,  509,  562,
			  553,  515,  515,  572,  515,    0,  514,  568,  513,  510,
			  517,  517,  553,  517,  515,  511,  565,  518,  518,  512,
			  518,  563,  571,  517,  513,  515,  519,  519,  553,  519,
			  518,  572,  520,  520,  517,  520,  513,    0,  515,  519,
			  553,  518,  517,    0,  565,  520,  569,  573,  518,  574,
			  519,  621,  534,  625,  521,  521,  520,  521,  522,  522,

			    0,  522,    0,  534,  520,  569,  515,  521,  574,    0,
			  517,  522,    0,  534,    0,  573,  518,    0,  521,  621,
			    0,  625,  522,  524,  524,  524,  524,  524,  524,    0,
			  522,  534,  520,  569,    0,  575,  574,  521,  525,  525,
			  525,  525,  525,  525,  526,  526,  526,  526,  526,  526,
			    0,    0,  524,  791,  575,  527,  627,  527,  522,  527,
			  527,  527,  527,  527,  527,  521,  530,  530,    0,  530,
			    0,  627,  526,  528,  528,  528,  528,  528,  528,  530,
			    0,  527,  575,    0,  599,  555,    0,  527,  527,  791,
			  530,  629,    0,  531,  531,  528,  531,    0,  530,  627,

			  526,  599,  630,    0,  555,  599,  531,  532,  532,  527,
			  532,  533,  533,    0,  533,  527,  555,  531,  791,  629,
			  532,    0,  612,  528,  533,  531,  530,    0,    0,  599,
			  630,  532,  555,  612,  543,  533,  543,  543,  543,  543,
			  543,  543,  635,  612,  555,  587,  587,  587,  587,  587,
			  532,  533,    0,  531,  577,  577,  577,  577,  577,  577,
			  578,  612,  578,  578,  578,  578,  578,  578,    0,  636,
			  635,    0,    0,  543,  711,  711,  711,  711,  532,  533,
			  579,  579,  579,  579,  579,  579,  580,  580,  580,  580,
			  580,  580,    0,    0,    0,    0,  579,  636,    0,  578,

			  581,  581,  581,  581,  581,  581,  582,  582,  582,  582,
			  582,  582,  584,  584,  584,  584,  584,  584,  585,  585,
			  585,  585,  585,  585,  579,  580,  586,  586,  586,  586,
			  586,  586,  589,  589,  589,  589,  589,  589,  591,  591,
			    0,  591,  633,  592,  592,  632,  592,    0,  589,    0,
			    0,  591,  613,    0,  614,  637,  592,  593,  593,    0,
			  593,    0,  591,  613,  632,  614,  591,  592,  633,  638,
			  593,  594,  594,  613,  594,  614,  589,  595,  595,  640,
			  595,  593,    0,  637,  594,  593,  596,  596,    0,  596,
			  595,  613,  632,  614,  591,  594,  633,    0,    0,  596, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  638,  595,  597,  597,  642,  597,  643,  640,    0,  595,
			  596,  598,  598,  593,  598,  597,  600,  600,    0,  600,
			  601,  601,    0,  601,  598,  596,  597,    0,  638,  600,
			  647,  639,  642,  601,  643,  598,  641,  595,  602,  602,
			  600,  602,  603,  603,  601,  603,  604,  604,  598,  604,
			  639,  602,  601,  596,    0,  603,    0,    0,  647,  604,
			  600,    0,  602,    0,    0,    0,  603,  641,    0,  648,
			  604,    0,    0,    0,  603,    0,  598,  604,  639,    0,
			  601,  644,  602,  608,  608,  605,  608,  605,  600,  605,
			  605,  605,  605,  605,  605,  641,  608,  648,  609,  609,

			  644,  609,  603,  610,  610,  604,  610,  608,  645,  649,
			  602,  609,  611,  611,    0,  611,  610,    0,  605,    0,
			  651,    0,  609,  685,  686,  611,  645,  610,  644,  763,
			  763,    0,  763,  610,    0,    0,  611,  649,    0,    0,
			    0,  609,  620,  611,  620,  620,  620,  620,  620,  620,
			  651,  685,  686,  763,  645,  652,  652,  652,  652,  652,
			  652,  610,  655,  655,  655,  655,  655,  655,  657,  609,
			  689,  611,  699,    0,  654,    0,  654,    0,  651,  654,
			  654,  654,  654,  654,  654,  656,  656,  656,  656,  656,
			  656,  657,    0,    0,    0,    0,  657,    0,  689,    0,

			  699,  655,  658,  658,  658,  658,  658,  658,  660,  660,
			  660,  660,  660,  660,  661,  661,  661,  661,  661,  661,
			  662,  662,  662,  662,  662,  662,  664,  664,    0,  664,
			  665,  665,  687,  665,  666,  666,  662,  666,    0,  664,
			  691,    0,  701,  665,    0,  669,    0,  666,  667,  667,
			  664,  667,  668,  668,  665,  668,  687,  691,  666,  662,
			    0,  667,  669,    0,  662,  668,  669,  665,  701,  664,
			  670,  670,  667,  670,  671,  671,  668,  671,  667,  672,
			  672,    0,  672,  670,  687,  691,    0,  671,  673,  673,
			  669,  673,  672,  675,  670,  665,  701,  664,  671,    0,

			    0,  673,    0,  672,  674,  674,  667,  674,  676,  676,
			  675,  676,  673,  703,  675,    0,  704,  674,  706,    0,
			    0,  676,  677,  677,    0,  677,    0,  673,  674,    0,
			  678,  678,  676,  678,    0,  677,  705,  706,  675,  731,
			  676,  703,    0,  678,  704,  684,  677,  684,  684,  684,
			  684,  684,  684,  732,  678,  673,    0,  677,    0,    0,
			    0,    0,  678,    0,  705,  706,    0,  731,  676,  707,
			  707,  707,  707,  707,  707,  708,  708,  708,  708,  708,
			  708,  732,    0,    0,  684,  677,  713,  713,  713,  713,
			  678,  709,  709,  709,  709,  709,  709,  710,  734,  710,

			    0,    0,  710,  710,  710,  710,  710,  710,  712,  712,
			  712,  712,  712,  712,  714,  714,  714,  714,  714,  714,
			  716,  716,    0,  716,    0,  713,  734,  735,  717,  717,
			  714,  717,    0,  716,  733,  718,  718,    0,  718,  721,
			    0,  717,  720,  720,  716,  720,  735,  725,  718,    0,
			  716,  725,  717,  714,  736,  720,  721,  733,  714,  718,
			  721,    0,  722,  722,  717,  722,  720,  718,  725,    0,
			  723,  723,  720,  723,  735,  722,  726,  727,  716,  725,
			  726,  727,  736,  723,  721,  733,  722,  737,  724,  724,
			  738,  724,  717,  722,  723,  718,  739,  726,  727,  728,

			  720,  724,  723,  728,  737,  741,    0,    0,  726,  727,
			    0,    0,  724,  824,  824,  824,  824,  824,  738,    0,
			  728,  722,    0,  741,  739,  833,  833,  833,  833,  833,
			  723,  728,  737,  743,  743,  743,  743,  743,  743,  744,
			  744,  744,  744,  744,  744,  745,  745,  745,  745,  745,
			  745,  741,  746,  746,  746,  746,  746,  746,  747,  747,
			  747,  747,  747,  747,  748,  748,  748,  748,  748,  748,
			  750,  750,  750,  750,  750,  750,  752,  752,  744,  752,
			  753,  753,    0,  753,  754,  754,  750,  754,    0,  752,
			  764,    0,  759,  753,  765,    0,  759,  754,  766,    0,

			  752,    0,  755,  755,  753,  755,  760,    0,  754,  750,
			  760,  752,    0,  759,  750,  755,  757,  757,  764,  757,
			  758,  758,  765,  758,  759,  753,  755,  760,  761,  757,
			  766,  762,  761,  758,  755,  762,  769,  770,  760,  752,
			  757,  772,    0,    0,  758,    0,    0,    0,    0,  761,
			    0,    0,  762,  753,  789,  792,  770,  793,  766,  805,
			  761,    0,  755,  762,  769,  758,    0,    0,    0,  772,
			  774,  774,  774,  774,  774,  774,  776,  776,  776,  776,
			  776,  776,  789,  792,  770,  810,    0,  805,  793,  777,
			  821,  777,    0,  758,  777,  777,  777,  777,  777,  777,

			  778,  778,  778,  778,  778,  778,    0,  780,  780,  774,
			  780,  781,  781,  810,  781,  822,  793,  822,  821,    0,
			  780,    0,    0,    0,  781,    0,  822,    0,  777,  782,
			  782,  780,  782,  783,  783,  781,  783,  830,  840,  780,
			    0,    0,  782,    0,    0,    0,  783,  796,  796,  796,
			  796,  796,  796,  782,  822,  798,  798,  783,  798,    0,
			  781,  799,  799,    0,  799,  830,  840,  780,  798,  802,
			  855,    0,    0,  782,  799,  800,  800,  802,  800,  798,
			  801,  801,  783,  801,    0,  799,  803,  855,  800,  781,
			  802,  855,    0,  801,  803,  804,    0,    0,    0,  800,

			  798,  782,    0,    0,  801,  802,    0,  803,  804,    0,
			    0,  783,    0,    0,    0,  855,  804,  862,  862,  862,
			  862,  801,  803,  853,  853,  853,  853,  853,  798,  804,
			  811,  811,  811,  811,  811,  811,  812,  812,  812,  812,
			  812,  812,  815,  815,  804,  815,  817,  816,  816,  801,
			  816,  818,  819,    0,  817,  815,  862,    0,    0,  818,
			  816,  825,  825,    0,  825,  819,  815,  817,    0,    0,
			    0,  816,  818,  819,  825,  826,  826,    0,  826,  816,
			    0,    0,  817,    0,    0,  825,  819,  818,  826,    0,
			    0,  815,  832,  832,  832,  832,  832,  832,    0,  826,

			    0,  819,  825,  837,  837,    0,  837,  816,  836,  836,
			  836,  836,  836,  836,    0,  838,  837,  839,    0,    0,
			  815,  848,    0,  848,    0,    0,  838,  837,  839,    0,
			  825,    0,  848,    0,    0,  837,  838,    0,  839,  841,
			  841,  841,  841,  841,  841,  842,  842,  842,  842,  842,
			  842,  844,  843,  843,  838,  843,  839,  845,    0,    0,
			  848,    0,  844,  837,    0,  843,    0,    0,  845,    0,
			  856,    0,  844,    0,    0,    0,  843,    0,  845,  847,
			  847,  847,  847,  847,  847,    0,    0,  856,    0,    0,
			  844,  856,    0,    0,    0,    0,  845,  851,  851,  851, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  851,  851,  851,  852,  852,  852,  852,  852,  852,  857,
			  857,  857,  857,  857,  857,  856,  858,  858,  858,  858,
			  858,  858,  859,  860,  861,  861,  861,  861,  861,  861,
			  865,  865,  865,  865,  865,  865,    0,    0,    0,  859,
			  860,    0,    0,  859,  860,  866,  866,  866,  866,  866,
			  866,  867,  867,  867,  867,  867,  867,  869,  869,  869,
			  869,  869,  869,    0,  870,    0,  870,  859,  860,  870,
			  870,  870,  870,  870,  870,  871,  871,  871,  871,  871,
			  871,  872,  872,  872,  872,  872,  872,  879,  879,  879,
			  879,  879,  879,  879,  879,  908,  908,  908,  908,  908,

			  908,  908,  908,  870,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,

			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  877,  877,    0,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,    0,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  878,  878,
			    0,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  880,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,    0,    0,    0,    0,    0,    0,

			    0,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  881,  881,  881,    0,    0,    0,    0,    0,    0,  881,
			  881,  881,  881,    0,  881,  881,  881,  881,  881,  881,
			  881,  881,    0,    0,    0,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  882,  882,    0,  882,    0,  882,
			  882,  882,    0,    0,  882,  882,  882,  882,  882,  882,
			  882,  882,    0,    0,    0,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  883,  883,    0,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  884,  884,    0,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,    0,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,

			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  887,    0,
			  887,    0,    0,    0,    0,  887,    0,  887,  887,  887,
			    0,    0,  887,  887,  887,  887,  887,  887,  887,  887,
			    0,    0,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,

			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  890,  890,    0,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  891,    0,    0,    0,  891,  891,  891,    0,    0,  891,
			  891,  891,  891,  891,  891,  891,  891,    0,    0,    0,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,

			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  893,  893,  893,  893,    0,
			    0,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			    0,    0,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  894,    0,    0,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,    0,    0,    0,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,    0,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,

			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  898,  898,  898,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  898,  899,  899,  899,  899,
			  899,  899,  899,  899,    0,    0,    0,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  900,  900,  900,  900,
			    0,    0,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,    0,    0,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  902,  902,
			  902,    0,    0,  902,  902,  902,  902,  902,  902,  902,
			  902,    0,    0,    0,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  903,    0,  903,    0,    0,    0,    0, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  903,    0,  903,  903,  903,    0,    0,  903,  903,  903,
			  903,  903,  903,  903,  903,    0,    0,    0,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  904,  904,  904,
			    0,    0,  904,  904,  904,  904,  904,  904,  904,  904,
			    0,    0,  904,  904,  904,  904,  904,  904,  904,  904,
			    0,    0,    0,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  905,    0,  905,    0,    0,    0,    0,  905,
			    0,  905,  905,  905,    0,    0,  905,  905,  905,  905,
			  905,  905,  905,  905,    0,    0,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  906,  906,  906,  906,

			  906,  906,  906,  906,    0,    0,    0,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  907,  907,  907,    0,
			    0,  907,  907,  907,  907,  907,  907,  907,  907,    0,
			    0,    0,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  909,    0,    0,    0,  909,  909,  909,    0,    0,
			  909,  909,  909,  909,  909,  909,  909,  909,    0,    0,
			    0,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  910,  910,  910,  910,  910,  910,  910,  910,    0,    0,
			    0,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  911,  911,  911,    0,    0,  911,  911,  911,  911,  911,

			  911,  911,  911,    0,    0,    0,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  912,  912,  912,  912,  912,
			  912,  912,  912,    0,    0,    0,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  913,  913,  913,    0,    0,
			  913,  913,  913,  913,  913,  913,  913,  913,    0,    0,
			    0,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873, yy_Dummy>>,
			1, 353, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0,   67,
			   71, 1932, 5260,   99, 1927, 1899, 1918, 5260,   91,    0,
			 5260, 5260, 5260, 5260, 1902,   89, 1892,   99,  120, 5260,
			 5260, 1868, 5260, 1860, 5260,  278,  282,  288,  121,  298,
			  326,  333,  348,  304,  337,  355,  427,  399,  364,  409,
			  460, 1828, 5260, 5260, 1815,  539,  434,  450,  618,   96,
			   95,   90,  452,   99,  106,  250,  260,  280,  250,  235,
			 1848, 5260, 5260, 1857,  156, 5260,  289,  354,  291,  369,
			  305,  396,  355, 5260,   97,  365, 5260,  422, 1854,  513,
			  540, 5260,   88,  697, 5260,  162, 1830, 5260, 1818, 5260,

			 1811,    0,  696, 1805, 1799, 1769,  733, 5260,  368,  511,
			  611,  754,  688,  765, 5260, 5260,  497,  789,    0,  794,
			  798,  803,  823,  828,  837,  842,  857,  872,  879,  888,
			  894,  916,  923,  930,  938,  952,  956, 1004,  985,  989,
			 1083, 1028, 1092, 1116, 1068, 1123, 1130, 1164, 1168, 1753,
			  382, 1712, 5260,  421, 1733,    0, 1234, 1718,  247,  332,
			  410, 1656, 1688, 1180,  437,  607,  489,  424,  501,  479,
			  497,  744,  551,  598,  870,  747,  936,  743,  762,  846,
			  831, 1673,  144,  780,  795, 1639,  835,  912,  113,  875,
			  900,  887,  948,  937,  937,  992,  966,  939,  938,  994,

			  945, 1021,  972, 1121,  995,  995, 1001,  313,  455, 5260,
			 1683, 5260,  622, 5260, 5260, 1123,  636, 1089, 1120, 1139,
			  707, 5260, 1634,  817,  703, 1627,  709, 1624, 5260, 1037,
			 1183, 5260, 1660, 1215,  167, 1314,  297,  770, 1405, 5260,
			 5260, 1618, 1225, 5260, 5260, 5260, 1616, 1224, 1597, 1591,
			 1583, 1579, 1074,  699, 5260, 1440, 1241, 1213, 1567, 1525,
			 1253, 1446, 1264, 1463, 1247, 1393, 5260,    0, 1515, 1489,
			 1496, 1504, 1511, 1526, 1530, 1545, 1552, 1559, 1567, 1594,
			 1112, 1609, 1613, 1627, 1635, 1642, 1657, 1672, 1399, 1689,
			 1698, 1405, 1704, 1719, 1728, 1715, 1744, 1767, 1771, 1785,

			 1793, 1789, 1819, 1827, 1833, 1841, 1847, 1518, 1858, 1883,
			 5260,  749, 1519, 1028, 1038,    0,  320, 1892, 1900, 1189,
			 1140, 1519, 1098, 1531, 1125, 1176, 1456, 1206, 1438, 1451,
			 1447, 1524, 1510, 1529, 1450, 1470, 1548,  799, 1581, 1473,
			 1541, 1551, 1587, 1619, 1563, 1641,    0, 1495, 1579, 1602,
			 1654, 1651, 1602, 1666, 1738, 1741, 1688, 1698, 1430, 1803,
			 1739,  951,    0, 1463,  386, 1786, 1672,  427, 1798,  939,
			 1807, 1848, 1851,  366, 5260, 1420, 1431, 1926, 5260, 1286,
			 1427, 1428, 1939, 5260, 5260, 1935, 5260, 5260, 5260, 5260,
			 5260, 1909, 1927, 1941, 1954,  985, 1964, 1970, 1987, 1993,

			 1999, 2015, 2024, 2030, 2036,    0, 1381, 2058, 2062, 2076,
			 2080, 2094, 2110, 2124, 2132, 2139, 2159, 2040, 2165, 2173,
			 2179, 2193, 2207, 2211, 2220, 2213, 2217, 2253, 2283, 2289,
			 2295, 2306, 2319, 2334, 2356, 2362, 2064, 2371, 2387, 2391,
			 2396, 2405,  456, 2420, 2437, 1232,    0, 1733,  770, 2448,
			 1795,  851, 1754, 1816, 1822, 1835, 1963, 2055,    0, 1848,
			 1921, 1263, 1955, 1950, 1961, 2036, 2071, 2072, 2075, 2083,
			 2145, 2142, 2106, 2231, 2114, 2124, 2178, 2189,    0,    0,
			 1242, 1240, 2188, 2222, 2229, 2213, 2354, 1203, 1201, 5260,
			 2427, 2458, 2467, 2475, 1170, 2481, 2487, 2498, 2504, 2510,

			 2526,  155, 2538, 2550, 2320,  316, 1162, 2537, 2572, 2576,
			 2580, 2594, 2598, 2602, 2620, 2639, 1136, 2648, 2655, 2664,
			 2670, 2692, 2696, 5260, 2705, 2720, 2726, 2741, 2755, 2355,
			 2764, 2791, 2805, 2809, 2663,  541, 2242, 2290, 5260, 1468,
			  989,    0, 1097, 2818, 1132, 1080, 2285, 2370, 2279, 2299,
			 2496, 2401, 2358, 2606, 2547, 2770,    0, 2361, 1119, 2479,
			 2503,    0, 2577, 2600, 2550, 2622, 2541, 2554, 2574, 2671,
			 2556, 2600, 2598, 2645, 2674, 2720, 1067, 2836, 2844, 2862,
			 2868, 2882, 2888, 1060, 2894, 2900, 2908, 2827, 5260, 2914,
			    0, 2936, 2941, 2955, 2969, 2975, 2984, 3000, 3009, 2755,

			 3014, 3018, 3036, 3040, 3044, 3071, 5260, 1075, 3081, 3096,
			 3101, 3110, 2793, 2923, 2925,  592, 5260, 5260, 1563, 1679,
			 3126, 2661, 1080,    0, 1066, 2663,    0, 2741, 1063, 2757,
			 2761,    0, 2930, 2927, 1051, 2803, 2823, 2921, 2954, 3016,
			 2933, 3021, 2970, 2973, 3066, 3093,    0, 2985, 3037, 3076,
			 1043, 3105, 3137, 1031, 3161, 3144, 3167, 3134, 3184, 1032,
			 3190, 3196, 3202,    0, 3224, 3228, 3232, 3246, 3250, 3216,
			 3268, 3272, 3277, 3286, 3302, 3264, 3306, 3320, 3328, 1020,
			  988,  968,  964,    0, 3329, 3078, 3085, 3217,    0, 3138,
			  895, 3225,    0,    0,    0,  877,  865,    0,  852, 3131,

			    0, 3227,  817, 3279, 3279, 3302, 3303, 3351, 3357, 3373,
			 3384, 2856, 3390, 3373, 3396,  800, 3418, 3426, 3433, 5260,
			 3440, 3410, 3460, 3468, 3486, 3418, 3447, 3448, 3470,  801,
			  608, 3307, 3315, 3419, 3364, 3412, 3422, 3472, 3457, 3462,
			    0, 3490,  496, 3515, 3521, 3527, 3534, 3540, 3546, 5260,
			 3552,    0, 3574, 3578, 3582, 3600, 5260, 3614, 3618, 3563,
			 3577, 3599, 3602, 3127, 3553, 3547, 3583,    0,  536, 3602,
			 3622,    0, 3594,  533, 3652,  490, 3658, 3676, 3682,    0,
			 3705, 3709, 3727, 3731, 1234, 5260, 1823,  474, 5260, 3620,
			 1042, 2738, 3609, 3642, 1425, 2056, 3729,  273, 3753, 3759,

			 3773, 3778, 3740, 3757, 3779, 3612,    0,  398,    0,  382,
			 3642, 3812, 3818,    0,  309, 3840, 3845, 3817, 3822, 3836,
			 1619, 3656, 3702,    0, 3494, 3859, 3873,  351,  287,  531,
			 3694,    0, 3874, 3507, 5260,  697, 3890, 3901, 3886, 3888,
			 3704, 3921, 3927, 3950, 3922, 3928,    0, 3961, 3908,  138,
			   82, 3979, 3985, 3805, 5260, 3741, 3941, 3991, 3998, 3993,
			 3994, 4006, 3804, 5260, 5260, 4012, 4027, 4033, 5260, 4039,
			 4051, 4057, 4063, 5260, 4103, 4139, 4175, 4211, 4247, 4071,
			 4274, 4308, 4338, 4373, 4409, 4445, 4481, 4516, 4551, 4587,
			 4623, 4653, 4688, 4715, 4743, 4258, 4778, 4814, 4849, 4870,

			 4896, 4931, 4957, 4991, 5026, 5060, 5080, 5105, 4079, 5134,
			 5154, 5179, 5199, 5224, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  873,    1,  874,  874,  875,  875,  873,    7,  876,
			  876,  873,  873,  873,  873,  873,  877,  873,  878,  879,
			  873,  873,  873,  873,  873,  873,  880,  873,  873,  873,
			  873,  873,  873,  873,  873,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  882,  873,  873,  883,  873,   55,   55,  873,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  873,  873,  873,  884,  873,  873,  873,  884,  884,  884,
			  884,  884,  885,  873,  886,  885,  873,  887,  873,  887,
			  887,  873,  888,  889,  873,  873,  873,  873,  877,  873,

			  890,  890,  890,  891,  892,  873,  873,  873,  893,  873,
			  873,  873,  873,  873,  873,  873,  873,  881,  894,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,   46,  881,  881,
			  881,  881,   46,  881,  881,  881,  881,  881,  881,  882,
			  882,  883,  873,  873,  873,  895,   58,  873,  156,  156,
			  156,  873,   58,   58,   58,   58,   58,  156,   58,  156,
			  156,   58,   58,  156,  156,   58,   58,  156,  156,   58,
			   58,  156,   58,  156,  156,  156,   58,   58,   58,  156,
			   58,  156,   58,  156,  156,   58,   58,  156,  156,   58,

			   58,  156,  156,   58,   58,  156,   58,  156,   58,  873,
			  884,  873,  873,  873,  873,  884,  884,  884,  884,  884,
			  885,  873,  896,  885,  886,  897,  886,  896,  873,  887,
			  887,  873,  873,  873,  873,  873,  873,  888,  889,  873,
			  873,  238,  898,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  880,  873,
			  873,  873,  873,  873,  873,  873,  873,  899,  894,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  873,  881,  881,  881,  881,  881,  881,  881,  873,  881,
			  289,  289,  289,  289,  140,  140,  140,  881,  881,  881,

			  881,  881,  881,  881,  881,  881,  881,  873,  882,  882,
			  873,  900,  873,  156,  156,  156,  873,  873,  156,   58,
			   58,   58,  156,   58,  156,  156,   58,   58,  156,  156,
			  156,   58,   58,   58,  156,  156,   58,   58,  873,  156,
			  156,  156,   58,   58,  156,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,   58,   58,  156,  156,  156,   58,
			   58,   58,  156,   58,  156,   58,  884,  884,  884,  884,
			  884,  884,  884,  896,  873,  897,  901,  901,  873,  901,
			  901,  901,  898,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  902,  894,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  873,  881,  881,
			  881,  881,  881,  881,  873,  289,  140,  289,  137,  289,
			  137,  873,  289,  289,  881,  881,  873,  881,  881,  881,
			  881,  881,  903,  882,  882,  873,  904,  156,  156,  873,
			   58,   58,  156,   58,  156,  156,   58,   58,  156,  156,
			  156,   58,   58,   58,  156,  156,   58,  156,  156,  156,
			   58,   58,  156,   58,  156,  156,   58,   58,  156,  156,
			   58,   58,  156,  156,  156,   58,   58,  156,   58,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  873,  902,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  873,  881,  881,  881,
			  881,  881,  881,  873,  289,  289,  873,  289,  527,  873,
			  881,  881,  881,  881,  899,  873,  905,  903,  873,  873,
			  873,  156,  156,  873,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,   58,   58,  156,  156,   58,  156,
			  156,  156,   58,   58,  156,   58,  156,  156,   58,   58,
			  156,  156,  156,  156,   58,   58,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  906,  881,  881,  881,  881,  881,  881,  881,  881,  873,

			  881,  881,  881,  881,  881,  289,  873,  873,  881,  881,
			  881,  881,  873,  902,  902,  905,  873,  873,  873,  873,
			  873,  156,  873,  156,   58,  156,  156,   58,   58,  156,
			  156,  156,   58,   58,   58,  156,  156,  156,   58,   58,
			  156,   58,  156,  156,   58,   58,  156,  156,  156,  156,
			   58,   58,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  907,  881,  881,  881,  881,  881,  873,
			  881,  881,  881,  881,  881,  873,  881,  881,  881,  873,
			  873,  902,  902,  908,  873,  156,  156,   58,  156,  156,
			   58,   58,  156,  156,  156,   58,   58,  156,   58,  156,

			  156,   58,   58,  156,  156,  156,   58,  873,  873,  873,
			  873,  873,  873,  873,  873,  907,  881,  881,  881,  873,
			  881,  873,  881,  881,  881,  873,  873,  906,  906,  909,
			  873,  156,  156,   58,  156,   58,  156,   58,  156,  156,
			  156,   58,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  910,  881,  881,  881,  881,  873,  881,  881,  873,
			  873,  907,  907,  873,  156,  156,   58,  156,   58,  156,
			   58,  156,  156,   58,  873,  873,  873,  873,  873,  911,
			  881,  881,  881,  881,  873,  873,  907,  907,  873,  156,
			  156,   58,  156,   58,  156,  873,  873,  911,  881,  881,

			  881,  881,  873,  873,  907,  156,  156,   58,  156,   58,
			  156,  873,  873,  912,  873,  881,  881,  873,  873,  907,
			  156,  156,  873,  913,  873,  881,  881,  873,  873,  907,
			  156,  156,  873,  873,  873,  913,  873,  881,  873,  873,
			  156,  873,  873,  881,  873,  873,  156,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,    0,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    1,    8,    1,    1,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   19,
			   20,   21,   22,   22,   22,   23,   23,   23,   24,   25,
			   26,   27,   28,   29,    1,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   36,   36,   39,   40,   41,   42,
			   43,   44,   45,   46,   47,   48,   36,   49,   50,   51,
			   52,   53,   54,   55,   56,   57,    1,   58,   59,   60,

			   61,   62,   63,   64,   65,   66,   64,   64,   67,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,   80,   64,   81,   82,   83,   84,    1,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,    1,    1,   88,   88,   88,   88,   88,   88,

			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   89,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   91,   92,   92,   92,   92,   92,   92,   92,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,    9,   10,   11,   11,
			   11,   11,   12,   13,    1,    1,   14,    1,   15,    1,
			   16,   17,   18,   19,   20,   21,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   22,
			   16,   16,   23,   24,   25,   26,    5,   11,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,    5,    5,   36,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
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
			    0,  110,    0,  108,    0,    0,   90,    0,    0,   96,
			   96,   38,   96,   96,   96,   96,   96,   96,   96,   96,
			    0,   96,   96,   96,   96,   41,   96,   96,    0,   81,
			   82,   81,   81,   81,   88,   96,   88,   88,   88,   96,

			   96,   96,   96,   96,   96,   40,   96,    0,    0,    0,
			   98,  101,    0,   99,   99,   38,    0,   71,   71,   99,
			   99,   38,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,    0,   99,
			   99,   99,   99,   99,   99,   99,   41,   41,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   40,   40,   99,   99,  120,  120,  120,  120,
			  120,  120,  120,    0,  104,  105,    0,    0,   69,   67,
			   66,   70,    0,  128,  131,  131,  129,  125,  126,  127,
			   91,  114,    0,  114,    0,    0,    0,  110,    0,    0,

			    0,  113,  108,    0,    0,    0,   97,   96,   96,   96,
			   96,   96,   37,   96,   96,   96,   96,    0,   96,   96,
			   96,   96,   96,   96,    0,   96,   80,   96,   96,   96,
			   96,    0,   80,   80,   80,   36,    0,   43,   96,   96,
			   96,   96,   65,    0,    0,    0,   61,   99,   99,    0,
			   99,   99,   99,   99,   99,   99,   99,   99,   37,   99,
			   99,   37,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   36,   43,
			   36,   43,   99,   99,   99,   99,   99,   99,   99,  105,
			  114,    0,    0,    0,  109,  110,    0,  111,    0,  113,

			    0,    0,    0,  108,   77,    0,    0,   58,   96,   96,
			   96,   96,   96,   96,   44,   96,    0,   96,   96,   35,
			   96,   96,   96,   82,   82,   81,    0,   96,   96,    0,
			   96,   96,   96,   96,    0,   65,   65,    0,   64,   64,
			    0,   58,   99,    0,   58,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   44,   99,   44,   99,
			   99,   35,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  114,    0,    0,  110,
			  111,    0,    0,  113,    0,    0,    0,    0,   77,    0,
			    0,   96,   59,   96,   60,   96,   96,   46,   96,    0,

			   96,   96,   96,   96,   96,   96,   80,    0,   52,   96,
			   96,   96,    0,    0,    0,    0,   63,   62,    0,    0,
			    0,   99,    0,   59,   59,   99,   60,   99,   60,   99,
			   99,   46,   99,   99,   46,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   52,   99,   99,   99,
			   52,   99,    0,  100,    0,  111,    0,  114,    0,   79,
			    0,    0,  112,    0,   96,   96,   57,   96,   45,    0,
			   42,   56,   34,   96,   50,    0,   96,   96,   96,    0,
			    0,    0,    0,    0,    0,   99,   99,   99,   57,   99,
			   57,   99,   45,   42,   56,   42,   56,   34,   34,   99,

			   50,   99,   50,   99,   99,   99,   99,    0,  111,    0,
			    0,    0,    0,   76,  112,    0,   96,   96,   96,   85,
			   96,    0,   96,   96,   53,    0,    0,    0,    0,    0,
			  101,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   53,   99,  113,    0,  113,    0,    0,    0,    0,   76,
			  112,    0,   96,   96,   47,   96,   84,   51,   96,    0,
			    0,    0,    0,    0,   99,   99,   99,   47,   47,   99,
			   99,   51,   99,   51,  113,   78,    0,   76,  112,    0,
			   96,   96,   96,   96,   83,   83,   83,   83,   92,   99,
			   99,   99,   99,   99,   99,    0,    0,    0,   96,   49,

			   48,   96,    0,    0,    0,   99,   49,   49,   48,   48,
			   99,    0,    0,    0,    0,   96,   96,    0,    0,    0,
			   99,   99,   75,    0,    0,   96,   54,    0,    0,    0,
			   99,   54,    0,    0,   75,    0,   72,   96,    0,    0,
			   99,    0,    0,   55,    0,    0,   55,    0,   74,    0,
			    0,    0,    0,    0,   74,    0,    0,    0,    0,    0,
			    0,    0,   73,   86,   87,    0,    0,    0,   73,    0,
			   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5260
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 873
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 874
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

	odin_parser: ODIN_VALIDATOR
		once
			create Result.make
		end

	odin_parser_error: ERROR_ACCUMULATOR

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

	c_domain_type: detachable C_DOMAIN_TYPE

	tid: INTEGER

end
