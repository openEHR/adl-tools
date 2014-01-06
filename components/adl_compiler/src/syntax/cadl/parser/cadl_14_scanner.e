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
--|#line 71 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 71")
end
-- Ignore separators
else
--|#line 72 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 72")
end
in_lineno := in_lineno + text_count
end
else
--|#line 77 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 77")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 78 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 78")
end
in_lineno := in_lineno + 1
else
--|#line 82 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 82")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 83 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 83")
end
last_token := Plus_code
else
--|#line 84 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 84")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 85 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 85")
end
last_token := Slash_code
else
--|#line 86 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 86")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 87 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 87")
end
last_token := Equal_code
else
--|#line 88 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 88")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 89 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 89")
end
last_token := Semicolon_code
else
--|#line 90 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 90")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 91 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 91")
end
last_token := Colon_code
else
--|#line 92 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 92")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 93 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 93")
end
last_token := Left_parenthesis_code
else
--|#line 94 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 94")
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
--|#line 95 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 95")
end
last_token := Dollar_code
else
--|#line 97 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 97")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
--|#line 99 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 99")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 101 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 101")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 102 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 102")
end
last_token := Right_bracket_code
else
--|#line 104 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 104")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 24 then
--|#line 105 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 105")
end
last_token := SYM_END_CBLOCK
else
--|#line 107 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 107")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 108 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 108")
end
last_token := SYM_LE
else
--|#line 109 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 109")
end
last_token := SYM_NE
end
else
if yy_act = 28 then
--|#line 111 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 111")
end
last_token := SYM_LT
else
--|#line 112 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 112")
end
last_token := SYM_GT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 114 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 114")
end
last_token := SYM_MODULO
else
--|#line 115 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 115")
end
last_token := SYM_DIV
end
else
if yy_act = 32 then
--|#line 117 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 117")
end
last_token := SYM_ELLIPSIS
else
--|#line 118 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 118")
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
--|#line 122 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 122")
end
last_token := SYM_MATCHES
else
--|#line 124 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 124")
end
last_token := SYM_MATCHES
end
else
--|#line 128 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 128")
end
last_token := SYM_THEN
end
else
if yy_act = 37 then
--|#line 130 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 130")
end
last_token := SYM_ELSE
else
--|#line 132 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 132")
end
last_token := SYM_AND
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 134 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 134")
end
last_token := SYM_OR
else
--|#line 136 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 136")
end
last_token := SYM_XOR
end
else
if yy_act = 41 then
--|#line 138 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 138")
end
last_token := SYM_NOT
else
--|#line 140 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 140")
end
last_token := SYM_IMPLIES
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 142 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 142")
end
last_token := SYM_TRUE
else
--|#line 144 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 144")
end
last_token := SYM_FALSE
end
else
if yy_act = 45 then
--|#line 146 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 146")
end
last_token := SYM_FORALL
else
--|#line 148 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 148")
end
last_token := SYM_EXISTS
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 152 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 152")
end
last_token := SYM_EXISTENCE
else
--|#line 154 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 154")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 49 then
--|#line 156 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 156")
end
last_token := SYM_CARDINALITY
else
--|#line 158 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 158")
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
--|#line 160 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 160")
end
last_token := SYM_UNORDERED
else
--|#line 162 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 162")
end
last_token := SYM_UNIQUE
end
else
if yy_act = 53 then
--|#line 164 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 164")
end
last_token := SYM_USE_NODE
else
--|#line 166 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 166")
end
last_token := SYM_USE_ARCHETYPE
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 168 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 168")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 170 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 170")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 57 then
--|#line 172 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 172")
end
last_token := SYM_EXCLUDE
else
--|#line 174 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 174")
end
last_token := SYM_AFTER
end
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
--|#line 176 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 176")
end
last_token := SYM_BEFORE
else
--|#line 178 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 178")
end
last_token := SYM_CLOSED
end
else
if yy_act = 61 then
--|#line 181 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 181")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 186 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 186")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 193 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 193")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 209 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 209")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
end
else
if yy_act = 65 then
--|#line 217 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 217")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
else
--|#line 224 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 224")
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
if yy_act <= 99 then
if yy_act <= 83 then
if yy_act <= 75 then
if yy_act <= 71 then
if yy_act <= 69 then
if yy_act <= 68 then
if yy_act = 67 then
--|#line 231 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 231")
end
in_lineno := in_lineno + text_count
else
--|#line 234 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 234")
end
in_lineno := in_lineno + 1
end
else
--|#line 236 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 236")
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
if yy_act = 70 then
--|#line 257 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 257")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 263 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 263")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
--|#line 270 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 270")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 271 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 271")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 272 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 272")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 279 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 279")
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
--|#line 280 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 280")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 287 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 287")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 288 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 288")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 295 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 295")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 296 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 296")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 303 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 303")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 82 then
--|#line 315 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 315")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 325 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 325")
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
--|#line 330 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 330")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 340 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 340")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 86 then
--|#line 346 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 346")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 357 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 357")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 366 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 366")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 380 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 380")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 90 then
--|#line 387 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 387")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 393 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 393")
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
--|#line 399 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 399")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 403 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 403")
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
--|#line 445 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 445")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 451 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 451")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 457 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 457")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 463 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 463")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 98 then
--|#line 470 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 470")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 476 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 476")
end
		-- matches an absolute path string with segments of form "/attr_name/attr_name/..." or "/attr_name[code]/.."
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
--|#line 482 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 482")
end
		-- matches a relative path string with segments of form "attr_name/attr_name/..." or "attr_name[code]/.."
				last_token := V_REL_PATH
				last_string_value := text
			
