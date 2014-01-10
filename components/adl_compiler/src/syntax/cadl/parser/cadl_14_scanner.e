note
	component:   "openEHR ADL Tools"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_14_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_14_TOKENS
		export
			{NONE} all
		end

	ADL_14_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ADL_15_TERM_CODE_TOOLS
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
if yy_act <= 66 then
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 84 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 84")
end
-- Ignore separators
else
--|#line 85 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 85")
end
in_lineno := in_lineno + text_count
end
else
--|#line 90 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 90")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 91 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 91")
end
in_lineno := in_lineno + 1
else
--|#line 95 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 95")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 96 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 96")
end
last_token := Plus_code
else
--|#line 97 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 97")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 98 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 98")
end
last_token := Slash_code
else
--|#line 99 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 99")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 100 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 100")
end
last_token := Equal_code
else
--|#line 101 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 101")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 102 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 102")
end
last_token := Semicolon_code
else
--|#line 103 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 103")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 104 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 104")
end
last_token := Colon_code
else
--|#line 105 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 105")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 106 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 106")
end
last_token := Left_parenthesis_code
else
--|#line 107 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 107")
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
--|#line 108 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 108")
end
last_token := Dollar_code
else
--|#line 110 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 110")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
--|#line 112 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 112")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 114 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 114")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 115 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 115")
end
last_token := Right_bracket_code
else
--|#line 117 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 117")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 24 then
--|#line 118 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 118")
end
last_token := SYM_END_CBLOCK
else
--|#line 120 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 120")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 121 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 121")
end
last_token := SYM_LE
else
--|#line 122 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 122")
end
last_token := SYM_NE
end
else
if yy_act = 28 then
--|#line 124 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 124")
end
last_token := SYM_LT
else
--|#line 125 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 125")
end
last_token := SYM_GT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 127 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 127")
end
last_token := SYM_MODULO
else
--|#line 128 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 128")
end
last_token := SYM_DIV
end
else
if yy_act = 32 then
--|#line 130 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 130")
end
last_token := SYM_ELLIPSIS
else
--|#line 131 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 131")
end
last_token := SYM_LIST_CONTINUE
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
--|#line 135 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 135")
end
last_token := SYM_MATCHES
else
--|#line 137 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 137")
end
last_token := SYM_MATCHES
end
else
--|#line 141 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 141")
end
last_token := SYM_THEN
end
else
if yy_act = 37 then
--|#line 143 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 143")
end
last_token := SYM_ELSE
else
--|#line 145 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 145")
end
last_token := SYM_AND
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 147 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 147")
end
last_token := SYM_OR
else
--|#line 149 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 149")
end
last_token := SYM_XOR
end
else
if yy_act = 41 then
--|#line 151 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 151")
end
last_token := SYM_NOT
else
--|#line 153 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 153")
end
last_token := SYM_IMPLIES
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 155 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 155")
end
last_token := SYM_TRUE
else
--|#line 157 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 157")
end
last_token := SYM_FALSE
end
else
if yy_act = 45 then
--|#line 159 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 159")
end
last_token := SYM_FORALL
else
--|#line 161 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 161")
end
last_token := SYM_EXISTS
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 165 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 165")
end
last_token := SYM_EXISTENCE
else
--|#line 167 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 167")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 49 then
--|#line 169 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 169")
end
last_token := SYM_CARDINALITY
else
--|#line 171 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 171")
end
last_token := SYM_ORDERED
end
end
end
end
else
if yy_act <= 58 then
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act = 51 then
--|#line 173 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 173")
end
last_token := SYM_UNORDERED
else
--|#line 175 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 175")
end
last_token := SYM_UNIQUE
end
else
if yy_act = 53 then
--|#line 177 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 177")
end
last_token := SYM_USE_NODE
else
--|#line 179 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 179")
end
last_token := SYM_USE_ARCHETYPE
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 181 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 181")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 183 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 183")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 57 then
--|#line 185 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 185")
end
last_token := SYM_EXCLUDE
else
--|#line 187 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 187")
end
last_token := SYM_AFTER
end
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
--|#line 189 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 189")
end
last_token := SYM_BEFORE
else
--|#line 191 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 191")
end
last_token := SYM_CLOSED
end
else
if yy_act = 61 then
--|#line 195 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 195")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 201 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 201")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 208 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 208")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 215 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 215")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 65 then
--|#line 231 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 231")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_VALUE_SET_DEF)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 239 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 239")
end
 -- match second last line with ';' termination (assumed value)
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
if yy_act <= 99 then
if yy_act <= 83 then
if yy_act <= 75 then
if yy_act <= 71 then
if yy_act <= 69 then
if yy_act <= 68 then
if yy_act = 67 then
--|#line 246 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 246")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 253 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 253")
end
in_lineno := in_lineno + text_count
end
else
--|#line 256 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 256")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 70 then
--|#line 258 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 258")
end
 -- match final line, terminating in ']'
				if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
					last_token := ERR_VALUE_SET_DEF
					create str_.make (in_buffer.count)
					str_.append (in_buffer)
					in_buffer.wipe_out
					last_string_value := str_
				else
					in_buffer.append (text_substring(1, text_count-1))
					create str_.make (in_buffer.count)
					str_.append (in_buffer)
					in_buffer.wipe_out
					last_string_value := str_
					last_string_value.prune_all(' ')
					last_string_value.prune_all('%T')
					last_string_value.prune_all('%N')
					last_token := V_VALUE_SET_DEF
				end
				set_start_condition (INITIAL)
			
else
--|#line 281 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 281")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
--|#line 288 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 288")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 289 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 289")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 290 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 297 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 297")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act = 76 then
--|#line 298 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 298")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 305 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 305")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 306 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 306")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 313 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 313")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 314 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 314")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 321 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 321")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 82 then
--|#line 333 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 333")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 343 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 343")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
end
end
end
else
if yy_act <= 91 then
if yy_act <= 87 then
if yy_act <= 85 then
if yy_act = 84 then
--|#line 348 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 348")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 358 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 358")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 86 then
--|#line 364 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 364")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 375 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 375")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 384 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 384")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 398 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 398")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 90 then
--|#line 405 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 405")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 411 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 411")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
if yy_act = 92 then
--|#line 417 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 417")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 421 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 421")
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
if yy_act = 94 then
--|#line 463 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 463")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 469 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 469")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 475 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 475")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 481 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 481")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 98 then
--|#line 488 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 488")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text
		
