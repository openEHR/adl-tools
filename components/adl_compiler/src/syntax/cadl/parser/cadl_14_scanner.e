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
--|#line 86 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 86")
end
-- Ignore separators
else
--|#line 87 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 87")
end
in_lineno := in_lineno + text_count
end
else
--|#line 92 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 92")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 93 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 93")
end
in_lineno := in_lineno + 1
else
--|#line 97 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 97")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 98 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 98")
end
last_token := Plus_code
else
--|#line 99 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 99")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 100 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 100")
end
last_token := Slash_code
else
--|#line 101 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 101")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 102 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 102")
end
last_token := Equal_code
else
--|#line 103 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 103")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 104 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 104")
end
last_token := Semicolon_code
else
--|#line 105 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 105")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 106 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 106")
end
last_token := Colon_code
else
--|#line 107 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 107")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 108 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 108")
end
last_token := Left_parenthesis_code
else
--|#line 109 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 109")
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
--|#line 110 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 110")
end
last_token := Dollar_code
else
--|#line 112 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 112")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
--|#line 114 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 114")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 116 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 116")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 117 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 117")
end
last_token := Right_bracket_code
else
--|#line 119 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 119")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 24 then
--|#line 120 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 120")
end
last_token := SYM_END_CBLOCK
else
--|#line 122 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 122")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 123 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 123")
end
last_token := SYM_LE
else
--|#line 124 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 124")
end
last_token := SYM_NE
end
else
if yy_act = 28 then
--|#line 126 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 126")
end
last_token := SYM_LT
else
--|#line 127 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 127")
end
last_token := SYM_GT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 129 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 129")
end
last_token := SYM_MODULO
else
--|#line 130 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 130")
end
last_token := SYM_DIV
end
else
if yy_act = 32 then
--|#line 132 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 132")
end
last_token := SYM_ELLIPSIS
else
--|#line 133 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 133")
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
--|#line 137 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 137")
end
last_token := SYM_MATCHES
else
--|#line 139 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 139")
end
last_token := SYM_MATCHES
end
else
--|#line 143 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 143")
end
last_token := SYM_THEN
end
else
if yy_act = 37 then
--|#line 145 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 145")
end
last_token := SYM_ELSE
else
--|#line 147 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 147")
end
last_token := SYM_AND
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 149 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 149")
end
last_token := SYM_OR
else
--|#line 151 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 151")
end
last_token := SYM_XOR
end
else
if yy_act = 41 then
--|#line 153 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 153")
end
last_token := SYM_NOT
else
--|#line 155 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 155")
end
last_token := SYM_IMPLIES
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 157 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 157")
end
last_token := SYM_TRUE
else
--|#line 159 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 159")
end
last_token := SYM_FALSE
end
else
if yy_act = 45 then
--|#line 161 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 161")
end
last_token := SYM_FORALL
else
--|#line 163 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 163")
end
last_token := SYM_EXISTS
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 167 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 167")
end
last_token := SYM_EXISTENCE
else
--|#line 169 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 169")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 49 then
--|#line 171 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 171")
end
last_token := SYM_CARDINALITY
else
--|#line 173 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 173")
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
--|#line 175 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 175")
end
last_token := SYM_UNORDERED
else
--|#line 177 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 177")
end
last_token := SYM_UNIQUE
end
else
if yy_act = 53 then
--|#line 179 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 179")
end
last_token := SYM_USE_NODE
else
--|#line 181 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 181")
end
last_token := SYM_USE_ARCHETYPE
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 183 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 183")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 185 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 185")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 57 then
--|#line 187 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 187")
end
last_token := SYM_EXCLUDE
else
--|#line 189 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 189")
end
last_token := SYM_AFTER
end
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
--|#line 191 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 191")
end
last_token := SYM_BEFORE
else
--|#line 193 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 193")
end
last_token := SYM_CLOSED
end
else
if yy_act = 61 then
--|#line 196 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 196")
end

		last_token := V_ROOT_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_converted (code)
		converted_codes.put (last_string_value, code)
	
else
--|#line 202 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 202")
end

		last_token := V_ID_CODE
		code := text_substring (2, text_count - 1)
		last_string_value := adl_14_id_code_converted (code)
		converted_codes.put (last_string_value, code)
	
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
		last_string_value := adl_14_id_code_converted (text)
	
else
--|#line 214 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 214")
end

		last_token := V_VALUE_SET_REF
		code := text_substring (2, text_count - 1)
		reformatted_code := adl_14_code_renumbered (code) 
		last_string_value := Local_terminology_id + "::" + reformatted_code
		converted_codes.put (reformatted_code, code)
	
end
else
if yy_act = 65 then
--|#line 233 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 233")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_VALUE_SET_DEF)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 241 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 241")
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
--|#line 248 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 248")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 255 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 255")
end
in_lineno := in_lineno + text_count
end
else
--|#line 258 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 258")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 70 then
--|#line 260 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 260")
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
--|#line 283 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 283")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
--|#line 290 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 291 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 291")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 292 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 292")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 299 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 299")
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
--|#line 300 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 300")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 307 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 307")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 308 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 308")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 315 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 315")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 316 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 316")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 323 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 323")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 82 then
--|#line 335 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 335")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 345 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 345")
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
--|#line 350 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 350")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 360 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 360")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 86 then
--|#line 366 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 366")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 377 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 377")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 386 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 386")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 400 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 400")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 90 then
--|#line 407 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 407")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 413 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 413")
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
--|#line 419 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 419")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 423 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 423")
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
--|#line 465 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 465")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 471 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 471")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 477 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 477")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 483 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 483")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 98 then
--|#line 490 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 490")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text
		
else
--|#line 496 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 496")
end
		-- matches an absolute path string with segments of form "/attr_name/attr_name/..." or "/attr_name[code]/.."
			last_token := V_ABS_PATH
			last_string_value := adl_14_path_converted (text)
		
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
--|#line 502 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 502")
end
		-- matches a relative path string with segments of form "attr_name/attr_name/..." or "attr_name[code]/.."
			last_token := V_REL_PATH
			last_string_value := adl_14_path_converted (text)
		
else
--|#line 508 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 508")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 515 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 515")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 103 then
--|#line 519 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 519")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 523 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 523")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 527 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 527")
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
--|#line 539 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 539")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 107 then
--|#line 546 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 546")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 551 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 551")
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
--|#line 566 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 566")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 567 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 567")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 111 then
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
			
