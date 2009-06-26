note
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
if yy_act <= 65 then
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
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
--|#line 84 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 84")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
in_lineno := in_lineno + 1
else
--|#line 89 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 89")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Plus_code
else
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Slash_code
else
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Equal_code
else
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Semicolon_code
else
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Colon_code
else
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Left_parenthesis_code
else
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
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
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := Dollar_code
else
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 20 then
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := Question_mark_code
else
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := SYM_INTERVAL_DELIM
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := Left_bracket_code
else
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := Right_bracket_code
end
else
if yy_act = 24 then
--|#line 112 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 112")
end
last_token := SYM_START_CBLOCK
else
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_END_CBLOCK
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 115 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 115")
end
last_token := SYM_GE
else
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := SYM_LE
end
else
if yy_act = 28 then
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_NE
else
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_LT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 120 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 120")
end
last_token := SYM_GT
else
--|#line 122 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 122")
end
last_token := SYM_MODULO
end
else
if yy_act = 32 then
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_DIV
else
--|#line 125 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 125")
end
last_token := SYM_ELLIPSIS
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
last_token := SYM_LIST_CONTINUE
else
--|#line 130 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 130")
end
last_token := SYM_MATCHES
end
else
if yy_act = 36 then
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_MATCHES
else
--|#line 136 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 136")
end
last_token := SYM_THEN
end
end
else
if yy_act <= 39 then
if yy_act = 38 then
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_ELSE
else
--|#line 140 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 140")
end
last_token := SYM_AND
end
else
if yy_act = 40 then
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_OR
else
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_XOR
end
end
end
else
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_NOT
else
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 44 then
--|#line 150 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 150")
end
last_token := SYM_TRUE
else
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_FALSE
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
end
last_token := SYM_FORALL
else
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_EXISTS
end
else
if yy_act = 48 then
--|#line 160 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 160")
end
last_token := SYM_EXISTENCE
else
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_OCCURRENCES
end
end
end
end
else
if yy_act <= 57 then
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 164 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 164")
end
last_token := SYM_CARDINALITY
else
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_ORDERED
end
else
if yy_act = 52 then
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_UNORDERED
else
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_UNIQUE
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_INFINITY
else
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_USE_NODE
end
else
if yy_act = 56 then
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_ALLOW_ARCHETYPE
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
if yy_act <= 61 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end
last_token := SYM_INCLUDE
else
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 60 then
--|#line 184 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 184")
end
last_token := SYM_AFTER
else
--|#line 186 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 186")
end
last_token := SYM_BEFORE
end
end
else
if yy_act <= 63 then
if yy_act = 62 then
--|#line 189 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 189")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 195 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 195")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 64 then
--|#line 200 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 200")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 206 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 206")
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
if yy_act <= 97 then
if yy_act <= 81 then
if yy_act <= 73 then
if yy_act <= 69 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 222 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 222")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 230 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 230")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
else
if yy_act = 68 then
--|#line 237 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 237")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 244 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 244")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 71 then
if yy_act = 70 then
--|#line 247 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 247")
end
in_lineno := in_lineno + 1
else
--|#line 249 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 249")
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
if yy_act = 72 then
--|#line 270 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 270")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 277 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 277")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 77 then
if yy_act <= 75 then
if yy_act = 74 then
--|#line 278 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 278")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 279 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 279")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 76 then
--|#line 286 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 286")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 287 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 287")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 79 then
if yy_act = 78 then
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 295 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 295")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 80 then
--|#line 302 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 302")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 303 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 303")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 89 then
if yy_act <= 85 then
if yy_act <= 83 then
if yy_act = 82 then
--|#line 310 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 310")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 322 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 322")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 84 then
--|#line 332 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 332")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 337 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 337")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 87 then
if yy_act = 86 then
--|#line 347 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 347")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 353 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 353")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 88 then
--|#line 363 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 363")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 364 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 364")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
else
if yy_act <= 93 then
if yy_act <= 91 then
if yy_act = 90 then
--|#line 378 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 378")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 384 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 384")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 92 then
--|#line 390 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 390")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 394 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 394")
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
 			
end
end
else
if yy_act <= 95 then
if yy_act = 94 then
--|#line 435 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 435")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 441 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 441")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 96 then
--|#line 447 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 447")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 453 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 453")
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
if yy_act <= 113 then
if yy_act <= 105 then
if yy_act <= 101 then
if yy_act <= 99 then
if yy_act = 98 then
--|#line 460 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 460")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 466 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 466")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 100 then
--|#line 473 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 473")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 477 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 477")
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
if yy_act <= 103 then
if yy_act = 102 then
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 104 then
--|#line 500 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 500")
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
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 109 then
if yy_act <= 107 then
if yy_act = 106 then
--|#line 516 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 516")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 517 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 517")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 108 then
	yy_end := yy_end - 1
