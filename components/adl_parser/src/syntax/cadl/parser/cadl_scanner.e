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
if yy_act <= 64 then
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
if yy_act = 63 then
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
if yy_act <= 96 then
if yy_act <= 80 then
if yy_act <= 72 then
if yy_act <= 68 then
if yy_act <= 66 then
if yy_act = 65 then
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
if yy_act = 67 then
--|#line 241 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 241")
end
in_lineno := in_lineno + text_count
else
--|#line 244 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 244")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 70 then
if yy_act = 69 then
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
			
else
--|#line 267 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 267")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 71 then
--|#line 274 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 274")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 275 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 275")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 76 then
if yy_act <= 74 then
if yy_act = 73 then
--|#line 276 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 276")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 283 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 283")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 75 then
--|#line 284 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 284")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 291 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 291")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 78 then
if yy_act = 77 then
--|#line 292 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 292")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 299 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 299")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 79 then
--|#line 300 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 300")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 307 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 307")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
end
end
end
else
if yy_act <= 88 then
if yy_act <= 84 then
if yy_act <= 82 then
if yy_act = 81 then
--|#line 319 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 319")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 329 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 329")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 83 then
--|#line 334 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 334")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 344 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 344")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
else
if yy_act <= 86 then
if yy_act = 85 then
--|#line 350 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 350")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 360 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 360")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 87 then
--|#line 361 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 361")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 375 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 375")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 92 then
if yy_act <= 90 then
if yy_act = 89 then
--|#line 381 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 381")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 387 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 387")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 91 then
--|#line 391 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 391")
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
--|#line 432 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 432")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
else
if yy_act <= 94 then
if yy_act = 93 then
--|#line 438 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 438")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 444 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 444")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 95 then
--|#line 450 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 450")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 457 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 457")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 112 then
if yy_act <= 104 then
if yy_act <= 100 then
if yy_act <= 98 then
if yy_act = 97 then
--|#line 463 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 463")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 470 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 470")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
end
else
if yy_act = 99 then
--|#line 474 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 474")
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
--|#line 485 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 485")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
end
else
if yy_act <= 102 then
if yy_act = 101 then
--|#line 492 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 492")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 497 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 497")
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
if yy_act = 103 then
	yy_end := yy_end - 1
