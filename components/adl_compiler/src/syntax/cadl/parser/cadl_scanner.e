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
	ANY_VALIDATOR
		rename
			reset as validator_reset
		end

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
if yy_act <= 67 then
if yy_act <= 34 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 84 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 84")
end
-- Ignore separators
else
--|#line 85 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 85")
end
in_lineno := in_lineno + text_count
end
else
--|#line 90 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 90")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
in_lineno := in_lineno + 1
else
--|#line 95 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 95")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Plus_code
else
--|#line 97 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 97")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 98 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 98")
end
last_token := Slash_code
else
--|#line 99 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 99")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 100 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 100")
end
last_token := Equal_code
else
--|#line 101 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 101")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 102 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 102")
end
last_token := Semicolon_code
else
--|#line 103 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 103")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 104 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 104")
end
last_token := Colon_code
else
--|#line 105 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 105")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := Left_parenthesis_code
else
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := Right_parenthesis_code
end
end
end
end
else
if yy_act <= 26 then
if yy_act <= 22 then
if yy_act <= 20 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 108 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 108")
end
last_token := Dollar_code
else
--|#line 110 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 110")
end
last_token := SYM_DT_UNKNOWN
end
else
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := Question_mark_code
end
else
if yy_act = 21 then
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_INTERVAL_DELIM
else
--|#line 115 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 115")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := Right_bracket_code
else
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_START_CBLOCK
end
else
if yy_act = 25 then
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_END_CBLOCK
else
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
end
last_token := SYM_GE
end
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 122 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 122")
end
last_token := SYM_LE
else
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_NE
end
else
if yy_act = 29 then
--|#line 125 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 125")
end
last_token := SYM_LT
else
--|#line 126 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 126")
end
last_token := SYM_GT
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 128 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 128")
end
last_token := SYM_MODULO
else
--|#line 129 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 129")
end
last_token := SYM_DIV
end
else
if yy_act = 33 then
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_ELLIPSIS
else
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_LIST_CONTINUE
end
end
end
end
end
else
if yy_act <= 51 then
if yy_act <= 43 then
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
--|#line 136 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 136")
end
last_token := SYM_MATCHES
else
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_MATCHES
end
else
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_THEN
end
else
if yy_act = 38 then
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_ELSE
else
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_AND
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_OR
else
--|#line 150 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 150")
end
last_token := SYM_XOR
end
else
if yy_act = 42 then
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_NOT
else
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
end
last_token := SYM_IMPLIES
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_TRUE
else
--|#line 158 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 158")
end
last_token := SYM_FALSE
end
else
if yy_act = 46 then
--|#line 160 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 160")
end
last_token := SYM_FORALL
else
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_EXISTS
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_EXISTENCE
else
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_OCCURRENCES
end
else
if yy_act = 50 then
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_CARDINALITY
else
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_ORDERED
end
end
end
end
else
if yy_act <= 59 then
if yy_act <= 55 then
if yy_act <= 53 then
if yy_act = 52 then
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_UNORDERED
else
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_UNIQUE
end
else
if yy_act = 54 then
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_INFINITY
else
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end
last_token := SYM_USE_NODE
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 184 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 184")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
if yy_act = 58 then
--|#line 186 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 186")
end
last_token := SYM_INCLUDE
else
--|#line 188 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 188")
end
last_token := SYM_EXCLUDE
end
end
end
else
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 190 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 190")
end
last_token := SYM_AFTER
else
--|#line 192 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 192")
end
last_token := SYM_BEFORE
end
else
if yy_act = 62 then
--|#line 194 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 194")
end
last_token := SYM_CLOSED
else
--|#line 197 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 197")
end

	last_token := V_URI
	last_string_value := text

end
end
else
if yy_act <= 65 then
if yy_act = 64 then
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 208 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 208")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 66 then
--|#line 215 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 215")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 231 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 231")
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
if yy_act <= 101 then
if yy_act <= 84 then
if yy_act <= 76 then
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
--|#line 239 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 239")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
else
--|#line 246 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 246")
end
	-- match any line, with ',' termination
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			
end
else
--|#line 253 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 253")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 71 then
--|#line 256 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 256")
end
in_lineno := in_lineno + 1
else
--|#line 258 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 258")
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
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 279 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 279")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
else
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act = 75 then
--|#line 292 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 292")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 293 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 293")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 80 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 79 then
--|#line 302 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 302")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 309 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 309")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 82 then
if yy_act = 81 then
--|#line 310 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 310")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 317 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 317")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 83 then
--|#line 318 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 318")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 325 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 325")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
end
end
end
else
if yy_act <= 93 then
if yy_act <= 89 then
if yy_act <= 87 then
if yy_act <= 86 then
if yy_act = 85 then
--|#line 337 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 337")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 347 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 347")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
--|#line 352 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 352")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 88 then
--|#line 362 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 362")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 368 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 368")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 91 then
if yy_act = 90 then
--|#line 378 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 378")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 379 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 379")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 92 then
--|#line 393 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 393")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 400 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 400")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 97 then
if yy_act <= 95 then
if yy_act = 94 then
--|#line 406 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 406")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 412 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 412")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 96 then
--|#line 416 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 416")
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
						tid := dynamic_type_from_string(dadl_parser.output.im_type_name)
						if tid >= 0 then
							c_domain_type ?= dadl_parser.output.as_object(tid, Void)
							if c_domain_type /= Void then
								last_token := V_C_DOMAIN_TYPE
							else
								dadl_parser_error := "Conversion of " + dadl_parser.output.im_type_name + " failed"
								last_token := ERR_C_DOMAIN_TYPE
							end
						else
							dadl_parser_error := "Domain type " + dadl_parser.output.im_type_name + " unknown or not visible in type system"
							last_token := ERR_C_DOMAIN_TYPE
						end
					else
						dadl_parser_error := "Domain type in dADL section not typed"
						last_token := ERR_C_DOMAIN_TYPE
					end
				else
					dadl_parser_error := dadl_parser.errors.last_added.message
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
else
--|#line 457 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 457")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
else
if yy_act <= 99 then
if yy_act = 98 then
--|#line 463 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 463")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 469 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 469")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 100 then
--|#line 475 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 475")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 482 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 482")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 118 then
if yy_act <= 110 then
if yy_act <= 106 then
if yy_act <= 104 then
if yy_act <= 103 then
if yy_act = 102 then
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
else
if yy_act = 105 then
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 507 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 507")
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
if yy_act <= 108 then
if yy_act = 107 then
--|#line 519 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 519")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 526 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 526")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 109 then
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
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
--|#line 546 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 546")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 114 then
if yy_act <= 112 then
if yy_act = 111 then
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 548 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 548")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 113 then
	yy_end := yy_end - 1
