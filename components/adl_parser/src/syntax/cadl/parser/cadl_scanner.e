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

	SHARED_DT_FACTORY
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
if yy_act <= 65 then
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 75 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 75")
end
-- Ignore separators
else
--|#line 76 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 76")
end
in_lineno := in_lineno + text_count
end
else
--|#line 81 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 81")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 82 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 82")
end
in_lineno := in_lineno + 1
else
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 87 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 87")
end
last_token := Plus_code
else
--|#line 88 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 88")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 89 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 89")
end
last_token := Slash_code
else
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Equal_code
else
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Semicolon_code
else
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Colon_code
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Left_parenthesis_code
else
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
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
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Dollar_code
else
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := Right_bracket_code
else
--|#line 108 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 108")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 24 then
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := SYM_END_CBLOCK
else
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 112 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 112")
end
last_token := SYM_LE
else
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_NE
end
else
if yy_act = 28 then
--|#line 115 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 115")
end
last_token := SYM_LT
else
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := SYM_GT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_MODULO
else
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_DIV
end
else
if yy_act = 32 then
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
end
last_token := SYM_ELLIPSIS
else
--|#line 122 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 122")
end
last_token := SYM_LIST_CONTINUE
end
end
end
end
end
else
if yy_act <= 49 then
if yy_act <= 41 then
if yy_act <= 37 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 126 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 126")
end
last_token := SYM_MATCHES
else
--|#line 128 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 128")
end
last_token := SYM_MATCHES
end
else
if yy_act = 36 then
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_THEN
else
--|#line 134 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 134")
end
last_token := SYM_ELSE
end
end
else
if yy_act <= 39 then
if yy_act = 38 then
--|#line 136 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 136")
end
last_token := SYM_AND
else
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_OR
end
else
if yy_act = 40 then
--|#line 140 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 140")
end
last_token := SYM_XOR
else
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_NOT
end
end
end
else
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_IMPLIES
else
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_TRUE
end
else
if yy_act = 44 then
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_FALSE
else
--|#line 150 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 150")
end
last_token := SYM_FORALL
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_EXISTS
else
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_EXISTENCE
end
else
if yy_act = 48 then
--|#line 158 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 158")
end
last_token := SYM_OCCURRENCES
else
--|#line 160 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 160")
end
last_token := SYM_CARDINALITY
end
end
end
end
else
if yy_act <= 57 then
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_ORDERED
else
--|#line 164 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 164")
end
last_token := SYM_UNORDERED
end
else
if yy_act = 52 then
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_UNIQUE
else
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_USE_NODE
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
if yy_act = 56 then
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_INCLUDE
else
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_EXCLUDE
end
end
end
else
if yy_act <= 61 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_AFTER
else
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end
last_token := SYM_BEFORE
end
else
if yy_act = 60 then
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end
last_token := SYM_CLOSED
else
--|#line 185 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 185")
end

	last_token := V_URI
	last_string_value := text

end
end
else
if yy_act <= 63 then
if yy_act = 62 then
--|#line 191 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 191")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 196 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 196")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 64 then
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 219 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 219")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
end
end
end
end
end
end
else
if yy_act <= 98 then
if yy_act <= 82 then
if yy_act <= 74 then
if yy_act <= 70 then
if yy_act <= 68 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 227 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 227")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
else
--|#line 234 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 234")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
end
else
--|#line 241 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 241")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 69 then
--|#line 244 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 244")
end
in_lineno := in_lineno + 1
else
--|#line 246 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 246")
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
end
else
if yy_act <= 72 then
if yy_act = 71 then
--|#line 267 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 267")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 273 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 273")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act = 73 then
--|#line 280 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 280")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 281 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 281")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 78 then
if yy_act <= 76 then
if yy_act = 75 then
--|#line 282 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 282")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 289 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 289")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 77 then
--|#line 290 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 297 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 297")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 80 then
if yy_act = 79 then
--|#line 298 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 298")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 305 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 305")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 81 then
--|#line 306 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 306")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 313 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 313")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
end
end
end
else
if yy_act <= 90 then
if yy_act <= 86 then
if yy_act <= 84 then
if yy_act = 83 then
--|#line 325 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 325")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 335 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 335")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 85 then
--|#line 340 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 340")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 350 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 350")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
else
if yy_act <= 88 then
if yy_act = 87 then
--|#line 356 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 356")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 366 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 366")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 89 then
--|#line 367 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 367")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 381 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 381")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 94 then
if yy_act <= 92 then
if yy_act = 91 then
--|#line 388 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 388")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 394 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 394")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 93 then
--|#line 400 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 400")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 404 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 404")
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

				dadl_parser.execute (str_, source_start_line + in_lineno)
				if not dadl_parser.syntax_error then
					if dadl_parser.output.is_typed then
						tid := dynamic_type_from_string(dadl_parser.output.rm_type_name)
						if tid >= 0 then
							c_domain_type ?= dadl_parser.output.as_object(tid)
							if c_domain_type /= Void then
								last_token := V_C_DOMAIN_TYPE
							else
								dadl_parser_error := "Conversion of " + dadl_parser.output.rm_type_name + " failed"
								last_token := ERR_C_DOMAIN_TYPE
							end
						else
							dadl_parser_error := "Domain type " + dadl_parser.output.rm_type_name + " unknown or not visible in type system"
							last_token := ERR_C_DOMAIN_TYPE
						end
					else
						dadl_parser_error := "Domain type in dADL section not typed"
						last_token := ERR_C_DOMAIN_TYPE
					end
				else
					dadl_parser_error := dadl_parser.error_message
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
end
end
else
if yy_act <= 96 then
if yy_act = 95 then
--|#line 445 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 445")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 451 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 451")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 97 then
--|#line 457 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 457")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 463 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 463")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
end
end
end
else
if yy_act <= 114 then
if yy_act <= 106 then
if yy_act <= 102 then
if yy_act <= 100 then
if yy_act = 99 then
--|#line 470 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 470")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 476 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 476")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 101 then
--|#line 483 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 483")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
	
