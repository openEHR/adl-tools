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
if yy_act <= 63 then
if yy_act <= 32 then
if yy_act <= 16 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 78 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 78")
end
-- Ignore separators
else
--|#line 79 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 79")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 84 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 84")
end
-- Ignore comments
else
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 89 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 89")
end
last_token := Minus_code
else
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Star_code
else
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Caret_code
else
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Dot_code
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Comma_code
else
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Exclamation_code
else
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
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
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Right_parenthesis_code
else
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := SYM_DT_UNKNOWN
else
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := Left_bracket_code
end
else
if yy_act = 23 then
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := Right_bracket_code
else
--|#line 112 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 112")
end
last_token := SYM_START_CBLOCK
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_END_CBLOCK
else
--|#line 115 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 115")
end
last_token := SYM_GE
end
else
if yy_act = 27 then
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := SYM_LE
else
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_NE
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_LT
else
--|#line 120 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 120")
end
last_token := SYM_GT
end
else
if yy_act = 31 then
--|#line 122 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 122")
end
last_token := SYM_MODULO
else
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
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
--|#line 125 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 125")
end
last_token := SYM_ELLIPSIS
else
--|#line 126 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 126")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 35 then
--|#line 130 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 130")
end
last_token := SYM_MATCHES
else
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_MATCHES
end
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 136 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 136")
end
last_token := SYM_THEN
else
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_ELSE
end
else
if yy_act = 39 then
--|#line 140 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 140")
end
last_token := SYM_AND
else
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_OR
end
end
end
else
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_XOR
else
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_NOT
end
else
if yy_act = 43 then
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_IMPLIES
else
--|#line 150 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 150")
end
last_token := SYM_TRUE
end
end
else
if yy_act <= 46 then
if yy_act = 45 then
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_FALSE
else
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
end
last_token := SYM_FORALL
end
else
if yy_act = 47 then
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_EXISTS
else
--|#line 160 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 160")
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
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_OCCURRENCES
else
--|#line 164 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 164")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 51 then
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_ORDERED
else
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_UNORDERED
end
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_UNIQUE
else
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_INFINITY
end
else
if yy_act = 55 then
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_USE_NODE
else
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
end
else
if yy_act <= 60 then
if yy_act <= 58 then
if yy_act = 57 then
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 59 then
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end
last_token := SYM_EXCLUDE
else
--|#line 186 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 186")
end

	last_token := V_URI
	last_string_value := text

end
end
else
if yy_act <= 62 then
if yy_act = 61 then
--|#line 192 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 192")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 197 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 197")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

					last_token := V_LOCAL_TERM_CODE_REF
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
--|#line 219 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 219")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 227 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 227")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
else
if yy_act = 66 then
--|#line 234 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 234")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 240 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 240")
end
	-- ignore comments
				do_nothing
			
end
end
else
if yy_act <= 69 then
if yy_act = 68 then
--|#line 244 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 244")
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
--|#line 265 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 265")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 70 then
--|#line 272 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 272")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 273 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 273")
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
--|#line 274 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 274")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 281 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 281")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 282 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 282")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 289 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 289")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 290 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 290")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 297 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 297")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 78 then
--|#line 298 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 298")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 305 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 305")
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
--|#line 317 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 317")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 327 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 327")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 82 then
--|#line 332 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 332")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 342 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 342")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 348 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 348")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 358 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 358")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 86 then
--|#line 359 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 359")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 373 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 373")
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
--|#line 379 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 379")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 385 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 385")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 90 then
--|#line 389 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 389")
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
--|#line 430 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 430")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 436 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 436")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 442 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 442")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 94 then
--|#line 448 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 448")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 455 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 455")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
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
--|#line 461 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 461")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 468 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 468")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
end
else
if yy_act = 98 then
--|#line 472 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 472")
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
--|#line 483 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 483")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
end
else
if yy_act <= 101 then
if yy_act = 100 then
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
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
if yy_act = 102 then
	yy_end := yy_end - 1
