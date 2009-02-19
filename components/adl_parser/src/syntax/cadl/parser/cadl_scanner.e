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
			create an_array.make (0, 4926)
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
			  109,  786,  110,  110,  110,  110,  110,  116,  116,  162,
			  116,  170,  202,  178,  180,   84,   84,  108,  194,  109,
			  163,  112,  112,  112,  112,  112,  161,  190,   76,  102,
			  118,  785,  191,   76,   94,  769,  164,   94,  171,  111,
			  179,  181,   85,   85,  225,  195,  201,  165,  201,  201,
			   95,  768,   95,   95,  192,  749,  749,  203,  111,  193,
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
			  735,  116,  116,  116,  196,  116,  224,  116,  116,  530,
			  116,  116,  116,  461,  116,  453,  150,  116,  116,  150,
			  116,  118,  146,  146,  151,  118,  348,  146,  146,  121,

			  118,  197,  676,  119,  118,  120,  116,  116,  124,  116,
			  118,  200,  122,  116,  116,  201,  116,  201,  201,  125,
			  126,  116,  116,  123,  116,  539,  121,  675,  225,  118,
			  119,  214,  120,  186,  166,  124,  118,  146,  210,  122,
			  130,  187,  127,  128,  118,  167,  125,  126,  129,  200,
			  123,  116,  116,  659,  116,  116,  116,  293,  116,  131,
			  188,  168,  116,  116,  111,  116,  200,  130,  189,  127,
			  128,  200,  169,  211,  118,  129,  116,  116,  118,  116,
			  132,  294,  172,  173,  293,  118,  131,  205,  174,  182,
			  116,  116,  133,  116,  200,  140,  213,  200,  621,  118,

			  212,  183,  145,  141,  564,  564,  293,  132,  294,  175,
			  176,  546,  534,  118,  144,  177,  184,  294,  108,  133,
			  116,  116,  140,  116,  207,  207,  490,  142,  185,  145,
			  141,  211,  143,  297,  299,  299,  134,  134,  134,  134,
			  134,  144,  205,  118,  298,  204,  204,  204,  215,  216,
			  135,  215,  116,  116,  142,  116,  136,  741,  212,  143,
			  490,  299,  300,  137,  301,  138,  301,  139,  206,  206,
			  206,  208,  208,  208,  307,  251,  377,  135,  244,  244,
			  244,  244,  244,  136,  250,  250,  250,  250,  250,  448,
			  308,  301,  138,  304,  139,  150,  448,  742,  150,  218,

			  443,  307,  443,  151,  246,  246,  246,  246,  246,  422,
			  422,  152,  152,  152,  152,  152,  153,  308,  239,  247,
			  239,  239,  152,  152,  152,  152,  152,  152,  152,  152,
			  154,  152,  155,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  216,  216,  247,  216,  152,  156,
			  156,  157,  156,  156,  156,  156,  156,  158,  156,  159,
			  156,  156,  156,  156,  156,  157,  156,  156,  156,  156,
			  150,  219,  216,  150,  219,  410,  220,  220,  151,  220,
			  694,  694,  694,  220,  221,  409,  152,  152,  152,  152,
			  152,  153,  307,  222,  308,  218,  377,  152,  152,  152,

			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  309,
			  312,  310,  218,  152,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  219,  216,  312,  219,  232,
			  362,  241,  241,  241,  241,  241,  361,  220,  233,  233,
			  233,  233,  233,  360,  312,  359,  242,  222,  108,  356,
			  109,  803,  248,  248,  248,  248,  248,  249,  108,  214,
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

			  289,  258,  118,  200,  323,  256,  116,  116,  324,  116,
			  259,  254,  253,  261,  198,  118,  116,  116,  322,  116,
			  260,  116,  116,  257,  116,  323,  255,  324,  258,  118,
			  290,  323,  256,  116,  116,  324,  116,  259,  149,  118,
			  116,  116,  115,  116,  118,  262,  327,  260,  116,  116,
			  263,  116,  325,  264,  326,  114,  118,  302,  116,  116,
			  113,  116,  303,  118,  107,  116,  116,  104,  116,  265,
			   99,  118,  262,  327,   97,  200,  266,  263,  269,  270,
			  264,  118,  271,  267,  305,  272,  328,  268,  118,  306,
			   96,  273,  117,  803,  274,  327,  275,  116,  116,  803,

			  116,  116,  116,  266,  116,  269,  270,  803,  276,  271,
			  267,  328,  272,  328,  268,  803,  116,  116,  273,  116,
			  118,  274,  329,  275,  118,  116,  116,  135,  116,  803,
			  333,  135,  333,  117,  117,  117,  117,  117,  330,  118,
			  276,  331,  138,  803,  276,  332,  803,  281,  118,  282,
			  207,  207,  116,  116,  135,  116,  286,  333,  135,  336,
			  276,  803,  116,  116,  117,  116,  200,  803,  331,  138,
			  116,  116,  332,  116,  281,  118,  282,  116,  116,  200,
			  116,  116,  116,  286,  116,  118,  277,  277,  277,  277,
			  277,  117,  337,  118,  313,  200,  283,  314,  331,  337, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  118,  339,  332,  278,  118,  339,  279,  215,  216,  288,
			  215,  284,  280,  210,  411,  285,  213,  216,  216,  337,
			  216,  317,  287,  283,  318,  334,  338,  803,  339,  335,
			  278,  200,  340,  279,  200,  411,  288,  803,  284,  280,
			  803,  411,  285,  341,  342,  343,  344,  345,  211,  287,
			  803,  211,  413,  204,  204,  204,  222,  222,  218,  222,
			  219,  216,  412,  219,  375,  375,  375,  375,  218,  204,
			  204,  204,  220,  352,  449,  212,  352,  413,  212,  413,
			  803,  803,  222,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,

			  152,  152,  152,  152,  414,  346,  346,  346,  347,  347,
			  347,  218,  219,  216,  803,  219,  355,  355,  803,  355,
			  238,  238,  385,  238,  220,  357,  358,  358,  358,  358,
			  358,  365,  385,  365,  222,  415,  366,  366,  366,  366,
			  366,  228,  385,  363,  367,  367,  367,  367,  367,  368,
			  368,  368,  368,  368,  376,  376,  376,  376,  376,  385,
			  803,  803,  415,  218,  349,  350,  351,  349,  350,  349,
			  349,  349,  349,  349,  349,  349,  349,  352,  221,  221,
			  349,  221,  221,  221,  221,  221,  349,  353,  349,  349,
			  349,  349,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  349,  349,  354,  349,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  227,  227,  372,  227,  372,  803,  803,  373,
			  373,  373,  373,  373,  803,  108,  803,  109,  803,  374,
			  374,  374,  374,  374,  803,  353,  450,  228,  353,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  364,  364,  364,  364,  364,  111,  369,  369,  369,
			  369,  369,  116,  116,  416,  116,  242,  116,  116,  803,
			  116,  417,  370,  116,  116,  415,  116,  803,  803,  229,
			  416,  116,  116,  803,  116,  118,  116,  116,  243,  116,
			  118,  416,  803,  242,  371,  803,  118,  803,  417,  370,
			  378,  803,  418,  379,  118,  116,  116,  419,  116,  118,
			  116,  116,  380,  116,  116,  116,  803,  116,  417,  116,
			  116,  381,  116,  116,  116,  803,  116,  378,  118,  421,
			  379,  803,  803,  118,  421,  491,  491,  118,  492,  380,
			  116,  116,  118,  116,  424,  420,  118,  382,  381,  803,

			  116,  116,  383,  116,  386,  803,  421,  803,  387,  116,
			  116,  423,  116,  118,  425,  116,  116,  384,  116,  390,
			  426,  424,  803,  118,  382,  116,  116,  427,  116,  383,
			  424,  386,  118,  425,  388,  387,  116,  116,  118,  116,
			  803,  425,  803,  389,  803,  803,  390,  426,  118,  117,
			  117,  117,  117,  117,  427,  116,  116,  428,  116,  118,
			  429,  388,  803,  116,  116,  426,  116,  392,  431,  391,
			  389,  393,  393,  393,  393,  393,  803,  803,  118,  395,
			  395,  395,  395,  395,  116,  116,  118,  116,  116,  116,
			  399,  116,  430,  400,  392,  431,  391,  803,  394,  401,

			  396,  396,  396,  396,  396,  116,  116,  118,  116,  220,
			  220,  118,  220,  116,  116,  803,  116,  399,  803,  803,
			  400,  397,  397,  397,  397,  397,  401,  394,  118,  398,
			  398,  398,  398,  398,  431,  433,  118,  117,  117,  117,
			  117,  117,  116,  116,  434,  116,  116,  116,  394,  116,
			  116,  116,  433,  116,  117,  803,  394,  116,  116,  803,
			  116,  432,  433,  116,  116,  118,  116,  116,  116,  118,
			  116,  434,  803,  118,  116,  116,  434,  116,  403,  435,
			  118,  117,  116,  116,  280,  116,  118,  402,  803,  437,
			  118,  803,  438,  200,  404,  116,  116,  118,  116,  116,

			  116,  200,  116,  436,  437,  118,  438,  405,  200,  292,
			  441,  280,  442,  200,  402,  406,  437,  441,  118,  438,
			  385,  404,  118,  295,  200,  295,  295,  295,  295,  295,
			  385,  439,  442,  440,  405,  407,  446,  441,  446,  442,
			  385,  803,  406,  803,  444,  295,  408,  296,  296,  296,
			  296,  296,  350,  351,  803,  350,  803,  385,  494,  445,
			  473,  803,  803,  446,  352,  447,  803,  204,  204,  204,
			  473,  803,  803,  408,  353,  206,  206,  206,  216,  216,
			  473,  216,  208,  208,  208,  494,  803,  204,  204,  204,
			  355,  355,  803,  355,  494,  496,  803,  473,  204,  204,

			  204,  496,  803,  354,  357,  358,  358,  358,  358,  358,
			  451,  451,  451,  451,  451,  803,  366,  366,  366,  366,
			  366,  495,  496,  116,  116,  242,  116,  803,  497,  218,
			  452,  452,  452,  452,  452,  454,  454,  454,  454,  454,
			  455,  455,  455,  455,  455,  803,  118,  243,  222,  222,
			  803,  222,  242,  456,  456,  456,  456,  456,  459,  459,
			  459,  459,  459,  803,  457,  498,  457,  453,  370,  458,
			  458,  458,  458,  458,  373,  373,  373,  373,  373,  460,
			  460,  460,  460,  460,  465,  465,  465,  465,  465,  803,
			  371,  803,  498,  462,  463,  370,  464,  464,  464,  464,

			  464,  466,  466,  466,  466,  466,  116,  116,  499,  116,
			  116,  116,  803,  116,  116,  116,  461,  116,  116,  116,
			  803,  116,  116,  116,  803,  116,  803,  116,  116,  118,
			  116,  491,  491,  118,  491,  499,  498,  118,  803,  116,
			  116,  118,  116,  499,  468,  118,  116,  116,  803,  116,
			  118,  467,  803,  471,  472,  502,  116,  116,  469,  116,
			  803,  470,  118,  500,  116,  116,  803,  116,  803,  118,
			  501,  468,  503,  474,  116,  116,  502,  116,  467,  118,
			  471,  472,  502,  116,  116,  469,  116,  118,  470,  505,
			  475,  116,  116,  476,  116,  117,  506,  118,  117,  503,

			  474,  477,  803,  504,  117,  803,  118,  478,  803,  393,
			  393,  393,  393,  393,  118,  507,  505,  475,  803,  803,
			  476,  508,  117,  506,  479,  117,  271,  803,  477,  481,
			  803,  117,  480,  803,  478,  273,  803,  395,  395,  395,
			  395,  395,  507,  396,  396,  396,  396,  396,  508,  803,
			  803,  479,  803,  271,  117,  505,  481,  270,  506,  480,
			  116,  116,  273,  116,  398,  398,  398,  398,  398,  507,
			  116,  116,  274,  116,  803,  803,  397,  397,  397,  397,
			  397,  117,  509,  118,  270,  510,  803,  803,  116,  116,
			  482,  116,  803,  118,  512,  117,  511,  512,  803,  274, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  483,  483,  483,  483,  483,  484,  484,  484,  484,  484,
			  485,  118,  116,  116,  117,  116,  803,  482,  803,  117,
			  485,  512,  117,  514,  513,  116,  116,  803,  116,  515,
			  485,  116,  116,  514,  116,  118,  116,  116,  803,  116,
			  515,  117,  116,  116,  518,  116,  117,  485,  118,  519,
			  514,  518,  520,  519,  118,  490,  515,  803,  803,  118,
			  516,  487,  521,  488,  803,  118,  803,  517,  803,  486,
			  803,  518,  565,  489,  803,  803,  519,  803,  522,  520,
			  523,  803,  451,  451,  451,  451,  451,  803,  487,  521,
			  488,  525,  525,  525,  525,  525,  486,  524,  803,  565,

			  489,  526,  526,  526,  526,  526,  527,  527,  527,  527,
			  527,  528,  528,  528,  528,  528,  458,  458,  458,  458,
			  458,  803,  116,  116,  524,  116,  370,  803,  453,  529,
			  529,  529,  529,  529,  531,  531,  531,  531,  531,  532,
			  532,  532,  532,  532,  803,  118,  803,  803,  371,  116,
			  116,  803,  116,  370,  533,  533,  533,  533,  533,  528,
			  528,  528,  528,  528,  565,  463,  530,  464,  464,  464,
			  464,  464,  118,  536,  535,  536,  461,  116,  116,  803,
			  116,  116,  116,  537,  116,  116,  116,  803,  116,  116,
			  116,  566,  116,  554,  116,  116,  567,  116,  803,  567,

			  118,  535,  540,  554,  118,  803,  116,  116,  118,  116,
			  538,  542,  118,  554,  541,  803,  543,  118,  803,  116,
			  116,  573,  116,  567,  545,  547,  570,  544,  803,  118,
			  554,  574,  116,  116,  803,  116,  548,  803,  542,  575,
			  559,  541,  118,  543,  116,  116,  803,  116,  573,  803,
			  559,  545,  547,  549,  544,  118,  116,  116,  574,  116,
			  560,  116,  116,  548,  116,  803,  575,  118,  553,  553,
			  553,  553,  553,  116,  116,  550,  116,  559,  803,  118,
			  549,  803,  117,  803,  118,  483,  483,  483,  483,  483,
			  116,  116,  552,  116,  803,  576,  118,  551,  574,  117,

			  116,  116,  550,  116,  803,  400,  803,  491,  491,  117,
			  492,  401,  803,  118,  116,  116,  394,  116,  803,  552,
			  803,  555,  576,  118,  551,  577,  117,  484,  484,  484,
			  484,  484,  400,  116,  116,  568,  116,  118,  401,  803,
			  803,  557,  561,  568,  803,  556,  569,  117,  555,  575,
			  576,  580,  580,  582,  569,  583,  118,  582,  562,  583,
			  586,  587,  568,  803,  588,  589,  586,  587,  557,  803,
			  571,  558,  556,  569,  117,  803,  578,  579,  580,  581,
			  582,  572,  583,  803,  584,  803,  585,  586,  587,  627,
			  563,  588,  589,  590,  591,  592,  595,  592,  558,  803,

			  593,  593,  593,  593,  593,  593,  593,  593,  593,  593,
			  594,  594,  594,  594,  594,  803,  627,  803,  243,  605,
			  605,  605,  605,  595,  528,  528,  528,  528,  528,  803,
			  597,  597,  597,  597,  597,  803,  628,  803,  803,  596,
			  803,  803,  453,  598,  598,  598,  598,  598,  599,  599,
			  599,  599,  599,  600,  600,  600,  600,  600,  601,  601,
			  601,  601,  601,  628,  803,  803,  596,  530,  602,  602,
			  602,  602,  602,  603,  803,  603,  628,  803,  600,  600,
			  600,  600,  600,  604,  604,  604,  604,  604,  562,  614,
			  461,  607,  607,  607,  607,  607,  116,  116,  803,  116,

			  803,  116,  116,  629,  116,  614,  608,  116,  116,  614,
			  116,  116,  116,  803,  116,  803,  630,  116,  116,  118,
			  116,  803,  803,  609,  118,  625,  116,  116,  610,  116,
			  118,  803,  614,  608,  118,  625,  116,  116,  611,  116,
			  118,  116,  116,  630,  116,  626,  803,  803,  612,  118,
			  609,  116,  116,  803,  116,  610,  631,  116,  116,  118,
			  116,  613,  625,  630,  118,  611,  116,  116,  631,  116,
			  116,  116,  616,  116,  118,  612,  634,  803,  615,  803,
			  118,  116,  116,  631,  116,  635,  803,  620,  613,  118,
			  632,  803,  803,  118,  617,  633,  803,  803,  803,  616,

			  636,  619,  803,  634,  118,  615,  116,  116,  618,  116,
			  116,  116,  635,  116,  620,  803,  553,  553,  553,  553,
			  553,  617,  116,  116,  626,  116,  637,  636,  619,  118,
			  635,  636,  637,  118,  626,  618,  117,  641,  641,  623,
			  643,  644,  273,  643,  626,  118,  644,  622,  647,  648,
			  649,  647,  624,  637,  803,  803,  803,  638,  639,  640,
			  803,  626,  803,  117,  641,  642,  623,  643,  644,  273,
			  645,  677,  678,  646,  622,  647,  648,  649,  650,  624,
			  593,  593,  593,  593,  593,  593,  593,  593,  593,  593,
			  651,  651,  651,  651,  651,  652,  803,  652,  677,  678,

			  653,  653,  653,  653,  653,  654,  657,  654,  803,  803,
			  655,  655,  655,  655,  655,  655,  655,  655,  655,  655,
			  656,  656,  656,  656,  656,  803,  116,  116,  371,  116,
			  803,  803,  803,  657,  600,  600,  600,  600,  600,  658,
			  658,  658,  658,  658,  600,  600,  600,  600,  600,  118,
			  803,  803,  530,  660,  660,  660,  660,  660,  661,  661,
			  661,  661,  661,  662,  662,  662,  662,  662,  663,  668,
			  663,  678,  803,  664,  664,  664,  664,  664,  657,  116,
			  116,  803,  116,  116,  116,  668,  116,  116,  116,  668,
			  116,  116,  116,  803,  116,  803,  116,  116,  679,  116,

			  371,  803,  118,  803,  803,  657,  118,  671,  116,  116,
			  118,  116,  668,  680,  118,  680,  667,  803,  666,  118,
			  665,  116,  116,  671,  116,  116,  116,  671,  116,  116,
			  116,  118,  116,  116,  116,  803,  116,  682,  116,  116,
			  680,  116,  681,  667,  118,  666,  682,  665,  118,  684,
			  671,  684,  118,  686,  116,  116,  118,  116,  687,  116,
			  116,  118,  116,  803,  682,  688,  670,  686,  669,  672,
			  803,  803,  803,  683,  803,  803,  684,  118,  685,  803,
			  686,  803,  118,  803,  803,  687,  709,  673,  710,  710,
			  674,  803,  688,  670,  689,  669,  672,  653,  653,  653,

			  653,  653,  690,  690,  690,  690,  690,  655,  655,  655,
			  655,  655,  803,  709,  673,  710,  711,  674,  655,  655,
			  655,  655,  655,  691,  691,  691,  691,  691,  692,  803,
			  692,  803,  803,  693,  693,  693,  693,  693,  803,  453,
			  695,  695,  695,  695,  695,  696,  697,  696,  599,  599,
			  599,  599,  599,  664,  664,  664,  664,  664,  699,  699,
			  699,  699,  699,  657,  116,  116,  803,  116,  116,  116,
			  712,  116,  704,  116,  116,  803,  116,  116,  116,  803,
			  116,  803,  698,  116,  116,  371,  116,  118,  704,  803,
			  657,  118,  704,  700,  803,  461,  118,  712,  116,  116, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  118,  116,  701,  803,  702,  712,  118,  116,  116,  803,
			  116,  803,  703,  116,  116,  704,  116,  714,  714,  716,
			  700,  118,  707,  708,  717,  716,  707,  708,  705,  701,
			  118,  702,  713,  803,  729,  730,  118,  730,  706,  703,
			  803,  803,  707,  708,  714,  715,  716,  772,  772,  772,
			  772,  717,  718,  707,  708,  705,  651,  651,  651,  651,
			  651,  729,  730,  803,  731,  706,  693,  693,  693,  693,
			  693,  719,  719,  719,  719,  719,  720,  720,  720,  720,
			  720,  538,  538,  538,  538,  538,  721,  721,  721,  721,
			  721,  803,  803,  453,  722,  722,  722,  722,  722,  658,

			  658,  658,  658,  658,  116,  116,  803,  116,  530,  116,
			  116,  803,  116,  727,  732,  116,  116,  727,  116,  116,
			  116,  732,  116,  116,  116,  803,  116,  118,  116,  116,
			  734,  116,  118,  727,  803,  728,  461,  723,  118,  728,
			  803,  732,  118,  803,  727,  803,  118,  803,  733,  803,
			  725,  118,  724,  803,  743,  728,  803,  734,  691,  691,
			  691,  691,  691,  803,  723,  744,  728,  116,  116,  803,
			  116,  726,  736,  736,  736,  736,  736,  725,  696,  724,
			  696,  743,  744,  722,  722,  722,  722,  722,  116,  116,
			  118,  116,  744,  116,  116,  530,  116,  746,  726,  746,

			  116,  116,  748,  116,  750,  750,  750,  750,  750,  745,
			  803,  118,  803,  803,  738,  698,  118,  116,  116,  737,
			  116,  755,  756,  118,  746,  762,  747,  116,  116,  748,
			  116,  116,  116,  803,  116,  739,  116,  116,  753,  116,
			  118,  738,  803,  803,  754,  753,  737,  740,  755,  756,
			  118,  754,  762,  803,  118,  803,  760,  803,  753,  118,
			  751,  803,  739,  760,  754,  757,  757,  757,  757,  757,
			  116,  116,  753,  116,  740,  752,  760,  761,  754,  698,
			  698,  698,  698,  698,  761,  116,  116,  751,  116,  803,
			  760,  763,  770,  118,  764,  774,  764,  761,  116,  116,

			  803,  116,  752,  803,  765,  774,  116,  116,  118,  116,
			  803,  761,  776,  803,  803,  774,  759,  758,  763,  770,
			  803,  118,  771,  771,  771,  771,  771,  116,  116,  118,
			  116,  766,  774,  116,  116,  775,  116,  767,  803,  776,
			  803,  803,  803,  759,  758,  775,  803,  782,  803,  782,
			  118,  788,  788,  788,  788,  775,  118,  783,  773,  777,
			  777,  777,  777,  777,  767,  778,  778,  778,  778,  778,
			  779,  780,  775,  781,  781,  781,  781,  781,  803,  803,
			  779,  780,  803,  803,  784,  773,  789,  803,  803,  790,
			  779,  780,  766,  766,  766,  766,  766,  787,  787,  787,

			  787,  787,  789,  803,  793,  790,  789,  779,  780,  790,
			  791,  791,  791,  791,  791,  792,  792,  792,  792,  792,
			  793,  794,  803,  803,  793,  796,  797,  796,  803,  789,
			  803,  803,  790,  803,  803,  803,  803,  794,  803,  803,
			  803,  794,  795,  795,  795,  795,  795,  793,  784,  784,
			  784,  784,  784,  799,  799,  799,  799,  799,  803,  803,
			  803,  803,  798,  803,  794,  800,  800,  800,  800,  800,
			  801,  801,  801,  801,  801,  796,  803,  796,  803,  803,
			  800,  800,  800,  800,  800,  802,  802,  802,  802,  802,
			  798,  798,  798,  798,  798,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  798,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   98,   98,  803,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,  803,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  100,  100,  803,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  117,  117,  117,  803,  803,
			  803,  803,  803,  803,  803,  117,  117,  803,  117,  803,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  803,  803,  117,  117,  117,  117,  117,  117,
			  117,  117,  147,  147,  803,  147,  147,  803,  147,  147,
			  803,  803,  803,  147,  147,  147,  147,  147,  147,  147,

			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  803,  803,  147,  147,  147,
			  147,  147,  147,  147,  147,  148,  148,  803,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  199,  199,  803,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  803,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  803,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,

			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  217,  217,  217,  803,  803,
			  803,  803,  217,  217,  803,  217,  217,  803,  803,  803,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  803,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  230,  230,  803,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,

			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  103,  803,  803,  803,  803,  103,  103,  803,
			  803,  803,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  803,  803,  103,  103,  103,  103,
			  103,  103,  103,  103,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  803,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  252,  803,  803,  803,  252,  252,
			  803,  252,  252,  252,  252,  252,  252,  252,  252,  252,
			  252,  252,  252,  252,  252,  252,  252,  252,  252,  252,
			  252,  252,  252,  252,  252,  803,  803,  252,  252,  252,

			  252,  252,  252,  252,  252,  146,  146,  803,  146,  146,
			  803,  146,  146,  146,  803,  803,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  803,  803,
			  146,  146,  146,  146,  146,  146,  146,  146,  229,  229,
			  229,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  229,  349,  349,  349,  349,

			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  493,  493,  493,  803,
			  803,  803,  803,  493,  493,  803,  493,  493,  803,  803,
			  803,  493,  493,  493,  493,  493,  493,  493,  493,  493,
			  493,  493,  493,  493,  493,  493,  493,  493,  493,  493,
			  493,  493,  493,  803,  803,  493,  493,  493,  493,  493,
			  493,  493,  493,  410,  410,  410,  803,  803,  410,  410,

			  410,  410,  410,  410,  410,  410,  410,  803,  803,  410,
			  410,  410,  410,  410,  410,  410,  410,  410,  410,  410,
			  410,  410,  410,  410,  410,  410,  410,  410,  410,  410,
			  410,  803,  803,  410,  410,  410,  410,  410,  410,  410,
			  410,  561,  561,  561,  803,  803,  803,  803,  561,  561,
			  803,  561,  561,  803,  803,  803,  561,  561,  561,  561,
			  561,  561,  561,  561,  561,  561,  561,  561,  561,  561,
			  561,  561,  561,  561,  561,  561,  561,  561,  803,  561,
			  561,  561,  561,  561,  561,  561,  561,  561,  606,  606,
			  606,  606,  606,  606,  606,  606,  606,  803,  606,  606,

			  606,  606,  606,  606,  606,  606,  606,  606,  606,  606,
			  606,  606,  606,  606,  606,  606,  606,  606,  606,  606,
			  606,  606,  606,  606,  606,  606,  606,  606,  606,  606,
			  606,  606,  606,  606,  606,  606,  606,  606,   13,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803, yy_Dummy>>,
			1, 927, 4000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4926)
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
			   29,  780,   29,   29,   29,   29,   29,   38,   38,   59,
			   38,   61,   76,   63,   64,    5,    6,   30,   68,   30,
			   59,   30,   30,   30,   30,   30,   58,   67,    3,   20,
			   38,  779,   67,    4,   11,  761,   59,   12,   61,   29,
			   63,   64,    5,    6,   92,   68,   74,   59,   74,   74,
			   95,  760,   95,   95,   67,  735,  735,   76,   30,   67,
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
			  720,   37,   39,   39,   69,   39,  223,   40,   40,  691,
			   40,   41,   41,  658,   41,  651,  150,   42,   42,  150,
			   42,   37,   52,   52,  150,   39,  214,   52,   52,   39,

			   40,   69,  626,   37,   41,   37,   43,   43,   41,   43,
			   42,   78,   40,   44,   44,  201,   44,  201,  201,   41,
			   42,   45,   45,   40,   45,  466,   39,  625,  223,   43,
			   37,  214,   37,   66,   60,   41,   44,   52,   82,   40,
			   44,   66,   43,   43,   45,   60,   41,   42,   43,   80,
			   40,   46,   46,  602,   46,   51,   51,  154,   51,   45,
			   66,   60,   48,   48,  466,   48,  342,   44,   66,   43,
			   43,   77,   60,   82,   46,   43,   50,   50,   51,   50,
			   46,  155,   62,   62,  154,   48,   45,   78,   62,   65,
			   49,   49,   46,   49,   79,   48,   84,   81,  554,   50,

			   82,   65,   51,   48,  495,  494,  158,   46,  155,   62,
			   62,  473,  462,   49,   50,   62,   65,  159,  455,   46,
			   47,   47,   48,   47,   80,   80,  447,   49,   65,   51,
			   48,   84,   49,  158,  160,  161,   47,   47,   47,   47,
			   47,   50,  342,   47,  159,   77,   77,   77,   87,   87,
			   47,   87,  116,  116,   49,  116,   47,  727,   84,   49,
			  446,  160,  161,   47,  162,   47,  164,   47,   79,   79,
			   79,   81,   81,   81,  166,  116,  377,   47,  108,  108,
			  108,  108,  108,   47,  111,  111,  111,  111,  111,  354,
			  167,  162,   47,  164,   47,   56,  349,  727,   56,   87,

			  336,  166,  333,   56,  109,  109,  109,  109,  109,  310,
			  308,   56,   56,   56,   56,   56,   56,  167,  239,  109,
			  239,  239,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   88,   88,  109,   88,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   57,   89,   89,   57,   89,  292,  220,  220,   57,  220,
			  659,  659,  659,   89,   89,  289,   57,   57,   57,   57,
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

			  147,  123,  125,   73,  182,  122,  127,  127,  183,  127,
			  124,  120,  119,  126,   70,  126,  129,  129,  181,  129,
			  125,  128,  128,  123,  128,  184,  121,  185,  123,  127,
			  147,  182,  122,  130,  130,  183,  130,  124,   55,  129,
			  131,  131,   36,  131,  128,  127,  186,  125,  133,  133,
			  128,  133,  184,  128,  185,   35,  130,  165,  132,  132,
			   33,  132,  165,  131,   28,  135,  135,   26,  135,  129,
			   18,  133,  127,  186,   17,  344,  130,  128,  133,  134,
			  128,  132,  134,  131,  165,  134,  187,  132,  135,  165,
			   16,  134,  134,   13,  134,  188,  134,  136,  136,    0,

			  136,  138,  138,  130,  138,  133,  134,    0,  135,  134,
			  131,  189,  134,  187,  132,    0,  140,  140,  134,  140,
			  136,  134,  188,  134,  138,  143,  143,  136,  143,    0,
			  191,  138,  193,  139,  139,  139,  139,  139,  189,  140,
			  136,  190,  136,    0,  138,  190,    0,  140,  143,  140,
			  344,  344,  141,  141,  136,  141,  143,  191,  138,  193,
			  139,    0,  145,  145,  139,  145,  204,    0,  190,  136,
			  137,  137,  190,  137,  140,  141,  140,  142,  142,  205,
			  142,  144,  144,  143,  144,  145,  137,  137,  137,  137,
			  137,  139,  194,  137,  176,  206,  141,  176,  192,  195, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  142,  196,  192,  137,  144,  197,  137,  215,  215,  145,
			  215,  142,  137,  209,  293,  142,  211,  216,  216,  194,
			  216,  176,  144,  141,  176,  192,  195,    0,  196,  192,
			  137,  207,  197,  137,  208,  297,  145,    0,  142,  137,
			    0,  293,  142,  204,  204,  204,  204,  204,  209,  144,
			  152,  211,  299,  205,  205,  205,  222,  222,  215,  222,
			  217,  217,  297,  217,  249,  249,  249,  249,  216,  206,
			  206,  206,  217,  352,  352,  209,  352,  300,  211,  299,
			    0,    0,  217,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,

			  152,  152,  152,  152,  300,  207,  207,  207,  208,  208,
			  208,  217,  219,  219,    0,  219,  228,  228,    0,  228,
			  238,  238,  261,  238,  219,  233,  233,  233,  233,  233,
			  233,  242,  261,  242,  219,  301,  242,  242,  242,  242,
			  242,  228,  261,  238,  243,  243,  243,  243,  243,  244,
			  244,  244,  244,  244,  250,  250,  250,  250,  250,  261,
			    0,    0,  301,  219,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  224,  224,  247,  224,  247,    0,    0,  247,
			  247,  247,  247,  247,    0,  248,    0,  248,    0,  248,
			  248,  248,  248,  248,    0,  353,  353,  224,  353,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,

			  224,  241,  241,  241,  241,  241,  248,  246,  246,  246,
			  246,  246,  253,  253,  302,  253,  241,  254,  254,    0,
			  254,  303,  246,  255,  255,  304,  255,    0,    0,  224,
			  305,  256,  256,    0,  256,  253,  257,  257,  241,  257,
			  254,  302,    0,  241,  246,    0,  255,    0,  303,  246,
			  253,    0,  304,  255,  256,  258,  258,  305,  258,  257,
			  259,  259,  256,  259,  260,  260,    0,  260,  306,  262,
			  262,  257,  262,  263,  263,    0,  263,  253,  258,  307,
			  255,    0,    0,  259,  309,  409,  409,  260,  409,  256,
			  266,  266,  262,  266,  312,  306,  263,  258,  257,    0,

			  264,  264,  259,  264,  262,    0,  307,    0,  263,  265,
			  265,  309,  265,  266,  313,  267,  267,  260,  267,  266,
			  314,  312,    0,  264,  258,  268,  268,  315,  268,  259,
			  316,  262,  265,  317,  264,  263,  269,  269,  267,  269,
			    0,  313,    0,  265,    0,    0,  266,  314,  268,  276,
			  276,  276,  276,  276,  315,  270,  270,  316,  270,  269,
			  317,  264,    0,  271,  271,  318,  271,  269,  319,  268,
			  265,  270,  270,  270,  270,  270,    0,    0,  270,  271,
			  271,  271,  271,  271,  272,  272,  271,  272,  273,  273,
			  277,  273,  318,  277,  269,  319,  268,    0,  270,  277,

			  272,  272,  272,  272,  272,  274,  274,  272,  274,  449,
			  449,  273,  449,  275,  275,    0,  275,  277,    0,    0,
			  277,  274,  274,  274,  274,  274,  277,  272,  274,  275,
			  275,  275,  275,  275,  320,  323,  275,  278,  278,  278,
			  278,  278,  279,  279,  324,  279,  280,  280,  274,  280,
			  281,  281,  325,  281,  278,    0,  275,  282,  282,    0,
			  282,  320,  323,  283,  283,  279,  283,  284,  284,  280,
			  284,  324,    0,  281,  285,  285,  326,  285,  282,  325,
			  282,  278,  286,  286,  279,  286,  283,  281,    0,  327,
			  284,    0,  328,  341,  283,  287,  287,  285,  287,  288,

			  288,  343,  288,  326,  329,  286,  330,  284,  345,  311,
			  331,  279,  332,  346,  281,  285,  327,  334,  287,  328,
			  311,  283,  288,  295,  347,  295,  295,  295,  295,  295,
			  311,  329,  335,  330,  284,  286,  339,  331,  340,  332,
			  311,    0,  285,    0,  334,  296,  288,  296,  296,  296,
			  296,  296,  350,  350,    0,  350,    0,  311,  411,  335,
			  385,    0,    0,  339,  350,  340,    0,  341,  341,  341,
			  385,    0,    0,  288,  350,  343,  343,  343,  351,  351,
			  385,  351,  345,  345,  345,  411,    0,  346,  346,  346,
			  355,  355,    0,  355,  412,  413,    0,  385,  347,  347,

			  347,  414,    0,  350,  358,  358,  358,  358,  358,  358,
			  364,  364,  364,  364,  364,  355,  365,  365,  365,  365,
			  365,  412,  413,  380,  380,  364,  380,    0,  414,  351,
			  366,  366,  366,  366,  366,  367,  367,  367,  367,  367,
			  368,  368,  368,  368,  368,    0,  380,  364,  450,  450,
			    0,  450,  364,  369,  369,  369,  369,  369,  371,  371,
			  371,  371,  371,    0,  370,  416,  370,  366,  369,  370,
			  370,  370,  370,  370,  372,  372,  372,  372,  372,  373,
			  373,  373,  373,  373,  375,  375,  375,  375,  375,    0,
			  369,    0,  416,  374,  374,  369,  374,  374,  374,  374,

			  374,  376,  376,  376,  376,  376,  378,  378,  417,  378,
			  379,  379,    0,  379,  381,  381,  373,  381,  382,  382,
			    0,  382,  383,  383,    0,  383,    0,  384,  384,  378,
			  384,  491,  491,  379,  491,  417,  419,  381,    0,  386,
			  386,  382,  386,  420,  379,  383,  387,  387,    0,  387,
			  384,  378,    0,  383,  384,  421,  388,  388,  381,  388,
			    0,  382,  386,  419,  389,  389,    0,  389,    0,  387,
			  420,  379,  422,  386,  390,  390,  423,  390,  378,  388,
			  383,  384,  421,  391,  391,  381,  391,  389,  382,  424,
			  387,  392,  392,  388,  392,  394,  425,  390,  394,  422,

			  386,  389,    0,  423,  394,    0,  391,  390,    0,  393,
			  393,  393,  393,  393,  392,  426,  424,  387,    0,    0,
			  388,  427,  394,  425,  391,  394,  393,    0,  389,  393,
			    0,  394,  392,    0,  390,  393,    0,  395,  395,  395,
			  395,  395,  426,  396,  396,  396,  396,  396,  427,    0,
			    0,  391,    0,  393,  395,  428,  393,  396,  429,  392,
			  397,  397,  393,  397,  398,  398,  398,  398,  398,  430,
			  401,  401,  396,  401,    0,    0,  397,  397,  397,  397,
			  397,  395,  428,  397,  396,  429,    0,    0,  402,  402,
			  397,  402,    0,  401,  431,  398,  430,  432,    0,  396, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  399,  399,  399,  399,  399,  400,  400,  400,  400,  400,
			  403,  402,  404,  404,  399,  404,    0,  397,    0,  400,
			  403,  431,  398,  433,  432,  405,  405,    0,  405,  434,
			  403,  406,  406,  435,  406,  404,  407,  407,    0,  407,
			  436,  399,  408,  408,  441,  408,  400,  403,  405,  442,
			  433,  444,  443,  445,  406,  408,  434,    0,    0,  407,
			  435,  406,  443,  407,    0,  408,    0,  436,    0,  405,
			    0,  441,  496,  407,    0,    0,  442,    0,  444,  443,
			  445,    0,  451,  451,  451,  451,  451,    0,  406,  443,
			  407,  452,  452,  452,  452,  452,  405,  451,    0,  496,

			  407,  453,  453,  453,  453,  453,  454,  454,  454,  454,
			  454,  456,  456,  456,  456,  456,  457,  457,  457,  457,
			  457,    0,  471,  471,  451,  471,  456,    0,  452,  458,
			  458,  458,  458,  458,  459,  459,  459,  459,  459,  460,
			  460,  460,  460,  460,    0,  471,    0,    0,  456,  467,
			  467,    0,  467,  456,  461,  461,  461,  461,  461,  463,
			  463,  463,  463,  463,  497,  464,  458,  464,  464,  464,
			  464,  464,  467,  465,  463,  465,  460,  468,  468,    0,
			  468,  469,  469,  465,  469,  470,  470,    0,  470,  472,
			  472,  497,  472,  485,  474,  474,  498,  474,    0,  500,

			  468,  463,  467,  485,  469,    0,  475,  475,  470,  475,
			  465,  469,  472,  485,  468,    0,  470,  474,    0,  476,
			  476,  503,  476,  498,  472,  474,  500,  470,    0,  475,
			  485,  505,  477,  477,    0,  477,  475,    0,  469,  506,
			  490,  468,  476,  470,  478,  478,    0,  478,  503,    0,
			  490,  472,  474,  476,  470,  477,  479,  479,  505,  479,
			  490,  480,  480,  475,  480,    0,  506,  478,  481,  481,
			  481,  481,  481,  482,  482,  478,  482,  490,    0,  479,
			  476,    0,  481,    0,  480,  483,  483,  483,  483,  483,
			  486,  486,  480,  486,    0,  507,  482,  479,  509,  483,

			  488,  488,  478,  488,    0,  483,    0,  492,  492,  481,
			  492,  483,    0,  486,  487,  487,  482,  487,    0,  480,
			    0,  486,  507,  488,  479,  509,  483,  484,  484,  484,
			  484,  484,  483,  489,  489,  499,  489,  487,  483,  493,
			  493,  488,  493,  501,    0,  487,  499,  484,  486,  510,
			  511,  512,  513,  514,  501,  515,  489,  516,  492,  517,
			  518,  519,  499,    0,  520,  521,  522,  523,  488,    0,
			  501,  489,  487,  499,  484,    0,  510,  511,  512,  513,
			  514,  501,  515,    0,  516,    0,  517,  518,  519,  564,
			  493,  520,  521,  522,  523,  524,  527,  524,  489,    0,

			  524,  524,  524,  524,  524,  525,  525,  525,  525,  525,
			  526,  526,  526,  526,  526,    0,  564,    0,  527,  537,
			  537,  537,  537,  527,  528,  528,  528,  528,  528,    0,
			  529,  529,  529,  529,  529,    0,  565,  561,  561,  528,
			    0,    0,  525,  530,  530,  530,  530,  530,  531,  531,
			  531,  531,  531,  532,  532,  532,  532,  532,  533,  533,
			  533,  533,  533,  565,    0,    0,  528,  529,  534,  534,
			  534,  534,  534,  535,    0,  535,  566,    0,  535,  535,
			  535,  535,  535,  536,  536,  536,  536,  536,  561,  546,
			  532,  539,  539,  539,  539,  539,  540,  540,    0,  540,

			    0,  541,  541,  566,  541,  546,  539,  542,  542,  546,
			  542,  543,  543,    0,  543,    0,  567,  544,  544,  540,
			  544,    0,    0,  540,  541,  559,  545,  545,  541,  545,
			  542,    0,  546,  539,  543,  559,  547,  547,  542,  547,
			  544,  548,  548,  567,  548,  559,    0,    0,  543,  545,
			  540,  549,  549,    0,  549,  541,  568,  552,  552,  547,
			  552,  545,  559,  570,  548,  542,  550,  550,  571,  550,
			  551,  551,  548,  551,  549,  543,  573,    0,  547,    0,
			  552,  555,  555,  568,  555,  574,    0,  552,  545,  550,
			  570,    0,    0,  551,  549,  571,    0,    0,    0,  548,

			  575,  551,    0,  573,  555,  547,  556,  556,  550,  556,
			  557,  557,  574,  557,  552,    0,  553,  553,  553,  553,
			  553,  549,  558,  558,  560,  558,  576,  575,  551,  556,
			  577,  578,  579,  557,  560,  550,  553,  580,  581,  557,
			  582,  583,  553,  584,  560,  558,  585,  556,  587,  588,
			  589,  591,  558,  576,    0,    0,    0,  577,  578,  579,
			    0,  560,    0,  553,  580,  581,  557,  582,  583,  553,
			  584,  627,  628,  585,  556,  587,  588,  589,  591,  558,
			  592,  592,  592,  592,  592,  593,  593,  593,  593,  593,
			  594,  594,  594,  594,  594,  595,    0,  595,  627,  628,

			  595,  595,  595,  595,  595,  596,  599,  596,    0,    0,
			  596,  596,  596,  596,  596,  597,  597,  597,  597,  597,
			  598,  598,  598,  598,  598,    0,  611,  611,  599,  611,
			    0,    0,    0,  599,  600,  600,  600,  600,  600,  601,
			  601,  601,  601,  601,  603,  603,  603,  603,  603,  611,
			    0,    0,  597,  604,  604,  604,  604,  604,  605,  605,
			  605,  605,  605,  607,  607,  607,  607,  607,  608,  614,
			  608,  629,    0,  608,  608,  608,  608,  608,  607,  609,
			  609,    0,  609,  610,  610,  614,  610,  612,  612,  614,
			  612,  613,  613,    0,  613,    0,  615,  615,  629,  615,

			  607,    0,  609,    0,    0,  607,  610,  621,  616,  616,
			  612,  616,  614,  631,  613,  633,  612,    0,  610,  615,
			  609,  617,  617,  621,  617,  618,  618,  621,  618,  619,
			  619,  616,  619,  620,  620,    0,  620,  637,  622,  622,
			  631,  622,  633,  612,  617,  610,  640,  609,  618,  643,
			  621,  645,  619,  647,  623,  623,  620,  623,  648,  624,
			  624,  622,  624,    0,  637,  649,  619,  650,  617,  622,
			    0,    0,    0,  640,    0,    0,  643,  623,  645,    0,
			  647,    0,  624,    0,    0,  648,  677,  623,  678,  679,
			  624,    0,  649,  619,  650,  617,  622,  652,  652,  652,

			  652,  652,  653,  653,  653,  653,  653,  654,  654,  654,
			  654,  654,    0,  677,  623,  678,  679,  624,  655,  655,
			  655,  655,  655,  656,  656,  656,  656,  656,  657,    0,
			  657,    0,    0,  657,  657,  657,  657,  657,    0,  653,
			  660,  660,  660,  660,  660,  661,  661,  661,  662,  662,
			  662,  662,  662,  663,  663,  663,  663,  663,  664,  664,
			  664,  664,  664,  662,  665,  665,    0,  665,  666,  666,
			  680,  666,  671,  667,  667,    0,  667,  669,  669,    0,
			  669,    0,  661,  670,  670,  662,  670,  665,  671,    0,
			  662,  666,  671,  665,    0,  664,  667,  680,  672,  672, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  669,  672,  666,    0,  667,  681,  670,  673,  673,    0,
			  673,    0,  670,  674,  674,  671,  674,  684,  685,  686,
			  665,  672,  675,  676,  687,  689,  675,  676,  672,  666,
			  673,  667,  681,    0,  709,  710,  674,  711,  673,  670,
			    0,    0,  675,  676,  684,  685,  686,  765,  765,  765,
			  765,  687,  689,  675,  676,  672,  690,  690,  690,  690,
			  690,  709,  710,    0,  711,  673,  692,  692,  692,  692,
			  692,  693,  693,  693,  693,  693,  694,  694,  694,  694,
			  694,  695,  695,  695,  695,  695,  696,  696,  696,  696,
			  696,    0,    0,  690,  697,  697,  697,  697,  697,  699,

			  699,  699,  699,  699,  700,  700,    0,  700,  693,  701,
			  701,    0,  701,  707,  714,  702,  702,  707,  702,  703,
			  703,  715,  703,  705,  705,    0,  705,  700,  706,  706,
			  717,  706,  701,  707,    0,  708,  699,  700,  702,  708,
			    0,  714,  703,    0,  707,    0,  705,    0,  715,    0,
			  703,  706,  701,    0,  729,  708,    0,  717,  719,  719,
			  719,  719,  719,    0,  700,  730,  708,  724,  724,    0,
			  724,  706,  721,  721,  721,  721,  721,  703,  722,  701,
			  722,  729,  731,  722,  722,  722,  722,  722,  723,  723,
			  724,  723,  730,  725,  725,  719,  725,  732,  706,  733,

			  726,  726,  734,  726,  736,  736,  736,  736,  736,  731,
			    0,  723,    0,    0,  724,  722,  725,  737,  737,  723,
			  737,  743,  748,  726,  732,  755,  733,  738,  738,  734,
			  738,  739,  739,    0,  739,  725,  740,  740,  741,  740,
			  737,  724,    0,    0,  742,  741,  723,  726,  743,  748,
			  738,  742,  755,    0,  739,    0,  753,    0,  741,  740,
			  737,    0,  725,  753,  742,  749,  749,  749,  749,  749,
			  751,  751,  741,  751,  726,  740,  753,  754,  742,  750,
			  750,  750,  750,  750,  754,  752,  752,  737,  752,    0,
			  753,  756,  762,  751,  757,  768,  757,  754,  758,  758,

			    0,  758,  740,    0,  757,  768,  759,  759,  752,  759,
			    0,  754,  770,    0,    0,  768,  752,  751,  756,  762,
			    0,  758,  764,  764,  764,  764,  764,  767,  767,  759,
			  767,  757,  768,  773,  773,  769,  773,  758,    0,  770,
			    0,    0,    0,  752,  751,  769,    0,  778,    0,  778,
			  767,  783,  783,  783,  783,  769,  773,  778,  767,  771,
			  771,  771,  771,  771,  758,  772,  772,  772,  772,  772,
			  774,  775,  769,  777,  777,  777,  777,  777,    0,    0,
			  774,  775,    0,    0,  778,  767,  785,    0,    0,  786,
			  774,  775,  781,  781,  781,  781,  781,  782,  782,  782,

			  782,  782,  785,    0,  789,  786,  785,  774,  775,  786,
			  787,  787,  787,  787,  787,  788,  788,  788,  788,  788,
			  789,  790,    0,    0,  789,  792,  792,  792,    0,  785,
			    0,    0,  786,    0,    0,    0,    0,  790,    0,    0,
			    0,  790,  791,  791,  791,  791,  791,  789,  795,  795,
			  795,  795,  795,  796,  796,  796,  796,  796,    0,    0,
			    0,    0,  792,    0,  790,  797,  797,  797,  797,  797,
			  799,  799,  799,  799,  799,  800,    0,  800,    0,    0,
			  800,  800,  800,  800,  800,  801,  801,  801,  801,  801,
			  802,  802,  802,  802,  802,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  800,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,

			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,

			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  808,  808,    0,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,    0,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  809,  809,    0,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  811,  811,  811,    0,    0,
			    0,    0,    0,    0,    0,  811,  811,    0,  811,    0,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,    0,    0,  811,  811,  811,  811,  811,  811,
			  811,  811,  812,  812,    0,  812,  812,    0,  812,  812,
			    0,    0,    0,  812,  812,  812,  812,  812,  812,  812,

			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,    0,    0,  812,  812,  812,
			  812,  812,  812,  812,  812,  813,  813,    0,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  814,  814,    0,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,    0,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,    0,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,

			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  817,  817,  817,    0,    0,
			    0,    0,  817,  817,    0,  817,  817,    0,    0,    0,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,    0,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,

			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  820,  820,    0,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,

			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  821,    0,    0,    0,    0,  821,  821,    0,
			    0,    0,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,    0,    0,  821,  821,  821,  821,
			  821,  821,  821,  821,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,

			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,    0,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  824,    0,    0,    0,  824,  824,
			    0,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,    0,    0,  824,  824,  824,

			  824,  824,  824,  824,  824,  825,  825,    0,  825,  825,
			    0,  825,  825,  825,    0,    0,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,    0,    0,
			  825,  825,  825,  825,  825,  825,  825,  825,  826,  826,
			  826,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  826,  827,  827,  827,  827,

			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  828,  828,  828,    0,
			    0,    0,    0,  828,  828,    0,  828,  828,    0,    0,
			    0,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,    0,    0,  828,  828,  828,  828,  828,
			  828,  828,  828,  829,  829,  829,    0,    0,  829,  829,

			  829,  829,  829,  829,  829,  829,  829,    0,    0,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,    0,    0,  829,  829,  829,  829,  829,  829,  829,
			  829,  830,  830,  830,    0,    0,    0,    0,  830,  830,
			    0,  830,  830,    0,    0,    0,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,    0,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,    0,  831,  831,

			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803, yy_Dummy>>,
			1, 927, 4000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   86,   91,   73,   74,    0,    0,  179,
			    0,   65,   68,  893, 4838,   95,  887,  848,  863, 4838,
			   87,    0, 4838, 4838, 4838, 4838,  852,   85,  847,   94,
			  113, 4838, 4838,  834, 4838,  829,  814,  266,  115,  270,
			  275,  279,  285,  304,  311,  319,  349,  418,  360,  388,
			  374,  353,  282, 4838, 4838,  784,  493,  568,   80,   82,
			  305,   86,  344,   94,   84,  358,  298,   98,   88,  225,
			  797, 4838, 4838,  796,  154, 4838,  115,  364,  304,  387,
			  342,  390,  321, 4838,  379,  745, 4838,  446,  542,  569,
			  643, 4838,   75,  695, 4838,  158,  791, 4838,  765, 4838,

			  762,    0,  640,  754,  757,  736,  633, 4838,  460,  486,
			  654,  466,  664, 4838, 4838, 4838,  450,  744,    0,  748,
			  752,  756,  761,  765,  773,  777,  790,  804,  819,  814,
			  831,  838,  856,  846,  847,  863,  895,  968,  899,  915,
			  914,  950,  975,  923,  979,  960,  725,  777,  669, 4838,
			  284,  709, 1027,  701,  320,  349,    0,  683,  369,  385,
			  391,  392,  420,  658,  422,  826,  437,  447,  555,  551,
			  692,  690,  579,  656,  656,  623,  963,  652,  636,  711,
			  717,  746,  773,  776,  794,  795,  813,  840,  862,  865,
			  905,  897,  962,  899,  949,  956,  952,  956, 4838,  688,

			 4838,  313, 4838, 4838,  959,  972,  988, 1024, 1027,  996,
			 4838,  999,  627, 4838,  279, 1005, 1015, 1058, 4838, 1110,
			  574, 1163, 1054,  249, 1250, 4838, 4838,  644, 1114, 4838,
			 4838, 4838,  660, 1108,  656,  654,  647,  641, 1118,  516,
			 4838, 1283, 1118, 1126, 1131, 4838, 1289, 1241, 1251, 1046,
			 1136, 4838,  569, 1310, 1315, 1321, 1329, 1334, 1353, 1358,
			 1362, 1094, 1367, 1371, 1398, 1407, 1388, 1413, 1423, 1434,
			 1453, 1461, 1482, 1486, 1503, 1511, 1431, 1455, 1519, 1540,
			 1544, 1548, 1555, 1561, 1565, 1572, 1580, 1593, 1597,  562,
			 4838, 4838,  558,  974,    0, 1607, 1629,  995,    0, 1020,

			 1045, 1102, 1277, 1277, 1292, 1293, 1324, 1335,  455, 1340,
			  454, 1592, 1357, 1377, 1384, 1391, 1393, 1396, 1429, 1437,
			 1503,    0,    0, 1489, 1511, 1506, 1543, 1550, 1559, 1565,
			 1573, 1568, 1569,  447, 1575, 1589,  445,    0,    0, 1587,
			 1589, 1586,  359, 1594,  868, 1601, 1606, 1617, 4838,  493,
			 1650, 1676, 1071, 1273,  486, 1688, 4838, 4838, 1687, 4838,
			 4838, 4838, 4838, 4838, 1692, 1698, 1712, 1717, 1722, 1735,
			 1751, 1740, 1756, 1761, 1778, 1766, 1783,  449, 1804, 1808,
			 1721, 1812, 1816, 1820, 1825, 1632, 1837, 1844, 1854, 1862,
			 1872, 1881, 1889, 1891, 1860, 1919, 1925, 1958, 1946, 1982,

			 1987, 1968, 1986, 1982, 2010, 2023, 2029, 2034, 2040, 1383,
			    0, 1611, 1647, 1659, 1665,    0, 1719, 1763,    0, 1790,
			 1798, 1822, 1843, 1843, 1853, 1850, 1876, 1882, 1919, 1912,
			 1930, 1959, 1962, 1980, 1986, 1990, 1997,    0,    0,    0,
			    0, 1998, 2017, 2023, 2005, 2021,  445,  411, 4838, 1507,
			 1746, 2064, 2073, 2083, 2088,  404, 2093, 2098, 2111, 2116,
			 2121, 2136,  394, 2141, 2149, 2160,  309, 2147, 2175, 2179,
			 2183, 2120, 2187,  388, 2192, 2204, 2217, 2230, 2242, 2254,
			 2259, 2250, 2271, 2267, 2309, 2165, 2288, 2312, 2298, 2331,
			 2212, 1829, 2305, 2337,  350,  349, 2033, 2125, 2164, 2302,

			 2167, 2310,    0, 2184,    0, 2198, 2207, 2259,    0, 2265,
			 2317, 2314, 2318, 2319, 2310, 2322, 2314, 2326, 2327, 2328,
			 2321, 2325, 2333, 2334, 2382, 2387, 2392, 2363, 2406, 2412,
			 2425, 2430, 2435, 2440, 2450, 2460, 2465, 2401, 4838, 2473,
			 2494, 2499, 2505, 2509, 2515, 2524, 2461, 2534, 2539, 2549,
			 2564, 2568, 2555, 2598,  375, 2579, 2604, 2608, 2620, 2497,
			 2596, 2435, 4838, 4838, 2360, 2407, 2447, 2483, 2517,    0,
			 2530, 2529,    0, 2539, 2541, 2567, 2581, 2586, 2598, 2587,
			 2593, 2594, 2607, 2609, 2610, 2614,    0, 2605, 2618, 2618,
			    0, 2608, 2662, 2667, 2672, 2682, 2692, 2697, 2702, 2673,

			 2716, 2721,  338, 2726, 2735, 2740, 4838, 2745, 2755, 2777,
			 2781, 2724, 2785, 2789, 2741, 2794, 2806, 2819, 2823, 2827,
			 2831, 2779, 2836, 2852, 2857,  312,  287, 2628, 2635, 2734,
			    0, 2782,    0, 2784,    0,    0,    0, 2788,    0,    0,
			 2797,    0,    0, 2810,    0, 2812,    0, 2820, 2823, 2832,
			 2834,  230, 2879, 2884, 2889, 2900, 2905, 2915,  228,  562,
			 2922, 2932, 2930, 2935, 2940, 2962, 2966, 2971, 4838, 2975,
			 2981, 2944, 2996, 3005, 3011, 2994, 2995, 2855, 2852, 2853,
			 2937, 2972,    0,    0, 2986, 2987, 2987, 2991,    0, 2993,
			 3038,  224, 3048, 3053, 3058, 3063, 3068, 3076, 4838, 3081,

			 3102, 3107, 3113, 3117, 4838, 3121, 3126, 3085, 3107, 2999,
			 2990, 2992,    0,    0, 3081, 3088,    0, 3085,    0, 3140,
			  225, 3154, 3165, 3186, 3165, 3191, 3198,  452, 4838, 3121,
			 3116, 3133, 3153, 3155, 3153,  147, 3186, 3215, 3225, 3229,
			 3234, 3210, 3216, 3176,    0,    0,    0,    0, 3181, 3247,
			 3261, 3268, 3283, 3228, 3249, 3176, 3258, 3281, 3296, 3304,
			  138,  122, 3251,    0, 3304, 3029, 4838, 3325, 3267, 3307,
			 3279, 3341, 3347, 3331, 3342, 3343,    0, 3355, 3334,  118,
			   88, 3374, 3379, 3333, 4838, 3358, 3361, 3392, 3397, 3376,
			 3393, 3424, 3412, 4838, 4838, 3430, 3435, 3447, 4838, 3452,

			 3462, 3467, 3472, 4838, 3512, 3562, 3612, 3662, 3712, 3762,
			 3796, 3833, 3876, 3924, 3974, 4024, 4074, 4123, 4171, 4221,
			 4271, 4315, 4363, 4413, 4456, 4499, 4546, 4595, 4644, 4692,
			 4739, 4787, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  803,    1,  804,  804,  805,  805,  806,  806,  803,
			    9,  807,  807,  803,  803,  803,  803,  803,  808,  803,
			  809,  810,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  812,  803,  803,  813,  803,  803,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  803,  803,  803,  814,  803,  803,  803,  814,  814,  814,
			  814,  814,  815,  803,  815,  816,  803,  817,  803,  817,
			  817,  803,  818,  819,  803,  803,  803,  803,  808,  803,

			  820,  820,  820,  821,  822,  803,  803,  803,  803,  823,
			  803,  803,  803,  803,  803,  803,  803,  811,  824,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,   47,  811,  811,  811,  811,   47,
			  811,  811,  811,  811,  811,  811,  825,  812,  813,  803,
			  803,  803,   57,  803,  152,  152,   57,   57,   57,   57,
			  152,   57,  152,  152,   57,   57,  152,  152,   57,   57,
			  152,   57,  152,  152,  152,   57,   57,   57,  152,   57,
			  152,   57,  152,  152,   57,   57,  152,  152,   57,   57,
			  152,  152,   57,   57,  152,   57,  152,   57,  803,  814,

			  803,  803,  803,  803,  814,  814,  814,  814,  814,  815,
			  803,  815,  816,  803,  816,  817,  803,  817,  803,  803,
			  803,  803,  803,  818,  819,  803,  803,  224,  826,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  824,  811,  811,  811,  811,  811,  811,  811,
			  811,  803,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  137,  137,  137,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  803,
			  803,  803,  803,  152,  152,  803,  152,   57,   57,  152,

			   57,  152,  152,  152,   57,   57,   57,  152,  152,   57,
			   57,  803,  152,  152,  152,  152,   57,   57,   57,  152,
			   57,  152,   57,  152,  152,   57,   57,  152,  152,   57,
			   57,  152,  152,  152,   57,   57,   57,  152,   57,  152,
			   57,  814,  814,  814,  814,  814,  814,  814,  803,  827,
			  827,  803,  827,  827,  827,  826,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  824,  811,  811,
			  811,  811,  811,  811,  811,  803,  811,  811,  811,  811,
			  811,  811,  811,  137,  137,  393,  393,  811,  134,  397,

			  397,  811,  811,  803,  811,  811,  811,  811,  811,  828,
			  829,  152,   57,  152,   57,  152,  152,  152,   57,   57,
			   57,  152,  152,   57,  152,  152,  152,  152,   57,   57,
			   57,  152,   57,  152,  152,   57,   57,  152,  152,   57,
			   57,  152,  152,  152,   57,   57,  152,   57,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  823,  803,  803,  803,  811,  811,  811,
			  811,  811,  811,  803,  811,  811,  811,  811,  811,  811,
			  811,  397,  811,  397,  483,  803,  811,  811,  811,  811,
			  803,  803,  830,  828,  152,   57,  152,   57,  152,  152,

			   57,   57,  152,  152,   57,  152,  152,  152,  152,   57,
			   57,   57,  152,   57,  152,  152,   57,   57,  152,  152,
			  152,  152,   57,   57,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  831,
			  811,  811,  811,  811,  811,  811,  803,  811,  811,  811,
			  811,  811,  811,  483,  803,  811,  811,  811,  811,  803,
			  803,  830,  803,  803,  152,  152,   57,  152,  152,  152,
			   57,   57,   57,  152,  152,  152,  152,   57,   57,   57,
			  152,   57,  152,  152,   57,   57,  152,  152,  152,  152,
			   57,   57,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  811,
			  811,  811,  811,  811,  803,  811,  811,  811,  811,  811,
			  811,  803,  811,  811,  811,  803,  803,  152,  152,   57,
			  152,  152,   57,   57,  152,  152,  152,  152,   57,   57,
			   57,  152,   57,  152,  152,   57,   57,  152,  152,  152,
			   57,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  811,  811,  811,  803,  811,
			  811,  803,  811,  811,  811,  803,  803,  152,  152,   57,
			  152,   57,  152,   57,  152,   57,  152,  152,  152,   57,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  811,  811,  811,  811,  803,  811,  811,  803,  803,  152,
			  152,   57,  152,   57,  152,   57,  152,  152,   57,  803,
			  803,  803,  803,  811,  811,  811,  811,  803,  803,  152,
			  152,   57,  152,   57,  152,  803,  803,  811,  811,  811,
			  811,  803,  803,  152,  152,   57,  152,   57,  152,  803,
			  803,  811,  811,  803,  803,  152,  152,  803,  811,  811,
			  803,  803,  152,  152,  803,  803,  803,  811,  803,  803,
			  152,  803,  803,  811,  803,  803,  152,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,    0,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803, yy_Dummy>>)
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
			   78,   79,   78,   79,   78,   78,   85,   92,   85,   85,
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
			   92,   92,   92,   92,   77,   92,   92,   92,   92,   77,

			   77,   77,   37,    0,   44,   92,   92,   92,   92,   64,
			   60,   95,   95,   95,   95,   38,   95,   95,   38,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   37,   44,   37,
			   44,   95,   95,   95,   95,   95,   95,   95,   67,   66,
			   65,  104,  104,    0,    0,  101,  104,    0,  103,    0,
			  103,    0,    0,    0,  100,   74,    0,   92,   92,   92,
			   92,   45,   92,    0,   92,   92,   92,   36,   92,   92,
			   92,   79,   78,   92,   92,    0,   92,   92,   92,   92,
			    0,   64,   64,    0,   95,   95,   95,   95,   95,   95,

			   95,   95,   45,   95,   45,   95,   95,   95,   36,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,    0,  104,    0,  107,  104,  103,
			    0,    0,  103,    0,    0,  102,    0,    0,   74,    0,
			   92,   92,   92,   92,   47,   92,    0,   92,   92,   92,
			   92,   92,   92,   92,    0,   53,   92,   92,   92,    0,
			    0,    0,   62,   61,   95,   95,   95,   95,   95,   47,
			   95,   95,   47,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   53,   95,   95,   95,
			   53,   95,    0,  104,    0,    0,    0,  103,    0,  107,

			  103,    0,   76,    0,    0,    0,  105,  107,  105,   92,
			   92,   59,   92,   46,    0,   43,   58,   92,   35,   92,
			   51,    0,   92,   92,   92,    0,    0,   95,   95,   95,
			   59,   95,   59,   95,   46,   43,   58,   95,   43,   58,
			   95,   35,   35,   95,   51,   95,   51,   95,   95,   95,
			   95,  107,    0,  107,    0,  103,    0,    0,  106,    0,
			    0,   73,  107,    0,  106,   92,   92,   92,   82,   54,
			   92,    0,   92,   92,   55,    0,    0,   95,   95,   95,
			   95,   95,   54,   54,   95,   95,   95,   95,   55,   95,
			  107,  106,    0,  106,    0,    0,    0,    0,   73,  106,

			   92,   92,   48,   92,   81,   52,   92,    0,    0,   95,
			   95,   95,   48,   48,   95,   95,   52,   95,   52,  106,
			   75,    0,   73,   92,   92,   92,   92,   80,   80,   95,
			   95,   95,   95,   95,   95,    0,    0,   92,   50,   49,
			   92,    0,    0,   95,   50,   50,   49,   49,   95,    0,
			    0,   92,   92,    0,    0,   95,   95,   72,   92,   56,
			    0,    0,   95,   56,    0,    0,   72,   92,    0,    0,
			   95,    0,    0,   57,    0,    0,   57,    0,   71,    0,
			    0,    0,    0,    0,   71,    0,    0,    0,    0,    0,
			    0,    0,   70,   83,   84,    0,    0,    0,   70,    0,

			   70,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4838
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 803
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 804
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
