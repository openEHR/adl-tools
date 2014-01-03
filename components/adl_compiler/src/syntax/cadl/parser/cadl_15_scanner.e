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
			Result := (INITIAL <= sc and sc <= IN_TERM_CONSTRAINT)
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
if yy_act <= 26 then
if yy_act <= 22 then
if yy_act <= 20 then
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
--|#line 110 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 110")
end
last_token := SYM_INTERVAL_DELIM
end
else
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
end
else
if yy_act <= 24 then
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
else
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
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
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
else
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
end
else
if yy_act <= 32 then
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
else
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
else
--|#line 141 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 141")
end
last_token := SYM_ELSE
end
else
if yy_act = 38 then
--|#line 143 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 143")
end
last_token := SYM_AND
else
--|#line 145 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 145")
end
last_token := SYM_OR
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 147 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 147")
end
last_token := SYM_XOR
else
--|#line 149 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 149")
end
last_token := SYM_NOT
end
else
if yy_act = 42 then
--|#line 151 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 151")
end
last_token := SYM_IMPLIES
else
--|#line 153 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 153")
end
last_token := SYM_TRUE
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 155 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 155")
end
last_token := SYM_FALSE
else
--|#line 157 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 157")
end
last_token := SYM_FORALL
end
else
if yy_act = 46 then
--|#line 159 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 159")
end
last_token := SYM_EXISTS
else
--|#line 163 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 163")
end
last_token := SYM_EXISTENCE
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 165 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 165")
end
last_token := SYM_OCCURRENCES
else
--|#line 167 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 167")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 50 then
--|#line 169 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 169")
end
last_token := SYM_ORDERED
else
--|#line 171 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 171")
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
--|#line 173 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 173")
end
last_token := SYM_UNIQUE
else
--|#line 175 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 175")
end
last_token := SYM_USE_NODE
end
else
if yy_act = 54 then
--|#line 177 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 177")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 179 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 179")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 181 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 181")
end
last_token := SYM_INCLUDE
else
--|#line 183 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 183")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 58 then
--|#line 185 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 185")
end
last_token := SYM_AFTER
else
--|#line 187 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 187")
end
last_token := SYM_BEFORE
end
end
end
else
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 189 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 189")
end
last_token := SYM_CLOSED
else
--|#line 192 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 192")
end

			last_token := V_URI
			last_string_value := text
		
end
else
if yy_act = 62 then
--|#line 198 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 198")
end

			last_token := V_QUALIFIED_TERM_CODE_REF
			last_string_value := text_substring (2, text_count - 1)
		
else
--|#line 203 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 203")
end

			last_token := ERR_V_QUALIFIED_TERM_CODE_REF
			last_string_value := text_substring (2, text_count - 1)
		
end
end
else
if yy_act <= 65 then
if yy_act = 64 then
--|#line 211 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 211")
end

		last_token := V_ROOT_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_converted (code)
		converted_codes.put (last_string_value, code)
	
else
--|#line 217 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 217")
end

		last_token := V_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_converted (code)
		converted_codes.put (last_string_value, code)
	
end
else
if yy_act = 66 then
--|#line 223 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 223")
end

		last_token := V_ID_CODE_STR
		last_string_value := adl_14_id_code_converted (text)
	
else
--|#line 227 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 227")
end

		last_token := V_CONSTRAINT_CODE_REF
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_code_renumbered (code)
		converted_codes.put (last_string_value, code)
	
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
--|#line 240 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 240")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 246 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 246")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
else
--|#line 253 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 253")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
end
else
if yy_act = 71 then
--|#line 260 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 260")
end

		last_token := V_CONSTRAINT_CODE_REF
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 276 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 276")
end

		in_buffer.append_string (text_substring (2, text_count))
		set_start_condition (IN_TERM_CONSTRAINT)
		term_code_count := 0
		assumed_term_code_index := 0
	
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 284 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 284")
end
 -- match second last line with ';' termination (assumed value)
		str_ := text
		in_buffer.append(text)
		term_code_count := term_code_count + 1
		assumed_term_code_index := term_code_count
	
else
--|#line 291 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 291")
end
	-- match any line, with ',' termination
		str_ := text
		in_buffer.append(text)
		term_code_count := term_code_count + 1
	
end
else
if yy_act = 75 then
--|#line 298 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 298")
end
in_lineno := in_lineno + text_count
else
--|#line 301 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 301")
end
in_lineno := in_lineno + 1
end
end
end
else
if yy_act <= 80 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 303 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 303")
end
 -- match final line, terminating in ']'
		if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
			last_token := ERR_TERM_CODE_CONSTRAINT
		else
			in_buffer.append (text_substring(1, text_count-1))
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
	
else
--|#line 323 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 323")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act = 79 then
--|#line 330 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 330")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 331 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 331")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 82 then
if yy_act = 81 then
--|#line 332 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 332")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 339 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 339")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 83 then
--|#line 340 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 340")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 347 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 347")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
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
--|#line 348 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 348")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 355 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 355")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
--|#line 356 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 356")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 88 then
--|#line 368 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 368")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 378 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 378")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
end
else
if yy_act <= 91 then
if yy_act = 90 then
--|#line 383 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 383")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 393 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 393")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 92 then
--|#line 399 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 399")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 410 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 410")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
end
end
else
if yy_act <= 97 then
if yy_act <= 95 then
if yy_act = 94 then
--|#line 419 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 419")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 425 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 425")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 96 then
--|#line 431 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 431")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 437 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 437")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
else
if yy_act <= 99 then
if yy_act = 98 then
--|#line 444 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 444")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 450 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 450")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
end
else
if yy_act = 100 then
--|#line 456 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 456")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
else
--|#line 464 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 464")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[at-code]"
			last_token := V_ABS_PATH
			last_string_value := adl_14_path_converted (text)
		
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
--|#line 469 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 469")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[at-code]"
			last_token := V_REL_PATH
			last_string_value := adl_14_path_converted (text)
		