else
--|#line 487 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 487")
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
if yy_act <= 104 then
if yy_act = 103 then
--|#line 498 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 498")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 505 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 505")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 105 then
--|#line 510 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 510")
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
--|#line 525 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 525")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 110 then
if yy_act <= 108 then
if yy_act = 107 then
--|#line 526 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 526")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 109 then
	yy_end := yy_end - 1
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
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
--|#line 532 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 532")
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
if yy_act <= 112 then
if yy_act = 111 then
--|#line 533 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 533")
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
--|#line 553 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 553")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 113 then
--|#line 558 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 558")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 566 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 566")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 122 then
if yy_act <= 118 then
if yy_act <= 116 then
if yy_act = 115 then
--|#line 568 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 568")
end
in_buffer.append_character ('"')
else
--|#line 570 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 570")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 117 then
--|#line 574 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 574")
end
in_buffer.append_string (text)
else
--|#line 576 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 576")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 120 then
if yy_act = 119 then
--|#line 581 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 581")
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
--|#line 592 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 592")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 121 then
--|#line 601 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 601")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 603 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 603")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 126 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 604 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 604")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 605 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 605")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 125 then
--|#line 606 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 606")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 607 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 607")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 128 then
if yy_act = 127 then
--|#line 609 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 609")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 610 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 610")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 129 then
--|#line 614 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 614")
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
--|#line 613 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 613")
end
terminate
when 1 then
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
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
			create an_array.make_filled (0, 0, 5931)
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
			   28,   28,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   38,   41,   42,   38,   43,
			   44,   45,   46,   38,   38,   38,   47,   48,   38,   49,
			   50,   38,   51,   52,   53,   54,   12,   55,   56,   57,
			   58,   59,   60,   58,   61,   62,   58,   63,   64,   65,
			   58,   58,   58,   58,   66,   67,   58,   58,   68,   69,
			   70,   71,   72,   12,   12,   12,   12,   12,   12,   12,
			   12,   12,   74,   83,   83,   93,   75,   74,   93,  101,

			   95,   75,   95,   95,  104,  106,  211,  107,  107,  107,
			  107,  107,  109,  179,  110,  233,  111,  111,  111,  111,
			  111,  116,  116,  187,  116,  873,  267,  189,  203,   84,
			   84,  105,  109,  175,  110,  171,  113,  113,  113,  113,
			  113,  180,   76,  102,  118,  176,  172,   76,  872,  267,
			   94,  188,  212,   94,  112,  190,  204,  336,   85,   85,
			  856,  177,  210,  173,  210,  210,   95,  339,   95,   95,
			  234,  828,  828,  178,  112,  174,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   86,   86,   91,
			   86,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  116,  116,  205,
			  116,  116,  116,  195,  116,  855,  224,  116,  116,  224,
			  116,  196,  209,  116,  116,  362,  116,  841,  116,  116,

			  118,  116,  116,  116,  118,  116,  209,  312,  206,  119,
			  118,  197,  122,  120,  123,  121,  118,  267,  313,  198,
			  127,  118,  267,  124,  362,  118,  210,  307,  210,  210,
			  116,  116,  128,  116,  125,  312,  129,  119,  226,  769,
			  122,  120,  123,  121,  229,  126,  313,  229,  127,  116,
			  116,  124,  116,  118,  116,  116,  209,  116,  116,  116,
			  128,  116,  125,  308,  129,  209,  812,  130,  131,  181,
			  182,  214,  118,  132,  126,  183,  133,  118,  309,  116,
			  116,  118,  116,  116,  116,  214,  116,  135,  314,  830,
			  831,  116,  116,  134,  116,  130,  131,  184,  185,  267,

			  136,  132,  118,  186,  133,  890,  118,  209,  199,  320,
			  191,  830,  831,  200,  118,  135,  314,  116,  116,  233,
			  116,  134,  147,  192,  209,  143,  219,  148,  136,  116,
			  116,  222,  116,  144,  216,  216,  201,  320,  193,  267,
			  118,  202,  213,  213,  213,  137,  137,  137,  137,  137,
			  147,  194,  118,  143,  267,  145,  148,  625,  267,  138,
			  146,  144,  220,  590,  165,  155,  139,  220,  781,  155,
			  312,  155,  322,  140,  234,  141,  769,  142,  259,  259,
			  259,  259,  259,  145,  215,  215,  215,  138,  146,  362,
			  160,  221,  166,  160,  139,  508,  221,  160,  317,  160,

			  322,  217,  217,  217,  141,  160,  142,  153,  228,  153,
			  153,  228,  153,  231,  267,  154,  231,  154,  363,  500,
			  229,  230,  219,  155,  155,  155,  155,  155,  156,  323,
			  231,  314,  267,  267,  155,  155,  155,  155,  155,  157,
			  155,  155,  155,  158,  155,  159,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  323,  220,  319,
			  226,  155,  160,  160,  161,  160,  160,  162,  160,  160,
			  160,  163,  160,  164,  160,  160,  160,  160,  160,  161,
			  160,  160,  160,  160,  160,  167,  228,  221,  267,  228,
			  155,  267,  267,  267,  168,  267,  155,  267,  229,  256,

			  256,  256,  256,  256,  371,  267,  267,  320,  231,  116,
			  116,  746,  116,  169,  257,  160,  313,  323,  160,  745,
			  116,  116,  170,  116,  160,  265,  265,  265,  265,  265,
			  160,  153,  266,  267,  153,  321,  467,  258,  226,  154,
			  223,  744,  257,  118,  318,  325,  486,  155,  155,  155,
			  155,  155,  156,  326,  267,  743,  332,  727,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  326,  599,  322,  332,  155,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,

			  160,  160,  160,  160,  160,  160,  160,  160,  160,  236,
			  236,  324,  236,  375,  374,  241,  375,  261,  261,  261,
			  261,  261,  112,  267,  242,  242,  242,  242,  242,  209,
			  267,  819,  262,  489,  237,  549,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  243,
			  262,  109,  489,  110,  549,  263,  263,  263,  263,  263,
			  264,  629,  820,  543,  244,  267,  544,  109,  245,  110,
			  246,  263,  263,  263,  263,  263,  333,  267,  267,  238,
			  249,  249,  249,  249,  249,  267,  315,  267,  316,  316,

			  316,  316,  316,  112,  250,  326,  337,  216,  216,  338,
			  332,  251,  116,  116,  333,  116,  267,  333,  252,  112,
			  253,  267,  254,  116,  116,  267,  116,  116,  116,  267,
			  116,  267,  250,  329,  337,  118,  267,  338,  334,  251,
			  267,  116,  116,  337,  116,  335,  118,  267,  342,  253,
			  118,  254,  116,  116,  267,  116,  269,  271,  344,  270,
			  342,  688,  267,  338,  118,  267,  116,  116,  823,  116,
			  267,  340,  267,  272,  346,  118,  342,  116,  116,  267,
			  116,  347,  350,  351,  269,  271,  344,  270,  343,  118,
			  267,  341,  629,  327,  273,  116,  116,  823,  116,  328,

			  118,  272,  346,  116,  116,  274,  116,  489,  267,  347,
			  350,  351,  116,  116,  543,  116,  267,  543,  118,  609,
			  275,  327,  273,  600,  276,  267,  118,  328,  116,  116,
			  277,  116,  827,  274,  594,  118,  490,  116,  116,  278,
			  116,  267,  116,  116,  109,  116,  267,  267,  275,  280,
			  267,  118,  276,  267,  279,  267,  116,  116,  277,  116,
			  118,  827,  327,  116,  116,  118,  116,  278,  328,  267,
			  347,  282,  116,  116,  542,  116,  267,  281,  344,  118,
			  116,  116,  279,  116,  356,  267,  118,  769,  116,  116,
			  330,  116,  267,  267,  856,  118,  331,  267,  349,  282, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  542,  267,  267,  118,  847,  281,  345,  284,  346,  286,
			  283,  118,  356,  267,  819,  350,  285,  360,  287,  116,
			  116,  267,  116,  267,  267,  769,  224,  116,  116,  224,
			  116,  356,  267,  847,  351,  284,  348,  286,  116,  116,
			  267,  116,  118,  352,  285,  360,  287,  288,  267,  288,
			  118,  267,  360,  116,  116,  821,  116,  138,  450,  359,
			  267,  118,  353,  294,  451,  289,  267,  410,  138,  290,
			  491,  294,  291,  141,  209,  454,  118,  374,  226,  117,
			  361,  292,  294,  293,  267,  138,  450,  117,  117,  117,
			  117,  117,  451,  289,  374,  305,  138,  290,  116,  116,

			  291,  116,  141,  454,  116,  116,  248,  116,  248,  248,
			  292,  267,  293,  116,  116,  294,  116,  267,  209,  117,
			  267,  118,  267,  305,  209,  267,  267,  118,  486,  295,
			  295,  295,  295,  295,  267,  299,  118,  209,  300,  209,
			  450,  116,  116,  301,  116,  354,  451,  296,  117,  355,
			  297,  213,  213,  213,  267,  267,  298,  267,  467,  116,
			  116,  267,  116,  299,  118,  456,  300,  449,  452,  823,
			  222,  301,  267,  354,  453,  296,  302,  355,  297,  354,
			  303,  446,  118,  355,  298,  457,  116,  116,  228,  116,
			  304,  228,  410,  456,  391,  213,  213,  213,  824,  267,

			  229,  369,  369,  369,  302,  385,  220,  357,  303,  118,
			  231,  358,  384,  457,  370,  370,  370,  250,  304,  364,
			  365,  366,  367,  368,  228,  378,  378,  228,  378,  250,
			  460,  391,  461,  253,  306,  221,  229,  462,  247,  247,
			  226,  247,  383,  391,  543,  250,  231,  544,  382,  379,
			  237,  380,  381,  381,  381,  381,  381,  250,  460,  250,
			  461,  386,  253,  306,  267,  462,  251,  399,  399,  399,
			  399,  399,  890,  391,  890,  253,  226,  397,  227,  397,
			  223,  209,  398,  398,  398,  398,  398,  250,  400,  400,
			  400,  400,  400,  404,  251,  404,  625,  339,  405,  405,

			  405,  405,  405,  280,  253,  267,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  372,
			  373,  374,  372,  373,  372,  372,  372,  372,  372,  372,
			  372,  372,  375,  230,  230,  372,  230,  230,  230,  230,
			  230,  372,  376,  372,  372,  372,  372,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  372,  372,  377,  372,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,

			  230,  230,  230,  230,  230,  230,  230,  230,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  236,  236,  311,  236,  407,  407,  407,  407,  109,  310,
			  110,  152,  406,  406,  406,  406,  406,  408,  408,  408,
			  408,  408,  763,  763,  763,  237,  267,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  112,  249,  249,  249,  249,  249,  457,  307,  392,  392,
			  392,  392,  392,  255,  466,  387,  428,  428,  428,  428,
			  428,  248,  388,  267,  267,  247,  393,  240,  469,  394,

			  238,  389,   99,  390,  459,  395,  396,  396,  396,  396,
			  396,  456,  466,  387,  401,  401,  401,  401,  401,  454,
			  388,  257,  116,  116,  393,  116,  469,  394,   96,  402,
			  389,  470,  390,  395,  227,  267,  267,  116,  116,  458,
			  116,  223,  209,  207,  258,  118,  152,  455,  627,  257,
			  267,  627,  403,  411,  460,  116,  116,  402,  116,  470,
			  118,  116,  116,  150,  116,  115,  116,  116,  267,  116,
			  116,  116,  628,  116,  267,  114,  412,  108,  118,  267,
			  421,  411,  463,  267,  118,  116,  116,   99,  116,  118,
			  471,  421,   97,  118,  116,  116,  414,  116,  267,   96,

			  413,  421,  116,  116,  412,  116,  890,  267,  118,  116,
			  116,  890,  116,  415,  474,  267,  416,  118,  471,  421,
			  116,  116,  267,  116,  414,  118,  116,  116,  413,  116,
			  417,  476,  118,  267,  116,  116,  890,  116,  267,  267,
			  890,  415,  474,  118,  416,  418,  890,  267,  890,  118,
			  890,  477,  419,  116,  116,  890,  116,  118,  417,  476,
			  267,  461,  422,  267,  116,  116,  267,  116,  116,  116,
			  423,  116,  627,  418,  420,  627,  118,  267,  267,  477,
			  419,  267,  116,  116,  890,  116,  469,  118,  424,  464,
			  422,  118,  476,  425,  890,  267,  628,  480,  423,  116,

			  116,  470,  116,  267,  890,  118,  117,  117,  117,  117,
			  117,  890,  267,  890,  472,  890,  424,  481,  890,  267,
			  478,  425,  118,  116,  116,  480,  116,  426,  890,  473,
			  427,  116,  116,  462,  116,  474,  267,  890,  890,  429,
			  429,  429,  429,  429,  267,  481,  118,  431,  431,  431,
			  431,  431,  484,  267,  118,  426,  116,  116,  427,  116,
			  890,  465,  890,  475,  890,  116,  116,  430,  116,  267,
			  890,  477,  432,  432,  432,  432,  432,  890,  267,  118,
			  484,  433,  433,  433,  433,  433,  267,  315,  118,  315,
			  315,  315,  315,  315,  116,  116,  435,  116,  435,  479,

			  430,  117,  117,  117,  117,  117,  485,  267,  267,  430,
			  434,  434,  434,  434,  434,  395,  466,  118,  436,  117,
			  548,  437,  116,  116,  890,  116,  890,  438,  116,  116,
			  890,  116,  267,  480,  485,  267,  552,  890,  430,  116,
			  116,  267,  116,  395,  468,  118,  436,  117,  548,  437,
			  481,  118,  267,  116,  116,  438,  116,  116,  116,  267,
			  116,  482,  118,  890,  552,  298,  267,  890,  116,  116,
			  267,  116,  116,  116,  440,  116,  118,  439,  483,  267,
			  118,  267,  209,  116,  116,  267,  116,  484,  441,  116,
			  116,  118,  116,  298,  890,  118,  267,  116,  116,  209,

			  116,  890,  267,  209,  890,  439,  118,  209,  485,  442,
			  267,  890,  118,  890,  443,  487,  441,  209,  890,  447,
			  118,  447,  447,  447,  447,  447,  307,  448,  890,  448,
			  448,  448,  448,  448,  307,  890,  488,  442,  376,  374,
			  311,  376,  443,  444,  315,  445,  316,  316,  316,  316,
			  316,  421,  890,  373,  374,  554,  373,  890,  890,  213,
			  213,  213,  421,  378,  378,  375,  378,  398,  398,  398,
			  398,  398,  421,  890,  445,  376,  215,  215,  215,  890,
			  217,  217,  217,  554,  213,  213,  213,  890,  890,  890,
			  421,  890,  267,  890,  213,  213,  213,  380,  381,  381, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  381,  381,  381,  555,  558,  377,  492,  492,  492,  492,
			  492,  493,  493,  493,  493,  493,  494,  494,  494,  494,
			  494,  393,  394,  267,  394,  549,  890,  890,  395,  890,
			  395,  555,  558,  890,  491,  672,  672,  672,  672,  491,
			  890,  555,  559,  624,  491,  628,  267,  267,  628,  393,
			  394,  890,  394,  696,  551,  435,  395,  435,  395,  392,
			  392,  392,  392,  392,  498,  498,  498,  498,  498,  557,
			  559,  499,  499,  499,  499,  499,  548,  495,  558,  257,
			  496,  501,  501,  501,  501,  501,  497,  502,  502,  502,
			  502,  502,  626,  890,  890,  503,  503,  503,  503,  503,

			  890,  890,  258,  562,  550,  495,  560,  257,  496,  500,
			  402,  504,  890,  504,  497,  890,  505,  505,  505,  505,
			  505,  506,  506,  506,  506,  506,  405,  405,  405,  405,
			  405,  562,  890,  403,  890,  267,  890,  890,  402,  507,
			  507,  507,  507,  507,  509,  510,  890,  511,  511,  511,
			  511,  511,  512,  512,  512,  512,  512,  513,  513,  513,
			  513,  513,  116,  116,  552,  116,  116,  116,  890,  116,
			  267,  563,  890,  116,  116,  267,  116,  508,  890,  267,
			  116,  116,  890,  116,  890,  118,  267,  116,  116,  118,
			  116,  565,  553,  267,  116,  116,  118,  116,  890,  563,

			  267,  559,  890,  118,  515,  116,  116,  267,  116,  524,
			  118,  519,  516,  116,  116,  517,  116,  118,  267,  565,
			  524,  890,  518,  267,  116,  116,  267,  116,  118,  561,
			  524,  890,  515,  566,  890,  890,  118,  267,  567,  519,
			  890,  516,  267,  517,  570,  554,  890,  118,  524,  521,
			  518,  116,  116,  890,  116,  522,  116,  116,  520,  116,
			  562,  566,  116,  116,  267,  116,  567,  116,  116,  267,
			  116,  267,  570,  556,  118,  267,  890,  521,  523,  118,
			  267,  116,  116,  522,  116,  118,  520,  890,  564,  267,
			  118,  525,  890,  565,  267,  116,  116,  890,  116,  116,

			  116,  890,  116,  890,  118,  527,  523,  526,  267,  890,
			  570,  117,  267,  890,  117,  528,  572,  573,  118,  525,
			  117,  568,  118,  428,  428,  428,  428,  428,  534,  534,
			  534,  534,  534,  527,  267,  526,  890,  529,  571,  117,
			  576,  530,  117,  528,  572,  573,  267,  267,  117,  288,
			  531,  288,  537,  429,  429,  429,  429,  429,  431,  431,
			  431,  431,  431,  537,  267,  529,  566,  890,  576,  530,
			  890,  290,  890,  537,  532,  572,  117,  577,  531,  576,
			  117,  432,  432,  432,  432,  432,  434,  434,  434,  434,
			  434,  537,  890,  573,  569,  289,  630,  116,  116,  290,

			  116,  890,  532,  574,  117,  577,  890,  580,  117,  267,
			  267,  292,  890,  433,  433,  433,  433,  433,  117,  890,
			  118,  575,  890,  289,  630,  632,  577,  533,  535,  535,
			  535,  535,  535,  267,  536,  536,  536,  536,  536,  890,
			  292,  890,  117,  116,  116,  633,  116,  117,  117,  116,
			  116,  630,  116,  632,  581,  533,  267,  890,  116,  116,
			  890,  116,  267,  890,  116,  116,  118,  116,  890,  578,
			  117,  267,  118,  633,  890,  636,  117,  267,  890,  631,
			  579,  118,  116,  116,  890,  116,  642,  118,  116,  116,
			  267,  116,  890,  116,  116,  267,  116,  578,  890,  890,

			  596,  267,  596,  636,  890,  118,  542,  633,  579,  538,
			  597,  118,  539,  643,  642,  540,  118,  447,  890,  447,
			  447,  447,  447,  447,  307,  448,  541,  448,  448,  448,
			  448,  448,  307,  644,  647,  635,  890,  538,  598,  890,
			  539,  643,  890,  540,  392,  392,  392,  392,  392,  582,
			  582,  582,  582,  582,  541,  546,  492,  492,  492,  492,
			  492,  644,  647,  547,  493,  493,  493,  493,  493,  890,
			  387,  494,  494,  494,  494,  494,  890,  890,  387,  583,
			  583,  583,  583,  583,  890,  387,  389,  585,  585,  585,
			  585,  585,  388,  498,  498,  498,  498,  498,  387,  116,

			  116,  389,  116,  890,  116,  116,  387,  116,  584,  890,
			  890,  890,  267,  387,  890,  389,  890,  267,  890,  890,
			  388,  890,  118,  890,  890,  500,  890,  118,  890,  890,
			  389,  586,  586,  586,  586,  586,  584,  587,  587,  587,
			  587,  587,  588,  588,  588,  588,  588,  505,  505,  505,
			  505,  505,  589,  589,  589,  589,  589,  402,  591,  591,
			  591,  591,  591,  592,  592,  592,  592,  592,  593,  593,
			  593,  593,  593,  588,  588,  588,  588,  588,  890,  890,
			  403,  267,  267,  116,  116,  402,  116,  890,  595,  510,
			  590,  511,  511,  511,  511,  511,  267,  116,  116,  643,

			  116,  508,  116,  116,  890,  116,  118,  632,  116,  116,
			  267,  116,  890,  890,  890,  267,  595,  890,  890,  890,
			  118,  267,  890,  116,  116,  118,  116,  645,  602,  116,
			  116,  118,  116,  267,  890,  634,  267,  601,  604,  890,
			  603,  267,  267,  616,  116,  116,  118,  116,  116,  116,
			  636,  116,  118,  605,  616,  649,  602,  267,  890,  647,
			  606,  267,  116,  116,  616,  116,  604,  118,  603,  650,
			  653,  118,  607,  116,  116,  267,  116,  890,  639,  610,
			  608,  605,  616,  649,  621,  118,  267,  648,  606,  890,
			  116,  116,  611,  116,  890,  622,  118,  650,  653,  637,

			  607,  116,  116,  267,  116,  623,  890,  610,  608,  116,
			  116,  638,  116,  118,  267,  615,  615,  615,  615,  615,
			  611,  612,  267,  622,  118,  116,  116,  637,  116,  117,
			  267,  890,  118,  534,  534,  534,  534,  534,  267,  638,
			  614,  267,  890,  613,  890,  890,  890,  644,  118,  612,
			  890,  536,  536,  536,  536,  536,  890,  117,  890,  435,
			  497,  435,  267,  535,  535,  535,  535,  535,  614,  430,
			  649,  613,  117,  116,  116,  646,  116,  117,  116,  116,
			  637,  116,  890,  890,  437,  267,  267,  654,  497,  890,
			  438,  267,  638,  655,  116,  116,  118,  116,  651,  656,

			  117,  118,  662,  650,  617,  117,  267,  267,  640,  618,
			  116,  116,  437,  116,  890,  654,  267,  118,  438,  697,
			  641,  655,  890,  267,  653,  258,  698,  656,  890,  890,
			  662,  652,  617,  118,  654,  890,  619,  618,  435,  692,
			  435,  890,  582,  582,  582,  582,  582,  697,  700,  620,
			  692,  435,  657,  435,  698,  583,  583,  583,  583,  583,
			  693,  267,  658,  496,  619,  659,  890,  659,  890,  497,
			  660,  660,  660,  660,  660,  698,  700,  620,  692,  890,
			  890,  701,  497,  660,  660,  660,  660,  660,  890,  890,
			  890,  496,  661,  661,  661,  661,  661,  497,  588,  588, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  588,  588,  588,  699,  664,  664,  664,  664,  664,  701,
			  497,  704,  705,  663,  665,  665,  665,  665,  665,  890,
			  890,  500,  666,  666,  666,  666,  666,  667,  667,  667,
			  667,  667,  668,  668,  668,  668,  668,  890,  890,  704,
			  705,  663,  590,  669,  669,  669,  669,  669,  670,  890,
			  670,  890,  692,  667,  667,  667,  667,  667,  671,  671,
			  671,  671,  671,  694,  890,  508,  674,  674,  674,  674,
			  674,  116,  116,  695,  116,  682,  116,  116,  267,  116,
			  890,  675,  116,  116,  267,  116,  267,  116,  116,  267,
			  116,  694,  682,  890,  118,  267,  682,  693,  677,  118,

			  267,  890,  890,  701,  700,  118,  890,  890,  695,  675,
			  118,  890,  116,  116,  678,  116,  116,  116,  695,  116,
			  682,  116,  116,  706,  116,  267,  677,  116,  116,  267,
			  116,  703,  702,  890,  267,  118,  695,  890,  709,  118,
			  267,  890,  678,  679,  118,  116,  116,  890,  116,  890,
			  118,  706,  116,  116,  680,  116,  116,  116,  267,  116,
			  890,  116,  116,  681,  116,  267,  709,  267,  118,  267,
			  890,  679,  890,  711,  267,  118,  712,  116,  116,  118,
			  116,  715,  680,  684,  118,  706,  716,  267,  683,  267,
			  267,  681,  686,  717,  890,  116,  116,  890,  116,  685,

			  118,  711,  116,  116,  712,  116,  890,  687,  267,  715,
			  890,  684,  890,  708,  716,  267,  683,  705,  118,  709,
			  686,  717,  267,  267,  288,  118,  288,  685,  615,  615,
			  615,  615,  615,  116,  116,  687,  116,  116,  116,  890,
			  116,  711,  117,  725,  689,  707,  267,  710,  267,  890,
			  267,  715,  890,  890,  890,  267,  118,  890,  890,  890,
			  118,  890,  690,  748,  890,  712,  403,  691,  749,  713,
			  117,  725,  689,  660,  660,  660,  660,  660,  749,  718,
			  660,  660,  660,  660,  660,  719,  719,  719,  719,  719,
			  690,  748,  720,  714,  720,  691,  749,  721,  721,  721,

			  721,  721,  722,  890,  722,  890,  750,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  724,  724,  724,
			  724,  724,  667,  667,  667,  667,  667,  726,  726,  726,
			  726,  726,  667,  667,  667,  667,  667,  728,  728,  728,
			  728,  728,  729,  729,  729,  729,  729,  890,  751,  753,
			  590,  730,  730,  730,  730,  730,  731,  890,  731,  755,
			  890,  732,  732,  732,  732,  732,  725,  116,  116,  890,
			  116,  737,  116,  116,  890,  116,  751,  753,  116,  116,
			  267,  116,  890,  116,  116,  267,  116,  755,  737,  403,
			  118,  267,  737,  890,  725,  118,  267,  116,  116,  890,

			  116,  118,  116,  116,  890,  116,  118,  739,  735,  734,
			  267,  890,  736,  890,  267,  267,  737,  890,  116,  116,
			  118,  116,  267,  890,  739,  118,  116,  116,  739,  116,
			  751,  267,  116,  116,  890,  116,  735,  734,  890,  267,
			  736,  118,  890,  116,  116,  267,  116,  753,  756,  118,
			  116,  116,  739,  116,  890,  118,  267,  757,  752,  116,
			  116,  267,  116,  267,  116,  116,  118,  116,  890,  782,
			  738,  890,  267,  118,  890,  754,  756,  267,  890,  755,
			  783,  740,  118,  116,  116,  757,  116,  118,  721,  721,
			  721,  721,  721,  741,  785,  742,  267,  782,  738,  759,

			  759,  759,  759,  759,  890,  890,  118,  758,  783,  740,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  890,  741,  785,  742,  760,  760,  760,  760,  760,  765,
			  766,  765,  766,  761,  890,  761,  787,  500,  762,  762,
			  762,  762,  762,  764,  764,  764,  764,  764,  666,  666,
			  666,  666,  666,  732,  732,  732,  732,  732,  768,  768,
			  768,  768,  768,  725,  787,  116,  116,  767,  116,  116,
			  116,  890,  116,  890,  116,  116,  890,  116,  267,  789,
			  116,  116,  267,  116,  890,  774,  403,  267,  118,  890,
			  267,  725,  118,  267,  770,  267,  508,  118,  116,  116,

			  267,  116,  774,  118,  771,  772,  774,  789,  785,  773,
			  777,  267,  116,  116,  777,  116,  787,  783,  790,  778,
			  777,  118,  770,  778,  779,  267,  116,  116,  775,  116,
			  774,  777,  771,  772,  778,  118,  786,  773,  780,  267,
			  778,  779,  777,  776,  788,  784,  790,  267,  890,  118,
			  890,  778,  779,  890,  890,  780,  775,  719,  719,  719,
			  719,  719,  890,  890,  789,  806,  780,  859,  859,  859,
			  859,  776,  762,  762,  762,  762,  762,  792,  792,  792,
			  792,  792,  793,  793,  793,  793,  793,  598,  598,  598,
			  598,  598,  791,  806,  807,  500,  794,  794,  794,  794,

			  794,  795,  795,  795,  795,  795,  726,  726,  726,  726,
			  726,  116,  116,  809,  116,  590,  116,  116,  890,  116,
			  116,  116,  807,  116,  267,  116,  116,  267,  116,  267,
			  890,  801,  802,  267,  118,  801,  802,  267,  267,  118,
			  811,  809,  822,  118,  508,  797,  116,  116,  118,  116,
			  801,  799,  801,  802,  803,  809,  825,  802,  807,  267,
			  798,  804,  890,  801,  802,  890,  267,  890,  811,  118,
			  822,  803,  890,  797,  781,  781,  837,  781,  804,  799,
			  890,  890,  803,  810,  825,  890,  808,  838,  798,  804,
			  800,  760,  760,  760,  760,  760,  825,  805,  813,  813,

			  813,  813,  813,  765,  837,  765,  890,  890,  795,  795,
			  795,  795,  795,  116,  116,  838,  116,  890,  800,  116,
			  116,  848,  116,  890,  826,  890,  267,  116,  116,  590,
			  116,  857,  267,  890,  116,  116,  118,  116,  863,  890,
			  267,  767,  118,  890,  815,  116,  116,  267,  116,  848,
			  118,  829,  829,  829,  829,  829,  890,  118,  267,  857,
			  116,  116,  890,  116,  890,  890,  863,  816,  118,  890,
			  817,  890,  815,  267,  116,  116,  890,  116,  116,  116,
			  890,  116,  818,  118,  834,  835,  844,  267,  890,  832,
			  769,  267,  834,  835,  844,  890,  816,  118,  817,  890,

			  890,  118,  835,  890,  890,  834,  835,  844,  890,  890,
			  836,  818,  839,  839,  839,  839,  839,  832,  833,  890,
			  834,  835,  844,  836,  767,  767,  767,  767,  767,  116,
			  116,  769,  116,  845,  116,  116,  890,  116,  836,  890,
			  890,  845,  267,  845,  890,  890,  833,  267,  849,  890,
			  849,  846,  118,  890,  845,  890,  890,  118,  850,  853,
			  853,  853,  853,  853,  846,  843,  890,  116,  116,  845,
			  116,  116,  116,  890,  116,  890,  890,  842,  890,  846,
			  267,  890,  890,  890,  267,  890,  851,  890,  890,  890,
			  118,  890,  890,  843,  118,  858,  858,  858,  858,  858, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  853,  853,  853,  853,  853,  861,  842,  854,  116,  116,
			  890,  116,  862,  890,  116,  116,  861,  116,  890,  866,
			  890,  267,  869,  862,  869,  890,  861,  267,  890,  890,
			  866,  118,  870,  862,  890,  854,  890,  118,  890,  860,
			  866,  890,  890,  890,  861,  864,  864,  864,  864,  864,
			  867,  862,  865,  865,  865,  865,  865,  890,  866,  890,
			  871,  867,  868,  868,  868,  868,  868,  860,  890,  876,
			  877,  867,  851,  851,  851,  851,  851,  874,  874,  874,
			  874,  874,  875,  875,  875,  875,  876,  877,  880,  867,
			  876,  877,  878,  878,  878,  878,  878,  879,  879,  879,

			  879,  879,  881,  890,  890,  880,  890,  890,  890,  880,
			  883,  884,  883,  884,  876,  877,  890,  890,  890,  881,
			  890,  890,  890,  881,  882,  882,  882,  882,  882,  890,
			  890,  890,  890,  880,  871,  871,  871,  871,  871,  886,
			  886,  886,  886,  886,  890,  890,  890,  881,  885,  887,
			  887,  887,  887,  887,  888,  888,  888,  888,  888,  883,
			  890,  883,  890,  890,  887,  887,  887,  887,  887,  889,
			  889,  889,  889,  889,  885,  885,  885,  885,  885,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  885,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   98,   98,  890,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  890,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,  100,  100,  890,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  117,  117,  117,  890,  890,  890,  890,  890,  890,
			  890,  117,  117,  117,  117,  890,  117,  117,  117,  117,

			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  890,
			  890,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  149,  149,  890,  149,  149,  890,  149,  149,  149,  890,
			  890,  149,  149,  149,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  149,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  149,  890,  890,  149,  149,  149,  149,
			  149,  149,  149,  149,  149,  151,  151,  890,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  208,  208,  890,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  890,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  890,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  225,  890,  225,  890,  890,  890,  890,
			  225,  225,  890,  225,  225,  225,  890,  890,  225,  225,

			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  890,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  239,  239,  890,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  103,  890,
			  890,  890,  890,  103,  103,  103,  890,  890,  103,  103, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  890,  890,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  890,  260,  260,  260,  260,  260,  260,

			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  268,  890,  890,  890,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  890,  890,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  238,
			  238,  238,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  238,  238,  238,  238,  238,  238,  238,

			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  238,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  890,  890,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  372,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,

			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  372,  372,  514,  514,  514,  890,  890,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  514,  890,  890,  514,  514,  514,  514,  514,
			  514,  514,  514,  514,  545,  890,  545,  890,  890,  890,
			  890,  545,  545,  890,  545,  545,  545,  890,  890,  545,
			  545,  545,  545,  545,  545,  545,  545,  545,  545,  545,
			  545,  545,  545,  545,  545,  545,  545,  545,  545,  545,
			  545,  545,  890,  890,  545,  545,  545,  545,  545,  545,

			  545,  545,  545,  449,  449,  449,  890,  890,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  890,  890,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  890,  890,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  624,  890,  624,  890,  890,  890,  890,
			  624,  624,  890,  624,  624,  624,  890,  890,  624,  624,
			  624,  624,  624,  624,  624,  624,  624,  624,  624,  624,
			  624,  624,  624,  624,  624,  624,  624,  624,  624,  624,
			  624,  890,  624,  624,  624,  624,  624,  624,  624,  624,

			  624,  624,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  890,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  676,  676,  676,  676,  676,  676,
			  676,  676,  676,  676,  676,  676,  676,  676,  676,  676,
			  676,  676,  676,  676,  676,  676,  676,  890,  890,  676,
			  676,  676,  676,  676,  676,  676,  676,  676,  733,  733,
			  733,  890,  890,  733,  733,  733,  733,  733,  733,  733,

			  733,  733,  733,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  733,  733,  733,  733,  890,  890,  733,  733,
			  733,  733,  733,  733,  733,  733,  733,  747,  747,  747,
			  747,  747,  747,  747,  747,  747,  747,  747,  747,  747,
			  747,  747,  747,  747,  747,  747,  747,  747,  747,  747,
			  747,  890,  890,  890,  890,  747,  747,  747,  890,  890,
			  747,  747,  747,  747,  747,  747,  747,  747,  747,  747,
			  747,  747,  747,  747,  747,  747,  747,  747,  747,  747,
			  747,  747,  747,  890,  890,  747,  747,  747,  747,  747,
			  747,  747,  747,  747,  796,  796,  796,  796,  796,  796,

			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  890,  890,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  814,  814,
			  814,  890,  890,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  890,  890,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  890,  890,  840,  840,  840,  840,  840,  840,  840,  840,

			  840,  852,  852,  852,  890,  890,  852,  852,  852,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,  852,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,  852,  890,
			  890,  852,  852,  852,  852,  852,  852,  852,  852,  852,
			   11,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890, yy_Dummy>>,
			1, 932, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5931)
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
			    1,    1,    3,    5,    6,    9,    3,    4,   10,   18,

			   13,    4,   13,   13,   24,   25,   76,   25,   25,   25,
			   25,   25,   27,   61,   27,   92,   27,   27,   27,   27,
			   27,   38,   38,   63,   38,  867,  186,   64,   68,    5,
			    6,   24,   28,   60,   28,   59,   28,   28,   28,   28,
			   28,   61,    3,   18,   38,   60,   59,    4,  866,  180,
			    9,   63,   76,   10,   27,   64,   68,  180,    5,    6,
			  845,   60,   74,   59,   74,   74,   95,  186,   95,   95,
			   92,  812,  812,   60,   28,   59,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,   35,   35,   69,
			   35,   36,   36,   66,   36,  844,   87,   37,   37,   87,
			   37,   66,   78,   40,   40,  205,   40,  831,   39,   39,

			   35,   39,   41,   41,   36,   41,  365,  157,   69,   35,
			   37,   66,   36,   35,   37,   35,   40,  826,  158,   66,
			   40,   39,  824,   37,  205,   41,  210,  150,  210,  210,
			   42,   42,   40,   42,   39,  157,   41,   35,   87,  804,
			   36,   35,   37,   35,  229,   39,  158,  229,   40,   43,
			   43,   37,   43,   42,   44,   44,   80,   44,   45,   45,
			   40,   45,   39,  150,   41,   77,  793,   42,   42,   62,
			   62,   78,   43,   42,   39,   62,   43,   44,  150,   50,
			   50,   45,   50,   49,   49,  365,   49,   45,  159,  814,
			  814,   47,   47,   44,   47,   42,   42,   62,   62,  791,

			   45,   42,   50,   62,   43,  624,   49,   79,   67,  165,
			   65,  852,  852,   67,   47,   45,  159,   48,   48,  232,
			   48,   44,   49,   65,   81,   47,   82,   50,   45,   46,
			   46,   84,   46,   47,   80,   80,   67,  165,   65,  162,
			   48,   67,   77,   77,   77,   46,   46,   46,   46,   46,
			   49,   65,   46,   47,  206,   48,   50,  624,  786,   46,
			   48,   47,   82,  760,   56,   56,   46,   84,  747,   56,
			  162,   56,  167,   46,  232,   46,  733,   46,  109,  109,
			  109,  109,  109,   48,   79,   79,   79,   46,   48,  206,
			   56,   82,   56,   56,   46,  726,   84,   56,  162,   56,

			  167,   81,   81,   81,   46,   56,   46,   55,   89,  153,
			   55,   89,  153,  231,  164,   55,  231,  153,  206,  719,
			   89,   89,  218,   55,   55,   55,   55,   55,   55,  168,
			   89,  164,  714,  710,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  168,  218,  164,
			   89,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   57,   90,  218,  166,   90,
			   57,  170,  708,  163,   57,  335,   57,  707,   90,  107,

			  107,  107,  107,  107,  223,  359,  702,  166,   90,  116,
			  116,  695,  116,   57,  107,   57,  163,  170,   57,  694,
			  117,  117,   57,  117,   57,  112,  112,  112,  112,  112,
			   57,   58,  116,  117,   58,  166,  335,  107,   90,   58,
			  223,  693,  107,  117,  163,  170,  359,   58,   58,   58,
			   58,   58,   58,  171,  169,  692,  175,  669,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  171,  513,  169,  175,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,

			   58,   58,   58,   58,   58,   58,   58,   58,   58,   93,
			   93,  169,   93,  375,  375,  102,  375,  110,  110,  110,
			  110,  110,  513,  657,  102,  102,  102,  102,  102,  367,
			  551,  801,  110,  362,   93,  451,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,  102,
			  110,  111,  362,  111,  451,  111,  111,  111,  111,  111,
			  111,  551,  801,  446,  102,  173,  446,  113,  102,  113,
			  102,  113,  113,  113,  113,  113,  176,  177,  178,   93,
			  105,  105,  105,  105,  105,  161,  161,  641,  161,  161,

			  161,  161,  161,  111,  105,  173,  181,  367,  367,  182,
			  177,  105,  119,  119,  176,  119,  184,  178,  105,  113,
			  105,  635,  105,  120,  120,  119,  120,  121,  121,  188,
			  121,  631,  105,  173,  181,  119,  120,  182,  177,  105,
			  121,  122,  122,  184,  122,  178,  120,  185,  187,  105,
			  121,  105,  123,  123,  122,  123,  119,  121,  189,  120,
			  188,  616,  564,  185,  122,  123,  124,  124,  807,  124,
			  550,  184,  363,  122,  191,  123,  187,  125,  125,  124,
			  125,  192,  195,  196,  119,  121,  189,  120,  188,  124,
			  125,  185,  549,  172,  123,  126,  126,  807,  126,  172,

			  125,  122,  191,  127,  127,  124,  127,  363,  126,  192,
			  195,  196,  128,  128,  543,  128,  127,  543,  126,  524,
			  125,  172,  123,  514,  126,  128,  127,  172,  129,  129,
			  126,  129,  811,  124,  509,  128,  363,  130,  130,  127,
			  130,  129,  131,  131,  502,  131,  174,  190,  125,  129,
			  130,  129,  126,  194,  128,  131,  132,  132,  126,  132,
			  130,  811,  174,  133,  133,  131,  133,  127,  174,  132,
			  194,  131,  134,  134,  490,  134,  133,  130,  190,  132,
			  135,  135,  128,  135,  200,  134,  133,  846,  136,  136,
			  174,  136,  193,  135,  846,  134,  174,  197,  194,  131, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  489,  136,  198,  135,  837,  130,  190,  133,  193,  135,
			  132,  136,  200,  202,  803,  197,  134,  203,  136,  138,
			  138,  483,  138,  204,  482,  803,  224,  139,  139,  224,
			  139,  202,  138,  837,  198,  133,  193,  135,  141,  141,
			  139,  141,  138,  197,  134,  203,  136,  137,  137,  137,
			  139,  141,  204,  147,  147,  803,  147,  139,  312,  202,
			  463,  141,  198,  138,  313,  137,  147,  410,  141,  137,
			  387,  139,  137,  139,  214,  320,  147,  377,  224,  137,
			  204,  137,  141,  137,  142,  139,  312,  142,  142,  142,
			  142,  142,  313,  137,  372,  147,  141,  137,  144,  144,

			  137,  144,  139,  320,  143,  143,  248,  143,  248,  248,
			  137,  144,  137,  140,  140,  142,  140,  143,  215,  142,
			  318,  144,  317,  147,  216,  361,  140,  143,  356,  140,
			  140,  140,  140,  140,  808,  143,  140,  217,  143,  213,
			  317,  145,  145,  144,  145,  199,  318,  140,  142,  199,
			  140,  214,  214,  214,  145,  345,  140,  201,  333,  146,
			  146,  319,  146,  143,  145,  322,  143,  311,  317,  808,
			  220,  144,  146,  199,  318,  140,  145,  199,  140,  201,
			  145,  307,  146,  201,  140,  323,  148,  148,  225,  148,
			  146,  225,  268,  322,  250,  215,  215,  215,  808,  148,

			  225,  216,  216,  216,  145,  246,  220,  201,  145,  148,
			  225,  201,  245,  323,  217,  217,  217,  251,  146,  213,
			  213,  213,  213,  213,  228,  237,  237,  228,  237,  253,
			  326,  251,  327,  251,  148,  220,  228,  328,  247,  247,
			  225,  247,  244,  253,  544,  251,  228,  544,  243,  241,
			  237,  242,  242,  242,  242,  242,  242,  253,  326,  254,
			  327,  247,  251,  148,  155,  328,  254,  258,  258,  258,
			  258,  258,  155,  254,  236,  254,  228,  257,  227,  257,
			  221,  208,  257,  257,  257,  257,  257,  254,  259,  259,
			  259,  259,  259,  262,  254,  262,  544,  183,  262,  262,

			  262,  262,  262,  179,  254,  160,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,

			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  233,  233,  156,  233,  264,  264,  264,  264,  263,  154,
			  263,  151,  263,  263,  263,  263,  263,  265,  265,  265,
			  265,  265,  727,  727,  727,  233,  325,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  263,  249,  249,  249,  249,  249,  325,  149,  252,  252,
			  252,  252,  252,  106,  332,  249,  288,  288,  288,  288,
			  288,  104,  249,  321,  324,  103,  252,  100,  337,  252,

			  233,  249,   98,  249,  325,  252,  256,  256,  256,  256,
			  256,  324,  332,  249,  261,  261,  261,  261,  261,  321,
			  249,  256,  269,  269,  252,  269,  337,  252,   96,  261,
			  249,  338,  249,  252,   88,  269,  329,  270,  270,  324,
			  270,   85,   73,   70,  256,  269,   54,  321,  547,  256,
			  270,  547,  261,  269,  329,  271,  271,  261,  271,  338,
			  270,  272,  272,   51,  272,   33,  273,  273,  271,  273,
			  274,  274,  547,  274,  272,   31,  270,   26,  271,  273,
			  280,  269,  329,  274,  272,  275,  275,   16,  275,  273,
			  339,  280,   15,  274,  276,  276,  273,  276,  275,   14,

			  272,  280,  277,  277,  270,  277,   11,  276,  275,  278,
			  278,    0,  278,  274,  342,  277,  275,  276,  339,  280,
			  279,  279,  278,  279,  273,  277,  281,  281,  272,  281,
			  276,  346,  278,  279,  282,  282,    0,  282,  330,  281,
			    0,  274,  342,  279,  275,  277,    0,  282,    0,  281,
			    0,  347,  278,  283,  283,    0,  283,  282,  276,  346,
			  348,  330,  281,  340,  284,  284,  283,  284,  285,  285,
			  282,  285,  627,  277,  279,  627,  283,  284,  341,  347,
			  278,  285,  286,  286,    0,  286,  340,  284,  283,  330,
			  281,  285,  348,  284,    0,  286,  627,  350,  282,  287,

			  287,  341,  287,  331,    0,  286,  294,  294,  294,  294,
			  294,    0,  287,    0,  340,    0,  283,  351,    0,  343,
			  348,  284,  287,  289,  289,  350,  289,  286,    0,  341,
			  287,  290,  290,  331,  290,  343,  289,    0,    0,  289,
			  289,  289,  289,  289,  290,  351,  289,  290,  290,  290,
			  290,  290,  354,  349,  290,  286,  291,  291,  287,  291,
			    0,  331,    0,  343,    0,  292,  292,  289,  292,  291,
			    0,  349,  291,  291,  291,  291,  291,    0,  292,  291,
			  354,  292,  292,  292,  292,  292,  334,  315,  292,  315,
			  315,  315,  315,  315,  293,  293,  295,  293,  295,  349,

			  291,  296,  296,  296,  296,  296,  355,  293,  352,  292,
			  293,  293,  293,  293,  293,  394,  334,  293,  295,  296,
			  450,  295,  297,  297,    0,  297,    0,  295,  298,  298,
			    0,  298,  353,  352,  355,  297,  454,    0,  293,  299,
			  299,  298,  299,  394,  334,  297,  295,  296,  450,  295,
			  353,  298,  299,  300,  300,  295,  300,  301,  301,  357,
			  301,  352,  299,    0,  454,  297,  300,    0,  302,  302,
			  301,  302,  303,  303,  300,  303,  300,  299,  353,  358,
			  301,  302,  364,  305,  305,  303,  305,  357,  301,  304,
			  304,  302,  304,  297,    0,  303,  305,  306,  306,  366,

			  306,    0,  304,  368,    0,  299,  305,  369,  358,  302,
			  306,    0,  304,    0,  303,  357,  301,  370,    0,  308,
			  306,  308,  308,  308,  308,  308,  308,  309,    0,  309,
			  309,  309,  309,  309,  309,    0,  358,  302,  376,  376,
			  336,  376,  303,  304,  316,  306,  316,  316,  316,  316,
			  316,  336,    0,  373,  373,  456,  373,    0,    0,  364,
			  364,  364,  336,  378,  378,  373,  378,  397,  397,  397,
			  397,  397,  336,    0,  306,  373,  366,  366,  366,    0,
			  368,  368,  368,  456,  369,  369,  369,    0,  378,    0,
			  336,    0,  453,    0,  370,  370,  370,  381,  381,  381, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  381,  381,  381,  457,  461,  373,  388,  388,  388,  388,
			  388,  389,  389,  389,  389,  389,  390,  390,  390,  390,
			  390,  391,  393,  459,  391,  453,    0,    0,  393,    0,
			  391,  457,  461,    0,  388,  597,  597,  597,  597,  389,
			  545,  459,  462,  545,  390,  628,  464,  452,  628,  391,
			  393,    0,  391,  628,  453,  392,  393,  392,  391,  392,
			  392,  392,  392,  392,  396,  396,  396,  396,  396,  459,
			  462,  398,  398,  398,  398,  398,  452,  392,  464,  396,
			  392,  399,  399,  399,  399,  399,  392,  400,  400,  400,
			  400,  400,  545,    0,    0,  401,  401,  401,  401,  401,

			    0,    0,  396,  466,  452,  392,  464,  396,  392,  398,
			  401,  402,    0,  402,  392,    0,  402,  402,  402,  402,
			  402,  403,  403,  403,  403,  403,  404,  404,  404,  404,
			  404,  466,    0,  401,    0,  455,    0,    0,  401,  405,
			  405,  405,  405,  405,  406,  406,    0,  406,  406,  406,
			  406,  406,  407,  407,  407,  407,  407,  408,  408,  408,
			  408,  408,  411,  411,  455,  411,  412,  412,    0,  412,
			  465,  467,    0,  413,  413,  411,  413,  405,    0,  412,
			  415,  415,    0,  415,    0,  411,  413,  414,  414,  412,
			  414,  469,  455,  415,  416,  416,  413,  416,    0,  467,

			  414,  465,    0,  415,  411,  418,  418,  416,  418,  421,
			  414,  415,  412,  417,  417,  413,  417,  416,  418,  469,
			  421,    0,  414,  458,  419,  419,  417,  419,  418,  465,
			  421,    0,  411,  470,    0,    0,  417,  419,  471,  415,
			    0,  412,  468,  413,  474,  458,    0,  419,  421,  418,
			  414,  420,  420,    0,  420,  419,  422,  422,  417,  422,
			  468,  470,  423,  423,  420,  423,  471,  424,  424,  422,
			  424,  472,  474,  458,  420,  423,    0,  418,  420,  422,
			  424,  425,  425,  419,  425,  423,  417,    0,  468,  475,
			  424,  422,    0,  472,  425,  426,  426,    0,  426,  427,

			  427,    0,  427,    0,  425,  424,  420,  423,  426,    0,
			  475,  430,  427,    0,  430,  425,  476,  477,  426,  422,
			  430,  472,  427,  428,  428,  428,  428,  428,  435,  435,
			  435,  435,  435,  424,  473,  423,    0,  426,  475,  430,
			  484,  427,  430,  425,  476,  477,  478,  487,  430,  429,
			  428,  429,  440,  429,  429,  429,  429,  429,  431,  431,
			  431,  431,  431,  440,  479,  426,  473,    0,  484,  427,
			    0,  429,    0,  440,  429,  478,  431,  485,  428,  487,
			  429,  432,  432,  432,  432,  432,  434,  434,  434,  434,
			  434,  440,    0,  479,  473,  432,  552,  433,  433,  429,

			  433,    0,  429,  478,  431,  485,    0,  487,  429,  488,
			  433,  432,    0,  433,  433,  433,  433,  433,  434,    0,
			  433,  479,    0,  432,  552,  554,  488,  433,  436,  436,
			  436,  436,  436,  553,  437,  437,  437,  437,  437,    0,
			  432,    0,  436,  438,  438,  555,  438,  434,  437,  439,
			  439,  553,  439,  554,  488,  433,  438,    0,  441,  441,
			    0,  441,  439,    0,  442,  442,  438,  442,    0,  486,
			  436,  441,  439,  555,    0,  558,  437,  442,    0,  553,
			  486,  441,  443,  443,    0,  443,  563,  442,  444,  444,
			  557,  444,    0,  445,  445,  443,  445,  486,    0,    0,

			  512,  444,  512,  558,    0,  443,  445,  557,  486,  442,
			  512,  444,  443,  565,  563,  444,  445,  447,    0,  447,
			  447,  447,  447,  447,  447,  448,  444,  448,  448,  448,
			  448,  448,  448,  566,  570,  557,    0,  442,  512,    0,
			  443,  565,    0,  444,  491,  491,  491,  491,  491,  495,
			  495,  495,  495,  495,  444,  447,  492,  492,  492,  492,
			  492,  566,  570,  448,  493,  493,  493,  493,  493,    0,
			  492,  494,  494,  494,  494,  494,    0,    0,  493,  496,
			  496,  496,  496,  496,    0,  494,  492,  499,  499,  499,
			  499,  499,  494,  498,  498,  498,  498,  498,  492,  515,

			  515,  494,  515,    0,  522,  522,  493,  522,  498,    0,
			    0,    0,  515,  494,    0,  492,    0,  522,    0,    0,
			  494,    0,  515,    0,    0,  499,    0,  522,    0,    0,
			  494,  500,  500,  500,  500,  500,  498,  501,  501,  501,
			  501,  501,  503,  503,  503,  503,  503,  504,  504,  504,
			  504,  504,  505,  505,  505,  505,  505,  503,  506,  506,
			  506,  506,  506,  507,  507,  507,  507,  507,  508,  508,
			  508,  508,  508,  510,  510,  510,  510,  510,    0,    0,
			  503,  568,  556,  516,  516,  503,  516,    0,  510,  511,
			  505,  511,  511,  511,  511,  511,  516,  517,  517,  568,

			  517,  507,  518,  518,    0,  518,  516,  556,  519,  519,
			  517,  519,    0,    0,    0,  518,  510,    0,    0,    0,
			  517,  519,    0,  520,  520,  518,  520,  568,  517,  521,
			  521,  519,  521,  560,    0,  556,  520,  516,  519,    0,
			  518,  571,  521,  537,  523,  523,  520,  523,  525,  525,
			  560,  525,  521,  520,  537,  572,  517,  523,    0,  571,
			  521,  525,  526,  526,  537,  526,  519,  523,  518,  573,
			  576,  525,  521,  527,  527,  526,  527,    0,  560,  525,
			  523,  520,  537,  572,  542,  526,  527,  571,  521,    0,
			  528,  528,  526,  528,    0,  542,  527,  573,  576,  559,

			  521,  529,  529,  528,  529,  542,    0,  525,  523,  530,
			  530,  559,  530,  528,  529,  532,  532,  532,  532,  532,
			  526,  528,  530,  542,  529,  533,  533,  559,  533,  532,
			  569,    0,  530,  534,  534,  534,  534,  534,  533,  559,
			  530,  574,    0,  529,    0,    0,    0,  569,  533,  528,
			    0,  536,  536,  536,  536,  536,    0,  532,    0,  535,
			  534,  535,  561,  535,  535,  535,  535,  535,  530,  533,
			  574,  529,  536,  538,  538,  569,  538,  535,  539,  539,
			  561,  539,    0,    0,  535,  575,  538,  577,  534,    0,
			  535,  539,  561,  578,  540,  540,  538,  540,  574,  579,

			  536,  539,  587,  575,  538,  535,  580,  540,  561,  539,
			  541,  541,  535,  541,    0,  577,  581,  540,  535,  629,
			  561,  578,    0,  541,  580,  587,  632,  579,    0,    0,
			  587,  575,  538,  541,  581,    0,  540,  539,  582,  621,
			  582,    0,  582,  582,  582,  582,  582,  629,  636,  541,
			  621,  583,  580,  583,  632,  583,  583,  583,  583,  583,
			  621,  634,  581,  582,  540,  584,    0,  584,    0,  582,
			  584,  584,  584,  584,  584,  634,  636,  541,  621,    0,
			    0,  637,  583,  585,  585,  585,  585,  585,    0,    0,
			    0,  582,  586,  586,  586,  586,  586,  582,  588,  588, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  588,  588,  588,  634,  589,  589,  589,  589,  589,  637,
			  583,  642,  643,  588,  590,  590,  590,  590,  590,    0,
			    0,  585,  591,  591,  591,  591,  591,  592,  592,  592,
			  592,  592,  593,  593,  593,  593,  593,    0,    0,  642,
			  643,  588,  589,  594,  594,  594,  594,  594,  595,    0,
			  595,    0,  622,  595,  595,  595,  595,  595,  596,  596,
			  596,  596,  596,  622,    0,  592,  599,  599,  599,  599,
			  599,  601,  601,  622,  601,  609,  602,  602,  640,  602,
			    0,  599,  604,  604,  601,  604,  639,  603,  603,  602,
			  603,  622,  609,    0,  601,  604,  609,  623,  601,  602,

			  603,    0,    0,  640,  639,  604,    0,    0,  623,  599,
			  603,    0,  605,  605,  603,  605,  606,  606,  623,  606,
			  609,  607,  607,  644,  607,  605,  601,  608,  608,  606,
			  608,  640,  639,    0,  607,  605,  623,    0,  647,  606,
			  608,    0,  603,  605,  607,  610,  610,    0,  610,    0,
			  608,  644,  611,  611,  606,  611,  612,  612,  610,  612,
			    0,  613,  613,  608,  613,  611,  647,  646,  610,  612,
			    0,  605,    0,  649,  613,  611,  650,  614,  614,  612,
			  614,  654,  606,  611,  613,  646,  655,  645,  610,  648,
			  614,  608,  613,  656,    0,  617,  617,    0,  617,  612,

			  614,  649,  618,  618,  650,  618,    0,  614,  617,  654,
			    0,  611,    0,  646,  655,  618,  610,  645,  617,  648,
			  613,  656,  658,  651,  615,  618,  615,  612,  615,  615,
			  615,  615,  615,  619,  619,  614,  619,  620,  620,    0,
			  620,  651,  615,  666,  618,  645,  619,  648,  652,    0,
			  620,  658,    0,    0,    0,  699,  619,    0,    0,    0,
			  620,    0,  619,  697,    0,  652,  666,  620,  698,  651,
			  615,  666,  618,  659,  659,  659,  659,  659,  699,  658,
			  660,  660,  660,  660,  660,  661,  661,  661,  661,  661,
			  619,  697,  662,  652,  662,  620,  698,  662,  662,  662,

			  662,  662,  663,    0,  663,    0,  699,  663,  663,  663,
			  663,  663,  664,  664,  664,  664,  664,  665,  665,  665,
			  665,  665,  667,  667,  667,  667,  667,  668,  668,  668,
			  668,  668,  670,  670,  670,  670,  670,  671,  671,  671,
			  671,  671,  672,  672,  672,  672,  672,    0,  701,  711,
			  664,  674,  674,  674,  674,  674,  675,    0,  675,  715,
			    0,  675,  675,  675,  675,  675,  674,  677,  677,    0,
			  677,  682,  678,  678,    0,  678,  701,  711,  679,  679,
			  677,  679,    0,  680,  680,  678,  680,  715,  682,  674,
			  677,  679,  682,    0,  674,  678,  680,  681,  681,    0,

			  681,  679,  683,  683,    0,  683,  680,  688,  678,  677,
			  681,    0,  680,    0,  703,  683,  682,    0,  684,  684,
			  681,  684,  713,    0,  688,  683,  685,  685,  688,  685,
			  703,  684,  686,  686,    0,  686,  678,  677,    0,  685,
			  680,  684,    0,  687,  687,  686,  687,  713,  716,  685,
			  689,  689,  688,  689,    0,  686,  687,  717,  703,  690,
			  690,  718,  690,  689,  691,  691,  687,  691,    0,  748,
			  686,    0,  690,  689,    0,  713,  716,  691,    0,  718,
			  749,  689,  690,  742,  742,  717,  742,  691,  720,  720,
			  720,  720,  720,  690,  751,  691,  742,  748,  686,  721,

			  721,  721,  721,  721,    0,    0,  742,  718,  749,  689,
			  722,  722,  722,  722,  722,  723,  723,  723,  723,  723,
			    0,  690,  751,  691,  724,  724,  724,  724,  724,  729,
			  729,  729,  729,  725,    0,  725,  753,  721,  725,  725,
			  725,  725,  725,  728,  728,  728,  728,  728,  730,  730,
			  730,  730,  730,  731,  731,  731,  731,  731,  732,  732,
			  732,  732,  732,  730,  753,  734,  734,  729,  734,  735,
			  735,    0,  735,    0,  736,  736,    0,  736,  734,  755,
			  738,  738,  735,  738,    0,  739,  730,  736,  734,    0,
			  752,  730,  735,  738,  734,  750,  732,  736,  740,  740,

			  754,  740,  739,  738,  735,  736,  739,  755,  752,  738,
			  743,  740,  741,  741,  743,  741,  754,  750,  756,  744,
			  745,  740,  734,  744,  745,  741,  772,  772,  740,  772,
			  739,  743,  735,  736,  746,  741,  752,  738,  746,  772,
			  744,  745,  743,  741,  754,  750,  756,  758,    0,  772,
			    0,  744,  745,    0,    0,  746,  740,  759,  759,  759,
			  759,  759,    0,    0,  758,  782,  746,  850,  850,  850,
			  850,  741,  761,  761,  761,  761,  761,  762,  762,  762,
			  762,  762,  763,  763,  763,  763,  763,  764,  764,  764,
			  764,  764,  758,  782,  783,  759,  765,  765,  765,  765,

			  765,  766,  766,  766,  766,  766,  768,  768,  768,  768,
			  768,  770,  770,  787,  770,  762,  771,  771,    0,  771,
			  773,  773,  783,  773,  770,  775,  775,  784,  775,  771,
			    0,  777,  778,  773,  770,  777,  778,  788,  775,  771,
			  790,  787,  806,  773,  768,  770,  776,  776,  775,  776,
			  779,  773,  777,  778,  779,  788,  809,  780,  784,  776,
			  771,  780,    0,  777,  778,    0,  810,    0,  790,  776,
			  806,  779,    0,  770,  781,  781,  822,  781,  780,  773,
			    0,    0,  779,  788,  809,    0,  784,  827,  771,  780,
			  776,  792,  792,  792,  792,  792,  810,  781,  794,  794,

			  794,  794,  794,  795,  822,  795,    0,    0,  795,  795,
			  795,  795,  795,  797,  797,  827,  797,    0,  776,  798,
			  798,  838,  798,    0,  810,    0,  797,  799,  799,  792,
			  799,  847,  798,    0,  800,  800,  797,  800,  857,    0,
			  799,  795,  798,    0,  797,  815,  815,  800,  815,  838,
			  799,  813,  813,  813,  813,  813,    0,  800,  815,  847,
			  816,  816,    0,  816,    0,    0,  857,  798,  815,    0,
			  799,    0,  797,  816,  817,  817,    0,  817,  818,  818,
			    0,  818,  800,  816,  819,  820,  834,  817,    0,  815,
			  821,  818,  819,  820,  834,    0,  798,  817,  799,    0,

			    0,  818,  821,    0,    0,  819,  820,  834,    0,    0,
			  821,  800,  828,  828,  828,  828,  828,  815,  818,    0,
			  819,  820,  834,  821,  829,  829,  829,  829,  829,  832,
			  832,  836,  832,  835,  833,  833,    0,  833,  821,    0,
			    0,  835,  832,  836,    0,    0,  818,  833,  839,    0,
			  839,  836,  832,    0,  835,    0,    0,  833,  839,  841,
			  841,  841,  841,  841,  836,  833,    0,  842,  842,  835,
			  842,  843,  843,    0,  843,    0,    0,  832,    0,  836,
			  842,    0,    0,    0,  843,    0,  839,    0,    0,    0,
			  842,    0,    0,  833,  843,  849,  849,  849,  849,  849, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  853,  853,  853,  853,  853,  855,  832,  842,  854,  854,
			    0,  854,  856,    0,  860,  860,  855,  860,    0,  861,
			    0,  854,  865,  856,  865,    0,  855,  860,    0,    0,
			  861,  854,  865,  856,    0,  842,    0,  860,    0,  854,
			  861,    0,    0,    0,  855,  858,  858,  858,  858,  858,
			  862,  856,  859,  859,  859,  859,  859,    0,  861,    0,
			  865,  862,  864,  864,  864,  864,  864,  854,    0,  872,
			  873,  862,  868,  868,  868,  868,  868,  869,  869,  869,
			  869,  869,  870,  870,  870,  870,  872,  873,  876,  862,
			  872,  873,  874,  874,  874,  874,  874,  875,  875,  875,

			  875,  875,  877,    0,    0,  876,    0,    0,    0,  876,
			  879,  879,  879,  879,  872,  873,    0,    0,    0,  877,
			    0,    0,    0,  877,  878,  878,  878,  878,  878,    0,
			    0,    0,    0,  876,  882,  882,  882,  882,  882,  883,
			  883,  883,  883,  883,    0,    0,    0,  877,  879,  884,
			  884,  884,  884,  884,  886,  886,  886,  886,  886,  887,
			    0,  887,    0,    0,  887,  887,  887,  887,  887,  888,
			  888,  888,  888,  888,  889,  889,  889,  889,  889,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  887,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,

			  892,  892,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  894,  894,    0,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,    0,  894,  894,  894,  894,  894,  894,

			  894,  894,  894,  894,  894,  894,  895,  895,    0,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  897,  897,  897,    0,    0,    0,    0,    0,    0,
			    0,  897,  897,  897,  897,    0,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,    0,
			    0,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  898,  898,    0,  898,  898,    0,  898,  898,  898,    0,
			    0,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,    0,    0,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  899,  899,    0,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  900,  900,    0,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,    0,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,

			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,    0,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  903,    0,  903,    0,    0,    0,    0,
			  903,  903,    0,  903,  903,  903,    0,    0,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,    0,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  906,  906,    0,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  907,    0,
			    0,    0,    0,  907,  907,  907,    0,    0,  907,  907, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,    0,    0,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,    0,  909,  909,  909,  909,  909,  909,

			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  910,    0,    0,    0,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,    0,    0,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  911,
			  911,  911,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  911,  911,  911,  911,  911,  911,  911,

			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  911,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,    0,    0,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,

			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  914,  914,  914,    0,    0,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,    0,    0,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  915,    0,  915,    0,    0,    0,
			    0,  915,  915,    0,  915,  915,  915,    0,    0,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,    0,    0,  915,  915,  915,  915,  915,  915,

			  915,  915,  915,  916,  916,  916,    0,    0,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,    0,    0,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,    0,    0,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  917,    0,  917,    0,    0,    0,    0,
			  917,  917,    0,  917,  917,  917,    0,    0,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,    0,  917,  917,  917,  917,  917,  917,  917,  917,

			  917,  917,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,    0,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,    0,    0,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  920,  920,
			  920,    0,    0,  920,  920,  920,  920,  920,  920,  920,

			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,    0,    0,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  922,    0,    0,    0,    0,  922,  922,  922,    0,    0,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,    0,    0,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  923,  923,  923,  923,  923,  923,

			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,    0,    0,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  924,  924,
			  924,    0,    0,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,    0,    0,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			    0,    0,  925,  925,  925,  925,  925,  925,  925,  925,

			  925,  926,  926,  926,    0,    0,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,    0,
			    0,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890, yy_Dummy>>,
			1, 932, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   77,  185,    0,   68,
			   71, 1606, 5840,   98, 1596, 1566, 1580, 5840,   90,    0,
			 5840, 5840, 5840, 5840,   89,   89, 1560,   98,  118, 5840,
			 5840, 1549, 5840, 1539, 5840,  275,  279,  285,  119,  296,
			  291,  300,  328,  347,  352,  356,  427,  389,  415,  381,
			  377, 1506, 5840, 5840, 1491,  505,  431,  556,  629,   97,
			  104,   77,  330,   94,   86,  379,  247,  368,   87,  229,
			 1526, 5840, 5840, 1535,  160, 5840,   99,  358,  285,  400,
			  349,  417,  409, 5840,  414, 1488, 5840,  284, 1531,  506,
			  584, 5840,   88,  707, 5840,  164, 1525, 5840, 1495, 5840,

			 1488,    0,  706, 1484, 1488,  772, 1467,  581, 5840,  460,
			  699,  747,  607,  763, 5840, 5840,  607,  618,    0,  810,
			  821,  825,  839,  850,  864,  875,  893,  901,  910,  926,
			  935,  940,  954,  961,  970,  978,  986, 1033, 1017, 1025,
			 1111, 1036, 1069, 1102, 1096, 1139, 1157, 1051, 1184, 1454,
			  304, 1376, 5840,  507, 1418, 1249, 1405,  261,  280,  356,
			 1290,  780,  424,  578,  499,  375,  573,  428,  488,  639,
			  576,  608,  862,  760,  931,  618,  742,  772,  773, 1280,
			  134,  764,  778, 1241,  801,  832,  111,  802,  814,  812,
			  932,  843,  849,  977,  938,  849,  836,  982,  987, 1108,

			  951, 1142,  998,  973, 1008,  245,  439, 5840, 1274, 5840,
			  324, 5840, 5840, 1132, 1067, 1111, 1117, 1130,  505, 5840,
			 1153, 1227, 5840,  587, 1024, 1186, 5840, 1275, 1222,  342,
			 1328,  511,  392, 1418, 5840, 5840, 1247, 1223, 5840, 5840,
			 5840, 1240, 1234, 1239, 1233, 1203, 1196, 1236, 1104, 1453,
			 1148, 1185, 1460, 1197, 1227, 5840, 1488, 1264, 1249, 1270,
			 5840, 1496, 1280, 1414, 1406, 1419, 5840,    0, 1165, 1520,
			 1535, 1553, 1559, 1564, 1568, 1583, 1592, 1600, 1607, 1618,
			 1552, 1624, 1632, 1651, 1662, 1666, 1680, 1697, 1468, 1721,
			 1729, 1754, 1763, 1792, 1688, 1782, 1783, 1820, 1826, 1837,

			 1851, 1855, 1866, 1870, 1887, 1881, 1895, 1158, 1903, 1911,
			 5840, 1150, 1025, 1023,    0, 1771, 1928, 1107, 1105, 1146,
			 1034, 1478, 1133, 1140, 1479, 1431, 1197, 1194, 1192, 1521,
			 1623, 1688, 1439, 1102, 1771,  580, 1923, 1460, 1493, 1553,
			 1648, 1663, 1583, 1704,    0, 1140, 1584, 1618, 1645, 1738,
			 1657, 1684, 1793, 1817, 1709, 1762, 1072, 1844, 1864,  590,
			    0, 1110,  683,  857, 1875,  299, 1892,  722, 1896, 1900,
			 1910, 5840, 1091, 1951, 5840,  711, 1936, 1074, 1961, 5840,
			 5840, 1980, 5840, 5840, 5840, 5840, 5840, 1024, 1988, 1993,
			 1998, 1985, 2041, 1983, 1770, 5840, 2046, 1949, 2053, 2063,

			 2069, 2077, 2098, 2103, 2108, 2121, 2129, 2134, 2139,    0,
			 1040, 2160, 2164, 2171, 2185, 2178, 2192, 2211, 2203, 2222,
			 2249, 2181, 2254, 2260, 2265, 2279, 2293, 2297, 2305, 2335,
			 2275, 2340, 2363, 2395, 2368, 2310, 2410, 2416, 2441, 2447,
			 2324, 2456, 2462, 2480, 2486, 2491,  771, 2501, 2509,    0,
			 1776,  687, 2032, 1977, 1792, 2120, 1918, 1970, 2208, 2008,
			    0, 1957, 1996, 1045, 2031, 2155, 2070, 2142, 2227, 2154,
			 2186, 2198, 2256, 2319, 2208, 2274, 2272, 2273, 2331, 2349,
			    0,    0, 1009, 1006, 2293, 2345, 2440, 2332, 2394,  985,
			  959, 2526, 2538, 2546, 2553, 2531, 2561, 5840, 2575, 2569,

			 2613, 2619,  930, 2624, 2629, 2634, 2640, 2645, 2650,  916,
			 2655, 2673, 2487,  666,  908, 2597, 2681, 2695, 2700, 2706,
			 2721, 2727, 2602, 2742,  896, 2746, 2760, 2771, 2788, 2799,
			 2807, 5840, 2797, 2823, 2815, 2845, 2833, 2715, 2871, 2876,
			 2892, 2908, 2756,  912, 1242, 2038, 5840, 1546,    0,  836,
			  855,  715, 2363, 2418, 2385, 2413, 2667, 2475, 2443, 2766,
			 2718, 2847,    0, 2448,  847, 2480, 2501,    0, 2666, 2815,
			 2501, 2726, 2711, 2736, 2826, 2870, 2737, 2854, 2849, 2858,
			 2891, 2901, 2924, 2937, 2952, 2965, 2974, 2869, 2980, 2986,
			 2996, 3004, 3009, 3014, 3025, 3035, 3040, 2017, 5840, 3048,

			    0, 3069, 3074, 3085, 3080, 3110, 3114, 3119, 3125, 3047,
			 3143, 3150, 3154, 3159, 3175, 3210,  838, 3193, 3200, 3231,
			 3235, 2911, 3024, 3069,  403, 5840, 5840, 1670, 2043, 2890,
			    0,  816, 2897,    0, 2946,  806, 2915, 2941,    0, 3071,
			 3063,  782, 2973, 2967, 3090, 3172, 3152, 3093, 3174, 3140,
			 3144, 3208, 3233,    0, 3137, 3155, 3161,  708, 3207, 3255,
			 3262, 3267, 3279, 3289, 3294, 3299, 3210, 3304, 3309,  642,
			 3314, 3319, 3324, 5840, 3333, 3343,    0, 3365, 3370, 3376,
			 3381, 3395, 3343, 3400, 3416, 3424, 3430, 3441, 3379, 3448,
			 3457, 3462,  640,  626,  604,  596,    0, 3219, 3230, 3240,

			    0, 3317,  591, 3399,    0,    0,    0,  582,  577,    0,
			  518, 3309,    0, 3407,  517, 3326, 3412, 3424, 3446,  463,
			 3470, 3481, 3492, 3497, 3506, 3520,  439, 1424, 3525, 3516,
			 3530, 3535, 3540,  460, 3563, 3567, 3572, 5840, 3578, 3557,
			 3596, 3610, 3481, 3582, 3591, 3592, 3606,  457, 3438, 3443,
			 3580, 3461, 3575, 3505, 3585, 3547, 3585,    0, 3632, 3639,
			  407, 3654, 3659, 3664, 3669, 3678, 3683, 5840, 3688,    0,
			 3709, 3714, 3624, 3718, 5840, 3723, 3744, 3703, 3704, 3722,
			 3729, 3772, 3629, 3648, 3712,    0,  443, 3680, 3722,    0,
			 3694,  384, 3773,  320, 3780, 3790,    0, 3811, 3817, 3825,

			 3832,  726, 5840, 1009,  323, 5840, 3709,  818, 1119, 3711,
			 3751,  882,  153, 3833,  374, 3843, 3858, 3872, 3876, 3856,
			 3857, 3874, 3730,    0,  307,    0,  302, 3745, 3894, 3906,
			    0,  221, 3927, 3932, 3858, 3905, 3915,  954, 3788, 3935,
			    0, 3941, 3965, 3969,  262,  137,  971, 3789,    0, 3977,
			 3649, 5840,  396, 3982, 4006, 3977, 3984, 3805, 4027, 4034,
			 4012, 3991, 4022,    0, 4044, 4009,  125,  102, 4054, 4059,
			 4064, 5840, 4041, 4042, 4074, 4079, 4060, 4074, 4106, 4097,
			 5840, 5840, 4116, 4121, 4131, 5840, 4136, 4146, 4151, 4156,
			 5840, 4197, 4249, 4301, 4353, 4405, 4441, 4479, 4524, 4574,

			 4626, 4678, 4730, 4781, 4831, 4883, 4935, 4981, 5031, 5083,
			 5128, 5177, 5212, 5262, 5303, 5352, 5402, 5451, 5501, 5537,
			 5576, 5610, 5643, 5677, 5716, 5750, 5789, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  890,    1,  891,  891,  892,  892,  890,    7,  893,
			  893,  890,  890,  890,  890,  890,  894,  890,  895,  896,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  898,  890,  890,  899,  890,   55,   55,  890,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  890,  890,  890,  900,  890,  890,  890,  900,  900,  900,
			  900,  900,  901,  890,  901,  902,  890,  903,  890,  903,
			  903,  890,  904,  905,  890,  890,  890,  890,  894,  890,

			  906,  906,  906,  907,  908,  890,  890,  890,  890,  890,
			  909,  890,  890,  890,  890,  890,  890,  897,  910,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,   46,  897,  897,
			  897,  897,   46,  897,  897,  897,  897,  897,  897,  898,
			  898,  899,  890,  890,  890,   58,  890,  155,  155,  155,
			   58,   58,   58,   58,   58,  155,   58,  155,  155,   58,
			   58,  155,  155,   58,   58,  155,  155,   58,   58,  155,
			   58,  155,  155,  155,   58,   58,   58,  155,   58,  155,
			   58,  155,  155,   58,   58,  155,  155,   58,   58,  155,

			  155,   58,   58,  155,   58,  155,   58,  890,  900,  890,
			  890,  890,  890,  900,  900,  900,  900,  900,  901,  890,
			  901,  902,  890,  902,  903,  903,  890,  890,  890,  890,
			  890,  890,  904,  905,  890,  890,  233,  911,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  912,  910,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  890,  897,  897,  897,  897,  897,  897,  897,  890,  897,
			  897,  897,  897,  897,  140,  140,  140,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  890,  898,  898,
			  890,  890,  155,  155,  155,  890,  155,   58,   58,   58,
			  155,   58,  155,  155,   58,   58,  155,  155,  155,   58,
			   58,   58,  155,  155,   58,   58,  890,  155,  155,  155,
			   58,   58,  155,   58,  155,   58,  155,  155,   58,   58,
			  155,  155,   58,   58,  155,  155,  155,   58,   58,   58,
			  155,   58,  155,   58,  900,  900,  900,  900,  900,  900,
			  900,  890,  913,  913,  890,  913,  913,  913,  911,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  914,
			  910,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  890,  897,  897,  897,  897,  897,  897,  890,  140,
			  140,  429,  429,  897,  137,  890,  433,  433,  897,  897,
			  890,  897,  897,  897,  897,  897,  915,  898,  898,  916,
			  155,  155,   58,   58,  155,   58,  155,  155,   58,   58,
			  155,  155,  155,   58,   58,   58,  155,  155,   58,  155,
			  155,  155,   58,   58,  155,   58,  155,  155,   58,   58,
			  155,  155,   58,   58,  155,  155,  155,   58,   58,  155,
			   58,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  909,  890,  890,  890,  914,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  890,  897,  897,  897,  897,  897,
			  897,  890,  433,  897,  890,  433,  535,  890,  897,  897,
			  897,  897,  912,  890,  917,  915,  890,  890,  155,  155,
			   58,   58,  155,   58,  155,  155,   58,   58,  155,  155,
			   58,   58,  155,  155,   58,  155,  155,  155,   58,   58,
			  155,   58,  155,  155,   58,   58,  155,  155,  155,  155,
			   58,   58,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  918,

			  919,  897,  897,  897,  897,  897,  897,  897,  897,  890,
			  897,  897,  897,  897,  897,  433,  890,  897,  897,  897,
			  897,  890,  914,  914,  917,  890,  890,  890,  890,  155,
			  155,   58,  155,  155,   58,   58,  155,  155,  155,   58,
			   58,   58,  155,  155,  155,   58,   58,  155,   58,  155,
			  155,   58,   58,  155,  155,  155,  155,   58,   58,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  920,  897,  897,  897,
			  897,  897,  890,  897,  897,  897,  897,  897,  890,  897,
			  897,  897,  890,  890,  914,  914,  921,  155,  155,   58,

			  155,  155,   58,   58,  155,  155,  155,   58,   58,  155,
			   58,  155,  155,   58,   58,  155,  155,  155,   58,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  920,  897,  897,  897,  890,  897,  890,
			  897,  897,  897,  890,  890,  919,  919,  922,  155,  155,
			   58,  155,   58,  155,   58,  155,  155,  155,   58,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  923,
			  897,  897,  897,  897,  890,  897,  897,  890,  890,  920,
			  920,  890,  155,  155,   58,  155,   58,  155,   58,  155,
			  155,   58,  890,  890,  890,  890,  924,  897,  897,  897,

			  897,  890,  890,  920,  920,  890,  155,  155,   58,  155,
			   58,  155,  890,  890,  924,  897,  897,  897,  897,  890,
			  890,  920,  155,  155,   58,  155,   58,  155,  890,  890,
			  925,  890,  897,  897,  890,  890,  920,  155,  155,  890,
			  926,  890,  897,  897,  890,  890,  920,  155,  155,  890,
			  890,  890,  926,  890,  897,  890,  890,  155,  890,  890,
			  897,  890,  890,  155,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			    0,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890, yy_Dummy>>)
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
			   78,   79,   63,   80,   81,   82,   83,    1,   84,   84,
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
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,   10,   11,   12,   12,
			   12,   13,   14,    1,    1,   15,    1,   16,    1,   17,
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,    5,   40,   41,    5,   12,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   43,   44,   45,   46,   47,   48,   49,   50,
			    5,    5,   51,   52,    1,    1,    1,    1,    1,    1,
			    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  131,  129,    1,    2,   15,  113,   18,  129,   16,
			   17,    7,    6,   13,    5,   11,    8,  104,  104,   14,
			   12,   28,   10,   29,   19,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   81,   96,   96,   96,
			   96,   21,   30,   22,    9,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   23,   20,   24,  117,  118,  119,  120,  117,  117,  117,
			  117,  117,  130,  102,  130,  130,  130,  130,   68,  130,
			  130,   70,  130,  130,   95,    1,    2,   27,  113,  112,

			  127,  127,  127,    0,    3,   81,   32,  108,   31,    0,
			    0,  104,    0,  104,   26,   25,    0,   96,   90,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   39,   96,   89,   89,
			   80,   89,   89,   96,   96,   96,   96,   96,   96,    0,
			    0,    0,  103,    0,    0,   99,    0,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   39,   99,   39,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,  100,  117,  119,
			  118,  115,  114,  116,  117,  117,  117,  117,    0,  102,
			    0,    0,  101,    0,    0,    0,   70,   68,    0,   67,
			    0,   66,    0,    0,   95,   93,   93,    0,   94,  127,
			  121,  127,  127,  127,  127,  127,  127,    0,    4,    0,
			   89,   89,   80,   89,   89,   33,  108,    0,    0,    0,
			  106,  108,  106,  104,    0,    0,   90,    0,    0,   96,
			   96,   38,   96,   96,   96,   96,   96,   96,   96,   96,
			    0,   96,   96,   96,   96,   41,   96,   96,    0,   81,
			   82,   81,   81,   81,   88,   96,   88,   88,   88,   96,

			   96,   96,   96,   96,   96,   40,   96,    0,    0,    0,
			   98,    0,   99,   99,   38,   71,   71,   99,   99,   38,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,    0,   99,   99,   99,
			   99,   99,   99,   99,   41,   41,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   40,   40,   99,   99,  117,  117,  117,  117,  117,  117,
			  117,  101,    0,    0,   69,   67,   66,   70,    0,  125,
			  128,  128,  126,  122,  123,  124,   91,   81,   81,   81,
			   81,   88,    0,   88,   88,   88,  108,    0,  108,    0,

			    0,  108,    0,    0,    0,  107,  104,    0,    0,    0,
			   97,   96,   96,   96,   96,   96,   37,   96,   96,   96,
			   96,    0,   96,   96,   96,   96,   96,   96,    0,   96,
			   80,   96,   96,   96,   96,    0,   80,   80,   80,   36,
			    0,   43,   96,   96,   96,   96,   65,    0,    0,   61,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   37,   99,   99,   37,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   36,   43,   36,   43,   99,   99,   99,   99,   99,   99,
			   99,   80,    0,    0,    0,   80,   80,   80,  108,  108,

			    0,    0,  105,  108,    0,  107,    0,  107,    0,    0,
			    0,  104,   77,    0,    0,   58,   96,   96,   96,   96,
			   96,   96,   44,   96,    0,   96,   96,   35,   96,   96,
			   96,   82,   82,   81,    0,   96,   96,    0,   96,   96,
			   96,   96,    0,   65,   65,    0,   64,   64,   58,   99,
			   58,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   44,   99,   44,   99,   99,   35,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,    0,    0,    0,  108,    0,  111,  108,  107,
			    0,    0,  107,    0,    0,  106,    0,    0,   77,    0,

			    0,   96,   59,   96,   60,   96,   96,   46,   96,    0,
			   96,   96,   96,   96,   96,   96,    0,   52,   96,   96,
			   96,    0,    0,    0,    0,   63,   62,    0,    0,   99,
			   59,   59,   99,   60,   99,   60,   99,   99,   46,   99,
			   99,   46,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   52,   99,   99,   99,   52,   99,    0,
			  108,    0,    0,    0,  107,    0,  111,  107,    0,   79,
			    0,    0,    0,  109,  111,  109,    0,   96,   96,   57,
			   96,   45,    0,   42,   56,   34,   96,   50,    0,   96,
			   96,   96,    0,    0,    0,    0,    0,   99,   99,   99,

			   57,   99,   57,   99,   45,   42,   56,   42,   56,   34,
			   34,   99,   50,   99,   50,   99,   99,   99,   99,  111,
			    0,  111,    0,  107,    0,    0,  110,    0,    0,   76,
			  111,    0,  110,    0,   96,   96,   96,   85,   96,    0,
			   96,   96,   53,    0,    0,    0,    0,    0,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   53,   99,  111,
			  110,    0,  110,    0,    0,    0,    0,   76,  110,    0,
			   96,   96,   47,   96,   84,   51,   96,    0,    0,    0,
			    0,    0,   99,   99,   99,   47,   47,   99,   99,   51,
			   99,   51,  110,   78,    0,   76,    0,   96,   96,   96,

			   96,   83,   83,   83,   83,   92,   99,   99,   99,   99,
			   99,   99,    0,    0,    0,   96,   49,   48,   96,    0,
			    0,    0,   99,   49,   49,   48,   48,   99,    0,    0,
			    0,    0,   96,   96,    0,    0,    0,   99,   99,   75,
			    0,    0,   96,   54,    0,    0,    0,   99,   54,    0,
			    0,   75,    0,   72,   96,    0,    0,   99,    0,    0,
			   55,    0,    0,   55,    0,   74,    0,    0,    0,    0,
			    0,   74,    0,    0,    0,    0,    0,    0,    0,   73,
			   86,   87,    0,    0,    0,   73,    0,   73,    0,    0,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5840
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 890
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 891
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

	yyNb_rules: INTEGER = 130
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 131
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

	dadl_parser: DADL2_VALIDATOR
		once
			create Result.make
		end

	dadl_parser_error: STRING

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

	c_domain_type: detachable C_DOMAIN_TYPE

	tid: INTEGER

invariant
	in_buffer_not_void: in_buffer /= Void

end
