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
--|#line 241 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 241")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 69 then
if yy_act = 68 then
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
else
if yy_act = 70 then
--|#line 267 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 267")
end

				last_token := V_LOCAL_CODE
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
--|#line 276 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 276")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
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
--|#line 284 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 284")
end

				last_token := V_ISO8601_EXTENDED_TIME
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
--|#line 292 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 292")
end

				last_token := V_ISO8601_EXTENDED_DATE
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
--|#line 300 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 300")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 87 then
if yy_act <= 83 then
if yy_act <= 81 then
if yy_act = 80 then
--|#line 307 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 307")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 319 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 319")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 82 then
--|#line 329 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 329")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 334 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 334")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 344 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 344")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 350 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 350")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
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
--|#line 361 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 361")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
else
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act = 88 then
--|#line 373 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 373")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 379 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 379")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 90 then
--|#line 383 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 383")
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
--|#line 424 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 424")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 430 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 430")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 436 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 436")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 94 then
--|#line 442 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 442")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 449 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 449")
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
--|#line 455 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 455")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 462 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 462")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
end
else
if yy_act = 98 then
--|#line 466 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 466")
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
--|#line 477 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 477")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
end
else
if yy_act <= 101 then
if yy_act = 100 then
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 489 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 489")
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
--|#line 504 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 504")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 505 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 505")
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
--|#line 506 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 506")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 510 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 510")
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
--|#line 511 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 511")
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
--|#line 512 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 512")
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
--|#line 532 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 532")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 537 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 537")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
if yy_act = 110 then
--|#line 545 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 545")
end
in_buffer.append_character ('\')
else
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
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
--|#line 549 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 549")
end

				in_buffer.append_string (text)
	
else
--|#line 553 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 553")
end
in_buffer.append_string (text)
end
else
if yy_act = 114 then
--|#line 555 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 555")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
--|#line 560 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 560")
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
--|#line 571 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 571")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 580 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 580")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 118 then
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 583 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 583")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
end
else
if yy_act <= 123 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 584 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 584")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 585 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 585")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 122 then
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 588 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 588")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 125 then
if yy_act = 124 then
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 593 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 593")
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
			create an_array.make (0, 4762)
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
			  729,  115,  115,  115,  195,  115,  214,  115,  115,  214,
			  115,  115,  115,  524,  115,  455,  149,  115,  115,  149,
			  115,  117,  145,  145,  150,  117,  346,  145,  145,  120,

			  117,  196,  797,  118,  117,  119,  115,  115,  123,  115,
			  117,  199,  121,  115,  115,  200,  115,  200,  200,  124,
			  125,  115,  115,  122,  115,  219,  120,  216,  219,  117,
			  118,  213,  119,  185,  165,  123,  117,  145,  209,  121,
			  129,  186,  126,  127,  117,  166,  124,  125,  128,  199,
			  122,  115,  115,  556,  115,  115,  115,  291,  115,  130,
			  187,  167,  115,  115,  735,  115,  199,  129,  188,  126,
			  127,  199,  168,  210,  117,  128,  115,  115,  117,  115,
			  131,  292,  171,  172,  291,  117,  130,  204,  173,  181,
			  115,  115,  132,  115,  199,  139,  212,  199,  447,  117,

			  211,  182,  144,  140,  736,  145,  145,  131,  292,  174,
			  175,  670,  533,  117,  143,  176,  183,  291,  287,  132,
			  115,  115,  139,  115,  206,  206,  669,  141,  184,  144,
			  140,  210,  142,  292,  297,  297,  133,  133,  133,  133,
			  133,  143,  204,  117,  295,  203,  203,  203,  288,  299,
			  134,  110,  115,  115,  141,  115,  135,  653,  211,  142,
			  296,  297,  298,  136,  299,  137,  305,  138,  205,  205,
			  205,  207,  207,  207,  306,  249,  299,  134,  242,  242,
			  242,  242,  242,  135,  248,  248,  248,  248,  248,  615,
			  305,  302,  137,  305,  138,  149,  218,  221,  149,  218,

			  221,  306,  558,  150,  237,  199,  237,  237,  219,  220,
			  558,  151,  151,  151,  151,  151,  152,  307,  221,  306,
			  540,  528,  151,  151,  151,  151,  151,  151,  151,  151,
			  153,  151,  154,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  223,  310,  308,  216,  151,  155,
			  155,  156,  155,  155,  155,  155,  155,  157,  155,  158,
			  155,  155,  155,  155,  155,  156,  155,  155,  155,  155,
			  149,  218,  310,  149,  218,  688,  688,  688,  150,  203,
			  203,  203,  199,  219,  107,  484,  151,  151,  151,  151,
			  151,  152,  310,  221,  317,  484,  224,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  314,
			  317,  317,  216,  151,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  226,  226,  318,  226,  374,
			  293,  231,  294,  294,  294,  294,  294,  206,  206,  349,
			  232,  232,  232,  232,  232,  214,  350,  349,  214,  350,
			  227,  349,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  233,  239,  239,  239,  239,  239,

			  244,  244,  244,  244,  244,  440,  115,  115,  234,  115,
			  240,  319,  235,  440,  236,  245,  216,  115,  115,  107,
			  115,  108,  228,  246,  246,  246,  246,  246,  247,  117,
			  419,  419,  241,  115,  115,  319,  115,  240,  319,  107,
			  117,  108,  245,  246,  246,  246,  246,  246,  115,  115,
			  485,  115,  251,  486,  115,  115,  117,  115,  115,  115,
			  110,  115,  320,  252,  311,  115,  115,  312,  115,  407,
			  321,  117,  115,  115,  406,  115,  374,  117,  360,  251,
			  110,  117,  115,  115,  322,  115,  359,  255,  117,  253,
			  252,  311,  256,  358,  312,  117,  254,  321,  115,  115,

			  257,  115,  357,  259,  354,  117,  115,  115,  797,  115,
			  217,  322,  321,  258,  255,  300,  253,  213,  199,  256,
			  301,  117,  322,  254,  313,  115,  115,  257,  115,  117,
			  115,  115,  313,  115,  309,  261,  325,  260,  262,  323,
			  258,  259,  300,  115,  115,  300,  115,  301,  117,  324,
			  301,  115,  115,  117,  115,  290,  326,  311,  115,  115,
			  312,  115,  261,  325,  260,  262,  117,  115,  115,  289,
			  115,  325,  303,  264,  117,  148,  326,  304,  263,  268,
			  266,  117,  269,  326,  315,  270,  265,  316,  267,  331,
			  117,  271,  116,  287,  272,  238,  273,  237,  327,  230,

			  264,  115,  115,  328,  115,  485,  268,  266,  485,  269,
			  274,   99,  270,  265,   96,  267,  331,  217,  271,  115,
			  115,  272,  115,  273,  117,  116,  116,  116,  116,  116,
			  213,  134,  329,  331,  115,  115,  330,  115,  115,  115,
			  199,  115,  117,  199,  274,  335,  137,  115,  115,  134,
			  115,  197,  274,  148,  114,  199,  116,  117,  134,  329,
			  334,  117,  274,  330,  115,  115,  199,  115,  113,  279,
			  117,  280,  335,  137,  115,  115,  134,  115,  281,  115,
			  115,  282,  115,  116,  329,  283,  335,  117,  330,  199,
			  275,  275,  275,  275,  275,  284,  279,  117,  280,  112,

			  337,  337,  117,  115,  115,  281,  115,  276,  282,  209,
			  277,  332,  283,  336,  212,  333,  278,  203,  203,  203,
			  285,  485,  284,  106,  486,  408,  117,  337,  338,  344,
			  344,  344,  103,  218,  276,  408,  218,  277,  382,   99,
			  345,  345,  345,  278,  210,  219,   97,  285,  382,  210,
			  286,  218,  408,  410,  218,  221,  353,  353,  382,  353,
			   96,  797,  409,  219,  797,  410,  339,  340,  341,  342,
			  343,  211,  556,  221,  412,  382,  211,  286,  797,  797,
			  410,  227,  413,  414,  216,  355,  356,  356,  356,  356,
			  356,  362,  411,  362,  797,  797,  363,  363,  363,  363,

			  363,  412,  216,  364,  364,  364,  364,  364,  797,  413,
			  414,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  347,  348,  349,  347,  348,  347,  347,  347,
			  347,  347,  347,  347,  347,  350,  220,  220,  347,  220,
			  220,  220,  220,  220,  347,  351,  347,  347,  347,  347,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  347,  347,  352,  347,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  226,  226,  797,  226,  365,  365,  365,  365,  365,  369,
			  797,  369,  797,  797,  370,  370,  370,  370,  370,  372,
			  372,  372,  372,  351,  349,  227,  351,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  361,
			  361,  361,  361,  361,  797,  366,  366,  366,  366,  366,
			  797,  107,  412,  108,  240,  371,  371,  371,  371,  371,
			  367,  373,  373,  373,  373,  373,  413,  228,  115,  115,

			  797,  115,  115,  115,  414,  115,  241,  115,  115,  415,
			  115,  240,  368,  797,  418,  115,  115,  367,  115,  797,
			  797,  117,  110,  416,  797,  117,  115,  115,  797,  115,
			  117,  417,  115,  115,  797,  115,  375,  376,  117,  115,
			  115,  418,  115,  797,  115,  115,  377,  115,  797,  117,
			  116,  116,  116,  116,  116,  117,  115,  115,  797,  115,
			  418,  378,  117,  375,  376,  797,  421,  117,  422,  115,
			  115,  797,  115,  377,  379,  115,  115,  797,  115,  117,
			  423,  380,  115,  115,  797,  115,  797,  420,  378,  797,
			  797,  383,  117,  421,  424,  422,  797,  381,  117,  115,

			  115,  379,  115,  797,  384,  117,  797,  423,  380,  385,
			  115,  115,  421,  115,  115,  115,  386,  115,  383,  797,
			  797,  424,  117,  115,  115,  797,  115,  797,  387,  115,
			  115,  384,  115,  117,  797,  797,  385,  117,  422,  425,
			  797,  423,  428,  386,  115,  115,  117,  115,  115,  115,
			  797,  115,  117,  797,  389,  387,  115,  115,  388,  115,
			  390,  390,  390,  390,  390,  426,  797,  117,  427,  428,
			  797,  117,  392,  392,  392,  392,  392,  115,  115,  117,
			  115,  389,  428,  396,  797,  388,  397,  391,  115,  115,
			  797,  115,  398,  393,  393,  393,  393,  393,  115,  115,

			  117,  115,  430,  797,  394,  394,  394,  394,  394,  429,
			  396,  117,  797,  397,  395,  395,  395,  395,  395,  398,
			  391,  117,  116,  116,  116,  116,  116,  115,  115,  430,
			  115,  391,  431,  115,  115,  797,  115,  115,  115,  116,
			  115,  391,  115,  115,  797,  115,  797,  430,  115,  115,
			  117,  115,  115,  115,  797,  115,  117,  199,  400,  431,
			  117,  115,  115,  431,  115,  117,  116,  434,  435,  278,
			  399,  117,  797,  401,  432,  117,  115,  115,  797,  115,
			  115,  115,  434,  115,  117,  435,  438,  199,  402,  439,
			  433,  438,  199,  403,  434,  435,  278,  399,  199,  117,

			  401,  199,  293,  117,  293,  293,  293,  293,  293,  436,
			  439,  797,  437,  438,  404,  402,  439,  290,  441,  293,
			  403,  294,  294,  294,  294,  294,  443,  405,  382,  443,
			  797,  203,  203,  203,  690,  691,  690,  442,  382,  353,
			  353,  797,  353,  363,  363,  363,  363,  363,  382,  797,
			  797,  488,  797,  443,  405,  797,  444,  348,  349,  797,
			  348,  205,  205,  205,  797,  382,  207,  207,  207,  350,
			  797,  692,  203,  203,  203,  203,  203,  203,  488,  351,
			  355,  356,  356,  356,  356,  356,  445,  445,  445,  445,
			  445,  797,  446,  446,  446,  446,  446,  115,  115,  488,

			  115,  240,  448,  448,  448,  448,  448,  797,  352,  449,
			  449,  449,  449,  449,  467,  450,  450,  450,  450,  450,
			  117,  797,  797,  241,  467,  797,  489,  490,  240,  447,
			  367,  451,  797,  451,  467,  797,  452,  452,  452,  452,
			  452,  453,  453,  453,  453,  453,  370,  370,  370,  370,
			  370,  467,  368,  797,  490,  797,  490,  367,  454,  454,
			  454,  454,  454,  456,  457,  797,  458,  458,  458,  458,
			  458,  459,  459,  459,  459,  459,  460,  460,  460,  460,
			  460,  115,  115,  491,  115,  115,  115,  797,  115,  115,
			  115,  492,  115,  115,  115,  455,  115,  115,  115,  797,

			  115,  797,  115,  115,  117,  115,  797,  797,  117,  797,
			  797,  493,  117,  797,  115,  115,  117,  115,  492,  462,
			  117,  115,  115,  797,  115,  117,  461,  797,  465,  466,
			  492,  115,  115,  463,  115,  797,  464,  117,  493,  115,
			  115,  797,  115,  797,  117,  797,  462,  493,  468,  115,
			  115,  496,  115,  461,  117,  465,  466,  494,  115,  115,
			  463,  115,  117,  464,  497,  469,  115,  115,  470,  115,
			  116,  496,  117,  116,  495,  468,  471,  797,  496,  116,
			  797,  117,  472,  797,  390,  390,  390,  390,  390,  117,
			  499,  497,  469,  797,  797,  470,  500,  116,  498,  473,

			  116,  269,  797,  471,  475,  797,  116,  474,  797,  472,
			  271,  797,  392,  392,  392,  392,  392,  499,  393,  393,
			  393,  393,  393,  500,  797,  797,  473,  797,  269,  116,
			  501,  475,  268,  502,  474,  115,  115,  271,  115,  395,
			  395,  395,  395,  395,  499,  115,  115,  272,  115,  797,
			  797,  394,  394,  394,  394,  394,  116,  501,  117,  268,
			  502,  797,  797,  115,  115,  476,  115,  797,  117,  500,
			  116,  503,  501,  797,  272,  477,  477,  477,  477,  477,
			  478,  478,  478,  478,  478,  479,  117,  115,  115,  116,
			  115,  797,  476,  797,  116,  479,  504,  116,  506,  505,

			  115,  115,  797,  115,  506,  479,  115,  115,  508,  115,
			  117,  115,  115,  797,  115,  509,  116,  115,  115,  508,
			  115,  116,  479,  117,  509,  506,  512,  513,  512,  117,
			  484,  507,  513,  514,  117,  508,  481,  530,  482,  530,
			  117,  559,  509,  515,  480,  797,  510,  531,  483,  115,
			  115,  511,  115,  512,  513,  516,  797,  797,  797,  517,
			  514,  559,  797,  481,  797,  482,  115,  115,  559,  115,
			  515,  480,  117,  797,  532,  483,  445,  445,  445,  445,
			  445,  797,  519,  519,  519,  519,  519,  797,  560,  117,
			  555,  518,  520,  520,  520,  520,  520,  521,  521,  521,

			  521,  521,  522,  522,  522,  522,  522,  452,  452,  452,
			  452,  452,  523,  523,  523,  523,  523,  367,  518,  447,
			  525,  525,  525,  525,  525,  526,  526,  526,  526,  526,
			  527,  527,  527,  527,  527,  797,  797,  561,  557,  368,
			  115,  115,  797,  115,  367,  115,  115,  797,  115,  524,
			  522,  522,  522,  522,  522,  457,  797,  458,  458,  458,
			  458,  458,  455,  117,  561,  529,  115,  115,  117,  115,
			  561,  115,  115,  567,  115,  115,  115,  562,  115,  797,
			  115,  115,  535,  115,  115,  115,  797,  115,  563,  117,
			  568,  569,  529,  534,  117,  797,  536,  564,  117,  797,

			  567,  797,  537,  117,  562,  115,  115,  117,  115,  535,
			  539,  541,  797,  538,  542,  563,  797,  568,  569,  115,
			  115,  797,  115,  536,  115,  115,  548,  115,  117,  537,
			  115,  115,  562,  115,  797,  797,  548,  539,  541,  543,
			  538,  542,  117,  563,  797,  797,  548,  117,  115,  115,
			  544,  115,  553,  117,  547,  547,  547,  547,  547,  565,
			  570,  546,  553,  548,  797,  545,  543,  568,  116,  797,
			  566,  117,  554,  115,  115,  569,  115,  544,  797,  477,
			  477,  477,  477,  477,  797,  797,  797,  570,  546,  553,
			  570,  391,  545,  116,  571,  116,  117,  797,  574,  397,

			  115,  115,  572,  115,  549,  398,  574,  478,  478,  478,
			  478,  478,  115,  115,  797,  115,  797,  573,  576,  577,
			  116,  115,  115,  117,  115,  574,  397,  116,  576,  577,
			  580,  549,  398,  575,  581,  117,  582,  583,  580,  581,
			  797,  551,  608,  550,  117,  576,  577,  587,  587,  587,
			  587,  587,  797,  797,  116,  578,  579,  580,  608,  552,
			  589,  581,  608,  582,  583,  584,  585,  586,  551,  586,
			  550,  797,  587,  587,  587,  587,  587,  588,  588,  588,
			  588,  588,  241,  797,  447,  608,  552,  589,  522,  522,
			  522,  522,  522,  797,  591,  591,  591,  591,  591,  599,

			  599,  599,  599,  590,  592,  592,  592,  592,  592,  593,
			  593,  593,  593,  593,  594,  594,  594,  594,  594,  595,
			  595,  595,  595,  595,  596,  596,  596,  596,  596,  797,
			  590,  524,  597,  797,  597,  797,  797,  594,  594,  594,
			  594,  594,  598,  598,  598,  598,  598,  115,  115,  797,
			  115,  455,  601,  601,  601,  601,  601,  115,  115,  797,
			  115,  621,  115,  115,  797,  115,  797,  602,  115,  115,
			  117,  115,  115,  115,  603,  115,  115,  115,  797,  115,
			  117,  797,  797,  797,  604,  117,  115,  115,  621,  115,
			  797,  117,  797,  605,  602,  117,  622,  622,  624,  117,

			  625,  603,  797,  115,  115,  606,  115,  115,  115,  117,
			  115,  604,  115,  115,  797,  115,  115,  115,  609,  115,
			  605,  607,  624,  622,  623,  624,  117,  625,  115,  115,
			  117,  115,  606,  797,  610,  117,  625,  628,  629,  117,
			  547,  547,  547,  547,  547,  609,  630,  613,  607,  626,
			  611,  117,  115,  115,  612,  115,  115,  115,  614,  115,
			  116,  610,  619,  627,  628,  629,  271,  115,  115,  797,
			  115,  797,  619,  630,  613,  117,  631,  611,  620,  117,
			  629,  612,  620,  115,  115,  614,  115,  116,  620,  630,
			  117,  631,  635,  271,  635,  637,  617,  616,  620,  619,

			  638,  637,  638,  631,  641,  642,  117,  632,  643,  641,
			  671,  651,  672,  618,  662,  620,  633,  797,  634,  635,
			  797,  636,  637,  617,  616,  797,  797,  638,  639,  640,
			  662,  641,  642,  368,  662,  643,  644,  671,  651,  672,
			  618,  587,  587,  587,  587,  587,  587,  587,  587,  587,
			  587,  645,  645,  645,  645,  645,  646,  662,  646,  797,
			  797,  647,  647,  647,  647,  647,  648,  797,  648,  797,
			  797,  649,  649,  649,  649,  649,  649,  649,  649,  649,
			  649,  650,  650,  650,  650,  650,  594,  594,  594,  594,
			  594,  652,  652,  652,  652,  652,  594,  594,  594,  594,

			  594,  654,  654,  654,  654,  654,  655,  655,  655,  655,
			  655,  797,  797,  524,  656,  656,  656,  656,  656,  657,
			  665,  657,  672,  797,  658,  658,  658,  658,  658,  651,
			  115,  115,  797,  115,  115,  115,  665,  115,  115,  115,
			  665,  115,  797,  115,  115,  797,  115,  115,  115,  673,
			  115,  368,  797,  117,  797,  797,  651,  117,  674,  115,
			  115,  117,  115,  665,  115,  115,  117,  115,  797,  660,
			  117,  659,  661,  674,  115,  115,  797,  115,  115,  115,
			  797,  115,  117,  115,  115,  674,  115,  117,  115,  115,
			  676,  115,  115,  115,  797,  115,  660,  117,  659,  661,

			  675,  117,  115,  115,  676,  115,  117,  115,  115,  678,
			  115,  117,  678,  680,  681,  117,  682,  676,  680,  703,
			  664,  663,  797,  666,  797,  117,  115,  115,  797,  115,
			  117,  677,  797,  797,  704,  667,  678,  704,  668,  679,
			  680,  681,  797,  682,  797,  683,  703,  664,  663,  117,
			  666,  647,  647,  647,  647,  647,  684,  684,  684,  684,
			  684,  704,  667,  797,  705,  668,  649,  649,  649,  649,
			  649,  649,  649,  649,  649,  649,  685,  685,  685,  685,
			  685,  686,  797,  686,  797,  797,  687,  687,  687,  687,
			  687,  797,  797,  447,  689,  689,  689,  689,  689,  593,

			  593,  593,  593,  593,  658,  658,  658,  658,  658,  693,
			  693,  693,  693,  693,  651,  115,  115,  698,  115,  115,
			  115,  706,  115,  797,  115,  115,  797,  115,  115,  115,
			  797,  115,  797,  698,  797,  797,  368,  698,  117,  797,
			  706,  651,  117,  797,  694,  797,  455,  117,  706,  115,
			  115,  117,  115,  695,  797,  696,  708,  697,  115,  115,
			  698,  115,  115,  115,  708,  115,  701,  707,  710,  711,
			  701,  694,  117,  702,  710,  115,  115,  702,  115,  699,
			  695,  117,  696,  708,  697,  117,  701,  723,  724,  700,
			  797,  709,  797,  702,  797,  710,  711,  701,  117,  797, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  797,  712,  797,  797,  702,  797,  699,  645,  645,  645,
			  645,  645,  797,  797,  723,  724,  700,  687,  687,  687,
			  687,  687,  713,  713,  713,  713,  713,  714,  714,  714,
			  714,  714,  532,  532,  532,  532,  532,  715,  715,  715,
			  715,  715,  797,  797,  447,  716,  716,  716,  716,  716,
			  652,  652,  652,  652,  652,  115,  115,  797,  115,  524,
			  115,  115,  797,  115,  721,  724,  115,  115,  721,  115,
			  115,  115,  797,  115,  797,  726,  115,  115,  117,  115,
			  726,  722,  728,  117,  721,  722,  737,  455,  717,  117,
			  797,  797,  725,  117,  738,  721,  738,  719,  797,  117,

			  797,  722,  726,  718,  797,  797,  797,  727,  797,  728,
			  740,  797,  722,  737,  797,  717,  797,  115,  115,  720,
			  115,  738,  797,  739,  719,  685,  685,  685,  685,  685,
			  718,  730,  730,  730,  730,  730,  690,  740,  690,  740,
			  117,  716,  716,  716,  716,  716,  720,  742,  731,  115,
			  115,  797,  115,  115,  115,  797,  115,  115,  115,  797,
			  115,  749,  524,  797,  797,  797,  741,  744,  744,  744,
			  744,  744,  117,  692,  742,  731,  117,  747,  115,  115,
			  117,  115,  115,  115,  747,  115,  115,  115,  749,  115,
			  115,  115,  748,  115,  797,  733,  732,  747,  750,  748,

			  756,  117,  797,  797,  734,  117,  797,  115,  115,  117,
			  115,  747,  748,  117,  751,  751,  751,  751,  751,  797,
			  757,  745,  733,  732,  797,  750,  748,  756,  797,  746,
			  117,  734,  692,  692,  692,  692,  692,  115,  115,  754,
			  115,  758,  755,  758,  764,  770,  754,  757,  745,  755,
			  797,  759,  115,  115,  752,  115,  746,  768,  797,  754,
			  117,  797,  755,  115,  115,  797,  115,  768,  753,  797,
			  797,  764,  770,  754,  797,  117,  755,  768,  760,  797,
			  797,  752,  766,  766,  766,  766,  117,  797,  797,  115,
			  115,  761,  115,  769,  768,  753,  765,  765,  765,  765,

			  765,  797,  797,  769,  771,  771,  771,  771,  771,  773,
			  797,  797,  117,  769,  115,  115,  774,  115,  761,  773,
			  767,  772,  772,  772,  772,  772,  774,  797,  797,  773,
			  769,  775,  775,  775,  775,  775,  774,  117,  776,  797,
			  776,  760,  760,  760,  760,  760,  773,  767,  777,  782,
			  782,  782,  782,  774,  781,  781,  781,  781,  781,  797,
			  783,  784,  785,  785,  785,  785,  785,  786,  786,  786,
			  786,  786,  787,  788,  797,  778,  783,  784,  797,  797,
			  783,  784,  789,  789,  789,  789,  789,  797,  787,  788,
			  797,  797,  787,  788,  790,  791,  790,  778,  778,  778,

			  778,  778,  797,  783,  784,  793,  793,  793,  793,  793,
			  794,  794,  794,  794,  794,  787,  788,  795,  795,  795,
			  795,  795,  796,  796,  796,  796,  796,  790,  797,  790,
			  797,  792,  794,  794,  794,  794,  794,  792,  792,  792,
			  792,  792,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  792,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   98,   98,  797,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  797,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,  100,  100,  797,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  116,  116,  116,  797,  797,  797,  797,
			  797,  797,  797,  116,  116,  797,  116,  797,  116,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  797,  797,
			  116,  116,  116,  116,  116,  116,  116,  116,  146,  146,

			  797,  146,  146,  797,  146,  146,  797,  797,  797,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  797,
			  797,  146,  146,  146,  146,  146,  146,  146,  146,  147,
			  147,  797,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  198,  198,  797,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,

			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  797,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  797,  211,  211,  211,  211,  211,  211,

			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  215,  797,  215,  797,  797,  797,  797,  215,  215,
			  797,  215,  215,  797,  797,  797,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  797,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  229,  229,  797,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  797,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,

			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  250,  797,  797,  797,
			  250,  250,  797,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  797,  797,  250,  250,  250,
			  250,  250,  250,  250,  250,  145,  145,  797,  145,  145,
			  797,  145,  145,  145,  797,  797,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  797,  797,  145,  145,
			  145,  145,  145,  145,  145,  145,  228,  228,  228,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  228,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  347,
			  487,  797,  487,  797,  797,  797,  797,  487,  487,  797,

			  487,  487,  797,  797,  797,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  797,  797,  487,  487,  487,
			  487,  487,  487,  487,  487,  407,  407,  407,  797,  797,
			  407,  407,  407,  407,  407,  407,  407,  407,  407,  797,
			  797,  407,  407,  407,  407,  407,  407,  407,  407,  407,
			  407,  407,  407,  407,  407,  407,  407,  407,  407,  407,
			  407,  797,  797,  407,  407,  407,  407,  407,  407,  407,
			  407,  555,  797,  555,  797,  797,  797,  797,  555,  555,
			  797,  555,  555,  797,  797,  797,  555,  555,  555,  555,

			  555,  555,  555,  555,  555,  555,  555,  555,  555,  555,
			  555,  555,  555,  555,  555,  555,  797,  555,  555,  555,
			  555,  555,  555,  555,  555,  555,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  797,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,   13,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797, yy_Dummy>>,
			1, 1763, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4762)
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
			  714,   37,   39,   39,   69,   39,   87,   40,   40,   87,
			   40,   41,   41,  685,   41,  652,  149,   42,   42,  149,
			   42,   37,   52,   52,  149,   39,  213,   52,   52,   39,

			   40,   69,  555,   37,   41,   37,   43,   43,   41,   43,
			   42,   78,   40,   44,   44,  200,   44,  200,  200,   41,
			   42,   45,   45,   40,   45,  219,   39,   87,  219,   43,
			   37,  213,   37,   66,   60,   41,   44,   52,   82,   40,
			   44,   66,   43,   43,   45,   60,   41,   42,   43,   80,
			   40,   46,   46,  555,   46,   51,   51,  153,   51,   45,
			   66,   60,   48,   48,  721,   48,  340,   44,   66,   43,
			   43,   77,   60,   82,   46,   43,   50,   50,   51,   50,
			   46,  154,   62,   62,  153,   48,   45,   78,   62,   65,
			   49,   49,   46,   49,   79,   48,   84,   81,  645,   50,

			   82,   65,   51,   48,  721,  146,  146,   46,  154,   62,
			   62,  620,  460,   49,   50,   62,   65,  157,  146,   46,
			   47,   47,   48,   47,   80,   80,  619,   49,   65,   51,
			   48,   84,   49,  158,  159,  160,   47,   47,   47,   47,
			   47,   50,  340,   47,  157,   77,   77,   77,  146,  161,
			   47,  460,  115,  115,   49,  115,   47,  596,   84,   49,
			  158,  159,  160,   47,  163,   47,  165,   47,   79,   79,
			   79,   81,   81,   81,  166,  115,  161,   47,  107,  107,
			  107,  107,  107,   47,  110,  110,  110,  110,  110,  548,
			  167,  163,   47,  165,   47,   56,   89,  221,   56,   89,

			  221,  166,  489,   56,  237,  204,  237,  237,   89,   89,
			  488,   56,   56,   56,   56,   56,   56,  167,   89,  168,
			  467,  456,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,  222,  171,  168,   89,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   57,   90,  171,   57,   90,  653,  653,  653,   57,  204,
			  204,  204,  342,   90,  449,  444,   57,   57,   57,   57,
			   57,   57,  174,   90,  177,  443,  222,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  174,
			  178,  177,   90,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   93,   93,  178,   93,  374,
			  156,  102,  156,  156,  156,  156,  156,  342,  342,  352,
			  102,  102,  102,  102,  102,  214,  350,  350,  214,  350,
			   93,  347,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,  102,  105,  105,  105,  105,  105,

			  108,  108,  108,  108,  108,  334,  116,  116,  102,  116,
			  105,  179,  102,  331,  102,  108,  214,  118,  118,  109,
			  118,  109,   93,  109,  109,  109,  109,  109,  109,  116,
			  308,  306,  105,  119,  119,  180,  119,  105,  179,  111,
			  118,  111,  108,  111,  111,  111,  111,  111,  120,  120,
			  406,  120,  118,  406,  121,  121,  119,  121,  122,  122,
			  109,  122,  180,  119,  172,  123,  123,  172,  123,  290,
			  181,  120,  124,  124,  287,  124,  250,  121,  236,  118,
			  111,  122,  125,  125,  182,  125,  235,  122,  123,  120,
			  119,  172,  122,  234,  172,  124,  121,  181,  126,  126,

			  123,  126,  233,  125,  231,  125,  127,  127,  226,  127,
			  217,  182,  183,  124,  122,  162,  120,  211,  198,  122,
			  162,  126,  184,  121,  176,  128,  128,  123,  128,  127,
			  129,  129,  173,  129,  170,  127,  185,  126,  127,  183,
			  124,  169,  162,  130,  130,  164,  130,  162,  128,  184,
			  164,  131,  131,  129,  131,  152,  186,  175,  132,  132,
			  175,  132,  127,  185,  126,  127,  130,  134,  134,  150,
			  134,  187,  164,  129,  131,  147,  188,  164,  128,  133,
			  131,  132,  133,  186,  175,  133,  130,  175,  132,  190,
			  134,  133,  133,  145,  133,  104,  133,  103,  187,  100,

			  129,  135,  135,  188,  135,  485,  133,  131,  485,  133,
			  134,   98,  133,  130,   96,  132,  190,   88,  133,  137,
			  137,  133,  137,  133,  135,  138,  138,  138,  138,  138,
			   85,  135,  189,  192,  140,  140,  189,  140,  139,  139,
			   73,  139,  137,  205,  135,  193,  135,  141,  141,  137,
			  141,   70,  138,   55,   36,  206,  138,  140,  135,  189,
			  192,  139,  137,  189,  142,  142,  207,  142,   35,  139,
			  141,  139,  193,  135,  136,  136,  137,  136,  140,  143,
			  143,  141,  143,  138,  191,  141,  194,  142,  191,  203,
			  136,  136,  136,  136,  136,  142,  139,  136,  139,   33,

			  195,  196,  143,  144,  144,  140,  144,  136,  141,  208,
			  136,  191,  141,  194,  210,  191,  136,  205,  205,  205,
			  143,  486,  142,   28,  486,  291,  144,  195,  196,  206,
			  206,  206,   26,  215,  136,  295,  215,  136,  259,   18,
			  207,  207,  207,  136,  208,  215,   17,  143,  259,  210,
			  144,  218,  291,  297,  218,  215,  227,  227,  259,  227,
			   16,   13,  295,  218,    0,  298,  203,  203,  203,  203,
			  203,  208,  486,  218,  299,  259,  210,  144,  151,    0,
			  297,  227,  300,  301,  215,  232,  232,  232,  232,  232,
			  232,  240,  298,  240,    0,    0,  240,  240,  240,  240,

			  240,  299,  218,  241,  241,  241,  241,  241,    0,  300,
			  301,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  223,  223,    0,  223,  242,  242,  242,  242,  242,  245,
			    0,  245,    0,    0,  245,  245,  245,  245,  245,  247,
			  247,  247,  247,  351,  351,  223,  351,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  239,
			  239,  239,  239,  239,    0,  244,  244,  244,  244,  244,
			    0,  246,  302,  246,  239,  246,  246,  246,  246,  246,
			  244,  248,  248,  248,  248,  248,  303,  223,  251,  251,

			    0,  251,  252,  252,  304,  252,  239,  253,  253,  302,
			  253,  239,  244,    0,  305,  254,  254,  244,  254,    0,
			    0,  251,  246,  303,    0,  252,  255,  255,    0,  255,
			  253,  304,  256,  256,    0,  256,  251,  253,  254,  257,
			  257,  305,  257,    0,  258,  258,  254,  258,    0,  255,
			  274,  274,  274,  274,  274,  256,  260,  260,    0,  260,
			  307,  255,  257,  251,  253,    0,  310,  258,  311,  261,
			  261,    0,  261,  254,  256,  262,  262,    0,  262,  260,
			  312,  257,  263,  263,    0,  263,    0,  307,  255,    0,
			    0,  260,  261,  310,  313,  311,    0,  258,  262,  264,

			  264,  256,  264,    0,  261,  263,    0,  312,  257,  262,
			  265,  265,  314,  265,  266,  266,  263,  266,  260,    0,
			    0,  313,  264,  267,  267,    0,  267,    0,  264,  271,
			  271,  261,  271,  265,    0,    0,  262,  266,  315,  314,
			    0,  316,  317,  263,  268,  268,  267,  268,  278,  278,
			    0,  278,  271,    0,  267,  264,  269,  269,  266,  269,
			  268,  268,  268,  268,  268,  315,    0,  268,  316,  317,
			    0,  278,  269,  269,  269,  269,  269,  270,  270,  269,
			  270,  267,  318,  275,    0,  266,  275,  268,  272,  272,
			    0,  272,  275,  270,  270,  270,  270,  270,  273,  273,

			  270,  273,  321,    0,  272,  272,  272,  272,  272,  318,
			  275,  272,    0,  275,  273,  273,  273,  273,  273,  275,
			  270,  273,  276,  276,  276,  276,  276,  277,  277,  321,
			  277,  272,  322,  279,  279,    0,  279,  280,  280,  276,
			  280,  273,  281,  281,    0,  281,    0,  323,  282,  282,
			  277,  282,  283,  283,    0,  283,  279,  339,  280,  322,
			  280,  284,  284,  324,  284,  281,  276,  325,  326,  277,
			  279,  282,    0,  281,  323,  283,  285,  285,    0,  285,
			  286,  286,  327,  286,  284,  328,  329,  341,  282,  330,
			  324,  332,  343,  283,  325,  326,  277,  279,  344,  285,

			  281,  345,  293,  286,  293,  293,  293,  293,  293,  327,
			  333,    0,  328,  329,  284,  282,  330,  309,  332,  294,
			  283,  294,  294,  294,  294,  294,  337,  286,  309,  338,
			    0,  339,  339,  339,  655,  655,  655,  333,  309,  353,
			  353,    0,  353,  362,  362,  362,  362,  362,  309,    0,
			    0,  408,    0,  337,  286,    0,  338,  348,  348,    0,
			  348,  341,  341,  341,  353,  309,  343,  343,  343,  348,
			    0,  655,  344,  344,  344,  345,  345,  345,  408,  348,
			  356,  356,  356,  356,  356,  356,  361,  361,  361,  361,
			  361,    0,  363,  363,  363,  363,  363,  377,  377,  409,

			  377,  361,  364,  364,  364,  364,  364,    0,  348,  365,
			  365,  365,  365,  365,  382,  366,  366,  366,  366,  366,
			  377,    0,    0,  361,  382,    0,  409,  410,  361,  363,
			  366,  367,    0,  367,  382,    0,  367,  367,  367,  367,
			  367,  368,  368,  368,  368,  368,  369,  369,  369,  369,
			  369,  382,  366,    0,  410,    0,  411,  366,  370,  370,
			  370,  370,  370,  371,  371,    0,  371,  371,  371,  371,
			  371,  372,  372,  372,  372,  372,  373,  373,  373,  373,
			  373,  375,  375,  411,  375,  376,  376,    0,  376,  378,
			  378,  413,  378,  379,  379,  370,  379,  380,  380,    0,

			  380,    0,  381,  381,  375,  381,    0,    0,  376,    0,
			    0,  414,  378,    0,  383,  383,  379,  383,  413,  376,
			  380,  384,  384,    0,  384,  381,  375,    0,  380,  381,
			  416,  385,  385,  378,  385,    0,  379,  383,  414,  386,
			  386,    0,  386,    0,  384,    0,  376,  417,  383,  387,
			  387,  418,  387,  375,  385,  380,  381,  416,  388,  388,
			  378,  388,  386,  379,  419,  384,  389,  389,  385,  389,
			  391,  420,  387,  391,  417,  383,  386,    0,  418,  391,
			    0,  388,  387,    0,  390,  390,  390,  390,  390,  389,
			  421,  419,  384,    0,    0,  385,  422,  391,  420,  388,

			  391,  390,    0,  386,  390,    0,  391,  389,    0,  387,
			  390,    0,  392,  392,  392,  392,  392,  421,  393,  393,
			  393,  393,  393,  422,    0,    0,  388,    0,  390,  392,
			  423,  390,  393,  424,  389,  394,  394,  390,  394,  395,
			  395,  395,  395,  395,  425,  398,  398,  393,  398,    0,
			    0,  394,  394,  394,  394,  394,  392,  423,  394,  393,
			  424,    0,    0,  399,  399,  394,  399,    0,  398,  426,
			  395,  425,  427,    0,  393,  396,  396,  396,  396,  396,
			  397,  397,  397,  397,  397,  400,  399,  401,  401,  396,
			  401,    0,  394,    0,  397,  400,  426,  395,  428,  427,

			  402,  402,    0,  402,  429,  400,  403,  403,  430,  403,
			  401,  404,  404,    0,  404,  431,  396,  405,  405,  432,
			  405,  397,  400,  402,  433,  428,  438,  439,  441,  403,
			  405,  429,  442,  440,  404,  430,  403,  459,  404,  459,
			  405,  490,  431,  440,  402,    0,  432,  459,  404,  465,
			  465,  433,  465,  438,  439,  441,    0,    0,    0,  442,
			  440,  491,    0,  403,    0,  404,  471,  471,  490,  471,
			  440,  402,  465,    0,  459,  404,  445,  445,  445,  445,
			  445,    0,  446,  446,  446,  446,  446,  487,  491,  471,
			  487,  445,  447,  447,  447,  447,  447,  448,  448,  448,

			  448,  448,  450,  450,  450,  450,  450,  451,  451,  451,
			  451,  451,  452,  452,  452,  452,  452,  450,  445,  446,
			  453,  453,  453,  453,  453,  454,  454,  454,  454,  454,
			  455,  455,  455,  455,  455,    0,    0,  492,  487,  450,
			  461,  461,    0,  461,  450,  462,  462,    0,  462,  452,
			  457,  457,  457,  457,  457,  458,    0,  458,  458,  458,
			  458,  458,  454,  461,  492,  457,  463,  463,  462,  463,
			  494,  464,  464,  497,  464,  466,  466,  493,  466,    0,
			  468,  468,  462,  468,  469,  469,    0,  469,  493,  463,
			  499,  500,  457,  461,  464,    0,  463,  494,  466,    0,

			  497,    0,  464,  468,  493,  470,  470,  469,  470,  462,
			  466,  468,    0,  464,  469,  493,    0,  499,  500,  472,
			  472,    0,  472,  463,  473,  473,  479,  473,  470,  464,
			  474,  474,  495,  474,    0,    0,  479,  466,  468,  470,
			  464,  469,  472,  495,    0,    0,  479,  473,  476,  476,
			  472,  476,  484,  474,  475,  475,  475,  475,  475,  495,
			  501,  474,  484,  479,    0,  473,  470,  503,  475,    0,
			  495,  476,  484,  480,  480,  504,  480,  472,    0,  477,
			  477,  477,  477,  477,    0,    0,    0,  501,  474,  484,
			  505,  476,  473,  477,  503,  475,  480,    0,  506,  477,

			  482,  482,  504,  482,  480,  477,  507,  478,  478,  478,
			  478,  478,  481,  481,    0,  481,    0,  505,  508,  509,
			  477,  483,  483,  482,  483,  506,  477,  478,  510,  511,
			  512,  480,  477,  507,  513,  481,  514,  515,  516,  517,
			    0,  482,  540,  481,  483,  508,  509,  519,  519,  519,
			  519,  519,    0,    0,  478,  510,  511,  512,  540,  483,
			  521,  513,  540,  514,  515,  516,  517,  518,  482,  518,
			  481,    0,  518,  518,  518,  518,  518,  520,  520,  520,
			  520,  520,  521,    0,  519,  540,  483,  521,  522,  522,
			  522,  522,  522,    0,  523,  523,  523,  523,  523,  531,

			  531,  531,  531,  522,  524,  524,  524,  524,  524,  525,
			  525,  525,  525,  525,  526,  526,  526,  526,  526,  527,
			  527,  527,  527,  527,  528,  528,  528,  528,  528,    0,
			  522,  523,  529,    0,  529,    0,    0,  529,  529,  529,
			  529,  529,  530,  530,  530,  530,  530,  534,  534,    0,
			  534,  526,  533,  533,  533,  533,  533,  535,  535,    0,
			  535,  558,  536,  536,    0,  536,    0,  533,  537,  537,
			  534,  537,  538,  538,  534,  538,  541,  541,    0,  541,
			  535,    0,    0,    0,  535,  536,  539,  539,  558,  539,
			    0,  537,    0,  536,  533,  538,  559,  560,  561,  541,

			  562,  534,    0,  542,  542,  537,  542,  543,  543,  539,
			  543,  535,  544,  544,    0,  544,  545,  545,  541,  545,
			  536,  539,  564,  559,  560,  561,  542,  562,  546,  546,
			  543,  546,  537,    0,  542,  544,  565,  567,  568,  545,
			  547,  547,  547,  547,  547,  541,  569,  545,  539,  564,
			  543,  546,  549,  549,  544,  549,  550,  550,  546,  550,
			  547,  542,  553,  565,  567,  568,  547,  551,  551,    0,
			  551,    0,  553,  569,  545,  549,  570,  543,  554,  550,
			  571,  544,  553,  552,  552,  546,  552,  547,  554,  572,
			  551,  573,  574,  547,  575,  576,  551,  550,  554,  553,

			  577,  578,  579,  570,  581,  582,  552,  571,  583,  585,
			  621,  593,  622,  552,  608,  554,  572,    0,  573,  574,
			    0,  575,  576,  551,  550,    0,    0,  577,  578,  579,
			  608,  581,  582,  593,  608,  583,  585,  621,  593,  622,
			  552,  586,  586,  586,  586,  586,  587,  587,  587,  587,
			  587,  588,  588,  588,  588,  588,  589,  608,  589,    0,
			    0,  589,  589,  589,  589,  589,  590,    0,  590,    0,
			    0,  590,  590,  590,  590,  590,  591,  591,  591,  591,
			  591,  592,  592,  592,  592,  592,  594,  594,  594,  594,
			  594,  595,  595,  595,  595,  595,  597,  597,  597,  597,

			  597,  598,  598,  598,  598,  598,  599,  599,  599,  599,
			  599,    0,    0,  591,  601,  601,  601,  601,  601,  602,
			  615,  602,  623,    0,  602,  602,  602,  602,  602,  601,
			  603,  603,    0,  603,  604,  604,  615,  604,  605,  605,
			  615,  605,    0,  606,  606,    0,  606,  607,  607,  623,
			  607,  601,    0,  603,    0,    0,  601,  604,  625,  609,
			  609,  605,  609,  615,  610,  610,  606,  610,    0,  604,
			  607,  603,  606,  627,  611,  611,    0,  611,  612,  612,
			    0,  612,  609,  613,  613,  625,  613,  610,  614,  614,
			  631,  614,  616,  616,    0,  616,  604,  611,  603,  606,

			  627,  612,  617,  617,  634,  617,  613,  618,  618,  637,
			  618,  614,  639,  641,  642,  616,  643,  631,  644,  671,
			  613,  611,    0,  616,    0,  617,  663,  663,    0,  663,
			  618,  634,    0,    0,  672,  617,  637,  673,  618,  639,
			  641,  642,    0,  643,    0,  644,  671,  613,  611,  663,
			  616,  646,  646,  646,  646,  646,  647,  647,  647,  647,
			  647,  672,  617,    0,  673,  618,  648,  648,  648,  648,
			  648,  649,  649,  649,  649,  649,  650,  650,  650,  650,
			  650,  651,    0,  651,    0,    0,  651,  651,  651,  651,
			  651,    0,    0,  647,  654,  654,  654,  654,  654,  656,

			  656,  656,  656,  656,  657,  657,  657,  657,  657,  658,
			  658,  658,  658,  658,  656,  659,  659,  665,  659,  660,
			  660,  674,  660,    0,  661,  661,    0,  661,  664,  664,
			    0,  664,    0,  665,    0,    0,  656,  665,  659,    0,
			  675,  656,  660,    0,  659,    0,  658,  661,  674,  666,
			  666,  664,  666,  660,    0,  661,  678,  664,  667,  667,
			  665,  667,  668,  668,  679,  668,  669,  675,  680,  681,
			  669,  659,  666,  670,  683,  696,  696,  670,  696,  666,
			  660,  667,  661,  678,  664,  668,  669,  703,  704,  667,
			    0,  679,    0,  670,    0,  680,  681,  669,  696,    0, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,  683,    0,    0,  670,    0,  666,  684,  684,  684,
			  684,  684,    0,    0,  703,  704,  667,  686,  686,  686,
			  686,  686,  687,  687,  687,  687,  687,  688,  688,  688,
			  688,  688,  689,  689,  689,  689,  689,  690,  690,  690,
			  690,  690,    0,    0,  684,  691,  691,  691,  691,  691,
			  693,  693,  693,  693,  693,  694,  694,    0,  694,  687,
			  695,  695,    0,  695,  701,  705,  697,  697,  701,  697,
			  699,  699,    0,  699,    0,  708,  700,  700,  694,  700,
			  709,  702,  711,  695,  701,  702,  723,  693,  694,  697,
			    0,    0,  705,  699,  724,  701,  725,  697,    0,  700,

			    0,  702,  708,  695,    0,    0,    0,  709,    0,  711,
			  726,    0,  702,  723,    0,  694,    0,  717,  717,  700,
			  717,  724,    0,  725,  697,  713,  713,  713,  713,  713,
			  695,  715,  715,  715,  715,  715,  716,  726,  716,  727,
			  717,  716,  716,  716,  716,  716,  700,  728,  717,  718,
			  718,    0,  718,  719,  719,    0,  719,  720,  720,    0,
			  720,  737,  713,    0,    0,    0,  727,  730,  730,  730,
			  730,  730,  718,  716,  728,  717,  719,  735,  731,  731,
			  720,  731,  732,  732,  735,  732,  733,  733,  737,  733,
			  734,  734,  736,  734,    0,  719,  718,  735,  742,  736,

			  749,  731,    0,    0,  720,  732,    0,  745,  745,  733,
			  745,  735,  736,  734,  743,  743,  743,  743,  743,    0,
			  750,  731,  719,  718,    0,  742,  736,  749,    0,  734,
			  745,  720,  744,  744,  744,  744,  744,  746,  746,  747,
			  746,  751,  748,  751,  756,  764,  747,  750,  731,  748,
			    0,  751,  752,  752,  745,  752,  734,  762,    0,  747,
			  746,    0,  748,  753,  753,    0,  753,  762,  746,    0,
			    0,  756,  764,  747,    0,  752,  748,  762,  751,    0,
			    0,  745,  759,  759,  759,  759,  753,    0,    0,  761,
			  761,  752,  761,  763,  762,  746,  758,  758,  758,  758,

			  758,    0,    0,  763,  765,  765,  765,  765,  765,  768,
			    0,    0,  761,  763,  767,  767,  769,  767,  752,  768,
			  761,  766,  766,  766,  766,  766,  769,    0,    0,  768,
			  763,  771,  771,  771,  771,  771,  769,  767,  772,    0,
			  772,  775,  775,  775,  775,  775,  768,  761,  772,  777,
			  777,  777,  777,  769,  776,  776,  776,  776,  776,    0,
			  779,  780,  781,  781,  781,  781,  781,  782,  782,  782,
			  782,  782,  783,  784,    0,  772,  779,  780,    0,    0,
			  779,  780,  785,  785,  785,  785,  785,    0,  783,  784,
			    0,    0,  783,  784,  786,  786,  786,  789,  789,  789,

			  789,  789,    0,  779,  780,  790,  790,  790,  790,  790,
			  791,  791,  791,  791,  791,  783,  784,  793,  793,  793,
			  793,  793,  795,  795,  795,  795,  795,  794,    0,  794,
			    0,  786,  794,  794,  794,  794,  794,  796,  796,  796,
			  796,  796,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  794,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,

			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  802,  802,    0,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,    0,  802,  802,  802,  802,  802,  802,

			  802,  802,  802,  802,  802,  803,  803,    0,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  804,  804,  804,    0,    0,    0,    0,
			    0,    0,    0,  804,  804,    0,  804,    0,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,    0,    0,
			  804,  804,  804,  804,  804,  804,  804,  804,  805,  805,

			    0,  805,  805,    0,  805,  805,    0,    0,    0,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,    0,
			    0,  805,  805,  805,  805,  805,  805,  805,  805,  806,
			  806,    0,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  807,  807,    0,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,

			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,    0,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,    0,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  810,    0,  810,    0,    0,    0,    0,  810,  810,
			    0,  810,  810,    0,    0,    0,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,    0,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,

			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  813,  813,    0,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,

			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,    0,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,

			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  816,    0,    0,    0,
			  816,  816,    0,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,    0,    0,  816,  816,  816,
			  816,  816,  816,  816,  816,  817,  817,    0,  817,  817,
			    0,  817,  817,  817,    0,    0,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,    0,    0,  817,  817,
			  817,  817,  817,  817,  817,  817,  818,  818,  818,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  818,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  820,    0,  820,    0,    0,    0,    0,  820,  820,    0,

			  820,  820,    0,    0,    0,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,    0,    0,  820,  820,  820,
			  820,  820,  820,  820,  820,  821,  821,  821,    0,    0,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,    0,
			    0,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,    0,    0,  821,  821,  821,  821,  821,  821,  821,
			  821,  822,    0,  822,    0,    0,    0,    0,  822,  822,
			    0,  822,  822,    0,    0,    0,  822,  822,  822,  822,

			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,    0,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,    0,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797, yy_Dummy>>,
			1, 1763, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   86,   91,   73,   74,    0,    0,  179,
			    0,   65,   68, 1061, 4674,   95, 1057, 1020, 1032, 4674,
			   87, 4674, 4674, 4674, 4674, 4674, 1017,   85, 1006,   94,
			  113, 4674, 4674,  973, 4674,  942,  926,  266,  115,  270,
			  275,  279,  285,  304,  311,  319,  349,  418,  360,  388,
			  374,  353,  282, 4674, 4674,  899,  493,  568,   80,   82,
			  305,   86,  344,   94,   84,  358,  298,   98,   88,  225,
			  934, 4674, 4674,  933,  154, 4674,  115,  364,  304,  387,
			  342,  390,  321, 4674,  379,  878, 4674,  274,  914,  494,
			  569, 4674,   75,  643, 4674,  158,  911, 4674,  904, 4674,

			  890,    0,  642,  894,  879,  677, 4674,  460,  682,  705,
			  466,  725, 4674, 4674, 4674,  450,  704,    0,  715,  731,
			  746,  752,  756,  763,  770,  780,  796,  804,  823,  828,
			  841,  849,  856,  847,  865,  899,  972,  917,  907,  936,
			  932,  945,  962,  977, 1001,  870,  395,  821, 4674,  284,
			  858, 1055,  838,  320,  349,    0,  634,  380,  401,  391,
			  392,  405,  784,  420,  814,  429,  431,  453,  476,  818,
			  811,  504,  733,  777,  551,  826,  769,  549,  575,  666,
			  690,  739,  752,  781,  790,  803,  810,  838,  830,  896,
			  856,  948,  900,  902,  943,  951,  952, 4674,  811, 4674,

			  313, 4674, 4674,  982,  498,  936,  948,  959,  992, 4674,
			  997,  765, 4674,  279,  663, 1031, 4674,  807, 1049,  323,
			 1131,  495,  517, 1218, 4674, 4674,  781, 1054, 4674, 4674,
			 4674,  795, 1068,  793,  784,  777,  769,  502, 4674, 1251,
			 1078, 1085, 1206, 4674, 1257, 1216, 1267, 1221, 1273, 4674,
			  749, 1296, 1300, 1305, 1313, 1324, 1330, 1337, 1342, 1010,
			 1354, 1367, 1373, 1380, 1397, 1408, 1412, 1421, 1442, 1454,
			 1475, 1427, 1486, 1496, 1332, 1448, 1504, 1525, 1446, 1531,
			 1535, 1540, 1546, 1550, 1559, 1574, 1578,  751, 4674, 4674,
			  752,  985,    0, 1586, 1603,  995,    0, 1021, 1033, 1041,

			 1045, 1039, 1249, 1259, 1260, 1270,  676, 1316,  675, 1600,
			 1329, 1331, 1344, 1358, 1375, 1401, 1405, 1411, 1451,    0,
			    0, 1456, 1499, 1501, 1530, 1528, 1535, 1543, 1552, 1544,
			 1546,  658, 1549, 1567,  650,    0,    0, 1577, 1580, 1550,
			  359, 1580,  575, 1585, 1591, 1594, 4674,  668, 1655, 4674,
			  664, 1241,  656, 1637, 4674, 4674, 1663, 4674, 4674, 4674,
			 4674, 1668, 1625, 1674, 1684, 1691, 1697, 1718, 1723, 1728,
			 1740, 1748, 1753, 1758,  622, 1779, 1783, 1695, 1787, 1791,
			 1795, 1800, 1686, 1812, 1819, 1829, 1837, 1847, 1856, 1864,
			 1866, 1835, 1894, 1900, 1933, 1921, 1957, 1962, 1943, 1961,

			 1957, 1985, 1998, 2004, 2009, 2015,  748,    0, 1604, 1652,
			 1691, 1720,    0, 1745, 1766,    0, 1784, 1802, 1818, 1835,
			 1838, 1854, 1850, 1891, 1894, 1908, 1923, 1933, 1963, 1969,
			 1965, 1972, 1976, 1981,    0,    0,    0,    0, 1980, 1995,
			 2004, 1982, 2000,  580,  570, 2058, 2064, 2074, 2079,  570,
			 2084, 2089, 2094, 2102, 2107, 2112,  503, 2132, 2139, 2024,
			  396, 2138, 2143, 2164, 2169, 2047, 2173,  497, 2178, 2182,
			 2203, 2064, 2217, 2222, 2228, 2236, 2246, 2261, 2289, 2198,
			 2271, 2310, 2298, 2319, 2224,  903, 1019, 2085,  455,  447,
			 2002, 2022, 2105, 2144, 2138, 2199,    0, 2136,    0, 2157,

			 2159, 2224,    0, 2234, 2243, 2254, 2265, 2273, 2275, 2286,
			 2285, 2296, 2297, 2301, 2293, 2297, 2305, 2306, 2354, 2329,
			 2359, 2327, 2370, 2376, 2386, 2391, 2396, 2401, 2406, 2419,
			 2424, 2381, 4674, 2434, 2445, 2455, 2460, 2466, 2470, 2484,
			 2314, 2474, 2501, 2505, 2510, 2514, 2526, 2522,  466, 2550,
			 2554, 2565, 2581, 2534, 2550,  300, 4674, 4674, 2432, 2467,
			 2468, 2465, 2461,    0, 2489, 2497,    0, 2500, 2494, 2513,
			 2531, 2536, 2556, 2546, 2548, 2550, 2562, 2568, 2568, 2570,
			    0, 2561, 2574, 2576,    0, 2566, 2623, 2628, 2633, 2643,
			 2653, 2658, 2663, 2578, 2668, 2673,  442, 2678, 2683, 2688,

			 4674, 2696, 2706, 2728, 2732, 2736, 2741, 2745, 2586, 2757,
			 2762, 2772, 2776, 2781, 2786, 2692, 2790, 2800, 2805,  411,
			  396, 2567, 2575, 2685,    0, 2727,    0, 2742,    0,    0,
			    0, 2741,    0,    0, 2755,    0,    0, 2770,    0, 2773,
			    0, 2780, 2779, 2783, 2785,  343, 2833, 2838, 2848, 2853,
			 2858, 2868,  230,  557, 2876, 1621, 2881, 2886, 2891, 2913,
			 2917, 2922, 4674, 2824, 2926, 2889, 2947, 2956, 2960, 2938,
			 2945, 2788, 2798, 2801, 2888, 2907,    0,    0, 2925, 2933,
			 2936, 2936,    0, 2942, 2989,  228, 2999, 3004, 3009, 3014,
			 3019, 3027, 4674, 3032, 3053, 3058, 2973, 3064, 4674, 3068,

			 3074, 3036, 3053, 2952, 2943, 3020,    0,    0, 3042, 3047,
			    0, 3037,    0, 3107,  225, 3113, 3123, 3115, 3147, 3151,
			 3155,  359, 4674, 3053, 3045, 3047, 3066, 3095, 3098,  147,
			 3149, 3176, 3180, 3184, 3188, 3149, 3164, 3116,    0,    0,
			    0,    0, 3157, 3196, 3214, 3205, 3235, 3211, 3214, 3151,
			 3187, 3228, 3250, 3261,  138,  122, 3203,    0, 3278, 3264,
			 4674, 3287, 3229, 3265, 3212, 3286, 3303, 3312, 3281, 3288,
			    0, 3313, 3325,  118,   88, 3323, 3336, 3331, 4674, 3332,
			 3333, 3344, 3349, 3344, 3345, 3364, 3381, 4674, 4674, 3379,
			 3387, 3392, 4674, 3399, 3414, 3404, 3419, 4674, 3464, 3512,

			 3560, 3608, 3656, 3704, 3751, 3792, 3838, 3886, 3934, 3982,
			 4029, 4075, 4123, 4171, 4219, 4267, 4308, 4349, 4394, 4441,
			 4488, 4534, 4579, 4625, yy_Dummy>>)
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
			  808,  809,  797,  809,  810,  810,  797,  797,  797,  797,
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
			  819,  819,  819,  818,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  816,  804,  804,  804,  804,  804,
			  804,  804,  797,  804,  804,  804,  804,  804,  804,  804,
			  136,  136,  390,  390,  804,  133,  394,  394,  804,  804,

			  797,  804,  804,  804,  804,  804,  820,  821,  151,   57,
			  151,   57,  151,  151,  151,   57,   57,   57,  151,  151,
			   57,  151,  151,  151,  151,   57,   57,   57,  151,   57,
			  151,  151,   57,   57,  151,  151,   57,   57,  151,  151,
			  151,   57,   57,  151,   57,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  815,  797,  797,
			  797,  804,  804,  804,  804,  804,  804,  797,  804,  804,
			  804,  804,  804,  804,  804,  394,  804,  394,  477,  797,
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
			   17,   17,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,    5,   37,   38,    5,   12,   12,   12,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   39,
			   40,   41,   42,   43,   44,   45,   46,    5,    5,   47,
			   48,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  127,  125,    1,    2,   15,  109,   18,
			  125,   16,   17,    7,    6,   13,    5,   11,    8,  100,
			  100,   14,   12,   29,   10,   30,   20,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   79,   92,   92,
			   92,   92,   22,   31,   23,    9,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   24,   21,   25,  113,  114,  115,  116,  113,  113,  113,
			  113,  113,  126,   98,  126,  126,  126,  126,   67,  126,
			  126,   69,  126,  126,   91,    1,    2,   28,  109,  108,

			  123,  123,  123,    3,   33,  104,   32,    0,    0,  100,
			    0,  100,   27,   26,   19,    0,   92,   88,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   40,   92,   87,   87,   78,   87,   87,   92,
			   92,   92,   92,   92,   92,    0,    0,    0,   99,    0,
			    0,   95,    0,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   40,   95,   40,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   96,  113,  115,

			  114,  111,  110,  112,  113,  113,  113,  113,    0,   98,
			    0,    0,   97,    0,    0,    0,   69,   67,    0,   66,
			    0,   65,    0,    0,   91,   89,   89,    0,   90,  123,
			  117,  123,  123,  123,  123,  123,  123,    4,   34,  104,
			    0,    0,    0,  102,  104,  102,  100,    0,    0,   88,
			    0,   92,   39,   92,   92,   92,   92,   92,   92,    0,
			   92,   92,   92,   92,   92,   42,   92,   92,   79,   80,
			   79,   80,   79,   79,   86,   92,   86,   86,   86,   92,
			   92,   92,   92,   92,   92,   41,   92,    0,   63,   94,
			    0,   95,   39,   70,   70,   95,   39,   95,   95,   95,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,    0,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   42,
			   42,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   41,   41,   95,   95,  113,
			  113,  113,  113,  113,  113,  113,   97,    0,    0,   68,
			   66,   65,   69,    0,  121,  124,  124,  122,  118,  119,
			  120,  104,    0,  104,    0,    0,  104,    0,    0,    0,
			  103,  100,    0,    0,   93,   92,   92,   38,   92,   92,
			   92,   92,    0,   92,   92,   92,   92,   92,   92,   92,
			   92,   78,   92,   92,   92,   92,   78,   78,   78,   37,

			    0,   44,   92,   92,   92,   92,   64,   60,   95,   95,
			   95,   95,   38,   95,   95,   38,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   37,   44,   37,   44,   95,   95,
			   95,   95,   95,   95,   95,  104,  104,    0,    0,  101,
			  104,    0,  103,    0,  103,    0,    0,    0,  100,   75,
			    0,   92,   92,   92,   92,   45,   92,    0,   92,   92,
			   92,   36,   92,   92,   92,   80,   79,   92,   92,    0,
			   92,   92,   92,   92,    0,   64,   64,    0,   95,   95,
			   95,   95,   95,   95,   95,   95,   45,   95,   45,   95,

			   95,   95,   36,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,    0,  104,
			    0,  107,  104,  103,    0,    0,  103,    0,    0,  102,
			    0,    0,   75,    0,   92,   92,   92,   92,   47,   92,
			    0,   92,   92,   92,   92,   92,   92,   92,    0,   53,
			   92,   92,   92,    0,    0,    0,   62,   61,   95,   95,
			   95,   95,   95,   47,   95,   95,   47,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   53,   95,   95,   95,   53,   95,    0,  104,    0,    0,
			    0,  103,    0,  107,  103,    0,   77,    0,    0,    0,

			  105,  107,  105,   92,   92,   59,   92,   46,    0,   43,
			   58,   92,   35,   92,   51,    0,   92,   92,   92,    0,
			    0,   95,   95,   95,   59,   95,   59,   95,   46,   43,
			   58,   95,   43,   58,   95,   35,   35,   95,   51,   95,
			   51,   95,   95,   95,   95,  107,    0,  107,    0,  103,
			    0,    0,  106,    0,    0,   74,  107,    0,  106,   92,
			   92,   92,   83,   54,   92,    0,   92,   92,   55,    0,
			    0,   95,   95,   95,   95,   95,   54,   54,   95,   95,
			   95,   95,   55,   95,  107,  106,    0,  106,    0,    0,
			    0,    0,   74,  106,   92,   92,   48,   92,   82,   52,

			   92,    0,    0,   95,   95,   95,   48,   48,   95,   95,
			   52,   95,   52,  106,   76,    0,   74,   92,   92,   92,
			   92,   81,   81,   95,   95,   95,   95,   95,   95,    0,
			    0,   92,   50,   49,   92,    0,    0,   95,   50,   50,
			   49,   49,   95,    0,    0,   92,   92,    0,    0,   95,
			   95,   73,   92,   56,    0,    0,   95,   56,    0,    0,
			   73,   92,    0,    0,   95,    0,    0,   57,    0,    0,
			   57,    0,   72,    0,    0,    0,    0,    0,   72,    0,
			    0,    0,    0,    0,    0,    0,   71,   84,   85,    0,
			    0,    0,   71,    0,   71,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4674
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
