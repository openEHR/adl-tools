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
if yy_act <= 66 then
if yy_act <= 33 then
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
if yy_act <= 25 then
if yy_act <= 21 then
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
if yy_act = 20 then
--|#line 111 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 111")
end
last_token := Question_mark_code
else
--|#line 113 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 113")
end
last_token := SYM_INTERVAL_DELIM
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 115 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 115")
end
last_token := Left_bracket_code
else
--|#line 116 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 116")
end
last_token := Right_bracket_code
end
else
if yy_act = 24 then
--|#line 118 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 118")
end
last_token := SYM_START_CBLOCK
else
--|#line 119 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 119")
end
last_token := SYM_END_CBLOCK
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 121 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 121")
end
last_token := SYM_GE
else
--|#line 122 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 122")
end
last_token := SYM_LE
end
else
if yy_act = 28 then
--|#line 123 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 123")
end
last_token := SYM_NE
else
--|#line 125 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 125")
end
last_token := SYM_LT
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 126 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 126")
end
last_token := SYM_GT
else
--|#line 128 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 128")
end
last_token := SYM_MODULO
end
else
if yy_act = 32 then
--|#line 129 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 129")
end
last_token := SYM_DIV
else
--|#line 131 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 131")
end
last_token := SYM_ELLIPSIS
end
end
end
end
end
else
if yy_act <= 50 then
if yy_act <= 42 then
if yy_act <= 38 then
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 132 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 132")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 136 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 136")
end
last_token := SYM_MATCHES
end
else
--|#line 138 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 138")
end
last_token := SYM_MATCHES
end
else
if yy_act = 37 then
--|#line 142 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 142")
end
last_token := SYM_THEN
else
--|#line 144 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 144")
end
last_token := SYM_ELSE
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 146 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 146")
end
last_token := SYM_AND
else
--|#line 148 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 148")
end
last_token := SYM_OR
end
else
if yy_act = 41 then
--|#line 150 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 150")
end
last_token := SYM_XOR
else
--|#line 152 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 152")
end
last_token := SYM_NOT
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 154 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 154")
end
last_token := SYM_IMPLIES
else
--|#line 156 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 156")
end
last_token := SYM_TRUE
end
else
if yy_act = 45 then
--|#line 158 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 158")
end
last_token := SYM_FALSE
else
--|#line 160 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 160")
end
last_token := SYM_FORALL
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 162 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 162")
end
last_token := SYM_EXISTS
else
--|#line 166 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 166")
end
last_token := SYM_EXISTENCE
end
else
if yy_act = 49 then
--|#line 168 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 168")
end
last_token := SYM_OCCURRENCES
else
--|#line 170 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 170")
end
last_token := SYM_CARDINALITY
end
end
end
end
else
if yy_act <= 58 then
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act = 51 then
--|#line 172 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 172")
end
last_token := SYM_ORDERED
else
--|#line 174 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 174")
end
last_token := SYM_UNORDERED
end
else
if yy_act = 53 then
--|#line 176 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 176")
end
last_token := SYM_UNIQUE
else
--|#line 178 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 178")
end
last_token := SYM_INFINITY
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 180 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 180")
end
last_token := SYM_USE_NODE
else
--|#line 182 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 182")
end
last_token := SYM_USE_ARCHETYPE
end
else
if yy_act = 57 then
--|#line 184 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 184")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 186 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 186")
end
last_token := SYM_INCLUDE
end
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
--|#line 188 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 188")
end
last_token := SYM_EXCLUDE
else
--|#line 190 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 190")
end
last_token := SYM_AFTER
end
else
if yy_act = 61 then
--|#line 192 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 192")
end
last_token := SYM_BEFORE
else
--|#line 194 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 194")
end
last_token := SYM_CLOSED
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 197 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 197")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 203 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 203")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 65 then
--|#line 208 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 208")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 215 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 215")
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
if yy_act <= 99 then
if yy_act <= 83 then
if yy_act <= 75 then
if yy_act <= 71 then
if yy_act <= 69 then
if yy_act <= 68 then
if yy_act = 67 then
--|#line 231 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 231")
end

				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			
else
--|#line 239 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 239")
end
 -- match second last line with ';' termination (assumed value)
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			
end
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
if yy_act = 70 then
--|#line 253 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 253")
end
in_lineno := in_lineno + text_count
else
--|#line 256 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 256")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
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
			
else
--|#line 279 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 279")
end

				last_token := V_LOCAL_CODE
				last_string_value := text
		
end
else
if yy_act = 74 then
--|#line 285 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 285")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 292 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 292")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act = 76 then
--|#line 293 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 293")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 294 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 294")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 78 then
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 302 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 302")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 309 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 309")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 310 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 310")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 82 then
--|#line 317 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 317")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 318 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 318")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 91 then
if yy_act <= 87 then
if yy_act <= 85 then
if yy_act = 84 then
--|#line 325 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 325")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 337 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 337")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 86 then
--|#line 347 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 347")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 352 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 352")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 89 then
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
else
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
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
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
else
if yy_act = 94 then
--|#line 406 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 406")
end
	-- match a pattern like '["at0004"] = (Type_Identifier) whitespace <'
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
end
else
if yy_act <= 97 then
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
else
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
end
end
end
end
else
if yy_act <= 116 then
if yy_act <= 108 then
if yy_act <= 104 then
if yy_act <= 102 then
if yy_act <= 101 then
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
else
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 103 then
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end
 		-- match any segments with quoted slashes '\/'
				in_buffer.append_string (text)
			
else
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
end
 		-- match final segment
				in_buffer.append_string (text)
				unread_character (in_buffer.item(in_buffer.count)) -- put back the last character - '}'
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
 			
end
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 513 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 513")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 520 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 520")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 107 then
--|#line 525 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 525")
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
--|#line 540 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 540")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 112 then
if yy_act <= 110 then
if yy_act = 109 then
--|#line 541 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 541")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 542 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 542")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 111 then
	yy_end := yy_end - 1