--|#line 510 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 510")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 511 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 511")
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
--|#line 512 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 512")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 516 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 516")
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
--|#line 517 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 517")
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
--|#line 518 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 518")
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
--|#line 538 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 538")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
if yy_act = 110 then
--|#line 551 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 551")
end
in_buffer.append_character ('\')
else
--|#line 553 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 553")
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
--|#line 555 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 555")
end

				in_buffer.append_string (text)
	
else
--|#line 559 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 559")
end
in_buffer.append_string (text)
end
else
if yy_act = 114 then
--|#line 561 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 561")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
--|#line 566 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 566")
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
--|#line 577 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 577")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 118 then
--|#line 588 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 588")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
end
else
if yy_act <= 123 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 590 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 590")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 122 then
--|#line 592 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 592")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 125 then
if yy_act = 124 then
--|#line 595 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 595")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 599 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 599")
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
			create an_array.make (0, 4948)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
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

			   95,  105,  224,  106,  106,  106,  106,  106,  108,  160,
			  109,  791,  110,  110,  110,  110,  110,  116,  116,  162,
			  116,  170,  202,  178,  180,   84,   84,  108,  194,  109,
			  163,  112,  112,  112,  112,  112,  161,  190,   76,  102,
			  118,  790,  191,   76,   94,  774,  164,   94,  171,  111,
			  179,  181,   85,   85,  225,  195,  201,  165,  201,  201,
			   95,  773,   95,   95,  192,  754,  754,  203,  111,  193,
			   77,   78,   79,   80,   81,   77,   78,   79,   80,   81,
			   86,   87,   88,   86,   87,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   89,   90,   86,   90,   90,   90,

			   90,   90,   86,   86,   86,   86,   86,   86,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   86,   86,   91,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,  116,  116,
			  740,  116,  116,  116,  196,  116,  224,  116,  116,  534,
			  116,  116,  116,  463,  116,  455,  150,  116,  116,  150,
			  116,  118,  146,  146,  151,  118,  348,  146,  146,  121,

			  118,  197,  681,  119,  118,  120,  116,  116,  124,  116,
			  118,  200,  122,  116,  116,  201,  116,  201,  201,  125,
			  126,  116,  116,  123,  116,  543,  121,  680,  225,  118,
			  119,  214,  120,  186,  166,  124,  118,  146,  210,  122,
			  130,  187,  127,  128,  118,  167,  125,  126,  129,  200,
			  123,  116,  116,  664,  116,  116,  116,  293,  116,  131,
			  188,  168,  116,  116,  111,  116,  200,  130,  189,  127,
			  128,  200,  169,  211,  118,  129,  116,  116,  118,  116,
			  132,  294,  172,  173,  293,  118,  131,  205,  174,  182,
			  116,  116,  133,  116,  200,  140,  213,  200,  626,  118,

			  212,  183,  145,  141,  569,  569,  293,  132,  294,  175,
			  176,  550,  538,  118,  144,  177,  184,  294,  108,  133,
			  116,  116,  140,  116,  207,  207,  494,  142,  185,  145,
			  141,  211,  143,  297,  299,  299,  134,  134,  134,  134,
			  134,  144,  205,  118,  298,  204,  204,  204,  215,  216,
			  135,  215,  116,  116,  142,  116,  136,  746,  212,  143,
			  494,  299,  300,  137,  301,  138,  301,  139,  206,  206,
			  206,  208,  208,  208,  307,  251,  377,  135,  244,  244,
			  244,  244,  244,  136,  250,  250,  250,  250,  250,  450,
			  308,  301,  138,  304,  139,  150,  450,  747,  150,  218,

			  445,  307,  445,  151,  246,  246,  246,  246,  246,  424,
			  424,  152,  152,  152,  152,  152,  153,  308,  239,  247,
			  239,  239,  152,  152,  152,  152,  152,  152,  152,  152,
			  154,  152,  155,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  216,  216,  247,  216,  152,  156,
			  156,  157,  156,  156,  156,  156,  156,  158,  156,  159,
			  156,  156,  156,  156,  156,  157,  156,  156,  156,  156,
			  150,  219,  216,  150,  219,  412,  220,  220,  151,  220,
			  699,  699,  699,  220,  221,  411,  152,  152,  152,  152,
			  152,  153,  307,  222,  308,  218,  377,  152,  152,  152,

			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  309,
			  312,  310,  218,  152,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  219,  216,  312,  219,  232,
			  362,  241,  241,  241,  241,  241,  361,  220,  233,  233,
			  233,  233,  233,  360,  312,  359,  242,  222,  108,  356,
			  109,  808,  248,  248,  248,  248,  248,  249,  108,  214,
			  109,  319,  248,  248,  248,  248,  248,  313,  243,  302,
			  314,  316,  234,  242,  303,  200,  218,  227,  227,  295,

			  227,  296,  296,  296,  296,  296,  235,  315,  319,  111,
			  236,  315,  237,  311,  313,  261,  302,  314,  292,  111,
			  291,  303,  228,  149,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  116,  116,  289,  116,
			  116,  116,  240,  116,  116,  116,  319,  116,  116,  116,
			  239,  116,  321,  116,  116,  238,  116,  116,  116,  118,
			  116,  231,   99,  118,  229,  116,  116,  118,  116,  116,
			  116,  118,  116,  320,  254,  253,  118,  146,  146,  321,
			  118,  321,  116,  116,   96,  116,  257,  214,  118,  255,

			  289,  258,  118,  200,  323,  256,  116,  116,  198,  116,
			  259,  254,  253,  261,  149,  118,  116,  116,  322,  116,
			  260,  116,  116,  257,  116,  115,  255,  324,  258,  118,
			  290,  323,  256,  116,  116,  313,  116,  259,  314,  118,
			  116,  116,  114,  116,  118,  262,  323,  260,  116,  116,
			  263,  116,  302,  264,  324,  113,  118,  303,  116,  116,
			  107,  116,  317,  118,  270,  318,  270,  324,  104,  265,
			   99,  118,  262,  325,  327,  328,  266,  263,  269,  305,
			  264,  118,  271,  267,  306,  272,   97,  268,  273,   96,
			  116,  116,  808,  116,  326,  117,  808,  274,  327,  275,

			  808,  327,  328,  266,  808,  269,  808,  328,  333,  271,
			  267,  808,  272,  118,  268,  273,  116,  116,  331,  116,
			  116,  116,  332,  116,  274,  329,  275,  117,  117,  117,
			  117,  117,  808,  276,  330,  333,  808,  116,  116,  118,
			  116,  116,  116,  118,  116,  331,  135,  331,  808,  332,
			  135,  332,  116,  116,  276,  116,  333,  337,  117,  276,
			  118,  138,  808,  276,  118,  808,  337,  339,  281,  808,
			  282,  339,  286,  135,  334,  118,  413,  135,  335,  116,
			  116,  808,  116,  336,  337,  117,  200,  808,  138,  116,
			  116,  210,  116,  338,  339,  281,  283,  282,  340,  286, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  213,  200,  118,  413,  200,  277,  277,  277,  277,  277,
			  200,  808,  118,  284,  200,  116,  116,  285,  116,  413,
			  415,  415,  278,  283,  417,  279,  211,  116,  116,  808,
			  116,  280,  418,  419,  417,  211,  215,  216,  118,  215,
			  284,  418,  216,  216,  285,  216,  414,  415,  416,  278,
			  118,  417,  279,  212,  222,  222,  287,  222,  280,  418,
			  419,  420,  212,  341,  342,  343,  344,  345,  421,  219,
			  216,  419,  219,  423,  288,  204,  204,  204,  204,  204,
			  204,  220,  808,  287,  346,  346,  346,  218,  347,  347,
			  347,  222,  808,  218,  355,  355,  808,  355,  422,  423,

			  423,  288,  808,  808,  808,  219,  216,  426,  219,  357,
			  358,  358,  358,  358,  358,  808,  365,  220,  365,  228,
			  218,  366,  366,  366,  366,  366,  425,  222,  367,  367,
			  367,  367,  367,  808,  426,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  218,  349,  350,  351,
			  349,  350,  349,  349,  349,  349,  349,  349,  349,  349,
			  352,  221,  221,  349,  221,  221,  221,  221,  221,  349,
			  353,  349,  349,  349,  349,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  349,  349,  354,
			  349,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  227,  227,  808,  227,  368,
			  368,  368,  368,  368,  372,  808,  372,  808,  808,  373,
			  373,  373,  373,  373,  375,  375,  375,  375,  808,  427,
			  228,  808,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  238,  238,  427,  238,  364,  364,

			  364,  364,  364,  808,  369,  369,  369,  369,  369,  352,
			  451,  808,  352,  242,  808,  116,  116,  363,  116,  370,
			  808,  108,  229,  109,  808,  374,  374,  374,  374,  374,
			  376,  376,  376,  376,  376,  243,  116,  116,  118,  116,
			  242,  371,  116,  116,  428,  116,  370,  116,  116,  429,
			  116,  116,  116,  378,  116,  353,  452,  808,  353,  118,
			  116,  116,  111,  116,  808,  118,  116,  116,  808,  116,
			  118,  428,  379,  808,  118,  385,  429,  808,  380,  426,
			  378,  116,  116,  118,  116,  385,  381,  116,  116,  118,
			  116,  116,  116,  808,  116,  385,  427,  116,  116,  379,

			  116,  428,  382,  433,  118,  380,  430,  808,  383,  433,
			  118,  808,  385,  381,  118,  808,  116,  116,  808,  116,
			  118,  808,  386,  431,  116,  116,  387,  116,  432,  382,
			  433,  388,  435,  808,  384,  383,  434,  116,  116,  118,
			  116,  116,  116,  808,  116,  116,  116,  118,  116,  386,
			  389,  116,  116,  387,  116,  436,  435,  436,  388,  435,
			  118,  808,  808,  439,  118,  440,  390,  808,  118,  393,
			  393,  393,  393,  393,  118,  808,  392,  389,  116,  116,
			  808,  116,  436,  437,  438,  391,  439,  440,  116,  116,
			  439,  116,  440,  390,  394,  394,  394,  394,  394,  116,

			  116,  118,  116,  392,  396,  396,  396,  396,  396,  808,
			  443,  118,  391,  441,  442,  397,  397,  397,  397,  397,
			  200,  395,  118,  355,  355,  808,  355,  116,  116,  444,
			  116,  495,  495,  808,  496,  116,  116,  443,  116,  808,
			  443,  808,  395,  398,  398,  398,  398,  398,  808,  808,
			  118,  399,  399,  399,  399,  399,  444,  444,  118,  117,
			  117,  117,  117,  117,  400,  448,  400,  446,  116,  116,
			  395,  116,  117,  117,  117,  117,  117,  808,  395,  808,
			  116,  116,  448,  116,  447,  401,  498,  498,  402,  117,
			  200,  118,  448,  808,  403,  207,  207,  116,  116,  808,

			  116,  116,  116,  118,  116,  116,  116,  808,  116,  449,
			  280,  808,  401,  498,  499,  402,  117,  404,  405,  500,
			  118,  403,  200,  808,  118,  200,  116,  116,  118,  116,
			  116,  116,  406,  116,  200,  116,  116,  280,  116,  116,
			  116,  200,  116,  808,  404,  407,  500,  116,  116,  118,
			  116,  500,  502,  118,  216,  216,  808,  216,  118,  406,
			  220,  220,  118,  220,  204,  204,  204,  408,  503,  808,
			  118,  295,  407,  295,  295,  295,  295,  295,  501,  502,
			  502,  292,  808,  409,  503,  295,  410,  296,  296,  296,
			  296,  296,  385,  506,  408,  503,  206,  206,  206,  208,

			  208,  208,  385,  222,  222,  218,  222,  504,  204,  204,
			  204,  505,  385,  410,  808,  204,  204,  204,  350,  351,
			  506,  350,  357,  358,  358,  358,  358,  358,  808,  385,
			  352,  453,  453,  453,  453,  453,  495,  495,  808,  495,
			  353,  366,  366,  366,  366,  366,  242,  454,  454,  454,
			  454,  454,  456,  456,  456,  456,  456,  457,  457,  457,
			  457,  457,  458,  458,  458,  458,  458,  808,  243,  354,
			  507,  506,  808,  242,  459,  509,  459,  370,  808,  460,
			  460,  460,  460,  460,  455,  461,  461,  461,  461,  461,
			  373,  373,  373,  373,  373,  808,  808,  507,  508,  371,

			  808,  808,  509,  510,  370,  462,  462,  462,  462,  462,
			  464,  465,  808,  466,  466,  466,  466,  466,  467,  467,
			  467,  467,  467,  468,  468,  468,  468,  468,  116,  116,
			  510,  116,  116,  116,  808,  116,  116,  116,  511,  116,
			  116,  116,  463,  116,  116,  116,  567,  116,  475,  116,
			  116,  118,  116,  808,  808,  118,  808,  808,  475,  118,
			  808,  116,  116,  118,  116,  511,  470,  118,  475,  701,
			  702,  701,  118,  469,  808,  473,  474,  512,  116,  116,
			  471,  116,  808,  472,  118,  475,  116,  116,  489,  116,
			  808,  116,  116,  470,  116,  476,  116,  116,  489,  116,

			  469,  118,  473,  474,  512,  509,  703,  471,  489,  118,
			  472,  808,  808,  808,  118,  478,  510,  116,  116,  118,
			  116,  511,  476,  116,  116,  489,  116,  516,  479,  480,
			  477,  808,  513,  393,  393,  393,  393,  393,  116,  116,
			  118,  116,  478,  514,  808,  270,  118,  270,  515,  394,
			  394,  394,  394,  394,  516,  479,  480,  477,  481,  483,
			  516,  118,  117,  808,  482,  117,  272,  116,  116,  484,
			  116,  117,  518,  519,  518,  117,  808,  396,  396,  396,
			  396,  396,  808,  519,  808,  481,  483,  517,  808,  117,
			  118,  482,  117,  272,  117,  808,  484,  808,  117,  518, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  519,  520,  117,  397,  397,  397,  397,  397,  116,  116,
			  521,  116,  399,  399,  399,  399,  399,  271,  522,  116,
			  116,  117,  116,  808,  398,  398,  398,  398,  398,  808,
			  523,  118,  274,  486,  486,  486,  486,  486,  485,  808,
			  522,  808,  118,  117,  271,  522,  487,  487,  487,  487,
			  487,  808,  488,  488,  488,  488,  488,  523,  523,  274,
			  117,  116,  116,  808,  116,  485,  117,  526,  116,  116,
			  117,  116,  116,  116,  570,  116,  524,  116,  116,  570,
			  116,  808,  559,  808,  118,  527,  525,  117,  808,  808,
			  494,  118,  559,  117,  540,  118,  540,  808,  491,  492,

			  118,  570,  559,  524,  541,  490,  571,  116,  116,  493,
			  116,  808,  808,  525,  453,  453,  453,  453,  453,  559,
			  529,  529,  529,  529,  529,  491,  492,  572,  572,  528,
			  118,  542,  490,  808,  578,  808,  493,  530,  530,  530,
			  530,  530,  531,  531,  531,  531,  531,  532,  532,  532,
			  532,  532,  808,  808,  572,  575,  528,  455,  808,  808,
			  544,  578,  370,  460,  460,  460,  460,  460,  533,  533,
			  533,  533,  533,  535,  535,  535,  535,  535,  536,  536,
			  536,  536,  536,  808,  371,  116,  116,  808,  116,  370,
			  537,  537,  537,  537,  537,  532,  532,  532,  532,  532,

			  116,  116,  808,  116,  808,  534,  116,  116,  118,  116,
			  539,  564,  808,  579,  465,  463,  466,  466,  466,  466,
			  466,  564,  545,  118,  116,  116,  808,  116,  808,  118,
			  546,  565,  808,  116,  116,  808,  116,  539,  116,  116,
			  579,  116,  116,  116,  580,  116,  808,  118,  564,  545,
			  116,  116,  808,  116,  808,  547,  118,  546,  808,  495,
			  495,  118,  496,  808,  808,  118,  548,  581,  549,  551,
			  808,  580,  552,  118,  116,  116,  808,  116,  116,  116,
			  573,  116,  547,  808,  553,  116,  116,  808,  116,  116,
			  116,  574,  116,  548,  581,  549,  551,  118,  808,  552,

			  579,  118,  557,  557,  557,  557,  557,  573,  118,  554,
			  567,  553,  118,  808,  116,  116,  117,  116,  574,  808,
			  556,  808,  808,  808,  808,  566,  555,  582,  486,  486,
			  486,  486,  486,  808,  808,  808,  554,  118,  488,  488,
			  488,  488,  488,  117,  400,  808,  400,  556,  487,  487,
			  487,  487,  487,  555,  558,  573,  808,  395,  117,  580,
			  116,  116,  117,  116,  116,  116,  574,  116,  402,  116,
			  116,  808,  116,  568,  403,  116,  116,  581,  116,  585,
			  585,  558,  576,  118,  587,  117,  583,  118,  588,  117,
			  587,  560,  118,  577,  588,  402,  591,  592,  118,  593,

			  561,  403,  594,  591,  584,  562,  585,  586,  592,  808,
			  632,  587,  600,  563,  808,  588,  808,  589,  560,  808,
			  808,  590,  808,  591,  592,  808,  593,  561,  808,  594,
			  595,  808,  562,  808,  243,  596,  597,  632,  597,  600,
			  563,  598,  598,  598,  598,  598,  598,  598,  598,  598,
			  598,  599,  599,  599,  599,  599,  532,  532,  532,  532,
			  532,  808,  602,  602,  602,  602,  602,  610,  610,  610,
			  610,  601,  603,  603,  603,  603,  603,  604,  604,  604,
			  604,  604,  633,  455,  605,  605,  605,  605,  605,  606,
			  606,  606,  606,  606,  777,  777,  777,  777,  601,  534,

			  607,  607,  607,  607,  607,  608,  808,  608,  808,  633,
			  605,  605,  605,  605,  605,  609,  609,  609,  609,  609,
			  619,  463,  612,  612,  612,  612,  612,  116,  116,  808,
			  116,  808,  116,  116,  808,  116,  619,  613,  116,  116,
			  619,  116,  116,  116,  808,  116,  808,  633,  116,  116,
			  118,  116,  808,  808,  614,  118,  630,  116,  116,  615,
			  116,  118,  808,  619,  613,  118,  630,  116,  116,  616,
			  116,  118,  116,  116,  634,  116,  631,  808,  808,  617,
			  118,  614,  116,  116,  808,  116,  615,  808,  116,  116,
			  118,  116,  618,  630,  635,  118,  616,  116,  116,  808,

			  116,  116,  116,  621,  116,  118,  617,  631,  270,  620,
			  270,  118,  557,  557,  557,  557,  557,  631,  625,  618,
			  118,  635,  636,  808,  118,  622,  117,  631,  116,  116,
			  621,  116,  624,  635,  116,  116,  620,  116,  636,  623,
			  116,  116,  808,  116,  631,  625,  639,  116,  116,  636,
			  116,  118,  622,  117,  640,  641,  642,  118,  640,  624,
			  637,  641,  642,  118,  646,  638,  623,  646,  648,  628,
			  118,  649,  648,  639,  649,  627,  652,  629,  653,  654,
			  652,  640,  641,  642,  808,  643,  808,  808,  644,  645,
			  808,  646,  808,  808,  647,  648,  628,  682,  649,  650,

			  683,  651,  627,  652,  629,  653,  654,  655,  598,  598,
			  598,  598,  598,  598,  598,  598,  598,  598,  656,  656,
			  656,  656,  656,  657,  682,  657,  683,  683,  658,  658,
			  658,  658,  658,  659,  662,  659,  808,  808,  660,  660,
			  660,  660,  660,  660,  660,  660,  660,  660,  661,  661,
			  661,  661,  661,  684,  116,  116,  371,  116,  808,  808,
			  808,  662,  605,  605,  605,  605,  605,  663,  663,  663,
			  663,  663,  605,  605,  605,  605,  605,  118,  808,  808,
			  534,  665,  665,  665,  665,  665,  666,  666,  666,  666,
			  666,  667,  667,  667,  667,  667,  668,  673,  668,  685,

			  808,  669,  669,  669,  669,  669,  662,  116,  116,  808,
			  116,  116,  116,  673,  116,  116,  116,  673,  116,  116,
			  116,  808,  116,  808,  116,  116,  685,  116,  371,  808,
			  118,  808,  808,  662,  118,  676,  116,  116,  118,  116,
			  673,  685,  118,  687,  672,  808,  671,  118,  670,  116,
			  116,  676,  116,  116,  116,  676,  116,  116,  116,  118,
			  116,  116,  116,  808,  116,  687,  116,  116,  686,  116,
			  687,  672,  118,  671,  689,  670,  118,  689,  676,  691,
			  118,  692,  116,  116,  118,  116,  693,  116,  116,  118,
			  116,  808,  688,  691,  675,  808,  674,  677,  808,  116,

			  116,  689,  116,  808,  690,  118,  691,  808,  692,  808,
			  118,  808,  808,  693,  714,  678,  715,  715,  679,  808,
			  694,  675,  118,  674,  677,  658,  658,  658,  658,  658,
			  695,  695,  695,  695,  695,  660,  660,  660,  660,  660,
			  808,  714,  678,  715,  716,  679,  660,  660,  660,  660,
			  660,  696,  696,  696,  696,  696,  697,  808,  697,  808,
			  808,  698,  698,  698,  698,  698,  808,  455,  700,  700,
			  700,  700,  700,  604,  604,  604,  604,  604,  669,  669,
			  669,  669,  669,  704,  704,  704,  704,  704,  662,  116,
			  116,  709,  116,  116,  116,  717,  116,  808,  116,  116, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  808,  116,  116,  116,  808,  116,  808,  709,  808,  808,
			  371,  709,  118,  808,  717,  662,  118,  808,  705,  808,
			  463,  118,  717,  116,  116,  118,  116,  706,  808,  707,
			  719,  708,  116,  116,  709,  116,  116,  116,  719,  116,
			  712,  718,  721,  722,  712,  705,  118,  713,  721,  116,
			  116,  713,  116,  710,  706,  118,  707,  719,  708,  118,
			  712,  734,  735,  711,  808,  720,  808,  713,  808,  721,
			  722,  712,  118,  808,  808,  723,  808,  808,  713,  808,
			  710,  656,  656,  656,  656,  656,  808,  808,  734,  735,
			  711,  698,  698,  698,  698,  698,  724,  724,  724,  724,

			  724,  725,  725,  725,  725,  725,  542,  542,  542,  542,
			  542,  726,  726,  726,  726,  726,  808,  808,  455,  727,
			  727,  727,  727,  727,  663,  663,  663,  663,  663,  116,
			  116,  808,  116,  534,  116,  116,  808,  116,  732,  735,
			  116,  116,  732,  116,  116,  116,  808,  116,  808,  737,
			  116,  116,  118,  116,  737,  733,  739,  118,  732,  733,
			  748,  463,  728,  118,  808,  808,  736,  118,  749,  732,
			  749,  730,  808,  118,  808,  733,  737,  729,  808,  808,
			  808,  738,  808,  739,  751,  808,  733,  748,  808,  728,
			  808,  116,  116,  731,  116,  749,  808,  750,  730,  696,

			  696,  696,  696,  696,  729,  741,  741,  741,  741,  741,
			  701,  751,  701,  751,  118,  727,  727,  727,  727,  727,
			  731,  753,  742,  116,  116,  808,  116,  116,  116,  808,
			  116,  116,  116,  808,  116,  760,  534,  808,  808,  808,
			  752,  755,  755,  755,  755,  755,  118,  703,  753,  742,
			  118,  758,  116,  116,  118,  116,  116,  116,  758,  116,
			  116,  116,  760,  116,  116,  116,  759,  116,  808,  744,
			  743,  758,  761,  759,  767,  118,  808,  808,  745,  118,
			  808,  116,  116,  118,  116,  758,  759,  118,  762,  762,
			  762,  762,  762,  808,  768,  756,  744,  743,  808,  761,

			  759,  767,  808,  757,  118,  745,  703,  703,  703,  703,
			  703,  116,  116,  765,  116,  769,  766,  769,  775,  781,
			  765,  768,  756,  766,  808,  770,  116,  116,  763,  116,
			  757,  779,  808,  765,  118,  808,  766,  116,  116,  808,
			  116,  779,  764,  808,  808,  775,  781,  765,  808,  118,
			  766,  779,  771,  116,  116,  763,  116,  780,  808,  808,
			  118,  793,  793,  793,  793,  772,  808,  780,  779,  764,
			  776,  776,  776,  776,  776,  808,  118,  780,  782,  782,
			  782,  782,  782,  808,  778,  783,  783,  783,  783,  783,
			  116,  116,  772,  116,  780,  784,  785,  786,  786,  786,

			  786,  786,  787,  808,  787,  784,  785,  801,  802,  801,
			  808,  778,  788,  118,  794,  784,  785,  771,  771,  771,
			  771,  771,  792,  792,  792,  792,  792,  795,  808,  808,
			  794,  808,  784,  785,  794,  808,  808,  808,  808,  789,
			  808,  808,  808,  795,  803,  808,  808,  795,  796,  796,
			  796,  796,  796,  798,  808,  799,  808,  794,  797,  797,
			  797,  797,  797,  800,  800,  800,  800,  800,  808,  798,
			  795,  799,  808,  798,  808,  799,  789,  789,  789,  789,
			  789,  804,  804,  804,  804,  804,  805,  805,  805,  805,
			  805,  806,  806,  806,  806,  806,  798,  801,  799,  801,

			  808,  808,  805,  805,  805,  805,  805,  807,  807,  807,
			  807,  807,  803,  803,  803,  803,  803,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  803,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   98,   98,  808,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  808,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  100,  100,  808,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  117,  117,  117,
			  808,  808,  808,  808,  808,  808,  808,  117,  117,  808,
			  117,  808,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  808,  808,  117,  117,  117,  117,

			  117,  117,  117,  117,  147,  147,  808,  147,  147,  808,
			  147,  147,  808,  808,  808,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  808,  808,  147,
			  147,  147,  147,  147,  147,  147,  147,  148,  148,  808,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  199,  199,  808, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  808,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  212,  212,  212,

			  212,  212,  212,  212,  212,  212,  212,  808,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  217,  217,  217,
			  808,  808,  808,  808,  217,  217,  808,  217,  217,  808,
			  808,  808,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  808,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  230,  230,  808,  230,  230,  230,

			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  103,  808,  808,  808,  808,  103,
			  103,  808,  808,  808,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  808,  808,  103,  103,
			  103,  103,  103,  103,  103,  103,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  808,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  252,  808,  808,  808,
			  252,  252,  808,  252,  252,  252,  252,  252,  252,  252,

			  252,  252,  252,  252,  252,  252,  252,  252,  252,  252,
			  252,  252,  252,  252,  252,  252,  252,  808,  808,  252,
			  252,  252,  252,  252,  252,  252,  252,  146,  146,  808,
			  146,  146,  808,  146,  146,  146,  808,  808,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  808,  808,  146,  146,  146,  146,  146,  146,  146,  146,
			  229,  229,  229,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  229,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  497,  497,
			  497,  808,  808,  808,  808,  497,  497,  808,  497,  497,
			  808,  808,  808,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  497,  497,  497,  497,  497,  497,

			  497,  497,  497,  497,  497,  808,  808,  497,  497,  497,
			  497,  497,  497,  497,  497,  412,  412,  412,  808,  808,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  808,
			  808,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  808,  808,  412,  412,  412,  412,  412,
			  412,  412,  412,  566,  566,  566,  808,  808,  808,  808,
			  566,  566,  808,  566,  566,  808,  808,  808,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,

			  808,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  611,  611,  611,  611,  611,  611,  611,  611,  611,  808,
			  611,  611,  611,  611,  611,  611,  611,  611,  611,  611,
			  611,  611,  611,  611,  611,  611,  611,  611,  611,  611,
			  611,  611,  611,  611,  611,  611,  611,  611,  611,  611,
			  611,  611,  611,  611,  611,  611,  611,  611,  611,  611,
			   13,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,

			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808, yy_Dummy>>,
			1, 949, 4000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4948)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
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
			   29,  785,   29,   29,   29,   29,   29,   38,   38,   59,
			   38,   61,   76,   63,   64,    5,    6,   30,   68,   30,
			   59,   30,   30,   30,   30,   30,   58,   67,    3,   20,
			   38,  784,   67,    4,   11,  766,   59,   12,   61,   29,
			   63,   64,    5,    6,   92,   68,   74,   59,   74,   74,
			   95,  765,   95,   95,   67,  740,  740,   76,   30,   67,
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
			  725,   37,   39,   39,   69,   39,  223,   40,   40,  696,
			   40,   41,   41,  663,   41,  656,  150,   42,   42,  150,
			   42,   37,   52,   52,  150,   39,  214,   52,   52,   39,

			   40,   69,  631,   37,   41,   37,   43,   43,   41,   43,
			   42,   78,   40,   44,   44,  201,   44,  201,  201,   41,
			   42,   45,   45,   40,   45,  468,   39,  630,  223,   43,
			   37,  214,   37,   66,   60,   41,   44,   52,   82,   40,
			   44,   66,   43,   43,   45,   60,   41,   42,   43,   80,
			   40,   46,   46,  607,   46,   51,   51,  154,   51,   45,
			   66,   60,   48,   48,  468,   48,  342,   44,   66,   43,
			   43,   77,   60,   82,   46,   43,   50,   50,   51,   50,
			   46,  155,   62,   62,  154,   48,   45,   78,   62,   65,
			   49,   49,   46,   49,   79,   48,   84,   81,  559,   50,

			   82,   65,   51,   48,  499,  498,  158,   46,  155,   62,
			   62,  475,  464,   49,   50,   62,   65,  159,  457,   46,
			   47,   47,   48,   47,   80,   80,  449,   49,   65,   51,
			   48,   84,   49,  158,  160,  161,   47,   47,   47,   47,
			   47,   50,  342,   47,  159,   77,   77,   77,   87,   87,
			   47,   87,  116,  116,   49,  116,   47,  732,   84,   49,
			  448,  160,  161,   47,  162,   47,  164,   47,   79,   79,
			   79,   81,   81,   81,  166,  116,  377,   47,  108,  108,
			  108,  108,  108,   47,  111,  111,  111,  111,  111,  354,
			  167,  162,   47,  164,   47,   56,  349,  732,   56,   87,

			  336,  166,  333,   56,  109,  109,  109,  109,  109,  310,
			  308,   56,   56,   56,   56,   56,   56,  167,  239,  109,
			  239,  239,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   88,   88,  109,   88,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   57,   89,   89,   57,   89,  292,  220,  220,   57,  220,
			  664,  664,  664,   89,   89,  289,   57,   57,   57,   57,
			   57,   57,  168,   89,  169,   88,  252,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  168,
			  172,  169,   89,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   90,   90,  172,   90,  102,
			  237,  106,  106,  106,  106,  106,  236,   90,  102,  102,
			  102,  102,  102,  235,  175,  234,  106,   90,  110,  232,
			  110,  227,  110,  110,  110,  110,  110,  110,  112,  212,
			  112,  178,  112,  112,  112,  112,  112,  173,  106,  163,
			  173,  175,  102,  106,  163,  199,   90,   93,   93,  157,

			   93,  157,  157,  157,  157,  157,  102,  177,  178,  110,
			  102,  174,  102,  171,  173,  170,  163,  173,  153,  112,
			  151,  163,   93,  148,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  117,  117,  146,  117,
			  119,  119,  105,  119,  120,  120,  179,  120,  121,  121,
			  104,  121,  180,  122,  122,  103,  122,  123,  123,  117,
			  123,  100,   98,  119,   93,  124,  124,  120,  124,  125,
			  125,  121,  125,  179,  120,  119,  122,  147,  147,  180,
			  123,  181,  126,  126,   96,  126,  123,   85,  124,  121,

			  147,  123,  125,   73,  182,  122,  127,  127,   70,  127,
			  124,  120,  119,  126,   55,  126,  129,  129,  181,  129,
			  125,  128,  128,  123,  128,   36,  121,  183,  123,  127,
			  147,  182,  122,  130,  130,  176,  130,  124,  176,  129,
			  131,  131,   35,  131,  128,  127,  184,  125,  133,  133,
			  128,  133,  165,  128,  183,   33,  130,  165,  132,  132,
			   28,  132,  176,  131,  134,  176,  134,  185,   26,  129,
			   18,  133,  127,  184,  186,  187,  130,  128,  133,  165,
			  128,  132,  134,  131,  165,  134,   17,  132,  134,   16,
			  135,  135,   13,  135,  185,  134,    0,  134,  188,  134,

			    0,  186,  187,  130,    0,  133,    0,  189,  191,  134,
			  131,    0,  134,  135,  132,  134,  136,  136,  190,  136,
			  138,  138,  190,  138,  134,  188,  134,  139,  139,  139,
			  139,  139,    0,  135,  189,  191,    0,  140,  140,  136,
			  140,  143,  143,  138,  143,  190,  136,  192,    0,  190,
			  138,  192,  141,  141,  139,  141,  193,  194,  139,  136,
			  140,  136,    0,  138,  143,    0,  195,  196,  140,    0,
			  140,  197,  143,  136,  192,  141,  293,  138,  192,  142,
			  142,    0,  142,  193,  194,  139,  204,    0,  136,  137,
			  137,  209,  137,  195,  196,  140,  141,  140,  197,  143, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  211,  205,  142,  293,  206,  137,  137,  137,  137,  137,
			  207,    0,  137,  142,  208,  144,  144,  142,  144,  297,
			  299,  300,  137,  141,  301,  137,  209,  145,  145,    0,
			  145,  137,  302,  303,  304,  211,  215,  215,  144,  215,
			  142,  305,  216,  216,  142,  216,  297,  299,  300,  137,
			  145,  301,  137,  209,  222,  222,  144,  222,  137,  302,
			  303,  304,  211,  204,  204,  204,  204,  204,  305,  217,
			  217,  306,  217,  307,  145,  205,  205,  205,  206,  206,
			  206,  217,    0,  144,  207,  207,  207,  215,  208,  208,
			  208,  217,    0,  216,  228,  228,    0,  228,  306,  309,

			  307,  145,  152,    0,    0,  219,  219,  312,  219,  233,
			  233,  233,  233,  233,  233,    0,  242,  219,  242,  228,
			  217,  242,  242,  242,  242,  242,  309,  219,  243,  243,
			  243,  243,  243,    0,  312,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  219,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  224,  224,    0,  224,  244,
			  244,  244,  244,  244,  247,    0,  247,    0,    0,  247,
			  247,  247,  247,  247,  249,  249,  249,  249,    0,  313,
			  224,    0,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  238,  238,  313,  238,  241,  241,

			  241,  241,  241,    0,  246,  246,  246,  246,  246,  352,
			  352,    0,  352,  241,    0,  253,  253,  238,  253,  246,
			    0,  248,  224,  248,    0,  248,  248,  248,  248,  248,
			  250,  250,  250,  250,  250,  241,  254,  254,  253,  254,
			  241,  246,  255,  255,  314,  255,  246,  256,  256,  315,
			  256,  257,  257,  253,  257,  353,  353,    0,  353,  254,
			  258,  258,  248,  258,    0,  255,  259,  259,    0,  259,
			  256,  314,  255,    0,  257,  261,  315,    0,  256,  316,
			  253,  260,  260,  258,  260,  261,  257,  262,  262,  259,
			  262,  263,  263,    0,  263,  261,  317,  264,  264,  255,

			  264,  318,  258,  319,  260,  256,  316,    0,  259,  320,
			  262,    0,  261,  257,  263,    0,  265,  265,    0,  265,
			  264,    0,  262,  317,  267,  267,  263,  267,  318,  258,
			  319,  264,  323,    0,  260,  259,  320,  266,  266,  265,
			  266,  268,  268,    0,  268,  269,  269,  267,  269,  262,
			  265,  280,  280,  263,  280,  324,  325,  326,  264,  323,
			  266,    0,    0,  327,  268,  328,  266,    0,  269,  270,
			  270,  270,  270,  270,  280,    0,  269,  265,  271,  271,
			    0,  271,  324,  325,  326,  268,  329,  330,  272,  272,
			  327,  272,  328,  266,  271,  271,  271,  271,  271,  273,

			  273,  271,  273,  269,  272,  272,  272,  272,  272,    0,
			  331,  272,  268,  329,  330,  273,  273,  273,  273,  273,
			  344,  271,  273,  355,  355,    0,  355,  274,  274,  332,
			  274,  411,  411,    0,  411,  275,  275,  331,  275,    0,
			  334,    0,  273,  274,  274,  274,  274,  274,  355,    0,
			  274,  275,  275,  275,  275,  275,  332,  335,  275,  276,
			  276,  276,  276,  276,  277,  339,  277,  334,  279,  279,
			  274,  279,  278,  278,  278,  278,  278,    0,  275,    0,
			  281,  281,  340,  281,  335,  277,  413,  414,  277,  278,
			  341,  279,  339,    0,  277,  344,  344,  282,  282,    0,

			  282,  283,  283,  281,  283,  284,  284,    0,  284,  340,
			  279,    0,  277,  413,  414,  277,  278,  281,  282,  415,
			  282,  277,  343,    0,  283,  345,  285,  285,  284,  285,
			  286,  286,  283,  286,  346,  287,  287,  279,  287,  288,
			  288,  347,  288,    0,  281,  284,  415,  380,  380,  285,
			  380,  416,  418,  286,  351,  351,    0,  351,  287,  283,
			  451,  451,  288,  451,  341,  341,  341,  285,  419,    0,
			  380,  295,  284,  295,  295,  295,  295,  295,  416,  418,
			  421,  311,    0,  286,  422,  296,  288,  296,  296,  296,
			  296,  296,  311,  423,  285,  419,  343,  343,  343,  345,

			  345,  345,  311,  452,  452,  351,  452,  421,  346,  346,
			  346,  422,  311,  288,    0,  347,  347,  347,  350,  350,
			  423,  350,  358,  358,  358,  358,  358,  358,    0,  311,
			  350,  364,  364,  364,  364,  364,  495,  495,    0,  495,
			  350,  365,  365,  365,  365,  365,  364,  366,  366,  366,
			  366,  366,  367,  367,  367,  367,  367,  368,  368,  368,
			  368,  368,  369,  369,  369,  369,  369,    0,  364,  350,
			  424,  425,    0,  364,  370,  426,  370,  369,    0,  370,
			  370,  370,  370,  370,  366,  371,  371,  371,  371,  371,
			  372,  372,  372,  372,  372,  566,  566,  424,  425,  369,

			    0,    0,  426,  427,  369,  373,  373,  373,  373,  373,
			  374,  374,    0,  374,  374,  374,  374,  374,  375,  375,
			  375,  375,  375,  376,  376,  376,  376,  376,  378,  378,
			  427,  378,  379,  379,    0,  379,  381,  381,  428,  381,
			  382,  382,  373,  382,  383,  383,  566,  383,  385,  384,
			  384,  378,  384,    0,    0,  379,    0,    0,  385,  381,
			    0,  386,  386,  382,  386,  428,  379,  383,  385,  666,
			  666,  666,  384,  378,    0,  383,  384,  429,  388,  388,
			  381,  388,    0,  382,  386,  385,  387,  387,  405,  387,
			    0,  389,  389,  379,  389,  386,  390,  390,  405,  390,

			  378,  388,  383,  384,  429,  430,  666,  381,  405,  387,
			  382,    0,    0,    0,  389,  388,  431,  391,  391,  390,
			  391,  432,  386,  392,  392,  405,  392,  433,  389,  390,
			  387,    0,  430,  393,  393,  393,  393,  393,  403,  403,
			  391,  403,  388,  431,    0,  394,  392,  394,  432,  394,
			  394,  394,  394,  394,  433,  389,  390,  387,  391,  393,
			  434,  403,  395,    0,  392,  395,  394,  404,  404,  394,
			  404,  395,  435,  436,  437,  394,    0,  396,  396,  396,
			  396,  396,    0,  438,    0,  391,  393,  434,    0,  395,
			  404,  392,  395,  394,  396,    0,  394,    0,  395,  435, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  436,  437,  394,  397,  397,  397,  397,  397,  398,  398,
			  438,  398,  399,  399,  399,  399,  399,  397,  443,  406,
			  406,  396,  406,    0,  398,  398,  398,  398,  398,    0,
			  444,  398,  397,  400,  400,  400,  400,  400,  398,    0,
			  446,    0,  406,  399,  397,  443,  401,  401,  401,  401,
			  401,    0,  402,  402,  402,  402,  402,  444,  447,  397,
			  401,  407,  407,    0,  407,  398,  402,  446,  408,  408,
			  399,  408,  409,  409,  500,  409,  445,  410,  410,  501,
			  410,    0,  489,    0,  407,  447,  445,  401,    0,    0,
			  410,  408,  489,  402,  467,  409,  467,    0,  408,  409,

			  410,  500,  489,  445,  467,  407,  501,  469,  469,  409,
			  469,    0,    0,  445,  453,  453,  453,  453,  453,  489,
			  454,  454,  454,  454,  454,  408,  409,  502,  504,  453,
			  469,  467,  407,    0,  507,    0,  409,  455,  455,  455,
			  455,  455,  456,  456,  456,  456,  456,  458,  458,  458,
			  458,  458,    0,    0,  502,  504,  453,  454,    0,    0,
			  469,  507,  458,  459,  459,  459,  459,  459,  460,  460,
			  460,  460,  460,  461,  461,  461,  461,  461,  462,  462,
			  462,  462,  462,    0,  458,  470,  470,    0,  470,  458,
			  463,  463,  463,  463,  463,  465,  465,  465,  465,  465,

			  471,  471,    0,  471,    0,  460,  473,  473,  470,  473,
			  465,  494,    0,  509,  466,  462,  466,  466,  466,  466,
			  466,  494,  470,  471,  472,  472,    0,  472,    0,  473,
			  471,  494,    0,  474,  474,    0,  474,  465,  476,  476,
			  509,  476,  477,  477,  510,  477,    0,  472,  494,  470,
			  478,  478,    0,  478,    0,  472,  474,  471,    0,  496,
			  496,  476,  496,    0,    0,  477,  472,  511,  474,  476,
			    0,  510,  477,  478,  479,  479,    0,  479,  480,  480,
			  503,  480,  472,    0,  478,  481,  481,    0,  481,  482,
			  482,  503,  482,  472,  511,  474,  476,  479,    0,  477,

			  513,  480,  484,  484,  484,  484,  484,  503,  481,  480,
			  496,  478,  482,    0,  485,  485,  484,  485,  503,    0,
			  482,    0,  497,  497,    0,  497,  481,  513,  486,  486,
			  486,  486,  486,    0,    0,    0,  480,  485,  488,  488,
			  488,  488,  488,  484,  487,    0,  487,  482,  487,  487,
			  487,  487,  487,  481,  486,  505,    0,  485,  488,  514,
			  490,  490,  487,  490,  492,  492,  505,  492,  487,  491,
			  491,    0,  491,  497,  487,  493,  493,  515,  493,  516,
			  517,  486,  505,  490,  518,  488,  514,  492,  519,  487,
			  520,  490,  491,  505,  521,  487,  522,  523,  493,  524,

			  491,  487,  525,  526,  515,  492,  516,  517,  527,    0,
			  569,  518,  531,  493,    0,  519,    0,  520,  490,    0,
			    0,  521,    0,  522,  523,    0,  524,  491,    0,  525,
			  526,    0,  492,    0,  531,  527,  528,  569,  528,  531,
			  493,  528,  528,  528,  528,  528,  529,  529,  529,  529,
			  529,  530,  530,  530,  530,  530,  532,  532,  532,  532,
			  532,    0,  533,  533,  533,  533,  533,  541,  541,  541,
			  541,  532,  534,  534,  534,  534,  534,  535,  535,  535,
			  535,  535,  570,  529,  536,  536,  536,  536,  536,  537,
			  537,  537,  537,  537,  770,  770,  770,  770,  532,  533,

			  538,  538,  538,  538,  538,  539,    0,  539,    0,  570,
			  539,  539,  539,  539,  539,  540,  540,  540,  540,  540,
			  550,  536,  543,  543,  543,  543,  543,  544,  544,    0,
			  544,    0,  545,  545,    0,  545,  550,  543,  546,  546,
			  550,  546,  547,  547,    0,  547,    0,  571,  548,  548,
			  544,  548,    0,    0,  544,  545,  564,  549,  549,  545,
			  549,  546,    0,  550,  543,  547,  564,  551,  551,  546,
			  551,  548,  552,  552,  571,  552,  564,    0,    0,  547,
			  549,  544,  553,  553,    0,  553,  545,    0,  556,  556,
			  551,  556,  549,  564,  572,  552,  546,  554,  554,    0,

			  554,  555,  555,  552,  555,  553,  547,  565,  557,  551,
			  557,  556,  557,  557,  557,  557,  557,  565,  556,  549,
			  554,  572,  573,    0,  555,  553,  557,  565,  560,  560,
			  552,  560,  555,  575,  561,  561,  551,  561,  576,  554,
			  562,  562,    0,  562,  565,  556,  578,  563,  563,  573,
			  563,  560,  553,  557,  579,  580,  581,  561,  582,  555,
			  575,  583,  584,  562,  585,  576,  554,  586,  587,  562,
			  563,  588,  589,  578,  590,  561,  592,  563,  593,  594,
			  596,  579,  580,  581,    0,  582,    0,    0,  583,  584,
			    0,  585,    0,    0,  586,  587,  562,  632,  588,  589,

			  633,  590,  561,  592,  563,  593,  594,  596,  597,  597,
			  597,  597,  597,  598,  598,  598,  598,  598,  599,  599,
			  599,  599,  599,  600,  632,  600,  634,  633,  600,  600,
			  600,  600,  600,  601,  604,  601,    0,    0,  601,  601,
			  601,  601,  601,  602,  602,  602,  602,  602,  603,  603,
			  603,  603,  603,  634,  616,  616,  604,  616,    0,    0,
			    0,  604,  605,  605,  605,  605,  605,  606,  606,  606,
			  606,  606,  608,  608,  608,  608,  608,  616,    0,    0,
			  602,  609,  609,  609,  609,  609,  610,  610,  610,  610,
			  610,  612,  612,  612,  612,  612,  613,  619,  613,  636,

			    0,  613,  613,  613,  613,  613,  612,  614,  614,    0,
			  614,  615,  615,  619,  615,  617,  617,  619,  617,  618,
			  618,    0,  618,    0,  620,  620,  636,  620,  612,    0,
			  614,    0,    0,  612,  615,  626,  621,  621,  617,  621,
			  619,  638,  618,  642,  617,    0,  615,  620,  614,  622,
			  622,  626,  622,  623,  623,  626,  623,  624,  624,  621,
			  624,  625,  625,    0,  625,  645,  627,  627,  638,  627,
			  642,  617,  622,  615,  648,  614,  623,  650,  626,  652,
			  624,  653,  628,  628,  625,  628,  654,  629,  629,  627,
			  629,    0,  645,  655,  624,    0,  622,  627,    0,  674,

			  674,  648,  674,    0,  650,  628,  652,    0,  653,    0,
			  629,    0,    0,  654,  682,  628,  683,  684,  629,    0,
			  655,  624,  674,  622,  627,  657,  657,  657,  657,  657,
			  658,  658,  658,  658,  658,  659,  659,  659,  659,  659,
			    0,  682,  628,  683,  684,  629,  660,  660,  660,  660,
			  660,  661,  661,  661,  661,  661,  662,    0,  662,    0,
			    0,  662,  662,  662,  662,  662,    0,  658,  665,  665,
			  665,  665,  665,  667,  667,  667,  667,  667,  668,  668,
			  668,  668,  668,  669,  669,  669,  669,  669,  667,  670,
			  670,  676,  670,  671,  671,  685,  671,    0,  672,  672, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,  672,  675,  675,    0,  675,    0,  676,    0,    0,
			  667,  676,  670,    0,  686,  667,  671,    0,  670,    0,
			  669,  672,  685,  677,  677,  675,  677,  671,    0,  672,
			  689,  675,  678,  678,  676,  678,  679,  679,  690,  679,
			  680,  686,  691,  692,  680,  670,  677,  681,  694,  707,
			  707,  681,  707,  677,  671,  678,  672,  689,  675,  679,
			  680,  714,  715,  678,    0,  690,    0,  681,    0,  691,
			  692,  680,  707,    0,    0,  694,    0,    0,  681,    0,
			  677,  695,  695,  695,  695,  695,    0,    0,  714,  715,
			  678,  697,  697,  697,  697,  697,  698,  698,  698,  698,

			  698,  699,  699,  699,  699,  699,  700,  700,  700,  700,
			  700,  701,  701,  701,  701,  701,    0,    0,  695,  702,
			  702,  702,  702,  702,  704,  704,  704,  704,  704,  705,
			  705,    0,  705,  698,  706,  706,    0,  706,  712,  716,
			  708,  708,  712,  708,  710,  710,    0,  710,    0,  719,
			  711,  711,  705,  711,  720,  713,  722,  706,  712,  713,
			  734,  704,  705,  708,    0,    0,  716,  710,  735,  712,
			  736,  708,    0,  711,    0,  713,  719,  706,    0,    0,
			    0,  720,    0,  722,  737,    0,  713,  734,    0,  705,
			    0,  728,  728,  711,  728,  735,    0,  736,  708,  724,

			  724,  724,  724,  724,  706,  726,  726,  726,  726,  726,
			  727,  737,  727,  738,  728,  727,  727,  727,  727,  727,
			  711,  739,  728,  729,  729,    0,  729,  730,  730,    0,
			  730,  731,  731,    0,  731,  748,  724,    0,    0,    0,
			  738,  741,  741,  741,  741,  741,  729,  727,  739,  728,
			  730,  746,  742,  742,  731,  742,  743,  743,  746,  743,
			  744,  744,  748,  744,  745,  745,  747,  745,    0,  730,
			  729,  746,  753,  747,  760,  742,    0,    0,  731,  743,
			    0,  756,  756,  744,  756,  746,  747,  745,  754,  754,
			  754,  754,  754,    0,  761,  742,  730,  729,    0,  753,

			  747,  760,    0,  745,  756,  731,  755,  755,  755,  755,
			  755,  757,  757,  758,  757,  762,  759,  762,  767,  775,
			  758,  761,  742,  759,    0,  762,  763,  763,  756,  763,
			  745,  773,    0,  758,  757,    0,  759,  764,  764,    0,
			  764,  773,  757,    0,    0,  767,  775,  758,    0,  763,
			  759,  773,  762,  772,  772,  756,  772,  774,    0,    0,
			  764,  788,  788,  788,  788,  763,    0,  774,  773,  757,
			  769,  769,  769,  769,  769,    0,  772,  774,  776,  776,
			  776,  776,  776,    0,  772,  777,  777,  777,  777,  777,
			  778,  778,  763,  778,  774,  779,  780,  782,  782,  782,

			  782,  782,  783,    0,  783,  779,  780,  797,  797,  797,
			    0,  772,  783,  778,  790,  779,  780,  786,  786,  786,
			  786,  786,  787,  787,  787,  787,  787,  791,    0,    0,
			  790,    0,  779,  780,  790,    0,    0,    0,    0,  783,
			    0,    0,    0,  791,  797,    0,    0,  791,  792,  792,
			  792,  792,  792,  794,    0,  795,    0,  790,  793,  793,
			  793,  793,  793,  796,  796,  796,  796,  796,    0,  794,
			  791,  795,    0,  794,    0,  795,  800,  800,  800,  800,
			  800,  801,  801,  801,  801,  801,  802,  802,  802,  802,
			  802,  804,  804,  804,  804,  804,  794,  805,  795,  805,

			    0,    0,  805,  805,  805,  805,  805,  806,  806,  806,
			  806,  806,  807,  807,  807,  807,  807,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  805,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,

			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,

			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  813,  813,    0,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,    0,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  814,  814,    0,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,

			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  816,  816,  816,
			    0,    0,    0,    0,    0,    0,    0,  816,  816,    0,
			  816,    0,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,    0,    0,  816,  816,  816,  816,

			  816,  816,  816,  816,  817,  817,    0,  817,  817,    0,
			  817,  817,    0,    0,    0,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,    0,    0,  817,
			  817,  817,  817,  817,  817,  817,  817,  818,  818,    0,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  819,  819,    0, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,    0,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  821,  821,  821,

			  821,  821,  821,  821,  821,  821,  821,    0,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  822,  822,  822,
			    0,    0,    0,    0,  822,  822,    0,  822,  822,    0,
			    0,    0,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,    0,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  823,  823,  823,  823,  823,  823,

			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  825,  825,    0,  825,  825,  825,

			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  826,    0,    0,    0,    0,  826,
			  826,    0,    0,    0,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,    0,    0,  826,  826,
			  826,  826,  826,  826,  826,  826,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,

			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,    0,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  829,    0,    0,    0,
			  829,  829,    0,  829,  829,  829,  829,  829,  829,  829,

			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,    0,    0,  829,
			  829,  829,  829,  829,  829,  829,  829,  830,  830,    0,
			  830,  830,    0,  830,  830,  830,    0,    0,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			    0,    0,  830,  830,  830,  830,  830,  830,  830,  830,
			  831,  831,  831,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,

			  831,  831,  831,  831,  831,  831,  831,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  831,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  833,  833,
			  833,    0,    0,    0,    0,  833,  833,    0,  833,  833,
			    0,    0,    0,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,

			  833,  833,  833,  833,  833,    0,    0,  833,  833,  833,
			  833,  833,  833,  833,  833,  834,  834,  834,    0,    0,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,    0,
			    0,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,    0,    0,  834,  834,  834,  834,  834,
			  834,  834,  834,  835,  835,  835,    0,    0,    0,    0,
			  835,  835,    0,  835,  835,    0,    0,    0,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,

			    0,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,    0,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,

			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808, yy_Dummy>>,
			1, 949, 4000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   86,   91,   73,   74,    0,    0,  179,
			    0,   65,   68,  892, 4860,   95,  886,  860,  863, 4860,
			   87,    0, 4860, 4860, 4860, 4860,  853,   85,  843,   94,
			  113, 4860, 4860,  829, 4860,  816,  797,  266,  115,  270,
			  275,  279,  285,  304,  311,  319,  349,  418,  360,  388,
			  374,  353,  282, 4860, 4860,  760,  493,  568,   80,   82,
			  305,   86,  344,   94,   84,  358,  298,   98,   88,  225,
			  791, 4860, 4860,  796,  154, 4860,  115,  364,  304,  387,
			  342,  390,  321, 4860,  379,  745, 4860,  446,  542,  569,
			  643, 4860,   75,  695, 4860,  158,  791, 4860,  765, 4860,

			  762,    0,  640,  754,  757,  736,  633, 4860,  460,  486,
			  654,  466,  664, 4860, 4860, 4860,  450,  744,    0,  748,
			  752,  756,  761,  765,  773,  777,  790,  804,  819,  814,
			  831,  838,  856,  846,  850,  888,  914,  987,  918,  909,
			  935,  950,  977,  939, 1013, 1025,  725,  777,  669, 4860,
			  284,  709, 1079,  701,  320,  349,    0,  683,  369,  385,
			  391,  392,  420,  658,  422,  821,  437,  447,  555,  551,
			  692,  690,  579,  656,  656,  623,  804,  652,  636,  711,
			  717,  746,  773,  795,  815,  835,  841,  829,  865,  861,
			  882,  875,  911,  923,  914,  923,  918,  922, 4860,  688,

			 4860,  313, 4860, 4860,  979,  994,  997, 1003, 1007,  974,
			 4860,  983,  627, 4860,  279, 1034, 1040, 1067, 4860, 1103,
			  574, 1156, 1052,  249, 1243, 4860, 4860,  644, 1092, 4860,
			 4860, 4860,  660, 1092,  656,  654,  647,  641, 1292,  516,
			 4860, 1280, 1103, 1110, 1231, 4860, 1286, 1241, 1307, 1246,
			 1312, 4860,  569, 1313, 1334, 1340, 1345, 1349, 1358, 1364,
			 1379, 1347, 1385, 1389, 1395, 1414, 1435, 1422, 1439, 1443,
			 1451, 1476, 1486, 1497, 1525, 1533, 1541, 1550, 1554, 1566,
			 1449, 1578, 1595, 1599, 1603, 1624, 1628, 1633, 1637,  562,
			 4860, 4860,  558,  936,    0, 1655, 1669,  979,    0,  988,

			  989,  991,  995,  989, 1001, 1004, 1027, 1029,  455, 1055,
			  454, 1664, 1070, 1232, 1308, 1313, 1342, 1359, 1365, 1372,
			 1378,    0,    0, 1386, 1422, 1410, 1424, 1424, 1432, 1447,
			 1454, 1468, 1486,  447, 1498, 1514,  445,    0,    0, 1516,
			 1533, 1583,  359, 1615, 1513, 1618, 1627, 1634, 4860,  493,
			 1716, 1652, 1307, 1353,  486, 1521, 4860, 4860, 1705, 4860,
			 4860, 4860, 4860, 4860, 1713, 1723, 1729, 1734, 1739, 1744,
			 1761, 1767, 1772, 1787, 1795, 1800, 1805,  449, 1826, 1830,
			 1645, 1834, 1838, 1842, 1847, 1820, 1859, 1884, 1876, 1889,
			 1894, 1915, 1921, 1915, 1931, 1927, 1959, 1985, 2006, 1994,

			 2015, 2028, 2034, 1936, 1965, 1860, 2017, 2059, 2066, 2070,
			 2075, 1529,    0, 1539, 1540, 1583, 1615,    0, 1606, 1623,
			    0, 1634, 1639, 1660, 1741, 1738, 1739, 1757, 1799, 1838,
			 1869, 1870, 1882, 1892, 1925, 1929, 1930, 1931, 1940,    0,
			    0,    0,    0, 1972, 1998, 2047, 1994, 2026,  445,  411,
			 4860, 1658, 1701, 2096, 2102, 2119, 2124,  404, 2129, 2145,
			 2150, 2155, 2160, 2172,  394, 2177, 2198, 2081,  309, 2105,
			 2183, 2198, 2222, 2204, 2231,  388, 2236, 2240, 2248, 2272,
			 2276, 2283, 2287, 4860, 2284, 2312, 2310, 2330, 2320, 2054,
			 2358, 2367, 2362, 2373, 2183, 1734, 2257, 2320,  350,  349,

			 2035, 2040, 2095, 2247, 2096, 2322,    0, 2097,    0, 2180,
			 2212, 2231,    0, 2267, 2327, 2341, 2346, 2347, 2341, 2355,
			 2347, 2361, 2363, 2364, 2356, 2362, 2370, 2375, 2423, 2428,
			 2433, 2379, 2438, 2444, 2454, 2459, 2466, 2471, 2482, 2492,
			 2497, 2449, 4860, 2504, 2525, 2530, 2536, 2540, 2546, 2555,
			 2492, 2565, 2570, 2580, 2595, 2599, 2586, 2594, 4860,  375,
			 2626, 2632, 2638, 2645, 2528, 2579, 1793, 4860, 4860, 2381,
			 2453, 2518, 2561, 2583,    0, 2600, 2599,    0, 2609, 2610,
			 2622, 2611, 2614, 2628, 2617, 2620, 2623, 2635, 2639, 2639,
			 2642,    0, 2633, 2647, 2647,    0, 2637, 2690, 2695, 2700,

			 2710, 2720, 2725, 2730, 2701, 2744, 2749,  338, 2754, 2763,
			 2768, 4860, 2773, 2783, 2805, 2809, 2752, 2813, 2817, 2769,
			 2822, 2834, 2847, 2851, 2855, 2859, 2807, 2864, 2880, 2885,
			  312,  287, 2654, 2663, 2689,    0, 2768,    0, 2810,    0,
			    0,    0, 2794,    0,    0, 2816,    0,    0, 2835,    0,
			 2838,    0, 2846, 2846, 2853, 2860,  230, 2907, 2912, 2917,
			 2928, 2933, 2943,  228,  562, 2950, 1856, 2955, 2960, 2965,
			 2987, 2991, 2996, 4860, 2897, 3000, 2963, 3021, 3030, 3034,
			 3012, 3019, 2883, 2880, 2881, 2962, 2981,    0,    0, 2999,
			 3007, 3010, 3010,    0, 3016, 3063,  224, 3073, 3078, 3083,

			 3088, 3093, 3101, 4860, 3106, 3127, 3132, 3047, 3138, 4860,
			 3142, 3148, 3110, 3127, 3026, 3017, 3094,    0,    0, 3116,
			 3121,    0, 3111,    0, 3181,  225, 3187, 3197, 3189, 3221,
			 3225, 3229,  452, 4860, 3127, 3119, 3121, 3140, 3169, 3172,
			  147, 3223, 3250, 3254, 3258, 3262, 3223, 3238, 3190,    0,
			    0,    0,    0, 3231, 3270, 3288, 3279, 3309, 3285, 3288,
			 3225, 3261, 3302, 3324, 3335,  138,  122, 3277,    0, 3352,
			 2476, 4860, 3351, 3303, 3329, 3286, 3360, 3367, 3388, 3367,
			 3368,    0, 3379, 3389,  118,   88, 3399, 3404, 3343, 4860,
			 3386, 3399, 3430, 3440, 3425, 3427, 3445, 3394, 4860, 4860,

			 3458, 3463, 3468, 4860, 3473, 3484, 3489, 3494, 4860, 3534,
			 3584, 3634, 3684, 3734, 3784, 3818, 3855, 3898, 3946, 3996,
			 4046, 4096, 4145, 4193, 4243, 4293, 4337, 4385, 4435, 4478,
			 4521, 4568, 4617, 4666, 4714, 4761, 4809, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  808,    1,  809,  809,  810,  810,  811,  811,  808,
			    9,  812,  812,  808,  808,  808,  808,  808,  813,  808,
			  814,  815,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  817,  808,  808,  818,  808,  808,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  808,  808,  808,  819,  808,  808,  808,  819,  819,  819,
			  819,  819,  820,  808,  820,  821,  808,  822,  808,  822,
			  822,  808,  823,  824,  808,  808,  808,  808,  813,  808,

			  825,  825,  825,  826,  827,  808,  808,  808,  808,  828,
			  808,  808,  808,  808,  808,  808,  808,  816,  829,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,   47,  816,  816,  816,  816,   47,
			  816,  816,  816,  816,  816,  816,  830,  817,  818,  808,
			  808,  808,   57,  808,  152,  152,   57,   57,   57,   57,
			  152,   57,  152,  152,   57,   57,  152,  152,   57,   57,
			  152,   57,  152,  152,  152,   57,   57,   57,  152,   57,
			  152,   57,  152,  152,   57,   57,  152,  152,   57,   57,
			  152,  152,   57,   57,  152,   57,  152,   57,  808,  819,

			  808,  808,  808,  808,  819,  819,  819,  819,  819,  820,
			  808,  820,  821,  808,  821,  822,  808,  822,  808,  808,
			  808,  808,  808,  823,  824,  808,  808,  224,  831,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  829,  816,  816,  816,  816,  816,  816,  816,
			  816,  808,  816,  816,  816,  816,  816,  816,  816,  816,
			  808,  816,  816,  816,  816,  816,  137,  137,  137,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  808,
			  808,  808,  808,  152,  152,  808,  152,   57,   57,  152,

			   57,  152,  152,  152,   57,   57,   57,  152,  152,   57,
			   57,  808,  152,  152,  152,  152,   57,   57,   57,  152,
			   57,  152,   57,  152,  152,   57,   57,  152,  152,   57,
			   57,  152,  152,  152,   57,   57,   57,  152,   57,  152,
			   57,  819,  819,  819,  819,  819,  819,  819,  808,  832,
			  832,  808,  832,  832,  832,  831,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  829,  816,  816,
			  816,  816,  816,  816,  816,  808,  816,  816,  816,  816,
			  816,  816,  816,  808,  137,  137,  394,  394,  816,  134,

			  808,  398,  398,  816,  816,  808,  816,  816,  816,  816,
			  816,  833,  834,  152,   57,  152,   57,  152,  152,  152,
			   57,   57,   57,  152,  152,   57,  152,  152,  152,  152,
			   57,   57,   57,  152,   57,  152,  152,   57,   57,  152,
			  152,   57,   57,  152,  152,  152,   57,   57,  152,   57,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  828,  808,  808,  808,  816,
			  816,  816,  816,  816,  816,  808,  816,  816,  816,  816,
			  816,  816,  816,  808,  398,  816,  808,  398,  487,  808,
			  816,  816,  816,  816,  808,  808,  835,  833,  152,   57,

			  152,   57,  152,  152,   57,   57,  152,  152,   57,  152,
			  152,  152,  152,   57,   57,   57,  152,   57,  152,  152,
			   57,   57,  152,  152,  152,  152,   57,   57,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  836,  816,  816,  816,  816,  816,  816,
			  808,  816,  816,  816,  816,  816,  816,  398,  808,  808,
			  816,  816,  816,  816,  808,  808,  835,  808,  808,  152,
			  152,   57,  152,  152,  152,   57,   57,   57,  152,  152,
			  152,  152,   57,   57,   57,  152,   57,  152,  152,   57,
			   57,  152,  152,  152,  152,   57,   57,  808,  808,  808,

			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  816,  816,  816,  816,  816,  808,
			  816,  816,  816,  816,  816,  816,  808,  816,  816,  816,
			  808,  808,  152,  152,   57,  152,  152,   57,   57,  152,
			  152,  152,  152,   57,   57,   57,  152,   57,  152,  152,
			   57,   57,  152,  152,  152,   57,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  816,  816,  816,  808,  816,  816,  808,  816,  816,  816,
			  808,  808,  152,  152,   57,  152,   57,  152,   57,  152,
			   57,  152,  152,  152,   57,  808,  808,  808,  808,  808,

			  808,  808,  808,  808,  808,  816,  816,  816,  816,  808,
			  816,  816,  808,  808,  152,  152,   57,  152,   57,  152,
			   57,  152,  152,   57,  808,  808,  808,  808,  816,  816,
			  816,  816,  808,  808,  152,  152,   57,  152,   57,  152,
			  808,  808,  816,  816,  816,  816,  808,  808,  152,  152,
			   57,  152,   57,  152,  808,  808,  816,  816,  808,  808,
			  152,  152,  808,  816,  816,  808,  808,  152,  152,  808,
			  808,  808,  816,  808,  808,  152,  808,  808,  816,  808,
			  808,  152,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,

			  808,  808,  808,  808,  808,  808,  808,  808,    0,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808, yy_Dummy>>)
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
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,    5,   39,   40,    5,   12,   12,   12,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   41,
			   42,   43,   44,   45,   46,   47,   48,    5,    5,   49,
			   50,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  127,  125,    1,    2,   15,  109,   18,
			  125,   16,   17,    7,    6,   13,    5,   11,    8,  100,
			  100,   14,   12,   29,   10,   30,   20,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   78,   92,   92,
			   92,   92,   22,   31,   23,    9,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   24,   21,   25,  113,  114,  115,  116,  113,  113,  113,
			  113,  113,  126,   98,  126,  126,  126,  126,  126,  126,
			  126,   68,  126,  126,   91,    1,    2,   28,  109,  108,

			  123,  123,  123,    0,    3,   33,  104,   32,    0,    0,
			  100,    0,  100,   27,   26,   19,    0,   92,   87,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   40,   92,   86,   86,   77,   86,   86,
			   92,   92,   92,   92,   92,   92,    0,    0,    0,   99,
			    0,    0,   95,    0,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   40,   95,   40,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   96,  113,

			  115,  114,  111,  110,  112,  113,  113,  113,  113,    0,
			   98,    0,    0,   97,    0,    0,    0,    0,   68,    0,
			   66,    0,   65,    0,    0,   91,   89,   89,    0,   90,
			  123,  117,  123,  123,  123,  123,  123,  123,    0,    4,
			   34,  104,    0,    0,    0,  102,  104,  102,  100,    0,
			    0,   87,    0,   92,   39,   92,   92,   92,   92,   92,
			   92,    0,   92,   92,   92,   92,   92,   42,   92,   92,
			    0,   78,   79,   78,   78,   78,   85,   92,   85,   85,
			   85,   92,   92,   92,   92,   92,   92,   41,   92,    0,
			   63,   94,    0,   95,   39,   69,   69,   95,   39,   95,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,    0,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   42,   42,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   41,   41,   95,
			   95,  113,  113,  113,  113,  113,  113,  113,   97,    0,
			    0,   67,   66,   65,   68,    0,  121,  124,  124,  122,
			  118,  119,  120,   88,  104,    0,  104,    0,    0,  104,
			    0,    0,    0,  103,  100,    0,    0,   93,   92,   92,
			   38,   92,   92,   92,   92,    0,   92,   92,   92,   92,
			   92,   92,   92,    0,   92,   77,   92,   92,   92,   92,

			    0,   77,   77,   77,   37,    0,   44,   92,   92,   92,
			   92,   64,   60,   95,   95,   95,   95,   38,   95,   95,
			   38,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   37,
			   44,   37,   44,   95,   95,   95,   95,   95,   95,   95,
			   67,   66,   65,  104,  104,    0,    0,  101,  104,    0,
			  103,    0,  103,    0,    0,    0,  100,   74,    0,   92,
			   92,   92,   92,   45,   92,    0,   92,   92,   92,   36,
			   92,   92,   92,   79,   79,   78,    0,   92,   92,    0,
			   92,   92,   92,   92,    0,   64,   64,    0,   95,   95,

			   95,   95,   95,   95,   95,   95,   45,   95,   45,   95,
			   95,   95,   36,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,    0,  104,
			    0,  107,  104,  103,    0,    0,  103,    0,    0,  102,
			    0,    0,   74,    0,   92,   92,   92,   92,   47,   92,
			    0,   92,   92,   92,   92,   92,   92,   92,   77,    0,
			   53,   92,   92,   92,    0,    0,    0,   62,   61,   95,
			   95,   95,   95,   95,   47,   95,   95,   47,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   53,   95,   95,   95,   53,   95,    0,  104,    0,

			    0,    0,  103,    0,  107,  103,    0,   76,    0,    0,
			    0,  105,  107,  105,   92,   92,   59,   92,   46,    0,
			   43,   58,   92,   35,   92,   51,    0,   92,   92,   92,
			    0,    0,   95,   95,   95,   59,   95,   59,   95,   46,
			   43,   58,   95,   43,   58,   95,   35,   35,   95,   51,
			   95,   51,   95,   95,   95,   95,  107,    0,  107,    0,
			  103,    0,    0,  106,    0,    0,   73,  107,    0,  106,
			   92,   92,   92,   82,   54,   92,    0,   92,   92,   55,
			    0,    0,   95,   95,   95,   95,   95,   54,   54,   95,
			   95,   95,   95,   55,   95,  107,  106,    0,  106,    0,

			    0,    0,    0,   73,  106,   92,   92,   48,   92,   81,
			   52,   92,    0,    0,   95,   95,   95,   48,   48,   95,
			   95,   52,   95,   52,  106,   75,    0,   73,   92,   92,
			   92,   92,   80,   80,   95,   95,   95,   95,   95,   95,
			    0,    0,   92,   50,   49,   92,    0,    0,   95,   50,
			   50,   49,   49,   95,    0,    0,   92,   92,    0,    0,
			   95,   95,   72,   92,   56,    0,    0,   95,   56,    0,
			    0,   72,   92,    0,    0,   95,    0,    0,   57,    0,
			    0,   57,    0,   71,    0,    0,    0,    0,    0,   71,
			    0,    0,    0,    0,    0,    0,    0,   70,   83,   84,

			    0,    0,    0,   70,    0,   70,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4860
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 808
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 809
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

	yyNb_rules: INTEGER is 126
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 127
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
			create in_buffer.make (Init_buffer_size)
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
			-- Buffer for lexical tokens.

	in_lineno: INTEGER
			-- Current line number.

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

	source_start_line: INTEGER
			-- Offset of source in other document, else 0.

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

	dadl_parser: DADL2_VALIDATOR is
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
