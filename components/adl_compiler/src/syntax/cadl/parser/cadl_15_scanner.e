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
if yy_act <= 66 then
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 73 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 73")
end
-- Ignore separators
else
--|#line 74 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 74")
end
in_lineno := in_lineno + text_count
end
else
--|#line 79 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 79")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 80 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 80")
end
in_lineno := in_lineno + 1
else
--|#line 84 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 84")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 85 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 85")
end
last_token := Plus_code
else
--|#line 86 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 86")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 87 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 87")
end
last_token := Slash_code
else
--|#line 88 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 88")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 89 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 89")
end
last_token := Equal_code
else
--|#line 90 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 90")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 91 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 91")
end
last_token := Semicolon_code
else
--|#line 92 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 92")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 93 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 93")
end
last_token := Colon_code
else
--|#line 94 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 94")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 95 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 95")
end
last_token := Left_parenthesis_code
else
--|#line 96 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 96")
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
--|#line 97 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 97")
end
last_token := Dollar_code
else
--|#line 99 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 99")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
--|#line 101 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 101")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 103 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 103")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 104 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 104")
end
last_token := Right_bracket_code
else
--|#line 106 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 106")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 24 then
--|#line 107 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 107")
end
last_token := SYM_END_CBLOCK
else
--|#line 109 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 109")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 110 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 110")
end
last_token := SYM_LE
else
--|#line 111 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 111")
end
last_token := SYM_NE
end
else
if yy_act = 28 then
--|#line 113 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 113")
end
last_token := SYM_LT
else
--|#line 114 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 114")
end
last_token := SYM_GT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 116 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 116")
end
last_token := SYM_MODULO
else
--|#line 117 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 117")
end
last_token := SYM_DIV
end
else
if yy_act = 32 then
--|#line 119 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 119")
end
last_token := SYM_ELLIPSIS
else
--|#line 120 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 120")
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
--|#line 124 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 124")
end
last_token := SYM_MATCHES
else
--|#line 126 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 126")
end
last_token := SYM_MATCHES
end
else
--|#line 130 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 130")
end
last_token := SYM_THEN
end
else
if yy_act = 37 then
--|#line 132 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 132")
end
last_token := SYM_ELSE
else
--|#line 134 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 134")
end
last_token := SYM_AND
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 136 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 136")
end
last_token := SYM_OR
else
--|#line 138 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 138")
end
last_token := SYM_XOR
end
else
if yy_act = 41 then
--|#line 140 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 140")
end
last_token := SYM_NOT
else
--|#line 142 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 142")
end
last_token := SYM_IMPLIES
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 144 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 144")
end
last_token := SYM_TRUE
else
--|#line 146 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 146")
end
last_token := SYM_FALSE
end
else
if yy_act = 45 then
--|#line 148 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 148")
end
last_token := SYM_FORALL
else
--|#line 150 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 150")
end
last_token := SYM_EXISTS
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 154 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 154")
end
last_token := SYM_EXISTENCE
else
--|#line 156 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 156")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 49 then
--|#line 158 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 158")
end
last_token := SYM_CARDINALITY
else
--|#line 160 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 160")
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
--|#line 162 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 162")
end
last_token := SYM_UNORDERED
else
--|#line 164 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 164")
end
last_token := SYM_UNIQUE
end
else
if yy_act = 53 then
--|#line 166 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 166")
end
last_token := SYM_USE_NODE
else
--|#line 168 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 168")
end
last_token := SYM_USE_ARCHETYPE
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 170 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 170")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 172 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 172")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 57 then
--|#line 174 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 174")
end
last_token := SYM_EXCLUDE
else
--|#line 176 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 176")
end
last_token := SYM_AFTER
end
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
--|#line 178 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 178")
end
last_token := SYM_BEFORE
else
--|#line 180 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 180")
end
last_token := SYM_CLOSED
end
else
if yy_act = 61 then
--|#line 183 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 183")
end

			last_token := V_URI
			last_string_value := text
		
else
--|#line 189 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 189")
end

			last_token := V_QUALIFIED_TERM_CODE_REF
			last_string_value := text_substring (2, text_count - 1)
		
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 194 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 194")
end

			last_token := ERR_V_QUALIFIED_TERM_CODE_REF
			last_string_value := text_substring (2, text_count - 1)
		
else
--|#line 202 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 202")
end

		last_token := V_ROOT_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_renumbered (code)
		converted_codes.put (last_string_value, code)
	
end
else
if yy_act = 65 then
--|#line 208 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 208")
end

		last_token := V_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_renumbered (code)
		converted_codes.put (last_string_value, code)
	
else
--|#line 214 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 214")
end

		last_token := V_ID_CODE_STR
		last_string_value := adl_14_id_code_renumbered (text)
	
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
--|#line 218 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 218")
end

		last_token := V_CONSTRAINT_CODE_REF
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_code_renumbered (code)
		converted_codes.put (last_string_value, code)
	
else
--|#line 231 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 231")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
else
--|#line 237 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 237")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 70 then
--|#line 244 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 244")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 251 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 251")
end

		last_token := V_CONSTRAINT_CODE_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
--|#line 267 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 267")
end

		in_buffer.append_string (text_substring (2, text_count))
		set_start_condition (IN_TERM_CONSTRAINT)
		term_code_count := 0
		assumed_term_code_index := 0
	
else
--|#line 275 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 275")
end
 -- match second last line with ';' termination (assumed value)
		str_ := text
		in_buffer.append(text)
		term_code_count := term_code_count + 1
		assumed_term_code_index := term_code_count
	
end
else
if yy_act = 74 then
--|#line 282 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 282")
end
	-- match any line, with ',' termination
		str_ := text
		in_buffer.append(text)
		term_code_count := term_code_count + 1
	
else
--|#line 289 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 289")
end
in_lineno := in_lineno + text_count
end
end
end
else
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act = 76 then
--|#line 292 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 292")
end
in_lineno := in_lineno + 1
else
--|#line 294 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 294")
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
	
end
else
if yy_act = 78 then
--|#line 314 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 314")
end

					last_token := V_ARCHETYPE_ID
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
--|#line 322 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 322")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 323 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 323")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 82 then
--|#line 330 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 330")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 331 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 331")
end

				last_token := V_ISO8601_EXTENDED_TIME
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
--|#line 338 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 338")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 339 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 339")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 86 then
--|#line 346 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 346")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 347 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 347")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 359 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 359")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 369 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 369")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 90 then
--|#line 374 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 374")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 384 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 384")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
if yy_act = 92 then
--|#line 390 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 390")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 401 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 401")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
else
if yy_act = 94 then
--|#line 410 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 410")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 416 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 416")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 422 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 422")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 428 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 428")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 98 then
--|#line 435 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 435")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 441 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 441")
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
if yy_act <= 116 then
if yy_act <= 108 then
if yy_act <= 104 then
if yy_act <= 102 then
if yy_act <= 101 then
if yy_act = 100 then
--|#line 447 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 447")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_REL_PATH
				last_string_value := text
			
