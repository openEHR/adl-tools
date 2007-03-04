indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"

	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
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
 -- match second last line with ';' termination (assumed value)
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
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 241 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 241")
end
	-- ignore comments
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
 -- match final line, terminating in ']'
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
			  108,  783,  109,  109,  109,  109,  109,  115,  115,  161,
			  115,  169,  201,  177,  179,   84,   84,  107,  193,  108,
			  162,  111,  111,  111,  111,  111,  160,  189,   76,  102,
			  117,  782,  190,   76,   94,  766,  163,   94,  170,  110,
			  178,  180,   85,   85,  224,  194,  200,  164,  200,  200,
			   95,  765,   95,   95,  191,  746,  746,  202,  110,  192,
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
			  732,  115,  115,  115,  195,  115,  223,  115,  115,  527,
			  115,  115,  115,  458,  115,  450,  149,  115,  115,  149,
			  115,  117,  145,  145,  150,  117,  346,  145,  145,  120,

			  117,  196,  673,  118,  117,  119,  115,  115,  123,  115,
			  117,  199,  121,  115,  115,  200,  115,  200,  200,  124,
			  125,  115,  115,  122,  115,  536,  120,  672,  224,  117,
			  118,  213,  119,  185,  165,  123,  117,  145,  209,  121,
			  129,  186,  126,  127,  117,  166,  124,  125,  128,  199,
			  122,  115,  115,  656,  115,  115,  115,  291,  115,  130,
			  187,  167,  115,  115,  110,  115,  199,  129,  188,  126,
			  127,  199,  168,  210,  117,  128,  115,  115,  117,  115,
			  131,  292,  171,  172,  291,  117,  130,  204,  173,  181,
			  115,  115,  132,  115,  199,  139,  212,  199,  618,  117,

			  211,  182,  144,  140,  561,  561,  291,  131,  292,  174,
			  175,  543,  531,  117,  143,  176,  183,  292,  107,  132,
			  115,  115,  139,  115,  206,  206,  487,  141,  184,  144,
			  140,  210,  142,  295,  297,  297,  133,  133,  133,  133,
			  133,  143,  204,  117,  296,  203,  203,  203,  214,  215,
			  134,  214,  115,  115,  141,  115,  135,  738,  211,  142,
			  487,  297,  298,  136,  299,  137,  299,  138,  205,  205,
			  205,  207,  207,  207,  305,  249,  374,  134,  242,  242,
			  242,  242,  242,  135,  248,  248,  248,  248,  248,  445,
			  306,  299,  137,  302,  138,  149,  445,  739,  149,  217,

			  440,  305,  440,  150,  244,  244,  244,  244,  244,  419,
			  419,  151,  151,  151,  151,  151,  152,  306,  237,  245,
			  237,  237,  151,  151,  151,  151,  151,  151,  151,  151,
			  153,  151,  154,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  215,  215,  245,  215,  151,  155,
			  155,  156,  155,  155,  155,  155,  155,  157,  155,  158,
			  155,  155,  155,  155,  155,  156,  155,  155,  155,  155,
			  149,  218,  215,  149,  218,  407,  219,  219,  150,  219,
			  691,  691,  691,  219,  220,  406,  151,  151,  151,  151,
			  151,  152,  305,  221,  306,  217,  374,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  307,
			  310,  308,  217,  151,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  218,  215,  310,  218,  231,
			  360,  239,  239,  239,  239,  239,  359,  219,  232,  232,
			  232,  232,  232,  358,  310,  357,  240,  221,  107,  354,
			  108,  800,  246,  246,  246,  246,  246,  247,  107,  213,
			  108,  317,  246,  246,  246,  246,  246,  311,  241,  300,
			  312,  314,  233,  240,  301,  199,  217,  226,  226,  293,

			  226,  294,  294,  294,  294,  294,  234,  313,  317,  110,
			  235,  313,  236,  309,  311,  259,  300,  312,  290,  110,
			  289,  301,  227,  148,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  115,  115,  287,  115,
			  115,  115,  238,  115,  115,  115,  317,  115,  115,  115,
			  237,  115,  319,  115,  115,  230,  115,  115,  115,  117,
			  115,   99,   96,  117,  228,  115,  115,  117,  115,  115,
			  115,  117,  115,  318,  252,  251,  117,  145,  145,  319,
			  117,  319,  115,  115,  213,  115,  255,  199,  117,  253,

			  287,  256,  117,  197,  321,  254,  115,  115,  322,  115,
			  257,  252,  251,  259,  148,  117,  115,  115,  320,  115,
			  258,  115,  115,  255,  115,  321,  253,  322,  256,  117,
			  288,  321,  254,  115,  115,  322,  115,  257,  114,  117,
			  115,  115,  113,  115,  117,  260,  325,  258,  115,  115,
			  261,  115,  323,  262,  324,  112,  117,  300,  115,  115,
			  106,  115,  301,  117,  103,  115,  115,   99,  115,  263,
			   97,  117,  260,  325,   96,  199,  264,  261,  267,  268,
			  262,  117,  269,  265,  303,  270,  326,  266,  117,  304,
			  800,  271,  116,  800,  272,  325,  273,  115,  115,  800,

			  115,  115,  115,  264,  115,  267,  268,  800,  274,  269,
			  265,  326,  270,  326,  266,  800,  115,  115,  271,  115,
			  117,  272,  327,  273,  117,  115,  115,  134,  115,  800,
			  331,  134,  331,  116,  116,  116,  116,  116,  328,  117,
			  274,  329,  137,  800,  274,  330,  800,  279,  117,  280,
			  206,  206,  115,  115,  134,  115,  284,  331,  134,  334,
			  274,  800,  115,  115,  116,  115,  199,  800,  329,  137,
			  115,  115,  330,  115,  279,  117,  280,  115,  115,  199,
			  115,  115,  115,  284,  115,  117,  275,  275,  275,  275,
			  275,  116,  335,  117,  311,  199,  281,  312,  329,  335,

			  117,  337,  330,  276,  117,  337,  277,  214,  215,  286,
			  214,  282,  278,  209,  408,  283,  212,  215,  215,  335,
			  215,  315,  285,  281,  316,  332,  336,  800,  337,  333,
			  276,  199,  338,  277,  199,  408,  286,  800,  282,  278,
			  800,  408,  283,  339,  340,  341,  342,  343,  210,  285,
			  800,  210,  410,  203,  203,  203,  221,  221,  217,  221,
			  218,  215,  409,  218,  372,  372,  372,  372,  217,  203,
			  203,  203,  219,  350,  446,  211,  350,  410,  211,  410,
			  800,  800,  221,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,

			  151,  151,  151,  151,  411,  344,  344,  344,  345,  345,
			  345,  217,  218,  215,  800,  218,  353,  353,  800,  353,
			  351,  447,  800,  351,  219,  355,  356,  356,  356,  356,
			  356,  362,  800,  362,  221,  412,  363,  363,  363,  363,
			  363,  227,  364,  364,  364,  364,  364,  365,  365,  365,
			  365,  365,  369,  800,  369,  800,  800,  370,  370,  370,
			  370,  370,  412,  217,  347,  348,  349,  347,  348,  347,
			  347,  347,  347,  347,  347,  347,  347,  350,  220,  220,
			  347,  220,  220,  220,  220,  220,  347,  351,  347,  347,
			  347,  347,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  347,  347,  352,  347,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  226,  226,  800,  226,  373,  373,  373,  373,
			  373,  488,  488,  800,  489,  107,  800,  108,  800,  371,
			  371,  371,  371,  371,  800,  219,  219,  227,  219,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,

			  228,  361,  361,  361,  361,  361,  110,  366,  366,  366,
			  366,  366,  115,  115,  413,  115,  240,  115,  115,  800,
			  115,  414,  367,  115,  115,  412,  115,  800,  800,  228,
			  413,  115,  115,  800,  115,  117,  115,  115,  241,  115,
			  117,  413,  800,  240,  368,  800,  117,  414,  414,  367,
			  375,  800,  415,  376,  117,  115,  115,  416,  115,  117,
			  115,  115,  377,  115,  115,  115,  382,  115,  418,  115,
			  115,  378,  115,  418,  417,  199,  382,  375,  117,  800,
			  376,  800,  800,  117,  421,  800,  382,  117,  800,  377,
			  115,  115,  117,  115,  422,  418,  423,  379,  378,  424,

			  420,  800,  380,  382,  383,  115,  115,  800,  115,  115,
			  115,  421,  115,  117,  421,  115,  115,  381,  115,  115,
			  115,  422,  115,  423,  379,  384,  424,  422,  117,  380,
			  800,  383,  117,  115,  115,  800,  115,  423,  117,  385,
			  428,  425,  117,  386,  387,  115,  115,  428,  115,  203,
			  203,  203,  384,  800,  426,  800,  117,  116,  116,  116,
			  116,  116,  115,  115,  427,  115,  385,  428,  117,  800,
			  386,  387,  115,  115,  429,  115,  389,  388,  390,  390,
			  390,  390,  390,  115,  115,  117,  115,  800,  392,  392,
			  392,  392,  392,  115,  115,  117,  115,  115,  115,  396,

			  115,  430,  397,  389,  388,  391,  117,  800,  398,  393,
			  393,  393,  393,  393,  115,  115,  117,  115,  221,  221,
			  117,  221,  115,  115,  800,  115,  396,  800,  430,  397,
			  394,  394,  394,  394,  394,  398,  391,  117,  395,  395,
			  395,  395,  395,  431,  430,  117,  116,  116,  116,  116,
			  116,  115,  115,  800,  115,  115,  115,  391,  115,  115,
			  115,  431,  115,  116,  434,  391,  115,  115,  800,  115,
			  431,  432,  115,  115,  117,  115,  115,  115,  117,  115,
			  400,  199,  117,  115,  115,  800,  115,  290,  433,  117,
			  116,  434,  399,  278,  435,  117,  199,  401,  382,  117,

			  115,  115,  800,  115,  115,  115,  117,  115,  382,  199,
			  434,  435,  402,  438,  439,  438,  199,  403,  382,  399,
			  278,  435,  800,  117,  401,  439,  293,  117,  293,  293,
			  293,  293,  293,  443,  443,  382,  404,  436,  437,  402,
			  438,  439,  441,  293,  403,  294,  294,  294,  294,  294,
			  800,  405,  442,  800,  491,  205,  205,  205,  800,  800,
			  443,  444,  491,  800,  348,  349,  800,  348,  800,  800,
			  207,  207,  207,  800,  215,  215,  350,  215,  405,  353,
			  353,  491,  353,  203,  203,  203,  351,  800,  800,  492,
			  203,  203,  203,  355,  356,  356,  356,  356,  356,  448,

			  448,  448,  448,  448,  800,  363,  363,  363,  363,  363,
			  493,  493,  495,  496,  240,  352,  449,  449,  449,  449,
			  449,  488,  488,  800,  488,  217,  451,  451,  451,  451,
			  451,  452,  452,  452,  452,  452,  241,  493,  494,  495,
			  496,  240,  453,  453,  453,  453,  453,  456,  456,  456,
			  456,  456,  800,  450,  454,  800,  454,  367,  800,  455,
			  455,  455,  455,  455,  370,  370,  370,  370,  370,  457,
			  457,  457,  457,  457,  462,  462,  462,  462,  462,  368,
			  800,  800,  459,  460,  367,  461,  461,  461,  461,  461,
			  463,  463,  463,  463,  463,  115,  115,  800,  115,  115,

			  115,  800,  115,  495,  115,  115,  458,  115,  115,  115,
			  496,  115,  115,  115,  800,  115,  115,  115,  117,  115,
			  800,  800,  117,  115,  115,  800,  115,  117,  470,  800,
			  497,  117,  800,  465,  800,  117,  499,  498,  470,  117,
			  464,  115,  115,  500,  115,  499,  117,  468,  470,  800,
			  469,  502,  466,  115,  115,  467,  115,  800,  115,  115,
			  465,  115,  503,  499,  117,  470,  800,  464,  115,  115,
			  500,  115,  501,  504,  468,  471,  117,  469,  502,  466,
			  505,  117,  467,  115,  115,  502,  115,  115,  115,  503,
			  115,  117,  503,  482,  800,  473,  504,  472,  115,  115,

			  504,  115,  471,  482,  509,  474,  117,  505,  800,  800,
			  117,  116,  506,  482,  116,  509,  475,  511,  512,  507,
			  116,  117,  473,  508,  472,  800,  115,  115,  476,  115,
			  482,  509,  474,  390,  390,  390,  390,  390,  116,  477,
			  800,  116,  510,  475,  511,  512,  800,  116,  800,  117,
			  269,  115,  115,  478,  115,  476,  511,  800,  800,  271,
			  800,  392,  392,  392,  392,  392,  477,  393,  393,  393,
			  393,  393,  115,  115,  117,  115,  800,  269,  116,  800,
			  478,  268,  512,  513,  115,  115,  271,  115,  394,  394,
			  394,  394,  394,  800,  515,  117,  272,  395,  395,  395,

			  395,  395,  479,  115,  115,  116,  115,  117,  268,  514,
			  480,  480,  480,  480,  480,  516,  481,  481,  481,  481,
			  481,  515,  800,  272,  116,  515,  117,  800,  116,  479,
			  116,  115,  115,  516,  115,  115,  115,  562,  115,  517,
			  115,  115,  516,  115,  800,  488,  488,  483,  489,  518,
			  800,  116,  519,  487,  117,  116,  800,  116,  117,  800,
			  520,  484,  485,  117,  562,  800,  517,  448,  448,  448,
			  448,  448,  486,  800,  483,  800,  518,  522,  522,  522,
			  522,  522,  521,  523,  523,  523,  523,  523,  484,  485,
			  524,  524,  524,  524,  524,  800,  559,  800,  800,  486,

			  525,  525,  525,  525,  525,  602,  602,  602,  602,  521,
			  800,  800,  800,  562,  450,  367,  455,  455,  455,  455,
			  455,  526,  526,  526,  526,  526,  528,  528,  528,  528,
			  528,  529,  529,  529,  529,  529,  800,  368,  115,  115,
			  563,  115,  367,  530,  530,  530,  530,  530,  525,  525,
			  525,  525,  525,  800,  533,  800,  533,  800,  527,  115,
			  115,  117,  115,  532,  534,  800,  800,  460,  458,  461,
			  461,  461,  461,  461,  564,  538,  115,  115,  564,  115,
			  115,  115,  117,  115,  115,  115,  800,  115,  800,  800,
			  532,  535,  115,  115,  800,  115,  800,  115,  115,  117,

			  115,  564,  538,  117,  570,  567,  539,  117,  800,  800,
			  800,  540,  537,  115,  115,  117,  115,  800,  115,  115,
			  117,  115,  541,  115,  115,  800,  115,  542,  544,  571,
			  800,  570,  572,  539,  115,  115,  117,  115,  540,  115,
			  115,  117,  115,  545,  115,  115,  117,  115,  800,  541,
			  115,  115,  546,  115,  542,  544,  571,  117,  800,  572,
			  559,  800,  117,  800,  800,  547,  800,  117,  800,  800,
			  545,  115,  115,  117,  115,  549,  573,  571,  572,  546,
			  548,  550,  550,  550,  550,  550,  480,  480,  480,  480,
			  480,  551,  547,  391,  117,  116,  115,  115,  800,  115,

			  116,  551,  549,  573,  574,  575,  397,  548,  800,  555,
			  800,  551,  398,  573,  481,  481,  481,  481,  481,  117,
			  115,  115,  116,  115,  800,  556,  577,  116,  551,  115,
			  115,  577,  115,  397,  116,  556,  555,  554,  565,  398,
			  576,  800,  800,  117,  558,  557,  565,  579,  580,  566,
			  579,  552,  117,  577,  580,  583,  584,  566,  578,  585,
			  553,  116,  556,  586,  554,  565,  583,  584,  590,  590,
			  590,  590,  590,  568,  579,  580,  566,  581,  552,  800,
			  800,  582,  583,  584,  569,  624,  585,  553,  625,  592,
			  586,  800,  560,  587,  588,  589,  800,  589,  800,  800,

			  590,  590,  590,  590,  590,  450,  591,  591,  591,  591,
			  591,  241,  624,  800,  800,  625,  592,  525,  525,  525,
			  525,  525,  800,  594,  594,  594,  594,  594,  693,  694,
			  693,  625,  593,  595,  595,  595,  595,  595,  596,  596,
			  596,  596,  596,  597,  597,  597,  597,  597,  598,  598,
			  598,  598,  598,  599,  599,  599,  599,  599,  626,  593,
			  527,  600,  800,  600,  800,  695,  597,  597,  597,  597,
			  597,  601,  601,  601,  601,  601,  115,  115,  627,  115,
			  458,  604,  604,  604,  604,  604,  115,  115,  800,  115,
			  611,  115,  115,  800,  115,  800,  605,  115,  115,  117,

			  115,  115,  115,  606,  115,  627,  611,  800,  628,  117,
			  611,  800,  800,  607,  117,  115,  115,  800,  115,  627,
			  117,  800,  608,  605,  117,  115,  115,  800,  115,  800,
			  606,  800,  800,  611,  609,  628,  115,  115,  117,  115,
			  607,  115,  115,  800,  115,  800,  629,  800,  117,  608,
			  610,  115,  115,  800,  115,  115,  115,  628,  115,  117,
			  622,  609,  115,  115,  117,  115,  800,  612,  115,  115,
			  622,  115,  613,  631,  117,  800,  800,  610,  117,  614,
			  623,  800,  800,  800,  630,  117,  616,  115,  115,  632,
			  115,  117,  617,  615,  612,  115,  115,  622,  115,  613,

			  631,  550,  550,  550,  550,  550,  614,  633,  115,  115,
			  117,  115,  623,  616,  634,  632,  632,  633,  117,  617,
			  615,  116,  623,  634,  620,  638,  638,  271,  619,  640,
			  641,  117,  623,  640,  633,  641,  644,  645,  621,  646,
			  644,  634,  635,  800,  636,  800,  800,  800,  116,  623,
			  637,  620,  638,  639,  271,  619,  640,  641,  800,  674,
			  642,  800,  643,  644,  645,  621,  646,  647,  590,  590,
			  590,  590,  590,  590,  590,  590,  590,  590,  648,  648,
			  648,  648,  648,  649,  800,  649,  674,  800,  650,  650,
			  650,  650,  650,  651,  654,  651,  800,  800,  652,  652,

			  652,  652,  652,  652,  652,  652,  652,  652,  653,  653,
			  653,  653,  653,  800,  115,  115,  368,  115,  800,  800,
			  800,  654,  597,  597,  597,  597,  597,  655,  655,  655,
			  655,  655,  597,  597,  597,  597,  597,  117,  800,  800,
			  527,  657,  657,  657,  657,  657,  658,  658,  658,  658,
			  658,  659,  659,  659,  659,  659,  660,  665,  660,  675,
			  800,  661,  661,  661,  661,  661,  654,  115,  115,  800,
			  115,  115,  115,  665,  115,  115,  115,  665,  115,  115,
			  115,  800,  115,  800,  115,  115,  675,  115,  368,  800,
			  117,  800,  800,  654,  117,  668,  115,  115,  117,  115,

			  665,  675,  117,  677,  664,  800,  663,  117,  662,  115,
			  115,  668,  115,  115,  115,  668,  115,  115,  115,  117,
			  115,  115,  115,  800,  115,  677,  115,  115,  676,  115,
			  677,  664,  117,  663,  679,  662,  117,  679,  668,  681,
			  117,  681,  115,  115,  117,  115,  683,  115,  115,  117,
			  115,  800,  678,  684,  667,  685,  666,  669,  683,  800,
			  800,  679,  800,  800,  680,  117,  681,  800,  682,  800,
			  117,  800,  800,  683,  706,  670,  707,  707,  671,  800,
			  684,  667,  685,  666,  669,  686,  650,  650,  650,  650,
			  650,  687,  687,  687,  687,  687,  652,  652,  652,  652,

			  652,  706,  670,  707,  708,  671,  652,  652,  652,  652,
			  652,  688,  688,  688,  688,  688,  689,  800,  689,  800,
			  800,  690,  690,  690,  690,  690,  800,  800,  450,  692,
			  692,  692,  692,  692,  596,  596,  596,  596,  596,  661,
			  661,  661,  661,  661,  696,  696,  696,  696,  696,  654,
			  115,  115,  800,  115,  115,  115,  709,  115,  701,  115,
			  115,  800,  115,  115,  115,  800,  115,  800,  709,  115,
			  115,  368,  115,  117,  701,  800,  654,  117,  701,  697,
			  800,  458,  117,  709,  115,  115,  117,  115,  698,  800,
			  699,  711,  117,  115,  115,  710,  115,  800,  700,  115, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  115,  701,  115,  711,  713,  714,  697,  117,  704,  705,
			  713,  726,  704,  705,  702,  698,  117,  699,  711,  800,
			  727,  727,  117,  729,  703,  700,  800,  800,  704,  705,
			  712,  713,  714,  769,  769,  769,  769,  715,  726,  704,
			  705,  702,  648,  648,  648,  648,  648,  727,  728,  800,
			  729,  703,  690,  690,  690,  690,  690,  716,  716,  716,
			  716,  716,  717,  717,  717,  717,  717,  535,  535,  535,
			  535,  535,  718,  718,  718,  718,  718,  800,  800,  450,
			  719,  719,  719,  719,  719,  655,  655,  655,  655,  655,
			  115,  115,  800,  115,  527,  115,  115,  800,  115,  724,

			  729,  115,  115,  724,  115,  115,  115,  731,  115,  115,
			  115,  800,  115,  117,  115,  115,  800,  115,  117,  724,
			  740,  725,  458,  720,  117,  725,  800,  730,  117,  800,
			  724,  800,  117,  800,  731,  800,  722,  117,  721,  800,
			  741,  725,  688,  688,  688,  688,  688,  740,  800,  800,
			  720,  741,  725,  115,  115,  743,  115,  723,  733,  733,
			  733,  733,  733,  722,  693,  721,  693,  741,  743,  719,
			  719,  719,  719,  719,  115,  115,  117,  115,  742,  527,
			  115,  115,  743,  115,  723,  745,  115,  115,  752,  115,
			  747,  747,  747,  747,  747,  744,  800,  117,  753,  800,

			  735,  695,  759,  117,  800,  734,  800,  115,  115,  117,
			  115,  800,  745,  115,  115,  752,  115,  115,  115,  800,
			  115,  750,  736,  115,  115,  753,  115,  735,  750,  759,
			  117,  751,  734,  737,  115,  115,  117,  115,  751,  800,
			  117,  750,  785,  785,  785,  785,  117,  800,  800,  736,
			  748,  751,  800,  115,  115,  750,  115,  117,  800,  800,
			  737,  760,  749,  800,  800,  751,  754,  754,  754,  754,
			  754,  695,  695,  695,  695,  695,  117,  748,  757,  758,
			  761,  755,  761,  767,  756,  757,  758,  800,  760,  749,
			  762,  115,  115,  800,  115,  800,  771,  800,  757,  758,

			  115,  115,  773,  115,  115,  115,  771,  115,  755,  800,
			  767,  756,  757,  758,  117,  800,  771,  763,  768,  768,
			  768,  768,  768,  117,  772,  800,  800,  117,  800,  773,
			  764,  800,  776,  771,  772,  770,  774,  774,  774,  774,
			  774,  800,  776,  800,  772,  775,  775,  775,  775,  775,
			  115,  115,  776,  115,  777,  800,  779,  764,  779,  800,
			  800,  772,  770,  800,  777,  800,  780,  800,  800,  776,
			  793,  794,  793,  117,  777,  778,  778,  778,  778,  778,
			  763,  763,  763,  763,  763,  784,  784,  784,  784,  784,
			  786,  777,  787,  781,  788,  788,  788,  788,  788,  789,

			  789,  789,  789,  789,  790,  791,  786,  795,  787,  800,
			  786,  800,  787,  792,  792,  792,  792,  792,  800,  800,
			  790,  791,  800,  800,  790,  791,  781,  781,  781,  781,
			  781,  800,  800,  786,  800,  787,  796,  796,  796,  796,
			  796,  797,  797,  797,  797,  797,  800,  790,  791,  798,
			  798,  798,  798,  798,  793,  800,  793,  800,  800,  797,
			  797,  797,  797,  797,  799,  799,  799,  799,  799,  795,
			  795,  795,  795,  795,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  795,   73,   73,   73,   73,   73,   73,   73,   73,

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
			   98,   98,  800,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  800,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,  100,  100,  800,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  116,  116,  116,  800,  800,  800,
			  800,  800,  800,  800,  116,  116,  800,  116,  800,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,

			  116,  116,  116,  116,  116,  116,  116,  116,  800,  800,
			  116,  116,  116,  116,  116,  116,  116,  116,  146,  146,
			  800,  146,  146,  800,  146,  146,  800,  800,  800,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  800,  800,
			  146,  146,  146,  146,  146,  146,  146,  146,  147,  147,
			  800,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,

			  147,  147,  147,  147,  147,  198,  198,  800,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  800,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  211,

			  211,  211,  211,  211,  211,  211,  211,  211,  211,  800,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  216,  216,  216,  800,
			  800,  800,  800,  216,  216,  800,  216,  216,  800,  800,
			  800,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  800,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  229,  229,  800,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  800,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,

			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  250,  800,  800,  800,  250,
			  250,  800,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  800,  800,  250,  250,  250,  250,  250,
			  250,  250,  250,  145,  145,  800,  145,  145,  800,  145,
			  145,  145,  800,  800,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  800,  800,  145,  145,  145,  145,  145,

			  145,  145,  145,  228,  228,  228,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  228,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  490,  490,  490,  800,  800,

			  800,  800,  490,  490,  800,  490,  490,  800,  800,  800,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  800,
			  800,  490,  490,  490,  490,  490,  490,  490,  490,  407,
			  407,  407,  800,  800,  407,  407,  407,  407,  407,  407,
			  407,  407,  407,  800,  800,  407,  407,  407,  407,  407,
			  407,  407,  407,  407,  407,  407,  407,  407,  407,  407,
			  407,  407,  407,  407,  800,  800,  407,  407,  407,  407,
			  407,  407,  407,  407,  558,  558,  558,  800,  800,  800,
			  800,  558,  558,  800,  558,  558,  800,  800,  800,  558,

			  558,  558,  558,  558,  558,  558,  558,  558,  558,  558,
			  558,  558,  558,  558,  558,  558,  558,  558,  800,  558,
			  558,  558,  558,  558,  558,  558,  558,  558,  603,  603,
			  603,  603,  603,  603,  603,  603,  603,  800,  603,  603,
			  603,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  603,  603,  603,   13,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800, yy_Dummy>>,
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
			   29,  777,   29,   29,   29,   29,   29,   38,   38,   59,
			   38,   61,   76,   63,   64,    5,    6,   30,   68,   30,
			   59,   30,   30,   30,   30,   30,   58,   67,    3,   20,
			   38,  776,   67,    4,   11,  758,   59,   12,   61,   29,
			   63,   64,    5,    6,   92,   68,   74,   59,   74,   74,
			   95,  757,   95,   95,   67,  732,  732,   76,   30,   67,
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
			  717,   37,   39,   39,   69,   39,  222,   40,   40,  688,
			   40,   41,   41,  655,   41,  648,  149,   42,   42,  149,
			   42,   37,   52,   52,  149,   39,  213,   52,   52,   39,

			   40,   69,  623,   37,   41,   37,   43,   43,   41,   43,
			   42,   78,   40,   44,   44,  200,   44,  200,  200,   41,
			   42,   45,   45,   40,   45,  463,   39,  622,  222,   43,
			   37,  213,   37,   66,   60,   41,   44,   52,   82,   40,
			   44,   66,   43,   43,   45,   60,   41,   42,   43,   80,
			   40,   46,   46,  599,   46,   51,   51,  153,   51,   45,
			   66,   60,   48,   48,  463,   48,  340,   44,   66,   43,
			   43,   77,   60,   82,   46,   43,   50,   50,   51,   50,
			   46,  154,   62,   62,  153,   48,   45,   78,   62,   65,
			   49,   49,   46,   49,   79,   48,   84,   81,  551,   50,

			   82,   65,   51,   48,  492,  491,  157,   46,  154,   62,
			   62,  470,  459,   49,   50,   62,   65,  158,  452,   46,
			   47,   47,   48,   47,   80,   80,  444,   49,   65,   51,
			   48,   84,   49,  157,  159,  160,   47,   47,   47,   47,
			   47,   50,  340,   47,  158,   77,   77,   77,   87,   87,
			   47,   87,  115,  115,   49,  115,   47,  724,   84,   49,
			  443,  159,  160,   47,  161,   47,  163,   47,   79,   79,
			   79,   81,   81,   81,  165,  115,  374,   47,  107,  107,
			  107,  107,  107,   47,  110,  110,  110,  110,  110,  352,
			  166,  161,   47,  163,   47,   56,  347,  724,   56,   87,

			  334,  165,  331,   56,  108,  108,  108,  108,  108,  308,
			  306,   56,   56,   56,   56,   56,   56,  166,  237,  108,
			  237,  237,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   88,   88,  108,   88,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   57,   89,   89,   57,   89,  290,  219,  219,   57,  219,
			  656,  656,  656,   89,   89,  287,   57,   57,   57,   57,
			   57,   57,  167,   89,  168,   88,  250,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  167,
			  171,  168,   89,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   90,   90,  171,   90,  102,
			  236,  105,  105,  105,  105,  105,  235,   90,  102,  102,
			  102,  102,  102,  234,  174,  233,  105,   90,  109,  231,
			  109,  226,  109,  109,  109,  109,  109,  109,  111,  211,
			  111,  177,  111,  111,  111,  111,  111,  172,  105,  162,
			  172,  174,  102,  105,  162,  198,   90,   93,   93,  156,

			   93,  156,  156,  156,  156,  156,  102,  176,  177,  109,
			  102,  173,  102,  170,  172,  169,  162,  172,  152,  111,
			  150,  162,   93,  147,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  116,  116,  145,  116,
			  118,  118,  104,  118,  119,  119,  178,  119,  120,  120,
			  103,  120,  179,  121,  121,  100,  121,  122,  122,  116,
			  122,   98,   96,  118,   93,  123,  123,  119,  123,  124,
			  124,  120,  124,  178,  119,  118,  121,  146,  146,  179,
			  122,  180,  125,  125,   85,  125,  122,   73,  123,  120,

			  146,  122,  124,   70,  181,  121,  126,  126,  182,  126,
			  123,  119,  118,  125,   55,  125,  128,  128,  180,  128,
			  124,  127,  127,  122,  127,  183,  120,  184,  122,  126,
			  146,  181,  121,  129,  129,  182,  129,  123,   36,  128,
			  130,  130,   35,  130,  127,  126,  185,  124,  132,  132,
			  127,  132,  183,  127,  184,   33,  129,  164,  131,  131,
			   28,  131,  164,  130,   26,  134,  134,   18,  134,  128,
			   17,  132,  126,  185,   16,  342,  129,  127,  132,  133,
			  127,  131,  133,  130,  164,  133,  186,  131,  134,  164,
			   13,  133,  133,    0,  133,  187,  133,  135,  135,    0,

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
			  351,  351,    0,  351,  218,  232,  232,  232,  232,  232,
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
			  248,  406,  406,    0,  406,  246,    0,  246,    0,  246,
			  246,  246,  246,  246,    0,  446,  446,  223,  446,  223,
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
			  270,  270,  270,  270,  272,  272,  270,  272,  447,  447,
			  278,  447,  273,  273,    0,  273,  275,    0,  321,  275,
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
			    0,  286,  333,    0,  408,  341,  341,  341,    0,    0,
			  337,  338,  409,    0,  348,  348,    0,  348,    0,    0,
			  343,  343,  343,    0,  349,  349,  348,  349,  286,  353,
			  353,  408,  353,  344,  344,  344,  348,    0,    0,  409,
			  345,  345,  345,  356,  356,  356,  356,  356,  356,  361,

			  361,  361,  361,  361,  353,  362,  362,  362,  362,  362,
			  410,  411,  413,  414,  361,  348,  363,  363,  363,  363,
			  363,  488,  488,    0,  488,  349,  364,  364,  364,  364,
			  364,  365,  365,  365,  365,  365,  361,  410,  411,  413,
			  414,  361,  366,  366,  366,  366,  366,  368,  368,  368,
			  368,  368,    0,  363,  367,    0,  367,  366,    0,  367,
			  367,  367,  367,  367,  369,  369,  369,  369,  369,  370,
			  370,  370,  370,  370,  372,  372,  372,  372,  372,  366,
			    0,    0,  371,  371,  366,  371,  371,  371,  371,  371,
			  373,  373,  373,  373,  373,  375,  375,    0,  375,  376,

			  376,    0,  376,  416,  377,  377,  370,  377,  378,  378,
			  417,  378,  379,  379,    0,  379,  380,  380,  375,  380,
			    0,    0,  376,  381,  381,    0,  381,  377,  382,    0,
			  416,  378,    0,  376,    0,  379,  418,  417,  382,  380,
			  375,  383,  383,  419,  383,  420,  381,  380,  382,    0,
			  381,  421,  378,  384,  384,  379,  384,    0,  385,  385,
			  376,  385,  422,  418,  383,  382,    0,  375,  386,  386,
			  419,  386,  420,  423,  380,  383,  384,  381,  421,  378,
			  424,  385,  379,  387,  387,  425,  387,  388,  388,  422,
			  388,  386,  426,  400,    0,  385,  427,  384,  389,  389,

			  423,  389,  383,  400,  428,  386,  387,  424,    0,    0,
			  388,  391,  425,  400,  391,  429,  387,  430,  431,  426,
			  391,  389,  385,  427,  384,    0,  398,  398,  388,  398,
			  400,  428,  386,  390,  390,  390,  390,  390,  391,  389,
			    0,  391,  429,  387,  430,  431,    0,  391,    0,  398,
			  390,  399,  399,  390,  399,  388,  432,    0,    0,  390,
			    0,  392,  392,  392,  392,  392,  389,  393,  393,  393,
			  393,  393,  394,  394,  399,  394,    0,  390,  392,    0,
			  390,  393,  433,  432,  401,  401,  390,  401,  394,  394,
			  394,  394,  394,    0,  438,  394,  393,  395,  395,  395,

			  395,  395,  394,  402,  402,  392,  402,  401,  393,  433,
			  396,  396,  396,  396,  396,  439,  397,  397,  397,  397,
			  397,  438,    0,  393,  396,  441,  402,    0,  395,  394,
			  397,  403,  403,  442,  403,  404,  404,  493,  404,  440,
			  405,  405,  439,  405,    0,  489,  489,  402,  489,  440,
			    0,  396,  441,  405,  403,  395,    0,  397,  404,    0,
			  442,  403,  404,  405,  493,    0,  440,  448,  448,  448,
			  448,  448,  404,    0,  402,    0,  440,  449,  449,  449,
			  449,  449,  448,  450,  450,  450,  450,  450,  403,  404,
			  451,  451,  451,  451,  451,    0,  489,    0,    0,  404,

			  453,  453,  453,  453,  453,  534,  534,  534,  534,  448,
			    0,    0,    0,  494,  449,  453,  454,  454,  454,  454,
			  454,  455,  455,  455,  455,  455,  456,  456,  456,  456,
			  456,  457,  457,  457,  457,  457,    0,  453,  465,  465,
			  494,  465,  453,  458,  458,  458,  458,  458,  460,  460,
			  460,  460,  460,    0,  462,    0,  462,    0,  455,  464,
			  464,  465,  464,  460,  462,    0,    0,  461,  457,  461,
			  461,  461,  461,  461,  495,  465,  466,  466,  497,  466,
			  467,  467,  464,  467,  468,  468,    0,  468,    0,    0,
			  460,  462,  469,  469,    0,  469,    0,  471,  471,  466,

			  471,  495,  465,  467,  500,  497,  466,  468,    0,  558,
			  558,  467,  464,  472,  472,  469,  472,    0,  473,  473,
			  471,  473,  467,  474,  474,    0,  474,  469,  471,  502,
			    0,  500,  503,  466,  475,  475,  472,  475,  467,  476,
			  476,  473,  476,  472,  477,  477,  474,  477,    0,  467,
			  479,  479,  473,  479,  469,  471,  502,  475,    0,  503,
			  558,    0,  476,    0,    0,  475,    0,  477,    0,    0,
			  472,  486,  486,  479,  486,  477,  504,  506,  507,  473,
			  476,  478,  478,  478,  478,  478,  480,  480,  480,  480,
			  480,  482,  475,  479,  486,  478,  485,  485,    0,  485,

			  480,  482,  477,  504,  506,  507,  480,  476,    0,  486,
			    0,  482,  480,  508,  481,  481,  481,  481,  481,  485,
			  483,  483,  478,  483,    0,  487,  509,  480,  482,  484,
			  484,  510,  484,  480,  481,  487,  486,  485,  496,  480,
			  508,  490,  490,  483,  490,  487,  498,  511,  512,  496,
			  513,  483,  484,  509,  514,  515,  516,  498,  510,  517,
			  484,  481,  487,  518,  485,  496,  519,  520,  522,  522,
			  522,  522,  522,  498,  511,  512,  496,  513,  483,    0,
			    0,  514,  515,  516,  498,  561,  517,  484,  562,  524,
			  518,    0,  490,  519,  520,  521,    0,  521,    0,    0,

			  521,  521,  521,  521,  521,  522,  523,  523,  523,  523,
			  523,  524,  561,    0,    0,  562,  524,  525,  525,  525,
			  525,  525,    0,  526,  526,  526,  526,  526,  658,  658,
			  658,  563,  525,  527,  527,  527,  527,  527,  528,  528,
			  528,  528,  528,  529,  529,  529,  529,  529,  530,  530,
			  530,  530,  530,  531,  531,  531,  531,  531,  563,  525,
			  526,  532,    0,  532,    0,  658,  532,  532,  532,  532,
			  532,  533,  533,  533,  533,  533,  537,  537,  564,  537,
			  529,  536,  536,  536,  536,  536,  538,  538,    0,  538,
			  543,  539,  539,    0,  539,    0,  536,  540,  540,  537,

			  540,  541,  541,  537,  541,  564,  543,    0,  565,  538,
			  543,    0,    0,  538,  539,  542,  542,    0,  542,  567,
			  540,    0,  539,  536,  541,  544,  544,    0,  544,    0,
			  537,    0,    0,  543,  540,  565,  546,  546,  542,  546,
			  538,  545,  545,    0,  545,    0,  567,    0,  544,  539,
			  542,  547,  547,    0,  547,  548,  548,  568,  548,  546,
			  556,  540,  549,  549,  545,  549,    0,  544,  552,  552,
			  556,  552,  545,  570,  547,    0,    0,  542,  548,  546,
			  556,    0,    0,    0,  568,  549,  548,  553,  553,  571,
			  553,  552,  549,  547,  544,  554,  554,  556,  554,  545,

			  570,  550,  550,  550,  550,  550,  546,  572,  555,  555,
			  553,  555,  557,  548,  573,  574,  571,  575,  554,  549,
			  547,  550,  557,  576,  554,  577,  578,  550,  553,  579,
			  580,  555,  557,  581,  572,  582,  584,  585,  555,  586,
			  588,  573,  574,    0,  575,    0,    0,    0,  550,  557,
			  576,  554,  577,  578,  550,  553,  579,  580,    0,  624,
			  581,    0,  582,  584,  585,  555,  586,  588,  589,  589,
			  589,  589,  589,  590,  590,  590,  590,  590,  591,  591,
			  591,  591,  591,  592,    0,  592,  624,    0,  592,  592,
			  592,  592,  592,  593,  596,  593,    0,    0,  593,  593,

			  593,  593,  593,  594,  594,  594,  594,  594,  595,  595,
			  595,  595,  595,    0,  608,  608,  596,  608,    0,    0,
			    0,  596,  597,  597,  597,  597,  597,  598,  598,  598,
			  598,  598,  600,  600,  600,  600,  600,  608,    0,    0,
			  594,  601,  601,  601,  601,  601,  602,  602,  602,  602,
			  602,  604,  604,  604,  604,  604,  605,  611,  605,  625,
			    0,  605,  605,  605,  605,  605,  604,  606,  606,    0,
			  606,  607,  607,  611,  607,  609,  609,  611,  609,  610,
			  610,    0,  610,    0,  612,  612,  625,  612,  604,    0,
			  606,    0,    0,  604,  607,  618,  613,  613,  609,  613,

			  611,  626,  610,  628,  609,    0,  607,  612,  606,  614,
			  614,  618,  614,  615,  615,  618,  615,  616,  616,  613,
			  616,  617,  617,    0,  617,  630,  619,  619,  626,  619,
			  628,  609,  614,  607,  634,  606,  615,  637,  618,  640,
			  616,  642,  620,  620,  617,  620,  644,  621,  621,  619,
			  621,    0,  630,  645,  616,  646,  614,  619,  647,    0,
			    0,  634,    0,    0,  637,  620,  640,    0,  642,    0,
			  621,    0,    0,  644,  674,  620,  675,  676,  621,    0,
			  645,  616,  646,  614,  619,  647,  649,  649,  649,  649,
			  649,  650,  650,  650,  650,  650,  651,  651,  651,  651,

			  651,  674,  620,  675,  676,  621,  652,  652,  652,  652,
			  652,  653,  653,  653,  653,  653,  654,    0,  654,    0,
			    0,  654,  654,  654,  654,  654,    0,    0,  650,  657,
			  657,  657,  657,  657,  659,  659,  659,  659,  659,  660,
			  660,  660,  660,  660,  661,  661,  661,  661,  661,  659,
			  662,  662,    0,  662,  663,  663,  677,  663,  668,  664,
			  664,    0,  664,  666,  666,    0,  666,    0,  678,  667,
			  667,  659,  667,  662,  668,    0,  659,  663,  668,  662,
			    0,  661,  664,  677,  669,  669,  666,  669,  663,    0,
			  664,  681,  667,  670,  670,  678,  670,    0,  667,  671, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  671,  668,  671,  682,  683,  684,  662,  669,  672,  673,
			  686,  706,  672,  673,  669,  663,  670,  664,  681,    0,
			  707,  708,  671,  711,  670,  667,    0,    0,  672,  673,
			  682,  683,  684,  762,  762,  762,  762,  686,  706,  672,
			  673,  669,  687,  687,  687,  687,  687,  707,  708,    0,
			  711,  670,  689,  689,  689,  689,  689,  690,  690,  690,
			  690,  690,  691,  691,  691,  691,  691,  692,  692,  692,
			  692,  692,  693,  693,  693,  693,  693,    0,    0,  687,
			  694,  694,  694,  694,  694,  696,  696,  696,  696,  696,
			  697,  697,    0,  697,  690,  698,  698,    0,  698,  704,

			  712,  699,  699,  704,  699,  700,  700,  714,  700,  702,
			  702,    0,  702,  697,  703,  703,    0,  703,  698,  704,
			  726,  705,  696,  697,  699,  705,    0,  712,  700,    0,
			  704,    0,  702,    0,  714,    0,  700,  703,  698,    0,
			  727,  705,  716,  716,  716,  716,  716,  726,    0,    0,
			  697,  728,  705,  721,  721,  729,  721,  703,  718,  718,
			  718,  718,  718,  700,  719,  698,  719,  727,  730,  719,
			  719,  719,  719,  719,  720,  720,  721,  720,  728,  716,
			  722,  722,  729,  722,  703,  731,  723,  723,  740,  723,
			  733,  733,  733,  733,  733,  730,    0,  720,  745,    0,

			  721,  719,  752,  722,    0,  720,    0,  734,  734,  723,
			  734,    0,  731,  735,  735,  740,  735,  736,  736,    0,
			  736,  738,  722,  737,  737,  745,  737,  721,  738,  752,
			  734,  739,  720,  723,  748,  748,  735,  748,  739,    0,
			  736,  738,  780,  780,  780,  780,  737,    0,    0,  722,
			  734,  739,    0,  749,  749,  738,  749,  748,    0,    0,
			  723,  753,  737,    0,    0,  739,  746,  746,  746,  746,
			  746,  747,  747,  747,  747,  747,  749,  734,  750,  751,
			  754,  748,  754,  759,  749,  750,  751,    0,  753,  737,
			  754,  755,  755,    0,  755,    0,  765,    0,  750,  751,

			  756,  756,  767,  756,  764,  764,  765,  764,  748,    0,
			  759,  749,  750,  751,  755,    0,  765,  754,  761,  761,
			  761,  761,  761,  756,  766,    0,    0,  764,    0,  767,
			  755,    0,  771,  765,  766,  764,  768,  768,  768,  768,
			  768,    0,  771,    0,  766,  769,  769,  769,  769,  769,
			  770,  770,  771,  770,  772,    0,  775,  755,  775,    0,
			    0,  766,  764,    0,  772,    0,  775,    0,    0,  771,
			  789,  789,  789,  770,  772,  774,  774,  774,  774,  774,
			  778,  778,  778,  778,  778,  779,  779,  779,  779,  779,
			  782,  772,  783,  775,  784,  784,  784,  784,  784,  785,

			  785,  785,  785,  785,  786,  787,  782,  789,  783,    0,
			  782,    0,  783,  788,  788,  788,  788,  788,    0,    0,
			  786,  787,    0,    0,  786,  787,  792,  792,  792,  792,
			  792,    0,    0,  782,    0,  783,  793,  793,  793,  793,
			  793,  794,  794,  794,  794,  794,    0,  786,  787,  796,
			  796,  796,  796,  796,  797,    0,  797,    0,    0,  797,
			  797,  797,  797,  797,  798,  798,  798,  798,  798,  799,
			  799,  799,  799,  799,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  797,  801,  801,  801,  801,  801,  801,  801,  801,

			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  805,  805,    0,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,

			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,    0,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  806,  806,    0,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  807,  807,  807,    0,    0,    0,
			    0,    0,    0,    0,  807,  807,    0,  807,    0,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,

			  807,  807,  807,  807,  807,  807,  807,  807,    0,    0,
			  807,  807,  807,  807,  807,  807,  807,  807,  808,  808,
			    0,  808,  808,    0,  808,  808,    0,    0,    0,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,    0,    0,
			  808,  808,  808,  808,  808,  808,  808,  808,  809,  809,
			    0,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  810,  810,    0,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			    0,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  812,

			  812,  812,  812,  812,  812,  812,  812,  812,  812,    0,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  813,  813,  813,    0,
			    0,    0,    0,  813,  813,    0,  813,  813,    0,    0,
			    0,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			    0,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,

			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  816,  816,    0,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,

			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,    0,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,

			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  819,    0,    0,    0,  819,
			  819,    0,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,    0,    0,  819,  819,  819,  819,  819,
			  819,  819,  819,  820,  820,    0,  820,  820,    0,  820,
			  820,  820,    0,    0,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,    0,    0,  820,  820,  820,  820,  820,

			  820,  820,  820,  821,  821,  821,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  821,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  823,  823,  823,    0,    0,

			    0,    0,  823,  823,    0,  823,  823,    0,    0,    0,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,    0,
			    0,  823,  823,  823,  823,  823,  823,  823,  823,  824,
			  824,  824,    0,    0,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,    0,    0,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,    0,    0,  824,  824,  824,  824,
			  824,  824,  824,  824,  825,  825,  825,    0,    0,    0,
			    0,  825,  825,    0,  825,  825,    0,    0,    0,  825,

			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,    0,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,    0,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800, yy_Dummy>>,
			1, 1764, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   86,   91,   73,   74,    0,    0,  179,
			    0,   65,   68,  890, 4675,   95,  871,  844,  860, 4675,
			   87, 4675, 4675, 4675, 4675, 4675,  849,   85,  843,   94,
			  113, 4675, 4675,  829, 4675,  816,  810,  266,  115,  270,
			  275,  279,  285,  304,  311,  319,  349,  418,  360,  388,
			  374,  353,  282, 4675, 4675,  760,  493,  568,   80,   82,
			  305,   86,  344,   94,   84,  358,  298,   98,   88,  225,
			  786, 4675, 4675,  790,  154, 4675,  115,  364,  304,  387,
			  342,  390,  321, 4675,  379,  742, 4675,  446,  542,  569,
			  643, 4675,   75,  695, 4675,  158,  769, 4675,  764, 4675,

			  756,    0,  640,  757,  736,  633, 4675,  460,  486,  654,
			  466,  664, 4675, 4675, 4675,  450,  744,    0,  748,  752,
			  756,  761,  765,  773,  777,  790,  804,  819,  814,  831,
			  838,  856,  846,  847,  863,  895,  968,  899,  915,  914,
			  950,  975,  923,  979,  960,  725,  777,  669, 4675,  284,
			  709, 1027,  701,  320,  349,    0,  683,  369,  385,  391,
			  392,  420,  658,  422,  826,  437,  447,  555,  551,  692,
			  690,  579,  656,  656,  623,  963,  652,  636,  711,  717,
			  746,  773,  776,  794,  795,  813,  840,  862,  865,  905,
			  897,  962,  899,  949,  956,  952,  956, 4675,  688, 4675,

			  313, 4675, 4675,  959,  972,  988, 1024, 1027,  996, 4675,
			  999,  627, 4675,  279, 1005, 1015, 1058, 4675, 1110,  574,
			 1163, 1054,  249, 1250, 4675, 4675,  644, 1114, 4675, 4675,
			 4675,  660, 1108,  656,  654,  647,  641,  516, 4675, 1283,
			 1118, 1124, 1129, 4675, 1289, 1139, 1251, 1046, 1238, 4675,
			  569, 1310, 1315, 1321, 1329, 1334, 1353, 1358, 1362, 1338,
			 1367, 1388, 1403, 1407, 1413, 1417, 1431, 1443, 1460, 1470,
			 1491, 1481, 1512, 1520, 1439, 1464, 1528, 1549, 1495, 1553,
			 1557, 1564, 1570, 1574, 1581, 1598, 1602,  562, 4675, 4675,
			  558,  974,    0, 1610, 1627,  995,    0, 1020, 1045, 1102,

			 1277, 1277, 1292, 1293, 1303, 1324,  455, 1329,  454, 1570,
			 1347, 1357, 1360, 1363, 1377, 1390, 1401, 1409, 1416,    0,
			    0, 1455, 1510, 1498, 1528, 1525, 1561, 1571, 1578, 1571,
			 1571,  447, 1573, 1582,  445,    0,    0, 1584, 1585, 1368,
			  359, 1574,  868, 1589, 1602, 1609, 4675,  493, 1662, 1672,
			 1071, 1118,  486, 1677, 4675, 4675, 1676, 4675, 4675, 4675,
			 4675, 1681, 1687, 1698, 1708, 1713, 1724, 1741, 1729, 1746,
			 1751, 1767, 1756, 1772,  449, 1793, 1797, 1802, 1806, 1810,
			 1814, 1821, 1800, 1839, 1851, 1856, 1866, 1881, 1885, 1896,
			 1915, 1876, 1943, 1949, 1970, 1979, 1992, 1998, 1924, 1949,

			 1865, 1982, 2001, 2029, 2033, 2038, 1259,    0, 1607, 1615,
			 1674, 1675,    0, 1666, 1668,    0, 1757, 1765, 1803, 1814,
			 1812, 1815, 1816, 1834, 1841, 1849, 1846, 1857, 1869, 1880,
			 1874, 1875, 1913, 1939,    0,    0,    0,    0, 1948, 1983,
			 2010, 1979, 2001,  445,  411, 4675, 1273, 1516, 2049, 2059,
			 2065, 2072,  404, 2082, 2098, 2103, 2108, 2113, 2125,  394,
			 2130, 2151, 2141,  309, 2157, 2136, 2174, 2178, 2182, 2190,
			  388, 2195, 2211, 2216, 2221, 2232, 2237, 2242, 2263, 2248,
			 2268, 2296, 2263, 2318, 2327, 2294, 2269, 2297, 1719, 2043,
			 2339,  350,  349, 1998, 2074, 2142, 2305, 2146, 2313,    0,

			 2167,    0, 2196, 2200, 2240,    0, 2244, 2246, 2277, 2293,
			 2298, 2304, 2315, 2307, 2321, 2322, 2323, 2316, 2323, 2333,
			 2334, 2382, 2350, 2388, 2356, 2399, 2405, 2415, 2420, 2425,
			 2430, 2435, 2448, 2453, 2087, 4675, 2463, 2474, 2484, 2489,
			 2495, 2499, 2513, 2462, 2523, 2539, 2534, 2549, 2553, 2560,
			 2583,  375, 2566, 2585, 2593, 2606, 2532, 2584, 2207, 4675,
			 4675, 2356, 2359, 2402, 2445, 2469,    0, 2486, 2518,    0,
			 2536, 2545, 2574, 2569, 2571, 2584, 2578, 2581, 2582, 2596,
			 2598, 2600, 2603,    0, 2593, 2606, 2607,    0, 2597, 2650,
			 2655, 2660, 2670, 2680, 2685, 2690, 2661, 2704, 2709,  338,

			 2714, 2723, 2728, 4675, 2733, 2743, 2765, 2769, 2712, 2773,
			 2777, 2729, 2782, 2794, 2807, 2811, 2815, 2819, 2767, 2824,
			 2840, 2845,  312,  287, 2616, 2722, 2764,    0, 2772,    0,
			 2794,    0,    0,    0, 2785,    0,    0, 2788,    0,    0,
			 2800,    0, 2802,    0, 2813, 2818, 2822, 2825,  230, 2868,
			 2873, 2878, 2888, 2893, 2903,  228,  562, 2911, 2415, 2916,
			 2921, 2926, 2948, 2952, 2957, 4675, 2961, 2967, 2930, 2982,
			 2991, 2997, 2980, 2981, 2843, 2840, 2841, 2923, 2935,    0,
			    0, 2960, 2972, 2972, 2972,    0, 2978, 3024,  224, 3034,
			 3039, 3044, 3049, 3054, 3062, 4675, 3067, 3088, 3093, 3099,

			 3103, 4675, 3107, 3112, 3071, 3093, 2976, 2975, 2976,    0,
			    0, 2990, 3067,    0, 3062,    0, 3124,  225, 3140, 3151,
			 3172, 3151, 3178, 3184,  452, 4675, 3087, 3091, 3102, 3111,
			 3124, 3136,  147, 3172, 3205, 3211, 3215, 3221, 3193, 3203,
			 3143,    0,    0,    0,    0, 3157, 3248, 3253, 3232, 3251,
			 3250, 3251, 3153, 3228, 3267, 3289, 3298,  138,  122, 3242,
			    0, 3300, 3015, 4675, 3302, 3268, 3296, 3269, 3318, 3327,
			 3348, 3304, 3326,    0, 3357, 3343,  118,   88, 3362, 3367,
			 3224, 4675, 3362, 3364, 3376, 3381, 3376, 3377, 3395, 3357,
			 4675, 4675, 3408, 3418, 3423, 4675, 3431, 3441, 3446, 3451,

			 4675, 3491, 3538, 3585, 3632, 3679, 3726, 3772, 3812, 3857,
			 3904, 3951, 3998, 4044, 4089, 4136, 4183, 4230, 4277, 4317,
			 4357, 4401, 4447, 4493, 4538, 4582, 4627, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  800,    1,  801,  801,  802,  802,  803,  803,  800,
			    9,  804,  804,  800,  800,  800,  800,  800,  805,  800,
			  806,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  808,  800,  800,  809,  800,  800,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  800,  800,  800,  810,  800,  800,  800,  810,  810,  810,
			  810,  810,  811,  800,  811,  812,  800,  813,  800,  813,
			  813,  800,  814,  815,  800,  800,  800,  800,  805,  800,

			  816,  816,  816,  817,  800,  800,  800,  800,  818,  800,
			  800,  800,  800,  800,  800,  800,  807,  819,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,   47,  807,  807,  807,  807,   47,  807,
			  807,  807,  807,  807,  807,  820,  808,  809,  800,  800,
			  800,   57,  800,  151,  151,   57,   57,   57,   57,  151,
			   57,  151,  151,   57,   57,  151,  151,   57,   57,  151,
			   57,  151,  151,  151,   57,   57,   57,  151,   57,  151,
			   57,  151,  151,   57,   57,  151,  151,   57,   57,  151,
			  151,   57,   57,  151,   57,  151,   57,  800,  810,  800,

			  800,  800,  800,  810,  810,  810,  810,  810,  811,  800,
			  811,  812,  800,  812,  813,  800,  813,  800,  800,  800,
			  800,  800,  814,  815,  800,  800,  223,  821,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  819,  807,  807,  807,  807,  807,  807,  807,  807,  800,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  136,  136,  136,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  800,  800,  800,
			  800,  151,  151,  800,  151,   57,   57,  151,   57,  151,

			  151,  151,   57,   57,   57,  151,  151,   57,   57,  800,
			  151,  151,  151,  151,   57,   57,   57,  151,   57,  151,
			   57,  151,  151,   57,   57,  151,  151,   57,   57,  151,
			  151,  151,   57,   57,   57,  151,   57,  151,   57,  810,
			  810,  810,  810,  810,  810,  810,  800,  822,  822,  800,
			  822,  822,  822,  821,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  819,  807,  807,  807,  807,  807,
			  807,  807,  800,  807,  807,  807,  807,  807,  807,  807,
			  136,  136,  390,  390,  807,  133,  394,  394,  807,  807,

			  800,  807,  807,  807,  807,  807,  823,  824,  151,   57,
			  151,   57,  151,  151,  151,   57,   57,   57,  151,  151,
			   57,  151,  151,  151,  151,   57,   57,   57,  151,   57,
			  151,  151,   57,   57,  151,  151,   57,   57,  151,  151,
			  151,   57,   57,  151,   57,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  818,  800,  800,  800,  807,  807,  807,  807,  807,  807,
			  800,  807,  807,  807,  807,  807,  807,  807,  394,  807,
			  394,  480,  800,  807,  807,  807,  807,  800,  800,  825,
			  823,  151,   57,  151,   57,  151,  151,   57,   57,  151,

			  151,   57,  151,  151,  151,  151,   57,   57,   57,  151,
			   57,  151,  151,   57,   57,  151,  151,  151,  151,   57,
			   57,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  826,  807,  807,  807,
			  807,  807,  807,  800,  807,  807,  807,  807,  807,  807,
			  480,  800,  807,  807,  807,  807,  800,  800,  825,  800,
			  800,  151,  151,   57,  151,  151,  151,   57,   57,   57,
			  151,  151,  151,  151,   57,   57,   57,  151,   57,  151,
			  151,   57,   57,  151,  151,  151,  151,   57,   57,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  807,  807,  807,  807,
			  807,  800,  807,  807,  807,  807,  807,  807,  800,  807,
			  807,  807,  800,  800,  151,  151,   57,  151,  151,   57,
			   57,  151,  151,  151,  151,   57,   57,   57,  151,   57,
			  151,  151,   57,   57,  151,  151,  151,   57,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  807,  807,  807,  800,  807,  807,  800,  807,
			  807,  807,  800,  800,  151,  151,   57,  151,   57,  151,
			   57,  151,   57,  151,  151,  151,   57,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  807,  807,  807,

			  807,  800,  807,  807,  800,  800,  151,  151,   57,  151,
			   57,  151,   57,  151,  151,   57,  800,  800,  800,  800,
			  807,  807,  807,  807,  800,  800,  151,  151,   57,  151,
			   57,  151,  800,  800,  807,  807,  807,  807,  800,  800,
			  151,  151,   57,  151,   57,  151,  800,  800,  807,  807,
			  800,  800,  151,  151,  800,  807,  807,  800,  800,  151,
			  151,  800,  800,  800,  807,  800,  800,  151,  800,  800,
			  807,  800,  800,  151,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			    0,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800, yy_Dummy>>)
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
			   66,   65,   68,    0,  120,  123,  123,  121,  117,  118,
			  119,  103,    0,  103,    0,    0,  103,    0,    0,    0,
			  102,   99,    0,    0,   92,   91,   91,   38,   91,   91,
			   91,   91,    0,   91,   91,   91,   91,   91,   91,   91,
			   91,   77,   91,   91,   91,   91,   77,   77,   77,   37,

			    0,   44,   91,   91,   91,   91,   64,   60,   94,   94,
			   94,   94,   38,   94,   94,   38,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   37,   44,   37,   44,   94,   94,
			   94,   94,   94,   94,   94,   67,   66,   65,  103,  103,
			    0,    0,  100,  103,    0,  102,    0,  102,    0,    0,
			    0,   99,   74,    0,   91,   91,   91,   91,   45,   91,
			    0,   91,   91,   91,   36,   91,   91,   91,   79,   78,
			   91,   91,    0,   91,   91,   91,   91,    0,   64,   64,
			    0,   94,   94,   94,   94,   94,   94,   94,   94,   45,

			   94,   45,   94,   94,   94,   36,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,    0,  103,    0,  106,  103,  102,    0,    0,  102,
			    0,    0,  101,    0,    0,   74,    0,   91,   91,   91,
			   91,   47,   91,    0,   91,   91,   91,   91,   91,   91,
			   91,    0,   53,   91,   91,   91,    0,    0,    0,   62,
			   61,   94,   94,   94,   94,   94,   47,   94,   94,   47,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   53,   94,   94,   94,   53,   94,    0,
			  103,    0,    0,    0,  102,    0,  106,  102,    0,   76,

			    0,    0,    0,  104,  106,  104,   91,   91,   59,   91,
			   46,    0,   43,   58,   91,   35,   91,   51,    0,   91,
			   91,   91,    0,    0,   94,   94,   94,   59,   94,   59,
			   94,   46,   43,   58,   94,   43,   58,   94,   35,   35,
			   94,   51,   94,   51,   94,   94,   94,   94,  106,    0,
			  106,    0,  102,    0,    0,  105,    0,    0,   73,  106,
			    0,  105,   91,   91,   91,   82,   54,   91,    0,   91,
			   91,   55,    0,    0,   94,   94,   94,   94,   94,   54,
			   54,   94,   94,   94,   94,   55,   94,  106,  105,    0,
			  105,    0,    0,    0,    0,   73,  105,   91,   91,   48,

			   91,   81,   52,   91,    0,    0,   94,   94,   94,   48,
			   48,   94,   94,   52,   94,   52,  105,   75,    0,   73,
			   91,   91,   91,   91,   80,   80,   94,   94,   94,   94,
			   94,   94,    0,    0,   91,   50,   49,   91,    0,    0,
			   94,   50,   50,   49,   49,   94,    0,    0,   91,   91,
			    0,    0,   94,   94,   72,   91,   56,    0,    0,   94,
			   56,    0,    0,   72,   91,    0,    0,   94,    0,    0,
			   57,    0,    0,   57,    0,   71,    0,    0,    0,    0,
			    0,   71,    0,    0,    0,    0,    0,    0,    0,   70,
			   83,   84,    0,    0,    0,   70,    0,   70,    0,    0,

			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4675
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 800
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 801
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
