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
if yy_act <= 62 then
if yy_act <= 31 then
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
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := SYM_MODULO
end
end
end
end
else
if yy_act <= 47 then
if yy_act <= 39 then
if yy_act <= 35 then
if yy_act <= 33 then
if yy_act = 32 then
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := SYM_DIV
else
--|#line 112 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 112")
end
last_token := SYM_ELLIPSIS
end
else
if yy_act = 34 then
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_MATCHES
end
end
else
if yy_act <= 37 then
if yy_act = 36 then
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_MATCHES
else
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_THEN
end
else
if yy_act = 38 then
--|#line 125 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 125")
end
last_token := SYM_ELSE
else
--|#line 127 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 127")
end
last_token := SYM_AND
end
end
end
else
if yy_act <= 43 then
if yy_act <= 41 then
if yy_act = 40 then
--|#line 129 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 129")
end
last_token := SYM_OR
else
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_XOR
end
else
if yy_act = 42 then
--|#line 133 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 133")
end
last_token := SYM_NOT
else
--|#line 135 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 135")
end
last_token := SYM_IMPLIES
end
end
else
if yy_act <= 45 then
if yy_act = 44 then
--|#line 137 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 137")
end
last_token := SYM_TRUE
else
--|#line 139 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 139")
end
last_token := SYM_FALSE
end
else
if yy_act = 46 then
--|#line 141 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 141")
end
last_token := SYM_FORALL
else
--|#line 143 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 143")
end
last_token := SYM_EXISTS
end
end
end
end
else
if yy_act <= 55 then
if yy_act <= 51 then
if yy_act <= 49 then
if yy_act = 48 then
--|#line 147 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 147")
end
last_token := SYM_EXISTENCE
else
--|#line 149 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 149")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 50 then
--|#line 151 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 151")
end
last_token := SYM_CARDINALITY
else
--|#line 153 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 153")
end
last_token := SYM_ORDERED
end
end
else
if yy_act <= 53 then
if yy_act = 52 then
--|#line 155 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 155")
end
last_token := SYM_UNORDERED
else
--|#line 157 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 157")
end
last_token := SYM_UNIQUE
end
else
if yy_act = 54 then
--|#line 159 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 159")
end
last_token := SYM_INFINITY
else
--|#line 161 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 161")
end
last_token := SYM_USE_NODE
end
end
end
else
if yy_act <= 59 then
if yy_act <= 57 then
if yy_act = 56 then
--|#line 163 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 163")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 165 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 165")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
if yy_act = 58 then
--|#line 167 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 167")
end
last_token := SYM_INCLUDE
else
--|#line 169 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 169")
end
last_token := SYM_EXCLUDE
end
end
else
if yy_act <= 61 then
if yy_act = 60 then
--|#line 173 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 173")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end

 					last_token := V_QUALIFIED_TERM_CODE_REF
 					last_string_value := text_substring (2, text_count - 1)
 			
end
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
end
end
end
end
else
if yy_act <= 93 then
if yy_act <= 78 then
if yy_act <= 70 then
if yy_act <= 66 then
if yy_act <= 64 then
if yy_act = 63 then
--|#line 205 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 205")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
else
--|#line 212 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 212")
end

				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
end
else
if yy_act = 65 then
--|#line 218 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 218")
end

				do_nothing
			
else
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
			
end
end
else
if yy_act <= 68 then
if yy_act = 67 then
--|#line 244 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 244")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 251 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 251")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 69 then
--|#line 258 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 258")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 259 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 259")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 74 then
if yy_act <= 72 then
if yy_act = 71 then
--|#line 260 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 260")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 267 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 267")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 73 then
--|#line 268 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 268")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 269 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 269")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 76 then
if yy_act = 75 then
--|#line 276 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 276")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 277 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 277")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 77 then
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 293 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 293")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 86 then
if yy_act <= 82 then
if yy_act <= 80 then
if yy_act = 79 then
--|#line 300 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 300")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 307 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 307")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 81 then
--|#line 319 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 319")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 324 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 324")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
end
else
if yy_act <= 84 then
if yy_act = 83 then
--|#line 328 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 328")
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
--|#line 360 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 360")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
else
if yy_act = 85 then
--|#line 365 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 365")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 370 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 370")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
end
else
if yy_act <= 90 then
if yy_act <= 88 then
if yy_act = 87 then
--|#line 376 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 376")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 382 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 382")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 89 then
--|#line 388 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 388")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 392 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 392")
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
if yy_act <= 92 then
if yy_act = 91 then
--|#line 402 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 402")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 409 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 409")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
--|#line 414 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 414")
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
if yy_act <= 109 then
if yy_act <= 101 then
if yy_act <= 97 then
if yy_act <= 95 then
if yy_act = 94 then
	yy_end := yy_end - 1
--|#line 429 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 429")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 430 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 430")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 96 then
--|#line 431 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 431")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 435 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 435")
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
if yy_act <= 99 then
if yy_act = 98 then
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
					
