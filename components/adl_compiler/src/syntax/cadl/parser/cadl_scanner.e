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
--|#line 399 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 399")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 94 then
--|#line 405 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 405")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 409 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 409")
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
 			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
--|#line 450 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 450")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 456 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 456")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 98 then
--|#line 462 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 462")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 468 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 468")
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
if yy_act <= 115 then
if yy_act <= 107 then
if yy_act <= 103 then
if yy_act <= 101 then
if yy_act = 100 then
--|#line 475 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 475")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 481 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 481")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 102 then
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 492 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 492")
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
if yy_act <= 105 then
if yy_act = 104 then
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 510 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 510")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 106 then
--|#line 515 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 515")
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
--|#line 530 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 530")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
else
if yy_act <= 111 then
if yy_act <= 109 then
if yy_act = 108 then
--|#line 531 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 531")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 532 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 532")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 110 then
	yy_end := yy_end - 1
--|#line 536 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 536")
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
--|#line 537 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 537")
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
if yy_act <= 113 then
if yy_act = 112 then
--|#line 538 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 538")
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
--|#line 558 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 558")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 114 then
--|#line 563 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 563")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 571 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 571")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 123 then
if yy_act <= 119 then
if yy_act <= 117 then
if yy_act = 116 then
--|#line 573 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 573")
end
in_buffer.append_character ('"')
else
--|#line 575 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 575")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 118 then
--|#line 579 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 579")
end
in_buffer.append_string (text)
else
--|#line 581 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 581")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 121 then
if yy_act = 120 then
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
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
--|#line 597 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 597")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 122 then
--|#line 606 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 606")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 608 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 608")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 127 then
if yy_act <= 125 then
if yy_act = 124 then
--|#line 609 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 609")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 610 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 610")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 126 then
--|#line 611 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 611")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 612 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 612")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 129 then
if yy_act = 128 then
--|#line 614 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 614")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 615 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 615")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 130 then
--|#line 619 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 619")
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
			create an_array.make (0, 6225)
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
			   14,   14,   14,   76,   85,   85,   95,   77,   76,   95,

			  103,   97,   77,   97,   97,  107,  878,  108,  108,  108,
			  108,  108,  108,  110,  235,  111,  304,  112,  112,  112,
			  112,  112,  112,  118,  118,  169,  118,  157,  213,  157,
			  308,   86,   86,  110,  170,  111,  309,  114,  114,  114,
			  114,  114,  114,  157,   78,  104,  181,  120,  360,   78,
			  861,   96,  305,  171,   96,  162,  113,  162,  308,  611,
			   87,   87,  172,  212,  309,  212,  212,  305,  860,  236,
			   97,  162,   97,   97,  182,  214,  113,  360,   79,   80,
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
			  118,  118,  310,  118,  118,  118,  212,  118,  212,  212,
			  118,  118,  211,  118,  189,  844,  231,  157,  157,  231,

			  118,  118,  843,  118,  120,  191,  118,  118,  120,  118,
			  310,  829,  221,  121,  120,  157,  124,  122,  125,  123,
			  226,  759,  190,  226,  120,  162,  162,  126,  118,  118,
			  120,  118,  207,  192,  135,  118,  118,  127,  118,  118,
			  118,  121,  118,  162,  124,  122,  125,  123,  128,  222,
			  118,  118,  120,  118,  316,  126,  129,  118,  118,  120,
			  118,  208,  135,  120,  318,  127,  118,  118,  130,  118,
			  131,  319,  216,  228,  120,  157,  211,  128,  223,  136,
			  173,  120,  316,  233,  129,  322,  233,  137,  132,  133,
			  120,  174,  318,  193,  134,  157,  130,  800,  131,  319,

			  138,  118,  118,  162,  118,  147,  194,  136,  175,  328,
			  148,  118,  118,  322,  118,  137,  132,  133,  574,  211,
			  176,  195,  134,  162,  250,  120,  250,  250,  138,  118,
			  118,  329,  118,  147,  196,  120,  145,  328,  148,  480,
			  224,  578,  578,  759,  146,  139,  139,  139,  139,  139,
			  139,  149,  211,  120,  215,  215,  215,  177,  211,  329,
			  140,  157,  118,  118,  145,  118,  492,  141,  480,  178,
			  118,  118,  146,  118,  142,  157,  143,  222,  144,  149,
			  333,  183,  184,  484,  157,  179,  120,  185,  140,  162,
			  157,  201,  157,  197,  262,  141,  202,  180,  218,  218,

			  205,  198,  583,  162,  533,  143,  223,  144,  333,  186,
			  187,  150,  162,  369,  528,  188,  735,  529,  162,  203,
			  162,  199,  118,  118,  204,  118,  807,  734,  206,  200,
			  217,  217,  217,  533,  733,  263,  219,  219,  219,  340,
			  150,  155,  230,  113,  155,  230,  120,  263,  155,  156,
			  225,  155,  211,  732,  231,  232,  156,  157,  157,  157,
			  157,  157,  157,  158,  342,  233,  157,  340,  808,  157,
			  157,  157,  157,  157,  159,  157,  157,  157,  160,  157,
			  161,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  342,  715,  162,  228,  157,  162,  162,  163,

			  162,  162,  164,  162,  162,  162,  165,  162,  166,  162,
			  162,  162,  162,  162,  163,  162,  162,  162,  162,  162,
			  155,  230,  528,  155,  230,  528,  263,  675,  156,  613,
			  215,  215,  215,  231,  593,  332,  157,  157,  157,  157,
			  157,  157,  158,  344,  233,  157,  235,  584,  157,  157,
			  157,  157,  167,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  344,  110,  162,  228,  157,  162,  162,  162,  162,
			  168,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  238,

			  238,  236,  238,  818,  819,  243,  255,  255,  255,  255,
			  255,  255,  759,  211,  244,  244,  244,  244,  244,  244,
			  844,  226,  818,  819,  226,  239,  527,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  245,  252,  252,  252,  252,  252,  252,  257,  257,  257,
			  257,  257,  257,  334,  323,  246,  335,  253,  345,  247,
			  324,  248,  348,  258,  228,  118,  118,  110,  118,  111,
			  240,  259,  259,  259,  259,  259,  259,  260,  263,  399,
			  254,  334,  323,  216,  335,  253,  345,  276,  324,  120,

			  348,  258,  261,  261,  261,  261,  261,  261,  110,  349,
			  111,  372,  259,  259,  259,  259,  259,  259,  118,  118,
			  113,  118,  118,  118,  354,  118,  118,  118,  372,  118,
			  263,  263,  358,  477,  352,  263,  456,  349,  353,  263,
			  118,  118,  120,  118,  373,  372,  120,  373,  438,  348,
			  120,  113,  354,  263,  436,  118,  118,  267,  118,  266,
			  358,  263,  352,  265,  120,  263,  353,  263,  263,  118,
			  118,  399,  118,  268,  383,  118,  118,  350,  118,  120,
			  354,  382,  263,  310,  157,  267,  157,  266,  263,  118,
			  118,  265,  118,  120,  118,  118,  741,  118,  269,  120,

			  349,  268,  263,  118,  118,  381,  118,  263,  357,  270,
			  263,  315,  162,  120,  162,  380,  263,  811,  120,  271,
			  118,  118,  263,  118,  272,  741,  269,  120,  351,  157,
			  273,  377,  275,  263,  309,  118,  118,  270,  118,  878,
			  274,  157,  118,  118,  120,  118,  811,  271,  263,  229,
			  118,  118,  272,  118,  308,  263,  221,  162,  273,  120,
			  275,  277,  314,  263,  118,  118,  120,  118,  274,  162,
			  118,  118,  278,  118,  120,  279,  225,  263,  118,  118,
			  211,  118,  313,  263,  376,  376,  336,  376,  120,  277,
			  280,  263,  439,  222,  120,  281,  263,  440,  815,  263, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  278,  284,  120,  279,  118,  118,  276,  118,  283,  282,
			  239,  118,  118,  443,  118,  157,  835,  263,  157,  316,
			  439,  307,  223,  281,  263,  440,  318,  815,  120,  284,
			  306,  118,  118,  263,  118,  120,  283,  282,  285,  263,
			  285,  443,  140,  162,  263,  835,  162,  317,  263,  291,
			  118,  118,  157,  118,  320,  120,  291,  286,  143,  154,
			  319,  287,  140,  263,  288,  445,  446,  157,  304,  211,
			  140,  119,  263,  289,  120,  290,  291,  251,  211,  322,
			  162,  263,  301,  374,  372,  286,  374,  143,  321,  287,
			  140,  439,  288,  445,  446,  162,  224,  250,  249,  449,

			  157,  242,  289,  101,  290,  118,  118,  325,  118,  263,
			  301,  329,  119,  119,  119,  119,  119,  119,  263,  441,
			   98,  292,  292,  292,  292,  292,  292,  449,  162,  120,
			  229,  118,  118,  222,  118,  118,  118,  225,  118,  331,
			  293,  291,  211,  294,  263,  119,  263,  209,  263,  295,
			  362,  363,  364,  365,  366,  120,  215,  215,  215,  120,
			  450,  154,  223,  296,  152,  157,  297,  117,  293,  116,
			  328,  294,  118,  118,  119,  118,  451,  295,  263,  118,
			  118,  298,  118,  263,  115,  263,  118,  118,  450,  118,
			  109,  296,  263,  162,  297,  323,  120,  157,  330,  263,

			  455,  324,  157,  120,  451,  458,  106,  263,  299,  298,
			  120,  333,  300,  263,  311,  263,  312,  312,  312,  312,
			  312,  312,  302,  326,  334,  162,  157,  335,  455,  327,
			  162,  101,  157,  458,  157,  303,  299,   99,   98,  337,
			  300,  878,  263,  459,  263,  460,  878,  263,  878,  263,
			  302,  878,  338,  461,  162,  339,  211,  336,  263,  344,
			  162,  157,  162,  157,  303,  263,  157,  345,  157,  211,
			  878,  459,  878,  460,  878,  878,  340,  157,  878,  342,
			  878,  461,  249,  249,  157,  249,  878,  346,  878,  162,
			  878,  162,  878,  878,  162,  347,  162,  378,  379,  379,

			  379,  379,  379,  379,  341,  162,  384,  343,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  263,  263,  263,  367,  367,  367,  878,  263,  878,
			  263,  230,  263,  230,  230,  878,  230,  368,  368,  368,
			  157,  157,  157,  231,  352,  231,  445,  157,  353,  449,
			  465,  157,  358,  467,  233,  386,  233,  386,  878,  360,
			  387,  387,  387,  387,  387,  387,  878,  878,  162,  162,
			  162,  878,  355,  878,  447,  162,  356,  452,  465,  162,
			  359,  467,  878,  878,  228,  878,  228,  878,  361,  370,

			  371,  372,  370,  371,  370,  370,  370,  370,  370,  370,
			  370,  370,  373,  232,  232,  370,  232,  232,  232,  232,
			  232,  232,  370,  374,  370,  370,  370,  370,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  370,  370,  375,  370,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  238,  238,  878,  238,  388,  388,  388,  388,  388,

			  388,  389,  389,  389,  389,  389,  389,  396,  396,  396,
			  396,  396,  658,  658,  658,  658,  658,  239,  878,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  385,  385,  385,  385,  385,  385,  390,  390,
			  390,  390,  390,  390,  468,  471,  472,  475,  253,  878,
			  393,  878,  393,  878,  391,  394,  394,  394,  394,  394,
			  394,  110,  240,  111,  878,  395,  395,  395,  395,  395,
			  395,  254,  468,  471,  472,  475,  253,  392,  118,  118,
			  878,  118,  391,  397,  397,  397,  397,  397,  397,  263,

			  878,  263,  118,  118,  878,  118,  118,  118,  878,  118,
			  118,  118,  120,  118,  113,  263,  878,  878,  468,  263,
			  400,  878,  878,  263,  263,  476,  120,  878,  118,  118,
			  120,  118,  118,  118,  120,  118,  118,  118,  878,  118,
			  878,  263,  401,  157,  410,  263,  470,  460,  400,  263,
			  402,  878,  120,  476,  878,  410,  120,  878,  532,  403,
			  120,  118,  118,  878,  118,  410,  118,  118,  405,  118,
			  401,  162,  878,  263,  263,  464,  404,  878,  402,  263,
			  263,  118,  118,  410,  118,  120,  532,  403,  118,  118,
			  120,  118,  472,  878,  263,  211,  405,  878,  406,  157,

			  263,  263,  536,  263,  404,  120,  878,  440,  118,  118,
			  407,  118,  120,  878,  528,  118,  118,  529,  118,  157,
			  474,  263,  157,  878,  878,  408,  406,  162,  263,  878,
			  536,  446,  120,  118,  118,  442,  118,  878,  407,  120,
			  878,  118,  118,  409,  118,  411,  263,  162,  118,  118,
			  162,  118,  412,  408,  263,  118,  118,  120,  118,  448,
			  508,  263,  878,  118,  118,  120,  118,  611,  263,  413,
			  538,  508,  120,  411,  218,  218,  263,  414,  415,  120,
			  412,  508,  539,  118,  118,  878,  118,  120,  418,  418,
			  418,  418,  418,  418,  542,  263,  263,  413,  538,  508,

			  118,  118,  878,  118,  878,  414,  415,  120,  878,  416,
			  539,  543,  465,  263,  157,  417,  419,  419,  419,  419,
			  419,  419,  542,  878,  120,  421,  421,  421,  421,  421,
			  421,  422,  422,  422,  422,  422,  422,  416,  878,  543,
			  466,  878,  162,  417,  610,  420,  423,  423,  423,  423,
			  423,  423,  546,  878,  119,  424,  424,  424,  424,  424,
			  424,  119,  119,  119,  119,  119,  119,  425,  547,  425,
			  119,  119,  119,  119,  119,  119,  522,  549,  118,  118,
			  546,  118,  118,  118,  550,  118,  307,  522,  551,  119,
			  426,  263,  878,  427,  612,  263,  547,  522,  410,  428,

			  118,  118,  120,  118,  263,  549,  120,  118,  118,  410,
			  118,  878,  550,  263,  552,  522,  551,  119,  426,  410,
			  263,  427,  295,  157,  120,  118,  118,  428,  118,  430,
			  878,  120,  118,  118,  878,  118,  807,  410,  263,  429,
			  118,  118,  552,  118,  556,  263,  456,  759,  878,  120,
			  295,  162,  558,  263,  878,  878,  120,  431,  118,  118,
			  878,  118,  118,  118,  120,  118,  878,  429,  878,  559,
			  562,  263,  556,  878,  432,  263,  118,  118,  809,  118,
			  558,  878,  120,  433,  878,  431,  120,  878,  437,  263,
			  437,  437,  437,  437,  437,  437,  304,  559,  562,  878, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  120,  311,  432,  311,  311,  311,  311,  311,  311,  263,
			  263,  433,  311,  434,  312,  312,  312,  312,  312,  312,
			  263,  263,  263,  263,  263,  435,  263,  211,  157,  157,
			  263,  878,  878,  563,  450,  211,  443,  878,  211,  157,
			  157,  157,  157,  157,  263,  157,  458,  459,  211,  157,
			  471,  451,  455,  263,  435,  211,  162,  162,  878,  467,
			  476,  563,  453,  157,  444,  263,  878,  162,  162,  162,
			  162,  162,  157,  162,  462,  463,  878,  162,  473,  454,
			  457,  614,  475,  564,  157,  263,  477,  469,  479,  878,
			  878,  162,  878,  878,  565,  878,  371,  372,  878,  371,

			  162,  480,  878,  616,  539,  215,  215,  215,  373,  614,
			  478,  564,  162,  217,  217,  217,  219,  219,  219,  374,
			  376,  376,  565,  376,  878,  878,  215,  215,  215,  878,
			  481,  616,  541,  215,  215,  215,  378,  379,  379,  379,
			  379,  379,  379,  263,  263,  263,  878,  878,  878,  375,
			  482,  482,  482,  482,  482,  482,  387,  387,  387,  387,
			  387,  387,  157,  546,  157,  617,  253,  483,  483,  483,
			  483,  483,  483,  485,  485,  485,  485,  485,  485,  486,
			  486,  486,  486,  486,  486,  263,  263,  878,  878,  254,
			  162,  548,  162,  617,  253,  487,  487,  487,  487,  487,

			  487,  878,  620,  626,  157,  157,  484,  488,  538,  488,
			  627,  391,  489,  489,  489,  489,  489,  489,  490,  490,
			  490,  490,  490,  490,  394,  394,  394,  394,  394,  394,
			  620,  626,  162,  162,  392,  878,  540,  878,  627,  391,
			  491,  491,  491,  491,  491,  491,  493,  494,  878,  495,
			  495,  495,  495,  495,  495,  496,  496,  496,  496,  496,
			  496,  497,  497,  497,  497,  497,  497,  118,  118,  628,
			  118,  118,  118,  878,  118,  878,  580,  878,  580,  492,
			  263,  878,  263,  878,  263,  118,  118,  581,  118,  118,
			  118,  120,  118,  629,  878,  120,  878,  628,  263,  878,

			  878,  157,  263,  118,  118,  263,  118,  878,  878,  120,
			  499,  527,  532,  120,  878,  582,  263,  878,  500,  118,
			  118,  629,  118,  878,  157,  502,  263,  120,  501,  162,
			  157,  551,  263,  118,  118,  503,  118,  878,  499,  633,
			  534,  118,  118,  120,  118,  157,  263,  500,  118,  118,
			  878,  118,  162,  502,  263,  602,  501,  120,  162,  555,
			  878,  263,  635,  503,  878,  120,  602,  633,  118,  118,
			  878,  118,  120,  162,  118,  118,  602,  118,  263,  504,
			  506,  263,  118,  118,  878,  118,  505,  263,  118,  118,
			  635,  118,  120,  878,  602,  263,  507,  157,  120,  263,

			  878,  263,  118,  118,  878,  118,  120,  504,  506,  878,
			  509,  542,  120,  263,  505,  263,  118,  118,  157,  118,
			  118,  118,  549,  118,  507,  162,  120,  511,  510,  263,
			  878,  878,  614,  263,  118,  118,  878,  118,  509,  544,
			  120,  512,  263,  878,  120,  878,  162,  263,  636,  878,
			  553,  513,  816,  816,  816,  511,  510,  285,  120,  285,
			  615,  157,  878,  514,  556,  263,  263,  263,  878,  512,
			  418,  418,  418,  418,  418,  418,  636,  515,  119,  513,
			  287,  119,  621,  517,  157,  157,  157,  119,  639,  162,
			  119,  514,  557,  878,  622,  285,  536,  285,  516,  421,

			  421,  421,  421,  421,  421,  515,  119,  613,  287,  119,
			  621,  517,  162,  162,  162,  119,  639,  878,  878,  640,
			  641,  517,  622,  878,  537,  878,  516,  878,  119,  422,
			  422,  422,  422,  422,  422,  423,  423,  423,  423,  423,
			  423,  424,  424,  424,  424,  424,  424,  640,  641,  517,
			  518,  517,  519,  519,  519,  519,  519,  519,  878,  878,
			  642,  878,  119,  878,  119,  520,  520,  520,  520,  520,
			  520,  878,  683,  878,  119,  878,  878,  878,  518,  517,
			  521,  521,  521,  521,  521,  521,  118,  118,  642,  118,
			  878,  119,  118,  118,  119,  118,  263,  878,  878,  263,

			  683,  118,  118,  119,  118,  263,  878,  878,  878,  119,
			  120,  878,  607,  263,  263,  157,  120,  118,  118,  878,
			  118,  118,  118,  608,  118,  120,  118,  118,  543,  118,
			  263,  878,  157,  609,  263,  118,  118,  878,  118,  263,
			  668,  120,  878,  162,  878,  120,  878,  533,  527,  878,
			  120,  608,  524,  878,  525,  263,  545,  668,  684,  120,
			  162,  668,  263,  523,  437,  526,  437,  437,  437,  437,
			  437,  437,  304,  686,  157,  263,  535,  263,  878,  263,
			  524,  157,  525,  687,  690,  668,  684,  263,  550,  263,
			  691,  523,  558,  526,  157,  263,  157,  563,  157,  878,

			  878,  686,  162,  531,  878,  559,  157,  617,  157,  162,
			  562,  687,  690,  616,  627,  878,  554,  878,  691,  878,
			  560,  263,  162,  878,  162,  567,  162,  482,  482,  482,
			  482,  482,  482,  561,  162,  619,  162,  878,  566,  878,
			  633,  618,  630,  568,  569,  569,  569,  569,  569,  569,
			  570,  570,  570,  570,  570,  570,  571,  571,  571,  571,
			  571,  571,  572,  572,  572,  572,  572,  572,  634,  692,
			  693,  568,  489,  489,  489,  489,  489,  489,  391,  753,
			  753,  753,  753,  484,  573,  573,  573,  573,  573,  573,
			  575,  575,  575,  575,  575,  575,  878,  692,  693,  878,

			  878,  392,  263,  697,  878,  878,  391,  576,  576,  576,
			  576,  576,  576,  577,  577,  577,  577,  577,  577,  878,
			  878,  636,  878,  574,  572,  572,  572,  572,  572,  572,
			  494,  697,  495,  495,  495,  495,  495,  495,  118,  118,
			  579,  118,  118,  118,  263,  118,  492,  118,  118,  638,
			  118,  263,  878,  878,  878,  263,  118,  118,  878,  118,
			  263,  878,  120,  639,  118,  118,  120,  118,  579,  263,
			  878,  120,  118,  118,  878,  118,  878,  263,  878,  586,
			  120,  118,  118,  648,  118,  263,  118,  118,  120,  118,
			  263,  643,  878,  878,  263,  587,  120,  585,  263,  263,

			  699,  118,  118,  588,  118,  120,  254,  586,  620,  157,
			  120,  648,  589,  878,  263,  878,  263,  157,  590,  118,
			  118,  629,  118,  587,  700,  120,  118,  118,  699,  118,
			  591,  588,  263,  703,  263,  621,  623,  162,  592,  263,
			  589,  118,  118,  120,  118,  162,  590,  622,  878,  632,
			  120,  594,  700,  157,  263,  878,  704,  595,  591,  118,
			  118,  703,  118,  624,  635,  120,  592,  118,  118,  878,
			  118,  878,  263,  118,  118,  625,  118,  596,  705,  594,
			  263,  162,  736,  120,  704,  595,  263,  118,  118,  878,
			  118,  120,  637,  878,  263,  263,  263,  120,  263,  597, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  263,  878,  878,  878,  878,  596,  705,  878,  878,  878,
			  736,  120,  628,  157,  640,  157,  598,  157,  878,  599,
			  600,  600,  600,  600,  600,  600,  878,  597,  119,  119,
			  119,  119,  119,  119,  519,  519,  519,  519,  519,  519,
			  631,  162,  644,  162,  598,  162,  425,  599,  425,  119,
			  520,  520,  520,  520,  520,  520,  118,  118,  713,  118,
			  878,  737,  601,  521,  521,  521,  521,  521,  521,  263,
			  118,  118,  427,  118,  118,  118,  878,  118,  428,  119,
			  120,  392,  739,  263,  679,  119,  713,  263,  603,  737,
			  601,  878,  878,  679,  120,  679,  118,  118,  120,  118,

			  427,  878,  604,  743,  681,  680,  428,  745,  878,  263,
			  739,  878,  878,  119,  682,  746,  603,  605,  878,  645,
			  120,  645,  878,  679,  646,  646,  646,  646,  646,  646,
			  604,  743,  681,  878,  878,  745,  606,  646,  646,  646,
			  646,  646,  646,  746,  878,  605,  647,  647,  647,  647,
			  647,  647,  572,  572,  572,  572,  572,  572,  650,  650,
			  650,  650,  650,  650,  606,  878,  878,  747,  649,  651,
			  651,  651,  651,  651,  651,  878,  484,  652,  652,  652,
			  652,  652,  652,  653,  653,  653,  653,  653,  653,  654,
			  654,  654,  654,  654,  654,  747,  649,  574,  655,  655,

			  655,  655,  655,  655,  656,  771,  656,  878,  772,  653,
			  653,  653,  653,  653,  653,  657,  657,  657,  657,  657,
			  657,  878,  492,  660,  660,  660,  660,  660,  660,  118,
			  118,  878,  118,  771,  118,  118,  772,  118,  774,  661,
			  263,  263,  263,  680,  878,  878,  878,  263,  118,  118,
			  878,  118,  767,  120,  682,  684,  767,  663,  120,  157,
			  686,  263,  118,  118,  682,  118,  774,  661,  118,  118,
			  776,  118,  120,  767,  725,  263,  664,  118,  118,  878,
			  118,  263,  682,  685,  767,  663,  120,  162,  688,  878,
			  263,  725,  120,  118,  118,  725,  118,  778,  776,  779,

			  665,  120,  118,  118,  664,  118,  263,  118,  118,  878,
			  118,  118,  118,  794,  118,  263,  666,  120,  878,  725,
			  263,  795,  878,  878,  263,  778,  120,  779,  665,  118,
			  118,  120,  118,  118,  118,  120,  118,  118,  118,  667,
			  118,  794,  263,  670,  666,  878,  263,  878,  797,  795,
			  263,  669,  878,  120,  263,  878,  263,  120,  878,  118,
			  118,  120,  118,  878,  878,  799,  878,  667,  878,  673,
			  878,  670,  263,  157,  671,  692,  797,  672,  878,  669,
			  285,  263,  285,  120,  600,  600,  600,  600,  600,  600,
			  674,  118,  118,  799,  118,  118,  118,  673,  118,  728,

			  157,  162,  671,  695,  263,  672,  263,  687,  263,  118,
			  118,  263,  118,  119,  878,  120,  728,  810,  674,  120,
			  728,  263,  263,  118,  118,  157,  118,  263,  162,  263,
			  157,  263,  263,  120,  878,  689,  263,  691,  676,  677,
			  157,  813,  263,  693,  728,  810,  699,  120,  157,  700,
			  157,  157,  697,  162,  678,  878,  878,  878,  162,  878,
			  878,  157,  703,  878,  878,  694,  676,  677,  162,  813,
			  878,  696,  878,  878,  701,  878,  162,  702,  162,  162,
			  698,  878,  678,  646,  646,  646,  646,  646,  646,  162,
			  706,  646,  646,  646,  646,  646,  646,  707,  707,  707,

			  707,  707,  707,  708,  878,  708,  878,  878,  709,  709,
			  709,  709,  709,  709,  710,  878,  710,  878,  878,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  712,  712,  712,  712,  712,  712,  653,  653,  653,
			  653,  653,  653,  714,  714,  714,  714,  714,  714,  653,
			  653,  653,  653,  653,  653,  716,  716,  716,  716,  716,
			  716,  878,  878,  878,  574,  717,  717,  717,  717,  717,
			  717,  718,  718,  718,  718,  718,  718,  878,  878,  825,
			  878,  118,  118,  719,  118,  719,  826,  713,  720,  720,
			  720,  720,  720,  720,  263,  118,  118,  878,  118,  118,

			  118,  878,  118,  118,  118,  120,  118,  825,  263,  878,
			  392,  836,  263,  878,  826,  713,  263,  118,  118,  120,
			  118,  263,  878,  120,  722,  118,  118,  120,  118,  263,
			  263,  878,  723,  724,  118,  118,  878,  118,  263,  836,
			  157,  120,  118,  118,  845,  118,  878,  263,  157,  120,
			  118,  118,  722,  118,  851,  263,  118,  118,  120,  118,
			  723,  724,  263,  263,  118,  118,  120,  118,  162,  263,
			  118,  118,  845,  118,  120,  878,  162,  263,  878,  263,
			  120,  157,  851,  263,  118,  118,  737,  118,  120,  878,
			  878,  726,  263,  263,  120,  727,  878,  263,  157,  263,

			  118,  118,  729,  118,  755,  756,  755,  756,  120,  162,
			  739,  157,  157,  263,  738,  741,  263,  263,  157,  730,
			  726,  878,  878,  727,  120,  743,  162,  878,  118,  118,
			  729,  118,  731,  878,  878,  157,  745,  878,  740,  162,
			  162,  263,  878,  757,  742,  878,  162,  730,  878,  878,
			  878,  878,  120,  744,  709,  709,  709,  709,  709,  709,
			  731,  878,  878,  162,  748,  749,  749,  749,  749,  749,
			  749,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  750,  750,  750,  750,  750,  750,  751,
			  878,  751,  878,  878,  752,  752,  752,  752,  752,  752,

			  878,  878,  878,  878,  484,  754,  754,  754,  754,  754,
			  754,  652,  652,  652,  652,  652,  652,  720,  720,  720,
			  720,  720,  720,  118,  118,  263,  118,  713,  758,  758,
			  758,  758,  758,  758,  878,  764,  263,  878,  118,  118,
			  263,  118,  878,  878,  774,  118,  118,  120,  118,  878,
			  392,  263,  764,  760,  878,  713,  764,  878,  263,  157,
			  118,  118,  120,  118,  878,  118,  118,  492,  118,  120,
			  878,  878,  775,  263,  761,  878,  878,  762,  263,  878,
			  764,  760,  118,  118,  120,  118,  878,  162,  878,  120,
			  763,  118,  118,  878,  118,  263,  765,  878,  263,  768,

			  263,  822,  761,  768,  263,  762,  120,  767,  768,  822,
			  878,  769,  770,  263,  766,  120,  263,  157,  763,  157,
			  768,  772,  822,  878,  765,  823,  878,  878,  769,  770,
			  776,  768,  157,  823,  778,  157,  878,  822,  878,  769,
			  770,  878,  766,  878,  878,  162,  823,  162,  878,  773,
			  707,  707,  707,  707,  707,  707,  878,  878,  777,  878,
			  162,  823,  780,  162,  752,  752,  752,  752,  752,  752,
			  781,  781,  781,  781,  781,  781,  782,  782,  782,  782,
			  782,  782,  582,  582,  582,  582,  582,  582,  878,  484,
			  783,  783,  783,  783,  783,  783,  784,  784,  784,  784, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  784,  784,  714,  714,  714,  714,  714,  714,  790,  574,
			  118,  118,  790,  118,  118,  118,  878,  118,  118,  118,
			  878,  118,  878,  263,  878,  878,  791,  263,  878,  790,
			  791,  263,  878,  878,  120,  263,  118,  118,  120,  118,
			  790,  492,  120,  118,  118,  786,  118,  791,  790,  263,
			  118,  118,  792,  118,  797,  878,  263,  791,  791,  787,
			  120,  793,  263,  263,  263,  878,  878,  120,  788,  792,
			  878,  878,  878,  786,  120,  878,  878,  878,  793,  878,
			  792,  157,  798,  157,  878,  878,  878,  787,  878,  793,
			  878,  878,  878,  878,  795,  789,  788,  750,  750,  750,

			  750,  750,  750,  801,  801,  801,  801,  801,  801,  162,
			  755,  162,  755,  263,  263,  784,  784,  784,  784,  784,
			  784,  263,  796,  789,  118,  118,  832,  118,  118,  118,
			  878,  118,  157,  157,  832,  263,  574,  263,  878,  878,
			  157,  263,  118,  118,  813,  118,  849,  832,  120,  757,
			  118,  118,  120,  118,  157,  263,  803,  849,  878,  878,
			  162,  162,  832,  263,  878,  878,  120,  849,  162,  878,
			  878,  811,  814,  878,  120,  878,  878,  804,  878,  878,
			  118,  118,  162,  118,  803,  849,  805,  817,  817,  817,
			  817,  817,  817,  263,  118,  118,  878,  118,  878,  806,

			  812,  878,  118,  118,  120,  118,  804,  263,  118,  118,
			  759,  118,  878,  878,  805,  263,  118,  118,  120,  118,
			  878,  263,  878,  823,  878,  820,  120,  878,  806,  263,
			  864,  824,  120,  827,  827,  827,  827,  827,  827,  837,
			  120,  837,  118,  118,  824,  118,  833,  864,  831,  821,
			  838,  864,  878,  820,  833,  263,  878,  878,  759,  824,
			  757,  757,  757,  757,  757,  757,  120,  833,  878,  850,
			  857,  833,  857,  878,  878,  864,  831,  821,  839,  834,
			  850,  858,  833,  841,  841,  841,  841,  841,  878,  878,
			  850,  830,  834,  118,  118,  878,  118,  118,  118,  878,

			  118,  847,  847,  847,  847,  847,  263,  834,  850,  859,
			  263,  846,  846,  846,  846,  846,  846,  120,  878,  878,
			  830,  120,  841,  841,  841,  841,  841,  841,  118,  118,
			  878,  118,  878,  878,  842,  852,  852,  852,  852,  852,
			  852,  263,  853,  853,  853,  853,  853,  853,  118,  118,
			  878,  118,  120,  854,  855,  863,  863,  863,  863,  863,
			  848,  263,  842,  878,  854,  855,  856,  856,  856,  856,
			  856,  856,  120,  865,  854,  855,  839,  839,  839,  839,
			  839,  839,  862,  862,  862,  862,  862,  862,  848,  878,
			  865,  868,  854,  855,  865,  866,  866,  866,  866,  866,

			  866,  867,  867,  867,  867,  867,  867,  869,  868,  878,
			  878,  878,  868,  878,  871,  872,  871,  872,  865,  878,
			  878,  878,  878,  878,  869,  878,  878,  878,  869,  870,
			  870,  870,  870,  870,  870,  878,  868,  859,  859,  859,
			  859,  859,  859,  874,  874,  874,  874,  874,  874,  878,
			  878,  878,  869,  873,  875,  875,  875,  875,  875,  875,
			  876,  876,  876,  876,  876,  876,  871,  878,  871,  878,
			  878,  875,  875,  875,  875,  875,  875,  877,  877,  877,
			  877,  877,  877,  873,  873,  873,  873,  873,  873,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,

			  878,  878,  878,  878,  878,  873,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   84,   84,
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
			   88,   88,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,

			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,  100,  100,  878,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  878,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  102,  102,  878,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  119,  119,  119,  878,  878,  878,  878,  878,  878,
			  878,  119,  119,  119,  119,  878,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  878,
			  878,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  151,  151,  878,  151,  151,  878,  151,  151,  151,  878,

			  878,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  878,  878,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  153,  153,  878,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  210,  210,  878,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  878,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  878,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  227,  878,  227,  878,  878,  878,  878,
			  227,  227,  878,  227,  227,  227,  878,  878,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  878,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  234,  234,  234,  234,  234,  234,  234,  234,

			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  241,  241,  878,  241,

			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  105,  878,
			  878,  878,  878,  105,  105,  105,  878,  878,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  878,  878,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  106,  106,  106,  106,  106,  106,  106,  106,

			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  878,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  264,  878,  878,  878,

			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  878,  878,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  240,
			  240,  240,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  240,  398,
			  398,  398,  398,  398,  398,  398,  398,  398,  398,  398,

			  398,  398,  398,  398,  398,  398,  398,  398,  398,  398,
			  398,  398,  878,  878,  398,  398,  398,  398,  398,  398,
			  398,  398,  398,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  498,  498,  498,  878,  878,
			  498,  498,  498,  498,  498,  498,  498,  498,  498,  498,
			  498,  498,  498,  498,  498,  498,  498,  498,  498,  498,

			  498,  498,  498,  878,  878,  498,  498,  498,  498,  498,
			  498,  498,  498,  498,  530,  878,  530,  878,  878,  878,
			  878,  530,  530,  878,  530,  530,  530,  878,  878,  530,
			  530,  530,  530,  530,  530,  530,  530,  530,  530,  530,
			  530,  530,  530,  530,  530,  530,  530,  530,  530,  530,
			  530,  530,  878,  878,  530,  530,  530,  530,  530,  530,
			  530,  530,  530,  438,  438,  438,  878,  878,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  878,  878,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,

			  438,  438,  878,  878,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  610,  878,  610,  878,  878,  878,  878,
			  610,  610,  878,  610,  610,  610,  878,  878,  610,  610,
			  610,  610,  610,  610,  610,  610,  610,  610,  610,  610,
			  610,  610,  610,  610,  610,  610,  610,  610,  610,  610,
			  610,  878,  610,  610,  610,  610,  610,  610,  610,  610,
			  610,  610,  659,  659,  659,  659,  659,  659,  659,  659,
			  659,  878,  659,  659,  659,  659,  659,  659,  659,  659,
			  659,  659,  659,  659,  659,  659,  659,  659,  659,  659,
			  659,  659,  659,  659,  659,  659,  659,  659,  659,  659,

			  659,  659,  659,  659,  659,  659,  659,  659,  659,  659,
			  659,  659,  659,  659,  662,  662,  662,  662,  662,  662,
			  662,  662,  662,  662,  662,  662,  662,  662,  662,  662,
			  662,  662,  662,  662,  662,  662,  662,  878,  878,  662,
			  662,  662,  662,  662,  662,  662,  662,  662,  721,  721,
			  721,  878,  878,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  878,  878,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  785,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  878,  878,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  802,  802,  802,  878,  878,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  802,  802,  878,
			  878,  802,  802,  802,  802,  802,  802,  802,  802,  802,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  878,  878,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  840,  840,  840,  878,  878,  840,

			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  878,  878,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,   13,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,

			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878, yy_Dummy>>,
			1, 226, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 6225)
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
			   27,   27,   27,   29,   94,   29,  152,   29,   29,   29,
			   29,   29,   29,   40,   40,   59,   40,   60,   78,   59,
			  159,    5,    6,   30,   59,   30,  160,   30,   30,   30,
			   30,   30,   30,   63,    3,   20,   63,   40,  207,    4,
			  855,   11,  152,   59,   12,   60,   29,   59,  159,  610,
			    5,    6,   59,   76,  160,   76,   76,  152,  854,   94,
			   97,   63,   97,   97,   63,   78,   30,  207,    3,    3,
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
			   37,   37,  161,   37,   38,   38,  212,   38,  212,  212,
			   39,   39,   80,   39,   65,  833,  231,   66,   65,  231,

			   41,   41,  832,   41,   37,   66,   45,   45,   38,   45,
			  161,  819,   84,   37,   39,   71,   38,   37,   39,   37,
			   89,  793,   65,   89,   41,   66,   65,   39,   42,   42,
			   45,   42,   71,   66,   45,   43,   43,   41,   43,   46,
			   46,   37,   46,   71,   38,   37,   39,   37,   41,   84,
			   44,   44,   42,   44,  167,   39,   42,   47,   47,   43,
			   47,   71,   45,   46,  169,   41,   50,   50,   42,   50,
			   43,  170,   80,   89,   44,   61,   79,   41,   84,   46,
			   61,   47,  167,  233,   42,  173,  233,   47,   44,   44,
			   50,   61,  169,   67,   44,   67,   42,  782,   43,  170,

			   47,   49,   49,   61,   49,   50,   67,   46,   61,  177,
			   50,   51,   51,  173,   51,   47,   44,   44,  750,   82,
			   61,   67,   44,   67,  250,   49,  250,  250,   47,   48,
			   48,  178,   48,   50,   67,   51,   49,  177,   50,  360,
			   86,  493,  493,  721,   49,   48,   48,   48,   48,   48,
			   48,   51,   81,   48,   79,   79,   79,   62,   83,  178,
			   48,   62,   52,   52,   49,   52,  714,   48,  360,   62,
			  118,  118,   49,  118,   48,   64,   48,   86,   48,   51,
			  183,   64,   64,  707,   69,   62,   52,   64,   48,   62,
			   68,   69,   70,   68,  118,   48,   69,   62,   82,   82,

			   70,   68,  497,   64,  440,   48,   86,   48,  183,   64,
			   64,   52,   69,  225,  436,   64,  682,  436,   68,   69,
			   70,   68,  119,  119,   69,  119,  790,  681,   70,   68,
			   81,   81,   81,  440,  680,  119,   83,   83,   83,  189,
			   52,   57,   91,  497,   57,   91,  119,  162,  155,   57,
			  225,  155,  216,  679,   91,   91,  155,   57,   57,   57,
			   57,   57,   57,   57,  191,   91,  162,  189,  790,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,  191,  655,  162,   91,   57,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   58,   92,  528,   58,   92,  528,  182,  602,   58,  533,
			  216,  216,  216,   92,  508,  182,   58,   58,   58,   58,
			   58,   58,   58,  193,   92,  182,  234,  498,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  193,  486,  182,   92,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   95,

			   95,  234,   95,  802,  802,  104,  110,  110,  110,  110,
			  110,  110,  834,  363,  104,  104,  104,  104,  104,  104,
			  834,  226,  840,  840,  226,   95,  480,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  104,  108,  108,  108,  108,  108,  108,  111,  111,  111,
			  111,  111,  111,  184,  174,  104,  184,  108,  194,  104,
			  174,  104,  197,  111,  226,  131,  131,  112,  131,  112,
			   95,  112,  112,  112,  112,  112,  112,  112,  131,  399,
			  108,  184,  174,  363,  184,  108,  194,  131,  174,  131,

			  197,  111,  113,  113,  113,  113,  113,  113,  114,  198,
			  114,  375,  114,  114,  114,  114,  114,  114,  121,  121,
			  112,  121,  122,  122,  202,  122,  123,  123,  370,  123,
			  199,  121,  205,  354,  201,  122,  329,  198,  201,  123,
			  124,  124,  121,  124,  373,  373,  122,  373,  307,  199,
			  123,  114,  202,  124,  304,  125,  125,  123,  125,  122,
			  205,  204,  201,  121,  124,  166,  201,  200,  125,  126,
			  126,  264,  126,  124,  248,  127,  127,  199,  127,  125,
			  204,  247,  126,  166,  166,  123,  200,  122,  127,  130,
			  130,  121,  130,  126,  128,  128,  693,  128,  125,  127,

			  200,  124,  130,  129,  129,  246,  129,  128,  204,  126,
			  165,  166,  166,  130,  200,  245,  129,  795,  128,  127,
			  132,  132,  164,  132,  128,  693,  125,  129,  200,  165,
			  128,  243,  130,  132,  165,  134,  134,  126,  134,  238,
			  129,  164,  133,  133,  132,  133,  795,  127,  134,  229,
			  135,  135,  128,  135,  164,  133,  220,  165,  128,  134,
			  130,  132,  165,  135,  136,  136,  133,  136,  129,  164,
			  138,  138,  133,  138,  135,  133,  223,  136,  137,  137,
			  210,  137,  164,  138,  239,  239,  185,  239,  136,  132,
			  134,  137,  308,  220,  138,  135,  171,  309,  799,  168, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  133,  138,  137,  133,  140,  140,  181,  140,  137,  136,
			  239,  141,  141,  316,  141,  171,  825,  140,  168,  168,
			  308,  158,  220,  135,  141,  309,  171,  799,  140,  138,
			  156,  143,  143,  172,  143,  141,  137,  136,  139,  139,
			  139,  316,  141,  171,  143,  825,  168,  168,  175,  140,
			  148,  148,  172,  148,  171,  143,  141,  139,  141,  153,
			  172,  139,  143,  148,  139,  318,  319,  175,  151,  215,
			  141,  139,  313,  139,  148,  139,  143,  107,  217,  175,
			  172,  180,  148,  374,  374,  139,  374,  141,  172,  139,
			  143,  313,  139,  318,  319,  175,  222,  106,  105,  322,

			  180,  102,  139,  100,  139,  142,  142,  175,  142,  144,
			  148,  180,  144,  144,  144,  144,  144,  144,  142,  313,
			   98,  142,  142,  142,  142,  142,  142,  322,  180,  142,
			   90,  145,  145,  222,  145,  146,  146,   87,  146,  180,
			  142,  144,   75,  142,  145,  144,  179,   72,  146,  142,
			  215,  215,  215,  215,  215,  145,  217,  217,  217,  146,
			  323,   56,  222,  145,   53,  179,  145,   36,  142,   35,
			  179,  142,  147,  147,  144,  147,  324,  142,  176,  149,
			  149,  146,  149,  186,   33,  147,  150,  150,  323,  150,
			   28,  145,  149,  179,  145,  176,  147,  176,  179,  150,

			  328,  176,  186,  149,  324,  333,   26,  187,  147,  146,
			  150,  186,  147,  163,  163,  188,  163,  163,  163,  163,
			  163,  163,  149,  176,  187,  176,  187,  187,  328,  176,
			  186,   18,  163,  333,  188,  150,  147,   17,   16,  186,
			  147,   13,  195,  334,  190,  335,    0,  192,    0,  196,
			  149,    0,  187,  336,  187,  187,  218,  188,  315,  195,
			  163,  195,  188,  190,  150,  157,  192,  196,  196,  219,
			    0,  334,    0,  335,  157,    0,  190,  315,    0,  192,
			    0,  336,  249,  249,  157,  249,    0,  195,    0,  195,
			    0,  190,    0,    0,  192,  196,  196,  244,  244,  244,

			  244,  244,  244,  244,  190,  315,  249,  192,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  203,  206,  208,  218,  218,  218,    0,  320,    0,
			  325,  227,  343,  230,  227,    0,  230,  219,  219,  219,
			  203,  206,  208,  227,  203,  230,  320,  320,  203,  325,
			  340,  343,  206,  344,  227,  253,  230,  253,    0,  208,
			  253,  253,  253,  253,  253,  253,    0,    0,  203,  206,
			  208,    0,  203,    0,  320,  320,  203,  325,  340,  343,
			  206,  344,    0,    0,  227,    0,  230,    0,  208,  232,

			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  235,  235,    0,  235,  254,  254,  254,  254,  254,

			  254,  255,  255,  255,  255,  255,  255,  260,  260,  260,
			  260,  260,  581,  581,  581,  581,  581,  235,    0,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  252,  252,  252,  252,  252,  252,  257,  257,
			  257,  257,  257,  257,  345,  348,  349,  352,  252,    0,
			  258,    0,  258,    0,  257,  258,  258,  258,  258,  258,
			  258,  259,  235,  259,    0,  259,  259,  259,  259,  259,
			  259,  252,  345,  348,  349,  352,  252,  257,  265,  265,
			    0,  265,  257,  261,  261,  261,  261,  261,  261,  347,

			    0,  265,  266,  266,    0,  266,  267,  267,    0,  267,
			  268,  268,  265,  268,  259,  266,    0,    0,  347,  267,
			  265,    0,    0,  268,  339,  353,  266,    0,  269,  269,
			  267,  269,  270,  270,  268,  270,  271,  271,    0,  271,
			    0,  269,  266,  339,  276,  270,  347,  339,  265,  271,
			  268,    0,  269,  353,    0,  276,  270,    0,  439,  269,
			  271,  272,  272,    0,  272,  276,  273,  273,  271,  273,
			  266,  339,    0,  351,  272,  339,  270,    0,  268,  273,
			  314,  274,  274,  276,  274,  272,  439,  269,  275,  275,
			  273,  275,  351,    0,  274,  365,  271,    0,  272,  314,

			  321,  275,  443,  359,  270,  274,    0,  314,  277,  277,
			  273,  277,  275,    0,  529,  278,  278,  529,  278,  321,
			  351,  277,  359,    0,    0,  274,  272,  314,  278,    0,
			  443,  321,  277,  279,  279,  314,  279,    0,  273,  278,
			    0,  280,  280,  275,  280,  277,  279,  321,  281,  281,
			  359,  281,  278,  274,  280,  282,  282,  279,  282,  321,
			  410,  281,    0,  283,  283,  280,  283,  529,  282,  279,
			  445,  410,  281,  277,  365,  365,  283,  280,  281,  282,
			  278,  410,  446,  284,  284,    0,  284,  283,  285,  285,
			  285,  285,  285,  285,  450,  341,  284,  279,  445,  410,

			  286,  286,    0,  286,    0,  280,  281,  284,    0,  283,
			  446,  451,  341,  286,  341,  284,  286,  286,  286,  286,
			  286,  286,  450,    0,  286,  287,  287,  287,  287,  287,
			  287,  288,  288,  288,  288,  288,  288,  283,    0,  451,
			  341,  530,  341,  284,  530,  286,  289,  289,  289,  289,
			  289,  289,  455,    0,  287,  290,  290,  290,  290,  290,
			  290,  291,  291,  291,  291,  291,  291,  292,  456,  292,
			  293,  293,  293,  293,  293,  293,  430,  458,  294,  294,
			  455,  294,  295,  295,  459,  295,  332,  430,  460,  293,
			  292,  294,    0,  292,  530,  295,  456,  430,  332,  292,

			  296,  296,  294,  296,  331,  458,  295,  297,  297,  332,
			  297,    0,  459,  296,  461,  430,  460,  293,  292,  332,
			  297,  292,  294,  331,  296,  298,  298,  292,  298,  297,
			    0,  297,  299,  299,    0,  299,  792,  332,  298,  296,
			  300,  300,  461,  300,  465,  299,  331,  792,    0,  298,
			  294,  331,  467,  300,    0,    0,  299,  298,  301,  301,
			    0,  301,  302,  302,  300,  302,    0,  296,    0,  468,
			  475,  301,  465,    0,  299,  302,  303,  303,  792,  303,
			  467,    0,  301,  300,    0,  298,  302,    0,  305,  303,
			  305,  305,  305,  305,  305,  305,  305,  468,  475,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  303,  311,  299,  311,  311,  311,  311,  311,  311,  317,
			  326,  300,  312,  301,  312,  312,  312,  312,  312,  312,
			  327,  330,  337,  338,  350,  303,  346,  362,  317,  326,
			  356,    0,    0,  476,  326,  364,  317,    0,  366,  327,
			  330,  337,  338,  350,  357,  346,  337,  338,  367,  356,
			  350,  327,  330,  355,  303,  368,  317,  326,    0,  346,
			  356,  476,  326,  357,  317,  361,    0,  327,  330,  337,
			  338,  350,  355,  346,  337,  338,    0,  356,  350,  327,
			  330,  536,  355,  477,  361,  448,  357,  346,  356,    0,
			    0,  357,    0,    0,  477,    0,  371,  371,    0,  371,

			  355,  361,    0,  538,  448,  362,  362,  362,  371,  536,
			  355,  477,  361,  364,  364,  364,  366,  366,  366,  371,
			  376,  376,  477,  376,    0,    0,  367,  367,  367,    0,
			  361,  538,  448,  368,  368,  368,  379,  379,  379,  379,
			  379,  379,  379,  452,  457,  473,  376,    0,    0,  371,
			  385,  385,  385,  385,  385,  385,  386,  386,  386,  386,
			  386,  386,  452,  457,  473,  539,  385,  387,  387,  387,
			  387,  387,  387,  388,  388,  388,  388,  388,  388,  389,
			  389,  389,  389,  389,  389,  447,  474,    0,    0,  385,
			  452,  457,  473,  539,  385,  390,  390,  390,  390,  390,

			  390,    0,  542,  547,  447,  474,  387,  391,  447,  391,
			  549,  390,  391,  391,  391,  391,  391,  391,  392,  392,
			  392,  392,  392,  392,  393,  393,  393,  393,  393,  393,
			  542,  547,  447,  474,  390,    0,  447,    0,  549,  390,
			  394,  394,  394,  394,  394,  394,  395,  395,    0,  395,
			  395,  395,  395,  395,  395,  396,  396,  396,  396,  396,
			  396,  397,  397,  397,  397,  397,  397,  400,  400,  550,
			  400,  401,  401,    0,  401,    0,  496,    0,  496,  394,
			  400,    0,  441,    0,  401,  402,  402,  496,  402,  403,
			  403,  400,  403,  551,    0,  401,    0,  550,  402,    0,

			    0,  441,  403,  404,  404,  464,  404,    0,    0,  402,
			  400,  481,  441,  403,    0,  496,  404,    0,  401,  405,
			  405,  551,  405,    0,  464,  403,  534,  404,  402,  441,
			  481,  464,  405,  406,  406,  404,  406,    0,  400,  556,
			  441,  407,  407,  405,  407,  534,  406,  401,  408,  408,
			    0,  408,  464,  403,  407,  522,  402,  406,  481,  464,
			    0,  408,  558,  404,    0,  407,  522,  556,  409,  409,
			    0,  409,  408,  534,  411,  411,  522,  411,  453,  406,
			  408,  409,  412,  412,    0,  412,  407,  411,  413,  413,
			  558,  413,  409,    0,  522,  412,  409,  453,  411,  462,

			    0,  413,  414,  414,    0,  414,  412,  406,  408,    0,
			  411,  453,  413,  537,  407,  414,  415,  415,  462,  415,
			  416,  416,  462,  416,  409,  453,  414,  413,  412,  415,
			    0,    0,  537,  416,  417,  417,    0,  417,  411,  453,
			  415,  414,  466,    0,  416,    0,  462,  417,  559,    0,
			  462,  415,  800,  800,  800,  413,  412,  419,  417,  419,
			  537,  466,    0,  416,  466,  535,  444,  548,    0,  414,
			  418,  418,  418,  418,  418,  418,  559,  417,  420,  415,
			  419,  420,  543,  419,  535,  444,  548,  420,  562,  466,
			  419,  416,  466,    0,  543,  421,  444,  421,  418,  421,

			  421,  421,  421,  421,  421,  417,  420,  535,  419,  420,
			  543,  419,  535,  444,  548,  420,  562,    0,    0,  563,
			  564,  421,  543,    0,  444,    0,  418,    0,  421,  422,
			  422,  422,  422,  422,  422,  423,  423,  423,  423,  423,
			  423,  424,  424,  424,  424,  424,  424,  563,  564,  421,
			  423,  422,  425,  425,  425,  425,  425,  425,    0,    0,
			  565,    0,  422,    0,  423,  426,  426,  426,  426,  426,
			  426,    0,  613,    0,  424,    0,    0,    0,  423,  422,
			  427,  427,  427,  427,  427,  427,  428,  428,  565,  428,
			    0,  422,  429,  429,  426,  429,  454,    0,    0,  428,

			  613,  431,  431,  424,  431,  429,    0,    0,    0,  427,
			  428,    0,  527,  442,  431,  454,  429,  432,  432,    0,
			  432,  433,  433,  527,  433,  431,  434,  434,  454,  434,
			  432,    0,  442,  527,  433,  435,  435,    0,  435,  434,
			  593,  432,    0,  454,    0,  433,    0,  442,  435,    0,
			  434,  527,  433,    0,  434,  463,  454,  593,  616,  435,
			  442,  593,  469,  432,  437,  434,  437,  437,  437,  437,
			  437,  437,  437,  620,  463,  470,  442,  478,    0,  479,
			  433,  469,  434,  621,  626,  593,  616,  540,  463,  541,
			  627,  432,  469,  434,  470,  553,  478,  479,  479,    0,

			    0,  620,  463,  437,    0,  470,  540,  541,  541,  469,
			  478,  621,  626,  540,  553,    0,  463,    0,  627,    0,
			  469,  557,  470,    0,  478,  479,  479,  482,  482,  482,
			  482,  482,  482,  470,  540,  541,  541,    0,  478,    0,
			  557,  540,  553,  482,  483,  483,  483,  483,  483,  483,
			  484,  484,  484,  484,  484,  484,  485,  485,  485,  485,
			  485,  485,  487,  487,  487,  487,  487,  487,  557,  628,
			  629,  482,  488,  488,  488,  488,  488,  488,  487,  715,
			  715,  715,  715,  483,  489,  489,  489,  489,  489,  489,
			  490,  490,  490,  490,  490,  490,    0,  628,  629,    0,

			    0,  487,  561,  633,    0,    0,  487,  491,  491,  491,
			  491,  491,  491,  492,  492,  492,  492,  492,  492,    0,
			    0,  561,    0,  489,  494,  494,  494,  494,  494,  494,
			  495,  633,  495,  495,  495,  495,  495,  495,  499,  499,
			  494,  499,  500,  500,  566,  500,  491,  501,  501,  561,
			  501,  499,    0,    0,    0,  500,  502,  502,    0,  502,
			  501,    0,  499,  566,  506,  506,  500,  506,  494,  502,
			    0,  501,  503,  503,    0,  503,    0,  506,    0,  501,
			  502,  504,  504,  571,  504,  503,  505,  505,  506,  505,
			  544,  566,    0,    0,  504,  502,  503,  500,  555,  505,

			  635,  507,  507,  503,  507,  504,  571,  501,  544,  544,
			  505,  571,  504,    0,  507,    0,  545,  555,  505,  509,
			  509,  555,  509,  502,  636,  507,  510,  510,  635,  510,
			  505,  503,  509,  640,  560,  545,  544,  544,  507,  510,
			  504,  511,  511,  509,  511,  555,  505,  545,    0,  555,
			  510,  509,  636,  560,  511,    0,  641,  510,  505,  512,
			  512,  640,  512,  545,  560,  511,  507,  513,  513,    0,
			  513,    0,  512,  514,  514,  545,  514,  511,  642,  509,
			  513,  560,  683,  512,  641,  510,  514,  515,  515,    0,
			  515,  513,  560,    0,  554,  567,  615,  514,  619,  513, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  515,    0,    0,    0,    0,  511,  642,    0,    0,    0,
			  683,  515,  554,  554,  567,  615,  514,  619,    0,  515,
			  517,  517,  517,  517,  517,  517,    0,  513,  518,  518,
			  518,  518,  518,  518,  519,  519,  519,  519,  519,  519,
			  554,  554,  567,  615,  514,  619,  520,  515,  520,  517,
			  520,  520,  520,  520,  520,  520,  523,  523,  652,  523,
			    0,  684,  519,  521,  521,  521,  521,  521,  521,  523,
			  524,  524,  520,  524,  525,  525,    0,  525,  520,  520,
			  523,  652,  687,  524,  607,  521,  652,  525,  523,  684,
			  519,    0,    0,  608,  524,  607,  526,  526,  525,  526,

			  520,    0,  524,  699,  608,  607,  520,  703,    0,  526,
			  687,    0,    0,  521,  608,  704,  523,  525,    0,  568,
			  526,  568,    0,  607,  568,  568,  568,  568,  568,  568,
			  524,  699,  608,    0,    0,  703,  526,  569,  569,  569,
			  569,  569,  569,  704,    0,  525,  570,  570,  570,  570,
			  570,  570,  572,  572,  572,  572,  572,  572,  573,  573,
			  573,  573,  573,  573,  526,    0,    0,  705,  572,  574,
			  574,  574,  574,  574,  574,    0,  569,  575,  575,  575,
			  575,  575,  575,  576,  576,  576,  576,  576,  576,  577,
			  577,  577,  577,  577,  577,  705,  572,  573,  578,  578,

			  578,  578,  578,  578,  579,  736,  579,    0,  737,  579,
			  579,  579,  579,  579,  579,  580,  580,  580,  580,  580,
			  580,    0,  576,  583,  583,  583,  583,  583,  583,  585,
			  585,    0,  585,  736,  586,  586,  737,  586,  739,  583,
			  618,  623,  585,  609,    0,    0,    0,  586,  587,  587,
			    0,  587,  732,  585,  609,  618,  732,  585,  586,  618,
			  623,  587,  588,  588,  609,  588,  739,  583,  589,  589,
			  743,  589,  587,  732,  668,  588,  587,  590,  590,    0,
			  590,  589,  609,  618,  732,  585,  588,  618,  623,    0,
			  590,  668,  589,  591,  591,  668,  591,  745,  743,  746,

			  589,  590,  592,  592,  587,  592,  591,  594,  594,    0,
			  594,  595,  595,  771,  595,  592,  590,  591,    0,  668,
			  594,  772,    0,    0,  595,  745,  592,  746,  589,  596,
			  596,  594,  596,  597,  597,  595,  597,  598,  598,  592,
			  598,  771,  596,  595,  590,    0,  597,    0,  776,  772,
			  598,  594,    0,  596,  625,    0,  631,  597,    0,  599,
			  599,  598,  599,    0,    0,  779,    0,  592,    0,  598,
			    0,  595,  599,  625,  596,  631,  776,  597,    0,  594,
			  600,  624,  600,  599,  600,  600,  600,  600,  600,  600,
			  599,  603,  603,  779,  603,  604,  604,  598,  604,  675,

			  624,  625,  596,  631,  603,  597,  630,  624,  604,  605,
			  605,  632,  605,  600,    0,  603,  675,  794,  599,  604,
			  675,  634,  605,  606,  606,  630,  606,  637,  624,  643,
			  632,  638,  644,  605,    0,  624,  606,  630,  604,  605,
			  634,  797,  688,  632,  675,  794,  637,  606,  643,  638,
			  638,  644,  634,  630,  606,    0,    0,    0,  632,    0,
			    0,  688,  644,    0,    0,  630,  604,  605,  634,  797,
			    0,  632,    0,    0,  637,    0,  643,  638,  638,  644,
			  634,    0,  606,  645,  645,  645,  645,  645,  645,  688,
			  644,  646,  646,  646,  646,  646,  646,  647,  647,  647,

			  647,  647,  647,  648,    0,  648,    0,    0,  648,  648,
			  648,  648,  648,  648,  649,    0,  649,    0,    0,  649,
			  649,  649,  649,  649,  649,  650,  650,  650,  650,  650,
			  650,  651,  651,  651,  651,  651,  651,  653,  653,  653,
			  653,  653,  653,  654,  654,  654,  654,  654,  654,  656,
			  656,  656,  656,  656,  656,  657,  657,  657,  657,  657,
			  657,    0,    0,    0,  650,  658,  658,  658,  658,  658,
			  658,  660,  660,  660,  660,  660,  660,    0,    0,  810,
			    0,  663,  663,  661,  663,  661,  815,  660,  661,  661,
			  661,  661,  661,  661,  663,  664,  664,    0,  664,  665,

			  665,    0,  665,  666,  666,  663,  666,  810,  664,    0,
			  660,  826,  665,    0,  815,  660,  666,  667,  667,  664,
			  667,  694,    0,  665,  663,  669,  669,  666,  669,  695,
			  667,    0,  664,  666,  670,  670,    0,  670,  669,  826,
			  694,  667,  671,  671,  835,  671,    0,  670,  695,  669,
			  672,  672,  663,  672,  845,  671,  673,  673,  670,  673,
			  664,  666,  685,  672,  674,  674,  671,  674,  694,  673,
			  676,  676,  835,  676,  672,    0,  695,  674,    0,  696,
			  673,  685,  845,  676,  677,  677,  685,  677,  674,    0,
			    0,  671,  698,  689,  676,  673,    0,  677,  696,  701,

			  678,  678,  676,  678,  717,  717,  717,  717,  677,  685,
			  689,  698,  689,  678,  685,  696,  702,  706,  701,  677,
			  671,    0,    0,  673,  678,  701,  696,    0,  726,  726,
			  676,  726,  678,    0,    0,  702,  706,    0,  689,  698,
			  689,  726,    0,  717,  696,    0,  701,  677,    0,    0,
			    0,    0,  726,  701,  708,  708,  708,  708,  708,  708,
			  678,    0,    0,  702,  706,  709,  709,  709,  709,  709,
			  709,  710,  710,  710,  710,  710,  710,  711,  711,  711,
			  711,  711,  711,  712,  712,  712,  712,  712,  712,  713,
			    0,  713,    0,    0,  713,  713,  713,  713,  713,  713,

			    0,    0,    0,    0,  709,  716,  716,  716,  716,  716,
			  716,  718,  718,  718,  718,  718,  718,  719,  719,  719,
			  719,  719,  719,  722,  722,  740,  722,  718,  720,  720,
			  720,  720,  720,  720,    0,  728,  722,    0,  723,  723,
			  742,  723,    0,    0,  740,  724,  724,  722,  724,    0,
			  718,  723,  728,  722,    0,  718,  728,    0,  724,  742,
			  727,  727,  723,  727,    0,  729,  729,  720,  729,  724,
			    0,    0,  740,  727,  723,    0,    0,  724,  729,    0,
			  728,  722,  730,  730,  727,  730,    0,  742,    0,  729,
			  727,  731,  731,    0,  731,  730,  729,    0,  738,  733,

			  775,  807,  723,  733,  731,  724,  730,  734,  735,  807,
			    0,  734,  735,  744,  730,  731,  748,  738,  727,  775,
			  733,  738,  807,    0,  729,  808,    0,    0,  734,  735,
			  744,  733,  744,  808,  748,  748,    0,  807,    0,  734,
			  735,    0,  730,    0,    0,  738,  808,  775,    0,  738,
			  749,  749,  749,  749,  749,  749,    0,    0,  744,    0,
			  744,  808,  748,  748,  751,  751,  751,  751,  751,  751,
			  752,  752,  752,  752,  752,  752,  753,  753,  753,  753,
			  753,  753,  754,  754,  754,  754,  754,  754,    0,  749,
			  755,  755,  755,  755,  755,  755,  756,  756,  756,  756, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  756,  756,  758,  758,  758,  758,  758,  758,  767,  752,
			  760,  760,  767,  760,  761,  761,    0,  761,  762,  762,
			    0,  762,    0,  760,    0,    0,  768,  761,    0,  767,
			  768,  762,    0,    0,  760,  777,  763,  763,  761,  763,
			  767,  758,  762,  765,  765,  760,  765,  768,  769,  763,
			  766,  766,  769,  766,  777,    0,  765,  770,  768,  761,
			  763,  770,  773,  766,  780,    0,    0,  765,  763,  769,
			    0,    0,    0,  760,  766,    0,    0,    0,  770,    0,
			  769,  773,  777,  780,    0,    0,    0,  761,    0,  770,
			    0,    0,    0,    0,  773,  766,  763,  781,  781,  781,

			  781,  781,  781,  783,  783,  783,  783,  783,  783,  773,
			  784,  780,  784,  798,  812,  784,  784,  784,  784,  784,
			  784,  814,  773,  766,  786,  786,  822,  786,  787,  787,
			    0,  787,  798,  812,  822,  796,  781,  786,    0,    0,
			  814,  787,  788,  788,  798,  788,  843,  822,  786,  784,
			  789,  789,  787,  789,  796,  788,  786,  843,    0,    0,
			  798,  812,  822,  789,    0,    0,  788,  843,  814,    0,
			    0,  796,  798,    0,  789,    0,    0,  787,    0,    0,
			  803,  803,  796,  803,  786,  843,  788,  801,  801,  801,
			  801,  801,  801,  803,  804,  804,    0,  804,    0,  789,

			  796,    0,  805,  805,  803,  805,  787,  804,  806,  806,
			  809,  806,    0,    0,  788,  805,  821,  821,  804,  821,
			    0,  806,    0,  809,    0,  803,  805,    0,  789,  821,
			  860,  809,  806,  816,  816,  816,  816,  816,  816,  827,
			  821,  827,  820,  820,  809,  820,  823,  860,  821,  806,
			  827,  860,    0,  803,  823,  820,    0,    0,  824,  809,
			  817,  817,  817,  817,  817,  817,  820,  823,    0,  844,
			  853,  824,  853,    0,    0,  860,  821,  806,  827,  824,
			  844,  853,  823,  829,  829,  829,  829,  829,    0,    0,
			  844,  820,  824,  830,  830,    0,  830,  831,  831,    0,

			  831,  838,  838,  838,  838,  838,  830,  824,  844,  853,
			  831,  837,  837,  837,  837,  837,  837,  830,    0,    0,
			  820,  831,  841,  841,  841,  841,  841,  841,  842,  842,
			    0,  842,    0,    0,  830,  846,  846,  846,  846,  846,
			  846,  842,  847,  847,  847,  847,  847,  847,  848,  848,
			    0,  848,  842,  849,  850,  858,  858,  858,  858,  858,
			  842,  848,  830,    0,  849,  850,  852,  852,  852,  852,
			  852,  852,  848,  861,  849,  850,  856,  856,  856,  856,
			  856,  856,  857,  857,  857,  857,  857,  857,  842,    0,
			  861,  864,  849,  850,  861,  862,  862,  862,  862,  862,

			  862,  863,  863,  863,  863,  863,  863,  865,  864,    0,
			    0,    0,  864,    0,  867,  867,  867,  867,  861,    0,
			    0,    0,    0,    0,  865,    0,    0,    0,  865,  866,
			  866,  866,  866,  866,  866,    0,  864,  870,  870,  870,
			  870,  870,  870,  871,  871,  871,  871,  871,  871,    0,
			    0,    0,  865,  867,  872,  872,  872,  872,  872,  872,
			  874,  874,  874,  874,  874,  874,  875,    0,  875,    0,
			    0,  875,  875,  875,  875,  875,  875,  876,  876,  876,
			  876,  876,  876,  877,  877,  877,  877,  877,  877,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,  875,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  879,  879,  879,  879,  879,  879,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,

			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,

			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  883,  883,    0,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,    0,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  884,  884,    0,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,

			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  886,  886,  886,    0,    0,    0,    0,    0,    0,
			    0,  886,  886,  886,  886,    0,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,    0,
			    0,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  887,  887,    0,  887,  887,    0,  887,  887,  887,    0,

			    0,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,    0,    0,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  888,  888,    0,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  889,  889,    0,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,    0,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,    0,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  892,    0,  892,    0,    0,    0,    0,
			  892,  892,    0,  892,  892,  892,    0,    0,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,    0,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  893,  893,  893,  893,  893,  893,  893,  893,

			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  895,  895,    0,  895,

			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  896,    0,
			    0,    0,    0,  896,  896,  896,    0,    0,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,    0,    0,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  897,  897,  897,  897,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,    0,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  899,    0,    0,    0,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,    0,    0,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  900,
			  900,  900,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  900,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,

			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,    0,    0,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  903,  903,  903,    0,    0,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,    0,    0,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  904,    0,  904,    0,    0,    0,
			    0,  904,  904,    0,  904,  904,  904,    0,    0,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,    0,    0,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  905,  905,  905,    0,    0,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,    0,    0,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,    0,    0,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  906,    0,  906,    0,    0,    0,    0,
			  906,  906,    0,  906,  906,  906,    0,    0,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,    0,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,    0,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,    0,    0,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  909,  909,
			  909,    0,    0,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,    0,    0,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			    0,    0,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  911,  911,  911,    0,    0,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,    0,
			    0,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,    0,    0,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  913,  913,  913,    0,    0,  913,

			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,    0,    0,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,

			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878, yy_Dummy>>,
			1, 226, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   78,    0,    0,  187,
			    0,   68,   71, 1241, 6133,   99, 1235, 1210, 1224, 6133,
			   91,    0, 6133, 6133, 6133, 6133, 1191,   89, 1173,   99,
			  119, 6133, 6133, 1157, 6133, 1142, 1138,  278,  282,  288,
			  121,  298,  326,  333,  348,  304,  337,  355,  427,  399,
			  364,  409,  460, 1106, 6133, 6133, 1105,  539,  618,   95,
			   93,  341,  427,  109,  441,  264,  263,  361,  456,  450,
			  458,  281, 1130, 6133, 6133, 1135,  161, 6133,  121,  369,
			  285,  445,  412,  451,  295, 6133,  423, 1083, 6133,  318,
			 1127,  540,  619, 6133,   86,  697, 6133,  168, 1117, 6133,

			 1096, 6133, 1092,    0,  696, 1087, 1094, 1061,  733, 6133,
			  688,  739,  763,  784,  794, 6133, 6133, 6133,  468,  520,
			    0,  816,  820,  824,  838,  853,  867,  873,  892,  901,
			  887,  773,  918,  940,  933,  948,  962,  976,  968, 1024,
			 1002, 1009, 1103, 1029, 1094, 1129, 1133, 1170, 1048, 1177,
			 1184, 1044,   92, 1003, 6133,  546, 1019, 1250, 1004,   83,
			   97,  249,  532, 1198,  907,  895,  850,  319,  984,  319,
			  329,  981, 1018,  339,  732, 1033, 1163,  370,  386, 1131,
			 1066,  982,  611,  437,  731,  929, 1168, 1192, 1200,  492,
			 1229,  517, 1232,  611,  735, 1227, 1234,  738,  761,  815,

			  852,  796,  790, 1316,  846,  787, 1317,   97, 1318, 6133,
			  973, 6133,  284, 6133, 6133, 1062,  545, 1071, 1249, 1262,
			  939, 6133, 1079,  922, 6133,  496,  719, 1339, 6133,  946,
			 1341,  294, 1398,  381,  618, 1489, 6133, 6133,  911,  982,
			 6133, 6133, 6133,  922, 1280,  906,  896,  872,  865, 1280,
			  422, 6133, 1524, 1352, 1477, 1483, 6133, 1530, 1547, 1557,
			 1489, 1575, 6133,    0,  843, 1586, 1600, 1604, 1608, 1626,
			 1630, 1634, 1659, 1664, 1679, 1686, 1615, 1706, 1713, 1731,
			 1739, 1746, 1753, 1761, 1781, 1770, 1798, 1807, 1813, 1828,
			 1837, 1843, 1853, 1852, 1876, 1880, 1898, 1905, 1923, 1930,

			 1938, 1956, 1960, 1974,  830, 1972, 6133,  831,  958,  955,
			    0, 1985, 1996, 1057, 1665, 1243,  971, 1994, 1032, 1020,
			 1323, 1685, 1065, 1121, 1130, 1325, 1995, 2005, 1154,  779,
			 2006, 1889, 1869, 1166, 1204, 1207, 1215, 2007, 2008, 1609,
			 1328, 1780,    0, 1327, 1315, 1520, 2011, 1584, 1514, 1522,
			 2009, 1658, 1513, 1580,  776, 2038, 2015, 2029,    0, 1688,
			  388, 2050, 2020,  706, 2028, 1688, 2031, 2041, 2048, 6133,
			  825, 2094, 6133,  842, 1081,  808, 2118, 6133, 6133, 2119,
			 6133, 6133, 6133, 6133, 6133, 2132, 2138, 2149, 2155, 2161,
			 2177, 2194, 2200, 2206, 2222, 2231, 2237, 2243,    0,  761,

			 2265, 2269, 2283, 2287, 2301, 2317, 2331, 2339, 2346, 2366,
			 1731, 2372, 2380, 2386, 2400, 2414, 2418, 2432, 2452, 2443,
			 2441, 2481, 2511, 2517, 2523, 2534, 2547, 2562, 2584, 2590,
			 1847, 2599, 2615, 2619, 2624, 2633,  512, 2648,    0, 1613,
			  455, 2267, 2598, 1657, 2451, 1732, 1748, 2170, 2070,    0,
			 1746, 1764, 2128, 2363, 2581, 1818, 1838, 2129, 1839, 1836,
			 1847, 1873, 2384, 2640, 2290, 1907, 2427, 1907, 1924, 2647,
			 2660,    0,    0, 2130, 2171, 1922, 2000, 2053, 2662, 2664,
			  711, 2296, 2709, 2726, 2732, 2738,  658, 2744, 2754, 2766,
			 2772, 2789, 2795,  423, 2806, 2814, 2263,  486,  632, 2836,

			 2840, 2845, 2854, 2870, 2879, 2884, 2862, 2899,  610, 2917,
			 2924, 2939, 2957, 2965, 2971, 2985, 6133, 3002, 3010, 3016,
			 3032, 3045, 2326, 3054, 3068, 3072, 3094, 2583,  620, 1712,
			 1839, 6133,    0,  572, 2311, 2450, 2047, 2398, 2062, 2132,
			 2672, 2674, 2169, 2448, 2875, 2901,    0, 2164, 2452, 2176,
			 2236, 2255,    0, 2680, 2979, 2883, 2305, 2706, 2317, 2414,
			 2919, 2787, 2454, 2485, 2475, 2518, 2829, 2980, 3106, 3119,
			 3128, 2849, 3134, 3140, 3151, 3159, 3165, 3171, 3180, 3191,
			 3197, 1494, 6133, 3205,    0, 3227, 3232, 3246, 3260, 3266,
			 3275, 3291, 3300, 2611, 3305, 3309, 3327, 3331, 3335, 3357,

			 3366, 6133,  603, 3389, 3393, 3407, 3421, 3055, 3064, 3214,
			  104, 6133, 6133, 2542,    0, 2981, 2628,    0, 3225, 2983,
			 2639, 2642,    0, 3226, 3366, 3339, 2645, 2644, 2735, 2723,
			 3391, 3341, 3396, 2757, 3406, 2866, 2891, 3412, 3416,    0,
			 2888, 2924, 2945, 3414, 3417, 3465, 3473, 3479, 3490, 3501,
			 3507, 3513, 3024, 3519, 3525,  578, 3531, 3537, 3547, 6133,
			 3553, 3570,    0, 3579, 3593, 3597, 3601, 3615, 3245, 3623,
			 3632, 3640, 3648, 3654, 3662, 3370, 3668, 3682, 3698,  538,
			  519,  512,  501, 2937, 3022, 3647,    0, 3050, 3427, 3678,
			    0,    0,    0,  845, 3606, 3614, 3664,    0, 3677, 3062,

			    0, 3684, 3701, 3073, 3078, 3133, 3702,  426, 3736, 3747,
			 3753, 3759, 3765, 3776,  409, 2761, 3787, 3691, 3793, 3799,
			 3810,  427, 3821, 3836, 3843, 6133, 3726, 3858, 3806, 3863,
			 3880, 3889, 3223, 3870, 3878, 3879, 3173, 3170, 3883, 3204,
			 3810,    0, 3825, 3238, 3898, 3264, 3265,    0, 3901, 3932,
			  361, 3946, 3952, 3958, 3964, 3972, 3978, 6133, 3984,    0,
			 4008, 4012, 4016, 4034, 6133, 4041, 4048, 3979, 3997, 4019,
			 4028, 3276, 3274, 4047,    0, 3885, 3314, 4020,    0, 3318,
			 4049, 4079,  350, 4085, 4097,    0, 4122, 4126, 4140, 4148,
			  521, 6133, 1931,  305, 3383,  866, 4120, 3395, 4098,  947,

			 2434, 4169,  688, 4178, 4192, 4200, 4206, 3872, 3896, 4194,
			 3532,    0, 4099,    0, 4106, 3543, 4215, 4242,    0,  234,
			 4240, 4214, 4097, 4217, 4242,  965, 3577, 4226,    0, 4264,
			 4291, 4295,  278,  271,  696, 3601,    0, 4293, 4283, 6133,
			  707, 4304, 4326, 4117, 4240, 3620, 4317, 4324, 4346, 4324,
			 4325,    0, 4348, 4257,  144,  126, 4358, 4364, 4337, 6133,
			 4201, 4344, 4377, 4383, 4362, 4378, 4411, 4401, 6133, 6133,
			 4419, 4425, 4436, 6133, 4442, 4453, 4459, 4465, 6133, 4505,
			 4557, 4609, 4661, 4713, 4765, 4801, 4839, 4884, 4934, 4986,
			 5038, 5090, 5141, 5191, 5243, 5295, 5341, 5391, 5443, 5488,

			 5537, 5572, 5622, 5663, 5712, 5762, 5811, 5861, 5897, 5936,
			 5970, 6009, 6043, 6082, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  878,    1,  879,  879,  880,  880,  881,  881,  878,
			    9,  882,  882,  878,  878,  878,  878,  878,  883,  878,
			  884,  885,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  887,  878,  878,  888,  878,  878,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  878,  878,  878,  889,  878,  878,  878,  889,
			  889,  889,  889,  889,  890,  878,  890,  891,  878,  892,
			  878,  892,  892,  878,  893,  894,  878,  878,  878,  878,

			  883,  878,  895,  895,  895,  896,  897,  878,  878,  878,
			  878,  898,  878,  878,  878,  878,  878,  878,  878,  886,
			  899,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,   48,
			  886,  886,  886,  886,   48,  886,  886,  886,  886,  886,
			  886,  887,  887,  888,  878,  878,  878,   58,  878,  157,
			  157,  157,   58,   58,   58,   58,   58,  157,   58,  157,
			  157,   58,   58,  157,  157,   58,   58,  157,  157,   58,
			   58,  157,   58,  157,  157,  157,   58,   58,   58,  157,
			   58,  157,   58,  157,  157,   58,   58,  157,  157,   58,

			   58,  157,  157,   58,   58,  157,   58,  157,   58,  878,
			  889,  878,  878,  878,  878,  889,  889,  889,  889,  889,
			  890,  878,  890,  891,  878,  891,  892,  892,  878,  878,
			  878,  878,  878,  878,  893,  894,  878,  878,  235,  900,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  901,  899,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  878,  886,  886,  886,
			  886,  886,  886,  886,  886,  878,  886,  286,  286,  286,
			  286,  142,  142,  142,  886,  886,  886,  886,  886,  886,

			  886,  886,  886,  886,  878,  887,  878,  878,  157,  157,
			  157,  878,  157,   58,   58,   58,  157,   58,  157,  157,
			   58,   58,  157,  157,  157,   58,   58,   58,  157,  157,
			   58,   58,  878,  157,  157,  157,  157,   58,   58,   58,
			  157,   58,  157,   58,  157,  157,   58,   58,  157,  157,
			   58,   58,  157,  157,  157,   58,   58,   58,  157,   58,
			  157,   58,  889,  889,  889,  889,  889,  889,  889,  878,
			  902,  902,  878,  902,  902,  902,  900,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  903,  899,

			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  878,  886,  886,  886,  886,  886,  886,  886,  878,  286,
			  142,  286,  139,  286,  139,  878,  286,  286,  886,  886,
			  878,  886,  886,  886,  886,  886,  904,  887,  905,  157,
			  157,   58,   58,  157,   58,  157,  157,   58,   58,  157,
			  157,  157,   58,   58,   58,  157,  157,   58,  157,  157,
			  157,  157,   58,   58,   58,  157,   58,  157,  157,   58,
			   58,  157,  157,   58,   58,  157,  157,  157,   58,   58,
			  157,   58,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  898,  878,  878,  878,  903,  886,

			  886,  886,  886,  886,  886,  886,  886,  886,  878,  886,
			  886,  886,  886,  886,  886,  886,  878,  286,  286,  878,
			  286,  520,  878,  886,  886,  886,  886,  901,  878,  906,
			  904,  878,  157,  157,   58,   58,  157,   58,  157,  157,
			   58,   58,  157,  157,   58,   58,  157,  157,   58,  157,
			  157,  157,  157,   58,   58,   58,  157,   58,  157,  157,
			   58,   58,  157,  157,  157,  157,   58,   58,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  907,  908,  886,  886,  886,  886,  886,
			  886,  886,  886,  878,  886,  886,  886,  886,  886,  886,

			  286,  878,  878,  886,  886,  886,  886,  878,  903,  903,
			  906,  878,  878,  157,  157,   58,  157,  157,   58,   58,
			  157,  157,  157,   58,   58,   58,  157,  157,  157,  157,
			   58,   58,   58,  157,   58,  157,  157,   58,   58,  157,
			  157,  157,  157,   58,   58,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  909,  886,  886,  886,  886,  886,  878,  886,
			  886,  886,  886,  886,  886,  878,  886,  886,  886,  878,
			  878,  903,  903,  157,  157,   58,  157,  157,   58,   58,
			  157,  157,  157,  157,   58,   58,   58,  157,   58,  157,

			  157,   58,   58,  157,  157,  157,   58,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  909,  886,  886,  886,  878,  886,  886,  878,  886,
			  886,  886,  878,  878,  908,  908,  157,  157,   58,  157,
			   58,  157,   58,  157,   58,  157,  157,  157,   58,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  910,
			  886,  886,  886,  886,  878,  886,  886,  878,  878,  909,
			  909,  157,  157,   58,  157,   58,  157,   58,  157,  157,
			   58,  878,  878,  878,  878,  911,  886,  886,  886,  886,
			  878,  878,  909,  909,  157,  157,   58,  157,   58,  157,

			  878,  878,  911,  886,  886,  886,  886,  878,  878,  909,
			  157,  157,   58,  157,   58,  157,  878,  878,  912,  878,
			  886,  886,  878,  878,  909,  157,  157,  878,  913,  878,
			  886,  886,  878,  878,  909,  157,  157,  878,  878,  878,
			  913,  878,  886,  878,  878,  157,  878,  878,  886,  878,
			  878,  157,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,    0,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,

			  878,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  132,  130,    1,    2,   15,  114,   18,
			  130,   16,   17,    7,    6,   13,    5,   11,    8,  105,
			  105,   14,   12,   29,   10,   30,   20,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   83,   97,
			   97,   97,   97,   22,   31,   23,    9,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,   24,   21,   25,  118,  119,  120,  121,  118,
			  118,  118,  118,  118,  131,  103,  131,  131,  131,  131,
			   70,  131,  131,   72,  131,  131,   96,    1,    2,   28,

			  114,  113,  128,  128,  128,    0,    3,   33,  109,   32,
			    0,    0,  105,    0,  105,   27,   26,   19,    0,   97,
			   92,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   40,   97,
			   91,   91,   82,   91,   91,   97,   97,   97,   97,   97,
			   97,    0,    0,    0,  104,    0,    0,  100,    0,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,   40,  100,   40,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  100,  100,  100,  101,
			  118,  120,  119,  116,  115,  117,  118,  118,  118,  118,
			    0,  103,    0,    0,  102,    0,    0,    0,   72,   70,
			    0,   69,    0,   68,    0,    0,   96,   94,   94,    0,
			   95,  128,  122,  128,  128,  128,  128,  128,  128,    0,
			    4,   34,  109,    0,    0,    0,  107,  109,  107,  105,
			    0,    0,   92,    0,    0,   97,   97,   39,   97,   97,
			   97,   97,   97,   97,   97,   97,    0,   97,   97,   97,
			   97,   97,   42,   97,   97,    0,   83,   84,   83,   83,
			   83,   90,   97,   90,   90,   90,   97,   97,   97,   97,

			   97,   97,   41,   97,    0,    0,   99,    0,  100,  100,
			   39,   73,   73,  100,  100,   39,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,    0,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,   42,   42,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,   41,   41,
			  100,  100,  118,  118,  118,  118,  118,  118,  118,  102,
			    0,    0,   71,   69,   68,   72,    0,  126,  129,  129,
			  127,  123,  124,  125,   93,  109,    0,  109,    0,    0,
			  109,    0,    0,    0,  108,  105,    0,    0,    0,   98,

			   97,   97,   97,   97,   97,   38,   97,   97,   97,   97,
			    0,   97,   97,   97,   97,   97,   97,   97,    0,   97,
			   82,   97,   97,   97,   97,    0,   82,   82,   82,   37,
			    0,   44,   97,   97,   97,   97,   67,    0,   63,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,   38,
			  100,  100,   38,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,   37,   44,   37,   44,  100,  100,  100,  100,  100,
			  100,  100,  109,  109,    0,    0,  106,  109,    0,  108,
			    0,  108,    0,    0,    0,  105,   79,    0,    0,   60,

			   97,   97,   97,   97,   97,   97,   45,   97,    0,   97,
			   97,   97,   36,   97,   97,   97,   84,   84,   83,    0,
			   97,   97,    0,   97,   97,   97,   97,    0,   67,   67,
			    0,   66,   60,  100,   60,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,   45,  100,   45,  100,
			  100,  100,   36,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,    0,  109,
			    0,  112,  109,  108,    0,    0,  108,    0,    0,  107,
			    0,    0,   79,    0,    0,   97,   61,   97,   62,   97,
			   97,   47,   97,    0,   97,   97,   97,   97,   97,   97,

			   97,   82,    0,   53,   97,   97,   97,    0,    0,    0,
			    0,   65,   64,  100,   61,   61,  100,   62,  100,   62,
			  100,  100,   47,  100,  100,   47,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,   53,
			  100,  100,  100,   53,  100,    0,  109,    0,    0,    0,
			  108,    0,  112,  108,    0,   81,    0,    0,    0,  110,
			  112,  110,    0,   97,   97,   59,   97,   46,    0,   43,
			   58,   97,   35,   97,   51,    0,   97,   97,   97,    0,
			    0,    0,    0,  100,  100,  100,   59,  100,   59,  100,
			   46,   43,   58,  100,   43,   58,  100,   35,   35,  100,

			   51,  100,   51,  100,  100,  100,  100,  112,    0,  112,
			    0,  108,    0,    0,  111,    0,    0,   78,  112,    0,
			  111,    0,   97,   97,   97,   87,   54,   97,    0,   97,
			   97,   55,    0,    0,    0,    0,  100,  100,  100,  100,
			  100,   54,   54,  100,  100,  100,  100,   55,  100,  112,
			  111,    0,  111,    0,    0,    0,    0,   78,  111,    0,
			   97,   97,   48,   97,   86,   52,   97,    0,    0,    0,
			    0,  100,  100,  100,   48,   48,  100,  100,   52,  100,
			   52,  111,   80,    0,   78,    0,   97,   97,   97,   97,
			   85,   85,   85,   85,  100,  100,  100,  100,  100,  100,

			    0,    0,    0,   97,   50,   49,   97,    0,    0,    0,
			  100,   50,   50,   49,   49,  100,    0,    0,    0,    0,
			   97,   97,    0,    0,    0,  100,  100,   77,    0,    0,
			   97,   56,    0,    0,    0,  100,   56,    0,    0,   77,
			    0,   74,   97,    0,    0,  100,    0,    0,   57,    0,
			    0,   57,    0,   76,    0,    0,    0,    0,    0,   76,
			    0,    0,    0,    0,    0,    0,    0,   75,   88,   89,
			    0,    0,    0,   75,    0,   75,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6133
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 878
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 879
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

	yyNb_rules: INTEGER = 131
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 132
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
