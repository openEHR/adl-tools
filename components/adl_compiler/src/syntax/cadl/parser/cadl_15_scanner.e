note
	component:   "openEHR ADL Tools"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_15_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_15_TOKENS
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
			Result := (INITIAL <= sc and sc <= IN_VALUE_SET_DEF)
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
--|#line 82 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 82")
end
-- Ignore separators
else
--|#line 83 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 83")
end
in_lineno := in_lineno + text_count
end
else
--|#line 88 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 88")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 89 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 89")
end
in_lineno := in_lineno + 1
else
--|#line 93 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 93")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 94 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 94")
end
last_token := Plus_code
else
--|#line 95 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 95")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 96 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 96")
end
last_token := Slash_code
else
--|#line 97 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 97")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 98 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 98")
end
last_token := Equal_code
else
--|#line 99 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 99")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 100 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 100")
end
last_token := Semicolon_code
else
--|#line 101 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 101")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 102 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 102")
end
last_token := Colon_code
else
--|#line 103 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 103")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 104 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 104")
end
last_token := Left_parenthesis_code
else
--|#line 105 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 105")
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
--|#line 106 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 106")
end
last_token := Dollar_code
else
--|#line 108 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 108")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
--|#line 110 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 110")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 112 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 112")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 113 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 113")
end
last_token := Right_bracket_code
else
--|#line 115 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 115")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 24 then
--|#line 116 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 116")
end
last_token := SYM_END_CBLOCK
else
--|#line 118 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 118")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 119 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 119")
end
last_token := SYM_LE
else
--|#line 120 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 120")
end
last_token := SYM_NE
end
else
if yy_act = 28 then
--|#line 122 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 122")
end
last_token := SYM_LT
else
--|#line 123 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 123")
end
last_token := SYM_GT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 125 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 125")
end
last_token := SYM_MODULO
else
--|#line 126 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 126")
end
last_token := SYM_DIV
end
else
if yy_act = 32 then
--|#line 128 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 128")
end
last_token := SYM_ELLIPSIS
else
--|#line 129 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 129")
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
--|#line 133 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 133")
end
last_token := SYM_MATCHES
else
--|#line 135 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 135")
end
last_token := SYM_MATCHES
end
else
--|#line 139 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 139")
end
last_token := SYM_THEN
end
else
if yy_act = 37 then
--|#line 141 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 141")
end
last_token := SYM_ELSE
else
--|#line 143 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 143")
end
last_token := SYM_AND
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 145 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 145")
end
last_token := SYM_OR
else
--|#line 147 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 147")
end
last_token := SYM_XOR
end
else
if yy_act = 41 then
--|#line 149 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 149")
end
last_token := SYM_NOT
else
--|#line 151 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 151")
end
last_token := SYM_IMPLIES
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 153 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 153")
end
last_token := SYM_TRUE
else
--|#line 155 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 155")
end
last_token := SYM_FALSE
end
else
if yy_act = 45 then
--|#line 157 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 157")
end
last_token := SYM_FORALL
else
--|#line 159 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 159")
end
last_token := SYM_EXISTS
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 163 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 163")
end
last_token := SYM_EXISTENCE
else
--|#line 165 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 165")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 49 then
--|#line 167 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 167")
end
last_token := SYM_CARDINALITY
else
--|#line 169 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 169")
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
--|#line 171 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 171")
end
last_token := SYM_UNORDERED
else
--|#line 173 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 173")
end
last_token := SYM_UNIQUE
end
else
if yy_act = 53 then
--|#line 175 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 175")
end
last_token := SYM_USE_NODE
else
--|#line 177 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 177")
end
last_token := SYM_USE_ARCHETYPE
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 179 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 179")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 181 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 181")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 57 then
--|#line 183 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 183")
end
last_token := SYM_EXCLUDE
else
--|#line 185 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 185")
end
last_token := SYM_AFTER
end
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
--|#line 187 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 187")
end
last_token := SYM_BEFORE
else
--|#line 189 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 189")
end
last_token := SYM_CLOSED
end
else
if yy_act = 61 then
--|#line 192 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 192")
end

			last_token := V_URI
			last_string_value := text
		
else
--|#line 200 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 200")
end

		last_token := V_ROOT_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_converted (code)
		converted_codes.put (last_string_value, code)
	
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 206 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 206")
end

		last_token := V_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_converted (code)
		converted_codes.put (last_string_value, code)
	
else
--|#line 212 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 212")
end

		last_token := V_ID_CODE_STR
		last_string_value := adl_14_id_code_converted (text)
	
end
else
if yy_act = 65 then
--|#line 216 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 216")
end

		last_token := V_VALUE_SET_REF
		code := text_substring (2, text_count - 1)
		reformatted_code := adl_14_code_renumbered (code) 
		last_string_value := Local_terminology_id + "::" + reformatted_code
		converted_codes.put (reformatted_code, code)
	
else
--|#line 230 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 230")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
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
--|#line 236 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 236")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 243 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 243")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
end
else
--|#line 250 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 250")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 70 then
--|#line 266 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 266")
end

		in_buffer.append_string (text_substring (2, text_count))
		set_start_condition (IN_VALUE_SET_DEF)
		term_code_count := 0
		assumed_term_code_index := 0
	
else
--|#line 274 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 274")
end
 -- match second last line with ';' termination (assumed value)
		str_ := text
		in_buffer.append(text)
		term_code_count := term_code_count + 1
		assumed_term_code_index := term_code_count
	
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
--|#line 281 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 281")
end
	-- match any line, with ',' termination
		str_ := text
		in_buffer.append(text)
		term_code_count := term_code_count + 1
	
else
--|#line 288 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 288")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 74 then
--|#line 291 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 291")
end
in_lineno := in_lineno + 1
else
--|#line 293 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 293")
end
 -- match final line, terminating in ']'
		if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
			last_token := ERR_VALUE_SET_DEF
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
	
end
end
end
else
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act = 76 then
--|#line 312 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 312")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 319 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 319")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 320 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 320")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 321 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 321")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 328 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 328")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 329 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 329")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 82 then
--|#line 336 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 336")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 337 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 337")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
end
end
else
if yy_act <= 91 then
if yy_act <= 87 then
if yy_act <= 85 then
if yy_act = 84 then
--|#line 344 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 344")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 345 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 345")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 86 then
--|#line 357 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 357")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 367 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 367")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 372 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 372")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 382 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 382")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 90 then
--|#line 388 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 388")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 399 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 399")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
if yy_act = 92 then
--|#line 408 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 408")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 414 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 414")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 94 then
--|#line 420 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 420")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 426 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 426")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 433 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 433")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 441 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 441")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[at-code]"
			last_token := V_ABS_PATH
			last_string_value := adl_14_path_converted (text)
		
end
else
if yy_act = 98 then
--|#line 446 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 446")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[at-code]"
			last_token := V_REL_PATH
			last_string_value := adl_14_path_converted (text)
		