--|#line 512 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 512")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 513 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 513")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 108 then
if yy_act <= 106 then
if yy_act = 105 then
--|#line 514 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 514")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
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
else
if yy_act = 107 then
--|#line 519 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 519")
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
--|#line 520 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 520")
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
if yy_act <= 110 then
if yy_act = 109 then
--|#line 540 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 540")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 545 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 545")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
if yy_act = 111 then
--|#line 553 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 553")
end
in_buffer.append_character ('\')
else
--|#line 555 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 555")
end
in_buffer.append_character ('"')
end
end
end
end
else
if yy_act <= 120 then
if yy_act <= 116 then
if yy_act <= 114 then
if yy_act = 113 then
--|#line 557 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 557")
end

				in_buffer.append_string (text)
	
else
--|#line 561 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 561")
end
in_buffer.append_string (text)
end
else
if yy_act = 115 then
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
--|#line 568 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 568")
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
if yy_act <= 118 then
if yy_act = 117 then
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
--|#line 588 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 588")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
else
if yy_act = 119 then
--|#line 590 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 590")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
end
end
else
if yy_act <= 124 then
if yy_act <= 122 then
if yy_act = 121 then
--|#line 592 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 592")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 593 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 593")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 123 then
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 596 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 596")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 126 then
if yy_act = 125 then
--|#line 597 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 597")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 601 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 601")
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
			create an_array.make (0, 4891)
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
			  109,  783,  110,  110,  110,  110,  110,  116,  116,  162,
			  116,  170,  202,  178,  180,   84,   84,  108,  194,  109,
			  163,  112,  112,  112,  112,  112,  161,  190,   76,  102,
			  118,  782,  191,   76,   94,  766,  164,   94,  171,  111,
			  179,  181,   85,   85,  225,  195,  201,  165,  201,  201,
			   95,  765,   95,   95,  192,  746,  746,  203,  111,  193,
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
			  732,  116,  116,  116,  196,  116,  215,  116,  116,  215,
			  116,  116,  116,  527,  116,  458,  150,  116,  116,  150,
			  116,  118,  146,  146,  151,  118,  348,  146,  146,  121,

			  118,  197,  800,  119,  118,  120,  116,  116,  124,  116,
			  118,  200,  122,  116,  116,  201,  116,  201,  201,  125,
			  126,  116,  116,  123,  116,  220,  121,  217,  220,  118,
			  119,  214,  120,  186,  166,  124,  118,  146,  210,  122,
			  130,  187,  127,  128,  118,  167,  125,  126,  129,  200,
			  123,  116,  116,  559,  116,  116,  116,  293,  116,  131,
			  188,  168,  116,  116,  738,  116,  200,  130,  189,  127,
			  128,  200,  169,  211,  118,  129,  116,  116,  118,  116,
			  132,  294,  172,  173,  293,  118,  131,  205,  174,  182,
			  116,  116,  133,  116,  200,  140,  213,  200,  450,  118,

			  212,  183,  145,  141,  739,  146,  146,  132,  294,  175,
			  176,  673,  536,  118,  144,  177,  184,  293,  289,  133,
			  116,  116,  140,  116,  207,  207,  672,  142,  185,  145,
			  141,  211,  143,  294,  299,  299,  134,  134,  134,  134,
			  134,  144,  205,  118,  297,  204,  204,  204,  290,  301,
			  135,  111,  116,  116,  142,  116,  136,  656,  212,  143,
			  298,  299,  300,  137,  301,  138,  307,  139,  206,  206,
			  206,  208,  208,  208,  308,  251,  301,  135,  244,  244,
			  244,  244,  244,  136,  250,  250,  250,  250,  250,  618,
			  307,  304,  138,  307,  139,  150,  219,  222,  150,  219,

			  222,  308,  561,  151,  239,  200,  239,  239,  220,  221,
			  561,  152,  152,  152,  152,  152,  153,  309,  222,  308,
			  543,  531,  152,  152,  152,  152,  152,  152,  152,  152,
			  154,  152,  155,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  224,  312,  310,  217,  152,  156,
			  156,  157,  156,  156,  156,  156,  156,  158,  156,  159,
			  156,  156,  156,  156,  156,  157,  156,  156,  156,  156,
			  150,  219,  312,  150,  219,  691,  691,  691,  151,  204,
			  204,  204,  200,  220,  108,  487,  152,  152,  152,  152,
			  152,  153,  312,  222,  319,  487,  225,  152,  152,  152,

			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  316,
			  319,  319,  217,  152,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  227,  227,  320,  227,  377,
			  295,  232,  296,  296,  296,  296,  296,  207,  207,  351,
			  233,  233,  233,  233,  233,  215,  352,  351,  215,  352,
			  228,  351,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  234,  241,  241,  241,  241,  241,

			  246,  246,  246,  246,  246,  443,  116,  116,  235,  116,
			  242,  321,  236,  443,  237,  247,  217,  116,  116,  108,
			  116,  109,  229,  248,  248,  248,  248,  248,  249,  118,
			  422,  422,  243,  116,  116,  321,  116,  242,  321,  108,
			  118,  109,  247,  248,  248,  248,  248,  248,  116,  116,
			  488,  116,  253,  489,  116,  116,  118,  116,  116,  116,
			  111,  116,  322,  254,  313,  116,  116,  314,  116,  410,
			  323,  118,  116,  116,  409,  116,  377,  118,  362,  253,
			  111,  118,  116,  116,  324,  116,  361,  257,  118,  255,
			  254,  313,  258,  360,  314,  118,  256,  323,  116,  116,

			  259,  116,  359,  261,  356,  118,  116,  116,  800,  116,
			  218,  324,  323,  260,  257,  302,  255,  214,  200,  258,
			  303,  118,  324,  256,  315,  116,  116,  259,  116,  118,
			  116,  116,  315,  116,  311,  263,  327,  262,  264,  325,
			  260,  261,  302,  116,  116,  302,  116,  303,  118,  326,
			  303,  116,  116,  118,  116,  292,  328,  313,  116,  116,
			  314,  116,  263,  327,  262,  264,  118,  116,  116,  291,
			  116,  327,  305,  266,  118,  149,  328,  306,  265,  270,
			  268,  118,  271,  328,  317,  272,  267,  318,  269,  333,
			  118,  273,  117,  289,  274,  240,  275,  239,  329,  238,

			  266,  116,  116,  330,  116,  488,  270,  268,  488,  271,
			  276,  231,  272,  267,   99,  269,  333,   96,  273,  116,
			  116,  274,  116,  275,  118,  117,  117,  117,  117,  117,
			  218,  135,  331,  333,  116,  116,  332,  116,  116,  116,
			  214,  116,  118,  200,  276,  337,  138,  116,  116,  135,
			  116,  200,  276,  198,  149,  200,  117,  118,  135,  331,
			  336,  118,  276,  332,  116,  116,  200,  116,  115,  281,
			  118,  282,  337,  138,  116,  116,  135,  116,  283,  116,
			  116,  284,  116,  117,  331,  285,  337,  118,  332,  200,
			  277,  277,  277,  277,  277,  286,  281,  118,  282,  114, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  339,  339,  118,  116,  116,  283,  116,  278,  284,  210,
			  279,  334,  285,  338,  213,  335,  280,  204,  204,  204,
			  287,  488,  286,  113,  489,  411,  118,  339,  340,  346,
			  346,  346,  107,  219,  278,  411,  219,  279,  385,  104,
			  347,  347,  347,  280,  211,  220,   99,  287,  385,  211,
			  288,  219,  411,  413,  219,  222,  355,  355,  385,  355,
			   97,   96,  412,  220,  800,  413,  341,  342,  343,  344,
			  345,  212,  559,  222,  415,  385,  212,  288,  800,  800,
			  413,  228,  416,  417,  217,  357,  358,  358,  358,  358,
			  358,  365,  414,  365,  800,  800,  366,  366,  366,  366,

			  366,  415,  217,  367,  367,  367,  367,  367,  800,  416,
			  417,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  349,  350,  351,  349,  350,  349,  349,  349,
			  349,  349,  349,  349,  349,  352,  221,  221,  349,  221,
			  221,  221,  221,  221,  349,  353,  349,  349,  349,  349,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  349,  349,  354,  349,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  221,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  227,  227,  800,  227,  368,  368,  368,  368,  368,  372,
			  800,  372,  800,  800,  373,  373,  373,  373,  373,  375,
			  375,  375,  375,  800,  415,  228,  800,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  238,
			  238,  418,  238,  364,  364,  364,  364,  364,  800,  369,
			  369,  369,  369,  369,  353,  351,  800,  353,  242,  800,
			  116,  116,  363,  116,  370,  800,  108,  229,  109,  800,

			  374,  374,  374,  374,  374,  376,  376,  376,  376,  376,
			  243,  116,  116,  118,  116,  242,  371,  116,  116,  416,
			  116,  370,  116,  116,  800,  116,  116,  116,  378,  116,
			  602,  602,  602,  602,  118,  116,  116,  111,  116,  800,
			  118,  116,  116,  417,  116,  118,  419,  379,  800,  118,
			  800,  399,  800,  380,  400,  378,  116,  116,  118,  116,
			  401,  381,  116,  116,  118,  116,  116,  116,  800,  116,
			  420,  421,  116,  116,  379,  116,  421,  382,  399,  118,
			  380,  400,  800,  383,  424,  118,  800,  401,  381,  118,
			  800,  116,  116,  800,  116,  118,  558,  386,  421,  116,

			  116,  387,  116,  423,  382,  425,  388,  426,  800,  384,
			  383,  424,  116,  116,  118,  116,  116,  116,  427,  116,
			  116,  116,  118,  116,  386,  389,  424,  800,  387,  425,
			  800,  800,  425,  388,  426,  118,  800,  800,  800,  118,
			  426,  390,  800,  118,  560,  427,  116,  116,  431,  116,
			  800,  392,  389,  428,  116,  116,  429,  116,  116,  116,
			  391,  116,  393,  393,  393,  393,  393,  430,  390,  118,
			  395,  395,  395,  395,  395,  431,  800,  118,  392,  116,
			  116,  118,  116,  292,  431,  433,  800,  391,  434,  394,
			  116,  116,  800,  116,  385,  396,  396,  396,  396,  396,

			  116,  116,  118,  116,  385,  800,  397,  397,  397,  397,
			  397,  432,  433,  118,  385,  434,  398,  398,  398,  398,
			  398,  433,  394,  118,  117,  117,  117,  117,  117,  116,
			  116,  385,  116,  394,  117,  117,  117,  117,  117,  116,
			  116,  434,  116,  394,  116,  116,  437,  116,  435,  800,
			  438,  117,  118,  116,  116,  800,  116,  116,  116,  800,
			  116,  800,  118,  116,  116,  800,  116,  118,  436,  116,
			  116,  280,  116,  437,  403,  437,  118,  438,  117,  438,
			  118,  402,  116,  116,  441,  116,  118,  442,  404,  200,
			  116,  116,  118,  116,  116,  116,  200,  116,  280,  200,

			  800,  800,  439,  405,  441,  118,  440,  442,  402,  446,
			  406,  441,  446,  118,  442,  404,  295,  118,  295,  295,
			  295,  295,  295,  295,  200,  296,  296,  296,  296,  296,
			  405,  444,  200,  800,  445,  407,  446,  406,  800,  447,
			  491,  408,  491,  800,  350,  351,  800,  350,  800,  800,
			  800,  355,  355,  800,  355,  800,  352,  357,  358,  358,
			  358,  358,  358,  204,  204,  204,  353,  491,  408,  492,
			  206,  206,  206,  208,  208,  208,  800,  448,  448,  448,
			  448,  448,  366,  366,  366,  366,  366,  449,  449,  449,
			  449,  449,  242,  116,  116,  354,  116,  800,  204,  204,

			  204,  451,  451,  451,  451,  451,  204,  204,  204,  452,
			  452,  452,  452,  452,  243,  800,  118,  800,  800,  242,
			  769,  769,  769,  769,  450,  453,  453,  453,  453,  453,
			  454,  800,  454,  800,  493,  455,  455,  455,  455,  455,
			  370,  456,  456,  456,  456,  456,  373,  373,  373,  373,
			  373,  457,  457,  457,  457,  457,  462,  462,  462,  462,
			  462,  493,  371,  800,  800,  459,  460,  370,  461,  461,
			  461,  461,  461,  463,  463,  463,  463,  463,  116,  116,
			  493,  116,  116,  116,  800,  116,  116,  116,  458,  116,
			  116,  116,  495,  116,  116,  116,  800,  116,  470,  116,

			  116,  118,  116,  800,  800,  118,  800,  494,  470,  118,
			  800,  116,  116,  118,  116,  800,  465,  118,  470,  495,
			  800,  800,  118,  464,  800,  468,  469,  496,  116,  116,
			  466,  116,  800,  467,  118,  470,  116,  116,  482,  116,
			  800,  116,  116,  465,  116,  471,  116,  116,  482,  116,
			  464,  118,  468,  469,  496,  495,  800,  466,  482,  118,
			  467,  800,  496,  800,  118,  473,  499,  116,  116,  118,
			  116,  500,  471,  116,  116,  482,  116,  499,  474,  475,
			  472,  800,  497,  393,  393,  393,  393,  393,  117,  498,
			  118,  117,  473,  499,  800,  800,  118,  117,  500,  502,

			  271,  800,  800,  478,  501,  474,  475,  472,  476,  273,
			  503,  504,  505,  502,  477,  117,  800,  800,  117,  396,
			  396,  396,  396,  396,  117,  800,  502,  271,  116,  116,
			  478,  116,  800,  270,  503,  476,  273,  503,  504,  505,
			  506,  477,  395,  395,  395,  395,  395,  504,  274,  116,
			  116,  118,  116,  398,  398,  398,  398,  398,  800,  117,
			  270,  507,  800,  800,  800,  397,  397,  397,  397,  397,
			  800,  509,  118,  800,  508,  274,  509,  116,  116,  479,
			  116,  511,  116,  116,  117,  116,  117,  480,  480,  480,
			  480,  480,  512,  481,  481,  481,  481,  481,  509,  511, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  118,  117,  512,  510,  515,  118,  479,  117,  511,  116,
			  116,  117,  116,  116,  116,  516,  116,  116,  116,  512,
			  116,  515,  116,  116,  516,  116,  513,  800,  117,  514,
			  800,  515,  118,  800,  117,  487,  118,  517,  800,  800,
			  118,  800,  516,  484,  485,  118,  562,  518,  519,  800,
			  800,  520,  800,  483,  486,  800,  800,  448,  448,  448,
			  448,  448,  800,  800,  517,  522,  522,  522,  522,  522,
			  484,  485,  521,  562,  518,  523,  523,  523,  523,  523,
			  483,  486,  524,  524,  524,  524,  524,  800,  525,  525,
			  525,  525,  525,  455,  455,  455,  455,  455,  800,  521,

			  562,  800,  450,  370,  526,  526,  526,  526,  526,  528,
			  528,  528,  528,  528,  529,  529,  529,  529,  529,  530,
			  530,  530,  530,  530,  800,  371,  533,  563,  533,  800,
			  370,  525,  525,  525,  525,  525,  534,  116,  116,  800,
			  116,  527,  116,  116,  800,  116,  532,  800,  800,  800,
			  460,  458,  461,  461,  461,  461,  461,  564,  116,  116,
			  118,  116,  800,  535,  800,  118,  116,  116,  564,  116,
			  800,  116,  116,  532,  116,  116,  116,  570,  116,  538,
			  565,  118,  116,  116,  564,  116,  800,  800,  539,  118,
			  537,  566,  800,  800,  118,  567,  800,  540,  118,  116,

			  116,  800,  116,  800,  570,  118,  538,  565,  541,  800,
			  542,  116,  116,  544,  116,  539,  116,  116,  566,  116,
			  116,  116,  118,  116,  540,  116,  116,  571,  116,  545,
			  116,  116,  800,  116,  118,  541,  565,  542,  800,  118,
			  544,  116,  116,  118,  116,  546,  572,  566,  118,  573,
			  571,  547,  572,  118,  571,  551,  545,  800,  573,  116,
			  116,  549,  116,  568,  118,  551,  548,  550,  550,  550,
			  550,  550,  546,  572,  569,  551,  573,  574,  547,  575,
			  577,  117,  118,  800,  394,  576,  800,  800,  549,  577,
			  552,  579,  551,  548,  800,  480,  480,  480,  480,  480,

			  481,  481,  481,  481,  481,  580,  800,  577,  117,  117,
			  116,  116,  579,  116,  556,  400,  578,  552,  579,  580,
			  117,  401,  116,  116,  556,  116,  116,  116,  583,  116,
			  584,  585,  580,  118,  557,  586,  117,  800,  583,  581,
			  584,  553,  400,  800,  800,  118,  582,  117,  401,  118,
			  800,  556,  693,  694,  693,  583,  800,  584,  585,  793,
			  794,  793,  586,  554,  555,  587,  624,  588,  553,  589,
			  592,  589,  800,  800,  590,  590,  590,  590,  590,  590,
			  590,  590,  590,  590,  591,  591,  591,  591,  591,  695,
			  554,  555,  243,  624,  611,  800,  795,  592,  525,  525,

			  525,  525,  525,  800,  594,  594,  594,  594,  594,  800,
			  611,  625,  625,  593,  611,  800,  450,  595,  595,  595,
			  595,  595,  596,  596,  596,  596,  596,  597,  597,  597,
			  597,  597,  598,  598,  598,  598,  598,  611,  625,  626,
			  593,  527,  599,  599,  599,  599,  599,  600,  800,  600,
			  627,  800,  597,  597,  597,  597,  597,  601,  601,  601,
			  601,  601,  628,  627,  458,  604,  604,  604,  604,  604,
			  116,  116,  800,  116,  800,  116,  116,  627,  116,  628,
			  605,  116,  116,  800,  116,  116,  116,  800,  116,  628,
			  629,  116,  116,  118,  116,  800,  800,  606,  118,  622,

			  116,  116,  607,  116,  118,  800,  630,  605,  118,  622,
			  116,  116,  608,  116,  118,  116,  116,  800,  116,  623,
			  800,  800,  609,  118,  606,  116,  116,  800,  116,  607,
			  631,  116,  116,  118,  116,  610,  622,  632,  118,  608,
			  116,  116,  633,  116,  116,  116,  613,  116,  118,  609,
			  634,  800,  612,  800,  118,  116,  116,  631,  116,  632,
			  800,  617,  610,  118,  632,  800,  800,  118,  614,  633,
			  800,  800,  800,  613,  633,  616,  800,  634,  118,  612,
			  116,  116,  615,  116,  116,  116,  635,  116,  617,  800,
			  550,  550,  550,  550,  550,  614,  116,  116,  623,  116,

			  634,  636,  616,  118,  638,  638,  640,  118,  623,  615,
			  117,  641,  640,  620,  641,  644,  273,  645,  623,  118,
			  646,  619,  644,  654,  674,  675,  621,  637,  800,  800,
			  800,  638,  639,  640,  800,  623,  800,  117,  641,  642,
			  620,  643,  644,  273,  645,  371,  675,  646,  619,  647,
			  654,  674,  675,  621,  590,  590,  590,  590,  590,  590,
			  590,  590,  590,  590,  648,  648,  648,  648,  648,  649,
			  800,  649,  800,  676,  650,  650,  650,  650,  650,  651,
			  800,  651,  800,  800,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  653,  653,  653,  653,  653,  597,

			  597,  597,  597,  597,  655,  655,  655,  655,  655,  597,
			  597,  597,  597,  597,  657,  657,  657,  657,  657,  658,
			  658,  658,  658,  658,  800,  800,  527,  659,  659,  659,
			  659,  659,  660,  665,  660,  677,  800,  661,  661,  661,
			  661,  661,  654,  116,  116,  800,  116,  116,  116,  665,
			  116,  116,  116,  665,  116,  800,  116,  116,  800,  116,
			  116,  116,  677,  116,  371,  800,  118,  800,  800,  654,
			  118,  677,  116,  116,  118,  116,  665,  116,  116,  118,
			  116,  679,  663,  118,  662,  664,  679,  116,  116,  800,
			  116,  116,  116,  681,  116,  118,  116,  116,  678,  116,

			  118,  116,  116,  681,  116,  668,  800,  800,  679,  663,
			  118,  662,  664,  680,  118,  116,  116,  683,  116,  118,
			  681,  668,  800,  684,  118,  668,  116,  116,  685,  116,
			  682,  683,  800,  667,  666,  800,  800,  704,  118,  116,
			  116,  704,  116,  800,  683,  706,  669,  800,  668,  118,
			  684,  785,  785,  785,  785,  685,  800,  704,  686,  670,
			  667,  666,  118,  650,  650,  650,  650,  650,  704,  800,
			  671,  800,  706,  669,  687,  687,  687,  687,  687,  652,
			  652,  652,  652,  652,  800,  800,  670,  652,  652,  652,
			  652,  652,  688,  688,  688,  688,  688,  671,  689,  800,

			  689,  800,  800,  690,  690,  690,  690,  690,  707,  800,
			  800,  450,  692,  692,  692,  692,  692,  596,  596,  596,
			  596,  596,  661,  661,  661,  661,  661,  696,  696,  696,
			  696,  696,  654,  116,  116,  707,  116,  116,  116,  707,
			  116,  701,  116,  116,  800,  116,  116,  116,  800,  116,
			  800,  709,  116,  116,  371,  116,  118,  701,  800,  654,
			  118,  701,  697,  800,  458,  118,  708,  116,  116,  118,
			  116,  698,  800,  699,  709,  118,  116,  116,  709,  116,
			  800,  700,  116,  116,  701,  116,  711,  711,  713,  697,
			  118,  705,  714,  713,  726,  705,  727,  702,  698,  118, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  699,  710,  800,  727,  729,  118,  729,  703,  700,  116,
			  116,  705,  116,  711,  712,  713,  800,  800,  800,  714,
			  715,  726,  705,  727,  702,  648,  648,  648,  648,  648,
			  728,  729,  118,  730,  703,  690,  690,  690,  690,  690,
			  716,  716,  716,  716,  716,  717,  717,  717,  717,  717,
			  535,  535,  535,  535,  535,  718,  718,  718,  718,  718,
			  800,  800,  450,  719,  719,  719,  719,  719,  655,  655,
			  655,  655,  655,  116,  116,  800,  116,  527,  116,  116,
			  800,  116,  724,  731,  116,  116,  724,  116,  116,  116,
			  800,  116,  800,  740,  116,  116,  118,  116,  800,  725,

			  741,  118,  724,  725,  741,  458,  720,  118,  743,  743,
			  731,  118,  800,  724,  800,  722,  800,  118,  800,  725,
			  740,  721,  688,  688,  688,  688,  688,  741,  800,  800,
			  725,  742,  800,  720,  800,  743,  744,  723,  116,  116,
			  745,  116,  722,  733,  733,  733,  733,  733,  721,  693,
			  800,  693,  800,  800,  719,  719,  719,  719,  719,  527,
			  800,  118,  116,  116,  723,  116,  800,  745,  752,  734,
			  116,  116,  800,  116,  116,  116,  800,  116,  747,  747,
			  747,  747,  747,  800,  753,  118,  695,  116,  116,  759,
			  116,  116,  116,  118,  116,  752,  734,  118,  750,  116,

			  116,  760,  116,  116,  116,  750,  116,  767,  773,  735,
			  118,  753,  736,  751,  118,  800,  759,  761,  750,  761,
			  751,  737,  118,  800,  800,  800,  118,  762,  760,  800,
			  748,  800,  750,  751,  767,  773,  735,  800,  800,  736,
			  116,  116,  749,  116,  800,  800,  800,  751,  737,  754,
			  754,  754,  754,  754,  763,  800,  800,  748,  695,  695,
			  695,  695,  695,  118,  757,  116,  116,  800,  116,  749,
			  758,  757,  116,  116,  800,  116,  800,  758,  116,  116,
			  800,  116,  800,  771,  757,  800,  800,  755,  118,  800,
			  758,  800,  800,  771,  800,  118,  756,  800,  757,  116,

			  116,  118,  116,  771,  758,  768,  768,  768,  768,  768,
			  800,  764,  786,  800,  755,  772,  800,  800,  800,  800,
			  771,  800,  118,  756,  800,  772,  116,  116,  786,  116,
			  770,  800,  786,  800,  800,  772,  800,  800,  764,  774,
			  774,  774,  774,  774,  775,  775,  775,  775,  775,  118,
			  776,  777,  772,  800,  800,  786,  800,  770,  800,  800,
			  776,  777,  778,  778,  778,  778,  778,  779,  800,  779,
			  776,  777,  763,  763,  763,  763,  763,  780,  784,  784,
			  784,  784,  784,  787,  800,  790,  791,  776,  777,  788,
			  788,  788,  788,  788,  789,  789,  789,  789,  789,  787,

			  800,  790,  791,  787,  781,  790,  791,  792,  792,  792,
			  792,  792,  781,  781,  781,  781,  781,  796,  796,  796,
			  796,  796,  800,  800,  800,  800,  787,  800,  790,  791,
			  797,  797,  797,  797,  797,  798,  798,  798,  798,  798,
			  793,  800,  793,  800,  800,  797,  797,  797,  797,  797,
			  799,  799,  799,  799,  799,  795,  795,  795,  795,  795,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  795,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   98,   98,
			  800,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,  800,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,  100,  100,
			  800,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,

			  117,  117,  117,  800,  800,  800,  800,  800,  800,  800,
			  117,  117,  800,  117,  800,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  800,  800,  117,
			  117,  117,  117,  117,  117,  117,  117,  147,  147,  800,
			  147,  147,  800,  147,  147,  800,  800,  800,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  800,  800,  147,  147,  147,  147,  147,  147,  147,  147,
			  148,  148,  800,  148,  148,  148,  148,  148,  148,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  199,  199,  800,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  800,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  800,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  216,  800,  216,  800,  800,  800,  800,  216,  216,  800,

			  216,  216,  800,  800,  800,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  800,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,

			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  230,  230,  800,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  103,  800,  800,
			  800,  800,  103,  103,  800,  800,  800,  103,  103,  103,

			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  800,
			  800,  103,  103,  103,  103,  103,  103,  103,  103,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  800,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,

			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  252,
			  800,  800,  800,  252,  252,  800,  252,  252,  252,  252,
			  252,  252,  252,  252,  252,  252,  252,  252,  252,  252,
			  252,  252,  252,  252,  252,  252,  252,  252,  252,  252,
			  800,  800,  252,  252,  252,  252,  252,  252,  252,  252,
			  146,  146,  800,  146,  146,  800,  146,  146,  146,  800,
			  800,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,

			  146,  146,  146,  800,  800,  146,  146,  146,  146,  146,
			  146,  146,  146,  229,  229,  229,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  229,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,

			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  490,  800,  490,  800,  800,  800,  800,  490,  490,
			  800,  490,  490,  800,  800,  800,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  800,  800,
			  490,  490,  490,  490,  490,  490,  490,  490,  410,  410,
			  410,  800,  800,  410,  410,  410,  410,  410,  410,  410,
			  410,  410,  800,  800,  410,  410,  410,  410,  410,  410,
			  410,  410,  410,  410,  410,  410,  410,  410,  410,  410,
			  410,  410,  410,  410,  410,  410,  800,  800,  410,  410,

			  410,  410,  410,  410,  410,  410,  558,  800,  558,  800,
			  800,  800,  800,  558,  558,  800,  558,  558,  800,  800,
			  800,  558,  558,  558,  558,  558,  558,  558,  558,  558,
			  558,  558,  558,  558,  558,  558,  558,  558,  558,  558,
			  558,  558,  558,  800,  558,  558,  558,  558,  558,  558,
			  558,  558,  558,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  800,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  603,  603,  603,  603,  603,  603,  603,  603,

			  603,  603,  603,   13,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800, yy_Dummy>>,
			1, 892, 4000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4891)
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
			  717,   37,   39,   39,   69,   39,   87,   40,   40,   87,
			   40,   41,   41,  688,   41,  655,  150,   42,   42,  150,
			   42,   37,   52,   52,  150,   39,  214,   52,   52,   39,

			   40,   69,  558,   37,   41,   37,   43,   43,   41,   43,
			   42,   78,   40,   44,   44,  201,   44,  201,  201,   41,
			   42,   45,   45,   40,   45,  220,   39,   87,  220,   43,
			   37,  214,   37,   66,   60,   41,   44,   52,   82,   40,
			   44,   66,   43,   43,   45,   60,   41,   42,   43,   80,
			   40,   46,   46,  558,   46,   51,   51,  154,   51,   45,
			   66,   60,   48,   48,  724,   48,  342,   44,   66,   43,
			   43,   77,   60,   82,   46,   43,   50,   50,   51,   50,
			   46,  155,   62,   62,  154,   48,   45,   78,   62,   65,
			   49,   49,   46,   49,   79,   48,   84,   81,  648,   50,

			   82,   65,   51,   48,  724,  147,  147,   46,  155,   62,
			   62,  623,  463,   49,   50,   62,   65,  158,  147,   46,
			   47,   47,   48,   47,   80,   80,  622,   49,   65,   51,
			   48,   84,   49,  159,  160,  161,   47,   47,   47,   47,
			   47,   50,  342,   47,  158,   77,   77,   77,  147,  162,
			   47,  463,  116,  116,   49,  116,   47,  599,   84,   49,
			  159,  160,  161,   47,  164,   47,  166,   47,   79,   79,
			   79,   81,   81,   81,  167,  116,  162,   47,  108,  108,
			  108,  108,  108,   47,  111,  111,  111,  111,  111,  551,
			  168,  164,   47,  166,   47,   56,   89,  222,   56,   89,

			  222,  167,  492,   56,  239,  205,  239,  239,   89,   89,
			  491,   56,   56,   56,   56,   56,   56,  168,   89,  169,
			  470,  459,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,  223,  172,  169,   89,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   57,   90,  172,   57,   90,  656,  656,  656,   57,  205,
			  205,  205,  344,   90,  452,  447,   57,   57,   57,   57,
			   57,   57,  175,   90,  178,  446,  223,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  175,
			  179,  178,   90,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   93,   93,  179,   93,  377,
			  157,  102,  157,  157,  157,  157,  157,  344,  344,  354,
			  102,  102,  102,  102,  102,  215,  352,  352,  215,  352,
			   93,  349,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,  102,  106,  106,  106,  106,  106,

			  109,  109,  109,  109,  109,  336,  117,  117,  102,  117,
			  106,  180,  102,  333,  102,  109,  215,  119,  119,  110,
			  119,  110,   93,  110,  110,  110,  110,  110,  110,  117,
			  310,  308,  106,  120,  120,  181,  120,  106,  180,  112,
			  119,  112,  109,  112,  112,  112,  112,  112,  121,  121,
			  409,  121,  119,  409,  122,  122,  120,  122,  123,  123,
			  110,  123,  181,  120,  173,  124,  124,  173,  124,  292,
			  182,  121,  125,  125,  289,  125,  252,  122,  237,  119,
			  112,  123,  126,  126,  183,  126,  236,  123,  124,  121,
			  120,  173,  123,  235,  173,  125,  122,  182,  127,  127,

			  124,  127,  234,  126,  232,  126,  128,  128,  227,  128,
			  218,  183,  184,  125,  123,  163,  121,  212,  199,  123,
			  163,  127,  185,  122,  177,  129,  129,  124,  129,  128,
			  130,  130,  174,  130,  171,  128,  186,  127,  128,  184,
			  125,  170,  163,  131,  131,  165,  131,  163,  129,  185,
			  165,  132,  132,  130,  132,  153,  187,  176,  133,  133,
			  176,  133,  128,  186,  127,  128,  131,  135,  135,  151,
			  135,  188,  165,  130,  132,  148,  189,  165,  129,  134,
			  132,  133,  134,  187,  176,  134,  131,  176,  133,  191,
			  135,  134,  134,  146,  134,  105,  134,  104,  188,  103,

			  130,  136,  136,  189,  136,  488,  134,  132,  488,  134,
			  135,  100,  134,  131,   98,  133,  191,   96,  134,  138,
			  138,  134,  138,  134,  136,  139,  139,  139,  139,  139,
			   88,  136,  190,  193,  141,  141,  190,  141,  140,  140,
			   85,  140,  138,  206,  136,  194,  136,  142,  142,  138,
			  142,   73,  139,   70,   55,  207,  139,  141,  136,  190,
			  193,  140,  138,  190,  143,  143,  208,  143,   36,  140,
			  142,  140,  194,  136,  137,  137,  138,  137,  141,  144,
			  144,  142,  144,  139,  192,  142,  195,  143,  192,  204,
			  137,  137,  137,  137,  137,  143,  140,  137,  140,   35, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  196,  197,  144,  145,  145,  141,  145,  137,  142,  209,
			  137,  192,  142,  195,  211,  192,  137,  206,  206,  206,
			  144,  489,  143,   33,  489,  293,  145,  196,  197,  207,
			  207,  207,   28,  216,  137,  297,  216,  137,  261,   26,
			  208,  208,  208,  137,  209,  216,   18,  144,  261,  211,
			  145,  219,  293,  299,  219,  216,  228,  228,  261,  228,
			   17,   16,  297,  219,   13,  300,  204,  204,  204,  204,
			  204,  209,  489,  219,  301,  261,  211,  145,  152,    0,
			  299,  228,  302,  303,  216,  233,  233,  233,  233,  233,
			  233,  242,  300,  242,    0,    0,  242,  242,  242,  242,

			  242,  301,  219,  243,  243,  243,  243,  243,    0,  302,
			  303,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  224,  224,    0,  224,  244,  244,  244,  244,  244,  247,
			    0,  247,    0,    0,  247,  247,  247,  247,  247,  249,
			  249,  249,  249,    0,  304,  224,    0,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  238,
			  238,  304,  238,  241,  241,  241,  241,  241,    0,  246,
			  246,  246,  246,  246,  353,  353,    0,  353,  241,    0,
			  253,  253,  238,  253,  246,    0,  248,  224,  248,    0,

			  248,  248,  248,  248,  248,  250,  250,  250,  250,  250,
			  241,  254,  254,  253,  254,  241,  246,  255,  255,  305,
			  255,  246,  256,  256,    0,  256,  257,  257,  253,  257,
			  534,  534,  534,  534,  254,  258,  258,  248,  258,    0,
			  255,  259,  259,  306,  259,  256,  305,  255,    0,  257,
			    0,  277,    0,  256,  277,  253,  260,  260,  258,  260,
			  277,  257,  262,  262,  259,  262,  263,  263,    0,  263,
			  306,  307,  264,  264,  255,  264,  309,  258,  277,  260,
			  256,  277,    0,  259,  312,  262,    0,  277,  257,  263,
			    0,  265,  265,  490,  265,  264,  490,  262,  307,  267,

			  267,  263,  267,  309,  258,  313,  264,  314,    0,  260,
			  259,  312,  266,  266,  265,  266,  268,  268,  315,  268,
			  269,  269,  267,  269,  262,  265,  316,    0,  263,  317,
			    0,    0,  313,  264,  314,  266,    0,    0,    0,  268,
			  318,  266,    0,  269,  490,  315,  270,  270,  319,  270,
			    0,  269,  265,  316,  271,  271,  317,  271,  273,  273,
			  268,  273,  270,  270,  270,  270,  270,  318,  266,  270,
			  271,  271,  271,  271,  271,  319,    0,  271,  269,  272,
			  272,  273,  272,  311,  320,  323,    0,  268,  324,  270,
			  274,  274,    0,  274,  311,  272,  272,  272,  272,  272,

			  275,  275,  272,  275,  311,    0,  274,  274,  274,  274,
			  274,  320,  323,  274,  311,  324,  275,  275,  275,  275,
			  275,  325,  272,  275,  276,  276,  276,  276,  276,  279,
			  279,  311,  279,  274,  278,  278,  278,  278,  278,  280,
			  280,  326,  280,  275,  281,  281,  327,  281,  325,    0,
			  328,  278,  279,  282,  282,    0,  282,  283,  283,    0,
			  283,    0,  280,  284,  284,    0,  284,  281,  326,  285,
			  285,  279,  285,  327,  282,  329,  282,  328,  278,  330,
			  283,  281,  286,  286,  331,  286,  284,  332,  283,  341,
			  287,  287,  285,  287,  288,  288,  343,  288,  279,  345,

			    0,    0,  329,  284,  334,  286,  330,  335,  281,  339,
			  285,  331,  340,  287,  332,  283,  295,  288,  295,  295,
			  295,  295,  295,  296,  346,  296,  296,  296,  296,  296,
			  284,  334,  347,    0,  335,  286,  339,  285,    0,  340,
			  411,  288,  412,    0,  350,  350,    0,  350,    0,    0,
			    0,  355,  355,    0,  355,    0,  350,  358,  358,  358,
			  358,  358,  358,  341,  341,  341,  350,  411,  288,  412,
			  343,  343,  343,  345,  345,  345,  355,  364,  364,  364,
			  364,  364,  365,  365,  365,  365,  365,  366,  366,  366,
			  366,  366,  364,  380,  380,  350,  380,    0,  346,  346,

			  346,  367,  367,  367,  367,  367,  347,  347,  347,  368,
			  368,  368,  368,  368,  364,    0,  380,    0,    0,  364,
			  762,  762,  762,  762,  366,  369,  369,  369,  369,  369,
			  370,    0,  370,    0,  413,  370,  370,  370,  370,  370,
			  369,  371,  371,  371,  371,  371,  372,  372,  372,  372,
			  372,  373,  373,  373,  373,  373,  375,  375,  375,  375,
			  375,  413,  369,    0,    0,  374,  374,  369,  374,  374,
			  374,  374,  374,  376,  376,  376,  376,  376,  378,  378,
			  414,  378,  379,  379,    0,  379,  381,  381,  373,  381,
			  382,  382,  416,  382,  383,  383,    0,  383,  385,  384,

			  384,  378,  384,    0,    0,  379,    0,  414,  385,  381,
			    0,  386,  386,  382,  386,    0,  379,  383,  385,  416,
			    0,    0,  384,  378,    0,  383,  384,  417,  388,  388,
			  381,  388,    0,  382,  386,  385,  387,  387,  403,  387,
			    0,  389,  389,  379,  389,  386,  390,  390,  403,  390,
			  378,  388,  383,  384,  417,  419,    0,  381,  403,  387,
			  382,    0,  420,    0,  389,  388,  421,  391,  391,  390,
			  391,  422,  386,  392,  392,  403,  392,  423,  389,  390,
			  387,    0,  419,  393,  393,  393,  393,  393,  394,  420,
			  391,  394,  388,  421,    0,    0,  392,  394,  422,  424,

			  393,    0,    0,  393,  423,  389,  390,  387,  391,  393,
			  425,  426,  427,  428,  392,  394,    0,    0,  394,  396,
			  396,  396,  396,  396,  394,    0,  424,  393,  401,  401,
			  393,  401,    0,  396,  429,  391,  393,  425,  426,  427,
			  428,  392,  395,  395,  395,  395,  395,  430,  396,  397,
			  397,  401,  397,  398,  398,  398,  398,  398,    0,  395,
			  396,  429,    0,    0,    0,  397,  397,  397,  397,  397,
			    0,  431,  397,    0,  430,  396,  432,  402,  402,  397,
			  402,  433,  404,  404,  398,  404,  395,  399,  399,  399,
			  399,  399,  434,  400,  400,  400,  400,  400,  431,  435, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  402,  399,  436,  432,  441,  404,  397,  400,  433,  405,
			  405,  398,  405,  406,  406,  442,  406,  407,  407,  434,
			  407,  444,  408,  408,  445,  408,  435,    0,  399,  436,
			    0,  441,  405,    0,  400,  408,  406,  443,    0,    0,
			  407,    0,  442,  406,  407,  408,  493,  443,  444,    0,
			    0,  445,    0,  405,  407,    0,    0,  448,  448,  448,
			  448,  448,    0,    0,  443,  449,  449,  449,  449,  449,
			  406,  407,  448,  493,  443,  450,  450,  450,  450,  450,
			  405,  407,  451,  451,  451,  451,  451,    0,  453,  453,
			  453,  453,  453,  454,  454,  454,  454,  454,    0,  448,

			  494,    0,  449,  453,  455,  455,  455,  455,  455,  456,
			  456,  456,  456,  456,  457,  457,  457,  457,  457,  458,
			  458,  458,  458,  458,    0,  453,  462,  494,  462,    0,
			  453,  460,  460,  460,  460,  460,  462,  464,  464,    0,
			  464,  455,  465,  465,    0,  465,  460,    0,    0,    0,
			  461,  457,  461,  461,  461,  461,  461,  495,  466,  466,
			  464,  466,    0,  462,    0,  465,  467,  467,  497,  467,
			    0,  468,  468,  460,  468,  469,  469,  500,  469,  465,
			  496,  466,  471,  471,  495,  471,    0,    0,  466,  467,
			  464,  496,    0,    0,  468,  497,    0,  467,  469,  472,

			  472,    0,  472,    0,  500,  471,  465,  496,  467,    0,
			  469,  473,  473,  471,  473,  466,  474,  474,  496,  474,
			  475,  475,  472,  475,  467,  476,  476,  502,  476,  472,
			  477,  477,    0,  477,  473,  467,  498,  469,    0,  474,
			  471,  479,  479,  475,  479,  473,  503,  498,  476,  504,
			  506,  475,  507,  477,  502,  482,  472,    0,  508,  483,
			  483,  477,  483,  498,  479,  482,  476,  478,  478,  478,
			  478,  478,  473,  503,  498,  482,  504,  506,  475,  507,
			  509,  478,  483,    0,  479,  508,    0,    0,  477,  510,
			  483,  511,  482,  476,    0,  480,  480,  480,  480,  480,

			  481,  481,  481,  481,  481,  512,    0,  509,  478,  480,
			  484,  484,  513,  484,  487,  480,  510,  483,  511,  514,
			  481,  480,  485,  485,  487,  485,  486,  486,  515,  486,
			  516,  517,  512,  484,  487,  518,  480,    0,  519,  513,
			  520,  484,  480,    0,    0,  485,  514,  481,  480,  486,
			    0,  487,  658,  658,  658,  515,    0,  516,  517,  789,
			  789,  789,  518,  485,  486,  519,  561,  520,  484,  521,
			  524,  521,    0,    0,  521,  521,  521,  521,  521,  522,
			  522,  522,  522,  522,  523,  523,  523,  523,  523,  658,
			  485,  486,  524,  561,  543,    0,  789,  524,  525,  525,

			  525,  525,  525,    0,  526,  526,  526,  526,  526,    0,
			  543,  562,  563,  525,  543,    0,  522,  527,  527,  527,
			  527,  527,  528,  528,  528,  528,  528,  529,  529,  529,
			  529,  529,  530,  530,  530,  530,  530,  543,  562,  563,
			  525,  526,  531,  531,  531,  531,  531,  532,    0,  532,
			  564,    0,  532,  532,  532,  532,  532,  533,  533,  533,
			  533,  533,  565,  567,  529,  536,  536,  536,  536,  536,
			  537,  537,    0,  537,    0,  538,  538,  564,  538,  568,
			  536,  539,  539,    0,  539,  540,  540,    0,  540,  565,
			  567,  541,  541,  537,  541,    0,    0,  537,  538,  556,

			  542,  542,  538,  542,  539,    0,  568,  536,  540,  556,
			  544,  544,  539,  544,  541,  545,  545,    0,  545,  556,
			    0,    0,  540,  542,  537,  546,  546,    0,  546,  538,
			  570,  549,  549,  544,  549,  542,  556,  571,  545,  539,
			  547,  547,  572,  547,  548,  548,  545,  548,  546,  540,
			  573,    0,  544,    0,  549,  552,  552,  570,  552,  574,
			    0,  549,  542,  547,  571,    0,    0,  548,  546,  572,
			    0,    0,    0,  545,  575,  548,    0,  573,  552,  544,
			  553,  553,  547,  553,  554,  554,  574,  554,  549,    0,
			  550,  550,  550,  550,  550,  546,  555,  555,  557,  555,

			  576,  575,  548,  553,  577,  578,  579,  554,  557,  547,
			  550,  580,  581,  554,  582,  584,  550,  585,  557,  555,
			  586,  553,  588,  596,  624,  625,  555,  576,    0,    0,
			    0,  577,  578,  579,    0,  557,    0,  550,  580,  581,
			  554,  582,  584,  550,  585,  596,  626,  586,  553,  588,
			  596,  624,  625,  555,  589,  589,  589,  589,  589,  590,
			  590,  590,  590,  590,  591,  591,  591,  591,  591,  592,
			    0,  592,    0,  626,  592,  592,  592,  592,  592,  593,
			    0,  593,    0,    0,  593,  593,  593,  593,  593,  594,
			  594,  594,  594,  594,  595,  595,  595,  595,  595,  597,

			  597,  597,  597,  597,  598,  598,  598,  598,  598,  600,
			  600,  600,  600,  600,  601,  601,  601,  601,  601,  602,
			  602,  602,  602,  602,    0,    0,  594,  604,  604,  604,
			  604,  604,  605,  611,  605,  628,    0,  605,  605,  605,
			  605,  605,  604,  606,  606,    0,  606,  607,  607,  611,
			  607,  608,  608,  611,  608,    0,  609,  609,    0,  609,
			  610,  610,  628,  610,  604,    0,  606,    0,    0,  604,
			  607,  630,  612,  612,  608,  612,  611,  613,  613,  609,
			  613,  634,  607,  610,  606,  609,  637,  614,  614,    0,
			  614,  615,  615,  640,  615,  612,  616,  616,  630,  616,

			  613,  617,  617,  642,  617,  618,    0,    0,  634,  607,
			  614,  606,  609,  637,  615,  619,  619,  644,  619,  616,
			  640,  618,    0,  645,  617,  618,  620,  620,  646,  620,
			  642,  647,    0,  616,  614,    0,    0,  672,  619,  621,
			  621,  672,  621,    0,  644,  674,  619,    0,  618,  620,
			  645,  780,  780,  780,  780,  646,    0,  672,  647,  620,
			  616,  614,  621,  649,  649,  649,  649,  649,  672,    0,
			  621,    0,  674,  619,  650,  650,  650,  650,  650,  651,
			  651,  651,  651,  651,    0,    0,  620,  652,  652,  652,
			  652,  652,  653,  653,  653,  653,  653,  621,  654,    0,

			  654,    0,    0,  654,  654,  654,  654,  654,  675,    0,
			    0,  650,  657,  657,  657,  657,  657,  659,  659,  659,
			  659,  659,  660,  660,  660,  660,  660,  661,  661,  661,
			  661,  661,  659,  662,  662,  675,  662,  663,  663,  676,
			  663,  668,  664,  664,    0,  664,  666,  666,    0,  666,
			    0,  677,  667,  667,  659,  667,  662,  668,    0,  659,
			  663,  668,  662,    0,  661,  664,  676,  669,  669,  666,
			  669,  663,    0,  664,  678,  667,  670,  670,  677,  670,
			    0,  667,  671,  671,  668,  671,  681,  682,  683,  662,
			  669,  673,  684,  686,  706,  673,  707,  669,  663,  670, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  664,  678,    0,  708,  711,  671,  712,  670,  667,  699,
			  699,  673,  699,  681,  682,  683,    0,    0,    0,  684,
			  686,  706,  673,  707,  669,  687,  687,  687,  687,  687,
			  708,  711,  699,  712,  670,  689,  689,  689,  689,  689,
			  690,  690,  690,  690,  690,  691,  691,  691,  691,  691,
			  692,  692,  692,  692,  692,  693,  693,  693,  693,  693,
			    0,    0,  687,  694,  694,  694,  694,  694,  696,  696,
			  696,  696,  696,  697,  697,    0,  697,  690,  698,  698,
			    0,  698,  704,  714,  700,  700,  704,  700,  702,  702,
			    0,  702,    0,  726,  703,  703,  697,  703,    0,  705,

			  727,  698,  704,  705,  728,  696,  697,  700,  729,  730,
			  714,  702,    0,  704,    0,  700,    0,  703,    0,  705,
			  726,  698,  716,  716,  716,  716,  716,  727,    0,    0,
			  705,  728,    0,  697,    0,  729,  730,  703,  720,  720,
			  731,  720,  700,  718,  718,  718,  718,  718,  698,  719,
			    0,  719,    0,    0,  719,  719,  719,  719,  719,  716,
			    0,  720,  721,  721,  703,  721,    0,  731,  740,  720,
			  722,  722,    0,  722,  723,  723,    0,  723,  733,  733,
			  733,  733,  733,    0,  745,  721,  719,  734,  734,  752,
			  734,  735,  735,  722,  735,  740,  720,  723,  738,  736,

			  736,  753,  736,  737,  737,  738,  737,  759,  767,  721,
			  734,  745,  722,  739,  735,    0,  752,  754,  738,  754,
			  739,  723,  736,    0,    0,    0,  737,  754,  753,    0,
			  734,    0,  738,  739,  759,  767,  721,    0,    0,  722,
			  748,  748,  737,  748,    0,    0,    0,  739,  723,  746,
			  746,  746,  746,  746,  754,    0,    0,  734,  747,  747,
			  747,  747,  747,  748,  750,  749,  749,    0,  749,  737,
			  751,  750,  755,  755,    0,  755,    0,  751,  756,  756,
			    0,  756,    0,  765,  750,    0,    0,  748,  749,    0,
			  751,    0,    0,  765,    0,  755,  749,    0,  750,  764,

			  764,  756,  764,  765,  751,  761,  761,  761,  761,  761,
			    0,  755,  782,    0,  748,  766,    0,    0,    0,    0,
			  765,    0,  764,  749,    0,  766,  770,  770,  782,  770,
			  764,    0,  782,    0,    0,  766,    0,    0,  755,  768,
			  768,  768,  768,  768,  769,  769,  769,  769,  769,  770,
			  771,  772,  766,    0,    0,  782,    0,  764,    0,    0,
			  771,  772,  774,  774,  774,  774,  774,  775,    0,  775,
			  771,  772,  778,  778,  778,  778,  778,  775,  779,  779,
			  779,  779,  779,  783,    0,  786,  787,  771,  772,  784,
			  784,  784,  784,  784,  785,  785,  785,  785,  785,  783,

			    0,  786,  787,  783,  775,  786,  787,  788,  788,  788,
			  788,  788,  792,  792,  792,  792,  792,  793,  793,  793,
			  793,  793,    0,    0,    0,    0,  783,    0,  786,  787,
			  794,  794,  794,  794,  794,  796,  796,  796,  796,  796,
			  797,    0,  797,    0,    0,  797,  797,  797,  797,  797,
			  798,  798,  798,  798,  798,  799,  799,  799,  799,  799,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  797,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,

			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  805,  805,
			    0,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,

			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,    0,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  806,  806,
			    0,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,

			  808,  808,  808,    0,    0,    0,    0,    0,    0,    0,
			  808,  808,    0,  808,    0,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,    0,    0,  808,
			  808,  808,  808,  808,  808,  808,  808,  809,  809,    0,
			  809,  809,    0,  809,  809,    0,    0,    0,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			    0,    0,  809,  809,  809,  809,  809,  809,  809,  809,
			  810,  810,    0,  810,  810,  810,  810,  810,  810,  810,

			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  810,  810,  810,  810,  810,  810,  810,  810,  810,  810,
			  811,  811,    0,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,    0,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  812,  812,  812,  812,  812,  812,  812,  812,  812,  812,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			    0,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  813,  813,  813,  813,  813,  813,  813,  813,  813,  813,
			  814,    0,  814,    0,    0,    0,    0,  814,  814,    0,

			  814,  814,    0,    0,    0,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,    0,  814,  814,
			  814,  814,  814,  814,  814,  814,  814,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,

			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  816,  816,  816,
			  816,  816,  816,  816,  816,  816,  816,  817,  817,    0,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  817,
			  817,  817,  817,  817,  817,  817,  817,  818,    0,    0,
			    0,    0,  818,  818,    0,    0,    0,  818,  818,  818,

			  818,  818,  818,  818,  818,  818,  818,  818,  818,  818,
			  818,  818,  818,  818,  818,  818,  818,  818,  818,    0,
			    0,  818,  818,  818,  818,  818,  818,  818,  818,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,    0,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,

			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  821,
			    0,    0,    0,  821,  821,    0,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			    0,    0,  821,  821,  821,  821,  821,  821,  821,  821,
			  822,  822,    0,  822,  822,    0,  822,  822,  822,    0,
			    0,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,

			  822,  822,  822,    0,    0,  822,  822,  822,  822,  822,
			  822,  822,  822,  823,  823,  823,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  823,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,

			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  825,    0,  825,    0,    0,    0,    0,  825,  825,
			    0,  825,  825,    0,    0,    0,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,    0,    0,
			  825,  825,  825,  825,  825,  825,  825,  825,  826,  826,
			  826,    0,    0,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,    0,    0,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,  826,  826,  826,  826,
			  826,  826,  826,  826,  826,  826,    0,    0,  826,  826,

			  826,  826,  826,  826,  826,  826,  827,    0,  827,    0,
			    0,    0,    0,  827,  827,    0,  827,  827,    0,    0,
			    0,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,    0,  827,  827,  827,  827,  827,  827,
			  827,  827,  827,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,    0,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,

			  828,  828,  828,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800, yy_Dummy>>,
			1, 892, 4000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   86,   91,   73,   74,    0,    0,  179,
			    0,   65,   68, 1064, 4803,   95, 1058, 1034, 1039, 4803,
			   87,    0, 4803, 4803, 4803, 4803, 1024,   85, 1015,   94,
			  113, 4803, 4803,  997, 4803,  973,  940,  266,  115,  270,
			  275,  279,  285,  304,  311,  319,  349,  418,  360,  388,
			  374,  353,  282, 4803, 4803,  900,  493,  568,   80,   82,
			  305,   86,  344,   94,   84,  358,  298,   98,   88,  225,
			  936, 4803, 4803,  944,  154, 4803,  115,  364,  304,  387,
			  342,  390,  321, 4803,  379,  888, 4803,  274,  927,  494,
			  569, 4803,   75,  643, 4803,  158,  914, 4803,  907, 4803,

			  902,    0,  642,  888,  894,  879,  677, 4803,  460,  682,
			  705,  466,  725, 4803, 4803, 4803,  450,  704,    0,  715,
			  731,  746,  752,  756,  763,  770,  780,  796,  804,  823,
			  828,  841,  849,  856,  847,  865,  899,  972,  917,  907,
			  936,  932,  945,  962,  977, 1001,  870,  395,  821, 4803,
			  284,  858, 1055,  838,  320,  349,    0,  634,  380,  401,
			  391,  392,  405,  784,  420,  814,  429,  431,  453,  476,
			  818,  811,  504,  733,  777,  551,  826,  769,  549,  575,
			  666,  690,  739,  752,  781,  790,  803,  810,  838,  830,
			  896,  856,  948,  900,  902,  943,  951,  952, 4803,  811,

			 4803,  313, 4803, 4803,  982,  498,  936,  948,  959,  992,
			 4803,  997,  765, 4803,  279,  663, 1031, 4803,  807, 1049,
			  323, 1131,  495,  517, 1218, 4803, 4803,  781, 1054, 4803,
			 4803, 4803,  795, 1068,  793,  784,  777,  769, 1267,  502,
			 4803, 1255, 1078, 1085, 1206, 4803, 1261, 1216, 1282, 1221,
			 1287, 4803,  749, 1288, 1309, 1315, 1320, 1324, 1333, 1339,
			 1354, 1010, 1360, 1364, 1370, 1389, 1410, 1397, 1414, 1418,
			 1444, 1452, 1477, 1456, 1488, 1498, 1506, 1316, 1516, 1527,
			 1537, 1542, 1551, 1555, 1561, 1567, 1580, 1588, 1592,  751,
			 4803, 4803,  752,  985,    0, 1600, 1607,  995,    0, 1021,

			 1033, 1041, 1045, 1039, 1211, 1282, 1299, 1327,  676, 1332,
			  675, 1466, 1347, 1368, 1371, 1382, 1389, 1392, 1404, 1417,
			 1453,    0,    0, 1439, 1455, 1475, 1508, 1507, 1517, 1536,
			 1546, 1542, 1544,  658, 1562, 1564,  650,    0,    0, 1560,
			 1563, 1582,  359, 1589,  575, 1592, 1617, 1625, 4803,  668,
			 1642, 4803,  664, 1282,  656, 1649, 4803, 4803, 1640, 4803,
			 4803, 4803, 4803, 4803, 1659, 1664, 1669, 1683, 1691, 1707,
			 1717, 1723, 1728, 1733, 1750, 1738, 1755,  622, 1776, 1780,
			 1691, 1784, 1788, 1792, 1797, 1770, 1809, 1834, 1826, 1839,
			 1844, 1865, 1871, 1865, 1853, 1924, 1901, 1947, 1935, 1969,

			 1975, 1926, 1975, 1810, 1980, 2007, 2011, 2015, 2020,  748,
			    0, 1593, 1595, 1698, 1744,    0, 1746, 1782,    0, 1809,
			 1817, 1833, 1842, 1844, 1863, 1864, 1872, 1873, 1877, 1888,
			 1908, 1936, 1941, 1938, 1949, 1956, 1959,    0,    0,    0,
			    0, 1958, 1983, 2008, 1975, 1992,  580,  570, 2039, 2047,
			 2057, 2064,  570, 2070, 2075, 2086, 2091, 2096, 2101,  503,
			 2113, 2134, 2113,  396, 2135, 2140, 2156, 2164, 2169, 2173,
			  497, 2180, 2197, 2209, 2214, 2218, 2223, 2228, 2249, 2239,
			 2277, 2282, 2227, 2257, 2308, 2320, 2324, 2286,  903, 1019,
			 1391,  455,  447, 2007, 2061, 2125, 2147, 2136, 2203,    0,

			 2140,    0, 2194, 2214, 2213,    0, 2217, 2220, 2222, 2247,
			 2256, 2248, 2272, 2269, 2286, 2295, 2297, 2288, 2295, 2305,
			 2307, 2356, 2361, 2366, 2337, 2380, 2386, 2399, 2404, 2409,
			 2414, 2424, 2434, 2439, 1312, 4803, 2447, 2468, 2473, 2479,
			 2483, 2489, 2498, 2366, 2508, 2513, 2523, 2538, 2542, 2529,
			 2572,  466, 2553, 2578, 2582, 2594, 2471, 2570,  300, 4803,
			 4803, 2337, 2382, 2383, 2417, 2423,    0, 2430, 2440,    0,
			 2493, 2493, 2509, 2505, 2515, 2541, 2555, 2560, 2561, 2573,
			 2579, 2579, 2582,    0, 2572, 2586, 2588,    0, 2579, 2636,
			 2641, 2646, 2656, 2666, 2671, 2676, 2590, 2681, 2686,  442,

			 2691, 2696, 2701, 4803, 2709, 2719, 2741, 2745, 2749, 2754,
			 2758, 2705, 2770, 2775, 2785, 2789, 2794, 2799, 2777, 2813,
			 2824, 2837,  411,  396, 2581, 2588, 2609,    0, 2704,    0,
			 2740,    0,    0,    0, 2732,    0,    0, 2737,    0,    0,
			 2754,    0, 2764,    0, 2784, 2788, 2795, 2798,  343, 2845,
			 2856, 2861, 2869, 2874, 2885,  230,  557, 2894, 2339, 2899,
			 2904, 2909, 2931, 2935, 2940, 4803, 2944, 2950, 2913, 2965,
			 2974, 2980, 2809, 2963, 2814, 2872, 2903, 2918, 2941,    0,
			    0, 2955, 2956, 2956, 2959,    0, 2961, 3007,  228, 3017,
			 3022, 3027, 3032, 3037, 3045, 4803, 3050, 3071, 3076, 3007,

			 3082, 4803, 3086, 3092, 3054, 3071, 2959, 2951, 2958,    0,
			    0, 2971, 2973,    0, 3038,    0, 3104,  225, 3125, 3136,
			 3136, 3160, 3168, 3172,  359, 4803, 3060, 3051, 3055, 3064,
			 3065, 3091,  147, 3160, 3185, 3189, 3197, 3201, 3170, 3185,
			 3123,    0,    0,    0,    0, 3143, 3231, 3240, 3238, 3263,
			 3236, 3242, 3140, 3168, 3204, 3270, 3276,  138,  122, 3166,
			    0, 3287, 1702, 4803, 3297, 3255, 3287, 3175, 3321, 3326,
			 3324, 3322, 3323,    0, 3344, 3354,  118,   88, 3354, 3360,
			 2833, 4803, 3284, 3355, 3371, 3376, 3357, 3358, 3389, 2346,
			 4803, 4803, 3394, 3399, 3412, 4803, 3417, 3427, 3432, 3437,

			 4803, 3477, 3527, 3577, 3627, 3677, 3727, 3761, 3798, 3841,
			 3889, 3939, 3989, 4039, 4088, 4136, 4186, 4236, 4280, 4328,
			 4378, 4421, 4464, 4511, 4560, 4609, 4657, 4704, 4752, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  800,    1,  801,  801,  802,  802,  803,  803,  800,
			    9,  804,  804,  800,  800,  800,  800,  800,  805,  800,
			  806,  807,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  809,  800,  800,  810,  800,  800,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			  800,  800,  800,  811,  800,  800,  800,  811,  811,  811,
			  811,  811,  812,  800,  812,  813,  800,  814,  800,  814,
			  814,  800,  815,  816,  800,  800,  800,  800,  805,  800,

			  817,  817,  817,  818,  819,  800,  800,  800,  800,  820,
			  800,  800,  800,  800,  800,  800,  800,  808,  821,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,   47,  808,  808,  808,  808,   47,
			  808,  808,  808,  808,  808,  808,  822,  809,  810,  800,
			  800,  800,   57,  800,  152,  152,   57,   57,   57,   57,
			  152,   57,  152,  152,   57,   57,  152,  152,   57,   57,
			  152,   57,  152,  152,  152,   57,   57,   57,  152,   57,
			  152,   57,  152,  152,   57,   57,  152,  152,   57,   57,
			  152,  152,   57,   57,  152,   57,  152,   57,  800,  811,

			  800,  800,  800,  800,  811,  811,  811,  811,  811,  812,
			  800,  812,  813,  800,  813,  814,  814,  800,  800,  800,
			  800,  800,  800,  815,  816,  800,  800,  224,  823,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  821,  808,  808,  808,  808,  808,  808,  808,
			  808,  800,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  137,  137,  137,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  800,
			  800,  800,  800,  152,  152,  800,  152,   57,   57,  152,

			   57,  152,  152,  152,   57,   57,   57,  152,  152,   57,
			   57,  800,  152,  152,  152,  152,   57,   57,   57,  152,
			   57,  152,   57,  152,  152,   57,   57,  152,  152,   57,
			   57,  152,  152,  152,   57,   57,   57,  152,   57,  152,
			   57,  811,  811,  811,  811,  811,  811,  811,  800,  824,
			  824,  800,  824,  824,  824,  823,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  821,  808,  808,
			  808,  808,  808,  808,  808,  800,  808,  808,  808,  808,
			  808,  808,  808,  137,  137,  393,  393,  808,  134,  397,

			  397,  808,  808,  800,  808,  808,  808,  808,  808,  825,
			  826,  152,   57,  152,   57,  152,  152,  152,   57,   57,
			   57,  152,  152,   57,  152,  152,  152,  152,   57,   57,
			   57,  152,   57,  152,  152,   57,   57,  152,  152,   57,
			   57,  152,  152,  152,   57,   57,  152,   57,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  820,  800,  800,  800,  808,  808,  808,  808,  808,  808,
			  800,  808,  808,  808,  808,  808,  808,  808,  397,  808,
			  397,  480,  800,  808,  808,  808,  808,  800,  800,  827,
			  825,  152,   57,  152,   57,  152,  152,   57,   57,  152,

			  152,   57,  152,  152,  152,  152,   57,   57,   57,  152,
			   57,  152,  152,   57,   57,  152,  152,  152,  152,   57,
			   57,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  828,  808,  808,  808,
			  808,  808,  808,  800,  808,  808,  808,  808,  808,  808,
			  480,  800,  808,  808,  808,  808,  800,  800,  827,  800,
			  800,  152,  152,   57,  152,  152,  152,   57,   57,   57,
			  152,  152,  152,  152,   57,   57,   57,  152,   57,  152,
			  152,   57,   57,  152,  152,  152,  152,   57,   57,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  808,  808,  808,  808,
			  808,  800,  808,  808,  808,  808,  808,  808,  800,  808,
			  808,  808,  800,  800,  152,  152,   57,  152,  152,   57,
			   57,  152,  152,  152,  152,   57,   57,   57,  152,   57,
			  152,  152,   57,   57,  152,  152,  152,   57,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  808,  808,  808,  800,  808,  808,  800,  808,
			  808,  808,  800,  800,  152,  152,   57,  152,   57,  152,
			   57,  152,   57,  152,  152,  152,   57,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  808,  808,  808,

			  808,  800,  808,  808,  800,  800,  152,  152,   57,  152,
			   57,  152,   57,  152,  152,   57,  800,  800,  800,  800,
			  808,  808,  808,  808,  800,  800,  152,  152,   57,  152,
			   57,  152,  800,  800,  808,  808,  808,  808,  800,  800,
			  152,  152,   57,  152,   57,  152,  800,  800,  808,  808,
			  800,  800,  152,  152,  800,  808,  808,  800,  800,  152,
			  152,  800,  800,  800,  808,  800,  800,  152,  800,  800,
			  808,  800,  800,  152,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,

			    0,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800, yy_Dummy>>)
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
			    0,    0,    0,  128,  126,    1,    2,   15,  110,   18,
			  126,   16,   17,    7,    6,   13,    5,   11,    8,  101,
			  101,   14,   12,   29,   10,   30,   20,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   79,   93,   93,
			   93,   93,   22,   31,   23,    9,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   24,   21,   25,  114,  115,  116,  117,  114,  114,  114,
			  114,  114,  127,   99,  127,  127,  127,  127,   67,  127,
			  127,   69,  127,  127,   92,    1,    2,   28,  110,  109,

			  124,  124,  124,    0,    3,   33,  105,   32,    0,    0,
			  101,    0,  101,   27,   26,   19,    0,   93,   88,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   40,   93,   87,   87,   78,   87,   87,
			   93,   93,   93,   93,   93,   93,    0,    0,    0,  100,
			    0,    0,   96,    0,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   40,   96,   40,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   97,  114,

			  116,  115,  112,  111,  113,  114,  114,  114,  114,    0,
			   99,    0,    0,   98,    0,    0,    0,   69,   67,    0,
			   66,    0,   65,    0,    0,   92,   90,   90,    0,   91,
			  124,  118,  124,  124,  124,  124,  124,  124,    0,    4,
			   34,  105,    0,    0,    0,  103,  105,  103,  101,    0,
			    0,   88,    0,   93,   39,   93,   93,   93,   93,   93,
			   93,    0,   93,   93,   93,   93,   93,   42,   93,   93,
			   79,   80,   79,   80,   79,   79,   86,   93,   86,   86,
			   86,   93,   93,   93,   93,   93,   93,   41,   93,    0,
			   63,   95,    0,   96,   39,   70,   70,   96,   39,   96,

			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,    0,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   42,   42,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   41,   41,   96,
			   96,  114,  114,  114,  114,  114,  114,  114,   98,    0,
			    0,   68,   66,   65,   69,    0,  122,  125,  125,  123,
			  119,  120,  121,   89,  105,    0,  105,    0,    0,  105,
			    0,    0,    0,  104,  101,    0,    0,   94,   93,   93,
			   38,   93,   93,   93,   93,    0,   93,   93,   93,   93,
			   93,   93,   93,   93,   78,   93,   93,   93,   93,   78,

			   78,   78,   37,    0,   44,   93,   93,   93,   93,   64,
			   60,   96,   96,   96,   96,   38,   96,   96,   38,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   37,   44,   37,
			   44,   96,   96,   96,   96,   96,   96,   96,  105,  105,
			    0,    0,  102,  105,    0,  104,    0,  104,    0,    0,
			    0,  101,   75,    0,   93,   93,   93,   93,   45,   93,
			    0,   93,   93,   93,   36,   93,   93,   93,   80,   79,
			   93,   93,    0,   93,   93,   93,   93,    0,   64,   64,
			    0,   96,   96,   96,   96,   96,   96,   96,   96,   45,

			   96,   45,   96,   96,   96,   36,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,    0,  105,    0,  108,  105,  104,    0,    0,  104,
			    0,    0,  103,    0,    0,   75,    0,   93,   93,   93,
			   93,   47,   93,    0,   93,   93,   93,   93,   93,   93,
			   93,    0,   53,   93,   93,   93,    0,    0,    0,   62,
			   61,   96,   96,   96,   96,   96,   47,   96,   96,   47,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   53,   96,   96,   96,   53,   96,    0,
			  105,    0,    0,    0,  104,    0,  108,  104,    0,   77,

			    0,    0,    0,  106,  108,  106,   93,   93,   59,   93,
			   46,    0,   43,   58,   93,   35,   93,   51,    0,   93,
			   93,   93,    0,    0,   96,   96,   96,   59,   96,   59,
			   96,   46,   43,   58,   96,   43,   58,   96,   35,   35,
			   96,   51,   96,   51,   96,   96,   96,   96,  108,    0,
			  108,    0,  104,    0,    0,  107,    0,    0,   74,  108,
			    0,  107,   93,   93,   93,   83,   54,   93,    0,   93,
			   93,   55,    0,    0,   96,   96,   96,   96,   96,   54,
			   54,   96,   96,   96,   96,   55,   96,  108,  107,    0,
			  107,    0,    0,    0,    0,   74,  107,   93,   93,   48,

			   93,   82,   52,   93,    0,    0,   96,   96,   96,   48,
			   48,   96,   96,   52,   96,   52,  107,   76,    0,   74,
			   93,   93,   93,   93,   81,   81,   96,   96,   96,   96,
			   96,   96,    0,    0,   93,   50,   49,   93,    0,    0,
			   96,   50,   50,   49,   49,   96,    0,    0,   93,   93,
			    0,    0,   96,   96,   73,   93,   56,    0,    0,   96,
			   56,    0,    0,   73,   93,    0,    0,   96,    0,    0,
			   57,    0,    0,   57,    0,   72,    0,    0,    0,    0,
			    0,   72,    0,    0,    0,    0,    0,    0,    0,   71,
			   84,   85,    0,    0,    0,   71,    0,   71,    0,    0,

			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4803
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

	yyNb_rules: INTEGER is 127
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 128
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
