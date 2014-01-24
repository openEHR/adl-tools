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
--|#line 80 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 80")
end
-- Ignore separators
else
--|#line 81 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 81")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 86 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 86")
end
-- Ignore comments
else
--|#line 87 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 87")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 91 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 91")
end
last_token := Minus_code
else
--|#line 92 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 92")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 93 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 93")
end
last_token := Star_code
else
--|#line 94 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 94")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 95 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 95")
end
last_token := Caret_code
else
--|#line 96 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 96")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 97 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 97")
end
last_token := Dot_code
else
--|#line 98 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 98")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 99 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 99")
end
last_token := Comma_code
else
--|#line 100 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 100")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 101 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 101")
end
last_token := Exclamation_code
else
--|#line 102 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 102")
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
--|#line 103 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 103")
end
last_token := Right_parenthesis_code
else
--|#line 104 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 104")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 106 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 106")
end
last_token := Question_mark_code
else
--|#line 108 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 108")
end
last_token := SYM_INTERVAL_DELIM
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 110 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 110")
end
last_token := Left_bracket_code
else
--|#line 111 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 111")
end
last_token := Right_bracket_code
end
else
if yy_act = 23 then
--|#line 113 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 113")
end
last_token := SYM_START_CBLOCK
else
--|#line 114 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 114")
end
last_token := SYM_END_CBLOCK
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 116 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 116")
end
last_token := SYM_GE
else
--|#line 117 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 117")
end
last_token := SYM_LE
end
else
if yy_act = 27 then
--|#line 118 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 118")
end
last_token := SYM_NE
else
--|#line 120 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 120")
end
last_token := SYM_LT
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 121 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 121")
end
last_token := SYM_GT
else
--|#line 123 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 123")
end
last_token := SYM_MODULO
end
else
if yy_act = 31 then
--|#line 124 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 124")
end
last_token := SYM_DIV
else
--|#line 126 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 126")
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
--|#line 127 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 127")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 131 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 131")
end
last_token := SYM_MATCHES
end
else
if yy_act = 35 then
--|#line 133 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 133")
end
last_token := SYM_MATCHES
else
--|#line 137 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 137")
end
last_token := SYM_THEN
end
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 139 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 139")
end
last_token := SYM_ELSE
else
--|#line 141 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 141")
end
last_token := SYM_AND
end
else
if yy_act = 39 then
--|#line 143 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 143")
end
last_token := SYM_OR
else
--|#line 145 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 145")
end
last_token := SYM_XOR
end
end
end
else
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 147 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 147")
end
last_token := SYM_NOT
else
--|#line 149 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 149")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 43 then
--|#line 151 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 151")
end
last_token := SYM_TRUE
else
--|#line 153 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 153")
end
last_token := SYM_FALSE
end
end
else
if yy_act <= 46 then
if yy_act = 45 then
--|#line 155 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 155")
end
last_token := SYM_FORALL
else
--|#line 157 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 157")
end
last_token := SYM_EXISTS
end
else
if yy_act = 47 then
--|#line 161 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 161")
end
last_token := SYM_EXISTENCE
else
--|#line 163 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 163")
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
--|#line 165 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 165")
end
last_token := SYM_CARDINALITY
else
--|#line 167 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 167")
end
last_token := SYM_ORDERED
end
else
if yy_act = 51 then
--|#line 169 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 169")
end
last_token := SYM_UNORDERED
else
--|#line 171 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 171")
end
last_token := SYM_UNIQUE
end
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 173 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 173")
end
last_token := SYM_USE_NODE
else
--|#line 175 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 175")
end
last_token := SYM_USE_ARCHETYPE
end
else
if yy_act = 55 then
--|#line 177 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 177")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 179 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 179")
end
last_token := SYM_INCLUDE
end
end
end
else
if yy_act <= 60 then
if yy_act <= 58 then
if yy_act = 57 then
--|#line 181 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 181")
end
last_token := SYM_EXCLUDE
else
--|#line 183 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 183")
end
last_token := SYM_AFTER
end
else
if yy_act = 59 then
--|#line 185 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 185")
end
last_token := SYM_BEFORE
else
--|#line 187 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 187")
end
last_token := SYM_CLOSED
end
end
else
if yy_act <= 62 then
if yy_act = 61 then
--|#line 190 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 190")
end

			last_token := V_URI
			last_string_value := text
		
else
--|#line 197 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 197")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
else
--|#line 203 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 203")
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
--|#line 210 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 210")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 218 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 218")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 66 then
--|#line 234 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 234")
end

		in_buffer.append_string (text_substring (2, text_count))
		set_start_condition (IN_VALUE_SET_DEF)
		term_code_count := 0
		assumed_term_code_index := 0
	
else
--|#line 242 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 242")
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
--|#line 249 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 249")
end
	-- match any line, with ',' termination
		str_ := text
		in_buffer.append(text)
		term_code_count := term_code_count + 1
	
