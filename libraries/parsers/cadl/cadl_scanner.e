note
	component:   "openEHR Archetype Project"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

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
if yy_act <= 101 then
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
if yy_act <= 93 then
if yy_act <= 89 then
if yy_act <= 87 then
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
--|#line 351 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 351")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 88 then
--|#line 361 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 361")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
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
if yy_act <= 91 then
if yy_act = 90 then
--|#line 376 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 376")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 383 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 383")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 92 then
--|#line 389 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 389")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 395 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 395")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
end
end
else
if yy_act <= 97 then
if yy_act <= 95 then
if yy_act = 94 then
--|#line 399 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 399")
end
 -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of dADL
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_lineno := in_lineno + str_.occurrences('%N')

				-- perform any upgrades to embedded dADL object syntax here by substitution
				convert_c_dv_names(str_)

				dadl_parser.execute(str_, source_start_line + in_lineno)
				if not dadl_parser.syntax_error then
					if dadl_parser.output.is_typed then
						tid := dynamic_type_from_string(dadl_parser.output.im_type_name)
						if tid >= 0 then
							if attached {C_DOMAIN_TYPE} dadl_parser.output.as_object(tid, Void) as cdt then
								c_domain_type := cdt
								last_token := V_C_DOMAIN_TYPE
							else
								dadl_parser_error := "Conversion of " + dadl_parser.output.im_type_name + " failed"
								last_token := ERR_C_DOMAIN_TYPE
							end
						else
							dadl_parser_error := "Domain type " + dadl_parser.output.im_type_name + " unknown or not visible in type system"
							last_token := ERR_C_DOMAIN_TYPE
						end
					else
						dadl_parser_error := "Domain type in dADL section not typed"
						last_token := ERR_C_DOMAIN_TYPE
					end
				else
					dadl_parser_error := dadl_parser.errors.last_added.message
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
else
--|#line 440 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 440")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
else
if yy_act = 96 then
--|#line 446 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 446")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 452 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 452")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 99 then
if yy_act = 98 then
--|#line 458 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 458")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 465 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 465")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 100 then
--|#line 471 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 471")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_ABS_PATH
				last_string_value := text
			
else
--|#line 477 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 477")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_REL_PATH
				last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 118 then
