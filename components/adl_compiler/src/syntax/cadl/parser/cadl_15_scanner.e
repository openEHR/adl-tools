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
if yy_act <= 63 then
if yy_act <= 32 then
if yy_act <= 16 then
if yy_act <= 8 then
if yy_act <= 4 then
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
if yy_act = 3 then
--|#line 88 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 88")
end
-- Ignore comments
else
--|#line 89 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 89")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 93 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 93")
end
last_token := Minus_code
else
--|#line 94 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 94")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 95 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 95")
end
last_token := Star_code
else
--|#line 96 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 96")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 97 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 97")
end
last_token := Caret_code
else
--|#line 98 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 98")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 99 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 99")
end
last_token := Dot_code
else
--|#line 100 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 100")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 101 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 101")
end
last_token := Comma_code
else
--|#line 102 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 102")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 103 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 103")
end
last_token := Exclamation_code
else
--|#line 104 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 104")
end
last_token := Left_parenthesis_code
end
end
end
end
else
if yy_act <= 24 then
if yy_act <= 20 then
if yy_act <= 18 then
if yy_act = 17 then
--|#line 105 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 105")
end
last_token := Right_parenthesis_code
else
--|#line 106 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 106")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 108 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 108")
end
last_token := Question_mark_code
else
--|#line 110 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 110")
end
last_token := SYM_INTERVAL_DELIM
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 112 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 112")
end
last_token := Left_bracket_code
else
--|#line 113 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 113")
end
last_token := Right_bracket_code
end
else
if yy_act = 23 then
--|#line 115 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 115")
end
last_token := SYM_START_CBLOCK
else
--|#line 116 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 116")
end
last_token := SYM_END_CBLOCK
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 118 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 118")
end
last_token := SYM_GE
else
--|#line 119 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 119")
end
last_token := SYM_LE
end
else
if yy_act = 27 then
--|#line 120 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 120")
end
last_token := SYM_NE
else
--|#line 122 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 122")
end
last_token := SYM_LT
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 123 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 123")
end
last_token := SYM_GT
else
--|#line 125 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 125")
end
last_token := SYM_MODULO
end
else
if yy_act = 31 then
--|#line 126 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 126")
end
last_token := SYM_DIV
else
--|#line 128 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 128")
end
last_token := SYM_ELLIPSIS
end
end
end
end
end
else
if yy_act <= 48 then
if yy_act <= 40 then
if yy_act <= 36 then
if yy_act <= 34 then
if yy_act = 33 then
--|#line 129 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 129")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 133 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 133")
end
last_token := SYM_MATCHES
end
else
if yy_act = 35 then
--|#line 135 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 135")
end
last_token := SYM_MATCHES
else
--|#line 139 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 139")
end
last_token := SYM_THEN
end
end
else
if yy_act <= 38 then
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
else
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
end
end
else
if yy_act <= 44 then
if yy_act <= 42 then
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
else
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
end
else
if yy_act <= 46 then
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
else
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
end
end
end
else
if yy_act <= 56 then
if yy_act <= 52 then
if yy_act <= 50 then
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
else
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
end
else
if yy_act <= 54 then
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
else
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
end
end
else
if yy_act <= 60 then
if yy_act <= 58 then
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
else
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
end
else
if yy_act <= 62 then
if yy_act = 61 then
--|#line 192 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 192")
end

			last_token := V_URI
			last_string_value := text
		