else
--|#line 478 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 478")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
--|#line 485 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 485")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 105 then
--|#line 489 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 489")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 493 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 493")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 108 then
if yy_act = 107 then
--|#line 497 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 497")
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
--|#line 509 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 509")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 109 then
--|#line 516 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 516")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 521 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 521")
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
if yy_act <= 114 then
if yy_act <= 112 then
if yy_act = 111 then
--|#line 536 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 536")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 537 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 537")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 113 then
--|#line 541 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 541")
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
--|#line 542 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 542")
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
--|#line 543 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 543")
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
--|#line 563 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 563")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 117 then
--|#line 568 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 568")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 576 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 576")
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
--|#line 578 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 578")
end
in_buffer.append_character ('"')
else
--|#line 580 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 580")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 121 then
--|#line 584 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 584")
end
in_buffer.append_string (text)
else
--|#line 586 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 586")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 124 then
if yy_act = 123 then
--|#line 591 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 591")
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
--|#line 602 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 602")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 125 then
--|#line 611 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 611")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 613 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 613")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 130 then
if yy_act <= 128 then
if yy_act = 127 then
--|#line 614 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 614")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 615 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 615")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 129 then
--|#line 616 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 616")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 617 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 617")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 132 then
if yy_act = 131 then
--|#line 619 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 619")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 620 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 620")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 133 then
--|#line 624 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 624")
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
			create an_array.make_filled (0, 0, 5754)
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
			   10,   10,   10,   72,   81,   96,   81,   73,   72,  610,

			  610,   90,   73,   90,   90,   99,  209,  100,  100,  100,
			  100,  100,  100,  103,  111,  104,  111,  105,  105,  105,
			  105,  105,  105,  112,  115,  111,  111,  113,  111,  114,
			   82,   83,   82,   83,  111,  111,  122,  137,  116,  126,
			   97,  176,  123,  124,   74,  138,  144,  117,  125,   74,
			  946,  112,  115,  210,  145,  113,  106,  114,  208,  230,
			  208,  208,  230,  945,  122,  137,  116,  126,  928,  177,
			  123,  124,  929,  138,  232,  117,  125,  232,   75,   76,
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
			  168,  111,  111,  111,  118,  301,  120,  128,  923,  127,

			  203,  169,  399,  111,  185,  119,  111,  187,  121,  141,
			  129,   90,  536,   90,   90,  537,  207,  225,  170,  207,
			  225,  139,  118,  106,  120,  128,  140,  127,  142,  204,
			  171,  201,  186,  922,  119,  188,  121,  141,  129,  130,
			  131,  131,  131,  131,  131,  131,  162,  151,  111,  139,
			  189,  151,  172,  151,  140,  132,  164,  142,  193,  202,
			  302,  151,  133,  190,  173,  165,  194,  151,  898,  134,
			  227,  135,  295,  136,  163,  157,  178,  179,  191,  157,
			  174,  157,  180,  132,  166,  357,  195,  157,  302,  157,
			  133,  192,  175,  167,  196,  157,  212,  181,  214,  214,

			  135,  157,  136,  148,  182,  183,  148,  305,  207,  298,
			  184,  149,  778,  207,  357,  306,  207,  878,  150,  151,
			  151,  151,  151,  151,  151,  152,  207,  303,  304,  313,
			  963,  151,  151,  151,  151,  151,  153,  151,  151,  151,
			  154,  151,  155,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  156,  303,  304,  313,  151,  157,
			  157,  157,  157,  157,  158,  157,  157,  157,  159,  157,
			  160,  157,  157,  157,  157,  157,  161,  157,  157,  157,
			  157,  157,  148,  642,  387,  148,  211,  211,  211,  386,
			  149,  213,  213,  213,  215,  215,  215,  150,  151,  151,

			  151,  151,  151,  151,  152,  554,  212,  553,  315,  606,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  156,  217,  221,  315,  151,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  197,  224,  490,  229,  536,  198,  229,  536,  316,
			  218,  219,  222,  223,  254,  255,  230,  231,  229,  246,
			  742,  229,  740,  256,  386,  111,  319,  232,  148,  199,
			  230,  148,  387,  235,  200,  791,  149,  316,  218,  219,

			  366,  232,  236,  236,  236,  236,  236,  236,  243,  243,
			  243,  243,  243,  243,  319,  247,  325,  227,  248,  248,
			  248,  248,  248,  248,  244,  249,  249,  249,  249,  249,
			  249,  227,  253,  253,  253,  253,  253,  253,  237,  254,
			  255,  250,  254,  255,  325,  254,  255,  245,  269,  790,
			  111,  307,  244,  238,  329,  326,  103,  239,  104,  240,
			  251,  251,  251,  251,  251,  251,  252,  488,  103,  250,
			  104,  295,  251,  251,  251,  251,  251,  251,  254,  255,
			  255,  254,  255,  326,  254,  255,  330,  256,  256,  111,
			  256,  556,  111,  256,  614,  111,  488,  254,  255,  106,

			  331,  789,  260,  320,  337,  259,  256,  296,  111,  321,
			  258,  106,  254,  255,  330,  254,  255,  261,  254,  255,
			  556,  256,  297,  111,  307,  254,  255,  256,  331,  111,
			  260,  320,  337,  259,  256,  106,  111,  321,  258,  254,
			  255,  208,  262,  208,  208,  261,  339,  302,  256,  264,
			  111,  341,  263,  788,  254,  255,  265,  254,  255,  778,
			  254,  255,  266,  256,  890,  111,  256,  342,  111,  256,
			  262,  111,  254,  255,  339,  308,  774,  264,  267,  341,
			  263,  256,  150,  111,  265,  254,  255,  268,  270,  271,
			  266,  254,  255,  890,  256,  342,  111,  345,  254,  255,

			  256,  346,  111,  254,  255,  553,  267,  256,  769,  111,
			  254,  255,  256,  554,  111,  268,  270,  271,  442,  256,
			  275,  111,  767,  273,  450,  345,  662,  272,  276,  346,
			  274,  351,  254,  255,  963,  254,  255,  130,  254,  255,
			  217,  256,  742,  224,  256,  894,  111,  256,  275,  111,
			  278,  273,  254,  255,  130,  740,  276,  279,  274,  351,
			  355,  256,  698,  111,  110,  663,  280,  282,  281,  721,
			  132,  289,  254,  255,  894,  444,  218,  219,  278,  218,
			  219,  307,  254,  255,  282,  279,  135,  241,  355,  241,
			  241,  307,  450,  254,  255,  280,  254,  281,  132,  289,

			  256,  699,  307,  444,  254,  255,  303,  311,  312,  312,
			  312,  312,  312,  307,  332,  135,  254,  255,  130,  283,
			  283,  283,  283,  283,  283,  256,  346,  111,  254,  255,
			  130,  254,  255,  130,  309,  470,  445,  256,  284,  111,
			  256,  285,  111,  256,  254,  255,  132,  286,  221,  132,
			  254,  255,  502,  256,  348,  111,  133,  740,  492,  307,
			  282,  254,  255,  282,  445,  135,  284,  290,  304,  285,
			  256,  291,  111,  742,  132,  286,  658,  132,  254,  255,
			  287,  254,  255,  288,  133,  222,  223,  256,  452,  111,
			  307,  254,  255,  845,  135,  290,  310,  292,  886,  291, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  256,  313,  111,  254,  255,  255,  254,  255,  287,  846,
			  207,  288,  256,  256,  111,  307,  452,  254,  255,  254,
			  255,  293,  254,  255,  454,  292,  307,  207,  307,  314,
			  657,  307,  254,  255,  254,  255,  315,  254,  255,  294,
			  887,  307,  656,  307,  316,  455,  307,  330,  458,  293,
			  767,  320,  454,  319,  625,  349,  325,  321,  225,  350,
			  103,  225,  254,  255,  317,  254,  255,  326,  294,  254,
			  255,  307,  318,  455,  307,  335,  458,  535,  256,  323,
			  342,  322,  331,  349,  327,  324,  856,  350,  211,  211,
			  211,  400,  207,  254,  255,  328,  333,  334,  334,  334,

			  334,  334,  307,  207,  800,  211,  211,  211,  344,  207,
			  336,  227,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  254,  255,  254,  255,  254,
			  255,  254,  255,  801,  307,  913,  307,  508,  307,  495,
			  307,  778,  254,  255,  254,  255,  341,  254,  255,  923,
			  345,  307,  368,  307,  494,  659,  307,  337,  459,  339,
			  364,  364,  364,  351,  913,  349,  254,  255,  460,  350,
			  464,  365,  365,  365,  343,  307,  229,  355,  347,  229,
			  359,  360,  361,  362,  363,  338,  459,  340,  230,  222,

			  223,  354,  229,  352,  661,  229,  460,  353,  464,  232,
			  372,  371,  357,  372,  230,  356,  376,  377,  377,  377,
			  377,  377,  377,  371,  383,  232,  383,  254,  255,  384,
			  384,  384,  384,  384,  384,  371,  256,  367,  111,  227,
			  485,  358,  385,  385,  385,  385,  385,  385,  388,  388,
			  388,  388,  388,  388,  470,  227,  369,  370,  371,  369,
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
			  254,  255,  467,  468,  244,  465,  392,  469,  392,  307,
			  390,  393,  393,  393,  393,  393,  393,  103,  447,  104,
			  446,  394,  394,  394,  394,  394,  394,  245,  254,  255,
			  467,  468,  244,  391,  443,  469,  695,  307,  390,  395,

			  395,  395,  395,  395,  396,  396,  396,  396,  396,  396,
			  254,  255,  536,  254,  255,  537,  254,  255,  434,  256,
			  106,  111,  256,  769,  111,  256,  473,  111,  475,  401,
			  254,  255,  400,  254,  255,  697,  254,  255,  399,  256,
			  402,  111,  256,  403,  111,  256,  399,  111,  404,  254,
			  255,  411,  254,  255,  473,  406,  475,  401,  256,  857,
			  111,  256,  411,  111,  405,  642,  254,  255,  402,  254,
			  255,  403,  411,  407,  476,  256,  404,  111,  256,  963,
			  111,  963,  641,  406,  254,  255,  381,  254,  255,  380,
			  411,  479,  405,  256,  410,  111,  256,  408,  111,  480,

			  409,  407,  476,  254,  255,  379,  254,  255,  412,  254,
			  255,  413,  256,  483,  111,  256,  378,  111,  256,  479,
			  111,  373,  371,  415,  373,  408,  414,  480,  409,  254,
			  255,  484,  643,  254,  255,  375,  412,  228,  256,  413,
			  111,  483,  256,  797,  111,  366,  254,  255,  367,  254,
			  255,  415,  417,  555,  414,  256,  366,  111,  307,  484,
			  254,  255,  416,  419,  419,  419,  419,  419,  419,  256,
			  207,  111,  110,  110,  110,  110,  110,  110,  418,  566,
			  417,  555,  799,  332,  110,  110,  110,  110,  110,  110,
			  416,  465,  418,  254,  255,  269,  420,  420,  420,  420,

			  420,  420,  256,  110,  111,  254,  255,  566,  421,  421,
			  421,  421,  421,  421,  256,  422,  111,  423,  963,  254,
			  255,  130,  207,  254,  255,  418,  301,  568,  256,  299,
			  111,  110,  307,  254,  255,  130,  147,  418,  424,  569,
			  473,  425,  256,  295,  111,  254,  255,  426,  254,  255,
			  286,  254,  255,  207,  256,  568,  111,  428,  244,  111,
			  256,  572,  111,  254,  255,  549,  424,  569,  474,  425,
			  429,  427,  256,  295,  111,  426,  254,  255,  286,  254,
			  255,  245,  254,  255,  277,  256,  244,  111,  256,  572,
			  111,  256,  430,  111,  254,  255,  880,  881,  429,  427,

			  211,  211,  211,  256,  550,  111,  431,  435,  436,  436,
			  436,  436,  436,  295,  451,  451,  451,  451,  451,  451,
			  430,  432,  437,  438,  438,  438,  438,  438,  295,  242,
			  433,  213,  213,  213,  431,  439,  440,  441,  441,  441,
			  441,  295,  254,  255,  254,  255,  254,  255,  254,  255,
			  573,  307,  576,  307,  241,  307,  577,  307,  234,  433,
			  450,  444,  451,  451,  451,  451,  451,  451,  254,  255,
			  579,  445,   94,  452,  254,  255,   91,  307,  573,  455,
			  576,  254,  255,  307,  577,  580,  454,  254,  255,  448,
			  307,  254,  255,  458,  228,  581,  307,  301,  579,  449,

			  307,  453,  254,  255,  399,  459,  207,  457,  207,  411,
			  205,  307,  147,  580,  456,  207,  254,  255,  460,  207,
			  411,  461,  464,  581,  111,  307,  467,  207,  880,  881,
			  411,  586,  470,  462,  334,  334,  334,  334,  334,  334,
			  468,  519,  254,  255,  254,  255,  463,  109,  411,  108,
			  466,  307,  519,  307,  471,  254,  255,  254,  255,  586,
			  254,  255,  519,  476,  307,  101,  307,   98,  472,  307,
			  254,  255,   94,  254,  255,  475,  480,  254,  255,  307,
			  519,  479,  307,  254,  255,  886,  307,  214,  214,  483,
			  588,  478,  307,  215,  215,  215,  778,  211,  211,  211,

			  484,   92,  589,  477,  482,  211,  211,  211,  539,  481,
			  370,  371,   91,  370,  963,  485,  295,  486,  588,  488,
			  254,  255,  372,  254,  255,  963,  963,  888,  487,  256,
			  589,  111,  307,  373,  376,  377,  377,  377,  377,  377,
			  377,  384,  384,  384,  384,  384,  384,  541,  489,  491,
			  491,  491,  491,  491,  491,  493,  493,  493,  493,  493,
			  493,  592,  963,  374,  496,  496,  496,  496,  496,  496,
			  497,  497,  497,  497,  497,  497,  500,  500,  500,  500,
			  500,  500,  593,  665,  963,  498,  390,  498,  492,  592,
			  499,  499,  499,  499,  499,  499,  393,  393,  393,  393, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  393,  393,  501,  501,  501,  501,  501,  501,  963,  391,
			  593,  665,  503,  504,  390,  505,  505,  505,  505,  505,
			  505,  506,  506,  506,  506,  506,  506,  507,  507,  507,
			  507,  507,  507,  254,  255,  963,  254,  255,  667,  254,
			  255,  502,  256,  963,  111,  256,  963,  111,  256,  963,
			  111,  254,  255,  668,  963,  963,  254,  255,  671,  963,
			  256,  677,  111,  510,  963,  256,  667,  111,  594,  512,
			  511,  254,  255,  963,  513,  514,  254,  255,  963,  595,
			  256,  668,  111,  254,  255,  256,  671,  111,  963,  677,
			  678,  510,  256,  963,  111,  963,  594,  512,  518,  511,

			  254,  255,  513,  514,  515,  254,  255,  595,  516,  256,
			  963,  111,  254,  255,  256,  399,  111,  963,  678,  517,
			  530,  256,  963,  111,  254,  255,  518,  679,  520,  254,
			  255,  530,  515,  256,  963,  111,  516,  611,  256,  611,
			  111,  530,  963,  963,  682,  521,  963,  517,  612,  633,
			  522,  523,  254,  255,  963,  679,  520,  254,  255,  530,
			  633,  256,  110,  111,  684,  110,  256,  685,  111,  963,
			  633,  110,  682,  521,  254,  255,  613,  963,  522,  523,
			  254,  255,  524,  256,  688,  111,  689,  525,  633,  256,
			  110,  111,  684,  110,  963,  685,  963,  254,  255,  110,

			  419,  419,  419,  419,  419,  419,  256,  690,  111,  691,
			  524,  963,  688,  715,  689,  525,  420,  420,  420,  420,
			  420,  420,  110,  421,  421,  421,  421,  421,  421,  736,
			  715,  743,  745,  110,  715,  690,  963,  691,  110,  526,
			  526,  526,  526,  526,  526,  254,  255,  110,  963,  110,
			  110,  963,  535,  255,  307,  963,  110,  736,  715,  743,
			  745,  256,  110,  111,  254,  255,  110,  527,  527,  527,
			  527,  527,  527,  256,  963,  111,  110,  573,  110,  528,
			  528,  528,  528,  528,  528,  110,  529,  529,  529,  529,
			  529,  529,  746,  963,  110,  254,  255,  531,  254,  255,

			  749,  110,  254,  255,  256,  575,  111,  307,  254,  255,
			  750,  307,  963,  532,  963,  254,  255,  256,  963,  111,
			  746,  568,  110,  533,  307,  531,  254,  255,  749,  110,
			  254,  255,  555,  963,  534,  307,  963,  963,  750,  307,
			  539,  532,  540,  540,  540,  540,  540,  540,  295,  570,
			  542,  533,  543,  543,  543,  543,  543,  543,  295,  572,
			  561,  545,  534,  546,  547,  547,  547,  547,  547,  295,
			  547,  547,  547,  547,  547,  547,  295,  963,  551,  541,
			  441,  441,  441,  441,  441,  441,  295,  574,  549,  544,
			  441,  441,  441,  441,  441,  441,  295,  751,  754,  963,

			  548,  557,  558,  558,  558,  558,  558,  559,  560,  560,
			  560,  560,  560,  254,  255,  254,  255,  552,  756,  963,
			  757,  963,  307,  963,  307,  751,  754,  550,  563,  564,
			  564,  564,  564,  564,  565,  565,  565,  565,  565,  565,
			  254,  255,  254,  255,  760,  566,  756,  556,  757,  307,
			  761,  307,  582,  583,  583,  583,  583,  583,  762,  569,
			  963,  576,  254,  255,  963,  254,  255,  963,  254,  255,
			  963,  307,  760,  567,  307,  963,  562,  307,  761,  254,
			  255,  963,  254,  255,  963,  579,  762,  571,  307,  578,
			  586,  307,  254,  255,  535,  255,  254,  255,  580,  254,

			  255,  307,  963,  307,  963,  307,  254,  255,  256,  588,
			  111,  773,  589,  584,  593,  256,  963,  111,  587,  598,
			  598,  598,  598,  598,  598,  592,  585,  599,  599,  599,
			  599,  599,  599,  963,  391,  963,  963,  590,  963,  773,
			  591,  963,  597,  382,  382,  382,  382,  382,  382,  820,
			  820,  820,  820,  596,  963,  802,  805,  807,  492,  600,
			  601,  601,  601,  601,  601,  602,  603,  603,  603,  603,
			  603,  604,  604,  604,  604,  604,  604,  499,  499,  499,
			  499,  499,  499,  802,  805,  807,  963,  390,  605,  605,
			  605,  605,  605,  605,  607,  607,  607,  607,  607,  607,

			  608,  608,  608,  608,  608,  608,  963,  809,  963,  811,
			  391,  963,  963,  254,  255,  390,  609,  609,  609,  609,
			  609,  609,  256,  963,  111,  254,  255,  606,  604,  604,
			  604,  604,  604,  604,  256,  809,  111,  811,  504,  502,
			  505,  505,  505,  505,  505,  505,  812,  254,  255,  963,
			  963,  619,  254,  255,  963,  617,  256,  638,  111,  963,
			  672,  256,  813,  111,  254,  255,  618,  963,  639,  844,
			  620,  847,  673,  256,  812,  111,  254,  255,  640,  619,
			  254,  255,  621,  963,  849,  256,  963,  111,  672,  256,
			  813,  111,  254,  255,  618,  622,  639,  844,  620,  847,

			  673,  256,  851,  111,  624,  254,  255,  623,  254,  255,
			  621,  626,  849,  963,  256,  853,  111,  256,  963,  111,
			  254,  255,  963,  622,  963,  854,  627,  254,  255,  256,
			  851,  111,  624,  254,  255,  623,  256,  542,  111,  626,
			  254,  255,  256,  853,  111,  295,  628,  872,  963,  256,
			  629,  111,  630,  854,  627,  526,  526,  526,  526,  526,
			  526,  255,  963,  527,  527,  527,  527,  527,  527,  256,
			  636,  873,  963,  963,  628,  872,  544,  963,  629,  963,
			  630,  254,  255,  631,  529,  529,  529,  529,  529,  529,
			  256,  632,  111,  254,  255,  875,  254,  255,  636,  873,

			  254,  255,  256,  963,  111,  256,  110,  111,  637,  307,
			  725,  631,  634,  963,  877,  635,  889,  963,  963,  632,
			  422,  725,  423,  875,  528,  528,  528,  528,  528,  528,
			  963,  726,  254,  255,  110,  963,  637,  545,  963,  110,
			  634,  307,  877,  635,  889,  295,  425,  892,  963,  725,
			  904,  665,  426,  644,  645,  645,  645,  645,  645,  295,
			  646,  646,  646,  646,  646,  646,  295,  110,  660,  660,
			  660,  660,  660,  660,  425,  892,  548,  963,  904,  666,
			  426,  647,  648,  648,  648,  648,  648,  295,  542,  963,
			  649,  649,  649,  649,  649,  649,  295,  650,  651,  651,

			  651,  651,  651,  295,  652,  653,  653,  653,  653,  653,
			  295,  653,  653,  653,  653,  653,  653,  295,  439,  654,
			  654,  654,  654,  654,  295,  963,  963,  544,  439,  655,
			  654,  654,  654,  654,  295,  659,  792,  660,  660,  660,
			  660,  660,  660,  662,  295,  560,  560,  560,  560,  560,
			  560,  254,  255,  664,  664,  664,  664,  664,  664,  450,
			  307,  564,  564,  564,  564,  564,  564,  256,  254,  255,
			  254,  255,  254,  255,  661,  793,  963,  307,  963,  307,
			  963,  307,  663,  254,  255,  963,  254,  255,  668,  905,
			  671,  963,  307,  658,  667,  307,  707,  707,  707,  707, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  707,  470,  672,  583,  583,  583,  583,  583,  583,  256,
			  254,  255,  254,  255,  673,  963,  670,  905,  674,  307,
			  963,  307,  669,  254,  255,  254,  255,  254,  255,  678,
			  675,  682,  307,  914,  307,  508,  307,  963,  963,  254,
			  255,  679,  676,  254,  255,  795,  685,  963,  307,  725,
			  834,  963,  307,  295,  834,  684,  963,  680,  688,  683,
			  727,  914,  689,  694,  694,  694,  694,  694,  694,  681,
			  728,  834,  963,  695,  687,  696,  696,  696,  696,  696,
			  696,  963,  834,  686,  796,  963,  692,  963,  727,  963,
			  693,  696,  696,  696,  696,  696,  696,  698,  963,  603,

			  603,  603,  603,  603,  603,  604,  604,  604,  604,  604,
			  604,  963,  697,  701,  701,  701,  701,  701,  701,  963,
			  963,  700,  702,  702,  702,  702,  702,  702,  703,  703,
			  703,  703,  703,  703,  963,  963,  699,  704,  704,  704,
			  704,  704,  704,  705,  705,  705,  705,  705,  705,  700,
			  924,  963,  606,  706,  706,  706,  706,  706,  706,  708,
			  708,  708,  708,  708,  708,  254,  255,  963,  254,  255,
			  934,  963,  254,  255,  256,  250,  111,  256,  924,  111,
			  710,  256,  963,  111,  254,  255,  963,  711,  254,  255,
			  835,  254,  255,  256,  835,  111,  963,  256,  934,  111,

			  256,  963,  111,  250,  963,  254,  255,  712,  710,  254,
			  255,  835,  254,  255,  256,  711,  111,  713,  256,  963,
			  111,  256,  835,  111,  963,  254,  255,  963,  254,  255,
			  963,  254,  255,  714,  256,  712,  111,  256,  963,  111,
			  256,  963,  111,  716,  717,  713,  254,  255,  963,  963,
			  719,  254,  255,  963,  834,  256,  963,  111,  836,  718,
			  256,  714,  111,  963,  720,  254,  255,  963,  254,  255,
			  963,  716,  717,  963,  256,  836,  111,  256,  719,  111,
			  254,  255,  508,  963,  963,  723,  836,  718,  963,  256,
			  963,  111,  720,  963,  963,  722,  726,  539,  724,  645,

			  645,  645,  645,  645,  645,  295,  963,  728,  963,  254,
			  255,  254,  255,  723,  963,  254,  255,  728,  307,  963,
			  307,  963,  963,  722,  307,  963,  724,  729,  729,  729,
			  729,  729,  729,  295,  963,  728,  541,  542,  963,  648,
			  648,  648,  648,  648,  648,  295,  542,  963,  730,  730,
			  730,  730,  730,  730,  295,  545,  963,  651,  651,  651,
			  651,  651,  651,  295,  731,  650,  650,  650,  650,  650,
			  295,  895,  895,  895,  963,  963,  544,  650,  650,  650,
			  650,  650,  650,  295,  549,  544,  654,  654,  654,  654,
			  654,  654,  295,  551,  548,  654,  654,  654,  654,  654,

			  654,  295,  732,  733,  733,  733,  733,  733,  734,  735,
			  735,  735,  735,  735,  737,  738,  738,  738,  738,  738,
			  963,  963,  963,  550,  739,  739,  739,  739,  739,  739,
			  254,  255,  552,  559,  741,  741,  741,  741,  741,  307,
			  254,  255,  254,  255,  835,  743,  254,  255,  837,  307,
			  963,  307,  254,  255,  963,  307,  963,  254,  255,  745,
			  963,  307,  963,  254,  255,  837,  307,  963,  746,  254,
			  255,  751,  307,  744,  254,  255,  837,  750,  307,  963,
			  932,  963,  756,  307,  254,  255,  963,  747,  754,  254,
			  255,  932,  757,  307,  254,  255,  748,  963,  256,  753,

			  111,  932,  963,  307,  963,  752,  254,  255,  963,  963,
			  758,  963,  963,  780,  760,  256,  755,  111,  963,  932,
			  759,  598,  598,  598,  598,  598,  598,  764,  765,  765,
			  765,  765,  765,  766,  766,  766,  766,  766,  766,  963,
			  963,  780,  763,  602,  768,  768,  768,  768,  768,  770,
			  963,  770,  963,  963,  771,  771,  771,  771,  771,  771,
			  771,  771,  771,  771,  771,  771,  772,  772,  772,  772,
			  772,  772,  608,  608,  608,  608,  608,  608,  775,  775,
			  775,  775,  775,  775,  776,  776,  776,  776,  776,  776,
			  777,  777,  777,  777,  777,  777,  254,  255,  782,  606,

			  254,  255,  963,  254,  255,  256,  773,  111,  963,  256,
			  963,  111,  256,  963,  111,  782,  963,  781,  963,  782,
			  963,  254,  255,  963,  254,  255,  779,  254,  255,  391,
			  256,  963,  111,  256,  773,  111,  256,  963,  111,  254,
			  255,  784,  963,  782,  963,  781,  254,  255,  256,  963,
			  111,  963,  254,  255,  779,  256,  963,  111,  784,  254,
			  255,  256,  784,  111,  963,  783,  254,  255,  256,  963,
			  111,  785,  963,  254,  255,  256,  868,  111,  963,  963,
			  868,  786,  307,  963,  963,  787,  784,  798,  798,  798,
			  798,  798,  798,  783,  963,  963,  963,  868,  539,  785,

			  794,  794,  794,  794,  794,  794,  295,  963,  868,  786,
			  963,  963,  797,  787,  798,  798,  798,  798,  798,  798,
			  800,  963,  735,  735,  735,  735,  735,  735,  659,  963,
			  738,  738,  738,  738,  738,  738,  963,  541,  737,  737,
			  737,  737,  737,  737,  764,  764,  764,  764,  764,  764,
			  662,  799,  741,  741,  741,  741,  741,  741,  963,  801,
			  254,  255,  254,  255,  254,  255,  963,  661,  963,  307,
			  901,  307,  902,  307,  254,  255,  254,  255,  901,  807,
			  902,  254,  255,  307,  805,  307,  254,  255,  869,  663,
			  307,  901,  869,  902,  963,  307,  771,  771,  771,  771,

			  771,  771,  809,  963,  963,  811,  901,  808,  902,  869,
			  963,  695,  806,  765,  765,  765,  765,  765,  765,  698,
			  869,  768,  768,  768,  768,  768,  768,  963,  963,  963,
			  810,  963,  963,  814,  771,  771,  771,  771,  771,  771,
			  817,  817,  817,  817,  817,  817,  818,  963,  818,  963,
			  697,  819,  819,  819,  819,  819,  819,  963,  699,  821,
			  821,  821,  821,  821,  821,  822,  823,  822,  823,  825,
			  825,  825,  825,  825,  825,  254,  255,  831,  254,  255,
			  963,  963,  254,  255,  256,  773,  111,  256,  963,  111,
			  963,  256,  827,  111,  831,  963,  254,  255,  831,  830,

			  963,  828,  963,  963,  824,  256,  963,  111,  391,  963,
			  254,  255,  963,  773,  963,  829,  254,  255,  963,  256,
			  827,  111,  831,  254,  255,  307,  963,  830,  832,  828,
			  254,  255,  256,  963,  111,  963,  963,  963,  963,  256,
			  963,  111,  833,  829,  729,  838,  838,  838,  838,  838,
			  295,  963,  963,  963,  963,  542,  832,  794,  794,  794,
			  794,  794,  794,  295,  840,  841,  841,  841,  841,  841,
			  833,  650,  839,  651,  651,  651,  651,  295,  842,  842,
			  842,  842,  842,  842,  734,  843,  843,  843,  843,  843,
			  254,  255,  254,  255,  544,  254,  255,  254,  255,  307, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  963,  307,  963,  915,  307,  915,  307,  963,  963,  963,
			  963,  849,  851,  847,  916,  853,  819,  819,  819,  819,
			  819,  819,  858,  858,  858,  858,  858,  858,  859,  859,
			  859,  859,  859,  859,  926,  926,  926,  926,  926,  850,
			  852,  848,  917,  855,  613,  613,  613,  613,  613,  613,
			  860,  860,  860,  860,  860,  860,  948,  948,  948,  948,
			  948,  606,  861,  861,  861,  861,  861,  861,  862,  862,
			  862,  862,  862,  862,  254,  255,  963,  254,  255,  963,
			  254,  255,  963,  256,  773,  111,  256,  963,  111,  256,
			  963,  111,  254,  255,  963,  868,  864,  254,  255,  870,

			  963,  256,  963,  111,  254,  255,  256,  391,  111,  865,
			  869,  866,  773,  256,  871,  111,  870,  840,  840,  840,
			  840,  840,  840,  963,  864,  254,  255,  870,  963,  254,
			  255,  871,  963,  963,  307,  963,  867,  865,  256,  866,
			  111,  792,  871,  838,  838,  838,  838,  838,  838,  295,
			  795,  910,  651,  651,  651,  651,  651,  651,  295,  910,
			  884,  963,  963,  797,  867,  841,  841,  841,  841,  841,
			  841,  800,  910,  843,  843,  843,  843,  843,  843,  963,
			  793,  254,  255,  963,  254,  255,  963,  910,  884,  796,
			  307,  254,  255,  307,  817,  817,  817,  817,  817,  817,

			  307,  963,  799,  875,  879,  879,  879,  879,  879,  879,
			  801,  963,  822,  873,  822,  963,  963,  861,  861,  861,
			  861,  861,  861,  862,  862,  862,  862,  862,  862,  254,
			  255,  876,  963,  606,  254,  255,  963,  963,  256,  963,
			  111,  874,  963,  256,  963,  111,  254,  255,  882,  254,
			  255,  824,  963,  254,  255,  256,  963,  111,  307,  963,
			  254,  255,  307,  896,  896,  896,  896,  896,  896,  256,
			  883,  111,  254,  255,  778,  963,  882,  254,  255,  963,
			  933,  256,  885,  111,  892,  890,  256,  902,  111,  254,
			  255,  933,  899,  254,  255,  903,  254,  255,  256,  883,

			  111,  933,  307,  963,  963,  256,  963,  111,  903,  963,
			  963,  885,  893,  963,  891,  963,  963,  900,  963,  933,
			  899,  963,  963,  903,  906,  906,  906,  906,  906,  906,
			  824,  824,  824,  824,  824,  824,  907,  907,  907,  907,
			  907,  907,  254,  255,  963,  900,  254,  255,  911,  778,
			  963,  256,  963,  111,  963,  256,  911,  111,  963,  963,
			  963,  963,  911,  254,  255,  909,  254,  255,  963,  911,
			  912,  963,  256,  963,  111,  256,  963,  111,  908,  963,
			  963,  963,  963,  912,  911,  925,  925,  925,  925,  925,
			  925,  921,  963,  909,  918,  963,  919,  920,  912,  907,

			  907,  907,  907,  907,  907,  963,  963,  908,  927,  927,
			  927,  927,  927,  927,  963,  963,  963,  254,  255,  921,
			  930,  930,  930,  930,  930,  930,  256,  963,  111,  935,
			  935,  935,  935,  935,  935,  963,  931,  936,  936,  936,
			  936,  936,  936,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  963,  963,  963,  938,  963,
			  963,  963,  963,  963,  931,  918,  928,  919,  937,  938,
			  930,  930,  930,  930,  930,  930,  941,  939,  941,  938,
			  940,  940,  940,  940,  940,  940,  963,  942,  939,  944,
			  944,  944,  944,  944,  944,  963,  963,  938,  939,  917,

			  917,  917,  917,  917,  917,  947,  947,  947,  947,  947,
			  947,  949,  918,  950,  919,  943,  939,  944,  944,  944,
			  944,  944,  944,  963,  963,  963,  963,  963,  949,  963,
			  950,  953,  949,  954,  950,  951,  951,  951,  951,  951,
			  951,  952,  952,  952,  952,  952,  952,  963,  953,  963,
			  954,  963,  953,  963,  954,  963,  949,  963,  950,  955,
			  955,  955,  955,  955,  955,  956,  957,  956,  957,  943,
			  943,  943,  943,  943,  943,  963,  953,  963,  954,  959,
			  959,  959,  959,  959,  959,  960,  960,  960,  960,  960,
			  960,  961,  961,  961,  961,  961,  961,  963,  963,  963,

			  956,  963,  956,  963,  958,  960,  960,  960,  960,  960,
			  960,  962,  962,  962,  962,  962,  962,  958,  958,  958,
			  958,  958,  958,  300,  300,  300,  300,  300,  300,  300,
			  300,  300,  963,  963,  963,  963,  963,  963,  963,  958,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,

			   80,   80,   80,   80,   80,   80,   93,   93,  963,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,  963,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   95,
			   95,  963,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,  102,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  963,  963,  963,  963,  963,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  110,  110,  110,  110,

			  963,  110,  110,  110,  110,  110,  110,  963,  963,  963,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  143,
			  143,  963,  143,  963,  143,  143,  143,  963,  963,  143,
			  143,  143,  143,  143,  143,  963,  963,  963,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  146,  146,  963,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  206,  206,  963,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,

			  206,  206,  963,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  226,
			  963,  226,  963,  963,  963,  963,  226,  963,  226,  226,
			  226,  963,  963,  226,  226,  226,  226,  226,  226,  963, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  963,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  233,  233,  963,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,  102,  102,  102,
			  102,  963,  963,  102,  102,  102,  102,  102,  102,  102,
			  963,  963,  102,  102,  102,  102,  102,  102,  102,  102,

			  102,  257,  963,  963,  257,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  257,  963,  963,  963,  257,  257,
			  257,  257,  257,  257,  257,  257,  257,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  963,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  397,  397,  397,  963,  963,  397,  397,

			  397,  397,  397,  397,  963,  963,  963,  397,  397,  397,
			  397,  397,  397,  397,  397,  397,  398,  398,  398,  963,
			  963,  398,  398,  398,  398,  398,  398,  963,  963,  963,
			  398,  398,  398,  398,  398,  398,  398,  398,  398,  300,
			  300,  300,  300,  963,  963,  300,  300,  300,  300,  300,
			  300,  300,  963,  963,  300,  300,  300,  300,  300,  300,
			  300,  300,  300,  369,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  509,  509,  509,  509,

			  509,  509,  963,  963,  963,  509,  509,  509,  509,  509,
			  509,  509,  509,  509,  538,  963,  538,  963,  963,  963,
			  963,  538,  963,  538,  538,  538,  963,  963,  538,  538,
			  538,  538,  538,  538,  963,  963,  963,  538,  538,  538,
			  538,  538,  538,  538,  538,  538,  443,  443,  443,  963,
			  963,  443,  443,  443,  443,  443,  443,  443,  443,  963,
			  963,  443,  443,  443,  443,  443,  443,  963,  963,  963,
			  443,  443,  443,  443,  443,  443,  443,  443,  443,  615,
			  615,  615,  615,  615,  615,  963,  963,  963,  615,  615,
			  615,  615,  615,  615,  615,  615,  615,  616,  616,  616,

			  963,  963,  616,  616,  616,  616,  616,  616,  963,  963,
			  963,  616,  616,  616,  616,  616,  616,  616,  616,  616,
			  641,  963,  641,  963,  963,  963,  963,  641,  963,  641,
			  641,  641,  963,  963,  641,  641,  641,  641,  641,  641,
			  963,  963,  641,  641,  641,  641,  641,  641,  641,  641,
			  641,  641,  709,  709,  709,  963,  963,  709,  709,  709,
			  709,  709,  709,  963,  963,  963,  709,  709,  709,  709,
			  709,  709,  709,  709,  709,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  816,  816,  816,  816,  816,  816,  816,

			  816,  816,  826,  826,  826,  826,  826,  826,  963,  963,
			  963,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  803,  803,  803,  803,  963,  963,  803,  803,  803,  803,
			  803,  803,  803,  963,  963,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  804,  804,  804,  804,  963,  963,
			  804,  804,  804,  804,  804,  804,  804,  963,  963,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  815,  815,
			  815,  815,  963,  963,  815,  815,  815,  815,  815,  815,
			  815,  963,  963,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  816,  816,  816,  816,  963,  963,  816,  816,

			  816,  816,  816,  816,  816,  963,  963,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  863,  863,  863,  963,
			  963,  863,  863,  863,  863,  863,  863,  963,  963,  963,
			  863,  863,  863,  863,  863,  863,  863,  863,  863,  897,
			  897,  897,  963,  963,  897,  897,  897,  897,  897,  897,
			  963,  963,  963,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,    9,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,

			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 755, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5754)
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
			    1,    1,    1,    3,    5,   16,    6,    3,    4,  503,

			  503,   11,    4,   11,   11,   23,   74,   23,   23,   23,
			   23,   23,   23,   25,   33,   25,   34,   25,   25,   25,
			   25,   25,   25,   33,   34,   39,   45,   33,   40,   33,
			    5,    5,    6,    6,   35,   41,   39,   45,   35,   41,
			   16,   59,   40,   40,    3,   45,   49,   35,   40,    4,
			  939,   33,   34,   74,   49,   33,   25,   33,   72,  230,
			   72,   72,  230,  938,   39,   45,   35,   41,  929,   59,
			   40,   40,  919,   45,  232,   35,   40,  232,    3,    3,
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
			   57,   43,   38,   47,   37,  307,   38,   43,  911,   42,

			   67,   57,  307,   48,   61,   37,   46,   62,   38,   47,
			   43,   90,  434,   90,   90,  434,   76,   85,   57,   78,
			   85,   46,   37,   26,   38,   43,   46,   42,   48,   67,
			   57,   66,   61,  910,   37,   62,   38,   47,   43,   44,
			   44,   44,   44,   44,   44,   44,   54,   54,   44,   46,
			   63,   54,   58,   54,   46,   44,   55,   48,   64,   66,
			  153,   55,   44,   63,   58,   55,   64,   55,  881,   44,
			   85,   44,  145,   44,   54,   54,   60,   60,   63,   54,
			   58,   54,   60,   44,   55,  203,   64,   54,  153,   55,
			   44,   63,   58,   55,   64,   55,   76,   60,   78,   78,

			   44,   55,   44,   53,   60,   60,   53,  156,   75,  145,
			   60,   53,  871,   77,  203,  156,   79,  859,   53,   53,
			   53,   53,   53,   53,   53,   53,  360,  154,  155,  162,
			  641,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,  154,  155,  162,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   56,  641,  857,   56,   75,   75,   75,  856,
			   56,   77,   77,   77,   79,   79,   79,   56,   56,   56,

			   56,   56,   56,   56,   56,  846,  360,  845,  164,  817,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   80,   82,  164,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   65,   83,  366,   87,  536,   65,   87,  536,  165,
			   80,   80,   82,   82,  110,  110,   87,   87,   88,  102,
			  801,   88,  799,  110,  247,  110,  168,   87,  148,   65,
			   88,  148,  247,   97,   65,  728,  148,  165,   83,   83,

			  366,   88,   97,   97,   97,   97,   97,   97,  100,  100,
			  100,  100,  100,  100,  168,  102,  172,   87,  103,  103,
			  103,  103,  103,  103,  100,  104,  104,  104,  104,  104,
			  104,   88,  106,  106,  106,  106,  106,  106,   97,  122,
			  122,  104,  157,  157,  172,  177,  177,  100,  122,  727,
			  122,  157,  100,   97,  177,  173,  105,   97,  105,   97,
			  105,  105,  105,  105,  105,  105,  105,  357,  107,  104,
			  107,  144,  107,  107,  107,  107,  107,  107,  112,  112,
			  398,  113,  113,  173,  114,  114,  178,  112,  398,  112,
			  113,  445,  113,  114,  507,  114,  357,  115,  115,  105,

			  179,  726,  114,  169,  185,  113,  115,  144,  115,  169,
			  112,  107,  116,  116,  178,  158,  158,  115,  118,  118,
			  445,  116,  144,  116,  158,  117,  117,  118,  179,  118,
			  114,  169,  185,  113,  117,  507,  117,  169,  112,  119,
			  119,  208,  116,  208,  208,  115,  187,  158,  119,  118,
			  119,  189,  117,  725,  120,  120,  119,  121,  121,  709,
			  123,  123,  119,  120,  873,  120,  121,  190,  121,  123,
			  116,  123,  124,  124,  187,  158,  705,  118,  120,  189,
			  117,  124,  300,  124,  119,  125,  125,  121,  123,  124,
			  119,  126,  126,  873,  125,  190,  125,  193,  127,  127,

			  126,  194,  126,  128,  128,  442,  120,  127,  699,  127,
			  129,  129,  128,  442,  128,  121,  123,  124,  300,  129,
			  128,  129,  697,  126,  664,  193,  559,  125,  129,  194,
			  127,  198,  131,  131,  131,  132,  132,  132,  138,  138,
			  216,  131,  663,  219,  132,  877,  132,  138,  128,  138,
			  131,  126,  133,  133,  133,  661,  129,  131,  127,  198,
			  201,  133,  602,  133,  131,  559,  131,  132,  131,  633,
			  133,  138,  184,  184,  877,  302,  216,  216,  131,  219,
			  219,  184,  159,  159,  133,  131,  133,  241,  201,  241,
			  241,  159,  563,  196,  196,  131,  616,  131,  133,  138,

			  563,  602,  196,  302,  161,  161,  159,  161,  161,  161,
			  161,  161,  161,  161,  184,  133,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  196,  134,  135,  135,
			  135,  136,  136,  136,  159,  582,  303,  135,  134,  135,
			  136,  134,  136,  582,  139,  139,  135,  134,  220,  136,
			  160,  160,  608,  139,  196,  139,  136,  803,  598,  160,
			  135,  137,  137,  136,  303,  136,  134,  139,  160,  134,
			  137,  139,  137,  804,  135,  134,  556,  136,  140,  140,
			  137,  163,  163,  137,  136,  220,  220,  140,  313,  140,
			  163,  141,  141,  803,  136,  139,  160,  140,  868,  139, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  141,  163,  141,  142,  142,  632,  166,  166,  137,  804,
			  212,  137,  142,  632,  142,  166,  313,  167,  167,  182,
			  182,  141,  170,  170,  315,  140,  167,  213,  182,  163,
			  554,  170,  174,  174,  171,  171,  166,  175,  175,  142,
			  868,  174,  553,  171,  167,  316,  175,  182,  319,  141,
			  815,  171,  315,  170,  519,  197,  174,  171,  225,  197,
			  496,  225,  192,  192,  166,  183,  183,  175,  142,  151,
			  151,  192,  167,  316,  183,  182,  319,  488,  151,  171,
			  192,  170,  183,  197,  174,  171,  815,  197,  212,  212,
			  212,  400,  214,  181,  181,  175,  181,  181,  181,  181,

			  181,  181,  181,  215,  734,  213,  213,  213,  192,  211,
			  183,  225,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  186,  186,  188,  188,  191,
			  191,  195,  195,  734,  186,  904,  188,  397,  191,  387,
			  195,  912,  199,  199,  200,  200,  191,  202,  202,  912,
			  195,  199,  222,  200,  386,  737,  202,  186,  320,  188,
			  214,  214,  214,  200,  904,  199,  204,  204,  321,  199,
			  325,  215,  215,  215,  191,  204,  226,  202,  195,  226,
			  211,  211,  211,  211,  211,  186,  320,  188,  226,  222,

			  222,  200,  229,  199,  737,  229,  321,  199,  325,  226,
			  372,  372,  204,  372,  229,  202,  236,  236,  236,  236,
			  236,  236,  236,  374,  244,  229,  244,  260,  260,  244,
			  244,  244,  244,  244,  244,  369,  260,  368,  260,  226,
			  351,  204,  245,  245,  245,  245,  245,  245,  248,  248,
			  248,  248,  248,  248,  333,  229,  231,  231,  231,  231,
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
			  310,  310,  330,  331,  243,  326,  250,  332,  250,  310,
			  249,  250,  250,  250,  250,  250,  250,  251,  306,  251,
			  305,  251,  251,  251,  251,  251,  251,  243,  340,  340,
			  330,  331,  243,  249,  301,  332,  764,  340,  249,  252,

			  252,  252,  252,  252,  253,  253,  253,  253,  253,  253,
			  258,  258,  537,  259,  259,  537,  261,  261,  295,  258,
			  251,  258,  259,  816,  259,  261,  337,  261,  341,  258,
			  262,  262,  257,  263,  263,  764,  264,  264,  256,  262,
			  259,  262,  263,  261,  263,  264,  269,  264,  262,  265,
			  265,  269,  268,  268,  337,  264,  341,  258,  265,  816,
			  265,  268,  269,  268,  263,  537,  266,  266,  259,  267,
			  267,  261,  269,  265,  342,  266,  262,  266,  267,  538,
			  267,  246,  538,  264,  270,  270,  240,  271,  271,  239,
			  269,  345,  263,  270,  268,  270,  271,  266,  271,  346,

			  267,  265,  342,  272,  272,  238,  273,  273,  270,  274,
			  274,  271,  272,  349,  272,  273,  237,  273,  274,  345,
			  274,  373,  373,  273,  373,  266,  272,  346,  267,  275,
			  275,  350,  538,  276,  276,  235,  270,  228,  275,  271,
			  275,  349,  276,  840,  276,  223,  278,  278,  221,  328,
			  328,  273,  276,  444,  272,  278,  218,  278,  328,  350,
			  279,  279,  275,  279,  279,  279,  279,  279,  279,  279,
			  206,  279,  282,  282,  282,  282,  282,  282,  278,  452,
			  276,  444,  840,  180,  284,  284,  284,  284,  284,  284,
			  275,  328,  279,  280,  280,  176,  280,  280,  280,  280,

			  280,  280,  280,  284,  280,  281,  281,  452,  281,  281,
			  281,  281,  281,  281,  281,  283,  281,  283,  283,  285,
			  285,  285,  359,  338,  338,  280,  152,  454,  285,  149,
			  285,  284,  338,  286,  286,  286,  146,  281,  283,  455,
			  338,  283,  286,  143,  286,  287,  287,  283,  288,  288,
			  285,  289,  289,  361,  287,  454,  287,  288,  382,  288,
			  289,  459,  289,  290,  290,  439,  283,  455,  338,  283,
			  289,  287,  290,  439,  290,  283,  291,  291,  285,  292,
			  292,  382,  293,  293,  130,  291,  382,  291,  292,  459,
			  292,  293,  290,  293,  294,  294,  863,  863,  289,  287,

			  359,  359,  359,  294,  439,  294,  291,  296,  296,  296,
			  296,  296,  296,  296,  312,  312,  312,  312,  312,  312,
			  290,  292,  297,  297,  297,  297,  297,  297,  297,   99,
			  294,  361,  361,  361,  291,  298,  298,  298,  298,  298,
			  298,  298,  308,  308,  309,  309,  314,  314,  318,  318,
			  460,  308,  464,  309,   98,  314,  465,  318,   95,  294,
			  311,  308,  311,  311,  311,  311,  311,  311,  317,  317,
			  467,  309,   93,  314,  322,  322,   91,  317,  460,  318,
			  464,  323,  323,  322,  465,  468,  317,  324,  324,  308,
			  323,  327,  327,  322,   86,  469,  324,  329,  467,  309,

			  327,  314,  335,  335,  329,  323,   71,  318,  362,  329,
			   68,  335,   52,  468,  317,  363,  336,  336,  324,  364,
			  329,  322,  327,  469,   36,  336,  335,  365,  897,  897,
			  329,  473,  334,  323,  334,  334,  334,  334,  334,  334,
			  336,  411,  343,  343,  344,  344,  324,   31,  329,   29,
			  327,  343,  411,  344,  335,  347,  347,  348,  348,  473,
			  352,  352,  411,  344,  347,   24,  348,   22,  336,  352,
			  353,  353,   14,  354,  354,  343,  348,  356,  356,  353,
			  411,  347,  354,  358,  358,  870,  356,  362,  362,  352,
			  475,  344,  358,  363,  363,  363,  870,  364,  364,  364,

			  353,   13,  476,  343,  348,  365,  365,  365,  644,  347,
			  370,  370,   12,  370,    9,  354,  644,  352,  475,  358,
			  406,  406,  370,  461,  461,    0,    0,  870,  353,  406,
			  476,  406,  461,  370,  377,  377,  377,  377,  377,  377,
			  377,  383,  383,  383,  383,  383,  383,  644,  358,  384,
			  384,  384,  384,  384,  384,  385,  385,  385,  385,  385,
			  385,  483,    0,  370,  388,  388,  388,  388,  388,  388,
			  389,  389,  389,  389,  389,  389,  391,  391,  391,  391,
			  391,  391,  484,  566,    0,  390,  389,  390,  384,  483,
			  390,  390,  390,  390,  390,  390,  392,  392,  392,  392, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  392,  392,  393,  393,  393,  393,  393,  393,    0,  389,
			  484,  566,  394,  394,  389,  394,  394,  394,  394,  394,
			  394,  395,  395,  395,  395,  395,  395,  396,  396,  396,
			  396,  396,  396,  401,  401,    0,  402,  402,  568,  403,
			  403,  393,  401,    0,  401,  402,    0,  402,  403,    0,
			  403,  404,  404,  569,    0,    0,  405,  405,  572,    0,
			  404,  577,  404,  401,    0,  405,  568,  405,  485,  403,
			  402,  407,  407,    0,  404,  405,  408,  408,    0,  485,
			  407,  569,  407,  410,  410,  408,  572,  408,    0,  577,
			  579,  401,  410,    0,  410,    0,  485,  403,  410,  402,

			  409,  409,  404,  405,  407,  412,  412,  485,  408,  409,
			    0,  409,  413,  413,  412,  428,  412,    0,  579,  409,
			  428,  413,    0,  413,  414,  414,  410,  580,  412,  415,
			  415,  428,  407,  414,    0,  414,  408,  506,  415,  506,
			  415,  428,  418,    0,  586,  413,    0,  409,  506,  530,
			  414,  415,  416,  416,    0,  580,  412,  417,  417,  428,
			  530,  416,  418,  416,  588,  418,  417,  589,  417,    0,
			  530,  418,  586,  413,  426,  426,  506,    0,  414,  415,
			  427,  427,  416,  426,  592,  426,  593,  417,  530,  427,
			  418,  427,  588,  418,    0,  589,    0,  429,  429,  418,

			  419,  419,  419,  419,  419,  419,  429,  594,  429,  595,
			  416,    0,  592,  625,  593,  417,  420,  420,  420,  420,
			  420,  420,  419,  421,  421,  421,  421,  421,  421,  658,
			  625,  667,  671,  419,  625,  594,    0,  595,  420,  422,
			  422,  422,  422,  422,  422,  463,  463,  420,    0,  420,
			  419,    0,  433,  433,  463,    0,  421,  658,  625,  667,
			  671,  433,  419,  433,  430,  430,  420,  423,  423,  423,
			  423,  423,  423,  430,    0,  430,  420,  463,  420,  424,
			  424,  424,  424,  424,  424,  421,  425,  425,  425,  425,
			  425,  425,  672,    0,  424,  431,  431,  430,  456,  456,

			  677,  425,  448,  448,  431,  463,  431,  456,  432,  432,
			  678,  448,    0,  431,    0,  481,  481,  432,    0,  432,
			  672,  456,  424,  432,  481,  430,  462,  462,  677,  425,
			  482,  482,  448,    0,  432,  462,    0,    0,  678,  482,
			  435,  431,  435,  435,  435,  435,  435,  435,  435,  456,
			  436,  432,  436,  436,  436,  436,  436,  436,  436,  462,
			  448,  437,  432,  437,  437,  437,  437,  437,  437,  437,
			  438,  438,  438,  438,  438,  438,  438,    0,  440,  435,
			  440,  440,  440,  440,  440,  440,  440,  462,  441,  436,
			  441,  441,  441,  441,  441,  441,  441,  679,  682,    0,

			  437,  446,  446,  446,  446,  446,  446,  447,  447,  447,
			  447,  447,  447,  449,  449,  453,  453,  440,  684,    0,
			  685,    0,  449,    0,  453,  679,  682,  441,  450,  450,
			  450,  450,  450,  450,  451,  451,  451,  451,  451,  451,
			  457,  457,  466,  466,  689,  453,  684,  449,  685,  457,
			  690,  466,  470,  470,  470,  470,  470,  470,  691,  457,
			    0,  466,  471,  471,    0,  472,  472,    0,  474,  474,
			    0,  471,  689,  453,  472,    0,  449,  474,  690,  477,
			  477,    0,  478,  478,    0,  471,  691,  457,  477,  466,
			  474,  478,  486,  486,  489,  489,  487,  487,  472,  510,

			  510,  486,    0,  489,    0,  487,  517,  517,  510,  477,
			  510,  703,  478,  471,  487,  517,    0,  517,  474,  491,
			  491,  491,  491,  491,  491,  486,  472,  492,  492,  492,
			  492,  492,  492,    0,  703,    0,    0,  477,    0,  703,
			  478,    0,  487,  493,  493,  493,  493,  493,  493,  774,
			  774,  774,  774,  486,    0,  736,  743,  746,  491,  494,
			  494,  494,  494,  494,  494,  495,  495,  495,  495,  495,
			  495,  497,  497,  497,  497,  497,  497,  498,  498,  498,
			  498,  498,  498,  736,  743,  746,    0,  497,  499,  499,
			  499,  499,  499,  499,  500,  500,  500,  500,  500,  500,

			  501,  501,  501,  501,  501,  501,    0,  756,    0,  760,
			  497,    0,    0,  511,  511,  497,  502,  502,  502,  502,
			  502,  502,  511,    0,  511,  513,  513,  499,  504,  504,
			  504,  504,  504,  504,  513,  756,  513,  760,  505,  501,
			  505,  505,  505,  505,  505,  505,  761,  512,  512,    0,
			    0,  513,  514,  514,    0,  511,  512,  535,  512,    0,
			  573,  514,  762,  514,  515,  515,  512,    0,  535,  802,
			  514,  805,  573,  515,  761,  515,  516,  516,  535,  513,
			  518,  518,  515,    0,  807,  516,    0,  516,  573,  518,
			  762,  518,  520,  520,  512,  516,  535,  802,  514,  805,

			  573,  520,  809,  520,  518,  522,  522,  516,  521,  521,
			  515,  520,  807,    0,  522,  811,  522,  521,    0,  521,
			  524,  524,    0,  516,    0,  812,  521,  523,  523,  524,
			  809,  524,  518,  525,  525,  516,  523,  647,  523,  520,
			  533,  533,  525,  811,  525,  647,  523,  844,    0,  533,
			  524,  533,  525,  812,  521,  526,  526,  526,  526,  526,
			  526,  527,    0,  527,  527,  527,  527,  527,  527,  527,
			  533,  847,    0,    0,  523,  844,  647,    0,  524,    0,
			  525,  534,  534,  526,  529,  529,  529,  529,  529,  529,
			  534,  527,  534,  531,  531,  851,  532,  532,  533,  847,

			  561,  561,  531,    0,  531,  532,  529,  532,  534,  561,
			  638,  526,  531,    0,  854,  532,  872,    0,    0,  527,
			  528,  638,  528,  851,  528,  528,  528,  528,  528,  528,
			    0,  638,  567,  567,  529,    0,  534,  650,    0,  528,
			  531,  567,  854,  532,  872,  650,  528,  875,    0,  638,
			  889,  567,  528,  539,  539,  539,  539,  539,  539,  539,
			  540,  540,  540,  540,  540,  540,  540,  528,  558,  558,
			  558,  558,  558,  558,  528,  875,  650,    0,  889,  567,
			  528,  542,  542,  542,  542,  542,  542,  542,  543,    0,
			  543,  543,  543,  543,  543,  543,  543,  545,  545,  545,

			  545,  545,  545,  545,  546,  546,  546,  546,  546,  546,
			  546,  547,  547,  547,  547,  547,  547,  547,  549,  549,
			  549,  549,  549,  549,  549,    0,    0,  543,  551,  551,
			  551,  551,  551,  551,  551,  557,  729,  557,  557,  557,
			  557,  557,  557,  560,  729,  560,  560,  560,  560,  560,
			  560,  562,  562,  565,  565,  565,  565,  565,  565,  564,
			  562,  564,  564,  564,  564,  564,  564,  564,  570,  570,
			  571,  571,  574,  574,  557,  729,    0,  570,    0,  571,
			    0,  574,  560,  575,  575,    0,  578,  578,  571,  894,
			  574,    0,  575,  562,  570,  578,  612,  612,  612,  612, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  612,  583,  575,  583,  583,  583,  583,  583,  583,  583,
			  584,  584,  587,  587,  575,    0,  571,  894,  574,  584,
			    0,  587,  570,  585,  585,  590,  590,  591,  591,  584,
			  575,  587,  585,  905,  590,  639,  591,    0,    0,  596,
			  596,  585,  575,  597,  597,  731,  591,    0,  596,  639,
			  788,    0,  597,  731,  788,  590,    0,  584,  596,  587,
			  639,  905,  597,  599,  599,  599,  599,  599,  599,  585,
			  639,  788,    0,  600,  591,  600,  600,  600,  600,  600,
			  600,    0,  788,  590,  731,    0,  596,    0,  639,    0,
			  597,  601,  601,  601,  601,  601,  601,  603,    0,  603,

			  603,  603,  603,  603,  603,  604,  604,  604,  604,  604,
			  604,    0,  600,  605,  605,  605,  605,  605,  605,    0,
			    0,  604,  606,  606,  606,  606,  606,  606,  607,  607,
			  607,  607,  607,  607,    0,    0,  603,  609,  609,  609,
			  609,  609,  609,  610,  610,  610,  610,  610,  610,  604,
			  913,    0,  605,  611,  611,  611,  611,  611,  611,  614,
			  614,  614,  614,  614,  614,  617,  617,    0,  618,  618,
			  924,    0,  619,  619,  617,  614,  617,  618,  913,  618,
			  617,  619,    0,  619,  620,  620,    0,  619,  621,  621,
			  789,  622,  622,  620,  789,  620,    0,  621,  924,  621,

			  622,    0,  622,  614,    0,  623,  623,  621,  617,  624,
			  624,  789,  626,  626,  623,  619,  623,  622,  624,    0,
			  624,  626,  789,  626,    0,  627,  627,    0,  628,  628,
			    0,  629,  629,  624,  627,  621,  627,  628,    0,  628,
			  629,    0,  629,  626,  627,  622,  630,  630,    0,    0,
			  629,  634,  634,    0,  790,  630,    0,  630,  790,  628,
			  634,  624,  634,    0,  630,  635,  635,    0,  636,  636,
			    0,  626,  627,    0,  635,  790,  635,  636,  629,  636,
			  637,  637,  640,    0,    0,  636,  790,  628,    0,  637,
			    0,  637,  630,    0,    0,  635,  640,  645,  637,  645,

			  645,  645,  645,  645,  645,  645,    0,  640,    0,  666,
			  666,  670,  670,  636,    0,  676,  676,  640,  666,    0,
			  670,    0,    0,  635,  676,    0,  637,  646,  646,  646,
			  646,  646,  646,  646,    0,  640,  645,  648,    0,  648,
			  648,  648,  648,  648,  648,  648,  649,    0,  649,  649,
			  649,  649,  649,  649,  649,  651,    0,  651,  651,  651,
			  651,  651,  651,  651,  652,  652,  652,  652,  652,  652,
			  652,  878,  878,  878,    0,    0,  648,  653,  653,  653,
			  653,  653,  653,  653,  654,  649,  654,  654,  654,  654,
			  654,  654,  654,  655,  651,  655,  655,  655,  655,  655,

			  655,  655,  656,  656,  656,  656,  656,  656,  657,  657,
			  657,  657,  657,  657,  659,  659,  659,  659,  659,  659,
			    0,    0,    0,  654,  660,  660,  660,  660,  660,  660,
			  669,  669,  655,  662,  662,  662,  662,  662,  662,  669,
			  674,  674,  675,  675,  791,  669,  680,  680,  791,  674,
			    0,  675,  681,  681,    0,  680,    0,  683,  683,  674,
			    0,  681,    0,  686,  686,  791,  683,    0,  675,  692,
			  692,  681,  686,  669,  687,  687,  791,  680,  692,    0,
			  922,    0,  686,  687,  693,  693,    0,  674,  683,  711,
			  711,  922,  687,  693,  747,  747,  675,    0,  711,  681,

			  711,  922,    0,  747,    0,  680,  712,  712,    0,    0,
			  686,    0,    0,  711,  693,  712,  683,  712,    0,  922,
			  687,  694,  694,  694,  694,  694,  694,  695,  695,  695,
			  695,  695,  695,  696,  696,  696,  696,  696,  696,    0,
			    0,  711,  693,  698,  698,  698,  698,  698,  698,  700,
			    0,  700,    0,    0,  700,  700,  700,  700,  700,  700,
			  701,  701,  701,  701,  701,  701,  702,  702,  702,  702,
			  702,  702,  704,  704,  704,  704,  704,  704,  706,  706,
			  706,  706,  706,  706,  707,  707,  707,  707,  707,  707,
			  708,  708,  708,  708,  708,  708,  710,  710,  715,  701,

			  713,  713,    0,  714,  714,  710,  708,  710,    0,  713,
			    0,  713,  714,    0,  714,  715,    0,  713,    0,  715,
			    0,  716,  716,    0,  717,  717,  710,  718,  718,  708,
			  716,    0,  716,  717,  708,  717,  718,    0,  718,  719,
			  719,  721,    0,  715,    0,  713,  720,  720,  719,    0,
			  719,    0,  722,  722,  710,  720,    0,  720,  721,  723,
			  723,  722,  721,  722,    0,  719,  724,  724,  723,    0,
			  723,  722,    0,  752,  752,  724,  834,  724,    0,    0,
			  834,  723,  752,    0,    0,  724,  721,  733,  733,  733,
			  733,  733,  733,  719,    0,    0,    0,  834,  730,  722,

			  730,  730,  730,  730,  730,  730,  730,    0,  834,  723,
			    0,    0,  732,  724,  732,  732,  732,  732,  732,  732,
			  735,    0,  735,  735,  735,  735,  735,  735,  738,    0,
			  738,  738,  738,  738,  738,  738,    0,  730,  739,  739,
			  739,  739,  739,  739,  766,  766,  766,  766,  766,  766,
			  741,  732,  741,  741,  741,  741,  741,  741,    0,  735,
			  744,  744,  748,  748,  753,  753,    0,  738,    0,  744,
			  886,  748,  887,  753,  755,  755,  758,  758,  886,  748,
			  887,  759,  759,  755,  744,  758,  763,  763,  835,  741,
			  759,  886,  835,  887,    0,  763,  770,  770,  770,  770,

			  770,  770,  758,    0,    0,  763,  886,  748,  887,  835,
			    0,  765,  744,  765,  765,  765,  765,  765,  765,  768,
			  835,  768,  768,  768,  768,  768,  768,    0,    0,    0,
			  758,    0,    0,  763,  771,  771,  771,  771,  771,  771,
			  772,  772,  772,  772,  772,  772,  773,    0,  773,    0,
			  765,  773,  773,  773,  773,  773,  773,    0,  768,  775,
			  775,  775,  775,  775,  775,  776,  776,  776,  776,  777,
			  777,  777,  777,  777,  777,  779,  779,  784,  780,  780,
			    0,    0,  783,  783,  779,  777,  779,  780,    0,  780,
			    0,  783,  779,  783,  784,    0,  781,  781,  784,  783,

			    0,  780,    0,    0,  776,  781,    0,  781,  777,    0,
			  785,  785,    0,  777,    0,  781,  850,  850,    0,  785,
			  779,  785,  784,  786,  786,  850,    0,  783,  785,  780,
			  787,  787,  786,    0,  786,    0,    0,    0,    0,  787,
			    0,  787,  786,  781,  792,  792,  792,  792,  792,  792,
			  792,    0,    0,    0,    0,  794,  785,  794,  794,  794,
			  794,  794,  794,  794,  797,  797,  797,  797,  797,  797,
			  786,  795,  795,  795,  795,  795,  795,  795,  798,  798,
			  798,  798,  798,  798,  800,  800,  800,  800,  800,  800,
			  806,  806,  808,  808,  794,  810,  810,  814,  814,  806, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  808,    0,  906,  810,  906,  814,    0,    0,    0,
			    0,  808,  810,  806,  906,  814,  818,  818,  818,  818,
			  818,  818,  819,  819,  819,  819,  819,  819,  820,  820,
			  820,  820,  820,  820,  916,  916,  916,  916,  916,  808,
			  810,  806,  906,  814,  821,  821,  821,  821,  821,  821,
			  822,  822,  822,  822,  822,  822,  942,  942,  942,  942,
			  942,  819,  823,  823,  823,  823,  823,  823,  825,  825,
			  825,  825,  825,  825,  827,  827,    0,  828,  828,    0,
			  829,  829,    0,  827,  825,  827,  828,    0,  828,  829,
			    0,  829,  830,  830,    0,  836,  827,  832,  832,  836,

			    0,  830,    0,  830,  833,  833,  832,  825,  832,  828,
			  837,  830,  825,  833,  837,  833,  836,  842,  842,  842,
			  842,  842,  842,    0,  827,  855,  855,  836,    0,  866,
			  866,  837,    0,    0,  855,    0,  833,  828,  866,  830,
			  866,  838,  837,  838,  838,  838,  838,  838,  838,  838,
			  839,  901,  839,  839,  839,  839,  839,  839,  839,  901,
			  866,    0,    0,  841,  833,  841,  841,  841,  841,  841,
			  841,  843,  901,  843,  843,  843,  843,  843,  843,    0,
			  838,  848,  848,    0,  852,  852,    0,  901,  866,  839,
			  848,  891,  891,  852,  858,  858,  858,  858,  858,  858,

			  891,    0,  841,  852,  860,  860,  860,  860,  860,  860,
			  843,    0,  861,  848,  861,    0,    0,  861,  861,  861,
			  861,  861,  861,  862,  862,  862,  862,  862,  862,  864,
			  864,  852,    0,  858,  865,  865,    0,    0,  864,    0,
			  864,  848,    0,  865,    0,  865,  867,  867,  864,  874,
			  874,  861,    0,  876,  876,  867,    0,  867,  874,    0,
			  882,  882,  876,  879,  879,  879,  879,  879,  879,  882,
			  865,  882,  883,  883,  888,    0,  864,  884,  884,    0,
			  923,  883,  867,  883,  876,  874,  884,  888,  884,  885,
			  885,  923,  882,  893,  893,  888,  909,  909,  885,  865,

			  885,  923,  893,    0,    0,  909,    0,  909,  888,    0,
			    0,  867,  876,    0,  874,    0,    0,  885,    0,  923,
			  882,    0,    0,  888,  895,  895,  895,  895,  895,  895,
			  896,  896,  896,  896,  896,  896,  898,  898,  898,  898,
			  898,  898,  899,  899,    0,  885,  900,  900,  902,  903,
			    0,  899,    0,  899,    0,  900,  902,  900,    0,    0,
			    0,    0,  903,  908,  908,  900,  931,  931,    0,  902,
			  903,    0,  908,    0,  908,  931,    0,  931,  899,    0,
			    0,    0,    0,  903,  902,  915,  915,  915,  915,  915,
			  915,  908,    0,  900,  907,    0,  907,  907,  903,  907,

			  907,  907,  907,  907,  907,    0,    0,  899,  918,  918,
			  918,  918,  918,  918,    0,    0,    0,  921,  921,  908,
			  920,  920,  920,  920,  920,  920,  921,    0,  921,  925,
			  925,  925,  925,  925,  925,    0,  921,  926,  926,  926,
			  926,  926,  926,  927,  927,  927,  927,  927,  927,  928,
			  928,  928,  928,  928,  928,    0,    0,    0,  932,    0,
			    0,    0,    0,    0,  921,  930,  918,  930,  930,  932,
			  930,  930,  930,  930,  930,  930,  936,  933,  936,  932,
			  935,  935,  935,  935,  935,  935,    0,  936,  933,  937,
			  937,  937,  937,  937,  937,    0,    0,  932,  933,  940,

			  940,  940,  940,  940,  940,  941,  941,  941,  941,  941,
			  941,  945,  944,  946,  944,  936,  933,  944,  944,  944,
			  944,  944,  944,    0,    0,    0,    0,    0,  945,    0,
			  946,  949,  945,  950,  946,  947,  947,  947,  947,  947,
			  947,  948,  948,  948,  948,  948,  948,    0,  949,    0,
			  950,    0,  949,    0,  950,    0,  945,    0,  946,  951,
			  951,  951,  951,  951,  951,  952,  952,  952,  952,  955,
			  955,  955,  955,  955,  955,    0,  949,    0,  950,  956,
			  956,  956,  956,  956,  956,  957,  957,  957,  957,  957,
			  957,  959,  959,  959,  959,  959,  959,    0,    0,    0,

			  960,    0,  960,    0,  952,  960,  960,  960,  960,  960,
			  960,  961,  961,  961,  961,  961,  961,  962,  962,  962,
			  962,  962,  962,  980,  980,  980,  980,  980,  980,  980,
			  980,  980,    0,    0,    0,    0,    0,    0,    0,  960,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,

			  965,  965,  965,  965,  965,  965,  966,  966,    0,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,    0,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,  966,  967,
			  967,    0,  967,  967,  967,  967,  967,  967,  967,  967,
			  967,  967,  967,  967,  967,  967,  967,  967,  967,  967,
			  967,  967,  967,  967,  967,  967,  967,  967,  967,  967,
			  967,  967,  968,  994,  994,  994,  994,  994,  994,  994,
			  994,  994,    0,    0,    0,    0,    0,  968,  968,  968,
			  968,  968,  968,  968,  968,  968,  969,  969,  969,  969,

			    0,  969,  969,  969,  969,  969,  969,    0,    0,    0,
			  969,  969,  969,  969,  969,  969,  969,  969,  969,  970,
			  970,    0,  970,    0,  970,  970,  970,    0,    0,  970,
			  970,  970,  970,  970,  970,    0,    0,    0,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  971,  971,    0,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  971,
			  972,  972,    0,  972,  972,  972,  972,  972,  972,  972,
			  972,  972,  972,  972,  972,  972,  972,  972,  972,  972,

			  972,  972,    0,  972,  972,  972,  972,  972,  972,  972,
			  972,  972,  972,  973,  973,  973,  973,  973,  973,  973,
			  973,  973,  973,  973,  973,  973,  973,  973,  973,  973,
			  973,  973,  973,  973,  973,  973,  973,  973,  973,  973,
			  973,  973,  973,  973,  973,  973,  974,  974,  974,  974,
			  974,  974,  974,  974,  974,  974,  974,  974,  974,  974,
			  974,  974,  974,  974,  974,  974,  974,  974,  974,  974,
			  974,  974,  974,  974,  974,  974,  974,  974,  974,  975,
			    0,  975,    0,    0,    0,    0,  975,    0,  975,  975,
			  975,    0,    0,  975,  975,  975,  975,  975,  975,    0, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  975,  975,  975,  975,  975,  975,  975,  975,  975,
			  975,  976,  976,    0,  976,  976,  976,  976,  976,  976,
			  976,  976,  976,  976,  976,  976,  976,  976,  976,  976,
			  976,  976,  976,  976,  976,  976,  976,  976,  976,  976,
			  976,  976,  976,  976,  977,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  978,  978,  978,
			  978,    0,    0,  978,  978,  978,  978,  978,  978,  978,
			    0,    0,  978,  978,  978,  978,  978,  978,  978,  978,

			  978,  979,    0,    0,  979,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  979,    0,    0,    0,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  981,  981,  981,
			  981,  981,  981,  981,  981,  981,    0,  981,  981,  981,
			  981,  981,  981,  981,  981,  981,  981,  981,  981,  981,
			  981,  981,  981,  981,  981,  981,  981,  981,  981,  981,
			  982,  982,  982,  982,  982,  982,  982,  982,  982,  982,
			  982,  982,  982,  982,  982,  982,  982,  982,  982,  982,
			  982,  982,  982,  982,  982,  982,  982,  982,  982,  982,
			  982,  982,  982,  983,  983,  983,    0,    0,  983,  983,

			  983,  983,  983,  983,    0,    0,    0,  983,  983,  983,
			  983,  983,  983,  983,  983,  983,  984,  984,  984,    0,
			    0,  984,  984,  984,  984,  984,  984,    0,    0,    0,
			  984,  984,  984,  984,  984,  984,  984,  984,  984,  985,
			  985,  985,  985,    0,    0,  985,  985,  985,  985,  985,
			  985,  985,    0,    0,  985,  985,  985,  985,  985,  985,
			  985,  985,  985,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  987,  987,  987,  987,

			  987,  987,    0,    0,    0,  987,  987,  987,  987,  987,
			  987,  987,  987,  987,  988,    0,  988,    0,    0,    0,
			    0,  988,    0,  988,  988,  988,    0,    0,  988,  988,
			  988,  988,  988,  988,    0,    0,    0,  988,  988,  988,
			  988,  988,  988,  988,  988,  988,  989,  989,  989,    0,
			    0,  989,  989,  989,  989,  989,  989,  989,  989,    0,
			    0,  989,  989,  989,  989,  989,  989,    0,    0,    0,
			  989,  989,  989,  989,  989,  989,  989,  989,  989,  990,
			  990,  990,  990,  990,  990,    0,    0,    0,  990,  990,
			  990,  990,  990,  990,  990,  990,  990,  991,  991,  991,

			    0,    0,  991,  991,  991,  991,  991,  991,    0,    0,
			    0,  991,  991,  991,  991,  991,  991,  991,  991,  991,
			  992,    0,  992,    0,    0,    0,    0,  992,    0,  992,
			  992,  992,    0,    0,  992,  992,  992,  992,  992,  992,
			    0,    0,  992,  992,  992,  992,  992,  992,  992,  992,
			  992,  992,  993,  993,  993,    0,    0,  993,  993,  993,
			  993,  993,  993,    0,    0,    0,  993,  993,  993,  993,
			  993,  993,  993,  993,  993,  995,  995,  995,  995,  995,
			  995,  995,  995,  995,  996,  996,  996,  996,  996,  996,
			  996,  996,  996,  997,  997,  997,  997,  997,  997,  997,

			  997,  997,  998,  998,  998,  998,  998,  998,    0,    0,
			    0,  998,  998,  998,  998,  998,  998,  998,  998,  998,
			  999,  999,  999,  999,    0,    0,  999,  999,  999,  999,
			  999,  999,  999,    0,    0,  999,  999,  999,  999,  999,
			  999,  999,  999,  999, 1000, 1000, 1000, 1000,    0,    0,
			 1000, 1000, 1000, 1000, 1000, 1000, 1000,    0,    0, 1000,
			 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1001, 1001,
			 1001, 1001,    0,    0, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001,    0,    0, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1002, 1002, 1002, 1002,    0,    0, 1002, 1002,

			 1002, 1002, 1002, 1002, 1002,    0,    0, 1002, 1002, 1002,
			 1002, 1002, 1002, 1002, 1002, 1002, 1003, 1003, 1003,    0,
			    0, 1003, 1003, 1003, 1003, 1003, 1003,    0,    0,    0,
			 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1004,
			 1004, 1004,    0,    0, 1004, 1004, 1004, 1004, 1004, 1004,
			    0,    0,    0, 1004, 1004, 1004, 1004, 1004, 1004, 1004,
			 1004, 1004,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,

			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 755, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1004)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   90,   95,   77,   79,  187,    0, 1914,
			 5662,   99, 1909, 1874, 1865, 5662,   86, 5662, 5662, 5662,
			 5662, 5662, 1852,   89, 1848,   99,  266, 5662, 5662, 1822,
			 5662, 1820, 5662,   88,   90,  108, 1798,  255,  266,   99,
			  102,  109,  257,  265,  322,  100,  280,  267,  277,   88,
			 5662, 5662, 1756,  401,  312,  326,  480,  251,  322,  104,
			  336,  274,  265,  318,  321,  520,  289,  249, 1793, 5662,
			 5662, 1799,  156, 5662,   99,  401,  309,  406,  312,  409,
			  517, 5662,  518,  545, 5662,  315, 1791,  562,  576, 5662,
			  309, 1773, 5662, 1765, 5662, 1749,    0,  584, 1751, 1713,

			  590, 5662,  562,  600,  607,  642,  614,  654, 5662, 5662,
			  559,    0,  663,  666,  669,  682,  697,  710,  703,  724,
			  739,  742,  624,  745,  757,  770,  776,  783,  788,  795,
			 1601,  817,  820,  837,  901,  913,  916,  946,  823,  929,
			  963,  976,  988, 1619,  647,  348, 1580, 5662,  586, 1618,
			    0, 1054, 1609,  313,  388,  395,  349,  627,  700,  867,
			  935,  889,  394,  966,  463,  527,  991, 1002,  540,  671,
			 1007, 1019,  577,  610, 1017, 1022, 1571,  630,  643,  668,
			 1526, 1078, 1004, 1050,  857,  657, 1120,  699, 1122,  719,
			  734, 1124, 1047,  763,  753, 1126,  878, 1017,  797, 1137,

			 1139,  815, 1142,  334, 1161, 5662, 1563, 5662,  739, 5662,
			 5662, 1102, 1003, 1020, 1085, 1096,  823, 5662, 1502,  826,
			  931, 1493, 1145, 1491, 5662, 1056, 1184, 5662, 1534, 1200,
			  157, 1255,  172, 5662, 5662, 1526, 1199, 1507, 1496, 1480,
			 1477,  885, 5662, 1330, 1211, 1224, 1464,  526, 1230, 1336,
			 1353, 1363, 1381, 1386,    0,    0, 1414, 1404, 1395, 1398,
			 1212, 1401, 1415, 1418, 1421, 1434, 1451, 1454, 1437, 1422,
			 1469, 1472, 1488, 1491, 1494, 1514, 1518, 5662, 1531, 1545,
			 1578, 1590, 1554, 1601, 1566, 1604, 1618, 1630, 1633, 1636,
			 1648, 1661, 1664, 1667, 1679, 1394, 1689, 1704, 1717, 5662,

			  765, 1377,  841,  894,    0, 1305, 1317,  278, 1727, 1729,
			 1345, 1744, 1696,  946, 1731,  991,  999, 1753, 1733, 1014,
			 1129, 1132, 1759, 1766, 1772, 1134, 1308, 1776, 1534, 1780,
			 1323, 1324, 1329, 1238, 1816, 1787, 1801, 1394, 1608,    0,
			 1373, 1380, 1440, 1827, 1829, 1450, 1465, 1840, 1842, 1469,
			 1486, 1183, 1845, 1855, 1858,    0, 1862,  616, 1868, 1615,
			  419, 1646, 1801, 1808, 1812, 1820,  546, 5662, 1182, 1232,
			 1908, 5662, 1208, 1519, 1220, 5662, 5662, 1917, 5662, 5662,
			 5662, 5662, 1624, 1923, 1931, 1937, 1089, 1088, 1946, 1952,
			 1972, 1958, 1978, 1984, 1997, 2003, 2009, 1132,  664,    0,

			 1063, 2018, 2021, 2024, 2036, 2041, 1905, 2056, 2061, 2085,
			 2068, 1812, 2090, 2097, 2109, 2114, 2137, 2142, 2125, 2182,
			 2198, 2205, 2221, 2249, 2261, 2268, 2159, 2165, 2091, 2182,
			 2249, 2280, 2293, 2237,  310, 2324, 2334, 2345, 2352, 1649,
			 2362, 2372,  747,    0, 1508,  642, 2383, 2389, 2287, 2398,
			 2410, 2416, 1534, 2400, 1589, 1605, 2283, 2425,    0, 1613,
			 1703, 1908, 2311, 2230, 1718, 1726, 2427, 1732, 1737, 1754,
			 2434, 2447, 2450, 1794, 2453, 1845, 1857, 2464, 2467,    0,
			    0, 2300, 2315, 1913, 1949, 2038, 2477, 2481, 1062, 2479,
			 5662, 2501, 2509, 2525, 2541, 2547, 1046, 2553, 2559, 2570,

			 2576, 2582, 2598,   81, 2610, 2622, 2124,  678,    0,    0,
			 2484, 2598, 2632, 2610, 2637, 2649, 2661, 2491, 2665, 1030,
			 2677, 2693, 2690, 2712, 2705, 2718, 2737, 2745, 2806, 2766,
			 2120, 2778, 2781, 2725, 2766, 2628,  563, 1410, 1477, 2835,
			 2842, 5662, 2863, 2872, 5662, 2879, 2886, 2893, 5662, 2900,
			 5662, 2910, 5662,  967,  969,    0,  919, 2919, 2850,  810,
			 2927, 2785, 2936,  876, 2943, 2935, 1949, 2817, 1997, 2020,
			 2953, 2955, 2025, 2626, 2957, 2968,    0, 2022, 2971, 2056,
			 2094,    0,  919, 2985, 2995, 3008, 2110, 2997, 2119, 2133,
			 3010, 3012, 2150, 2152, 2162, 2167, 3024, 3028,  901, 3045,

			 3057, 3073,  846, 3081, 3087, 3095, 3104, 3110,  895, 3119,
			 3125, 3135, 2978, 5662, 3141,    0,  881, 3150, 3153, 3157,
			 3169, 3173, 3176, 3190, 3194, 2184, 3197, 3210, 3213, 3216,
			 3231, 5662,  989,  845, 3236, 3250, 3253, 3265, 2781, 3020,
			 3267,  428, 5662, 5662, 1892, 3281, 3309, 2721, 3321, 3330,
			 2821, 3339, 3346, 3359, 3368, 3377, 3384, 3390, 2199, 3396,
			 3406,  838, 3415,  825,  808,    0, 3294, 2201,    0, 3415,
			 3296, 2198, 2251,    0, 3425, 3427, 3300, 2261, 2264, 2363,
			 3431, 3437, 2352, 3442, 2384, 2387, 3448, 3459,    0, 2399,
			 2418, 2425, 3454, 3469, 3503, 3509, 3515,  805, 3525,  791,

			 3536, 3542, 3548, 2477, 3554,  761, 3560, 3566, 3572,  743,
			 3581, 3474, 3491, 3585, 3588, 3569, 3606, 3609, 3612, 3624,
			 3631, 3612, 3637, 3644, 3651,  738,  686,  634,  580, 2920,
			 3682, 3029, 3696, 3669, 1088, 3704, 2510, 1149, 3712, 3720,
			    0, 3734,    0, 2517, 3745,    0, 2525, 3479, 3747,    0,
			    0,    0, 3658, 3749,    0, 3759, 2566,    0, 3761, 3766,
			 2575, 2609, 2628, 3771, 1380, 3795, 3726,    0, 3803,    0,
			 3778, 3816, 3822, 3833, 2531, 3841, 3852, 3851,    0, 3860,
			 3863, 3881, 5662, 3867, 3848, 3895, 3908, 3915, 3021, 3161,
			 3225, 3415, 3926, 5662, 3939, 3953, 5662, 3946, 3960,  565,

			 3966,  563, 2637,  940,  956, 2633, 3975, 2650, 3977, 2670,
			 3980, 2682, 2691,    0, 3982, 1033, 1406,  452, 3998, 4004,
			 4010, 4026, 4032, 4044, 5662, 4050,    0, 4059, 4062, 4065,
			 4077, 5662, 4082, 4089, 3647, 3759, 4066, 4081, 4125, 4134,
			 1527, 4147, 4099, 4155, 2710,  449,  439, 2724, 4166,    0,
			 3901, 2761, 4169,    0, 2767, 4110,  431,  418, 4176,  370,
			 4186, 4199, 4205, 1681, 4214, 4219, 4114, 4231,  993, 5662,
			 1880,  396, 2782,  713, 4234, 2801, 4238,  794, 3353, 4245,
			    0,  291, 4245, 4257, 4262, 4274, 3741, 3743, 4258, 2803,
			    0, 4176,    0, 4278, 2946, 4306, 4312, 1813, 4318, 4327,

			 4331, 4122, 4319, 4333, 1094, 2999, 3990, 4381, 4348, 4281,
			  309,  274, 1135, 3107,    0, 4367, 4016, 5662, 4390,   99,
			 4402, 4402, 3451, 4251, 3136, 4411, 4419, 4425, 4431,  108,
			 4452, 4351, 4429, 4448,    0, 4462, 4463, 4471,  139,  126,
			 4481, 4487, 4038, 5662, 4499, 4482, 4484, 4517, 4523, 4502,
			 4504, 4541, 4552, 5662, 5662, 4551, 4561, 4567, 5662, 4573,
			 4587, 4593, 4599, 5662, 4639, 4672, 4705, 4738, 4762, 4785,
			 4813, 4846, 4879, 4912, 4945, 4977, 5010, 5043, 5067, 5093,
			 4598, 5126, 5159, 5182, 5205, 5229, 5262, 5280, 5312, 5345,
			 5363, 5386, 5418, 5441, 4748, 5450, 5459, 5468, 5486, 5510, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 5534, 5558, 5582, 5605, 5628, yy_Dummy>>,
			1, 5, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1004)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  963,    1,  964,  964,  965,  965,  963,    7,  963,
			  963,  963,  963,  963,  966,  963,  967,  963,  963,  963,
			  963,  963,  963,  963,  968,  963,  963,  963,  963,  963,
			  963,  963,  963,  969,  969,  969,  969,  969,  969,  969,
			  969,  969,  969,  969,  969,  969,  969,  969,  969,  970,
			  963,  963,  971,  963,   53,   53,  963,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,  963,  963,
			  963,  972,  963,  963,  963,  972,  972,  972,  972,  972,
			  973,  963,  974,  973,  963,  975,  963,  975,  975,  963,
			  963,  963,  963,  966,  963,  976,  976,  976,  977,  963,

			  963,  963,  978,  963,  963,  963,  963,  963,  963,  963,
			  969,  979,  969,  969,  969,  969,  969,  969,  969,  969,
			  969,  969,  969,  969,  969,  969,  969,  969,  969,  969,
			  963,   44,  969,  969,  969,  969,  969,  969,  969,  969,
			  969,  969,  969,  970,  970,  970,  971,  963,  963,  963,
			  980,   56,  963,  151,  151,  151,  963,   56,   56,   56,
			   56,   56,  151,   56,  151,  151,   56,   56,  151,  151,
			   56,   56,  151,  151,   56,   56,  151,   56,  151,  151,
			  151,   56,   56,   56,   56,  151,   56,  151,   56,  151,
			  151,   56,   56,  151,  151,   56,   56,  151,  151,   56,

			   56,  151,   56,  151,   56,  963,  972,  963,  963,  963,
			  963,  972,  972,  972,  972,  972,  973,  963,  981,  973,
			  974,  982,  974,  981,  963,  975,  975,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  968,  963,  963,  963,
			  963,  963,  963,  963,  983,  984,  963,  979,  969,  969,
			  969,  969,  969,  969,  969,  969,  969,  969,  969,  963,
			  969,  969,  969,  969,  969,  969,  969,  963,  969,  969,
			  969,  969,  134,  134,  134,  969,  969,  969,  969,  969,
			  969,  969,  969,  969,  969,  963,  970,  970,  970,  963,

			  985,  963,  151,  151,  151,  963,  963,  963,   56,   56,
			   56,  151,  151,  151,   56,  151,  151,   56,   56,  151,
			  151,  151,   56,   56,   56,  151,  151,   56,   56,  963,
			  151,  151,  151,  151,  151,   56,   56,  151,   56,  151,
			   56,  151,  151,   56,   56,  151,  151,   56,   56,  151,
			  151,  151,   56,   56,   56,  151,   56,  151,   56,  972,
			  972,  972,  972,  972,  972,  972,  981,  963,  982,  986,
			  986,  963,  986,  986,  986,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  983,  984,  987,

			  979,  969,  969,  969,  969,  969,  969,  969,  969,  969,
			  969,  963,  969,  969,  969,  969,  969,  969,  134,  131,
			  131,  131,  963,  984,  420,  420,  969,  969,  963,  969,
			  969,  969,  969,  969,  988,  970,  970,  970,  970,  970,
			  970,  970,  963,  989,  151,  151,  963,  963,   56,   56,
			  984,  151,  151,   56,  151,  151,   56,   56,  151,  151,
			  151,   56,   56,   56,  151,  151,   56,  151,  151,  151,
			  984,   56,   56,  151,   56,  151,  151,   56,   56,  151,
			  151,   56,   56,  151,  151,  151,   56,   56,  151,   56,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,

			  963,  963,  963,  963,  963,  963,  963,  963,  990,  991,
			  969,  969,  969,  969,  969,  969,  969,  969,  969,  963,
			  969,  969,  969,  969,  969,  969,  963,  984,  420,  528,
			  963,  969,  969,  969,  969,  983,  963,  992,  988,  970,
			  970,  963,  970,  970,  963,  970,  970,  970,  963,  970,
			  963,  970,  963,  963,  963,  151,  151,  963,  963,  963,
			  963,   56,   56,  984,  984,  151,  151,   56,  151,  151,
			   56,   56,  151,  151,   56,   56,  151,  151,   56,  151,
			  151,  151,  984,  984,   56,   56,  151,   56,  151,  151,
			   56,   56,  151,  151,  151,  151,   56,   56,  963,  963,

			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  993,  991,  969,  969,  969,
			  969,  969,  969,  969,  969,  963,  969,  969,  969,  969,
			  969,  963,  984,  963,  969,  969,  969,  969,  963,  983,
			  983,  992,  963,  963,  970,  970,  970,  970,  970,  970,
			  970,  970,  970,  970,  970,  970,  963,  963,  151,  963,
			  963,  963,  963,  963,  151,  151,   56,  151,  151,   56,
			   56,  151,  151,  151,   56,   56,   56,  151,  151,  151,
			   56,   56,  151,   56,  151,  151,   56,   56,  151,  151,
			  151,  151,   56,   56,  963,  963,  963,  963,  963,  963,

			  963,  963,  963,  963,  963,  963,  963,  963,  963,  993,
			  969,  969,  969,  969,  969,  963,  969,  969,  969,  969,
			  969,  963,  969,  969,  969,  963,  963,  983,  983,  970,
			  970,  970,  963,  963,  963,  963,  151,  963,  963,  963,
			  994,  963,  995,  151,   56,  151,  151,   56,   56,  151,
			  151,  151,   56,   56,  151,   56,  151,  151,   56,   56,
			  151,  151,  151,   56,  963,  963,  963,  996,  963,  997,
			  963,  963,  963,  963,  963,  963,  963,  963,  998,  969,
			  969,  969,  963,  969,  963,  969,  969,  969,  963,  963,
			  990,  990,  970,  963,  970,  970,  963,  963,  963,  963,

			  963,  963,  151,  999, 1000,  151,   56,  151,   56,  151,
			   56,  151,  151,  151,   56, 1001, 1002,  963,  963,  963,
			  963,  963,  963,  963,  963,  963, 1003,  969,  969,  969,
			  969,  963,  969,  969,  963,  963,  993,  993,  970,  970,
			  963,  963,  963,  963,  151,  963,  963,  151,   56,  151,
			   56,  151,   56,  151,  151,   56,  963,  963,  963,  963,
			  963,  963,  963, 1003,  969,  969,  969,  969,  963,  963,
			  993,  993,  151,  151,   56,  151,   56,  151,  963,  963,
			 1004,  963,  969,  969,  969,  969,  963,  963,  993,  151,
			  151,   56,  151,   56,  151,  963,  963, 1004,  963,  969,

			  969,  963,  963,  993,  151,  151,  963,  963,  969,  969,
			  963,  963,  993,  151,  151,  963,  963,  963,  963,  963,
			  963,  969,  963,  963,  151,  963,  963,  963,  963,  963,
			  963,  969,  963,  963,  151,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,    0,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 5, 1000)
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
			   16,   16,   17,   16,   18,   19,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   20,
			   16,   16,   21,   22,   23,   24,    5,   11,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  104,  104,    0,    0,  135,
			  133,    1,    2,   15,  117,   18,  133,   16,   17,    7,
			    6,   13,    5,   11,    8,  109,  109,   14,   12,   28,
			   10,   29,   19,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   87,   95,   95,   95,   95,   21,
			   30,   22,    9,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   23,   20,
			   24,  121,  122,  123,  124,  121,  121,  121,  121,  121,
			  104,  107,  134,  104,  134,  134,   75,  134,  134,   77,
			    1,    2,   27,  117,  116,  131,  131,  131,    3,   32,

			  115,   31,   99,    0,    0,  109,    0,  109,   26,   25,
			   95,    0,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   39,
			    0,   95,   94,   94,   86,   94,   94,   95,   95,   95,
			   95,   95,   95,    0,    0,    0,    0,  108,    0,    0,
			    0,   98,    0,   98,   98,   98,    0,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   39,   98,   39,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,  103,  121,  123,  122,  119,
			  118,  120,  121,  121,  121,  121,  104,  107,    0,  104,
			    0,    0,    0,  105,  106,    0,    0,   77,   75,    0,
			   74,    0,   73,  131,  125,  131,  131,  131,  131,  131,
			  131,    4,   33,  115,    0,    0,    0,    0,    0,  111,
			    0,  109,    0,    0,    0,    0,    0,    0,   95,   95,
			   38,   95,   95,   95,   95,   95,   95,   95,   95,    0,
			   95,   95,   95,   95,   41,   95,   95,   93,   87,   87,
			   87,   87,   94,   95,   94,   94,   94,   95,   95,   95,
			   95,   95,   95,   40,   95,    0,    0,    0,    0,   97,

			  100,    0,   98,   98,   38,    0,    0,    0,   98,   98,
			   38,   66,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,    0,
			   98,   98,   98,   70,   70,   98,   98,   98,   98,   41,
			   41,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   40,   40,   98,   98,  121,
			  121,  121,  121,  121,  121,  121,    0,  105,  106,    0,
			    0,   76,   74,   73,   77,  129,  132,  132,  130,  126,
			  127,  128,  115,    0,  115,    0,    0,    0,    0,  111,
			    0,    0,    0,  114,  109,    0,    0,    0,    0,    0,

			   96,   95,   95,   95,   95,   95,   37,   95,   95,   95,
			   95,    0,   95,   95,   95,   95,   95,   95,   86,   95,
			   95,   95,    0,    0,   86,   86,   86,   36,    0,   43,
			   95,   95,   95,   95,   72,    0,    0,    0,    0,    0,
			    0,    0,    0,   61,   98,   98,    0,    0,   98,   98,
			    0,   98,   98,   98,   98,   98,   98,   98,   37,   98,
			   98,   37,   98,   98,   98,   98,   98,   98,   98,   98,
			    0,   98,   98,   98,   98,   98,   98,   98,   98,   36,
			   43,   36,   43,   98,   98,   98,   98,   98,   98,   98,
			  106,  115,    0,    0,    0,    0,  110,  111,    0,  112,

			    0,  114,    0,    0,    0,  109,   83,    0,    0,    0,
			   58,   95,   95,   95,   95,   95,   95,   44,   95,    0,
			   95,   95,   35,   95,   95,   95,    0,    0,   95,   95,
			    0,   95,   95,   95,   95,    0,   72,   72,    0,    0,
			    0,   67,    0,    0,   71,    0,    0,    0,   65,    0,
			   69,    0,   68,    0,    0,   58,   98,    0,    0,    0,
			    0,   58,   98,   66,   66,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   44,   98,   44,   98,
			   98,   35,   70,   70,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,  115,    0,

			    0,    0,    0,    0,  111,  112,    0,    0,  114,    0,
			    0,    0,    0,   83,    0,    0,    0,   95,   59,   95,
			   60,   95,   95,   46,   95,    0,   95,   95,   95,   95,
			   95,   86,   86,    0,   52,   95,   95,   95,    0,    0,
			    0,    0,   63,   62,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   98,    0,
			    0,    0,    0,    0,   66,   59,   59,   98,   60,   98,
			   60,   98,   98,   46,   98,   98,   46,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   52,   98,
			   98,   98,   52,   98,    0,    0,    0,  101,    0,   99,

			    0,  112,    0,  115,    0,   85,    0,    0,  113,    0,
			   95,   95,   57,   95,   45,    0,   42,   56,   34,   95,
			   50,    0,   95,   95,   95,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   98,    0,    0,    0,
			    0,    0,    0,   98,   98,   57,   98,   57,   98,   45,
			   42,   56,   42,   56,   34,   34,   98,   50,   98,   50,
			   98,   98,   98,   98,    0,    0,    0,    0,    0,    0,
			    0,  112,    0,    0,    0,    0,   82,  113,    0,   95,
			   95,   95,   90,   95,    0,   95,   95,   53,    0,    0,
			    0,    0,    0,   67,    0,    0,   64,    0,    0,  102,

			    0,  100,   98,  102,  100,   98,   98,   98,   98,   98,
			   98,   98,   98,   53,   98,  101,   99,  114,    0,  114,
			    0,    0,    0,    0,   82,  113,    0,   95,   95,   47,
			   95,   89,   51,   95,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   98,    0,    0,   98,   98,   47,
			   47,   98,   98,   51,   98,   51,    0,    0,  114,   84,
			    0,   82,  113,    0,   95,   95,   95,   95,   88,   88,
			   88,   88,   98,   98,   98,   98,   98,   98,    0,    0,
			    0,    0,   95,   49,   48,   95,    0,    0,    0,   98,
			   49,   49,   48,   48,   98,    0,    0,    0,    0,   95,

			   95,    0,    0,    0,   98,   98,   81,   78,   95,   54,
			    0,    0,    0,   98,   54,    0,    0,   81,    0,    0,
			    0,   95,    0,    0,   98,    0,    0,   78,    0,    0,
			   78,   55,    0,    0,   55,    0,   80,    0,    0,    0,
			    0,    0,    0,   80,   78,    0,    0,    0,    0,    0,
			    0,    0,   79,   91,   92,    0,    0,    0,   79,    0,
			   79,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5662
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 963
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 964
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
