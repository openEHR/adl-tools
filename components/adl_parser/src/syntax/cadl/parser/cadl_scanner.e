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

	yy_execute_eof_action (yy_sc: INTEGER)
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

	yy_nxt_template: SPECIAL [INTEGER]
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

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
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
			  267,  120,  266,  161,  312,  247,  268,  120,  118,  118,
			  271,  118,  120,  342,  269,  118,  118,  156,  118,  246,
			  118,  118,  239,  118,  265,  101,  270,  341,  267,  315,
			  266,  120,  118,  118,  268,  118,  118,  118,  120,  118,
			   98,  342,  269,  120,  273,  161,  226,  274,  272,  156,

			  118,  118,  222,  118,  270,  120,  208,  318,  341,  120,
			  313,  278,  118,  118,  206,  118,  153,  280,  118,  118,
			  347,  118,  273,  120,  275,  274,  272,  161,  117,  116,
			  276,  118,  118,  281,  118,  120,  343,  282,  314,  278,
			  283,  120,  279,  337,  277,  156,  156,  119,  347,  284,
			  316,  285,  118,  118,  120,  118,  317,  322,  276,  347,
			  115,  281,  286,  118,  118,  282,  118,  109,  283,  106,
			  279,  339,  277,  161,  161,  120,  293,  284,  316,  285,
			  118,  118,  139,  118,  317,  324,  120,  350,  119,  119,
			  119,  119,  119,  139,  118,  118,  286,  118,  142,  118, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  118,  351,  118,  120,  293,  327,  101,  286,  328,   99,
			  139,  291,  118,  118,  292,  118,  286,  120,   98,  834,
			  119,  139,  120,  338,  156,  296,  142,  118,  118,  351,
			  118,  834,  156,  327,  294,  120,  328,  321,  295,  291,
			  156,  834,  292,  287,  287,  287,  287,  287,  119,  326,
			  120,  340,  161,  296,  297,  118,  118,  316,  118,  156,
			  161,  288,  294,  317,  289,  323,  295,  156,  161,  306,
			  290,  307,  307,  307,  307,  307,  156,  330,  120,  353,
			  333,  327,  297,  156,  328,  319,  156,  161,  156,  288,
			  342,  320,  289,  345,  156,  161,  156,  346,  290,  834,

			  218,  335,  156,  298,  161,  351,  345,  353,  334,  331,
			  346,  161,  332,  353,  161,  208,  161,  834,  344,  834,
			  834,  345,  161,  208,  161,  346,  208,  221,  834,  336,
			  161,  298,  834,  352,  348,  208,  219,  223,  349,  834,
			  223,  354,  156,  371,  372,  372,  372,  372,  372,  834,
			  378,  378,  378,  378,  378,  381,  381,  381,  381,  381,
			  834,  834,  429,  219,  220,  250,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  251,  225,
			  429,  220,  834,  250,  355,  356,  357,  358,  359,  212,

			  212,  212,  360,  360,  360,  227,  227,  834,  227,  227,
			  834,  361,  361,  361,  834,  834,  834,  228,  228,  369,
			  369,  430,  369,  246,  246,  834,  246,  230,  230,  379,
			  834,  379,  834,  834,  380,  380,  380,  380,  380,  382,
			  382,  382,  382,  382,  236,  386,  377,  386,  834,  430,
			  387,  387,  387,  387,  387,  834,  834,  225,  225,  363,
			  364,  365,  363,  364,  363,  363,  363,  363,  363,  363,
			  363,  363,  366,  229,  229,  363,  229,  229,  229,  229,
			  229,  363,  367,  363,  363,  363,  363,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  363,  363,  368,  363,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  235,
			  235,  834,  235,  389,  389,  389,  389,  390,  390,  390,
			  390,  390,  110,  834,  111,  834,  388,  388,  388,  388,
			  388,  834,  366,  365,  236,  366,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  383,

			  383,  383,  383,  383,  113,  834,  208,  118,  118,  834,
			  118,  401,  118,  118,  384,  118,  118,  118,  834,  118,
			  118,  118,  401,  118,  118,  118,  834,  118,  237,  834,
			  120,  834,  401,  118,  118,  120,  118,  385,  392,  120,
			  834,  429,  384,  120,  156,  118,  118,  120,  118,  433,
			  401,  393,  118,  118,  395,  118,  120,  118,  118,  394,
			  118,  834,  118,  118,  396,  118,  392,  834,  120,  431,
			  118,  118,  161,  118,  834,  120,  435,  433,  208,  393,
			  120,  397,  395,  215,  215,  120,  156,  394,  118,  118,
			  834,  118,  396,  120,  430,  398,  118,  118,  834,  118,

			  399,  834,  118,  118,  435,  118,  402,  118,  118,  397,
			  118,  120,  118,  118,  161,  118,  400,  118,  118,  120,
			  118,  834,  432,  398,  403,  120,  118,  118,  399,  118,
			  120,  404,  834,  834,  402,  120,  406,  405,  834,  834,
			  120,  409,  409,  409,  409,  409,  435,  156,  834,  120,
			  118,  118,  403,  118,  212,  212,  212,  408,  437,  404,
			  118,  118,  407,  118,  406,  405,  410,  410,  410,  410,
			  410,  834,  834,  120,  436,  161,  412,  412,  412,  412,
			  412,  118,  118,  120,  118,  408,  437,  834,  367,  365,
			  407,  367,  118,  118,  411,  118,  834,  413,  413,  413,

			  413,  413,  834,  416,  120,  438,  156,  439,  414,  414,
			  414,  414,  414,  834,  433,  120,  119,  119,  119,  119,
			  119,  118,  118,  417,  118,  411,  418,  119,  119,  119,
			  119,  119,  419,  438,  161,  439,  411,  415,  415,  415,
			  415,  415,  434,  437,  120,  119,  118,  118,  443,  118,
			  834,  417,  118,  118,  418,  118,  118,  118,  834,  118,
			  419,  118,  118,  446,  118,  411,  834,  118,  118,  120,
			  118,  440,  834,  119,  834,  120,  443,  118,  118,  120,
			  118,  834,  421,  834,  120,  118,  118,  834,  118,  290,
			  120,  446,  118,  118,  420,  118,  118,  118,  422,  118,

			  120,  118,  118,  834,  118,  834,  834,  306,  120,  306,
			  306,  306,  306,  306,  156,  120,  447,  290,  423,  120,
			  156,  834,  420,  156,  120,  438,  422,  424,  306,  156,
			  307,  307,  307,  307,  307,  439,  302,  444,  448,  449,
			  834,  443,  161,  453,  447,  156,  423,  401,  161,  426,
			  425,  161,  455,  441,  156,  424,  156,  161,  401,  446,
			  156,  447,  456,  442,  448,  156,  448,  449,  401,  445,
			  453,  453,  156,  161,  456,  459,  460,  426,  156,  455,
			  455,  460,  161,  463,  161,  459,  401,  450,  161,  451,
			  456,  464,  452,  161,  156,  156,  156,  156,  454,  468,

			  161,  156,  458,  459,  460,  463,  161,  457,  464,  462,
			  208,  463,  834,  461,  208,  834,  517,  465,  468,  464,
			  208,  834,  161,  161,  161,  161,  208,  468,  834,  161,
			  834,  364,  365,  466,  364,  834,  467,  369,  369,  834,
			  369,  518,  521,  366,  517,  834,  469,  371,  372,  372,
			  372,  372,  372,  367,  523,  834,  470,  470,  470,  470,
			  470,  525,  834,  380,  380,  380,  380,  380,  834,  518,
			  521,  250,  471,  471,  471,  471,  471,  473,  473,  473,
			  473,  473,  523,  368,  834,  834,  214,  214,  214,  525,
			  216,  216,  216,  834,  251,  834,  212,  212,  212,  250,

			  834,  834,  212,  212,  212,  474,  474,  474,  474,  474,
			  472,  475,  475,  475,  475,  475,  476,  834,  476,  834,
			  834,  477,  477,  477,  477,  477,  384,  478,  478,  478,
			  478,  478,  387,  387,  387,  387,  387,  479,  479,  479,
			  479,  479,  484,  484,  484,  484,  484,  118,  118,  385,
			  118,  526,  481,  482,  384,  483,  483,  483,  483,  483,
			  485,  485,  485,  485,  485,  118,  118,  834,  118,  156,
			  120,  118,  118,  834,  118,  480,  834,  118,  118,  526,
			  118,  118,  118,  834,  118,  494,  156,  834,  120,  486,
			  523,  834,  118,  118,  120,  118,  494,  161,  118,  118, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  120,  118,  118,  118,  120,  118,  494,  118,  118,  834,
			  118,  487,  489,  488,  161,  120,  834,  486,  524,  156,
			  529,  120,  834,  834,  494,  120,  834,  834,  118,  118,
			  120,  118,  526,  492,  493,  118,  118,  490,  118,  487,
			  489,  488,  491,  118,  118,  156,  118,  161,  529,  118,
			  118,  120,  118,  834,  118,  118,  517,  118,  120,  834,
			  528,  492,  493,  495,  834,  490,  120,  834,  508,  834,
			  491,  514,  120,  161,  515,  118,  118,  120,  118,  508,
			  496,  497,  118,  118,  519,  118,  834,  498,  499,  508,
			  530,  495,  409,  409,  409,  409,  409,  156,  120,  505,

			  505,  505,  505,  505,  834,  120,  834,  508,  496,  497,
			  529,  119,  518,  532,  119,  498,  499,  500,  530,  502,
			  119,  834,  533,  591,  501,  161,  280,  834,  410,  410,
			  410,  410,  410,  412,  412,  412,  412,  412,  531,  119,
			  520,  532,  119,  156,  834,  500,  282,  502,  119,  503,
			  533,  119,  501,  534,  521,  119,  413,  413,  413,  413,
			  413,  415,  415,  415,  415,  415,  535,  834,  834,  834,
			  281,  161,  118,  118,  282,  118,  834,  503,  834,  119,
			  834,  534,  522,  119,  834,  539,  284,  834,  414,  414,
			  414,  414,  414,  119,  535,  120,  118,  118,  281,  118,

			  834,  834,  504,  506,  506,  506,  506,  506,  507,  507,
			  507,  507,  507,  539,  284,  118,  118,  119,  118,  120,
			  834,  119,  119,  118,  118,  541,  118,  834,  118,  118,
			  504,  118,  118,  118,  834,  118,  118,  118,  120,  118,
			  834,  118,  118,  156,  118,  119,  120,  156,  156,  156,
			  119,  120,  532,  541,  513,  120,  534,  525,  542,  120,
			  156,  533,  510,  511,  120,  156,  156,  156,  539,  545,
			  156,  161,  546,  509,  512,  161,  161,  161,  541,  156,
			  536,  542,  546,  156,  538,  527,  542,  513,  161,  537,
			  510,  511,  547,  161,  161,  161,  540,  545,  161,  156,

			  546,  509,  512,  548,  594,  156,  543,  161,  834,  544,
			  550,  161,  834,  545,  470,  470,  470,  470,  470,  583,
			  547,  552,  552,  552,  552,  552,  834,  161,  834,  551,
			  583,  548,  594,  161,  553,  553,  553,  553,  553,  834,
			  583,  549,  554,  554,  554,  554,  554,  555,  555,  555,
			  555,  555,  477,  477,  477,  477,  477,  551,  583,  472,
			  834,  156,  384,  556,  556,  556,  556,  556,  558,  558,
			  558,  558,  558,  559,  559,  559,  559,  559,  560,  560,
			  560,  560,  560,  834,  593,  385,  563,  834,  563,  161,
			  384,  555,  555,  555,  555,  555,  564,  118,  118,  834,

			  118,  557,  118,  118,  834,  118,  562,  834,  834,  834,
			  482,  480,  483,  483,  483,  483,  483,  594,  118,  118,
			  120,  118,  834,  834,  565,  120,  590,  118,  118,  834,
			  118,  834,  118,  118,  562,  118,  118,  118,  834,  118,
			  834,  120,  588,  118,  118,  595,  118,  834,  596,  568,
			  120,  118,  118,  588,  118,  120,  567,  118,  118,  120,
			  118,  598,  570,  589,  604,  569,  120,  571,  118,  118,
			  834,  118,  834,  834,  120,  592,  596,  568,  156,  572,
			  120,  588,  118,  118,  834,  118,  605,  573,  575,  598,
			  570,  120,  604,  569,  834,  571,  118,  118,  576,  118,

			  118,  118,  834,  118,  834,  120,  161,  572,  834,  118,
			  118,  834,  118,  834,  605,  573,  575,  577,  606,  120,
			  607,  118,  118,  120,  118,  834,  576,  118,  118,  605,
			  118,  578,  120,  581,  581,  581,  581,  581,  505,  505,
			  505,  505,  505,  834,  120,  577,  606,  119,  607,  611,
			  120,  579,  580,  118,  118,  834,  118,  608,  416,  578,
			  506,  506,  506,  506,  506,  582,  118,  118,  834,  118,
			  834,  411,  834,  834,  119,  119,  120,  611,  599,  579,
			  580,  418,  507,  507,  507,  507,  507,  419,  834,  120,
			  600,  118,  118,  582,  118,  586,  599,  584,  118,  118,

			  156,  118,  119,  119,  598,  156,  599,  596,  600,  418,
			  606,  156,  156,  611,  120,  419,  607,  613,  600,  614,
			  614,  120,  585,  586,  602,  584,  617,  618,  161,  619,
			  620,  119,  601,  161,  617,  597,  603,  587,  609,  161,
			  161,  612,  156,  618,  610,  613,  834,  614,  616,  834,
			  585,  658,  156,  613,  617,  618,  834,  619,  620,  727,
			  728,  727,  621,  834,  834,  587,  834,  623,  834,  623,
			  161,  622,  624,  624,  624,  624,  624,  626,  659,  658,
			  161,  615,  624,  624,  624,  624,  624,  625,  625,  625,
			  625,  625,  555,  555,  555,  555,  555,  729,  834,  834,

			  251,  636,  636,  636,  636,  626,  659,  627,  628,  628,
			  628,  628,  628,  629,  629,  629,  629,  629,  834,  834,
			  472,  630,  630,  630,  630,  630,  631,  631,  631,  631,
			  631,  834,  834,  834,  661,  627,  632,  632,  632,  632,
			  632,  633,  633,  633,  633,  633,  557,  634,  834,  634,
			  834,  662,  631,  631,  631,  631,  631,  635,  635,  635,
			  635,  635,  661,  834,  480,  638,  638,  638,  638,  638,
			  118,  118,  834,  118,  834,  118,  118,  834,  118,  662,
			  639,  834,  118,  118,  834,  118,  834,  118,  118,  834,
			  118,  118,  118,  120,  118,  645,  656,  640,  120,  118,

			  118,  834,  118,  118,  118,  120,  118,  656,  639,  641,
			  120,  834,  645,  834,  120,  834,  645,  657,  642,  661,
			  118,  118,  120,  118,  156,  640,  120,  118,  118,  643,
			  118,  118,  118,  665,  118,  656,  834,  641,  834,  644,
			  645,  118,  118,  120,  118,  666,  642,  663,  118,  118,
			  120,  118,  161,  667,  120,  668,  834,  643,  647,  118,
			  118,  665,  118,  646,  120,  118,  118,  644,  118,  834,
			  834,  120,  834,  666,  667,  648,  657,  118,  118,  650,
			  118,  667,  120,  668,  649,  834,  647,  657,  120,  651,
			  280,  646,  581,  581,  581,  581,  581,  657,  118,  118,

			  120,  118,  670,  648,  156,  672,  119,  650,  118,  118,
			  834,  118,  649,  156,  659,  657,  666,  651,  156,  653,
			  662,  120,  156,  674,  156,  675,  674,  654,  675,  156,
			  678,  120,  161,  672,  119,  668,  672,  679,  655,  680,
			  156,  161,  660,  834,  669,  834,  161,  653,  664,  156,
			  161,  674,  161,  675,  676,  654,  677,  161,  678,  834,
			  678,  834,  708,  671,  673,  679,  655,  680,  161,  624,
			  624,  624,  624,  624,  709,  711,  834,  161,  624,  624,
			  624,  624,  624,  682,  682,  682,  682,  682,  681,  683,
			  708,  683,  156,  834,  684,  684,  684,  684,  684,  685, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  688,  685,  709,  711,  686,  686,  686,  686,  686,  686,
			  686,  686,  686,  686,  687,  687,  687,  687,  687,  834,
			  161,  118,  118,  385,  118,  834,  834,  834,  688,  631,
			  631,  631,  631,  631,  689,  689,  689,  689,  689,  631,
			  631,  631,  631,  631,  120,  834,  834,  557,  691,  691,
			  691,  691,  691,  692,  692,  692,  692,  692,  693,  693,
			  693,  693,  693,  694,  699,  694,  834,  713,  695,  695,
			  695,  695,  695,  688,  118,  118,  834,  118,  834,  118,
			  118,  699,  118,  118,  118,  699,  118,  118,  118,  156,
			  118,  118,  118,  834,  118,  713,  385,  120,  834,  834,

			  156,  688,  120,  702,  118,  118,  120,  118,  834,  699,
			  120,  156,  698,  834,  120,  697,  696,  161,  118,  118,
			  702,  118,  118,  118,  702,  118,  156,  120,  161,  118,
			  118,  709,  118,  118,  118,  711,  118,  156,  834,  161,
			  698,  120,  715,  697,  696,  120,  118,  118,  702,  118,
			  118,  118,  120,  118,  161,  156,  120,  118,  118,  710,
			  118,  156,  156,  712,  717,  161,  700,  701,  715,  120,
			  715,  718,  713,  120,  719,  717,  740,  703,  118,  118,
			  120,  118,  834,  161,  704,  834,  741,  743,  705,  161,
			  161,  834,  717,  834,  700,  701,  716,  834,  834,  718,

			  714,  120,  719,  720,  740,  703,  684,  684,  684,  684,
			  684,  834,  704,  732,  741,  743,  705,  721,  721,  721,
			  721,  721,  686,  686,  686,  686,  686,  686,  686,  686,
			  686,  686,  722,  722,  722,  722,  722,  723,  834,  723,
			  834,  732,  724,  724,  724,  724,  724,  726,  726,  726,
			  726,  726,  834,  743,  834,  472,  630,  630,  630,  630,
			  630,  695,  695,  695,  695,  695,  730,  730,  730,  730,
			  730,  688,  118,  118,  834,  118,  735,  118,  118,  834,
			  118,  744,  118,  118,  156,  118,  118,  118,  834,  118,
			  745,  834,  747,  735,  385,  120,  834,  735,  156,  688,

			  120,  731,  741,  738,  480,  120,  834,  738,  733,  120,
			  118,  118,  161,  118,  748,  734,  118,  118,  745,  118,
			  747,  735,  118,  118,  738,  118,  161,  739,  834,  731,
			  742,  739,  745,  120,  156,  738,  733,  747,  156,  120,
			  736,  834,  748,  734,  834,  120,  760,  737,  739,  682,
			  682,  682,  682,  682,  724,  724,  724,  724,  724,  739,
			  746,  834,  161,  834,  834,  749,  161,  834,  736,  750,
			  750,  750,  750,  750,  760,  737,  751,  751,  751,  751,
			  751,  565,  565,  565,  565,  565,  761,  472,  752,  752,
			  752,  752,  752,  753,  753,  753,  753,  753,  689,  689,

			  689,  689,  689,  118,  118,  156,  118,  557,  118,  118,
			  834,  118,  118,  118,  761,  118,  118,  118,  834,  118,
			  118,  118,  834,  118,  834,  758,  120,  118,  118,  758,
			  118,  120,  156,  161,  759,  120,  480,  754,  759,  120,
			  763,  763,  765,  120,  156,  761,  758,  756,  834,  774,
			  120,  775,  755,  118,  118,  759,  118,  758,  834,  834,
			  161,  803,  803,  803,  803,  754,  759,  834,  763,  764,
			  765,  757,  161,  762,  834,  756,  120,  774,  834,  775,
			  755,  722,  722,  722,  722,  722,  767,  767,  767,  767,
			  767,  118,  118,  777,  118,  727,  770,  727,  156,  757,

			  753,  753,  753,  753,  753,  118,  118,  779,  118,  118,
			  118,  156,  118,  786,  120,  775,  834,  118,  118,  557,
			  118,  777,  768,  777,  770,  834,  161,  834,  120,  827,
			  828,  827,  120,  729,  834,  779,  834,  156,  834,  161,
			  120,  786,  156,  776,  781,  781,  781,  781,  781,  834,
			  768,  778,  787,  769,  834,  118,  118,  771,  118,  118,
			  118,  782,  118,  118,  118,  161,  118,  829,  834,  784,
			  161,  785,  788,  788,  788,  788,  788,  784,  120,  785,
			  787,  769,  120,  791,  834,  771,  120,  793,  794,  782,
			  784,  791,  785,  729,  729,  729,  729,  729,  118,  118,

			  834,  118,  801,  783,  791,  784,  792,  785,  807,  118,
			  118,  834,  118,  834,  792,  793,  794,  834,  795,  791,
			  795,  120,  118,  118,  834,  118,  834,  792,  796,  834,
			  801,  783,  120,  805,  118,  118,  807,  118,  118,  118,
			  790,  118,  792,  834,  805,  120,  789,  802,  802,  802,
			  802,  802,  806,  834,  805,  834,  797,  120,  834,  834,
			  834,  120,  798,  806,  118,  118,  834,  118,  790,  804,
			  834,  834,  805,  806,  789,  808,  808,  808,  808,  808,
			  809,  809,  809,  809,  809,  810,  834,  120,  811,  834,
			  798,  806,  819,  819,  819,  819,  810,  804,  834,  811,

			  812,  812,  812,  812,  812,  813,  810,  813,  820,  811,
			  797,  797,  797,  797,  797,  814,  818,  818,  818,  818,
			  818,  821,  834,  834,  810,  820,  834,  811,  834,  820,
			  822,  822,  822,  822,  822,  824,  834,  825,  821,  834,
			  834,  834,  821,  815,  823,  823,  823,  823,  823,  834,
			  834,  834,  824,  820,  825,  834,  824,  834,  825,  826,
			  826,  826,  826,  826,  834,  834,  821,  815,  815,  815,
			  815,  815,  830,  830,  830,  830,  830,  834,  834,  834,
			  824,  834,  825,  831,  831,  831,  831,  831,  832,  832,
			  832,  832,  832,  827,  834,  827,  834,  834,  831,  831,

			  831,  831,  831,  833,  833,  833,  833,  833,  829,  829,
			  829,  829,  829,  834,  834,  834,  834,  834,  834,  834,
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

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
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

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
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

	yy_chk_template: SPECIAL [INTEGER]
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
			  127,  128,  126,  167,  167,  106,  127,  129,  131,  131,
			  130,  131,  130,  195,  128,  132,  132,  172,  132,  105,
			  133,  133,  102,  133,  125,  100,  129,  194,  127,  172,
			  126,  131,  136,  136,  127,  136,  134,  134,  132,  134,
			   98,  195,  128,  133,  132,  172,   90,  132,  131,  169,

			  135,  135,   87,  135,  129,  136,   75,  172,  196,  134,
			  169,  136,  137,  137,   72,  137,   56,  138,  139,  139,
			  199,  139,  132,  135,  133,  132,  131,  169,   36,   35,
			  134,  145,  145,  138,  145,  137,  196,  138,  169,  136,
			  138,  139,  137,  192,  135,  192,  177,  138,  199,  138,
			  171,  138,  140,  140,  145,  140,  171,  177,  134,  201,
			   33,  138,  139,  142,  142,  138,  142,   28,  138,   26,
			  137,  192,  135,  192,  177,  140,  145,  138,  171,  138,
			  144,  144,  140,  144,  171,  177,  142,  201,  143,  143,
			  143,  143,  143,  142,  147,  147,  140,  147,  140,  146, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  146,  202,  146,  144,  145,  181,   18,  142,  181,   17,
			  140,  144,  148,  148,  144,  148,  143,  147,   16,   13,
			  143,  142,  146,  193,  193,  147,  140,  141,  141,  202,
			  141,    0,  176,  181,  146,  148,  181,  176,  146,  144,
			  183,    0,  144,  141,  141,  141,  141,  141,  143,  183,
			  141,  193,  193,  147,  148,  149,  149,  173,  149,  173,
			  176,  141,  146,  173,  141,  176,  146,  187,  183,  162,
			  141,  162,  162,  162,  162,  162,  197,  183,  149,  204,
			  187,  184,  148,  184,  184,  173,  162,  173,  189,  141,
			  197,  173,  141,  198,  203,  187,  205,  198,  141,    0,

			  217,  189,  200,  149,  197,  203,  200,  204,  187,  184,
			  200,  184,  184,  205,  162,  212,  189,    0,  197,    0,
			    0,  198,  203,  214,  205,  198,  215,  219,    0,  189,
			  200,  149,  156,  203,  200,  216,  217,  223,  200,    0,
			  223,  205,  156,  241,  241,  241,  241,  241,  241,    0,
			  249,  249,  249,  249,  249,  251,  251,  251,  251,  251,
			    0,    0,  303,  219,  217,  249,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  249,  223,
			  303,  219,    0,  249,  212,  212,  212,  212,  212,  214,

			  214,  214,  215,  215,  215,  224,  227,    0,  224,  227,
			    0,  216,  216,  216,    0,    0,    0,  224,  227,  236,
			  236,  304,  236,  246,  246,    0,  246,  224,  227,  250,
			    0,  250,    0,    0,  250,  250,  250,  250,  250,  252,
			  252,  252,  252,  252,  236,  255,  246,  255,    0,  304,
			  255,  255,  255,  255,  255,    0,    0,  224,  227,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  232,
			  232,    0,  232,  257,  257,  257,  257,  258,  258,  258,
			  258,  258,  256,    0,  256,    0,  256,  256,  256,  256,
			  256,    0,  366,  366,  232,  366,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  254,

			  254,  254,  254,  254,  256,    0,  358,  261,  261,    0,
			  261,  271,  262,  262,  254,  262,  263,  263,    0,  263,
			  264,  264,  271,  264,  265,  265,    0,  265,  232,    0,
			  261,    0,  271,  266,  266,  262,  266,  254,  261,  263,
			    0,  308,  254,  264,  310,  267,  267,  265,  267,  311,
			  271,  262,  268,  268,  265,  268,  266,  269,  269,  264,
			  269,    0,  270,  270,  266,  270,  261,    0,  267,  308,
			  272,  272,  310,  272,    0,  268,  313,  311,  355,  262,
			  269,  267,  265,  358,  358,  270,  309,  264,  273,  273,
			    0,  273,  266,  272,  309,  268,  274,  274,    0,  274,

			  269,    0,  275,  275,  313,  275,  272,  276,  276,  267,
			  276,  273,  277,  277,  309,  277,  270,  278,  278,  274,
			  278,    0,  309,  268,  273,  275,  279,  279,  269,  279,
			  276,  274,    0,    0,  272,  277,  276,  275,    0,    0,
			  278,  280,  280,  280,  280,  280,  314,  314,    0,  279,
			  281,  281,  273,  281,  355,  355,  355,  279,  315,  274,
			  282,  282,  278,  282,  276,  275,  281,  281,  281,  281,
			  281,    0,    0,  281,  314,  314,  282,  282,  282,  282,
			  282,  283,  283,  282,  283,  279,  315,    0,  367,  367,
			  278,  367,  284,  284,  281,  284,    0,  283,  283,  283,

			  283,  283,    0,  287,  283,  316,  312,  317,  284,  284,
			  284,  284,  284,    0,  312,  284,  286,  286,  286,  286,
			  286,  285,  285,  287,  285,  283,  287,  288,  288,  288,
			  288,  288,  287,  316,  312,  317,  284,  285,  285,  285,
			  285,  285,  312,  318,  285,  288,  289,  289,  321,  289,
			    0,  287,  290,  290,  287,  290,  291,  291,    0,  291,
			  287,  292,  292,  326,  292,  285,    0,  293,  293,  289,
			  293,  318,    0,  288,    0,  290,  321,  294,  294,  291,
			  294,    0,  292,    0,  292,  295,  295,    0,  295,  289,
			  293,  326,  297,  297,  291,  297,  296,  296,  293,  296,

			  294,  298,  298,    0,  298,    0,    0,  306,  295,  306,
			  306,  306,  306,  306,  324,  297,  327,  289,  294,  296,
			  319,    0,  291,  320,  298,  319,  293,  295,  307,  323,
			  307,  307,  307,  307,  307,  320,  325,  324,  328,  329,
			    0,  323,  324,  333,  327,  336,  294,  325,  319,  298,
			  296,  320,  337,  319,  330,  295,  331,  323,  325,  330,
			  332,  331,  338,  320,  332,  339,  328,  329,  325,  323,
			  334,  333,  334,  336,  340,  341,  342,  298,  343,  339,
			  337,  344,  330,  345,  331,  343,  325,  330,  332,  331,
			  338,  346,  332,  339,  350,  348,  352,  349,  334,  353,

			  334,  354,  340,  341,  342,  348,  343,  339,  349,  344,
			  357,  345,    0,  343,  359,    0,  429,  350,  354,  346,
			  360,    0,  350,  348,  352,  349,  361,  353,    0,  354,
			    0,  364,  364,  348,  364,    0,  349,  369,  369,    0,
			  369,  430,  433,  364,  429,    0,  354,  372,  372,  372,
			  372,  372,  372,  364,  435,    0,  378,  378,  378,  378,
			  378,  438,  369,  379,  379,  379,  379,  379,    0,  430,
			  433,  378,  380,  380,  380,  380,  380,  381,  381,  381,
			  381,  381,  435,  364,    0,    0,  357,  357,  357,  438,
			  359,  359,  359,    0,  378,    0,  360,  360,  360,  378,

			    0,    0,  361,  361,  361,  382,  382,  382,  382,  382,
			  380,  383,  383,  383,  383,  383,  384,    0,  384,    0,
			    0,  384,  384,  384,  384,  384,  383,  385,  385,  385,
			  385,  385,  386,  386,  386,  386,  386,  387,  387,  387,
			  387,  387,  389,  389,  389,  389,  389,  392,  392,  383,
			  392,  439,  388,  388,  383,  388,  388,  388,  388,  388,
			  390,  390,  390,  390,  390,  393,  393,    0,  393,  440,
			  392,  394,  394,    0,  394,  387,    0,  395,  395,  439,
			  395,  396,  396,    0,  396,  401,  436,    0,  393,  392,
			  436,    0,  397,  397,  394,  397,  401,  440,  398,  398, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  395,  398,  399,  399,  396,  399,  401,  400,  400,    0,
			  400,  393,  395,  394,  436,  397,    0,  392,  436,  442,
			  443,  398,    0,    0,  401,  399,    0,    0,  402,  402,
			  400,  402,  442,  399,  400,  403,  403,  397,  403,  393,
			  395,  394,  398,  404,  404,  431,  404,  442,  443,  405,
			  405,  402,  405,    0,  406,  406,  431,  406,  403,    0,
			  442,  399,  400,  402,    0,  397,  404,    0,  421,    0,
			  398,  515,  405,  431,  515,  407,  407,  406,  407,  421,
			  403,  404,  408,  408,  431,  408,    0,  405,  406,  421,
			  444,  402,  409,  409,  409,  409,  409,  432,  407,  416,

			  416,  416,  416,  416,    0,  408,    0,  421,  403,  404,
			  445,  411,  432,  446,  411,  405,  406,  407,  444,  409,
			  411,    0,  447,  515,  408,  432,  410,    0,  410,  410,
			  410,  410,  410,  412,  412,  412,  412,  412,  445,  411,
			  432,  446,  411,  434,    0,  407,  410,  409,  411,  410,
			  447,  412,  408,  448,  434,  410,  413,  413,  413,  413,
			  413,  415,  415,  415,  415,  415,  449,    0,    0,    0,
			  413,  434,  414,  414,  410,  414,    0,  410,    0,  412,
			    0,  448,  434,  410,    0,  453,  413,    0,  414,  414,
			  414,  414,  414,  415,  449,  414,  419,  419,  413,  419,

			    0,    0,  414,  417,  417,  417,  417,  417,  418,  418,
			  418,  418,  418,  453,  413,  420,  420,  417,  420,  419,
			    0,  415,  418,  422,  422,  455,  422,    0,  423,  423,
			  414,  423,  424,  424,    0,  424,  425,  425,  420,  425,
			    0,  426,  426,  441,  426,  417,  422,  451,  450,  452,
			  418,  423,  450,  455,  426,  424,  452,  441,  456,  425,
			  461,  451,  424,  425,  426,  454,  462,  457,  454,  463,
			  458,  441,  464,  423,  425,  451,  450,  452,  457,  519,
			  450,  458,  467,  467,  452,  441,  456,  469,  461,  451,
			  424,  425,  465,  454,  462,  457,  454,  463,  458,  466,

			  464,  423,  425,  465,  521,  469,  457,  519,    0,  458,
			  467,  467,    0,  466,  470,  470,  470,  470,  470,  508,
			  465,  471,  471,  471,  471,  471,    0,  466,    0,  470,
			  508,  465,  521,  469,  472,  472,  472,  472,  472,    0,
			  508,  466,  473,  473,  473,  473,  473,  475,  475,  475,
			  475,  475,  476,  476,  476,  476,  476,  470,  508,  471,
			    0,  520,  475,  477,  477,  477,  477,  477,  478,  478,
			  478,  478,  478,  479,  479,  479,  479,  479,  480,  480,
			  480,  480,  480,    0,  520,  475,  484,    0,  484,  520,
			  475,  482,  482,  482,  482,  482,  484,  486,  486,    0,

			  486,  477,  487,  487,    0,  487,  482,    0,    0,    0,
			  483,  479,  483,  483,  483,  483,  483,  522,  488,  488,
			  486,  488,    0,  516,  484,  487,  516,  489,  489,    0,
			  489,    0,  490,  490,  482,  490,  491,  491,    0,  491,
			    0,  488,  513,  492,  492,  522,  492,    0,  523,  488,
			  489,  493,  493,  513,  493,  490,  487,  495,  495,  491,
			  495,  525,  490,  513,  530,  489,  492,  491,  496,  496,
			    0,  496,    0,    0,  493,  516,  523,  488,  531,  491,
			  495,  513,  497,  497,    0,  497,  532,  493,  495,  525,
			  490,  496,  530,  489,    0,  491,  498,  498,  496,  498,

			  499,  499,    0,  499,    0,  497,  531,  491,    0,  500,
			  500,    0,  500,    0,  532,  493,  495,  497,  533,  498,
			  534,  501,  501,  499,  501,    0,  496,  504,  504,  536,
			  504,  499,  500,  503,  503,  503,  503,  503,  505,  505,
			  505,  505,  505,    0,  501,  497,  533,  503,  534,  539,
			  504,  500,  501,  511,  511,    0,  511,  536,  506,  499,
			  506,  506,  506,  506,  506,  505,  509,  509,    0,  509,
			    0,  504,    0,    0,  506,  503,  511,  539,  526,  500,
			  501,  506,  507,  507,  507,  507,  507,  506,    0,  509,
			  526,  510,  510,  505,  510,  511,  528,  509,  512,  512,

			  524,  512,  506,  507,  527,  527,  526,  524,  528,  506,
			  537,  537,  538,  540,  510,  506,  538,  541,  526,  542,
			  544,  512,  510,  511,  528,  509,  545,  546,  524,  547,
			  548,  507,  527,  527,  549,  524,  528,  512,  537,  537,
			  538,  540,  543,  550,  538,  541,    0,  542,  544,    0,
			  510,  593,  595,  543,  545,  546,    0,  547,  548,  692,
			  692,  692,  549,    0,    0,  512,    0,  551,    0,  551,
			  543,  550,  551,  551,  551,  551,  551,  554,  596,  593,
			  595,  543,  552,  552,  552,  552,  552,  553,  553,  553,
			  553,  553,  555,  555,  555,  555,  555,  692,    0,    0,

			  554,  564,  564,  564,  564,  554,  596,  555,  556,  556,
			  556,  556,  556,  557,  557,  557,  557,  557,    0,    0,
			  552,  558,  558,  558,  558,  558,  559,  559,  559,  559,
			  559,    0,    0,    0,  598,  555,  560,  560,  560,  560,
			  560,  561,  561,  561,  561,  561,  556,  562,    0,  562,
			    0,  599,  562,  562,  562,  562,  562,  563,  563,  563,
			  563,  563,  598,    0,  559,  566,  566,  566,  566,  566,
			  567,  567,    0,  567,    0,  568,  568,    0,  568,  599,
			  566,    0,  569,  569,    0,  569,    0,  570,  570,    0,
			  570,  571,  571,  567,  571,  574,  588,  567,  568,  572,

			  572,    0,  572,  573,  573,  569,  573,  588,  566,  569,
			  570,    0,  574,    0,  571,    0,  574,  588,  570,  601,
			  575,  575,  572,  575,  603,  567,  573,  576,  576,  571,
			  576,  577,  577,  604,  577,  588,    0,  569,    0,  573,
			  574,  578,  578,  575,  578,  605,  570,  601,  579,  579,
			  576,  579,  603,  606,  577,  607,    0,  571,  576,  580,
			  580,  604,  580,  575,  578,  584,  584,  573,  584,    0,
			    0,  579,    0,  605,  609,  577,  589,  585,  585,  579,
			  585,  606,  580,  607,  578,    0,  576,  589,  584,  580,
			  581,  575,  581,  581,  581,  581,  581,  589,  586,  586,

			  585,  586,  609,  577,  608,  611,  581,  579,  587,  587,
			    0,  587,  578,  602,  597,  589,  608,  580,  597,  585,
			  602,  586,  610,  613,  612,  614,  615,  586,  616,  616,
			  618,  587,  608,  611,  581,  610,  612,  619,  587,  620,
			  621,  602,  597,    0,  608,    0,  597,  585,  602,  622,
			  610,  613,  612,  614,  615,  586,  616,  616,  618,    0,
			  622,    0,  658,  610,  612,  619,  587,  620,  621,  623,
			  623,  623,  623,  623,  659,  662,    0,  622,  624,  624,
			  624,  624,  624,  625,  625,  625,  625,  625,  622,  626,
			  658,  626,  663,    0,  626,  626,  626,  626,  626,  627, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  630,  627,  659,  662,  627,  627,  627,  627,  627,  628,
			  628,  628,  628,  628,  629,  629,  629,  629,  629,    0,
			  663,  642,  642,  630,  642,    0,    0,    0,  630,  631,
			  631,  631,  631,  631,  632,  632,  632,  632,  632,  634,
			  634,  634,  634,  634,  642,    0,    0,  628,  635,  635,
			  635,  635,  635,  636,  636,  636,  636,  636,  638,  638,
			  638,  638,  638,  639,  645,  639,    0,  668,  639,  639,
			  639,  639,  639,  638,  640,  640,    0,  640,    0,  641,
			  641,  645,  641,  643,  643,  645,  643,  644,  644,  669,
			  644,  646,  646,    0,  646,  668,  638,  640,    0,    0,

			  670,  638,  641,  652,  647,  647,  643,  647,    0,  645,
			  644,  673,  643,    0,  646,  641,  640,  669,  648,  648,
			  652,  648,  649,  649,  652,  649,  660,  647,  670,  650,
			  650,  660,  650,  651,  651,  664,  651,  664,    0,  673,
			  643,  648,  674,  641,  640,  649,  653,  653,  652,  653,
			  654,  654,  650,  654,  660,  671,  651,  655,  655,  660,
			  655,  676,  677,  664,  678,  664,  648,  650,  676,  653,
			  674,  679,  671,  654,  680,  681,  708,  653,  697,  697,
			  655,  697,    0,  671,  654,    0,  709,  711,  655,  676,
			  677,    0,  678,    0,  648,  650,  676,    0,    0,  679,

			  671,  697,  680,  681,  708,  653,  683,  683,  683,  683,
			  683,    0,  654,  697,  709,  711,  655,  684,  684,  684,
			  684,  684,  685,  685,  685,  685,  685,  686,  686,  686,
			  686,  686,  687,  687,  687,  687,  687,  688,    0,  688,
			    0,  697,  688,  688,  688,  688,  688,  691,  691,  691,
			  691,  691,    0,  712,    0,  684,  693,  693,  693,  693,
			  693,  694,  694,  694,  694,  694,  695,  695,  695,  695,
			  695,  693,  696,  696,    0,  696,  702,  698,  698,    0,
			  698,  712,  700,  700,  714,  700,  701,  701,    0,  701,
			  715,    0,  717,  702,  693,  696,    0,  702,  710,  693,

			  698,  696,  710,  706,  695,  700,    0,  706,  698,  701,
			  703,  703,  714,  703,  718,  701,  704,  704,  715,  704,
			  717,  702,  705,  705,  706,  705,  710,  707,    0,  696,
			  710,  707,  716,  703,  716,  706,  698,  720,  720,  704,
			  703,    0,  718,  701,    0,  705,  740,  704,  707,  721,
			  721,  721,  721,  721,  723,  723,  723,  723,  723,  707,
			  716,    0,  716,    0,    0,  720,  720,    0,  703,  724,
			  724,  724,  724,  724,  740,  704,  725,  725,  725,  725,
			  725,  726,  726,  726,  726,  726,  741,  721,  727,  727,
			  727,  727,  727,  728,  728,  728,  728,  728,  730,  730,

			  730,  730,  730,  731,  731,  744,  731,  724,  732,  732,
			    0,  732,  733,  733,  741,  733,  734,  734,    0,  734,
			  736,  736,    0,  736,    0,  738,  731,  737,  737,  738,
			  737,  732,  742,  744,  739,  733,  730,  731,  739,  734,
			  745,  746,  748,  736,  749,  742,  738,  734,    0,  760,
			  737,  761,  732,  756,  756,  739,  756,  738,    0,    0,
			  742,  796,  796,  796,  796,  731,  739,    0,  745,  746,
			  748,  737,  749,  742,    0,  734,  756,  760,    0,  761,
			  732,  750,  750,  750,  750,  750,  752,  752,  752,  752,
			  752,  754,  754,  763,  754,  753,  756,  753,  762,  737,

			  753,  753,  753,  753,  753,  755,  755,  765,  755,  757,
			  757,  764,  757,  774,  754,  762,    0,  768,  768,  750,
			  768,  763,  754,  764,  756,    0,  762,    0,  755,  823,
			  823,  823,  757,  753,    0,  765,    0,  776,    0,  764,
			  768,  774,  778,  762,  767,  767,  767,  767,  767,    0,
			  754,  764,  779,  755,    0,  769,  769,  757,  769,  770,
			  770,  768,  770,  771,  771,  776,  771,  823,    0,  772,
			  778,  773,  780,  780,  780,  780,  780,  772,  769,  773,
			  779,  755,  770,  784,    0,  757,  771,  786,  787,  768,
			  772,  784,  773,  781,  781,  781,  781,  781,  782,  782,

			    0,  782,  793,  771,  784,  772,  785,  773,  801,  783,
			  783,    0,  783,    0,  785,  786,  787,    0,  788,  784,
			  788,  782,  789,  789,    0,  789,    0,  785,  788,    0,
			  793,  771,  783,  799,  790,  790,  801,  790,  798,  798,
			  783,  798,  785,    0,  799,  789,  782,  795,  795,  795,
			  795,  795,  800,    0,  799,    0,  788,  790,    0,    0,
			    0,  798,  789,  800,  804,  804,    0,  804,  783,  798,
			    0,    0,  799,  800,  782,  802,  802,  802,  802,  802,
			  803,  803,  803,  803,  803,  805,    0,  804,  806,    0,
			  789,  800,  814,  814,  814,  814,  805,  798,    0,  806,

			  808,  808,  808,  808,  808,  809,  805,  809,  816,  806,
			  812,  812,  812,  812,  812,  809,  813,  813,  813,  813,
			  813,  817,    0,    0,  805,  816,    0,  806,    0,  816,
			  818,  818,  818,  818,  818,  820,    0,  821,  817,    0,
			    0,    0,  817,  809,  819,  819,  819,  819,  819,    0,
			    0,    0,  820,  816,  821,    0,  820,    0,  821,  822,
			  822,  822,  822,  822,    0,    0,  817,  826,  826,  826,
			  826,  826,  827,  827,  827,  827,  827,    0,    0,    0,
			  820,    0,  821,  828,  828,  828,  828,  828,  830,  830,
			  830,  830,  830,  831,    0,  831,    0,    0,  831,  831,

			  831,  831,  831,  832,  832,  832,  832,  832,  833,  833,
			  833,  833,  833,    0,    0,    0,    0,    0,    0,    0,
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

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
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

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
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

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   88,   93,   75,   76,    0,    0,  183,
			    0,   67,   70, 1019, 5185,   97, 1015,  983,  999, 5185,
			   89,    0, 5185, 5185, 5185, 5185,  954,   87,  950,   96,
			  105, 5185, 5185,  934, 5185,  903,  900,  272,  276,  282,
			  128,  293,  288,  297,  323,  318,  347,  351,  422,  362,
			  406,  376,  410,  422, 5185, 5185,  861,  499,  576,  103,
			   78,  415,  247,  101,  426,  111,  102,  425,  322,  422,
			  336,  430,  897, 5185, 5185,  899,  145, 5185,  106,  337,
			  275,  422,  308,  429,  318, 5185,  422,  849, 5185,  287,
			  893,  577,  653, 5185,   77,  706, 5185,  165,  887, 5185,

			  868, 5185,  863,    0,  650,  858,  852,  822,  643, 5185,
			  505,  660,  669,  676,  744, 5185, 5185, 5185,  765,  769,
			    0,  773,  777,  781,  786,  802,  807,  819,  826,  832,
			  837,  856,  863,  868,  884,  898,  880,  910,  901,  916,
			  950, 1025,  961,  970,  978,  929,  997,  992, 1010, 1053,
			  807,  663,  763, 5185,  322,  805, 1109,  797,   92,  107,
			  254,  313, 1053,  762,  668,  596,  366,  792,  358,  866,
			  404,  919,  834, 1026,  419,  508,  999,  913,  780,  736,
			  560,  974,  736, 1007, 1050,  667,  638, 1034,  656, 1055,
			  742,  785,  912,  991,  816,  816,  875, 1043, 1056,  887,

			 1069,  926,  957, 1061, 1029, 1063, 5185,  778, 5185,  549,
			 5185, 5185, 1108,  504, 1116, 1119, 1128, 1083, 5185, 1110,
			  728, 5185,  266, 1135, 1203, 5185,  774, 1204,  402, 1258,
			  588,  303, 1347, 5185, 5185,  705, 1217, 5185, 5185, 5185,
			  722, 1126,  718,  717,  710,  705, 1221,  711, 5185, 1132,
			 1216, 1137, 1221, 5185, 1381, 1232, 1348, 1335, 1339, 5185,
			  683, 1405, 1410, 1414, 1418, 1422, 1431, 1443, 1450, 1455,
			 1460, 1383, 1468, 1486, 1494, 1500, 1505, 1510, 1515, 1524,
			 1523, 1548, 1558, 1579, 1590, 1619, 1598, 1587, 1609, 1644,
			 1650, 1654, 1659, 1665, 1675, 1683, 1694, 1690, 1699,  682,

			 5185, 5185,  658, 1129, 1180,    0, 1691, 1712, 1408, 1453,
			 1411, 1408, 1573, 1444, 1514, 1525, 1567, 1562, 1610, 1687,
			 1690, 1603,  610, 1696, 1681, 1719, 1625, 1678, 1701, 1702,
			 1721, 1723, 1727, 1712, 1739,    0, 1712, 1705, 1729, 1732,
			 1741, 1735, 1743, 1745, 1748, 1740, 1747,  604, 1762, 1764,
			 1761,    0, 1763, 1749, 1768, 1471,  329, 1803, 1399, 1807,
			 1813, 1819, 5185,  601, 1829, 5185, 1370, 1586,  513, 1835,
			 5185, 5185, 1830, 5185, 5185, 5185, 5185, 5185, 1838, 1845,
			 1854, 1859, 1887, 1893, 1903, 1909, 1914, 1919, 1937, 1924,
			 1942,  488, 1945, 1963, 1969, 1975, 1979, 1990, 1996, 2000,

			 2005, 1957, 2026, 2033, 2041, 2047, 2052, 2073, 2080, 2074,
			 2110, 2075, 2115, 2138, 2170, 2143, 2081, 2185, 2190, 2194,
			 2213, 2040, 2221, 2226, 2230, 2234, 2239,  598,    0, 1772,
			 1793, 2012, 2064, 1798, 2110, 1817, 1953,    0, 1814, 1905,
			 1936, 2210, 1986, 1987, 2061, 2077, 2076, 2075, 2113, 2126,
			 2215, 2214, 2216, 2149, 2232, 2181, 2214, 2234, 2237,    0,
			    0, 2227, 2233, 2222, 2240, 2263, 2266, 2250,  495, 2272,
			 2296, 2303, 2316, 2324,  488, 2329, 2334, 2345, 2350, 2355,
			 2360,  478, 2373, 2394, 2373,  777, 2395, 2400, 2416, 2425,
			 2430, 2434, 2441, 2449,  450, 2455, 2466, 2480, 2494, 2498,

			 2507, 2519, 5185, 2515, 2525, 2520, 2542, 2564, 2291, 2564,
			 2589, 2551, 2596, 2414,  794, 2069, 2421,    0,  396, 2246,
			 2328, 2271, 2384, 2408, 2567, 2429, 2545, 2572, 2563,    0,
			 2426, 2445, 2453, 2486, 2483,    0, 2496, 2578, 2579, 2516,
			 2580, 2573, 2586, 2609, 2587, 2593, 2594, 2585, 2589, 2601,
			 2610, 2654, 2664, 2669, 2644, 2674, 2690, 2695, 2703, 2708,
			 2718, 2723, 2734, 2739, 2683, 5185, 2747, 2768, 2773, 2780,
			 2785, 2789, 2797, 2801, 2767, 2818, 2825, 2829, 2839, 2846,
			 2857, 2874, 5185,  427, 2863, 2875, 2896, 2906, 2768, 2848,
			  349, 5185, 5185, 2622,    0, 2619, 2649, 2885, 2701, 2711,

			    0, 2786, 2880, 2791, 2795, 2800, 2820, 2809, 2871, 2841,
			 2889, 2860, 2891, 2890, 2893, 2893, 2896,    0, 2886, 2906,
			 2907, 2907, 2916, 2951, 2960, 2965, 2976, 2986, 2991, 2996,
			 2967, 3011, 3016,  404, 3021, 3030, 3035, 5185, 3040, 3050,
			 3072, 3077, 3019, 3081, 3085, 3036, 3089, 3102, 3116, 3120,
			 3127, 3131, 3075, 3144, 3148, 3155,  403,  374, 2918, 2936,
			 3093,    0, 2944, 2959, 3104,    0,    0,    0, 3017, 3056,
			 3067, 3122,    0, 3078, 3102,    0, 3128, 3129, 3131, 3135,
			 3141, 3142,  329, 3188, 3199, 3204, 3209, 3214, 3224,  324,
			  565, 3229, 2646, 3238, 3243, 3248, 3270, 3176, 3275, 5185,

			 3280, 3284, 3248, 3308, 3314, 3320, 3275, 3299, 3145, 3149,
			 3265, 3154, 3220,    0, 3251, 3259, 3301, 3260, 3281,    0,
			 3305, 3331,  317, 3336, 3351, 3358, 3363, 3370, 3375, 5185,
			 3380, 3401, 3406, 3410, 3414, 5185, 3418, 3425, 3397, 3406,
			 3310, 3340, 3399,    0, 3372, 3407, 3408,    0, 3396, 3411,
			 3463,  259, 3468, 3482, 3489, 3503, 3451, 3507,  715, 5185,
			 3416, 3401, 3465, 3448, 3478, 3457,  136, 3526, 3515, 3553,
			 3557, 3561, 3541, 3543, 3467,    0, 3504,    0, 3509, 3510,
			 3554, 3575, 3596, 3607, 3555, 3578, 3537, 3555, 3605, 3620,
			 3632,  280,  271, 3560,    0, 3629, 3443, 5185, 3636, 3605,

			 3624, 3575, 3657, 3662, 3662, 3657, 3660,    0, 3682, 3692,
			   99,   97, 3692, 3698, 3674, 5185, 3680, 3693, 3712, 3726,
			 3707, 3709, 3741, 3516, 5185, 5185, 3749, 3754, 3765, 5185,
			 3770, 3780, 3785, 3790, 5185, 3831, 3882, 3933, 3984, 4035,
			 4086, 4121, 4159, 4203, 4252, 4303, 4354, 4405, 4455, 4504,
			 4555, 4606, 4651, 4700, 4751, 4795, 4839, 4887, 4937, 4987,
			 5036, 5084, 5133, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
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

	yy_ec_template: SPECIAL [INTEGER]
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

	yy_meta_template: SPECIAL [INTEGER]
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

	yy_accept_template: SPECIAL [INTEGER]
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

	yyJam_base: INTEGER = 5185
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 834
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 835
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

	yyNb_rules: INTEGER = 129
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 130
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_REGEXP1: INTEGER = 2
	IN_REGEXP2: INTEGER = 3
	IN_TERM_CONSTRAINT: INTEGER = 4
	IN_C_DOMAIN_TYPE: INTEGER = 5
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