--|#line 552 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 552")
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
--|#line 553 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 553")
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
if yy_act <= 116 then
if yy_act = 115 then
--|#line 554 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 554")
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
--|#line 574 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 574")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 117 then
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 587 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 587")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 126 then
if yy_act <= 122 then
if yy_act <= 120 then
if yy_act = 119 then
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
in_buffer.append_character ('"')
else
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 121 then
--|#line 595 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 595")
end
in_buffer.append_string (text)
else
--|#line 597 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 597")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 124 then
if yy_act = 123 then
--|#line 602 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 602")
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
--|#line 613 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 613")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 125 then
--|#line 622 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 622")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 624 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 624")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 130 then
if yy_act <= 128 then
if yy_act = 127 then
--|#line 625 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 625")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 626 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 626")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 129 then
--|#line 627 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 627")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 628 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 628")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 132 then
if yy_act = 131 then
--|#line 630 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 630")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 631 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 631")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 133 then
--|#line 635 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 635")
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
when 0, 2, 3, 4 then
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
			create an_array.make (0, 6383)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   12,   13,   14,   13,   13,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   27,
			   27,   28,   28,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   38,   41,   42,   38,
			   43,   44,   45,   46,   38,   38,   38,   47,   48,   38,
			   49,   50,   38,   51,   52,   53,   54,   12,   55,   56,
			   57,   58,   59,   60,   58,   61,   62,   58,   63,   64,
			   65,   58,   58,   58,   58,   66,   67,   58,   58,   68,
			   69,   70,   71,   72,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   74,   83,   93,   83,   75,   74,   93,

			  101,   95,   75,   95,   95,  105,  874,  106,  106,  106,
			  106,  106,  106,  108,  223,  109,  236,  110,  110,  110,
			  110,  110,  110,  116,  116,  155,  116,  155,  211,  155,
			   84,   85,   84,   85,  108,  189,  109,  203,  112,  112,
			  112,  112,  112,  112,   76,  102,  310,  118,  311,   76,
			   94,  224,  225,  160,   94,  160,  111,  160,  210,  232,
			  210,  210,  232,  190,   95,  204,   95,   95,  585,  585,
			  210,  237,  210,  210,  310,  212,  311,  111,   77,   78,
			   79,   80,   81,   77,   78,   79,   80,   81,   86,   87,
			   88,   86,   87,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   89,   90,   86,   90,   90,   90,   90,   90,
			   90,   86,   86,   86,   86,   86,   86,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   86,   86,   91,   86,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			  116,  116,  362,  116,  116,  116,  234,  116,  873,  234,
			  116,  116,  155,  116,  187,  179,  209,  312,  155,  236,

			  116,  116,  153,  116,  118,  153,  116,  116,  118,  116,
			  154,  362,  209,  119,  118,  155,  122,  120,  123,  121,
			  160,  857,  188,  180,  118,  312,  160,  124,  116,  116,
			  118,  116,  205,  856,  133,  116,  116,  125,  116,  116,
			  116,  119,  116,  160,  122,  120,  123,  121,  126,  219,
			  116,  116,  118,  116,  237,  124,  127,  116,  116,  118,
			  116,  206,  133,  118,  842,  125,  116,  116,  128,  116,
			  129,  167,  831,  832,  118,  155,  214,  126,  209,  134,
			  168,  118,  226,  770,  127,  220,  221,  135,  130,  131,
			  118,  216,  216,  191,  132,  155,  128,  820,  129,  169,

			  136,  116,  116,  160,  116,  145,  192,  134,  170,  318,
			  146,  116,  116,  320,  116,  135,  130,  131,  220,  221,
			  209,  193,  132,  160,  227,  118,  155,  227,  136,  116,
			  116,  171,  116,  145,  194,  118,  143,  318,  146,  821,
			  321,  320,  172,  813,  144,  137,  137,  137,  137,  137,
			  137,  147,  209,  118,  160,  209,  581,  175,  214,  173,
			  138,  155,  116,  116,  143,  116,  305,  139,  321,  176,
			  782,  174,  144,  264,  140,  155,  141,  229,  142,  147,
			  324,  181,  182,  770,  155,  177,  118,  183,  138,  160,
			  155,  199,  155,  195,  330,  139,  200,  178,  213,  213,

			  213,  196,  306,  160,  264,  141,  498,  142,  324,  184,
			  185,  148,  160,  231,  485,  186,  231,  307,  160,  201,
			  160,  197,  330,  155,  202,  232,  233,  331,  311,  198,
			  215,  215,  215,  217,  217,  217,  234,  490,  770,  335,
			  148,  153,  231,  485,  153,  231,  857,  209,  745,  154,
			  251,  160,  251,  251,  232,  331,  316,  155,  155,  155,
			  155,  155,  155,  156,  342,  234,  229,  335,  744,  155,
			  155,  155,  155,  155,  157,  155,  155,  155,  158,  155,
			  159,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  342,  743,  590,  229,  155,  160,  160,  161,

			  160,  160,  162,  160,  160,  160,  163,  160,  164,  160,
			  160,  160,  160,  160,  161,  160,  160,  160,  160,  160,
			  153,  116,  116,  153,  116,  264,  216,  216,  154,  256,
			  256,  256,  256,  256,  256,  111,  155,  155,  155,  155,
			  155,  155,  156,  312,  155,  263,  344,  742,  155,  155,
			  155,  155,  165,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  317,  160,  346,  344,  155,  160,  160,  160,  160,
			  166,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  239,

			  239,  346,  239,  831,  832,  244,  262,  262,  262,  262,
			  262,  262,  725,  684,  245,  245,  245,  245,  245,  245,
			  534,  227,  622,  535,  227,  240,  487,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  246,  253,  253,  253,  253,  253,  253,  258,  258,  258,
			  258,  258,  258,  371,  347,  247,  350,  254,  351,  248,
			  600,  249,  591,  259,  229,  116,  116,  108,  116,  109,
			  241,  260,  260,  260,  260,  260,  260,  261,  264,  223,
			  255,  264,  347,  108,  350,  254,  351,  373,  108,  118,

			  109,  259,  260,  260,  260,  260,  260,  260,  116,  116,
			  155,  116,  116,  116,  533,  116,  116,  116,  403,  116,
			  111,  264,  325,  310,  356,  264,  224,  225,  326,  264,
			  116,  116,  118,  116,  224,  225,  118,  376,  160,  336,
			  118,  111,  337,  264,  540,  116,  116,  268,  116,  267,
			  325,  315,  356,  266,  118,  264,  326,  264,  264,  116,
			  116,  376,  116,  269,  334,  116,  116,  336,  116,  118,
			  337,  264,  264,  540,  155,  268,  350,  267,  264,  116,
			  116,  266,  116,  118,  116,  116,  372,  116,  270,  118,
			  155,  269,  264,  116,  116,  534,  116,  264,  534,  271,

			  482,  320,  160,  118,  352,  264,  264,  752,  118,  272,
			  116,  116,  534,  116,  273,  535,  270,  118,  160,  461,
			  274,  443,  276,  264,  155,  116,  116,  271,  116,  322,
			  275,  440,  277,  360,  118,  331,  752,  272,  264,  444,
			  116,  116,  273,  116,  116,  116,  403,  116,  274,  118,
			  276,  824,  160,  264,  219,  264,  387,  264,  275,  116,
			  116,  360,  116,  333,  118,  618,  278,  444,  118,  891,
			  279,  386,  264,  280,  155,  318,  116,  116,  354,  116,
			  824,  445,  355,  118,  116,  116,  385,  116,  264,  264,
			  220,  221,  116,  116,  278,  116,  448,  264,  279,  281, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  118,  280,  160,  319,  282,  264,  354,  155,  118,  445,
			  355,  384,  116,  116,  284,  116,  118,  116,  116,  324,
			  116,  283,  618,  285,  448,  264,  264,  450,  381,  891,
			  264,  451,  282,  226,  230,  160,  118,  116,  116,  264,
			  116,  118,  284,  116,  116,  356,  116,  327,  138,  283,
			  264,  285,  286,  264,  286,  450,  264,  292,  155,  451,
			  371,  118,  292,  454,  141,  264,  321,  118,  138,  220,
			  221,  287,  372,  359,  371,  288,  138,  455,  289,  300,
			  456,  460,  292,  301,  444,  117,  160,  290,  209,  291,
			  209,  454,  620,  141,  323,  620,  138,  250,  250,  287,

			  250,  116,  116,  288,  116,  455,  289,  300,  456,  460,
			  338,  301,  446,  277,  264,  309,  290,  621,  291,  116,
			  116,  388,  116,  264,  308,  118,  117,  117,  117,  117,
			  117,  117,  264,  463,  152,  293,  293,  293,  293,  293,
			  293,  231,  464,  118,  231,  116,  116,  299,  116,  116,
			  116,  305,  116,  232,  294,  292,  252,  295,  264,  117,
			  251,  463,  264,  296,  234,  465,  213,  213,  213,  118,
			  464,  116,  116,  118,  116,  299,  250,  297,  264,  264,
			  298,  302,  294,  243,  264,  295,  116,  116,  117,  116,
			  820,  296,   99,  465,  229,  118,  325,  155,  155,  264,

			  209,  770,  326,  264,  264,  297,  335,  828,  298,  302,
			  118,  209,  264,  313,  303,  314,  314,  314,  314,  314,
			  314,  264,  155,  155,  328,  160,  160,  330,  264,  264,
			  329,  155,  822,   96,  339,  304,  828,  230,  336,  264,
			  155,  337,  303,  264,  264,  209,  338,  155,  155,  207,
			  160,  160,  264,  264,  466,  332,  209,  347,  155,  160,
			  342,  344,  155,  155,  304,  264,  340,  209,  160,  341,
			  346,  155,  155,  360,  891,  160,  160,  351,  213,  213,
			  213,  152,  466,  150,  155,  349,  160,  115,  343,  345,
			  160,  160,  364,  365,  366,  367,  368,  114,  348,  160,

			  160,  361,  113,  377,  376,  353,  377,  107,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  264,  264,  848,  369,  369,  369,  231,  380,  380,
			  231,  380,  264,  104,   99,  370,  370,  370,   97,  232,
			  155,  155,  116,  116,  354,  116,  470,  472,  355,  473,
			  234,  454,  848,  620,  240,  264,  620,   96,  362,  382,
			  383,  383,  383,  383,  383,  383,  118,  891,  160,  160,
			  378,  376,  357,  378,  470,  472,  358,  473,  621,  457,
			  229,  392,  392,  392,  392,  392,  392,  363,  374,  375,

			  376,  374,  375,  374,  374,  374,  374,  374,  374,  374,
			  374,  377,  233,  233,  374,  233,  233,  233,  233,  233,
			  233,  374,  378,  374,  374,  374,  374,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  374,  374,  379,  374,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  374,  374,
			  374,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  239,  239,  390,  239,  390,  891,  891,  391,  391,  391,

			  391,  391,  391,  393,  393,  393,  393,  393,  393,  400,
			  400,  400,  400,  400,  891,  891,  240,  891,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  389,  389,  389,  389,  389,  389,  394,  394,  394,
			  394,  394,  394,  476,  477,  480,  481,  254,  891,  397,
			  891,  397,  891,  395,  398,  398,  398,  398,  398,  398,
			  108,  241,  109,  891,  399,  399,  399,  399,  399,  399,
			  255,  476,  477,  480,  481,  254,  396,  116,  116,  539,
			  116,  395,  401,  401,  401,  401,  401,  401,  891,  543,

			  264,  116,  116,  891,  116,  116,  116,  891,  116,  116,
			  116,  118,  116,  111,  264,  891,  891,  539,  264,  404,
			  891,  891,  264,  380,  380,  118,  380,  543,  545,  118,
			  891,  116,  116,  118,  116,  116,  116,  891,  116,  891,
			  407,  405,  617,  414,  264,  406,  264,  404,  264,  891,
			  116,  116,  264,  116,  414,  118,  545,  116,  116,  118,
			  116,  891,  891,  264,  414,  155,  546,  409,  407,  405,
			  264,  155,  264,  406,  118,  408,  116,  116,  549,  116,
			  891,  118,  414,  116,  116,  891,  116,  410,  461,  264,
			  450,  155,  619,  160,  546,  409,  264,  891,  891,  160,

			  118,  411,  891,  408,  891,  264,  549,  118,  116,  116,
			  891,  116,  891,  116,  116,  410,  116,  891,  452,  160,
			  412,  264,  116,  116,  473,  116,  264,  116,  116,  411,
			  116,  891,  118,  891,  264,  264,  264,  118,  413,  550,
			  264,  116,  116,  891,  116,  415,  118,  553,  412,  891,
			  416,  118,  475,  477,  264,  155,  116,  116,  417,  116,
			  455,  116,  116,  418,  116,  118,  891,  550,  264,  264,
			  554,  419,  891,  415,  264,  553,  116,  116,  416,  116,
			  118,  479,  891,  160,  556,  118,  417,  155,  458,  264,
			  891,  418,  422,  422,  422,  422,  422,  422,  554,  419,

			  118,  116,  116,  891,  116,  557,  891,  420,  421,  891,
			  116,  116,  556,  116,  264,  160,  558,  423,  423,  423,
			  423,  423,  423,  264,  891,  118,  425,  425,  425,  425,
			  425,  425,  891,  557,  118,  420,  421,  426,  426,  426,
			  426,  426,  426,  891,  558,  891,  424,  427,  427,  427,
			  427,  427,  427,  891,  296,  117,  428,  428,  428,  428,
			  428,  428,  117,  117,  117,  117,  117,  117,  429,  264,
			  429,  117,  117,  117,  117,  117,  117,  829,  829,  829,
			  116,  116,  296,  116,  116,  116,  891,  116,  155,  891,
			  117,  430,  891,  264,  431,  891,  891,  264,  264,  481,

			  432,  891,  116,  116,  118,  116,  209,  313,  118,  313,
			  313,  313,  313,  313,  313,  264,  160,  155,  117,  430,
			  264,  465,  431,  433,  434,  891,  118,  484,  432,  116,
			  116,  891,  116,  116,  116,  264,  116,  891,  891,  155,
			  891,  559,  264,  891,  463,  160,  264,  116,  116,  469,
			  116,  433,  891,  118,  155,  116,  116,  118,  116,  209,
			  264,  435,  891,  116,  116,  209,  116,  160,  264,  559,
			  891,  118,  467,  891,  563,  436,  264,  482,  565,  118,
			  116,  116,  160,  116,  213,  213,  213,  118,  891,  435,
			  437,  891,  441,  264,  441,  441,  441,  441,  441,  441, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  305,  264,  563,  436,  118,  891,  565,  891,  264,  442,
			  438,  442,  442,  442,  442,  442,  442,  305,  437,  313,
			  155,  314,  314,  314,  314,  314,  314,  155,  445,  439,
			  264,  264,  209,  264,  309,  448,  209,  215,  215,  215,
			  264,  264,  891,  217,  217,  217,  414,  264,  160,  155,
			  155,  264,  155,  264,  566,  160,  447,  414,  439,  155,
			  155,  451,  456,  449,  460,  464,  155,  414,  470,  569,
			  155,  570,  155,  472,  891,  623,  480,  160,  160,  476,
			  160,  625,  566,  264,  891,  414,  891,  160,  160,  453,
			  459,  891,  462,  468,  160,  891,  471,  569,  160,  570,

			  160,  474,  155,  623,  483,  375,  376,  478,  375,  625,
			  213,  213,  213,  891,  213,  213,  213,  377,  891,  485,
			  382,  383,  383,  383,  383,  383,  383,  626,  378,  629,
			  160,  488,  488,  488,  488,  488,  488,  391,  391,  391,
			  391,  391,  391,  116,  116,  891,  116,  254,  486,  489,
			  489,  489,  489,  489,  489,  626,  264,  629,  379,  491,
			  491,  491,  491,  491,  491,  635,  891,  118,  891,  636,
			  255,  891,  891,  264,  891,  254,  492,  492,  492,  492,
			  492,  492,  493,  493,  493,  493,  493,  493,  490,  637,
			  506,  891,  546,  635,  494,  638,  494,  636,  395,  495,

			  495,  495,  495,  495,  495,  496,  496,  496,  496,  496,
			  496,  398,  398,  398,  398,  398,  398,  637,  891,  506,
			  548,  396,  891,  638,  891,  891,  395,  497,  497,  497,
			  497,  497,  497,  499,  500,  891,  501,  501,  501,  501,
			  501,  501,  502,  502,  502,  502,  502,  502,  503,  503,
			  503,  503,  503,  503,  116,  116,  891,  116,  116,  116,
			  891,  116,  116,  116,  891,  116,  498,  264,  891,  264,
			  891,  264,  891,  514,  642,  264,  116,  116,  118,  116,
			  116,  116,  118,  116,  514,  587,  118,  587,  155,  264,
			  644,  891,  545,  264,  514,  891,  588,  505,  508,  891,

			  118,  507,  642,  264,  118,  891,  116,  116,  509,  116,
			  116,  116,  514,  116,  116,  116,  160,  116,  644,  264,
			  547,  891,  155,  264,  589,  505,  508,  264,  891,  507,
			  118,  571,  116,  116,  118,  116,  509,  891,  118,  891,
			  116,  116,  572,  116,  891,  264,  512,  891,  116,  116,
			  160,  116,  510,  264,  645,  511,  118,  528,  891,  571,
			  513,  264,  116,  116,  118,  116,  116,  116,  528,  116,
			  572,  891,  118,  891,  512,  264,  515,  891,  528,  264,
			  510,  648,  645,  511,  116,  116,  118,  116,  513,  891,
			  118,  891,  264,  891,  516,  891,  528,  264,  891,  116,

			  116,  517,  116,  649,  515,  518,  891,  621,  118,  648,
			  621,  553,  264,  116,  116,  692,  116,  116,  116,  519,
			  116,  264,  516,  118,  891,  891,  264,  891,  891,  517,
			  264,  649,  286,  518,  286,  117,  891,  118,  117,  555,
			  155,  118,  520,  563,  117,  891,  891,  519,  422,  422,
			  422,  422,  422,  422,  891,  288,  521,  891,  523,  891,
			  891,  116,  116,  117,  116,  117,  117,  891,  160,  891,
			  520,  564,  117,  286,  264,  286,  522,  425,  425,  425,
			  425,  425,  425,  288,  521,  118,  523,  426,  426,  426,
			  426,  426,  426,  427,  427,  427,  427,  427,  427,  523,

			  264,  891,  891,  891,  522,  609,  117,  650,  524,  523,
			  428,  428,  428,  428,  428,  428,  609,  651,  657,  155,
			  117,  677,  117,  891,  891,  891,  609,  523,  525,  525,
			  525,  525,  525,  525,  891,  650,  524,  523,  677,  891,
			  891,  255,  677,  117,  609,  651,  657,  160,  693,  117,
			  526,  526,  526,  526,  526,  526,  527,  527,  527,  527,
			  527,  527,  116,  116,  891,  116,  677,  116,  116,  694,
			  116,  891,  117,  264,  264,  264,  693,  891,  614,  117,
			  264,  116,  116,  891,  116,  117,  118,  116,  116,  615,
			  116,  118,  155,  155,  264,  116,  116,  694,  116,  616,

			  264,  891,  891,  891,  264,  118,  891,  540,  533,  891,
			  891,  118,  530,  529,  891,  531,  891,  615,  891,  118,
			  160,  160,  891,  155,  696,  441,  532,  441,  441,  441,
			  441,  441,  441,  305,  539,  891,  542,  264,  264,  891,
			  530,  529,  442,  531,  442,  442,  442,  442,  442,  442,
			  305,  160,  696,  264,  532,  264,  155,  155,  264,  264,
			  264,  264,  541,  264,  537,  891,  891,  543,  697,  533,
			  700,  549,  155,  264,  155,  701,  556,  155,  155,  155,
			  155,  538,  155,  702,  160,  160,  558,  550,  155,  565,
			  703,  557,  155,  566,  569,  544,  697,  891,  700,  551,

			  160,  891,  160,  701,  560,  160,  160,  160,  160,  264,
			  160,  702,  891,  630,  562,  552,  160,  567,  703,  561,
			  160,  568,  573,  264,  891,  631,  707,  570,  155,  488,
			  488,  488,  488,  488,  488,  576,  576,  576,  576,  576,
			  576,  630,  623,  891,  709,  575,  577,  577,  577,  577,
			  577,  577,  264,  631,  707,  574,  160,  578,  578,  578,
			  578,  578,  578,  579,  579,  579,  579,  579,  579,  891,
			  624,  155,  709,  575,  490,  710,  713,  714,  625,  395,
			  495,  495,  495,  495,  495,  495,  580,  580,  580,  580,
			  580,  580,  582,  582,  582,  582,  582,  582,  891,  160,

			  891,  891,  396,  710,  713,  714,  627,  395,  583,  583,
			  583,  583,  583,  583,  584,  584,  584,  584,  584,  584,
			  116,  116,  891,  116,  891,  581,  579,  579,  579,  579,
			  579,  579,  500,  264,  501,  501,  501,  501,  501,  501,
			  116,  116,  586,  116,  118,  116,  116,  498,  116,  116,
			  116,  891,  116,  264,  116,  116,  891,  116,  264,  891,
			  891,  715,  264,  891,  118,  891,  747,  264,  891,  118,
			  586,  891,  264,  118,  264,  891,  748,  593,  118,  116,
			  116,  264,  116,  116,  116,  595,  116,  264,  594,  715,
			  891,  155,  264,  155,  747,  592,  264,  891,  116,  116,

			  630,  116,  891,  118,  748,  593,  636,  118,  891,  891,
			  596,  264,  631,  595,  622,  597,  594,  116,  116,  160,
			  116,  160,  118,  891,  750,  264,  891,  598,  633,  264,
			  264,  754,  116,  116,  639,  116,  116,  116,  596,  116,
			  634,  118,  891,  597,  642,  264,  891,  626,  155,  264,
			  116,  116,  750,  116,  599,  598,  118,  891,  264,  754,
			  118,  891,  756,  264,  601,  116,  116,  602,  116,  891,
			  116,  116,  643,  116,  118,  628,  160,  155,  264,  891,
			  891,  638,  599,  264,  116,  116,  603,  116,  891,  118,
			  756,  891,  601,  264,  118,  602,  891,  264,  891,  891, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  116,  116,  604,  116,  264,  160,  891,  264,  118,  641,
			  891,  629,  155,  264,  603,  607,  607,  607,  607,  607,
			  607,  891,  264,  645,  118,  637,  155,  605,  757,  891,
			  604,  891,  606,  117,  117,  117,  117,  117,  117,  632,
			  160,  648,  891,  758,  117,  525,  525,  525,  525,  525,
			  525,  647,  891,  640,  160,  605,  757,  429,  891,  429,
			  606,  526,  526,  526,  526,  526,  526,  116,  116,  652,
			  116,  758,  723,  608,  527,  527,  527,  527,  527,  527,
			  264,  116,  116,  431,  116,  116,  116,  264,  116,  432,
			  117,  118,  891,  264,  264,  396,  117,  264,  264,  610,

			  723,  608,  264,  264,  688,  118,  649,  116,  116,  118,
			  116,  431,  155,  611,  891,  688,  155,  432,  694,  891,
			  264,  155,  155,  644,  117,  689,  891,  610,  612,  116,
			  116,  118,  116,  891,  653,  667,  667,  667,  667,  667,
			  160,  611,  264,  688,  160,  891,  695,  613,  891,  160,
			  160,  646,  654,  118,  654,  891,  612,  655,  655,  655,
			  655,  655,  655,  655,  655,  655,  655,  655,  655,  656,
			  656,  656,  656,  656,  656,  613,  579,  579,  579,  579,
			  579,  579,  659,  659,  659,  659,  659,  659,  764,  764,
			  764,  764,  658,  660,  660,  660,  660,  660,  660,  264,

			  264,  891,  490,  661,  661,  661,  661,  661,  661,  662,
			  662,  662,  662,  662,  662,  891,  264,  783,  696,  155,
			  658,  581,  663,  663,  663,  663,  663,  663,  664,  664,
			  664,  664,  664,  664,  665,  702,  665,  891,  891,  662,
			  662,  662,  662,  662,  662,  783,  698,  160,  498,  666,
			  666,  666,  666,  666,  666,  669,  669,  669,  669,  669,
			  669,  116,  116,  705,  116,  264,  116,  116,  891,  116,
			  891,  670,  891,  891,  264,  891,  688,  784,  786,  264,
			  116,  116,  788,  116,  709,  118,  790,  690,  791,  672,
			  118,  891,  891,  264,  673,  116,  116,  691,  116,  670,

			  116,  116,  891,  116,  118,  784,  786,  891,  264,  891,
			  788,  891,  711,  264,  790,  690,  791,  672,  807,  118,
			  116,  116,  673,  116,  118,  116,  116,  674,  116,  116,
			  116,  891,  116,  264,  116,  116,  891,  116,  264,  675,
			  808,  264,  264,  891,  118,  891,  807,  264,  891,  118,
			  891,  116,  116,  118,  116,  674,  116,  116,  118,  116,
			  155,  810,  676,  891,  264,  689,  679,  675,  808,  264,
			  812,  116,  116,  678,  116,  118,  691,  823,  116,  116,
			  118,  116,  891,  891,  264,  891,  691,  891,  160,  810,
			  676,  264,  891,  891,  679,  118,  680,  891,  812,  264,

			  681,  678,  118,  682,  691,  823,  286,  891,  286,  683,
			  607,  607,  607,  607,  607,  607,  116,  116,  155,  116,
			  116,  116,  264,  116,  680,  697,  891,  891,  681,  264,
			  264,  682,  264,  264,  826,  116,  116,  683,  116,  117,
			  118,  155,  116,  116,  118,  116,  160,  735,  264,  155,
			  710,  155,  264,  699,  703,  264,  264,  116,  116,  118,
			  116,  701,  826,  685,  735,  686,  118,  738,  735,  160,
			  264,  155,  891,  687,  838,  155,  891,  160,  712,  160,
			  891,  118,  706,  707,  738,  891,  713,  891,  738,  704,
			  891,  685,  735,  686,  264,  891,  891,  891,  891,  160,

			  732,  687,  838,  160,  655,  655,  655,  655,  655,  655,
			  891,  708,  738,  155,  716,  655,  655,  655,  655,  655,
			  655,  717,  717,  717,  717,  717,  717,  718,  732,  718,
			  891,  891,  719,  719,  719,  719,  719,  719,  720,  891,
			  720,  160,  891,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  722,  722,  722,  722,  722,
			  722,  662,  662,  662,  662,  662,  662,  724,  724,  724,
			  724,  724,  724,  662,  662,  662,  662,  662,  662,  726,
			  726,  726,  726,  726,  726,  891,  891,  891,  581,  727,
			  727,  727,  727,  727,  727,  728,  728,  728,  728,  728,

			  728,  782,  782,  839,  782,  116,  116,  729,  116,  729,
			  849,  723,  730,  730,  730,  730,  730,  730,  264,  116,
			  116,  891,  116,  116,  116,  806,  116,  116,  116,  118,
			  116,  839,  264,  891,  396,  891,  264,  858,  849,  723,
			  264,  891,  733,  118,  891,  116,  116,  118,  116,  116,
			  116,  118,  116,  734,  116,  116,  891,  116,  264,  891,
			  264,  264,  264,  116,  116,  858,  116,  264,  891,  118,
			  733,  116,  116,  118,  116,  891,  264,  750,  118,  155,
			  155,  734,  264,  891,  264,  116,  116,  118,  116,  116,
			  116,  891,  116,  116,  116,  118,  116,  264,  264,  264,

			  264,  155,  264,  736,  891,  751,  264,  160,  160,  118,
			  737,  116,  116,  118,  116,  891,  155,  118,  155,  155,
			  264,  739,  264,  748,  264,  864,  264,  891,  740,  160,
			  891,  891,  736,  752,  835,  118,  778,  891,  737,  155,
			  778,  155,  835,  741,  160,  756,  160,  160,  754,  739,
			  891,  749,  891,  864,  891,  835,  740,  778,  891,  891,
			  891,  891,  753,  891,  891,  891,  891,  160,  778,  160,
			  835,  741,  891,  759,  891,  891,  755,  719,  719,  719,
			  719,  719,  719,  760,  760,  760,  760,  760,  760,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,

			  721,  761,  761,  761,  761,  761,  761,  762,  891,  762,
			  891,  891,  763,  763,  763,  763,  763,  763,  766,  767,
			  766,  767,  490,  765,  765,  765,  765,  765,  765,  661,
			  661,  661,  661,  661,  661,  730,  730,  730,  730,  730,
			  730,  116,  116,  891,  116,  723,  769,  769,  769,  769,
			  769,  769,  891,  891,  264,  264,  891,  768,  891,  116,
			  116,  891,  116,  891,  891,  118,  116,  116,  396,  116,
			  891,  771,  264,  723,  786,  775,  891,  891,  891,  264,
			  891,  116,  116,  118,  116,  498,  891,  891,  116,  116,
			  118,  116,  775,  779,  264,  772,  775,  779,  773,  771,

			  891,  264,  787,  116,  116,  118,  116,  891,  116,  116,
			  891,  116,  118,  891,  779,  778,  264,  891,  774,  780,
			  775,  264,  891,  772,  264,  779,  773,  118,  116,  116,
			  264,  116,  118,  779,  776,  802,  780,  781,  264,  802,
			  777,  264,  264,  155,  891,  891,  774,  780,  891,  155,
			  891,  891,  118,  784,  781,  788,  802,  155,  891,  891,
			  790,  155,  776,  116,  116,  781,  116,  802,  777,  891,
			  891,  160,  891,  891,  891,  891,  264,  160,  891,  891,
			  891,  785,  891,  789,  891,  160,  891,  118,  792,  160,
			  717,  717,  717,  717,  717,  717,  763,  763,  763,  763, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  763,  763,  793,  793,  793,  793,  793,  793,  794,  794,
			  794,  794,  794,  794,  589,  589,  589,  589,  589,  589,
			  795,  795,  795,  795,  795,  795,  891,  891,  891,  490,
			  796,  796,  796,  796,  796,  796,  116,  116,  891,  116,
			  891,  581,  724,  724,  724,  724,  724,  724,  891,  264,
			  116,  116,  803,  116,  116,  116,  803,  116,  891,  891,
			  118,  264,  802,  264,  803,  891,  804,  264,  805,  116,
			  116,  798,  116,  803,  118,  891,  116,  116,  118,  116,
			  155,  498,  264,  804,  803,  805,  800,  264,  264,  264,
			  264,  862,  891,  118,  804,  799,  805,  264,  264,  798,

			  118,  891,  862,  264,  891,  891,  155,  810,  160,  155,
			  891,  891,  862,  891,  800,  891,  155,  155,  891,  808,
			  891,  801,  155,  799,  761,  761,  761,  761,  761,  761,
			  862,  891,  891,  824,  160,  811,  891,  160,  814,  814,
			  814,  814,  814,  814,  160,  160,  766,  809,  766,  801,
			  160,  796,  796,  796,  796,  796,  796,  116,  116,  264,
			  116,  891,  825,  581,  116,  116,  891,  116,  891,  891,
			  264,  116,  116,  891,  116,  891,  891,  264,  155,  116,
			  116,  118,  116,  836,  264,  768,  891,  891,  118,  816,
			  826,  836,  264,  891,  891,  118,  830,  830,  830,  830,

			  830,  830,  891,  118,  836,  891,  160,  116,  116,  891,
			  116,  116,  116,  817,  116,  818,  891,  816,  827,  836,
			  264,  891,  891,  891,  264,  891,  116,  116,  819,  116,
			  891,  118,  891,  891,  770,  118,  891,  891,  891,  264,
			  891,  891,  817,  818,  891,  116,  116,  836,  116,  891,
			  118,  891,  833,  116,  116,  837,  116,  819,  264,  840,
			  840,  840,  840,  840,  840,  891,  264,  891,  837,  118,
			  768,  768,  768,  768,  768,  768,  770,  118,  891,  845,
			  833,  116,  116,  837,  116,  846,  834,  845,  850,  846,
			  850,  891,  891,  846,  264,  891,  870,  847,  870,  851,

			  845,  863,  843,  891,  891,  118,  846,  871,  891,  891,
			  847,  891,  863,  844,  834,  845,  854,  854,  854,  854,
			  854,  846,  863,  116,  116,  847,  116,  852,  891,  116,
			  116,  843,  116,  891,  891,  872,  264,  891,  891,  891,
			  863,  844,  264,  884,  885,  884,  885,  118,  860,  860,
			  860,  860,  860,  118,  859,  859,  859,  859,  859,  859,
			  891,  891,  867,  891,  855,  854,  854,  854,  854,  854,
			  854,  116,  116,  867,  116,  865,  865,  865,  865,  865,
			  865,  891,  886,  867,  264,  866,  866,  866,  866,  866,
			  866,  868,  855,  116,  116,  118,  116,  891,  891,  891,

			  891,  867,  868,  861,  891,  891,  264,  876,  876,  876,
			  876,  876,  868,  891,  891,  891,  891,  118,  869,  869,
			  869,  869,  869,  869,  852,  852,  852,  852,  852,  852,
			  868,  861,  875,  875,  875,  875,  875,  875,  877,  878,
			  879,  879,  879,  879,  879,  879,  880,  880,  880,  880,
			  880,  880,  881,  882,  891,  877,  878,  891,  891,  877,
			  878,  883,  883,  883,  883,  883,  883,  891,  891,  881,
			  882,  891,  891,  881,  882,  872,  872,  872,  872,  872,
			  872,  891,  891,  877,  878,  887,  887,  887,  887,  887,
			  887,  888,  888,  888,  888,  888,  888,  881,  882,  889,

			  889,  889,  889,  889,  889,  884,  891,  884,  891,  891,
			  888,  888,  888,  888,  888,  888,  890,  890,  890,  890,
			  890,  890,  886,  886,  886,  886,  886,  886,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  886,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,

			   92,   98,   98,  891,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			  891,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  100,  100,  891,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  117,  117,
			  117,  891,  891,  891,  891,  891,  891,  891,  117,  117,
			  117,  117,  891,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  891,  891,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  149,  149,  891,
			  149,  149,  891,  149,  149,  149,  891,  891,  149,  149,
			  149,  149,  149,  149,  149,  149,  149,  149,  149,  149,

			  149,  149,  149,  149,  149,  149,  149,  149,  149,  149,
			  149,  891,  891,  149,  149,  149,  149,  149,  149,  149,
			  149,  149,  151,  151,  891,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  208,  208,  891,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  891,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  228,  891,  228,  891,  891,  891,  891,  228,  228,  891,
			  228,  228,  228,  891,  891,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  891,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  242,  242,  891,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  103,  891,  891,  891,  891,
			  103,  103,  103,  891,  891,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  891,  891,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  257,  257,  257,  257,  257,  257,  257,  257,  257,
			  891,  257,  257,  257,  257,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  257,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  257,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  257,  257,  257,  257,  257,  257,
			  257,  257,  257,  265,  891,  891,  891,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,

			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  891,  891,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  891,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  241,  241,  241,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  241,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,

			  402,  402,  402,  891,  891,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  374,  374,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  504,  504,  504,  891,
			  891,  504,  504,  504,  504,  504,  504,  504,  504,  504,
			  504,  504,  504,  504,  504,  504,  504,  504,  504,  504,
			  504,  504,  504,  504,  891,  891,  504,  504,  504,  504,

			  504,  504,  504,  504,  504,  536,  891,  536,  891,  891,
			  891,  891,  536,  536,  891,  536,  536,  536,  891,  891,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  891,  891,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  443,  443,  443,  891,  891,  443,
			  443,  443,  443,  443,  443,  443,  443,  443,  891,  891,
			  443,  443,  443,  443,  443,  443,  443,  443,  443,  443,
			  443,  443,  443,  443,  443,  443,  443,  443,  443,  443,
			  443,  443,  443,  891,  891,  443,  443,  443,  443,  443,

			  443,  443,  443,  443,  617,  891,  617,  891,  891,  891,
			  891,  617,  617,  891,  617,  617,  617,  891,  891,  617,
			  617,  617,  617,  617,  617,  617,  617,  617,  617,  617,
			  617,  617,  617,  617,  617,  617,  617,  617,  617,  617,
			  617,  617,  891,  617,  617,  617,  617,  617,  617,  617,
			  617,  617,  617,  668,  668,  668,  668,  668,  668,  668,
			  668,  668,  891,  668,  668,  668,  668,  668,  668,  668,
			  668,  668,  668,  668,  668,  668,  668,  668,  668,  668,
			  668,  668,  668,  668,  668,  668,  668,  668,  668,  668,
			  668,  668,  668,  668,  668,  668,  668,  668,  668,  668, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  668,  668,  668,  668,  668,  671,  671,  671,  671,  671,
			  671,  671,  671,  671,  671,  671,  671,  671,  671,  671,
			  671,  671,  671,  671,  671,  671,  671,  671,  891,  891,
			  671,  671,  671,  671,  671,  671,  671,  671,  671,  731,
			  731,  731,  891,  891,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  891,  891,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  746,  746,
			  746,  746,  746,  746,  746,  746,  746,  746,  746,  746,
			  746,  746,  746,  746,  746,  746,  746,  746,  746,  746,

			  746,  746,  891,  891,  891,  891,  746,  746,  746,  891,
			  891,  746,  746,  746,  746,  746,  746,  746,  746,  746,
			  746,  746,  746,  746,  746,  746,  746,  746,  746,  746,
			  746,  746,  746,  746,  891,  891,  746,  746,  746,  746,
			  746,  746,  746,  746,  746,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  797,  891,  891,
			  797,  797,  797,  797,  797,  797,  797,  797,  797,  815,
			  815,  815,  891,  891,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,

			  815,  815,  815,  815,  815,  815,  815,  891,  891,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  891,  891,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  853,  853,  853,  891,  891,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  891,  891,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,   11,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891, yy_Dummy>>,
			1, 384, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 6383)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
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
			    1,    1,    1,    3,    5,    9,    6,    3,    4,   10,

			   18,   13,    4,   13,   13,   25,  868,   25,   25,   25,
			   25,   25,   25,   27,   84,   27,   92,   27,   27,   27,
			   27,   27,   27,   38,   38,   58,   38,   64,   76,   68,
			    5,    5,    6,    6,   28,   64,   28,   68,   28,   28,
			   28,   28,   28,   28,    3,   18,  157,   38,  158,    4,
			    9,   84,   84,   58,   10,   64,   27,   68,   74,  232,
			   74,   74,  232,   64,   95,   68,   95,   95,  499,  499,
			  210,   92,  210,  210,  157,   76,  158,   28,    3,    3,
			    3,    3,    3,    4,    4,    4,    4,    4,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			   35,   35,  205,   35,   36,   36,  234,   36,  867,  234,
			   37,   37,   61,   37,   63,   61,   78,  159,   63,  235,

			   39,   39,  153,   39,   35,  153,   43,   43,   36,   43,
			  153,  205,   80,   35,   37,   69,   36,   35,   37,   35,
			   61,  846,   63,   61,   39,  159,   63,   37,   40,   40,
			   43,   40,   69,  845,   43,   41,   41,   39,   41,   44,
			   44,   35,   44,   69,   36,   35,   37,   35,   39,   82,
			   42,   42,   40,   42,  235,   37,   40,   45,   45,   41,
			   45,   69,   43,   44,  832,   39,   48,   48,   40,   48,
			   41,   57,  815,  815,   42,   57,   78,   39,  365,   44,
			   57,   45,   85,  805,   40,   82,   82,   45,   42,   42,
			   48,   80,   80,   65,   42,   65,   40,  802,   41,   57,

			   45,   47,   47,   57,   47,   48,   65,   44,   57,  165,
			   48,   49,   49,  167,   49,   45,   42,   42,   85,   85,
			   77,   65,   42,   65,   87,   47,   59,   87,   45,   46,
			   46,   59,   46,   48,   65,   49,   47,  165,   48,  802,
			  168,  167,   59,  794,   47,   46,   46,   46,   46,   46,
			   46,   49,   79,   46,   59,   81,  761,   60,  365,   59,
			   46,   60,   50,   50,   47,   50,  150,   46,  168,   60,
			  746,   59,   47,  160,   46,   62,   46,   87,   46,   49,
			  171,   62,   62,  731,   67,   60,   50,   62,   46,   60,
			   66,   67,  160,   66,  175,   46,   67,   60,   77,   77,

			   77,   66,  150,   62,  163,   46,  724,   46,  171,   62,
			   62,   50,   67,   89,  362,   62,   89,  150,   66,   67,
			  160,   66,  175,  163,   67,   89,   89,  176,  163,   66,
			   79,   79,   79,   81,   81,   81,   89,  717,  847,  181,
			   50,   55,   90,  362,   55,   90,  847,  367,  691,   55,
			  251,  163,  251,  251,   90,  176,  163,   55,   55,   55,
			   55,   55,   55,   55,  187,   90,   89,  181,  690,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,  187,  689,  503,   90,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   56,  116,  116,   56,  116,  164,  367,  367,   56,  108,
			  108,  108,  108,  108,  108,  503,   56,   56,   56,   56,
			   56,   56,   56,  164,  164,  116,  189,  688,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,  164,  164,  191,  189,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   93,

			   93,  191,   93,  853,  853,  102,  111,  111,  111,  111,
			  111,  111,  664,  609,  102,  102,  102,  102,  102,  102,
			  440,  227,  540,  440,  227,   93,  371,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			  102,  106,  106,  106,  106,  106,  106,  109,  109,  109,
			  109,  109,  109,  371,  192,  102,  195,  106,  196,  102,
			  514,  102,  504,  109,  227,  117,  117,  110,  117,  110,
			   93,  110,  110,  110,  110,  110,  110,  110,  117,  222,
			  106,  162,  192,  492,  195,  106,  196,  224,  112,  117,

			  112,  109,  112,  112,  112,  112,  112,  112,  119,  119,
			  162,  119,  120,  120,  485,  120,  121,  121,  403,  121,
			  110,  119,  172,  162,  200,  120,  222,  222,  172,  121,
			  122,  122,  119,  122,  224,  224,  120,  379,  162,  182,
			  121,  112,  182,  122,  445,  123,  123,  121,  123,  120,
			  172,  162,  200,  119,  122,  180,  172,  197,  123,  124,
			  124,  374,  124,  122,  180,  125,  125,  182,  125,  123,
			  182,  169,  124,  445,  180,  121,  197,  120,  125,  128,
			  128,  119,  128,  124,  126,  126,  373,  126,  123,  125,
			  169,  122,  128,  127,  127,  534,  127,  126,  534,  124,

			  356,  169,  180,  128,  197,  178,  127,  703,  126,  125,
			  129,  129,  535,  129,  126,  535,  123,  127,  169,  331,
			  126,  309,  128,  129,  178,  130,  130,  124,  130,  169,
			  127,  305,  129,  203,  129,  178,  703,  125,  130,  310,
			  131,  131,  126,  131,  132,  132,  265,  132,  126,  130,
			  128,  808,  178,  131,  218,  166,  249,  132,  127,  133,
			  133,  203,  133,  178,  131,  535,  130,  310,  132,  617,
			  131,  248,  133,  131,  166,  166,  134,  134,  199,  134,
			  808,  311,  199,  133,  135,  135,  247,  135,  173,  134,
			  218,  218,  136,  136,  130,  136,  318,  135,  131,  132, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  134,  131,  166,  166,  133,  136,  199,  173,  135,  311,
			  199,  246,  138,  138,  135,  138,  136,  139,  139,  173,
			  139,  134,  617,  136,  318,  138,  202,  320,  244,  239,
			  139,  321,  133,  221,  230,  173,  138,  141,  141,  170,
			  141,  139,  135,  145,  145,  202,  145,  173,  139,  134,
			  141,  136,  137,  137,  137,  320,  145,  138,  170,  321,
			  225,  141,  139,  324,  139,  315,  170,  145,  141,  221,
			  221,  137,  223,  202,  220,  137,  139,  325,  137,  145,
			  326,  330,  141,  145,  315,  137,  170,  137,  214,  137,
			  208,  324,  538,  139,  170,  538,  141,  250,  250,  137,

			  250,  144,  144,  137,  144,  325,  137,  145,  326,  330,
			  183,  145,  315,  179,  144,  156,  137,  538,  137,  140,
			  140,  250,  140,  142,  154,  144,  142,  142,  142,  142,
			  142,  142,  140,  335,  151,  140,  140,  140,  140,  140,
			  140,  228,  336,  140,  228,  143,  143,  144,  143,  146,
			  146,  149,  146,  228,  140,  142,  105,  140,  143,  142,
			  104,  335,  146,  140,  228,  337,  214,  214,  214,  143,
			  336,  147,  147,  146,  147,  144,  103,  143,  184,  174,
			  143,  146,  140,  100,  147,  140,  148,  148,  142,  148,
			  804,  140,   98,  337,  228,  147,  174,  184,  174,  148,

			  215,  804,  174,  177,  186,  143,  184,  812,  143,  146,
			  148,  213,  161,  161,  147,  161,  161,  161,  161,  161,
			  161,  185,  177,  186,  174,  184,  174,  177,  188,  190,
			  174,  161,  804,   96,  184,  148,  812,   88,  185,  194,
			  185,  185,  147,  204,  198,   73,  186,  188,  190,   70,
			  177,  186,  317,  193,  338,  177,  216,  194,  194,  161,
			  188,  190,  204,  198,  148,  155,  185,  217,  185,  185,
			  193,  317,  193,  204,  155,  188,  190,  198,  215,  215,
			  215,   54,  338,   51,  155,  194,  194,   34,  188,  190,
			  204,  198,  213,  213,  213,  213,  213,   33,  193,  317,

			  193,  204,   31,  377,  377,  198,  377,   26,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  201,  206,  838,  216,  216,  216,  231,  240,  240,
			  231,  240,  327,   24,   16,  217,  217,  217,   15,  231,
			  201,  206,  268,  268,  201,  268,  342,  346,  201,  347,
			  231,  327,  838,  620,  240,  268,  620,   14,  206,  245,
			  245,  245,  245,  245,  245,  245,  268,   11,  201,  206,
			  378,  378,  201,  378,  342,  346,  201,  347,  620,  327,
			  231,  255,  255,  255,  255,  255,  255,  206,  233,  233,

			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  236,  236,  254,  236,  254,    0,    0,  254,  254,  254,

			  254,  254,  254,  256,  256,  256,  256,  256,  256,  261,
			  261,  261,  261,  261,    0,    0,  236,    0,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  236,  253,  253,  253,  253,  253,  253,  258,  258,  258,
			  258,  258,  258,  350,  351,  354,  355,  253,    0,  259,
			    0,  259,    0,  258,  259,  259,  259,  259,  259,  259,
			  260,  236,  260,    0,  260,  260,  260,  260,  260,  260,
			  253,  350,  351,  354,  355,  253,  258,  266,  266,  444,
			  266,  258,  262,  262,  262,  262,  262,  262,    0,  448,

			  266,  267,  267,    0,  267,  269,  269,    0,  269,  270,
			  270,  266,  270,  260,  267,    0,    0,  444,  269,  266,
			    0,    0,  270,  380,  380,  267,  380,  448,  450,  269,
			    0,  271,  271,  270,  271,  272,  272,    0,  272,  536,
			  270,  267,  536,  277,  271,  269,  333,  266,  272,  380,
			  273,  273,  345,  273,  277,  271,  450,  274,  274,  272,
			  274,    0,    0,  273,  277,  333,  451,  272,  270,  267,
			  274,  345,  322,  269,  273,  271,  275,  275,  455,  275,
			    0,  274,  277,  276,  276,    0,  276,  273,  333,  275,
			  322,  322,  536,  333,  451,  272,  276,    0,    0,  345,

			  275,  274,    0,  271,    0,  349,  455,  276,  278,  278,
			    0,  278,    0,  279,  279,  273,  279,    0,  322,  322,
			  275,  278,  280,  280,  349,  280,  279,  281,  281,  274,
			  281,    0,  278,    0,  353,  280,  328,  279,  276,  456,
			  281,  282,  282,    0,  282,  278,  280,  460,  275,    0,
			  279,  281,  349,  353,  282,  328,  283,  283,  280,  283,
			  328,  284,  284,  281,  284,  282,    0,  456,  361,  283,
			  461,  282,    0,  278,  284,  460,  285,  285,  279,  285,
			  283,  353,    0,  328,  463,  284,  280,  361,  328,  285,
			    0,  281,  286,  286,  286,  286,  286,  286,  461,  282,

			  285,  287,  287,    0,  287,  464,    0,  284,  285,    0,
			  295,  295,  463,  295,  287,  361,  465,  287,  287,  287,
			  287,  287,  287,  295,    0,  287,  288,  288,  288,  288,
			  288,  288,    0,  464,  295,  284,  285,  289,  289,  289,
			  289,  289,  289,    0,  465,    0,  287,  290,  290,  290,
			  290,  290,  290,    0,  295,  288,  291,  291,  291,  291,
			  291,  291,  292,  292,  292,  292,  292,  292,  293,  358,
			  293,  294,  294,  294,  294,  294,  294,  813,  813,  813,
			  296,  296,  295,  296,  297,  297,    0,  297,  358,    0,
			  294,  293,    0,  296,  293,    0,    0,  297,  341,  358,

			  293,    0,  298,  298,  296,  298,  364,  313,  297,  313,
			  313,  313,  313,  313,  313,  298,  358,  341,  294,  293,
			  339,  341,  293,  297,  298,    0,  298,  358,  293,  299,
			  299,    0,  299,  300,  300,  359,  300,    0,    0,  339,
			    0,  466,  299,    0,  339,  341,  300,  301,  301,  341,
			  301,  297,    0,  299,  359,  302,  302,  300,  302,  366,
			  301,  299,    0,  303,  303,  368,  303,  339,  302,  466,
			    0,  301,  339,    0,  470,  300,  303,  359,  472,  302,
			  304,  304,  359,  304,  364,  364,  364,  303,    0,  299,
			  301,    0,  306,  304,  306,  306,  306,  306,  306,  306, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  306,  316,  470,  300,  304,    0,  472,    0,  319,  307,
			  302,  307,  307,  307,  307,  307,  307,  307,  301,  314,
			  316,  314,  314,  314,  314,  314,  314,  319,  316,  304,
			  323,  329,  369,  332,  334,  319,  370,  366,  366,  366,
			  348,  340,    0,  368,  368,  368,  334,  357,  316,  323,
			  329,  343,  332,  352,  473,  319,  316,  334,  304,  348,
			  340,  323,  329,  319,  332,  340,  357,  334,  343,  480,
			  343,  481,  352,  348,    0,  543,  357,  323,  329,  352,
			  332,  545,  473,  363,    0,  334,    0,  348,  340,  323,
			  329,    0,  332,  340,  357,    0,  343,  480,  343,  481,

			  352,  348,  363,  543,  357,  375,  375,  352,  375,  545,
			  369,  369,  369,    0,  370,  370,  370,  375,    0,  363,
			  383,  383,  383,  383,  383,  383,  383,  546,  375,  549,
			  363,  389,  389,  389,  389,  389,  389,  390,  390,  390,
			  390,  390,  390,  405,  405,    0,  405,  389,  363,  391,
			  391,  391,  391,  391,  391,  546,  405,  549,  375,  392,
			  392,  392,  392,  392,  392,  554,    0,  405,    0,  556,
			  389,    0,    0,  453,    0,  389,  393,  393,  393,  393,
			  393,  393,  394,  394,  394,  394,  394,  394,  391,  557,
			  405,    0,  453,  554,  395,  558,  395,  556,  394,  395,

			  395,  395,  395,  395,  395,  396,  396,  396,  396,  396,
			  396,  397,  397,  397,  397,  397,  397,  557,    0,  405,
			  453,  394,    0,  558,    0,    0,  394,  398,  398,  398,
			  398,  398,  398,  399,  399,    0,  399,  399,  399,  399,
			  399,  399,  400,  400,  400,  400,  400,  400,  401,  401,
			  401,  401,  401,  401,  404,  404,    0,  404,  406,  406,
			    0,  406,  407,  407,    0,  407,  398,  404,    0,  452,
			    0,  406,    0,  414,  563,  407,  408,  408,  404,  408,
			  409,  409,  406,  409,  414,  502,  407,  502,  452,  408,
			  565,    0,  452,  409,  414,    0,  502,  404,  407,    0,

			  408,  406,  563,  457,  409,    0,  410,  410,  408,  410,
			  411,  411,  414,  411,  412,  412,  452,  412,  565,  410,
			  452,    0,  457,  411,  502,  404,  407,  412,    0,  406,
			  410,  482,  413,  413,  411,  413,  408,    0,  412,    0,
			  415,  415,  482,  415,    0,  413,  412,    0,  416,  416,
			  457,  416,  410,  415,  566,  411,  413,  434,    0,  482,
			  413,  416,  417,  417,  415,  417,  418,  418,  434,  418,
			  482,    0,  416,    0,  412,  417,  415,    0,  434,  418,
			  410,  569,  566,  411,  419,  419,  417,  419,  413,    0,
			  418,    0,  462,    0,  416,    0,  434,  419,    0,  420,

			  420,  417,  420,  570,  415,  418,    0,  621,  419,  569,
			  621,  462,  420,  421,  421,  621,  421,  432,  432,  419,
			  432,  471,  416,  420,    0,    0,  421,    0,    0,  417,
			  432,  570,  423,  418,  423,  424,    0,  421,  424,  462,
			  471,  432,  420,  471,  424,    0,    0,  419,  422,  422,
			  422,  422,  422,  422,    0,  423,  421,    0,  423,    0,
			    0,  433,  433,  424,  433,  423,  424,    0,  471,    0,
			  420,  471,  424,  425,  433,  425,  422,  425,  425,  425,
			  425,  425,  425,  423,  421,  433,  423,  426,  426,  426,
			  426,  426,  426,  427,  427,  427,  427,  427,  427,  425,

			  478,    0,    0,    0,  422,  528,  425,  571,  427,  426,
			  428,  428,  428,  428,  428,  428,  528,  572,  578,  478,
			  426,  600,  427,    0,    0,    0,  528,  425,  429,  429,
			  429,  429,  429,  429,    0,  571,  427,  426,  600,    0,
			    0,  578,  600,  428,  528,  572,  578,  478,  622,  426,
			  430,  430,  430,  430,  430,  430,  431,  431,  431,  431,
			  431,  431,  435,  435,    0,  435,  600,  436,  436,  625,
			  436,    0,  428,  447,  479,  435,  622,    0,  533,  430,
			  436,  437,  437,    0,  437,  431,  435,  438,  438,  533,
			  438,  436,  447,  479,  437,  439,  439,  625,  439,  533,

			  438,    0,    0,    0,  446,  437,    0,  447,  439,    0,
			    0,  438,  437,  436,    0,  438,    0,  533,    0,  439,
			  447,  479,    0,  446,  629,  441,  438,  441,  441,  441,
			  441,  441,  441,  441,  446,    0,  447,  449,  458,    0,
			  437,  436,  442,  438,  442,  442,  442,  442,  442,  442,
			  442,  446,  629,  467,  438,  459,  449,  458,  468,  474,
			  469,  483,  446,  475,  441,    0,    0,  449,  630,  486,
			  635,  458,  467,  541,  459,  636,  467,  468,  474,  469,
			  483,  442,  475,  637,  449,  458,  469,  459,  486,  474,
			  638,  468,  541,  475,  483,  449,  630,    0,  635,  458,

			  467,    0,  459,  636,  467,  468,  474,  469,  483,  484,
			  475,  637,    0,  550,  469,  459,  486,  474,  638,  468,
			  541,  475,  483,  544,    0,  550,  642,  484,  484,  488,
			  488,  488,  488,  488,  488,  489,  489,  489,  489,  489,
			  489,  550,  544,    0,  644,  488,  490,  490,  490,  490,
			  490,  490,  547,  550,  642,  484,  484,  491,  491,  491,
			  491,  491,  491,  493,  493,  493,  493,  493,  493,    0,
			  544,  547,  644,  488,  489,  645,  649,  650,  547,  493,
			  494,  494,  494,  494,  494,  494,  495,  495,  495,  495,
			  495,  495,  496,  496,  496,  496,  496,  496,    0,  547,

			    0,    0,  493,  645,  649,  650,  547,  493,  497,  497,
			  497,  497,  497,  497,  498,  498,  498,  498,  498,  498,
			  505,  505,    0,  505,    0,  495,  500,  500,  500,  500,
			  500,  500,  501,  505,  501,  501,  501,  501,  501,  501,
			  506,  506,  500,  506,  505,  507,  507,  497,  507,  508,
			  508,    0,  508,  506,  509,  509,    0,  509,  507,    0,
			    0,  651,  508,    0,  506,    0,  693,  509,    0,  507,
			  500,    0,  542,  508,  555,    0,  694,  507,  509,  510,
			  510,  552,  510,  511,  511,  509,  511,  560,  508,  651,
			    0,  542,  510,  555,  693,  506,  511,    0,  512,  512,

			  552,  512,    0,  510,  694,  507,  560,  511,    0,    0,
			  510,  512,  552,  509,  542,  511,  508,  513,  513,  542,
			  513,  555,  512,    0,  697,  564,    0,  511,  552,  548,
			  513,  709,  515,  515,  560,  515,  516,  516,  510,  516,
			  552,  513,    0,  511,  564,  515,    0,  548,  548,  516,
			  517,  517,  697,  517,  513,  511,  515,    0,  562,  709,
			  516,    0,  713,  517,  515,  518,  518,  516,  518,    0,
			  519,  519,  564,  519,  517,  548,  548,  562,  518,    0,
			    0,  562,  513,  519,  520,  520,  517,  520,    0,  518,
			  713,    0,  515,  551,  519,  516,    0,  520,    0,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  521,  521,  519,  521,  568,  562,    0,  561,  520,  562,
			    0,  551,  551,  521,  517,  523,  523,  523,  523,  523,
			  523,    0,  573,  568,  521,  561,  561,  520,  714,    0,
			  519,    0,  521,  524,  524,  524,  524,  524,  524,  551,
			  551,  573,    0,  715,  523,  525,  525,  525,  525,  525,
			  525,  568,    0,  561,  561,  520,  714,  526,    0,  526,
			  521,  526,  526,  526,  526,  526,  526,  529,  529,  573,
			  529,  715,  661,  525,  527,  527,  527,  527,  527,  527,
			  529,  530,  530,  526,  530,  531,  531,  574,  531,  526,
			  526,  529,    0,  567,  530,  661,  527,  624,  531,  529,

			  661,  525,  628,  627,  614,  530,  574,  532,  532,  531,
			  532,  526,  567,  530,    0,  614,  624,  526,  627,    0,
			  532,  628,  627,  567,  527,  614,    0,  529,  531,  593,
			  593,  532,  593,    0,  574,  588,  588,  588,  588,  588,
			  567,  530,  593,  614,  624,    0,  627,  532,    0,  628,
			  627,  567,  575,  593,  575,    0,  531,  575,  575,  575,
			  575,  575,  575,  576,  576,  576,  576,  576,  576,  577,
			  577,  577,  577,  577,  577,  532,  579,  579,  579,  579,
			  579,  579,  580,  580,  580,  580,  580,  580,  725,  725,
			  725,  725,  579,  581,  581,  581,  581,  581,  581,  632,

			  634,    0,  576,  582,  582,  582,  582,  582,  582,  583,
			  583,  583,  583,  583,  583,    0,  640,  747,  632,  634,
			  579,  580,  584,  584,  584,  584,  584,  584,  585,  585,
			  585,  585,  585,  585,  586,  640,  586,    0,    0,  586,
			  586,  586,  586,  586,  586,  747,  632,  634,  583,  587,
			  587,  587,  587,  587,  587,  590,  590,  590,  590,  590,
			  590,  592,  592,  640,  592,  646,  594,  594,    0,  594,
			    0,  590,    0,    0,  592,    0,  615,  748,  750,  594,
			  595,  595,  754,  595,  646,  592,  756,  615,  757,  592,
			  594,    0,    0,  595,  594,  596,  596,  615,  596,  590,

			  597,  597,    0,  597,  595,  748,  750,    0,  596,    0,
			  754,    0,  646,  597,  756,  615,  757,  592,  783,  596,
			  598,  598,  594,  598,  597,  599,  599,  596,  599,  601,
			  601,    0,  601,  598,  602,  602,    0,  602,  599,  597,
			  784,  652,  601,    0,  598,    0,  783,  602,    0,  599,
			    0,  603,  603,  601,  603,  596,  604,  604,  602,  604,
			  652,  788,  599,    0,  603,  616,  602,  597,  784,  604,
			  791,  605,  605,  601,  605,  603,  616,  807,  606,  606,
			  604,  606,    0,    0,  605,    0,  616,    0,  652,  788,
			  599,  606,    0,    0,  602,  605,  603,    0,  791,  633,

			  604,  601,  606,  605,  616,  807,  607,    0,  607,  606,
			  607,  607,  607,  607,  607,  607,  610,  610,  633,  610,
			  611,  611,  641,  611,  603,  633,    0,    0,  604,  610,
			  639,  605,  647,  611,  810,  612,  612,  606,  612,  607,
			  610,  641,  613,  613,  611,  613,  633,  677,  612,  639,
			  647,  647,  643,  633,  641,  613,  653,  672,  672,  612,
			  672,  639,  810,  611,  677,  612,  613,  684,  677,  641,
			  672,  643,    0,  613,  823,  653,    0,  639,  647,  647,
			    0,  672,  641,  643,  684,    0,  653,    0,  684,  639,
			    0,  611,  677,  612,  698,    0,    0,    0,    0,  643,

			  672,  613,  823,  653,  654,  654,  654,  654,  654,  654,
			    0,  643,  684,  698,  653,  655,  655,  655,  655,  655,
			  655,  656,  656,  656,  656,  656,  656,  657,  672,  657,
			    0,    0,  657,  657,  657,  657,  657,  657,  658,    0,
			  658,  698,    0,  658,  658,  658,  658,  658,  658,  659,
			  659,  659,  659,  659,  659,  660,  660,  660,  660,  660,
			  660,  662,  662,  662,  662,  662,  662,  663,  663,  663,
			  663,  663,  663,  665,  665,  665,  665,  665,  665,  666,
			  666,  666,  666,  666,  666,    0,    0,    0,  659,  667,
			  667,  667,  667,  667,  667,  669,  669,  669,  669,  669,

			  669,  782,  782,  828,  782,  673,  673,  670,  673,  670,
			  839,  669,  670,  670,  670,  670,  670,  670,  673,  674,
			  674,    0,  674,  675,  675,  782,  675,  676,  676,  673,
			  676,  828,  674,    0,  669,    0,  675,  848,  839,  669,
			  676,    0,  673,  674,    0,  678,  678,  675,  678,  679,
			  679,  676,  679,  675,  680,  680,    0,  680,  678,    0,
			  699,  704,  679,  681,  681,  848,  681,  680,    0,  678,
			  673,  682,  682,  679,  682,    0,  681,  699,  680,  699,
			  704,  675,  705,    0,  682,  683,  683,  681,  683,  685,
			  685,    0,  685,  686,  686,  682,  686,  706,  683,  695,

			  708,  705,  685,  680,    0,  699,  686,  699,  704,  683,
			  682,  687,  687,  685,  687,    0,  706,  686,  695,  708,
			  712,  685,  711,  695,  687,  858,  716,    0,  686,  705,
			    0,    0,  680,  706,  820,  687,  742,    0,  682,  712,
			  742,  711,  820,  687,  706,  716,  695,  708,  711,  685,
			    0,  695,    0,  858,    0,  820,  686,  742,    0,    0,
			    0,    0,  706,    0,    0,    0,    0,  712,  742,  711,
			  820,  687,    0,  716,    0,    0,  711,  718,  718,  718,
			  718,  718,  718,  719,  719,  719,  719,  719,  719,  720,
			  720,  720,  720,  720,  720,  721,  721,  721,  721,  721,

			  721,  722,  722,  722,  722,  722,  722,  723,    0,  723,
			    0,    0,  723,  723,  723,  723,  723,  723,  727,  727,
			  727,  727,  719,  726,  726,  726,  726,  726,  726,  728,
			  728,  728,  728,  728,  728,  729,  729,  729,  729,  729,
			  729,  732,  732,    0,  732,  728,  730,  730,  730,  730,
			  730,  730,    0,    0,  732,  751,    0,  727,    0,  733,
			  733,    0,  733,    0,    0,  732,  734,  734,  728,  734,
			    0,  732,  733,  728,  751,  738,    0,    0,    0,  734,
			    0,  736,  736,  733,  736,  730,    0,    0,  737,  737,
			  734,  737,  738,  743,  736,  733,  738,  743,  734,  732,

			    0,  737,  751,  739,  739,  736,  739,    0,  740,  740,
			    0,  740,  737,    0,  743,  744,  739,    0,  737,  744,
			  738,  740,    0,  733,  753,  743,  734,  739,  741,  741,
			  749,  741,  740,  745,  739,  778,  744,  745,  755,  778,
			  740,  741,  759,  753,    0,    0,  737,  744,    0,  749,
			    0,    0,  741,  749,  745,  755,  778,  755,    0,    0,
			  759,  759,  739,  773,  773,  745,  773,  778,  740,    0,
			    0,  753,    0,    0,    0,    0,  773,  749,    0,    0,
			    0,  749,    0,  755,    0,  755,    0,  773,  759,  759,
			  760,  760,  760,  760,  760,  760,  762,  762,  762,  762, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  762,  762,  763,  763,  763,  763,  763,  763,  764,  764,
			  764,  764,  764,  764,  765,  765,  765,  765,  765,  765,
			  766,  766,  766,  766,  766,  766,    0,    0,    0,  760,
			  767,  767,  767,  767,  767,  767,  771,  771,    0,  771,
			    0,  763,  769,  769,  769,  769,  769,  769,    0,  771,
			  772,  772,  779,  772,  774,  774,  779,  774,    0,    0,
			  771,  787,  780,  772,  781,    0,  780,  774,  781,  776,
			  776,  771,  776,  779,  772,    0,  777,  777,  774,  777,
			  787,  769,  776,  780,  779,  781,  774,  785,  789,  777,
			  792,  856,    0,  776,  780,  772,  781,  809,  825,  771,

			  777,    0,  856,  827,    0,    0,  785,  789,  787,  792,
			    0,    0,  856,    0,  774,    0,  809,  825,    0,  785,
			    0,  777,  827,  772,  793,  793,  793,  793,  793,  793,
			  856,    0,    0,  809,  785,  789,    0,  792,  795,  795,
			  795,  795,  795,  795,  809,  825,  796,  785,  796,  777,
			  827,  796,  796,  796,  796,  796,  796,  798,  798,  811,
			  798,    0,  809,  793,  799,  799,    0,  799,    0,    0,
			  798,  800,  800,    0,  800,    0,    0,  799,  811,  801,
			  801,  798,  801,  821,  800,  796,    0,    0,  799,  798,
			  811,  821,  801,    0,    0,  800,  814,  814,  814,  814,

			  814,  814,    0,  801,  821,    0,  811,  816,  816,    0,
			  816,  817,  817,  799,  817,  800,    0,  798,  811,  821,
			  816,    0,    0,    0,  817,    0,  818,  818,  801,  818,
			    0,  816,    0,    0,  822,  817,    0,    0,    0,  818,
			    0,    0,  799,  800,    0,  819,  819,  822,  819,    0,
			  818,    0,  816,  833,  833,  822,  833,  801,  819,  829,
			  829,  829,  829,  829,  829,    0,  833,    0,  822,  819,
			  830,  830,  830,  830,  830,  830,  837,  833,    0,  835,
			  816,  834,  834,  822,  834,  836,  819,  835,  840,  837,
			  840,    0,    0,  836,  834,    0,  866,  837,  866,  840,

			  835,  857,  833,    0,    0,  834,  836,  866,    0,    0,
			  837,    0,  857,  834,  819,  835,  842,  842,  842,  842,
			  842,  836,  857,  843,  843,  837,  843,  840,    0,  844,
			  844,  833,  844,    0,    0,  866,  843,    0,    0,    0,
			  857,  834,  844,  880,  880,  880,  880,  843,  851,  851,
			  851,  851,  851,  844,  850,  850,  850,  850,  850,  850,
			    0,    0,  862,    0,  843,  854,  854,  854,  854,  854,
			  854,  855,  855,  862,  855,  859,  859,  859,  859,  859,
			  859,    0,  880,  862,  855,  860,  860,  860,  860,  860,
			  860,  863,  843,  861,  861,  855,  861,    0,    0,    0,

			    0,  862,  863,  855,    0,    0,  861,  871,  871,  871,
			  871,  871,  863,    0,    0,    0,    0,  861,  865,  865,
			  865,  865,  865,  865,  869,  869,  869,  869,  869,  869,
			  863,  855,  870,  870,  870,  870,  870,  870,  873,  874,
			  875,  875,  875,  875,  875,  875,  876,  876,  876,  876,
			  876,  876,  877,  878,    0,  873,  874,    0,    0,  873,
			  874,  879,  879,  879,  879,  879,  879,    0,    0,  877,
			  878,    0,    0,  877,  878,  883,  883,  883,  883,  883,
			  883,    0,    0,  873,  874,  884,  884,  884,  884,  884,
			  884,  885,  885,  885,  885,  885,  885,  877,  878,  887,

			  887,  887,  887,  887,  887,  888,    0,  888,    0,    0,
			  888,  888,  888,  888,  888,  888,  889,  889,  889,  889,
			  889,  889,  890,  890,  890,  890,  890,  890,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  888,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  893,  893,  893,

			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,

			  894,  895,  895,    0,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			    0,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  896,  896,    0,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,

			  896,  896,  896,  896,  896,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  898,  898,
			  898,    0,    0,    0,    0,    0,    0,    0,  898,  898,
			  898,  898,    0,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,    0,    0,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  899,  899,    0,
			  899,  899,    0,  899,  899,  899,    0,    0,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,    0,    0,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  900,  900,    0,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  901,  901,    0,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,    0,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  904,    0,  904,    0,    0,    0,    0,  904,  904,    0,
			  904,  904,  904,    0,    0,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,    0,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  907,  907,    0,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  908,    0,    0,    0,    0,
			  908,  908,  908,    0,    0,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,    0,    0,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,

			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			    0,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  911,    0,    0,    0,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,

			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,    0,    0,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,    0,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,

			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  914,  914,  914,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  914,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,

			  915,  915,  915,    0,    0,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  917,  917,  917,    0,
			    0,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,    0,    0,  917,  917,  917,  917,

			  917,  917,  917,  917,  917,  918,    0,  918,    0,    0,
			    0,    0,  918,  918,    0,  918,  918,  918,    0,    0,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,    0,    0,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  919,  919,  919,    0,    0,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,    0,    0,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,    0,    0,  919,  919,  919,  919,  919,

			  919,  919,  919,  919,  920,    0,  920,    0,    0,    0,
			    0,  920,  920,    0,  920,  920,  920,    0,    0,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,    0,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,    0,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  921,  921,  921,  921,  921,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,    0,    0,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  923,
			  923,  923,    0,    0,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,    0,    0,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,

			  924,  925,    0,    0,    0,    0,  925,  925,  925,    0,
			    0,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,    0,    0,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  926,  926,  926,  926,  926,    0,    0,
			  926,  926,  926,  926,  926,  926,  926,  926,  926,  927,
			  927,  927,    0,    0,  927,  927,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,

			  927,  927,  927,  927,  927,  927,  927,    0,    0,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,    0,    0,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  929,  929,  929,    0,    0,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			    0,    0,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891, yy_Dummy>>,
			1, 384, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,  187,    0,   67,
			   71, 1377, 6291,   99, 1364, 1321, 1337, 6291,   91,    0,
			 6291, 6291, 6291, 6291, 1328,   89, 1290,   99,  120, 6291,
			 6291, 1275, 6291, 1270, 1258,  278,  282,  288,  121,  298,
			  326,  333,  348,  304,  337,  355,  427,  399,  364,  409,
			  460, 1225, 6291, 6291, 1225,  539,  618,  341,   91,  392,
			  427,  258,  441,  264,   93,  361,  456,  450,   95,  281,
			 1232, 6291, 6291, 1238,  156, 6291,  121,  413,  289,  445,
			  305,  448,  332, 6291,   97,  365, 6291,  422, 1234,  511,
			  540, 6291,   88,  697, 6291,  162, 1230, 6291, 1185, 6291,

			 1174,    0,  696, 1165, 1157, 1140,  733, 6291,  611,  739,
			  763,  688,  784, 6291, 6291, 6291,  619,  773,    0,  806,
			  810,  814,  828,  843,  857,  863,  882,  891,  877,  908,
			  923,  938,  942,  957,  974,  982,  990, 1038, 1010, 1015,
			 1117, 1035, 1108, 1143, 1099, 1041, 1147, 1169, 1184, 1127,
			  442, 1078, 6291,  300, 1113, 1250, 1098,   99,  109,  264,
			  458, 1197,  776,  489,  610,  374,  940,  368,  398,  856,
			 1024,  434,  790,  973, 1164,  455,  482, 1188,  890, 1089,
			  840,  496,  807, 1053, 1163, 1206, 1189,  517, 1213,  599,
			 1214,  641,  731, 1238, 1224,  732,  720,  842, 1229,  940,

			  790, 1316, 1011,  888, 1228,  231, 1317, 6291, 1083, 6291,
			  168, 6291, 6291, 1204, 1081, 1193, 1249, 1260,  937, 6291,
			 1020, 1016,  772, 1017,  780, 1006, 6291,  719, 1139, 6291,
			 1031, 1335,  157, 1397,  284,  271, 1488, 6291, 6291, 1001,
			 1336, 6291, 6291, 6291, 1019, 1352, 1002,  977,  962,  947,
			 1095,  548, 6291, 1523, 1479, 1373, 1485, 6291, 1529, 1546,
			 1556, 1491, 1574, 6291,    0,  918, 1585, 1599, 1350, 1603,
			 1607, 1629, 1633, 1648, 1655, 1674, 1681, 1614, 1706, 1711,
			 1720, 1725, 1739, 1754, 1759, 1774, 1774, 1799, 1808, 1819,
			 1829, 1838, 1844, 1854, 1853, 1808, 1878, 1882, 1900, 1927,

			 1931, 1945, 1953, 1961, 1978,  907, 1976, 1993, 6291,  904,
			  905,  939,    0, 1891, 2003, 1050, 1986, 1237,  954, 1993,
			  994,  985, 1657, 2015, 1029, 1038, 1034, 1327, 1721, 2016,
			 1035,  862, 2018, 1631, 2017, 1094, 1103, 1127, 1216, 1905,
			 2026, 1883, 1324, 2036,    0, 1637, 1309, 1325, 2025, 1690,
			 1512, 1520, 2038, 1719, 1511, 1511,  843, 2032, 1854, 1920,
			    0, 1753,  463, 2068, 1899,  371, 1952,  540, 1958, 2025,
			 2029,  709, 6291,  831,  858, 2103, 6291, 1301, 1378,  834,
			 1621, 6291, 6291, 2103, 6291, 6291, 6291, 6291, 6291, 2113,
			 2119, 2131, 2141, 2158, 2164, 2181, 2187, 2193, 2209, 2218,

			 2224, 2230,    0,  790, 2252, 2141, 2256, 2260, 2274, 2278,
			 2304, 2308, 2312, 2330, 2244, 2338, 2346, 2360, 2364, 2382,
			 2397, 2411, 2430, 2418, 2398, 2459, 2469, 2475, 2492, 2510,
			 2532, 2538, 2415, 2459, 2328, 2560, 2565, 2579, 2585, 2593,
			  718, 2609, 2626,    0, 1544,  795, 2589, 2558, 1554, 2622,
			 1590, 1632, 2254, 2158,    0, 1630, 1692, 2288, 2623, 2640,
			 1713, 1740, 2377, 1746, 1757, 1775, 1900, 2638, 2643, 2645,
			 1937, 2406, 1933, 2009, 2644, 2648,    0,    0, 2485, 2559,
			 2021, 2038, 2301, 2646, 2694,  799, 2654, 6291, 2711, 2717,
			 2728, 2739,  779, 2745, 2762, 2768, 2774, 2790, 2796,  150,

			 2808, 2816, 2272,  578,  757, 2818, 2838, 2843, 2847, 2852,
			 2877, 2881, 2896, 2915,  746, 2930, 2934, 2948, 2963, 2968,
			 2982, 2998, 6291, 2997, 3015, 3027, 3043, 3056, 2476, 3065,
			 3079, 3083, 3105, 2549,  893,  910, 1637, 6291, 1090,    0,
			  665, 2658, 2857, 2041, 2708, 2040, 2094, 2737, 2914, 2096,
			 2679, 2978, 2866,    0, 2126, 2859, 2135, 2156, 2157,    0,
			 2872, 2992, 2943, 2240, 2910, 2245, 2320, 3078, 2989, 2347,
			 2369, 2462, 2475, 3007, 3072, 3139, 3145, 3151, 2484, 3158,
			 3164, 3175, 3185, 3191, 3204, 3210, 3221, 3231, 3117, 6291,
			 3237,    0, 3259, 3127, 3264, 3278, 3293, 3298, 3318, 3323,

			 2492, 3327, 3332, 3349, 3354, 3369, 3376, 3392, 6291,  689,
			 3414, 3418, 3433, 3440, 3075, 3247, 3336,  967, 6291, 6291,
			 1361, 2405, 2518,    0, 3082, 2539,    0, 3088, 3087, 2590,
			 2627,    0, 3184, 3384, 3185, 2631, 2629, 2649, 2643, 3415,
			 3201, 3407, 2680, 3437, 2710, 2742, 3250, 3417,    0, 2731,
			 2745, 2828, 3326, 3441, 3486, 3497, 3503, 3514, 3525, 3531,
			 3537, 3038, 3543, 3549,  697, 3555, 3561, 3571, 6291, 3577,
			 3594,    0, 3455, 3603, 3617, 3621, 3625, 3418, 3643, 3647,
			 3652, 3661, 3669, 3683, 3438, 3687, 3691, 3709,  632,  578,
			  553,  533,    0, 2821, 2837, 3684,    0, 2892, 3479, 3645,

			    0,    0,    0,  856, 3646, 3667, 3682,    0, 3685, 2890,
			    0, 3707, 3705, 2928, 2991, 3009, 3711,  480, 3759, 3765,
			 3771, 3777, 3783, 3794,  449, 3170, 3805, 3805, 3811, 3817,
			 3828,  467, 3839, 3857, 3864, 6291, 3879, 3886, 3846, 3901,
			 3906, 3926, 3707, 3864, 3886, 3904,  459, 3185, 3239, 3915,
			 3244, 3840,    0, 3909, 3250, 3923, 3253, 3254,    0, 3927,
			 3972,  399, 3978, 3984, 3990, 3996, 4002, 4012, 6291, 4024,
			    0, 4034, 4048, 3961, 4052, 6291, 4067, 4074, 3906, 4023,
			 4033, 4035, 3599, 3281, 3293, 4072,    0, 4046, 3327, 4073,
			    0, 3323, 4075, 4106,  396, 4120, 4133,    0, 4155, 4162,

			 4169, 4177,  392, 6291, 1185,  367, 6291, 3343,  900, 4082,
			 3388, 4144, 1156, 1859, 4178,  357, 4205, 4209, 4224, 4243,
			 3705, 4154, 4218, 3427,    0, 4083,    0, 4088, 3560, 4241,
			 4252,    0,  287, 4251, 4279, 4250, 4256, 4260, 1282, 3576,
			 4275,    0, 4297, 4321, 4327,  309,  297,  522, 3594,    0,
			 4336, 4330, 6291,  688, 4347, 4369, 4062, 4272, 3691, 4357,
			 4367, 4391, 4333, 4362,    0, 4400, 4283,  264,   82, 4406,
			 4414, 4389, 6291, 4409, 4410, 4422, 4428, 4423, 4424, 4443,
			 4330, 6291, 6291, 4457, 4467, 4473, 6291, 4481, 4492, 4498,
			 4504, 6291, 4544, 4596, 4648, 4700, 4752, 4788, 4826, 4871,

			 4921, 4973, 5025, 5077, 5128, 5178, 5230, 5282, 5328, 5378,
			 5430, 5475, 5525, 5577, 5628, 5663, 5713, 5754, 5803, 5853,
			 5902, 5952, 5988, 6027, 6061, 6094, 6128, 6167, 6201, 6240, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  891,    1,  892,  892,  893,  893,  891,    7,  894,
			  894,  891,  891,  891,  891,  891,  895,  891,  896,  897,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  899,  891,  891,  900,  891,  891,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			  891,  891,  891,  901,  891,  891,  891,  901,  901,  901,
			  901,  901,  902,  891,  903,  902,  891,  904,  891,  904,
			  904,  891,  905,  906,  891,  891,  891,  891,  895,  891,

			  907,  907,  907,  908,  909,  891,  891,  891,  891,  910,
			  891,  891,  891,  891,  891,  891,  891,  898,  911,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,   46,  898,  898,
			  898,  898,   46,  898,  898,  898,  898,  898,  898,  899,
			  899,  900,  891,  891,  891,   56,  891,  155,  155,  155,
			   56,   56,   56,   56,   56,  155,   56,  155,  155,   56,
			   56,  155,  155,   56,   56,  155,  155,   56,   56,  155,
			   56,  155,  155,  155,   56,   56,   56,  155,   56,  155,
			   56,  155,  155,   56,   56,  155,  155,   56,   56,  155,

			  155,   56,   56,  155,   56,  155,   56,  891,  901,  891,
			  891,  891,  891,  901,  901,  901,  901,  901,  902,  891,
			  912,  902,  903,  913,  903,  912,  891,  904,  904,  891,
			  891,  891,  891,  891,  891,  905,  906,  891,  891,  236,
			  914,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  915,  911,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  891,  898,  898,
			  898,  898,  898,  898,  898,  898,  891,  898,  287,  287,
			  287,  287,  140,  140,  140,  898,  898,  898,  898,  898,

			  898,  898,  898,  898,  898,  891,  899,  899,  891,  891,
			  155,  155,  155,  891,  155,   56,   56,   56,  155,   56,
			  155,  155,   56,   56,  155,  155,  155,   56,   56,   56,
			  155,  155,   56,   56,  891,  155,  155,  155,  155,   56,
			   56,   56,  155,   56,  155,   56,  155,  155,   56,   56,
			  155,  155,   56,   56,  155,  155,  155,   56,   56,   56,
			  155,   56,  155,   56,  901,  901,  901,  901,  901,  901,
			  901,  912,  891,  913,  916,  916,  891,  916,  916,  916,
			  914,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  917,  911,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  891,  898,  898,  898,  898,  898,
			  898,  898,  891,  287,  140,  287,  137,  287,  137,  891,
			  287,  287,  898,  898,  891,  898,  898,  898,  898,  898,
			  918,  899,  899,  919,  155,  155,   56,   56,  155,   56,
			  155,  155,   56,   56,  155,  155,  155,   56,   56,   56,
			  155,  155,   56,  155,  155,  155,  155,   56,   56,   56,
			  155,   56,  155,  155,   56,   56,  155,  155,   56,   56,
			  155,  155,  155,   56,   56,  155,   56,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  910,  891,  891,  891,  917,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  891,  898,  898,  898,  898,  898,
			  898,  898,  891,  287,  287,  891,  287,  526,  891,  898,
			  898,  898,  898,  915,  891,  920,  918,  891,  891,  155,
			  155,   56,   56,  155,   56,  155,  155,   56,   56,  155,
			  155,   56,   56,  155,  155,   56,  155,  155,  155,  155,
			   56,   56,   56,  155,   56,  155,  155,   56,   56,  155,
			  155,  155,  155,   56,   56,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  921,  922,  898,  898,  898,  898,  898,  898,  898,  898,

			  891,  898,  898,  898,  898,  898,  898,  287,  891,  891,
			  898,  898,  898,  898,  891,  917,  917,  920,  891,  891,
			  891,  891,  155,  155,   56,  155,  155,   56,   56,  155,
			  155,  155,   56,   56,   56,  155,  155,  155,  155,   56,
			   56,   56,  155,   56,  155,  155,   56,   56,  155,  155,
			  155,  155,   56,   56,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  923,  898,  898,  898,  898,  898,  891,  898,  898,
			  898,  898,  898,  898,  891,  898,  898,  898,  891,  891,
			  917,  917,  924,  155,  155,   56,  155,  155,   56,   56,

			  155,  155,  155,  155,   56,   56,   56,  155,   56,  155,
			  155,   56,   56,  155,  155,  155,   56,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  923,  898,  898,  898,  891,  898,  898,  891,  898,
			  898,  898,  891,  891,  922,  922,  925,  155,  155,   56,
			  155,   56,  155,   56,  155,   56,  155,  155,  155,   56,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  926,  898,  898,  898,  898,  891,  898,  898,  891,  891,
			  923,  923,  891,  155,  155,   56,  155,   56,  155,   56,
			  155,  155,   56,  891,  891,  891,  891,  927,  898,  898,

			  898,  898,  891,  891,  923,  923,  891,  155,  155,   56,
			  155,   56,  155,  891,  891,  927,  898,  898,  898,  898,
			  891,  891,  923,  155,  155,   56,  155,   56,  155,  891,
			  891,  928,  891,  898,  898,  891,  891,  923,  155,  155,
			  891,  929,  891,  898,  898,  891,  891,  923,  155,  155,
			  891,  891,  891,  929,  891,  898,  891,  891,  155,  891,
			  891,  898,  891,  891,  155,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,    0,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
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

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,   10,   11,   12,   12,
			   12,   12,   13,   14,    1,    1,   15,    1,   16,    1,
			   17,   18,   19,   20,   21,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,    5,   40,   41,    5,   12,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   43,   44,   45,   46,   47,   48,   49,
			   50,    5,    5,   51,   52,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  103,  103,    0,    0,    0,
			    0,  135,  133,    1,    2,   15,  117,   18,  133,   16,
			   17,    7,    6,   13,    5,   11,    8,  108,  108,   14,
			   12,   29,   10,   30,   20,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   83,   98,   98,   98,
			   98,   22,   31,   23,    9,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			   24,   21,   25,  121,  122,  123,  124,  121,  121,  121,
			  121,  121,  103,  106,  134,  103,  134,  134,   70,  134,
			  134,   72,  134,  134,   97,    1,    2,   28,  117,  116,

			  131,  131,  131,    0,    3,   33,  112,   32,    0,    0,
			  108,    0,  108,   27,   26,   19,    0,   98,   92,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   40,   98,   91,   91,
			   82,   91,   91,   98,   98,   98,   98,   98,   98,    0,
			    0,    0,  107,    0,    0,  101,    0,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,   40,  101,   40,  101,  101,  101,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  102,  121,  123,
			  122,  119,  118,  120,  121,  121,  121,  121,  103,  106,
			    0,  103,    0,    0,    0,  104,  105,    0,    0,   72,
			   70,    0,   69,    0,   68,    0,    0,   97,   95,   95,
			    0,   96,  131,  125,  131,  131,  131,  131,  131,  131,
			    0,    4,   34,  112,    0,    0,    0,  110,  112,  110,
			  108,    0,    0,   92,    0,    0,   98,   98,   39,   98,
			   98,   98,   98,   98,   98,   98,   98,    0,   98,   98,
			   98,   98,   98,   42,   98,   98,    0,   83,   84,   83,
			   83,   83,   90,   98,   90,   90,   90,   98,   98,   98,

			   98,   98,   98,   41,   98,    0,    0,    0,  100,    0,
			  101,  101,   39,   73,   73,  101,  101,   39,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,    0,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,   42,   42,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			   41,   41,  101,  101,  121,  121,  121,  121,  121,  121,
			  121,    0,  104,  105,    0,    0,   71,   69,   68,   72,
			    0,  129,  132,  132,  130,  126,  127,  128,   93,  112,
			    0,  112,    0,    0,  112,    0,    0,    0,  111,  108,

			    0,    0,    0,   99,   98,   98,   98,   98,   98,   38,
			   98,   98,   98,   98,    0,   98,   98,   98,   98,   98,
			   98,   98,    0,   98,   82,   98,   98,   98,   98,    0,
			   82,   82,   82,   37,    0,   44,   98,   98,   98,   98,
			   67,    0,    0,   63,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,   38,  101,  101,   38,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,   37,   44,   37,   44,
			  101,  101,  101,  101,  101,  101,  101,  105,  112,  112,
			    0,    0,  109,  112,    0,  111,    0,  111,    0,    0,

			    0,  108,   79,    0,    0,   60,   98,   98,   98,   98,
			   98,   98,   45,   98,    0,   98,   98,   98,   36,   98,
			   98,   98,   84,   84,   83,    0,   98,   98,    0,   98,
			   98,   98,   98,    0,   67,   67,    0,   66,   66,   60,
			  101,   60,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,   45,  101,   45,  101,  101,  101,   36,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,    0,  112,    0,  115,  112,
			  111,    0,    0,  111,    0,    0,  110,    0,    0,   79,
			    0,    0,   98,   61,   98,   62,   98,   98,   47,   98,

			    0,   98,   98,   98,   98,   98,   98,   98,   82,    0,
			   53,   98,   98,   98,    0,    0,    0,    0,   65,   64,
			    0,    0,  101,   61,   61,  101,   62,  101,   62,  101,
			  101,   47,  101,  101,   47,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,   53,  101,
			  101,  101,   53,  101,    0,  112,    0,    0,    0,  111,
			    0,  115,  111,    0,   81,    0,    0,    0,  113,  115,
			  113,    0,   98,   98,   59,   98,   46,    0,   43,   58,
			   98,   35,   98,   51,    0,   98,   98,   98,    0,    0,
			    0,    0,    0,  101,  101,  101,   59,  101,   59,  101,

			   46,   43,   58,  101,   43,   58,  101,   35,   35,  101,
			   51,  101,   51,  101,  101,  101,  101,  115,    0,  115,
			    0,  111,    0,    0,  114,    0,    0,   78,  115,    0,
			  114,    0,   98,   98,   98,   87,   54,   98,    0,   98,
			   98,   55,    0,    0,    0,    0,    0,  101,  101,  101,
			  101,  101,   54,   54,  101,  101,  101,  101,   55,  101,
			  115,  114,    0,  114,    0,    0,    0,    0,   78,  114,
			    0,   98,   98,   48,   98,   86,   52,   98,    0,    0,
			    0,    0,    0,  101,  101,  101,   48,   48,  101,  101,
			   52,  101,   52,  114,   80,    0,   78,    0,   98,   98,

			   98,   98,   85,   85,   85,   85,   94,  101,  101,  101,
			  101,  101,  101,    0,    0,    0,   98,   50,   49,   98,
			    0,    0,    0,  101,   50,   50,   49,   49,  101,    0,
			    0,    0,    0,   98,   98,    0,    0,    0,  101,  101,
			   77,    0,    0,   98,   56,    0,    0,    0,  101,   56,
			    0,    0,   77,    0,   74,   98,    0,    0,  101,    0,
			    0,   57,    0,    0,   57,    0,   76,    0,    0,    0,
			    0,    0,   76,    0,    0,    0,    0,    0,    0,    0,
			   75,   88,   89,    0,    0,    0,   75,    0,   75,    0,
			    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6291
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 891
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 892
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

	yyNb_rules: INTEGER = 134
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 135
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_REGEXP1: INTEGER = 2
	IN_TERM_CONSTRAINT: INTEGER = 3
	IN_C_DOMAIN_TYPE: INTEGER = 4
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

feature -- Commands

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
			validator_reset
		end

	validate
		do
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

	dadl_parser: DADL_VALIDATOR
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