else
--|#line 230 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 230")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
else
--|#line 236 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 236")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
end
end
end
end
else
if yy_act <= 95 then
if yy_act <= 79 then
if yy_act <= 71 then
if yy_act <= 67 then
if yy_act <= 65 then
if yy_act = 64 then
--|#line 243 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 243")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 250 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 250")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 66 then
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
if yy_act <= 69 then
if yy_act = 68 then
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
if yy_act = 70 then
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
			create err_str.make (in_buffer.count)
			err_str.append (in_buffer)
			in_buffer.wipe_out
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
if yy_act <= 75 then
if yy_act <= 73 then
if yy_act = 72 then
--|#line 315 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 315")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 322 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 322")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 323 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 323")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 324 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 324")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 331 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 331")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 332 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 332")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 339 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 339")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 340 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 340")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
end
end
else
if yy_act <= 87 then
if yy_act <= 83 then
if yy_act <= 81 then
if yy_act = 80 then
--|#line 347 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 347")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 348 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 348")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 82 then
--|#line 360 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 360")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 370 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 370")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 375 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 375")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 385 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 385")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 86 then
--|#line 391 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 391")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 402 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 402")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
end
end
else
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act = 88 then
--|#line 411 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 411")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 417 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 417")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 90 then
--|#line 423 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 423")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 429 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 429")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 436 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 436")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 458 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 458")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
end
else
if yy_act = 94 then
--|#line 464 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 464")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
else
--|#line 470 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 470")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
end
end
end
end
else
if yy_act <= 111 then
if yy_act <= 103 then
if yy_act <= 99 then
if yy_act <= 97 then
if yy_act = 96 then
--|#line 477 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 477")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 481 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 481")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
else
if yy_act = 98 then
--|#line 485 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 485")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 489 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 489")
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
if yy_act <= 101 then
if yy_act = 100 then
--|#line 501 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 501")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 508 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 508")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 102 then
--|#line 513 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 513")
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
--|#line 528 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 528")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
end
end
else
if yy_act <= 107 then
if yy_act <= 105 then
if yy_act = 104 then
--|#line 529 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 529")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 533 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 533")
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
if yy_act = 106 then
--|#line 534 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 534")
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
--|#line 535 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 535")
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
if yy_act <= 109 then
if yy_act = 108 then
--|#line 555 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 555")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 560 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 560")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
if yy_act = 110 then
--|#line 568 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 568")
end
in_buffer.append_character ('\')
else
--|#line 570 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 570")
end
in_buffer.append_character ('"')
end
end
end
end
else
if yy_act <= 119 then
if yy_act <= 115 then
if yy_act <= 113 then
if yy_act = 112 then
--|#line 572 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 572")
end

				in_buffer.append_string (text)
	
else
--|#line 576 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 576")
end
in_buffer.append_string (text)
end
else
if yy_act = 114 then
--|#line 578 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 578")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
--|#line 583 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 583")
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
			
end
end
else
if yy_act <= 117 then
if yy_act = 116 then
--|#line 594 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 594")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 603 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 603")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 118 then
--|#line 605 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 605")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 606 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 606")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
end
else
if yy_act <= 123 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 607 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 607")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 608 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 608")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 122 then
--|#line 609 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 609")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 611 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 611")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 125 then
if yy_act = 124 then
--|#line 612 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 612")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 616 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 616")
end
;
end
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
			create an_array.make_filled (0, 0, 5103)
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
			   10,   10,   10,   72,   81,   96,   81,   73,   72,  575,

			  575,   90,   73,   90,   90,   99,  207,  100,  100,  100,
			  100,  100,  100,  103,  111,  104,  111,  105,  105,  105,
			  105,  105,  105,  112,  115,  111,  111,  113,  111,  114,
			   82,   83,   82,   83,  111,  111,  122,  137,  116,  126,
			   97,  174,  123,  124,   74,  138,  183,  117,  125,   74,
			  860,  112,  115,  208,  859,  113,  106,  114,  206,  228,
			  206,  206,  228,  842,  122,  137,  116,  126,  843,  175,
			  123,  124,  837,  138,  184,  117,  125,  836,   75,   76,
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
			  166,  111,  111,  111,  118,  244,  120,  128,  812,  127,

			  201,  167,  710,  111,  185,  119,  111,  199,  121,  141,
			  129,   90,  230,   90,   90,  230,  205,  223,  168,  205,
			  223,  139,  118,  106,  120,  128,  140,  127,  142,  202,
			  169,  245,  186,  792,  119,  200,  121,  141,  129,  130,
			  131,  131,  131,  131,  131,  131,  160,  150,  111,  139,
			  187,  150,  170,  150,  140,  132,  162,  142,  191,  298,
			  299,  150,  133,  188,  171,  163,  192,  150,  571,  134,
			  225,  135,  293,  136,  161,  156,  176,  177,  189,  156,
			  172,  156,  178,  132,  164,  350,  193,  298,  299,  156,
			  133,  190,  173,  165,  194,  156,  210,  179,  212,  212,

			  135,  300,  136,  147,  180,  181,  147,  253,  205,  294,
			  182,  148,  149,  205,  350,  254,  205,  723,  149,  150,
			  150,  150,  150,  150,  150,  151,  205,  306,  308,  300,
			  722,  150,  150,  150,  150,  150,  152,  150,  150,  150,
			  153,  150,  154,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  155,  306,  308,  721,  150,  156,
			  156,  156,  156,  156,  157,  156,  156,  156,  158,  156,
			  159,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  147,  794,  795,  147,  209,  209,  209,  720,
			  148,  211,  211,  211,  213,  213,  213,  149,  150,  150,

			  150,  150,  150,  150,  151,  710,  210,  706,  309,  244,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  155,  215,  219,  309,  150,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  195,  222,  473,  227,  520,  196,  227,  520,  312,
			  216,  217,  220,  221,  252,  253,  228,  229,  227,  149,
			  149,  227,  666,  254,  252,  111,  318,  230,  147,  197,
			  228,  147,  473,  233,  198,  486,  148,  312,  216,  217,

			  477,  230,  234,  234,  234,  234,  234,  234,  241,  241,
			  241,  241,  241,  241,  318,  430,  319,  225,  246,  246,
			  246,  246,  246,  246,  242,  247,  247,  247,  247,  247,
			  247,  225,  251,  251,  251,  251,  251,  251,  235,  252,
			  253,  248,  252,  253,  319,  252,  253,  243,  267,  611,
			  111,  302,  242,  236,  322,  323,  103,  237,  104,  238,
			  249,  249,  249,  249,  249,  249,  250,  528,  103,  248,
			  104,  610,  249,  249,  249,  249,  249,  249,  252,  253,
			  609,  252,  253,  323,  252,  253,  324,  254,  612,  111,
			  254,  606,  111,  254,  313,  111,  528,  252,  253,  106,

			  314,  590,  258,  330,  332,  257,  254,  334,  111,  335,
			  256,  106,  252,  253,  324,  252,  253,  259,  252,  253,
			  643,  254,  313,  111,  302,  252,  253,  254,  314,  111,
			  258,  330,  332,  257,  254,  334,  111,  335,  256,  252,
			  253,  206,  260,  206,  206,  259,  338,  298,  254,  262,
			  111,  339,  261,  804,  252,  253,  263,  252,  253,  644,
			  252,  253,  264,  254,  808,  111,  254,  344,  111,  254,
			  260,  111,  252,  253,  338,  303,  475,  262,  265,  339,
			  261,  254,  804,  111,  263,  252,  253,  266,  268,  269,
			  264,  252,  253,  808,  254,  344,  111,  342,  252,  253,

			  254,  343,  111,  252,  253,  219,  265,  254,  103,  111,
			  252,  253,  254,  359,  111,  266,  268,  269,  455,  254,
			  273,  111,  519,  271,  579,  342,  254,  270,  274,  343,
			  272,  348,  252,  253,  877,  252,  253,  130,  252,  253,
			  215,  254,  220,  221,  254,  526,  111,  254,  273,  111,
			  276,  271,  252,  253,  130,  361,  274,  277,  272,  348,
			  392,  254,  432,  111,  110,  106,  278,  280,  279,  492,
			  132,  287,  239,  222,  239,  239,  216,  217,  276,  479,
			  252,  253,  252,  253,  280,  277,  135,  252,  253,  302,
			  432,  302,  220,  221,  297,  278,  302,  279,  132,  287,

			  364,  391,  252,  253,  252,  253,  299,  306,  323,  216,
			  217,  302,  364,  302,  827,  135,  252,  253,  130,  281,
			  281,  281,  281,  281,  281,  254,  318,  111,  252,  253,
			  130,  252,  253,  130,  304,  307,  328,  254,  282,  111,
			  254,  283,  111,  827,  252,  253,  132,  284,  433,  132,
			  252,  253,  360,  254,  320,  111,  133,  470,  437,  302,
			  280,  252,  253,  280,  455,  135,  282,  288,  300,  283,
			  254,  289,  111,  450,  132,  284,  433,  132,  252,  253,
			  285,  205,  439,  286,  133,  223,  437,  254,  223,  111,
			  520,  252,  253,  520,  135,  288,  305,  290,  800,  289, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  254,  205,  111,  252,  253,  253,  252,  253,  285,  434,
			  439,  286,  254,  254,  111,  302,  431,  252,  253,  794,
			  795,  291,  252,  253,  440,  290,  302,  205,  252,  253,
			  426,  302,  252,  253,  252,  253,  308,  302,  225,  292,
			  801,  302,  710,  302,  309,  313,  521,  252,  253,  291,
			  837,  314,  440,  312,  252,  253,  302,  252,  253,  209,
			  209,  209,  319,  302,  310,  392,  302,  391,  292,  252,
			  253,  324,  311,  316,  334,  443,  325,  379,  254,  317,
			  339,  315,  352,  353,  354,  355,  356,  877,  252,  253,
			  321,  326,  327,  327,  327,  327,  327,  302,  374,  329,

			  252,  253,  336,  443,  205,  209,  209,  209,  341,  254,
			  724,  111,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  252,  253,  252,  253,  252,
			  253,  252,  253,  205,  302,  373,  302,  372,  302,  725,
			  302,  371,  252,  253,  252,  253,  368,  335,  226,  444,
			  338,  302,  445,  302,  359,  252,  253,  330,  360,  332,
			  449,  359,  205,  344,  254,  342,  111,  252,  253,  343,
			  252,  253,  357,  357,  357,  337,  302,  444,  340,  302,
			  445,  452,  394,  227,  325,  331,  227,  333,  449,  252,

			  253,  347,  267,  345,  301,  228,  227,  346,  302,  227,
			  348,  453,  454,  350,  365,  364,  230,  365,  228,  452,
			  394,  358,  358,  358,  387,  387,  387,  387,  387,  230,
			  369,  370,  370,  370,  370,  370,  370,  297,  349,  453,
			  454,  450,  351,  376,  295,  376,  225,  146,  377,  377,
			  377,  377,  377,  377,  366,  364,  293,  366,  275,  225,
			  362,  363,  364,  362,  363,  362,  362,  362,  362,  362,
			  362,  362,  362,  365,  229,  229,  362,  229,  229,  229,
			  229,  229,  229,  362,  366,  362,  362,  362,  362,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  362,  362,  367,  362,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  362,  362,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  362,  375,  375,  375,  375,  375,  375,  378,  378,
			  378,  378,  378,  378,  240,  239,  252,  253,  242,  380,
			  380,  380,  380,  380,  380,  302,  381,  381,  381,  381,
			  381,  381,  388,  388,  388,  388,  388,  388,  252,  253,
			  444,  243,  382,  384,  800,  384,  242,  302,  385,  385,

			  385,  385,  385,  385,  103,  710,  104,  232,  386,  386,
			  386,  386,  386,  386,  726,  383,  252,  253,  447,   94,
			  382,  252,  253,   91,  458,  254,  460,  111,  252,  253,
			  254,  226,  111,  252,  253,  393,  802,  254,  461,  111,
			  252,  253,  254,  205,  111,  203,  396,  106,  395,  254,
			  464,  111,  458,  727,  460,  146,  252,  253,  144,  398,
			  252,  253,  465,  393,  397,  254,  461,  111,  111,  254,
			  391,  111,  252,  253,  396,  403,  395,  109,  464,  468,
			  399,  254,  469,  111,  252,  253,  403,  398,  252,  253,
			  465,  400,  397,  254,  108,  111,  403,  254,  101,  111,

			  252,  253,  205,  401,  252,  253,   98,  468,  399,  254,
			  469,  111,  404,  254,  403,  111,  252,  253,  242,  400,
			   94,  252,  253,  527,  405,  302,  402,  406,  252,  253,
			  254,  401,  111,  458,  252,  253,   92,  254,  407,  111,
			  404,  243,   91,  254,  877,  111,  242,  252,  253,  252,
			  253,  527,  405,  252,  253,  406,  302,  877,  254,  877,
			  111,  459,  254,  877,  111,  439,  407,  408,  409,  252,
			  253,  877,  411,  411,  411,  411,  411,  411,  254,  877,
			  111,  212,  212,  252,  253,  410,  412,  412,  412,  412,
			  412,  412,  254,  441,  111,  408,  409,  877,  877,  252,

			  253,  410,  413,  413,  413,  413,  413,  413,  254,  414,
			  111,  415,  877,  252,  253,  410,  110,  110,  110,  110,
			  110,  110,  302,  110,  110,  110,  110,  110,  110,  877,
			  533,  410,  416,  535,  877,  417,  252,  253,  130,  877,
			  433,  418,  110,  252,  253,  254,  877,  111,  252,  253,
			  130,  877,  302,  252,  253,  877,  877,  254,  533,  111,
			  416,  535,  254,  417,  111,  252,  253,  284,  436,  418,
			  110,  252,  253,  877,  420,  877,  111,  252,  253,  419,
			  254,  522,  111,  252,  253,  470,  254,  877,  111,  293,
			  421,  536,  254,  539,  111,  284,  252,  253,  877,  877,

			  252,  253,  877,  252,  253,  302,  422,  419,  877,  254,
			  877,  111,  254,  423,  111,  252,  253,  540,  421,  536,
			  523,  539,  877,  877,  254,  877,  111,  427,  428,  429,
			  429,  429,  429,  293,  422,  252,  253,  252,  253,  252,
			  253,  423,  424,  877,  302,  540,  302,  877,  302,  252,
			  253,  425,  252,  253,  432,  297,  252,  253,  302,  205,
			  877,  302,  391,  877,  437,  302,  205,  403,  443,  455,
			  440,  327,  327,  327,  327,  327,  327,  877,  403,  877,
			  425,  205,  435,  445,  252,  253,  205,  449,  403,  877,
			  252,  253,  438,  302,  252,  253,  446,  877,  442,  302,

			  252,  253,  877,  302,  252,  253,  403,  205,  452,  302,
			  877,  448,  543,  302,  453,  451,  252,  253,  877,  461,
			  252,  253,  252,  253,  877,  302,  544,  460,  546,  302,
			  464,  302,  252,  253,  877,  465,  456,  209,  209,  209,
			  543,  302,  457,  877,  211,  211,  211,  463,  547,  468,
			  363,  364,  469,  363,  544,  462,  546,  877,  466,  213,
			  213,  213,  365,  467,  209,  209,  209,  548,  473,  877,
			  252,  253,  553,  366,  252,  253,  547,  471,  877,  254,
			  472,  111,  877,  302,  877,  209,  209,  209,  369,  370,
			  370,  370,  370,  370,  370,  548,  877,  474,  877,  877,

			  553,  877,  877,  367,  377,  377,  377,  377,  377,  377,
			  476,  476,  476,  476,  476,  476,  478,  478,  478,  478,
			  478,  478,  480,  480,  480,  480,  480,  480,  481,  481,
			  481,  481,  481,  481,  484,  484,  484,  484,  484,  484,
			  555,  556,  559,  877,  382,  482,  877,  482,  877,  477,
			  483,  483,  483,  483,  483,  483,  385,  385,  385,  385,
			  385,  385,  252,  253,  809,  809,  809,  383,  555,  556,
			  559,  302,  382,  485,  485,  485,  485,  485,  485,  487,
			  488,  877,  489,  489,  489,  489,  489,  489,  490,  490,
			  490,  490,  490,  490,  491,  491,  491,  491,  491,  491, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  252,  253,  877,  877,  252,  253,  503,  252,  253,  254,
			  877,  111,  486,  254,  877,  111,  254,  503,  111,  560,
			  252,  253,  613,  252,  253,  877,  615,  503,  877,  254,
			  494,  111,  254,  877,  111,  252,  253,  496,  495,  877,
			  252,  253,  498,  497,  254,  503,  111,  560,  877,  254,
			  613,  111,  252,  253,  615,  252,  253,  877,  494,  877,
			  616,  254,  877,  111,  254,  496,  111,  495,  499,  877,
			  498,  497,  500,  877,  501,  252,  253,  877,  252,  253,
			  877,  877,  252,  253,  254,  505,  111,  254,  616,  111,
			  502,  254,  877,  111,  252,  253,  499,  877,  252,  253,

			  500,  504,  501,  254,  877,  111,  877,  254,  506,  111,
			  252,  253,  877,  505,  252,  253,  507,  110,  502,  254,
			  110,  111,  619,  254,  877,  111,  110,  625,  508,  504,
			  411,  411,  411,  411,  411,  411,  506,  626,  252,  253,
			  509,  877,  252,  253,  507,  110,  877,  254,  110,  111,
			  619,  254,  110,  111,  110,  625,  508,  412,  412,  412,
			  412,  412,  412,  110,  877,  626,  519,  253,  509,  413,
			  413,  413,  413,  413,  413,  254,  561,  111,  877,  110,
			  110,  510,  510,  510,  510,  510,  510,  562,  110,  877,
			  110,  877,  110,  511,  511,  511,  511,  511,  511,  877,

			  877,  877,  110,  877,  561,  252,  253,  110,  512,  512,
			  512,  512,  512,  512,  302,  562,  391,  110,  877,  110,
			  877,  514,  627,  110,  513,  513,  513,  513,  513,  513,
			  877,  110,  514,  877,  877,  252,  253,  877,  539,  110,
			  252,  253,  514,  630,  254,  632,  111,  252,  253,  302,
			  627,  110,  877,  598,  252,  253,  254,  877,  111,  877,
			  514,  252,  253,  302,  598,  516,  541,  110,  515,  877,
			  254,  630,  111,  632,  598,  524,  517,  429,  429,  429,
			  429,  429,  429,  293,  527,  252,  253,  518,  877,  877,
			  633,  877,  598,  516,  302,  522,  515,  429,  429,  429,

			  429,  429,  429,  293,  517,  529,  530,  530,  530,  530,
			  530,  877,  531,  877,  525,  518,  252,  253,  633,  528,
			  252,  253,  252,  253,  877,  302,  252,  253,  877,  302,
			  877,  302,  877,  877,  523,  302,  252,  253,  252,  253,
			  877,  536,  636,  535,  877,  302,  533,  302,  532,  549,
			  550,  550,  550,  550,  550,  543,  252,  253,  540,  252,
			  253,  546,  877,  252,  253,  302,  252,  253,  302,  538,
			  636,  537,  302,  877,  534,  302,  252,  253,  553,  252,
			  253,  519,  253,  545,  603,  302,  542,  877,  302,  551,
			  302,  637,  547,  555,  638,  604,  556,  560,  877,  565,

			  565,  565,  565,  565,  565,  605,  554,  252,  253,  559,
			  566,  566,  566,  566,  566,  566,  254,  877,  111,  637,
			  552,  557,  638,  604,  558,  564,  375,  375,  375,  375,
			  375,  375,  639,  742,  742,  742,  742,  563,  477,  567,
			  568,  568,  568,  568,  568,  569,  569,  569,  569,  569,
			  569,  483,  483,  483,  483,  483,  483,  877,  678,  877,
			  639,  382,  570,  570,  570,  570,  570,  570,  572,  572,
			  572,  572,  572,  572,  573,  573,  573,  573,  573,  573,
			  877,  680,  877,  682,  383,  576,  678,  576,  877,  382,
			  574,  574,  574,  574,  574,  574,  577,  877,  877,  252,

			  253,  571,  569,  569,  569,  569,  569,  569,  254,  680,
			  111,  682,  488,  486,  489,  489,  489,  489,  489,  489,
			  252,  253,  877,  877,  578,  252,  253,  877,  877,  254,
			  877,  111,  877,  877,  254,  877,  111,  252,  253,  583,
			  877,  582,  877,  252,  253,  877,  254,  877,  111,  252,
			  253,  584,  254,  877,  111,  585,  252,  253,  254,  877,
			  111,  586,  252,  253,  877,  302,  877,  583,  587,  252,
			  253,  254,  877,  111,  660,  252,  253,  877,  302,  584,
			  588,  252,  253,  585,  254,  877,  111,  616,  877,  586,
			  254,  660,  111,  252,  253,  660,  587,  877,  683,  589,

			  591,  877,  254,  877,  111,  252,  253,  877,  588,  252,
			  253,  592,  252,  253,  254,  618,  111,  877,  302,  660,
			  877,  254,  686,  111,  252,  253,  683,  589,  591,  252,
			  253,  593,  877,  254,  877,  111,  877,  877,  254,  592,
			  111,  510,  510,  510,  510,  510,  510,  877,  595,  687,
			  686,  610,  877,  877,  594,  688,  877,  877,  253,  593,
			  511,  511,  511,  511,  511,  511,  254,  877,  691,  596,
			  513,  513,  513,  513,  513,  513,  595,  687,  620,  693,
			  252,  253,  594,  688,  252,  253,  694,  697,  597,  254,
			  621,  111,  110,  254,  877,  111,  691,  596,  877,  599,

			  252,  253,  877,  600,  252,  253,  620,  693,  877,  254,
			  698,  111,  699,  302,  694,  697,  597,  414,  621,  415,
			  110,  512,  512,  512,  512,  512,  512,  599,  252,  253,
			  601,  600,  252,  253,  877,  877,  110,  254,  698,  111,
			  699,  302,  877,  417,  877,  877,  728,  252,  253,  418,
			  729,  613,  705,  252,  253,  602,  302,  877,  601,  877,
			  877,  877,  302,  611,  110,  530,  530,  530,  530,  530,
			  530,  417,  626,  615,  728,  383,  877,  418,  729,  614,
			  705,  877,  731,  602,  427,  607,  607,  607,  607,  607,
			  293,  427,  608,  607,  607,  607,  607,  293,  252,  253,

			  628,  617,  612,  252,  253,  252,  253,  302,  252,  253,
			  731,  877,  302,  877,  302,  733,  619,  254,  735,  111,
			  877,  455,  620,  550,  550,  550,  550,  550,  550,  254,
			  252,  253,  252,  253,  621,  632,  252,  253,  670,  302,
			  877,  302,  877,  733,  622,  302,  735,  877,  627,  670,
			  623,  630,  252,  253,  736,  633,  252,  253,  877,  671,
			  877,  302,  624,  634,  877,  302,  652,  652,  652,  652,
			  652,  636,  252,  253,  737,  637,  629,  670,  877,  631,
			  877,  302,  736,  635,  642,  642,  642,  642,  642,  642,
			  643,  877,  568,  568,  568,  568,  568,  568,  877,  640,

			  762,  877,  737,  641,  569,  569,  569,  569,  569,  569,
			  646,  646,  646,  646,  646,  646,  877,  877,  252,  253,
			  645,  647,  647,  647,  647,  647,  647,  302,  762,  644,
			  648,  648,  648,  648,  648,  648,  649,  649,  649,  649,
			  649,  649,  650,  650,  650,  650,  650,  650,  645,  571,
			  651,  651,  651,  651,  651,  651,  653,  653,  653,  653,
			  653,  653,  252,  253,  763,  252,  253,  744,  745,  744,
			  745,  254,  248,  111,  254,  877,  111,  655,  252,  253,
			  656,  877,  252,  253,  877,  252,  253,  254,  877,  111,
			  765,  254,  763,  111,  254,  877,  111,  767,  252,  253, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  248,  657,  877,  252,  253,  655,  746,  254,  656,  111,
			  877,  658,  254,  877,  111,  252,  253,  877,  765,  252,
			  253,  877,  252,  253,  254,  767,  111,  659,  254,  657,
			  111,  254,  877,  111,  252,  253,  877,  877,  662,  658,
			  252,  253,  769,  254,  877,  111,  661,  252,  253,  254,
			  877,  111,  665,  663,  877,  659,  254,  770,  111,  664,
			  252,  253,  877,  492,  252,  253,  662,  252,  253,  254,
			  769,  111,  492,  254,  661,  111,  254,  670,  111,  877,
			  665,  663,  669,  786,  668,  770,  671,  664,  672,  877,
			  667,  674,  675,  675,  675,  675,  675,  673,  673,  676,

			  677,  677,  677,  677,  677,  252,  253,  673,  252,  253,
			  669,  786,  668,  877,  302,  877,  672,  302,  667,  877,
			  680,  877,  877,  877,  522,  673,  607,  607,  607,  607,
			  607,  607,  293,  524,  683,  607,  607,  607,  607,  607,
			  607,  293,  529,  679,  679,  679,  679,  679,  681,  252,
			  253,  252,  253,  877,  714,  252,  253,  877,  302,  787,
			  302,  789,  685,  523,  302,  252,  253,  877,  682,  252,
			  253,  714,  525,  877,  302,  714,  252,  253,  302,  252,
			  253,  252,  253,  791,  688,  302,  687,  787,  302,  789,
			  302,  877,  252,  253,  877,  693,  684,  694,  877,  714,

			  691,  302,  565,  565,  565,  565,  565,  565,  877,  877,
			  877,  791,  690,  877,  689,  567,  701,  701,  701,  701,
			  701,  803,  697,  695,  702,  696,  702,  877,  692,  703,
			  703,  703,  703,  703,  703,  703,  703,  703,  703,  703,
			  703,  704,  704,  704,  704,  704,  704,  877,  877,  803,
			  700,  573,  573,  573,  573,  573,  573,  707,  707,  707,
			  707,  707,  707,  708,  708,  708,  708,  708,  708,  806,
			  877,  818,  252,  253,  571,  709,  709,  709,  709,  709,
			  709,  254,  819,  111,  252,  253,  756,  252,  253,  877,
			  756,  705,  877,  254,  828,  111,  254,  806,  111,  818,

			  252,  253,  711,  877,  252,  253,  877,  756,  712,  254,
			  819,  111,  757,  254,  383,  111,  757,  713,  756,  705,
			  252,  253,  828,  252,  253,  877,  252,  253,  838,  254,
			  711,  111,  254,  757,  111,  254,  712,  111,  252,  253,
			  716,  252,  253,  877,  757,  713,  848,  254,  877,  111,
			  254,  829,  111,  829,  252,  253,  838,  716,  252,  253,
			  877,  716,  830,  254,  715,  111,  877,  254,  877,  111,
			  252,  253,  877,  717,  848,  252,  253,  252,  253,  254,
			  718,  111,  877,  877,  302,  716,  302,  877,  877,  719,
			  831,  724,  715,  675,  675,  675,  675,  675,  675,  729,

			  726,  717,  677,  677,  677,  677,  677,  677,  718,  611,
			  877,  679,  679,  679,  679,  679,  679,  719,  877,  252,
			  253,  846,  252,  253,  252,  253,  877,  730,  302,  877,
			  725,  302,  846,  302,  252,  253,  731,  252,  253,  727,
			  252,  253,  846,  302,  753,  863,  302,  877,  612,  302,
			  252,  253,  703,  703,  703,  703,  703,  703,  877,  302,
			  846,  753,  863,  733,  732,  753,  863,  877,  643,  735,
			  701,  701,  701,  701,  701,  701,  703,  703,  703,  703,
			  703,  703,  739,  739,  739,  739,  739,  739,  877,  753,
			  863,  734,  877,  740,  855,  740,  855,  738,  741,  741,

			  741,  741,  741,  741,  877,  856,  877,  644,  743,  743,
			  743,  743,  743,  743,  747,  747,  747,  747,  747,  747,
			  252,  253,  877,  252,  253,  877,  252,  253,  877,  254,
			  705,  111,  254,  857,  111,  302,  877,  749,  252,  253,
			  877,  877,  877,  252,  253,  877,  750,  254,  877,  111,
			  252,  253,  254,  383,  111,  252,  253,  751,  705,  254,
			  752,  111,  252,  253,  254,  749,  111,  877,  754,  877,
			  877,  254,  756,  111,  750,  877,  758,  877,  757,  877,
			  877,  755,  759,  252,  253,  751,  252,  253,  752,  252,
			  253,  877,  302,  758,  877,  302,  754,  877,  302,  759,

			  870,  871,  870,  871,  758,  765,  763,  769,  877,  755,
			  759,  674,  760,  760,  760,  760,  760,  676,  761,  761,
			  761,  761,  761,  252,  253,  741,  741,  741,  741,  741,
			  741,  877,  302,  766,  764,  771,  877,  877,  877,  872,
			  767,  772,  772,  772,  772,  772,  772,  773,  773,  773,
			  773,  773,  773,  578,  578,  578,  578,  578,  578,  774,
			  774,  774,  774,  774,  774,  877,  252,  253,  768,  775,
			  775,  775,  775,  775,  775,  254,  877,  111,  252,  253,
			  571,  776,  776,  776,  776,  776,  776,  254,  778,  111,
			  252,  253,  877,  252,  253,  877,  877,  705,  877,  254,

			  815,  111,  254,  877,  111,  782,  252,  253,  815,  782,
			  779,  877,  780,  252,  253,  254,  778,  111,  877,  877,
			  383,  815,  254,  783,  111,  705,  782,  783,  782,  783,
			  252,  253,  784,  785,  252,  253,  815,  782,  779,  302,
			  780,  877,  864,  302,  783,  781,  877,  252,  253,  784,
			  785,  877,  877,  877,  877,  783,  254,  877,  111,  864,
			  784,  785,  724,  864,  760,  760,  760,  760,  760,  760,
			  804,  877,  726,  781,  761,  761,  761,  761,  761,  761,
			  252,  253,  877,  252,  253,  877,  877,  864,  877,  302,
			  877,  877,  302,  739,  739,  739,  739,  739,  739,  805,

			  877,  725,  789,  793,  793,  793,  793,  793,  793,  877,
			  877,  727,  787,  744,  877,  744,  877,  877,  775,  775,
			  775,  775,  775,  775,  776,  776,  776,  776,  776,  776,
			  790,  877,  571,  877,  252,  253,  816,  252,  253,  877,
			  788,  877,  877,  254,  816,  111,  254,  877,  111,  252,
			  253,  877,  746,  796,  252,  253,  877,  816,  254,  877,
			  111,  252,  253,  254,  877,  111,  877,  877,  877,  877,
			  302,  877,  816,  797,  810,  810,  810,  810,  810,  810,
			  798,  796,  252,  253,  877,  252,  253,  877,  252,  253,
			  799,  254,  806,  111,  254,  877,  111,  254,  877,  111,

			  710,  877,  797,  252,  253,  877,  252,  253,  798,  877,
			  877,  877,  302,  816,  813,  302,  814,  877,  877,  799,
			  807,  817,  820,  820,  820,  820,  820,  820,  746,  746,
			  746,  746,  746,  746,  817,  821,  821,  821,  821,  821,
			  821,  877,  813,  877,  814,  252,  253,  824,  877,  817,
			  252,  253,  825,  710,  254,  824,  111,  877,  877,  254,
			  825,  111,  877,  877,  877,  877,  825,  877,  824,  823,
			  877,  252,  253,  825,  826,  252,  253,  877,  877,  877,
			  254,  822,  111,  824,  254,  877,  111,  826,  825,  839,
			  839,  839,  839,  839,  839,  877,  877,  823,  832,  835, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  833,  834,  826,  821,  821,  821,  821,  821,  821,  877,
			  822,  840,  840,  840,  840,  840,  841,  841,  841,  841,
			  841,  841,  877,  877,  847,  252,  253,  835,  844,  844,
			  844,  844,  844,  844,  254,  847,  111,  849,  849,  849,
			  849,  849,  849,  877,  845,  847,  850,  850,  850,  850,
			  850,  850,  841,  841,  841,  841,  841,  841,  862,  862,
			  862,  862,  862,  847,  841,  841,  841,  841,  841,  841,
			  867,  877,  845,  832,  842,  833,  851,  852,  844,  844,
			  844,  844,  844,  844,  252,  253,  853,  867,  852,  877,
			  877,  867,  877,  254,  877,  111,  877,  853,  852,  854,

			  854,  854,  854,  854,  854,  877,  877,  853,  858,  858,
			  858,  858,  858,  858,  877,  867,  852,  831,  831,  831,
			  831,  831,  831,  877,  877,  853,  861,  861,  861,  861,
			  861,  861,  832,  877,  833,  877,  877,  858,  858,  858,
			  858,  858,  858,  865,  865,  865,  865,  865,  865,  866,
			  866,  866,  866,  866,  866,  868,  869,  869,  869,  869,
			  869,  869,  857,  857,  857,  857,  857,  857,  877,  877,
			  877,  877,  868,  877,  877,  877,  868,  873,  873,  873,
			  873,  873,  873,  874,  874,  874,  874,  874,  874,  875,
			  875,  875,  875,  875,  875,  877,  870,  877,  870,  877,

			  868,  874,  874,  874,  874,  874,  874,  876,  876,  876,
			  876,  876,  876,  872,  872,  872,  872,  872,  872,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  877,  877,
			  877,  877,  877,  877,  877,  872,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   93,   93,

			  877,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,  877,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   95,
			   95,  877,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  102,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  110,  110,  110,  110,  877,  110,  110,  110,
			  110,  877,  877,  877,  110,  110,  110,  110,  110,  110,

			  110,  110,  110,  143,  143,  877,  143,  877,  143,  143,
			  143,  877,  877,  143,  143,  143,  143,  877,  877,  877,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  145,
			  145,  877,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  204,  204,  877,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  877,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  214,  214,  214,  214,  214,  214,  214,  214,  214,

			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  224,  877,  224,  877,  877,  877,  877,
			  224,  877,  224,  224,  224,  877,  877,  224,  224,  224,
			  224,  877,  877,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  231,  231,  877,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  102,  102,  102,  102,  877,
			  877,  102,  102,  102,  102,  102,  877,  877,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  255,  877,  877,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  877,
			  877,  877,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  216,  216,  216,  216,  216,  216,  216,  216,  216,

			  877,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  389,  389,  389,  877,  877,  389,  389,
			  389,  389,  877,  877,  877,  389,  389,  389,  389,  389,
			  389,  389,  389,  389,  390,  390,  390,  877,  877,  390,
			  390,  390,  390,  877,  877,  877,  390,  390,  390,  390,
			  390,  390,  390,  390,  390,  296,  296,  296,  296,  877,

			  877,  296,  296,  296,  296,  296,  877,  877,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  362,  362,  362,
			  362,  362,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  362,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  362,  362,  362,  362,  362,  362,  362,  493,  493,
			  493,  493,  877,  877,  877,  493,  493,  493,  493,  493,
			  493,  493,  493,  493,  431,  431,  431,  877,  877,  431,
			  431,  431,  431,  431,  431,  431,  431,  877,  877,  431,
			  431,  431,  431,  877,  877,  877,  431,  431,  431,  431,
			  431,  431,  431,  431,  431,  580,  580,  580,  580,  877,

			  877,  877,  580,  580,  580,  580,  580,  580,  580,  580,
			  580,  581,  581,  581,  877,  877,  581,  581,  581,  581,
			  877,  877,  877,  581,  581,  581,  581,  581,  581,  581,
			  581,  581,  654,  654,  654,  877,  877,  654,  654,  654,
			  654,  877,  877,  877,  654,  654,  654,  654,  654,  654,
			  654,  654,  654,  748,  748,  748,  748,  877,  877,  877,
			  748,  748,  748,  748,  748,  748,  748,  748,  748,  777,
			  777,  777,  877,  877,  777,  777,  777,  777,  877,  877,
			  877,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  811,  811,  811,  877,  877,  811,  811,  811,  811,  877, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  877,  877,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,    9,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,

			  877,  877,  877,  877, yy_Dummy>>,
			1, 104, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5103)
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
			    1,    1,    1,    3,    5,   16,    6,    3,    4,  487,

			  487,   11,    4,   11,   11,   23,   74,   23,   23,   23,
			   23,   23,   23,   25,   33,   25,   34,   25,   25,   25,
			   25,   25,   25,   33,   34,   39,   45,   33,   40,   33,
			    5,    5,    6,    6,   35,   41,   39,   45,   35,   41,
			   16,   59,   40,   40,    3,   45,   61,   35,   40,    4,
			  853,   33,   34,   74,  852,   33,   25,   33,   72,  228,
			   72,   72,  228,  843,   39,   45,   35,   41,  833,   59,
			   40,   40,  825,   45,   61,   35,   40,  824,    3,    3,
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
			   57,   43,   38,   47,   37,  102,   38,   43,  795,   42,

			   67,   57,  785,   48,   62,   37,   46,   66,   38,   47,
			   43,   90,  230,   90,   90,  230,   76,   85,   57,   78,
			   85,   46,   37,   26,   38,   43,   46,   42,   48,   67,
			   57,  102,   62,  773,   37,   66,   38,   47,   43,   44,
			   44,   44,   44,   44,   44,   44,   54,   54,   44,   46,
			   63,   54,   58,   54,   46,   44,   55,   48,   64,  152,
			  153,   55,   44,   63,   58,   55,   64,   55,  739,   44,
			   85,   44,  144,   44,   54,   54,   60,   60,   63,   54,
			   58,   54,   60,   44,   55,  201,   64,  152,  153,   55,
			   44,   63,   58,   55,   64,   55,   76,   60,   78,   78,

			   44,  154,   44,   53,   60,   60,   53,  390,   75,  144,
			   60,   53,  727,   77,  201,  390,   79,  673,   53,   53,
			   53,   53,   53,   53,   53,   53,  353,  160,  162,  154,
			  672,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,  160,  162,  671,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   56,  777,  777,   56,   75,   75,   75,  670,
			   56,   77,   77,   77,   79,   79,   79,   56,   56,   56,

			   56,   56,   56,   56,   56,  654,  353,  650,  163,  644,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   80,   82,  163,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   65,   83,  350,   87,  520,   65,   87,  520,  166,
			   80,   80,   82,   82,  110,  110,   87,   87,   88,  296,
			  612,   88,  598,  110,  581,  110,  170,   87,  147,   65,
			   88,  147,  350,   97,   65,  573,  147,  166,   83,   83,

			  565,   88,   97,   97,   97,   97,   97,   97,  100,  100,
			  100,  100,  100,  100,  170,  296,  171,   87,  103,  103,
			  103,  103,  103,  103,  100,  104,  104,  104,  104,  104,
			  104,   88,  106,  106,  106,  106,  106,  106,   97,  122,
			  122,  104,  156,  156,  171,  175,  175,  100,  122,  529,
			  122,  156,  100,   97,  175,  176,  105,   97,  105,   97,
			  105,  105,  105,  105,  105,  105,  105,  433,  107,  104,
			  107,  528,  107,  107,  107,  107,  107,  107,  112,  112,
			  526,  113,  113,  176,  114,  114,  177,  112,  529,  112,
			  113,  521,  113,  114,  167,  114,  433,  115,  115,  105,

			  167,  503,  114,  183,  185,  113,  115,  187,  115,  188,
			  112,  107,  116,  116,  177,  157,  157,  115,  118,  118,
			  567,  116,  167,  116,  157,  117,  117,  118,  167,  118,
			  114,  183,  185,  113,  117,  187,  117,  188,  112,  119,
			  119,  206,  116,  206,  206,  115,  191,  157,  119,  118,
			  119,  192,  117,  787,  120,  120,  119,  121,  121,  567,
			  123,  123,  119,  120,  791,  120,  121,  196,  121,  123,
			  116,  123,  124,  124,  191,  157,  359,  118,  120,  192,
			  117,  124,  787,  124,  119,  125,  125,  121,  123,  124,
			  119,  126,  126,  791,  125,  196,  125,  195,  127,  127,

			  126,  195,  126,  128,  128,  218,  120,  127,  480,  127,
			  129,  129,  128,  359,  128,  121,  123,  124,  549,  129,
			  128,  129,  473,  126,  491,  195,  549,  125,  129,  195,
			  127,  199,  131,  131,  131,  132,  132,  132,  138,  138,
			  214,  131,  218,  218,  132,  430,  132,  138,  128,  138,
			  131,  126,  133,  133,  133,  220,  129,  131,  127,  199,
			  392,  133,  298,  133,  131,  491,  131,  132,  131,  389,
			  133,  138,  239,  217,  239,  239,  214,  214,  131,  379,
			  180,  180,  158,  158,  133,  131,  133,  161,  161,  180,
			  298,  158,  220,  220,  302,  131,  161,  131,  133,  138,

			  367,  302,  172,  172,  305,  305,  158,  161,  180,  217,
			  217,  172,  362,  305,  818,  133,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  172,  134,  135,  135,
			  135,  136,  136,  136,  158,  161,  180,  135,  134,  135,
			  136,  134,  136,  818,  139,  139,  135,  134,  299,  136,
			  159,  159,  361,  139,  172,  139,  136,  344,  306,  159,
			  135,  137,  137,  136,  326,  136,  134,  139,  159,  134,
			  137,  139,  137,  319,  135,  134,  299,  136,  140,  140,
			  137,  210,  308,  137,  136,  223,  306,  140,  223,  140,
			  426,  141,  141,  426,  136,  139,  159,  140,  782,  139, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  141,  209,  141,  142,  142,  597,  164,  164,  137,  301,
			  308,  137,  142,  597,  142,  164,  297,  165,  165,  811,
			  811,  141,  168,  168,  309,  140,  165,  211,  169,  169,
			  293,  168,  173,  173,  182,  182,  164,  169,  223,  142,
			  782,  173,  826,  182,  165,  169,  426,  194,  194,  141,
			  826,  169,  309,  168,  181,  181,  194,  189,  189,  210,
			  210,  210,  173,  181,  164,  255,  189,  254,  142,  150,
			  150,  181,  165,  169,  189,  312,  182,  245,  150,  169,
			  194,  168,  209,  209,  209,  209,  209,  244,  179,  179,
			  173,  179,  179,  179,  179,  179,  179,  179,  238,  181,

			  258,  258,  189,  312,  212,  211,  211,  211,  194,  258,
			  674,  258,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  184,  184,  186,  186,  190,
			  190,  193,  193,  213,  184,  237,  186,  236,  190,  674,
			  193,  235,  197,  197,  198,  198,  233,  190,  226,  313,
			  193,  197,  314,  198,  221,  257,  257,  184,  219,  186,
			  318,  216,  204,  198,  257,  197,  257,  202,  202,  197,
			  200,  200,  212,  212,  212,  190,  202,  313,  193,  200,
			  314,  323,  257,  224,  178,  184,  224,  186,  318,  321,

			  321,  198,  174,  197,  155,  224,  227,  197,  321,  227,
			  200,  324,  325,  202,  365,  365,  224,  365,  227,  323,
			  257,  213,  213,  213,  250,  250,  250,  250,  250,  227,
			  234,  234,  234,  234,  234,  234,  234,  151,  200,  324,
			  325,  321,  202,  242,  148,  242,  224,  145,  242,  242,
			  242,  242,  242,  242,  366,  366,  143,  366,  130,  227,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  241,  241,  241,  241,  241,  241,  243,  243,
			  243,  243,  243,  243,   99,   98,  316,  316,  241,  246,
			  246,  246,  246,  246,  246,  316,  247,  247,  247,  247,
			  247,  247,  251,  251,  251,  251,  251,  251,  333,  333,
			  316,  241,  247,  248,  784,  248,  241,  333,  248,  248,

			  248,  248,  248,  248,  249,  784,  249,   95,  249,  249,
			  249,  249,  249,  249,  676,  247,  256,  256,  316,   93,
			  247,  259,  259,   91,  330,  256,  334,  256,  260,  260,
			  259,   86,  259,  261,  261,  256,  784,  260,  335,  260,
			  262,  262,  261,   71,  261,   68,  260,  249,  259,  262,
			  338,  262,  330,  676,  334,   52,  263,  263,   49,  262,
			  264,  264,  339,  256,  261,  263,  335,  263,   36,  264,
			  267,  264,  265,  265,  260,  267,  259,   31,  338,  342,
			  263,  265,  343,  265,  266,  266,  267,  262,  268,  268,
			  339,  264,  261,  266,   29,  266,  267,  268,   24,  268,

			  269,  269,  355,  265,  270,  270,   22,  342,  263,  269,
			  343,  269,  268,  270,  267,  270,  331,  331,  375,  264,
			   14,  271,  271,  432,  269,  331,  266,  270,  272,  272,
			  271,  265,  271,  331,  273,  273,   13,  272,  271,  272,
			  268,  375,   12,  273,    9,  273,  375,  310,  310,  274,
			  274,  432,  269,  276,  276,  270,  310,    0,  274,    0,
			  274,  331,  276,    0,  276,  310,  271,  273,  274,  277,
			  277,    0,  277,  277,  277,  277,  277,  277,  277,    0,
			  277,  355,  355,  278,  278,  276,  278,  278,  278,  278,
			  278,  278,  278,  310,  278,  273,  274,    0,    0,  279,

			  279,  277,  279,  279,  279,  279,  279,  279,  279,  281,
			  279,  281,  281,  304,  304,  278,  280,  280,  280,  280,
			  280,  280,  304,  282,  282,  282,  282,  282,  282,    0,
			  437,  279,  281,  439,    0,  281,  283,  283,  283,    0,
			  304,  281,  282,  347,  347,  283,    0,  283,  284,  284,
			  284,    0,  347,  285,  285,    0,    0,  284,  437,  284,
			  281,  439,  285,  281,  285,  286,  286,  283,  304,  281,
			  282,  287,  287,    0,  286,    0,  286,  288,  288,  285,
			  287,  427,  287,  289,  289,  347,  288,    0,  288,  427,
			  287,  440,  289,  444,  289,  283,  349,  349,    0,    0,

			  290,  290,    0,  291,  291,  349,  288,  285,    0,  290,
			    0,  290,  291,  289,  291,  292,  292,  445,  287,  440,
			  427,  444,    0,    0,  292,    0,  292,  294,  294,  294,
			  294,  294,  294,  294,  288,  303,  303,  307,  307,  311,
			  311,  289,  290,    0,  303,  445,  307,    0,  311,  315,
			  315,  292,  317,  317,  303,  322,  320,  320,  315,  352,
			    0,  317,  322,    0,  307,  320,  354,  322,  315,  327,
			  311,  327,  327,  327,  327,  327,  327,    0,  322,    0,
			  292,  356,  303,  317,  328,  328,  357,  320,  322,    0,
			  329,  329,  307,  328,  336,  336,  315,    0,  311,  329,

			  337,  337,    0,  336,  340,  340,  322,  358,  328,  337,
			    0,  317,  449,  340,  329,  320,  341,  341,    0,  337,
			  345,  345,  346,  346,    0,  341,  450,  336,  452,  345,
			  340,  346,  351,  351,    0,  341,  328,  352,  352,  352,
			  449,  351,  329,    0,  354,  354,  354,  337,  453,  345,
			  363,  363,  346,  363,  450,  336,  452,    0,  340,  356,
			  356,  356,  363,  341,  357,  357,  357,  454,  351,    0,
			  398,  398,  458,  363,  446,  446,  453,  345,    0,  398,
			  346,  398,    0,  446,    0,  358,  358,  358,  370,  370,
			  370,  370,  370,  370,  370,  454,    0,  351,    0,    0,

			  458,    0,    0,  363,  376,  376,  376,  376,  376,  376,
			  377,  377,  377,  377,  377,  377,  378,  378,  378,  378,
			  378,  378,  380,  380,  380,  380,  380,  380,  381,  381,
			  381,  381,  381,  381,  383,  383,  383,  383,  383,  383,
			  460,  461,  468,    0,  381,  382,    0,  382,    0,  377,
			  382,  382,  382,  382,  382,  382,  384,  384,  384,  384,
			  384,  384,  466,  466,  792,  792,  792,  381,  460,  461,
			  468,  466,  381,  385,  385,  385,  385,  385,  385,  386,
			  386,    0,  386,  386,  386,  386,  386,  386,  387,  387,
			  387,  387,  387,  387,  388,  388,  388,  388,  388,  388, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  393,  393,    0,    0,  394,  394,  403,  395,  395,  393,
			    0,  393,  385,  394,    0,  394,  395,  403,  395,  469,
			  396,  396,  533,  397,  397,    0,  535,  403,    0,  396,
			  393,  396,  397,    0,  397,  399,  399,  395,  394,    0,
			  400,  400,  397,  396,  399,  403,  399,  469,    0,  400,
			  533,  400,  405,  405,  535,  401,  401,    0,  393,    0,
			  536,  405,    0,  405,  401,  395,  401,  394,  399,    0,
			  397,  396,  400,    0,  401,  402,  402,    0,  404,  404,
			    0,    0,  406,  406,  402,  405,  402,  404,  536,  404,
			  402,  406,    0,  406,  407,  407,  399,  410,  408,  408,

			  400,  404,  401,  407,    0,  407,    0,  408,  406,  408,
			  409,  409,    0,  405,  418,  418,  407,  410,  402,  409,
			  410,  409,  539,  418,    0,  418,  410,  544,  408,  404,
			  411,  411,  411,  411,  411,  411,  406,  546,  419,  419,
			  409,    0,  421,  421,  407,  410,    0,  419,  410,  419,
			  539,  421,  411,  421,  410,  544,  408,  412,  412,  412,
			  412,  412,  412,  411,    0,  546,  425,  425,  409,  413,
			  413,  413,  413,  413,  413,  425,  470,  425,    0,  412,
			  411,  414,  414,  414,  414,  414,  414,  470,  412,    0,
			  412,    0,  411,  415,  415,  415,  415,  415,  415,    0,

			    0,    0,  413,    0,  470,  447,  447,  412,  416,  416,
			  416,  416,  416,  416,  447,  470,  420,  412,    0,  412,
			    0,  420,  547,  416,  417,  417,  417,  417,  417,  417,
			    0,  413,  420,    0,    0,  422,  422,    0,  447,  417,
			  467,  467,  420,  553,  422,  555,  422,  423,  423,  467,
			  547,  416,    0,  514,  435,  435,  423,    0,  423,    0,
			  420,  424,  424,  435,  514,  423,  447,  417,  422,    0,
			  424,  553,  424,  555,  514,  428,  424,  428,  428,  428,
			  428,  428,  428,  428,  435,  436,  436,  424,    0,    0,
			  556,    0,  514,  423,  436,  429,  422,  429,  429,  429,

			  429,  429,  429,  429,  424,  434,  434,  434,  434,  434,
			  434,    0,  435,    0,  428,  424,  438,  438,  556,  436,
			  441,  441,  442,  442,    0,  438,  448,  448,    0,  441,
			    0,  442,    0,    0,  429,  448,  451,  451,  456,  456,
			    0,  442,  559,  441,    0,  451,  438,  456,  436,  455,
			  455,  455,  455,  455,  455,  451,  459,  459,  448,  457,
			  457,  456,    0,  462,  462,  459,  463,  463,  457,  442,
			  559,  441,  462,    0,  438,  463,  471,  471,  459,  472,
			  472,  474,  474,  451,  519,  471,  448,    0,  472,  456,
			  474,  560,  457,  462,  561,  519,  463,  472,    0,  476,

			  476,  476,  476,  476,  476,  519,  459,  494,  494,  471,
			  477,  477,  477,  477,  477,  477,  494,    0,  494,  560,
			  457,  462,  561,  519,  463,  472,  478,  478,  478,  478,
			  478,  478,  562,  706,  706,  706,  706,  471,  476,  479,
			  479,  479,  479,  479,  479,  481,  481,  481,  481,  481,
			  481,  482,  482,  482,  482,  482,  482,    0,  610,    0,
			  562,  481,  483,  483,  483,  483,  483,  483,  484,  484,
			  484,  484,  484,  484,  485,  485,  485,  485,  485,  485,
			    0,  615,    0,  619,  481,  490,  610,  490,    0,  481,
			  486,  486,  486,  486,  486,  486,  490,    0,    0,  495,

			  495,  483,  488,  488,  488,  488,  488,  488,  495,  615,
			  495,  619,  489,  485,  489,  489,  489,  489,  489,  489,
			  496,  496,    0,    0,  490,  497,  497,    0,    0,  496,
			    0,  496,    0,    0,  497,    0,  497,  498,  498,  496,
			    0,  495,    0,  499,  499,    0,  498,    0,  498,  500,
			  500,  497,  499,    0,  499,  498,  531,  531,  500,    0,
			  500,  499,  501,  501,    0,  531,    0,  496,  500,  538,
			  538,  501,    0,  501,  590,  502,  502,    0,  538,  497,
			  500,  504,  504,  498,  502,    0,  502,  538,    0,  499,
			  504,  590,  504,  505,  505,  590,  500,    0,  620,  502,

			  504,    0,  505,    0,  505,  506,  506,    0,  500,  532,
			  532,  505,  507,  507,  506,  538,  506,    0,  532,  590,
			    0,  507,  625,  507,  508,  508,  620,  502,  504,  509,
			  509,  507,    0,  508,    0,  508,    0,    0,  509,  505,
			  509,  510,  510,  510,  510,  510,  510,    0,  509,  626,
			  625,  532,    0,    0,  508,  627,    0,    0,  511,  507,
			  511,  511,  511,  511,  511,  511,  511,    0,  630,  510,
			  513,  513,  513,  513,  513,  513,  509,  626,  540,  632,
			  515,  515,  508,  627,  516,  516,  633,  637,  511,  515,
			  540,  515,  513,  516,    0,  516,  630,  510,    0,  515,

			  517,  517,    0,  516,  545,  545,  540,  632,    0,  517,
			  638,  517,  639,  545,  633,  637,  511,  512,  540,  512,
			  513,  512,  512,  512,  512,  512,  512,  515,  518,  518,
			  517,  516,  534,  534,    0,    0,  512,  518,  638,  518,
			  639,  534,    0,  512,    0,    0,  678,  537,  537,  512,
			  680,  534,  648,  551,  551,  518,  537,    0,  517,    0,
			    0,    0,  551,  530,  512,  530,  530,  530,  530,  530,
			  530,  512,  551,  537,  678,  648,    0,  512,  680,  534,
			  648,    0,  683,  518,  522,  522,  522,  522,  522,  522,
			  522,  524,  524,  524,  524,  524,  524,  524,  541,  541,

			  551,  537,  530,  542,  542,  557,  557,  541,  583,  583,
			  683,    0,  542,    0,  557,  693,  541,  583,  697,  583,
			    0,  550,  542,  550,  550,  550,  550,  550,  550,  550,
			  552,  552,  554,  554,  542,  557,  558,  558,  603,  552,
			    0,  554,    0,  693,  541,  558,  697,    0,  552,  603,
			  542,  554,  563,  563,  698,  558,  564,  564,    0,  603,
			    0,  563,  542,  557,    0,  564,  577,  577,  577,  577,
			  577,  563,  614,  614,  699,  564,  552,  603,    0,  554,
			    0,  614,  698,  558,  566,  566,  566,  566,  566,  566,
			  568,    0,  568,  568,  568,  568,  568,  568,    0,  563,

			  728,    0,  699,  564,  569,  569,  569,  569,  569,  569,
			  570,  570,  570,  570,  570,  570,    0,    0,  618,  618,
			  569,  571,  571,  571,  571,  571,  571,  618,  728,  568,
			  572,  572,  572,  572,  572,  572,  574,  574,  574,  574,
			  574,  574,  575,  575,  575,  575,  575,  575,  569,  570,
			  576,  576,  576,  576,  576,  576,  579,  579,  579,  579,
			  579,  579,  582,  582,  729,  584,  584,  708,  708,  708,
			  708,  582,  579,  582,  584,    0,  584,  582,  585,  585,
			  584,    0,  586,  586,    0,  587,  587,  585,    0,  585,
			  731,  586,  729,  586,  587,    0,  587,  733,  588,  588, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  579,  586,    0,  589,  589,  582,  708,  588,  584,  588,
			    0,  587,  589,    0,  589,  591,  591,    0,  731,  592,
			  592,    0,  593,  593,  591,  733,  591,  589,  592,  586,
			  592,  593,    0,  593,  595,  595,    0,    0,  592,  587,
			  594,  594,  735,  595,    0,  595,  591,  599,  599,  594,
			    0,  594,  595,  593,    0,  589,  599,  736,  599,  594,
			  600,  600,    0,  604,  602,  602,  592,  601,  601,  600,
			  735,  600,  605,  602,  591,  602,  601,  604,  601,    0,
			  595,  593,  602,  762,  601,  736,  605,  594,  604,    0,
			  600,  606,  606,  606,  606,  606,  606,  605,  604,  609,

			  609,  609,  609,  609,  609,  617,  617,  605,  623,  623,
			  602,  762,  601,    0,  617,    0,  604,  623,  600,    0,
			  617,    0,    0,    0,  607,  605,  607,  607,  607,  607,
			  607,  607,  607,  608,  623,  608,  608,  608,  608,  608,
			  608,  608,  611,  611,  611,  611,  611,  611,  617,  622,
			  622,  624,  624,    0,  660,  628,  628,    0,  622,  763,
			  624,  767,  623,  607,  628,  629,  629,    0,  622,  631,
			  631,  660,  608,    0,  629,  660,  634,  634,  631,  635,
			  635,  640,  640,  770,  629,  634,  628,  763,  635,  767,
			  640,    0,  641,  641,    0,  634,  622,  635,    0,  660,

			  631,  641,  642,  642,  642,  642,  642,  642,    0,    0,
			    0,  770,  629,    0,  628,  643,  643,  643,  643,  643,
			  643,  786,  641,  634,  645,  635,  645,    0,  631,  645,
			  645,  645,  645,  645,  645,  646,  646,  646,  646,  646,
			  646,  647,  647,  647,  647,  647,  647,    0,    0,  786,
			  641,  649,  649,  649,  649,  649,  649,  651,  651,  651,
			  651,  651,  651,  652,  652,  652,  652,  652,  652,  789,
			    0,  803,  655,  655,  646,  653,  653,  653,  653,  653,
			  653,  655,  808,  655,  656,  656,  720,  657,  657,    0,
			  720,  653,    0,  656,  819,  656,  657,  789,  657,  803,

			  658,  658,  655,    0,  659,  659,    0,  720,  656,  658,
			  808,  658,  721,  659,  653,  659,  721,  658,  720,  653,
			  661,  661,  819,  662,  662,    0,  663,  663,  827,  661,
			  655,  661,  662,  721,  662,  663,  656,  663,  664,  664,
			  666,  665,  665,    0,  721,  658,  838,  664,    0,  664,
			  665,  820,  665,  820,  667,  667,  827,  666,  668,  668,
			    0,  666,  820,  667,  664,  667,    0,  668,    0,  668,
			  669,  669,    0,  667,  838,  681,  681,  684,  684,  669,
			  668,  669,    0,    0,  681,  666,  684,    0,    0,  669,
			  820,  675,  664,  675,  675,  675,  675,  675,  675,  681,

			  677,  667,  677,  677,  677,  677,  677,  677,  668,  679,
			    0,  679,  679,  679,  679,  679,  679,  669,    0,  685,
			  685,  836,  689,  689,  690,  690,    0,  681,  685,    0,
			  675,  689,  836,  690,  692,  692,  685,  695,  695,  677,
			  696,  696,  836,  692,  716,  859,  695,    0,  679,  696,
			  700,  700,  702,  702,  702,  702,  702,  702,    0,  700,
			  836,  716,  859,  695,  685,  716,  859,    0,  701,  700,
			  701,  701,  701,  701,  701,  701,  703,  703,  703,  703,
			  703,  703,  704,  704,  704,  704,  704,  704,    0,  716,
			  859,  695,    0,  705,  850,  705,  850,  700,  705,  705,

			  705,  705,  705,  705,    0,  850,    0,  701,  707,  707,
			  707,  707,  707,  707,  709,  709,  709,  709,  709,  709,
			  711,  711,    0,  712,  712,    0,  766,  766,    0,  711,
			  709,  711,  712,  850,  712,  766,    0,  711,  713,  713,
			    0,    0,    0,  715,  715,    0,  712,  713,    0,  713,
			  717,  717,  715,  709,  715,  719,  719,  713,  709,  717,
			  715,  717,  718,  718,  719,  711,  719,    0,  717,    0,
			    0,  718,  722,  718,  712,    0,  722,    0,  723,    0,
			    0,  718,  723,  730,  730,  713,  732,  732,  715,  738,
			  738,    0,  730,  722,    0,  732,  717,    0,  738,  723,

			  866,  866,  866,  866,  722,  732,  730,  738,    0,  718,
			  723,  724,  724,  724,  724,  724,  724,  726,  726,  726,
			  726,  726,  726,  734,  734,  740,  740,  740,  740,  740,
			  740,    0,  734,  732,  730,  738,    0,    0,    0,  866,
			  734,  741,  741,  741,  741,  741,  741,  742,  742,  742,
			  742,  742,  742,  743,  743,  743,  743,  743,  743,  744,
			  744,  744,  744,  744,  744,    0,  749,  749,  734,  745,
			  745,  745,  745,  745,  745,  749,    0,  749,  750,  750,
			  741,  747,  747,  747,  747,  747,  747,  750,  749,  750,
			  751,  751,    0,  752,  752,    0,    0,  747,    0,  751,

			  800,  751,  752,    0,  752,  756,  754,  754,  800,  756,
			  750,    0,  752,  755,  755,  754,  749,  754,    0,    0,
			  747,  800,  755,  757,  755,  747,  756,  757,  758,  759,
			  771,  771,  758,  759,  788,  788,  800,  756,  750,  771,
			  752,    0,  860,  788,  757,  755,    0,  797,  797,  758,
			  759,    0,    0,    0,    0,  757,  797,    0,  797,  860,
			  758,  759,  760,  860,  760,  760,  760,  760,  760,  760,
			  788,    0,  761,  755,  761,  761,  761,  761,  761,  761,
			  764,  764,    0,  768,  768,    0,    0,  860,    0,  764,
			    0,    0,  768,  772,  772,  772,  772,  772,  772,  788,

			    0,  760,  768,  774,  774,  774,  774,  774,  774,    0,
			    0,  761,  764,  775,    0,  775,    0,    0,  775,  775,
			  775,  775,  775,  775,  776,  776,  776,  776,  776,  776,
			  768,    0,  772,    0,  778,  778,  801,  779,  779,    0,
			  764,    0,    0,  778,  801,  778,  779,    0,  779,  780,
			  780,    0,  775,  778,  781,  781,    0,  801,  780,    0,
			  780,  790,  790,  781,    0,  781,    0,    0,    0,    0,
			  790,    0,  801,  779,  793,  793,  793,  793,  793,  793,
			  780,  778,  796,  796,    0,  798,  798,    0,  799,  799,
			  781,  796,  790,  796,  798,    0,  798,  799,    0,  799,

			  802,    0,  779,  805,  805,    0,  807,  807,  780,    0,
			    0,    0,  805,  802,  796,  807,  799,    0,    0,  781,
			  790,  802,  809,  809,  809,  809,  809,  809,  810,  810,
			  810,  810,  810,  810,  802,  812,  812,  812,  812,  812,
			  812,    0,  796,    0,  799,  813,  813,  815,    0,  802,
			  814,  814,  816,  817,  813,  815,  813,    0,    0,  814,
			  816,  814,    0,    0,    0,    0,  817,    0,  815,  814,
			    0,  822,  822,  816,  817,  823,  823,    0,    0,    0,
			  822,  813,  822,  815,  823,    0,  823,  817,  816,  829,
			  829,  829,  829,  829,  829,    0,    0,  814,  821,  822, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  821,  821,  817,  821,  821,  821,  821,  821,  821,    0,
			  813,  830,  830,  830,  830,  830,  832,  832,  832,  832,
			  832,  832,    0,    0,  837,  835,  835,  822,  834,  834,
			  834,  834,  834,  834,  835,  837,  835,  839,  839,  839,
			  839,  839,  839,    0,  835,  837,  840,  840,  840,  840,
			  840,  840,  841,  841,  841,  841,  841,  841,  856,  856,
			  856,  856,  856,  837,  842,  842,  842,  842,  842,  842,
			  863,    0,  835,  844,  832,  844,  844,  846,  844,  844,
			  844,  844,  844,  844,  845,  845,  847,  863,  846,    0,
			    0,  863,    0,  845,    0,  845,    0,  847,  846,  849,

			  849,  849,  849,  849,  849,    0,    0,  847,  851,  851,
			  851,  851,  851,  851,    0,  863,  846,  854,  854,  854,
			  854,  854,  854,    0,    0,  847,  855,  855,  855,  855,
			  855,  855,  858,    0,  858,    0,    0,  858,  858,  858,
			  858,  858,  858,  861,  861,  861,  861,  861,  861,  862,
			  862,  862,  862,  862,  862,  864,  865,  865,  865,  865,
			  865,  865,  869,  869,  869,  869,  869,  869,    0,    0,
			    0,    0,  864,    0,    0,    0,  864,  870,  870,  870,
			  870,  870,  870,  871,  871,  871,  871,  871,  871,  873,
			  873,  873,  873,  873,  873,    0,  874,    0,  874,    0,

			  864,  874,  874,  874,  874,  874,  874,  875,  875,  875,
			  875,  875,  875,  876,  876,  876,  876,  876,  876,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,    0,    0,
			    0,    0,    0,    0,    0,  874,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  880,  880,

			    0,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,    0,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  881,
			  881,    0,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  882,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  883,  883,  883,  883,    0,  883,  883,  883,
			  883,    0,    0,    0,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  884,  884,    0,  884,    0,  884,  884,
			  884,    0,    0,  884,  884,  884,  884,    0,    0,    0,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  885,
			  885,    0,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  886,  886,    0,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			    0,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  887,  887,  887,  887,  887,  887,  887,  887,  887,

			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  889,    0,  889,    0,    0,    0,    0,
			  889,    0,  889,  889,  889,    0,    0,  889,  889,  889,
			  889,    0,    0,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  890,  890,    0,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  892,  892,  892,  892,    0,
			    0,  892,  892,  892,  892,  892,    0,    0,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  893,    0,    0,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,    0,
			    0,    0,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  895,  895,  895,  895,  895,  895,  895,  895,  895,

			    0,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  897,  897,  897,    0,    0,  897,  897,
			  897,  897,    0,    0,    0,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  898,  898,  898,    0,    0,  898,
			  898,  898,  898,    0,    0,    0,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  899,  899,  899,  899,    0,

			    0,  899,  899,  899,  899,  899,    0,    0,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  901,  901,
			  901,  901,    0,    0,    0,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  902,  902,  902,    0,    0,  902,
			  902,  902,  902,  902,  902,  902,  902,    0,    0,  902,
			  902,  902,  902,    0,    0,    0,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  903,  903,  903,  903,    0,

			    0,    0,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  904,  904,  904,    0,    0,  904,  904,  904,  904,
			    0,    0,    0,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  905,  905,  905,    0,    0,  905,  905,  905,
			  905,    0,    0,    0,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  906,  906,  906,  906,    0,    0,    0,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  907,
			  907,  907,    0,    0,  907,  907,  907,  907,    0,    0,
			    0,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  908,  908,  908,    0,    0,  908,  908,  908,  908,    0, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,

			  877,  877,  877,  877, yy_Dummy>>,
			1, 104, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0, 1544,
			 5011,   99, 1539, 1509, 1513, 5011,   86, 5011, 5011, 5011,
			 5011, 5011, 1491,   89, 1481,   99,  266, 5011, 5011, 1467,
			 5011, 1450, 5011,   88,   90,  108, 1442,  255,  266,   99,
			  102,  109,  257,  265,  322,  100,  280,  267,  277, 1392,
			 5011, 5011, 1399,  401,  312,  326,  480,  251,  322,  104,
			  336,  116,  262,  318,  321,  520,  265,  249, 1428, 5011,
			 5011, 1436,  156, 5011,   99,  401,  309,  406,  312,  409,
			  517, 5011,  518,  545, 5011,  315, 1428,  562,  576, 5011,
			  309, 1420, 5011, 1412, 5011, 1398,    0,  584, 1362, 1348,

			  590, 5011,  278,  600,  607,  642,  614,  654, 5011, 5011,
			  559,    0,  663,  666,  669,  682,  697,  710,  703,  724,
			  739,  742,  624,  745,  757,  770,  776,  783,  788,  795,
			 1175,  817,  820,  837,  901,  913,  916,  946,  823,  929,
			  963,  976,  988, 1232,  348, 1191, 5011,  586, 1233,    0,
			 1054, 1220,  312,  321,  368, 1138,  627,  700,  867,  935,
			  392,  872,  383,  466,  991, 1002,  523,  662, 1007, 1013,
			  547,  571,  887, 1017, 1178,  630,  612,  654, 1137, 1073,
			  865, 1039, 1019,  656, 1120,  657, 1122,  675,  676, 1042,
			 1124,  712,  703, 1126, 1032,  759,  733, 1137, 1139,  786,

			 1165,  334, 1162, 5011, 1165, 5011,  739, 5011, 5011,  994,
			  974, 1020, 1097, 1136,  823, 5011, 1117,  856,  788, 1113,
			  838, 1110, 5011,  983, 1191, 5011, 1155, 1204,  157, 1259,
			  310, 5011, 5011, 1147, 1213, 1142, 1138, 1136, 1089,  870,
			 5011, 1334, 1230, 1340, 1070, 1011, 1351, 1358, 1380, 1390,
			 1206, 1364,    0,    0, 1043, 1037, 1401, 1150, 1085, 1406,
			 1413, 1418, 1425, 1441, 1445, 1457, 1469, 1446, 1473, 1485,
			 1489, 1506, 1513, 1519, 1534, 5011, 1538, 1554, 1568, 1584,
			 1598, 1595, 1605, 1621, 1633, 1638, 1650, 1656, 1662, 1668,
			 1685, 1688, 1700, 1006, 1709, 5011,  562,  999,  828,  906,

			    0,  948,  877, 1720, 1598,  889,  916, 1722,  949,  978,
			 1532, 1724, 1041, 1120, 1116, 1734, 1351, 1737, 1124,  916,
			 1741, 1184, 1738, 1152, 1172, 1174,  948, 1753, 1769, 1775,
			 1392, 1501,    0, 1373, 1378, 1404, 1779, 1785, 1409, 1428,
			 1789, 1801, 1435, 1437,  900, 1805, 1807, 1628,    0, 1681,
			  512, 1817, 1752,  419, 1759, 1495, 1774, 1779, 1800,  759,
			 5011,  897,  909, 1848, 5011, 1212, 1252,  897, 5011, 5011,
			 1871, 5011, 5011, 5011, 5011, 1484, 1886, 1892, 1898,  818,
			 1904, 1910, 1932, 1916, 1938, 1955, 1964, 1970, 1976,  854,
			  391,    0,  832, 1985, 1989, 1992, 2005, 2008, 1855, 2020,

			 2025, 2040, 2060, 1977, 2063, 2037, 2067, 2079, 2083, 2095,
			 2080, 2112, 2139, 2151, 2163, 2175, 2190, 2206, 2099, 2123,
			 2192, 2127, 2220, 2232, 2246, 2151,  988, 1665, 2259, 2279,
			  779,    0, 1478,  618, 2287, 2239, 2270, 1585, 2301, 1595,
			 1657, 2305, 2307,    0, 1645, 1670, 1859, 2190, 2311, 1778,
			 1796, 2321, 1790, 1800, 1826, 2331, 2323, 2344, 1835, 2341,
			 1895, 1896, 2348, 2351,    0,    0, 1947, 2225, 1894, 1986,
			 2146, 2361, 2364,  807, 2366, 5011, 2381, 2392, 2408, 2421,
			  794, 2427, 2433, 2444, 2450, 2456, 2472,   81, 2484, 2496,
			 2472,  808,    0,    0, 2392, 2484, 2505, 2510, 2522, 2528,

			 2534, 2547, 2560,  677, 2566, 2578, 2590, 2597, 2609, 2614,
			 2623, 2642, 2703, 2652, 2224, 2665, 2669, 2685, 2713, 2355,
			  563,  631, 2766, 5011, 2773, 5011,  619,    0,  614,  633,
			 2747, 2541, 2594, 1988, 2717, 1985, 2027, 2732, 2554, 2089,
			 2644, 2783, 2788,    0, 2088, 2689, 2103, 2189,    0,  802,
			 2805, 2738, 2815, 2209, 2817, 2200, 2256, 2790, 2821, 2308,
			 2357, 2349, 2390, 2837, 2841,  543, 2866,  704, 2874, 2886,
			 2892, 2903, 2912,  538, 2918, 2924, 2932, 2848, 5011, 2938,
			    0,  569, 2947, 2793, 2950, 2963, 2967, 2970, 2983, 2988,
			 2545, 3000, 3004, 3007, 3025, 3019, 5011,  989,  558, 3032,

			 3045, 3052, 3049, 2809, 3048, 3057, 3073, 3108, 3117, 3081,
			 2428, 3124,  563,    0, 2857, 2451,    0, 3090, 2903, 2449,
			 2557,    0, 3134, 3093, 3136, 2583, 2603, 2621, 3140, 3150,
			 2622, 3154, 2645, 2653, 3161, 3164,    0, 2642, 2678, 2679,
			 3166, 3177, 3184, 3197,  492, 3211, 3217, 3223, 2718, 3233,
			  492, 3239, 3245, 3257,  489, 3257, 3269, 3272, 3285, 3289,
			 3125, 3305, 3308, 3311, 3323, 3326, 3311, 3339, 3343, 3355,
			  474,  442,  415,  402, 1094, 3375, 1398, 3384, 2701, 3393,
			 2711, 3360,    0, 2750, 3362, 3404,    0,    0,    0, 3407,
			 3409,    0, 3419, 2774,    0, 3422, 3425, 2784, 2817, 2840,

			 3435, 3452, 3434, 3458, 3464, 3480, 2415, 3490, 2954, 3496,
			    0, 3505, 3508, 3523, 5011, 3528, 3415, 3535, 3547, 3540,
			 3257, 3283, 3543, 3549, 3593, 5011, 3599,  395, 2868, 2926,
			 3568, 2956, 3571, 2965, 3608, 3009, 3023,    0, 3574,  311,
			 3607, 3623, 3629, 3635, 3641, 3651, 5011, 3663,    0, 3651,
			 3663, 3675, 3678, 5011, 3691, 3698, 3676, 3694, 3699, 3700,
			 3746, 3756, 3046, 3112, 3765,    0, 3511, 3127, 3768,    0,
			 3136, 3715, 3775,  286, 3785, 3800, 3806,  468, 3819, 3822,
			 3834, 3839,  993, 5011, 1389,  286, 3187,  702, 3719, 3223,
			 3846,  713, 1946, 3856,    0,  221, 3867, 3732, 3870, 3873,

			 3671, 3807, 3884, 3224,    0, 3888,    0, 3891, 3239, 3904,
			 3910, 1004, 3917, 3930, 3935, 3918, 3923, 3937,  863, 3260,
			 3338, 3985, 3956, 3960,  153,  148, 1026, 3285,    0, 3971,
			 3993, 5011, 3998,   95, 4010, 4010, 3392, 3995, 3312, 4019,
			 4028, 4034, 4046,  103, 4060, 4069, 4048, 4057,    0, 4081,
			 3481, 4090,  130,  126, 4099, 4108, 4040, 5011, 4119, 3416,
			 3713, 4125, 4131, 4041, 4126, 4138, 3587, 5011, 5011, 4144,
			 4159, 4165, 5011, 4171, 4183, 4189, 4195, 5011, 4235, 4266,
			 4297, 4328, 4350, 4371, 4397, 4428, 4459, 4490, 4521, 4551,
			 4582, 4613, 4635, 4659, 4196, 4690, 4721, 4742, 4763, 4785,

			 4816, 4832, 4863, 4879, 4900, 4921, 4937, 4958, 4979, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  877,    1,  878,  878,  879,  879,  877,    7,  877,
			  877,  877,  877,  877,  880,  877,  881,  877,  877,  877,
			  877,  877,  877,  877,  882,  877,  877,  877,  877,  877,
			  877,  877,  877,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  884,
			  877,  877,  885,  877,   53,   53,  877,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,  877,  877,
			  877,  886,  877,  877,  877,  886,  886,  886,  886,  886,
			  887,  877,  888,  887,  877,  889,  877,  889,  889,  877,
			  877,  877,  877,  880,  877,  890,  890,  890,  891,  877,

			  877,  877,  892,  877,  877,  877,  877,  877,  877,  877,
			  883,  893,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  877,   44,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  884,  884,  885,  877,  877,  877,  894,
			   56,  877,  150,  150,  150,  877,   56,   56,   56,   56,
			  150,   56,  150,  150,   56,   56,  150,  150,   56,   56,
			  150,  150,   56,   56,  150,   56,  150,  150,  150,   56,
			   56,   56,   56,  150,   56,  150,   56,  150,  150,   56,
			   56,  150,  150,   56,   56,  150,  150,   56,   56,  150,

			   56,  150,   56,  877,  886,  877,  877,  877,  877,  886,
			  886,  886,  886,  886,  887,  877,  895,  887,  888,  896,
			  888,  895,  877,  889,  889,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  882,  877,  877,  877,  877,  877,
			  877,  877,  897,  898,  877,  893,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  877,  883,  883,
			  883,  883,  883,  883,  883,  877,  883,  883,  883,  883,
			  134,  134,  134,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  877,  884,  877,  899,  877,  150,  150,

			  150,  877,  877,   56,   56,   56,  150,   56,  150,  150,
			   56,   56,  150,  150,  150,   56,   56,   56,  150,  150,
			   56,   56,  877,  150,  150,  150,  150,  150,   56,   56,
			  150,   56,  150,   56,  150,  150,   56,   56,  150,  150,
			   56,   56,  150,  150,  150,   56,   56,   56,  150,   56,
			  150,   56,  886,  886,  886,  886,  886,  886,  886,  895,
			  877,  896,  900,  900,  877,  900,  900,  900,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  897,
			  898,  901,  893,  883,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  877,  883,  883,  883,  883,  883,  883,
			  134,  131,  131,  131,  877,  898,  412,  412,  883,  883,
			  877,  883,  883,  883,  883,  883,  877,  884,  884,  884,
			  877,  902,  150,  150,  877,   56,   56,  150,   56,  150,
			  150,   56,   56,  150,  150,  150,   56,   56,   56,  150,
			  150,   56,  150,  150,  150,  898,   56,   56,  150,   56,
			  150,  150,   56,   56,  150,  150,   56,   56,  150,  150,
			  150,   56,   56,  150,   56,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  903,  904,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  877,  883,  883,  883,  883,  883,  883,
			  877,  898,  412,  512,  877,  883,  883,  883,  883,  897,
			  877,  877,  884,  877,  884,  877,  877,  150,  150,  877,
			  877,   56,   56,  150,   56,  150,  150,   56,   56,  150,
			  150,   56,   56,  150,  150,   56,  150,  150,  150,  898,
			  898,   56,   56,  150,   56,  150,  150,   56,   56,  150,
			  150,  150,  150,   56,   56,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  905,  904,  883,  883,  883,  883,  883,  883,  883,  883,
			  877,  883,  883,  883,  883,  883,  877,  898,  877,  883,

			  883,  883,  883,  877,  897,  897,  877,  884,  884,  877,
			  150,  877,  877,  150,   56,  150,  150,   56,   56,  150,
			  150,  150,   56,   56,   56,  150,  150,  150,   56,   56,
			  150,   56,  150,  150,   56,   56,  150,  150,  150,  150,
			   56,   56,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  905,  883,  883,  883,  883,  883,
			  877,  883,  883,  883,  883,  883,  877,  883,  883,  883,
			  877,  877,  897,  897,  877,  877,  877,  877,  150,  877,
			  150,   56,  150,  150,   56,   56,  150,  150,  150,   56,
			   56,  150,   56,  150,  150,   56,   56,  150,  150,  150,

			   56,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  906,  883,  883,  883,  877,  883,  877,  883,  883,  883,
			  877,  877,  903,  903,  877,  877,  877,  877,  150,  150,
			   56,  150,   56,  150,   56,  150,  150,  150,   56,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  907,  883,
			  883,  883,  883,  877,  883,  883,  877,  877,  905,  905,
			  877,  877,  150,  150,   56,  150,   56,  150,   56,  150,
			  150,   56,  877,  877,  877,  877,  877,  907,  883,  883,
			  883,  883,  877,  877,  905,  905,  150,  150,   56,  150,
			   56,  150,  877,  877,  908,  877,  883,  883,  883,  883,

			  877,  877,  905,  150,  150,   56,  150,   56,  150,  877,
			  877,  908,  877,  883,  883,  877,  877,  905,  150,  150,
			  877,  877,  883,  883,  877,  877,  905,  150,  150,  877,
			  877,  877,  877,  877,  877,  883,  877,  877,  150,  877,
			  877,  877,  877,  877,  877,  883,  877,  877,  150,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,    0,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,

			  877,  877,  877,  877,  877,  877,  877,  877,  877, yy_Dummy>>)
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
			   16,   16,   16,   16,   17,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   18,
			   16,   16,   19,   20,   21,   22,    5,   11,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   96,   96,    0,    0,  127,
			  125,    1,    2,   15,  109,   18,  125,   16,   17,    7,
			    6,   13,    5,   11,    8,  101,  101,   14,   12,   28,
			   10,   29,   19,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   81,   89,   89,   89,   89,   21,
			   30,   22,    9,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   23,   20,
			   24,  113,  114,  115,  116,  113,  113,  113,  113,  113,
			   96,   99,  126,   96,  126,  126,   69,  126,  126,   71,
			    1,    2,   27,  109,  108,  123,  123,  123,    3,   32,

			  107,   31,   93,    0,    0,  101,    0,  101,   26,   25,
			   89,    0,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   39,
			    0,   89,   88,   88,   80,   88,   88,   89,   89,   89,
			   89,   89,   89,    0,    0,    0,  100,    0,    0,    0,
			   92,    0,   92,   92,   92,    0,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   39,   92,
			   39,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   95,  113,  115,  114,  111,  110,  112,
			  113,  113,  113,  113,   96,   99,    0,   96,    0,    0,
			    0,   97,   98,    0,    0,   71,   69,    0,   68,    0,
			   67,  123,  117,  123,  123,  123,  123,  123,  123,    4,
			   33,  107,    0,    0,    0,    0,    0,  103,    0,  101,
			    0,    0,    0,    0,    0,    0,   89,   89,   38,   89,
			   89,   89,   89,   89,   89,   89,   89,    0,   89,   89,
			   89,   89,   41,   89,   89,   87,   81,   81,   81,   81,
			   88,   89,   88,   88,   88,   89,   89,   89,   89,   89,
			   89,   40,   89,    0,    0,   91,   94,    0,   92,   92,

			   38,    0,    0,   92,   92,   38,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,    0,   92,   92,   92,   64,   64,   92,   92,
			   92,   92,   41,   41,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   40,   40,
			   92,   92,  113,  113,  113,  113,  113,  113,  113,    0,
			   97,   98,    0,    0,   70,   68,   67,   71,  121,  124,
			  124,  122,  118,  119,  120,  107,    0,  107,    0,    0,
			    0,  103,    0,    0,    0,  106,  101,    0,    0,    0,
			    0,    0,   90,   89,   89,   89,   89,   89,   37,   89,

			   89,   89,   89,    0,   89,   89,   89,   89,   89,   89,
			   80,   89,   89,   89,    0,    0,   80,   80,   80,   36,
			    0,   43,   89,   89,   89,   89,   66,    0,    0,    0,
			    0,   61,   92,   92,    0,   92,   92,   92,   92,   92,
			   92,   92,   92,   37,   92,   92,   37,   92,   92,   92,
			   92,   92,   92,   92,   92,    0,   92,   92,   92,   92,
			   92,   92,   92,   92,   36,   43,   36,   43,   92,   92,
			   92,   92,   92,   92,   92,   98,  107,    0,    0,    0,
			  102,  103,    0,  104,    0,  106,    0,    0,    0,  101,
			   77,    0,    0,    0,   58,   89,   89,   89,   89,   89,

			   89,   44,   89,    0,   89,   89,   35,   89,   89,   89,
			    0,    0,   89,   89,    0,   89,   89,   89,   89,    0,
			   66,    0,    0,   63,    0,   62,    0,   58,   92,    0,
			    0,   58,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   44,   92,   44,   92,   92,   35,   64,
			   64,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,  107,    0,    0,    0,  103,
			  104,    0,    0,  106,    0,    0,    0,    0,   77,    0,
			    0,    0,   89,   59,   89,   60,   89,   89,   46,   89,
			    0,   89,   89,   89,   89,   89,   80,   80,    0,   52,

			   89,   89,   89,    0,    0,    0,    0,    0,    0,    0,
			   92,    0,    0,   59,   59,   92,   60,   92,   60,   92,
			   92,   46,   92,   92,   46,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   52,   92,   92,   92,
			   52,   92,    0,    0,   93,    0,  104,    0,  107,    0,
			   79,    0,    0,  105,    0,   89,   89,   57,   89,   45,
			    0,   42,   56,   34,   89,   50,    0,   89,   89,   89,
			    0,    0,    0,    0,    0,    0,    0,    0,   92,    0,
			   92,   92,   57,   92,   57,   92,   45,   42,   56,   42,
			   56,   34,   34,   92,   50,   92,   50,   92,   92,   92,

			   92,    0,    0,  104,    0,    0,    0,    0,   76,  105,
			    0,   89,   89,   89,   84,   89,    0,   89,   89,   53,
			    0,    0,    0,    0,    0,   65,    0,   94,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   53,   92,  106,
			    0,  106,    0,    0,    0,    0,   76,  105,    0,   89,
			   89,   47,   89,   83,   51,   89,    0,    0,    0,    0,
			    0,    0,   92,   92,   92,   47,   47,   92,   92,   51,
			   92,   51,  106,   78,    0,   76,  105,    0,   89,   89,
			   89,   89,   82,   82,   82,   82,   92,   92,   92,   92,
			   92,   92,    0,    0,    0,    0,   89,   49,   48,   89,

			    0,    0,    0,   92,   49,   49,   48,   48,   92,    0,
			    0,    0,    0,   89,   89,    0,    0,    0,   92,   92,
			   75,   72,   89,   54,    0,    0,    0,   92,   54,    0,
			    0,   75,    0,    0,    0,   89,    0,    0,   92,    0,
			    0,   72,    0,    0,   72,   55,    0,    0,   55,    0,
			   74,    0,    0,    0,    0,    0,    0,   74,   72,    0,
			    0,    0,    0,    0,    0,    0,   73,   85,   86,    0,
			    0,    0,   73,    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5011
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 877
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 878
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

	yyNb_rules: INTEGER = 126
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 127
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
			-- converted_codes.wipe_out
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

-------------------------------------------------------------------
--- START transitional at-code identifier codes in ADL 1.5 archetypes
---
-- 	converted_codes: HASH_TABLE [STRING, STRING]
-- 			-- table of new codes, keyed by old code found in archetype
-- 		attribute
-- 			create Result.make (0)
-- 		end
-- 
-- 	code: STRING
-- 		attribute
-- 			create Result.make_empty
-- 		end
-- 
-- 	reformatted_code: STRING
-- 		attribute
-- 			create Result.make_empty
-- 		end
---
--- END transitional at-code identifier codes in ADL 1.5 archetypes
-------------------------------------------------------------------

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER = 1024
				-- Initial size for `in_buffer'

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

end
