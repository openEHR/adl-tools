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
			create an_array.make_filled (0, 0, 5720)
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

			   95,   75,   95,   95,  105,  849,  106,  106,  106,  106,
			  106,  210,  108,  178,  109,  232,  110,  110,  110,  110,
			  110,  115,  115,  170,  115,  260,  848,  186,  174,   84,
			   84,  108,  188,  109,  171,  112,  112,  112,  112,  112,
			  175,  179,   76,  102,  117,  228,  202,   76,  228,  230,
			   94,  172,  230,   94,  111,  187,  176,  211,   85,   85,
			  189,  832,  209,  173,  209,  209,  332,  260,  177,   95,
			  233,   95,   95,  111,  203,  329,   77,   78,   79,   80,
			   81,   77,   78,   79,   80,   81,   86,   87,   88,   86,
			   87,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   89,   90,   86,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   86,   86,   91,
			   86,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  115,  115,  204,
			  115,  115,  115,  194,  115,  831,  223,  115,  115,  223,
			  115,  195,  208,  115,  115,  355,  115,  817,  115,  115,

			  117,  115,  115,  115,  117,  115,  260,  305,  205,  118,
			  117,  196,  121,  119,  122,  120,  117,  260,  306,  197,
			  126,  117,  260,  123,  355,  117,  209,  300,  209,  209,
			  115,  115,  127,  115,  124,  305,  128,  118,  225,  745,
			  121,  119,  122,  120,  232,  125,  306,  451,  126,  115,
			  115,  123,  115,  117,  115,  115,  208,  115,  115,  115,
			  127,  115,  124,  301,  128,  208,  788,  129,  130,  180,
			  181,  213,  117,  131,  125,  182,  132,  117,  302,  115,
			  115,  117,  115,  115,  115,  260,  115,  134,  307,  208,
			  473,  115,  115,  133,  115,  129,  130,  183,  184,  233,

			  135,  131,  117,  185,  132,  866,  117,  208,  198,  313,
			  190,  804,  804,  199,  117,  134,  307,  115,  115,  473,
			  115,  133,  146,  191,  208,  142,  218,  147,  135,  115,
			  115,  221,  115,  143,  215,  215,  200,  313,  192,  260,
			  117,  201,  212,  212,  212,  136,  136,  136,  136,  136,
			  146,  193,  117,  142,  260,  144,  147,  601,  260,  137,
			  145,  143,  219,  565,  164,  154,  138,  219,  213,  154,
			  305,  154,  315,  139,  757,  140,  745,  141,  252,  252,
			  252,  252,  252,  144,  214,  214,  214,  137,  145,  355,
			  159,  220,  165,  159,  138,  485,  220,  159,  310,  159,

			  315,  216,  216,  216,  140,  159,  141,  152,  227,  152,
			  152,  227,  152,  520,  260,  153,  521,  153,  356,  477,
			  228,  229,  218,  154,  154,  154,  154,  154,  155,  316,
			  230,  307,  806,  807,  154,  154,  154,  154,  154,  156,
			  154,  154,  154,  157,  154,  158,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  316,  219,  312,
			  225,  154,  159,  159,  160,  159,  159,  161,  159,  159,
			  159,  162,  159,  163,  159,  159,  159,  159,  159,  160,
			  159,  159,  159,  159,  159,  166,  227,  220,  260,  227,
			  154,  260,  260,  260,  167,  260,  154,  260,  228,  249,

			  249,  249,  249,  249,  364,  260,  574,  313,  230,  115,
			  115,  260,  115,  168,  250,  159,  306,  316,  159,  260,
			  115,  115,  169,  115,  159,  258,  258,  258,  258,  258,
			  159,  152,  259,  260,  152,  314,  470,  251,  225,  153,
			  222,  260,  250,  117,  311,  318,  111,  154,  154,  154,
			  154,  154,  155,  319,  260,  722,  325,  721,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  319,  605,  315,  325,  154,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,

			  159,  159,  159,  159,  159,  159,  159,  159,  159,  235,
			  235,  317,  235,  368,  367,  240,  368,  254,  254,  254,
			  254,  254,  806,  807,  241,  241,  241,  241,  241,  260,
			  369,  367,  255,  369,  236,  720,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  242,
			  255,  108,  719,  109,  473,  256,  256,  256,  256,  256,
			  257,  260,  223,  520,  243,  223,  520,  108,  244,  109,
			  245,  256,  256,  256,  256,  256,  526,  115,  115,  237,
			  115,  115,  115,  474,  115,  115,  115,  260,  115,  745,

			  260,  319,  326,  111,  260,  260,  832,  703,  260,  260,
			  117,  260,  330,  799,  117,  526,  320,  260,  117,  111,
			  115,  115,  321,  115,  225,  264,  326,  263,  325,  322,
			  326,  262,  331,  260,  115,  115,  330,  115,  115,  115,
			  330,  115,  799,  117,  320,  115,  115,  260,  115,  260,
			  321,  260,  265,  264,  328,  263,  327,  117,  260,  262,
			  331,  117,  115,  115,  333,  115,  115,  115,  117,  115,
			  115,  115,  260,  115,  664,  260,  266,  267,  260,  260,
			  265,  335,  260,  260,  247,  117,  247,  247,  268,  117,
			  208,  269,  337,  117,  331,  115,  115,  270,  115,  260,

			  115,  115,  271,  115,  266,  267,  605,  260,  260,  335,
			  260,  260,  272,  260,  115,  115,  268,  115,  117,  269,
			  337,  273,  334,  117,  795,  270,  320,  260,  115,  115,
			  271,  115,  321,  115,  115,  274,  115,  117,  335,  221,
			  272,  260,  337,  275,  115,  115,  260,  115,  260,  115,
			  115,  117,  115,  339,  323,  340,  117,  260,  584,  575,
			  324,  343,  260,  274,  339,  796,  336,  117,  215,  215,
			  338,  275,  117,  115,  115,  219,  115,  277,  279,  569,
			  344,  339,  276,  340,  115,  115,  260,  115,  278,  343,
			  108,  260,  341,  260,  349,  260,  117,  260,  115,  115, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  803,  115,  208,  280,  220,  277,  279,  117,  344,  343,
			  340,  260,  115,  115,  519,  115,  278,  115,  115,  260,
			  115,  117,  349,  115,  115,  260,  115,  344,  287,  803,
			  260,  280,  281,  260,  281,  117,  260,  345,  342,  353,
			  117,  347,  137,  294,  260,  348,  117,  137,  353,  434,
			  282,  208,  519,  260,  283,  346,  287,  284,  140,  260,
			  435,  287,  349,  260,  116,  298,  285,  353,  286,  347,
			  137,  294,  438,  348,  260,  137,  354,  434,  282,  212,
			  212,  212,  283,  823,  260,  284,  260,  140,  435,  394,
			  352,  227,  434,  298,  227,  285,  526,  286,  115,  115,

			  438,  115,  260,  228,  367,  116,  116,  116,  116,  116,
			  435,  260,  823,  230,  288,  288,  288,  288,  288,  208,
			  436,  117,  367,  115,  115,  528,  115,  260,  212,  212,
			  212,  208,  289,  287,  208,  290,  260,  116,  437,  115,
			  115,  291,  115,  225,  260,  440,  117,  441,  115,  115,
			  260,  115,  260,  438,  292,  371,  371,  293,  371,  470,
			  289,  260,  117,  290,  115,  115,  116,  115,  260,  291,
			  451,  117,  347,  440,  295,  441,  348,  260,  296,  297,
			  236,  439,  292,  444,  260,  293,  433,  117,  260,  308,
			  430,  309,  309,  309,  309,  309,  362,  362,  362,  394,

			  350,  378,  295,  377,  351,  376,  296,  297,  363,  363,
			  363,  444,  299,  375,  357,  358,  359,  360,  361,  260,
			  520,  227,  372,  521,  227,  373,  374,  374,  374,  374,
			  374,  246,  246,  228,  246,  260,  380,  380,  380,  380,
			  380,  299,  260,  230,  383,  383,  383,  383,  383,  441,
			  866,  250,  440,  381,  379,  381,  866,  226,  382,  382,
			  382,  382,  382,  384,  384,  384,  384,  384,  391,  391,
			  391,  391,  601,  225,  251,  604,  222,  443,  604,  250,
			  442,  208,  332,  672,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,

			  154,  154,  154,  154,  154,  154,  154,  365,  366,  367,
			  365,  366,  365,  365,  365,  365,  365,  365,  365,  365,
			  368,  229,  229,  365,  229,  229,  229,  229,  229,  365,
			  369,  365,  365,  365,  365,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  365,  365,
			  370,  365,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  235,  235,

			  388,  235,  388,  273,  260,  389,  389,  389,  389,  389,
			  304,  108,  303,  109,  151,  390,  390,  390,  390,  390,
			  739,  739,  739,  236,  300,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  385,  385,
			  385,  385,  385,  111,  392,  392,  392,  392,  392,  115,
			  115,  445,  115,  386,  115,  115,  248,  115,  446,  247,
			  115,  115,  260,  115,  795,  246,  450,  260,  237,  239,
			   99,  405,  117,  260,   96,  745,  387,  117,  260,  445,
			  395,  386,  405,  117,  115,  115,  446,  115,  115,  115,

			  260,  115,  405,  396,  450,  226,  444,  260,  260,  115,
			  115,  260,  115,  115,  115,  797,  115,  117,  395,  222,
			  405,  117,  260,  445,  115,  115,  260,  115,  398,  260,
			  208,  396,  117,  397,  447,  206,  117,  260,  446,  151,
			  115,  115,  453,  115,  400,  115,  115,  117,  115,  149,
			  114,  448,  399,  260,  115,  115,  398,  115,  260,  450,
			  401,  397,  113,  117,  107,  454,  449,  260,  117,  104,
			  453,  260,  400,  115,  115,   99,  115,  117,  115,  115,
			  399,  115,   97,  402,  260,  455,  260,  452,  401,  115,
			  115,  260,  115,  454,  453,  458,  117,  403,   96,  404,

			  458,  117,  260,  115,  115,  866,  115,  115,  115,  406,
			  115,  402,  117,  455,  407,  460,  260,  461,  115,  115,
			  260,  115,  456,  458,  408,  403,  117,  866,  459,  866,
			  117,  260,  409,  115,  115,  603,  115,  406,  603,  866,
			  866,  117,  407,  460,  866,  461,  260,  412,  412,  412,
			  412,  412,  408,  866,  115,  115,  117,  115,  304,  604,
			  409,  866,  866,  410,  411,  115,  115,  260,  115,  405,
			  413,  413,  413,  413,  413,  866,  866,  117,  260,  866,
			  405,  415,  415,  415,  415,  415,  115,  115,  117,  115,
			  405,  410,  411,  260,  115,  115,  866,  115,  414,  260,

			  464,  465,  416,  416,  416,  416,  416,  260,  405,  117,
			  417,  417,  417,  417,  417,  866,  454,  117,  116,  116,
			  116,  116,  116,  115,  115,  419,  115,  419,  464,  465,
			  414,  116,  116,  116,  116,  116,  260,  260,  414,  418,
			  418,  418,  418,  418,  457,  468,  117,  420,  866,  116,
			  421,  115,  115,  866,  115,  866,  422,  115,  115,  866,
			  115,  260,  464,  866,  260,  469,  866,  414,  115,  115,
			  260,  115,  866,  468,  117,  420,  260,  116,  421,  461,
			  117,  260,  115,  115,  422,  115,  115,  115,  260,  115,
			  466,  117,  866,  469,  291,  260,  866,  115,  115,  260,

			  115,  115,  115,  424,  115,  117,  423,  463,  460,  117,
			  260,  260,  115,  115,  260,  115,  468,  425,  115,  115,
			  117,  115,  291,  208,  117,  260,  115,  115,  208,  115,
			  866,  260,  208,  866,  423,  117,  462,  208,  426,  260,
			  469,  117,  208,  427,  471,  425,  260,  866,  431,  117,
			  431,  431,  431,  431,  431,  300,  432,  866,  432,  432,
			  432,  432,  432,  300,  465,  525,  426,  529,  472,  866,
			  531,  427,  428,  308,  429,  308,  308,  308,  308,  308,
			  308,  866,  309,  309,  309,  309,  309,  371,  371,  532,
			  371,  866,  467,  525,  866,  529,  366,  367,  531,  366,

			  212,  212,  212,  429,  866,  214,  214,  214,  368,  216,
			  216,  216,  866,  866,  212,  212,  212,  532,  369,  212,
			  212,  212,  373,  374,  374,  374,  374,  374,  475,  475,
			  475,  475,  475,  382,  382,  382,  382,  382,  476,  476,
			  476,  476,  476,  250,  535,  260,  866,  260,  370,  478,
			  478,  478,  478,  478,  479,  479,  479,  479,  479,  480,
			  480,  480,  480,  480,  866,  532,  251,  531,  536,  866,
			  539,  250,  535,  481,  386,  481,  477,  866,  482,  482,
			  482,  482,  482,  483,  483,  483,  483,  483,  389,  389,
			  389,  389,  389,  534,  866,  533,  536,  387,  539,  260, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  866,  866,  386,  484,  484,  484,  484,  484,  486,  487,
			  866,  488,  488,  488,  488,  488,  489,  489,  489,  489,
			  489,  490,  490,  490,  490,  490,  115,  115,  525,  115,
			  115,  115,  866,  115,  540,  542,  260,  115,  115,  260,
			  115,  485,  866,  260,  115,  115,  866,  115,  866,  117,
			  260,  115,  115,  117,  115,  543,  527,  260,  115,  115,
			  117,  115,  540,  542,  260,  529,  866,  117,  492,  115,
			  115,  260,  115,  501,  117,  496,  493,  115,  115,  494,
			  115,  117,  260,  543,  501,  866,  495,  866,  115,  115,
			  260,  115,  117,  530,  501,  866,  492,  866,  866,  866,

			  117,  260,  544,  496,  866,  493,  260,  494,  547,  866,
			  866,  117,  501,  498,  495,  115,  115,  866,  115,  499,
			  115,  115,  497,  115,  866,  260,  115,  115,  260,  115,
			  544,  115,  115,  260,  115,  260,  547,  536,  117,  260,
			  866,  498,  500,  117,  260,  115,  115,  499,  115,  117,
			  497,  866,  260,  539,  117,  502,  866,  535,  260,  115,
			  115,  866,  115,  115,  115,  538,  115,  866,  117,  504,
			  500,  503,  260,  866,  542,  116,  260,  866,  116,  505,
			  549,  541,  117,  502,  116,  537,  117,  412,  412,  412,
			  412,  412,  511,  511,  511,  511,  511,  504,  260,  503,

			  550,  506,  545,  116,  866,  507,  116,  505,  549,  866,
			  260,  260,  116,  281,  508,  281,  514,  413,  413,  413,
			  413,  413,  415,  415,  415,  415,  415,  514,  550,  506,
			  543,  866,  547,  507,  600,  283,  866,  514,  509,  549,
			  116,  553,  508,  554,  116,  416,  416,  416,  416,  416,
			  418,  418,  418,  418,  418,  514,  866,  260,  546,  282,
			  548,  115,  115,  283,  115,  866,  509,  551,  116,  553,
			  866,  554,  116,  260,  260,  285,  260,  417,  417,  417,
			  417,  417,  116,  602,  117,  866,  866,  282,  866,  553,
			  554,  510,  512,  512,  512,  512,  512,  866,  513,  513,

			  513,  513,  513,  866,  285,  550,  116,  115,  115,  606,
			  115,  116,  116,  115,  115,  866,  115,  557,  558,  510,
			  260,  866,  115,  115,  866,  115,  260,  592,  115,  115,
			  117,  115,  866,  552,  116,  260,  117,  606,  592,  555,
			  116,  260,  866,  597,  608,  117,  115,  115,  592,  115,
			  556,  117,  115,  115,  598,  115,  260,  115,  115,  260,
			  115,  571,  866,  571,  599,  260,  592,  555,  866,  117,
			  519,  572,  608,  515,  606,  117,  516,  609,  556,  517,
			  117,  431,  598,  431,  431,  431,  431,  431,  300,  432,
			  518,  432,  432,  432,  432,  432,  300,  260,  612,  573,

			  866,  515,  607,  260,  516,  609,  866,  517,  475,  475,
			  475,  475,  475,  561,  561,  561,  561,  561,  518,  523,
			  609,  618,  608,  559,  619,  866,  612,  524,  560,  560,
			  560,  560,  560,  562,  562,  562,  562,  562,  563,  563,
			  563,  563,  563,  482,  482,  482,  482,  482,  611,  618,
			  610,  559,  619,  386,  564,  564,  564,  564,  564,  566,
			  566,  566,  566,  566,  866,  866,  477,  567,  567,  567,
			  567,  567,  648,  648,  648,  648,  387,  260,  866,  866,
			  620,  386,  568,  568,  568,  568,  568,  563,  563,  563,
			  563,  563,  565,  487,  612,  488,  488,  488,  488,  488,

			  115,  115,  570,  115,  866,  485,  115,  115,  620,  115,
			  866,  115,  115,  260,  115,  115,  115,  866,  115,  260,
			  623,  260,  615,  117,  260,  260,  625,  866,  260,  117,
			  570,  866,  115,  115,  117,  115,  115,  115,  117,  115,
			  260,  626,  577,  619,  613,  260,  866,  629,  623,  260,
			  625,  866,  866,  578,  625,  117,  614,  620,  866,  117,
			  576,  866,  579,  866,  115,  115,  580,  115,  866,  626,
			  577,  621,  613,  115,  115,  629,  115,  260,  627,  115,
			  115,  578,  115,  866,  614,  622,  260,  117,  115,  115,
			  579,  115,  260,  866,  580,  581,  117,  115,  115,  866,

			  115,  260,  117,  115,  115,  630,  115,  582,  866,  866,
			  260,  117,  631,  866,  632,  583,  260,  866,  866,  585,
			  117,  115,  115,  581,  115,  866,  117,  586,  115,  115,
			  866,  115,  866,  630,  260,  582,  115,  115,  673,  115,
			  631,  260,  632,  583,  117,  115,  115,  585,  115,  260,
			  866,  117,  587,  260,  866,  586,  866,  866,  260,  117,
			  590,  590,  590,  590,  590,  866,  673,  589,  117,  866,
			  588,  623,  866,  866,  116,  513,  513,  513,  513,  513,
			  587,  511,  511,  511,  511,  511,  419,  260,  419,  414,
			  512,  512,  512,  512,  512,  589,  116,  638,  588,  624,

			  115,  115,  116,  115,  116,  626,  115,  115,  591,  115,
			  866,  421,  260,  260,  866,  115,  115,  422,  115,  260,
			  251,  866,  866,  117,  116,  638,  260,  674,  260,  117,
			  613,  593,  116,  628,  260,  866,  591,  594,  117,  421,
			  115,  115,  614,  115,  629,  422,  636,  636,  636,  636,
			  636,  866,  630,  260,  260,  674,  866,  595,  616,  593,
			  866,  866,  866,  117,  866,  594,  866,  866,  674,  635,
			  617,  635,  633,  866,  636,  636,  636,  636,  636,  596,
			  634,  866,  866,  866,  477,  595,  637,  637,  637,  637,
			  637,  563,  563,  563,  563,  563,  675,  640,  640,  640,

			  640,  640,  866,  866,  866,  676,  639,  596,  641,  641,
			  641,  641,  641,  642,  642,  642,  642,  642,  643,  643,
			  643,  643,  643,  644,  644,  644,  644,  644,  645,  645,
			  645,  645,  645,  676,  639,  565,  646,  603,  646,  677,
			  603,  643,  643,  643,  643,  643,  647,  647,  647,  647,
			  647,  650,  650,  650,  650,  650,  485,  115,  115,  866,
			  115,  604,  115,  115,  680,  115,  651,  677,  115,  115,
			  260,  115,  658,  115,  115,  260,  115,  866,  866,  260,
			  117,  260,  866,  866,  653,  117,  260,  115,  115,  658,
			  115,  117,  680,  658,  651,  654,  117,  866,  115,  115,

			  260,  115,  115,  115,  677,  115,  115,  115,  260,  115,
			  117,  260,  653,  866,  866,  260,  681,  658,  655,  260,
			  682,  117,  866,  654,  866,  117,  676,  866,  866,  117,
			  115,  115,  679,  115,  115,  115,  656,  115,  115,  115,
			  866,  115,  657,  260,  681,  866,  655,  260,  682,  115,
			  115,  260,  115,  117,  678,  115,  115,  117,  115,  866,
			  866,  117,  260,  866,  656,  660,  260,  685,  260,  687,
			  657,  688,  117,  659,  866,  866,  260,  866,  117,  691,
			  662,  661,  281,  692,  281,  663,  590,  590,  590,  590,
			  590,  115,  115,  660,  115,  685,  681,  687,  866,  688, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  116,  659,  115,  115,  260,  115,  685,  691,  662,  661,
			  866,  692,  866,  663,  117,  260,  115,  115,  260,  115,
			  115,  115,  260,  115,  683,  117,  668,  668,  116,  260,
			  669,  693,  260,  260,  686,  701,  682,  668,  670,  117,
			  687,  671,  260,  117,  665,  666,  724,  669,  671,  688,
			  667,  671,  636,  636,  636,  636,  636,  866,  387,  693,
			  260,  866,  725,  701,  684,  668,  670,  866,  689,  671,
			  866,  691,  665,  666,  724,  727,  727,  690,  667,  636,
			  636,  636,  636,  636,  695,  695,  695,  695,  695,  696,
			  725,  696,  866,  866,  697,  697,  697,  697,  697,  694,

			  698,  866,  698,  727,  728,  699,  699,  699,  699,  699,
			  699,  699,  699,  699,  699,  700,  700,  700,  700,  700,
			  643,  643,  643,  643,  643,  702,  702,  702,  702,  702,
			  643,  643,  643,  643,  643,  704,  704,  704,  704,  704,
			  705,  705,  705,  705,  705,  260,  729,  731,  565,  706,
			  706,  706,  706,  706,  707,  866,  707,  732,  866,  708,
			  708,  708,  708,  708,  701,  115,  115,  866,  115,  713,
			  115,  115,  866,  115,  729,  731,  115,  115,  260,  115,
			  799,  115,  115,  260,  115,  732,  713,  387,  117,  260,
			  713,  866,  701,  117,  260,  115,  115,  866,  115,  117,

			  115,  115,  866,  115,  117,  715,  711,  710,  260,  800,
			  712,  866,  733,  260,  713,  866,  115,  115,  117,  115,
			  260,  866,  715,  117,  115,  115,  715,  115,  260,  260,
			  115,  115,  260,  115,  711,  710,  866,  260,  712,  117,
			  733,  115,  115,  260,  115,  729,  731,  117,  115,  115,
			  715,  115,  866,  117,  260,  725,  758,  115,  115,  866,
			  115,  260,  115,  115,  117,  115,  759,  761,  714,  866,
			  260,  117,  866,  730,  734,  260,  866,  866,  866,  716,
			  117,  866,  866,  726,  758,  117,  697,  697,  697,  697,
			  697,  717,  866,  718,  759,  761,  714,  735,  735,  735,

			  735,  735,  699,  699,  699,  699,  699,  716,  699,  699,
			  699,  699,  699,  736,  736,  736,  736,  736,  737,  717,
			  737,  718,  866,  738,  738,  738,  738,  738,  740,  740,
			  740,  740,  740,  763,  765,  477,  741,  742,  741,  742,
			  642,  642,  642,  642,  642,  708,  708,  708,  708,  708,
			  744,  744,  744,  744,  744,  701,  115,  115,  866,  115,
			  866,  763,  765,  115,  115,  866,  115,  115,  115,  260,
			  115,  866,  750,  766,  743,  866,  260,  866,  387,  117,
			  260,  115,  115,  701,  115,  746,  117,  866,  485,  750,
			  117,  866,  260,  750,  260,  753,  749,  866,  747,  753,

			  866,  766,  115,  115,  117,  115,  115,  115,  763,  115,
			  754,  866,  748,  746,  754,  260,  753,  750,  753,  260,
			  115,  115,  755,  115,  749,  117,  747,  753,  260,  117,
			  754,  754,  751,  260,  756,  260,  764,  752,  260,  755,
			  748,  866,  754,  117,  782,  866,  761,  866,  866,  866,
			  755,  756,  777,  866,  783,  765,  777,  759,  115,  115,
			  751,  115,  756,  866,  866,  752,  695,  695,  695,  695,
			  695,  260,  782,  777,  762,  738,  738,  738,  738,  738,
			  866,  117,  783,  767,  777,  760,  768,  768,  768,  768,
			  768,  769,  769,  769,  769,  769,  573,  573,  573,  573,

			  573,  785,  774,  787,  477,  770,  770,  770,  770,  770,
			  771,  771,  771,  771,  771,  702,  702,  702,  702,  702,
			  115,  115,  798,  115,  565,  115,  115,  866,  115,  785,
			  774,  787,  866,  260,  115,  115,  260,  115,  260,  115,
			  115,  866,  115,  117,  866,  778,  866,  260,  117,  778,
			  798,  260,  260,  485,  773,  115,  115,  117,  115,  777,
			  778,  801,  117,  779,  780,  775,  778,  783,  260,  785,
			  813,  757,  757,  866,  757,  866,  866,  778,  117,  866,
			  779,  780,  773,  736,  736,  736,  736,  736,  866,  801,
			  866,  779,  780,  775,  781,  784,  260,  786,  813,  776,

			  789,  789,  789,  789,  789,  741,  866,  741,  866,  810,
			  771,  771,  771,  771,  771,  115,  115,  810,  115,  115,
			  115,  565,  115,  811,  866,  814,  801,  776,  260,  866,
			  810,  811,  260,  866,  115,  115,  745,  115,  117,  866,
			  824,  866,  117,  743,  811,  810,  791,  260,  811,  115,
			  115,  866,  115,  814,  802,  837,  812,  117,  866,  811,
			  115,  115,  260,  115,  866,  833,  837,  792,  824,  812,
			  866,  839,  117,  260,  791,  866,  837,  793,  805,  805,
			  805,  805,  805,  117,  812,  115,  115,  866,  115,  115,
			  115,  866,  115,  833,  837,  866,  792,  794,  260,  839,

			  115,  115,  260,  115,  808,  793,  866,  866,  117,  866,
			  866,  866,  117,  260,  815,  815,  815,  815,  815,  866,
			  866,  115,  115,  117,  115,  820,  794,  743,  743,  743,
			  743,  743,  808,  820,  260,  115,  115,  745,  115,  821,
			  809,  825,  866,  825,  117,  866,  820,  821,  260,  821,
			  866,  826,  829,  829,  829,  829,  829,  822,  117,  866,
			  821,  820,  866,  866,  115,  115,  819,  115,  809,  818,
			  822,  866,  866,  115,  115,  821,  115,  260,  866,  827,
			  834,  834,  834,  834,  834,  822,  260,  117,  835,  835,
			  835,  835,  115,  115,  819,  115,  117,  838,  818,  829,

			  829,  829,  829,  829,  830,  260,  866,  866,  838,  840,
			  840,  840,  840,  840,  866,  117,  115,  115,  838,  115,
			  842,  866,  843,  836,  841,  841,  841,  841,  841,  260,
			  866,  842,  830,  843,  866,  866,  838,  866,  866,  117,
			  845,  842,  845,  843,  844,  844,  844,  844,  844,  866,
			  846,  836,  827,  827,  827,  827,  827,  866,  852,  842,
			  853,  843,  850,  850,  850,  850,  850,  851,  851,  851,
			  851,  866,  866,  866,  866,  852,  856,  853,  847,  852,
			  866,  853,  854,  854,  854,  854,  854,  855,  855,  855,
			  855,  855,  857,  856,  866,  866,  866,  856,  858,  858,

			  858,  858,  858,  852,  866,  853,  866,  866,  866,  857,
			  866,  866,  866,  857,  859,  860,  859,  860,  866,  866,
			  866,  856,  847,  847,  847,  847,  847,  862,  862,  862,
			  862,  862,  863,  863,  863,  863,  863,  857,  864,  864,
			  864,  864,  864,  865,  865,  865,  865,  865,  859,  866,
			  859,  866,  861,  863,  863,  863,  863,  863,  861,  861,
			  861,  861,  861,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  861,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
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
			  224,  866,  224,  224,  224,  866,  866,  224,  224,  224,
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
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
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
			  866,  816,  816,  816,  816,  816,  816,  816,  816,  816,
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
			  866, yy_Dummy>>,
			1, 721, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5720)
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

			   13,    4,   13,   13,   25,  843,   25,   25,   25,   25,
			   25,   76,   27,   61,   27,   92,   27,   27,   27,   27,
			   27,   38,   38,   59,   38,  185,  842,   63,   60,    5,
			    6,   28,   64,   28,   59,   28,   28,   28,   28,   28,
			   60,   61,    3,   18,   38,  228,   68,    4,  228,  230,
			    9,   59,  230,   10,   27,   63,   60,   76,    5,    6,
			   64,  821,   74,   59,   74,   74,  185,  179,   60,   95,
			   92,   95,   95,   28,   68,  179,    3,    3,    3,    3,
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
			   35,   36,   36,   66,   36,  820,   87,   37,   37,   87,
			   37,   66,   78,   40,   40,  204,   40,  807,   39,   39,

			   35,   39,   41,   41,   36,   41,  328,  156,   69,   35,
			   37,   66,   36,   35,   37,   35,   40,  802,  157,   66,
			   40,   39,  800,   37,  204,   41,  209,  149,  209,  209,
			   42,   42,   40,   42,   39,  156,   41,   35,   87,  780,
			   36,   35,   37,   35,  231,   39,  157,  328,   40,   43,
			   43,   37,   43,   42,   44,   44,   80,   44,   45,   45,
			   40,   45,   39,  149,   41,   77,  769,   42,   42,   62,
			   62,   78,   43,   42,   39,   62,   43,   44,  149,   50,
			   50,   45,   50,   49,   49,  767,   49,   45,  158,  358,
			  355,   47,   47,   44,   47,   42,   42,   62,   62,  231,

			   45,   42,   50,   62,   43,  600,   49,   79,   67,  164,
			   65,  788,  788,   67,   47,   45,  158,   48,   48,  355,
			   48,   44,   49,   65,   81,   47,   82,   50,   45,   46,
			   46,   84,   46,   47,   80,   80,   67,  164,   65,  161,
			   48,   67,   77,   77,   77,   46,   46,   46,   46,   46,
			   49,   65,   46,   47,  205,   48,   50,  600,  762,   46,
			   48,   47,   82,  736,   56,   56,   46,   84,  358,   56,
			  161,   56,  166,   46,  723,   46,  709,   46,  108,  108,
			  108,  108,  108,   48,   79,   79,   79,   46,   48,  205,
			   56,   82,   56,   56,   46,  702,   84,   56,  161,   56,

			  166,   81,   81,   81,   46,   56,   46,   55,   89,  152,
			   55,   89,  152,  430,  163,   55,  430,  152,  205,  695,
			   89,   89,  217,   55,   55,   55,   55,   55,   55,  167,
			   89,  163,  790,  790,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  167,  217,  163,
			   89,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   57,   90,  217,  165,   90,
			   57,  169,  690,  162,   57,  352,   57,  686,   90,  106,

			  106,  106,  106,  106,  222,  684,  490,  165,   90,  115,
			  115,  683,  115,   57,  106,   57,  162,  169,   57,  678,
			  116,  116,   57,  116,   57,  111,  111,  111,  111,  111,
			   57,   58,  115,  116,   58,  165,  352,  106,   90,   58,
			  222,  528,  106,  116,  162,  169,  490,   58,   58,   58,
			   58,   58,   58,  170,  168,  671,  174,  670,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  170,  528,  168,  174,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,

			   58,   58,   58,   58,   58,   58,   58,   58,   58,   93,
			   93,  168,   93,  368,  368,  102,  368,  109,  109,  109,
			  109,  109,  828,  828,  102,  102,  102,  102,  102,  356,
			  369,  369,  109,  369,   93,  669,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,  102,
			  109,  110,  668,  110,  356,  110,  110,  110,  110,  110,
			  110,  172,  223,  520,  102,  223,  520,  112,  102,  112,
			  102,  112,  112,  112,  112,  112,  435,  118,  118,   93,
			  118,  119,  119,  356,  119,  120,  120,  177,  120,  822,

			  118,  172,  175,  110,  119,  176,  822,  645,  120,  183,
			  118,  633,  180,  783,  119,  435,  171,  617,  120,  112,
			  121,  121,  171,  121,  223,  120,  177,  119,  176,  172,
			  175,  118,  181,  121,  122,  122,  183,  122,  123,  123,
			  180,  123,  783,  121,  171,  124,  124,  122,  124,  611,
			  171,  123,  121,  120,  177,  119,  176,  122,  124,  118,
			  181,  123,  125,  125,  183,  125,  126,  126,  124,  126,
			  127,  127,  607,  127,  592,  125,  122,  123,  184,  126,
			  121,  186,  541,  127,  247,  125,  247,  247,  124,  126,
			  360,  125,  188,  127,  184,  129,  129,  125,  129,  527,

			  128,  128,  126,  128,  122,  123,  526,  187,  129,  186,
			  173,  189,  127,  128,  130,  130,  124,  130,  129,  125,
			  188,  128,  184,  128,  777,  125,  173,  130,  131,  131,
			  126,  131,  173,  132,  132,  129,  132,  130,  187,  219,
			  127,  131,  189,  130,  133,  133,  132,  133,  192,  134,
			  134,  131,  134,  190,  173,  191,  132,  133,  501,  491,
			  173,  194,  134,  129,  192,  777,  187,  133,  360,  360,
			  189,  130,  134,  135,  135,  219,  135,  132,  134,  486,
			  195,  190,  131,  191,  137,  137,  135,  137,  133,  194,
			  479,  196,  192,  193,  199,  197,  135,  137,  143,  143, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  787,  143,  213,  135,  219,  132,  134,  137,  195,  196,
			  193,  143,  138,  138,  474,  138,  133,  140,  140,  203,
			  140,  143,  199,  146,  146,  138,  146,  197,  137,  787,
			  140,  135,  136,  136,  136,  138,  146,  196,  193,  202,
			  140,  198,  138,  143,  201,  198,  146,  140,  203,  305,
			  136,  214,  473,  467,  136,  197,  138,  136,  138,  466,
			  306,  140,  201,  437,  136,  146,  136,  202,  136,  198,
			  138,  143,  313,  198,  310,  140,  203,  305,  136,  213,
			  213,  213,  136,  813,  311,  136,  447,  138,  306,  394,
			  201,  224,  310,  146,  224,  136,  437,  136,  139,  139,

			  313,  139,  141,  224,  370,  141,  141,  141,  141,  141,
			  311,  139,  813,  224,  139,  139,  139,  139,  139,  215,
			  310,  139,  365,  142,  142,  437,  142,  314,  214,  214,
			  214,  216,  139,  141,  212,  139,  142,  141,  311,  144,
			  144,  139,  144,  224,  354,  315,  142,  316,  145,  145,
			  200,  145,  144,  314,  142,  236,  236,  142,  236,  349,
			  139,  145,  144,  139,  147,  147,  141,  147,  338,  139,
			  326,  145,  200,  315,  144,  316,  200,  147,  144,  145,
			  236,  314,  142,  319,  312,  142,  304,  147,  160,  160,
			  300,  160,  160,  160,  160,  160,  215,  215,  215,  261,

			  200,  245,  144,  244,  200,  243,  144,  145,  216,  216,
			  216,  319,  147,  242,  212,  212,  212,  212,  212,  318,
			  521,  227,  240,  521,  227,  241,  241,  241,  241,  241,
			  241,  246,  246,  227,  246,  317,  249,  249,  249,  249,
			  249,  147,  154,  227,  251,  251,  251,  251,  251,  318,
			  154,  249,  317,  250,  246,  250,  235,  226,  250,  250,
			  250,  250,  250,  252,  252,  252,  252,  252,  257,  257,
			  257,  257,  521,  227,  249,  604,  220,  318,  604,  249,
			  317,  207,  182,  604,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,

			  154,  154,  154,  154,  154,  154,  154,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  232,  232,

			  255,  232,  255,  178,  159,  255,  255,  255,  255,  255,
			  155,  256,  153,  256,  150,  256,  256,  256,  256,  256,
			  703,  703,  703,  232,  148,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  254,  254,
			  254,  254,  254,  256,  258,  258,  258,  258,  258,  262,
			  262,  320,  262,  254,  263,  263,  105,  263,  321,  104,
			  264,  264,  262,  264,  779,  103,  325,  263,  232,  100,
			   98,  273,  262,  264,   96,  779,  254,  263,  322,  320,
			  262,  254,  273,  264,  265,  265,  321,  265,  266,  266,

			  323,  266,  273,  263,  325,   88,  322,  265,  324,  267,
			  267,  266,  267,  268,  268,  779,  268,  265,  262,   85,
			  273,  266,  267,  323,  269,  269,  268,  269,  266,  327,
			   73,  263,  267,  265,  322,   70,  268,  269,  324,   54,
			  270,  270,  330,  270,  268,  272,  272,  269,  272,   51,
			   33,  323,  267,  270,  271,  271,  266,  271,  272,  327,
			  269,  265,   31,  270,   26,  331,  324,  271,  272,   24,
			  330,  333,  268,  274,  274,   16,  274,  271,  275,  275,
			  267,  275,   15,  270,  336,  332,  274,  327,  269,  276,
			  276,  275,  276,  331,  333,  335,  274,  271,   14,  272,

			  336,  275,  276,  277,  277,   11,  277,  278,  278,  274,
			  278,  270,  276,  332,  275,  339,  277,  340,  279,  279,
			  278,  279,  333,  335,  276,  271,  277,    0,  336,    0,
			  278,  279,  277,  280,  280,  524,  280,  274,  524,    0,
			    0,  279,  275,  339,    0,  340,  280,  281,  281,  281,
			  281,  281,  276,    0,  282,  282,  280,  282,  329,  524,
			  277,    0,    0,  279,  280,  283,  283,  282,  283,  329,
			  282,  282,  282,  282,  282,    0,    0,  282,  283,    0,
			  329,  283,  283,  283,  283,  283,  284,  284,  283,  284,
			  329,  279,  280,  334,  285,  285,    0,  285,  282,  284,

			  343,  344,  284,  284,  284,  284,  284,  285,  329,  284,
			  285,  285,  285,  285,  285,    0,  334,  285,  287,  287,
			  287,  287,  287,  286,  286,  288,  286,  288,  343,  344,
			  284,  289,  289,  289,  289,  289,  286,  345,  285,  286,
			  286,  286,  286,  286,  334,  347,  286,  288,    0,  289,
			  288,  290,  290,    0,  290,    0,  288,  291,  291,    0,
			  291,  342,  345,    0,  290,  348,    0,  286,  292,  292,
			  291,  292,    0,  347,  290,  288,  341,  289,  288,  342,
			  291,  292,  293,  293,  288,  293,  294,  294,  350,  294,
			  345,  292,    0,  348,  290,  293,    0,  295,  295,  294,

			  295,  296,  296,  293,  296,  293,  292,  342,  341,  294,
			  295,  351,  298,  298,  296,  298,  350,  294,  297,  297,
			  295,  297,  290,  357,  296,  298,  299,  299,  359,  299,
			    0,  297,  361,    0,  292,  298,  341,  362,  295,  299,
			  351,  297,  363,  296,  350,  294,  346,    0,  301,  299,
			  301,  301,  301,  301,  301,  301,  302,    0,  302,  302,
			  302,  302,  302,  302,  346,  434,  295,  438,  351,    0,
			  440,  296,  297,  308,  299,  308,  308,  308,  308,  308,
			  309,    0,  309,  309,  309,  309,  309,  371,  371,  441,
			  371,    0,  346,  434,    0,  438,  366,  366,  440,  366,

			  357,  357,  357,  299,    0,  359,  359,  359,  366,  361,
			  361,  361,  371,    0,  362,  362,  362,  441,  366,  363,
			  363,  363,  374,  374,  374,  374,  374,  374,  380,  380,
			  380,  380,  380,  381,  381,  381,  381,  381,  382,  382,
			  382,  382,  382,  380,  445,  442,    0,  443,  366,  383,
			  383,  383,  383,  383,  384,  384,  384,  384,  384,  385,
			  385,  385,  385,  385,    0,  443,  380,  442,  446,    0,
			  450,  380,  445,  386,  385,  386,  382,    0,  386,  386,
			  386,  386,  386,  387,  387,  387,  387,  387,  388,  388,
			  388,  388,  388,  443,    0,  442,  446,  385,  450,  436, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  385,  389,  389,  389,  389,  389,  390,  390,
			    0,  390,  390,  390,  390,  390,  391,  391,  391,  391,
			  391,  392,  392,  392,  392,  392,  395,  395,  436,  395,
			  396,  396,    0,  396,  451,  453,  439,  397,  397,  395,
			  397,  389,    0,  396,  399,  399,    0,  399,    0,  395,
			  397,  398,  398,  396,  398,  454,  436,  399,  400,  400,
			  397,  400,  451,  453,  398,  439,    0,  399,  395,  402,
			  402,  400,  402,  405,  398,  399,  396,  401,  401,  397,
			  401,  400,  402,  454,  405,    0,  398,    0,  403,  403,
			  401,  403,  402,  439,  405,    0,  395,    0,    0,    0,

			  401,  403,  455,  399,    0,  396,  449,  397,  458,    0,
			    0,  403,  405,  402,  398,  404,  404,    0,  404,  403,
			  406,  406,  401,  406,    0,  448,  407,  407,  404,  407,
			  455,  408,  408,  406,  408,  452,  458,  449,  404,  407,
			    0,  402,  404,  406,  408,  409,  409,  403,  409,  407,
			  401,    0,  456,  452,  408,  406,    0,  448,  409,  410,
			  410,    0,  410,  411,  411,  449,  411,    0,  409,  408,
			  404,  407,  410,    0,  456,  414,  411,    0,  414,  409,
			  460,  452,  410,  406,  414,  448,  411,  412,  412,  412,
			  412,  412,  419,  419,  419,  419,  419,  408,  457,  407,

			  461,  410,  456,  414,    0,  411,  414,  409,  460,    0,
			  462,  459,  414,  413,  412,  413,  424,  413,  413,  413,
			  413,  413,  415,  415,  415,  415,  415,  424,  461,  410,
			  457,  522,  459,  411,  522,  413,    0,  424,  413,  462,
			  415,  468,  412,  469,  413,  416,  416,  416,  416,  416,
			  418,  418,  418,  418,  418,  424,    0,  471,  457,  416,
			  459,  417,  417,  413,  417,    0,  413,  462,  415,  468,
			    0,  469,  413,  472,  417,  416,  463,  417,  417,  417,
			  417,  417,  418,  522,  417,    0,    0,  416,    0,  471,
			  472,  417,  420,  420,  420,  420,  420,    0,  421,  421,

			  421,  421,  421,    0,  416,  463,  420,  422,  422,  529,
			  422,  418,  421,  423,  423,    0,  423,  471,  472,  417,
			  422,    0,  425,  425,    0,  425,  423,  514,  426,  426,
			  422,  426,    0,  463,  420,  425,  423,  529,  514,  470,
			  421,  426,    0,  519,  531,  425,  427,  427,  514,  427,
			  470,  426,  428,  428,  519,  428,  530,  429,  429,  427,
			  429,  489,    0,  489,  519,  428,  514,  470,    0,  427,
			  429,  489,  531,  426,  530,  428,  427,  532,  470,  428,
			  429,  431,  519,  431,  431,  431,  431,  431,  431,  432,
			  428,  432,  432,  432,  432,  432,  432,  533,  535,  489,

			    0,  426,  530,  534,  427,  532,    0,  428,  475,  475,
			  475,  475,  475,  477,  477,  477,  477,  477,  428,  431,
			  534,  540,  533,  475,  542,    0,  535,  432,  476,  476,
			  476,  476,  476,  478,  478,  478,  478,  478,  480,  480,
			  480,  480,  480,  481,  481,  481,  481,  481,  534,  540,
			  533,  475,  542,  480,  482,  482,  482,  482,  482,  483,
			  483,  483,  483,  483,    0,    0,  476,  484,  484,  484,
			  484,  484,  572,  572,  572,  572,  480,  537,    0,    0,
			  543,  480,  485,  485,  485,  485,  485,  487,  487,  487,
			  487,  487,  482,  488,  537,  488,  488,  488,  488,  488,

			  492,  492,  487,  492,    0,  484,  493,  493,  543,  493,
			    0,  494,  494,  492,  494,  495,  495,    0,  495,  493,
			  547,  551,  537,  492,  494,  545,  549,    0,  495,  493,
			  487,    0,  496,  496,  494,  496,  497,  497,  495,  497,
			  546,  550,  494,  545,  536,  496,    0,  553,  547,  497,
			  551,    0,    0,  495,  549,  496,  536,  546,    0,  497,
			  493,    0,  496,    0,  498,  498,  497,  498,    0,  550,
			  494,  545,  536,  499,  499,  553,  499,  498,  551,  500,
			  500,  495,  500,    0,  536,  546,  499,  498,  502,  502,
			  496,  502,  500,    0,  497,  498,  499,  503,  503,    0,

			  503,  502,  500,  504,  504,  554,  504,  498,    0,    0,
			  503,  502,  555,    0,  556,  500,  504,    0,    0,  502,
			  503,  505,  505,  498,  505,    0,  504,  503,  506,  506,
			    0,  506,    0,  554,  505,  498,  507,  507,  605,  507,
			  555,  506,  556,  500,  505,  510,  510,  502,  510,  507,
			    0,  506,  505,  548,    0,  503,    0,    0,  510,  507,
			  509,  509,  509,  509,  509,    0,  605,  507,  510,    0,
			  506,  548,    0,    0,  509,  513,  513,  513,  513,  513,
			  505,  511,  511,  511,  511,  511,  512,  552,  512,  510,
			  512,  512,  512,  512,  512,  507,  513,  562,  506,  548,

			  515,  515,  509,  515,  512,  552,  516,  516,  511,  516,
			    0,  512,  538,  515,    0,  517,  517,  512,  517,  516,
			  562,    0,    0,  515,  513,  562,  557,  608,  517,  516,
			  538,  515,  512,  552,  558,    0,  511,  516,  517,  512,
			  518,  518,  538,  518,  557,  512,  560,  560,  560,  560,
			  560,    0,  558,  518,  610,  608,    0,  517,  538,  515,
			    0,    0,    0,  518,    0,  516,    0,    0,  610,  559,
			  538,  559,  557,    0,  559,  559,  559,  559,  559,  518,
			  558,    0,    0,    0,  560,  517,  561,  561,  561,  561,
			  561,  563,  563,  563,  563,  563,  610,  564,  564,  564,

			  564,  564,    0,    0,    0,  612,  563,  518,  565,  565,
			  565,  565,  565,  566,  566,  566,  566,  566,  567,  567,
			  567,  567,  567,  568,  568,  568,  568,  568,  569,  569,
			  569,  569,  569,  612,  563,  564,  570,  603,  570,  613,
			  603,  570,  570,  570,  570,  570,  571,  571,  571,  571,
			  571,  574,  574,  574,  574,  574,  567,  576,  576,    0,
			  576,  603,  577,  577,  618,  577,  574,  613,  578,  578,
			  576,  578,  584,  579,  579,  577,  579,    0,    0,  616,
			  576,  578,    0,    0,  576,  577,  579,  580,  580,  584,
			  580,  578,  618,  584,  574,  578,  579,    0,  581,  581,

			  580,  581,  582,  582,  616,  582,  583,  583,  615,  583,
			  580,  581,  576,    0,    0,  582,  619,  584,  580,  583,
			  620,  581,    0,  578,    0,  582,  615,    0,    0,  583,
			  585,  585,  616,  585,  586,  586,  581,  586,  587,  587,
			    0,  587,  583,  585,  619,    0,  580,  586,  620,  588,
			  588,  587,  588,  585,  615,  589,  589,  586,  589,    0,
			    0,  587,  588,    0,  581,  586,  621,  623,  589,  625,
			  583,  626,  588,  585,    0,    0,  624,    0,  589,  630,
			  588,  587,  590,  631,  590,  589,  590,  590,  590,  590,
			  590,  593,  593,  586,  593,  623,  621,  625,    0,  626, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  590,  585,  594,  594,  593,  594,  624,  630,  588,  587,
			    0,  631,    0,  589,  593,  594,  595,  595,  622,  595,
			  596,  596,  627,  596,  621,  594,  597,  598,  590,  595,
			  599,  632,  628,  596,  624,  642,  622,  597,  598,  595,
			  627,  599,  634,  596,  594,  595,  673,  597,  598,  628,
			  596,  599,  635,  635,  635,  635,  635,    0,  642,  632,
			  679,    0,  674,  642,  622,  597,  598,    0,  627,  599,
			    0,  634,  594,  595,  673,  677,  679,  628,  596,  636,
			  636,  636,  636,  636,  637,  637,  637,  637,  637,  638,
			  674,  638,    0,    0,  638,  638,  638,  638,  638,  634,

			  639,    0,  639,  677,  679,  639,  639,  639,  639,  639,
			  640,  640,  640,  640,  640,  641,  641,  641,  641,  641,
			  643,  643,  643,  643,  643,  644,  644,  644,  644,  644,
			  646,  646,  646,  646,  646,  647,  647,  647,  647,  647,
			  648,  648,  648,  648,  648,  784,  687,  691,  640,  650,
			  650,  650,  650,  650,  651,    0,  651,  692,    0,  651,
			  651,  651,  651,  651,  650,  653,  653,    0,  653,  658,
			  654,  654,    0,  654,  687,  691,  655,  655,  653,  655,
			  784,  656,  656,  654,  656,  692,  658,  650,  653,  655,
			  658,    0,  650,  654,  656,  657,  657,    0,  657,  655,

			  659,  659,    0,  659,  656,  664,  654,  653,  657,  784,
			  656,    0,  693,  659,  658,    0,  660,  660,  657,  660,
			  689,    0,  664,  659,  661,  661,  664,  661,  694,  660,
			  662,  662,  675,  662,  654,  653,    0,  661,  656,  660,
			  693,  663,  663,  662,  663,  689,  694,  661,  665,  665,
			  664,  665,    0,  662,  663,  675,  724,  666,  666,    0,
			  666,  665,  667,  667,  663,  667,  725,  727,  662,    0,
			  666,  665,    0,  689,  694,  667,    0,    0,    0,  665,
			  666,    0,    0,  675,  724,  667,  696,  696,  696,  696,
			  696,  666,    0,  667,  725,  727,  662,  697,  697,  697,

			  697,  697,  698,  698,  698,  698,  698,  665,  699,  699,
			  699,  699,  699,  700,  700,  700,  700,  700,  701,  666,
			  701,  667,    0,  701,  701,  701,  701,  701,  704,  704,
			  704,  704,  704,  729,  731,  697,  705,  705,  705,  705,
			  706,  706,  706,  706,  706,  707,  707,  707,  707,  707,
			  708,  708,  708,  708,  708,  706,  710,  710,    0,  710,
			    0,  729,  731,  711,  711,    0,  711,  714,  714,  710,
			  714,    0,  715,  732,  705,    0,  711,    0,  706,  710,
			  714,  712,  712,  706,  712,  710,  711,    0,  708,  715,
			  714,    0,  730,  715,  712,  719,  714,    0,  711,  719,

			    0,  732,  716,  716,  712,  716,  717,  717,  730,  717,
			  720,    0,  712,  710,  720,  716,  719,  715,  721,  717,
			  718,  718,  721,  718,  714,  716,  711,  719,  728,  717,
			  722,  720,  716,  718,  722,  726,  730,  717,  734,  721,
			  712,    0,  720,  718,  758,    0,  728,    0,    0,    0,
			  721,  722,  753,    0,  759,  734,  753,  726,  747,  747,
			  716,  747,  722,    0,    0,  717,  735,  735,  735,  735,
			  735,  747,  758,  753,  728,  737,  737,  737,  737,  737,
			    0,  747,  759,  734,  753,  726,  738,  738,  738,  738,
			  738,  739,  739,  739,  739,  739,  740,  740,  740,  740,

			  740,  763,  747,  766,  735,  741,  741,  741,  741,  741,
			  742,  742,  742,  742,  742,  744,  744,  744,  744,  744,
			  746,  746,  782,  746,  738,  748,  748,    0,  748,  763,
			  747,  766,    0,  746,  749,  749,  760,  749,  748,  751,
			  751,    0,  751,  746,    0,  754,    0,  749,  748,  754,
			  782,  764,  751,  744,  746,  752,  752,  749,  752,  755,
			  756,  785,  751,  755,  756,  749,  754,  760,  752,  764,
			  798,  757,  757,    0,  757,    0,    0,  754,  752,    0,
			  755,  756,  746,  768,  768,  768,  768,  768,    0,  785,
			    0,  755,  756,  749,  757,  760,  786,  764,  798,  752,

			  770,  770,  770,  770,  770,  771,    0,  771,    0,  795,
			  771,  771,  771,  771,  771,  773,  773,  795,  773,  774,
			  774,  768,  774,  796,    0,  803,  786,  752,  773,    0,
			  795,  796,  774,    0,  775,  775,  797,  775,  773,    0,
			  814,    0,  774,  771,  796,  795,  773,  775,  797,  776,
			  776,    0,  776,  803,  786,  831,  797,  775,    0,  796,
			  791,  791,  776,  791,    0,  823,  831,  774,  814,  797,
			    0,  833,  776,  791,  773,    0,  831,  775,  789,  789,
			  789,  789,  789,  791,  797,  792,  792,    0,  792,  793,
			  793,    0,  793,  823,  831,    0,  774,  776,  792,  833,

			  794,  794,  793,  794,  791,  775,    0,    0,  792,    0,
			    0,    0,  793,  794,  804,  804,  804,  804,  804,    0,
			    0,  808,  808,  794,  808,  810,  776,  805,  805,  805,
			  805,  805,  791,  810,  808,  809,  809,  812,  809,  811,
			  794,  815,    0,  815,  808,    0,  810,  811,  809,  812,
			    0,  815,  817,  817,  817,  817,  817,  812,  809,    0,
			  811,  810,    0,    0,  818,  818,  809,  818,  794,  808,
			  812,    0,    0,  819,  819,  811,  819,  818,    0,  815,
			  825,  825,  825,  825,  825,  812,  819,  818,  826,  826,
			  826,  826,  830,  830,  809,  830,  819,  832,  808,  829,

			  829,  829,  829,  829,  818,  830,    0,    0,  832,  834,
			  834,  834,  834,  834,    0,  830,  836,  836,  832,  836,
			  837,    0,  838,  830,  835,  835,  835,  835,  835,  836,
			    0,  837,  818,  838,    0,    0,  832,    0,    0,  836,
			  841,  837,  841,  838,  840,  840,  840,  840,  840,    0,
			  841,  830,  844,  844,  844,  844,  844,    0,  848,  837,
			  849,  838,  845,  845,  845,  845,  845,  846,  846,  846,
			  846,    0,    0,    0,    0,  848,  852,  849,  841,  848,
			    0,  849,  850,  850,  850,  850,  850,  851,  851,  851,
			  851,  851,  853,  852,    0,    0,    0,  852,  854,  854,

			  854,  854,  854,  848,    0,  849,    0,    0,    0,  853,
			    0,    0,    0,  853,  855,  855,  855,  855,    0,    0,
			    0,  852,  858,  858,  858,  858,  858,  859,  859,  859,
			  859,  859,  860,  860,  860,  860,  860,  853,  862,  862,
			  862,  862,  862,  864,  864,  864,  864,  864,  863,    0,
			  863,    0,  855,  863,  863,  863,  863,  863,  865,  865,
			  865,  865,  865,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  863,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
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
			  879,    0,  879,  879,  879,    0,    0,  879,  879,  879,
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
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
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
			    0,  901,  901,  901,  901,  901,  901,  901,  901,  901,
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
			  866, yy_Dummy>>,
			1, 721, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   77,  185,    0,   68,
			   71, 1605, 5629,   98, 1595, 1556, 1568, 5629,   90,    0,
			 5629, 5629, 5629, 5629, 1554,   88, 1547,   98,  117, 5629,
			 5629, 1536, 5629, 1524, 5629,  275,  279,  285,  119,  296,
			  291,  300,  328,  347,  352,  356,  427,  389,  415,  381,
			  377, 1492, 5629, 5629, 1484,  505,  431,  556,  629,   85,
			   99,   77,  330,   98,   91,  379,  247,  368,  105,  229,
			 1518, 5629, 5629, 1523,  160, 5629,  104,  358,  285,  400,
			  349,  417,  409, 5629,  414, 1466, 5629,  284, 1502,  506,
			  584, 5629,   88,  707, 5629,  167, 1481, 5629, 1473, 5629,

			 1470,    0,  706, 1464, 1466, 1450,  581, 5629,  460,  699,
			  747,  607,  763, 5629, 5629,  607,  618,    0,  785,  789,
			  793,  818,  832,  836,  843,  860,  864,  868,  898,  893,
			  912,  926,  931,  942,  947,  971, 1018,  982, 1010, 1096,
			 1015, 1087, 1121,  996, 1137, 1146, 1021, 1162, 1401,  304,
			 1359, 5629,  507, 1401, 1227, 1393,  261,  280,  356, 1389,
			 1173,  424,  578,  499,  375,  573,  428,  488,  639,  576,
			  608,  785,  756,  895,  618,  758,  790,  782, 1380,  152,
			  770,  801, 1226,  794,  863,  110,  835,  892,  846,  896,
			  922,  923,  933,  978,  928,  933,  976,  980, 1004,  961,

			 1135, 1029,  995, 1004,  245,  439, 5629, 1274, 5629,  324,
			 5629, 5629, 1127,  995, 1044, 1112, 1124,  505, 5629,  922,
			 1223, 5629,  587,  770, 1089, 5629, 1254, 1219,  143, 1306,
			  147,  317, 1396, 5629, 5629, 1229, 1153, 5629, 5629, 5629,
			 1213, 1208, 1204, 1196, 1194, 1192, 1229,  882, 5629, 1218,
			 1240, 1226, 1245, 5629, 1430, 1387, 1397, 1250, 1436, 5629,
			    0, 1172, 1457, 1462, 1468, 1492, 1496, 1507, 1511, 1522,
			 1538, 1552, 1543, 1453, 1571, 1576, 1587, 1601, 1605, 1616,
			 1631, 1629, 1652, 1663, 1684, 1692, 1721, 1700, 1711, 1713,
			 1749, 1755, 1766, 1780, 1784, 1795, 1799, 1816, 1810, 1824,

			 1167, 1832, 1840, 5629, 1169, 1016, 1019,    0, 1857, 1864,
			 1059, 1069, 1169, 1031, 1112, 1113, 1102, 1220, 1204, 1150,
			 1423, 1423, 1473, 1485, 1493, 1431, 1114, 1514,  291, 1641,
			 1504, 1527, 1548, 1556, 1678, 1564, 1569,    0, 1153, 1568,
			 1584, 1761, 1746, 1660, 1668, 1722, 1831, 1702, 1721, 1103,
			 1773, 1796,  580,    0, 1129,  340,  714, 1816,  382, 1821,
			  883, 1825, 1830, 1835, 5629, 1119, 1894, 5629,  711,  728,
			 1101, 1885, 5629, 5629, 1905, 5629, 5629, 5629, 5629, 5629,
			 1910, 1915, 1920, 1931, 1936, 1941, 1960, 1965, 1970, 1985,
			 1993, 1998, 2003,    0, 1062, 2024, 2028, 2035, 2049, 2042,

			 2056, 2075, 2067, 2086, 2113, 2045, 2118, 2124, 2129, 2143,
			 2157, 2161, 2169, 2199, 2139, 2204, 2227, 2259, 2232, 2174,
			 2274, 2280, 2305, 2311, 2188, 2320, 2326, 2344, 2350, 2355,
			  511, 2365, 2373,    0, 1821,  738, 1984, 1048, 1823, 2021,
			 1833, 1856, 1930, 1932,    0, 1897, 1922, 1071, 2110, 2091,
			 1937, 2005, 2120, 1998, 2008, 2062, 2137, 2183, 2072, 2196,
			 2136, 2156, 2195, 2261,    0,    0, 1044, 1038, 2194, 2211,
			 2310, 2242, 2258, 1037,  999, 2390, 2410, 2395, 2415,  976,
			 2420, 2425, 2436, 2441, 2449, 2464,  961, 2469, 2477, 2348,
			  590,  944, 2498, 2504, 2509, 2513, 2530, 2534, 2562, 2571,

			 2577,  935, 2586, 2595, 2601, 2619, 2626, 2634, 5629, 2642,
			 2643, 2663, 2672, 2657, 2299, 2698, 2704, 2713, 2738, 2315,
			  771, 1218, 2229, 5629, 1633,    0,  850,  884,  626, 2276,
			 2341, 2304, 2345, 2382, 2388, 2366, 2511, 2462, 2697,    0,
			 2383,  867, 2391, 2448,    0, 2510, 2525, 2487, 2638, 2482,
			 2508, 2506, 2672, 2514, 2572, 2568, 2573, 2711, 2719, 2756,
			 2728, 2768, 2664, 2773, 2779, 2790, 2795, 2800, 2805, 2810,
			 2823, 2828, 2454, 5629, 2833,    0, 2855, 2860, 2866, 2871,
			 2885, 2896, 2900, 2904, 2844, 2928, 2932, 2936, 2947, 2953,
			 2968, 5629,  851, 2989, 3000, 3014, 3018, 2998, 2999, 3002,

			  403, 5629, 5629, 2835, 1273, 2609,    0,  857, 2698,    0,
			 2739,  834, 2772, 2799,    0, 2893, 2864,  802, 2826, 2871,
			 2887, 2951, 3003, 2922, 2961, 2936, 2939, 3007, 3017,    0,
			 2935, 2952, 2999,  796, 3027, 3034, 3061, 3066, 3076, 3087,
			 3092, 3097, 3002, 3102, 3107,  792, 3112, 3117, 3122, 5629,
			 3131, 3141,    0, 3163, 3168, 3174, 3179, 3193, 3141, 3198,
			 3214, 3222, 3228, 3239, 3177, 3246, 3255, 3260,  747,  720,
			  642,  640,    0, 3002, 3024, 3217,    0, 3044,  604, 3045,
			    0,    0,    0,  596,  590,    0,  582, 3106,    0, 3205,
			  577, 3114, 3121, 3179, 3213,  463, 3268, 3279, 3284, 3290,

			 3295, 3305,  439, 1402, 3310, 3323, 3322, 3327, 3332,  460,
			 3354, 3361, 3379, 5629, 3365, 3344, 3400, 3404, 3418, 3367,
			 3382, 3390, 3402,  463, 3225, 3229, 3420, 3234, 3413, 3302,
			 3377, 3302, 3340,    0, 3423, 3448,  407, 3457, 3468, 3473,
			 3478, 3487, 3492, 5629, 3497,    0, 3518, 3456, 3523, 3532,
			 5629, 3537, 3553, 3424, 3517, 3531, 3532, 3569, 3408, 3408,
			 3521,    0,  443, 3468, 3536,    0, 3457,  370, 3565,  320,
			 3582, 3592,    0, 3613, 3617, 3632, 3647,  919, 5629, 1469,
			  323, 5629, 3489,  763, 3130, 3516, 3581,  950,  393, 3660,
			  517, 3658, 3683, 3687, 3698, 3581, 3595, 3620, 3524,    0,

			  307,    0,  302, 3583, 3696, 3709,    0,  221, 3719, 3733,
			 3697, 3711, 3721, 1033, 3607, 3728,    0, 3734, 3762, 3771,
			  262,  138,  783, 3623,    0, 3762, 3770, 5629,  707, 3781,
			 3790, 3627, 3769, 3638, 3791, 3806, 3814, 3792, 3794,    0,
			 3826, 3827,  103,   82, 3834, 3844, 3849, 5629, 3830, 3832,
			 3864, 3869, 3848, 3864, 3880, 3901, 5629, 5629, 3904, 3909,
			 3914, 5629, 3920, 3935, 3925, 3940, 5629, 3986, 4038, 4090,
			 4142, 4194, 4230, 4268, 4313, 4363, 4415, 4467, 4519, 4570,
			 4620, 4672, 4724, 4770, 4820, 4872, 4917, 4966, 5001, 5051,
			 5092, 5141, 5191, 5240, 5290, 5326, 5365, 5399, 5432, 5466,

			 5505, 5539, 5578, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  866,    1,  867,  867,  868,  868,  866,    7,  869,
			  869,  866,  866,  866,  866,  866,  870,  866,  871,  872,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  874,  866,  866,  875,  866,   55,   55,  866,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  866,  866,  866,  876,  866,  866,  866,  876,  876,  876,
			  876,  876,  877,  866,  877,  878,  866,  879,  866,  879,
			  879,  866,  880,  881,  866,  866,  866,  866,  870,  866,

			  882,  882,  882,  883,  884,  866,  866,  866,  866,  885,
			  866,  866,  866,  866,  866,  866,  873,  886,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,   46,  873,  873,  873,
			  873,   46,  873,  873,  873,  873,  873,  873,  874,  874,
			  875,  866,  866,  866,   58,  866,  154,  154,  154,   58,
			   58,   58,   58,   58,  154,   58,  154,  154,   58,   58,
			  154,  154,   58,   58,  154,  154,   58,   58,  154,   58,
			  154,  154,  154,   58,   58,   58,  154,   58,  154,   58,
			  154,  154,   58,   58,  154,  154,   58,   58,  154,  154,

			   58,   58,  154,   58,  154,   58,  866,  876,  866,  866,
			  866,  866,  876,  876,  876,  876,  876,  877,  866,  877,
			  878,  866,  878,  879,  879,  866,  866,  866,  866,  866,
			  866,  880,  881,  866,  866,  232,  887,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  888,  886,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  866,  873,  873,  873,  873,  873,  873,
			  873,  866,  873,  873,  873,  873,  873,  139,  139,  139,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,

			  866,  874,  874,  866,  866,  154,  154,  154,  866,  154,
			   58,   58,   58,  154,   58,  154,  154,   58,   58,  154,
			  154,  154,   58,   58,   58,  154,  154,   58,   58,  866,
			  154,  154,  154,   58,   58,  154,   58,  154,   58,  154,
			  154,   58,   58,  154,  154,   58,   58,  154,  154,  154,
			   58,   58,   58,  154,   58,  154,   58,  876,  876,  876,
			  876,  876,  876,  876,  866,  889,  889,  866,  889,  889,
			  889,  887,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  890,  886,  873,  873,  873,  873,  873,

			  873,  873,  873,  873,  873,  866,  873,  873,  873,  873,
			  873,  873,  866,  139,  139,  413,  413,  873,  136,  866,
			  417,  417,  873,  873,  866,  873,  873,  873,  873,  873,
			  891,  874,  874,  892,  154,  154,   58,   58,  154,   58,
			  154,  154,   58,   58,  154,  154,  154,   58,   58,   58,
			  154,  154,   58,  154,  154,  154,   58,   58,  154,   58,
			  154,  154,   58,   58,  154,  154,   58,   58,  154,  154,
			  154,   58,   58,  154,   58,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  885,  866,  866,
			  866,  890,  873,  873,  873,  873,  873,  873,  873,  873,

			  873,  866,  873,  873,  873,  873,  873,  873,  866,  417,
			  873,  866,  417,  512,  866,  873,  873,  873,  873,  888,
			  866,  893,  891,  866,  866,  154,  154,   58,   58,  154,
			   58,  154,  154,   58,   58,  154,  154,   58,   58,  154,
			  154,   58,  154,  154,  154,   58,   58,  154,   58,  154,
			  154,   58,   58,  154,  154,  154,  154,   58,   58,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  894,  895,  873,  873,  873,  873,
			  873,  873,  873,  873,  866,  873,  873,  873,  873,  873,
			  417,  866,  866,  873,  873,  873,  873,  866,  890,  890,

			  893,  866,  866,  866,  866,  154,  154,   58,  154,  154,
			   58,   58,  154,  154,  154,   58,   58,   58,  154,  154,
			  154,   58,   58,  154,   58,  154,  154,   58,   58,  154,
			  154,  154,  154,   58,   58,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  896,  873,  873,  873,  873,  873,  866,  873,
			  873,  873,  873,  873,  866,  873,  873,  873,  866,  866,
			  890,  890,  897,  154,  154,   58,  154,  154,   58,   58,
			  154,  154,  154,   58,   58,  154,   58,  154,  154,   58,
			   58,  154,  154,  154,   58,  866,  866,  866,  866,  866,

			  866,  866,  866,  866,  866,  866,  866,  866,  866,  896,
			  873,  873,  873,  866,  873,  866,  873,  873,  873,  866,
			  866,  895,  895,  898,  154,  154,   58,  154,   58,  154,
			   58,  154,  154,  154,   58,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  899,  873,  873,  873,  873,
			  866,  873,  873,  866,  866,  896,  896,  866,  154,  154,
			   58,  154,   58,  154,   58,  154,  154,   58,  866,  866,
			  866,  866,  900,  873,  873,  873,  873,  866,  866,  896,
			  896,  866,  154,  154,   58,  154,   58,  154,  866,  866,
			  900,  873,  873,  873,  873,  866,  866,  896,  154,  154,

			   58,  154,   58,  154,  866,  866,  901,  866,  873,  873,
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

	yyJam_base: INTEGER = 5629
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
