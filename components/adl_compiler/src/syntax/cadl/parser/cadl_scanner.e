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
		--		unread_character (in_buffer.item(in_buffer.count)) -- put back the last character - '}'
		--		in_buffer.remove_tail(1) -- get rid of the "}" from the buffer

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

			  102,   96,   77,   96,   96,  106,  883,  107,  107,  107,
			  107,  107,  107,  109,  232,  110,  212,  111,  111,  111,
			  111,  111,  111,  117,  117,  168,  117,  156,  220,  156,
			  222,   86,   86,  109,  169,  110,  306,  113,  113,  113,
			  113,  113,  113,  156,   78,  103,  180,  119,  358,   78,
			  866,   95,  865,  170,   95,  161,  112,  161,  211,  610,
			  211,  211,  171,  213,  306,  221,  849,  221,  848,  233,
			   96,  161,   96,   96,  181,  834,  112,  358,   79,   80,
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
			  117,  117,  307,  117,  117,  117,  211,  117,  211,  211,
			  117,  117,  210,  117,  188,  308,  223,  156,  156,  223,

			  117,  117,  762,  117,  119,  190,  117,  117,  119,  117,
			  307,  577,  577,  120,  119,  156,  123,  121,  124,  122,
			  823,  824,  189,  308,  119,  161,  161,  125,  117,  117,
			  119,  117,  206,  191,  134,  117,  117,  126,  117,  117,
			  117,  120,  117,  161,  123,  121,  124,  122,  127,  225,
			  117,  117,  119,  117,  314,  125,  128,  117,  117,  119,
			  117,  207,  134,  119,  316,  126,  117,  117,  129,  117,
			  130,  317,  215,  301,  119,  156,  210,  127,  805,  135,
			  172,  119,  314,  228,  128,  320,  228,  136,  131,  132,
			  119,  173,  316,  192,  133,  156,  129,  478,  130,  317,

			  137,  117,  117,  161,  117,  146,  193,  135,  174,  302,
			  147,  117,  117,  320,  117,  136,  131,  132,  573,  210,
			  175,  194,  133,  161,  303,  119,  478,  774,  137,  117,
			  117,  326,  117,  146,  195,  119,  144,  210,  147,  230,
			  327,  812,  230,  762,  145,  138,  138,  138,  138,  138,
			  138,  148,  210,  119,  214,  214,  214,  176,  210,  326,
			  139,  156,  117,  117,  144,  117,  490,  140,  327,  177,
			  117,  117,  145,  117,  141,  156,  142,  220,  143,  148,
			  331,  182,  183,  813,  156,  178,  119,  184,  139,  161,
			  156,  200,  156,  196,  259,  140,  201,  179,  217,  217,

			  204,  197,  582,  161,  532,  142,  338,  143,  331,  185,
			  186,  149,  161,  222,  221,  187,  482,  215,  161,  202,
			  161,  198,  117,  117,  203,  117,  823,  824,  205,  199,
			  216,  216,  216,  532,  338,  260,  218,  218,  218,  340,
			  149,  154,  227,  112,  154,  227,  119,  260,  154,  155,
			  221,  154,  210,  737,  228,  229,  155,  156,  156,  156,
			  156,  156,  156,  157,  342,  230,  156,  340,  736,  156,
			  156,  156,  156,  156,  158,  156,  156,  156,  159,  156,
			  160,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  342,  735,  161,  225,  156,  161,  161,  162,

			  161,  161,  163,  161,  161,  161,  164,  161,  165,  161,
			  161,  161,  161,  161,  162,  161,  161,  161,  161,  161,
			  154,  227,  526,  154,  227,  527,  260,  734,  155,  717,
			  214,  214,  214,  228,  676,  330,  156,  156,  156,  156,
			  156,  156,  157,  343,  230,  156,  232,  614,  156,  156,
			  156,  156,  166,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  343,  592,  161,  225,  156,  161,  161,  161,  161,
			  167,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  235,

			  235,  233,  235,  583,  762,  240,  252,  252,  252,  252,
			  252,  252,  849,  109,  241,  241,  241,  241,  241,  241,
			  247,  223,  247,  247,  223,  236,  525,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  242,  249,  249,  249,  249,  249,  249,  254,  254,  254,
			  254,  254,  254,  332,  321,  243,  333,  250,  346,  244,
			  322,  245,  347,  255,  225,  117,  117,  109,  117,  110,
			  237,  256,  256,  256,  256,  256,  256,  257,  260,  396,
			  251,  332,  321,  369,  333,  250,  346,  273,  322,  119,

			  347,  255,  258,  258,  258,  258,  258,  258,  109,  352,
			  110,  369,  256,  256,  256,  256,  256,  256,  117,  117,
			  112,  117,  117,  117,  475,  117,  117,  117,  454,  117,
			  260,  260,  356,  260,  350,  260,  436,  352,  351,  260,
			  117,  117,  119,  117,  370,  369,  119,  370,  433,  346,
			  119,  112,  352,  260,  396,  117,  117,  264,  117,  263,
			  356,  380,  350,  262,  119,  260,  351,  260,  260,  117,
			  117,  526,  117,  265,  526,  117,  117,  348,  117,  119,
			  355,  379,  260,  308,  156,  264,  156,  263,  260,  117,
			  117,  262,  117,  119,  117,  117,  744,  117,  266,  119,

			  347,  265,  260,  117,  117,  378,  117,  260,  377,  267,
			  260,  313,  161,  119,  161,  374,  260,  816,  119,  268,
			  117,  117,  260,  117,  269,  744,  266,  119,  349,  156,
			  270,  883,  272,  260,  307,  117,  117,  267,  117,  226,
			  271,  156,  117,  117,  119,  117,  816,  268,  260,  210,
			  117,  117,  269,  117,  306,  260,  334,  161,  270,  119,
			  272,  274,  312,  260,  117,  117,  119,  117,  271,  161,
			  117,  117,  275,  117,  119,  276,  273,  260,  117,  117,
			  305,  117,  311,  260,  373,  373,  304,  373,  119,  274,
			  277,  260,  437,  438,  119,  278,  260,  441,  820,  260, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  275,  281,  119,  276,  117,  117,  153,  117,  280,  279,
			  236,  117,  117,  443,  117,  156,  840,  260,  156,  314,
			  437,  438,  301,  278,  260,  441,  316,  820,  119,  281,
			  248,  117,  117,  260,  117,  119,  280,  279,  282,  260,
			  282,  443,  139,  161,  260,  840,  161,  315,  260,  288,
			  117,  117,  156,  117,  318,  119,  288,  283,  142,  247,
			  317,  284,  139,  260,  285,  444,  447,  156,  246,  210,
			  139,  118,  260,  286,  119,  287,  288,  239,  210,  320,
			  161,  260,  298,  371,  369,  283,  371,  142,  319,  284,
			  139,  437,  285,  444,  447,  161,  246,  246,  100,  246,

			  156,   97,  286,  226,  287,  117,  117,  323,  117,  260,
			  298,  327,  118,  118,  118,  118,  118,  118,  260,  439,
			  381,  289,  289,  289,  289,  289,  289,  210,  161,  119,
			  208,  117,  117,  448,  117,  117,  117,  153,  117,  329,
			  290,  288,  151,  291,  260,  118,  260,  116,  260,  292,
			  360,  361,  362,  363,  364,  119,  214,  214,  214,  119,
			  449,  448,  453,  293,  115,  156,  294,  114,  290,  108,
			  326,  291,  117,  117,  118,  117,  456,  292,  260,  117,
			  117,  295,  117,  260,  105,  260,  117,  117,  449,  117,
			  453,  293,  260,  161,  294,  321,  119,  156,  328,  260,

			  457,  322,  156,  119,  456,  458,  210,  260,  296,  295,
			  119,  331,  297,  260,  309,  260,  310,  310,  310,  310,
			  310,  310,  299,  324,  332,  161,  156,  333,  457,  325,
			  161,  100,  156,  458,  156,  300,  296,   98,  613,  335,
			  297,  613,  260,  459,  260,  463,  684,  260,   97,  260,
			  299,  883,  336,  465,  161,  337,  210,  334,  260,  342,
			  161,  156,  161,  156,  300,  260,  156,  343,  156,  210,
			  883,  459,  883,  463,  883,  883,  338,  156,  466,  340,
			  883,  465,  883,  883,  156,  217,  217,  344,  883,  161,
			  883,  161,  883,  883,  161,  345,  161,  375,  376,  376,

			  376,  376,  376,  376,  339,  161,  466,  341,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  260,  260,  260,  365,  365,  365,  883,  260,  883,
			  260,  227,  260,  227,  227,  883,  227,  366,  366,  366,
			  156,  156,  156,  228,  350,  228,  443,  156,  351,  447,
			  469,  156,  356,  470,  230,  383,  230,  383,  883,  358,
			  384,  384,  384,  384,  384,  384,  883,  883,  161,  161,
			  161,  883,  353,  883,  445,  161,  354,  450,  469,  161,
			  357,  470,  883,  883,  225,  883,  225,  883,  359,  367,

			  368,  369,  367,  368,  367,  367,  367,  367,  367,  367,
			  367,  367,  370,  229,  229,  367,  229,  229,  229,  229,
			  229,  229,  367,  371,  367,  367,  367,  367,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  367,  367,  372,  367,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  235,  235,  883,  235,  385,  385,  385,  385,  385,

			  385,  386,  386,  386,  386,  386,  386,  393,  393,  393,
			  393,  393,  659,  659,  659,  659,  659,  236,  883,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  382,  382,  382,  382,  382,  382,  387,  387,
			  387,  387,  387,  387,  473,  474,  531,  535,  250,  883,
			  390,  883,  390,  883,  388,  391,  391,  391,  391,  391,
			  391,  109,  237,  110,  883,  392,  392,  392,  392,  392,
			  392,  251,  473,  474,  531,  535,  250,  389,  117,  117,
			  883,  117,  388,  394,  394,  394,  394,  394,  394,  260,

			  883,  260,  117,  117,  883,  117,  117,  117,  883,  117,
			  117,  117,  119,  117,  112,  260,  883,  883,  466,  260,
			  397,  883,  883,  260,  260,  537,  119,  883,  117,  117,
			  119,  117,  117,  117,  119,  117,  117,  117,  883,  117,
			  883,  260,  398,  156,  407,  260,  468,  458,  397,  260,
			  399,  883,  119,  537,  883,  407,  119,  883,  538,  400,
			  119,  117,  117,  883,  117,  407,  117,  117,  402,  117,
			  398,  161,  883,  260,  260,  462,  401,  883,  399,  260,
			  260,  117,  117,  407,  117,  119,  538,  400,  117,  117,
			  119,  117,  470,  883,  260,  541,  402,  883,  403,  156,

			  260,  260,  542,  260,  401,  119,  883,  438,  117,  117,
			  404,  117,  119,  883,  526,  117,  117,  527,  117,  156,
			  472,  260,  156,  541,  883,  405,  403,  161,  260,  883,
			  542,  444,  119,  117,  117,  440,  117,  612,  404,  119,
			  612,  117,  117,  406,  117,  408,  260,  161,  117,  117,
			  161,  117,  409,  405,  260,  117,  117,  119,  117,  446,
			  506,  260,  613,  117,  117,  119,  117,  610,  260,  410,
			  545,  506,  119,  408,  546,  260,  260,  411,  412,  119,
			  409,  506,  548,  117,  117,  883,  117,  119,  415,  415,
			  415,  415,  415,  415,  538,  260,  260,  410,  545,  506,

			  117,  117,  546,  117,  883,  411,  412,  119,  883,  413,
			  548,  549,  463,  260,  156,  414,  416,  416,  416,  416,
			  416,  416,  540,  883,  119,  418,  418,  418,  418,  418,
			  418,  419,  419,  419,  419,  419,  419,  413,  883,  549,
			  464,  883,  161,  414,  609,  417,  420,  420,  420,  420,
			  420,  420,  550,  883,  118,  421,  421,  421,  421,  421,
			  421,  118,  118,  118,  118,  118,  118,  422,  551,  422,
			  118,  118,  118,  118,  118,  118,  520,  555,  117,  117,
			  550,  117,  117,  117,  557,  117,  305,  520,  558,  118,
			  423,  260,  883,  424,  611,  260,  551,  520,  407,  425,

			  117,  117,  119,  117,  260,  555,  119,  117,  117,  407,
			  117,  883,  557,  260,  561,  520,  558,  118,  423,  407,
			  260,  424,  292,  156,  119,  117,  117,  425,  117,  427,
			  883,  119,  117,  117,  883,  117,  812,  407,  260,  426,
			  117,  117,  561,  117,  562,  260,  454,  762,  883,  119,
			  292,  161,  615,  260,  883,  883,  119,  428,  117,  117,
			  883,  117,  117,  117,  119,  117,  883,  426,  883,  617,
			  210,  260,  562,  883,  429,  260,  117,  117,  814,  117,
			  615,  883,  119,  430,  883,  428,  119,  883,  434,  260,
			  434,  434,  434,  434,  434,  434,  301,  617,  883,  883, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  119,  435,  429,  435,  435,  435,  435,  435,  435,  301,
			  618,  430,  309,  431,  309,  309,  309,  309,  309,  309,
			  260,  260,  260,  260,  309,  432,  310,  310,  310,  310,
			  310,  310,  260,  260,  621,  883,  260,  883,  618,  156,
			  156,  156,  156,  883,  883,  448,  260,  441,  214,  214,
			  214,  156,  156,  449,  432,  156,  465,  456,  260,  260,
			  457,  883,  621,  453,  210,  156,  627,  161,  161,  161,
			  161,  260,  469,  451,  210,  442,  260,  156,  156,  161,
			  161,  452,  210,  161,  467,  460,  210,  473,  461,  474,
			  156,  455,  628,  161,  627,  156,  368,  369,  629,  368,

			  471,  373,  373,  883,  373,  161,  161,  883,  370,  821,
			  821,  821,  478,  475,  883,  476,  883,  477,  161,  371,
			  628,  883,  282,  161,  282,  883,  629,  883,  375,  376,
			  376,  376,  376,  376,  376,  480,  480,  480,  480,  480,
			  480,  479,  216,  216,  216,  284,  883,  630,  515,  372,
			  634,  250,  218,  218,  218,  118,  756,  756,  756,  756,
			  214,  214,  214,  883,  214,  214,  214,  384,  384,  384,
			  384,  384,  384,  284,  251,  630,  515,  883,  634,  250,
			  481,  481,  481,  481,  481,  481,  483,  483,  483,  483,
			  483,  483,  484,  484,  484,  484,  484,  484,  485,  485,

			  485,  485,  485,  485,  488,  488,  488,  488,  488,  488,
			  636,  637,  640,  641,  388,  486,  883,  486,  883,  482,
			  487,  487,  487,  487,  487,  487,  391,  391,  391,  391,
			  391,  391,  260,  883,  883,  883,  883,  389,  636,  637,
			  640,  641,  388,  489,  489,  489,  489,  489,  489,  491,
			  492,  156,  493,  493,  493,  493,  493,  493,  494,  494,
			  494,  494,  494,  494,  495,  495,  495,  495,  495,  495,
			  117,  117,  642,  117,  117,  117,  883,  117,  612,  161,
			  260,  612,  490,  260,  883,  260,  883,  260,  117,  117,
			  643,  117,  117,  117,  119,  117,  685,  883,  119,  545,

			  642,  260,  883,  613,  156,  260,  117,  117,  883,  117,
			  883,  883,  119,  497,  260,  531,  119,  883,  643,  260,
			  883,  498,  117,  117,  685,  117,  883,  547,  500,  260,
			  119,  499,  161,  156,  686,  260,  117,  117,  501,  117,
			  883,  497,  563,  533,  117,  117,  119,  117,  156,  260,
			  498,  117,  117,  564,  117,  883,  500,  260,  601,  499,
			  119,  161,  686,  883,  260,  688,  501,  883,  119,  601,
			  563,  117,  117,  883,  117,  119,  161,  117,  117,  601,
			  117,  564,  502,  504,  260,  117,  117,  883,  117,  503,
			  260,  117,  117,  688,  117,  119,  883,  601,  260,  505,

			  883,  119,  525,  883,  260,  117,  117,  883,  117,  119,
			  502,  504,  883,  507,  689,  119,  260,  503,  260,  117,
			  117,  156,  117,  117,  117,  118,  117,  505,  118,  119,
			  509,  508,  260,  883,  118,  156,  260,  117,  117,  537,
			  117,  507,  689,  119,  510,  883,  260,  119,  883,  161,
			  260,  883,  883,  118,  511,  883,  118,  883,  509,  508,
			  883,  119,  118,  161,  883,  156,  512,  539,  758,  759,
			  758,  759,  510,  415,  415,  415,  415,  415,  415,  282,
			  513,  282,  511,  418,  418,  418,  418,  418,  418,  117,
			  117,  883,  117,  161,  512,  419,  419,  419,  419,  419,

			  419,  514,  260,  117,  117,  515,  117,  760,  513,  883,
			  883,  260,  118,  119,  692,  883,  260,  515,  883,  420,
			  420,  420,  420,  420,  420,  883,  883,  119,  118,  514,
			  615,  693,  883,  515,  516,  421,  421,  421,  421,  421,
			  421,  260,  692,  117,  117,  515,  117,  883,  118,  517,
			  517,  517,  517,  517,  517,  883,  260,  118,  616,  693,
			  156,  883,  516,  883,  548,  883,  260,  119,  118,  518,
			  518,  518,  518,  518,  518,  519,  519,  519,  519,  519,
			  519,  117,  117,  622,  117,  156,  117,  117,  161,  117,
			  117,  117,  552,  117,  260,  623,  535,  118,  118,  260,

			  694,  883,  883,  260,  118,  119,  117,  117,  883,  117,
			  119,  622,  883,  161,  119,  695,  699,  522,  523,  525,
			  883,  260,  260,  623,  536,  883,  883,  521,  694,  524,
			  119,  434,  260,  434,  434,  434,  434,  434,  434,  301,
			  156,  156,  883,  695,  699,  522,  523,  260,  550,  883,
			  883,  156,  260,  260,  541,  521,  435,  524,  435,  435,
			  435,  435,  435,  435,  301,  549,  156,  260,  161,  161,
			  529,  156,  156,  260,  883,  555,  554,  260,  579,  161,
			  579,  532,  543,  260,  542,  883,  156,  701,  702,  580,
			  649,  705,  156,  553,  161,  530,  156,  557,  706,  161,

			  161,  562,  156,  556,  260,  707,  561,  558,  117,  117,
			  534,  117,  544,  251,  161,  701,  702,  581,  649,  705,
			  161,  260,  618,  156,  161,  559,  706,  883,  883,  566,
			  161,  883,  119,  707,  565,  560,  480,  480,  480,  480,
			  480,  480,  568,  568,  568,  568,  568,  568,  883,  883,
			  620,  161,  567,  569,  569,  569,  569,  569,  569,  570,
			  570,  570,  570,  570,  570,  883,  571,  571,  571,  571,
			  571,  571,  487,  487,  487,  487,  487,  487,  883,  883,
			  567,  482,  388,  572,  572,  572,  572,  572,  572,  574,
			  574,  574,  574,  574,  574,  575,  575,  575,  575,  575,

			  575,  883,  883,  739,  740,  389,  117,  117,  883,  117,
			  388,  576,  576,  576,  576,  576,  576,  260,  260,  260,
			  883,  883,  573,  571,  571,  571,  571,  571,  571,  715,
			  119,  739,  740,  883,  490,  883,  622,  156,  492,  578,
			  493,  493,  493,  493,  493,  493,  117,  117,  623,  117,
			  117,  117,  389,  117,  883,  117,  117,  715,  117,  260,
			  614,  584,  883,  260,  625,  161,  883,  578,  260,  883,
			  119,  606,  117,  117,  119,  117,  626,  883,  585,  119,
			  117,  117,  607,  117,  669,  260,  587,  117,  117,  586,
			  117,  883,  608,  260,  117,  117,  119,  117,  883,  883,

			  260,  669,  260,  588,  119,  669,  585,  260,  260,  742,
			  607,  119,  589,  883,  587,  883,  883,  586,  119,  117,
			  117,  156,  117,  883,  590,  746,  593,  628,  883,  669,
			  748,  588,  260,  117,  117,  883,  117,  742,  117,  117,
			  589,  117,  883,  119,  260,  749,  260,  117,  117,  161,
			  117,  260,  590,  746,  593,  631,  591,  119,  748,  750,
			  260,  883,  119,  156,  594,  117,  117,  630,  117,  117,
			  117,  119,  117,  749,  595,  883,  883,  260,  260,  770,
			  883,  883,  260,  770,  591,  117,  117,  750,  117,  119,
			  883,  161,  594,  119,  260,  633,  634,  596,  260,  883, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  770,  883,  595,  599,  599,  599,  599,  599,  599,  119,
			  883,  770,  597,  637,  883,  775,  883,  598,  118,  118,
			  118,  118,  118,  118,  635,  596,  517,  517,  517,  517,
			  517,  517,  118,  519,  519,  519,  519,  519,  519,  776,
			  597,  639,  422,  775,  422,  598,  518,  518,  518,  518,
			  518,  518,  260,  883,  600,  118,  117,  117,  883,  117,
			  117,  117,  260,  117,  883,  883,  883,  776,  424,  260,
			  883,  156,  883,  260,  425,  118,  117,  117,  617,  117,
			  119,  640,  600,  118,  119,  883,  260,  778,  602,  260,
			  117,  117,  603,  117,  260,  780,  424,  782,  260,  161,

			  119,  727,  425,  260,  621,  156,  619,  260,  260,  644,
			  883,  883,  629,  156,  119,  778,  602,  156,  727,  604,
			  603,  883,  727,  780,  883,  782,  641,  156,  636,  646,
			  605,  646,  624,  161,  647,  647,  647,  647,  647,  647,
			  632,  161,  883,  883,  883,  161,  727,  604,  647,  647,
			  647,  647,  647,  647,  645,  161,  638,  783,  605,  648,
			  648,  648,  648,  648,  648,  571,  571,  571,  571,  571,
			  571,  651,  651,  651,  651,  651,  651,  883,  799,  883,
			  800,  650,  883,  883,  883,  783,  883,  482,  652,  652,
			  652,  652,  652,  652,  653,  653,  653,  653,  653,  653,

			  654,  654,  654,  654,  654,  654,  799,  260,  800,  650,
			  573,  655,  655,  655,  655,  655,  655,  656,  656,  656,
			  656,  656,  656,  657,  883,  657,  156,  883,  654,  654,
			  654,  654,  654,  654,  883,  774,  774,  883,  774,  490,
			  658,  658,  658,  658,  658,  658,  661,  661,  661,  661,
			  661,  661,  117,  117,  161,  117,  883,  117,  117,  798,
			  117,  883,  662,  260,  883,  260,  680,  883,  680,  883,
			  260,  117,  117,  883,  117,  883,  119,  680,  686,  682,
			  664,  119,  156,  883,  260,  117,  117,  681,  117,  683,
			  662,  117,  117,  802,  117,  119,  883,  730,  260,  665,

			  117,  117,  883,  117,  260,  680,  687,  682,  664,  119,
			  161,  681,  883,  260,  730,  119,  117,  117,  730,  117,
			  804,  802,  683,  666,  119,  117,  117,  665,  117,  260,
			  117,  117,  683,  117,  117,  117,  815,  117,  260,  667,
			  119,  883,  730,  260,  818,  883,  883,  260,  804,  119,
			  683,  666,  117,  117,  119,  117,  117,  117,  119,  117,
			  117,  117,  668,  117,  815,  260,  671,  667,  883,  260,
			  883,  830,  818,  260,  670,  883,  119,  260,  883,  260,
			  119,  883,  117,  117,  119,  117,  883,  883,  831,  883,
			  668,  883,  674,  883,  671,  260,  688,  672,  156,  830,

			  673,  883,  670,  282,  260,  282,  119,  599,  599,  599,
			  599,  599,  599,  675,  117,  117,  831,  117,  117,  117,
			  674,  117,  767,  156,  690,  672,  161,  260,  673,  260,
			  689,  260,  117,  117,  260,  117,  118,  883,  119,  767,
			  841,  675,  119,  767,  260,  260,  117,  117,  156,  117,
			  260,  161,  260,  694,  260,  260,  119,  827,  691,  260,
			  693,  677,  678,  156,  260,  827,  883,  767,  841,  156,
			  119,  701,  702,  156,  156,  699,  161,  679,  827,  850,
			  883,  697,  695,  156,  883,  883,  883,  883,  696,  677,
			  678,  161,  856,  827,  705,  117,  117,  161,  117,  703,

			  704,  161,  161,  700,  883,  679,  883,  850,  260,  883,
			  698,  161,  647,  647,  647,  647,  647,  647,  883,  119,
			  856,  883,  708,  647,  647,  647,  647,  647,  647,  709,
			  709,  709,  709,  709,  709,  710,  883,  710,  883,  883,
			  711,  711,  711,  711,  711,  711,  712,  883,  712,  883,
			  883,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  714,  714,  714,  714,  714,  714,  654,
			  654,  654,  654,  654,  654,  716,  716,  716,  716,  716,
			  716,  654,  654,  654,  654,  654,  654,  718,  718,  718,
			  718,  718,  718,  883,  883,  883,  573,  719,  719,  719,

			  719,  719,  719,  720,  720,  720,  720,  720,  720,  883,
			  883,  883,  883,  117,  117,  721,  117,  721,  883,  715,
			  722,  722,  722,  722,  722,  722,  260,  117,  117,  883,
			  117,  117,  117,  883,  117,  117,  117,  119,  117,  883,
			  260,  883,  389,  883,  260,  883,  260,  715,  260,  117,
			  117,  119,  117,  883,  883,  119,  724,  117,  117,  119,
			  117,  726,  260,  883,  725,  156,  117,  117,  883,  117,
			  260,  883,  260,  119,  117,  117,  883,  117,  883,  260,
			  883,  119,  117,  117,  724,  117,  883,  260,  883,  726,
			  119,  156,  725,  161,  883,  260,  117,  117,  119,  117,

			  117,  117,  883,  117,  117,  117,  119,  117,  260,  260,
			  260,  260,  883,  260,  260,  728,  883,  260,  260,  161,
			  119,  729,  117,  117,  119,  117,  260,  156,  119,  156,
			  156,  742,  731,  156,  740,  260,  883,  156,  883,  732,
			  117,  117,  883,  117,  728,  156,  119,  744,  883,  729,
			  260,  260,  746,  260,  733,  161,  883,  161,  161,  743,
			  731,  161,  741,  883,  119,  161,  883,  732,  883,  156,
			  748,  883,  883,  161,  883,  883,  745,  883,  883,  883,
			  747,  883,  733,  711,  711,  711,  711,  711,  711,  752,
			  752,  752,  752,  752,  752,  883,  883,  161,  751,  713,

			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  753,  753,  753,  753,  753,  753,  754,  883,  754,
			  883,  883,  755,  755,  755,  755,  755,  755,  482,  757,
			  757,  757,  757,  757,  757,  653,  653,  653,  653,  653,
			  653,  722,  722,  722,  722,  722,  722,  117,  117,  883,
			  117,  715,  761,  761,  761,  761,  761,  761,  883,  828,
			  260,  883,  117,  117,  883,  117,  883,  828,  883,  117,
			  117,  119,  117,  883,  389,  260,  883,  763,  883,  715,
			  828,  883,  260,  883,  117,  117,  119,  117,  883,  117,
			  117,  490,  117,  119,  883,  828,  771,  260,  764,  883,

			  771,  765,  260,  117,  117,  763,  117,  883,  119,  117,
			  117,  770,  117,  119,  766,  772,  260,  771,  260,  771,
			  768,  883,  260,  773,  883,  260,  764,  119,  771,  765,
			  260,  883,  772,  119,  883,  769,  260,  156,  260,  837,
			  773,  776,  766,  772,  778,  883,  794,  837,  768,  156,
			  794,  773,  883,  780,  883,  156,  782,  156,  117,  117,
			  837,  117,  883,  769,  883,  161,  883,  794,  883,  777,
			  883,  260,  779,  883,  883,  837,  883,  161,  794,  883,
			  883,  781,  119,  161,  784,  161,  709,  709,  709,  709,
			  709,  709,  755,  755,  755,  755,  755,  755,  785,  785, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  785,  785,  785,  785,  786,  786,  786,  786,  786,  786,
			  581,  581,  581,  581,  581,  581,  787,  787,  787,  787,
			  787,  787,  883,  883,  883,  482,  788,  788,  788,  788,
			  788,  788,  117,  117,  883,  117,  883,  573,  716,  716,
			  716,  716,  716,  716,  883,  260,  117,  117,  795,  117,
			  117,  117,  795,  117,  883,  883,  119,  260,  794,  260,
			  795,  883,  796,  260,  797,  117,  117,  790,  117,  795,
			  119,  883,  117,  117,  119,  117,  156,  490,  260,  796,
			  795,  797,  792,  260,  260,  260,  260,  854,  883,  119,
			  796,  791,  797,  260,  260,  790,  119,  883,  854,  260,

			  883,  883,  156,  802,  161,  156,  883,  883,  854,  883,
			  792,  883,  156,  156,  883,  800,  883,  793,  156,  791,
			  753,  753,  753,  753,  753,  753,  854,  883,  883,  816,
			  161,  803,  883,  161,  806,  806,  806,  806,  806,  806,
			  161,  161,  758,  801,  758,  793,  161,  788,  788,  788,
			  788,  788,  788,  117,  117,  260,  117,  883,  817,  573,
			  117,  117,  883,  117,  883,  883,  260,  117,  117,  883,
			  117,  883,  883,  260,  156,  117,  117,  119,  117,  855,
			  260,  760,  883,  883,  119,  808,  818,  883,  260,  883,
			  855,  119,  822,  822,  822,  822,  822,  822,  883,  119,

			  855,  883,  161,  117,  117,  883,  117,  117,  117,  809,
			  117,  810,  883,  808,  819,  762,  260,  883,  855,  883,
			  260,  883,  117,  117,  811,  117,  838,  119,  828,  883,
			  883,  119,  883,  883,  838,  260,  829,  883,  809,  810,
			  883,  117,  117,  883,  117,  883,  119,  838,  825,  829,
			  842,  883,  842,  811,  260,  832,  832,  832,  832,  832,
			  832,  843,  838,  883,  829,  119,  760,  760,  760,  760,
			  760,  760,  117,  117,  762,  117,  825,  117,  117,  883,
			  117,  862,  826,  862,  883,  260,  859,  838,  883,  844,
			  260,  883,  863,  883,  883,  839,  119,  859,  883,  883,

			  883,  119,  846,  846,  846,  846,  846,  859,  839,  836,
			  826,  117,  117,  883,  117,  117,  117,  883,  117,  883,
			  864,  835,  883,  839,  260,  859,  883,  883,  260,  851,
			  851,  851,  851,  851,  851,  119,  883,  836,  883,  119,
			  852,  852,  852,  852,  852,  883,  117,  117,  883,  117,
			  835,  883,  847,  846,  846,  846,  846,  846,  846,  260,
			  857,  857,  857,  857,  857,  857,  117,  117,  883,  117,
			  119,  858,  858,  858,  858,  858,  858,  860,  853,  260,
			  847,  861,  861,  861,  861,  861,  861,  883,  860,  883,
			  119,  844,  844,  844,  844,  844,  844,  869,  860,  867,

			  867,  867,  867,  867,  867,  870,  853,  868,  868,  868,
			  868,  868,  883,  883,  869,  883,  860,  883,  869,  883,
			  883,  883,  870,  873,  874,  883,  870,  871,  871,  871,
			  871,  871,  871,  872,  872,  872,  872,  872,  872,  883,
			  873,  874,  869,  883,  873,  874,  876,  877,  876,  877,
			  870,  875,  875,  875,  875,  875,  875,  864,  864,  864,
			  864,  864,  864,  883,  883,  883,  883,  883,  873,  874,
			  879,  879,  879,  879,  879,  879,  880,  880,  880,  880,
			  880,  880,  883,  883,  883,  878,  881,  881,  881,  881,
			  881,  881,  876,  883,  876,  883,  883,  880,  880,  880,

			  880,  880,  880,  882,  882,  882,  882,  882,  882,  878,
			  878,  878,  878,  878,  878,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  878,   75,   75,   75,   75,   75,   75,   75,   75,
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
			   93,   93,   93,   93,   93,   93,   99,   99,  883,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,  883,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,  101,  101,  883,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  118,  118,  118,  883,  883,  883,  883,  883,  883,
			  118,  118,  118,  118,  883,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  883,  883,

			  118,  118,  118,  118,  118,  118,  118,  118,  118,  150,
			  150,  883,  150,  150,  150,  150,  150,  883,  883,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  883,  883,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  152,  152,  883,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  152,  152,  152,  152,  209,  209,  883,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  883,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,

			  219,  219,  219,  219,  219,  219,  224,  883,  224,  883,
			  883,  883,  883,  224,  224,  224,  224,  224,  883,  883,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  883,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  231,  231,  231,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  238,  238,  883,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,

			  238,  238,  238,  238,  238,  238,  238,  104,  883,  883,
			  883,  104,  104,  104,  883,  883,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  883,
			  883,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

			  105,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  883,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  261,  883,  883,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  883,  883,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  237,  237,  237,  883,  883,  883,

			  883,  883,  883,  883,  883,  883,  883,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  237,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  395,  395,  395,  883,  883,  395,  395,
			  395,  395,  395,  395,  395,  395,  395,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,

			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  496,  496,
			  496,  883,  883,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  883,  883,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  528,  883,  528,
			  883,  883,  883,  883,  528,  528,  528,  528,  528,  883,
			  883,  528,  528,  528,  528,  528,  528,  528,  528,  528,
			  528,  528,  528,  528,  528,  528,  528,  528,  528,  528,

			  528,  528,  528,  528,  883,  883,  528,  528,  528,  528,
			  528,  528,  528,  528,  528,  436,  436,  436,  883,  883,
			  436,  436,  436,  436,  436,  436,  436,  436,  883,  883,
			  436,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  883,  883,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  609,  883,  609,  883,  883,  883,
			  883,  609,  609,  609,  609,  609,  883,  883,  609,  609,
			  609,  609,  609,  609,  609,  609,  609,  609,  609,  609,
			  609,  609,  609,  609,  609,  609,  609,  609,  609,  609,

			  609,  883,  609,  609,  609,  609,  609,  609,  609,  609,
			  609,  609,  660,  660,  660,  660,  660,  660,  660,  660,
			  660,  883,  660,  660,  660,  660,  660,  660,  660,  660,
			  660,  660,  660,  660,  660,  660,  660,  660,  660,  660,
			  660,  660,  660,  660,  660,  660,  660,  660,  660,  660,
			  660,  660,  660,  660,  660,  660,  660,  660,  660,  660,
			  660,  660,  660,  663,  663,  663,  663,  663,  663,  663,
			  663,  663,  663,  663,  663,  663,  663,  663,  663,  663,
			  663,  663,  663,  663,  663,  663,  883,  883,  663,  663,
			  663,  663,  663,  663,  663,  663,  663,  723,  723,  723,

			  883,  883,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  883,  883,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  738,  738,  738,  738,
			  738,  738,  738,  738,  738,  738,  738,  738,  738,  738,
			  738,  738,  738,  738,  738,  738,  738,  738,  738,  738,
			  883,  883,  883,  738,  738,  738,  883,  883,  738,  738,
			  738,  738,  738,  738,  738,  738,  738,  738,  738,  738,
			  738,  738,  738,  738,  738,  738,  738,  738,  738,  738,
			  738,  883,  883,  738,  738,  738,  738,  738,  738,  738, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  738,  738,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  883,  883,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  807,  807,  807,  883,
			  883,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  807,  807,  807,  807,  807,
			  807,  807,  807,  807,  883,  883,  807,  807,  807,  807,
			  807,  807,  807,  807,  807,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  883,  883,

			  833,  833,  833,  833,  833,  833,  833,  833,  833,  845,
			  845,  845,  883,  883,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  883,  883,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,   13,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883, yy_Dummy>>,
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

			   20,   15,    4,   15,   15,   27,  609,   27,   27,   27,
			   27,   27,   27,   29,   93,   29,   78,   29,   29,   29,
			   29,   29,   29,   40,   40,   59,   40,   60,   84,   59,
			   86,    5,    6,   30,   59,   30,  158,   30,   30,   30,
			   30,   30,   30,   63,    3,   20,   63,   40,  206,    4,
			  860,   11,  859,   59,   12,   60,   29,   59,   76,  609,
			   76,   76,   59,   78,  158,   84,  838,   86,  837,   93,
			   96,   63,   96,   96,   63,  824,   30,  206,    3,    3,
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

			   41,   41,  797,   41,   37,   66,   45,   45,   38,   45,
			  159,  491,  491,   37,   39,   71,   38,   37,   39,   37,
			  807,  807,   65,  160,   41,   66,   65,   39,   42,   42,
			   45,   42,   71,   66,   45,   43,   43,   41,   43,   46,
			   46,   37,   46,   71,   38,   37,   39,   37,   41,   88,
			   44,   44,   42,   44,  166,   39,   42,   47,   47,   43,
			   47,   71,   45,   46,  168,   41,   50,   50,   42,   50,
			   43,  169,   80,  151,   44,   61,   79,   41,  786,   46,
			   61,   47,  166,  228,   42,  172,  228,   47,   44,   44,
			   50,   61,  168,   67,   44,   67,   42,  358,   43,  169,

			   47,   49,   49,   61,   49,   50,   67,   46,   61,  151,
			   50,   51,   51,  172,   51,   47,   44,   44,  753,   82,
			   61,   67,   44,   67,  151,   49,  358,  738,   47,   48,
			   48,  176,   48,   50,   67,   51,   49,  361,   50,  230,
			  177,  794,  230,  723,   49,   48,   48,   48,   48,   48,
			   48,   51,   81,   48,   79,   79,   79,   62,   83,  176,
			   48,   62,   52,   52,   49,   52,  716,   48,  177,   62,
			  117,  117,   49,  117,   48,   64,   48,  219,   48,   51,
			  182,   64,   64,  794,   69,   62,   52,   64,   48,   62,
			   68,   69,   70,   68,  117,   48,   69,   62,   82,   82,

			   70,   68,  495,   64,  438,   48,  188,   48,  182,   64,
			   64,   52,   69,  221,  219,   64,  709,  361,   68,   69,
			   70,   68,  118,  118,   69,  118,  845,  845,   70,   68,
			   81,   81,   81,  438,  188,  118,   83,   83,   83,  190,
			   52,   57,   90,  495,   57,   90,  118,  161,  154,   57,
			  221,  154,  215,  683,   90,   90,  154,   57,   57,   57,
			   57,   57,   57,   57,  192,   90,  161,  190,  682,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,  192,  681,  161,   90,   57,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   58,   91,  433,   58,   91,  433,  181,  680,   58,  656,
			  215,  215,  215,   91,  601,  181,   58,   58,   58,   58,
			   58,   58,   58,  193,   91,  181,  231,  532,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  193,  506,  181,   91,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   94,

			   94,  231,   94,  496,  839,  103,  109,  109,  109,  109,
			  109,  109,  839,  484,  103,  103,  103,  103,  103,  103,
			  247,  223,  247,  247,  223,   94,  478,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  103,  107,  107,  107,  107,  107,  107,  110,  110,  110,
			  110,  110,  110,  183,  173,  103,  183,  107,  196,  103,
			  173,  103,  197,  110,  223,  130,  130,  111,  130,  111,
			   94,  111,  111,  111,  111,  111,  111,  111,  130,  396,
			  107,  183,  173,  372,  183,  107,  196,  130,  173,  130,

			  197,  110,  112,  112,  112,  112,  112,  112,  113,  201,
			  113,  367,  113,  113,  113,  113,  113,  113,  120,  120,
			  111,  120,  121,  121,  352,  121,  122,  122,  327,  122,
			  198,  120,  204,  203,  200,  121,  305,  201,  200,  122,
			  123,  123,  120,  123,  370,  370,  121,  370,  301,  198,
			  122,  113,  203,  123,  261,  124,  124,  122,  124,  121,
			  204,  245,  200,  120,  123,  165,  200,  199,  124,  125,
			  125,  526,  125,  123,  526,  126,  126,  198,  126,  124,
			  203,  244,  125,  165,  165,  122,  199,  121,  126,  129,
			  129,  120,  129,  125,  127,  127,  695,  127,  124,  126,

			  199,  123,  129,  128,  128,  243,  128,  127,  242,  125,
			  164,  165,  165,  129,  199,  240,  128,  800,  127,  126,
			  131,  131,  163,  131,  127,  695,  124,  128,  199,  164,
			  127,  235,  129,  131,  164,  133,  133,  125,  133,  226,
			  128,  163,  132,  132,  131,  132,  800,  126,  133,  209,
			  134,  134,  127,  134,  163,  132,  184,  164,  127,  133,
			  129,  131,  164,  134,  135,  135,  132,  135,  128,  163,
			  137,  137,  132,  137,  134,  132,  180,  135,  136,  136,
			  157,  136,  163,  137,  236,  236,  155,  236,  135,  131,
			  133,  136,  306,  307,  137,  134,  170,  314,  804,  167, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  132,  137,  136,  132,  139,  139,  152,  139,  136,  135,
			  236,  140,  140,  316,  140,  170,  830,  139,  167,  167,
			  306,  307,  150,  134,  140,  314,  170,  804,  139,  137,
			  106,  142,  142,  171,  142,  140,  136,  135,  138,  138,
			  138,  316,  140,  170,  142,  830,  167,  167,  174,  139,
			  147,  147,  171,  147,  170,  142,  140,  138,  140,  105,
			  171,  138,  142,  147,  138,  317,  320,  174,  104,  214,
			  140,  138,  311,  138,  147,  138,  142,  101,  216,  174,
			  171,  179,  147,  371,  371,  138,  371,  140,  171,  138,
			  142,  311,  138,  317,  320,  174,  246,  246,   99,  246,

			  179,   97,  138,   89,  138,  141,  141,  174,  141,  143,
			  147,  179,  143,  143,  143,  143,  143,  143,  141,  311,
			  246,  141,  141,  141,  141,  141,  141,   75,  179,  141,
			   72,  144,  144,  321,  144,  145,  145,   56,  145,  179,
			  141,  143,   53,  141,  144,  143,  178,   36,  145,  141,
			  214,  214,  214,  214,  214,  144,  216,  216,  216,  145,
			  322,  321,  326,  144,   35,  178,  144,   33,  141,   28,
			  178,  141,  146,  146,  143,  146,  331,  141,  175,  148,
			  148,  145,  148,  185,   26,  146,  149,  149,  322,  149,
			  326,  144,  148,  178,  144,  175,  146,  175,  178,  149,

			  332,  175,  185,  148,  331,  333,  363,  186,  146,  145,
			  149,  185,  146,  162,  162,  187,  162,  162,  162,  162,
			  162,  162,  148,  175,  186,  175,  186,  186,  332,  175,
			  185,   18,  162,  333,  187,  149,  146,   17,  613,  185,
			  146,  613,  194,  334,  189,  338,  613,  191,   16,  195,
			  148,   13,  186,  342,  186,  186,  217,  187,  313,  194,
			  162,  194,  187,  189,  149,  156,  191,  195,  195,  218,
			    0,  334,    0,  338,  156,    0,  189,  313,  343,  191,
			    0,  342,    0,    0,  156,  363,  363,  194,    0,  194,
			    0,  189,    0,    0,  191,  195,  195,  241,  241,  241,

			  241,  241,  241,  241,  189,  313,  343,  191,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  202,  205,  207,  217,  217,  217,    0,  318,    0,
			  323,  224,  341,  227,  224,    0,  227,  218,  218,  218,
			  202,  205,  207,  224,  202,  227,  318,  318,  202,  323,
			  346,  341,  205,  347,  224,  250,  227,  250,    0,  207,
			  250,  250,  250,  250,  250,  250,    0,    0,  202,  205,
			  207,    0,  202,    0,  318,  318,  202,  323,  346,  341,
			  205,  347,    0,    0,  224,    0,  227,    0,  207,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  232,  232,    0,  232,  251,  251,  251,  251,  251,

			  251,  252,  252,  252,  252,  252,  252,  257,  257,  257,
			  257,  257,  580,  580,  580,  580,  580,  232,    0,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  249,  249,  249,  249,  249,  249,  254,  254,
			  254,  254,  254,  254,  350,  351,  437,  441,  249,    0,
			  255,    0,  255,    0,  254,  255,  255,  255,  255,  255,
			  255,  256,  232,  256,    0,  256,  256,  256,  256,  256,
			  256,  249,  350,  351,  437,  441,  249,  254,  262,  262,
			    0,  262,  254,  258,  258,  258,  258,  258,  258,  345,

			    0,  262,  263,  263,    0,  263,  264,  264,    0,  264,
			  265,  265,  262,  265,  256,  263,    0,    0,  345,  264,
			  262,    0,    0,  265,  337,  443,  263,    0,  266,  266,
			  264,  266,  267,  267,  265,  267,  268,  268,    0,  268,
			    0,  266,  263,  337,  273,  267,  345,  337,  262,  268,
			  265,    0,  266,  443,    0,  273,  267,    0,  444,  266,
			  268,  269,  269,    0,  269,  273,  270,  270,  268,  270,
			  263,  337,    0,  349,  269,  337,  267,    0,  265,  270,
			  312,  271,  271,  273,  271,  269,  444,  266,  272,  272,
			  270,  272,  349,    0,  271,  448,  268,    0,  269,  312,

			  319,  272,  449,  357,  267,  271,    0,  312,  274,  274,
			  270,  274,  272,    0,  527,  275,  275,  527,  275,  319,
			  349,  274,  357,  448,    0,  271,  269,  312,  275,    0,
			  449,  319,  274,  276,  276,  312,  276,  530,  270,  275,
			  530,  277,  277,  272,  277,  274,  276,  319,  278,  278,
			  357,  278,  275,  271,  277,  279,  279,  276,  279,  319,
			  407,  278,  530,  280,  280,  277,  280,  527,  279,  276,
			  453,  407,  278,  274,  454,  446,  280,  277,  278,  279,
			  275,  407,  456,  281,  281,    0,  281,  280,  282,  282,
			  282,  282,  282,  282,  446,  339,  281,  276,  453,  407,

			  283,  283,  454,  283,    0,  277,  278,  281,    0,  280,
			  456,  457,  339,  283,  339,  281,  283,  283,  283,  283,
			  283,  283,  446,    0,  283,  284,  284,  284,  284,  284,
			  284,  285,  285,  285,  285,  285,  285,  280,    0,  457,
			  339,  528,  339,  281,  528,  283,  286,  286,  286,  286,
			  286,  286,  458,    0,  284,  287,  287,  287,  287,  287,
			  287,  288,  288,  288,  288,  288,  288,  289,  459,  289,
			  290,  290,  290,  290,  290,  290,  427,  463,  291,  291,
			  458,  291,  292,  292,  465,  292,  330,  427,  466,  290,
			  289,  291,    0,  289,  528,  292,  459,  427,  330,  289,

			  293,  293,  291,  293,  329,  463,  292,  294,  294,  330,
			  294,    0,  465,  293,  473,  427,  466,  290,  289,  330,
			  294,  289,  291,  329,  293,  295,  295,  289,  295,  294,
			    0,  294,  296,  296,    0,  296,  796,  330,  295,  293,
			  297,  297,  473,  297,  474,  296,  329,  796,    0,  295,
			  291,  329,  535,  297,    0,    0,  296,  295,  298,  298,
			    0,  298,  299,  299,  297,  299,    0,  293,    0,  537,
			  360,  298,  474,    0,  296,  299,  300,  300,  796,  300,
			  535,    0,  298,  297,    0,  295,  299,    0,  302,  300,
			  302,  302,  302,  302,  302,  302,  302,  537,    0,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  300,  303,  296,  303,  303,  303,  303,  303,  303,  303,
			  538,  297,  309,  298,  309,  309,  309,  309,  309,  309,
			  315,  324,  325,  344,  310,  300,  310,  310,  310,  310,
			  310,  310,  328,  335,  541,    0,  336,    0,  538,  315,
			  324,  325,  344,    0,    0,  324,  348,  315,  360,  360,
			  360,  328,  335,  325,  300,  336,  344,  335,  353,  354,
			  336,    0,  541,  328,  362,  348,  546,  315,  324,  325,
			  344,  355,  348,  324,  364,  315,  359,  353,  354,  328,
			  335,  325,  365,  336,  344,  335,  366,  353,  336,  354,
			  355,  328,  548,  348,  546,  359,  368,  368,  549,  368,

			  348,  373,  373,    0,  373,  353,  354,    0,  368,  805,
			  805,  805,  359,  355,    0,  353,    0,  354,  355,  368,
			  548,    0,  416,  359,  416,    0,  549,  373,  376,  376,
			  376,  376,  376,  376,  376,  382,  382,  382,  382,  382,
			  382,  359,  362,  362,  362,  416,    0,  550,  416,  368,
			  555,  382,  364,  364,  364,  416,  717,  717,  717,  717,
			  365,  365,  365,    0,  366,  366,  366,  383,  383,  383,
			  383,  383,  383,  416,  382,  550,  416,    0,  555,  382,
			  384,  384,  384,  384,  384,  384,  385,  385,  385,  385,
			  385,  385,  386,  386,  386,  386,  386,  386,  387,  387,

			  387,  387,  387,  387,  389,  389,  389,  389,  389,  389,
			  557,  558,  561,  562,  387,  388,    0,  388,    0,  384,
			  388,  388,  388,  388,  388,  388,  390,  390,  390,  390,
			  390,  390,  450,    0,    0,    0,    0,  387,  557,  558,
			  561,  562,  387,  391,  391,  391,  391,  391,  391,  392,
			  392,  450,  392,  392,  392,  392,  392,  392,  393,  393,
			  393,  393,  393,  393,  394,  394,  394,  394,  394,  394,
			  397,  397,  563,  397,  398,  398,    0,  398,  612,  450,
			  455,  612,  391,  397,    0,  439,    0,  398,  399,  399,
			  564,  399,  400,  400,  397,  400,  614,    0,  398,  455,

			  563,  399,    0,  612,  439,  400,  401,  401,    0,  401,
			    0,    0,  399,  397,  471,  439,  400,    0,  564,  401,
			    0,  398,  402,  402,  614,  402,    0,  455,  400,  472,
			  401,  399,  439,  471,  617,  402,  403,  403,  401,  403,
			    0,  397,  475,  439,  404,  404,  402,  404,  472,  403,
			  398,  405,  405,  475,  405,    0,  400,  404,  520,  399,
			  403,  471,  617,    0,  405,  621,  401,    0,  404,  520,
			  475,  406,  406,    0,  406,  405,  472,  408,  408,  520,
			  408,  475,  403,  405,  406,  409,  409,    0,  409,  404,
			  408,  410,  410,  621,  410,  406,    0,  520,  409,  406,

			    0,  408,  479,    0,  410,  411,  411,    0,  411,  409,
			  403,  405,    0,  408,  622,  410,  445,  404,  411,  412,
			  412,  479,  412,  413,  413,  417,  413,  406,  417,  411,
			  410,  409,  412,    0,  417,  445,  413,  414,  414,  445,
			  414,  408,  622,  412,  411,    0,  533,  413,    0,  479,
			  414,    0,    0,  417,  412,    0,  417,    0,  410,  409,
			    0,  414,  417,  445,    0,  533,  413,  445,  719,  719,
			  719,  719,  411,  415,  415,  415,  415,  415,  415,  418,
			  414,  418,  412,  418,  418,  418,  418,  418,  418,  425,
			  425,    0,  425,  533,  413,  419,  419,  419,  419,  419,

			  419,  415,  425,  426,  426,  418,  426,  719,  414,    0,
			    0,  536,  418,  425,  627,    0,  426,  419,    0,  420,
			  420,  420,  420,  420,  420,    0,    0,  426,  419,  415,
			  536,  628,    0,  418,  420,  421,  421,  421,  421,  421,
			  421,  460,  627,  428,  428,  419,  428,    0,  420,  422,
			  422,  422,  422,  422,  422,    0,  428,  419,  536,  628,
			  460,    0,  420,    0,  460,    0,  442,  428,  421,  423,
			  423,  423,  423,  423,  423,  424,  424,  424,  424,  424,
			  424,  429,  429,  542,  429,  442,  430,  430,  460,  430,
			  431,  431,  460,  431,  429,  542,  442,  421,  423,  430,

			  629,    0,    0,  431,  424,  429,  432,  432,    0,  432,
			  430,  542,    0,  442,  431,  630,  634,  430,  431,  432,
			    0,  451,  462,  542,  442,    0,    0,  429,  629,  431,
			  432,  434,  461,  434,  434,  434,  434,  434,  434,  434,
			  451,  462,    0,  630,  634,  430,  431,  440,  462,    0,
			    0,  461,  452,  464,  451,  429,  435,  431,  435,  435,
			  435,  435,  435,  435,  435,  461,  440,  467,  451,  462,
			  434,  452,  464,  476,    0,  464,  462,  468,  494,  461,
			  494,  440,  451,  477,  452,    0,  467,  636,  637,  494,
			  570,  641,  476,  461,  440,  435,  468,  467,  642,  452,

			  464,  477,  477,  464,  540,  643,  476,  468,  497,  497,
			  440,  497,  452,  570,  467,  636,  637,  494,  570,  641,
			  476,  497,  540,  540,  468,  467,  642,    0,    0,  477,
			  477,    0,  497,  643,  476,  468,  480,  480,  480,  480,
			  480,  480,  481,  481,  481,  481,  481,  481,    0,    0,
			  540,  540,  480,  482,  482,  482,  482,  482,  482,  483,
			  483,  483,  483,  483,  483,    0,  485,  485,  485,  485,
			  485,  485,  486,  486,  486,  486,  486,  486,    0,    0,
			  480,  481,  485,  487,  487,  487,  487,  487,  487,  488,
			  488,  488,  488,  488,  488,  489,  489,  489,  489,  489,

			  489,    0,    0,  685,  686,  485,  498,  498,    0,  498,
			  485,  490,  490,  490,  490,  490,  490,  544,  534,  498,
			    0,    0,  487,  492,  492,  492,  492,  492,  492,  653,
			  498,  685,  686,    0,  489,    0,  544,  534,  493,  492,
			  493,  493,  493,  493,  493,  493,  499,  499,  544,  499,
			  500,  500,  653,  500,    0,  501,  501,  653,  501,  499,
			  534,  498,    0,  500,  544,  534,    0,  492,  501,    0,
			  499,  525,  502,  502,  500,  502,  544,    0,  499,  501,
			  503,  503,  525,  503,  592,  502,  501,  504,  504,  500,
			  504,    0,  525,  503,  507,  507,  502,  507,    0,    0,

			  504,  592,  547,  502,  503,  592,  499,  507,  552,  689,
			  525,  504,  503,    0,  501,    0,    0,  500,  507,  505,
			  505,  547,  505,    0,  503,  701,  507,  552,    0,  592,
			  705,  502,  505,  508,  508,    0,  508,  689,  509,  509,
			  503,  509,    0,  505,  554,  706,  508,  510,  510,  547,
			  510,  509,  503,  701,  507,  552,  505,  508,  705,  707,
			  510,    0,  509,  554,  508,  511,  511,  554,  511,  512,
			  512,  510,  512,  706,  509,    0,    0,  556,  511,  734,
			    0,    0,  512,  734,  505,  513,  513,  707,  513,  511,
			    0,  554,  508,  512,  560,  554,  556,  511,  513,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  734,    0,  509,  515,  515,  515,  515,  515,  515,  513,
			    0,  734,  512,  560,    0,  739,    0,  513,  516,  516,
			  516,  516,  516,  516,  556,  511,  517,  517,  517,  517,
			  517,  517,  515,  519,  519,  519,  519,  519,  519,  740,
			  512,  560,  518,  739,  518,  513,  518,  518,  518,  518,
			  518,  518,  539,    0,  517,  519,  521,  521,    0,  521,
			  522,  522,  565,  522,    0,    0,    0,  740,  518,  521,
			    0,  539,    0,  522,  518,  518,  523,  523,  539,  523,
			  521,  565,  517,  519,  522,    0,  543,  742,  521,  523,
			  524,  524,  522,  524,  553,  746,  518,  748,  559,  539,

			  523,  669,  518,  524,  543,  543,  539,  566,  616,  565,
			    0,    0,  553,  553,  524,  742,  521,  559,  669,  523,
			  522,    0,  669,  746,    0,  748,  566,  616,  559,  567,
			  524,  567,  543,  543,  567,  567,  567,  567,  567,  567,
			  553,  553,    0,    0,    0,  559,  669,  523,  568,  568,
			  568,  568,  568,  568,  566,  616,  559,  749,  524,  569,
			  569,  569,  569,  569,  569,  571,  571,  571,  571,  571,
			  571,  572,  572,  572,  572,  572,  572,    0,  775,    0,
			  776,  571,    0,    0,    0,  749,    0,  568,  573,  573,
			  573,  573,  573,  573,  574,  574,  574,  574,  574,  574,

			  575,  575,  575,  575,  575,  575,  775,  620,  776,  571,
			  572,  576,  576,  576,  576,  576,  576,  577,  577,  577,
			  577,  577,  577,  578,    0,  578,  620,    0,  578,  578,
			  578,  578,  578,  578,    0,  774,  774,    0,  774,  575,
			  579,  579,  579,  579,  579,  579,  582,  582,  582,  582,
			  582,  582,  584,  584,  620,  584,    0,  585,  585,  774,
			  585,    0,  582,  619,    0,  584,  606,    0,  607,    0,
			  585,  586,  586,    0,  586,    0,  584,  606,  619,  607,
			  584,  585,  619,    0,  586,  587,  587,  606,  587,  607,
			  582,  588,  588,  780,  588,  586,    0,  676,  587,  586,

			  589,  589,    0,  589,  588,  606,  619,  607,  584,  587,
			  619,  608,    0,  589,  676,  588,  590,  590,  676,  590,
			  783,  780,  608,  588,  589,  591,  591,  586,  591,  590,
			  593,  593,  608,  593,  594,  594,  799,  594,  591,  589,
			  590,    0,  676,  593,  802,    0,    0,  594,  783,  591,
			  608,  588,  595,  595,  593,  595,  596,  596,  594,  596,
			  597,  597,  591,  597,  799,  595,  594,  589,    0,  596,
			    0,  815,  802,  597,  593,    0,  595,  624,    0,  626,
			  596,    0,  598,  598,  597,  598,    0,    0,  820,    0,
			  591,    0,  597,    0,  594,  598,  624,  595,  626,  815,

			  596,    0,  593,  599,  625,  599,  598,  599,  599,  599,
			  599,  599,  599,  598,  602,  602,  820,  602,  603,  603,
			  597,  603,  730,  625,  624,  595,  626,  602,  596,  631,
			  625,  603,  604,  604,  632,  604,  599,    0,  602,  730,
			  831,  598,  603,  730,  635,  604,  605,  605,  631,  605,
			  633,  625,  638,  632,  639,  644,  604,  812,  625,  605,
			  631,  603,  604,  635,  645,  812,    0,  730,  831,  633,
			  605,  638,  639,  639,  644,  635,  631,  605,  812,  840,
			    0,  632,  633,  645,    0,    0,    0,    0,  631,  603,
			  604,  635,  850,  812,  645,  666,  666,  633,  666,  638,

			  639,  639,  644,  635,    0,  605,    0,  840,  666,    0,
			  633,  645,  646,  646,  646,  646,  646,  646,    0,  666,
			  850,    0,  645,  647,  647,  647,  647,  647,  647,  648,
			  648,  648,  648,  648,  648,  649,    0,  649,    0,    0,
			  649,  649,  649,  649,  649,  649,  650,    0,  650,    0,
			    0,  650,  650,  650,  650,  650,  650,  651,  651,  651,
			  651,  651,  651,  652,  652,  652,  652,  652,  652,  654,
			  654,  654,  654,  654,  654,  655,  655,  655,  655,  655,
			  655,  657,  657,  657,  657,  657,  657,  658,  658,  658,
			  658,  658,  658,    0,    0,    0,  651,  659,  659,  659,

			  659,  659,  659,  661,  661,  661,  661,  661,  661,    0,
			    0,    0,    0,  664,  664,  662,  664,  662,    0,  661,
			  662,  662,  662,  662,  662,  662,  664,  665,  665,    0,
			  665,  667,  667,    0,  667,  668,  668,  664,  668,    0,
			  665,    0,  661,    0,  667,    0,  690,  661,  668,  670,
			  670,  665,  670,    0,    0,  667,  664,  671,  671,  668,
			  671,  667,  670,    0,  665,  690,  672,  672,    0,  672,
			  671,    0,  696,  670,  673,  673,    0,  673,    0,  672,
			    0,  671,  674,  674,  664,  674,    0,  673,    0,  667,
			  672,  696,  665,  690,    0,  674,  675,  675,  673,  675,

			  677,  677,    0,  677,  678,  678,  674,  678,  697,  675,
			  687,  698,    0,  677,  691,  672,    0,  678,  700,  696,
			  675,  674,  679,  679,  677,  679,  703,  697,  678,  687,
			  698,  691,  677,  691,  687,  679,    0,  700,    0,  678,
			  728,  728,    0,  728,  672,  703,  679,  698,    0,  674,
			  704,  708,  703,  728,  679,  697,    0,  687,  698,  691,
			  677,  691,  687,    0,  728,  700,    0,  678,    0,  704,
			  708,    0,    0,  703,    0,    0,  698,    0,    0,    0,
			  703,    0,  679,  710,  710,  710,  710,  710,  710,  711,
			  711,  711,  711,  711,  711,    0,    0,  704,  708,  712,

			  712,  712,  712,  712,  712,  713,  713,  713,  713,  713,
			  713,  714,  714,  714,  714,  714,  714,  715,    0,  715,
			    0,    0,  715,  715,  715,  715,  715,  715,  711,  718,
			  718,  718,  718,  718,  718,  720,  720,  720,  720,  720,
			  720,  721,  721,  721,  721,  721,  721,  724,  724,    0,
			  724,  720,  722,  722,  722,  722,  722,  722,    0,  813,
			  724,    0,  725,  725,    0,  725,    0,  813,    0,  726,
			  726,  724,  726,    0,  720,  725,    0,  724,    0,  720,
			  813,    0,  726,    0,  729,  729,  725,  729,    0,  731,
			  731,  722,  731,  726,    0,  813,  735,  729,  725,    0,

			  735,  726,  731,  732,  732,  724,  732,    0,  729,  733,
			  733,  736,  733,  731,  729,  736,  732,  735,  741,  737,
			  731,    0,  733,  737,    0,  743,  725,  732,  735,  726,
			  745,    0,  736,  733,    0,  732,  747,  741,  751,  827,
			  737,  741,  729,  736,  743,    0,  770,  827,  731,  745,
			  770,  737,    0,  747,    0,  747,  751,  751,  765,  765,
			  827,  765,    0,  732,    0,  741,    0,  770,    0,  741,
			    0,  765,  743,    0,    0,  827,    0,  745,  770,    0,
			    0,  747,  765,  747,  751,  751,  752,  752,  752,  752,
			  752,  752,  754,  754,  754,  754,  754,  754,  755,  755, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  755,  755,  755,  755,  756,  756,  756,  756,  756,  756,
			  757,  757,  757,  757,  757,  757,  758,  758,  758,  758,
			  758,  758,    0,    0,    0,  752,  759,  759,  759,  759,
			  759,  759,  763,  763,    0,  763,    0,  755,  761,  761,
			  761,  761,  761,  761,    0,  763,  764,  764,  771,  764,
			  766,  766,  771,  766,    0,    0,  763,  779,  772,  764,
			  773,    0,  772,  766,  773,  768,  768,  763,  768,  771,
			  764,    0,  769,  769,  766,  769,  779,  761,  768,  772,
			  771,  773,  766,  777,  781,  769,  784,  848,    0,  768,
			  772,  764,  773,  801,  817,  763,  769,    0,  848,  819,

			    0,    0,  777,  781,  779,  784,    0,    0,  848,    0,
			  766,    0,  801,  817,    0,  777,    0,  769,  819,  764,
			  785,  785,  785,  785,  785,  785,  848,    0,    0,  801,
			  777,  781,    0,  784,  787,  787,  787,  787,  787,  787,
			  801,  817,  788,  777,  788,  769,  819,  788,  788,  788,
			  788,  788,  788,  790,  790,  803,  790,    0,  801,  785,
			  791,  791,    0,  791,    0,    0,  790,  792,  792,    0,
			  792,    0,    0,  791,  803,  793,  793,  790,  793,  849,
			  792,  788,    0,    0,  791,  790,  803,    0,  793,    0,
			  849,  792,  806,  806,  806,  806,  806,  806,    0,  793,

			  849,    0,  803,  808,  808,    0,  808,  809,  809,  791,
			  809,  792,    0,  790,  803,  814,  808,    0,  849,    0,
			  809,    0,  810,  810,  793,  810,  828,  808,  814,    0,
			    0,  809,    0,    0,  828,  810,  814,    0,  791,  792,
			    0,  811,  811,    0,  811,    0,  810,  828,  808,  814,
			  832,    0,  832,  793,  811,  821,  821,  821,  821,  821,
			  821,  832,  828,    0,  814,  811,  822,  822,  822,  822,
			  822,  822,  825,  825,  829,  825,  808,  826,  826,    0,
			  826,  858,  811,  858,    0,  825,  854,  829,    0,  832,
			  826,    0,  858,    0,    0,  829,  825,  854,    0,    0,

			    0,  826,  834,  834,  834,  834,  834,  854,  829,  826,
			  811,  835,  835,    0,  835,  836,  836,    0,  836,    0,
			  858,  825,    0,  829,  835,  854,    0,    0,  836,  842,
			  842,  842,  842,  842,  842,  835,    0,  826,    0,  836,
			  843,  843,  843,  843,  843,    0,  847,  847,    0,  847,
			  825,    0,  835,  846,  846,  846,  846,  846,  846,  847,
			  851,  851,  851,  851,  851,  851,  853,  853,    0,  853,
			  847,  852,  852,  852,  852,  852,  852,  855,  847,  853,
			  835,  857,  857,  857,  857,  857,  857,    0,  855,    0,
			  853,  861,  861,  861,  861,  861,  861,  865,  855,  862,

			  862,  862,  862,  862,  862,  866,  847,  863,  863,  863,
			  863,  863,    0,    0,  865,    0,  855,    0,  865,    0,
			    0,    0,  866,  869,  870,    0,  866,  867,  867,  867,
			  867,  867,  867,  868,  868,  868,  868,  868,  868,    0,
			  869,  870,  865,    0,  869,  870,  872,  872,  872,  872,
			  866,  871,  871,  871,  871,  871,  871,  875,  875,  875,
			  875,  875,  875,    0,    0,    0,    0,    0,  869,  870,
			  876,  876,  876,  876,  876,  876,  877,  877,  877,  877,
			  877,  877,    0,    0,    0,  872,  879,  879,  879,  879,
			  879,  879,  880,    0,  880,    0,    0,  880,  880,  880,

			  880,  880,  880,  881,  881,  881,  881,  881,  881,  882,
			  882,  882,  882,  882,  882,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  880,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  884,  884,  884,  884,  884,  884,  884,
			  884,  884,  884,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,

			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  885,  885,  885,  885,  885,  885,
			  885,  885,  885,  885,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  886,  886,  886,  886,  886,
			  886,  886,  886,  886,  886,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,

			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  888,  888,    0,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,    0,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  889,  889,    0,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,

			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  891,  891,  891,    0,    0,    0,    0,    0,    0,
			  891,  891,  891,  891,    0,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,    0,    0,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  892,
			  892,    0,  892,  892,  892,  892,  892,    0,    0,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,    0,    0,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  893,  893,    0,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  893,  893,  893,  893,  894,  894,    0,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,    0,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,

			  895,  895,  895,  895,  895,  895,  896,    0,  896,    0,
			    0,    0,    0,  896,  896,  896,  896,  896,    0,    0,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,    0,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,

			  897,  897,  897,  897,  897,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  899,  899,    0,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  900,    0,    0,
			    0,  900,  900,  900,    0,    0,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,    0,
			    0,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,

			  901,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			    0,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  903,    0,    0,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,    0,    0,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  904,  904,  904,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  904,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,    0,    0,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,

			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  907,  907,
			  907,    0,    0,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,    0,    0,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  908,    0,  908,
			    0,    0,    0,    0,  908,  908,  908,  908,  908,    0,
			    0,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,

			  908,  908,  908,  908,    0,    0,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  909,  909,  909,    0,    0,
			  909,  909,  909,  909,  909,  909,  909,  909,    0,    0,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,    0,    0,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  910,    0,  910,    0,    0,    0,
			    0,  910,  910,  910,  910,  910,    0,    0,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,

			  910,    0,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,    0,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,    0,    0,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  913,  913,  913,

			    0,    0,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,    0,    0,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  915,
			    0,    0,    0,  915,  915,  915,    0,    0,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,    0,    0,  915,  915,  915,  915,  915,  915,  915, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  915,  915,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,    0,    0,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  917,  917,  917,    0,
			    0,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,    0,    0,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,    0,    0,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  919,
			  919,  919,    0,    0,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,    0,    0,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883, yy_Dummy>>,
			1, 241, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   78,    0,    0,  187,
			    0,   68,   71, 1251, 6148,   99, 1245, 1210, 1224, 6148,
			   91,    0, 6148, 6148, 6148, 6148, 1169,   89, 1152,   99,
			  119, 6148, 6148, 1140, 6148, 1137, 1118,  278,  282,  288,
			  121,  298,  326,  333,  348,  304,  337,  355,  427,  399,
			  364,  409,  460, 1084, 6148, 6148, 1081,  539,  618,   95,
			   93,  341,  427,  109,  441,  264,  263,  361,  456,  450,
			  458,  281, 1113, 6148, 6148, 1120,  156, 6148,  109,  369,
			  285,  445,  412,  451,  111, 6148,  113, 6148,  294, 1100,
			  540,  619, 6148,   86,  697, 6148,  168, 1098, 6148, 1091,

			 6148, 1068,    0,  696, 1057, 1056, 1014,  733, 6148,  688,
			  739,  763,  784,  794, 6148, 6148, 6148,  468,  520,    0,
			  816,  820,  824,  838,  853,  867,  873,  892,  901,  887,
			  773,  918,  940,  933,  948,  962,  976,  968, 1024, 1002,
			 1009, 1103, 1029, 1094, 1129, 1133, 1170, 1048, 1177, 1184,
			  998,  349,  950, 6148,  546,  975, 1250,  963,   89,  243,
			  262,  532, 1198,  907,  895,  850,  319,  984,  319,  329,
			  981, 1018,  339,  732, 1033, 1163,  392,  395, 1131, 1066,
			  952,  611,  437,  731,  899, 1168, 1192, 1200,  459, 1229,
			  492, 1232,  532,  610, 1227, 1234,  734,  724,  815,  852,

			  796,  775, 1316,  818,  787, 1317,   97, 1318, 6148,  942,
			 6148,  284, 6148, 6148, 1062,  545, 1071, 1249, 1262,  460,
			 6148,  496, 6148,  719, 1339, 6148,  936, 1341,  381, 1398,
			  437,  618, 1489, 6148, 6148,  903,  982, 6148, 6148, 6148,
			  906, 1280,  899,  896,  872,  852, 1094,  718, 6148, 1524,
			 1352, 1477, 1483, 6148, 1530, 1547, 1557, 1489, 1575, 6148,
			    0,  826, 1586, 1600, 1604, 1608, 1626, 1630, 1634, 1659,
			 1664, 1679, 1686, 1615, 1706, 1713, 1731, 1739, 1746, 1753,
			 1761, 1781, 1770, 1798, 1807, 1813, 1828, 1837, 1843, 1853,
			 1852, 1876, 1880, 1898, 1905, 1923, 1930, 1938, 1956, 1960,

			 1974,  824, 1972, 1985, 6148,  819,  958,  951,    0, 1996,
			 2008, 1057, 1665, 1243,  955, 2005,  980, 1019, 1323, 1685,
			 1032, 1094, 1114, 1325, 2006, 2007, 1116,  771, 2017, 1889,
			 1869, 1137, 1161, 1167, 1205, 2018, 2021, 1609, 1213, 1780,
			    0, 1327, 1205, 1244, 2008, 1584, 1319, 1329, 2031, 1658,
			 1510, 1510,  767, 2043, 2044, 2056,    0, 1688,  346, 2061,
			 1963,  430, 2057, 1199, 2067, 2075, 2079,  808, 2094, 6148,
			  842, 1081,  790, 2099, 6148, 6148, 2111, 6148, 6148, 6148,
			 6148, 6148, 2117, 2149, 2162, 2168, 2174, 2180, 2202, 2186,
			 2208, 2225, 2234, 2240, 2246,    0,  761, 2268, 2272, 2286,

			 2290, 2304, 2320, 2334, 2342, 2349, 2369, 1731, 2375, 2383,
			 2389, 2403, 2417, 2421, 2435, 2455, 2108, 2388, 2465, 2477,
			 2501, 2517, 2531, 2551, 2557, 2487, 2501, 1847, 2541, 2579,
			 2584, 2588, 2604,  620, 2615, 2640,    0, 1511,  455, 2270,
			 2632, 1512, 2551, 1587, 1624, 2401, 1760,    0, 1647, 1655,
			 2217, 2606, 2637, 1736, 1744, 2265, 1744, 1763, 1811, 1827,
			 2526, 2617, 2607, 1840, 2638, 1839, 1843, 2652, 2662,    0,
			    0, 2299, 2314, 1866, 1911, 2312, 2658, 2668,  711, 2387,
			 2718, 2724, 2735, 2741,  699, 2748, 2754, 2765, 2771, 2777,
			 2793,  293, 2805, 2822, 2665,  486,  688, 2706, 2804, 2844,

			 2848, 2853, 2870, 2878, 2885, 2917,  648, 2892, 2931, 2936,
			 2945, 2963, 2967, 2983, 6148, 2985, 3000, 3008, 3028, 3015,
			 2329, 3054, 3058, 3074, 3088, 2842,  869, 1712, 1839, 6148,
			 1735,    0,  590, 2431, 2803, 1918, 2496, 1928, 1977, 3037,
			 2689, 2001, 2549, 3071, 2802,    0, 2027, 2887, 2058, 2065,
			 2109,    0, 2893, 3079, 2929, 2116, 2962, 2165, 2177, 3083,
			 2979, 2178, 2179, 2227, 2248, 3047, 3092, 3116, 3130, 3141,
			 2656, 3147, 3153, 3170, 3176, 3182, 3193, 3199, 3210, 3222,
			 1494, 6148, 3228,    0, 3250, 3255, 3269, 3283, 3289, 3298,
			 3314, 3323, 2855, 3328, 3332, 3350, 3354, 3358, 3380, 3389,

			 6148,  610, 3412, 3416, 3430, 3444, 3237, 3239, 3282,  104,
			 6148, 6148, 2276, 1236, 2266,    0, 3093, 2304,    0, 3248,
			 3192, 2331, 2373,    0, 3362, 3389, 3364, 2475, 2485, 2566,
			 2568, 3414, 3419, 3435, 2570, 3429, 2653, 2655, 3437, 3439,
			    0, 2646, 2666, 2672, 3440, 3449, 3494, 3505, 3511, 3522,
			 3533, 3539, 3545, 2795, 3551, 3557,  614, 3563, 3569, 3579,
			 6148, 3585, 3602,    0, 3611, 3625, 3493, 3629, 3633, 3072,
			 3647, 3655, 3664, 3672, 3680, 3694, 3268, 3698, 3702, 3720,
			  612,  578,  553,  538,    0, 2758, 2765, 3695,    0, 2877,
			 3631, 3699,    0,    0,    0,  845, 3657, 3693, 3696,    0,

			 3703, 2884,    0, 3711, 3735, 2896, 2908, 2925, 3736,  459,
			 3765, 3771, 3781, 3787, 3793, 3804,  409, 2138, 3811, 2455,
			 3817, 3823, 3834,  427, 3845, 3860, 3867, 6148, 3738, 3882,
			 3393, 3887, 3901, 3907, 2950, 3867, 3882, 3890,  416, 2983,
			 3001, 3903, 3053, 3910,    0, 3915, 3063, 3921, 3064, 3123,
			    0, 3923, 3968,  361, 3974, 3980, 3986, 3992, 3998, 4008,
			 6148, 4020,    0, 4030, 4044, 3956, 4048, 6148, 4063, 4070,
			 3917, 4019, 4029, 4031, 3233, 3141, 3133, 4068,    0, 4042,
			 3259, 4069,    0, 3273, 4071, 4102,  331, 4116, 4129,    0,
			 4151, 4158, 4165, 4173,  436, 6148, 1931,  286, 6148, 3302,

			  866, 4078, 3298, 4140,  947, 2091, 4174,  305, 4201, 4205,
			 4220, 4239, 3428, 3830, 4199, 3324,    0, 4079,    0, 4084,
			 3345, 4237, 4248,    0,   98, 4270, 4275, 3910, 4197, 4258,
			  965, 3406, 4237,    0, 4283, 4309, 4313,  144,  142,  688,
			 3436,    0, 4311, 4322, 6148,  511, 4335, 4344, 4058, 4150,
			 3458, 4342, 4353, 4364, 4257, 4348,    0, 4363, 4268,  128,
			  126, 4373, 4381, 4389, 6148, 4368, 4376, 4409, 4415, 4394,
			 4395, 4433, 4433, 6148, 6148, 4439, 4452, 4458, 6148, 4468,
			 4479, 4485, 4491, 6148, 4531, 4582, 4633, 4684, 4735, 4786,
			 4822, 4859, 4903, 4952, 5003, 5054, 5104, 5153, 5204, 5255,

			 5300, 5349, 5400, 5444, 5492, 5527, 5576, 5617, 5665, 5714,
			 5762, 5811, 5847, 5886, 5920, 5952, 5986, 6025, 6059, 6098, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  883,    1,  884,  884,  885,  885,  886,  886,  883,
			    9,  887,  887,  883,  883,  883,  883,  883,  888,  883,
			  889,  890,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  892,  883,  883,  893,  883,  883,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  883,  883,  883,  894,  883,  883,  883,  894,
			  894,  894,  894,  894,  895,  883,  895,  883,  896,  883,
			  896,  896,  883,  897,  898,  883,  883,  883,  883,  888,

			  883,  899,  899,  899,  900,  901,  883,  883,  883,  883,
			  902,  883,  883,  883,  883,  883,  883,  883,  891,  903,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,   48,  891,
			  891,  891,  891,   48,  891,  891,  891,  891,  891,  891,
			  892,  892,  893,  883,  883,  883,   58,  883,  156,  156,
			  156,   58,   58,   58,   58,   58,  156,   58,  156,  156,
			   58,   58,  156,  156,   58,   58,  156,  156,   58,   58,
			  156,   58,  156,  156,  156,   58,   58,   58,  156,   58,
			  156,   58,  156,  156,   58,   58,  156,  156,   58,   58,

			  156,  156,   58,   58,  156,   58,  156,   58,  883,  894,
			  883,  883,  883,  883,  894,  894,  894,  894,  894,  895,
			  883,  895,  883,  896,  896,  883,  883,  883,  883,  883,
			  883,  897,  898,  883,  883,  232,  904,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  905,  903,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  883,  891,  891,  891,  891,  891,  891,
			  891,  891,  883,  891,  283,  283,  283,  283,  141,  141,
			  141,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  883,  892,  892,  883,  883,  156,  156,  156,  883,
			  156,   58,   58,   58,  156,   58,  156,  156,   58,   58,
			  156,  156,  156,   58,   58,   58,  156,  156,   58,   58,
			  883,  156,  156,  156,  156,   58,   58,   58,  156,   58,
			  156,   58,  156,  156,   58,   58,  156,  156,   58,   58,
			  156,  156,  156,   58,   58,   58,  156,   58,  156,   58,
			  894,  894,  894,  894,  894,  894,  894,  906,  906,  883,
			  906,  906,  906,  904,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  907,  903,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  883,  891,  891,
			  891,  891,  891,  891,  891,  883,  283,  141,  283,  138,
			  283,  138,  883,  283,  283,  891,  891,  883,  891,  891,
			  891,  891,  891,  908,  892,  892,  909,  156,  156,   58,
			   58,  156,   58,  156,  156,   58,   58,  156,  156,  156,
			   58,   58,   58,  156,  156,   58,  156,  156,  156,  156,
			   58,   58,   58,  156,   58,  156,  156,   58,   58,  156,
			  156,   58,   58,  156,  156,  156,   58,   58,  156,   58,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  902,  883,  883,  883,  907,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  883,  891,  891,  891,
			  891,  891,  891,  891,  883,  283,  283,  883,  283,  518,
			  883,  891,  891,  891,  891,  905,  883,  910,  908,  883,
			  883,  156,  156,   58,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,   58,   58,  156,  156,   58,  156,  156,
			  156,  156,   58,   58,   58,  156,   58,  156,  156,   58,
			   58,  156,  156,  156,  156,   58,   58,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  911,  912,  891,  891,  891,  891,  891,  891,
			  891,  891,  883,  891,  891,  891,  891,  891,  891,  283,

			  883,  883,  891,  891,  891,  891,  883,  907,  907,  910,
			  883,  883,  883,  883,  156,  156,   58,  156,  156,   58,
			   58,  156,  156,  156,   58,   58,   58,  156,  156,  156,
			  156,   58,   58,   58,  156,   58,  156,  156,   58,   58,
			  156,  156,  156,  156,   58,   58,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  913,  891,  891,  891,  891,  891,  883,
			  891,  891,  891,  891,  891,  891,  883,  891,  891,  891,
			  883,  883,  907,  907,  914,  156,  156,   58,  156,  156,
			   58,   58,  156,  156,  156,  156,   58,   58,   58,  156,

			   58,  156,  156,   58,   58,  156,  156,  156,   58,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  913,  891,  891,  891,  883,  891,  891,
			  883,  891,  891,  891,  883,  883,  912,  912,  915,  156,
			  156,   58,  156,   58,  156,   58,  156,   58,  156,  156,
			  156,   58,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  916,  891,  891,  891,  891,  883,  891,  891,
			  883,  883,  913,  913,  883,  156,  156,   58,  156,   58,
			  156,   58,  156,  156,   58,  883,  883,  883,  883,  917,
			  891,  891,  891,  891,  883,  883,  913,  913,  883,  156,

			  156,   58,  156,   58,  156,  883,  883,  917,  891,  891,
			  891,  891,  883,  883,  913,  156,  156,   58,  156,   58,
			  156,  883,  883,  918,  883,  891,  891,  883,  883,  913,
			  156,  156,  883,  919,  883,  891,  891,  883,  883,  913,
			  156,  156,  883,  883,  883,  919,  883,  891,  883,  883,
			  156,  883,  883,  891,  883,  883,  156,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,    0,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883, yy_Dummy>>)
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
			  119,  119,  119,  119,  132,  104,  132,  132,  132,   70,
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
			  104,    0,  103,    0,    0,   72,   70,    0,   69,    0,
			   68,    0,    0,   97,   95,   95,    0,   96,  129,  123,
			  129,  129,  129,  129,  129,  129,    0,    4,   34,  110,
			    0,    0,    0,  108,  110,  108,  106,    0,    0,   92,
			    0,    0,   98,   98,   39,   98,   98,   98,   98,   98,
			   98,   98,   98,    0,   98,   98,   98,   98,   98,   42,
			   98,   98,    0,   83,   84,   83,   83,   83,   90,   98,
			   90,   90,   90,   98,   98,   98,   98,   98,   98,   41,

			   98,    0,    0,    0,  100,    0,  101,  101,   39,   73,
			   73,  101,  101,   39,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			    0,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			   42,   42,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,   41,   41,  101,  101,
			  119,  119,  119,  119,  119,  119,  119,    0,    0,   71,
			   69,   68,   72,    0,  127,  130,  130,  128,  124,  125,
			  126,   93,  110,    0,  110,    0,    0,  110,    0,    0,
			    0,  109,  106,    0,    0,    0,   99,   98,   98,   98,

			   98,   98,   38,   98,   98,   98,   98,    0,   98,   98,
			   98,   98,   98,   98,   98,    0,   98,   82,   98,   98,
			   98,   98,    0,   82,   82,   82,   37,    0,   44,   98,
			   98,   98,   98,   67,    0,    0,   63,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,   38,  101,  101,
			   38,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,   37,
			   44,   37,   44,  101,  101,  101,  101,  101,  101,  101,
			  110,  110,    0,    0,  107,  110,    0,  109,    0,  109,
			    0,    0,    0,  106,   79,    0,    0,   60,   98,   98,

			   98,   98,   98,   98,   45,   98,    0,   98,   98,   98,
			   36,   98,   98,   98,   84,   84,   83,    0,   98,   98,
			    0,   98,   98,   98,   98,    0,   67,   67,    0,   66,
			   66,   60,  101,   60,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,   45,  101,   45,  101,  101,
			  101,   36,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,    0,  110,    0,
			  113,  110,  109,    0,    0,  109,    0,    0,  108,    0,
			    0,   79,    0,    0,   98,   61,   98,   62,   98,   98,
			   47,   98,    0,   98,   98,   98,   98,   98,   98,   98,

			   82,    0,   53,   98,   98,   98,    0,    0,    0,    0,
			   65,   64,    0,    0,  101,   61,   61,  101,   62,  101,
			   62,  101,  101,   47,  101,  101,   47,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			   53,  101,  101,  101,   53,  101,    0,  110,    0,    0,
			    0,  109,    0,  113,  109,    0,   81,    0,    0,    0,
			  111,  113,  111,    0,   98,   98,   59,   98,   46,    0,
			   43,   58,   98,   35,   98,   51,    0,   98,   98,   98,
			    0,    0,    0,    0,    0,  101,  101,  101,   59,  101,
			   59,  101,   46,   43,   58,  101,   43,   58,  101,   35,

			   35,  101,   51,  101,   51,  101,  101,  101,  101,  113,
			    0,  113,    0,  109,    0,    0,  112,    0,    0,   78,
			  113,    0,  112,    0,   98,   98,   98,   87,   54,   98,
			    0,   98,   98,   55,    0,    0,    0,    0,    0,  101,
			  101,  101,  101,  101,   54,   54,  101,  101,  101,  101,
			   55,  101,  113,  112,    0,  112,    0,    0,    0,    0,
			   78,  112,    0,   98,   98,   48,   98,   86,   52,   98,
			    0,    0,    0,    0,    0,  101,  101,  101,   48,   48,
			  101,  101,   52,  101,   52,  112,   80,    0,   78,    0,
			   98,   98,   98,   98,   85,   85,   85,   85,   94,  101,

			  101,  101,  101,  101,  101,    0,    0,    0,   98,   50,
			   49,   98,    0,    0,    0,  101,   50,   50,   49,   49,
			  101,    0,    0,    0,    0,   98,   98,    0,    0,    0,
			  101,  101,   77,    0,    0,   98,   56,    0,    0,    0,
			  101,   56,    0,    0,   77,    0,   74,   98,    0,    0,
			  101,    0,    0,   57,    0,    0,   57,    0,   76,    0,
			    0,    0,    0,    0,   76,    0,    0,    0,    0,    0,
			    0,    0,   75,   88,   89,    0,    0,    0,   75,    0,
			   75,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6148
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 883
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 884
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
