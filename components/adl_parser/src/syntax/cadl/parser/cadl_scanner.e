indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"

	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
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

creation

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
if yy_act <= 63 then
if yy_act <= 32 then
if yy_act <= 16 then
if yy_act <= 8 then
if yy_act <= 4 then
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
if yy_act = 3 then
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
-- Ignore comments
else
--|#line 87 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 87")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Minus_code
else
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Star_code
else
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Caret_code
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Dot_code
else
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Comma_code
else
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Exclamation_code
else
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
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
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := Right_parenthesis_code
else
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := SYM_DT_UNKNOWN
else
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 22 then
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
else
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
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
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
else
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
end
else
if yy_act <= 30 then
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
else
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
else
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
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_THEN
else
--|#line 140 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 140")
end
last_token := SYM_ELSE
end
else
if yy_act = 39 then
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_AND
else
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_OR
end
end
end
else
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_XOR
else
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_NOT
end
else
if yy_act = 43 then
--|#line 150 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 150")
end
last_token := SYM_IMPLIES
else
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_TRUE
end
end
else
if yy_act <= 46 then
if yy_act = 45 then
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
end
last_token := SYM_FALSE
else
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_FORALL
end
else
if yy_act = 47 then
--|#line 158 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 158")
end
last_token := SYM_EXISTS
else
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_EXISTENCE
end
end
end
end
else
if yy_act <= 56 then
if yy_act <= 52 then
if yy_act <= 50 then
if yy_act = 49 then
--|#line 164 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 164")
end
last_token := SYM_OCCURRENCES
else
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 51 then
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_ORDERED
else
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_UNORDERED
end
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_UNIQUE
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
last_token := SYM_ALLOW_ARCHETYPE
end
end
end
else
if yy_act <= 60 then
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
--|#line 188 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 188")
end

	last_token := V_URI
	last_string_value := text

end
end
else
if yy_act <= 62 then
if yy_act = 61 then
--|#line 194 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 194")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 199 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 199")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 204 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 204")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
end
end
end
else
if yy_act <= 94 then
if yy_act <= 79 then
if yy_act <= 71 then
if yy_act <= 67 then
if yy_act <= 65 then
if yy_act = 64 then
--|#line 220 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 220")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 228 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 228")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
else
if yy_act = 66 then
--|#line 235 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 235")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 241 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 241")
end

				do_nothing
			
end
end
else
if yy_act <= 69 then
if yy_act = 68 then
--|#line 245 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 245")
end

				if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
					last_token := ERR_TERM_CODE_CONSTRAINT
				else
					in_buffer.append(text_substring(1, text_count-1))
					str_ := STRING_.make (in_buffer.count)
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
--|#line 266 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 266")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 70 then
--|#line 273 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 273")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 274 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 274")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 75 then
if yy_act <= 73 then
if yy_act = 72 then
--|#line 275 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 275")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 282 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 282")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 283 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 283")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 290 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 291 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 291")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 298 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 298")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 78 then
--|#line 299 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 299")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 306 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 306")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
end
end
end
else
if yy_act <= 87 then
if yy_act <= 83 then
if yy_act <= 81 then
if yy_act = 80 then
--|#line 318 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 318")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 328 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 328")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 82 then
--|#line 333 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 333")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 343 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 343")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 349 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 349")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 359 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 359")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 86 then
--|#line 360 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 360")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 372 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 372")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act = 88 then
--|#line 378 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 378")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 382 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 382")
end
 -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of dADL
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_lineno := in_lineno + str_.occurrences('%N')

				-- perform any upgrades to embedded dADL object syntax here by substitution
				convert_c_dv_names(str_)

				dadl_parser.execute(str_, source_start_line)
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
					dadl_parser_error := dadl_parser.error_text
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
end
else
if yy_act = 90 then
--|#line 423 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 423")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 429 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 429")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 434 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 434")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 439 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 439")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
--|#line 445 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 445")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
end
end
end
else
if yy_act <= 110 then
if yy_act <= 102 then
if yy_act <= 98 then
if yy_act <= 96 then
if yy_act = 95 then
--|#line 451 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 451")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 458 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 458")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
end
else
if yy_act = 97 then
--|#line 462 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 462")
end
 		-- match final segment
				in_buffer.append_string (text)
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
 			
else
--|#line 473 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 473")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
end
else
if yy_act <= 100 then
if yy_act = 99 then
--|#line 480 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 480")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 485 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 485")
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
else
if yy_act = 101 then
	yy_end := yy_end - 1
