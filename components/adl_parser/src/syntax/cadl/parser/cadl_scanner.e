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

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_C_DOMAIN_TYPE)
		end

feature {NONE} -- Implementation

	yy_build_tables is
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

	yy_execute_action (yy_act: INTEGER) is
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
if yy_act <= 59 then
if yy_act <= 55 then
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
if yy_act = 54 then
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_INFINITY
else
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_USE_NODE
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
if yy_act = 58 then
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end
last_token := SYM_INCLUDE
else
--|#line 184 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 184")
end
last_token := SYM_EXCLUDE
end
end
end
else
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 186 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 186")
end
last_token := SYM_AFTER
else
--|#line 188 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 188")
end
last_token := SYM_BEFORE
end
else
if yy_act = 62 then
--|#line 192 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 192")
end
last_token := SYM_EXHAUSTIVE
else
--|#line 194 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 194")
end
last_token := SYM_SLOT
end
end
else
if yy_act <= 65 then
if yy_act = 64 then
--|#line 197 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 197")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 66 then
--|#line 208 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 208")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 214 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 214")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
end
end
end
end
else
if yy_act <= 100 then
if yy_act <= 84 then
if yy_act <= 76 then
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
--|#line 230 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 230")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 238 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 238")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
else
--|#line 245 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 245")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
end
else
if yy_act = 71 then
--|#line 252 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 252")
end
in_lineno := in_lineno + text_count
else
--|#line 255 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 255")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 257 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 257")
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
--|#line 278 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 278")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 75 then
--|#line 284 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 284")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 290 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 290")
end

					last_token := V_ARCHETYPE_ID_CODE
					last_string_value := text_substring (2, text_count - 1)
			
end
end
end
else
if yy_act <= 80 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 297 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 297")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 298 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 298")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 79 then
--|#line 299 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 299")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 306 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 306")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 82 then
if yy_act = 81 then
--|#line 307 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 307")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 314 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 314")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 83 then
--|#line 315 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 315")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 322 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 322")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 92 then
if yy_act <= 88 then
if yy_act <= 86 then
if yy_act = 85 then
--|#line 323 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 323")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 330 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 330")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
else
if yy_act = 87 then
--|#line 342 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 342")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 352 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 352")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
end
else
if yy_act <= 90 then
if yy_act = 89 then
--|#line 357 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 357")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 367 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 367")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
else
if yy_act = 91 then
--|#line 373 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 373")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 383 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 383")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
else
if yy_act <= 96 then
if yy_act <= 94 then
if yy_act = 93 then
--|#line 384 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 384")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 398 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 398")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 95 then
--|#line 404 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 404")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 410 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 410")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
end
else
if yy_act <= 98 then
if yy_act = 97 then
--|#line 414 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 414")
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
 			
else
--|#line 455 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 455")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
else
if yy_act = 99 then
--|#line 461 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 461")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 467 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 467")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 117 then
if yy_act <= 109 then
if yy_act <= 105 then
if yy_act <= 103 then
if yy_act <= 102 then
if yy_act = 101 then
--|#line 473 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 473")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 480 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 480")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
--|#line 486 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 486")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 104 then
--|#line 493 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 493")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 497 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 497")
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
if yy_act <= 107 then
if yy_act = 106 then
--|#line 508 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 508")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 108 then
--|#line 520 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 520")
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
--|#line 535 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 535")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 113 then
if yy_act <= 111 then
if yy_act = 110 then
--|#line 536 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 536")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 537 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 537")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 112 then
	yy_end := yy_end - 1