else
--|#line 488 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 488")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 495 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 495")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 103 then
--|#line 499 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 499")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 503 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 503")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 507 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 507")
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
--|#line 519 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 519")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 107 then
--|#line 526 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 526")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 531 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 531")
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
--|#line 546 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 546")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 547 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 547")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 111 then
--|#line 551 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 551")
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
--|#line 552 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 552")
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
--|#line 553 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 553")
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
--|#line 573 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 573")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 578 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 578")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 586 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 586")
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
--|#line 588 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 588")
end
in_buffer.append_character ('"')
else
--|#line 590 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 590")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 594 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 594")
end
in_buffer.append_string (text)
else
--|#line 596 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 596")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 601 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 601")
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
--|#line 612 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 612")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 621 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 621")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 623 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 623")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 624 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 624")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 625 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 625")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 626 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 626")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 627 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 627")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 629 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 629")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 630 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 630")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 634 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 634")
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
			create an_array.make_filled (0, 0, 6301)
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
			   28,   28,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   38,   41,   42,   38,   43,
			   44,   45,   46,   38,   38,   38,   47,   48,   38,   49,
			   50,   38,   51,   52,   53,   54,   12,   55,   56,   57,
			   58,   59,   60,   58,   61,   62,   58,   63,   64,   65,
			   58,   58,   58,   58,   66,   67,   58,   58,   68,   69,
			   70,   71,   72,   12,   12,   12,   12,   12,   12,   12,
			   12,   74,   83,   93,   83,   75,   74,   93,  101,   95,

			   75,   95,   95,  105,  151,  106,  106,  106,  106,  106,
			  189,  109,  152,  110,  197,  111,  111,  111,  111,  111,
			  116,  116,  188,  116,  188,  188,  201,   84,   85,   84,
			   85,  109,  204,  110,  234,  113,  113,  113,  113,  113,
			  244,   76,  102,  118,  140,  766,   76,  245,   94,  198,
			  199,  155,   94,  112,  155,   95,  190,   95,   95,  156,
			  765,  210,  202,  203,  210,  702,  703,  198,  199,  235,
			  715,  715,  140,  112,   77,   78,   79,   80,   81,   77,
			   78,   79,   80,   81,   86,   87,   88,   86,   87,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   89,   90,

			   86,   90,   90,   90,   90,   90,   86,   86,   86,   86,
			   86,   86,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   86,   86,   91,   86,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,  116,  116,  117,  116,  116,  116,
			  205,  116,  287,  205,  116,  116,  214,  116,  214,  197,
			  116,  116,  748,  116,  708,  116,  116,  118,  116,  116,

			  116,  118,  116,  749,  187,  117,  119,  118,  187,  122,
			  120,  123,  121,  118,  244,  295,  743,  127,  118,  288,
			  124,  245,  118,  296,  198,  199,  742,  116,  116,  128,
			  116,  125,  207,  129,  119,  709,  349,  122,  120,  123,
			  121,  215,  126,  215,  350,  127,  116,  116,  124,  116,
			  118,  116,  116,  718,  116,  116,  116,  128,  116,  125,
			  155,  129,  187,  155,  130,  131,  158,  181,  156,  118,
			  132,  126,  182,  133,  118,  157,  116,  116,  118,  116,
			  116,  116,  192,  116,  135,  194,  194,  158,  116,  116,
			  134,  116,  130,  131,  158,  181,  630,  136,  132,  118,

			  182,  133,  244,  118,  188,  155,  188,  188,  155,  245,
			  162,  118,  135,  156,  116,  116,  700,  116,  134,  148,
			  157,  630,  144,  201,  149,  136,  116,  116,  743,  116,
			  145,  236,  236,  236,  236,  236,  157,  118,  187,  171,
			  192,  137,  138,  138,  138,  138,  138,  148,  212,  118,
			  144,  212,  146,  149,  187,  162,  139,  147,  145,  202,
			  203,  155,  523,  140,  155,  116,  116,  171,  116,  156,
			  141,  405,  142,  487,  143,  229,  157,  229,  229,  155,
			  146,  488,  155,  515,  139,  147,  287,  156,  242,  187,
			  430,  140,  155,  159,  157,  155,  157,  160,  329,  161,

			  156,  142,  112,  143,  204,  155,  674,  157,  155,  155,
			  164,  162,  155,  156,  191,  191,  191,  156,  163,  165,
			  157,  159,  288,  643,  157,  160,  327,  161,  166,  162,
			  193,  193,  193,  163,  202,  203,  169,  289,  164,  198,
			  199,  167,  162,  783,  702,  703,  155,  165,  170,  155,
			  155,  642,  168,  155,  156,  162,  166,  187,  156,  162,
			  155,  157,  641,  155,  169,  157,  194,  194,  156,  167,
			  155,  333,  332,  155,  333,  157,  170,  175,  156,  155,
			  640,  168,  155,  172,  173,  157,  458,  156,  630,  174,
			  358,  358,  358,  358,  157,  552,  162,  458,  155,  176,

			  162,  155,  626,  234,  163,  175,  156,  458,  177,  183,
			  162,  172,  173,  157,  157,  155,  599,  174,  155,  209,
			  162,  178,  209,  156,  243,  458,  441,  176,  187,  162,
			  157,  210,  179,  195,  195,  195,  177,  183,  432,  209,
			  180,  212,  209,  205,  222,  557,  205,  479,  162,  178,
			  480,  210,  211,  223,  223,  223,  223,  223,  557,  479,
			  179,  212,  479,  184,  534,  162,  228,  228,  180,  228,
			  519,  207,  231,  231,  231,  231,  231,  109,  109,  110,
			  363,  239,  239,  239,  239,  239,  240,  232,  224,  344,
			  447,  207,  184,  217,  217,  207,  217,  241,  241,  241,

			  241,  241,  434,  225,  191,  191,  191,  226,  434,  227,
			  233,  334,  332,  479,  334,  232,  480,  332,  218,  112,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  237,  237,  237,  237,  237,  109,  232,
			  110,  332,  239,  239,  239,  239,  239,  328,  238,  409,
			  555,  116,  116,  555,  116,  552,  116,  116,  607,  116,
			  783,  408,  233,  219,  243,  244,  593,  232,  408,  243,
			  244,  187,  245,  625,  118,  117,  238,  245,  401,  118,
			  112,  116,  116,  593,  116,  116,  116,  593,  116,  117,

			  281,  117,  363,  362,  243,  244,  354,  783,  243,  244,
			  247,  625,  245,  117,  118,  343,  245,  342,  118,  116,
			  116,  593,  116,  116,  116,  249,  116,  248,  281,  341,
			  117,  340,  243,  244,  337,  783,  243,  244,  247,  208,
			  245,  327,  118,  328,  245,  187,  118,  116,  116,  783,
			  116,  250,  551,  249,  327,  248,  187,  191,  191,  191,
			  243,  244,  187,  290,  154,  251,  336,  336,  245,  336,
			  118,  656,  656,  656,  116,  116,  287,  116,  266,  250,
			  117,  158,  158,  158,  158,  158,  252,  243,  244,  116,
			  116,  218,  116,  251,  117,  245,  117,  118,  230,  229,

			  708,  553,  243,  244,  300,  228,  116,  116,  117,  116,
			  245,  630,  118,  221,  252,  543,   99,  253,  254,  243,
			  244,  325,  325,  325,  255,  117,  543,  245,   96,  118,
			  116,  116,  300,  116,  116,  116,  543,  116,  326,  326,
			  326,  710,  256,  243,  244,  253,  254,  243,  244,  208,
			  187,  245,  255,  118,  543,  258,  484,  118,  185,  484,
			  548,  116,  116,  154,  116,  116,  116,  115,  116,  114,
			  256,  549,  257,  107,  243,  244,  783,  104,  243,  244,
			  555,  550,  245,  520,  118,  520,  245,   99,  118,  116,
			  116,  117,  116,  521,  260,  116,  116,   97,  116,  549, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  257,  259,  243,  244,   96,  117,  783,  117,  243,  244,
			  245,  783,  118,  783,  116,  116,  245,  116,  118,  117,
			  783,  522,  260,  484,  783,  634,  484,  243,  244,  259,
			  783,  116,  116,  783,  116,  245,  117,  118,  783,  262,
			  783,  783,  634,  261,  243,  244,  634,  555,  116,  116,
			  783,  116,  245,  209,  118,  783,  209,  108,  263,  783,
			  264,  243,  244,  783,  783,  210,  783,  262,  783,  245,
			  634,  118,  108,  108,  108,  212,  116,  116,  265,  116,
			  158,  158,  158,  158,  158,  783,  263,  783,  264,  243,
			  244,  137,  585,  585,  585,  585,  298,  245,  783,  118,

			  116,  116,  783,  116,  783,  207,  265,  267,  243,  268,
			  783,  783,  783,  243,  244,  137,  245,  117,  783,  783,
			  274,  245,  282,  118,  298,  269,  283,  783,  783,  270,
			  139,  117,  271,  117,  158,  158,  158,  158,  158,  117,
			  783,  272,  783,  273,  274,  117,  142,  783,  336,  336,
			  282,  336,  783,  269,  283,  117,  279,  270,  139,  280,
			  271,  301,  117,  158,  158,  158,  158,  158,  258,  117,
			  272,  117,  273,  783,  603,  142,  275,  275,  275,  275,
			  275,  783,  783,  117,  279,  603,  783,  280,  783,  301,
			  117,  291,  291,  291,  276,  604,  117,  277,  187,  783,

			  117,  117,  284,  278,  117,  783,  117,  783,  285,  187,
			  117,  783,  117,  603,  783,  117,  209,  117,  117,  209,
			  674,  674,  276,  674,  117,  277,  117,  783,  210,  117,
			  284,  278,  783,  783,  636,  117,  285,  783,  212,  187,
			  117,  117,  117,  695,  286,  155,  117,  783,  155,  155,
			  783,  636,  155,  156,  117,  636,  783,  156,  243,  244,
			  157,  783,  243,  244,  157,  783,  245,  187,  207,  155,
			  245,  117,  155,  286,  191,  191,  191,  156,  783,  636,
			  783,  783,  243,  244,  157,  193,  193,  193,  155,  187,
			  245,  155,  783,  292,  783,  162,  156,  783,  783,  162,

			  783,  243,  244,  157,  783,  293,  783,  783,  783,  245,
			  158,  158,  158,  158,  158,  195,  195,  195,  294,  162,
			  783,  292,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  783,  293,  155,  302,  299,  155,  162,  783,
			  307,  303,  156,  191,  191,  191,  294,  243,  244,  157,
			  297,  297,  297,  297,  297,  245,  158,  158,  158,  158,
			  158,  783,  783,  302,  299,  191,  191,  191,  307,  303,
			  158,  158,  158,  158,  158,  783,  304,  158,  158,  158,
			  158,  158,  783,  783,  162,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  783,  305,  783,  783,  331,

			  332,  306,  331,  783,  304,  158,  158,  158,  158,  158,
			  783,  333,  158,  158,  158,  158,  158,  783,  309,  187,
			  783,  334,  783,  308,  305,  311,  783,  783,  667,  306,
			  783,  783,  783,  310,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  783,  667,  309,  783,  312,  667,
			  783,  335,  783,  311,  313,  158,  158,  158,  158,  158,
			  783,  310,  158,  158,  158,  158,  158,  783,  158,  158,
			  158,  158,  158,  667,  783,  783,  312,  746,  746,  746,
			  746,  315,  313,  317,  314,  316,  783,  783,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  320,  321,

			  322,  323,  324,  338,  339,  339,  339,  339,  339,  315,
			  783,  317,  314,  316,  318,  346,  783,  346,  783,  783,
			  347,  347,  347,  347,  347,  319,  348,  348,  348,  348,
			  348,  345,  345,  345,  345,  345,  351,  351,  351,  351,
			  351,  783,  318,  355,  783,  355,  232,  783,  356,  356,
			  356,  356,  356,  783,  319,  330,  331,  332,  330,  331,
			  330,  330,  330,  330,  330,  330,  330,  330,  333,  233,
			  783,  330,  783,  783,  232,  783,  783,  330,  334,  330,
			  330,  330,  330,  352,  352,  352,  352,  352,  109,  783,
			  110,  783,  357,  357,  357,  357,  357,  783,  353,  359,

			  359,  359,  359,  359,  117,  364,  330,  330,  335,  330,
			  381,  381,  381,  381,  381,  783,  783,  783,  117,  783,
			  117,  354,  768,  768,  768,  768,  353,  783,  783,  783,
			  112,  783,  117,  364,  330,  330,  330,  330,  330,  330,
			  330,  330,  330,  330,  330,  217,  217,  783,  217,  117,
			  382,  382,  382,  382,  382,  117,  117,  117,  117,  117,
			  402,  402,  402,  402,  402,  287,  783,  783,  783,  783,
			  218,  783,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  783,  783,  783,  783,  783,

			  117,  117,  117,  117,  117,  783,  658,  659,  658,  659,
			  117,  670,  783,  117,  367,  670,  783,  783,  117,  365,
			  117,  783,  366,  783,  117,  219,  117,  117,  117,  117,
			  117,  783,  670,  368,  117,  783,  117,  783,  117,  783,
			  783,  117,  367,  670,  660,  783,  117,  365,  117,  783,
			  366,  783,  117,  369,  783,  117,  783,  783,  117,  117,
			  783,  368,  783,  783,  783,  117,  117,  783,  117,  783,
			  783,  117,  117,  117,  783,  783,  117,  370,  117,  783,
			  117,  369,  117,  783,  783,  117,  117,  117,  117,  783,
			  783,  371,  117,  783,  117,  783,  373,  117,  117,  117,

			  117,  117,  362,  783,  117,  370,  117,  374,  783,  783,
			  117,  372,  117,  721,  117,  362,  117,  117,  374,  371,
			  473,  721,  783,  117,  117,  783,  117,  783,  374,  783,
			  375,  473,  783,  783,  721,  783,  783,  783,  117,  372,
			  117,  473,  783,  117,  783,  783,  374,  117,  783,  721,
			  117,  117,  117,  376,  783,  377,  378,  117,  375,  473,
			  783,  117,  783,  117,  117,  117,  117,  117,  783,  117,
			  783,  117,  722,  117,  783,  117,  783,  783,  117,  117,
			  722,  376,  783,  377,  378,  117,  783,  783,  783,  117,
			  783,  730,  117,  722,  783,  117,  117,  117,  380,  730,

			  783,  783,  117,  117,  379,  117,  395,  783,  722,  783,
			  783,  117,  730,  117,  735,  117,  735,  117,  783,  383,
			  383,  383,  383,  383,  736,  117,  380,  730,  783,  117,
			  783,  117,  379,  117,  117,  783,  783,  385,  385,  385,
			  385,  385,  117,  117,  783,  731,  783,  384,  783,  117,
			  783,  117,  737,  731,  783,  386,  386,  386,  386,  386,
			  117,  117,  783,  783,  783,  117,  731,  117,  783,  117,
			  783,  783,  783,  387,  387,  387,  387,  387,  117,  117,
			  783,  731,  783,  384,  783,  117,  389,  117,  390,  783,
			  783,  388,  388,  388,  388,  388,  117,  117,  783,  783, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  783,  384,  783,  117,  783,  117,  783,  783,  391,  671,
			  117,  392,  783,  671,  117,  117,  783,  393,  783,  384,
			  783,  117,  783,  278,  117,  783,  117,  783,  783,  447,
			  671,  783,  117,  117,  783,  783,  391,  783,  117,  392,
			  117,  671,  603,  117,  396,  393,  117,  783,  394,  783,
			  117,  278,  769,  605,  117,  117,  117,  117,  398,  117,
			  117,  783,  117,  606,  117,  783,  783,  783,  117,  769,
			  447,  117,  396,  769,  117,  397,  394,  783,  117,  783,
			  117,  605,  117,  604,  783,  117,  398,  783,  117,  783,
			  783,  117,  117,  783,  606,  783,  117,  769,  117,  783,

			  783,  783,  117,  397,  606,  117,  399,  783,  783,  117,
			  117,  158,  158,  158,  158,  158,  117,  783,  117,  117,
			  783,  117,  606,  400,  783,  783,  406,  117,  783,  783,
			  117,  783,  403,  117,  404,  404,  404,  404,  404,  287,
			  158,  158,  158,  158,  158,  783,  783,  117,  783,  783,
			  117,  761,  400,  761,  406,  158,  158,  158,  158,  158,
			  783,  762,  783,  407,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  783,
			  783,  783,  783,  411,  783,  783,  783,  410,  783,  763,
			  783,  407,  158,  158,  158,  158,  158,  783,  783,  783,

			  783,  412,  158,  158,  158,  158,  158,  413,  783,  783,
			  783,  411,  783,  783,  783,  410,  158,  158,  158,  158,
			  158,  783,  414,  783,  158,  158,  158,  158,  158,  412,
			  158,  158,  158,  158,  158,  413,  158,  158,  158,  158,
			  158,  783,  630,  415,  158,  158,  158,  158,  158,  670,
			  414,  416,  752,  672,  722,  783,  418,  158,  158,  158,
			  158,  158,  723,  752,  419,  783,  783,  783,  417,  783,
			  672,  415,  783,  752,  783,  723,  420,  783,  783,  416,
			  783,  672,  783,  783,  418,  158,  158,  158,  158,  158,
			  723,  752,  419,  158,  158,  158,  158,  158,  421,  158,

			  158,  158,  158,  158,  420,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  423,  158,  158,  158,  158,  158,  421,  783,  422,  783,
			  425,  783,  424,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  783,  783,  783,  426,  783,  423,  158,
			  158,  158,  158,  158,  783,  783,  422,  783,  425,  427,
			  424,  158,  158,  158,  158,  158,  338,  339,  339,  339,
			  339,  339,  783,  783,  426,  783,  428,  347,  347,  347,
			  347,  347,  431,  431,  431,  431,  431,  427,  433,  433,
			  433,  433,  433,  429,  435,  435,  435,  435,  435,  436,

			  436,  436,  436,  436,  437,  783,  437,  783,  783,  438,
			  438,  438,  438,  438,  353,  439,  439,  439,  439,  439,
			  432,  783,  429,  356,  356,  356,  356,  356,  440,  440,
			  440,  440,  440,  776,  777,  776,  777,  354,  783,  783,
			  442,  443,  353,  444,  444,  444,  444,  444,  445,  445,
			  445,  445,  445,  446,  446,  446,  446,  446,  783,  783,
			  783,  783,  783,  783,  783,  783,  441,  783,  783,  783,
			  783,  778,  783,  117,  117,  783,  783,  117,  783,  783,
			  117,  783,  452,  117,  453,  449,  783,  117,  117,  117,
			  450,  117,  451,  117,  117,  783,  117,  117,  783,  117,

			  783,  117,  117,  783,  783,  117,  783,  783,  117,  783,
			  452,  117,  453,  449,  630,  117,  783,  783,  117,  450,
			  451,  117,  117,  783,  783,  117,  731,  783,  117,  117,
			  783,  117,  783,  783,  732,  117,  454,  117,  783,  117,
			  783,  783,  783,  117,  671,  117,  456,  732,  673,  117,
			  783,  783,  783,  455,  783,  117,  783,  783,  770,  117,
			  117,  117,  732,  783,  454,  673,  117,  117,  457,  783,
			  783,  117,  117,  117,  456,  770,  673,  459,  117,  770,
			  783,  455,  783,  783,  117,  117,  117,  117,  117,  783,
			  117,  783,  117,  460,  117,  783,  457,  117,  773,  117,

			  117,  462,  783,  770,  117,  459,  117,  783,  783,  783,
			  117,  117,  461,  117,  783,  773,  117,  117,  117,  773,
			  117,  460,  463,  117,  117,  117,  117,  774,  783,  462,
			  783,  783,  117,  381,  381,  381,  381,  381,  117,  783,
			  461,  783,  117,  773,  774,  117,  783,  783,  774,  117,
			  463,  783,  783,  783,  783,  117,  783,  464,  783,  117,
			  465,  117,  244,  783,  382,  382,  382,  382,  382,  245,
			  783,  783,  774,  117,  783,  383,  383,  383,  383,  383,
			  385,  385,  385,  385,  385,  464,  783,  783,  465,  117,
			  117,  466,  783,  691,  783,  783,  467,  691,  117,  386,

			  386,  386,  386,  386,  783,  117,  783,  117,  388,  388,
			  388,  388,  388,  269,  691,  783,  753,  117,  783,  466,
			  783,  783,  783,  783,  467,  691,  117,  753,  783,  272,
			  783,  783,  783,  783,  117,  783,  117,  753,  783,  783,
			  117,  269,  783,  387,  387,  387,  387,  387,  469,  469,
			  469,  469,  469,  783,  117,  753,  783,  468,  272,  470,
			  470,  470,  470,  470,  783,  783,  783,  783,  117,  117,
			  117,  117,  783,  117,  783,  471,  471,  471,  471,  471,
			  783,  783,  117,  783,  783,  468,  783,  692,  783,  117,
			  783,  692,  783,  472,  472,  472,  472,  472,  117,  117,

			  783,  783,  117,  117,  783,  117,  783,  117,  692,  783,
			  783,  783,  117,  783,  117,  783,  117,  117,  783,  692,
			  783,  117,  783,  117,  783,  117,  117,  783,  783,  783,
			  117,  783,  117,  783,  117,  117,  783,  783,  783,  117,
			  474,  117,  783,  117,  117,  783,  475,  478,  476,  783,
			  783,  117,  117,  117,  492,  492,  492,  492,  492,  477,
			  117,  117,  117,  783,  117,  117,  783,  117,  474,  783,
			  117,  783,  783,  691,  475,  783,  476,  693,  117,  117,
			  117,  158,  158,  158,  158,  158,  783,  477,  783,  783,
			  783,  117,  117,  783,  693,  482,  117,  402,  402,  402,

			  402,  402,  287,  783,  783,  693,  783,  489,  403,  117,
			  403,  403,  403,  403,  403,  287,  485,  783,  404,  404,
			  404,  404,  404,  287,  783,  158,  158,  158,  158,  158,
			  783,  783,  783,  483,  491,  489,  491,  491,  491,  491,
			  491,  158,  158,  158,  158,  158,  484,  158,  158,  158,
			  158,  158,  783,  783,  486,  490,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  494,  493,  783,  783,
			  783,  495,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  783,  783,  490,  158,  158,  158,  158,  158,
			  783,  783,  783,  783,  494,  493,  783,  783,  783,  495, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  498,  496,  783,  783,  783,  497,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  783,  499,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  498,  496,
			  500,  783,  758,  497,  158,  158,  158,  158,  158,  783,
			  783,  503,  783,  758,  783,  499,  783,  501,  158,  158,
			  158,  158,  158,  758,  783,  783,  502,  783,  500,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  503,
			  783,  758,  783,  783,  504,  501,  158,  158,  158,  158,
			  158,  783,  783,  783,  502,  505,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,

			  158,  783,  504,  783,  783,  507,  783,  508,  511,  511,
			  511,  511,  511,  505,  783,  506,  478,  783,  509,  158,
			  158,  158,  158,  158,  510,  510,  510,  510,  510,  783,
			  783,  783,  783,  507,  783,  508,  345,  345,  345,  345,
			  345,  783,  783,  506,  783,  512,  509,  512,  512,  512,
			  512,  512,  513,  513,  513,  513,  513,  438,  438,  438,
			  438,  438,  432,  783,  783,  783,  783,  353,  514,  514,
			  514,  514,  514,  516,  516,  516,  516,  516,  517,  517,
			  517,  517,  517,  518,  518,  518,  518,  518,  783,  783,
			  354,  783,  783,  783,  783,  353,  513,  513,  513,  513,

			  513,  783,  759,  117,  117,  443,  515,  444,  444,  444,
			  444,  444,  783,  759,  783,  783,  441,  117,  117,  117,
			  117,  783,  783,  759,  783,  783,  783,  783,  526,  117,
			  527,  117,  117,  783,  783,  783,  117,  529,  783,  783,
			  530,  759,  783,  117,  528,  117,  783,  783,  117,  117,
			  117,  117,  117,  117,  117,  783,  117,  117,  527,  783,
			  783,  783,  117,  531,  117,  529,  783,  783,  530,  783,
			  117,  783,  528,  783,  117,  532,  117,  783,  117,  783,
			  783,  117,  117,  783,  117,  117,  117,  783,  117,  783,
			  117,  531,  117,  535,  533,  536,  783,  692,  117,  783,

			  783,  694,  117,  532,  117,  783,  117,  117,  117,  117,
			  783,  117,  783,  783,  117,  117,  117,  783,  694,  783,
			  117,  535,  533,  536,  783,  117,  537,  783,  117,  694,
			  117,  783,  117,  117,  783,  783,  783,  117,  783,  117,
			  117,  117,  117,  783,  538,  783,  117,  783,  117,  783,
			  117,  539,  783,  117,  537,  783,  783,  783,  783,  117,
			  117,  783,  783,  783,  117,  783,  117,  783,  783,  783,
			  117,  783,  538,  117,  783,  783,  783,  117,  117,  539,
			  783,  783,  540,  540,  540,  540,  540,  384,  783,  117,
			  469,  469,  469,  469,  469,  117,  117,  783,  783,  783,

			  244,  117,  470,  470,  470,  470,  470,  245,  783,  783,
			  117,  783,  117,  783,  783,  783,  783,  541,  117,  472,
			  472,  472,  472,  472,  117,  783,  783,  783,  389,  542,
			  390,  783,  471,  471,  471,  471,  471,  783,  783,  783,
			  117,  117,  783,  783,  783,  541,  117,  544,  783,  783,
			  117,  783,  783,  392,  783,  783,  783,  542,  783,  393,
			  117,  783,  117,  783,  783,  783,  117,  545,  117,  117,
			  117,  783,  783,  783,  117,  544,  117,  783,  117,  547,
			  117,  392,  117,  117,  117,  117,  117,  393,  546,  783,
			  117,  117,  117,  783,  117,  545,  783,  117,  117,  158,

			  158,  158,  158,  158,  117,  783,  783,  547,  783,  783,
			  783,  117,  783,  783,  117,  117,  546,  783,  783,  783,
			  783,  117,  554,  554,  554,  554,  554,  287,  403,  783,
			  556,  556,  556,  556,  556,  287,  158,  158,  158,  158,
			  158,  491,  783,  491,  491,  491,  491,  491,  409,  783,
			  492,  492,  492,  492,  492,  245,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  484,  783,  783,  783,
			  783,  560,  783,  783,  558,  783,  783,  783,  783,  559,
			  783,  783,  783,  561,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  783,  783,  783,  783,  562,  560,

			  783,  783,  783,  563,  783,  158,  158,  158,  158,  158,
			  783,  561,  158,  158,  158,  158,  158,  783,  783,  783,
			  564,  158,  158,  158,  158,  158,  562,  783,  783,  783,
			  783,  563,  565,  783,  158,  158,  158,  158,  158,  783,
			  783,  566,  158,  158,  158,  158,  158,  783,  564,  567,
			  158,  158,  158,  158,  158,  783,  568,  783,  783,  783,
			  565,  158,  158,  158,  158,  158,  783,  783,  783,  566,
			  158,  158,  158,  158,  158,  783,  569,  567,  158,  158,
			  158,  158,  158,  783,  568,  158,  158,  158,  158,  158,
			  783,  783,  783,  571,  783,  783,  570,  783,  783,  783,

			  572,  783,  783,  783,  569,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  573,  571,  783,  783,  570,  783,  783,  783,  572,  576,
			  576,  576,  576,  576,  783,  783,  574,  512,  575,  512,
			  512,  512,  512,  512,  783,  783,  783,  783,  573,  783,
			  513,  513,  513,  513,  513,  783,  579,  579,  579,  579,
			  579,  783,  783,  783,  574,  578,  575,  580,  580,  580,
			  580,  580,  783,  783,  783,  577,  581,  581,  581,  581,
			  581,  582,  582,  582,  582,  582,  583,  583,  583,  583,
			  583,  783,  783,  578,  515,  584,  584,  584,  584,  584,

			  586,  586,  586,  586,  586,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  238,  783,  588,  589,  783,
			  117,  117,  783,  783,  117,  117,  590,  783,  117,  783,
			  783,  783,  783,  783,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  238,  117,  588,  589,  117,  117,  117,
			  783,  783,  117,  117,  590,  591,  117,  783,  783,  783,
			  783,  117,  783,  117,  783,  117,  117,  783,  783,  117,
			  117,  783,  117,  117,  783,  117,  783,  117,  592,  783,
			  783,  783,  783,  591,  783,  783,  117,  783,  117,  783,
			  594,  117,  117,  117,  783,  117,  595,  783,  783,  783,

			  117,  783,  783,  783,  783,  117,  592,  783,  783,  117,
			  783,  117,  783,  117,  117,  597,  783,  117,  594,  598,
			  783,  783,  117,  117,  595,  783,  596,  117,  117,  117,
			  117,  783,  783,  117,  783,  117,  783,  783,  783,  783,
			  117,  117,  117,  597,  783,  783,  117,  598,  540,  540,
			  540,  540,  540,  783,  596,  783,  783,  783,  117,  117,
			  117,  783,  117,  783,  117,  783,  117,  783,  117,  117,
			  601,  117,  602,  608,  117,  608,  608,  608,  608,  608,
			  600,  783,  117,  783,  117,  117,  117,  117,  117,  783,
			  783,  117,  783,  783,  117,  783,  117,  117,  601,  117, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  602,  158,  158,  158,  158,  158,  783,  783,  600,  783,
			  783,  783,  609,  117,  783,  783,  117,  117,  482,  783,
			  554,  554,  554,  554,  554,  287,  485,  783,  556,  556,
			  556,  556,  556,  287,  158,  158,  158,  158,  158,  783,
			  609,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  783,  610,  783,  783,  783,  483,  158,  158,  158,
			  158,  158,  783,  783,  486,  158,  158,  158,  158,  158,
			  783,  783,  611,  158,  158,  158,  158,  158,  783,  783,
			  610,  158,  158,  158,  158,  158,  783,  612,  783,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  783,

			  611,  613,  783,  158,  158,  158,  158,  158,  783,  615,
			  158,  158,  158,  158,  158,  612,  614,  158,  158,  158,
			  158,  158,  783,  783,  783,  617,  783,  783,  783,  613,
			  616,  618,  158,  158,  158,  158,  158,  615,  158,  158,
			  158,  158,  158,  783,  614,  783,  783,  158,  158,  158,
			  158,  158,  783,  617,  783,  783,  783,  783,  616,  618,
			  620,  783,  783,  783,  619,  158,  158,  158,  158,  158,
			  510,  510,  510,  510,  510,  622,  783,  622,  783,  621,
			  623,  623,  623,  623,  623,  783,  783,  783,  620,  783,
			  783,  783,  619,  623,  623,  623,  623,  623,  624,  624,

			  624,  624,  624,  783,  783,  783,  783,  621,  517,  517,
			  517,  517,  517,  627,  627,  627,  627,  627,  628,  628,
			  628,  628,  628,  629,  629,  629,  629,  629,  783,  783,
			  783,  515,  783,  783,  783,  783,  783,  783,  625,  783,
			  783,  783,  783,  117,  117,  783,  783,  783,  117,  117,
			  632,  783,  783,  633,  117,  631,  783,  117,  117,  117,
			  117,  354,  117,  117,  117,  117,  625,  783,  117,  783,
			  117,  117,  117,  783,  783,  783,  117,  117,  632,  783,
			  783,  633,  117,  631,  117,  783,  783,  783,  117,  117,
			  117,  783,  783,  117,  117,  117,  783,  783,  117,  117,

			  117,  783,  783,  783,  117,  783,  117,  783,  783,  117,
			  783,  117,  117,  783,  783,  783,  117,  117,  117,  783,
			  117,  637,  783,  117,  635,  783,  783,  783,  783,  117,
			  117,  117,  117,  117,  117,  117,  117,  783,  783,  783,
			  117,  783,  117,  783,  117,  117,  638,  783,  117,  637,
			  783,  783,  635,  117,  639,  783,  117,  783,  117,  783,
			  783,  117,  117,  783,  783,  117,  783,  117,  783,  117,
			  117,  783,  783,  608,  638,  608,  608,  608,  608,  608,
			  783,  117,  639,  783,  783,  783,  783,  117,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  117,  158,

			  158,  158,  158,  158,  158,  158,  158,  158,  158,  783,
			  783,  645,  783,  647,  646,  783,  783,  648,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  783,  783,
			  783,  647,  646,  783,  783,  648,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  783,  783,  649,  783,
			  783,  650,  158,  158,  158,  158,  158,  783,  783,  651,
			  623,  623,  623,  623,  623,  783,  783,  652,  623,  623,
			  623,  623,  623,  783,  783,  783,  649,  783,  783,  650,

			  653,  653,  653,  653,  653,  783,  783,  651,  783,  783,
			  783,  654,  783,  654,  783,  652,  655,  655,  655,  655,
			  655,  657,  657,  657,  657,  657,  661,  661,  661,  661,
			  661,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  625,  783,  783,  783,  663,  117,  117,  783,  783,
			  666,  117,  664,  783,  117,  665,  783,  783,  783,  783,
			  117,  117,  117,  117,  354,  117,  783,  117,  117,  625,
			  117,  783,  668,  663,  117,  117,  783,  783,  666,  117,
			  664,  117,  117,  665,  783,  783,  117,  783,  117,  783,
			  783,  117,  117,  783,  783,  117,  117,  117,  783,  117,

			  668,  783,  117,  669,  158,  158,  158,  158,  158,  117,
			  158,  158,  158,  158,  158,  783,  117,  117,  117,  783,
			  783,  783,  783,  675,  783,  783,  117,  783,  783,  783,
			  117,  669,  783,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  783,  783,  783,  783,  117,  783,  783,
			  783,  675,  676,  677,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  783,  783,  783,  678,  158,  158,
			  158,  158,  158,  679,  655,  655,  655,  655,  655,  783,
			  676,  677,  783,  680,  681,  681,  681,  681,  681,  682,
			  682,  682,  682,  682,  783,  678,  522,  522,  522,  522,

			  522,  679,  683,  683,  683,  683,  683,  783,  783,  783,
			  783,  680,  684,  684,  684,  684,  684,  685,  685,  685,
			  685,  685,  515,  117,  117,  783,  783,  783,  687,  783,
			  783,  783,  625,  783,  783,  783,  783,  688,  117,  117,
			  117,  783,  783,  783,  783,  117,  783,  783,  117,  689,
			  783,  117,  117,  783,  783,  354,  687,  783,  117,  117,
			  625,  117,  117,  783,  117,  688,  783,  783,  117,  117,
			  783,  783,  117,  117,  117,  783,  117,  689,  117,  158,
			  158,  158,  158,  158,  783,  783,  117,  783,  783,  783,
			  117,  783,  690,  117,  117,  783,  783,  696,  158,  158,

			  158,  158,  158,  117,  783,  783,  117,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  783,  783,  783,
			  690,  783,  783,  117,  783,  696,  697,  698,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  653,  653,
			  653,  653,  653,  701,  701,  701,  701,  701,  685,  685,
			  685,  685,  685,  783,  697,  698,  783,  658,  783,  658,
			  783,  699,  684,  684,  684,  684,  684,  783,  117,  704,
			  783,  783,  783,  783,  783,  783,  515,  783,  783,  783,
			  783,  783,  117,  783,  117,  783,  117,  783,  783,  699,
			  783,  783,  783,  117,  117,  660,  117,  704,  783,  783,

			  117,  783,  117,  783,  705,  783,  706,  117,  117,  117,
			  117,  783,  707,  117,  117,  158,  158,  158,  158,  158,
			  783,  117,  117,  158,  158,  158,  158,  158,  783,  783,
			  711,  117,  783,  705,  706,  783,  783,  783,  117,  117,
			  783,  707,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  783,  783,  783,  712,  783,  783,  711,  716,
			  716,  716,  716,  716,  783,  783,  783,  117,  783,  713,
			  783,  117,  117,  783,  783,  783,  783,  783,  783,  714,
			  783,  719,  783,  117,  712,  117,  117,  117,  117,  783,
			  117,  117,  783,  783,  783,  117,  783,  713,  783,  117, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  720,  783,  783,  117,  117,  117,  117,  714,  719,
			  783,  783,  117,  783,  783,  783,  117,  117,  117,  117,
			  158,  158,  158,  158,  158,  783,  783,  783,  783,  720,
			  158,  158,  158,  158,  158,  117,  117,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  783,  724,  726,
			  726,  726,  726,  726,  660,  660,  660,  660,  660,  727,
			  727,  727,  727,  727,  783,  783,  725,  783,  158,  158,
			  158,  158,  158,  783,  783,  783,  724,  783,  783,  117,
			  783,  783,  117,  729,  783,  783,  783,  158,  158,  158,
			  158,  158,  783,  117,  725,  117,  117,  728,  117,  783,

			  733,  783,  734,  783,  783,  783,  783,  117,  783,  783,
			  117,  729,  738,  783,  739,  740,  783,  727,  727,  727,
			  727,  727,  783,  117,  117,  783,  728,  117,  783,  733,
			  734,  783,  783,  741,  783,  783,  783,  117,  783,  117,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  783,  117,  745,  745,  745,  745,  745,  783,  783,  783,
			  783,  741,  783,  783,  744,  117,  751,  783,  117,  747,
			  747,  747,  747,  747,  750,  750,  750,  750,  750,  117,
			  783,  117,  158,  158,  158,  158,  158,  755,  755,  755,
			  755,  755,  744,  117,  751,  783,  783,  754,  756,  756,

			  756,  756,  756,  747,  747,  747,  747,  747,  783,  783,
			  117,  747,  747,  747,  747,  747,  158,  158,  158,  158,
			  158,  783,  783,  117,  783,  754,  748,  738,  783,  739,
			  757,  783,  750,  750,  750,  750,  750,  117,  783,  117,
			  760,  760,  760,  760,  760,  764,  764,  764,  764,  764,
			  783,  117,  737,  737,  737,  737,  737,  767,  767,  767,
			  767,  767,  783,  783,  738,  783,  739,  783,  117,  764,
			  764,  764,  764,  764,  771,  771,  771,  771,  771,  772,
			  772,  772,  772,  772,  775,  775,  775,  775,  775,  763,
			  763,  763,  763,  763,  779,  779,  779,  779,  779,  780,

			  780,  780,  780,  780,  781,  781,  781,  781,  781,  776,
			  783,  776,  783,  783,  780,  780,  780,  780,  780,  782,
			  782,  782,  782,  782,  778,  778,  778,  778,  778,  103,
			  103,  103,  103,  103,  103,  103,  644,  644,  644,  644,
			  644,  644,  644,  783,  783,  783,  783,  778,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   98,
			   98,  783,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			  783,   98,   98,   98,   98,   98,  100,  100,  783,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  117,  117,  117,  783,  783,  783,  783,
			  783,  117,  117,  117,  783,  117,  117,  117,  117,  117,

			  117,  117,  783,  783,  783,  117,  117,  117,  150,  150,
			  783,  150,  783,  150,  150,  783,  783,  150,  150,  150,
			  150,  150,  150,  150,  783,  783,  783,  150,  150,  150,
			  153,  153,  783,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  158,  783,  158,
			  158,  783,  783,  783,  158,  158,  158,  783,  783,  158,
			  158,  158,  158,  158,  158,  158,  158,  783,  783,  158,
			  158,  158,  186,  186,  783,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,

			  186,  186,  186,  783,  186,  186,  186,  186,  186,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  206,  783,  206,  783,  783,  783,  206,
			  783,  206,  206,  783,  783,  206,  206,  206,  206,  206,
			  206,  206,  783,  783,  206,  206,  206,  206,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  220,  220,  783,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  103,
			  783,  783,  783,  103,  103,  783,  783,  103,  103,  103,
			  103,  103,  103,  103,  783,  783,  783,  103,  103,  103,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  108,  108,  108,
			  783,  783,  108,  108,  108,  108,  108,  108,  108,  108,
			  783,  783,  108,  108,  108,  246,  783,  783,  246,  246,
			  246,  246,  246,  246,  246,  246,  246,  246,  246,  783,
			  783,  783,  246,  246,  246,  198,  198,  198,  198,  198,
			  198,  198,  198,  783,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,

			  201,  201,  201,  201,  201,  201,  201,  201,  201,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  219,  219,  219,  783,
			  783,  783,  783,  783,  783,  783,  783,  219,  219,  219,
			  219,  219,  219,  219,  219,  783,  783,  783,  360,  360,
			  783,  219,  360,  360,  360,  360,  360,  360,  360,  783,
			  783,  783,  360,  360,  360,  361,  361,  783,  783,  361,
			  361,  361,  361,  361,  361,  361,  783,  783,  783,  361,
			  361,  361,  291,  291,  291,  783,  783,  291,  291,  291, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  291,  291,  291,  291,  291,  783,  783,  291,  291,  291,
			  330,  330,  330,  330,  330,  330,  330,  330,  330,  330,
			  330,  330,  330,  330,  330,  330,  330,  330,  330,  330,
			  330,  330,  330,  330,  330,  330,  330,  448,  448,  448,
			  448,  448,  448,  448,  783,  783,  783,  448,  448,  448,
			  481,  783,  481,  783,  783,  783,  481,  783,  481,  481,
			  783,  783,  481,  481,  481,  481,  481,  481,  481,  783,
			  783,  783,  481,  481,  481,  524,  524,  524,  524,  524,
			  524,  524,  783,  783,  783,  524,  524,  524,  525,  525,
			  783,  783,  525,  525,  525,  525,  525,  525,  525,  783,

			  783,  783,  525,  525,  525,  551,  783,  551,  783,  783,
			  783,  551,  783,  551,  551,  783,  783,  551,  551,  551,
			  551,  551,  551,  551,  783,  783,  551,  551,  551,  551,
			  587,  587,  783,  783,  587,  587,  587,  587,  587,  587,
			  587,  783,  783,  783,  587,  587,  587,  662,  662,  662,
			  662,  662,  662,  662,  783,  783,  644,  662,  662,  662,
			  644,  644,  783,  783,  644,  644,  644,  644,  644,  644,
			  644,  783,  783,  783,  644,  644,  644,  686,  686,  783,
			  783,  686,  686,  686,  686,  686,  686,  686,  783,  783,
			  783,  686,  686,  686,  717,  717,  783,  783,  717,  717,

			  717,  717,  717,  717,  717,  783,  783,  783,  717,  717,
			  717,   11,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,

			  783,  783, yy_Dummy>>,
			1, 302, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6301)
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
			    1,    3,    5,    9,    6,    3,    4,   10,   18,   13,

			    4,   13,   13,   25,   51,   25,   25,   25,   25,   25,
			   76,   27,   51,   27,   82,   27,   27,   27,   27,   27,
			   38,   38,   74,   38,   74,   74,   84,    5,    5,    6,
			    6,   28,   85,   28,  108,   28,   28,   28,   28,   28,
			  361,    3,   18,   38,  143,  759,    4,  361,    9,   82,
			   82,  155,   10,   27,  155,   95,   76,   95,   95,  155,
			  758,  210,   84,   84,  210,  686,  686,   85,   85,  108,
			  700,  700,  143,   28,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,   35,   35,  142,   35,   36,   36,
			   87,   36,  152,   87,   37,   37,   92,   37,  213,  196,
			   40,   40,  749,   40,  691,   39,   39,   35,   39,   41,

			   41,   36,   41,  739,   78,  142,   35,   37,   80,   36,
			   35,   37,   35,   40,  466,  162,  731,   40,   39,  152,
			   37,  466,   41,  162,  196,  196,  730,   42,   42,   40,
			   42,   39,   87,   41,   35,  691,  235,   36,   35,   37,
			   35,   92,   39,  213,  235,   40,   43,   43,   37,   43,
			   42,   44,   44,  703,   44,   45,   45,   40,   45,   39,
			   58,   41,  321,   58,   42,   42,   67,   67,   58,   43,
			   42,   39,   67,   43,   44,   58,   50,   50,   45,   50,
			   49,   49,   78,   49,   45,   80,   80,   67,   47,   47,
			   44,   47,   42,   42,   67,   67,  694,   45,   42,   50,

			   67,   43,  542,   49,  188,   61,  188,  188,   61,  542,
			   58,   47,   45,   61,   48,   48,  682,   48,   44,   49,
			   61,  732,   47,  200,   50,   45,   46,   46,  732,   46,
			   47,  109,  109,  109,  109,  109,  291,   48,   77,   61,
			  321,   46,   46,   46,   46,   46,   46,   49,  212,   46,
			   47,  212,   48,   50,   79,   61,   46,   48,   47,  200,
			  200,   55,  446,   46,   55,  116,  116,   61,  116,   55,
			   46,  291,   46,  405,   46,  229,   55,  229,  229,   56,
			   48,  405,   56,  653,   46,   48,  151,   56,  116,  323,
			  327,   46,   57,   55,   56,   57,  645,   55,  202,   55,

			   57,   46,  446,   46,  199,   59,  644,   57,   59,   60,
			   56,   55,   60,   59,   77,   77,   77,   60,   55,   57,
			   59,   55,  151,  606,   60,   55,  327,   55,   57,   56,
			   79,   79,   79,   55,  202,  202,   60,  151,   56,  199,
			  199,   59,   57,  551,  717,  717,   62,   57,   60,   62,
			   63,  605,   59,   63,   62,   59,   57,   81,   63,   60,
			   64,   62,  604,   64,   60,   63,  323,  323,   64,   59,
			   68,  333,  333,   68,  333,   64,   60,   63,   68,   65,
			  603,   59,   65,   62,   62,   68,  374,   65,  587,   62,
			  240,  240,  240,  240,   65,  551,   62,  374,   66,   64,

			   63,   66,  583,  577,   62,   63,   66,  374,   65,   68,
			   64,   62,   62,   66,  559,   69,  543,   62,   69,   90,
			   68,   65,   90,   69,  525,  374,  517,   64,  192,   65,
			   69,   90,   66,   81,   81,   81,   65,   68,  510,   89,
			   66,   90,   89,  205,  102,  488,  205,  401,   66,   65,
			  401,   89,   89,  102,  102,  102,  102,  102,  487,  479,
			   66,   89,  479,   69,  458,   69,  228,  228,   66,  228,
			  442,   90,  106,  106,  106,  106,  106,  111,  435,  111,
			  363,  111,  111,  111,  111,  111,  111,  106,  102,  228,
			  360,   89,   69,   93,   93,  205,   93,  112,  112,  112,

			  112,  112,  350,  102,  192,  192,  192,  102,  349,  102,
			  106,  334,  334,  480,  334,  106,  480,  335,   93,  111,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,  110,  110,  110,  110,  110,  113,  345,
			  113,  330,  113,  113,  113,  113,  113,  329,  110,  297,
			  555,  117,  117,  555,  117,  480,  119,  119,  555,  119,
			  145,  296,  345,   93,  117,  117,  534,  345,  295,  119,
			  119,  193,  117,  581,  117,  145,  110,  119,  287,  119,
			  113,  120,  120,  534,  120,  121,  121,  534,  121,  145,

			  145,  145,  246,  245,  120,  120,  581,  234,  121,  121,
			  119,  581,  120,  145,  120,  227,  121,  226,  121,  122,
			  122,  534,  122,  123,  123,  121,  123,  120,  145,  225,
			  145,  224,  122,  122,  222,  217,  123,  123,  119,  208,
			  122,  203,  122,  201,  123,  194,  123,  124,  124,  481,
			  124,  122,  481,  121,  198,  120,  186,  193,  193,  193,
			  124,  124,  195,  156,  153,  123,  218,  218,  124,  218,
			  124,  626,  626,  626,  125,  125,  150,  125,  137,  122,
			  278,  166,  166,  166,  166,  166,  124,  125,  125,  126,
			  126,  218,  126,  123,  278,  125,  278,  125,  105,  104,

			  693,  481,  126,  126,  166,  103,  127,  127,  278,  127,
			  126,  693,  126,  100,  124,  473,   98,  125,  126,  127,
			  127,  194,  194,  194,  126,  278,  473,  127,   96,  127,
			  128,  128,  166,  128,  129,  129,  473,  129,  195,  195,
			  195,  693,  127,  128,  128,  125,  126,  129,  129,   88,
			   73,  128,  126,  128,  473,  129,  484,  129,   70,  484,
			  478,  130,  130,   54,  130,  131,  131,   33,  131,   31,
			  127,  478,  128,   26,  130,  130,  249,   24,  131,  131,
			  484,  478,  130,  445,  130,  445,  131,   16,  131,  132,
			  132,  249,  132,  445,  131,  133,  133,   15,  133,  478, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  128,  130,  132,  132,   14,  249,   11,  249,  133,  133,
			  132,    0,  132,    0,  134,  134,  133,  134,  133,  249,
			    0,  445,  131,  486,    0,  593,  486,  134,  134,  130,
			    0,  135,  135,    0,  135,  134,  249,  134,    0,  133,
			    0,    0,  593,  132,  135,  135,  593,  486,  136,  136,
			    0,  136,  135,  206,  135,    0,  206,  790,  134,    0,
			  135,  136,  136,    0,    0,  206,    0,  133,    0,  136,
			  593,  136,  790,  790,  790,  206,  139,  139,  136,  139,
			  164,  164,  164,  164,  164,    0,  134,    0,  135,  139,
			  139,  139,  521,  521,  521,  521,  164,  139,    0,  139,

			  140,  140,  146,  140,    0,  206,  136,  138,  138,  138,
			  138,    0,    0,  140,  140,  140,  138,  146,    0,    0,
			  139,  140,  146,  140,  164,  138,  146,    0,    0,  138,
			  140,  146,  138,  146,  167,  167,  167,  167,  167,  138,
			  144,  138,    0,  138,  140,  146,  140,    0,  336,  336,
			  146,  336,    0,  138,  146,  144,  144,  138,  140,  144,
			  138,  167,  146,  171,  171,  171,  171,  171,  171,  144,
			  138,  144,  138,  336,  548,  140,  141,  141,  141,  141,
			  141,  148,    0,  144,  144,  548,  147,  144,    0,  167,
			  141,  806,  806,  806,  141,  548,  148,  141,  320,    0,

			  144,  147,  147,  141,  141,    0,  141,    0,  148,  322,
			  148,  149,  148,  548,    0,  147,  209,  147,  141,  209,
			  674,  674,  141,  674,  148,  141,  149,    0,  209,  147,
			  147,  141,    0,    0,  599,  141,  148,    0,  209,  324,
			  149,  148,  149,  674,  149,  158,  147,    0,  158,  159,
			    0,  599,  159,  158,  149,  599,    0,  159,  158,  158,
			  158,    0,  159,  159,  159,    0,  158,  325,  209,  160,
			  159,  149,  160,  149,  320,  320,  320,  160,    0,  599,
			    0,    0,  160,  160,  160,  322,  322,  322,  161,  326,
			  160,  161,    0,  159,    0,  158,  161,    0,    0,  159,

			    0,  161,  161,  161,    0,  160,    0,    0,    0,  161,
			  165,  165,  165,  165,  165,  324,  324,  324,  161,  160,
			    0,  159,  168,  168,  168,  168,  168,  173,  173,  173,
			  173,  173,    0,  160,  163,  168,  165,  163,  161,    0,
			  173,  168,  163,  325,  325,  325,  161,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  169,  169,  169,  169,
			  169,    0,    0,  168,  165,  326,  326,  326,  173,  168,
			  170,  170,  170,  170,  170,    0,  169,  172,  172,  172,
			  172,  172,    0,    0,  163,  174,  174,  174,  174,  174,
			  175,  175,  175,  175,  175,    0,  170,    0,    0,  331,

			  331,  172,  331,    0,  169,  176,  176,  176,  176,  176,
			    0,  331,  177,  177,  177,  177,  177,    0,  175,  191,
			    0,  331,    0,  174,  170,  177,    0,    0,  636,  172,
			    0,    0,    0,  176,  178,  178,  178,  178,  178,  179,
			  179,  179,  179,  179,    0,  636,  175,    0,  178,  636,
			    0,  331,    0,  177,  179,  180,  180,  180,  180,  180,
			    0,  176,  181,  181,  181,  181,  181,    0,  182,  182,
			  182,  182,  182,  636,    0,    0,  178,  736,  736,  736,
			  736,  181,  179,  182,  180,  181,    0,    0,  183,  183,
			  183,  183,  183,  184,  184,  184,  184,  184,  191,  191,

			  191,  191,  191,  223,  223,  223,  223,  223,  223,  181,
			    0,  182,  180,  181,  183,  232,    0,  232,    0,    0,
			  232,  232,  232,  232,  232,  184,  233,  233,  233,  233,
			  233,  231,  231,  231,  231,  231,  236,  236,  236,  236,
			  236,    0,  183,  238,    0,  238,  231,    0,  238,  238,
			  238,  238,  238,    0,  184,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  231,
			    0,  211,    0,    0,  231,    0,    0,  211,  211,  211,
			  211,  211,  211,  237,  237,  237,  237,  237,  239,  247,
			  239,    0,  239,  239,  239,  239,  239,    0,  237,  241,

			  241,  241,  241,  241,  247,  247,  211,  211,  211,  211,
			  267,  267,  267,  267,  267,    0,    0,    0,  247,    0,
			  247,  237,  762,  762,  762,  762,  237,    0,    0,    0,
			  239,    0,  247,  247,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  214,  214,    0,  214,  247,
			  268,  268,  268,  268,  268,  274,  274,  274,  274,  274,
			  288,  288,  288,  288,  288,  288,    0,    0,    0,    0,
			  214,    0,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  248,    0,    0,  250,  251,

			  276,  276,  276,  276,  276,  252,  628,  628,  628,  628,
			  248,  640,    0,  250,  251,  640,    0,    0,  276,  248,
			  252,    0,  250,    0,  248,  214,  248,  250,  251,  250,
			  251,    0,  640,  252,  252,    0,  252,  253,  248,    0,
			    0,  250,  251,  640,  628,    0,  276,  248,  252,    0,
			  250,    0,  253,  253,  384,  248,  254,  257,  250,  251,
			    0,  252,    0,  255,    0,  252,  253,    0,  253,    0,
			    0,  254,  257,  384,    0,    0,  384,  254,  255,    0,
			  253,  253,  384,  256,    0,  254,  257,  254,  257,    0,
			    0,  255,  255,    0,  255,    0,  257,  253,  256,  254,

			  257,  384,  258,    0,  384,  254,  255,  258,    0,  259,
			  384,  256,  256,  708,  256,  395,  254,  257,  258,  255,
			  395,  708,    0,  255,  259,    0,  256,    0,  258,    0,
			  259,  395,  260,    0,  708,  261,  263,    0,  259,  256,
			  259,  395,  262,  256,    0,    0,  258,  260,    0,  708,
			  261,  263,  259,  260,    0,  261,  262,  262,  259,  395,
			    0,  260,    0,  260,  261,  263,  261,  263,    0,  259,
			    0,  262,  709,  262,  264,  260,    0,    0,  261,  263,
			  709,  260,  265,  261,  262,  262,    0,    0,    0,  264,
			    0,  721,  260,  709,    0,  261,  263,  265,  265,  721,

			  280,    0,  262,  264,  264,  264,  280,    0,  709,    0,
			    0,  265,  721,  265,  726,  280,  726,  264,  269,  269,
			  269,  269,  269,  269,  726,  265,  265,  721,    0,  280,
			    0,  280,  264,  269,  264,    0,  270,  270,  270,  270,
			  270,  270,  265,  280,    0,  722,    0,  269,    0,  269,
			    0,  270,  726,  722,  271,  271,  271,  271,  271,  271,
			  280,  269,    0,    0,    0,  270,  722,  270,    0,  271,
			    0,    0,  272,  272,  272,  272,  272,  272,  269,  270,
			    0,  722,    0,  271,    0,  271,  275,  272,  275,  275,
			  273,  273,  273,  273,  273,  273,  270,  271,    0,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  272,    0,  272,    0,  273,    0,    0,  275,  641,
			  277,  275,    0,  641,  271,  272,    0,  275,    0,  273,
			    0,  273,    0,  277,  277,  279,  277,    0,  281,  549,
			  641,  283,  272,  273,    0,    0,  275,    0,  277,  275,
			  279,  641,  549,  281,  281,  275,  283,    0,  279,  282,
			  273,  277,  765,  549,  279,  277,  279,  281,  283,  281,
			  283,    0,  283,  549,  282,    0,    0,  284,  279,  765,
			  550,  281,  281,  765,  283,  282,  279,    0,  282,    0,
			  282,  549,  284,  550,    0,  279,  283,  285,  281,    0,
			  286,  283,  282,    0,  550,    0,  284,  765,  284,    0,

			    0,    0,  285,  282,  550,  286,  284,    0,    0,  282,
			  284,  292,  292,  292,  292,  292,  285,    0,  285,  286,
			    0,  286,  550,  286,    0,    0,  292,  284,    0,    0,
			  285,    0,  289,  286,  289,  289,  289,  289,  289,  289,
			  293,  293,  293,  293,  293,    0,    0,  285,    0,    0,
			  286,  756,  286,  756,  292,  294,  294,  294,  294,  294,
			    0,  756,    0,  293,  298,  298,  298,  298,  298,  299,
			  299,  299,  299,  299,  300,  300,  300,  300,  300,    0,
			    0,    0,    0,  299,    0,    0,    0,  298,    0,  756,
			    0,  293,  301,  301,  301,  301,  301,    0,    0,    0,

			    0,  300,  302,  302,  302,  302,  302,  301,    0,    0,
			    0,  299,    0,    0,    0,  298,  303,  303,  303,  303,
			  303,    0,  302,    0,  304,  304,  304,  304,  304,  300,
			  305,  305,  305,  305,  305,  301,  306,  306,  306,  306,
			  306,    0,  710,  303,  307,  307,  307,  307,  307,  642,
			  302,  304,  742,  642,  710,    0,  306,  308,  308,  308,
			  308,  308,  710,  742,  307,    0,    0,    0,  305,    0,
			  642,  303,    0,  742,    0,  710,  308,    0,    0,  304,
			    0,  642,    0,    0,  306,  309,  309,  309,  309,  309,
			  710,  742,  307,  310,  310,  310,  310,  310,  309,  311,

			  311,  311,  311,  311,  308,  312,  312,  312,  312,  312,
			  313,  313,  313,  313,  313,  314,  314,  314,  314,  314,
			  312,  315,  315,  315,  315,  315,  309,    0,  311,    0,
			  314,    0,  313,  316,  316,  316,  316,  316,  317,  317,
			  317,  317,  317,    0,    0,    0,  315,    0,  312,  318,
			  318,  318,  318,  318,    0,    0,  311,    0,  314,  316,
			  313,  319,  319,  319,  319,  319,  339,  339,  339,  339,
			  339,  339,    0,    0,  315,    0,  317,  346,  346,  346,
			  346,  346,  347,  347,  347,  347,  347,  316,  348,  348,
			  348,  348,  348,  319,  351,  351,  351,  351,  351,  352,

			  352,  352,  352,  352,  353,    0,  353,    0,    0,  353,
			  353,  353,  353,  353,  352,  354,  354,  354,  354,  354,
			  347,    0,  319,  355,  355,  355,  355,  355,  356,  356,
			  356,  356,  356,  772,  772,  772,  772,  352,    0,    0,
			  357,  357,  352,  357,  357,  357,  357,  357,  358,  358,
			  358,  358,  358,  359,  359,  359,  359,  359,  364,  365,
			    0,    0,  367,    0,    0,  366,  356,    0,  368,    0,
			    0,  772,    0,  364,  365,    0,    0,  367,    0,    0,
			  366,    0,  367,  368,  368,  364,    0,  364,  365,  364,
			  365,  367,  366,  367,  366,    0,  366,  368,    0,  368,

			  369,  364,  365,    0,    0,  367,  370,    0,  366,    0,
			  367,  368,  368,  364,  723,  369,    0,    0,  364,  365,
			  366,  370,  367,    0,  371,  366,  723,    0,  368,  369,
			  372,  369,    0,    0,  723,  370,  370,  370,    0,  371,
			    0,    0,    0,  369,  643,  372,  372,  723,  643,  370,
			    0,    0,    0,  371,    0,  371,  373,  375,  766,  372,
			  369,  372,  723,  376,  370,  643,  370,  371,  373,    0,
			    0,  373,  375,  372,  372,  766,  643,  375,  376,  766,
			    0,  371,  378,    0,  371,  373,  375,  373,  375,  377,
			  372,    0,  376,  376,  376,  379,  373,  378,  769,  373,

			  375,  378,    0,  766,  377,  375,  376,    0,    0,    0,
			  379,  378,  377,  378,    0,  769,  373,  375,  377,  769,
			  377,  376,  379,  376,  379,  378,  379,  770,    0,  378,
			  380,    0,  377,  381,  381,  381,  381,  381,  379,    0,
			  377,    0,  378,  769,  770,  380,    0,    0,  770,  377,
			  379,    0,    0,    0,    0,  379,    0,  380,    0,  380,
			  381,  380,  382,    0,  382,  382,  382,  382,  382,  382,
			    0,    0,  770,  380,    0,  383,  383,  383,  383,  383,
			  385,  385,  385,  385,  385,  380,    0,    0,  381,  383,
			  380,  382,    0,  670,    0,    0,  383,  670,  385,  386,

			  386,  386,  386,  386,    0,  383,    0,  383,  388,  388,
			  388,  388,  388,  386,  670,    0,  743,  383,    0,  382,
			    0,    0,    0,    0,  383,  670,  385,  743,    0,  386,
			    0,    0,    0,    0,  383,    0,  383,  743,    0,  393,
			  388,  386,  387,  387,  387,  387,  387,  387,  389,  389,
			  389,  389,  389,    0,  393,  743,    0,  387,  386,  390,
			  390,  390,  390,  390,    0,    0,    0,    0,  393,  388,
			  393,  387,    0,  387,  391,  391,  391,  391,  391,  391,
			    0,    0,  393,  394,    0,  387,    0,  671,    0,  391,
			    0,  671,  392,  392,  392,  392,  392,  392,  394,  393,

			    0,  396,  387,  391,    0,  391,    0,  392,  671,    0,
			  397,    0,  394,    0,  394,    0,  396,  391,    0,  671,
			    0,  392,    0,  392,    0,  397,  394,    0,    0,    0,
			  396,  398,  396,    0,  391,  392,  399,    0,    0,  397,
			  397,  397,    0,  394,  396,    0,  398,  400,  399,  400,
			    0,  399,  392,  397,  409,  409,  409,  409,  409,  399,
			  398,  396,  398,    0,  400,  399,    0,  399,  397,    0,
			  397,    0,    0,  672,  398,    0,  399,  672,  400,  399,
			  400,  406,  406,  406,  406,  406,    0,  399,    0,    0,
			    0,  398,  400,    0,  672,  402,  399,  402,  402,  402,

			  402,  402,  402,    0,    0,  672,    0,  406,  403,  400,
			  403,  403,  403,  403,  403,  403,  404,    0,  404,  404,
			  404,  404,  404,  404,    0,  407,  407,  407,  407,  407,
			    0,    0,    0,  402,  408,  406,  408,  408,  408,  408,
			  408,  410,  410,  410,  410,  410,  403,  411,  411,  411,
			  411,  411,    0,    0,  404,  407,  412,  412,  412,  412,
			  412,  413,  413,  413,  413,  413,  411,  410,    0,    0,
			    0,  412,  414,  414,  414,  414,  414,  415,  415,  415,
			  415,  415,    0,    0,  407,  416,  416,  416,  416,  416,
			    0,    0,    0,    0,  411,  410,    0,    0,    0,  412, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  416,  414,    0,    0,    0,  415,  417,  417,  417,  417,
			  417,  418,  418,  418,  418,  418,    0,  417,  419,  419,
			  419,  419,  419,  421,  421,  421,  421,  421,  416,  414,
			  418,    0,  752,  415,  420,  420,  420,  420,  420,    0,
			    0,  421,    0,  752,    0,  417,    0,  419,  422,  422,
			  422,  422,  422,  752,    0,    0,  420,    0,  418,  423,
			  423,  423,  423,  423,  424,  424,  424,  424,  424,  421,
			    0,  752,    0,    0,  422,  419,  425,  425,  425,  425,
			  425,    0,    0,    0,  420,  423,  426,  426,  426,  426,
			  426,  427,  427,  427,  427,  427,  428,  428,  428,  428,

			  428,    0,  422,    0,    0,  427,    0,  428,  432,  432,
			  432,  432,  432,  423,    0,  426,  429,    0,  428,  429,
			  429,  429,  429,  429,  431,  431,  431,  431,  431,    0,
			    0,    0,    0,  427,    0,  428,  433,  433,  433,  433,
			  433,    0,    0,  426,    0,  434,  428,  434,  434,  434,
			  434,  434,  436,  436,  436,  436,  436,  437,  437,  437,
			  437,  437,  431,    0,    0,    0,    0,  436,  438,  438,
			  438,  438,  438,  439,  439,  439,  439,  439,  440,  440,
			  440,  440,  440,  441,  441,  441,  441,  441,  449,  450,
			  436,    0,    0,    0,    0,  436,  443,  443,  443,  443,

			  443,    0,  753,  449,  450,  444,  438,  444,  444,  444,
			  444,  444,    0,  753,  451,    0,  440,  449,  450,  449,
			  450,  452,  453,  753,    0,  454,    0,    0,  450,  451,
			  451,  449,  450,    0,    0,    0,  452,  453,    0,    0,
			  454,  753,    0,  451,  452,  451,    0,  455,  449,  450,
			  452,  453,  452,  453,  454,  456,  454,  451,  451,    0,
			    0,    0,  455,  455,  452,  453,    0,    0,  454,    0,
			  456,    0,  452,  457,  451,  455,  455,  459,  455,    0,
			  460,  452,  453,    0,  456,  454,  456,    0,  457,    0,
			  455,  455,  459,  459,  457,  460,    0,  673,  456,  461,

			    0,  673,  457,  455,  457,    0,  459,  455,  459,  460,
			  462,  460,    0,    0,  461,  456,  457,  463,  673,    0,
			  459,  459,  457,  460,    0,  462,  462,    0,  461,  673,
			  461,    0,  463,  457,    0,  464,    0,  459,    0,  462,
			  460,  462,  461,    0,  463,    0,  463,    0,  463,    0,
			  464,  464,    0,  462,  462,    0,    0,    0,  468,  461,
			  463,    0,    0,    0,  464,    0,  464,    0,    0,    0,
			  462,    0,  463,  468,    0,    0,    0,  463,  464,  464,
			    0,  467,  467,  467,  467,  467,  467,  468,    0,  468,
			  469,  469,  469,  469,  469,  464,  467,    0,    0,    0,

			  470,  468,  470,  470,  470,  470,  470,  470,    0,    0,
			  467,    0,  467,    0,    0,    0,    0,  469,  468,  472,
			  472,  472,  472,  472,  467,    0,    0,    0,  471,  470,
			  471,  474,  471,  471,  471,  471,  471,    0,    0,    0,
			  472,  467,    0,    0,    0,  469,  474,  474,    0,    0,
			  471,  475,    0,  471,  527,  477,    0,  470,    0,  471,
			  474,  476,  474,    0,    0,    0,  475,  475,  472,  527,
			  477,    0,    0,    0,  474,  474,  476,    0,  471,  477,
			  475,  471,  475,  527,  477,  527,  477,  471,  476,    0,
			  476,  474,  476,    0,  475,  475,    0,  527,  477,  489,

			  489,  489,  489,  489,  476,    0,    0,  477,    0,    0,
			    0,  475,    0,    0,  527,  477,  476,    0,    0,    0,
			    0,  476,  482,  482,  482,  482,  482,  482,  485,    0,
			  485,  485,  485,  485,  485,  485,  490,  490,  490,  490,
			  490,  491,    0,  491,  491,  491,  491,  491,  492,    0,
			  492,  492,  492,  492,  492,  492,  493,  493,  493,  493,
			  493,  494,  494,  494,  494,  494,  485,    0,    0,    0,
			    0,  493,    0,    0,  490,    0,    0,    0,    0,  491,
			    0,    0,    0,  494,  495,  495,  495,  495,  495,  496,
			  496,  496,  496,  496,    0,    0,    0,    0,  495,  493,

			    0,    0,    0,  496,    0,  497,  497,  497,  497,  497,
			    0,  494,  498,  498,  498,  498,  498,    0,    0,    0,
			  497,  499,  499,  499,  499,  499,  495,    0,    0,    0,
			    0,  496,  497,    0,  500,  500,  500,  500,  500,    0,
			    0,  499,  501,  501,  501,  501,  501,    0,  497,  500,
			  502,  502,  502,  502,  502,    0,  501,    0,    0,    0,
			  497,  503,  503,  503,  503,  503,    0,    0,    0,  499,
			  504,  504,  504,  504,  504,    0,  503,  500,  505,  505,
			  505,  505,  505,    0,  501,  506,  506,  506,  506,  506,
			    0,    0,    0,  505,    0,    0,  504,    0,    0,    0,

			  506,    0,    0,    0,  503,  507,  507,  507,  507,  507,
			  508,  508,  508,  508,  508,  509,  509,  509,  509,  509,
			  507,  505,    0,    0,  504,    0,    0,    0,  506,  511,
			  511,  511,  511,  511,    0,    0,  508,  512,  509,  512,
			  512,  512,  512,  512,    0,    0,    0,    0,  507,    0,
			  513,  513,  513,  513,  513,    0,  514,  514,  514,  514,
			  514,    0,    0,    0,  508,  513,  509,  515,  515,  515,
			  515,  515,    0,    0,    0,  512,  516,  516,  516,  516,
			  516,  518,  518,  518,  518,  518,  519,  519,  519,  519,
			  519,    0,    0,  513,  514,  520,  520,  520,  520,  520,

			  523,  523,  523,  523,  523,  526,  528,    0,    0,  529,
			  530,    0,    0,  532,    0,  523,    0,  526,  528,    0,
			  526,  528,    0,    0,  529,  530,  530,    0,  532,    0,
			    0,    0,  531,    0,  526,  528,  526,  528,  529,  530,
			  529,  530,  532,  523,  532,  526,  528,  531,  526,  528,
			    0,    0,  529,  530,  530,  531,  532,  533,    0,    0,
			    0,  531,  535,  531,    0,  526,  528,    0,    0,  529,
			  530,    0,  533,  532,    0,  531,    0,  535,  533,    0,
			  536,    0,    0,  531,    0,    0,  533,    0,  533,    0,
			  535,  535,  531,  535,    0,  536,  536,    0,  537,  538,

			  533,    0,    0,    0,  539,  535,  533,    0,    0,  536,
			    0,  536,    0,  537,  538,  538,    0,  533,  535,  539,
			    0,    0,  535,  536,  536,    0,  537,  537,  538,  537,
			  538,  544,    0,  539,    0,  539,    0,    0,    0,    0,
			  536,  537,  538,  538,    0,    0,  544,  539,  540,  540,
			  540,  540,  540,  545,  537,    0,  546,  547,  537,  538,
			  544,    0,  544,    0,  539,    0,  540,    0,  545,  540,
			  546,  546,  547,  557,  544,  557,  557,  557,  557,  557,
			  545,    0,  545,    0,  545,  546,  547,  546,  547,    0,
			    0,  544,    0,    0,  540,    0,  545,  540,  546,  546, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  547,  558,  558,  558,  558,  558,    0,    0,  545,    0,
			    0,    0,  558,  545,    0,    0,  546,  547,  554,    0,
			  554,  554,  554,  554,  554,  554,  556,    0,  556,  556,
			  556,  556,  556,  556,  560,  560,  560,  560,  560,    0,
			  558,  561,  561,  561,  561,  561,  562,  562,  562,  562,
			  562,    0,  561,    0,    0,    0,  554,  563,  563,  563,
			  563,  563,    0,    0,  556,  564,  564,  564,  564,  564,
			    0,    0,  563,  565,  565,  565,  565,  565,    0,    0,
			  561,  566,  566,  566,  566,  566,    0,  564,    0,  567,
			  567,  567,  567,  567,  568,  568,  568,  568,  568,    0,

			  563,  566,    0,  569,  569,  569,  569,  569,    0,  568,
			  570,  570,  570,  570,  570,  564,  567,  571,  571,  571,
			  571,  571,    0,    0,    0,  570,    0,    0,    0,  566,
			  569,  571,  572,  572,  572,  572,  572,  568,  573,  573,
			  573,  573,  573,    0,  567,    0,    0,  574,  574,  574,
			  574,  574,    0,  570,    0,    0,    0,    0,  569,  571,
			  574,    0,    0,    0,  573,  575,  575,  575,  575,  575,
			  576,  576,  576,  576,  576,  578,    0,  578,    0,  575,
			  578,  578,  578,  578,  578,    0,    0,    0,  574,    0,
			    0,    0,  573,  579,  579,  579,  579,  579,  580,  580,

			  580,  580,  580,    0,    0,    0,    0,  575,  582,  582,
			  582,  582,  582,  584,  584,  584,  584,  584,  585,  585,
			  585,  585,  585,  586,  586,  586,  586,  586,  588,  589,
			    0,  579,    0,  590,  592,    0,    0,    0,  586,  591,
			    0,    0,    0,  588,  589,    0,    0,    0,  590,  592,
			  589,    0,    0,  591,  591,  588,    0,  588,  589,  588,
			  589,  586,  590,  592,  590,  592,  586,    0,  591,  594,
			  591,  588,  589,    0,    0,  595,  590,  592,  589,    0,
			  596,  591,  591,  588,  594,    0,    0,    0,  588,  589,
			  595,    0,    0,  590,  592,  596,    0,    0,  594,  591,

			  594,  597,  598,    0,  595,  600,  595,    0,    0,  596,
			    0,  596,  594,    0,    0,    0,  597,  598,  595,    0,
			  600,  600,    0,  596,  597,    0,    0,  601,    0,  594,
			  597,  598,  597,  598,  600,  595,  600,    0,  602,    0,
			  596,    0,  601,    0,  597,  598,  601,    0,  600,  600,
			    0,    0,  597,  602,  602,    0,  601,    0,  601,    0,
			    0,  597,  598,    0,    0,  600,    0,  602,    0,  602,
			  601,    0,    0,  608,  601,  608,  608,  608,  608,  608,
			    0,  602,  602,    0,    0,    0,    0,  601,  609,  609,
			  609,  609,  609,  610,  610,  610,  610,  610,  602,  611,

			  611,  611,  611,  611,  612,  612,  612,  612,  612,    0,
			    0,  608,    0,  610,  609,    0,    0,  612,  613,  613,
			  613,  613,  613,  614,  614,  614,  614,  614,  615,  615,
			  615,  615,  615,  616,  616,  616,  616,  616,    0,    0,
			    0,  610,  609,    0,    0,  612,  617,  617,  617,  617,
			  617,  618,  618,  618,  618,  618,  619,  619,  619,  619,
			  619,  620,  620,  620,  620,  620,    0,    0,  617,    0,
			    0,  619,  621,  621,  621,  621,  621,    0,    0,  620,
			  622,  622,  622,  622,  622,    0,    0,  621,  623,  623,
			  623,  623,  623,    0,    0,    0,  617,    0,    0,  619,

			  624,  624,  624,  624,  624,    0,    0,  620,    0,    0,
			    0,  625,    0,  625,    0,  621,  625,  625,  625,  625,
			  625,  627,  627,  627,  627,  627,  629,  629,  629,  629,
			  629,  631,  632,    0,    0,    0,  635,    0,    0,  633,
			    0,  629,    0,    0,    0,  631,  631,  632,    0,    0,
			  635,  635,  632,    0,  633,  633,    0,  637,    0,    0,
			  631,  632,  631,  632,  629,  635,  639,  635,  633,  629,
			  633,    0,  637,  631,  631,  632,    0,    0,  635,  635,
			  632,  639,  633,  633,    0,    0,  637,  638,  637,    0,
			    0,  631,  632,    0,    0,  639,  635,  639,    0,  633,

			  637,    0,  638,  638,  652,  652,  652,  652,  652,  639,
			  646,  646,  646,  646,  646,    0,  638,  637,  638,    0,
			    0,    0,    0,  646,    0,    0,  639,    0,    0,    0,
			  638,  638,    0,  647,  647,  647,  647,  647,  648,  648,
			  648,  648,  648,    0,    0,    0,    0,  638,    0,    0,
			    0,  646,  647,  648,  649,  649,  649,  649,  649,  650,
			  650,  650,  650,  650,    0,    0,    0,  649,  651,  651,
			  651,  651,  651,  650,  654,  654,  654,  654,  654,    0,
			  647,  648,    0,  651,  655,  655,  655,  655,  655,  656,
			  656,  656,  656,  656,    0,  649,  657,  657,  657,  657,

			  657,  650,  658,  658,  658,  658,  658,    0,  664,  663,
			    0,  651,  659,  659,  659,  659,  659,  661,  661,  661,
			  661,  661,  655,  664,  663,    0,    0,    0,  663,    0,
			  665,    0,  661,  666,    0,    0,    0,  664,  663,  664,
			  663,    0,    0,  668,    0,  665,    0,    0,  666,  666,
			    0,  664,  663,    0,    0,  661,  663,    0,  668,  665,
			  661,  665,  666,  669,  666,  664,    0,    0,  664,  663,
			    0,    0,  668,  665,  668,    0,  666,  666,  669,  675,
			  675,  675,  675,  675,    0,    0,  668,    0,    0,    0,
			  665,    0,  669,  666,  669,    0,    0,  675,  676,  676,

			  676,  676,  676,  668,    0,    0,  669,  677,  677,  677,
			  677,  677,  678,  678,  678,  678,  678,    0,    0,    0,
			  669,    0,    0,  669,    0,  675,  676,  678,  679,  679,
			  679,  679,  679,  680,  680,  680,  680,  680,  681,  681,
			  681,  681,  681,  683,  683,  683,  683,  683,  685,  685,
			  685,  685,  685,  687,  676,  678,    0,  684,    0,  684,
			    0,  680,  684,  684,  684,  684,  684,    0,  687,  687,
			    0,  688,    0,    0,    0,    0,  681,    0,  689,  690,
			    0,    0,  687,    0,  687,    0,  688,    0,    0,  680,
			    0,    0,    0,  689,  690,  684,  687,  687,    0,    0,

			  688,    0,  688,    0,  688,    0,  689,  689,  690,  689,
			  690,    0,  690,  687,  688,  696,  696,  696,  696,  696,
			    0,  689,  690,  697,  697,  697,  697,  697,    0,    0,
			  696,  688,    0,  688,  689,    0,    0,    0,  689,  690,
			    0,  690,  698,  698,  698,  698,  698,  699,  699,  699,
			  699,  699,  704,    0,    0,  697,  705,  706,  696,  701,
			  701,  701,  701,  701,    0,    0,    0,  704,    0,  698,
			    0,  705,  706,    0,    0,  729,  707,    0,    0,  699,
			    0,  704,    0,  704,  697,  705,  706,  705,  706,    0,
			  729,  707,    0,    0,    0,  704,    0,  698,    0,  705, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  706,  707,    0,    0,  729,  707,  729,  707,  699,  704,
			    0,    0,  704,    0,    0,    0,  705,  706,  729,  707,
			  711,  711,  711,  711,  711,    0,    0,    0,    0,  707,
			  712,  712,  712,  712,  712,  729,  707,  713,  713,  713,
			  713,  713,  714,  714,  714,  714,  714,    0,  711,  715,
			  715,  715,  715,  715,  716,  716,  716,  716,  716,  718,
			  718,  718,  718,  718,  719,    0,  714,  720,  724,  724,
			  724,  724,  724,    0,    0,    0,  711,    0,    0,  719,
			    0,    0,  720,  720,    0,    0,    0,  725,  725,  725,
			  725,  725,    0,  719,  714,  719,  720,  719,  720,    0,

			  724,    0,  725,    0,    0,    0,    0,  719,  728,    0,
			  720,  720,  727,    0,  727,  727,    0,  727,  727,  727,
			  727,  727,    0,  728,  719,    0,  719,  720,    0,  724,
			  725,    0,    0,  728,    0,    0,    0,  728,    0,  728,
			  733,  733,  733,  733,  733,  734,  734,  734,  734,  734,
			  741,  728,  735,  735,  735,  735,  735,    0,    0,    0,
			    0,  728,    0,    0,  733,  741,  741,    0,  728,  738,
			  738,  738,  738,  738,  740,  740,  740,  740,  740,  741,
			    0,  741,  744,  744,  744,  744,  744,  745,  745,  745,
			  745,  745,  733,  741,  741,    0,    0,  744,  746,  746,

			  746,  746,  746,  747,  747,  747,  747,  747,  751,    0,
			  741,  748,  748,  748,  748,  748,  754,  754,  754,  754,
			  754,    0,    0,  751,    0,  744,  738,  750,    0,  750,
			  750,    0,  750,  750,  750,  750,  750,  751,    0,  751,
			  755,  755,  755,  755,  755,  757,  757,  757,  757,  757,
			    0,  751,  760,  760,  760,  760,  760,  761,  761,  761,
			  761,  761,    0,    0,  764,    0,  764,    0,  751,  764,
			  764,  764,  764,  764,  767,  767,  767,  767,  767,  768,
			  768,  768,  768,  768,  771,  771,  771,  771,  771,  775,
			  775,  775,  775,  775,  776,  776,  776,  776,  776,  777,

			  777,  777,  777,  777,  779,  779,  779,  779,  779,  780,
			    0,  780,    0,    0,  780,  780,  780,  780,  780,  781,
			  781,  781,  781,  781,  782,  782,  782,  782,  782,  789,
			  789,  789,  789,  789,  789,  789,  821,  821,  821,  821,
			  821,  821,  821,    0,    0,    0,    0,  780,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,

			  785,  785,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  787,
			  787,    0,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			    0,  787,  787,  787,  787,  787,  788,  788,    0,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  791,  791,  791,    0,    0,    0,    0,
			    0,  791,  791,  791,    0,  791,  791,  791,  791,  791,

			  791,  791,    0,    0,    0,  791,  791,  791,  792,  792,
			    0,  792,    0,  792,  792,    0,    0,  792,  792,  792,
			  792,  792,  792,  792,    0,    0,    0,  792,  792,  792,
			  793,  793,    0,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  794,    0,  794,
			  794,    0,    0,    0,  794,  794,  794,    0,    0,  794,
			  794,  794,  794,  794,  794,  794,  794,    0,    0,  794,
			  794,  794,  795,  795,    0,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,

			  795,  795,  795,    0,  795,  795,  795,  795,  795,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  798,    0,  798,    0,    0,    0,  798,
			    0,  798,  798,    0,    0,  798,  798,  798,  798,  798,
			  798,  798,    0,    0,  798,  798,  798,  798,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,

			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  801,  801,    0,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  802,
			    0,    0,    0,  802,  802,    0,    0,  802,  802,  802,
			  802,  802,  802,  802,    0,    0,    0,  802,  802,  802,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  804,  804,  804,
			    0,    0,  804,  804,  804,  804,  804,  804,  804,  804,
			    0,    0,  804,  804,  804,  805,    0,    0,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,    0,
			    0,    0,  805,  805,  805,  807,  807,  807,  807,  807,
			  807,  807,  807,    0,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,

			  808,  808,  808,  808,  808,  808,  808,  808,  808,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  810,  810,  810,    0,
			    0,    0,    0,    0,    0,    0,    0,  810,  810,  810,
			  810,  810,  810,  810,  810,    0,    0,    0,  811,  811,
			    0,  810,  811,  811,  811,  811,  811,  811,  811,    0,
			    0,    0,  811,  811,  811,  812,  812,    0,    0,  812,
			  812,  812,  812,  812,  812,  812,    0,    0,    0,  812,
			  812,  812,  813,  813,  813,    0,    0,  813,  813,  813, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  813,  813,  813,  813,  813,    0,    0,  813,  813,  813,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  815,  815,  815,
			  815,  815,  815,  815,    0,    0,    0,  815,  815,  815,
			  816,    0,  816,    0,    0,    0,  816,    0,  816,  816,
			    0,    0,  816,  816,  816,  816,  816,  816,  816,    0,
			    0,    0,  816,  816,  816,  817,  817,  817,  817,  817,
			  817,  817,    0,    0,    0,  817,  817,  817,  818,  818,
			    0,    0,  818,  818,  818,  818,  818,  818,  818,    0,

			    0,    0,  818,  818,  818,  819,    0,  819,    0,    0,
			    0,  819,    0,  819,  819,    0,    0,  819,  819,  819,
			  819,  819,  819,  819,    0,    0,  819,  819,  819,  819,
			  820,  820,    0,    0,  820,  820,  820,  820,  820,  820,
			  820,    0,    0,    0,  820,  820,  820,  822,  822,  822,
			  822,  822,  822,  822,    0,    0,  823,  822,  822,  822,
			  823,  823,    0,    0,  823,  823,  823,  823,  823,  823,
			  823,    0,    0,    0,  823,  823,  823,  824,  824,    0,
			    0,  824,  824,  824,  824,  824,  824,  824,    0,    0,
			    0,  824,  824,  824,  825,  825,    0,    0,  825,  825,

			  825,  825,  825,  825,  825,    0,    0,    0,  825,  825,
			  825,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,

			  783,  783, yy_Dummy>>,
			1, 302, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   88,   93,   75,   77,  183,    0,   66,
			   70, 1006, 6211,   97, 1001,  971,  980, 6211,   89,    0,
			 6211, 6211, 6211, 6211,  962,   87,  956,   97,  117, 6211,
			 6211,  943, 6211,  941, 6211,  272,  276,  282,  118,  293,
			  288,  297,  325,  344,  349,  353,  424,  386,  412,  378,
			  374,   47, 6211, 6211,  908,  459,  477,  490,  358,  503,
			  507,  403,  544,  548,  558,  577,  596,  327,  568,  613,
			  941, 6211, 6211,  943,  120, 6211,  103,  431,  297,  447,
			  301,  550,   97, 6211,  109,  115, 6211,  278,  946,  637,
			  617, 6211,  259,  691, 6211,  153,  925, 6211,  909, 6211,

			  904,    0,  635,  894,  896,  882,  654, 6211,  117,  413,
			  725,  663,  679,  734, 6211, 6211,  463,  759,    0,  764,
			  789,  793,  817,  821,  845,  872,  887,  904,  928,  932,
			  959,  963,  987,  993, 1012, 1029, 1046,  796, 1093, 1074,
			 1098, 1158,  228,  105, 1123,  753, 1085, 1169, 1164, 1194,
			  853,  463,  259,  809, 6211,  149,  852,    0, 1243, 1247,
			 1267, 1286,  258, 1332, 1062, 1292,  863, 1116, 1304, 1338,
			 1352, 1145, 1359, 1309, 1367, 1372, 1387, 1394, 1416, 1421,
			 1437, 1444, 1450, 1470, 1475, 6211,  849, 6211,  402, 6211,
			 6211, 1412,  621,  774,  838,  855,  272, 6211,  801,  487,

			  406,  789,  481,  788, 6211,  641, 1051, 6211,  836, 1214,
			  159, 1554,  446,  261, 1643, 6211, 6211,  808,  864, 6211,
			 6211, 6211,  825, 1486,  822,  820,  808,  806,  664,  473,
			 6211, 1513, 1502, 1508,  790,  279, 1518, 1565, 1530, 1574,
			  572, 1581, 6211,    0,    0,  780,  775, 1572, 1678,  959,
			 1681, 1682, 1688, 1720, 1739, 1746, 1766, 1740, 1779, 1792,
			 1815, 1818, 1825, 1819, 1857, 1865, 6211, 1592, 1632, 1901,
			 1919, 1937, 1955, 1973, 1637, 1972, 1682, 1978,  848, 2008,
			 1883, 2011, 2032, 2014, 2050, 2070, 2073,  765, 1642, 2116,
			 6211,  419, 2093, 2122, 2137,  704,  711,  743, 2146, 2151,

			 2156, 2174, 2184, 2198, 2206, 2212, 2218, 2226, 2239, 2267,
			 2275, 2281, 2287, 2292, 2297, 2303, 2315, 2320, 2331, 2343,
			 1191,  355, 1202,  482, 1232, 1260, 1282,  473, 6211,  703,
			  748, 1397, 6211,  569,  709,  714, 1146, 6211, 6211, 2349,
			 6211, 6211, 6211, 6211, 6211,  716, 2359, 2364, 2370,  634,
			  642, 2376, 2381, 2391, 2397, 2405, 2410, 2425, 2430, 2435,
			  675,  124,    0,  653, 2441, 2442, 2448, 2445, 2451, 2483,
			 2489, 2507, 2513, 2539,  558, 2540, 2546, 2572, 2565, 2578,
			 2613, 2615, 2646, 2657, 1737, 2662, 2681, 2725, 2690, 2730,
			 2741, 2757, 2775, 2722, 2766, 1792, 2784, 2793, 2814, 2819,

			 2832,  645, 2879, 2892, 2900,  416, 2863, 2907, 2918, 2836,
			 2923, 2929, 2938, 2943, 2954, 2959, 2967, 2988, 2993, 3000,
			 3016, 3005, 3030, 3041, 3046, 3058, 3068, 3073, 3078, 3101,
			 6211, 3106, 3090, 3118, 3129,  664, 3134, 3139, 3150, 3155,
			 3160, 3165,  652, 3178, 3189,  970,  446,    0,    0, 3171,
			 3172, 3197, 3204, 3205, 3208, 3230, 3238, 3256,  641, 3260,
			 3263, 3282, 3293, 3300, 3318, 6211,  298, 3364, 3341, 3372,
			 3384, 3414, 3401,  887, 3414, 3434, 3444, 3438,  932,  657,
			  711,  847, 3504, 6211,  954, 3512, 1021,  584,  585, 3481,
			 3518, 3525, 3532, 3538, 3543, 3566, 3571, 3587, 3594, 3603,

			 3616, 3624, 3632, 3643, 3652, 3660, 3667, 3687, 3692, 3697,
			  582, 3711, 3721, 3732, 3738, 3749, 3758,  570, 3763, 3768,
			 3777, 1074, 6211, 3782,    0,  609, 3788, 3437, 3789, 3792,
			 3793, 3815, 3796, 3840,  748, 3845, 3863, 3881, 3882, 3887,
			 3930, 6211,  386,  593, 3914, 3936, 3939, 3940, 1146, 2014,
			 2055,  541, 6211, 6211, 4002,  758, 4010, 3957, 3983,  597,
			 4016, 4023, 4028, 4039, 4047, 4055, 4063, 4071, 4076, 4085,
			 4092, 4099, 4114, 4120, 4129, 4147, 4152,  586, 4162, 4175,
			 4180,  750, 4190,  587, 4195, 4200, 4205,  572, 4211, 4212,
			 4216, 4222, 4217,  997, 4252, 4258, 4263, 4284, 4285, 1206,

			 4288, 4310, 4321,  565,  547,  536,  508,    0, 4357, 4370,
			 4375, 4381, 4386, 4400, 4405, 4410, 4415, 4428, 4433, 4438,
			 4443, 4454, 4462, 4470, 4482, 4498,  853, 4503, 1693, 4508,
			    0, 4514, 4515, 4522, 6211, 4519, 1400, 4540, 4570, 4549,
			 1683, 1981, 2221, 2516,  495,  479, 4592, 4615, 4620, 4636,
			 4641, 4650, 4586,  427, 4656, 4666, 4671, 4678, 4684, 4694,
			 6211, 4699,    0, 4692, 4691, 4713, 4716, 6211, 4726, 4746,
			 2665, 2759, 2845, 3269, 1218, 4761, 4780, 4789, 4794, 4810,
			 4815, 4820,  370, 4825, 4844, 4830,  150, 4836, 4854, 4861,
			 4862,  289, 6211,  895,  380, 6211, 4897, 4905, 4924, 4929,

			  152, 4941,    0,  277, 4935, 4939, 4940, 4959, 1785, 1844,
			 2226, 5002, 5012, 5019, 5024, 5031, 5036,  529, 5041, 5047,
			 5050, 1863, 1917, 2498, 5050, 5069, 1901, 5099, 5091, 4958,
			  303,  293,  405, 5122, 5127, 5134, 1459, 6211, 5151,  231,
			 5156, 5133, 2224, 2688, 5164, 5169, 5180, 5185, 5193,  233,
			 5214, 5191, 3004, 3174, 5198, 5222, 2138, 5227,  137,  122,
			 5234, 5239, 1604, 6211, 5251, 2024, 2530, 5256, 5261, 2570,
			 2599, 5266, 2420, 6211, 6211, 5271, 5276, 5281, 6211, 5286,
			 5296, 5301, 5306, 6211, 5347, 5374, 5401, 5428, 5455, 5315,
			 1048, 5481, 5503, 5529, 5555, 5581, 5608, 5635, 5661, 5687,

			 5714, 5741, 5763, 5789, 5808, 5828, 1167, 5854, 5881, 5908,
			 5934, 5948, 5965, 5983, 6009, 6023, 6048, 6061, 6078, 6103,
			 6120, 5322, 6133, 6150, 6167, 6184, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  783,    1,  784,  784,  785,  785,  783,    7,  786,
			  786,  783,  783,  783,  783,  783,  787,  783,  788,  789,
			  783,  783,  783,  783,  783,  783,  790,  783,  783,  783,
			  783,  783,  783,  783,  783,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  792,  783,  783,  793,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,   62,  794,  794,
			  783,  783,  783,  795,  783,  783,  783,  795,  795,  795,
			  795,  795,  796,  783,  797,  796,  783,  798,  783,  798,
			  798,  783,  799,  800,  783,  783,  783,  783,  787,  783,

			  801,  801,  801,  802,  803,  783,  783,  783,  804,  783,
			  783,  783,  783,  783,  783,  783,  783,  791,  805,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  783,   46,  791,
			  791,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  792,  792,  792,  793,  783,  783,  783,  806,  794,  794,
			  794,  794,  783,  794,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  783,  795,  783,  783,  783,
			  783,  795,  795,  795,  795,  795,  796,  783,  807,  796,

			  797,  808,  797,  807,  783,  798,  798,  783,  783,  783,
			  783,  809,  783,  799,  800,  783,  783,  214,  810,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  790,  783,  783,  783,  783,  783,
			  783,  783,  783,  811,  812,  783,  805,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  783,  140,
			  140,  140,  140,  140,  140,  140,  783,  783,  812,  140,
			  140,  140,  140,  140,  141,  141,  141,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  783,  792,  792,
			  783,  813,  163,  163,  163,  783,  783,  163,  163,  163,

			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  795,  795,  795,  795,  795,  795,  795,  807,  783,  808,
			  814,  814,  783,  814,  814,  814,  810,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  811,  812,  815,  805,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  783,  140,  140,  140,  140,  140,
			  140,  783,  812,  138,  141,  383,  383,  140,  138,  783,
			  812,  140,  140,  140,  140,  783,  140,  140,  140,  140,

			  140,  816,  792,  792,  792,  783,  163,  163,  783,  812,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  817,  818,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  783,  140,
			  140,  140,  140,  140,  140,  783,  812,  140,  140,  783,
			  812,  383,  471,  783,  140,  140,  140,  140,  811,  783,
			  819,  816,  792,  783,  783,  792,  783,  783,  783,  163,
			  163,  783,  812,  163,  163,  163,  163,  163,  163,  163,

			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  820,  818,  140,  140,  140,  140,
			  140,  140,  140,  140,  783,  140,  140,  140,  140,  140,
			  383,  783,  812,  783,  140,  140,  140,  140,  783,  811,
			  811,  819,  783,  783,  792,  783,  792,  783,  163,  783,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  820,  140,  140,
			  140,  140,  140,  783,  140,  140,  140,  140,  140,  783,

			  140,  140,  140,  783,  783,  811,  811,  821,  783,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  783,  783,  783,  783,  783,  783,  783,  783,
			  822,  140,  140,  140,  783,  140,  783,  140,  140,  140,
			  783,  783,  817,  817,  823,  783,  163,  163,  163,  163,
			  163,  163,  163,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  824,  140,  140,  140,  140,  783,  140,  140,
			  783,  783,  820,  820,  783,  163,  163,  163,  163,  163,
			  163,  783,  783,  783,  783,  783,  824,  140,  140,  140,
			  140,  783,  783,  820,  820,  783,  163,  163,  163,  163,

			  783,  783,  825,  783,  140,  140,  140,  140,  783,  783,
			  820,  163,  163,  163,  163,  783,  783,  825,  783,  140,
			  140,  783,  783,  820,  163,  163,  783,  783,  140,  140,
			  783,  783,  820,  163,  163,  783,  783,  783,  783,  783,
			  783,  140,  783,  783,  163,  783,  783,  783,  783,  783,
			  783,  140,  783,  783,  163,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,    0,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,

			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    1,    8,    1,    1,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   18,
			   19,   20,   21,   21,   21,   22,   22,   22,   23,   24,
			   25,   26,   27,   28,    1,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   35,   35,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   35,   48,   49,   50,
			   51,   52,   53,   54,   55,   56,    1,   57,   58,   59,

			   60,   61,   62,   63,   64,   65,   63,   63,   66,   67,
			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   63,   80,   81,   82,    1,    1,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,    1,    1,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   87,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   89,   90,   90,   90,   90,   90,   90,   90,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    5,    6,    1,    1,    7,    8,    8,    9,   10,   10,
			   10,   10,   11,    1,    1,   12,    1,   13,    1,   14,
			   15,   16,   17,   18,   19,   14,   14,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   20,   21,   22,   23,    1,   10,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   25,   26,
			    1,    1,   27,    1,    1,    1,    1,    1,    1,    1,
			    1, yy_Dummy>>)
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
			  119,  119,  102,  105,  132,  102,  132,  132,   67,  132,
			  132,   69,  132,  132,   94,    1,    2,   27,  115,  114,

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

			    0,    0,    0,  103,  104,    0,    0,   69,   67,    0,
			   66,    0,   65,    0,    0,   94,   92,   92,    0,   93,
			  129,  123,  129,  129,  129,  129,  129,  129,    0,    4,
			   33,  113,    0,    0,    0,    0,    0,  109,    0,  107,
			    0,    0,   89,    0,    0,    0,    0,   95,   95,   38,
			   95,   95,   95,   95,   95,   95,   95,   95,    0,   95,
			   95,   95,   95,   41,   95,   95,   87,    0,    0,   80,
			   81,   80,   80,   80,   88,   95,   88,   88,   88,   95,
			   95,   95,   95,   95,   95,   40,   95,    0,    0,    0,
			   97,  100,   98,   98,   38,    0,    0,   70,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   41,   98,   98,   98,   98,   98,   98,   98,   40,   98,
			  119,  119,  119,  119,  119,  119,  119,    0,  103,  104,
			    0,    0,   68,   66,   65,   69,    0,  127,  130,  130,
			  128,  124,  125,  126,   90,  113,    0,  113,    0,    0,
			    0,    0,  109,    0,    0,    0,  112,  107,    0,    0,
			    0,    0,    0,   96,   95,   95,   95,   95,   95,   37,
			   95,   95,   95,   95,    0,   95,   95,   95,   95,   95,
			   95,    0,    0,   95,   79,   95,   95,   95,   95,    0,
			    0,   79,   79,   79,   36,    0,   43,   95,   95,   95,

			   95,   64,    0,    0,    0,    0,   98,   98,    0,    0,
			   98,   98,   98,   37,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   36,   43,   98,   98,   98,   98,
			  104,  113,    0,    0,    0,  108,  109,    0,  110,    0,
			  112,    0,    0,    0,  107,   76,    0,    0,    0,   58,
			   95,   95,   95,   95,   95,   95,   44,   95,    0,   95,
			   95,   35,   95,   95,   95,   81,   81,   81,   80,    0,
			    0,   95,   95,    0,   95,   95,   95,   95,    0,   64,
			   64,    0,    0,   63,    0,    0,   63,    0,    0,   58,
			   98,    0,   70,   98,   98,   98,   98,   98,   44,   98,

			   98,   98,   35,   98,   98,   98,   98,   98,   98,   98,
			  113,    0,    0,  109,  110,    0,    0,  112,    0,    0,
			    0,    0,   76,    0,    0,    0,   95,   59,   95,   60,
			   95,   95,   46,   95,    0,   95,   95,   95,   95,   95,
			   95,   79,   79,    0,   52,   95,   95,   95,    0,    0,
			    0,    0,   62,   61,    0,    0,    0,    0,   98,    0,
			   59,   98,   60,   98,   98,   46,   98,   98,   98,   98,
			   98,   98,   52,   98,   98,   98,    0,   99,    0,  110,
			    0,  113,    0,   78,    0,    0,  111,    0,   95,   95,
			   57,   95,   45,    0,   42,   56,   34,   95,   50,    0,

			   95,   95,   95,    0,    0,    0,    0,    0,    0,   98,
			   98,   57,   98,   45,   42,   56,   34,   98,   50,   98,
			   98,   98,    0,  110,    0,    0,    0,    0,   75,  111,
			    0,   95,   95,   95,   84,   95,    0,   95,   95,   53,
			    0,    0,    0,    0,    0,  100,   98,   98,   98,   98,
			   98,   98,   53,  112,    0,  112,    0,    0,    0,    0,
			   75,  111,    0,   95,   95,   47,   95,   83,   51,   95,
			    0,    0,    0,    0,    0,   98,   98,   47,   98,   51,
			   98,  112,   77,    0,   75,  111,    0,   95,   95,   95,
			   95,   82,   82,   82,   82,   91,   98,   98,   98,   98,

			    0,    0,    0,    0,   95,   49,   48,   95,    0,    0,
			    0,   98,   49,   48,   98,    0,    0,    0,    0,   95,
			   95,    0,    0,    0,   98,   98,   74,   71,   95,   54,
			    0,    0,    0,   98,   54,    0,    0,   74,    0,    0,
			    0,   95,    0,    0,   98,    0,    0,   71,    0,    0,
			   71,   55,    0,    0,   55,    0,   73,    0,    0,    0,
			    0,    0,    0,   73,   71,    0,    0,    0,    0,    0,
			    0,    0,   72,   85,   86,    0,    0,    0,   72,    0,
			   72,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6211
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 783
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 784
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

	Init_buffer_size: INTEGER = 256
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