else
--|#line 494 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 494")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 116 then
if yy_act <= 108 then
if yy_act <= 104 then
if yy_act <= 102 then
if yy_act <= 101 then
if yy_act = 100 then
--|#line 500 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 500")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
else
--|#line 506 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 506")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 513 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 513")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 103 then
--|#line 517 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 517")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 521 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 521")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 525 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 525")
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
--|#line 537 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 537")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 107 then
--|#line 544 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 544")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 549 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 549")
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
if yy_act <= 112 then
if yy_act <= 110 then
if yy_act = 109 then
--|#line 564 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 564")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 565 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 565")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 111 then
--|#line 569 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 569")
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
--|#line 570 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 570")
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
if yy_act <= 114 then
if yy_act = 113 then
--|#line 571 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 571")
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
--|#line 591 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 591")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 596 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 596")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 604 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 604")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 124 then
if yy_act <= 120 then
if yy_act <= 118 then
if yy_act = 117 then
--|#line 606 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 606")
end
in_buffer.append_character ('"')
else
--|#line 608 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 608")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 612 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 612")
end
in_buffer.append_string (text)
else
--|#line 614 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 614")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 619 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 619")
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
--|#line 630 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 630")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 639 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 639")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 641 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 641")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 642 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 642")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 643 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 643")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 644 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 644")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 645 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 645")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 647 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 647")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 648 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 648")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 652 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 652")
end
;
else
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
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
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
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
			create an_array.make_filled (0, 0, 6766)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
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
			   12,   12,   74,   83,   93,   83,   75,   74,   93,  101,

			   95,   75,   95,   95,  105,  151,  106,  106,  106,  106,
			  106,  106,  109,  152,  110,  197,  111,  111,  111,  111,
			  111,  111,  116,  116,  188,  116,  188,  188,  189,   84,
			   85,   84,   85,  158,  181,  201,  117,  287,   95,  182,
			   95,   95,  140,   76,  102,  777,  118,  210,   76,   94,
			  210,  198,  199,   94,  158,  112,  155,  212,  776,  155,
			  212,  158,  181,  244,  156,  117,  188,  182,  188,  188,
			  140,  245,  202,  203,  289,  190,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   90,   86,
			   86,   86,   86,   86,   86,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   86,   86,
			   91,   86,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  109,  187,  110,
			  759,  113,  113,  113,  113,  113,  113,  205,  116,  116,
			  205,  116,  116,  116,  204,  116,  214,  430,  116,  116,

			  232,  116,  187,  336,  336,  187,  336,  479,  116,  116,
			  479,  116,  118,  760,  116,  116,  118,  116,  520,  520,
			  112,  119,  118,  233,  122,  120,  123,  121,  232,  218,
			  198,  199,  118,  187,  327,  124,  116,  116,  118,  116,
			  207,  754,  133,  116,  116,  125,  116,  116,  116,  119,
			  116,  215,  122,  120,  123,  121,  126,  192,  116,  116,
			  118,  116,  201,  124,  127,  116,  116,  118,  116,  234,
			  133,  118,  187,  125,  116,  116,  128,  116,  129,  191,
			  191,  191,  118,  194,  194,  126,  157,  134,  287,  118,
			  753,  420,  127,  308,  187,  135,  130,  131,  118,  202,

			  203,  244,  132,  729,  128,  235,  129,  197,  136,  245,
			  193,  193,  193,  155,  148,  134,  155,  116,  116,  524,
			  116,  156,  405,  135,  130,  131,  116,  116,  157,  116,
			  132,  229,  205,  229,  229,  205,  136,  116,  116,  288,
			  116,  118,  148,  198,  199,  116,  116,  214,  116,  636,
			  118,  192,  137,  138,  138,  138,  138,  138,  138,  155,
			  112,  118,  155,  711,  162,  146,  149,  156,  139,  118,
			  147,  195,  195,  195,  157,  140,  116,  116,  209,  116,
			  144,  209,  141,  516,  142,  207,  143,  157,  145,  155,
			  210,  163,  155,  146,  684,  149,  139,  156,  147,  187,

			  242,  212,  215,  140,  157,  204,  155,  649,  144,  155,
			  162,  329,  558,  142,  156,  143,  145,  713,  714,  163,
			  361,  157,  159,  648,  155,  373,  160,  155,  161,  420,
			  155,  207,  156,  155,  164,  577,  373,  245,  156,  157,
			  162,  198,  199,  165,  155,  157,  373,  155,  202,  203,
			  159,  559,  156,  647,  160,  646,  161,  162,  168,  157,
			  636,  166,  164,  479,  373,  155,  479,  650,  155,  187,
			  169,  165,  167,  156,  578,  162,  191,  191,  191,  170,
			  157,  162,  155,  482,  155,  155,  168,  155,  632,  166,
			  156,  287,  156,  228,  228,  162,  228,  157,  169,  157,

			  234,  167,  653,  171,  172,  155,  651,  170,  155,  173,
			  175,  187,  157,  156,  177,  155,  162,  344,  155,  480,
			  157,  244,  483,  156,  174,  333,  332,  178,  333,  245,
			  157,  171,  172,  162,  187,  162,  155,  173,  175,  155,
			  209,  654,  177,  209,  156,  176,  155,  194,  194,  155,
			  179,  157,  210,  211,  156,  178,  162,  636,  180,  334,
			  332,  157,  334,  212,  553,  754,  162,  553,  336,  336,
			  222,  336,  610,  176,  713,  714,  183,  600,  179,  223,
			  223,  223,  223,  223,  223,  719,  180,  162,  191,  191,
			  191,  243,  441,  207,  794,  184,  432,  162,  231,  231,

			  231,  231,  231,  231,  183,  236,  236,  236,  236,  236,
			  236,  325,  325,  325,  232,  224,  241,  241,  241,  241,
			  241,  241,  556,  552,  184,  217,  217,  720,  217,  535,
			  225,  726,  726,  726,  226,  187,  227,  233,  109,  109,
			  187,  110,  232,  239,  239,  239,  239,  239,  239,  240,
			  486,  218,  362,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  237,  237,  237,  237,
			  237,  237,  112,  481,  447,  434,  481,  116,  116,  109,
			  116,  110,  238,  239,  239,  239,  239,  239,  239,  332,

			  243,  244,  116,  116,  332,  116,  219,  328,  553,  245,
			  631,  118,  326,  326,  326,  243,  244,  191,  191,  191,
			  238,  732,  116,  116,  245,  116,  118,  116,  116,  732,
			  116,  209,  112,  353,  209,  243,  244,  719,  631,  408,
			  243,  244,  732,  210,  245,  400,  118,  247,  636,  245,
			  362,  118,  116,  116,  212,  116,  108,  732,  249,  248,
			  357,  357,  357,  357,  357,  243,  244,  116,  116,  361,
			  116,  108,  108,  108,  245,  247,  118,  349,  794,  721,
			  243,  244,  343,  342,  207,  250,  249,  248,  341,  245,
			  340,  118,  116,  116,  337,  116,  794,  208,  116,  116,

			  327,  116,  291,  291,  291,  243,  244,  328,  327,  187,
			  251,  243,  244,  250,  245,  295,  118,  290,  794,  154,
			  245,  287,  118,  116,  116,  266,  116,  116,  116,  230,
			  116,  229,  252,  228,  117,  284,  243,  244,  251,  221,
			  243,  244,  253,  116,  116,  245,  116,  118,  117,  245,
			  117,  118,   99,  254,   96,  208,  243,  244,  187,  255,
			  252,  185,  117,  284,  256,  245,  154,  118,  115,  114,
			  253,  116,  116,  107,  116,  116,  116,  104,  116,  117,
			  458,  254,   99,   97,  243,  244,  257,  255,  243,  244,
			   96,  458,  256,  258,  794,  118,  794,  245,  794,  118, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  794,  458,  544,  794,  116,  116,  794,  116,  116,  116,
			  794,  116,  794,  544,  257,  794,  259,  243,  244,  458,
			  794,  243,  244,  544,  116,  116,  245,  116,  118,  794,
			  245,  361,  118,  794,  260,  794,  473,  243,  244,  794,
			  794,  544,  116,  116,  259,  116,  245,  473,  118,  158,
			  158,  158,  158,  158,  158,  243,  244,  473,  116,  116,
			  733,  116,  260,  261,  245,  313,  118,  794,  733,  262,
			  155,  243,  244,  155,  794,  473,  116,  116,  156,  116,
			  245,  733,  118,  243,  244,  157,  794,  263,  264,  243,
			  244,  794,  245,  313,  794,  794,  733,  262,  245,  794,

			  118,  794,  521,  794,  521,  116,  116,  265,  116,  116,
			  116,  794,  116,  522,  187,  263,  264,  794,  243,  244,
			  137,  162,  243,  244,  137,  794,  794,  245,  794,  118,
			  794,  245,  794,  118,  794,  265,  267,  243,  268,  794,
			  139,  523,  187,  794,  117,  794,  245,  794,  794,  282,
			  274,  794,  794,  283,  274,  269,  142,  794,  117,  270,
			  117,  794,  271,  209,  684,  684,  209,  684,  139,  117,
			  794,  272,  117,  273,  794,  210,  794,  282,  187,  794,
			  794,  283,  794,  269,  794,  142,  212,  270,  706,  117,
			  271,  193,  193,  193,  794,  117,  279,  794,  117,  280,

			  272,  794,  273,  275,  275,  275,  275,  275,  275,  117,
			  794,  117,  117,  281,  117,  187,  207,  794,  117,  195,
			  195,  195,  276,  117,  279,  277,  117,  280,  794,  794,
			  794,  278,  117,  117,  117,  586,  586,  586,  586,  586,
			  117,  281,  794,  117,  117,  285,  117,  117,  794,  117,
			  276,  794,  794,  277,  794,  191,  191,  191,  117,  278,
			  117,  117,  286,  117,  794,  794,  155,  794,  794,  155,
			  117,  794,  117,  285,  156,  794,  794,  794,  117,  243,
			  244,  157,  155,  794,  117,  155,  117,  794,  245,  117,
			  156,  286,  191,  191,  191,  243,  244,  157,  117,  155,

			  794,  794,  155,  794,  245,  794,  794,  156,  741,  794,
			  794,  292,  243,  244,  157,  117,  741,  162,  117,  293,
			  679,  245,  794,  155,  679,  794,  155,  794,  794,  741,
			  294,  156,  117,  162,  117,  794,  243,  244,  157,  292,
			  155,  679,  794,  155,  741,  245,  117,  293,  156,  794,
			  162,  187,  679,  243,  244,  157,  296,  155,  294,  267,
			  155,  268,  245,  117,  794,  156,  331,  332,  794,  331,
			  243,  244,  157,  155,  162,  794,  155,  794,  333,  245,
			  794,  156,  270,  297,  296,  467,  243,  244,  157,  334,
			  155,  162,  117,  155,  794,  245,  794,  298,  156,  665,

			  665,  665,  665,  243,  244,  157,  742,  794,  162,  794,
			  270,  297,  245,  467,  742,  155,  794,  299,  155,  335,
			  300,  794,  794,  156,  162,  298,  301,  742,  243,  244,
			  157,  320,  321,  322,  323,  324,  155,  245,  794,  155,
			  594,  162,  742,  794,  156,  299,  794,  640,  300,  243,
			  244,  157,  302,  794,  301,  794,  794,  594,  245,  155,
			  794,  594,  155,  794,  640,  794,  162,  156,  640,  794,
			  794,  794,  243,  244,  157,  155,  794,  794,  155,  303,
			  302,  258,  794,  156,  794,  594,  794,  162,  243,  244,
			  157,  155,  640,  794,  155,  794,  794,  245,  794,  156,

			  667,  668,  667,  668,  243,  244,  157,  303,  549,  155,
			  162,  794,  155,  245,  794,  794,  304,  156,  794,  550,
			  794,  305,  243,  244,  157,  794,  162,  794,  794,  551,
			  794,  245,  158,  158,  158,  158,  158,  158,  794,  669,
			  794,  794,  162,  366,  304,  794,  794,  550,  794,  305,
			  338,  339,  339,  339,  339,  339,  339,  117,  794,  117,
			  162,  309,  794,  794,  306,  155,  794,  794,  155,  794,
			  794,  366,  794,  156,  787,  788,  787,  788,  243,  244,
			  157,  307,  308,  308,  308,  308,  308,  245,  117,  309,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,

			  158,  158,  158,  158,  158,  158,  158,  158,  794,  794,
			  311,  794,  794,  789,  680,  604,  162,  312,  680,  310,
			  158,  158,  158,  158,  158,  158,  604,  794,  158,  158,
			  158,  158,  158,  158,  794,  680,  605,  794,  311,  158,
			  158,  158,  158,  158,  158,  312,  680,  310,  315,  794,
			  314,  794,  316,  794,  604,  317,  794,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  345,
			  345,  345,  345,  345,  345,  794,  315,  794,  314,  794,
			  316,  794,  794,  317,  318,  232,  348,  348,  348,  348,
			  348,  348,  346,  794,  346,  117,  319,  347,  347,  347,

			  347,  347,  347,  757,  757,  757,  757,  757,  233,  117,
			  794,  117,  318,  232,  350,  350,  350,  350,  350,  350,
			  794,  794,  794,  117,  794,  319,  330,  331,  332,  330,
			  331,  330,  330,  330,  330,  330,  330,  330,  330,  333,
			  117,  794,  330,  351,  351,  351,  351,  351,  351,  330,
			  334,  330,  330,  330,  330,  354,  794,  354,  794,  352,
			  355,  355,  355,  355,  355,  355,  358,  358,  358,  358,
			  358,  358,  380,  380,  380,  380,  380,  380,  330,  330,
			  335,  330,  353,  794,  109,  794,  110,  352,  356,  356,
			  356,  356,  356,  356,  381,  381,  381,  381,  381,  381,

			  384,  384,  384,  384,  384,  384,  330,  330,  330,  330,
			  330,  330,  330,  330,  330,  330,  330,  217,  217,  794,
			  217,  385,  385,  385,  385,  385,  385,  112,  794,  117,
			  386,  386,  386,  386,  386,  386,  387,  387,  387,  387,
			  387,  387,  794,  218,  794,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  447,  794,
			  794,  794,  794,  794,  679,  794,  794,  794,  681,  794,
			  794,  746,  604,  746,  794,  117,  363,  794,  117,  794,
			  680,  117,  747,  606,  682,  681,  117,  364,  219,  117,

			  365,  117,  117,  607,  117,  117,  681,  117,  794,  367,
			  117,  682,  117,  117,  363,  794,  117,  794,  794,  117,
			  748,  606,  682,  794,  117,  364,  794,  794,  365,  794,
			  117,  117,  368,  117,  117,  794,  117,  367,  794,  117,
			  369,  117,  794,  794,  794,  117,  794,  117,  117,  794,
			  117,  794,  370,  117,  794,  117,  794,  794,  117,  117,
			  368,  794,  117,  794,  642,  794,  794,  117,  369,  794,
			  794,  371,  117,  117,  117,  794,  117,  117,  794,  117,
			  370,  642,  117,  374,  117,  642,  117,  117,  375,  117,
			  794,  117,  794,  117,  794,  794,  117,  372,  117,  371, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  794,  117,  794,  117,  794,  117,  794,  794,  794,  642,
			  117,  374,  794,  794,  794,  794,  375,  794,  117,  772,
			  117,  772,  117,  377,  117,  376,  794,  117,  117,  702,
			  773,  117,  379,  702,  117,  794,  117,  794,  117,  794,
			  117,  794,  117,  378,  117,  117,  676,  117,  117,  780,
			  702,  377,  117,  376,  794,  794,  117,  794,  774,  117,
			  379,  702,  794,  676,  794,  117,  780,  676,  794,  117,
			  780,  378,  388,  117,  389,  794,  117,  794,  382,  382,
			  382,  382,  382,  382,  117,  117,  117,  117,  117,  117,
			  794,  676,  117,  117,  780,  390,  794,  794,  391,  779,

			  779,  779,  779,  779,  392,  278,  117,  383,  117,  117,
			  117,  117,  117,  117,  117,  117,  794,  794,  794,  794,
			  117,  117,  794,  390,  794,  794,  391,  794,  794,  117,
			  794,  394,  392,  278,  117,  117,  395,  117,  117,  794,
			  117,  794,  393,  794,  117,  794,  794,  794,  117,  117,
			  117,  117,  794,  447,  117,  396,  117,  117,  117,  117,
			  117,  794,  117,  117,  395,  794,  794,  605,  117,  794,
			  393,  397,  117,  117,  794,  117,  794,  117,  607,  117,
			  117,  117,  117,  396,  794,  117,  794,  117,  607,  117,
			  794,  117,  794,  117,  794,  117,  117,  117,  117,  397,

			  399,  398,  794,  794,  117,  117,  607,  781,  794,  117,
			  117,  401,  794,  401,  401,  401,  401,  401,  401,  287,
			  794,  794,  117,  794,  781,  794,  117,  117,  781,  399,
			  402,  403,  404,  404,  404,  404,  287,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  794,
			  794,  794,  781,  406,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  794,  407,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  794,  406,  117,  410,  409,  158,  158,  158,  158,  158,
			  158,  794,  794,  794,  449,  407,  117,  794,  117,  794,

			  794,  412,  411,  158,  158,  158,  158,  158,  158,  794,
			  117,  410,  409,  158,  158,  158,  158,  158,  158,  703,
			  794,  794,  449,  703,  413,  794,  794,  117,  763,  412,
			  411,  158,  158,  158,  158,  158,  158,  794,  794,  763,
			  703,  414,  158,  158,  158,  158,  158,  158,  794,  763,
			  794,  703,  413,  158,  158,  158,  158,  158,  158,  415,
			  794,  158,  158,  158,  158,  158,  158,  763,  794,  414,
			  794,  794,  794,  794,  417,  158,  158,  158,  158,  158,
			  158,  416,  418,  794,  794,  794,  420,  415,  158,  158,
			  158,  158,  158,  158,  794,  419,  158,  158,  158,  158,

			  158,  158,  417,  158,  158,  158,  158,  158,  158,  794,
			  418,  158,  158,  158,  158,  158,  158,  421,  794,  794,
			  794,  784,  794,  419,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  794,  794,  784,  794,
			  423,  422,  784,  794,  785,  421,  158,  158,  158,  158,
			  158,  158,  794,  424,  158,  158,  158,  158,  158,  158,
			  794,  785,  425,  794,  794,  785,  784,  764,  423,  422,
			  158,  158,  158,  158,  158,  158,  794,  794,  764,  794,
			  426,  424,  158,  158,  158,  158,  158,  158,  764,  785,
			  425,  158,  158,  158,  158,  158,  158,  427,  158,  158,

			  158,  158,  158,  158,  794,  794,  764,  794,  426,  338,
			  339,  339,  339,  339,  339,  339,  794,  794,  794,  794,
			  794,  428,  794,  794,  794,  427,  794,  794,  794,  794,
			  794,  429,  347,  347,  347,  347,  347,  347,  431,  431,
			  431,  431,  431,  431,  433,  433,  433,  433,  433,  433,
			  435,  435,  435,  435,  435,  435,  794,  794,  794,  794,
			  429,  794,  436,  436,  436,  436,  436,  436,  439,  439,
			  439,  439,  439,  439,  437,  794,  437,  432,  352,  438,
			  438,  438,  438,  438,  438,  355,  355,  355,  355,  355,
			  355,  440,  440,  440,  440,  440,  440,  794,  794,  794,

			  794,  353,  794,  794,  442,  443,  352,  444,  444,  444,
			  444,  444,  444,  445,  445,  445,  445,  445,  445,  446,
			  446,  446,  446,  446,  446,  794,  794,  794,  794,  794,
			  441,  794,  794,  794,  794,  794,  794,  794,  794,  702,
			  794,  117,  117,  704,  794,  117,  794,  794,  117,  453,
			  452,  117,  794,  794,  451,  117,  117,  450,  117,  117,
			  704,  117,  117,  794,  117,  117,  794,  117,  794,  117,
			  117,  704,  794,  117,  794,  794,  117,  453,  452,  117,
			  794,  794,  451,  794,  117,  703,  450,  117,  117,  705,
			  117,  117,  456,  117,  457,  794,  117,  117,  117,  454,

			  117,  794,  455,  794,  117,  117,  705,  117,  794,  794,
			  794,  117,  117,  117,  794,  794,  117,  705,  794,  117,
			  456,  794,  457,  794,  117,  117,  794,  454,  794,  117,
			  455,  117,  461,  117,  117,  794,  117,  117,  117,  459,
			  117,  794,  117,  794,  794,  117,  460,  117,  117,  463,
			  117,  117,  117,  117,  794,  794,  794,  117,  794,  117,
			  461,  462,  117,  794,  794,  117,  794,  459,  794,  117,
			  794,  117,  117,  117,  460,  794,  117,  463,  794,  117,
			  794,  794,  117,  794,  464,  117,  117,  794,  117,  462,
			  380,  380,  380,  380,  380,  380,  794,  794,  794,  117,

			  117,  244,  117,  381,  381,  381,  381,  381,  381,  245,
			  794,  794,  464,  117,  794,  117,  794,  117,  465,  275,
			  275,  275,  275,  275,  275,  794,  794,  117,  267,  794,
			  268,  466,  384,  384,  384,  384,  384,  384,  385,  385,
			  385,  385,  385,  385,  117,  794,  465,  794,  117,  794,
			  794,  794,  794,  794,  467,  636,  794,  794,  794,  466,
			  467,  117,  386,  386,  386,  386,  386,  386,  733,  794,
			  794,  117,  794,  794,  794,  794,  734,  468,  794,  794,
			  794,  794,  467,  794,  794,  794,  794,  794,  467,  734,
			  794,  117,  387,  387,  387,  387,  387,  387,  794,  794,

			  117,  794,  794,  794,  734,  468,  469,  469,  469,  469,
			  469,  469,  470,  470,  470,  470,  470,  470,  471,  471,
			  471,  471,  471,  471,  794,  117,  472,  472,  472,  472,
			  472,  472,  794,  794,  794,  794,  794,  794,  794,  769,
			  794,  478,  794,  794,  794,  794,  794,  117,  117,  117,
			  769,  794,  117,  794,  117,  117,  475,  794,  794,  117,
			  769,  794,  117,  117,  117,  117,  117,  474,  117,  794,
			  117,  476,  117,  117,  117,  117,  117,  117,  769,  794,
			  117,  794,  477,  794,  475,  794,  794,  117,  117,  794,
			  117,  794,  794,  117,  117,  474,  794,  117,  794,  476, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  794,  117,  117,  794,  117,  794,  794,  794,  794,  401,
			  477,  401,  401,  401,  401,  401,  401,  287,  484,  117,
			  404,  404,  404,  404,  404,  404,  287,  482,  794,  404,
			  404,  404,  404,  404,  404,  287,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  481,  489,
			  490,  490,  490,  490,  490,  794,  794,  485,  794,  794,
			  794,  794,  794,  487,  794,  794,  483,  158,  158,  158,
			  158,  158,  158,  488,  794,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  794,  794,  794,
			  794,  487,  794,  794,  491,  492,  794,  493,  794,  794,

			  794,  794,  488,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  794,  491,  492,  794,  493,  158,  158,  158,  158,
			  158,  158,  794,  158,  158,  158,  158,  158,  158,  494,
			  794,  794,  496,  794,  495,  497,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  794,  794,  498,  494,  794,  794,
			  496,  794,  495,  497,  501,  502,  502,  502,  502,  502,
			  770,  500,  499,  158,  158,  158,  158,  158,  158,  794,
			  794,  770,  794,  794,  498,  158,  158,  158,  158,  158,

			  158,  770,  503,  158,  158,  158,  158,  158,  158,  500,
			  499,  158,  158,  158,  158,  158,  158,  794,  794,  770,
			  794,  794,  504,  158,  158,  158,  158,  158,  158,  794,
			  503,  158,  158,  158,  158,  158,  158,  794,  505,  158,
			  158,  158,  158,  158,  158,  794,  794,  794,  794,  794,
			  504,  794,  794,  794,  507,  158,  158,  158,  158,  158,
			  158,  506,  794,  794,  794,  478,  505,  508,  158,  158,
			  158,  158,  158,  158,  794,  794,  794,  794,  509,  794,
			  794,  794,  507,  510,  510,  510,  510,  510,  510,  506,
			  794,  794,  794,  794,  794,  508,  511,  511,  511,  511,

			  511,  511,  794,  794,  794,  794,  509,  345,  345,  345,
			  345,  345,  345,  512,  513,  513,  513,  513,  513,  794,
			  794,  794,  432,  514,  514,  514,  514,  514,  514,  438,
			  438,  438,  438,  438,  438,  794,  794,  794,  794,  352,
			  515,  515,  515,  515,  515,  515,  517,  517,  517,  517,
			  517,  517,  518,  518,  518,  518,  518,  518,  794,  794,
			  794,  794,  353,  794,  794,  794,  794,  352,  519,  519,
			  519,  519,  519,  519,  794,  794,  794,  794,  794,  516,
			  514,  514,  514,  514,  514,  514,  794,  794,  794,  794,
			  443,  441,  444,  444,  444,  444,  444,  444,  794,  794,

			  794,  794,  117,  117,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  117,  117,  117,  117,
			  794,  117,  528,  794,  117,  530,  794,  527,  531,  794,
			  117,  117,  529,  794,  794,  117,  794,  117,  117,  117,
			  117,  117,  117,  794,  117,  794,  794,  117,  117,  117,
			  528,  794,  117,  530,  794,  794,  531,  794,  794,  794,
			  529,  117,  532,  794,  794,  794,  117,  117,  794,  117,
			  117,  117,  536,  117,  533,  117,  794,  117,  794,  794,
			  117,  117,  794,  117,  794,  117,  534,  117,  794,  117,
			  532,  794,  794,  794,  117,  117,  117,  794,  794,  117,

			  536,  794,  533,  794,  537,  794,  117,  117,  117,  636,
			  794,  794,  117,  794,  534,  794,  117,  117,  117,  794,
			  117,  117,  742,  117,  794,  117,  117,  538,  794,  539,
			  743,  117,  537,  117,  794,  117,  794,  794,  794,  794,
			  117,  794,  117,  743,  794,  117,  794,  794,  794,  117,
			  117,  540,  117,  794,  117,  538,  794,  539,  743,  794,
			  794,  794,  117,  794,  117,  794,  117,  794,  794,  794,
			  794,  117,  541,  541,  541,  541,  541,  541,  117,  540,
			  117,  117,  117,  117,  117,  117,  469,  469,  469,  469,
			  469,  469,  794,  794,  794,  117,  794,  794,  794,  794,

			  244,  117,  470,  470,  470,  470,  470,  470,  245,  794,
			  794,  388,  794,  389,  542,  471,  471,  471,  471,  471,
			  471,  794,  794,  472,  472,  472,  472,  472,  472,  794,
			  543,  794,  794,  794,  794,  794,  794,  391,  117,  545,
			  794,  794,  542,  392,  117,  117,  794,  117,  546,  794,
			  794,  794,  117,  794,  117,  794,  117,  794,  543,  794,
			  794,  117,  794,  117,  794,  391,  117,  545,  547,  794,
			  117,  392,  117,  117,  794,  117,  546,  158,  158,  158,
			  158,  158,  158,  117,  117,  794,  794,  794,  794,  794,
			  117,  794,  117,  794,  794,  794,  547,  794,  794,  548,

			  794,  117,  794,  794,  117,  794,  117,  402,  554,  554,
			  554,  554,  554,  287,  794,  794,  794,  794,  117,  402,
			  555,  554,  554,  554,  554,  287,  794,  548,  158,  158,
			  158,  158,  158,  158,  558,  117,  490,  490,  490,  490,
			  490,  490,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  794,  794,  794,  794,  560,  158,
			  158,  158,  158,  158,  158,  794,  794,  557,  794,  794,
			  794,  561,  794,  559,  562,  158,  158,  158,  158,  158,
			  158,  794,  794,  794,  794,  794,  560,  794,  794,  794,
			  563,  158,  158,  158,  158,  158,  158,  794,  794,  561,

			  794,  794,  562,  794,  794,  794,  794,  564,  158,  158,
			  158,  158,  158,  158,  794,  794,  794,  794,  563,  565,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  794,  794,  794,  564,  794,  794,  794,  794,
			  794,  566,  567,  794,  794,  794,  794,  565,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  794,  794,  794,  568,  794,  794,  794,  794,  794,  566,
			  567,  420,  794,  502,  502,  502,  502,  502,  502,  245,
			  158,  158,  158,  158,  158,  158,  794,  794,  794,  794,
			  794,  568,  794,  794,  794,  794,  569,  794,  158,  158,

			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  794,  794,  794,  794,
			  571,  794,  794,  794,  569,  570,  572,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  794,
			  794,  794,  794,  573,  794,  794,  794,  794,  571,  794,
			  794,  794,  794,  570,  572,  794,  794,  794,  794,  794,
			  574,  158,  158,  158,  158,  158,  158,  794,  794,  794,
			  794,  573,  576,  576,  576,  576,  576,  576,  794,  514,
			  514,  514,  514,  514,  514,  575,  794,  577,  574,  513,
			  513,  513,  513,  513,  513,  579,  580,  580,  580,  580, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  580,  580,  581,  581,  581,  581,  581,  581,  794,  794,
			  794,  794,  794,  575,  582,  582,  582,  582,  582,  582,
			  794,  794,  794,  579,  794,  794,  578,  583,  583,  583,
			  583,  583,  583,  794,  794,  516,  584,  584,  584,  584,
			  584,  584,  585,  585,  585,  585,  585,  585,  587,  587,
			  587,  587,  587,  587,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  238,  794,  794,  589,  794,  794,
			  117,  117,  590,  794,  117,  117,  794,  794,  794,  794,
			  794,  794,  794,  794,  117,  117,  117,  117,  117,  117,
			  117,  117,  238,  117,  591,  589,  117,  117,  117,  117,

			  590,  794,  117,  117,  592,  794,  794,  117,  794,  117,
			  117,  117,  117,  117,  794,  117,  117,  117,  794,  117,
			  117,  117,  591,  593,  117,  117,  794,  794,  794,  794,
			  117,  117,  592,  117,  794,  794,  794,  794,  117,  794,
			  794,  117,  117,  595,  117,  117,  117,  794,  794,  794,
			  794,  593,  117,  596,  794,  794,  117,  598,  117,  794,
			  794,  794,  117,  117,  794,  794,  117,  794,  117,  794,
			  117,  595,  117,  794,  794,  117,  597,  117,  794,  117,
			  117,  596,  794,  794,  117,  598,  794,  794,  794,  599,
			  794,  117,  794,  794,  794,  794,  794,  117,  794,  794,

			  794,  117,  794,  117,  597,  117,  794,  267,  117,  268,
			  117,  541,  541,  541,  541,  541,  541,  599,  794,  794,
			  794,  794,  794,  794,  117,  794,  117,  794,  608,  609,
			  609,  609,  609,  609,  117,  117,  603,  794,  117,  794,
			  117,  794,  602,  117,  794,  794,  794,  601,  794,  117,
			  117,  117,  117,  794,  794,  117,  794,  117,  794,  117,
			  794,  794,  794,  117,  603,  794,  794,  794,  794,  794,
			  602,  117,  794,  794,  794,  601,  794,  794,  794,  794,
			  117,  117,  794,  794,  794,  794,  794,  482,  117,  554,
			  554,  554,  554,  554,  554,  287,  484,  794,  554,  554,

			  554,  554,  554,  554,  287,  611,  612,  612,  612,  612,
			  612,  158,  158,  158,  158,  158,  158,  489,  614,  614,
			  614,  614,  614,  613,  794,  794,  483,  158,  158,  158,
			  158,  158,  158,  794,  794,  485,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  615,  794,
			  117,  613,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  117,  794,  117,  794,  616,  158,
			  158,  158,  158,  158,  158,  794,  615,  794,  117,  794,
			  794,  617,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  794,  117,  616,  158,  158,  158,

			  158,  158,  158,  618,  794,  794,  794,  794,  794,  617,
			  794,  794,  794,  620,  794,  794,  619,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  794,
			  794,  618,  158,  158,  158,  158,  158,  158,  794,  622,
			  794,  620,  794,  794,  619,  621,  794,  623,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  794,  622,  794,  794,
			  794,  794,  794,  621,  625,  623,  794,  794,  794,  794,
			  794,  624,  158,  158,  158,  158,  158,  158,  510,  510,
			  510,  510,  510,  510,  794,  794,  794,  626,  794,  794,

			  794,  794,  625,  512,  627,  627,  627,  627,  627,  624,
			  628,  794,  628,  794,  794,  629,  629,  629,  629,  629,
			  629,  794,  794,  794,  794,  626,  629,  629,  629,  629,
			  629,  629,  630,  630,  630,  630,  630,  630,  518,  518,
			  518,  518,  518,  518,  633,  633,  633,  633,  633,  633,
			  634,  634,  634,  634,  634,  634,  635,  635,  635,  635,
			  635,  635,  794,  794,  794,  516,  794,  794,  794,  794,
			  794,  794,  631,  794,  794,  794,  794,  794,  117,  794,
			  794,  794,  117,  794,  639,  117,  794,  794,  638,  117,
			  637,  794,  117,  117,  117,  353,  117,  794,  117,  117,

			  631,  117,  794,  117,  794,  117,  117,  117,  794,  117,
			  117,  794,  639,  117,  794,  794,  638,  117,  637,  794,
			  794,  117,  794,  117,  794,  794,  794,  117,  794,  794,
			  117,  117,  794,  794,  117,  117,  117,  794,  117,  794,
			  117,  117,  643,  794,  641,  117,  794,  117,  794,  117,
			  117,  117,  117,  794,  117,  117,  117,  117,  794,  117,
			  794,  794,  794,  117,  117,  794,  794,  794,  117,  117,
			  643,  794,  641,  794,  117,  794,  117,  794,  644,  794,
			  117,  117,  117,  645,  794,  117,  117,  794,  117,  794,
			  117,  794,  794,  794,  794,  794,  117,  794,  117,  794,

			  794,  794,  117,  794,  794,  794,  644,  794,  794,  794,
			  117,  645,  158,  158,  158,  158,  158,  158,  650,  117,
			  609,  609,  609,  609,  609,  609,  653,  117,  612,  612,
			  612,  612,  612,  612,  794,  794,  794,  794,  558,  655,
			  614,  614,  614,  614,  614,  614,  794,  158,  158,  158,
			  158,  158,  158,  794,  794,  794,  794,  651,  158,  158,
			  158,  158,  158,  158,  794,  654,  794,  655,  656,  158,
			  158,  158,  158,  158,  158,  794,  794,  559,  794,  794,
			  794,  794,  794,  657,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  656,  158,  158,  158,

			  158,  158,  158,  158,  158,  158,  158,  158,  158,  794,
			  794,  657,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  794,  794,  794,  794,  794,  658,  794,  794,  794,  794,
			  659,  158,  158,  158,  158,  158,  158,  794,  158,  158,
			  158,  158,  158,  158,  629,  629,  629,  629,  629,  629,
			  660,  794,  794,  658,  661,  794,  794,  577,  659,  627,
			  627,  627,  627,  627,  627,  629,  629,  629,  629,  629,
			  629,  662,  662,  662,  662,  662,  662,  794,  660,  663,
			  794,  663,  661,  794,  664,  664,  664,  664,  664,  664,

			  666,  666,  666,  666,  666,  666,  578,  670,  670,  670,
			  670,  670,  670,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  631,  794,  794,  794,  794,  672,  117,
			  794,  794,  794,  117,  117,  674,  794,  794,  673,  794,
			  794,  794,  794,  117,  794,  117,  353,  117,  117,  117,
			  117,  631,  675,  117,  794,  794,  672,  117,  794,  794,
			  794,  117,  117,  674,  794,  794,  673,  117,  794,  117,
			  794,  677,  794,  794,  117,  117,  678,  794,  117,  117,
			  675,  117,  794,  794,  794,  117,  117,  117,  794,  117,
			  794,  117,  608,  683,  683,  683,  683,  683,  117,  677, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  794,  117,  117,  678,  611,  685,  685,  685,  685,
			  685,  794,  794,  794,  117,  794,  117,  794,  794,  794,
			  117,  158,  158,  158,  158,  158,  158,  794,  794,  794,
			  794,  117,  794,  794,  794,  686,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  794,  794,  687,  794,  688,  794,
			  794,  794,  689,  686,  158,  158,  158,  158,  158,  158,
			  794,  158,  158,  158,  158,  158,  158,  794,  794,  690,
			  794,  794,  794,  794,  687,  794,  688,  691,  794,  794,
			  689,  158,  158,  158,  158,  158,  158,  664,  664,  664,

			  664,  664,  664,  794,  794,  794,  794,  690,  692,  692,
			  692,  692,  692,  692,  794,  691,  693,  693,  693,  693,
			  693,  693,  523,  523,  523,  523,  523,  523,  694,  694,
			  694,  694,  694,  694,  695,  695,  695,  695,  695,  695,
			  696,  696,  696,  696,  696,  696,  794,  516,  794,  794,
			  794,  794,  794,  794,  794,  794,  631,  794,  794,  794,
			  794,  794,  117,  794,  794,  794,  698,  117,  794,  794,
			  794,  117,  794,  794,  794,  794,  117,  794,  117,  353,
			  794,  699,  794,  117,  631,  117,  117,  117,  794,  794,
			  117,  794,  794,  794,  698,  117,  794,  794,  794,  117,

			  117,  794,  117,  794,  117,  700,  794,  117,  117,  699,
			  794,  794,  117,  794,  117,  794,  117,  794,  117,  794,
			  117,  794,  701,  650,  117,  683,  683,  683,  683,  683,
			  683,  117,  117,  700,  794,  653,  117,  685,  685,  685,
			  685,  685,  685,  158,  158,  158,  158,  158,  158,  117,
			  701,  794,  794,  117,  158,  158,  158,  158,  158,  158,
			  794,  794,  651,  158,  158,  158,  158,  158,  158,  794,
			  794,  794,  708,  707,  654,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  794,  794,  794,
			  794,  709,  158,  158,  158,  158,  158,  158,  794,  794,

			  708,  707,  662,  662,  662,  662,  662,  662,  712,  712,
			  712,  712,  712,  712,  794,  794,  794,  794,  667,  709,
			  667,  710,  794,  695,  695,  695,  695,  695,  695,  696,
			  696,  696,  696,  696,  696,  794,  794,  794,  117,  715,
			  794,  516,  794,  794,  794,  794,  794,  794,  794,  710,
			  794,  794,  117,  794,  117,  794,  117,  669,  794,  794,
			  794,  794,  794,  117,  117,  794,  117,  715,  794,  794,
			  117,  794,  117,  794,  716,  794,  717,  117,  117,  117,
			  117,  794,  718,  117,  117,  158,  158,  158,  158,  158,
			  158,  117,  117,  794,  158,  158,  158,  158,  158,  158,

			  794,  117,  794,  716,  717,  794,  794,  794,  117,  117,
			  722,  718,  158,  158,  158,  158,  158,  158,  723,  158,
			  158,  158,  158,  158,  158,  727,  727,  727,  727,  727,
			  727,  794,  794,  794,  794,  794,  794,  794,  722,  794,
			  724,  158,  158,  158,  158,  158,  158,  723,  117,  117,
			  794,  794,  725,  794,  794,  117,  158,  158,  158,  158,
			  158,  158,  730,  117,  117,  117,  794,  794,  724,  117,
			  117,  117,  794,  794,  794,  794,  117,  117,  794,  794,
			  731,  725,  794,  117,  117,  735,  117,  794,  794,  794,
			  730,  794,  794,  117,  117,  794,  794,  794,  117,  794,

			  117,  158,  158,  158,  158,  158,  158,  794,  731,  794,
			  794,  794,  794,  735,  794,  117,  158,  158,  158,  158,
			  158,  158,  737,  737,  737,  737,  737,  737,  669,  669,
			  669,  669,  669,  669,  738,  738,  738,  738,  738,  738,
			  794,  736,  794,  794,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  117,  794,  794,  117,
			  740,  794,  794,  794,  794,  794,  745,  794,  794,  736,
			  117,  794,  117,  117,  739,  117,  794,  744,  158,  158,
			  158,  158,  158,  158,  117,  794,  794,  117,  740,  794,
			  749,  794,  750,  751,  745,  738,  738,  738,  738,  738,

			  738,  117,  117,  739,  117,  117,  744,  794,  794,  794,
			  794,  794,  752,  794,  794,  794,  117,  794,  117,  117,
			  794,  117,  794,  158,  158,  158,  158,  158,  158,  794,
			  117,  794,  794,  117,  756,  756,  756,  756,  756,  756,
			  752,  758,  758,  758,  758,  758,  758,  117,  755,  794,
			  117,  761,  761,  761,  761,  761,  761,  158,  158,  158,
			  158,  158,  158,  794,  794,  117,  762,  766,  766,  766,
			  766,  766,  766,  765,  794,  794,  755,  794,  794,  117,
			  794,  117,  767,  767,  767,  767,  767,  767,  794,  794,
			  794,  794,  794,  117,  762,  794,  794,  794,  794,  759,

			  794,  765,  758,  758,  758,  758,  758,  758,  794,  794,
			  117,  758,  758,  758,  758,  758,  758,  749,  794,  750,
			  768,  794,  761,  761,  761,  761,  761,  761,  158,  158,
			  158,  158,  158,  158,  117,  771,  771,  771,  771,  771,
			  771,  775,  775,  775,  775,  775,  775,  794,  117,  794,
			  117,  748,  748,  748,  748,  748,  748,  794,  794,  794,
			  794,  794,  117,  778,  778,  778,  778,  778,  778,  782,
			  782,  782,  782,  782,  782,  749,  794,  750,  794,  117,
			  775,  775,  775,  775,  775,  775,  783,  783,  783,  783,
			  783,  783,  786,  786,  786,  786,  786,  786,  774,  774,

			  774,  774,  774,  774,  790,  790,  790,  790,  790,  790,
			  791,  791,  791,  791,  791,  791,  792,  792,  792,  792,
			  792,  792,  787,  794,  787,  794,  794,  791,  791,  791,
			  791,  791,  791,  793,  793,  793,  793,  793,  793,  789,
			  789,  789,  789,  789,  789,  103,  103,  103,  103,  103,
			  103,  103,  652,  652,  652,  652,  652,  652,  652,  794,
			  794,  789,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   98,   98,  794,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,  794,   98,   98,   98,   98,   98,
			  100,  100,  794,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  117,  117,  117, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  794,  794,  794,  794,  794,  117,  117,  117,  794,  117,
			  117,  117,  117,  117,  117,  117,  794,  794,  794,  117,
			  117,  117,  150,  150,  794,  150,  794,  150,  150,  794,
			  794,  150,  150,  150,  150,  150,  150,  150,  794,  794,
			  794,  150,  150,  150,  153,  153,  794,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  158,  794,  158,  158,  794,  794,  794,  158,  158,
			  158,  794,  794,  158,  158,  158,  158,  158,  158,  158,
			  158,  794,  794,  158,  158,  158,  186,  186,  794,  186,

			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  794,  186,  186,
			  186,  186,  186,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  206,  794,  206,
			  794,  794,  794,  206,  794,  206,  206,  794,  794,  206,
			  206,  206,  206,  206,  206,  206,  794,  794,  206,  206,

			  206,  206,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  220,  220,  794,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  103,  794,  794,  794,  103,  103,  794,
			  794,  103,  103,  103,  103,  103,  103,  103,  794,  794,

			  794,  103,  103,  103,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  108,  108,  108,  794,  794,  108,  108,  108,  108,
			  108,  108,  108,  108,  794,  794,  108,  108,  108,  246,
			  794,  794,  246,  246,  246,  246,  246,  246,  246,  246,
			  246,  246,  246,  794,  794,  794,  246,  246,  246,  198,
			  198,  198,  198,  198,  198,  198,  198,  794,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  201,  201,  201,  201,

			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  219,  219,  219,  794,  794,  794,  794,  794,  794,  794,
			  794,  219,  219,  219,  219,  219,  219,  219,  219,  794,
			  794,  794,  359,  359,  794,  219,  359,  359,  359,  359,
			  359,  359,  359,  794,  794,  794,  359,  359,  359,  360,
			  360,  794,  794,  360,  360,  360,  360,  360,  360,  360,

			  794,  794,  794,  360,  360,  360,  291,  291,  291,  794,
			  794,  291,  291,  291,  291,  291,  291,  291,  291,  794,
			  794,  291,  291,  291,  330,  330,  330,  330,  330,  330,
			  330,  330,  330,  330,  330,  330,  330,  330,  330,  330,
			  330,  330,  330,  330,  330,  330,  330,  330,  330,  330,
			  330,  448,  448,  448,  448,  448,  448,  448,  794,  794,
			  794,  448,  448,  448,  525,  525,  525,  525,  525,  525,
			  525,  794,  794,  794,  525,  525,  525,  526,  526,  794,
			  794,  526,  526,  526,  526,  526,  526,  526,  794,  794,
			  794,  526,  526,  526,  588,  588,  794,  794,  588,  588,

			  588,  588,  588,  588,  588,  794,  794,  794,  588,  588,
			  588,  671,  671,  671,  671,  671,  671,  671,  794,  794,
			  652,  671,  671,  671,  652,  652,  794,  794,  652,  652,
			  652,  652,  652,  652,  652,  794,  794,  794,  652,  652,
			  652,  697,  697,  794,  794,  697,  697,  697,  697,  697,
			  697,  697,  794,  794,  794,  697,  697,  697,  728,  728,
			  794,  794,  728,  728,  728,  728,  728,  728,  728,  794,
			  794,  794,  728,  728,  728,   11,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,

			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794, yy_Dummy>>,
			1, 767, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6766)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
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
			   25,   25,   27,   51,   27,   82,   27,   27,   27,   27,
			   27,   27,   38,   38,   74,   38,   74,   74,   76,    5,
			    5,    6,    6,   67,   67,   84,  142,  152,   95,   67,
			   95,   95,  143,    3,   18,  770,   38,  210,    4,    9,
			  210,   82,   82,   10,   67,   27,  155,  212,  769,  155,
			  212,   67,   67,  360,  155,  142,  188,   67,  188,  188,
			  143,  360,   84,   84,  152,   76,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,   28,   78,   28,
			  760,   28,   28,   28,   28,   28,   28,   87,   35,   35,
			   87,   35,   36,   36,   85,   36,   92,  327,   37,   37,

			  345,   37,   77,  218,  218,   80,  218,  479,   39,   39,
			  479,   39,   35,  750,   43,   43,   36,   43,  442,  442,
			   28,   35,   37,  345,   36,   35,   37,   35,  345,  218,
			   85,   85,   39,   79,  327,   37,   40,   40,   43,   40,
			   87,  742,   43,   41,   41,   39,   41,   44,   44,   35,
			   44,   92,   36,   35,   37,   35,   39,   78,   42,   42,
			   40,   42,  200,   37,   40,   45,   45,   41,   45,  108,
			   43,   44,  321,   39,   49,   49,   40,   49,   41,   77,
			   77,   77,   42,   80,   80,   39,  291,   44,  151,   45,
			  741,  308,   40,  308,   81,   45,   42,   42,   49,  200,

			  200,  466,   42,  714,   40,  108,   41,  196,   45,  466,
			   79,   79,   79,   58,   49,   44,   58,   50,   50,  446,
			   50,   58,  291,   45,   42,   42,   48,   48,   58,   48,
			   42,  229,  205,  229,  229,  205,   45,   46,   46,  151,
			   46,   50,   49,  196,  196,   47,   47,  213,   47,  705,
			   48,  321,   46,   46,   46,   46,   46,   46,   46,   56,
			  446,   46,   56,  693,   58,   48,   50,   56,   46,   47,
			   48,   81,   81,   81,   56,   46,  116,  116,   90,  116,
			   47,   90,   46,  662,   46,  205,   46,  654,   47,   55,
			   90,   56,   55,   48,  652,   50,   46,   55,   48,  192,

			  116,   90,  213,   46,   55,  199,   57,  607,   47,   57,
			   56,  202,  489,   46,   57,   46,   47,  697,  697,   56,
			  258,   57,   55,  606,   59,  258,   55,   59,   55,  501,
			   60,   90,   59,   60,   57,  512,  258,  501,   60,   59,
			   55,  199,  199,   57,   61,   60,  258,   61,  202,  202,
			   55,  489,   61,  605,   55,  604,   55,   57,   60,   61,
			  588,   59,   57,  400,  258,   62,  400,  608,   62,  323,
			   60,   57,   59,   62,  512,   59,  192,  192,  192,   61,
			   62,   60,   63,  402,   65,   63,   60,   65,  584,   59,
			   63,  402,   65,  228,  228,   61,  228,   63,   60,   65,

			  578,   59,  611,   62,   62,   64,  608,   61,   64,   62,
			   63,  193,  559,   64,   65,   66,   62,  228,   66,  400,
			   64,  543,  402,   66,   62,  333,  333,   65,  333,  543,
			   66,   62,   62,   63,  194,   65,   68,   62,   63,   68,
			   89,  611,   65,   89,   68,   64,   69,  323,  323,   69,
			   66,   68,   89,   89,   69,   65,   64,  743,   66,  334,
			  334,   69,  334,   89,  553,  743,   66,  553,  336,  336,
			  102,  336,  553,   64,  728,  728,   68,  544,   66,  102,
			  102,  102,  102,  102,  102,  702,   66,   68,  193,  193,
			  193,  526,  518,   89,  336,   69,  510,   69,  106,  106,

			  106,  106,  106,  106,   68,  109,  109,  109,  109,  109,
			  109,  194,  194,  194,  106,  102,  112,  112,  112,  112,
			  112,  112,  486,  480,   69,   93,   93,  702,   93,  458,
			  102,  711,  711,  711,  102,  195,  102,  106,  435,  111,
			  320,  111,  106,  111,  111,  111,  111,  111,  111,  111,
			  405,   93,  362,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  110,  110,  110,  110,
			  110,  110,  111,  481,  359,  349,  481,  117,  117,  113,
			  117,  113,  110,  113,  113,  113,  113,  113,  113,  335,

			  117,  117,  119,  119,  330,  119,   93,  329,  481,  117,
			  582,  117,  195,  195,  195,  119,  119,  320,  320,  320,
			  110,  719,  120,  120,  119,  120,  119,  121,  121,  719,
			  121,  206,  113,  582,  206,  120,  120,  704,  582,  295,
			  121,  121,  719,  206,  120,  287,  120,  119,  704,  121,
			  246,  121,  122,  122,  206,  122,  801,  719,  121,  120,
			  240,  240,  240,  240,  240,  122,  122,  123,  123,  245,
			  123,  801,  801,  801,  122,  119,  122,  235,  234,  704,
			  123,  123,  227,  226,  206,  122,  121,  120,  225,  123,
			  224,  123,  124,  124,  222,  124,  217,  208,  125,  125,

			  203,  125,  817,  817,  817,  124,  124,  201,  198,  186,
			  123,  125,  125,  122,  124,  162,  124,  156,  147,  153,
			  125,  150,  125,  126,  126,  137,  126,  127,  127,  105,
			  127,  104,  124,  103,  147,  147,  126,  126,  123,  100,
			  127,  127,  125,  128,  128,  126,  128,  126,  147,  127,
			  147,  127,   98,  126,   96,   88,  128,  128,   73,  126,
			  124,   70,  147,  147,  127,  128,   54,  128,   33,   31,
			  125,  129,  129,   26,  129,  130,  130,   24,  130,  147,
			  373,  126,   16,   15,  129,  129,  128,  126,  130,  130,
			   14,  373,  127,  129,   11,  129,    0,  130,    0,  130, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  373,  473,    0,  131,  131,    0,  131,  132,  132,
			    0,  132,    0,  473,  128,    0,  130,  131,  131,  373,
			    0,  132,  132,  473,  133,  133,  131,  133,  131,    0,
			  132,  394,  132,    0,  131,    0,  394,  133,  133,    0,
			    0,  473,  134,  134,  130,  134,  133,  394,  133,  179,
			  179,  179,  179,  179,  179,  134,  134,  394,  135,  135,
			  720,  135,  131,  132,  134,  179,  134,    0,  720,  133,
			  158,  135,  135,  158,    0,  394,  136,  136,  158,  136,
			  135,  720,  135,  158,  158,  158,    0,  134,  135,  136,
			  136,    0,  158,  179,    0,    0,  720,  133,  136,    0,

			  136,    0,  445,    0,  445,  139,  139,  136,  139,  140,
			  140,    0,  140,  445,  322,  134,  135,    0,  139,  139,
			  139,  158,  140,  140,  140,    0,    0,  139,  146,  139,
			    0,  140,    0,  140,    0,  136,  138,  138,  138,  138,
			  140,  445,  324,    0,  146,    0,  138,    0,    0,  146,
			  139,    0,    0,  146,  140,  138,  140,    0,  146,  138,
			  146,    0,  138,  209,  684,  684,  209,  684,  140,  138,
			    0,  138,  146,  138,    0,  209,    0,  146,  325,  144,
			    0,  146,  145,  138,    0,  140,  209,  138,  684,  146,
			  138,  322,  322,  322,    0,  144,  144,    0,  145,  144,

			  138,    0,  138,  141,  141,  141,  141,  141,  141,  144,
			    0,  144,  145,  145,  145,  326,  209,  148,  141,  324,
			  324,  324,  141,  144,  144,  141,  145,  144,  149,    0,
			    0,  141,  141,  148,  141,  522,  522,  522,  522,  522,
			  144,  145,    0,  145,  149,  148,  141,  148,    0,  148,
			  141,    0,    0,  141,  249,  325,  325,  325,  149,  141,
			  149,  148,  149,  141,    0,    0,  159,    0,    0,  159,
			  249,    0,  149,  148,  159,    0,    0,    0,  148,  159,
			  159,  159,  160,    0,  249,  160,  249,    0,  159,  149,
			  160,  149,  326,  326,  326,  160,  160,  160,  249,  161,

			    0,    0,  161,    0,  160,    0,    0,  161,  732,    0,
			    0,  159,  161,  161,  161,  249,  732,  159,  278,  160,
			  646,  161,    0,  163,  646,    0,  163,    0,    0,  732,
			  161,  163,  278,  160,  278,    0,  163,  163,  163,  159,
			  164,  646,    0,  164,  732,  163,  278,  160,  164,    0,
			  161,  191,  646,  164,  164,  164,  163,  165,  161,  382,
			  165,  382,  164,  278,    0,  165,  331,  331,    0,  331,
			  165,  165,  165,  166,  163,    0,  166,    0,  331,  165,
			    0,  166,  382,  164,  163,  382,  166,  166,  166,  331,
			  167,  164,  382,  167,    0,  166,    0,  165,  167,  632,

			  632,  632,  632,  167,  167,  167,  733,    0,  165,    0,
			  382,  164,  167,  382,  733,  168,    0,  166,  168,  331,
			  167,    0,    0,  168,  166,  165,  167,  733,  168,  168,
			  168,  191,  191,  191,  191,  191,  169,  168,    0,  169,
			  535,  167,  733,    0,  169,  166,    0,  594,  167,  169,
			  169,  169,  168,    0,  167,    0,    0,  535,  169,  170,
			    0,  535,  170,    0,  594,    0,  168,  170,  594,    0,
			    0,    0,  170,  170,  170,  171,    0,    0,  171,  169,
			  168,  170,    0,  171,    0,  535,    0,  169,  171,  171,
			  171,  172,  594,    0,  172,    0,    0,  171,    0,  172,

			  634,  634,  634,  634,  172,  172,  172,  169,  478,  173,
			  170,    0,  173,  172,    0,    0,  171,  173,    0,  478,
			    0,  172,  173,  173,  173,    0,  171,  251,    0,  478,
			    0,  173,  175,  175,  175,  175,  175,  175,    0,  634,
			    0,    0,  172,  251,  171,    0,    0,  478,    0,  172,
			  223,  223,  223,  223,  223,  223,  223,  251,    0,  251,
			  173,  175,    0,    0,  173,  174,    0,    0,  174,    0,
			    0,  251,    0,  174,  783,  783,  783,  783,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  251,  175,
			  176,  176,  176,  176,  176,  176,  177,  177,  177,  177,

			  177,  177,  178,  178,  178,  178,  178,  178,    0,    0,
			  177,    0,    0,  783,  647,  549,  174,  178,  647,  176,
			  180,  180,  180,  180,  180,  180,  549,    0,  181,  181,
			  181,  181,  181,  181,    0,  647,  549,    0,  177,  182,
			  182,  182,  182,  182,  182,  178,  647,  176,  181,    0,
			  180,    0,  181,    0,  549,  182,    0,  183,  183,  183,
			  183,  183,  183,  184,  184,  184,  184,  184,  184,  231,
			  231,  231,  231,  231,  231,    0,  181,    0,  180,  263,
			  181,    0,    0,  182,  183,  231,  233,  233,  233,  233,
			  233,  233,  232,    0,  232,  263,  184,  232,  232,  232,

			  232,  232,  232,  747,  747,  747,  747,  747,  231,  263,
			    0,  263,  183,  231,  236,  236,  236,  236,  236,  236,
			    0,    0,    0,  263,    0,  184,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  263,    0,  211,  237,  237,  237,  237,  237,  237,  211,
			  211,  211,  211,  211,  211,  238,    0,  238,    0,  237,
			  238,  238,  238,  238,  238,  238,  241,  241,  241,  241,
			  241,  241,  267,  267,  267,  267,  267,  267,  211,  211,
			  211,  211,  237,    0,  239,    0,  239,  237,  239,  239,
			  239,  239,  239,  239,  268,  268,  268,  268,  268,  268,

			  270,  270,  270,  270,  270,  270,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  214,  214,    0,
			  214,  271,  271,  271,  271,  271,  271,  239,    0,  270,
			  272,  272,  272,  272,  272,  272,  273,  273,  273,  273,
			  273,  273,    0,  214,    0,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  550,  247,
			    0,    0,  248,    0,  648,  250,    0,    0,  648,    0,
			  252,  737,  550,  737,    0,  247,  247,    0,  248,    0,
			  649,  250,  737,  550,  649,  648,  252,  248,  214,  247,

			  250,  247,  248,  550,  248,  250,  648,  250,    0,  252,
			  252,  649,  252,  247,  247,  253,  248,    0,  254,  250,
			  737,  550,  649,  255,  252,  248,    0,    0,  250,    0,
			  247,  253,  253,  248,  254,    0,  250,  252,    0,  255,
			  254,  252,  256,    0,    0,  253,    0,  253,  254,    0,
			  254,    0,  255,  255,    0,  255,    0,  257,  256,  253,
			  253,  259,  254,    0,  600,    0,  260,  255,  254,    0,
			    0,  256,  256,  257,  256,    0,  253,  259,    0,  254,
			  255,  600,  260,  259,  255,  600,  256,  257,  260,  257,
			    0,  259,    0,  259,    0,    0,  260,  257,  260,  256, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  257,    0,  256,  261,  259,    0,    0,  262,  600,
			  260,  259,  264,    0,    0,  265,  260,    0,  257,  767,
			  261,  767,  259,  262,  262,  261,    0,  260,  264,  679,
			  767,  265,  265,  679,  261,    0,  261,    0,  262,    0,
			  262,    0,  264,  264,  264,  265,  642,  265,  261,  776,
			  679,  262,  262,  261,    0,    0,  264,    0,  767,  265,
			  265,  679,    0,  642,    0,  261,  776,  642,    0,  262,
			  776,  264,  275,  264,  275,  275,  265,  269,  269,  269,
			  269,  269,  269,  269,  274,  274,  274,  274,  274,  274,
			    0,  642,  277,  269,  776,  275,    0,    0,  275,  773,

			  773,  773,  773,  773,  275,  277,  277,  269,  277,  269,
			  276,  276,  276,  276,  276,  276,    0,    0,  279,  281,
			  277,  269,    0,  275,  280,    0,  275,    0,  282,  276,
			    0,  280,  275,  277,  279,  281,  281,  277,  269,    0,
			  280,    0,  279,  283,  282,    0,    0,    0,  279,  281,
			  279,  281,    0,  551,  280,  282,  280,  276,  282,  283,
			  282,  284,  279,  281,  281,  285,  286,  551,  280,    0,
			  279,  283,  282,  283,    0,  283,    0,  284,  551,  279,
			  281,  285,  286,  282,    0,  280,    0,  283,  551,  282,
			    0,  284,    0,  284,    0,  285,  286,  285,  286,  283,

			  286,  284,    0,    0,  283,  284,  551,  777,    0,  285,
			  286,  288,    0,  288,  288,  288,  288,  288,  288,  288,
			    0,    0,  284,    0,  777,    0,  285,  286,  777,  286,
			  289,  289,  289,  289,  289,  289,  289,  292,  292,  292,
			  292,  292,  292,  293,  293,  293,  293,  293,  293,    0,
			    0,    0,  777,  292,  294,  294,  294,  294,  294,  294,
			  296,  296,  296,  296,  296,  296,  363,  293,  297,  297,
			  297,  297,  297,  297,  298,  298,  298,  298,  298,  298,
			    0,  292,  363,  297,  296,  299,  299,  299,  299,  299,
			  299,    0,    0,    0,  363,  293,  363,    0,  363,    0,

			    0,  299,  298,  300,  300,  300,  300,  300,  300,    0,
			  363,  297,  296,  301,  301,  301,  301,  301,  301,  680,
			    0,    0,  363,  680,  300,    0,    0,  363,  753,  299,
			  298,  302,  302,  302,  302,  302,  302,    0,    0,  753,
			  680,  301,  303,  303,  303,  303,  303,  303,    0,  753,
			    0,  680,  300,  304,  304,  304,  304,  304,  304,  302,
			    0,  305,  305,  305,  305,  305,  305,  753,    0,  301,
			    0,    0,    0,    0,  304,  306,  306,  306,  306,  306,
			  306,  303,  305,    0,    0,    0,  307,  302,  307,  307,
			  307,  307,  307,  307,    0,  306,  310,  310,  310,  310,

			  310,  310,  304,  309,  309,  309,  309,  309,  309,    0,
			  305,  311,  311,  311,  311,  311,  311,  309,    0,    0,
			    0,  780,    0,  306,  312,  312,  312,  312,  312,  312,
			  313,  313,  313,  313,  313,  313,    0,    0,  780,    0,
			  312,  311,  780,    0,  781,  309,  314,  314,  314,  314,
			  314,  314,    0,  313,  315,  315,  315,  315,  315,  315,
			    0,  781,  314,    0,    0,  781,  780,  754,  312,  311,
			  316,  316,  316,  316,  316,  316,    0,    0,  754,    0,
			  315,  313,  317,  317,  317,  317,  317,  317,  754,  781,
			  314,  318,  318,  318,  318,  318,  318,  316,  319,  319,

			  319,  319,  319,  319,    0,    0,  754,    0,  315,  339,
			  339,  339,  339,  339,  339,  339,    0,    0,    0,    0,
			    0,  317,    0,    0,    0,  316,    0,    0,    0,    0,
			    0,  319,  346,  346,  346,  346,  346,  346,  347,  347,
			  347,  347,  347,  347,  348,  348,  348,  348,  348,  348,
			  350,  350,  350,  350,  350,  350,    0,    0,    0,    0,
			  319,    0,  351,  351,  351,  351,  351,  351,  353,  353,
			  353,  353,  353,  353,  352,    0,  352,  347,  351,  352,
			  352,  352,  352,  352,  352,  354,  354,  354,  354,  354,
			  354,  355,  355,  355,  355,  355,  355,    0,    0,    0,

			    0,  351,    0,    0,  356,  356,  351,  356,  356,  356,
			  356,  356,  356,  357,  357,  357,  357,  357,  357,  358,
			  358,  358,  358,  358,  358,  364,  365,    0,    0,  366,
			  355,    0,  367,    0,    0,  368,    0,    0,    0,  681,
			    0,  364,  365,  681,    0,  366,    0,    0,  367,  367,
			  366,  368,    0,    0,  365,  364,  365,  364,  365,  366,
			  681,  366,  367,    0,  367,  368,    0,  368,  369,  364,
			  365,  681,  370,  366,    0,  371,  367,  367,  366,  368,
			    0,  372,  365,    0,  369,  682,  364,  365,  370,  682,
			  366,  371,  371,  367,  372,    0,  368,  372,  369,  369,

			  369,    0,  370,    0,  370,  371,  682,  371,  376,    0,
			    0,  372,  369,  372,    0,  375,  370,  682,  374,  371,
			  371,  378,  372,    0,  376,  372,    0,  369,    0,  369,
			  370,  375,  376,  370,  374,    0,  371,  378,  376,  374,
			  376,  377,  372,    0,    0,  375,  375,  375,  374,  378,
			  374,  378,  376,  378,    0,    0,  379,  377,    0,  375,
			  376,  377,  374,    0,    0,  378,    0,  374,    0,  376,
			    0,  377,  379,  377,  375,    0,  375,  378,    0,  374,
			    0,    0,  378,  392,  379,  377,  379,    0,  379,  377,
			  380,  380,  380,  380,  380,  380,    0,    0,    0,  392,

			  379,  381,  377,  381,  381,  381,  381,  381,  381,  381,
			    0,    0,  379,  392,    0,  392,    0,  379,  380,  383,
			  383,  383,  383,  383,  383,    0,    0,  392,  384,    0,
			  384,  381,  384,  384,  384,  384,  384,  384,  385,  385,
			  385,  385,  385,  385,  392,    0,  380,    0,  383,    0,
			    0,    0,    0,    0,  384,  721,    0,    0,    0,  381,
			  385,  384,  386,  386,  386,  386,  386,  386,  721,    0,
			    0,  385,    0,    0,    0,    0,  721,  386,    0,    0,
			    0,    0,  384,    0,    0,    0,    0,    0,  385,  721,
			    0,  386,  387,  387,  387,  387,  387,  387,    0,    0,

			  385,    0,    0,    0,  721,  386,  388,  388,  388,  388,
			  388,  388,  389,  389,  389,  389,  389,  389,  390,  390,
			  390,  390,  390,  390,    0,  387,  391,  391,  391,  391,
			  391,  391,  393,  395,    0,    0,  396,    0,    0,  763,
			  397,  399,    0,  399,    0,    0,    0,  390,  393,  395,
			  763,    0,  396,    0,  387,  391,  397,    0,  398,  399,
			  763,    0,  393,  395,  393,  395,  396,  396,  396,    0,
			  397,  398,  397,  399,  398,  399,  393,  395,  763,    0,
			  396,    0,  398,    0,  397,    0,    0,  399,  398,    0,
			  398,    0,    0,  393,  395,  396,    0,  396,    0,  398, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  397,  398,    0,  399,    0,    0,    0,    0,  401,
			  398,  401,  401,  401,  401,  401,  401,  401,  403,  398,
			  403,  403,  403,  403,  403,  403,  403,  404,    0,  404,
			  404,  404,  404,  404,  404,  404,  406,  406,  406,  406,
			  406,  406,  407,  407,  407,  407,  407,  407,  401,  408,
			  408,  408,  408,  408,  408,    0,    0,  403,    0,    0,
			    0,    0,    0,  406,    0,    0,  404,  409,  409,  409,
			  409,  409,  409,  407,    0,  410,  410,  410,  410,  410,
			  410,  411,  411,  411,  411,  411,  411,    0,    0,    0,
			    0,  406,    0,    0,  409,  410,    0,  411,    0,    0,

			    0,    0,  407,  412,  412,  412,  412,  412,  412,  413,
			  413,  413,  413,  413,  413,  414,  414,  414,  414,  414,
			  414,    0,  409,  410,    0,  411,  415,  415,  415,  415,
			  415,  415,    0,  416,  416,  416,  416,  416,  416,  413,
			    0,    0,  415,    0,  414,  416,  417,  417,  417,  417,
			  417,  417,  418,  418,  418,  418,  418,  418,  419,  419,
			  419,  419,  419,  419,    0,    0,  417,  413,    0,    0,
			  415,    0,  414,  416,  420,  420,  420,  420,  420,  420,
			  764,  419,  418,  421,  421,  421,  421,  421,  421,    0,
			    0,  764,    0,    0,  417,  422,  422,  422,  422,  422,

			  422,  764,  421,  424,  424,  424,  424,  424,  424,  419,
			  418,  423,  423,  423,  423,  423,  423,    0,    0,  764,
			    0,    0,  422,  425,  425,  425,  425,  425,  425,    0,
			  421,  426,  426,  426,  426,  426,  426,    0,  423,  427,
			  427,  427,  427,  427,  427,    0,    0,    0,    0,    0,
			  422,    0,    0,    0,  427,  428,  428,  428,  428,  428,
			  428,  426,    0,    0,    0,  429,  423,  428,  429,  429,
			  429,  429,  429,  429,    0,    0,    0,    0,  428,    0,
			    0,    0,  427,  431,  431,  431,  431,  431,  431,  426,
			    0,    0,    0,    0,    0,  428,  432,  432,  432,  432,

			  432,  432,    0,    0,    0,    0,  428,  433,  433,  433,
			  433,  433,  433,  434,  434,  434,  434,  434,  434,    0,
			    0,    0,  431,  436,  436,  436,  436,  436,  436,  437,
			  437,  437,  437,  437,  437,    0,    0,    0,    0,  436,
			  438,  438,  438,  438,  438,  438,  439,  439,  439,  439,
			  439,  439,  440,  440,  440,  440,  440,  440,    0,    0,
			    0,    0,  436,    0,    0,    0,    0,  436,  441,  441,
			  441,  441,  441,  441,    0,    0,    0,    0,    0,  438,
			  443,  443,  443,  443,  443,  443,  449,  450,    0,    0,
			  444,  440,  444,  444,  444,  444,  444,  444,    0,    0,

			    0,    0,  449,  450,    0,  451,    0,    0,  452,  453,
			    0,    0,  454,    0,    0,    0,  449,  450,  449,  450,
			    0,  451,  451,    0,  452,  453,    0,  450,  454,    0,
			  449,  450,  452,    0,    0,  451,    0,  451,  452,  453,
			  452,  453,  454,    0,  454,  455,    0,  449,  450,  451,
			  451,  456,  452,  453,    0,  459,  454,    0,    0,    0,
			  452,  455,  455,    0,  457,    0,  451,  456,    0,  452,
			  453,  459,  459,  454,  455,  455,    0,  455,    0,    0,
			  457,  456,    0,  456,    0,  459,  457,  459,  460,  455,
			  455,  461,    0,    0,  457,  456,  457,    0,    0,  459,

			  459,  463,  455,    0,  460,    0,  455,  461,  457,  734,
			  462,    0,  456,    0,  457,    0,  459,  463,  460,    0,
			  460,  461,  734,  461,    0,  457,  462,  462,    0,  463,
			  734,  463,  460,  463,  464,  461,    0,    0,    0,    0,
			  462,    0,  462,  734,    0,  463,    0,    0,    0,  460,
			  464,  464,  461,    0,  462,  462,    0,  463,  734,    0,
			    0,    0,  463,    0,  464,    0,  464,    0,    0,    0,
			    0,  462,  467,  467,  467,  467,  467,  467,  464,  464,
			  468,  468,  468,  468,  468,  468,  469,  469,  469,  469,
			  469,  469,    0,    0,    0,  464,    0,    0,    0,    0,

			  470,  467,  470,  470,  470,  470,  470,  470,  470,    0,
			    0,  471,    0,  471,  469,  471,  471,  471,  471,  471,
			  471,    0,  474,  472,  472,  472,  472,  472,  472,    0,
			  470,  475,    0,    0,    0,    0,    0,  471,  474,  474,
			  476,    0,  469,  471,  471,  472,    0,  475,  475,    0,
			    0,    0,  474,    0,  474,    0,  476,    0,  470,    0,
			    0,  475,    0,  475,    0,  471,  474,  474,  476,    0,
			  476,  471,  476,  472,  477,  475,  475,  487,  487,  487,
			  487,  487,  487,  474,  476,    0,    0,    0,    0,    0,
			  477,    0,  475,    0,    0,    0,  476,    0,    0,  477,

			    0,  476,    0,    0,  477,    0,  477,  482,  482,  482,
			  482,  482,  482,  482,    0,    0,    0,    0,  477,  484,
			  484,  484,  484,  484,  484,  484,    0,  477,  488,  488,
			  488,  488,  488,  488,  490,  477,  490,  490,  490,  490,
			  490,  490,  491,  491,  491,  491,  491,  491,  492,  492,
			  492,  492,  492,  492,    0,    0,    0,    0,  491,  493,
			  493,  493,  493,  493,  493,    0,    0,  488,    0,    0,
			    0,  492,    0,  490,  493,  494,  494,  494,  494,  494,
			  494,    0,    0,    0,    0,    0,  491,    0,    0,    0,
			  494,  495,  495,  495,  495,  495,  495,    0,    0,  492,

			    0,    0,  493,    0,    0,    0,    0,  495,  496,  496,
			  496,  496,  496,  496,    0,    0,    0,    0,  494,  495,
			  497,  497,  497,  497,  497,  497,  498,  498,  498,  498,
			  498,  498,    0,    0,    0,  495,    0,    0,    0,    0,
			    0,  497,  498,    0,    0,    0,    0,  495,  499,  499,
			  499,  499,  499,  499,  500,  500,  500,  500,  500,  500,
			    0,    0,    0,  499,    0,    0,    0,    0,    0,  497,
			  498,  502,    0,  502,  502,  502,  502,  502,  502,  502,
			  503,  503,  503,  503,  503,  503,    0,    0,    0,    0,
			    0,  499,    0,    0,    0,    0,  503,    0,  504,  504,

			  504,  504,  504,  504,  505,  505,  505,  505,  505,  505,
			  506,  506,  506,  506,  506,  506,    0,    0,    0,    0,
			  505,    0,    0,    0,  503,  504,  506,  507,  507,  507,
			  507,  507,  507,  508,  508,  508,  508,  508,  508,    0,
			    0,    0,    0,  507,    0,    0,    0,    0,  505,    0,
			    0,    0,    0,  504,  506,    0,    0,    0,    0,    0,
			  508,  509,  509,  509,  509,  509,  509,    0,    0,    0,
			    0,  507,  511,  511,  511,  511,  511,  511,    0,  514,
			  514,  514,  514,  514,  514,  509,    0,  513,  508,  513,
			  513,  513,  513,  513,  513,  514,  515,  515,  515,  515, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  515,  515,  516,  516,  516,  516,  516,  516,    0,    0,
			    0,    0,    0,  509,  517,  517,  517,  517,  517,  517,
			    0,    0,    0,  514,    0,    0,  513,  519,  519,  519,
			  519,  519,  519,    0,    0,  515,  520,  520,  520,  520,
			  520,  520,  521,  521,  521,  521,  521,  521,  524,  524,
			  524,  524,  524,  524,  527,  528,    0,    0,  530,  529,
			    0,    0,    0,    0,  524,    0,    0,  527,    0,    0,
			  527,  528,  529,    0,  530,  529,    0,  531,    0,    0,
			  532,  533,    0,    0,  527,  528,  527,  528,  530,  529,
			  530,  529,  524,  531,  531,  527,  532,  533,  527,  528,

			  529,  534,  530,  529,  532,    0,    0,  531,    0,  531,
			  532,  533,  532,  533,  536,  527,  528,  534,    0,  530,
			  529,  531,  531,  534,  532,  533,    0,    0,    0,    0,
			  536,  534,  532,  534,    0,    0,  537,    0,  531,    0,
			  539,  532,  533,  536,  536,  534,  536,  538,    0,    0,
			    0,  534,  537,  537,    0,    0,  539,  539,  536,    0,
			    0,    0,  534,  538,    0,    0,  537,    0,  537,    0,
			  539,  536,  539,  540,    0,  536,  538,  538,    0,  538,
			  537,  537,    0,    0,  539,  539,    0,    0,    0,  540,
			    0,  538,    0,    0,  545,    0,    0,  537,    0,    0,

			    0,  539,    0,  540,  538,  540,    0,  541,  538,  541,
			  545,  541,  541,  541,  541,  541,  541,  540,    0,  546,
			  548,    0,    0,    0,  545,    0,  545,  547,  552,  552,
			  552,  552,  552,  552,  540,  546,  548,    0,  545,    0,
			  541,    0,  547,  547,    0,    0,    0,  546,    0,  546,
			  548,  546,  548,    0,    0,  545,    0,  547,    0,  547,
			    0,    0,    0,  546,  548,    0,    0,    0,    0,    0,
			  547,  547,    0,    0,    0,  546,    0,    0,    0,    0,
			  546,  548,    0,    0,    0,    0,    0,  554,  547,  554,
			  554,  554,  554,  554,  554,  554,  555,    0,  555,  555,

			  555,  555,  555,  555,  555,  556,  556,  556,  556,  556,
			  556,  557,  557,  557,  557,  557,  557,  558,  558,  558,
			  558,  558,  558,  557,    0,    0,  554,  560,  560,  560,
			  560,  560,  560,    0,  591,  555,  561,  561,  561,  561,
			  561,  561,  562,  562,  562,  562,  562,  562,  561,    0,
			  591,  557,  563,  563,  563,  563,  563,  563,  564,  564,
			  564,  564,  564,  564,  591,    0,  591,    0,  563,  565,
			  565,  565,  565,  565,  565,    0,  561,    0,  591,    0,
			    0,  564,  566,  566,  566,  566,  566,  566,  567,  567,
			  567,  567,  567,  567,    0,  591,  563,  568,  568,  568,

			  568,  568,  568,  566,    0,    0,    0,    0,    0,  564,
			    0,    0,    0,  568,    0,    0,  567,  569,  569,  569,
			  569,  569,  569,  570,  570,  570,  570,  570,  570,    0,
			    0,  566,  571,  571,  571,  571,  571,  571,    0,  570,
			    0,  568,    0,    0,  567,  569,    0,  571,  572,  572,
			  572,  572,  572,  572,  573,  573,  573,  573,  573,  573,
			  574,  574,  574,  574,  574,  574,    0,  570,    0,    0,
			    0,    0,    0,  569,  574,  571,    0,    0,    0,    0,
			    0,  573,  575,  575,  575,  575,  575,  575,  576,  576,
			  576,  576,  576,  576,    0,    0,    0,  575,    0,    0,

			    0,    0,  574,  577,  577,  577,  577,  577,  577,  573,
			  579,    0,  579,    0,    0,  579,  579,  579,  579,  579,
			  579,    0,    0,    0,    0,  575,  580,  580,  580,  580,
			  580,  580,  581,  581,  581,  581,  581,  581,  583,  583,
			  583,  583,  583,  583,  585,  585,  585,  585,  585,  585,
			  586,  586,  586,  586,  586,  586,  587,  587,  587,  587,
			  587,  587,  589,    0,    0,  580,  590,    0,    0,  592,
			    0,    0,  587,  593,    0,    0,    0,  595,  589,    0,
			    0,    0,  590,    0,  592,  592,    0,    0,  590,  593,
			  589,    0,  589,  595,  589,  587,  590,    0,  590,  592,

			  587,  592,    0,  593,    0,  593,  589,  595,    0,  595,
			  590,    0,  592,  592,    0,  596,  590,  593,  589,  597,
			  598,  595,    0,  589,  599,  601,    0,  590,    0,    0,
			  592,  596,    0,    0,  593,  597,  598,    0,  595,    0,
			  599,  601,  601,    0,  598,  596,    0,  596,    0,  597,
			  598,  597,  598,    0,  599,  601,  599,  601,  602,  596,
			    0,    0,    0,  597,  598,    0,  603,    0,  599,  601,
			  601,    0,  598,    0,  602,    0,  596,    0,  602,    0,
			  597,  598,  603,  603,    0,  599,  601,    0,  602,    0,
			  602,    0,    0,    0,    0,    0,  603,    0,  603,    0,

			    0,    0,  602,    0,    0,    0,  602,    0,    0,    0,
			  603,  603,  613,  613,  613,  613,  613,  613,  609,  602,
			  609,  609,  609,  609,  609,  609,  612,  603,  612,  612,
			  612,  612,  612,  612,    0,    0,    0,    0,  614,  613,
			  614,  614,  614,  614,  614,  614,    0,  615,  615,  615,
			  615,  615,  615,    0,    0,    0,    0,  609,  616,  616,
			  616,  616,  616,  616,    0,  612,    0,  613,  615,  617,
			  617,  617,  617,  617,  617,    0,    0,  614,    0,    0,
			    0,    0,    0,  617,  618,  618,  618,  618,  618,  618,
			  619,  619,  619,  619,  619,  619,  615,  620,  620,  620,

			  620,  620,  620,  621,  621,  621,  621,  621,  621,    0,
			    0,  617,  622,  622,  622,  622,  622,  622,  623,  623,
			  623,  623,  623,  623,  624,  624,  624,  624,  624,  624,
			    0,    0,    0,    0,    0,  622,    0,    0,    0,    0,
			  624,  625,  625,  625,  625,  625,  625,    0,  626,  626,
			  626,  626,  626,  626,  628,  628,  628,  628,  628,  628,
			  625,    0,    0,  622,  626,    0,    0,  627,  624,  627,
			  627,  627,  627,  627,  627,  629,  629,  629,  629,  629,
			  629,  630,  630,  630,  630,  630,  630,    0,  625,  631,
			    0,  631,  626,    0,  631,  631,  631,  631,  631,  631,

			  633,  633,  633,  633,  633,  633,  627,  635,  635,  635,
			  635,  635,  635,  637,    0,    0,    0,  638,  639,    0,
			    0,    0,    0,  635,    0,    0,    0,    0,  637,  637,
			    0,    0,    0,  638,  639,  639,    0,  641,  638,    0,
			    0,    0,    0,  637,    0,  637,  635,  638,  639,  638,
			  639,  635,  641,  641,    0,  643,  637,  637,    0,  644,
			    0,  638,  639,  639,    0,    0,  638,  641,    0,  641,
			  645,  643,    0,    0,  637,  644,  644,    0,  638,  639,
			  641,  641,    0,    0,    0,  643,  645,  643,    0,  644,
			    0,  644,  650,  650,  650,  650,  650,  650,  641,  643, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  645,    0,  645,  644,  644,  653,  653,  653,  653,  653,
			  653,    0,    0,    0,  645,    0,  643,    0,    0,    0,
			  644,  655,  655,  655,  655,  655,  655,    0,    0,    0,
			    0,  645,    0,    0,    0,  655,  656,  656,  656,  656,
			  656,  656,  657,  657,  657,  657,  657,  657,  658,  658,
			  658,  658,  658,  658,    0,    0,  656,    0,  657,    0,
			    0,    0,  658,  655,  659,  659,  659,  659,  659,  659,
			    0,  660,  660,  660,  660,  660,  660,    0,    0,  659,
			    0,    0,    0,    0,  656,    0,  657,  660,    0,    0,
			  658,  661,  661,  661,  661,  661,  661,  663,  663,  663,

			  663,  663,  663,    0,    0,    0,    0,  659,  664,  664,
			  664,  664,  664,  664,    0,  660,  665,  665,  665,  665,
			  665,  665,  666,  666,  666,  666,  666,  666,  667,  667,
			  667,  667,  667,  667,  668,  668,  668,  668,  668,  668,
			  670,  670,  670,  670,  670,  670,  672,  664,    0,    0,
			    0,  673,    0,    0,    0,  674,  670,    0,    0,    0,
			    0,    0,  672,    0,    0,    0,  672,  673,    0,    0,
			  677,  674,    0,    0,    0,    0,  672,    0,  672,  670,
			    0,  673,    0,  673,  670,  674,  677,  674,  675,    0,
			  672,    0,  678,    0,  672,  673,    0,    0,    0,  674,

			  677,    0,  677,    0,  675,  675,    0,  672,  678,  673,
			    0,    0,  673,    0,  677,    0,  674,    0,  675,    0,
			  675,    0,  678,  683,  678,  683,  683,  683,  683,  683,
			  683,  677,  675,  675,    0,  685,  678,  685,  685,  685,
			  685,  685,  685,  687,  687,  687,  687,  687,  687,  675,
			  678,    0,    0,  678,  686,  686,  686,  686,  686,  686,
			    0,    0,  683,  688,  688,  688,  688,  688,  688,    0,
			    0,    0,  687,  686,  685,  689,  689,  689,  689,  689,
			  689,  690,  690,  690,  690,  690,  690,    0,    0,    0,
			    0,  689,  691,  691,  691,  691,  691,  691,    0,    0,

			  687,  686,  692,  692,  692,  692,  692,  692,  694,  694,
			  694,  694,  694,  694,    0,    0,    0,    0,  695,  689,
			  695,  691,  698,  695,  695,  695,  695,  695,  695,  696,
			  696,  696,  696,  696,  696,    0,    0,    0,  698,  698,
			  699,  692,    0,    0,    0,    0,    0,  700,  701,  691,
			    0,    0,  698,    0,  698,    0,  699,  695,    0,    0,
			    0,    0,    0,  700,  701,    0,  698,  698,    0,    0,
			  699,    0,  699,    0,  699,    0,  700,  700,  701,  700,
			  701,    0,  701,  698,  699,  708,  708,  708,  708,  708,
			  708,  700,  701,    0,  707,  707,  707,  707,  707,  707,

			    0,  699,    0,  699,  700,    0,    0,    0,  700,  701,
			  707,  701,  709,  709,  709,  709,  709,  709,  708,  710,
			  710,  710,  710,  710,  710,  712,  712,  712,  712,  712,
			  712,    0,  715,  716,    0,    0,    0,    0,  707,  717,
			  709,  723,  723,  723,  723,  723,  723,  708,  715,  716,
			    0,    0,  710,    0,  718,  717,  722,  722,  722,  722,
			  722,  722,  715,  716,  715,  716,    0,    0,  709,  717,
			  718,  717,    0,    0,    0,    0,  715,  716,    0,    0,
			  718,  710,    0,  717,  718,  722,  718,    0,    0,    0,
			  715,    0,    0,  715,  716,    0,    0,    0,  718,    0,

			  717,  724,  724,  724,  724,  724,  724,    0,  718,    0,
			    0,    0,    0,  722,    0,  718,  725,  725,  725,  725,
			  725,  725,  726,  726,  726,  726,  726,  726,  727,  727,
			  727,  727,  727,  727,  729,  729,  729,  729,  729,  729,
			  730,  725,    0,  731,  735,  735,  735,  735,  735,  735,
			  736,  736,  736,  736,  736,  736,  730,    0,    0,  731,
			  731,    0,    0,    0,    0,    0,  736,    0,    0,  725,
			  730,    0,  730,  731,  730,  731,    0,  735,  745,  745,
			  745,  745,  745,  745,  730,    0,  739,  731,  731,  740,
			  738,    0,  738,  738,  736,  738,  738,  738,  738,  738,

			  738,  730,  739,  730,  731,  740,  735,    0,    0,    0,
			    0,    0,  739,    0,    0,    0,  739,    0,  739,  740,
			    0,  740,    0,  744,  744,  744,  744,  744,  744,    0,
			  739,    0,    0,  740,  746,  746,  746,  746,  746,  746,
			  739,  749,  749,  749,  749,  749,  749,  739,  744,  752,
			  740,  751,  751,  751,  751,  751,  751,  755,  755,  755,
			  755,  755,  755,    0,    0,  752,  752,  756,  756,  756,
			  756,  756,  756,  755,    0,    0,  744,    0,    0,  752,
			    0,  752,  757,  757,  757,  757,  757,  757,    0,    0,
			    0,    0,    0,  752,  752,    0,    0,    0,    0,  749,

			    0,  755,  758,  758,  758,  758,  758,  758,    0,    0,
			  752,  759,  759,  759,  759,  759,  759,  761,  762,  761,
			  761,    0,  761,  761,  761,  761,  761,  761,  765,  765,
			  765,  765,  765,  765,  762,  766,  766,  766,  766,  766,
			  766,  768,  768,  768,  768,  768,  768,    0,  762,    0,
			  762,  771,  771,  771,  771,  771,  771,    0,    0,    0,
			    0,    0,  762,  772,  772,  772,  772,  772,  772,  778,
			  778,  778,  778,  778,  778,  775,    0,  775,    0,  762,
			  775,  775,  775,  775,  775,  775,  779,  779,  779,  779,
			  779,  779,  782,  782,  782,  782,  782,  782,  786,  786,

			  786,  786,  786,  786,  787,  787,  787,  787,  787,  787,
			  788,  788,  788,  788,  788,  788,  790,  790,  790,  790,
			  790,  790,  791,    0,  791,    0,    0,  791,  791,  791,
			  791,  791,  791,  792,  792,  792,  792,  792,  792,  793,
			  793,  793,  793,  793,  793,  800,  800,  800,  800,  800,
			  800,  800,  830,  830,  830,  830,  830,  830,  830,    0,
			    0,  791,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,

			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  798,  798,    0,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,    0,  798,  798,  798,  798,  798,
			  799,  799,    0,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  802,  802,  802, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,  802,  802,  802,    0,  802,
			  802,  802,  802,  802,  802,  802,    0,    0,    0,  802,
			  802,  802,  803,  803,    0,  803,    0,  803,  803,    0,
			    0,  803,  803,  803,  803,  803,  803,  803,    0,    0,
			    0,  803,  803,  803,  804,  804,    0,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  805,    0,  805,  805,    0,    0,    0,  805,  805,
			  805,    0,    0,  805,  805,  805,  805,  805,  805,  805,
			  805,    0,    0,  805,  805,  805,  806,  806,    0,  806,

			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,    0,  806,  806,
			  806,  806,  806,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  809,    0,  809,
			    0,    0,    0,  809,    0,  809,  809,    0,    0,  809,
			  809,  809,  809,  809,  809,  809,    0,    0,  809,  809,

			  809,  809,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  812,  812,    0,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  813,    0,    0,    0,  813,  813,    0,
			    0,  813,  813,  813,  813,  813,  813,  813,    0,    0,

			    0,  813,  813,  813,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  815,  815,  815,    0,    0,  815,  815,  815,  815,
			  815,  815,  815,  815,    0,    0,  815,  815,  815,  816,
			    0,    0,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,    0,    0,    0,  816,  816,  816,  818,
			  818,  818,  818,  818,  818,  818,  818,    0,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  819,  819,  819,  819,

			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  821,  821,  821,    0,    0,    0,    0,    0,    0,    0,
			    0,  821,  821,  821,  821,  821,  821,  821,  821,    0,
			    0,    0,  822,  822,    0,  821,  822,  822,  822,  822,
			  822,  822,  822,    0,    0,    0,  822,  822,  822,  823,
			  823,    0,    0,  823,  823,  823,  823,  823,  823,  823,

			    0,    0,    0,  823,  823,  823,  824,  824,  824,    0,
			    0,  824,  824,  824,  824,  824,  824,  824,  824,    0,
			    0,  824,  824,  824,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  826,  826,  826,  826,  826,  826,  826,    0,    0,
			    0,  826,  826,  826,  827,  827,  827,  827,  827,  827,
			  827,    0,    0,    0,  827,  827,  827,  828,  828,    0,
			    0,  828,  828,  828,  828,  828,  828,  828,    0,    0,
			    0,  828,  828,  828,  829,  829,    0,    0,  829,  829,

			  829,  829,  829,  829,  829,    0,    0,    0,  829,  829,
			  829,  831,  831,  831,  831,  831,  831,  831,    0,    0,
			  832,  831,  831,  831,  832,  832,    0,    0,  832,  832,
			  832,  832,  832,  832,  832,    0,    0,    0,  832,  832,
			  832,  833,  833,    0,    0,  833,  833,  833,  833,  833,
			  833,  833,    0,    0,    0,  833,  833,  833,  834,  834,
			    0,    0,  834,  834,  834,  834,  834,  834,  834,    0,
			    0,    0,  834,  834,  834,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,

			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794, yy_Dummy>>,
			1, 767, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,  185,    0,   66,
			   70,  994, 6675,   98,  987,  956,  975, 6675,   90,    0,
			 6675, 6675, 6675, 6675,  962,   88,  956,   98,  263, 6675,
			 6675,  942, 6675,  941, 6675,  286,  290,  296,  120,  306,
			  334,  341,  356,  312,  345,  363,  435,  443,  424,  372,
			  415,   47, 6675, 6675,  910,  487,  457,  504,  411,  522,
			  528,  542,  563,  580,  603,  582,  613,   93,  634,  644,
			  944, 6675, 6675,  951,  122, 6675,  121,  295,  271,  326,
			  298,  387,   98, 6675,  118,  277, 6675,  285,  952,  638,
			  476, 6675,  268,  723, 6675,  136,  951, 6675,  945, 6675,

			  930,    0,  661,  922,  928,  913,  680, 6675,  352,  687,
			  758,  725,  698,  775, 6675, 6675,  474,  785,    0,  800,
			  820,  825,  850,  865,  890,  896,  921,  925,  941,  969,
			  973, 1002, 1006, 1022, 1040, 1056, 1074,  842, 1122, 1103,
			 1107, 1185,   87,  102, 1162, 1165, 1111,  901, 1200, 1211,
			  897,  364,  113,  863, 6675,  154,  906,    0, 1068, 1264,
			 1280, 1297,  849, 1321, 1338, 1355, 1371, 1388, 1413, 1434,
			 1457, 1473, 1489, 1507, 1563, 1514, 1572, 1578, 1584, 1031,
			 1602, 1610, 1621, 1639, 1645, 6675,  902, 6675,  164, 6675,
			 6675, 1344,  492,  604,  627,  728,  390, 6675,  854,  488,

			  345,  852,  494,  846, 6675,  430,  829, 6675,  894, 1161,
			  145, 1725,  155,  419, 1815, 6675, 6675,  868,  301, 6675,
			 6675, 6675,  885, 1533,  881,  879,  874,  873,  591,  429,
			 6675, 1651, 1679, 1668,  861,  811, 1696, 1725, 1742, 1770,
			  842, 1748, 6675,    0,    0,  845,  822, 1852, 1855, 1237,
			 1858, 1510, 1863, 1898, 1901, 1906, 1925, 1940,  496, 1944,
			 1949, 1987, 1991, 1662, 1995, 1998, 6675, 1754, 1776, 2060,
			 1782, 1803, 1812, 1818, 2066, 2058, 2092, 2059, 1285, 2101,
			 2107, 2102, 2111, 2126, 2144, 2148, 2149,  821, 2195, 2212,
			 6675,  369, 2219, 2225, 2236,  778, 2242, 2250, 2256, 2267,

			 2285, 2295, 2313, 2324, 2335, 2343, 2357, 2370,  375, 2385,
			 2378, 2393, 2406, 2412, 2428, 2436, 2452, 2464, 2473, 2480,
			  733,  365, 1107,  562, 1135, 1171, 1208,  280, 6675,  752,
			  801, 1364, 6675,  623,  657,  796,  666, 6675, 6675, 2492,
			 6675, 6675, 6675, 6675, 6675,  266, 2514, 2520, 2526,  724,
			 2532, 2544, 2561, 2550, 2567, 2573, 2589, 2595, 2601,  769,
			  147,    0,  724, 2249, 2608, 2609, 2612, 2615, 2618, 2651,
			 2655, 2658, 2664,  951, 2701, 2698, 2691, 2724, 2704, 2739,
			 2772, 2785, 1345, 2801, 2814, 2820, 2844, 2874, 2888, 2894,
			 2900, 2908, 2766, 2915, 1007, 2916, 2919, 2923, 2941, 2926,

			  561, 2993,  567, 3002, 3011,  684, 3018, 3024, 3031, 3049,
			 3057, 3063, 3085, 3091, 3097, 3108, 3115, 3128, 3134, 3140,
			 3156, 3165, 3177, 3193, 3185, 3205, 3213, 3221, 3237, 3250,
			 6675, 3265, 3278, 3289, 3295,  724, 3305, 3311, 3322, 3328,
			 3334, 3350,  300, 3362, 3374, 1089,  403,    0,    0, 3369,
			 3370, 3388, 3391, 3392, 3395, 3428, 3434, 3447,  705, 3438,
			 3471, 3474, 3493, 3484, 3517, 6675,  385, 3554, 3562, 3568,
			 3584, 3597, 3605,  973, 3605, 3614, 3623, 3657, 1479,  305,
			  663,  781, 3689, 6675, 3701, 6675,  661, 3659, 3710,  496,
			 3718, 3724, 3730, 3741, 3757, 3773, 3790, 3802, 3808, 3830,

			 3836,  513, 3855, 3862, 3880, 3886, 3892, 3909, 3915, 3943,
			  639, 3954,  519, 3971, 3961, 3978, 3984, 3996,  635, 4009,
			 4018, 4024, 1217, 6675, 4030,    0,  676, 4037, 4038, 4042,
			 4041, 4060, 4063, 4064, 4084, 1411, 4097, 4119, 4130, 4123,
			 4156, 4193, 6675,  605,  653, 4177, 4202, 4210, 4203, 1586,
			 1853, 2138, 4210,  662, 4271, 4280, 4287, 4293, 4299,  595,
			 4309, 4318, 4324, 4334, 4340, 4351, 4364, 4370, 4379, 4399,
			 4405, 4414, 4430, 4436, 4442, 4464, 4470, 4485,  583, 4497,
			 4508, 4514,  776, 4520,  573, 4526, 4532, 4538,  544, 4545,
			 4549, 4317, 4552, 4556, 1418, 4560, 4598, 4602, 4603, 4607,

			 1935, 4608, 4641, 4649,  540,  538,  508,  492,  551, 4702,
			    0,  586, 4710, 4694, 4722, 4729, 4740, 4751, 4766, 4772,
			 4779, 4785, 4794, 4800, 4806, 4823, 4830, 4851, 4836, 4857,
			 4863, 4876, 1381, 4882, 1487, 4889,    0, 4896, 4900, 4901,
			 6675, 4920, 2017, 4938, 4942, 4953, 1291, 1585, 1845, 1861,
			 4974, 6675,  483, 4987,  470, 5003, 5018, 5024, 5030, 5046,
			 5053, 5073,  426, 5079, 5090, 5098, 5104, 5110, 5116, 6675,
			 5122,    0, 5129, 5134, 5138, 5171, 6675, 5153, 5175, 2000,
			 2290, 2610, 2656, 5207, 1162, 5219, 5236, 5225, 5245, 5257,
			 5263, 5274, 5284,  416, 5290, 5305, 5311,  502, 5305, 5323,

			 5330, 5331,  680, 6675,  832,  433, 6675, 5376, 5367, 5394,
			 5401,  713, 5407,    0,  326, 5415, 5416, 5422, 5437,  792,
			 1031, 2839, 5438, 5423, 5483, 5498, 5504, 5510,  659, 5516,
			 5523, 5526, 1279, 1377, 3493, 5526, 5532, 1868, 5577, 5569,
			 5572,  366,  317,  641, 5605, 5560, 5616, 1685, 6675, 5623,
			  240, 5633, 5632, 2299, 2438, 5639, 5649, 5664, 5684, 5693,
			  220, 5704, 5701, 2910, 3151, 5710, 5717, 2006, 5723,  134,
			  121, 5733, 5745, 2081, 6675, 5762, 2020, 2178, 5751, 5768,
			 2392, 2415, 5774, 1561, 6675, 6675, 5780, 5786, 5792, 6675,
			 5798, 5809, 5815, 5821, 6675, 5861, 5888, 5915, 5942, 5969,

			 5831,  847, 5995, 6017, 6043, 6069, 6095, 6122, 6149, 6175,
			 6201, 6228, 6255, 6277, 6303, 6322, 6342,  878, 6368, 6395,
			 6422, 6448, 6462, 6479, 6497, 6523, 6537, 6550, 6567, 6584,
			 5838, 6597, 6614, 6631, 6648, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  794,    1,  795,  795,  796,  796,  794,    7,  797,
			  797,  794,  794,  794,  794,  794,  798,  794,  799,  800,
			  794,  794,  794,  794,  794,  794,  801,  794,  794,  794,
			  794,  794,  794,  794,  794,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  803,  794,  794,  804,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,   62,  805,  805,
			  794,  794,  794,  806,  794,  794,  794,  806,  806,  806,
			  806,  806,  807,  794,  808,  807,  794,  809,  794,  809,
			  809,  794,  810,  811,  794,  794,  794,  794,  798,  794,

			  812,  812,  812,  813,  814,  794,  794,  794,  815,  794,
			  794,  794,  794,  794,  794,  794,  794,  802,  816,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  794,   46,  802,
			  802,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  803,  803,  803,  804,  794,  794,  794,  817,  805,  805,
			  805,  805,  794,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  794,  806,  794,  794,  794,
			  794,  806,  806,  806,  806,  806,  807,  794,  818,  807,

			  808,  819,  808,  818,  794,  809,  809,  794,  794,  794,
			  794,  820,  794,  810,  811,  794,  794,  214,  821,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  801,  794,  794,  794,  794,  794,
			  794,  794,  794,  822,  823,  794,  816,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  794,  140,
			  140,  140,  140,  140,  140,  140,  794,  794,  823,  140,
			  269,  269,  269,  269,  141,  141,  141,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  794,  803,  803,
			  794,  824,  174,  174,  174,  794,  174,  174,  174,  174,

			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  806,  806,  806,  806,  806,  806,  806,  818,  794,  819,
			  825,  825,  794,  825,  825,  825,  821,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  822,
			  823,  826,  816,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  794,  140,  140,  140,  140,  140,  140,
			  794,  823,  269,  269,  269,  138,  269,  138,  794,  823,
			  269,  269,  140,  140,  794,  140,  140,  140,  140,  140,

			  794,  803,  803,  803,  803,  794,  174,  174,  794,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  823,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  827,  828,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  794,  140,
			  140,  140,  140,  140,  140,  794,  823,  269,  269,  794,
			  823,  269,  471,  794,  140,  140,  140,  140,  822,  794,
			  794,  794,  803,  794,  803,  794,  794,  174,  174,  794,
			  794,  174,  174,  174,  174,  174,  174,  174,  174,  174,

			  174,  823,  823,  174,  174,  174,  174,  174,  174,  174,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  829,  828,  140,  140,  140,
			  140,  140,  140,  140,  140,  794,  140,  140,  140,  140,
			  140,  269,  794,  823,  794,  140,  140,  140,  140,  794,
			  822,  822,  794,  794,  803,  803,  794,  174,  794,  794,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  829,  140,
			  140,  140,  140,  140,  794,  140,  140,  140,  140,  140,

			  794,  140,  140,  140,  794,  794,  822,  822,  794,  794,
			  830,  794,  794,  174,  794,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  831,  140,  140,  140,
			  794,  140,  794,  140,  140,  140,  794,  794,  827,  827,
			  794,  794,  832,  794,  794,  174,  174,  174,  174,  174,
			  174,  174,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  833,  140,  140,  140,  140,  794,  140,  140,  794,
			  794,  829,  829,  794,  794,  794,  174,  174,  174,  174,
			  174,  174,  794,  794,  794,  794,  794,  833,  140,  140,

			  140,  140,  794,  794,  829,  829,  794,  174,  174,  174,
			  174,  794,  794,  834,  794,  140,  140,  140,  140,  794,
			  794,  829,  174,  174,  174,  174,  794,  794,  834,  794,
			  140,  140,  794,  794,  829,  174,  174,  794,  794,  140,
			  140,  794,  794,  829,  174,  174,  794,  794,  794,  794,
			  794,  794,  140,  794,  794,  174,  794,  794,  794,  794,
			  794,  794,  140,  794,  794,  174,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,    0,  794,  794,  794,  794,  794,

			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
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
			   79,   80,   64,   81,   82,   83,    1,    1,   84,   84,
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
			    0,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    5,    6,    1,    1,    7,    8,    8,    9,   10,   10,
			   10,   10,   10,   11,    1,    1,   12,    1,   13,    1,
			   14,   15,   16,   17,   18,   19,   14,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   14,   20,   21,   22,   23,    1,   10,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   25,
			   26,    1,    1,   27,    1,    1,    1,    1,    1,    1,
			    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  102,  102,    0,    0,    0,
			    0,  133,  131,    1,    2,   15,  115,   18,  131,   16,
			   17,    7,    6,   13,    5,   11,    8,  107,  107,   14,
			   12,   28,   10,   29,   19,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   80,   95,   95,   95,
			   95,   21,   30,   22,    9,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   23,   20,   24,  119,  120,  121,  122,  119,  119,  119,
			  119,  119,  102,  105,  132,  102,  132,  132,   68,  132,
			  132,   70,  132,  132,   94,    1,    2,   27,  115,  114,

			  129,  129,  129,    0,    3,   32,  113,   31,   99,    0,
			    0,  107,    0,  107,   26,   25,    0,   95,   89,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   39,    0,   95,   88,
			   88,   79,   88,   88,   95,   95,   95,   95,   95,   95,
			    0,    0,    0,    0,  106,    0,    0,    0,   98,   98,
			   98,   98,    0,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   39,   98,
			   98,   98,   98,   98,   98,  101,  119,  121,  120,  117,
			  116,  118,  119,  119,  119,  119,  102,  105,    0,  102,

			    0,    0,    0,  103,  104,    0,    0,   70,   68,    0,
			   67,    0,   66,    0,    0,   94,   92,   92,    0,   93,
			  129,  123,  129,  129,  129,  129,  129,  129,    0,    4,
			   33,  113,    0,    0,    0,    0,    0,  109,    0,  107,
			    0,    0,   89,    0,    0,    0,    0,   95,   95,   38,
			   95,   95,   95,   95,   95,   95,   95,   95,    0,   95,
			   95,   95,   95,   41,   95,   95,   87,    0,    0,   80,
			   81,   80,   80,   80,   88,   95,   88,   88,   88,   95,
			   95,   95,   95,   95,   95,   40,   95,    0,    0,    0,
			   97,  100,   98,   98,   38,    0,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   63,   63,   98,
			   41,   98,   98,   98,   98,   98,   98,   98,   40,   98,
			  119,  119,  119,  119,  119,  119,  119,    0,  103,  104,
			    0,    0,   69,   67,   66,   70,    0,  127,  130,  130,
			  128,  124,  125,  126,   90,  113,    0,  113,    0,    0,
			    0,  109,    0,    0,    0,  112,  107,    0,    0,    0,
			    0,    0,   96,   95,   95,   95,   95,   95,   37,   95,
			   95,   95,   95,    0,   95,   95,   95,   95,   95,   95,
			    0,    0,   95,   79,   95,   95,   95,   95,    0,    0,
			   79,   79,   79,   36,    0,   43,   95,   95,   95,   95,

			   65,    0,    0,    0,    0,    0,   98,   98,    0,   98,
			   98,   98,   37,   98,   98,   98,   98,   98,   98,   98,
			    0,   98,   98,   98,   36,   43,   98,   98,   98,   98,
			  104,  113,    0,    0,    0,  108,  109,    0,  110,    0,
			  112,    0,    0,    0,  107,   76,    0,    0,    0,   58,
			   95,   95,   95,   95,   95,   95,   44,   95,    0,   95,
			   95,   35,   95,   95,   95,   81,   81,   81,   80,    0,
			    0,   95,   95,    0,   95,   95,   95,   95,    0,   65,
			    0,    0,    0,   62,    0,   61,    0,   58,   98,    0,
			    0,   98,   98,   98,   98,   98,   44,   98,   98,   98,

			   35,   63,   63,   98,   98,   98,   98,   98,   98,   98,
			  113,    0,    0,    0,  109,  110,    0,    0,  112,    0,
			    0,    0,    0,   76,    0,    0,    0,   95,   59,   95,
			   60,   95,   95,   46,   95,    0,   95,   95,   95,   95,
			   95,   95,   79,   79,    0,   52,   95,   95,   95,    0,
			    0,    0,    0,    0,    0,    0,    0,   98,    0,    0,
			   59,   98,   60,   98,   98,   46,   98,   98,   98,   98,
			   98,   98,   52,   98,   98,   98,    0,    0,   99,    0,
			  110,    0,  113,    0,   78,    0,    0,  111,    0,   95,
			   95,   57,   95,   45,    0,   42,   56,   34,   95,   50,

			    0,   95,   95,   95,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   98,    0,   98,   57,   98,   45,   42,
			   56,   34,   98,   50,   98,   98,   98,    0,    0,  110,
			    0,    0,    0,    0,   75,  111,    0,   95,   95,   95,
			   84,   95,    0,   95,   95,   53,    0,    0,    0,    0,
			    0,   64,    0,    0,  100,   98,   98,   98,   98,   98,
			   98,   53,  112,    0,  112,    0,    0,    0,    0,   75,
			  111,    0,   95,   95,   47,   95,   83,   51,   95,    0,
			    0,    0,    0,    0,    0,    0,   98,   98,   47,   98,
			   51,   98,  112,   77,    0,   75,  111,    0,   95,   95,

			   95,   95,   82,   82,   82,   82,   91,   98,   98,   98,
			   98,    0,    0,    0,    0,   95,   49,   48,   95,    0,
			    0,    0,   98,   49,   48,   98,    0,    0,    0,    0,
			   95,   95,    0,    0,    0,   98,   98,   74,   71,   95,
			   54,    0,    0,    0,   98,   54,    0,    0,   74,    0,
			    0,    0,   95,    0,    0,   98,    0,    0,   71,    0,
			    0,   71,   55,    0,    0,   55,    0,   73,    0,    0,
			    0,    0,    0,    0,   73,   71,    0,    0,    0,    0,
			    0,    0,    0,   72,   85,   86,    0,    0,    0,   72,
			    0,   72,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6675
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 794
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 795
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

	yyNb_rules: INTEGER = 132
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 133
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_REGEXP1: INTEGER = 2
	IN_VALUE_SET_DEF: INTEGER = 3
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

	Init_buffer_size: INTEGER = 1024
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