--|#line 541 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 541")
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
--|#line 542 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 542")
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
if yy_act <= 115 then
if yy_act = 114 then
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
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
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 116 then
--|#line 568 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 568")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 576 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 576")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 125 then
if yy_act <= 121 then
if yy_act <= 119 then
if yy_act = 118 then
--|#line 578 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 578")
end
in_buffer.append_character ('"')
else
--|#line 580 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 580")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 120 then
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
end
in_buffer.append_string (text)
else
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 123 then
if yy_act = 122 then
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
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
--|#line 602 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 602")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 124 then
--|#line 611 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 611")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 613 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 613")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 129 then
if yy_act <= 127 then
if yy_act = 126 then
--|#line 614 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 614")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 615 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 615")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 128 then
--|#line 616 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 616")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 617 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 617")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 131 then
if yy_act = 130 then
--|#line 619 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 619")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 620 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 620")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 132 then
--|#line 624 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 624")
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

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2, 3, 4, 5 then
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

	yy_nxt_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 6983)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   29,
			   29,   30,   30,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   40,   41,   42,   40,   43,   44,   40,
			   45,   46,   47,   48,   40,   40,   49,   50,   51,   40,
			   40,   52,   53,   40,   54,   55,   56,   57,   14,   58,
			   59,   60,   61,   62,   63,   61,   64,   65,   61,   66,
			   67,   68,   61,   61,   61,   69,   70,   71,   61,   61,
			   72,   73,   74,   75,   76,   14,   14,   14,   14,   14,
			   14,   14,   14,   14,   78,   87,   87,   97,   79,   78,

			   97,  105,   99,   79,   99,   99,  109,  160,  110,  110,
			  110,  110,  110,  110,  112,  238,  113,  216,  114,  114,
			  114,  114,  114,  114,  120,  120,  172,  120,  160,  899,
			  160,  182,  313,   88,   88,  112,  165,  113,  376,  116,
			  116,  116,  116,  116,  116,  190,   80,  106,  122,  160,
			  898,   80,  877,   98,  876,  173,   98,  165,  115,  165,
			  183,  313,   89,   89,  215,  217,  215,  215,  590,  590,
			   99,  239,   99,   99,  191,  860,  228,  780,  165,  115,
			   81,   82,   83,   84,   85,   81,   82,   83,   84,   85,
			   90,   91,   92,   90,   91,   90,   90,   90,   90,   90,

			   90,   90,   90,   90,   93,   94,   90,   94,   94,   94,
			   94,   94,   94,   90,   90,   90,   90,   90,   90,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   90,   90,   95,   90,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,  120,  120,  178,  120,  120,  120,  160,
			  120,  214,  234,  120,  120,  234,  120,  179,  236,  120,

			  120,  236,  120,  120,  120,  829,  120,  122,  160,  848,
			  849,  122,  229,  198,  180,  229,  123,  122,  165,  126,
			  124,  127,  125,  122,  214,  540,  181,  122,  541,  540,
			  120,  120,  540,  120,  132,  120,  120,  165,  120,  160,
			  128,  586,  199,  120,  120,  123,  120,  192,  126,  124,
			  127,  125,  129,  214,  122,  848,  849,  158,  130,  122,
			  158,  120,  120,  132,  120,  159,  231,  122,  165,  128,
			  131,  136,  219,  133,  134,  215,  193,  215,  215,  135,
			  314,  129,  160,  120,  120,  122,  120,  130,  120,  120,
			  208,  120,  780,  160,  120,  120,  916,  120,  174,  131,

			  136,  137,  133,  134,  221,  221,  160,  122,  135,  314,
			  175,  165,  122,  138,  224,  238,  504,  214,  122,  209,
			  120,  120,  165,  120,  210,  146,  139,  176,  595,  147,
			  137,  496,  218,  218,  218,  165,  194,  148,  160,  177,
			  120,  120,  138,  120,  122,  120,  120,  214,  120,  195,
			  623,  836,  225,  211,  146,  139,  120,  120,  147,  120,
			  151,  753,  752,  315,  122,  196,  148,  165,  751,  122,
			  115,  239,  140,  140,  140,  140,  140,  140,  197,  149,
			  122,  226,  321,  750,  150,  153,  153,  141,  732,  151,
			  153,  153,  315,  837,  142,  152,  220,  220,  220,  308,

			  160,  143,  227,  689,  144,  323,  145,  204,  149,  153,
			  153,  321,  205,  150,  153,  153,  141,  153,  153,  153,
			  153,  153,  153,  142,  152,  160,  222,  222,  222,  165,
			  214,  184,  185,  144,  323,  145,  206,  186,  626,  325,
			  225,  207,  160,  333,  334,  200,  258,  258,  258,  258,
			  258,  258,  605,  201,  165,  780,  596,  153,  155,  158,
			  187,  188,  158,  877,  266,  266,  189,  159,  325,  226,
			  214,  165,  333,  334,  202,  160,  160,  160,  160,  160,
			  160,  161,  203,  160,  160,  321,  112,  160,  160,  160,
			  160,  160,  162,  160,  160,  160,  163,  160,  164,  160,

			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  219,  165,  165,  322,  160,  165,  165,  166,  165,
			  165,  167,  165,  165,  165,  168,  165,  169,  165,  165,
			  165,  165,  165,  166,  165,  165,  165,  165,  165,  158,
			  233,  539,  158,  233,  406,  266,  379,  159,  379,  218,
			  218,  218,  234,  235,  337,  160,  160,  160,  160,  160,
			  160,  161,  338,  236,  160,  489,  308,  160,  160,  160,
			  160,  170,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  338,  345,  165,  231,  160,  165,  165,  165,  165,

			  171,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  233,
			  879,  345,  233,  246,  466,  255,  255,  255,  255,  255,
			  255,  234,  247,  247,  247,  247,  247,  247,  448,  347,
			  444,  256,  236,  266,  260,  260,  260,  260,  260,  260,
			  264,  264,  264,  264,  264,  264,  120,  120,  406,  120,
			  261,  390,  160,  120,  120,  257,  120,  314,  347,  248,
			  256,  389,  349,  231,  241,  241,  266,  241,  388,  253,
			  265,  253,  253,  387,  249,  384,  916,  122,  250,  261,
			  251,  165,  380,  379,  232,  380,  319,  228,  350,  214,

			  242,  349,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  112,  350,  113,  341,
			  262,  262,  262,  262,  262,  262,  263,  112,  353,  113,
			  355,  262,  262,  262,  262,  262,  262,  120,  120,  279,
			  120,  120,  120,  356,  120,  339,  243,  312,  340,  229,
			  266,  266,  229,  311,  266,  120,  120,  353,  120,  355,
			  115,  122,  157,  120,  120,  122,  120,  308,  266,  254,
			  160,  115,  356,  361,  339,  253,  266,  340,  269,  122,
			  120,  120,  268,  120,  252,  245,  270,  122,  120,  120,

			  266,  120,  103,  266,  341,  100,  271,  120,  120,  165,
			  120,  266,  361,  231,  122,  120,  120,  269,  120,  160,
			  266,  268,  122,  120,  120,  270,  120,  266,  266,  365,
			  359,  122,  313,  272,  360,  271,  266,  266,  232,  122,
			  120,  120,  273,  120,  277,  274,  355,  122,  165,  540,
			  275,  276,  541,  266,  120,  120,  160,  120,  365,  359,
			  367,  318,  272,  360,  122,  228,  278,  266,  325,  120,
			  120,  273,  120,  277,  274,  357,  279,  214,  122,  275,
			  276,  280,  266,  120,  120,  165,  120,  120,  120,  367,
			  120,  120,  120,  122,  120,  278,  266,  329,  417,  281, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  266,  212,  282,  623,  266,  120,  120,  122,  120,  417,
			  280,  122,  157,  120,  120,  122,  120,  119,  266,  118,
			  417,  120,  120,  117,  120,  111,  266,  449,  281,  122,
			  233,  282,  284,  233,  266,  286,  285,  122,  417,  283,
			  108,  266,  234,  450,  287,  122,  120,  120,  224,  120,
			  103,  453,  227,  236,  120,  120,  449,  120,  101,  266,
			  361,  284,  100,  916,  286,  285,  294,  266,  120,  120,
			  122,  120,  450,  287,  288,  266,  288,  141,  122,  266,
			  453,  266,  326,  266,  231,  141,  225,  327,  328,  364,
			  225,  294,  122,  289,  144,  916,  455,  290,  160,  294,

			  291,  315,  160,  457,  916,  266,  141,  121,  299,  323,
			  292,  326,  293,  916,  141,  226,  327,  328,  916,  226,
			  916,  266,  289,  144,  160,  455,  290,  165,  916,  291,
			  320,  165,  457,  120,  120,  334,  120,  299,  324,  292,
			  160,  293,  120,  120,  266,  120,  266,  121,  121,  121,
			  121,  121,  121,  165,  356,  266,  458,  122,  295,  295,
			  295,  295,  295,  295,  336,  300,  122,  459,  301,  165,
			  460,  120,  120,  916,  120,  916,  294,  296,  465,  468,
			  297,  121,  916,  358,  266,  458,  298,  120,  120,  916,
			  120,  469,  916,  266,  300,  122,  459,  301,  916,  460,

			  266,  120,  120,  916,  120,  266,  296,  465,  468,  297,
			  121,  122,  160,  916,  266,  298,  470,  302,  120,  120,
			  469,  120,  916,  303,  449,  122,  916,  304,  916,  916,
			  367,  266,  266,  305,  120,  120,  471,  120,  846,  846,
			  846,  165,  122,  153,  153,  470,  302,  266,  153,  153,
			  475,  160,  303,  451,  214,  266,  304,  308,  122,  368,
			  338,  306,  305,  266,  316,  471,  317,  317,  317,  317,
			  317,  317,  326,  266,  160,  477,  266,  327,  328,  475,
			  165,  266,  160,  266,  307,  916,  266,  916,  478,  342,
			  306,  481,  160,  339,  310,  160,  340,  333,  349,  483,

			  160,  330,  160,  165,  477,  160,  331,  332,  214,  310,
			  916,  165,  214,  307,  266,  345,  214,  478,  347,  916,
			  481,  165,  343,  916,  165,  344,  335,  351,  483,  165,
			  916,  165,  916,  160,  165,  266,  369,  370,  371,  372,
			  373,  916,  381,  379,  346,  381,  916,  348,  403,  403,
			  403,  403,  403,  350,  160,  916,  916,  916,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  266,  352,  165,  266,  266,  266,  218,  218,  218,
			  266,  374,  374,  374,  916,  375,  375,  375,  233,  916,

			  160,  233,  484,  160,  160,  160,  487,  359,  353,  457,
			  234,  360,  916,  383,  383,  365,  383,  252,  252,  916,
			  252,  236,  385,  386,  386,  386,  386,  386,  386,  165,
			  916,  484,  165,  165,  165,  487,  362,  354,  461,  242,
			  363,  391,  916,  916,  366,  395,  395,  395,  395,  395,
			  395,  916,  231,  377,  378,  379,  377,  378,  377,  377,
			  377,  377,  377,  377,  377,  377,  380,  916,  916,  377,
			  392,  392,  392,  392,  392,  392,  377,  381,  377,  377,
			  377,  377,  393,  916,  393,  488,  256,  394,  394,  394,
			  394,  394,  394,  396,  396,  396,  396,  396,  396,  404,

			  404,  404,  404,  404,  404,  916,  377,  377,  382,  377,
			  257,  916,  266,  916,  488,  256,  397,  397,  397,  397,
			  397,  397,  425,  425,  425,  425,  425,  425,  916,  475,
			  916,  160,  398,  916,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  241,  241,  916,  241,
			  429,  429,  429,  429,  429,  429,  399,  400,  476,  400,
			  165,  398,  401,  401,  401,  401,  401,  401,  916,  916,
			  492,  622,  242,  916,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  112,  492,

			  113,  916,  402,  402,  402,  402,  402,  402,  120,  120,
			  916,  120,  120,  120,  266,  120,  916,  120,  120,  916,
			  120,  266,  624,  916,  544,  266,  120,  120,  243,  120,
			  266,  916,  122,  160,  120,  120,  122,  120,  916,  266,
			  407,  122,  115,  120,  120,  266,  120,  266,  120,  120,
			  122,  120,  408,  544,  153,  153,  266,  466,  122,  445,
			  153,  266,  165,  916,  160,  410,  409,  122,  308,  407,
			  545,  916,  122,  120,  120,  411,  120,  916,  548,  120,
			  120,  408,  120,  916,  916,  412,  266,  120,  120,  916,
			  120,  550,  266,  165,  410,  409,  916,  122,  552,  545,

			  266,  413,  916,  122,  411,  120,  120,  548,  120,  120,
			  120,  122,  120,  214,  412,  916,  553,  266,  266,  554,
			  550,  916,  266,  414,  916,  120,  120,  552,  120,  122,
			  413,  415,  266,  122,  120,  120,  160,  120,  266,  916,
			  120,  120,  916,  120,  450,  553,  418,  266,  554,  122,
			  455,  160,  414,  266,  120,  120,  916,  120,  122,  916,
			  415,  416,  419,  916,  122,  165,  916,  266,  120,  120,
			  420,  120,  558,  452,  312,  418,  421,  916,  122,  456,
			  165,  266,  120,  120,  422,  120,  417,  120,  120,  916,
			  120,  419,  122,  221,  221,  266,  520,  417,  916,  420,

			  266,  558,  916,  916,  916,  421,  122,  520,  417,  916,
			  266,  122,  916,  422,  120,  120,  916,  120,  520,  424,
			  428,  428,  428,  428,  428,  428,  417,  266,  423,  160,
			  426,  426,  426,  426,  426,  426,  520,  453,  122,  430,
			  430,  430,  430,  430,  430,  432,  916,  432,  424,  121,
			  431,  431,  431,  431,  431,  431,  916,  423,  165,  427,
			  121,  121,  121,  121,  121,  121,  454,  916,  433,  916,
			  916,  434,  120,  120,  916,  120,  266,  435,  916,  121,
			  121,  121,  121,  121,  121,  266,  120,  120,  916,  120,
			  120,  120,  916,  120,  559,  478,  122,  433,  121,  266,

			  434,  916,  561,  266,  120,  120,  435,  120,  120,  120,
			  122,  120,  120,  120,  122,  120,  298,  266,  916,  562,
			  266,  266,  563,  559,  480,  266,  916,  121,  122,  564,
			  438,  561,  122,  916,  916,  436,  122,  120,  120,  484,
			  120,  916,  916,  437,  439,  298,  120,  120,  562,  120,
			  266,  563,  266,  120,  120,  266,  120,  916,  564,  266,
			  916,  122,  120,  120,  436,  120,  266,  916,  486,  916,
			  122,  160,  437,  439,  160,  266,  458,  122,  470,  440,
			  120,  120,  916,  120,  916,  568,  122,  916,  916,  441,
			  916,  266,  316,  266,  316,  316,  316,  316,  316,  316, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  165,  916,  916,  165,  122,  462,  916,  474,  440,  442,
			  160,  153,  153,  214,  568,  468,  445,  446,  441,  310,
			  310,  310,  310,  310,  310,  308,  266,  266,  266,  316,
			  443,  317,  317,  317,  317,  317,  317,  266,  214,  165,
			  916,  459,  266,  266,  472,  160,  160,  160,  266,  214,
			  266,  916,  469,  266,  916,  534,  160,  447,  460,  443,
			  214,  160,  160,  266,  214,  266,  534,  160,  465,  160,
			  463,  487,  160,  488,  165,  165,  165,  534,  570,  483,
			  481,  473,  160,  477,  160,  165,  266,  464,  916,  916,
			  165,  165,  218,  218,  218,  534,  165,  467,  165,  916,

			  490,  165,  491,  266,  836,  160,  489,  570,  485,  482,
			  916,  165,  479,  165,  916,  780,  916,  220,  220,  220,
			  571,  916,  160,  492,  378,  379,  550,  378,  222,  222,
			  222,  266,  383,  383,  165,  383,  380,  916,  916,  218,
			  218,  218,  916,  218,  218,  218,  838,  381,  916,  571,
			  160,  165,  493,  916,  916,  551,  916,  916,  916,  385,
			  386,  386,  386,  386,  386,  386,  494,  494,  494,  494,
			  494,  494,  394,  394,  394,  394,  394,  394,  382,  165,
			  574,  575,  256,  495,  495,  495,  495,  495,  495,  497,
			  497,  497,  497,  497,  497,  498,  498,  498,  498,  498,

			  498,  266,  916,  266,  916,  916,  257,  916,  916,  574,
			  575,  256,  499,  499,  499,  499,  499,  499,  121,  627,
			  558,  121,  160,  496,  500,  568,  500,  121,  398,  501,
			  501,  501,  501,  501,  501,  502,  502,  502,  502,  502,
			  502,  401,  401,  401,  401,  401,  401,  121,  627,  560,
			  121,  165,  399,  916,  569,  916,  121,  398,  503,  503,
			  503,  503,  503,  503,  505,  506,  916,  507,  507,  507,
			  507,  507,  507,  508,  508,  508,  508,  508,  508,  509,
			  509,  509,  509,  509,  509,  916,  120,  120,  629,  120,
			  120,  120,  916,  120,  120,  120,  916,  120,  504,  266,

			  266,  916,  916,  266,  916,  266,  916,  266,  120,  120,
			  122,  120,  120,  120,  122,  120,  576,  629,  122,  160,
			  916,  266,  631,  916,  160,  266,  563,  577,  632,  511,
			  120,  120,  122,  120,  916,  544,  122,  513,  512,  120,
			  120,  266,  120,  266,  514,  576,  120,  120,  165,  120,
			  614,  631,  266,  165,  122,  567,  577,  632,  511,  266,
			  160,  614,  916,  122,  546,  639,  513,  512,  120,  120,
			  122,  120,  614,  514,  120,  120,  515,  120,  266,  916,
			  266,  266,  266,  120,  120,  516,  120,  266,  916,  165,
			  614,  517,  122,  640,  639,  641,  266,  160,  122,  160,

			  518,  160,  519,  120,  120,  515,  120,  122,  120,  120,
			  548,  120,  120,  120,  516,  120,  266,  545,  916,  521,
			  517,  266,  640,  916,  641,  266,  165,  122,  165,  518,
			  165,  519,  122,  266,  266,  916,  122,  120,  120,  549,
			  120,  120,  120,  916,  120,  266,  547,  523,  521,  522,
			  266,  524,  160,  160,  266,  120,  120,  916,  120,  916,
			  916,  122,  916,  916,  160,  122,  916,  552,  266,  288,
			  642,  288,  525,  916,  916,  539,  523,  554,  522,  122,
			  524,  165,  165,  916,  526,  916,  425,  425,  425,  425,
			  425,  425,  290,  165,  160,  529,  555,  646,  527,  642,

			  916,  525,  121,  288,  916,  288,  557,  428,  428,  428,
			  428,  428,  428,  526,  528,  429,  429,  429,  429,  429,
			  429,  290,  916,  165,  529,  266,  646,  527,  266,  529,
			  430,  430,  430,  430,  430,  430,  121,  529,  671,  671,
			  671,  671,  671,  528,  160,  530,  575,  160,  561,  121,
			  431,  431,  431,  431,  431,  431,  916,  916,  529,  121,
			  531,  531,  531,  531,  531,  531,  529,  532,  532,  532,
			  532,  532,  532,  165,  530,  579,  165,  565,  121,  120,
			  120,  648,  120,  649,  121,  533,  533,  533,  533,  533,
			  533,  592,  266,  592,  120,  120,  121,  120,  120,  120,

			  916,  120,  593,  122,  916,  652,  653,  266,  916,  266,
			  648,  266,  649,  121,  121,  916,  120,  120,  122,  120,
			  120,  120,  122,  120,  120,  120,  916,  120,  160,  266,
			  916,  594,  654,  266,  652,  653,  655,  266,  120,  120,
			  122,  120,  553,  916,  122,  916,  120,  120,  122,  120,
			  266,  539,  916,  916,  916,  536,  916,  165,  916,  266,
			  916,  654,  122,  266,  916,  655,  535,  153,  153,  160,
			  122,  556,  153,  153,  537,  153,  153,  153,  153,  153,
			  153,  308,  160,  562,  536,  538,  446,  266,  446,  446,
			  446,  446,  446,  446,  308,  535,  574,  266,  165,  916,

			  916,  916,  619,  537,  916,  916,  160,  774,  774,  774,
			  774,  165,  566,  620,  538,  153,  160,  570,  494,  494,
			  494,  494,  494,  494,  621,  578,  447,  571,  581,  581,
			  581,  581,  581,  581,  580,  165,  582,  582,  582,  582,
			  582,  582,  620,  916,  916,  165,  572,  583,  583,  583,
			  583,  583,  583,  266,  916,  916,  573,  584,  584,  584,
			  584,  584,  584,  580,  698,  916,  699,  701,  496,  916,
			  661,  702,  160,  398,  501,  501,  501,  501,  501,  501,
			  585,  585,  585,  585,  585,  585,  587,  587,  587,  587,
			  587,  587,  916,  698,  257,  699,  701,  399,  266,  661,

			  702,  165,  398,  588,  588,  588,  588,  588,  588,  589,
			  589,  589,  589,  589,  589,  120,  120,  627,  120,  916,
			  586,  584,  584,  584,  584,  584,  584,  506,  266,  507,
			  507,  507,  507,  507,  507,  120,  120,  591,  120,  122,
			  916,  120,  120,  504,  120,  916,  628,  916,  266,  916,
			  120,  120,  266,  120,  266,  120,  120,  916,  120,  122,
			  916,  703,  916,  266,  916,  122,  591,  707,  266,  120,
			  120,  160,  120,  598,  122,  120,  120,  916,  120,  122,
			  916,  916,  266,  916,  120,  120,  600,  120,  266,  599,
			  703,  597,  708,  122,  916,  626,  707,  266,  266,  122,

			  165,  709,  598,  120,  120,  916,  120,  602,  122,  120,
			  120,  916,  120,  601,  916,  600,  266,  160,  599,  603,
			  916,  708,  266,  633,  266,  120,  120,  122,  120,  916,
			  709,  120,  120,  122,  120,  634,  602,  916,  266,  916,
			  604,  606,  601,  640,  266,  916,  165,  916,  603,  122,
			  120,  120,  633,  120,  916,  122,  607,  266,  120,  120,
			  916,  120,  710,  266,  634,  120,  120,  608,  120,  604,
			  606,  266,  643,  916,  122,  916,  646,  714,  266,  916,
			  120,  120,  122,  120,  916,  607,  916,  916,  916,  122,
			  609,  710,  266,  266,  916,  916,  608,  612,  612,  612, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  612,  612,  612,  916,  122,  647,  714,  916,  610,  716,
			  916,  649,  611,  121,  121,  121,  121,  121,  121,  609,
			  531,  531,  531,  531,  531,  531,  121,  432,  916,  432,
			  916,  532,  532,  532,  532,  532,  532,  610,  716,  266,
			  651,  611,  533,  533,  533,  533,  533,  533,  613,  120,
			  120,  916,  120,  434,  120,  120,  717,  120,  160,  435,
			  121,  266,  266,  916,  121,  629,  916,  266,  916,  916,
			  916,  120,  120,  122,  120,  916,  916,  613,  122,  631,
			  160,  615,  434,  916,  266,  717,  616,  165,  435,  120,
			  120,  916,  120,  121,  630,  122,  916,  266,  153,  153,

			  266,  266,  266,  153,  153,  266,  266,  266,  635,  165,
			  615,  693,  308,  122,  617,  616,  160,  682,  266,  633,
			  652,  720,  693,  641,  160,  160,  160,  721,  632,  618,
			  642,  634,  722,  694,  682,  916,  648,  653,  916,  682,
			  916,  916,  916,  617,  916,  165,  916,  916,  637,  656,
			  720,  693,  644,  165,  165,  165,  721,  636,  618,  645,
			  638,  722,  658,  682,  658,  650,  657,  659,  659,  659,
			  659,  659,  659,  659,  659,  659,  659,  659,  659,  660,
			  660,  660,  660,  660,  660,  584,  584,  584,  584,  584,
			  584,  663,  663,  663,  663,  663,  663,  755,  916,  916,

			  916,  662,  664,  664,  664,  664,  664,  664,  266,  266,
			  266,  916,  916,  496,  665,  665,  665,  665,  665,  665,
			  666,  666,  666,  666,  666,  666,  755,  160,  701,  160,
			  662,  586,  667,  667,  667,  667,  667,  667,  668,  668,
			  668,  668,  668,  668,  669,  916,  669,  916,  756,  666,
			  666,  666,  666,  666,  666,  916,  165,  704,  165,  916,
			  504,  670,  670,  670,  670,  670,  670,  673,  673,  673,
			  673,  673,  673,  120,  120,  916,  120,  756,  120,  120,
			  758,  120,  916,  674,  266,  266,  266,  120,  120,  730,
			  120,  266,  120,  120,  916,  120,  916,  122,  916,  699,

			  266,  676,  122,  160,  709,  266,  916,  120,  120,  758,
			  120,  122,  674,  399,  916,  677,  122,  916,  730,  759,
			  266,  916,  120,  120,  678,  120,  120,  120,  700,  120,
			  676,  122,  165,  712,  916,  266,  693,  916,  694,  266,
			  916,  762,  120,  120,  677,  120,  122,  695,  759,  696,
			  122,  916,  679,  678,  764,  266,  120,  120,  696,  120,
			  696,  680,  120,  120,  766,  120,  122,  916,  916,  266,
			  762,  120,  120,  266,  120,  266,  695,  916,  696,  681,
			  122,  679,  767,  764,  266,  768,  122,  266,  120,  120,
			  680,  120,  716,  766,  684,  122,  120,  120,  916,  120,

			  683,  266,  120,  120,  916,  120,  160,  916,  681,  266,
			  916,  767,  122,  916,  768,  266,  685,  916,  916,  916,
			  122,  718,  916,  684,  120,  120,  122,  120,  687,  683,
			  916,  794,  686,  688,  288,  165,  288,  266,  612,  612,
			  612,  612,  612,  612,  916,  685,  120,  120,  122,  120,
			  120,  120,  795,  120,  916,  120,  120,  687,  120,  266,
			  794,  686,  688,  266,  266,  266,  797,  121,  266,  266,
			  122,  153,  153,  266,  122,  266,  697,  153,  798,  122,
			  691,  795,  743,  160,  160,  308,  692,  801,  160,  690,
			  916,  703,  160,  916,  160,  797,  702,  916,  916,  743,

			  708,  916,  746,  266,  743,  710,  714,  798,  266,  691,
			  916,  266,  165,  165,  916,  692,  801,  165,  690,  746,
			  706,  165,  160,  165,  746,  705,  717,  160,  743,  711,
			  160,  916,  803,  720,  713,  715,  659,  659,  659,  659,
			  659,  659,  659,  659,  659,  659,  659,  659,  746,  916,
			  789,  165,  916,  916,  789,  719,  165,  120,  120,  165,
			  120,  803,  723,  724,  724,  724,  724,  724,  724,  725,
			  266,  725,  789,  916,  726,  726,  726,  726,  726,  726,
			  727,  122,  727,  789,  916,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  729,  729,  729,

			  729,  729,  729,  666,  666,  666,  666,  666,  666,  731,
			  731,  731,  731,  731,  731,  666,  666,  666,  666,  666,
			  666,  733,  733,  733,  733,  733,  733,  916,  266,  916,
			  916,  586,  734,  734,  734,  734,  734,  734,  735,  735,
			  735,  735,  735,  735,  804,  759,  916,  160,  120,  120,
			  736,  120,  736,  916,  730,  737,  737,  737,  737,  737,
			  737,  266,  120,  120,  821,  120,  120,  120,  266,  120,
			  266,  916,  122,  804,  761,  266,  165,  916,  399,  266,
			  916,  120,  120,  730,  120,  916,  122,  160,  916,  160,
			  122,  739,  756,  821,  266,  120,  120,  916,  120,  740,

			  120,  120,  741,  120,  266,  122,  266,  916,  266,  120,
			  120,  742,  120,  266,  120,  120,  165,  120,  165,  122,
			  739,  757,  266,  160,  122,  160,  266,  266,  740,  120,
			  120,  741,  120,  122,  120,  120,  266,  120,  122,  916,
			  742,  266,  266,  120,  120,  160,  120,  266,  120,  120,
			  916,  120,  165,  122,  165,  160,  266,  916,  122,  758,
			  160,  266,  120,  120,  744,  120,  916,  122,  120,  120,
			  916,  120,  122,  745,  165,  266,  266,  266,  762,  790,
			  747,  266,  786,  790,  165,  916,  122,  916,  760,  165,
			  916,  822,  122,  744,  824,  766,  160,  748,  826,  786,

			  749,  790,  745,  764,  786,  153,  153,  763,  916,  747,
			  153,  153,  790,  153,  153,  153,  153,  153,  153,  308,
			  822,  916,  828,  824,  769,  165,  748,  826,  786,  749,
			  916,  916,  765,  726,  726,  726,  726,  726,  726,  770,
			  770,  770,  770,  770,  770,  728,  728,  728,  728,  728,
			  728,  828,  916,  153,  728,  728,  728,  728,  728,  728,
			  771,  771,  771,  771,  771,  771,  772,  916,  772,  916,
			  916,  773,  773,  773,  773,  773,  773,  916,  916,  496,
			  775,  775,  775,  775,  775,  775,  776,  777,  776,  777,
			  665,  665,  665,  665,  665,  665,  737,  737,  737,  737,

			  737,  737,  916,  266,  266,  916,  730,  779,  779,  779,
			  779,  779,  779,  916,  120,  120,  916,  120,  120,  120,
			  916,  120,  160,  798,  916,  916,  778,  266,  789,  266,
			  399,  266,  791,  120,  120,  730,  120,  797,  122,  916,
			  120,  120,  122,  120,  781,  790,  266,  504,  160,  792,
			  791,  165,  800,  266,  782,  120,  120,  122,  120,  916,
			  840,  791,  120,  120,  122,  120,  799,  792,  266,  841,
			  916,  916,  784,  781,  916,  266,  266,  165,  792,  122,
			  783,  120,  120,  782,  120,  916,  122,  120,  120,  840,
			  120,  266,  785,  916,  266,  160,  266,  843,  841,  795, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  266,  784,  916,  120,  120,  122,  120,  845,  801,  783,
			  160,  122,  787,  856,  803,  160,  266,  153,  153,  788,
			  916,  785,  153,  153,  165,  916,  843,  122,  796,  916,
			  916,  308,  916,  916,  916,  916,  845,  802,  916,  165,
			  916,  787,  856,  805,  165,  916,  916,  916,  788,  724,
			  724,  724,  724,  724,  724,  773,  773,  773,  773,  773,
			  773,  806,  806,  806,  806,  806,  806,  807,  807,  807,
			  807,  807,  807,  594,  594,  594,  594,  594,  594,  808,
			  808,  808,  808,  808,  808,  120,  120,  857,  120,  496,
			  809,  809,  809,  809,  809,  809,  916,  868,  266,  916,

			  916,  586,  731,  731,  731,  731,  731,  731,  869,  122,
			  120,  120,  916,  120,  120,  120,  857,  120,  816,  916,
			  811,  817,  816,  266,  916,  817,  868,  266,  120,  120,
			  880,  120,  120,  120,  122,  120,  916,  869,  122,  916,
			  816,  266,  504,  817,  266,  266,  813,  120,  120,  811,
			  120,  816,  122,  266,  817,  812,  122,  816,  817,  880,
			  266,  818,  819,  160,  814,  120,  120,  916,  120,  266,
			  888,  122,  824,  916,  916,  813,  822,  266,  266,  818,
			  819,  153,  153,  266,  812,  916,  153,  820,  160,  122,
			  818,  819,  165,  814,  916,  308,  826,  916,  870,  888,

			  870,  825,  160,  916,  916,  823,  916,  266,  916,  871,
			  815,  771,  771,  771,  771,  771,  771,  165,  830,  830,
			  830,  830,  830,  830,  916,  827,  160,  776,  916,  776,
			  916,  165,  809,  809,  809,  809,  809,  809,  872,  815,
			  120,  120,  916,  120,  120,  120,  916,  120,  916,  120,
			  120,  586,  120,  266,  916,  165,  916,  266,  120,  120,
			  916,  120,  266,  916,  122,  916,  266,  778,  122,  916,
			  916,  266,  832,  122,  120,  120,  916,  120,  909,  910,
			  909,  910,  122,  916,  916,  160,  916,  266,  847,  847,
			  847,  847,  847,  847,  833,  895,  266,  895,  122,  153,

			  153,  832,  834,  841,  153,  153,  896,  153,  153,  153,
			  153,  153,  153,  308,  165,  160,  120,  120,  911,  120,
			  916,  916,  266,  833,  835,  120,  120,  843,  120,  266,
			  916,  834,  842,  120,  120,  897,  120,  916,  266,  780,
			  122,  160,  120,  120,  165,  120,  266,  153,  916,  122,
			  852,  853,  853,  835,  916,  266,  844,  122,  852,  853,
			  854,  850,  153,  153,  916,  266,  122,  153,  153,  916,
			  165,  916,  852,  853,  854,  916,  308,  858,  858,  858,
			  858,  858,  858,  851,  160,  916,  916,  852,  853,  854,
			  850,  778,  778,  778,  778,  778,  778,  120,  120,  916,

			  120,  120,  120,  916,  120,  780,  916,  863,  864,  916,
			  266,  916,  851,  165,  266,  863,  864,  902,  864,  916,
			  916,  122,  153,  153,  884,  122,  865,  866,  867,  863,
			  864,  916,  916,  862,  902,  884,  308,  916,  916,  902,
			  865,  916,  916,  916,  863,  864,  884,  861,  874,  874,
			  874,  874,  874,  120,  120,  865,  120,  120,  120,  916,
			  120,  916,  862,  902,  884,  916,  266,  916,  916,  916,
			  266,  916,  916,  916,  153,  153,  861,  122,  916,  153,
			  153,  122,  153,  153,  153,  153,  153,  153,  308,  882,
			  882,  882,  882,  882,  875,  881,  881,  881,  881,  881,

			  881,  874,  874,  874,  874,  874,  874,  120,  120,  916,
			  120,  153,  153,  885,  916,  916,  153,  153,  916,  916,
			  266,  916,  153,  875,  885,  308,  901,  901,  901,  901,
			  901,  122,  916,  916,  916,  885,  916,  916,  916,  883,
			  887,  887,  887,  887,  887,  308,  889,  889,  889,  889,
			  889,  889,  916,  885,  890,  890,  890,  890,  890,  890,
			  120,  120,  916,  120,  891,  892,  153,  153,  883,  916,
			  916,  866,  867,  266,  916,  891,  892,  916,  916,  916,
			  308,  916,  916,  916,  122,  916,  891,  892,  887,  887,
			  887,  887,  887,  887,  308,  894,  894,  894,  894,  894,

			  894,  903,  906,  907,  891,  892,  872,  872,  872,  872,
			  872,  872,  900,  900,  900,  900,  900,  900,  903,  906,
			  907,  916,  916,  903,  906,  907,  893,  904,  904,  904,
			  904,  904,  904,  905,  905,  905,  905,  905,  905,  908,
			  908,  908,  908,  908,  908,  916,  916,  903,  906,  907,
			  897,  897,  897,  897,  897,  897,  912,  912,  912,  912,
			  912,  912,  913,  913,  913,  913,  913,  913,  914,  914,
			  914,  914,  914,  914,  909,  916,  909,  916,  916,  913,
			  913,  913,  913,  913,  913,  915,  915,  915,  915,  915,
			  915,  911,  911,  911,  911,  911,  911,  916,  916,  916,

			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  911,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,  102,  102,  916,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  916,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  104,  104,  916,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  121,  121,  121,
			  916,  916,  916,  916,  916,  916,  916,  121,  121,  916,
			  121,  916,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  916,  916,  121,  121,

			  121,  121,  121,  121,  121,  121,  121,  154,  154,  916,
			  154,  154,  916,  154,  154,  916,  916,  916,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  916,  916,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  156,  156,  916,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,

			  156,  156,  156,  156,  156,  156,  213,  213,  916,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  916,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  916,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  230,  916,  230,  916,  916,
			  916,  916,  230,  230,  916,  230,  230,  916,  916,  916,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,

			  230,  230,  230,  230,  916,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,

			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  244,  244,  916,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  107,  916,  916,  916,  916,  107,
			  107,  916,  916,  916,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,

			  107,  107,  107,  107,  107,  107,  107,  107,  916,  916,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  916,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,

			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  267,  916,  916,  916,  267,
			  267,  916,  267,  267,  267,  267,  267,  267,  267,  267,
			  267,  267,  267,  267,  267,  267,  267,  267,  267,  267,
			  267,  267,  267,  267,  267,  267,  267,  267,  916,  916,
			  267,  267,  267,  267,  267,  267,  267,  267,  267,  153,
			  153,  916,  153,  153,  916,  153,  153,  153,  916,  916,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,

			  153,  153,  153,  153,  916,  916,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  309,  309,  916,  309,  309,
			  916,  309,  309,  309,  916,  916,  309,  309,  309,  309,
			  309,  309,  309,  309,  309,  309,  309,  309,  309,  309,
			  309,  309,  309,  309,  309,  309,  309,  309,  309,  309,
			  916,  916,  309,  309,  309,  309,  309,  309,  309,  309,
			  309,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  243,  243,  243,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  243,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  916,
			  916,  405,  405,  405,  405,  405,  405,  405,  405,  405, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  510,  510,  916,  916,  916,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  916,  916,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  542,  916,  542,  916,  916,  916,  916,

			  542,  542,  916,  542,  542,  916,  916,  916,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  916,  916,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  543,  543,  916,  543,  543,  916,  543,
			  543,  543,  916,  916,  543,  543,  543,  543,  543,  543,
			  543,  543,  543,  543,  543,  543,  543,  543,  543,  543,
			  543,  543,  543,  543,  543,  543,  543,  543,  916,  916,
			  543,  543,  543,  543,  543,  543,  543,  543,  543,  448,
			  448,  448,  916,  916,  448,  448,  448,  448,  448,  448,

			  448,  448,  448,  916,  916,  448,  448,  448,  448,  448,
			  448,  448,  448,  448,  448,  448,  448,  448,  448,  448,
			  448,  448,  448,  448,  448,  448,  448,  448,  448,  916,
			  916,  448,  448,  448,  448,  448,  448,  448,  448,  448,
			  622,  916,  622,  916,  916,  916,  916,  622,  622,  916,
			  622,  622,  916,  916,  916,  622,  622,  622,  622,  622,
			  622,  622,  622,  622,  622,  622,  622,  622,  622,  622,
			  622,  622,  622,  622,  622,  622,  622,  622,  622,  916,
			  622,  622,  622,  622,  622,  622,  622,  622,  622,  622,
			  625,  625,  916,  625,  625,  916,  625,  625,  625,  916,

			  916,  625,  625,  625,  625,  625,  625,  625,  625,  625,
			  625,  625,  625,  625,  625,  625,  625,  625,  625,  625,
			  625,  625,  625,  625,  625,  916,  916,  625,  625,  625,
			  625,  625,  625,  625,  625,  625,  672,  672,  672,  672,
			  672,  672,  672,  672,  672,  916,  672,  672,  672,  672,
			  672,  672,  672,  672,  672,  672,  672,  672,  672,  672,
			  672,  672,  672,  672,  672,  672,  672,  672,  672,  672,
			  672,  672,  672,  672,  672,  672,  672,  672,  672,  672,
			  672,  672,  672,  672,  672,  672,  672,  672,  672,  675,
			  675,  675,  675,  675,  675,  675,  675,  675,  675,  675,

			  675,  675,  675,  675,  675,  675,  675,  675,  675,  675,
			  675,  675,  675,  916,  916,  675,  675,  675,  675,  675,
			  675,  675,  675,  675,  738,  738,  916,  916,  916,  738,
			  738,  738,  738,  738,  738,  738,  738,  738,  738,  738,
			  738,  738,  738,  738,  738,  738,  738,  738,  738,  738,
			  738,  738,  738,  916,  916,  738,  738,  738,  738,  738,
			  738,  738,  738,  738,  754,  754,  916,  754,  754,  916,
			  754,  754,  754,  916,  916,  754,  754,  754,  754,  754,
			  754,  754,  754,  754,  754,  754,  754,  754,  754,  754,
			  754,  754,  754,  754,  754,  754,  754,  754,  754,  916,

			  916,  754,  754,  754,  754,  754,  754,  754,  754,  754,
			  793,  793,  916,  793,  793,  916,  793,  793,  793,  916,
			  916,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  916,  916,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  916,  916,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  831,  831,  916,  916,  916,  831,  831,  831,  831,

			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  916,  916,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  839,  839,  916,  839,  839,  916,  839,  839,  839,
			  916,  916,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  916,  916,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  855,  855,  916,
			  855,  855,  916,  855,  855,  855,  916,  916,  855,  855,
			  855,  855,  855,  855,  855,  855,  855,  855,  855,  855,

			  855,  855,  855,  855,  855,  855,  855,  855,  855,  855,
			  855,  855,  916,  916,  855,  855,  855,  855,  855,  855,
			  855,  855,  855,  859,  859,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  916,  916,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  873,  873,
			  916,  916,  916,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  916,  916,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  878,  878,

			  916,  878,  878,  916,  878,  878,  878,  916,  916,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  916,  916,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  886,  886,  916,  886,  886,  916,
			  886,  886,  886,  916,  916,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  916,
			  916,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			   13,  916,  916,  916,  916,  916,  916,  916,  916,  916,

			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916, yy_Dummy>>,
			1, 984, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 6983)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER]) is
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
			    1,    1,    1,    1,    3,    5,    6,   11,    3,    4,

			   12,   20,   15,    4,   15,   15,   27,   61,   27,   27,
			   27,   27,   27,   27,   29,   96,   29,   80,   29,   29,
			   29,   29,   29,   29,   40,   40,   60,   40,   64,  892,
			   60,   64,  162,    5,    6,   30,   61,   30,  228,   30,
			   30,   30,   30,   30,   30,   66,    3,   20,   40,   66,
			  891,    4,  864,   11,  863,   60,   12,   64,   29,   60,
			   64,  162,    5,    6,   78,   80,   78,   78,  505,  505,
			   99,   96,   99,   99,   66,  849,  228,  819,   66,   30,
			    3,    3,    3,    3,    3,    4,    4,    4,    4,    4,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,

			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,   37,   37,   63,   37,   38,   38,   63,
			   38,   82,  234,   39,   39,  234,   39,   63,  236,   43,

			   43,  236,   43,   41,   41,  807,   41,   37,   69,  831,
			  831,   38,   91,   69,   63,   91,   37,   39,   63,   38,
			   37,   39,   37,   43,   84,  444,   63,   41,  444,  540,
			   42,   42,  540,   42,   43,   44,   44,   69,   44,   67,
			   41,  771,   69,   45,   45,   37,   45,   67,   38,   37,
			   39,   37,   41,   81,   42,  873,  873,  158,   42,   44,
			  158,   46,   46,   43,   46,  158,   91,   45,   67,   41,
			   42,   45,   82,   44,   44,  215,   67,  215,  215,   44,
			  163,   41,   72,   47,   47,   46,   47,   42,   49,   49,
			   72,   49,  738,   62,   50,   50,  622,   50,   62,   42,

			   45,   46,   44,   44,   84,   84,   73,   47,   44,  163,
			   62,   72,   49,   47,   86,  237,  731,   83,   50,   72,
			   52,   52,   62,   52,   73,   49,   47,   62,  509,   50,
			   46,  724,   81,   81,   81,   73,   68,   50,   68,   62,
			   51,   51,   47,   51,   52,   53,   53,   85,   53,   68,
			  622,  816,   86,   73,   49,   47,   48,   48,   50,   48,
			   52,  696,  695,  164,   51,   68,   50,   68,  694,   53,
			  509,  237,   48,   48,   48,   48,   48,   48,   68,   51,
			   48,   86,  170,  693,   51,  154,  154,   48,  668,   52,
			  154,  154,  164,  816,   48,   53,   83,   83,   83,  154,

			   71,   48,   88,  614,   48,  172,   48,   71,   51,   54,
			   54,  170,   71,   51,   54,   54,   48,   54,   54,   54,
			   54,   54,   54,   48,   53,   65,   85,   85,   85,   71,
			  370,   65,   65,   48,  172,   48,   71,   65,  545,  174,
			   88,   71,   70,  178,  179,   70,  112,  112,  112,  112,
			  112,  112,  520,   70,   65,  865,  510,   54,   54,   58,
			   65,   65,   58,  865,  165,  171,   65,   58,  174,   88,
			  219,   70,  178,  179,   70,   58,   58,   58,   58,   58,
			   58,   58,   70,  165,  171,  171,  498,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,

			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  370,  165,  171,  171,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   59,
			   93,  492,   59,   93,  406,  183,  382,   59,  377,  219,
			  219,  219,   93,   93,  183,   59,   59,   59,   59,   59,
			   59,   59,  184,   93,  183,  361,  867,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,  184,  190,  183,   93,   59,   59,   59,   59,   59,

			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   94,
			  867,  190,   94,  106,  334,  110,  110,  110,  110,  110,
			  110,   94,  106,  106,  106,  106,  106,  106,  312,  192,
			  308,  110,   94,  168,  113,  113,  113,  113,  113,  113,
			  115,  115,  115,  115,  115,  115,  120,  120,  267,  120,
			  113,  251,  168,  121,  121,  110,  121,  168,  192,  106,
			  110,  250,  194,   94,   97,   97,  121,   97,  249,  253,
			  120,  253,  253,  248,  106,  246,  241,  121,  106,  113,
			  106,  168,  380,  380,  232,  380,  168,  226,  195,  213,

			   97,  194,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,  114,  195,  114,  186,
			  114,  114,  114,  114,  114,  114,  114,  116,  198,  116,
			  200,  116,  116,  116,  116,  116,  116,  123,  123,  182,
			  123,  124,  124,  201,  124,  185,   97,  161,  185,  229,
			  123,  189,  229,  159,  124,  125,  125,  198,  125,  200,
			  114,  123,  156,  126,  126,  124,  126,  153,  125,  109,
			  189,  116,  201,  205,  185,  108,  126,  185,  124,  125,
			  127,  127,  123,  127,  107,  104,  125,  126,  128,  128,

			  167,  128,  102,  127,  189,  100,  126,  130,  130,  189,
			  130,  128,  205,  229,  127,  129,  129,  124,  129,  167,
			  130,  123,  128,  131,  131,  125,  131,  202,  129,  208,
			  204,  130,  167,  127,  204,  126,  131,  176,   92,  129,
			  133,  133,  128,  133,  130,  129,  202,  131,  167,  541,
			  129,  129,  541,  133,  132,  132,  176,  132,  208,  204,
			  210,  167,  127,  204,  133,   89,  131,  132,  176,  134,
			  134,  128,  134,  130,  129,  202,  132,   77,  132,  129,
			  129,  133,  134,  135,  135,  176,  135,  136,  136,  210,
			  136,  137,  137,  134,  137,  131,  135,  176,  279,  134, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  136,   74,  134,  541,  137,  138,  138,  135,  138,  279,
			  133,  136,   57,  139,  139,  137,  139,   36,  138,   35,
			  279,  141,  141,   33,  141,   28,  139,  313,  134,  138,
			  230,  134,  136,  230,  141,  138,  137,  139,  279,  135,
			   26,  207,  230,  314,  139,  141,  142,  142,  223,  142,
			   18,  321,  225,  230,  144,  144,  313,  144,   17,  142,
			  207,  136,   16,   13,  138,  137,  141,  144,  146,  146,
			  142,  146,  314,  139,  140,  140,  140,  142,  144,  173,
			  321,  146,  175,  169,  230,  144,  223,  175,  175,  207,
			  225,  142,  146,  140,  142,    0,  323,  140,  173,  144,

			  140,  169,  169,  325,    0,  181,  142,  140,  146,  173,
			  140,  175,  140,    0,  144,  223,  175,  175,    0,  225,
			    0,  203,  140,  142,  181,  323,  140,  173,    0,  140,
			  169,  169,  325,  147,  147,  181,  147,  146,  173,  140,
			  203,  140,  143,  143,  145,  143,  147,  145,  145,  145,
			  145,  145,  145,  181,  203,  143,  326,  147,  143,  143,
			  143,  143,  143,  143,  181,  147,  143,  327,  147,  203,
			  328,  148,  148,    0,  148,    0,  145,  143,  333,  338,
			  143,  145,    0,  203,  148,  326,  143,  149,  149,    0,
			  149,  339,    0,  211,  147,  148,  327,  147,    0,  328,

			  149,  150,  150,    0,  150,  318,  143,  333,  338,  143,
			  145,  149,  211,    0,  150,  143,  340,  148,  151,  151,
			  339,  151,    0,  149,  318,  150,    0,  149,    0,    0,
			  211,  151,  187,  150,  152,  152,  341,  152,  829,  829,
			  829,  211,  151,  155,  155,  340,  148,  152,  155,  155,
			  345,  187,  149,  318,  218,  177,  149,  155,  152,  211,
			  187,  151,  150,  166,  166,  341,  166,  166,  166,  166,
			  166,  166,  177,  180,  177,  349,  188,  177,  177,  345,
			  187,  196,  166,  191,  152,    0,  193,    0,  350,  187,
			  151,  353,  180,  188,  155,  188,  188,  180,  196,  355,

			  196,  177,  191,  177,  349,  193,  177,  177,  220,  155,
			    0,  166,  221,  152,  160,  191,  222,  350,  193,    0,
			  353,  180,  188,  160,  188,  188,  180,  196,  355,  196,
			    0,  191,    0,  160,  193,  197,  218,  218,  218,  218,
			  218,    0,  381,  381,  191,  381,    0,  193,  263,  263,
			  263,  263,  263,  197,  197,    0,    0,    0,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  199,  197,  197,  206,  209,  320,  220,  220,  220,
			  329,  221,  221,  221,    0,  222,  222,  222,  233,    0,

			  199,  233,  356,  206,  209,  320,  359,  206,  199,  329,
			  233,  206,    0,  242,  242,  209,  242,  252,  252,    0,
			  252,  233,  247,  247,  247,  247,  247,  247,  247,  199,
			    0,  356,  206,  209,  320,  359,  206,  199,  329,  242,
			  206,  252,    0,    0,  209,  257,  257,  257,  257,  257,
			  257,    0,  233,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,    0,    0,  235,
			  255,  255,  255,  255,  255,  255,  235,  235,  235,  235,
			  235,  235,  256,    0,  256,  360,  255,  256,  256,  256,
			  256,  256,  256,  258,  258,  258,  258,  258,  258,  264,

			  264,  264,  264,  264,  264,    0,  235,  235,  235,  235,
			  255,    0,  346,    0,  360,  255,  260,  260,  260,  260,
			  260,  260,  288,  288,  288,  288,  288,  288,    0,  346,
			    0,  346,  260,    0,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  238,  238,    0,  238,
			  291,  291,  291,  291,  291,  291,  260,  261,  346,  261,
			  346,  260,  261,  261,  261,  261,  261,  261,  542,    0,
			  367,  542,  238,    0,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  262,  367,

			  262,    0,  262,  262,  262,  262,  262,  262,  268,  268,
			    0,  268,  269,  269,  336,  269,    0,  270,  270,    0,
			  270,  268,  542,    0,  449,  269,  271,  271,  238,  271,
			  270,    0,  268,  336,  272,  272,  269,  272,    0,  271,
			  268,  270,  262,  273,  273,  348,  273,  272,  274,  274,
			  271,  274,  269,  449,  309,  309,  273,  336,  272,  309,
			  309,  274,  336,    0,  348,  272,  271,  273,  309,  268,
			  450,    0,  274,  275,  275,  273,  275,    0,  453,  276,
			  276,  269,  276,    0,    0,  274,  275,  277,  277,    0,
			  277,  455,  276,  348,  272,  271,    0,  275,  458,  450,

			  277,  275,    0,  276,  273,  278,  278,  453,  278,  280,
			  280,  277,  280,  372,  274,    0,  459,  319,  278,  460,
			  455,    0,  280,  276,    0,  281,  281,  458,  281,  278,
			  275,  277,  324,  280,  282,  282,  319,  282,  281,    0,
			  283,  283,    0,  283,  319,  459,  280,  282,  460,  281,
			  324,  324,  276,  283,  284,  284,    0,  284,  282,    0,
			  277,  278,  281,    0,  283,  319,    0,  284,  285,  285,
			  282,  285,  465,  319,  337,  280,  283,    0,  284,  324,
			  324,  285,  286,  286,  284,  286,  337,  287,  287,    0,
			  287,  281,  285,  372,  372,  286,  417,  337,    0,  282,

			  287,  465,    0,    0,    0,  283,  286,  417,  337,    0,
			  322,  287,    0,  284,  289,  289,    0,  289,  417,  287,
			  290,  290,  290,  290,  290,  290,  337,  289,  286,  322,
			  289,  289,  289,  289,  289,  289,  417,  322,  289,  292,
			  292,  292,  292,  292,  292,  295,    0,  295,  287,  290,
			  293,  293,  293,  293,  293,  293,    0,  286,  322,  289,
			  294,  294,  294,  294,  294,  294,  322,    0,  295,    0,
			    0,  295,  297,  297,    0,  297,  352,  295,    0,  296,
			  296,  296,  296,  296,  296,  297,  298,  298,    0,  298,
			  299,  299,    0,  299,  466,  352,  297,  295,  296,  298,

			  295,    0,  468,  299,  300,  300,  295,  300,  301,  301,
			  298,  301,  302,  302,  299,  302,  297,  300,    0,  469,
			  358,  301,  470,  466,  352,  302,    0,  296,  300,  471,
			  301,  468,  301,    0,    0,  299,  302,  303,  303,  358,
			  303,    0,    0,  300,  302,  297,  304,  304,  469,  304,
			  303,  470,  330,  305,  305,  344,  305,    0,  471,  304,
			    0,  303,  306,  306,  299,  306,  305,    0,  358,    0,
			  304,  330,  300,  302,  344,  306,  330,  305,  344,  303,
			  307,  307,    0,  307,    0,  475,  306,    0,    0,  304,
			    0,  342,  316,  307,  316,  316,  316,  316,  316,  316, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  330,    0,    0,  344,  307,  330,    0,  344,  303,  305,
			  342,  310,  310,  369,  475,  342,  310,  310,  304,  310,
			  310,  310,  310,  310,  310,  310,  331,  332,  343,  317,
			  307,  317,  317,  317,  317,  317,  317,  335,  371,  342,
			    0,  331,  362,  363,  342,  331,  332,  343,  354,  373,
			  351,    0,  343,  357,    0,  438,  335,  310,  332,  307,
			  374,  362,  363,  364,  375,  366,  438,  354,  335,  351,
			  331,  362,  357,  363,  331,  332,  343,  438,  477,  357,
			  354,  343,  364,  351,  366,  335,  368,  332,    0,    0,
			  362,  363,  369,  369,  369,  438,  354,  335,  351,    0,

			  362,  357,  363,  456,  818,  368,  364,  477,  357,  354,
			    0,  364,  351,  366,    0,  818,    0,  371,  371,  371,
			  478,    0,  456,  368,  378,  378,  456,  378,  373,  373,
			  373,  461,  383,  383,  368,  383,  378,    0,    0,  374,
			  374,  374,    0,  375,  375,  375,  818,  378,    0,  478,
			  461,  456,  368,    0,    0,  456,    0,    0,  383,  386,
			  386,  386,  386,  386,  386,  386,  392,  392,  392,  392,
			  392,  392,  393,  393,  393,  393,  393,  393,  378,  461,
			  487,  488,  392,  394,  394,  394,  394,  394,  394,  395,
			  395,  395,  395,  395,  395,  396,  396,  396,  396,  396,

			  396,  467,    0,  476,    0,    0,  392,    0,    0,  487,
			  488,  392,  397,  397,  397,  397,  397,  397,  427,  548,
			  467,  427,  476,  394,  398,  476,  398,  427,  397,  398,
			  398,  398,  398,  398,  398,  399,  399,  399,  399,  399,
			  399,  400,  400,  400,  400,  400,  400,  427,  548,  467,
			  427,  476,  397,    0,  476,    0,  427,  397,  401,  401,
			  401,  401,  401,  401,  402,  402,    0,  402,  402,  402,
			  402,  402,  402,  403,  403,  403,  403,  403,  403,  404,
			  404,  404,  404,  404,  404,    0,  407,  407,  550,  407,
			  408,  408,    0,  408,  409,  409,    0,  409,  401,  407,

			  474,    0,    0,  408,    0,  451,    0,  409,  410,  410,
			  407,  410,  411,  411,  408,  411,  489,  550,  409,  474,
			    0,  410,  552,    0,  451,  411,  474,  489,  553,  407,
			  412,  412,  410,  412,    0,  451,  411,  409,  408,  413,
			  413,  482,  413,  412,  410,  489,  414,  414,  474,  414,
			  534,  552,  413,  451,  412,  474,  489,  553,  407,  414,
			  482,  534,    0,  413,  451,  559,  409,  408,  415,  415,
			  414,  415,  534,  410,  416,  416,  412,  416,  485,    0,
			  454,  415,  452,  418,  418,  413,  418,  416,    0,  482,
			  534,  414,  415,  561,  559,  562,  418,  485,  416,  454,

			  415,  452,  416,  419,  419,  412,  419,  418,  420,  420,
			  454,  420,  421,  421,  413,  421,  419,  452,    0,  418,
			  414,  420,  561,    0,  562,  421,  485,  419,  454,  415,
			  452,  416,  420,  486,  462,    0,  421,  422,  422,  454,
			  422,  423,  423,    0,  423,  464,  452,  420,  418,  419,
			  422,  421,  486,  462,  423,  424,  424,    0,  424,    0,
			    0,  422,    0,    0,  464,  423,    0,  462,  424,  426,
			  563,  426,  422,    0,    0,  493,  420,  464,  419,  424,
			  421,  486,  462,    0,  423,    0,  425,  425,  425,  425,
			  425,  425,  426,  464,  493,  426,  462,  568,  424,  563,

			    0,  422,  426,  428,    0,  428,  464,  428,  428,  428,
			  428,  428,  428,  423,  425,  429,  429,  429,  429,  429,
			  429,  426,    0,  493,  426,  472,  568,  424,  491,  428,
			  430,  430,  430,  430,  430,  430,  428,  429,  593,  593,
			  593,  593,  593,  425,  472,  430,  491,  491,  472,  429,
			  431,  431,  431,  431,  431,  431,    0,    0,  428,  430,
			  432,  432,  432,  432,  432,  432,  429,  433,  433,  433,
			  433,  433,  433,  472,  430,  491,  491,  472,  429,  435,
			  435,  570,  435,  571,  431,  434,  434,  434,  434,  434,
			  434,  508,  435,  508,  436,  436,  433,  436,  437,  437,

			    0,  437,  508,  435,    0,  574,  575,  436,    0,  463,
			  570,  437,  571,  431,  434,    0,  439,  439,  436,  439,
			  440,  440,  437,  440,  441,  441,    0,  441,  463,  439,
			    0,  508,  576,  440,  574,  575,  577,  441,  443,  443,
			  439,  443,  463,    0,  440,    0,  442,  442,  441,  442,
			  473,  443,    0,    0,    0,  441,    0,  463,    0,  442,
			    0,  576,  443,  490,    0,  577,  440,  445,  445,  473,
			  442,  463,  445,  445,  442,  445,  445,  445,  445,  445,
			  445,  445,  490,  473,  441,  442,  446,  479,  446,  446,
			  446,  446,  446,  446,  446,  440,  490,  480,  473,    0,

			    0,    0,  539,  442,    0,    0,  479,  732,  732,  732,
			  732,  490,  473,  539,  442,  445,  480,  479,  494,  494,
			  494,  494,  494,  494,  539,  490,  446,  480,  495,  495,
			  495,  495,  495,  495,  494,  479,  496,  496,  496,  496,
			  496,  496,  539,    0,    0,  480,  479,  497,  497,  497,
			  497,  497,  497,  546,    0,    0,  480,  499,  499,  499,
			  499,  499,  499,  494,  626,    0,  629,  631,  495,    0,
			  583,  632,  546,  499,  500,  500,  500,  500,  500,  500,
			  501,  501,  501,  501,  501,  501,  502,  502,  502,  502,
			  502,  502,    0,  626,  583,  629,  631,  499,  549,  583,

			  632,  546,  499,  503,  503,  503,  503,  503,  503,  504,
			  504,  504,  504,  504,  504,  511,  511,  549,  511,    0,
			  501,  506,  506,  506,  506,  506,  506,  507,  511,  507,
			  507,  507,  507,  507,  507,  512,  512,  506,  512,  511,
			    0,  513,  513,  503,  513,    0,  549,    0,  512,    0,
			  514,  514,  547,  514,  513,  515,  515,    0,  515,  512,
			    0,  633,    0,  514,    0,  513,  506,  639,  515,  516,
			  516,  547,  516,  513,  514,  517,  517,    0,  517,  515,
			    0,    0,  516,    0,  518,  518,  515,  518,  517,  514,
			  633,  512,  640,  516,    0,  547,  639,  518,  560,  517,

			  547,  641,  513,  519,  519,    0,  519,  517,  518,  521,
			  521,    0,  521,  516,    0,  515,  519,  560,  514,  517,
			    0,  640,  521,  554,  565,  522,  522,  519,  522,    0,
			  641,  523,  523,  521,  523,  554,  517,    0,  522,    0,
			  519,  521,  516,  565,  523,    0,  560,    0,  517,  522,
			  524,  524,  554,  524,    0,  523,  522,  569,  525,  525,
			    0,  525,  642,  524,  554,  526,  526,  523,  526,  519,
			  521,  525,  565,    0,  524,    0,  569,  646,  526,    0,
			  527,  527,  525,  527,    0,  522,    0,    0,    0,  526,
			  525,  642,  573,  527,    0,    0,  523,  529,  529,  529, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  529,  529,  529,    0,  527,  569,  646,    0,  526,  648,
			    0,  573,  527,  530,  530,  530,  530,  530,  530,  525,
			  531,  531,  531,  531,  531,  531,  529,  532,    0,  532,
			    0,  532,  532,  532,  532,  532,  532,  526,  648,  551,
			  573,  527,  533,  533,  533,  533,  533,  533,  531,  535,
			  535,    0,  535,  532,  536,  536,  649,  536,  551,  532,
			  532,  555,  535,    0,  533,  551,    0,  536,    0,    0,
			    0,  537,  537,  535,  537,    0,    0,  531,  536,  555,
			  555,  535,  532,    0,  537,  649,  536,  551,  532,  538,
			  538,    0,  538,  533,  551,  537,    0,  556,  543,  543,

			  557,  578,  538,  543,  543,  566,  572,  567,  555,  555,
			  535,  619,  543,  538,  537,  536,  556,  605,  579,  557,
			  578,  653,  619,  566,  566,  572,  567,  654,  556,  538,
			  567,  557,  655,  619,  605,    0,  572,  579,    0,  605,
			    0,    0,    0,  537,    0,  556,    0,    0,  557,  578,
			  653,  619,  566,  566,  572,  567,  654,  556,  538,  567,
			  557,  655,  580,  605,  580,  572,  579,  580,  580,  580,
			  580,  580,  580,  581,  581,  581,  581,  581,  581,  582,
			  582,  582,  582,  582,  582,  584,  584,  584,  584,  584,
			  584,  585,  585,  585,  585,  585,  585,  698,    0,    0,

			    0,  584,  586,  586,  586,  586,  586,  586,  628,  635,
			  638,    0,    0,  581,  587,  587,  587,  587,  587,  587,
			  588,  588,  588,  588,  588,  588,  698,  628,  635,  638,
			  584,  585,  589,  589,  589,  589,  589,  589,  590,  590,
			  590,  590,  590,  590,  591,    0,  591,    0,  699,  591,
			  591,  591,  591,  591,  591,    0,  628,  635,  638,    0,
			  588,  592,  592,  592,  592,  592,  592,  595,  595,  595,
			  595,  595,  595,  597,  597,    0,  597,  699,  598,  598,
			  702,  598,    0,  595,  630,  644,  597,  599,  599,  665,
			  599,  598,  600,  600,    0,  600,    0,  597,    0,  630,

			  599,  597,  598,  630,  644,  600,    0,  601,  601,  702,
			  601,  599,  595,  665,    0,  599,  600,    0,  665,  703,
			  601,    0,  602,  602,  600,  602,  603,  603,  630,  603,
			  597,  601,  630,  644,    0,  602,  620,    0,  621,  603,
			    0,  710,  604,  604,  599,  604,  602,  620,  703,  621,
			  603,    0,  601,  600,  716,  604,  606,  606,  620,  606,
			  621,  602,  607,  607,  720,  607,  604,    0,    0,  606,
			  710,  608,  608,  650,  608,  607,  620,    0,  621,  604,
			  606,  601,  721,  716,  608,  722,  607,  656,  609,  609,
			  602,  609,  650,  720,  607,  608,  610,  610,    0,  610,

			  606,  609,  611,  611,    0,  611,  656,    0,  604,  610,
			    0,  721,  609,    0,  722,  611,  608,    0,    0,    0,
			  610,  650,    0,  607,  615,  615,  611,  615,  610,  606,
			    0,  755,  609,  611,  612,  656,  612,  615,  612,  612,
			  612,  612,  612,  612,    0,  608,  616,  616,  615,  616,
			  617,  617,  756,  617,    0,  618,  618,  610,  618,  616,
			  755,  609,  611,  617,  636,  637,  758,  612,  618,  643,
			  616,  625,  625,  645,  617,  647,  625,  625,  759,  618,
			  617,  756,  682,  636,  637,  625,  618,  764,  643,  616,
			    0,  637,  645,    0,  647,  758,  636,    0,    0,  682,

			  643,    0,  689,  657,  682,  645,  647,  759,  651,  617,
			    0,  704,  636,  637,    0,  618,  764,  643,  616,  689,
			  637,  645,  657,  647,  689,  636,  651,  651,  682,  643,
			  704,    0,  766,  657,  645,  647,  658,  658,  658,  658,
			  658,  658,  659,  659,  659,  659,  659,  659,  689,    0,
			  750,  657,    0,    0,  750,  651,  651,  678,  678,  704,
			  678,  766,  657,  660,  660,  660,  660,  660,  660,  661,
			  678,  661,  750,    0,  661,  661,  661,  661,  661,  661,
			  662,  678,  662,  750,    0,  662,  662,  662,  662,  662,
			  662,  663,  663,  663,  663,  663,  663,  664,  664,  664,

			  664,  664,  664,  666,  666,  666,  666,  666,  666,  667,
			  667,  667,  667,  667,  667,  669,  669,  669,  669,  669,
			  669,  670,  670,  670,  670,  670,  670,    0,  706,    0,
			    0,  663,  671,  671,  671,  671,  671,  671,  673,  673,
			  673,  673,  673,  673,  767,  706,    0,  706,  676,  676,
			  674,  676,  674,    0,  673,  674,  674,  674,  674,  674,
			  674,  676,  677,  677,  794,  677,  679,  679,  700,  679,
			  711,    0,  676,  767,  706,  677,  706,    0,  673,  679,
			    0,  680,  680,  673,  680,    0,  677,  700,    0,  711,
			  679,  676,  700,  794,  680,  681,  681,    0,  681,  677,

			  683,  683,  679,  683,  712,  680,  715,    0,  681,  684,
			  684,  680,  684,  683,  685,  685,  700,  685,  711,  681,
			  676,  700,  684,  712,  683,  715,  719,  685,  677,  686,
			  686,  679,  686,  684,  687,  687,  705,  687,  685,    0,
			  680,  713,  686,  688,  688,  719,  688,  687,  690,  690,
			    0,  690,  712,  686,  715,  705,  688,    0,  687,  705,
			  713,  690,  691,  691,  685,  691,    0,  688,  692,  692,
			    0,  692,  690,  687,  719,  691,  723,  718,  713,  751,
			  690,  692,  746,  751,  705,    0,  691,    0,  705,  713,
			    0,  795,  692,  685,  797,  723,  718,  691,  801,  746,

			  692,  751,  687,  718,  746,  697,  697,  713,    0,  690,
			  697,  697,  751,  697,  697,  697,  697,  697,  697,  697,
			  795,    0,  804,  797,  723,  718,  691,  801,  746,  692,
			    0,    0,  718,  725,  725,  725,  725,  725,  725,  726,
			  726,  726,  726,  726,  726,  727,  727,  727,  727,  727,
			  727,  804,    0,  697,  728,  728,  728,  728,  728,  728,
			  729,  729,  729,  729,  729,  729,  730,    0,  730,    0,
			    0,  730,  730,  730,  730,  730,  730,    0,    0,  726,
			  733,  733,  733,  733,  733,  733,  734,  734,  734,  734,
			  735,  735,  735,  735,  735,  735,  736,  736,  736,  736,

			  736,  736,    0,  760,  761,    0,  735,  737,  737,  737,
			  737,  737,  737,    0,  739,  739,    0,  739,  740,  740,
			    0,  740,  760,  761,    0,    0,  734,  739,  752,  763,
			  735,  740,  752,  741,  741,  735,  741,  760,  739,    0,
			  742,  742,  740,  742,  739,  753,  741,  737,  763,  753,
			  752,  760,  761,  742,  740,  744,  744,  741,  744,    0,
			  821,  752,  745,  745,  742,  745,  760,  753,  744,  822,
			    0,    0,  742,  739,    0,  745,  757,  763,  753,  744,
			  741,  747,  747,  740,  747,    0,  745,  748,  748,  821,
			  748,  765,  745,    0,  747,  757,  769,  826,  822,  757, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  748,  742,    0,  749,  749,  747,  749,  828,  765,  741,
			  765,  748,  747,  840,  769,  769,  749,  754,  754,  748,
			    0,  745,  754,  754,  757,    0,  826,  749,  757,    0,
			    0,  754,    0,    0,    0,    0,  828,  765,    0,  765,
			    0,  747,  840,  769,  769,    0,    0,    0,  748,  770,
			  770,  770,  770,  770,  770,  772,  772,  772,  772,  772,
			  772,  773,  773,  773,  773,  773,  773,  774,  774,  774,
			  774,  774,  774,  775,  775,  775,  775,  775,  775,  776,
			  776,  776,  776,  776,  776,  781,  781,  845,  781,  770,
			  777,  777,  777,  777,  777,  777,    0,  856,  781,    0,

			    0,  773,  779,  779,  779,  779,  779,  779,  857,  781,
			  782,  782,    0,  782,  783,  783,  845,  783,  789,    0,
			  781,  790,  789,  782,    0,  790,  856,  783,  784,  784,
			  868,  784,  785,  785,  782,  785,    0,  857,  783,    0,
			  789,  784,  779,  790,  796,  785,  783,  787,  787,  781,
			  787,  789,  784,  799,  790,  782,  785,  791,  792,  868,
			  787,  791,  792,  796,  785,  788,  788,    0,  788,  800,
			  880,  787,  799,    0,    0,  783,  796,  802,  788,  791,
			  792,  793,  793,  805,  782,    0,  793,  793,  800,  788,
			  791,  792,  796,  785,    0,  793,  802,    0,  858,  880,

			  858,  799,  805,    0,    0,  796,    0,  825,    0,  858,
			  788,  806,  806,  806,  806,  806,  806,  800,  808,  808,
			  808,  808,  808,  808,    0,  802,  825,  809,    0,  809,
			    0,  805,  809,  809,  809,  809,  809,  809,  858,  788,
			  811,  811,    0,  811,  812,  812,    0,  812,    0,  813,
			  813,  806,  813,  811,    0,  825,    0,  812,  814,  814,
			    0,  814,  813,    0,  811,    0,  823,  809,  812,    0,
			    0,  814,  811,  813,  815,  815,    0,  815,  905,  905,
			  905,  905,  814,    0,    0,  823,    0,  815,  830,  830,
			  830,  830,  830,  830,  812,  890,  827,  890,  815,  820,

			  820,  811,  814,  823,  820,  820,  890,  820,  820,  820,
			  820,  820,  820,  820,  823,  827,  832,  832,  905,  832,
			    0,    0,  842,  812,  815,  833,  833,  827,  833,  832,
			    0,  814,  823,  834,  834,  890,  834,    0,  833,  838,
			  832,  842,  835,  835,  827,  835,  834,  820,    0,  833,
			  836,  837,  838,  815,    0,  835,  827,  834,  836,  837,
			  838,  832,  839,  839,    0,  844,  835,  839,  839,    0,
			  842,    0,  836,  837,  838,    0,  839,  846,  846,  846,
			  846,  846,  846,  835,  844,    0,    0,  836,  837,  838,
			  832,  847,  847,  847,  847,  847,  847,  850,  850,    0,

			  850,  851,  851,    0,  851,  854,    0,  852,  853,    0,
			  850,    0,  835,  844,  851,  852,  853,  898,  854,    0,
			    0,  850,  855,  855,  876,  851,  854,  855,  855,  852,
			  853,    0,    0,  851,  898,  876,  855,    0,    0,  898,
			  854,    0,    0,    0,  852,  853,  876,  850,  860,  860,
			  860,  860,  860,  861,  861,  854,  861,  862,  862,    0,
			  862,    0,  851,  898,  876,    0,  861,    0,    0,    0,
			  862,    0,    0,    0,  866,  866,  850,  861,    0,  866,
			  866,  862,  866,  866,  866,  866,  866,  866,  866,  871,
			  871,  871,  871,  871,  861,  870,  870,  870,  870,  870,

			  870,  874,  874,  874,  874,  874,  874,  875,  875,    0,
			  875,  878,  878,  877,    0,    0,  878,  878,    0,    0,
			  875,    0,  866,  861,  877,  878,  896,  896,  896,  896,
			  896,  875,    0,    0,    0,  877,    0,    0,    0,  875,
			  879,  879,  879,  879,  879,  879,  881,  881,  881,  881,
			  881,  881,    0,  877,  882,  882,  882,  882,  882,  882,
			  883,  883,    0,  883,  884,  885,  886,  886,  875,    0,
			    0,  886,  886,  883,    0,  884,  885,    0,    0,    0,
			  886,    0,    0,    0,  883,    0,  884,  885,  887,  887,
			  887,  887,  887,  887,  887,  889,  889,  889,  889,  889,

			  889,  899,  902,  903,  884,  885,  894,  894,  894,  894,
			  894,  894,  895,  895,  895,  895,  895,  895,  899,  902,
			  903,    0,    0,  899,  902,  903,  887,  900,  900,  900,
			  900,  900,  900,  901,  901,  901,  901,  901,  901,  904,
			  904,  904,  904,  904,  904,    0,    0,  899,  902,  903,
			  908,  908,  908,  908,  908,  908,  909,  909,  909,  909,
			  909,  909,  910,  910,  910,  910,  910,  910,  912,  912,
			  912,  912,  912,  912,  913,    0,  913,    0,    0,  913,
			  913,  913,  913,  913,  913,  914,  914,  914,  914,  914,
			  914,  915,  915,  915,  915,  915,  915,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  913,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,

			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  921,  921,    0,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,    0,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  922,  922,    0,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  924,  924,  924,
			    0,    0,    0,    0,    0,    0,    0,  924,  924,    0,
			  924,    0,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,    0,    0,  924,  924,

			  924,  924,  924,  924,  924,  924,  924,  925,  925,    0,
			  925,  925,    0,  925,  925,    0,    0,    0,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,    0,    0,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  926,  926,    0,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,

			  926,  926,  926,  926,  926,  926,  927,  927,    0,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,    0,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,

			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,    0,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  930,    0,  930,    0,    0,
			    0,    0,  930,  930,    0,  930,  930,    0,    0,    0,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  930,

			  930,  930,  930,  930,    0,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  930,  931,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,  932,

			  932,  932,  932,  932,  932,  932,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,  932,
			  932,  933,  933,    0,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,  934,    0,    0,    0,    0,  934,
			  934,    0,    0,    0,  934,  934,  934,  934,  934,  934,
			  934,  934,  934,  934,  934,  934,  934,  934,  934,  934,

			  934,  934,  934,  934,  934,  934,  934,  934,    0,    0,
			  934,  934,  934,  934,  934,  934,  934,  934,  934,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  935,
			  935,  935,  936,  936,  936,  936,  936,  936,  936,  936,
			  936,    0,  936,  936,  936,  936,  936,  936,  936,  936,
			  936,  936,  936,  936,  936,  936,  936,  936,  936,  936,

			  936,  936,  936,  936,  936,  936,  936,  936,  936,  936,
			  936,  936,  936,  936,  936,  936,  936,  936,  936,  936,
			  936,  936,  936,  936,  936,  937,    0,    0,    0,  937,
			  937,    0,  937,  937,  937,  937,  937,  937,  937,  937,
			  937,  937,  937,  937,  937,  937,  937,  937,  937,  937,
			  937,  937,  937,  937,  937,  937,  937,  937,    0,    0,
			  937,  937,  937,  937,  937,  937,  937,  937,  937,  938,
			  938,    0,  938,  938,    0,  938,  938,  938,    0,    0,
			  938,  938,  938,  938,  938,  938,  938,  938,  938,  938,
			  938,  938,  938,  938,  938,  938,  938,  938,  938,  938,

			  938,  938,  938,  938,    0,    0,  938,  938,  938,  938,
			  938,  938,  938,  938,  938,  939,  939,    0,  939,  939,
			    0,  939,  939,  939,    0,    0,  939,  939,  939,  939,
			  939,  939,  939,  939,  939,  939,  939,  939,  939,  939,
			  939,  939,  939,  939,  939,  939,  939,  939,  939,  939,
			    0,    0,  939,  939,  939,  939,  939,  939,  939,  939,
			  939,  940,  940,  940,  940,  940,  940,  940,  940,  940,
			  940,  940,  940,  940,  940,  940,  940,  940,  940,  940,
			  940,  940,  940,  940,  940,  940,  940,  940,  940,  940,
			  940,  940,  940,  940,  940,  940,  940,  940,  940,  940,

			  940,  940,  940,  940,  940,  940,  940,  940,  940,  940,
			  940,  940,  940,  940,  941,  941,  941,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  941,  941,
			  941,  941,  941,  941,  941,  941,  941,  941,  941,  941,
			  941,  941,  941,  941,  941,  941,  941,  941,  941,  941,
			  941,  941,  941,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  941,  942,  942,  942,  942,  942,
			  942,  942,  942,  942,  942,  942,  942,  942,  942,  942,
			  942,  942,  942,  942,  942,  942,  942,  942,  942,    0,
			    0,  942,  942,  942,  942,  942,  942,  942,  942,  942, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  943,  943,  943,  943,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  943,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  943,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  943,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  943,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  944,  944,    0,    0,    0,  944,  944,
			  944,  944,  944,  944,  944,  944,  944,  944,  944,  944,
			  944,  944,  944,  944,  944,  944,  944,  944,  944,  944,
			  944,  944,    0,    0,  944,  944,  944,  944,  944,  944,
			  944,  944,  944,  945,    0,  945,    0,    0,    0,    0,

			  945,  945,    0,  945,  945,    0,    0,    0,  945,  945,
			  945,  945,  945,  945,  945,  945,  945,  945,  945,  945,
			  945,  945,  945,  945,  945,  945,  945,  945,  945,  945,
			  945,  945,    0,    0,  945,  945,  945,  945,  945,  945,
			  945,  945,  945,  946,  946,    0,  946,  946,    0,  946,
			  946,  946,    0,    0,  946,  946,  946,  946,  946,  946,
			  946,  946,  946,  946,  946,  946,  946,  946,  946,  946,
			  946,  946,  946,  946,  946,  946,  946,  946,    0,    0,
			  946,  946,  946,  946,  946,  946,  946,  946,  946,  947,
			  947,  947,    0,    0,  947,  947,  947,  947,  947,  947,

			  947,  947,  947,    0,    0,  947,  947,  947,  947,  947,
			  947,  947,  947,  947,  947,  947,  947,  947,  947,  947,
			  947,  947,  947,  947,  947,  947,  947,  947,  947,    0,
			    0,  947,  947,  947,  947,  947,  947,  947,  947,  947,
			  948,    0,  948,    0,    0,    0,    0,  948,  948,    0,
			  948,  948,    0,    0,    0,  948,  948,  948,  948,  948,
			  948,  948,  948,  948,  948,  948,  948,  948,  948,  948,
			  948,  948,  948,  948,  948,  948,  948,  948,  948,    0,
			  948,  948,  948,  948,  948,  948,  948,  948,  948,  948,
			  949,  949,    0,  949,  949,    0,  949,  949,  949,    0,

			    0,  949,  949,  949,  949,  949,  949,  949,  949,  949,
			  949,  949,  949,  949,  949,  949,  949,  949,  949,  949,
			  949,  949,  949,  949,  949,    0,    0,  949,  949,  949,
			  949,  949,  949,  949,  949,  949,  950,  950,  950,  950,
			  950,  950,  950,  950,  950,    0,  950,  950,  950,  950,
			  950,  950,  950,  950,  950,  950,  950,  950,  950,  950,
			  950,  950,  950,  950,  950,  950,  950,  950,  950,  950,
			  950,  950,  950,  950,  950,  950,  950,  950,  950,  950,
			  950,  950,  950,  950,  950,  950,  950,  950,  950,  951,
			  951,  951,  951,  951,  951,  951,  951,  951,  951,  951,

			  951,  951,  951,  951,  951,  951,  951,  951,  951,  951,
			  951,  951,  951,    0,    0,  951,  951,  951,  951,  951,
			  951,  951,  951,  951,  952,  952,    0,    0,    0,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,    0,    0,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  953,  953,    0,  953,  953,    0,
			  953,  953,  953,    0,    0,  953,  953,  953,  953,  953,
			  953,  953,  953,  953,  953,  953,  953,  953,  953,  953,
			  953,  953,  953,  953,  953,  953,  953,  953,  953,    0,

			    0,  953,  953,  953,  953,  953,  953,  953,  953,  953,
			  954,  954,    0,  954,  954,    0,  954,  954,  954,    0,
			    0,  954,  954,  954,  954,  954,  954,  954,  954,  954,
			  954,  954,  954,  954,  954,  954,  954,  954,  954,  954,
			  954,  954,  954,  954,  954,    0,    0,  954,  954,  954,
			  954,  954,  954,  954,  954,  954,  955,  955,  955,  955,
			  955,  955,  955,  955,  955,  955,  955,  955,  955,  955,
			  955,  955,  955,  955,  955,  955,  955,  955,  955,  955,
			    0,    0,  955,  955,  955,  955,  955,  955,  955,  955,
			  955,  956,  956,    0,    0,    0,  956,  956,  956,  956,

			  956,  956,  956,  956,  956,  956,  956,  956,  956,  956,
			  956,  956,  956,  956,  956,  956,  956,  956,  956,  956,
			    0,    0,  956,  956,  956,  956,  956,  956,  956,  956,
			  956,  957,  957,    0,  957,  957,    0,  957,  957,  957,
			    0,    0,  957,  957,  957,  957,  957,  957,  957,  957,
			  957,  957,  957,  957,  957,  957,  957,  957,  957,  957,
			  957,  957,  957,  957,  957,  957,    0,    0,  957,  957,
			  957,  957,  957,  957,  957,  957,  957,  958,  958,    0,
			  958,  958,    0,  958,  958,  958,    0,    0,  958,  958,
			  958,  958,  958,  958,  958,  958,  958,  958,  958,  958,

			  958,  958,  958,  958,  958,  958,  958,  958,  958,  958,
			  958,  958,    0,    0,  958,  958,  958,  958,  958,  958,
			  958,  958,  958,  959,  959,  959,  959,  959,  959,  959,
			  959,  959,  959,  959,  959,  959,  959,  959,  959,  959,
			  959,  959,  959,  959,  959,  959,  959,    0,    0,  959,
			  959,  959,  959,  959,  959,  959,  959,  959,  960,  960,
			    0,    0,    0,  960,  960,  960,  960,  960,  960,  960,
			  960,  960,  960,  960,  960,  960,  960,  960,  960,  960,
			  960,  960,  960,  960,  960,  960,  960,    0,    0,  960,
			  960,  960,  960,  960,  960,  960,  960,  960,  961,  961,

			    0,  961,  961,    0,  961,  961,  961,    0,    0,  961,
			  961,  961,  961,  961,  961,  961,  961,  961,  961,  961,
			  961,  961,  961,  961,  961,  961,  961,  961,  961,  961,
			  961,  961,  961,    0,    0,  961,  961,  961,  961,  961,
			  961,  961,  961,  961,  962,  962,    0,  962,  962,    0,
			  962,  962,  962,    0,    0,  962,  962,  962,  962,  962,
			  962,  962,  962,  962,  962,  962,  962,  962,  962,  962,
			  962,  962,  962,  962,  962,  962,  962,  962,  962,    0,
			    0,  962,  962,  962,  962,  962,  962,  962,  962,  962,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,

			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916, yy_Dummy>>,
			1, 984, 6000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   91,   96,   78,   79,    0,    0,  189,
			    0,   69,   72, 1063, 6890,  100, 1059, 1031, 1043, 6890,
			   92,    0, 6890, 6890, 6890, 6890, 1025,   90, 1008,  100,
			  121, 6890, 6890,  996, 6890,  992,  988,  281,  285,  291,
			  122,  301,  328,  297,  333,  341,  359,  381,  454,  386,
			  392,  438,  418,  443,  499, 6890, 6890,  955,  557,  637,
			   96,   73,  359,  255,   94,  491,  115,  305,  404,  274,
			  508,  466,  348,  372,  984, 6890, 6890,  970,  162, 6890,
			  110,  346,  284,  410,  317,  440,  397, 6890,  485,  910,
			 6890,  310,  935,  638,  717, 6890,   87,  772, 6890,  168,

			  902, 6890,  895, 6890,  886,    0,  714,  883,  882,  863,
			  707, 6890,  528,  726,  812,  732,  823, 6890, 6890, 6890,
			  754,  761,    0,  845,  849,  863,  871,  888,  896,  913,
			  905,  921,  952,  938,  967,  981,  985,  989, 1003, 1011,
			 1060, 1019, 1044, 1140, 1052, 1129, 1066, 1131, 1169, 1185,
			 1199, 1216, 1232,  853,  475, 1233,  815, 6890,  355,  852,
			 1299,  840,   85,  341,  430,  549, 1248,  885,  728, 1068,
			  447,  550,  460, 1064,  493, 1050,  922, 1240,  504,  499,
			 1258, 1090,  825,  630,  619,  823,  771, 1217, 1261,  846,
			  645, 1268,  692, 1271,  740,  765, 1266, 1320,  796, 1366,

			  806,  805,  912, 1106,  892,  849, 1369, 1026,  884, 1370,
			  908, 1178, 6890,  792, 6890,  373, 6890, 6890, 1247,  563,
			 1301, 1305, 1309, 1031, 6890, 1035,  742, 6890,  121,  857,
			 1028, 6890,  791, 1396,  290, 1452,  296,  387, 1544, 6890,
			 6890,  758, 1411, 6890, 6890, 6890,  776, 1405,  774,  769,
			  762,  752, 1415,  777, 6890, 1452, 1469, 1427, 1475, 6890,
			 1498, 1544, 1584, 1330, 1481, 6890,    0,  730, 1606, 1610,
			 1615, 1624, 1632, 1641, 1646, 1671, 1677, 1685, 1703,  969,
			 1707, 1723, 1732, 1738, 1752, 1766, 1780, 1785, 1504, 1812,
			 1802, 1532, 1821, 1832, 1842, 1831, 1861, 1870, 1884, 1888,

			 1902, 1906, 1910, 1935, 1944, 1951, 1960, 1978,  716, 1644,
			 2001, 6890,  721,  993, 1001,    0, 1976, 2013, 1190, 1702,
			 1371, 1009, 1795, 1063, 1717, 1069, 1117, 1137, 1124, 1375,
			 1937, 2011, 2012, 1132,  666, 2022, 1599, 1757, 1140, 1152,
			 1178, 1198, 1976, 2013, 1940, 1218, 1497,    0, 1630, 1227,
			 1254, 2035, 1861, 1244, 2033, 1258, 1368, 2038, 1905, 1362,
			 1440,  607, 2027, 2028, 2048,    0, 2050, 1518, 2071, 2006,
			  523, 2031, 1706, 2042, 2053, 2057, 6890,  645, 2122, 6890,
			  790, 1340,  643, 2130, 6890, 6890, 2142, 6890, 6890, 6890,
			 6890, 6890, 2148, 2154, 2165, 2171, 2177, 2194, 2211, 2217,

			 2223, 2240, 2249, 2255, 2261,    0,  616, 2284, 2288, 2292,
			 2306, 2310, 2328, 2337, 2344, 2366, 2372, 1767, 2381, 2401,
			 2406, 2410, 2435, 2439, 2453, 2468, 2455, 2181, 2489, 2497,
			 2512, 2532, 2542, 2549, 2567, 2577, 2592, 2596, 2026, 2614,
			 2618, 2622, 2644, 2636,  323, 2657, 2670, 6890,    0, 1579,
			 1620, 2290, 2367, 1633, 2365, 1653, 2088,    0, 1650, 1668,
			 1672, 2116, 2419, 2594, 2430, 1738, 1864, 2186, 1864, 1871,
			 1881, 1888, 2510, 2635, 2285, 1948, 2188, 2033, 2075, 2672,
			 2682,    0, 2326,    0,    0, 2363, 2418, 2132, 2148, 2286,
			 2648, 2513,  626, 2460, 2700, 2710, 2718, 2729,  572, 2739,

			 2756, 2762, 2768, 2785, 2791,  150, 2803, 2811, 2578,  412,
			  541, 2813, 2833, 2839, 2848, 2853, 2867, 2873, 2882, 2901,
			  528, 2907, 2923, 2929, 2948, 2956, 2963, 2978, 6890, 2979,
			 2995, 3002, 3013, 3024, 2321, 3047, 3052, 3069, 3087, 2673,
			  327,  947, 1566, 3088,    0,  480, 2738, 2837, 2185, 2783,
			 2247, 3024, 2289, 2282, 2889, 3046, 3082, 3085,    0, 2326,
			 2883, 2359, 2362, 2432,    0, 2909, 3090, 3092, 2463, 2942,
			 2536, 2549, 3091, 2977, 2571, 2572, 2587, 2594, 3086, 3103,
			 3149, 3155, 3161, 2736, 3167, 3173, 3184, 3196, 3202, 3214,
			 3220, 3231, 3243, 2520, 6890, 3249,    0, 3271, 3276, 3285,

			 3290, 3305, 3320, 3324, 3340, 3088, 3354, 3360, 3369, 3386,
			 3394, 3400, 3420, 6890,  479, 3422, 3444, 3448, 3453, 3082,
			 3307, 3309,  394, 6890, 6890, 3461, 2734,    0, 3193, 2736,
			 3269, 2733, 2724, 2820,    0, 3194, 3449, 3450, 3195, 2828,
			 2846, 2867, 2915, 3454, 3270, 3458, 2931, 3460, 2975, 3023,
			 3358, 3493,    0, 3076, 3095, 3099, 3372, 3488, 3518, 3524,
			 3545, 3556, 3567, 3573, 3579, 3255, 3585, 3591,  473, 3597,
			 3603, 3614, 6890, 3620, 3637,    0, 3646, 3660, 3555, 3664,
			 3679, 3693, 3453, 3698, 3707, 3712, 3727, 3732, 3741, 3473,
			 3746, 3760, 3766,  468,  453,  447,  446, 3795, 3152, 3209,

			 3653,    0, 3242, 3287, 3496, 3721, 3613,    0,    0,    0,
			 3289, 3655, 3689, 3726,    0, 3691, 3313,    0, 3762, 3711,
			 3330, 3345, 3351, 3761,  373, 3815, 3821, 3827, 3836, 3842,
			 3853,  358, 2689, 3862, 3873, 3872, 3878, 3889,  376, 3912,
			 3916, 3931, 3938, 6890, 3953, 3960, 3753, 3979, 3985, 4001,
			 3521, 3750, 3899, 3916, 4007, 3399, 3414, 3961, 3417, 3444,
			 3888, 3889,    0, 3914, 3455, 3976, 3499, 3610,    0, 3981,
			 4031,  283, 4037, 4043, 4049, 4055, 4061, 4072, 6890, 4084,
			    0, 4083, 4108, 4112, 4126, 4130, 6890, 4145, 4163, 4089,
			 4092, 4128, 4129, 4171, 3627, 3744, 4129, 3760,    0, 4138,

			 4154, 3764, 4162,    0, 3775, 4168, 4193,  258, 4200, 4214,
			    0, 4238, 4242, 4247, 4256, 4272,  446, 6890, 2099,  161,
			 4289, 3926, 3917, 4251,    0, 4192, 3951, 4281, 3955, 1220,
			 4270,  294, 4314, 4323, 4331, 4340, 4321, 4322, 4323, 4352,
			 3966,    0, 4307,    0, 4350, 4044, 4359, 4373,    0,   97,
			 4395, 4399, 4378, 4379, 4389, 4412, 4045, 4074, 4185,    0,
			 4429, 4451, 4455,  130,  128,  539, 4464,  642, 4087,    0,
			 4477, 4471, 6890,  340, 4483, 4505, 4395, 4484, 4501, 4521,
			 4136, 4528, 4536, 4558, 4535, 4536, 4556, 4570,    0, 4577,
			 4282,  126,  105, 6890, 4588, 4594, 4508, 6890, 4388, 4572,

			 4609, 4615, 4573, 4574, 4621, 4265, 6890, 6890, 4632, 4638,
			 4644, 6890, 4650, 4661, 4667, 4673, 6890, 4714, 4767, 4820,
			 4873, 4926, 4979, 5016, 5055, 5101, 5152, 5205, 5258, 5311,
			 5363, 5414, 5467, 5520, 5567, 5618, 5671, 5717, 5763, 5809,
			 5860, 5912, 5948, 5999, 6041, 6091, 6137, 6188, 6238, 6284,
			 6335, 6372, 6412, 6458, 6504, 6539, 6579, 6625, 6671, 6706,
			 6746, 6792, 6838, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  916,    1,  917,  917,  918,  918,  919,  919,  916,
			    9,  920,  920,  916,  916,  916,  916,  916,  921,  916,
			  922,  923,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  925,  916,  916,  926,  916,  916,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,  916,  916,  916,  927,  916,  916,
			  916,  927,  927,  927,  927,  927,  928,  916,  928,  929,
			  916,  930,  916,  930,  930,  916,  931,  932,  916,  916,

			  916,  916,  921,  916,  933,  933,  933,  934,  935,  916,
			  916,  916,  916,  936,  916,  916,  916,  916,  916,  916,
			  916,  924,  937,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			   48,  924,  924,  924,  924,   48,  924,  924,  924,  924,
			  924,  924,  924,  938,  939,  939,  926,  916,  916,  916,
			   59,  916,  160,  160,  160,   59,   59,   59,   59,   59,
			  160,   59,  160,   59,  160,  160,   59,   59,  160,  160,
			   59,   59,  160,   59,  160,  160,  160,   59,   59,   59,
			  160,   59,  160,   59,  160,  160,   59,   59,  160,   59,

			  160,  160,   59,   59,  160,  160,   59,   59,  160,   59,
			  160,   59,  916,  927,  916,  916,  916,  916,  927,  927,
			  927,  927,  927,  928,  916,  928,  929,  916,  929,  930,
			  930,  916,  916,  916,  916,  940,  916,  931,  932,  916,
			  916,  238,  941,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  942,  937,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  916,
			  924,  924,  924,  924,  924,  924,  924,  924,  916,  924,
			  289,  289,  289,  289,  143,  143,  143,  924,  924,  924,

			  924,  924,  924,  924,  924,  924,  924,  924,  916,  939,
			  939,  916,  916,  160,  160,  160,  916,  160,   59,   59,
			   59,  160,   59,  160,   59,  160,  160,  160,  160,   59,
			   59,   59,   59,  160,  160,   59,   59,  916,  160,  160,
			  160,  160,   59,   59,   59,  160,   59,  160,   59,  160,
			  160,   59,   59,  160,   59,  160,  160,   59,   59,  160,
			  160,  160,   59,   59,   59,  160,   59,  160,   59,  927,
			  927,  927,  927,  927,  927,  927,  916,  943,  943,  916,
			  943,  943,  943,  941,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,

			  916,  916,  916,  916,  916,  944,  937,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  916,  924,  924,
			  924,  924,  924,  924,  924,  916,  289,  143,  289,  140,
			  289,  140,  916,  289,  289,  924,  924,  924,  916,  924,
			  924,  924,  924,  924,  945,  946,  938,  916,  947,  160,
			  160,   59,   59,  160,   59,  160,   59,  160,  160,  160,
			  160,   59,   59,   59,   59,  160,  160,   59,  160,  160,
			  160,  160,   59,   59,   59,  160,   59,  160,  160,   59,
			   59,  160,   59,  160,  160,   59,   59,  160,  160,  160,
			   59,   59,  160,   59,  916,  916,  916,  916,  916,  916,

			  916,  916,  916,  916,  916,  916,  936,  916,  916,  916,
			  944,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  916,  924,  924,  924,  924,  924,  924,  924,  916,  289,
			  289,  916,  289,  532,  916,  924,  924,  924,  924,  942,
			  916,  948,  945,  949,  160,  160,   59,   59,  160,   59,
			  160,   59,  160,  160,  160,   59,   59,   59,  160,  160,
			   59,  160,  160,  160,  160,   59,   59,   59,  160,   59,
			  160,  160,   59,   59,  160,  160,  160,  160,   59,   59,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  950,  951,  924,  924,  924,

			  924,  924,  924,  924,  924,  916,  924,  924,  924,  924,
			  924,  924,  289,  916,  916,  924,  924,  924,  924,  916,
			  944,  944,  948,  916,  916,  949,  160,  160,   59,  160,
			   59,  160,  160,  160,  160,   59,   59,   59,   59,  160,
			  160,  160,  160,   59,   59,   59,  160,   59,  160,  160,
			   59,   59,  160,  160,  160,  160,   59,   59,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  952,  924,  924,  924,  924,
			  924,  924,  916,  924,  924,  924,  924,  924,  924,  916,
			  924,  924,  924,  916,  916,  944,  944,  953,  160,  160,

			   59,  160,  160,  160,   59,   59,   59,  160,  160,  160,
			  160,   59,   59,   59,  160,   59,  160,  160,   59,   59,
			  160,  160,  160,   59,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  952,  924,
			  924,  924,  924,  916,  924,  924,  916,  924,  924,  924,
			  916,  916,  951,  951,  954,  160,  160,   59,  160,  160,
			   59,   59,  160,   59,  160,   59,  160,  160,  160,   59,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  955,  924,  924,  924,  924,  924,  916,  924,  924,  916,
			  916,  952,  952,  954,  160,  160,   59,  160,  160,   59,

			   59,  160,   59,  160,  160,   59,  916,  916,  916,  916,
			  956,  924,  924,  924,  924,  924,  916,  916,  952,  952,
			  957,  160,  160,   59,  160,   59,  160,   59,  160,  916,
			  916,  956,  924,  924,  924,  924,  916,  916,  952,  958,
			  160,  160,   59,  160,   59,  160,  916,  916,  959,  916,
			  924,  924,  916,  916,  952,  958,  160,  160,  916,  960,
			  916,  924,  924,  916,  916,  952,  961,  938,  160,  160,
			  916,  916,  916,  960,  916,  924,  916,  916,  962,  938,
			  160,  916,  916,  924,  916,  916,  962,  938,  160,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,

			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,    0,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
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
			   43,   44,   45,   46,   47,   48,   49,   50,   51,   52,
			   53,   54,   55,   56,   57,   58,    1,   59,   60,   61,

			   62,   63,   64,   65,   66,   67,   65,   65,   68,   69,
			   70,   71,   72,   73,   74,   75,   76,   77,   78,   79,
			   80,   81,   65,   82,   83,   84,   85,    1,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,    1,    1,   89,   89,   89,   89,   89,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   90,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   92,   93,   93,   93,   93,   93,   93,   93,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,   10,   11,   12,   12,
			   12,   12,   12,   13,   14,    1,   15,    1,   16,    1,
			   17,   18,   19,   20,   21,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   40,    5,   41,   42,    5,   12,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   44,   45,   46,   47,   48,   49,
			   50,   51,    5,    5,   52,   53,    1,    1,    1,    1,
			    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  134,  132,    1,    2,   15,  116,   18,
			  132,   16,   17,    7,    6,   13,    5,   11,    8,  107,
			  107,   14,   12,   29,   10,   30,   20,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   85,   99,
			   99,   99,   99,   99,   22,   31,   23,    9,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,   24,   21,   25,  120,  121,  122,
			  123,  120,  120,  120,  120,  120,  133,  105,  133,  133,
			  133,  133,   71,  133,  133,   73,  133,  133,   98,    1,

			    2,   28,  116,  115,  130,  130,  130,    0,    3,   33,
			  111,   32,    0,    0,  107,    0,  107,   27,   26,   19,
			    0,   99,   94,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   40,
			   99,   93,   93,   84,   93,   93,   99,   99,   99,   99,
			   99,   99,   99,    0,    0,    0,    0,  106,    0,    0,
			  102,    0,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,   40,  102,   40,  102,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  103,  120,  122,  121,  118,  117,  119,  120,
			  120,  120,  120,    0,  105,    0,    0,  104,    0,    0,
			    0,   73,   71,    0,   70,    0,   69,    0,    0,   98,
			   96,   96,    0,   97,  130,  124,  130,  130,  130,  130,
			  130,  130,    0,    4,   34,  111,    0,    0,    0,  109,
			  111,  109,  107,    0,    0,   94,    0,    0,   99,   99,
			   39,   99,   99,   99,   99,   99,   99,   99,   99,    0,
			   99,   99,   99,   99,   99,   42,   99,   99,    0,   85,
			   86,   85,   85,   85,   92,   99,   92,   92,   92,   99,

			   99,   99,   99,   99,   99,   99,   41,   99,    0,    0,
			    0,  101,    0,  102,  102,   39,   74,   74,  102,  102,
			   39,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,    0,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,   42,   42,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,   41,   41,  102,  102,  120,
			  120,  120,  120,  120,  120,  120,  104,    0,    0,   72,
			   70,   69,   73,    0,  128,  131,  131,  129,  125,  126,
			  127,   95,  111,    0,  111,    0,    0,  111,    0,    0,

			    0,  110,  107,    0,    0,    0,  100,   99,   99,   99,
			   99,   38,   99,   99,   99,   99,   99,    0,   99,   99,
			   99,   99,   99,   99,   99,    0,   99,   84,   99,   99,
			   99,   99,    0,   84,   84,   84,   63,   37,    0,   44,
			   99,   99,   99,   99,   68,    0,    0,   67,   64,  102,
			  102,  102,  102,  102,  102,  102,  102,   38,  102,  102,
			  102,   38,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,   63,   63,   37,   44,   37,   44,  102,  102,  102,
			  102,  102,  102,  102,  111,  111,    0,    0,  108,  111,

			    0,  110,    0,  110,    0,    0,    0,  107,   81,    0,
			    0,   60,   99,   99,   99,   99,   99,   99,   45,   99,
			    0,   99,   99,   99,   36,   99,   99,   99,   86,   86,
			   85,    0,   99,   99,    0,   99,   99,   99,   99,    0,
			   68,   68,    0,    0,   60,  102,   60,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,   45,  102,
			   45,  102,  102,  102,   36,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			    0,  111,    0,  114,  111,  110,    0,    0,  110,    0,
			    0,  109,    0,    0,   81,    0,    0,   99,   61,   99,

			   99,   99,   99,   47,   99,    0,   99,   99,   99,   99,
			   99,   99,   99,   84,    0,   53,   99,   99,   99,    0,
			    0,    0,    0,   66,   65,    0,  102,   61,   61,  102,
			  102,  102,  102,  102,   47,  102,  102,  102,   47,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,   53,  102,  102,  102,   53,  102,    0,  111,
			    0,    0,    0,  110,    0,  114,  110,    0,   83,    0,
			    0,    0,  112,  114,  112,    0,   99,   99,   59,   99,
			   99,   46,    0,   43,   58,   99,   35,   99,   51,    0,
			   99,   99,   99,    0,    0,    0,    0,    0,  102,  102,

			  102,   59,  102,  102,   59,  102,  102,   46,   43,   58,
			  102,   43,   58,  102,   35,   35,  102,   51,  102,   51,
			  102,  102,  102,  102,  114,    0,  114,    0,  110,    0,
			    0,  113,    0,    0,   80,  114,    0,  113,    0,   99,
			   99,   99,   99,   89,   54,   99,    0,   99,   99,   55,
			    0,    0,    0,    0,    0,  102,  102,  102,  102,  102,
			  102,  102,   54,   54,  102,  102,  102,  102,   55,  102,
			  114,  113,    0,  113,    0,    0,    0,    0,   80,  113,
			    0,   99,   99,   99,   48,   99,   88,   52,   99,    0,
			    0,    0,    0,    0,  102,  102,  102,  102,   48,  102,

			   48,  102,  102,   52,  102,   52,  113,   82,    0,   80,
			    0,   99,   99,   62,   99,   99,   87,   87,   87,   87,
			    0,  102,  102,  102,   62,   62,  102,  102,  102,    0,
			    0,    0,   99,   50,   49,   99,    0,    0,    0,    0,
			  102,   50,   50,   49,   49,  102,    0,    0,    0,    0,
			   99,   99,    0,    0,    0,    0,  102,  102,   79,    0,
			    0,   99,   56,    0,    0,    0,    0,    0,  102,   56,
			    0,    0,   79,    0,   75,   99,    0,    0,    0,    0,
			  102,    0,    0,   57,    0,    0,    0,    0,   57,    0,
			   78,    0,    0,   76,    0,    0,    0,   78,    0,    0,

			    0,    0,    0,    0,    0,   77,   90,   91,    0,    0,
			    0,   77,    0,   77,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 6890
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 916
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 917
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 133
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 134
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
	IN_REGEXP1: INTEGER is 2
	IN_REGEXP2: INTEGER is 3
	IN_TERM_CONSTRAINT: INTEGER is 4
	IN_C_DOMAIN_TYPE: INTEGER is 5
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

feature -- Initialization

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

	c_domain_type: C_DOMAIN_TYPE

	tid: INTEGER

invariant
	in_buffer_not_void: in_buffer /= Void

end
