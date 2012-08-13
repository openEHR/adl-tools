note
	component:   "openEHR Archetype Project"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues"
	copyright:   "Copyright (c) 2003-2007 Ocean Informatics Pty Ltd"
	license:     "Mozilla tri-license"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_SCANNER

inherit
	ANY_VALIDATOR
		rename
			reset as validator_reset
		end

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
if yy_act <= 68 then
if yy_act <= 34 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 80 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 80")
end
-- Ignore separators
else
--|#line 81 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 81")
end
in_lineno := in_lineno + text_count
end
else
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 87 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 87")
end
in_lineno := in_lineno + 1
else
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Plus_code
else
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Slash_code
else
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Equal_code
else
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Semicolon_code
else
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Colon_code
else
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := Left_parenthesis_code
else
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
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
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := Dollar_code
else
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := SYM_DT_UNKNOWN
end
else
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := Question_mark_code
end
else
if yy_act = 21 then
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 112 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 112")
end
last_token := Right_bracket_code
else
--|#line 114 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 114")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 25 then
--|#line 115 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 115")
end
last_token := SYM_END_CBLOCK
else
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_LE
else
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_NE
end
else
if yy_act = 29 then
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
end
last_token := SYM_LT
else
--|#line 122 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 122")
end
last_token := SYM_GT
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 124 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 124")
end
last_token := SYM_MODULO
else
--|#line 125 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 125")
end
last_token := SYM_DIV
end
else
if yy_act = 33 then
--|#line 127 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 127")
end
last_token := SYM_ELLIPSIS
else
--|#line 128 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 128")
end
last_token := SYM_LIST_CONTINUE
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
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_MATCHES
else
--|#line 134 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 134")
end
last_token := SYM_MATCHES
end
else
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_THEN
end
else
if yy_act = 38 then
--|#line 140 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 140")
end
last_token := SYM_ELSE
else
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_AND
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_OR
else
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_XOR
end
else
if yy_act = 42 then
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_NOT
else
--|#line 150 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 150")
end
last_token := SYM_IMPLIES
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_TRUE
else
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
end
last_token := SYM_FALSE
end
else
if yy_act = 46 then
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_FORALL
else
--|#line 158 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 158")
end
last_token := SYM_EXISTS
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_EXISTENCE
else
--|#line 164 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 164")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 50 then
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_CARDINALITY
else
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_ORDERED
end
end
end
end
else
if yy_act <= 60 then
if yy_act <= 56 then
if yy_act <= 54 then
if yy_act <= 53 then
if yy_act = 52 then
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_UNORDERED
else
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_UNIQUE
end
else
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_INFINITY
end
else
if yy_act = 55 then
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_USE_NODE
else
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_USE_ARCHETYPE
end
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 59 then
--|#line 184 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 184")
end
last_token := SYM_EXCLUDE
else
--|#line 186 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 186")
end
last_token := SYM_AFTER
end
end
end
else
if yy_act <= 64 then
if yy_act <= 62 then
if yy_act = 61 then
--|#line 188 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 188")
end
last_token := SYM_BEFORE
else
--|#line 190 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 190")
end
last_token := SYM_CLOSED
end
else
if yy_act = 63 then
--|#line 193 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 193")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 199 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 199")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 66 then
if yy_act = 65 then
--|#line 204 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 204")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 211 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 211")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 67 then
--|#line 227 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 227")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 235 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 235")
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
if yy_act <= 102 then
if yy_act <= 85 then
if yy_act <= 77 then
if yy_act <= 73 then
if yy_act <= 71 then
if yy_act <= 70 then
if yy_act = 69 then
--|#line 242 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 242")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 249 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 249")
end
in_lineno := in_lineno + text_count
end
else
--|#line 252 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 252")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 72 then
--|#line 254 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 254")
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
			
else
--|#line 275 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 275")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
end
else
if yy_act <= 75 then
if yy_act = 74 then
--|#line 281 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 281")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 288 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 288")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 76 then
--|#line 289 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 289")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 290 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 81 then
if yy_act <= 79 then
if yy_act = 78 then
--|#line 297 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 297")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 298 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 298")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 80 then
--|#line 305 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 305")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 306 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 306")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 83 then
if yy_act = 82 then
--|#line 313 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 313")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 314 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 314")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 84 then
--|#line 321 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 321")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 333 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 333")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 94 then
if yy_act <= 90 then
if yy_act <= 88 then
if yy_act <= 87 then
if yy_act = 86 then
--|#line 343 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 343")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 348 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 348")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
--|#line 358 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 358")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 89 then
--|#line 364 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 364")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 374 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 374")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 92 then
if yy_act = 91 then
--|#line 375 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 375")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 389 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 389")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 93 then
--|#line 396 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 396")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 402 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 402")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 98 then
if yy_act <= 96 then
if yy_act = 95 then
--|#line 408 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 408")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 412 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 412")
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

				dadl_parser.execute(str_, source_start_line + in_lineno)
				if not dadl_parser.syntax_error then
					if dadl_parser.output.is_typed then
						tid := dynamic_type_from_string(dadl_parser.output.im_type_name)
						if tid >= 0 then
							if attached {C_DOMAIN_TYPE} dadl_parser.output.as_object(tid, Void) as cdt then
								c_domain_type := cdt
								last_token := V_C_DOMAIN_TYPE
							else
								dadl_parser_error := "Conversion of " + dadl_parser.output.im_type_name + " failed"
								last_token := ERR_C_DOMAIN_TYPE
							end
						else
							dadl_parser_error := "Domain type " + dadl_parser.output.im_type_name + " unknown or not visible in type system"
							last_token := ERR_C_DOMAIN_TYPE
						end
					else
						dadl_parser_error := "Domain type in dADL section not typed"
						last_token := ERR_C_DOMAIN_TYPE
					end
				else
					dadl_parser_error := dadl_parser.errors.last_added.message
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
end
else
if yy_act = 97 then
--|#line 453 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 453")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 459 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 459")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 100 then
if yy_act = 99 then
--|#line 465 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 465")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 471 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 471")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 101 then
--|#line 478 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 478")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
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
if yy_act <= 119 then
if yy_act <= 111 then
if yy_act <= 107 then
if yy_act <= 105 then
if yy_act <= 104 then
if yy_act = 103 then
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[code]"
				last_token := V_REL_PATH
				last_string_value := text
			
else
--|#line 496 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 496")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 106 then
--|#line 507 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 507")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 511 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 511")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 109 then
if yy_act = 108 then
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
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
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 110 then
--|#line 534 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 534")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 539 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 539")
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
if yy_act <= 115 then
if yy_act <= 113 then
if yy_act = 112 then
	yy_end := yy_end - 1
