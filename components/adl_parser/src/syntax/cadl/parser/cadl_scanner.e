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
--|#line 65 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 65")
end
-- Ignore separators
else
--|#line 66 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 66")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 71 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 71")
end
-- Ignore comments
else
--|#line 72 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 72")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 76 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 76")
end
last_token := Minus_code
else
--|#line 77 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 77")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 78 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 78")
end
last_token := Star_code
else
--|#line 79 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 79")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 80 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 80")
end
last_token := Caret_code
else
--|#line 81 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 81")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 82 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 82")
end
last_token := Dot_code
else
--|#line 83 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 83")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 84 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 84")
end
last_token := Comma_code
else
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
last_token := Exclamation_code
else
--|#line 87 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 87")
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
--|#line 88 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 88")
end
last_token := Right_parenthesis_code
else
--|#line 89 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 89")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := SYM_DT_UNKNOWN
else
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Left_bracket_code
end
else
if yy_act = 23 then
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Right_bracket_code
else
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := SYM_START_CBLOCK
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := SYM_END_CBLOCK
else
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := SYM_GE
end
else
if yy_act = 27 then
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := SYM_LE
else
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := SYM_NE
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := SYM_LT
else
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := SYM_GT
end
else
if yy_act = 31 then
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := SYM_MODULO
else
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
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
--|#line 112 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 112")
end
last_token := SYM_ELLIPSIS
else
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 35 then
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_MATCHES
else
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_MATCHES
end
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_THEN
else
--|#line 125 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 125")
end
last_token := SYM_ELSE
end
else
if yy_act = 39 then
--|#line 127 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 127")
end
last_token := SYM_AND
else
--|#line 129 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 129")
end
last_token := SYM_OR
end
end
end
else
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_XOR
else
--|#line 133 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 133")
end
last_token := SYM_NOT
end
else
if yy_act = 43 then
--|#line 135 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 135")
end
last_token := SYM_IMPLIES
else
--|#line 137 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 137")
end
last_token := SYM_TRUE
end
end
else
if yy_act <= 46 then
if yy_act = 45 then
--|#line 139 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 139")
end
last_token := SYM_FALSE
else
--|#line 141 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 141")
end
last_token := SYM_FORALL
end
else
if yy_act = 47 then
--|#line 143 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 143")
end
last_token := SYM_EXISTS
else
--|#line 147 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 147")
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
--|#line 149 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 149")
end
last_token := SYM_OCCURRENCES
else
--|#line 151 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 151")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 51 then
--|#line 153 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 153")
end
last_token := SYM_ORDERED
else
--|#line 155 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 155")
end
last_token := SYM_UNORDERED
end
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 157 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 157")
end
last_token := SYM_UNIQUE
else
--|#line 159 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 159")
end
last_token := SYM_INFINITY
end
else
if yy_act = 55 then
--|#line 161 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 161")
end
last_token := SYM_USE_NODE
else
--|#line 163 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 163")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
end
else
if yy_act <= 60 then
if yy_act <= 58 then
if yy_act = 57 then
--|#line 165 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 165")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 167 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 167")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 59 then
--|#line 169 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 169")
end
last_token := SYM_EXCLUDE
else
--|#line 173 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 173")
end

	last_token := V_URI
	last_string_value := text

end
end
else
if yy_act <= 62 then
if yy_act = 61 then
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end

 					last_token := V_QUALIFIED_TERM_CODE_REF
 					last_string_value := text_substring (2, text_count - 1)
 			
else
--|#line 198 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 198")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
end
else
--|#line 205 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 205")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
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
--|#line 212 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 212")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
else
--|#line 218 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 218")
end

				do_nothing
			
end
else
if yy_act = 66 then
--|#line 222 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 222")
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
--|#line 244 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 244")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 69 then
if yy_act = 68 then
--|#line 251 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 251")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 258 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 258")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 70 then
--|#line 259 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 259")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 260 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 260")
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
--|#line 267 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 267")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 268 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 268")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 269 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 269")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 276 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 276")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 277 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 277")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 78 then
--|#line 286 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 286")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 287 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 287")
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
--|#line 295 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 295")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 302 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 302")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 82 then
--|#line 309 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 309")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 321 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 321")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 326 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 326")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 330 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 330")
end
 -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of dADL
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_lineno := in_lineno + str_.occurrences('%N')

				dadl_parser.execute(str_, source_start_line)
				if not dadl_parser.syntax_error then
					if dadl_parser.output.is_typed then
						c_domain_type ?= dadl_parser.output.as_object(dynamic_type_from_string(dadl_parser.output.rm_type_name))
						if c_domain_type /= Void then
							last_token := V_C_DOMAIN_TYPE
						else
							dadl_parser_error := "Conversion of " + dadl_parser.output.rm_type_name + " failed"
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
if yy_act = 86 then
--|#line 362 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 362")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 367 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 367")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
else
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act = 88 then
--|#line 372 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 372")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 378 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 378")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 90 then
--|#line 384 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 384")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 390 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 390")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 394 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 394")
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
--|#line 404 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 404")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 94 then
--|#line 411 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 411")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 416 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 416")
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
	yy_end := yy_end - 1