else
--|#line 453 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 453")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 460 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 460")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 103 then
--|#line 464 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 464")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 468 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 468")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 472 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 472")
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
--|#line 484 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 484")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 107 then
--|#line 491 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 491")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 496 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 496")
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
--|#line 511 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 511")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 512 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 512")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 111 then
--|#line 516 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 516")
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
--|#line 517 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 517")
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
--|#line 518 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 518")
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
--|#line 538 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 538")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 543 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 543")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 551 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 551")
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
--|#line 553 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 553")
end
in_buffer.append_character ('"')
else
--|#line 555 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 555")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 559 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 559")
end
in_buffer.append_string (text)
else
--|#line 561 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 561")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 566 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 566")
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
--|#line 577 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 577")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 586 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 586")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 588 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 588")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 589 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 589")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 590 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 590")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 591 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 591")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 592 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 592")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 594 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 594")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 595 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 595")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 599 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 599")
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
			create an_array.make_filled (0, 0, 5379)
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
			   10,   10,   10,   72,   81,   96,   81,   73,   72,  594,

			  594,   90,   73,   90,   90,   99,  209,  100,  100,  100,
			  100,  100,  100,  103,  111,  104,  111,  105,  105,  105,
			  105,  105,  105,  112,  115,  111,  111,  113,  111,  114,
			   82,   83,   82,   83,  111,  111,  122,  137,  116,  126,
			   97,  176,  123,  124,   74,  138,  144,  117,  125,   74,
			  887,  112,  115,  210,  145,  113,  106,  114,  208,  230,
			  208,  208,  230,  886,  122,  137,  116,  126,  869,  177,
			  123,  124,  870,  138,  232,  117,  125,  232,   75,   76,
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
			  168,  111,  111,  111,  118,  301,  120,  128,  864,  127,

			  203,  169,  398,  111,  185,  119,  111,  187,  121,  141,
			  129,   90,  532,   90,   90,  533,  207,  225,  170,  207,
			  225,  139,  118,  106,  120,  128,  140,  127,  142,  204,
			  171,  201,  186,  863,  119,  188,  121,  141,  129,  130,
			  131,  131,  131,  131,  131,  131,  162,  151,  111,  139,
			  189,  151,  172,  151,  140,  132,  164,  142,  193,  202,
			  302,  151,  133,  190,  173,  165,  194,  151,  839,  134,
			  227,  135,  295,  136,  163,  157,  178,  179,  191,  157,
			  174,  157,  180,  132,  166,  356,  195,  157,  302,  157,
			  133,  192,  175,  167,  196,  157,  212,  181,  214,  214,

			  135,  157,  136,  148,  182,  183,  148,  305,  207,  298,
			  184,  149,  738,  207,  356,  306,  207,  819,  150,  151,
			  151,  151,  151,  151,  151,  152,  207,  303,  304,  312,
			  590,  151,  151,  151,  151,  151,  153,  151,  151,  151,
			  154,  151,  155,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  156,  303,  304,  312,  151,  157,
			  157,  157,  157,  157,  158,  157,  157,  157,  159,  157,
			  160,  157,  157,  157,  157,  157,  161,  157,  157,  157,
			  157,  157,  148,  436,  150,  148,  211,  211,  211,  295,
			  149,  213,  213,  213,  215,  215,  215,  150,  151,  151,

			  151,  151,  151,  151,  152,  751,  212,  750,  314,  749,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  156,  217,  221,  314,  151,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  197,  224,  487,  229,  532,  198,  229,  532,  315,
			  218,  219,  222,  223,  254,  255,  230,  231,  229,  246,
			  748,  229,  738,  256,  385,  111,  318,  232,  148,  199,
			  230,  148,  386,  235,  200,  734,  149,  315,  218,  219,

			  365,  232,  236,  236,  236,  236,  236,  236,  243,  243,
			  243,  243,  243,  243,  318,  247,  324,  227,  248,  248,
			  248,  248,  248,  248,  244,  249,  249,  249,  249,  249,
			  249,  227,  253,  253,  253,  253,  253,  253,  237,  254,
			  255,  250,  254,  255,  324,  254,  255,  245,  269,  246,
			  111,  307,  244,  238,  328,  325,  103,  239,  104,  240,
			  251,  251,  251,  251,  251,  251,  252,  485,  103,  250,
			  104,  295,  251,  251,  251,  251,  251,  251,  254,  255,
			  255,  254,  255,  325,  254,  255,  329,  256,  256,  111,
			  256,  548,  111,  256,  598,  111,  485,  254,  255,  106,

			  254,  255,  260,  311,  330,  259,  256,  296,  111,  307,
			  258,  106,  254,  255,  329,  254,  255,  261,  254,  255,
			  548,  256,  297,  111,  307,  254,  255,  256,  150,  111,
			  260,  336,  330,  259,  256,  106,  111,  150,  258,  254,
			  255,  208,  262,  208,  208,  261,  338,  302,  256,  264,
			  111,  340,  263,  694,  254,  255,  265,  254,  255,  336,
			  254,  255,  266,  256,  440,  111,  256,  341,  111,  256,
			  262,  111,  254,  255,  338,  308,  254,  264,  267,  340,
			  263,  256,  827,  111,  265,  254,  255,  268,  270,  271,
			  266,  254,  255,  831,  256,  341,  111,  344,  254,  255,

			  256,  345,  111,  254,  255,  221,  267,  256,  498,  111,
			  254,  255,  256,  489,  111,  268,  270,  271,  545,  256,
			  275,  111,  831,  273,  828,  344,  546,  272,  276,  345,
			  274,  350,  254,  255,  904,  254,  255,  130,  254,  255,
			  217,  256,  222,  223,  256,  638,  111,  256,  275,  111,
			  278,  273,  254,  255,  130,  367,  276,  279,  274,  350,
			  835,  256,  354,  111,  110,  854,  280,  282,  281,  637,
			  132,  289,  254,  255,  319,  224,  218,  219,  278,  637,
			  320,  307,  254,  255,  282,  279,  135,  254,  255,  835,
			  354,  307,  222,  223,  854,  280,  307,  281,  132,  289,

			  254,  255,  319,  609,  254,  255,  303,  312,  320,  307,
			  103,  218,  219,  307,  331,  135,  254,  255,  130,  283,
			  283,  283,  283,  283,  283,  256,  442,  111,  254,  255,
			  130,  254,  255,  130,  309,  313,  336,  256,  284,  111,
			  256,  285,  111,  531,  254,  255,  132,  286,  443,  132,
			  254,  255,  399,  256,  442,  111,  133,  904,  449,  307,
			  282,  254,  255,  282,  337,  135,  284,  290,  304,  285,
			  256,  291,  111,  451,  132,  286,  443,  132,  254,  255,
			  287,  254,  255,  288,  133,  225,  449,  256,  225,  111,
			  307,  254,  255,  504,  135,  290,  310,  292,  827,  291, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  256,  451,  111,  254,  255,  324,  254,  255,  287,  738,
			  626,  288,  256,  491,  111,  307,  207,  254,  255,  467,
			  491,  293,  254,  255,  255,  292,  307,  256,  254,  255,
			  370,  307,  256,  326,  254,  255,  314,  307,  227,  294,
			  829,  254,  255,  307,  315,  319,  370,  254,  255,  293,
			  307,  320,  341,  318,  254,  255,  307,  332,  333,  333,
			  333,  333,  333,  307,  316,  254,  255,  366,  294,  254,
			  255,  325,  317,  322,  307,  329,  254,  255,  256,  323,
			  343,  321,  330,  207,  241,  307,  241,  241,  254,  255,
			  821,  822,  254,  255,  211,  211,  211,  307,  207,  327,

			  482,  307,  467,  334,  821,  822,  207,  344,  338,  340,
			  335,  207,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  346,  339,  342,  254,  255,
			  348,  207,  254,  255,  349,  254,  255,  307,  254,  255,
			  462,  307,  254,  255,  307,  371,  370,  307,  371,  452,
			  444,  307,  214,  214,  350,  348,  455,  444,  348,  349,
			  441,  345,  349,  394,  394,  394,  394,  394,  354,  358,
			  359,  360,  361,  362,  211,  211,  211,  452,  356,  363,
			  363,  363,  353,  351,  455,  229,  433,  352,  229,  347,

			  229,  254,  255,  229,  254,  255,  355,  230,  372,  370,
			  307,  372,  230,  256,  399,  111,  398,  357,  232,  364,
			  364,  364,  456,  232,  375,  376,  376,  376,  376,  376,
			  376,  382,  904,  382,  380,  379,  383,  383,  383,  383,
			  383,  383,  384,  384,  384,  384,  384,  384,  227,  378,
			  456,  377,  374,  227,  368,  369,  370,  368,  369,  368,
			  368,  368,  368,  368,  368,  368,  368,  371,  231,  231,
			  368,  231,  231,  231,  231,  231,  231,  368,  372,  368,
			  368,  368,  368,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  231,  231,  231,  231,  368,  368,  373,  368,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  381,  381,  381,  381,
			  381,  381,  387,  387,  387,  387,  387,  387,  228,  457,
			  365,  366,  244,  388,  388,  388,  388,  388,  388,  103,
			  365,  104,  207,  393,  393,  393,  393,  393,  393,  389,
			  254,  255,  461,  331,  269,  245,  391,  457,  391,  307,
			  244,  392,  392,  392,  392,  392,  392,  254,  255,  442,

			  254,  255,  390,  464,  301,  465,  256,  389,  111,  256,
			  461,  111,  106,  395,  395,  395,  395,  395,  395,  400,
			  299,  254,  255,  147,  401,  254,  255,  445,  254,  255,
			  256,  464,  111,  465,  256,  295,  111,  256,  277,  111,
			  254,  255,  552,  403,  254,  255,  466,  400,  402,  256,
			  256,  111,  401,  256,  242,  111,  470,  254,  255,  404,
			  241,  472,  473,  405,  406,  234,  256,  476,  111,  254,
			  255,  403,  254,  255,  466,   94,  402,  398,  256,  477,
			  111,  256,  410,  111,  470,  254,  255,  404,  407,  472,
			  473,  405,  406,  410,  256,  476,  111,  254,  255,   91,

			  408,  254,  255,  410,  254,  255,  256,  477,  111,  411,
			  256,  228,  111,  256,  409,  111,  407,  207,  254,  255,
			  413,  410,  254,  255,  205,  412,  738,  256,  408,  111,
			  480,  256,  481,  111,  864,  414,  147,  411,  254,  255,
			  111,  254,  255,  547,  109,  254,  255,  256,  413,  111,
			  256,  108,  111,  412,  427,  415,  111,  416,  480,  244,
			  481,  254,  255,  414,  418,  418,  418,  418,  418,  418,
			  256,  547,  111,  417,  110,  110,  110,  110,  110,  110,
			  254,  255,  245,  415,  101,  416,   98,  244,   94,  307,
			   92,  254,  255,  417,  419,  419,  419,  419,  419,  419,

			  256,   91,  111,  254,  255,  904,  420,  420,  420,  420,
			  420,  420,  256,  421,  111,  422,  904,  447,  448,  448,
			  448,  448,  448,  417,  110,  110,  110,  110,  110,  110,
			  904,  254,  255,  130,  904,  417,  423,  904,  904,  424,
			  256,  904,  111,  110,  904,  425,  254,  255,  130,  254,
			  255,  532,  254,  255,  533,  256,  904,  111,  256,  553,
			  111,  256,  286,  111,  423,  254,  255,  424,  254,  255,
			  904,  110,  541,  425,  256,  426,  111,  256,  904,  111,
			  295,  429,  254,  255,  428,  254,  255,  553,  254,  255,
			  286,  256,  555,  111,  256,  556,  111,  307,  430,  254,

			  255,  904,  904,  426,  626,  625,  451,  904,  256,  429,
			  111,  542,  428,  434,  435,  435,  435,  435,  435,  295,
			  555,  904,  559,  556,  431,  904,  430,  437,  438,  439,
			  439,  439,  439,  295,  453,  432,  254,  255,  254,  255,
			  254,  255,  254,  255,  560,  307,  563,  307,  564,  307,
			  559,  307,  904,  254,  255,  627,  904,  254,  255,  254,
			  255,  455,  307,  443,  432,  449,  307,  904,  307,  254,
			  255,  452,  560,  301,  563,  904,  564,  456,  307,  904,
			  398,  904,  904,  254,  255,  410,  254,  255,  457,  458,
			  461,  446,  307,  450,  904,  307,  410,  904,  904,  454,

			  254,  255,  207,  254,  255,  459,  410,  464,  904,  307,
			  465,  462,  307,  254,  255,  904,  460,  470,  463,  207,
			  904,  904,  307,  467,  410,  333,  333,  333,  333,  333,
			  333,  207,  473,  254,  255,  468,  472,  207,  469,  254,
			  255,  904,  307,  254,  255,  471,  254,  255,  307,  207,
			  904,  904,  307,  254,  255,  307,  254,  255,  477,  476,
			  475,  904,  307,  566,  474,  307,  369,  370,  567,  369,
			  254,  255,  480,  515,  254,  255,  481,  568,  371,  307,
			  211,  211,  211,  256,  515,  111,  479,  478,  904,  372,
			  573,  566,  485,  904,  515,  482,  567,  213,  213,  213,

			  483,  836,  836,  836,  484,  568,  904,  904,  904,  215,
			  215,  215,  515,  254,  255,  211,  211,  211,  573,  373,
			  904,  486,  256,  904,  111,  904,  904,  211,  211,  211,
			  375,  376,  376,  376,  376,  376,  376,  383,  383,  383,
			  383,  383,  383,  488,  488,  488,  488,  488,  488,  490,
			  490,  490,  490,  490,  490,  492,  492,  492,  492,  492,
			  492,  493,  493,  493,  493,  493,  493,  496,  496,  496,
			  496,  496,  496,  575,  576,  579,  904,  389,  494,  904,
			  494,  904,  489,  495,  495,  495,  495,  495,  495,  392,
			  392,  392,  392,  392,  392,  254,  255,  904,  904,  904, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  390,  575,  576,  579,  307,  389,  497,  497,  497,  497,
			  497,  497,  499,  500,  904,  501,  501,  501,  501,  501,
			  501,  502,  502,  502,  502,  502,  502,  503,  503,  503,
			  503,  503,  503,  254,  255,  904,  904,  254,  255,  904,
			  254,  255,  256,  904,  111,  498,  256,  904,  111,  256,
			  580,  111,  642,  254,  255,  644,  254,  255,  904,  645,
			  904,  904,  256,  506,  111,  256,  904,  111,  254,  255,
			  508,  507,  904,  254,  255,  510,  509,  256,  580,  111,
			  642,  904,  256,  644,  111,  254,  255,  645,  254,  255,
			  904,  506,  904,  648,  256,  904,  111,  256,  508,  111,

			  507,  511,  904,  510,  509,  512,  535,  513,  254,  255,
			  904,  254,  255,  904,  295,  254,  255,  256,  517,  111,
			  256,  648,  111,  514,  256,  904,  111,  254,  255,  511,
			  904,  254,  255,  512,  516,  513,  256,  904,  111,  904,
			  256,  518,  111,  254,  255,  538,  517,  254,  255,  519,
			  110,  514,  256,  110,  111,  654,  256,  904,  111,  110,
			  655,  520,  516,  418,  418,  418,  418,  418,  418,  518,
			  656,  254,  255,  521,  904,  254,  255,  519,  110,  904,
			  256,  110,  111,  654,  256,  110,  111,  110,  655,  520,
			  419,  419,  419,  419,  419,  419,  110,  904,  656,  904,

			  904,  521,  420,  420,  420,  420,  420,  420,  527,  581,
			  904,  904,  110,  110,  522,  522,  522,  522,  522,  522,
			  582,  110,  904,  110,  904,  110,  523,  523,  523,  523,
			  523,  523,  904,  904,  904,  110,  527,  581,  254,  255,
			  110,  524,  524,  524,  524,  524,  524,  307,  582,  398,
			  110,  904,  110,  659,  526,  661,  110,  525,  525,  525,
			  525,  525,  525,  662,  110,  526,  904,  254,  255,  904,
			  665,  559,  110,  254,  255,  526,  256,  904,  111,  254,
			  255,  659,  307,  661,  110,  528,  531,  255,  256,  904,
			  111,  662,  904,  526,  529,  256,  904,  111,  665,  561,

			  110,  904,  666,  547,  535,  530,  536,  537,  537,  537,
			  537,  537,  295,  528,  539,  540,  540,  540,  540,  540,
			  295,  535,  529,  435,  435,  435,  435,  435,  435,  295,
			  666,  550,  543,  530,  439,  439,  439,  439,  439,  439,
			  295,  667,  541,  538,  439,  439,  439,  439,  439,  439,
			  295,  549,  904,  549,  549,  549,  549,  549,  549,  904,
			  538,  254,  255,  904,  254,  255,  904,  904,  904,  667,
			  307,  544,  552,  307,  447,  448,  448,  448,  448,  448,
			  552,  542,  448,  448,  448,  448,  448,  448,  254,  255,
			  254,  255,  904,  904,  553,  548,  595,  307,  595,  307,

			  904,  254,  255,  904,  254,  255,  904,  596,  904,  556,
			  307,  555,  904,  307,  569,  570,  570,  570,  570,  570,
			  254,  255,  554,  563,  551,  254,  255,  254,  255,  307,
			  904,  254,  255,  560,  307,  597,  307,  558,  904,  557,
			  307,  254,  255,  566,  254,  255,  254,  255,  904,  573,
			  307,  565,  904,  307,  904,  307,  254,  255,  567,  580,
			  668,  562,  904,  531,  255,  307,  254,  255,  904,  254,
			  255,  571,  307,  904,  575,  307,  576,  574,  307,  585,
			  585,  585,  585,  585,  585,  904,  572,  584,  668,  579,
			  586,  586,  586,  586,  586,  586,  381,  381,  381,  381,

			  381,  381,  577,  587,  578,  587,  587,  587,  587,  587,
			  587,  588,  588,  588,  588,  588,  588,  583,  489,  495,
			  495,  495,  495,  495,  495,  904,  904,  389,  589,  589,
			  589,  589,  589,  589,  591,  591,  591,  591,  591,  591,
			  592,  592,  592,  592,  592,  592,  904,  708,  904,  709,
			  390,  904,  904,  254,  255,  389,  593,  593,  593,  593,
			  593,  593,  256,  711,  111,  254,  255,  590,  588,  588,
			  588,  588,  588,  588,  256,  708,  111,  709,  500,  498,
			  501,  501,  501,  501,  501,  501,  254,  255,  712,  254,
			  255,  711,  254,  255,  904,  256,  904,  111,  256,  715,

			  111,  256,  904,  111,  904,  602,  630,  601,  254,  255,
			  604,  254,  255,  904,  295,  603,  712,  256,  904,  111,
			  256,  904,  111,  254,  255,  904,  605,  715,  254,  255,
			  606,  904,  256,  602,  111,  254,  255,  256,  604,  111,
			  254,  255,  607,  603,  256,  631,  111,  716,  904,  256,
			  904,  111,  608,  611,  605,  254,  255,  717,  606,  610,
			  254,  255,  720,  722,  256,  649,  111,  254,  255,  256,
			  607,  111,  904,  254,  255,  716,  256,  650,  111,  612,
			  608,  611,  256,  617,  111,  717,  904,  610,  904,  904,
			  720,  722,  614,  649,  617,  723,  904,  613,  522,  522,

			  522,  522,  522,  522,  617,  650,  255,  612,  523,  523,
			  523,  523,  523,  523,  256,  680,  680,  680,  680,  680,
			  614,  904,  617,  723,  622,  613,  615,  525,  525,  525,
			  525,  525,  525,  254,  255,  623,  616,  904,  726,  254,
			  255,  904,  256,  904,  111,  624,  254,  255,  256,  110,
			  111,  904,  618,  904,  615,  256,  904,  111,  619,  254,
			  255,  904,  904,  623,  616,  421,  726,  422,  307,  524,
			  524,  524,  524,  524,  524,  632,  620,  110,  254,  255,
			  618,  254,  255,  295,  110,  644,  619,  256,  904,  111,
			  307,  424,  727,  728,  733,  904,  549,  425,  549,  549,

			  549,  549,  549,  549,  620,  621,  640,  641,  641,  641,
			  641,  641,  110,  646,  634,  254,  255,  390,  904,  424,
			  727,  728,  733,  638,  307,  425,  628,  629,  629,  629,
			  629,  629,  295,  621,  630,  639,  536,  537,  537,  537,
			  537,  537,  295,  630,  756,  537,  537,  537,  537,  537,
			  537,  295,  632,  757,  633,  540,  540,  540,  540,  540,
			  295,  632,  759,  540,  540,  540,  540,  540,  540,  295,
			  904,  904,  756,  631,  437,  635,  635,  635,  635,  635,
			  295,  757,  631,  437,  636,  635,  635,  635,  635,  295,
			  759,  634,  254,  255,  254,  255,  254,  255,  254,  255,

			  634,  307,  761,  307,  904,  307,  904,  307,  904,  763,
			  764,  642,  645,  904,  648,  765,  467,  649,  570,  570,
			  570,  570,  570,  570,  256,  254,  255,  254,  255,  650,
			  761,  789,  254,  255,  307,  904,  307,  763,  764,  643,
			  647,  307,  651,  765,  655,  652,  659,  254,  255,  904,
			  656,  254,  255,  904,  254,  255,  307,  653,  904,  789,
			  307,  904,  904,  307,  904,  904,  254,  255,  790,  792,
			  662,  794,  657,  665,  660,  307,  796,  661,  658,  671,
			  671,  671,  671,  671,  671,  666,  587,  904,  587,  587,
			  587,  587,  587,  587,  254,  255,  790,  792,  664,  794, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  904,  669,  904,  307,  796,  663,  588,  588,  588,  588,
			  588,  588,  904,  670,  674,  674,  674,  674,  674,  674,
			  904,  904,  673,  797,  813,  672,  675,  675,  675,  675,
			  675,  675,  676,  676,  676,  676,  676,  676,  677,  677,
			  677,  677,  677,  677,  678,  678,  678,  678,  678,  678,
			  673,  797,  813,  590,  679,  679,  679,  679,  679,  679,
			  681,  681,  681,  681,  681,  681,  254,  255,  904,  254,
			  255,  814,  904,  254,  255,  256,  250,  111,  256,  904,
			  111,  683,  256,  904,  111,  254,  255,  904,  684,  254,
			  255,  698,  254,  255,  256,  816,  111,  904,  256,  814,

			  111,  256,  698,  111,  250,  688,  254,  255,  685,  683,
			  254,  255,  699,  904,  818,  256,  684,  111,  686,  256,
			  904,  111,  688,  816,  254,  255,  688,  784,  254,  255,
			  698,  784,  830,  256,  687,  111,  685,  256,  904,  111,
			  254,  255,  818,  254,  255,  833,  686,  690,  784,  256,
			  688,  111,  256,  904,  111,  689,  904,  254,  255,  784,
			  830,  693,  687,  254,  255,  904,  256,  904,  111,  845,
			  904,  691,  256,  833,  111,  690,  692,  254,  255,  904,
			  504,  254,  255,  689,  254,  255,  256,  504,  111,  693,
			  256,  904,  111,  256,  698,  111,  904,  845,  696,  691,

			  904,  699,  697,  846,  692,  700,  855,  695,  770,  770,
			  770,  770,  701,  904,  707,  701,  707,  707,  707,  707,
			  707,  707,  701,  254,  255,  904,  696,  254,  255,  904,
			  697,  846,  307,  700,  855,  695,  307,  904,  904,  535,
			  701,  629,  629,  629,  629,  629,  629,  295,  702,  703,
			  703,  703,  703,  703,  295,  704,  705,  705,  705,  705,
			  705,  295,  632,  904,  706,  540,  540,  540,  540,  540,
			  295,  585,  585,  585,  585,  585,  585,  541,  538,  635,
			  635,  635,  635,  635,  635,  295,  543,  904,  635,  635,
			  635,  635,  635,  635,  295,  865,  904,  904,  742,  904,

			  552,  634,  641,  641,  641,  641,  641,  641,  256,  254,
			  255,  254,  255,  254,  255,  742,  542,  904,  307,  742,
			  307,  875,  307,  865,  709,  544,  254,  255,  254,  255,
			  711,  254,  255,  904,  904,  307,  904,  307,  744,  712,
			  307,  254,  255,  742,  904,  254,  255,  717,  842,  875,
			  307,  904,  710,  904,  307,  744,  842,  716,  713,  744,
			  722,  904,  720,  723,  254,  255,  904,  714,  904,  842,
			  904,  904,  730,  307,  730,  719,  904,  731,  731,  731,
			  731,  731,  731,  744,  842,  718,  904,  904,  724,  904,
			  721,  725,  904,  904,  726,  731,  731,  731,  731,  731,

			  731,  732,  732,  732,  732,  732,  732,  592,  592,  592,
			  592,  592,  592,  735,  735,  735,  735,  735,  735,  904,
			  254,  255,  729,  736,  736,  736,  736,  736,  736,  256,
			  904,  111,  254,  255,  590,  737,  737,  737,  737,  737,
			  737,  256,  904,  111,  254,  255,  904,  904,  254,  255,
			  739,  733,  904,  256,  904,  111,  740,  256,  904,  111,
			  254,  255,  904,  904,  904,  741,  254,  255,  904,  256,
			  904,  111,  254,  255,  390,  256,  904,  111,  739,  733,
			  904,  256,  904,  111,  740,  254,  255,  904,  254,  255,
			  904,  254,  255,  741,  256,  904,  111,  256,  904,  111,

			  256,  904,  111,  904,  254,  255,  904,  254,  255,  904,
			  904,  254,  255,  256,  743,  111,  256,  856,  111,  856,
			  256,  904,  111,  745,  904,  904,  904,  904,  857,  746,
			  747,  630,  904,  703,  703,  703,  703,  703,  703,  295,
			  904,  632,  743,  705,  705,  705,  705,  705,  705,  295,
			  904,  745,  772,  773,  772,  773,  858,  746,  747,  752,
			  904,  753,  540,  540,  540,  540,  540,  295,  781,  707,
			  631,  707,  707,  707,  707,  707,  707,  254,  255,  904,
			  634,  254,  255,  254,  255,  781,  307,  254,  255,  781,
			  307,  774,  307,  254,  255,  904,  307,  904,  754,  904,

			  759,  757,  307,  254,  255,  254,  255,  904,  755,  254,
			  255,  904,  307,  781,  307,  254,  255,  904,  307,  904,
			  904,  254,  255,  904,  307,  904,  904,  904,  760,  758,
			  256,  761,  111,  904,  763,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  767,  767,  767,
			  767,  767,  767,  867,  867,  867,  867,  867,  768,  762,
			  768,  904,  766,  769,  769,  769,  769,  769,  769,  771,
			  771,  771,  771,  771,  771,  775,  775,  775,  775,  775,
			  775,  254,  255,  904,  254,  255,  904,  254,  255,  904,
			  256,  733,  111,  256,  904,  111,  307,  904,  777,  254,

			  255,  904,  904,  904,  254,  255,  904,  778,  256,  904,
			  111,  254,  255,  256,  390,  111,  254,  255,  779,  733,
			  256,  780,  111,  254,  255,  307,  777,  785,  904,  782,
			  873,  785,  256,  784,  111,  778,  904,  786,  904,  785,
			  904,  873,  783,  787,  254,  255,  779,  904,  785,  780,
			  904,  873,  904,  307,  786,  254,  255,  782,  904,  785,
			  787,  904,  904,  904,  256,  786,  111,  790,  904,  873,
			  783,  787,  704,  788,  705,  705,  705,  705,  295,  632,
			  904,  753,  540,  540,  540,  540,  540,  295,  254,  255,
			  904,  254,  255,  254,  255,  791,  904,  307,  904,  882,

			  307,  882,  307,  904,  904,  904,  904,  792,  794,  904,
			  883,  796,  769,  769,  769,  769,  769,  769,  634,  799,
			  799,  799,  799,  799,  799,  800,  800,  800,  800,  800,
			  800,  897,  898,  897,  898,  793,  795,  904,  884,  798,
			  597,  597,  597,  597,  597,  597,  801,  801,  801,  801,
			  801,  801,  802,  802,  802,  802,  802,  802,  590,  803,
			  803,  803,  803,  803,  803,  254,  255,  904,  254,  255,
			  899,  254,  255,  904,  256,  733,  111,  256,  904,  111,
			  256,  809,  111,  254,  255,  809,  904,  805,  254,  255,
			  807,  810,  256,  904,  111,  810,  904,  256,  390,  111,

			  806,  809,  809,  733,  810,  811,  904,  904,  812,  890,
			  254,  255,  810,  809,  904,  805,  904,  904,  807,  307,
			  808,  904,  811,  810,  904,  812,  890,  904,  806,  816,
			  890,  904,  904,  811,  904,  752,  812,  705,  705,  705,
			  705,  705,  705,  295,  254,  255,  254,  255,  808,  904,
			  904,  904,  904,  307,  890,  307,  904,  817,  767,  767,
			  767,  767,  767,  767,  820,  820,  820,  820,  820,  820,
			  904,  904,  904,  772,  754,  772,  814,  904,  802,  802,
			  802,  802,  802,  802,  803,  803,  803,  803,  803,  803,
			  254,  255,  904,  904,  254,  255,  904,  590,  904,  256, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  904,  111,  904,  256,  815,  111,  874,  254,  255,  823,
			  254,  255,  774,  254,  255,  904,  256,  874,  111,  256,
			  904,  111,  307,  254,  255,  254,  255,  874,  904,  904,
			  824,  904,  307,  904,  256,  904,  111,  823,  825,  837,
			  837,  837,  837,  837,  837,  874,  826,  254,  255,  831,
			  904,  254,  255,  904,  833,  738,  256,  840,  111,  824,
			  256,  904,  111,  254,  255,  843,  825,  904,  843,  904,
			  254,  255,  256,  843,  111,  826,  844,  904,  832,  307,
			  904,  904,  834,  904,  904,  840,  843,  904,  904,  844,
			  904,  841,  847,  847,  847,  847,  847,  847,  904,  904,

			  904,  843,  904,  904,  844,  774,  774,  774,  774,  774,
			  774,  848,  848,  848,  848,  848,  848,  254,  255,  841,
			  254,  255,  851,  738,  852,  904,  256,  904,  111,  256,
			  851,  111,  852,  904,  904,  904,  852,  254,  255,  850,
			  254,  255,  904,  851,  853,  852,  256,  904,  111,  256,
			  904,  111,  904,  849,  904,  254,  255,  853,  851,  904,
			  852,  904,  904,  904,  256,  862,  111,  850,  859,  904,
			  860,  861,  853,  848,  848,  848,  848,  848,  848,  904,
			  904,  904,  849,  866,  866,  866,  866,  866,  866,  904,
			  904,  904,  904,  862,  868,  868,  868,  868,  868,  868,

			  871,  871,  871,  871,  871,  871,  254,  255,  876,  876,
			  876,  876,  876,  876,  904,  256,  904,  111,  877,  877,
			  877,  877,  877,  877,  904,  872,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  859,  879,
			  860,  878,  904,  871,  871,  871,  871,  871,  871,  904,
			  879,  880,  869,  872,  881,  881,  881,  881,  881,  881,
			  879,  904,  880,  885,  885,  885,  885,  885,  885,  904,
			  904,  904,  880,  889,  889,  889,  889,  889,  879,  858,
			  858,  858,  858,  858,  858,  904,  904,  904,  904,  904,
			  880,  888,  888,  888,  888,  888,  888,  859,  891,  860,

			  904,  904,  885,  885,  885,  885,  885,  885,  892,  892,
			  892,  892,  892,  892,  894,  891,  895,  904,  904,  891,
			  893,  893,  893,  893,  893,  893,  904,  904,  904,  904,
			  904,  894,  904,  895,  904,  894,  904,  895,  904,  904,
			  904,  904,  904,  891,  896,  896,  896,  896,  896,  896,
			  884,  884,  884,  884,  884,  884,  904,  904,  904,  894,
			  904,  895,  900,  900,  900,  900,  900,  900,  901,  901,
			  901,  901,  901,  901,  902,  902,  902,  902,  902,  902,
			  897,  904,  897,  904,  904,  901,  901,  901,  901,  901,
			  901,  903,  903,  903,  903,  903,  903,  899,  899,  899,

			  899,  899,  899,  300,  300,  300,  300,  300,  300,  300,
			  300,  300,  904,  904,  904,  904,  904,  904,  904,  899,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   93,   93,  904,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,  904,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   95,   95,  904,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,  102,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  110,  110,  110,  110,  904,  110,  110,  110,  110,
			  110,  904,  904,  904,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  143,  143,  904,  143,  904,  143,  143,

			  143,  904,  904,  143,  143,  143,  143,  143,  904,  904,
			  904,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  146,  146,  904,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  206,  206,  904,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  904,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,

			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  226,  904,
			  226,  904,  904,  904,  904,  226,  904,  226,  226,  226,
			  904,  904,  226,  226,  226,  226,  226,  904,  904,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  233,
			  233,  904,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,

			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  102,  102,  102,  102,  904,  904,  102,
			  102,  102,  102,  102,  102,  904,  904,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  257,  904,  904,  257,
			  257,  257,  257,  257,  257,  257,  257,  257,  257,  904,
			  904,  904,  257,  257,  257,  257,  257,  257,  257,  257,
			  257,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  904,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  396,  396,  396,  904,  904,
			  396,  396,  396,  396,  396,  904,  904,  904,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  397,  397,  397,
			  904,  904,  397,  397,  397,  397,  397,  904,  904,  904,
			  397,  397,  397,  397,  397,  397,  397,  397,  397,  300, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  300,  300,  300,  904,  904,  300,  300,  300,  300,  300,
			  300,  904,  904,  300,  300,  300,  300,  300,  300,  300,
			  300,  300,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  505,  505,  505,  505,  505,  904,
			  904,  904,  505,  505,  505,  505,  505,  505,  505,  505,
			  505,  534,  904,  534,  904,  904,  904,  904,  534,  904,
			  534,  534,  534,  904,  904,  534,  534,  534,  534,  534,
			  904,  904,  904,  534,  534,  534,  534,  534,  534,  534,

			  534,  534,  441,  441,  441,  904,  904,  441,  441,  441,
			  441,  441,  441,  441,  441,  904,  904,  441,  441,  441,
			  441,  441,  904,  904,  904,  441,  441,  441,  441,  441,
			  441,  441,  441,  441,  599,  599,  599,  599,  599,  904,
			  904,  904,  599,  599,  599,  599,  599,  599,  599,  599,
			  599,  600,  600,  600,  904,  904,  600,  600,  600,  600,
			  600,  904,  904,  904,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  625,  904,  625,  904,  904,  904,  904,
			  625,  904,  625,  625,  625,  904,  904,  625,  625,  625,
			  625,  625,  904,  904,  625,  625,  625,  625,  625,  625,

			  625,  625,  625,  625,  682,  682,  682,  904,  904,  682,
			  682,  682,  682,  682,  904,  904,  904,  682,  682,  682,
			  682,  682,  682,  682,  682,  682,  776,  776,  776,  776,
			  776,  904,  904,  904,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  804,  804,  804,  904,  904,  804,  804,
			  804,  804,  804,  904,  904,  904,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  838,  838,  838,  904,  904,
			  838,  838,  838,  838,  838,  904,  904,  904,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,    9,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,

			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904, yy_Dummy>>,
			1, 380, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5379)
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
			    1,    1,    1,    3,    5,   16,    6,    3,    4,  499,

			  499,   11,    4,   11,   11,   23,   74,   23,   23,   23,
			   23,   23,   23,   25,   33,   25,   34,   25,   25,   25,
			   25,   25,   25,   33,   34,   39,   45,   33,   40,   33,
			    5,    5,    6,    6,   35,   41,   39,   45,   35,   41,
			   16,   59,   40,   40,    3,   45,   49,   35,   40,    4,
			  880,   33,   34,   74,   49,   33,   25,   33,   72,  230,
			   72,   72,  230,  879,   39,   45,   35,   41,  870,   59,
			   40,   40,  860,   45,  232,   35,   40,  232,    3,    3,
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
			   57,   43,   38,   47,   37,  307,   38,   43,  852,   42,

			   67,   57,  307,   48,   61,   37,   46,   62,   38,   47,
			   43,   90,  433,   90,   90,  433,   76,   85,   57,   78,
			   85,   46,   37,   26,   38,   43,   46,   42,   48,   67,
			   57,   66,   61,  851,   37,   62,   38,   47,   43,   44,
			   44,   44,   44,   44,   44,   44,   54,   54,   44,   46,
			   63,   54,   58,   54,   46,   44,   55,   48,   64,   66,
			  153,   55,   44,   63,   58,   55,   64,   55,  822,   44,
			   85,   44,  145,   44,   54,   54,   60,   60,   63,   54,
			   58,   54,   60,   44,   55,  203,   64,   54,  153,   55,
			   44,   63,   58,   55,   64,   55,   76,   60,   78,   78,

			   44,   55,   44,   53,   60,   60,   53,  156,   75,  145,
			   60,   53,  812,   77,  203,  156,   79,  800,   53,   53,
			   53,   53,   53,   53,   53,   53,  359,  154,  155,  162,
			  767,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,  154,  155,  162,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   56,  297,  755,   56,   75,   75,   75,  297,
			   56,   77,   77,   77,   79,   79,   79,   56,   56,   56,

			   56,   56,   56,   56,   56,  701,  359,  700,  164,  699,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   80,   82,  164,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   65,   83,  365,   87,  532,   65,   87,  532,  165,
			   80,   80,   82,   82,  110,  110,   87,   87,   88,  102,
			  698,   88,  682,  110,  247,  110,  168,   87,  148,   65,
			   88,  148,  247,   97,   65,  678,  148,  165,   83,   83,

			  365,   88,   97,   97,   97,   97,   97,   97,  100,  100,
			  100,  100,  100,  100,  168,  102,  172,   87,  103,  103,
			  103,  103,  103,  103,  100,  104,  104,  104,  104,  104,
			  104,   88,  106,  106,  106,  106,  106,  106,   97,  122,
			  122,  104,  157,  157,  172,  177,  177,  100,  122,  672,
			  122,  157,  100,   97,  177,  173,  105,   97,  105,   97,
			  105,  105,  105,  105,  105,  105,  105,  356,  107,  104,
			  107,  144,  107,  107,  107,  107,  107,  107,  112,  112,
			  397,  113,  113,  173,  114,  114,  178,  112,  397,  112,
			  113,  443,  113,  114,  503,  114,  356,  115,  115,  105,

			  161,  161,  114,  161,  179,  113,  115,  144,  115,  161,
			  112,  107,  116,  116,  178,  158,  158,  115,  118,  118,
			  443,  116,  144,  116,  158,  117,  117,  118,  300,  118,
			  114,  185,  179,  113,  117,  503,  117,  639,  112,  119,
			  119,  208,  116,  208,  208,  115,  187,  158,  119,  118,
			  119,  189,  117,  617,  120,  120,  119,  121,  121,  185,
			  123,  123,  119,  120,  300,  120,  121,  190,  121,  123,
			  116,  123,  124,  124,  187,  158,  600,  118,  120,  189,
			  117,  124,  809,  124,  119,  125,  125,  121,  123,  124,
			  119,  126,  126,  814,  125,  190,  125,  193,  127,  127,

			  126,  194,  126,  128,  128,  220,  120,  127,  592,  127,
			  129,  129,  128,  585,  128,  121,  123,  124,  440,  129,
			  128,  129,  814,  126,  809,  193,  440,  125,  129,  194,
			  127,  198,  131,  131,  131,  132,  132,  132,  138,  138,
			  216,  131,  220,  220,  132,  548,  132,  138,  128,  138,
			  131,  126,  133,  133,  133,  222,  129,  131,  127,  198,
			  818,  133,  201,  133,  131,  845,  131,  132,  131,  546,
			  133,  138,  184,  184,  169,  219,  216,  216,  131,  545,
			  169,  184,  159,  159,  133,  131,  133,  163,  163,  818,
			  201,  159,  222,  222,  845,  131,  163,  131,  133,  138,

			  310,  310,  169,  515,  186,  186,  159,  163,  169,  310,
			  492,  219,  219,  186,  184,  133,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  302,  134,  135,  135,
			  135,  136,  136,  136,  159,  163,  186,  135,  134,  135,
			  136,  134,  136,  485,  139,  139,  135,  134,  303,  136,
			  160,  160,  399,  139,  302,  139,  136,  625,  312,  160,
			  135,  137,  137,  136,  186,  136,  134,  139,  160,  134,
			  137,  139,  137,  314,  135,  134,  303,  136,  140,  140,
			  137,  174,  174,  137,  136,  225,  312,  140,  225,  140,
			  174,  141,  141,  396,  136,  139,  160,  140,  811,  139, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  141,  314,  141,  142,  142,  174,  166,  166,  137,  811,
			  625,  137,  142,  386,  142,  166,  212,  167,  167,  569,
			  385,  141,  170,  170,  616,  140,  167,  569,  171,  171,
			  373,  170,  616,  174,  192,  192,  166,  171,  225,  142,
			  811,  175,  175,  192,  167,  171,  368,  182,  182,  141,
			  175,  171,  192,  170,  181,  181,  182,  181,  181,  181,
			  181,  181,  181,  181,  166,  183,  183,  367,  142,  151,
			  151,  175,  167,  171,  183,  182,  188,  188,  151,  171,
			  192,  170,  183,  361,  241,  188,  241,  241,  195,  195,
			  804,  804,  191,  191,  212,  212,  212,  195,  211,  175,

			  350,  191,  332,  182,  838,  838,  213,  195,  188,  191,
			  183,  214,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  195,  188,  191,  196,  196,
			  197,  215,  199,  199,  197,  200,  200,  196,  202,  202,
			  325,  199,  204,  204,  200,  371,  371,  202,  371,  315,
			  306,  204,  361,  361,  200,  199,  318,  305,  197,  199,
			  301,  196,  197,  252,  252,  252,  252,  252,  202,  211,
			  211,  211,  211,  211,  213,  213,  213,  315,  204,  214,
			  214,  214,  200,  199,  318,  226,  295,  199,  226,  196,

			  229,  339,  339,  229,  260,  260,  202,  226,  372,  372,
			  339,  372,  229,  260,  257,  260,  256,  204,  226,  215,
			  215,  215,  319,  229,  236,  236,  236,  236,  236,  236,
			  236,  244,  246,  244,  240,  239,  244,  244,  244,  244,
			  244,  244,  245,  245,  245,  245,  245,  245,  226,  238,
			  319,  237,  235,  229,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  243,  243,  243,  243,
			  243,  243,  248,  248,  248,  248,  248,  248,  228,  320,
			  223,  221,  243,  249,  249,  249,  249,  249,  249,  251,
			  218,  251,  206,  251,  251,  251,  251,  251,  251,  249,
			  308,  308,  324,  180,  176,  243,  250,  320,  250,  308,
			  243,  250,  250,  250,  250,  250,  250,  259,  259,  308,

			  258,  258,  249,  329,  152,  330,  259,  249,  259,  258,
			  324,  258,  251,  253,  253,  253,  253,  253,  253,  258,
			  149,  261,  261,  146,  259,  262,  262,  308,  263,  263,
			  261,  329,  261,  330,  262,  143,  262,  263,  130,  263,
			  265,  265,  640,  262,  264,  264,  331,  258,  261,  265,
			  640,  265,  259,  264,   99,  264,  336,  266,  266,  263,
			   98,  340,  341,  264,  265,   95,  266,  344,  266,  267,
			  267,  262,  268,  268,  331,   93,  261,  269,  267,  345,
			  267,  268,  269,  268,  336,  270,  270,  263,  266,  340,
			  341,  264,  265,  269,  270,  344,  270,  272,  272,   91,

			  267,  271,  271,  269,  274,  274,  272,  345,  272,  270,
			  271,   86,  271,  274,  268,  274,  266,   71,  273,  273,
			  272,  269,  275,  275,   68,  271,  853,  273,  267,  273,
			  348,  275,  349,  275,  853,  273,   52,  270,  276,  276,
			   36,  278,  278,  442,   31,  288,  288,  276,  272,  276,
			  278,   29,  278,  271,  288,  275,  288,  276,  348,  381,
			  349,  279,  279,  273,  279,  279,  279,  279,  279,  279,
			  279,  442,  279,  278,  282,  282,  282,  282,  282,  282,
			  355,  355,  381,  275,   24,  276,   22,  381,   14,  355,
			   13,  280,  280,  279,  280,  280,  280,  280,  280,  280,

			  280,   12,  280,  281,  281,    9,  281,  281,  281,  281,
			  281,  281,  281,  283,  281,  283,  283,  311,  311,  311,
			  311,  311,  311,  280,  284,  284,  284,  284,  284,  284,
			    0,  285,  285,  285,    0,  281,  283,    0,    0,  283,
			  285,    0,  285,  284,    0,  283,  286,  286,  286,  287,
			  287,  533,  290,  290,  533,  286,    0,  286,  287,  449,
			  287,  290,  285,  290,  283,  289,  289,  283,  291,  291,
			    0,  284,  437,  283,  289,  287,  289,  291,    0,  291,
			  437,  290,  292,  292,  289,  293,  293,  449,  316,  316,
			  285,  292,  451,  292,  293,  452,  293,  316,  291,  294,

			  294,    0,  534,  287,  533,  534,  316,    0,  294,  290,
			  294,  437,  289,  296,  296,  296,  296,  296,  296,  296,
			  451,    0,  456,  452,  292,    0,  291,  298,  298,  298,
			  298,  298,  298,  298,  316,  294,  309,  309,  313,  313,
			  317,  317,  321,  321,  457,  309,  461,  313,  462,  317,
			  456,  321,    0,  322,  322,  534,    0,  323,  323,  326,
			  326,  321,  322,  309,  294,  313,  323,    0,  326,  327,
			  327,  317,  457,  328,  461,    0,  462,  322,  327,    0,
			  328,    0,    0,  334,  334,  328,  335,  335,  323,  321,
			  326,  309,  334,  313,    0,  335,  328,    0,    0,  317,

			  337,  337,  358,  342,  342,  322,  328,  334,    0,  337,
			  335,  327,  342,  343,  343,    0,  323,  337,  326,  360,
			    0,    0,  343,  333,  328,  333,  333,  333,  333,  333,
			  333,  362,  343,  346,  346,  334,  342,  363,  335,  347,
			  347,    0,  346,  351,  351,  337,  352,  352,  347,  364,
			    0,    0,  351,  353,  353,  352,  357,  357,  347,  346,
			  343,    0,  353,  464,  342,  357,  369,  369,  465,  369,
			  458,  458,  351,  410,  405,  405,  352,  466,  369,  458,
			  358,  358,  358,  405,  410,  405,  347,  346,    0,  369,
			  470,  464,  357,    0,  410,  353,  465,  360,  360,  360,

			  351,  819,  819,  819,  352,  466,    0,    0,    0,  362,
			  362,  362,  410,  425,  425,  363,  363,  363,  470,  369,
			    0,  357,  425,    0,  425,    0,    0,  364,  364,  364,
			  376,  376,  376,  376,  376,  376,  376,  382,  382,  382,
			  382,  382,  382,  383,  383,  383,  383,  383,  383,  384,
			  384,  384,  384,  384,  384,  387,  387,  387,  387,  387,
			  387,  388,  388,  388,  388,  388,  388,  390,  390,  390,
			  390,  390,  390,  472,  473,  480,    0,  388,  389,    0,
			  389,    0,  383,  389,  389,  389,  389,  389,  389,  391,
			  391,  391,  391,  391,  391,  478,  478,    0,    0,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  388,  472,  473,  480,  478,  388,  392,  392,  392,  392,
			  392,  392,  393,  393,    0,  393,  393,  393,  393,  393,
			  393,  394,  394,  394,  394,  394,  394,  395,  395,  395,
			  395,  395,  395,  400,  400,    0,    0,  401,  401,    0,
			  402,  402,  400,    0,  400,  392,  401,    0,  401,  402,
			  481,  402,  553,  403,  403,  555,  404,  404,    0,  556,
			    0,    0,  403,  400,  403,  404,    0,  404,  406,  406,
			  402,  401,    0,  407,  407,  404,  403,  406,  481,  406,
			  553,    0,  407,  555,  407,  412,  412,  556,  408,  408,
			    0,  400,    0,  559,  412,    0,  412,  408,  402,  408,

			  401,  406,    0,  404,  403,  407,  628,  408,  409,  409,
			    0,  411,  411,    0,  628,  413,  413,  409,  412,  409,
			  411,  559,  411,  409,  413,    0,  413,  414,  414,  406,
			  417,  415,  415,  407,  411,  408,  414,    0,  414,    0,
			  415,  413,  415,  416,  416,  628,  412,  426,  426,  414,
			  417,  409,  416,  417,  416,  564,  426,    0,  426,  417,
			  566,  415,  411,  418,  418,  418,  418,  418,  418,  413,
			  567,  428,  428,  416,    0,  429,  429,  414,  417,    0,
			  428,  417,  428,  564,  429,  418,  429,  417,  566,  415,
			  419,  419,  419,  419,  419,  419,  418,    0,  567,    0,

			    0,  416,  420,  420,  420,  420,  420,  420,  429,  482,
			    0,    0,  419,  418,  421,  421,  421,  421,  421,  421,
			  482,  419,    0,  419,    0,  418,  422,  422,  422,  422,
			  422,  422,    0,    0,    0,  420,  429,  482,  459,  459,
			  419,  423,  423,  423,  423,  423,  423,  459,  482,  427,
			  419,    0,  419,  573,  427,  575,  423,  424,  424,  424,
			  424,  424,  424,  576,  420,  427,    0,  430,  430,    0,
			  579,  459,  424,  445,  445,  427,  430,    0,  430,  431,
			  431,  573,  445,  575,  423,  430,  432,  432,  431,    0,
			  431,  576,    0,  427,  431,  432,    0,  432,  579,  459,

			  424,    0,  580,  445,  434,  431,  434,  434,  434,  434,
			  434,  434,  434,  430,  436,  436,  436,  436,  436,  436,
			  436,  435,  431,  435,  435,  435,  435,  435,  435,  435,
			  580,  445,  438,  431,  438,  438,  438,  438,  438,  438,
			  438,  581,  439,  434,  439,  439,  439,  439,  439,  439,
			  439,  444,    0,  444,  444,  444,  444,  444,  444,    0,
			  435,  446,  446,    0,  450,  450,    0,    0,    0,  581,
			  446,  438,  447,  450,  447,  447,  447,  447,  447,  447,
			  448,  439,  448,  448,  448,  448,  448,  448,  453,  453,
			  454,  454,    0,    0,  450,  446,  502,  453,  502,  454,

			    0,  460,  460,    0,  463,  463,    0,  502,    0,  454,
			  460,  453,    0,  463,  467,  467,  467,  467,  467,  467,
			  468,  468,  450,  463,  446,  469,  469,  471,  471,  468,
			    0,  479,  479,  460,  469,  502,  471,  454,    0,  453,
			  479,  484,  484,  468,  474,  474,  475,  475,    0,  471,
			  484,  463,    0,  474,    0,  475,  483,  483,  469,  484,
			  582,  460,    0,  486,  486,  483,  550,  550,    0,  565,
			  565,  468,  486,    0,  474,  550,  475,  471,  565,  488,
			  488,  488,  488,  488,  488,    0,  469,  484,  582,  483,
			  489,  489,  489,  489,  489,  489,  490,  490,  490,  490,

			  490,  490,  474,  491,  475,  491,  491,  491,  491,  491,
			  491,  493,  493,  493,  493,  493,  493,  483,  488,  494,
			  494,  494,  494,  494,  494,    0,    0,  493,  495,  495,
			  495,  495,  495,  495,  496,  496,  496,  496,  496,  496,
			  497,  497,  497,  497,  497,  497,    0,  638,    0,  644,
			  493,    0,    0,  506,  506,  493,  498,  498,  498,  498,
			  498,  498,  506,  648,  506,  507,  507,  495,  500,  500,
			  500,  500,  500,  500,  507,  638,  507,  644,  501,  497,
			  501,  501,  501,  501,  501,  501,  508,  508,  649,  509,
			  509,  648,  510,  510,    0,  508,    0,  508,  509,  654,

			  509,  510,    0,  510,    0,  508,  702,  507,  511,  511,
			  510,  512,  512,    0,  702,  509,  649,  511,    0,  511,
			  512,    0,  512,  513,  513,    0,  511,  654,  514,  514,
			  512,    0,  513,  508,  513,  517,  517,  514,  510,  514,
			  516,  516,  512,  509,  517,  702,  517,  655,    0,  516,
			    0,  516,  514,  517,  511,  518,  518,  656,  512,  516,
			  519,  519,  659,  661,  518,  560,  518,  520,  520,  519,
			  512,  519,    0,  521,  521,  655,  520,  560,  520,  519,
			  514,  517,  521,  526,  521,  656,    0,  516,    0,    0,
			  659,  661,  521,  560,  526,  662,    0,  520,  522,  522,

			  522,  522,  522,  522,  526,  560,  523,  519,  523,  523,
			  523,  523,  523,  523,  523,  596,  596,  596,  596,  596,
			  521,    0,  526,  662,  531,  520,  522,  525,  525,  525,
			  525,  525,  525,  527,  527,  531,  523,    0,  666,  528,
			  528,    0,  527,    0,  527,  531,  529,  529,  528,  525,
			  528,    0,  527,    0,  522,  529,    0,  529,  528,  557,
			  557,    0,    0,  531,  523,  524,  666,  524,  557,  524,
			  524,  524,  524,  524,  524,  704,  529,  525,  530,  530,
			  527,  551,  551,  704,  524,  557,  528,  530,    0,  530,
			  551,  524,  667,  668,  676,    0,  549,  524,  549,  549,

			  549,  549,  549,  549,  529,  530,  552,  552,  552,  552,
			  552,  552,  524,  557,  704,  643,  643,  676,    0,  524,
			  667,  668,  676,  551,  643,  524,  535,  535,  535,  535,
			  535,  535,  535,  530,  536,  549,  536,  536,  536,  536,
			  536,  536,  536,  537,  708,  537,  537,  537,  537,  537,
			  537,  537,  539,  709,  539,  539,  539,  539,  539,  539,
			  539,  540,  712,  540,  540,  540,  540,  540,  540,  540,
			    0,    0,  708,  536,  541,  541,  541,  541,  541,  541,
			  541,  709,  537,  543,  543,  543,  543,  543,  543,  543,
			  712,  539,  554,  554,  558,  558,  561,  561,  562,  562,

			  540,  554,  722,  558,    0,  561,    0,  562,    0,  726,
			  727,  554,  558,    0,  561,  728,  570,  562,  570,  570,
			  570,  570,  570,  570,  570,  571,  571,  574,  574,  562,
			  722,  756,  572,  572,  571,    0,  574,  726,  727,  554,
			  558,  572,  561,  728,  571,  562,  574,  577,  577,    0,
			  572,  578,  578,    0,  583,  583,  577,  562,    0,  756,
			  578,    0,    0,  583,    0,    0,  584,  584,  757,  759,
			  578,  761,  571,  583,  574,  584,  763,  577,  572,  586,
			  586,  586,  586,  586,  586,  584,  587,    0,  587,  587,
			  587,  587,  587,  587,  647,  647,  757,  759,  578,  761, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  583,    0,  647,  763,  577,  588,  588,  588,  588,
			  588,  588,    0,  584,  589,  589,  589,  589,  589,  589,
			    0,    0,  588,  764,  789,  587,  590,  590,  590,  590,
			  590,  590,  591,  591,  591,  591,  591,  591,  593,  593,
			  593,  593,  593,  593,  594,  594,  594,  594,  594,  594,
			  588,  764,  789,  589,  595,  595,  595,  595,  595,  595,
			  598,  598,  598,  598,  598,  598,  601,  601,    0,  602,
			  602,  790,    0,  603,  603,  601,  598,  601,  602,    0,
			  602,  601,  603,    0,  603,  604,  604,    0,  603,  605,
			  605,  622,  606,  606,  604,  794,  604,    0,  605,  790,

			  605,  606,  622,  606,  598,  609,  607,  607,  605,  601,
			  608,  608,  622,    0,  797,  607,  603,  607,  606,  608,
			    0,  608,  609,  794,  610,  610,  609,  748,  611,  611,
			  622,  748,  813,  610,  608,  610,  605,  611,    0,  611,
			  612,  612,  797,  614,  614,  816,  606,  611,  748,  612,
			  609,  612,  614,    0,  614,  610,    0,  613,  613,  748,
			  813,  614,  608,  618,  618,    0,  613,    0,  613,  830,
			    0,  612,  618,  816,  618,  611,  613,  619,  619,    0,
			  623,  620,  620,  610,  621,  621,  619,  624,  619,  614,
			  620,    0,  620,  621,  623,  621,    0,  830,  620,  612,

			    0,  624,  621,  835,  613,  623,  846,  619,  734,  734,
			  734,  734,  624,    0,  637,  623,  637,  637,  637,  637,
			  637,  637,  624,  653,  653,    0,  620,  669,  669,    0,
			  621,  835,  653,  623,  846,  619,  669,    0,    0,  629,
			  624,  629,  629,  629,  629,  629,  629,  629,  630,  630,
			  630,  630,  630,  630,  630,  632,  632,  632,  632,  632,
			  632,  632,  633,    0,  633,  633,  633,  633,  633,  633,
			  633,  671,  671,  671,  671,  671,  671,  635,  629,  635,
			  635,  635,  635,  635,  635,  635,  636,    0,  636,  636,
			  636,  636,  636,  636,  636,  854,    0,    0,  688,    0,

			  641,  633,  641,  641,  641,  641,  641,  641,  641,  646,
			  646,  651,  651,  652,  652,  688,  635,    0,  646,  688,
			  651,  865,  652,  854,  646,  636,  657,  657,  658,  658,
			  651,  660,  660,    0,    0,  657,    0,  658,  694,  652,
			  660,  663,  663,  688,    0,  664,  664,  658,  827,  865,
			  663,    0,  646,    0,  664,  694,  827,  657,  651,  694,
			  663,    0,  660,  664,  670,  670,    0,  652,    0,  827,
			    0,    0,  673,  670,  673,  658,    0,  673,  673,  673,
			  673,  673,  673,  694,  827,  657,    0,    0,  663,    0,
			  660,  664,    0,    0,  670,  674,  674,  674,  674,  674,

			  674,  675,  675,  675,  675,  675,  675,  677,  677,  677,
			  677,  677,  677,  679,  679,  679,  679,  679,  679,    0,
			  683,  683,  670,  680,  680,  680,  680,  680,  680,  683,
			    0,  683,  684,  684,  674,  681,  681,  681,  681,  681,
			  681,  684,    0,  684,  685,  685,    0,    0,  686,  686,
			  683,  681,    0,  685,    0,  685,  684,  686,    0,  686,
			  687,  687,    0,    0,    0,  686,  689,  689,    0,  687,
			    0,  687,  690,  690,  681,  689,    0,  689,  683,  681,
			    0,  690,    0,  690,  684,  691,  691,    0,  692,  692,
			    0,  693,  693,  686,  691,    0,  691,  692,    0,  692,

			  693,    0,  693,    0,  695,  695,    0,  696,  696,    0,
			    0,  697,  697,  695,  692,  695,  696,  847,  696,  847,
			  697,    0,  697,  695,    0,    0,    0,    0,  847,  696,
			  697,  703,    0,  703,  703,  703,  703,  703,  703,  703,
			    0,  705,  692,  705,  705,  705,  705,  705,  705,  705,
			    0,  695,  736,  736,  736,  736,  847,  696,  697,  706,
			    0,  706,  706,  706,  706,  706,  706,  706,  744,  707,
			  703,  707,  707,  707,  707,  707,  707,  710,  710,    0,
			  705,  713,  713,  714,  714,  744,  710,  718,  718,  744,
			  713,  736,  714,  719,  719,    0,  718,    0,  706,    0,

			  714,  710,  719,  721,  721,  724,  724,    0,  707,  725,
			  725,    0,  721,  744,  724,  729,  729,    0,  725,    0,
			    0,  747,  747,    0,  729,    0,    0,    0,  714,  710,
			  747,  724,  747,    0,  729,  730,  730,  730,  730,  730,
			  730,  731,  731,  731,  731,  731,  731,  732,  732,  732,
			  732,  732,  732,  857,  857,  857,  857,  857,  733,  724,
			  733,    0,  729,  733,  733,  733,  733,  733,  733,  735,
			  735,  735,  735,  735,  735,  737,  737,  737,  737,  737,
			  737,  739,  739,    0,  740,  740,    0,  793,  793,    0,
			  739,  737,  739,  740,    0,  740,  793,    0,  739,  741,

			  741,    0,    0,    0,  743,  743,    0,  740,  741,    0,
			  741,  745,  745,  743,  737,  743,  798,  798,  741,  737,
			  745,  743,  745,  746,  746,  798,  739,  749,    0,  745,
			  863,  749,  746,  750,  746,  740,    0,  750,    0,  751,
			    0,  863,  746,  751,  758,  758,  741,    0,  749,  743,
			    0,  863,    0,  758,  750,  779,  779,  745,    0,  749,
			  751,    0,    0,    0,  779,  750,  779,  758,    0,  863,
			  746,  751,  752,  752,  752,  752,  752,  752,  752,  753,
			    0,  753,  753,  753,  753,  753,  753,  753,  760,  760,
			    0,  762,  762,  766,  766,  758,    0,  760,    0,  877,

			  762,  877,  766,    0,    0,    0,    0,  760,  762,    0,
			  877,  766,  768,  768,  768,  768,  768,  768,  753,  769,
			  769,  769,  769,  769,  769,  770,  770,  770,  770,  770,
			  770,  893,  893,  893,  893,  760,  762,    0,  877,  766,
			  771,  771,  771,  771,  771,  771,  772,  772,  772,  772,
			  772,  772,  773,  773,  773,  773,  773,  773,  769,  775,
			  775,  775,  775,  775,  775,  777,  777,    0,  778,  778,
			  893,  780,  780,    0,  777,  775,  777,  778,    0,  778,
			  780,  784,  780,  782,  782,  784,    0,  777,  783,  783,
			  780,  785,  782,    0,  782,  785,    0,  783,  775,  783,

			  778,  786,  784,  775,  787,  786,    0,    0,  787,  886,
			  795,  795,  785,  784,    0,  777,    0,    0,  780,  795,
			  783,    0,  786,  785,    0,  787,  886,    0,  778,  795,
			  886,    0,    0,  786,    0,  788,  787,  788,  788,  788,
			  788,  788,  788,  788,  791,  791,  832,  832,  783,    0,
			    0,    0,    0,  791,  886,  832,    0,  795,  799,  799,
			  799,  799,  799,  799,  801,  801,  801,  801,  801,  801,
			    0,    0,    0,  802,  788,  802,  791,    0,  802,  802,
			  802,  802,  802,  802,  803,  803,  803,  803,  803,  803,
			  805,  805,    0,    0,  806,  806,    0,  799,    0,  805, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  805,    0,  806,  791,  806,  864,  807,  807,  805,
			  808,  808,  802,  815,  815,    0,  807,  864,  807,  808,
			    0,  808,  815,  817,  817,  823,  823,  864,    0,    0,
			  806,    0,  817,    0,  823,    0,  823,  805,  807,  820,
			  820,  820,  820,  820,  820,  864,  808,  824,  824,  815,
			    0,  825,  825,    0,  817,  829,  824,  823,  824,  806,
			  825,    0,  825,  826,  826,  828,  807,    0,  829,    0,
			  834,  834,  826,  828,  826,  808,  829,    0,  815,  834,
			    0,    0,  817,    0,    0,  823,  828,    0,    0,  829,
			    0,  826,  836,  836,  836,  836,  836,  836,    0,    0,

			    0,  828,    0,    0,  829,  837,  837,  837,  837,  837,
			  837,  839,  839,  839,  839,  839,  839,  840,  840,  826,
			  841,  841,  842,  844,  843,    0,  840,    0,  840,  841,
			  842,  841,  843,    0,    0,    0,  844,  849,  849,  841,
			  850,  850,    0,  842,  844,  843,  849,    0,  849,  850,
			    0,  850,    0,  840,    0,  872,  872,  844,  842,    0,
			  843,    0,    0,    0,  872,  849,  872,  841,  848,    0,
			  848,  848,  844,  848,  848,  848,  848,  848,  848,    0,
			    0,    0,  840,  856,  856,  856,  856,  856,  856,    0,
			    0,    0,    0,  849,  859,  859,  859,  859,  859,  859,

			  861,  861,  861,  861,  861,  861,  862,  862,  866,  866,
			  866,  866,  866,  866,    0,  862,    0,  862,  867,  867,
			  867,  867,  867,  867,    0,  862,  868,  868,  868,  868,
			  868,  868,  869,  869,  869,  869,  869,  869,  871,  873,
			  871,  871,    0,  871,  871,  871,  871,  871,  871,    0,
			  873,  874,  859,  862,  876,  876,  876,  876,  876,  876,
			  873,    0,  874,  878,  878,  878,  878,  878,  878,    0,
			    0,    0,  874,  883,  883,  883,  883,  883,  873,  881,
			  881,  881,  881,  881,  881,    0,    0,    0,    0,    0,
			  874,  882,  882,  882,  882,  882,  882,  885,  887,  885,

			    0,    0,  885,  885,  885,  885,  885,  885,  888,  888,
			  888,  888,  888,  888,  890,  887,  891,    0,    0,  887,
			  889,  889,  889,  889,  889,  889,    0,    0,    0,    0,
			    0,  890,    0,  891,    0,  890,    0,  891,    0,    0,
			    0,    0,    0,  887,  892,  892,  892,  892,  892,  892,
			  896,  896,  896,  896,  896,  896,    0,    0,    0,  890,
			    0,  891,  897,  897,  897,  897,  897,  897,  898,  898,
			  898,  898,  898,  898,  900,  900,  900,  900,  900,  900,
			  901,    0,  901,    0,    0,  901,  901,  901,  901,  901,
			  901,  902,  902,  902,  902,  902,  902,  903,  903,  903,

			  903,  903,  903,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,    0,    0,    0,    0,    0,    0,    0,  901,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  907,  907,    0,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  907,  907,  907,  907,    0,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  908,  908,    0,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  909,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  910,  910,  910,  910,    0,  910,  910,  910,  910,
			  910,    0,    0,    0,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  911,  911,    0,  911,    0,  911,  911,

			  911,    0,    0,  911,  911,  911,  911,  911,    0,    0,
			    0,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  912,  912,    0,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  913,  913,    0,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,    0,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,

			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  916,    0,
			  916,    0,    0,    0,    0,  916,    0,  916,  916,  916,
			    0,    0,  916,  916,  916,  916,  916,    0,    0,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  917,
			  917,    0,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,

			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  919,  919,  919,  919,    0,    0,  919,
			  919,  919,  919,  919,  919,    0,    0,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  920,    0,    0,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,    0,
			    0,    0,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  922,  922,  922,  922,  922,  922,  922,  922,  922,

			    0,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  924,  924,  924,    0,    0,
			  924,  924,  924,  924,  924,    0,    0,    0,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  925,  925,  925,
			    0,    0,  925,  925,  925,  925,  925,    0,    0,    0,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  926, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  926,  926,  926,    0,    0,  926,  926,  926,  926,  926,
			  926,    0,    0,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  928,  928,  928,  928,  928,    0,
			    0,    0,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  929,    0,  929,    0,    0,    0,    0,  929,    0,
			  929,  929,  929,    0,    0,  929,  929,  929,  929,  929,
			    0,    0,    0,  929,  929,  929,  929,  929,  929,  929,

			  929,  929,  930,  930,  930,    0,    0,  930,  930,  930,
			  930,  930,  930,  930,  930,    0,    0,  930,  930,  930,
			  930,  930,    0,    0,    0,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  931,  931,  931,  931,  931,    0,
			    0,    0,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  932,  932,  932,    0,    0,  932,  932,  932,  932,
			  932,    0,    0,    0,  932,  932,  932,  932,  932,  932,
			  932,  932,  932,  933,    0,  933,    0,    0,    0,    0,
			  933,    0,  933,  933,  933,    0,    0,  933,  933,  933,
			  933,  933,    0,    0,  933,  933,  933,  933,  933,  933,

			  933,  933,  933,  933,  934,  934,  934,    0,    0,  934,
			  934,  934,  934,  934,    0,    0,    0,  934,  934,  934,
			  934,  934,  934,  934,  934,  934,  935,  935,  935,  935,
			  935,    0,    0,    0,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  936,  936,  936,    0,    0,  936,  936,
			  936,  936,  936,    0,    0,    0,  936,  936,  936,  936,
			  936,  936,  936,  936,  936,  937,  937,  937,    0,    0,
			  937,  937,  937,  937,  937,    0,    0,    0,  937,  937,
			  937,  937,  937,  937,  937,  937,  937,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,

			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904, yy_Dummy>>,
			1, 380, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0, 1605,
			 5287,   99, 1598, 1563, 1581, 5287,   86, 5287, 5287, 5287,
			 5287, 5287, 1571,   89, 1567,   99,  266, 5287, 5287, 1524,
			 5287, 1517, 5287,   88,   90,  108, 1514,  255,  266,   99,
			  102,  109,  257,  265,  322,  100,  280,  267,  277,   88,
			 5287, 5287, 1480,  401,  312,  326,  480,  251,  322,  104,
			  336,  274,  265,  318,  321,  520,  289,  249, 1507, 5287,
			 5287, 1510,  156, 5287,   99,  401,  309,  406,  312,  409,
			  517, 5287,  518,  545, 5287,  315, 1508,  562,  576, 5287,
			  309, 1496, 5287, 1468, 5287, 1456,    0,  584, 1457, 1438,

			  590, 5287,  562,  600,  607,  642,  614,  654, 5287, 5287,
			  559,    0,  663,  666,  669,  682,  697,  710,  703,  724,
			  739,  742,  624,  745,  757,  770,  776,  783,  788,  795,
			 1355,  817,  820,  837,  901,  913,  916,  946,  823,  929,
			  963,  976,  988, 1411,  647,  348, 1367, 5287,  586, 1409,
			    0, 1054, 1387,  313,  388,  395,  349,  627,  700,  867,
			  935,  685,  394,  872,  463,  527,  991, 1002,  540,  842,
			 1007, 1013,  577,  610,  966, 1026, 1360,  630,  643,  672,
			 1326, 1039, 1032, 1050,  857,  684,  889,  699, 1061,  719,
			  734, 1077, 1019,  763,  753, 1073, 1123, 1102,  797, 1127,

			 1130,  817, 1133,  334, 1137, 5287, 1365, 5287,  739, 5287,
			 5287, 1091, 1009, 1099, 1104, 1134,  823, 5287, 1316,  858,
			  788, 1306,  838, 1306, 5287,  983, 1193, 5287, 1355, 1198,
			  157, 1253,  172, 5287, 5287, 1243, 1207, 1242, 1240, 1226,
			 1225, 1082, 5287, 1328, 1218, 1224, 1215,  526, 1334, 1345,
			 1373, 1355, 1155, 1395,    0,    0, 1192, 1186, 1385, 1382,
			 1189, 1406, 1410, 1413, 1429, 1425, 1442, 1454, 1457, 1453,
			 1470, 1486, 1482, 1503, 1489, 1507, 1523, 5287, 1526, 1546,
			 1576, 1588, 1556, 1599, 1606, 1616, 1631, 1634, 1530, 1650,
			 1637, 1653, 1667, 1670, 1684, 1172, 1695,  465, 1709, 5287,

			  711, 1153,  892,  906,    0, 1092, 1099,  278, 1365, 1721,
			  885, 1599,  916, 1723,  940, 1113, 1673, 1725, 1132, 1183,
			 1313, 1727, 1738, 1742, 1336, 1093, 1744, 1754, 1756, 1364,
			 1366, 1408, 1086, 1807, 1768, 1771, 1424, 1785,    0, 1186,
			 1413, 1428, 1788, 1798, 1426, 1445, 1818, 1824, 1486, 1487,
			 1043, 1828, 1831, 1838,    0, 1565,  616, 1841, 1795,  419,
			 1812, 1076, 1824, 1830, 1842,  546, 5287, 1012, 1043, 1864,
			 5287, 1153, 1206, 1027, 5287, 5287, 1913, 5287, 5287, 5287,
			 5287, 1525, 1919, 1925, 1931,  945,  952, 1937, 1943, 1965,
			 1949, 1971, 1988, 1997, 2003, 2009,  978,  664,    0,  924,

			 2018, 2022, 2025, 2038, 2041, 1859, 2053, 2058, 2073, 2093,
			 1844, 2096, 2070, 2100, 2112, 2116, 2128, 2113, 2145, 2172,
			 2184, 2196, 2208, 2223, 2239, 1898, 2132, 2225, 2156, 2160,
			 2252, 2264, 2271,  310, 2288, 2305, 2296, 1656, 2316, 2326,
			  760,    0, 1498,  642, 2335, 2258, 2346, 2356, 2364, 1614,
			 2349, 1654, 1661, 2373, 2375,    0, 1674, 1697, 1855, 2223,
			 2386, 1712, 1718, 2389, 1825, 1820, 1836, 2396, 2405, 2410,
			 1853, 2412, 1928, 1929, 2429, 2431,    0,    0, 1980, 2416,
			 1927, 2017, 2179, 2441, 2426,  928, 2448, 5287, 2461, 2472,
			 2478, 2487,  896, 2493, 2501, 2510, 2516, 2522, 2538,   81,

			 2550, 2562, 2383,  678,    0,    0, 2538, 2550, 2571, 2574,
			 2577, 2593, 2596, 2608, 2613,  879, 2625, 2620, 2640, 2645,
			 2652, 2658, 2680, 2690, 2751, 2709, 2654, 2718, 2724, 2731,
			 2763, 2695,  563, 1649, 1700, 2808, 2818, 2827, 5287, 2836,
			 2845, 2856, 5287, 2865, 5287,  804,  808,    0,  788, 2780,
			 2451, 2766, 2788, 2018, 2877, 2014, 2026, 2744, 2879, 2060,
			 2631, 2881, 2883,    0, 2116, 2454, 2126, 2137,    0, 1003,
			 2900, 2910, 2917, 2219, 2912, 2210, 2229, 2932, 2936, 2236,
			 2268, 2296, 2418, 2939, 2951,  756, 2961, 2970, 2988, 2996,
			 3008, 3014,  751, 3020, 3026, 3036, 2697, 5287, 3042,    0,

			  761, 3051, 3054, 3058, 3070, 3074, 3077, 3091, 3095, 3076,
			 3109, 3113, 3125, 3142, 3128, 5287, 1008,  729, 3148, 3162,
			 3166, 3169, 3062, 3165, 3172,  955, 5287, 5287, 2090, 3223,
			 3230, 5287, 3237, 3246, 5287, 3261, 3270, 3198, 2517,  720,
			 1426, 3284,    0, 2800, 2519,    0, 3294, 2979, 2529, 2547,
			    0, 3296, 3298, 3208, 2560, 2601, 2623, 3311, 3313, 2616,
			 3316, 2629, 2662, 3326, 3330,    0, 2693, 2760, 2760, 3212,
			 3349, 3253,  632, 3359, 3377, 3383, 2760, 3389,  580, 3395,
			 3405, 3417,  566, 3405, 3417, 3429, 3433, 3445, 3269, 3451,
			 3457, 3470, 3473, 3476, 3309, 3489, 3492, 3496,  565,  494,

			  492,  490, 2590, 3515, 2759, 3525, 3543, 3553, 2799, 2814,
			 3562,    0, 2830, 3566, 3568,    0,    0,    0, 3572, 3578,
			    0, 3588, 2861,    0, 3590, 3594, 2875, 2873, 2881, 3600,
			 3617, 3623, 3629, 3645, 3190, 3651, 3539, 3657,    0, 3666,
			 3669, 3684, 5287, 3689, 3539, 3696, 3708, 3606, 3098, 3698,
			 3704, 3710, 3754, 3763, 5287,  467, 2899, 2930, 3729, 2935,
			 3773, 2939, 3776, 2943, 2989,    0, 3778,  373, 3794, 3801,
			 3807, 3822, 3828, 3834, 5287, 3841,    0, 3850, 3853, 3740,
			 3856, 5287, 3868, 3873, 3852, 3862, 3872, 3875, 3919, 2987,
			 3024, 3929,    0, 3672, 3061, 3895,    0, 3067, 3701, 3940,

			  370, 3946, 3960, 3966, 1075, 3975, 3979, 3992, 3995,  777,
			 5287,  993,  396, 3098,  742, 3998, 3099, 4008,  809, 1883,
			 4021,    0,  291, 4010, 4032, 4036, 4048, 3319, 4036, 4039,
			 3122,    0, 3931,    0, 4055, 3160, 4074, 4087, 1089, 4093,
			 4102, 4105, 4093, 4095, 4107,  814, 3172, 3504, 4155, 4122,
			 4125,  309,  274, 1510, 3252,    0, 4165, 3635, 5287, 4176,
			   99, 4182, 4191, 3701, 3977, 3287, 4190, 4200, 4208, 4214,
			  108, 4225, 4140, 4210, 4222,    0, 4236, 3786, 4245,  139,
			  126, 4261, 4273, 4255, 5287, 4284, 3880, 4269, 4290, 4302,
			 4285, 4287, 4326, 3818, 5287, 5287, 4332, 4344, 4350, 5287,

			 4356, 4367, 4373, 4379, 5287, 4419, 4451, 4483, 4515, 4538,
			 4560, 4587, 4619, 4651, 4683, 4715, 4746, 4778, 4810, 4833,
			 4858, 4379, 4890, 4922, 4944, 4966, 4989, 5021, 5038, 5069,
			 5101, 5118, 5140, 5171, 5193, 5210, 5232, 5254, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  904,    1,  905,  905,  906,  906,  904,    7,  904,
			  904,  904,  904,  904,  907,  904,  908,  904,  904,  904,
			  904,  904,  904,  904,  909,  904,  904,  904,  904,  904,
			  904,  904,  904,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  911,
			  904,  904,  912,  904,   53,   53,  904,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,  904,  904,
			  904,  913,  904,  904,  904,  913,  913,  913,  913,  913,
			  914,  904,  915,  914,  904,  916,  904,  916,  916,  904,
			  904,  904,  904,  907,  904,  917,  917,  917,  918,  904,

			  904,  904,  919,  904,  904,  904,  904,  904,  904,  904,
			  910,  920,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  904,   44,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  911,  911,  911,  912,  904,  904,  904,
			  921,   56,  904,  151,  151,  151,  904,   56,   56,   56,
			   56,   56,  151,   56,  151,  151,   56,   56,  151,  151,
			   56,   56,  151,  151,   56,   56,  151,   56,  151,  151,
			  151,   56,   56,   56,   56,  151,   56,  151,   56,  151,
			  151,   56,   56,  151,  151,   56,   56,  151,  151,   56,

			   56,  151,   56,  151,   56,  904,  913,  904,  904,  904,
			  904,  913,  913,  913,  913,  913,  914,  904,  922,  914,
			  915,  923,  915,  922,  904,  916,  916,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  909,  904,  904,  904,
			  904,  904,  904,  904,  924,  925,  904,  920,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  904,
			  910,  910,  910,  910,  910,  910,  910,  904,  910,  910,
			  910,  910,  134,  134,  134,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  904,  911,  911,  911,  904,

			  926,  904,  151,  151,  151,  904,  904,  904,   56,   56,
			   56,  151,  151,   56,  151,  151,   56,   56,  151,  151,
			  151,   56,   56,   56,  151,  151,   56,   56,  904,  151,
			  151,  151,  151,  151,   56,   56,  151,   56,  151,   56,
			  151,  151,   56,   56,  151,  151,   56,   56,  151,  151,
			  151,   56,   56,   56,  151,   56,  151,   56,  913,  913,
			  913,  913,  913,  913,  913,  922,  904,  923,  927,  927,
			  904,  927,  927,  927,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  924,  925,  928,  920,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  904,  910,  910,  910,  910,  910,  910,  134,  131,  131,
			  131,  904,  925,  419,  419,  910,  910,  904,  910,  910,
			  910,  910,  910,  929,  911,  911,  911,  911,  911,  911,
			  904,  930,  151,  151,  904,   56,   56,  151,  151,  151,
			   56,  151,  151,   56,   56,  151,  151,  151,   56,   56,
			   56,  151,  151,   56,  151,  151,  151,  925,   56,   56,
			  151,   56,  151,  151,   56,   56,  151,  151,   56,   56,
			  151,  151,  151,   56,   56,  151,   56,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,

			  904,  904,  904,  904,  931,  932,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  904,  910,  910,  910,  910,
			  910,  910,  904,  925,  419,  524,  904,  910,  910,  910,
			  910,  924,  904,  933,  929,  911,  911,  911,  904,  911,
			  911,  911,  904,  911,  904,  904,  904,  151,  151,  904,
			   56,   56,  925,  151,   56,  151,  151,   56,   56,  151,
			  151,   56,   56,  151,  151,   56,  151,  151,  151,  925,
			  925,   56,   56,  151,   56,  151,  151,   56,   56,  151,
			  151,  151,  151,   56,   56,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  934,

			  932,  910,  910,  910,  910,  910,  910,  910,  910,  904,
			  910,  910,  910,  910,  910,  904,  925,  904,  910,  910,
			  910,  910,  904,  924,  924,  933,  904,  904,  911,  911,
			  911,  904,  911,  911,  904,  911,  911,  904,  151,  904,
			  925,  925,  151,   56,  151,  151,   56,   56,  151,  151,
			  151,   56,   56,   56,  151,  151,  151,   56,   56,  151,
			   56,  151,  151,   56,   56,  151,  151,  151,  151,   56,
			   56,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  934,  910,  910,  910,  910,  910,  904,  910,
			  910,  910,  910,  910,  904,  910,  910,  910,  904,  904,

			  924,  924,  911,  911,  911,  911,  911,  904,  151,  151,
			   56,  151,  151,   56,   56,  151,  151,  151,   56,   56,
			  151,   56,  151,  151,   56,   56,  151,  151,  151,   56,
			  904,  904,  904,  904,  904,  904,  904,  904,  935,  910,
			  910,  910,  904,  910,  904,  910,  910,  910,  904,  904,
			  931,  931,  911,  911,  904,  904,  151,  151,   56,  151,
			   56,  151,   56,  151,  151,  151,   56,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  936,  910,  910,  910,
			  910,  904,  910,  910,  904,  904,  934,  934,  911,  151,
			  151,   56,  151,   56,  151,   56,  151,  151,   56,  904,

			  904,  904,  904,  904,  936,  910,  910,  910,  910,  904,
			  904,  934,  934,  151,  151,   56,  151,   56,  151,  904,
			  904,  937,  904,  910,  910,  910,  910,  904,  904,  934,
			  151,  151,   56,  151,   56,  151,  904,  904,  937,  904,
			  910,  910,  904,  904,  934,  151,  151,  904,  904,  910,
			  910,  904,  904,  934,  151,  151,  904,  904,  904,  904,
			  904,  904,  910,  904,  904,  151,  904,  904,  904,  904,
			  904,  904,  910,  904,  904,  151,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,

			  904,  904,  904,  904,    0,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904, yy_Dummy>>)
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
			   16,   16,   16,   16,   17,   18,   16,   16,   16,   16,
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
			   10,   29,   19,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   87,   95,   95,   95,   95,   21,
			   30,   22,    9,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   23,   20,
			   24,  119,  120,  121,  122,  119,  119,  119,  119,  119,
			  102,  105,  132,  102,  132,  132,   75,  132,  132,   77,
			    1,    2,   27,  115,  114,  129,  129,  129,    3,   32,

			  113,   31,   99,    0,    0,  107,    0,  107,   26,   25,
			   95,    0,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   39,
			    0,   95,   94,   94,   86,   94,   94,   95,   95,   95,
			   95,   95,   95,    0,    0,    0,    0,  106,    0,    0,
			    0,   98,    0,   98,   98,   98,    0,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   39,   98,   39,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,  101,  119,  121,  120,  117,
			  116,  118,  119,  119,  119,  119,  102,  105,    0,  102,
			    0,    0,    0,  103,  104,    0,    0,   77,   75,    0,
			   74,    0,   73,  129,  123,  129,  129,  129,  129,  129,
			  129,    4,   33,  113,    0,    0,    0,    0,    0,  109,
			    0,  107,    0,    0,    0,    0,    0,    0,   95,   95,
			   38,   95,   95,   95,   95,   95,   95,   95,   95,    0,
			   95,   95,   95,   95,   41,   95,   95,   93,   87,   87,
			   87,   87,   94,   95,   94,   94,   94,   95,   95,   95,
			   95,   95,   95,   40,   95,    0,    0,    0,    0,   97,

			  100,    0,   98,   98,   38,    0,    0,    0,   98,   98,
			   38,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,    0,   98,
			   98,   98,   70,   70,   98,   98,   98,   98,   41,   41,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   40,   40,   98,   98,  119,  119,
			  119,  119,  119,  119,  119,    0,  103,  104,    0,    0,
			   76,   74,   73,   77,  127,  130,  130,  128,  124,  125,
			  126,  113,    0,  113,    0,    0,    0,    0,  109,    0,
			    0,    0,  112,  107,    0,    0,    0,    0,    0,   96,

			   95,   95,   95,   95,   95,   37,   95,   95,   95,   95,
			    0,   95,   95,   95,   95,   95,   95,   86,   95,   95,
			   95,    0,    0,   86,   86,   86,   36,    0,   43,   95,
			   95,   95,   95,   72,    0,    0,    0,    0,    0,    0,
			    0,   61,   98,   98,    0,   98,   98,   66,   66,   98,
			   98,   98,   98,   98,   98,   37,   98,   98,   37,   98,
			   98,   98,   98,   98,   98,   98,   98,    0,   98,   98,
			   98,   98,   98,   98,   98,   98,   36,   43,   36,   43,
			   98,   98,   98,   98,   98,   98,   98,  104,  113,    0,
			    0,    0,  108,  109,    0,  110,    0,  112,    0,    0,

			    0,  107,   83,    0,    0,    0,   58,   95,   95,   95,
			   95,   95,   95,   44,   95,    0,   95,   95,   35,   95,
			   95,   95,    0,    0,   95,   95,    0,   95,   95,   95,
			   95,    0,   72,   72,    0,    0,    0,    0,   71,    0,
			    0,    0,   69,    0,   68,    0,    0,   58,   98,    0,
			   58,   98,    0,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   44,   98,   44,   98,   98,   35,   70,
			   70,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  113,    0,    0,  109,  110,
			    0,    0,  112,    0,    0,    0,    0,   83,    0,    0,

			    0,   95,   59,   95,   60,   95,   95,   46,   95,    0,
			   95,   95,   95,   95,   95,   86,   86,    0,   52,   95,
			   95,   95,    0,    0,    0,    0,   63,   62,    0,    0,
			    0,   67,    0,    0,   65,    0,    0,    0,   98,    0,
			   66,   66,   59,   59,   98,   60,   98,   60,   98,   98,
			   46,   98,   98,   46,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   52,   98,   98,   98,   52,
			   98,    0,   99,    0,  110,    0,  113,    0,   85,    0,
			    0,  111,    0,   95,   95,   57,   95,   45,    0,   42,
			   56,   34,   95,   50,    0,   95,   95,   95,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,   98,   98,
			   98,   57,   98,   57,   98,   45,   42,   56,   42,   56,
			   34,   34,   98,   50,   98,   50,   98,   98,   98,   98,
			    0,  110,    0,    0,    0,    0,   82,  111,    0,   95,
			   95,   95,   90,   95,    0,   95,   95,   53,    0,    0,
			    0,    0,    0,    0,   64,  100,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   53,   98,  112,    0,  112,
			    0,    0,    0,    0,   82,  111,    0,   95,   95,   47,
			   95,   89,   51,   95,    0,    0,    0,    0,    0,   98,
			   98,   98,   47,   47,   98,   98,   51,   98,   51,  112,

			   84,    0,   82,  111,    0,   95,   95,   95,   95,   88,
			   88,   88,   88,   98,   98,   98,   98,   98,   98,    0,
			    0,    0,    0,   95,   49,   48,   95,    0,    0,    0,
			   98,   49,   49,   48,   48,   98,    0,    0,    0,    0,
			   95,   95,    0,    0,    0,   98,   98,   81,   78,   95,
			   54,    0,    0,    0,   98,   54,    0,    0,   81,    0,
			    0,    0,   95,    0,    0,   98,    0,    0,   78,    0,
			    0,   78,   55,    0,    0,   55,    0,   80,    0,    0,
			    0,    0,    0,    0,   80,   78,    0,    0,    0,    0,
			    0,    0,    0,   79,   91,   92,    0,    0,    0,   79,

			    0,   79,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5287
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 904
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 905
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
