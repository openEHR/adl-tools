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

-- \[ac{CODE_STR}\] {
		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 65 then
--|#line 232 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 232")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_VALUE_SET_DEF)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 240 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 240")
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
--|#line 247 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 247")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 254 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 254")
end
in_lineno := in_lineno + text_count
end
else
--|#line 257 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 257")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 70 then
--|#line 259 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 259")
end
 -- match final line, terminating in ']'
				if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
					last_token := ERR_VALUE_SET_DEF
					create err_str.make (in_buffer.count)
					err_str.append (in_buffer)
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
--|#line 282 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 282")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
--|#line 289 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 289")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 290 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 291 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 291")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 298 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 298")
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
--|#line 299 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 299")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 306 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 306")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 307 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 307")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 314 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 314")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 315 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 315")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 322 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 322")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 82 then
--|#line 334 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 334")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 344 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 344")
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
--|#line 349 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 349")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 359 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 359")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 86 then
--|#line 365 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 365")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 376 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 376")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 385 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 385")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 399 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 399")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 90 then
--|#line 406 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 406")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 412 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 412")
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
--|#line 418 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 418")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 422 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 422")
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
--|#line 464 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 464")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 470 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 470")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 476 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 476")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 482 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 482")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 98 then
--|#line 489 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 489")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text
		
else
--|#line 495 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 495")
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
--|#line 501 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 501")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
else
--|#line 507 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 507")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 514 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 514")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 103 then
--|#line 518 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 518")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 522 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 522")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 526 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 526")
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
--|#line 538 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 538")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 107 then
--|#line 545 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 545")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 550 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 550")
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
--|#line 565 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 565")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 566 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 566")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 111 then
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
			
else
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
			
end
end
else
if yy_act <= 114 then
if yy_act = 113 then
--|#line 572 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 572")
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
--|#line 592 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 592")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 597 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 597")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 605 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 605")
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
--|#line 607 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 607")
end
in_buffer.append_character ('"')
else
--|#line 609 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 609")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 613 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 613")
end
in_buffer.append_string (text)
else
--|#line 615 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 615")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 620 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 620")
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
--|#line 631 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 631")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 640 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 640")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 642 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 642")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 643 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 643")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 644 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 644")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 645 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 645")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 646 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 646")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 648 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 648")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 649 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 649")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 653 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 653")
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
			create an_array.make_filled (0, 0, 6777)
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

			   95,   75,   95,   95,  105,  190,  106,  106,  106,  106,
			  106,  106,  109,  202,  110,  288,  111,  111,  111,  111,
			  111,  111,  116,  116,  198,  116,  151,  235,  288,   84,
			   85,   84,   85,  117,  152,  153,  159,  182,  189,  140,
			  189,  189,  183,   76,  102,  423,  118,  310,   76,   94,
			  203,  204,  191,   94,  783,  112,   95,  159,   95,   95,
			  199,  200,  117,  236,  159,  182,  289,  140,  782,  189,
			  183,  189,  189,  765,  291,  766,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   90,   86,
			   86,   86,   86,   86,   86,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   86,   86,
			   91,   86,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  109,  188,  110,
			  288,  113,  113,  113,  113,  113,  113,  206,  116,  116,
			  206,  116,  116,  116,  205,  116,  215,  288,  116,  116,

			  211,  116,  188,  211,  213,  188,  760,  213,  116,  116,
			  156,  116,  118,  156,  116,  116,  118,  116,  157,  759,
			  112,  119,  118,  557,  122,  120,  123,  121,  522,  522,
			  199,  200,  118,  188,  290,  124,  116,  116,  118,  116,
			  208,  732,  133,  116,  116,  125,  116,  116,  116,  119,
			  116,  216,  122,  120,  123,  121,  126,  193,  116,  116,
			  118,  116,  202,  124,  127,  116,  116,  118,  116,  206,
			  133,  118,  206,  125,  116,  116,  128,  116,  129,  192,
			  192,  192,  118,  195,  195,  126,  637,  134,  230,  118,
			  230,  230,  127,  245,  188,  135,  130,  131,  118,  203,

			  204,  246,  132,  288,  128,  215,  129,  198,  136,  712,
			  194,  194,  194,  156,  148,  134,  156,  116,  116,  707,
			  116,  157,  208,  135,  130,  131,  116,  116,  158,  116,
			  132,  359,  359,  359,  359,  359,  136,  116,  116,  407,
			  116,  118,  148,  199,  200,  116,  116,  158,  116,  518,
			  118,  288,  137,  138,  138,  138,  138,  138,  138,  156,
			  216,  118,  156,  560,  163,  146,  149,  157,  139,  118,
			  147,  196,  196,  196,  158,  140,  116,  116,  210,  116,
			  144,  210,  141,  408,  142,  487,  143,  188,  145,  156,
			  211,  164,  156,  146,  526,  149,  139,  157,  147,  188,

			  243,  213,  561,  140,  158,  205,  156,  158,  144,  156,
			  163,  331,  579,  142,  157,  143,  145,  683,  433,  164,
			  363,  158,  160,  652,  156,  375,  161,  156,  162,  245,
			  156,  208,  157,  156,  165,  112,  375,  246,  157,  158,
			  163,  199,  200,  166,  156,  158,  375,  156,  203,  204,
			  160,  580,  157,  650,  161,  329,  162,  163,  169,  158,
			  233,  167,  165,  653,  375,  156,  193,  738,  156,  188,
			  170,  166,  168,  157,  649,  163,  192,  192,  192,  171,
			  158,  163,  156,  234,  156,  156,  169,  156,  233,  167,
			  157,  648,  157,  338,  338,  163,  338,  158,  170,  158,

			  647,  168,  654,  172,  173,  156,  739,  171,  156,  174,
			  176,  188,  637,  157,  178,  156,  163,  633,  156,  219,
			  158,  423,  235,  157,  175,  335,  334,  179,  335,  246,
			  158,  172,  173,  163,  188,  163,  156,  174,  176,  156,
			  210,  158,  178,  210,  157,  177,  156,  195,  195,  156,
			  180,  158,  211,  212,  157,  179,  163,  483,  181,  336,
			  334,  158,  336,  213,  402,  288,  163,  402,  229,  229,
			  223,  229,  611,  177,  714,  715,  184,  245,  180,  224,
			  224,  224,  224,  224,  224,  246,  181,  163,  192,  192,
			  192,  720,  346,  208,  602,  185,  484,  163,  232,  232,

			  232,  232,  232,  232,  184,  237,  237,  237,  237,  237,
			  237,  327,  327,  327,  233,  225,  242,  242,  242,  242,
			  242,  242,  714,  715,  185,  218,  218,  244,  218,  402,
			  226,  444,  402,  721,  227,  188,  228,  234,  435,  109,
			  188,  110,  233,  240,  240,  240,  240,  240,  240,  241,
			  558,  219,  537,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  238,  238,  238,  238,
			  238,  238,  112,  188,  109,  684,  488,  116,  116,  109,
			  116,  110,  239,  240,  240,  240,  240,  240,  240,  364,

			  244,  245,  116,  116,  450,  116,  220,  338,  338,  246,
			  338,  118,  328,  328,  328,  244,  245,  192,  192,  192,
			  239,  637,  116,  116,  246,  116,  118,  116,  116,  760,
			  116,  210,  112,  800,  210,  244,  245,  720,  437,  482,
			  244,  245,  482,  211,  246,  334,  118,  248,  637,  246,
			  632,  118,  116,  116,  213,  116,  334,  330,  250,  249,
			  194,  194,  194,  411,  554,  244,  245,  116,  116,  554,
			  116,  402,  554,  355,  246,  248,  118,  610,  632,  722,
			  244,  245,  364,  363,  208,  251,  250,  249,  351,  246,
			  800,  118,  116,  116,  345,  116,  344,  343,  116,  116,

			  342,  116,  729,  729,  729,  244,  245,  293,  293,  293,
			  252,  244,  245,  251,  246,  339,  118,  800,  800,  209,
			  246,  329,  118,  116,  116,  330,  116,  116,  116,  329,
			  116,  188,  253,  297,  117,  285,  244,  245,  252,  292,
			  244,  245,  254,  116,  116,  246,  116,  118,  117,  246,
			  117,  118,  155,  255,  288,  267,  244,  245,  231,  256,
			  253,  230,  117,  285,  257,  246,  229,  118,  222,   99,
			  254,  116,  116,   96,  116,  116,  116,  209,  116,  117,
			  461,  255,  188,  186,  244,  245,  258,  256,  244,  245,
			  155,  461,  257,  259,  115,  118,  114,  246,  107,  118, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  104,  461,  546,   99,  116,  116,   97,  116,  116,  116,
			   96,  116,  800,  546,  258,  800,  260,  244,  245,  461,
			  800,  244,  245,  546,  116,  116,  246,  116,  118,  800,
			  246,  363,  118,  800,  261,  800,  476,  244,  245,  800,
			  800,  546,  116,  116,  260,  116,  246,  476,  118,  159,
			  159,  159,  159,  159,  159,  244,  245,  476,  116,  116,
			  735,  116,  261,  262,  246,  315,  118,  800,  735,  263,
			  156,  244,  245,  156,  800,  476,  116,  116,  157,  116,
			  246,  735,  118,  244,  245,  158,  800,  264,  265,  244,
			  245,  800,  246,  315,  800,  800,  735,  263,  246,  800,

			  118,  800,  523,  800,  523,  116,  116,  266,  116,  116,
			  116,  800,  116,  524,  188,  264,  265,  800,  244,  245,
			  137,  163,  244,  245,  137,  800,  800,  246,  800,  118,
			  800,  246,  800,  118,  800,  266,  268,  244,  269,  800,
			  139,  525,  188,  800,  117,  800,  246,  800,  800,  283,
			  275,  800,  800,  284,  275,  270,  142,  800,  117,  271,
			  117,  800,  272,  210,  683,  683,  210,  683,  139,  117,
			  800,  273,  117,  274,  800,  211,  800,  283,  188,  800,
			  800,  284,  800,  270,  800,  142,  213,  271,  706,  117,
			  272,  196,  196,  196,  800,  117,  280,  800,  117,  281,

			  273,  800,  274,  276,  276,  276,  276,  276,  276,  117,
			  800,  117,  117,  282,  117,  800,  208,  800,  117,  192,
			  192,  192,  277,  117,  280,  278,  117,  281,  800,  800,
			  800,  279,  117,  117,  117,  588,  588,  588,  588,  588,
			  117,  282,  800,  117,  117,  286,  117,  117,  800,  117,
			  277,  800,  800,  278,  800,  192,  192,  192,  117,  279,
			  117,  117,  287,  117,  800,  800,  156,  800,  800,  156,
			  117,  679,  117,  286,  157,  679,  800,  800,  117,  244,
			  245,  158,  156,  800,  117,  156,  117,  800,  246,  117,
			  157,  287,  679,  800,  800,  244,  245,  158,  117,  156,

			  800,  800,  156,  679,  246,  800,  800,  157,  736,  800,
			  800,  294,  244,  245,  158,  117,  736,  163,  117,  295,
			  680,  246,  800,  156,  680,  800,  156,  800,  800,  736,
			  296,  157,  117,  163,  117,  800,  244,  245,  158,  294,
			  156,  680,  800,  156,  736,  246,  117,  295,  157,  800,
			  163,  188,  680,  244,  245,  158,  298,  156,  296,  268,
			  156,  269,  246,  117,  800,  157,  333,  334,  800,  333,
			  244,  245,  158,  156,  163,  800,  156,  800,  335,  246,
			  800,  157,  271,  299,  298,  470,  244,  245,  158,  336,
			  156,  163,  117,  156,  800,  246,  800,  300,  157,  665,

			  665,  665,  665,  244,  245,  158,  746,  800,  163,  800,
			  271,  299,  246,  470,  746,  156,  800,  301,  156,  337,
			  302,  800,  800,  157,  163,  300,  303,  746,  244,  245,
			  158,  322,  323,  324,  325,  326,  156,  246,  800,  156,
			  596,  163,  746,  800,  157,  301,  800,  641,  302,  244,
			  245,  158,  304,  800,  303,  800,  800,  596,  246,  156,
			  800,  596,  156,  800,  641,  800,  163,  157,  641,  800,
			  800,  800,  244,  245,  158,  156,  800,  800,  156,  305,
			  304,  259,  800,  157,  800,  596,  800,  163,  244,  245,
			  158,  156,  641,  800,  156,  800,  800,  246,  800,  157,

			  667,  668,  667,  668,  244,  245,  158,  305,  551,  156,
			  163,  800,  156,  246,  800,  800,  306,  157,  800,  552,
			  800,  307,  244,  245,  158,  800,  163,  800,  800,  553,
			  800,  246,  159,  159,  159,  159,  159,  159,  800,  669,
			  800,  800,  163,  368,  306,  800,  800,  552,  800,  307,
			  340,  341,  341,  341,  341,  341,  341,  117,  800,  117,
			  163,  311,  800,  800,  308,  156,  800,  800,  156,  800,
			  800,  368,  800,  157,  793,  794,  793,  794,  244,  245,
			  158,  309,  310,  310,  310,  310,  310,  246,  117,  311,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,

			  159,  159,  159,  159,  159,  159,  159,  159,  800,  800,
			  313,  800,  800,  795,  679,  606,  163,  314,  681,  312,
			  159,  159,  159,  159,  159,  159,  606,  800,  159,  159,
			  159,  159,  159,  159,  800,  681,  607,  800,  313,  159,
			  159,  159,  159,  159,  159,  314,  681,  312,  317,  800,
			  316,  800,  318,  800,  606,  319,  800,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  347,
			  347,  347,  347,  347,  347,  800,  317,  800,  316,  800,
			  318,  800,  800,  319,  320,  233,  350,  350,  350,  350,
			  350,  350,  348,  800,  348,  117,  321,  349,  349,  349,

			  349,  349,  349,  763,  763,  763,  763,  763,  234,  117,
			  800,  117,  320,  233,  352,  352,  352,  352,  352,  352,
			  800,  800,  800,  117,  800,  321,  332,  333,  334,  332,
			  333,  332,  332,  332,  332,  332,  332,  332,  332,  335,
			  117,  800,  332,  353,  353,  353,  353,  353,  353,  332,
			  336,  332,  332,  332,  332,  356,  800,  356,  800,  354,
			  357,  357,  357,  357,  357,  357,  360,  360,  360,  360,
			  360,  360,  382,  382,  382,  382,  382,  382,  332,  332,
			  337,  332,  355,  800,  109,  800,  110,  354,  358,  358,
			  358,  358,  358,  358,  383,  383,  383,  383,  383,  383,

			  386,  386,  386,  386,  386,  386,  332,  332,  332,  332,
			  332,  332,  332,  332,  332,  332,  332,  218,  218,  800,
			  218,  387,  387,  387,  387,  387,  387,  112,  800,  117,
			  388,  388,  388,  388,  388,  388,  389,  389,  389,  389,
			  389,  389,  800,  219,  800,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  450,  800,
			  800,  800,  800,  800,  680,  800,  800,  800,  682,  800,
			  800,  752,  606,  752,  800,  117,  365,  800,  117,  800,
			  702,  117,  753,  608,  702,  682,  117,  366,  220,  117,

			  367,  117,  117,  609,  117,  117,  682,  117,  800,  369,
			  117,  702,  117,  117,  365,  800,  117,  800,  800,  117,
			  754,  608,  702,  800,  117,  366,  800,  800,  367,  800,
			  117,  117,  370,  117,  117,  800,  117,  369,  800,  117,
			  371,  117,  800,  800,  800,  117,  800,  117,  117,  800,
			  117,  800,  372,  117,  800,  117,  800,  800,  117,  117,
			  370,  800,  117,  800,  643,  800,  800,  117,  371,  800,
			  800,  373,  117,  117,  117,  800,  117,  117,  800,  117,
			  372,  643,  117,  376,  117,  643,  117,  117,  377,  117,
			  800,  117,  800,  117,  800,  800,  117,  374,  117,  373, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  800,  117,  800,  117,  800,  117,  800,  800,  800,  643,
			  117,  376,  800,  800,  800,  800,  377,  800,  117,  778,
			  117,  778,  117,  379,  117,  378,  800,  117,  117,  703,
			  779,  117,  381,  703,  117,  800,  117,  800,  117,  800,
			  117,  800,  117,  380,  117,  117,  676,  117,  117,  786,
			  703,  379,  117,  378,  800,  800,  117,  800,  780,  117,
			  381,  703,  800,  676,  800,  117,  786,  676,  800,  117,
			  786,  380,  390,  117,  391,  800,  117,  800,  384,  384,
			  384,  384,  384,  384,  117,  117,  117,  117,  117,  117,
			  800,  676,  117,  117,  786,  392,  800,  800,  393,  785,

			  785,  785,  785,  785,  394,  279,  117,  385,  117,  117,
			  117,  117,  117,  117,  117,  117,  800,  800,  800,  800,
			  117,  117,  800,  392,  800,  800,  393,  800,  800,  117,
			  108,  396,  394,  279,  117,  117,  397,  117,  117,  800,
			  117,  800,  395,  800,  117,  108,  108,  108,  117,  117,
			  117,  117,  800,  450,  117,  398,  117,  117,  117,  117,
			  117,  800,  117,  117,  397,  800,  800,  607,  117,  800,
			  395,  399,  117,  117,  800,  117,  800,  117,  609,  117,
			  117,  117,  117,  398,  800,  117,  800,  117,  609,  117,
			  800,  117,  800,  117,  800,  117,  117,  117,  117,  399,

			  401,  400,  800,  800,  117,  117,  609,  787,  800,  117,
			  117,  403,  800,  403,  403,  403,  403,  403,  403,  288,
			  800,  800,  117,  800,  787,  800,  117,  117,  787,  401,
			  404,  405,  406,  406,  406,  406,  288,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  800,
			  800,  800,  787,  409,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  800,  410,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  800,  409,  117,  413,  412,  159,  159,  159,  159,  159,
			  159,  800,  800,  800,  452,  410,  117,  800,  117,  800,

			  800,  415,  414,  159,  159,  159,  159,  159,  159,  800,
			  117,  413,  412,  159,  159,  159,  159,  159,  159,  702,
			  800,  800,  452,  704,  416,  800,  800,  117,  769,  415,
			  414,  159,  159,  159,  159,  159,  159,  800,  800,  769,
			  704,  417,  159,  159,  159,  159,  159,  159,  800,  769,
			  800,  704,  416,  159,  159,  159,  159,  159,  159,  418,
			  800,  159,  159,  159,  159,  159,  159,  769,  800,  417,
			  800,  800,  800,  800,  420,  159,  159,  159,  159,  159,
			  159,  419,  421,  800,  800,  800,  423,  418,  159,  159,
			  159,  159,  159,  159,  800,  422,  159,  159,  159,  159,

			  159,  159,  420,  159,  159,  159,  159,  159,  159,  800,
			  421,  159,  159,  159,  159,  159,  159,  424,  800,  800,
			  800,  790,  800,  422,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  800,  800,  790,  800,
			  426,  425,  790,  800,  791,  424,  159,  159,  159,  159,
			  159,  159,  800,  427,  159,  159,  159,  159,  159,  159,
			  800,  791,  428,  800,  800,  791,  790,  770,  426,  425,
			  159,  159,  159,  159,  159,  159,  800,  800,  770,  800,
			  429,  427,  159,  159,  159,  159,  159,  159,  770,  791,
			  428,  159,  159,  159,  159,  159,  159,  430,  159,  159,

			  159,  159,  159,  159,  800,  800,  770,  800,  429,  340,
			  341,  341,  341,  341,  341,  341,  800,  800,  800,  800,
			  800,  431,  800,  800,  800,  430,  800,  800,  800,  800,
			  800,  432,  349,  349,  349,  349,  349,  349,  434,  434,
			  434,  434,  434,  434,  436,  436,  436,  436,  436,  436,
			  438,  438,  438,  438,  438,  438,  800,  800,  800,  800,
			  432,  800,  439,  439,  439,  439,  439,  439,  442,  442,
			  442,  442,  442,  442,  440,  800,  440,  435,  354,  441,
			  441,  441,  441,  441,  441,  357,  357,  357,  357,  357,
			  357,  443,  443,  443,  443,  443,  443,  800,  800,  800,

			  800,  355,  800,  800,  445,  446,  354,  447,  447,  447,
			  447,  447,  447,  448,  448,  448,  448,  448,  448,  449,
			  449,  449,  449,  449,  449,  800,  800,  800,  800,  800,
			  444,  800,  800,  800,  800,  800,  800,  800,  800,  703,
			  800,  117,  117,  705,  800,  117,  800,  800,  117,  456,
			  455,  117,  800,  800,  454,  117,  117,  453,  117,  117,
			  705,  117,  117,  800,  117,  117,  800,  117,  800,  117,
			  117,  705,  800,  117,  800,  800,  117,  456,  455,  117,
			  800,  800,  454,  800,  117,  800,  453,  117,  117,  800,
			  117,  117,  459,  117,  460,  800,  117,  117,  117,  457,

			  117,  800,  458,  800,  117,  117,  800,  117,  800,  800,
			  800,  117,  117,  117,  800,  800,  117,  800,  800,  117,
			  459,  800,  460,  800,  117,  117,  800,  457,  800,  117,
			  458,  117,  464,  117,  117,  800,  117,  117,  117,  462,
			  117,  800,  117,  800,  800,  117,  463,  117,  117,  466,
			  117,  117,  117,  117,  800,  800,  800,  117,  800,  117,
			  464,  465,  117,  800,  800,  117,  800,  462,  800,  117,
			  800,  117,  117,  117,  463,  800,  117,  466,  800,  117,
			  800,  800,  117,  800,  467,  117,  117,  800,  117,  465,
			  382,  382,  382,  382,  382,  382,  800,  800,  800,  117,

			  117,  245,  117,  383,  383,  383,  383,  383,  383,  246,
			  800,  800,  467,  117,  800,  117,  800,  117,  468,  276,
			  276,  276,  276,  276,  276,  800,  800,  117,  268,  800,
			  269,  469,  386,  386,  386,  386,  386,  386,  387,  387,
			  387,  387,  387,  387,  117,  800,  468,  800,  117,  747,
			  800,  800,  800,  800,  470,  637,  800,  747,  800,  469,
			  470,  117,  388,  388,  388,  388,  388,  388,  736,  800,
			  747,  117,  800,  800,  800,  800,  737,  471,  800,  800,
			  800,  800,  470,  800,  800,  747,  800,  800,  470,  737,
			  800,  117,  389,  389,  389,  389,  389,  389,  800,  800,

			  117,  800,  800,  800,  737,  471,  472,  472,  472,  472,
			  472,  472,  473,  473,  473,  473,  473,  473,  474,  474,
			  474,  474,  474,  474,  800,  117,  475,  475,  475,  475,
			  475,  475,  800,  800,  800,  800,  800,  800,  800,  775,
			  800,  481,  800,  800,  800,  800,  800,  117,  117,  117,
			  775,  800,  117,  800,  117,  117,  478,  800,  800,  117,
			  775,  800,  117,  117,  117,  117,  117,  477,  117,  800,
			  117,  479,  117,  117,  117,  117,  117,  117,  775,  800,
			  117,  800,  480,  800,  478,  800,  800,  117,  117,  800,
			  117,  800,  800,  117,  117,  477,  800,  117,  800,  479, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  800,  117,  117,  800,  117,  800,  800,  800,  800,  403,
			  480,  403,  403,  403,  403,  403,  403,  288,  485,  117,
			  406,  406,  406,  406,  406,  406,  288,  483,  800,  406,
			  406,  406,  406,  406,  406,  288,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  482,  491,
			  492,  492,  492,  492,  492,  800,  800,  486,  800,  800,
			  800,  800,  800,  489,  800,  800,  484,  159,  159,  159,
			  159,  159,  159,  490,  800,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  800,  800,  800,
			  800,  489,  800,  800,  493,  494,  800,  495,  800,  800,

			  800,  800,  490,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  800,  493,  494,  800,  495,  159,  159,  159,  159,
			  159,  159,  800,  159,  159,  159,  159,  159,  159,  496,
			  800,  800,  498,  800,  497,  499,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  800,  800,  500,  496,  800,  800,
			  498,  800,  497,  499,  503,  504,  504,  504,  504,  504,
			  776,  502,  501,  159,  159,  159,  159,  159,  159,  800,
			  800,  776,  800,  800,  500,  159,  159,  159,  159,  159,

			  159,  776,  505,  159,  159,  159,  159,  159,  159,  502,
			  501,  159,  159,  159,  159,  159,  159,  800,  800,  776,
			  800,  800,  506,  159,  159,  159,  159,  159,  159,  800,
			  505,  159,  159,  159,  159,  159,  159,  800,  507,  159,
			  159,  159,  159,  159,  159,  800,  800,  800,  800,  800,
			  506,  800,  800,  800,  509,  159,  159,  159,  159,  159,
			  159,  508,  800,  800,  800,  481,  507,  510,  159,  159,
			  159,  159,  159,  159,  800,  800,  800,  800,  511,  800,
			  800,  800,  509,  512,  512,  512,  512,  512,  512,  508,
			  800,  800,  800,  800,  800,  510,  513,  513,  513,  513,

			  513,  513,  800,  800,  800,  800,  511,  347,  347,  347,
			  347,  347,  347,  514,  515,  515,  515,  515,  515,  800,
			  800,  800,  435,  516,  516,  516,  516,  516,  516,  441,
			  441,  441,  441,  441,  441,  800,  800,  800,  800,  354,
			  517,  517,  517,  517,  517,  517,  519,  519,  519,  519,
			  519,  519,  520,  520,  520,  520,  520,  520,  800,  800,
			  800,  800,  355,  800,  800,  800,  800,  354,  521,  521,
			  521,  521,  521,  521,  800,  800,  800,  800,  800,  518,
			  516,  516,  516,  516,  516,  516,  800,  800,  800,  800,
			  446,  444,  447,  447,  447,  447,  447,  447,  800,  800,

			  800,  800,  117,  117,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  117,  117,  117,  117,
			  800,  117,  530,  800,  117,  532,  800,  529,  533,  800,
			  117,  117,  531,  800,  800,  117,  800,  117,  117,  117,
			  117,  117,  117,  800,  117,  800,  800,  117,  117,  117,
			  530,  800,  117,  532,  800,  800,  533,  800,  800,  800,
			  531,  117,  534,  800,  800,  800,  117,  117,  800,  117,
			  117,  117,  538,  117,  535,  117,  800,  117,  800,  800,
			  117,  117,  800,  117,  800,  117,  536,  117,  800,  117,
			  534,  800,  800,  800,  117,  117,  117,  800,  800,  117,

			  538,  800,  535,  800,  539,  800,  117,  117,  117,  637,
			  800,  800,  117,  800,  536,  800,  117,  117,  117,  800,
			  117,  117,  747,  117,  800,  117,  117,  540,  800,  541,
			  748,  117,  539,  117,  800,  117,  800,  800,  800,  800,
			  117,  800,  117,  748,  800,  117,  800,  800,  800,  117,
			  117,  542,  117,  800,  117,  540,  800,  541,  748,  800,
			  800,  800,  117,  800,  117,  800,  117,  800,  800,  800,
			  800,  117,  543,  543,  543,  543,  543,  543,  117,  542,
			  117,  117,  117,  117,  117,  117,  472,  472,  472,  472,
			  472,  472,  800,  800,  800,  117,  800,  800,  800,  800,

			  245,  117,  473,  473,  473,  473,  473,  473,  246,  800,
			  800,  390,  800,  391,  544,  474,  474,  474,  474,  474,
			  474,  800,  800,  475,  475,  475,  475,  475,  475,  800,
			  545,  800,  800,  800,  800,  800,  800,  393,  117,  547,
			  800,  800,  544,  394,  117,  117,  800,  117,  548,  800,
			  800,  800,  117,  800,  117,  800,  117,  800,  545,  800,
			  800,  117,  800,  117,  800,  393,  117,  547,  549,  800,
			  117,  394,  117,  117,  800,  117,  548,  159,  159,  159,
			  159,  159,  159,  117,  117,  800,  800,  800,  800,  800,
			  117,  800,  117,  800,  800,  800,  549,  800,  800,  550,

			  800,  117,  800,  800,  117,  800,  117,  404,  555,  555,
			  555,  555,  555,  288,  800,  800,  800,  800,  117,  404,
			  556,  555,  555,  555,  555,  288,  800,  550,  159,  159,
			  159,  159,  159,  159,  560,  117,  492,  492,  492,  492,
			  492,  492,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  800,  800,  800,  800,  562,  159,
			  159,  159,  159,  159,  159,  800,  800,  559,  800,  800,
			  800,  563,  800,  561,  564,  159,  159,  159,  159,  159,
			  159,  800,  800,  800,  800,  800,  562,  800,  800,  800,
			  565,  159,  159,  159,  159,  159,  159,  800,  800,  563,

			  800,  800,  564,  800,  800,  800,  800,  566,  159,  159,
			  159,  159,  159,  159,  800,  800,  800,  800,  565,  567,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  800,  800,  800,  566,  800,  800,  800,  800,
			  800,  568,  569,  800,  800,  800,  800,  567,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  800,  800,  800,  570,  800,  800,  800,  800,  800,  568,
			  569,  423,  800,  504,  504,  504,  504,  504,  504,  246,
			  159,  159,  159,  159,  159,  159,  800,  800,  800,  800,
			  800,  570,  800,  800,  800,  800,  571,  800,  159,  159,

			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  800,  800,  800,  800,
			  573,  800,  800,  800,  571,  572,  574,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  800,
			  800,  800,  800,  575,  800,  800,  800,  800,  573,  800,
			  800,  800,  800,  572,  574,  800,  800,  800,  800,  800,
			  576,  159,  159,  159,  159,  159,  159,  800,  800,  800,
			  800,  575,  578,  578,  578,  578,  578,  578,  800,  516,
			  516,  516,  516,  516,  516,  577,  800,  579,  576,  515,
			  515,  515,  515,  515,  515,  581,  582,  582,  582,  582, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  582,  582,  583,  583,  583,  583,  583,  583,  800,  800,
			  800,  800,  800,  577,  584,  584,  584,  584,  584,  584,
			  800,  800,  800,  581,  800,  800,  580,  585,  585,  585,
			  585,  585,  585,  800,  800,  518,  586,  586,  586,  586,
			  586,  586,  587,  587,  587,  587,  587,  587,  589,  589,
			  589,  589,  589,  589,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  239,  800,  800,  591,  800,  800,
			  117,  117,  592,  800,  117,  117,  800,  800,  800,  800,
			  800,  800,  800,  800,  117,  117,  117,  117,  117,  117,
			  117,  117,  239,  117,  593,  591,  117,  117,  117,  117,

			  592,  800,  117,  117,  594,  800,  800,  117,  800,  117,
			  117,  117,  117,  117,  800,  117,  117,  117,  800,  117,
			  117,  117,  593,  595,  117,  117,  800,  800,  800,  800,
			  117,  117,  594,  117,  800,  800,  800,  800,  117,  800,
			  800,  117,  117,  597,  117,  117,  117,  800,  800,  800,
			  800,  595,  117,  598,  800,  800,  117,  600,  117,  800,
			  800,  800,  117,  117,  800,  800,  117,  800,  117,  800,
			  117,  597,  117,  800,  800,  117,  599,  117,  800,  117,
			  117,  598,  800,  800,  117,  600,  800,  800,  800,  601,
			  800,  117,  800,  800,  800,  800,  800,  117,  800,  800,

			  800,  117,  800,  117,  599,  117,  800,  268,  117,  269,
			  117,  543,  543,  543,  543,  543,  543,  601,  800,  800,
			  800,  800,  800,  800,  117,  800,  117,  800,  612,  613,
			  613,  613,  613,  613,  117,  117,  605,  800,  117,  800,
			  117,  800,  604,  117,  800,  800,  800,  603,  800,  117,
			  117,  117,  117,  800,  800,  117,  800,  117,  800,  117,
			  800,  800,  800,  117,  605,  800,  800,  800,  800,  800,
			  604,  117,  800,  800,  800,  603,  800,  800,  800,  800,
			  117,  117,  800,  800,  800,  800,  800,  483,  117,  555,
			  555,  555,  555,  555,  555,  288,  485,  800,  555,  555,

			  555,  555,  555,  555,  288,  159,  159,  159,  159,  159,
			  159,  491,  615,  615,  615,  615,  615,  614,  159,  159,
			  159,  159,  159,  159,  800,  800,  484,  159,  159,  159,
			  159,  159,  159,  800,  800,  486,  800,  800,  800,  616,
			  800,  800,  800,  800,  800,  614,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  800,  800,  800,  616,  617,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  618,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  800,  800,  617,  159,  159,  159,

			  159,  159,  159,  619,  800,  800,  800,  800,  800,  618,
			  800,  800,  800,  621,  800,  800,  620,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  800,
			  800,  619,  159,  159,  159,  159,  159,  159,  800,  623,
			  800,  621,  800,  800,  620,  622,  800,  624,  800,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  512,  512,  512,  512,  512,  512,  623,  800,  626,
			  800,  800,  800,  622,  800,  624,  625,  159,  159,  159,
			  159,  159,  159,  514,  628,  628,  628,  628,  628,  800,
			  800,  800,  627,  629,  800,  629,  800,  626,  630,  630,

			  630,  630,  630,  630,  625,  630,  630,  630,  630,  630,
			  630,  631,  631,  631,  631,  631,  631,  800,  800,  800,
			  627,  520,  520,  520,  520,  520,  520,  634,  634,  634,
			  634,  634,  634,  635,  635,  635,  635,  635,  635,  800,
			  800,  800,  800,  800,  518,  636,  636,  636,  636,  636,
			  636,  800,  800,  800,  800,  117,  800,  800,  117,  117,
			  800,  632,  800,  800,  639,  800,  800,  638,  800,  117,
			  800,  117,  117,  117,  117,  117,  800,  800,  800,  800,
			  800,  640,  117,  117,  355,  800,  117,  117,  800,  632,
			  800,  800,  639,  800,  800,  638,  117,  800,  117,  800,

			  117,  117,  800,  117,  117,  800,  117,  117,  800,  640,
			  117,  800,  800,  800,  800,  117,  800,  117,  800,  800,
			  117,  117,  117,  117,  800,  800,  800,  117,  117,  117,
			  800,  800,  800,  800,  117,  117,  800,  800,  800,  800,
			  800,  117,  117,  800,  117,  800,  117,  117,  117,  642,
			  800,  117,  117,  673,  800,  117,  117,  117,  800,  800,
			  800,  117,  117,  117,  117,  800,  117,  644,  800,  117,
			  800,  800,  800,  117,  117,  117,  117,  642,  645,  800,
			  117,  673,  117,  800,  117,  646,  117,  800,  117,  800,
			  117,  800,  117,  117,  117,  644,  800,  800,  117,  800,

			  117,  800,  117,  800,  800,  800,  645,  800,  800,  800,
			  800,  117,  117,  646,  800,  800,  800,  800,  653,  117,
			  613,  613,  613,  613,  613,  613,  800,  800,  800,  117,
			  800,  159,  159,  159,  159,  159,  159,  560,  800,  615,
			  615,  615,  615,  615,  615,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  654,  655,  159,
			  159,  159,  159,  159,  159,  800,  656,  159,  159,  159,
			  159,  159,  159,  657,  800,  800,  561,  159,  159,  159,
			  159,  159,  159,  800,  800,  800,  655,  159,  159,  159,
			  159,  159,  159,  800,  656,  159,  159,  159,  159,  159,

			  159,  657,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  800,  800,  800,  800,  800,  658,  800,  800,  800,  800,
			  659,  159,  159,  159,  159,  159,  159,  800,  159,  159,
			  159,  159,  159,  159,  630,  630,  630,  630,  630,  630,
			  660,  800,  800,  658,  661,  800,  800,  579,  659,  628,
			  628,  628,  628,  628,  628,  630,  630,  630,  630,  630,
			  630,  662,  662,  662,  662,  662,  662,  800,  660,  663,
			  800,  663,  661,  800,  664,  664,  664,  664,  664,  664,
			  666,  666,  666,  666,  666,  666,  580,  670,  670,  670,

			  670,  670,  670,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  632,  800,  800,  800,  800,  672,  117,
			  800,  800,  800,  117,  674,  675,  117,  800,  800,  800,
			  800,  800,  800,  117,  800,  117,  355,  117,  800,  117,
			  117,  632,  117,  800,  677,  117,  672,  117,  800,  800,
			  800,  117,  674,  675,  117,  800,  800,  800,  117,  117,
			  117,  117,  800,  800,  117,  117,  678,  800,  117,  800,
			  800,  117,  677,  117,  800,  800,  800,  800,  800,  117,
			  800,  117,  612,  685,  685,  685,  685,  685,  800,  117,
			  117,  800,  800,  117,  678,  159,  159,  159,  159,  159, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  159,  159,  159,  159,  159,  159,  159,  800,  117,  686,
			  117,  159,  159,  159,  159,  159,  159,  800,  800,  800,
			  800,  687,  699,  800,  117,  800,  800,  688,  159,  159,
			  159,  159,  159,  159,  800,  800,  117,  686,  800,  800,
			  800,  800,  689,  159,  159,  159,  159,  159,  159,  687,
			  699,  800,  800,  117,  800,  688,  800,  117,  690,  159,
			  159,  159,  159,  159,  159,  800,  800,  800,  800,  800,
			  689,  117,  800,  117,  800,  691,  159,  159,  159,  159,
			  159,  159,  800,  800,  800,  117,  690,  664,  664,  664,
			  664,  664,  664,  692,  692,  692,  692,  692,  692,  800,

			  800,  800,  117,  691,  693,  693,  693,  693,  693,  693,
			  525,  525,  525,  525,  525,  525,  694,  694,  694,  694,
			  694,  694,  695,  695,  695,  695,  695,  695,  800,  800,
			  800,  800,  518,  696,  696,  696,  696,  696,  696,  800,
			  159,  159,  159,  159,  159,  159,  117,  117,  700,  632,
			  698,  800,  800,  800,  800,  117,  800,  800,  800,  708,
			  117,  117,  117,  117,  800,  800,  800,  800,  117,  117,
			  800,  117,  355,  800,  117,  117,  700,  632,  698,  800,
			  800,  800,  701,  117,  117,  800,  800,  708,  800,  800,
			  800,  117,  117,  800,  800,  800,  117,  800,  800,  653,

			  117,  685,  685,  685,  685,  685,  685,  800,  800,  800,
			  701,  800,  800,  117,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  654,  800,
			  800,  800,  710,  709,  159,  159,  159,  159,  159,  159,
			  662,  662,  662,  662,  662,  662,  713,  713,  713,  713,
			  713,  713,  696,  696,  696,  696,  696,  696,  800,  800,
			  710,  709,  667,  711,  667,  800,  800,  695,  695,  695,
			  695,  695,  695,  800,  117,  716,  800,  800,  800,  518,
			  800,  117,  117,  800,  800,  800,  800,  800,  117,  800,

			  117,  711,  117,  800,  800,  117,  117,  117,  117,  717,
			  719,  669,  117,  716,  800,  718,  117,  800,  117,  117,
			  117,  723,  724,  724,  724,  724,  724,  800,  800,  117,
			  117,  800,  800,  800,  800,  800,  117,  117,  717,  719,
			  800,  800,  800,  718,  800,  800,  800,  117,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  800,  800,  800,  800,  725,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  730,  730,  730,
			  730,  730,  730,  800,  800,  800,  800,  726,  800,  800,
			  800,  800,  725,  727,  800,  800,  800,  800,  800,  117,

			  800,  800,  800,  800,  728,  800,  117,  800,  800,  800,
			  117,  800,  800,  733,  800,  117,  726,  800,  800,  800,
			  117,  727,  117,  800,  117,  800,  117,  117,  800,  800,
			  800,  800,  800,  728,  117,  800,  800,  800,  117,  800,
			  800,  733,  800,  800,  117,  800,  117,  800,  800,  800,
			  800,  117,  800,  800,  800,  117,  734,  800,  800,  800,
			  117,  738,  117,  724,  724,  724,  724,  724,  724,  800,
			  800,  800,  800,  800,  117,  159,  159,  159,  159,  159,
			  159,  800,  800,  800,  734,  159,  159,  159,  159,  159,
			  159,  117,  159,  159,  159,  159,  159,  159,  800,  800,

			  739,  800,  800,  800,  740,  159,  159,  159,  159,  159,
			  159,  742,  742,  742,  742,  742,  742,  669,  669,  669,
			  669,  669,  669,  743,  743,  743,  743,  743,  743,  800,
			  741,  800,  740,  800,  800,  723,  749,  749,  749,  749,
			  749,  800,  800,  800,  800,  117,  800,  800,  800,  800,
			  117,  745,  159,  159,  159,  159,  159,  159,  741,  117,
			  117,  117,  800,  744,  117,  800,  117,  159,  159,  159,
			  159,  159,  159,  117,  117,  800,  117,  800,  117,  745,
			  800,  800,  800,  751,  800,  750,  800,  800,  117,  800,
			  117,  755,  744,  756,  757,  117,  743,  743,  743,  743,

			  743,  743,  117,  800,  800,  117,  800,  800,  800,  800,
			  800,  751,  758,  800,  750,  800,  117,  738,  117,  749,
			  749,  749,  749,  749,  749,  800,  800,  800,  800,  800,
			  117,  800,  159,  159,  159,  159,  159,  159,  800,  800,
			  758,  159,  159,  159,  159,  159,  159,  117,  762,  762,
			  762,  762,  762,  762,  800,  800,  739,  761,  764,  764,
			  764,  764,  764,  764,  767,  767,  767,  767,  767,  767,
			  117,  768,  800,  159,  159,  159,  159,  159,  159,  800,
			  800,  800,  800,  800,  117,  761,  117,  800,  800,  771,
			  772,  772,  772,  772,  772,  772,  800,  800,  117,  768,

			  773,  773,  773,  773,  773,  773,  764,  764,  764,  764,
			  764,  764,  800,  800,  800,  117,  765,  771,  764,  764,
			  764,  764,  764,  764,  755,  800,  756,  774,  117,  767,
			  767,  767,  767,  767,  767,  159,  159,  159,  159,  159,
			  159,  800,  117,  800,  117,  777,  777,  777,  777,  777,
			  777,  800,  800,  800,  800,  800,  117,  781,  781,  781,
			  781,  781,  781,  754,  754,  754,  754,  754,  754,  800,
			  800,  800,  800,  117,  784,  784,  784,  784,  784,  784,
			  755,  800,  756,  800,  800,  781,  781,  781,  781,  781,
			  781,  788,  788,  788,  788,  788,  788,  789,  789,  789,

			  789,  789,  789,  792,  792,  792,  792,  792,  792,  780,
			  780,  780,  780,  780,  780,  796,  796,  796,  796,  796,
			  796,  797,  797,  797,  797,  797,  797,  798,  798,  798,
			  798,  798,  798,  793,  800,  793,  800,  800,  797,  797,
			  797,  797,  797,  797,  799,  799,  799,  799,  799,  799,
			  795,  795,  795,  795,  795,  795,  103,  103,  103,  103,
			  103,  103,  103,  651,  651,  651,  651,  651,  651,  651,
			  800,  800,  795,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   98,   98,  800,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  800,   98,   98,   98,   98,
			   98,  100,  100,  800,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  100,  100,  100,  100,  100,  100,  100,  100,  117,  117,
			  117,  800,  800,  800,  800,  800,  117,  117,  117,  800,
			  117,  117,  117,  117,  117,  117,  117,  800,  800,  800,
			  117,  117,  117,  150,  150,  800,  150,  800,  150,  150,
			  800,  800,  150,  150,  150,  150,  150,  150,  150,  800,
			  800,  800,  150,  150,  150,  154,  154,  800,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  159,  800,  159,  159,  800,  800,  800,  159,
			  159,  159,  800,  800,  159,  159,  159,  159,  159,  159,

			  159,  159,  800,  800,  159,  159,  159,  187,  187,  800,
			  187,  187,  187,  187,  187,  187,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  800,  187,
			  187,  187,  187,  187,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  207,  800,
			  207,  800,  800,  800,  207,  800,  207,  207,  800,  800,

			  207,  207,  207,  207,  207,  207,  207,  800,  800,  207,
			  207,  207,  207,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  221,  221,  800,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  103,  800,  800,  800,  103,  103,

			  800,  800,  103,  103,  103,  103,  103,  103,  103,  800,
			  800,  800,  103,  103,  103,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  108,  108,  108,  800,  800,  108,  108,  108,
			  108,  108,  108,  108,  108,  800,  800,  108,  108,  108,
			  247,  800,  800,  247,  247,  247,  247,  247,  247,  247,
			  247,  247,  247,  247,  800,  800,  800,  247,  247,  247,
			  199,  199,  199,  199,  199,  199,  199,  199,  800,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,

			  199,  199,  199,  199,  199,  199,  199,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  220,  220,  220,  800,  800,  800,  800,  800,  800,
			  800,  800,  220,  220,  220,  220,  220,  220,  220,  220,
			  800,  800,  800,  361,  361,  800,  220,  361,  361,  361,
			  361,  361,  361,  361,  800,  800,  800,  361,  361,  361,

			  362,  362,  800,  800,  362,  362,  362,  362,  362,  362,
			  362,  800,  800,  800,  362,  362,  362,  293,  293,  293,
			  800,  800,  293,  293,  293,  293,  293,  293,  293,  293,
			  800,  800,  293,  293,  293,  332,  332,  332,  332,  332,
			  332,  332,  332,  332,  332,  332,  332,  332,  332,  332,
			  332,  332,  332,  332,  332,  332,  332,  332,  332,  332,
			  332,  332,  451,  451,  451,  451,  451,  451,  451,  800,
			  800,  800,  451,  451,  451,  527,  527,  527,  527,  527,
			  527,  527,  800,  800,  800,  527,  527,  527,  528,  528,
			  800,  800,  528,  528,  528,  528,  528,  528,  528,  800,

			  800,  800,  528,  528,  528,  590,  590,  800,  800,  590,
			  590,  590,  590,  590,  590,  590,  800,  800,  800,  590,
			  590,  590,  671,  671,  671,  671,  671,  671,  671,  800,
			  800,  651,  671,  671,  671,  651,  651,  800,  800,  651,
			  651,  651,  651,  651,  651,  651,  800,  800,  800,  651,
			  651,  651,  697,  697,  800,  800,  697,  697,  697,  697,
			  697,  697,  697,  800,  800,  800,  697,  697,  697,  731,
			  731,  800,  800,  731,  731,  731,  731,  731,  731,  731,
			  800,  800,  800,  731,  731,  731,   11,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800, yy_Dummy>>,
			1, 778, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6777)
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

			   13,    4,   13,   13,   25,   76,   25,   25,   25,   25,
			   25,   25,   27,   84,   27,  151,   27,   27,   27,   27,
			   27,   27,   38,   38,   82,   38,   51,  108,  153,    5,
			    5,    6,    6,  142,   51,   51,   67,   67,   74,  143,
			   74,   74,   67,    3,   18,  310,   38,  310,    4,    9,
			   84,   84,   76,   10,  776,   27,   95,   67,   95,   95,
			   82,   82,  142,  108,   67,   67,  151,  143,  775,  189,
			   67,  189,  189,  766,  153,  756,    3,    3,    3,    3,
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
			  487,   28,   28,   28,   28,   28,   28,   87,   35,   35,
			   87,   35,   36,   36,   85,   36,   92,  152,   37,   37,

			  211,   37,   77,  211,  213,   80,  747,  213,   39,   39,
			  156,   39,   35,  156,   43,   43,   36,   43,  156,  746,
			   28,   35,   37,  487,   36,   35,   37,   35,  445,  445,
			   85,   85,   39,   79,  152,   37,   40,   40,   43,   40,
			   87,  715,   43,   41,   41,   39,   41,   44,   44,   35,
			   44,   92,   36,   35,   37,   35,   39,   78,   42,   42,
			   40,   42,  201,   37,   40,   45,   45,   41,   45,  206,
			   43,   44,  206,   39,   49,   49,   40,   49,   41,   77,
			   77,   77,   42,   80,   80,   39,  705,   44,  230,   45,
			  230,  230,   40,  362,   81,   45,   42,   42,   49,  201,

			  201,  362,   42,  291,   40,  214,   41,  197,   45,  693,
			   79,   79,   79,   58,   49,   44,   58,   50,   50,  684,
			   50,   58,  206,   45,   42,   42,   48,   48,   58,   48,
			   42,  241,  241,  241,  241,  241,   45,   46,   46,  291,
			   46,   50,   49,  197,  197,   47,   47,  293,   47,  662,
			   48,  407,   46,   46,   46,   46,   46,   46,   46,   56,
			  214,   46,   56,  491,   58,   48,   50,   56,   46,   47,
			   48,   81,   81,   81,   56,   46,  116,  116,   90,  116,
			   47,   90,   46,  293,   46,  407,   46,  323,   47,   55,
			   90,   56,   55,   48,  449,   50,   46,   55,   48,  193,

			  116,   90,  491,   46,   55,  200,   57,  654,   47,   57,
			   56,  203,  514,   46,   57,   46,   47,  651,  329,   56,
			  259,   57,   55,  611,   59,  259,   55,   59,   55,  469,
			   60,   90,   59,   60,   57,  449,  259,  469,   60,   59,
			   55,  200,  200,   57,   61,   60,  259,   61,  203,  203,
			   55,  514,   61,  609,   55,  329,   55,   57,   60,   61,
			  347,   59,   57,  612,  259,   62,  323,  723,   62,  325,
			   60,   57,   59,   62,  608,   59,  193,  193,  193,   61,
			   62,   60,   63,  347,   65,   63,   60,   65,  347,   59,
			   63,  607,   65,  219,  219,   61,  219,   63,   60,   65,

			  606,   59,  612,   62,   62,   64,  723,   61,   64,   62,
			   63,  194,  590,   64,   65,   66,   62,  586,   66,  219,
			   64,  503,  580,   66,   62,  335,  335,   65,  335,  503,
			   66,   62,   62,   63,  195,   65,   68,   62,   63,   68,
			   89,  561,   65,   89,   68,   64,   69,  325,  325,   69,
			   66,   68,   89,   89,   69,   65,   64,  404,   66,  336,
			  336,   69,  336,   89,  402,  404,   66,  402,  229,  229,
			  102,  229,  557,   64,  697,  697,   68,  545,   66,  102,
			  102,  102,  102,  102,  102,  545,   66,   68,  194,  194,
			  194,  702,  229,   89,  546,   69,  404,   69,  106,  106,

			  106,  106,  106,  106,   68,  109,  109,  109,  109,  109,
			  109,  195,  195,  195,  106,  102,  112,  112,  112,  112,
			  112,  112,  731,  731,   69,   93,   93,  528,   93,  652,
			  102,  520,  652,  702,  102,  196,  102,  106,  512,  111,
			  322,  111,  106,  111,  111,  111,  111,  111,  111,  111,
			  488,   93,  461,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  110,  110,  110,  110,
			  110,  110,  111,  324,  438,  652,  408,  117,  117,  113,
			  117,  113,  110,  113,  113,  113,  113,  113,  113,  364,

			  117,  117,  119,  119,  361,  119,   93,  338,  338,  117,
			  338,  117,  196,  196,  196,  119,  119,  322,  322,  322,
			  110,  748,  120,  120,  119,  120,  119,  121,  121,  748,
			  121,  207,  113,  338,  207,  120,  120,  704,  351,  482,
			  121,  121,  482,  207,  120,  337,  120,  119,  704,  121,
			  584,  121,  122,  122,  207,  122,  332,  331,  121,  120,
			  324,  324,  324,  297,  482,  122,  122,  123,  123,  554,
			  123,  288,  554,  584,  122,  119,  122,  554,  584,  704,
			  123,  123,  247,  246,  207,  122,  121,  120,  236,  123,
			  235,  123,  124,  124,  228,  124,  227,  226,  125,  125,

			  225,  125,  712,  712,  712,  124,  124,  823,  823,  823,
			  123,  125,  125,  122,  124,  223,  124,  218,  147,  209,
			  125,  204,  125,  126,  126,  202,  126,  127,  127,  199,
			  127,  187,  124,  163,  147,  147,  126,  126,  123,  157,
			  127,  127,  125,  128,  128,  126,  128,  126,  147,  127,
			  147,  127,  154,  126,  150,  137,  128,  128,  105,  126,
			  124,  104,  147,  147,  127,  128,  103,  128,  100,   98,
			  125,  129,  129,   96,  129,  130,  130,   88,  130,  147,
			  375,  126,   73,   70,  129,  129,  128,  126,  130,  130,
			   54,  375,  127,  129,   33,  129,   31,  130,   26,  130, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   24,  375,  476,   16,  131,  131,   15,  131,  132,  132,
			   14,  132,   11,  476,  128,    0,  130,  131,  131,  375,
			    0,  132,  132,  476,  133,  133,  131,  133,  131,    0,
			  132,  396,  132,    0,  131,    0,  396,  133,  133,    0,
			    0,  476,  134,  134,  130,  134,  133,  396,  133,  180,
			  180,  180,  180,  180,  180,  134,  134,  396,  135,  135,
			  720,  135,  131,  132,  134,  180,  134,    0,  720,  133,
			  159,  135,  135,  159,    0,  396,  136,  136,  159,  136,
			  135,  720,  135,  159,  159,  159,    0,  134,  135,  136,
			  136,    0,  159,  180,    0,    0,  720,  133,  136,    0,

			  136,    0,  448,    0,  448,  139,  139,  136,  139,  140,
			  140,    0,  140,  448,  326,  134,  135,    0,  139,  139,
			  139,  159,  140,  140,  140,    0,    0,  139,  146,  139,
			    0,  140,    0,  140,    0,  136,  138,  138,  138,  138,
			  140,  448,  327,    0,  146,    0,  138,    0,    0,  146,
			  139,    0,    0,  146,  140,  138,  140,    0,  146,  138,
			  146,    0,  138,  210,  683,  683,  210,  683,  140,  138,
			    0,  138,  146,  138,    0,  210,    0,  146,  328,  144,
			    0,  146,  145,  138,    0,  140,  210,  138,  683,  146,
			  138,  326,  326,  326,    0,  144,  144,    0,  145,  144,

			  138,    0,  138,  141,  141,  141,  141,  141,  141,  144,
			    0,  144,  145,  145,  145,    0,  210,  148,  141,  327,
			  327,  327,  141,  144,  144,  141,  145,  144,  149,    0,
			    0,  141,  141,  148,  141,  524,  524,  524,  524,  524,
			  144,  145,    0,  145,  149,  148,  141,  148,    0,  148,
			  141,    0,    0,  141,  250,  328,  328,  328,  149,  141,
			  149,  148,  149,  141,    0,    0,  160,    0,    0,  160,
			  250,  647,  149,  148,  160,  647,    0,    0,  148,  160,
			  160,  160,  161,    0,  250,  161,  250,    0,  160,  149,
			  161,  149,  647,    0,    0,  161,  161,  161,  250,  162,

			    0,    0,  162,  647,  161,    0,    0,  162,  721,    0,
			    0,  160,  162,  162,  162,  250,  721,  160,  279,  161,
			  648,  162,    0,  164,  648,    0,  164,    0,    0,  721,
			  162,  164,  279,  161,  279,    0,  164,  164,  164,  160,
			  165,  648,    0,  165,  721,  164,  279,  161,  165,    0,
			  162,  192,  648,  165,  165,  165,  164,  166,  162,  384,
			  166,  384,  165,  279,    0,  166,  333,  333,    0,  333,
			  166,  166,  166,  167,  164,    0,  167,    0,  333,  166,
			    0,  167,  384,  165,  164,  384,  167,  167,  167,  333,
			  168,  165,  384,  168,    0,  167,    0,  166,  168,  633,

			  633,  633,  633,  168,  168,  168,  735,    0,  166,    0,
			  384,  165,  168,  384,  735,  169,    0,  167,  169,  333,
			  168,    0,    0,  169,  167,  166,  168,  735,  169,  169,
			  169,  192,  192,  192,  192,  192,  170,  169,    0,  170,
			  537,  168,  735,    0,  170,  167,    0,  596,  168,  170,
			  170,  170,  169,    0,  168,    0,    0,  537,  170,  171,
			    0,  537,  171,    0,  596,    0,  169,  171,  596,    0,
			    0,    0,  171,  171,  171,  172,    0,    0,  172,  170,
			  169,  171,    0,  172,    0,  537,    0,  170,  172,  172,
			  172,  173,  596,    0,  173,    0,    0,  172,    0,  173,

			  635,  635,  635,  635,  173,  173,  173,  170,  481,  174,
			  171,    0,  174,  173,    0,    0,  172,  174,    0,  481,
			    0,  173,  174,  174,  174,    0,  172,  252,    0,  481,
			    0,  174,  176,  176,  176,  176,  176,  176,    0,  635,
			    0,    0,  173,  252,  172,    0,    0,  481,    0,  173,
			  224,  224,  224,  224,  224,  224,  224,  252,    0,  252,
			  174,  176,    0,    0,  174,  175,    0,    0,  175,    0,
			    0,  252,    0,  175,  789,  789,  789,  789,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  252,  176,
			  177,  177,  177,  177,  177,  177,  178,  178,  178,  178,

			  178,  178,  179,  179,  179,  179,  179,  179,    0,    0,
			  178,    0,    0,  789,  649,  551,  175,  179,  649,  177,
			  181,  181,  181,  181,  181,  181,  551,    0,  182,  182,
			  182,  182,  182,  182,    0,  649,  551,    0,  178,  183,
			  183,  183,  183,  183,  183,  179,  649,  177,  182,    0,
			  181,    0,  182,    0,  551,  183,    0,  184,  184,  184,
			  184,  184,  184,  185,  185,  185,  185,  185,  185,  232,
			  232,  232,  232,  232,  232,    0,  182,    0,  181,  264,
			  182,    0,    0,  183,  184,  232,  234,  234,  234,  234,
			  234,  234,  233,    0,  233,  264,  185,  233,  233,  233,

			  233,  233,  233,  753,  753,  753,  753,  753,  232,  264,
			    0,  264,  184,  232,  237,  237,  237,  237,  237,  237,
			    0,    0,    0,  264,    0,  185,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  264,    0,  212,  238,  238,  238,  238,  238,  238,  212,
			  212,  212,  212,  212,  212,  239,    0,  239,    0,  238,
			  239,  239,  239,  239,  239,  239,  242,  242,  242,  242,
			  242,  242,  268,  268,  268,  268,  268,  268,  212,  212,
			  212,  212,  238,    0,  240,    0,  240,  238,  240,  240,
			  240,  240,  240,  240,  269,  269,  269,  269,  269,  269,

			  271,  271,  271,  271,  271,  271,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  215,  215,    0,
			  215,  272,  272,  272,  272,  272,  272,  240,    0,  271,
			  273,  273,  273,  273,  273,  273,  274,  274,  274,  274,
			  274,  274,    0,  215,    0,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  552,  248,
			    0,    0,  249,    0,  650,  251,    0,    0,  650,    0,
			  253,  742,  552,  742,    0,  248,  248,    0,  249,    0,
			  679,  251,  742,  552,  679,  650,  253,  249,  215,  248,

			  251,  248,  249,  552,  249,  251,  650,  251,    0,  253,
			  253,  679,  253,  248,  248,  254,  249,    0,  255,  251,
			  742,  552,  679,  256,  253,  249,    0,    0,  251,    0,
			  248,  254,  254,  249,  255,    0,  251,  253,    0,  256,
			  255,  253,  257,    0,    0,  254,    0,  254,  255,    0,
			  255,    0,  256,  256,    0,  256,    0,  258,  257,  254,
			  254,  260,  255,    0,  602,    0,  261,  256,  255,    0,
			    0,  257,  257,  258,  257,    0,  254,  260,    0,  255,
			  256,  602,  261,  260,  256,  602,  257,  258,  261,  258,
			    0,  260,    0,  260,    0,    0,  261,  258,  261,  257, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  258,    0,  257,  262,  260,    0,    0,  263,  602,
			  261,  260,  265,    0,    0,  266,  261,    0,  258,  773,
			  262,  773,  260,  263,  263,  262,    0,  261,  265,  680,
			  773,  266,  266,  680,  262,    0,  262,    0,  263,    0,
			  263,    0,  265,  265,  265,  266,  643,  266,  262,  782,
			  680,  263,  263,  262,    0,    0,  265,    0,  773,  266,
			  266,  680,    0,  643,    0,  262,  782,  643,    0,  263,
			  782,  265,  276,  265,  276,  276,  266,  270,  270,  270,
			  270,  270,  270,  270,  275,  275,  275,  275,  275,  275,
			    0,  643,  278,  270,  782,  276,    0,    0,  276,  779,

			  779,  779,  779,  779,  276,  278,  278,  270,  278,  270,
			  277,  277,  277,  277,  277,  277,    0,    0,  280,  282,
			  278,  270,    0,  276,  281,    0,  276,    0,  283,  277,
			  807,  281,  276,  278,  280,  282,  282,  278,  270,    0,
			  281,    0,  280,  284,  283,  807,  807,  807,  280,  282,
			  280,  282,    0,  553,  281,  283,  281,  277,  283,  284,
			  283,  285,  280,  282,  282,  286,  287,  553,  281,    0,
			  280,  284,  283,  284,    0,  284,    0,  285,  553,  280,
			  282,  286,  287,  283,    0,  281,    0,  284,  553,  283,
			    0,  285,    0,  285,    0,  286,  287,  286,  287,  284,

			  287,  285,    0,    0,  284,  285,  553,  783,    0,  286,
			  287,  289,    0,  289,  289,  289,  289,  289,  289,  289,
			    0,    0,  285,    0,  783,    0,  286,  287,  783,  287,
			  290,  290,  290,  290,  290,  290,  290,  294,  294,  294,
			  294,  294,  294,  295,  295,  295,  295,  295,  295,    0,
			    0,    0,  783,  294,  296,  296,  296,  296,  296,  296,
			  298,  298,  298,  298,  298,  298,  365,  295,  299,  299,
			  299,  299,  299,  299,  300,  300,  300,  300,  300,  300,
			    0,  294,  365,  299,  298,  301,  301,  301,  301,  301,
			  301,    0,    0,    0,  365,  295,  365,    0,  365,    0,

			    0,  301,  300,  302,  302,  302,  302,  302,  302,    0,
			  365,  299,  298,  303,  303,  303,  303,  303,  303,  681,
			    0,    0,  365,  681,  302,    0,    0,  365,  759,  301,
			  300,  304,  304,  304,  304,  304,  304,    0,    0,  759,
			  681,  303,  305,  305,  305,  305,  305,  305,    0,  759,
			    0,  681,  302,  306,  306,  306,  306,  306,  306,  304,
			    0,  307,  307,  307,  307,  307,  307,  759,    0,  303,
			    0,    0,    0,    0,  306,  308,  308,  308,  308,  308,
			  308,  305,  307,    0,    0,    0,  309,  304,  309,  309,
			  309,  309,  309,  309,    0,  308,  312,  312,  312,  312,

			  312,  312,  306,  311,  311,  311,  311,  311,  311,    0,
			  307,  313,  313,  313,  313,  313,  313,  311,    0,    0,
			    0,  786,    0,  308,  314,  314,  314,  314,  314,  314,
			  315,  315,  315,  315,  315,  315,    0,    0,  786,    0,
			  314,  313,  786,    0,  787,  311,  316,  316,  316,  316,
			  316,  316,    0,  315,  317,  317,  317,  317,  317,  317,
			    0,  787,  316,    0,    0,  787,  786,  760,  314,  313,
			  318,  318,  318,  318,  318,  318,    0,    0,  760,    0,
			  317,  315,  319,  319,  319,  319,  319,  319,  760,  787,
			  316,  320,  320,  320,  320,  320,  320,  318,  321,  321,

			  321,  321,  321,  321,    0,    0,  760,    0,  317,  341,
			  341,  341,  341,  341,  341,  341,    0,    0,    0,    0,
			    0,  319,    0,    0,    0,  318,    0,    0,    0,    0,
			    0,  321,  348,  348,  348,  348,  348,  348,  349,  349,
			  349,  349,  349,  349,  350,  350,  350,  350,  350,  350,
			  352,  352,  352,  352,  352,  352,    0,    0,    0,    0,
			  321,    0,  353,  353,  353,  353,  353,  353,  355,  355,
			  355,  355,  355,  355,  354,    0,  354,  349,  353,  354,
			  354,  354,  354,  354,  354,  356,  356,  356,  356,  356,
			  356,  357,  357,  357,  357,  357,  357,    0,    0,    0,

			    0,  353,    0,    0,  358,  358,  353,  358,  358,  358,
			  358,  358,  358,  359,  359,  359,  359,  359,  359,  360,
			  360,  360,  360,  360,  360,  366,  367,    0,    0,  368,
			  357,    0,  369,    0,    0,  370,    0,    0,    0,  682,
			    0,  366,  367,  682,    0,  368,    0,    0,  369,  369,
			  368,  370,    0,    0,  367,  366,  367,  366,  367,  368,
			  682,  368,  369,    0,  369,  370,    0,  370,  371,  366,
			  367,  682,  372,  368,    0,  373,  369,  369,  368,  370,
			    0,  374,  367,    0,  371,    0,  366,  367,  372,    0,
			  368,  373,  373,  369,  374,    0,  370,  374,  371,  371,

			  371,    0,  372,    0,  372,  373,    0,  373,  378,    0,
			    0,  374,  371,  374,    0,  377,  372,    0,  376,  373,
			  373,  380,  374,    0,  378,  374,    0,  371,    0,  371,
			  372,  377,  378,  372,  376,    0,  373,  380,  378,  376,
			  378,  379,  374,    0,    0,  377,  377,  377,  376,  380,
			  376,  380,  378,  380,    0,    0,  381,  379,    0,  377,
			  378,  379,  376,    0,    0,  380,    0,  376,    0,  378,
			    0,  379,  381,  379,  377,    0,  377,  380,    0,  376,
			    0,    0,  380,  394,  381,  379,  381,    0,  381,  379,
			  382,  382,  382,  382,  382,  382,    0,    0,    0,  394,

			  381,  383,  379,  383,  383,  383,  383,  383,  383,  383,
			    0,    0,  381,  394,    0,  394,    0,  381,  382,  385,
			  385,  385,  385,  385,  385,    0,    0,  394,  386,    0,
			  386,  383,  386,  386,  386,  386,  386,  386,  387,  387,
			  387,  387,  387,  387,  394,    0,  382,    0,  385,  736,
			    0,    0,    0,    0,  386,  722,    0,  736,    0,  383,
			  387,  386,  388,  388,  388,  388,  388,  388,  722,    0,
			  736,  387,    0,    0,    0,    0,  722,  388,    0,    0,
			    0,    0,  386,    0,    0,  736,    0,    0,  387,  722,
			    0,  388,  389,  389,  389,  389,  389,  389,    0,    0,

			  387,    0,    0,    0,  722,  388,  390,  390,  390,  390,
			  390,  390,  391,  391,  391,  391,  391,  391,  392,  392,
			  392,  392,  392,  392,    0,  389,  393,  393,  393,  393,
			  393,  393,  395,  397,    0,    0,  398,    0,    0,  769,
			  399,  401,    0,  401,    0,    0,    0,  392,  395,  397,
			  769,    0,  398,    0,  389,  393,  399,    0,  400,  401,
			  769,    0,  395,  397,  395,  397,  398,  398,  398,    0,
			  399,  400,  399,  401,  400,  401,  395,  397,  769,    0,
			  398,    0,  400,    0,  399,    0,    0,  401,  400,    0,
			  400,    0,    0,  395,  397,  398,    0,  398,    0,  400, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  399,  400,    0,  401,    0,    0,    0,    0,  403,
			  400,  403,  403,  403,  403,  403,  403,  403,  405,  400,
			  405,  405,  405,  405,  405,  405,  405,  406,    0,  406,
			  406,  406,  406,  406,  406,  406,  409,  409,  409,  409,
			  409,  409,  410,  410,  410,  410,  410,  410,  403,  411,
			  411,  411,  411,  411,  411,    0,    0,  405,    0,    0,
			    0,    0,    0,  409,    0,    0,  406,  412,  412,  412,
			  412,  412,  412,  410,    0,  413,  413,  413,  413,  413,
			  413,  414,  414,  414,  414,  414,  414,    0,    0,    0,
			    0,  409,    0,    0,  412,  413,    0,  414,    0,    0,

			    0,    0,  410,  415,  415,  415,  415,  415,  415,  416,
			  416,  416,  416,  416,  416,  417,  417,  417,  417,  417,
			  417,    0,  412,  413,    0,  414,  418,  418,  418,  418,
			  418,  418,    0,  419,  419,  419,  419,  419,  419,  416,
			    0,    0,  418,    0,  417,  419,  420,  420,  420,  420,
			  420,  420,  421,  421,  421,  421,  421,  421,  422,  422,
			  422,  422,  422,  422,    0,    0,  420,  416,    0,    0,
			  418,    0,  417,  419,  423,  423,  423,  423,  423,  423,
			  770,  422,  421,  424,  424,  424,  424,  424,  424,    0,
			    0,  770,    0,    0,  420,  425,  425,  425,  425,  425,

			  425,  770,  424,  427,  427,  427,  427,  427,  427,  422,
			  421,  426,  426,  426,  426,  426,  426,    0,    0,  770,
			    0,    0,  425,  428,  428,  428,  428,  428,  428,    0,
			  424,  429,  429,  429,  429,  429,  429,    0,  426,  430,
			  430,  430,  430,  430,  430,    0,    0,    0,    0,    0,
			  425,    0,    0,    0,  430,  431,  431,  431,  431,  431,
			  431,  429,    0,    0,    0,  432,  426,  431,  432,  432,
			  432,  432,  432,  432,    0,    0,    0,    0,  431,    0,
			    0,    0,  430,  434,  434,  434,  434,  434,  434,  429,
			    0,    0,    0,    0,    0,  431,  435,  435,  435,  435,

			  435,  435,    0,    0,    0,    0,  431,  436,  436,  436,
			  436,  436,  436,  437,  437,  437,  437,  437,  437,    0,
			    0,    0,  434,  439,  439,  439,  439,  439,  439,  440,
			  440,  440,  440,  440,  440,    0,    0,    0,    0,  439,
			  441,  441,  441,  441,  441,  441,  442,  442,  442,  442,
			  442,  442,  443,  443,  443,  443,  443,  443,    0,    0,
			    0,    0,  439,    0,    0,    0,    0,  439,  444,  444,
			  444,  444,  444,  444,    0,    0,    0,    0,    0,  441,
			  446,  446,  446,  446,  446,  446,  452,  453,    0,    0,
			  447,  443,  447,  447,  447,  447,  447,  447,    0,    0,

			    0,    0,  452,  453,    0,  454,    0,    0,  455,  456,
			    0,    0,  457,    0,    0,    0,  452,  453,  452,  453,
			    0,  454,  454,    0,  455,  456,    0,  453,  457,    0,
			  452,  453,  455,    0,    0,  454,    0,  454,  455,  456,
			  455,  456,  457,    0,  457,  458,    0,  452,  453,  454,
			  454,  459,  455,  456,    0,  462,  457,    0,    0,    0,
			  455,  458,  458,    0,  460,    0,  454,  459,    0,  455,
			  456,  462,  462,  457,  458,  458,    0,  458,    0,    0,
			  460,  459,    0,  459,    0,  462,  460,  462,  463,  458,
			  458,  464,    0,    0,  460,  459,  460,    0,    0,  462,

			  462,  466,  458,    0,  463,    0,  458,  464,  460,  737,
			  465,    0,  459,    0,  460,    0,  462,  466,  463,    0,
			  463,  464,  737,  464,    0,  460,  465,  465,    0,  466,
			  737,  466,  463,  466,  467,  464,    0,    0,    0,    0,
			  465,    0,  465,  737,    0,  466,    0,    0,    0,  463,
			  467,  467,  464,    0,  465,  465,    0,  466,  737,    0,
			    0,    0,  466,    0,  467,    0,  467,    0,    0,    0,
			    0,  465,  470,  470,  470,  470,  470,  470,  467,  467,
			  471,  471,  471,  471,  471,  471,  472,  472,  472,  472,
			  472,  472,    0,    0,    0,  467,    0,    0,    0,    0,

			  473,  470,  473,  473,  473,  473,  473,  473,  473,    0,
			    0,  474,    0,  474,  472,  474,  474,  474,  474,  474,
			  474,    0,  477,  475,  475,  475,  475,  475,  475,    0,
			  473,  478,    0,    0,    0,    0,    0,  474,  477,  477,
			  479,    0,  472,  474,  474,  475,    0,  478,  478,    0,
			    0,    0,  477,    0,  477,    0,  479,    0,  473,    0,
			    0,  478,    0,  478,    0,  474,  477,  477,  479,    0,
			  479,  474,  479,  475,  480,  478,  478,  489,  489,  489,
			  489,  489,  489,  477,  479,    0,    0,    0,    0,    0,
			  480,    0,  478,    0,    0,    0,  479,    0,    0,  480,

			    0,  479,    0,    0,  480,    0,  480,  483,  483,  483,
			  483,  483,  483,  483,    0,    0,    0,    0,  480,  485,
			  485,  485,  485,  485,  485,  485,    0,  480,  490,  490,
			  490,  490,  490,  490,  492,  480,  492,  492,  492,  492,
			  492,  492,  493,  493,  493,  493,  493,  493,  494,  494,
			  494,  494,  494,  494,    0,    0,    0,    0,  493,  495,
			  495,  495,  495,  495,  495,    0,    0,  490,    0,    0,
			    0,  494,    0,  492,  495,  496,  496,  496,  496,  496,
			  496,    0,    0,    0,    0,    0,  493,    0,    0,    0,
			  496,  497,  497,  497,  497,  497,  497,    0,    0,  494,

			    0,    0,  495,    0,    0,    0,    0,  497,  498,  498,
			  498,  498,  498,  498,    0,    0,    0,    0,  496,  497,
			  499,  499,  499,  499,  499,  499,  500,  500,  500,  500,
			  500,  500,    0,    0,    0,  497,    0,    0,    0,    0,
			    0,  499,  500,    0,    0,    0,    0,  497,  501,  501,
			  501,  501,  501,  501,  502,  502,  502,  502,  502,  502,
			    0,    0,    0,  501,    0,    0,    0,    0,    0,  499,
			  500,  504,    0,  504,  504,  504,  504,  504,  504,  504,
			  505,  505,  505,  505,  505,  505,    0,    0,    0,    0,
			    0,  501,    0,    0,    0,    0,  505,    0,  506,  506,

			  506,  506,  506,  506,  507,  507,  507,  507,  507,  507,
			  508,  508,  508,  508,  508,  508,    0,    0,    0,    0,
			  507,    0,    0,    0,  505,  506,  508,  509,  509,  509,
			  509,  509,  509,  510,  510,  510,  510,  510,  510,    0,
			    0,    0,    0,  509,    0,    0,    0,    0,  507,    0,
			    0,    0,    0,  506,  508,    0,    0,    0,    0,    0,
			  510,  511,  511,  511,  511,  511,  511,    0,    0,    0,
			    0,  509,  513,  513,  513,  513,  513,  513,    0,  516,
			  516,  516,  516,  516,  516,  511,    0,  515,  510,  515,
			  515,  515,  515,  515,  515,  516,  517,  517,  517,  517, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  517,  517,  518,  518,  518,  518,  518,  518,    0,    0,
			    0,    0,    0,  511,  519,  519,  519,  519,  519,  519,
			    0,    0,    0,  516,    0,    0,  515,  521,  521,  521,
			  521,  521,  521,    0,    0,  517,  522,  522,  522,  522,
			  522,  522,  523,  523,  523,  523,  523,  523,  526,  526,
			  526,  526,  526,  526,  529,  530,    0,    0,  532,  531,
			    0,    0,    0,    0,  526,    0,    0,  529,    0,    0,
			  529,  530,  531,    0,  532,  531,    0,  533,    0,    0,
			  534,  535,    0,    0,  529,  530,  529,  530,  532,  531,
			  532,  531,  526,  533,  533,  529,  534,  535,  529,  530,

			  531,  536,  532,  531,  534,    0,    0,  533,    0,  533,
			  534,  535,  534,  535,  538,  529,  530,  536,    0,  532,
			  531,  533,  533,  536,  534,  535,    0,    0,    0,    0,
			  538,  536,  534,  536,    0,    0,  539,    0,  533,    0,
			  541,  534,  535,  538,  538,  536,  538,  540,    0,    0,
			    0,  536,  539,  539,    0,    0,  541,  541,  538,    0,
			    0,    0,  536,  540,    0,    0,  539,    0,  539,    0,
			  541,  538,  541,  542,    0,  538,  540,  540,    0,  540,
			  539,  539,    0,    0,  541,  541,    0,    0,    0,  542,
			    0,  540,    0,    0,  547,    0,    0,  539,    0,    0,

			    0,  541,    0,  542,  540,  542,    0,  543,  540,  543,
			  547,  543,  543,  543,  543,  543,  543,  542,    0,  548,
			  550,    0,    0,    0,  547,    0,  547,  549,  558,  558,
			  558,  558,  558,  558,  542,  548,  550,    0,  547,    0,
			  543,    0,  549,  549,    0,    0,    0,  548,    0,  548,
			  550,  548,  550,    0,    0,  547,    0,  549,    0,  549,
			    0,    0,    0,  548,  550,    0,    0,    0,    0,    0,
			  549,  549,    0,    0,    0,  548,    0,    0,    0,    0,
			  548,  550,    0,    0,    0,    0,    0,  555,  549,  555,
			  555,  555,  555,  555,  555,  555,  556,    0,  556,  556,

			  556,  556,  556,  556,  556,  559,  559,  559,  559,  559,
			  559,  560,  560,  560,  560,  560,  560,  559,  562,  562,
			  562,  562,  562,  562,    0,    0,  555,  563,  563,  563,
			  563,  563,  563,    0,    0,  556,    0,    0,    0,  563,
			    0,    0,    0,    0,    0,  559,  564,  564,  564,  564,
			  564,  564,  565,  565,  565,  565,  565,  565,  566,  566,
			  566,  566,  566,  566,    0,    0,    0,  563,  565,  567,
			  567,  567,  567,  567,  567,  574,  574,  574,  574,  574,
			  574,  566,  568,  568,  568,  568,  568,  568,  569,  569,
			  569,  569,  569,  569,    0,    0,  565,  570,  570,  570,

			  570,  570,  570,  568,    0,    0,    0,    0,    0,  566,
			    0,    0,    0,  570,    0,    0,  569,  571,  571,  571,
			  571,  571,  571,  572,  572,  572,  572,  572,  572,    0,
			    0,  568,  573,  573,  573,  573,  573,  573,    0,  572,
			    0,  570,    0,    0,  569,  571,    0,  573,    0,  575,
			  575,  575,  575,  575,  575,  576,  576,  576,  576,  576,
			  576,  578,  578,  578,  578,  578,  578,  572,    0,  576,
			    0,    0,    0,  571,    0,  573,  575,  577,  577,  577,
			  577,  577,  577,  579,  579,  579,  579,  579,  579,    0,
			    0,    0,  577,  581,    0,  581,    0,  576,  581,  581,

			  581,  581,  581,  581,  575,  582,  582,  582,  582,  582,
			  582,  583,  583,  583,  583,  583,  583,    0,    0,    0,
			  577,  585,  585,  585,  585,  585,  585,  587,  587,  587,
			  587,  587,  587,  588,  588,  588,  588,  588,  588,  591,
			    0,    0,  592,  593,  582,  589,  589,  589,  589,  589,
			  589,    0,    0,    0,    0,  591,    0,    0,  592,  593,
			    0,  589,    0,    0,  592,    0,  594,  591,    0,  591,
			    0,  591,  592,  593,  592,  593,    0,    0,    0,    0,
			    0,  594,  594,  591,  589,  595,  592,  593,    0,  589,
			  597,  598,  592,    0,    0,  591,  594,    0,  594,    0,

			  591,  595,    0,  592,  593,    0,  597,  598,    0,  594,
			  594,    0,  599,    0,    0,  595,    0,  595,    0,    0,
			  597,  598,  597,  598,    0,  600,    0,  594,  599,  595,
			    0,  601,  639,    0,  597,  598,    0,    0,    0,    0,
			    0,  600,  599,    0,  599,    0,  595,  601,  639,  600,
			  603,  597,  598,  639,    0,  600,  599,  600,  604,    0,
			    0,  601,  639,  601,  639,    0,  603,  603,  605,  600,
			    0,    0,    0,  599,  604,  601,  639,  600,  604,    0,
			  603,  639,  603,    0,  605,  605,  600,    0,  604,    0,
			  604,    0,  601,  639,  603,  603,    0,    0,  605,    0,

			  605,    0,  604,    0,    0,    0,  604,    0,    0,    0,
			    0,  603,  605,  605,    0,    0,    0,    0,  613,  604,
			  613,  613,  613,  613,  613,  613,    0,    0,    0,  605,
			    0,  614,  614,  614,  614,  614,  614,  615,    0,  615,
			  615,  615,  615,  615,  615,  616,  616,  616,  616,  616,
			  616,  617,  617,  617,  617,  617,  617,  613,  614,  618,
			  618,  618,  618,  618,  618,    0,  616,  619,  619,  619,
			  619,  619,  619,  618,    0,    0,  615,  620,  620,  620,
			  620,  620,  620,    0,    0,    0,  614,  621,  621,  621,
			  621,  621,  621,    0,  616,  622,  622,  622,  622,  622,

			  622,  618,  623,  623,  623,  623,  623,  623,  624,  624,
			  624,  624,  624,  624,  625,  625,  625,  625,  625,  625,
			    0,    0,    0,    0,    0,  623,    0,    0,    0,    0,
			  625,  626,  626,  626,  626,  626,  626,    0,  627,  627,
			  627,  627,  627,  627,  629,  629,  629,  629,  629,  629,
			  626,    0,    0,  623,  627,    0,    0,  628,  625,  628,
			  628,  628,  628,  628,  628,  630,  630,  630,  630,  630,
			  630,  631,  631,  631,  631,  631,  631,    0,  626,  632,
			    0,  632,  627,    0,  632,  632,  632,  632,  632,  632,
			  634,  634,  634,  634,  634,  634,  628,  636,  636,  636,

			  636,  636,  636,  638,    0,    0,    0,  640,    0,    0,
			  642,    0,    0,  636,    0,    0,    0,    0,  638,  638,
			    0,    0,    0,  640,  640,  642,  642,    0,  644,  646,
			    0,    0,    0,  638,    0,  638,  636,  640,    0,  640,
			  642,  636,  642,    0,  644,  646,  638,  638,    0,  645,
			    0,  640,  640,  642,  642,    0,    0,    0,  644,  646,
			  644,  646,    0,    0,  638,  645,  645,    0,  640,    0,
			    0,  642,  644,  646,    0,    0,    0,    0,    0,  645,
			    0,  645,  653,  653,  653,  653,  653,  653,    0,  644,
			  646,    0,  673,  645,  645,  655,  655,  655,  655,  655, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  655,  656,  656,  656,  656,  656,  656,    0,  673,  655,
			  645,  657,  657,  657,  657,  657,  657,    0,    0,    0,
			    0,  656,  673,    0,  673,    0,    0,  657,  658,  658,
			  658,  658,  658,  658,    0,    0,  673,  655,    0,    0,
			    0,  674,  658,  659,  659,  659,  659,  659,  659,  656,
			  673,    0,    0,  673,    0,  657,    0,  674,  659,  660,
			  660,  660,  660,  660,  660,    0,    0,    0,    0,    0,
			  658,  674,    0,  674,    0,  660,  661,  661,  661,  661,
			  661,  661,    0,    0,    0,  674,  659,  663,  663,  663,
			  663,  663,  663,  664,  664,  664,  664,  664,  664,    0,

			    0,    0,  674,  660,  665,  665,  665,  665,  665,  665,
			  666,  666,  666,  666,  666,  666,  667,  667,  667,  667,
			  667,  667,  668,  668,  668,  668,  668,  668,    0,    0,
			  672,  675,  664,  670,  670,  670,  670,  670,  670,  677,
			  686,  686,  686,  686,  686,  686,  672,  675,  675,  670,
			  672,    0,  678,    0,    0,  677,    0,    0,    0,  686,
			  672,  675,  672,  675,    0,    0,    0,    0,  678,  677,
			    0,  677,  670,    0,  672,  675,  675,  670,  672,    0,
			    0,    0,  678,  677,  678,    0,    0,  686,    0,    0,
			    0,  672,  675,    0,    0,    0,  678,    0,    0,  685,

			  677,  685,  685,  685,  685,  685,  685,    0,    0,    0,
			  678,    0,    0,  678,  687,  687,  687,  687,  687,  687,
			  688,  688,  688,  688,  688,  688,  689,  689,  689,  689,
			  689,  689,  690,  690,  690,  690,  690,  690,  685,    0,
			    0,    0,  689,  687,  691,  691,  691,  691,  691,  691,
			  692,  692,  692,  692,  692,  692,  694,  694,  694,  694,
			  694,  694,  696,  696,  696,  696,  696,  696,  698,    0,
			  689,  687,  695,  691,  695,  699,  701,  695,  695,  695,
			  695,  695,  695,    0,  698,  698,  700,    0,    0,  692,
			    0,  699,  701,    0,    0,    0,    0,    0,  698,    0,

			  698,  691,  700,    0,    0,  699,  701,  699,  701,  699,
			  701,  695,  698,  698,    0,  700,  700,    0,  700,  699,
			  701,  707,  707,  707,  707,  707,  707,    0,    0,  698,
			  700,    0,    0,    0,    0,    0,  699,  701,  699,  701,
			    0,    0,    0,  700,    0,    0,    0,  700,  708,  708,
			  708,  708,  708,  708,  709,  709,  709,  709,  709,  709,
			    0,    0,    0,    0,  708,  710,  710,  710,  710,  710,
			  710,  711,  711,  711,  711,  711,  711,  713,  713,  713,
			  713,  713,  713,  716,    0,    0,    0,  709,    0,    0,
			  717,    0,  708,  710,  718,    0,    0,    0,    0,  716,

			    0,    0,    0,    0,  711,    0,  717,    0,    0,    0,
			  718,    0,    0,  716,    0,  716,  709,    0,    0,    0,
			  717,  710,  717,    0,  718,    0,  718,  716,    0,    0,
			  719,    0,    0,  711,  717,    0,    0,    0,  718,    0,
			    0,  716,    0,    0,  716,    0,  719,    0,    0,    0,
			    0,  717,    0,    0,    0,  718,  719,    0,    0,    0,
			  719,  724,  719,  724,  724,  724,  724,  724,  724,    0,
			    0,    0,    0,    0,  719,  725,  725,  725,  725,  725,
			  725,    0,    0,    0,  719,  726,  726,  726,  726,  726,
			  726,  719,  727,  727,  727,  727,  727,  727,    0,    0,

			  724,    0,    0,    0,  725,  728,  728,  728,  728,  728,
			  728,  729,  729,  729,  729,  729,  729,  730,  730,  730,
			  730,  730,  730,  732,  732,  732,  732,  732,  732,  733,
			  728,    0,  725,    0,  734,  738,  738,  738,  738,  738,
			  738,    0,    0,    0,  745,  733,    0,    0,    0,    0,
			  734,  734,  740,  740,  740,  740,  740,  740,  728,  733,
			  745,  733,    0,  733,  734,    0,  734,  741,  741,  741,
			  741,  741,  741,  733,  745,    0,  745,    0,  734,  734,
			    0,    0,    0,  741,    0,  740,  744,    0,  745,    0,
			  733,  743,  733,  743,  743,  734,  743,  743,  743,  743,

			  743,  743,  744,    0,    0,  745,    0,    0,    0,    0,
			    0,  741,  744,    0,  740,    0,  744,  749,  744,  749,
			  749,  749,  749,  749,  749,    0,    0,    0,    0,    0,
			  744,    0,  750,  750,  750,  750,  750,  750,    0,    0,
			  744,  751,  751,  751,  751,  751,  751,  744,  752,  752,
			  752,  752,  752,  752,  758,    0,  749,  750,  755,  755,
			  755,  755,  755,  755,  757,  757,  757,  757,  757,  757,
			  758,  758,    0,  761,  761,  761,  761,  761,  761,    0,
			    0,    0,    0,    0,  758,  750,  758,    0,    0,  761,
			  762,  762,  762,  762,  762,  762,    0,    0,  758,  758,

			  763,  763,  763,  763,  763,  763,  764,  764,  764,  764,
			  764,  764,  768,    0,    0,  758,  755,  761,  765,  765,
			  765,  765,  765,  765,  767,    0,  767,  767,  768,  767,
			  767,  767,  767,  767,  767,  771,  771,  771,  771,  771,
			  771,    0,  768,    0,  768,  772,  772,  772,  772,  772,
			  772,    0,    0,    0,    0,    0,  768,  774,  774,  774,
			  774,  774,  774,  777,  777,  777,  777,  777,  777,    0,
			    0,    0,    0,  768,  778,  778,  778,  778,  778,  778,
			  781,    0,  781,    0,    0,  781,  781,  781,  781,  781,
			  781,  784,  784,  784,  784,  784,  784,  785,  785,  785,

			  785,  785,  785,  788,  788,  788,  788,  788,  788,  792,
			  792,  792,  792,  792,  792,  793,  793,  793,  793,  793,
			  793,  794,  794,  794,  794,  794,  794,  796,  796,  796,
			  796,  796,  796,  797,    0,  797,    0,    0,  797,  797,
			  797,  797,  797,  797,  798,  798,  798,  798,  798,  798,
			  799,  799,  799,  799,  799,  799,  806,  806,  806,  806,
			  806,  806,  806,  836,  836,  836,  836,  836,  836,  836,
			    0,    0,  797,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,

			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  804,  804,    0,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,    0,  804,  804,  804,  804,
			  804,  805,  805,    0,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  805,  805,  805,  805,  805,  805,  805,  805,  808,  808,
			  808,    0,    0,    0,    0,    0,  808,  808,  808,    0,
			  808,  808,  808,  808,  808,  808,  808,    0,    0,    0,
			  808,  808,  808,  809,  809,    0,  809,    0,  809,  809,
			    0,    0,  809,  809,  809,  809,  809,  809,  809,    0,
			    0,    0,  809,  809,  809,  810,  810,    0,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  811,    0,  811,  811,    0,    0,    0,  811,
			  811,  811,    0,    0,  811,  811,  811,  811,  811,  811,

			  811,  811,    0,    0,  811,  811,  811,  812,  812,    0,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,    0,  812,
			  812,  812,  812,  812,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  815,    0,
			  815,    0,    0,    0,  815,    0,  815,  815,    0,    0,

			  815,  815,  815,  815,  815,  815,  815,    0,    0,  815,
			  815,  815,  815,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  818,  818,    0,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  819,    0,    0,    0,  819,  819,

			    0,    0,  819,  819,  819,  819,  819,  819,  819,    0,
			    0,    0,  819,  819,  819,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  821,  821,  821,    0,    0,  821,  821,  821,
			  821,  821,  821,  821,  821,    0,    0,  821,  821,  821,
			  822,    0,    0,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,    0,    0,    0,  822,  822,  822,
			  824,  824,  824,  824,  824,  824,  824,  824,    0,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,

			  824,  824,  824,  824,  824,  824,  824,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  827,  827,  827,    0,    0,    0,    0,    0,    0,
			    0,    0,  827,  827,  827,  827,  827,  827,  827,  827,
			    0,    0,    0,  828,  828,    0,  827,  828,  828,  828,
			  828,  828,  828,  828,    0,    0,    0,  828,  828,  828,

			  829,  829,    0,    0,  829,  829,  829,  829,  829,  829,
			  829,    0,    0,    0,  829,  829,  829,  830,  830,  830,
			    0,    0,  830,  830,  830,  830,  830,  830,  830,  830,
			    0,    0,  830,  830,  830,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  832,  832,  832,  832,  832,  832,  832,    0,
			    0,    0,  832,  832,  832,  833,  833,  833,  833,  833,
			  833,  833,    0,    0,    0,  833,  833,  833,  834,  834,
			    0,    0,  834,  834,  834,  834,  834,  834,  834,    0,

			    0,    0,  834,  834,  834,  835,  835,    0,    0,  835,
			  835,  835,  835,  835,  835,  835,    0,    0,    0,  835,
			  835,  835,  837,  837,  837,  837,  837,  837,  837,    0,
			    0,  838,  837,  837,  837,  838,  838,    0,    0,  838,
			  838,  838,  838,  838,  838,  838,    0,    0,    0,  838,
			  838,  838,  839,  839,    0,    0,  839,  839,  839,  839,
			  839,  839,  839,    0,    0,    0,  839,  839,  839,  840,
			  840,    0,    0,  840,  840,  840,  840,  840,  840,  840,
			    0,    0,    0,  840,  840,  840,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800, yy_Dummy>>,
			1, 778, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,  185,    0,   66,
			   70, 1012, 6686,   98, 1007,  979,  996, 6686,   90,    0,
			 6686, 6686, 6686, 6686,  985,   88,  981,   98,  263, 6686,
			 6686,  969, 6686,  967, 6686,  286,  290,  296,  120,  306,
			  334,  341,  356,  312,  345,  363,  435,  443,  424,  372,
			  415,   68, 6686, 6686,  934,  487,  457,  504,  411,  522,
			  528,  542,  563,  580,  603,  582,  613,   96,  634,  644,
			  966, 6686, 6686,  975,  136, 6686,   98,  295,  271,  326,
			  298,  387,  107, 6686,   96,  277, 6686,  285,  974,  638,
			  476, 6686,  268,  723, 6686,  154,  970, 6686,  962, 6686,

			  959,    0,  661,  955,  958,  942,  680, 6686,  110,  687,
			  758,  725,  698,  775, 6686, 6686,  474,  785,    0,  800,
			  820,  825,  850,  865,  890,  896,  921,  925,  941,  969,
			  973, 1002, 1006, 1022, 1040, 1056, 1074,  872, 1122, 1103,
			 1107, 1185,   84,   99, 1162, 1165, 1111,  901, 1200, 1211,
			  930,   91,  273,  104,  896, 6686,  308,  928,    0, 1068,
			 1264, 1280, 1297,  867, 1321, 1338, 1355, 1371, 1388, 1413,
			 1434, 1457, 1473, 1489, 1507, 1563, 1514, 1572, 1578, 1584,
			 1031, 1602, 1610, 1621, 1639, 1645, 6686,  924, 6686,  167,
			 6686, 6686, 1344,  492,  604,  627,  728,  390, 6686,  875,

			  488,  345,  870,  494,  867, 6686,  367,  829, 6686,  916,
			 1161,  298, 1725,  302,  377, 1815, 6686, 6686,  889,  591,
			 6686, 6686, 6686,  906, 1533,  891,  888,  887,  885,  666,
			  386, 6686, 1651, 1679, 1668,  873,  822, 1696, 1725, 1742,
			 1770,  413, 1748, 6686,    0,    0,  859,  854, 1852, 1855,
			 1237, 1858, 1510, 1863, 1898, 1901, 1906, 1925, 1940,  496,
			 1944, 1949, 1987, 1991, 1662, 1995, 1998, 6686, 1754, 1776,
			 2060, 1782, 1803, 1812, 1818, 2066, 2058, 2092, 2059, 1285,
			 2101, 2107, 2102, 2111, 2126, 2144, 2148, 2149,  847, 2195,
			 2212,  379, 6686,  430, 2219, 2225, 2236,  802, 2242, 2250,

			 2256, 2267, 2285, 2295, 2313, 2324, 2335, 2343, 2357, 2370,
			  129, 2385, 2378, 2393, 2406, 2412, 2428, 2436, 2452, 2464,
			 2473, 2480,  733,  480,  776,  562, 1107, 1135, 1171,  501,
			 6686,  802,  853, 1364, 6686,  623,  657,  842,  805, 6686,
			 6686, 2492, 6686, 6686, 6686, 6686, 6686,  526, 2514, 2520,
			 2526,  777, 2532, 2544, 2561, 2550, 2567, 2573, 2589, 2595,
			 2601,  789,  377,    0,  771, 2249, 2608, 2609, 2612, 2615,
			 2618, 2651, 2655, 2658, 2664,  951, 2701, 2698, 2691, 2724,
			 2704, 2739, 2772, 2785, 1345, 2801, 2814, 2820, 2844, 2874,
			 2888, 2894, 2900, 2908, 2766, 2915, 1007, 2916, 2919, 2923,

			 2941, 2926,  662, 2993,  641, 3002, 3011,  427,  720, 3018,
			 3024, 3031, 3049, 3057, 3063, 3085, 3091, 3097, 3108, 3115,
			 3128, 3134, 3140, 3156, 3165, 3177, 3193, 3185, 3205, 3213,
			 3221, 3237, 3250, 6686, 3265, 3278, 3289, 3295,  770, 3305,
			 3311, 3322, 3328, 3334, 3350,  310, 3362, 3374, 1089,  478,
			    0,    0, 3369, 3370, 3388, 3391, 3392, 3395, 3428, 3434,
			 3447,  728, 3438, 3471, 3474, 3493, 3484, 3517, 6686,  513,
			 3554, 3562, 3568, 3584, 3597, 3605,  973, 3605, 3614, 3623,
			 3657, 1479,  837, 3689, 6686, 3701, 6686,  256,  689, 3659,
			 3710,  447, 3718, 3724, 3730, 3741, 3757, 3773, 3790, 3802,

			 3808, 3830, 3836,  605, 3855, 3862, 3880, 3886, 3892, 3909,
			 3915, 3943,  681, 3954,  496, 3971, 3961, 3978, 3984, 3996,
			  674, 4009, 4018, 4024, 1217, 6686, 4030,    0,  712, 4037,
			 4038, 4042, 4041, 4060, 4063, 4064, 4084, 1411, 4097, 4119,
			 4130, 4123, 4156, 4193, 6686,  661,  670, 4177, 4202, 4210,
			 4203, 1586, 1853, 2138,  867, 4271, 4280,  648, 4210, 4287,
			 4293,  624, 4300, 4309, 4328, 4334, 4340, 4351, 4364, 4370,
			 4379, 4399, 4405, 4414, 4357, 4431, 4437, 4459, 4443, 4465,
			  605, 4480, 4487, 4493,  816, 4503,  602, 4509, 4515, 4527,
			  596, 4522, 4525, 4526, 4549, 4568, 1418, 4573, 4574, 4595,

			 4608, 4614, 1935, 4633, 4641, 4651,  585,  576,  559,  538,
			    0,  499,  547, 4702, 4713, 4721, 4727, 4733, 4741, 4749,
			 4759, 4769, 4777, 4784, 4790, 4796, 4813, 4820, 4841, 4826,
			 4847, 4853, 4866, 1381, 4872, 1487, 4879,    0, 4886, 4615,
			 4890, 6686, 4893, 2017, 4911, 4932, 4912, 1242, 1291, 1585,
			 1845,  506,  727, 4964,  490, 4977, 4983, 4993, 5010, 5025,
			 5041, 5058,  392, 5069, 5075, 5086, 5092, 5098, 5104, 6686,
			 5115,    0, 5113, 4975, 5024, 5114, 6686, 5122, 5135, 1861,
			 2000, 2290, 2610, 1162,  359, 5183, 5122, 5196, 5202, 5208,
			 5214, 5226, 5232,  362, 5238, 5259, 5244,  659, 5251, 5258,

			 5269, 5259,  686, 6686,  832,  370, 6686, 5303, 5330, 5336,
			 5347, 5353,  884, 5359,    0,  264, 5366, 5373, 5377, 5413,
			 1031, 1279, 2839,  551, 5445, 5457, 5467, 5474, 5487, 5493,
			 5499,  707, 5505, 5512, 5517, 1377, 2820, 3493, 5517, 6686,
			 5534, 5549, 1868, 5578, 5569, 5527,  295,  282,  805, 5601,
			 5614, 5623, 5630, 1685, 6686, 5640,  102, 5646, 5637, 2299,
			 2438, 5655, 5672, 5682, 5688, 5700,  113, 5711, 5695, 2910,
			 3151, 5717, 5727, 2006, 5739,  144,  130, 5745, 5756, 2081,
			 6686, 5767, 2020, 2178, 5773, 5779, 2392, 2415, 5785, 1561,
			 6686, 6686, 5791, 5797, 5803, 6686, 5809, 5820, 5826, 5832,

			 6686, 5872, 5899, 5926, 5953, 5980, 5842, 2121, 6006, 6028,
			 6054, 6080, 6106, 6133, 6160, 6186, 6212, 6239, 6266, 6288,
			 6314, 6333, 6353,  883, 6379, 6406, 6433, 6459, 6473, 6490,
			 6508, 6534, 6548, 6561, 6578, 6595, 5849, 6608, 6625, 6642,
			 6659, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  800,    1,  801,  801,  802,  802,  800,    7,  803,
			  803,  800,  800,  800,  800,  800,  804,  800,  805,  806,
			  800,  800,  800,  800,  800,  800,  807,  800,  800,  800,
			  800,  800,  800,  800,  800,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  809,  800,  800,  810,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,   62,  811,  811,
			  800,  800,  800,  812,  800,  800,  800,  812,  812,  812,
			  812,  812,  813,  800,  814,  813,  800,  815,  800,  815,
			  815,  800,  816,  817,  800,  800,  800,  800,  804,  800,

			  818,  818,  818,  819,  820,  800,  800,  800,  821,  800,
			  800,  800,  800,  800,  800,  800,  800,  808,  822,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  800,   46,  808,
			  808,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  809,  809,  809,  809,  810,  800,  800,  800,  823,  811,
			  811,  811,  811,  800,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  800,  812,  800,  800,
			  800,  800,  812,  812,  812,  812,  812,  813,  800,  824,

			  813,  814,  825,  814,  824,  800,  815,  815,  800,  800,
			  800,  800,  826,  800,  816,  817,  800,  800,  215,  827,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  807,  800,  800,  800,  800,
			  800,  800,  800,  800,  828,  829,  800,  822,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  800,
			  140,  140,  140,  140,  140,  140,  140,  800,  800,  829,
			  140,  270,  270,  270,  270,  141,  141,  141,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  800,  809,
			  809,  809,  800,  830,  175,  175,  175,  800,  175,  175,

			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  812,  812,  812,  812,  812,  812,  812,  824,
			  800,  825,  831,  831,  800,  831,  831,  831,  827,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  828,  829,  832,  822,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  800,  140,  140,  140,  140,
			  140,  140,  800,  829,  270,  270,  270,  138,  270,  138,
			  800,  829,  270,  270,  140,  140,  800,  140,  140,  140,

			  140,  140,  800,  809,  809,  809,  809,  809,  800,  175,
			  175,  800,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  829,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  833,  834,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  800,  140,  140,  140,  140,  140,  140,  800,  829,
			  270,  270,  800,  829,  270,  474,  800,  140,  140,  140,
			  140,  828,  800,  809,  800,  809,  800,  809,  800,  175,
			  175,  800,  800,  175,  175,  175,  175,  175,  175,  175,

			  175,  175,  175,  829,  829,  175,  175,  175,  175,  175,
			  175,  175,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  835,  834,  140,
			  140,  140,  140,  140,  140,  140,  140,  800,  140,  140,
			  140,  140,  140,  270,  800,  829,  800,  140,  140,  140,
			  140,  800,  828,  828,  800,  809,  809,  809,  800,  175,
			  800,  800,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  835,  140,  140,  140,  140,  140,  800,  140,  140,  140,

			  140,  140,  800,  140,  140,  140,  800,  800,  828,  828,
			  836,  800,  800,  800,  175,  800,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  837,  140,  140,
			  140,  800,  140,  800,  140,  140,  140,  800,  800,  833,
			  833,  838,  800,  800,  800,  175,  175,  175,  175,  175,
			  175,  175,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  839,  140,  140,  140,  140,  800,  140,  140,  800,
			  800,  835,  835,  800,  800,  800,  175,  175,  175,  175,
			  175,  175,  800,  800,  800,  800,  800,  839,  140,  140,

			  140,  140,  800,  800,  835,  835,  800,  800,  175,  175,
			  175,  175,  800,  800,  840,  800,  140,  140,  140,  140,
			  800,  800,  835,  800,  800,  175,  175,  175,  175,  800,
			  800,  840,  800,  140,  140,  800,  800,  835,  800,  800,
			  175,  175,  800,  800,  140,  140,  800,  800,  835,  800,
			  175,  175,  800,  800,  800,  800,  800,  800,  140,  800,
			  800,  175,  800,  800,  800,  800,  800,  800,  140,  800,
			  800,  175,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			    0,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,  106,    0,    0,    0,   98,
			   98,   98,   98,    0,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   39,
			   98,   98,   98,   98,   98,   98,  101,  119,  121,  120,
			  117,  116,  118,  119,  119,  119,  119,  102,  105,    0,

			  102,    0,    0,    0,  103,  104,    0,    0,   70,   68,
			    0,   67,    0,   66,    0,    0,   94,   92,   92,    0,
			   93,  129,  123,  129,  129,  129,  129,  129,  129,    0,
			    4,   33,  113,    0,    0,    0,    0,    0,  109,    0,
			  107,    0,    0,   89,    0,    0,    0,    0,   95,   95,
			   38,   95,   95,   95,   95,   95,   95,   95,   95,    0,
			   95,   95,   95,   95,   41,   95,   95,   87,    0,    0,
			   80,   81,   80,   80,   80,   88,   95,   88,   88,   88,
			   95,   95,   95,   95,   95,   95,   40,   95,    0,    0,
			    0,    0,   97,  100,   98,   98,   38,    0,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   63,
			   63,   98,   41,   98,   98,   98,   98,   98,   98,   98,
			   40,   98,  119,  119,  119,  119,  119,  119,  119,    0,
			  103,  104,    0,    0,   69,   67,   66,   70,    0,  127,
			  130,  130,  128,  124,  125,  126,   90,  113,    0,  113,
			    0,    0,    0,  109,    0,    0,    0,  112,  107,    0,
			    0,    0,    0,    0,   96,   95,   95,   95,   95,   95,
			   37,   95,   95,   95,   95,    0,   95,   95,   95,   95,
			   95,   95,    0,    0,   95,   79,   95,   95,   95,   95,
			    0,    0,   79,   79,   79,   36,    0,   43,   95,   95,

			   95,   95,   65,    0,    0,    0,    0,    0,    0,   98,
			   98,    0,   98,   98,   98,   37,   98,   98,   98,   98,
			   98,   98,   98,    0,   98,   98,   98,   36,   43,   98,
			   98,   98,   98,  104,  113,    0,    0,    0,  108,  109,
			    0,  110,    0,  112,    0,    0,    0,  107,   76,    0,
			    0,    0,   58,   95,   95,   95,   95,   95,   95,   44,
			   95,    0,   95,   95,   35,   95,   95,   95,   81,   81,
			   81,   80,    0,    0,   95,   95,    0,   95,   95,   95,
			   95,    0,    0,    0,   62,    0,   61,    0,    0,   58,
			   98,    0,    0,   98,   98,   98,   98,   98,   44,   98,

			   98,   98,   35,   63,   63,   98,   98,   98,   98,   98,
			   98,   98,  113,    0,    0,    0,  109,  110,    0,    0,
			  112,    0,    0,    0,    0,   76,    0,    0,    0,   95,
			   59,   95,   60,   95,   95,   46,   95,    0,   95,   95,
			   95,   95,   95,   95,   79,   79,    0,   52,   95,   95,
			   95,    0,    0,    0,    0,    0,    0,    0,    0,   98,
			    0,    0,   59,   98,   60,   98,   98,   46,   98,   98,
			   98,   98,   98,   98,   52,   98,   98,   98,    0,    0,
			   99,    0,  110,    0,  113,    0,   78,    0,    0,  111,
			    0,   95,   95,   57,   95,   45,    0,   42,   56,   34,

			   95,   50,    0,   95,   95,   95,    0,    0,    0,    0,
			    0,    0,    0,    0,   98,    0,   98,   57,   98,   45,
			   42,   56,   34,   98,   50,   98,   98,   98,    0,    0,
			  110,    0,    0,    0,    0,   75,  111,    0,   95,   95,
			   95,   84,   95,    0,   95,   95,   53,    0,    0,    0,
			    0,    0,   65,    0,  100,   98,   98,   98,   98,   98,
			   98,   53,  112,    0,  112,    0,    0,    0,    0,   75,
			  111,    0,   95,   95,   47,   95,   83,   51,   95,    0,
			    0,    0,    0,    0,    0,    0,   98,   98,   47,   98,
			   51,   98,  112,   77,    0,   75,  111,    0,   95,   95,

			   95,   95,   82,   82,   82,   82,   91,    0,   98,   98,
			   98,   98,    0,    0,    0,    0,   95,   49,   48,   95,
			    0,    0,    0,    0,    0,   98,   49,   48,   98,    0,
			    0,    0,    0,   95,   95,    0,    0,    0,    0,   64,
			   98,   98,   74,   71,   95,   54,    0,    0,    0,    0,
			   98,   54,    0,    0,   74,    0,    0,    0,   95,    0,
			    0,   98,    0,    0,   71,    0,    0,   71,   55,    0,
			    0,   55,    0,   73,    0,    0,    0,    0,    0,    0,
			   73,   71,    0,    0,    0,    0,    0,    0,    0,   72,
			   85,   86,    0,    0,    0,   72,    0,   72,    0,    0,

			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6686
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 800
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 801
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

	err_str: STRING
		attribute
			create Result.make (0)
		end

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
