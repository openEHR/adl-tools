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
--|#line 0 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 0")
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
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6131)
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
			   12,   12,   12,   74,   83,   83,   93,   75,   74,   93,

			  101,   95,   75,   95,   95,  105,  866,  106,  106,  106,
			  106,  106,  106,  108,  232,  109,  300,  110,  110,  110,
			  110,  110,  110,  115,  115,  166,  115,  154,  210,  154,
			  305,   84,   84,  108,  167,  109,  306,  112,  112,  112,
			  112,  112,  112,  154,   76,  102,  178,  117,  355,   76,
			  849,   94,  301,  168,   94,  159,  111,  159,  305,  601,
			   85,   85,  169,  209,  306,  209,  209,  302,  848,  233,
			   95,  159,   95,   95,  179,  211,  111,  355,   77,   78,
			   79,   80,   81,   77,   78,   79,   80,   81,   86,   87,
			   88,   86,   87,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   89,   90,   86,   90,   90,   90,   90,   90,
			   90,   86,   86,   86,   86,   86,   86,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   86,   86,   91,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			  115,  115,  307,  115,  115,  115,  209,  115,  209,  209,
			  115,  115,  208,  115,  186,  832,  228,  154,  154,  228,

			  115,  115,  831,  115,  117,  188,  115,  115,  117,  115,
			  307,  817,  218,  118,  117,  154,  121,  119,  122,  120,
			  223,  745,  187,  223,  117,  159,  159,  123,  115,  115,
			  117,  115,  204,  189,  132,  115,  115,  124,  115,  115,
			  115,  118,  115,  159,  121,  119,  122,  120,  125,  219,
			  115,  115,  117,  115,  313,  123,  126,  115,  115,  117,
			  115,  205,  132,  117,  315,  124,  115,  115,  127,  115,
			  128,  316,  213,  225,  117,  154,  208,  125,  220,  133,
			  170,  117,  313,  230,  126,  319,  230,  134,  129,  130,
			  117,  171,  315,  190,  131,  154,  127,  788,  128,  316,

			  135,  115,  115,  159,  115,  144,  191,  133,  172,  325,
			  145,  115,  115,  319,  115,  134,  129,  130,  565,  208,
			  173,  192,  131,  159,  247,  117,  247,  247,  135,  115,
			  115,  326,  115,  144,  193,  117,  142,  325,  145,  473,
			  221,  569,  569,  757,  143,  136,  136,  136,  136,  136,
			  136,  146,  208,  117,  212,  212,  212,  174,  208,  326,
			  137,  154,  115,  115,  142,  115,  745,  138,  473,  175,
			  115,  115,  143,  115,  139,  154,  140,  219,  141,  146,
			  330,  180,  181,  485,  154,  176,  117,  182,  137,  159,
			  154,  198,  154,  194,  259,  138,  199,  177,  215,  215,

			  202,  195,  574,  159,  526,  140,  220,  141,  330,  183,
			  184,  147,  159,  364,  520,  185,  477,  521,  159,  200,
			  159,  196,  115,  115,  201,  115,  795,  722,  203,  197,
			  214,  214,  214,  526,  721,  260,  216,  216,  216,  331,
			  147,  152,  227,  111,  152,  227,  117,  260,  152,  153,
			  222,  152,  208,  720,  228,  229,  153,  154,  154,  154,
			  154,  154,  154,  155,  335,  230,  154,  331,  796,  154,
			  154,  154,  154,  154,  156,  154,  154,  154,  157,  154,
			  158,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  335,  719,  159,  225,  154,  159,  159,  160,

			  159,  159,  161,  159,  159,  159,  162,  159,  163,  159,
			  159,  159,  159,  159,  160,  159,  159,  159,  159,  159,
			  152,  227,  520,  152,  227,  520,  260,  703,  153,  664,
			  212,  212,  212,  228,  605,  329,  154,  154,  154,  154,
			  154,  154,  155,  337,  230,  154,  232,  584,  154,  154,
			  154,  154,  164,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  337,  575,  159,  225,  154,  159,  159,  159,  159,
			  165,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  235,

			  235,  233,  235,  806,  807,  240,  252,  252,  252,  252,
			  252,  252,  745,  208,  241,  241,  241,  241,  241,  241,
			  832,  223,  806,  807,  223,  236,  108,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  242,  249,  249,  249,  249,  249,  249,  254,  254,  254,
			  254,  254,  254,  339,  320,  243,  340,  250,  343,  244,
			  321,  245,  344,  255,  225,  115,  115,  108,  115,  109,
			  237,  256,  256,  256,  256,  256,  256,  257,  260,  519,
			  251,  339,  320,  213,  340,  250,  343,  273,  321,  117,

			  344,  255,  258,  258,  258,  258,  258,  258,  108,  349,
			  109,  394,  256,  256,  256,  256,  256,  256,  115,  115,
			  111,  115,  115,  115,  367,  115,  115,  115,  367,  115,
			  260,  260,  353,  260,  347,  260,  470,  349,  348,  260,
			  115,  115,  117,  115,  368,  367,  117,  368,  451,  343,
			  117,  111,  349,  260,  433,  115,  115,  264,  115,  263,
			  353,  430,  347,  262,  117,  260,  348,  260,  260,  115,
			  115,  603,  115,  265,  603,  115,  115,  345,  115,  117,
			  352,  394,  260,  307,  154,  264,  154,  263,  260,  115,
			  115,  262,  115,  117,  115,  115,  604,  115,  266,  117,

			  344,  265,  260,  115,  115,  378,  115,  260,  377,  267,
			  260,  312,  159,  117,  159,  376,  260,  799,  117,  268,
			  115,  115,  260,  115,  269,  375,  266,  117,  346,  154,
			  270,  372,  272,  260,  306,  115,  115,  267,  115,  866,
			  271,  154,  115,  115,  117,  115,  799,  268,  260,  316,
			  115,  115,  269,  115,  218,  260,  434,  159,  270,  117,
			  272,  274,  311,  260,  226,  275,  117,  260,  271,  159,
			  115,  115,  435,  115,  117,  115,  115,  318,  115,  115,
			  115,  221,  115,  260,  434,  260,  154,  803,  260,  274,
			  222,  219,  260,  275,  117,  277,  208,  276,  319,  117, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  435,  332,  260,  117,  154,  279,  115,  115,  347,  115,
			  280,  438,  348,  273,  159,  278,  803,  304,  219,  260,
			  220,  154,  440,  277,  115,  115,  322,  115,  115,  115,
			  117,  115,  159,  279,  305,  260,  350,  260,  280,  438,
			  351,  260,  795,  278,  281,  260,  281,  220,  117,  159,
			  440,  287,  117,  745,  434,  137,  260,  441,  303,  137,
			  444,  823,  310,  282,  445,  115,  115,  283,  115,  287,
			  284,  140,  151,  287,  208,  154,  313,  116,  260,  285,
			  208,  286,  436,  137,  797,  441,  260,  137,  444,  117,
			  823,  282,  445,  115,  115,  283,  115,  297,  284,  604,

			  140,  300,  604,  159,  314,  154,  260,  672,  285,  248,
			  286,  115,  115,  446,  115,  260,  315,  117,  116,  116,
			  116,  116,  116,  116,  260,  297,  260,  288,  288,  288,
			  288,  288,  288,  159,  247,  117,  450,  115,  115,  294,
			  115,  446,  453,  331,  317,  154,  289,  287,  246,  290,
			  260,  116,  212,  212,  212,  291,  239,  405,  362,  362,
			  362,  117,  115,  115,  450,  115,  260,  294,  405,  292,
			  453,  334,  293,  159,  289,  260,  260,  290,  405,   99,
			  116,  115,  115,  291,  115,  154,  117,   96,  115,  115,
			  325,  115,  454,  320,  260,  154,  405,  292,  295,  321,

			  293,  260,  296,  260,  308,  117,  309,  309,  309,  309,
			  309,  309,  117,  159,  260,  260,  260,  260,  327,  208,
			  454,  323,  154,  159,  298,  455,  295,  324,  260,  208,
			  296,  226,  222,  154,  154,  154,  154,  299,  260,  208,
			  260,  206,  227,  330,  326,  227,  458,  154,  151,  335,
			  159,  260,  298,  455,  228,  339,  460,  154,  332,  154,
			  337,  159,  159,  159,  159,  230,  299,  260,  461,  340,
			  154,  333,  328,  149,  458,  159,  866,  336,  464,  371,
			  371,  114,  371,  341,  460,  159,  154,  159,  338,  383,
			  383,  383,  383,  383,  383,  225,  461,  342,  159,  113,

			  357,  358,  359,  360,  361,  236,  464,  363,  363,  363,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  260,  260,  227,  107,  104,  227,  373,
			  374,  374,  374,  374,  374,  374,   99,  228,  246,  246,
			   97,  246,  154,  154,  369,  367,   96,  369,  230,  381,
			  866,  381,  465,  353,  382,  382,  382,  382,  382,  382,
			  355,  866,  379,  384,  384,  384,  384,  384,  384,  866,
			  159,  159,  391,  391,  391,  391,  391,  388,  225,  388,
			  465,  354,  389,  389,  389,  389,  389,  389,  866,  356,

			  365,  366,  367,  365,  366,  365,  365,  365,  365,  365,
			  365,  365,  365,  368,  229,  229,  365,  229,  229,  229,
			  229,  229,  229,  365,  369,  365,  365,  365,  365,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  365,  365,  370,  365,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  235,  235,  866,  235,  392,  392,  392,  392,

			  392,  392,  412,  412,  412,  412,  412,  412,  416,  416,
			  416,  416,  416,  416,  739,  739,  739,  739,  236,  866,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  380,  380,  380,  380,  380,  380,  385,
			  385,  385,  385,  385,  385,  603,  260,  468,  603,  250,
			  866,  866,  108,  866,  109,  386,  390,  390,  390,  390,
			  390,  390,  866,  237,  440,  154,  115,  115,  260,  115,
			  604,  469,  251,  115,  115,  468,  115,  250,  387,  260,
			  866,  115,  115,  386,  115,  208,  260,  444,  115,  115,

			  117,  115,  442,  159,  260,  111,  208,  117,  395,  469,
			  866,  260,  866,  115,  115,  117,  115,  115,  115,  866,
			  115,  866,  117,  396,  260,  447,  260,  804,  804,  804,
			  260,  866,  115,  115,  525,  115,  395,  117,  397,  115,
			  115,  117,  115,  154,  398,  260,  115,  115,  866,  115,
			  866,  396,  260,  866,  115,  115,  117,  115,  866,  260,
			  260,  399,  525,  117,  400,  866,  397,  260,  866,  260,
			  117,  159,  398,  212,  212,  212,  401,  866,  117,  154,
			  529,  115,  115,  531,  115,  215,  215,  260,  154,  399,
			  402,  441,  400,  445,  260,  208,  115,  115,  403,  115,

			  115,  115,  866,  115,  401,  117,  461,  159,  529,  260,
			  866,  531,  532,  260,  115,  115,  159,  115,  402,  443,
			  117,  448,  115,  115,  117,  115,  403,  260,  535,  115,
			  115,  304,  115,  406,  463,  260,  404,  407,  117,  260,
			  532,  536,  260,  405,  115,  115,  117,  115,  866,  866,
			  408,  866,  409,  117,  405,  866,  535,  260,  154,  115,
			  115,  406,  115,  866,  405,  407,  260,  866,  117,  536,
			  446,  539,  260,  214,  214,  214,  115,  115,  408,  115,
			  409,  866,  405,  117,  866,  465,  159,  540,  866,  260,
			  410,  411,  413,  413,  413,  413,  413,  413,  449,  539,

			  117,  415,  415,  415,  415,  415,  415,  417,  417,  417,
			  417,  417,  417,  467,  419,  540,  419,  501,  410,  411,
			  866,  414,  418,  418,  418,  418,  418,  418,  501,  866,
			  116,  116,  116,  116,  116,  116,  116,  420,  501,  866,
			  421,  866,  542,  260,  260,  260,  422,  116,  116,  116,
			  116,  116,  116,  866,  115,  115,  501,  115,  115,  115,
			  458,  115,  154,  154,  154,  420,  116,  260,  421,  453,
			  542,  260,  115,  115,  422,  115,  115,  115,  117,  115,
			  115,  115,  117,  115,  543,  260,  451,  866,  459,  260,
			  159,  159,  159,  260,  116,  866,  117,  456,  291,  260,

			  117,  866,  424,  260,  117,  866,  115,  115,  425,  115,
			  866,  423,  543,  260,  115,  115,  866,  115,  154,  260,
			  115,  115,  154,  115,  260,  464,  291,  260,  115,  115,
			  117,  115,  154,  260,  115,  115,  425,  115,  117,  423,
			  435,  260,  544,  154,  117,  470,  159,  260,  426,  547,
			  159,  438,  117,  466,  549,  866,  866,  427,  117,  431,
			  159,  431,  431,  431,  431,  431,  431,  300,  437,  866,
			  544,  159,  866,  866,  866,  428,  426,  547,  866,  439,
			  866,  866,  549,  429,  432,  427,  432,  432,  432,  432,
			  432,  432,  300,  308,  260,  308,  308,  308,  308,  308, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  308,  308,  260,  309,  309,  309,  309,  309,  309,  260,
			  260,  260,  429,  154,  260,  260,  208,  371,  371,  208,
			  371,  154,  208,  866,  550,  450,  454,  553,  154,  154,
			  154,  260,  554,  154,  154,  115,  115,  116,  115,  468,
			  116,  159,  460,  866,  469,  606,  116,  866,  260,  159,
			  532,  473,  550,  452,  457,  553,  159,  159,  159,  117,
			  554,  159,  159,  366,  367,  116,  366,  471,  116,  866,
			  462,  866,  472,  606,  116,  368,  866,  866,  534,  866,
			  474,  648,  648,  648,  648,  648,  369,  373,  374,  374,
			  374,  374,  374,  374,  216,  216,  216,  212,  212,  212,

			  212,  212,  212,  475,  475,  475,  475,  475,  475,  382,
			  382,  382,  382,  382,  382,  608,  370,  609,  612,  250,
			  476,  476,  476,  476,  476,  476,  478,  478,  478,  478,
			  478,  478,  479,  479,  479,  479,  479,  479,  260,  260,
			  866,  866,  251,  608,  260,  609,  612,  250,  480,  480,
			  480,  480,  480,  480,  866,  618,  619,  154,  154,  477,
			  481,  531,  481,  539,  386,  482,  482,  482,  482,  482,
			  482,  483,  483,  483,  483,  483,  483,  389,  389,  389,
			  389,  389,  389,  618,  619,  159,  159,  387,  866,  533,
			  866,  541,  386,  484,  484,  484,  484,  484,  484,  486,

			  487,  866,  488,  488,  488,  488,  488,  488,  489,  489,
			  489,  489,  489,  489,  490,  490,  490,  490,  490,  490,
			  115,  115,  866,  115,  115,  115,  866,  115,  866,  514,
			  866,  520,  485,  260,  521,  260,  620,  260,  115,  115,
			  514,  115,  115,  115,  117,  115,  623,  866,  117,  866,
			  514,  260,  866,  866,  154,  260,  115,  115,  260,  115,
			  260,  866,  117,  492,  620,  525,  117,  866,  514,  260,
			  866,  493,  115,  115,  623,  115,  260,  154,  495,  154,
			  117,  494,  159,  542,  601,  260,  115,  115,  496,  115,
			  866,  492,  526,  527,  866,  154,  117,  866,  260,  260,

			  493,  115,  115,  866,  115,  159,  495,  159,  536,  494,
			  117,  545,  625,  866,  260,  866,  496,  154,  497,  115,
			  115,  528,  115,  159,  866,  117,  115,  115,  866,  115,
			  260,  498,  260,  499,  260,  626,  538,  866,  260,  260,
			  625,  115,  115,  117,  115,  159,  497,  500,  260,  154,
			  117,  866,  547,  154,  260,  115,  115,  154,  115,  498,
			  866,  499,  502,  626,  529,  117,  866,  154,  260,  115,
			  115,  535,  115,  115,  115,  500,  115,  159,  866,  117,
			  548,  159,  260,  629,  866,  159,  260,  503,  115,  115,
			  502,  115,  530,  117,  504,  159,  866,  117,  866,  537,

			  866,  260,  866,  866,  505,  412,  412,  412,  412,  412,
			  412,  629,  117,  555,  630,  503,  506,  281,  866,  281,
			  866,  281,  504,  281,  556,  415,  415,  415,  415,  415,
			  415,  507,  505,  508,  416,  416,  416,  416,  416,  416,
			  283,  555,  630,  509,  506,  115,  115,  509,  115,  866,
			  116,  866,  556,  571,  116,  571,  509,  866,  260,  507,
			  866,  508,  866,  866,  572,  631,  866,  116,  283,  117,
			  866,  509,  866,  866,  866,  509,  417,  417,  417,  417,
			  417,  417,  866,  592,  509,  418,  418,  418,  418,  418,
			  418,  510,  573,  631,  592,  866,  116,  511,  511,  511,

			  511,  511,  511,  866,  592,  116,  512,  512,  512,  512,
			  512,  512,  513,  513,  513,  513,  513,  513,  116,  510,
			  115,  115,  592,  115,  115,  115,  866,  115,  866,  115,
			  115,  600,  115,  260,  866,  116,  866,  260,  866,  866,
			  632,  116,  260,  673,  117,  866,  638,  116,  117,  115,
			  115,  866,  115,  117,  115,  115,  674,  115,  260,  866,
			  260,  676,  260,  115,  115,  866,  115,  260,  632,  251,
			  866,  673,  866,  117,  638,  515,  519,  154,  117,  154,
			  516,  602,  517,  260,  674,  866,  866,  117,  866,  676,
			  549,  543,  431,  518,  431,  431,  431,  431,  431,  431,

			  300,  554,  154,  515,  260,  159,  260,  159,  516,  432,
			  517,  432,  432,  432,  432,  432,  432,  300,  551,  546,
			  866,  518,  519,  154,  677,  154,  866,  866,  680,  558,
			  159,  523,  681,  866,  550,  260,  260,  115,  115,  553,
			  115,  154,  475,  475,  475,  475,  475,  475,  524,  866,
			  260,  159,  677,  159,  154,  606,  680,  682,  559,  866,
			  681,  117,  552,  866,  866,  685,  866,  557,  866,  159,
			  560,  560,  560,  560,  560,  560,  561,  561,  561,  561,
			  561,  561,  159,  607,  866,  682,  559,  562,  562,  562,
			  562,  562,  562,  685,  563,  563,  563,  563,  563,  563,

			  482,  482,  482,  482,  482,  482,  866,  866,  866,  477,
			  386,  564,  564,  564,  564,  564,  564,  566,  566,  566,
			  566,  566,  566,  567,  567,  567,  567,  567,  567,  687,
			  866,  688,  691,  387,  115,  115,  613,  115,  386,  568,
			  568,  568,  568,  568,  568,  866,  260,  260,  614,  866,
			  565,  563,  563,  563,  563,  563,  563,  687,  117,  688,
			  691,  866,  485,  866,  613,  154,  487,  570,  488,  488,
			  488,  488,  488,  488,  115,  115,  614,  115,  115,  115,
			  866,  115,  866,  115,  115,  866,  115,  260,  605,  576,
			  866,  260,  866,  159,  866,  570,  260,  866,  117,  597,

			  115,  115,  117,  115,  866,  866,  577,  117,  115,  115,
			  598,  115,  658,  260,  579,  115,  115,  578,  115,  866,
			  599,  260,  115,  115,  117,  115,  866,  866,  260,  658,
			  260,  580,  117,  658,  577,  260,  260,  692,  598,  117,
			  581,  866,  579,  866,  866,  578,  117,  115,  115,  154,
			  115,  866,  582,  693,  585,  619,  866,  658,  866,  580,
			  260,  115,  115,  866,  115,  692,  115,  115,  581,  115,
			  866,  117,  260,  724,  260,  115,  115,  159,  115,  260,
			  582,  693,  585,  621,  583,  117,  260,  725,  260,  866,
			  117,  613,  586,  115,  115,  866,  115,  115,  115,  117,

			  115,  724,  727,  614,  609,  154,  260,  587,  866,  866,
			  260,  866,  583,  866,  866,  725,  866,  117,  866,  616,
			  586,  117,  590,  590,  590,  590,  590,  590,  866,  589,
			  727,  617,  611,  159,  260,  587,  588,  116,  116,  116,
			  116,  116,  116,  511,  511,  511,  511,  511,  511,  866,
			  866,  116,  866,  623,  419,  729,  419,  589,  512,  512,
			  512,  512,  512,  512,  588,  115,  115,  713,  115,  866,
			  731,  591,  513,  513,  513,  513,  513,  513,  260,  866,
			  421,  624,  866,  729,  713,  260,  422,  116,  713,  117,
			  866,  866,  115,  115,  116,  115,  260,  593,  731,  591, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  866,  260,  866,  612,  154,  260,  115,  115,  421,  115,
			  115,  115,  713,  115,  422,  154,  117,  260,  260,  260,
			  154,  260,  116,  260,  594,  593,  625,  608,  260,  866,
			  117,  615,  159,  866,  117,  620,  154,  626,  732,  701,
			  629,  866,  866,  159,  866,  866,  866,  630,  159,  595,
			  596,  635,  594,  635,  627,  610,  636,  636,  636,  636,
			  636,  636,  387,  622,  159,  628,  732,  701,  633,  636,
			  636,  636,  636,  636,  636,  634,  866,  595,  596,  637,
			  637,  637,  637,  637,  637,  563,  563,  563,  563,  563,
			  563,  640,  640,  640,  640,  640,  640,  866,  866,  733,

			  758,  639,  641,  641,  641,  641,  641,  641,  477,  642,
			  642,  642,  642,  642,  642,  643,  643,  643,  643,  643,
			  643,  644,  644,  644,  644,  644,  644,  733,  758,  639,
			  565,  645,  645,  645,  645,  645,  645,  646,  866,  646,
			  866,  866,  643,  643,  643,  643,  643,  643,  647,  647,
			  647,  647,  647,  647,  485,  650,  650,  650,  650,  650,
			  650,  115,  115,  866,  115,  866,  115,  115,  260,  115,
			  866,  651,  260,  866,  260,  668,  866,  668,  866,  260,
			  115,  115,  866,  115,  866,  117,  668,  154,  670,  653,
			  117,  154,  866,  260,  115,  115,  669,  115,  671,  651,

			  115,  115,  759,  115,  117,  866,  715,  260,  654,  115,
			  115,  866,  115,  260,  668,  159,  670,  653,  117,  159,
			  669,  866,  260,  715,  117,  115,  115,  715,  115,  761,
			  759,  671,  655,  117,  115,  115,  654,  115,  260,  115,
			  115,  671,  115,  115,  115,  866,  115,  260,  656,  117,
			  866,  715,  260,  763,  260,  866,  260,  761,  117,  671,
			  655,  115,  115,  117,  115,  115,  115,  117,  115,  115,
			  115,  657,  115,  676,  260,  660,  656,  866,  260,  866,
			  866,  763,  260,  659,  866,  117,  866,  866,  866,  117,
			  866,  866,  765,  117,  866,  866,  866,  662,  866,  657,

			  663,  678,  866,  660,  866,  661,  115,  115,  281,  115,
			  281,  659,  590,  590,  590,  590,  590,  590,  260,  260,
			  765,  115,  115,  260,  115,  662,  115,  115,  663,  115,
			  117,  866,  260,  661,  260,  115,  115,  154,  115,  260,
			  866,  116,  154,  260,  677,  117,  866,  674,  260,  260,
			  117,  154,  260,  766,  260,  866,  666,  866,  260,  117,
			  866,  260,  154,  260,  665,  159,  667,  782,  682,  783,
			  159,  154,  679,  687,  681,  675,  688,  154,  785,  159,
			  154,  766,  154,  685,  666,  115,  115,  866,  115,  866,
			  159,  787,  665,  691,  667,  782,  684,  783,  260,  159,

			  866,  689,  683,  866,  690,  159,  785,  798,  159,  117,
			  159,  686,  636,  636,  636,  636,  636,  636,  801,  787,
			  813,  694,  636,  636,  636,  636,  636,  636,  695,  695,
			  695,  695,  695,  695,  696,  798,  696,  866,  866,  697,
			  697,  697,  697,  697,  697,  698,  801,  698,  813,  866,
			  699,  699,  699,  699,  699,  699,  699,  699,  699,  699,
			  699,  699,  700,  700,  700,  700,  700,  700,  643,  643,
			  643,  643,  643,  643,  702,  702,  702,  702,  702,  702,
			  643,  643,  643,  643,  643,  643,  704,  704,  704,  704,
			  704,  704,  866,  866,  866,  565,  705,  705,  705,  705,

			  705,  705,  706,  706,  706,  706,  706,  706,  757,  757,
			  814,  757,  115,  115,  707,  115,  707,  866,  701,  708,
			  708,  708,  708,  708,  708,  260,  115,  115,  866,  115,
			  115,  115,  781,  115,  115,  115,  117,  115,  814,  260,
			  866,  387,  824,  260,  866,  260,  701,  260,  115,  115,
			  117,  115,  260,  866,  117,  710,  115,  115,  117,  115,
			  712,  260,  833,  711,  154,  115,  115,  866,  115,  260,
			  824,  154,  117,  115,  115,  866,  115,  866,  260,  866,
			  117,  115,  115,  710,  115,  260,  260,  866,  712,  117,
			  833,  711,  159,  866,  260,  115,  115,  117,  115,  159,

			  115,  115,  260,  115,  154,  117,  260,  260,  260,  725,
			  260,  260,  714,  260,  260,  115,  115,  750,  115,  117,
			  825,  154,  825,  727,  117,  154,  154,  716,  260,  154,
			  154,  826,  159,  731,  750,  717,  729,  726,  750,  117,
			  714,  697,  697,  697,  697,  697,  697,  718,  866,  159,
			  866,  728,  866,  159,  159,  716,  866,  159,  159,  827,
			  866,  734,  750,  717,  730,  735,  735,  735,  735,  735,
			  735,  866,  866,  839,  866,  718,  699,  699,  699,  699,
			  699,  699,  699,  699,  699,  699,  699,  699,  736,  736,
			  736,  736,  736,  736,  740,  740,  740,  740,  740,  740,

			  737,  839,  737,  866,  477,  738,  738,  738,  738,  738,
			  738,  741,  742,  741,  742,  642,  642,  642,  642,  642,
			  642,  708,  708,  708,  708,  708,  708,  115,  115,  260,
			  115,  701,  744,  744,  744,  744,  744,  744,  866,  866,
			  260,  866,  115,  115,  866,  115,  866,  866,  154,  866,
			  743,  117,  759,  866,  387,  260,  866,  746,  753,  701,
			  115,  115,  753,  115,  115,  115,  117,  115,  866,  115,
			  115,  485,  115,  260,  866,  866,  159,  260,  747,  753,
			  760,  866,  260,  260,  117,  746,  115,  115,  117,  115,
			  753,  866,  748,  117,  749,  115,  115,  260,  115,  260,

			  751,  866,  761,  754,  866,  753,  747,  754,  260,  755,
			  117,  754,  866,  777,  763,  756,  154,  777,  752,  117,
			  748,  260,  749,  866,  754,  866,  755,  845,  751,  845,
			  762,  866,  756,  866,  777,  754,  866,  755,  846,  765,
			  154,  866,  764,  756,  159,  777,  752,  695,  695,  695,
			  695,  695,  695,  738,  738,  738,  738,  738,  738,  768,
			  768,  768,  768,  768,  768,  866,  847,  767,  159,  769,
			  769,  769,  769,  769,  769,  573,  573,  573,  573,  573,
			  573,  829,  829,  829,  829,  829,  477,  770,  770,  770,
			  770,  770,  770,  835,  835,  835,  835,  835,  565,  771,

			  771,  771,  771,  771,  771,  702,  702,  702,  702,  702,
			  702,  115,  115,  778,  115,  115,  115,  778,  115,  115,
			  115,  777,  115,  866,  260,  779,  866,  778,  260,  866,
			  260,  780,  260,  866,  778,  117,  866,  115,  115,  117,
			  115,  866,  779,  117,  485,  778,  773,  260,  780,  154,
			  260,  115,  115,  779,  115,  115,  115,  260,  115,  780,
			  774,  117,  783,  260,  260,  866,  154,  866,  260,  775,
			  810,  866,  811,  866,  773,  117,  785,  159,  810,  117,
			  811,  866,  154,  115,  115,  866,  115,  866,  774,  866,
			  784,  810,  866,  811,  159,  866,  260,  775,  866,  866, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  776,  866,  866,  866,  786,  866,  810,  117,  811,  866,
			  159,  736,  736,  736,  736,  736,  736,  789,  789,  789,
			  789,  789,  789,  260,  741,  866,  741,  793,  776,  771,
			  771,  771,  771,  771,  771,  115,  115,  260,  115,  866,
			  115,  115,  154,  115,  115,  115,  866,  115,  260,  866,
			  565,  837,  260,  260,  801,  793,  154,  260,  866,  117,
			  866,  866,  837,  743,  117,  866,  852,  791,  117,  866,
			  159,  154,  837,  799,  805,  805,  805,  805,  805,  805,
			  866,  866,  802,  852,  159,  115,  115,  852,  115,  792,
			  837,  115,  115,  794,  115,  791,  866,  260,  260,  159,

			  115,  115,  800,  115,  260,  866,  745,  115,  115,  117,
			  115,  852,  866,  260,  866,  117,  154,  866,  792,  811,
			  260,  853,  794,  866,  117,  866,  856,  812,  866,  866,
			  808,  117,  815,  815,  815,  815,  815,  815,  853,  866,
			  812,  866,  853,  856,  159,  866,  866,  856,  809,  743,
			  743,  743,  743,  743,  743,  812,  115,  115,  808,  115,
			  115,  115,  820,  115,  821,  745,  853,  866,  866,  260,
			  820,  856,  821,  260,  866,  866,  809,  866,  821,  866,
			  117,  866,  866,  820,  117,  821,  822,  857,  115,  115,
			  866,  115,  819,  115,  115,  866,  115,  866,  820,  822,

			  821,  260,  866,  866,  857,  818,  260,  838,  857,  866,
			  866,  866,  117,  866,  822,  866,  866,  117,  838,  866,
			  819,  834,  834,  834,  834,  834,  834,  866,  838,  830,
			  115,  115,  857,  115,  818,  829,  829,  829,  829,  829,
			  829,  866,  866,  260,  866,  866,  838,  840,  840,  840,
			  840,  840,  840,  866,  117,  866,  866,  830,  115,  115,
			  866,  115,  836,  841,  841,  841,  841,  841,  841,  866,
			  842,  260,  843,  844,  844,  844,  844,  844,  844,  866,
			  866,  842,  117,  843,  827,  827,  827,  827,  827,  827,
			  836,  842,  866,  843,  850,  850,  850,  850,  850,  850,

			  851,  851,  851,  851,  851,  859,  860,  859,  860,  842,
			  866,  843,  854,  854,  854,  854,  854,  854,  855,  855,
			  855,  855,  855,  855,  858,  858,  858,  858,  858,  858,
			  847,  847,  847,  847,  847,  847,  862,  862,  862,  862,
			  862,  862,  866,  866,  861,  863,  863,  863,  863,  863,
			  863,  864,  864,  864,  864,  864,  864,  859,  866,  859,
			  866,  866,  863,  863,  863,  863,  863,  863,  865,  865,
			  865,  865,  865,  865,  861,  861,  861,  861,  861,  861,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  861,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   98,   98,  866,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,  866,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,  100,  100,  866,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  116,  116,  116,  866,  866,  866,  866,  866,  866,  866,
			  116,  116,  116,  116,  866,  116,  116,  116,  116,  116,

			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  866,  866,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  148,
			  148,  866,  148,  148,  866,  148,  148,  148,  866,  866,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  866,  866,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  150,  150,  866,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,

			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  207,  207,  866,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  866,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,

			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  866,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  224,  866,  224,  866,  866,  866,  866,  224,
			  224,  866,  224,  224,  224,  866,  866,  224,  224,  224, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  866,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,

			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  238,  238,  866,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  103,  866,  866,
			  866,  866,  103,  103,  103,  866,  866,  103,  103,  103,

			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  866,  866,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  866,  253,  253,  253,  253,  253,  253,  253,

			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  261,  866,  866,  866,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  866,  866,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  237,  237,
			  237,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  237,  237,  237,  237,  237,  237,  237,  237,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  237,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  866,  866,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,

			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  491,  491,  491,  866,  866,  491,
			  491,  491,  491,  491,  491,  491,  491,  491,  491,  491,
			  491,  491,  491,  491,  491,  491,  491,  491,  491,  491,
			  491,  491,  866,  866,  491,  491,  491,  491,  491,  491,
			  491,  491,  491,  522,  866,  522,  866,  866,  866,  866,
			  522,  522,  866,  522,  522,  522,  866,  866,  522,  522,
			  522,  522,  522,  522,  522,  522,  522,  522,  522,  522,
			  522,  522,  522,  522,  522,  522,  522,  522,  522,  522,
			  522,  866,  866,  522,  522,  522,  522,  522,  522,  522,

			  522,  522,  433,  433,  433,  866,  866,  433,  433,  433,
			  433,  433,  433,  433,  433,  433,  866,  866,  433,  433,
			  433,  433,  433,  433,  433,  433,  433,  433,  433,  433,
			  433,  433,  433,  433,  433,  433,  433,  433,  433,  433,
			  433,  866,  866,  433,  433,  433,  433,  433,  433,  433,
			  433,  433,  600,  866,  600,  866,  866,  866,  866,  600,
			  600,  866,  600,  600,  600,  866,  866,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  866,  600,  600,  600,  600,  600,  600,  600,  600,  600,

			  600,  649,  649,  649,  649,  649,  649,  649,  649,  649,
			  866,  649,  649,  649,  649,  649,  649,  649,  649,  649,
			  649,  649,  649,  649,  649,  649,  649,  649,  649,  649,
			  649,  649,  649,  649,  649,  649,  649,  649,  649,  649,
			  649,  649,  649,  649,  649,  649,  649,  649,  649,  649,
			  649,  649,  649,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  866,  866,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  709,  709,  709,
			  866,  866,  709,  709,  709,  709,  709,  709,  709,  709,

			  709,  709,  709,  709,  709,  709,  709,  709,  709,  709,
			  709,  709,  709,  709,  709,  866,  866,  709,  709,  709,
			  709,  709,  709,  709,  709,  709,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  866,  866,  866,  866,  723,  723,  723,  866,  866,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  866,  866,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  772,  772,  772,  772,  772,  772,  772,

			  772,  772,  772,  772,  772,  772,  772,  772,  772,  772,
			  772,  772,  772,  772,  772,  772,  866,  866,  772,  772,
			  772,  772,  772,  772,  772,  772,  772,  790,  790,  790,
			  866,  866,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  866,  866,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  866,
			  866,  816,  816,  816,  816,  816,  816,  816,  816,  816, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  828,  828,  828,  866,  866,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  866,  866,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,   11,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,

			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866, yy_Dummy>>,
			1, 132, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6131)
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
			    1,    1,    1,    3,    5,    6,    9,    3,    4,   10,

			   18,   13,    4,   13,   13,   25,  600,   25,   25,   25,
			   25,   25,   25,   27,   92,   27,  149,   27,   27,   27,
			   27,   27,   27,   38,   38,   57,   38,   58,   76,   57,
			  156,    5,    6,   28,   57,   28,  157,   28,   28,   28,
			   28,   28,   28,   61,    3,   18,   61,   38,  204,    4,
			  843,    9,  149,   57,   10,   58,   27,   57,  156,  600,
			    5,    6,   57,   74,  157,   74,   74,  149,  842,   92,
			   95,   61,   95,   95,   61,   76,   28,  204,    3,    3,
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
			   35,   35,  158,   35,   36,   36,  209,   36,  209,  209,
			   37,   37,   78,   37,   63,  821,  228,   64,   63,  228,

			   39,   39,  820,   39,   35,   64,   43,   43,   36,   43,
			  158,  807,   82,   35,   37,   69,   36,   35,   37,   35,
			   87,  780,   63,   87,   39,   64,   63,   37,   40,   40,
			   43,   40,   69,   64,   43,   41,   41,   39,   41,   44,
			   44,   35,   44,   69,   36,   35,   37,   35,   39,   82,
			   42,   42,   40,   42,  164,   37,   40,   45,   45,   41,
			   45,   69,   43,   44,  166,   39,   48,   48,   40,   48,
			   41,  167,   78,   87,   42,   59,   77,   39,   82,   44,
			   59,   45,  164,  230,   40,  170,  230,   45,   42,   42,
			   48,   59,  166,   65,   42,   65,   40,  769,   41,  167,

			   45,   47,   47,   59,   47,   48,   65,   44,   59,  174,
			   48,   49,   49,  170,   49,   45,   42,   42,  736,   80,
			   59,   65,   42,   65,  247,   47,  247,  247,   45,   46,
			   46,  175,   46,   48,   65,   49,   47,  174,   48,  355,
			   84,  486,  486,  723,   47,   46,   46,   46,   46,   46,
			   46,   49,   79,   46,   77,   77,   77,   60,   81,  175,
			   46,   60,   50,   50,   47,   50,  709,   46,  355,   60,
			  115,  115,   47,  115,   46,   62,   46,   84,   46,   49,
			  180,   62,   62,  702,   67,   60,   50,   62,   46,   60,
			   66,   67,   68,   66,  115,   46,   67,   60,   80,   80,

			   68,   66,  490,   62,  435,   46,   84,   46,  180,   62,
			   62,   50,   67,  222,  430,   62,  695,  430,   66,   67,
			   68,   66,  116,  116,   67,  116,  777,  671,   68,   66,
			   79,   79,   79,  435,  670,  116,   81,   81,   81,  181,
			   50,   55,   89,  490,   55,   89,  116,  159,  152,   55,
			  222,  152,  213,  669,   89,   89,  152,   55,   55,   55,
			   55,   55,   55,   55,  186,   89,  159,  181,  777,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,  186,  668,  159,   89,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   56,   90,  520,   56,   90,  520,  179,  645,   56,  592,
			  213,  213,  213,   90,  526,  179,   56,   56,   56,   56,
			   56,   56,   56,  188,   90,  179,  231,  501,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,  188,  491,  179,   90,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   93,

			   93,  231,   93,  790,  790,  102,  108,  108,  108,  108,
			  108,  108,  822,  358,  102,  102,  102,  102,  102,  102,
			  822,  223,  828,  828,  223,   93,  479,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			  102,  106,  106,  106,  106,  106,  106,  109,  109,  109,
			  109,  109,  109,  190,  171,  102,  191,  106,  194,  102,
			  171,  102,  195,  109,  223,  128,  128,  110,  128,  110,
			   93,  110,  110,  110,  110,  110,  110,  110,  128,  473,
			  106,  190,  171,  358,  191,  106,  194,  128,  171,  128,

			  195,  109,  111,  111,  111,  111,  111,  111,  112,  199,
			  112,  394,  112,  112,  112,  112,  112,  112,  118,  118,
			  110,  118,  119,  119,  370,  119,  120,  120,  365,  120,
			  196,  118,  202,  201,  198,  119,  349,  199,  198,  120,
			  121,  121,  118,  121,  368,  368,  119,  368,  326,  196,
			  120,  112,  201,  121,  304,  122,  122,  120,  122,  119,
			  202,  300,  198,  118,  121,  163,  198,  197,  122,  123,
			  123,  524,  123,  121,  524,  124,  124,  196,  124,  122,
			  201,  261,  123,  163,  163,  120,  197,  119,  124,  127,
			  127,  118,  127,  123,  125,  125,  524,  125,  122,  124,

			  197,  121,  127,  126,  126,  245,  126,  125,  244,  123,
			  162,  163,  163,  127,  197,  243,  126,  783,  125,  124,
			  129,  129,  169,  129,  125,  242,  122,  126,  197,  162,
			  125,  240,  127,  129,  162,  130,  130,  123,  130,  235,
			  126,  169,  131,  131,  129,  131,  783,  124,  130,  169,
			  132,  132,  125,  132,  217,  131,  305,  162,  125,  130,
			  127,  129,  162,  132,  226,  130,  131,  172,  126,  169,
			  133,  133,  306,  133,  132,  134,  134,  169,  134,  135,
			  135,  219,  135,  133,  305,  200,  172,  787,  134,  129,
			  220,  217,  135,  130,  133,  132,  207,  131,  172,  134, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  306,  182,  161,  135,  200,  134,  137,  137,  200,  137,
			  135,  313,  200,  178,  172,  133,  787,  155,  219,  137,
			  217,  161,  315,  132,  138,  138,  172,  138,  140,  140,
			  137,  140,  200,  134,  161,  310,  200,  138,  135,  313,
			  200,  140,  779,  133,  136,  136,  136,  219,  138,  161,
			  315,  137,  140,  779,  310,  138,  165,  316,  153,  140,
			  319,  813,  161,  136,  320,  145,  145,  136,  145,  138,
			  136,  138,  150,  140,  214,  165,  165,  136,  145,  136,
			  215,  136,  310,  138,  779,  316,  168,  140,  319,  145,
			  813,  136,  320,  143,  143,  136,  143,  145,  136,  604,

			  138,  148,  604,  165,  165,  168,  143,  604,  136,  105,
			  136,  139,  139,  321,  139,  141,  168,  143,  141,  141,
			  141,  141,  141,  141,  139,  145,  184,  139,  139,  139,
			  139,  139,  139,  168,  104,  139,  325,  142,  142,  143,
			  142,  321,  330,  184,  168,  184,  139,  141,  103,  139,
			  142,  141,  214,  214,  214,  139,  100,  273,  215,  215,
			  215,  142,  144,  144,  325,  144,  176,  143,  273,  142,
			  330,  184,  142,  184,  139,  144,  173,  139,  273,   98,
			  141,  146,  146,  139,  146,  176,  144,   96,  147,  147,
			  176,  147,  331,  173,  146,  173,  273,  142,  144,  173,

			  142,  147,  144,  160,  160,  146,  160,  160,  160,  160,
			  160,  160,  147,  176,  177,  183,  185,  187,  176,  212,
			  331,  173,  160,  173,  146,  332,  144,  173,  189,  216,
			  144,   88,   85,  177,  183,  185,  187,  147,  192,   73,
			  312,   70,  224,  183,  177,  224,  335,  189,   54,  187,
			  160,  193,  146,  332,  224,  192,  339,  192,  185,  312,
			  189,  177,  183,  185,  187,  224,  147,  154,  340,  193,
			  193,  183,  177,   51,  335,  189,  154,  187,  343,  236,
			  236,   33,  236,  192,  339,  192,  154,  312,  189,  251,
			  251,  251,  251,  251,  251,  224,  340,  193,  193,   31,

			  212,  212,  212,  212,  212,  236,  343,  216,  216,  216,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  203,  205,  227,   26,   24,  227,  241,
			  241,  241,  241,  241,  241,  241,   16,  227,  246,  246,
			   15,  246,  203,  205,  369,  369,   14,  369,  227,  250,
			   11,  250,  344,  203,  250,  250,  250,  250,  250,  250,
			  205,    0,  246,  252,  252,  252,  252,  252,  252,    0,
			  203,  205,  257,  257,  257,  257,  257,  255,  227,  255,
			  344,  203,  255,  255,  255,  255,  255,  255,    0,  205,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  232,  232,    0,  232,  258,  258,  258,  258,

			  258,  258,  281,  281,  281,  281,  281,  281,  284,  284,
			  284,  284,  284,  284,  703,  703,  703,  703,  232,    0,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  249,  249,  249,  249,  249,  249,  254,
			  254,  254,  254,  254,  254,  603,  317,  347,  603,  249,
			    0,    0,  256,    0,  256,  254,  256,  256,  256,  256,
			  256,  256,    0,  232,  317,  317,  262,  262,  322,  262,
			  603,  348,  249,  263,  263,  347,  263,  249,  254,  262,
			    0,  264,  264,  254,  264,  357,  263,  322,  265,  265,

			  262,  265,  317,  317,  264,  256,  360,  263,  262,  348,
			    0,  265,    0,  266,  266,  264,  266,  267,  267,    0,
			  267,    0,  265,  263,  338,  322,  266,  788,  788,  788,
			  267,    0,  268,  268,  434,  268,  262,  266,  265,  269,
			  269,  267,  269,  338,  266,  268,  270,  270,    0,  270,
			    0,  263,  269,    0,  271,  271,  268,  271,    0,  270,
			  318,  267,  434,  269,  268,    0,  265,  271,    0,  323,
			  270,  338,  266,  357,  357,  357,  269,    0,  271,  318,
			  438,  272,  272,  440,  272,  360,  360,  342,  323,  267,
			  270,  318,  268,  323,  272,  359,  274,  274,  271,  274,

			  275,  275,    0,  275,  269,  272,  342,  318,  438,  274,
			    0,  440,  441,  275,  276,  276,  323,  276,  270,  318,
			  274,  323,  277,  277,  275,  277,  271,  276,  445,  278,
			  278,  329,  278,  274,  342,  277,  272,  275,  276,  324,
			  441,  446,  278,  329,  279,  279,  277,  279,    0,    0,
			  276,    0,  277,  278,  329,    0,  445,  279,  324,  280,
			  280,  274,  280,    0,  329,  275,  346,    0,  279,  446,
			  324,  450,  280,  359,  359,  359,  282,  282,  276,  282,
			  277,    0,  329,  280,    0,  346,  324,  451,    0,  282,
			  279,  280,  282,  282,  282,  282,  282,  282,  324,  450,

			  282,  283,  283,  283,  283,  283,  283,  285,  285,  285,
			  285,  285,  285,  346,  288,  451,  288,  405,  279,  280,
			    0,  282,  286,  286,  286,  286,  286,  286,  405,    0,
			  283,  287,  287,  287,  287,  287,  287,  288,  405,    0,
			  288,    0,  453,  336,  328,  333,  288,  289,  289,  289,
			  289,  289,  289,    0,  290,  290,  405,  290,  291,  291,
			  336,  291,  336,  328,  333,  288,  289,  290,  288,  333,
			  453,  291,  292,  292,  288,  292,  294,  294,  290,  294,
			  293,  293,  291,  293,  454,  292,  328,    0,  336,  294,
			  336,  328,  333,  293,  289,    0,  292,  333,  290,  345,

			  294,    0,  293,  352,  293,    0,  295,  295,  294,  295,
			    0,  292,  454,  311,  296,  296,    0,  296,  345,  295,
			  297,  297,  352,  297,  314,  345,  290,  296,  298,  298,
			  295,  298,  311,  297,  299,  299,  294,  299,  296,  292,
			  311,  298,  455,  314,  297,  352,  345,  299,  295,  458,
			  352,  314,  298,  345,  460,    0,    0,  296,  299,  301,
			  311,  301,  301,  301,  301,  301,  301,  301,  311,    0,
			  455,  314,    0,    0,    0,  297,  295,  458,    0,  314,
			    0,    0,  460,  299,  302,  296,  302,  302,  302,  302,
			  302,  302,  302,  308,  327,  308,  308,  308,  308,  308, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  308,  309,  334,  309,  309,  309,  309,  309,  309,  341,
			  350,  354,  299,  327,  351,  356,  361,  371,  371,  362,
			  371,  334,  363,    0,  461,  327,  334,  468,  341,  350,
			  354,  443,  469,  351,  356,  400,  400,  414,  400,  350,
			  414,  327,  341,  371,  351,  529,  414,    0,  400,  334,
			  443,  356,  461,  327,  334,  468,  341,  350,  354,  400,
			  469,  351,  356,  366,  366,  414,  366,  350,  414,    0,
			  341,    0,  351,  529,  414,  366,    0,    0,  443,    0,
			  356,  572,  572,  572,  572,  572,  366,  374,  374,  374,
			  374,  374,  374,  374,  361,  361,  361,  362,  362,  362,

			  363,  363,  363,  380,  380,  380,  380,  380,  380,  381,
			  381,  381,  381,  381,  381,  531,  366,  532,  535,  380,
			  382,  382,  382,  382,  382,  382,  383,  383,  383,  383,
			  383,  383,  384,  384,  384,  384,  384,  384,  442,  447,
			    0,    0,  380,  531,  452,  532,  535,  380,  385,  385,
			  385,  385,  385,  385,    0,  540,  542,  442,  447,  382,
			  386,  442,  386,  452,  385,  386,  386,  386,  386,  386,
			  386,  387,  387,  387,  387,  387,  387,  388,  388,  388,
			  388,  388,  388,  540,  542,  442,  447,  385,    0,  442,
			    0,  452,  385,  389,  389,  389,  389,  389,  389,  390,

			  390,    0,  390,  390,  390,  390,  390,  390,  391,  391,
			  391,  391,  391,  391,  392,  392,  392,  392,  392,  392,
			  395,  395,    0,  395,  396,  396,    0,  396,    0,  424,
			    0,  521,  389,  395,  521,  436,  543,  396,  397,  397,
			  424,  397,  398,  398,  395,  398,  547,    0,  396,    0,
			  424,  397,    0,    0,  436,  398,  399,  399,  437,  399,
			  456,    0,  397,  395,  543,  436,  398,    0,  424,  399,
			    0,  396,  401,  401,  547,  401,  449,  437,  398,  456,
			  399,  397,  436,  456,  521,  401,  402,  402,  399,  402,
			    0,  395,  437,  436,    0,  449,  401,    0,  466,  402,

			  396,  403,  403,    0,  403,  437,  398,  456,  449,  397,
			  402,  456,  549,    0,  403,    0,  399,  466,  401,  404,
			  404,  437,  404,  449,    0,  403,  406,  406,    0,  406,
			  459,  402,  404,  403,  439,  550,  449,    0,  448,  406,
			  549,  407,  407,  404,  407,  466,  401,  404,  467,  459,
			  406,    0,  459,  439,  407,  408,  408,  448,  408,  402,
			    0,  403,  406,  550,  439,  407,    0,  467,  408,  409,
			  409,  448,  409,  410,  410,  404,  410,  459,    0,  408,
			  459,  439,  409,  553,    0,  448,  410,  407,  411,  411,
			  406,  411,  439,  409,  408,  467,    0,  410,    0,  448,

			    0,  411,    0,    0,  409,  412,  412,  412,  412,  412,
			  412,  553,  411,  470,  554,  407,  410,  413,    0,  413,
			    0,  415,  408,  415,  470,  415,  415,  415,  415,  415,
			  415,  411,  409,  412,  416,  416,  416,  416,  416,  416,
			  413,  470,  554,  413,  410,  422,  422,  415,  422,    0,
			  413,    0,  470,  489,  415,  489,  416,    0,  422,  411,
			    0,  412,    0,    0,  489,  555,    0,  416,  413,  422,
			    0,  413,    0,    0,    0,  415,  417,  417,  417,  417,
			  417,  417,    0,  514,  416,  418,  418,  418,  418,  418,
			  418,  417,  489,  555,  514,    0,  416,  419,  419,  419,

			  419,  419,  419,    0,  514,  417,  420,  420,  420,  420,
			  420,  420,  421,  421,  421,  421,  421,  421,  418,  417,
			  423,  423,  514,  423,  425,  425,    0,  425,  522,  426,
			  426,  522,  426,  423,    0,  420,    0,  425,    0,    0,
			  556,  421,  426,  605,  423,    0,  562,  418,  425,  427,
			  427,    0,  427,  426,  428,  428,  608,  428,  457,    0,
			  462,  612,  427,  429,  429,    0,  429,  428,  556,  562,
			    0,  605,    0,  427,  562,  426,  429,  457,  428,  462,
			  427,  522,  428,  472,  608,    0,    0,  429,    0,  612,
			  462,  457,  431,  428,  431,  431,  431,  431,  431,  431,

			  431,  472,  472,  426,  463,  457,  471,  462,  427,  432,
			  428,  432,  432,  432,  432,  432,  432,  432,  462,  457,
			    0,  428,  474,  463,  613,  471,    0,    0,  618,  472,
			  472,  431,  619,    0,  463,  527,  530,  492,  492,  471,
			  492,  474,  475,  475,  475,  475,  475,  475,  432,    0,
			  492,  463,  613,  471,  527,  530,  618,  620,  475,    0,
			  619,  492,  463,    0,    0,  623,    0,  471,    0,  474,
			  476,  476,  476,  476,  476,  476,  477,  477,  477,  477,
			  477,  477,  527,  530,    0,  620,  475,  478,  478,  478,
			  478,  478,  478,  623,  480,  480,  480,  480,  480,  480,

			  481,  481,  481,  481,  481,  481,    0,    0,    0,  476,
			  480,  482,  482,  482,  482,  482,  482,  483,  483,  483,
			  483,  483,  483,  484,  484,  484,  484,  484,  484,  625,
			    0,  626,  630,  480,  493,  493,  536,  493,  480,  485,
			  485,  485,  485,  485,  485,    0,  528,  493,  536,    0,
			  482,  487,  487,  487,  487,  487,  487,  625,  493,  626,
			  630,    0,  484,    0,  536,  528,  488,  487,  488,  488,
			  488,  488,  488,  488,  494,  494,  536,  494,  495,  495,
			    0,  495,    0,  496,  496,    0,  496,  494,  528,  493,
			    0,  495,    0,  528,    0,  487,  496,    0,  494,  519,

			  497,  497,  495,  497,    0,    0,  494,  496,  498,  498,
			  519,  498,  584,  497,  496,  499,  499,  495,  499,    0,
			  519,  498,  502,  502,  497,  502,    0,    0,  499,  584,
			  541,  497,  498,  584,  494,  502,  545,  631,  519,  499,
			  498,    0,  496,    0,    0,  495,  502,  500,  500,  541,
			  500,    0,  498,  632,  502,  545,    0,  584,    0,  497,
			  500,  503,  503,    0,  503,  631,  504,  504,  498,  504,
			    0,  500,  538,  673,  503,  505,  505,  541,  505,  504,
			  498,  632,  502,  545,  500,  503,  534,  674,  505,    0,
			  504,  538,  503,  506,  506,    0,  506,  507,  507,  505,

			  507,  673,  677,  538,  534,  534,  506,  505,    0,    0,
			  507,    0,  500,    0,    0,  674,    0,  506,    0,  538,
			  503,  507,  509,  509,  509,  509,  509,  509,    0,  507,
			  677,  538,  534,  534,  548,  505,  506,  510,  510,  510,
			  510,  510,  510,  511,  511,  511,  511,  511,  511,    0,
			    0,  509,    0,  548,  512,  687,  512,  507,  512,  512,
			  512,  512,  512,  512,  506,  515,  515,  658,  515,    0,
			  691,  511,  513,  513,  513,  513,  513,  513,  515,    0,
			  512,  548,    0,  687,  658,  537,  512,  512,  658,  515,
			    0,    0,  516,  516,  513,  516,  551,  515,  691,  511, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  533,    0,  537,  537,  516,  517,  517,  512,  517,
			  518,  518,  658,  518,  512,  551,  516,  546,  552,  517,
			  533,  557,  513,  518,  516,  515,  551,  533,  558,    0,
			  517,  537,  537,    0,  518,  546,  546,  552,  692,  642,
			  557,    0,    0,  551,    0,    0,    0,  558,  533,  517,
			  518,  559,  516,  559,  551,  533,  559,  559,  559,  559,
			  559,  559,  642,  546,  546,  552,  692,  642,  557,  560,
			  560,  560,  560,  560,  560,  558,    0,  517,  518,  561,
			  561,  561,  561,  561,  561,  563,  563,  563,  563,  563,
			  563,  564,  564,  564,  564,  564,  564,    0,    0,  693,

			  724,  563,  565,  565,  565,  565,  565,  565,  560,  566,
			  566,  566,  566,  566,  566,  567,  567,  567,  567,  567,
			  567,  568,  568,  568,  568,  568,  568,  693,  724,  563,
			  564,  569,  569,  569,  569,  569,  569,  570,    0,  570,
			    0,    0,  570,  570,  570,  570,  570,  570,  571,  571,
			  571,  571,  571,  571,  567,  574,  574,  574,  574,  574,
			  574,  576,  576,    0,  576,    0,  577,  577,  607,  577,
			    0,  574,  611,    0,  576,  597,    0,  598,    0,  577,
			  578,  578,    0,  578,    0,  576,  597,  607,  598,  576,
			  577,  611,    0,  578,  579,  579,  597,  579,  598,  574,

			  580,  580,  725,  580,  578,    0,  664,  579,  578,  581,
			  581,    0,  581,  580,  597,  607,  598,  576,  579,  611,
			  599,    0,  581,  664,  580,  582,  582,  664,  582,  727,
			  725,  599,  580,  581,  583,  583,  578,  583,  582,  585,
			  585,  599,  585,  586,  586,    0,  586,  583,  581,  582,
			    0,  664,  585,  729,  615,    0,  586,  727,  583,  599,
			  580,  587,  587,  585,  587,  588,  588,  586,  588,  589,
			  589,  583,  589,  615,  587,  586,  581,    0,  588,    0,
			    0,  729,  589,  585,    0,  587,    0,    0,    0,  588,
			    0,    0,  731,  589,    0,    0,    0,  588,    0,  583,

			  589,  615,    0,  586,    0,  587,  593,  593,  590,  593,
			  590,  585,  590,  590,  590,  590,  590,  590,  616,  593,
			  731,  594,  594,  617,  594,  588,  595,  595,  589,  595,
			  593,    0,  610,  587,  594,  596,  596,  616,  596,  595,
			    0,  590,  617,  621,  616,  594,    0,  610,  596,  622,
			  595,  610,  624,  732,  627,    0,  595,    0,  628,  596,
			    0,  633,  621,  634,  594,  616,  596,  758,  622,  759,
			  617,  624,  616,  627,  621,  610,  628,  628,  763,  610,
			  633,  732,  634,  624,  595,  655,  655,    0,  655,    0,
			  621,  766,  594,  634,  596,  758,  622,  759,  655,  624,

			    0,  627,  621,    0,  628,  628,  763,  782,  633,  655,
			  634,  624,  635,  635,  635,  635,  635,  635,  785,  766,
			  798,  634,  636,  636,  636,  636,  636,  636,  637,  637,
			  637,  637,  637,  637,  638,  782,  638,    0,    0,  638,
			  638,  638,  638,  638,  638,  639,  785,  639,  798,    0,
			  639,  639,  639,  639,  639,  639,  640,  640,  640,  640,
			  640,  640,  641,  641,  641,  641,  641,  641,  643,  643,
			  643,  643,  643,  643,  644,  644,  644,  644,  644,  644,
			  646,  646,  646,  646,  646,  646,  647,  647,  647,  647,
			  647,  647,    0,    0,    0,  640,  648,  648,  648,  648,

			  648,  648,  650,  650,  650,  650,  650,  650,  757,  757,
			  803,  757,  653,  653,  651,  653,  651,    0,  650,  651,
			  651,  651,  651,  651,  651,  653,  654,  654,    0,  654,
			  656,  656,  757,  656,  657,  657,  653,  657,  803,  654,
			    0,  650,  814,  656,    0,  678,  650,  657,  659,  659,
			  654,  659,  683,    0,  656,  653,  660,  660,  657,  660,
			  656,  659,  823,  654,  678,  661,  661,    0,  661,  660,
			  814,  683,  659,  662,  662,    0,  662,    0,  661,    0,
			  660,  663,  663,  653,  663,  675,  662,    0,  656,  661,
			  823,  654,  678,    0,  663,  665,  665,  662,  665,  683,

			  666,  666,  684,  666,  675,  663,  679,  686,  665,  675,
			  689,  690,  662,  666,  694,  667,  667,  715,  667,  665,
			  815,  684,  815,  679,  666,  679,  686,  665,  667,  689,
			  690,  815,  675,  694,  715,  666,  689,  675,  715,  667,
			  662,  696,  696,  696,  696,  696,  696,  667,    0,  684,
			    0,  679,    0,  679,  686,  665,    0,  689,  690,  815,
			    0,  694,  715,  666,  689,  697,  697,  697,  697,  697,
			  697,    0,    0,  833,    0,  667,  698,  698,  698,  698,
			  698,  698,  699,  699,  699,  699,  699,  699,  700,  700,
			  700,  700,  700,  700,  704,  704,  704,  704,  704,  704,

			  701,  833,  701,    0,  697,  701,  701,  701,  701,  701,
			  701,  705,  705,  705,  705,  706,  706,  706,  706,  706,
			  706,  707,  707,  707,  707,  707,  707,  710,  710,  726,
			  710,  706,  708,  708,  708,  708,  708,  708,    0,    0,
			  710,    0,  711,  711,    0,  711,    0,    0,  726,    0,
			  705,  710,  726,    0,  706,  711,    0,  710,  719,  706,
			  712,  712,  719,  712,  714,  714,  711,  714,    0,  716,
			  716,  708,  716,  712,    0,    0,  726,  714,  711,  719,
			  726,    0,  716,  728,  712,  710,  717,  717,  714,  717,
			  719,    0,  712,  716,  714,  718,  718,  730,  718,  717,

			  716,    0,  728,  720,    0,  721,  711,  720,  718,  721,
			  717,  722,    0,  753,  730,  722,  730,  753,  717,  718,
			  712,  734,  714,    0,  720,    0,  721,  841,  716,  841,
			  728,    0,  722,    0,  753,  720,    0,  721,  841,  734,
			  734,    0,  730,  722,  730,  753,  717,  735,  735,  735,
			  735,  735,  735,  737,  737,  737,  737,  737,  737,  738,
			  738,  738,  738,  738,  738,    0,  841,  734,  734,  739,
			  739,  739,  739,  739,  739,  740,  740,  740,  740,  740,
			  740,  817,  817,  817,  817,  817,  735,  741,  741,  741,
			  741,  741,  741,  826,  826,  826,  826,  826,  738,  742,

			  742,  742,  742,  742,  742,  744,  744,  744,  744,  744,
			  744,  746,  746,  754,  746,  747,  747,  754,  747,  748,
			  748,  755,  748,    0,  746,  755,    0,  756,  747,    0,
			  760,  756,  748,    0,  754,  746,    0,  749,  749,  747,
			  749,    0,  755,  748,  744,  754,  746,  762,  756,  760,
			  749,  751,  751,  755,  751,  752,  752,  764,  752,  756,
			  747,  749,  760,  767,  751,    0,  762,    0,  752,  749,
			  795,    0,  796,    0,  746,  751,  764,  760,  795,  752,
			  796,    0,  767,  775,  775,    0,  775,    0,  747,    0,
			  760,  795,    0,  796,  762,    0,  775,  749,    0,    0, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  752,    0,    0,    0,  764,    0,  795,  775,  796,    0,
			  767,  768,  768,  768,  768,  768,  768,  770,  770,  770,
			  770,  770,  770,  786,  771,    0,  771,  775,  752,  771,
			  771,  771,  771,  771,  771,  773,  773,  784,  773,    0,
			  774,  774,  786,  774,  776,  776,    0,  776,  773,    0,
			  768,  831,  800,  774,  786,  775,  784,  776,    0,  773,
			    0,    0,  831,  771,  774,    0,  848,  773,  776,    0,
			  786,  800,  831,  784,  789,  789,  789,  789,  789,  789,
			    0,    0,  786,  848,  784,  791,  791,  848,  791,  774,
			  831,  792,  792,  776,  792,  773,    0,  802,  791,  800,

			  793,  793,  784,  793,  792,    0,  797,  794,  794,  791,
			  794,  848,    0,  793,    0,  792,  802,    0,  774,  797,
			  794,  849,  776,    0,  793,    0,  852,  797,    0,    0,
			  791,  794,  804,  804,  804,  804,  804,  804,  849,    0,
			  797,    0,  849,  852,  802,    0,    0,  852,  794,  805,
			  805,  805,  805,  805,  805,  797,  808,  808,  791,  808,
			  809,  809,  810,  809,  811,  812,  849,    0,    0,  808,
			  810,  852,  811,  809,    0,    0,  794,    0,  812,    0,
			  808,    0,    0,  810,  809,  811,  812,  853,  818,  818,
			    0,  818,  809,  819,  819,    0,  819,    0,  810,  812,

			  811,  818,    0,    0,  853,  808,  819,  832,  853,    0,
			    0,    0,  818,    0,  812,    0,    0,  819,  832,    0,
			  809,  825,  825,  825,  825,  825,  825,    0,  832,  818,
			  830,  830,  853,  830,  808,  829,  829,  829,  829,  829,
			  829,    0,    0,  830,    0,    0,  832,  834,  834,  834,
			  834,  834,  834,    0,  830,    0,    0,  818,  836,  836,
			    0,  836,  830,  835,  835,  835,  835,  835,  835,    0,
			  837,  836,  838,  840,  840,  840,  840,  840,  840,    0,
			    0,  837,  836,  838,  844,  844,  844,  844,  844,  844,
			  830,  837,    0,  838,  845,  845,  845,  845,  845,  845,

			  846,  846,  846,  846,  846,  855,  855,  855,  855,  837,
			    0,  838,  850,  850,  850,  850,  850,  850,  851,  851,
			  851,  851,  851,  851,  854,  854,  854,  854,  854,  854,
			  858,  858,  858,  858,  858,  858,  859,  859,  859,  859,
			  859,  859,    0,    0,  855,  860,  860,  860,  860,  860,
			  860,  862,  862,  862,  862,  862,  862,  863,    0,  863,
			    0,    0,  863,  863,  863,  863,  863,  863,  864,  864,
			  864,  864,  864,  864,  865,  865,  865,  865,  865,  865,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  863,  867,  867,  867,

			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  868,  868,

			  868,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  870,  870,    0,  870,  870,  870,  870,
			  870,  870,  870,  870,  870,  870,  870,  870,  870,  870,
			  870,  870,  870,  870,  870,  870,  870,  870,  870,  870,
			  870,  870,  870,  870,  870,  870,  870,  870,  870,  870,
			  870,  870,    0,  870,  870,  870,  870,  870,  870,  870,

			  870,  870,  870,  870,  870,  871,  871,    0,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  872,  872,  872,
			  872,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			  872,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			  873,  873,  873,    0,    0,    0,    0,    0,    0,    0,
			  873,  873,  873,  873,    0,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,    0,    0,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  874,
			  874,    0,  874,  874,    0,  874,  874,  874,    0,    0,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,    0,    0,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  875,  875,    0,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,

			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  876,  876,    0,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,    0,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,

			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			    0,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  879,    0,  879,    0,    0,    0,    0,  879,
			  879,    0,  879,  879,  879,    0,    0,  879,  879,  879, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			    0,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,

			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  882,  882,    0,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  883,    0,    0,
			    0,    0,  883,  883,  883,    0,    0,  883,  883,  883,

			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			    0,    0,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,    0,  885,  885,  885,  885,  885,  885,  885,

			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  886,    0,    0,    0,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,    0,    0,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  887,  887,
			  887,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  887,  887,  887,  887,  887,  887,  887,  887,

			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  887,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,    0,    0,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,

			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  890,  890,  890,    0,    0,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,    0,    0,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  891,    0,  891,    0,    0,    0,    0,
			  891,  891,    0,  891,  891,  891,    0,    0,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,    0,    0,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  892,  892,  892,    0,    0,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,    0,    0,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,    0,    0,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  893,    0,  893,    0,    0,    0,    0,  893,
			  893,    0,  893,  893,  893,    0,    0,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			    0,  893,  893,  893,  893,  893,  893,  893,  893,  893,

			  893,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			    0,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,    0,    0,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  896,  896,  896,
			    0,    0,  896,  896,  896,  896,  896,  896,  896,  896,

			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,    0,    0,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  898,
			    0,    0,    0,    0,  898,  898,  898,    0,    0,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,    0,    0,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,    0,    0,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  900,  900,  900,
			    0,    0,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,    0,    0,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,    0,
			    0,  901,  901,  901,  901,  901,  901,  901,  901,  901, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  902,  902,  902,    0,    0,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,    0,    0,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,

			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866, yy_Dummy>>,
			1, 132, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   78,  187,    0,   68,
			   71, 1360, 6039,   99, 1353, 1323, 1339, 6039,   91,    0,
			 6039, 6039, 6039, 6039, 1322,   89, 1319,   99,  119, 6039,
			 6039, 1272, 6039, 1254, 6039,  278,  282,  288,  121,  298,
			  326,  333,  348,  304,  337,  355,  427,  399,  364,  409,
			  460, 1215, 6039, 6039, 1192,  539,  618,   95,   93,  341,
			  427,  109,  441,  264,  263,  361,  456,  450,  458,  281,
			 1224, 6039, 6039, 1232,  161, 6039,  121,  369,  285,  445,
			  412,  451,  295, 6039,  423, 1178, 6039,  318, 1228,  540,
			  619, 6039,   86,  697, 6039,  168, 1184, 6039, 1172, 6039,

			 1147,    0,  696, 1137, 1131, 1093,  733, 6039,  688,  739,
			  763,  784,  794, 6039, 6039,  468,  520,    0,  816,  820,
			  824,  838,  853,  867,  873,  892,  901,  887,  773,  918,
			  933,  940,  948,  968,  973,  977, 1030, 1004, 1022, 1109,
			 1026, 1100, 1135, 1091, 1160, 1063, 1179, 1186, 1077,   92,
			 1016, 6039,  546, 1047, 1252, 1000,   83,   97,  249,  532,
			 1188,  987,  895,  850,  319, 1041,  319,  329, 1071,  907,
			  339,  732,  952, 1161,  370,  386, 1151, 1199,  989,  611,
			  437,  507,  944, 1200, 1111, 1201,  517, 1202,  596, 1213,
			  731,  733, 1223, 1236,  734,  724,  815,  852,  796,  775,

			  970,  818,  787, 1318,   97, 1319, 6039,  989, 6039,  284,
			 6039, 6039, 1212,  545, 1067, 1073, 1222,  937, 6039,  964,
			  936, 6039,  496,  719, 1240, 6039,  961, 1333,  294, 1399,
			  381,  618, 1490, 6039, 6039,  911, 1277, 6039, 6039, 6039,
			  922, 1322,  916,  906,  899,  896, 1346,  422, 6039, 1525,
			 1346, 1271, 1355, 6039, 1531, 1374, 1548, 1364, 1478, 6039,
			    0,  853, 1574, 1581, 1589, 1596, 1611, 1615, 1630, 1637,
			 1644, 1652, 1679, 1128, 1694, 1698, 1712, 1720, 1727, 1742,
			 1757, 1484, 1774, 1783, 1490, 1789, 1804, 1813, 1800, 1829,
			 1852, 1856, 1870, 1878, 1874, 1904, 1912, 1918, 1926, 1932,

			  837, 1943, 1968, 6039,  837,  922,  930,    0, 1977, 1985,
			 1020, 1898, 1225,  969, 1909,  989, 1011, 1541, 1645, 1026,
			 1025, 1067, 1563, 1654, 1724, 1090,  791, 1979, 1829, 1714,
			 1103, 1153, 1187, 1830, 1987, 1214, 1828,    0, 1609, 1208,
			 1234, 1994, 1672, 1237, 1328, 1884, 1751, 1513, 1536,  779,
			 1995, 1999, 1888,    0, 1996,  388, 2000, 1588,  706, 1688,
			 1599, 2009, 2012, 2015, 6039,  825, 2061, 6039,  842, 1352,
			  821, 2015, 6039, 6039, 2070, 6039, 6039, 6039, 6039, 6039,
			 2085, 2091, 2102, 2108, 2114, 2130, 2147, 2153, 2159, 2175,
			 2184, 2190, 2196,    0,  783, 2218, 2222, 2236, 2240, 2254,

			 2033, 2270, 2284, 2299, 2317, 1788, 2324, 2339, 2353, 2367,
			 2371, 2386, 2387, 2403, 2000, 2407, 2416, 2458, 2467, 2479,
			 2488, 2494, 2443, 2518, 2200, 2522, 2527, 2547, 2552, 2561,
			  512, 2576, 2593,    0, 1589,  455, 2220, 2243, 1635, 2319,
			 1645, 1678, 2123, 2016,    0, 1680, 1694, 2124, 2323, 2261,
			 1737, 1757, 2129, 1804, 1836, 1901, 2245, 2543, 1912, 2315,
			 1909, 1979, 2545, 2589,    0,    0, 2283, 2333, 1979, 1999,
			 2383, 2591, 2568,  774, 2607, 2624, 2652, 2658, 2669,  712,
			 2676, 2682, 2693, 2699, 2705, 2721,  423, 2733, 2750, 2440,
			  486,  657, 2635, 2732, 2772, 2776, 2781, 2798, 2806, 2813,

			 2845,  623, 2820, 2859, 2864, 2873, 2891, 2895, 6039, 2904,
			 2919, 2925, 2940, 2954, 2454, 2963, 2990, 3004, 3008, 2770,
			  620, 2229, 2526, 6039,  869,    0,  577, 2620, 2731, 2011,
			 2621, 2074, 2084, 2986, 2871, 2085, 2702, 2970, 2857,    0,
			 2116, 2815, 2122, 2203,    0, 2821, 3002, 2212, 2919, 2267,
			 2301, 2981, 3003, 2349, 2380, 2420, 2498, 3006, 3013, 3038,
			 3051, 3061, 2512, 3067, 3073, 3084, 3091, 3097, 3103, 3113,
			 3124, 3130, 2063, 6039, 3137,    0, 3159, 3164, 3178, 3192,
			 3198, 3207, 3223, 3232, 2783, 3237, 3241, 3259, 3263, 3267,
			 3294, 6039,  605, 3304, 3319, 3324, 3333, 3146, 3148, 3191,

			  104, 6039, 6039, 1553, 1097, 2513,    0, 3153, 2526,    0,
			 3317, 3157, 2527, 2583,    0, 3239, 3303, 3308, 2589, 2586,
			 2623, 3328, 3334, 2619, 3337, 2695, 2698, 3339, 3343,    0,
			 2687, 2805, 2820, 3346, 3348, 3394, 3404, 3410, 3421, 3432,
			 3438, 3444, 3005, 3450, 3456,  612, 3462, 3468, 3478, 6039,
			 3484, 3501,    0, 3510, 3524, 3383, 3528, 3532, 2938, 3546,
			 3554, 3563, 3571, 3579, 3177, 3593, 3598, 3613,  578,  538,
			  519,  512,    0, 2828, 2848, 3570,    0, 2870, 3530, 3591,
			    0,    0,    0, 3537, 3587,    0, 3592, 2914,    0, 3595,
			 3596, 2936, 3001, 3065, 3599,  459, 3623, 3647, 3658, 3664,

			 3670, 3687,  426, 1496, 3676, 3698, 3697, 3703, 3714,  450,
			 3725, 3740, 3758, 6039, 3762, 3588, 3767, 3784, 3793, 3729,
			 3774, 3776, 3782,  432, 3068, 3164, 3714, 3195, 3768, 3221,
			 3782, 3259, 3319,    0, 3806, 3829,  361, 3835, 3841, 3851,
			 3857, 3869, 3881, 6039, 3887,    0, 3909, 3913, 3917, 3935,
			 6039, 3949, 3953, 3784, 3884, 3892, 3898, 3506, 3330, 3322,
			 3915,    0, 3932, 3344, 3942,    0, 3344, 3948, 3993,  350,
			 3999, 4011,    0, 4033, 4038, 3981, 4042,  521, 6039, 1037,
			  305, 6039, 3373,  866, 4022, 3372, 4008,  936, 1609, 4056,
			  688, 4083, 4089, 4098, 4105, 3941, 3943, 4090, 3373,    0,

			 4037,    0, 4082, 3467, 4114, 4131,    0,  234, 4154, 4158,
			 4133, 4135, 4149, 1010, 3508, 3607,    0, 3862, 4186, 4191,
			  278,  271,  696, 3519,    0, 4203, 3875, 6039,  707, 4217,
			 4228, 4022, 4178, 3639, 4229, 4245, 4256, 4241, 4243,    0,
			 4255, 3814,  144,  126, 4266, 4276, 4282, 6039, 4037, 4092,
			 4294, 4300, 4097, 4158, 4306, 4292, 6039, 6039, 4312, 4318,
			 4327, 6039, 4333, 4344, 4350, 4356, 6039, 4396, 4448, 4500,
			 4552, 4604, 4640, 4678, 4723, 4773, 4825, 4877, 4929, 4980,
			 5030, 5082, 5134, 5180, 5230, 5282, 5327, 5376, 5411, 5461,
			 5502, 5551, 5601, 5650, 5700, 5736, 5775, 5809, 5842, 5876,

			 5915, 5949, 5988, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  866,    1,  867,  867,  868,  868,  866,    7,  869,
			  869,  866,  866,  866,  866,  866,  870,  866,  871,  872,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  874,  866,  866,  875,  866,  866,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			  866,  866,  866,  876,  866,  866,  866,  876,  876,  876,
			  876,  876,  877,  866,  877,  878,  866,  879,  866,  879,
			  879,  866,  880,  881,  866,  866,  866,  866,  870,  866,

			  882,  882,  882,  883,  884,  866,  866,  866,  866,  885,
			  866,  866,  866,  866,  866,  866,  873,  886,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,   46,  873,  873,  873,
			  873,   46,  873,  873,  873,  873,  873,  873,  874,  874,
			  875,  866,  866,  866,   56,  866,  154,  154,  154,   56,
			   56,   56,   56,   56,  154,   56,  154,  154,   56,   56,
			  154,  154,   56,   56,  154,  154,   56,   56,  154,   56,
			  154,  154,  154,   56,   56,   56,  154,   56,  154,   56,
			  154,  154,   56,   56,  154,  154,   56,   56,  154,  154,

			   56,   56,  154,   56,  154,   56,  866,  876,  866,  866,
			  866,  866,  876,  876,  876,  876,  876,  877,  866,  877,
			  878,  866,  878,  879,  879,  866,  866,  866,  866,  866,
			  866,  880,  881,  866,  866,  232,  887,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  888,  886,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  866,  873,  873,  873,  873,  873,  873,
			  873,  866,  873,  282,  282,  282,  282,  139,  139,  139,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,

			  866,  874,  874,  866,  866,  154,  154,  154,  866,  154,
			   56,   56,   56,  154,   56,  154,  154,   56,   56,  154,
			  154,  154,   56,   56,   56,  154,  154,   56,   56,  866,
			  154,  154,  154,   56,   56,  154,   56,  154,   56,  154,
			  154,   56,   56,  154,  154,   56,   56,  154,  154,  154,
			   56,   56,   56,  154,   56,  154,   56,  876,  876,  876,
			  876,  876,  876,  876,  866,  889,  889,  866,  889,  889,
			  889,  887,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  890,  886,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  866,  873,  873,  873,  873,
			  873,  873,  866,  282,  139,  282,  136,  282,  136,  866,
			  282,  282,  873,  873,  866,  873,  873,  873,  873,  873,
			  891,  874,  874,  892,  154,  154,   56,   56,  154,   56,
			  154,  154,   56,   56,  154,  154,  154,   56,   56,   56,
			  154,  154,   56,  154,  154,  154,   56,   56,  154,   56,
			  154,  154,   56,   56,  154,  154,   56,   56,  154,  154,
			  154,   56,   56,  154,   56,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  885,  866,  866,
			  866,  890,  873,  873,  873,  873,  873,  873,  873,  873,

			  873,  866,  873,  873,  873,  873,  873,  873,  866,  282,
			  282,  866,  282,  512,  866,  873,  873,  873,  873,  888,
			  866,  893,  891,  866,  866,  154,  154,   56,   56,  154,
			   56,  154,  154,   56,   56,  154,  154,   56,   56,  154,
			  154,   56,  154,  154,  154,   56,   56,  154,   56,  154,
			  154,   56,   56,  154,  154,  154,  154,   56,   56,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  894,  895,  873,  873,  873,  873,
			  873,  873,  873,  873,  866,  873,  873,  873,  873,  873,
			  282,  866,  866,  873,  873,  873,  873,  866,  890,  890,

			  893,  866,  866,  866,  866,  154,  154,   56,  154,  154,
			   56,   56,  154,  154,  154,   56,   56,   56,  154,  154,
			  154,   56,   56,  154,   56,  154,  154,   56,   56,  154,
			  154,  154,  154,   56,   56,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  896,  873,  873,  873,  873,  873,  866,  873,
			  873,  873,  873,  873,  866,  873,  873,  873,  866,  866,
			  890,  890,  897,  154,  154,   56,  154,  154,   56,   56,
			  154,  154,  154,   56,   56,  154,   56,  154,  154,   56,
			   56,  154,  154,  154,   56,  866,  866,  866,  866,  866,

			  866,  866,  866,  866,  866,  866,  866,  866,  866,  896,
			  873,  873,  873,  866,  873,  866,  873,  873,  873,  866,
			  866,  895,  895,  898,  154,  154,   56,  154,   56,  154,
			   56,  154,  154,  154,   56,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  899,  873,  873,  873,  873,
			  866,  873,  873,  866,  866,  896,  896,  866,  154,  154,
			   56,  154,   56,  154,   56,  154,  154,   56,  866,  866,
			  866,  866,  900,  873,  873,  873,  873,  866,  866,  896,
			  896,  866,  154,  154,   56,  154,   56,  154,  866,  866,
			  900,  873,  873,  873,  873,  866,  866,  896,  154,  154,

			   56,  154,   56,  154,  866,  866,  901,  866,  873,  873,
			  866,  866,  896,  154,  154,  866,  902,  866,  873,  873,
			  866,  866,  896,  154,  154,  866,  866,  866,  902,  866,
			  873,  866,  866,  154,  866,  866,  873,  866,  866,  154,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,    0,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,

			  866,  866,  866, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
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
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,   10,   11,   12,   12,
			   12,   12,   13,   14,    1,    1,   15,    1,   16,    1,
			   17,   18,   19,   20,   21,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,    5,   40,   41,    5,   12,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   43,   44,   45,   46,   47,   48,   49,
			   50,    5,    5,   51,   52,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
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

			  127,  127,  127,    0,    3,   32,  108,   31,    0,    0,
			  104,    0,  104,   26,   25,    0,   96,   90,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   39,   96,   89,   89,   80,
			   89,   89,   96,   96,   96,   96,   96,   96,    0,    0,
			    0,  103,    0,    0,   99,    0,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   39,   99,   39,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,  100,  117,  119,  118,
			  115,  114,  116,  117,  117,  117,  117,    0,  102,    0,
			    0,  101,    0,    0,    0,   70,   68,    0,   67,    0,
			   66,    0,    0,   95,   93,   93,    0,   94,  127,  121,
			  127,  127,  127,  127,  127,  127,    0,    4,   33,  108,
			    0,    0,    0,  106,  108,  106,  104,    0,    0,   90,
			    0,    0,   96,   96,   38,   96,   96,   96,   96,   96,
			   96,   96,   96,    0,   96,   96,   96,   96,   41,   96,
			   96,    0,   81,   82,   81,   81,   81,   88,   96,   88,
			   88,   88,   96,   96,   96,   96,   96,   96,   40,   96,

			    0,    0,    0,   98,    0,   99,   99,   38,   71,   71,
			   99,   99,   38,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,    0,
			   99,   99,   99,   99,   99,   99,   99,   41,   41,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   40,   40,   99,   99,  117,  117,  117,
			  117,  117,  117,  117,  101,    0,    0,   69,   67,   66,
			   70,    0,  125,  128,  128,  126,  122,  123,  124,   91,
			  108,    0,  108,    0,    0,  108,    0,    0,    0,  107,
			  104,    0,    0,    0,   97,   96,   96,   96,   96,   96,

			   37,   96,   96,   96,   96,    0,   96,   96,   96,   96,
			   96,   96,    0,   96,   80,   96,   96,   96,   96,    0,
			   80,   80,   80,   36,    0,   43,   96,   96,   96,   96,
			   65,    0,    0,   61,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   37,   99,   99,   37,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   36,   43,   36,   43,   99,   99,
			   99,   99,   99,   99,   99,  108,  108,    0,    0,  105,
			  108,    0,  107,    0,  107,    0,    0,    0,  104,   77,
			    0,    0,   58,   96,   96,   96,   96,   96,   96,   44,

			   96,    0,   96,   96,   35,   96,   96,   96,   82,   82,
			   81,    0,   96,   96,    0,   96,   96,   96,   96,    0,
			   65,   65,    0,   64,   64,   58,   99,   58,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   44,
			   99,   44,   99,   99,   35,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,    0,
			  108,    0,  111,  108,  107,    0,    0,  107,    0,    0,
			  106,    0,    0,   77,    0,    0,   96,   59,   96,   60,
			   96,   96,   46,   96,    0,   96,   96,   96,   96,   96,
			   96,   80,    0,   52,   96,   96,   96,    0,    0,    0,

			    0,   63,   62,    0,    0,   99,   59,   59,   99,   60,
			   99,   60,   99,   99,   46,   99,   99,   46,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   52,
			   99,   99,   99,   52,   99,    0,  108,    0,    0,    0,
			  107,    0,  111,  107,    0,   79,    0,    0,    0,  109,
			  111,  109,    0,   96,   96,   57,   96,   45,    0,   42,
			   56,   34,   96,   50,    0,   96,   96,   96,    0,    0,
			    0,    0,    0,   99,   99,   99,   57,   99,   57,   99,
			   45,   42,   56,   42,   56,   34,   34,   99,   50,   99,
			   50,   99,   99,   99,   99,  111,    0,  111,    0,  107,

			    0,    0,  110,    0,    0,   76,  111,    0,  110,    0,
			   96,   96,   96,   85,   96,    0,   96,   96,   53,    0,
			    0,    0,    0,    0,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   53,   99,  111,  110,    0,  110,    0,
			    0,    0,    0,   76,  110,    0,   96,   96,   47,   96,
			   84,   51,   96,    0,    0,    0,    0,    0,   99,   99,
			   99,   47,   47,   99,   99,   51,   99,   51,  110,   78,
			    0,   76,    0,   96,   96,   96,   96,   83,   83,   83,
			   83,   92,   99,   99,   99,   99,   99,   99,    0,    0,
			    0,   96,   49,   48,   96,    0,    0,    0,   99,   49,

			   49,   48,   48,   99,    0,    0,    0,    0,   96,   96,
			    0,    0,    0,   99,   99,   75,    0,    0,   96,   54,
			    0,    0,    0,   99,   54,    0,    0,   75,    0,   72,
			   96,    0,    0,   99,    0,    0,   55,    0,    0,   55,
			    0,   74,    0,    0,    0,    0,    0,   74,    0,    0,
			    0,    0,    0,    0,    0,   73,   86,   87,    0,    0,
			    0,   73,    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6039
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 866
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 867
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
