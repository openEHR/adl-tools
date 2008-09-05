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
	-- match a pattern like 'Type_Identifier whitespace <'
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
			create an_array.make (0, 5281)
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
			  812,  111,  811,  114,  114,  114,  114,  114,   86,   86,
			  118,  118,  168,  118,  156,  156,  156,  178,  303,  161,
			  186,   78,  104,  188,  156,  304,   78,  209,   96,  209,
			  209,   96,  113,  120,  775,  775,   87,   87,  233,  211,
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
			  118,  118,  223,  118,  795,  118,  118,  120,  118,  118,

			  118,  120,  118,  794,  176,  761,  121,  120,  161,  124,
			  122,  125,  123,  120,  305,  208,  177,  128,  120,  222,
			  118,  118,  120,  118,  154,  118,  118,  154,  118,  129,
			  232,  126,  155,  130,  121,  218,  208,  124,  122,  125,
			  123,  225,  127,  120,  208,  128,  156,  134,  120,  118,
			  118,  829,  118,  118,  118,  156,  118,  129,  194,  126,
			  213,  130,  131,  132,  118,  118,  195,  118,  133,  156,
			  127,  219,  120,  553,  161,  134,  120,  202,  118,  118,
			  478,  118,  136,  161,  233,  470,  196,  120,  135,  702,
			  131,  132,  215,  215,  197,  137,  133,  161,  144,  220,

			  311,  120,  313,  586,  228,  203,  145,  228,  118,  118,
			  136,  118,  118,  118,  213,  118,  135,  148,  701,  685,
			  212,  212,  212,  137,  118,  118,  144,  118,  311,  208,
			  313,  120,  150,  150,  145,  120,  208,  150,  150,  221,
			  138,  138,  138,  138,  138,  148,  146,  120,  156,  315,
			  647,  147,  588,  170,  139,  156,  190,  321,  156,  156,
			  149,  140,  198,  156,  171,  180,  181,  199,  141,  191,
			  142,  182,  143,  570,  146,  219,  161,  315,  150,  147,
			  204,  172,  139,  161,  192,  321,  161,  161,  149,  140,
			  200,  161,  173,  183,  184,  201,  557,  193,  142,  185,

			  143,  154,  110,  220,  154,  214,  214,  214,  205,  155,
			  509,  208,  216,  216,  216,  391,  365,  156,  156,  156,
			  156,  156,  157,  252,  252,  252,  252,  252,  156,  156,
			  156,  156,  156,  158,  156,  156,  156,  159,  156,  160,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  209,  322,  209,  209,  156,  161,  161,  162,  161,
			  161,  163,  161,  161,  161,  164,  161,  165,  161,  161,
			  161,  161,  161,  162,  161,  161,  161,  161,  154,  227,
			  322,  154,  227,  720,  720,  720,  155,  212,  212,  212,
			  230,  228,  229,  230,  156,  156,  156,  156,  156,  157,

			  510,  230,  326,  511,  365,  156,  156,  156,  156,  166,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  305,  156,
			  326,  225,  156,  161,  161,  161,  161,  167,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  227,  310,  161,  227,  240,
			  463,  249,  249,  249,  249,  249,  442,  228,  241,  241,
			  241,  241,  241,  150,  150,  426,  250,  230,  254,  254,
			  254,  254,  254,  110,  333,  111,  299,  256,  256,  256,
			  256,  256,  257,  255,  258,  258,  258,  258,  258,  251,

			  156,  156,  335,  242,  250,  425,  304,  225,  235,  235,
			  391,  235,  333,  247,  376,  247,  247,  300,  243,  375,
			  767,  255,  244,  329,  245,  113,  374,  373,  161,  161,
			  335,  370,  829,  236,  309,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  110,  325,
			  111,  768,  256,  256,  256,  256,  256,  118,  118,  156,
			  118,  118,  118,  337,  118,  118,  118,  226,  118,  118,
			  118,  222,  118,  118,  118,  208,  118,  237,  118,  118,
			  259,  118,  329,  562,  120,  156,  510,  161,  120,  510,

			  113,  337,  120,  271,  118,  118,  120,  118,  303,  118,
			  118,  120,  118,  263,  302,  262,  301,  338,  153,  261,
			  264,  118,  118,  161,  118,  156,  311,  120,  118,  118,
			  299,  118,  120,  113,  118,  118,  308,  118,  248,  118,
			  118,  263,  118,  262,  120,  338,  265,  261,  264,  341,
			  267,  120,  266,  161,  312,  247,  268,  120,  118,  118,
			  271,  118,  120,  342,  269,  118,  118,  341,  118,  223,
			  118,  118,  223,  118,  265,  246,  270,  341,  267,  156,
			  266,  120,  118,  118,  268,  118,  118,  118,  120,  118,
			  313,  342,  269,  120,  273,  343,  239,  274,  272,  101,

			  118,  118,   98,  118,  270,  120,  226,  161,  156,  120,
			  347,  278,  118,  118,  222,  118,  366,  365,  314,  366,
			  315,  225,  273,  120,  275,  274,  272,  280,  156,  327,
			  276,  281,  328,  321,  282,  120,  161,  347,  347,  278,
			  283,  119,  279,  284,  277,  285,  118,  118,  318,  118,
			  510,  118,  118,  511,  118,  280,  161,  327,  276,  281,
			  328,  323,  282,  118,  118,  350,  118,  208,  283,  120,
			  279,  284,  277,  285,  120,  206,  119,  119,  119,  119,
			  119,  139,  118,  118,  153,  118,  120,  117,  118,  118,
			  286,  118,  116,  139,  115,  286,  351,  142,  109,  106, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  118,  118,  586,  118,  286,  120,  353,  286,  119,  139,
			  101,  120,  118,  118,   99,  118,   98,  118,  118,  291,
			  118,  139,  292,  120,  351,  142,  118,  118,  829,  118,
			  298,  296,  829,  427,  353,  120,  119,  829,  156,  829,
			  120,  829,  287,  287,  287,  287,  287,  291,  829,  120,
			  292,  333,  294,  337,  829,  156,  295,  293,  298,  296,
			  288,  427,  316,  289,  118,  118,  161,  118,  317,  290,
			  208,  156,  306,  829,  307,  307,  307,  307,  307,  334,
			  294,  339,  322,  161,  295,  293,  156,  120,  288,  156,
			  316,  289,  316,  156,  156,  326,  317,  290,  317,  161,

			  327,  156,  156,  328,  351,  156,  297,  829,  338,  156,
			  324,  428,  345,  427,  161,  342,  346,  161,  335,  156,
			  319,  161,  161,  330,  208,  829,  320,  208,  331,  161,
			  161,  332,  352,  161,  297,  829,  340,  161,  208,  428,
			  345,  429,  829,  344,  346,  156,  336,  161,  829,  355,
			  356,  357,  358,  359,  829,  829,  829,  218,  221,  371,
			  372,  372,  372,  372,  372,  389,  389,  389,  389,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  219,  219,  345,  431,  433,  829,  346,

			  212,  212,  212,  360,  360,  360,  829,  369,  369,  353,
			  369,  435,  829,  829,  361,  361,  361,  829,  436,  161,
			  161,  220,  220,  348,  431,  433,  227,  349,  227,  227,
			  829,  227,  236,  246,  246,  829,  246,  354,  228,  435,
			  228,  381,  381,  381,  381,  381,  436,  829,  230,  437,
			  230,  435,  379,  829,  379,  829,  377,  380,  380,  380,
			  380,  380,  382,  382,  382,  382,  382,  386,  829,  386,
			  829,  829,  387,  387,  387,  387,  387,  437,  225,  438,
			  225,  363,  364,  365,  363,  364,  363,  363,  363,  363,
			  363,  363,  363,  363,  366,  229,  229,  363,  229,  229,

			  229,  229,  229,  363,  367,  363,  363,  363,  363,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  363,  363,  368,  363,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  235,  235,  829,  235,  390,  390,  390,  390,  390,
			  367,  365,  829,  367,  110,  829,  111,  829,  388,  388,
			  388,  388,  388,  829,  829,  829,  236,  829,  237,  237,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  378,  378,  378,  378,  378,  113,  383,  383,  383,
			  383,  383,  118,  118,  156,  118,  250,  118,  118,  436,
			  118,  156,  384,  118,  118,  829,  118,  401,  118,  118,
			  237,  118,  829,  437,  829,  120,  441,  829,  401,  251,
			  120,  829,  161,  392,  250,  385,  120,  439,  401,  161,
			  384,  120,  118,  118,  829,  118,  393,  118,  118,  829,
			  118,  440,  118,  118,  441,  118,  401,  394,  829,  118,
			  118,  392,  118,  829,  444,  120,  118,  118,  829,  118,

			  120,  829,  395,  445,  393,  120,  118,  118,  396,  118,
			  118,  118,  120,  118,  829,  394,  433,  156,  397,  120,
			  118,  118,  444,  118,  118,  118,  156,  118,  829,  120,
			  395,  445,  398,  120,  118,  118,  396,  118,  441,  399,
			  446,  829,  402,  120,  434,  161,  397,  120,  118,  118,
			  156,  118,  118,  118,  161,  118,  403,  120,  428,  404,
			  398,  447,  118,  118,  400,  118,  443,  399,  446,  405,
			  402,  120,  829,  118,  118,  120,  118,  406,  161,  118,
			  118,  829,  118,  829,  403,  120,  430,  404,  829,  447,
			  829,  829,  118,  118,  829,  118,  120,  405,  829,  829,

			  118,  118,  120,  118,  408,  406,  156,  407,  409,  409,
			  409,  409,  409,  829,  431,  120,  411,  411,  411,  411,
			  411,  118,  118,  120,  118,  119,  119,  119,  119,  119,
			  118,  118,  408,  118,  161,  407,  410,  412,  412,  412,
			  412,  412,  432,  451,  120,  156,  413,  413,  413,  413,
			  413,  829,  415,  120,  829,  416,  829,  829,  829,  118,
			  118,  417,  118,  208,  156,  410,  119,  119,  119,  119,
			  119,  451,  453,  161,  410,  414,  414,  414,  414,  414,
			  415,  454,  120,  416,  119,  118,  118,  442,  118,  417,
			  118,  118,  161,  118,  118,  118,  829,  118,  118,  118,

			  453,  118,  829,  410,  118,  118,  454,  118,  120,  454,
			  829,  829,  119,  120,  829,  118,  118,  120,  118,  419,
			  451,  120,  156,  118,  118,  829,  118,  120,  290,  829,
			  118,  118,  418,  118,  456,  420,  118,  118,  120,  118,
			  215,  215,  118,  118,  829,  118,  120,  829,  452,  829,
			  161,  829,  829,  120,  829,  829,  290,  422,  829,  120,
			  418,  829,  208,  420,  421,  120,  306,  457,  306,  306,
			  306,  306,  306,  306,  208,  307,  307,  307,  307,  307,
			  302,  156,  156,  156,  423,  422,  444,  445,  458,  156,
			  424,  401,  421,  446,  156,  457,  458,  453,  461,  462,

			  156,  457,  401,  156,  156,  466,  208,  513,  156,  161,
			  161,  161,  401,  461,  448,  449,  458,  161,  424,  462,
			  156,  450,  161,  463,  460,  455,  461,  462,  161,  459,
			  401,  161,  161,  466,  208,  513,  161,  466,  212,  212,
			  212,  464,  208,  369,  369,  829,  369,  465,  161,  829,
			  214,  214,  214,  829,  364,  365,  829,  364,  371,  372,
			  372,  372,  372,  372,  829,  467,  366,  829,  829,  829,
			  468,  468,  468,  468,  468,  829,  367,  380,  380,  380,
			  380,  380,  216,  216,  216,  250,  469,  469,  469,  469,
			  469,  471,  471,  471,  471,  471,  472,  472,  472,  472,

			  472,  473,  473,  473,  473,  473,  368,  829,  251,  829,
			  212,  212,  212,  250,  118,  118,  384,  118,  212,  212,
			  212,  474,  829,  474,  470,  829,  475,  475,  475,  475,
			  475,  476,  476,  476,  476,  476,  829,  120,  829,  385,
			  829,  829,  829,  585,  384,  387,  387,  387,  387,  387,
			  477,  477,  477,  477,  477,  479,  480,  829,  481,  481,
			  481,  481,  481,  482,  482,  482,  482,  482,  483,  483,
			  483,  483,  483,  118,  118,  829,  118,  118,  118,  514,
			  118,  829,  118,  118,  829,  118,  118,  118,  478,  118,
			  118,  118,  587,  118,  118,  118,  120,  118,  829,  829, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  120,  156,  829,  118,  118,  120,  118,  514,  517,  120,
			  829,  519,  513,  120,  829,  484,  492,  120,  829,  118,
			  118,  487,  118,  485,  486,  829,  120,  492,  829,  161,
			  118,  118,  521,  118,  490,  488,  517,  492,  489,  519,
			  515,  829,  120,  484,  118,  118,  491,  118,  829,  487,
			  829,  485,  486,  120,  829,  492,  118,  118,  829,  118,
			  521,  829,  490,  488,  829,  493,  489,  120,  118,  118,
			  829,  118,  829,  829,  491,  118,  118,  156,  118,  120,
			  829,  118,  118,  829,  118,  118,  118,  829,  118,  494,
			  829,  120,  514,  493,  495,  829,  522,  829,  120,  414,

			  414,  414,  414,  414,  120,  161,  496,  504,  120,  497,
			  829,  409,  409,  409,  409,  409,  119,  494,  504,  119,
			  516,  156,  495,  498,  522,  119,  156,  499,  504,  281,
			  519,  119,  500,  829,  496,  829,  829,  497,  283,  549,
			  549,  549,  549,  549,  119,  829,  504,  119,  525,  161,
			  829,  498,  829,  119,  161,  499,  829,  281,  520,  119,
			  500,  411,  411,  411,  411,  411,  283,  412,  412,  412,
			  412,  412,  118,  118,  829,  118,  525,  118,  118,  119,
			  118,  280,  502,  502,  502,  502,  502,  829,  413,  413,
			  413,  413,  413,  829,  526,  120,  119,  284,  118,  118,

			  120,  118,  501,  829,  829,  118,  118,  119,  118,  280,
			  829,  829,  503,  503,  503,  503,  503,  118,  118,  829,
			  118,  120,  526,  829,  119,  284,  119,  525,  120,  829,
			  501,  156,  156,  118,  118,  829,  118,  829,  118,  118,
			  120,  118,  517,  528,  118,  118,  521,  118,  829,  529,
			  530,  156,  531,  535,  119,  527,  120,  509,  537,  161,
			  161,  120,  505,  506,  522,  507,  156,  120,  156,  156,
			  518,  528,  528,  530,  523,  538,  508,  529,  530,  161,
			  531,  535,  156,  529,  156,  535,  537,  156,  156,  156,
			  505,  506,  524,  507,  161,  537,  161,  161,  538,  541,

			  532,  534,  542,  538,  508,  156,  509,  543,  542,  156,
			  161,  533,  161,  536,  829,  161,  161,  161,  544,  541,
			  156,  156,  589,  539,  156,  829,  540,  541,  118,  118,
			  542,  118,  829,  161,  829,  543,  546,  161,  468,  468,
			  468,  468,  468,  829,  588,  829,  544,  545,  161,  161,
			  589,  120,  161,  547,  548,  548,  548,  548,  548,  550,
			  550,  550,  550,  550,  551,  551,  551,  551,  551,  475,
			  475,  475,  475,  475,  552,  552,  552,  552,  552,  384,
			  829,  547,  554,  554,  554,  554,  554,  555,  555,  555,
			  555,  555,  470,  556,  556,  556,  556,  556,  559,  589,

			  559,  829,  385,  118,  118,  591,  118,  384,  560,  593,
			  829,  829,  553,  551,  551,  551,  551,  551,  480,  829,
			  481,  481,  481,  481,  481,  478,  120,  590,  558,  118,
			  118,  599,  118,  591,  156,  829,  561,  593,  118,  118,
			  829,  118,  118,  118,  829,  118,  118,  118,  829,  118,
			  118,  118,  120,  118,  593,  156,  558,  563,  829,  599,
			  564,  120,  161,  118,  118,  120,  118,  118,  118,  120,
			  118,  829,  566,  120,  600,  601,  565,  567,  118,  118,
			  829,  118,  596,  161,  118,  118,  120,  118,  564,  568,
			  120,  118,  118,  829,  118,  829,  829,  602,  571,  569,

			  566,  120,  600,  601,  565,  567,  829,  120,  572,  118,
			  118,  829,  118,  829,  120,  118,  118,  568,  118,  573,
			  118,  118,  594,  118,  578,  602,  571,  569,  583,  829,
			  829,  829,  120,  829,  595,  578,  572,  600,  120,  583,
			  574,  118,  118,  120,  118,  578,  829,  573,  829,  584,
			  594,  576,  577,  577,  577,  577,  577,  575,  118,  118,
			  606,  118,  595,  578,  120,  603,  119,  583,  574,  502,
			  502,  502,  502,  502,  503,  503,  503,  503,  503,  576,
			  582,  120,  829,  119,  156,  575,  118,  118,  606,  118,
			  416,  591,  829,  606,  119,  119,  417,  118,  118,  829,

			  118,  594,  410,  608,  118,  118,  156,  118,  582,  120,
			  602,  119,  161,  595,  601,  156,  609,  579,  416,  592,
			  120,  607,  156,  119,  417,  609,  612,  120,  580,  597,
			  613,  608,  614,  608,  161,  615,  612,  613,  605,  621,
			  653,  598,  604,  161,  609,  579,  581,  829,  118,  118,
			  161,  118,  829,  611,  612,  829,  580,  829,  613,  829,
			  614,  610,  251,  615,  616,  617,  829,  621,  653,  829,
			  618,  120,  618,  829,  581,  619,  619,  619,  619,  619,
			  619,  619,  619,  619,  619,  620,  620,  620,  620,  620,
			  551,  551,  551,  551,  551,  829,  623,  623,  623,  623,

			  623,  631,  631,  631,  631,  622,  624,  624,  624,  624,
			  624,  625,  625,  625,  625,  625,  156,  829,  470,  626,
			  626,  626,  626,  626,  627,  627,  627,  627,  627,  722,
			  723,  722,  829,  622,  553,  628,  628,  628,  628,  628,
			  629,  829,  629,  829,  161,  626,  626,  626,  626,  626,
			  630,  630,  630,  630,  630,  640,  829,  478,  633,  633,
			  633,  633,  633,  118,  118,  829,  118,  724,  118,  118,
			  654,  118,  640,  634,  118,  118,  640,  118,  829,  118,
			  118,  829,  118,  829,  118,  118,  120,  118,  829,  829,
			  635,  120,  829,  118,  118,  636,  118,  120,  654,  829,

			  640,  634,  120,  118,  118,  637,  118,  120,  118,  118,
			  656,  118,  118,  118,  829,  118,  120,  638,  635,  118,
			  118,  829,  118,  636,  118,  118,  120,  118,  829,  639,
			  829,  120,  654,  637,  829,  120,  156,  829,  656,  642,
			  118,  118,  120,  118,  657,  638,  641,  120,  577,  577,
			  577,  577,  577,  829,  829,  645,  643,  639,  118,  118,
			  655,  118,  644,  120,  161,  118,  118,  642,  118,  119,
			  646,  651,  657,  829,  641,  283,  118,  118,  656,  118,
			  652,  120,  651,  645,  643,  156,  118,  118,  120,  118,
			  644,  652,  652,  156,  660,  661,  662,  119,  646,  120,

			  657,  652,  663,  283,  662,  649,  658,  648,  156,  120,
			  651,  667,  156,  161,  156,  669,  650,  670,  669,  652,
			  661,  161,  660,  661,  662,  663,  667,  673,  659,  674,
			  663,  675,  665,  649,  156,  648,  161,  670,  156,  667,
			  161,  156,  161,  669,  650,  670,  671,  829,  664,  822,
			  823,  822,  673,  666,  668,  673,  829,  674,  829,  675,
			  829,  703,  161,  829,  829,  672,  161,  829,  829,  161,
			  619,  619,  619,  619,  619,  619,  619,  619,  619,  619,
			  676,  677,  677,  677,  677,  677,  678,  824,  678,  703,
			  829,  679,  679,  679,  679,  679,  680,  683,  680,  829, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  829,  681,  681,  681,  681,  681,  681,  681,  681,  681,
			  681,  682,  682,  682,  682,  682,  829,  829,  118,  118,
			  385,  118,  829,  829,  829,  683,  626,  626,  626,  626,
			  626,  684,  684,  684,  684,  684,  626,  626,  626,  626,
			  626,  120,  829,  829,  553,  686,  686,  686,  686,  686,
			  687,  687,  687,  687,  687,  688,  688,  688,  688,  688,
			  689,  694,  689,  829,  704,  690,  690,  690,  690,  690,
			  683,  118,  118,  829,  118,  829,  118,  118,  694,  118,
			  118,  118,  694,  118,  118,  118,  706,  118,  118,  118,
			  829,  118,  704,  385,  120,  829,  829,  156,  683,  120,

			  697,  118,  118,  120,  118,  829,  694,  120,  708,  693,
			  829,  120,  692,  691,  706,  118,  118,  697,  118,  118,
			  118,  697,  118,  156,  120,  161,  118,  118,  704,  118,
			  118,  118,  706,  118,  156,  829,  708,  693,  120,  156,
			  692,  691,  120,  118,  118,  697,  118,  118,  118,  120,
			  118,  161,  156,  120,  118,  118,  705,  118,  156,  156,
			  707,  710,  161,  695,  696,  156,  120,  161,  156,  712,
			  120,  713,  710,  714,  698,  708,  712,  120,  735,  736,
			  161,  699,  738,  738,  156,  700,  161,  161,  829,  710,
			  829,  695,  696,  161,  829,  829,  161,  712,  829,  713,

			  711,  714,  698,  709,  715,  829,  735,  736,  829,  699,
			  738,  739,  161,  700,  679,  679,  679,  679,  679,  716,
			  716,  716,  716,  716,  681,  681,  681,  681,  681,  681,
			  681,  681,  681,  681,  717,  717,  717,  717,  717,  718,
			  829,  718,  829,  829,  719,  719,  719,  719,  719,  721,
			  721,  721,  721,  721,  829,  740,  829,  470,  625,  625,
			  625,  625,  625,  690,  690,  690,  690,  690,  725,  725,
			  725,  725,  725,  683,  118,  118,  742,  118,  730,  118,
			  118,  829,  118,  740,  118,  118,  829,  118,  118,  118,
			  740,  118,  156,  829,  829,  730,  385,  120,  829,  730,

			  829,  683,  120,  726,  742,  829,  478,  120,  829,  118,
			  118,  120,  118,  743,  727,  728,  118,  118,  741,  118,
			  161,  118,  118,  730,  118,  118,  118,  829,  118,  733,
			  734,  726,  120,  733,  734,  755,  156,  756,  729,  120,
			  736,  743,  727,  728,  120,  829,  731,  829,  120,  829,
			  733,  734,  732,  742,  156,  677,  677,  677,  677,  677,
			  829,  733,  734,  755,  161,  756,  729,  829,  737,  719,
			  719,  719,  719,  719,  731,  745,  745,  745,  745,  745,
			  732,  744,  161,  746,  746,  746,  746,  746,  561,  561,
			  561,  561,  561,  470,  747,  747,  747,  747,  747,  748,

			  748,  748,  748,  748,  684,  684,  684,  684,  684,  118,
			  118,  156,  118,  553,  118,  118,  829,  118,  118,  118,
			  758,  118,  118,  118,  829,  118,  118,  118,  829,  118,
			  829,  753,  120,  118,  118,  753,  118,  120,  156,  161,
			  754,  120,  478,  749,  754,  120,  758,  760,  758,  120,
			  156,  756,  753,  751,  829,  769,  120,  770,  750,  118,
			  118,  754,  118,  753,  829,  829,  161,  798,  798,  798,
			  798,  749,  754,  829,  759,  760,  829,  752,  161,  757,
			  829,  751,  120,  769,  829,  770,  750,  717,  717,  717,
			  717,  717,  762,  762,  762,  762,  762,  118,  118,  772,

			  118,  722,  765,  722,  156,  752,  748,  748,  748,  748,
			  748,  118,  118,  774,  118,  118,  118,  156,  118,  781,
			  120,  770,  829,  118,  118,  553,  118,  772,  763,  772,
			  765,  829,  161,  829,  120,  829,  829,  829,  120,  724,
			  829,  774,  829,  156,  829,  161,  120,  781,  156,  771,
			  776,  776,  776,  776,  776,  829,  763,  773,  782,  764,
			  829,  118,  118,  766,  118,  118,  118,  777,  118,  118,
			  118,  161,  118,  829,  829,  779,  161,  780,  783,  783,
			  783,  783,  783,  779,  120,  780,  782,  764,  120,  786,
			  829,  766,  120,  788,  789,  777,  779,  786,  780,  724,

			  724,  724,  724,  724,  118,  118,  829,  118,  796,  778,
			  786,  779,  787,  780,  802,  118,  118,  829,  118,  829,
			  787,  788,  789,  829,  790,  786,  790,  120,  118,  118,
			  829,  118,  829,  787,  791,  829,  796,  778,  120,  800,
			  118,  118,  802,  118,  118,  118,  785,  118,  787,  829,
			  800,  120,  784,  797,  797,  797,  797,  797,  801,  829,
			  800,  829,  792,  120,  829,  829,  829,  120,  793,  801,
			  118,  118,  829,  118,  785,  799,  829,  829,  800,  801,
			  784,  803,  803,  803,  803,  803,  804,  804,  804,  804,
			  804,  805,  829,  120,  806,  829,  793,  801,  814,  814,

			  814,  814,  805,  799,  829,  806,  807,  807,  807,  807,
			  807,  808,  805,  808,  815,  806,  792,  792,  792,  792,
			  792,  809,  813,  813,  813,  813,  813,  816,  829,  829,
			  805,  815,  829,  806,  829,  815,  817,  817,  817,  817,
			  817,  819,  829,  820,  816,  829,  829,  829,  816,  810,
			  818,  818,  818,  818,  818,  829,  829,  829,  819,  815,
			  820,  829,  819,  829,  820,  821,  821,  821,  821,  821,
			  829,  829,  816,  810,  810,  810,  810,  810,  825,  825,
			  825,  825,  825,  829,  829,  829,  819,  829,  820,  826,
			  826,  826,  826,  826,  827,  827,  827,  827,  827,  822,

			  829,  822,  829,  829,  826,  826,  826,  826,  826,  828,
			  828,  828,  828,  828,  824,  824,  824,  824,  824,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  824,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   94,   94,   94,   94,   94,   94,   94,   94,   94, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,  100,  100,  829,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  829,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  102,  102,  829,  102,  102,  102,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  119,  119,  119,
			  829,  829,  829,  829,  829,  829,  829,  119,  119,  829,
			  119,  829,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,

			  119,  119,  119,  119,  119,  829,  829,  119,  119,  119,
			  119,  119,  119,  119,  119,  151,  151,  829,  151,  151,
			  829,  151,  151,  829,  829,  829,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  829,
			  829,  151,  151,  151,  151,  151,  151,  151,  151,  152,
			  152,  829,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,

			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  207,  207,  829,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  829,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,

			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  829,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  224,  829,  224,  829,  829,  829,  829,
			  224,  224,  829,  224,  224,  829,  829,  829,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,

			  224,  829,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,

			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  238,  238,  829,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  105,  829,  829,  829,  829,  105,
			  105,  829,  829,  829,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  829,  829,  105,

			  105,  105,  105,  105,  105,  105,  105,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  829,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,

			  253,  253,  253,  253,  253,  253,  253,  253,  253,  260,
			  829,  829,  829,  260,  260,  829,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  829,  829,  260,  260,  260,  260,  260,  260,  260,
			  260,  150,  150,  829,  150,  150,  829,  150,  150,  150,
			  829,  829,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  829,  829,  150,  150,  150,
			  150,  150,  150,  150,  150,  237,  237,  237,  829,  829,

			  829,  829,  829,  829,  829,  829,  829,  829,  829,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  237,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  512,  829,  512,  829,  829, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  829,  829,  512,  512,  829,  512,  512,  829,  829,  829,
			  512,  512,  512,  512,  512,  512,  512,  512,  512,  512,
			  512,  512,  512,  512,  512,  512,  512,  512,  512,  512,
			  512,  512,  512,  829,  829,  512,  512,  512,  512,  512,
			  512,  512,  512,  426,  426,  426,  829,  829,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  829,  829,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  829,  829,  426,  426,  426,  426,  426,  426,
			  426,  426,  585,  829,  585,  829,  829,  829,  829,  585,

			  585,  829,  585,  585,  829,  829,  829,  585,  585,  585,
			  585,  585,  585,  585,  585,  585,  585,  585,  585,  585,
			  585,  585,  585,  585,  585,  585,  585,  585,  585,  585,
			  829,  585,  585,  585,  585,  585,  585,  585,  585,  585,
			  632,  632,  632,  632,  632,  632,  632,  632,  632,  829,
			  632,  632,  632,  632,  632,  632,  632,  632,  632,  632,
			  632,  632,  632,  632,  632,  632,  632,  632,  632,  632,
			  632,  632,  632,  632,  632,  632,  632,  632,  632,  632,
			  632,  632,  632,  632,  632,  632,  632,  632,  632,  632,
			  632,   13,  829,  829,  829,  829,  829,  829,  829,  829,

			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829, yy_Dummy>>,
			1, 282, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5281)
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
			  806,   30,  805,   30,   30,   30,   30,   30,    5,    6,
			   40,   40,   59,   40,   63,   66,   59,   63,  158,   60,
			   65,    3,   20,   66,   65,  159,    4,   76,   11,   76,
			   76,   12,   29,   40,  761,  761,    5,    6,   94,   78,
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
			   42,   42,   89,   42,  787,   41,   41,   37,   41,   43,

			   43,   38,   43,  786,   62,  746,   37,   39,   62,   38,
			   37,   39,   37,   42,  160,   82,   62,   42,   41,  222,
			   45,   45,   43,   45,  154,   44,   44,  154,   44,   42,
			  231,   41,  154,   43,   37,   84,  356,   38,   37,   39,
			   37,   89,   41,   45,   79,   42,  161,   45,   44,   46,
			   46,  585,   46,   47,   47,   68,   47,   42,   68,   41,
			   80,   43,   44,   44,   49,   49,   68,   49,   44,   70,
			   41,   84,   46,  717,  161,   45,   47,   70,   51,   51,
			  684,   51,   47,   68,  231,  677,   68,   49,   46,  652,
			   44,   44,   82,   82,   68,   47,   44,   70,   49,   84,

			  166,   51,  168,  585,  228,   70,   49,  228,   50,   50,
			   47,   50,   52,   52,  356,   52,   46,   51,  651,  628,
			   79,   79,   79,   47,   48,   48,   49,   48,  166,   81,
			  168,   50,   53,   53,   49,   52,   83,   53,   53,   86,
			   48,   48,   48,   48,   48,   51,   50,   48,   61,  170,
			  578,   50,  514,   61,   48,   69,   67,  174,   67,   64,
			   52,   48,   69,   71,   61,   64,   64,   69,   48,   67,
			   48,   64,   48,  492,   50,   86,   61,  170,   53,   50,
			   71,   61,   48,   69,   67,  174,   67,   64,   52,   48,
			   69,   71,   61,   64,   64,   69,  479,   67,   48,   64,

			   48,   57,  472,   86,   57,   81,   81,   81,   71,   57,
			  466,  213,   83,   83,   83,  391,  368,   57,   57,   57,
			   57,   57,   57,  110,  110,  110,  110,  110,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,  209,  175,  209,  209,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   58,   91,
			  175,   58,   91,  685,  685,  685,   58,  213,  213,  213,
			  230,   91,   91,  230,   58,   58,   58,   58,   58,   58,

			  425,   91,  180,  425,  363,   58,   58,   58,   58,   58,
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
			  753,  111,  104,  185,  104,  112,  243,  242,  185,  164,
			  188,  240,  235,   95,  164,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,  114,  179,
			  114,  753,  114,  114,  114,  114,  114,  118,  118,  179,
			  118,  119,  119,  190,  119,  121,  121,  226,  121,  122,
			  122,  220,  122,  123,  123,  207,  123,   95,  124,  124,
			  118,  124,  182,  483,  119,  163,  510,  179,  121,  510,

			  114,  190,  122,  178,  125,  125,  123,  125,  163,  126,
			  126,  124,  126,  123,  157,  122,  155,  191,  152,  121,
			  124,  127,  127,  163,  127,  167,  167,  125,  128,  128,
			  150,  128,  126,  483,  129,  129,  163,  129,  107,  130,
			  130,  123,  130,  122,  127,  191,  125,  121,  124,  194,
			  127,  128,  126,  167,  167,  106,  127,  129,  131,  131,
			  130,  131,  130,  195,  128,  132,  132,  196,  132,  223,
			  133,  133,  223,  133,  125,  105,  129,  194,  127,  169,
			  126,  131,  136,  136,  127,  136,  134,  134,  132,  134,
			  169,  195,  128,  133,  132,  196,  102,  132,  131,  100,

			  135,  135,   98,  135,  129,  136,   90,  169,  172,  134,
			  199,  136,  137,  137,   87,  137,  366,  366,  169,  366,
			  172,  223,  132,  135,  133,  132,  131,  138,  176,  181,
			  134,  138,  181,  176,  138,  137,  172,  201,  199,  136,
			  138,  138,  137,  138,  135,  138,  139,  139,  172,  139,
			  511,  140,  140,  511,  140,  138,  176,  181,  134,  138,
			  181,  176,  138,  142,  142,  201,  142,   75,  138,  139,
			  137,  138,  135,  138,  140,   72,  143,  143,  143,  143,
			  143,  140,  149,  149,   56,  149,  142,   36,  144,  144,
			  139,  144,   35,  142,   33,  140,  202,  140,   28,   26, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  147,  147,  511,  147,  143,  149,  204,  142,  143,  140,
			   18,  144,  145,  145,   17,  145,   16,  146,  146,  144,
			  146,  142,  144,  147,  202,  140,  141,  141,   13,  141,
			  149,  147,    0,  303,  204,  145,  143,    0,  187,    0,
			  146,    0,  141,  141,  141,  141,  141,  144,    0,  141,
			  144,  187,  146,  192,    0,  192,  146,  145,  149,  147,
			  141,  303,  171,  141,  148,  148,  187,  148,  171,  141,
			  212,  177,  162,    0,  162,  162,  162,  162,  162,  187,
			  146,  192,  177,  192,  146,  145,  183,  148,  141,  162,
			  171,  141,  173,  203,  173,  183,  171,  141,  173,  177,

			  184,  197,  184,  184,  203,  189,  148,    0,  193,  193,
			  177,  304,  198,  308,  183,  197,  198,  162,  189,  310,
			  173,  203,  173,  183,  214,    0,  173,  215,  184,  197,
			  184,  184,  203,  189,  148,  156,  193,  193,  216,  304,
			  198,  308,    0,  197,  198,  156,  189,  310,    0,  212,
			  212,  212,  212,  212,    0,    0,    0,  217,  219,  241,
			  241,  241,  241,  241,  241,  257,  257,  257,  257,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  200,  205,  217,  219,  200,  311,  313,    0,  200,

			  214,  214,  214,  215,  215,  215,    0,  236,  236,  205,
			  236,  315,    0,    0,  216,  216,  216,    0,  316,  200,
			  205,  217,  219,  200,  311,  313,  224,  200,  227,  224,
			    0,  227,  236,  246,  246,    0,  246,  205,  224,  315,
			  227,  251,  251,  251,  251,  251,  316,    0,  224,  317,
			  227,  318,  250,    0,  250,    0,  246,  250,  250,  250,
			  250,  250,  252,  252,  252,  252,  252,  255,    0,  255,
			    0,    0,  255,  255,  255,  255,  255,  317,  224,  318,
			  227,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  232,  232,    0,  232,  258,  258,  258,  258,  258,
			  367,  367,    0,  367,  256,    0,  256,    0,  256,  256,
			  256,  256,  256,    0,    0,    0,  232,    0,  232,  232,

			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  249,  249,  249,  249,  249,  256,  254,  254,  254,
			  254,  254,  261,  261,  319,  261,  249,  262,  262,  319,
			  262,  320,  254,  263,  263,    0,  263,  271,  264,  264,
			  232,  264,    0,  320,    0,  261,  321,    0,  271,  249,
			  262,    0,  319,  261,  249,  254,  263,  319,  271,  320,
			  254,  264,  265,  265,    0,  265,  262,  266,  266,    0,
			  266,  320,  267,  267,  321,  267,  271,  264,    0,  268,
			  268,  261,  268,    0,  326,  265,  269,  269,    0,  269,

			  266,    0,  265,  327,  262,  267,  272,  272,  266,  272,
			  270,  270,  268,  270,    0,  264,  314,  314,  267,  269,
			  273,  273,  326,  273,  274,  274,  323,  274,    0,  272,
			  265,  327,  268,  270,  275,  275,  266,  275,  323,  269,
			  328,    0,  272,  273,  314,  314,  267,  274,  276,  276,
			  309,  276,  277,  277,  323,  277,  273,  275,  309,  274,
			  268,  329,  278,  278,  270,  278,  323,  269,  328,  275,
			  272,  276,    0,  279,  279,  277,  279,  276,  309,  283,
			  283,    0,  283,    0,  273,  278,  309,  274,    0,  329,
			    0,    0,  280,  280,    0,  280,  279,  275,    0,    0,

			  281,  281,  283,  281,  279,  276,  312,  278,  280,  280,
			  280,  280,  280,    0,  312,  280,  281,  281,  281,  281,
			  281,  282,  282,  281,  282,  286,  286,  286,  286,  286,
			  284,  284,  279,  284,  312,  278,  280,  282,  282,  282,
			  282,  282,  312,  333,  282,  336,  284,  284,  284,  284,
			  284,    0,  287,  284,    0,  287,    0,    0,    0,  285,
			  285,  287,  285,  358,  324,  282,  288,  288,  288,  288,
			  288,  333,  337,  336,  284,  285,  285,  285,  285,  285,
			  287,  338,  285,  287,  288,  289,  289,  324,  289,  287,
			  290,  290,  324,  290,  291,  291,    0,  291,  292,  292,

			  337,  292,    0,  285,  293,  293,  340,  293,  289,  338,
			    0,    0,  288,  290,    0,  295,  295,  291,  295,  292,
			  334,  292,  334,  294,  294,    0,  294,  293,  289,    0,
			  296,  296,  291,  296,  340,  293,  297,  297,  295,  297,
			  358,  358,  298,  298,    0,  298,  294,    0,  334,    0,
			  334,    0,    0,  296,    0,    0,  289,  295,    0,  297,
			  291,    0,  355,  293,  294,  298,  306,  341,  306,  306,
			  306,  306,  306,  307,  357,  307,  307,  307,  307,  307,
			  325,  330,  331,  339,  296,  295,  330,  331,  342,  332,
			  298,  325,  294,  332,  343,  341,  344,  339,  345,  346,

			  350,  343,  325,  348,  352,  353,  359,  427,  349,  330,
			  331,  339,  325,  348,  330,  331,  342,  332,  298,  349,
			  354,  332,  343,  350,  344,  339,  345,  346,  350,  343,
			  325,  348,  352,  353,  360,  427,  349,  354,  355,  355,
			  355,  348,  361,  369,  369,    0,  369,  349,  354,    0,
			  357,  357,  357,    0,  364,  364,    0,  364,  372,  372,
			  372,  372,  372,  372,    0,  354,  364,    0,  369,    0,
			  378,  378,  378,  378,  378,    0,  364,  379,  379,  379,
			  379,  379,  359,  359,  359,  378,  380,  380,  380,  380,
			  380,  381,  381,  381,  381,  381,  382,  382,  382,  382,

			  382,  383,  383,  383,  383,  383,  364,    0,  378,    0,
			  360,  360,  360,  378,  396,  396,  383,  396,  361,  361,
			  361,  384,    0,  384,  380,    0,  384,  384,  384,  384,
			  384,  385,  385,  385,  385,  385,    0,  396,    0,  383,
			  512,    0,    0,  512,  383,  386,  386,  386,  386,  386,
			  387,  387,  387,  387,  387,  388,  388,    0,  388,  388,
			  388,  388,  388,  389,  389,  389,  389,  389,  390,  390,
			  390,  390,  390,  392,  392,    0,  392,  393,  393,  428,
			  393,    0,  394,  394,    0,  394,  395,  395,  387,  395,
			  397,  397,  512,  397,  398,  398,  392,  398,    0,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  393,  429,    0,  399,  399,  394,  399,  428,  431,  395,
			    0,  433,  429,  397,    0,  392,  401,  398,    0,  400,
			  400,  395,  400,  393,  394,    0,  399,  401,    0,  429,
			  402,  402,  436,  402,  399,  397,  431,  401,  398,  433,
			  429,    0,  400,  392,  403,  403,  400,  403,    0,  395,
			    0,  393,  394,  402,    0,  401,  404,  404,    0,  404,
			  436,    0,  399,  397,    0,  402,  398,  403,  405,  405,
			    0,  405,    0,    0,  400,  406,  406,  430,  406,  404,
			    0,  407,  407,    0,  407,  408,  408,    0,  408,  403,
			    0,  405,  430,  402,  404,    0,  437,    0,  406,  414,

			  414,  414,  414,  414,  407,  430,  405,  419,  408,  406,
			    0,  409,  409,  409,  409,  409,  410,  403,  419,  410,
			  430,  438,  404,  407,  437,  410,  434,  408,  419,  409,
			  434,  414,  409,    0,  405,    0,    0,  406,  409,  470,
			  470,  470,  470,  470,  410,    0,  419,  410,  441,  438,
			    0,  407,    0,  410,  434,  408,    0,  409,  434,  414,
			  409,  411,  411,  411,  411,  411,  409,  412,  412,  412,
			  412,  412,  413,  413,    0,  413,  441,  417,  417,  411,
			  417,  412,  415,  415,  415,  415,  415,    0,  413,  413,
			  413,  413,  413,    0,  442,  413,  415,  412,  418,  418,

			  417,  418,  413,    0,    0,  420,  420,  411,  420,  412,
			    0,    0,  416,  416,  416,  416,  416,  421,  421,    0,
			  421,  418,  442,    0,  415,  412,  416,  443,  420,    0,
			  413,  432,  439,  422,  422,    0,  422,    0,  423,  423,
			  421,  423,  432,  444,  424,  424,  439,  424,    0,  445,
			  446,  440,  447,  451,  416,  443,  422,  424,  453,  432,
			  439,  423,  421,  422,  440,  423,  450,  424,  448,  449,
			  432,  444,  448,  450,  439,  454,  423,  445,  446,  440,
			  447,  451,  452,  449,  455,  452,  453,  456,  459,  460,
			  421,  422,  440,  423,  450,  455,  448,  449,  456,  461,

			  448,  450,  462,  454,  423,  464,  467,  463,  465,  465,
			  452,  449,  455,  452,    0,  456,  459,  460,  463,  464,
			  515,  516,  517,  455,  467,    0,  456,  461,  484,  484,
			  462,  484,    0,  464,    0,  463,  465,  465,  468,  468,
			  468,  468,  468,    0,  516,    0,  463,  464,  515,  516,
			  517,  484,  467,  468,  469,  469,  469,  469,  469,  471,
			  471,  471,  471,  471,  473,  473,  473,  473,  473,  474,
			  474,  474,  474,  474,  475,  475,  475,  475,  475,  473,
			    0,  468,  476,  476,  476,  476,  476,  477,  477,  477,
			  477,  477,  469,  478,  478,  478,  478,  478,  482,  518,

			  482,    0,  473,  485,  485,  519,  485,  473,  482,  521,
			    0,    0,  475,  480,  480,  480,  480,  480,  481,    0,
			  481,  481,  481,  481,  481,  477,  485,  518,  480,  486,
			  486,  526,  486,  519,  527,    0,  482,  521,  487,  487,
			    0,  487,  488,  488,    0,  488,  489,  489,    0,  489,
			  490,  490,  486,  490,  523,  523,  480,  485,    0,  526,
			  486,  487,  527,  491,  491,  488,  491,  493,  493,  489,
			  493,    0,  488,  490,  528,  529,  487,  489,  494,  494,
			    0,  494,  523,  523,  495,  495,  491,  495,  486,  489,
			  493,  496,  496,    0,  496,    0,    0,  530,  493,  491,

			  488,  494,  528,  529,  487,  489,    0,  495,  494,  497,
			  497,    0,  497,    0,  496,  498,  498,  489,  498,  495,
			  499,  499,  522,  499,  504,  530,  493,  491,  509,    0,
			    0,    0,  497,    0,  522,  504,  494,  532,  498,  509,
			  497,  508,  508,  499,  508,  504,    0,  495,    0,  509,
			  522,  499,  500,  500,  500,  500,  500,  498,  501,  501,
			  535,  501,  522,  504,  508,  532,  500,  509,  497,  502,
			  502,  502,  502,  502,  503,  503,  503,  503,  503,  499,
			  508,  501,    0,  502,  520,  498,  505,  505,  535,  505,
			  502,  520,    0,  536,  500,  503,  502,  506,  506,    0,

			  506,  524,  501,  537,  507,  507,  534,  507,  508,  505,
			  534,  502,  520,  524,  533,  533,  538,  505,  502,  520,
			  506,  536,  539,  503,  502,  540,  541,  507,  506,  524,
			  542,  537,  543,  539,  534,  544,  545,  546,  534,  550,
			  588,  524,  533,  533,  538,  505,  507,    0,  564,  564,
			  539,  564,    0,  540,  541,    0,  506,    0,  542,    0,
			  543,  539,  550,  544,  545,  546,    0,  550,  588,    0,
			  547,  564,  547,    0,  507,  547,  547,  547,  547,  547,
			  548,  548,  548,  548,  548,  549,  549,  549,  549,  549,
			  551,  551,  551,  551,  551,    0,  552,  552,  552,  552,

			  552,  560,  560,  560,  560,  551,  553,  553,  553,  553,
			  553,  554,  554,  554,  554,  554,  590,    0,  548,  555,
			  555,  555,  555,  555,  556,  556,  556,  556,  556,  687,
			  687,  687,    0,  551,  552,  557,  557,  557,  557,  557,
			  558,    0,  558,    0,  590,  558,  558,  558,  558,  558,
			  559,  559,  559,  559,  559,  570,    0,  555,  562,  562,
			  562,  562,  562,  563,  563,    0,  563,  687,  565,  565,
			  591,  565,  570,  562,  566,  566,  570,  566,    0,  567,
			  567,    0,  567,    0,  568,  568,  563,  568,    0,    0,
			  563,  565,    0,  569,  569,  565,  569,  566,  591,    0,

			  570,  562,  567,  571,  571,  566,  571,  568,  572,  572,
			  593,  572,  573,  573,    0,  573,  569,  567,  563,  574,
			  574,    0,  574,  565,  575,  575,  571,  575,    0,  569,
			    0,  572,  592,  566,    0,  573,  592,    0,  593,  572,
			  576,  576,  574,  576,  594,  567,  571,  575,  577,  577,
			  577,  577,  577,    0,    0,  575,  573,  569,  579,  579,
			  592,  579,  574,  576,  592,  580,  580,  572,  580,  577,
			  576,  583,  594,    0,  571,  577,  581,  581,  596,  581,
			  584,  579,  583,  575,  573,  598,  582,  582,  580,  582,
			  574,  584,  583,  597,  599,  600,  601,  577,  576,  581,

			  597,  584,  602,  577,  604,  581,  596,  580,  603,  582,
			  583,  606,  605,  598,  607,  608,  582,  609,  610,  584,
			  603,  597,  599,  600,  601,  605,  607,  613,  597,  614,
			  602,  615,  604,  581,  616,  580,  603,  611,  611,  606,
			  605,  617,  607,  608,  582,  609,  610,    0,  603,  818,
			  818,  818,  617,  605,  607,  613,    0,  614,    0,  615,
			    0,  653,  616,    0,    0,  611,  611,    0,    0,  617,
			  618,  618,  618,  618,  618,  619,  619,  619,  619,  619,
			  617,  620,  620,  620,  620,  620,  621,  818,  621,  653,
			    0,  621,  621,  621,  621,  621,  622,  625,  622,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,  622,  622,  622,  622,  622,  623,  623,  623,  623,
			  623,  624,  624,  624,  624,  624,    0,    0,  637,  637,
			  625,  637,    0,    0,    0,  625,  626,  626,  626,  626,
			  626,  627,  627,  627,  627,  627,  629,  629,  629,  629,
			  629,  637,    0,    0,  623,  630,  630,  630,  630,  630,
			  631,  631,  631,  631,  631,  633,  633,  633,  633,  633,
			  634,  640,  634,    0,  654,  634,  634,  634,  634,  634,
			  633,  635,  635,    0,  635,    0,  636,  636,  640,  636,
			  638,  638,  640,  638,  639,  639,  657,  639,  641,  641,
			    0,  641,  654,  633,  635,    0,    0,  658,  633,  636,

			  647,  642,  642,  638,  642,    0,  640,  639,  663,  638,
			    0,  641,  636,  635,  657,  643,  643,  647,  643,  644,
			  644,  647,  644,  655,  642,  658,  645,  645,  655,  645,
			  646,  646,  659,  646,  659,    0,  663,  638,  643,  664,
			  636,  635,  644,  648,  648,  647,  648,  649,  649,  645,
			  649,  655,  665,  646,  650,  650,  655,  650,  666,  668,
			  659,  669,  659,  643,  645,  671,  648,  664,  672,  673,
			  649,  674,  671,  675,  648,  666,  676,  650,  703,  704,
			  665,  649,  706,  707,  709,  650,  666,  668,    0,  669,
			    0,  643,  645,  671,    0,    0,  672,  673,    0,  674,

			  671,  675,  648,  666,  676,    0,  703,  704,    0,  649,
			  706,  707,  709,  650,  678,  678,  678,  678,  678,  679,
			  679,  679,  679,  679,  680,  680,  680,  680,  680,  681,
			  681,  681,  681,  681,  682,  682,  682,  682,  682,  683,
			    0,  683,    0,    0,  683,  683,  683,  683,  683,  686,
			  686,  686,  686,  686,    0,  710,    0,  679,  688,  688,
			  688,  688,  688,  689,  689,  689,  689,  689,  690,  690,
			  690,  690,  690,  688,  691,  691,  712,  691,  697,  692,
			  692,    0,  692,  710,  693,  693,    0,  693,  695,  695,
			  711,  695,  711,    0,    0,  697,  688,  691,    0,  697,

			    0,  688,  692,  691,  712,    0,  690,  693,    0,  696,
			  696,  695,  696,  713,  692,  693,  698,  698,  711,  698,
			  711,  699,  699,  697,  699,  700,  700,    0,  700,  701,
			  702,  691,  696,  701,  702,  735,  705,  736,  696,  698,
			  705,  713,  692,  693,  699,    0,  698,    0,  700,    0,
			  701,  702,  699,  715,  715,  716,  716,  716,  716,  716,
			    0,  701,  702,  735,  705,  736,  696,    0,  705,  718,
			  718,  718,  718,  718,  698,  719,  719,  719,  719,  719,
			  699,  715,  715,  720,  720,  720,  720,  720,  721,  721,
			  721,  721,  721,  716,  722,  722,  722,  722,  722,  723,

			  723,  723,  723,  723,  725,  725,  725,  725,  725,  726,
			  726,  739,  726,  719,  727,  727,    0,  727,  728,  728,
			  740,  728,  729,  729,    0,  729,  731,  731,    0,  731,
			    0,  733,  726,  732,  732,  733,  732,  727,  737,  739,
			  734,  728,  725,  726,  734,  729,  741,  743,  740,  731,
			  744,  737,  733,  729,    0,  755,  732,  756,  727,  751,
			  751,  734,  751,  733,    0,    0,  737,  791,  791,  791,
			  791,  726,  734,    0,  741,  743,    0,  732,  744,  737,
			    0,  729,  751,  755,    0,  756,  727,  745,  745,  745,
			  745,  745,  747,  747,  747,  747,  747,  749,  749,  758,

			  749,  748,  751,  748,  757,  732,  748,  748,  748,  748,
			  748,  750,  750,  760,  750,  752,  752,  759,  752,  769,
			  749,  757,    0,  763,  763,  745,  763,  758,  749,  759,
			  751,    0,  757,    0,  750,    0,    0,    0,  752,  748,
			    0,  760,    0,  771,    0,  759,  763,  769,  773,  757,
			  762,  762,  762,  762,  762,    0,  749,  759,  774,  750,
			    0,  764,  764,  752,  764,  765,  765,  763,  765,  766,
			  766,  771,  766,    0,    0,  767,  773,  768,  775,  775,
			  775,  775,  775,  767,  764,  768,  774,  750,  765,  779,
			    0,  752,  766,  781,  782,  763,  767,  779,  768,  776,

			  776,  776,  776,  776,  777,  777,    0,  777,  788,  766,
			  779,  767,  780,  768,  796,  778,  778,    0,  778,    0,
			  780,  781,  782,    0,  783,  779,  783,  777,  784,  784,
			    0,  784,    0,  780,  783,    0,  788,  766,  778,  794,
			  785,  785,  796,  785,  793,  793,  778,  793,  780,    0,
			  794,  784,  777,  790,  790,  790,  790,  790,  795,    0,
			  794,    0,  783,  785,    0,    0,    0,  793,  784,  795,
			  799,  799,    0,  799,  778,  793,    0,    0,  794,  795,
			  777,  797,  797,  797,  797,  797,  798,  798,  798,  798,
			  798,  800,    0,  799,  801,    0,  784,  795,  809,  809,

			  809,  809,  800,  793,    0,  801,  803,  803,  803,  803,
			  803,  804,  800,  804,  811,  801,  807,  807,  807,  807,
			  807,  804,  808,  808,  808,  808,  808,  812,    0,    0,
			  800,  811,    0,  801,    0,  811,  813,  813,  813,  813,
			  813,  815,    0,  816,  812,    0,    0,    0,  812,  804,
			  814,  814,  814,  814,  814,    0,    0,    0,  815,  811,
			  816,    0,  815,    0,  816,  817,  817,  817,  817,  817,
			    0,    0,  812,  821,  821,  821,  821,  821,  822,  822,
			  822,  822,  822,    0,    0,    0,  815,    0,  816,  823,
			  823,  823,  823,  823,  825,  825,  825,  825,  825,  826,

			    0,  826,    0,    0,  826,  826,  826,  826,  826,  827,
			  827,  827,  827,  827,  828,  828,  828,  828,  828,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  826,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,

			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  833,  833,  833,  833,  833,  833,  833,  833,  833, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  834,  834,    0,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,    0,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  835,  835,    0,  835,  835,  835,  835,

			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  837,  837,  837,
			    0,    0,    0,    0,    0,    0,    0,  837,  837,    0,
			  837,    0,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,

			  837,  837,  837,  837,  837,    0,    0,  837,  837,  837,
			  837,  837,  837,  837,  837,  838,  838,    0,  838,  838,
			    0,  838,  838,    0,    0,    0,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,    0,
			    0,  838,  838,  838,  838,  838,  838,  838,  838,  839,
			  839,    0,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,

			  839,  839,  839,  839,  839,  839,  839,  839,  839,  839,
			  840,  840,    0,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,    0,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,

			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,    0,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  843,    0,  843,    0,    0,    0,    0,
			  843,  843,    0,  843,  843,    0,    0,    0,  843,  843,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  843,  843,  843,  843,  843,  843,  843,  843,  843,

			  843,    0,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,

			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  846,  846,    0,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  847,    0,    0,    0,    0,  847,
			  847,    0,    0,    0,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,    0,    0,  847,

			  847,  847,  847,  847,  847,  847,  847,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,    0,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,

			  849,  849,  849,  849,  849,  849,  849,  849,  849,  850,
			    0,    0,    0,  850,  850,    0,  850,  850,  850,  850,
			  850,  850,  850,  850,  850,  850,  850,  850,  850,  850,
			  850,  850,  850,  850,  850,  850,  850,  850,  850,  850,
			  850,    0,    0,  850,  850,  850,  850,  850,  850,  850,
			  850,  851,  851,    0,  851,  851,    0,  851,  851,  851,
			    0,    0,  851,  851,  851,  851,  851,  851,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  851,  851,  851,
			  851,  851,  851,  851,  851,    0,    0,  851,  851,  851,
			  851,  851,  851,  851,  851,  852,  852,  852,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,  852,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,  852,  852,
			  852,  852,  852,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  852,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  854,    0,  854,    0,    0, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  854,  854,    0,  854,  854,    0,    0,    0,
			  854,  854,  854,  854,  854,  854,  854,  854,  854,  854,
			  854,  854,  854,  854,  854,  854,  854,  854,  854,  854,
			  854,  854,  854,    0,    0,  854,  854,  854,  854,  854,
			  854,  854,  854,  855,  855,  855,    0,    0,  855,  855,
			  855,  855,  855,  855,  855,  855,  855,    0,    0,  855,
			  855,  855,  855,  855,  855,  855,  855,  855,  855,  855,
			  855,  855,  855,  855,  855,  855,  855,  855,  855,  855,
			  855,  855,    0,    0,  855,  855,  855,  855,  855,  855,
			  855,  855,  856,    0,  856,    0,    0,    0,    0,  856,

			  856,    0,  856,  856,    0,    0,    0,  856,  856,  856,
			  856,  856,  856,  856,  856,  856,  856,  856,  856,  856,
			  856,  856,  856,  856,  856,  856,  856,  856,  856,  856,
			    0,  856,  856,  856,  856,  856,  856,  856,  856,  856,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,    0,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  829,  829,  829,  829,  829,  829,  829,  829,  829,

			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829, yy_Dummy>>,
			1, 282, 5000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   88,   93,   75,   76,    0,    0,  183,
			    0,   67,   70, 1028, 5191,   97, 1013,  988, 1003, 5191,
			   89,    0, 5191, 5191, 5191, 5191,  984,   87,  981,   96,
			  105, 5191, 5191,  968, 5191,  966,  959,  272,  276,  282,
			  128,  293,  288,  297,  323,  318,  347,  351,  422,  362,
			  406,  376,  410,  422, 5191, 5191,  929,  499,  576,  103,
			   78,  415,  247,  101,  426,  111,  102,  425,  322,  422,
			  336,  430,  958, 5191, 5191,  960,  145, 5191,  106,  337,
			  275,  422,  308,  429,  318, 5191,  422,  861, 5191,  287,
			  903,  577,  653, 5191,   77,  706, 5191,  165,  899, 5191,

			  892, 5191,  887,    0,  650,  864,  852,  822,  643, 5191,
			  505,  660,  669,  676,  744, 5191, 5191, 5191,  765,  769,
			    0,  773,  777,  781,  786,  802,  807,  819,  826,  832,
			  837,  856,  863,  868,  884,  898,  880,  910,  895,  944,
			  949, 1024,  961,  958,  986, 1010, 1015,  998, 1062,  980,
			  807,  663,  763, 5191,  322,  805, 1112,  797,   92,  107,
			  254,  313, 1056,  762,  668,  596,  366,  792,  358,  846,
			  404, 1031,  875, 1061,  419,  508,  895, 1038,  780,  736,
			  560,  898,  736, 1053, 1069,  667,  638, 1005,  656, 1072,
			  742,  785, 1022, 1076,  816,  816,  834, 1068, 1075,  877,

			 1158,  904,  952, 1060,  956, 1159, 5191,  778, 5191,  549,
			 5191, 5191, 1063,  504, 1117, 1120, 1131, 1140, 5191, 1141,
			  728, 5191,  266,  867, 1224, 5191,  774, 1226,  402, 1280,
			  588,  303, 1369, 5191, 5191,  705, 1205, 5191, 5191, 5191,
			  722, 1142,  718,  717,  710,  705, 1231,  711, 5191, 1403,
			 1239, 1223, 1244, 5191, 1409, 1254, 1370, 1147, 1357, 5191,
			  683, 1430, 1435, 1441, 1446, 1470, 1475, 1480, 1487, 1494,
			 1508, 1419, 1504, 1518, 1522, 1532, 1546, 1550, 1560, 1571,
			 1590, 1598, 1619, 1577, 1628, 1657, 1607, 1616, 1648, 1683,
			 1688, 1692, 1696, 1702, 1721, 1713, 1728, 1734, 1740,  682,

			 5191, 5191,  658, 1000, 1070,    0, 1750, 1757, 1080, 1517,
			 1086, 1155, 1573, 1165, 1484, 1178, 1180, 1204, 1218, 1401,
			 1408, 1411,  610, 1493, 1631, 1763, 1456, 1465, 1503, 1524,
			 1748, 1749, 1756, 1612, 1689,    0, 1612, 1625, 1648, 1750,
			 1673, 1727, 1755, 1761, 1763, 1755, 1755,  604, 1770, 1775,
			 1767,    0, 1771, 1755, 1787, 1755,  329, 1767, 1656, 1799,
			 1827, 1835, 5191,  601, 1852, 5191,  914, 1378,  513, 1841,
			 5191, 5191, 1841, 5191, 5191, 5191, 5191, 5191, 1852, 1859,
			 1868, 1873, 1878, 1883, 1908, 1913, 1927, 1932, 1940, 1945,
			 1950,  488, 1971, 1975, 1980, 1984, 1912, 1988, 1992, 2001,

			 2017, 1988, 2028, 2042, 2054, 2066, 2073, 2079, 2083, 2093,
			 2080, 2143, 2149, 2170, 2081, 2164, 2194, 2175, 2196, 2079,
			 2203, 2215, 2231, 2236, 2242,  598,    0, 1763, 1931, 1968,
			 2044, 1964, 2198, 1974, 2093,    0, 1985, 2050, 2088, 2199,
			 2218, 2115, 2165, 2194, 2206, 2202, 2210, 2212, 2235, 2236,
			 2233, 2217, 2249, 2214, 2231, 2251, 2254,    0,    0, 2255,
			 2256, 2252, 2270, 2278, 2272, 2276,  495, 2291, 2320, 2336,
			 2121, 2341,  488, 2346, 2351, 2356, 2364, 2369, 2375,  478,
			 2395, 2402, 2385,  777, 2326, 2401, 2427, 2436, 2440, 2444,
			 2448, 2461,  450, 2465, 2476, 2482, 2489, 2507, 2513, 2518,

			 2534, 2556, 2551, 2556, 2496, 2584, 2595, 2602, 2539, 2500,
			  794,  948, 1938,    0,  396, 2287, 2288, 2289, 2366, 2365,
			 2551, 2377, 2489, 2422, 2568,    0, 2393, 2401, 2441, 2443,
			 2460,    0, 2504, 2582, 2573, 2527, 2560, 2559, 2583, 2589,
			 2592, 2593, 2597, 2588, 2594, 2603, 2604, 2657, 2662, 2667,
			 2606, 2672, 2678, 2688, 2693, 2701, 2706, 2717, 2727, 2732,
			 2683, 5191, 2740, 2761, 2646, 2766, 2772, 2777, 2782, 2791,
			 2727, 2801, 2806, 2810, 2817, 2822, 2838, 2830,  427, 2856,
			 2863, 2874, 2884, 2843, 2852,  349, 5191, 5191, 2611,    0,
			 2683, 2741, 2803, 2777, 2804,    0, 2845, 2860, 2852, 2856,

			 2850, 2863, 2856, 2875, 2871, 2879, 2866, 2881, 2882, 2885,
			 2885, 2905,    0, 2883, 2898, 2899, 2901, 2908, 2952, 2957,
			 2963, 2973, 2983, 2988, 2993, 2964, 3008, 3013,  404, 3018,
			 3027, 3032, 5191, 3037, 3047, 3069, 3074, 3016, 3078, 3082,
			 3033, 3086, 3099, 3113, 3117, 3124, 3128, 3072, 3141, 3145,
			 3152,  403,  374, 2917, 3026, 3090,    0, 3055, 3064, 3101,
			    0,    0,    0, 3058, 3106, 3119, 3125,    0, 3126, 3121,
			    0, 3132, 3135, 3136, 3135, 3140, 3143,  329, 3196, 3201,
			 3206, 3211, 3216, 3226,  324,  565, 3231, 2716, 3240, 3245,
			 3250, 3272, 3277, 3282, 5191, 3286, 3307, 3250, 3314, 3319,

			 3323, 3301, 3302, 3147, 3142, 3303, 3149, 3150,    0, 3151,
			 3224, 3259, 3244, 3280,    0, 3321, 3337,  317, 3351, 3357,
			 3365, 3370, 3376, 3381, 5191, 3386, 3407, 3412, 3416, 3420,
			 5191, 3424, 3431, 3403, 3412, 3299, 3291, 3405,    0, 3378,
			 3387, 3413,    0, 3401, 3417, 3469,  259, 3474, 3488, 3495,
			 3509, 3457, 3513,  715, 5191, 3422, 3407, 3471, 3454, 3484,
			 3463,  136, 3532, 3521, 3559, 3563, 3567, 3547, 3549, 3473,
			    0, 3510,    0, 3515, 3516, 3560, 3581, 3602, 3613, 3561,
			 3584, 3543, 3561, 3611, 3626, 3638,  280,  271, 3566,    0,
			 3635, 3449, 5191, 3642, 3611, 3630, 3581, 3663, 3668, 3668,

			 3663, 3666,    0, 3688, 3698,   99,   97, 3698, 3704, 3680,
			 5191, 3686, 3699, 3718, 3732, 3713, 3715, 3747, 2936, 5191,
			 5191, 3755, 3760, 3771, 5191, 3776, 3786, 3791, 3796, 5191,
			 3837, 3888, 3939, 3990, 4041, 4092, 4127, 4165, 4209, 4258,
			 4309, 4360, 4411, 4461, 4510, 4561, 4612, 4657, 4706, 4757,
			 4801, 4845, 4893, 4943, 4993, 5042, 5090, 5139, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  829,    1,  830,  830,  831,  831,  832,  832,  829,
			    9,  833,  833,  829,  829,  829,  829,  829,  834,  829,
			  835,  836,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  838,  829,  829,  839,  829,  829,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  829,  829,  829,  840,  829,  829,  829,  840,
			  840,  840,  840,  840,  841,  829,  841,  842,  829,  843,
			  829,  843,  843,  829,  844,  845,  829,  829,  829,  829,

			  834,  829,  846,  846,  846,  847,  848,  829,  829,  829,
			  829,  849,  829,  829,  829,  829,  829,  829,  829,  837,
			  850,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,   48,  837,
			  837,  837,  837,   48,  837,  837,  837,  837,  837,  837,
			  851,  838,  839,  829,  829,  829,   58,  829,  156,  156,
			  156,   58,   58,   58,   58,   58,  156,   58,  156,   58,
			  156,  156,   58,   58,  156,  156,   58,   58,  156,   58,
			  156,  156,  156,   58,   58,   58,  156,   58,  156,   58,
			  156,  156,   58,   58,  156,  156,   58,   58,  156,  156,

			   58,   58,  156,   58,  156,   58,  829,  840,  829,  829,
			  829,  829,  840,  840,  840,  840,  840,  841,  829,  841,
			  842,  829,  842,  843,  843,  829,  829,  829,  829,  829,
			  829,  844,  845,  829,  829,  232,  852,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  850,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  829,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  141,  141,  141,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  829,

			  829,  829,  829,  156,  156,  156,  829,  156,   58,   58,
			   58,  156,   58,  156,   58,  156,  156,  156,   58,   58,
			   58,  156,  156,   58,   58,  829,  156,  156,  156,  156,
			   58,   58,   58,  156,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,   58,   58,  156,  156,  156,   58,   58,
			   58,  156,   58,  156,   58,  840,  840,  840,  840,  840,
			  840,  840,  829,  853,  853,  829,  853,  853,  853,  852,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  850,  837,  837,  837,  837,  837,  837,  837,  837,

			  837,  829,  837,  837,  837,  837,  837,  837,  837,  141,
			  141,  409,  409,  837,  138,  413,  413,  837,  837,  829,
			  837,  837,  837,  837,  837,  854,  855,  156,  156,   58,
			   58,  156,   58,  156,   58,  156,  156,  156,   58,   58,
			   58,  156,  156,   58,  156,  156,  156,  156,   58,   58,
			   58,  156,   58,  156,  156,   58,   58,  156,  156,   58,
			   58,  156,  156,  156,   58,   58,  156,   58,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  849,  829,  829,  829,  837,  837,  837,  837,  837,  837,
			  837,  837,  829,  837,  837,  837,  837,  837,  837,  837,

			  413,  837,  413,  502,  829,  837,  837,  837,  837,  829,
			  829,  856,  854,  156,  156,   58,   58,  156,   58,  156,
			   58,  156,  156,   58,   58,  156,  156,   58,  156,  156,
			  156,  156,   58,   58,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,  156,  156,   58,   58,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  857,  837,  837,  837,  837,  837,  837,  837,
			  829,  837,  837,  837,  837,  837,  837,  502,  829,  837,
			  837,  837,  837,  829,  829,  856,  829,  829,  156,  156,
			   58,  156,   58,  156,  156,  156,   58,   58,   58,  156,

			  156,  156,  156,   58,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,  156,  156,   58,   58,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  837,  837,  837,  837,  837,
			  829,  837,  837,  837,  837,  837,  837,  829,  837,  837,
			  837,  829,  829,  156,  156,   58,  156,  156,   58,   58,
			  156,  156,  156,  156,   58,   58,   58,  156,   58,  156,
			  156,   58,   58,  156,  156,  156,   58,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  837,  837,  837,  829,  837,  837,  829,  837,  837,

			  837,  829,  829,  156,  156,   58,  156,   58,  156,   58,
			  156,   58,  156,  156,  156,   58,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  837,  837,  837,  837,
			  829,  837,  837,  829,  829,  156,  156,   58,  156,   58,
			  156,   58,  156,  156,   58,  829,  829,  829,  829,  837,
			  837,  837,  837,  829,  829,  156,  156,   58,  156,   58,
			  156,  829,  829,  837,  837,  837,  837,  829,  829,  156,
			  156,   58,  156,   58,  156,  829,  829,  837,  837,  829,
			  829,  156,  156,  829,  837,  837,  829,  829,  156,  156,
			  829,  829,  829,  837,  829,  829,  156,  829,  829,  837,

			  829,  829,  156,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,    0,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  829,  829,  829,  829,  829,  829, yy_Dummy>>)
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
			   81,   82,   81,   82,   81,   81,   88,   95,   88,   88,
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

			   95,    0,   95,   95,   95,   95,   95,   95,   95,   95,
			   80,   95,   95,   95,   95,   80,   80,   80,   37,    0,
			   44,   95,   95,   95,   95,   66,   62,   98,   98,   98,
			   98,   98,   98,   98,   98,   38,   98,   98,   38,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   37,   44,   37,
			   44,   98,   98,   98,   98,   98,   98,   98,  107,  107,
			    0,    0,  104,  107,    0,  106,    0,  106,    0,    0,
			    0,  103,   77,    0,   60,   95,   95,   95,   95,   95,
			   45,   95,    0,   95,   95,   95,   36,   95,   95,   95,

			   82,   81,   95,   95,    0,   95,   95,   95,   95,    0,
			   66,   66,    0,   60,   98,   60,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   45,   98,   45,   98,   98,
			   98,   36,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,    0,  107,    0,
			  110,  107,  106,    0,    0,  106,    0,    0,  105,    0,
			    0,   77,    0,   95,   61,   95,   95,   95,   47,   95,
			    0,   95,   95,   95,   95,   95,   95,   95,    0,   53,
			   95,   95,   95,    0,    0,    0,   64,   63,   98,   61,
			   61,   98,   98,   98,   98,   47,   98,   98,   47,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   53,   98,   98,   98,   53,   98,    0,  107,
			    0,    0,    0,  106,    0,  110,  106,    0,   79,    0,
			    0,    0,  108,  110,  108,   95,   95,   59,   95,   46,
			    0,   43,   58,   95,   35,   95,   51,    0,   95,   95,
			   95,    0,    0,   98,   98,   98,   59,   98,   59,   98,
			   46,   43,   58,   98,   43,   58,   98,   35,   35,   98,
			   51,   98,   51,   98,   98,   98,   98,  110,    0,  110,
			    0,  106,    0,    0,  109,    0,    0,   76,  110,    0,
			  109,   95,   95,   95,   85,   54,   95,    0,   95,   95,

			   55,    0,    0,   98,   98,   98,   98,   98,   54,   54,
			   98,   98,   98,   98,   55,   98,  110,  109,    0,  109,
			    0,    0,    0,    0,   76,  109,   95,   95,   48,   95,
			   84,   52,   95,    0,    0,   98,   98,   98,   48,   48,
			   98,   98,   52,   98,   52,  109,   78,    0,   76,   95,
			   95,   95,   95,   83,   83,   98,   98,   98,   98,   98,
			   98,    0,    0,   95,   50,   49,   95,    0,    0,   98,
			   50,   50,   49,   49,   98,    0,    0,   95,   95,    0,
			    0,   98,   98,   75,   95,   56,    0,    0,   98,   56,
			    0,    0,   75,   95,    0,    0,   98,    0,    0,   57,

			    0,    0,   57,    0,   74,    0,    0,    0,    0,    0,
			   74,    0,    0,    0,    0,    0,    0,    0,   73,   86,
			   87,    0,    0,    0,   73,    0,   73,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 5191
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 829
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 830
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