else
--|#line 455 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 455")
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
--|#line 461 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 461")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
else
--|#line 467 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 467")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
--|#line 474 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 474")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 103 then
--|#line 478 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 478")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 482 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 482")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 486 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 486")
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
--|#line 498 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 498")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 107 then
--|#line 505 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 505")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 510 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 510")
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
--|#line 525 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 525")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 526 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 526")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 111 then
--|#line 530 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 530")
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
--|#line 531 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 531")
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
--|#line 532 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 532")
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
--|#line 552 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 552")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 557 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 557")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 565 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 565")
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
--|#line 567 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 567")
end
in_buffer.append_character ('"')
else
--|#line 569 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 569")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 573 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 573")
end
in_buffer.append_string (text)
else
--|#line 575 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 575")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 580 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 580")
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
--|#line 591 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 591")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 600 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 600")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 602 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 602")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 603 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 603")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 604 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 604")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 605 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 605")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 606 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 606")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 608 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 608")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 609 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 609")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 613 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 613")
end
;
else
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
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
when 0, 2, 3 then
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
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
			create an_array.make_filled (0, 0, 5588)
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
			    0,   10,   11,   12,   11,   11,   13,   14,   15,   16,
			   17,   18,   19,   20,   21,   22,   23,   24,   25,   25,
			   25,   26,   26,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   36,   39,   40,   36,
			   41,   42,   43,   44,   36,   36,   36,   45,   46,   36,
			   47,   48,   36,   49,   50,   51,   52,   10,   53,   54,
			   55,   56,   57,   58,   56,   59,   60,   56,   61,   62,
			   63,   56,   56,   56,   56,   64,   65,   56,   56,   66,
			   67,   68,   69,   70,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   72,   81,   96,   81,   73,   72,  603,

			  603,   90,   73,   90,   90,   99,  209,  100,  100,  100,
			  100,  100,  100,  103,  111,  104,  111,  105,  105,  105,
			  105,  105,  105,  112,  115,  111,  111,  113,  111,  114,
			   82,   83,   82,   83,  111,  111,  122,  137,  116,  126,
			   97,  176,  123,  124,   74,  138,  144,  117,  125,   74,
			  935,  112,  115,  210,  145,  113,  106,  114,  208,  230,
			  208,  208,  230,  934,  122,  137,  116,  126,  917,  177,
			  123,  124,  918,  138,  232,  117,  125,  232,   75,   76,
			   77,   78,   79,   75,   76,   77,   78,   79,   84,   85,
			   86,   84,   85,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   87,   88,   84,   88,   88,   88,   88,   88,
			   88,   84,   84,   84,   84,   84,   84,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   84,   84,   89,   84,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			  103,  111,  104,  111,  107,  107,  107,  107,  107,  107,
			  168,  111,  111,  111,  118,  301,  120,  128,  912,  127,

			  203,  169,  399,  111,  185,  119,  111,  187,  121,  141,
			  129,   90,  535,   90,   90,  535,  207,  225,  170,  207,
			  225,  139,  118,  106,  120,  128,  140,  127,  142,  204,
			  171,  201,  186,  911,  119,  188,  121,  141,  129,  130,
			  131,  131,  131,  131,  131,  131,  162,  151,  111,  139,
			  189,  151,  172,  151,  140,  132,  164,  142,  193,  202,
			  302,  151,  133,  190,  173,  165,  194,  151,  536,  134,
			  227,  135,  295,  136,  163,  157,  178,  179,  191,  157,
			  174,  157,  180,  132,  166,  357,  195,  157,  302,  157,
			  133,  192,  175,  167,  196,  157,  212,  181,  214,  214,

			  135,  157,  136,  148,  182,  183,  148,  305,  207,  298,
			  184,  149,  887,  207,  357,  306,  207,  765,  150,  151,
			  151,  151,  151,  151,  151,  152,  207,  303,  304,  313,
			  867,  151,  151,  151,  151,  151,  153,  151,  151,  151,
			  154,  151,  155,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  156,  303,  304,  313,  151,  157,
			  157,  157,  157,  157,  158,  157,  157,  157,  159,  157,
			  160,  157,  157,  157,  157,  157,  161,  157,  157,  157,
			  157,  157,  148,  869,  870,  148,  211,  211,  211,  387,
			  149,  213,  213,  213,  215,  215,  215,  150,  151,  151,

			  151,  151,  151,  151,  152,  386,  212,  547,  315,  546,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  156,  217,  221,  315,  151,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  197,  224,  489,  229,  535,  198,  229,  535,  316,
			  218,  219,  222,  223,  254,  255,  230,  231,  229,  246,
			  599,  229,  729,  256,  386,  111,  319,  232,  148,  199,
			  230,  148,  387,  235,  200,  727,  149,  316,  218,  219,

			  366,  232,  236,  236,  236,  236,  236,  236,  243,  243,
			  243,  243,  243,  243,  319,  247,  325,  227,  248,  248,
			  248,  248,  248,  248,  244,  249,  249,  249,  249,  249,
			  249,  227,  253,  253,  253,  253,  253,  253,  237,  254,
			  255,  250,  254,  255,  325,  254,  255,  245,  269,  778,
			  111,  307,  244,  238,  329,  326,  103,  239,  104,  240,
			  251,  251,  251,  251,  251,  251,  252,  487,  103,  250,
			  104,  295,  251,  251,  251,  251,  251,  251,  254,  255,
			  255,  254,  255,  326,  254,  255,  330,  256,  256,  111,
			  256,  549,  111,  256,  607,  111,  487,  254,  255,  106,

			  331,  777,  260,  320,  337,  259,  256,  296,  111,  321,
			  258,  106,  254,  255,  330,  254,  255,  261,  254,  255,
			  549,  256,  297,  111,  307,  254,  255,  256,  331,  111,
			  260,  320,  337,  259,  256,  106,  111,  321,  258,  254,
			  255,  208,  262,  208,  208,  261,  339,  302,  256,  264,
			  111,  341,  263,  776,  254,  255,  265,  254,  255,  775,
			  254,  255,  266,  256,  879,  111,  256,  342,  111,  256,
			  262,  111,  254,  255,  339,  308,  765,  264,  267,  341,
			  263,  256,  150,  111,  265,  254,  255,  268,  270,  271,
			  266,  254,  255,  879,  256,  342,  111,  345,  254,  255,

			  256,  346,  111,  254,  255,  546,  267,  256,  761,  111,
			  254,  255,  256,  547,  111,  268,  270,  271,  441,  256,
			  275,  111,  756,  273,  754,  345,  648,  272,  276,  346,
			  274,  351,  254,  255,  952,  254,  255,  130,  254,  255,
			  217,  256,  449,  224,  256,  883,  111,  256,  275,  111,
			  278,  273,  254,  255,  130,  729,  276,  279,  274,  351,
			  355,  256,  684,  111,  110,  649,  280,  282,  281,  727,
			  132,  289,  254,  255,  883,  443,  218,  219,  278,  218,
			  219,  307,  254,  255,  282,  279,  135,  241,  355,  241,
			  241,  307,  449,  254,  255,  280,  707,  281,  132,  289,

			  256,  685,  307,  443,  254,  255,  303,  311,  312,  312,
			  312,  312,  312,  307,  332,  135,  254,  255,  130,  283,
			  283,  283,  283,  283,  283,  256,  346,  111,  254,  255,
			  130,  254,  255,  130,  309,  469,  444,  256,  284,  111,
			  256,  285,  111,  256,  254,  255,  132,  286,  221,  132,
			  254,  255,  254,  256,  348,  111,  133,  727,  501,  307,
			  282,  254,  255,  282,  444,  135,  284,  290,  304,  285,
			  256,  291,  111,  729,  132,  286,  491,  132,  254,  255,
			  287,  254,  255,  288,  133,  222,  223,  256,  451,  111,
			  307,  254,  255,  834,  135,  290,  310,  292,  875,  291, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  256,  313,  111,  254,  255,  255,  254,  255,  287,  835,
			  207,  288,  256,  256,  111,  307,  451,  254,  255,  254,
			  255,  293,  254,  255,  453,  292,  307,  207,  307,  314,
			  644,  307,  254,  255,  254,  255,  315,  254,  255,  294,
			  876,  307,  643,  307,  316,  454,  307,  330,  457,  293,
			  754,  320,  453,  319,  642,  349,  325,  321,  225,  350,
			  634,  225,  254,  255,  317,  254,  255,  326,  294,  254,
			  255,  307,  318,  454,  307,  335,  457,  618,  256,  323,
			  342,  322,  331,  349,  327,  324,  845,  350,  211,  211,
			  211,  103,  207,  254,  255,  328,  333,  334,  334,  334,

			  334,  334,  307,  207,  779,  211,  211,  211,  344,  207,
			  336,  227,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  254,  255,  254,  255,  254,
			  255,  254,  255,  780,  307,  902,  307,  534,  307,  400,
			  307,  765,  254,  255,  254,  255,  341,  254,  255,  912,
			  345,  307,  368,  307,  507,  788,  307,  337,  458,  339,
			  364,  364,  364,  351,  902,  349,  254,  255,  459,  350,
			  463,  365,  365,  365,  343,  307,  229,  355,  347,  229,
			  359,  360,  361,  362,  363,  338,  458,  340,  230,  222,

			  223,  354,  229,  352,  789,  229,  459,  353,  463,  232,
			  372,  371,  357,  372,  230,  356,  376,  377,  377,  377,
			  377,  377,  377,  494,  383,  232,  383,  254,  255,  384,
			  384,  384,  384,  384,  384,  493,  256,  371,  111,  227,
			  371,  358,  385,  385,  385,  385,  385,  385,  388,  388,
			  388,  388,  388,  388,  367,  227,  369,  370,  371,  369,
			  370,  369,  369,  369,  369,  369,  369,  369,  369,  372,
			  231,  231,  369,  231,  231,  231,  231,  231,  231,  369,
			  373,  369,  369,  369,  369,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  231,  231,  231,  231,  231,  231,  369,  369,
			  374,  369,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,  382,  382,
			  382,  382,  382,  382,  389,  389,  389,  389,  389,  389,
			  254,  255,  466,  467,  244,  484,  392,  468,  392,  307,
			  390,  393,  393,  393,  393,  393,  393,  103,  469,  104,
			  464,  394,  394,  394,  394,  394,  394,  245,  254,  255,
			  466,  467,  244,  391,  446,  468,  645,  307,  390,  395,

			  395,  395,  395,  395,  396,  396,  396,  396,  396,  396,
			  254,  255,  445,  254,  255,  442,  254,  255,  434,  256,
			  106,  111,  256,  756,  111,  256,  472,  111,  474,  401,
			  254,  255,  400,  254,  255,  647,  254,  255,  399,  256,
			  402,  111,  256,  403,  111,  256,  399,  111,  404,  254,
			  255,  411,  254,  255,  472,  406,  474,  401,  256,  846,
			  111,  256,  411,  111,  405,  952,  254,  255,  402,  254,
			  255,  403,  411,  407,  475,  256,  404,  111,  256,  381,
			  111,  869,  870,  406,  254,  255,  380,  254,  255,  379,
			  411,  478,  405,  256,  410,  111,  256,  408,  111,  479,

			  409,  407,  475,  254,  255,  378,  254,  255,  412,  254,
			  255,  413,  256,  482,  111,  256,  375,  111,  256,  478,
			  111,  373,  371,  415,  373,  408,  414,  479,  409,  254,
			  255,  483,  228,  254,  255,  366,  412,  367,  256,  413,
			  111,  482,  256,  681,  111,  366,  254,  255,  207,  254,
			  255,  415,  417,  548,  414,  256,  785,  111,  307,  483,
			  254,  255,  416,  419,  419,  419,  419,  419,  419,  256,
			  332,  111,  110,  110,  110,  110,  110,  110,  418,  559,
			  417,  548,  683,  269,  110,  110,  110,  110,  110,  110,
			  416,  464,  418,  254,  255,  787,  420,  420,  420,  420,

			  420,  420,  256,  110,  111,  254,  255,  559,  421,  421,
			  421,  421,  421,  421,  256,  422,  111,  423,  952,  254,
			  255,  130,  207,  254,  255,  418,  301,  561,  256,  299,
			  111,  110,  307,  254,  255,  130,  147,  418,  424,  562,
			  472,  425,  256,  295,  111,  254,  255,  426,  254,  255,
			  286,  254,  255,  207,  256,  561,  111,  428,  244,  111,
			  256,  565,  111,  254,  255,  542,  424,  562,  473,  425,
			  429,  427,  256,  295,  111,  426,  254,  255,  286,  254,
			  255,  245,  254,  255,  277,  256,  244,  111,  256,  565,
			  111,  256,  430,  111,  254,  255,  242,  241,  429,  427,

			  211,  211,  211,  256,  543,  111,  431,  435,  435,  435,
			  435,  435,  435,  295,  450,  450,  450,  450,  450,  450,
			  430,  432,  436,  437,  437,  437,  437,  437,  295,  234,
			  433,  213,  213,  213,  431,  438,  439,  440,  440,  440,
			  440,  295,  254,  255,  254,  255,  254,  255,  254,  255,
			  566,  307,  569,  307,   94,  307,  570,  307,   91,  433,
			  449,  443,  450,  450,  450,  450,  450,  450,  254,  255,
			  572,  444,  228,  451,  254,  255,  207,  307,  566,  454,
			  569,  254,  255,  307,  570,  573,  453,  254,  255,  447,
			  307,  254,  255,  457,  205,  574,  307,  301,  572,  448,

			  307,  452,  254,  255,  399,  458,  147,  456,  207,  411,
			  111,  307,  109,  573,  455,  207,  254,  255,  459,  207,
			  411,  460,  463,  574,  108,  307,  466,  207,  101,   98,
			  411,  579,  469,  461,  334,  334,  334,  334,  334,  334,
			  467,  518,  254,  255,  254,  255,  462,   94,  411,   92,
			  465,  307,  518,  307,  470,  254,  255,  254,  255,  579,
			  254,  255,  518,  475,  307,   91,  307,  952,  471,  307,
			  254,  255,  952,  254,  255,  474,  479,  254,  255,  307,
			  518,  478,  307,  254,  255,  875,  307,  214,  214,  482,
			  581,  477,  307,  215,  215,  215,  765,  211,  211,  211,

			  483,  952,  582,  476,  481,  211,  211,  211,  538,  480,
			  370,  371,  952,  370,  952,  484,  295,  485,  581,  487,
			  254,  255,  372,  254,  255,  952,  952,  877,  486,  256,
			  582,  111,  307,  373,  376,  377,  377,  377,  377,  377,
			  377,  384,  384,  384,  384,  384,  384,  541,  488,  490,
			  490,  490,  490,  490,  490,  492,  492,  492,  492,  492,
			  492,  585,  952,  374,  495,  495,  495,  495,  495,  495,
			  496,  496,  496,  496,  496,  496,  499,  499,  499,  499,
			  499,  499,  586,  651,  952,  497,  390,  497,  491,  585,
			  498,  498,  498,  498,  498,  498,  393,  393,  393,  393, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  393,  393,  500,  500,  500,  500,  500,  500,  952,  391,
			  586,  651,  502,  503,  390,  504,  504,  504,  504,  504,
			  504,  505,  505,  505,  505,  505,  505,  506,  506,  506,
			  506,  506,  506,  254,  255,  952,  254,  255,  653,  254,
			  255,  501,  256,  952,  111,  256,  952,  111,  256,  952,
			  111,  254,  255,  654,  952,  952,  254,  255,  657,  952,
			  256,  663,  111,  509,  952,  256,  653,  111,  587,  511,
			  510,  254,  255,  952,  512,  513,  254,  255,  952,  588,
			  256,  654,  111,  254,  255,  256,  657,  111,  952,  663,
			  664,  509,  256,  952,  111,  952,  587,  511,  517,  510,

			  254,  255,  512,  513,  514,  254,  255,  588,  515,  256,
			  952,  111,  254,  255,  256,  399,  111,  952,  664,  516,
			  529,  256,  952,  111,  254,  255,  517,  665,  519,  254,
			  255,  529,  514,  256,  952,  111,  515,  604,  256,  604,
			  111,  529,  952,  952,  668,  520,  952,  516,  605,  626,
			  521,  522,  254,  255,  952,  665,  519,  254,  255,  529,
			  626,  256,  110,  111,  670,  110,  256,  671,  111,  952,
			  626,  110,  668,  520,  254,  255,  606,  952,  521,  522,
			  254,  255,  523,  256,  674,  111,  675,  524,  626,  256,
			  110,  111,  670,  110,  952,  671,  952,  254,  255,  110,

			  419,  419,  419,  419,  419,  419,  256,  676,  111,  677,
			  523,  952,  674,  701,  675,  524,  420,  420,  420,  420,
			  420,  420,  110,  421,  421,  421,  421,  421,  421,  723,
			  701,  730,  732,  110,  701,  676,  952,  677,  110,  525,
			  525,  525,  525,  525,  525,  254,  255,  110,  952,  110,
			  110,  952,  534,  255,  307,  952,  110,  723,  701,  730,
			  732,  256,  110,  111,  254,  255,  110,  526,  526,  526,
			  526,  526,  526,  256,  952,  111,  110,  566,  110,  527,
			  527,  527,  527,  527,  527,  110,  528,  528,  528,  528,
			  528,  528,  733,  952,  110,  254,  255,  530,  254,  255,

			  736,  110,  254,  255,  256,  568,  111,  307,  254,  255,
			  952,  307,  952,  531,  952,  254,  255,  256,  952,  111,
			  733,  561,  110,  532,  307,  530,  952,  952,  736,  110,
			  952,  737,  548,  738,  533,  550,  551,  551,  551,  551,
			  551,  531,  537,  537,  537,  537,  537,  537,  295,  563,
			  538,  532,  539,  540,  540,  540,  540,  540,  295,  737,
			  554,  738,  533,  540,  540,  540,  540,  540,  540,  295,
			  544,  952,  440,  440,  440,  440,  440,  440,  295,  542,
			  952,  440,  440,  440,  440,  440,  440,  295,  952,  541,
			  552,  553,  553,  553,  553,  553,  254,  255,  556,  557,

			  557,  557,  557,  557,  741,  307,  743,  254,  255,  545,
			  558,  558,  558,  558,  558,  558,  307,  952,  543,  254,
			  255,  952,  254,  255,  254,  255,  254,  255,  307,  744,
			  549,  307,  741,  307,  743,  307,  952,  559,  562,  952,
			  952,  254,  255,  569,  575,  576,  576,  576,  576,  576,
			  307,  254,  255,  254,  255,  565,  952,  744,  952,  555,
			  307,  952,  307,  747,  572,  560,  564,  254,  255,  254,
			  255,  571,  254,  255,  952,  579,  307,  952,  307,  534,
			  255,  307,  952,  567,  573,  952,  254,  255,  307,  254,
			  255,  747,  577,  254,  255,  307,  952,  581,  256,  582,

			  111,  748,  307,  580,  586,  585,  591,  591,  591,  591,
			  591,  591,  578,  592,  592,  592,  592,  592,  592,  382,
			  382,  382,  382,  382,  382,  583,  952,  584,  952,  748,
			  952,  952,  590,  589,  593,  594,  594,  594,  594,  594,
			  693,  693,  693,  693,  693,  491,  595,  596,  596,  596,
			  596,  596,  597,  597,  597,  597,  597,  597,  498,  498,
			  498,  498,  498,  498,  749,  760,  952,  952,  390,  598,
			  598,  598,  598,  598,  598,  600,  600,  600,  600,  600,
			  600,  601,  601,  601,  601,  601,  601,  952,  391,  952,
			  790,  391,  749,  760,  254,  255,  390,  602,  602,  602,

			  602,  602,  602,  256,  952,  111,  254,  255,  599,  597,
			  597,  597,  597,  597,  597,  256,  952,  111,  790,  503,
			  501,  504,  504,  504,  504,  504,  504,  793,  254,  255,
			  952,  952,  612,  254,  255,  952,  610,  256,  631,  111,
			  952,  658,  256,  952,  111,  254,  255,  611,  952,  632,
			  769,  613,  795,  659,  256,  793,  111,  254,  255,  633,
			  612,  254,  255,  614,  797,  799,  256,  769,  111,  658,
			  256,  769,  111,  254,  255,  611,  615,  632,  952,  613,
			  795,  659,  256,  952,  111,  254,  255,  952,  616,  254,
			  255,  614,  797,  799,  256,  769,  111,  617,  256,  800,

			  111,  254,  255,  620,  615,  801,  254,  255,  619,  833,
			  256,  781,  111,  254,  255,  307,  616,  254,  255,  295,
			  952,  952,  256,  952,  111,  617,  256,  800,  111,  254,
			  255,  620,  621,  801,  952,  952,  619,  833,  256,  952,
			  111,  525,  525,  525,  525,  525,  525,  622,  623,  255,
			  782,  526,  526,  526,  526,  526,  526,  256,  254,  255,
			  621,  528,  528,  528,  528,  528,  528,  307,  952,  624,
			  836,  254,  255,  838,  952,  622,  623,  254,  255,  625,
			  256,  952,  111,  110,  254,  255,  256,  952,  111,  952,
			  627,  254,  255,  307,  254,  255,  628,  624,  836,  952,

			  256,  838,  111,  256,  840,  111,  952,  625,  422,  696,
			  423,  110,  527,  527,  527,  527,  527,  527,  627,  254,
			  255,  629,  254,  255,  628,  952,  644,  110,  256,  952,
			  111,  307,  840,  711,  425,  842,  952,  696,  254,  255,
			  426,  651,  254,  255,  711,  952,  630,  307,  952,  629,
			  952,  256,  952,  111,  712,  110,  646,  646,  646,  646,
			  646,  646,  425,  842,  254,  255,  952,  952,  426,  652,
			  952,  952,  711,  307,  630,  635,  635,  635,  635,  635,
			  635,  295,  636,  637,  637,  637,  637,  637,  295,  638,
			  639,  639,  639,  639,  639,  295,  639,  639,  639,  639,

			  639,  639,  295,  438,  640,  640,  640,  640,  640,  295,
			  438,  641,  640,  640,  640,  640,  295,  645,  952,  646,
			  646,  646,  646,  646,  646,  648,  783,  553,  553,  553,
			  553,  553,  553,  449,  295,  557,  557,  557,  557,  557,
			  557,  256,  650,  650,  650,  650,  650,  650,  254,  255,
			  254,  255,  254,  255,  254,  255,  647,  307,  952,  307,
			  952,  307,  952,  307,  649,  784,  843,  952,  654,  952,
			  657,  952,  861,  658,  653,  469,  952,  576,  576,  576,
			  576,  576,  576,  256,  952,  659,  254,  255,  254,  255,
			  254,  255,  952,  952,  843,  307,  656,  307,  660,  307, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  861,  661,  655,  254,  255,  664,  665,  254,  255,  668,
			  254,  255,  307,  662,  254,  255,  307,  952,  952,  307,
			  254,  255,  671,  256,  862,  111,  674,  254,  255,  307,
			  884,  884,  884,  666,  667,  952,  256,  669,  111,  675,
			  670,  680,  680,  680,  680,  680,  680,  952,  952,  952,
			  673,  952,  862,  681,  678,  682,  682,  682,  682,  682,
			  682,  682,  682,  682,  682,  682,  682,  679,  672,  684,
			  952,  596,  596,  596,  596,  596,  596,  597,  597,  597,
			  597,  597,  597,  687,  687,  687,  687,  687,  687,  952,
			  952,  952,  683,  686,  688,  688,  688,  688,  688,  688,

			  689,  689,  689,  689,  689,  689,  952,  952,  685,  690,
			  690,  690,  690,  690,  690,  691,  691,  691,  691,  691,
			  691,  686,  599,  692,  692,  692,  692,  692,  692,  694,
			  694,  694,  694,  694,  694,  254,  255,  864,  254,  255,
			  952,  952,  254,  255,  256,  250,  111,  256,  952,  111,
			  697,  256,  952,  111,  952,  254,  255,  698,  254,  255,
			  866,  254,  255,  878,  256,  864,  111,  256,  699,  111,
			  256,  881,  111,  250,  952,  254,  255,  893,  697,  700,
			  703,  254,  255,  952,  256,  698,  111,  952,  866,  702,
			  256,  878,  111,  254,  255,  952,  699,  894,  952,  881,

			  705,  952,  256,  952,  111,  893,  704,  700,  703,  254,
			  255,  706,  254,  255,  771,  254,  255,  702,  256,  507,
			  111,  256,  903,  111,  256,  894,  111,  507,  705,  254,
			  255,  771,  709,  711,  704,  771,  254,  255,  256,  706,
			  111,  712,  708,  913,  713,  307,  952,  710,  254,  255,
			  903,  730,  714,  890,  714,  952,  952,  307,  952,  771,
			  709,  890,  714,  715,  716,  716,  716,  716,  716,  952,
			  708,  913,  713,  952,  890,  710,  952,  952,  952,  731,
			  714,  717,  717,  717,  717,  717,  717,  295,  538,  890,
			  637,  637,  637,  637,  637,  637,  295,  718,  636,  636,

			  636,  636,  636,  295,  636,  636,  636,  636,  636,  636,
			  295,  542,  952,  640,  640,  640,  640,  640,  640,  295,
			  719,  720,  720,  720,  720,  720,  544,  541,  640,  640,
			  640,  640,  640,  640,  295,  721,  722,  722,  722,  722,
			  722,  724,  725,  725,  725,  725,  725,  952,  923,  952,
			  543,  726,  726,  726,  726,  726,  726,  552,  728,  728,
			  728,  728,  728,  254,  255,  545,  254,  255,  254,  255,
			  254,  255,  307,  952,  952,  307,  923,  307,  952,  307,
			  952,  952,  732,  891,  254,  255,  254,  255,  952,  738,
			  952,  891,  733,  307,  952,  307,  952,  254,  255,  737,

			  254,  255,  254,  255,  891,  743,  256,  952,  111,  307,
			  734,  307,  952,  952,  952,  741,  952,  740,  744,  891,
			  735,  591,  591,  591,  591,  591,  591,  739,  808,  808,
			  808,  808,  747,  745,  751,  752,  752,  752,  752,  752,
			  952,  952,  952,  742,  952,  952,  746,  753,  753,  753,
			  753,  753,  753,  595,  755,  755,  755,  755,  755,  757,
			  750,  757,  952,  952,  758,  758,  758,  758,  758,  758,
			  758,  758,  758,  758,  758,  758,  759,  759,  759,  759,
			  759,  759,  601,  601,  601,  601,  601,  601,  762,  762,
			  762,  762,  762,  762,  763,  763,  763,  763,  763,  763,

			  764,  764,  764,  764,  764,  764,  254,  255,  952,  599,
			  254,  255,  921,  254,  255,  256,  760,  111,  952,  256,
			  952,  111,  256,  921,  111,  952,  254,  255,  952,  952,
			  768,  254,  255,  921,  767,  256,  766,  111,  952,  391,
			  256,  952,  111,  952,  760,  254,  255,  952,  254,  255,
			  952,  921,  254,  255,  256,  952,  111,  256,  768,  111,
			  952,  256,  767,  111,  766,  254,  255,  899,  254,  255,
			  952,  254,  255,  952,  256,  899,  111,  256,  770,  111,
			  256,  952,  111,  254,  255,  952,  952,  772,  899,  952,
			  952,  952,  256,  773,  111,  786,  786,  786,  786,  786,

			  786,  952,  774,  899,  952,  779,  770,  716,  716,  716,
			  716,  716,  716,  952,  952,  772,  952,  952,  952,  952,
			  785,  773,  786,  786,  786,  786,  786,  786,  952,  788,
			  774,  722,  722,  722,  722,  722,  722,  724,  724,  724,
			  724,  724,  724,  645,  780,  725,  725,  725,  725,  725,
			  725,  648,  952,  728,  728,  728,  728,  728,  728,  787,
			  254,  255,  254,  255,  254,  255,  254,  255,  789,  307,
			  952,  307,  900,  307,  952,  307,  254,  255,  254,  255,
			  900,  795,  647,  952,  793,  307,  952,  307,  254,  255,
			  649,  254,  255,  900,  254,  255,  952,  307,  254,  255,

			  307,  254,  255,  307,  952,  952,  952,  307,  900,  796,
			  307,  952,  794,  799,  797,  681,  952,  752,  752,  752,
			  752,  752,  752,  751,  751,  751,  751,  751,  751,  684,
			  952,  755,  755,  755,  755,  755,  755,  952,  952,  952,
			  952,  802,  798,  758,  758,  758,  758,  758,  758,  810,
			  811,  810,  811,  952,  683,  758,  758,  758,  758,  758,
			  758,  805,  805,  805,  805,  805,  805,  806,  685,  806,
			  952,  952,  807,  807,  807,  807,  807,  807,  809,  809,
			  809,  809,  809,  809,  952,  952,  254,  255,  812,  813,
			  813,  813,  813,  813,  813,  256,  952,  111,  254,  255,

			  952,  254,  255,  815,  952,  760,  819,  256,  952,  111,
			  256,  952,  111,  254,  255,  915,  915,  915,  915,  915,
			  817,  816,  256,  819,  111,  254,  255,  819,  391,  952,
			  818,  815,  952,  760,  256,  822,  111,  254,  255,  822,
			  952,  254,  255,  820,  254,  255,  307,  938,  817,  816,
			  256,  819,  111,  256,  840,  111,  822,  823,  818,  822,
			  821,  823,  823,  824,  938,  952,  825,  822,  938,  952,
			  952,  820,  715,  826,  826,  826,  826,  826,  823,  952,
			  824,  952,  841,  825,  254,  255,  952,  952,  821,  823,
			  952,  824,  938,  307,  825,  717,  827,  827,  827,  827,

			  827,  295,  636,  828,  637,  637,  637,  637,  295,  829,
			  830,  830,  830,  830,  830,  831,  831,  831,  831,  831,
			  831,  721,  832,  832,  832,  832,  832,  254,  255,  254,
			  255,  254,  255,  952,  952,  952,  307,  952,  307,  952,
			  307,  807,  807,  807,  807,  807,  807,  952,  838,  842,
			  836,  847,  847,  847,  847,  847,  847,  848,  848,  848,
			  848,  848,  848,  606,  606,  606,  606,  606,  606,  849,
			  849,  849,  849,  849,  849,  952,  839,  844,  837,  850,
			  850,  850,  850,  850,  850,  952,  952,  952,  254,  255,
			  599,  851,  851,  851,  851,  851,  851,  256,  952,  111, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  254,  255,  952,  254,  255,  952,  904,  760,  904,  256,
			  853,  111,  256,  952,  111,  254,  255,  905,  254,  255,
			  952,  857,  254,  255,  256,  857,  111,  256,  922,  111,
			  391,  256,  854,  111,  855,  760,  858,  857,  853,  922,
			  858,  859,  857,  858,  952,  906,  952,  860,  952,  922,
			  254,  255,  952,  857,  856,  952,  952,  858,  859,  256,
			  854,  111,  855,  952,  860,  952,  952,  922,  858,  859,
			  945,  946,  945,  946,  779,  860,  826,  826,  826,  826,
			  826,  826,  856,  781,  952,  827,  827,  827,  827,  827,
			  827,  295,  783,  952,  637,  637,  637,  637,  637,  637,

			  295,  785,  952,  830,  830,  830,  830,  830,  830,  947,
			  952,  254,  255,  780,  829,  829,  829,  829,  829,  829,
			  307,  788,  782,  832,  832,  832,  832,  832,  832,  254,
			  255,  784,  868,  868,  868,  868,  868,  868,  307,  952,
			  787,  952,  952,  862,  952,  952,  254,  255,  864,  805,
			  805,  805,  805,  805,  805,  256,  810,  111,  810,  952,
			  789,  850,  850,  850,  850,  850,  850,  952,  952,  952,
			  952,  863,  952,  952,  254,  255,  865,  851,  851,  851,
			  851,  851,  851,  256,  952,  111,  952,  952,  599,  254,
			  255,  952,  952,  871,  952,  812,  254,  255,  256,  952,

			  111,  254,  255,  952,  952,  256,  952,  111,  254,  255,
			  256,  952,  111,  254,  255,  254,  255,  307,  952,  939,
			  952,  871,  307,  952,  307,  872,  952,  873,  885,  885,
			  885,  885,  885,  885,  254,  255,  939,  874,  254,  255,
			  939,  254,  255,  256,  879,  111,  881,  256,  765,  111,
			  256,  952,  111,  952,  872,  873,  254,  255,  952,  952,
			  952,  891,  889,  952,  939,  256,  874,  111,  952,  892,
			  888,  952,  952,  880,  882,  895,  895,  895,  895,  895,
			  895,  952,  892,  812,  812,  812,  812,  812,  812,  952,
			  889,  896,  896,  896,  896,  896,  896,  892,  888,  254,

			  255,  952,  254,  255,  765,  952,  952,  952,  256,  952,
			  111,  256,  930,  111,  930,  952,  952,  900,  952,  952,
			  952,  898,  952,  931,  907,  901,  908,  909,  952,  896,
			  896,  896,  896,  896,  896,  897,  952,  952,  901,  254,
			  255,  914,  914,  914,  914,  914,  914,  952,  256,  898,
			  111,  932,  952,  901,  916,  916,  916,  916,  916,  916,
			  952,  952,  952,  952,  897,  952,  952,  910,  919,  919,
			  919,  919,  919,  919,  254,  255,  924,  924,  924,  924,
			  924,  924,  952,  256,  952,  111,  925,  925,  925,  925,
			  925,  925,  952,  920,  952,  910,  916,  916,  916,  916,

			  916,  916,  916,  916,  916,  916,  916,  916,  907,  927,
			  908,  926,  917,  919,  919,  919,  919,  919,  919,  952,
			  927,  920,  928,  929,  929,  929,  929,  929,  929,  952,
			  927,  952,  952,  928,  933,  933,  933,  933,  933,  933,
			  952,  952,  952,  928,  952,  952,  952,  952,  927,  906,
			  906,  906,  906,  906,  906,  936,  936,  936,  936,  936,
			  936,  928,  937,  937,  937,  937,  937,  907,  952,  908,
			  952,  952,  933,  933,  933,  933,  933,  933,  940,  940,
			  940,  940,  940,  940,  941,  941,  941,  941,  941,  941,
			  942,  943,  944,  944,  944,  944,  944,  944,  932,  932,

			  932,  932,  932,  932,  952,  952,  952,  942,  943,  952,
			  952,  942,  943,  948,  948,  948,  948,  948,  948,  949,
			  949,  949,  949,  949,  949,  950,  950,  950,  950,  950,
			  950,  952,  945,  952,  945,  942,  943,  949,  949,  949,
			  949,  949,  949,  951,  951,  951,  951,  951,  951,  947,
			  947,  947,  947,  947,  947,  300,  300,  300,  300,  300,
			  300,  300,  300,  300,  952,  952,  952,  952,  952,  952,
			  952,  947,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   93,   93,  952,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,  952,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   95,   95,
			  952,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			  102,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  952,  952,  952,  952,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  110,  110,  110,  110,  952,  110,  110,
			  110,  110,  110,  952,  952,  952,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  143,  143,  952,  143,  952,
			  143,  143,  143,  952,  952,  143,  143,  143,  143,  143,
			  952,  952,  952,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  146,  146,  952,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,

			  146,  146,  146,  146,  206,  206,  952,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  952,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  226,  952,  226,  952,  952,  952,  952,  226,  952,  226,
			  226,  226,  952,  952,  226,  226,  226,  226,  226,  952,
			  952,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  233,  233,  952,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  102,  102,  102,  102,  952, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  952,  102,  102,  102,  102,  102,  102,  952,  952,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  257,  952,
			  952,  257,  257,  257,  257,  257,  257,  257,  257,  257,
			  257,  952,  952,  952,  257,  257,  257,  257,  257,  257,
			  257,  257,  257,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  952,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  397,  397,  397,
			  952,  952,  397,  397,  397,  397,  397,  952,  952,  952,
			  397,  397,  397,  397,  397,  397,  397,  397,  397,  398,
			  398,  398,  952,  952,  398,  398,  398,  398,  398,  952,
			  952,  952,  398,  398,  398,  398,  398,  398,  398,  398,
			  398,  300,  300,  300,  300,  952,  952,  300,  300,  300,
			  300,  300,  300,  952,  952,  300,  300,  300,  300,  300,
			  300,  300,  300,  300,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,  369,  369,

			  369,  369,  369,  369,  369,  369,  508,  508,  508,  508,
			  508,  952,  952,  952,  508,  508,  508,  508,  508,  508,
			  508,  508,  508,  442,  442,  442,  952,  952,  442,  442,
			  442,  442,  442,  442,  442,  442,  952,  952,  442,  442,
			  442,  442,  442,  952,  952,  952,  442,  442,  442,  442,
			  442,  442,  442,  442,  442,  608,  608,  608,  608,  608,
			  952,  952,  952,  608,  608,  608,  608,  608,  608,  608,
			  608,  608,  609,  609,  609,  952,  952,  609,  609,  609,
			  609,  609,  952,  952,  952,  609,  609,  609,  609,  609,
			  609,  609,  609,  609,  695,  695,  695,  952,  952,  695,

			  695,  695,  695,  695,  952,  952,  952,  695,  695,  695,
			  695,  695,  695,  695,  695,  695,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  814,  814,  814,  814,  814,  952,  952,
			  952,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  791,  791,  791,  791,  952,  952,  791,  791,  791,  791,
			  791,  791,  952,  952,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  792,  792,  792,  792,  952,  952,  792,
			  792,  792,  792,  792,  792,  952,  952,  792,  792,  792,

			  792,  792,  792,  792,  792,  792,  803,  803,  803,  803,
			  952,  952,  803,  803,  803,  803,  803,  803,  952,  952,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  804,
			  804,  804,  804,  952,  952,  804,  804,  804,  804,  804,
			  804,  952,  952,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  852,  852,  852,  952,  952,  852,  852,  852,
			  852,  852,  952,  952,  952,  852,  852,  852,  852,  852,
			  852,  852,  852,  852,  886,  886,  886,  952,  952,  886,
			  886,  886,  886,  886,  952,  952,  952,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,    9,  952,  952,  952,

			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952, yy_Dummy>>,
			1, 589, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5588)
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
			    1,    1,    1,    3,    5,   16,    6,    3,    4,  502,

			  502,   11,    4,   11,   11,   23,   74,   23,   23,   23,
			   23,   23,   23,   25,   33,   25,   34,   25,   25,   25,
			   25,   25,   25,   33,   34,   39,   45,   33,   40,   33,
			    5,    5,    6,    6,   35,   41,   39,   45,   35,   41,
			   16,   59,   40,   40,    3,   45,   49,   35,   40,    4,
			  928,   33,   34,   74,   49,   33,   25,   33,   72,  230,
			   72,   72,  230,  927,   39,   45,   35,   41,  918,   59,
			   40,   40,  908,   45,  232,   35,   40,  232,    3,    3,
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
			   26,   37,   26,   42,   26,   26,   26,   26,   26,   26,
			   57,   43,   38,   47,   37,  307,   38,   43,  900,   42,

			   67,   57,  307,   48,   61,   37,   46,   62,   38,   47,
			   43,   90,  434,   90,   90,  434,   76,   85,   57,   78,
			   85,   46,   37,   26,   38,   43,   46,   42,   48,   67,
			   57,   66,   61,  899,   37,   62,   38,   47,   43,   44,
			   44,   44,   44,   44,   44,   44,   54,   54,   44,   46,
			   63,   54,   58,   54,   46,   44,   55,   48,   64,   66,
			  153,   55,   44,   63,   58,   55,   64,   55,  434,   44,
			   85,   44,  145,   44,   54,   54,   60,   60,   63,   54,
			   58,   54,   60,   44,   55,  203,   64,   54,  153,   55,
			   44,   63,   58,   55,   64,   55,   76,   60,   78,   78,

			   44,   55,   44,   53,   60,   60,   53,  156,   75,  145,
			   60,   53,  870,   77,  203,  156,   79,  860,   53,   53,
			   53,   53,   53,   53,   53,   53,  360,  154,  155,  162,
			  848,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,  154,  155,  162,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   56,  852,  852,   56,   75,   75,   75,  846,
			   56,   77,   77,   77,   79,   79,   79,   56,   56,   56,

			   56,   56,   56,   56,   56,  845,  360,  835,  164,  834,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   80,   82,  164,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   65,   83,  366,   87,  535,   65,   87,  535,  165,
			   80,   80,   82,   82,  110,  110,   87,   87,   88,  102,
			  805,   88,  789,  110,  247,  110,  168,   87,  148,   65,
			   88,  148,  247,   97,   65,  787,  148,  165,   83,   83,

			  366,   88,   97,   97,   97,   97,   97,   97,  100,  100,
			  100,  100,  100,  100,  168,  102,  172,   87,  103,  103,
			  103,  103,  103,  103,  100,  104,  104,  104,  104,  104,
			  104,   88,  106,  106,  106,  106,  106,  106,   97,  122,
			  122,  104,  157,  157,  172,  177,  177,  100,  122,  714,
			  122,  157,  100,   97,  177,  173,  105,   97,  105,   97,
			  105,  105,  105,  105,  105,  105,  105,  357,  107,  104,
			  107,  144,  107,  107,  107,  107,  107,  107,  112,  112,
			  398,  113,  113,  173,  114,  114,  178,  112,  398,  112,
			  113,  444,  113,  114,  506,  114,  357,  115,  115,  105,

			  179,  713,  114,  169,  185,  113,  115,  144,  115,  169,
			  112,  107,  116,  116,  178,  158,  158,  115,  118,  118,
			  444,  116,  144,  116,  158,  117,  117,  118,  179,  118,
			  114,  169,  185,  113,  117,  506,  117,  169,  112,  119,
			  119,  208,  116,  208,  208,  115,  187,  158,  119,  118,
			  119,  189,  117,  712,  120,  120,  119,  121,  121,  711,
			  123,  123,  119,  120,  862,  120,  121,  190,  121,  123,
			  116,  123,  124,  124,  187,  158,  695,  118,  120,  189,
			  117,  124,  300,  124,  119,  125,  125,  121,  123,  124,
			  119,  126,  126,  862,  125,  190,  125,  193,  127,  127,

			  126,  194,  126,  128,  128,  441,  120,  127,  691,  127,
			  129,  129,  128,  441,  128,  121,  123,  124,  300,  129,
			  128,  129,  685,  126,  683,  193,  552,  125,  129,  194,
			  127,  198,  131,  131,  131,  132,  132,  132,  138,  138,
			  216,  131,  650,  219,  132,  866,  132,  138,  128,  138,
			  131,  126,  133,  133,  133,  649,  129,  131,  127,  198,
			  201,  133,  595,  133,  131,  552,  131,  132,  131,  647,
			  133,  138,  184,  184,  866,  302,  216,  216,  131,  219,
			  219,  184,  159,  159,  133,  131,  133,  241,  201,  241,
			  241,  159,  556,  196,  196,  131,  626,  131,  133,  138,

			  556,  595,  196,  302,  161,  161,  159,  161,  161,  161,
			  161,  161,  161,  161,  184,  133,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  196,  134,  135,  135,
			  135,  136,  136,  136,  159,  575,  303,  135,  134,  135,
			  136,  134,  136,  575,  139,  139,  135,  134,  220,  136,
			  160,  160,  609,  139,  196,  139,  136,  791,  601,  160,
			  135,  137,  137,  136,  303,  136,  134,  139,  160,  134,
			  137,  139,  137,  792,  135,  134,  591,  136,  140,  140,
			  137,  163,  163,  137,  136,  220,  220,  140,  313,  140,
			  163,  141,  141,  791,  136,  139,  160,  140,  857,  139, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  141,  163,  141,  142,  142,  625,  166,  166,  137,  792,
			  212,  137,  142,  625,  142,  166,  313,  167,  167,  182,
			  182,  141,  170,  170,  315,  140,  167,  213,  182,  163,
			  549,  170,  174,  174,  171,  171,  166,  175,  175,  142,
			  857,  174,  547,  171,  167,  316,  175,  182,  319,  141,
			  803,  171,  315,  170,  546,  197,  174,  171,  225,  197,
			  536,  225,  192,  192,  166,  183,  183,  175,  142,  151,
			  151,  192,  167,  316,  183,  182,  319,  518,  151,  171,
			  192,  170,  183,  197,  174,  171,  803,  197,  212,  212,
			  212,  495,  214,  181,  181,  175,  181,  181,  181,  181,

			  181,  181,  181,  215,  715,  213,  213,  213,  192,  211,
			  183,  225,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  186,  186,  188,  188,  191,
			  191,  195,  195,  715,  186,  893,  188,  487,  191,  400,
			  195,  901,  199,  199,  200,  200,  191,  202,  202,  901,
			  195,  199,  222,  200,  397,  721,  202,  186,  320,  188,
			  214,  214,  214,  200,  893,  199,  204,  204,  321,  199,
			  325,  215,  215,  215,  191,  204,  226,  202,  195,  226,
			  211,  211,  211,  211,  211,  186,  320,  188,  226,  222,

			  222,  200,  229,  199,  721,  229,  321,  199,  325,  226,
			  372,  372,  204,  372,  229,  202,  236,  236,  236,  236,
			  236,  236,  236,  387,  244,  229,  244,  260,  260,  244,
			  244,  244,  244,  244,  244,  386,  260,  374,  260,  226,
			  369,  204,  245,  245,  245,  245,  245,  245,  248,  248,
			  248,  248,  248,  248,  368,  229,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  243,  243,
			  243,  243,  243,  243,  249,  249,  249,  249,  249,  249,
			  310,  310,  330,  331,  243,  351,  250,  332,  250,  310,
			  249,  250,  250,  250,  250,  250,  250,  251,  333,  251,
			  326,  251,  251,  251,  251,  251,  251,  243,  340,  340,
			  330,  331,  243,  249,  306,  332,  724,  340,  249,  252,

			  252,  252,  252,  252,  253,  253,  253,  253,  253,  253,
			  258,  258,  305,  259,  259,  301,  261,  261,  295,  258,
			  251,  258,  259,  804,  259,  261,  337,  261,  341,  258,
			  262,  262,  257,  263,  263,  724,  264,  264,  256,  262,
			  259,  262,  263,  261,  263,  264,  269,  264,  262,  265,
			  265,  269,  268,  268,  337,  264,  341,  258,  265,  804,
			  265,  268,  269,  268,  263,  246,  266,  266,  259,  267,
			  267,  261,  269,  265,  342,  266,  262,  266,  267,  240,
			  267,  886,  886,  264,  270,  270,  239,  271,  271,  238,
			  269,  345,  263,  270,  268,  270,  271,  266,  271,  346,

			  267,  265,  342,  272,  272,  237,  273,  273,  270,  274,
			  274,  271,  272,  349,  272,  273,  235,  273,  274,  345,
			  274,  373,  373,  273,  373,  266,  272,  346,  267,  275,
			  275,  350,  228,  276,  276,  223,  270,  221,  275,  271,
			  275,  349,  276,  751,  276,  218,  278,  278,  206,  328,
			  328,  273,  276,  443,  272,  278,  829,  278,  328,  350,
			  279,  279,  275,  279,  279,  279,  279,  279,  279,  279,
			  180,  279,  282,  282,  282,  282,  282,  282,  278,  451,
			  276,  443,  751,  176,  284,  284,  284,  284,  284,  284,
			  275,  328,  279,  280,  280,  829,  280,  280,  280,  280,

			  280,  280,  280,  284,  280,  281,  281,  451,  281,  281,
			  281,  281,  281,  281,  281,  283,  281,  283,  283,  285,
			  285,  285,  359,  338,  338,  280,  152,  453,  285,  149,
			  285,  284,  338,  286,  286,  286,  146,  281,  283,  454,
			  338,  283,  286,  143,  286,  287,  287,  283,  288,  288,
			  285,  289,  289,  361,  287,  453,  287,  288,  382,  288,
			  289,  458,  289,  290,  290,  438,  283,  454,  338,  283,
			  289,  287,  290,  438,  290,  283,  291,  291,  285,  292,
			  292,  382,  293,  293,  130,  291,  382,  291,  292,  458,
			  292,  293,  290,  293,  294,  294,   99,   98,  289,  287,

			  359,  359,  359,  294,  438,  294,  291,  296,  296,  296,
			  296,  296,  296,  296,  312,  312,  312,  312,  312,  312,
			  290,  292,  297,  297,  297,  297,  297,  297,  297,   95,
			  294,  361,  361,  361,  291,  298,  298,  298,  298,  298,
			  298,  298,  308,  308,  309,  309,  314,  314,  318,  318,
			  459,  308,  463,  309,   93,  314,  464,  318,   91,  294,
			  311,  308,  311,  311,  311,  311,  311,  311,  317,  317,
			  466,  309,   86,  314,  322,  322,   71,  317,  459,  318,
			  463,  323,  323,  322,  464,  467,  317,  324,  324,  308,
			  323,  327,  327,  322,   68,  468,  324,  329,  466,  309,

			  327,  314,  335,  335,  329,  323,   52,  318,  362,  329,
			   36,  335,   31,  467,  317,  363,  336,  336,  324,  364,
			  329,  322,  327,  468,   29,  336,  335,  365,   24,   22,
			  329,  472,  334,  323,  334,  334,  334,  334,  334,  334,
			  336,  411,  343,  343,  344,  344,  324,   14,  329,   13,
			  327,  343,  411,  344,  335,  347,  347,  348,  348,  472,
			  352,  352,  411,  344,  347,   12,  348,    9,  336,  352,
			  353,  353,    0,  354,  354,  343,  348,  356,  356,  353,
			  411,  347,  354,  358,  358,  859,  356,  362,  362,  352,
			  474,  344,  358,  363,  363,  363,  859,  364,  364,  364,

			  353,    0,  475,  343,  348,  365,  365,  365,  636,  347,
			  370,  370,    0,  370,    0,  354,  636,  352,  474,  358,
			  406,  406,  370,  460,  460,    0,    0,  859,  353,  406,
			  475,  406,  460,  370,  377,  377,  377,  377,  377,  377,
			  377,  383,  383,  383,  383,  383,  383,  636,  358,  384,
			  384,  384,  384,  384,  384,  385,  385,  385,  385,  385,
			  385,  482,    0,  370,  388,  388,  388,  388,  388,  388,
			  389,  389,  389,  389,  389,  389,  391,  391,  391,  391,
			  391,  391,  483,  559,    0,  390,  389,  390,  384,  482,
			  390,  390,  390,  390,  390,  390,  392,  392,  392,  392, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  392,  392,  393,  393,  393,  393,  393,  393,    0,  389,
			  483,  559,  394,  394,  389,  394,  394,  394,  394,  394,
			  394,  395,  395,  395,  395,  395,  395,  396,  396,  396,
			  396,  396,  396,  401,  401,    0,  402,  402,  561,  403,
			  403,  393,  401,    0,  401,  402,    0,  402,  403,    0,
			  403,  404,  404,  562,    0,    0,  405,  405,  565,    0,
			  404,  570,  404,  401,    0,  405,  561,  405,  484,  403,
			  402,  407,  407,    0,  404,  405,  408,  408,    0,  484,
			  407,  562,  407,  410,  410,  408,  565,  408,    0,  570,
			  572,  401,  410,    0,  410,    0,  484,  403,  410,  402,

			  409,  409,  404,  405,  407,  412,  412,  484,  408,  409,
			    0,  409,  413,  413,  412,  428,  412,    0,  572,  409,
			  428,  413,    0,  413,  414,  414,  410,  573,  412,  415,
			  415,  428,  407,  414,    0,  414,  408,  505,  415,  505,
			  415,  428,  418,    0,  579,  413,    0,  409,  505,  529,
			  414,  415,  416,  416,    0,  573,  412,  417,  417,  428,
			  529,  416,  418,  416,  581,  418,  417,  582,  417,    0,
			  529,  418,  579,  413,  426,  426,  505,    0,  414,  415,
			  427,  427,  416,  426,  585,  426,  586,  417,  529,  427,
			  418,  427,  581,  418,    0,  582,    0,  429,  429,  418,

			  419,  419,  419,  419,  419,  419,  429,  587,  429,  588,
			  416,    0,  585,  618,  586,  417,  420,  420,  420,  420,
			  420,  420,  419,  421,  421,  421,  421,  421,  421,  644,
			  618,  653,  657,  419,  618,  587,    0,  588,  420,  422,
			  422,  422,  422,  422,  422,  462,  462,  420,    0,  420,
			  419,    0,  433,  433,  462,    0,  421,  644,  618,  653,
			  657,  433,  419,  433,  430,  430,  420,  423,  423,  423,
			  423,  423,  423,  430,    0,  430,  420,  462,  420,  424,
			  424,  424,  424,  424,  424,  421,  425,  425,  425,  425,
			  425,  425,  658,    0,  424,  431,  431,  430,  455,  455,

			  663,  425,  447,  447,  431,  462,  431,  455,  432,  432,
			    0,  447,    0,  431,    0,  480,  480,  432,    0,  432,
			  658,  455,  424,  432,  480,  430,    0,    0,  663,  425,
			    0,  664,  447,  665,  432,  445,  445,  445,  445,  445,
			  445,  431,  435,  435,  435,  435,  435,  435,  435,  455,
			  436,  432,  436,  436,  436,  436,  436,  436,  436,  664,
			  447,  665,  432,  437,  437,  437,  437,  437,  437,  437,
			  439,    0,  439,  439,  439,  439,  439,  439,  439,  440,
			    0,  440,  440,  440,  440,  440,  440,  440,    0,  436,
			  446,  446,  446,  446,  446,  446,  448,  448,  449,  449,

			  449,  449,  449,  449,  668,  448,  670,  452,  452,  439,
			  450,  450,  450,  450,  450,  450,  452,    0,  440,  456,
			  456,    0,  461,  461,  465,  465,  481,  481,  456,  671,
			  448,  461,  668,  465,  670,  481,    0,  452,  456,    0,
			    0,  470,  470,  465,  469,  469,  469,  469,  469,  469,
			  470,  471,  471,  473,  473,  461,    0,  671,    0,  448,
			  471,    0,  473,  675,  470,  452,  456,  476,  476,  477,
			  477,  465,  485,  485,    0,  473,  476,    0,  477,  488,
			  488,  485,    0,  461,  471,    0,  486,  486,  488,  509,
			  509,  675,  470,  554,  554,  486,    0,  476,  509,  477,

			  509,  676,  554,  473,  486,  485,  490,  490,  490,  490,
			  490,  490,  471,  491,  491,  491,  491,  491,  491,  492,
			  492,  492,  492,  492,  492,  476,    0,  477,    0,  676,
			    0,    0,  486,  485,  493,  493,  493,  493,  493,  493,
			  605,  605,  605,  605,  605,  490,  494,  494,  494,  494,
			  494,  494,  496,  496,  496,  496,  496,  496,  497,  497,
			  497,  497,  497,  497,  677,  689,    0,    0,  496,  498,
			  498,  498,  498,  498,  498,  499,  499,  499,  499,  499,
			  499,  500,  500,  500,  500,  500,  500,    0,  689,    0,
			  723,  496,  677,  689,  510,  510,  496,  501,  501,  501,

			  501,  501,  501,  510,    0,  510,  512,  512,  498,  503,
			  503,  503,  503,  503,  503,  512,    0,  512,  723,  504,
			  500,  504,  504,  504,  504,  504,  504,  730,  511,  511,
			    0,    0,  512,  513,  513,    0,  510,  511,  534,  511,
			    0,  566,  513,    0,  513,  514,  514,  511,    0,  534,
			  701,  513,  733,  566,  514,  730,  514,  515,  515,  534,
			  512,  516,  516,  514,  743,  747,  515,  701,  515,  566,
			  516,  701,  516,  517,  517,  511,  515,  534,    0,  513,
			  733,  566,  517,    0,  517,  520,  520,    0,  515,  519,
			  519,  514,  743,  747,  520,  701,  520,  517,  519,  748,

			  519,  521,  521,  520,  515,  749,  571,  571,  519,  790,
			  521,  717,  521,  522,  522,  571,  515,  523,  523,  717,
			    0,    0,  522,    0,  522,  517,  523,  748,  523,  524,
			  524,  520,  522,  749,    0,    0,  519,  790,  524,    0,
			  524,  525,  525,  525,  525,  525,  525,  523,  524,  526,
			  717,  526,  526,  526,  526,  526,  526,  526,  652,  652,
			  522,  528,  528,  528,  528,  528,  528,  652,    0,  525,
			  793,  530,  530,  795,    0,  523,  524,  531,  531,  526,
			  530,    0,  530,  528,  555,  555,  531,    0,  531,    0,
			  530,  532,  532,  555,  610,  610,  531,  525,  793,    0,

			  532,  795,  532,  610,  797,  610,    0,  526,  527,  610,
			  527,  528,  527,  527,  527,  527,  527,  527,  530,  533,
			  533,  532,  560,  560,  531,    0,  555,  527,  533,    0,
			  533,  560,  797,  631,  527,  799,    0,  610,  656,  656,
			  527,  560,  611,  611,  631,    0,  533,  656,    0,  532,
			    0,  611,    0,  611,  631,  527,  551,  551,  551,  551,
			  551,  551,  527,  799,  662,  662,    0,    0,  527,  560,
			    0,    0,  631,  662,  533,  537,  537,  537,  537,  537,
			  537,  537,  538,  538,  538,  538,  538,  538,  538,  539,
			  539,  539,  539,  539,  539,  539,  540,  540,  540,  540,

			  540,  540,  540,  542,  542,  542,  542,  542,  542,  542,
			  544,  544,  544,  544,  544,  544,  544,  550,    0,  550,
			  550,  550,  550,  550,  550,  553,  718,  553,  553,  553,
			  553,  553,  553,  557,  718,  557,  557,  557,  557,  557,
			  557,  557,  558,  558,  558,  558,  558,  558,  563,  563,
			  564,  564,  567,  567,  568,  568,  550,  563,    0,  564,
			    0,  567,    0,  568,  553,  718,  800,    0,  564,    0,
			  567,    0,  833,  568,  563,  576,    0,  576,  576,  576,
			  576,  576,  576,  576,    0,  568,  577,  577,  578,  578,
			  580,  580,    0,    0,  800,  577,  564,  578,  567,  580, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  833,  568,  563,  584,  584,  577,  578,  589,  589,  580,
			  583,  583,  584,  568,  613,  613,  589,    0,    0,  583,
			  590,  590,  584,  613,  836,  613,  589,  616,  616,  590,
			  867,  867,  867,  577,  578,    0,  616,  580,  616,  590,
			  583,  592,  592,  592,  592,  592,  592,    0,    0,    0,
			  584,    0,  836,  593,  589,  593,  593,  593,  593,  593,
			  593,  594,  594,  594,  594,  594,  594,  590,  583,  596,
			    0,  596,  596,  596,  596,  596,  596,  597,  597,  597,
			  597,  597,  597,  598,  598,  598,  598,  598,  598,    0,
			    0,    0,  593,  597,  599,  599,  599,  599,  599,  599,

			  600,  600,  600,  600,  600,  600,    0,    0,  596,  602,
			  602,  602,  602,  602,  602,  603,  603,  603,  603,  603,
			  603,  597,  598,  604,  604,  604,  604,  604,  604,  607,
			  607,  607,  607,  607,  607,  612,  612,  840,  614,  614,
			    0,    0,  615,  615,  612,  607,  612,  614,    0,  614,
			  612,  615,    0,  615,    0,  617,  617,  614,  619,  619,
			  843,  620,  620,  861,  617,  840,  617,  619,  615,  619,
			  620,  864,  620,  607,    0,  621,  621,  878,  612,  617,
			  620,  622,  622,    0,  621,  614,  621,    0,  843,  619,
			  622,  861,  622,  623,  623,    0,  615,  883,    0,  864,

			  622,    0,  623,    0,  623,  878,  621,  617,  620,  627,
			  627,  623,  628,  628,  707,  629,  629,  619,  627,  632,
			  627,  628,  894,  628,  629,  883,  629,  633,  622,  630,
			  630,  707,  629,  632,  621,  707,  655,  655,  630,  623,
			  630,  633,  628,  902,  632,  655,    0,  630,  678,  678,
			  894,  655,  633,  875,  632,    0,    0,  678,    0,  707,
			  629,  875,  633,  634,  634,  634,  634,  634,  634,    0,
			  628,  902,  632,    0,  875,  630,    0,    0,    0,  655,
			  633,  635,  635,  635,  635,  635,  635,  635,  637,  875,
			  637,  637,  637,  637,  637,  637,  637,  638,  638,  638,

			  638,  638,  638,  638,  639,  639,  639,  639,  639,  639,
			  639,  640,    0,  640,  640,  640,  640,  640,  640,  640,
			  642,  642,  642,  642,  642,  642,  641,  637,  641,  641,
			  641,  641,  641,  641,  641,  643,  643,  643,  643,  643,
			  643,  645,  645,  645,  645,  645,  645,    0,  913,    0,
			  640,  646,  646,  646,  646,  646,  646,  648,  648,  648,
			  648,  648,  648,  660,  660,  641,  661,  661,  666,  666,
			  667,  667,  660,    0,    0,  661,  913,  666,    0,  667,
			    0,    0,  660,  876,  669,  669,  672,  672,    0,  667,
			    0,  876,  661,  669,    0,  672,    0,  698,  698,  666,

			  673,  673,  679,  679,  876,  672,  698,    0,  698,  673,
			  660,  679,    0,    0,    0,  669,    0,  667,  673,  876,
			  661,  680,  680,  680,  680,  680,  680,  666,  761,  761,
			  761,  761,  679,  672,  681,  681,  681,  681,  681,  681,
			    0,    0,    0,  669,    0,    0,  673,  682,  682,  682,
			  682,  682,  682,  684,  684,  684,  684,  684,  684,  686,
			  679,  686,    0,    0,  686,  686,  686,  686,  686,  686,
			  687,  687,  687,  687,  687,  687,  688,  688,  688,  688,
			  688,  688,  690,  690,  690,  690,  690,  690,  692,  692,
			  692,  692,  692,  692,  693,  693,  693,  693,  693,  693,

			  694,  694,  694,  694,  694,  694,  696,  696,    0,  687,
			  697,  697,  911,  699,  699,  696,  694,  696,    0,  697,
			    0,  697,  699,  911,  699,    0,  700,  700,    0,    0,
			  699,  702,  702,  911,  697,  700,  696,  700,    0,  694,
			  702,    0,  702,    0,  694,  703,  703,    0,  704,  704,
			    0,  911,  705,  705,  703,    0,  703,  704,  699,  704,
			    0,  705,  697,  705,  696,  706,  706,  890,  708,  708,
			    0,  709,  709,    0,  706,  890,  706,  708,  705,  708,
			  709,    0,  709,  710,  710,    0,    0,  708,  890,    0,
			    0,    0,  710,  709,  710,  720,  720,  720,  720,  720,

			  720,    0,  710,  890,    0,  716,  705,  716,  716,  716,
			  716,  716,  716,    0,    0,  708,    0,    0,    0,    0,
			  719,  709,  719,  719,  719,  719,  719,  719,    0,  722,
			  710,  722,  722,  722,  722,  722,  722,  726,  726,  726,
			  726,  726,  726,  725,  716,  725,  725,  725,  725,  725,
			  725,  728,    0,  728,  728,  728,  728,  728,  728,  719,
			  731,  731,  734,  734,  735,  735,  739,  739,  722,  731,
			    0,  734,  891,  735,    0,  739,  740,  740,  742,  742,
			  891,  735,  725,    0,  731,  740,    0,  742,  745,  745,
			  728,  746,  746,  891,  750,  750,    0,  745,  839,  839,

			  746,  844,  844,  750,    0,    0,    0,  839,  891,  735,
			  844,    0,  731,  750,  745,  752,    0,  752,  752,  752,
			  752,  752,  752,  753,  753,  753,  753,  753,  753,  755,
			    0,  755,  755,  755,  755,  755,  755,    0,    0,    0,
			    0,  750,  745,  757,  757,  757,  757,  757,  757,  763,
			  763,  763,  763,    0,  752,  758,  758,  758,  758,  758,
			  758,  759,  759,  759,  759,  759,  759,  760,  755,  760,
			    0,    0,  760,  760,  760,  760,  760,  760,  762,  762,
			  762,  762,  762,  762,    0,    0,  766,  766,  763,  764,
			  764,  764,  764,  764,  764,  766,    0,  766,  767,  767,

			    0,  768,  768,  766,    0,  764,  771,  767,    0,  767,
			  768,    0,  768,  770,  770,  905,  905,  905,  905,  905,
			  768,  767,  770,  771,  770,  772,  772,  771,  764,    0,
			  770,  766,    0,  764,  772,  775,  772,  798,  798,  775,
			    0,  773,  773,  772,  774,  774,  798,  934,  768,  767,
			  773,  771,  773,  774,  798,  774,  775,  776,  770,  777,
			  773,  776,  778,  777,  934,    0,  778,  775,  934,    0,
			    0,  772,  779,  779,  779,  779,  779,  779,  776,    0,
			  777,    0,  798,  778,  880,  880,    0,    0,  773,  776,
			    0,  777,  934,  880,  778,  781,  781,  781,  781,  781,

			  781,  781,  783,  783,  783,  783,  783,  783,  783,  785,
			  785,  785,  785,  785,  785,  786,  786,  786,  786,  786,
			  786,  788,  788,  788,  788,  788,  788,  794,  794,  796,
			  796,  802,  802,    0,    0,    0,  794,    0,  796,    0,
			  802,  806,  806,  806,  806,  806,  806,    0,  796,  802,
			  794,  807,  807,  807,  807,  807,  807,  808,  808,  808,
			  808,  808,  808,  809,  809,  809,  809,  809,  809,  810,
			  810,  810,  810,  810,  810,    0,  796,  802,  794,  811,
			  811,  811,  811,  811,  811,    0,    0,    0,  815,  815,
			  807,  813,  813,  813,  813,  813,  813,  815,    0,  815, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  816,  816,    0,  817,  817,    0,  895,  813,  895,  816,
			  815,  816,  817,    0,  817,  818,  818,  895,  820,  820,
			    0,  822,  821,  821,  818,  822,  818,  820,  912,  820,
			  813,  821,  816,  821,  818,  813,  823,  824,  815,  912,
			  823,  824,  822,  825,    0,  895,    0,  825,    0,  912,
			  872,  872,    0,  822,  821,    0,    0,  823,  824,  872,
			  816,  872,  818,    0,  825,    0,    0,  912,  823,  824,
			  941,  941,  941,  941,  826,  825,  826,  826,  826,  826,
			  826,  826,  821,  827,    0,  827,  827,  827,  827,  827,
			  827,  827,  828,    0,  828,  828,  828,  828,  828,  828,

			  828,  830,    0,  830,  830,  830,  830,  830,  830,  941,
			    0,  837,  837,  826,  831,  831,  831,  831,  831,  831,
			  837,  832,  827,  832,  832,  832,  832,  832,  832,  841,
			  841,  828,  849,  849,  849,  849,  849,  849,  841,    0,
			  830,    0,    0,  837,    0,    0,  873,  873,  841,  847,
			  847,  847,  847,  847,  847,  873,  850,  873,  850,    0,
			  832,  850,  850,  850,  850,  850,  850,    0,    0,    0,
			    0,  837,    0,    0,  853,  853,  841,  851,  851,  851,
			  851,  851,  851,  853,    0,  853,    0,    0,  847,  854,
			  854,    0,    0,  853,    0,  850,  855,  855,  854,    0,

			  854,  856,  856,    0,    0,  855,    0,  855,  863,  863,
			  856,    0,  856,  882,  882,  865,  865,  863,    0,  935,
			    0,  853,  882,    0,  865,  854,    0,  855,  868,  868,
			  868,  868,  868,  868,  874,  874,  935,  856,  871,  871,
			  935,  898,  898,  874,  863,  874,  865,  871,  877,  871,
			  898,    0,  898,    0,  854,  855,  920,  920,    0,    0,
			    0,  877,  874,    0,  935,  920,  856,  920,    0,  877,
			  871,    0,    0,  863,  865,  884,  884,  884,  884,  884,
			  884,    0,  877,  885,  885,  885,  885,  885,  885,    0,
			  874,  887,  887,  887,  887,  887,  887,  877,  871,  888,

			  888,    0,  889,  889,  892,    0,    0,    0,  888,    0,
			  888,  889,  925,  889,  925,    0,    0,  892,    0,    0,
			    0,  889,    0,  925,  896,  892,  896,  896,    0,  896,
			  896,  896,  896,  896,  896,  888,    0,    0,  892,  897,
			  897,  904,  904,  904,  904,  904,  904,    0,  897,  889,
			  897,  925,    0,  892,  907,  907,  907,  907,  907,  907,
			    0,    0,    0,    0,  888,    0,    0,  897,  909,  909,
			  909,  909,  909,  909,  910,  910,  914,  914,  914,  914,
			  914,  914,    0,  910,    0,  910,  915,  915,  915,  915,
			  915,  915,    0,  910,    0,  897,  916,  916,  916,  916,

			  916,  916,  917,  917,  917,  917,  917,  917,  919,  921,
			  919,  919,  907,  919,  919,  919,  919,  919,  919,    0,
			  921,  910,  922,  924,  924,  924,  924,  924,  924,    0,
			  921,    0,    0,  922,  926,  926,  926,  926,  926,  926,
			    0,    0,    0,  922,    0,    0,    0,    0,  921,  929,
			  929,  929,  929,  929,  929,  930,  930,  930,  930,  930,
			  930,  922,  931,  931,  931,  931,  931,  933,    0,  933,
			    0,    0,  933,  933,  933,  933,  933,  933,  936,  936,
			  936,  936,  936,  936,  937,  937,  937,  937,  937,  937,
			  938,  939,  940,  940,  940,  940,  940,  940,  944,  944,

			  944,  944,  944,  944,    0,    0,    0,  938,  939,    0,
			    0,  938,  939,  945,  945,  945,  945,  945,  945,  946,
			  946,  946,  946,  946,  946,  948,  948,  948,  948,  948,
			  948,    0,  949,    0,  949,  938,  939,  949,  949,  949,
			  949,  949,  949,  950,  950,  950,  950,  950,  950,  951,
			  951,  951,  951,  951,  951,  969,  969,  969,  969,  969,
			  969,  969,  969,  969,    0,    0,    0,    0,    0,    0,
			    0,  949,  953,  953,  953,  953,  953,  953,  953,  953,
			  953,  953,  953,  953,  953,  953,  953,  953,  953,  953,
			  953,  953,  953,  953,  953,  953,  953,  953,  953,  953,

			  953,  953,  953,  953,  954,  954,  954,  954,  954,  954,
			  954,  954,  954,  954,  954,  954,  954,  954,  954,  954,
			  954,  954,  954,  954,  954,  954,  954,  954,  954,  954,
			  954,  954,  954,  954,  954,  954,  955,  955,    0,  955,
			  955,  955,  955,  955,  955,  955,  955,  955,  955,  955,
			  955,  955,  955,  955,  955,  955,  955,    0,  955,  955,
			  955,  955,  955,  955,  955,  955,  955,  955,  956,  956,
			    0,  956,  956,  956,  956,  956,  956,  956,  956,  956,
			  956,  956,  956,  956,  956,  956,  956,  956,  956,  956,
			  956,  956,  956,  956,  956,  956,  956,  956,  956,  956,

			  957,  981,  981,  981,  981,  981,  981,  981,  981,  981,
			    0,    0,    0,    0,  957,  957,  957,  957,  957,  957,
			  957,  957,  957,  958,  958,  958,  958,    0,  958,  958,
			  958,  958,  958,    0,    0,    0,  958,  958,  958,  958,
			  958,  958,  958,  958,  958,  959,  959,    0,  959,    0,
			  959,  959,  959,    0,    0,  959,  959,  959,  959,  959,
			    0,    0,    0,  959,  959,  959,  959,  959,  959,  959,
			  959,  959,  960,  960,    0,  960,  960,  960,  960,  960,
			  960,  960,  960,  960,  960,  960,  960,  960,  960,  960,
			  960,  960,  960,  960,  960,  960,  960,  960,  960,  960,

			  960,  960,  960,  960,  961,  961,    0,  961,  961,  961,
			  961,  961,  961,  961,  961,  961,  961,  961,  961,  961,
			  961,  961,  961,  961,  961,    0,  961,  961,  961,  961,
			  961,  961,  961,  961,  961,  961,  962,  962,  962,  962,
			  962,  962,  962,  962,  962,  962,  962,  962,  962,  962,
			  962,  962,  962,  962,  962,  962,  962,  962,  962,  962,
			  962,  962,  962,  962,  962,  962,  962,  962,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,

			  964,    0,  964,    0,    0,    0,    0,  964,    0,  964,
			  964,  964,    0,    0,  964,  964,  964,  964,  964,    0,
			    0,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  965,  965,    0,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  967,  967,  967,  967,    0, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  967,  967,  967,  967,  967,  967,    0,    0,  967,
			  967,  967,  967,  967,  967,  967,  967,  967,  968,    0,
			    0,  968,  968,  968,  968,  968,  968,  968,  968,  968,
			  968,    0,    0,    0,  968,  968,  968,  968,  968,  968,
			  968,  968,  968,  970,  970,  970,  970,  970,  970,  970,
			  970,  970,    0,  970,  970,  970,  970,  970,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  970,  970,  970,
			  970,  970,  970,  970,  970,  971,  971,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  971,

			  971,  971,  971,  971,  971,  971,  971,  972,  972,  972,
			    0,    0,  972,  972,  972,  972,  972,    0,    0,    0,
			  972,  972,  972,  972,  972,  972,  972,  972,  972,  973,
			  973,  973,    0,    0,  973,  973,  973,  973,  973,    0,
			    0,    0,  973,  973,  973,  973,  973,  973,  973,  973,
			  973,  974,  974,  974,  974,    0,    0,  974,  974,  974,
			  974,  974,  974,    0,    0,  974,  974,  974,  974,  974,
			  974,  974,  974,  974,  975,  975,  975,  975,  975,  975,
			  975,  975,  975,  975,  975,  975,  975,  975,  975,  975,
			  975,  975,  975,  975,  975,  975,  975,  975,  975,  975,

			  975,  975,  975,  975,  975,  975,  976,  976,  976,  976,
			  976,    0,    0,    0,  976,  976,  976,  976,  976,  976,
			  976,  976,  976,  977,  977,  977,    0,    0,  977,  977,
			  977,  977,  977,  977,  977,  977,    0,    0,  977,  977,
			  977,  977,  977,    0,    0,    0,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  978,  978,  978,  978,  978,
			    0,    0,    0,  978,  978,  978,  978,  978,  978,  978,
			  978,  978,  979,  979,  979,    0,    0,  979,  979,  979,
			  979,  979,    0,    0,    0,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  980,  980,  980,    0,    0,  980,

			  980,  980,  980,  980,    0,    0,    0,  980,  980,  980,
			  980,  980,  980,  980,  980,  980,  982,  982,  982,  982,
			  982,  982,  982,  982,  982,  983,  983,  983,  983,  983,
			  983,  983,  983,  983,  984,  984,  984,  984,  984,  984,
			  984,  984,  984,  985,  985,  985,  985,  985,    0,    0,
			    0,  985,  985,  985,  985,  985,  985,  985,  985,  985,
			  986,  986,  986,  986,    0,    0,  986,  986,  986,  986,
			  986,  986,    0,    0,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  987,  987,  987,  987,    0,    0,  987,
			  987,  987,  987,  987,  987,    0,    0,  987,  987,  987,

			  987,  987,  987,  987,  987,  987,  988,  988,  988,  988,
			    0,    0,  988,  988,  988,  988,  988,  988,    0,    0,
			  988,  988,  988,  988,  988,  988,  988,  988,  988,  989,
			  989,  989,  989,    0,    0,  989,  989,  989,  989,  989,
			  989,    0,    0,  989,  989,  989,  989,  989,  989,  989,
			  989,  989,  990,  990,  990,    0,    0,  990,  990,  990,
			  990,  990,    0,    0,    0,  990,  990,  990,  990,  990,
			  990,  990,  990,  990,  991,  991,  991,    0,    0,  991,
			  991,  991,  991,  991,    0,    0,    0,  991,  991,  991,
			  991,  991,  991,  991,  991,  991,  952,  952,  952,  952,

			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952, yy_Dummy>>,
			1, 589, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0, 1867,
			 5496,   99, 1862, 1822, 1840, 5496,   86, 5496, 5496, 5496,
			 5496, 5496, 1814,   89, 1811,   99,  266, 5496, 5496, 1797,
			 5496, 1785, 5496,   88,   90,  108, 1784,  255,  266,   99,
			  102,  109,  257,  265,  322,  100,  280,  267,  277,   88,
			 5496, 5496, 1750,  401,  312,  326,  480,  251,  322,  104,
			  336,  274,  265,  318,  321,  520,  289,  249, 1777, 5496,
			 5496, 1769,  156, 5496,   99,  401,  309,  406,  312,  409,
			  517, 5496,  518,  545, 5496,  315, 1769,  562,  576, 5496,
			  309, 1755, 5496, 1747, 5496, 1720,    0,  584, 1694, 1680,

			  590, 5496,  562,  600,  607,  642,  614,  654, 5496, 5496,
			  559,    0,  663,  666,  669,  682,  697,  710,  703,  724,
			  739,  742,  624,  745,  757,  770,  776,  783,  788,  795,
			 1601,  817,  820,  837,  901,  913,  916,  946,  823,  929,
			  963,  976,  988, 1619,  647,  348, 1580, 5496,  586, 1618,
			    0, 1054, 1609,  313,  388,  395,  349,  627,  700,  867,
			  935,  889,  394,  966,  463,  527,  991, 1002,  540,  671,
			 1007, 1019,  577,  610, 1017, 1022, 1559,  630,  643,  668,
			 1513, 1078, 1004, 1050,  857,  657, 1120,  699, 1122,  719,
			  734, 1124, 1047,  763,  753, 1126,  878, 1017,  797, 1137,

			 1139,  815, 1142,  334, 1161, 5496, 1541, 5496,  739, 5496,
			 5496, 1102, 1003, 1020, 1085, 1096,  823, 5496, 1491,  826,
			  931, 1482, 1145, 1481, 5496, 1056, 1184, 5496, 1529, 1200,
			  157, 1255,  172, 5496, 5496, 1507, 1199, 1496, 1480, 1477,
			 1470,  885, 5496, 1330, 1211, 1224, 1448,  526, 1230, 1336,
			 1353, 1363, 1381, 1386,    0,    0, 1414, 1404, 1395, 1398,
			 1212, 1401, 1415, 1418, 1421, 1434, 1451, 1454, 1437, 1422,
			 1469, 1472, 1488, 1491, 1494, 1514, 1518, 5496, 1531, 1545,
			 1578, 1590, 1554, 1601, 1566, 1604, 1618, 1630, 1633, 1636,
			 1648, 1661, 1664, 1667, 1679, 1394, 1689, 1704, 1717, 5496,

			  765, 1398,  841,  894,    0, 1337, 1333,  278, 1727, 1729,
			 1345, 1744, 1696,  946, 1731,  991,  999, 1753, 1733, 1014,
			 1129, 1132, 1759, 1766, 1772, 1134, 1323, 1776, 1534, 1780,
			 1323, 1324, 1329, 1362, 1816, 1787, 1801, 1394, 1608,    0,
			 1373, 1380, 1440, 1827, 1829, 1450, 1465, 1840, 1842, 1469,
			 1486, 1308, 1845, 1855, 1858,    0, 1862,  616, 1868, 1615,
			  419, 1646, 1801, 1808, 1812, 1820,  546, 5496, 1199, 1237,
			 1908, 5496, 1208, 1519, 1234, 5496, 5496, 1917, 5496, 5496,
			 5496, 5496, 1624, 1923, 1931, 1937, 1160, 1162, 1946, 1952,
			 1972, 1958, 1978, 1984, 1997, 2003, 2009, 1149,  664,    0,

			 1121, 2018, 2021, 2024, 2036, 2041, 1905, 2056, 2061, 2085,
			 2068, 1812, 2090, 2097, 2109, 2114, 2137, 2142, 2125, 2182,
			 2198, 2205, 2221, 2249, 2261, 2268, 2159, 2165, 2091, 2182,
			 2249, 2280, 2293, 2237,  310, 2324, 2334, 2345, 1649, 2354,
			 2363,  747,    0, 1508,  642, 2317, 2372, 2287, 2381, 2380,
			 2392, 1534, 2392, 1589, 1605, 2283, 2404,    0, 1613, 1703,
			 1908, 2407, 2230, 1718, 1726, 2409, 1732, 1737, 1754, 2426,
			 2426, 2436, 1794, 2438, 1845, 1857, 2452, 2454,    0,    0,
			 2300, 2411, 1913, 1949, 2038, 2457, 2471, 1132, 2464, 5496,
			 2488, 2495, 2501, 2516, 2528, 1077, 2534, 2540, 2551, 2557,

			 2563, 2579,   81, 2591, 2603, 2124,  678,    0,    0, 2474,
			 2579, 2613, 2591, 2618, 2630, 2642, 2646, 2658, 1053, 2674,
			 2670, 2686, 2698, 2702, 2714, 2723, 2733, 2794, 2743, 2120,
			 2756, 2762, 2776, 2804, 2609,  563, 1000, 2857, 2864, 2871,
			 2878, 5496, 2885, 5496, 2892, 5496,  979,  981,    0,  973,
			 2901, 2838,  810, 2909, 2478, 2769,  876, 2917, 2924, 1949,
			 2807, 1997, 2020, 2933, 2935, 2025, 2607, 2937, 2939,    0,
			 2022, 2691, 2056, 2094,    0,  919, 2959, 2971, 2973, 2110,
			 2975, 2119, 2133, 2995, 2988, 2150, 2152, 2162, 2167, 2992,
			 3005,  919, 3023, 3037, 3043,  846, 3053, 3059, 3065, 3076,

			 3082,  901, 3091, 3097, 3105, 2522, 5496, 3111,    0,  937,
			 2779, 2827, 3120, 2999, 3123, 3127, 3012, 3140, 2184, 3143,
			 3146, 3160, 3166, 3178, 5496,  989,  872, 3194, 3197, 3200,
			 3214, 2804, 3204, 3212, 3245, 3263, 1892, 3272, 3279, 3286,
			 3295, 3310, 3302, 3317, 2199, 3323, 3333,  852, 3339,  838,
			  826,    0, 2743, 2201,    0, 3221, 2823, 2198, 2251,    0,
			 3348, 3351, 2849, 2261, 2285, 2299, 3353, 3355, 2358, 3369,
			 2372, 2396, 3371, 3385,    0, 2418, 2469, 2531, 3233, 3387,
			 3403, 3416, 3429,  807, 3435,  805, 3446, 3452, 3458, 2531,
			 3464,  793, 3470, 3476, 3482,  760, 3491, 3495, 3382, 3498,

			 3511, 2621, 3516, 3530, 3533, 3537, 3550, 3185, 3553, 3556,
			 3568,  744,  738,  686,  634, 1088, 3589, 2695, 2910, 3604,
			 3577, 1149, 3613, 2545, 1380, 3627, 3619,    0, 3635,    0,
			 2588, 3645,    0, 2620, 3647, 3649,    0,    0,    0, 3651,
			 3661,    0, 3663, 2623,    0, 3673, 3676, 2631, 2662, 2671,
			 3679, 1527, 3699, 3705,    0, 3713,    0, 3725, 3737, 3743,
			 3754, 3410, 3760, 3736, 3771,    0, 3771, 3783, 3786, 5496,
			 3798, 3777, 3810, 3826, 3829, 3806, 3828, 3830, 3833, 3854,
			 5496, 3877, 5496, 3884, 5496, 3891, 3897,  578, 3903,  565,
			 2677,  940,  956, 2732, 3912, 2739, 3914, 2772, 3822, 2802,

			 2932,    0, 3916, 1033, 1406,  523, 3923, 3933, 3939, 3945,
			 3951, 3961, 5496, 3973,    0, 3973, 3985, 3988, 4000, 5496,
			 4003, 4007, 3992, 4007, 4008, 4014, 4058, 4067, 4076, 1540,
			 4085, 4096, 4105, 2935,  451,  441, 2977, 4096,    0, 3683,
			 3103, 4114,    0, 3113, 3686,  447,  423, 4131,  383, 4114,
			 4143, 4159,  468, 4159, 4174, 4181, 4186,  993, 5496, 1880,
			  401, 3129,  713, 4193, 3125, 4200,  794, 3012, 4210,    0,
			  335, 4223, 4035, 4131, 4219, 3224, 3354, 4232, 3130,    0,
			 3869,    0, 4198, 3154, 4257, 4265, 1466, 4273, 4284, 4287,
			 3538, 3643, 4288, 1094, 3188, 3993, 4311, 4324, 4226,  309,

			  274, 1135, 3200,    0, 4323, 3797, 5496, 4336,   99, 4350,
			 4359, 3483, 3999, 3314, 4358, 4368, 4378, 4384,  108, 4395,
			 4241, 4380, 4393,    0, 4405, 4299, 4416,  139,  126, 4431,
			 4437, 4444, 5496, 4454, 3818, 4190, 4460, 4466, 4461, 4462,
			 4474, 4057, 5496, 5496, 4480, 4495, 4501, 5496, 4507, 4519,
			 4525, 4531, 5496, 4571, 4603, 4635, 4667, 4690, 4712, 4739,
			 4771, 4803, 4835, 4867, 4898, 4930, 4962, 4985, 5010, 4531,
			 5042, 5074, 5096, 5118, 5141, 5173, 5190, 5222, 5239, 5261,
			 5283, 4677, 5292, 5301, 5310, 5327, 5350, 5373, 5396, 5419,
			 5441, 5463, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  952,    1,  953,  953,  954,  954,  952,    7,  952,
			  952,  952,  952,  952,  955,  952,  956,  952,  952,  952,
			  952,  952,  952,  952,  957,  952,  952,  952,  952,  952,
			  952,  952,  952,  958,  958,  958,  958,  958,  958,  958,
			  958,  958,  958,  958,  958,  958,  958,  958,  958,  959,
			  952,  952,  960,  952,   53,   53,  952,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,  952,  952,
			  952,  961,  952,  952,  952,  961,  961,  961,  961,  961,
			  962,  952,  963,  962,  952,  964,  952,  964,  964,  952,
			  952,  952,  952,  955,  952,  965,  965,  965,  966,  952,

			  952,  952,  967,  952,  952,  952,  952,  952,  952,  952,
			  958,  968,  958,  958,  958,  958,  958,  958,  958,  958,
			  958,  958,  958,  958,  958,  958,  958,  958,  958,  958,
			  952,   44,  958,  958,  958,  958,  958,  958,  958,  958,
			  958,  958,  958,  959,  959,  959,  960,  952,  952,  952,
			  969,   56,  952,  151,  151,  151,  952,   56,   56,   56,
			   56,   56,  151,   56,  151,  151,   56,   56,  151,  151,
			   56,   56,  151,  151,   56,   56,  151,   56,  151,  151,
			  151,   56,   56,   56,   56,  151,   56,  151,   56,  151,
			  151,   56,   56,  151,  151,   56,   56,  151,  151,   56,

			   56,  151,   56,  151,   56,  952,  961,  952,  952,  952,
			  952,  961,  961,  961,  961,  961,  962,  952,  970,  962,
			  963,  971,  963,  970,  952,  964,  964,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  957,  952,  952,  952,
			  952,  952,  952,  952,  972,  973,  952,  968,  958,  958,
			  958,  958,  958,  958,  958,  958,  958,  958,  958,  952,
			  958,  958,  958,  958,  958,  958,  958,  952,  958,  958,
			  958,  958,  134,  134,  134,  958,  958,  958,  958,  958,
			  958,  958,  958,  958,  958,  952,  959,  959,  959,  952,

			  974,  952,  151,  151,  151,  952,  952,  952,   56,   56,
			   56,  151,  151,  151,   56,  151,  151,   56,   56,  151,
			  151,  151,   56,   56,   56,  151,  151,   56,   56,  952,
			  151,  151,  151,  151,  151,   56,   56,  151,   56,  151,
			   56,  151,  151,   56,   56,  151,  151,   56,   56,  151,
			  151,  151,   56,   56,   56,  151,   56,  151,   56,  961,
			  961,  961,  961,  961,  961,  961,  970,  952,  971,  975,
			  975,  952,  975,  975,  975,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  972,  973,  976,

			  968,  958,  958,  958,  958,  958,  958,  958,  958,  958,
			  958,  952,  958,  958,  958,  958,  958,  958,  134,  131,
			  131,  131,  952,  973,  420,  420,  958,  958,  952,  958,
			  958,  958,  958,  958,  952,  959,  959,  959,  959,  959,
			  959,  952,  977,  151,  151,  952,  952,   56,   56,  973,
			  151,  151,   56,  151,  151,   56,   56,  151,  151,  151,
			   56,   56,   56,  151,  151,   56,  151,  151,  151,  973,
			   56,   56,  151,   56,  151,  151,   56,   56,  151,  151,
			   56,   56,  151,  151,  151,   56,   56,  151,   56,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,

			  952,  952,  952,  952,  952,  952,  952,  978,  979,  958,
			  958,  958,  958,  958,  958,  958,  958,  958,  952,  958,
			  958,  958,  958,  958,  958,  952,  973,  420,  527,  952,
			  958,  958,  958,  958,  972,  952,  952,  959,  959,  959,
			  959,  952,  959,  952,  959,  952,  952,  952,  151,  151,
			  952,  952,  952,  952,   56,   56,  973,  973,  151,  151,
			   56,  151,  151,   56,   56,  151,  151,   56,   56,  151,
			  151,   56,  151,  151,  151,  973,  973,   56,   56,  151,
			   56,  151,  151,   56,   56,  151,  151,  151,  151,   56,
			   56,  952,  952,  952,  952,  952,  952,  952,  952,  952,

			  952,  952,  952,  952,  952,  952,  952,  952,  980,  979,
			  958,  958,  958,  958,  958,  958,  958,  958,  952,  958,
			  958,  958,  958,  958,  952,  973,  952,  958,  958,  958,
			  958,  952,  972,  972,  952,  959,  959,  959,  959,  959,
			  959,  959,  952,  952,  151,  952,  952,  952,  952,  952,
			  151,  151,   56,  151,  151,   56,   56,  151,  151,  151,
			   56,   56,   56,  151,  151,  151,   56,   56,  151,   56,
			  151,  151,   56,   56,  151,  151,  151,  151,   56,   56,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  980,  958,  958,  958,  958,

			  958,  952,  958,  958,  958,  958,  958,  952,  958,  958,
			  958,  952,  952,  972,  972,  952,  952,  959,  959,  952,
			  952,  952,  952,  151,  952,  952,  952,  981,  952,  982,
			  151,   56,  151,  151,   56,   56,  151,  151,  151,   56,
			   56,  151,   56,  151,  151,   56,   56,  151,  151,  151,
			   56,  952,  952,  952,  983,  952,  984,  952,  952,  952,
			  952,  952,  952,  952,  952,  985,  958,  958,  958,  952,
			  958,  952,  958,  958,  958,  952,  952,  978,  978,  952,
			  952,  959,  952,  959,  952,  952,  952,  952,  952,  952,
			  151,  986,  987,  151,   56,  151,   56,  151,   56,  151,

			  151,  151,   56,  988,  989,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  990,  958,  958,  958,  958,  952,
			  958,  958,  952,  952,  980,  980,  952,  959,  959,  952,
			  952,  952,  952,  151,  952,  952,  151,   56,  151,   56,
			  151,   56,  151,  151,   56,  952,  952,  952,  952,  952,
			  952,  952,  990,  958,  958,  958,  958,  952,  952,  980,
			  980,  151,  151,   56,  151,   56,  151,  952,  952,  991,
			  952,  958,  958,  958,  958,  952,  952,  980,  151,  151,
			   56,  151,   56,  151,  952,  952,  991,  952,  958,  958,
			  952,  952,  980,  151,  151,  952,  952,  958,  958,  952,

			  952,  980,  151,  151,  952,  952,  952,  952,  952,  952,
			  958,  952,  952,  151,  952,  952,  952,  952,  952,  952,
			  958,  952,  952,  151,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,    0,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952, yy_Dummy>>)
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
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,    9,   10,   11,   11,
			   11,   11,   12,   13,    1,    1,   14,    1,   15,    1,
			   16,   16,   17,   16,   18,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   19,
			   16,   16,   20,   21,   22,   23,    5,   11,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  102,  102,    0,    0,  133,
			  131,    1,    2,   15,  115,   18,  131,   16,   17,    7,
			    6,   13,    5,   11,    8,  107,  107,   14,   12,   28,
			   10,   29,   19,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   85,   93,   93,   93,   93,   21,
			   30,   22,    9,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   23,   20,
			   24,  119,  120,  121,  122,  119,  119,  119,  119,  119,
			  102,  105,  132,  102,  132,  132,   73,  132,  132,   75,
			    1,    2,   27,  115,  114,  129,  129,  129,    3,   32,

			  113,   31,   97,    0,    0,  107,    0,  107,   26,   25,
			   93,    0,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   39,
			    0,   93,   92,   92,   84,   92,   92,   93,   93,   93,
			   93,   93,   93,    0,    0,    0,    0,  106,    0,    0,
			    0,   96,    0,   96,   96,   96,    0,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   39,   96,   39,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,   96,   96,   96,  101,  119,  121,  120,  117,
			  116,  118,  119,  119,  119,  119,  102,  105,    0,  102,
			    0,    0,    0,  103,  104,    0,    0,   75,   73,    0,
			   72,    0,   71,  129,  123,  129,  129,  129,  129,  129,
			  129,    4,   33,  113,    0,    0,    0,    0,    0,  109,
			    0,  107,    0,    0,    0,    0,    0,    0,   93,   93,
			   38,   93,   93,   93,   93,   93,   93,   93,   93,    0,
			   93,   93,   93,   93,   41,   93,   93,   91,   85,   85,
			   85,   85,   92,   93,   92,   92,   92,   93,   93,   93,
			   93,   93,   93,   40,   93,    0,    0,    0,    0,   95,

			   98,    0,   96,   96,   38,    0,    0,    0,   96,   96,
			   38,   64,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,    0,
			   96,   96,   96,   68,   68,   96,   96,   96,   96,   41,
			   41,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   40,   40,   96,   96,  119,
			  119,  119,  119,  119,  119,  119,    0,  103,  104,    0,
			    0,   74,   72,   71,   75,  127,  130,  130,  128,  124,
			  125,  126,  113,    0,  113,    0,    0,    0,    0,  109,
			    0,    0,    0,  112,  107,    0,    0,    0,    0,    0,

			   94,   93,   93,   93,   93,   93,   37,   93,   93,   93,
			   93,    0,   93,   93,   93,   93,   93,   93,   84,   93,
			   93,   93,    0,    0,   84,   84,   84,   36,    0,   43,
			   93,   93,   93,   93,   70,    0,    0,    0,    0,    0,
			    0,    0,   61,   96,   96,    0,    0,   96,   96,    0,
			   96,   96,   96,   96,   96,   96,   96,   37,   96,   96,
			   37,   96,   96,   96,   96,   96,   96,   96,   96,    0,
			   96,   96,   96,   96,   96,   96,   96,   96,   36,   43,
			   36,   43,   96,   96,   96,   96,   96,   96,   96,  104,
			  113,    0,    0,    0,    0,  108,  109,    0,  110,    0,

			  112,    0,    0,    0,  107,   81,    0,    0,    0,   58,
			   93,   93,   93,   93,   93,   93,   44,   93,    0,   93,
			   93,   35,   93,   93,   93,    0,    0,   93,   93,    0,
			   93,   93,   93,   93,    0,   70,    0,    0,    0,    0,
			    0,   63,    0,   67,    0,   66,    0,    0,   58,   96,
			    0,    0,    0,    0,   58,   96,   64,   64,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   44,
			   96,   44,   96,   96,   35,   68,   68,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,  113,    0,    0,    0,    0,    0,  109,  110,    0,

			    0,  112,    0,    0,    0,    0,   81,    0,    0,    0,
			   93,   59,   93,   60,   93,   93,   46,   93,    0,   93,
			   93,   93,   93,   93,   84,   84,    0,   52,   93,   93,
			   93,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   96,    0,    0,    0,    0,    0,
			   64,   59,   59,   96,   60,   96,   60,   96,   96,   46,
			   96,   96,   46,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   52,   96,   96,   96,   52,   96,
			    0,    0,    0,   97,    0,   99,    0,  110,    0,  113,
			    0,   83,    0,    0,  111,    0,   93,   93,   57,   93,

			   45,    0,   42,   56,   34,   93,   50,    0,   93,   93,
			   93,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   96,    0,    0,    0,    0,    0,    0,
			   96,   96,   57,   96,   57,   96,   45,   42,   56,   42,
			   56,   34,   34,   96,   50,   96,   50,   96,   96,   96,
			   96,    0,    0,    0,    0,    0,    0,    0,  110,    0,
			    0,    0,    0,   80,  111,    0,   93,   93,   93,   88,
			   93,    0,   93,   93,   53,    0,    0,    0,    0,    0,
			   69,    0,   65,    0,   62,    0,    0,   98,    0,  100,
			   96,   98,  100,   96,   96,   96,   96,   96,   96,   96,

			   96,   53,   96,   97,   99,  112,    0,  112,    0,    0,
			    0,    0,   80,  111,    0,   93,   93,   47,   93,   87,
			   51,   93,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   96,    0,    0,   96,   96,   47,   47,
			   96,   96,   51,   96,   51,    0,    0,  112,   82,    0,
			   80,  111,    0,   93,   93,   93,   93,   86,   86,   86,
			   86,   96,   96,   96,   96,   96,   96,    0,    0,    0,
			    0,   93,   49,   48,   93,    0,    0,    0,   96,   49,
			   49,   48,   48,   96,    0,    0,    0,    0,   93,   93,
			    0,    0,    0,   96,   96,   79,   76,   93,   54,    0,

			    0,    0,   96,   54,    0,    0,   79,    0,    0,    0,
			   93,    0,    0,   96,    0,    0,   76,    0,    0,   76,
			   55,    0,    0,   55,    0,   78,    0,    0,    0,    0,
			    0,    0,   78,   76,    0,    0,    0,    0,    0,    0,
			    0,   77,   89,   90,    0,    0,    0,   77,    0,   77,
			    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5496
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 952
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 953
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
			create str_.make_empty
			create last_string_value.make_empty
		end

feature -- Commands

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
			converted_codes.wipe_out
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

-------------------------------------------------------------------
--- START transitional at-code identifier codes in ADL 1.5 archetypes
---
	converted_codes: HASH_TABLE [STRING, STRING]
			-- table of new codes, keyed by old code found in archetype
		attribute
			create Result.make (0)
		end

	code: STRING
		attribute
			create Result.make_empty
		end

	reformatted_code: STRING
		attribute
			create Result.make_empty
		end
---
--- END transitional at-code identifier codes in ADL 1.5 archetypes
-------------------------------------------------------------------

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER = 4096
				-- Initial size for `in_buffer'

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

end