if yy_act <= 110 then
if yy_act <= 106 then
if yy_act <= 104 then
if yy_act <= 103 then
if yy_act = 102 then
--|#line 483 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 483")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
--|#line 494 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 494")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
else
if yy_act = 105 then
--|#line 498 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 498")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 502 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 502")
end
 		-- match final segment
				in_buffer.append_string (text)

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 108 then
if yy_act = 107 then
--|#line 514 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 514")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 521 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 521")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 109 then
--|#line 526 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 526")
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
--|#line 541 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 541")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 114 then
if yy_act <= 112 then
if yy_act = 111 then
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
if yy_act = 113 then
	yy_end := yy_end - 1
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
if yy_act <= 116 then
if yy_act = 115 then
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
if yy_act = 117 then
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
if yy_act <= 126 then
if yy_act <= 122 then
if yy_act <= 120 then
if yy_act = 119 then
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
if yy_act = 121 then
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
if yy_act <= 124 then
if yy_act = 123 then
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
if yy_act = 125 then
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
if yy_act <= 130 then
if yy_act <= 128 then
if yy_act = 127 then
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
if yy_act = 129 then
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
if yy_act <= 132 then
if yy_act = 131 then
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
if yy_act = 133 then
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
			create an_array.make_filled (0, 0, 5572)
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

			  101,   95,   75,   95,   95,  105,  874,  106,  106,  106,
			  106,  106,  106,  109,  225,  110,  238,  111,  111,  111,
			  111,  111,  111,  116,  116,  177,  116,  181,  268,  189,
			   84,   85,   84,   85,  109,  173,  110,  178,  113,  113,
			  113,  113,  113,  113,   76,  102,  174,  118,  191,   76,
			   94,  226,  227,  179,   94,  182,  112,  190,  212,  268,
			  212,  212,  873,  175,   95,  180,   95,   95,  339,  234,
			  342,  239,  234,  589,  589,  176,  192,  112,   77,   78,
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
			  116,  116,  193,  116,  116,  116,  207,  116,  831,  832,
			  116,  116,  205,  116,  314,  194,  213,  197,  211,  236,

			  116,  116,  236,  116,  118,  198,  116,  116,  118,  116,
			  195,  857,  211,  119,  118,  208,  122,  120,  123,  121,
			  206,  201,  314,  196,  118,  199,  202,  124,  116,  116,
			  118,  116,  594,  200,  133,  116,  116,  125,  116,  116,
			  116,  119,  116,  214,  122,  120,  123,  121,  126,  203,
			  116,  116,  118,  116,  204,  124,  127,  116,  116,  118,
			  116,  211,  133,  118,  365,  125,  116,  116,  128,  116,
			  129,  315,  221,  112,  118,  856,  211,  126,  216,  134,
			  450,  118,  228,  490,  127,  258,  842,  135,  130,  131,
			  118,  218,  218,  365,  132,  450,  128,  268,  129,  315,

			  136,  116,  116,  211,  116,  145,  308,  134,  222,  223,
			  146,  116,  116,  268,  116,  135,  130,  131,  222,  223,
			  374,  259,  132,  153,  229,  118,  153,  229,  136,  116,
			  116,  154,  116,  145,  211,  118,  143,  488,  146,  215,
			  215,  215,  309,  316,  144,  137,  137,  137,  137,  137,
			  137,  147,  268,  118,  217,  217,  217,  310,  537,  323,
			  138,  538,  116,  116,  143,  116,  488,  139,  167,  156,
			  268,  316,  144,  156,  140,  156,  141,  231,  142,  147,
			  169,  219,  219,  219,  314,  156,  118,  323,  138,  170,
			  770,  156,  183,  184,  162,  139,  168,  162,  185,  116,

			  116,  162,  116,  162,  268,  141,  365,  142,  171,  162,
			  162,  148,  320,  162,  216,  233,  268,  172,  233,  162,
			  186,  187,  316,  267,  325,  162,  188,  234,  235,  260,
			  260,  260,  260,  260,  260,  366,  323,  813,  236,  326,
			  148,  153,  233,  537,  153,  233,  537,  770,  268,  154,
			  322,  268,  325,  585,  234,  857,  155,  156,  156,  156,
			  156,  156,  156,  157,  324,  236,  268,  326,  231,  156,
			  156,  156,  156,  156,  158,  156,  156,  156,  159,  156,
			  160,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  161,  326,  891,  231,  156,  162,  162,  163,

			  162,  162,  164,  162,  162,  162,  165,  162,  166,  162,
			  162,  162,  162,  162,  163,  162,  162,  162,  162,  162,
			  153,  328,  268,  153,  212,  155,  212,  212,  154,  262,
			  262,  262,  262,  262,  262,  155,  156,  156,  156,  156,
			  156,  156,  157,  211,  329,  263,  315,  621,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  161,  329,  263,  321,  156,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  241,

			  241,  253,  241,  253,  253,  246,  266,  266,  266,  266,
			  266,  266,  831,  832,  247,  247,  247,  247,  247,  247,
			  225,  215,  215,  215,  221,  242,  376,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  248,  255,  255,  255,  255,  255,  255,  226,  227,  268,
			  222,  223,  268,  226,  227,  249,  155,  256,  109,  250,
			  110,  251,  264,  264,  264,  264,  264,  264,  265,  109,
			  243,  110,  335,  264,  264,  264,  264,  264,  264,  325,
			  257,  116,  116,  329,  116,  256,  116,  116,  238,  116,

			  116,  116,  446,  116,  268,  116,  116,  336,  116,  268,
			  335,  112,  782,  268,  268,  118,  770,  327,  268,  544,
			  118,  332,  112,  340,  118,  116,  116,  341,  116,  118,
			  116,  116,  502,  116,  228,  336,  272,  271,  268,  116,
			  116,  270,  116,  268,  116,  116,  268,  116,  544,  118,
			  268,  340,  268,  239,  118,  341,  466,  268,  273,  116,
			  116,  268,  116,  118,  272,  271,  268,  493,  118,  270,
			  222,  223,  268,  274,  116,  116,  336,  116,  340,  275,
			  268,  116,  116,  118,  116,  335,  273,  268,  276,  277,
			  116,  116,  268,  116,  268,  278,  116,  116,  118,  116,

			  544,  274,  330,  268,  338,  118,  343,  275,  331,  268,
			  268,  279,  281,  337,  118,  268,  276,  277,  116,  116,
			  118,  116,  345,  278,  280,  116,  116,  268,  116,  547,
			  330,  268,  116,  116,  347,  116,  331,  282,  268,  279,
			  116,  116,  118,  116,  341,  268,  211,  345,  283,  118,
			  345,  268,  280,  268,  116,  116,  118,  116,  116,  116,
			  268,  116,  347,  268,  118,  282,  268,  268,  330,  349,
			  350,  268,  344,  353,  331,  346,  283,  285,  118,  268,
			  284,  268,  118,  268,  287,  286,  354,  116,  116,  288,
			  116,  116,  116,  354,  116,  347,  333,  349,  350,  350, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  268,  353,  334,  746,  268,  285,  359,  268,  485,  268,
			  268,  118,  287,  286,  354,  118,  268,  288,  289,  268,
			  289,  356,  138,  348,  349,  218,  218,  352,  353,  359,
			  116,  116,  295,  116,  359,  745,  295,  290,  141,  229,
			  363,  291,  229,  268,  292,  495,  363,  744,  743,  625,
			  138,  117,  351,  293,  118,  294,  355,  362,  727,  357,
			  495,  138,  448,  358,  625,  290,  258,  141,  363,  291,
			  116,  116,  292,  116,  364,  295,  252,  252,  268,  252,
			  449,  268,  293,  268,  294,  116,  116,  357,  116,  138,
			  448,  358,  231,  824,  118,  268,  211,  268,  268,  268,

			  391,  296,  296,  296,  296,  296,  296,  268,  449,  118,
			  117,  117,  117,  117,  117,  117,  302,  155,  116,  116,
			  297,  116,  824,  298,  687,  116,  116,  211,  116,  299,
			  211,  268,  116,  116,  268,  116,  268,  626,  268,  295,
			  453,  418,  118,  117,  302,  268,  211,  268,  297,  118,
			  300,  298,  418,  301,  626,  268,  118,  299,  455,  357,
			  604,  303,  418,  358,  305,  304,  116,  116,  453,  116,
			  116,  116,  117,  116,  215,  215,  215,  595,  300,  268,
			  418,  301,  449,  268,  109,  233,  455,  360,  233,  303,
			  118,  361,  305,  304,  118,  268,  318,  234,  319,  319,

			  319,  319,  319,  319,  268,  372,  372,  372,  236,  306,
			  452,  367,  368,  369,  370,  371,  536,  233,  536,  307,
			  233,  268,  456,  448,  373,  373,  373,  383,  383,  234,
			  383,  395,  395,  395,  395,  395,  395,  306,  231,  820,
			  236,  385,  386,  386,  386,  386,  386,  386,  307,  268,
			  456,  451,  456,  242,  393,  268,  393,  268,  891,  394,
			  394,  394,  394,  394,  394,  404,  404,  404,  404,  404,
			  231,  397,  397,  397,  397,  397,  397,  401,  268,  401,
			  458,  821,  402,  402,  402,  402,  402,  402,  380,  379,
			  542,  380,  156,  156,  156,  156,  156,  156,  156,  156,

			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  377,  378,  379,  377,  378,
			  377,  377,  377,  377,  377,  377,  377,  377,  380,  235,
			  235,  377,  235,  235,  235,  235,  235,  235,  377,  381,
			  377,  377,  377,  377,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  377,  377,  382,
			  377,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  377,  377,  377,  377,  377,

			  377,  377,  377,  377,  377,  377,  377,  241,  241,  407,
			  241,  405,  405,  405,  405,  405,  405,  425,  425,  425,
			  425,  425,  425,  429,  429,  429,  429,  429,  429,  381,
			  379,  379,  381,  242,  379,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  392,  392,
			  392,  392,  392,  392,  398,  398,  398,  398,  398,  398,
			  623,  268,  459,  623,  256,  375,  828,  109,  268,  110,
			  399,  403,  403,  403,  403,  403,  403,  485,  243,  455,
			  460,  116,  116,  461,  116,  624,  465,  257,  116,  116,

			  459,  116,  256,  400,  268,  828,  116,  116,  399,  116,
			  268,  268,  468,  116,  116,  118,  116,  457,  460,  268,
			  112,  461,  118,  408,  465,  268,  268,  466,  116,  116,
			  118,  116,  116,  116,  268,  116,  447,  118,  409,  268,
			  468,  268,  443,  407,  268,  268,  268,  116,  116,  460,
			  116,  408,  118,  410,  116,  116,  118,  116,  459,  411,
			  268,  116,  116,  268,  116,  623,  409,  268,  623,  116,
			  116,  118,  116,  453,  268,  461,  412,  463,  118,  413,
			  469,  410,  268,  396,  891,  118,  462,  411,  390,  470,
			  624,  414,  389,  118,  465,  473,  116,  116,  313,  116,

			  388,  454,  268,  464,  412,  415,  387,  413,  469,  268,
			  418,  116,  116,  416,  116,  116,  116,  470,  116,  414,
			  118,  418,  467,  473,  268,  384,  468,  475,  268,  116,
			  116,  418,  116,  415,  268,  118,  476,  116,  116,  118,
			  116,  416,  268,  479,  116,  116,  891,  116,  419,  418,
			  268,  417,  420,  118,  471,  475,  268,  268,  469,  116,
			  116,  118,  116,  232,  476,  421,  268,  422,  118,  268,
			  848,  479,  268,  473,  116,  116,  419,  116,  374,  211,
			  420,  624,  375,  118,  624,  476,  472,  268,  374,  695,
			  211,  116,  116,  421,  116,  422,  342,  281,  118,  848,

			  480,  474,  475,  268,  268,  423,  424,  426,  426,  426,
			  426,  426,  426,  478,  317,  118,  428,  428,  428,  428,
			  428,  428,  430,  430,  430,  430,  430,  430,  480,  432,
			  477,  432,  483,  423,  424,  313,  427,  431,  431,  431,
			  431,  431,  431,  484,  311,  117,  117,  117,  117,  117,
			  117,  117,  433,  268,  268,  434,  268,  215,  215,  215,
			  483,  435,  117,  117,  117,  117,  117,  117,  152,  116,
			  116,  484,  116,  116,  116,  480,  116,  308,  543,  479,
			  433,  117,  268,  434,  484,  254,  268,  116,  116,  435,
			  116,  116,  116,  118,  116,  116,  116,  118,  116,  548,

			  268,  268,  253,  482,  268,  211,  543,  481,  268,  117,
			  268,  118,  487,  299,  211,  118,  252,  437,  268,  118,
			  245,  116,  116,  438,  116,   99,  436,  548,  820,  116,
			  116,  268,  116,   96,  268,  116,  116,  488,  116,  770,
			  543,  299,  268,  116,  116,  118,  116,  483,  268,  116,
			  116,  438,  116,  118,  436,  211,  268,  232,  211,  118,
			  550,  548,  268,  439,  211,  209,  489,  118,  546,  551,
			  822,  152,  440,  118,  444,  486,  444,  444,  444,  444,
			  444,  444,  308,  217,  217,  217,  150,  115,  550,  549,
			  441,  439,  219,  219,  219,  114,  554,  551,  442,  445,

			  440,  445,  445,  445,  445,  445,  445,  308,  318,  268,
			  318,  318,  318,  318,  318,  318,  318,  107,  319,  319,
			  319,  319,  319,  319,  554,  104,   99,  442,  378,  379,
			   97,  378,  550,  215,  215,  215,  215,  215,  215,   96,
			  380,  383,  383,  891,  383,  491,  491,  491,  491,  491,
			  491,  381,  385,  386,  386,  386,  386,  386,  386,  555,
			  552,  256,  891,  268,  829,  829,  829,  891,  394,  394,
			  394,  394,  394,  394,  492,  492,  492,  492,  492,  492,
			  268,  382,  551,  558,  257,  537,  891,  555,  538,  256,
			  494,  494,  494,  494,  494,  494,  496,  496,  496,  496, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  496,  496,  497,  497,  497,  497,  497,  497,  891,  559,
			  553,  558,  555,  493,  498,  561,  498,  562,  399,  499,
			  499,  499,  499,  499,  499,  500,  500,  500,  500,  500,
			  500,  402,  402,  402,  402,  402,  402,  559,  621,  891,
			  557,  400,  891,  561,  891,  562,  399,  501,  501,  501,
			  501,  501,  501,  503,  504,  891,  505,  505,  505,  505,
			  505,  505,  506,  506,  506,  506,  506,  506,  507,  507,
			  507,  507,  507,  507,  116,  116,  891,  116,  116,  116,
			  563,  116,  891,  518,  268,  891,  502,  268,  891,  891,
			  891,  268,  116,  116,  518,  116,  116,  116,  118,  116,

			  891,  891,  118,  558,  518,  268,  891,  531,  563,  268,
			  116,  116,  891,  116,  268,  891,  118,  509,  531,  268,
			  118,  891,  518,  268,  268,  510,  116,  116,  531,  116,
			  891,  560,  512,  891,  118,  511,  891,  561,  566,  268,
			  116,  116,  513,  116,  891,  509,  531,  268,  116,  116,
			  118,  116,  554,  268,  510,  116,  116,  562,  116,  891,
			  512,  268,  891,  511,  118,  564,  566,  891,  268,  566,
			  513,  891,  118,  568,  268,  116,  116,  891,  116,  118,
			  556,  116,  116,  569,  116,  565,  514,  516,  268,  116,
			  116,  891,  116,  515,  268,  116,  116,  567,  116,  118,

			  891,  568,  268,  517,  568,  118,  891,  268,  268,  116,
			  116,  569,  116,  118,  514,  516,  891,  519,  572,  118,
			  573,  515,  268,  116,  116,  891,  116,  116,  116,  891,
			  116,  517,  570,  118,  521,  520,  268,  569,  891,  612,
			  268,  289,  268,  289,  522,  519,  572,  118,  573,  891,
			  612,  118,  425,  425,  425,  425,  425,  425,  268,  891,
			  612,  891,  521,  520,  291,  571,  523,  526,  117,  628,
			  524,  117,  522,  574,  117,  572,  573,  117,  612,  891,
			  525,  289,  630,  289,  575,  428,  428,  428,  428,  428,
			  428,  891,  291,  891,  523,  526,  117,  628,  524,  117,

			  891,  574,  891,  576,  577,  117,  891,  526,  525,  620,
			  630,  891,  575,  891,  117,  429,  429,  429,  429,  429,
			  429,  430,  430,  430,  430,  430,  430,  431,  431,  431,
			  431,  431,  431,  631,  634,  526,  527,  526,  528,  528,
			  528,  528,  528,  528,  891,  891,  640,  591,  117,  591,
			  117,  529,  529,  529,  529,  529,  529,  891,  592,  622,
			  117,  631,  634,  268,  527,  526,  530,  530,  530,  530,
			  530,  530,  116,  116,  640,  116,  891,  117,  116,  116,
			  117,  116,  268,  891,  891,  268,  593,  116,  116,  117,
			  116,  268,  268,  891,  891,  117,  118,  891,  617,  824,

			  268,  628,  118,  116,  116,  641,  116,  116,  116,  618,
			  116,  118,  116,  116,  642,  116,  268,  891,  630,  619,
			  268,  116,  116,  891,  116,  268,  891,  118,  825,  629,
			  891,  118,  891,  641,  536,  891,  118,  618,  533,  891,
			  534,  268,  642,  891,  891,  118,  632,  891,  891,  532,
			  444,  535,  444,  444,  444,  444,  444,  444,  308,  631,
			  491,  491,  491,  491,  491,  491,  533,  445,  534,  445,
			  445,  445,  445,  445,  445,  308,  578,  532,  545,  535,
			  545,  545,  545,  545,  545,  545,  645,  633,  891,  540,
			  579,  579,  579,  579,  579,  579,  580,  580,  580,  580,

			  580,  580,  891,  891,  578,  891,  541,  581,  581,  581,
			  581,  581,  581,  582,  645,  582,  582,  582,  582,  582,
			  582,  583,  583,  583,  583,  583,  583,  891,  647,  493,
			  499,  499,  499,  499,  499,  499,  891,  399,  584,  584,
			  584,  584,  584,  584,  586,  586,  586,  586,  586,  586,
			  587,  587,  587,  587,  587,  587,  647,  268,  648,  891,
			  400,  116,  116,  635,  116,  399,  588,  588,  588,  588,
			  588,  588,  891,  268,  268,  636,  891,  585,  583,  583,
			  583,  583,  583,  583,  651,  118,  648,  647,  652,  502,
			  891,  635,  641,  504,  590,  505,  505,  505,  505,  505,

			  505,  116,  116,  636,  116,  116,  116,  268,  116,  891,
			  116,  116,  651,  116,  268,  649,  652,  891,  268,  891,
			  643,  268,  590,  268,  268,  118,  645,  116,  116,  118,
			  116,  891,  891,  268,  118,  116,  116,  597,  116,  634,
			  268,  891,  891,  635,  116,  116,  268,  116,  268,  598,
			  891,  118,  648,  891,  646,  636,  596,  268,  599,  118,
			  116,  116,  653,  116,  642,  597,  600,  637,  118,  116,
			  116,  638,  116,  268,  891,  891,  601,  598,  116,  116,
			  650,  116,  268,  639,  118,  891,  599,  654,  602,  891,
			  653,  268,  644,  118,  600,  116,  116,  891,  116,  891,

			  116,  116,  118,  116,  601,  891,  603,  891,  268,  660,
			  605,  891,  891,  268,  268,  654,  602,  116,  116,  118,
			  116,  891,  116,  116,  118,  116,  606,  681,  268,  891,
			  268,  891,  257,  651,  603,  268,  891,  660,  605,  116,
			  116,  118,  116,  891,  681,  697,  118,  652,  681,  607,
			  891,  891,  268,  691,  606,  610,  610,  610,  610,  610,
			  610,  655,  891,  118,  691,  608,  671,  671,  671,  671,
			  671,  609,  681,  697,  692,  656,  891,  607,  117,  117,
			  117,  117,  117,  117,  117,  528,  528,  528,  528,  528,
			  528,  891,  691,  608,  891,  698,  432,  268,  432,  609,

			  529,  529,  529,  529,  529,  529,  891,  116,  116,  891,
			  116,  891,  698,  611,  530,  530,  530,  530,  530,  530,
			  268,  691,  434,  698,  891,  891,  700,  268,  435,  117,
			  891,  118,  693,  891,  116,  116,  117,  116,  268,  613,
			  699,  611,  694,  701,  891,  704,  700,  268,  116,  116,
			  434,  116,  116,  116,  700,  116,  435,  891,  118,  891,
			  693,  268,  705,  268,  117,  268,  614,  613,  706,  705,
			  891,  701,  118,  704,  702,  545,  118,  545,  545,  545,
			  545,  545,  545,  658,  658,  658,  658,  658,  658,  701,
			  705,  615,  616,  657,  614,  657,  706,  707,  658,  658,

			  658,  658,  658,  658,  659,  659,  659,  659,  659,  659,
			  891,  891,  891,  709,  627,  711,  712,  703,  891,  615,
			  616,  582,  493,  582,  582,  582,  582,  582,  582,  583,
			  583,  583,  583,  583,  583,  663,  663,  663,  663,  663,
			  663,  709,  891,  711,  712,  662,  664,  664,  664,  664,
			  664,  664,  665,  665,  665,  665,  665,  665,  891,  891,
			  661,  666,  666,  666,  666,  666,  666,  667,  667,  667,
			  667,  667,  667,  662,  585,  668,  668,  668,  668,  668,
			  668,  669,  891,  669,  891,  268,  666,  666,  666,  666,
			  666,  666,  670,  670,  670,  670,  670,  670,  692,  891, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  502,  673,  673,  673,  673,  673,  673,  116,  116,  694,
			  116,  891,  116,  116,  268,  116,  709,  674,  891,  694,
			  268,  737,  891,  715,  716,  268,  116,  116,  891,  116,
			  268,  118,  717,  706,  725,  676,  118,  694,  737,  268,
			  116,  116,  737,  116,  710,  674,  116,  116,  712,  116,
			  118,  715,  716,  268,  677,  116,  116,  400,  116,  268,
			  717,  708,  725,  676,  118,  891,  737,  268,  268,  891,
			  118,  116,  116,  749,  116,  750,  714,  752,  678,  118,
			  116,  116,  677,  116,  268,  116,  116,  891,  116,  116,
			  116,  891,  116,  268,  679,  118,  891,  715,  268,  754,

			  268,  749,  268,  750,  118,  752,  678,  116,  116,  118,
			  116,  116,  116,  118,  116,  116,  116,  680,  116,  711,
			  268,  683,  679,  891,  268,  718,  268,  754,  268,  682,
			  891,  118,  891,  891,  891,  118,  756,  891,  757,  118,
			  891,  758,  891,  685,  891,  680,  686,  713,  891,  683,
			  750,  684,  116,  116,  289,  116,  289,  682,  610,  610,
			  610,  610,  610,  610,  756,  268,  757,  116,  116,  758,
			  116,  685,  116,  116,  686,  116,  118,  891,  751,  684,
			  268,  116,  116,  739,  116,  268,  891,  117,  891,  891,
			  891,  118,  268,  891,  268,  891,  118,  783,  891,  891,

			  739,  891,  689,  891,  739,  118,  891,  891,  891,  752,
			  688,  696,  690,  696,  696,  696,  696,  696,  696,  658,
			  658,  658,  658,  658,  658,  783,  116,  116,  739,  116,
			  689,  658,  658,  658,  658,  658,  658,  753,  688,  268,
			  690,  719,  719,  719,  719,  719,  719,  720,  891,  720,
			  118,  891,  721,  721,  721,  721,  721,  721,  722,  891,
			  722,  891,  891,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  724,  724,  724,  724,  724,
			  724,  666,  666,  666,  666,  666,  666,  726,  726,  726,
			  726,  726,  726,  666,  666,  666,  666,  666,  666,  728,

			  728,  728,  728,  728,  728,  891,  891,  891,  585,  729,
			  729,  729,  729,  729,  729,  730,  730,  730,  730,  730,
			  730,  764,  764,  764,  764,  116,  116,  731,  116,  731,
			  784,  725,  732,  732,  732,  732,  732,  732,  268,  116,
			  116,  891,  116,  116,  116,  891,  116,  116,  116,  118,
			  116,  268,  268,  891,  400,  786,  268,  891,  784,  725,
			  268,  116,  116,  118,  116,  268,  891,  118,  734,  116,
			  116,  118,  116,  736,  268,  891,  735,  754,  116,  116,
			  891,  116,  268,  786,  756,  118,  116,  116,  891,  116,
			  891,  268,  788,  118,  116,  116,  734,  116,  891,  268,

			  891,  736,  118,  268,  735,  755,  775,  268,  116,  116,
			  118,  116,  759,  116,  116,  891,  116,  891,  118,  891,
			  788,  268,  786,  775,  891,  738,  268,  775,  116,  116,
			  790,  116,  118,  782,  782,  778,  782,  118,  891,  778,
			  740,  268,  721,  721,  721,  721,  721,  721,  741,  891,
			  787,  775,  118,  738,  891,  891,  778,  806,  790,  696,
			  742,  696,  696,  696,  696,  696,  696,  778,  740,  760,
			  760,  760,  760,  760,  760,  891,  741,  723,  723,  723,
			  723,  723,  723,  766,  767,  766,  767,  891,  742,  723,
			  723,  723,  723,  723,  723,  891,  891,  891,  748,  761,

			  761,  761,  761,  761,  761,  762,  891,  762,  493,  891,
			  763,  763,  763,  763,  763,  763,  765,  765,  765,  765,
			  765,  765,  768,  665,  665,  665,  665,  665,  665,  732,
			  732,  732,  732,  732,  732,  116,  116,  268,  116,  725,
			  769,  769,  769,  769,  769,  769,  891,  891,  268,  891,
			  116,  116,  891,  116,  788,  891,  891,  116,  116,  118,
			  116,  891,  400,  268,  891,  771,  891,  725,  891,  891,
			  268,  891,  116,  116,  118,  116,  891,  116,  116,  502,
			  116,  118,  789,  268,  779,  268,  772,  891,  779,  773,
			  268,  116,  116,  771,  116,  268,  118,  116,  116,  778,

			  116,  118,  774,  780,  268,  779,  784,  779,  776,  791,
			  268,  781,  807,  790,  772,  118,  779,  773,  891,  891,
			  780,  118,  808,  777,  891,  891,  891,  891,  781,  891,
			  774,  780,  891,  891,  785,  891,  776,  791,  891,  781,
			  807,  792,  719,  719,  719,  719,  719,  719,  810,  812,
			  808,  777,  763,  763,  763,  763,  763,  763,  793,  793,
			  793,  793,  793,  793,  794,  794,  794,  794,  794,  794,
			  593,  593,  593,  593,  593,  593,  810,  812,  891,  891,
			  891,  493,  795,  795,  795,  795,  795,  795,  796,  796,
			  796,  796,  796,  796,  823,  891,  891,  585,  726,  726,

			  726,  726,  726,  726,  116,  116,  802,  116,  116,  116,
			  802,  116,  116,  116,  803,  116,  891,  268,  803,  891,
			  802,  268,  823,  268,  804,  268,  268,  802,  118,  268,
			  116,  116,  118,  116,  891,  803,  118,  502,  802,  798,
			  891,  804,  810,  268,  116,  116,  803,  116,  116,  116,
			  826,  116,  804,  799,  118,  803,  835,  268,  808,  805,
			  826,  268,  800,  838,  835,  891,  891,  798,  118,  891,
			  811,  891,  118,  891,  891,  891,  805,  835,  826,  839,
			  891,  799,  849,  891,  891,  891,  809,  805,  827,  891,
			  800,  838,  835,  801,  761,  761,  761,  761,  761,  761,

			  814,  814,  814,  814,  814,  814,  766,  839,  766,  858,
			  849,  796,  796,  796,  796,  796,  796,  116,  116,  864,
			  116,  801,  116,  116,  891,  116,  116,  116,  891,  116,
			  268,  116,  116,  585,  116,  268,  891,  858,  891,  268,
			  891,  118,  891,  891,  268,  768,  118,  864,  891,  816,
			  118,  116,  116,  891,  116,  118,  830,  830,  830,  830,
			  830,  830,  891,  891,  268,  116,  116,  891,  116,  891,
			  818,  817,  770,  116,  116,  118,  116,  816,  268,  891,
			  819,  116,  116,  836,  116,  836,  268,  845,  891,  118,
			  891,  836,  891,  837,  268,  845,  833,  118,  818,  891,

			  817,  891,  891,  891,  836,  118,  837,  891,  845,  819,
			  840,  840,  840,  840,  840,  840,  891,  891,  891,  836,
			  891,  837,  834,  845,  833,  768,  768,  768,  768,  768,
			  768,  116,  116,  846,  116,  116,  116,  891,  116,  770,
			  850,  846,  850,  891,  268,  891,  891,  862,  268,  891,
			  834,  851,  846,  891,  846,  118,  891,  891,  862,  118,
			  847,  854,  854,  854,  854,  854,  891,  844,  862,  846,
			  891,  891,  891,  847,  116,  116,  891,  116,  891,  852,
			  843,  116,  116,  891,  116,  863,  862,  268,  847,  860,
			  860,  860,  860,  860,  268,  844,  863,  891,  118,  859, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  859,  859,  859,  859,  859,  118,  863,  891,  891,  843,
			  116,  116,  891,  116,  891,  855,  854,  854,  854,  854,
			  854,  854,  891,  268,  863,  865,  865,  865,  865,  865,
			  865,  891,  891,  877,  118,  866,  866,  866,  866,  866,
			  866,  867,  861,  855,  116,  116,  891,  116,  868,  870,
			  877,  870,  867,  891,  877,  891,  891,  268,  891,  868,
			  871,  891,  867,  876,  876,  876,  876,  876,  118,  868,
			  861,  869,  869,  869,  869,  869,  869,  891,  877,  878,
			  867,  852,  852,  852,  852,  852,  852,  868,  872,  875,
			  875,  875,  875,  875,  875,  891,  878,  881,  882,  891,

			  878,  879,  879,  879,  879,  879,  879,  880,  880,  880,
			  880,  880,  880,  891,  881,  882,  891,  891,  881,  882,
			  884,  885,  884,  885,  878,  883,  883,  883,  883,  883,
			  883,  872,  872,  872,  872,  872,  872,  891,  891,  891,
			  891,  891,  881,  882,  887,  887,  887,  887,  887,  887,
			  888,  888,  888,  888,  888,  888,  891,  891,  891,  886,
			  889,  889,  889,  889,  889,  889,  884,  891,  884,  891,
			  891,  888,  888,  888,  888,  888,  888,  890,  890,  890,
			  890,  890,  890,  886,  886,  886,  886,  886,  886,  103,
			  103,  103,  103,  103,  103,  103,  103,  747,  747,  747,

			  747,  747,  747,  747,  747,  886,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   98,   98,  891,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  891,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,  100,  100,
			  891,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  108,  312,  312,  312,

			  312,  312,  312,  312,  312,  312,  891,  891,  891,  891,
			  891,  891,  891,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  117,  117,  117,  891,  891,  891,  891,  891,
			  891,  891,  117,  117,  117,  117,  891,  117,  117,  117,
			  117,  117,  117,  117,  117,  891,  891,  891,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  149,  149,  891,
			  149,  149,  891,  149,  149,  149,  891,  891,  149,  149,
			  149,  149,  149,  149,  149,  149,  891,  891,  891,  149,
			  149,  149,  149,  149,  149,  149,  149,  149,  151,  151,
			  891,  151,  151,  151,  151,  151,  151,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  210,  210,  891,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  891,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  230,  891,  230,  891,  891,  891,  891,  230,  230,  891,
			  230,  230,  230,  891,  891,  230,  230,  230,  230,  230,
			  230,  230,  230,  891,  891,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  244,  244,  891,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  103,
			  891,  891,  891,  891,  103,  103,  103,  891,  891,  103,

			  103,  103,  103,  103,  103,  103,  103,  891,  891,  891,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  108,  108,  108,
			  108,  891,  891,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  891,  891,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  891,  261,  261,  261,  261,  261,  261,  261,

			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  269,  891,  891,  891,  269,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  891,  891,
			  891,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  891,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  243,  243,  243,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  243,  406,  406,  406,  406,  406,  406,  406,  406,
			  891,  891,  891,  406,  406,  406,  406,  406,  406,  406,
			  406,  406,  312,  312,  312,  312,  891,  891,  312,  312,
			  312,  312,  312,  312,  312,  312,  312,  891,  891,  312,

			  312,  312,  312,  312,  312,  312,  312,  312,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  508,  508,  508,  891,
			  891,  508,  508,  508,  508,  508,  508,  508,  508,  891,
			  891,  891,  508,  508,  508,  508,  508,  508,  508,  508,
			  508,  539,  891,  539,  891,  891,  891,  891,  539,  539,
			  891,  539,  539,  539,  891,  891,  539,  539,  539,  539,
			  539,  539,  539,  539,  891,  891,  891,  539,  539,  539,

			  539,  539,  539,  539,  539,  539,  447,  447,  447,  891,
			  891,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  891,  891,  447,  447,  447,  447,  447,  447,  447,  447,
			  891,  891,  891,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  620,  891,  620,  891,  891,  891,  891,  620,
			  620,  891,  620,  620,  620,  891,  891,  620,  620,  620,
			  620,  620,  620,  620,  620,  891,  891,  620,  620,  620,
			  620,  620,  620,  620,  620,  620,  620,  672,  672,  672,
			  672,  672,  672,  672,  672,  672,  891,  672,  672,  672,
			  672,  672,  672,  672,  672,  672,  672,  672,  672,  672,

			  672,  672,  672,  672,  672,  672,  672,  672,  672,  672,
			  672,  672,  672,  672,  672,  675,  675,  675,  675,  675,
			  675,  675,  675,  891,  891,  891,  675,  675,  675,  675,
			  675,  675,  675,  675,  675,  733,  733,  733,  891,  891,
			  733,  733,  733,  733,  733,  733,  733,  733,  891,  891,
			  891,  733,  733,  733,  733,  733,  733,  733,  733,  733,
			  747,  891,  891,  891,  891,  747,  747,  747,  891,  891,
			  747,  747,  747,  747,  747,  747,  747,  747,  891,  891,
			  891,  747,  747,  747,  747,  747,  747,  747,  747,  747,
			  797,  797,  797,  797,  797,  797,  797,  797,  891,  891,

			  891,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  815,  815,  815,  891,  891,  815,  815,  815,  815,  815,
			  815,  815,  815,  891,  891,  891,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  841,  841,  841,  841,  841,
			  841,  841,  841,  891,  891,  891,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  853,  853,  853,  891,  891,
			  853,  853,  853,  853,  853,  853,  853,  853,  891,  891,
			  891,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			   11,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891, yy_Dummy>>,
			1, 573, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5572)
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

			   18,   13,    4,   13,   13,   25,  868,   25,   25,   25,
			   25,   25,   25,   27,   84,   27,   92,   27,   27,   27,
			   27,   27,   27,   38,   38,   60,   38,   61,  188,   63,
			    5,    5,    6,    6,   28,   59,   28,   60,   28,   28,
			   28,   28,   28,   28,    3,   18,   59,   38,   64,    4,
			    9,   84,   84,   60,   10,   61,   27,   63,   74,  182,
			   74,   74,  867,   59,   95,   60,   95,   95,  182,  234,
			  188,   92,  234,  503,  503,   59,   64,   28,    3,    3,
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
			   35,   35,   65,   35,   36,   36,   69,   36,  815,  815,
			   37,   37,   68,   37,  158,   65,   76,   66,   78,  236,

			   39,   39,  236,   39,   35,   66,   43,   43,   36,   43,
			   65,  846,   80,   35,   37,   69,   36,   35,   37,   35,
			   68,   67,  158,   65,   39,   66,   67,   37,   40,   40,
			   43,   40,  507,   66,   43,   41,   41,   39,   41,   44,
			   44,   35,   44,   76,   36,   35,   37,   35,   39,   67,
			   42,   42,   40,   42,   67,   37,   40,   45,   45,   41,
			   45,   77,   43,   44,  207,   39,   48,   48,   40,   48,
			   41,  159,   82,  507,   42,  845,   79,   39,   78,   44,
			  317,   45,   85,  374,   40,  108,  832,   45,   42,   42,
			   48,   80,   80,  207,   42,  317,   40,  827,   41,  159,

			   45,   47,   47,   81,   47,   48,  150,   44,   82,   82,
			   48,   49,   49,  825,   49,   45,   42,   42,   85,   85,
			  374,  108,   42,  153,   87,   47,  153,   87,   45,   46,
			   46,  153,   46,   48,  368,   49,   47,  365,   48,   77,
			   77,   77,  150,  160,   47,   46,   46,   46,   46,   46,
			   46,   49,  164,   46,   79,   79,   79,  150,  443,  167,
			   46,  443,   50,   50,   47,   50,  365,   46,   56,   56,
			  208,  160,   47,   56,   46,   56,   46,   87,   46,   49,
			   57,   81,   81,   81,  164,   57,   50,  167,   46,   57,
			  805,   57,   62,   62,   56,   46,   56,   56,   62,  116,

			  116,   56,  116,   56,  166,   46,  208,   46,   57,   56,
			   57,   50,  164,   57,  368,   89,  168,   57,   89,   57,
			   62,   62,  166,  116,  169,   57,   62,   89,   89,  109,
			  109,  109,  109,  109,  109,  208,  168,  794,   89,  170,
			   50,   55,   90,  537,   55,   90,  537,  847,  792,   55,
			  166,  787,  169,  761,   90,  847,   55,   55,   55,   55,
			   55,   55,   55,   55,  168,   90,  172,  170,   89,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,  172,  620,   90,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   58,  172,  165,   58,  212,  748,  212,  212,   58,  110,
			  110,  110,  110,  110,  110,   58,   58,   58,   58,   58,
			   58,   58,   58,  216,  173,  110,  165,  620,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  173,  110,  165,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   93,

			   93,  253,   93,  253,  253,  102,  112,  112,  112,  112,
			  112,  112,  853,  853,  102,  102,  102,  102,  102,  102,
			  224,  216,  216,  216,  220,   93,  226,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			  102,  106,  106,  106,  106,  106,  106,  224,  224,  171,
			  220,  220,  175,  226,  226,  102,  312,  106,  111,  102,
			  111,  102,  111,  111,  111,  111,  111,  111,  111,  113,
			   93,  113,  177,  113,  113,  113,  113,  113,  113,  171,
			  106,  117,  117,  175,  117,  106,  119,  119,  237,  119,

			  120,  120,  312,  120,  117,  121,  121,  178,  121,  119,
			  177,  111,  747,  120,  338,  117,  733,  171,  121,  449,
			  119,  175,  113,  183,  120,  122,  122,  184,  122,  121,
			  123,  123,  726,  123,  223,  178,  121,  120,  122,  124,
			  124,  119,  124,  123,  125,  125,  180,  125,  449,  122,
			  186,  183,  124,  237,  123,  184,  338,  125,  122,  126,
			  126,  179,  126,  124,  121,  120,  452,  719,  125,  119,
			  223,  223,  126,  123,  127,  127,  180,  127,  186,  124,
			  714,  128,  128,  126,  128,  179,  122,  127,  125,  126,
			  129,  129,  710,  129,  128,  126,  130,  130,  127,  130,

			  452,  123,  174,  129,  180,  128,  186,  124,  174,  130,
			  708,  127,  129,  179,  129,  190,  125,  126,  131,  131,
			  130,  131,  189,  126,  128,  132,  132,  187,  132,  452,
			  174,  131,  133,  133,  191,  133,  174,  130,  132,  127,
			  134,  134,  131,  134,  187,  133,  370,  190,  131,  132,
			  189,  176,  128,  134,  135,  135,  133,  135,  136,  136,
			  200,  136,  191,  192,  134,  130,  362,  135,  176,  193,
			  194,  136,  187,  197,  176,  190,  131,  133,  135,  707,
			  132,  196,  136,  702,  135,  134,  198,  138,  138,  136,
			  138,  139,  139,  200,  139,  192,  176,  193,  194,  196, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  138,  197,  176,  694,  139,  133,  202,  195,  362,  199,
			  204,  138,  135,  134,  198,  139,  206,  136,  137,  137,
			  137,  200,  139,  192,  195,  370,  370,  196,  199,  204,
			  141,  141,  138,  141,  202,  693,  139,  137,  139,  229,
			  205,  137,  229,  141,  137,  396,  206,  692,  691,  542,
			  139,  137,  195,  137,  141,  137,  199,  204,  668,  201,
			  396,  141,  314,  201,  542,  137,  661,  139,  205,  137,
			  144,  144,  137,  144,  206,  141,  252,  252,  655,  252,
			  315,  639,  137,  144,  137,  140,  140,  201,  140,  141,
			  314,  201,  229,  808,  144,  547,  217,  633,  140,  629,

			  252,  140,  140,  140,  140,  140,  140,  142,  315,  140,
			  142,  142,  142,  142,  142,  142,  144,  627,  143,  143,
			  140,  143,  808,  140,  612,  145,  145,  218,  145,  140,
			  215,  143,  146,  146,  560,  146,  203,  547,  145,  142,
			  323,  281,  143,  142,  144,  146,  219,  546,  140,  145,
			  143,  140,  281,  143,  544,  321,  146,  140,  325,  203,
			  518,  145,  281,  203,  146,  145,  147,  147,  323,  147,
			  148,  148,  142,  148,  217,  217,  217,  508,  143,  147,
			  281,  143,  321,  148,  496,  230,  325,  203,  230,  145,
			  147,  203,  146,  145,  148,  163,  163,  230,  163,  163,

			  163,  163,  163,  163,  320,  218,  218,  218,  230,  147,
			  321,  215,  215,  215,  215,  215,  489,  233,  488,  148,
			  233,  328,  326,  320,  219,  219,  219,  242,  242,  233,
			  242,  257,  257,  257,  257,  257,  257,  147,  230,  802,
			  233,  247,  247,  247,  247,  247,  247,  247,  148,  156,
			  326,  320,  328,  242,  256,  482,  256,  481,  156,  256,
			  256,  256,  256,  256,  256,  265,  265,  265,  265,  265,
			  233,  260,  260,  260,  260,  260,  260,  263,  462,  263,
			  328,  802,  263,  263,  263,  263,  263,  263,  380,  380,
			  446,  380,  156,  156,  156,  156,  156,  156,  156,  156,

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

			  235,  235,  235,  235,  235,  235,  235,  238,  238,  407,
			  238,  266,  266,  266,  266,  266,  266,  289,  289,  289,
			  289,  289,  289,  292,  292,  292,  292,  292,  292,  381,
			  381,  382,  381,  238,  377,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  255,  255,
			  255,  255,  255,  255,  262,  262,  262,  262,  262,  262,
			  541,  327,  329,  541,  255,  376,  812,  264,  364,  264,
			  262,  264,  264,  264,  264,  264,  264,  359,  238,  327,
			  330,  270,  270,  331,  270,  541,  335,  255,  271,  271,

			  329,  271,  255,  262,  270,  812,  272,  272,  262,  272,
			  348,  271,  340,  273,  273,  270,  273,  327,  330,  272,
			  264,  331,  271,  270,  335,  333,  273,  336,  274,  274,
			  272,  274,  275,  275,  322,  275,  313,  273,  271,  332,
			  340,  274,  308,  269,  334,  275,  324,  276,  276,  333,
			  276,  270,  274,  273,  277,  277,  275,  277,  332,  274,
			  276,  278,  278,  337,  278,  623,  271,  277,  623,  279,
			  279,  276,  279,  324,  278,  334,  275,  333,  277,  276,
			  341,  273,  279,  259,  258,  278,  332,  274,  251,  342,
			  623,  277,  250,  279,  337,  345,  280,  280,  339,  280,

			  249,  324,  343,  334,  275,  278,  248,  276,  341,  280,
			  339,  282,  282,  279,  282,  283,  283,  342,  283,  277,
			  280,  339,  337,  345,  282,  246,  343,  349,  283,  284,
			  284,  339,  284,  278,  344,  282,  350,  285,  285,  283,
			  285,  279,  284,  353,  286,  286,  241,  286,  282,  339,
			  285,  280,  283,  284,  343,  349,  346,  286,  344,  287,
			  287,  285,  287,  232,  350,  284,  352,  285,  286,  351,
			  838,  353,  287,  346,  288,  288,  282,  288,  227,  367,
			  283,  624,  225,  287,  624,  352,  344,  288,  222,  624,
			  210,  290,  290,  284,  290,  285,  185,  181,  288,  838,

			  354,  346,  351,  162,  290,  287,  288,  290,  290,  290,
			  290,  290,  290,  352,  161,  290,  291,  291,  291,  291,
			  291,  291,  293,  293,  293,  293,  293,  293,  354,  296,
			  351,  296,  357,  287,  288,  157,  290,  294,  294,  294,
			  294,  294,  294,  358,  154,  291,  295,  295,  295,  295,
			  295,  295,  296,  355,  361,  296,  356,  367,  367,  367,
			  357,  296,  297,  297,  297,  297,  297,  297,  151,  298,
			  298,  358,  298,  299,  299,  356,  299,  149,  448,  355,
			  296,  297,  298,  296,  361,  105,  299,  300,  300,  296,
			  300,  302,  302,  298,  302,  301,  301,  299,  301,  453,

			  300,  366,  104,  356,  302,  369,  448,  355,  301,  297,
			  451,  300,  361,  298,  371,  302,  103,  301,  360,  301,
			  100,  303,  303,  302,  303,   98,  300,  453,  804,  304,
			  304,  454,  304,   96,  303,  305,  305,  366,  305,  804,
			  451,  298,  304,  306,  306,  303,  306,  360,  305,  307,
			  307,  302,  307,  304,  300,  372,  306,   88,  373,  305,
			  455,  454,  307,  303,   73,   70,  366,  306,  451,  456,
			  804,   54,  304,  307,  309,  360,  309,  309,  309,  309,
			  309,  309,  309,  369,  369,  369,   51,   33,  455,  454,
			  305,  303,  371,  371,  371,   31,  460,  456,  307,  310,

			  304,  310,  310,  310,  310,  310,  310,  310,  318,  457,
			  318,  318,  318,  318,  318,  318,  319,   26,  319,  319,
			  319,  319,  319,  319,  460,   24,   16,  307,  378,  378,
			   15,  378,  457,  372,  372,  372,  373,  373,  373,   14,
			  378,  383,  383,   11,  383,  392,  392,  392,  392,  392,
			  392,  378,  386,  386,  386,  386,  386,  386,  386,  461,
			  457,  392,    0,  458,  813,  813,  813,  383,  393,  393,
			  393,  393,  393,  393,  394,  394,  394,  394,  394,  394,
			  464,  378,  458,  465,  392,  538,    0,  461,  538,  392,
			  395,  395,  395,  395,  395,  395,  397,  397,  397,  397, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  397,  397,  398,  398,  398,  398,  398,  398,    0,  466,
			  458,  465,  464,  394,  399,  468,  399,  469,  398,  399,
			  399,  399,  399,  399,  399,  400,  400,  400,  400,  400,
			  400,  401,  401,  401,  401,  401,  401,  466,  538,    0,
			  464,  398,    0,  468,    0,  469,  398,  402,  402,  402,
			  402,  402,  402,  403,  403,    0,  403,  403,  403,  403,
			  403,  403,  404,  404,  404,  404,  404,  404,  405,  405,
			  405,  405,  405,  405,  408,  408,    0,  408,  409,  409,
			  470,  409,    0,  418,  467,    0,  402,  408,    0,    0,
			    0,  409,  410,  410,  418,  410,  411,  411,  408,  411,

			    0,    0,  409,  467,  418,  410,    0,  437,  470,  411,
			  412,  412,    0,  412,  471,    0,  410,  408,  437,  463,
			  411,    0,  418,  412,  472,  409,  413,  413,  437,  413,
			    0,  467,  411,    0,  412,  410,    0,  471,  473,  413,
			  414,  414,  412,  414,    0,  408,  437,  474,  415,  415,
			  413,  415,  463,  414,  409,  416,  416,  472,  416,    0,
			  411,  415,    0,  410,  414,  471,  473,    0,  416,  474,
			  412,    0,  415,  475,  477,  417,  417,    0,  417,  416,
			  463,  419,  419,  476,  419,  472,  414,  416,  417,  420,
			  420,    0,  420,  415,  419,  421,  421,  474,  421,  417,

			    0,  475,  420,  417,  477,  419,    0,  478,  421,  422,
			  422,  476,  422,  420,  414,  416,    0,  419,  483,  421,
			  484,  415,  422,  423,  423,    0,  423,  424,  424,    0,
			  424,  417,  477,  422,  421,  420,  423,  478,    0,  531,
			  424,  426,  486,  426,  422,  419,  483,  423,  484,    0,
			  531,  424,  425,  425,  425,  425,  425,  425,  487,    0,
			  531,    0,  421,  420,  426,  478,  423,  426,  427,  548,
			  424,  427,  422,  485,  426,  486,  487,  427,  531,    0,
			  425,  428,  550,  428,  485,  428,  428,  428,  428,  428,
			  428,    0,  426,    0,  423,  426,  427,  548,  424,  427,

			    0,  485,    0,  486,  487,  427,  539,  428,  425,  539,
			  550,    0,  485,    0,  428,  429,  429,  429,  429,  429,
			  429,  430,  430,  430,  430,  430,  430,  431,  431,  431,
			  431,  431,  431,  551,  554,  428,  430,  429,  432,  432,
			  432,  432,  432,  432,    0,    0,  559,  506,  429,  506,
			  430,  433,  433,  433,  433,  433,  433,    0,  506,  539,
			  431,  551,  554,  809,  430,  429,  434,  434,  434,  434,
			  434,  434,  435,  435,  559,  435,    0,  429,  436,  436,
			  433,  436,  549,    0,    0,  435,  506,  438,  438,  431,
			  438,  436,  552,    0,    0,  434,  435,    0,  536,  809,

			  438,  549,  436,  439,  439,  561,  439,  440,  440,  536,
			  440,  438,  441,  441,  562,  441,  439,    0,  552,  536,
			  440,  442,  442,    0,  442,  441,    0,  439,  809,  549,
			    0,  440,    0,  561,  442,    0,  441,  536,  440,    0,
			  441,  553,  562,    0,    0,  442,  552,    0,    0,  439,
			  444,  441,  444,  444,  444,  444,  444,  444,  444,  553,
			  491,  491,  491,  491,  491,  491,  440,  445,  441,  445,
			  445,  445,  445,  445,  445,  445,  491,  439,  450,  441,
			  450,  450,  450,  450,  450,  450,  566,  553,    0,  444,
			  492,  492,  492,  492,  492,  492,  493,  493,  493,  493,

			  493,  493,    0,    0,  491,    0,  445,  494,  494,  494,
			  494,  494,  494,  495,  566,  495,  495,  495,  495,  495,
			  495,  497,  497,  497,  497,  497,  497,    0,  568,  492,
			  498,  498,  498,  498,  498,  498,    0,  497,  499,  499,
			  499,  499,  499,  499,  500,  500,  500,  500,  500,  500,
			  501,  501,  501,  501,  501,  501,  568,  570,  569,    0,
			  497,  509,  509,  555,  509,  497,  502,  502,  502,  502,
			  502,  502,    0,  564,  509,  555,    0,  499,  504,  504,
			  504,  504,  504,  504,  572,  509,  569,  570,  573,  501,
			    0,  555,  564,  505,  504,  505,  505,  505,  505,  505,

			  505,  510,  510,  555,  510,  511,  511,  567,  511,    0,
			  512,  512,  572,  512,  510,  570,  573,    0,  511,    0,
			  564,  556,  504,  512,  557,  510,  567,  513,  513,  511,
			  513,    0,    0,  571,  512,  514,  514,  511,  514,  556,
			  513,    0,    0,  557,  515,  515,  565,  515,  514,  512,
			    0,  513,  571,    0,  567,  557,  510,  515,  513,  514,
			  516,  516,  574,  516,  565,  511,  514,  556,  515,  517,
			  517,  557,  517,  516,    0,    0,  515,  512,  519,  519,
			  571,  519,  517,  557,  516,    0,  513,  575,  515,    0,
			  574,  519,  565,  517,  514,  520,  520,    0,  520,    0,

			  521,  521,  519,  521,  515,    0,  517,    0,  520,  581,
			  519,    0,    0,  521,  576,  575,  515,  522,  522,  520,
			  522,    0,  523,  523,  521,  523,  520,  604,  577,    0,
			  522,    0,  581,  576,  517,  523,    0,  581,  519,  524,
			  524,  522,  524,    0,  604,  626,  523,  577,  604,  522,
			    0,    0,  524,  617,  520,  526,  526,  526,  526,  526,
			  526,  576,    0,  524,  617,  523,  592,  592,  592,  592,
			  592,  524,  604,  626,  617,  577,    0,  522,  527,  527,
			  527,  527,  527,  527,  526,  528,  528,  528,  528,  528,
			  528,    0,  617,  523,    0,  630,  529,  632,  529,  524,

			  529,  529,  529,  529,  529,  529,    0,  532,  532,    0,
			  532,    0,  632,  528,  530,  530,  530,  530,  530,  530,
			  532,  618,  529,  630,    0,    0,  634,  637,  529,  529,
			    0,  532,  618,    0,  533,  533,  530,  533,  643,  532,
			  632,  528,  618,  635,    0,  640,  637,  533,  534,  534,
			  529,  534,  535,  535,  634,  535,  529,    0,  533,    0,
			  618,  534,  641,  638,  530,  535,  533,  532,  642,  643,
			    0,  635,  534,  640,  637,  545,  535,  545,  545,  545,
			  545,  545,  545,  579,  579,  579,  579,  579,  579,  638,
			  641,  534,  535,  578,  533,  578,  642,  643,  578,  578,

			  578,  578,  578,  578,  580,  580,  580,  580,  580,  580,
			    0,    0,    0,  645,  545,  647,  648,  638,    0,  534,
			  535,  582,  579,  582,  582,  582,  582,  582,  582,  583,
			  583,  583,  583,  583,  583,  584,  584,  584,  584,  584,
			  584,  645,    0,  647,  648,  583,  585,  585,  585,  585,
			  585,  585,  586,  586,  586,  586,  586,  586,    0,    0,
			  582,  587,  587,  587,  587,  587,  587,  588,  588,  588,
			  588,  588,  588,  583,  584,  589,  589,  589,  589,  589,
			  589,  590,    0,  590,    0,  646,  590,  590,  590,  590,
			  590,  590,  591,  591,  591,  591,  591,  591,  619,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  587,  594,  594,  594,  594,  594,  594,  596,  596,  619,
			  596,    0,  597,  597,  644,  597,  646,  594,    0,  619,
			  596,  681,    0,  652,  653,  597,  598,  598,    0,  598,
			  650,  596,  654,  644,  665,  596,  597,  619,  681,  598,
			  599,  599,  681,  599,  646,  594,  600,  600,  650,  600,
			  598,  652,  653,  599,  598,  601,  601,  665,  601,  600,
			  654,  644,  665,  596,  599,    0,  681,  656,  601,    0,
			  600,  602,  602,  697,  602,  698,  650,  701,  600,  601,
			  603,  603,  598,  603,  602,  605,  605,    0,  605,  606,
			  606,    0,  606,  603,  601,  602,    0,  656,  605,  711,

			  649,  697,  606,  698,  603,  701,  600,  607,  607,  605,
			  607,  608,  608,  606,  608,  609,  609,  603,  609,  649,
			  607,  606,  601,    0,  608,  656,  699,  711,  609,  605,
			    0,  607,    0,    0,    0,  608,  715,    0,  716,  609,
			    0,  717,    0,  608,    0,  603,  609,  649,    0,  606,
			  699,  607,  613,  613,  610,  613,  610,  605,  610,  610,
			  610,  610,  610,  610,  715,  613,  716,  614,  614,  717,
			  614,  608,  615,  615,  609,  615,  613,    0,  699,  607,
			  614,  616,  616,  687,  616,  615,    0,  610,    0,    0,
			    0,  614,  703,    0,  616,    0,  615,  749,    0,    0,

			  687,    0,  615,    0,  687,  616,    0,    0,    0,  703,
			  614,  625,  616,  625,  625,  625,  625,  625,  625,  657,
			  657,  657,  657,  657,  657,  749,  678,  678,  687,  678,
			  615,  658,  658,  658,  658,  658,  658,  703,  614,  678,
			  616,  659,  659,  659,  659,  659,  659,  660,    0,  660,
			  678,    0,  660,  660,  660,  660,  660,  660,  662,    0,
			  662,    0,    0,  662,  662,  662,  662,  662,  662,  663,
			  663,  663,  663,  663,  663,  664,  664,  664,  664,  664,
			  664,  666,  666,  666,  666,  666,  666,  667,  667,  667,
			  667,  667,  667,  669,  669,  669,  669,  669,  669,  670,

			  670,  670,  670,  670,  670,    0,    0,    0,  663,  671,
			  671,  671,  671,  671,  671,  673,  673,  673,  673,  673,
			  673,  727,  727,  727,  727,  676,  676,  674,  676,  674,
			  750,  673,  674,  674,  674,  674,  674,  674,  676,  677,
			  677,    0,  677,  679,  679,    0,  679,  680,  680,  676,
			  680,  713,  677,    0,  673,  752,  679,    0,  750,  673,
			  680,  682,  682,  677,  682,  718,    0,  679,  676,  683,
			  683,  680,  683,  679,  682,    0,  677,  713,  684,  684,
			    0,  684,  683,  752,  718,  682,  685,  685,    0,  685,
			    0,  684,  754,  683,  686,  686,  676,  686,    0,  685,

			    0,  679,  684,  753,  677,  713,  739,  686,  688,  688,
			  685,  688,  718,  689,  689,    0,  689,    0,  686,    0,
			  754,  688,  753,  739,    0,  685,  689,  739,  690,  690,
			  756,  690,  688,  782,  782,  743,  782,  689,    0,  743,
			  688,  690,  720,  720,  720,  720,  720,  720,  689,    0,
			  753,  739,  690,  685,    0,    0,  743,  782,  756,  696,
			  690,  696,  696,  696,  696,  696,  696,  743,  688,  721,
			  721,  721,  721,  721,  721,    0,  689,  722,  722,  722,
			  722,  722,  722,  729,  729,  729,  729,    0,  690,  723,
			  723,  723,  723,  723,  723,    0,    0,    0,  696,  724,

			  724,  724,  724,  724,  724,  725,    0,  725,  721,    0,
			  725,  725,  725,  725,  725,  725,  728,  728,  728,  728,
			  728,  728,  729,  730,  730,  730,  730,  730,  730,  731,
			  731,  731,  731,  731,  731,  734,  734,  755,  734,  730,
			  732,  732,  732,  732,  732,  732,    0,    0,  734,    0,
			  735,  735,    0,  735,  755,    0,    0,  736,  736,  734,
			  736,    0,  730,  735,    0,  734,    0,  730,    0,    0,
			  736,    0,  738,  738,  735,  738,    0,  740,  740,  732,
			  740,  736,  755,  751,  744,  738,  735,    0,  744,  736,
			  740,  741,  741,  734,  741,  759,  738,  742,  742,  745,

			  742,  740,  738,  745,  741,  744,  751,  746,  740,  757,
			  742,  746,  783,  759,  735,  741,  744,  736,    0,    0,
			  745,  742,  784,  741,    0,    0,    0,    0,  746,    0,
			  738,  745,    0,    0,  751,    0,  740,  757,    0,  746,
			  783,  759,  760,  760,  760,  760,  760,  760,  788,  791,
			  784,  741,  762,  762,  762,  762,  762,  762,  763,  763,
			  763,  763,  763,  763,  764,  764,  764,  764,  764,  764,
			  765,  765,  765,  765,  765,  765,  788,  791,    0,    0,
			    0,  760,  766,  766,  766,  766,  766,  766,  767,  767,
			  767,  767,  767,  767,  807,    0,    0,  763,  769,  769,

			  769,  769,  769,  769,  771,  771,  778,  771,  772,  772,
			  778,  772,  773,  773,  779,  773,    0,  771,  779,    0,
			  780,  772,  807,  789,  780,  773,  785,  778,  771,  811,
			  774,  774,  772,  774,    0,  779,  773,  769,  778,  771,
			    0,  780,  789,  774,  776,  776,  779,  776,  777,  777,
			  810,  777,  780,  772,  774,  781,  820,  776,  785,  781,
			  811,  777,  774,  823,  820,    0,    0,  771,  776,    0,
			  789,    0,  777,    0,    0,    0,  781,  820,  810,  828,
			    0,  772,  839,    0,    0,    0,  785,  781,  811,    0,
			  774,  823,  820,  777,  793,  793,  793,  793,  793,  793,

			  795,  795,  795,  795,  795,  795,  796,  828,  796,  848,
			  839,  796,  796,  796,  796,  796,  796,  798,  798,  858,
			  798,  777,  799,  799,    0,  799,  800,  800,    0,  800,
			  798,  801,  801,  793,  801,  799,    0,  848,    0,  800,
			    0,  798,    0,    0,  801,  796,  799,  858,    0,  798,
			  800,  816,  816,    0,  816,  801,  814,  814,  814,  814,
			  814,  814,    0,    0,  816,  817,  817,    0,  817,    0,
			  800,  799,  822,  818,  818,  816,  818,  798,  817,    0,
			  801,  819,  819,  821,  819,  822,  818,  835,    0,  817,
			    0,  821,    0,  822,  819,  835,  816,  818,  800,    0,

			  799,    0,    0,    0,  821,  819,  822,    0,  835,  801,
			  829,  829,  829,  829,  829,  829,    0,    0,    0,  821,
			    0,  822,  819,  835,  816,  830,  830,  830,  830,  830,
			  830,  833,  833,  836,  833,  834,  834,    0,  834,  837,
			  840,  836,  840,    0,  833,    0,    0,  856,  834,    0,
			  819,  840,  837,    0,  836,  833,    0,    0,  856,  834,
			  837,  842,  842,  842,  842,  842,    0,  834,  856,  836,
			    0,    0,    0,  837,  843,  843,    0,  843,    0,  840,
			  833,  844,  844,    0,  844,  857,  856,  843,  837,  851,
			  851,  851,  851,  851,  844,  834,  857,    0,  843,  850, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  850,  850,  850,  850,  850,  844,  857,    0,    0,  833,
			  855,  855,    0,  855,    0,  843,  854,  854,  854,  854,
			  854,  854,    0,  855,  857,  859,  859,  859,  859,  859,
			  859,    0,    0,  873,  855,  860,  860,  860,  860,  860,
			  860,  862,  855,  843,  861,  861,    0,  861,  863,  866,
			  873,  866,  862,    0,  873,    0,    0,  861,    0,  863,
			  866,    0,  862,  871,  871,  871,  871,  871,  861,  863,
			  855,  865,  865,  865,  865,  865,  865,    0,  873,  874,
			  862,  869,  869,  869,  869,  869,  869,  863,  866,  870,
			  870,  870,  870,  870,  870,    0,  874,  877,  878,    0,

			  874,  875,  875,  875,  875,  875,  875,  876,  876,  876,
			  876,  876,  876,    0,  877,  878,    0,    0,  877,  878,
			  880,  880,  880,  880,  874,  879,  879,  879,  879,  879,
			  879,  883,  883,  883,  883,  883,  883,    0,    0,    0,
			    0,    0,  877,  878,  884,  884,  884,  884,  884,  884,
			  885,  885,  885,  885,  885,  885,    0,    0,    0,  880,
			  887,  887,  887,  887,  887,  887,  888,    0,  888,    0,
			    0,  888,  888,  888,  888,  888,  888,  889,  889,  889,
			  889,  889,  889,  890,  890,  890,  890,  890,  890,  897,
			  897,  897,  897,  897,  897,  897,  897,  928,  928,  928,

			  928,  928,  928,  928,  928,  888,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,

			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  895,  895,    0,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,    0,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  896,  896,
			    0,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  898,  914,  914,  914,

			  914,  914,  914,  914,  914,  914,    0,    0,    0,    0,
			    0,    0,    0,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  899,  899,  899,    0,    0,    0,    0,    0,
			    0,    0,  899,  899,  899,  899,    0,  899,  899,  899,
			  899,  899,  899,  899,  899,    0,    0,    0,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  900,  900,    0,
			  900,  900,    0,  900,  900,  900,    0,    0,  900,  900,
			  900,  900,  900,  900,  900,  900,    0,    0,    0,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  901,  901,
			    0,  901,  901,  901,  901,  901,  901,  901,  901,  901,

			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  902,  902,    0,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,    0,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  905,    0,  905,    0,    0,    0,    0,  905,  905,    0,
			  905,  905,  905,    0,    0,  905,  905,  905,  905,  905,
			  905,  905,  905,    0,    0,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,

			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  908,  908,    0,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  909,
			    0,    0,    0,    0,  909,  909,  909,    0,    0,  909,

			  909,  909,  909,  909,  909,  909,  909,    0,    0,    0,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  911,  911,  911,
			  911,    0,    0,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,    0,    0,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,    0,  912,  912,  912,  912,  912,  912,  912,

			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  913,    0,    0,    0,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,    0,    0,
			    0,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			    0,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  917,  917,  917,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  917,  918,  918,  918,  918,  918,  918,  918,  918,
			    0,    0,    0,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  919,  919,  919,  919,    0,    0,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,    0,    0,  919,

			  919,  919,  919,  919,  919,  919,  919,  919,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  921,  921,  921,    0,
			    0,  921,  921,  921,  921,  921,  921,  921,  921,    0,
			    0,    0,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  922,    0,  922,    0,    0,    0,    0,  922,  922,
			    0,  922,  922,  922,    0,    0,  922,  922,  922,  922,
			  922,  922,  922,  922,    0,    0,    0,  922,  922,  922,

			  922,  922,  922,  922,  922,  922,  923,  923,  923,    0,
			    0,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			    0,    0,  923,  923,  923,  923,  923,  923,  923,  923,
			    0,    0,    0,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  924,    0,  924,    0,    0,    0,    0,  924,
			  924,    0,  924,  924,  924,    0,    0,  924,  924,  924,
			  924,  924,  924,  924,  924,    0,    0,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,    0,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,

			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  926,  926,  926,  926,  926,
			  926,  926,  926,    0,    0,    0,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  927,  927,  927,    0,    0,
			  927,  927,  927,  927,  927,  927,  927,  927,    0,    0,
			    0,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  929,    0,    0,    0,    0,  929,  929,  929,    0,    0,
			  929,  929,  929,  929,  929,  929,  929,  929,    0,    0,
			    0,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  930,  930,  930,  930,  930,  930,  930,  930,    0,    0,

			    0,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			  931,  931,  931,    0,    0,  931,  931,  931,  931,  931,
			  931,  931,  931,    0,    0,    0,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  932,  932,  932,  932,  932,
			  932,  932,  932,    0,    0,    0,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,  933,  933,  933,    0,    0,
			  933,  933,  933,  933,  933,  933,  933,  933,    0,    0,
			    0,  933,  933,  933,  933,  933,  933,  933,  933,  933,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891, yy_Dummy>>,
			1, 573, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0,   67,
			   71, 1943, 5480,   99, 1936, 1903, 1919, 5480,   91,    0,
			 5480, 5480, 5480, 5480, 1910,   89, 1900,   99,  120, 5480,
			 5480, 1868, 5480, 1860, 5480,  278,  282,  288,  121,  298,
			  326,  333,  348,  304,  337,  355,  427,  399,  364,  409,
			  460, 1828, 5480, 5480, 1815,  539,  434,  450,  618,   96,
			   95,   90,  452,   99,  106,  250,  260,  280,  250,  235,
			 1848, 5480, 5480, 1857,  156, 5480,  289,  354,  291,  369,
			  305,  396,  355, 5480,   97,  365, 5480,  422, 1854,  513,
			  540, 5480,   88,  697, 5480,  162, 1830, 5480, 1818, 5480,

			 1811,    0,  696, 1805, 1799, 1769,  733, 5480,  368,  511,
			  611,  754,  688,  765, 5480, 5480,  497,  789,    0,  794,
			  798,  803,  823,  828,  837,  842,  857,  872,  879,  888,
			  894,  916,  923,  930,  938,  952,  956, 1004,  985,  989,
			 1083, 1028, 1092, 1116, 1068, 1123, 1130, 1164, 1168, 1753,
			  382, 1712, 5480,  421, 1733,    0, 1234, 1718,  247,  332,
			  410, 1656, 1688, 1180,  437,  607,  489,  424,  501,  479,
			  497,  744,  551,  598,  870,  747,  936,  743,  762,  846,
			  831, 1673,  144,  780,  795, 1639,  835,  912,  113,  875,
			  900,  887,  948,  937,  937,  992,  966,  939,  938,  994,

			  945, 1021,  972, 1121,  995,  995, 1001,  313,  455, 5480,
			 1683, 5480,  622, 5480, 5480, 1123,  636, 1089, 1120, 1139,
			  707, 5480, 1634,  817,  703, 1627,  709, 1624, 5480, 1037,
			 1183, 5480, 1660, 1215,  167, 1314,  297,  770, 1405, 5480,
			 5480, 1618, 1225, 5480, 5480, 5480, 1616, 1224, 1597, 1591,
			 1583, 1579, 1074,  699, 5480, 1440, 1241, 1213, 1567, 1525,
			 1253, 5480, 1446, 1264, 1463, 1247, 1393, 5480,    0, 1515,
			 1489, 1496, 1504, 1511, 1526, 1530, 1545, 1552, 1559, 1567,
			 1594, 1112, 1609, 1613, 1627, 1635, 1642, 1657, 1672, 1399,
			 1689, 1698, 1405, 1704, 1719, 1728, 1715, 1744, 1767, 1771,

			 1785, 1793, 1789, 1819, 1827, 1833, 1841, 1847, 1518, 1858,
			 1883, 5480,  749, 1519, 1028, 1038,    0,  320, 1892, 1900,
			 1189, 1140, 1519, 1098, 1531, 1125, 1176, 1456, 1206, 1438,
			 1451, 1447, 1524, 1510, 1529, 1450, 1470, 1548,  799, 1581,
			 1473, 1541, 1551, 1587, 1619, 1563, 1641,    0, 1495, 1579,
			 1602, 1654, 1651, 1602, 1666, 1738, 1741, 1688, 1698, 1430,
			 1803, 1739,  951,    0, 1463,  386, 1786, 1672,  427, 1798,
			  939, 1807, 1848, 1851,  366, 5480, 1420, 1431, 1926, 5480,
			 1286, 1427, 1428, 1939, 5480, 5480, 1935, 5480, 5480, 5480,
			 5480, 5480, 1927, 1950, 1956, 1972,  985, 1978, 1984, 2001,

			 2007, 2013, 2029, 2038, 2044, 2050,    0, 1381, 2072, 2076,
			 2090, 2094, 2108, 2124, 2138, 2146, 2153, 2173, 2054, 2179,
			 2187, 2193, 2207, 2221, 2225, 2234, 2227, 2231, 2267, 2297,
			 2303, 2309, 2320, 2333, 2348, 2370, 2376, 2078, 2385, 2401,
			 2405, 2410, 2419,  456, 2434, 2451, 1232,    0, 1733,  770,
			 2462, 1795,  851, 1754, 1816, 1822, 1835, 1894, 1948,    0,
			 1848, 1912, 1263, 2104, 1965, 1949, 1979, 2069, 1977, 1969,
			 2039, 2099, 2109, 2101, 2132, 2128, 2138, 2159, 2192,    0,
			    0, 1242, 1240, 2170, 2187, 2243, 2227, 2243, 1203, 1201,
			 5480, 2442, 2472, 2478, 2489, 2497, 1170, 2503, 2512, 2520,

			 2526, 2532, 2548,  155, 2560, 2577, 2334,  316, 1162, 2559,
			 2599, 2603, 2608, 2625, 2633, 2642, 2658, 2667, 1136, 2676,
			 2693, 2698, 2715, 2720, 2737, 5480, 2737, 2760, 2767, 2782,
			 2796, 2210, 2805, 2832, 2846, 2850, 2369,  541, 1983, 2304,
			 5480, 1468,  989,    0, 1097, 2859, 1132, 1080, 2235, 2367,
			 2241, 2300, 2377, 2426, 2301, 2529, 2606, 2609,    0, 2307,
			 1119, 2371, 2381,    0, 2558, 2631, 2452, 2592, 2483, 2524,
			 2542, 2618, 2550, 2554, 2617, 2645, 2699, 2713, 2880, 2865,
			 2886, 2675, 2905, 2911, 2917, 2928, 2934, 2943, 2949, 2957,
			 2968, 2974, 2748, 5480, 2983,    0, 3005, 3010, 3024, 3038,

			 3044, 3053, 3069, 3078, 2698, 3083, 3087, 3105, 3109, 3113,
			 3140, 5480, 1100, 3150, 3165, 3170, 3179, 2724, 2792, 2969,
			  592, 5480, 5480, 1563, 1679, 3195, 2715, 1100,    0, 1084,
			 2765,    0, 2782, 1082, 2792, 2802,    0, 2812, 2848, 1066,
			 2806, 2816, 2834, 2823, 2999, 2867, 2970, 2881, 2883, 3085,
			 3015,    0, 2978, 2992, 2999, 1063, 3052, 3201, 3213, 3223,
			 3234, 1049, 3245, 3251, 3257, 3000, 3263, 3269, 1043, 3275,
			 3281, 3291, 5480, 3297, 3314,    0, 3323, 3337, 3224, 3341,
			 3345, 2992, 3359, 3367, 3376, 3384, 3392, 3154, 3406, 3411,
			 3426, 1033, 1032, 1020,  988,    0, 3443, 3028, 3036, 3111,

			    0, 3045,  968, 3177,    0,    0,    0,  964,  895,    0,
			  877, 3058,    0, 3336,  865, 3102, 3101, 3107, 3350,  810,
			 3424, 3451, 3459, 3471, 3481, 3492,  775, 3303, 3498, 3470,
			 3505, 3511, 3522,  800, 3533, 3548, 3555, 5480, 3570, 3377,
			 3575, 3589, 3595, 3406, 3555, 3570, 3578,  801,  608, 3165,
			 3292, 3568, 3321, 3388, 3360, 3522, 3397, 3575,    0, 3580,
			 3624,  496, 3634, 3640, 3646, 3652, 3664, 3670, 5480, 3680,
			    0, 3702, 3706, 3710, 3728, 5480, 3742, 3746, 3677, 3685,
			 3691, 3726, 3431, 3575, 3575, 3711,    0,  536, 3614, 3708,
			    0, 3602,  533, 3776,  490, 3782, 3793,    0, 3815, 3820,

			 3824, 3829, 1234, 5480, 1823,  474, 5480, 3660, 1042, 2348,
			 3704, 3714, 1425, 1946, 3838,  273, 3849, 3863, 3871, 3879,
			 3727, 3854, 3856, 3716,    0,  398,    0,  382, 3736, 3892,
			 3907,    0,  309, 3929, 3933, 3858, 3904, 3923, 1619, 3748,
			 3927,    0, 3942, 3972, 3979,  351,  287,  531, 3766,    0,
			 3981, 3971, 5480,  697, 3998, 4008, 3918, 3956, 3785, 4007,
			 4017, 4042, 4012, 4019,    0, 4053, 4036,  138,   82, 4063,
			 4071, 4045, 5480, 4004, 4050, 4083, 4089, 4068, 4069, 4107,
			 4107, 5480, 5480, 4113, 4126, 4132, 5480, 4142, 4153, 4159,
			 4165, 5480, 4205, 4243, 4281, 4319, 4357, 4172, 4385, 4420,

			 4451, 4487, 4525, 4563, 4601, 4638, 4674, 4712, 4750, 4782,
			 4818, 4846, 4882, 4913, 4369, 4949, 4987, 5024, 5045, 5071,
			 5107, 5134, 5169, 5205, 5240, 5276, 5298, 5323, 4180, 5353,
			 5373, 5398, 5418, 5443, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  891,    1,  892,  892,  893,  893,  891,    7,  894,
			  894,  891,  891,  891,  891,  891,  895,  891,  896,  897,
			  891,  891,  891,  891,  891,  891,  898,  891,  891,  891,
			  891,  891,  891,  891,  891,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  900,  891,  891,  901,  891,   55,   55,  891,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  891,  891,  891,  902,  891,  891,  891,  902,  902,  902,
			  902,  902,  903,  891,  904,  903,  891,  905,  891,  905,
			  905,  891,  906,  907,  891,  891,  891,  891,  895,  891,

			  908,  908,  908,  909,  910,  891,  891,  891,  911,  891,
			  912,  891,  891,  891,  891,  891,  891,  899,  913,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,   46,  899,  899,
			  899,  899,   46,  899,  899,  899,  899,  899,  899,  900,
			  900,  901,  891,  891,  891,  914,   58,  891,  156,  156,
			  156,  891,   58,   58,   58,   58,   58,  156,   58,  156,
			  156,   58,   58,  156,  156,   58,   58,  156,  156,   58,
			   58,  156,   58,  156,  156,  156,   58,   58,   58,  156,
			   58,  156,   58,  156,  156,   58,   58,  156,  156,   58,

			   58,  156,  156,   58,   58,  156,   58,  156,   58,  891,
			  902,  891,  891,  891,  891,  902,  902,  902,  902,  902,
			  903,  891,  915,  903,  904,  916,  904,  915,  891,  905,
			  905,  891,  891,  891,  891,  891,  891,  906,  907,  891,
			  891,  238,  917,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  898,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  918,  913,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  891,  899,  899,  899,  899,  899,  899,  899,  891,
			  899,  290,  290,  290,  290,  140,  140,  140,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  891,  900,
			  900,  891,  919,  891,  156,  156,  156,  891,  891,  156,
			   58,   58,   58,  156,   58,  156,  156,   58,   58,  156,
			  156,  156,   58,   58,   58,  156,  156,   58,   58,  891,
			  156,  156,  156,   58,   58,  156,   58,  156,   58,  156,
			  156,   58,   58,  156,  156,   58,   58,  156,  156,  156,
			   58,   58,   58,  156,   58,  156,   58,  902,  902,  902,
			  902,  902,  902,  902,  915,  891,  916,  920,  920,  891,
			  920,  920,  920,  917,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  921,  913,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  891,  899,
			  899,  899,  899,  899,  899,  891,  290,  140,  290,  137,
			  290,  137,  891,  290,  290,  899,  899,  891,  899,  899,
			  899,  899,  899,  922,  900,  900,  891,  923,  156,  156,
			  891,   58,   58,  156,   58,  156,  156,   58,   58,  156,
			  156,  156,   58,   58,   58,  156,  156,   58,  156,  156,
			  156,   58,   58,  156,   58,  156,  156,   58,   58,  156,
			  156,   58,   58,  156,  156,  156,   58,   58,  156,   58,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  912,  891,  891,  891,  921,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  891,  899,
			  899,  899,  899,  899,  899,  891,  290,  290,  891,  290,
			  529,  891,  899,  899,  899,  899,  918,  891,  924,  922,
			  891,  891,  891,  156,  156,  891,   58,   58,  156,   58,
			  156,  156,   58,   58,  156,  156,   58,   58,  156,  156,
			   58,  156,  156,  156,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,  156,  156,   58,   58,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  925,  926,  899,  899,  899,  899,

			  899,  899,  899,  899,  891,  899,  899,  899,  899,  899,
			  290,  891,  891,  899,  899,  899,  899,  891,  921,  921,
			  924,  891,  891,  891,  891,  891,  156,  891,  156,   58,
			  156,  156,   58,   58,  156,  156,  156,   58,   58,   58,
			  156,  156,  156,   58,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,  156,  156,   58,   58,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  927,  899,  899,  899,  899,
			  899,  891,  899,  899,  899,  899,  899,  891,  899,  899,
			  899,  891,  891,  921,  921,  928,  891,  156,  156,   58,

			  156,  156,   58,   58,  156,  156,  156,   58,   58,  156,
			   58,  156,  156,   58,   58,  156,  156,  156,   58,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  927,  899,  899,  899,  891,  899,  891,
			  899,  899,  899,  891,  891,  926,  926,  929,  891,  156,
			  156,   58,  156,   58,  156,   58,  156,  156,  156,   58,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  930,  899,  899,  899,  899,  891,  899,  899,  891,  891,
			  927,  927,  891,  156,  156,   58,  156,   58,  156,   58,
			  156,  156,   58,  891,  891,  891,  891,  931,  899,  899,

			  899,  899,  891,  891,  927,  927,  891,  156,  156,   58,
			  156,   58,  156,  891,  891,  931,  899,  899,  899,  899,
			  891,  891,  927,  156,  156,   58,  156,   58,  156,  891,
			  891,  932,  891,  899,  899,  891,  891,  927,  156,  156,
			  891,  933,  891,  899,  899,  891,  891,  927,  156,  156,
			  891,  891,  891,  933,  891,  899,  891,  891,  156,  891,
			  891,  899,  891,  891,  156,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,    0,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891, yy_Dummy>>)
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
			    6,    7,    1,    1,    8,    9,   10,   11,   12,   12,
			   12,   12,   13,   14,    1,    1,   15,    1,   16,    1,
			   17,   18,   19,   20,   21,   22,   17,   17,   17,   17,
			   17,   17,   17,   17,   17,   17,   17,   17,   17,   23,
			   17,   17,   24,   25,   26,   27,    5,   12,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,    5,    5,   37,   38,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  103,  103,    0,    0,    0,
			    0,  135,  133,    1,    2,   15,  117,   18,  133,   16,
			   17,    7,    6,   13,    5,   11,    8,  108,  108,   14,
			   12,   28,   10,   29,   19,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   81,   96,   96,   96,
			   96,   21,   30,   22,    9,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   23,   20,   24,  121,  122,  123,  124,  121,  121,  121,
			  121,  121,  103,  106,  134,  103,  134,  134,   68,  134,
			  134,   70,  134,  134,   95,    1,    2,   27,  117,  116,

			  131,  131,  131,    0,    3,   32,  112,   31,  100,    0,
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
			  121,  123,  122,  119,  118,  120,  121,  121,  121,  121,
			  103,  106,    0,  103,    0,    0,    0,  104,  105,    0,
			    0,   70,   68,    0,   67,    0,   66,    0,    0,   95,
			   93,   93,    0,   94,  131,  125,  131,  131,  131,  131,
			  131,  131,    0,    4,   33,  112,    0,    0,    0,    0,
			    0,  110,  112,  110,  108,    0,    0,   90,    0,    0,
			   96,   96,   38,   96,   96,   96,   96,   96,   96,   96,
			   96,    0,   96,   96,   96,   96,   41,   96,   96,    0,
			   81,   82,   81,   81,   81,   88,   96,   88,   88,   88,

			   96,   96,   96,   96,   96,   96,   40,   96,    0,    0,
			    0,   98,  101,    0,   99,   99,   38,    0,   71,   71,
			   99,   99,   38,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,    0,
			   99,   99,   99,   99,   99,   99,   99,   41,   41,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   40,   40,   99,   99,  121,  121,  121,
			  121,  121,  121,  121,    0,  104,  105,    0,    0,   69,
			   67,   66,   70,    0,  129,  132,  132,  130,  126,  127,
			  128,   91,  112,    0,  112,    0,    0,    0,  112,    0,

			    0,    0,  111,  108,    0,    0,    0,   97,   96,   96,
			   96,   96,   96,   37,   96,   96,   96,   96,    0,   96,
			   96,   96,   96,   96,   96,    0,   96,   80,   96,   96,
			   96,   96,    0,   80,   80,   80,   36,    0,   43,   96,
			   96,   96,   96,   65,    0,    0,    0,   61,   99,   99,
			    0,   99,   99,   99,   99,   99,   99,   99,   99,   37,
			   99,   99,   37,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   36,
			   43,   36,   43,   99,   99,   99,   99,   99,   99,   99,
			  105,  112,  112,    0,    0,    0,  109,  112,    0,  111,

			    0,  111,    0,    0,    0,  108,   77,    0,    0,   58,
			   96,   96,   96,   96,   96,   96,   44,   96,    0,   96,
			   96,   35,   96,   96,   96,   82,   82,   81,    0,   96,
			   96,    0,   96,   96,   96,   96,    0,   65,   65,    0,
			   64,   64,    0,   58,   99,    0,   58,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   44,   99,
			   44,   99,   99,   35,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,    0,  112,
			    0,  115,    0,  112,  111,    0,    0,  111,    0,    0,
			  110,    0,    0,   77,    0,    0,   96,   59,   96,   60,

			   96,   96,   46,   96,    0,   96,   96,   96,   96,   96,
			   96,   80,    0,   52,   96,   96,   96,    0,    0,    0,
			    0,   63,   62,    0,    0,    0,   99,    0,   59,   59,
			   99,   60,   99,   60,   99,   99,   46,   99,   99,   46,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   52,   99,   99,   99,   52,   99,    0,  112,    0,
			    0,  100,    0,  111,    0,  115,  111,    0,   79,    0,
			    0,    0,  113,  115,  113,    0,   96,   96,   57,   96,
			   45,    0,   42,   56,   34,   96,   50,    0,   96,   96,
			   96,    0,    0,    0,    0,    0,    0,   99,   99,   99,

			   57,   99,   57,   99,   45,   42,   56,   42,   56,   34,
			   34,   99,   50,   99,   50,   99,   99,   99,   99,  115,
			    0,  115,    0,  111,    0,    0,  114,    0,    0,   76,
			  115,    0,  114,    0,   96,   96,   96,   85,   96,    0,
			   96,   96,   53,    0,    0,    0,    0,    0,  101,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   53,   99,
			  115,  114,    0,  114,    0,    0,    0,    0,   76,  114,
			    0,   96,   96,   47,   96,   84,   51,   96,    0,    0,
			    0,    0,    0,   99,   99,   99,   47,   47,   99,   99,
			   51,   99,   51,  114,   78,    0,   76,    0,   96,   96,

			   96,   96,   83,   83,   83,   83,   92,   99,   99,   99,
			   99,   99,   99,    0,    0,    0,   96,   49,   48,   96,
			    0,    0,    0,   99,   49,   49,   48,   48,   99,    0,
			    0,    0,    0,   96,   96,    0,    0,    0,   99,   99,
			   75,    0,    0,   96,   54,    0,    0,    0,   99,   54,
			    0,    0,   75,    0,   72,   96,    0,    0,   99,    0,
			    0,   55,    0,    0,   55,    0,   74,    0,    0,    0,
			    0,    0,   74,    0,    0,    0,    0,    0,    0,    0,
			   73,   86,   87,    0,    0,    0,   73,    0,   73,    0,
			    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5480
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 891
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 892
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

	yyNb_rules: INTEGER = 134
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 135
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

	dadl_parser: DADL_VALIDATOR
		once
			create Result.make
		end

	dadl_parser_error: detachable STRING

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

	c_domain_type: detachable C_DOMAIN_TYPE

	tid: INTEGER

end