else
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
else
if yy_act = 100 then
--|#line 457 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 457")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 461 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 461")
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
if yy_act <= 105 then
if yy_act <= 103 then
if yy_act = 102 then
--|#line 467 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 467")
end
in_buffer.append_character ('\')
else
--|#line 468 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 468")
end
in_buffer.append_character ('"')
end
else
if yy_act = 104 then
--|#line 469 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 469")
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
--|#line 483 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 483")
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
if yy_act <= 107 then
if yy_act = 106 then
--|#line 497 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 497")
end
in_buffer.append_string (text)
else
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
end
else
if yy_act = 108 then
--|#line 504 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 504")
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
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
end
end
end
else
if yy_act <= 117 then
if yy_act <= 113 then
if yy_act <= 111 then
if yy_act = 110 then
--|#line 523 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 523")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 524 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 524")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
if yy_act = 112 then
--|#line 525 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 525")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 526 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 526")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
end
else
if yy_act <= 115 then
if yy_act = 114 then
--|#line 527 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 527")
end
last_token := V_CHARACTER; last_character_value := '%F'
else
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
end
last_token := V_CHARACTER; last_character_value := '%''
end
else
if yy_act = 116 then
--|#line 529 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 529")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
--|#line 530 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 530")
end
last_token := V_CHARACTER; last_character_value := '"'
end
end
end
else
if yy_act <= 121 then
if yy_act <= 119 then
if yy_act = 118 then
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
else
--|#line 536 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 536")
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
if yy_act = 120 then
--|#line 546 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 546")
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
--|#line 556 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 556")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 123 then
if yy_act = 122 then
--|#line 557 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 557")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 561 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 561")
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
			create an_array.make (0, 4812)
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

			  100,  151,  101,  101,  101,  101,  101,  103,  762,  104,
			  161,  105,  105,  105,  105,  105,  110,  110,  169,  110,
			  171,  191,   79,   79,  675,  675,  675,  137,  137,  152,
			  748,  203,  137,  137,  716,  196,   76,   76,  162,  209,
			  209,  112,  209,   98,   89,  509,  170,   89,  172,  106,
			   80,   80,   81,   82,   83,   81,   82,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   84,  192,
			   81,  110,  110,  137,  110,  173,   81,   81,   81,   81,
			   81,   81,  153,  197,  177,  157,  110,  110,  174,  110,
			  181,  185,  178,  154,  187,  182,  112,  158,  697,  193,

			  115,  193,  193,  175,  441,   81,   81,   86,   81,  191,
			  155,  112,  179,  159,  433,  213,  176,  191,  183,  186,
			  180,  156,  188,  184,  113,  160,  114,   90,  115,   90,
			   90,  670,   81,   81,   81,   81,   82,   83,   81,   82,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   84,  113,   81,  114,  110,  110,  192,  110,   81,
			   81,   81,   81,   81,   81,  192,  199,  110,  110,  214,
			  110,  163,  164,  110,  110,  655,  110,  165,  110,  110,
			  112,  110,  202,  191,  204,  205,  276,  204,   81,   81,
			   86,   81,  112,  116,  110,  110,  118,  110,  112,  166,

			  167,  654,  200,  112,  117,  168,  638,  124,  119,  120,
			  205,  205,  538,  205,  276,   81,   81,   81,  200,  112,
			  277,  116,  110,  110,  118,  110,  110,  110,  213,  110,
			  201,  192,  117,  121,  122,  124,  119,  120,  207,  123,
			  110,  110,  141,  110,  538,  141,  201,  112,  277,  276,
			  522,  112,  142,  110,  110,  324,  110,  126,  130,  130,
			  277,  121,  122,  125,  207,  112,  282,  123,  282,  284,
			  127,  128,  128,  128,  128,  128,  131,  280,  112,  513,
			  110,  110,  214,  110,  132,  126,  110,  110,  281,  110,
			  284,  125,  110,  110,  282,  110,  283,  284,  127,  129,

			  208,  205,  290,  208,  131,  112,  723,  208,  205,  723,
			  208,  112,  132,  103,  209,  210,  191,  112,  287,  223,
			  133,  209,  291,  224,  211,  134,  193,  135,  193,  193,
			  290,  211,  225,  225,  225,  225,  225,  233,  233,  233,
			  233,  233,  136,  236,  236,  236,  236,  236,  133,  290,
			  291,  291,  234,  134,  207,  135,  241,  241,  241,  241,
			  241,  207,  110,  110,  192,  110,  468,  226,  295,  295,
			  136,  141,  730,  730,  141,  235,  227,  292,  468,  293,
			  234,  142,  228,  430,  515,  334,  229,  112,  230,  143,
			  143,  143,  143,  143,  144,  296,  295,  299,  297,  427,

			  143,  143,  143,  143,  143,  143,  143,  143,  143,  145,
			  143,  146,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  296,  106,  421,  297,  143,  147,  147,
			  148,  147,  147,  147,  147,  147,  147,  149,  147,  150,
			  147,  147,  147,  147,  147,  148,  147,  147,  147,  147,
			  141,  421,  278,  141,  279,  279,  279,  279,  279,  400,
			  142,  238,  238,  238,  238,  238,  400,  388,  143,  143,
			  143,  143,  143,  144,  296,  302,  239,  297,  387,  143,
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
			  218,  218,  218,  218,  106,  110,  110,  777,  110,  195,
			  203,  110,  110,  231,  110,  231,  231,  204,  205,  191,
			  204,  191,  298,  298,  205,  205,  302,  205,  110,  110,
			  112,  110,  294,  218,  219,  219,  112,  219,  219,  219,

			  219,  221,  219,  219,  220,  219,  219,  219,  219,  219,
			  219,  219,  219,  112,  303,  244,  137,  137,  219,  219,
			  219,  219,  219,  219,  250,  304,  242,  110,  110,  272,
			  110,  207,  110,  110,  304,  110,  110,  110,  207,  110,
			  275,  110,  110,  244,  110,  274,  191,  219,  219,  219,
			  219,  140,  112,  304,  242,  110,  110,  112,  110,  243,
			  273,  112,  305,  272,  232,  669,  112,  246,  110,  110,
			  231,  110,  220,  247,  219,  219,  219,  245,   94,  248,
			  112,  110,  110,   91,  110,  110,  110,  243,  110,  110,
			  110,  250,  110,  112,  192,  246,  285,  110,  110,  249,

			  110,  247,  286,  306,  307,  245,  112,  248,  110,  110,
			  112,  110,  203,  306,  112,  189,  252,  110,  110,  253,
			  110,  307,  112,  251,  285,  110,  110,  249,  110,  140,
			  286,  306,  307,  112,  109,  330,  428,  310,  330,  311,
			  285,  308,  112,  255,  252,  254,  286,  253,  257,  309,
			  112,  251,  108,  107,  256,  310,  102,  258,   99,  110,
			  110,   94,  110,  110,  110,  310,  110,  311,  288,   92,
			   91,  255,  110,  110,  289,  110,  257,  263,  263,  263,
			  263,  263,  256,  312,  112,  258,  110,  110,  112,  110,
			  264,  264,  264,  264,  264,  777,  265,  112,  110,  110,

			  311,  110,  316,  777,  128,  128,  128,  128,  128,  316,
			  777,  112,  199,  110,  110,  777,  110,  777,  259,  110,
			  110,  320,  110,  112,  265,  260,  110,  110,  313,  110,
			  316,  314,  202,  320,  261,  315,  262,  319,  112,  322,
			  110,  110,  777,  110,  112,  266,  259,  322,  200,  320,
			  267,  112,  269,  260,  268,  389,  314,  777,  364,  314,
			  315,  321,  261,  315,  262,  112,  389,  322,  200,  364,
			  270,  208,  205,  266,  208,  323,  201,  777,  267,  364,
			  269,  777,  268,  389,  317,  209,  208,  205,  318,  208,
			  271,  777,  777,  391,  390,  211,  201,  364,  270,  391,

			  209,  331,  331,  337,  331,  345,  345,  345,  345,  345,
			  211,  338,  339,  339,  339,  339,  339,  393,  271,  777,
			  234,  391,  394,  395,  346,  207,  346,  392,  217,  347,
			  347,  347,  347,  347,  348,  348,  348,  348,  348,  777,
			  207,  469,  469,  235,  469,  393,  211,  211,  234,  211,
			  394,  395,  777,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  327,  328,  329,  327,  328,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  209,  777,  777,  327,  349,  349,  349,  349,  349,  327,

			  330,  327,  327,  327,  327,  350,  350,  350,  350,  350,
			  353,  777,  353,  777,  777,  354,  354,  354,  354,  354,
			  351,  356,  356,  356,  356,  356,  777,  777,  327,  327,
			  207,  327,  103,  777,  104,  393,  355,  355,  355,  355,
			  355,  110,  110,  352,  110,  394,  110,  110,  351,  110,
			  777,  110,  110,  777,  110,  327,  327,  327,  216,  216,
			  777,  216,  777,  396,  205,  205,  112,  205,  777,  469,
			  469,  112,  469,  397,  106,  278,  112,  278,  278,  278,
			  278,  278,  357,  358,  777,  217,  395,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  357,  358,  110,  110,  398,  110,  110,  110,  207,  110,
			  399,  110,  110,  399,  110,  110,  110,  777,  110,  402,
			  110,  110,  777,  110,  777,  110,  110,  112,  110,  218,
			  777,  112,  777,  777,  403,  359,  112,  777,  399,  777,
			  112,  401,  404,  777,  360,  112,  405,  402,  110,  110,
			  112,  110,  110,  110,  402,  110,  361,  403,  110,  110,
			  362,  110,  403,  359,  110,  110,  777,  110,  110,  110,
			  404,  110,  360,  112,  405,  777,  363,  112,  110,  110,
			  777,  110,  406,  112,  361,  407,  365,  777,  362,  112,

			  366,  110,  110,  112,  110,  367,  777,  110,  110,  369,
			  110,  368,  278,  112,  279,  279,  279,  279,  279,  777,
			  404,  409,  110,  110,  365,  110,  112,  409,  366,  777,
			  411,  777,  112,  367,  371,  370,  777,  369,  412,  368,
			  372,  372,  372,  372,  372,  777,  411,  112,  408,  409,
			  777,  110,  110,  129,  110,  410,  110,  110,  411,  110,
			  412,  777,  371,  370,  110,  110,  412,  110,  129,  373,
			  373,  373,  373,  373,  413,  415,  112,  110,  110,  416,
			  110,  112,  374,  374,  374,  374,  374,  777,  414,  112,
			  378,  777,  378,  415,  777,  777,  381,  129,  110,  110,

			  379,  110,  112,  415,  777,  777,  777,  416,  777,  777,
			  129,  110,  110,  777,  110,  110,  110,  777,  110,  110,
			  110,  417,  110,  112,  381,  777,  416,  777,  380,  263,
			  263,  263,  263,  263,  110,  110,  112,  110,  275,  777,
			  112,  383,  110,  110,  112,  110,  419,  375,  382,  364,
			  376,  420,  110,  110,  418,  110,  377,  419,  420,  112,
			  364,  424,  777,  384,  424,  471,  777,  112,  777,  383,
			  364,  471,  777,  777,  419,  375,  382,  112,  376,  420,
			  328,  329,  777,  328,  377,  422,  423,  777,  364,  424,
			  385,  384,  425,  471,  209,  331,  331,  337,  331,  472,

			  110,  110,  386,  110,  330,  338,  339,  339,  339,  339,
			  339,  431,  431,  431,  431,  431,  347,  347,  347,  347,
			  347,  777,  777,  473,  473,  112,  234,  777,  777,  777,
			  386,  191,  452,  777,  207,  432,  432,  432,  432,  432,
			  777,  777,  777,  452,  426,  426,  426,  426,  426,  235,
			  777,  473,  474,  452,  234,  426,  426,  426,  426,  426,
			  426,  434,  434,  434,  434,  434,  435,  435,  435,  435,
			  435,  452,  777,  433,  436,  436,  436,  436,  436,  192,
			  777,  777,  426,  426,  426,  426,  426,  426,  426,  351,
			  437,  777,  437,  777,  777,  438,  438,  438,  438,  438,

			  439,  439,  439,  439,  439,  354,  354,  354,  354,  354,
			  777,  777,  352,  110,  110,  777,  110,  351,  440,  440,
			  440,  440,  440,  442,  443,  777,  444,  444,  444,  444,
			  444,  445,  445,  445,  445,  445,  777,  777,  112,  110,
			  110,  777,  110,  110,  110,  777,  110,  110,  110,  777,
			  110,  475,  110,  110,  777,  110,  441,  110,  110,  777,
			  110,  446,  110,  110,  112,  110,  110,  110,  112,  110,
			  110,  110,  112,  110,  476,  475,  447,  112,  777,  475,
			  110,  110,  112,  110,  476,  450,  451,  112,  479,  446,
			  448,  112,  777,  449,  777,  112,  480,  110,  110,  453,

			  110,  479,  476,  477,  447,  112,  455,  110,  110,  777,
			  110,  777,  478,  450,  451,  777,  479,  454,  448,  777,
			  456,  449,  112,  777,  480,  110,  110,  453,  110,  481,
			  777,  482,  112,  457,  455,  372,  372,  372,  372,  372,
			  374,  374,  374,  374,  374,  454,  110,  110,  456,  110,
			  112,  458,  463,  463,  463,  463,  111,  110,  110,  482,
			  110,  457,  373,  373,  373,  373,  373,  111,  483,  459,
			  484,  112,  111,  460,  460,  460,  460,  460,  777,  458,
			  485,  482,  112,  111,  111,  110,  110,  111,  110,  483,
			  777,  777,  111,  777,  111,  111,  483,  459,  484,  777,

			  111,  777,  461,  461,  461,  461,  461,  777,  485,  486,
			  112,  111,  484,  489,  489,  111,  111,  487,  110,  110,
			  111,  110,  111,  462,  462,  462,  462,  462,  110,  110,
			  491,  110,  110,  110,  492,  110,  110,  110,  491,  110,
			  488,  489,  490,  112,  111,  110,  110,  777,  110,  492,
			  495,  496,  497,  112,  495,  496,  777,  112,  491,  777,
			  468,  112,  492,  498,  465,  466,  493,  777,  777,  777,
			  112,  777,  539,  539,  541,  464,  467,  494,  495,  496,
			  497,  777,  499,  500,  431,  431,  431,  431,  431,  777,
			  777,  498,  465,  466,  504,  504,  504,  504,  504,  503,

			  539,  540,  541,  464,  467,  501,  501,  501,  501,  501,
			  505,  505,  505,  505,  505,  777,  501,  501,  501,  501,
			  501,  501,  506,  506,  506,  506,  506,  503,  650,  650,
			  650,  650,  433,  777,  777,  507,  507,  507,  507,  507,
			  777,  777,  777,  501,  501,  501,  501,  501,  501,  501,
			  351,  438,  438,  438,  438,  438,  508,  508,  508,  508,
			  508,  510,  510,  510,  510,  510,  511,  511,  511,  511,
			  511,  110,  110,  352,  110,  704,  705,  704,  351,  512,
			  512,  512,  512,  512,  507,  507,  507,  507,  507,  110,
			  110,  541,  110,  547,  509,  548,  112,  110,  110,  514,

			  110,  777,  777,  443,  441,  444,  444,  444,  444,  444,
			  549,  517,  777,  706,  112,  110,  110,  777,  110,  544,
			  777,  547,  112,  548,  550,  110,  110,  514,  110,  518,
			  110,  110,  777,  110,  110,  110,  777,  110,  549,  517,
			  112,  110,  110,  777,  110,  516,  110,  110,  519,  110,
			  112,  777,  550,  110,  110,  112,  110,  518,  777,  112,
			  520,  110,  110,  777,  110,  777,  112,  523,  521,  777,
			  777,  112,  777,  524,  110,  110,  519,  110,  112,  110,
			  110,  777,  110,  525,  110,  110,  112,  110,  520,  460,
			  460,  460,  460,  460,  526,  523,  521,  777,  777,  112,

			  777,  524,  777,  777,  112,  110,  110,  111,  110,  112,
			  777,  525,  528,  461,  461,  461,  461,  461,  527,  777,
			  777,  548,  526,  529,  529,  529,  529,  529,  533,  549,
			  112,  111,  550,  777,  111,  111,  110,  110,  531,  110,
			  528,  530,  530,  530,  530,  530,  527,  110,  110,  551,
			  110,  537,  535,  542,  554,  542,  533,  552,  554,  111,
			  553,  112,  111,  535,  556,  543,  531,  543,  557,  532,
			  556,  557,  112,  536,  560,  561,  562,  563,  560,  561,
			  777,  542,  554,  545,  777,  604,  555,  605,  534,  777,
			  777,  535,  556,  543,  777,  546,  557,  532,  558,  559,

			  777,  777,  560,  561,  562,  563,  564,  565,  569,  569,
			  569,  569,  569,  604,  777,  605,  534,  566,  566,  566,
			  566,  566,  570,  570,  570,  570,  570,  777,  566,  566,
			  566,  566,  566,  566,  568,  777,  568,  605,  777,  569,
			  569,  569,  569,  569,  571,  777,  433,  507,  507,  507,
			  507,  507,  777,  777,  777,  566,  566,  566,  566,  566,
			  566,  566,  572,  110,  110,  606,  110,  235,  751,  751,
			  751,  751,  571,  573,  573,  573,  573,  573,  574,  574,
			  574,  574,  574,  575,  575,  575,  575,  575,  112,  777,
			  572,  576,  576,  576,  576,  576,  577,  577,  577,  577,

			  577,  578,  578,  578,  578,  578,  777,  579,  777,  579,
			  777,  509,  576,  576,  576,  576,  576,  581,  581,  581,
			  581,  581,  110,  110,  777,  110,  607,  110,  110,  441,
			  110,  608,  582,  110,  110,  777,  110,  110,  110,  777,
			  110,  777,  110,  110,  588,  110,  777,  112,  777,  777,
			  607,  583,  112,  596,  607,  596,  584,  777,  112,  608,
			  582,  588,  112,  597,  608,  588,  585,  112,  110,  110,
			  777,  110,  611,  110,  110,  612,  110,  586,  609,  583,
			  587,  613,  110,  110,  584,  110,  777,  110,  110,  588,
			  110,  598,  610,  112,  585,  614,  110,  110,  112,  110,

			  611,  110,  110,  612,  110,  586,  590,  112,  587,  613,
			  612,  777,  112,  589,  595,  595,  595,  595,  595,  110,
			  110,  112,  110,  614,  110,  110,  112,  110,  591,  593,
			  613,  614,  592,  594,  590,  777,  777,  777,  615,  110,
			  110,  589,  110,  618,  112,  777,  618,  110,  110,  112,
			  110,  777,  602,  620,  603,  621,  591,  593,  616,  617,
			  592,  594,  620,  602,  112,  603,  621,  624,  599,  625,
			  600,  618,  112,  603,  619,  603,  626,  624,  656,  601,
			  777,  620,  777,  621,  569,  569,  569,  569,  569,  777,
			  622,  602,  777,  603,  623,  624,  599,  625,  600,  569,

			  569,  569,  569,  569,  626,  627,  656,  601,  628,  628,
			  628,  628,  628,  630,  630,  630,  630,  630,  777,  628,
			  628,  628,  628,  628,  628,  631,  777,  631,  777,  777,
			  632,  632,  632,  632,  632,  633,  777,  633,  777,  777,
			  634,  634,  634,  634,  634,  636,  628,  628,  628,  628,
			  628,  628,  628,  634,  634,  634,  634,  634,  635,  635,
			  635,  635,  635,  576,  576,  576,  576,  576,  352,  110,
			  110,  777,  110,  636,  637,  637,  637,  637,  637,  576,
			  576,  576,  576,  576,  639,  639,  639,  639,  639,  110,
			  110,  509,  110,  657,  112,  640,  777,  640,  657,  636,

			  641,  641,  641,  641,  641,  110,  110,  645,  110,  110,
			  110,  777,  110,  642,  112,  777,  777,  110,  110,  777,
			  110,  657,  352,  777,  645,  777,  658,  636,  645,  777,
			  112,  777,  110,  110,  112,  110,  110,  110,  777,  110,
			  644,  642,  112,  643,  110,  110,  777,  110,  110,  110,
			  777,  110,  645,  110,  110,  777,  110,  112,  659,  110,
			  110,  112,  110,  648,  648,  648,  648,  648,  644,  112,
			  777,  643,  659,  112,  110,  110,  661,  110,  112,  649,
			  649,  649,  649,  649,  112,  661,  659,  110,  110,  663,
			  110,  663,  777,  647,  646,  110,  110,  665,  110,  112,

			  660,  666,  667,  665,  661,  777,  687,  651,  110,  110,
			  777,  110,  112,  662,  777,  777,  777,  663,  777,  664,
			  112,  647,  646,  652,  777,  665,  688,  777,  653,  666,
			  667,  668,  777,  112,  687,  651,  632,  632,  632,  632,
			  632,  671,  671,  671,  671,  671,  634,  634,  634,  634,
			  634,  652,  110,  110,  688,  110,  653,  634,  634,  634,
			  634,  634,  672,  672,  672,  672,  672,  673,  777,  673,
			  688,  777,  674,  674,  674,  674,  674,  112,  777,  433,
			  575,  575,  575,  575,  575,  641,  641,  641,  641,  641,
			  676,  676,  676,  676,  676,  636,  110,  110,  689,  110,

			  110,  110,  777,  110,  777,  110,  110,  777,  110,  110,
			  110,  690,  110,  681,  681,  681,  681,  681,  352,  777,
			  777,  112,  690,  636,  777,  112,  777,  677,  441,  777,
			  112,  692,  110,  110,  112,  110,  777,  678,  679,  690,
			  680,  682,  682,  682,  682,  682,  110,  110,  685,  110,
			  691,  777,  685,  692,  686,  677,  694,  112,  686,  692,
			  695,  694,  710,  711,  683,  678,  679,  777,  680,  685,
			  777,  112,  777,  777,  777,  686,  777,  711,  777,  684,
			  685,  693,  777,  777,  694,  777,  686,  777,  695,  696,
			  710,  711,  683,  630,  630,  630,  630,  630,  674,  674, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  674,  674,  674,  110,  110,  712,  110,  684,  698,  698,
			  698,  698,  698,  699,  699,  699,  699,  699,  637,  637,
			  637,  637,  637,  110,  110,  713,  110,  713,  112,  110,
			  110,  433,  110,  110,  110,  715,  110,  724,  777,  700,
			  703,  703,  703,  703,  703,  777,  509,  708,  112,  110,
			  110,  708,  110,  713,  112,  714,  441,  709,  112,  110,
			  110,  709,  110,  715,  725,  724,  702,  700,  708,  701,
			  110,  110,  777,  110,  112,  777,  725,  777,  709,  708,
			  777,  777,  110,  110,  112,  110,  727,  777,  777,  709,
			  110,  110,  725,  110,  702,  112,  777,  701,  672,  672,

			  672,  672,  672,  717,  726,  707,  727,  112,  598,  598,
			  598,  598,  598,  729,  727,  112,  720,  720,  720,  720,
			  720,  721,  721,  721,  721,  721,  110,  110,  777,  110,
			  735,  717,  718,  707,  728,  719,  509,  110,  110,  777,
			  110,  729,  110,  110,  777,  110,  110,  110,  777,  110,
			  777,  112,  732,  732,  732,  732,  732,  736,  735,  742,
			  718,  734,  112,  719,  777,  110,  110,  112,  110,  734,
			  777,  112,  704,  777,  704,  743,  722,  721,  721,  721,
			  721,  721,  734,  731,  777,  736,  777,  742,  741,  777,
			  112,  737,  737,  737,  737,  737,  741,  734,  110,  110,

			  777,  110,  777,  743,  722,  110,  110,  733,  110,  741,
			  706,  731,  739,  739,  739,  739,  739,  744,  749,  744,
			  777,  754,  777,  112,  741,  110,  110,  745,  110,  777,
			  112,  110,  110,  777,  110,  733,  777,  777,  740,  706,
			  706,  706,  706,  706,  110,  110,  749,  110,  738,  754,
			  112,  753,  777,  757,  777,  746,  112,  750,  750,  750,
			  750,  750,  753,  759,  757,  759,  740,  747,  777,  112,
			  777,  777,  753,  760,  757,  777,  738,  752,  755,  755,
			  755,  755,  755,  756,  756,  756,  756,  756,  110,  110,
			  753,  110,  757,  777,  777,  747,  758,  758,  758,  758,

			  758,  761,  777,  777,  777,  752,  746,  746,  746,  746,
			  746,  765,  777,  112,  763,  763,  763,  763,  763,  764,
			  764,  764,  764,  766,  766,  766,  766,  766,  765,  768,
			  777,  777,  765,  767,  767,  767,  767,  767,  769,  769,
			  769,  769,  769,  770,  771,  770,  768,  777,  777,  777,
			  768,  761,  761,  761,  761,  761,  765,  773,  773,  773,
			  773,  773,  774,  774,  774,  774,  774,  775,  775,  775,
			  775,  775,  777,  777,  768,  777,  777,  770,  777,  770,
			  777,  772,  774,  774,  774,  774,  774,  776,  776,  776,
			  776,  776,  772,  772,  772,  772,  772,  429,  429,  777,

			  777,  777,  777,  429,  429,  429,  429,  429,  429,  777,
			  777,  777,  777,  777,  777,  772,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,

			   77,   77,   77,   77,   77,   77,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   93,   93,  777,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			  777,   93,   93,   93,   93,   93,   95,   95,  777,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,  111,  111,  111,  777,  777,  777,  777,  777,  777,
			  111,  111,  777,  777,  111,  777,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  777,
			  777,  111,  111,  111,  138,  138,  777,  138,  138,  777,
			  138,  138,  777,  777,  777,  777,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,

			  138,  138,  138,  138,  138,  138,  138,  138,  138,  777,
			  777,  138,  138,  138,  139,  139,  777,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  190,
			  190,  777,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,

			  190,  190,  190,  190,  192,  192,  777,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  201,  201,  201,  201,  201,  201,

			  201,  201,  201,  777,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  206,
			  206,  206,  777,  777,  777,  206,  206,  777,  206,  206,
			  777,  777,  777,  777,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  777,  206,  206,
			  206,  206,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,

			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  219,  219,  777,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,

			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  222,  222,  777,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,  237,  237,  237,
			  237,  237,  237,  237,  237,  777,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  137,  137,  777,  137,  137,  777,  137,  137,
			  137,  777,  777,  777,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  777,  777,  137,
			  137,  137,  210,  210,  210,  210,  210,  210,  210,  210,

			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  218,  218,  218,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  777,  777,  777,  777,  777,
			  218,  333,  333,  777,  333,  777,  777,  333,  333,  333,
			  333,  333,  333,  333,  333,  333,  333,  333,  333,  333,

			  333,  333,  333,  333,  333,  333,  333,  333,  333,  333,
			  777,  777,  333,  333,  333,  327,  327,  327,  327,  327,
			  327,  777,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  777,  327,  327,  327,  327,
			  470,  470,  470,  777,  777,  777,  470,  470,  777,  470,
			  470,  777,  777,  777,  777,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  777,  777,

			  470,  470,  470,  388,  388,  388,  777,  388,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  777,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  502,  502,
			  777,  777,  777,  777,  502,  502,  502,  502,  502,  502,
			  567,  567,  777,  777,  777,  777,  567,  567,  567,  567,
			  567,  567,  580,  580,  580,  580,  580,  580,  580,  580,
			  777,  580,  580,  580,  580,  580,  580,  580,  580,  580,
			  580,  580,  580,  580,  580,  580,  580,  580,  580,  580,

			  580,  580,  580,  580,  580,  580,  580,  580,  580,  580,
			  580,  580,  580,  580,  580,  580,  580,  629,  629,  777,
			  777,  777,  777,  629,  629,  629,  629,  629,  629,   13,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,

			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777, yy_Dummy>>,
			1, 1813, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4812)
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

			   27,   57,   27,   27,   27,   27,   27,   29,  757,   29,
			   60,   29,   29,   29,   29,   29,   37,   37,   62,   37,
			   63,   72,    5,    6,  638,  638,  638,   51,   51,   57,
			  741,  203,   51,   51,  699,   76,    3,    4,   60,  209,
			  209,   37,  209,   20,   11,  672,   62,   12,   63,   29,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   72,
			    9,   38,   38,   51,   38,   64,    9,    9,    9,    9,
			    9,    9,   58,   76,   65,   59,   36,   36,   64,   36,
			   66,   67,   65,   58,   68,   66,   38,   59,  670,   73,

			   38,   73,   73,   64,  637,    9,    9,    9,    9,  190,
			   58,   36,   65,   59,  630,   87,   64,  325,   66,   67,
			   65,   58,   68,   66,   36,   59,   36,   90,   38,   90,
			   90,  629,    9,    9,    9,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   36,   10,   36,   39,   39,  190,   39,   10,
			   10,   10,   10,   10,   10,  325,   77,   40,   40,   87,
			   40,   61,   61,   41,   41,  603,   41,   61,   43,   43,
			   39,   43,   79,  194,   82,   82,  145,   82,   10,   10,
			   10,   10,   40,   39,   42,   42,   40,   42,   41,   61,

			   61,  602,   77,   43,   39,   61,  578,   43,   40,   41,
			   83,   83,  472,   83,  145,   10,   10,   10,   79,   42,
			  146,   39,   44,   44,   40,   44,   45,   45,  212,   45,
			   77,  194,   39,   42,   42,   43,   40,   41,   82,   42,
			   47,   47,  141,   47,  471,  141,   79,   44,  146,  149,
			  452,   45,  141,   46,   46,  194,   46,   45,   47,   47,
			  150,   42,   42,   44,   83,   47,  151,   42,  152,  153,
			   45,   46,   46,   46,   46,   46,   47,  149,   46,  442,
			   48,   48,  212,   48,   47,   45,   49,   49,  150,   49,
			  155,   44,   50,   50,  151,   50,  152,  153,   45,   46,

			   84,   84,  157,   84,   47,   48,  708,   85,   85,  708,
			   85,   49,   47,  435,   84,   84,  669,   50,  155,   98,
			   48,   85,  158,   98,   84,   48,  193,   49,  193,  193,
			  157,   85,   98,   98,   98,   98,   98,  101,  101,  101,
			  101,  101,   50,  103,  103,  103,  103,  103,   48,  159,
			  158,  160,  101,   48,   84,   49,  106,  106,  106,  106,
			  106,   85,  110,  110,  669,  110,  425,   98,  163,  166,
			   50,   55,  716,  716,   55,  101,   98,  159,  424,  160,
			  101,   55,   98,  334,  445,  333,   98,  110,   98,   55,
			   55,   55,   55,   55,   55,  164,  163,  166,  164,  327,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,  164,  445,  319,  164,   55,   55,   55,
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
			  144,  118,  118,  115,  118,  142,  628,   96,   96,   96,
			   96,  139,  114,  171,  113,  119,  119,  116,  119,  114,
			  138,  117,  172,  137,  100,  628,  118,  117,  120,  120,
			   99,  120,   95,  117,   96,   96,   96,  116,   93,  118,
			  119,  121,  121,   91,  121,  122,  122,  114,  122,  123,
			  123,  120,  123,  120,  628,  117,  154,  124,  124,  119,

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
			  208,  387,  387,  233,  387,  284,  428,  428,  233,  428,
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
			    0,  213,    0,  287,  329,  329,  242,  329,    0,  469,
			  469,  243,  469,  288,  240,  278,  244,  278,  278,  278,
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
			  301,  302,  260,  260,  251,  260,  258,  303,  252,    0,
			  306,    0,  259,  253,  258,  257,    0,  255,  307,  254,
			  260,  260,  260,  260,  260,    0,  308,  260,  301,  302,
			    0,  261,  261,  259,  261,  303,  265,  265,  306,  265,
			  309,    0,  258,  257,  262,  262,  307,  262,  260,  261,
			  261,  261,  261,  261,  308,  310,  261,  264,  264,  311,
			  264,  265,  262,  262,  262,  262,  262,    0,  309,  262,
			  264,    0,  264,  312,    0,    0,  265,  261,  267,  267,

			  264,  267,  264,  310,    0,    0,    0,  311,    0,    0,
			  262,  263,  263,    0,  263,  266,  266,    0,  266,  268,
			  268,  312,  268,  267,  265,    0,  313,    0,  264,  263,
			  263,  263,  263,  263,  269,  269,  263,  269,  294,    0,
			  266,  267,  270,  270,  268,  270,  314,  263,  266,  294,
			  263,  315,  271,  271,  313,  271,  263,  317,  318,  269,
			  294,  322,    0,  268,  323,  389,    0,  270,    0,  267,
			  294,  390,    0,    0,  314,  263,  266,  271,  263,  315,
			  328,  328,    0,  328,  263,  317,  318,    0,  294,  322,
			  269,  268,  323,  389,  328,  331,  331,  339,  331,  390,

			  359,  359,  271,  359,  328,  339,  339,  339,  339,  339,
			  339,  345,  345,  345,  345,  345,  346,  346,  346,  346,
			  346,    0,  331,  391,  392,  359,  345,    0,    0,    0,
			  271,  324,  364,    0,  328,  347,  347,  347,  347,  347,
			    0,    0,    0,  364,  324,  324,  324,  324,  324,  345,
			    0,  391,  392,  364,  345,  324,  324,  324,  324,  324,
			  324,  348,  348,  348,  348,  348,  349,  349,  349,  349,
			  349,  364,    0,  347,  350,  350,  350,  350,  350,  324,
			    0,    0,  324,  324,  324,  324,  324,  324,  324,  350,
			  351,    0,  351,    0,    0,  351,  351,  351,  351,  351,

			  352,  352,  352,  352,  352,  353,  353,  353,  353,  353,
			    0,    0,  350,  357,  357,    0,  357,  350,  354,  354,
			  354,  354,  354,  355,  355,    0,  355,  355,  355,  355,
			  355,  356,  356,  356,  356,  356,    0,    0,  357,  358,
			  358,    0,  358,  360,  360,    0,  360,  361,  361,    0,
			  361,  394,  362,  362,    0,  362,  354,  363,  363,    0,
			  363,  357,  365,  365,  358,  365,  367,  367,  360,  367,
			  366,  366,  361,  366,  395,  397,  358,  362,    0,  394,
			  368,  368,  363,  368,  398,  362,  363,  365,  399,  357,
			  360,  367,    0,  361,    0,  366,  400,  369,  369,  365,

			  369,  401,  395,  397,  358,  368,  367,  370,  370,    0,
			  370,    0,  398,  362,  363,    0,  399,  366,  360,    0,
			  368,  361,  369,    0,  400,  371,  371,  365,  371,  401,
			    0,  402,  370,  369,  367,  372,  372,  372,  372,  372,
			  374,  374,  374,  374,  374,  366,  377,  377,  368,  377,
			  371,  370,  379,  379,  379,  379,  372,  380,  380,  402,
			  380,  369,  373,  373,  373,  373,  373,  372,  403,  371,
			  404,  377,  374,  375,  375,  375,  375,  375,    0,  370,
			  405,  406,  380,  373,  372,  381,  381,  375,  381,  407,
			    0,    0,  373,    0,  373,  372,  403,  371,  404,    0,

			  374,    0,  376,  376,  376,  376,  376,    0,  405,  406,
			  381,  373,  408,  409,  410,  375,  376,  407,  382,  382,
			  373,  382,  373,  378,  378,  378,  378,  378,  383,  383,
			  411,  383,  384,  384,  412,  384,  385,  385,  413,  385,
			  408,  409,  410,  382,  376,  386,  386,    0,  386,  414,
			  419,  420,  421,  383,  422,  423,    0,  384,  411,    0,
			  386,  385,  412,  421,  384,  385,  413,    0,    0,    0,
			  386,    0,  473,  474,  475,  383,  385,  414,  419,  420,
			  421,    0,  422,  423,  431,  431,  431,  431,  431,    0,
			    0,  421,  384,  385,  432,  432,  432,  432,  432,  431,

			  473,  474,  475,  383,  385,  426,  426,  426,  426,  426,
			  433,  433,  433,  433,  433,    0,  426,  426,  426,  426,
			  426,  426,  434,  434,  434,  434,  434,  431,  597,  597,
			  597,  597,  432,    0,    0,  436,  436,  436,  436,  436,
			    0,    0,    0,  426,  426,  426,  426,  426,  426,  426,
			  436,  437,  437,  437,  437,  437,  438,  438,  438,  438,
			  438,  439,  439,  439,  439,  439,  440,  440,  440,  440,
			  440,  447,  447,  436,  447,  682,  682,  682,  436,  441,
			  441,  441,  441,  441,  443,  443,  443,  443,  443,  446,
			  446,  477,  446,  480,  438,  482,  447,  448,  448,  443,

			  448,    0,    0,  444,  440,  444,  444,  444,  444,  444,
			  483,  447,    0,  682,  446,  449,  449,    0,  449,  477,
			    0,  480,  448,  482,  484,  450,  450,  443,  450,  448,
			  451,  451,    0,  451,  453,  453,    0,  453,  483,  447,
			  449,  454,  454,    0,  454,  446,  455,  455,  449,  455,
			  450,    0,  484,  456,  456,  451,  456,  448,    0,  453,
			  449,  457,  457,    0,  457,    0,  454,  453,  451,    0,
			    0,  455,    0,  454,  458,  458,  449,  458,  456,  459,
			  459,    0,  459,  455,  466,  466,  457,  466,  449,  460,
			  460,  460,  460,  460,  457,  453,  451,  470,  470,  458,

			  470,  454,    0,    0,  459,  464,  464,  460,  464,  466,
			    0,  455,  459,  461,  461,  461,  461,  461,  458,    0,
			    0,  486,  457,  462,  462,  462,  462,  462,  466,  487,
			  464,  461,  488,    0,  461,  460,  465,  465,  464,  465,
			  459,  463,  463,  463,  463,  463,  458,  467,  467,  486,
			  467,  470,  468,  476,  489,  478,  466,  487,  490,  461,
			  488,  465,  461,  468,  491,  476,  464,  478,  492,  465,
			  493,  494,  467,  468,  495,  496,  497,  498,  499,  500,
			    0,  476,  489,  478,    0,  538,  490,  539,  467,    0,
			    0,  468,  491,  476,    0,  478,  492,  465,  493,  494,

			    0,    0,  495,  496,  497,  498,  499,  500,  504,  504,
			  504,  504,  504,  538,    0,  539,  467,  501,  501,  501,
			  501,  501,  505,  505,  505,  505,  505,    0,  501,  501,
			  501,  501,  501,  501,  503,    0,  503,  540,    0,  503,
			  503,  503,  503,  503,  506,    0,  504,  507,  507,  507,
			  507,  507,    0,    0,    0,  501,  501,  501,  501,  501,
			  501,  501,  507,  520,  520,  540,  520,  506,  745,  745,
			  745,  745,  506,  508,  508,  508,  508,  508,  509,  509,
			  509,  509,  509,  510,  510,  510,  510,  510,  520,    0,
			  507,  511,  511,  511,  511,  511,  512,  512,  512,  512,

			  512,  513,  513,  513,  513,  513,    0,  514,    0,  514,
			    0,  508,  514,  514,  514,  514,  514,  515,  515,  515,
			  515,  515,  516,  516,    0,  516,  541,  517,  517,  511,
			  517,  542,  515,  518,  518,    0,  518,  519,  519,    0,
			  519,    0,  521,  521,  522,  521,    0,  516,    0,    0,
			  544,  516,  517,  530,  541,  530,  517,    0,  518,  542,
			  515,  522,  519,  530,  545,  522,  518,  521,  523,  523,
			    0,  523,  547,  524,  524,  548,  524,  519,  544,  516,
			  521,  549,  525,  525,  517,  525,    0,  526,  526,  522,
			  526,  530,  545,  523,  518,  550,  527,  527,  524,  527,

			  547,  528,  528,  548,  528,  519,  524,  525,  521,  549,
			  551,    0,  526,  523,  529,  529,  529,  529,  529,  531,
			  531,  527,  531,  550,  532,  532,  528,  532,  525,  527,
			  552,  553,  526,  528,  524,    0,    0,    0,  551,  533,
			  533,  523,  533,  554,  531,    0,  555,  534,  534,  532,
			  534,    0,  535,  556,  536,  557,  525,  527,  552,  553,
			  526,  528,  558,  535,  533,  536,  559,  561,  532,  562,
			  533,  554,  534,  535,  555,  536,  563,  565,  604,  534,
			    0,  556,    0,  557,  568,  568,  568,  568,  568,    0,
			  558,  535,    0,  536,  559,  561,  532,  562,  533,  569,

			  569,  569,  569,  569,  563,  565,  604,  534,  566,  566,
			  566,  566,  566,  570,  570,  570,  570,  570,    0,  566,
			  566,  566,  566,  566,  566,  571,    0,  571,    0,    0,
			  571,  571,  571,  571,  571,  572,    0,  572,    0,    0,
			  572,  572,  572,  572,  572,  575,  566,  566,  566,  566,
			  566,  566,  566,  573,  573,  573,  573,  573,  574,  574,
			  574,  574,  574,  576,  576,  576,  576,  576,  575,  583,
			  583,    0,  583,  575,  577,  577,  577,  577,  577,  579,
			  579,  579,  579,  579,  581,  581,  581,  581,  581,  585,
			  585,  573,  585,  605,  583,  582,    0,  582,  606,  581,

			  582,  582,  582,  582,  582,  584,  584,  588,  584,  586,
			  586,    0,  586,  583,  585,    0,    0,  587,  587,    0,
			  587,  605,  581,    0,  588,    0,  606,  581,  588,    0,
			  584,    0,  589,  589,  586,  589,  590,  590,    0,  590,
			  586,  583,  587,  584,  591,  591,    0,  591,  592,  592,
			    0,  592,  588,  593,  593,    0,  593,  589,  608,  594,
			  594,  590,  594,  595,  595,  595,  595,  595,  586,  591,
			    0,  584,  610,  592,  599,  599,  614,  599,  593,  596,
			  596,  596,  596,  596,  594,  617,  608,  600,  600,  620,
			  600,  622,    0,  593,  591,  601,  601,  624,  601,  599,

			  610,  625,  626,  627,  614,    0,  656,  599,  646,  646,
			    0,  646,  600,  617,    0,    0,    0,  620,    0,  622,
			  601,  593,  591,  600,    0,  624,  657,    0,  601,  625,
			  626,  627,    0,  646,  656,  599,  631,  631,  631,  631,
			  631,  632,  632,  632,  632,  632,  633,  633,  633,  633,
			  633,  600,  653,  653,  657,  653,  601,  634,  634,  634,
			  634,  634,  635,  635,  635,  635,  635,  636,    0,  636,
			  658,    0,  636,  636,  636,  636,  636,  653,    0,  632,
			  639,  639,  639,  639,  639,  640,  640,  640,  640,  640,
			  641,  641,  641,  641,  641,  639,  642,  642,  658,  642,

			  643,  643,    0,  643,    0,  644,  644,    0,  644,  647,
			  647,  659,  647,  649,  649,  649,  649,  649,  639,    0,
			    0,  642,  660,  639,    0,  643,    0,  642,  641,    0,
			  644,  663,  651,  651,  647,  651,    0,  643,  644,  659,
			  647,  650,  650,  650,  650,  650,  652,  652,  654,  652,
			  660,    0,  654,  664,  655,  642,  665,  651,  655,  663,
			  666,  668,  687,  688,  651,  643,  644,    0,  647,  654,
			    0,  652,    0,    0,    0,  655,    0,  689,    0,  652,
			  654,  664,    0,    0,  665,    0,  655,    0,  666,  668,
			  687,  688,  651,  671,  671,  671,  671,  671,  673,  673, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  673,  673,  673,  677,  677,  689,  677,  652,  674,  674,
			  674,  674,  674,  675,  675,  675,  675,  675,  676,  676,
			  676,  676,  676,  678,  678,  692,  678,  693,  677,  679,
			  679,  671,  679,  680,  680,  695,  680,  710,    0,  677,
			  681,  681,  681,  681,  681,    0,  674,  685,  678,  683,
			  683,  685,  683,  692,  679,  693,  676,  686,  680,  684,
			  684,  686,  684,  695,  711,  710,  680,  677,  685,  678,
			  700,  700,    0,  700,  683,    0,  712,    0,  686,  685,
			    0,    0,  701,  701,  684,  701,  713,    0,    0,  686,
			  702,  702,  711,  702,  680,  700,    0,  678,  698,  698,

			  698,  698,  698,  700,  712,  684,  714,  701,  703,  703,
			  703,  703,  703,  715,  713,  702,  704,  704,  704,  704,
			  704,  705,  705,  705,  705,  705,  707,  707,    0,  707,
			  724,  700,  701,  684,  714,  702,  698,  717,  717,    0,
			  717,  715,  718,  718,    0,  718,  719,  719,    0,  719,
			    0,  707,  720,  720,  720,  720,  720,  729,  724,  735,
			  701,  723,  717,  702,    0,  722,  722,  718,  722,  723,
			    0,  719,  721,    0,  721,  736,  707,  721,  721,  721,
			  721,  721,  723,  717,    0,  729,    0,  735,  734,    0,
			  722,  730,  730,  730,  730,  730,  734,  723,  731,  731,

			    0,  731,    0,  736,  707,  733,  733,  722,  733,  734,
			  721,  717,  732,  732,  732,  732,  732,  737,  742,  737,
			    0,  749,    0,  731,  734,  738,  738,  737,  738,    0,
			  733,  740,  740,    0,  740,  722,    0,    0,  733,  739,
			  739,  739,  739,  739,  747,  747,  742,  747,  731,  749,
			  738,  748,    0,  753,    0,  737,  740,  744,  744,  744,
			  744,  744,  748,  756,  753,  756,  733,  738,    0,  747,
			    0,    0,  748,  756,  753,    0,  731,  747,  750,  750,
			  750,  750,  750,  751,  751,  751,  751,  751,  752,  752,
			  748,  752,  753,    0,    0,  738,  755,  755,  755,  755,

			  755,  756,    0,    0,    0,  747,  758,  758,  758,  758,
			  758,  762,    0,  752,  759,  759,  759,  759,  759,  760,
			  760,  760,  760,  763,  763,  763,  763,  763,  762,  765,
			    0,    0,  762,  764,  764,  764,  764,  764,  766,  766,
			  766,  766,  766,  767,  767,  767,  765,    0,    0,    0,
			  765,  769,  769,  769,  769,  769,  762,  770,  770,  770,
			  770,  770,  771,  771,  771,  771,  771,  773,  773,  773,
			  773,  773,    0,    0,  765,    0,    0,  774,    0,  774,
			    0,  767,  774,  774,  774,  774,  774,  775,  775,  775,
			  775,  775,  776,  776,  776,  776,  776,  804,  804,    0,

			    0,    0,    0,  804,  804,  804,  804,  804,  804,    0,
			    0,    0,    0,    0,    0,  774,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,

			  779,  779,  779,  779,  779,  779,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  782,  782,  782,  782,

			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  783,  783,    0,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			    0,  783,  783,  783,  783,  783,  784,  784,    0,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,

			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  785,  785,  785,    0,    0,    0,    0,    0,    0,
			  785,  785,    0,    0,  785,    0,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,    0,
			    0,  785,  785,  785,  786,  786,    0,  786,  786,    0,
			  786,  786,    0,    0,    0,    0,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,

			  786,  786,  786,  786,  786,  786,  786,  786,  786,    0,
			    0,  786,  786,  786,  787,  787,    0,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  788,
			  788,    0,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,

			  788,  788,  788,  788,  789,  789,    0,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  791,  791,  791,  791,  791,  791,

			  791,  791,  791,    0,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  792,
			  792,  792,    0,    0,    0,  792,  792,    0,  792,  792,
			    0,    0,    0,    0,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,    0,  792,  792,
			  792,  792,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,

			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  795,  795,    0,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,

			  795,  795,  795,  795,  795,  795,  795,  795,  795,  795,
			  795,  795,  795,  795,  795,  795,  795,  796,  796,    0,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  797,  797,  797,  797,  797,  797,  797,  798,  798,  798,
			  798,  798,  798,  798,  798,    0,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  798,  798,  799,  799,    0,  799,  799,    0,  799,  799,
			  799,    0,    0,    0,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,  799,  799,  799,
			  799,  799,  799,  799,  799,  799,  799,    0,    0,  799,
			  799,  799,  800,  800,  800,  800,  800,  800,  800,  800,

			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  800,  800,  800,  800,  800,  800,  800,  801,  801,  801,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  801,  801,    0,    0,    0,    0,    0,
			  801,  802,  802,    0,  802,    0,    0,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,

			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			    0,    0,  802,  802,  802,  803,  803,  803,  803,  803,
			  803,    0,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  803,
			  803,  803,  803,  803,  803,    0,  803,  803,  803,  803,
			  805,  805,  805,    0,    0,    0,  805,  805,    0,  805,
			  805,    0,    0,    0,    0,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  805,  805,  805,  805,  805,    0,    0,

			  805,  805,  805,  806,  806,  806,    0,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,    0,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  806,  806,
			  806,  806,  806,  806,  806,  806,  806,  806,  807,  807,
			    0,    0,    0,    0,  807,  807,  807,  807,  807,  807,
			  808,  808,    0,    0,    0,    0,  808,  808,  808,  808,
			  808,  808,  809,  809,  809,  809,  809,  809,  809,  809,
			    0,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,

			  809,  809,  809,  809,  809,  809,  809,  809,  809,  809,
			  809,  809,  809,  809,  809,  809,  809,  810,  810,    0,
			    0,    0,    0,  810,  810,  810,  810,  810,  810,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,

			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777, yy_Dummy>>,
			1, 1813, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   81,   82,   67,   68,    0,    0,  151,
			  234,   61,   64,  995, 4729,   92,  967,  941,  954, 4729,
			   88, 4729, 4729, 4729, 4729, 4729,  941,   82,  937,   91,
			 4729, 4729,  925, 4729,  924,  904,  184,  114,  169,  253,
			  265,  271,  292,  276,  320,  324,  351,  338,  378,  384,
			  390,  115, 4729, 4729,  872,  469,  548,   70,  142,  154,
			   72,  230,   87,   77,  142,  146,  148,  148,  142,  896,
			 4729, 4729,  114,  197, 4729,  628,  128,  247, 4729,  263,
			  857, 4729,  282,  308,  398,  405, 4729,  186,  710, 4729,
			  225,  880, 4729,  871, 4729,  861,  793,    0,  412,  867,

			  846,  417, 4729,  423,  541,  706,  436, 4729, 4729, 4729,
			  460,  763, 4729,  786,  825,  769,  830,  834,  839,  853,
			  866,  879,  883,  887,  895,  906,  915,  923,  984,  957,
			  970,  961,  996, 1011, 1017, 1024, 1038,  838,  804,  794,
			 4729,  340,  832, 1094,  821,  246,  286,    0,  534,  309,
			  326,  320,  322,  322,  863,  343,  907,  362,  376,  409,
			  405,  799,  767,  424,  462,  725,  425,  541,  724,  527,
			  738,  777,  786,  870,  870,  880,  887,  902,  890,  920,
			  951,  992,  967, 1017,  974,  975,  987,  987,  995, 4729,
			  202, 4729,  774,  424,  276,  711, 4729,  772,  993, 4729,

			 1013,  715, 4729,   76,  775,  782, 1069, 4729, 1084,  137,
			 1174,  715,  299, 1256, 4729, 4729,  738, 1099, 4729, 4729,
			 4729,  661,  712,  725,  714, 1092,  712,  710,  705,  703,
			  620,  771, 4729, 1085, 1109, 1114, 1174, 4729, 1185, 1195,
			 1216, 1201, 1239, 1244, 1249, 1310, 1314, 1319, 1323, 1328,
			 1028, 1356, 1360, 1366, 1372, 1376, 1333, 1386, 1399, 1405,
			 1420, 1449, 1462, 1509, 1475, 1454, 1513, 1496, 1517, 1532,
			 1540, 1550,  553, 4729, 4729,  548, 1012,    0, 1257, 1394,
			 1023,    0, 1059, 1065, 1082, 1082, 1076, 1200, 1205, 1239,
			 1273,  508, 1276,  501, 1519, 1289, 1304, 1313, 1317, 1324,

			 1327, 1381, 1388, 1394,    0,    0, 1381, 1403, 1397, 1425,
			 1433, 1444, 1451, 1491, 1501, 1505,  493, 1512, 1512,  467,
			    0,    0, 1509, 1512, 1624,  210, 4729,  496, 1578, 1262,
			  933, 1593,    0,  459,  472, 4729, 4729, 4729, 4729, 1586,
			 4729, 4729, 4729, 4729, 4729, 1591, 1596, 1615, 1641, 1646,
			 1654, 1675, 1680, 1685, 1698, 1706, 1711, 1711, 1737, 1598,
			 1741, 1745, 1750, 1755, 1602, 1760, 1768, 1764, 1778, 1795,
			 1805, 1823, 1815, 1842, 1820, 1853, 1882, 1844, 1903, 1832,
			 1855, 1883, 1916, 1926, 1930, 1934, 1943, 1139,    0, 1515,
			 1521, 1584, 1585,    0, 1702, 1726,    0, 1726, 1736, 1753,

			 1765, 1766, 1792, 1819, 1828, 1838, 1842, 1840, 1870, 1875,
			 1876, 1884, 1888, 1892, 1903,    0,    0,    0,    0, 1901,
			 1917, 1921, 1905, 1921,  461,  449, 1985, 4729, 1144,    0,
			 4729, 1964, 1974, 1990, 2002,  397, 2015, 2031, 2036, 2041,
			 2046, 2059,  359, 2064, 2085,  466, 2087, 2069, 2095, 2113,
			 2123, 2128,  325, 2132, 2139, 2144, 2151, 2159, 2172, 2177,
			 2169, 2193, 2203, 2221, 2203, 2234, 2182, 2245, 2222, 1267,
			 2195,  286,  254, 1930, 1931, 1940, 2218, 2057, 2220,    0,
			 2053,    0, 2060, 2076, 2085,    0, 2186, 2195, 2193, 2219,
			 2223, 2218, 2233, 2224, 2236, 2239, 2240, 2230, 2234, 2243,

			 2244, 2297,    0, 2319, 2288, 2302, 2309, 2327, 2353, 2358,
			 2363, 2371, 2376, 2381, 2392, 2397, 2420, 2425, 2431, 2435,
			 2361, 2440, 2414, 2466, 2471, 2480, 2485, 2494, 2499, 2494,
			 2438, 2517, 2522, 2537, 2545, 2522, 2524, 4729, 2254, 2256,
			 2306, 2391, 2389,    0, 2415, 2422,    0, 2432, 2428, 2446,
			 2447, 2463, 2495, 2483, 2496, 2499, 2518, 2521, 2527, 2532,
			    0, 2521, 2536, 2542,    0, 2531, 2588,    0, 2564, 2579,
			 2593, 2610, 2620, 2633, 2638, 2610, 2643, 2654,  289, 2659,
			 4729, 2664, 2680, 2667, 2703, 2687, 2707, 2715, 2677, 2730,
			 2734, 2742, 2746, 2751, 2757, 2743, 2759, 2008, 4729, 2772,

			 2785, 2793,  284,  258, 2532, 2653, 2658,    0, 2725,    0,
			 2739,    0,    0,    0, 2724,    0,    0, 2733,    0,    0,
			 2747,    0, 2749,    0, 2762, 2763, 2767, 2768,  839,  205,
			  156, 2816, 2821, 2826, 2837, 2842, 2852,  146,  104, 2860,
			 2865, 2870, 2894, 2898, 2903, 4729, 2806, 2907, 4729, 2893,
			 2921, 2930, 2944, 2850, 2918, 2924, 2773, 2787, 2831, 2876,
			 2887,    0,    0, 2898, 2920, 2922, 2925,    0, 2927,  409,
			  187, 2973,   87, 2978, 2988, 2993, 2998, 3001, 3021, 3027,
			 3031, 3020, 2060, 3047, 3057, 3017, 3027, 2924, 2915, 2929,
			    0,    0, 2990, 2992,    0, 2987,    0, 4729, 3078,   86,

			 3068, 3080, 3088, 3088, 3096, 3101, 4729, 3124,  404, 4729,
			 3002, 3012, 3024, 3039, 3059, 3061,  452, 3135, 3140, 3144,
			 3132, 3157, 3163, 3131, 3082,    0,    0,    0,    0, 3113,
			 3171, 3196, 3192, 3203, 3158, 3107, 3140, 3202, 3223, 3219,
			 3229,  105, 3174,    0, 3237, 2348, 4729, 3242, 3221, 3186,
			 3258, 3263, 3286, 3223,    0, 3276, 3248,   83, 3286, 3294,
			 3299, 4729, 3281, 3303, 3313, 3299, 3318, 3328, 4729, 3331,
			 3337, 3342, 4729, 3347, 3362, 3367, 3372, 4729, 3415, 3460,
			 3505, 3550, 3595, 3640, 3685, 3729, 3769, 3813, 3858, 3903,
			 3948, 3993, 4037, 4081, 4126, 4171, 4216, 4261, 4306, 4347,

			 4391, 4435, 4470, 4514, 3386, 4558, 4602, 4637, 4649, 4671,
			 4706, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  777,    1,  778,  778,  779,  779,  780,  780,  781,
			  781,  782,  782,  777,  777,  777,  777,  777,  783,  777,
			  784,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  786,  777,  777,  787,  777,  777,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,  777,
			  777,  777,  788,  777,  777,  777,  789,  790,  777,  790,
			  791,  777,  792,  777,  792,  792,  777,  793,  794,  777,
			  777,  777,  777,  783,  777,  795,  796,  795,  795,  797,

			  777,  777,  777,  777,  798,  777,  777,  777,  777,  777,
			  777,  785,  777,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  799,  786,  787,
			  777,  777,  777,   56,  777,  143,  143,   56,   56,   56,
			   56,  143,   56,  143,  143,   56,   56,  143,  143,   56,
			   56,  143,   56,  143,  143,  143,   56,   56,   56,  143,
			   56,  143,   56,  143,  143,   56,   56,  143,  143,   56,
			   56,  143,  143,   56,   56,  143,   56,  143,   56,  777,
			  788,  777,  789,  777,  788,   75,  777,  789,  790,  777,

			  790,  791,  777,  791,  792,  777,  792,  777,  777,  777,
			  800,  777,  793,  794,  777,  777,  213,  801,  777,  777,
			  777,  777,  802,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  785,  785,  785,  785,  785,  785,  785,  785,
			  777,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  777,  777,  777,  777,  143,  143,  777,  143,
			   56,   56,  143,   56,  143,  143,  143,   56,   56,   56,
			  143,  143,   56,   56,  777,  143,  143,  143,  143,   56,

			   56,   56,  143,   56,  143,   56,  143,  143,   56,   56,
			  143,  143,   56,   56,  143,  143,  143,   56,   56,   56,
			  143,   56,  143,   56,  788,  788,  777,  803,  803,  777,
			  803,  801,  804,  802,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  785,  785,  785,
			  785,  785,  785,  785,  777,  785,  785,  785,  785,  785,
			  785,  785,  128,  128,  128,  373,  373,  785,  777,  777,
			  785,  785,  785,  785,  785,  785,  785,  805,  806,  143,
			   56,  143,   56,  143,  143,  143,   56,   56,   56,  143,

			  143,   56,  143,  143,  143,  143,   56,   56,   56,  143,
			   56,  143,  143,   56,   56,  143,  143,   56,   56,  143,
			  143,  143,   56,   56,  143,   56,  324,  777,  777,  807,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  798,  777,  777,  785,  785,  785,  785,
			  785,  785,  777,  785,  785,  785,  785,  785,  785,  785,
			  263,  263,  777,  777,  785,  785,  785,  785,  777,  777,
			  805,  143,   56,  143,   56,  143,  143,   56,   56,  143,
			  143,   56,  143,  143,  143,  143,   56,   56,   56,  143,
			   56,  143,  143,   56,   56,  143,  143,  143,  143,   56,

			   56,  426,  808,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  809,  785,  785,  785,  785,
			  785,  785,  777,  785,  785,  785,  785,  785,  785,  777,
			  777,  785,  785,  785,  785,  777,  777,  777,  143,  143,
			   56,  143,  143,  143,   56,   56,   56,  143,  143,  143,
			  143,   56,   56,   56,  143,   56,  143,  143,   56,   56,
			  143,  143,  143,  143,   56,   56,  501,  810,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  785,  785,  785,  785,  785,  777,  785,
			  785,  785,  785,  785,  785,  777,  777,  777,  777,  785,

			  785,  785,  777,  777,  143,  143,   56,  143,  143,   56,
			   56,  143,  143,  143,  143,   56,   56,   56,  143,   56,
			  143,  143,   56,   56,  143,  143,  143,   56,  788,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  785,  785,  785,  777,  785,  785,  777,  777,
			  777,  785,  785,  785,  777,  777,  143,  143,   56,  143,
			   56,  143,   56,  143,   56,  143,  143,  143,   56,  788,
			  777,  777,  777,  777,  777,  777,  777,  785,  785,  785,
			  785,  777,  777,  785,  785,  777,  777,  143,  143,   56,
			  143,   56,  143,   56,  143,  143,   56,  777,  777,  777,

			  785,  785,  785,  777,  777,  777,  777,  785,  777,  777,
			  143,  143,   56,  143,   56,  143,  777,  785,  785,  785,
			  777,  777,  785,  777,  143,  143,   56,  143,   56,  143,
			  777,  785,  777,  785,  777,  143,  143,  777,  785,  777,
			  785,  777,  143,  143,  777,  777,  777,  785,  777,  143,
			  777,  777,  785,  777,  143,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,    0,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,

			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777, yy_Dummy>>)
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
			    0,    0,    0,  125,  123,    1,    2,   15,  101,   18,
			  123,   16,   17,    7,    6,   13,    5,   11,    8,   92,
			   14,   12,   29,   10,   30,   20,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   22,   31,   23,    9,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   24,
			   21,   25,  106,  107,  108,  106,  109,  124,   90,  124,
			  124,  124,  124,  124,  124,  124,   66,  124,  124,   84,
			    1,    2,   28,  101,  100,  121,  121,  121,  121,    3,

			   33,   96,   32,    0,    0,   92,    0,   27,   26,   19,
			    0,   85,   81,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   40,   85,   77,
			   85,   85,   85,   85,   85,   85,   85,    0,    0,    0,
			   91,    0,    0,   87,    0,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   40,   87,   40,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   88,
			  106,  108,    0,  107,  106,  106,  103,  102,    0,   90,

			    0,    0,   89,    0,    0,    0,    0,   66,    0,   64,
			    0,   63,    0,    0,   84,   82,   82,    0,   83,  121,
			  110,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,    4,   34,   96,    0,    0,    0,   94,   96,   94,
			   92,    0,   85,   39,   85,   85,   85,   85,   85,   85,
			    0,   85,   85,   85,   85,   85,   42,   85,   85,   85,
			   85,   85,   85,   85,   74,   85,   85,   85,   85,   85,
			   41,   85,    0,   67,   86,    0,   87,   39,   68,   68,
			   87,   39,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,    0,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   42,   42,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   41,   41,   87,   87,  106,  104,   89,    0,    0,   65,
			   63,    0,    0,    0,    0,  117,  115,  118,  122,  122,
			  116,  114,  111,  112,  113,   96,    0,   96,    0,    0,
			   96,    0,    0,    0,   95,   92,    0,   85,   85,   38,
			   85,   85,   85,   85,    0,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   77,   77,   77,    0,    0,
			   74,   37,   44,   85,   85,   85,   85,   62,   60,   87,
			   87,   87,   87,   38,   87,   87,   38,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   37,   44,   37,   44,   87,
			   87,   87,   87,   87,   87,   87,  106,   65,   63,    0,
			  119,   96,   96,    0,    0,   93,   96,    0,   95,    0,
			   95,    0,    0,    0,   92,    0,   85,   85,   85,   85,
			   45,   85,    0,   85,   85,   85,   36,   85,   85,   85,
			   85,   85,    0,    0,   85,   85,   85,   85,    0,   62,
			    0,   87,   87,   87,   87,   87,   87,   87,   87,   45,
			   87,   45,   87,   87,   87,   36,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,  106,    0,    0,   96,    0,   99,   96,   95,    0,
			    0,   95,    0,    0,   94,    0,   85,   85,   85,   85,
			   47,   85,    0,   85,   85,   85,   85,   85,   85,    0,
			   73,   53,   85,   85,   85,    0,    0,   61,   87,   87,
			   87,   87,   87,   47,   87,   87,   47,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   53,   87,   87,   87,   53,   87,  106,    0,    0,   96,
			    0,    0,    0,   95,    0,   99,   95,    0,   76,    0,
			   97,   99,   97,   85,   85,   59,   85,   46,    0,   43,
			   58,   85,   35,   85,   51,    0,    0,    0,   73,   85,

			   85,   85,    0,    0,   87,   87,   87,   59,   87,   59,
			   87,   46,   43,   58,   87,   43,   58,   87,   35,   35,
			   87,   51,   87,   51,   87,   87,   87,   87,  106,    0,
			   99,    0,   99,    0,   95,    0,    0,   98,    0,   99,
			    0,   98,   85,   85,   85,   79,   54,   85,   74,    0,
			    0,   85,   85,   55,    0,    0,   87,   87,   87,   87,
			   87,   54,   54,   87,   87,   87,   87,   55,   87,  105,
			    0,   99,   98,    0,   98,    0,   98,   85,   85,   48,
			   85,    0,   72,   52,   85,    0,    0,   87,   87,   87,
			   48,   48,   87,   87,   52,   87,   52,  120,   98,   75,

			   85,   85,   85,    0,    0,    0,   72,   85,   78,   78,
			   87,   87,   87,   87,   87,   87,    0,   85,   50,   49,
			    0,   72,   85,    0,   87,   50,   50,   49,   49,   87,
			    0,   85,    0,   85,    0,   87,   87,   71,   85,    0,
			   56,    0,   87,   56,    0,    0,   71,   85,    0,   87,
			    0,    0,   57,    0,   57,    0,   70,    0,    0,    0,
			    0,   70,    0,    0,    0,    0,    0,   69,   80,    0,
			    0,    0,   69,    0,   69,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4729
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 777
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 778
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

	yyNb_rules: INTEGER is 124
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 125
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