--|#line 521 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 521")
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
--|#line 522 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 522")
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
if yy_act <= 111 then
if yy_act = 110 then
--|#line 523 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 523")
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
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 112 then
--|#line 548 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 548")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 556 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 556")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 121 then
if yy_act <= 117 then
if yy_act <= 115 then
if yy_act = 114 then
--|#line 558 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 558")
end
in_buffer.append_character ('"')
else
--|#line 560 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 560")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 116 then
--|#line 564 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 564")
end
in_buffer.append_string (text)
else
--|#line 566 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 566")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 119 then
if yy_act = 118 then
--|#line 571 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 571")
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
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 120 then
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 593 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 593")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 125 then
if yy_act <= 123 then
if yy_act = 122 then
--|#line 594 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 594")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 595 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 595")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 124 then
--|#line 596 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 596")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 597 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 597")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 127 then
if yy_act = 126 then
--|#line 599 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 599")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 600 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 600")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 128 then
--|#line 604 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 604")
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
			create an_array.make (0, 5275)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   29,
			   30,   30,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   40,   41,   42,   40,   43,   44,   40,   45,
			   46,   47,   48,   40,   40,   40,   49,   50,   40,   51,
			   52,   40,   53,   54,   55,   56,   14,   57,   58,   59,
			   60,   61,   62,   60,   63,   64,   60,   65,   66,   67,
			   60,   60,   60,   60,   68,   69,   60,   70,   71,   72,
			   73,   74,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   76,   85,   85,   95,   77,   76,   95,  103,   97,

			   77,   97,   97,  107,  232,  108,  108,  108,  108,  108,
			  110,  156,  111,  210,  112,  112,  112,  112,  112,  110,
			  817,  111,  816,  114,  114,  114,  114,  114,   86,   86,
			  118,  118,  168,  118,  156,  156,  156,  178,  303,  161,
			  186,   78,  104,  188,  156,  304,   78,  209,   96,  209,
			  209,   96,  113,  120,  780,  780,   87,   87,  233,  211,
			  169,  113,  161,  161,  161,  179,  303,   97,  187,   97,
			   97,  189,  161,  304,   79,   80,   81,   82,   83,   79,
			   80,   81,   82,   83,   88,   89,   90,   88,   89,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   91,   92,

			   88,   92,   92,   92,   92,   92,   88,   88,   88,   88,
			   88,   88,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   88,   88,   93,   88,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,  118,  118,  174,  118,  118,  118,
			  156,  118,  208,  362,  118,  118,  305,  118,  175,  223,
			  118,  118,  223,  118,  800,  118,  118,  120,  118,  118,

			  118,  120,  118,  799,  176,  766,  121,  120,  161,  124,
			  122,  125,  123,  120,  305,  208,  177,  128,  120,  222,
			  118,  118,  120,  118,  154,  118,  118,  154,  118,  129,
			  232,  126,  155,  130,  121,  218,  208,  124,  122,  125,
			  123,  225,  127,  120,  208,  128,  156,  134,  120,  118,
			  118,  834,  118,  118,  118,  156,  118,  129,  194,  126,
			  213,  130,  131,  132,  118,  118,  195,  118,  133,  156,
			  127,  219,  120,  557,  161,  134,  120,  202,  118,  118,
			  480,  118,  136,  161,  233,  472,  196,  120,  135,  707,
			  131,  132,  215,  215,  197,  137,  133,  161,  144,  220,

			  311,  120,  313,  591,  228,  203,  145,  228,  118,  118,
			  136,  118,  118,  118,  213,  118,  135,  148,  706,  690,
			  212,  212,  212,  137,  118,  118,  144,  118,  311,  208,
			  313,  120,  150,  150,  145,  120,  208,  150,  150,  221,
			  138,  138,  138,  138,  138,  148,  146,  120,  156,  315,
			  652,  147,  593,  170,  139,  156,  190,  321,  156,  156,
			  149,  140,  198,  156,  171,  180,  181,  199,  141,  191,
			  142,  182,  143,  574,  146,  219,  161,  315,  150,  147,
			  204,  172,  139,  161,  192,  321,  161,  161,  149,  140,
			  200,  161,  173,  183,  184,  201,  561,  193,  142,  185,

			  143,  154,  110,  220,  154,  214,  214,  214,  205,  155,
			  513,  208,  216,  216,  216,  391,  365,  156,  156,  156,
			  156,  156,  157,  252,  252,  252,  252,  252,  156,  156,
			  156,  156,  156,  158,  156,  156,  156,  159,  156,  160,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  209,  322,  209,  209,  156,  161,  161,  162,  161,
			  161,  163,  161,  161,  161,  164,  161,  165,  161,  161,
			  161,  161,  161,  162,  161,  161,  161,  161,  154,  227,
			  322,  154,  227,  725,  725,  725,  155,  212,  212,  212,
			  230,  228,  229,  230,  156,  156,  156,  156,  156,  157,

			  514,  230,  326,  515,  365,  156,  156,  156,  156,  166,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  305,  156,
			  326,  225,  156,  161,  161,  161,  161,  167,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  227,  310,  161,  227,  240,
			  465,  249,  249,  249,  249,  249,  444,  228,  241,  241,
			  241,  241,  241,  150,  150,  428,  250,  230,  254,  254,
			  254,  254,  254,  110,  333,  111,  299,  256,  256,  256,
			  256,  256,  257,  255,  258,  258,  258,  258,  258,  251,

			  156,  156,  335,  242,  250,  427,  304,  225,  235,  235,
			  391,  235,  333,  247,  376,  247,  247,  300,  243,  375,
			  772,  255,  244,  329,  245,  113,  374,  373,  161,  161,
			  335,  370,  834,  236,  309,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  110,  325,
			  111,  773,  256,  256,  256,  256,  256,  118,  118,  156,
			  118,  118,  118,  337,  118,  118,  118,  226,  118,  118,
			  118,  222,  118,  118,  118,  208,  118,  237,  118,  118,
			  259,  118,  329,  566,  120,  156,  514,  161,  120,  514,

			  113,  337,  120,  271,  118,  118,  120,  118,  303,  118,
			  118,  120,  118,  263,  302,  262,  301,  338,  153,  261,
			  264,  118,  118,  161,  118,  156,  311,  120,  118,  118,
			  299,  118,  120,  113,  118,  118,  308,  118,  248,  118,
			  118,  263,  118,  262,  120,  338,  265,  261,  264,  341,
			  267,  120,  266,  161,  312,  208,  268,  120,  118,  118,
			  271,  118,  120,  342,  269,  118,  118,  156,  118,  247,
			  118,  118,  246,  118,  265,  239,  270,  341,  267,  315,
			  266,  120,  118,  118,  268,  118,  118,  118,  120,  118,
			  101,  342,  269,  120,  273,  161,   98,  274,  272,  223,

			  118,  118,  223,  118,  270,  120,  226,  318,  156,  120,
			  222,  278,  118,  118,  208,  118,  280,  206,  280,  313,
			  153,  316,  273,  120,  275,  274,  272,  317,  117,  116,
			  276,  341,  215,  215,  281,  120,  161,  115,  282,  278,
			  156,  283,  279,  347,  277,  321,  156,  314,  119,  316,
			  284,  225,  285,  118,  118,  317,  118,  322,  276,  343,
			  118,  118,  281,  118,  118,  118,  282,  118,  161,  283,
			  279,  347,  277,  323,  161,  109,  120,  337,  284,  156,
			  285,  366,  365,  120,  366,  324,  106,  120,  118,  118,
			  139,  118,  327,  347,  139,  328,  351,  286,  101,  119, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  119,  119,  119,  119,  286,  339,  142,  161,  286,  118,
			  118,  120,  118,  353,  118,  118,  156,  118,  139,  429,
			  327,  350,  139,  328,  351,  118,  118,  286,  118,  333,
			   99,  119,  120,  293,  142,  118,  118,  120,  118,  430,
			  291,  353,  345,  292,  161,  296,  346,  429,  120,  208,
			   98,  287,  287,  287,  287,  287,  834,  334,  120,  119,
			  294,  293,  118,  118,  295,  118,  156,  430,  291,  288,
			  345,  292,  289,  296,  346,  326,  118,  118,  290,  118,
			  367,  365,  208,  367,  316,  120,  156,  834,  294,  156,
			  317,  834,  295,  429,  161,  208,  208,  288,  834,  120,

			  289,  834,  335,  330,  297,  306,  290,  307,  307,  307,
			  307,  307,  319,  327,  161,  156,  328,  161,  320,  338,
			  156,  431,  156,  156,  298,  212,  212,  212,  156,  156,
			  336,  834,  297,  156,  156,  834,  433,  342,  345,  351,
			  435,  331,  346,  161,  332,  218,  353,  340,  161,  221,
			  161,  161,  298,  834,  435,  156,  161,  161,  360,  360,
			  360,  161,  161,  156,  433,  344,  348,  352,  435,  834,
			  349,  361,  361,  361,  354,  355,  356,  357,  358,  359,
			  834,  219,  436,  161,  834,  219,  834,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,

			  156,  156,  156,  156,  156,  156,  156,  156,  156,  220,
			  834,  227,  227,  220,  227,  227,  369,  369,  834,  369,
			  834,  834,  834,  228,  228,  371,  372,  372,  372,  372,
			  372,  834,  834,  230,  230,  246,  246,  379,  246,  379,
			  834,  236,  380,  380,  380,  380,  380,  381,  381,  381,
			  381,  381,  382,  382,  382,  382,  382,  834,  377,  389,
			  389,  389,  389,  225,  225,  363,  364,  365,  363,  364,
			  363,  363,  363,  363,  363,  363,  363,  363,  366,  229,
			  229,  363,  229,  229,  229,  229,  229,  363,  367,  363,
			  363,  363,  363,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  363,  363,  368,  363,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  235,  235,  386,  235,  386,
			  834,  834,  387,  387,  387,  387,  387,  834,  110,  834,
			  111,  834,  388,  388,  388,  388,  388,  834,  834,  834,
			  236,  834,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,

			  237,  237,  237,  237,  237,  378,  378,  378,  378,  378,
			  113,  383,  383,  383,  383,  383,  118,  118,  437,  118,
			  250,  390,  390,  390,  390,  390,  384,  118,  118,  834,
			  118,  834,  118,  118,  237,  118,  834,  118,  118,  120,
			  118,  118,  118,  251,  118,  156,  437,  392,  250,  385,
			  120,  834,  834,  430,  384,  120,  118,  118,  834,  118,
			  120,  834,  118,  118,  120,  118,  393,  118,  118,  438,
			  118,  395,  834,  161,  439,  392,  394,  118,  118,  120,
			  118,  432,  401,  118,  118,  120,  118,  396,  118,  118,
			  120,  118,  514,  401,  393,  515,  834,  438,  397,  395,

			  120,  437,  439,  401,  394,  443,  120,  156,  834,  834,
			  398,  120,  834,  118,  118,  396,  118,  834,  446,  439,
			  399,  401,  118,  118,  402,  118,  397,  118,  118,  440,
			  118,  118,  118,  443,  118,  161,  120,  400,  398,  834,
			  118,  118,  834,  118,  591,  120,  446,  442,  399,  403,
			  120,  834,  402,  834,  120,  118,  118,  404,  118,  834,
			  406,  156,  405,  120,  118,  118,  834,  118,  409,  409,
			  409,  409,  409,  118,  118,  447,  118,  403,  120,  119,
			  119,  119,  119,  119,  444,  404,  834,  120,  406,  161,
			  405,  118,  118,  834,  118,  408,  120,  448,  834,  834,

			  407,  118,  118,  447,  118,  834,  834,  410,  410,  410,
			  410,  410,  449,  453,  120,  834,  834,  412,  412,  412,
			  412,  412,  156,  408,  120,  448,  118,  118,  407,  118,
			  119,  119,  119,  119,  119,  411,  118,  118,  834,  118,
			  449,  453,  413,  413,  413,  413,  413,  156,  119,  120,
			  161,  448,  414,  414,  414,  414,  414,  834,  306,  120,
			  306,  306,  306,  306,  306,  118,  118,  416,  118,  416,
			  411,  118,  118,  834,  118,  161,  119,  455,  456,  452,
			  411,  415,  415,  415,  415,  415,  834,  834,  120,  417,
			  118,  118,  418,  118,  120,  834,  118,  118,  419,  118,

			  118,  118,  834,  118,  834,  455,  456,  118,  118,  411,
			  118,  834,  834,  120,  290,  118,  118,  417,  118,  120,
			  418,  421,  834,  120,  834,  834,  419,  422,  420,  834,
			  120,  118,  118,  156,  118,  834,  118,  118,  120,  118,
			  118,  118,  290,  118,  834,  443,  456,  306,  423,  307,
			  307,  307,  307,  307,  120,  422,  420,  424,  156,  120,
			  834,  161,  208,  120,  156,  156,  433,  302,  156,  438,
			  446,  834,  156,  445,  458,  459,  423,  447,  401,  453,
			  460,  156,  455,  460,  156,  424,  161,  463,  426,  401,
			  425,  459,  161,  161,  434,  464,  161,  441,  450,  401,

			  161,  156,  156,  459,  156,  451,  156,  454,  460,  161,
			  457,  462,  161,  464,  463,  463,  426,  401,  468,  461,
			  156,  208,  834,  464,  465,  208,  517,  518,  208,  161,
			  161,  208,  161,  834,  161,  521,  523,  468,  212,  212,
			  212,  467,  466,  834,  364,  365,  468,  364,  161,  369,
			  369,  834,  369,  834,  517,  518,  366,  371,  372,  372,
			  372,  372,  372,  521,  523,  469,  367,  380,  380,  380,
			  380,  380,  156,  834,  834,  470,  470,  470,  470,  470,
			  834,  471,  471,  471,  471,  471,  834,  518,  525,  526,
			  250,  473,  473,  473,  473,  473,  368,  214,  214,  214,

			  161,  216,  216,  216,  212,  212,  212,  212,  212,  212,
			  834,  118,  118,  251,  118,  520,  525,  526,  250,  472,
			  474,  474,  474,  474,  474,  475,  475,  475,  475,  475,
			  476,  834,  476,  834,  120,  477,  477,  477,  477,  477,
			  384,  478,  478,  478,  478,  478,  387,  387,  387,  387,
			  387,  479,  479,  479,  479,  479,  484,  484,  484,  484,
			  484,  118,  118,  385,  118,  156,  481,  482,  384,  483,
			  483,  483,  483,  483,  485,  485,  485,  485,  485,  118,
			  118,  834,  118,  834,  120,  118,  118,  156,  118,  480,
			  834,  118,  118,  161,  118,  118,  118,  834,  118,  834, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  526,  834,  120,  486,  834,  834,  118,  118,  120,  118,
			  118,  118,  834,  118,  120,  161,  118,  118,  120,  118,
			  834,  494,  834,  529,  834,  487,  489,  488,  528,  120,
			  834,  486,  494,  120,  834,  118,  118,  156,  118,  120,
			  490,  492,  494,  493,  118,  118,  530,  118,  517,  529,
			  491,  529,  156,  487,  489,  488,  118,  118,  120,  118,
			  494,  118,  118,  521,  118,  161,  834,  120,  490,  492,
			  495,  493,  118,  118,  530,  118,  519,  531,  491,  120,
			  161,  532,  118,  118,  120,  118,  508,  118,  118,  496,
			  118,  522,  533,  834,  497,  120,  834,  508,  495,  498,

			  412,  412,  412,  412,  412,  120,  499,  508,  534,  532,
			  120,  409,  409,  409,  409,  409,  834,  496,  119,  535,
			  533,  156,  497,  119,  500,  508,  119,  498,  539,  501,
			  118,  118,  119,  118,  499,  525,  534,  280,  502,  280,
			  834,  410,  410,  410,  410,  410,  119,  535,  834,  161,
			  834,  119,  500,  120,  119,  834,  539,  501,  156,  282,
			  119,  539,  503,  527,  834,  834,  502,  834,  119,  413,
			  413,  413,  413,  413,  834,  118,  118,  834,  118,  834,
			  590,  834,  834,  281,  834,  834,  161,  282,  834,  540,
			  503,  414,  414,  414,  414,  414,  119,  834,  120,  284,

			  415,  415,  415,  415,  415,  504,  505,  505,  505,  505,
			  505,  281,  506,  506,  506,  506,  506,  507,  507,  507,
			  507,  507,  118,  118,  834,  118,  119,  284,  541,  592,
			  834,  119,  119,  504,  118,  118,  156,  118,  118,  118,
			  523,  118,  834,  118,  118,  120,  118,  118,  118,  156,
			  118,  542,  118,  118,  119,  118,  541,  120,  156,  119,
			  119,  120,  532,  533,  161,  513,  120,  156,  524,  156,
			  120,  156,  156,  510,  511,  120,  534,  161,  541,  542,
			  156,  545,  542,  509,  546,  512,  161,  547,  156,  156,
			  536,  537,  546,  156,  834,  161,  513,  161,  548,  161,

			  161,  510,  511,  545,  538,  834,  543,  583,  161,  545,
			  544,  509,  546,  512,  156,  547,  161,  161,  583,  834,
			  550,  161,  118,  118,  834,  118,  548,  834,  583,  834,
			  834,  549,  470,  470,  470,  470,  470,  553,  553,  553,
			  553,  553,  161,  834,  834,  120,  583,  551,  552,  552,
			  552,  552,  552,  554,  554,  554,  554,  554,  555,  555,
			  555,  555,  555,  477,  477,  477,  477,  477,  556,  556,
			  556,  556,  556,  384,  834,  551,  558,  558,  558,  558,
			  558,  559,  559,  559,  559,  559,  472,  560,  560,  560,
			  560,  560,  563,  594,  563,  834,  385,  118,  118,  594,

			  118,  384,  564,  596,  834,  834,  557,  555,  555,  555,
			  555,  555,  482,  834,  483,  483,  483,  483,  483,  480,
			  120,  594,  562,  118,  118,  156,  118,  595,  598,  834,
			  565,  596,  118,  118,  834,  118,  118,  118,  834,  118,
			  118,  118,  834,  118,  118,  118,  120,  118,  593,  604,
			  562,  567,  834,  161,  568,  120,  598,  118,  118,  120,
			  118,  118,  118,  120,  118,  834,  570,  120,  598,  156,
			  569,  571,  118,  118,  834,  118,  834,  604,  118,  118,
			  120,  118,  568,  572,  120,  118,  118,  834,  118,  834,
			  834,  156,  575,  573,  570,  120,  601,  161,  569,  571,

			  834,  120,  576,  118,  118,  605,  118,  834,  120,  118,
			  118,  572,  118,  577,  118,  118,  599,  118,  588,  161,
			  575,  573,  636,  636,  636,  636,  120,  834,  600,  588,
			  576,  606,  120,  605,  578,  118,  118,  120,  118,  589,
			  834,  577,  834,  834,  599,  580,  581,  581,  581,  581,
			  581,  579,  118,  118,  834,  118,  600,  588,  120,  606,
			  119,  834,  578,  505,  505,  505,  505,  505,  507,  507,
			  507,  507,  507,  580,  834,  120,  416,  586,  416,  579,
			  506,  506,  506,  506,  506,  607,  605,  834,  119,  119,
			  582,  611,  118,  118,  119,  118,  411,  118,  118,  599,

			  118,  418,  156,  118,  118,  586,  118,  419,  156,  596,
			  611,  600,  607,  607,  608,  120,  613,  119,  582,  611,
			  120,  614,  119,  584,  606,  156,  120,  602,  585,  418,
			  161,  614,  156,  617,  618,  419,  161,  597,  612,  603,
			  610,  619,  587,  613,  613,  620,  617,  618,  834,  614,
			  834,  584,  609,  161,  118,  118,  585,  118,  834,  616,
			  161,  617,  618,  624,  624,  624,  624,  624,  626,  619,
			  587,  615,  658,  620,  621,  622,  623,  120,  623,  156,
			  834,  624,  624,  624,  624,  624,  625,  625,  625,  625,
			  625,  251,  118,  118,  834,  118,  626,  834,  834,  834,

			  658,  472,  555,  555,  555,  555,  555,  161,  628,  628,
			  628,  628,  628,  834,  834,  120,  659,  627,  629,  629,
			  629,  629,  629,  630,  630,  630,  630,  630,  631,  631,
			  631,  631,  631,  632,  632,  632,  632,  632,  633,  633,
			  633,  633,  633,  834,  659,  627,  557,  634,  661,  634,
			  834,  662,  631,  631,  631,  631,  631,  635,  635,  635,
			  635,  635,  118,  118,  661,  118,  480,  638,  638,  638,
			  638,  638,  118,  118,  834,  118,  661,  118,  118,  662,
			  118,  834,  639,  118,  118,  120,  118,  834,  645,  640,
			  118,  118,  663,  118,  834,  120,  834,  834,  834,  641,

			  120,  118,  118,  659,  118,  645,  120,  156,  642,  645,
			  639,  118,  118,  120,  118,  118,  118,  640,  118,  156,
			  665,  643,  118,  118,  120,  118,  644,  641,  834,  118,
			  118,  660,  118,  645,  120,  161,  642,  834,  120,  156,
			  118,  118,  647,  118,  646,  120,  662,  161,  665,  643,
			  118,  118,  120,  118,  644,  118,  118,  834,  118,  648,
			  650,  834,  834,  120,  834,  649,  834,  161,  118,  118,
			  647,  118,  646,  120,  664,  656,  666,  280,  120,  280,
			  651,  581,  581,  581,  581,  581,  656,  648,  650,  118,
			  118,  120,  118,  649,  657,  119,  657,  653,  655,  667,

			  668,  156,  667,  156,  666,  657,  672,  156,  651,  674,
			  675,  674,  120,  666,  656,  657,  668,  678,  654,  672,
			  675,  156,  679,  119,  680,  653,  655,  667,  668,  161,
			  670,  161,  156,  657,  672,  161,  834,  674,  675,  676,
			  156,  669,  834,  834,  671,  678,  654,  673,  677,  161,
			  679,  678,  680,  624,  624,  624,  624,  624,  834,  834,
			  161,  624,  624,  624,  624,  624,  834,  834,  161,  682,
			  682,  682,  682,  682,  834,  683,  834,  683,  708,  681,
			  684,  684,  684,  684,  684,  685,  688,  685,  834,  834,
			  686,  686,  686,  686,  686,  686,  686,  686,  686,  686, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  687,  687,  687,  687,  687,  834,  708,  118,  118,  385,
			  118,  834,  834,  834,  688,  631,  631,  631,  631,  631,
			  689,  689,  689,  689,  689,  631,  631,  631,  631,  631,
			  120,  834,  834,  557,  691,  691,  691,  691,  691,  692,
			  692,  692,  692,  692,  693,  693,  693,  693,  693,  694,
			  699,  694,  834,  709,  695,  695,  695,  695,  695,  688,
			  118,  118,  834,  118,  834,  118,  118,  699,  118,  118,
			  118,  699,  118,  118,  118,  711,  118,  118,  118,  834,
			  118,  709,  385,  120,  834,  834,  156,  688,  120,  702,
			  118,  118,  120,  118,  834,  699,  120,  713,  698,  834,

			  120,  697,  696,  711,  118,  118,  702,  118,  118,  118,
			  702,  118,  156,  120,  161,  118,  118,  709,  118,  118,
			  118,  711,  118,  156,  834,  713,  698,  120,  156,  697,
			  696,  120,  118,  118,  702,  118,  118,  118,  120,  118,
			  161,  156,  120,  118,  118,  710,  118,  156,  156,  712,
			  715,  161,  700,  701,  156,  120,  161,  156,  717,  120,
			  718,  715,  719,  703,  713,  717,  120,  834,  834,  161,
			  704,  740,  741,  743,  705,  161,  161,  834,  715,  834,
			  700,  701,  161,  834,  834,  161,  717,  834,  718,  716,
			  719,  703,  714,  720,  727,  728,  727,  728,  704,  740,

			  741,  743,  705,  684,  684,  684,  684,  684,  721,  721,
			  721,  721,  721,  686,  686,  686,  686,  686,  686,  686,
			  686,  686,  686,  722,  722,  722,  722,  722,  723,  834,
			  723,  834,  729,  724,  724,  724,  724,  724,  726,  726,
			  726,  726,  726,  834,  743,  834,  472,  630,  630,  630,
			  630,  630,  695,  695,  695,  695,  695,  730,  730,  730,
			  730,  730,  688,  118,  118,  156,  118,  735,  118,  118,
			  834,  118,  744,  118,  118,  834,  118,  118,  118,  745,
			  118,  747,  834,  834,  735,  385,  120,  834,  735,  834,
			  688,  120,  731,  161,  834,  480,  120,  834,  118,  118,

			  120,  118,  748,  732,  733,  118,  118,  745,  118,  747,
			  118,  118,  735,  118,  118,  118,  834,  118,  738,  739,
			  731,  120,  738,  739,  745,  156,  156,  734,  120,  741,
			  748,  732,  733,  120,  834,  736,  834,  120,  834,  738,
			  739,  737,  747,  156,  682,  682,  682,  682,  682,  834,
			  738,  739,  746,  161,  161,  734,  834,  742,  724,  724,
			  724,  724,  724,  736,  750,  750,  750,  750,  750,  737,
			  749,  161,  751,  751,  751,  751,  751,  565,  565,  565,
			  565,  565,  472,  752,  752,  752,  752,  752,  753,  753,
			  753,  753,  753,  689,  689,  689,  689,  689,  118,  118,

			  760,  118,  557,  118,  118,  834,  118,  118,  118,  761,
			  118,  118,  118,  834,  118,  118,  118,  834,  118,  834,
			  758,  120,  118,  118,  758,  118,  120,  156,  760,  759,
			  120,  480,  754,  759,  120,  156,  763,  761,  120,  763,
			  761,  758,  756,  765,  156,  120,  774,  755,  834,  834,
			  759,  834,  758,  834,  834,  161,  803,  803,  803,  803,
			  754,  759,  834,  161,  763,  775,  757,  764,  762,  834,
			  756,  765,  161,  834,  774,  755,  722,  722,  722,  722,
			  722,  767,  767,  767,  767,  767,  118,  118,  777,  118,
			  727,  156,  727,  775,  757,  753,  753,  753,  753,  753,

			  118,  118,  779,  118,  118,  118,  156,  118,  775,  120,
			  118,  118,  834,  118,  557,  834,  777,  768,  777,  161,
			  834,  118,  118,  120,  118,  834,  834,  120,  729,  834,
			  779,  834,  834,  120,  161,  784,  776,  781,  781,  781,
			  781,  781,  786,  784,  120,  768,  778,  770,  769,  118,
			  118,  156,  118,  785,  118,  118,  784,  118,  771,  118,
			  118,  785,  118,  156,  787,  782,  819,  819,  819,  819,
			  786,  784,  120,  834,  785,  770,  769,  120,  834,  161,
			  834,  834,  120,  793,  118,  118,  771,  118,  794,  785,
			  834,  161,  787,  782,  788,  788,  788,  788,  788,  783,

			  729,  729,  729,  729,  729,  118,  118,  120,  118,  791,
			  792,  793,  795,  801,  795,  834,  794,  791,  792,  834,
			  118,  118,  796,  118,  834,  834,  834,  783,  120,  834,
			  791,  792,  789,  807,  118,  118,  790,  118,  805,  118,
			  118,  801,  118,  120,  834,  791,  792,  806,  820,  805,
			  797,  802,  802,  802,  802,  802,  834,  120,  806,  805,
			  789,  807,  120,  834,  790,  820,  834,  834,  806,  820,
			  804,  834,  118,  118,  798,  118,  834,  805,  808,  808,
			  808,  808,  808,  810,  834,  811,  806,  809,  809,  809,
			  809,  809,  834,  820,  810,  120,  811,  834,  804,  834,

			  834,  834,  798,  813,  810,  813,  811,  812,  812,  812,
			  812,  812,  834,  814,  797,  797,  797,  797,  797,  821,
			  834,  834,  810,  834,  811,  818,  818,  818,  818,  818,
			  822,  822,  822,  822,  822,  824,  821,  825,  834,  834,
			  821,  815,  823,  823,  823,  823,  823,  826,  826,  826,
			  826,  826,  824,  834,  825,  834,  824,  834,  825,  827,
			  828,  827,  828,  834,  821,  815,  815,  815,  815,  815,
			  830,  830,  830,  830,  830,  831,  831,  831,  831,  831,
			  824,  834,  825,  832,  832,  832,  832,  832,  833,  833,
			  833,  833,  833,  827,  834,  827,  834,  829,  831,  831,

			  831,  831,  831,  829,  829,  829,  829,  829,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  829,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,  100,  100,  834,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  834,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  102,  102,  834,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  119,  119,  119,  834,  834,  834,  834,  834,  834,
			  834,  119,  119,  834,  119,  834,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  834,

			  834,  119,  119,  119,  119,  119,  119,  119,  119,  151,
			  151,  834,  151,  151,  834,  151,  151,  834,  834,  834,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  834,  834,  151,  151,  151,  151,  151,
			  151,  151,  151,  152,  152,  834,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,

			  152,  152,  152,  152,  207,  207,  834,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  834,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,

			  217,  217,  217,  217,  217,  217,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  834,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  224,  834,  224,
			  834,  834,  834,  834,  224,  224,  834,  224,  224,  834,
			  834,  834,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  834,  224,  224,  224,  224,

			  224,  224,  224,  224,  224,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,

			  234,  234,  234,  234,  234,  234,  234,  238,  238,  834,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  105,  834,
			  834,  834,  834,  105,  105,  834,  834,  834,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  834,  834,  105,  105,  105,  105,  105,  105,  105,

			  105,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  834,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,

			  253,  253,  253,  260,  834,  834,  834,  260,  260,  834,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  834,  834,  260,  260,  260,
			  260,  260,  260,  260,  260,  150,  150,  834,  150,  150,
			  834,  150,  150,  150,  834,  834,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  834,
			  834,  150,  150,  150,  150,  150,  150,  150,  150,  237,
			  237,  237,  834,  834,  834,  834,  834,  834,  834,  834,

			  834,  834,  834,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  237,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  516,
			  834,  516,  834,  834,  834,  834,  516,  516,  834,  516, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  516,  834,  834,  834,  516,  516,  516,  516,  516,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  516,
			  516,  516,  516,  516,  516,  516,  516,  834,  834,  516,
			  516,  516,  516,  516,  516,  516,  516,  428,  428,  428,
			  834,  834,  428,  428,  428,  428,  428,  428,  428,  428,
			  428,  834,  834,  428,  428,  428,  428,  428,  428,  428,
			  428,  428,  428,  428,  428,  428,  428,  428,  428,  428,
			  428,  428,  428,  428,  428,  428,  834,  834,  428,  428,
			  428,  428,  428,  428,  428,  428,  590,  834,  590,  834,
			  834,  834,  834,  590,  590,  834,  590,  590,  834,  834,

			  834,  590,  590,  590,  590,  590,  590,  590,  590,  590,
			  590,  590,  590,  590,  590,  590,  590,  590,  590,  590,
			  590,  590,  590,  590,  834,  590,  590,  590,  590,  590,
			  590,  590,  590,  590,  637,  637,  637,  637,  637,  637,
			  637,  637,  637,  834,  637,  637,  637,  637,  637,  637,
			  637,  637,  637,  637,  637,  637,  637,  637,  637,  637,
			  637,  637,  637,  637,  637,  637,  637,  637,  637,  637,
			  637,  637,  637,  637,  637,  637,  637,  637,  637,  637,
			  637,  637,  637,  637,  637,   13,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,

			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834, yy_Dummy>>,
			1, 276, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5275)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
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
			    1,    3,    5,    6,   11,    3,    4,   12,   20,   15,

			    4,   15,   15,   27,   94,   27,   27,   27,   27,   27,
			   29,   60,   29,   78,   29,   29,   29,   29,   29,   30,
			  811,   30,  810,   30,   30,   30,   30,   30,    5,    6,
			   40,   40,   59,   40,   63,   66,   59,   63,  158,   60,
			   65,    3,   20,   66,   65,  159,    4,   76,   11,   76,
			   76,   12,   29,   40,  766,  766,    5,    6,   94,   78,
			   59,   30,   63,   66,   59,   63,  158,   97,   65,   97,
			   97,   66,   65,  159,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,

			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,   37,   37,   62,   37,   38,   38,
			   62,   38,   80,  222,   39,   39,  160,   39,   62,   89,
			   42,   42,   89,   42,  792,   41,   41,   37,   41,   43,

			   43,   38,   43,  791,   62,  751,   37,   39,   62,   38,
			   37,   39,   37,   42,  160,   82,   62,   42,   41,  222,
			   45,   45,   43,   45,  154,   44,   44,  154,   44,   42,
			  231,   41,  154,   43,   37,   84,  356,   38,   37,   39,
			   37,   89,   41,   45,   79,   42,  161,   45,   44,   46,
			   46,  590,   46,   47,   47,   68,   47,   42,   68,   41,
			   80,   43,   44,   44,   49,   49,   68,   49,   44,   70,
			   41,   84,   46,  722,  161,   45,   47,   70,   51,   51,
			  689,   51,   47,   68,  231,  682,   68,   49,   46,  657,
			   44,   44,   82,   82,   68,   47,   44,   70,   49,   84,

			  166,   51,  168,  590,  228,   70,   49,  228,   50,   50,
			   47,   50,   52,   52,  356,   52,   46,   51,  656,  633,
			   79,   79,   79,   47,   48,   48,   49,   48,  166,   81,
			  168,   50,   53,   53,   49,   52,   83,   53,   53,   86,
			   48,   48,   48,   48,   48,   51,   50,   48,   61,  170,
			  583,   50,  518,   61,   48,   69,   67,  174,   67,   64,
			   52,   48,   69,   71,   61,   64,   64,   69,   48,   67,
			   48,   64,   48,  494,   50,   86,   61,  170,   53,   50,
			   71,   61,   48,   69,   67,  174,   67,   64,   52,   48,
			   69,   71,   61,   64,   64,   69,  481,   67,   48,   64,

			   48,   57,  474,   86,   57,   81,   81,   81,   71,   57,
			  468,  213,   83,   83,   83,  391,  368,   57,   57,   57,
			   57,   57,   57,  110,  110,  110,  110,  110,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,  209,  175,  209,  209,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   58,   91,
			  175,   58,   91,  690,  690,  690,   58,  213,  213,  213,
			  230,   91,   91,  230,   58,   58,   58,   58,   58,   58,

			  427,   91,  180,  427,  363,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,  165,  165,
			  180,   91,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   92,  165,  165,   92,  104,
			  347,  108,  108,  108,  108,  108,  322,   92,  104,  104,
			  104,  104,  104,  151,  151,  302,  108,   92,  111,  111,
			  111,  111,  111,  112,  186,  112,  151,  112,  112,  112,
			  112,  112,  112,  111,  113,  113,  113,  113,  113,  108,

			  185,  164,  188,  104,  108,  299,  164,   92,   95,   95,
			  260,   95,  186,  247,  245,  247,  247,  151,  104,  244,
			  758,  111,  104,  185,  104,  112,  243,  242,  185,  164,
			  188,  240,  235,   95,  164,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,  114,  179,
			  114,  758,  114,  114,  114,  114,  114,  118,  118,  179,
			  118,  119,  119,  190,  119,  121,  121,  226,  121,  122,
			  122,  220,  122,  123,  123,  207,  123,   95,  124,  124,
			  118,  124,  182,  485,  119,  163,  514,  179,  121,  514,

			  114,  190,  122,  178,  125,  125,  123,  125,  163,  126,
			  126,  124,  126,  123,  157,  122,  155,  191,  152,  121,
			  124,  127,  127,  163,  127,  167,  167,  125,  128,  128,
			  150,  128,  126,  485,  129,  129,  163,  129,  107,  130,
			  130,  123,  130,  122,  127,  191,  125,  121,  124,  194,
			  127,  128,  126,  167,  167,  358,  127,  129,  131,  131,
			  130,  131,  130,  195,  128,  132,  132,  172,  132,  106,
			  133,  133,  105,  133,  125,  102,  129,  194,  127,  172,
			  126,  131,  136,  136,  127,  136,  134,  134,  132,  134,
			  100,  195,  128,  133,  132,  172,   98,  132,  131,  223,

			  135,  135,  223,  135,  129,  136,   90,  172,  169,  134,
			   87,  136,  137,  137,   75,  137,  138,   72,  138,  169,
			   56,  171,  132,  135,  133,  132,  131,  171,   36,   35,
			  134,  196,  358,  358,  138,  137,  169,   33,  138,  136,
			  176,  138,  137,  199,  135,  176,  177,  169,  138,  171,
			  138,  223,  138,  139,  139,  171,  139,  177,  134,  196,
			  140,  140,  138,  140,  142,  142,  138,  142,  176,  138,
			  137,  199,  135,  176,  177,   28,  139,  192,  138,  192,
			  138,  366,  366,  140,  366,  177,   26,  142,  145,  145,
			  140,  145,  181,  201,  142,  181,  202,  139,   18,  143, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  143,  143,  143,  143,  140,  192,  140,  192,  142,  144,
			  144,  145,  144,  204,  147,  147,  187,  147,  140,  303,
			  181,  201,  142,  181,  202,  146,  146,  143,  146,  187,
			   17,  143,  144,  145,  140,  141,  141,  147,  141,  304,
			  144,  204,  198,  144,  187,  147,  198,  303,  146,  214,
			   16,  141,  141,  141,  141,  141,   13,  187,  141,  143,
			  146,  145,  148,  148,  146,  148,  183,  304,  144,  141,
			  198,  144,  141,  147,  198,  183,  149,  149,  141,  149,
			  367,  367,  215,  367,  173,  148,  173,    0,  146,  189,
			  173,    0,  146,  308,  183,  216,  212,  141,    0,  149,

			  141,    0,  189,  183,  148,  162,  141,  162,  162,  162,
			  162,  162,  173,  184,  173,  184,  184,  189,  173,  193,
			  193,  308,  162,  197,  149,  214,  214,  214,  203,  205,
			  189,    0,  148,  310,  200,    0,  311,  197,  200,  203,
			  313,  184,  200,  184,  184,  217,  205,  193,  193,  219,
			  162,  197,  149,  156,  314,  314,  203,  205,  215,  215,
			  215,  310,  200,  156,  311,  197,  200,  203,  313,    0,
			  200,  216,  216,  216,  205,  212,  212,  212,  212,  212,
			    0,  217,  314,  314,    0,  219,    0,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,

			  156,  156,  156,  156,  156,  156,  156,  156,  156,  217,
			    0,  224,  227,  219,  224,  227,  236,  236,    0,  236,
			    0,    0,    0,  224,  227,  241,  241,  241,  241,  241,
			  241,    0,    0,  224,  227,  246,  246,  250,  246,  250,
			    0,  236,  250,  250,  250,  250,  250,  251,  251,  251,
			  251,  251,  252,  252,  252,  252,  252,    0,  246,  257,
			  257,  257,  257,  224,  227,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  232,  232,  255,  232,  255,
			    0,    0,  255,  255,  255,  255,  255,    0,  256,    0,
			  256,    0,  256,  256,  256,  256,  256,    0,    0,    0,
			  232,    0,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,

			  232,  232,  232,  232,  232,  249,  249,  249,  249,  249,
			  256,  254,  254,  254,  254,  254,  261,  261,  315,  261,
			  249,  258,  258,  258,  258,  258,  254,  262,  262,    0,
			  262,    0,  263,  263,  232,  263,    0,  264,  264,  261,
			  264,  265,  265,  249,  265,  309,  315,  261,  249,  254,
			  262,    0,    0,  309,  254,  263,  266,  266,    0,  266,
			  264,    0,  267,  267,  265,  267,  262,  268,  268,  316,
			  268,  265,    0,  309,  317,  261,  264,  269,  269,  266,
			  269,  309,  271,  270,  270,  267,  270,  266,  272,  272,
			  268,  272,  515,  271,  262,  515,    0,  316,  267,  265,

			  269,  318,  317,  271,  264,  321,  270,  320,    0,    0,
			  268,  272,    0,  273,  273,  266,  273,    0,  326,  320,
			  269,  271,  274,  274,  272,  274,  267,  275,  275,  318,
			  275,  276,  276,  321,  276,  320,  273,  270,  268,    0,
			  277,  277,    0,  277,  515,  274,  326,  320,  269,  273,
			  275,    0,  272,    0,  276,  278,  278,  274,  278,    0,
			  276,  324,  275,  277,  279,  279,    0,  279,  280,  280,
			  280,  280,  280,  290,  290,  327,  290,  273,  278,  286,
			  286,  286,  286,  286,  324,  274,    0,  279,  276,  324,
			  275,  281,  281,    0,  281,  279,  290,  328,    0,    0,

			  278,  282,  282,  327,  282,    0,    0,  281,  281,  281,
			  281,  281,  329,  333,  281,    0,    0,  282,  282,  282,
			  282,  282,  336,  279,  282,  328,  283,  283,  278,  283,
			  288,  288,  288,  288,  288,  281,  284,  284,    0,  284,
			  329,  333,  283,  283,  283,  283,  283,  332,  288,  283,
			  336,  332,  284,  284,  284,  284,  284,    0,  306,  284,
			  306,  306,  306,  306,  306,  285,  285,  287,  285,  287,
			  283,  289,  289,    0,  289,  332,  288,  337,  338,  332,
			  284,  285,  285,  285,  285,  285,    0,    0,  285,  287,
			  291,  291,  287,  291,  289,    0,  293,  293,  287,  293,

			  292,  292,    0,  292,    0,  337,  338,  294,  294,  285,
			  294,    0,    0,  291,  289,  295,  295,  287,  295,  293,
			  287,  292,    0,  292,    0,    0,  287,  293,  291,    0,
			  294,  297,  297,  323,  297,    0,  296,  296,  295,  296,
			  298,  298,  289,  298,    0,  323,  340,  307,  294,  307,
			  307,  307,  307,  307,  297,  293,  291,  295,  312,  296,
			    0,  323,  355,  298,  319,  330,  312,  325,  339,  319,
			  330,    0,  331,  323,  340,  341,  294,  331,  325,  334,
			  342,  334,  339,  344,  343,  295,  312,  345,  298,  325,
			  296,  343,  319,  330,  312,  346,  339,  319,  330,  325,

			  331,  350,  349,  341,  348,  331,  352,  334,  342,  334,
			  339,  344,  343,  349,  348,  345,  298,  325,  353,  343,
			  354,  357,    0,  346,  350,  359,  429,  430,  360,  350,
			  349,  361,  348,    0,  352,  433,  435,  354,  355,  355,
			  355,  349,  348,    0,  364,  364,  353,  364,  354,  369,
			  369,    0,  369,    0,  429,  430,  364,  372,  372,  372,
			  372,  372,  372,  433,  435,  354,  364,  379,  379,  379,
			  379,  379,  432,    0,  369,  378,  378,  378,  378,  378,
			    0,  380,  380,  380,  380,  380,    0,  432,  438,  439,
			  378,  381,  381,  381,  381,  381,  364,  357,  357,  357,

			  432,  359,  359,  359,  360,  360,  360,  361,  361,  361,
			    0,  396,  396,  378,  396,  432,  438,  439,  378,  380,
			  382,  382,  382,  382,  382,  383,  383,  383,  383,  383,
			  384,    0,  384,    0,  396,  384,  384,  384,  384,  384,
			  383,  385,  385,  385,  385,  385,  386,  386,  386,  386,
			  386,  387,  387,  387,  387,  387,  389,  389,  389,  389,
			  389,  392,  392,  383,  392,  440,  388,  388,  383,  388,
			  388,  388,  388,  388,  390,  390,  390,  390,  390,  393,
			  393,    0,  393,    0,  392,  394,  394,  442,  394,  387,
			    0,  395,  395,  440,  395,  397,  397,    0,  397,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  442,    0,  393,  392,    0,    0,  398,  398,  394,  398,
			  399,  399,    0,  399,  395,  442,  400,  400,  397,  400,
			    0,  401,    0,  443,    0,  393,  395,  394,  442,  398,
			    0,  392,  401,  399,    0,  402,  402,  431,  402,  400,
			  397,  399,  401,  400,  403,  403,  444,  403,  431,  445,
			  398,  443,  434,  393,  395,  394,  404,  404,  402,  404,
			  401,  405,  405,  434,  405,  431,    0,  403,  397,  399,
			  402,  400,  406,  406,  444,  406,  431,  445,  398,  404,
			  434,  446,  407,  407,  405,  407,  421,  408,  408,  403,
			  408,  434,  447,    0,  404,  406,    0,  421,  402,  405,

			  412,  412,  412,  412,  412,  407,  406,  421,  448,  446,
			  408,  409,  409,  409,  409,  409,    0,  403,  412,  449,
			  447,  441,  404,  411,  407,  421,  411,  405,  453,  408,
			  419,  419,  411,  419,  406,  441,  448,  410,  409,  410,
			    0,  410,  410,  410,  410,  410,  412,  449,    0,  441,
			    0,  411,  407,  419,  411,    0,  453,  408,  454,  410,
			  411,  454,  410,  441,    0,    0,  409,    0,  410,  413,
			  413,  413,  413,  413,    0,  414,  414,  516,  414,    0,
			  516,    0,    0,  413,    0,    0,  454,  410,    0,  454,
			  410,  414,  414,  414,  414,  414,  410,    0,  414,  413,

			  415,  415,  415,  415,  415,  414,  416,  416,  416,  416,
			  416,  413,  417,  417,  417,  417,  417,  418,  418,  418,
			  418,  418,  420,  420,    0,  420,  417,  413,  455,  516,
			    0,  418,  415,  414,  422,  422,  436,  422,  423,  423,
			  436,  423,    0,  424,  424,  420,  424,  425,  425,  451,
			  425,  456,  426,  426,  417,  426,  455,  422,  450,  418,
			  415,  423,  450,  451,  436,  426,  424,  457,  436,  452,
			  425,  458,  461,  424,  425,  426,  452,  451,  457,  456,
			  462,  463,  458,  423,  464,  425,  450,  465,  519,  466,
			  450,  451,  467,  467,    0,  457,  469,  452,  465,  458,

			  461,  424,  425,  466,  452,    0,  457,  508,  462,  463,
			  458,  423,  464,  425,  469,  465,  519,  466,  508,    0,
			  467,  467,  486,  486,    0,  486,  465,    0,  508,    0,
			    0,  466,  470,  470,  470,  470,  470,  472,  472,  472,
			  472,  472,  469,    0,    0,  486,  508,  470,  471,  471,
			  471,  471,  471,  473,  473,  473,  473,  473,  475,  475,
			  475,  475,  475,  476,  476,  476,  476,  476,  477,  477,
			  477,  477,  477,  475,    0,  470,  478,  478,  478,  478,
			  478,  479,  479,  479,  479,  479,  471,  480,  480,  480,
			  480,  480,  484,  521,  484,    0,  475,  487,  487,  522,

			  487,  475,  484,  523,    0,    0,  477,  482,  482,  482,
			  482,  482,  483,    0,  483,  483,  483,  483,  483,  479,
			  487,  521,  482,  488,  488,  520,  488,  522,  525,    0,
			  484,  523,  489,  489,    0,  489,  490,  490,    0,  490,
			  491,  491,    0,  491,  492,  492,  488,  492,  520,  530,
			  482,  487,    0,  520,  488,  489,  525,  493,  493,  490,
			  493,  495,  495,  491,  495,    0,  490,  492,  527,  527,
			  489,  491,  496,  496,    0,  496,    0,  530,  497,  497,
			  493,  497,  488,  491,  495,  498,  498,    0,  498,    0,
			    0,  531,  495,  493,  490,  496,  527,  527,  489,  491,

			    0,  497,  496,  499,  499,  532,  499,    0,  498,  500,
			  500,  491,  500,  497,  501,  501,  526,  501,  513,  531,
			  495,  493,  564,  564,  564,  564,  499,    0,  526,  513,
			  496,  533,  500,  532,  499,  511,  511,  501,  511,  513,
			    0,  497,    0,    0,  526,  501,  503,  503,  503,  503,
			  503,  500,  504,  504,    0,  504,  526,  513,  511,  533,
			  503,    0,  499,  505,  505,  505,  505,  505,  507,  507,
			  507,  507,  507,  501,    0,  504,  506,  511,  506,  500,
			  506,  506,  506,  506,  506,  534,  536,    0,  503,  507,
			  505,  539,  509,  509,  506,  509,  504,  510,  510,  528,

			  510,  506,  524,  512,  512,  511,  512,  506,  538,  524,
			  540,  528,  538,  534,  536,  509,  541,  507,  505,  539,
			  510,  542,  506,  509,  537,  537,  512,  528,  510,  506,
			  524,  544,  543,  545,  546,  506,  538,  524,  540,  528,
			  538,  547,  512,  543,  541,  548,  549,  550,    0,  542,
			    0,  509,  537,  537,  568,  568,  510,  568,    0,  544,
			  543,  545,  546,  552,  552,  552,  552,  552,  554,  547,
			  512,  543,  593,  548,  549,  550,  551,  568,  551,  595,
			    0,  551,  551,  551,  551,  551,  553,  553,  553,  553,
			  553,  554,  572,  572,    0,  572,  554,    0,    0,    0,

			  593,  552,  555,  555,  555,  555,  555,  595,  556,  556,
			  556,  556,  556,    0,    0,  572,  596,  555,  557,  557,
			  557,  557,  557,  558,  558,  558,  558,  558,  559,  559,
			  559,  559,  559,  560,  560,  560,  560,  560,  561,  561,
			  561,  561,  561,    0,  596,  555,  556,  562,  598,  562,
			    0,  599,  562,  562,  562,  562,  562,  563,  563,  563,
			  563,  563,  567,  567,  601,  567,  559,  566,  566,  566,
			  566,  566,  569,  569,    0,  569,  598,  570,  570,  599,
			  570,    0,  566,  571,  571,  567,  571,    0,  574,  567,
			  573,  573,  601,  573,    0,  569,    0,    0,    0,  569,

			  570,  575,  575,  597,  575,  574,  571,  597,  570,  574,
			  566,  576,  576,  573,  576,  577,  577,  567,  577,  603,
			  604,  571,  578,  578,  575,  578,  573,  569,    0,  579,
			  579,  597,  579,  574,  576,  597,  570,    0,  577,  602,
			  584,  584,  576,  584,  575,  578,  602,  603,  604,  571,
			  580,  580,  579,  580,  573,  585,  585,    0,  585,  577,
			  579,    0,    0,  584,    0,  578,    0,  602,  587,  587,
			  576,  587,  575,  580,  602,  588,  605,  581,  585,  581,
			  580,  581,  581,  581,  581,  581,  588,  577,  579,  586,
			  586,  587,  586,  578,  589,  581,  588,  585,  587,  606,

			  607,  608,  609,  610,  605,  589,  611,  612,  580,  613,
			  614,  615,  586,  608,  588,  589,  610,  618,  586,  612,
			  616,  616,  619,  581,  620,  585,  587,  606,  607,  608,
			  609,  610,  621,  589,  611,  612,    0,  613,  614,  615,
			  622,  608,    0,    0,  610,  618,  586,  612,  616,  616,
			  619,  622,  620,  623,  623,  623,  623,  623,    0,    0,
			  621,  624,  624,  624,  624,  624,    0,    0,  622,  625,
			  625,  625,  625,  625,    0,  626,    0,  626,  658,  622,
			  626,  626,  626,  626,  626,  627,  630,  627,    0,    0,
			  627,  627,  627,  627,  627,  628,  628,  628,  628,  628, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  629,  629,  629,  629,  629,    0,  658,  642,  642,  630,
			  642,    0,    0,    0,  630,  631,  631,  631,  631,  631,
			  632,  632,  632,  632,  632,  634,  634,  634,  634,  634,
			  642,    0,    0,  628,  635,  635,  635,  635,  635,  636,
			  636,  636,  636,  636,  638,  638,  638,  638,  638,  639,
			  645,  639,    0,  659,  639,  639,  639,  639,  639,  638,
			  640,  640,    0,  640,    0,  641,  641,  645,  641,  643,
			  643,  645,  643,  644,  644,  662,  644,  646,  646,    0,
			  646,  659,  638,  640,    0,    0,  663,  638,  641,  652,
			  647,  647,  643,  647,    0,  645,  644,  668,  643,    0,

			  646,  641,  640,  662,  648,  648,  652,  648,  649,  649,
			  652,  649,  660,  647,  663,  650,  650,  660,  650,  651,
			  651,  664,  651,  664,    0,  668,  643,  648,  669,  641,
			  640,  649,  653,  653,  652,  653,  654,  654,  650,  654,
			  660,  670,  651,  655,  655,  660,  655,  671,  673,  664,
			  674,  664,  648,  650,  676,  653,  669,  677,  678,  654,
			  679,  676,  680,  653,  671,  681,  655,    0,    0,  670,
			  654,  708,  709,  711,  655,  671,  673,    0,  674,    0,
			  648,  650,  676,    0,    0,  677,  678,    0,  679,  676,
			  680,  653,  671,  681,  692,  692,  692,  692,  654,  708,

			  709,  711,  655,  683,  683,  683,  683,  683,  684,  684,
			  684,  684,  684,  685,  685,  685,  685,  685,  686,  686,
			  686,  686,  686,  687,  687,  687,  687,  687,  688,    0,
			  688,    0,  692,  688,  688,  688,  688,  688,  691,  691,
			  691,  691,  691,    0,  712,    0,  684,  693,  693,  693,
			  693,  693,  694,  694,  694,  694,  694,  695,  695,  695,
			  695,  695,  693,  696,  696,  714,  696,  702,  697,  697,
			    0,  697,  712,  698,  698,    0,  698,  700,  700,  715,
			  700,  717,    0,    0,  702,  693,  696,    0,  702,    0,
			  693,  697,  696,  714,    0,  695,  698,    0,  701,  701,

			  700,  701,  718,  697,  698,  703,  703,  715,  703,  717,
			  704,  704,  702,  704,  705,  705,    0,  705,  706,  707,
			  696,  701,  706,  707,  716,  710,  716,  701,  703,  710,
			  718,  697,  698,  704,    0,  703,    0,  705,    0,  706,
			  707,  704,  720,  720,  721,  721,  721,  721,  721,    0,
			  706,  707,  716,  710,  716,  701,    0,  710,  723,  723,
			  723,  723,  723,  703,  724,  724,  724,  724,  724,  704,
			  720,  720,  725,  725,  725,  725,  725,  726,  726,  726,
			  726,  726,  721,  727,  727,  727,  727,  727,  728,  728,
			  728,  728,  728,  730,  730,  730,  730,  730,  731,  731,

			  740,  731,  724,  732,  732,    0,  732,  733,  733,  741,
			  733,  734,  734,    0,  734,  736,  736,    0,  736,    0,
			  738,  731,  737,  737,  738,  737,  732,  742,  740,  739,
			  733,  730,  731,  739,  734,  744,  745,  741,  736,  746,
			  742,  738,  734,  748,  749,  737,  760,  732,    0,    0,
			  739,    0,  738,    0,    0,  742,  796,  796,  796,  796,
			  731,  739,    0,  744,  745,  761,  737,  746,  742,    0,
			  734,  748,  749,    0,  760,  732,  750,  750,  750,  750,
			  750,  752,  752,  752,  752,  752,  754,  754,  763,  754,
			  753,  762,  753,  761,  737,  753,  753,  753,  753,  753,

			  755,  755,  765,  755,  756,  756,  764,  756,  762,  754,
			  757,  757,    0,  757,  750,    0,  763,  754,  764,  762,
			    0,  768,  768,  755,  768,    0,    0,  756,  753,    0,
			  765,    0,    0,  757,  764,  772,  762,  767,  767,  767,
			  767,  767,  774,  772,  768,  754,  764,  756,  755,  769,
			  769,  776,  769,  773,  770,  770,  772,  770,  757,  771,
			  771,  773,  771,  778,  779,  768,  814,  814,  814,  814,
			  774,  772,  769,    0,  773,  756,  755,  770,    0,  776,
			    0,    0,  771,  786,  782,  782,  757,  782,  787,  773,
			    0,  778,  779,  768,  780,  780,  780,  780,  780,  771,

			  781,  781,  781,  781,  781,  783,  783,  782,  783,  784,
			  785,  786,  788,  793,  788,    0,  787,  784,  785,    0,
			  790,  790,  788,  790,    0,    0,    0,  771,  783,    0,
			  784,  785,  782,  801,  789,  789,  783,  789,  799,  798,
			  798,  793,  798,  790,    0,  784,  785,  800,  816,  799,
			  788,  795,  795,  795,  795,  795,    0,  789,  800,  799,
			  782,  801,  798,    0,  783,  816,    0,    0,  800,  816,
			  798,    0,  804,  804,  789,  804,    0,  799,  802,  802,
			  802,  802,  802,  805,    0,  806,  800,  803,  803,  803,
			  803,  803,    0,  816,  805,  804,  806,    0,  798,    0,

			    0,    0,  789,  809,  805,  809,  806,  808,  808,  808,
			  808,  808,    0,  809,  812,  812,  812,  812,  812,  817,
			    0,    0,  805,    0,  806,  813,  813,  813,  813,  813,
			  818,  818,  818,  818,  818,  820,  817,  821,    0,    0,
			  817,  809,  819,  819,  819,  819,  819,  822,  822,  822,
			  822,  822,  820,    0,  821,    0,  820,    0,  821,  823,
			  823,  823,  823,    0,  817,  826,  826,  826,  826,  826,
			  827,  827,  827,  827,  827,  828,  828,  828,  828,  828,
			  820,    0,  821,  830,  830,  830,  830,  830,  832,  832,
			  832,  832,  832,  831,    0,  831,    0,  823,  831,  831,

			  831,  831,  831,  833,  833,  833,  833,  833,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  831,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,

			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  839,  839,    0,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,    0,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  840,  840,    0,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,

			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  842,  842,  842,    0,    0,    0,    0,    0,    0,
			    0,  842,  842,    0,  842,    0,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,    0,

			    0,  842,  842,  842,  842,  842,  842,  842,  842,  843,
			  843,    0,  843,  843,    0,  843,  843,    0,    0,    0,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  843,  843,    0,    0,  843,  843,  843,  843,  843,
			  843,  843,  843,  844,  844,    0,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,

			  844,  844,  844,  844,  845,  845,    0,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,    0,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,

			  846,  846,  846,  846,  846,  846,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,    0,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,  848,    0,  848,
			    0,    0,    0,    0,  848,  848,    0,  848,  848,    0,
			    0,    0,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,    0,  848,  848,  848,  848,

			  848,  848,  848,  848,  848,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  850,  850,  850,  850,
			  850,  850,  850,  850,  850,  850,  850,  850,  850,  850,
			  850,  850,  850,  850,  850,  850,  850,  850,  850,  850,
			  850,  850,  850,  850,  850,  850,  850,  850,  850,  850,
			  850,  850,  850,  850,  850,  850,  850,  850,  850,  850,

			  850,  850,  850,  850,  850,  850,  850,  851,  851,    0,
			  851,  851,  851,  851,  851,  851,  851,  851,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  851,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  851,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  851,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  851,  852,    0,
			    0,    0,    0,  852,  852,    0,    0,    0,  852,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,  852,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,  852,  852,
			  852,    0,    0,  852,  852,  852,  852,  852,  852,  852,

			  852,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  854,  854,  854,  854,  854,  854,  854,  854,
			  854,    0,  854,  854,  854,  854,  854,  854,  854,  854,
			  854,  854,  854,  854,  854,  854,  854,  854,  854,  854,
			  854,  854,  854,  854,  854,  854,  854,  854,  854,  854,
			  854,  854,  854,  854,  854,  854,  854,  854,  854,  854,

			  854,  854,  854,  855,    0,    0,    0,  855,  855,    0,
			  855,  855,  855,  855,  855,  855,  855,  855,  855,  855,
			  855,  855,  855,  855,  855,  855,  855,  855,  855,  855,
			  855,  855,  855,  855,  855,    0,    0,  855,  855,  855,
			  855,  855,  855,  855,  855,  856,  856,    0,  856,  856,
			    0,  856,  856,  856,    0,    0,  856,  856,  856,  856,
			  856,  856,  856,  856,  856,  856,  856,  856,  856,  856,
			  856,  856,  856,  856,  856,  856,  856,  856,  856,    0,
			    0,  856,  856,  856,  856,  856,  856,  856,  856,  857,
			  857,  857,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  857,  858,  858,
			  858,  858,  858,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  858,  858,  858,  858,  859,
			    0,  859,    0,    0,    0,    0,  859,  859,    0,  859, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  859,    0,    0,    0,  859,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,    0,    0,  859,
			  859,  859,  859,  859,  859,  859,  859,  860,  860,  860,
			    0,    0,  860,  860,  860,  860,  860,  860,  860,  860,
			  860,    0,    0,  860,  860,  860,  860,  860,  860,  860,
			  860,  860,  860,  860,  860,  860,  860,  860,  860,  860,
			  860,  860,  860,  860,  860,  860,    0,    0,  860,  860,
			  860,  860,  860,  860,  860,  860,  861,    0,  861,    0,
			    0,    0,    0,  861,  861,    0,  861,  861,    0,    0,

			    0,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,    0,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,    0,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,

			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834, yy_Dummy>>,
			1, 276, 5000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   88,   93,   75,   76,    0,    0,  183,
			    0,   67,   70, 1056, 5185,   97, 1047, 1004,  991, 5185,
			   89,    0, 5185, 5185, 5185, 5185,  971,   87,  958,   96,
			  105, 5185, 5185,  911, 5185,  903,  900,  272,  276,  282,
			  128,  293,  288,  297,  323,  318,  347,  351,  422,  362,
			  406,  376,  410,  422, 5185, 5185,  865,  499,  576,  103,
			   78,  415,  247,  101,  426,  111,  102,  425,  322,  422,
			  336,  430,  900, 5185, 5185,  907,  145, 5185,  106,  337,
			  275,  422,  308,  429,  318, 5185,  422,  857, 5185,  287,
			  903,  577,  653, 5185,   77,  706, 5185,  165,  893, 5185,

			  883, 5185,  866,    0,  650,  861,  866,  822,  643, 5185,
			  505,  660,  669,  676,  744, 5185, 5185, 5185,  765,  769,
			    0,  773,  777,  781,  786,  802,  807,  819,  826,  832,
			  837,  856,  863,  868,  884,  898,  880,  910,  902,  951,
			  958, 1033,  962,  981, 1007,  986, 1023, 1012, 1060, 1074,
			  807,  663,  763, 5185,  322,  805, 1130,  797,   92,  107,
			  254,  313, 1089,  762,  668,  596,  366,  792,  358,  875,
			  404,  890,  834, 1053,  419,  508,  907,  913,  780,  736,
			  560,  961,  736, 1033, 1082,  667,  638,  983,  656, 1056,
			  742,  785,  946, 1087,  816,  816,  898, 1090, 1005,  910,

			 1101,  960,  952, 1095,  963, 1096, 5185,  778, 5185,  549,
			 5185, 5185, 1089,  504, 1042, 1075, 1088, 1128, 5185, 1132,
			  728, 5185,  266,  897, 1209, 5185,  774, 1210,  402, 1264,
			  588,  303, 1353, 5185, 5185,  705, 1214, 5185, 5185, 5185,
			  722, 1208,  718,  717,  710,  705, 1233,  711, 5185, 1387,
			 1224, 1229, 1234, 5185, 1393, 1344, 1354, 1241, 1403, 5185,
			  683, 1414, 1425, 1430, 1435, 1439, 1454, 1460, 1465, 1475,
			 1481, 1454, 1486, 1511, 1520, 1525, 1529, 1538, 1553, 1562,
			 1550, 1589, 1599, 1624, 1634, 1663, 1561, 1653, 1612, 1669,
			 1571, 1688, 1698, 1694, 1705, 1713, 1734, 1729, 1738,  682,

			 5185, 5185,  658,  986,  998,    0, 1642, 1731, 1060, 1412,
			 1100, 1095, 1725, 1108, 1122, 1385, 1431, 1429, 1468, 1731,
			 1474, 1460,  610, 1700, 1528, 1750, 1480, 1537, 1560, 1575,
			 1732, 1739, 1614, 1582, 1748,    0, 1589, 1630, 1645, 1735,
			 1713, 1735, 1747, 1751, 1750, 1744, 1751,  604, 1771, 1769,
			 1768,    0, 1773, 1768, 1787, 1755,  329, 1814,  848, 1818,
			 1821, 1824, 5185,  601, 1842, 5185,  979, 1078,  513, 1847,
			 5185, 5185, 1840, 5185, 5185, 5185, 5185, 5185, 1857, 1849,
			 1863, 1873, 1902, 1907, 1917, 1923, 1928, 1933, 1951, 1938,
			 1956,  488, 1959, 1977, 1983, 1989, 1909, 1993, 2004, 2008,

			 2014, 1993, 2033, 2042, 2054, 2059, 2070, 2080, 2085, 2093,
			 2123, 2087, 2082, 2151, 2173, 2182, 2188, 2194, 2199, 2128,
			 2220, 2058, 2232, 2236, 2241, 2245, 2250,  598,    0, 1782,
			 1779, 2004, 1839, 1791, 2019, 1799, 2203,    0, 1841, 1843,
			 1932, 2088, 1954, 1990, 2017, 2016, 2044, 2045, 2068, 2079,
			 2225, 2216, 2236, 2092, 2125, 2184, 2207, 2234, 2238,    0,
			    0, 2239, 2247, 2234, 2252, 2258, 2256, 2260,  495, 2281,
			 2314, 2330, 2319, 2335,  488, 2340, 2345, 2350, 2358, 2363,
			 2369,  478, 2389, 2396, 2379,  777, 2320, 2395, 2421, 2430,
			 2434, 2438, 2442, 2455,  450, 2459, 2470, 2476, 2483, 2501,

			 2507, 2512, 5185, 2528, 2550, 2545, 2562, 2550, 2279, 2590,
			 2595, 2533, 2601, 2490,  794, 1490, 2175,    0,  396, 2255,
			 2392, 2360, 2366, 2363, 2569, 2396, 2483, 2436, 2566,    0,
			 2411, 2458, 2472, 2499, 2548,    0, 2553, 2592, 2575, 2558,
			 2577, 2572, 2588, 2599, 2598, 2600, 2601, 2597, 2604, 2613,
			 2614, 2663, 2645, 2668, 2635, 2684, 2690, 2700, 2705, 2710,
			 2715, 2720, 2734, 2739, 2504, 5185, 2749, 2760, 2652, 2770,
			 2775, 2781, 2690, 2788, 2760, 2799, 2809, 2813, 2820, 2827,
			 2848, 2863, 5185,  427, 2838, 2853, 2887, 2866, 2847, 2866,
			  349, 5185, 5185, 2643,    0, 2646, 2687, 2774, 2715, 2711,

			    0, 2731, 2806, 2786, 2782, 2831, 2866, 2854, 2868, 2869,
			 2870, 2861, 2874, 2876, 2878, 2878, 2888,    0, 2873, 2891,
			 2892, 2899, 2907, 2935, 2943, 2951, 2962, 2972, 2977, 2982,
			 2953, 2997, 3002,  404, 3007, 3016, 3021, 5185, 3026, 3036,
			 3058, 3063, 3005, 3067, 3071, 3022, 3075, 3088, 3102, 3106,
			 3113, 3117, 3061, 3130, 3134, 3141,  403,  374, 2934, 3015,
			 3079,    0, 3044, 3053, 3090,    0,    0,    0, 3047, 3095,
			 3108, 3114,    0, 3115, 3110,    0, 3121, 3124, 3125, 3124,
			 3129, 3132,  329, 3185, 3190, 3195, 3200, 3205, 3215,  324,
			  565, 3220, 3181, 3229, 3234, 3239, 3261, 3266, 3271, 5185,

			 3275, 3296, 3239, 3303, 3308, 3312, 3290, 3291, 3140, 3135,
			 3292, 3140, 3211,    0, 3232, 3248, 3293, 3249, 3269,    0,
			 3310, 3326,  317, 3340, 3346, 3354, 3359, 3365, 3370, 5185,
			 3375, 3396, 3401, 3405, 3409, 5185, 3413, 3420, 3392, 3401,
			 3364, 3363, 3394,    0, 3402, 3403, 3406,    0, 3397, 3411,
			 3458,  259, 3463, 3477, 3484, 3498, 3502, 3508,  715, 5185,
			 3413, 3415, 3458, 3443, 3473, 3452,  136, 3519, 3519, 3547,
			 3552, 3557, 3507, 3525, 3496,    0, 3518,    0, 3530, 3522,
			 3576, 3582, 3582, 3603, 3581, 3582, 3533, 3555, 3599, 3632,
			 3618,  280,  271, 3571,    0, 3633, 3438, 5185, 3637, 3610,

			 3619, 3600, 3660, 3669, 3670, 3655, 3657,    0, 3689, 3690,
			   99,   97, 3696, 3707, 3548, 5185, 3620, 3691, 3712, 3724,
			 3707, 3709, 3729, 3746, 5185, 5185, 3747, 3752, 3757, 5185,
			 3765, 3780, 3770, 3785, 5185, 3831, 3882, 3933, 3984, 4035,
			 4086, 4121, 4159, 4203, 4252, 4303, 4354, 4405, 4455, 4504,
			 4555, 4606, 4651, 4700, 4751, 4795, 4839, 4887, 4937, 4987,
			 5036, 5084, 5133, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  834,    1,  835,  835,  836,  836,  837,  837,  834,
			    9,  838,  838,  834,  834,  834,  834,  834,  839,  834,
			  840,  841,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  843,  834,  834,  844,  834,  834,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  834,  834,  834,  845,  834,  834,  834,  845,
			  845,  845,  845,  845,  846,  834,  846,  847,  834,  848,
			  834,  848,  848,  834,  849,  850,  834,  834,  834,  834,

			  839,  834,  851,  851,  851,  852,  853,  834,  834,  834,
			  834,  854,  834,  834,  834,  834,  834,  834,  834,  842,
			  855,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,   48,  842,
			  842,  842,  842,   48,  842,  842,  842,  842,  842,  842,
			  856,  843,  844,  834,  834,  834,   58,  834,  156,  156,
			  156,   58,   58,   58,   58,   58,  156,   58,  156,   58,
			  156,  156,   58,   58,  156,  156,   58,   58,  156,   58,
			  156,  156,  156,   58,   58,   58,  156,   58,  156,   58,
			  156,  156,   58,   58,  156,  156,   58,   58,  156,  156,

			   58,   58,  156,   58,  156,   58,  834,  845,  834,  834,
			  834,  834,  845,  845,  845,  845,  845,  846,  834,  846,
			  847,  834,  847,  848,  848,  834,  834,  834,  834,  834,
			  834,  849,  850,  834,  834,  232,  857,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  855,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  834,  842,  842,  842,  842,  842,  842,  842,  842,
			  834,  842,  842,  842,  842,  842,  141,  141,  141,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  834,

			  834,  834,  834,  156,  156,  156,  834,  156,   58,   58,
			   58,  156,   58,  156,   58,  156,  156,  156,   58,   58,
			   58,  156,  156,   58,   58,  834,  156,  156,  156,  156,
			   58,   58,   58,  156,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,   58,   58,  156,  156,  156,   58,   58,
			   58,  156,   58,  156,   58,  845,  845,  845,  845,  845,
			  845,  845,  834,  858,  858,  834,  858,  858,  858,  857,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  855,  842,  842,  842,  842,  842,  842,  842,  842,

			  842,  834,  842,  842,  842,  842,  842,  842,  842,  834,
			  141,  141,  410,  410,  842,  138,  834,  414,  414,  842,
			  842,  834,  842,  842,  842,  842,  842,  859,  860,  156,
			  156,   58,   58,  156,   58,  156,   58,  156,  156,  156,
			   58,   58,   58,  156,  156,   58,  156,  156,  156,  156,
			   58,   58,   58,  156,   58,  156,  156,   58,   58,  156,
			  156,   58,   58,  156,  156,  156,   58,   58,  156,   58,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  854,  834,  834,  834,  842,  842,  842,  842,
			  842,  842,  842,  842,  834,  842,  842,  842,  842,  842,

			  842,  842,  834,  414,  842,  834,  414,  506,  834,  842,
			  842,  842,  842,  834,  834,  861,  859,  156,  156,   58,
			   58,  156,   58,  156,   58,  156,  156,   58,   58,  156,
			  156,   58,  156,  156,  156,  156,   58,   58,   58,  156,
			   58,  156,  156,   58,   58,  156,  156,  156,  156,   58,
			   58,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  862,  842,  842,  842,
			  842,  842,  842,  842,  834,  842,  842,  842,  842,  842,
			  842,  414,  834,  834,  842,  842,  842,  842,  834,  834,
			  861,  834,  834,  156,  156,   58,  156,   58,  156,  156,

			  156,   58,   58,   58,  156,  156,  156,  156,   58,   58,
			   58,  156,   58,  156,  156,   58,   58,  156,  156,  156,
			  156,   58,   58,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  842,  842,  842,  842,  842,  834,  842,  842,  842,  842,
			  842,  842,  834,  842,  842,  842,  834,  834,  156,  156,
			   58,  156,  156,   58,   58,  156,  156,  156,  156,   58,
			   58,   58,  156,   58,  156,  156,   58,   58,  156,  156,
			  156,   58,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  842,  842,  842,  834,

			  842,  842,  834,  842,  842,  842,  834,  834,  156,  156,
			   58,  156,   58,  156,   58,  156,   58,  156,  156,  156,
			   58,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  842,  842,  842,  842,  834,  842,  842,  834,  834,
			  156,  156,   58,  156,   58,  156,   58,  156,  156,   58,
			  834,  834,  834,  834,  842,  842,  842,  842,  834,  834,
			  156,  156,   58,  156,   58,  156,  834,  834,  842,  842,
			  842,  842,  834,  834,  156,  156,   58,  156,   58,  156,
			  834,  834,  842,  842,  834,  834,  156,  156,  834,  842,
			  842,  834,  834,  156,  156,  834,  834,  834,  842,  834,

			  834,  156,  834,  834,  842,  834,  834,  156,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,    0,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834, yy_Dummy>>)
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
			   34,   35,   36,   37,   35,   35,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   35,   48,   49,   50,
			   51,   52,   53,   54,   55,   56,    1,   57,   58,   59,

			   60,   61,   62,   63,   64,   65,   63,   63,   66,   67,
			   68,   69,   70,   71,   72,   73,   74,   75,   63,   76,
			   77,   78,   63,   79,   80,   81,   82,    1,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,    1,    1,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   87,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   89,   90,   90,   90,   90,   90,   90,   90,    1,    1,
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
			   38,   39,    5,   40,   41,    5,   12,   12,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
			   12,   42,   43,   44,   45,   46,   47,   48,   49,    5,
			    5,   50,   51,    1,    1,    1,    1,    1,    1,    1,
			    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  130,  128,    1,    2,   15,  112,   18,
			  128,   16,   17,    7,    6,   13,    5,   11,    8,  103,
			  103,   14,   12,   29,   10,   30,   20,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   81,   95,
			   95,   95,   95,   22,   31,   23,    9,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   24,   21,   25,  116,  117,  118,  119,  116,
			  116,  116,  116,  116,  129,  101,  129,  129,  129,  129,
			   69,  129,  129,   71,  129,  129,   94,    1,    2,   28,

			  112,  111,  126,  126,  126,    0,    3,   33,  107,   32,
			    0,    0,  103,    0,  103,   27,   26,   19,    0,   95,
			   90,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   40,   95,   89,
			   89,   80,   89,   89,   95,   95,   95,   95,   95,   95,
			    0,    0,    0,  102,    0,    0,   98,    0,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   40,   98,   40,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   99,  116,  118,  117,
			  114,  113,  115,  116,  116,  116,  116,    0,  101,    0,
			    0,  100,    0,    0,    0,   71,   69,    0,   68,    0,
			   67,    0,    0,   94,   92,   92,    0,   93,  126,  120,
			  126,  126,  126,  126,  126,  126,    0,    4,   34,  107,
			    0,    0,    0,  105,  107,  105,  103,    0,    0,   90,
			    0,   95,   95,   39,   95,   95,   95,   95,   95,   95,
			   95,    0,   95,   95,   95,   95,   95,   42,   95,   95,
			    0,   81,   82,   81,   81,   81,   88,   95,   88,   88,
			   88,   95,   95,   95,   95,   95,   95,   41,   95,    0,

			   65,   97,    0,   98,   98,   39,   72,   72,   98,   98,
			   39,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,    0,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   42,   42,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   41,   41,   98,   98,  116,  116,  116,  116,  116,
			  116,  116,  100,    0,    0,   70,   68,   67,   71,    0,
			  124,  127,  127,  125,  121,  122,  123,   91,  107,    0,
			  107,    0,    0,  107,    0,    0,    0,  106,  103,    0,
			    0,   96,   95,   95,   95,   95,   38,   95,   95,   95,

			   95,    0,   95,   95,   95,   95,   95,   95,   95,    0,
			   95,   80,   95,   95,   95,   95,    0,   80,   80,   80,
			   37,    0,   44,   95,   95,   95,   95,   66,   62,   98,
			   98,   98,   98,   98,   98,   98,   98,   38,   98,   98,
			   38,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   37,
			   44,   37,   44,   98,   98,   98,   98,   98,   98,   98,
			  107,  107,    0,    0,  104,  107,    0,  106,    0,  106,
			    0,    0,    0,  103,   77,    0,   60,   95,   95,   95,
			   95,   95,   45,   95,    0,   95,   95,   95,   36,   95,

			   95,   95,   82,   82,   81,    0,   95,   95,    0,   95,
			   95,   95,   95,    0,   66,   66,    0,   60,   98,   60,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   45,
			   98,   45,   98,   98,   98,   36,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,    0,  107,    0,  110,  107,  106,    0,    0,  106,
			    0,    0,  105,    0,    0,   77,    0,   95,   61,   95,
			   95,   95,   47,   95,    0,   95,   95,   95,   95,   95,
			   95,   95,   80,    0,   53,   95,   95,   95,    0,    0,
			    0,   64,   63,   98,   61,   61,   98,   98,   98,   98,

			   47,   98,   98,   47,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   53,   98,   98,
			   98,   53,   98,    0,  107,    0,    0,    0,  106,    0,
			  110,  106,    0,   79,    0,    0,    0,  108,  110,  108,
			   95,   95,   59,   95,   46,    0,   43,   58,   95,   35,
			   95,   51,    0,   95,   95,   95,    0,    0,   98,   98,
			   98,   59,   98,   59,   98,   46,   43,   58,   98,   43,
			   58,   98,   35,   35,   98,   51,   98,   51,   98,   98,
			   98,   98,  110,    0,  110,    0,  106,    0,    0,  109,
			    0,    0,   76,  110,    0,  109,   95,   95,   95,   85,

			   54,   95,    0,   95,   95,   55,    0,    0,   98,   98,
			   98,   98,   98,   54,   54,   98,   98,   98,   98,   55,
			   98,  110,  109,    0,  109,    0,    0,    0,    0,   76,
			  109,   95,   95,   48,   95,   84,   52,   95,    0,    0,
			   98,   98,   98,   48,   48,   98,   98,   52,   98,   52,
			  109,   78,    0,   76,   95,   95,   95,   95,   83,   83,
			   98,   98,   98,   98,   98,   98,    0,    0,   95,   50,
			   49,   95,    0,    0,   98,   50,   50,   49,   49,   98,
			    0,    0,   95,   95,    0,    0,   98,   98,   75,   95,
			   56,    0,    0,   98,   56,    0,    0,   75,   95,    0,

			    0,   98,    0,    0,   57,    0,    0,   57,    0,   74,
			    0,    0,    0,    0,    0,   74,    0,    0,    0,    0,
			    0,    0,    0,   73,   86,   87,    0,    0,    0,   73,
			    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 5185
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 834
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 835
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

	yyNb_rules: INTEGER is 129
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 130
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
