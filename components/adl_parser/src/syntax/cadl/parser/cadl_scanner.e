note
	component:   "openEHR Archetype Project"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues"
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
--|#line 79 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 79")
end
-- Ignore separators
else
--|#line 80 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 80")
end
in_lineno := in_lineno + text_count
end
else
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
in_lineno := in_lineno + 1
else
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := Plus_code
else
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 93 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 93")
end
last_token := Slash_code
else
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Equal_code
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Semicolon_code
else
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Colon_code
else
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Left_parenthesis_code
else
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
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
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := Dollar_code
else
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 20 then
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := Question_mark_code
else
--|#line 108 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 108")
end
last_token := SYM_INTERVAL_DELIM
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := Left_bracket_code
else
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := Right_bracket_code
end
else
if yy_act = 24 then
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_START_CBLOCK
else
--|#line 114 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 114")
end
last_token := SYM_END_CBLOCK
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := SYM_GE
else
--|#line 117 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 117")
end
last_token := SYM_LE
end
else
if yy_act = 28 then
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_NE
else
--|#line 120 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 120")
end
last_token := SYM_LT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
end
last_token := SYM_GT
else
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_MODULO
end
else
if yy_act = 32 then
--|#line 124 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 124")
end
last_token := SYM_DIV
else
--|#line 126 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 126")
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
--|#line 127 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 127")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_MATCHES
end
else
if yy_act = 36 then
--|#line 133 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 133")
end
last_token := SYM_MATCHES
else
--|#line 137 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 137")
end
last_token := SYM_THEN
end
end
else
if yy_act <= 39 then
if yy_act = 38 then
--|#line 139 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 139")
end
last_token := SYM_ELSE
else
--|#line 141 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 141")
end
last_token := SYM_AND
end
else
if yy_act = 40 then
--|#line 143 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 143")
end
last_token := SYM_OR
else
--|#line 145 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 145")
end
last_token := SYM_XOR
end
end
end
else
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 147 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 147")
end
last_token := SYM_NOT
else
--|#line 149 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 149")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 44 then
--|#line 151 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 151")
end
last_token := SYM_TRUE
else
--|#line 153 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 153")
end
last_token := SYM_FALSE
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 155 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 155")
end
last_token := SYM_FORALL
else
--|#line 157 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 157")
end
last_token := SYM_EXISTS
end
else
if yy_act = 48 then
--|#line 161 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 161")
end
last_token := SYM_EXISTENCE
else
--|#line 163 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 163")
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
--|#line 165 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 165")
end
last_token := SYM_CARDINALITY
else
--|#line 167 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 167")
end
last_token := SYM_ORDERED
end
else
if yy_act = 52 then
--|#line 169 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 169")
end
last_token := SYM_UNORDERED
else
--|#line 171 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 171")
end
last_token := SYM_UNIQUE
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 173 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 173")
end
last_token := SYM_INFINITY
else
--|#line 175 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 175")
end
last_token := SYM_USE_NODE
end
else
if yy_act = 56 then
--|#line 177 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 177")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 179 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 179")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
end
else
if yy_act <= 61 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 181 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 181")
end
last_token := SYM_INCLUDE
else
--|#line 183 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 183")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 60 then
--|#line 185 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 185")
end
last_token := SYM_AFTER
else
--|#line 187 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 187")
end
last_token := SYM_BEFORE
end
end
else
if yy_act <= 63 then
if yy_act = 62 then
--|#line 190 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 190")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 196 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 196")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 64 then
--|#line 201 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 201")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 207 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 207")
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
if yy_act <= 98 then
if yy_act <= 82 then
if yy_act <= 74 then
if yy_act <= 70 then
if yy_act <= 68 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 223 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 223")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 231 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 231")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
else
--|#line 238 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 238")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
end
else
if yy_act = 69 then
--|#line 245 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 245")
end
in_lineno := in_lineno + text_count
else
--|#line 248 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 248")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 72 then
if yy_act = 71 then
--|#line 250 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 250")
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
--|#line 271 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 271")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 73 then
--|#line 277 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 277")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 284 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 284")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 78 then
if yy_act <= 76 then
if yy_act = 75 then
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 286 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 286")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 77 then
--|#line 293 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 293")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 80 then
if yy_act = 79 then
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 302 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 302")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 81 then
--|#line 309 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 309")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 310 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 310")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 90 then
if yy_act <= 86 then
if yy_act <= 84 then
if yy_act = 83 then
--|#line 317 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 317")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 329 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 329")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 85 then
--|#line 339 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 339")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 344 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 344")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 88 then
if yy_act = 87 then
--|#line 354 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 354")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 360 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 360")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 89 then
--|#line 370 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 370")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 371 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 371")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
else
if yy_act <= 94 then
if yy_act <= 92 then
if yy_act = 91 then
--|#line 385 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 385")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 391 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 391")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 93 then
--|#line 397 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 397")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 401 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 401")
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
if yy_act <= 96 then
if yy_act = 95 then
--|#line 442 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 442")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 448 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 448")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 97 then
--|#line 454 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 454")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 460 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 460")
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
if yy_act <= 114 then
if yy_act <= 106 then
if yy_act <= 102 then
if yy_act <= 100 then
if yy_act = 99 then
--|#line 467 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 467")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 473 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 473")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 101 then
--|#line 480 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 480")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
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
if yy_act <= 104 then
if yy_act = 103 then
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 502 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 502")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 105 then
--|#line 507 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 507")
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
--|#line 522 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 522")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 110 then
if yy_act <= 108 then
if yy_act = 107 then
--|#line 523 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 523")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 524 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 524")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 109 then
	yy_end := yy_end - 1
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
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
--|#line 529 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 529")
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
if yy_act <= 112 then
if yy_act = 111 then
--|#line 530 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 530")
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
--|#line 550 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 550")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 113 then
--|#line 555 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 555")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 122 then
if yy_act <= 118 then
if yy_act <= 116 then
if yy_act = 115 then
--|#line 565 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 565")
end
in_buffer.append_character ('"')
else
--|#line 567 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 567")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 117 then
--|#line 571 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 571")
end
in_buffer.append_string (text)
else
--|#line 573 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 573")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 120 then
if yy_act = 119 then
--|#line 578 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 578")
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
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 121 then
--|#line 598 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 598")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 600 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 600")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 126 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 601 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 601")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 602 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 602")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 125 then
--|#line 603 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 603")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 604 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 604")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 128 then
if yy_act = 127 then
--|#line 606 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 606")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 607 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 607")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 129 then
--|#line 611 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 611")
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
			create an_array.make (0, 6184)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   29,
			   29,   30,   30,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   40,   41,   42,   40,   43,   44,   40,
			   45,   46,   47,   48,   40,   40,   40,   49,   50,   40,
			   51,   52,   40,   53,   54,   55,   56,   14,   57,   58,
			   59,   60,   61,   62,   60,   63,   64,   60,   65,   66,
			   67,   60,   60,   60,   60,   68,   69,   60,   60,   70,
			   71,   72,   73,   74,   14,   14,   14,   14,   14,   14,
			   14,   14,   14,   76,   85,   85,   95,   77,   76,   95,

			  103,   97,   77,   97,   97,  107,  156,  108,  108,  108,
			  108,  108,  108,  110,  232,  111,  210,  112,  112,  112,
			  112,  112,  112,  118,  118,  168,  118,  156,  844,  156,
			  178,   86,   86,  110,  161,  111,  363,  114,  114,  114,
			  114,  114,  114,  354,   78,  104,  304,  120,  470,   78,
			  843,   96,  827,  169,   96,  161,  113,  161,  179,  826,
			   87,   87,  209,  211,  209,  209,  564,  564,   97,  233,
			   97,   97,  354,  222,  304,  812,  113,  470,   79,   80,
			   81,   82,   83,   79,   80,   81,   82,   83,   88,   89,
			   90,   88,   89,   88,   88,   88,   88,   88,   88,   88,

			   88,   88,   91,   92,   88,   92,   92,   92,   92,   92,
			   92,   88,   88,   88,   88,   88,   88,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   88,   88,   93,   88,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			  118,  118,  305,  118,  118,  118,  790,  118,  742,  208,
			  118,  118,  228,  118,  208,  228,  118,  118,  783,  118,

			  118,  118,  560,  118,  120,  208,  118,  118,  120,  118,
			  305,  742,  208,  121,  120,  156,  124,  122,  125,  123,
			  120,  186,  482,  188,  120,  156,  118,  118,  791,  118,
			  120,  130,  118,  118,  134,  118,  306,  126,  208,  118,
			  118,  121,  118,  161,  124,  122,  125,  123,  127,  187,
			  120,  189,  312,  161,  128,  208,  120,  118,  118,  130,
			  118,  474,  134,  120,  306,  126,  129,  212,  212,  212,
			  131,  132,  118,  118,  213,  118,  133,  127,  156,  135,
			  312,  120,  128,  214,  214,  214,  718,  136,  118,  118,
			  218,  118,  213,  314,  129,  204,  120,  717,  131,  132,

			  137,  716,  118,  118,  133,  118,  161,  135,  150,  150,
			  316,  146,  120,  150,  150,  136,  147,  215,  215,  118,
			  118,  314,  118,  144,  205,  221,  120,  219,  137,  118,
			  118,  145,  118,  216,  216,  216,  156,  223,  316,  146,
			  223,  170,  148,  120,  147,  138,  138,  138,  138,  138,
			  138,  144,  171,  120,  174,  150,  220,  156,  156,  145,
			  139,  322,  219,  715,  161,  202,  175,  140,  149,  172,
			  148,  190,  323,  156,  141,  521,  142,  698,  143,  658,
			  227,  173,  176,  227,  191,  161,  161,  327,  139,  322,
			  225,  220,  228,  203,  177,  140,  598,  149,  578,  192,

			  323,  161,  742,  230,  521,  142,  154,  143,  154,  154,
			  827,  154,  193,  260,  155,  327,  155,  252,  252,  252,
			  252,  252,  252,  570,  156,  156,  156,  156,  156,  156,
			  157,  328,  156,  225,  329,  110,  156,  156,  156,  156,
			  156,  158,  156,  156,  156,  159,  156,  160,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  328,
			  161,  334,  329,  156,  161,  161,  162,  161,  161,  163,
			  161,  161,  161,  164,  161,  165,  161,  161,  161,  161,
			  161,  162,  161,  161,  161,  161,  161,  154,  227,  334,
			  154,  227,  516,  260,  209,  155,  209,  209,  801,  802,

			  228,  229,  326,  156,  156,  156,  156,  156,  156,  157,
			  336,  230,  156,  801,  802,  156,  156,  156,  156,  166,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  336,  338,
			  161,  225,  156,  161,  161,  161,  161,  167,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  156,  338,  156,  156,
			  393,  194,  180,  181,  118,  118,  198,  118,  182,  195,
			  317,  199,  223,  366,  339,  223,  318,  254,  254,  254,
			  254,  254,  254,  569,  161,  366,  161,  161,  259,  196,

			  183,  184,  467,  255,  200,  342,  185,  197,  317,  201,
			  235,  235,  339,  235,  318,  446,  240,  258,  258,  258,
			  258,  258,  258,  150,  150,  241,  241,  241,  241,  241,
			  241,  255,  430,  342,  113,  225,  236,  300,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  242,  249,  249,  249,  249,  249,  249,  301,  429,
			  230,  393,  343,  230,  260,  232,  243,  377,  250,  110,
			  244,  111,  245,  256,  256,  256,  256,  256,  256,  257,
			  110,  237,  111,  156,  256,  256,  256,  256,  256,  256,

			  343,  251,  118,  118,  314,  118,  250,  118,  118,  376,
			  118,  118,  118,  375,  118,  260,  118,  118,  348,  118,
			  260,  161,  113,  374,  260,  247,  120,  247,  247,  260,
			  233,  120,  315,  113,  346,  120,  118,  118,  347,  118,
			  120,  118,  118,  371,  118,  352,  348,  264,  263,  260,
			  118,  118,  262,  118,  260,  118,  118,  861,  118,  260,
			  120,  517,  346,  260,  518,  120,  347,  226,  260,  265,
			  431,  260,  432,  352,  120,  264,  263,  260,  342,  120,
			  262,  222,  208,  218,  266,  268,  118,  118,  208,  118,
			  156,  269,  118,  118,  267,  118,  348,  265,  431,  260,

			  432,  118,  118,  304,  118,  260,  344,  330,  118,  118,
			  120,  118,  266,  268,  260,  272,  120,  435,  161,  269,
			  219,  260,  267,  270,  351,  120,  118,  118,  260,  118,
			  272,  309,  120,  118,  118,  271,  118,  861,  303,  260,
			  118,  118,  273,  118,  437,  435,  260,  431,  260,  220,
			  120,  270,  302,  260,  439,  221,  274,  120,  153,  275,
			  212,  212,  212,  271,  120,  118,  118,  156,  118,  300,
			  273,  248,  437,  118,  118,  433,  118,  247,  260,  316,
			  118,  118,  439,  118,  274,  277,  260,  275,  276,  120,
			  596,  517,  219,  260,  517,  161,  246,  120,  260,  118, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  118,  239,  118,  279,  120,  118,  118,  319,  118,  260,
			  278,  280,  260,  277,  101,  260,   98,  156,  260,  118,
			  118,  220,  118,  120,  118,  118,  226,  118,  156,  120,
			  334,  279,  260,  305,  156,  222,  139,  260,  278,  280,
			  281,  260,  281,  120,  287,  161,  260,  724,  120,  260,
			  287,  292,  142,  260,  293,  139,  161,  330,  335,  282,
			  440,  310,  161,  283,  139,  156,  284,  306,  156,  287,
			  322,  339,  156,  119,  794,  285,  724,  286,  208,  292,
			  206,  142,  293,  139,  153,  117,  260,  282,  440,  118,
			  118,  283,  118,  161,  284,  311,  161,  116,  324,  341,

			  161,  441,  260,  794,  285,  156,  286,  118,  118,  227,
			  118,  260,  227,  120,  119,  119,  119,  119,  119,  119,
			  260,  228,  260,  288,  288,  288,  288,  288,  288,  441,
			  115,  120,  230,  161,  109,  294,  118,  118,  106,  118,
			  101,  156,  289,  287,  403,  290,  445,  119,   99,  260,
			  448,  291,  323,  118,  118,  403,  118,   98,  118,  118,
			  120,  118,  225,  294,  861,  403,  260,  260,  297,  161,
			  289,  260,  260,  290,  445,  861,  119,  120,  448,  291,
			  325,  861,  120,  403,  118,  118,  156,  118,  449,  295,
			  861,  156,  312,  296,  861,  327,  297,  260,  798,  260,

			  307,  298,  308,  308,  308,  308,  308,  308,  120,  260,
			  450,  260,  208,  861,  161,  208,  449,  295,  156,  161,
			  313,  296,  260,  331,  208,  861,  317,  798,  156,  298,
			  156,  260,  318,  299,  260,  818,  260,  451,  450,  328,
			  260,  156,  329,  336,  246,  246,  161,  246,  338,  455,
			  156,  457,  208,  156,  320,  156,  161,  346,  161,  156,
			  321,  347,  299,  260,  818,  451,  352,  332,  378,  161,
			  333,  337,  861,  343,  861,  861,  340,  455,  161,  457,
			  861,  161,  156,  161,  861,  349,  861,  161,  861,  350,
			  212,  212,  212,  208,  353,  861,  356,  357,  358,  359,

			  360,  345,  361,  361,  361,  861,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  260,
			  362,  362,  362,  227,  370,  370,  227,  370,  372,  373,
			  373,  373,  373,  373,  373,  228,  458,  461,  156,  382,
			  382,  382,  382,  382,  382,  861,  230,  861,  861,  462,
			  236,  380,  861,  380,  861,  354,  381,  381,  381,  381,
			  381,  381,  215,  215,  458,  461,  161,  383,  383,  383,
			  383,  383,  383,  387,  861,  387,  225,  462,  388,  388,
			  388,  388,  388,  388,  355,  364,  365,  366,  364,  365,

			  364,  364,  364,  364,  364,  364,  364,  364,  367,  229,
			  229,  364,  229,  229,  229,  229,  229,  229,  364,  368,
			  364,  364,  364,  364,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  364,  364,  369,
			  364,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  235,  235,  861,
			  235,  390,  390,  390,  390,  390,  391,  391,  391,  391,

			  391,  391,  411,  411,  411,  411,  411,  411,  367,  366,
			  861,  367,  861,  236,  861,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  379,  379,
			  379,  379,  379,  379,  384,  384,  384,  384,  384,  384,
			  861,  260,  465,  861,  250,  368,  366,  110,  368,  111,
			  385,  389,  389,  389,  389,  389,  389,  861,  237,  437,
			  156,  118,  118,  260,  118,  861,  466,  251,  118,  118,
			  465,  118,  250,  386,  260,  861,  118,  118,  385,  118,
			  861,  260,  439,  118,  118,  120,  118,  438,  161,  260,

			  113,  861,  120,  394,  466,  861,  260,  260,  118,  118,
			  120,  118,  118,  118,  861,  118,  861,  120,  395,  861,
			  442,  260,  799,  799,  799,  260,  156,  118,  118,  260,
			  118,  394,  120,  396,  118,  118,  120,  118,  861,  397,
			  260,  861,  118,  118,  398,  118,  395,  260,  156,  118,
			  118,  120,  118,  861,  161,  260,  118,  118,  120,  118,
			  260,  396,  260,  208,  399,  861,  120,  397,  861,  260,
			  208,  446,  398,  120,  118,  118,  161,  118,  400,  458,
			  120,  118,  118,  861,  118,  520,  401,  260,  118,  118,
			  524,  118,  399,  404,  260,  861,  118,  118,  120,  118,

			  260,  260,  861,  861,  402,  120,  400,  460,  526,  260,
			  260,  405,  120,  520,  401,  861,  861,  406,  524,  462,
			  120,  404,  118,  118,  407,  118,  408,  118,  118,  156,
			  118,  118,  118,  861,  118,  260,  526,  861,  861,  405,
			  260,  212,  212,  212,  260,  406,  120,  464,  214,  214,
			  214,  120,  407,  528,  408,  120,  861,  161,  118,  118,
			  208,  118,  529,  410,  414,  414,  414,  414,  414,  414,
			  861,  260,  861,  409,  412,  412,  412,  412,  412,  412,
			  861,  528,  120,  415,  415,  415,  415,  415,  415,  861,
			  529,  410,  861,  119,  416,  416,  416,  416,  416,  416,

			  418,  409,  418,  413,  417,  417,  417,  417,  417,  417,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  532,  419,  118,  118,  420,  118,  118,  118,
			  260,  118,  421,  118,  118,  119,  118,  260,  216,  216,
			  216,  260,  118,  118,  861,  118,  260,  861,  120,  156,
			  532,  419,  120,  861,  420,  260,  260,  120,  118,  118,
			  421,  118,  861,  119,  423,  260,  120,  861,  291,  861,
			  861,  260,  422,  118,  118,  156,  118,  161,  118,  118,
			  440,  118,  120,  861,  156,  533,  260,  861,  861,  448,
			  424,  260,  118,  118,  861,  118,  291,  120,  118,  118,

			  422,  118,  120,  161,  861,  260,  118,  118,  443,  118,
			  535,  260,  161,  533,  861,  425,  120,  452,  424,  260,
			  260,  426,  120,  260,  861,  260,  861,  208,  861,  307,
			  120,  307,  307,  307,  307,  307,  307,  861,  535,  156,
			  536,  861,  156,  425,  156,  260,  260,  427,  861,  426,
			  432,  441,  435,  861,  307,  428,  308,  308,  308,  308,
			  308,  308,  303,  260,  156,  156,  861,  161,  536,  450,
			  161,  260,  161,  208,  403,  260,  445,  260,  434,  444,
			  436,  260,  156,  260,  428,  403,  537,  449,  455,  861,
			  156,  538,  161,  161,  156,  403,  156,  454,  260,  861, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  156,  260,  156,  461,  447,  212,  212,  212,  457,  542,
			  161,  466,  465,  403,  537,  453,  456,  156,  161,  538,
			  156,  861,  161,  861,  161,  861,  365,  366,  161,  365,
			  161,  463,  370,  370,  470,  370,  459,  542,  367,  469,
			  468,  861,  861,  467,  861,  161,  861,  861,  161,  368,
			  544,  212,  212,  212,  861,  861,  517,  861,  861,  518,
			  861,  861,  861,  471,  372,  373,  373,  373,  373,  373,
			  373,  472,  472,  472,  472,  472,  472,  861,  544,  369,
			  381,  381,  381,  381,  381,  381,  545,  250,  473,  473,
			  473,  473,  473,  473,  475,  475,  475,  475,  475,  475,

			  476,  476,  476,  476,  476,  476,  260,  260,  861,  596,
			  251,  861,  260,  861,  545,  250,  477,  477,  477,  477,
			  477,  477,  861,  548,  549,  156,  532,  474,  478,  526,
			  478,  156,  385,  479,  479,  479,  479,  479,  479,  480,
			  480,  480,  480,  480,  480,  388,  388,  388,  388,  388,
			  388,  548,  549,  161,  534,  386,  861,  527,  861,  161,
			  385,  481,  481,  481,  481,  481,  481,  483,  484,  861,
			  485,  485,  485,  485,  485,  485,  486,  486,  486,  486,
			  486,  486,  487,  487,  487,  487,  487,  487,  118,  118,
			  861,  118,  118,  118,  599,  118,  601,  497,  603,  861,

			  482,  260,  595,  861,  861,  260,  118,  118,  497,  118,
			  118,  118,  120,  118,  118,  118,  120,  118,  497,  260,
			  861,  861,  599,  260,  601,  861,  603,  260,  861,  609,
			  120,  489,  118,  118,  120,  118,  497,  861,  120,  490,
			  118,  118,  861,  118,  861,  260,  492,  118,  118,  491,
			  118,  861,  597,  260,  861,  511,  120,  609,  861,  489,
			  260,  260,  118,  118,  120,  118,  511,  610,  490,  118,
			  118,  120,  118,  861,  492,  260,  511,  491,  493,  495,
			  156,  861,  260,  260,  861,  494,  120,  861,  118,  118,
			  496,  118,  260,  120,  511,  610,  118,  118,  861,  118,

			  861,  260,  156,  861,  611,  498,  493,  495,  161,  260,
			  861,  156,  120,  494,  118,  118,  528,  118,  496,  861,
			  120,  516,  520,  118,  118,  861,  118,  260,  118,  118,
			  161,  118,  611,  498,  499,  500,  260,  260,  120,  161,
			  156,  260,  118,  118,  530,  118,  861,  120,  861,  861,
			  522,  119,  120,  501,  119,  260,  156,  281,  502,  281,
			  119,  861,  499,  500,  612,  861,  120,  790,  161,  861,
			  861,  503,  411,  411,  411,  411,  411,  411,  742,  119,
			  283,  501,  119,  506,  161,  504,  502,  861,  119,  281,
			  119,  281,  612,  414,  414,  414,  414,  414,  414,  503,

			  505,  415,  415,  415,  415,  415,  415,  861,  283,  792,
			  861,  506,  861,  504,  260,  506,  416,  416,  416,  416,
			  416,  416,  119,  506,  736,  736,  736,  736,  505,  861,
			  616,  507,  861,  599,  119,  417,  417,  417,  417,  417,
			  417,  260,  861,  506,  861,  119,  641,  641,  641,  641,
			  641,  506,  508,  508,  508,  508,  508,  508,  616,  507,
			  156,  600,  861,  119,  260,  861,  861,  537,  119,  509,
			  509,  509,  509,  509,  509,  510,  510,  510,  510,  510,
			  510,  118,  118,  156,  118,  861,  118,  118,  161,  118,
			  118,  118,  861,  118,  260,  541,  529,  119,  119,  260,

			  861,  861,  861,  260,  119,  120,  118,  118,  861,  118,
			  120,  161,  118,  118,  120,  118,  260,  861,  260,  260,
			  118,  118,  260,  118,  531,  260,  118,  118,  260,  118,
			  120,  861,  618,  260,  260,  156,  120,  156,  550,  516,
			  542,  156,  260,  513,  120,  260,  524,  156,  514,  551,
			  120,  535,  512,  156,  260,  861,  521,  861,  861,  515,
			  618,  156,  861,  161,  156,  161,  550,  536,  543,  161,
			  604,  513,  544,  156,  525,  161,  514,  551,  548,  539,
			  512,  161,  605,  260,  545,  523,  260,  515,  566,  161,
			  566,  861,  161,  861,  861,  540,  861,  861,  604,  567,

			  546,  161,  156,  619,  549,  156,  552,  260,  861,  260,
			  605,  861,  547,  472,  472,  472,  472,  472,  472,  555,
			  555,  555,  555,  555,  555,  598,  156,  568,  610,  554,
			  161,  619,  553,  161,  556,  556,  556,  556,  556,  556,
			  557,  557,  557,  557,  557,  557,  558,  558,  558,  558,
			  558,  558,  861,  622,  161,  623,  613,  554,  474,  624,
			  625,  631,  385,  479,  479,  479,  479,  479,  479,  559,
			  559,  559,  559,  559,  559,  561,  561,  561,  561,  561,
			  561,  622,  861,  623,  251,  386,  861,  624,  625,  631,
			  385,  562,  562,  562,  562,  562,  562,  563,  563,  563,

			  563,  563,  563,  118,  118,  861,  118,  861,  560,  558,
			  558,  558,  558,  558,  558,  484,  260,  485,  485,  485,
			  485,  485,  485,  118,  118,  565,  118,  120,  118,  118,
			  482,  118,  118,  118,  861,  118,  260,  118,  118,  861,
			  118,  260,  666,  587,  667,  260,  861,  120,  861,  861,
			  260,  861,  120,  565,  587,  260,  120,  861,  260,  861,
			  572,  120,  118,  118,  587,  118,  118,  118,  574,  118,
			  666,  573,  667,  861,  616,  260,  260,  619,  571,  260,
			  118,  118,  587,  118,  118,  118,  120,  118,  572,  861,
			  120,  861,  260,  260,  575,  604,  574,  260,  592,  573,

			  118,  118,  617,  118,  120,  621,  576,  605,  120,  593,
			  861,  156,  669,  260,  861,  861,  579,  577,  601,  594,
			  861,  861,  575,  607,  120,  118,  118,  670,  118,  118,
			  118,  580,  118,  861,  576,  608,  861,  593,  260,  161,
			  669,  673,  260,  260,  579,  577,  602,  118,  118,  120,
			  118,  118,  118,  120,  118,  670,  861,  861,  861,  580,
			  260,  581,  622,  861,  260,  861,  861,  118,  118,  673,
			  118,  120,  861,  861,  260,  120,  260,  861,  260,  582,
			  260,  585,  585,  585,  585,  585,  585,  861,  861,  581,
			  626,  120,  603,  156,  583,  623,  861,  156,  861,  584,

			  119,  119,  119,  119,  119,  119,  861,  582,  618,  861,
			  119,  508,  508,  508,  508,  508,  508,  861,  674,  861,
			  606,  161,  583,  627,  418,  161,  418,  584,  509,  509,
			  509,  509,  509,  509,  118,  118,  620,  118,  861,  586,
			  510,  510,  510,  510,  510,  510,  674,  260,  118,  118,
			  420,  118,  118,  118,  861,  118,  421,  119,  120,  861,
			  260,  260,  119,  260,  861,  260,  588,  586,  651,  260,
			  861,  861,  120,  260,  118,  118,  120,  118,  420,  156,
			  589,  611,  156,  612,  421,  651,  861,  260,  156,  651,
			  119,  861,  669,  260,  588,  590,  861,  861,  120,  629, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  629,  629,  629,  629,  629,  861,  861,  161,  589,  614,
			  161,  615,  156,  651,  591,  861,  161,  861,  861,  628,
			  671,  628,  861,  590,  629,  629,  629,  629,  629,  629,
			  630,  630,  630,  630,  630,  630,  861,  861,  474,  260,
			  161,  861,  591,  558,  558,  558,  558,  558,  558,  633,
			  633,  633,  633,  633,  633,  861,  675,  676,  675,  632,
			  634,  634,  634,  634,  634,  634,  635,  635,  635,  635,
			  635,  635,  636,  636,  636,  636,  636,  636,  637,  637,
			  637,  637,  637,  637,  675,  676,  678,  632,  560,  638,
			  638,  638,  638,  638,  638,  639,  861,  639,  680,  861,

			  636,  636,  636,  636,  636,  636,  861,  861,  682,  861,
			  861,  482,  640,  640,  640,  640,  640,  640,  643,  643,
			  643,  643,  643,  643,  118,  118,  680,  118,  861,  118,
			  118,  861,  118,  861,  644,  260,  682,  260,  662,  861,
			  662,  683,  260,  118,  118,  861,  118,  861,  120,  662,
			  667,  664,  646,  120,  156,  686,  260,  118,  118,  663,
			  118,  665,  644,  118,  118,  861,  118,  120,  861,  683,
			  260,  647,  118,  118,  861,  118,  260,  662,  668,  664,
			  646,  120,  161,  686,  861,  260,  260,  120,  687,  648,
			  118,  118,  688,  118,  118,  118,  120,  118,  719,  647,

			  861,  861,  649,  260,  861,  682,  861,  260,  118,  118,
			  861,  118,  118,  118,  120,  118,  687,  648,  120,  861,
			  688,  260,  696,  260,  861,  260,  719,  650,  118,  118,
			  649,  118,  120,  684,  118,  118,  120,  118,  652,  861,
			  653,  260,  156,  118,  118,  386,  118,  260,  861,  670,
			  696,  861,  120,  861,  861,  650,  260,  654,  120,  861,
			  118,  118,  861,  118,  861,  657,  652,  120,  653,  861,
			  161,  260,  655,  260,  281,  656,  281,  672,  585,  585,
			  585,  585,  585,  585,  120,  654,  118,  118,  861,  118,
			  156,  118,  118,  657,  118,  118,  118,  260,  118,  260,

			  655,  663,  674,  656,  260,  260,  260,  119,  260,  861,
			  120,  861,  665,  260,  720,  120,  156,  260,  161,  120,
			  722,  660,  665,  861,  156,  156,  661,  260,  680,  659,
			  677,  683,  156,  726,  861,  728,  156,  676,  118,  118,
			  665,  118,  720,  861,  161,  729,  156,  686,  722,  660,
			  861,  260,  161,  161,  661,  861,  681,  659,  861,  685,
			  161,  726,  120,  728,  161,  679,  629,  629,  629,  629,
			  629,  629,  730,  729,  161,  689,  629,  629,  629,  629,
			  629,  629,  690,  690,  690,  690,  690,  690,  691,  861,
			  691,  861,  861,  692,  692,  692,  692,  692,  692,  693,

			  730,  693,  861,  861,  694,  694,  694,  694,  694,  694,
			  694,  694,  694,  694,  694,  694,  695,  695,  695,  695,
			  695,  695,  636,  636,  636,  636,  636,  636,  697,  697,
			  697,  697,  697,  697,  636,  636,  636,  636,  636,  636,
			  699,  699,  699,  699,  699,  699,  861,  861,  861,  560,
			  700,  700,  700,  700,  700,  700,  701,  701,  701,  701,
			  701,  701,  861,  861,  754,  708,  118,  118,  702,  118,
			  702,  755,  696,  703,  703,  703,  703,  703,  703,  260,
			  118,  118,  708,  118,  118,  118,  708,  118,  118,  118,
			  120,  118,  754,  260,  260,  386,  757,  260,  861,  755,

			  696,  260,  118,  118,  120,  118,  861,  861,  120,  705,
			  708,  861,  120,  156,  707,  260,  861,  706,  711,  118,
			  118,  759,  118,  861,  757,  260,  120,  118,  118,  861,
			  118,  861,  260,  118,  118,  711,  118,  705,  861,  711,
			  260,  161,  707,  120,  156,  706,  260,  118,  118,  759,
			  118,  120,  861,  118,  118,  761,  118,  120,  861,  260,
			  260,  118,  118,  711,  118,  260,  260,  118,  118,  861,
			  118,  120,  161,  861,  260,  260,  709,  120,  156,  260,
			  260,  762,  260,  761,  156,  120,  710,  118,  118,  720,
			  118,  120,  722,  712,  156,  724,  260,  260,  156,  260,

			  260,  156,  713,  777,  778,  709,  161,  780,  726,  762,
			  861,  120,  161,  861,  710,  156,  728,  721,  757,  714,
			  723,  712,  161,  861,  725,  861,  161,  861,  861,  161,
			  713,  777,  778,  861,  861,  780,  727,  692,  692,  692,
			  692,  692,  692,  161,  731,  782,  758,  714,  732,  732,
			  732,  732,  732,  732,  694,  694,  694,  694,  694,  694,
			  694,  694,  694,  694,  694,  694,  733,  733,  733,  733,
			  733,  733,  734,  782,  734,  861,  861,  735,  735,  735,
			  735,  735,  735,  738,  739,  738,  739,  474,  737,  737,
			  737,  737,  737,  737,  635,  635,  635,  635,  635,  635,

			  703,  703,  703,  703,  703,  703,  118,  118,  861,  118,
			  696,  741,  741,  741,  741,  741,  741,  793,  861,  260,
			  260,  861,  740,  796,  118,  118,  861,  118,  861,  861,
			  120,  118,  118,  386,  118,  861,  743,  260,  696,  156,
			  747,  861,  861,  861,  260,  793,  118,  118,  120,  118,
			  482,  796,  861,  118,  118,  120,  118,  747,  750,  260,
			  744,  747,  750,  745,  743,  861,  260,  161,  118,  118,
			  120,  118,  861,  118,  118,  861,  118,  120,  861,  750,
			  751,  260,  808,  746,  751,  747,  260,  809,  744,  260,
			  750,  745,  120,  118,  118,  260,  118,  120,  750,  748,

			  751,  751,  752,  260,  753,  749,  260,  761,  156,  819,
			  808,  746,  751,  828,  156,  809,  834,  120,  755,  752,
			  759,  753,  156,  861,  861,  118,  118,  748,  118,  861,
			  752,  861,  753,  749,  861,  763,  161,  819,  260,  861,
			  861,  828,  161,  861,  834,  861,  756,  861,  760,  120,
			  161,  690,  690,  690,  690,  690,  690,  735,  735,  735,
			  735,  735,  735,  764,  764,  764,  764,  764,  764,  765,
			  765,  765,  765,  765,  765,  568,  568,  568,  568,  568,
			  568,  766,  766,  766,  766,  766,  766,  861,  861,  861,
			  474,  767,  767,  767,  767,  767,  767,  118,  118,  861,

			  118,  861,  560,  697,  697,  697,  697,  697,  697,  861,
			  260,  118,  118,  773,  118,  118,  118,  773,  118,  861,
			  861,  120,  861,  774,  260,  773,  861,  774,  260,  775,
			  118,  118,  769,  118,  773,  120,  861,  118,  118,  120,
			  118,  861,  482,  260,  774,  773,  775,  771,  774,  260,
			  260,  260,  776,  260,  120,  774,  770,  775,  260,  861,
			  769,  120,  733,  733,  733,  733,  733,  733,  156,  776,
			  156,  861,  780,  861,  861,  771,  861,  156,  861,  861,
			  776,  778,  772,  861,  770,  784,  784,  784,  784,  784,
			  784,  861,  861,  861,  118,  118,  161,  118,  161,  861, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  781,  560,  260,  861,  861,  161,  738,  260,  738,  779,
			  772,  767,  767,  767,  767,  767,  767,  861,  120,  118,
			  118,  156,  118,  260,  861,  260,  786,  118,  118,  861,
			  118,  861,  260,  118,  118,  861,  118,  861,  794,  861,
			  260,  861,  156,  120,  156,  740,  260,  861,  861,  161,
			  861,  120,  118,  118,  786,  118,  796,  120,  800,  800,
			  800,  800,  800,  800,  861,  260,  861,  795,  787,  832,
			  161,  788,  161,  861,  118,  118,  120,  118,  118,  118,
			  832,  118,  789,  861,  797,  260,  805,  260,  806,  861,
			  832,  260,  118,  118,  805,  118,  806,  787,  120,  788,

			  742,  861,  120,  861,  156,  260,  861,  805,  832,  806,
			  861,  789,  861,  806,  861,  861,  120,  861,  861,  803,
			  861,  807,  805,  861,  806,  810,  810,  810,  810,  810,
			  810,  861,  161,  804,  807,  740,  740,  740,  740,  740,
			  740,  118,  118,  815,  118,  118,  118,  803,  118,  807,
			  742,  815,  816,  861,  260,  820,  861,  820,  260,  861,
			  816,  804,  861,  816,  815,  120,  821,  118,  118,  120,
			  118,  817,  861,  816,  861,  861,  833,  814,  861,  815,
			  260,  861,  118,  118,  817,  118,  861,  833,  816,  861,
			  813,  120,  861,  861,  822,  260,  837,  833,  861,  817,

			  824,  824,  824,  824,  824,  814,  120,  837,  825,  829,
			  829,  829,  829,  829,  829,  833,  861,  837,  861,  813,
			  830,  830,  830,  830,  830,  824,  824,  824,  824,  824,
			  824,  118,  118,  861,  118,  837,  825,  835,  835,  835,
			  835,  835,  835,  861,  260,  836,  836,  836,  836,  836,
			  836,  118,  118,  861,  118,  120,  838,  839,  839,  839,
			  839,  839,  839,  831,  260,  861,  861,  838,  840,  861,
			  840,  861,  861,  861,  861,  120,  861,  838,  861,  841,
			  822,  822,  822,  822,  822,  822,  846,  846,  846,  846,
			  846,  831,  847,  848,  861,  838,  845,  845,  845,  845,

			  845,  845,  861,  861,  861,  861,  861,  842,  861,  847,
			  848,  851,  852,  847,  848,  849,  849,  849,  849,  849,
			  849,  850,  850,  850,  850,  850,  850,  861,  851,  852,
			  861,  861,  851,  852,  861,  861,  861,  847,  848,  853,
			  853,  853,  853,  853,  853,  854,  855,  854,  855,  842,
			  842,  842,  842,  842,  842,  861,  851,  852,  857,  857,
			  857,  857,  857,  857,  858,  858,  858,  858,  858,  858,
			  859,  859,  859,  859,  859,  859,  861,  861,  861,  861,
			  854,  861,  854,  861,  856,  858,  858,  858,  858,  858,
			  858,  860,  860,  860,  860,  860,  860,  856,  856,  856,

			  856,  856,  856,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  856,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,

			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,  100,  100,
			  861,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  861,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  102,  102,  861,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  119,  119,  119,  861,  861,
			  861,  861,  861,  861,  861,  119,  119,  861,  119,  861,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  861,  861,  119,  119,  119,  119,  119,

			  119,  119,  119,  119,  151,  151,  861,  151,  151,  861,
			  151,  151,  861,  861,  861,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  861,  861,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  152,
			  152,  861,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,

			  152,  207,  207,  861,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  861,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  217,  217,  217,  217,  217,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  861,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  224,  861,  224,
			  861,  861,  861,  861,  224,  224,  861,  224,  224,  861,
			  861,  861,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  861,  224,  224,  224,  224,

			  224,  224,  224,  224,  224,  224,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,

			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  238,  238,  861,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  105,  861,  861,  861,  861,  105,  105,  861,
			  861,  861,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  861,  861,  105,  105,  105,

			  105,  105,  105,  105,  105,  105,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  861,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,

			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  261,  861,  861,  861,  261,  261,  861,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  861,  861,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  150,  150,  861,  150,  150,  861,  150,
			  150,  150,  861,  861,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  861,  861,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  237,  237,

			  237,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  237,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  861,  861,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,

			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  488,  488,  861,  861,  861,  488,
			  488,  488,  488,  488,  488,  488,  488,  488,  488,  488,
			  488,  488,  488,  488,  488,  488,  488,  488,  488,  488,
			  488,  488,  861,  861,  488,  488,  488,  488,  488,  488,
			  488,  488,  488,  519,  861,  519,  861,  861,  861,  861,
			  519,  519,  861,  519,  519,  861,  861,  861,  519,  519,
			  519,  519,  519,  519,  519,  519,  519,  519,  519,  519,

			  519,  519,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  861,  861,  519,  519,  519,  519,  519,  519,  519,
			  519,  519,  430,  430,  430,  861,  861,  430,  430,  430,
			  430,  430,  430,  430,  430,  430,  861,  861,  430,  430,
			  430,  430,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  430,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  861,  861,  430,  430,  430,  430,  430,  430,  430,
			  430,  430,  595,  861,  595,  861,  861,  861,  861,  595,
			  595,  861,  595,  595,  861,  861,  861,  595,  595,  595,
			  595,  595,  595,  595,  595,  595,  595,  595,  595,  595,

			  595,  595,  595,  595,  595,  595,  595,  595,  595,  595,
			  861,  595,  595,  595,  595,  595,  595,  595,  595,  595,
			  595,  642,  642,  642,  642,  642,  642,  642,  642,  642,
			  861,  642,  642,  642,  642,  642,  642,  642,  642,  642,
			  642,  642,  642,  642,  642,  642,  642,  642,  642,  642,
			  642,  642,  642,  642,  642,  642,  642,  642,  642,  642,
			  642,  642,  642,  642,  642,  642,  642,  642,  642,  642,
			  642,  642,  642,  645,  645,  645,  645,  645,  645,  645,
			  645,  645,  645,  645,  645,  645,  645,  645,  645,  645,
			  645,  645,  645,  645,  645,  645,  861,  861,  645,  645,

			  645,  645,  645,  645,  645,  645,  645,  704,  704,  861,
			  861,  861,  704,  704,  704,  704,  704,  704,  704,  704,
			  704,  704,  704,  704,  704,  704,  704,  704,  704,  704,
			  704,  704,  704,  704,  704,  861,  861,  704,  704,  704,
			  704,  704,  704,  704,  704,  704,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  768,  768,  768,  861,
			  861,  768,  768,  768,  768,  768,  768,  768,  768,  768,
			  785,  785,  861,  861,  861,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  785,  785,  785,  785,  785,  785,  785,  785,  861,  861,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  861,  861,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  823,  823,  861,  861,  861,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  861,  861,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,   13,  861,  861,  861,  861,  861,  861,  861,

			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861, yy_Dummy>>,
			1, 185, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 6184)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
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
			    1,    1,    1,    3,    5,    6,   11,    3,    4,   12,

			   20,   15,    4,   15,   15,   27,   60,   27,   27,   27,
			   27,   27,   27,   29,   94,   29,   78,   29,   29,   29,
			   29,   29,   29,   40,   40,   59,   40,   63,  838,   59,
			   63,    5,    6,   30,   60,   30,  222,   30,   30,   30,
			   30,   30,   30,  204,    3,   20,  158,   40,  354,    4,
			  837,   11,  816,   59,   12,   63,   29,   59,   63,  815,
			    5,    6,   76,   78,   76,   76,  483,  483,   97,   94,
			   97,   97,  204,  222,  158,  802,   30,  354,    3,    3,
			    3,    3,    3,    4,    4,    4,    4,    4,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,

			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			   37,   37,  159,   37,   38,   38,  773,   38,  776,   79,
			   39,   39,  228,   39,   80,  228,   43,   43,  765,   43,

			   41,   41,  733,   41,   37,   81,   45,   45,   38,   45,
			  159,  704,  357,   37,   39,   66,   38,   37,   39,   37,
			   43,   65,  697,   66,   41,   65,   42,   42,  773,   42,
			   45,   43,   44,   44,   45,   44,  160,   41,   82,   46,
			   46,   37,   46,   66,   38,   37,   39,   37,   41,   65,
			   42,   66,  166,   65,   42,   83,   44,   47,   47,   43,
			   47,  690,   45,   46,  160,   41,   42,   79,   79,   79,
			   44,   44,   50,   50,   80,   50,   44,   41,   71,   46,
			  166,   47,   42,   81,   81,   81,  665,   47,   49,   49,
			   84,   49,  357,  168,   42,   71,   50,  664,   44,   44,

			   47,  663,   51,   51,   44,   51,   71,   46,   53,   53,
			  170,   50,   49,   53,   53,   47,   50,   82,   82,   52,
			   52,  168,   52,   49,   71,   86,   51,   84,   47,   48,
			   48,   49,   48,   83,   83,   83,   61,   89,  170,   50,
			   89,   61,   51,   52,   50,   48,   48,   48,   48,   48,
			   48,   49,   61,   48,   62,   53,   84,   70,   62,   49,
			   48,  174,   86,  662,   61,   70,   62,   48,   52,   61,
			   51,   67,  175,   67,   48,  432,   48,  638,   48,  587,
			   92,   61,   62,   92,   67,   70,   62,  180,   48,  174,
			   89,   86,   92,   70,   62,   48,  521,   52,  497,   67,

			  175,   67,  817,   92,  432,   48,  154,   48,   57,  154,
			  817,   57,   67,  161,  154,  180,   57,  110,  110,  110,
			  110,  110,  110,  488,   57,   57,   57,   57,   57,   57,
			   57,  181,  161,   92,  181,  476,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  181,
			  161,  186,  181,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   58,   91,  186,
			   58,   91,  470,  179,  209,   58,  209,  209,  785,  785,

			   91,   91,  179,   58,   58,   58,   58,   58,   58,   58,
			  188,   91,  179,  823,  823,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,  188,  190,
			  179,   91,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   64,  190,   68,   69,
			  393,   68,   64,   64,  118,  118,   69,  118,   64,   68,
			  171,   69,  223,  369,  191,  223,  171,  111,  111,  111,
			  111,  111,  111,  487,   64,  364,   68,   69,  118,   68,

			   64,   64,  348,  111,   69,  194,   64,   68,  171,   69,
			   95,   95,  191,   95,  171,  323,  104,  113,  113,  113,
			  113,  113,  113,  151,  151,  104,  104,  104,  104,  104,
			  104,  111,  303,  194,  487,  223,   95,  151,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,  104,  108,  108,  108,  108,  108,  108,  151,  300,
			  230,  261,  195,  230,  169,  231,  104,  245,  108,  112,
			  104,  112,  104,  112,  112,  112,  112,  112,  112,  112,
			  114,   95,  114,  169,  114,  114,  114,  114,  114,  114,

			  195,  108,  119,  119,  169,  119,  108,  121,  121,  244,
			  121,  122,  122,  243,  122,  119,  123,  123,  199,  123,
			  121,  169,  112,  242,  122,  247,  119,  247,  247,  123,
			  231,  121,  169,  114,  198,  122,  124,  124,  198,  124,
			  123,  125,  125,  240,  125,  202,  199,  123,  122,  124,
			  126,  126,  121,  126,  125,  127,  127,  235,  127,  196,
			  124,  429,  198,  126,  429,  125,  198,  226,  127,  124,
			  304,  163,  305,  202,  126,  123,  122,  201,  196,  127,
			  121,  220,  213,  217,  125,  127,  128,  128,  207,  128,
			  163,  127,  129,  129,  126,  129,  201,  124,  304,  128,

			  305,  131,  131,  163,  131,  129,  196,  182,  130,  130,
			  128,  130,  125,  127,  131,  178,  129,  312,  163,  127,
			  217,  130,  126,  128,  201,  131,  132,  132,  309,  132,
			  130,  163,  130,  133,  133,  129,  133,  595,  157,  132,
			  134,  134,  131,  134,  314,  312,  133,  309,  172,  217,
			  132,  128,  155,  134,  316,  219,  132,  133,  152,  132,
			  213,  213,  213,  129,  134,  135,  135,  172,  135,  150,
			  131,  107,  314,  136,  136,  309,  136,  106,  135,  172,
			  137,  137,  316,  137,  132,  134,  136,  132,  133,  135,
			  595,  517,  219,  137,  517,  172,  105,  136,  187,  139, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  139,  102,  139,  136,  137,  140,  140,  172,  140,  164,
			  135,  137,  139,  134,  100,  185,   98,  187,  140,  144,
			  144,  219,  144,  139,  142,  142,   90,  142,  164,  140,
			  187,  136,  144,  164,  185,   87,  140,  142,  135,  137,
			  138,  138,  138,  144,  139,  187,  176,  676,  142,  165,
			  140,  144,  140,  193,  144,  142,  164,  185,  187,  138,
			  317,  164,  185,  138,  140,  176,  138,  165,  165,  142,
			  176,  193,  193,  138,  778,  138,  676,  138,   75,  144,
			   72,  140,  144,  142,   56,   36,  311,  138,  317,  145,
			  145,  138,  145,  176,  138,  165,  165,   35,  176,  193,

			  193,  318,  145,  778,  138,  311,  138,  141,  141,  224,
			  141,  143,  224,  145,  143,  143,  143,  143,  143,  143,
			  141,  224,  177,  141,  141,  141,  141,  141,  141,  318,
			   33,  141,  224,  311,   28,  145,  147,  147,   26,  147,
			   18,  177,  141,  143,  272,  141,  322,  143,   17,  147,
			  327,  141,  177,  146,  146,  272,  146,   16,  148,  148,
			  147,  148,  224,  145,   13,  272,  146,  183,  147,  177,
			  141,  148,  167,  141,  322,    0,  143,  146,  327,  141,
			  177,    0,  148,  272,  149,  149,  183,  149,  328,  146,
			    0,  167,  167,  146,    0,  183,  147,  149,  782,  162,

			  162,  148,  162,  162,  162,  162,  162,  162,  149,  173,
			  329,  189,  214,    0,  183,  212,  328,  146,  162,  167,
			  167,  146,  184,  183,  215,    0,  173,  782,  173,  148,
			  189,  192,  173,  149,  200,  808,  203,  330,  329,  184,
			  197,  184,  184,  189,  246,  246,  162,  246,  192,  334,
			  192,  338,  216,  200,  173,  203,  173,  200,  189,  197,
			  173,  200,  149,  156,  808,  330,  203,  184,  246,  184,
			  184,  189,  156,  197,    0,    0,  192,  334,  192,  338,
			    0,  200,  156,  203,    0,  200,    0,  197,    0,  200,
			  214,  214,  214,  359,  203,    0,  212,  212,  212,  212,

			  212,  197,  215,  215,  215,    0,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  205,
			  216,  216,  216,  227,  236,  236,  227,  236,  241,  241,
			  241,  241,  241,  241,  241,  227,  339,  342,  205,  251,
			  251,  251,  251,  251,  251,    0,  227,    0,    0,  343,
			  236,  250,    0,  250,    0,  205,  250,  250,  250,  250,
			  250,  250,  359,  359,  339,  342,  205,  252,  252,  252,
			  252,  252,  252,  255,    0,  255,  227,  343,  255,  255,
			  255,  255,  255,  255,  205,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  232,  232,    0,
			  232,  257,  257,  257,  257,  257,  258,  258,  258,  258,

			  258,  258,  281,  281,  281,  281,  281,  281,  367,  367,
			    0,  367,    0,  232,    0,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  249,  249,
			  249,  249,  249,  249,  254,  254,  254,  254,  254,  254,
			    0,  315,  346,    0,  249,  368,  368,  256,  368,  256,
			  254,  256,  256,  256,  256,  256,  256,    0,  232,  315,
			  315,  262,  262,  319,  262,    0,  347,  249,  263,  263,
			  346,  263,  249,  254,  262,    0,  264,  264,  254,  264,
			    0,  263,  319,  265,  265,  262,  265,  315,  315,  264,

			  256,    0,  263,  262,  347,    0,  265,  337,  266,  266,
			  264,  266,  267,  267,    0,  267,    0,  265,  263,    0,
			  319,  266,  783,  783,  783,  267,  337,  268,  268,  325,
			  268,  262,  266,  265,  269,  269,  267,  269,    0,  266,
			  268,    0,  270,  270,  267,  270,  263,  269,  325,  271,
			  271,  268,  271,    0,  337,  270,  273,  273,  269,  273,
			  341,  265,  271,  356,  268,    0,  270,  266,    0,  273,
			  358,  325,  267,  271,  274,  274,  325,  274,  269,  341,
			  273,  275,  275,    0,  275,  431,  270,  274,  276,  276,
			  435,  276,  268,  273,  275,    0,  277,  277,  274,  277,

			  345,  276,    0,    0,  271,  275,  269,  341,  437,  277,
			  353,  274,  276,  431,  270,    0,    0,  275,  435,  345,
			  277,  273,  278,  278,  276,  278,  277,  279,  279,  353,
			  279,  280,  280,    0,  280,  278,  437,    0,    0,  274,
			  279,  356,  356,  356,  280,  275,  278,  345,  358,  358,
			  358,  279,  276,  440,  277,  280,    0,  353,  282,  282,
			  360,  282,  441,  280,  283,  283,  283,  283,  283,  283,
			    0,  282,    0,  279,  282,  282,  282,  282,  282,  282,
			    0,  440,  282,  284,  284,  284,  284,  284,  284,    0,
			  441,  280,    0,  283,  285,  285,  285,  285,  285,  285,

			  288,  279,  288,  282,  286,  286,  286,  286,  286,  286,
			  287,  287,  287,  287,  287,  287,  289,  289,  289,  289,
			  289,  289,  445,  288,  290,  290,  288,  290,  291,  291,
			  442,  291,  288,  292,  292,  289,  292,  290,  360,  360,
			  360,  291,  293,  293,    0,  293,  292,    0,  290,  442,
			  445,  288,  291,    0,  288,  293,  320,  292,  294,  294,
			  288,  294,    0,  289,  293,  331,  293,    0,  290,    0,
			    0,  294,  292,  295,  295,  320,  295,  442,  296,  296,
			  320,  296,  294,    0,  331,  446,  295,    0,    0,  331,
			  294,  296,  297,  297,    0,  297,  290,  295,  298,  298,

			  292,  298,  296,  320,    0,  297,  299,  299,  320,  299,
			  448,  298,  331,  446,    0,  295,  297,  331,  294,  299,
			  321,  296,  298,  310,    0,  313,    0,  361,    0,  307,
			  299,  307,  307,  307,  307,  307,  307,    0,  448,  321,
			  449,    0,  310,  295,  313,  324,  333,  297,    0,  296,
			  310,  321,  313,    0,  308,  299,  308,  308,  308,  308,
			  308,  308,  326,  332,  324,  333,    0,  321,  449,  333,
			  310,  335,  313,  362,  326,  340,  324,  344,  310,  321,
			  313,  350,  332,  349,  299,  326,  450,  332,  335,    0,
			  335,  451,  324,  333,  340,  326,  344,  333,  355,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  350,  351,  349,  344,  324,  361,  361,  361,  340,  455,
			  332,  350,  349,  326,  450,  332,  335,  355,  335,  451,
			  351,    0,  340,    0,  344,    0,  365,  365,  350,  365,
			  349,  344,  370,  370,  355,  370,  340,  455,  365,  350,
			  349,    0,    0,  351,    0,  355,    0,    0,  351,  365,
			  457,  362,  362,  362,    0,    0,  518,    0,  370,  518,
			    0,    0,    0,  355,  373,  373,  373,  373,  373,  373,
			  373,  379,  379,  379,  379,  379,  379,    0,  457,  365,
			  380,  380,  380,  380,  380,  380,  458,  379,  381,  381,
			  381,  381,  381,  381,  382,  382,  382,  382,  382,  382,

			  383,  383,  383,  383,  383,  383,  438,  447,    0,  518,
			  379,    0,  463,    0,  458,  379,  384,  384,  384,  384,
			  384,  384,    0,  465,  466,  438,  447,  381,  385,  438,
			  385,  463,  384,  385,  385,  385,  385,  385,  385,  386,
			  386,  386,  386,  386,  386,  387,  387,  387,  387,  387,
			  387,  465,  466,  438,  447,  384,    0,  438,    0,  463,
			  384,  388,  388,  388,  388,  388,  388,  389,  389,    0,
			  389,  389,  389,  389,  389,  389,  390,  390,  390,  390,
			  390,  390,  391,  391,  391,  391,  391,  391,  394,  394,
			    0,  394,  395,  395,  524,  395,  526,  403,  528,  519,

			  388,  394,  519,    0,    0,  395,  396,  396,  403,  396,
			  397,  397,  394,  397,  398,  398,  395,  398,  403,  396,
			    0,    0,  524,  397,  526,    0,  528,  398,    0,  533,
			  396,  394,  399,  399,  397,  399,  403,    0,  398,  395,
			  400,  400,    0,  400,    0,  399,  397,  401,  401,  396,
			  401,    0,  519,  400,    0,  423,  399,  533,    0,  394,
			  401,  464,  402,  402,  400,  402,  423,  535,  395,  404,
			  404,  401,  404,    0,  397,  402,  423,  396,  399,  401,
			  464,    0,  404,  443,    0,  400,  402,    0,  405,  405,
			  402,  405,  433,  404,  423,  535,  406,  406,    0,  406,

			    0,  405,  443,    0,  536,  404,  399,  401,  464,  406,
			    0,  433,  405,  400,  407,  407,  443,  407,  402,    0,
			  406,  471,  433,  408,  408,    0,  408,  407,  409,  409,
			  443,  409,  536,  404,  405,  406,  408,  522,  407,  433,
			  471,  409,  410,  410,  443,  410,    0,  408,    0,    0,
			  433,  413,  409,  407,  413,  410,  522,  412,  408,  412,
			  413,    0,  405,  406,  537,    0,  410,  775,  471,    0,
			    0,  409,  411,  411,  411,  411,  411,  411,  775,  413,
			  412,  407,  413,  412,  522,  410,  408,    0,  413,  414,
			  412,  414,  537,  414,  414,  414,  414,  414,  414,  409,

			  411,  415,  415,  415,  415,  415,  415,    0,  412,  775,
			    0,  412,    0,  410,  525,  414,  416,  416,  416,  416,
			  416,  416,  414,  415,  698,  698,  698,  698,  411,    0,
			  542,  416,    0,  525,  415,  417,  417,  417,  417,  417,
			  417,  454,    0,  414,    0,  416,  567,  567,  567,  567,
			  567,  415,  418,  418,  418,  418,  418,  418,  542,  416,
			  454,  525,    0,  415,  444,    0,    0,  454,  417,  419,
			  419,  419,  419,  419,  419,  420,  420,  420,  420,  420,
			  420,  421,  421,  444,  421,    0,  422,  422,  454,  422,
			  424,  424,    0,  424,  421,  454,  444,  417,  419,  422,

			    0,    0,    0,  424,  420,  421,  425,  425,    0,  425,
			  422,  444,  426,  426,  424,  426,  436,    0,  456,  425,
			  427,  427,  434,  427,  444,  426,  428,  428,  452,  428,
			  425,    0,  544,  427,  453,  436,  426,  456,  467,  428,
			  456,  434,  459,  426,  427,  468,  436,  452,  427,  467,
			  428,  452,  425,  453,  460,    0,  434,    0,    0,  427,
			  544,  459,    0,  436,  468,  456,  467,  453,  456,  434,
			  529,  426,  459,  460,  436,  452,  427,  467,  468,  452,
			  425,  453,  529,  523,  460,  434,  469,  427,  486,  459,
			  486,    0,  468,    0,    0,  453,    0,    0,  529,  486,

			  459,  460,  523,  545,  469,  469,  468,  534,    0,  539,
			  529,    0,  460,  472,  472,  472,  472,  472,  472,  473,
			  473,  473,  473,  473,  473,  523,  534,  486,  539,  472,
			  523,  545,  469,  469,  474,  474,  474,  474,  474,  474,
			  475,  475,  475,  475,  475,  475,  477,  477,  477,  477,
			  477,  477,    0,  548,  534,  549,  539,  472,  473,  550,
			  551,  557,  477,  478,  478,  478,  478,  478,  478,  479,
			  479,  479,  479,  479,  479,  480,  480,  480,  480,  480,
			  480,  548,    0,  549,  557,  477,    0,  550,  551,  557,
			  477,  481,  481,  481,  481,  481,  481,  482,  482,  482,

			  482,  482,  482,  489,  489,    0,  489,    0,  479,  484,
			  484,  484,  484,  484,  484,  485,  489,  485,  485,  485,
			  485,  485,  485,  490,  490,  484,  490,  489,  491,  491,
			  481,  491,  492,  492,    0,  492,  490,  493,  493,    0,
			  493,  491,  598,  511,  601,  492,    0,  490,    0,    0,
			  493,    0,  491,  484,  511,  543,  492,    0,  547,    0,
			  491,  493,  494,  494,  511,  494,  495,  495,  493,  495,
			  598,  492,  601,    0,  543,  494,  531,  547,  490,  495,
			  496,  496,  511,  496,  498,  498,  494,  498,  491,    0,
			  495,    0,  527,  496,  494,  531,  493,  498,  516,  492,

			  499,  499,  543,  499,  496,  547,  494,  531,  498,  516,
			    0,  527,  603,  499,    0,    0,  498,  496,  527,  516,
			    0,    0,  494,  531,  499,  500,  500,  604,  500,  501,
			  501,  499,  501,    0,  494,  531,    0,  516,  500,  527,
			  603,  609,  501,  552,  498,  496,  527,  502,  502,  500,
			  502,  503,  503,  501,  503,  604,    0,    0,    0,  499,
			  502,  500,  552,    0,  503,    0,    0,  504,  504,  609,
			  504,  502,    0,    0,  530,  503,  553,    0,  546,  502,
			  504,  506,  506,  506,  506,  506,  506,    0,    0,  500,
			  552,  504,  530,  530,  503,  553,    0,  546,    0,  504,

			  507,  507,  507,  507,  507,  507,    0,  502,  546,    0,
			  506,  508,  508,  508,  508,  508,  508,    0,  610,    0,
			  530,  530,  503,  553,  509,  546,  509,  504,  509,  509,
			  509,  509,  509,  509,  512,  512,  546,  512,    0,  508,
			  510,  510,  510,  510,  510,  510,  610,  512,  513,  513,
			  509,  513,  514,  514,    0,  514,  509,  509,  512,    0,
			  541,  513,  510,  540,    0,  514,  512,  508,  578,  600,
			    0,    0,  513,  606,  515,  515,  514,  515,  509,  541,
			  513,  540,  540,  541,  509,  578,    0,  515,  600,  578,
			  510,    0,  606,  608,  512,  514,    0,    0,  515,  555, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  555,  555,  555,  555,  555,    0,    0,  541,  513,  540,
			  540,  541,  608,  578,  515,    0,  600,    0,    0,  554,
			  606,  554,    0,  514,  554,  554,  554,  554,  554,  554,
			  556,  556,  556,  556,  556,  556,    0,    0,  555,  614,
			  608,    0,  515,  558,  558,  558,  558,  558,  558,  559,
			  559,  559,  559,  559,  559,    0,  611,  612,  614,  558,
			  560,  560,  560,  560,  560,  560,  561,  561,  561,  561,
			  561,  561,  562,  562,  562,  562,  562,  562,  563,  563,
			  563,  563,  563,  563,  611,  612,  614,  558,  559,  564,
			  564,  564,  564,  564,  564,  565,    0,  565,  616,    0,

			  565,  565,  565,  565,  565,  565,    0,    0,  618,    0,
			    0,  562,  566,  566,  566,  566,  566,  566,  569,  569,
			  569,  569,  569,  569,  571,  571,  616,  571,    0,  572,
			  572,    0,  572,    0,  569,  602,  618,  571,  592,    0,
			  593,  619,  572,  573,  573,    0,  573,    0,  571,  592,
			  602,  593,  571,  572,  602,  623,  573,  574,  574,  592,
			  574,  593,  569,  575,  575,    0,  575,  573,    0,  619,
			  574,  573,  576,  576,    0,  576,  575,  592,  602,  593,
			  571,  574,  602,  623,    0,  576,  620,  575,  624,  574,
			  577,  577,  625,  577,  579,  579,  576,  579,  666,  573,

			    0,    0,  575,  577,    0,  620,    0,  579,  580,  580,
			    0,  580,  581,  581,  577,  581,  624,  574,  579,    0,
			  625,  580,  635,  607,    0,  581,  666,  577,  582,  582,
			  575,  582,  580,  620,  584,  584,  581,  584,  579,    0,
			  580,  582,  607,  583,  583,  635,  583,  584,    0,  607,
			  635,    0,  582,    0,    0,  577,  583,  581,  584,    0,
			  588,  588,    0,  588,    0,  584,  579,  583,  580,    0,
			  607,  613,  582,  588,  585,  583,  585,  607,  585,  585,
			  585,  585,  585,  585,  588,  581,  589,  589,    0,  589,
			  613,  590,  590,  584,  590,  591,  591,  617,  591,  589,

			  582,  594,  613,  583,  590,  615,  626,  585,  591,    0,
			  589,    0,  594,  621,  667,  590,  617,  627,  613,  591,
			  670,  590,  594,    0,  615,  626,  591,  671,  617,  589,
			  613,  621,  621,  682,    0,  686,  627,  615,  648,  648,
			  594,  648,  667,    0,  617,  687,  671,  627,  670,  590,
			    0,  648,  615,  626,  591,    0,  617,  589,    0,  621,
			  621,  682,  648,  686,  627,  615,  628,  628,  628,  628,
			  628,  628,  688,  687,  671,  627,  629,  629,  629,  629,
			  629,  629,  630,  630,  630,  630,  630,  630,  631,    0,
			  631,    0,    0,  631,  631,  631,  631,  631,  631,  632,

			  688,  632,    0,    0,  632,  632,  632,  632,  632,  632,
			  633,  633,  633,  633,  633,  633,  634,  634,  634,  634,
			  634,  634,  636,  636,  636,  636,  636,  636,  637,  637,
			  637,  637,  637,  637,  639,  639,  639,  639,  639,  639,
			  640,  640,  640,  640,  640,  640,    0,    0,    0,  633,
			  641,  641,  641,  641,  641,  641,  643,  643,  643,  643,
			  643,  643,    0,    0,  719,  651,  646,  646,  644,  646,
			  644,  720,  643,  644,  644,  644,  644,  644,  644,  646,
			  647,  647,  651,  647,  649,  649,  651,  649,  650,  650,
			  646,  650,  719,  647,  677,  643,  722,  649,    0,  720,

			  643,  650,  652,  652,  647,  652,    0,    0,  649,  646,
			  651,    0,  650,  677,  649,  652,    0,  647,  658,  653,
			  653,  726,  653,    0,  722,  678,  652,  654,  654,    0,
			  654,    0,  653,  655,  655,  658,  655,  646,    0,  658,
			  654,  677,  649,  653,  678,  647,  655,  656,  656,  726,
			  656,  654,    0,  657,  657,  728,  657,  655,    0,  679,
			  656,  659,  659,  658,  659,  668,  657,  660,  660,    0,
			  660,  656,  678,    0,  659,  672,  654,  657,  679,  681,
			  660,  729,  684,  728,  668,  659,  656,  661,  661,  668,
			  661,  660,  672,  659,  672,  679,  685,  689,  681,  723,

			  661,  684,  660,  754,  755,  654,  679,  759,  684,  729,
			    0,  661,  668,    0,  656,  685,  689,  668,  723,  661,
			  672,  659,  672,    0,  679,    0,  681,    0,    0,  684,
			  660,  754,  755,    0,    0,  759,  684,  691,  691,  691,
			  691,  691,  691,  685,  689,  762,  723,  661,  692,  692,
			  692,  692,  692,  692,  693,  693,  693,  693,  693,  693,
			  694,  694,  694,  694,  694,  694,  695,  695,  695,  695,
			  695,  695,  696,  762,  696,    0,    0,  696,  696,  696,
			  696,  696,  696,  700,  700,  700,  700,  692,  699,  699,
			  699,  699,  699,  699,  701,  701,  701,  701,  701,  701,

			  702,  702,  702,  702,  702,  702,  705,  705,    0,  705,
			  701,  703,  703,  703,  703,  703,  703,  777,    0,  705,
			  725,    0,  700,  780,  706,  706,    0,  706,    0,    0,
			  705,  707,  707,  701,  707,    0,  705,  706,  701,  725,
			  711,    0,    0,    0,  707,  777,  709,  709,  706,  709,
			  703,  780,    0,  710,  710,  707,  710,  711,  715,  709,
			  706,  711,  715,  707,  705,    0,  710,  725,  712,  712,
			  709,  712,    0,  713,  713,    0,  713,  710,    0,  715,
			  716,  712,  793,  710,  716,  711,  713,  798,  706,  731,
			  715,  707,  712,  714,  714,  721,  714,  713,  717,  712,

			  718,  716,  717,  727,  718,  713,  714,  731,  731,  809,
			  793,  710,  716,  818,  721,  798,  828,  714,  721,  717,
			  727,  718,  727,    0,    0,  745,  745,  712,  745,    0,
			  717,    0,  718,  713,    0,  731,  731,  809,  745,    0,
			    0,  818,  721,    0,  828,    0,  721,    0,  727,  745,
			  727,  732,  732,  732,  732,  732,  732,  734,  734,  734,
			  734,  734,  734,  735,  735,  735,  735,  735,  735,  736,
			  736,  736,  736,  736,  736,  737,  737,  737,  737,  737,
			  737,  738,  738,  738,  738,  738,  738,    0,    0,    0,
			  732,  739,  739,  739,  739,  739,  739,  743,  743,    0,

			  743,    0,  735,  741,  741,  741,  741,  741,  741,    0,
			  743,  744,  744,  750,  744,  746,  746,  750,  746,    0,
			    0,  743,    0,  751,  744,  752,    0,  751,  746,  752,
			  748,  748,  743,  748,  750,  744,    0,  749,  749,  746,
			  749,    0,  741,  748,  751,  750,  752,  746,  753,  756,
			  749,  758,  753,  760,  748,  751,  744,  752,  763,    0,
			  743,  749,  764,  764,  764,  764,  764,  764,  756,  753,
			  758,    0,  760,    0,    0,  746,    0,  763,    0,    0,
			  753,  756,  749,    0,  744,  766,  766,  766,  766,  766,
			  766,    0,    0,    0,  769,  769,  756,  769,  758,    0, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  760,  764,  779,    0,    0,  763,  767,  769,  767,  756,
			  749,  767,  767,  767,  767,  767,  767,    0,  769,  770,
			  770,  779,  770,  795,    0,  781,  769,  771,  771,    0,
			  771,    0,  770,  772,  772,    0,  772,    0,  779,    0,
			  771,    0,  795,  770,  781,  767,  772,    0,    0,  779,
			    0,  771,  787,  787,  769,  787,  781,  772,  784,  784,
			  784,  784,  784,  784,    0,  787,    0,  779,  770,  826,
			  795,  771,  781,    0,  786,  786,  787,  786,  788,  788,
			  826,  788,  772,    0,  781,  797,  790,  786,  791,    0,
			  826,  788,  789,  789,  790,  789,  791,  770,  786,  771,

			  792,    0,  788,    0,  797,  789,    0,  790,  826,  791,
			    0,  772,    0,  792,    0,    0,  789,    0,    0,  786,
			    0,  792,  790,    0,  791,  799,  799,  799,  799,  799,
			  799,    0,  797,  789,  792,  800,  800,  800,  800,  800,
			  800,  803,  803,  805,  803,  804,  804,  786,  804,  792,
			  807,  805,  806,    0,  803,  810,    0,  810,  804,    0,
			  806,  789,    0,  807,  805,  803,  810,  813,  813,  804,
			  813,  807,    0,  806,    0,    0,  827,  804,    0,  805,
			  813,    0,  814,  814,  807,  814,    0,  827,  806,    0,
			  803,  813,    0,    0,  810,  814,  832,  827,    0,  807,

			  812,  812,  812,  812,  812,  804,  814,  832,  813,  820,
			  820,  820,  820,  820,  820,  827,    0,  832,    0,  803,
			  821,  821,  821,  821,  821,  824,  824,  824,  824,  824,
			  824,  825,  825,    0,  825,  832,  813,  829,  829,  829,
			  829,  829,  829,    0,  825,  830,  830,  830,  830,  830,
			  830,  831,  831,    0,  831,  825,  833,  835,  835,  835,
			  835,  835,  835,  825,  831,    0,    0,  833,  836,    0,
			  836,    0,    0,    0,    0,  831,    0,  833,    0,  836,
			  839,  839,  839,  839,  839,  839,  841,  841,  841,  841,
			  841,  825,  843,  844,    0,  833,  840,  840,  840,  840,

			  840,  840,    0,    0,    0,    0,    0,  836,    0,  843,
			  844,  847,  848,  843,  844,  845,  845,  845,  845,  845,
			  845,  846,  846,  846,  846,  846,  846,    0,  847,  848,
			    0,    0,  847,  848,    0,    0,    0,  843,  844,  849,
			  849,  849,  849,  849,  849,  850,  850,  850,  850,  853,
			  853,  853,  853,  853,  853,    0,  847,  848,  854,  854,
			  854,  854,  854,  854,  855,  855,  855,  855,  855,  855,
			  857,  857,  857,  857,  857,  857,    0,    0,    0,    0,
			  858,    0,  858,    0,  850,  858,  858,  858,  858,  858,
			  858,  859,  859,  859,  859,  859,  859,  860,  860,  860,

			  860,  860,  860,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  858,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  863,  863,  863,  863,  863,  863,  863,  863,
			  863,  863,  863,  863,  863,  863,  863,  863,  863,  863,
			  863,  863,  863,  863,  863,  863,  863,  863,  863,  863,

			  863,  863,  863,  863,  863,  863,  863,  863,  863,  863,
			  863,  863,  863,  863,  863,  863,  863,  863,  863,  863,
			  863,  863,  863,  863,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,

			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  866,  866,
			    0,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,    0,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  867,  867,    0,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,

			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  867,  868,  868,  868,  868,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,  869,  869,  869,    0,    0,
			    0,    0,    0,    0,    0,  869,  869,    0,  869,    0,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,    0,    0,  869,  869,  869,  869,  869,

			  869,  869,  869,  869,  870,  870,    0,  870,  870,    0,
			  870,  870,    0,    0,    0,  870,  870,  870,  870,  870,
			  870,  870,  870,  870,  870,  870,  870,  870,  870,  870,
			  870,  870,  870,  870,  870,  870,  870,  870,    0,    0,
			  870,  870,  870,  870,  870,  870,  870,  870,  870,  871,
			  871,    0,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,  871,

			  871,  872,  872,    0,  872,  872,  872,  872,  872,  872,
			  872,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			  872,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			  872,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			    0,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			  872,  872,  872,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  873, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  873,  873,  873,  873,  873,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,    0,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  875,    0,  875,
			    0,    0,    0,    0,  875,  875,    0,  875,  875,    0,
			    0,    0,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,    0,  875,  875,  875,  875,

			  875,  875,  875,  875,  875,  875,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,

			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  878,  878,    0,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  879,    0,    0,    0,    0,  879,  879,    0,
			    0,    0,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,    0,    0,  879,  879,  879,

			  879,  879,  879,  879,  879,  879,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,    0,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,

			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  882,    0,    0,    0,  882,  882,    0,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,    0,    0,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  883,  883,    0,  883,  883,    0,  883,
			  883,  883,    0,    0,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,    0,    0,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  884,  884,

			  884,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  884,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,    0,    0,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,

			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  887,  887,    0,    0,    0,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,    0,    0,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  888,    0,  888,    0,    0,    0,    0,
			  888,  888,    0,  888,  888,    0,    0,    0,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,

			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,    0,    0,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  889,  889,  889,    0,    0,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,    0,    0,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,    0,    0,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  890,    0,  890,    0,    0,    0,    0,  890,
			  890,    0,  890,  890,    0,    0,    0,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			    0,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			    0,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,    0,    0,  892,  892,

			  892,  892,  892,  892,  892,  892,  892,  893,  893,    0,
			    0,    0,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,    0,    0,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,    0,
			    0,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  895,  895,    0,    0,    0,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  895,  895,  895,  895,  895,  895,  895,  895,    0,    0,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,    0,    0,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  897,  897,    0,    0,    0,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,    0,    0,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  861,  861,  861,  861,  861,  861,  861,  861,

			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861, yy_Dummy>>,
			1, 185, 6000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   78,    0,    0,  187,
			    0,   68,   71, 1164, 6092,   99, 1154, 1121, 1133, 6092,
			   91,    0, 6092, 6092, 6092, 6092, 1123,   89, 1117,   99,
			  119, 6092, 6092, 1103, 6092, 1070, 1056,  278,  282,  288,
			  121,  298,  324,  294,  330,  304,  337,  355,  427,  386,
			  370,  400,  417,  398, 6092, 6092, 1028,  506,  585,   95,
			   72,  402,  424,   93,  632,  291,  281,  439,  634,  635,
			  423,  344, 1063, 6092, 6092, 1071,  160, 6092,  109,  282,
			  287,  298,  331,  348,  373, 6092,  408,  981, 6092,  435,
			 1023,  586,  478, 6092,   86,  708, 6092,  166, 1013, 6092,

			 1007, 6092,  992,    0,  707,  985,  974,  955,  744, 6092,
			  499,  669,  765,  699,  776, 6092, 6092, 6092,  672,  800,
			    0,  805,  809,  814,  834,  839,  848,  853,  884,  890,
			  906,  899,  924,  931,  938,  963,  971,  978, 1026,  997,
			 1003, 1105, 1022, 1096, 1017, 1087, 1151, 1134, 1156, 1182,
			  945,  713,  902, 6092,  504,  941, 1248,  921,   99,  243,
			  303,  498, 1184,  856,  994, 1034,  317, 1157,  348,  759,
			  364,  648,  933, 1194,  422,  427, 1031, 1107,  891,  578,
			  444,  499,  850, 1152, 1207, 1000,  514,  983,  563, 1196,
			  607,  651, 1216, 1038,  671,  724,  844, 1225,  796,  784,

			 1219,  862,  800, 1221,   92, 1314, 6092,  881, 6092,  592,
			 6092, 6092, 1208,  875, 1205, 1217, 1245,  866, 6092,  938,
			  827, 6092,  119,  680, 1107, 6092,  864, 1331,  290, 1394,
			  768,  747, 1485, 6092, 6092,  829, 1332, 6092, 6092, 6092,
			  834, 1321,  814,  804,  800,  768, 1242,  823, 6092, 1520,
			 1348, 1331, 1359, 6092, 1526, 1370, 1543, 1473, 1478, 6092,
			    0,  743, 1569, 1576, 1584, 1591, 1606, 1610, 1625, 1632,
			 1640, 1647, 1115, 1654, 1672, 1679, 1686, 1694, 1720, 1725,
			 1729, 1484, 1756, 1746, 1765, 1776, 1786, 1792, 1786, 1798,
			 1822, 1826, 1831, 1840, 1856, 1871, 1876, 1890, 1896, 1904,

			  745, 6092, 6092,  715,  836,  830,    0, 1913, 1938,  913,
			 1908, 1071,  875, 1910,  911, 1536,  920, 1021, 1055, 1558,
			 1841, 1905, 1100,  658, 1930, 1614, 1945, 1111, 1149, 1172,
			 1199, 1850, 1948, 1931, 1217, 1956,    0, 1592, 1203, 1312,
			 1960, 1645, 1306, 1325, 1962, 1685, 1508, 1531,  645, 1968,
			 1966, 1986,    0, 1695,   97, 1983, 1656,  305, 1663, 1286,
			 1753, 1920, 1966, 6092,  692, 2024, 6092, 1506, 1553,  680,
			 2030, 6092, 6092, 2047, 6092, 6092, 6092, 6092, 6092, 2053,
			 2062, 2070, 2076, 2082, 2098, 2115, 2121, 2127, 2143, 2152,
			 2158, 2164,    0,  642, 2186, 2190, 2204, 2208, 2212, 2230,

			 2238, 2245, 2260, 2168, 2267, 2286, 2294, 2312, 2321, 2326,
			 2340, 2354, 2343, 2314, 2375, 2383, 2398, 2417, 2434, 2451,
			 2457, 2479, 2484, 2226, 2488, 2504, 2510, 2518, 2524,  859,
			    0, 1640,  426, 2277, 2507, 1645, 2501, 1670, 2091,    0,
			 1705, 1715, 1815, 2268, 2449, 1788, 1855, 2092, 1872, 1892,
			 1945, 1950, 2513, 2519, 2426, 1972, 2503, 2005, 2041, 2527,
			 2539,    0,    0, 2097, 2246, 2075, 2091, 2508, 2530, 2571,
			  577, 2306, 2595, 2601, 2616, 2622,  521, 2628, 2645, 2651,
			 2657, 2673, 2679,  148, 2691, 2699, 2575,  677,  508, 2701,
			 2721, 2726, 2730, 2735, 2760, 2764, 2778,  474, 2782, 2798,

			 2823, 2827, 2845, 2849, 2865, 6092, 2863, 2882, 2893, 2910,
			 2922, 2714, 2932, 2946, 2950, 2972, 2769,  989, 2054, 2197,
			    0,  439, 2322, 2568, 2160, 2399, 2155, 2777, 2165, 2536,
			 2859, 2761,    0, 2190, 2592, 2233, 2271, 2326,    0, 2594,
			 2948, 2945, 2396, 2740, 2487, 2569, 2863, 2743, 2619, 2621,
			 2614, 2618, 2828, 2861, 3006, 2981, 3012, 2627, 3025, 3031,
			 3042, 3048, 3054, 3060, 3071, 3082, 3094, 2428, 6092, 3100,
			    0, 3122, 3127, 3141, 3155, 3161, 3170, 3188, 2939, 3192,
			 3206, 3210, 3226, 3241, 3232, 3260, 6092,  455, 3258, 3284,
			 3289, 3293, 3109, 3111, 3272,  935, 6092, 6092, 2712,    0,

			 2954, 2714, 3120, 2778, 2786,    0, 2958, 3208, 2978, 2802,
			 2872, 3022, 3010, 3256, 3024, 3290, 3052, 3282, 3074, 3108,
			 3171, 3298,    0, 3110, 3156, 3159, 3291, 3302, 3348, 3358,
			 3364, 3375, 3386, 3392, 3398, 3188, 3404, 3410,  462, 3416,
			 3422, 3432, 6092, 3438, 3455,    0, 3464, 3478, 3336, 3482,
			 3486, 3436, 3500, 3517, 3525, 3531, 3545, 3551, 3489, 3559,
			 3565, 3585,  448,  386,  382,  371, 3153, 3275, 3550,    0,
			 3288, 3312, 3560,    0,    0,    0,  996, 3479, 3510, 3544,
			    0, 3564, 3292,    0, 3567, 3581, 3301, 3308, 3338, 3582,
			  304, 3619, 3630, 3636, 3642, 3648, 3659,  265, 2406, 3670,

			 3670, 3676, 3682, 3693,  295, 3704, 3722, 3729, 6092, 3744,
			 3751, 3711, 3766, 3771, 3791, 3729, 3751, 3769, 3771, 3432,
			 3433, 3780, 3462, 3584,    0, 3705, 3489, 3788, 3522, 3547,
			    0, 3774, 3833,  245, 3839, 3845, 3851, 3857, 3863, 3873,
			 6092, 3885,    0, 3895, 3909, 3823, 3913, 6092, 3928, 3935,
			 3884, 3894, 3896, 3919, 3566, 3557, 3934,    0, 3936, 3573,
			 3938,    0, 3598, 3943, 3944,  251, 3967, 3993,    0, 3992,
			 4017, 4025, 4031,  281, 6092, 2362,  272, 3683, 1023, 3987,
			 3677, 4010, 1147, 1604, 4040,  583, 4072, 4050, 4076, 4090,
			 4057, 4059, 4084, 3735,    0, 4008,    0, 4070, 3744, 4107,

			 4117,    0,   98, 4139, 4143, 4114, 4123, 4134, 1184, 3775,
			 4142,    0, 4181, 4165, 4180,  135,  128,  486, 3770,    0,
			 4191, 4202, 6092,  598, 4207, 4229, 4040, 4147, 3782, 4219,
			 4227, 4249, 4167, 4227,    0, 4239, 4255,  126,  104, 4262,
			 4278, 4268, 6092, 4263, 4264, 4297, 4303, 4282, 4283, 4321,
			 4332, 6092, 6092, 4331, 4340, 4346, 6092, 4352, 4367, 4373,
			 4379, 6092, 4419, 4471, 4523, 4575, 4627, 4679, 4715, 4753,
			 4798, 4848, 4900, 4952, 5004, 5055, 5105, 5157, 5209, 5255,
			 5305, 5357, 5402, 5447, 5496, 5531, 5581, 5622, 5671, 5721,
			 5770, 5820, 5856, 5895, 5929, 5968, 6002, 6041, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  861,    1,  862,  862,  863,  863,  864,  864,  861,
			    9,  865,  865,  861,  861,  861,  861,  861,  866,  861,
			  867,  868,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  870,  861,  861,  871,  861,  861,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  861,  861,  861,  872,  861,  861,  861,  872,
			  872,  872,  872,  872,  873,  861,  873,  874,  861,  875,
			  861,  875,  875,  861,  876,  877,  861,  861,  861,  861,

			  866,  861,  878,  878,  878,  879,  880,  861,  861,  861,
			  861,  881,  861,  861,  861,  861,  861,  861,  861,  869,
			  882,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,   48,  869,
			  869,  869,  869,   48,  869,  869,  869,  869,  869,  869,
			  883,  870,  871,  861,  861,  861,   58,  861,  156,  156,
			  156,   58,   58,   58,   58,   58,  156,   58,  156,   58,
			  156,  156,   58,   58,  156,  156,   58,   58,  156,   58,
			  156,  156,  156,   58,   58,   58,  156,   58,  156,   58,
			  156,  156,   58,   58,  156,  156,   58,   58,  156,  156,

			   58,   58,  156,   58,  156,   58,  861,  872,  861,  861,
			  861,  861,  872,  872,  872,  872,  872,  873,  861,  873,
			  874,  861,  874,  875,  875,  861,  861,  861,  861,  861,
			  861,  876,  877,  861,  861,  232,  884,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  885,  882,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  861,  869,  869,  869,  869,  869,  869,  869,
			  869,  861,  869,  282,  282,  282,  282,  141,  141,  141,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,

			  861,  861,  861,  861,  156,  156,  156,  861,  156,   58,
			   58,   58,  156,   58,  156,   58,  156,  156,  156,   58,
			   58,   58,  156,  156,   58,   58,  861,  156,  156,  156,
			  156,   58,   58,   58,  156,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,   58,   58,  156,  156,  156,   58,
			   58,   58,  156,   58,  156,   58,  872,  872,  872,  872,
			  872,  872,  872,  861,  886,  886,  861,  886,  886,  886,
			  884,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  887,  882,  869,  869,  869,  869,  869,  869,

			  869,  869,  869,  861,  869,  869,  869,  869,  869,  869,
			  869,  861,  282,  141,  282,  138,  282,  138,  861,  282,
			  282,  869,  869,  861,  869,  869,  869,  869,  869,  888,
			  889,  156,  156,   58,   58,  156,   58,  156,   58,  156,
			  156,  156,   58,   58,   58,  156,  156,   58,  156,  156,
			  156,  156,   58,   58,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,   58,   58,  156,  156,  156,   58,   58,
			  156,   58,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  881,  861,  861,  861,  887,  869,
			  869,  869,  869,  869,  869,  869,  869,  861,  869,  869,

			  869,  869,  869,  869,  869,  861,  282,  282,  861,  282,
			  509,  861,  869,  869,  869,  869,  885,  861,  890,  888,
			  156,  156,   58,   58,  156,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,   58,  156,  156,  156,  156,   58,
			   58,   58,  156,   58,  156,  156,   58,   58,  156,  156,
			  156,  156,   58,   58,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  891,
			  892,  869,  869,  869,  869,  869,  869,  869,  861,  869,
			  869,  869,  869,  869,  869,  282,  861,  861,  869,  869,
			  869,  869,  861,  887,  887,  890,  861,  861,  156,  156,

			   58,  156,   58,  156,  156,  156,   58,   58,   58,  156,
			  156,  156,  156,   58,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,  156,  156,   58,   58,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  893,  869,  869,  869,  869,
			  869,  861,  869,  869,  869,  869,  869,  869,  861,  869,
			  869,  869,  861,  861,  887,  887,  156,  156,   58,  156,
			  156,   58,   58,  156,  156,  156,  156,   58,   58,   58,
			  156,   58,  156,  156,   58,   58,  156,  156,  156,   58,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,

			  861,  861,  861,  861,  893,  869,  869,  869,  861,  869,
			  869,  861,  869,  869,  869,  861,  861,  892,  892,  156,
			  156,   58,  156,   58,  156,   58,  156,   58,  156,  156,
			  156,   58,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  894,  869,  869,  869,  869,  861,  869,  869,
			  861,  861,  893,  893,  156,  156,   58,  156,   58,  156,
			   58,  156,  156,   58,  861,  861,  861,  861,  895,  869,
			  869,  869,  869,  861,  861,  893,  893,  156,  156,   58,
			  156,   58,  156,  861,  861,  895,  869,  869,  869,  869,
			  861,  861,  893,  156,  156,   58,  156,   58,  156,  861,

			  861,  896,  861,  869,  869,  861,  861,  893,  156,  156,
			  861,  897,  861,  869,  869,  861,  861,  893,  156,  156,
			  861,  861,  861,  897,  861,  869,  861,  861,  156,  861,
			  861,  869,  861,  861,  156,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,    0,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    1,    8,    1,    1,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   19,
			   20,   21,   22,   22,   22,   23,   23,   23,   24,   25,
			   26,   27,   28,   29,    1,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   36,   36,   39,   40,   41,   42,
			   43,   44,   45,   46,   47,   48,   36,   49,   50,   51,
			   52,   53,   54,   55,   56,   57,    1,   58,   59,   60,

			   61,   62,   63,   64,   65,   66,   64,   64,   67,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,   80,   64,   81,   82,   83,   84,    1,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,    1,    1,   88,   88,   88,   88,   88,   88,

			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   89,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   91,   92,   92,   92,   92,   92,   92,   92,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,   10,   11,   12,   12,
			   12,   12,   12,   13,   14,    1,   15,    1,   16,    1,
			   17,   18,   19,   20,   21,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,    5,   40,   41,    5,   12,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   43,   44,   45,   46,   47,   48,   49,
			   50,    5,    5,   51,   52,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  131,  129,    1,    2,   15,  113,   18,
			  129,   16,   17,    7,    6,   13,    5,   11,    8,  104,
			  104,   14,   12,   29,   10,   30,   20,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   82,   96,
			   96,   96,   96,   22,   31,   23,    9,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   24,   21,   25,  117,  118,  119,  120,  117,
			  117,  117,  117,  117,  130,  102,  130,  130,  130,  130,
			   69,  130,  130,   71,  130,  130,   95,    1,    2,   28,

			  113,  112,  127,  127,  127,    0,    3,   33,  108,   32,
			    0,    0,  104,    0,  104,   27,   26,   19,    0,   96,
			   91,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   40,   96,   90,
			   90,   81,   90,   90,   96,   96,   96,   96,   96,   96,
			    0,    0,    0,  103,    0,    0,   99,    0,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   40,   99,   40,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,  100,  117,  119,  118,
			  115,  114,  116,  117,  117,  117,  117,    0,  102,    0,
			    0,  101,    0,    0,    0,   71,   69,    0,   68,    0,
			   67,    0,    0,   95,   93,   93,    0,   94,  127,  121,
			  127,  127,  127,  127,  127,  127,    0,    4,   34,  108,
			    0,    0,    0,  106,  108,  106,  104,    0,    0,   91,
			    0,    0,   96,   96,   39,   96,   96,   96,   96,   96,
			   96,   96,    0,   96,   96,   96,   96,   96,   42,   96,
			   96,    0,   82,   83,   82,   82,   82,   89,   96,   89,
			   89,   89,   96,   96,   96,   96,   96,   96,   41,   96,

			    0,   65,   98,    0,   99,   99,   39,   72,   72,   99,
			   99,   39,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,    0,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   42,   42,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   41,   41,   99,   99,  117,  117,  117,  117,
			  117,  117,  117,  101,    0,    0,   70,   68,   67,   71,
			    0,  125,  128,  128,  126,  122,  123,  124,   92,  108,
			    0,  108,    0,    0,  108,    0,    0,    0,  107,  104,
			    0,    0,    0,   97,   96,   96,   96,   96,   38,   96,

			   96,   96,   96,    0,   96,   96,   96,   96,   96,   96,
			   96,    0,   96,   81,   96,   96,   96,   96,    0,   81,
			   81,   81,   37,    0,   44,   96,   96,   96,   96,   66,
			   62,   99,   99,   99,   99,   99,   99,   99,   99,   38,
			   99,   99,   38,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   37,   44,   37,   44,   99,   99,   99,   99,   99,
			   99,   99,  108,  108,    0,    0,  105,  108,    0,  107,
			    0,  107,    0,    0,    0,  104,   78,    0,    0,   60,
			   96,   96,   96,   96,   96,   45,   96,    0,   96,   96,

			   96,   36,   96,   96,   96,   83,   83,   82,    0,   96,
			   96,    0,   96,   96,   96,   96,    0,   66,   66,    0,
			   60,   99,   60,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   45,   99,   45,   99,   99,   99,   36,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,    0,  108,    0,  111,  108,  107,
			    0,    0,  107,    0,    0,  106,    0,    0,   78,    0,
			    0,   96,   61,   96,   96,   96,   47,   96,    0,   96,
			   96,   96,   96,   96,   96,   96,   81,    0,   53,   96,
			   96,   96,    0,    0,    0,    0,   64,   63,   99,   61,

			   61,   99,   99,   99,   99,   47,   99,   99,   47,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   53,   99,   99,   99,   53,   99,    0,  108,
			    0,    0,    0,  107,    0,  111,  107,    0,   80,    0,
			    0,    0,  109,  111,  109,    0,   96,   96,   59,   96,
			   46,    0,   43,   58,   96,   35,   96,   51,    0,   96,
			   96,   96,    0,    0,    0,    0,   99,   99,   99,   59,
			   99,   59,   99,   46,   43,   58,   99,   43,   58,   99,
			   35,   35,   99,   51,   99,   51,   99,   99,   99,   99,
			  111,    0,  111,    0,  107,    0,    0,  110,    0,    0,

			   77,  111,    0,  110,    0,   96,   96,   96,   86,   54,
			   96,    0,   96,   96,   55,    0,    0,    0,    0,   99,
			   99,   99,   99,   99,   54,   54,   99,   99,   99,   99,
			   55,   99,  111,  110,    0,  110,    0,    0,    0,    0,
			   77,  110,    0,   96,   96,   48,   96,   85,   52,   96,
			    0,    0,    0,    0,   99,   99,   99,   48,   48,   99,
			   99,   52,   99,   52,  110,   79,    0,   77,    0,   96,
			   96,   96,   96,   84,   84,   84,   84,   99,   99,   99,
			   99,   99,   99,    0,    0,    0,   96,   50,   49,   96,
			    0,    0,    0,   99,   50,   50,   49,   49,   99,    0,

			    0,    0,    0,   96,   96,    0,    0,    0,   99,   99,
			   76,    0,    0,   96,   56,    0,    0,    0,   99,   56,
			    0,    0,   76,    0,   73,   96,    0,    0,   99,    0,
			    0,   57,    0,    0,   57,    0,   75,    0,    0,    0,
			    0,    0,   75,    0,    0,    0,    0,    0,    0,    0,
			   74,   87,   88,    0,    0,    0,   74,    0,   74,    0,
			    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 6092
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 861
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 862
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

	yyNb_rules: INTEGER is 130
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 131
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