--|#line 431 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 431")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 432 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 432")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 98 then
--|#line 433 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 433")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 437 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 437")
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
if yy_act <= 101 then
if yy_act = 100 then
--|#line 438 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 438")
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
--|#line 439 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 439")
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
if yy_act = 102 then
--|#line 459 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 459")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 463 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 463")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
end
end
else
if yy_act <= 107 then
if yy_act <= 105 then
if yy_act = 104 then
--|#line 469 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 469")
end
in_buffer.append_character ('\')
else
--|#line 470 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 470")
end
in_buffer.append_character ('"')
end
else
if yy_act = 106 then
--|#line 471 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 471")
end
	-- match ISO special character pattern &char_name;
				-- look up the code in an ISO table
				-- if a valid code then
				-- 	convert to actual character?
				--	in_buffer.append_character (converted character)
				-- else
				--	last_token := ERR_STRING
				--	set_start_condition (INITIAL)
				-- end
			
				-- current simple approach: just copy the pattern into the buffer
				--
				in_buffer.append_string (text)
			
else
--|#line 485 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 485")
end
	-- match W3C XML special character pattern &#xHHHH;
				-- look up the code in an W3C table
				-- if a valid code then
				-- 	convert to actual character?
				--	in_buffer.append_character (converted character)
				-- else
				--	last_token := ERR_STRING
				--	set_start_condition (INITIAL)
				-- end
			
				-- current simple approach: just copy the pattern into the buffer
				--
				in_buffer.append_string (text)
			
end
end
else
if yy_act <= 109 then
if yy_act = 108 then
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
end
in_buffer.append_string (text)
else
--|#line 501 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 501")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
end
else
if yy_act = 110 then
--|#line 506 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 506")
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
			
else
--|#line 517 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 517")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
end
end
end
else
if yy_act <= 119 then
if yy_act <= 115 then
if yy_act <= 113 then
if yy_act = 112 then
--|#line 525 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 525")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 526 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 526")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
if yy_act = 114 then
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
end
else
if yy_act <= 117 then
if yy_act = 116 then
--|#line 529 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 529")
end
last_token := V_CHARACTER; last_character_value := '%F'
else
--|#line 530 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 530")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 118 then
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 532 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 532")
end
last_token := V_CHARACTER; last_character_value := '"'
end
end
end
else
if yy_act <= 123 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 533 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 533")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
else
--|#line 538 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 538")
end
	-- match ISO special character pattern &char_name;
				-- look up the code in an ISO table
				-- if a valid code then
				--	last_token := V_CHARACTER
				-- 	convert to actual character?
				--	last_character_value := converted character
				-- else
				--	last_token := ERR_CHARACTER
				-- end
			
end
else
if yy_act = 122 then
--|#line 548 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 548")
end
	-- match W3C XML special character pattern &#xHHHH;
				-- look up the code in an W3C table
				-- if a valid code then
				--	last_token := V_CHARACTER
				-- 	convert to actual character?
				--	last_character_value := converted character
				-- else
				--	last_token := ERR_CHARACTER
				-- end
			
else
--|#line 558 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 558")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 125 then
if yy_act = 124 then
--|#line 559 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 559")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
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
			create an_array.make (0, 4791)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   14,   19,
			   14,   20,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,   29,   29,   29,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   37,   39,   40,   37,   41,   42,
			   37,   43,   44,   45,   46,   37,   37,   37,   47,   48,
			   37,   49,   50,   37,   51,   52,   53,   54,   14,   55,
			   56,   57,   56,   58,   59,   56,   60,   61,   56,   62,
			   63,   64,   56,   56,   56,   56,   65,   66,   56,   67,
			   68,   69,   70,   71,   73,   73,   78,   78,   74,   74,
			   88,   75,   75,   88,   90,  326,   90,   90,   96,   97,

			  100,  151,  101,  101,  101,  101,  101,  103,  761,  104,
			  161,  105,  105,  105,  105,  105,  110,  110,  169,  110,
			  171,  191,   79,   79,  674,  674,  674,  137,  137,  152,
			  747,  203,  137,  137,  715,  196,   76,   76,  162,  209,
			  209,  112,  209,   98,   89,  508,  170,   89,  172,  106,
			   80,   80,   81,   82,   83,   81,   82,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   84,  192,
			   81,  110,  110,  137,  110,  173,   81,   81,   81,   81,
			   81,   81,  153,  197,  177,  157,  110,  110,  174,  110,
			  181,  185,  178,  154,  187,  182,  112,  158,  696,  193,

			  115,  193,  193,  175,  440,   81,   81,   86,   81,  191,
			  155,  112,  179,  159,  432,  213,  176,  191,  183,  186,
			  180,  156,  188,  184,  113,  160,  114,   90,  115,   90,
			   90,  669,   81,   81,   81,   81,   82,   83,   81,   82,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   84,  113,   81,  114,  110,  110,  192,  110,   81,
			   81,   81,   81,   81,   81,  192,  199,  110,  110,  214,
			  110,  163,  164,  110,  110,  654,  110,  165,  110,  110,
			  112,  110,  202,  191,  204,  205,  276,  204,   81,   81,
			   86,   81,  112,  116,  110,  110,  118,  110,  112,  166,

			  167,  722,  200,  112,  117,  168,  653,  124,  119,  120,
			  205,  205,  637,  205,  276,   81,   81,   81,  200,  112,
			  277,  116,  110,  110,  118,  110,  110,  110,  213,  110,
			  201,  192,  117,  121,  122,  124,  119,  120,  207,  123,
			  110,  110,  141,  110,  722,  141,  201,  112,  277,  276,
			  537,  112,  142,  110,  110,  324,  110,  126,  130,  130,
			  277,  121,  122,  125,  207,  112,  282,  123,  282,  284,
			  127,  128,  128,  128,  128,  128,  131,  280,  112,  537,
			  110,  110,  214,  110,  132,  126,  110,  110,  281,  110,
			  284,  125,  110,  110,  282,  110,  283,  284,  127,  129,

			  208,  205,  290,  208,  131,  112,  521,  208,  205,  512,
			  208,  112,  132,  103,  209,  210,  191,  112,  287,  223,
			  133,  209,  291,  224,  211,  134,  193,  135,  193,  193,
			  290,  211,  225,  225,  225,  225,  225,  233,  233,  233,
			  233,  233,  136,  236,  236,  236,  236,  236,  133,  290,
			  291,  291,  234,  134,  207,  135,  241,  241,  241,  241,
			  241,  207,  110,  110,  192,  110,  467,  226,  295,  295,
			  136,  141,  729,  729,  141,  235,  227,  292,  467,  293,
			  234,  142,  228,  429,  514,  334,  229,  112,  230,  143,
			  143,  143,  143,  143,  144,  296,  295,  299,  297,  426,

			  143,  143,  143,  143,  143,  143,  143,  143,  143,  145,
			  143,  146,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  296,  106,  420,  297,  143,  147,  147,
			  148,  147,  147,  147,  147,  147,  147,  149,  147,  150,
			  147,  147,  147,  147,  147,  148,  147,  147,  147,  147,
			  141,  420,  278,  141,  279,  279,  279,  279,  279,  399,
			  142,  238,  238,  238,  238,  238,  399,  387,  143,  143,
			  143,  143,  143,  144,  296,  302,  239,  297,  386,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,

			  143,  143,  300,  302,  239,  301,  143,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  190,
			  190,  344,  190,  190,  190,  191,  194,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  190,  192,  190,  190,  190,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,

			  195,  195,  195,  195,  195,  195,  195,  195,  195,  190,
			  190,  190,  216,  216,  343,  216,  342,  211,  211,  190,
			  211,  341,  103,  340,  104,  336,  240,  240,  240,  240,
			  240,  195,  195,  195,  195,  195,  335,  325,  334,  217,
			  332,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  106,  110,  110,  776,  110,  195,
			  203,  110,  110,  231,  110,  231,  231,  204,  205,  191,
			  204,  191,  298,  298,  205,  205,  302,  205,  110,  110,
			  112,  110,  294,  218,  219,  219,  112,  219,  219,  219,

			  219,  221,  219,  219,  220,  219,  219,  219,  219,  219,
			  219,  219,  219,  112,  303,  244,  137,  137,  219,  219,
			  219,  219,  219,  219,  250,  304,  242,  110,  110,  272,
			  110,  207,  110,  110,  304,  110,  110,  110,  207,  110,
			  275,  110,  110,  244,  110,  274,  191,  219,  219,  219,
			  219,  140,  112,  304,  242,  110,  110,  112,  110,  243,
			  273,  112,  305,  272,  232,  668,  112,  246,  110,  110,
			  231,  110,  220,  247,  219,  219,  219,  245,   94,  248,
			  112,  110,  110,   91,  110,  110,  110,  243,  110,  110,
			  110,  250,  110,  112,  192,  246,  285,  110,  110,  249,

			  110,  247,  286,  306,  307,  245,  112,  248,  110,  110,
			  112,  110,  203,  306,  112,  189,  252,  110,  110,  253,
			  110,  307,  112,  251,  285,  110,  110,  249,  110,  140,
			  286,  306,  307,  112,  109,  330,  427,  310,  330,  311,
			  285,  308,  112,  255,  252,  254,  286,  253,  257,  309,
			  112,  251,  108,  107,  256,  310,  102,  258,   99,  110,
			  110,   94,  110,  110,  110,  310,  110,  311,  288,   92,
			  311,  255,  110,  110,  289,  110,  257,  263,  263,  263,
			  263,  263,  256,  312,  112,  258,  110,  110,  112,  110,
			  264,  264,  264,  264,  264,  316,  265,  112,  313,  120,

			  316,  320,   91,  776,  128,  128,  128,  128,  128,  776,
			  320,  112,  110,  110,  776,  110,  199,  776,  259,  110,
			  110,  322,  110,  316,  265,  260,  322,  120,  319,  320,
			  110,  110,  202,  110,  261,  776,  262,  112,  321,  776,
			  776,  388,  110,  110,  112,  110,  259,  110,  110,  322,
			  110,  776,  200,  260,  323,  112,  267,  314,  776,  266,
			  268,  315,  261,  269,  262,  776,  314,  112,  200,  388,
			  315,  776,  112,  776,  776,  388,  208,  205,  776,  208,
			  201,  776,  776,  776,  267,  314,  270,  266,  268,  315,
			  209,  269,  208,  205,  317,  208,  201,  271,  318,  337,

			  211,  331,  331,  389,  331,  776,  209,  338,  339,  339,
			  339,  339,  339,  346,  270,  346,  211,  390,  347,  347,
			  347,  347,  347,  776,  776,  271,  776,  776,  217,  390,
			  207,  348,  348,  348,  348,  348,  349,  349,  349,  349,
			  349,  776,  353,  776,  353,  390,  207,  354,  354,  354,
			  354,  354,  356,  356,  356,  356,  356,  391,  776,  776,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  327,  328,  329,  327,  328,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  209,  392,  776,

			  327,  345,  345,  345,  345,  345,  327,  330,  327,  327,
			  327,  327,  393,  776,  394,  776,  234,  350,  350,  350,
			  350,  350,  462,  462,  462,  462,  392,  110,  110,  776,
			  110,  776,  351,  392,  776,  327,  327,  207,  327,  235,
			  393,  103,  394,  104,  234,  355,  355,  355,  355,  355,
			  110,  110,  112,  110,  393,  352,  110,  110,  394,  110,
			  351,  395,  327,  327,  327,  216,  216,  278,  216,  278,
			  278,  278,  278,  278,  278,  112,  279,  279,  279,  279,
			  279,  112,  396,  106,  468,  468,  397,  468,  776,  776,
			  776,  357,  217,  367,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  110,  110,  357,
			  110,  367,  110,  110,  398,  110,  110,  110,  776,  110,
			  398,  110,  110,  364,  110,  110,  110,  776,  110,  401,
			  110,  110,  112,  110,  364,  402,  218,  112,  776,  358,
			  776,  112,  398,  776,  364,  359,  112,  776,  400,  776,
			  112,  776,  403,  776,  360,  112,  404,  401,  110,  110,
			  776,  110,  364,  402,  401,  776,  361,  358,  110,  110,
			  362,  110,  402,  359,  110,  110,  776,  110,  110,  110,
			  403,  110,  360,  112,  404,  776,  363,  110,  110,  403,

			  110,  776,  405,  112,  361,  408,  365,  776,  362,  112,
			  406,  110,  110,  112,  110,  408,  366,  110,  110,  369,
			  110,  368,  112,  110,  110,  776,  110,  407,  410,  110,
			  110,  411,  110,  408,  365,  275,  112,  776,  410,  776,
			  411,  776,  112,  409,  366,  776,  364,  369,  112,  368,
			  371,  414,  110,  110,  112,  110,  410,  364,  370,  411,
			  776,  776,  110,  110,  776,  110,  412,  364,  413,  129,
			  372,  372,  372,  372,  372,  776,  415,  112,  371,  414,
			  373,  373,  373,  373,  373,  364,  370,  112,  110,  110,
			  776,  110,  110,  110,  776,  110,  776,  776,  129,  110,

			  110,  377,  110,  377,  415,  414,  776,  415,  129,  110,
			  110,  378,  110,  112,  776,  776,  418,  112,  110,  110,
			  776,  110,  110,  110,  112,  110,  776,  263,  263,  263,
			  263,  263,  380,  416,  112,  417,  419,  110,  110,  379,
			  110,  418,  382,  112,  418,  374,  776,  112,  375,  110,
			  110,  381,  110,  419,  376,  110,  110,  423,  110,  423,
			  380,  776,  112,  776,  419,  776,  383,  776,  776,  421,
			  382,  470,  776,  374,  112,  776,  375,  776,  776,  381,
			  112,  422,  376,  328,  329,  423,  328,  424,  205,  205,
			  776,  205,  470,  384,  383,  331,  331,  209,  331,  470,

			  337,  776,  472,  110,  110,  385,  110,  330,  338,  339,
			  339,  339,  339,  339,  430,  430,  430,  430,  430,  776,
			  471,  776,  776,  347,  347,  347,  347,  347,  112,  234,
			  472,  776,  776,  385,  191,  211,  211,  207,  211,  776,
			  468,  468,  207,  468,  776,  776,  776,  425,  425,  425,
			  425,  425,  235,  472,  776,  474,  475,  234,  425,  425,
			  425,  425,  425,  425,  431,  431,  431,  431,  431,  433,
			  433,  433,  433,  433,  434,  434,  434,  434,  434,  776,
			  776,  473,  192,  474,  475,  425,  425,  425,  425,  425,
			  425,  425,  435,  435,  435,  435,  435,  438,  438,  438,

			  438,  438,  432,  436,  474,  436,  776,  351,  437,  437,
			  437,  437,  437,  354,  354,  354,  354,  354,  439,  439,
			  439,  439,  439,  444,  444,  444,  444,  444,  110,  110,
			  352,  110,  476,  441,  442,  351,  443,  443,  443,  443,
			  443,  110,  110,  475,  110,  110,  110,  451,  110,  110,
			  110,  776,  110,  112,  110,  110,  440,  110,  451,  110,
			  110,  776,  110,  478,  110,  110,  112,  110,  451,  776,
			  112,  477,  110,  110,  112,  110,  445,  479,  446,  112,
			  478,  776,  110,  110,  112,  110,  451,  449,  450,  112,
			  776,  478,  447,  110,  110,  448,  110,  112,  481,  110,

			  110,  452,  110,  482,  445,  479,  446,  112,  480,  110,
			  110,  483,  110,  484,  481,  449,  450,  776,  112,  453,
			  447,  482,  454,  448,  112,  776,  481,  110,  110,  452,
			  110,  482,  483,  455,  112,  456,  776,  110,  110,  483,
			  110,  484,  485,  776,  776,  110,  110,  453,  110,  486,
			  454,  488,  112,  457,  488,  372,  372,  372,  372,  372,
			  487,  455,  112,  456,  373,  373,  373,  373,  373,  259,
			  112,  458,  459,  459,  459,  459,  459,  110,  110,  488,
			  110,  457,  489,  490,  491,  260,  111,  460,  460,  460,
			  460,  460,  461,  461,  461,  461,  461,  259,  776,  458,

			  776,  111,  112,  110,  110,  776,  110,  110,  110,  490,
			  110,  490,  491,  260,  111,  110,  110,  776,  110,  110,
			  110,  491,  110,  110,  110,  494,  110,  776,  112,  111,
			  110,  110,  112,  110,  776,  776,  495,  492,  494,  496,
			  112,  495,  538,  776,  112,  467,  776,  776,  112,  493,
			  497,  464,  465,  494,  776,  112,  430,  430,  430,  430,
			  430,  538,  463,  466,  495,  776,  498,  496,  776,  499,
			  538,  502,  503,  503,  503,  503,  503,  776,  497,  464,
			  465,  504,  504,  504,  504,  504,  776,  776,  776,  539,
			  463,  466,  500,  500,  500,  500,  500,  776,  776,  502,

			  540,  540,  776,  500,  500,  500,  500,  500,  500,  776,
			  432,  505,  505,  505,  505,  505,  437,  437,  437,  437,
			  437,  776,  506,  506,  506,  506,  506,  776,  540,  543,
			  500,  500,  500,  500,  500,  500,  500,  351,  507,  507,
			  507,  507,  507,  509,  509,  509,  509,  509,  510,  510,
			  510,  510,  510,  511,  511,  511,  511,  511,  110,  110,
			  352,  110,  703,  704,  703,  351,  506,  506,  506,  506,
			  506,  110,  110,  776,  110,  776,  508,  110,  110,  546,
			  110,  513,  776,  112,  776,  442,  440,  443,  443,  443,
			  443,  443,  110,  110,  776,  110,  112,  547,  110,  110,

			  705,  110,  112,  110,  110,  776,  110,  546,  541,  513,
			  518,  516,  110,  110,  515,  110,  776,  112,  110,  110,
			  542,  110,  519,  112,  517,  547,  110,  110,  112,  110,
			  776,  110,  110,  534,  110,  776,  541,  112,  518,  516,
			  776,  520,  776,  112,  534,  522,  110,  110,  542,  110,
			  519,  112,  517,  541,  535,  524,  112,  548,  523,  110,
			  110,  549,  110,  110,  110,  542,  110,  776,  776,  520,
			  776,  112,  534,  522,  459,  459,  459,  459,  459,  525,
			  776,  544,  776,  524,  112,  548,  523,  776,  112,  549,
			  776,  776,  111,  545,  547,  548,  527,  460,  460,  460,

			  460,  460,  549,  526,  776,  776,  553,  525,  528,  528,
			  528,  528,  528,  776,  553,  111,  110,  110,  111,  110,
			  111,  536,  550,  551,  527,  529,  529,  529,  529,  529,
			  552,  526,  110,  110,  553,  110,  110,  110,  555,  110,
			  556,  112,  554,  111,  110,  110,  111,  110,  555,  530,
			  556,  559,  776,  560,  561,  562,  559,  112,  560,  776,
			  603,  112,  604,  776,  570,  531,  555,  776,  556,  112,
			  776,  568,  568,  568,  568,  568,  557,  530,  558,  559,
			  532,  560,  561,  562,  563,  533,  564,  235,  603,  567,
			  604,  567,  570,  531,  568,  568,  568,  568,  568,  569,

			  569,  569,  569,  569,  604,  606,  776,  776,  532,  432,
			  776,  776,  776,  533,  565,  565,  565,  565,  565,  506,
			  506,  506,  506,  506,  776,  565,  565,  565,  565,  565,
			  565,  607,  605,  606,  571,  572,  572,  572,  572,  572,
			  573,  573,  573,  573,  573,  574,  574,  574,  574,  574,
			  776,  776,  565,  565,  565,  565,  565,  565,  565,  607,
			  776,  776,  571,  575,  575,  575,  575,  575,  576,  576,
			  576,  576,  576,  508,  577,  577,  577,  577,  577,  578,
			  776,  578,  776,  606,  575,  575,  575,  575,  575,  580,
			  580,  580,  580,  580,  110,  110,  776,  110,  607,  110,

			  110,  440,  110,  610,  581,  110,  110,  776,  110,  110,
			  110,  608,  110,  776,  110,  110,  587,  110,  611,  112,
			  612,  776,  613,  582,  112,  595,  609,  595,  583,  776,
			  112,  610,  581,  587,  112,  596,  611,  587,  584,  112,
			  110,  110,  776,  110,  110,  110,  611,  110,  612,  585,
			  613,  582,  612,  613,  110,  110,  583,  110,  617,  110,
			  110,  587,  110,  597,  614,  112,  584,  110,  110,  112,
			  110,  110,  110,  776,  110,  617,  776,  585,  586,  112,
			  615,  616,  110,  110,  112,  110,  617,  589,  619,  588,
			  776,  776,  112,  776,  776,  776,  112,  594,  594,  594,

			  594,  594,  776,  618,  592,  590,  586,  112,  620,  601,
			  110,  110,  591,  110,  593,  589,  619,  588,  110,  110,
			  601,  110,  110,  110,  619,  110,  110,  110,  602,  110,
			  602,  620,  592,  590,  776,  112,  620,  623,  624,  602,
			  591,  625,  593,  112,  623,  776,  776,  112,  601,  602,
			  776,  112,  621,  599,  655,  635,  656,  776,  600,  622,
			  110,  110,  598,  110,  776,  623,  624,  602,  776,  625,
			  776,  776,  626,  568,  568,  568,  568,  568,  352,  776,
			  776,  599,  655,  635,  656,  112,  600,  776,  656,  658,
			  598,  627,  627,  627,  627,  627,  568,  568,  568,  568,

			  568,  776,  627,  627,  627,  627,  627,  627,  629,  629,
			  629,  629,  629,  630,  776,  630,  657,  658,  631,  631,
			  631,  631,  631,  633,  633,  633,  633,  633,  776,  627,
			  627,  627,  627,  627,  627,  627,  632,  776,  632,  776,
			  776,  633,  633,  633,  633,  633,  634,  634,  634,  634,
			  634,  575,  575,  575,  575,  575,  636,  636,  636,  636,
			  636,  508,  575,  575,  575,  575,  575,  638,  638,  638,
			  638,  638,  639,  658,  639,  776,  644,  640,  640,  640,
			  640,  640,  635,  110,  110,  660,  110,  110,  110,  776,
			  110,  110,  110,  644,  110,  110,  110,  644,  110,  110,

			  110,  659,  110,  110,  110,  352,  110,  660,  112,  776,
			  635,  776,  112,  660,  110,  110,  112,  110,  776,  776,
			  112,  644,  643,  662,  112,  642,  776,  641,  112,  110,
			  110,  776,  110,  110,  110,  661,  110,  110,  110,  112,
			  110,  647,  647,  647,  647,  647,  649,  649,  649,  649,
			  643,  662,  662,  642,  112,  641,  110,  110,  112,  110,
			  110,  110,  112,  110,  645,  648,  648,  648,  648,  648,
			  664,  776,  665,  646,  110,  110,  666,  110,  664,  776,
			  663,  112,  684,  776,  685,  112,  684,  776,  685,  650,
			  110,  110,  645,  110,  776,  686,  651,  776,  664,  112,

			  665,  646,  776,  684,  666,  685,  667,  652,  631,  631,
			  631,  631,  631,  776,  684,  112,  685,  650,  670,  670,
			  670,  670,  670,  686,  651,  633,  633,  633,  633,  633,
			  633,  633,  633,  633,  633,  652,  671,  671,  671,  671,
			  671,  672,  776,  672,  776,  776,  673,  673,  673,  673,
			  673,  574,  574,  574,  574,  574,  432,  640,  640,  640,
			  640,  640,  110,  110,  687,  110,  635,  675,  675,  675,
			  675,  675,  110,  110,  776,  110,  687,  110,  110,  689,
			  110,  110,  110,  689,  110,  776,  776,  112,  776,  352,
			  691,  691,  687,  676,  635,  110,  110,  112,  110,  776,

			  776,  776,  112,  776,  688,  440,  112,  689,  693,  677,
			  678,  690,  679,  680,  680,  680,  680,  680,  691,  692,
			  112,  676,  681,  681,  681,  681,  681,  682,  110,  110,
			  694,  110,  110,  110,  693,  110,  693,  677,  678,  776,
			  679,  629,  629,  629,  629,  629,  673,  673,  673,  673,
			  673,  776,  776,  112,  709,  682,  776,  112,  694,  776,
			  710,  683,  695,  697,  697,  697,  697,  697,  698,  698,
			  698,  698,  698,  636,  636,  636,  636,  636,  776,  432,
			  110,  110,  709,  110,  110,  110,  776,  110,  710,  683,
			  110,  110,  776,  110,  110,  110,  776,  110,  710,  776, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  776,  508,  776,  110,  110,  112,  110,  110,  110,  112,
			  110,  440,  712,  707,  708,  112,  699,  707,  708,  112,
			  702,  702,  702,  702,  702,  776,  711,  701,  112,  712,
			  700,  714,  112,  776,  707,  708,  110,  110,  723,  110,
			  712,  776,  776,  776,  699,  707,  708,  671,  671,  671,
			  671,  671,  776,  706,  776,  701,  724,  713,  700,  714,
			  776,  112,  110,  110,  776,  110,  723,  776,  724,  716,
			  110,  110,  776,  110,  597,  597,  597,  597,  597,  110,
			  110,  706,  110,  726,  724,  508,  726,  112,  719,  719,
			  719,  719,  719,  728,  776,  112,  725,  716,  720,  720,

			  720,  720,  720,  776,  112,  110,  110,  776,  110,  734,
			  735,  726,  717,  776,  727,  718,  110,  110,  733,  110,
			  776,  728,  110,  110,  776,  110,  733,  776,  741,  721,
			  112,  731,  731,  731,  731,  731,  776,  734,  735,  733,
			  717,  112,  776,  718,  742,  110,  110,  112,  110,  110,
			  110,  730,  110,  703,  733,  703,  741,  721,  720,  720,
			  720,  720,  720,  736,  736,  736,  736,  736,  110,  110,
			  112,  110,  742,  776,  112,  776,  743,  740,  743,  730,
			  738,  738,  738,  738,  738,  740,  744,  732,  748,  753,
			  776,  705,  776,  112,  110,  110,  776,  110,  740,  737,

			  776,  739,  705,  705,  705,  705,  705,  110,  110,  776,
			  110,  776,  776,  740,  745,  732,  748,  753,  776,  112,
			  749,  749,  749,  749,  749,  110,  110,  737,  110,  739,
			  752,  776,  112,  776,  776,  776,  746,  750,  750,  750,
			  750,  752,  754,  754,  754,  754,  754,  776,  776,  776,
			  112,  752,  755,  755,  755,  755,  755,  756,  751,  110,
			  110,  776,  110,  776,  746,  758,  776,  758,  756,  752,
			  757,  757,  757,  757,  757,  759,  776,  776,  756,  745,
			  745,  745,  745,  745,  112,  764,  751,  762,  762,  762,
			  762,  762,  763,  763,  763,  763,  756,  765,  765,  765,

			  765,  765,  764,  760,  767,  776,  764,  766,  766,  766,
			  766,  766,  768,  768,  768,  768,  768,  769,  770,  769,
			  776,  767,  776,  776,  776,  767,  776,  776,  776,  776,
			  764,  760,  760,  760,  760,  760,  772,  772,  772,  772,
			  772,  773,  773,  773,  773,  773,  776,  776,  776,  767,
			  774,  774,  774,  774,  774,  771,  769,  776,  769,  776,
			  776,  773,  773,  773,  773,  773,  775,  775,  775,  775,
			  775,  771,  771,  771,  771,  771,  428,  428,  776,  776,
			  776,  776,  428,  428,  428,  428,  428,  428,  776,  776,
			  776,  776,  776,  776,  771,   72,   72,   72,   72,   72,

			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,

			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   93,   93,  776,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,  776,
			   93,   93,   93,   93,   93,   95,   95,  776,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  111,  111,  111,  776,  776,  776,  776,  776,  776,  111,
			  111,  776,  776,  111,  776,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  776,  776,
			  111,  111,  111,  138,  138,  776,  138,  138,  776,  138,
			  138,  776,  776,  776,  776,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  776,  776,
			  138,  138,  138,  139,  139,  776,  139,  139,  139,  139,

			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  190,  190,
			  776,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  192,  192,  776,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,

			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  776,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,

			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  206,  206,
			  206,  776,  776,  776,  206,  206,  776,  206,  206,  776,
			  776,  776,  776,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  776,  206,  206,  206,
			  206,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,

			  212,  212,  212,  212,  212,  212,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  219,  219,  776,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  222,  222,  776,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  237,  237,  237,  237,
			  237,  237,  237,  237,  776,  237,  237,  237,  237,  237,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  137,  137,  776,  137,  137,  776,  137,  137,  137,
			  776,  776,  776,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  776,  776,  137,  137,
			  137,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,

			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  218,  218,  218,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  776,  776,  776,  776,  776,  218,
			  333,  333,  776,  333,  776,  776,  333,  333,  333,  333,
			  333,  333,  333,  333,  333,  333,  333,  333,  333,  333,
			  333,  333,  333,  333,  333,  333,  333,  333,  333,  776,
			  776,  333,  333,  333,  327,  327,  327,  327,  327,  327,

			  776,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  776,  327,  327,  327,  327,  469,
			  469,  469,  776,  776,  776,  469,  469,  776,  469,  469,
			  776,  776,  776,  776,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  776,  776,  469,
			  469,  469,  387,  387,  387,  776,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  776,  387,  387,

			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  501,  501,  776,
			  776,  776,  776,  501,  501,  501,  501,  501,  501,  566,
			  566,  776,  776,  776,  776,  566,  566,  566,  566,  566,
			  566,  579,  579,  579,  579,  579,  579,  579,  579,  776,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  628,  628,  776,  776,

			  776,  776,  628,  628,  628,  628,  628,  628,   13,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776, yy_Dummy>>,
			1, 1792, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4791)
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
			    1,    1,    1,    1,    3,    4,    5,    6,    3,    4,
			   11,    3,    4,   12,   15,  203,   15,   15,   20,   20,

			   27,   57,   27,   27,   27,   27,   27,   29,  756,   29,
			   60,   29,   29,   29,   29,   29,   37,   37,   62,   37,
			   63,   72,    5,    6,  637,  637,  637,   51,   51,   57,
			  740,  203,   51,   51,  698,   76,    3,    4,   60,  209,
			  209,   37,  209,   20,   11,  671,   62,   12,   63,   29,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   72,
			    9,   38,   38,   51,   38,   64,    9,    9,    9,    9,
			    9,    9,   58,   76,   65,   59,   36,   36,   64,   36,
			   66,   67,   65,   58,   68,   66,   38,   59,  669,   73,

			   38,   73,   73,   64,  636,    9,    9,    9,    9,  190,
			   58,   36,   65,   59,  629,   87,   64,  325,   66,   67,
			   65,   58,   68,   66,   36,   59,   36,   90,   38,   90,
			   90,  628,    9,    9,    9,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   36,   10,   36,   39,   39,  190,   39,   10,
			   10,   10,   10,   10,   10,  325,   77,   40,   40,   87,
			   40,   61,   61,   41,   41,  602,   41,   61,   43,   43,
			   39,   43,   79,  194,   82,   82,  145,   82,   10,   10,
			   10,   10,   40,   39,   42,   42,   40,   42,   41,   61,

			   61,  707,   77,   43,   39,   61,  601,   43,   40,   41,
			   83,   83,  577,   83,  145,   10,   10,   10,   79,   42,
			  146,   39,   44,   44,   40,   44,   45,   45,  212,   45,
			   77,  194,   39,   42,   42,   43,   40,   41,   82,   42,
			   47,   47,  141,   47,  707,  141,   79,   44,  146,  149,
			  471,   45,  141,   46,   46,  194,   46,   45,   47,   47,
			  150,   42,   42,   44,   83,   47,  151,   42,  152,  153,
			   45,   46,   46,   46,   46,   46,   47,  149,   46,  470,
			   48,   48,  212,   48,   47,   45,   49,   49,  150,   49,
			  155,   44,   50,   50,  151,   50,  152,  153,   45,   46,

			   84,   84,  157,   84,   47,   48,  451,   85,   85,  441,
			   85,   49,   47,  434,   84,   84,  668,   50,  155,   98,
			   48,   85,  158,   98,   84,   48,  193,   49,  193,  193,
			  157,   85,   98,   98,   98,   98,   98,  101,  101,  101,
			  101,  101,   50,  103,  103,  103,  103,  103,   48,  159,
			  158,  160,  101,   48,   84,   49,  106,  106,  106,  106,
			  106,   85,  110,  110,  668,  110,  424,   98,  163,  166,
			   50,   55,  715,  715,   55,  101,   98,  159,  423,  160,
			  101,   55,   98,  334,  444,  333,   98,  110,   98,   55,
			   55,   55,   55,   55,   55,  164,  163,  166,  164,  327,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,  164,  444,  319,  164,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   56,  316,  148,   56,  148,  148,  148,  148,  148,  293,
			   56,  104,  104,  104,  104,  104,  291,  275,   56,   56,
			   56,   56,   56,   56,  167,  169,  104,  167,  272,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,

			   56,   56,  167,  169,  104,  167,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   75,
			   75,  230,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   88,   88,  229,   88,  228,  211,  211,  195,
			  211,  227,  105,  226,  105,  224,  105,  105,  105,  105,
			  105,  195,  195,  195,  195,  195,  223,  195,  222,   88,
			  221,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,  105,  111,  111,  216,  111,  195,
			  201,  115,  115,  231,  115,  231,  231,  204,  204,  197,
			  204,  192,  168,  165,  205,  205,  170,  205,  113,  113,
			  111,  113,  162,   88,   96,   96,  115,   96,   96,   96,

			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,  113,  170,  115,  138,  138,   96,   96,
			   96,   96,   96,   96,  161,  171,  113,  114,  114,  138,
			  114,  204,  116,  116,  172,  116,  117,  117,  205,  117,
			  144,  118,  118,  115,  118,  142,  627,   96,   96,   96,
			   96,  139,  114,  171,  113,  119,  119,  116,  119,  114,
			  138,  117,  172,  137,  100,  627,  118,  117,  120,  120,
			   99,  120,   95,  117,   96,   96,   96,  116,   93,  118,
			  119,  121,  121,   91,  121,  122,  122,  114,  122,  123,
			  123,  120,  123,  120,  627,  117,  154,  124,  124,  119,

			  124,  117,  154,  173,  174,  116,  121,  118,  125,  125,
			  122,  125,   80,  175,  123,   69,  122,  126,  126,  122,
			  126,  176,  124,  121,  154,  127,  127,  119,  127,   54,
			  154,  173,  174,  125,   35,  330,  330,  177,  330,  178,
			  156,  175,  126,  124,  122,  123,  156,  122,  126,  176,
			  127,  121,   34,   32,  125,  179,   28,  127,   26,  129,
			  129,   18,  129,  131,  131,  177,  131,  178,  156,   17,
			  180,  124,  130,  130,  156,  130,  126,  129,  129,  129,
			  129,  129,  125,  179,  129,  127,  128,  128,  131,  128,
			  130,  130,  130,  130,  130,  182,  131,  130,  180,  131,

			  184,  185,   16,   13,  128,  128,  128,  128,  128,    0,
			  186,  128,  132,  132,    0,  132,  198,    0,  128,  133,
			  133,  187,  133,  182,  131,  128,  188,  131,  184,  185,
			  134,  134,  200,  134,  128,    0,  128,  132,  186,    0,
			    0,  276,  135,  135,  133,  135,  128,  136,  136,  187,
			  136,    0,  198,  128,  188,  134,  133,  181,    0,  132,
			  133,  181,  128,  134,  128,    0,  183,  135,  200,  276,
			  183,    0,  136,    0,    0,  280,  206,  206,    0,  206,
			  198,    0,    0,    0,  133,  181,  135,  132,  133,  181,
			  206,  134,  208,  208,  183,  208,  200,  136,  183,  225,

			  206,  217,  217,  280,  217,    0,  208,  225,  225,  225,
			  225,  225,  225,  234,  135,  234,  208,  282,  234,  234,
			  234,  234,  234,    0,    0,  136,  143,    0,  217,  283,
			  206,  235,  235,  235,  235,  235,  236,  236,  236,  236,
			  236,    0,  239,    0,  239,  282,  208,  239,  239,  239,
			  239,  239,  241,  241,  241,  241,  241,  283,    0,    0,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  284,    0,

			  210,  233,  233,  233,  233,  233,  210,  210,  210,  210,
			  210,  210,  285,    0,  286,    0,  233,  238,  238,  238,
			  238,  238,  378,  378,  378,  378,  284,  243,  243,    0,
			  243,    0,  238,  287,    0,  210,  210,  210,  210,  233,
			  285,  240,  286,  240,  233,  240,  240,  240,  240,  240,
			  242,  242,  243,  242,  288,  238,  253,  253,  289,  253,
			  238,  287,  210,  210,  210,  213,  213,  278,  213,  278,
			  278,  278,  278,  278,  279,  242,  279,  279,  279,  279,
			  279,  253,  288,  240,  386,  386,  289,  386,    0,    0,
			    0,  242,  213,  253,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  244,  244,  242,
			  244,  253,  245,  245,  290,  245,  246,  246,    0,  246,
			  292,  247,  247,  250,  247,  248,  248,    0,  248,  295,
			  249,  249,  244,  249,  250,  296,  213,  245,    0,  244,
			    0,  246,  290,    0,  250,  245,  247,    0,  292,    0,
			  248,    0,  297,    0,  246,  249,  298,  295,  251,  251,
			    0,  251,  250,  296,  299,    0,  247,  244,  252,  252,
			  248,  252,  300,  245,  254,  254,    0,  254,  255,  255,
			  297,  255,  246,  251,  298,    0,  249,  256,  256,  301,

			  256,    0,  299,  252,  247,  302,  251,    0,  248,  254,
			  300,  257,  257,  255,  257,  303,  252,  258,  258,  255,
			  258,  254,  256,  259,  259,    0,  259,  301,  306,  261,
			  261,  307,  261,  302,  251,  294,  257,    0,  308,    0,
			  309,    0,  258,  303,  252,    0,  294,  255,  259,  254,
			  258,  310,  260,  260,  261,  260,  306,  294,  257,  307,
			    0,    0,  262,  262,    0,  262,  308,  294,  309,  259,
			  260,  260,  260,  260,  260,    0,  311,  260,  258,  310,
			  262,  262,  262,  262,  262,  294,  257,  262,  264,  264,
			    0,  264,  265,  265,    0,  265,    0,    0,  260,  267,

			  267,  264,  267,  264,  311,  312,    0,  313,  262,  263,
			  263,  264,  263,  264,    0,    0,  314,  265,  266,  266,
			    0,  266,  268,  268,  267,  268,    0,  263,  263,  263,
			  263,  263,  265,  312,  263,  313,  315,  269,  269,  264,
			  269,  317,  267,  266,  314,  263,    0,  268,  263,  270,
			  270,  266,  270,  318,  263,  271,  271,  322,  271,  323,
			  265,    0,  269,    0,  315,    0,  268,    0,    0,  317,
			  267,  388,    0,  263,  270,    0,  263,    0,    0,  266,
			  271,  318,  263,  328,  328,  322,  328,  323,  329,  329,
			    0,  329,  389,  269,  268,  331,  331,  328,  331,  388,

			  339,    0,  390,  359,  359,  271,  359,  328,  339,  339,
			  339,  339,  339,  339,  345,  345,  345,  345,  345,    0,
			  389,    0,  331,  346,  346,  346,  346,  346,  359,  345,
			  390,    0,    0,  271,  324,  427,  427,  328,  427,    0,
			  468,  468,  329,  468,    0,    0,    0,  324,  324,  324,
			  324,  324,  345,  391,    0,  393,  394,  345,  324,  324,
			  324,  324,  324,  324,  347,  347,  347,  347,  347,  348,
			  348,  348,  348,  348,  349,  349,  349,  349,  349,    0,
			    0,  391,  324,  393,  394,  324,  324,  324,  324,  324,
			  324,  324,  350,  350,  350,  350,  350,  352,  352,  352,

			  352,  352,  347,  351,  396,  351,    0,  350,  351,  351,
			  351,  351,  351,  353,  353,  353,  353,  353,  354,  354,
			  354,  354,  354,  356,  356,  356,  356,  356,  357,  357,
			  350,  357,  396,  355,  355,  350,  355,  355,  355,  355,
			  355,  358,  358,  397,  358,  360,  360,  364,  360,  361,
			  361,    0,  361,  357,  362,  362,  354,  362,  364,  363,
			  363,    0,  363,  398,  365,  365,  358,  365,  364,    0,
			  360,  397,  366,  366,  361,  366,  357,  399,  358,  362,
			  400,    0,  367,  367,  363,  367,  364,  362,  363,  365,
			    0,  398,  360,  368,  368,  361,  368,  366,  401,  369,

			  369,  365,  369,  402,  357,  399,  358,  367,  400,  370,
			  370,  403,  370,  404,  405,  362,  363,    0,  368,  366,
			  360,  406,  367,  361,  369,    0,  401,  371,  371,  365,
			  371,  402,  407,  368,  370,  369,    0,  372,  372,  403,
			  372,  404,  405,    0,    0,  376,  376,  366,  376,  406,
			  367,  408,  371,  370,  409,  372,  372,  372,  372,  372,
			  407,  368,  372,  369,  373,  373,  373,  373,  373,  372,
			  376,  371,  374,  374,  374,  374,  374,  379,  379,  408,
			  379,  370,  409,  410,  411,  373,  374,  375,  375,  375,
			  375,  375,  377,  377,  377,  377,  377,  372,    0,  371,

			    0,  375,  379,  380,  380,    0,  380,  381,  381,  412,
			  381,  410,  411,  373,  374,  382,  382,    0,  382,  383,
			  383,  413,  383,  384,  384,  418,  384,    0,  380,  375,
			  385,  385,  381,  385,    0,    0,  419,  412,  421,  420,
			  382,  422,  472,    0,  383,  385,    0,    0,  384,  413,
			  420,  383,  384,  418,    0,  385,  430,  430,  430,  430,
			  430,  473,  382,  384,  419,    0,  421,  420,    0,  422,
			  472,  430,  431,  431,  431,  431,  431,    0,  420,  383,
			  384,  432,  432,  432,  432,  432,    0,    0,    0,  473,
			  382,  384,  425,  425,  425,  425,  425,    0,    0,  430,

			  474,  476,    0,  425,  425,  425,  425,  425,  425,    0,
			  431,  433,  433,  433,  433,  433,  436,  436,  436,  436,
			  436,    0,  435,  435,  435,  435,  435,    0,  474,  476,
			  425,  425,  425,  425,  425,  425,  425,  435,  437,  437,
			  437,  437,  437,  438,  438,  438,  438,  438,  439,  439,
			  439,  439,  439,  440,  440,  440,  440,  440,  445,  445,
			  435,  445,  681,  681,  681,  435,  442,  442,  442,  442,
			  442,  446,  446,    0,  446,    0,  437,  448,  448,  479,
			  448,  442,    0,  445,    0,  443,  439,  443,  443,  443,
			  443,  443,  447,  447,    0,  447,  446,  481,  449,  449,

			  681,  449,  448,  450,  450,    0,  450,  479,  475,  442,
			  448,  446,  452,  452,  445,  452,    0,  447,  454,  454,
			  475,  454,  448,  449,  447,  481,  453,  453,  450,  453,
			    0,  455,  455,  467,  455,    0,  475,  452,  448,  446,
			    0,  450,    0,  454,  467,  452,  456,  456,  475,  456,
			  448,  453,  447,  477,  467,  454,  455,  482,  453,  457,
			  457,  483,  457,  458,  458,  477,  458,  469,  469,  450,
			  469,  456,  467,  452,  459,  459,  459,  459,  459,  456,
			    0,  477,    0,  454,  457,  482,  453,    0,  458,  483,
			    0,    0,  459,  477,  485,  486,  458,  460,  460,  460,

			  460,  460,  487,  457,    0,    0,  488,  456,  461,  461,
			  461,  461,  461,    0,  489,  460,  463,  463,  460,  463,
			  459,  469,  485,  486,  458,  462,  462,  462,  462,  462,
			  487,  457,  464,  464,  488,  464,  465,  465,  490,  465,
			  491,  463,  489,  460,  466,  466,  460,  466,  492,  463,
			  493,  494,    0,  495,  496,  497,  498,  464,  499,    0,
			  537,  465,  538,    0,  505,  464,  490,    0,  491,  466,
			    0,  503,  503,  503,  503,  503,  492,  463,  493,  494,
			  465,  495,  496,  497,  498,  466,  499,  505,  537,  502,
			  538,  502,  505,  464,  502,  502,  502,  502,  502,  504,

			  504,  504,  504,  504,  539,  540,    0,    0,  465,  503,
			    0,    0,    0,  466,  500,  500,  500,  500,  500,  506,
			  506,  506,  506,  506,    0,  500,  500,  500,  500,  500,
			  500,  541,  539,  540,  506,  507,  507,  507,  507,  507,
			  508,  508,  508,  508,  508,  509,  509,  509,  509,  509,
			    0,    0,  500,  500,  500,  500,  500,  500,  500,  541,
			    0,    0,  506,  510,  510,  510,  510,  510,  511,  511,
			  511,  511,  511,  507,  512,  512,  512,  512,  512,  513,
			    0,  513,    0,  543,  513,  513,  513,  513,  513,  514,
			  514,  514,  514,  514,  515,  515,    0,  515,  544,  516,

			  516,  510,  516,  546,  514,  517,  517,    0,  517,  518,
			  518,  543,  518,    0,  519,  519,  521,  519,  547,  515,
			  548,    0,  549,  515,  516,  529,  544,  529,  516,    0,
			  517,  546,  514,  521,  518,  529,  550,  521,  517,  519,
			  520,  520,    0,  520,  522,  522,  547,  522,  548,  518,
			  549,  515,  551,  552,  523,  523,  516,  523,  553,  524,
			  524,  521,  524,  529,  550,  520,  517,  525,  525,  522,
			  525,  526,  526,    0,  526,  554,    0,  518,  520,  523,
			  551,  552,  527,  527,  524,  527,  553,  523,  555,  522,
			    0,    0,  525,    0,    0,    0,  526,  528,  528,  528,

			  528,  528,    0,  554,  526,  524,  520,  527,  556,  534,
			  530,  530,  525,  530,  527,  523,  555,  522,  531,  531,
			  534,  531,  532,  532,  557,  532,  533,  533,  535,  533,
			  534,  558,  526,  524,    0,  530,  556,  560,  561,  535,
			  525,  562,  527,  531,  564,    0,    0,  532,  534,  535,
			    0,  533,  557,  532,  603,  574,  604,    0,  533,  558,
			  584,  584,  531,  584,    0,  560,  561,  535,    0,  562,
			    0,    0,  564,  567,  567,  567,  567,  567,  574,    0,
			    0,  532,  603,  574,  604,  584,  533,    0,  605,  607,
			  531,  565,  565,  565,  565,  565,  568,  568,  568,  568,

			  568,    0,  565,  565,  565,  565,  565,  565,  569,  569,
			  569,  569,  569,  570,    0,  570,  605,  607,  570,  570,
			  570,  570,  570,  572,  572,  572,  572,  572,    0,  565,
			  565,  565,  565,  565,  565,  565,  571,    0,  571,    0,
			    0,  571,  571,  571,  571,  571,  573,  573,  573,  573,
			  573,  575,  575,  575,  575,  575,  576,  576,  576,  576,
			  576,  572,  578,  578,  578,  578,  578,  580,  580,  580,
			  580,  580,  581,  609,  581,    0,  587,  581,  581,  581,
			  581,  581,  580,  582,  582,  613,  582,  583,  583,    0,
			  583,  585,  585,  587,  585,  586,  586,  587,  586,  588,

			  588,  609,  588,  589,  589,  580,  589,  616,  582,    0,
			  580,    0,  583,  613,  590,  590,  585,  590,    0,    0,
			  586,  587,  585,  619,  588,  583,    0,  582,  589,  591,
			  591,    0,  591,  592,  592,  616,  592,  593,  593,  590,
			  593,  594,  594,  594,  594,  594,  596,  596,  596,  596,
			  585,  619,  621,  583,  591,  582,  598,  598,  592,  598,
			  599,  599,  593,  599,  590,  595,  595,  595,  595,  595,
			  623,    0,  624,  592,  600,  600,  625,  600,  626,    0,
			  621,  598,  653,    0,  654,  599,  653,    0,  654,  598,
			  645,  645,  590,  645,    0,  655,  599,    0,  623,  600,

			  624,  592,    0,  653,  625,  654,  626,  600,  630,  630,
			  630,  630,  630,    0,  653,  645,  654,  598,  631,  631,
			  631,  631,  631,  655,  599,  632,  632,  632,  632,  632,
			  633,  633,  633,  633,  633,  600,  634,  634,  634,  634,
			  634,  635,    0,  635,    0,    0,  635,  635,  635,  635,
			  635,  638,  638,  638,  638,  638,  631,  639,  639,  639,
			  639,  639,  641,  641,  656,  641,  638,  640,  640,  640,
			  640,  640,  642,  642,    0,  642,  657,  643,  643,  658,
			  643,  646,  646,  659,  646,    0,    0,  641,    0,  638,
			  662,  663,  656,  641,  638,  650,  650,  642,  650,    0,

			    0,    0,  643,    0,  657,  640,  646,  658,  664,  642,
			  643,  659,  646,  648,  648,  648,  648,  648,  662,  663,
			  650,  641,  649,  649,  649,  649,  649,  650,  651,  651,
			  665,  651,  652,  652,  667,  652,  664,  642,  643,    0,
			  646,  670,  670,  670,  670,  670,  672,  672,  672,  672,
			  672,    0,    0,  651,  686,  650,    0,  652,  665,    0,
			  687,  651,  667,  673,  673,  673,  673,  673,  674,  674,
			  674,  674,  674,  675,  675,  675,  675,  675,    0,  670,
			  676,  676,  686,  676,  677,  677,    0,  677,  687,  651,
			  678,  678,    0,  678,  679,  679,    0,  679,  688,    0, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,  673,    0,  682,  682,  676,  682,  683,  683,  677,
			  683,  675,  691,  684,  685,  678,  676,  684,  685,  679,
			  680,  680,  680,  680,  680,    0,  688,  679,  682,  692,
			  677,  694,  683,    0,  684,  685,  699,  699,  709,  699,
			  691,    0,    0,    0,  676,  684,  685,  697,  697,  697,
			  697,  697,    0,  683,    0,  679,  710,  692,  677,  694,
			    0,  699,  700,  700,    0,  700,  709,    0,  711,  699,
			  701,  701,    0,  701,  702,  702,  702,  702,  702,  706,
			  706,  683,  706,  712,  710,  697,  713,  700,  703,  703,
			  703,  703,  703,  714,    0,  701,  711,  699,  704,  704,

			  704,  704,  704,    0,  706,  716,  716,    0,  716,  723,
			  728,  712,  700,    0,  713,  701,  717,  717,  722,  717,
			    0,  714,  718,  718,    0,  718,  722,    0,  734,  706,
			  716,  719,  719,  719,  719,  719,    0,  723,  728,  722,
			  700,  717,    0,  701,  735,  721,  721,  718,  721,  730,
			  730,  716,  730,  720,  722,  720,  734,  706,  720,  720,
			  720,  720,  720,  729,  729,  729,  729,  729,  732,  732,
			  721,  732,  735,    0,  730,    0,  736,  733,  736,  716,
			  731,  731,  731,  731,  731,  733,  736,  721,  741,  748,
			    0,  720,    0,  732,  737,  737,    0,  737,  733,  730,

			    0,  732,  738,  738,  738,  738,  738,  739,  739,    0,
			  739,    0,    0,  733,  736,  721,  741,  748,    0,  737,
			  743,  743,  743,  743,  743,  746,  746,  730,  746,  732,
			  747,    0,  739,    0,    0,    0,  737,  744,  744,  744,
			  744,  747,  749,  749,  749,  749,  749,    0,    0,    0,
			  746,  747,  750,  750,  750,  750,  750,  752,  746,  751,
			  751,    0,  751,    0,  737,  755,    0,  755,  752,  747,
			  754,  754,  754,  754,  754,  755,    0,    0,  752,  757,
			  757,  757,  757,  757,  751,  761,  746,  758,  758,  758,
			  758,  758,  759,  759,  759,  759,  752,  762,  762,  762,

			  762,  762,  761,  755,  764,    0,  761,  763,  763,  763,
			  763,  763,  765,  765,  765,  765,  765,  766,  766,  766,
			    0,  764,    0,    0,    0,  764,    0,    0,    0,    0,
			  761,  768,  768,  768,  768,  768,  769,  769,  769,  769,
			  769,  770,  770,  770,  770,  770,    0,    0,    0,  764,
			  772,  772,  772,  772,  772,  766,  773,    0,  773,    0,
			    0,  773,  773,  773,  773,  773,  774,  774,  774,  774,
			  774,  775,  775,  775,  775,  775,  803,  803,    0,    0,
			    0,    0,  803,  803,  803,  803,  803,  803,    0,    0,
			    0,    0,    0,    0,  773,  777,  777,  777,  777,  777,

			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,

			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,

			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  782,  782,    0,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,    0,
			  782,  782,  782,  782,  782,  783,  783,    0,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,

			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  784,  784,  784,    0,    0,    0,    0,    0,    0,  784,
			  784,    0,    0,  784,    0,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,    0,    0,
			  784,  784,  784,  785,  785,    0,  785,  785,    0,  785,
			  785,    0,    0,    0,    0,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,    0,    0,
			  785,  785,  785,  786,  786,    0,  786,  786,  786,  786,

			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  787,  787,
			    0,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  788,  788,    0,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,

			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,    0,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  791,  791,
			  791,    0,    0,    0,  791,  791,    0,  791,  791,    0,
			    0,    0,    0,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,    0,  791,  791,  791,
			  791,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,

			  792,  792,  792,  792,  792,  792,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  794,  794,    0,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  795,  795,    0,  795,

			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  797,  797,  797,  797,
			  797,  797,  797,  797,    0,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  798,  798,    0,  798,  798,    0,  798,  798,  798,
			    0,    0,    0,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,    0,    0,  798,  798,
			  798,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,

			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  800,  800,  800,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,    0,    0,    0,    0,    0,  800,
			  801,  801,    0,  801,    0,    0,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,    0,
			    0,  801,  801,  801,  802,  802,  802,  802,  802,  802,

			    0,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,    0,  802,  802,  802,  802,  804,
			  804,  804,    0,    0,    0,  804,  804,    0,  804,  804,
			    0,    0,    0,    0,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,    0,    0,  804,
			  804,  804,  805,  805,  805,    0,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,    0,  805,  805,

			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  806,  806,    0,
			    0,    0,    0,  806,  806,  806,  806,  806,  806,  807,
			  807,    0,    0,    0,    0,  807,  807,  807,  807,  807,
			  807,  808,  808,  808,  808,  808,  808,  808,  808,    0,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  809,  809,    0,    0,

			    0,    0,  809,  809,  809,  809,  809,  809,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776, yy_Dummy>>,
			1, 1792, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64, 1003, 4708,   92,  999,  941,  954, 4708,
			   88, 4708, 4708, 4708, 4708, 4708,  941,   82,  937,   91,
			 4708, 4708,  925, 4708,  924,  904,  184,  114,  169,  253,
			  265,  271,  292,  276,  320,  324,  351,  338,  378,  384,
			  390,  115, 4708, 4708,  872,  469,  548,   70,  142,  154,
			   72,  230,   87,   77,  142,  146,  148,  148,  142,  896,
			 4708, 4708,  114,  197, 4708,  628,  128,  247, 4708,  263,
			  857, 4708,  282,  308,  398,  405, 4708,  186,  710, 4708,
			  225,  880, 4708,  871, 4708,  861,  793,    0,  412,  867,

			  846,  417, 4708,  423,  541,  706,  436, 4708, 4708, 4708,
			  460,  763, 4708,  786,  825,  769,  830,  834,  839,  853,
			  866,  879,  883,  887,  895,  906,  915,  923,  984,  957,
			  970,  961, 1010, 1017, 1028, 1040, 1045,  838,  804,  794,
			 4708,  340,  832, 1101,  821,  246,  286,    0,  534,  309,
			  326,  320,  322,  322,  863,  343,  907,  362,  376,  409,
			  405,  799,  767,  424,  462,  725,  425,  541,  724,  527,
			  738,  777,  786,  870,  870,  880,  887,  902,  890,  920,
			  921, 1018,  960, 1027,  965,  955,  964,  969,  974, 4708,
			  202, 4708,  774,  424,  276,  711, 4708,  772,  997, 4708,

			 1013,  715, 4708,   76,  775,  782, 1074, 4708, 1090,  137,
			 1181,  715,  299, 1263, 4708, 4708,  738, 1099, 4708, 4708,
			 4708,  661,  712,  725,  714, 1088,  712,  710,  705,  703,
			  620,  771, 4708, 1181, 1098, 1111, 1116, 4708, 1197, 1127,
			 1225, 1132, 1248, 1225, 1315, 1320, 1324, 1329, 1333, 1338,
			 1303, 1366, 1376, 1254, 1382, 1386, 1395, 1409, 1415, 1421,
			 1450, 1427, 1460, 1507, 1486, 1490, 1516, 1497, 1520, 1535,
			 1547, 1553,  553, 4708, 4708,  548,  998,    0, 1249, 1256,
			 1032,    0, 1083, 1095, 1163, 1172, 1167, 1198, 1214, 1211,
			 1277,  508, 1283,  501, 1416, 1299, 1305, 1323, 1327, 1334,

			 1342, 1360, 1372, 1382,    0,    0, 1379, 1396, 1389, 1405,
			 1409, 1441, 1463, 1472, 1471, 1490,  493, 1496, 1507,  467,
			    0,    0, 1505, 1507, 1627,  210, 4708,  496, 1581, 1586,
			  933, 1593,    0,  459,  472, 4708, 4708, 4708, 4708, 1589,
			 4708, 4708, 4708, 4708, 4708, 1594, 1603, 1644, 1649, 1654,
			 1672, 1688, 1677, 1693, 1698, 1716, 1703, 1726, 1739, 1601,
			 1743, 1747, 1752, 1757, 1717, 1762, 1770, 1780, 1791, 1797,
			 1807, 1825, 1835, 1844, 1852, 1867, 1843, 1872, 1202, 1875,
			 1901, 1905, 1913, 1917, 1921, 1928, 1282,    0, 1521, 1542,
			 1563, 1614,    0, 1606, 1608,    0, 1655, 1695, 1728, 1746,

			 1745, 1759, 1754, 1769, 1771, 1775, 1772, 1790, 1813, 1816,
			 1837, 1838, 1863, 1875,    0,    0,    0,    0, 1876, 1902,
			 1908, 1889, 1907,  461,  449, 1972, 4708, 1633,    0, 4708,
			 1936, 1952, 1961, 1991,  397, 2002, 1996, 2018, 2023, 2028,
			 2033,  389, 2046, 2067,  466, 2056, 2069, 2090, 2075, 2096,
			 2101,  381, 2110, 2124, 2116, 2129, 2144, 2157, 2161, 2154,
			 2177, 2188, 2205, 2214, 2230, 2234, 2242, 2103, 1638, 2165,
			  321,  292, 1900, 1919, 1966, 2073, 1967, 2118,    0, 2039,
			    0, 2062, 2123, 2122,    0, 2159, 2161, 2163, 2171, 2179,
			 2192, 2205, 2202, 2215, 2216, 2218, 2208, 2212, 2221, 2223,

			 2294,    0, 2274, 2251, 2279, 2229, 2299, 2315, 2320, 2325,
			 2343, 2348, 2354, 2364, 2369, 2392, 2397, 2403, 2407, 2412,
			 2438, 2386, 2442, 2452, 2457, 2465, 2469, 2480, 2477, 2410,
			 2508, 2516, 2520, 2524, 2479, 2498, 4708, 2229, 2231, 2273,
			 2270, 2289,    0, 2348, 2356,    0, 2363, 2371, 2385, 2374,
			 2389, 2417, 2405, 2411, 2428, 2453, 2474, 2489, 2497,    0,
			 2491, 2505, 2507,    0, 2498, 2571,    0, 2553, 2576, 2588,
			 2598, 2621, 2603, 2626, 2520, 2631, 2636,  295, 2642, 4708,
			 2647, 2657, 2681, 2685, 2558, 2689, 2693, 2646, 2697, 2701,
			 2712, 2727, 2731, 2735, 2721, 2745, 2726, 4708, 2754, 2758,

			 2772,  289,  258, 2508, 2516, 2548,    0, 2556,    0, 2640,
			    0,    0,    0, 2633,    0,    0, 2655,    0,    0, 2681,
			    0, 2710,    0, 2735, 2734, 2741, 2743,  839,  205,  156,
			 2788, 2798, 2805, 2810, 2816, 2826,  146,  104, 2831, 2837,
			 2847, 2860, 2870, 2875, 4708, 2788, 2879, 4708, 2893, 2902,
			 2893, 2926, 2930, 2752, 2754, 2762, 2825, 2837, 2844, 2848,
			    0,    0, 2857, 2858, 2874, 2895,    0, 2900,  409,  187,
			 2921,   87, 2926, 2943, 2948, 2953, 2978, 2982, 2988, 2992,
			 3000, 2047, 3001, 3005, 2983, 2984, 2916, 2912, 2950,    0,
			    0, 2977, 2994,    0, 2983,    0, 4708, 3027,   86, 3034,

			 3060, 3068, 3054, 3068, 3078, 4708, 3077,  296, 4708, 3003,
			 3004, 3016, 3036, 3039, 3041,  452, 3103, 3114, 3120, 3111,
			 3138, 3143, 3088, 3061,    0,    0,    0,    0, 3066, 3143,
			 3147, 3160, 3166, 3147, 3076, 3109, 3161, 3192, 3182, 3205,
			  105, 3144,    0, 3200, 3217, 4708, 3223, 3200, 3154, 3222,
			 3232, 3257, 3227,    0, 3250, 3250,   83, 3259, 3267, 3272,
			 4708, 3255, 3277, 3287, 3274, 3292, 3302, 4708, 3311, 3316,
			 3321, 4708, 3330, 3341, 3346, 3351, 4708, 3394, 3439, 3484,
			 3529, 3574, 3619, 3664, 3708, 3748, 3792, 3837, 3882, 3927,
			 3972, 4016, 4060, 4105, 4150, 4195, 4240, 4285, 4326, 4370,

			 4414, 4449, 4493, 3365, 4537, 4581, 4616, 4628, 4650, 4685, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  776,    1,  777,  777,  778,  778,  779,  779,  780,
			  780,  781,  781,  776,  776,  776,  776,  776,  782,  776,
			  783,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  785,  776,  776,  786,  776,  776,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,  776,
			  776,  776,  787,  776,  776,  776,  788,  789,  776,  789,
			  790,  776,  791,  776,  791,  791,  776,  792,  793,  776,
			  776,  776,  776,  782,  776,  794,  795,  794,  794,  796,

			  776,  776,  776,  776,  797,  776,  776,  776,  776,  776,
			  776,  784,  776,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  798,  785,  786,
			  776,  776,  776,   56,  776,  143,  143,   56,   56,   56,
			   56,  143,   56,  143,  143,   56,   56,  143,  143,   56,
			   56,  143,   56,  143,  143,  143,   56,   56,   56,  143,
			   56,  143,   56,  143,  143,   56,   56,  143,  143,   56,
			   56,  143,  143,   56,   56,  143,   56,  143,   56,  776,
			  787,  776,  788,  776,  787,   75,  776,  788,  789,  776,

			  789,  790,  776,  790,  791,  776,  791,  776,  776,  776,
			  799,  776,  792,  793,  776,  776,  213,  800,  776,  776,
			  776,  776,  801,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  784,  784,  784,  784,  784,  784,  784,  784,
			  776,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  776,  776,  776,  776,  143,  143,  776,  143,
			   56,   56,  143,   56,  143,  143,  143,   56,   56,   56,
			  143,  143,   56,   56,  776,  143,  143,  143,  143,   56,

			   56,   56,  143,   56,  143,   56,  143,  143,   56,   56,
			  143,  143,   56,   56,  143,  143,  143,   56,   56,   56,
			  143,   56,  143,   56,  787,  787,  776,  802,  802,  776,
			  802,  800,  803,  801,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  784,  784,  784,
			  784,  784,  784,  784,  776,  784,  784,  784,  784,  784,
			  784,  784,  784,  372,  372,  372,  784,  776,  776,  784,
			  784,  784,  784,  784,  784,  784,  804,  805,  143,   56,
			  143,   56,  143,  143,  143,   56,   56,   56,  143,  143,

			   56,  143,  143,  143,  143,   56,   56,   56,  143,   56,
			  143,  143,   56,   56,  143,  143,   56,   56,  143,  143,
			  143,   56,   56,  143,   56,  324,  776,  776,  806,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  797,  776,  776,  784,  784,  784,  784,  784,
			  784,  776,  784,  784,  784,  784,  784,  784,  784,  263,
			  263,  776,  776,  784,  784,  784,  784,  776,  776,  804,
			  143,   56,  143,   56,  143,  143,   56,   56,  143,  143,
			   56,  143,  143,  143,  143,   56,   56,   56,  143,   56,
			  143,  143,   56,   56,  143,  143,  143,  143,   56,   56,

			  425,  807,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  808,  784,  784,  784,  784,  784,
			  784,  776,  784,  784,  784,  784,  784,  784,  776,  776,
			  784,  784,  784,  784,  776,  776,  776,  143,  143,   56,
			  143,  143,  143,   56,   56,   56,  143,  143,  143,  143,
			   56,   56,   56,  143,   56,  143,  143,   56,   56,  143,
			  143,  143,  143,   56,   56,  500,  809,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  784,  784,  784,  784,  784,  776,  784,  784,
			  784,  784,  784,  784,  776,  776,  776,  776,  784,  784,

			  784,  776,  776,  143,  143,   56,  143,  143,   56,   56,
			  143,  143,  143,  143,   56,   56,   56,  143,   56,  143,
			  143,   56,   56,  143,  143,  143,   56,  787,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  784,  784,  784,  776,  784,  784,  776,  776,  776,
			  784,  784,  784,  776,  776,  143,  143,   56,  143,   56,
			  143,   56,  143,   56,  143,  143,  143,   56,  787,  776,
			  776,  776,  776,  776,  776,  776,  784,  784,  784,  784,
			  776,  776,  784,  784,  776,  776,  143,  143,   56,  143,
			   56,  143,   56,  143,  143,   56,  776,  776,  776,  784,

			  784,  784,  776,  776,  776,  776,  784,  776,  776,  143,
			  143,   56,  143,   56,  143,  776,  784,  784,  784,  776,
			  776,  784,  776,  143,  143,   56,  143,   56,  143,  776,
			  784,  776,  784,  776,  143,  143,  776,  784,  776,  784,
			  776,  143,  143,  776,  776,  776,  784,  776,  143,  776,
			  776,  784,  776,  143,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,    0,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,

			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    8,    9,    1,   10,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,   20,
			   21,   22,   23,   23,   23,   24,   24,   24,   25,   26,
			   27,   28,   29,   30,    1,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   37,   37,   40,   41,   42,   43,
			   44,   45,   46,   47,   48,   49,   37,   50,   51,   52,
			   53,   54,   55,   56,   57,   58,    1,   59,   60,   61,

			   62,   63,   64,   65,   66,   67,   65,   65,   68,   69,
			   70,   71,   72,   73,   74,   75,   76,   77,   65,   78,
			   79,   80,   65,   81,   82,   83,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    1,    1,    5,    6,    1,    1,    7,    8,    9,   10,
			   11,   11,   11,   11,   12,   13,   14,   15,    1,   16,
			    1,   17,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,    1,   40,   41,    1,   11,   11,
			   11,   11,   11,   11,   11,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   43,
			   44,    1,    1,   45, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  127,  125,    1,    2,   15,  103,   18,
			  125,   16,   17,    7,    6,   13,    5,   11,    8,   94,
			   14,   12,   29,   10,   30,   20,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   79,   87,   87,   87,
			   87,   22,   31,   23,    9,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   24,
			   21,   25,  108,  109,  110,  108,  111,  126,   92,  126,
			  126,  126,  126,  126,  126,  126,   66,  126,  126,   86,
			    1,    2,   28,  103,  102,  123,  123,  123,  123,    3,

			   33,   98,   32,    0,    0,   94,    0,   27,   26,   19,
			    0,   87,   83,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   40,   87,   78,
			   87,   87,   87,   87,   87,   87,   87,    0,    0,    0,
			   93,    0,    0,   89,    0,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   40,   89,   40,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   90,
			  108,  110,    0,  109,  108,  108,  105,  104,    0,   92,

			    0,    0,   91,    0,    0,    0,    0,   66,    0,   64,
			    0,   63,    0,    0,   86,   84,   84,    0,   85,  123,
			  112,  123,  123,  123,  123,  123,  123,  123,  123,  123,
			  123,    4,   34,   98,    0,    0,    0,   96,   98,   96,
			   94,    0,   87,   39,   87,   87,   87,   87,   87,   87,
			    0,   87,   87,   87,   87,   87,   42,   87,   87,   79,
			   79,   77,   79,   87,   74,   87,   87,   87,   87,   87,
			   41,   87,    0,   67,   88,    0,   89,   39,   68,   68,
			   89,   39,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,    0,   89,   89,   89,   89,   89,

			   89,   89,   89,   89,   42,   42,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   41,   41,   89,   89,  108,  106,   91,    0,    0,   65,
			   63,    0,    0,    0,    0,  119,  117,  120,  124,  124,
			  118,  116,  113,  114,  115,   98,    0,   98,    0,    0,
			   98,    0,    0,    0,   97,   94,    0,   87,   87,   38,
			   87,   87,   87,   87,    0,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   78,   78,   78,    0,    0,   74,
			   37,   44,   87,   87,   87,   87,   62,   60,   89,   89,
			   89,   89,   38,   89,   89,   38,   89,   89,   89,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   37,   44,   37,   44,   89,   89,
			   89,   89,   89,   89,   89,  108,   65,   63,    0,  121,
			   98,   98,    0,    0,   95,   98,    0,   97,    0,   97,
			    0,    0,    0,   94,    0,   87,   87,   87,   87,   45,
			   87,    0,   87,   87,   87,   36,   87,   87,   87,   87,
			   87,    0,    0,   87,   87,   87,   87,    0,   62,    0,
			   89,   89,   89,   89,   89,   89,   89,   89,   45,   89,
			   45,   89,   89,   89,   36,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,

			  108,    0,    0,   98,    0,  101,   98,   97,    0,    0,
			   97,    0,    0,   96,    0,   87,   87,   87,   87,   47,
			   87,    0,   87,   87,   87,   87,   87,   87,    0,   73,
			   53,   87,   87,   87,    0,    0,   61,   89,   89,   89,
			   89,   89,   47,   89,   89,   47,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   53,
			   89,   89,   89,   53,   89,  108,    0,    0,   98,    0,
			    0,    0,   97,    0,  101,   97,    0,   76,    0,   99,
			  101,   99,   87,   87,   59,   87,   46,    0,   43,   58,
			   87,   35,   87,   51,    0,    0,    0,   73,   87,   87,

			   87,    0,    0,   89,   89,   89,   59,   89,   59,   89,
			   46,   43,   58,   89,   43,   58,   89,   35,   35,   89,
			   51,   89,   51,   89,   89,   89,   89,  108,    0,  101,
			    0,  101,    0,   97,    0,    0,  100,    0,  101,    0,
			  100,   87,   87,   87,   81,   54,   87,   74,    0,    0,
			   87,   87,   55,    0,    0,   89,   89,   89,   89,   89,
			   54,   54,   89,   89,   89,   89,   55,   89,  107,    0,
			  101,  100,    0,  100,    0,  100,   87,   87,   48,   87,
			    0,   72,   52,   87,    0,    0,   89,   89,   89,   48,
			   48,   89,   89,   52,   89,   52,  122,  100,   75,   87,

			   87,   87,    0,    0,    0,   72,   87,   80,   80,   89,
			   89,   89,   89,   89,   89,    0,   87,   50,   49,    0,
			   72,   87,    0,   89,   50,   50,   49,   49,   89,    0,
			   87,    0,   87,    0,   89,   89,   71,   87,    0,   56,
			    0,   89,   56,    0,    0,   71,   87,    0,   89,    0,
			    0,   57,    0,   57,    0,   70,    0,    0,    0,    0,
			   70,    0,    0,    0,    0,    0,   69,   82,    0,    0,
			    0,   69,    0,   69,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4708
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 776
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 777
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

feature {NONE} -- Constants

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

invariant

	in_buffer_not_void: in_buffer /= Void

end