else
--|#line 256 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 256")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 70 then
--|#line 259 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 259")
end
in_lineno := in_lineno + 1
else
--|#line 261 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 261")
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
--|#line 283 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 283")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 290 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 291 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 291")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 292 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 292")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 299 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 299")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 300 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 300")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 307 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 307")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 308 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 308")
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
--|#line 315 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 315")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 316 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 316")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 82 then
--|#line 328 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 328")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 338 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 338")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 343 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 343")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 353 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 353")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 86 then
--|#line 359 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 359")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 370 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 370")
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
--|#line 379 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 379")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 385 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 385")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 90 then
--|#line 391 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 391")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 397 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 397")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 404 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 404")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 410 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 410")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
end
else
if yy_act = 94 then
--|#line 416 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 416")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
else
--|#line 422 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 422")
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
--|#line 429 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 429")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 433 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 433")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
else
if yy_act = 98 then
--|#line 437 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 437")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 441 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 441")
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
--|#line 453 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 453")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 460 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 460")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 102 then
--|#line 465 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 465")
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
--|#line 480 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 480")
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
--|#line 481 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 481")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 485 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 485")
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
--|#line 486 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 486")
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
--|#line 487 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 487")
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
--|#line 507 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 507")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 512 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 512")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
if yy_act = 110 then
--|#line 520 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 520")
end
in_buffer.append_character ('\')
else
--|#line 522 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 522")
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
--|#line 524 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 524")
end

				in_buffer.append_string (text)
	
else
--|#line 528 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 528")
end
in_buffer.append_string (text)
end
else
if yy_act = 114 then
--|#line 530 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 530")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
--|#line 535 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 535")
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
--|#line 546 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 546")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 555 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 555")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 118 then
--|#line 557 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 557")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 558 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 558")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
end
else
if yy_act <= 123 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 559 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 559")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 560 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 560")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 122 then
--|#line 561 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 561")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 563 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 563")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 125 then
if yy_act = 124 then
--|#line 564 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 564")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 568 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 568")
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
			create an_array.make_filled (0, 0, 5131)
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
			   10,   10,   10,   72,   81,   96,   81,   73,   72,  579,

			  579,   90,   73,   90,   90,   99,  208,  100,  100,  100,
			  100,  100,  100,  103,  111,  104,  111,  105,  105,  105,
			  105,  105,  105,  112,  115,  111,  111,  113,  111,  114,
			   82,   83,   82,   83,  111,  111,  122,  137,  116,  126,
			   97,  175,  123,  124,   74,  138,  144,  117,  125,   74,
			  859,  112,  115,  209,  145,  113,  106,  114,  207,  229,
			  207,  207,  229,  858,  122,  137,  116,  126,  841,  176,
			  123,  124,  842,  138,  231,  117,  125,  231,   75,   76,
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
			  167,  111,  111,  111,  118,  299,  120,  128,  836,  127,

			  202,  168,  393,  111,  184,  119,  111,  186,  121,  141,
			  129,   90,  428,   90,   90,  428,  206,  224,  169,  206,
			  224,  139,  118,  106,  120,  128,  140,  127,  142,  203,
			  170,  200,  185,  835,  119,  187,  121,  141,  129,  130,
			  131,  131,  131,  131,  131,  131,  161,  151,  111,  139,
			  188,  151,  171,  151,  140,  132,  163,  142,  192,  201,
			  300,  151,  133,  189,  172,  164,  193,  151,  615,  134,
			  226,  135,  294,  136,  162,  157,  177,  178,  190,  157,
			  173,  157,  179,  132,  165,  352,  194,  301,  300,  157,
			  133,  191,  174,  166,  195,  157,  211,  180,  213,  213,

			  135,  302,  136,  148,  181,  182,  148,  616,  206,  296,
			  183,  149,  811,  206,  352,  301,  206,  712,  150,  151,
			  151,  151,  151,  151,  151,  152,  206,  308,  310,  302,
			  791,  151,  151,  151,  151,  151,  153,  151,  151,  151,
			  154,  151,  155,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  156,  308,  310,  575,  151,  157,
			  157,  157,  157,  157,  158,  157,  157,  157,  159,  157,
			  160,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  148,  793,  794,  148,  210,  210,  210,  150,
			  149,  212,  212,  212,  214,  214,  214,  150,  151,  151,

			  151,  151,  151,  151,  152,  725,  211,  724,  311,  723,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  156,  216,  220,  311,  151,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  196,  223,  477,  228,  722,  197,  228,  712,  314,
			  217,  218,  221,  222,  253,  254,  229,  230,  228,  245,
			  294,  228,  708,  255,  245,  111,  320,  231,  148,  198,
			  229,  148,  477,  234,  199,  150,  149,  314,  217,  218,

			  670,  231,  235,  235,  235,  235,  235,  235,  242,  242,
			  242,  242,  242,  242,  320,  246,  295,  226,  247,  247,
			  247,  247,  247,  247,  243,  248,  248,  248,  248,  248,
			  248,  226,  252,  252,  252,  252,  252,  252,  236,  253,
			  254,  249,  253,  254,  150,  253,  254,  244,  268,  253,
			  111,  304,  243,  237,  324,  321,  103,  238,  104,  239,
			  250,  250,  250,  250,  250,  250,  251,  490,  103,  249,
			  104,  481,  250,  250,  250,  250,  250,  250,  253,  254,
			  434,  253,  254,  321,  253,  254,  325,  255,  254,  111,
			  255,  532,  111,  255,  315,  111,  255,  253,  254,  106,

			  316,  614,  259,  326,  332,  258,  255,  334,  111,  336,
			  257,  106,  253,  254,  325,  253,  254,  260,  253,  254,
			  532,  255,  315,  111,  304,  253,  254,  255,  316,  111,
			  259,  326,  332,  258,  255,  334,  111,  336,  257,  253,
			  254,  207,  261,  207,  207,  260,  337,  300,  255,  263,
			  111,  340,  262,  803,  253,  254,  264,  253,  254,  613,
			  253,  254,  265,  255,  807,  111,  255,  341,  111,  255,
			  261,  111,  253,  254,  337,  305,  479,  263,  266,  340,
			  262,  255,  803,  111,  264,  253,  254,  267,  269,  270,
			  265,  253,  254,  807,  255,  341,  111,  344,  253,  254,

			  255,  345,  111,  253,  254,  220,  266,  255,  594,  111,
			  253,  254,  255,  361,  111,  267,  269,  270,  459,  255,
			  274,  111,  103,  272,  583,  344,  255,  271,  275,  345,
			  273,  346,  253,  254,  876,  253,  254,  130,  253,  254,
			  216,  255,  221,  222,  255,  350,  111,  255,  274,  111,
			  277,  272,  253,  254,  130,  363,  275,  278,  273,  346,
			  523,  255,  436,  111,  110,  106,  279,  281,  280,  530,
			  132,  288,  240,  350,  240,  240,  217,  218,  277,  394,
			  253,  254,  253,  254,  281,  278,  135,  253,  254,  304,
			  436,  304,  221,  222,  496,  279,  304,  280,  132,  288,

			  253,  254,  253,  254,  253,  254,  301,  308,  325,  304,
			  799,  304,  483,  304,  366,  135,  253,  254,  130,  282,
			  282,  282,  282,  282,  282,  255,  320,  111,  253,  254,
			  130,  253,  254,  130,  306,  309,  330,  255,  283,  111,
			  255,  284,  111,  647,  253,  254,  132,  285,  437,  132,
			  253,  254,  800,  255,  322,  111,  133,  366,  441,  304,
			  281,  253,  254,  281,  826,  135,  283,  289,  302,  284,
			  255,  290,  111,  223,  132,  285,  437,  132,  253,  254,
			  286,  206,  648,  287,  133,  224,  441,  255,  224,  111,
			  254,  253,  254,  826,  135,  289,  307,  291,  255,  290, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  255,  206,  111,  253,  254,  712,  253,  254,  286,  217,
			  218,  287,  255,  836,  111,  304,  362,  253,  254,  793,
			  794,  292,  253,  254,  443,  291,  304,  206,  253,  254,
			  474,  304,  253,  254,  253,  254,  310,  304,  226,  293,
			  459,  304,  454,  304,  311,  315,  438,  253,  254,  292,
			  435,  316,  443,  314,  253,  254,  304,  253,  254,  210,
			  210,  210,  321,  304,  312,  428,  304,  394,  293,  253,
			  254,  326,  313,  318,  336,  444,  327,  393,  255,  319,
			  341,  317,  354,  355,  356,  357,  358,  381,  253,  254,
			  323,  328,  329,  329,  329,  329,  329,  304,  876,  331,

			  253,  254,  338,  444,  206,  210,  210,  210,  343,  255,
			  726,  111,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  253,  254,  253,  254,  253,
			  254,  253,  254,  206,  304,  376,  304,  375,  304,  727,
			  304,  374,  253,  254,  253,  254,  373,  337,  370,  447,
			  340,  304,  448,  304,  227,  253,  254,  332,  361,  334,
			  449,  453,  456,  346,  255,  344,  111,  253,  254,  345,
			  253,  254,  359,  359,  359,  339,  304,  447,  342,  304,
			  448,  457,  396,  228,  362,  333,  228,  335,  449,  453,

			  456,  349,  361,  347,  206,  229,  228,  348,  327,  228,
			  350,  458,  462,  352,  367,  366,  231,  367,  229,  457,
			  396,  360,  360,  360,  389,  389,  389,  389,  389,  231,
			  371,  372,  372,  372,  372,  372,  372,  268,  351,  458,
			  462,  303,  353,  378,  299,  378,  226,  297,  379,  379,
			  379,  379,  379,  379,  368,  366,  147,  368,  294,  226,
			  364,  365,  366,  364,  365,  364,  364,  364,  364,  364,
			  364,  364,  364,  367,  230,  230,  364,  230,  230,  230,
			  230,  230,  230,  364,  368,  364,  364,  364,  364,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,

			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  364,  364,  369,  364,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  377,  377,  377,  377,  377,  377,  380,  380,
			  380,  380,  380,  380,  276,  241,  253,  254,  243,  382,
			  382,  382,  382,  382,  382,  304,  383,  383,  383,  383,
			  383,  383,  390,  390,  390,  390,  390,  390,  253,  254,
			  448,  244,  384,  386,  799,  386,  243,  304,  387,  387,

			  387,  387,  387,  387,  103,  712,  104,  240,  388,  388,
			  388,  388,  388,  388,  233,  385,  253,  254,  451,   94,
			  384,  253,  254,   91,  464,  255,  465,  111,  253,  254,
			  255,  227,  111,  253,  254,  395,  801,  255,  468,  111,
			  253,  254,  255,  206,  111,  204,  398,  106,  397,  255,
			  469,  111,  464,  147,  465,  111,  253,  254,  109,  400,
			  253,  254,  472,  395,  399,  255,  468,  111,  108,  255,
			  393,  111,  253,  254,  398,  405,  397,  101,  469,  473,
			  401,  255,  531,  111,  253,  254,  405,  400,  253,  254,
			  472,  402,  399,  255,   98,  111,  405,  255,   94,  111,

			  253,  254,  206,  403,  253,  254,   92,  473,  401,  255,
			  531,  111,  406,  255,  405,  111,  253,  254,  243,  402,
			   91,  253,  254,  537,  407,  304,  404,  408,  253,  254,
			  255,  403,  111,  462,  253,  254,  876,  255,  409,  111,
			  406,  244,  876,  255,  876,  111,  243,  253,  254,  253,
			  254,  537,  407,  253,  254,  408,  304,  876,  255,  876,
			  111,  463,  255,  876,  111,  443,  409,  410,  411,  253,
			  254,  876,  413,  413,  413,  413,  413,  413,  255,  876,
			  111,  213,  213,  253,  254,  412,  414,  414,  414,  414,
			  414,  414,  255,  445,  111,  410,  411,  876,  876,  253,

			  254,  412,  415,  415,  415,  415,  415,  415,  255,  416,
			  111,  417,  876,  253,  254,  412,  110,  110,  110,  110,
			  110,  110,  304,  110,  110,  110,  110,  110,  110,  876,
			  876,  412,  418,  539,  876,  419,  253,  254,  130,  876,
			  437,  420,  110,  253,  254,  255,  876,  111,  253,  254,
			  130,  876,  304,  253,  254,  876,  876,  255,  206,  111,
			  418,  539,  255,  419,  111,  253,  254,  285,  440,  420,
			  110,  253,  254,  876,  422,  876,  111,  253,  254,  421,
			  255,  524,  111,  253,  254,  454,  255,  876,  111,  294,
			  423,  540,  255,  543,  111,  285,  253,  254,  876,  876,

			  253,  254,  876,  253,  254,  304,  424,  421,  876,  255,
			  876,  111,  255,  425,  111,  253,  254,  876,  423,  540,
			  525,  543,  468,  876,  255,  876,  111,  429,  430,  430,
			  430,  430,  430,  294,  424,  876,  210,  210,  210,  876,
			  544,  425,  426,  431,  432,  433,  433,  433,  433,  294,
			  470,  427,  253,  254,  253,  254,  253,  254,  253,  254,
			  547,  304,  876,  304,  507,  304,  876,  304,  544,  253,
			  254,  436,  876,  253,  254,  507,  876,  447,  304,  299,
			  427,  441,  304,  876,  876,  507,  393,  444,  547,  876,
			  459,  405,  329,  329,  329,  329,  329,  329,  206,  439,

			  449,  876,  405,  507,  453,  450,  876,  253,  254,  442,
			  253,  254,  405,  253,  254,  446,  304,  253,  254,  304,
			  253,  254,  304,  206,  253,  254,  304,  206,  452,  304,
			  405,  456,  455,  304,  457,  206,  465,  876,  548,  469,
			  253,  254,  253,  254,  550,  551,  464,  253,  254,  304,
			  876,  304,  876,  472,  253,  254,  304,  365,  366,  460,
			  365,  876,  461,  255,  467,  111,  548,  471,  876,  367,
			  473,  876,  550,  551,  466,  876,  212,  212,  212,  876,
			  368,  475,  876,  477,  474,  371,  372,  372,  372,  372,
			  372,  372,  379,  379,  379,  379,  379,  379,  476,  253,

			  254,  214,  214,  214,  876,  210,  210,  210,  304,  876,
			  369,  876,  478,  210,  210,  210,  480,  480,  480,  480,
			  480,  480,  482,  482,  482,  482,  482,  482,  484,  484,
			  484,  484,  484,  484,  485,  485,  485,  485,  485,  485,
			  488,  488,  488,  488,  488,  488,  552,  557,  559,  876,
			  384,  486,  876,  486,  876,  481,  487,  487,  487,  487,
			  487,  487,  387,  387,  387,  387,  387,  387,  876,  526,
			  808,  808,  808,  385,  552,  557,  559,  294,  384,  489,
			  489,  489,  489,  489,  489,  491,  492,  876,  493,  493,
			  493,  493,  493,  493,  494,  494,  494,  494,  494,  494, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  495,  495,  495,  495,  495,  495,  253,  254,  527,  876,
			  253,  254,  876,  253,  254,  255,  876,  111,  490,  255,
			  876,  111,  255,  560,  111,  563,  253,  254,  564,  253,
			  254,  876,  617,  876,  876,  255,  498,  111,  255,  876,
			  111,  253,  254,  500,  499,  876,  253,  254,  502,  501,
			  255,  560,  111,  563,  876,  255,  564,  111,  253,  254,
			  617,  253,  254,  876,  498,  876,  619,  255,  876,  111,
			  255,  500,  111,  499,  503,  876,  502,  501,  504,  876,
			  505,  253,  254,  876,  253,  254,  876,  876,  253,  254,
			  255,  509,  111,  255,  619,  111,  506,  255,  876,  111,

			  253,  254,  503,  876,  253,  254,  504,  508,  505,  255,
			  876,  111,  876,  255,  510,  111,  253,  254,  876,  509,
			  253,  254,  511,  110,  506,  255,  110,  111,  620,  255,
			  876,  111,  110,  623,  512,  508,  413,  413,  413,  413,
			  413,  413,  510,  629,  253,  254,  513,  876,  253,  254,
			  511,  110,  876,  255,  110,  111,  620,  255,  110,  111,
			  110,  623,  512,  414,  414,  414,  414,  414,  414,  110,
			  876,  629,  523,  254,  513,  415,  415,  415,  415,  415,
			  415,  255,  565,  111,  876,  110,  110,  514,  514,  514,
			  514,  514,  514,  566,  110,  876,  110,  876,  110,  515,

			  515,  515,  515,  515,  515,  876,  876,  876,  110,  876,
			  565,  253,  254,  110,  516,  516,  516,  516,  516,  516,
			  304,  566,  393,  110,  876,  110,  876,  518,  630,  110,
			  517,  517,  517,  517,  517,  517,  876,  110,  518,  876,
			  876,  253,  254,  876,  543,  110,  253,  254,  518,  631,
			  255,  634,  111,  253,  254,  304,  630,  110,  876,  580,
			  876,  580,  255,  876,  111,  876,  518,  253,  254,  539,
			  581,  520,  545,  110,  519,  876,  255,  631,  111,  634,
			  876,  524,  521,  430,  430,  430,  430,  430,  430,  294,
			  876,  253,  254,  522,  876,  876,  876,  541,  582,  520,

			  304,  528,  519,  433,  433,  433,  433,  433,  433,  294,
			  521,  526,  876,  433,  433,  433,  433,  433,  433,  294,
			  525,  522,  533,  534,  534,  534,  534,  534,  253,  254,
			  253,  254,  253,  254,  253,  254,  876,  304,  876,  304,
			  529,  304,  876,  304,  876,  253,  254,  253,  254,  876,
			  527,  253,  254,  540,  304,  876,  304,  876,  531,  876,
			  304,  876,  537,  876,  532,  876,  547,  553,  554,  554,
			  554,  554,  554,  624,  550,  253,  254,  544,  253,  254,
			  876,  542,  253,  254,  304,  625,  535,  304,  253,  254,
			  538,  304,  876,  536,  549,  253,  254,  304,  253,  254,

			  557,  624,  555,  876,  304,  546,  876,  304,  551,  636,
			  523,  254,  559,  625,  253,  254,  253,  254,  560,  304,
			  253,  254,  876,  304,  876,  255,  876,  111,  558,  304,
			  876,  563,  564,  253,  254,  876,  556,  636,  876,  876,
			  561,  876,  255,  876,  111,  876,  562,  569,  569,  569,
			  569,  569,  569,  570,  570,  570,  570,  570,  570,  567,
			  568,  377,  377,  377,  377,  377,  377,  571,  572,  572,
			  572,  572,  572,  573,  573,  573,  573,  573,  573,  487,
			  487,  487,  487,  487,  487,  637,  481,  876,  876,  384,
			  574,  574,  574,  574,  574,  574,  576,  576,  576,  576,

			  576,  576,  577,  577,  577,  577,  577,  577,  876,  640,
			  876,  641,  385,  637,  876,  253,  254,  384,  578,  578,
			  578,  578,  578,  578,  255,  876,  111,  253,  254,  575,
			  573,  573,  573,  573,  573,  573,  255,  640,  111,  641,
			  492,  490,  493,  493,  493,  493,  493,  493,  642,  253,
			  254,  876,  876,  588,  253,  254,  876,  586,  255,  602,
			  111,  876,  643,  255,  680,  111,  253,  254,  587,  876,
			  602,  682,  589,  684,  685,  255,  642,  111,  253,  254,
			  602,  588,  253,  254,  590,  876,  688,  255,  876,  111,
			  643,  255,  680,  111,  253,  254,  587,  591,  602,  682,

			  589,  684,  685,  255,  689,  111,  593,  253,  254,  592,
			  253,  254,  590,  595,  688,  876,  255,  690,  111,  255,
			  876,  111,  253,  254,  876,  591,  876,  693,  596,  253,
			  254,  255,  689,  111,  593,  253,  254,  592,  255,  876,
			  111,  595,  253,  254,  255,  690,  111,  695,  597,  696,
			  699,  255,  598,  111,  599,  693,  596,  514,  514,  514,
			  514,  514,  514,  254,  876,  515,  515,  515,  515,  515,
			  515,  255,  605,  700,  876,  695,  597,  696,  699,  876,
			  598,  876,  599,  253,  254,  600,  517,  517,  517,  517,
			  517,  517,  255,  601,  111,  253,  254,  701,  253,  254,

			  605,  700,  253,  254,  255,  876,  111,  255,  110,  111,
			  606,  304,  607,  600,  603,  876,  876,  604,  728,  729,
			  876,  601,  416,  608,  417,  701,  516,  516,  516,  516,
			  516,  516,  876,  609,  253,  254,  110,  876,  606,  876,
			  876,  110,  603,  304,  614,  604,  728,  729,  419,  707,
			  731,  608,  733,  617,  420,  429,  610,  610,  610,  610,
			  610,  294,  431,  611,  611,  611,  611,  611,  294,  110,
			  253,  254,  385,  876,  876,  876,  419,  707,  731,  304,
			  733,  618,  420,  431,  612,  611,  611,  611,  611,  294,
			  615,  735,  534,  534,  534,  534,  534,  534,  253,  254,

			  253,  254,  253,  254,  253,  254,  876,  304,  876,  304,
			  876,  304,  876,  304,  876,  876,  253,  254,  620,  735,
			  623,  253,  254,  624,  619,  255,  664,  111,  876,  616,
			  255,  659,  111,  736,  459,  625,  554,  554,  554,  554,
			  554,  554,  255,  664,  253,  254,  622,  664,  626,  253,
			  254,  627,  621,  304,  737,  253,  254,  876,  304,  659,
			  876,  736,  631,  628,  304,  761,  253,  254,  630,  253,
			  254,  664,  253,  254,  634,  304,  876,  876,  304,  253,
			  254,  304,  737,  253,  254,  637,  253,  254,  304,  762,
			  633,  640,  255,  761,  111,  255,  632,  111,  641,  636,

			  253,  254,  635,  646,  646,  646,  646,  646,  646,  255,
			  876,  111,  662,  639,  764,  660,  876,  762,  647,  644,
			  572,  572,  572,  572,  572,  572,  645,  638,  573,  573,
			  573,  573,  573,  573,  650,  650,  650,  650,  650,  650,
			  662,  876,  764,  660,  649,  651,  651,  651,  651,  651,
			  651,  652,  652,  652,  652,  652,  652,  648,  653,  653,
			  653,  653,  653,  653,  654,  654,  654,  654,  654,  654,
			  876,  766,  649,  575,  655,  655,  655,  655,  655,  655,
			  656,  656,  656,  656,  656,  657,  657,  657,  657,  657,
			  657,  253,  254,  876,  253,  254,  768,  253,  254,  766, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  255,  249,  111,  255,  769,  111,  255,  876,  111,  785,
			  661,  253,  254,  876,  253,  254,  786,  253,  254,  876,
			  255,  663,  111,  255,  768,  111,  255,  876,  111,  249,
			  253,  254,  769,  666,  253,  254,  876,  785,  661,  255,
			  876,  111,  665,  255,  786,  111,  253,  254,  667,  663,
			  788,  253,  254,  668,  674,  255,  790,  111,  253,  254,
			  255,  666,  111,  876,  669,  674,  876,  255,  672,  111,
			  665,  253,  254,  496,  876,  675,  667,  496,  788,  876,
			  255,  668,  111,  802,  790,  253,  254,  674,  671,  673,
			  876,  675,  669,  674,  304,  876,  672,  805,  676,  817,

			  253,  254,  677,  876,  253,  254,  253,  254,  677,  304,
			  876,  802,  677,  304,  876,  304,  671,  673,  678,  679,
			  679,  679,  679,  679,  876,  805,  676,  817,  876,  524,
			  677,  610,  610,  610,  610,  610,  610,  294,  526,  818,
			  611,  611,  611,  611,  611,  611,  294,  528,  876,  611,
			  611,  611,  611,  611,  611,  294,  533,  681,  681,  681,
			  681,  681,  827,  253,  254,  253,  254,  818,  525,  876,
			  253,  254,  304,  876,  304,  876,  716,  527,  682,  304,
			  253,  254,  253,  254,  684,  876,  529,  876,  837,  304,
			  827,  304,  876,  716,  253,  254,  685,  716,  253,  254,

			  876,  690,  876,  304,  253,  254,  683,  304,  876,  253,
			  254,  689,  686,  304,  253,  254,  837,  695,  255,  876,
			  111,  716,  696,  304,  687,  693,  718,  253,  254,  692,
			  569,  569,  569,  569,  569,  569,  255,  876,  111,  691,
			  253,  254,  876,  718,  699,  697,  876,  718,  876,  255,
			  698,  111,  876,  694,  571,  703,  703,  703,  703,  703,
			  704,  876,  704,  876,  876,  705,  705,  705,  705,  705,
			  705,  718,  702,  705,  705,  705,  705,  705,  705,  706,
			  706,  706,  706,  706,  706,  577,  577,  577,  577,  577,
			  577,  709,  709,  709,  709,  709,  709,  710,  710,  710,

			  710,  710,  710,  711,  711,  711,  711,  711,  711,  253,
			  254,  753,  575,  253,  254,  876,  253,  254,  255,  707,
			  111,  876,  255,  876,  111,  255,  876,  111,  753,  253,
			  254,  876,  753,  715,  253,  254,  847,  714,  255,  713,
			  111,  876,  385,  255,  876,  111,  876,  707,  253,  254,
			  876,  253,  254,  876,  253,  254,  753,  255,  876,  111,
			  255,  715,  111,  304,  847,  714,  876,  713,  253,  254,
			  876,  253,  254,  876,  717,  253,  254,  255,  876,  111,
			  255,  876,  111,  876,  255,  876,  111,  719,  876,  253,
			  254,  253,  254,  720,  721,  876,  876,  876,  304,  876,

			  304,  726,  717,  679,  679,  679,  679,  679,  679,  253,
			  254,  253,  254,  729,  876,  719,  876,  876,  304,  876,
			  304,  720,  721,  615,  814,  681,  681,  681,  681,  681,
			  681,  876,  814,  253,  254,  253,  254,  253,  254,  876,
			  727,  730,  304,  876,  304,  814,  304,  253,  254,  876,
			  731,  742,  742,  742,  742,  876,  304,  876,  876,  876,
			  814,  733,  616,  876,  876,  647,  735,  703,  703,  703,
			  703,  703,  703,  744,  745,  744,  745,  876,  732,  705,
			  705,  705,  705,  705,  705,  876,  876,  876,  876,  734,
			  876,  876,  253,  254,  738,  705,  705,  705,  705,  705,

			  705,  255,  876,  111,  648,  739,  739,  739,  739,  739,
			  739,  740,  746,  740,  876,  876,  741,  741,  741,  741,
			  741,  741,  743,  743,  743,  743,  743,  743,  747,  747,
			  747,  747,  747,  747,  253,  254,  876,  253,  254,  876,
			  253,  254,  876,  255,  707,  111,  255,  876,  111,  304,
			  876,  749,  253,  254,  876,  876,  876,  253,  254,  876,
			  750,  255,  876,  111,  253,  254,  255,  385,  111,  253,
			  254,  751,  707,  255,  752,  111,  253,  254,  304,  749,
			  756,  876,  754,  845,  756,  255,  757,  111,  750,  876,
			  757,  876,  756,  757,  845,  755,  758,  759,  876,  751,

			  876,  756,  752,  876,  845,  876,  876,  757,  253,  254,
			  754,  876,  756,  758,  759,  876,  876,  255,  757,  111,
			  876,  876,  845,  755,  758,  759,  678,  760,  760,  760,
			  760,  760,  253,  254,  253,  254,  876,  253,  254,  253,
			  254,  304,  876,  304,  876,  828,  304,  828,  304,  876,
			  876,  876,  876,  764,  766,  762,  829,  768,  741,  741,
			  741,  741,  741,  741,  771,  771,  771,  771,  771,  771,
			  772,  772,  772,  772,  772,  772,  839,  839,  839,  839,
			  839,  765,  767,  763,  830,  770,  582,  582,  582,  582,
			  582,  582,  773,  773,  773,  773,  773,  773,  861,  861,

			  861,  861,  861,  575,  774,  774,  774,  774,  774,  774,
			  775,  775,  775,  775,  775,  775,  253,  254,  876,  253,
			  254,  876,  253,  254,  876,  255,  707,  111,  255,  876,
			  111,  255,  781,  111,  253,  254,  781,  876,  777,  253,
			  254,  779,  782,  255,  876,  111,  782,  876,  255,  385,
			  111,  778,  781,  781,  707,  782,  783,  876,  876,  784,
			  876,  253,  254,  782,  781,  876,  777,  876,  876,  779,
			  304,  780,  876,  783,  782,  876,  784,  876,  876,  778,
			  788,  876,  876,  876,  783,  876,  726,  784,  760,  760,
			  760,  760,  760,  760,  253,  254,  253,  254,  876,  780,

			  876,  876,  876,  304,  876,  255,  876,  111,  789,  739,
			  739,  739,  739,  739,  739,  792,  792,  792,  792,  792,
			  792,  876,  744,  876,  744,  727,  786,  774,  774,  774,
			  774,  774,  774,  775,  775,  775,  775,  775,  775,  815,
			  253,  254,  876,  876,  253,  254,  876,  815,  575,  255,
			  876,  111,  876,  255,  787,  111,  876,  253,  254,  795,
			  815,  746,  253,  254,  876,  876,  255,  876,  111,  253,
			  254,  255,  876,  111,  876,  815,  253,  254,  304,  876,
			  796,  869,  870,  869,  870,  304,  876,  795,  797,  809,
			  809,  809,  809,  809,  809,  253,  254,  876,  798,  253,

			  254,  876,  253,  254,  255,  803,  111,  805,  255,  796,
			  111,  255,  712,  111,  253,  254,  797,  253,  254,  876,
			  871,  823,  876,  304,  876,  815,  304,  798,  876,  823,
			  813,  812,  876,  816,  804,  806,  819,  819,  819,  819,
			  819,  819,  823,  876,  253,  254,  816,  746,  746,  746,
			  746,  746,  746,  255,  876,  111,  876,  823,  813,  812,
			  876,  816,  820,  820,  820,  820,  820,  820,  253,  254,
			  824,  712,  253,  254,  854,  876,  854,  255,  824,  111,
			  821,  255,  876,  111,  824,  855,  876,  822,  876,  876,
			  876,  824,  825,  831,  876,  832,  833,  876,  820,  820, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  820,  820,  820,  820,  876,  825,  824,  253,  254,  821,
			  876,  876,  876,  856,  876,  822,  255,  876,  111,  876,
			  825,  838,  838,  838,  838,  838,  838,  840,  840,  840,
			  840,  840,  840,  253,  254,  834,  843,  843,  843,  843,
			  843,  843,  255,  846,  111,  848,  848,  848,  848,  848,
			  848,  876,  844,  876,  846,  849,  849,  849,  849,  849,
			  849,  876,  876,  834,  846,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  876,  876,  876,
			  844,  831,  846,  832,  850,  841,  843,  843,  843,  843,
			  843,  843,  253,  254,  851,  852,  876,  876,  876,  876,

			  876,  255,  876,  111,  876,  851,  852,  853,  853,  853,
			  853,  853,  853,  876,  876,  851,  852,  857,  857,  857,
			  857,  857,  857,  830,  830,  830,  830,  830,  830,  876,
			  876,  876,  876,  851,  852,  860,  860,  860,  860,  860,
			  860,  831,  862,  832,  863,  876,  857,  857,  857,  857,
			  857,  857,  864,  864,  864,  864,  864,  864,  866,  862,
			  867,  863,  876,  862,  876,  863,  865,  865,  865,  865,
			  865,  865,  876,  876,  876,  866,  876,  867,  876,  866,
			  876,  867,  876,  876,  876,  876,  876,  862,  876,  863,
			  868,  868,  868,  868,  868,  868,  856,  856,  856,  856,

			  856,  856,  876,  866,  876,  867,  872,  872,  872,  872,
			  872,  872,  873,  873,  873,  873,  873,  873,  874,  874,
			  874,  874,  874,  874,  869,  876,  869,  876,  876,  873,
			  873,  873,  873,  873,  873,  875,  875,  875,  875,  875,
			  875,  871,  871,  871,  871,  871,  871,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  876,  876,  876,  876,
			  876,  876,  876,  871,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   80,   80,   80,   80,   80,

			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   93,   93,  876,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  876,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   95,   95,  876,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,  102,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,

			  876,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  110,  110,  110,  110,  876,  110,  110,  110,  110,  876,
			  876,  876,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  143,  143,  876,  143,  876,  143,  143,  143,  876,
			  876,  143,  143,  143,  143,  876,  876,  876,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  146,  146,  876,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  205,  205,
			  876,  205,  205,  205,  205,  205,  205,  205,  205,  205,

			  205,  205,  205,  205,  205,  205,  205,  205,  876,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  225,  876,  225,  876,  876,  876,  876,  225,  876,
			  225,  225,  225,  876,  876,  225,  225,  225,  225,  876,

			  876,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  232,  232,  876,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  102,  102,  102,  102,  876,  876,  102,
			  102,  102,  102,  102,  876,  876,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  256,  876,  876,  256,  256,

			  256,  256,  256,  256,  256,  256,  256,  876,  876,  876,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  876,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  391,  391,  391,  876,  876,  391,  391,  391,  391,
			  876,  876,  876,  391,  391,  391,  391,  391,  391,  391,

			  391,  391,  392,  392,  392,  876,  876,  392,  392,  392,
			  392,  876,  876,  876,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  298,  298,  298,  298,  876,  876,  298,
			  298,  298,  298,  298,  876,  876,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  497,  497,  497,  497,
			  876,  876,  876,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  435,  435,  435,  876,  876,  435,  435,  435,

			  435,  435,  435,  435,  435,  876,  876,  435,  435,  435,
			  435,  876,  876,  876,  435,  435,  435,  435,  435,  435,
			  435,  435,  435,  584,  584,  584,  584,  876,  876,  876,
			  584,  584,  584,  584,  584,  584,  584,  584,  584,  585,
			  585,  585,  876,  876,  585,  585,  585,  585,  876,  876,
			  876,  585,  585,  585,  585,  585,  585,  585,  585,  585,
			  658,  658,  658,  876,  876,  658,  658,  658,  658,  876,
			  876,  876,  658,  658,  658,  658,  658,  658,  658,  658,
			  658,  748,  748,  748,  748,  876,  876,  876,  748,  748,
			  748,  748,  748,  748,  748,  748,  748,  776,  776,  776, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  876,  876,  776,  776,  776,  776,  876,  876,  876,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  810,  810,
			  810,  876,  876,  810,  810,  810,  810,  876,  876,  876,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,    9,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,

			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876, yy_Dummy>>,
			1, 132, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5131)
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
			    1,    1,    1,    3,    5,   16,    6,    3,    4,  491,

			  491,   11,    4,   11,   11,   23,   74,   23,   23,   23,
			   23,   23,   23,   25,   33,   25,   34,   25,   25,   25,
			   25,   25,   25,   33,   34,   39,   45,   33,   40,   33,
			    5,    5,    6,    6,   35,   41,   39,   45,   35,   41,
			   16,   59,   40,   40,    3,   45,   49,   35,   40,    4,
			  852,   33,   34,   74,   49,   33,   25,   33,   72,  229,
			   72,   72,  229,  851,   39,   45,   35,   41,  842,   59,
			   40,   40,  832,   45,  231,   35,   40,  231,    3,    3,
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
			   57,   43,   38,   47,   37,  304,   38,   43,  824,   42,

			   67,   57,  304,   48,   61,   37,   46,   62,   38,   47,
			   43,   90,  428,   90,   90,  428,   76,   85,   57,   78,
			   85,   46,   37,   26,   38,   43,   46,   42,   48,   67,
			   57,   66,   61,  823,   37,   62,   38,   47,   43,   44,
			   44,   44,   44,   44,   44,   44,   54,   54,   44,   46,
			   63,   54,   58,   54,   46,   44,   55,   48,   64,   66,
			  153,   55,   44,   63,   58,   55,   64,   55,  533,   44,
			   85,   44,  145,   44,   54,   54,   60,   60,   63,   54,
			   58,   54,   60,   44,   55,  202,   64,  154,  153,   55,
			   44,   63,   58,   55,   64,   55,   76,   60,   78,   78,

			   44,  155,   44,   53,   60,   60,   53,  533,   75,  145,
			   60,   53,  794,   77,  202,  154,   79,  784,   53,   53,
			   53,   53,   53,   53,   53,   53,  355,  161,  163,  155,
			  772,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,  161,  163,  739,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   56,  776,  776,   56,   75,   75,   75,  727,
			   56,   77,   77,   77,   79,   79,   79,   56,   56,   56,

			   56,   56,   56,   56,   56,  677,  355,  676,  164,  675,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   80,   82,  164,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   65,   83,  352,   87,  674,   65,   87,  658,  167,
			   80,   80,   82,   82,  110,  110,   87,   87,   88,  102,
			  144,   88,  654,  110,  648,  110,  171,   87,  148,   65,
			   88,  148,  352,   97,   65,  616,  148,  167,   83,   83,

			  602,   88,   97,   97,   97,   97,   97,   97,  100,  100,
			  100,  100,  100,  100,  171,  102,  144,   87,  103,  103,
			  103,  103,  103,  103,  100,  104,  104,  104,  104,  104,
			  104,   88,  106,  106,  106,  106,  106,  106,   97,  122,
			  122,  104,  157,  157,  298,  176,  176,  100,  122,  585,
			  122,  157,  100,   97,  176,  172,  105,   97,  105,   97,
			  105,  105,  105,  105,  105,  105,  105,  577,  107,  104,
			  107,  569,  107,  107,  107,  107,  107,  107,  112,  112,
			  298,  113,  113,  172,  114,  114,  177,  112,  392,  112,
			  113,  437,  113,  114,  168,  114,  392,  115,  115,  105,

			  168,  532,  114,  178,  184,  113,  115,  186,  115,  188,
			  112,  107,  116,  116,  177,  158,  158,  115,  118,  118,
			  437,  116,  168,  116,  158,  117,  117,  118,  168,  118,
			  114,  178,  184,  113,  117,  186,  117,  188,  112,  119,
			  119,  207,  116,  207,  207,  115,  189,  158,  119,  118,
			  119,  192,  117,  786,  120,  120,  119,  121,  121,  530,
			  123,  123,  119,  120,  790,  120,  121,  193,  121,  123,
			  116,  123,  124,  124,  189,  158,  361,  118,  120,  192,
			  117,  124,  786,  124,  119,  125,  125,  121,  123,  124,
			  119,  126,  126,  790,  125,  193,  125,  196,  127,  127,

			  126,  196,  126,  128,  128,  219,  120,  127,  507,  127,
			  129,  129,  128,  361,  128,  121,  123,  124,  553,  129,
			  128,  129,  484,  126,  495,  196,  553,  125,  129,  196,
			  127,  197,  131,  131,  131,  132,  132,  132,  138,  138,
			  215,  131,  219,  219,  132,  200,  132,  138,  128,  138,
			  131,  126,  133,  133,  133,  221,  129,  131,  127,  197,
			  477,  133,  300,  133,  131,  495,  131,  132,  131,  434,
			  133,  138,  240,  200,  240,  240,  215,  215,  131,  394,
			  181,  181,  159,  159,  133,  131,  133,  162,  162,  181,
			  300,  159,  221,  221,  391,  131,  162,  131,  133,  138,

			  307,  307,  173,  173,  335,  335,  159,  162,  181,  307,
			  781,  173,  381,  335,  369,  133,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  173,  134,  135,  135,
			  135,  136,  136,  136,  159,  162,  181,  135,  134,  135,
			  136,  134,  136,  571,  139,  139,  135,  134,  301,  136,
			  160,  160,  781,  139,  173,  139,  136,  364,  308,  160,
			  135,  137,  137,  136,  817,  136,  134,  139,  160,  134,
			  137,  139,  137,  218,  135,  134,  301,  136,  140,  140,
			  137,  211,  571,  137,  136,  224,  308,  140,  224,  140,
			  601,  141,  141,  817,  136,  139,  160,  140,  601,  139, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  141,  210,  141,  142,  142,  825,  165,  165,  137,  218,
			  218,  137,  142,  825,  142,  165,  363,  166,  166,  810,
			  810,  141,  169,  169,  310,  140,  166,  212,  170,  170,
			  346,  169,  174,  174,  183,  183,  165,  170,  224,  142,
			  328,  174,  321,  183,  166,  170,  303,  195,  195,  141,
			  299,  170,  310,  169,  182,  182,  195,  190,  190,  211,
			  211,  211,  174,  182,  165,  294,  190,  256,  142,  151,
			  151,  182,  166,  170,  190,  311,  183,  255,  151,  170,
			  195,  169,  210,  210,  210,  210,  210,  246,  180,  180,
			  174,  180,  180,  180,  180,  180,  180,  180,  245,  182,

			  259,  259,  190,  311,  213,  212,  212,  212,  195,  259,
			  678,  259,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  185,  185,  187,  187,  191,
			  191,  194,  194,  214,  185,  239,  187,  238,  191,  678,
			  194,  237,  198,  198,  199,  199,  236,  191,  234,  314,
			  194,  198,  315,  199,  227,  258,  258,  185,  222,  187,
			  316,  320,  325,  199,  258,  198,  258,  203,  203,  198,
			  201,  201,  213,  213,  213,  191,  203,  314,  194,  201,
			  315,  326,  258,  225,  220,  185,  225,  187,  316,  320,

			  325,  199,  217,  198,  205,  225,  228,  198,  179,  228,
			  201,  327,  332,  203,  367,  367,  225,  367,  228,  326,
			  258,  214,  214,  214,  251,  251,  251,  251,  251,  228,
			  235,  235,  235,  235,  235,  235,  235,  175,  201,  327,
			  332,  156,  203,  243,  152,  243,  225,  149,  243,  243,
			  243,  243,  243,  243,  368,  368,  146,  368,  143,  228,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,

			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  242,  242,  242,  242,  242,  242,  244,  244,
			  244,  244,  244,  244,  130,   99,  318,  318,  242,  247,
			  247,  247,  247,  247,  247,  318,  248,  248,  248,  248,
			  248,  248,  252,  252,  252,  252,  252,  252,  351,  351,
			  318,  242,  248,  249,  783,  249,  242,  351,  249,  249,

			  249,  249,  249,  249,  250,  783,  250,   98,  250,  250,
			  250,  250,  250,  250,   95,  248,  257,  257,  318,   93,
			  248,  260,  260,   91,  336,  257,  337,  257,  261,  261,
			  260,   86,  260,  262,  262,  257,  783,  261,  340,  261,
			  263,  263,  262,   71,  262,   68,  261,  250,  260,  263,
			  341,  263,  336,   52,  337,   36,  264,  264,   31,  263,
			  265,  265,  344,  257,  262,  264,  340,  264,   29,  265,
			  268,  265,  266,  266,  261,  268,  260,   24,  341,  345,
			  264,  266,  436,  266,  267,  267,  268,  263,  269,  269,
			  344,  265,  262,  267,   22,  267,  268,  269,   14,  269,

			  270,  270,  357,  266,  271,  271,   13,  345,  264,  270,
			  436,  270,  269,  271,  268,  271,  333,  333,  377,  265,
			   12,  272,  272,  441,  270,  333,  267,  271,  273,  273,
			  272,  266,  272,  333,  274,  274,    9,  273,  272,  273,
			  269,  377,    0,  274,    0,  274,  377,  312,  312,  275,
			  275,  441,  270,  277,  277,  271,  312,    0,  275,    0,
			  275,  333,  277,    0,  277,  312,  272,  274,  275,  278,
			  278,    0,  278,  278,  278,  278,  278,  278,  278,    0,
			  278,  357,  357,  279,  279,  277,  279,  279,  279,  279,
			  279,  279,  279,  312,  279,  274,  275,    0,    0,  280,

			  280,  278,  280,  280,  280,  280,  280,  280,  280,  282,
			  280,  282,  282,  306,  306,  279,  281,  281,  281,  281,
			  281,  281,  306,  283,  283,  283,  283,  283,  283,    0,
			    0,  280,  282,  443,    0,  282,  284,  284,  284,    0,
			  306,  282,  283,  323,  323,  284,    0,  284,  285,  285,
			  285,    0,  323,  286,  286,    0,    0,  285,  354,  285,
			  282,  443,  286,  282,  286,  287,  287,  284,  306,  282,
			  283,  288,  288,    0,  287,    0,  287,  289,  289,  286,
			  288,  429,  288,  290,  290,  323,  289,    0,  289,  429,
			  288,  444,  290,  448,  290,  284,  342,  342,    0,    0,

			  291,  291,    0,  292,  292,  342,  289,  286,    0,  291,
			    0,  291,  292,  290,  292,  293,  293,    0,  288,  444,
			  429,  448,  342,    0,  293,    0,  293,  295,  295,  295,
			  295,  295,  295,  295,  289,    0,  354,  354,  354,    0,
			  449,  290,  291,  296,  296,  296,  296,  296,  296,  296,
			  342,  293,  305,  305,  309,  309,  313,  313,  317,  317,
			  453,  305,    0,  309,  405,  313,    0,  317,  449,  319,
			  319,  305,    0,  322,  322,  405,    0,  317,  319,  324,
			  293,  309,  322,    0,    0,  405,  324,  313,  453,    0,
			  329,  324,  329,  329,  329,  329,  329,  329,  356,  305,

			  319,    0,  324,  405,  322,  317,    0,  330,  330,  309,
			  331,  331,  324,  338,  338,  313,  330,  339,  339,  331,
			  343,  343,  338,  358,  347,  347,  339,  359,  319,  343,
			  324,  330,  322,  347,  331,  360,  339,    0,  454,  343,
			  348,  348,  349,  349,  456,  457,  338,  353,  353,  348,
			    0,  349,    0,  347,  400,  400,  353,  365,  365,  330,
			  365,    0,  331,  400,  339,  400,  454,  343,    0,  365,
			  348,    0,  456,  457,  338,    0,  356,  356,  356,    0,
			  365,  347,    0,  353,  349,  372,  372,  372,  372,  372,
			  372,  372,  378,  378,  378,  378,  378,  378,  348,  450,

			  450,  358,  358,  358,    0,  359,  359,  359,  450,    0,
			  365,    0,  353,  360,  360,  360,  379,  379,  379,  379,
			  379,  379,  380,  380,  380,  380,  380,  380,  382,  382,
			  382,  382,  382,  382,  383,  383,  383,  383,  383,  383,
			  385,  385,  385,  385,  385,  385,  458,  462,  464,    0,
			  383,  384,    0,  384,    0,  379,  384,  384,  384,  384,
			  384,  384,  386,  386,  386,  386,  386,  386,    0,  431,
			  791,  791,  791,  383,  458,  462,  464,  431,  383,  387,
			  387,  387,  387,  387,  387,  388,  388,    0,  388,  388,
			  388,  388,  388,  388,  389,  389,  389,  389,  389,  389, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  390,  390,  390,  390,  390,  390,  395,  395,  431,    0,
			  396,  396,    0,  397,  397,  395,    0,  395,  387,  396,
			    0,  396,  397,  465,  397,  472,  398,  398,  473,  399,
			  399,    0,  537,    0,    0,  398,  395,  398,  399,    0,
			  399,  401,  401,  397,  396,    0,  402,  402,  399,  398,
			  401,  465,  401,  472,    0,  402,  473,  402,  407,  407,
			  537,  403,  403,    0,  395,    0,  539,  407,    0,  407,
			  403,  397,  403,  396,  401,    0,  399,  398,  402,    0,
			  403,  404,  404,    0,  406,  406,    0,    0,  408,  408,
			  404,  407,  404,  406,  539,  406,  404,  408,    0,  408,

			  409,  409,  401,  412,  410,  410,  402,  406,  403,  409,
			    0,  409,    0,  410,  408,  410,  411,  411,    0,  407,
			  420,  420,  409,  412,  404,  411,  412,  411,  540,  420,
			    0,  420,  412,  543,  410,  406,  413,  413,  413,  413,
			  413,  413,  408,  548,  421,  421,  411,    0,  423,  423,
			  409,  412,    0,  421,  412,  421,  540,  423,  413,  423,
			  412,  543,  410,  414,  414,  414,  414,  414,  414,  413,
			    0,  548,  427,  427,  411,  415,  415,  415,  415,  415,
			  415,  427,  474,  427,    0,  414,  413,  416,  416,  416,
			  416,  416,  416,  474,  414,    0,  414,    0,  413,  417,

			  417,  417,  417,  417,  417,    0,    0,    0,  415,    0,
			  474,  451,  451,  414,  418,  418,  418,  418,  418,  418,
			  451,  474,  422,  414,    0,  414,    0,  422,  550,  418,
			  419,  419,  419,  419,  419,  419,    0,  415,  422,    0,
			    0,  424,  424,    0,  451,  419,  445,  445,  422,  551,
			  424,  557,  424,  425,  425,  445,  550,  418,    0,  494,
			    0,  494,  425,    0,  425,    0,  422,  426,  426,  445,
			  494,  425,  451,  419,  424,    0,  426,  551,  426,  557,
			    0,  430,  426,  430,  430,  430,  430,  430,  430,  430,
			    0,  470,  470,  426,    0,    0,    0,  445,  494,  425,

			  470,  432,  424,  432,  432,  432,  432,  432,  432,  432,
			  426,  433,    0,  433,  433,  433,  433,  433,  433,  433,
			  430,  426,  438,  438,  438,  438,  438,  438,  439,  439,
			  440,  440,  442,  442,  446,  446,    0,  439,    0,  440,
			  432,  442,    0,  446,    0,  452,  452,  455,  455,    0,
			  433,  460,  460,  446,  452,    0,  455,    0,  439,    0,
			  460,    0,  442,    0,  440,    0,  455,  459,  459,  459,
			  459,  459,  459,  544,  460,  461,  461,  452,  463,  463,
			    0,  446,  466,  466,  461,  544,  439,  463,  467,  467,
			  442,  466,    0,  440,  455,  471,  471,  467,  475,  475,

			  463,  544,  460,    0,  471,  452,    0,  475,  461,  559,
			  478,  478,  466,  544,  476,  476,  498,  498,  467,  478,
			  535,  535,    0,  476,    0,  498,    0,  498,  463,  535,
			    0,  475,  476,  505,  505,    0,  461,  559,    0,    0,
			  466,    0,  505,    0,  505,    0,  467,  480,  480,  480,
			  480,  480,  480,  481,  481,  481,  481,  481,  481,  475,
			  476,  482,  482,  482,  482,  482,  482,  483,  483,  483,
			  483,  483,  483,  485,  485,  485,  485,  485,  485,  486,
			  486,  486,  486,  486,  486,  560,  480,    0,    0,  485,
			  487,  487,  487,  487,  487,  487,  488,  488,  488,  488,

			  488,  488,  489,  489,  489,  489,  489,  489,    0,  563,
			    0,  564,  485,  560,    0,  499,  499,  485,  490,  490,
			  490,  490,  490,  490,  499,    0,  499,  501,  501,  487,
			  492,  492,  492,  492,  492,  492,  501,  563,  501,  564,
			  493,  489,  493,  493,  493,  493,  493,  493,  565,  500,
			  500,    0,    0,  501,  502,  502,    0,  499,  500,  518,
			  500,    0,  566,  502,  614,  502,  503,  503,  500,    0,
			  518,  619,  502,  623,  624,  503,  565,  503,  504,  504,
			  518,  501,  506,  506,  503,    0,  629,  504,    0,  504,
			  566,  506,  614,  506,  508,  508,  500,  504,  518,  619,

			  502,  623,  624,  508,  630,  508,  506,  510,  510,  504,
			  509,  509,  503,  508,  629,    0,  510,  631,  510,  509,
			    0,  509,  512,  512,    0,  504,    0,  634,  509,  511,
			  511,  512,  630,  512,  506,  513,  513,  504,  511,    0,
			  511,  508,  521,  521,  513,  631,  513,  636,  511,  637,
			  641,  521,  512,  521,  513,  634,  509,  514,  514,  514,
			  514,  514,  514,  515,    0,  515,  515,  515,  515,  515,
			  515,  515,  521,  642,    0,  636,  511,  637,  641,    0,
			  512,    0,  513,  522,  522,  514,  517,  517,  517,  517,
			  517,  517,  522,  515,  522,  519,  519,  643,  520,  520,

			  521,  642,  536,  536,  519,    0,  519,  520,  517,  520,
			  522,  536,  523,  514,  519,    0,    0,  520,  680,  682,
			    0,  515,  516,  523,  516,  643,  516,  516,  516,  516,
			  516,  516,    0,  523,  538,  538,  517,    0,  522,    0,
			    0,  516,  519,  538,  536,  520,  680,  682,  516,  652,
			  685,  523,  695,  538,  516,  524,  524,  524,  524,  524,
			  524,  524,  526,  526,  526,  526,  526,  526,  526,  516,
			  549,  549,  652,    0,    0,    0,  516,  652,  685,  549,
			  695,  538,  516,  528,  528,  528,  528,  528,  528,  528,
			  534,  699,  534,  534,  534,  534,  534,  534,  541,  541,

			  542,  542,  545,  545,  546,  546,    0,  541,    0,  542,
			    0,  545,    0,  546,    0,    0,  586,  586,  542,  699,
			  545,  587,  587,  546,  541,  586,  594,  586,    0,  534,
			  587,  586,  587,  700,  554,  546,  554,  554,  554,  554,
			  554,  554,  554,  594,  556,  556,  542,  594,  545,  555,
			  555,  546,  541,  556,  701,  558,  558,    0,  555,  586,
			    0,  700,  556,  546,  558,  728,  562,  562,  555,  561,
			  561,  594,  567,  567,  558,  562,    0,    0,  561,  568,
			  568,  567,  701,  589,  589,  562,  591,  591,  568,  729,
			  556,  567,  589,  728,  589,  591,  555,  591,  568,  561,

			  588,  588,  558,  570,  570,  570,  570,  570,  570,  588,
			    0,  588,  591,  562,  731,  588,    0,  729,  572,  567,
			  572,  572,  572,  572,  572,  572,  568,  561,  573,  573,
			  573,  573,  573,  573,  574,  574,  574,  574,  574,  574,
			  591,    0,  731,  588,  573,  575,  575,  575,  575,  575,
			  575,  576,  576,  576,  576,  576,  576,  572,  578,  578,
			  578,  578,  578,  578,  579,  579,  579,  579,  579,  579,
			    0,  733,  573,  574,  580,  580,  580,  580,  580,  580,
			  581,  581,  581,  581,  581,  583,  583,  583,  583,  583,
			  583,  590,  590,    0,  592,  592,  735,  593,  593,  733, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  590,  583,  590,  592,  736,  592,  593,    0,  593,  761,
			  590,  595,  595,    0,  596,  596,  762,  597,  597,    0,
			  595,  593,  595,  596,  735,  596,  597,    0,  597,  583,
			  603,  603,  736,  596,  598,  598,    0,  761,  590,  603,
			    0,  603,  595,  598,  762,  598,  599,  599,  597,  593,
			  766,  605,  605,  598,  607,  599,  769,  599,  604,  604,
			  605,  596,  605,    0,  599,  607,    0,  604,  605,  604,
			  595,  606,  606,  608,    0,  607,  597,  609,  766,    0,
			  606,  598,  606,  785,  769,  618,  618,  608,  604,  606,
			    0,  609,  599,  607,  618,    0,  605,  788,  608,  802,

			  622,  622,  609,    0,  628,  628,  644,  644,  608,  622,
			    0,  785,  609,  628,    0,  644,  604,  606,  613,  613,
			  613,  613,  613,  613,    0,  788,  608,  802,    0,  610,
			  609,  610,  610,  610,  610,  610,  610,  610,  611,  807,
			  611,  611,  611,  611,  611,  611,  611,  612,    0,  612,
			  612,  612,  612,  612,  612,  612,  615,  615,  615,  615,
			  615,  615,  818,  621,  621,  626,  626,  807,  610,    0,
			  627,  627,  621,    0,  626,    0,  664,  611,  621,  627,
			  632,  632,  633,  633,  626,    0,  612,    0,  826,  632,
			  818,  633,    0,  664,  635,  635,  627,  664,  638,  638,

			    0,  633,    0,  635,  639,  639,  621,  638,    0,  661,
			  661,  632,  626,  639,  645,  645,  826,  638,  661,    0,
			  661,  664,  639,  645,  627,  635,  670,  663,  663,  633,
			  646,  646,  646,  646,  646,  646,  663,    0,  663,  632,
			  665,  665,    0,  670,  645,  638,    0,  670,    0,  665,
			  639,  665,    0,  635,  647,  647,  647,  647,  647,  647,
			  649,    0,  649,    0,    0,  649,  649,  649,  649,  649,
			  649,  670,  645,  650,  650,  650,  650,  650,  650,  651,
			  651,  651,  651,  651,  651,  653,  653,  653,  653,  653,
			  653,  655,  655,  655,  655,  655,  655,  656,  656,  656,

			  656,  656,  656,  657,  657,  657,  657,  657,  657,  659,
			  659,  718,  650,  660,  660,    0,  662,  662,  659,  657,
			  659,    0,  660,    0,  660,  662,    0,  662,  718,  666,
			  666,    0,  718,  662,  667,  667,  837,  660,  666,  659,
			  666,    0,  657,  667,    0,  667,    0,  657,  668,  668,
			    0,  669,  669,    0,  686,  686,  718,  668,    0,  668,
			  669,  662,  669,  686,  837,  660,    0,  659,  671,  671,
			    0,  672,  672,    0,  668,  673,  673,  671,    0,  671,
			  672,    0,  672,    0,  673,    0,  673,  671,    0,  683,
			  683,  691,  691,  672,  673,    0,    0,    0,  683,    0,

			  691,  679,  668,  679,  679,  679,  679,  679,  679,  692,
			  692,  694,  694,  683,    0,  671,    0,    0,  692,    0,
			  694,  672,  673,  681,  799,  681,  681,  681,  681,  681,
			  681,    0,  799,  687,  687,  697,  697,  698,  698,    0,
			  679,  683,  687,    0,  697,  799,  698,  702,  702,    0,
			  687,  708,  708,  708,  708,    0,  702,    0,    0,    0,
			  799,  697,  681,    0,    0,  703,  702,  703,  703,  703,
			  703,  703,  703,  710,  710,  710,  710,    0,  687,  704,
			  704,  704,  704,  704,  704,    0,    0,    0,    0,  697,
			    0,    0,  721,  721,  702,  705,  705,  705,  705,  705,

			  705,  721,    0,  721,  703,  706,  706,  706,  706,  706,
			  706,  707,  710,  707,    0,    0,  707,  707,  707,  707,
			  707,  707,  709,  709,  709,  709,  709,  709,  711,  711,
			  711,  711,  711,  711,  713,  713,    0,  714,  714,    0,
			  765,  765,    0,  713,  711,  713,  714,    0,  714,  765,
			    0,  713,  715,  715,    0,    0,    0,  717,  717,    0,
			  714,  715,    0,  715,  719,  719,  717,  711,  717,  770,
			  770,  715,  711,  719,  717,  719,  720,  720,  770,  713,
			  722,    0,  719,  835,  722,  720,  723,  720,  714,    0,
			  723,    0,  724,  725,  835,  720,  724,  725,    0,  715,

			    0,  722,  717,    0,  835,    0,    0,  723,  751,  751,
			  719,    0,  722,  724,  725,    0,    0,  751,  723,  751,
			    0,    0,  835,  720,  724,  725,  726,  726,  726,  726,
			  726,  726,  730,  730,  732,  732,    0,  734,  734,  738,
			  738,  730,    0,  732,    0,  819,  734,  819,  738,    0,
			    0,    0,    0,  732,  734,  730,  819,  738,  740,  740,
			  740,  740,  740,  740,  741,  741,  741,  741,  741,  741,
			  742,  742,  742,  742,  742,  742,  829,  829,  829,  829,
			  829,  732,  734,  730,  819,  738,  743,  743,  743,  743,
			  743,  743,  744,  744,  744,  744,  744,  744,  855,  855,

			  855,  855,  855,  741,  745,  745,  745,  745,  745,  745,
			  747,  747,  747,  747,  747,  747,  749,  749,    0,  750,
			  750,    0,  752,  752,    0,  749,  747,  749,  750,    0,
			  750,  752,  756,  752,  754,  754,  756,    0,  749,  755,
			  755,  752,  757,  754,    0,  754,  757,    0,  755,  747,
			  755,  750,  758,  756,  747,  759,  758,    0,    0,  759,
			    0,  767,  767,  757,  756,    0,  749,    0,    0,  752,
			  767,  755,    0,  758,  757,    0,  759,    0,    0,  750,
			  767,    0,    0,    0,  758,    0,  760,  759,  760,  760,
			  760,  760,  760,  760,  763,  763,  796,  796,    0,  755,

			    0,    0,    0,  763,    0,  796,    0,  796,  767,  771,
			  771,  771,  771,  771,  771,  773,  773,  773,  773,  773,
			  773,    0,  774,    0,  774,  760,  763,  774,  774,  774,
			  774,  774,  774,  775,  775,  775,  775,  775,  775,  800,
			  777,  777,    0,    0,  778,  778,    0,  800,  771,  777,
			    0,  777,    0,  778,  763,  778,    0,  779,  779,  777,
			  800,  774,  780,  780,    0,    0,  779,    0,  779,  787,
			  787,  780,    0,  780,    0,  800,  789,  789,  787,    0,
			  778,  865,  865,  865,  865,  789,    0,  777,  779,  792,
			  792,  792,  792,  792,  792,  797,  797,    0,  780,  795,

			  795,    0,  798,  798,  797,  787,  797,  789,  795,  778,
			  795,  798,  801,  798,  804,  804,  779,  806,  806,    0,
			  865,  814,    0,  804,    0,  801,  806,  780,    0,  814,
			  798,  795,    0,  801,  787,  789,  808,  808,  808,  808,
			  808,  808,  814,    0,  812,  812,  801,  809,  809,  809,
			  809,  809,  809,  812,    0,  812,    0,  814,  798,  795,
			    0,  801,  811,  811,  811,  811,  811,  811,  813,  813,
			  815,  816,  822,  822,  849,    0,  849,  813,  815,  813,
			  812,  822,    0,  822,  816,  849,    0,  813,    0,    0,
			    0,  815,  816,  820,    0,  820,  820,    0,  820,  820, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  820,  820,  820,  820,    0,  816,  815,  821,  821,  812,
			    0,    0,    0,  849,    0,  813,  821,    0,  821,    0,
			  816,  828,  828,  828,  828,  828,  828,  831,  831,  831,
			  831,  831,  831,  834,  834,  821,  833,  833,  833,  833,
			  833,  833,  834,  836,  834,  838,  838,  838,  838,  838,
			  838,    0,  834,    0,  836,  839,  839,  839,  839,  839,
			  839,    0,    0,  821,  836,  840,  840,  840,  840,  840,
			  840,  841,  841,  841,  841,  841,  841,    0,    0,    0,
			  834,  843,  836,  843,  843,  831,  843,  843,  843,  843,
			  843,  843,  844,  844,  845,  846,    0,    0,    0,    0,

			    0,  844,    0,  844,    0,  845,  846,  848,  848,  848,
			  848,  848,  848,    0,    0,  845,  846,  850,  850,  850,
			  850,  850,  850,  853,  853,  853,  853,  853,  853,    0,
			    0,    0,    0,  845,  846,  854,  854,  854,  854,  854,
			  854,  857,  858,  857,  859,    0,  857,  857,  857,  857,
			  857,  857,  860,  860,  860,  860,  860,  860,  862,  858,
			  863,  859,    0,  858,    0,  859,  861,  861,  861,  861,
			  861,  861,    0,    0,    0,  862,    0,  863,    0,  862,
			    0,  863,    0,    0,    0,    0,    0,  858,    0,  859,
			  864,  864,  864,  864,  864,  864,  868,  868,  868,  868,

			  868,  868,    0,  862,    0,  863,  869,  869,  869,  869,
			  869,  869,  870,  870,  870,  870,  870,  870,  872,  872,
			  872,  872,  872,  872,  873,    0,  873,    0,    0,  873,
			  873,  873,  873,  873,  873,  874,  874,  874,  874,  874,
			  874,  875,  875,  875,  875,  875,  875,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,    0,    0,    0,    0,
			    0,    0,    0,  873,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  878,  878,  878,  878,  878,

			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  879,  879,    0,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,    0,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  880,  880,    0,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  881,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  882,  882,  882,  882,    0,  882,  882,  882,  882,    0,
			    0,    0,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  883,  883,    0,  883,    0,  883,  883,  883,    0,
			    0,  883,  883,  883,  883,    0,    0,    0,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  884,  884,    0,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  885,  885,
			    0,  885,  885,  885,  885,  885,  885,  885,  885,  885,

			  885,  885,  885,  885,  885,  885,  885,  885,    0,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  888,    0,  888,    0,    0,    0,    0,  888,    0,
			  888,  888,  888,    0,    0,  888,  888,  888,  888,    0,

			    0,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  889,  889,    0,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  891,  891,  891,  891,    0,    0,  891,
			  891,  891,  891,  891,    0,    0,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  892,    0,    0,  892,  892,

			  892,  892,  892,  892,  892,  892,  892,    0,    0,    0,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,    0,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  896,  896,  896,    0,    0,  896,  896,  896,  896,
			    0,    0,    0,  896,  896,  896,  896,  896,  896,  896,

			  896,  896,  897,  897,  897,    0,    0,  897,  897,  897,
			  897,    0,    0,    0,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  898,  898,  898,  898,    0,    0,  898,
			  898,  898,  898,  898,    0,    0,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  900,  900,  900,  900,
			    0,    0,    0,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  901,  901,  901,    0,    0,  901,  901,  901,

			  901,  901,  901,  901,  901,    0,    0,  901,  901,  901,
			  901,    0,    0,    0,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  902,  902,  902,  902,    0,    0,    0,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  903,
			  903,  903,    0,    0,  903,  903,  903,  903,    0,    0,
			    0,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  904,  904,  904,    0,    0,  904,  904,  904,  904,    0,
			    0,    0,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  905,  905,  905,  905,    0,    0,    0,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  906,  906,  906, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  906,  906,  906,  906,    0,    0,    0,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  907,  907,
			  907,    0,    0,  907,  907,  907,  907,    0,    0,    0,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,

			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876, yy_Dummy>>,
			1, 132, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0, 1536,
			 5039,   99, 1517, 1479, 1491, 5039,   86, 5039, 5039, 5039,
			 5039, 5039, 1479,   89, 1460,   99,  266, 5039, 5039, 1441,
			 5039, 1431, 5039,   88,   90,  108, 1429,  255,  266,   99,
			  102,  109,  257,  265,  322,  100,  280,  267,  277,   88,
			 5039, 5039, 1397,  401,  312,  326,  480,  251,  322,  104,
			  336,  274,  265,  318,  321,  520,  289,  249, 1428, 5039,
			 5039, 1436,  156, 5039,   99,  401,  309,  406,  312,  409,
			  517, 5039,  518,  545, 5039,  315, 1428,  562,  576, 5039,
			  309, 1420, 5039, 1412, 5039, 1405,    0,  584, 1404, 1349,

			  590, 5039,  562,  600,  607,  642,  614,  654, 5039, 5039,
			  559,    0,  663,  666,  669,  682,  697,  710,  703,  724,
			  739,  742,  624,  745,  757,  770,  776,  783,  788,  795,
			 1281,  817,  820,  837,  901,  913,  916,  946,  823,  929,
			  963,  976,  988, 1234,  556,  348, 1200, 5039,  586, 1236,
			    0, 1054, 1227,  313,  348,  368, 1175,  627,  700,  867,
			  935,  392,  872,  383,  466,  991, 1002,  523,  662, 1007,
			 1013,  547,  610,  887, 1017, 1213,  630,  643,  671, 1151,
			 1073,  865, 1039, 1019,  657, 1120,  660, 1122,  677,  713,
			 1042, 1124,  717,  719, 1126, 1032,  759,  797, 1137, 1139,

			  800, 1165,  334, 1162, 5039, 1197, 5039,  739, 5039, 5039,
			  994,  974, 1020, 1097, 1136,  823, 5039, 1148,  956,  788,
			 1139,  838, 1114, 5039,  983, 1191, 5039, 1161, 1204,  157,
			 1259,  172, 5039, 5039, 1149, 1213, 1147, 1142, 1138, 1136,
			  870, 5039, 1334, 1230, 1340, 1081, 1021, 1351, 1358, 1380,
			 1390, 1206, 1364,    0,    0, 1053, 1039, 1401, 1150, 1085,
			 1406, 1413, 1418, 1425, 1441, 1445, 1457, 1469, 1446, 1473,
			 1485, 1489, 1506, 1513, 1519, 1534, 5039, 1538, 1554, 1568,
			 1584, 1598, 1595, 1605, 1621, 1633, 1638, 1650, 1656, 1662,
			 1668, 1685, 1688, 1700, 1041, 1709, 1725, 5039,  627, 1033,

			  828,  906,    0,  985,  278, 1737, 1598,  885,  916, 1739,
			  991, 1029, 1532, 1741, 1125, 1123, 1124, 1743, 1351, 1754,
			 1125,  985, 1758, 1628, 1762, 1133, 1152, 1173, 1024, 1774,
			 1792, 1795, 1180, 1501,    0,  889, 1376, 1392, 1798, 1802,
			 1397, 1416, 1681, 1805, 1418, 1434,  973, 1809, 1825, 1827,
			    0, 1373,  512, 1832, 1651,  419, 1791, 1495, 1816, 1820,
			 1828,  759, 5039,  961,  954, 1855, 5039, 1212, 1252,  911,
			 5039, 5039, 1868, 5039, 5039, 5039, 5039, 1484, 1874, 1898,
			 1904,  851, 1910, 1916, 1938, 1922, 1944, 1961, 1970, 1976,
			 1982,  879,  672,    0,  851, 1991, 1995, 1998, 2011, 2014,

			 1839, 2026, 2031, 2046, 2066, 1735, 2069, 2043, 2073, 2085,
			 2089, 2101, 2086, 2118, 2145, 2157, 2169, 2181, 2196, 2212,
			 2105, 2129, 2198, 2133, 2226, 2238, 2252, 2157,  310, 1665,
			 2265, 1953, 2285, 2295,  803,    0, 1437,  642, 2304, 2313,
			 2315, 1478, 2317, 1595, 1657, 2231, 2319,    0, 1645, 1693,
			 1884, 2196, 2330, 1726, 1808, 2332, 1806, 1797, 1905, 2349,
			 2336, 2360, 1910, 2363, 1903, 1978, 2367, 2373,    0,    0,
			 2276, 2380, 1977, 1995, 2152, 2383, 2399,  845, 2395, 5039,
			 2429, 2435, 2443, 2449,  808, 2455, 2461, 2472, 2478, 2484,
			 2500,   81, 2512, 2524, 2246,  808,    0,    0, 2401, 2500,

			 2534, 2512, 2539, 2551, 2563, 2418, 2567,  784, 2579, 2595,
			 2592, 2614, 2607, 2620, 2639, 2647, 2708, 2668, 2530, 2680,
			 2683, 2627, 2668, 2683, 2737, 5039, 2744, 5039, 2765, 5039,
			  698,    0,  644,  352, 2774, 2405, 2687, 1998, 2719, 2025,
			 2095, 2783, 2785, 2100, 2339, 2787, 2789,    0, 2104, 2755,
			 2194, 2216,    0,  802, 2818, 2834, 2829, 2217, 2840, 2364,
			 2451, 2854, 2851, 2475, 2477, 2503, 2520, 2857, 2864,  614,
			 2885,  927, 2902, 2910, 2916, 2927, 2933,  610, 2940, 2946,
			 2956, 2962, 5039, 2967,    0,  634, 2801, 2806, 2885, 2868,
			 2976, 2871, 2979, 2982, 2797, 2996, 2999, 3002, 3019, 3031,

			 5039,  974,  576, 3015, 3043, 3036, 3056, 3025, 3058, 3062,
			 3113, 3122, 3131, 3100, 2534, 3138,  578,    0, 3070, 2541,
			    0, 3148, 3085, 2539, 2533,    0, 3150, 3155, 3089, 2547,
			 2558, 2583, 3165, 3167, 2581, 3179, 2613, 2616, 3183, 3189,
			    0, 2605, 2641, 2664, 3091, 3199, 3212, 3236,  567, 3247,
			 3255, 3261, 2715, 3267,  567, 3273, 3279, 3285,  552, 3294,
			 3298, 3194, 3301, 3212, 3147, 3225, 3314, 3319, 3333, 3336,
			 3197, 3353, 3356, 3360,  550,  494,  492,  490, 1094, 3385,
			 2673, 3407, 2680, 3374,    0, 2718, 3339, 3418,    0,    0,
			    0, 3376, 3394,    0, 3396, 2711,    0, 3420, 3422, 2757,

			 2796, 2820, 3432, 3449, 3461, 3477, 3487, 3498, 3433, 3504,
			 3460, 3510,    0, 3519, 3522, 3537, 5039, 3542, 3282, 3549,
			 3561, 3477, 3551, 3557, 3563, 3564, 3608,  472, 2833, 2851,
			 3617, 2880, 3619, 2939, 3622, 2963, 2970,    0, 3624,  400,
			 3640, 3646, 3652, 3668, 3674, 3686, 5039, 3692,    0, 3701,
			 3704, 3593, 3707, 5039, 3719, 3724, 3703, 3713, 3723, 3726,
			 3770, 2972, 2969, 3779,    0, 3525, 3016, 3746,    0, 3009,
			 3554, 3791,  383, 3797, 3809, 3815,  468, 3825, 3829, 3842,
			 3847,  905, 5039, 1389,  401, 3049,  702, 3854, 3051, 3861,
			  713, 1952, 3871,    0,  335, 3884, 3781, 3880, 3887, 3395,

			 3810, 3896, 3052,    0, 3899,    0, 3902, 3096, 3918, 3929,
			 1004, 3944, 3929, 3953, 3892, 3941, 3955,  913, 3128, 3632,
			 3980, 3992, 3957,  309,  274,  989, 3145,    0, 4003, 3658,
			 5039, 4009,   99, 4018, 4018, 3554, 4014, 3302, 4027, 4037,
			 4047, 4053,  108, 4068, 4077, 4065, 4066,    0, 4089, 3961,
			 4099,  139,  126, 4105, 4117, 3680, 5039, 4128, 4113, 4115,
			 4134, 4148, 4129, 4131, 4172, 3868, 5039, 5039, 4178, 4188,
			 4194, 5039, 4200, 4211, 4217, 4223, 5039, 4263, 4294, 4325,
			 4356, 4378, 4399, 4425, 4456, 4487, 4518, 4549, 4579, 4610,
			 4641, 4663, 4687, 4224, 4718, 4749, 4770, 4791, 4813, 4844,

			 4860, 4891, 4907, 4928, 4949, 4965, 4986, 5007, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  876,    1,  877,  877,  878,  878,  876,    7,  876,
			  876,  876,  876,  876,  879,  876,  880,  876,  876,  876,
			  876,  876,  876,  876,  881,  876,  876,  876,  876,  876,
			  876,  876,  876,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  883,
			  876,  876,  884,  876,   53,   53,  876,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,  876,  876,
			  876,  885,  876,  876,  876,  885,  885,  885,  885,  885,
			  886,  876,  887,  886,  876,  888,  876,  888,  888,  876,
			  876,  876,  876,  879,  876,  889,  889,  889,  890,  876,

			  876,  876,  891,  876,  876,  876,  876,  876,  876,  876,
			  882,  892,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  876,   44,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  883,  883,  883,  884,  876,  876,  876,
			  893,   56,  876,  151,  151,  151,  876,   56,   56,   56,
			   56,  151,   56,  151,  151,   56,   56,  151,  151,   56,
			   56,  151,  151,   56,   56,  151,   56,  151,  151,  151,
			   56,   56,   56,   56,  151,   56,  151,   56,  151,  151,
			   56,   56,  151,  151,   56,   56,  151,  151,   56,   56,

			  151,   56,  151,   56,  876,  885,  876,  876,  876,  876,
			  885,  885,  885,  885,  885,  886,  876,  894,  886,  887,
			  895,  887,  894,  876,  888,  888,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  881,  876,  876,  876,  876,
			  876,  876,  876,  896,  897,  876,  892,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  876,  882,
			  882,  882,  882,  882,  882,  882,  876,  882,  882,  882,
			  882,  134,  134,  134,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  876,  883,  883,  876,  898,  876,

			  151,  151,  151,  876,  876,   56,   56,   56,  151,   56,
			  151,  151,   56,   56,  151,  151,  151,   56,   56,   56,
			  151,  151,   56,   56,  876,  151,  151,  151,  151,  151,
			   56,   56,  151,   56,  151,   56,  151,  151,   56,   56,
			  151,  151,   56,   56,  151,  151,  151,   56,   56,   56,
			  151,   56,  151,   56,  885,  885,  885,  885,  885,  885,
			  885,  894,  876,  895,  899,  899,  876,  899,  899,  899,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  896,  897,  900,  892,  882,  882,  882,  882,  882,

			  882,  882,  882,  882,  882,  876,  882,  882,  882,  882,
			  882,  882,  134,  131,  131,  131,  876,  897,  414,  414,
			  882,  882,  876,  882,  882,  882,  882,  882,  876,  883,
			  883,  883,  883,  883,  876,  901,  151,  151,  876,   56,
			   56,  151,   56,  151,  151,   56,   56,  151,  151,  151,
			   56,   56,   56,  151,  151,   56,  151,  151,  151,  897,
			   56,   56,  151,   56,  151,  151,   56,   56,  151,  151,
			   56,   56,  151,  151,  151,   56,   56,  151,   56,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  902,  903,  882,  882,

			  882,  882,  882,  882,  882,  882,  882,  876,  882,  882,
			  882,  882,  882,  882,  876,  897,  414,  516,  876,  882,
			  882,  882,  882,  896,  883,  876,  883,  876,  883,  876,
			  876,  151,  151,  876,  876,   56,   56,  151,   56,  151,
			  151,   56,   56,  151,  151,   56,   56,  151,  151,   56,
			  151,  151,  151,  897,  897,   56,   56,  151,   56,  151,
			  151,   56,   56,  151,  151,  151,  151,   56,   56,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  904,  903,  882,  882,  882,  882,
			  882,  882,  882,  882,  876,  882,  882,  882,  882,  882,

			  876,  897,  876,  882,  882,  882,  882,  876,  896,  896,
			  883,  883,  883,  876,  151,  876,  876,  151,   56,  151,
			  151,   56,   56,  151,  151,  151,   56,   56,   56,  151,
			  151,  151,   56,   56,  151,   56,  151,  151,   56,   56,
			  151,  151,  151,  151,   56,   56,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  904,  882,
			  882,  882,  882,  882,  876,  882,  882,  882,  882,  882,
			  876,  882,  882,  882,  876,  876,  896,  896,  876,  876,
			  151,  876,  151,   56,  151,  151,   56,   56,  151,  151,
			  151,   56,   56,  151,   56,  151,  151,   56,   56,  151,

			  151,  151,   56,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  905,  882,  882,  882,  876,  882,  876,  882,
			  882,  882,  876,  876,  902,  902,  876,  876,  151,  151,
			   56,  151,   56,  151,   56,  151,  151,  151,   56,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  906,  882,
			  882,  882,  882,  876,  882,  882,  876,  876,  904,  904,
			  876,  151,  151,   56,  151,   56,  151,   56,  151,  151,
			   56,  876,  876,  876,  876,  876,  906,  882,  882,  882,
			  882,  876,  876,  904,  904,  151,  151,   56,  151,   56,
			  151,  876,  876,  907,  876,  882,  882,  882,  882,  876,

			  876,  904,  151,  151,   56,  151,   56,  151,  876,  876,
			  907,  876,  882,  882,  876,  876,  904,  151,  151,  876,
			  876,  882,  882,  876,  876,  904,  151,  151,  876,  876,
			  876,  876,  876,  876,  882,  876,  876,  151,  876,  876,
			  876,  876,  876,  876,  882,  876,  876,  151,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,    0,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,

			  876,  876,  876,  876,  876,  876,  876,  876, yy_Dummy>>)
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
			   89,   89,   89,    0,    0,    0,    0,  100,    0,    0,
			    0,   92,    0,   92,   92,   92,    0,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   39,
			   92,   39,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   95,  113,  115,  114,  111,  110,
			  112,  113,  113,  113,  113,   96,   99,    0,   96,    0,
			    0,    0,   97,   98,    0,    0,   71,   69,    0,   68,
			    0,   67,  123,  117,  123,  123,  123,  123,  123,  123,
			    4,   33,  107,    0,    0,    0,    0,    0,  103,    0,
			  101,    0,    0,    0,    0,    0,    0,   89,   89,   38,
			   89,   89,   89,   89,   89,   89,   89,   89,    0,   89,
			   89,   89,   89,   41,   89,   89,   87,   81,   81,   81,
			   81,   88,   89,   88,   88,   88,   89,   89,   89,   89,
			   89,   89,   40,   89,    0,    0,    0,   91,   94,    0,

			   92,   92,   38,    0,    0,   92,   92,   38,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,    0,   92,   92,   92,   64,   64,
			   92,   92,   92,   92,   41,   41,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   40,   40,   92,   92,  113,  113,  113,  113,  113,  113,
			  113,    0,   97,   98,    0,    0,   70,   68,   67,   71,
			  121,  124,  124,  122,  118,  119,  120,  107,    0,  107,
			    0,    0,    0,  103,    0,    0,    0,  106,  101,    0,
			    0,    0,    0,    0,   90,   89,   89,   89,   89,   89,

			   37,   89,   89,   89,   89,    0,   89,   89,   89,   89,
			   89,   89,   80,   89,   89,   89,    0,    0,   80,   80,
			   80,   36,    0,   43,   89,   89,   89,   89,   66,    0,
			    0,    0,    0,    0,    0,   61,   92,   92,    0,   92,
			   92,   92,   92,   92,   92,   92,   92,   37,   92,   92,
			   37,   92,   92,   92,   92,   92,   92,   92,   92,    0,
			   92,   92,   92,   92,   92,   92,   92,   92,   36,   43,
			   36,   43,   92,   92,   92,   92,   92,   92,   92,   98,
			  107,    0,    0,    0,  102,  103,    0,  104,    0,  106,
			    0,    0,    0,  101,   77,    0,    0,    0,   58,   89,

			   89,   89,   89,   89,   89,   44,   89,    0,   89,   89,
			   35,   89,   89,   89,    0,    0,   89,   89,    0,   89,
			   89,   89,   89,    0,    0,   65,    0,   63,    0,   62,
			    0,   58,   92,    0,    0,   58,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   44,   92,   44,
			   92,   92,   35,   64,   64,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,  107,
			    0,    0,    0,  103,  104,    0,    0,  106,    0,    0,
			    0,    0,   77,    0,    0,    0,   89,   59,   89,   60,
			   89,   89,   46,   89,    0,   89,   89,   89,   89,   89,

			   80,   80,    0,   52,   89,   89,   89,    0,    0,    0,
			    0,    0,    0,    0,   92,    0,    0,   59,   59,   92,
			   60,   92,   60,   92,   92,   46,   92,   92,   46,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   52,   92,   92,   92,   52,   92,    0,    0,   93,    0,
			  104,    0,  107,    0,   79,    0,    0,  105,    0,   89,
			   89,   57,   89,   45,    0,   42,   56,   34,   89,   50,
			    0,   89,   89,   89,    0,    0,    0,    0,    0,    0,
			   92,    0,   92,   92,   57,   92,   57,   92,   45,   42,
			   56,   42,   56,   34,   34,   92,   50,   92,   50,   92,

			   92,   92,   92,    0,    0,  104,    0,    0,    0,    0,
			   76,  105,    0,   89,   89,   89,   84,   89,    0,   89,
			   89,   53,    0,    0,    0,    0,    0,   94,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   53,   92,  106,
			    0,  106,    0,    0,    0,    0,   76,  105,    0,   89,
			   89,   47,   89,   83,   51,   89,    0,    0,    0,    0,
			    0,   92,   92,   92,   47,   47,   92,   92,   51,   92,
			   51,  106,   78,    0,   76,  105,    0,   89,   89,   89,
			   89,   82,   82,   82,   82,   92,   92,   92,   92,   92,
			   92,    0,    0,    0,    0,   89,   49,   48,   89,    0,

			    0,    0,   92,   49,   49,   48,   48,   92,    0,    0,
			    0,    0,   89,   89,    0,    0,    0,   92,   92,   75,
			   72,   89,   54,    0,    0,    0,   92,   54,    0,    0,
			   75,    0,    0,    0,   89,    0,    0,   92,    0,    0,
			   72,    0,    0,   72,   55,    0,    0,   55,    0,   74,
			    0,    0,    0,    0,    0,    0,   74,   72,    0,    0,
			    0,    0,    0,    0,    0,   73,   85,   86,    0,    0,
			    0,   73,    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5039
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 876
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 877
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

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER = 1024
				-- Initial size for `in_buffer'

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

end