--|#line 500 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 500")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 501 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 501")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 106 then
if yy_act <= 104 then
if yy_act = 103 then
--|#line 502 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 502")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 506 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 506")
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
if yy_act = 105 then
--|#line 507 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 507")
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
--|#line 508 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 508")
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
if yy_act <= 108 then
if yy_act = 107 then
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 533 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 533")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
if yy_act = 109 then
--|#line 541 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 541")
end
in_buffer.append_character ('\')
else
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
end
in_buffer.append_character ('"')
end
end
end
end
else
if yy_act <= 118 then
if yy_act <= 114 then
if yy_act <= 112 then
if yy_act = 111 then
--|#line 545 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 545")
end

				in_buffer.append_string (text)
	
else
--|#line 549 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 549")
end
in_buffer.append_string (text)
end
else
if yy_act = 113 then
--|#line 551 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 551")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
--|#line 556 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 556")
end
						-- match final end of string
				last_token := V_STRING
				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 116 then
if yy_act = 115 then
--|#line 567 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 567")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 576 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 576")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 117 then
--|#line 578 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 578")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
end
else
if yy_act <= 122 then
if yy_act <= 120 then
if yy_act = 119 then
--|#line 580 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 580")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 581 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 581")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 121 then
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 124 then
if yy_act = 123 then
--|#line 585 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 585")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
;
end
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
			create an_array.make (0, 4763)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   29,
			   30,   30,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   38,   40,   41,   42,   43,   38,   44,   45,
			   46,   47,   38,   38,   38,   48,   49,   38,   50,   51,
			   38,   52,   53,   54,   55,   14,   56,   57,   58,   57,
			   59,   60,   61,   62,   57,   63,   64,   65,   57,   57,
			   57,   57,   66,   67,   57,   68,   69,   70,   71,   72,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   74,
			   83,   83,   93,   75,   74,   93,  101,   95,   75,   95,

			   95,  104,  223,  105,  105,  105,  105,  105,  107,  159,
			  108,  780,  109,  109,  109,  109,  109,  115,  115,  161,
			  115,  169,  201,  177,  179,   84,   84,  107,  193,  108,
			  162,  111,  111,  111,  111,  111,  160,  189,   76,  102,
			  117,  779,  190,   76,   94,  763,  163,   94,  170,  110,
			  178,  180,   85,   85,  224,  194,  200,  164,  200,  200,
			   95,  762,   95,   95,  191,  743,  743,  202,  110,  192,
			   77,   78,   79,   80,   81,   77,   78,   79,   80,   81,
			   86,   87,   88,   86,   87,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   89,   90,   86,   90,   90,   90,

			   90,   90,   86,   86,   86,   86,   86,   86,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   86,   86,   91,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,  115,  115,
			  729,  115,  115,  115,  195,  115,  223,  115,  115,  524,
			  115,  115,  115,  455,  115,  447,  149,  115,  115,  149,
			  115,  117,  145,  145,  150,  117,  346,  145,  145,  120,

			  117,  196,  670,  118,  117,  119,  115,  115,  123,  115,
			  117,  199,  121,  115,  115,  200,  115,  200,  200,  124,
			  125,  115,  115,  122,  115,  533,  120,  669,  224,  117,
			  118,  213,  119,  185,  165,  123,  117,  145,  209,  121,
			  129,  186,  126,  127,  117,  166,  124,  125,  128,  199,
			  122,  115,  115,  653,  115,  115,  115,  291,  115,  130,
			  187,  167,  115,  115,  110,  115,  199,  129,  188,  126,
			  127,  199,  168,  210,  117,  128,  115,  115,  117,  115,
			  131,  292,  171,  172,  291,  117,  130,  204,  173,  181,
			  115,  115,  132,  115,  199,  139,  212,  199,  615,  117,

			  211,  182,  144,  140,  558,  558,  291,  131,  292,  174,
			  175,  540,  528,  117,  143,  176,  183,  292,  107,  132,
			  115,  115,  139,  115,  206,  206,  484,  141,  184,  144,
			  140,  210,  142,  295,  297,  297,  133,  133,  133,  133,
			  133,  143,  204,  117,  296,  203,  203,  203,  214,  215,
			  134,  214,  115,  115,  141,  115,  135,  735,  211,  142,
			  484,  297,  298,  136,  299,  137,  299,  138,  205,  205,
			  205,  207,  207,  207,  305,  249,  372,  134,  242,  242,
			  242,  242,  242,  135,  248,  248,  248,  248,  248,  443,
			  306,  299,  137,  302,  138,  149,  438,  736,  149,  217,

			  438,  305,  417,  150,  244,  244,  244,  244,  244,  417,
			  405,  151,  151,  151,  151,  151,  152,  306,  237,  245,
			  237,  237,  151,  151,  151,  151,  151,  151,  151,  151,
			  153,  151,  154,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  215,  215,  245,  215,  151,  155,
			  155,  156,  155,  155,  155,  155,  155,  157,  155,  158,
			  155,  155,  155,  155,  155,  156,  155,  155,  155,  155,
			  149,  218,  215,  149,  218,  404,  219,  219,  150,  219,
			  688,  688,  688,  219,  220,  372,  151,  151,  151,  151,
			  151,  152,  305,  221,  306,  217,  358,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  307,
			  310,  308,  217,  151,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  218,  215,  310,  218,  231,
			  357,  239,  239,  239,  239,  239,  356,  219,  232,  232,
			  232,  232,  232,  355,  310,  352,  240,  221,  107,  797,
			  108,  213,  246,  246,  246,  246,  246,  247,  107,  199,
			  108,  317,  246,  246,  246,  246,  246,  311,  241,  300,
			  312,  314,  233,  240,  301,  313,  217,  226,  226,  293,

			  226,  294,  294,  294,  294,  294,  234,  313,  317,  110,
			  235,  309,  236,  259,  311,  290,  300,  312,  289,  110,
			  148,  301,  227,  287,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  115,  115,  238,  115,
			  115,  115,  237,  115,  115,  115,  317,  115,  115,  115,
			  230,  115,  319,  115,  115,   99,  115,  115,  115,  117,
			  115,   96,  213,  117,  228,  115,  115,  117,  115,  115,
			  115,  117,  115,  318,  252,  251,  117,  145,  145,  319,
			  117,  319,  115,  115,  199,  115,  255,  197,  117,  253,

			  287,  256,  117,  148,  321,  254,  115,  115,  322,  115,
			  257,  252,  251,  259,  114,  117,  115,  115,  320,  115,
			  258,  115,  115,  255,  115,  321,  253,  322,  256,  117,
			  288,  321,  254,  115,  115,  322,  115,  257,  113,  117,
			  115,  115,  112,  115,  117,  260,  325,  258,  115,  115,
			  261,  115,  323,  262,  324,  106,  117,  300,  115,  115,
			  103,  115,  301,  117,   99,  115,  115,   97,  115,  263,
			   96,  117,  260,  325,  797,  199,  264,  261,  267,  268,
			  262,  117,  269,  265,  303,  270,  326,  266,  117,  304,
			  797,  271,  116,  797,  272,  325,  273,  115,  115,  797,

			  115,  115,  115,  264,  115,  267,  268,  797,  274,  269,
			  265,  326,  270,  326,  266,  797,  115,  115,  271,  115,
			  117,  272,  327,  273,  117,  115,  115,  134,  115,  797,
			  331,  134,  331,  116,  116,  116,  116,  116,  328,  117,
			  274,  329,  137,  797,  274,  330,  797,  279,  117,  280,
			  206,  206,  115,  115,  134,  115,  284,  331,  134,  334,
			  274,  797,  115,  115,  116,  115,  199,  797,  329,  137,
			  115,  115,  330,  115,  279,  117,  280,  115,  115,  199,
			  115,  115,  115,  284,  115,  117,  275,  275,  275,  275,
			  275,  116,  335,  117,  311,  199,  281,  312,  329,  335,

			  117,  337,  330,  276,  117,  337,  277,  214,  215,  286,
			  214,  282,  278,  209,  406,  283,  212,  215,  215,  335,
			  215,  315,  285,  281,  316,  332,  336,  797,  337,  333,
			  276,  199,  338,  277,  199,  406,  286,  797,  282,  278,
			  797,  406,  283,  339,  340,  341,  342,  343,  210,  285,
			  797,  210,  408,  203,  203,  203,  221,  221,  217,  221,
			  218,  215,  407,  218,  370,  370,  370,  370,  217,  203,
			  203,  203,  219,  350,  444,  211,  350,  408,  211,  408,
			  797,  797,  221,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,

			  151,  151,  151,  151,  409,  344,  344,  344,  345,  345,
			  345,  217,  218,  215,  797,  218,  351,  351,  797,  351,
			  485,  485,  797,  486,  219,  353,  354,  354,  354,  354,
			  354,  360,  797,  360,  221,  410,  361,  361,  361,  361,
			  361,  227,  362,  362,  362,  362,  362,  363,  363,  363,
			  363,  363,  367,  797,  367,  797,  797,  368,  368,  368,
			  368,  368,  410,  217,  347,  348,  349,  347,  348,  347,
			  347,  347,  347,  347,  347,  347,  347,  219,  220,  220,
			  347,  220,  220,  220,  220,  220,  347,  350,  347,  347,
			  347,  347,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  347,  347,  217,  347,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  226,  226,  797,  226,  371,  371,  371,  371,
			  371,  221,  221,  797,  221,  107,  797,  108,  797,  369,
			  369,  369,  369,  369,  797,  485,  485,  227,  485,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,

			  228,  359,  359,  359,  359,  359,  110,  364,  364,  364,
			  364,  364,  115,  115,  411,  115,  240,  115,  115,  797,
			  115,  412,  365,  115,  115,  410,  115,  797,  797,  228,
			  411,  115,  115,  797,  115,  117,  115,  115,  241,  115,
			  117,  411,  797,  240,  366,  797,  117,  412,  412,  365,
			  373,  797,  413,  374,  117,  115,  115,  414,  115,  117,
			  115,  115,  375,  115,  115,  115,  380,  115,  416,  115,
			  115,  376,  115,  416,  415,  199,  380,  373,  117,  797,
			  374,  797,  797,  117,  419,  797,  380,  117,  797,  375,
			  115,  115,  117,  115,  420,  416,  421,  377,  376,  422,

			  418,  797,  378,  380,  381,  115,  115,  797,  115,  115,
			  115,  419,  115,  117,  419,  115,  115,  379,  115,  115,
			  115,  420,  115,  421,  377,  382,  422,  420,  117,  378,
			  797,  381,  117,  115,  115,  797,  115,  421,  117,  383,
			  426,  423,  117,  384,  385,  115,  115,  426,  115,  203,
			  203,  203,  382,  797,  424,  797,  117,  116,  116,  116,
			  116,  116,  115,  115,  425,  115,  383,  426,  117,  797,
			  384,  385,  115,  115,  427,  115,  387,  386,  388,  388,
			  388,  388,  388,  115,  115,  117,  115,  797,  390,  390,
			  390,  390,  390,  115,  115,  117,  115,  115,  115,  394,

			  115,  428,  395,  387,  386,  389,  117,  797,  396,  391,
			  391,  391,  391,  391,  115,  115,  117,  115,  797,  797,
			  117,  797,  115,  115,  797,  115,  394,  797,  428,  395,
			  392,  392,  392,  392,  392,  396,  389,  117,  393,  393,
			  393,  393,  393,  429,  428,  117,  116,  116,  116,  116,
			  116,  115,  115,  797,  115,  115,  115,  389,  115,  115,
			  115,  429,  115,  116,  432,  389,  115,  115,  797,  115,
			  429,  430,  115,  115,  117,  115,  115,  115,  117,  115,
			  398,  199,  117,  115,  115,  797,  115,  290,  431,  117,
			  116,  432,  397,  278,  433,  117,  199,  399,  380,  117,

			  115,  115,  797,  115,  115,  115,  117,  115,  380,  199,
			  432,  433,  400,  436,  437,  436,  199,  401,  380,  397,
			  278,  433,  797,  117,  399,  437,  293,  117,  293,  293,
			  293,  293,  293,  441,  441,  380,  402,  434,  435,  400,
			  436,  437,  439,  293,  401,  294,  294,  294,  294,  294,
			  797,  403,  440,  797,  488,  205,  205,  205,  797,  797,
			  441,  442,  488,  797,  348,  349,  797,  348,  797,  797,
			  207,  207,  207,  797,  215,  215,  219,  215,  403,  351,
			  351,  488,  351,  203,  203,  203,  350,  797,  797,  489,
			  203,  203,  203,  353,  354,  354,  354,  354,  354,  445,

			  445,  445,  445,  445,  797,  361,  361,  361,  361,  361,
			  490,  490,  492,  493,  240,  217,  446,  446,  446,  446,
			  446,  599,  599,  599,  599,  217,  448,  448,  448,  448,
			  448,  449,  449,  449,  449,  449,  241,  490,  491,  492,
			  493,  240,  450,  450,  450,  450,  450,  453,  453,  453,
			  453,  453,  797,  447,  451,  797,  451,  365,  797,  452,
			  452,  452,  452,  452,  368,  368,  368,  368,  368,  454,
			  454,  454,  454,  454,  459,  459,  459,  459,  459,  366,
			  797,  797,  456,  457,  365,  458,  458,  458,  458,  458,
			  460,  460,  460,  460,  460,  115,  115,  797,  115,  115,

			  115,  797,  115,  492,  115,  115,  455,  115,  115,  115,
			  493,  115,  115,  115,  797,  115,  115,  115,  117,  115,
			  797,  797,  117,  115,  115,  797,  115,  117,  467,  797,
			  494,  117,  797,  462,  797,  117,  496,  495,  467,  117,
			  461,  115,  115,  497,  115,  496,  117,  465,  467,  797,
			  466,  499,  463,  115,  115,  464,  115,  797,  115,  115,
			  462,  115,  500,  496,  117,  467,  797,  461,  115,  115,
			  497,  115,  498,  501,  465,  468,  117,  466,  499,  463,
			  502,  117,  464,  115,  115,  499,  115,  115,  115,  500,
			  115,  117,  500,  479,  797,  470,  501,  469,  115,  115,

			  501,  115,  468,  479,  506,  471,  117,  502,  797,  797,
			  117,  116,  503,  479,  116,  506,  472,  508,  509,  504,
			  116,  117,  470,  505,  469,  797,  115,  115,  473,  115,
			  479,  506,  471,  388,  388,  388,  388,  388,  116,  474,
			  797,  116,  507,  472,  508,  509,  797,  116,  797,  117,
			  269,  115,  115,  475,  115,  473,  508,  797,  797,  271,
			  797,  390,  390,  390,  390,  390,  474,  391,  391,  391,
			  391,  391,  115,  115,  117,  115,  797,  269,  116,  797,
			  475,  268,  509,  510,  115,  115,  271,  115,  392,  392,
			  392,  392,  392,  797,  512,  117,  272,  393,  393,  393,

			  393,  393,  476,  115,  115,  116,  115,  117,  268,  511,
			  477,  477,  477,  477,  477,  513,  478,  478,  478,  478,
			  478,  512,  797,  272,  116,  512,  117,  797,  116,  476,
			  116,  115,  115,  513,  115,  115,  115,  559,  115,  514,
			  115,  115,  513,  115,  797,  485,  485,  480,  486,  515,
			  797,  116,  516,  484,  117,  116,  797,  116,  117,  797,
			  517,  481,  482,  117,  559,  797,  514,  445,  445,  445,
			  445,  445,  483,  797,  480,  797,  515,  519,  519,  519,
			  519,  519,  518,  520,  520,  520,  520,  520,  481,  482,
			  521,  521,  521,  521,  521,  797,  556,  797,  797,  483,

			  522,  522,  522,  522,  522,  797,  797,  797,  797,  518,
			  797,  797,  797,  559,  447,  365,  452,  452,  452,  452,
			  452,  523,  523,  523,  523,  523,  525,  525,  525,  525,
			  525,  526,  526,  526,  526,  526,  797,  366,  115,  115,
			  560,  115,  365,  527,  527,  527,  527,  527,  522,  522,
			  522,  522,  522,  797,  530,  797,  530,  556,  524,  115,
			  115,  117,  115,  529,  531,  797,  797,  457,  455,  458,
			  458,  458,  458,  458,  561,  535,  115,  115,  561,  115,
			  115,  115,  117,  115,  115,  115,  797,  115,  797,  797,
			  529,  532,  115,  115,  797,  115,  797,  115,  115,  117,

			  115,  561,  535,  117,  567,  564,  536,  117,  797,  797,
			  797,  537,  534,  115,  115,  117,  115,  797,  115,  115,
			  117,  115,  538,  115,  115,  797,  115,  539,  541,  568,
			  797,  567,  569,  536,  115,  115,  117,  115,  537,  115,
			  115,  117,  115,  542,  115,  115,  117,  115,  797,  538,
			  115,  115,  543,  115,  539,  541,  568,  117,  797,  569,
			  797,  797,  117,  797,  797,  544,  797,  117,  797,  797,
			  542,  115,  115,  117,  115,  546,  570,  568,  569,  543,
			  545,  547,  547,  547,  547,  547,  477,  477,  477,  477,
			  477,  548,  544,  389,  117,  116,  115,  115,  797,  115,

			  116,  548,  546,  570,  571,  572,  395,  545,  797,  552,
			  797,  548,  396,  570,  478,  478,  478,  478,  478,  117,
			  115,  115,  116,  115,  797,  553,  574,  116,  548,  115,
			  115,  574,  115,  395,  116,  553,  552,  551,  562,  396,
			  573,  797,  797,  117,  555,  554,  562,  576,  577,  563,
			  576,  549,  117,  574,  577,  580,  581,  563,  575,  582,
			  550,  116,  553,  583,  551,  562,  580,  581,  587,  587,
			  587,  587,  587,  565,  576,  577,  563,  578,  549,  797,
			  797,  579,  580,  581,  566,  621,  582,  550,  622,  589,
			  583,  797,  557,  584,  585,  586,  797,  586,  797,  797,

			  587,  587,  587,  587,  587,  447,  588,  588,  588,  588,
			  588,  241,  621,  797,  797,  622,  589,  522,  522,  522,
			  522,  522,  797,  591,  591,  591,  591,  591,  690,  691,
			  690,  622,  590,  592,  592,  592,  592,  592,  593,  593,
			  593,  593,  593,  594,  594,  594,  594,  594,  595,  595,
			  595,  595,  595,  596,  596,  596,  596,  596,  623,  590,
			  524,  597,  797,  597,  797,  692,  594,  594,  594,  594,
			  594,  598,  598,  598,  598,  598,  115,  115,  624,  115,
			  455,  601,  601,  601,  601,  601,  115,  115,  797,  115,
			  608,  115,  115,  797,  115,  797,  602,  115,  115,  117,

			  115,  115,  115,  603,  115,  624,  608,  797,  625,  117,
			  608,  797,  797,  604,  117,  115,  115,  797,  115,  624,
			  117,  797,  605,  602,  117,  115,  115,  797,  115,  797,
			  603,  797,  797,  608,  606,  625,  115,  115,  117,  115,
			  604,  115,  115,  797,  115,  797,  626,  797,  117,  605,
			  607,  115,  115,  797,  115,  115,  115,  625,  115,  117,
			  619,  606,  115,  115,  117,  115,  797,  609,  115,  115,
			  619,  115,  610,  628,  117,  797,  797,  607,  117,  611,
			  620,  797,  797,  797,  627,  117,  613,  115,  115,  629,
			  115,  117,  614,  612,  609,  115,  115,  619,  115,  610,

			  628,  547,  547,  547,  547,  547,  611,  630,  115,  115,
			  117,  115,  620,  613,  631,  629,  629,  630,  117,  614,
			  612,  116,  620,  631,  617,  635,  635,  271,  616,  637,
			  638,  117,  620,  637,  630,  638,  641,  642,  618,  643,
			  641,  631,  632,  797,  633,  797,  797,  797,  116,  620,
			  634,  617,  635,  636,  271,  616,  637,  638,  797,  671,
			  639,  797,  640,  641,  642,  618,  643,  644,  587,  587,
			  587,  587,  587,  587,  587,  587,  587,  587,  645,  645,
			  645,  645,  645,  646,  797,  646,  671,  797,  647,  647,
			  647,  647,  647,  648,  651,  648,  797,  797,  649,  649,

			  649,  649,  649,  649,  649,  649,  649,  649,  650,  650,
			  650,  650,  650,  797,  115,  115,  366,  115,  797,  797,
			  797,  651,  594,  594,  594,  594,  594,  652,  652,  652,
			  652,  652,  594,  594,  594,  594,  594,  117,  797,  797,
			  524,  654,  654,  654,  654,  654,  655,  655,  655,  655,
			  655,  656,  656,  656,  656,  656,  657,  662,  657,  672,
			  797,  658,  658,  658,  658,  658,  651,  115,  115,  797,
			  115,  115,  115,  662,  115,  115,  115,  662,  115,  115,
			  115,  797,  115,  797,  115,  115,  672,  115,  366,  797,
			  117,  797,  797,  651,  117,  665,  115,  115,  117,  115,

			  662,  672,  117,  674,  661,  797,  660,  117,  659,  115,
			  115,  665,  115,  115,  115,  665,  115,  115,  115,  117,
			  115,  115,  115,  797,  115,  674,  115,  115,  673,  115,
			  674,  661,  117,  660,  676,  659,  117,  676,  665,  678,
			  117,  678,  115,  115,  117,  115,  680,  115,  115,  117,
			  115,  797,  675,  681,  664,  682,  663,  666,  680,  797,
			  797,  676,  797,  797,  677,  117,  678,  797,  679,  797,
			  117,  797,  797,  680,  703,  667,  704,  704,  668,  797,
			  681,  664,  682,  663,  666,  683,  647,  647,  647,  647,
			  647,  684,  684,  684,  684,  684,  649,  649,  649,  649,

			  649,  703,  667,  704,  705,  668,  649,  649,  649,  649,
			  649,  685,  685,  685,  685,  685,  686,  797,  686,  797,
			  797,  687,  687,  687,  687,  687,  797,  797,  447,  689,
			  689,  689,  689,  689,  593,  593,  593,  593,  593,  658,
			  658,  658,  658,  658,  693,  693,  693,  693,  693,  651,
			  115,  115,  797,  115,  115,  115,  706,  115,  698,  115,
			  115,  797,  115,  115,  115,  797,  115,  797,  706,  115,
			  115,  366,  115,  117,  698,  797,  651,  117,  698,  694,
			  797,  455,  117,  706,  115,  115,  117,  115,  695,  797,
			  696,  708,  117,  115,  115,  707,  115,  797,  697,  115, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  115,  698,  115,  708,  710,  711,  694,  117,  701,  702,
			  710,  723,  701,  702,  699,  695,  117,  696,  708,  797,
			  724,  724,  117,  726,  700,  697,  797,  797,  701,  702,
			  709,  710,  711,  766,  766,  766,  766,  712,  723,  701,
			  702,  699,  645,  645,  645,  645,  645,  724,  725,  797,
			  726,  700,  687,  687,  687,  687,  687,  713,  713,  713,
			  713,  713,  714,  714,  714,  714,  714,  532,  532,  532,
			  532,  532,  715,  715,  715,  715,  715,  797,  797,  447,
			  716,  716,  716,  716,  716,  652,  652,  652,  652,  652,
			  115,  115,  797,  115,  524,  115,  115,  797,  115,  721,

			  726,  115,  115,  721,  115,  115,  115,  728,  115,  115,
			  115,  797,  115,  117,  115,  115,  797,  115,  117,  721,
			  737,  722,  455,  717,  117,  722,  797,  727,  117,  797,
			  721,  797,  117,  797,  728,  797,  719,  117,  718,  797,
			  738,  722,  685,  685,  685,  685,  685,  737,  797,  797,
			  717,  738,  722,  115,  115,  740,  115,  720,  730,  730,
			  730,  730,  730,  719,  690,  718,  690,  738,  740,  716,
			  716,  716,  716,  716,  115,  115,  117,  115,  739,  524,
			  115,  115,  740,  115,  720,  742,  115,  115,  749,  115,
			  744,  744,  744,  744,  744,  741,  797,  117,  750,  797,

			  732,  692,  756,  117,  797,  731,  797,  115,  115,  117,
			  115,  797,  742,  115,  115,  749,  115,  115,  115,  797,
			  115,  747,  733,  115,  115,  750,  115,  732,  747,  756,
			  117,  748,  731,  734,  115,  115,  117,  115,  748,  797,
			  117,  747,  782,  782,  782,  782,  117,  797,  797,  733,
			  745,  748,  797,  115,  115,  747,  115,  117,  797,  797,
			  734,  757,  746,  797,  797,  748,  751,  751,  751,  751,
			  751,  692,  692,  692,  692,  692,  117,  745,  754,  755,
			  758,  752,  758,  764,  753,  754,  755,  797,  757,  746,
			  759,  115,  115,  797,  115,  797,  768,  797,  754,  755,

			  115,  115,  770,  115,  115,  115,  768,  115,  752,  797,
			  764,  753,  754,  755,  117,  797,  768,  760,  765,  765,
			  765,  765,  765,  117,  769,  797,  797,  117,  797,  770,
			  761,  797,  773,  768,  769,  767,  771,  771,  771,  771,
			  771,  797,  773,  797,  769,  772,  772,  772,  772,  772,
			  115,  115,  773,  115,  774,  797,  776,  761,  776,  797,
			  797,  769,  767,  797,  774,  797,  777,  797,  797,  773,
			  790,  791,  790,  117,  774,  775,  775,  775,  775,  775,
			  760,  760,  760,  760,  760,  781,  781,  781,  781,  781,
			  783,  774,  784,  778,  785,  785,  785,  785,  785,  786,

			  786,  786,  786,  786,  787,  788,  783,  792,  784,  797,
			  783,  797,  784,  789,  789,  789,  789,  789,  797,  797,
			  787,  788,  797,  797,  787,  788,  778,  778,  778,  778,
			  778,  797,  797,  783,  797,  784,  793,  793,  793,  793,
			  793,  794,  794,  794,  794,  794,  797,  787,  788,  795,
			  795,  795,  795,  795,  790,  797,  790,  797,  797,  794,
			  794,  794,  794,  794,  796,  796,  796,  796,  796,  792,
			  792,  792,  792,  792,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  792,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   98,   98,  797,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  797,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,  100,  100,  797,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  116,  116,  116,  797,  797,  797,
			  797,  797,  797,  797,  116,  116,  797,  116,  797,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,

			  116,  116,  116,  116,  116,  116,  116,  116,  797,  797,
			  116,  116,  116,  116,  116,  116,  116,  116,  146,  146,
			  797,  146,  146,  797,  146,  146,  797,  797,  797,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  797,  797,
			  146,  146,  146,  146,  146,  146,  146,  146,  147,  147,
			  797,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,

			  147,  147,  147,  147,  147,  198,  198,  797,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  797,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  211,

			  211,  211,  211,  211,  211,  211,  211,  211,  211,  797,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  216,  216,  216,  797,
			  797,  797,  797,  216,  216,  797,  216,  216,  797,  797,
			  797,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  797,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  229,  229,  797,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  797,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,

			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  250,  797,  797,  797,  250,
			  250,  797,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  797,  797,  250,  250,  250,  250,  250,
			  250,  250,  250,  145,  145,  797,  145,  145,  797,  145,
			  145,  145,  797,  797,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  797,  797,  145,  145,  145,  145,  145,

			  145,  145,  145,  228,  228,  228,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  228,  347,  347,
			  347,  347,  347,  347,  347,  797,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  797,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  487,  487,  487,  797,  797,

			  797,  797,  487,  487,  797,  487,  487,  797,  797,  797,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  797,
			  797,  487,  487,  487,  487,  487,  487,  487,  487,  405,
			  405,  405,  797,  797,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  797,  797,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  797,  797,  405,  405,  405,  405,
			  405,  405,  405,  405,  555,  555,  555,  797,  797,  797,
			  797,  555,  555,  797,  555,  555,  797,  797,  797,  555,

			  555,  555,  555,  555,  555,  555,  555,  555,  555,  555,
			  555,  555,  555,  555,  555,  555,  555,  555,  797,  555,
			  555,  555,  555,  555,  555,  555,  555,  555,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  797,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,   13,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797, yy_Dummy>>,
			1, 1764, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4763)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    5,    6,   11,    3,    4,   12,   20,   15,    4,   15,

			   15,   27,   92,   27,   27,   27,   27,   27,   29,   58,
			   29,  774,   29,   29,   29,   29,   29,   38,   38,   59,
			   38,   61,   76,   63,   64,    5,    6,   30,   68,   30,
			   59,   30,   30,   30,   30,   30,   58,   67,    3,   20,
			   38,  773,   67,    4,   11,  755,   59,   12,   61,   29,
			   63,   64,    5,    6,   92,   68,   74,   59,   74,   74,
			   95,  754,   95,   95,   67,  729,  729,   76,   30,   67,
			    3,    3,    3,    3,    3,    4,    4,    4,    4,    4,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,

			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,   37,   37,
			  714,   37,   39,   39,   69,   39,  222,   40,   40,  685,
			   40,   41,   41,  652,   41,  645,  149,   42,   42,  149,
			   42,   37,   52,   52,  149,   39,  213,   52,   52,   39,

			   40,   69,  620,   37,   41,   37,   43,   43,   41,   43,
			   42,   78,   40,   44,   44,  200,   44,  200,  200,   41,
			   42,   45,   45,   40,   45,  460,   39,  619,  222,   43,
			   37,  213,   37,   66,   60,   41,   44,   52,   82,   40,
			   44,   66,   43,   43,   45,   60,   41,   42,   43,   80,
			   40,   46,   46,  596,   46,   51,   51,  153,   51,   45,
			   66,   60,   48,   48,  460,   48,  340,   44,   66,   43,
			   43,   77,   60,   82,   46,   43,   50,   50,   51,   50,
			   46,  154,   62,   62,  153,   48,   45,   78,   62,   65,
			   49,   49,   46,   49,   79,   48,   84,   81,  548,   50,

			   82,   65,   51,   48,  489,  488,  157,   46,  154,   62,
			   62,  467,  456,   49,   50,   62,   65,  158,  449,   46,
			   47,   47,   48,   47,   80,   80,  442,   49,   65,   51,
			   48,   84,   49,  157,  159,  160,   47,   47,   47,   47,
			   47,   50,  340,   47,  158,   77,   77,   77,   87,   87,
			   47,   87,  115,  115,   49,  115,   47,  721,   84,   49,
			  441,  159,  160,   47,  161,   47,  163,   47,   79,   79,
			   79,   81,   81,   81,  165,  115,  372,   47,  107,  107,
			  107,  107,  107,   47,  110,  110,  110,  110,  110,  347,
			  166,  161,   47,  163,   47,   56,  334,  721,   56,   87,

			  331,  165,  308,   56,  108,  108,  108,  108,  108,  306,
			  290,   56,   56,   56,   56,   56,   56,  166,  237,  108,
			  237,  237,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   88,   88,  108,   88,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   57,   89,   89,   57,   89,  287,  219,  219,   57,  219,
			  653,  653,  653,   89,   89,  250,   57,   57,   57,   57,
			   57,   57,  167,   89,  168,   88,  236,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  167,
			  171,  168,   89,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   90,   90,  171,   90,  102,
			  235,  105,  105,  105,  105,  105,  234,   90,  102,  102,
			  102,  102,  102,  233,  174,  231,  105,   90,  109,  226,
			  109,  211,  109,  109,  109,  109,  109,  109,  111,  198,
			  111,  177,  111,  111,  111,  111,  111,  172,  105,  162,
			  172,  174,  102,  105,  162,  176,   90,   93,   93,  156,

			   93,  156,  156,  156,  156,  156,  102,  173,  177,  109,
			  102,  170,  102,  169,  172,  152,  162,  172,  150,  111,
			  147,  162,   93,  145,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  116,  116,  104,  116,
			  118,  118,  103,  118,  119,  119,  178,  119,  120,  120,
			  100,  120,  179,  121,  121,   98,  121,  122,  122,  116,
			  122,   96,   85,  118,   93,  123,  123,  119,  123,  124,
			  124,  120,  124,  178,  119,  118,  121,  146,  146,  179,
			  122,  180,  125,  125,   73,  125,  122,   70,  123,  120,

			  146,  122,  124,   55,  181,  121,  126,  126,  182,  126,
			  123,  119,  118,  125,   36,  125,  128,  128,  180,  128,
			  124,  127,  127,  122,  127,  183,  120,  184,  122,  126,
			  146,  181,  121,  129,  129,  182,  129,  123,   35,  128,
			  130,  130,   33,  130,  127,  126,  185,  124,  132,  132,
			  127,  132,  183,  127,  184,   28,  129,  164,  131,  131,
			   26,  131,  164,  130,   18,  134,  134,   17,  134,  128,
			   16,  132,  126,  185,   13,  342,  129,  127,  132,  133,
			  127,  131,  133,  130,  164,  133,  186,  131,  134,  164,
			    0,  133,  133,    0,  133,  187,  133,  135,  135,    0,

			  135,  137,  137,  129,  137,  132,  133,    0,  134,  133,
			  130,  188,  133,  186,  131,    0,  139,  139,  133,  139,
			  135,  133,  187,  133,  137,  142,  142,  135,  142,    0,
			  190,  137,  192,  138,  138,  138,  138,  138,  188,  139,
			  135,  189,  135,    0,  137,  189,    0,  139,  142,  139,
			  342,  342,  140,  140,  135,  140,  142,  190,  137,  192,
			  138,    0,  144,  144,  138,  144,  203,    0,  189,  135,
			  136,  136,  189,  136,  139,  140,  139,  141,  141,  204,
			  141,  143,  143,  142,  143,  144,  136,  136,  136,  136,
			  136,  138,  193,  136,  175,  205,  140,  175,  191,  194,

			  141,  195,  191,  136,  143,  196,  136,  214,  214,  144,
			  214,  141,  136,  208,  291,  141,  210,  215,  215,  193,
			  215,  175,  143,  140,  175,  191,  194,    0,  195,  191,
			  136,  206,  196,  136,  207,  295,  144,    0,  141,  136,
			    0,  291,  141,  203,  203,  203,  203,  203,  208,  143,
			  151,  210,  297,  204,  204,  204,  221,  221,  214,  221,
			  216,  216,  295,  216,  247,  247,  247,  247,  215,  205,
			  205,  205,  216,  350,  350,  208,  350,  298,  210,  297,
			    0,    0,  216,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,

			  151,  151,  151,  151,  298,  206,  206,  206,  207,  207,
			  207,  216,  218,  218,    0,  218,  227,  227,    0,  227,
			  404,  404,    0,  404,  218,  232,  232,  232,  232,  232,
			  232,  240,    0,  240,  218,  299,  240,  240,  240,  240,
			  240,  227,  241,  241,  241,  241,  241,  242,  242,  242,
			  242,  242,  245,    0,  245,    0,    0,  245,  245,  245,
			  245,  245,  299,  218,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  223,  223,    0,  223,  248,  248,  248,  248,
			  248,  444,  444,    0,  444,  246,    0,  246,    0,  246,
			  246,  246,  246,  246,    0,  485,  485,  223,  485,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  239,  239,  239,  239,  239,  246,  244,  244,  244,
			  244,  244,  251,  251,  300,  251,  239,  252,  252,    0,
			  252,  301,  244,  253,  253,  302,  253,    0,    0,  223,
			  303,  254,  254,    0,  254,  251,  255,  255,  239,  255,
			  252,  300,    0,  239,  244,    0,  253,  304,  301,  244,
			  251,    0,  302,  253,  254,  256,  256,  303,  256,  255,
			  257,  257,  254,  257,  258,  258,  259,  258,  305,  260,
			  260,  255,  260,  307,  304,  339,  259,  251,  256,    0,
			  253,    0,    0,  257,  310,    0,  259,  258,    0,  254,
			  261,  261,  260,  261,  311,  305,  312,  256,  255,  313,

			  307,    0,  257,  259,  260,  262,  262,    0,  262,  263,
			  263,  310,  263,  261,  314,  264,  264,  258,  264,  265,
			  265,  311,  265,  312,  256,  261,  313,  315,  262,  257,
			    0,  260,  263,  266,  266,    0,  266,  316,  264,  262,
			  317,  314,  265,  263,  264,  267,  267,  318,  267,  339,
			  339,  339,  261,    0,  315,    0,  266,  274,  274,  274,
			  274,  274,  268,  268,  316,  268,  262,  317,  267,    0,
			  263,  264,  269,  269,  318,  269,  267,  266,  268,  268,
			  268,  268,  268,  271,  271,  268,  271,    0,  269,  269,
			  269,  269,  269,  270,  270,  269,  270,  278,  278,  275,

			  278,  321,  275,  267,  266,  268,  271,    0,  275,  270,
			  270,  270,  270,  270,  272,  272,  270,  272,    0,    0,
			  278,    0,  273,  273,    0,  273,  275,    0,  321,  275,
			  272,  272,  272,  272,  272,  275,  270,  272,  273,  273,
			  273,  273,  273,  322,  323,  273,  276,  276,  276,  276,
			  276,  277,  277,    0,  277,  279,  279,  272,  279,  280,
			  280,  324,  280,  276,  325,  273,  281,  281,    0,  281,
			  322,  323,  282,  282,  277,  282,  283,  283,  279,  283,
			  280,  341,  280,  284,  284,    0,  284,  309,  324,  281,
			  276,  325,  279,  277,  326,  282,  343,  281,  309,  283,

			  285,  285,    0,  285,  286,  286,  284,  286,  309,  344,
			  327,  328,  282,  329,  330,  332,  345,  283,  309,  279,
			  277,  326,    0,  285,  281,  333,  293,  286,  293,  293,
			  293,  293,  293,  337,  338,  309,  284,  327,  328,  282,
			  329,  330,  332,  294,  283,  294,  294,  294,  294,  294,
			    0,  286,  333,    0,  406,  341,  341,  341,    0,    0,
			  337,  338,  407,    0,  348,  348,    0,  348,    0,    0,
			  343,  343,  343,    0,  349,  349,  348,  349,  286,  351,
			  351,  406,  351,  344,  344,  344,  348,    0,    0,  407,
			  345,  345,  345,  354,  354,  354,  354,  354,  354,  359,

			  359,  359,  359,  359,  351,  360,  360,  360,  360,  360,
			  408,  409,  411,  412,  359,  348,  361,  361,  361,  361,
			  361,  531,  531,  531,  531,  349,  362,  362,  362,  362,
			  362,  363,  363,  363,  363,  363,  359,  408,  409,  411,
			  412,  359,  364,  364,  364,  364,  364,  366,  366,  366,
			  366,  366,    0,  361,  365,    0,  365,  364,    0,  365,
			  365,  365,  365,  365,  367,  367,  367,  367,  367,  368,
			  368,  368,  368,  368,  370,  370,  370,  370,  370,  364,
			    0,    0,  369,  369,  364,  369,  369,  369,  369,  369,
			  371,  371,  371,  371,  371,  373,  373,    0,  373,  374,

			  374,    0,  374,  414,  375,  375,  368,  375,  376,  376,
			  415,  376,  377,  377,    0,  377,  378,  378,  373,  378,
			    0,    0,  374,  379,  379,    0,  379,  375,  380,    0,
			  414,  376,    0,  374,    0,  377,  416,  415,  380,  378,
			  373,  381,  381,  417,  381,  418,  379,  378,  380,    0,
			  379,  419,  376,  382,  382,  377,  382,    0,  383,  383,
			  374,  383,  420,  416,  381,  380,    0,  373,  384,  384,
			  417,  384,  418,  421,  378,  381,  382,  379,  419,  376,
			  422,  383,  377,  385,  385,  423,  385,  386,  386,  420,
			  386,  384,  424,  398,    0,  383,  425,  382,  387,  387,

			  421,  387,  381,  398,  426,  384,  385,  422,    0,    0,
			  386,  389,  423,  398,  389,  427,  385,  428,  429,  424,
			  389,  387,  383,  425,  382,    0,  396,  396,  386,  396,
			  398,  426,  384,  388,  388,  388,  388,  388,  389,  387,
			    0,  389,  427,  385,  428,  429,    0,  389,    0,  396,
			  388,  397,  397,  388,  397,  386,  430,    0,    0,  388,
			    0,  390,  390,  390,  390,  390,  387,  391,  391,  391,
			  391,  391,  392,  392,  397,  392,    0,  388,  390,    0,
			  388,  391,  431,  430,  399,  399,  388,  399,  392,  392,
			  392,  392,  392,    0,  436,  392,  391,  393,  393,  393,

			  393,  393,  392,  400,  400,  390,  400,  399,  391,  431,
			  394,  394,  394,  394,  394,  437,  395,  395,  395,  395,
			  395,  436,    0,  391,  394,  439,  400,    0,  393,  392,
			  395,  401,  401,  440,  401,  402,  402,  490,  402,  438,
			  403,  403,  437,  403,    0,  486,  486,  400,  486,  438,
			    0,  394,  439,  403,  401,  393,    0,  395,  402,    0,
			  440,  401,  402,  403,  490,    0,  438,  445,  445,  445,
			  445,  445,  402,    0,  400,    0,  438,  446,  446,  446,
			  446,  446,  445,  447,  447,  447,  447,  447,  401,  402,
			  448,  448,  448,  448,  448,    0,  486,    0,    0,  402,

			  450,  450,  450,  450,  450,    0,  555,  555,    0,  445,
			    0,    0,    0,  491,  446,  450,  451,  451,  451,  451,
			  451,  452,  452,  452,  452,  452,  453,  453,  453,  453,
			  453,  454,  454,  454,  454,  454,    0,  450,  462,  462,
			  491,  462,  450,  455,  455,  455,  455,  455,  457,  457,
			  457,  457,  457,    0,  459,    0,  459,  555,  452,  461,
			  461,  462,  461,  457,  459,    0,    0,  458,  454,  458,
			  458,  458,  458,  458,  492,  462,  463,  463,  494,  463,
			  464,  464,  461,  464,  465,  465,    0,  465,    0,    0,
			  457,  459,  466,  466,    0,  466,    0,  468,  468,  463,

			  468,  492,  462,  464,  497,  494,  463,  465,    0,    0,
			    0,  464,  461,  469,  469,  466,  469,    0,  470,  470,
			  468,  470,  464,  471,  471,    0,  471,  466,  468,  499,
			    0,  497,  500,  463,  472,  472,  469,  472,  464,  473,
			  473,  470,  473,  469,  474,  474,  471,  474,    0,  464,
			  476,  476,  470,  476,  466,  468,  499,  472,    0,  500,
			    0,    0,  473,    0,    0,  472,    0,  474,    0,    0,
			  469,  483,  483,  476,  483,  474,  501,  503,  504,  470,
			  473,  475,  475,  475,  475,  475,  477,  477,  477,  477,
			  477,  479,  472,  476,  483,  475,  482,  482,    0,  482,

			  477,  479,  474,  501,  503,  504,  477,  473,    0,  483,
			    0,  479,  477,  505,  478,  478,  478,  478,  478,  482,
			  480,  480,  475,  480,    0,  484,  506,  477,  479,  481,
			  481,  507,  481,  477,  478,  484,  483,  482,  493,  477,
			  505,  487,  487,  480,  487,  484,  495,  508,  509,  493,
			  510,  480,  481,  506,  511,  512,  513,  495,  507,  514,
			  481,  478,  484,  515,  482,  493,  516,  517,  519,  519,
			  519,  519,  519,  495,  508,  509,  493,  510,  480,    0,
			    0,  511,  512,  513,  495,  558,  514,  481,  559,  521,
			  515,    0,  487,  516,  517,  518,    0,  518,    0,    0,

			  518,  518,  518,  518,  518,  519,  520,  520,  520,  520,
			  520,  521,  558,    0,    0,  559,  521,  522,  522,  522,
			  522,  522,    0,  523,  523,  523,  523,  523,  655,  655,
			  655,  560,  522,  524,  524,  524,  524,  524,  525,  525,
			  525,  525,  525,  526,  526,  526,  526,  526,  527,  527,
			  527,  527,  527,  528,  528,  528,  528,  528,  560,  522,
			  523,  529,    0,  529,    0,  655,  529,  529,  529,  529,
			  529,  530,  530,  530,  530,  530,  534,  534,  561,  534,
			  526,  533,  533,  533,  533,  533,  535,  535,    0,  535,
			  540,  536,  536,    0,  536,    0,  533,  537,  537,  534,

			  537,  538,  538,  534,  538,  561,  540,    0,  562,  535,
			  540,    0,    0,  535,  536,  539,  539,    0,  539,  564,
			  537,    0,  536,  533,  538,  541,  541,    0,  541,    0,
			  534,    0,    0,  540,  537,  562,  543,  543,  539,  543,
			  535,  542,  542,    0,  542,    0,  564,    0,  541,  536,
			  539,  544,  544,    0,  544,  545,  545,  565,  545,  543,
			  553,  537,  546,  546,  542,  546,    0,  541,  549,  549,
			  553,  549,  542,  567,  544,    0,    0,  539,  545,  543,
			  553,    0,    0,    0,  565,  546,  545,  550,  550,  568,
			  550,  549,  546,  544,  541,  551,  551,  553,  551,  542,

			  567,  547,  547,  547,  547,  547,  543,  569,  552,  552,
			  550,  552,  554,  545,  570,  571,  568,  572,  551,  546,
			  544,  547,  554,  573,  551,  574,  575,  547,  550,  576,
			  577,  552,  554,  578,  569,  579,  581,  582,  552,  583,
			  585,  570,  571,    0,  572,    0,    0,    0,  547,  554,
			  573,  551,  574,  575,  547,  550,  576,  577,    0,  621,
			  578,    0,  579,  581,  582,  552,  583,  585,  586,  586,
			  586,  586,  586,  587,  587,  587,  587,  587,  588,  588,
			  588,  588,  588,  589,    0,  589,  621,    0,  589,  589,
			  589,  589,  589,  590,  593,  590,    0,    0,  590,  590,

			  590,  590,  590,  591,  591,  591,  591,  591,  592,  592,
			  592,  592,  592,    0,  605,  605,  593,  605,    0,    0,
			    0,  593,  594,  594,  594,  594,  594,  595,  595,  595,
			  595,  595,  597,  597,  597,  597,  597,  605,    0,    0,
			  591,  598,  598,  598,  598,  598,  599,  599,  599,  599,
			  599,  601,  601,  601,  601,  601,  602,  608,  602,  622,
			    0,  602,  602,  602,  602,  602,  601,  603,  603,    0,
			  603,  604,  604,  608,  604,  606,  606,  608,  606,  607,
			  607,    0,  607,    0,  609,  609,  622,  609,  601,    0,
			  603,    0,    0,  601,  604,  615,  610,  610,  606,  610,

			  608,  623,  607,  625,  606,    0,  604,  609,  603,  611,
			  611,  615,  611,  612,  612,  615,  612,  613,  613,  610,
			  613,  614,  614,    0,  614,  627,  616,  616,  623,  616,
			  625,  606,  611,  604,  631,  603,  612,  634,  615,  637,
			  613,  639,  617,  617,  614,  617,  641,  618,  618,  616,
			  618,    0,  627,  642,  613,  643,  611,  616,  644,    0,
			    0,  631,    0,    0,  634,  617,  637,    0,  639,    0,
			  618,    0,    0,  641,  671,  617,  672,  673,  618,    0,
			  642,  613,  643,  611,  616,  644,  646,  646,  646,  646,
			  646,  647,  647,  647,  647,  647,  648,  648,  648,  648,

			  648,  671,  617,  672,  673,  618,  649,  649,  649,  649,
			  649,  650,  650,  650,  650,  650,  651,    0,  651,    0,
			    0,  651,  651,  651,  651,  651,    0,    0,  647,  654,
			  654,  654,  654,  654,  656,  656,  656,  656,  656,  657,
			  657,  657,  657,  657,  658,  658,  658,  658,  658,  656,
			  659,  659,    0,  659,  660,  660,  674,  660,  665,  661,
			  661,    0,  661,  663,  663,    0,  663,    0,  675,  664,
			  664,  656,  664,  659,  665,    0,  656,  660,  665,  659,
			    0,  658,  661,  674,  666,  666,  663,  666,  660,    0,
			  661,  678,  664,  667,  667,  675,  667,    0,  664,  668, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  668,  665,  668,  679,  680,  681,  659,  666,  669,  670,
			  683,  703,  669,  670,  666,  660,  667,  661,  678,    0,
			  704,  705,  668,  708,  667,  664,    0,    0,  669,  670,
			  679,  680,  681,  759,  759,  759,  759,  683,  703,  669,
			  670,  666,  684,  684,  684,  684,  684,  704,  705,    0,
			  708,  667,  686,  686,  686,  686,  686,  687,  687,  687,
			  687,  687,  688,  688,  688,  688,  688,  689,  689,  689,
			  689,  689,  690,  690,  690,  690,  690,    0,    0,  684,
			  691,  691,  691,  691,  691,  693,  693,  693,  693,  693,
			  694,  694,    0,  694,  687,  695,  695,    0,  695,  701,

			  709,  696,  696,  701,  696,  697,  697,  711,  697,  699,
			  699,    0,  699,  694,  700,  700,    0,  700,  695,  701,
			  723,  702,  693,  694,  696,  702,    0,  709,  697,    0,
			  701,    0,  699,    0,  711,    0,  697,  700,  695,    0,
			  724,  702,  713,  713,  713,  713,  713,  723,    0,    0,
			  694,  725,  702,  718,  718,  726,  718,  700,  715,  715,
			  715,  715,  715,  697,  716,  695,  716,  724,  727,  716,
			  716,  716,  716,  716,  717,  717,  718,  717,  725,  713,
			  719,  719,  726,  719,  700,  728,  720,  720,  737,  720,
			  730,  730,  730,  730,  730,  727,    0,  717,  742,    0,

			  718,  716,  749,  719,    0,  717,    0,  731,  731,  720,
			  731,    0,  728,  732,  732,  737,  732,  733,  733,    0,
			  733,  735,  719,  734,  734,  742,  734,  718,  735,  749,
			  731,  736,  717,  720,  745,  745,  732,  745,  736,    0,
			  733,  735,  777,  777,  777,  777,  734,    0,    0,  719,
			  731,  736,    0,  746,  746,  735,  746,  745,    0,    0,
			  720,  750,  734,    0,    0,  736,  743,  743,  743,  743,
			  743,  744,  744,  744,  744,  744,  746,  731,  747,  748,
			  751,  745,  751,  756,  746,  747,  748,    0,  750,  734,
			  751,  752,  752,    0,  752,    0,  762,    0,  747,  748,

			  753,  753,  764,  753,  761,  761,  762,  761,  745,    0,
			  756,  746,  747,  748,  752,    0,  762,  751,  758,  758,
			  758,  758,  758,  753,  763,    0,    0,  761,    0,  764,
			  752,    0,  768,  762,  763,  761,  765,  765,  765,  765,
			  765,    0,  768,    0,  763,  766,  766,  766,  766,  766,
			  767,  767,  768,  767,  769,    0,  772,  752,  772,    0,
			    0,  763,  761,    0,  769,    0,  772,    0,    0,  768,
			  786,  786,  786,  767,  769,  771,  771,  771,  771,  771,
			  775,  775,  775,  775,  775,  776,  776,  776,  776,  776,
			  779,  769,  780,  772,  781,  781,  781,  781,  781,  782,

			  782,  782,  782,  782,  783,  784,  779,  786,  780,    0,
			  779,    0,  780,  785,  785,  785,  785,  785,    0,    0,
			  783,  784,    0,    0,  783,  784,  789,  789,  789,  789,
			  789,    0,    0,  779,    0,  780,  790,  790,  790,  790,
			  790,  791,  791,  791,  791,  791,    0,  783,  784,  793,
			  793,  793,  793,  793,  794,    0,  794,    0,    0,  794,
			  794,  794,  794,  794,  795,  795,  795,  795,  795,  796,
			  796,  796,  796,  796,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  794,  798,  798,  798,  798,  798,  798,  798,  798,

			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  802,  802,    0,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,

			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,    0,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  803,  803,    0,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  804,  804,  804,    0,    0,    0,
			    0,    0,    0,    0,  804,  804,    0,  804,    0,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,

			  804,  804,  804,  804,  804,  804,  804,  804,    0,    0,
			  804,  804,  804,  804,  804,  804,  804,  804,  805,  805,
			    0,  805,  805,    0,  805,  805,    0,    0,    0,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,    0,    0,
			  805,  805,  805,  805,  805,  805,  805,  805,  806,  806,
			    0,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,

			  806,  806,  806,  806,  806,  807,  807,    0,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			    0,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,    0,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  810,  810,  810,    0,
			    0,    0,    0,  810,  810,    0,  810,  810,    0,    0,
			    0,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			    0,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,

			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  813,  813,    0,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,

			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,    0,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,

			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  816,    0,    0,    0,  816,
			  816,    0,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,    0,    0,  816,  816,  816,  816,  816,
			  816,  816,  816,  817,  817,    0,  817,  817,    0,  817,
			  817,  817,    0,    0,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,    0,    0,  817,  817,  817,  817,  817,

			  817,  817,  817,  818,  818,  818,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  818,  819,  819,
			  819,  819,  819,  819,  819,    0,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,    0,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  820,  820,  820,    0,    0,

			    0,    0,  820,  820,    0,  820,  820,    0,    0,    0,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,    0,
			    0,  820,  820,  820,  820,  820,  820,  820,  820,  821,
			  821,  821,    0,    0,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,    0,    0,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,    0,    0,  821,  821,  821,  821,
			  821,  821,  821,  821,  822,  822,  822,    0,    0,    0,
			    0,  822,  822,    0,  822,  822,    0,    0,    0,  822,

			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,    0,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,    0,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797, yy_Dummy>>,
			1, 1764, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   86,   91,   73,   74,    0,    0,  179,
			    0,   65,   68,  874, 4675,   95,  867,  841,  857, 4675,
			   87, 4675, 4675, 4675, 4675, 4675,  845,   85,  838,   94,
			  113, 4675, 4675,  816, 4675,  812,  786,  266,  115,  270,
			  275,  279,  285,  304,  311,  319,  349,  418,  360,  388,
			  374,  353,  282, 4675, 4675,  749,  493,  568,   80,   82,
			  305,   86,  344,   94,   84,  358,  298,   98,   88,  225,
			  780, 4675, 4675,  787,  154, 4675,  115,  364,  304,  387,
			  342,  390,  321, 4675,  379,  720, 4675,  446,  542,  569,
			  643, 4675,   75,  695, 4675,  158,  768, 4675,  758, 4675,

			  751,    0,  640,  749,  732,  633, 4675,  460,  486,  654,
			  466,  664, 4675, 4675, 4675,  450,  744,    0,  748,  752,
			  756,  761,  765,  773,  777,  790,  804,  819,  814,  831,
			  838,  856,  846,  847,  863,  895,  968,  899,  915,  914,
			  950,  975,  923,  979,  960,  700,  777,  666, 4675,  284,
			  707, 1027,  698,  320,  349,    0,  683,  369,  385,  391,
			  392,  420,  658,  422,  826,  437,  447,  555,  551,  690,
			  688,  579,  656,  652,  623,  963,  640,  636,  711,  717,
			  746,  773,  776,  794,  795,  813,  840,  862,  865,  905,
			  897,  962,  899,  949,  956,  952,  956, 4675,  672, 4675,

			  313, 4675, 4675,  959,  972,  988, 1024, 1027,  996, 4675,
			  999,  619, 4675,  279, 1005, 1015, 1058, 4675, 1110,  574,
			 1163, 1054,  249, 1250, 4675, 4675,  642, 1114, 4675, 4675,
			 4675,  656, 1108,  654,  647,  641,  587,  516, 4675, 1283,
			 1118, 1124, 1129, 4675, 1289, 1139, 1251, 1046, 1238, 4675,
			  558, 1310, 1315, 1321, 1329, 1334, 1353, 1358, 1362, 1338,
			 1367, 1388, 1403, 1407, 1413, 1417, 1431, 1443, 1460, 1470,
			 1491, 1481, 1512, 1520, 1439, 1464, 1528, 1549, 1495, 1553,
			 1557, 1564, 1570, 1574, 1581, 1598, 1602,  552, 4675, 4675,
			  493,  974,    0, 1610, 1627,  995,    0, 1020, 1045, 1102,

			 1277, 1277, 1292, 1293, 1303, 1324,  454, 1329,  447, 1570,
			 1347, 1357, 1360, 1363, 1377, 1390, 1401, 1409, 1416,    0,
			    0, 1455, 1510, 1498, 1528, 1525, 1561, 1571, 1578, 1571,
			 1571,  445, 1573, 1582,  441,    0,    0, 1584, 1585, 1368,
			  359, 1574,  868, 1589, 1602, 1609, 4675,  486, 1662, 1672,
			 1071, 1677, 4675, 4675, 1676, 4675, 4675, 4675, 4675, 1681,
			 1687, 1698, 1708, 1713, 1724, 1741, 1729, 1746, 1751, 1767,
			 1756, 1772,  449, 1793, 1797, 1802, 1806, 1810, 1814, 1821,
			 1800, 1839, 1851, 1856, 1866, 1881, 1885, 1896, 1915, 1876,
			 1943, 1949, 1970, 1979, 1992, 1998, 1924, 1949, 1865, 1982,

			 2001, 2029, 2033, 2038, 1118,    0, 1607, 1615, 1674, 1675,
			    0, 1666, 1668,    0, 1757, 1765, 1803, 1814, 1812, 1815,
			 1816, 1834, 1841, 1849, 1846, 1857, 1869, 1880, 1874, 1875,
			 1913, 1939,    0,    0,    0,    0, 1948, 1983, 2010, 1979,
			 2001,  445,  411, 4675, 1259, 2049, 2059, 2065, 2072,  404,
			 2082, 2098, 2103, 2108, 2113, 2125,  394, 2130, 2151, 2141,
			  309, 2157, 2136, 2174, 2178, 2182, 2190,  388, 2195, 2211,
			 2216, 2221, 2232, 2237, 2242, 2263, 2248, 2268, 2296, 2263,
			 2318, 2327, 2294, 2269, 2297, 1273, 2043, 2339,  350,  349,
			 1998, 2074, 2142, 2305, 2146, 2313,    0, 2167,    0, 2196,

			 2200, 2240,    0, 2244, 2246, 2277, 2293, 2298, 2304, 2315,
			 2307, 2321, 2322, 2323, 2316, 2323, 2333, 2334, 2382, 2350,
			 2388, 2356, 2399, 2405, 2415, 2420, 2425, 2430, 2435, 2448,
			 2453, 1703, 4675, 2463, 2474, 2484, 2489, 2495, 2499, 2513,
			 2462, 2523, 2539, 2534, 2549, 2553, 2560, 2583,  375, 2566,
			 2585, 2593, 2606, 2532, 2584, 2104, 4675, 4675, 2356, 2359,
			 2402, 2445, 2469,    0, 2486, 2518,    0, 2536, 2545, 2574,
			 2569, 2571, 2584, 2578, 2581, 2582, 2596, 2598, 2600, 2603,
			    0, 2593, 2606, 2607,    0, 2597, 2650, 2655, 2660, 2670,
			 2680, 2685, 2690, 2661, 2704, 2709,  338, 2714, 2723, 2728,

			 4675, 2733, 2743, 2765, 2769, 2712, 2773, 2777, 2729, 2782,
			 2794, 2807, 2811, 2815, 2819, 2767, 2824, 2840, 2845,  312,
			  287, 2616, 2722, 2764,    0, 2772,    0, 2794,    0,    0,
			    0, 2785,    0,    0, 2788,    0,    0, 2800,    0, 2802,
			    0, 2813, 2818, 2822, 2825,  230, 2868, 2873, 2878, 2888,
			 2893, 2903,  228,  562, 2911, 2415, 2916, 2921, 2926, 2948,
			 2952, 2957, 4675, 2961, 2967, 2930, 2982, 2991, 2997, 2980,
			 2981, 2843, 2840, 2841, 2923, 2935,    0,    0, 2960, 2972,
			 2972, 2972,    0, 2978, 3024,  224, 3034, 3039, 3044, 3049,
			 3054, 3062, 4675, 3067, 3088, 3093, 3099, 3103, 4675, 3107,

			 3112, 3071, 3093, 2976, 2975, 2976,    0,    0, 2990, 3067,
			    0, 3062,    0, 3124,  225, 3140, 3151, 3172, 3151, 3178,
			 3184,  452, 4675, 3087, 3091, 3102, 3111, 3124, 3136,  147,
			 3172, 3205, 3211, 3215, 3221, 3193, 3203, 3143,    0,    0,
			    0,    0, 3157, 3248, 3253, 3232, 3251, 3250, 3251, 3153,
			 3228, 3267, 3289, 3298,  138,  122, 3242,    0, 3300, 3015,
			 4675, 3302, 3268, 3296, 3269, 3318, 3327, 3348, 3304, 3326,
			    0, 3357, 3343,  118,   88, 3362, 3367, 3224, 4675, 3362,
			 3364, 3376, 3381, 3376, 3377, 3395, 3357, 4675, 4675, 3408,
			 3418, 3423, 4675, 3431, 3441, 3446, 3451, 4675, 3491, 3538,

			 3585, 3632, 3679, 3726, 3772, 3812, 3857, 3904, 3951, 3998,
			 4044, 4089, 4136, 4183, 4230, 4277, 4317, 4357, 4401, 4447,
			 4493, 4538, 4582, 4627, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  797,    1,  798,  798,  799,  799,  800,  800,  797,
			    9,  801,  801,  797,  797,  797,  797,  797,  802,  797,
			  803,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  805,  797,  797,  806,  797,  797,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  797,  797,  797,  807,  797,  797,  797,  807,  807,  807,
			  807,  807,  808,  797,  808,  809,  797,  810,  797,  810,
			  810,  797,  811,  812,  797,  797,  797,  797,  802,  797,

			  813,  813,  813,  814,  797,  797,  797,  797,  815,  797,
			  797,  797,  797,  797,  797,  797,  804,  816,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,   47,  804,  804,  804,  804,   47,  804,
			  804,  804,  804,  804,  804,  817,  805,  806,  797,  797,
			  797,   57,  797,  151,  151,   57,   57,   57,   57,  151,
			   57,  151,  151,   57,   57,  151,  151,   57,   57,  151,
			   57,  151,  151,  151,   57,   57,   57,  151,   57,  151,
			   57,  151,  151,   57,   57,  151,  151,   57,   57,  151,
			  151,   57,   57,  151,   57,  151,   57,  797,  807,  797,

			  797,  797,  797,  807,  807,  807,  807,  807,  808,  797,
			  808,  809,  797,  809,  810,  797,  810,  797,  797,  797,
			  797,  797,  811,  812,  797,  797,  223,  818,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  816,  804,  804,  804,  804,  804,  804,  804,  804,  797,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  136,  136,  136,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  797,  797,  797,
			  797,  151,  151,  797,  151,   57,   57,  151,   57,  151,

			  151,  151,   57,   57,   57,  151,  151,   57,   57,  797,
			  151,  151,  151,  151,   57,   57,   57,  151,   57,  151,
			   57,  151,  151,   57,   57,  151,  151,   57,   57,  151,
			  151,  151,   57,   57,   57,  151,   57,  151,   57,  807,
			  807,  807,  807,  807,  807,  807,  797,  819,  819,  797,
			  819,  818,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  816,  804,  804,  804,  804,  804,  804,  804,
			  797,  804,  804,  804,  804,  804,  804,  804,  136,  136,
			  388,  388,  804,  133,  392,  392,  804,  804,  797,  804,

			  804,  804,  804,  804,  820,  821,  151,   57,  151,   57,
			  151,  151,  151,   57,   57,   57,  151,  151,   57,  151,
			  151,  151,  151,   57,   57,   57,  151,   57,  151,  151,
			   57,   57,  151,  151,   57,   57,  151,  151,  151,   57,
			   57,  151,   57,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  815,  797,  797,
			  797,  804,  804,  804,  804,  804,  804,  797,  804,  804,
			  804,  804,  804,  804,  804,  392,  804,  392,  477,  797,
			  804,  804,  804,  804,  797,  797,  822,  820,  151,   57,
			  151,   57,  151,  151,   57,   57,  151,  151,   57,  151,

			  151,  151,  151,   57,   57,   57,  151,   57,  151,  151,
			   57,   57,  151,  151,  151,  151,   57,   57,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  823,  804,  804,  804,  804,  804,  804,
			  797,  804,  804,  804,  804,  804,  804,  477,  797,  804,
			  804,  804,  804,  797,  797,  822,  797,  797,  151,  151,
			   57,  151,  151,  151,   57,   57,   57,  151,  151,  151,
			  151,   57,   57,   57,  151,   57,  151,  151,   57,   57,
			  151,  151,  151,  151,   57,   57,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  804,  804,  804,  804,  804,  797,  804,
			  804,  804,  804,  804,  804,  797,  804,  804,  804,  797,
			  797,  151,  151,   57,  151,  151,   57,   57,  151,  151,
			  151,  151,   57,   57,   57,  151,   57,  151,  151,   57,
			   57,  151,  151,  151,   57,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  804,
			  804,  804,  797,  804,  804,  797,  804,  804,  804,  797,
			  797,  151,  151,   57,  151,   57,  151,   57,  151,   57,
			  151,  151,  151,   57,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  804,  804,  804,  804,  797,  804,

			  804,  797,  797,  151,  151,   57,  151,   57,  151,   57,
			  151,  151,   57,  797,  797,  797,  797,  804,  804,  804,
			  804,  797,  797,  151,  151,   57,  151,   57,  151,  797,
			  797,  804,  804,  804,  804,  797,  797,  151,  151,   57,
			  151,   57,  151,  797,  797,  804,  804,  797,  797,  151,
			  151,  797,  804,  804,  797,  797,  151,  151,  797,  797,
			  797,  804,  797,  797,  151,  797,  797,  804,  797,  797,
			  151,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,    0,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    1,    8,    1,    1,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   18,
			   19,   20,   21,   21,   21,   22,   22,   22,   23,   24,
			   25,   26,   27,   28,    1,   29,   30,   31,   32,   33,
			   34,   30,   35,   36,   30,   30,   37,   38,   39,   40,
			   41,   42,   43,   44,   45,   46,   30,   47,   48,   49,
			   50,   51,   52,   53,   54,   55,    1,   56,   57,   58,

			   59,   60,   61,   57,   62,   63,   57,   57,   64,   65,
			   66,   67,   68,   69,   70,   71,   72,   73,   57,   74,
			   75,   76,   57,   77,   78,   79,   80,    1,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,    1,    1,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   85,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   87,   88,   88,   88,   88,   88,   88,   88,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,   10,   11,   12,   12,
			   12,   12,   13,   14,    1,   15,    1,   16,    1,   17,
			   17,   17,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,    5,   36,   37,    5,   12,   12,   12,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   38,
			   39,   40,   41,   42,   43,   44,   45,    5,    5,   46,
			   47,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  126,  124,    1,    2,   15,  108,   18,
			  124,   16,   17,    7,    6,   13,    5,   11,    8,   99,
			   99,   14,   12,   29,   10,   30,   20,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   78,   91,   91,
			   91,   91,   22,   31,   23,    9,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   24,   21,   25,  112,  113,  114,  115,  112,  112,  112,
			  112,  112,  125,   97,  125,  125,  125,  125,  125,  125,
			  125,   68,  125,  125,   90,    1,    2,   28,  108,  107,

			  122,  122,  122,    3,   33,  103,   32,    0,    0,   99,
			    0,   99,   27,   26,   19,    0,   91,   87,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   40,   91,   86,   86,   77,   86,   86,   91,
			   91,   91,   91,   91,   91,    0,    0,    0,   98,    0,
			    0,   94,    0,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   40,   94,   40,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   95,  112,  114,

			  113,  110,  109,  111,  112,  112,  112,  112,    0,   97,
			    0,    0,   96,    0,    0,    0,    0,   68,    0,   66,
			    0,   65,    0,    0,   90,   88,   88,    0,   89,  122,
			  116,  122,  122,  122,  122,  122,  122,    4,   34,  103,
			    0,    0,    0,  101,  103,  101,   99,    0,    0,   87,
			    0,   91,   39,   91,   91,   91,   91,   91,   91,    0,
			   91,   91,   91,   91,   91,   42,   91,   91,   78,   79,
			   78,   79,   78,   78,   85,   91,   85,   85,   85,   91,
			   91,   91,   91,   91,   91,   41,   91,    0,   63,   93,
			    0,   94,   39,   69,   69,   94,   39,   94,   94,   94,

			   94,   94,   94,   94,   94,   94,   94,   94,   94,    0,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   42,
			   42,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   41,   41,   94,   94,  112,
			  112,  112,  112,  112,  112,  112,   96,    0,    0,   67,
			   65,    0,  120,  123,  123,  121,  117,  118,  119,  103,
			    0,  103,    0,    0,  103,    0,    0,    0,  102,   99,
			    0,    0,   92,   91,   91,   38,   91,   91,   91,   91,
			    0,   91,   91,   91,   91,   91,   91,   91,   91,   77,
			   91,   91,   91,   91,   77,   77,   77,   37,    0,   44,

			   91,   91,   91,   91,   64,   60,   94,   94,   94,   94,
			   38,   94,   94,   38,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   37,   44,   37,   44,   94,   94,   94,   94,
			   94,   94,   94,   67,   65,  103,  103,    0,    0,  100,
			  103,    0,  102,    0,  102,    0,    0,    0,   99,   74,
			    0,   91,   91,   91,   91,   45,   91,    0,   91,   91,
			   91,   36,   91,   91,   91,   79,   78,   91,   91,    0,
			   91,   91,   91,   91,    0,   64,   64,    0,   94,   94,
			   94,   94,   94,   94,   94,   94,   45,   94,   45,   94,

			   94,   94,   36,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,    0,  103,
			    0,  106,  103,  102,    0,    0,  102,    0,    0,  101,
			    0,    0,   74,    0,   91,   91,   91,   91,   47,   91,
			    0,   91,   91,   91,   91,   91,   91,   91,    0,   53,
			   91,   91,   91,    0,    0,    0,   62,   61,   94,   94,
			   94,   94,   94,   47,   94,   94,   47,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   53,   94,   94,   94,   53,   94,    0,  103,    0,    0,
			    0,  102,    0,  106,  102,    0,   76,    0,    0,    0,

			  104,  106,  104,   91,   91,   59,   91,   46,    0,   43,
			   58,   91,   35,   91,   51,    0,   91,   91,   91,    0,
			    0,   94,   94,   94,   59,   94,   59,   94,   46,   43,
			   58,   94,   43,   58,   94,   35,   35,   94,   51,   94,
			   51,   94,   94,   94,   94,  106,    0,  106,    0,  102,
			    0,    0,  105,    0,    0,   73,  106,    0,  105,   91,
			   91,   91,   82,   54,   91,    0,   91,   91,   55,    0,
			    0,   94,   94,   94,   94,   94,   54,   54,   94,   94,
			   94,   94,   55,   94,  106,  105,    0,  105,    0,    0,
			    0,    0,   73,  105,   91,   91,   48,   91,   81,   52,

			   91,    0,    0,   94,   94,   94,   48,   48,   94,   94,
			   52,   94,   52,  105,   75,    0,   73,   91,   91,   91,
			   91,   80,   80,   94,   94,   94,   94,   94,   94,    0,
			    0,   91,   50,   49,   91,    0,    0,   94,   50,   50,
			   49,   49,   94,    0,    0,   91,   91,    0,    0,   94,
			   94,   72,   91,   56,    0,    0,   94,   56,    0,    0,
			   72,   91,    0,    0,   94,    0,    0,   57,    0,    0,
			   57,    0,   71,    0,    0,    0,    0,    0,   71,    0,
			    0,    0,    0,    0,    0,    0,   70,   83,   84,    0,
			    0,    0,   70,    0,   70,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4675
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 797
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 798
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

	yyNb_rules: INTEGER is 125
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 126
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

	make is
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			in_buffer := string_.make (Init_buffer_size)
			in_lineno := 1
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
		end

feature -- Access

	in_buffer: STRING
			-- Buffer for lexical tokens

	in_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

	source_start_line: INTEGER
			-- offset of source in other document, else 0

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

	dadl_parser: DADL2_VALIDATOR is
		once
			create Result.make
		end

	dadl_parser_error: STRING

	term_code_count: INTEGER
			-- number of term codes found so far parsing a  TERM_CONSTRAINT

	assumed_term_code_index: INTEGER
			-- index of term code in 'assumed' position when parsing a  TERM_CONSTRAINT

	c_domain_type: C_DOMAIN_TYPE

	tid: INTEGER

invariant

	in_buffer_not_void: in_buffer /= Void

end
