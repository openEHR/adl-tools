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
if yy_act <= 94 then
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
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
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
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 308 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 308")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 82 then
--|#line 320 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 320")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 325 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 325")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 329 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 329")
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
 			
else
--|#line 361 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 361")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
else
if yy_act = 86 then
--|#line 366 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 366")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 371 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 371")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
end
else
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act = 88 then
--|#line 377 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 377")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 383 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 383")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 90 then
--|#line 389 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 389")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 393 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 393")
end
 		-- match final segment
				in_buffer.append_string (text)
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
 			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 403 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 403")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 410 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 410")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
--|#line 415 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 415")
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
else
if yy_act <= 110 then
if yy_act <= 102 then
if yy_act <= 98 then
if yy_act <= 96 then
if yy_act = 95 then
	yy_end := yy_end - 1
--|#line 430 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 430")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 431 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 431")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 97 then
--|#line 432 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 432")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 436 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 436")
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
if yy_act <= 100 then
if yy_act = 99 then
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
					
else
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
					
end
else
if yy_act = 101 then
--|#line 458 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 458")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 462 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 462")
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
if yy_act <= 106 then
if yy_act <= 104 then
if yy_act = 103 then
--|#line 468 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 468")
end
in_buffer.append_character ('\')
else
--|#line 469 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 469")
end
in_buffer.append_character ('"')
end
else
if yy_act = 105 then
--|#line 470 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 470")
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
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
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
if yy_act <= 108 then
if yy_act = 107 then
--|#line 498 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 498")
end
in_buffer.append_string (text)
else
--|#line 500 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 500")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
end
else
if yy_act = 109 then
--|#line 505 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 505")
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
--|#line 516 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 516")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
end
end
end
else
if yy_act <= 118 then
if yy_act <= 114 then
if yy_act <= 112 then
if yy_act = 111 then
--|#line 524 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 524")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 525 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 525")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
if yy_act = 113 then
--|#line 526 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 526")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
end
else
if yy_act <= 116 then
if yy_act = 115 then
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
end
last_token := V_CHARACTER; last_character_value := '%F'
else
--|#line 529 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 529")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 117 then
--|#line 530 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 530")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
end
last_token := V_CHARACTER; last_character_value := '"'
end
end
end
else
if yy_act <= 122 then
if yy_act <= 120 then
if yy_act = 119 then
--|#line 532 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 532")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
else
--|#line 537 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 537")
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
if yy_act = 121 then
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
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
--|#line 557 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 557")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 124 then
if yy_act = 123 then
--|#line 558 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 558")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 562 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 562")
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
			create an_array.make (0, 4798)
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

			  167,  653,  200,  112,  117,  168,  637,  124,  119,  120,
			  205,  205,  537,  205,  276,   81,   81,   81,  200,  112,
			  277,  116,  110,  110,  118,  110,  110,  110,  213,  110,
			  201,  192,  117,  121,  122,  124,  119,  120,  207,  123,
			  110,  110,  141,  110,  537,  141,  201,  112,  277,  276,
			  521,  112,  142,  110,  110,  324,  110,  126,  130,  130,
			  277,  121,  122,  125,  207,  112,  282,  123,  282,  284,
			  127,  128,  128,  128,  128,  128,  131,  280,  112,  512,
			  110,  110,  214,  110,  132,  126,  110,  110,  281,  110,
			  284,  125,  110,  110,  282,  110,  283,  284,  127,  129,

			  208,  205,  290,  208,  131,  112,  722,  208,  205,  722,
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
			   91,  255,  110,  110,  289,  110,  257,  263,  263,  263,
			  263,  263,  256,  312,  112,  258,  110,  110,  112,  110,
			  264,  264,  264,  264,  264,  776,  265,  112,  110,  110,

			  311,  110,  316,  776,  128,  128,  128,  128,  128,  316,
			  776,  112,  199,  110,  110,  776,  110,  776,  259,  110,
			  110,  320,  110,  112,  265,  260,  110,  110,  313,  110,
			  316,  314,  202,  320,  261,  315,  262,  319,  112,  322,
			  110,  110,  776,  110,  112,  266,  259,  322,  200,  320,
			  267,  112,  269,  260,  268,  388,  314,  776,  364,  314,
			  315,  321,  261,  315,  262,  112,  388,  322,  200,  364,
			  270,  208,  205,  266,  208,  323,  201,  776,  267,  364,
			  269,  776,  268,  388,  317,  209,  208,  205,  318,  208,
			  271,  776,  776,  390,  389,  211,  201,  364,  270,  390,

			  209,  331,  331,  337,  331,  345,  345,  345,  345,  345,
			  211,  338,  339,  339,  339,  339,  339,  392,  271,  776,
			  234,  390,  393,  394,  346,  207,  346,  391,  217,  347,
			  347,  347,  347,  347,  348,  348,  348,  348,  348,  776,
			  207,  468,  468,  235,  468,  392,  211,  211,  234,  211,
			  393,  394,  776,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  327,  328,  329,  327,  328,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  209,  776,  776,  327,  349,  349,  349,  349,  349,  327,

			  330,  327,  327,  327,  327,  350,  350,  350,  350,  350,
			  353,  776,  353,  776,  776,  354,  354,  354,  354,  354,
			  351,  356,  356,  356,  356,  356,  776,  776,  327,  327,
			  207,  327,  103,  776,  104,  392,  355,  355,  355,  355,
			  355,  110,  110,  352,  110,  393,  110,  110,  351,  110,
			  776,  110,  110,  776,  110,  327,  327,  327,  216,  216,
			  776,  216,  776,  395,  205,  205,  112,  205,  776,  468,
			  468,  112,  468,  396,  106,  278,  112,  278,  278,  278,
			  278,  278,  357,  358,  776,  217,  394,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  357,  358,  110,  110,  397,  110,  110,  110,  207,  110,
			  398,  110,  110,  398,  110,  110,  110,  776,  110,  401,
			  110,  110,  776,  110,  776,  110,  110,  112,  110,  218,
			  776,  112,  776,  776,  402,  359,  112,  776,  398,  776,
			  112,  400,  403,  776,  360,  112,  404,  401,  110,  110,
			  112,  110,  110,  110,  401,  110,  361,  402,  110,  110,
			  362,  110,  402,  359,  110,  110,  776,  110,  110,  110,
			  403,  110,  360,  112,  404,  776,  363,  112,  110,  110,
			  776,  110,  405,  112,  361,  406,  365,  776,  362,  112,

			  366,  110,  110,  112,  110,  367,  776,  110,  110,  369,
			  110,  368,  278,  112,  279,  279,  279,  279,  279,  776,
			  776,  776,  110,  110,  365,  110,  112,  275,  366,  776,
			  403,  776,  112,  367,  371,  370,  408,  369,  364,  368,
			  372,  372,  372,  372,  372,  110,  110,  112,  110,  364,
			  408,  776,  776,  129,  110,  110,  776,  110,  407,  364,
			  410,  776,  371,  370,  408,  776,  110,  110,  129,  110,
			  112,  411,  373,  373,  373,  373,  373,  364,  409,  112,
			  110,  110,  776,  110,  110,  110,  776,  110,  410,  110,
			  110,  112,  110,  377,  776,  377,  776,  776,  776,  411,

			  129,  110,  110,  378,  110,  112,  380,  776,  410,  112,
			  110,  110,  776,  110,  112,  411,  414,  381,  776,  263,
			  263,  263,  263,  263,  110,  110,  112,  110,  415,  414,
			  415,  379,  382,  418,  380,  112,  412,  374,  110,  110,
			  375,  110,  419,  413,  414,  381,  376,  110,  110,  112,
			  110,  418,  776,  419,  383,  423,  415,  416,  417,  423,
			  382,  418,  470,  112,  776,  374,  331,  331,  375,  331,
			  419,  776,  112,  776,  376,  328,  329,  776,  328,  421,
			  384,  422,  383,  423,  776,  776,  776,  424,  776,  209,
			  470,  776,  337,  776,  470,  472,  472,  385,  776,  330,

			  338,  339,  339,  339,  339,  339,  430,  430,  430,  430,
			  430,  347,  347,  347,  347,  347,  433,  433,  433,  433,
			  433,  234,  471,  472,  473,  385,  191,  451,  776,  207,
			  431,  431,  431,  431,  431,  776,  776,  776,  451,  425,
			  425,  425,  425,  425,  235,  776,  776,  474,  451,  234,
			  425,  425,  425,  425,  425,  425,  434,  434,  434,  434,
			  434,  435,  435,  435,  435,  435,  451,  776,  432,  438,
			  438,  438,  438,  438,  192,  474,  351,  425,  425,  425,
			  425,  425,  425,  425,  436,  776,  436,  776,  776,  437,
			  437,  437,  437,  437,  354,  354,  354,  354,  354,  352,

			  110,  110,  776,  110,  351,  439,  439,  439,  439,  439,
			  441,  442,  776,  443,  443,  443,  443,  443,  444,  444,
			  444,  444,  444,  776,  776,  112,  110,  110,  475,  110,
			  110,  110,  776,  110,  110,  110,  776,  110,  776,  110,
			  110,  776,  110,  440,  110,  110,  776,  110,  445,  110,
			  110,  112,  110,  776,  776,  112,  475,  110,  110,  112,
			  110,  474,  776,  446,  112,  110,  110,  776,  110,  112,
			  110,  110,  776,  110,  112,  776,  445,  449,  450,  475,
			  776,  447,  112,  110,  110,  448,  110,  776,  478,  476,
			  112,  446,  479,  776,  452,  112,  110,  110,  478,  110,

			  110,  110,  776,  110,  776,  449,  450,  477,  112,  447,
			  454,  776,  453,  448,  110,  110,  478,  110,  776,  776,
			  479,  112,  452,  455,  776,  112,  480,  110,  110,  481,
			  110,  776,  456,  373,  373,  373,  373,  373,  454,  112,
			  453,  776,  776,  482,  457,  372,  372,  372,  372,  372,
			  483,  455,  112,  484,  260,  481,  482,  481,  458,  259,
			  456,  459,  459,  459,  459,  459,  460,  460,  460,  460,
			  460,  482,  457,  110,  110,  111,  110,  776,  483,  776,
			  111,  484,  260,  485,  486,  776,  458,  259,  461,  461,
			  461,  461,  461,  462,  462,  462,  462,  776,  112,  110,

			  110,  776,  110,  111,  110,  110,  776,  110,  111,  110,
			  110,  483,  110,  110,  110,  488,  110,  110,  110,  776,
			  110,  776,  110,  110,  112,  110,  488,  776,  490,  112,
			  110,  110,  776,  110,  112,  491,  490,  491,  112,  487,
			  494,  495,  112,  488,  494,  467,  496,  112,  495,  464,
			  534,  465,  776,  776,  489,  112,  490,  497,  538,  538,
			  463,  534,  466,  491,  492,  493,  776,  776,  494,  495,
			  776,  535,  498,  540,  496,  776,  499,  464,  776,  465,
			  503,  503,  503,  503,  503,  497,  538,  539,  463,  534,
			  466,  500,  500,  500,  500,  500,  430,  430,  430,  430,

			  430,  540,  500,  500,  500,  500,  500,  500,  540,  546,
			  547,  502,  504,  504,  504,  504,  504,  548,  432,  505,
			  505,  505,  505,  505,  437,  437,  437,  437,  437,  500,
			  500,  500,  500,  500,  500,  500,  543,  546,  547,  502,
			  506,  506,  506,  506,  506,  548,  507,  507,  507,  507,
			  507,  110,  110,  549,  110,  351,  509,  509,  509,  509,
			  509,  510,  510,  510,  510,  510,  511,  511,  511,  511,
			  511,  506,  506,  506,  506,  506,  112,  776,  352,  110,
			  110,  549,  110,  351,  508,  442,  513,  443,  443,  443,
			  443,  443,  110,  110,  776,  110,  776,  110,  110,  440,

			  110,  547,  110,  110,  112,  110,  776,  515,  110,  110,
			  776,  110,  110,  110,  513,  110,  548,  112,  776,  516,
			  549,  553,  112,  553,  517,  110,  110,  112,  110,  550,
			  518,  110,  110,  112,  110,  110,  110,  112,  110,  776,
			  110,  110,  519,  110,  551,  522,  520,  516,  552,  553,
			  112,  554,  517,  555,  556,  555,  112,  523,  518,  556,
			  112,  110,  110,  776,  110,  112,  110,  110,  524,  110,
			  519,  776,  559,  522,  520,  459,  459,  459,  459,  459,
			  776,  555,  556,  557,  526,  523,  112,  558,  776,  776,
			  776,  112,  776,  111,  525,  776,  524,  776,  776,  527,

			  559,  776,  460,  460,  460,  460,  460,  528,  528,  528,
			  528,  528,  526,  529,  529,  529,  529,  529,  560,  561,
			  111,  111,  525,  111,  541,  110,  110,  527,  110,  110,
			  110,  776,  110,  541,  110,  110,  542,  110,  110,  110,
			  562,  110,  559,  536,  560,  542,  560,  561,  111,  776,
			  112,  111,  541,  776,  112,  776,  776,  603,  530,  112,
			  604,  544,  531,  112,  542,  703,  704,  703,  562,  776,
			  563,  776,  564,  545,  776,  567,  604,  567,  532,  533,
			  568,  568,  568,  568,  568,  603,  530,  776,  604,  776,
			  531,  568,  568,  568,  568,  568,  569,  569,  569,  569,

			  569,  776,  570,  705,  605,  776,  532,  533,  565,  565,
			  565,  565,  565,  506,  506,  506,  506,  506,  776,  565,
			  565,  565,  565,  565,  565,  235,  606,  607,  571,  432,
			  570,  572,  572,  572,  572,  572,  573,  573,  573,  573,
			  573,  574,  574,  574,  574,  574,  565,  565,  565,  565,
			  565,  565,  565,  776,  606,  607,  571,  575,  575,  575,
			  575,  575,  576,  576,  576,  576,  576,  776,  776,  508,
			  577,  577,  577,  577,  577,  578,  776,  578,  776,  606,
			  575,  575,  575,  575,  575,  580,  580,  580,  580,  580,
			  110,  110,  776,  110,  776,  440,  110,  110,  776,  110,

			  581,  110,  110,  607,  110,  110,  110,  608,  110,  776,
			  110,  110,  587,  110,  776,  112,  776,  110,  110,  582,
			  110,  112,  595,  610,  595,  583,  112,  776,  581,  587,
			  112,  609,  596,  587,  584,  112,  110,  110,  776,  110,
			  776,  776,  112,  110,  110,  585,  110,  582,  776,  110,
			  110,  610,  110,  583,  776,  586,  611,  587,  776,  776,
			  597,  112,  584,  110,  110,  776,  110,  776,  112,  110,
			  110,  601,  110,  585,  112,  612,  589,  613,  611,  612,
			  776,  588,  601,  586,  611,  776,  110,  110,  112,  110,
			  110,  110,  602,  110,  112,  590,  594,  594,  594,  594,

			  594,  613,  592,  612,  589,  613,  614,  615,  591,  588,
			  601,  112,  617,  110,  110,  112,  110,  617,  593,  110,
			  110,  602,  110,  590,  110,  110,  619,  110,  776,  616,
			  592,  620,  602,  619,  620,  623,  591,  624,  112,  625,
			  617,  623,  602,  776,  112,  618,  593,  655,  656,  112,
			  599,  776,  110,  110,  619,  110,  600,  598,  776,  620,
			  602,  621,  622,  623,  776,  624,  776,  625,  656,  626,
			  568,  568,  568,  568,  568,  655,  656,  112,  599,  568,
			  568,  568,  568,  568,  600,  598,  627,  627,  627,  627,
			  627,  629,  629,  629,  629,  629,  657,  627,  627,  627,

			  627,  627,  627,  630,  776,  630,  776,  776,  631,  631,
			  631,  631,  631,  632,  776,  632,  776,  776,  633,  633,
			  633,  633,  633,  635,  627,  627,  627,  627,  627,  627,
			  627,  633,  633,  633,  633,  633,  634,  634,  634,  634,
			  634,  575,  575,  575,  575,  575,  352,  110,  110,  776,
			  110,  635,  636,  636,  636,  636,  636,  575,  575,  575,
			  575,  575,  638,  638,  638,  638,  638,  110,  110,  508,
			  110,  658,  112,  639,  776,  639,  658,  635,  640,  640,
			  640,  640,  640,  110,  110,  644,  110,  110,  110,  776,
			  110,  641,  112,  110,  110,  776,  110,  776,  643,  658,

			  352,  776,  644,  776,  659,  635,  644,  776,  112,  660,
			  110,  110,  112,  110,  110,  110,  776,  110,  112,  641,
			  776,  642,  110,  110,  660,  110,  643,  776,  110,  110,
			  644,  110,  776,  110,  110,  112,  110,  660,  776,  112,
			  647,  647,  647,  647,  647,  110,  110,  112,  110,  642,
			  776,  662,  661,  112,  649,  649,  649,  649,  112,  648,
			  648,  648,  648,  648,  645,  662,  110,  110,  646,  110,
			  112,  664,  110,  110,  776,  110,  665,  776,  650,  662,
			  666,  664,  631,  631,  631,  631,  631,  750,  750,  750,
			  750,  112,  645,  663,  776,  776,  646,  112,  776,  664,

			  776,  776,  651,  686,  665,  652,  650,  687,  666,  667,
			  670,  670,  670,  670,  670,  633,  633,  633,  633,  633,
			  633,  633,  633,  633,  633,  671,  671,  671,  671,  671,
			  651,  686,  672,  652,  672,  687,  776,  673,  673,  673,
			  673,  673,  574,  574,  574,  574,  574,  776,  432,  640,
			  640,  640,  640,  640,  776,  687,  776,  635,  675,  675,
			  675,  675,  675,  110,  110,  689,  110,  110,  110,  776,
			  110,  776,  110,  110,  776,  110,  110,  110,  776,  110,
			  352,  110,  110,  688,  110,  635,  776,  776,  112,  776,
			  776,  776,  112,  689,  676,  776,  440,  112,  776,  110,

			  110,  112,  110,  776,  677,  678,  112,  680,  680,  680,
			  680,  680,  679,  681,  681,  681,  681,  681,  110,  110,
			  689,  110,  676,  684,  112,  110,  110,  684,  110,  691,
			  691,  682,  677,  678,  693,  685,  694,  693,  709,  685,
			  679,  776,  776,  112,  684,  776,  776,  776,  690,  776,
			  112,  683,  776,  776,  776,  684,  685,  691,  692,  682,
			  776,  776,  693,  776,  694,  695,  709,  685,  629,  629,
			  629,  629,  629,  673,  673,  673,  673,  673,  776,  683,
			  697,  697,  697,  697,  697,  698,  698,  698,  698,  698,
			  636,  636,  636,  636,  636,  110,  110,  776,  110,  110, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  110,  776,  110,  776,  110,  110,  432,  110,  110,  110,
			  776,  110,  702,  702,  702,  702,  702,  776,  508,  776,
			  112,  710,  110,  110,  112,  110,  710,  712,  440,  112,
			  707,  699,  776,  112,  707,  110,  110,  712,  110,  714,
			  708,  701,  723,  724,  708,  700,  776,  112,  776,  710,
			  776,  707,  776,  776,  711,  712,  776,  724,  776,  699,
			  112,  708,  707,  110,  110,  713,  110,  714,  776,  701,
			  723,  724,  708,  700,  671,  671,  671,  671,  671,  110,
			  110,  706,  110,  110,  110,  725,  110,  776,  112,  597,
			  597,  597,  597,  597,  726,  726,  716,  719,  719,  719,

			  719,  719,  110,  110,  112,  110,  728,  776,  112,  706,
			  776,  734,  508,  720,  720,  720,  720,  720,  110,  110,
			  776,  110,  726,  727,  716,  735,  741,  112,  718,  717,
			  110,  110,  776,  110,  728,  110,  110,  742,  110,  734,
			  776,  733,  776,  112,  731,  731,  731,  731,  731,  733,
			  776,  748,  721,  735,  741,  112,  718,  717,  776,  776,
			  112,  703,  733,  703,  730,  742,  720,  720,  720,  720,
			  720,  110,  110,  776,  110,  110,  110,  733,  110,  748,
			  721,  736,  736,  736,  736,  736,  738,  738,  738,  738,
			  738,  776,  730,  740,  110,  110,  112,  110,  753,  705,

			  112,  740,  743,  776,  743,  110,  110,  758,  110,  758,
			  776,  776,  744,  732,  740,  776,  776,  759,  776,  112,
			  705,  705,  705,  705,  705,  737,  753,  739,  776,  740,
			  112,  110,  110,  776,  110,  749,  749,  749,  749,  749,
			  745,  732,  776,  110,  110,  760,  110,  746,  752,  763,
			  763,  763,  763,  737,  776,  739,  112,  776,  776,  752,
			  754,  754,  754,  754,  754,  769,  770,  769,  112,  752,
			  755,  755,  755,  755,  755,  746,  751,  110,  110,  756,
			  110,  757,  757,  757,  757,  757,  776,  752,  776,  776,
			  756,  745,  745,  745,  745,  745,  764,  776,  776,  776,

			  756,  776,  112,  771,  751,  762,  762,  762,  762,  762,
			  776,  776,  767,  764,  776,  776,  776,  764,  756,  765,
			  765,  765,  765,  765,  766,  766,  766,  766,  766,  767,
			  776,  776,  776,  767,  768,  768,  768,  768,  768,  776,
			  776,  764,  760,  760,  760,  760,  760,  772,  772,  772,
			  772,  772,  773,  773,  773,  773,  773,  767,  774,  774,
			  774,  774,  774,  769,  776,  769,  776,  776,  773,  773,
			  773,  773,  773,  775,  775,  775,  775,  775,  771,  771,
			  771,  771,  771,  428,  428,  776,  776,  776,  776,  428,
			  428,  428,  428,  428,  428,  776,  776,  776,  776,  776,

			  776,  771,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   81,   81,   81,   81,   81,   81,   81,   81,

			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   93,   93,  776,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  776,   93,   93,   93,
			   93,   93,   95,   95,  776,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,  111,  111,  111,
			  776,  776,  776,  776,  776,  776,  111,  111,  776,  776,
			  111,  776,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  776,  776,  111,  111,  111,
			  138,  138,  776,  138,  138,  776,  138,  138,  776,  776,
			  776,  776,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  776,  776,  138,  138,  138,

			  139,  139,  776,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  190,  190,  776,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  192,  192,  776,  192,  192,  192,  192,  192,  192,  192,

			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  776,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,

			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  206,  206,  206,  776,  776,
			  776,  206,  206,  776,  206,  206,  776,  776,  776,  776,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  776,  206,  206,  206,  206,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,

			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  219,  219,
			  776,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,

			  219,  219,  219,  222,  222,  776,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,  237,  237,  237,  237,  237,  237,  237,

			  237,  776,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  137,  137,
			  776,  137,  137,  776,  137,  137,  137,  776,  776,  776,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  776,  776,  137,  137,  137,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,

			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  218,  218,  218,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  776,  776,  776,  776,  776,  218,  333,  333,  776,
			  333,  776,  776,  333,  333,  333,  333,  333,  333,  333,
			  333,  333,  333,  333,  333,  333,  333,  333,  333,  333,
			  333,  333,  333,  333,  333,  333,  776,  776,  333,  333,

			  333,  327,  327,  327,  327,  327,  327,  776,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  776,  327,  327,  327,  327,  469,  469,  469,  776,
			  776,  776,  469,  469,  776,  469,  469,  776,  776,  776,
			  776,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  776,  776,  469,  469,  469,  387,
			  387,  387,  776,  387,  387,  387,  387,  387,  387,  387,

			  387,  387,  387,  387,  776,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  501,  501,  776,  776,  776,  776,
			  501,  501,  501,  501,  501,  501,  566,  566,  776,  776,
			  776,  776,  566,  566,  566,  566,  566,  566,  579,  579,
			  579,  579,  579,  579,  579,  579,  776,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,

			  579,  579,  579,  628,  628,  776,  776,  776,  776,  628,
			  628,  628,  628,  628,  628,   13,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776, yy_Dummy>>,
			1, 1799, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4798)
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

			   61,  601,   77,   43,   39,   61,  577,   43,   40,   41,
			   83,   83,  471,   83,  145,   10,   10,   10,   79,   42,
			  146,   39,   44,   44,   40,   44,   45,   45,  212,   45,
			   77,  194,   39,   42,   42,   43,   40,   41,   82,   42,
			   47,   47,  141,   47,  470,  141,   79,   44,  146,  149,
			  451,   45,  141,   46,   46,  194,   46,   45,   47,   47,
			  150,   42,   42,   44,   83,   47,  151,   42,  152,  153,
			   45,   46,   46,   46,   46,   46,   47,  149,   46,  441,
			   48,   48,  212,   48,   47,   45,   49,   49,  150,   49,
			  155,   44,   50,   50,  151,   50,  152,  153,   45,   46,

			   84,   84,  157,   84,   47,   48,  707,   85,   85,  707,
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
			   16,  124,  130,  130,  156,  130,  126,  129,  129,  129,
			  129,  129,  125,  179,  129,  127,  128,  128,  131,  128,
			  130,  130,  130,  130,  130,   13,  131,  130,  132,  132,

			  180,  132,  182,    0,  128,  128,  128,  128,  128,  184,
			    0,  128,  198,  133,  133,    0,  133,    0,  128,  134,
			  134,  185,  134,  132,  131,  128,  135,  135,  180,  135,
			  182,  181,  200,  186,  128,  181,  128,  184,  133,  187,
			  136,  136,    0,  136,  134,  132,  128,  188,  198,  185,
			  133,  135,  134,  128,  133,  276,  183,    0,  250,  181,
			  183,  186,  128,  181,  128,  136,  280,  187,  200,  250,
			  135,  206,  206,  132,  206,  188,  198,    0,  133,  250,
			  134,    0,  133,  276,  183,  206,  208,  208,  183,  208,
			  136,    0,    0,  282,  280,  206,  200,  250,  135,  283,

			  208,  217,  217,  225,  217,  233,  233,  233,  233,  233,
			  208,  225,  225,  225,  225,  225,  225,  284,  136,  143,
			  233,  282,  285,  286,  234,  206,  234,  283,  217,  234,
			  234,  234,  234,  234,  235,  235,  235,  235,  235,    0,
			  208,  386,  386,  233,  386,  284,  427,  427,  233,  427,
			  285,  286,    0,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,    0,    0,  210,  236,  236,  236,  236,  236,  210,

			  210,  210,  210,  210,  210,  238,  238,  238,  238,  238,
			  239,    0,  239,    0,    0,  239,  239,  239,  239,  239,
			  238,  241,  241,  241,  241,  241,    0,    0,  210,  210,
			  210,  210,  240,    0,  240,  287,  240,  240,  240,  240,
			  240,  242,  242,  238,  242,  288,  243,  243,  238,  243,
			    0,  244,  244,    0,  244,  210,  210,  210,  213,  213,
			    0,  213,    0,  287,  329,  329,  242,  329,    0,  468,
			  468,  243,  468,  288,  240,  278,  244,  278,  278,  278,
			  278,  278,  242,  244,    0,  213,  289,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  242,  244,  245,  245,  289,  245,  246,  246,  329,  246,
			  290,  247,  247,  292,  247,  248,  248,    0,  248,  295,
			  249,  249,    0,  249,    0,  256,  256,  245,  256,  213,
			    0,  246,    0,    0,  296,  245,  247,    0,  290,    0,
			  248,  292,  297,    0,  246,  249,  298,  295,  251,  251,
			  256,  251,  252,  252,  299,  252,  247,  300,  253,  253,
			  248,  253,  296,  245,  254,  254,    0,  254,  255,  255,
			  297,  255,  246,  251,  298,    0,  249,  252,  257,  257,
			    0,  257,  299,  253,  247,  300,  251,    0,  248,  254,

			  252,  258,  258,  255,  258,  253,    0,  259,  259,  255,
			  259,  254,  279,  257,  279,  279,  279,  279,  279,    0,
			    0,    0,  260,  260,  251,  260,  258,  294,  252,    0,
			  301,    0,  259,  253,  258,  257,  302,  255,  294,  254,
			  260,  260,  260,  260,  260,  261,  261,  260,  261,  294,
			  303,    0,    0,  259,  262,  262,    0,  262,  301,  294,
			  306,    0,  258,  257,  302,    0,  265,  265,  260,  265,
			  261,  307,  262,  262,  262,  262,  262,  294,  303,  262,
			  264,  264,    0,  264,  266,  266,    0,  266,  306,  267,
			  267,  265,  267,  264,    0,  264,    0,    0,    0,  307,

			  262,  263,  263,  264,  263,  264,  265,    0,  308,  266,
			  268,  268,    0,  268,  267,  309,  310,  266,    0,  263,
			  263,  263,  263,  263,  269,  269,  263,  269,  311,  312,
			  313,  264,  267,  314,  265,  268,  308,  263,  270,  270,
			  263,  270,  315,  309,  310,  266,  263,  271,  271,  269,
			  271,  317,    0,  318,  268,  322,  311,  312,  313,  323,
			  267,  314,  388,  270,    0,  263,  331,  331,  263,  331,
			  315,    0,  271,    0,  263,  328,  328,    0,  328,  317,
			  269,  318,  268,  322,    0,    0,    0,  323,    0,  328,
			  388,    0,  339,  331,  389,  390,  391,  271,    0,  328,

			  339,  339,  339,  339,  339,  339,  345,  345,  345,  345,
			  345,  346,  346,  346,  346,  346,  348,  348,  348,  348,
			  348,  345,  389,  390,  391,  271,  324,  364,    0,  328,
			  347,  347,  347,  347,  347,    0,    0,    0,  364,  324,
			  324,  324,  324,  324,  345,    0,    0,  393,  364,  345,
			  324,  324,  324,  324,  324,  324,  349,  349,  349,  349,
			  349,  350,  350,  350,  350,  350,  364,    0,  347,  352,
			  352,  352,  352,  352,  324,  393,  350,  324,  324,  324,
			  324,  324,  324,  324,  351,    0,  351,    0,    0,  351,
			  351,  351,  351,  351,  353,  353,  353,  353,  353,  350,

			  357,  357,    0,  357,  350,  354,  354,  354,  354,  354,
			  355,  355,    0,  355,  355,  355,  355,  355,  356,  356,
			  356,  356,  356,    0,    0,  357,  358,  358,  394,  358,
			  359,  359,    0,  359,  360,  360,    0,  360,    0,  361,
			  361,    0,  361,  354,  362,  362,    0,  362,  357,  363,
			  363,  358,  363,    0,    0,  359,  394,  365,  365,  360,
			  365,  396,    0,  358,  361,  366,  366,    0,  366,  362,
			  367,  367,    0,  367,  363,    0,  357,  362,  363,  397,
			    0,  360,  365,  368,  368,  361,  368,    0,  398,  396,
			  366,  358,  399,    0,  365,  367,  369,  369,  400,  369,

			  370,  370,    0,  370,    0,  362,  363,  397,  368,  360,
			  367,    0,  366,  361,  371,  371,  398,  371,    0,    0,
			  399,  369,  365,  368,    0,  370,  400,  372,  372,  401,
			  372,    0,  369,  373,  373,  373,  373,  373,  367,  371,
			  366,    0,    0,  402,  370,  372,  372,  372,  372,  372,
			  403,  368,  372,  404,  373,  405,  406,  401,  371,  372,
			  369,  374,  374,  374,  374,  374,  375,  375,  375,  375,
			  375,  402,  370,  376,  376,  374,  376,    0,  403,    0,
			  375,  404,  373,  405,  406,    0,  371,  372,  377,  377,
			  377,  377,  377,  378,  378,  378,  378,    0,  376,  379,

			  379,    0,  379,  374,  380,  380,    0,  380,  375,  381,
			  381,  407,  381,  382,  382,  408,  382,  383,  383,    0,
			  383,    0,  384,  384,  379,  384,  409,    0,  410,  380,
			  385,  385,    0,  385,  381,  411,  412,  413,  382,  407,
			  418,  419,  383,  408,  421,  385,  420,  384,  422,  383,
			  467,  384,    0,    0,  409,  385,  410,  420,  472,  473,
			  382,  467,  384,  411,  412,  413,    0,    0,  418,  419,
			    0,  467,  421,  474,  420,    0,  422,  383,    0,  384,
			  431,  431,  431,  431,  431,  420,  472,  473,  382,  467,
			  384,  425,  425,  425,  425,  425,  430,  430,  430,  430,

			  430,  474,  425,  425,  425,  425,  425,  425,  476,  479,
			  481,  430,  432,  432,  432,  432,  432,  482,  431,  433,
			  433,  433,  433,  433,  436,  436,  436,  436,  436,  425,
			  425,  425,  425,  425,  425,  425,  476,  479,  481,  430,
			  435,  435,  435,  435,  435,  482,  437,  437,  437,  437,
			  437,  445,  445,  483,  445,  435,  438,  438,  438,  438,
			  438,  439,  439,  439,  439,  439,  440,  440,  440,  440,
			  440,  442,  442,  442,  442,  442,  445,    0,  435,  446,
			  446,  483,  446,  435,  437,  443,  442,  443,  443,  443,
			  443,  443,  447,  447,    0,  447,    0,  448,  448,  439,

			  448,  485,  449,  449,  446,  449,    0,  445,  450,  450,
			    0,  450,  452,  452,  442,  452,  486,  447,    0,  446,
			  487,  488,  448,  489,  447,  453,  453,  449,  453,  485,
			  448,  454,  454,  450,  454,  455,  455,  452,  455,    0,
			  457,  457,  448,  457,  486,  452,  450,  446,  487,  488,
			  453,  489,  447,  490,  491,  492,  454,  453,  448,  493,
			  455,  456,  456,    0,  456,  457,  458,  458,  454,  458,
			  448,    0,  494,  452,  450,  459,  459,  459,  459,  459,
			    0,  490,  491,  492,  457,  453,  456,  493,    0,  469,
			  469,  458,  469,  459,  456,    0,  454,    0,    0,  458,

			  494,    0,  460,  460,  460,  460,  460,  461,  461,  461,
			  461,  461,  457,  462,  462,  462,  462,  462,  495,  496,
			  460,  459,  456,  460,  475,  463,  463,  458,  463,  464,
			  464,    0,  464,  477,  465,  465,  475,  465,  466,  466,
			  497,  466,  498,  469,  499,  477,  495,  496,  460,    0,
			  463,  460,  475,    0,  464,    0,    0,  537,  463,  465,
			  538,  477,  464,  466,  475,  681,  681,  681,  497,    0,
			  498,    0,  499,  477,    0,  502,  539,  502,  465,  466,
			  502,  502,  502,  502,  502,  537,  463,    0,  538,    0,
			  464,  503,  503,  503,  503,  503,  504,  504,  504,  504,

			  504,    0,  505,  681,  539,    0,  465,  466,  500,  500,
			  500,  500,  500,  506,  506,  506,  506,  506,    0,  500,
			  500,  500,  500,  500,  500,  505,  540,  541,  506,  503,
			  505,  507,  507,  507,  507,  507,  508,  508,  508,  508,
			  508,  509,  509,  509,  509,  509,  500,  500,  500,  500,
			  500,  500,  500,    0,  540,  541,  506,  510,  510,  510,
			  510,  510,  511,  511,  511,  511,  511,    0,    0,  507,
			  512,  512,  512,  512,  512,  513,    0,  513,    0,  543,
			  513,  513,  513,  513,  513,  514,  514,  514,  514,  514,
			  515,  515,    0,  515,    0,  510,  516,  516,    0,  516,

			  514,  517,  517,  544,  517,  518,  518,  543,  518,    0,
			  519,  519,  521,  519,    0,  515,    0,  520,  520,  515,
			  520,  516,  529,  546,  529,  516,  517,    0,  514,  521,
			  518,  544,  529,  521,  517,  519,  522,  522,    0,  522,
			    0,    0,  520,  523,  523,  518,  523,  515,    0,  524,
			  524,  546,  524,  516,    0,  520,  547,  521,    0,    0,
			  529,  522,  517,  525,  525,    0,  525,    0,  523,  526,
			  526,  534,  526,  518,  524,  548,  523,  549,  550,  551,
			    0,  522,  534,  520,  547,    0,  527,  527,  525,  527,
			  530,  530,  534,  530,  526,  524,  528,  528,  528,  528,

			  528,  552,  526,  548,  523,  549,  550,  551,  525,  522,
			  534,  527,  553,  531,  531,  530,  531,  554,  527,  532,
			  532,  535,  532,  524,  533,  533,  555,  533,    0,  552,
			  526,  556,  535,  557,  558,  560,  525,  561,  531,  562,
			  553,  564,  535,    0,  532,  554,  527,  603,  604,  533,
			  532,    0,  584,  584,  555,  584,  533,  531,    0,  556,
			  535,  557,  558,  560,    0,  561,    0,  562,  605,  564,
			  567,  567,  567,  567,  567,  603,  604,  584,  532,  568,
			  568,  568,  568,  568,  533,  531,  565,  565,  565,  565,
			  565,  569,  569,  569,  569,  569,  605,  565,  565,  565,

			  565,  565,  565,  570,    0,  570,    0,    0,  570,  570,
			  570,  570,  570,  571,    0,  571,    0,    0,  571,  571,
			  571,  571,  571,  574,  565,  565,  565,  565,  565,  565,
			  565,  572,  572,  572,  572,  572,  573,  573,  573,  573,
			  573,  575,  575,  575,  575,  575,  574,  582,  582,    0,
			  582,  574,  576,  576,  576,  576,  576,  578,  578,  578,
			  578,  578,  580,  580,  580,  580,  580,  585,  585,  572,
			  585,  607,  582,  581,    0,  581,  609,  580,  581,  581,
			  581,  581,  581,  583,  583,  587,  583,  586,  586,    0,
			  586,  582,  585,  588,  588,    0,  588,    0,  585,  607,

			  580,    0,  587,    0,  609,  580,  587,    0,  583,  613,
			  589,  589,  586,  589,  590,  590,    0,  590,  588,  582,
			    0,  583,  591,  591,  616,  591,  585,    0,  592,  592,
			  587,  592,    0,  593,  593,  589,  593,  613,    0,  590,
			  594,  594,  594,  594,  594,  598,  598,  591,  598,  583,
			    0,  619,  616,  592,  596,  596,  596,  596,  593,  595,
			  595,  595,  595,  595,  590,  621,  599,  599,  592,  599,
			  598,  623,  600,  600,    0,  600,  624,    0,  598,  619,
			  625,  626,  630,  630,  630,  630,  630,  744,  744,  744,
			  744,  599,  590,  621,    0,    0,  592,  600,    0,  623,

			    0,    0,  599,  655,  624,  600,  598,  656,  625,  626,
			  631,  631,  631,  631,  631,  632,  632,  632,  632,  632,
			  633,  633,  633,  633,  633,  634,  634,  634,  634,  634,
			  599,  655,  635,  600,  635,  656,    0,  635,  635,  635,
			  635,  635,  638,  638,  638,  638,  638,    0,  631,  639,
			  639,  639,  639,  639,    0,  657,    0,  638,  640,  640,
			  640,  640,  640,  641,  641,  658,  641,  642,  642,    0,
			  642,    0,  643,  643,    0,  643,  645,  645,    0,  645,
			  638,  646,  646,  657,  646,  638,    0,    0,  641,    0,
			    0,    0,  642,  658,  641,    0,  640,  643,    0,  650,

			  650,  645,  650,    0,  642,  643,  646,  648,  648,  648,
			  648,  648,  646,  649,  649,  649,  649,  649,  651,  651,
			  659,  651,  641,  653,  650,  652,  652,  653,  652,  662,
			  663,  650,  642,  643,  664,  654,  665,  667,  686,  654,
			  646,    0,    0,  651,  653,    0,    0,    0,  659,    0,
			  652,  651,    0,    0,    0,  653,  654,  662,  663,  650,
			    0,    0,  664,    0,  665,  667,  686,  654,  670,  670,
			  670,  670,  670,  672,  672,  672,  672,  672,    0,  651,
			  673,  673,  673,  673,  673,  674,  674,  674,  674,  674,
			  675,  675,  675,  675,  675,  676,  676,    0,  676,  677, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  677,    0,  677,    0,  678,  678,  670,  678,  679,  679,
			    0,  679,  680,  680,  680,  680,  680,    0,  673,    0,
			  676,  687,  682,  682,  677,  682,  688,  691,  675,  678,
			  684,  676,    0,  679,  684,  683,  683,  692,  683,  694,
			  685,  679,  709,  710,  685,  677,    0,  682,    0,  687,
			    0,  684,    0,    0,  688,  691,    0,  711,    0,  676,
			  683,  685,  684,  699,  699,  692,  699,  694,    0,  679,
			  709,  710,  685,  677,  697,  697,  697,  697,  697,  700,
			  700,  683,  700,  701,  701,  711,  701,    0,  699,  702,
			  702,  702,  702,  702,  712,  713,  699,  703,  703,  703,

			  703,  703,  706,  706,  700,  706,  714,    0,  701,  683,
			    0,  723,  697,  704,  704,  704,  704,  704,  716,  716,
			    0,  716,  712,  713,  699,  728,  734,  706,  701,  700,
			  717,  717,    0,  717,  714,  718,  718,  735,  718,  723,
			    0,  722,    0,  716,  719,  719,  719,  719,  719,  722,
			    0,  741,  706,  728,  734,  717,  701,  700,    0,    0,
			  718,  720,  722,  720,  716,  735,  720,  720,  720,  720,
			  720,  721,  721,    0,  721,  730,  730,  722,  730,  741,
			  706,  729,  729,  729,  729,  729,  731,  731,  731,  731,
			  731,    0,  716,  733,  732,  732,  721,  732,  748,  720,

			  730,  733,  736,    0,  736,  737,  737,  755,  737,  755,
			    0,    0,  736,  721,  733,    0,    0,  755,    0,  732,
			  738,  738,  738,  738,  738,  730,  748,  732,    0,  733,
			  737,  739,  739,    0,  739,  743,  743,  743,  743,  743,
			  736,  721,    0,  746,  746,  755,  746,  737,  747,  759,
			  759,  759,  759,  730,    0,  732,  739,    0,    0,  747,
			  749,  749,  749,  749,  749,  766,  766,  766,  746,  747,
			  750,  750,  750,  750,  750,  737,  746,  751,  751,  752,
			  751,  754,  754,  754,  754,  754,    0,  747,    0,    0,
			  752,  757,  757,  757,  757,  757,  761,    0,    0,    0,

			  752,    0,  751,  766,  746,  758,  758,  758,  758,  758,
			    0,    0,  764,  761,    0,    0,    0,  761,  752,  762,
			  762,  762,  762,  762,  763,  763,  763,  763,  763,  764,
			    0,    0,    0,  764,  765,  765,  765,  765,  765,    0,
			    0,  761,  768,  768,  768,  768,  768,  769,  769,  769,
			  769,  769,  770,  770,  770,  770,  770,  764,  772,  772,
			  772,  772,  772,  773,    0,  773,    0,    0,  773,  773,
			  773,  773,  773,  774,  774,  774,  774,  774,  775,  775,
			  775,  775,  775,  803,  803,    0,    0,    0,    0,  803,
			  803,  803,  803,  803,  803,    0,    0,    0,    0,    0,

			    0,  773,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  779,  779,  779,  779,  779,  779,  779,  779,

			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,

			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  782,  782,    0,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,    0,  782,  782,  782,
			  782,  782,  783,  783,    0,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,

			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  784,  784,  784,
			    0,    0,    0,    0,    0,    0,  784,  784,    0,    0,
			  784,    0,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,    0,    0,  784,  784,  784,
			  785,  785,    0,  785,  785,    0,  785,  785,    0,    0,
			    0,    0,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,    0,    0,  785,  785,  785,

			  786,  786,    0,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  787,  787,    0,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  788,  788,    0,  788,  788,  788,  788,  788,  788,  788,

			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,    0,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,

			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  791,  791,  791,    0,    0,
			    0,  791,  791,    0,  791,  791,    0,    0,    0,    0,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,    0,  791,  791,  791,  791,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,

			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  794,  794,
			    0,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,

			  794,  794,  794,  795,  795,    0,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  797,  797,  797,  797,  797,  797,  797,

			  797,    0,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  798,  798,
			    0,  798,  798,    0,  798,  798,  798,    0,    0,    0,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,    0,    0,  798,  798,  798,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,

			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  800,  800,  800,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,    0,    0,    0,    0,    0,  800,  801,  801,    0,
			  801,    0,    0,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,    0,    0,  801,  801,

			  801,  802,  802,  802,  802,  802,  802,    0,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,    0,  802,  802,  802,  802,  804,  804,  804,    0,
			    0,    0,  804,  804,    0,  804,  804,    0,    0,    0,
			    0,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  804,    0,    0,  804,  804,  804,  805,
			  805,  805,    0,  805,  805,  805,  805,  805,  805,  805,

			  805,  805,  805,  805,    0,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  806,  806,    0,    0,    0,    0,
			  806,  806,  806,  806,  806,  806,  807,  807,    0,    0,
			    0,    0,  807,  807,  807,  807,  807,  807,  808,  808,
			  808,  808,  808,  808,  808,  808,    0,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,

			  808,  808,  808,  809,  809,    0,    0,    0,    0,  809,
			  809,  809,  809,  809,  809,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776, yy_Dummy>>,
			1, 1799, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64,  995, 4715,   92,  967,  941,  954, 4715,
			   88, 4715, 4715, 4715, 4715, 4715,  941,   82,  937,   91,
			 4715, 4715,  925, 4715,  924,  904,  184,  114,  169,  253,
			  265,  271,  292,  276,  320,  324,  351,  338,  378,  384,
			  390,  115, 4715, 4715,  872,  469,  548,   70,  142,  154,
			   72,  230,   87,   77,  142,  146,  148,  148,  142,  896,
			 4715, 4715,  114,  197, 4715,  628,  128,  247, 4715,  263,
			  857, 4715,  282,  308,  398,  405, 4715,  186,  710, 4715,
			  225,  880, 4715,  871, 4715,  861,  793,    0,  412,  867,

			  846,  417, 4715,  423,  541,  706,  436, 4715, 4715, 4715,
			  460,  763, 4715,  786,  825,  769,  830,  834,  839,  853,
			  866,  879,  883,  887,  895,  906,  915,  923,  984,  957,
			  970,  961,  996, 1011, 1017, 1024, 1038,  838,  804,  794,
			 4715,  340,  832, 1094,  821,  246,  286,    0,  534,  309,
			  326,  320,  322,  322,  863,  343,  907,  362,  376,  409,
			  405,  799,  767,  424,  462,  725,  425,  541,  724,  527,
			  738,  777,  786,  870,  870,  880,  887,  902,  890,  920,
			  951,  992,  967, 1017,  974,  975,  987,  987,  995, 4715,
			  202, 4715,  774,  424,  276,  711, 4715,  772,  993, 4715,

			 1013,  715, 4715,   76,  775,  782, 1069, 4715, 1084,  137,
			 1174,  715,  299, 1256, 4715, 4715,  738, 1099, 4715, 4715,
			 4715,  661,  712,  725,  714, 1092,  712,  710,  705,  703,
			  620,  771, 4715, 1085, 1109, 1114, 1174, 4715, 1185, 1195,
			 1216, 1201, 1239, 1244, 1249, 1310, 1314, 1319, 1323, 1328,
			 1028, 1356, 1360, 1366, 1372, 1376, 1333, 1386, 1399, 1405,
			 1420, 1443, 1452, 1499, 1478, 1464, 1482, 1487, 1508, 1522,
			 1536, 1545,  553, 4715, 4715,  548, 1012,    0, 1257, 1394,
			 1023,    0, 1059, 1065, 1082, 1082, 1076, 1200, 1205, 1239,
			 1273,  508, 1276,  501, 1408, 1289, 1304, 1313, 1317, 1324,

			 1327, 1391, 1403, 1417,    0,    0, 1411, 1436, 1459, 1480,
			 1474, 1493, 1487, 1495, 1488, 1496,  493, 1506, 1507,  467,
			    0,    0, 1503, 1507, 1619,  210, 4715,  496, 1573, 1262,
			  933, 1564,    0,  459,  472, 4715, 4715, 4715, 4715, 1581,
			 4715, 4715, 4715, 4715, 4715, 1586, 1591, 1610, 1596, 1636,
			 1641, 1669, 1649, 1674, 1685, 1693, 1698, 1698, 1724, 1728,
			 1732, 1737, 1742, 1747, 1597, 1755, 1763, 1768, 1781, 1794,
			 1798, 1812, 1825, 1813, 1841, 1846, 1871, 1868, 1873, 1897,
			 1902, 1907, 1911, 1915, 1920, 1928, 1139,    0, 1512, 1544,
			 1556, 1557,    0, 1598, 1680,    0, 1712, 1731, 1753, 1761,

			 1763, 1790, 1794, 1808, 1811, 1816, 1807, 1869, 1877, 1888,
			 1882, 1889, 1890, 1891,    0,    0,    0,    0, 1891, 1907,
			 1915, 1895, 1914,  461,  449, 1971, 4715, 1144,    0, 4715,
			 1976, 1960, 1992, 1999,  397, 2020, 2004, 2026, 2036, 2041,
			 2046,  359, 2051, 2067,  466, 2049, 2077, 2090, 2095, 2100,
			 2106,  325, 2110, 2123, 2129, 2133, 2159, 2138, 2164, 2155,
			 2182, 2187, 2193, 2223, 2227, 2232, 2236, 1920, 1267, 2187,
			  286,  254, 1916, 1917, 1939, 2189, 1974, 2198,    0, 1969,
			    0, 1975, 1983, 2014,    0, 2066, 2082, 2081, 2086, 2088,
			 2107, 2119, 2109, 2124, 2137, 2183, 2173, 2197, 2207, 2209,

			 2288,    0, 2260, 2271, 2276, 2267, 2293, 2311, 2316, 2321,
			 2337, 2342, 2350, 2360, 2365, 2388, 2394, 2399, 2403, 2408,
			 2415, 2382, 2434, 2441, 2447, 2461, 2467, 2484, 2476, 2407,
			 2488, 2511, 2517, 2522, 2441, 2491, 4715, 2226, 2229, 2245,
			 2291, 2285,    0, 2344, 2361,    0, 2383, 2409, 2440, 2429,
			 2431, 2444, 2453, 2465, 2470, 2491, 2497, 2498, 2500,    0,
			 2489, 2504, 2505,    0, 2495, 2566,    0, 2550, 2559, 2571,
			 2588, 2598, 2611, 2616, 2588, 2621, 2632,  289, 2637, 4715,
			 2642, 2658, 2645, 2681, 2550, 2665, 2685, 2655, 2691, 2708,
			 2712, 2720, 2726, 2731, 2720, 2739, 2734, 4715, 2743, 2764,

			 2770,  284,  258, 2501, 2508, 2528,    0, 2638,    0, 2643,
			    0,    0,    0, 2657,    0,    0, 2672,    0,    0, 2709,
			    0, 2723,    0, 2736, 2738, 2745, 2746,  839,  205,  156,
			 2762, 2790, 2795, 2800, 2805, 2817,  146,  104, 2822, 2829,
			 2838, 2861, 2865, 2870, 4715, 2874, 2879, 4715, 2887, 2893,
			 2897, 2916, 2923, 2893, 2905, 2770, 2768, 2816, 2830, 2885,
			    0,    0, 2896, 2897, 2900, 2901,    0, 2903,  409,  187,
			 2948,   87, 2953, 2960, 2965, 2970, 2993, 2997, 3002, 3006,
			 2992, 2250, 3020, 3033, 3000, 3010, 2900, 2973, 2978,    0,
			    0, 2992, 3002,    0, 2991,    0, 4715, 3054,   86, 3061,

			 3077, 3081, 3069, 3077, 3093, 4715, 3100,  404, 4715, 3007,
			 2991, 3005, 3047, 3048, 3054,  452, 3116, 3128, 3133, 3124,
			 3146, 3169, 3111, 3063,    0,    0,    0,    0, 3081, 3161,
			 3173, 3166, 3192, 3163, 3074, 3102, 3187, 3203, 3200, 3229,
			  105, 3107,    0, 3215, 2767, 4715, 3241, 3218, 3163, 3240,
			 3250, 3275, 3249,    0, 3261, 3192,   83, 3271, 3285, 3229,
			 4715, 3266, 3299, 3304, 3282, 3314, 3250, 4715, 3322, 3327,
			 3332, 4715, 3338, 3348, 3353, 3358, 4715, 3401, 3446, 3491,
			 3536, 3581, 3626, 3671, 3715, 3755, 3799, 3844, 3889, 3934,
			 3979, 4023, 4067, 4112, 4157, 4202, 4247, 4292, 4333, 4377,

			 4421, 4456, 4500, 3372, 4544, 4588, 4623, 4635, 4657, 4692, yy_Dummy>>)
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
			    0,    0,    0,  126,  124,    1,    2,   15,  102,   18,
			  124,   16,   17,    7,    6,   13,    5,   11,    8,   93,
			   14,   12,   29,   10,   30,   20,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   22,   31,   23,    9,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   24,
			   21,   25,  107,  108,  109,  107,  110,  125,   91,  125,
			  125,  125,  125,  125,  125,  125,   66,  125,  125,   85,
			    1,    2,   28,  102,  101,  122,  122,  122,  122,    3,

			   33,   97,   32,    0,    0,   93,    0,   27,   26,   19,
			    0,   86,   82,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   40,   86,   78,
			   86,   86,   86,   86,   86,   86,   86,    0,    0,    0,
			   92,    0,    0,   88,    0,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   40,   88,   40,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   89,
			  107,  109,    0,  108,  107,  107,  104,  103,    0,   91,

			    0,    0,   90,    0,    0,    0,    0,   66,    0,   64,
			    0,   63,    0,    0,   85,   83,   83,    0,   84,  122,
			  111,  122,  122,  122,  122,  122,  122,  122,  122,  122,
			  122,    4,   34,   97,    0,    0,    0,   95,   97,   95,
			   93,    0,   86,   39,   86,   86,   86,   86,   86,   86,
			    0,   86,   86,   86,   86,   86,   42,   86,   86,   86,
			   86,   77,   86,   86,   74,   86,   86,   86,   86,   86,
			   41,   86,    0,   67,   87,    0,   88,   39,   68,   68,
			   88,   39,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,    0,   88,   88,   88,   88,   88,

			   88,   88,   88,   88,   42,   42,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   41,   41,   88,   88,  107,  105,   90,    0,    0,   65,
			   63,    0,    0,    0,    0,  118,  116,  119,  123,  123,
			  117,  115,  112,  113,  114,   97,    0,   97,    0,    0,
			   97,    0,    0,    0,   96,   93,    0,   86,   86,   38,
			   86,   86,   86,   86,    0,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   78,   78,   78,    0,    0,   74,
			   37,   44,   86,   86,   86,   86,   62,   60,   88,   88,
			   88,   88,   38,   88,   88,   38,   88,   88,   88,   88,

			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   37,   44,   37,   44,   88,   88,
			   88,   88,   88,   88,   88,  107,   65,   63,    0,  120,
			   97,   97,    0,    0,   94,   97,    0,   96,    0,   96,
			    0,    0,    0,   93,    0,   86,   86,   86,   86,   45,
			   86,    0,   86,   86,   86,   36,   86,   86,   86,   86,
			   86,    0,    0,   86,   86,   86,   86,    0,   62,    0,
			   88,   88,   88,   88,   88,   88,   88,   88,   45,   88,
			   45,   88,   88,   88,   36,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,

			  107,    0,    0,   97,    0,  100,   97,   96,    0,    0,
			   96,    0,    0,   95,    0,   86,   86,   86,   86,   47,
			   86,    0,   86,   86,   86,   86,   86,   86,    0,   73,
			   53,   86,   86,   86,    0,    0,   61,   88,   88,   88,
			   88,   88,   47,   88,   88,   47,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   53,
			   88,   88,   88,   53,   88,  107,    0,    0,   97,    0,
			    0,    0,   96,    0,  100,   96,    0,   76,    0,   98,
			  100,   98,   86,   86,   59,   86,   46,    0,   43,   58,
			   86,   35,   86,   51,    0,    0,    0,   73,   86,   86,

			   86,    0,    0,   88,   88,   88,   59,   88,   59,   88,
			   46,   43,   58,   88,   43,   58,   88,   35,   35,   88,
			   51,   88,   51,   88,   88,   88,   88,  107,    0,  100,
			    0,  100,    0,   96,    0,    0,   99,    0,  100,    0,
			   99,   86,   86,   86,   80,   54,   86,   74,    0,    0,
			   86,   86,   55,    0,    0,   88,   88,   88,   88,   88,
			   54,   54,   88,   88,   88,   88,   55,   88,  106,    0,
			  100,   99,    0,   99,    0,   99,   86,   86,   48,   86,
			    0,   72,   52,   86,    0,    0,   88,   88,   88,   48,
			   48,   88,   88,   52,   88,   52,  121,   99,   75,   86,

			   86,   86,    0,    0,    0,   72,   86,   79,   79,   88,
			   88,   88,   88,   88,   88,    0,   86,   50,   49,    0,
			   72,   86,    0,   88,   50,   50,   49,   49,   88,    0,
			   86,    0,   86,    0,   88,   88,   71,   86,    0,   56,
			    0,   88,   56,    0,    0,   71,   86,    0,   88,    0,
			    0,   57,    0,   57,    0,   70,    0,    0,    0,    0,
			   70,    0,    0,    0,    0,    0,   69,   81,    0,    0,
			    0,   69,    0,   69,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4715
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