--|#line 546 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 546")
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
--|#line 547 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 547")
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
if yy_act <= 114 then
if yy_act = 113 then
--|#line 548 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 548")
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
--|#line 568 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 568")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 573 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 573")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 581 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 581")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 124 then
if yy_act <= 120 then
if yy_act <= 118 then
if yy_act = 117 then
--|#line 583 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 583")
end
in_buffer.append_character ('"')
else
--|#line 585 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 585")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 589 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 589")
end
in_buffer.append_string (text)
else
--|#line 591 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 591")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 596 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 596")
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
--|#line 607 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 607")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 616 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 616")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 618 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 618")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 619 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 619")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 620 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 620")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 621 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 621")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 622 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 622")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 624 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 624")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 625 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 625")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 629 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 629")
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
			create an_array.make (0, 6240)
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
			    0,   14,   15,   16,   15,   15,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   29,
			   29,   30,   30,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   40,   41,   42,   40,   43,   44,   40,
			   45,   46,   47,   48,   40,   40,   40,   49,   50,   40,
			   51,   52,   40,   53,   54,   55,   56,   14,   57,   58,
			   59,   60,   61,   62,   60,   63,   64,   60,   65,   66,
			   67,   60,   60,   60,   60,   68,   69,   60,   60,   70,
			   71,   72,   73,   74,   14,   14,   14,   14,   14,   14,
			   14,   14,   14,   76,   85,   85,   94,   77,   76,   94,

			  102,   96,   77,   96,   96,  106,  884,  107,  107,  107,
			  107,  107,  107,  109,  233,  110,  212,  111,  111,  111,
			  111,  111,  111,  117,  117,  168,  117,  156,  220,  156,
			  223,   86,   86,  109,  169,  110,  307,  113,  113,  113,
			  113,  113,  113,  156,   78,  103,  180,  119,  359,   78,
			  867,   95,  866,  170,   95,  161,  112,  161,  211,  611,
			  211,  211,  171,  213,  307,  221,  850,  221,  849,  234,
			   96,  161,   96,   96,  181,  835,  112,  359,   79,   80,
			   81,   82,   83,   79,   80,   81,   82,   83,   87,   88,
			   89,   87,   88,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   90,   91,   87,   91,   91,   91,   91,   91,
			   91,   87,   87,   87,   87,   87,   87,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   87,   87,   92,   87,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			  117,  117,  308,  117,  117,  117,  211,  117,  211,  211,
			  117,  117,  210,  117,  188,  309,  224,  156,  156,  224,

			  117,  117,  763,  117,  119,  190,  117,  117,  119,  117,
			  308,  578,  578,  120,  119,  156,  123,  121,  124,  122,
			  824,  825,  189,  309,  119,  161,  161,  125,  117,  117,
			  119,  117,  206,  191,  134,  117,  117,  126,  117,  117,
			  117,  120,  117,  161,  123,  121,  124,  122,  127,  226,
			  117,  117,  119,  117,  315,  125,  128,  117,  117,  119,
			  117,  207,  134,  119,  317,  126,  117,  117,  129,  117,
			  130,  318,  215,  302,  119,  156,  210,  127,  806,  135,
			  172,  119,  315,  229,  128,  321,  229,  136,  131,  132,
			  119,  173,  317,  192,  133,  156,  129,  479,  130,  318,

			  137,  117,  117,  161,  117,  146,  193,  135,  174,  303,
			  147,  117,  117,  321,  117,  136,  131,  132,  574,  210,
			  175,  194,  133,  161,  304,  119,  479,  775,  137,  117,
			  117,  327,  117,  146,  195,  119,  144,  210,  147,  231,
			  328,  813,  231,  763,  145,  138,  138,  138,  138,  138,
			  138,  148,  210,  119,  214,  214,  214,  176,  210,  327,
			  139,  156,  117,  117,  144,  117,  491,  140,  328,  177,
			  117,  117,  145,  117,  141,  156,  142,  220,  143,  148,
			  332,  182,  183,  814,  156,  178,  119,  184,  139,  161,
			  156,  200,  156,  196,  260,  140,  201,  179,  217,  217,

			  204,  197,  583,  161,  533,  142,  339,  143,  332,  185,
			  186,  149,  161,  223,  221,  187,  483,  215,  161,  202,
			  161,  198,  117,  117,  203,  117,  824,  825,  205,  199,
			  216,  216,  216,  533,  339,  261,  218,  218,  218,  341,
			  149,  154,  228,  112,  154,  228,  119,  261,  154,  155,
			  221,  154,  210,  738,  229,  230,  155,  156,  156,  156,
			  156,  156,  156,  157,  343,  231,  156,  341,  737,  156,
			  156,  156,  156,  156,  158,  156,  156,  156,  159,  156,
			  160,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  343,  736,  161,  226,  156,  161,  161,  162,

			  161,  161,  163,  161,  161,  161,  164,  161,  165,  161,
			  161,  161,  161,  161,  162,  161,  161,  161,  161,  161,
			  154,  228,  527,  154,  228,  528,  261,  735,  155,  718,
			  214,  214,  214,  229,  677,  331,  156,  156,  156,  156,
			  156,  156,  157,  344,  231,  156,  233,  615,  156,  156,
			  156,  156,  166,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  344,  593,  161,  226,  156,  161,  161,  161,  161,
			  167,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  236,

			  236,  234,  236,  584,  763,  241,  253,  253,  253,  253,
			  253,  253,  850,  109,  242,  242,  242,  242,  242,  242,
			  248,  224,  248,  248,  224,  237,  526,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  243,  250,  250,  250,  250,  250,  250,  255,  255,  255,
			  255,  255,  255,  333,  322,  244,  334,  251,  347,  245,
			  323,  246,  348,  256,  226,  117,  117,  109,  117,  110,
			  238,  257,  257,  257,  257,  257,  257,  258,  261,  397,
			  252,  333,  322,  370,  334,  251,  347,  274,  323,  119,

			  348,  256,  259,  259,  259,  259,  259,  259,  109,  353,
			  110,  370,  257,  257,  257,  257,  257,  257,  117,  117,
			  112,  117,  117,  117,  476,  117,  117,  117,  455,  117,
			  261,  261,  357,  261,  351,  261,  437,  353,  352,  261,
			  117,  117,  119,  117,  371,  370,  119,  371,  434,  347,
			  119,  112,  353,  261,  397,  117,  117,  265,  117,  264,
			  357,  381,  351,  263,  119,  261,  352,  261,  261,  117,
			  117,  527,  117,  266,  527,  117,  117,  349,  117,  119,
			  356,  380,  261,  309,  156,  265,  156,  264,  261,  117,
			  117,  263,  117,  119,  117,  117,  745,  117,  267,  119,

			  348,  266,  261,  117,  117,  379,  117,  261,  378,  268,
			  261,  314,  161,  119,  161,  375,  261,  817,  119,  269,
			  117,  117,  261,  117,  270,  745,  267,  119,  350,  156,
			  271,  884,  273,  261,  308,  117,  117,  268,  117,  227,
			  272,  156,  117,  117,  119,  117,  817,  269,  261,  222,
			  117,  117,  270,  117,  307,  261,  222,  161,  271,  119,
			  273,  275,  313,  261,  117,  117,  119,  117,  272,  161,
			  117,  117,  276,  117,  119,  277,  210,  261,  117,  117,
			  335,  117,  312,  261,  374,  374,  274,  374,  119,  275,
			  278,  261,  438,  439,  119,  279,  261,  442,  821,  261, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  276,  282,  119,  277,  117,  117,  306,  117,  281,  280,
			  237,  117,  117,  444,  117,  156,  841,  261,  156,  315,
			  438,  439,  305,  279,  261,  442,  317,  821,  119,  282,
			  153,  117,  117,  261,  117,  119,  281,  280,  283,  261,
			  283,  444,  139,  161,  261,  841,  161,  316,  261,  289,
			  117,  117,  156,  117,  319,  119,  289,  284,  142,  302,
			  318,  285,  139,  261,  286,  445,  448,  156,  249,  210,
			  139,  118,  261,  287,  119,  288,  289,  248,  210,  321,
			  161,  261,  299,  372,  370,  284,  372,  142,  320,  285,
			  139,  438,  286,  445,  448,  161,  247,  247,  247,  247,

			  156,  240,  287,  100,  288,  117,  117,  324,  117,  261,
			  299,  328,  118,  118,  118,  118,  118,  118,  261,  440,
			  382,  290,  290,  290,  290,  290,  290,   97,  161,  119,
			  227,  117,  117,  449,  117,  117,  117,  222,  117,  330,
			  291,  289,  210,  292,  261,  118,  261,  208,  261,  293,
			  361,  362,  363,  364,  365,  119,  214,  214,  214,  119,
			  450,  449,  454,  294,  153,  156,  295,  151,  291,  116,
			  327,  292,  117,  117,  118,  117,  457,  293,  261,  117,
			  117,  296,  117,  261,  115,  261,  117,  117,  450,  117,
			  454,  294,  261,  161,  295,  322,  119,  156,  329,  261,

			  458,  323,  156,  119,  457,  459,  210,  261,  297,  296,
			  119,  332,  298,  261,  310,  261,  311,  311,  311,  311,
			  311,  311,  300,  325,  333,  161,  156,  334,  458,  326,
			  161,  114,  156,  459,  156,  301,  297,  108,  614,  336,
			  298,  614,  261,  460,  261,  464,  685,  261,  105,  261,
			  300,  100,  337,  466,  161,  338,  210,  335,  261,  343,
			  161,  156,  161,  156,  301,  261,  156,  344,  156,  210,
			   98,  460,   97,  464,  884,  884,  339,  156,  467,  341,
			  884,  466,  884,  884,  156,  217,  217,  345,  884,  161,
			  884,  161,  884,  884,  161,  346,  161,  376,  377,  377,

			  377,  377,  377,  377,  340,  161,  467,  342,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  261,  261,  261,  366,  366,  366,  884,  261,  884,
			  261,  228,  261,  228,  228,  884,  228,  367,  367,  367,
			  156,  156,  156,  229,  351,  229,  444,  156,  352,  448,
			  470,  156,  357,  471,  231,  384,  231,  384,  884,  359,
			  385,  385,  385,  385,  385,  385,  884,  884,  161,  161,
			  161,  884,  354,  884,  446,  161,  355,  451,  470,  161,
			  358,  471,  884,  884,  226,  884,  226,  884,  360,  368,

			  369,  370,  368,  369,  368,  368,  368,  368,  368,  368,
			  368,  368,  371,  230,  230,  368,  230,  230,  230,  230,
			  230,  230,  368,  372,  368,  368,  368,  368,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  368,  368,  373,  368,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  236,  236,  884,  236,  386,  386,  386,  386,  386,

			  386,  387,  387,  387,  387,  387,  387,  394,  394,  394,
			  394,  394,  660,  660,  660,  660,  660,  237,  884,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  383,  383,  383,  383,  383,  383,  388,  388,
			  388,  388,  388,  388,  474,  475,  532,  536,  251,  884,
			  391,  884,  391,  884,  389,  392,  392,  392,  392,  392,
			  392,  109,  238,  110,  884,  393,  393,  393,  393,  393,
			  393,  252,  474,  475,  532,  536,  251,  390,  117,  117,
			  884,  117,  389,  395,  395,  395,  395,  395,  395,  261,

			  884,  261,  117,  117,  884,  117,  117,  117,  884,  117,
			  117,  117,  119,  117,  112,  261,  884,  884,  467,  261,
			  398,  884,  884,  261,  261,  538,  119,  884,  117,  117,
			  119,  117,  117,  117,  119,  117,  117,  117,  884,  117,
			  884,  261,  399,  156,  408,  261,  469,  459,  398,  261,
			  400,  884,  119,  538,  884,  408,  119,  884,  539,  401,
			  119,  117,  117,  884,  117,  408,  117,  117,  403,  117,
			  399,  161,  884,  261,  261,  463,  402,  884,  400,  261,
			  261,  117,  117,  408,  117,  119,  539,  401,  117,  117,
			  119,  117,  471,  884,  261,  542,  403,  884,  404,  156,

			  261,  261,  543,  261,  402,  119,  884,  439,  117,  117,
			  405,  117,  119,  884,  527,  117,  117,  528,  117,  156,
			  473,  261,  156,  542,  884,  406,  404,  161,  261,  884,
			  543,  445,  119,  117,  117,  441,  117,  613,  405,  119,
			  613,  117,  117,  407,  117,  409,  261,  161,  117,  117,
			  161,  117,  410,  406,  261,  117,  117,  119,  117,  447,
			  507,  261,  614,  117,  117,  119,  117,  611,  261,  411,
			  546,  507,  119,  409,  547,  261,  261,  412,  413,  119,
			  410,  507,  549,  117,  117,  884,  117,  119,  416,  416,
			  416,  416,  416,  416,  539,  261,  261,  411,  546,  507,

			  117,  117,  547,  117,  884,  412,  413,  119,  884,  414,
			  549,  550,  464,  261,  156,  415,  417,  417,  417,  417,
			  417,  417,  541,  884,  119,  419,  419,  419,  419,  419,
			  419,  420,  420,  420,  420,  420,  420,  414,  884,  550,
			  465,  884,  161,  415,  610,  418,  421,  421,  421,  421,
			  421,  421,  551,  884,  118,  422,  422,  422,  422,  422,
			  422,  118,  118,  118,  118,  118,  118,  423,  552,  423,
			  118,  118,  118,  118,  118,  118,  521,  556,  117,  117,
			  551,  117,  117,  117,  558,  117,  306,  521,  559,  118,
			  424,  261,  884,  425,  612,  261,  552,  521,  408,  426,

			  117,  117,  119,  117,  261,  556,  119,  117,  117,  408,
			  117,  884,  558,  261,  562,  521,  559,  118,  424,  408,
			  261,  425,  293,  156,  119,  117,  117,  426,  117,  428,
			  884,  119,  117,  117,  884,  117,  813,  408,  261,  427,
			  117,  117,  562,  117,  563,  261,  455,  763,  884,  119,
			  293,  161,  616,  261,  884,  884,  119,  429,  117,  117,
			  884,  117,  117,  117,  119,  117,  884,  427,  884,  618,
			  210,  261,  563,  884,  430,  261,  117,  117,  815,  117,
			  616,  884,  119,  431,  884,  429,  119,  884,  435,  261,
			  435,  435,  435,  435,  435,  435,  302,  618,  884,  884, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  119,  436,  430,  436,  436,  436,  436,  436,  436,  302,
			  619,  431,  310,  432,  310,  310,  310,  310,  310,  310,
			  261,  261,  261,  261,  310,  433,  311,  311,  311,  311,
			  311,  311,  261,  261,  622,  884,  261,  884,  619,  156,
			  156,  156,  156,  884,  884,  449,  261,  442,  214,  214,
			  214,  156,  156,  450,  433,  156,  466,  457,  261,  261,
			  458,  884,  622,  454,  210,  156,  628,  161,  161,  161,
			  161,  261,  470,  452,  210,  443,  261,  156,  156,  161,
			  161,  453,  210,  161,  468,  461,  210,  474,  462,  475,
			  156,  456,  629,  161,  628,  156,  369,  370,  630,  369,

			  472,  374,  374,  884,  374,  161,  161,  884,  371,  822,
			  822,  822,  479,  476,  884,  477,  884,  478,  161,  372,
			  629,  884,  283,  161,  283,  884,  630,  884,  376,  377,
			  377,  377,  377,  377,  377,  481,  481,  481,  481,  481,
			  481,  480,  216,  216,  216,  285,  884,  631,  516,  373,
			  635,  251,  218,  218,  218,  118,  757,  757,  757,  757,
			  214,  214,  214,  884,  214,  214,  214,  385,  385,  385,
			  385,  385,  385,  285,  252,  631,  516,  884,  635,  251,
			  482,  482,  482,  482,  482,  482,  484,  484,  484,  484,
			  484,  484,  485,  485,  485,  485,  485,  485,  486,  486,

			  486,  486,  486,  486,  489,  489,  489,  489,  489,  489,
			  637,  638,  641,  642,  389,  487,  884,  487,  884,  483,
			  488,  488,  488,  488,  488,  488,  392,  392,  392,  392,
			  392,  392,  261,  884,  884,  884,  884,  390,  637,  638,
			  641,  642,  389,  490,  490,  490,  490,  490,  490,  492,
			  493,  156,  494,  494,  494,  494,  494,  494,  495,  495,
			  495,  495,  495,  495,  496,  496,  496,  496,  496,  496,
			  117,  117,  643,  117,  117,  117,  884,  117,  613,  161,
			  261,  613,  491,  261,  884,  261,  884,  261,  117,  117,
			  644,  117,  117,  117,  119,  117,  686,  884,  119,  546,

			  643,  261,  884,  614,  156,  261,  117,  117,  884,  117,
			  884,  884,  119,  498,  261,  532,  119,  884,  644,  261,
			  884,  499,  117,  117,  686,  117,  884,  548,  501,  261,
			  119,  500,  161,  156,  687,  261,  117,  117,  502,  117,
			  884,  498,  564,  534,  117,  117,  119,  117,  156,  261,
			  499,  117,  117,  565,  117,  884,  501,  261,  602,  500,
			  119,  161,  687,  884,  261,  689,  502,  884,  119,  602,
			  564,  117,  117,  884,  117,  119,  161,  117,  117,  602,
			  117,  565,  503,  505,  261,  117,  117,  884,  117,  504,
			  261,  117,  117,  689,  117,  119,  884,  602,  261,  506,

			  884,  119,  526,  884,  261,  117,  117,  884,  117,  119,
			  503,  505,  884,  508,  690,  119,  261,  504,  261,  117,
			  117,  156,  117,  117,  117,  118,  117,  506,  118,  119,
			  510,  509,  261,  884,  118,  156,  261,  117,  117,  538,
			  117,  508,  690,  119,  511,  884,  261,  119,  884,  161,
			  261,  884,  884,  118,  512,  884,  118,  884,  510,  509,
			  884,  119,  118,  161,  884,  156,  513,  540,  759,  760,
			  759,  760,  511,  416,  416,  416,  416,  416,  416,  283,
			  514,  283,  512,  419,  419,  419,  419,  419,  419,  117,
			  117,  884,  117,  161,  513,  420,  420,  420,  420,  420,

			  420,  515,  261,  117,  117,  516,  117,  761,  514,  884,
			  884,  261,  118,  119,  693,  884,  261,  516,  884,  421,
			  421,  421,  421,  421,  421,  884,  884,  119,  118,  515,
			  616,  694,  884,  516,  517,  422,  422,  422,  422,  422,
			  422,  261,  693,  117,  117,  516,  117,  884,  118,  518,
			  518,  518,  518,  518,  518,  884,  261,  118,  617,  694,
			  156,  884,  517,  884,  549,  884,  261,  119,  118,  519,
			  519,  519,  519,  519,  519,  520,  520,  520,  520,  520,
			  520,  117,  117,  623,  117,  156,  117,  117,  161,  117,
			  117,  117,  553,  117,  261,  624,  536,  118,  118,  261,

			  695,  884,  884,  261,  118,  119,  117,  117,  884,  117,
			  119,  623,  884,  161,  119,  696,  700,  523,  524,  526,
			  884,  261,  261,  624,  537,  884,  884,  522,  695,  525,
			  119,  435,  261,  435,  435,  435,  435,  435,  435,  302,
			  156,  156,  884,  696,  700,  523,  524,  261,  551,  884,
			  884,  156,  261,  261,  542,  522,  436,  525,  436,  436,
			  436,  436,  436,  436,  302,  550,  156,  261,  161,  161,
			  530,  156,  156,  261,  884,  556,  555,  261,  580,  161,
			  580,  533,  544,  261,  543,  884,  156,  702,  703,  581,
			  650,  706,  156,  554,  161,  531,  156,  558,  707,  161,

			  161,  563,  156,  557,  261,  708,  562,  559,  117,  117,
			  535,  117,  545,  252,  161,  702,  703,  582,  650,  706,
			  161,  261,  619,  156,  161,  560,  707,  884,  884,  567,
			  161,  884,  119,  708,  566,  561,  481,  481,  481,  481,
			  481,  481,  569,  569,  569,  569,  569,  569,  884,  884,
			  621,  161,  568,  570,  570,  570,  570,  570,  570,  571,
			  571,  571,  571,  571,  571,  884,  572,  572,  572,  572,
			  572,  572,  488,  488,  488,  488,  488,  488,  884,  884,
			  568,  483,  389,  573,  573,  573,  573,  573,  573,  575,
			  575,  575,  575,  575,  575,  576,  576,  576,  576,  576,

			  576,  884,  884,  740,  741,  390,  117,  117,  884,  117,
			  389,  577,  577,  577,  577,  577,  577,  261,  261,  261,
			  884,  884,  574,  572,  572,  572,  572,  572,  572,  716,
			  119,  740,  741,  884,  491,  884,  623,  156,  493,  579,
			  494,  494,  494,  494,  494,  494,  117,  117,  624,  117,
			  117,  117,  390,  117,  884,  117,  117,  716,  117,  261,
			  615,  585,  884,  261,  626,  161,  884,  579,  261,  884,
			  119,  607,  117,  117,  119,  117,  627,  884,  586,  119,
			  117,  117,  608,  117,  670,  261,  588,  117,  117,  587,
			  117,  884,  609,  261,  117,  117,  119,  117,  884,  884,

			  261,  670,  261,  589,  119,  670,  586,  261,  261,  743,
			  608,  119,  590,  884,  588,  884,  884,  587,  119,  117,
			  117,  156,  117,  884,  591,  747,  594,  629,  884,  670,
			  749,  589,  261,  117,  117,  884,  117,  743,  117,  117,
			  590,  117,  884,  119,  261,  750,  261,  117,  117,  161,
			  117,  261,  591,  747,  594,  632,  592,  119,  749,  751,
			  261,  884,  119,  156,  595,  117,  117,  631,  117,  117,
			  117,  119,  117,  750,  596,  884,  884,  261,  261,  771,
			  884,  884,  261,  771,  592,  117,  117,  751,  117,  119,
			  884,  161,  595,  119,  261,  634,  635,  597,  261,  884, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  771,  884,  596,  600,  600,  600,  600,  600,  600,  119,
			  884,  771,  598,  638,  884,  776,  884,  599,  118,  118,
			  118,  118,  118,  118,  636,  597,  518,  518,  518,  518,
			  518,  518,  118,  520,  520,  520,  520,  520,  520,  777,
			  598,  640,  423,  776,  423,  599,  519,  519,  519,  519,
			  519,  519,  261,  884,  601,  118,  117,  117,  884,  117,
			  117,  117,  261,  117,  884,  884,  884,  777,  425,  261,
			  884,  156,  884,  261,  426,  118,  117,  117,  618,  117,
			  119,  641,  601,  118,  119,  884,  261,  779,  603,  261,
			  117,  117,  604,  117,  261,  781,  425,  783,  261,  161,

			  119,  728,  426,  261,  622,  156,  620,  261,  261,  645,
			  884,  884,  630,  156,  119,  779,  603,  156,  728,  605,
			  604,  884,  728,  781,  884,  783,  642,  156,  637,  647,
			  606,  647,  625,  161,  648,  648,  648,  648,  648,  648,
			  633,  161,  884,  884,  884,  161,  728,  605,  648,  648,
			  648,  648,  648,  648,  646,  161,  639,  784,  606,  649,
			  649,  649,  649,  649,  649,  572,  572,  572,  572,  572,
			  572,  652,  652,  652,  652,  652,  652,  884,  800,  884,
			  801,  651,  884,  884,  884,  784,  884,  483,  653,  653,
			  653,  653,  653,  653,  654,  654,  654,  654,  654,  654,

			  655,  655,  655,  655,  655,  655,  800,  261,  801,  651,
			  574,  656,  656,  656,  656,  656,  656,  657,  657,  657,
			  657,  657,  657,  658,  884,  658,  156,  884,  655,  655,
			  655,  655,  655,  655,  884,  775,  775,  884,  775,  491,
			  659,  659,  659,  659,  659,  659,  662,  662,  662,  662,
			  662,  662,  117,  117,  161,  117,  884,  117,  117,  799,
			  117,  884,  663,  261,  884,  261,  681,  884,  681,  884,
			  261,  117,  117,  884,  117,  884,  119,  681,  687,  683,
			  665,  119,  156,  884,  261,  117,  117,  682,  117,  684,
			  663,  117,  117,  803,  117,  119,  884,  731,  261,  666,

			  117,  117,  884,  117,  261,  681,  688,  683,  665,  119,
			  161,  682,  884,  261,  731,  119,  117,  117,  731,  117,
			  805,  803,  684,  667,  119,  117,  117,  666,  117,  261,
			  117,  117,  684,  117,  117,  117,  816,  117,  261,  668,
			  119,  884,  731,  261,  819,  884,  884,  261,  805,  119,
			  684,  667,  117,  117,  119,  117,  117,  117,  119,  117,
			  117,  117,  669,  117,  816,  261,  672,  668,  884,  261,
			  884,  831,  819,  261,  671,  884,  119,  261,  884,  261,
			  119,  884,  117,  117,  119,  117,  884,  884,  832,  884,
			  669,  884,  675,  884,  672,  261,  689,  673,  156,  831,

			  674,  884,  671,  283,  261,  283,  119,  600,  600,  600,
			  600,  600,  600,  676,  117,  117,  832,  117,  117,  117,
			  675,  117,  768,  156,  691,  673,  161,  261,  674,  261,
			  690,  261,  117,  117,  261,  117,  118,  884,  119,  768,
			  842,  676,  119,  768,  261,  261,  117,  117,  156,  117,
			  261,  161,  261,  695,  261,  261,  119,  828,  692,  261,
			  694,  678,  679,  156,  261,  828,  884,  768,  842,  156,
			  119,  702,  703,  156,  156,  700,  161,  680,  828,  851,
			  884,  698,  696,  156,  884,  884,  884,  884,  697,  678,
			  679,  161,  857,  828,  706,  117,  117,  161,  117,  704,

			  705,  161,  161,  701,  884,  680,  884,  851,  261,  884,
			  699,  161,  648,  648,  648,  648,  648,  648,  884,  119,
			  857,  884,  709,  648,  648,  648,  648,  648,  648,  710,
			  710,  710,  710,  710,  710,  711,  884,  711,  884,  884,
			  712,  712,  712,  712,  712,  712,  713,  884,  713,  884,
			  884,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  714,  714,  715,  715,  715,  715,  715,  715,  655,
			  655,  655,  655,  655,  655,  717,  717,  717,  717,  717,
			  717,  655,  655,  655,  655,  655,  655,  719,  719,  719,
			  719,  719,  719,  884,  884,  884,  574,  720,  720,  720,

			  720,  720,  720,  721,  721,  721,  721,  721,  721,  884,
			  884,  884,  884,  117,  117,  722,  117,  722,  884,  716,
			  723,  723,  723,  723,  723,  723,  261,  117,  117,  884,
			  117,  117,  117,  884,  117,  117,  117,  119,  117,  884,
			  261,  884,  390,  884,  261,  884,  261,  716,  261,  117,
			  117,  119,  117,  884,  884,  119,  725,  117,  117,  119,
			  117,  727,  261,  884,  726,  156,  117,  117,  884,  117,
			  261,  884,  261,  119,  117,  117,  884,  117,  884,  261,
			  884,  119,  117,  117,  725,  117,  884,  261,  884,  727,
			  119,  156,  726,  161,  884,  261,  117,  117,  119,  117,

			  117,  117,  884,  117,  117,  117,  119,  117,  261,  261,
			  261,  261,  884,  261,  261,  729,  884,  261,  261,  161,
			  119,  730,  117,  117,  119,  117,  261,  156,  119,  156,
			  156,  743,  732,  156,  741,  261,  884,  156,  884,  733,
			  117,  117,  884,  117,  729,  156,  119,  745,  884,  730,
			  261,  261,  747,  261,  734,  161,  884,  161,  161,  744,
			  732,  161,  742,  884,  119,  161,  884,  733,  884,  156,
			  749,  884,  884,  161,  884,  884,  746,  884,  884,  884,
			  748,  884,  734,  712,  712,  712,  712,  712,  712,  753,
			  753,  753,  753,  753,  753,  884,  884,  161,  752,  714,

			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  754,  754,  754,  754,  754,  754,  755,  884,  755,
			  884,  884,  756,  756,  756,  756,  756,  756,  483,  758,
			  758,  758,  758,  758,  758,  654,  654,  654,  654,  654,
			  654,  723,  723,  723,  723,  723,  723,  117,  117,  884,
			  117,  716,  762,  762,  762,  762,  762,  762,  884,  829,
			  261,  884,  117,  117,  884,  117,  884,  829,  884,  117,
			  117,  119,  117,  884,  390,  261,  884,  764,  884,  716,
			  829,  884,  261,  884,  117,  117,  119,  117,  884,  117,
			  117,  491,  117,  119,  884,  829,  772,  261,  765,  884,

			  772,  766,  261,  117,  117,  764,  117,  884,  119,  117,
			  117,  771,  117,  119,  767,  773,  261,  772,  261,  772,
			  769,  884,  261,  774,  884,  261,  765,  119,  772,  766,
			  261,  884,  773,  119,  884,  770,  261,  156,  261,  838,
			  774,  777,  767,  773,  779,  884,  795,  838,  769,  156,
			  795,  774,  884,  781,  884,  156,  783,  156,  117,  117,
			  838,  117,  884,  770,  884,  161,  884,  795,  884,  778,
			  884,  261,  780,  884,  884,  838,  884,  161,  795,  884,
			  884,  782,  119,  161,  785,  161,  710,  710,  710,  710,
			  710,  710,  756,  756,  756,  756,  756,  756,  786,  786, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  786,  786,  786,  786,  787,  787,  787,  787,  787,  787,
			  582,  582,  582,  582,  582,  582,  788,  788,  788,  788,
			  788,  788,  884,  884,  884,  483,  789,  789,  789,  789,
			  789,  789,  117,  117,  884,  117,  884,  574,  717,  717,
			  717,  717,  717,  717,  884,  261,  117,  117,  796,  117,
			  117,  117,  796,  117,  884,  884,  119,  261,  795,  261,
			  796,  884,  797,  261,  798,  117,  117,  791,  117,  796,
			  119,  884,  117,  117,  119,  117,  156,  491,  261,  797,
			  796,  798,  793,  261,  261,  261,  261,  855,  884,  119,
			  797,  792,  798,  261,  261,  791,  119,  884,  855,  261,

			  884,  884,  156,  803,  161,  156,  884,  884,  855,  884,
			  793,  884,  156,  156,  884,  801,  884,  794,  156,  792,
			  754,  754,  754,  754,  754,  754,  855,  884,  884,  817,
			  161,  804,  884,  161,  807,  807,  807,  807,  807,  807,
			  161,  161,  759,  802,  759,  794,  161,  789,  789,  789,
			  789,  789,  789,  117,  117,  261,  117,  884,  818,  574,
			  117,  117,  884,  117,  884,  884,  261,  117,  117,  884,
			  117,  884,  884,  261,  156,  117,  117,  119,  117,  856,
			  261,  761,  884,  884,  119,  809,  819,  884,  261,  884,
			  856,  119,  823,  823,  823,  823,  823,  823,  884,  119,

			  856,  884,  161,  117,  117,  884,  117,  117,  117,  810,
			  117,  811,  884,  809,  820,  763,  261,  884,  856,  884,
			  261,  884,  117,  117,  812,  117,  839,  119,  829,  884,
			  884,  119,  884,  884,  839,  261,  830,  884,  810,  811,
			  884,  117,  117,  884,  117,  884,  119,  839,  826,  830,
			  843,  884,  843,  812,  261,  833,  833,  833,  833,  833,
			  833,  844,  839,  884,  830,  119,  761,  761,  761,  761,
			  761,  761,  117,  117,  763,  117,  826,  117,  117,  884,
			  117,  863,  827,  863,  884,  261,  860,  839,  884,  845,
			  261,  884,  864,  884,  884,  840,  119,  860,  884,  884,

			  884,  119,  847,  847,  847,  847,  847,  860,  840,  837,
			  827,  117,  117,  884,  117,  117,  117,  884,  117,  884,
			  865,  836,  884,  840,  261,  860,  884,  884,  261,  852,
			  852,  852,  852,  852,  852,  119,  884,  837,  884,  119,
			  853,  853,  853,  853,  853,  884,  117,  117,  884,  117,
			  836,  884,  848,  847,  847,  847,  847,  847,  847,  261,
			  858,  858,  858,  858,  858,  858,  117,  117,  884,  117,
			  119,  859,  859,  859,  859,  859,  859,  861,  854,  261,
			  848,  862,  862,  862,  862,  862,  862,  884,  861,  884,
			  119,  845,  845,  845,  845,  845,  845,  870,  861,  868,

			  868,  868,  868,  868,  868,  871,  854,  869,  869,  869,
			  869,  869,  884,  884,  870,  884,  861,  884,  870,  884,
			  884,  884,  871,  874,  875,  884,  871,  872,  872,  872,
			  872,  872,  872,  873,  873,  873,  873,  873,  873,  884,
			  874,  875,  870,  884,  874,  875,  877,  878,  877,  878,
			  871,  876,  876,  876,  876,  876,  876,  865,  865,  865,
			  865,  865,  865,  884,  884,  884,  884,  884,  874,  875,
			  880,  880,  880,  880,  880,  880,  881,  881,  881,  881,
			  881,  881,  884,  884,  884,  879,  882,  882,  882,  882,
			  882,  882,  877,  884,  877,  884,  884,  881,  881,  881,

			  881,  881,  881,  883,  883,  883,  883,  883,  883,  879,
			  879,  879,  879,  879,  879,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  879,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   99,   99,  884,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,  884,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,  101,  101,  884,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  118,  118,  118,  884,  884,  884,  884,  884,  884,
			  118,  118,  118,  118,  884,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  884,  884,

			  118,  118,  118,  118,  118,  118,  118,  118,  118,  150,
			  150,  884,  150,  150,  150,  150,  150,  884,  884,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  884,  884,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  152,  152,  884,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  152,  152,  152,  152,  209,  209,  884,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  884,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,

			  219,  219,  219,  219,  219,  219,  225,  884,  225,  884,
			  884,  884,  884,  225,  225,  225,  225,  225,  884,  884,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  884,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,

			  232,  232,  232,  232,  232,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  239,  239,  884,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,

			  239,  239,  239,  239,  239,  239,  239,  104,  884,  884,
			  884,  104,  104,  104,  884,  884,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  884,
			  884,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

			  105,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  884,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  262,  884,  884,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  884,  884,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  238,  238,  238,  884,  884,  884,

			  884,  884,  884,  884,  884,  884,  884,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  238,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  396,  396,  396,  884,  884,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,

			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  497,  497,
			  497,  884,  884,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  497,  497,  884,  884,  497,  497,
			  497,  497,  497,  497,  497,  497,  497,  529,  884,  529,
			  884,  884,  884,  884,  529,  529,  529,  529,  529,  884,
			  884,  529,  529,  529,  529,  529,  529,  529,  529,  529,
			  529,  529,  529,  529,  529,  529,  529,  529,  529,  529,

			  529,  529,  529,  529,  884,  884,  529,  529,  529,  529,
			  529,  529,  529,  529,  529,  437,  437,  437,  884,  884,
			  437,  437,  437,  437,  437,  437,  437,  437,  884,  884,
			  437,  437,  437,  437,  437,  437,  437,  437,  437,  437,
			  437,  437,  437,  437,  437,  437,  437,  437,  437,  437,
			  437,  437,  437,  884,  884,  437,  437,  437,  437,  437,
			  437,  437,  437,  437,  610,  884,  610,  884,  884,  884,
			  884,  610,  610,  610,  610,  610,  884,  884,  610,  610,
			  610,  610,  610,  610,  610,  610,  610,  610,  610,  610,
			  610,  610,  610,  610,  610,  610,  610,  610,  610,  610,

			  610,  884,  610,  610,  610,  610,  610,  610,  610,  610,
			  610,  610,  661,  661,  661,  661,  661,  661,  661,  661,
			  661,  884,  661,  661,  661,  661,  661,  661,  661,  661,
			  661,  661,  661,  661,  661,  661,  661,  661,  661,  661,
			  661,  661,  661,  661,  661,  661,  661,  661,  661,  661,
			  661,  661,  661,  661,  661,  661,  661,  661,  661,  661,
			  661,  661,  661,  664,  664,  664,  664,  664,  664,  664,
			  664,  664,  664,  664,  664,  664,  664,  664,  664,  664,
			  664,  664,  664,  664,  664,  664,  884,  884,  664,  664,
			  664,  664,  664,  664,  664,  664,  664,  724,  724,  724,

			  884,  884,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  884,  884,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  884,  884,  884,  739,  739,  739,  884,  884,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  884,  884,  739,  739,  739,  739,  739,  739,  739, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  739,  739,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  884,  884,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  808,  808,  808,  884,
			  884,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  808,  808,  808,  808,  808,
			  808,  808,  808,  808,  884,  884,  808,  808,  808,  808,
			  808,  808,  808,  808,  808,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  884,  884,

			  834,  834,  834,  834,  834,  834,  834,  834,  834,  846,
			  846,  846,  884,  884,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  846,  846,  884,  884,  846,
			  846,  846,  846,  846,  846,  846,  846,  846,   13,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,

			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884, yy_Dummy>>,
			1, 241, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 6240)
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
			    1,    1,    1,    3,    5,    6,   11,    3,    4,   12,

			   20,   15,    4,   15,   15,   27,  610,   27,   27,   27,
			   27,   27,   27,   29,   93,   29,   78,   29,   29,   29,
			   29,   29,   29,   40,   40,   59,   40,   60,   84,   59,
			   86,    5,    6,   30,   59,   30,  158,   30,   30,   30,
			   30,   30,   30,   63,    3,   20,   63,   40,  206,    4,
			  861,   11,  860,   59,   12,   60,   29,   59,   76,  610,
			   76,   76,   59,   78,  158,   84,  839,   86,  838,   93,
			   96,   63,   96,   96,   63,  825,   30,  206,    3,    3,
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
			   37,   37,  159,   37,   38,   38,  211,   38,  211,  211,
			   39,   39,   80,   39,   65,  160,   88,   66,   65,   88,

			   41,   41,  798,   41,   37,   66,   45,   45,   38,   45,
			  159,  492,  492,   37,   39,   71,   38,   37,   39,   37,
			  808,  808,   65,  160,   41,   66,   65,   39,   42,   42,
			   45,   42,   71,   66,   45,   43,   43,   41,   43,   46,
			   46,   37,   46,   71,   38,   37,   39,   37,   41,   88,
			   44,   44,   42,   44,  166,   39,   42,   47,   47,   43,
			   47,   71,   45,   46,  168,   41,   50,   50,   42,   50,
			   43,  169,   80,  151,   44,   61,   79,   41,  787,   46,
			   61,   47,  166,  229,   42,  172,  229,   47,   44,   44,
			   50,   61,  168,   67,   44,   67,   42,  359,   43,  169,

			   47,   49,   49,   61,   49,   50,   67,   46,   61,  151,
			   50,   51,   51,  172,   51,   47,   44,   44,  754,   82,
			   61,   67,   44,   67,  151,   49,  359,  739,   47,   48,
			   48,  176,   48,   50,   67,   51,   49,  362,   50,  231,
			  177,  795,  231,  724,   49,   48,   48,   48,   48,   48,
			   48,   51,   81,   48,   79,   79,   79,   62,   83,  176,
			   48,   62,   52,   52,   49,   52,  717,   48,  177,   62,
			  117,  117,   49,  117,   48,   64,   48,  219,   48,   51,
			  182,   64,   64,  795,   69,   62,   52,   64,   48,   62,
			   68,   69,   70,   68,  117,   48,   69,   62,   82,   82,

			   70,   68,  496,   64,  439,   48,  188,   48,  182,   64,
			   64,   52,   69,  221,  219,   64,  710,  362,   68,   69,
			   70,   68,  118,  118,   69,  118,  846,  846,   70,   68,
			   81,   81,   81,  439,  188,  118,   83,   83,   83,  190,
			   52,   57,   90,  496,   57,   90,  118,  161,  154,   57,
			  221,  154,  215,  684,   90,   90,  154,   57,   57,   57,
			   57,   57,   57,   57,  192,   90,  161,  190,  683,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,  192,  682,  161,   90,   57,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   58,   91,  434,   58,   91,  434,  181,  681,   58,  657,
			  215,  215,  215,   91,  602,  181,   58,   58,   58,   58,
			   58,   58,   58,  193,   91,  181,  232,  533,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  193,  507,  181,   91,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   94,

			   94,  232,   94,  497,  840,  103,  109,  109,  109,  109,
			  109,  109,  840,  485,  103,  103,  103,  103,  103,  103,
			  248,  224,  248,  248,  224,   94,  479,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  103,  107,  107,  107,  107,  107,  107,  110,  110,  110,
			  110,  110,  110,  183,  173,  103,  183,  107,  196,  103,
			  173,  103,  197,  110,  224,  130,  130,  111,  130,  111,
			   94,  111,  111,  111,  111,  111,  111,  111,  130,  397,
			  107,  183,  173,  373,  183,  107,  196,  130,  173,  130,

			  197,  110,  112,  112,  112,  112,  112,  112,  113,  201,
			  113,  368,  113,  113,  113,  113,  113,  113,  120,  120,
			  111,  120,  121,  121,  353,  121,  122,  122,  328,  122,
			  198,  120,  204,  203,  200,  121,  306,  201,  200,  122,
			  123,  123,  120,  123,  371,  371,  121,  371,  302,  198,
			  122,  113,  203,  123,  262,  124,  124,  122,  124,  121,
			  204,  246,  200,  120,  123,  165,  200,  199,  124,  125,
			  125,  527,  125,  123,  527,  126,  126,  198,  126,  124,
			  203,  245,  125,  165,  165,  122,  199,  121,  126,  129,
			  129,  120,  129,  125,  127,  127,  696,  127,  124,  126,

			  199,  123,  129,  128,  128,  244,  128,  127,  243,  125,
			  164,  165,  165,  129,  199,  241,  128,  801,  127,  126,
			  131,  131,  163,  131,  127,  696,  124,  128,  199,  164,
			  127,  236,  129,  131,  164,  133,  133,  125,  133,  227,
			  128,  163,  132,  132,  131,  132,  801,  126,  133,  223,
			  134,  134,  127,  134,  163,  132,  220,  164,  127,  133,
			  129,  131,  164,  134,  135,  135,  132,  135,  128,  163,
			  137,  137,  132,  137,  134,  132,  209,  135,  136,  136,
			  184,  136,  163,  137,  237,  237,  180,  237,  135,  131,
			  133,  136,  307,  308,  137,  134,  170,  315,  805,  167, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  132,  137,  136,  132,  139,  139,  157,  139,  136,  135,
			  237,  140,  140,  317,  140,  170,  831,  139,  167,  167,
			  307,  308,  155,  134,  140,  315,  170,  805,  139,  137,
			  152,  142,  142,  171,  142,  140,  136,  135,  138,  138,
			  138,  317,  140,  170,  142,  831,  167,  167,  174,  139,
			  147,  147,  171,  147,  170,  142,  140,  138,  140,  150,
			  171,  138,  142,  147,  138,  318,  321,  174,  106,  214,
			  140,  138,  312,  138,  147,  138,  142,  105,  216,  174,
			  171,  179,  147,  372,  372,  138,  372,  140,  171,  138,
			  142,  312,  138,  318,  321,  174,  247,  247,  104,  247,

			  179,  101,  138,   99,  138,  141,  141,  174,  141,  143,
			  147,  179,  143,  143,  143,  143,  143,  143,  141,  312,
			  247,  141,  141,  141,  141,  141,  141,   97,  179,  141,
			   89,  144,  144,  322,  144,  145,  145,   85,  145,  179,
			  141,  143,   75,  141,  144,  143,  178,   72,  145,  141,
			  214,  214,  214,  214,  214,  144,  216,  216,  216,  145,
			  323,  322,  327,  144,   56,  178,  144,   53,  141,   36,
			  178,  141,  146,  146,  143,  146,  332,  141,  175,  148,
			  148,  145,  148,  185,   35,  146,  149,  149,  323,  149,
			  327,  144,  148,  178,  144,  175,  146,  175,  178,  149,

			  333,  175,  185,  148,  332,  334,  364,  186,  146,  145,
			  149,  185,  146,  162,  162,  187,  162,  162,  162,  162,
			  162,  162,  148,  175,  186,  175,  186,  186,  333,  175,
			  185,   33,  162,  334,  187,  149,  146,   28,  614,  185,
			  146,  614,  194,  335,  189,  339,  614,  191,   26,  195,
			  148,   18,  186,  343,  186,  186,  217,  187,  314,  194,
			  162,  194,  187,  189,  149,  156,  191,  195,  195,  218,
			   17,  335,   16,  339,  156,   13,  189,  314,  344,  191,
			    0,  343,    0,    0,  156,  364,  364,  194,    0,  194,
			    0,  189,    0,    0,  191,  195,  195,  242,  242,  242,

			  242,  242,  242,  242,  189,  314,  344,  191,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  202,  205,  207,  217,  217,  217,    0,  319,    0,
			  324,  225,  342,  228,  225,    0,  228,  218,  218,  218,
			  202,  205,  207,  225,  202,  228,  319,  319,  202,  324,
			  347,  342,  205,  348,  225,  251,  228,  251,    0,  207,
			  251,  251,  251,  251,  251,  251,    0,    0,  202,  205,
			  207,    0,  202,    0,  319,  319,  202,  324,  347,  342,
			  205,  348,    0,    0,  225,    0,  228,    0,  207,  230,

			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  233,  233,    0,  233,  252,  252,  252,  252,  252,

			  252,  253,  253,  253,  253,  253,  253,  258,  258,  258,
			  258,  258,  581,  581,  581,  581,  581,  233,    0,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  250,  250,  250,  250,  250,  250,  255,  255,
			  255,  255,  255,  255,  351,  352,  438,  442,  250,    0,
			  256,    0,  256,    0,  255,  256,  256,  256,  256,  256,
			  256,  257,  233,  257,    0,  257,  257,  257,  257,  257,
			  257,  250,  351,  352,  438,  442,  250,  255,  263,  263,
			    0,  263,  255,  259,  259,  259,  259,  259,  259,  346,

			    0,  263,  264,  264,    0,  264,  265,  265,    0,  265,
			  266,  266,  263,  266,  257,  264,    0,    0,  346,  265,
			  263,    0,    0,  266,  338,  444,  264,    0,  267,  267,
			  265,  267,  268,  268,  266,  268,  269,  269,    0,  269,
			    0,  267,  264,  338,  274,  268,  346,  338,  263,  269,
			  266,    0,  267,  444,    0,  274,  268,    0,  445,  267,
			  269,  270,  270,    0,  270,  274,  271,  271,  269,  271,
			  264,  338,    0,  350,  270,  338,  268,    0,  266,  271,
			  313,  272,  272,  274,  272,  270,  445,  267,  273,  273,
			  271,  273,  350,    0,  272,  449,  269,    0,  270,  313,

			  320,  273,  450,  358,  268,  272,    0,  313,  275,  275,
			  271,  275,  273,    0,  528,  276,  276,  528,  276,  320,
			  350,  275,  358,  449,    0,  272,  270,  313,  276,    0,
			  450,  320,  275,  277,  277,  313,  277,  531,  271,  276,
			  531,  278,  278,  273,  278,  275,  277,  320,  279,  279,
			  358,  279,  276,  272,  278,  280,  280,  277,  280,  320,
			  408,  279,  531,  281,  281,  278,  281,  528,  280,  277,
			  454,  408,  279,  275,  455,  447,  281,  278,  279,  280,
			  276,  408,  457,  282,  282,    0,  282,  281,  283,  283,
			  283,  283,  283,  283,  447,  340,  282,  277,  454,  408,

			  284,  284,  455,  284,    0,  278,  279,  282,    0,  281,
			  457,  458,  340,  284,  340,  282,  284,  284,  284,  284,
			  284,  284,  447,    0,  284,  285,  285,  285,  285,  285,
			  285,  286,  286,  286,  286,  286,  286,  281,    0,  458,
			  340,  529,  340,  282,  529,  284,  287,  287,  287,  287,
			  287,  287,  459,    0,  285,  288,  288,  288,  288,  288,
			  288,  289,  289,  289,  289,  289,  289,  290,  460,  290,
			  291,  291,  291,  291,  291,  291,  428,  464,  292,  292,
			  459,  292,  293,  293,  466,  293,  331,  428,  467,  291,
			  290,  292,    0,  290,  529,  293,  460,  428,  331,  290,

			  294,  294,  292,  294,  330,  464,  293,  295,  295,  331,
			  295,    0,  466,  294,  474,  428,  467,  291,  290,  331,
			  295,  290,  292,  330,  294,  296,  296,  290,  296,  295,
			    0,  295,  297,  297,    0,  297,  797,  331,  296,  294,
			  298,  298,  474,  298,  475,  297,  330,  797,    0,  296,
			  292,  330,  536,  298,    0,    0,  297,  296,  299,  299,
			    0,  299,  300,  300,  298,  300,    0,  294,    0,  538,
			  361,  299,  475,    0,  297,  300,  301,  301,  797,  301,
			  536,    0,  299,  298,    0,  296,  300,    0,  303,  301,
			  303,  303,  303,  303,  303,  303,  303,  538,    0,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  301,  304,  297,  304,  304,  304,  304,  304,  304,  304,
			  539,  298,  310,  299,  310,  310,  310,  310,  310,  310,
			  316,  325,  326,  345,  311,  301,  311,  311,  311,  311,
			  311,  311,  329,  336,  542,    0,  337,    0,  539,  316,
			  325,  326,  345,    0,    0,  325,  349,  316,  361,  361,
			  361,  329,  336,  326,  301,  337,  345,  336,  354,  355,
			  337,    0,  542,  329,  363,  349,  547,  316,  325,  326,
			  345,  356,  349,  325,  365,  316,  360,  354,  355,  329,
			  336,  326,  366,  337,  345,  336,  367,  354,  337,  355,
			  356,  329,  549,  349,  547,  360,  369,  369,  550,  369,

			  349,  374,  374,    0,  374,  354,  355,    0,  369,  806,
			  806,  806,  360,  356,    0,  354,    0,  355,  356,  369,
			  549,    0,  417,  360,  417,    0,  550,  374,  377,  377,
			  377,  377,  377,  377,  377,  383,  383,  383,  383,  383,
			  383,  360,  363,  363,  363,  417,    0,  551,  417,  369,
			  556,  383,  365,  365,  365,  417,  718,  718,  718,  718,
			  366,  366,  366,    0,  367,  367,  367,  384,  384,  384,
			  384,  384,  384,  417,  383,  551,  417,    0,  556,  383,
			  385,  385,  385,  385,  385,  385,  386,  386,  386,  386,
			  386,  386,  387,  387,  387,  387,  387,  387,  388,  388,

			  388,  388,  388,  388,  390,  390,  390,  390,  390,  390,
			  558,  559,  562,  563,  388,  389,    0,  389,    0,  385,
			  389,  389,  389,  389,  389,  389,  391,  391,  391,  391,
			  391,  391,  451,    0,    0,    0,    0,  388,  558,  559,
			  562,  563,  388,  392,  392,  392,  392,  392,  392,  393,
			  393,  451,  393,  393,  393,  393,  393,  393,  394,  394,
			  394,  394,  394,  394,  395,  395,  395,  395,  395,  395,
			  398,  398,  564,  398,  399,  399,    0,  399,  613,  451,
			  456,  613,  392,  398,    0,  440,    0,  399,  400,  400,
			  565,  400,  401,  401,  398,  401,  615,    0,  399,  456,

			  564,  400,    0,  613,  440,  401,  402,  402,    0,  402,
			    0,    0,  400,  398,  472,  440,  401,    0,  565,  402,
			    0,  399,  403,  403,  615,  403,    0,  456,  401,  473,
			  402,  400,  440,  472,  618,  403,  404,  404,  402,  404,
			    0,  398,  476,  440,  405,  405,  403,  405,  473,  404,
			  399,  406,  406,  476,  406,    0,  401,  405,  521,  400,
			  404,  472,  618,    0,  406,  622,  402,    0,  405,  521,
			  476,  407,  407,    0,  407,  406,  473,  409,  409,  521,
			  409,  476,  404,  406,  407,  410,  410,    0,  410,  405,
			  409,  411,  411,  622,  411,  407,    0,  521,  410,  407,

			    0,  409,  480,    0,  411,  412,  412,    0,  412,  410,
			  404,  406,    0,  409,  623,  411,  446,  405,  412,  413,
			  413,  480,  413,  414,  414,  418,  414,  407,  418,  412,
			  411,  410,  413,    0,  418,  446,  414,  415,  415,  446,
			  415,  409,  623,  413,  412,    0,  534,  414,    0,  480,
			  415,    0,    0,  418,  413,    0,  418,    0,  411,  410,
			    0,  415,  418,  446,    0,  534,  414,  446,  720,  720,
			  720,  720,  412,  416,  416,  416,  416,  416,  416,  419,
			  415,  419,  413,  419,  419,  419,  419,  419,  419,  426,
			  426,    0,  426,  534,  414,  420,  420,  420,  420,  420,

			  420,  416,  426,  427,  427,  419,  427,  720,  415,    0,
			    0,  537,  419,  426,  628,    0,  427,  420,    0,  421,
			  421,  421,  421,  421,  421,    0,    0,  427,  420,  416,
			  537,  629,    0,  419,  421,  422,  422,  422,  422,  422,
			  422,  461,  628,  429,  429,  420,  429,    0,  421,  423,
			  423,  423,  423,  423,  423,    0,  429,  420,  537,  629,
			  461,    0,  421,    0,  461,    0,  443,  429,  422,  424,
			  424,  424,  424,  424,  424,  425,  425,  425,  425,  425,
			  425,  430,  430,  543,  430,  443,  431,  431,  461,  431,
			  432,  432,  461,  432,  430,  543,  443,  422,  424,  431,

			  630,    0,    0,  432,  425,  430,  433,  433,    0,  433,
			  431,  543,    0,  443,  432,  631,  635,  431,  432,  433,
			    0,  452,  463,  543,  443,    0,    0,  430,  630,  432,
			  433,  435,  462,  435,  435,  435,  435,  435,  435,  435,
			  452,  463,    0,  631,  635,  431,  432,  441,  463,    0,
			    0,  462,  453,  465,  452,  430,  436,  432,  436,  436,
			  436,  436,  436,  436,  436,  462,  441,  468,  452,  463,
			  435,  453,  465,  477,    0,  465,  463,  469,  495,  462,
			  495,  441,  452,  478,  453,    0,  468,  637,  638,  495,
			  571,  642,  477,  462,  441,  436,  469,  468,  643,  453,

			  465,  478,  478,  465,  541,  644,  477,  469,  498,  498,
			  441,  498,  453,  571,  468,  637,  638,  495,  571,  642,
			  477,  498,  541,  541,  469,  468,  643,    0,    0,  478,
			  478,    0,  498,  644,  477,  469,  481,  481,  481,  481,
			  481,  481,  482,  482,  482,  482,  482,  482,    0,    0,
			  541,  541,  481,  483,  483,  483,  483,  483,  483,  484,
			  484,  484,  484,  484,  484,    0,  486,  486,  486,  486,
			  486,  486,  487,  487,  487,  487,  487,  487,    0,    0,
			  481,  482,  486,  488,  488,  488,  488,  488,  488,  489,
			  489,  489,  489,  489,  489,  490,  490,  490,  490,  490,

			  490,    0,    0,  686,  687,  486,  499,  499,    0,  499,
			  486,  491,  491,  491,  491,  491,  491,  545,  535,  499,
			    0,    0,  488,  493,  493,  493,  493,  493,  493,  654,
			  499,  686,  687,    0,  490,    0,  545,  535,  494,  493,
			  494,  494,  494,  494,  494,  494,  500,  500,  545,  500,
			  501,  501,  654,  501,    0,  502,  502,  654,  502,  500,
			  535,  499,    0,  501,  545,  535,    0,  493,  502,    0,
			  500,  526,  503,  503,  501,  503,  545,    0,  500,  502,
			  504,  504,  526,  504,  593,  503,  502,  505,  505,  501,
			  505,    0,  526,  504,  508,  508,  503,  508,    0,    0,

			  505,  593,  548,  503,  504,  593,  500,  508,  553,  690,
			  526,  505,  504,    0,  502,    0,    0,  501,  508,  506,
			  506,  548,  506,    0,  504,  702,  508,  553,    0,  593,
			  706,  503,  506,  509,  509,    0,  509,  690,  510,  510,
			  504,  510,    0,  506,  555,  707,  509,  511,  511,  548,
			  511,  510,  504,  702,  508,  553,  506,  509,  706,  708,
			  511,    0,  510,  555,  509,  512,  512,  555,  512,  513,
			  513,  511,  513,  707,  510,    0,    0,  557,  512,  735,
			    0,    0,  513,  735,  506,  514,  514,  708,  514,  512,
			    0,  555,  509,  513,  561,  555,  557,  512,  514,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  735,    0,  510,  516,  516,  516,  516,  516,  516,  514,
			    0,  735,  513,  561,    0,  740,    0,  514,  517,  517,
			  517,  517,  517,  517,  557,  512,  518,  518,  518,  518,
			  518,  518,  516,  520,  520,  520,  520,  520,  520,  741,
			  513,  561,  519,  740,  519,  514,  519,  519,  519,  519,
			  519,  519,  540,    0,  518,  520,  522,  522,    0,  522,
			  523,  523,  566,  523,    0,    0,    0,  741,  519,  522,
			    0,  540,    0,  523,  519,  519,  524,  524,  540,  524,
			  522,  566,  518,  520,  523,    0,  544,  743,  522,  524,
			  525,  525,  523,  525,  554,  747,  519,  749,  560,  540,

			  524,  670,  519,  525,  544,  544,  540,  567,  617,  566,
			    0,    0,  554,  554,  525,  743,  522,  560,  670,  524,
			  523,    0,  670,  747,    0,  749,  567,  617,  560,  568,
			  525,  568,  544,  544,  568,  568,  568,  568,  568,  568,
			  554,  554,    0,    0,    0,  560,  670,  524,  569,  569,
			  569,  569,  569,  569,  567,  617,  560,  750,  525,  570,
			  570,  570,  570,  570,  570,  572,  572,  572,  572,  572,
			  572,  573,  573,  573,  573,  573,  573,    0,  776,    0,
			  777,  572,    0,    0,    0,  750,    0,  569,  574,  574,
			  574,  574,  574,  574,  575,  575,  575,  575,  575,  575,

			  576,  576,  576,  576,  576,  576,  776,  621,  777,  572,
			  573,  577,  577,  577,  577,  577,  577,  578,  578,  578,
			  578,  578,  578,  579,    0,  579,  621,    0,  579,  579,
			  579,  579,  579,  579,    0,  775,  775,    0,  775,  576,
			  580,  580,  580,  580,  580,  580,  583,  583,  583,  583,
			  583,  583,  585,  585,  621,  585,    0,  586,  586,  775,
			  586,    0,  583,  620,    0,  585,  607,    0,  608,    0,
			  586,  587,  587,    0,  587,    0,  585,  607,  620,  608,
			  585,  586,  620,    0,  587,  588,  588,  607,  588,  608,
			  583,  589,  589,  781,  589,  587,    0,  677,  588,  587,

			  590,  590,    0,  590,  589,  607,  620,  608,  585,  588,
			  620,  609,    0,  590,  677,  589,  591,  591,  677,  591,
			  784,  781,  609,  589,  590,  592,  592,  587,  592,  591,
			  594,  594,  609,  594,  595,  595,  800,  595,  592,  590,
			  591,    0,  677,  594,  803,    0,    0,  595,  784,  592,
			  609,  589,  596,  596,  594,  596,  597,  597,  595,  597,
			  598,  598,  592,  598,  800,  596,  595,  590,    0,  597,
			    0,  816,  803,  598,  594,    0,  596,  625,    0,  627,
			  597,    0,  599,  599,  598,  599,    0,    0,  821,    0,
			  592,    0,  598,    0,  595,  599,  625,  596,  627,  816,

			  597,    0,  594,  600,  626,  600,  599,  600,  600,  600,
			  600,  600,  600,  599,  603,  603,  821,  603,  604,  604,
			  598,  604,  731,  626,  625,  596,  627,  603,  597,  632,
			  626,  604,  605,  605,  633,  605,  600,    0,  603,  731,
			  832,  599,  604,  731,  636,  605,  606,  606,  632,  606,
			  634,  626,  639,  633,  640,  645,  605,  813,  626,  606,
			  632,  604,  605,  636,  646,  813,    0,  731,  832,  634,
			  606,  639,  640,  640,  645,  636,  632,  606,  813,  841,
			    0,  633,  634,  646,    0,    0,    0,    0,  632,  604,
			  605,  636,  851,  813,  646,  667,  667,  634,  667,  639,

			  640,  640,  645,  636,    0,  606,    0,  841,  667,    0,
			  634,  646,  647,  647,  647,  647,  647,  647,    0,  667,
			  851,    0,  646,  648,  648,  648,  648,  648,  648,  649,
			  649,  649,  649,  649,  649,  650,    0,  650,    0,    0,
			  650,  650,  650,  650,  650,  650,  651,    0,  651,    0,
			    0,  651,  651,  651,  651,  651,  651,  652,  652,  652,
			  652,  652,  652,  653,  653,  653,  653,  653,  653,  655,
			  655,  655,  655,  655,  655,  656,  656,  656,  656,  656,
			  656,  658,  658,  658,  658,  658,  658,  659,  659,  659,
			  659,  659,  659,    0,    0,    0,  652,  660,  660,  660,

			  660,  660,  660,  662,  662,  662,  662,  662,  662,    0,
			    0,    0,    0,  665,  665,  663,  665,  663,    0,  662,
			  663,  663,  663,  663,  663,  663,  665,  666,  666,    0,
			  666,  668,  668,    0,  668,  669,  669,  665,  669,    0,
			  666,    0,  662,    0,  668,    0,  691,  662,  669,  671,
			  671,  666,  671,    0,    0,  668,  665,  672,  672,  669,
			  672,  668,  671,    0,  666,  691,  673,  673,    0,  673,
			  672,    0,  697,  671,  674,  674,    0,  674,    0,  673,
			    0,  672,  675,  675,  665,  675,    0,  674,    0,  668,
			  673,  697,  666,  691,    0,  675,  676,  676,  674,  676,

			  678,  678,    0,  678,  679,  679,  675,  679,  698,  676,
			  688,  699,    0,  678,  692,  673,    0,  679,  701,  697,
			  676,  675,  680,  680,  678,  680,  704,  698,  679,  688,
			  699,  692,  678,  692,  688,  680,    0,  701,    0,  679,
			  729,  729,    0,  729,  673,  704,  680,  699,    0,  675,
			  705,  709,  704,  729,  680,  698,    0,  688,  699,  692,
			  678,  692,  688,    0,  729,  701,    0,  679,    0,  705,
			  709,    0,    0,  704,    0,    0,  699,    0,    0,    0,
			  704,    0,  680,  711,  711,  711,  711,  711,  711,  712,
			  712,  712,  712,  712,  712,    0,    0,  705,  709,  713,

			  713,  713,  713,  713,  713,  714,  714,  714,  714,  714,
			  714,  715,  715,  715,  715,  715,  715,  716,    0,  716,
			    0,    0,  716,  716,  716,  716,  716,  716,  712,  719,
			  719,  719,  719,  719,  719,  721,  721,  721,  721,  721,
			  721,  722,  722,  722,  722,  722,  722,  725,  725,    0,
			  725,  721,  723,  723,  723,  723,  723,  723,    0,  814,
			  725,    0,  726,  726,    0,  726,    0,  814,    0,  727,
			  727,  725,  727,    0,  721,  726,    0,  725,    0,  721,
			  814,    0,  727,    0,  730,  730,  726,  730,    0,  732,
			  732,  723,  732,  727,    0,  814,  736,  730,  726,    0,

			  736,  727,  732,  733,  733,  725,  733,    0,  730,  734,
			  734,  737,  734,  732,  730,  737,  733,  736,  742,  738,
			  732,    0,  734,  738,    0,  744,  726,  733,  736,  727,
			  746,    0,  737,  734,    0,  733,  748,  742,  752,  828,
			  738,  742,  730,  737,  744,    0,  771,  828,  732,  746,
			  771,  738,    0,  748,    0,  748,  752,  752,  766,  766,
			  828,  766,    0,  733,    0,  742,    0,  771,    0,  742,
			    0,  766,  744,    0,    0,  828,    0,  746,  771,    0,
			    0,  748,  766,  748,  752,  752,  753,  753,  753,  753,
			  753,  753,  755,  755,  755,  755,  755,  755,  756,  756, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  756,  756,  756,  756,  757,  757,  757,  757,  757,  757,
			  758,  758,  758,  758,  758,  758,  759,  759,  759,  759,
			  759,  759,    0,    0,    0,  753,  760,  760,  760,  760,
			  760,  760,  764,  764,    0,  764,    0,  756,  762,  762,
			  762,  762,  762,  762,    0,  764,  765,  765,  772,  765,
			  767,  767,  772,  767,    0,    0,  764,  780,  773,  765,
			  774,    0,  773,  767,  774,  769,  769,  764,  769,  772,
			  765,    0,  770,  770,  767,  770,  780,  762,  769,  773,
			  772,  774,  767,  778,  782,  770,  785,  849,    0,  769,
			  773,  765,  774,  802,  818,  764,  770,    0,  849,  820,

			    0,    0,  778,  782,  780,  785,    0,    0,  849,    0,
			  767,    0,  802,  818,    0,  778,    0,  770,  820,  765,
			  786,  786,  786,  786,  786,  786,  849,    0,    0,  802,
			  778,  782,    0,  785,  788,  788,  788,  788,  788,  788,
			  802,  818,  789,  778,  789,  770,  820,  789,  789,  789,
			  789,  789,  789,  791,  791,  804,  791,    0,  802,  786,
			  792,  792,    0,  792,    0,    0,  791,  793,  793,    0,
			  793,    0,    0,  792,  804,  794,  794,  791,  794,  850,
			  793,  789,    0,    0,  792,  791,  804,    0,  794,    0,
			  850,  793,  807,  807,  807,  807,  807,  807,    0,  794,

			  850,    0,  804,  809,  809,    0,  809,  810,  810,  792,
			  810,  793,    0,  791,  804,  815,  809,    0,  850,    0,
			  810,    0,  811,  811,  794,  811,  829,  809,  815,    0,
			    0,  810,    0,    0,  829,  811,  815,    0,  792,  793,
			    0,  812,  812,    0,  812,    0,  811,  829,  809,  815,
			  833,    0,  833,  794,  812,  822,  822,  822,  822,  822,
			  822,  833,  829,    0,  815,  812,  823,  823,  823,  823,
			  823,  823,  826,  826,  830,  826,  809,  827,  827,    0,
			  827,  859,  812,  859,    0,  826,  855,  830,    0,  833,
			  827,    0,  859,    0,    0,  830,  826,  855,    0,    0,

			    0,  827,  835,  835,  835,  835,  835,  855,  830,  827,
			  812,  836,  836,    0,  836,  837,  837,    0,  837,    0,
			  859,  826,    0,  830,  836,  855,    0,    0,  837,  843,
			  843,  843,  843,  843,  843,  836,    0,  827,    0,  837,
			  844,  844,  844,  844,  844,    0,  848,  848,    0,  848,
			  826,    0,  836,  847,  847,  847,  847,  847,  847,  848,
			  852,  852,  852,  852,  852,  852,  854,  854,    0,  854,
			  848,  853,  853,  853,  853,  853,  853,  856,  848,  854,
			  836,  858,  858,  858,  858,  858,  858,    0,  856,    0,
			  854,  862,  862,  862,  862,  862,  862,  866,  856,  863,

			  863,  863,  863,  863,  863,  867,  848,  864,  864,  864,
			  864,  864,    0,    0,  866,    0,  856,    0,  866,    0,
			    0,    0,  867,  870,  871,    0,  867,  868,  868,  868,
			  868,  868,  868,  869,  869,  869,  869,  869,  869,    0,
			  870,  871,  866,    0,  870,  871,  873,  873,  873,  873,
			  867,  872,  872,  872,  872,  872,  872,  876,  876,  876,
			  876,  876,  876,    0,    0,    0,    0,    0,  870,  871,
			  877,  877,  877,  877,  877,  877,  878,  878,  878,  878,
			  878,  878,    0,    0,    0,  873,  880,  880,  880,  880,
			  880,  880,  881,    0,  881,    0,    0,  881,  881,  881,

			  881,  881,  881,  882,  882,  882,  882,  882,  882,  883,
			  883,  883,  883,  883,  883,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  881,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,

			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,

			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  889,  889,    0,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,    0,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  890,  890,    0,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,

			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  892,  892,  892,    0,    0,    0,    0,    0,    0,
			  892,  892,  892,  892,    0,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,    0,    0,

			  892,  892,  892,  892,  892,  892,  892,  892,  892,  893,
			  893,    0,  893,  893,  893,  893,  893,    0,    0,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,    0,    0,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  894,  894,    0,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  894,  894,  894,  894,  895,  895,    0,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,    0,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,

			  896,  896,  896,  896,  896,  896,  897,    0,  897,    0,
			    0,    0,    0,  897,  897,  897,  897,  897,    0,    0,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,    0,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,

			  898,  898,  898,  898,  898,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  900,  900,    0,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,

			  900,  900,  900,  900,  900,  900,  900,  901,    0,    0,
			    0,  901,  901,  901,    0,    0,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,    0,
			    0,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,

			  902,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			    0,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  904,    0,    0,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,    0,    0,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  905,  905,  905,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  905,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,    0,    0,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  908,  908,
			  908,    0,    0,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,    0,    0,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  909,    0,  909,
			    0,    0,    0,    0,  909,  909,  909,  909,  909,    0,
			    0,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,

			  909,  909,  909,  909,    0,    0,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  910,  910,  910,    0,    0,
			  910,  910,  910,  910,  910,  910,  910,  910,    0,    0,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,    0,    0,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  911,    0,  911,    0,    0,    0,
			    0,  911,  911,  911,  911,  911,    0,    0,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,

			  911,    0,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,    0,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,    0,    0,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  914,  914,  914,

			    0,    0,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,    0,    0,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  916,
			    0,    0,    0,  916,  916,  916,    0,    0,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,    0,    0,  916,  916,  916,  916,  916,  916,  916, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  916,  916,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,    0,    0,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  918,  918,  918,    0,
			    0,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,    0,    0,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,    0,    0,

			  919,  919,  919,  919,  919,  919,  919,  919,  919,  920,
			  920,  920,    0,    0,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,    0,    0,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,

			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884, yy_Dummy>>,
			1, 241, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   78,    0,    0,  187,
			    0,   68,   71, 1275, 6148,   99, 1269, 1243, 1244, 6148,
			   91,    0, 6148, 6148, 6148, 6148, 1233,   89, 1220,   99,
			  119, 6148, 6148, 1204, 6148, 1157, 1140,  278,  282,  288,
			  121,  298,  326,  333,  348,  304,  337,  355,  427,  399,
			  364,  409,  460, 1109, 6148, 6148, 1108,  539,  618,   95,
			   93,  341,  427,  109,  441,  264,  263,  361,  456,  450,
			  458,  281, 1130, 6148, 6148, 1135,  156, 6148,  109,  369,
			  285,  445,  412,  451,  111, 1054,  113, 6148,  294, 1127,
			  540,  619, 6148,   86,  697, 6148,  168, 1124, 6148, 1096,

			 6148, 1092,    0,  696, 1087, 1074, 1052,  733, 6148,  688,
			  739,  763,  784,  794, 6148, 6148, 6148,  468,  520,    0,
			  816,  820,  824,  838,  853,  867,  873,  892,  901,  887,
			  773,  918,  940,  933,  948,  962,  976,  968, 1024, 1002,
			 1009, 1103, 1029, 1094, 1129, 1133, 1170, 1048, 1177, 1184,
			 1035,  349,  974, 6148,  546, 1011, 1250,  989,   89,  243,
			  262,  532, 1198,  907,  895,  850,  319,  984,  319,  329,
			  981, 1018,  339,  732, 1033, 1163,  392,  395, 1131, 1066,
			  962,  611,  437,  731,  923, 1168, 1192, 1200,  459, 1229,
			  492, 1232,  532,  610, 1227, 1234,  734,  724,  815,  852,

			  796,  775, 1316,  818,  787, 1317,   97, 1318, 6148,  969,
			 6148,  284, 6148, 6148, 1062,  545, 1071, 1249, 1262,  460,
			  873,  496, 6148,  866,  719, 1339, 6148,  936, 1341,  381,
			 1398,  437,  618, 1489, 6148, 6148,  903,  982, 6148, 6148,
			 6148,  906, 1280,  899,  896,  872,  852, 1094,  718, 6148,
			 1524, 1352, 1477, 1483, 6148, 1530, 1547, 1557, 1489, 1575,
			 6148,    0,  826, 1586, 1600, 1604, 1608, 1626, 1630, 1634,
			 1659, 1664, 1679, 1686, 1615, 1706, 1713, 1731, 1739, 1746,
			 1753, 1761, 1781, 1770, 1798, 1807, 1813, 1828, 1837, 1843,
			 1853, 1852, 1876, 1880, 1898, 1905, 1923, 1930, 1938, 1956,

			 1960, 1974,  824, 1972, 1985, 6148,  819,  958,  951,    0,
			 1996, 2008, 1057, 1665, 1243,  955, 2005,  980, 1019, 1323,
			 1685, 1032, 1094, 1114, 1325, 2006, 2007, 1116,  771, 2017,
			 1889, 1869, 1137, 1161, 1167, 1205, 2018, 2021, 1609, 1213,
			 1780,    0, 1327, 1205, 1244, 2008, 1584, 1319, 1329, 2031,
			 1658, 1510, 1510,  767, 2043, 2044, 2056,    0, 1688,  346,
			 2061, 1963,  430, 2057, 1199, 2067, 2075, 2079,  808, 2094,
			 6148,  842, 1081,  790, 2099, 6148, 6148, 2111, 6148, 6148,
			 6148, 6148, 6148, 2117, 2149, 2162, 2168, 2174, 2180, 2202,
			 2186, 2208, 2225, 2234, 2240, 2246,    0,  761, 2268, 2272,

			 2286, 2290, 2304, 2320, 2334, 2342, 2349, 2369, 1731, 2375,
			 2383, 2389, 2403, 2417, 2421, 2435, 2455, 2108, 2388, 2465,
			 2477, 2501, 2517, 2531, 2551, 2557, 2487, 2501, 1847, 2541,
			 2579, 2584, 2588, 2604,  620, 2615, 2640,    0, 1511,  455,
			 2270, 2632, 1512, 2551, 1587, 1624, 2401, 1760,    0, 1647,
			 1655, 2217, 2606, 2637, 1736, 1744, 2265, 1744, 1763, 1811,
			 1827, 2526, 2617, 2607, 1840, 2638, 1839, 1843, 2652, 2662,
			    0,    0, 2299, 2314, 1866, 1911, 2312, 2658, 2668,  711,
			 2387, 2718, 2724, 2735, 2741,  699, 2748, 2754, 2765, 2771,
			 2777, 2793,  293, 2805, 2822, 2665,  486,  688, 2706, 2804,

			 2844, 2848, 2853, 2870, 2878, 2885, 2917,  648, 2892, 2931,
			 2936, 2945, 2963, 2967, 2983, 6148, 2985, 3000, 3008, 3028,
			 3015, 2329, 3054, 3058, 3074, 3088, 2842,  869, 1712, 1839,
			 6148, 1735,    0,  590, 2431, 2803, 1918, 2496, 1928, 1977,
			 3037, 2689, 2001, 2549, 3071, 2802,    0, 2027, 2887, 2058,
			 2065, 2109,    0, 2893, 3079, 2929, 2116, 2962, 2165, 2177,
			 3083, 2979, 2178, 2179, 2227, 2248, 3047, 3092, 3116, 3130,
			 3141, 2656, 3147, 3153, 3170, 3176, 3182, 3193, 3199, 3210,
			 3222, 1494, 6148, 3228,    0, 3250, 3255, 3269, 3283, 3289,
			 3298, 3314, 3323, 2855, 3328, 3332, 3350, 3354, 3358, 3380,

			 3389, 6148,  610, 3412, 3416, 3430, 3444, 3237, 3239, 3282,
			  104, 6148, 6148, 2276, 1236, 2266,    0, 3093, 2304,    0,
			 3248, 3192, 2331, 2373,    0, 3362, 3389, 3364, 2475, 2485,
			 2566, 2568, 3414, 3419, 3435, 2570, 3429, 2653, 2655, 3437,
			 3439,    0, 2646, 2666, 2672, 3440, 3449, 3494, 3505, 3511,
			 3522, 3533, 3539, 3545, 2795, 3551, 3557,  614, 3563, 3569,
			 3579, 6148, 3585, 3602,    0, 3611, 3625, 3493, 3629, 3633,
			 3072, 3647, 3655, 3664, 3672, 3680, 3694, 3268, 3698, 3702,
			 3720,  612,  578,  553,  538,    0, 2758, 2765, 3695,    0,
			 2877, 3631, 3699,    0,    0,    0,  845, 3657, 3693, 3696,

			    0, 3703, 2884,    0, 3711, 3735, 2896, 2908, 2925, 3736,
			  459, 3765, 3771, 3781, 3787, 3793, 3804,  409, 2138, 3811,
			 2455, 3817, 3823, 3834,  427, 3845, 3860, 3867, 6148, 3738,
			 3882, 3393, 3887, 3901, 3907, 2950, 3867, 3882, 3890,  416,
			 2983, 3001, 3903, 3053, 3910,    0, 3915, 3063, 3921, 3064,
			 3123,    0, 3923, 3968,  361, 3974, 3980, 3986, 3992, 3998,
			 4008, 6148, 4020,    0, 4030, 4044, 3956, 4048, 6148, 4063,
			 4070, 3917, 4019, 4029, 4031, 3233, 3141, 3133, 4068,    0,
			 4042, 3259, 4069,    0, 3273, 4071, 4102,  331, 4116, 4129,
			    0, 4151, 4158, 4165, 4173,  436, 6148, 1931,  286, 6148,

			 3302,  866, 4078, 3298, 4140,  947, 2091, 4174,  305, 4201,
			 4205, 4220, 4239, 3428, 3830, 4199, 3324,    0, 4079,    0,
			 4084, 3345, 4237, 4248,    0,   98, 4270, 4275, 3910, 4197,
			 4258,  965, 3406, 4237,    0, 4283, 4309, 4313,  144,  142,
			  688, 3436,    0, 4311, 4322, 6148,  511, 4335, 4344, 4058,
			 4150, 3458, 4342, 4353, 4364, 4257, 4348,    0, 4363, 4268,
			  128,  126, 4373, 4381, 4389, 6148, 4368, 4376, 4409, 4415,
			 4394, 4395, 4433, 4433, 6148, 6148, 4439, 4452, 4458, 6148,
			 4468, 4479, 4485, 4491, 6148, 4531, 4582, 4633, 4684, 4735,
			 4786, 4822, 4859, 4903, 4952, 5003, 5054, 5104, 5153, 5204,

			 5255, 5300, 5349, 5400, 5444, 5492, 5527, 5576, 5617, 5665,
			 5714, 5762, 5811, 5847, 5886, 5920, 5952, 5986, 6025, 6059,
			 6098, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  884,    1,  885,  885,  886,  886,  887,  887,  884,
			    9,  888,  888,  884,  884,  884,  884,  884,  889,  884,
			  890,  891,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  893,  884,  884,  894,  884,  884,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  884,  884,  884,  895,  884,  884,  884,  895,
			  895,  895,  895,  895,  896,  884,  896,  884,  897,  884,
			  897,  897,  884,  898,  899,  884,  884,  884,  884,  889,

			  884,  900,  900,  900,  901,  902,  884,  884,  884,  884,
			  903,  884,  884,  884,  884,  884,  884,  884,  892,  904,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,   48,  892,
			  892,  892,  892,   48,  892,  892,  892,  892,  892,  892,
			  893,  893,  894,  884,  884,  884,   58,  884,  156,  156,
			  156,   58,   58,   58,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,   58,   58,  156,  156,   58,   58,
			  156,   58,  156,  156,  156,   58,   58,   58,  156,   58,
			  156,   58,  156,  156,   58,   58,  156,  156,   58,   58,

			  156,  156,   58,   58,  156,   58,  156,   58,  884,  895,
			  884,  884,  884,  884,  895,  895,  895,  895,  895,  896,
			  884,  896,  884,  884,  897,  897,  884,  884,  884,  884,
			  884,  884,  898,  899,  884,  884,  233,  905,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  906,  904,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  884,  892,  892,  892,  892,  892,
			  892,  892,  892,  884,  892,  284,  284,  284,  284,  141,
			  141,  141,  892,  892,  892,  892,  892,  892,  892,  892,

			  892,  892,  884,  893,  893,  884,  884,  156,  156,  156,
			  884,  156,   58,   58,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,  156,   58,   58,   58,  156,  156,   58,
			   58,  884,  156,  156,  156,  156,   58,   58,   58,  156,
			   58,  156,   58,  156,  156,   58,   58,  156,  156,   58,
			   58,  156,  156,  156,   58,   58,   58,  156,   58,  156,
			   58,  895,  895,  895,  895,  895,  895,  895,  907,  907,
			  884,  907,  907,  907,  905,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  908,  904,  892,  892,

			  892,  892,  892,  892,  892,  892,  892,  892,  884,  892,
			  892,  892,  892,  892,  892,  892,  884,  284,  141,  284,
			  138,  284,  138,  884,  284,  284,  892,  892,  884,  892,
			  892,  892,  892,  892,  909,  893,  893,  910,  156,  156,
			   58,   58,  156,   58,  156,  156,   58,   58,  156,  156,
			  156,   58,   58,   58,  156,  156,   58,  156,  156,  156,
			  156,   58,   58,   58,  156,   58,  156,  156,   58,   58,
			  156,  156,   58,   58,  156,  156,  156,   58,   58,  156,
			   58,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  903,  884,  884,  884,  908,  892,  892,

			  892,  892,  892,  892,  892,  892,  892,  884,  892,  892,
			  892,  892,  892,  892,  892,  884,  284,  284,  884,  284,
			  519,  884,  892,  892,  892,  892,  906,  884,  911,  909,
			  884,  884,  156,  156,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,   58,   58,  156,  156,   58,  156,
			  156,  156,  156,   58,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,  156,  156,   58,   58,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  912,  913,  892,  892,  892,  892,  892,
			  892,  892,  892,  884,  892,  892,  892,  892,  892,  892,

			  284,  884,  884,  892,  892,  892,  892,  884,  908,  908,
			  911,  884,  884,  884,  884,  156,  156,   58,  156,  156,
			   58,   58,  156,  156,  156,   58,   58,   58,  156,  156,
			  156,  156,   58,   58,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,  156,  156,   58,   58,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  914,  892,  892,  892,  892,  892,
			  884,  892,  892,  892,  892,  892,  892,  884,  892,  892,
			  892,  884,  884,  908,  908,  915,  156,  156,   58,  156,
			  156,   58,   58,  156,  156,  156,  156,   58,   58,   58,

			  156,   58,  156,  156,   58,   58,  156,  156,  156,   58,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  914,  892,  892,  892,  884,  892,
			  892,  884,  892,  892,  892,  884,  884,  913,  913,  916,
			  156,  156,   58,  156,   58,  156,   58,  156,   58,  156,
			  156,  156,   58,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  917,  892,  892,  892,  892,  884,  892,
			  892,  884,  884,  914,  914,  884,  156,  156,   58,  156,
			   58,  156,   58,  156,  156,   58,  884,  884,  884,  884,
			  918,  892,  892,  892,  892,  884,  884,  914,  914,  884,

			  156,  156,   58,  156,   58,  156,  884,  884,  918,  892,
			  892,  892,  892,  884,  884,  914,  156,  156,   58,  156,
			   58,  156,  884,  884,  919,  884,  892,  892,  884,  884,
			  914,  156,  156,  884,  920,  884,  892,  892,  884,  884,
			  914,  156,  156,  884,  884,  884,  920,  884,  892,  884,
			  884,  156,  884,  884,  892,  884,  884,  156,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,    0,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,

			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884, yy_Dummy>>)
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
			    6,    7,    1,    1,    8,    9,   10,    1,   11,   11,
			   11,   11,   12,   13,    1,    1,   14,    1,   15,    1,
			   16,   17,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,    5,   39,   40,    5,   11,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   42,   43,   44,   45,   46,   47,   48,
			   49,    5,    5,   50,   51,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  133,  131,    1,    2,   15,  115,   18,
			  131,   16,   17,    7,    6,   13,    5,   11,    8,  106,
			  106,   14,   12,   29,   10,   30,   20,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   83,   98,
			   98,   98,   98,   22,   31,   23,    9,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,   24,   21,   25,  119,  120,  121,  122,  119,
			  119,  119,  119,  119,  132,  132,  132,  132,  132,   70,
			  132,  132,   72,  132,  132,   97,    1,    2,   28,  115,

			  114,  129,  129,  129,    0,    3,   33,  110,   32,    0,
			    0,  106,    0,  106,   27,   26,   19,    0,   98,   92,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   40,   98,   91,
			   91,   82,   91,   91,   98,   98,   98,   98,   98,   98,
			    0,    0,    0,  105,    0,    0,  101,    0,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,   40,  101,   40,  101,  101,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  102,  119,
			  121,  120,  117,  116,  118,  119,  119,  119,  119,    0,
			    0,    0,  104,  103,    0,    0,   72,   70,    0,   69,
			    0,   68,    0,    0,   97,   95,   95,    0,   96,  129,
			  123,  129,  129,  129,  129,  129,  129,    0,    4,   34,
			  110,    0,    0,    0,  108,  110,  108,  106,    0,    0,
			   92,    0,    0,   98,   98,   39,   98,   98,   98,   98,
			   98,   98,   98,   98,    0,   98,   98,   98,   98,   98,
			   42,   98,   98,    0,   83,   84,   83,   83,   83,   90,
			   98,   90,   90,   90,   98,   98,   98,   98,   98,   98,

			   41,   98,    0,    0,    0,  100,    0,  101,  101,   39,
			   73,   73,  101,  101,   39,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,    0,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,   42,   42,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,   41,   41,  101,
			  101,  119,  119,  119,  119,  119,  119,  119,    0,    0,
			   71,   69,   68,   72,    0,  127,  130,  130,  128,  124,
			  125,  126,   93,  110,    0,  110,    0,    0,  110,    0,
			    0,    0,  109,  106,    0,    0,    0,   99,   98,   98,

			   98,   98,   98,   38,   98,   98,   98,   98,    0,   98,
			   98,   98,   98,   98,   98,   98,    0,   98,   82,   98,
			   98,   98,   98,    0,   82,   82,   82,   37,    0,   44,
			   98,   98,   98,   98,   67,    0,    0,   63,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,   38,  101,
			  101,   38,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			   37,   44,   37,   44,  101,  101,  101,  101,  101,  101,
			  101,  110,  110,    0,    0,  107,  110,    0,  109,    0,
			  109,    0,    0,    0,  106,   79,    0,    0,   60,   98,

			   98,   98,   98,   98,   98,   45,   98,    0,   98,   98,
			   98,   36,   98,   98,   98,   84,   84,   83,    0,   98,
			   98,    0,   98,   98,   98,   98,    0,   67,   67,    0,
			   66,   66,   60,  101,   60,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,   45,  101,   45,  101,
			  101,  101,   36,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,    0,  110,
			    0,  113,  110,  109,    0,    0,  109,    0,    0,  108,
			    0,    0,   79,    0,    0,   98,   61,   98,   62,   98,
			   98,   47,   98,    0,   98,   98,   98,   98,   98,   98,

			   98,   82,    0,   53,   98,   98,   98,    0,    0,    0,
			    0,   65,   64,    0,    0,  101,   61,   61,  101,   62,
			  101,   62,  101,  101,   47,  101,  101,   47,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,   53,  101,  101,  101,   53,  101,    0,  110,    0,
			    0,    0,  109,    0,  113,  109,    0,   81,    0,    0,
			    0,  111,  113,  111,    0,   98,   98,   59,   98,   46,
			    0,   43,   58,   98,   35,   98,   51,    0,   98,   98,
			   98,    0,    0,    0,    0,    0,  101,  101,  101,   59,
			  101,   59,  101,   46,   43,   58,  101,   43,   58,  101,

			   35,   35,  101,   51,  101,   51,  101,  101,  101,  101,
			  113,    0,  113,    0,  109,    0,    0,  112,    0,    0,
			   78,  113,    0,  112,    0,   98,   98,   98,   87,   54,
			   98,    0,   98,   98,   55,    0,    0,    0,    0,    0,
			  101,  101,  101,  101,  101,   54,   54,  101,  101,  101,
			  101,   55,  101,  113,  112,    0,  112,    0,    0,    0,
			    0,   78,  112,    0,   98,   98,   48,   98,   86,   52,
			   98,    0,    0,    0,    0,    0,  101,  101,  101,   48,
			   48,  101,  101,   52,  101,   52,  112,   80,    0,   78,
			    0,   98,   98,   98,   98,   85,   85,   85,   85,   94,

			  101,  101,  101,  101,  101,  101,    0,    0,    0,   98,
			   50,   49,   98,    0,    0,    0,  101,   50,   50,   49,
			   49,  101,    0,    0,    0,    0,   98,   98,    0,    0,
			    0,  101,  101,   77,    0,    0,   98,   56,    0,    0,
			    0,  101,   56,    0,    0,   77,    0,   74,   98,    0,
			    0,  101,    0,    0,   57,    0,    0,   57,    0,   76,
			    0,    0,    0,    0,    0,   76,    0,    0,    0,    0,
			    0,    0,    0,   75,   88,   89,    0,    0,    0,   75,
			    0,   75,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6148
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 884
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 885
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

	yyNb_rules: INTEGER = 132
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 133
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