--|#line 554 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 554")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 555 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 555")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 114 then
--|#line 556 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 556")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 560 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 560")
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
if yy_act <= 117 then
if yy_act = 116 then
--|#line 561 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 561")
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
--|#line 562 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 562")
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
if yy_act = 118 then
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 587 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 587")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
end
end
end
else
if yy_act <= 128 then
if yy_act <= 124 then
if yy_act <= 122 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 595 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 595")
end
in_buffer.append_character ('\')
else
--|#line 597 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 597")
end
in_buffer.append_character ('"')
end
else
--|#line 599 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 599")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 123 then
--|#line 603 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 603")
end
in_buffer.append_string (text)
else
--|#line 605 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 605")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 126 then
if yy_act = 125 then
--|#line 610 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 610")
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
--|#line 621 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 621")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 127 then
--|#line 630 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 630")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 632 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 632")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 132 then
if yy_act <= 130 then
if yy_act = 129 then
--|#line 633 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 633")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 634 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 634")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 131 then
--|#line 635 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 635")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 636 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 636")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 134 then
if yy_act = 133 then
--|#line 638 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 638")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 639 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 639")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 135 then
--|#line 643 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 643")
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
			create an_array.make (0, 5640)
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
			   27,   28,   28,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   38,   41,   42,   38,
			   43,   44,   45,   46,   38,   38,   38,   47,   48,   38,
			   49,   50,   38,   51,   52,   53,   54,   12,   55,   56,
			   57,   58,   59,   60,   58,   61,   62,   58,   63,   64,
			   65,   58,   58,   58,   58,   66,   67,   58,   58,   68,
			   69,   70,   71,   72,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   74,   83,   93,   83,   75,   74,   93,

			  101,   95,   75,   95,   95,  105,  893,  106,  106,  106,
			  106,  106,  106,  109,  226,  110,  239,  111,  111,  111,
			  111,  111,  111,  117,  117,  178,  117,  182,  269,  190,
			   84,   85,   84,   85,  109,  174,  110,  179,  113,  113,
			  113,  113,  113,  113,   76,  102,  175,  119,  192,   76,
			   94,  227,  228,  180,   94,  183,  112,  191,  213,  269,
			  213,  213,  892,  176,   95,  181,   95,   95,  341,  235,
			  345,  240,  235,  599,  599,  177,  193,  112,   77,   78,
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
			  117,  117,  194,  117,  117,  117,  208,  117,  850,  851,
			  117,  117,  206,  117,  316,  195,  214,  198,  212,  237,

			  117,  117,  237,  117,  119,  199,  117,  117,  119,  117,
			  196,  876,  212,  120,  119,  209,  123,  121,  124,  122,
			  207,  202,  316,  197,  119,  200,  203,  125,  117,  117,
			  119,  117,  604,  201,  134,  117,  117,  126,  117,  117,
			  117,  120,  117,  215,  123,  121,  124,  122,  127,  204,
			  117,  117,  119,  117,  205,  125,  128,  117,  117,  119,
			  117,  212,  134,  119,  369,  126,  117,  117,  129,  117,
			  130,  317,  222,  112,  119,  875,  212,  127,  217,  135,
			  455,  119,  229,  497,  128,  259,  861,  136,  131,  132,
			  119,  219,  219,  369,  133,  455,  129,  269,  130,  317,

			  137,  117,  117,  212,  117,  146,  310,  135,  223,  224,
			  147,  117,  117,  269,  117,  136,  131,  132,  223,  224,
			  378,  260,  133,  154,  230,  119,  154,  230,  137,  117,
			  117,  155,  117,  146,  212,  119,  144,  495,  147,  216,
			  216,  216,  311,  318,  145,  138,  138,  138,  138,  138,
			  138,  148,  269,  119,  218,  218,  218,  312,  545,  325,
			  139,  546,  117,  117,  144,  117,  495,  140,  168,  157,
			  269,  318,  145,  157,  141,  157,  142,  232,  143,  148,
			  170,  220,  220,  220,  316,  157,  119,  325,  139,  171,
			  789,  157,  184,  185,  163,  140,  169,  163,  186,  117,

			  117,  163,  117,  163,  269,  142,  369,  143,  172,  163,
			  163,  149,  322,  163,  217,  234,  269,  173,  234,  163,
			  187,  188,  318,  268,  327,  163,  189,  235,  236,  261,
			  261,  261,  261,  261,  261,  370,  325,  832,  237,  328,
			  149,  154,  234,  545,  154,  234,  545,  789,  269,  155,
			  324,  269,  327,  595,  235,  876,  156,  157,  157,  157,
			  157,  157,  157,  158,  326,  237,  269,  328,  232,  157,
			  157,  157,  157,  157,  159,  157,  157,  157,  160,  157,
			  161,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  162,  328,  910,  232,  157,  163,  163,  164,

			  163,  163,  165,  163,  163,  163,  166,  163,  167,  163,
			  163,  163,  163,  163,  164,  163,  163,  163,  163,  163,
			  154,  330,  269,  154,  213,  269,  213,  213,  155,  263,
			  263,  263,  263,  263,  263,  156,  157,  157,  157,  157,
			  157,  157,  158,  212,  331,  264,  317,  632,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  162,  331,  264,  323,  157,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  242,

			  242,  254,  242,  254,  254,  247,  267,  267,  267,  267,
			  267,  267,  850,  851,  248,  248,  248,  248,  248,  248,
			  226,  216,  216,  216,  222,  243,  380,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  249,  256,  256,  256,  256,  256,  256,  227,  228,  269,
			  223,  224,  269,  227,  228,  250,  156,  257,  109,  251,
			  110,  252,  265,  265,  265,  265,  265,  265,  266,  109,
			  244,  110,  337,  265,  265,  265,  265,  265,  265,  327,
			  258,  117,  117,  331,  117,  257,  117,  117,  239,  117,

			  117,  117,  451,  117,  269,  117,  117,  338,  117,  269,
			  337,  112,  156,  269,  269,  119,  801,  329,  269,  552,
			  119,  334,  112,  342,  119,  117,  117,  349,  117,  119,
			  117,  117,  789,  117,  229,  338,  273,  272,  269,  117,
			  117,  271,  117,  269,  117,  117,  269,  117,  552,  119,
			  269,  342,  269,  240,  119,  349,  471,  269,  274,  117,
			  117,  269,  117,  119,  273,  272,  509,  500,  119,  271,
			  223,  224,  269,  275,  117,  117,  338,  117,  342,  276,
			  269,  117,  117,  119,  117,  337,  274,  269,  277,  278,
			  117,  117,  269,  117,  269,  279,  117,  117,  119,  117,

			  502,  275,  332,  269,  340,  119,  346,  276,  333,  269,
			  269,  280,  282,  339,  119,  502,  277,  278,  117,  117,
			  119,  117,  351,  279,  281,  117,  117,  269,  117,  212,
			  332,  269,  117,  117,  353,  117,  333,  283,  269,  280,
			  117,  117,  119,  117,  343,  269,  269,  344,  284,  119,
			  351,  285,  281,  269,  117,  117,  119,  117,  117,  117,
			  269,  117,  353,  763,  119,  283,  762,  269,  269,  354,
			  634,  269,  343,  634,  269,  344,  284,  287,  119,  285,
			  286,  269,  119,  761,  289,  288,  354,  117,  117,  290,
			  117,  117,  117,  357,  117,  635,  269,  354,  343,  358, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  269,  344,  492,  760,  269,  287,  349,  269,  219,  219,
			  636,  119,  289,  288,  356,  119,  269,  290,  291,  269,
			  291,  357,  139,  269,  353,  636,  347,  358,  351,  348,
			  117,  117,  297,  117,  350,  357,  297,  292,  142,  743,
			  332,  293,  259,  269,  294,  269,  333,  269,  363,  367,
			  139,  118,  355,  295,  119,  296,  352,  253,  253,  453,
			  253,  139,  454,  359,  363,  292,  269,  142,  335,  293,
			  117,  117,  294,  117,  336,  297,  363,  367,  269,  269,
			  358,  395,  295,  269,  296,  117,  117,  453,  117,  139,
			  454,  269,  366,  771,  119,  269,  367,  212,  269,  156,

			  701,  298,  298,  298,  298,  298,  298,  269,  360,  119,
			  118,  118,  118,  118,  118,  118,  304,  269,  117,  117,
			  299,  117,  771,  300,  368,  117,  117,  212,  117,  301,
			  361,  269,  117,  117,  362,  117,  269,  212,  269,  297,
			  212,  269,  119,  118,  304,  269,  458,  269,  299,  119,
			  302,  300,  460,  303,  637,  269,  119,  301,  361,  361,
			  453,  305,  362,  362,  307,  306,  117,  117,  269,  117,
			  117,  117,  118,  117,  458,  216,  216,  216,  302,  269,
			  460,  303,  230,  269,  461,  230,  460,  364,  456,  305,
			  119,  365,  307,  306,  119,  269,  320,  637,  321,  321,

			  321,  321,  321,  321,  614,  376,  376,  376,  234,  308,
			  464,  234,  461,  605,  462,  377,  377,  377,  109,  309,
			  235,  371,  372,  373,  374,  375,  544,  234,  544,  465,
			  234,  237,  269,  387,  387,  232,  387,  308,  464,  235,
			  389,  390,  390,  390,  390,  390,  390,  839,  309,  269,
			  237,  399,  399,  399,  399,  399,  399,  465,  910,  243,
			  397,  232,  397,  461,  269,  398,  398,  398,  398,  398,
			  398,  401,  401,  401,  401,  401,  401,  405,  269,  405,
			  232,  269,  406,  406,  406,  406,  406,  406,  550,  840,
			  411,  463,  157,  157,  157,  157,  157,  157,  157,  157,

			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  381,  382,  383,  381,  382,
			  381,  381,  381,  381,  381,  381,  381,  381,  384,  236,
			  236,  381,  236,  236,  236,  236,  236,  236,  381,  385,
			  381,  381,  381,  381,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  381,  381,  386,
			  381,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  381,  381,  381,  381,  381,

			  381,  381,  381,  381,  381,  381,  381,  242,  242,  383,
			  242,  408,  408,  408,  408,  408,  409,  409,  409,  409,
			  409,  409,  430,  430,  430,  430,  430,  430,  384,  383,
			  383,  384,  379,  243,  269,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  396,  396,
			  396,  396,  396,  396,  402,  402,  402,  402,  402,  402,
			  269,  269,  466,  492,  257,  385,  383,  109,  385,  110,
			  403,  407,  407,  407,  407,  407,  407,  269,  244,  464,
			  269,  117,  117,  470,  117,  471,  473,  258,  117,  117,

			  466,  117,  257,  404,  269,  552,  117,  117,  403,  117,
			  269,  269,  474,  117,  117,  119,  117,  467,  466,  269,
			  112,  470,  119,  412,  473,  269,  269,  452,  117,  117,
			  119,  117,  117,  117,  555,  117,  448,  119,  413,  545,
			  474,  269,  546,  411,  269,  269,  469,  117,  117,  465,
			  117,  412,  119,  414,  117,  117,  119,  117,  400,  415,
			  269,  117,  117,  437,  117,  437,  413,  269,  910,  117,
			  117,  119,  117,  422,  269,  470,  416,  468,  119,  417,
			  475,  414,  269,  476,  422,  119,  438,  415,  394,  439,
			  393,  418,  632,  119,  422,  440,  117,  117,  635,  117,

			  269,  635,  269,  472,  416,  419,  709,  417,  475,  269,
			  392,  476,  422,  420,  438,  117,  117,  439,  117,  418,
			  119,  117,  117,  440,  117,  391,  473,  454,  269,  117,
			  117,  388,  117,  419,  269,  117,  117,  315,  117,  119,
			  269,  420,  269,  117,  117,  119,  117,  910,  269,  422,
			  480,  421,  423,  119,  477,  457,  269,  233,  424,  119,
			  422,  117,  117,  475,  117,  425,  378,  119,  482,  483,
			  422,  426,  379,  427,  269,  269,  117,  117,  480,  117,
			  423,  117,  117,  378,  117,  119,  424,  269,  422,  269,
			  212,  479,  843,  425,  269,  269,  482,  483,  345,  426,

			  119,  427,  458,  282,  269,  119,  269,  117,  117,  847,
			  117,  474,  480,  429,  433,  433,  433,  433,  433,  433,
			  269,  843,  428,  431,  431,  431,  431,  431,  431,  319,
			  459,  119,  434,  434,  434,  434,  434,  434,  847,  478,
			  481,  429,  495,  118,  435,  435,  435,  435,  435,  435,
			  428,  315,  432,  436,  436,  436,  436,  436,  436,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  496,  117,  117,  486,  117,  117,  117,  487,  117,
			  117,  117,  490,  117,  118,  269,  848,  848,  848,  269,
			  269,  313,  269,  269,  117,  117,  119,  117,  117,  117,

			  119,  117,  486,  269,  119,  269,  487,  269,  153,  483,
			  490,  269,  118,  269,  117,  117,  301,  117,  119,  441,
			  442,  269,  119,  310,  255,  482,  443,  269,  117,  117,
			  491,  117,  490,  117,  117,  491,  117,  485,  119,  486,
			  487,  269,  117,  117,  301,  117,  269,  441,  117,  117,
			  212,  117,  119,  484,  443,  269,  444,  119,  491,  212,
			  493,  269,  212,  494,  254,  212,  119,  488,  489,  212,
			  253,  445,  119,  449,  246,  449,  449,  449,  449,  449,
			  449,  310,  634,   99,  444,  634,   96,  450,  446,  450,
			  450,  450,  450,  450,  450,  310,  551,  447,  320,  445,

			  320,  320,  320,  320,  320,  320,  320,  635,  321,  321,
			  321,  321,  321,  321,  398,  398,  398,  398,  398,  398,
			  387,  387,  910,  387,  551,  631,  447,  233,  216,  216,
			  216,  499,  499,  499,  499,  499,  499,  218,  218,  218,
			  220,  220,  220,  216,  216,  216,  910,  216,  216,  216,
			  382,  383,  212,  382,  389,  390,  390,  390,  390,  390,
			  390,  210,  384,  498,  498,  498,  498,  498,  498,  269,
			  500,  269,  556,  385,  153,  633,  151,  558,  116,  257,
			  501,  501,  501,  501,  501,  501,  503,  503,  503,  503,
			  503,  503,  504,  504,  504,  504,  504,  504,  115,  551, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  556,  556,  258,  386,  505,  558,  505,  257,  403,  506,
			  506,  506,  506,  506,  506,  507,  507,  507,  507,  507,
			  507,  406,  406,  406,  406,  406,  406,  554,  114,  557,
			  107,  404,  783,  783,  783,  783,  403,  508,  508,  508,
			  508,  508,  508,  510,  511,  104,  512,  512,  512,  512,
			  512,  512,  513,  513,  513,  513,  513,  513,  514,  514,
			  514,  514,  514,  514,  117,  117,   99,  117,  117,  117,
			  559,  117,   97,  525,  269,  867,  509,  269,   96,  910,
			  910,  269,  117,  117,  525,  117,  117,  117,  119,  117,
			  910,  269,  119,  559,  525,  269,  269,  539,  559,  269,

			  117,  117,  910,  117,  867,  910,  119,  516,  539,  562,
			  119,  910,  525,  269,  558,  517,  117,  117,  539,  117,
			  910,  561,  519,  910,  119,  518,  269,  563,  563,  269,
			  117,  117,  520,  117,  910,  516,  539,  562,  117,  117,
			  119,  117,  560,  269,  517,  117,  117,  566,  117,  910,
			  519,  269,  910,  518,  119,  563,  565,  910,  269,  562,
			  520,  910,  119,  567,  910,  117,  117,  910,  117,  119,
			  910,  117,  117,  569,  117,  566,  521,  523,  269,  117,
			  117,  910,  117,  522,  269,  117,  117,  564,  117,  119,
			  910,  567,  269,  524,  570,  119,  269,  910,  269,  117,

			  117,  569,  117,  119,  521,  523,  269,  526,  571,  119,
			  910,  522,  269,  117,  117,  566,  117,  117,  117,  572,
			  117,  524,  570,  119,  528,  527,  269,  910,  269,  569,
			  269,  117,  117,  269,  117,  526,  571,  119,  529,  269,
			  269,  119,  910,  568,  269,  576,  910,  572,  530,  910,
			  269,  578,  528,  527,  291,  119,  291,  573,  579,  910,
			  531,  570,  576,  578,  910,  571,  529,  430,  430,  430,
			  430,  430,  430,  576,  532,  118,  530,  293,  118,  578,
			  534,  582,  583,  582,  118,  639,  579,  118,  531,  574,
			  577,  580,  291,  575,  291,  533,  433,  433,  433,  433,

			  433,  433,  532,  118,  910,  293,  118,  910,  534,  582,
			  583,  586,  118,  639,  269,  910,  910,  641,  534,  910,
			  910,  910,  910,  533,  910,  118,  434,  434,  434,  434,
			  434,  434,  435,  435,  435,  435,  435,  435,  436,  436,
			  436,  436,  436,  436,  579,  641,  534,  535,  534,  536,
			  536,  536,  536,  536,  536,  910,  910,  642,  601,  118,
			  601,  118,  537,  537,  537,  537,  537,  537,  910,  602,
			  910,  118,  581,  910,  910,  535,  534,  538,  538,  538,
			  538,  538,  538,  117,  117,  642,  117,  910,  118,  117,
			  117,  118,  117,  910,  269,  910,  269,  603,  117,  117,

			  118,  117,  269,  910,  269,  910,  118,  119,  910,  584,
			  269,  269,  583,  119,  117,  117,  645,  117,  117,  117,
			  585,  117,  119,  117,  117,  651,  117,  269,  910,  639,
			  641,  269,  117,  117,  910,  117,  269,  584,  119,  910,
			  587,  910,  119,  910,  645,  544,  910,  119,  585,  541,
			  910,  542,  269,  651,  910,  910,  119,  640,  643,  910,
			  540,  449,  543,  449,  449,  449,  449,  449,  449,  310,
			  642,  498,  498,  498,  498,  498,  498,  541,  450,  542,
			  450,  450,  450,  450,  450,  450,  310,  588,  540,  553,
			  543,  553,  553,  553,  553,  553,  553,  652,  644,  910,

			  548,  589,  589,  589,  589,  589,  589,  590,  590,  590,
			  590,  590,  590,  910,  910,  588,  910,  549,  591,  591,
			  591,  591,  591,  591,  592,  652,  592,  592,  592,  592,
			  592,  592,  593,  593,  593,  593,  593,  593,  910,  653,
			  500,  506,  506,  506,  506,  506,  506,  269,  403,  594,
			  594,  594,  594,  594,  594,  596,  596,  596,  596,  596,
			  596,  597,  597,  597,  597,  597,  597,  653,  910,  654,
			  654,  404,  117,  117,  646,  117,  403,  598,  598,  598,
			  598,  598,  598,  910,  269,  269,  647,  910,  595,  593,
			  593,  593,  593,  593,  593,  658,  119,  654,  657,  660,

			  509,  910,  646,  652,  511,  600,  512,  512,  512,  512,
			  512,  512,  117,  117,  647,  117,  117,  117,  269,  117,
			  910,  117,  117,  658,  117,  269,  910,  660,  910,  269,
			  910,  655,  269,  600,  269,  910,  119,  658,  117,  117,
			  119,  117,  910,  623,  910,  119,  117,  117,  607,  117,
			  645,  269,  628,  910,  623,  117,  117,  269,  117,  269,
			  608,  910,  119,  629,  623,  659,  661,  606,  269,  609,
			  119,  117,  117,  630,  117,  653,  607,  610,  648,  119,
			  117,  117,  623,  117,  269,  910,  269,  611,  608,  117,
			  117,  629,  117,  269,  661,  119,  910,  609,  664,  612,

			  910,  269,  269,  656,  119,  610,  117,  117,  910,  117,
			  665,  117,  117,  119,  117,  611,  660,  613,  910,  269,
			  646,  615,  910,  269,  269,  910,  664,  612,  117,  117,
			  119,  117,  647,  117,  117,  119,  117,  616,  665,  666,
			  910,  269,  661,  667,  662,  613,  269,  617,  649,  615,
			  117,  117,  119,  117,  269,  117,  117,  119,  117,  269,
			  650,  839,  910,  269,  694,  616,  910,  666,  269,  269,
			  663,  667,  789,  664,  119,  617,  619,  673,  665,  119,
			  711,  694,  618,  712,  712,  694,  910,  620,  621,  621,
			  621,  621,  621,  621,  118,  118,  118,  118,  118,  118,

			  258,  668,  910,  841,  619,  673,  669,  910,  711,  694,
			  618,  712,  713,  910,  705,  620,  714,  118,  536,  536,
			  536,  536,  536,  536,  437,  705,  437,  910,  537,  537,
			  537,  537,  537,  537,  705,  706,  538,  538,  538,  538,
			  538,  538,  715,  269,  714,  707,  622,  910,  117,  117,
			  439,  117,  910,  705,  706,  708,  440,  118,  118,  910,
			  910,  269,  714,  117,  117,  708,  117,  910,  117,  117,
			  715,  117,  119,  707,  622,  708,  269,  910,  439,  910,
			  624,  269,  718,  269,  440,  910,  118,  119,  117,  117,
			  716,  117,  119,  708,  719,  625,  720,  670,  721,  670,

			  910,  269,  671,  671,  671,  671,  671,  671,  624,  715,
			  718,  626,  119,  553,  910,  553,  553,  553,  553,  553,
			  553,  269,  719,  625,  720,  910,  721,  910,  627,  671,
			  671,  671,  671,  671,  671,  269,  910,  717,  910,  626,
			  672,  672,  672,  672,  672,  672,  677,  677,  677,  677,
			  677,  677,  638,  721,  720,  592,  627,  592,  592,  592,
			  592,  592,  592,  684,  684,  684,  684,  684,  500,  593,
			  593,  593,  593,  593,  593,  676,  676,  676,  676,  676,
			  676,  724,  723,  910,  910,  675,  678,  678,  678,  678,
			  678,  678,  910,  910,  674,  679,  679,  679,  679,  679, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  679,  680,  680,  680,  680,  680,  680,  681,  681,  681,
			  681,  681,  681,  675,  595,  682,  910,  682,  910,  269,
			  679,  679,  679,  679,  679,  679,  683,  683,  683,  683,
			  683,  683,  910,  910,  509,  686,  686,  686,  686,  686,
			  686,  117,  117,  725,  117,  910,  117,  117,  727,  117,
			  719,  687,  910,  910,  269,  910,  910,  728,  731,  269,
			  117,  117,  910,  117,  269,  119,  732,  733,  741,  689,
			  119,  725,  269,  269,  117,  117,  727,  117,  722,  687,
			  117,  117,  728,  117,  119,  728,  731,  269,  690,  117,
			  117,  404,  117,  269,  732,  733,  741,  689,  119,  910,

			  910,  910,  269,  725,  119,  117,  117,  766,  117,  269,
			  730,  910,  691,  119,  117,  117,  690,  117,  269,  117,
			  117,  910,  117,  117,  117,  767,  117,  269,  692,  119,
			  910,  726,  269,  769,  910,  766,  269,  910,  119,  731,
			  691,  117,  117,  119,  117,  117,  117,  119,  117,  117,
			  117,  693,  117,  767,  269,  696,  692,  910,  269,  773,
			  269,  769,  269,  695,  910,  119,  269,  734,  910,  119,
			  910,  117,  117,  119,  117,  910,  910,  769,  910,  693,
			  910,  699,  269,  696,  269,  727,  697,  773,  910,  698,
			  910,  695,  291,  910,  291,  119,  621,  621,  621,  621,

			  621,  621,  700,  117,  117,  770,  117,  117,  117,  699,
			  117,  910,  910,  729,  697,  910,  269,  698,  771,  910,
			  269,  117,  117,  910,  117,  118,  910,  119,  910,  910,
			  700,  119,  269,  910,  269,  117,  117,  710,  117,  710,
			  710,  710,  710,  710,  710,  119,  775,  772,  269,  910,
			  702,  703,  671,  671,  671,  671,  671,  671,  773,  119,
			  671,  671,  671,  671,  671,  671,  704,  735,  735,  735,
			  735,  735,  735,  910,  775,  736,  910,  736,  702,  703,
			  737,  737,  737,  737,  737,  737,  774,  910,  910,  910,
			  738,  910,  738,  910,  704,  739,  739,  739,  739,  739,

			  739,  739,  739,  739,  739,  739,  739,  740,  740,  740,
			  740,  740,  740,  679,  679,  679,  679,  679,  679,  742,
			  742,  742,  742,  742,  742,  679,  679,  679,  679,  679,
			  679,  744,  744,  744,  744,  744,  744,  910,  269,  910,
			  595,  745,  745,  745,  745,  745,  745,  746,  746,  746,
			  746,  746,  746,  910,  910,  776,  753,  117,  117,  747,
			  117,  747,  767,  741,  748,  748,  748,  748,  748,  748,
			  269,  117,  117,  753,  117,  117,  117,  753,  117,  117,
			  117,  119,  117,  776,  269,  910,  404,  777,  269,  910,
			  768,  741,  269,  117,  117,  119,  117,  802,  910,  119,

			  750,  753,  803,  119,  910,  269,  269,  910,  751,  752,
			  117,  117,  910,  117,  910,  777,  910,  119,  117,  117,
			  805,  117,  910,  269,  775,  802,  117,  117,  750,  117,
			  803,  269,  117,  117,  119,  117,  751,  752,  910,  269,
			  117,  117,  119,  117,  756,  269,  117,  117,  805,  117,
			  119,  269,  778,  269,  117,  117,  119,  117,  269,  269,
			  807,  756,  797,  809,  119,  756,  797,  269,  117,  117,
			  119,  117,  810,  826,  803,  754,  910,  805,  119,  755,
			  910,  269,  827,  797,  117,  117,  757,  117,  807,  756,
			  910,  809,  119,  910,  797,  910,  910,  269,  910,  910,

			  810,  826,  804,  758,  754,  806,  910,  755,  119,  910,
			  827,  910,  910,  910,  757,  710,  759,  710,  710,  710,
			  710,  710,  710,  737,  737,  737,  737,  737,  737,  910,
			  910,  758,  779,  779,  779,  779,  779,  779,  739,  739,
			  739,  739,  739,  739,  759,  739,  739,  739,  739,  739,
			  739,  269,  910,  910,  765,  780,  780,  780,  780,  780,
			  780,  784,  784,  784,  784,  784,  784,  781,  807,  781,
			  910,  500,  782,  782,  782,  782,  782,  782,  785,  786,
			  785,  786,  678,  678,  678,  678,  678,  678,  748,  748,
			  748,  748,  748,  748,  117,  117,  808,  117,  741,  788,

			  788,  788,  788,  788,  788,  910,  910,  269,  794,  117,
			  117,  910,  117,  829,  831,  842,  269,  787,  119,  910,
			  845,  404,  269,  910,  790,  794,  741,  117,  117,  794,
			  117,  117,  117,  119,  117,  829,  117,  117,  509,  117,
			  269,  829,  831,  842,  269,  791,  910,  269,  845,  269,
			  798,  119,  790,  794,  798,  119,  910,  269,  269,  792,
			  119,  117,  117,  830,  117,  797,  793,  117,  117,  799,
			  117,  798,  910,  791,  269,  809,  117,  117,  910,  117,
			  269,  910,  798,  843,  798,  119,  799,  792,  800,  269,
			  827,  119,  795,  910,  793,  801,  801,  799,  801,  796,

			  119,  910,  910,  811,  910,  800,  735,  735,  735,  735,
			  735,  735,  844,  857,  858,  868,  800,  910,  828,  825,
			  795,  782,  782,  782,  782,  782,  782,  796,  812,  812,
			  812,  812,  812,  812,  813,  813,  813,  813,  813,  813,
			  910,  857,  858,  868,  910,  500,  603,  603,  603,  603,
			  603,  603,  814,  814,  814,  814,  814,  814,  815,  815,
			  815,  815,  815,  815,  877,  883,  910,  595,  742,  742,
			  742,  742,  742,  742,  117,  117,  821,  117,  117,  117,
			  821,  117,  117,  117,  822,  117,  910,  269,  822,  269,
			  821,  269,  877,  883,  823,  269,  910,  821,  119,  910,

			  117,  117,  119,  117,  910,  822,  119,  509,  821,  817,
			  910,  823,  910,  269,  117,  117,  822,  117,  117,  117,
			  845,  117,  823,  818,  119,  822,  854,  269,  910,  824,
			  910,  269,  819,  910,  854,  910,  910,  817,  119,  910,
			  910,  869,  119,  869,  910,  910,  824,  854,  846,  910,
			  910,  818,  870,  910,  910,  910,  910,  824,  910,  910,
			  819,  910,  854,  820,  780,  780,  780,  780,  780,  780,
			  833,  833,  833,  833,  833,  833,  785,  910,  785,  910,
			  871,  815,  815,  815,  815,  815,  815,  117,  117,  910,
			  117,  820,  117,  117,  910,  117,  117,  117,  910,  117,

			  269,  117,  117,  595,  117,  269,  910,  910,  910,  269,
			  910,  119,  910,  910,  269,  787,  119,  910,  910,  835,
			  119,  117,  117,  910,  117,  119,  849,  849,  849,  849,
			  849,  849,  910,  910,  269,  117,  117,  910,  117,  910,
			  837,  836,  789,  117,  117,  119,  117,  835,  269,  910,
			  838,  117,  117,  855,  117,  855,  269,  864,  910,  119,
			  910,  855,  910,  856,  269,  864,  852,  119,  837,  910,
			  836,  910,  910,  910,  855,  119,  856,  910,  864,  838,
			  859,  859,  859,  859,  859,  859,  910,  910,  910,  855,
			  910,  856,  853,  864,  852,  787,  787,  787,  787,  787, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  787,  117,  117,  865,  117,  117,  117,  910,  117,  789,
			  910,  865,  910,  910,  269,  910,  910,  910,  269,  896,
			  853,  897,  865,  910,  865,  119,  910,  910,  910,  119,
			  866,  873,  873,  873,  873,  873,  896,  863,  897,  865,
			  896,  910,  897,  866,  117,  117,  910,  117,  117,  117,
			  862,  117,  879,  879,  879,  879,  879,  269,  866,  910,
			  910,  269,  910,  910,  896,  863,  897,  910,  119,  910,
			  910,  881,  119,  878,  878,  878,  878,  878,  878,  862,
			  117,  117,  881,  117,  882,  874,  873,  873,  873,  873,
			  873,  873,  881,  269,  910,  882,  884,  884,  884,  884,

			  884,  884,  910,  910,  119,  882,  910,  910,  117,  117,
			  881,  117,  880,  874,  885,  885,  885,  885,  885,  885,
			  886,  269,  887,  882,  888,  888,  888,  888,  888,  888,
			  910,  886,  119,  887,  889,  910,  889,  910,  910,  910,
			  880,  886,  910,  887,  910,  890,  871,  871,  871,  871,
			  871,  871,  894,  894,  894,  894,  894,  894,  910,  886,
			  910,  887,  895,  895,  895,  895,  895,  898,  898,  898,
			  898,  898,  898,  891,  899,  899,  899,  899,  899,  899,
			  900,  901,  902,  902,  902,  902,  902,  902,  903,  904,
			  903,  904,  910,  910,  910,  910,  910,  900,  901,  910,

			  910,  900,  901,  891,  891,  891,  891,  891,  891,  906,
			  906,  906,  906,  906,  906,  907,  907,  907,  907,  907,
			  907,  910,  910,  910,  910,  900,  901,  905,  908,  908,
			  908,  908,  908,  908,  903,  910,  903,  910,  910,  907,
			  907,  907,  907,  907,  907,  909,  909,  909,  909,  909,
			  909,  905,  905,  905,  905,  905,  905,  103,  103,  103,
			  103,  103,  103,  103,  103,  764,  764,  764,  764,  764,
			  764,  764,  764,  905,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   98,   98,
			  910,   98,   98,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  910,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,  100,  100,  910,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  108,  314,  314,  314,  314,  314,
			  314,  314,  314,  314,  910,  910,  910,  910,  910,  910,
			  910,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  118,  118,  118,  910,  910,  910,  910,  910,  910,  910,

			  118,  118,  118,  118,  910,  118,  118,  118,  118,  118,
			  118,  118,  118,  910,  910,  910,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  150,  150,  910,  150,  150,
			  910,  150,  150,  150,  910,  910,  150,  150,  150,  150,
			  150,  150,  150,  150,  910,  910,  910,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  152,  152,  910,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  211,  211,  910,  211,  211,  211,

			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  910,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,

			  225,  225,  225,  225,  225,  225,  225,  225,  231,  910,
			  231,  910,  910,  910,  910,  231,  231,  910,  231,  231,
			  231,  910,  910,  231,  231,  231,  231,  231,  231,  231,
			  231,  910,  910,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,

			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  245,
			  245,  910,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  103,  910,  910,
			  910,  910,  103,  103,  103,  910,  910,  103,  103,  103,
			  103,  103,  103,  103,  103,  910,  910,  910,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  108,  108,  108,  108,  910,
			  910,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  910,  910,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  910,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  270,
			  910,  910,  910,  270,  270,  270,  270,  270,  270,  270, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  270,  270,  270,  270,  270,  270,  910,  910,  910,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  910,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  244,  244,  244,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  244,
			  410,  410,  410,  410,  410,  410,  410,  410,  910,  910,
			  910,  410,  410,  410,  410,  410,  410,  410,  410,  410,
			  314,  314,  314,  314,  910,  910,  314,  314,  314,  314,
			  314,  314,  314,  314,  314,  910,  910,  314,  314,  314,
			  314,  314,  314,  314,  314,  314,  381,  381,  381,  381,
			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381,

			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  381,  515,  515,  515,  910,  910,  515,
			  515,  515,  515,  515,  515,  515,  515,  910,  910,  910,
			  515,  515,  515,  515,  515,  515,  515,  515,  515,  547,
			  910,  547,  910,  910,  910,  910,  547,  547,  910,  547,
			  547,  547,  910,  910,  547,  547,  547,  547,  547,  547,
			  547,  547,  910,  910,  910,  547,  547,  547,  547,  547,
			  547,  547,  547,  547,  452,  452,  452,  910,  910,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  910,  910,
			  452,  452,  452,  452,  452,  452,  452,  452,  910,  910,

			  910,  452,  452,  452,  452,  452,  452,  452,  452,  452,
			  631,  910,  631,  910,  910,  910,  910,  631,  631,  910,
			  631,  631,  631,  910,  910,  631,  631,  631,  631,  631,
			  631,  631,  631,  910,  910,  631,  631,  631,  631,  631,
			  631,  631,  631,  631,  631,  685,  685,  685,  685,  685,
			  685,  685,  685,  685,  910,  685,  685,  685,  685,  685,
			  685,  685,  685,  685,  685,  685,  685,  685,  685,  685,
			  685,  685,  685,  685,  685,  685,  685,  685,  685,  685,
			  685,  685,  685,  688,  688,  688,  688,  688,  688,  688,
			  688,  910,  910,  910,  688,  688,  688,  688,  688,  688,

			  688,  688,  688,  749,  749,  749,  910,  910,  749,  749,
			  749,  749,  749,  749,  749,  749,  910,  910,  910,  749,
			  749,  749,  749,  749,  749,  749,  749,  749,  764,  910,
			  910,  910,  910,  764,  764,  764,  910,  910,  764,  764,
			  764,  764,  764,  764,  764,  764,  910,  910,  910,  764,
			  764,  764,  764,  764,  764,  764,  764,  764,  816,  816,
			  816,  816,  816,  816,  816,  816,  910,  910,  910,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  834,  834,
			  834,  910,  910,  834,  834,  834,  834,  834,  834,  834,
			  834,  910,  910,  910,  834,  834,  834,  834,  834,  834,

			  834,  834,  834,  860,  860,  860,  860,  860,  860,  860,
			  860,  910,  910,  910,  860,  860,  860,  860,  860,  860,
			  860,  860,  860,  872,  872,  872,  910,  910,  872,  872,
			  872,  872,  872,  872,  872,  872,  910,  910,  910,  872,
			  872,  872,  872,  872,  872,  872,  872,  872,   11,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910, yy_Dummy>>,
			1, 641, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5640)
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
			    1,    1,    1,    3,    5,    9,    6,    3,    4,   10,

			   18,   13,    4,   13,   13,   25,  887,   25,   25,   25,
			   25,   25,   25,   27,   84,   27,   92,   27,   27,   27,
			   27,   27,   27,   38,   38,   60,   38,   61,  189,   63,
			    5,    5,    6,    6,   28,   59,   28,   60,   28,   28,
			   28,   28,   28,   28,    3,   18,   59,   38,   64,    4,
			    9,   84,   84,   60,   10,   61,   27,   63,   74,  183,
			   74,   74,  886,   59,   95,   60,   95,   95,  183,  235,
			  189,   92,  235,  510,  510,   59,   64,   28,    3,    3,
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
			   35,   35,   65,   35,   36,   36,   69,   36,  834,  834,
			   37,   37,   68,   37,  159,   65,   76,   66,   78,  237,

			   39,   39,  237,   39,   35,   66,   43,   43,   36,   43,
			   65,  865,   80,   35,   37,   69,   36,   35,   37,   35,
			   68,   67,  159,   65,   39,   66,   67,   37,   40,   40,
			   43,   40,  514,   66,   43,   41,   41,   39,   41,   44,
			   44,   35,   44,   76,   36,   35,   37,   35,   39,   67,
			   42,   42,   40,   42,   67,   37,   40,   45,   45,   41,
			   45,   77,   43,   44,  208,   39,   48,   48,   40,   48,
			   41,  160,   82,  514,   42,  864,   79,   39,   78,   44,
			  319,   45,   85,  378,   40,  108,  851,   45,   42,   42,
			   48,   80,   80,  208,   42,  319,   40,  846,   41,  160,

			   45,   47,   47,   81,   47,   48,  151,   44,   82,   82,
			   48,   49,   49,  844,   49,   45,   42,   42,   85,   85,
			  378,  108,   42,  154,   87,   47,  154,   87,   45,   46,
			   46,  154,   46,   48,  372,   49,   47,  369,   48,   77,
			   77,   77,  151,  161,   47,   46,   46,   46,   46,   46,
			   46,   49,  165,   46,   79,   79,   79,  151,  448,  168,
			   46,  448,   50,   50,   47,   50,  369,   46,   56,   56,
			  209,  161,   47,   56,   46,   56,   46,   87,   46,   49,
			   57,   81,   81,   81,  165,   57,   50,  168,   46,   57,
			  824,   57,   62,   62,   56,   46,   56,   56,   62,  117,

			  117,   56,  117,   56,  167,   46,  209,   46,   57,   56,
			   57,   50,  165,   57,  372,   89,  169,   57,   89,   57,
			   62,   62,  167,  117,  170,   57,   62,   89,   89,  109,
			  109,  109,  109,  109,  109,  209,  169,  813,   89,  171,
			   50,   55,   90,  545,   55,   90,  545,  866,  811,   55,
			  167,  806,  170,  780,   90,  866,   55,   55,   55,   55,
			   55,   55,   55,   55,  169,   90,  173,  171,   89,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,  173,  631,   90,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   58,  173,  166,   58,  213,  772,  213,  213,   58,  110,
			  110,  110,  110,  110,  110,   58,   58,   58,   58,   58,
			   58,   58,   58,  217,  174,  110,  166,  631,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  174,  110,  166,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   93,

			   93,  254,   93,  254,  254,  102,  112,  112,  112,  112,
			  112,  112,  872,  872,  102,  102,  102,  102,  102,  102,
			  225,  217,  217,  217,  221,   93,  227,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			  102,  106,  106,  106,  106,  106,  106,  225,  225,  172,
			  221,  221,  176,  227,  227,  102,  314,  106,  111,  102,
			  111,  102,  111,  111,  111,  111,  111,  111,  111,  113,
			   93,  113,  178,  113,  113,  113,  113,  113,  113,  172,
			  106,  118,  118,  176,  118,  106,  120,  120,  238,  120,

			  121,  121,  314,  121,  118,  122,  122,  179,  122,  120,
			  178,  111,  765,  121,  340,  118,  764,  172,  122,  454,
			  120,  176,  113,  184,  121,  123,  123,  190,  123,  122,
			  124,  124,  749,  124,  224,  179,  122,  121,  123,  125,
			  125,  120,  125,  124,  126,  126,  181,  126,  454,  123,
			  187,  184,  125,  238,  124,  190,  340,  126,  123,  127,
			  127,  180,  127,  125,  122,  121,  742,  735,  126,  120,
			  224,  224,  127,  124,  128,  128,  181,  128,  187,  125,
			  730,  129,  129,  127,  129,  180,  123,  128,  126,  127,
			  130,  130,  726,  130,  129,  127,  131,  131,  128,  131,

			  400,  124,  175,  130,  181,  129,  187,  125,  175,  131,
			  723,  128,  130,  180,  130,  400,  126,  127,  132,  132,
			  131,  132,  192,  127,  129,  133,  133,  722,  133,  374,
			  175,  132,  134,  134,  194,  134,  175,  131,  133,  128,
			  135,  135,  132,  135,  185,  134,  716,  185,  132,  133,
			  192,  132,  129,  135,  136,  136,  134,  136,  137,  137,
			  366,  137,  194,  708,  135,  131,  707,  136,  197,  195,
			  549,  137,  185,  549,  191,  185,  132,  134,  136,  132,
			  133,  188,  137,  706,  136,  135,  197,  139,  139,  137,
			  139,  140,  140,  198,  140,  549,  193,  195,  188,  199, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  139,  188,  366,  705,  140,  134,  191,  196,  374,  374,
			  550,  139,  136,  135,  197,  140,  200,  137,  138,  138,
			  138,  198,  140,  177,  196,  550,  188,  199,  193,  188,
			  142,  142,  139,  142,  191,  200,  140,  138,  140,  681,
			  177,  138,  674,  142,  138,  205,  177,  201,  203,  206,
			  140,  138,  196,  138,  142,  138,  193,  253,  253,  316,
			  253,  142,  317,  200,  205,  138,  207,  140,  177,  138,
			  145,  145,  138,  145,  177,  142,  203,  206,  668,  650,
			  201,  253,  138,  145,  138,  141,  141,  316,  141,  142,
			  317,  644,  205,  721,  145,  640,  207,  218,  141,  638,

			  623,  141,  141,  141,  141,  141,  141,  143,  201,  141,
			  143,  143,  143,  143,  143,  143,  145,  568,  144,  144,
			  141,  144,  721,  141,  207,  146,  146,  219,  146,  141,
			  202,  144,  147,  147,  202,  147,  204,  220,  146,  143,
			  216,  322,  144,  143,  145,  147,  325,  554,  141,  146,
			  144,  141,  327,  144,  552,  555,  147,  141,  202,  204,
			  322,  146,  202,  204,  147,  146,  148,  148,  329,  148,
			  149,  149,  143,  149,  325,  218,  218,  218,  144,  148,
			  327,  144,  230,  149,  328,  230,  329,  204,  322,  146,
			  148,  204,  147,  146,  149,  164,  164,  555,  164,  164,

			  164,  164,  164,  164,  525,  219,  219,  219,  231,  148,
			  331,  231,  328,  515,  329,  220,  220,  220,  503,  149,
			  231,  216,  216,  216,  216,  216,  496,  234,  495,  332,
			  234,  231,  330,  243,  243,  230,  243,  148,  331,  234,
			  248,  248,  248,  248,  248,  248,  248,  821,  149,  157,
			  234,  258,  258,  258,  258,  258,  258,  332,  157,  243,
			  257,  231,  257,  330,  489,  257,  257,  257,  257,  257,
			  257,  261,  261,  261,  261,  261,  261,  264,  488,  264,
			  234,  467,  264,  264,  264,  264,  264,  264,  451,  821,
			  411,  330,  157,  157,  157,  157,  157,  157,  157,  157,

			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,

			  236,  236,  236,  236,  236,  236,  236,  239,  239,  386,
			  239,  266,  266,  266,  266,  266,  267,  267,  267,  267,
			  267,  267,  291,  291,  291,  291,  291,  291,  384,  384,
			  381,  384,  380,  239,  368,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  256,  256,
			  256,  256,  256,  256,  263,  263,  263,  263,  263,  263,
			  334,  457,  333,  363,  256,  385,  385,  265,  385,  265,
			  263,  265,  265,  265,  265,  265,  265,  336,  239,  334,
			  352,  271,  271,  337,  271,  338,  342,  256,  272,  272,

			  333,  272,  256,  263,  271,  457,  273,  273,  263,  273,
			  324,  272,  343,  274,  274,  271,  274,  334,  336,  273,
			  265,  337,  272,  271,  342,  335,  274,  315,  275,  275,
			  273,  275,  276,  276,  457,  276,  310,  274,  272,  546,
			  343,  275,  546,  270,  339,  276,  336,  277,  277,  335,
			  277,  271,  275,  274,  278,  278,  276,  278,  260,  275,
			  277,  279,  279,  298,  279,  298,  272,  278,  259,  280,
			  280,  277,  280,  282,  279,  339,  276,  335,  278,  277,
			  344,  274,  280,  345,  282,  279,  298,  275,  252,  298,
			  251,  278,  546,  280,  282,  298,  281,  281,  635,  281,

			  323,  635,  346,  339,  276,  279,  635,  277,  344,  281,
			  250,  345,  282,  280,  298,  283,  283,  298,  283,  278,
			  281,  284,  284,  298,  284,  249,  346,  323,  283,  285,
			  285,  247,  285,  279,  284,  286,  286,  341,  286,  283,
			  348,  280,  285,  287,  287,  284,  287,  242,  286,  341,
			  349,  281,  283,  285,  346,  323,  287,  233,  284,  286,
			  341,  288,  288,  348,  288,  285,  228,  287,  353,  354,
			  341,  286,  226,  287,  288,  326,  289,  289,  349,  289,
			  283,  290,  290,  223,  290,  288,  284,  347,  341,  289,
			  211,  348,  827,  285,  290,  350,  353,  354,  186,  286,

			  289,  287,  326,  182,  163,  290,  370,  292,  292,  831,
			  292,  347,  350,  290,  293,  293,  293,  293,  293,  293,
			  292,  827,  289,  292,  292,  292,  292,  292,  292,  162,
			  326,  292,  294,  294,  294,  294,  294,  294,  831,  347,
			  350,  290,  370,  293,  295,  295,  295,  295,  295,  295,
			  289,  158,  292,  296,  296,  296,  296,  296,  296,  297,
			  297,  297,  297,  297,  297,  299,  299,  299,  299,  299,
			  299,  370,  300,  300,  357,  300,  301,  301,  358,  301,
			  302,  302,  361,  302,  299,  300,  832,  832,  832,  301,
			  356,  155,  355,  302,  304,  304,  300,  304,  303,  303,

			  301,  303,  357,  364,  302,  365,  358,  304,  152,  356,
			  361,  303,  299,  359,  305,  305,  300,  305,  304,  302,
			  303,  360,  303,  150,  105,  355,  304,  305,  306,  306,
			  362,  306,  364,  307,  307,  365,  307,  356,  305,  359,
			  360,  306,  308,  308,  300,  308,  307,  302,  309,  309,
			  371,  309,  306,  355,  304,  308,  305,  307,  362,  373,
			  364,  309,  375,  365,  104,  376,  308,  359,  360,  377,
			  103,  306,  309,  311,  100,  311,  311,  311,  311,  311,
			  311,  311,  634,   98,  305,  634,   96,  312,  307,  312,
			  312,  312,  312,  312,  312,  312,  453,  309,  320,  306,

			  320,  320,  320,  320,  320,  320,  321,  634,  321,  321,
			  321,  321,  321,  321,  397,  397,  397,  397,  397,  397,
			  387,  387,  547,  387,  453,  547,  309,   88,  371,  371,
			  371,  398,  398,  398,  398,  398,  398,  373,  373,  373,
			  375,  375,  375,  376,  376,  376,  387,  377,  377,  377,
			  382,  382,   73,  382,  390,  390,  390,  390,  390,  390,
			  390,   70,  382,  396,  396,  396,  396,  396,  396,  456,
			  398,  459,  458,  382,   54,  547,   51,  460,   34,  396,
			  399,  399,  399,  399,  399,  399,  401,  401,  401,  401,
			  401,  401,  402,  402,  402,  402,  402,  402,   33,  456, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  458,  459,  396,  382,  403,  460,  403,  396,  402,  403,
			  403,  403,  403,  403,  403,  404,  404,  404,  404,  404,
			  404,  405,  405,  405,  405,  405,  405,  456,   31,  459,
			   26,  402,  743,  743,  743,  743,  402,  406,  406,  406,
			  406,  406,  406,  407,  407,   24,  407,  407,  407,  407,
			  407,  407,  408,  408,  408,  408,  408,  408,  409,  409,
			  409,  409,  409,  409,  412,  412,   16,  412,  413,  413,
			  461,  413,   15,  422,  463,  857,  406,  412,   14,   11,
			    0,  413,  414,  414,  422,  414,  415,  415,  412,  415,
			    0,  462,  413,  463,  422,  414,  469,  442,  461,  415,

			  416,  416,    0,  416,  857,    0,  414,  412,  442,  465,
			  415,    0,  422,  416,  462,  413,  417,  417,  442,  417,
			    0,  463,  415,    0,  416,  414,  468,  466,  469,  417,
			  418,  418,  416,  418,    0,  412,  442,  465,  419,  419,
			  417,  419,  462,  418,  413,  420,  420,  470,  420,    0,
			  415,  419,    0,  414,  418,  466,  469,    0,  420,  468,
			  416,    0,  419,  471,    0,  421,  421,    0,  421,  420,
			    0,  423,  423,  473,  423,  470,  418,  420,  421,  424,
			  424,    0,  424,  419,  423,  425,  425,  468,  425,  421,
			    0,  471,  424,  421,  474,  423,  472,    0,  425,  426,

			  426,  473,  426,  424,  418,  420,  477,  423,  475,  425,
			    0,  419,  426,  427,  427,  472,  427,  428,  428,  476,
			  428,  421,  474,  426,  425,  424,  427,    0,  478,  477,
			  428,  429,  429,  484,  429,  423,  475,  427,  426,  479,
			  481,  428,    0,  472,  429,  480,    0,  476,  427,    0,
			  493,  482,  425,  424,  431,  429,  431,  477,  483,    0,
			  428,  478,  481,  484,    0,  479,  426,  430,  430,  430,
			  430,  430,  430,  480,  429,  432,  427,  431,  432,  482,
			  431,  490,  491,  493,  432,  556,  483,  431,  428,  478,
			  481,  484,  433,  479,  433,  430,  433,  433,  433,  433,

			  433,  433,  429,  432,    0,  431,  432,    0,  431,  490,
			  491,  493,  432,  556,  485,    0,    0,  558,  433,    0,
			    0,    0,    0,  430,    0,  433,  434,  434,  434,  434,
			  434,  434,  435,  435,  435,  435,  435,  435,  436,  436,
			  436,  436,  436,  436,  485,  558,  433,  435,  434,  437,
			  437,  437,  437,  437,  437,    0,    0,  559,  513,  434,
			  513,  435,  438,  438,  438,  438,  438,  438,    0,  513,
			    0,  436,  485,    0,    0,  435,  434,  439,  439,  439,
			  439,  439,  439,  440,  440,  559,  440,    0,  434,  441,
			  441,  438,  441,    0,  494,    0,  440,  513,  443,  443,

			  436,  443,  441,    0,  560,    0,  439,  440,    0,  492,
			  557,  443,  494,  441,  444,  444,  562,  444,  445,  445,
			  492,  445,  443,  446,  446,  567,  446,  444,    0,  557,
			  560,  445,  447,  447,    0,  447,  446,  492,  444,    0,
			  494,    0,  445,    0,  562,  447,    0,  446,  492,  445,
			    0,  446,  561,  567,    0,    0,  447,  557,  560,    0,
			  444,  449,  446,  449,  449,  449,  449,  449,  449,  449,
			  561,  498,  498,  498,  498,  498,  498,  445,  450,  446,
			  450,  450,  450,  450,  450,  450,  450,  498,  444,  455,
			  446,  455,  455,  455,  455,  455,  455,  569,  561,    0,

			  449,  499,  499,  499,  499,  499,  499,  500,  500,  500,
			  500,  500,  500,    0,    0,  498,    0,  450,  501,  501,
			  501,  501,  501,  501,  502,  569,  502,  502,  502,  502,
			  502,  502,  504,  504,  504,  504,  504,  504,    0,  570,
			  499,  505,  505,  505,  505,  505,  505,  575,  504,  506,
			  506,  506,  506,  506,  506,  507,  507,  507,  507,  507,
			  507,  508,  508,  508,  508,  508,  508,  570,    0,  571,
			  575,  504,  516,  516,  563,  516,  504,  509,  509,  509,
			  509,  509,  509,    0,  573,  516,  563,    0,  506,  511,
			  511,  511,  511,  511,  511,  576,  516,  571,  575,  578,

			  508,    0,  563,  573,  512,  511,  512,  512,  512,  512,
			  512,  512,  517,  517,  563,  517,  518,  518,  577,  518,
			    0,  519,  519,  576,  519,  517,    0,  578,    0,  518,
			    0,  573,  564,  511,  519,    0,  517,  577,  520,  520,
			  518,  520,    0,  539,    0,  519,  521,  521,  518,  521,
			  564,  520,  544,    0,  539,  522,  522,  574,  522,  521,
			  519,    0,  520,  544,  539,  577,  579,  517,  522,  520,
			  521,  523,  523,  544,  523,  574,  518,  521,  564,  522,
			  524,  524,  539,  524,  523,    0,  580,  522,  519,  526,
			  526,  544,  526,  524,  579,  523,    0,  520,  582,  522,

			    0,  565,  526,  574,  524,  521,  527,  527,    0,  527,
			  583,  528,  528,  526,  528,  522,  580,  524,    0,  527,
			  565,  526,    0,  581,  528,    0,  582,  522,  529,  529,
			  527,  529,  565,  531,  531,  528,  531,  527,  583,  584,
			    0,  529,  581,  585,  580,  524,  531,  528,  565,  526,
			  530,  530,  529,  530,  586,  532,  532,  531,  532,  587,
			  565,  823,    0,  530,  614,  527,    0,  584,  532,  643,
			  581,  585,  823,  586,  530,  528,  531,  591,  587,  532,
			  637,  614,  530,  641,  643,  614,    0,  532,  534,  534,
			  534,  534,  534,  534,  535,  535,  535,  535,  535,  535,

			  591,  586,    0,  823,  531,  591,  587,    0,  637,  614,
			  530,  641,  643,    0,  628,  532,  645,  534,  536,  536,
			  536,  536,  536,  536,  537,  628,  537,    0,  537,  537,
			  537,  537,  537,  537,  629,  628,  538,  538,  538,  538,
			  538,  538,  646,  648,  645,  629,  536,    0,  540,  540,
			  537,  540,    0,  628,  630,  629,  537,  537,  538,    0,
			    0,  540,  648,  541,  541,  630,  541,    0,  542,  542,
			  646,  542,  540,  629,  536,  630,  541,    0,  537,    0,
			  540,  542,  651,  649,  537,    0,  538,  541,  543,  543,
			  648,  543,  542,  630,  652,  541,  653,  588,  654,  588,

			    0,  543,  588,  588,  588,  588,  588,  588,  540,  649,
			  651,  542,  543,  553,    0,  553,  553,  553,  553,  553,
			  553,  657,  652,  541,  653,    0,  654,    0,  543,  589,
			  589,  589,  589,  589,  589,  656,    0,  649,    0,  542,
			  590,  590,  590,  590,  590,  590,  595,  595,  595,  595,
			  595,  595,  553,  657,  656,  592,  543,  592,  592,  592,
			  592,  592,  592,  602,  602,  602,  602,  602,  589,  593,
			  593,  593,  593,  593,  593,  594,  594,  594,  594,  594,
			  594,  657,  656,    0,    0,  593,  596,  596,  596,  596,
			  596,  596,    0,    0,  592,  597,  597,  597,  597,  597, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  597,  598,  598,  598,  598,  598,  598,  599,  599,  599,
			  599,  599,  599,  593,  594,  600,    0,  600,    0,  655,
			  600,  600,  600,  600,  600,  600,  601,  601,  601,  601,
			  601,  601,    0,    0,  597,  604,  604,  604,  604,  604,
			  604,  606,  606,  658,  606,    0,  607,  607,  660,  607,
			  655,  604,    0,    0,  606,    0,    0,  661,  665,  607,
			  608,  608,    0,  608,  663,  606,  666,  667,  678,  606,
			  607,  658,  659,  608,  609,  609,  660,  609,  655,  604,
			  610,  610,  663,  610,  608,  661,  665,  609,  608,  611,
			  611,  678,  611,  610,  666,  667,  678,  606,  609,    0,

			    0,    0,  611,  659,  610,  612,  612,  711,  612,  669,
			  663,    0,  610,  611,  613,  613,  608,  613,  612,  615,
			  615,    0,  615,  616,  616,  712,  616,  613,  611,  612,
			    0,  659,  615,  715,    0,  711,  616,    0,  613,  669,
			  610,  617,  617,  615,  617,  618,  618,  616,  618,  619,
			  619,  613,  619,  712,  617,  616,  611,    0,  618,  727,
			  717,  715,  619,  615,    0,  617,  662,  669,    0,  618,
			    0,  620,  620,  619,  620,    0,    0,  717,    0,  613,
			    0,  619,  724,  616,  620,  662,  617,  727,    0,  618,
			    0,  615,  621,    0,  621,  620,  621,  621,  621,  621,

			  621,  621,  620,  624,  624,  717,  624,  625,  625,  619,
			  625,    0,    0,  662,  617,    0,  624,  618,  724,    0,
			  625,  626,  626,    0,  626,  621,    0,  624,    0,    0,
			  620,  625,  729,    0,  626,  627,  627,  636,  627,  636,
			  636,  636,  636,  636,  636,  626,  731,  724,  627,    0,
			  625,  626,  670,  670,  670,  670,  670,  670,  729,  627,
			  671,  671,  671,  671,  671,  671,  627,  672,  672,  672,
			  672,  672,  672,    0,  731,  673,    0,  673,  625,  626,
			  673,  673,  673,  673,  673,  673,  729,    0,    0,    0,
			  675,    0,  675,    0,  627,  675,  675,  675,  675,  675,

			  675,  676,  676,  676,  676,  676,  676,  677,  677,  677,
			  677,  677,  677,  679,  679,  679,  679,  679,  679,  680,
			  680,  680,  680,  680,  680,  682,  682,  682,  682,  682,
			  682,  683,  683,  683,  683,  683,  683,    0,  713,    0,
			  676,  684,  684,  684,  684,  684,  684,  686,  686,  686,
			  686,  686,  686,    0,    0,  732,  694,  689,  689,  687,
			  689,  687,  713,  686,  687,  687,  687,  687,  687,  687,
			  689,  690,  690,  694,  690,  691,  691,  694,  691,  692,
			  692,  689,  692,  732,  690,    0,  686,  733,  691,    0,
			  713,  686,  692,  693,  693,  690,  693,  766,    0,  691,

			  689,  694,  767,  692,    0,  734,  693,    0,  690,  692,
			  695,  695,    0,  695,    0,  733,    0,  693,  696,  696,
			  769,  696,    0,  695,  734,  766,  697,  697,  689,  697,
			  767,  696,  698,  698,  695,  698,  690,  692,    0,  697,
			  699,  699,  696,  699,  701,  698,  700,  700,  769,  700,
			  697,  768,  734,  699,  702,  702,  698,  702,  770,  700,
			  773,  701,  760,  775,  699,  701,  760,  702,  703,  703,
			  700,  703,  776,  802,  768,  697,    0,  770,  702,  699,
			    0,  703,  803,  760,  704,  704,  702,  704,  773,  701,
			    0,  775,  703,    0,  760,    0,    0,  704,    0,    0,

			  776,  802,  768,  703,  697,  770,    0,  699,  704,    0,
			  803,    0,    0,    0,  702,  710,  704,  710,  710,  710,
			  710,  710,  710,  736,  736,  736,  736,  736,  736,    0,
			    0,  703,  737,  737,  737,  737,  737,  737,  738,  738,
			  738,  738,  738,  738,  704,  739,  739,  739,  739,  739,
			  739,  774,    0,    0,  710,  740,  740,  740,  740,  740,
			  740,  744,  744,  744,  744,  744,  744,  741,  774,  741,
			    0,  737,  741,  741,  741,  741,  741,  741,  745,  745,
			  745,  745,  746,  746,  746,  746,  746,  746,  747,  747,
			  747,  747,  747,  747,  750,  750,  774,  750,  746,  748,

			  748,  748,  748,  748,  748,    0,    0,  750,  756,  751,
			  751,    0,  751,  807,  810,  826,  808,  745,  750,    0,
			  829,  746,  751,    0,  750,  756,  746,  752,  752,  756,
			  752,  754,  754,  751,  754,  808,  755,  755,  748,  755,
			  752,  807,  810,  826,  754,  751,    0,  828,  829,  755,
			  761,  752,  750,  756,  761,  754,    0,  778,  804,  752,
			  755,  757,  757,  808,  757,  762,  755,  758,  758,  762,
			  758,  761,    0,  751,  757,  778,  759,  759,    0,  759,
			  758,    0,  761,  828,  763,  757,  762,  752,  763,  759,
			  804,  758,  757,    0,  755,  801,  801,  762,  801,  758,

			  759,    0,    0,  778,    0,  763,  779,  779,  779,  779,
			  779,  779,  828,  842,  847,  858,  763,    0,  804,  801,
			  757,  781,  781,  781,  781,  781,  781,  758,  782,  782,
			  782,  782,  782,  782,  783,  783,  783,  783,  783,  783,
			    0,  842,  847,  858,    0,  779,  784,  784,  784,  784,
			  784,  784,  785,  785,  785,  785,  785,  785,  786,  786,
			  786,  786,  786,  786,  867,  877,    0,  782,  788,  788,
			  788,  788,  788,  788,  790,  790,  797,  790,  791,  791,
			  797,  791,  792,  792,  798,  792,    0,  790,  798,  830,
			  799,  791,  867,  877,  799,  792,    0,  797,  790,    0,

			  793,  793,  791,  793,    0,  798,  792,  788,  797,  790,
			    0,  799,    0,  793,  795,  795,  798,  795,  796,  796,
			  830,  796,  799,  791,  793,  800,  839,  795,    0,  800,
			    0,  796,  793,    0,  839,    0,    0,  790,  795,    0,
			    0,  859,  796,  859,    0,    0,  800,  839,  830,    0,
			    0,  791,  859,    0,    0,    0,    0,  800,    0,    0,
			  793,    0,  839,  796,  812,  812,  812,  812,  812,  812,
			  814,  814,  814,  814,  814,  814,  815,    0,  815,    0,
			  859,  815,  815,  815,  815,  815,  815,  817,  817,    0,
			  817,  796,  818,  818,    0,  818,  819,  819,    0,  819,

			  817,  820,  820,  812,  820,  818,    0,    0,    0,  819,
			    0,  817,    0,    0,  820,  815,  818,    0,    0,  817,
			  819,  835,  835,    0,  835,  820,  833,  833,  833,  833,
			  833,  833,    0,    0,  835,  836,  836,    0,  836,    0,
			  819,  818,  841,  837,  837,  835,  837,  817,  836,    0,
			  820,  838,  838,  840,  838,  841,  837,  854,    0,  836,
			    0,  840,    0,  841,  838,  854,  835,  837,  819,    0,
			  818,    0,    0,    0,  840,  838,  841,    0,  854,  820,
			  848,  848,  848,  848,  848,  848,    0,    0,    0,  840,
			    0,  841,  838,  854,  835,  849,  849,  849,  849,  849, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  849,  852,  852,  855,  852,  853,  853,    0,  853,  856,
			    0,  855,    0,    0,  852,    0,    0,    0,  853,  892,
			  838,  893,  856,    0,  855,  852,    0,    0,    0,  853,
			  856,  861,  861,  861,  861,  861,  892,  853,  893,  855,
			  892,    0,  893,  856,  862,  862,    0,  862,  863,  863,
			  852,  863,  870,  870,  870,  870,  870,  862,  856,    0,
			    0,  863,    0,    0,  892,  853,  893,    0,  862,    0,
			    0,  875,  863,  869,  869,  869,  869,  869,  869,  852,
			  874,  874,  875,  874,  876,  862,  873,  873,  873,  873,
			  873,  873,  875,  874,    0,  876,  878,  878,  878,  878,

			  878,  878,    0,    0,  874,  876,    0,    0,  880,  880,
			  875,  880,  874,  862,  879,  879,  879,  879,  879,  879,
			  881,  880,  882,  876,  884,  884,  884,  884,  884,  884,
			    0,  881,  880,  882,  885,    0,  885,    0,    0,    0,
			  874,  881,    0,  882,    0,  885,  888,  888,  888,  888,
			  888,  888,  889,  889,  889,  889,  889,  889,    0,  881,
			    0,  882,  890,  890,  890,  890,  890,  894,  894,  894,
			  894,  894,  894,  885,  895,  895,  895,  895,  895,  895,
			  896,  897,  898,  898,  898,  898,  898,  898,  899,  899,
			  899,  899,    0,    0,    0,    0,    0,  896,  897,    0,

			    0,  896,  897,  902,  902,  902,  902,  902,  902,  903,
			  903,  903,  903,  903,  903,  904,  904,  904,  904,  904,
			  904,    0,    0,    0,    0,  896,  897,  899,  906,  906,
			  906,  906,  906,  906,  907,    0,  907,    0,    0,  907,
			  907,  907,  907,  907,  907,  908,  908,  908,  908,  908,
			  908,  909,  909,  909,  909,  909,  909,  916,  916,  916,
			  916,  916,  916,  916,  916,  947,  947,  947,  947,  947,
			  947,  947,  947,  907,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,

			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  914,  914,
			    0,  914,  914,  914,  914,  914,  914,  914,  914,  914,

			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,    0,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  915,  915,    0,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  917,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,    0,    0,    0,    0,    0,    0,
			    0,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  918,  918,  918,    0,    0,    0,    0,    0,    0,    0,

			  918,  918,  918,  918,    0,  918,  918,  918,  918,  918,
			  918,  918,  918,    0,    0,    0,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  919,  919,    0,  919,  919,
			    0,  919,  919,  919,    0,    0,  919,  919,  919,  919,
			  919,  919,  919,  919,    0,    0,    0,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  920,  920,    0,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  921,  921,    0,  921,  921,  921,

			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,    0,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,

			  923,  923,  923,  923,  923,  923,  923,  923,  924,    0,
			  924,    0,    0,    0,    0,  924,  924,    0,  924,  924,
			  924,    0,    0,  924,  924,  924,  924,  924,  924,  924,
			  924,    0,    0,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,

			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  927,
			  927,    0,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  928,    0,    0,
			    0,    0,  928,  928,  928,    0,    0,  928,  928,  928,
			  928,  928,  928,  928,  928,    0,    0,    0,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,

			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  930,  930,  930,  930,    0,
			    0,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			    0,    0,  930,  930,  930,  930,  930,  930,  930,  930,
			  930,  931,  931,  931,  931,  931,  931,  931,  931,  931,
			    0,  931,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  931,  932,
			    0,    0,    0,  932,  932,  932,  932,  932,  932,  932, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  932,  932,  932,  932,  932,  932,    0,    0,    0,  932,
			  932,  932,  932,  932,  932,  932,  932,  932,  934,  934,
			  934,  934,  934,  934,  934,  934,  934,  934,    0,  934,
			  934,  934,  934,  934,  934,  934,  934,  934,  934,  934,
			  934,  934,  934,  934,  934,  934,  934,  934,  934,  934,
			  934,  934,  934,  934,  934,  934,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  936,  936,  936,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,  936,  936,
			  936,  936,  936,  936,  936,  936,  936,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  936,
			  937,  937,  937,  937,  937,  937,  937,  937,    0,    0,
			    0,  937,  937,  937,  937,  937,  937,  937,  937,  937,
			  938,  938,  938,  938,    0,    0,  938,  938,  938,  938,
			  938,  938,  938,  938,  938,    0,    0,  938,  938,  938,
			  938,  938,  938,  938,  938,  938,  939,  939,  939,  939,
			  939,  939,  939,  939,  939,  939,  939,  939,  939,  939,
			  939,  939,  939,  939,  939,  939,  939,  939,  939,  939,

			  939,  939,  939,  939,  939,  939,  939,  939,  939,  939,
			  939,  939,  939,  939,  940,  940,  940,    0,    0,  940,
			  940,  940,  940,  940,  940,  940,  940,    0,    0,    0,
			  940,  940,  940,  940,  940,  940,  940,  940,  940,  941,
			    0,  941,    0,    0,    0,    0,  941,  941,    0,  941,
			  941,  941,    0,    0,  941,  941,  941,  941,  941,  941,
			  941,  941,    0,    0,    0,  941,  941,  941,  941,  941,
			  941,  941,  941,  941,  942,  942,  942,    0,    0,  942,
			  942,  942,  942,  942,  942,  942,  942,  942,    0,    0,
			  942,  942,  942,  942,  942,  942,  942,  942,    0,    0,

			    0,  942,  942,  942,  942,  942,  942,  942,  942,  942,
			  943,    0,  943,    0,    0,    0,    0,  943,  943,    0,
			  943,  943,  943,    0,    0,  943,  943,  943,  943,  943,
			  943,  943,  943,    0,    0,  943,  943,  943,  943,  943,
			  943,  943,  943,  943,  943,  944,  944,  944,  944,  944,
			  944,  944,  944,  944,    0,  944,  944,  944,  944,  944,
			  944,  944,  944,  944,  944,  944,  944,  944,  944,  944,
			  944,  944,  944,  944,  944,  944,  944,  944,  944,  944,
			  944,  944,  944,  945,  945,  945,  945,  945,  945,  945,
			  945,    0,    0,    0,  945,  945,  945,  945,  945,  945,

			  945,  945,  945,  946,  946,  946,    0,    0,  946,  946,
			  946,  946,  946,  946,  946,  946,    0,    0,    0,  946,
			  946,  946,  946,  946,  946,  946,  946,  946,  948,    0,
			    0,    0,    0,  948,  948,  948,    0,    0,  948,  948,
			  948,  948,  948,  948,  948,  948,    0,    0,    0,  948,
			  948,  948,  948,  948,  948,  948,  948,  948,  949,  949,
			  949,  949,  949,  949,  949,  949,    0,    0,    0,  949,
			  949,  949,  949,  949,  949,  949,  949,  949,  950,  950,
			  950,    0,    0,  950,  950,  950,  950,  950,  950,  950,
			  950,    0,    0,    0,  950,  950,  950,  950,  950,  950,

			  950,  950,  950,  951,  951,  951,  951,  951,  951,  951,
			  951,    0,    0,    0,  951,  951,  951,  951,  951,  951,
			  951,  951,  951,  952,  952,  952,    0,    0,  952,  952,
			  952,  952,  952,  952,  952,  952,    0,    0,    0,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910, yy_Dummy>>,
			1, 641, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0,   67,
			   71, 2079, 5548,   99, 2075, 2045, 2059, 5548,   91,    0,
			 5548, 5548, 5548, 5548, 2030,   89, 2013,   99,  120, 5548,
			 5548, 2001, 5548, 1971, 1949,  278,  282,  288,  121,  298,
			  326,  333,  348,  304,  337,  355,  427,  399,  364,  409,
			  460, 1918, 5548, 5548, 1918,  539,  434,  450,  618,   96,
			   95,   90,  452,   99,  106,  250,  260,  280,  250,  235,
			 1944, 5548, 5548, 1945,  156, 5548,  289,  354,  291,  369,
			  305,  396,  355, 5548,   97,  365, 5548,  422, 1924,  513,
			  540, 5548,   88,  697, 5548,  162, 1883, 5548, 1876, 5548,

			 1865,    0,  696, 1859, 1861, 1808,  733, 5548,  368,  511,
			  611,  754,  688,  765, 5548, 5548, 5548,  497,  789,    0,
			  794,  798,  803,  823,  828,  837,  842,  857,  872,  879,
			  888,  894,  916,  923,  930,  938,  952,  956, 1004,  985,
			  989, 1083, 1028, 1092, 1116, 1068, 1123, 1130, 1164, 1168,
			 1799,  382, 1752, 5548,  421, 1780,    0, 1234, 1734,  247,
			  332,  410, 1671, 1689, 1180,  437,  607,  489,  424,  501,
			  479,  497,  744,  551,  598,  870,  747, 1008,  743,  762,
			  846,  831, 1679,  144,  780,  912, 1641,  835,  966,  113,
			  780,  959,  875,  981,  902,  936,  992,  953,  959,  951,

			 1001, 1032, 1092, 1014, 1121, 1030, 1004, 1051,  313,  455,
			 5548, 1683, 5548,  622, 5548, 5548, 1133,  636, 1090, 1120,
			 1130,  707, 5548, 1629,  817,  703, 1617,  709, 1612, 5548,
			 1180, 1206, 5548, 1654, 1225,  167, 1314,  297,  770, 1405,
			 5548, 5548, 1619, 1231, 5548, 5548, 5548, 1622, 1223, 1616,
			 1601, 1581, 1579, 1055,  699, 5548, 1440, 1247, 1233, 1551,
			 1500, 1253, 5548, 1446, 1264, 1463, 1393, 1398, 5548,    0,
			 1515, 1489, 1496, 1504, 1511, 1526, 1530, 1545, 1552, 1559,
			 1567, 1594, 1544, 1613, 1619, 1627, 1633, 1641, 1659, 1674,
			 1679, 1404, 1705, 1696, 1714, 1726, 1735, 1741, 1549, 1747,

			 1770, 1774, 1778, 1796, 1792, 1812, 1826, 1831, 1840, 1846,
			 1512, 1857, 1871, 5548,  749, 1510, 1025, 1020,    0,  320,
			 1882, 1890, 1126, 1585, 1495, 1104, 1660, 1119, 1138, 1153,
			 1217, 1176, 1190, 1426, 1455, 1510, 1472, 1447, 1438, 1529,
			  799, 1620, 1457, 1473, 1542, 1545, 1587, 1672, 1625, 1618,
			 1680,    0, 1475, 1620, 1635, 1777, 1775, 1733, 1744, 1798,
			 1806, 1738, 1785, 1416, 1788, 1790,  945,    0, 1419,  386,
			 1691, 1843,  427, 1852,  922, 1855, 1858, 1862,  366, 5548,
			 1377, 1427, 1948, 5548, 1426, 1473, 1406, 1918, 5548, 5548,
			 1937, 5548, 5548, 5548, 5548, 5548, 1945, 1896, 1913, 1962,

			  840, 1968, 1974, 1991, 1997, 2003, 2019, 2028, 2034, 2040,
			    0, 1262, 2062, 2066, 2080, 2084, 2098, 2114, 2128, 2136,
			 2143, 2163, 2044, 2169, 2177, 2183, 2197, 2211, 2215, 2229,
			 2249, 2240, 2238, 2278, 2308, 2314, 2320, 2331, 2344, 2359,
			 2381, 2387, 2068, 2396, 2412, 2416, 2421, 2430,  456, 2445,
			 2462, 1230,    0, 1851,  770, 2473, 1954, 1456, 1927, 1956,
			 1939, 2036, 2076, 2059,    0, 2061, 2080, 1266, 2111, 2081,
			 2113, 2133, 2181, 2135, 2146, 2167, 2178, 2191, 2213, 2224,
			 2208, 2225, 2206, 2213, 2218, 2299,    0,    0, 1263, 1249,
			 2233, 2249, 2379, 2235, 2379, 1213, 1211, 5548, 2453, 2483,

			 2489, 2500, 2508, 1204, 2514, 2523, 2531, 2537, 2543, 2559,
			  155, 2571, 2588, 2345,  316, 1198, 2570, 2610, 2614, 2619,
			 2636, 2644, 2653, 2669, 2678, 1180, 2687, 2704, 2709, 2726,
			 2748, 2731, 2753, 5548, 2770, 2776, 2800, 2810, 2818, 2614,
			 2846, 2861, 2866, 2886, 2623,  541, 1537, 1920, 5548,  968,
			  950,    0, 1097, 2897, 1132, 1140, 2251, 2395, 2276, 2324,
			 2389, 2437, 2383, 2540, 2617, 2686,    0, 2386, 1102, 2463,
			 2506, 2531,    0, 2569, 2642, 2532, 2561, 2603, 2554, 2632,
			 2671, 2708, 2664, 2676, 2694, 2701, 2739, 2744, 2884, 2911,
			 2922, 2743, 2939, 2951, 2957, 2928, 2968, 2977, 2983, 2989,

			 3002, 3008, 2945, 5548, 3017,    0, 3039, 3044, 3058, 3072,
			 3078, 3087, 3103, 3112, 2735, 3117, 3121, 3139, 3143, 3147,
			 3169, 3178, 5548, 1076, 3201, 3205, 3219, 3233, 2785, 2805,
			 2825,  592, 5548, 5548, 1880, 1596, 3221, 2750, 1082,    0,
			 1080, 2753,    0, 2754, 1076, 2782, 2801,    0, 2828, 2868,
			 1064, 2843, 2848, 2862, 2851, 3004, 2920, 2906, 2997, 3057,
			 3014, 3024, 3151, 3049,    0, 3013, 3034, 3034, 1063, 3094,
			 3234, 3242, 3249, 3262, 1025, 3277, 3283, 3289, 3034, 3295,
			 3301, 1024, 3307, 3313, 3323, 5548, 3329, 3346,    0, 3355,
			 3369, 3373, 3377, 3391, 3327, 3408, 3416, 3424, 3430, 3438,

			 3444, 3415, 3452, 3466, 3482,  988,  968,  951,  948,    0,
			 3499, 3062, 3086, 3323,    0, 3101,  931, 3145,    0,    0,
			    0, 1042,  912,  895, 3167,    0,  877, 3118,    0, 3217,
			  865, 3212, 3318, 3353, 3390,  810, 3505, 3514, 3520, 3527,
			 3537, 3554,  809, 2014, 3543, 3565, 3564, 3570, 3581,  816,
			 3592, 3607, 3625, 5548, 3629, 3634, 3579, 3659, 3665, 3674,
			 3433, 3621, 3636, 3655,  805,  795, 3365, 3364, 3436, 3386,
			 3443,    0,  610, 3428, 3536, 3430, 3438,    0, 3642, 3688,
			  496, 3703, 3710, 3716, 3728, 3734, 3740, 5548, 3750,    0,
			 3772, 3776, 3780, 3798, 5548, 3812, 3816, 3747, 3755, 3761,

			 3796, 3693, 3436, 3435, 3643,    0,  536, 3579, 3601,    0,
			 3567,  533, 3846,  490, 3852, 3863,    0, 3885, 3890, 3894,
			 3899, 1242, 5548, 2756,  474, 5548, 3581, 1641, 3632, 3574,
			 3774, 1658, 1768, 3908,  273, 3919, 3933, 3941, 3949, 3797,
			 3924, 3926, 3666,    0,  398,    0,  382, 3671, 3962, 3977,
			    0,  309, 3999, 4003, 3928, 3974, 3993, 2024, 3681, 3828,
			    0, 4012, 4042, 4046,  351,  287,  531, 3721,    0, 4055,
			 4034, 5548,  697, 4068, 4078, 4042, 4055, 3731, 4078, 4096,
			 4106, 4091, 4093,    0, 4106, 4121,  138,   82, 4128, 4134,
			 4144, 5548, 3990, 3992, 4149, 4156, 4151, 4152, 4164, 4175,

			 5548, 5548, 4185, 4191, 4197, 5548, 4210, 4221, 4227, 4233,
			 5548, 4273, 4311, 4349, 4387, 4425, 4240, 4453, 4488, 4519,
			 4555, 4593, 4631, 4669, 4706, 4742, 4780, 4818, 4850, 4886,
			 4914, 4950, 4981, 4437, 5017, 5055, 5092, 5113, 5139, 5175,
			 5202, 5237, 5273, 5308, 5344, 5366, 5391, 4248, 5421, 5441,
			 5466, 5486, 5511, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  910,    1,  911,  911,  912,  912,  910,    7,  913,
			  913,  910,  910,  910,  910,  910,  914,  910,  915,  916,
			  910,  910,  910,  910,  910,  910,  917,  910,  910,  910,
			  910,  910,  910,  910,  910,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  919,  910,  910,  920,  910,   55,   55,  910,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  910,  910,  910,  921,  910,  910,  910,  921,  921,  921,
			  921,  921,  922,  910,  923,  922,  910,  924,  910,  924,
			  924,  910,  925,  926,  910,  910,  910,  910,  914,  910,

			  927,  927,  927,  928,  929,  910,  910,  910,  930,  910,
			  931,  910,  910,  910,  910,  910,  910,  910,  918,  932,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,   46,  918,
			  918,  918,  918,   46,  918,  918,  918,  918,  918,  918,
			  919,  919,  920,  910,  910,  910,  933,   58,  910,  157,
			  157,  157,  910,   58,   58,   58,   58,   58,  157,   58,
			  157,  157,   58,   58,  157,  157,   58,   58,  157,  157,
			   58,   58,  157,   58,  157,  157,  157,   58,   58,   58,
			  157,   58,  157,   58,  157,  157,   58,   58,  157,  157,

			   58,   58,  157,  157,   58,   58,  157,   58,  157,   58,
			  910,  921,  910,  910,  910,  910,  921,  921,  921,  921,
			  921,  922,  910,  934,  922,  923,  935,  923,  934,  910,
			  924,  924,  910,  910,  910,  910,  910,  910,  925,  926,
			  910,  910,  239,  936,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  917,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  937,
			  932,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  910,  918,  918,  918,  918,  918,  918,  918,
			  918,  910,  918,  292,  292,  292,  292,  141,  141,  141,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  910,  919,  919,  910,  938,  910,  157,  157,  157,  910,
			  910,  157,   58,   58,   58,  157,   58,  157,  157,   58,
			   58,  157,  157,  157,   58,   58,   58,  157,  157,   58,
			   58,  910,  157,  157,  157,  157,   58,   58,   58,  157,
			   58,  157,   58,  157,  157,   58,   58,  157,  157,   58,
			   58,  157,  157,  157,   58,   58,   58,  157,   58,  157,
			   58,  921,  921,  921,  921,  921,  921,  921,  934,  910,
			  935,  939,  939,  910,  939,  939,  939,  936,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  940,  932,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  910,  918,  918,  918,  918,  918,  918,  918,
			  910,  292,  141,  292,  138,  292,  138,  910,  292,  292,
			  918,  918,  910,  918,  918,  918,  918,  918,  941,  919,
			  919,  910,  942,  157,  157,  910,   58,   58,  157,   58,
			  157,  157,   58,   58,  157,  157,  157,   58,   58,   58,
			  157,  157,   58,  157,  157,  157,  157,   58,   58,   58,
			  157,   58,  157,  157,   58,   58,  157,  157,   58,   58,
			  157,  157,  157,   58,   58,  157,   58,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  931,  910,  910,  910,  940,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  910,  918,  918,  918,  918,
			  918,  918,  918,  910,  292,  292,  910,  292,  537,  910,
			  918,  918,  918,  918,  937,  910,  943,  941,  910,  910,
			  910,  157,  157,  910,   58,   58,  157,   58,  157,  157,
			   58,   58,  157,  157,   58,   58,  157,  157,   58,  157,
			  157,  157,  157,   58,   58,   58,  157,   58,  157,  157,
			   58,   58,  157,  157,  157,  157,   58,   58,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,

			  910,  910,  910,  910,  944,  945,  918,  918,  918,  918,
			  918,  918,  918,  918,  910,  918,  918,  918,  918,  918,
			  918,  292,  910,  910,  918,  918,  918,  918,  910,  940,
			  940,  943,  910,  910,  910,  910,  910,  157,  910,  157,
			   58,  157,  157,   58,   58,  157,  157,  157,   58,   58,
			   58,  157,  157,  157,  157,   58,   58,   58,  157,   58,
			  157,  157,   58,   58,  157,  157,  157,  157,   58,   58,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  946,  918,
			  918,  918,  918,  918,  910,  918,  918,  918,  918,  918,

			  918,  910,  918,  918,  918,  910,  910,  940,  940,  947,
			  910,  157,  157,   58,  157,  157,   58,   58,  157,  157,
			  157,  157,   58,   58,   58,  157,   58,  157,  157,   58,
			   58,  157,  157,  157,   58,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  946,
			  918,  918,  918,  910,  918,  918,  910,  918,  918,  918,
			  910,  910,  945,  945,  948,  910,  157,  157,   58,  157,
			   58,  157,   58,  157,   58,  157,  157,  157,   58,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  949,
			  918,  918,  918,  918,  910,  918,  918,  910,  910,  946,

			  946,  910,  157,  157,   58,  157,   58,  157,   58,  157,
			  157,   58,  910,  910,  910,  910,  950,  918,  918,  918,
			  918,  910,  910,  946,  946,  910,  157,  157,   58,  157,
			   58,  157,  910,  910,  950,  918,  918,  918,  918,  910,
			  910,  946,  157,  157,   58,  157,   58,  157,  910,  910,
			  951,  910,  918,  918,  910,  910,  946,  157,  157,  910,
			  952,  910,  918,  918,  910,  910,  946,  157,  157,  910,
			  910,  910,  952,  910,  918,  910,  910,  157,  910,  910,
			  918,  910,  910,  157,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			    0,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910, yy_Dummy>>)
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
			   17,   18,   19,   20,   21,   22,   17,   17,   17,   17,
			   17,   17,   17,   17,   17,   17,   17,   17,   17,   23,
			   17,   17,   24,   25,   26,   27,    5,   12,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,    5,    5,   37,   38,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  105,  105,    0,    0,    0,
			    0,  137,  135,    1,    2,   15,  119,   18,  135,   16,
			   17,    7,    6,   13,    5,   11,    8,  110,  110,   14,
			   12,   29,   10,   30,   20,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   83,   98,   98,   98,
			   98,   22,   31,   23,    9,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			   24,   21,   25,  123,  124,  125,  126,  123,  123,  123,
			  123,  123,  105,  108,  136,  105,  136,  136,   70,  136,
			  136,   72,  136,  136,   97,    1,    2,   28,  119,  118,

			  133,  133,  133,    0,    3,   33,  114,   32,  102,    0,
			    0,  110,    0,  110,   27,   26,   19,    0,   98,   92,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   40,   98,   91,
			   91,   82,   91,   91,   98,   98,   98,   98,   98,   98,
			    0,    0,    0,  109,    0,    0,    0,  101,    0,  101,
			  101,  101,    0,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,   40,  101,   40,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  104,  123,  125,  124,  121,  120,  122,  123,  123,  123,
			  123,  105,  108,    0,  105,    0,    0,    0,  106,  107,
			    0,    0,   72,   70,    0,   69,    0,   68,    0,    0,
			   97,   95,   95,    0,   96,  133,  127,  133,  133,  133,
			  133,  133,  133,    0,    4,   34,  114,    0,    0,    0,
			    0,    0,  112,  114,  112,  110,    0,    0,   92,    0,
			    0,   98,   98,   39,   98,   98,   98,   98,   98,   98,
			   98,   98,    0,   98,   98,   98,   98,   98,   42,   98,
			   98,    0,   83,   84,   83,   83,   83,   90,   98,   90,

			   90,   90,   98,   98,   98,   98,   98,   98,   41,   98,
			    0,    0,    0,  100,  103,    0,  101,  101,   39,    0,
			   73,   73,  101,  101,   39,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,    0,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,   42,   42,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,   41,   41,  101,
			  101,  123,  123,  123,  123,  123,  123,  123,    0,  106,
			  107,    0,    0,   71,   69,   68,   72,    0,  131,  134,
			  134,  132,  128,  129,  130,   93,  114,    0,  114,    0,

			    0,    0,  114,    0,    0,    0,  113,  110,    0,    0,
			    0,   99,   98,   98,   98,   98,   98,   38,   98,   98,
			   98,   98,    0,   98,   98,   98,   98,   98,   98,   98,
			    0,   98,   82,   98,   98,   98,   98,    0,   82,   82,
			   82,   37,    0,   44,   98,   98,   98,   98,   67,    0,
			    0,    0,   63,  101,  101,    0,  101,  101,  101,  101,
			  101,  101,  101,  101,   38,  101,  101,   38,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,   37,   44,   37,   44,
			  101,  101,  101,  101,  101,  101,  101,  107,  114,  114,

			    0,    0,    0,  111,  114,    0,  113,    0,  113,    0,
			    0,    0,  110,   79,    0,    0,   60,   98,   98,   98,
			   98,   98,   98,   45,   98,    0,   98,   98,   98,   36,
			   98,   98,   98,   84,   84,   83,    0,   98,   98,    0,
			   98,   98,   98,   98,    0,   67,   67,    0,   66,   66,
			    0,   60,  101,    0,   60,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,   45,  101,   45,  101,
			  101,  101,   36,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,    0,  114,
			    0,  117,    0,  114,  113,    0,    0,  113,    0,    0,

			  112,    0,    0,   79,    0,    0,   98,   61,   98,   62,
			   98,   98,   47,   98,    0,   98,   98,   98,   98,   98,
			   98,   98,   82,    0,   53,   98,   98,   98,    0,    0,
			    0,    0,   65,   64,    0,    0,    0,  101,    0,   61,
			   61,  101,   62,  101,   62,  101,  101,   47,  101,  101,
			   47,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,   53,  101,  101,  101,   53,  101,
			    0,  114,    0,    0,  102,    0,  113,    0,  117,  113,
			    0,   81,    0,    0,    0,  115,  117,  115,    0,   98,
			   98,   59,   98,   46,    0,   43,   58,   98,   35,   98,

			   51,    0,   98,   98,   98,    0,    0,    0,    0,    0,
			    0,  101,  101,  101,   59,  101,   59,  101,   46,   43,
			   58,  101,   43,   58,  101,   35,   35,  101,   51,  101,
			   51,  101,  101,  101,  101,  117,    0,  117,    0,  113,
			    0,    0,  116,    0,    0,   78,  117,    0,  116,    0,
			   98,   98,   98,   87,   54,   98,    0,   98,   98,   55,
			    0,    0,    0,    0,    0,  103,  101,  101,  101,  101,
			  101,   54,   54,  101,  101,  101,  101,   55,  101,  117,
			  116,    0,  116,    0,    0,    0,    0,   78,  116,    0,
			   98,   98,   48,   98,   86,   52,   98,    0,    0,    0,

			    0,    0,  101,  101,  101,   48,   48,  101,  101,   52,
			  101,   52,  116,   80,    0,   78,    0,   98,   98,   98,
			   98,   85,   85,   85,   85,   94,  101,  101,  101,  101,
			  101,  101,    0,    0,    0,   98,   50,   49,   98,    0,
			    0,    0,  101,   50,   50,   49,   49,  101,    0,    0,
			    0,    0,   98,   98,    0,    0,    0,  101,  101,   77,
			    0,    0,   98,   56,    0,    0,    0,  101,   56,    0,
			    0,   77,    0,   74,   98,    0,    0,  101,    0,    0,
			   57,    0,    0,   57,    0,   76,    0,    0,    0,    0,
			    0,   76,    0,    0,    0,    0,    0,    0,    0,   75,

			   88,   89,    0,    0,    0,   75,    0,   75,    0,    0,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5548
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 910
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 911
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

	yyNb_rules: INTEGER = 136
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 137
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
			validator_reset
		end

	validate
		do
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

	dadl_parser: DADL_VALIDATOR
		once
			create Result.make
		end

	dadl_parser_error: STRING

	term_code_count: INTEGER
			-- Number of term codes found so far parsing a TERM_CONSTRAINT.

	assumed_term_code_index: INTEGER
			-- Index of term code in 'assumed' position when parsing a TERM_CONSTRAINT.

	c_domain_type: C_DOMAIN_TYPE

	tid: INTEGER

invariant
	in_buffer_not_void: in_buffer /= Void

end