end
end
else
if yy_act <= 114 then
if yy_act = 113 then
--|#line 573 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 573")
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
--|#line 593 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 593")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 598 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 598")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 606 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 606")
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
--|#line 608 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 608")
end
in_buffer.append_character ('"')
else
--|#line 610 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 610")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 614 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 614")
end
in_buffer.append_string (text)
else
--|#line 616 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 616")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 621 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 621")
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
--|#line 632 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 632")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 641 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 641")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 643 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 643")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 644 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 644")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 645 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 645")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 646 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 646")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 647 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 647")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 649 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 649")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 650 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 650")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 654 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 654")
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
			create an_array.make_filled (0, 0, 6977)
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

			   95,   75,   95,   95,  105,  188,  106,  106,  106,  106,
			  106,  106,  109,  200,  110,  560,  111,  111,  111,  111,
			  111,  111,  116,  116,  187,  116,  187,  187,  196,   84,
			   85,   84,   85,  203,   95,  233,   95,   95,  116,  116,
			  140,  116,  792,   76,  102,  117,  118,  791,   76,   94,
			  201,  202,  189,   94,  562,  112,  235,  235,  235,  235,
			  235,  235,  241,  209,  197,  198,  209,  774,  140,  197,
			  198,  234,  211,  775,  117,  211,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   90,   86,
			   86,   86,   86,   86,   86,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   86,   86,
			   91,   86,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  109,  186,  110,
			  581,  113,  113,  113,  113,  113,  113,  204,  116,  116,
			  204,  116,  116,  116,  196,  116,  213,  430,  116,  116,

			  399,  116,  186,  399,  187,  186,  187,  187,  116,  116,
			  154,  116,  118,  154,  116,  116,  118,  116,  155,  583,
			  112,  119,  118,  769,  122,  120,  123,  121,  186,  768,
			  197,  198,  118,  186,  326,  124,  116,  116,  118,  116,
			  206,  744,  133,  116,  116,  125,  116,  116,  116,  119,
			  116,  214,  122,  120,  123,  121,  126,  191,  116,  116,
			  118,  116,  200,  124,  127,  116,  116,  118,  116,  204,
			  133,  118,  204,  125,  116,  116,  128,  116,  129,  190,
			  190,  190,  118,  193,  193,  126,  645,  134,  228,  118,
			  228,  228,  127,  243,  186,  135,  130,  131,  118,  201,

			  202,  244,  132,  524,  128,  213,  129,  191,  136,  734,
			  192,  192,  192,  154,  148,  134,  154,  116,  116,  726,
			  116,  155,  206,  135,  130,  131,  116,  116,  156,  116,
			  132,  356,  356,  356,  356,  356,  136,  116,  116,  328,
			  116,  118,  148,  286,  112,  116,  116,  156,  116,  516,
			  118,  735,  137,  138,  138,  138,  138,  138,  138,  154,
			  214,  118,  154,  203,  161,  146,  149,  155,  139,  118,
			  147,  194,  194,  194,  156,  140,  201,  202,  208,  287,
			  144,  208,  141,  404,  142,  156,  143,  696,  145,  154,
			  209,  163,  154,  146,  288,  149,  139,  155,  147,  197,

			  198,  211,  186,  140,  156,  658,  231,  657,  144,  154,
			  161,  656,  154,  142,  655,  143,  145,  155,  645,  163,
			  332,  331,  158,  332,  156,  641,  159,  154,  160,  232,
			  154,  206,  233,  154,  231,  155,  154,  164,  520,  520,
			  161,  155,  156,  243,  154,  408,  165,  154,  156,  243,
			  158,  244,  155,  244,  159,  154,  160,  244,  154,  156,
			  161,  168,  162,  155,  166,  164,  227,  227,  154,  227,
			  156,  154,  156,  169,  165,  167,  155,  605,  161,  170,
			  193,  193,  242,  156,  161,  186,  728,  729,  441,  168,
			  343,  734,  166,  171,  172,  161,  174,  154,  432,  173,

			  154,  169,  645,  664,  167,  155,  161,  170,  154,  599,
			  154,  154,  156,  154,  333,  331,  155,  333,  155,  161,
			  645,  171,  172,  156,  174,  156,  599,  173,  769,  186,
			  599,  154,  154,  736,  154,  154,  558,  175,  176,  155,
			  155,  154,  666,  535,  154,  178,  156,  156,  161,  155,
			  109,  177,  659,  179,  599,  208,  156,  485,  208,  161,
			  286,  161,  190,  190,  190,  175,  176,  209,  210,  361,
			  180,  447,  182,  178,  480,  181,  434,  480,  211,  177,
			  331,  179,  161,  161,  240,  240,  240,  240,  240,  240,
			  183,  660,  161,  116,  116,  331,  116,  327,  180,  553,

			  182,  728,  729,  181,  407,  399,  242,  243,  206,  319,
			  320,  321,  322,  323,  361,  244,  360,  118,  348,  183,
			  216,  216,  480,  216,  809,  480,  221,  157,  157,  157,
			  157,  157,  157,  257,  342,  222,  222,  222,  222,  222,
			  222,  591,  591,  591,  591,  591,  217,  553,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  223,  230,  230,  230,  230,  230,  230,  236,  236,
			  236,  236,  236,  236,  341,  340,  224,  339,  231,  336,
			  225,  809,  226,  207,  237,  326,  116,  116,  109,  116,

			  110,  218,  238,  238,  238,  238,  238,  238,  239,  242,
			  243,  232,  186,  327,  335,  335,  231,  335,  244,  109,
			  118,  110,  237,  238,  238,  238,  238,  238,  238,  116,
			  116,  326,  116,  247,  116,  116,  117,  116,  186,  294,
			  217,  112,  242,  243,  741,  741,  741,  242,  243,  277,
			  117,  244,  117,  118,  116,  116,  244,  116,  118,  289,
			  153,  247,  112,  286,  117,  248,  265,  242,  243,  229,
			  116,  116,  553,  116,  246,  553,  244,  277,  118,  480,
			  614,  117,  480,  242,  243,  116,  116,  249,  116,  190,
			  190,  190,  244,  248,  118,  108,  228,  227,  242,  243,

			  335,  335,  246,  335,  553,  116,  116,  244,  116,  118,
			  108,  108,  108,  250,  220,  249,   99,   96,  242,  243,
			  116,  116,  207,  116,  186,  251,  809,  244,  184,  118,
			  153,  151,  640,  242,  243,  157,  157,  157,  157,  157,
			  157,  250,  244,  115,  118,  116,  116,  114,  116,  252,
			  253,  116,  116,  251,  116,  352,  254,  107,  242,  243,
			  640,  104,   99,  300,  242,  243,   97,  244,   96,  118,
			  809,  360,  809,  244,  809,  118,  372,  252,  253,  649,
			  809,  809,  255,  809,  254,  116,  116,  372,  116,  116,
			  116,  300,  116,  458,  256,  809,  649,  372,  242,  243, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  649,  809,  242,  243,  458,  116,  116,  257,  116,  118,
			  255,  244,  809,  118,  458,  372,  809,  809,  242,  243,
			  116,  116,  256,  116,  649,  116,  116,  244,  116,  118,
			  258,  809,  458,  242,  243,  259,  809,  186,  242,  243,
			  116,  116,  244,  116,  118,  809,  809,  244,  186,  118,
			  290,  290,  290,  242,  243,  809,  809,  809,  258,  809,
			  809,  809,  244,  259,  118,  116,  116,  809,  116,  747,
			  261,  809,  117,  283,  809,  260,  809,  747,  242,  243,
			  116,  116,  809,  116,  809,  262,  117,  244,  117,  118,
			  747,  809,  360,  242,  243,  263,  809,  473,  261,  809,

			  117,  283,  244,  186,  118,  747,  116,  116,  473,  116,
			  809,  264,  809,  262,  324,  324,  324,  117,  473,  242,
			  243,  137,  521,  263,  521,  325,  325,  325,  244,  809,
			  118,  116,  116,  522,  116,  208,  473,  809,  208,  264,
			  266,  242,  267,  809,  242,  243,  137,  209,  809,  809,
			  244,  273,  809,  244,  809,  118,  809,  809,  211,  268,
			  809,  523,  139,  269,  809,  809,  270,  809,  809,  117,
			  117,  278,  809,  117,  279,  271,  273,  272,  142,  651,
			  190,  190,  190,  117,  117,  117,  117,  268,  206,  809,
			  139,  269,  696,  696,  270,  696,  651,  117,  117,  278,

			  651,  809,  279,  809,  271,  117,  272,  142,  274,  274,
			  274,  274,  274,  274,  117,  117,  721,  809,  809,  117,
			  280,  117,  809,  117,  651,  809,  809,  275,  809,  809,
			  276,  809,  688,  117,  809,  809,  277,  117,  117,  117,
			  809,  809,  809,  281,  809,  117,  809,  282,  280,  688,
			  117,  117,  117,  688,  117,  275,  117,  284,  276,  117,
			  809,  117,  809,  809,  277,  761,  117,  761,  117,  809,
			  117,  281,  117,  117,  285,  282,  762,  688,  154,  809,
			  809,  154,  809,  117,  117,  284,  155,  186,  809,  809,
			  117,  242,  243,  156,  154,  809,  809,  154,  117,  809,

			  244,  117,  155,  285,  763,  117,  362,  242,  243,  156,
			  154,  809,  117,  154,  117,  809,  244,  809,  155,  117,
			  186,  117,  809,  242,  243,  156,  117,  154,  809,  161,
			  154,  809,  244,  117,  362,  155,  809,  809,  809,  291,
			  242,  243,  156,  117,  809,  161,  787,  292,  787,  244,
			  117,  157,  157,  157,  157,  157,  157,  788,  293,  809,
			  809,  161,  186,  809,  192,  192,  192,  291,  297,  157,
			  157,  157,  157,  157,  157,  292,  809,  809,  161,  157,
			  157,  157,  157,  157,  157,  789,  293,  154,  809,  809,
			  154,  809,  809,  299,  809,  155,  297,  194,  194,  194,

			  242,  243,  156,  295,  296,  296,  296,  296,  296,  244,
			  157,  157,  157,  157,  157,  157,  809,  809,  307,  809,
			  809,  299,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  186,  809,  301,  298,  161,  190,
			  190,  190,  302,  157,  157,  157,  157,  157,  157,  303,
			  809,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  809,  301,  298,  809,  809,  305,  809,
			  302,  306,  677,  677,  677,  677,  809,  303,  304,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  809,  809,  809,  809,  345,  305,  345,  809,  306,

			  346,  346,  346,  346,  346,  346,  304,  809,  308,  809,
			  809,  190,  190,  190,  309,  157,  157,  157,  157,  157,
			  157,  809,  157,  157,  157,  157,  157,  157,  809,  310,
			  157,  157,  157,  157,  157,  157,  308,  311,  809,  809,
			  809,  809,  309,  809,  809,  544,  312,  157,  157,  157,
			  157,  157,  157,  809,  809,  809,  544,  310,  157,  157,
			  157,  157,  157,  157,  809,  311,  544,  157,  157,  157,
			  157,  157,  157,  809,  312,  809,  809,  313,  314,  809,
			  809,  795,  315,  316,  544,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  208,  795,  809,

			  208,  809,  795,  809,  796,  313,  314,  809,  809,  209,
			  315,  316,  317,  337,  338,  338,  338,  338,  338,  338,
			  211,  796,  809,  809,  318,  796,  795,  799,  809,  344,
			  344,  344,  344,  344,  344,  679,  680,  679,  680,  809,
			  317,  809,  809,  809,  799,  231,  809,  809,  799,  796,
			  206,  809,  809,  318,  329,  330,  331,  329,  330,  329,
			  329,  329,  329,  329,  329,  329,  329,  332,  232,  809,
			  329,  809,  799,  231,  681,  809,  809,  329,  333,  329,
			  329,  329,  329,  347,  347,  347,  347,  347,  347,  349,
			  349,  349,  349,  349,  349,  353,  809,  353,  809,  809,

			  354,  354,  354,  354,  354,  354,  329,  329,  334,  329,
			  350,  350,  350,  350,  350,  350,  109,  809,  110,  809,
			  355,  355,  355,  355,  355,  355,  351,  357,  357,  357,
			  357,  357,  357,  809,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  216,  216,  809,  216,  352,
			  809,  809,  809,  809,  351,  809,  809,  809,  809,  112,
			  379,  379,  379,  379,  379,  379,  772,  772,  772,  772,
			  772,  217,  809,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  809,  809,  809,  748,

			  549,  809,  809,  809,  609,  809,  809,  748,  809,  809,
			  809,  550,  809,  117,  117,  609,  809,  365,  117,  367,
			  748,  551,  363,  364,  117,  610,  218,  117,  117,  117,
			  117,  117,  117,  117,  117,  748,  809,  366,  117,  550,
			  117,  117,  117,  609,  809,  365,  117,  367,  809,  809,
			  363,  364,  117,  809,  809,  809,  809,  691,  117,  117,
			  117,  691,  117,  117,  809,  366,  368,  809,  809,  117,
			  117,  117,  809,  809,  117,  809,  117,  809,  691,  809,
			  809,  809,  756,  369,  117,  117,  117,  117,  117,  691,
			  756,  809,  809,  117,  368,  371,  117,  809,  117,  117,

			  809,  809,  373,  756,  809,  117,  370,  117,  809,  117,
			  117,  369,  117,  809,  447,  117,  117,  117,  756,  809,
			  809,  117,  809,  374,  117,  809,  809,  809,  609,  809,
			  373,  117,  809,  117,  370,  376,  117,  809,  117,  611,
			  692,  117,  117,  117,  692,  117,  809,  375,  809,  612,
			  117,  374,  117,  809,  809,  809,  117,  117,  117,  117,
			  809,  692,  117,  376,  117,  809,  809,  611,  809,  117,
			  117,  117,  692,  809,  809,  375,  117,  378,  809,  809,
			  809,  117,  809,  117,  377,  117,  809,  117,  117,  809,
			  117,  809,  117,  809,  809,  809,  809,  117,  380,  380, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  380,  380,  380,  380,  117,  378,  383,  383,  383,  383,
			  383,  383,  377,  809,  117,  384,  384,  384,  384,  384,
			  384,  117,  809,  381,  381,  381,  381,  381,  381,  385,
			  385,  385,  385,  385,  385,  117,  809,  809,  117,  386,
			  386,  386,  386,  386,  386,  117,  117,  117,  117,  117,
			  117,  809,  382,  387,  117,  388,  809,  809,  117,  117,
			  117,  117,  117,  117,  809,  691,  117,  809,  809,  693,
			  692,  393,  809,  117,  694,  809,  389,  117,  809,  390,
			  117,  392,  809,  117,  809,  391,  693,  117,  809,  117,
			  809,  694,  809,  809,  117,  809,  117,  693,  117,  394,

			  809,  117,  694,  809,  389,  117,  117,  390,  117,  392,
			  809,  809,  117,  391,  117,  809,  117,  395,  117,  117,
			  117,  757,  117,  809,  809,  117,  117,  394,  396,  757,
			  117,  809,  117,  117,  117,  117,  809,  717,  809,  117,
			  809,  717,  757,  117,  117,  395,  809,  117,  809,  809,
			  809,  117,  117,  117,  809,  117,  396,  757,  717,  809,
			  809,  117,  809,  397,  117,  809,  117,  117,  117,  717,
			  398,  400,  400,  400,  400,  400,  400,  286,  809,  809,
			  117,  809,  809,  401,  117,  402,  403,  403,  403,  403,
			  403,  286,  794,  794,  794,  794,  794,  117,  809,  398,

			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  809,  809,  809,  809,  405,  157,  157,  157,
			  157,  157,  157,  409,  409,  409,  409,  409,  409,  408,
			  406,  409,  409,  409,  409,  409,  409,  157,  157,  157,
			  157,  157,  157,  809,  405,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  809,  406,  809,
			  411,  410,  157,  157,  157,  157,  157,  157,  809,  157,
			  157,  157,  157,  157,  157,  809,  778,  809,  413,  412,
			  157,  157,  157,  157,  157,  157,  809,  778,  411,  410,
			  414,  157,  157,  157,  157,  157,  157,  778,  157,  157,

			  157,  157,  157,  157,  809,  779,  413,  412,  415,  157,
			  157,  157,  157,  157,  157,  778,  779,  809,  414,  416,
			  157,  157,  157,  157,  157,  157,  779,  809,  809,  809,
			  418,  809,  809,  809,  718,  717,  415,  417,  718,  719,
			  809,  419,  330,  331,  779,  330,  809,  416,  157,  157,
			  157,  157,  157,  157,  332,  718,  719,  809,  418,  157,
			  157,  157,  157,  157,  157,  333,  718,  719,  420,  419,
			  809,  809,  809,  421,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  809,  809,  809,  334,  420,  809,  809,  809,

			  809,  421,  423,  157,  157,  157,  157,  157,  157,  809,
			  422,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  809,  809,  809,  424,  425,  809,  809,
			  423,  157,  157,  157,  157,  157,  157,  809,  422,  809,
			  809,  809,  809,  426,  157,  157,  157,  157,  157,  157,
			  809,  809,  809,  809,  424,  425,  809,  809,  427,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  426,  337,  338,  338,  338,  338,  338,  338,  809,
			  809,  809,  809,  428,  809,  809,  427,  346,  346,  346,
			  346,  346,  346,  802,  803,  802,  803,  809,  429,  431,

			  431,  431,  431,  431,  431,  433,  433,  433,  433,  433,
			  433,  435,  435,  435,  435,  435,  435,  436,  436,  436,
			  436,  436,  436,  809,  809,  809,  809,  429,  809,  809,
			  809,  809,  804,  351,  437,  809,  437,  809,  432,  438,
			  438,  438,  438,  438,  438,  439,  439,  439,  439,  439,
			  439,  809,  809,  809,  809,  809,  352,  809,  809,  809,
			  809,  351,  354,  354,  354,  354,  354,  354,  440,  440,
			  440,  440,  440,  440,  442,  443,  809,  444,  444,  444,
			  444,  444,  444,  445,  445,  445,  445,  445,  445,  446,
			  446,  446,  446,  446,  446,  809,  809,  809,  809,  809,

			  809,  809,  809,  784,  809,  809,  809,  441,  809,  809,
			  809,  117,  117,  809,  784,  117,  809,  809,  117,  809,
			  452,  117,  453,  449,  784,  117,  117,  117,  450,  117,
			  451,  117,  117,  809,  117,  117,  809,  117,  809,  117,
			  117,  809,  784,  117,  809,  809,  117,  809,  452,  117,
			  453,  449,  809,  809,  117,  809,  117,  450,  451,  809,
			  117,  117,  809,  117,  809,  809,  117,  809,  117,  117,
			  117,  809,  809,  809,  800,  117,  454,  117,  809,  809,
			  117,  456,  117,  455,  457,  117,  809,  117,  809,  117,
			  809,  800,  809,  809,  117,  800,  117,  117,  266,  117,

			  267,  117,  117,  117,  454,  809,  117,  459,  117,  456,
			  809,  455,  457,  809,  117,  117,  117,  809,  117,  800,
			  809,  269,  809,  809,  467,  117,  117,  809,  809,  117,
			  117,  117,  117,  809,  809,  459,  809,  461,  809,  117,
			  117,  460,  117,  117,  117,  117,  809,  117,  462,  269,
			  117,  463,  467,  117,  117,  117,  809,  117,  117,  718,
			  117,  809,  464,  720,  117,  461,  117,  117,  809,  460,
			  809,  117,  117,  809,  117,  809,  462,  809,  117,  463,
			  720,  809,  809,  809,  117,  809,  809,  809,  809,  117,
			  464,  720,  809,  809,  809,  117,  379,  379,  379,  379,

			  379,  379,  243,  117,  380,  380,  380,  380,  380,  380,
			  244,  274,  274,  274,  274,  274,  274,  117,  809,  117,
			  809,  266,  809,  267,  465,  383,  383,  383,  383,  383,
			  383,  117,  466,  384,  384,  384,  384,  384,  384,  809,
			  117,  385,  385,  385,  385,  385,  385,  467,  117,  809,
			  809,  809,  465,  809,  117,  467,  468,  809,  809,  809,
			  466,  809,  809,  809,  809,  809,  117,  809,  809,  809,
			  117,  809,  809,  809,  809,  467,  386,  386,  386,  386,
			  386,  386,  809,  467,  468,  469,  469,  469,  469,  469,
			  469,  809,  809,  809,  809,  117,  470,  470,  470,  470,

			  470,  470,  471,  471,  471,  471,  471,  471,  117,  117,
			  472,  472,  472,  472,  472,  472,  809,  809,  809,  809,
			  809,  809,  117,  785,  117,  809,  809,  809,  809,  809,
			  809,  117,  117,  809,  785,  117,  117,  809,  117,  117,
			  809,  475,  809,  809,  785,  809,  117,  809,  117,  117,
			  474,  117,  809,  117,  809,  117,  476,  117,  809,  117,
			  117,  809,  785,  117,  478,  809,  809,  477,  809,  475,
			  809,  809,  809,  117,  809,  117,  809,  117,  474,  809,
			  117,  809,  117,  809,  476,  809,  117,  117,  479,  479,
			  479,  479,  479,  479,  286,  477,  117,  809,  117,  809, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  809,  809,  809,  809,  117,  809,  809,  809,  809,  401,
			  117,  401,  401,  401,  401,  401,  401,  286,  481,  809,
			  482,  483,  483,  483,  483,  483,  286,  117,  401,  809,
			  483,  483,  483,  483,  483,  483,  286,  157,  157,  157,
			  157,  157,  157,  809,  809,  809,  809,  809,  480,  157,
			  157,  157,  157,  157,  157,  809,  809,  484,  488,  489,
			  489,  489,  489,  489,  486,  809,  809,  480,  490,  491,
			  491,  491,  491,  491,  492,  492,  492,  492,  492,  492,
			  487,  157,  157,  157,  157,  157,  157,  809,  809,  809,
			  809,  809,  486,  157,  157,  157,  157,  157,  157,  157,

			  157,  157,  157,  157,  157,  809,  809,  809,  493,  487,
			  809,  809,  809,  494,  809,  495,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  809,  809,  493,  809,  809,  809,
			  809,  494,  809,  495,  157,  157,  157,  157,  157,  157,
			  809,  809,  496,  809,  809,  809,  809,  497,  809,  809,
			  498,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  499,  157,  157,  157,  157,  157,  157,
			  496,  809,  809,  809,  809,  497,  809,  500,  498,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,

			  157,  499,  809,  809,  501,  809,  157,  157,  157,  157,
			  157,  157,  502,  809,  503,  500,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  809,  809,
			  809,  809,  501,  504,  157,  157,  157,  157,  157,  157,
			  502,  809,  503,  505,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  809,  809,  809,  809,
			  809,  504,  809,  809,  809,  507,  809,  809,  809,  809,
			  809,  505,  809,  809,  506,  157,  157,  157,  157,  157,
			  157,  510,  510,  510,  510,  510,  510,  508,  809,  809,
			  809,  809,  809,  507,  809,  809,  809,  809,  509,  809,

			  478,  809,  506,  157,  157,  157,  157,  157,  157,  511,
			  511,  511,  511,  511,  511,  508,  809,  809,  809,  809,
			  432,  809,  809,  809,  809,  809,  509,  344,  344,  344,
			  344,  344,  344,  512,  513,  513,  513,  513,  513,  514,
			  514,  514,  514,  514,  514,  438,  438,  438,  438,  438,
			  438,  809,  809,  809,  809,  351,  515,  515,  515,  515,
			  515,  515,  517,  517,  517,  517,  517,  517,  518,  518,
			  518,  518,  518,  518,  809,  809,  809,  809,  352,  809,
			  809,  809,  809,  351,  519,  519,  519,  519,  519,  519,
			  809,  809,  809,  809,  809,  516,  514,  514,  514,  514,

			  514,  514,  809,  809,  809,  809,  443,  441,  444,  444,
			  444,  444,  444,  444,  809,  809,  809,  447,  117,  117,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  610,  117,  117,  117,  117,  809,  117,  528,  809,
			  117,  530,  612,  527,  531,  809,  117,  117,  529,  809,
			  809,  117,  612,  117,  117,  117,  117,  117,  117,  809,
			  117,  809,  809,  117,  117,  117,  528,  809,  117,  530,
			  612,  809,  531,  809,  809,  809,  529,  117,  532,  809,
			  809,  809,  117,  117,  809,  117,  117,  117,  536,  117,
			  533,  117,  809,  117,  809,  809,  117,  117,  809,  117,

			  809,  117,  534,  117,  809,  117,  532,  809,  809,  809,
			  117,  117,  117,  809,  809,  117,  536,  809,  533,  809,
			  537,  809,  117,  117,  117,  645,  809,  809,  117,  809,
			  534,  809,  117,  117,  117,  809,  117,  117,  748,  117,
			  809,  117,  117,  538,  809,  539,  749,  117,  537,  117,
			  809,  117,  809,  809,  809,  809,  117,  809,  117,  749,
			  809,  117,  809,  809,  809,  117,  117,  540,  117,  809,
			  117,  538,  809,  539,  749,  809,  809,  809,  117,  809,
			  117,  809,  117,  809,  809,  809,  809,  117,  541,  541,
			  541,  541,  541,  541,  117,  540,  117,  117,  117,  117,

			  117,  117,  469,  469,  469,  469,  469,  469,  809,  809,
			  809,  117,  809,  809,  809,  809,  243,  117,  470,  470,
			  470,  470,  470,  470,  244,  809,  809,  387,  809,  388,
			  542,  471,  471,  471,  471,  471,  471,  809,  809,  472,
			  472,  472,  472,  472,  472,  809,  543,  809,  809,  809,
			  809,  809,  809,  390,  117,  545,  809,  809,  542,  391,
			  117,  117,  809,  117,  546,  809,  809,  809,  117,  809,
			  117,  809,  117,  809,  543,  809,  809,  117,  809,  117,
			  809,  390,  117,  545,  547,  809,  117,  391,  117,  117,
			  809,  117,  546,  157,  157,  157,  157,  157,  157,  117,

			  117,  809,  809,  809,  809,  809,  117,  809,  117,  809,
			  809,  809,  547,  809,  809,  548,  809,  117,  809,  809,
			  117,  809,  117,  552,  552,  552,  552,  552,  552,  286,
			  809,  809,  809,  401,  117,  554,  555,  555,  555,  555,
			  555,  286,  401,  548,  556,  557,  557,  557,  557,  557,
			  286,  117,  401,  809,  557,  557,  557,  557,  557,  557,
			  286,  157,  157,  157,  157,  157,  157,  809,  809,  809,
			  809,  560,  480,  561,  561,  561,  561,  561,  561,  809,
			  809,  480,  561,  561,  561,  561,  561,  561,  809,  809,
			  408,  480,  491,  491,  491,  491,  491,  491,  244,  809,

			  559,  563,  563,  563,  563,  563,  563,  809,  809,  809,
			  562,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  809,  809,  809,  809,  564,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  565,  809,  809,  566,  809,  809,  809,  809,  809,  567,
			  809,  809,  809,  809,  809,  564,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  565,  809,
			  809,  566,  568,  809,  809,  809,  809,  567,  157,  157,
			  157,  157,  157,  157,  569,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  809,  809,  570,

			  568,  571,  809,  809,  809,  809,  572,  809,  809,  809,
			  809,  809,  569,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  809,  809,  570,  809,  571,
			  809,  809,  809,  809,  572,  573,  809,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  809,  809,  809,  809,  575,
			  809,  809,  809,  573,  574,  576,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  809,  809,
			  809,  809,  577,  809,  809,  809,  809,  575,  809,  809,
			  809,  809,  574,  576,  809,  809,  809,  809,  809,  578, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  157,  157,  157,  157,  157,  157,  809,  809,  809,  809,
			  577,  580,  580,  580,  580,  580,  580,  582,  582,  582,
			  582,  582,  582,  809,  579,  809,  581,  578,  582,  582,
			  582,  582,  582,  582,  514,  514,  514,  514,  514,  514,
			  585,  585,  585,  585,  585,  585,  809,  809,  809,  809,
			  584,  809,  579,  586,  586,  586,  586,  586,  586,  587,
			  587,  587,  587,  587,  587,  583,  588,  588,  588,  588,
			  588,  588,  589,  589,  589,  589,  589,  589,  584,  516,
			  590,  590,  590,  590,  590,  590,  592,  592,  592,  592,
			  592,  592,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  237,  809,  809,  594,  809,  809,  117,  117,
			  595,  809,  117,  117,  809,  809,  809,  809,  809,  809,
			  809,  809,  117,  117,  117,  117,  117,  117,  117,  117,
			  237,  117,  596,  594,  117,  117,  117,  117,  595,  809,
			  117,  117,  597,  645,  809,  117,  809,  117,  117,  117,
			  117,  117,  809,  117,  117,  117,  757,  117,  117,  117,
			  596,  598,  117,  117,  758,  809,  809,  809,  117,  117,
			  597,  117,  809,  809,  809,  809,  117,  758,  809,  117,
			  117,  600,  117,  117,  117,  809,  809,  809,  809,  598,
			  117,  601,  758,  809,  117,  603,  117,  809,  809,  809,

			  117,  117,  809,  809,  117,  809,  117,  809,  117,  600,
			  117,  809,  809,  117,  602,  117,  809,  117,  117,  601,
			  809,  809,  117,  603,  809,  809,  809,  604,  809,  117,
			  809,  809,  809,  809,  809,  117,  809,  809,  809,  117,
			  809,  117,  602,  117,  809,  266,  117,  267,  117,  541,
			  541,  541,  541,  541,  541,  604,  809,  809,  809,  809,
			  809,  809,  117,  809,  117,  809,  616,  617,  617,  617,
			  617,  617,  117,  117,  608,  809,  117,  809,  117,  809,
			  607,  117,  809,  809,  809,  606,  809,  117,  117,  117,
			  117,  809,  809,  117,  809,  117,  809,  117,  809,  809,

			  809,  117,  608,  809,  809,  809,  809,  809,  607,  117,
			  809,  809,  809,  606,  809,  809,  809,  809,  117,  117,
			  619,  620,  620,  620,  620,  620,  117,  613,  613,  613,
			  613,  613,  613,  286,  481,  809,  401,  401,  401,  401,
			  401,  401,  286,  481,  809,  555,  555,  555,  555,  555,
			  555,  286,  401,  809,  615,  554,  554,  554,  554,  554,
			  286,  401,  809,  554,  554,  554,  554,  554,  554,  286,
			  809,  809,  809,  484,  157,  157,  157,  157,  157,  157,
			  809,  809,  484,  809,  809,  809,  618,  809,  809,  809,
			  809,  480,  621,  621,  621,  621,  621,  621,  809,  408,

			  480,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  809,  618,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  622,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  809,  809,  809,  809,  623,  157,  157,  157,  157,  157,
			  157,  809,  809,  809,  809,  622,  809,  624,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  809,  809,  623,  157,  157,  157,  157,  157,  157,  625,
			  809,  809,  809,  809,  809,  624,  809,  809,  809,  627,
			  809,  809,  626,  157,  157,  157,  157,  157,  157,  157,

			  157,  157,  157,  157,  157,  809,  809,  625,  157,  157,
			  157,  157,  157,  157,  809,  629,  809,  627,  809,  809,
			  626,  628,  809,  630,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  809,  629,  809,  809,  809,  809,  809,  628,
			  632,  630,  809,  809,  809,  809,  809,  631,  157,  157,
			  157,  157,  157,  157,  510,  510,  510,  510,  510,  510,
			  809,  809,  809,  633,  809,  809,  809,  809,  632,  634,
			  635,  635,  635,  635,  635,  631,  636,  636,  636,  636,
			  636,  636,  809,  809,  809,  809,  809,  637,  809,  637,

			  809,  633,  638,  638,  638,  638,  638,  638,  638,  638,
			  638,  638,  638,  638,  639,  639,  639,  639,  639,  639,
			  518,  518,  518,  518,  518,  518,  642,  642,  642,  642,
			  642,  642,  643,  643,  643,  643,  643,  643,  644,  644,
			  644,  644,  644,  644,  809,  809,  809,  516,  809,  809,
			  809,  809,  809,  809,  640,  809,  809,  809,  809,  809,
			  117,  809,  809,  809,  117,  117,  809,  809,  648,  117,
			  647,  809,  646,  117,  117,  809,  117,  352,  117,  117,
			  117,  117,  640,  117,  809,  117,  809,  117,  117,  117,
			  809,  809,  117,  117,  809,  809,  648,  117,  647,  809,

			  646,  117,  809,  809,  809,  117,  117,  117,  809,  117,
			  117,  117,  809,  809,  117,  809,  809,  809,  117,  809,
			  117,  117,  117,  117,  809,  117,  809,  117,  809,  117,
			  809,  809,  117,  689,  117,  117,  809,  650,  809,  117,
			  809,  809,  809,  117,  809,  117,  117,  117,  117,  117,
			  809,  117,  117,  809,  117,  652,  117,  117,  809,  809,
			  117,  689,  809,  809,  809,  650,  809,  809,  117,  809,
			  117,  809,  809,  809,  117,  117,  809,  117,  117,  653,
			  117,  654,  117,  652,  809,  809,  809,  809,  809,  117,
			  809,  117,  809,  809,  117,  809,  117,  809,  809,  117,

			  809,  809,  809,  117,  809,  809,  809,  653,  117,  654,
			  662,  809,  401,  401,  401,  401,  401,  401,  286,  809,
			  117,  809,  809,  809,  664,  117,  665,  665,  665,  665,
			  665,  665,  665,  665,  665,  665,  665,  665,  157,  157,
			  157,  157,  157,  157,  809,  809,  809,  809,  560,  663,
			  620,  620,  620,  620,  620,  620,  619,  619,  619,  619,
			  619,  619,  809,  666,  809,  667,  809,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  809,
			  157,  157,  157,  157,  157,  157,  809,  562,  668,  809,
			  809,  809,  809,  667,  669,  157,  157,  157,  157,  157,

			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  809,  809,  809,  668,  809,  809,  809,
			  809,  809,  669,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  809,  809,  809,
			  809,  809,  670,  809,  809,  809,  809,  671,  157,  157,
			  157,  157,  157,  157,  809,  157,  157,  157,  157,  157,
			  157,  634,  634,  634,  634,  634,  634,  672,  809,  809,
			  670,  673,  809,  809,  581,  671,  635,  635,  635,  635,
			  635,  635,  638,  638,  638,  638,  638,  638,  638,  638, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  638,  638,  638,  638,  809,  672,  809,  809,  809,  673,
			  674,  674,  674,  674,  674,  674,  809,  809,  809,  675,
			  809,  675,  809,  583,  676,  676,  676,  676,  676,  676,
			  678,  678,  678,  678,  678,  678,  682,  682,  682,  682,
			  682,  682,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  640,  809,  809,  809,  809,  684,  117,  809,
			  809,  809,  117,  117,  686,  809,  809,  685,  809,  809,
			  809,  809,  117,  809,  117,  352,  117,  117,  117,  117,
			  640,  687,  117,  809,  809,  684,  117,  809,  809,  809,
			  117,  117,  686,  809,  809,  685,  117,  809,  117,  809,

			  117,  690,  809,  117,  117,  809,  809,  117,  117,  687,
			  117,  809,  809,  809,  117,  809,  117,  809,  117,  809,
			  117,  698,  699,  699,  699,  699,  699,  117,  117,  690,
			  809,  809,  117,  613,  695,  695,  695,  695,  695,  286,
			  809,  809,  809,  809,  809,  117,  809,  809,  401,  117,
			  554,  697,  555,  555,  555,  555,  286,  700,  700,  700,
			  700,  700,  700,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  809,  809,  701,  157,  157,
			  157,  157,  157,  157,  809,  809,  809,  480,  809,  702,
			  809,  809,  809,  809,  703,  157,  157,  157,  157,  157,

			  157,  809,  809,  809,  117,  701,  809,  117,  713,  704,
			  157,  157,  157,  157,  157,  157,  809,  702,  117,  809,
			  117,  117,  703,  117,  809,  705,  157,  157,  157,  157,
			  157,  157,  117,  809,  809,  117,  713,  704,  809,  809,
			  809,  809,  706,  157,  157,  157,  157,  157,  157,  117,
			  809,  809,  117,  705,  676,  676,  676,  676,  676,  676,
			  707,  707,  707,  707,  707,  707,  809,  809,  809,  809,
			  706,  708,  708,  708,  708,  708,  708,  523,  523,  523,
			  523,  523,  523,  709,  709,  709,  709,  709,  709,  710,
			  710,  710,  710,  710,  710,  809,  809,  809,  809,  516,

			  711,  711,  711,  711,  711,  711,  809,  809,  809,  809,
			  809,  809,  117,  117,  715,  809,  640,  809,  809,  809,
			  809,  809,  117,  809,  809,  809,  714,  117,  117,  117,
			  809,  117,  809,  809,  809,  809,  117,  809,  117,  352,
			  117,  117,  715,  809,  640,  716,  809,  117,  809,  809,
			  117,  809,  809,  809,  714,  809,  809,  117,  117,  117,
			  698,  698,  698,  698,  698,  698,  809,  117,  809,  809,
			  809,  809,  809,  716,  809,  659,  117,  695,  695,  695,
			  695,  695,  695,  286,  662,  809,  555,  555,  555,  555,
			  555,  555,  286,  664,  809,  699,  699,  699,  699,  699,

			  699,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  809,  660,  809,  809,  809,  809,  809,
			  722,  809,  809,  663,  157,  157,  157,  157,  157,  157,
			  809,  809,  666,  117,  730,  809,  723,  157,  157,  157,
			  157,  157,  157,  809,  809,  809,  809,  117,  722,  117,
			  809,  809,  809,  724,  157,  157,  157,  157,  157,  157,
			  809,  117,  730,  809,  723,  157,  157,  157,  157,  157,
			  157,  674,  674,  674,  674,  674,  674,  809,  117,  809,
			  809,  724,  727,  727,  727,  727,  727,  727,  809,  809,
			  679,  809,  679,  117,  725,  710,  710,  710,  710,  710,

			  710,  711,  711,  711,  711,  711,  711,  117,  809,  117,
			  516,  731,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  117,  725,  809,  809,  809,  809,  809,  117,  681,
			  809,  117,  742,  742,  742,  742,  742,  742,  117,  809,
			  731,  732,  117,  809,  117,  117,  809,  117,  809,  733,
			  157,  157,  157,  157,  157,  157,  117,  809,  809,  117,
			  157,  157,  157,  157,  157,  157,  737,  809,  809,  732,
			  809,  809,  809,  117,  809,  809,  117,  809,  733,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  809,  809,  738,  737,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  739,  809,  809,
			  809,  117,  117,  809,  809,  117,  809,  809,  740,  809,
			  117,  809,  738,  809,  809,  745,  117,  117,  117,  117,
			  746,  117,  809,  809,  117,  739,  117,  809,  809,  117,
			  117,  809,  809,  117,  809,  809,  809,  740,  117,  809,
			  809,  809,  809,  745,  809,  809,  117,  117,  746,  809,
			  117,  809,  809,  809,  809,  117,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  809,  809,  809,  809,  809,  750,  752,  752,  752,  752,

			  752,  752,  681,  681,  681,  681,  681,  681,  117,  751,
			  753,  753,  753,  753,  753,  753,  809,  809,  809,  809,
			  809,  809,  117,  750,  117,  809,  754,  809,  809,  809,
			  809,  809,  117,  755,  809,  809,  117,  751,  157,  157,
			  157,  157,  157,  157,  809,  809,  117,  809,  117,  809,
			  809,  809,  809,  117,  809,  754,  809,  809,  809,  809,
			  117,  755,  157,  157,  157,  157,  157,  157,  809,  809,
			  809,  759,  809,  809,  809,  809,  809,  117,  760,  764,
			  809,  765,  766,  809,  753,  753,  753,  753,  753,  753,
			  809,  117,  809,  809,  809,  809,  117,  809,  809,  809,

			  759,  767,  809,  809,  809,  117,  760,  117,  809,  809,
			  117,  809,  117,  157,  157,  157,  157,  157,  157,  117,
			  809,  809,  809,  809,  117,  809,  809,  809,  809,  767,
			  157,  157,  157,  157,  157,  157,  117,  809,  770,  809,
			  809,  117,  771,  771,  771,  771,  771,  771,  773,  773,
			  773,  773,  773,  773,  776,  776,  776,  776,  776,  776,
			  809,  809,  809,  809,  809,  809,  770,  157,  157,  157,
			  157,  157,  157,  809,  809,  809,  117,  777,  809,  809,
			  809,  809,  809,  780,  781,  781,  781,  781,  781,  781,
			  117,  809,  117,  782,  782,  782,  782,  782,  782,  809,

			  809,  809,  809,  809,  117,  777,  774,  809,  809,  809,
			  809,  780,  773,  773,  773,  773,  773,  773,  809,  809,
			  809,  117,  773,  773,  773,  773,  773,  773,  764,  809,
			  765,  783,  809,  776,  776,  776,  776,  776,  776,  157,
			  157,  157,  157,  157,  157,  117,  786,  786,  786,  786,
			  786,  786,  790,  790,  790,  790,  790,  790,  809,  117,
			  809,  117,  763,  763,  763,  763,  763,  763,  809,  809,
			  809,  809,  809,  117,  793,  793,  793,  793,  793,  793,
			  797,  797,  797,  797,  797,  797,  764,  809,  765,  809,
			  117,  790,  790,  790,  790,  790,  790,  798,  798,  798, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  798,  798,  798,  801,  801,  801,  801,  801,  801,  789,
			  789,  789,  789,  789,  789,  805,  805,  805,  805,  805,
			  805,  806,  806,  806,  806,  806,  806,  807,  807,  807,
			  807,  807,  807,  802,  809,  802,  809,  809,  806,  806,
			  806,  806,  806,  806,  808,  808,  808,  808,  808,  808,
			  804,  804,  804,  804,  804,  804,  103,  103,  103,  103,
			  103,  103,  103,  661,  661,  661,  661,  661,  661,  661,
			  809,  809,  804,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   98,   98,  809,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  809,   98,   98,   98,   98,
			   98,  100,  100,  809,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  100,  100,  117,  117,
			  117,  809,  809,  809,  809,  809,  117,  117,  117,  809,
			  117,  117,  117,  117,  117,  117,  117,  809,  809,  809,
			  117,  117,  117,  150,  150,  809,  150,  809,  150,  150,
			  809,  809,  150,  150,  150,  150,  150,  150,  150,  809,
			  809,  809,  150,  150,  150,  152,  152,  809,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  157,  809,  157,  157,  809,  809,  809,  157,
			  157,  157,  809,  809,  157,  157,  157,  157,  157,  157,

			  157,  157,  809,  809,  157,  157,  157,  185,  185,  809,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  809,  185,
			  185,  185,  185,  185,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  205,  809,
			  205,  809,  809,  809,  205,  809,  205,  205,  809,  809,

			  205,  205,  205,  205,  205,  205,  205,  809,  809,  205,
			  205,  205,  205,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  219,  219,  809,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  103,  809,  809,  809,  103,  103,

			  809,  809,  103,  103,  103,  103,  103,  103,  103,  809,
			  809,  809,  103,  103,  103,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  108,  108,  108,  809,  809,  108,  108,  108,
			  108,  108,  108,  108,  108,  809,  809,  108,  108,  108,
			  245,  809,  809,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  809,  809,  809,  245,  245,  245,
			  197,  197,  197,  197,  197,  197,  197,  197,  809,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,

			  197,  197,  197,  197,  197,  197,  197,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  218,  218,  218,  809,  809,  809,  809,  809,  809,
			  809,  809,  218,  218,  218,  218,  218,  218,  218,  218,
			  809,  809,  809,  358,  358,  809,  218,  358,  358,  358,
			  358,  358,  358,  358,  809,  809,  809,  358,  358,  358,

			  359,  359,  809,  809,  359,  359,  359,  359,  359,  359,
			  359,  809,  809,  809,  359,  359,  359,  290,  290,  290,
			  809,  809,  290,  290,  290,  290,  290,  290,  290,  290,
			  809,  809,  290,  290,  290,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  448,  448,  448,  448,  448,  448,  448,  809,
			  809,  809,  448,  448,  448,  525,  525,  525,  525,  525,
			  525,  525,  809,  809,  809,  525,  525,  525,  526,  526,
			  809,  809,  526,  526,  526,  526,  526,  526,  526,  809,

			  809,  809,  526,  526,  526,  593,  593,  809,  809,  593,
			  593,  593,  593,  593,  593,  593,  809,  809,  809,  593,
			  593,  593,  683,  683,  683,  683,  683,  683,  683,  809,
			  809,  661,  683,  683,  683,  661,  661,  809,  809,  661,
			  661,  661,  661,  661,  661,  661,  809,  809,  809,  661,
			  661,  661,  712,  712,  809,  809,  712,  712,  712,  712,
			  712,  712,  712,  809,  809,  809,  712,  712,  712,  743,
			  743,  809,  809,  743,  743,  743,  743,  743,  743,  743,
			  809,  809,  809,  743,  743,  743,   11,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809, yy_Dummy>>,
			1, 978, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6977)
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
			   25,   25,   27,   84,   27,  619,   27,   27,   27,   27,
			   27,   27,   38,   38,   74,   38,   74,   74,   82,    5,
			    5,    6,    6,   85,   95,  108,   95,   95,  116,  116,
			  143,  116,  785,    3,   18,  142,   38,  784,    4,    9,
			   84,   84,   76,   10,  619,   27,  109,  109,  109,  109,
			  109,  109,  116,  209,   82,   82,  209,  775,  143,   85,
			   85,  108,  211,  765,  142,  211,    3,    3,    3,    3,
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
			  634,   28,   28,   28,   28,   28,   28,   87,   35,   35,
			   87,   35,   36,   36,  195,   36,   92,  326,   37,   37,

			  399,   37,   77,  399,  187,   80,  187,  187,   39,   39,
			  154,   39,   35,  154,   43,   43,   36,   43,  154,  634,
			   28,   35,   37,  757,   36,   35,   37,   35,  320,  756,
			  195,  195,   39,   79,  326,   37,   40,   40,   43,   40,
			   87,  729,   43,   41,   41,   39,   41,   44,   44,   35,
			   44,   92,   36,   35,   37,   35,   39,   78,   42,   42,
			   40,   42,  199,   37,   40,   45,   45,   41,   45,  204,
			   43,   44,  204,   39,   49,   49,   40,   49,   41,   77,
			   77,   77,   42,   80,   80,   39,  720,   44,  228,   45,
			  228,  228,   40,  359,   81,   45,   42,   42,   49,  199,

			  199,  359,   42,  446,   40,  212,   41,  320,   45,  717,
			   79,   79,   79,   58,   49,   44,   58,   50,   50,  708,
			   50,   58,  204,   45,   42,   42,   48,   48,   58,   48,
			   42,  239,  239,  239,  239,  239,   45,   46,   46,  201,
			   46,   50,   49,  151,  446,   47,   47,  290,   47,  674,
			   48,  717,   46,   46,   46,   46,   46,   46,   46,   56,
			  212,   46,   56,  198,   58,   48,   50,   56,   46,   47,
			   48,   81,   81,   81,   56,   46,  201,  201,   90,  151,
			   47,   90,   46,  290,   46,  666,   46,  661,   47,   55,
			   90,   56,   55,   48,  151,   50,   46,   55,   48,  198,

			  198,   90,  322,   46,   55,  612,  344,  611,   47,   57,
			   56,  610,   57,   46,  609,   46,   47,   57,  593,   56,
			  332,  332,   55,  332,   57,  589,   55,   59,   55,  344,
			   59,   90,  583,   60,  344,   59,   60,   57,  442,  442,
			   55,   60,   59,  466,   61,  490,   57,   61,   60,  543,
			   55,  466,   61,  490,   55,   62,   55,  543,   62,   61,
			   57,   60,   55,   62,   59,   57,  227,  227,   63,  227,
			   62,   63,  562,   60,   57,   59,   63,  544,   59,   61,
			  322,  322,  526,   63,   60,  191,  712,  712,  518,   60,
			  227,  719,   59,   62,   62,   61,   63,   64,  510,   62,

			   64,   60,  719,  698,   59,   64,   62,   61,   65,  535,
			   66,   65,   64,   66,  333,  333,   65,  333,   66,   63,
			  758,   62,   62,   65,   63,   66,  535,   62,  758,  190,
			  535,   67,   68,  719,   67,   68,  485,   64,   65,   67,
			   68,   69,  698,  458,   69,   66,   67,   68,   64,   69,
			  435,   65,  613,   66,  535,   89,   69,  404,   89,   65,
			  613,   66,  191,  191,  191,   64,   65,   89,   89,  361,
			   67,  358,   68,   66,  480,   67,  348,  480,   89,   65,
			  334,   66,   67,   68,  112,  112,  112,  112,  112,  112,
			   69,  613,   69,  117,  117,  329,  117,  328,   67,  480,

			   68,  743,  743,   67,  294,  286,  117,  117,   89,  190,
			  190,  190,  190,  190,  245,  117,  244,  117,  234,   69,
			   93,   93,  484,   93,  233,  484,  102,  170,  170,  170,
			  170,  170,  170,  170,  226,  102,  102,  102,  102,  102,
			  102,  522,  522,  522,  522,  522,   93,  484,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,  102,  106,  106,  106,  106,  106,  106,  110,  110,
			  110,  110,  110,  110,  225,  224,  102,  223,  106,  221,
			  102,  216,  102,  207,  110,  202,  120,  120,  111,  120,

			  111,   93,  111,  111,  111,  111,  111,  111,  111,  120,
			  120,  106,  192,  200,  217,  217,  106,  217,  120,  113,
			  120,  113,  110,  113,  113,  113,  113,  113,  113,  119,
			  119,  197,  119,  120,  121,  121,  276,  121,  185,  161,
			  217,  111,  119,  119,  726,  726,  726,  121,  121,  276,
			  276,  119,  276,  119,  122,  122,  121,  122,  121,  155,
			  152,  120,  113,  150,  276,  121,  137,  122,  122,  105,
			  123,  123,  553,  123,  119,  553,  122,  276,  122,  663,
			  553,  276,  663,  123,  123,  124,  124,  122,  124,  192,
			  192,  192,  123,  121,  123,  816,  104,  103,  124,  124,

			  335,  335,  119,  335,  663,  125,  125,  124,  125,  124,
			  816,  816,  816,  123,  100,  122,   98,   96,  125,  125,
			  126,  126,   88,  126,   73,  124,  335,  125,   70,  125,
			   54,   51,  587,  126,  126,  166,  166,  166,  166,  166,
			  166,  123,  126,   33,  126,  127,  127,   31,  127,  125,
			  126,  128,  128,  124,  128,  587,  126,   26,  127,  127,
			  587,   24,   16,  166,  128,  128,   15,  127,   14,  127,
			   11,  257,    0,  128,    0,  128,  257,  125,  126,  599,
			    0,    0,  127,    0,  126,  129,  129,  257,  129,  130,
			  130,  166,  130,  372,  128,    0,  599,  257,  129,  129, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  599,    0,  130,  130,  372,  131,  131,  129,  131,  129,
			  127,  130,    0,  130,  372,  257,    0,    0,  131,  131,
			  132,  132,  128,  132,  599,  133,  133,  131,  133,  131,
			  130,    0,  372,  132,  132,  131,    0,  193,  133,  133,
			  134,  134,  132,  134,  132,    0,    0,  133,  194,  133,
			  832,  832,  832,  134,  134,    0,  147,    0,  130,    0,
			    0,    0,  134,  131,  134,  135,  135,    0,  135,  734,
			  133,    0,  147,  147,    0,  132,    0,  734,  135,  135,
			  136,  136,    0,  136,    0,  134,  147,  135,  147,  135,
			  734,    0,  393,  136,  136,  135,    0,  393,  133,    0,

			  147,  147,  136,  319,  136,  734,  139,  139,  393,  139,
			    0,  136,    0,  134,  193,  193,  193,  147,  393,  139,
			  139,  139,  445,  135,  445,  194,  194,  194,  139,    0,
			  139,  140,  140,  445,  140,  205,  393,    0,  205,  136,
			  138,  138,  138,  138,  140,  140,  140,  205,    0,    0,
			  138,  139,    0,  140,  144,  140,    0,    0,  205,  138,
			    0,  445,  140,  138,    0,    0,  138,    0,    0,  277,
			  144,  144,    0,  138,  144,  138,  140,  138,  140,  605,
			  319,  319,  319,  277,  144,  277,  144,  138,  205,  145,
			  140,  138,  696,  696,  138,  696,  605,  277,  144,  144,

			  605,    0,  144,    0,  138,  145,  138,  140,  141,  141,
			  141,  141,  141,  141,  277,  144,  696,    0,    0,  145,
			  145,  145,  146,  141,  605,    0,    0,  141,    0,  148,
			  141,    0,  651,  145,    0,    0,  141,  141,  146,  141,
			  149,    0,    0,  146,    0,  148,    0,  146,  145,  651,
			  145,  141,  146,  651,  146,  141,  149,  148,  141,  148,
			    0,  148,    0,    0,  141,  752,  146,  752,  141,    0,
			  149,  146,  149,  148,  149,  146,  752,  651,  157,    0,
			    0,  157,  248,  146,  149,  148,  157,  321,    0,  246,
			  148,  157,  157,  157,  158,    0,    0,  158,  248,    0,

			  157,  149,  158,  149,  752,  246,  246,  158,  158,  158,
			  159,    0,  248,  159,  248,    0,  158,    0,  159,  246,
			  323,  246,    0,  159,  159,  159,  248,  160,    0,  157,
			  160,    0,  159,  246,  246,  160,    0,    0,    0,  158,
			  160,  160,  160,  248,    0,  158,  782,  159,  782,  160,
			  246,  163,  163,  163,  163,  163,  163,  782,  160,    0,
			    0,  159,  324,    0,  321,  321,  321,  158,  163,  165,
			  165,  165,  165,  165,  165,  159,    0,    0,  160,  173,
			  173,  173,  173,  173,  173,  782,  160,  162,    0,    0,
			  162,    0,    0,  165,    0,  162,  163,  323,  323,  323,

			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  164,  164,  164,  164,  164,  164,    0,    0,  173,    0,
			    0,  165,  167,  167,  167,  167,  167,  167,  168,  168,
			  168,  168,  168,  168,  325,    0,  167,  164,  162,  324,
			  324,  324,  167,  171,  171,  171,  171,  171,  171,  168,
			    0,  169,  169,  169,  169,  169,  169,  172,  172,  172,
			  172,  172,  172,    0,  167,  164,    0,    0,  171,    0,
			  167,  172,  641,  641,  641,  641,    0,  168,  169,  174,
			  174,  174,  174,  174,  174,  175,  175,  175,  175,  175,
			  175,    0,    0,    0,    0,  231,  171,  231,    0,  172,

			  231,  231,  231,  231,  231,  231,  169,    0,  174,    0,
			    0,  325,  325,  325,  175,  176,  176,  176,  176,  176,
			  176,    0,  177,  177,  177,  177,  177,  177,    0,  176,
			  178,  178,  178,  178,  178,  178,  174,  177,    0,    0,
			    0,    0,  175,    0,    0,  473,  178,  179,  179,  179,
			  179,  179,  179,    0,    0,    0,  473,  176,  180,  180,
			  180,  180,  180,  180,    0,  177,  473,  181,  181,  181,
			  181,  181,  181,    0,  178,    0,    0,  179,  180,    0,
			    0,  791,  180,  181,  473,  182,  182,  182,  182,  182,
			  182,  183,  183,  183,  183,  183,  183,  208,  791,    0,

			  208,    0,  791,    0,  792,  179,  180,    0,    0,  208,
			  180,  181,  182,  222,  222,  222,  222,  222,  222,  222,
			  208,  792,    0,    0,  183,  792,  791,  795,    0,  230,
			  230,  230,  230,  230,  230,  643,  643,  643,  643,    0,
			  182,    0,    0,    0,  795,  230,    0,    0,  795,  792,
			  208,    0,    0,  183,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  230,    0,
			  210,    0,  795,  230,  643,    0,    0,  210,  210,  210,
			  210,  210,  210,  232,  232,  232,  232,  232,  232,  235,
			  235,  235,  235,  235,  235,  237,    0,  237,    0,    0,

			  237,  237,  237,  237,  237,  237,  210,  210,  210,  210,
			  236,  236,  236,  236,  236,  236,  238,    0,  238,    0,
			  238,  238,  238,  238,  238,  238,  236,  240,  240,  240,
			  240,  240,  240,    0,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  213,  213,    0,  213,  236,
			    0,    0,    0,    0,  236,    0,    0,    0,    0,  238,
			  266,  266,  266,  266,  266,  266,  762,  762,  762,  762,
			  762,  213,    0,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,    0,  247,  249,  735,

			  478,  250,  252,    0,  549,    0,    0,  735,  251,    0,
			    0,  478,    0,  247,  249,  549,    0,  250,  252,  252,
			  735,  478,  247,  249,  251,  549,  213,  247,  249,  247,
			  249,  250,  252,  250,  252,  735,    0,  251,  251,  478,
			  251,  247,  249,  549,  253,  250,  252,  252,    0,    0,
			  247,  249,  251,    0,  254,  256,    0,  655,  247,  249,
			  253,  655,  250,  252,    0,  251,  253,    0,    0,  251,
			  254,  256,    0,    0,  253,    0,  253,  255,  655,    0,
			  258,    0,  747,  254,  254,  256,  254,  256,  253,  655,
			  747,    0,    0,  255,  253,  256,  258,    0,  254,  256,

			    0,  259,  258,  747,    0,  253,  255,  255,    0,  255,
			  258,  254,  258,    0,  550,  254,  256,  259,  747,    0,
			  261,  255,    0,  259,  258,    0,  260,  262,  550,    0,
			  258,  259,    0,  259,  255,  261,  261,    0,  255,  550,
			  656,  258,  260,  262,  656,  259,    0,  260,    0,  550,
			  261,  259,  261,  263,    0,    0,  260,  262,  260,  262,
			  264,  656,  259,  261,  261,    0,    0,  550,    0,  263,
			  260,  262,  656,    0,    0,  260,  264,  264,    0,    0,
			    0,  261,    0,  263,  263,  263,    0,  260,  262,    0,
			  264,    0,  264,    0,    0,    0,    0,  263,  267,  267, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  267,  267,  267,  267,  264,  264,  269,  269,  269,  269,
			  269,  269,  263,    0,  263,  270,  270,  270,  270,  270,
			  270,  264,  268,  268,  268,  268,  268,  268,  268,  271,
			  271,  271,  271,  271,  271,  269,    0,    0,  268,  272,
			  272,  272,  272,  272,  272,  273,  273,  273,  273,  273,
			  273,    0,  268,  274,  268,  274,  274,  278,  275,  275,
			  275,  275,  275,  275,  279,  657,  268,    0,    0,  657,
			  658,  279,    0,  278,  658,    0,  274,  275,    0,  274,
			  279,  278,  280,  268,    0,  274,  657,  278,    0,  278,
			  281,  658,    0,    0,  279,    0,  279,  657,  280,  280,

			  282,  278,  658,  284,  274,  275,  281,  274,  279,  278,
			    0,    0,  280,  274,  280,    0,  282,  281,  278,  284,
			  281,  748,  281,  283,    0,  279,  280,  280,  282,  748,
			  282,    0,  282,  284,  281,  284,  285,  691,    0,  283,
			    0,  691,  748,  280,  282,  281,    0,  284,    0,    0,
			    0,  281,  285,  283,    0,  283,  282,  748,  691,    0,
			    0,  282,    0,  283,  284,    0,  285,  283,  285,  691,
			  285,  287,  287,  287,  287,  287,  287,  287,    0,    0,
			  285,    0,    0,  288,  283,  288,  288,  288,  288,  288,
			  288,  288,  788,  788,  788,  788,  788,  285,    0,  285,

			  291,  291,  291,  291,  291,  291,  292,  292,  292,  292,
			  292,  292,    0,    0,    0,    0,  291,  293,  293,  293,
			  293,  293,  293,  296,  296,  296,  296,  296,  296,  295,
			  292,  295,  295,  295,  295,  295,  295,  297,  297,  297,
			  297,  297,  297,    0,  291,  298,  298,  298,  298,  298,
			  298,  299,  299,  299,  299,  299,  299,    0,  292,    0,
			  298,  297,  300,  300,  300,  300,  300,  300,    0,  301,
			  301,  301,  301,  301,  301,    0,  768,    0,  300,  299,
			  302,  302,  302,  302,  302,  302,    0,  768,  298,  297,
			  301,  303,  303,  303,  303,  303,  303,  768,  304,  304,

			  304,  304,  304,  304,    0,  769,  300,  299,  302,  305,
			  305,  305,  305,  305,  305,  768,  769,    0,  301,  303,
			  306,  306,  306,  306,  306,  306,  769,    0,    0,    0,
			  305,    0,    0,    0,  692,  693,  302,  304,  692,  693,
			    0,  306,  330,  330,  769,  330,    0,  303,  307,  307,
			  307,  307,  307,  307,  330,  692,  693,    0,  305,  308,
			  308,  308,  308,  308,  308,  330,  692,  693,  307,  306,
			    0,    0,    0,  308,  309,  309,  309,  309,  309,  309,
			  310,  310,  310,  310,  310,  310,  311,  311,  311,  311,
			  311,  311,    0,    0,    0,  330,  307,    0,    0,    0,

			    0,  308,  311,  312,  312,  312,  312,  312,  312,    0,
			  310,  313,  313,  313,  313,  313,  313,  314,  314,  314,
			  314,  314,  314,    0,    0,    0,  312,  313,    0,    0,
			  311,  315,  315,  315,  315,  315,  315,    0,  310,    0,
			    0,    0,    0,  314,  316,  316,  316,  316,  316,  316,
			    0,    0,    0,    0,  312,  313,    0,    0,  315,  317,
			  317,  317,  317,  317,  317,  318,  318,  318,  318,  318,
			  318,  314,  338,  338,  338,  338,  338,  338,  338,    0,
			    0,    0,    0,  316,    0,    0,  315,  345,  345,  345,
			  345,  345,  345,  798,  798,  798,  798,    0,  318,  346,

			  346,  346,  346,  346,  346,  347,  347,  347,  347,  347,
			  347,  349,  349,  349,  349,  349,  349,  350,  350,  350,
			  350,  350,  350,    0,    0,    0,    0,  318,    0,    0,
			    0,    0,  798,  350,  351,    0,  351,    0,  346,  351,
			  351,  351,  351,  351,  351,  352,  352,  352,  352,  352,
			  352,    0,    0,    0,    0,    0,  350,    0,    0,    0,
			    0,  350,  353,  353,  353,  353,  353,  353,  354,  354,
			  354,  354,  354,  354,  355,  355,    0,  355,  355,  355,
			  355,  355,  355,  356,  356,  356,  356,  356,  356,  357,
			  357,  357,  357,  357,  357,  362,  363,    0,    0,  365,

			    0,    0,  364,  778,    0,  366,    0,  354,    0,    0,
			    0,  362,  363,    0,  778,  365,    0,    0,  364,    0,
			  365,  366,  366,  362,  778,  362,  363,  362,  363,  365,
			  364,  365,  364,    0,  364,  366,    0,  366,  367,  362,
			  363,    0,  778,  365,    0,  368,  364,    0,  365,  366,
			  366,  362,    0,  369,  367,    0,  362,  363,  364,    0,
			  365,  368,    0,  364,  370,    0,  366,    0,  367,  369,
			  367,  371,    0,    0,  796,  368,  368,  368,    0,    0,
			  370,  370,  367,  369,  371,  369,  373,  371,    0,  368,
			    0,  796,    0,    0,  370,  796,  370,  369,  381,  367,

			  381,  371,  373,  371,  368,    0,  368,  373,  370,  370,
			  374,  369,  371,  375,  369,  371,  373,    0,  373,  796,
			    0,  381,    0,  377,  381,  370,  374,    0,  376,  375,
			  373,  381,  371,    0,  378,  373,    0,  375,    0,  377,
			  374,  374,  374,  375,  376,  375,    0,  373,  376,  381,
			  378,  377,  381,  377,  374,  377,    0,  375,  376,  694,
			  376,    0,  378,  694,  378,  375,  378,  377,    0,  374,
			    0,  374,  376,    0,  375,    0,  376,    0,  378,  377,
			  694,    0,    0,    0,  377,    0,    0,  391,    0,  376,
			  378,  694,    0,    0,    0,  378,  379,  379,  379,  379,

			  379,  379,  380,  391,  380,  380,  380,  380,  380,  380,
			  380,  382,  382,  382,  382,  382,  382,  391,    0,  391,
			    0,  383,    0,  383,  379,  383,  383,  383,  383,  383,
			  383,  391,  380,  384,  384,  384,  384,  384,  384,    0,
			  382,  385,  385,  385,  385,  385,  385,  383,  391,    0,
			    0,    0,  379,    0,  383,  384,  385,    0,    0,    0,
			  380,    0,    0,    0,    0,    0,  384,    0,    0,    0,
			  385,    0,    0,    0,    0,  383,  386,  386,  386,  386,
			  386,  386,    0,  384,  385,  387,  387,  387,  387,  387,
			  387,    0,  392,    0,    0,  384,  388,  388,  388,  388,

			  388,  388,  389,  389,  389,  389,  389,  389,  392,  386,
			  390,  390,  390,  390,  390,  390,  394,    0,    0,  395,
			    0,    0,  392,  779,  392,  396,    0,    0,    0,    0,
			    0,  389,  394,    0,  779,  395,  392,    0,  386,  390,
			    0,  396,    0,  397,  779,    0,  394,    0,  394,  395,
			  395,  395,    0,  392,    0,  396,  397,  396,    0,  397,
			  394,    0,  779,  395,  398,    0,  398,  397,    0,  396,
			    0,    0,    0,  397,    0,  397,    0,  394,  395,    0,
			  395,    0,  398,    0,  397,    0,  396,  397,  400,  400,
			  400,  400,  400,  400,  400,  397,  398,    0,  398,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,  397,    0,    0,    0,    0,  401,
			  398,  401,  401,  401,  401,  401,  401,  401,  402,    0,
			  402,  402,  402,  402,  402,  402,  402,  398,  403,    0,
			  403,  403,  403,  403,  403,  403,  403,  405,  405,  405,
			  405,  405,  405,    0,    0,    0,    0,    0,  401,  406,
			  406,  406,  406,  406,  406,    0,    0,  402,  407,  407,
			  407,  407,  407,  407,  405,    0,    0,  403,  408,  408,
			  408,  408,  408,  408,  409,  409,  409,  409,  409,  409,
			  406,  410,  410,  410,  410,  410,  410,    0,    0,    0,
			    0,    0,  405,  411,  411,  411,  411,  411,  411,  412,

			  412,  412,  412,  412,  412,    0,    0,    0,  410,  406,
			    0,    0,    0,  411,    0,  412,  413,  413,  413,  413,
			  413,  413,  414,  414,  414,  414,  414,  414,  415,  415,
			  415,  415,  415,  415,    0,    0,  410,    0,    0,    0,
			    0,  411,    0,  412,  416,  416,  416,  416,  416,  416,
			    0,    0,  414,    0,    0,    0,    0,  415,    0,    0,
			  416,  417,  417,  417,  417,  417,  417,  418,  418,  418,
			  418,  418,  418,  417,  419,  419,  419,  419,  419,  419,
			  414,    0,    0,    0,    0,  415,    0,  418,  416,  420,
			  420,  420,  420,  420,  420,  421,  421,  421,  421,  421,

			  421,  417,    0,    0,  419,    0,  422,  422,  422,  422,
			  422,  422,  420,    0,  421,  418,  423,  423,  423,  423,
			  423,  423,  424,  424,  424,  424,  424,  424,    0,    0,
			    0,    0,  419,  422,  425,  425,  425,  425,  425,  425,
			  420,    0,  421,  423,  426,  426,  426,  426,  426,  426,
			  427,  427,  427,  427,  427,  427,    0,    0,    0,    0,
			    0,  422,    0,    0,    0,  427,    0,    0,    0,    0,
			    0,  423,    0,    0,  426,  428,  428,  428,  428,  428,
			  428,  431,  431,  431,  431,  431,  431,  428,    0,    0,
			    0,    0,    0,  427,    0,    0,    0,    0,  428,    0,

			  429,    0,  426,  429,  429,  429,  429,  429,  429,  432,
			  432,  432,  432,  432,  432,  428,    0,    0,    0,    0,
			  431,    0,    0,    0,    0,    0,  428,  433,  433,  433,
			  433,  433,  433,  434,  434,  434,  434,  434,  434,  436,
			  436,  436,  436,  436,  436,  437,  437,  437,  437,  437,
			  437,    0,    0,    0,    0,  436,  438,  438,  438,  438,
			  438,  438,  439,  439,  439,  439,  439,  439,  440,  440,
			  440,  440,  440,  440,    0,    0,    0,    0,  436,    0,
			    0,    0,    0,  436,  441,  441,  441,  441,  441,  441,
			    0,    0,    0,    0,    0,  438,  443,  443,  443,  443,

			  443,  443,  449,  450,    0,    0,  444,  440,  444,  444,
			  444,  444,  444,  444,    0,    0,    0,  551,  449,  450,
			    0,  451,    0,    0,  452,  453,    0,    0,  454,    0,
			    0,  551,  449,  450,  449,  450,    0,  451,  451,    0,
			  452,  453,  551,  450,  454,    0,  449,  450,  452,    0,
			    0,  451,  551,  451,  452,  453,  452,  453,  454,    0,
			  454,  455,    0,  449,  450,  451,  451,  456,  452,  453,
			  551,  459,  454,    0,    0,    0,  452,  455,  455,    0,
			  457,    0,  451,  456,    0,  452,  453,  459,  459,  454,
			  455,  455,    0,  455,    0,    0,  457,  456,    0,  456,

			    0,  459,  457,  459,  460,  455,  455,  461,    0,    0,
			  457,  456,  457,    0,    0,  459,  459,  463,  455,    0,
			  460,    0,  455,  461,  457,  736,  462,    0,  456,    0,
			  457,    0,  459,  463,  460,    0,  460,  461,  736,  461,
			    0,  457,  462,  462,    0,  463,  736,  463,  460,  463,
			  464,  461,    0,    0,    0,    0,  462,    0,  462,  736,
			    0,  463,    0,    0,    0,  460,  464,  464,  461,    0,
			  462,  462,    0,  463,  736,    0,    0,    0,  463,    0,
			  464,    0,  464,    0,    0,    0,    0,  462,  467,  467,
			  467,  467,  467,  467,  464,  464,  468,  468,  468,  468,

			  468,  468,  469,  469,  469,  469,  469,  469,    0,    0,
			    0,  464,    0,    0,    0,    0,  470,  467,  470,  470,
			  470,  470,  470,  470,  470,    0,    0,  471,    0,  471,
			  469,  471,  471,  471,  471,  471,  471,    0,  474,  472,
			  472,  472,  472,  472,  472,    0,  470,  475,    0,    0,
			    0,    0,    0,  471,  474,  474,  476,    0,  469,  471,
			  471,  472,    0,  475,  475,    0,    0,    0,  474,    0,
			  474,    0,  476,    0,  470,    0,    0,  475,    0,  475,
			    0,  471,  474,  474,  476,    0,  476,  471,  476,  472,
			  477,  475,  475,  486,  486,  486,  486,  486,  486,  474,

			  476,    0,    0,    0,    0,    0,  477,    0,  475,    0,
			    0,    0,  476,    0,    0,  477,    0,  476,    0,    0,
			  477,    0,  477,  479,  479,  479,  479,  479,  479,  479,
			    0,    0,    0,  481,  477,  481,  481,  481,  481,  481,
			  481,  481,  482,  477,  482,  482,  482,  482,  482,  482,
			  482,  477,  483,    0,  483,  483,  483,  483,  483,  483,
			  483,  487,  487,  487,  487,  487,  487,    0,    0,    0,
			    0,  488,  481,  488,  488,  488,  488,  488,  488,    0,
			    0,  482,  489,  489,  489,  489,  489,  489,    0,    0,
			  491,  483,  491,  491,  491,  491,  491,  491,  491,    0,

			  487,  492,  492,  492,  492,  492,  492,    0,    0,    0,
			  488,  493,  493,  493,  493,  493,  493,  494,  494,  494,
			  494,  494,  494,    0,    0,    0,    0,  493,  495,  495,
			  495,  495,  495,  495,  496,  496,  496,  496,  496,  496,
			  494,    0,    0,  495,    0,    0,    0,    0,    0,  496,
			    0,    0,    0,    0,    0,  493,  497,  497,  497,  497,
			  497,  497,  498,  498,  498,  498,  498,  498,  494,    0,
			    0,  495,  497,    0,    0,    0,    0,  496,  499,  499,
			  499,  499,  499,  499,  497,  500,  500,  500,  500,  500,
			  500,  501,  501,  501,  501,  501,  501,    0,    0,  499,

			  497,  500,    0,    0,    0,    0,  501,    0,    0,    0,
			    0,    0,  497,  502,  502,  502,  502,  502,  502,  503,
			  503,  503,  503,  503,  503,    0,    0,  499,    0,  500,
			    0,    0,    0,    0,  501,  503,    0,  504,  504,  504,
			  504,  504,  504,  505,  505,  505,  505,  505,  505,  506,
			  506,  506,  506,  506,  506,    0,    0,    0,    0,  505,
			    0,    0,    0,  503,  504,  506,  507,  507,  507,  507,
			  507,  507,  508,  508,  508,  508,  508,  508,    0,    0,
			    0,    0,  507,    0,    0,    0,    0,  505,    0,    0,
			    0,    0,  504,  506,    0,    0,    0,    0,    0,  508, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  509,  509,  509,  509,  509,  509,    0,    0,    0,    0,
			  507,  511,  511,  511,  511,  511,  511,  513,  513,  513,
			  513,  513,  513,    0,  509,    0,  512,  508,  512,  512,
			  512,  512,  512,  512,  514,  514,  514,  514,  514,  514,
			  515,  515,  515,  515,  515,  515,    0,    0,    0,    0,
			  514,    0,  509,  516,  516,  516,  516,  516,  516,  517,
			  517,  517,  517,  517,  517,  512,  519,  519,  519,  519,
			  519,  519,  520,  520,  520,  520,  520,  520,  514,  515,
			  521,  521,  521,  521,  521,  521,  524,  524,  524,  524,
			  524,  524,  527,  528,    0,    0,  530,  529,    0,    0,

			    0,    0,  524,    0,    0,  527,    0,    0,  527,  528,
			  529,    0,  530,  529,    0,  531,    0,    0,  532,  533,
			    0,    0,  527,  528,  527,  528,  530,  529,  530,  529,
			  524,  531,  531,  527,  532,  533,  527,  528,  529,  534,
			  530,  529,  532,  749,    0,  531,    0,  531,  532,  533,
			  532,  533,  536,  527,  528,  534,  749,  530,  529,  531,
			  531,  534,  532,  533,  749,    0,    0,    0,  536,  534,
			  532,  534,    0,    0,  537,    0,  531,  749,  539,  532,
			  533,  536,  536,  534,  536,  538,    0,    0,    0,  534,
			  537,  537,  749,    0,  539,  539,  536,    0,    0,    0,

			  534,  538,    0,    0,  537,    0,  537,    0,  539,  536,
			  539,  540,    0,  536,  538,  538,    0,  538,  537,  537,
			    0,    0,  539,  539,    0,    0,    0,  540,    0,  538,
			    0,    0,  545,    0,    0,  537,    0,    0,    0,  539,
			    0,  540,  538,  540,    0,  541,  538,  541,  545,  541,
			  541,  541,  541,  541,  541,  540,    0,  546,  548,    0,
			    0,    0,  545,    0,  545,  547,  558,  558,  558,  558,
			  558,  558,  540,  546,  548,    0,  545,    0,  541,    0,
			  547,  547,    0,    0,    0,  546,    0,  546,  548,  546,
			  548,    0,    0,  545,    0,  547,    0,  547,    0,    0,

			    0,  546,  548,    0,    0,    0,    0,    0,  547,  547,
			    0,    0,    0,  546,    0,    0,    0,    0,  546,  548,
			  560,  560,  560,  560,  560,  560,  547,  552,  552,  552,
			  552,  552,  552,  552,  554,    0,  554,  554,  554,  554,
			  554,  554,  554,  555,    0,  555,  555,  555,  555,  555,
			  555,  555,  556,    0,  556,  556,  556,  556,  556,  556,
			  556,  557,    0,  557,  557,  557,  557,  557,  557,  557,
			    0,    0,    0,  554,  559,  559,  559,  559,  559,  559,
			    0,    0,  555,    0,    0,    0,  559,    0,    0,    0,
			    0,  556,  561,  561,  561,  561,  561,  561,    0,  563,

			  557,  563,  563,  563,  563,  563,  563,  564,  564,  564,
			  564,  564,  564,    0,  559,  565,  565,  565,  565,  565,
			  565,  566,  566,  566,  566,  566,  566,  565,  567,  567,
			  567,  567,  567,  567,  568,  568,  568,  568,  568,  568,
			    0,    0,    0,    0,  567,  569,  569,  569,  569,  569,
			  569,    0,    0,    0,    0,  565,    0,  568,  570,  570,
			  570,  570,  570,  570,  571,  571,  571,  571,  571,  571,
			    0,    0,  567,  572,  572,  572,  572,  572,  572,  570,
			    0,    0,    0,    0,    0,  568,    0,    0,    0,  572,
			    0,    0,  571,  573,  573,  573,  573,  573,  573,  574,

			  574,  574,  574,  574,  574,    0,    0,  570,  575,  575,
			  575,  575,  575,  575,    0,  574,    0,  572,    0,    0,
			  571,  573,    0,  575,  576,  576,  576,  576,  576,  576,
			  577,  577,  577,  577,  577,  577,  578,  578,  578,  578,
			  578,  578,    0,  574,    0,    0,    0,    0,    0,  573,
			  578,  575,    0,    0,    0,    0,    0,  577,  579,  579,
			  579,  579,  579,  579,  580,  580,  580,  580,  580,  580,
			    0,    0,    0,  579,    0,    0,    0,    0,  578,  581,
			  581,  581,  581,  581,  581,  577,  582,  582,  582,  582,
			  582,  582,    0,    0,    0,    0,    0,  584,    0,  584,

			    0,  579,  584,  584,  584,  584,  584,  584,  585,  585,
			  585,  585,  585,  585,  586,  586,  586,  586,  586,  586,
			  588,  588,  588,  588,  588,  588,  590,  590,  590,  590,
			  590,  590,  591,  591,  591,  591,  591,  591,  592,  592,
			  592,  592,  592,  592,  594,    0,    0,  585,  595,  596,
			    0,    0,    0,  597,  592,    0,    0,  598,    0,    0,
			  594,    0,    0,    0,  595,  596,    0,    0,  597,  597,
			  595,    0,  594,  598,  594,    0,  594,  592,  595,  596,
			  595,  596,  592,  597,    0,  597,    0,  598,  594,  598,
			  600,  601,  595,  596,    0,  602,  597,  597,  595,    0,

			  594,  598,    0,    0,    0,  594,  600,  601,    0,  595,
			  596,  602,    0,  603,  597,    0,  604,  652,  598,    0,
			  600,  601,  600,  601,    0,  602,    0,  602,    0,  603,
			    0,    0,  604,  652,  600,  601,    0,  603,  606,  602,
			    0,    0,    0,  603,    0,  603,  604,  652,  604,  652,
			    0,  600,  601,    0,  606,  606,  602,  603,    0,  607,
			  604,  652,    0,    0,  608,  603,    0,    0,  606,    0,
			  606,    0,    0,    0,  603,  607,    0,  604,  652,  607,
			  608,  608,  606,  606,    0,    0,    0,    0,    0,  607,
			    0,  607,    0,    0,  608,    0,  608,    0,    0,  606,

			    0,    0,    0,  607,    0,    0,    0,  607,  608,  608,
			  615,    0,  615,  615,  615,  615,  615,  615,  615,    0,
			  607,    0,    0,    0,  616,  608,  616,  616,  616,  616,
			  616,  616,  617,  617,  617,  617,  617,  617,  618,  618,
			  618,  618,  618,  618,    0,    0,    0,    0,  620,  615,
			  620,  620,  620,  620,  620,  620,  621,  621,  621,  621,
			  621,  621,    0,  616,    0,  618,    0,  622,  622,  622,
			  622,  622,  622,  623,  623,  623,  623,  623,  623,    0,
			  624,  624,  624,  624,  624,  624,    0,  620,  622,    0,
			    0,    0,    0,  618,  624,  625,  625,  625,  625,  625,

			  625,  626,  626,  626,  626,  626,  626,  627,  627,  627,
			  627,  627,  627,    0,    0,    0,  622,    0,    0,    0,
			    0,    0,  624,  628,  628,  628,  628,  628,  628,  629,
			  629,  629,  629,  629,  629,  630,  630,  630,  630,  630,
			  630,  631,  631,  631,  631,  631,  631,    0,    0,    0,
			    0,    0,  629,    0,    0,    0,    0,  631,  632,  632,
			  632,  632,  632,  632,    0,  633,  633,  633,  633,  633,
			  633,  636,  636,  636,  636,  636,  636,  632,    0,    0,
			  629,  633,    0,    0,  635,  631,  635,  635,  635,  635,
			  635,  635,  637,  637,  637,  637,  637,  637,  638,  638, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  638,  638,  638,  638,    0,  632,    0,    0,    0,  633,
			  639,  639,  639,  639,  639,  639,    0,    0,    0,  640,
			    0,  640,    0,  635,  640,  640,  640,  640,  640,  640,
			  642,  642,  642,  642,  642,  642,  644,  644,  644,  644,
			  644,  644,  646,    0,    0,    0,  647,  648,    0,    0,
			    0,    0,  644,    0,    0,    0,    0,  646,  646,    0,
			    0,    0,  647,  648,  648,    0,  650,  647,    0,    0,
			    0,    0,  646,    0,  646,  644,  647,  648,  647,  648,
			  644,  650,  650,    0,  653,  646,  646,    0,  654,    0,
			  647,  648,  648,    0,    0,  647,  650,    0,  650,    0,

			  653,  653,    0,  646,  654,    0,    0,  647,  648,  650,
			  650,    0,    0,    0,  653,    0,  653,    0,  654,    0,
			  654,  664,  664,  664,  664,  664,  664,  650,  653,  653,
			    0,    0,  654,  659,  659,  659,  659,  659,  659,  659,
			    0,    0,    0,    0,    0,  653,    0,    0,  662,  654,
			  662,  662,  662,  662,  662,  662,  662,  665,  665,  665,
			  665,  665,  665,  667,  667,  667,  667,  667,  667,  668,
			  668,  668,  668,  668,  668,    0,    0,  667,  669,  669,
			  669,  669,  669,  669,    0,    0,    0,  662,  684,  668,
			    0,  686,    0,    0,  669,  670,  670,  670,  670,  670,

			  670,    0,    0,    0,  684,  667,    0,  686,  684,  670,
			  671,  671,  671,  671,  671,  671,    0,  668,  684,    0,
			  684,  686,  669,  686,    0,  671,  672,  672,  672,  672,
			  672,  672,  684,    0,    0,  686,  684,  670,    0,    0,
			    0,    0,  672,  673,  673,  673,  673,  673,  673,  684,
			    0,    0,  686,  671,  675,  675,  675,  675,  675,  675,
			  676,  676,  676,  676,  676,  676,    0,    0,    0,    0,
			  672,  677,  677,  677,  677,  677,  677,  678,  678,  678,
			  678,  678,  678,  679,  679,  679,  679,  679,  679,  680,
			  680,  680,  680,  680,  680,    0,  685,  687,    0,  676,

			  682,  682,  682,  682,  682,  682,  689,    0,    0,    0,
			    0,    0,  685,  687,  687,  690,  682,    0,    0,    0,
			    0,    0,  689,    0,    0,    0,  685,  687,  685,  687,
			    0,  690,    0,    0,    0,    0,  689,    0,  689,  682,
			  685,  687,  687,    0,  682,  690,    0,  690,    0,    0,
			  689,    0,    0,    0,  685,    0,    0,  685,  687,  690,
			  700,  700,  700,  700,  700,  700,    0,  689,    0,    0,
			    0,    0,    0,  690,    0,  695,  690,  695,  695,  695,
			  695,  695,  695,  695,  697,    0,  697,  697,  697,  697,
			  697,  697,  697,  699,    0,  699,  699,  699,  699,  699,

			  699,  701,  701,  701,  701,  701,  701,  702,  702,  702,
			  702,  702,  702,    0,  695,    0,    0,  713,    0,    0,
			  701,    0,    0,  697,  703,  703,  703,  703,  703,  703,
			    0,    0,  699,  713,  713,    0,  702,  704,  704,  704,
			  704,  704,  704,    0,    0,    0,    0,  713,  701,  713,
			    0,    0,    0,  704,  705,  705,  705,  705,  705,  705,
			    0,  713,  713,    0,  702,  706,  706,  706,  706,  706,
			  706,  707,  707,  707,  707,  707,  707,  714,  713,    0,
			    0,  704,  709,  709,  709,  709,  709,  709,    0,    0,
			  710,    0,  710,  714,  706,  710,  710,  710,  710,  710,

			  710,  711,  711,  711,  711,  711,  711,  714,    0,  714,
			  707,  714,  715,    0,    0,  716,    0,    0,    0,    0,
			    0,  714,  706,    0,    0,    0,    0,    0,  715,  710,
			    0,  716,  727,  727,  727,  727,  727,  727,  714,    0,
			  714,  715,  715,    0,  715,  716,    0,  716,    0,  716,
			  722,  722,  722,  722,  722,  722,  715,    0,    0,  716,
			  723,  723,  723,  723,  723,  723,  722,    0,    0,  715,
			    0,    0,    0,  715,    0,    0,  716,    0,  716,  724,
			  724,  724,  724,  724,  724,  725,  725,  725,  725,  725,
			  725,    0,    0,  723,  722,  730,  731,    0,    0,  732,

			    0,    0,    0,    0,  733,    0,    0,  724,    0,    0,
			    0,  730,  731,    0,    0,  732,    0,    0,  725,    0,
			  733,    0,  723,    0,    0,  730,  731,  730,  731,  732,
			  733,  732,    0,    0,  733,  724,  733,    0,    0,  730,
			  731,    0,    0,  732,    0,    0,    0,  725,  733,    0,
			    0,    0,    0,  730,    0,    0,  730,  731,  733,    0,
			  732,    0,    0,    0,    0,  733,  737,  737,  737,  737,
			  737,  737,  738,  738,  738,  738,  738,  738,  739,  739,
			  739,  739,  739,  739,  740,  740,  740,  740,  740,  740,
			    0,    0,  745,    0,    0,  737,  741,  741,  741,  741,

			  741,  741,  742,  742,  742,  742,  742,  742,  745,  740,
			  744,  744,  744,  744,  744,  744,  746,    0,    0,    0,
			    0,    0,  745,  737,  745,    0,  745,    0,    0,    0,
			    0,    0,  746,  746,    0,    0,  745,  740,  750,  750,
			  750,  750,  750,  750,    0,    0,  746,    0,  746,    0,
			    0,    0,    0,  745,    0,  745,    0,    0,    0,    0,
			  746,  746,  751,  751,  751,  751,  751,  751,    0,    0,
			    0,  750,    0,    0,    0,  754,    0,  746,  751,  753,
			  755,  753,  753,    0,  753,  753,  753,  753,  753,  753,
			    0,  754,    0,    0,    0,    0,  755,    0,    0,    0,

			  750,  754,    0,    0,    0,  754,  751,  754,    0,    0,
			  755,    0,  755,  759,  759,  759,  759,  759,  759,  754,
			    0,    0,    0,    0,  755,    0,    0,    0,    0,  754,
			  760,  760,  760,  760,  760,  760,  754,    0,  759,    0,
			    0,  755,  761,  761,  761,  761,  761,  761,  764,  764,
			  764,  764,  764,  764,  766,  766,  766,  766,  766,  766,
			  767,    0,    0,    0,    0,    0,  759,  770,  770,  770,
			  770,  770,  770,    0,    0,    0,  767,  767,    0,    0,
			    0,    0,    0,  770,  771,  771,  771,  771,  771,  771,
			  767,    0,  767,  772,  772,  772,  772,  772,  772,    0,

			    0,    0,    0,    0,  767,  767,  764,    0,    0,    0,
			    0,  770,  773,  773,  773,  773,  773,  773,    0,    0,
			    0,  767,  774,  774,  774,  774,  774,  774,  776,  777,
			  776,  776,    0,  776,  776,  776,  776,  776,  776,  780,
			  780,  780,  780,  780,  780,  777,  781,  781,  781,  781,
			  781,  781,  783,  783,  783,  783,  783,  783,    0,  777,
			    0,  777,  786,  786,  786,  786,  786,  786,    0,    0,
			    0,    0,    0,  777,  787,  787,  787,  787,  787,  787,
			  793,  793,  793,  793,  793,  793,  790,    0,  790,    0,
			  777,  790,  790,  790,  790,  790,  790,  794,  794,  794, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  794,  794,  794,  797,  797,  797,  797,  797,  797,  801,
			  801,  801,  801,  801,  801,  802,  802,  802,  802,  802,
			  802,  803,  803,  803,  803,  803,  803,  805,  805,  805,
			  805,  805,  805,  806,    0,  806,    0,    0,  806,  806,
			  806,  806,  806,  806,  807,  807,  807,  807,  807,  807,
			  808,  808,  808,  808,  808,  808,  815,  815,  815,  815,
			  815,  815,  815,  845,  845,  845,  845,  845,  845,  845,
			    0,    0,  806,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,

			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  813,  813,    0,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,    0,  813,  813,  813,  813,
			  813,  814,  814,    0,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,

			  814,  814,  814,  814,  814,  814,  814,  814,  817,  817,
			  817,    0,    0,    0,    0,    0,  817,  817,  817,    0,
			  817,  817,  817,  817,  817,  817,  817,    0,    0,    0,
			  817,  817,  817,  818,  818,    0,  818,    0,  818,  818,
			    0,    0,  818,  818,  818,  818,  818,  818,  818,    0,
			    0,    0,  818,  818,  818,  819,  819,    0,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  820,    0,  820,  820,    0,    0,    0,  820,
			  820,  820,    0,    0,  820,  820,  820,  820,  820,  820,

			  820,  820,    0,    0,  820,  820,  820,  821,  821,    0,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,    0,  821,
			  821,  821,  821,  821,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  824,    0,
			  824,    0,    0,    0,  824,    0,  824,  824,    0,    0,

			  824,  824,  824,  824,  824,  824,  824,    0,    0,  824,
			  824,  824,  824,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  827,  827,    0,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  828,    0,    0,    0,  828,  828,

			    0,    0,  828,  828,  828,  828,  828,  828,  828,    0,
			    0,    0,  828,  828,  828,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  830,  830,  830,    0,    0,  830,  830,  830,
			  830,  830,  830,  830,  830,    0,    0,  830,  830,  830,
			  831,    0,    0,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,    0,    0,    0,  831,  831,  831,
			  833,  833,  833,  833,  833,  833,  833,  833,    0,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,

			  833,  833,  833,  833,  833,  833,  833,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  836,  836,  836,    0,    0,    0,    0,    0,    0,
			    0,    0,  836,  836,  836,  836,  836,  836,  836,  836,
			    0,    0,    0,  837,  837,    0,  836,  837,  837,  837,
			  837,  837,  837,  837,    0,    0,    0,  837,  837,  837,

			  838,  838,    0,    0,  838,  838,  838,  838,  838,  838,
			  838,    0,    0,    0,  838,  838,  838,  839,  839,  839,
			    0,    0,  839,  839,  839,  839,  839,  839,  839,  839,
			    0,    0,  839,  839,  839,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  841,  841,  841,  841,  841,  841,  841,    0,
			    0,    0,  841,  841,  841,  842,  842,  842,  842,  842,
			  842,  842,    0,    0,    0,  842,  842,  842,  843,  843,
			    0,    0,  843,  843,  843,  843,  843,  843,  843,    0,

			    0,    0,  843,  843,  843,  844,  844,    0,    0,  844,
			  844,  844,  844,  844,  844,  844,    0,    0,    0,  844,
			  844,  844,  846,  846,  846,  846,  846,  846,  846,    0,
			    0,  847,  846,  846,  846,  847,  847,    0,    0,  847,
			  847,  847,  847,  847,  847,  847,    0,    0,    0,  847,
			  847,  847,  848,  848,    0,    0,  848,  848,  848,  848,
			  848,  848,  848,    0,    0,    0,  848,  848,  848,  849,
			  849,    0,    0,  849,  849,  849,  849,  849,  849,  849,
			    0,    0,    0,  849,  849,  849,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809, yy_Dummy>>,
			1, 978, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,  185,    0,   66,
			   70,  970, 6886,   98,  965,  939,  955, 6886,   90,    0,
			 6886, 6886, 6886, 6886,  946,   88,  940,   98,  263, 6886,
			 6886,  920, 6886,  916, 6886,  286,  290,  296,  120,  306,
			  334,  341,  356,  312,  345,  363,  435,  443,  424,  372,
			  415,  873, 6886, 6886,  874,  487,  457,  507,  411,  525,
			  531,  542,  553,  566,  595,  606,  608,  629,  630,  639,
			  911, 6886, 6886,  917,  122, 6886,   98,  295,  271,  326,
			  298,  387,  111, 6886,   96,  116, 6886,  285,  919,  653,
			  476, 6886,  268,  718, 6886,  132,  914, 6886,  909, 6886,

			  905,    0,  717,  886,  893,  853,  754, 6886,  118,  138,
			  760,  784,  666,  805, 6886, 6886,  136,  691,    0,  827,
			  794,  832,  852,  868,  883,  903,  918,  943,  949,  983,
			  987, 1003, 1018, 1023, 1038, 1063, 1078,  783, 1126, 1104,
			 1129, 1190,   96,  100, 1137, 1172, 1205, 1039, 1212, 1223,
			  839,  419,  804, 6886,  308,  848,    0, 1276, 1292, 1308,
			 1325,  781, 1385, 1333, 1392, 1351,  917, 1404, 1410, 1433,
			  709, 1425, 1439, 1361, 1461, 1467, 1497, 1504, 1512, 1529,
			 1540, 1549, 1567, 1573, 6886,  831, 6886,  302, 6886, 6886,
			  622,  578,  805, 1030, 1041,  277, 6886,  777,  446,  345,

			  758,  422,  741, 6886,  367, 1133, 6886,  790, 1595,  161,
			 1653,  170,  377, 1743, 6886, 6886,  763,  812, 6886, 6886,
			 6886,  780, 1596,  778,  776,  775,  725,  564,  386, 6886,
			 1611, 1482, 1665,  707,  660, 1671, 1692, 1682, 1702,  413,
			 1709, 6886,    0,    0,  692,  686, 1272, 1780, 1265, 1781,
			 1784, 1791, 1785, 1827, 1837, 1860, 1838,  947, 1863, 1884,
			 1909, 1903, 1910, 1936, 1943, 6886, 1742, 1980, 2005, 1988,
			 1997, 2011, 2021, 2027, 2039, 2040,  803, 1136, 2040, 2047,
			 2065, 2073, 2083, 2106, 2086, 2119,  681, 2153, 2167, 6886,
			  430, 2182, 2188, 2199,  629, 2213, 2205, 2219, 2227, 2233,

			 2244, 2251, 2262, 2273, 2280, 2291, 2302, 2330, 2341, 2356,
			 2362, 2368, 2385, 2393, 2399, 2413, 2426, 2441, 2447, 1096,
			  321, 1280,  495, 1313, 1355, 1427,  280, 6886,  642,  692,
			 2340, 6886,  518,  612,  677,  898, 6886, 6886, 2455, 6886,
			 6886, 6886, 6886, 6886,  472, 2469, 2481, 2487,  601, 2493,
			 2499, 2521, 2527, 2544, 2550, 2559, 2565, 2571,  656,  377,
			    0,  641, 2578, 2579, 2585, 2582, 2588, 2621, 2628, 2636,
			 2647, 2654,  964, 2669, 2693, 2696, 2711, 2706, 2717, 2778,
			 2786, 2684, 2793, 2807, 2815, 2823, 2858, 2867, 2878, 2884,
			 2892, 2770, 2875, 1068, 2899, 2902, 2908, 2926, 2949,  298,

			 2970, 2993, 3002, 3012,  599, 3019, 3031, 3040, 3050, 3056,
			 3063, 3075, 3081, 3098, 3104, 3110, 3126, 3143, 3149, 3156,
			 3171, 3177, 3188, 3198, 3204, 3216, 3226, 3232, 3257, 3285,
			 6886, 3263, 3291, 3309, 3315,  636, 3321, 3327, 3338, 3344,
			 3350, 3366,  520, 3378, 3390, 1109,  387,    0,    0, 3385,
			 3386, 3404, 3407, 3408, 3411, 3444, 3450, 3463,  619, 3454,
			 3487, 3490, 3509, 3500, 3533, 6886,  527, 3570, 3578, 3584,
			 3600, 3613, 3621, 1516, 3621, 3630, 3639, 3673, 1771, 3705,
			  672, 3717, 3726, 3736,  720,  561, 3675, 3743, 3755, 3764,
			  529, 3774, 3783, 3793, 3799, 3810, 3816, 3838, 3844, 3860,

			 3867, 3873, 3895, 3901, 3919, 3925, 3931, 3948, 3954, 3982,
			  541, 3993, 4010, 3999, 4016, 4022, 4035, 4041,  531, 4048,
			 4054, 4062,  723, 6886, 4068,    0,  567, 4075, 4076, 4080,
			 4079, 4098, 4101, 4102, 4122,  580, 4135, 4157, 4168, 4161,
			 4194, 4231, 6886,  533,  553, 4215, 4240, 4248, 4241, 1775,
			 1899, 3402, 4309,  870, 4318, 4327, 4336, 4345, 4248, 4356,
			 4302, 4374,  555, 4383, 4389, 4397, 4403, 4410, 4416, 4427,
			 4440, 4446, 4455, 4475, 4481, 4490, 4506, 4512, 4518, 4540,
			 4546, 4561, 4568,  515, 4584, 4590, 4596,  898, 4602,  510,
			 4608, 4614, 4620,  502, 4627, 4631, 4632, 4636, 4640,  950,

			 4673, 4674, 4678, 4696, 4699, 1150, 4721, 4742, 4747,  499,
			  496,  492,  490,  636,    0, 4794, 4808, 4814, 4820,   99,
			 4832, 4838, 4849, 4855, 4862, 4877, 4883, 4889, 4905, 4911,
			 4917, 4923, 4940, 4947,  264, 4968, 4953, 4974, 4980, 4992,
			 5006, 1454, 5012, 1622, 5018,    0, 5025, 5029, 5030, 6886,
			 5049, 1203, 4700, 5067, 5071, 1828, 1911, 2036, 2041, 5115,
			 6886,  476, 5132,  877, 5103, 5139,  468, 5145, 5151, 5160,
			 5177, 5192, 5208, 5225,  392, 5236, 5242, 5253, 5259, 5265,
			 5271, 6886, 5282,    0, 5171, 5279, 5174, 5280, 6886, 5289,
			 5298, 2108, 2305, 2306, 2730, 5359, 1190, 5368,  587, 5377,

			 5342, 5383, 5389, 5406, 5419, 5436, 5447, 5453,  372, 5464,
			 5477, 5483,  571, 5400, 5460, 5495, 5498,  404, 6886,  586,
			  370, 6886, 5532, 5542, 5561, 5567,  826, 5514,    0,  264,
			 5578, 5579, 5582, 5587, 1040, 1770, 3509, 5648, 5654, 5660,
			 5666, 5678, 5684,  686, 5692, 5675, 5699, 1853, 2092, 4127,
			 5720, 5744, 1252, 5766, 5758, 5763,  305,  299,  604, 5795,
			 5812, 5824, 1748, 6886, 5830,  100, 5836, 5843, 2247, 2276,
			 5849, 5866, 5875, 5894, 5904,  107, 5915, 5912, 2574, 2894,
			 5921, 5928, 1333, 5934,  123,  118, 5944, 5956, 2174, 6886,
			 5973, 1552, 1575, 5962, 5979, 1598, 2645, 5985, 2480, 6886,

			 6886, 5991, 5997, 6003, 6886, 6009, 6020, 6026, 6032, 6886,
			 6072, 6099, 6126, 6153, 6180, 6042,  886, 6206, 6228, 6254,
			 6280, 6306, 6333, 6360, 6386, 6412, 6439, 6466, 6488, 6514,
			 6533, 6553, 1026, 6579, 6606, 6633, 6659, 6673, 6690, 6708,
			 6734, 6748, 6761, 6778, 6795, 6049, 6808, 6825, 6842, 6859, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  809,    1,  810,  810,  811,  811,  809,    7,  812,
			  812,  809,  809,  809,  809,  809,  813,  809,  814,  815,
			  809,  809,  809,  809,  809,  809,  816,  809,  809,  809,
			  809,  809,  809,  809,  809,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  818,  809,  809,  819,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  809,  809,  809,  821,  809,  809,  809,  821,  821,  821,
			  821,  821,  822,  809,  823,  822,  809,  824,  809,  824,
			  824,  809,  825,  826,  809,  809,  809,  809,  813,  809,

			  827,  827,  827,  828,  829,  809,  809,  809,  830,  809,
			  809,  809,  809,  809,  809,  809,  809,  817,  831,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  809,   46,  817,
			  817,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  818,  818,  819,  809,  809,  809,  832,  820,  820,  820,
			  820,  809,  820,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  809,  821,  809,  809,  809,  809,
			  821,  821,  821,  821,  821,  822,  809,  833,  822,  823,

			  834,  823,  833,  809,  824,  824,  809,  809,  809,  809,
			  835,  809,  825,  826,  809,  809,  213,  836,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  816,  809,  809,  809,  809,  809,  809,
			  809,  809,  837,  838,  809,  831,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  809,  140,  140,
			  140,  140,  140,  140,  140,  809,  809,  838,  140,  268,
			  268,  268,  268,  141,  141,  141,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  809,  818,  818,  809,
			  839,  162,  162,  162,  809,  162,  162,  162,  162,  162,

			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  821,
			  821,  821,  821,  821,  821,  821,  833,  809,  834,  840,
			  840,  809,  840,  840,  840,  836,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  837,  838,
			  841,  831,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  809,  140,  140,  140,  140,  140,  140,  809,
			  838,  268,  268,  268,  138,  268,  138,  809,  838,  268,
			  268,  140,  140,  809,  140,  140,  140,  140,  140,  809,

			  818,  818,  818,  818,  809,  162,  162,  809,  838,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  842,  843,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  809,  140,
			  140,  140,  140,  140,  140,  809,  838,  268,  268,  809,
			  838,  268,  471,  809,  140,  140,  140,  140,  837,  818,
			  809,  818,  818,  818,  809,  809,  162,  162,  809,  809,
			  838,  838,  162,  162,  162,  162,  162,  162,  162,  162,

			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  844,  843,  140,  140,  140,
			  140,  140,  140,  140,  140,  809,  140,  140,  140,  140,
			  140,  268,  809,  838,  809,  140,  140,  140,  140,  809,
			  837,  837,  818,  809,  818,  818,  818,  818,  809,  162,
			  809,  809,  809,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  844,  140,  140,  140,  140,  140,  809,

			  140,  140,  140,  140,  140,  809,  140,  140,  140,  809,
			  809,  837,  837,  818,  845,  818,  809,  809,  162,  809,
			  809,  809,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  846,  140,  140,  140,  809,
			  140,  809,  140,  140,  140,  809,  809,  842,  842,  818,
			  809,  847,  818,  809,  809,  809,  809,  162,  162,  162,
			  162,  162,  162,  162,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  848,  140,  140,  140,  140,  809,  140,
			  140,  809,  809,  844,  844,  818,  809,  818,  809,  809,

			  809,  162,  162,  162,  162,  162,  162,  809,  809,  809,
			  809,  809,  848,  140,  140,  140,  140,  809,  809,  844,
			  844,  809,  162,  162,  162,  162,  809,  809,  849,  809,
			  140,  140,  140,  140,  809,  809,  844,  162,  162,  162,
			  162,  809,  809,  849,  809,  140,  140,  809,  809,  844,
			  162,  162,  809,  809,  140,  140,  809,  809,  844,  162,
			  162,  809,  809,  809,  809,  809,  809,  140,  809,  809,
			  162,  809,  809,  809,  809,  809,  809,  140,  809,  809,
			  162,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,    0,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809, yy_Dummy>>)
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
			    0,    0,    0,  106,    0,    0,    0,   98,   98,   98,
			   98,    0,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   39,   98,   98,
			   98,   98,   98,   98,  101,  119,  121,  120,  117,  116,
			  118,  119,  119,  119,  119,  102,  105,    0,  102,    0,

			    0,    0,  103,  104,    0,    0,   70,   68,    0,   67,
			    0,   66,    0,    0,   94,   92,   92,    0,   93,  129,
			  123,  129,  129,  129,  129,  129,  129,    0,    4,   33,
			  113,    0,    0,    0,    0,    0,  109,    0,  107,    0,
			    0,   89,    0,    0,    0,    0,   95,   95,   38,   95,
			   95,   95,   95,   95,   95,   95,   95,    0,   95,   95,
			   95,   95,   41,   95,   95,   87,    0,    0,   80,   81,
			   80,   80,   80,   88,   95,   88,   88,   88,   95,   95,
			   95,   95,   95,   95,   40,   95,    0,    0,    0,   97,
			  100,   98,   98,   38,    0,   63,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   41,
			   98,   98,   98,   98,   98,   98,   98,   40,   98,  119,
			  119,  119,  119,  119,  119,  119,    0,  103,  104,    0,
			    0,   69,   67,   66,   70,    0,  127,  130,  130,  128,
			  124,  125,  126,   90,  113,    0,  113,    0,    0,    0,
			  109,    0,    0,    0,  112,  107,    0,    0,    0,    0,
			    0,   96,   95,   95,   95,   95,   95,   37,   95,   95,
			   95,   95,    0,   95,   95,   95,   95,   95,   95,    0,
			    0,   95,   79,   95,   95,   95,   95,    0,    0,   79,
			   79,   79,   36,    0,   43,   95,   95,   95,   95,   65,

			    0,    0,    0,    0,    0,   98,   98,    0,    0,   98,
			   98,   98,   98,   37,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   36,   43,   98,   98,   98,   98,
			  104,  113,    0,    0,    0,  108,  109,    0,  110,    0,
			  112,    0,    0,    0,  107,   76,    0,    0,    0,   58,
			   95,   95,   95,   95,   95,   95,   44,   95,    0,   95,
			   95,   35,   95,   95,   95,   81,   81,   81,   80,    0,
			    0,   95,   95,    0,   95,   95,   95,   95,    0,    0,
			    0,    0,    0,    0,   62,    0,   58,   98,    0,    0,
			   63,   63,   98,   98,   98,   98,   98,   98,   44,   98,

			   98,   98,   35,   98,   98,   98,   98,   98,   98,   98,
			  113,    0,    0,    0,  109,  110,    0,    0,  112,    0,
			    0,    0,    0,   76,    0,    0,    0,   95,   59,   95,
			   60,   95,   95,   46,   95,    0,   95,   95,   95,   95,
			   95,   95,   79,   79,    0,   52,   95,   95,   95,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   98,
			    0,    0,    0,   63,   59,   98,   60,   98,   98,   46,
			   98,   98,   98,   98,   98,   98,   52,   98,   98,   98,
			    0,    0,    0,   99,    0,  110,    0,  113,    0,   78,
			    0,    0,  111,    0,   95,   95,   57,   95,   45,    0,

			   42,   56,   34,   95,   50,    0,   95,   95,   95,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   98,    0,
			    0,    0,   98,   57,   98,   45,   42,   56,   34,   98,
			   50,   98,   98,   98,    0,    0,    0,    0,  110,    0,
			    0,    0,    0,   75,  111,    0,   95,   95,   95,   84,
			   95,    0,   95,   95,   53,    0,    0,    0,    0,    0,
			   64,    0,    0,   61,    0,    0,  100,   98,   98,   98,
			   98,   98,   98,   53,  112,    0,  112,    0,    0,    0,
			    0,   75,  111,    0,   95,   95,   47,   95,   83,   51,
			   95,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,   98,   98,   47,   98,   51,   98,  112,   77,    0,
			   75,  111,    0,   95,   95,   95,   95,   82,   82,   82,
			   82,   91,   98,   98,   98,   98,    0,    0,    0,    0,
			   95,   49,   48,   95,    0,    0,    0,   98,   49,   48,
			   98,    0,    0,    0,    0,   95,   95,    0,    0,    0,
			   98,   98,   74,   71,   95,   54,    0,    0,    0,   98,
			   54,    0,    0,   74,    0,    0,    0,   95,    0,    0,
			   98,    0,    0,   71,    0,    0,   71,   55,    0,    0,
			   55,    0,   73,    0,    0,    0,    0,    0,    0,   73,
			   71,    0,    0,    0,    0,    0,    0,    0,   72,   85,

			   86,    0,    0,    0,   72,    0,   72,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6886
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 809
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 810
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
