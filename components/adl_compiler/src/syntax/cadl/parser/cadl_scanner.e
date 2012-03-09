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
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
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
if yy_act <= 106 then
if yy_act = 105 then
--|#line 510 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 510")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 517 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 517")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 107 then
--|#line 522 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 522")
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
--|#line 537 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 537")
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
--|#line 538 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 538")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 539 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 539")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 111 then
	yy_end := yy_end - 1
--|#line 543 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 543")
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
--|#line 544 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 544")
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
--|#line 545 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 545")
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
--|#line 565 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 565")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 115 then
--|#line 570 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 570")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 578 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 578")
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
--|#line 580 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 580")
end
in_buffer.append_character ('"')
else
--|#line 582 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 582")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 119 then
--|#line 586 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 586")
end
in_buffer.append_string (text)
else
--|#line 588 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 588")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
--|#line 593 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 593")
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
--|#line 604 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 604")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 123 then
--|#line 613 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 613")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 615 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 615")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 616 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 616")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 617 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 617")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 127 then
--|#line 618 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 618")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 619 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 619")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 621 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 621")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 622 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 622")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 131 then
--|#line 626 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 626")
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
			create an_array.make (0, 6314)
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

			  103,   97,   77,   97,   97,  107,  887,  108,  108,  108,
			  108,  108,  108,  110,  235,  111,  304,  112,  112,  112,
			  112,  112,  112,  118,  118,  169,  118,  157,  213,  157,
			  309,   86,   86,  110,  170,  111,  310,  114,  114,  114,
			  114,  114,  114,  157,   78,  104,  181,  120,  361,   78,
			  870,   96,  305,  171,   96,  162,  113,  162,  309,  614,
			   87,   87,  172,  212,  310,  212,  212,  306,  869,  236,
			   97,  162,   97,   97,  182,  214,  113,  361,   79,   80,
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
			  118,  118,  311,  118,  118,  118,  212,  118,  212,  212,
			  118,  118,  211,  118,  189,  853,  231,  157,  157,  231,

			  118,  118,  852,  118,  120,  191,  118,  118,  120,  118,
			  311,  838,  221,  121,  120,  157,  124,  122,  125,  123,
			  226,  766,  190,  226,  120,  162,  162,  126,  118,  118,
			  120,  118,  207,  192,  135,  118,  118,  127,  118,  118,
			  118,  121,  118,  162,  124,  122,  125,  123,  128,  222,
			  118,  118,  120,  118,  317,  126,  129,  118,  118,  120,
			  118,  208,  135,  120,  319,  127,  118,  118,  130,  118,
			  131,  320,  216,  228,  120,  157,  211,  128,  223,  136,
			  173,  120,  317,  233,  129,  323,  233,  137,  132,  133,
			  120,  174,  319,  193,  134,  157,  130,  809,  131,  320,

			  138,  118,  118,  162,  118,  147,  194,  136,  175,  329,
			  148,  118,  118,  323,  118,  137,  132,  133,  577,  211,
			  176,  195,  134,  162,  250,  120,  250,  250,  138,  118,
			  118,  330,  118,  147,  196,  120,  145,  329,  148,  482,
			  224,  581,  581,  778,  146,  139,  139,  139,  139,  139,
			  139,  149,  211,  120,  215,  215,  215,  177,  211,  330,
			  140,  157,  118,  118,  145,  118,  766,  141,  482,  178,
			  118,  118,  146,  118,  142,  157,  143,  222,  144,  149,
			  334,  183,  184,  494,  157,  179,  120,  185,  140,  162,
			  157,  201,  157,  197,  262,  141,  202,  180,  218,  218,

			  205,  198,  586,  162,  536,  143,  223,  144,  334,  186,
			  187,  150,  162,  370,  530,  188,  486,  531,  162,  203,
			  162,  199,  118,  118,  204,  118,  816,  741,  206,  200,
			  217,  217,  217,  536,  740,  263,  219,  219,  219,  341,
			  150,  155,  230,  113,  155,  230,  120,  263,  155,  156,
			  225,  155,  211,  739,  231,  232,  156,  157,  157,  157,
			  157,  157,  157,  158,  343,  233,  157,  341,  817,  157,
			  157,  157,  157,  157,  159,  157,  157,  157,  160,  157,
			  161,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  343,  738,  162,  228,  157,  162,  162,  163,

			  162,  162,  164,  162,  162,  162,  165,  162,  166,  162,
			  162,  162,  162,  162,  163,  162,  162,  162,  162,  162,
			  155,  230,  530,  155,  230,  530,  263,  721,  156,  680,
			  215,  215,  215,  231,  618,  333,  157,  157,  157,  157,
			  157,  157,  158,  345,  233,  157,  235,  596,  157,  157,
			  157,  157,  167,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  345,  587,  162,  228,  157,  162,  162,  162,  162,
			  168,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  238,

			  238,  236,  238,  827,  828,  243,  255,  255,  255,  255,
			  255,  255,  766,  211,  244,  244,  244,  244,  244,  244,
			  853,  226,  827,  828,  226,  239,  110,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  245,  252,  252,  252,  252,  252,  252,  257,  257,  257,
			  257,  257,  257,  335,  324,  246,  336,  253,  346,  247,
			  325,  248,  349,  258,  228,  118,  118,  110,  118,  111,
			  240,  259,  259,  259,  259,  259,  259,  260,  263,  529,
			  254,  335,  324,  216,  336,  253,  346,  276,  325,  120,

			  349,  258,  261,  261,  261,  261,  261,  261,  110,  350,
			  111,  400,  259,  259,  259,  259,  259,  259,  118,  118,
			  113,  118,  118,  118,  355,  118,  118,  118,  373,  118,
			  263,  263,  359,  373,  353,  263,  479,  350,  354,  263,
			  118,  118,  120,  118,  374,  373,  120,  374,  458,  349,
			  120,  113,  355,  263,  440,  118,  118,  267,  118,  266,
			  359,  263,  353,  265,  120,  263,  354,  263,  263,  118,
			  118,  616,  118,  268,  616,  118,  118,  351,  118,  120,
			  355,  437,  263,  311,  157,  267,  157,  266,  263,  118,
			  118,  265,  118,  120,  118,  118,  617,  118,  269,  120,

			  350,  268,  263,  118,  118,  400,  118,  263,  358,  270,
			  263,  316,  162,  120,  162,  384,  263,  748,  120,  271,
			  118,  118,  263,  118,  272,  383,  269,  120,  352,  157,
			  273,  382,  275,  263,  310,  118,  118,  270,  118,  381,
			  274,  157,  118,  118,  120,  118,  748,  271,  263,  378,
			  118,  118,  272,  118,  309,  263,  221,  162,  273,  120,
			  275,  277,  315,  263,  118,  118,  120,  118,  274,  162,
			  118,  118,  278,  118,  120,  279,  887,  263,  118,  118,
			  229,  118,  314,  263,  377,  377,  225,  377,  120,  277,
			  280,  263,  441,  222,  120,  281,  263,  442,  820,  263, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  278,  284,  120,  279,  118,  118,  211,  118,  283,  282,
			  239,  118,  118,  445,  118,  157,  824,  263,  157,  317,
			  441,  337,  223,  281,  263,  442,  319,  820,  120,  284,
			  844,  118,  118,  263,  118,  120,  283,  282,  285,  263,
			  285,  445,  140,  162,  263,  824,  162,  318,  263,  291,
			  118,  118,  157,  118,  321,  120,  291,  286,  143,  844,
			  320,  287,  140,  263,  288,  447,  448,  157,  276,  211,
			  140,  119,  263,  289,  120,  290,  291,  308,  211,  323,
			  162,  263,  301,  375,  373,  286,  375,  143,  322,  287,
			  140,  441,  288,  447,  448,  162,  224,  307,  154,  451,

			  157,  304,  289,  251,  290,  118,  118,  326,  118,  263,
			  301,  330,  119,  119,  119,  119,  119,  119,  263,  443,
			  250,  292,  292,  292,  292,  292,  292,  451,  162,  120,
			  249,  118,  118,  222,  118,  118,  118,  242,  118,  332,
			  293,  291,  101,  294,  263,  119,  263,   98,  263,  295,
			  363,  364,  365,  366,  367,  120,  215,  215,  215,  120,
			  452,  617,  223,  296,  617,  157,  297,  229,  293,  688,
			  329,  294,  118,  118,  119,  118,  453,  295,  263,  118,
			  118,  298,  118,  263,  225,  263,  118,  118,  452,  118,
			  211,  296,  263,  162,  297,  324,  120,  157,  331,  263,

			  457,  325,  157,  120,  453,  460,  209,  263,  299,  298,
			  120,  334,  300,  263,  312,  263,  313,  313,  313,  313,
			  313,  313,  302,  327,  335,  162,  157,  336,  457,  328,
			  162,  154,  157,  460,  157,  303,  299,  152,  117,  338,
			  300,  116,  263,  461,  263,  462,  115,  263,  109,  263,
			  302,  106,  339,  463,  162,  340,  211,  337,  263,  345,
			  162,  157,  162,  157,  303,  263,  157,  346,  157,  211,
			  101,  461,   99,  462,  887,   98,  341,  157,  887,  343,
			  887,  463,  249,  249,  157,  249,  887,  347,  887,  162,
			  887,  162,  887,  887,  162,  348,  162,  379,  380,  380,

			  380,  380,  380,  380,  342,  162,  385,  344,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  263,  263,  263,  368,  368,  368,  887,  263,  887,
			  263,  230,  263,  230,  230,  887,  230,  369,  369,  369,
			  157,  157,  157,  231,  353,  231,  447,  157,  354,  451,
			  467,  157,  359,  469,  233,  387,  233,  387,  887,  361,
			  388,  388,  388,  388,  388,  388,  887,  887,  162,  162,
			  162,  887,  356,  887,  449,  162,  357,  454,  467,  162,
			  360,  469,  887,  887,  228,  887,  228,  887,  362,  371,

			  372,  373,  371,  372,  371,  371,  371,  371,  371,  371,
			  371,  371,  374,  232,  232,  371,  232,  232,  232,  232,
			  232,  232,  371,  375,  371,  371,  371,  371,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  371,  371,  376,  371,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  238,  238,  887,  238,  389,  389,  389,  389,  389,

			  389,  390,  390,  390,  390,  390,  390,  397,  397,  397,
			  397,  397,  663,  663,  663,  663,  663,  239,  887,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  386,  386,  386,  386,  386,  386,  391,  391,
			  391,  391,  391,  391,  470,  473,  474,  477,  253,  887,
			  394,  887,  394,  887,  392,  395,  395,  395,  395,  395,
			  395,  110,  240,  111,  887,  396,  396,  396,  396,  396,
			  396,  254,  470,  473,  474,  477,  253,  393,  118,  118,
			  887,  118,  392,  398,  398,  398,  398,  398,  398,  263,

			  887,  263,  118,  118,  887,  118,  118,  118,  887,  118,
			  118,  118,  120,  118,  113,  263,  887,  887,  470,  263,
			  401,  887,  887,  263,  263,  478,  120,  887,  118,  118,
			  120,  118,  118,  118,  120,  118,  118,  118,  887,  118,
			  887,  263,  402,  157,  411,  263,  472,  462,  401,  263,
			  403,  887,  120,  478,  887,  411,  120,  887,  535,  404,
			  120,  118,  118,  887,  118,  411,  118,  118,  406,  118,
			  402,  162,  887,  263,  263,  466,  405,  887,  403,  263,
			  263,  118,  118,  411,  118,  120,  535,  404,  118,  118,
			  120,  118,  474,  887,  263,  211,  406,  887,  407,  157,

			  263,  263,  539,  263,  405,  120,  887,  442,  118,  118,
			  408,  118,  120,  887,  530,  118,  118,  531,  118,  157,
			  476,  263,  157,  887,  887,  409,  407,  162,  263,  887,
			  539,  448,  120,  118,  118,  444,  118,  616,  408,  120,
			  616,  118,  118,  410,  118,  412,  263,  162,  118,  118,
			  162,  118,  413,  409,  263,  118,  118,  120,  118,  450,
			  510,  263,  617,  118,  118,  120,  118,  614,  263,  414,
			  541,  510,  120,  412,  218,  218,  263,  415,  416,  120,
			  413,  510,  542,  118,  118,  887,  118,  120,  419,  419,
			  419,  419,  419,  419,  545,  263,  263,  414,  541,  510,

			  118,  118,  887,  118,  887,  415,  416,  120,  887,  417,
			  542,  546,  467,  263,  157,  418,  420,  420,  420,  420,
			  420,  420,  545,  887,  120,  422,  422,  422,  422,  422,
			  422,  423,  423,  423,  423,  423,  423,  417,  887,  546,
			  468,  887,  162,  418,  613,  421,  424,  424,  424,  424,
			  424,  424,  549,  887,  119,  425,  425,  425,  425,  425,
			  425,  119,  119,  119,  119,  119,  119,  426,  550,  426,
			  119,  119,  119,  119,  119,  119,  524,  552,  118,  118,
			  549,  118,  118,  118,  553,  118,  308,  524,  554,  119,
			  427,  263,  887,  428,  615,  263,  550,  524,  411,  429,

			  118,  118,  120,  118,  263,  552,  120,  118,  118,  411,
			  118,  887,  553,  263,  555,  524,  554,  119,  427,  411,
			  263,  428,  295,  157,  120,  118,  118,  429,  118,  431,
			  887,  120,  118,  118,  887,  118,  816,  411,  263,  430,
			  118,  118,  555,  118,  559,  263,  458,  766,  887,  120,
			  295,  162,  561,  263,  887,  887,  120,  432,  118,  118,
			  887,  118,  118,  118,  120,  118,  887,  430,  887,  562,
			  211,  263,  559,  887,  433,  263,  118,  118,  818,  118,
			  561,  887,  120,  434,  887,  432,  120,  887,  438,  263,
			  438,  438,  438,  438,  438,  438,  304,  562,  887,  887, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  120,  439,  433,  439,  439,  439,  439,  439,  439,  304,
			  565,  434,  312,  435,  312,  312,  312,  312,  312,  312,
			  263,  263,  263,  263,  312,  436,  313,  313,  313,  313,
			  313,  313,  263,  263,  566,  887,  263,  887,  565,  157,
			  157,  157,  157,  887,  887,  452,  263,  445,  215,  215,
			  215,  157,  157,  453,  436,  157,  469,  460,  263,  263,
			  461,  887,  566,  457,  211,  157,  619,  162,  162,  162,
			  162,  263,  473,  455,  211,  446,  263,  157,  157,  162,
			  162,  456,  211,  162,  471,  464,  211,  477,  465,  478,
			  157,  459,  621,  162,  619,  157,  372,  373,  622,  372,

			  475,  377,  377,  887,  377,  162,  162,  887,  374,  825,
			  825,  825,  482,  479,  887,  480,  887,  481,  162,  375,
			  621,  887,  285,  162,  285,  887,  622,  887,  379,  380,
			  380,  380,  380,  380,  380,  484,  484,  484,  484,  484,
			  484,  483,  217,  217,  217,  287,  887,  625,  519,  376,
			  631,  253,  219,  219,  219,  119,  760,  760,  760,  760,
			  215,  215,  215,  887,  215,  215,  215,  388,  388,  388,
			  388,  388,  388,  287,  254,  625,  519,  887,  631,  253,
			  485,  485,  485,  485,  485,  485,  487,  487,  487,  487,
			  487,  487,  488,  488,  488,  488,  488,  488,  489,  489,

			  489,  489,  489,  489,  492,  492,  492,  492,  492,  492,
			  632,  633,  634,  638,  392,  490,  887,  490,  887,  486,
			  491,  491,  491,  491,  491,  491,  395,  395,  395,  395,
			  395,  395,  263,  887,  887,  887,  887,  393,  632,  633,
			  634,  638,  392,  493,  493,  493,  493,  493,  493,  495,
			  496,  542,  497,  497,  497,  497,  497,  497,  498,  498,
			  498,  498,  498,  498,  499,  499,  499,  499,  499,  499,
			  118,  118,  640,  118,  118,  118,  887,  118,  887,  544,
			  263,  887,  494,  263,  887,  263,  887,  263,  118,  118,
			  641,  118,  118,  118,  120,  118,  644,  887,  120,  157,

			  640,  263,  887,  887,  157,  263,  118,  118,  887,  118,
			  887,  887,  120,  501,  263,  535,  120,  887,  641,  263,
			  887,  502,  118,  118,  644,  118,  887,  162,  504,  263,
			  120,  503,  162,  549,  263,  263,  118,  118,  505,  118,
			  887,  501,  645,  537,  118,  118,  120,  118,  157,  263,
			  502,  118,  118,  157,  118,  887,  504,  263,  605,  503,
			  120,  551,  887,  887,  263,  646,  505,  887,  120,  605,
			  645,  118,  118,  887,  118,  120,  162,  118,  118,  605,
			  118,  162,  506,  508,  263,  118,  118,  887,  118,  507,
			  263,  118,  118,  646,  118,  120,  887,  605,  263,  509,

			  887,  120,  529,  887,  263,  118,  118,  887,  118,  120,
			  506,  508,  887,  511,  647,  120,  263,  507,  263,  118,
			  118,  157,  118,  118,  118,  119,  118,  509,  119,  120,
			  513,  512,  263,  887,  119,  157,  263,  118,  118,  541,
			  118,  511,  647,  120,  514,  887,  263,  120,  887,  162,
			  263,  887,  887,  119,  515,  887,  119,  887,  513,  512,
			  887,  120,  119,  162,  887,  157,  516,  543,  762,  763,
			  762,  763,  514,  419,  419,  419,  419,  419,  419,  285,
			  517,  285,  515,  422,  422,  422,  422,  422,  422,  118,
			  118,  887,  118,  162,  516,  423,  423,  423,  423,  423,

			  423,  518,  263,  118,  118,  519,  118,  764,  517,  887,
			  887,  263,  119,  120,  689,  887,  263,  519,  887,  424,
			  424,  424,  424,  424,  424,  887,  887,  120,  119,  518,
			  619,  690,  887,  519,  520,  425,  425,  425,  425,  425,
			  425,  263,  689,  118,  118,  519,  118,  887,  119,  521,
			  521,  521,  521,  521,  521,  887,  263,  119,  620,  690,
			  157,  887,  520,  887,  552,  887,  263,  120,  119,  522,
			  522,  522,  522,  522,  522,  523,  523,  523,  523,  523,
			  523,  118,  118,  626,  118,  157,  118,  118,  162,  118,
			  118,  118,  556,  118,  263,  627,  539,  119,  119,  263,

			  692,  887,  887,  263,  119,  120,  118,  118,  887,  118,
			  120,  626,  887,  162,  120,  693,  696,  526,  527,  529,
			  887,  263,  263,  627,  540,  887,  887,  525,  692,  528,
			  120,  438,  263,  438,  438,  438,  438,  438,  438,  304,
			  157,  157,  887,  693,  696,  526,  527,  263,  554,  887,
			  887,  157,  263,  263,  545,  525,  439,  528,  439,  439,
			  439,  439,  439,  439,  304,  553,  157,  263,  162,  162,
			  533,  157,  157,  263,  567,  559,  558,  263,  583,  162,
			  583,  536,  547,  887,  546,  568,  157,  697,  653,  584,
			  263,  698,  157,  557,  162,  534,  157,  561,  887,  162,

			  162,  887,  567,  560,  699,  703,  565,  562,  566,  157,
			  538,  254,  548,  568,  162,  697,  653,  585,  887,  698,
			  162,  263,  263,  887,  162,  563,  484,  484,  484,  484,
			  484,  484,  699,  703,  569,  564,  570,  162,  887,  622,
			  157,  157,  571,  572,  572,  572,  572,  572,  572,  573,
			  573,  573,  573,  573,  573,  574,  574,  574,  574,  574,
			  574,  575,  575,  575,  575,  575,  575,  624,  162,  162,
			  571,  491,  491,  491,  491,  491,  491,  392,  887,  887,
			  887,  887,  486,  576,  576,  576,  576,  576,  576,  578,
			  578,  578,  578,  578,  578,  778,  778,  887,  778,  887,

			  393,  263,  705,  887,  887,  392,  579,  579,  579,  579,
			  579,  579,  580,  580,  580,  580,  580,  580,  887,  802,
			  157,  887,  577,  575,  575,  575,  575,  575,  575,  496,
			  705,  497,  497,  497,  497,  497,  497,  118,  118,  582,
			  118,  118,  118,  618,  118,  494,  118,  118,  162,  118,
			  263,  887,  887,  887,  263,  118,  118,  887,  118,  263,
			  887,  120,  706,  118,  118,  120,  118,  582,  263,  887,
			  120,  118,  118,  263,  118,  887,  263,  709,  589,  120,
			  118,  118,  710,  118,  263,  118,  118,  120,  118,  263,
			  706,  887,  157,  263,  590,  120,  588,  263,  263,  621,

			  118,  118,  591,  118,  120,  709,  589,  625,  157,  120,
			  710,  592,  610,  263,  887,  263,  632,  593,  118,  118,
			  162,  118,  590,  611,  120,  118,  118,  623,  118,  594,
			  591,  263,  887,  612,  626,  628,  162,  595,  263,  592,
			  118,  118,  120,  118,  635,  593,  627,  887,  887,  120,
			  597,  611,  711,  263,  887,  743,  598,  594,  118,  118,
			  673,  118,  629,  744,  120,  595,  118,  118,  887,  118,
			  887,  263,  118,  118,  630,  118,  599,  673,  597,  263,
			  711,  673,  120,  743,  598,  263,  118,  118,  887,  118,
			  120,  744,  887,  263,  263,  263,  120,  263,  600,  263, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  887,  887,  887,  887,  599,  673,  887,  887,  887,  887,
			  120,  633,  157,  638,  641,  601,  644,  887,  602,  603,
			  603,  603,  603,  603,  603,  887,  600,  119,  119,  119,
			  119,  119,  119,  521,  521,  521,  521,  521,  521,  636,
			  162,  639,  643,  601,  648,  426,  602,  426,  119,  522,
			  522,  522,  522,  522,  522,  118,  118,  719,  118,  887,
			  746,  604,  523,  523,  523,  523,  523,  523,  263,  118,
			  118,  428,  118,  118,  118,  263,  118,  429,  119,  120,
			  393,  263,  263,  263,  119,  719,  263,  606,  746,  604,
			  263,  263,  263,  120,  645,  118,  118,  120,  118,  428,

			  157,  607,  157,  750,  634,  429,  690,  887,  263,  157,
			  157,  157,  119,  640,  887,  606,  608,  887,  887,  120,
			  887,  887,  649,  850,  850,  850,  850,  850,  162,  607,
			  162,  750,  637,  887,  691,  609,  887,  162,  162,  162,
			  650,  642,  650,  887,  608,  651,  651,  651,  651,  651,
			  651,  651,  651,  651,  651,  651,  651,  652,  652,  652,
			  652,  652,  652,  609,  575,  575,  575,  575,  575,  575,
			  655,  655,  655,  655,  655,  655,  887,  752,  887,  887,
			  654,  656,  656,  656,  656,  656,  656,  263,  263,  887,
			  486,  657,  657,  657,  657,  657,  657,  658,  658,  658,

			  658,  658,  658,  887,  263,  752,  692,  157,  654,  577,
			  659,  659,  659,  659,  659,  659,  660,  660,  660,  660,
			  660,  660,  661,  698,  661,  753,  887,  658,  658,  658,
			  658,  658,  658,  754,  694,  162,  494,  662,  662,  662,
			  662,  662,  662,  665,  665,  665,  665,  665,  665,  118,
			  118,  701,  118,  753,  118,  118,  263,  118,  887,  666,
			  263,  754,  263,  684,  887,  684,  887,  263,  118,  118,
			  887,  118,  887,  120,  684,  705,  686,  668,  120,  157,
			  887,  263,  118,  118,  685,  118,  687,  666,  118,  118,
			  779,  118,  120,  887,  731,  263,  669,  118,  118,  887,

			  118,  263,  684,  707,  686,  668,  120,  162,  685,  887,
			  263,  731,  120,  118,  118,  731,  118,  780,  779,  687,
			  670,  120,  118,  118,  669,  118,  263,  118,  118,  687,
			  118,  118,  118,  782,  118,  263,  671,  120,  887,  731,
			  263,  784,  887,  887,  263,  780,  120,  687,  670,  118,
			  118,  120,  118,  118,  118,  120,  118,  118,  118,  672,
			  118,  782,  263,  675,  671,  786,  263,  887,  787,  784,
			  263,  674,  887,  120,  887,  887,  263,  120,  887,  118,
			  118,  120,  118,  887,  887,  803,  887,  672,  887,  678,
			  887,  675,  263,  786,  676,  157,  787,  677,  887,  674,

			  285,  263,  285,  120,  603,  603,  603,  603,  603,  603,
			  679,  118,  118,  803,  118,  118,  118,  678,  118,  887,
			  157,  263,  676,  162,  263,  677,  263,  693,  263,  118,
			  118,  263,  118,  119,  804,  120,  806,  887,  679,  120,
			  157,  263,  263,  118,  118,  157,  118,  263,  162,  887,
			  157,  263,  697,  120,  808,  695,  263,  703,  681,  682,
			  157,  887,  804,  699,  806,  706,  157,  120,  162,  819,
			  157,  709,  887,  162,  683,  887,  118,  118,  162,  118,
			  700,  887,  808,  887,  887,  704,  681,  682,  162,  263,
			  887,  702,  887,  708,  162,  887,  822,  819,  162,  712,

			  120,  887,  683,  651,  651,  651,  651,  651,  651,  651,
			  651,  651,  651,  651,  651,  713,  713,  713,  713,  713,
			  713,  714,  887,  714,  822,  887,  715,  715,  715,  715,
			  715,  715,  716,  887,  716,  887,  887,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  718,
			  718,  718,  718,  718,  718,  658,  658,  658,  658,  658,
			  658,  720,  720,  720,  720,  720,  720,  658,  658,  658,
			  658,  658,  658,  722,  722,  722,  722,  722,  722,  887,
			  887,  887,  577,  723,  723,  723,  723,  723,  723,  724,
			  724,  724,  724,  724,  724,  887,  887,  834,  887,  118,

			  118,  725,  118,  725,  887,  719,  726,  726,  726,  726,
			  726,  726,  263,  118,  118,  887,  118,  118,  118,  887,
			  118,  118,  118,  120,  118,  834,  263,  887,  393,  835,
			  263,  887,  263,  719,  263,  118,  118,  120,  118,  263,
			  887,  120,  728,  118,  118,  120,  118,  730,  263,  746,
			  729,  157,  118,  118,  887,  118,  263,  835,  157,  120,
			  118,  118,  887,  118,  887,  263,  887,  120,  118,  118,
			  728,  118,  734,  263,  887,  730,  120,  747,  729,  162,
			  845,  263,  118,  118,  120,  118,  162,  118,  118,  734,
			  118,  263,  120,  734,  263,  263,  118,  118,  887,  118,

			  263,  732,  118,  118,  263,  118,  120,  733,  845,  263,
			  157,  120,  887,  157,  263,  263,  887,  734,  744,  735,
			  120,  831,  854,  157,  263,  263,  120,  748,  887,  831,
			  732,  736,  887,  157,  737,  733,  118,  118,  162,  118,
			  750,  162,  831,  157,  752,  887,  745,  735,  887,  263,
			  854,  162,  887,  887,  887,  887,  749,  831,  887,  736,
			  120,  162,  737,  856,  856,  856,  856,  856,  751,  887,
			  887,  162,  755,  715,  715,  715,  715,  715,  715,  756,
			  756,  756,  756,  756,  756,  717,  717,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  757,  757,  757,

			  757,  757,  757,  758,  887,  758,  887,  887,  759,  759,
			  759,  759,  759,  759,  887,  887,  887,  887,  486,  761,
			  761,  761,  761,  761,  761,  657,  657,  657,  657,  657,
			  657,  726,  726,  726,  726,  726,  726,  118,  118,  263,
			  118,  719,  765,  765,  765,  765,  765,  765,  887,  771,
			  263,  887,  118,  118,  263,  118,  860,  887,  782,  118,
			  118,  120,  118,  887,  393,  263,  771,  767,  887,  719,
			  771,  887,  263,  157,  118,  118,  120,  118,  887,  118,
			  118,  494,  118,  120,  860,  887,  783,  263,  768,  887,
			  887,  769,  263,  887,  771,  767,  118,  118,  120,  118,

			  846,  162,  846,  120,  770,  118,  118,  887,  118,  263,
			  772,  847,  263,  774,  887,  887,  768,  774,  263,  769,
			  120,  775,  774,  775,  887,  775,  776,  777,  773,  120,
			  263,  157,  770,  263,  774,  780,  887,  887,  772,  848,
			  832,  887,  775,  776,  777,  774,  887,  784,  832,  157,
			  887,  786,  157,  775,  776,  777,  773,  873,  887,  162,
			  866,  832,  866,  781,  713,  713,  713,  713,  713,  713,
			  887,  867,  887,  887,  873,  785,  832,  162,  873,  788,
			  162,  759,  759,  759,  759,  759,  759,  789,  789,  789,
			  789,  789,  789,  790,  790,  790,  790,  790,  790,  868, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  887,  887,  873,  486,  585,  585,  585,  585,  585,  585,
			  791,  791,  791,  791,  791,  791,  792,  792,  792,  792,
			  792,  792,  118,  118,  887,  118,  577,  720,  720,  720,
			  720,  720,  720,  887,  887,  263,  118,  118,  887,  118,
			  118,  118,  263,  118,  887,  887,  120,  887,  887,  263,
			  887,  887,  887,  263,  887,  118,  118,  794,  118,  887,
			  120,  157,  118,  118,  120,  118,  494,  798,  263,  118,
			  118,  798,  118,  799,  798,  263,  799,  799,  800,  120,
			  801,  795,  263,  263,  263,  794,  120,  796,  798,  162,
			  887,  263,  263,  120,  799,  800,  887,  801,  887,  798,

			  887,  887,  806,  157,  887,  799,  800,  887,  801,  795,
			  157,  157,  887,  887,  797,  796,  804,  757,  757,  757,
			  757,  757,  757,  810,  810,  810,  810,  810,  810,  887,
			  807,  162,  887,  887,  887,  263,  887,  887,  162,  162,
			  263,  762,  797,  762,  805,  887,  792,  792,  792,  792,
			  792,  792,  118,  118,  157,  118,  577,  118,  118,  157,
			  118,  118,  118,  887,  118,  263,  118,  118,  887,  118,
			  263,  820,  263,  887,  263,  887,  120,  887,  887,  263,
			  764,  120,  162,  887,  812,  120,  887,  162,  887,  766,
			  120,  157,  826,  826,  826,  826,  826,  826,  118,  118,

			  821,  118,  832,  822,  887,  814,  813,  887,  887,  887,
			  833,  263,  812,  118,  118,  815,  118,  118,  118,  162,
			  118,  887,  120,  833,  887,  887,  263,  887,  887,  887,
			  263,  823,  887,  814,  887,  813,  887,  120,  833,  118,
			  118,  120,  118,  829,  815,  836,  836,  836,  836,  836,
			  836,  841,  263,  764,  764,  764,  764,  764,  764,  841,
			  766,  118,  118,  120,  118,  118,  118,  842,  118,  887,
			  887,  829,  841,  842,  263,  842,  887,  887,  263,  887,
			  830,  843,  887,  118,  118,  120,  118,  841,  842,  120,
			  887,  887,  118,  118,  843,  118,  263,  840,  880,  881,

			  880,  881,  858,  842,  887,  263,  887,  120,  830,  843,
			  839,  887,  887,  858,  887,  887,  120,  855,  855,  855,
			  855,  855,  855,  858,  851,  840,  850,  850,  850,  850,
			  850,  850,  118,  118,  887,  118,  859,  882,  887,  839,
			  887,  858,  887,  887,  887,  263,  887,  859,  887,  887,
			  887,  887,  851,  887,  887,  887,  120,  859,  861,  861,
			  861,  861,  861,  861,  857,  862,  862,  862,  862,  862,
			  862,  118,  118,  887,  118,  859,  863,  864,  865,  865,
			  865,  865,  865,  865,  263,  887,  887,  863,  864,  887,
			  887,  887,  857,  887,  887,  120,  887,  863,  864,  848,

			  848,  848,  848,  848,  848,  871,  871,  871,  871,  871,
			  871,  874,  887,  887,  887,  863,  864,  872,  872,  872,
			  872,  872,  875,  875,  875,  875,  875,  875,  874,  877,
			  878,  887,  874,  876,  876,  876,  876,  876,  876,  879,
			  879,  879,  879,  879,  879,  887,  877,  878,  887,  887,
			  877,  878,  887,  887,  887,  887,  874,  868,  868,  868,
			  868,  868,  868,  883,  883,  883,  883,  883,  883,  887,
			  887,  887,  887,  887,  877,  878,  884,  884,  884,  884,
			  884,  884,  885,  885,  885,  885,  885,  885,  880,  887,
			  880,  887,  887,  884,  884,  884,  884,  884,  884,  886,

			  886,  886,  886,  886,  886,  882,  882,  882,  882,  882,
			  882,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  882,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,

			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,  100,  100,  887,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  887,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  102,  102,
			  887,  102,  102,  102,  102,  102,  102,  102,  102,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  119,  119,  119,  887,  887,  887,  887,
			  887,  887,  887,  119,  119,  119,  119,  887,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,

			  119,  887,  887,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  151,  151,  887,  151,  151,  887,  151,  151,
			  151,  887,  887,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  887,  887,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  153,  153,  887,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  210,
			  210,  887,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  887,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  887,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  227,  887,  227,  887,  887,
			  887,  887,  227,  227,  887,  227,  227,  227,  887,  887,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,

			  227,  227,  227,  887,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,

			  237,  237,  237,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  237,  241,  241,
			  887,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  105,  887,  887,  887,  887,  105,  105,  105,  887,  887,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

			  105,  105,  105,  887,  887,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  887,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,

			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  264,  887,
			  887,  887,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  887,  887,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  240,  240,  240,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  240,  887,

			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  240,  399,  399,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  399,  887,  887,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  500,  500,  500,

			  887,  887,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  887,  887,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  532,  887,  532,  887,
			  887,  887,  887,  532,  532,  887,  532,  532,  532,  887,
			  887,  532,  532,  532,  532,  532,  532,  532,  532,  532,
			  532,  532,  532,  532,  532,  532,  532,  532,  532,  532,
			  532,  532,  532,  532,  887,  887,  532,  532,  532,  532,
			  532,  532,  532,  532,  532,  440,  440,  440,  887,  887,
			  440,  440,  440,  440,  440,  440,  440,  440,  440,  887,

			  887,  440,  440,  440,  440,  440,  440,  440,  440,  440,
			  440,  440,  440,  440,  440,  440,  440,  440,  440,  440,
			  440,  440,  440,  440,  887,  887,  440,  440,  440,  440,
			  440,  440,  440,  440,  440,  613,  887,  613,  887,  887,
			  887,  887,  613,  613,  887,  613,  613,  613,  887,  887,
			  613,  613,  613,  613,  613,  613,  613,  613,  613,  613,
			  613,  613,  613,  613,  613,  613,  613,  613,  613,  613,
			  613,  613,  613,  887,  613,  613,  613,  613,  613,  613,
			  613,  613,  613,  613,  664,  664,  664,  664,  664,  664,
			  664,  664,  664,  887,  664,  664,  664,  664,  664,  664,

			  664,  664,  664,  664,  664,  664,  664,  664,  664,  664,
			  664,  664,  664,  664,  664,  664,  664,  664,  664,  664,
			  664,  664,  664,  664,  664,  664,  664,  664,  664,  664,
			  664,  664,  664,  664,  664,  664,  667,  667,  667,  667,
			  667,  667,  667,  667,  667,  667,  667,  667,  667,  667,
			  667,  667,  667,  667,  667,  667,  667,  667,  667,  887,
			  887,  667,  667,  667,  667,  667,  667,  667,  667,  667,
			  727,  727,  727,  887,  887,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  887,  887, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  742,
			  742,  742,  742,  742,  742,  742,  742,  742,  742,  742,
			  742,  742,  742,  742,  742,  742,  742,  742,  742,  742,
			  742,  742,  742,  887,  887,  887,  887,  742,  742,  742,
			  887,  887,  742,  742,  742,  742,  742,  742,  742,  742,
			  742,  742,  742,  742,  742,  742,  742,  742,  742,  742,
			  742,  742,  742,  742,  742,  887,  887,  742,  742,  742,
			  742,  742,  742,  742,  742,  742,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  887,

			  887,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  811,  811,  811,  887,  887,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  811,
			  811,  811,  811,  811,  811,  811,  811,  811,  887,  887,
			  811,  811,  811,  811,  811,  811,  811,  811,  811,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  887,  887,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  849,  849,  849,  887,  887,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,

			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  887,  887,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,   13,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,

			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887, yy_Dummy>>,
			1, 315, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 6314)
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

			   20,   15,    4,   15,   15,   27,  613,   27,   27,   27,
			   27,   27,   27,   29,   94,   29,  152,   29,   29,   29,
			   29,   29,   29,   40,   40,   59,   40,   60,   78,   59,
			  159,    5,    6,   30,   59,   30,  160,   30,   30,   30,
			   30,   30,   30,   63,    3,   20,   63,   40,  207,    4,
			  864,   11,  152,   59,   12,   60,   29,   59,  159,  613,
			    5,    6,   59,   76,  160,   76,   76,  152,  863,   94,
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
			   39,   39,   80,   39,   65,  842,  231,   66,   65,  231,

			   41,   41,  841,   41,   37,   66,   45,   45,   38,   45,
			  161,  828,   84,   37,   39,   71,   38,   37,   39,   37,
			   89,  801,   65,   89,   41,   66,   65,   39,   42,   42,
			   45,   42,   71,   66,   45,   43,   43,   41,   43,   46,
			   46,   37,   46,   71,   38,   37,   39,   37,   41,   84,
			   44,   44,   42,   44,  167,   39,   42,   47,   47,   43,
			   47,   71,   45,   46,  169,   41,   50,   50,   42,   50,
			   43,  170,   80,   89,   44,   61,   79,   41,   84,   46,
			   61,   47,  167,  233,   42,  173,  233,   47,   44,   44,
			   50,   61,  169,   67,   44,   67,   42,  790,   43,  170,

			   47,   49,   49,   61,   49,   50,   67,   46,   61,  177,
			   50,   51,   51,  173,   51,   47,   44,   44,  757,   82,
			   61,   67,   44,   67,  250,   49,  250,  250,   47,   48,
			   48,  178,   48,   50,   67,   51,   49,  177,   50,  361,
			   86,  495,  495,  742,   49,   48,   48,   48,   48,   48,
			   48,   51,   81,   48,   79,   79,   79,   62,   83,  178,
			   48,   62,   52,   52,   49,   52,  727,   48,  361,   62,
			  118,  118,   49,  118,   48,   64,   48,   86,   48,   51,
			  183,   64,   64,  720,   69,   62,   52,   64,   48,   62,
			   68,   69,   70,   68,  118,   48,   69,   62,   82,   82,

			   70,   68,  499,   64,  442,   48,   86,   48,  183,   64,
			   64,   52,   69,  225,  437,   64,  713,  437,   68,   69,
			   70,   68,  119,  119,   69,  119,  798,  687,   70,   68,
			   81,   81,   81,  442,  686,  119,   83,   83,   83,  189,
			   52,   57,   91,  499,   57,   91,  119,  162,  155,   57,
			  225,  155,  216,  685,   91,   91,  155,   57,   57,   57,
			   57,   57,   57,   57,  191,   91,  162,  189,  798,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,  191,  684,  162,   91,   57,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   58,   92,  530,   58,   92,  530,  182,  660,   58,  605,
			  216,  216,  216,   92,  536,  182,   58,   58,   58,   58,
			   58,   58,   58,  193,   92,  182,  234,  510,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  193,  500,  182,   92,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   95,

			   95,  234,   95,  811,  811,  104,  110,  110,  110,  110,
			  110,  110,  843,  364,  104,  104,  104,  104,  104,  104,
			  843,  226,  849,  849,  226,   95,  488,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  104,  108,  108,  108,  108,  108,  108,  111,  111,  111,
			  111,  111,  111,  184,  174,  104,  184,  108,  194,  104,
			  174,  104,  197,  111,  226,  131,  131,  112,  131,  112,
			   95,  112,  112,  112,  112,  112,  112,  112,  131,  482,
			  108,  184,  174,  364,  184,  108,  194,  131,  174,  131,

			  197,  111,  113,  113,  113,  113,  113,  113,  114,  198,
			  114,  400,  114,  114,  114,  114,  114,  114,  121,  121,
			  112,  121,  122,  122,  202,  122,  123,  123,  376,  123,
			  199,  121,  205,  371,  201,  122,  355,  198,  201,  123,
			  124,  124,  121,  124,  374,  374,  122,  374,  330,  199,
			  123,  114,  202,  124,  308,  125,  125,  123,  125,  122,
			  205,  204,  201,  121,  124,  166,  201,  200,  125,  126,
			  126,  534,  126,  124,  534,  127,  127,  199,  127,  125,
			  204,  304,  126,  166,  166,  123,  200,  122,  127,  130,
			  130,  121,  130,  126,  128,  128,  534,  128,  125,  127,

			  200,  124,  130,  129,  129,  264,  129,  128,  204,  126,
			  165,  166,  166,  130,  200,  248,  129,  699,  128,  127,
			  132,  132,  164,  132,  128,  247,  125,  129,  200,  165,
			  128,  246,  130,  132,  165,  134,  134,  126,  134,  245,
			  129,  164,  133,  133,  132,  133,  699,  127,  134,  243,
			  135,  135,  128,  135,  164,  133,  220,  165,  128,  134,
			  130,  132,  165,  135,  136,  136,  133,  136,  129,  164,
			  138,  138,  133,  138,  135,  133,  238,  136,  137,  137,
			  229,  137,  164,  138,  239,  239,  223,  239,  136,  132,
			  134,  137,  309,  220,  138,  135,  171,  310,  804,  168, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  133,  138,  137,  133,  140,  140,  210,  140,  137,  136,
			  239,  141,  141,  317,  141,  171,  808,  140,  168,  168,
			  309,  185,  220,  135,  141,  310,  171,  804,  140,  138,
			  834,  143,  143,  172,  143,  141,  137,  136,  139,  139,
			  139,  317,  141,  171,  143,  808,  168,  168,  175,  140,
			  148,  148,  172,  148,  171,  143,  141,  139,  141,  834,
			  172,  139,  143,  148,  139,  319,  320,  175,  181,  215,
			  141,  139,  314,  139,  148,  139,  143,  158,  217,  175,
			  172,  180,  148,  375,  375,  139,  375,  141,  172,  139,
			  143,  314,  139,  319,  320,  175,  222,  156,  153,  323,

			  180,  151,  139,  107,  139,  142,  142,  175,  142,  144,
			  148,  180,  144,  144,  144,  144,  144,  144,  142,  314,
			  106,  142,  142,  142,  142,  142,  142,  323,  180,  142,
			  105,  145,  145,  222,  145,  146,  146,  102,  146,  180,
			  142,  144,  100,  142,  145,  144,  179,   98,  146,  142,
			  215,  215,  215,  215,  215,  145,  217,  217,  217,  146,
			  324,  617,  222,  145,  617,  179,  145,   90,  142,  617,
			  179,  142,  147,  147,  144,  147,  325,  142,  176,  149,
			  149,  146,  149,  186,   87,  147,  150,  150,  324,  150,
			   75,  145,  149,  179,  145,  176,  147,  176,  179,  150,

			  329,  176,  186,  149,  325,  334,   72,  187,  147,  146,
			  150,  186,  147,  163,  163,  188,  163,  163,  163,  163,
			  163,  163,  149,  176,  187,  176,  187,  187,  329,  176,
			  186,   56,  163,  334,  188,  150,  147,   53,   36,  186,
			  147,   35,  195,  335,  190,  336,   33,  192,   28,  196,
			  149,   26,  187,  337,  187,  187,  218,  188,  316,  195,
			  163,  195,  188,  190,  150,  157,  192,  196,  196,  219,
			   18,  335,   17,  336,  157,   16,  190,  316,   13,  192,
			    0,  337,  249,  249,  157,  249,    0,  195,    0,  195,
			    0,  190,    0,    0,  192,  196,  196,  244,  244,  244,

			  244,  244,  244,  244,  190,  316,  249,  192,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  203,  206,  208,  218,  218,  218,    0,  321,    0,
			  326,  227,  344,  230,  227,    0,  230,  219,  219,  219,
			  203,  206,  208,  227,  203,  230,  321,  321,  203,  326,
			  341,  344,  206,  345,  227,  253,  230,  253,    0,  208,
			  253,  253,  253,  253,  253,  253,    0,    0,  203,  206,
			  208,    0,  203,    0,  321,  321,  203,  326,  341,  344,
			  206,  345,    0,    0,  227,    0,  230,    0,  208,  232,

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
			  260,  260,  584,  584,  584,  584,  584,  235,    0,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  252,  252,  252,  252,  252,  252,  257,  257,
			  257,  257,  257,  257,  346,  349,  350,  353,  252,    0,
			  258,    0,  258,    0,  257,  258,  258,  258,  258,  258,
			  258,  259,  235,  259,    0,  259,  259,  259,  259,  259,
			  259,  252,  346,  349,  350,  353,  252,  257,  265,  265,
			    0,  265,  257,  261,  261,  261,  261,  261,  261,  348,

			    0,  265,  266,  266,    0,  266,  267,  267,    0,  267,
			  268,  268,  265,  268,  259,  266,    0,    0,  348,  267,
			  265,    0,    0,  268,  340,  354,  266,    0,  269,  269,
			  267,  269,  270,  270,  268,  270,  271,  271,    0,  271,
			    0,  269,  266,  340,  276,  270,  348,  340,  265,  271,
			  268,    0,  269,  354,    0,  276,  270,    0,  441,  269,
			  271,  272,  272,    0,  272,  276,  273,  273,  271,  273,
			  266,  340,    0,  352,  272,  340,  270,    0,  268,  273,
			  315,  274,  274,  276,  274,  272,  441,  269,  275,  275,
			  273,  275,  352,    0,  274,  366,  271,    0,  272,  315,

			  322,  275,  445,  360,  270,  274,    0,  315,  277,  277,
			  273,  277,  275,    0,  531,  278,  278,  531,  278,  322,
			  352,  277,  360,    0,    0,  274,  272,  315,  278,    0,
			  445,  322,  277,  279,  279,  315,  279,  616,  273,  278,
			  616,  280,  280,  275,  280,  277,  279,  322,  281,  281,
			  360,  281,  278,  274,  280,  282,  282,  279,  282,  322,
			  411,  281,  616,  283,  283,  280,  283,  531,  282,  279,
			  447,  411,  281,  277,  366,  366,  283,  280,  281,  282,
			  278,  411,  448,  284,  284,    0,  284,  283,  285,  285,
			  285,  285,  285,  285,  452,  342,  284,  279,  447,  411,

			  286,  286,    0,  286,    0,  280,  281,  284,    0,  283,
			  448,  453,  342,  286,  342,  284,  286,  286,  286,  286,
			  286,  286,  452,    0,  286,  287,  287,  287,  287,  287,
			  287,  288,  288,  288,  288,  288,  288,  283,    0,  453,
			  342,  532,  342,  284,  532,  286,  289,  289,  289,  289,
			  289,  289,  457,    0,  287,  290,  290,  290,  290,  290,
			  290,  291,  291,  291,  291,  291,  291,  292,  458,  292,
			  293,  293,  293,  293,  293,  293,  431,  460,  294,  294,
			  457,  294,  295,  295,  461,  295,  333,  431,  462,  293,
			  292,  294,    0,  292,  532,  295,  458,  431,  333,  292,

			  296,  296,  294,  296,  332,  460,  295,  297,  297,  333,
			  297,    0,  461,  296,  463,  431,  462,  293,  292,  333,
			  297,  292,  294,  332,  296,  298,  298,  292,  298,  297,
			    0,  297,  299,  299,    0,  299,  800,  333,  298,  296,
			  300,  300,  463,  300,  467,  299,  332,  800,    0,  298,
			  294,  332,  469,  300,    0,    0,  299,  298,  301,  301,
			    0,  301,  302,  302,  300,  302,    0,  296,    0,  470,
			  363,  301,  467,    0,  299,  302,  303,  303,  800,  303,
			  469,    0,  301,  300,    0,  298,  302,    0,  305,  303,
			  305,  305,  305,  305,  305,  305,  305,  470,    0,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  303,  306,  299,  306,  306,  306,  306,  306,  306,  306,
			  477,  300,  312,  301,  312,  312,  312,  312,  312,  312,
			  318,  327,  328,  347,  313,  303,  313,  313,  313,  313,
			  313,  313,  331,  338,  478,    0,  339,    0,  477,  318,
			  327,  328,  347,    0,    0,  327,  351,  318,  363,  363,
			  363,  331,  338,  328,  303,  339,  347,  338,  356,  357,
			  339,    0,  478,  331,  365,  351,  539,  318,  327,  328,
			  347,  358,  351,  327,  367,  318,  362,  356,  357,  331,
			  338,  328,  368,  339,  347,  338,  369,  356,  339,  357,
			  358,  331,  541,  351,  539,  362,  372,  372,  542,  372,

			  351,  377,  377,    0,  377,  356,  357,    0,  372,  809,
			  809,  809,  362,  358,    0,  356,    0,  357,  358,  372,
			  541,    0,  420,  362,  420,    0,  542,  377,  380,  380,
			  380,  380,  380,  380,  380,  386,  386,  386,  386,  386,
			  386,  362,  365,  365,  365,  420,    0,  545,  420,  372,
			  550,  386,  367,  367,  367,  420,  721,  721,  721,  721,
			  368,  368,  368,    0,  369,  369,  369,  387,  387,  387,
			  387,  387,  387,  420,  386,  545,  420,    0,  550,  386,
			  388,  388,  388,  388,  388,  388,  389,  389,  389,  389,
			  389,  389,  390,  390,  390,  390,  390,  390,  391,  391,

			  391,  391,  391,  391,  393,  393,  393,  393,  393,  393,
			  552,  553,  554,  559,  391,  392,    0,  392,    0,  388,
			  392,  392,  392,  392,  392,  392,  394,  394,  394,  394,
			  394,  394,  450,    0,    0,    0,    0,  391,  552,  553,
			  554,  559,  391,  395,  395,  395,  395,  395,  395,  396,
			  396,  450,  396,  396,  396,  396,  396,  396,  397,  397,
			  397,  397,  397,  397,  398,  398,  398,  398,  398,  398,
			  401,  401,  561,  401,  402,  402,    0,  402,    0,  450,
			  454,    0,  395,  401,    0,  443,    0,  402,  403,  403,
			  562,  403,  404,  404,  401,  404,  565,    0,  402,  454,

			  561,  403,    0,    0,  443,  404,  405,  405,    0,  405,
			    0,    0,  403,  401,  459,  443,  404,    0,  562,  405,
			    0,  402,  406,  406,  565,  406,    0,  454,  404,  475,
			  405,  403,  443,  459,  476,  406,  407,  407,  405,  407,
			    0,  401,  566,  443,  408,  408,  406,  408,  475,  407,
			  402,  409,  409,  476,  409,    0,  404,  408,  524,  403,
			  407,  459,    0,    0,  409,  567,  405,    0,  408,  524,
			  566,  410,  410,    0,  410,  409,  475,  412,  412,  524,
			  412,  476,  407,  409,  410,  413,  413,    0,  413,  408,
			  412,  414,  414,  567,  414,  410,    0,  524,  413,  410,

			    0,  412,  483,    0,  414,  415,  415,    0,  415,  413,
			  407,  409,    0,  412,  568,  414,  449,  408,  415,  416,
			  416,  483,  416,  417,  417,  421,  417,  410,  421,  415,
			  414,  413,  416,    0,  421,  449,  417,  418,  418,  449,
			  418,  412,  568,  416,  415,    0,  537,  417,    0,  483,
			  418,    0,    0,  421,  416,    0,  421,    0,  414,  413,
			    0,  418,  421,  449,    0,  537,  417,  449,  723,  723,
			  723,  723,  415,  419,  419,  419,  419,  419,  419,  422,
			  418,  422,  416,  422,  422,  422,  422,  422,  422,  429,
			  429,    0,  429,  537,  417,  423,  423,  423,  423,  423,

			  423,  419,  429,  430,  430,  422,  430,  723,  418,    0,
			    0,  540,  422,  429,  618,    0,  430,  423,    0,  424,
			  424,  424,  424,  424,  424,    0,    0,  430,  423,  419,
			  540,  621,    0,  422,  424,  425,  425,  425,  425,  425,
			  425,  464,  618,  432,  432,  423,  432,    0,  424,  426,
			  426,  426,  426,  426,  426,    0,  432,  423,  540,  621,
			  464,    0,  424,    0,  464,    0,  446,  432,  425,  427,
			  427,  427,  427,  427,  427,  428,  428,  428,  428,  428,
			  428,  433,  433,  546,  433,  446,  434,  434,  464,  434,
			  435,  435,  464,  435,  433,  546,  446,  425,  427,  434,

			  625,    0,    0,  435,  428,  433,  436,  436,    0,  436,
			  434,  546,    0,  446,  435,  626,  631,  434,  435,  436,
			    0,  455,  466,  546,  446,    0,    0,  433,  625,  435,
			  436,  438,  465,  438,  438,  438,  438,  438,  438,  438,
			  455,  466,    0,  626,  631,  434,  435,  444,  466,    0,
			    0,  465,  456,  468,  455,  433,  439,  435,  439,  439,
			  439,  439,  439,  439,  439,  465,  444,  471,  455,  466,
			  438,  456,  468,  480,  479,  468,  466,  472,  498,  465,
			  498,  444,  455,    0,  456,  479,  471,  632,  574,  498,
			  481,  633,  480,  465,  444,  439,  472,  471,    0,  456,

			  468,    0,  479,  468,  634,  638,  480,  472,  481,  481,
			  444,  574,  456,  479,  471,  632,  574,  498,    0,  633,
			  480,  544,  551,    0,  472,  471,  484,  484,  484,  484,
			  484,  484,  634,  638,  480,  472,  481,  481,    0,  544,
			  544,  551,  484,  485,  485,  485,  485,  485,  485,  486,
			  486,  486,  486,  486,  486,  487,  487,  487,  487,  487,
			  487,  489,  489,  489,  489,  489,  489,  544,  544,  551,
			  484,  490,  490,  490,  490,  490,  490,  489,    0,    0,
			    0,    0,  485,  491,  491,  491,  491,  491,  491,  492,
			  492,  492,  492,  492,  492,  778,  778,    0,  778,    0,

			  489,  538,  640,    0,    0,  489,  493,  493,  493,  493,
			  493,  493,  494,  494,  494,  494,  494,  494,    0,  778,
			  538,    0,  491,  496,  496,  496,  496,  496,  496,  497,
			  640,  497,  497,  497,  497,  497,  497,  501,  501,  496,
			  501,  502,  502,  538,  502,  493,  503,  503,  538,  503,
			  501,    0,    0,    0,  502,  504,  504,    0,  504,  503,
			    0,  501,  641,  508,  508,  502,  508,  496,  504,    0,
			  503,  505,  505,  543,  505,    0,  508,  645,  503,  504,
			  506,  506,  646,  506,  505,  507,  507,  508,  507,  547,
			  641,    0,  543,  506,  504,  505,  502,  556,  507,  543,

			  509,  509,  505,  509,  506,  645,  503,  547,  547,  507,
			  646,  506,  529,  509,    0,  548,  556,  507,  511,  511,
			  543,  511,  504,  529,  509,  512,  512,  543,  512,  507,
			  505,  511,    0,  529,  548,  547,  547,  509,  512,  506,
			  513,  513,  511,  513,  556,  507,  548,    0,    0,  512,
			  511,  529,  647,  513,    0,  689,  512,  507,  514,  514,
			  596,  514,  548,  690,  513,  509,  515,  515,    0,  515,
			    0,  514,  516,  516,  548,  516,  513,  596,  511,  515,
			  647,  596,  514,  689,  512,  516,  517,  517,    0,  517,
			  515,  690,    0,  557,  560,  564,  516,  569,  515,  517, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,  513,  596,    0,    0,    0,    0,
			  517,  557,  557,  560,  564,  516,  569,    0,  517,  519,
			  519,  519,  519,  519,  519,    0,  515,  520,  520,  520,
			  520,  520,  520,  521,  521,  521,  521,  521,  521,  557,
			  557,  560,  564,  516,  569,  522,  517,  522,  519,  522,
			  522,  522,  522,  522,  522,  525,  525,  657,  525,    0,
			  693,  521,  523,  523,  523,  523,  523,  523,  525,  526,
			  526,  522,  526,  527,  527,  570,  527,  522,  522,  525,
			  657,  558,  526,  563,  523,  657,  527,  525,  693,  521,
			  620,  623,  624,  526,  570,  528,  528,  527,  528,  522,

			  558,  526,  563,  705,  558,  522,  623,    0,  528,  620,
			  623,  624,  523,  563,    0,  525,  527,    0,    0,  528,
			    0,    0,  570,  838,  838,  838,  838,  838,  558,  526,
			  563,  705,  558,    0,  623,  528,    0,  620,  623,  624,
			  571,  563,  571,    0,  527,  571,  571,  571,  571,  571,
			  571,  572,  572,  572,  572,  572,  572,  573,  573,  573,
			  573,  573,  573,  528,  575,  575,  575,  575,  575,  575,
			  576,  576,  576,  576,  576,  576,    0,  709,    0,    0,
			  575,  577,  577,  577,  577,  577,  577,  628,  630,    0,
			  572,  578,  578,  578,  578,  578,  578,  579,  579,  579,

			  579,  579,  579,    0,  636,  709,  628,  630,  575,  576,
			  580,  580,  580,  580,  580,  580,  581,  581,  581,  581,
			  581,  581,  582,  636,  582,  710,    0,  582,  582,  582,
			  582,  582,  582,  711,  628,  630,  579,  583,  583,  583,
			  583,  583,  583,  586,  586,  586,  586,  586,  586,  588,
			  588,  636,  588,  710,  589,  589,  642,  589,    0,  586,
			  648,  711,  588,  610,    0,  611,    0,  589,  590,  590,
			    0,  590,    0,  588,  610,  642,  611,  588,  589,  648,
			    0,  590,  591,  591,  610,  591,  611,  586,  592,  592,
			  743,  592,  590,    0,  673,  591,  590,  593,  593,    0,

			  593,  592,  610,  642,  611,  588,  591,  648,  612,    0,
			  593,  673,  592,  594,  594,  673,  594,  744,  743,  612,
			  592,  593,  595,  595,  590,  595,  594,  597,  597,  612,
			  597,  598,  598,  746,  598,  595,  593,  594,    0,  673,
			  597,  750,    0,    0,  598,  744,  595,  612,  592,  599,
			  599,  597,  599,  600,  600,  598,  600,  601,  601,  595,
			  601,  746,  599,  598,  593,  752,  600,    0,  753,  750,
			  601,  597,    0,  599,    0,    0,  694,  600,    0,  602,
			  602,  601,  602,    0,    0,  779,    0,  595,    0,  601,
			    0,  598,  602,  752,  599,  694,  753,  600,    0,  597,

			  603,  629,  603,  602,  603,  603,  603,  603,  603,  603,
			  602,  606,  606,  779,  606,  607,  607,  601,  607,    0,
			  629,  635,  599,  694,  606,  600,  639,  629,  607,  608,
			  608,  637,  608,  603,  780,  606,  784,    0,  602,  607,
			  635,  649,  608,  609,  609,  639,  609,  643,  629,    0,
			  637,  700,  635,  608,  787,  629,  609,  639,  607,  608,
			  649,    0,  780,  637,  784,  643,  643,  609,  635,  803,
			  700,  649,    0,  639,  609,    0,  670,  670,  637,  670,
			  635,    0,  787,    0,    0,  639,  607,  608,  649,  670,
			    0,  637,    0,  643,  643,    0,  806,  803,  700,  649,

			  670,    0,  609,  650,  650,  650,  650,  650,  650,  651,
			  651,  651,  651,  651,  651,  652,  652,  652,  652,  652,
			  652,  653,    0,  653,  806,    0,  653,  653,  653,  653,
			  653,  653,  654,    0,  654,    0,    0,  654,  654,  654,
			  654,  654,  654,  655,  655,  655,  655,  655,  655,  656,
			  656,  656,  656,  656,  656,  658,  658,  658,  658,  658,
			  658,  659,  659,  659,  659,  659,  659,  661,  661,  661,
			  661,  661,  661,  662,  662,  662,  662,  662,  662,    0,
			    0,    0,  655,  663,  663,  663,  663,  663,  663,  665,
			  665,  665,  665,  665,  665,    0,    0,  819,    0,  668,

			  668,  666,  668,  666,    0,  665,  666,  666,  666,  666,
			  666,  666,  668,  669,  669,    0,  669,  671,  671,    0,
			  671,  672,  672,  668,  672,  819,  669,    0,  665,  824,
			  671,    0,  695,  665,  672,  674,  674,  669,  674,  701,
			    0,  671,  668,  675,  675,  672,  675,  671,  674,  695,
			  669,  695,  676,  676,    0,  676,  675,  824,  701,  674,
			  677,  677,    0,  677,    0,  676,    0,  675,  678,  678,
			  668,  678,  680,  677,    0,  671,  676,  695,  669,  695,
			  835,  678,  679,  679,  677,  679,  701,  681,  681,  680,
			  681,  702,  678,  680,  691,  679,  682,  682,    0,  682,

			  681,  676,  683,  683,  704,  683,  679,  678,  835,  682,
			  702,  681,    0,  691,  707,  683,    0,  680,  691,  681,
			  682,  816,  844,  704,  708,  712,  683,  702,    0,  816,
			  676,  682,    0,  707,  683,  678,  732,  732,  702,  732,
			  707,  691,  816,  708,  712,    0,  691,  681,    0,  732,
			  844,  704,    0,    0,    0,    0,  702,  816,    0,  682,
			  732,  707,  683,  847,  847,  847,  847,  847,  707,    0,
			    0,  708,  712,  714,  714,  714,  714,  714,  714,  715,
			  715,  715,  715,  715,  715,  716,  716,  716,  716,  716,
			  716,  717,  717,  717,  717,  717,  717,  718,  718,  718,

			  718,  718,  718,  719,    0,  719,    0,    0,  719,  719,
			  719,  719,  719,  719,    0,    0,    0,    0,  715,  722,
			  722,  722,  722,  722,  722,  724,  724,  724,  724,  724,
			  724,  725,  725,  725,  725,  725,  725,  728,  728,  747,
			  728,  724,  726,  726,  726,  726,  726,  726,    0,  734,
			  728,    0,  729,  729,  749,  729,  854,    0,  747,  730,
			  730,  728,  730,    0,  724,  729,  734,  728,    0,  724,
			  734,    0,  730,  749,  733,  733,  729,  733,    0,  735,
			  735,  726,  735,  730,  854,    0,  747,  733,  729,    0,
			    0,  730,  735,    0,  734,  728,  736,  736,  733,  736,

			  836,  749,  836,  735,  733,  737,  737,    0,  737,  736,
			  735,  836,  745,  738,    0,    0,  729,  738,  737,  730,
			  736,  739,  740,  741,    0,  739,  740,  741,  736,  737,
			  751,  745,  733,  755,  738,  745,    0,    0,  735,  836,
			  817,    0,  739,  740,  741,  738,    0,  751,  817,  751,
			    0,  755,  755,  739,  740,  741,  736,  869,    0,  745,
			  862,  817,  862,  745,  756,  756,  756,  756,  756,  756,
			    0,  862,    0,    0,  869,  751,  817,  751,  869,  755,
			  755,  758,  758,  758,  758,  758,  758,  759,  759,  759,
			  759,  759,  759,  760,  760,  760,  760,  760,  760,  862, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  869,  756,  761,  761,  761,  761,  761,  761,
			  762,  762,  762,  762,  762,  762,  763,  763,  763,  763,
			  763,  763,  767,  767,    0,  767,  759,  765,  765,  765,
			  765,  765,  765,    0,    0,  767,  768,  768,    0,  768,
			  769,  769,  783,  769,    0,    0,  767,    0,    0,  768,
			    0,    0,    0,  769,    0,  770,  770,  767,  770,    0,
			  768,  783,  772,  772,  769,  772,  765,  774,  770,  773,
			  773,  774,  773,  775,  776,  772,  777,  775,  776,  770,
			  777,  768,  773,  785,  781,  767,  772,  770,  774,  783,
			    0,  788,  821,  773,  775,  776,    0,  777,    0,  774,

			    0,    0,  785,  781,    0,  775,  776,    0,  777,  768,
			  788,  821,    0,    0,  773,  770,  781,  789,  789,  789,
			  789,  789,  789,  791,  791,  791,  791,  791,  791,    0,
			  785,  781,    0,    0,    0,  805,    0,    0,  788,  821,
			  823,  792,  773,  792,  781,    0,  792,  792,  792,  792,
			  792,  792,  794,  794,  805,  794,  789,  795,  795,  823,
			  795,  796,  796,    0,  796,  794,  797,  797,    0,  797,
			  795,  805,  807,    0,  796,    0,  794,    0,    0,  797,
			  792,  795,  805,    0,  794,  796,    0,  823,    0,  818,
			  797,  807,  810,  810,  810,  810,  810,  810,  812,  812,

			  805,  812,  818,  807,    0,  796,  795,    0,    0,    0,
			  818,  812,  794,  813,  813,  797,  813,  814,  814,  807,
			  814,    0,  812,  818,    0,    0,  813,    0,    0,    0,
			  814,  807,    0,  796,    0,  795,    0,  813,  818,  815,
			  815,  814,  815,  812,  797,  825,  825,  825,  825,  825,
			  825,  831,  815,  826,  826,  826,  826,  826,  826,  831,
			  833,  829,  829,  815,  829,  830,  830,  832,  830,    0,
			    0,  812,  831,  833,  829,  832,    0,    0,  830,    0,
			  815,  833,    0,  839,  839,  829,  839,  831,  832,  830,
			    0,    0,  840,  840,  833,  840,  839,  830,  876,  876,

			  876,  876,  852,  832,    0,  840,    0,  839,  815,  833,
			  829,    0,    0,  852,    0,    0,  840,  846,  846,  846,
			  846,  846,  846,  852,  839,  830,  850,  850,  850,  850,
			  850,  850,  851,  851,    0,  851,  853,  876,    0,  829,
			    0,  852,    0,    0,    0,  851,    0,  853,    0,    0,
			    0,    0,  839,    0,    0,    0,  851,  853,  855,  855,
			  855,  855,  855,  855,  851,  856,  856,  856,  856,  856,
			  856,  857,  857,    0,  857,  853,  858,  859,  861,  861,
			  861,  861,  861,  861,  857,    0,    0,  858,  859,    0,
			    0,    0,  851,    0,    0,  857,    0,  858,  859,  865,

			  865,  865,  865,  865,  865,  866,  866,  866,  866,  866,
			  866,  870,    0,    0,    0,  858,  859,  867,  867,  867,
			  867,  867,  871,  871,  871,  871,  871,  871,  870,  873,
			  874,    0,  870,  872,  872,  872,  872,  872,  872,  875,
			  875,  875,  875,  875,  875,    0,  873,  874,    0,    0,
			  873,  874,    0,    0,    0,    0,  870,  879,  879,  879,
			  879,  879,  879,  880,  880,  880,  880,  880,  880,    0,
			    0,    0,    0,    0,  873,  874,  881,  881,  881,  881,
			  881,  881,  883,  883,  883,  883,  883,  883,  884,    0,
			  884,    0,    0,  884,  884,  884,  884,  884,  884,  885,

			  885,  885,  885,  885,  885,  886,  886,  886,  886,  886,
			  886,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  884,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  888,  888,  888,  888,  888,  888,  888,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,

			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  889,  889,
			  889,  889,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  890,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,

			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  891,  891,  891,  891,
			  891,  891,  891,  891,  891,  891,  892,  892,    0,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,    0,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  892,  892,  892,  893,  893,
			    0,  893,  893,  893,  893,  893,  893,  893,  893,  893,

			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  895,  895,  895,    0,    0,    0,    0,
			    0,    0,    0,  895,  895,  895,  895,    0,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,

			  895,    0,    0,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  896,  896,    0,  896,  896,    0,  896,  896,
			  896,    0,    0,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,    0,    0,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  897,  897,    0,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  898,
			  898,    0,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,    0,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,

			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,    0,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  901,    0,  901,    0,    0,
			    0,    0,  901,  901,    0,  901,  901,  901,    0,    0,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,

			  901,  901,  901,    0,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  901,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  904,  904,
			    0,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  905,    0,    0,    0,    0,  905,  905,  905,    0,    0,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,

			  905,  905,  905,    0,    0,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,    0,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  908,    0,
			    0,    0,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			    0,    0,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  909,  909,  909,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  909,  909,  909,  909,  909,  909,  909,  909,  909,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  909,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,    0,    0,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  911,  912,  912,  912,

			    0,    0,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,    0,    0,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  913,    0,  913,    0,
			    0,    0,    0,  913,  913,    0,  913,  913,  913,    0,
			    0,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,    0,    0,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  914,  914,  914,    0,    0,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,    0,

			    0,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,    0,    0,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  915,    0,  915,    0,    0,
			    0,    0,  915,  915,    0,  915,  915,  915,    0,    0,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,    0,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,    0,  916,  916,  916,  916,  916,  916,

			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  916,  916,  916,
			  916,  916,  916,  916,  916,  916,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,    0,
			    0,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  918,  918,  918,    0,    0,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,    0,    0, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  920,    0,    0,    0,    0,  920,  920,  920,
			    0,    0,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,    0,    0,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,    0,

			    0,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  922,  922,  922,    0,    0,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,    0,    0,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,    0,    0,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  924,  924,  924,    0,    0,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,

			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,    0,    0,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,

			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887, yy_Dummy>>,
			1, 315, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   78,    0,    0,  187,
			    0,   68,   71, 1278, 6222,   99, 1272, 1245, 1263, 6222,
			   91,    0, 6222, 6222, 6222, 6222, 1236,   89, 1231,   99,
			  119, 6222, 6222, 1219, 6222, 1214, 1209,  278,  282,  288,
			  121,  298,  326,  333,  348,  304,  337,  355,  427,  399,
			  364,  409,  460, 1179, 6222, 6222, 1175,  539,  618,   95,
			   93,  341,  427,  109,  441,  264,  263,  361,  456,  450,
			  458,  281, 1189, 6222, 6222, 1183,  161, 6222,  121,  369,
			  285,  445,  412,  451,  295, 6222,  423, 1130, 6222,  318,
			 1164,  540,  619, 6222,   86,  697, 6222,  168, 1144, 6222,

			 1135, 6222, 1128,    0,  696, 1119, 1117, 1087,  733, 6222,
			  688,  739,  763,  784,  794, 6222, 6222, 6222,  468,  520,
			    0,  816,  820,  824,  838,  853,  867,  873,  892,  901,
			  887,  773,  918,  940,  933,  948,  962,  976,  968, 1024,
			 1002, 1009, 1103, 1029, 1094, 1129, 1133, 1170, 1048, 1177,
			 1184, 1077,   92, 1042, 6222,  546, 1086, 1250, 1060,   83,
			   97,  249,  532, 1198,  907,  895,  850,  319,  984,  319,
			  329,  981, 1018,  339,  732, 1033, 1163,  370,  386, 1131,
			 1066, 1044,  611,  437,  731,  964, 1168, 1192, 1200,  492,
			 1229,  517, 1232,  611,  735, 1227, 1234,  738,  761,  815,

			  852,  796,  790, 1316,  846,  787, 1317,   97, 1318, 6222,
			  999, 6222,  284, 6222, 6222, 1062,  545, 1071, 1249, 1262,
			  939, 6222, 1079,  932, 6222,  496,  719, 1339, 6222,  977,
			 1341,  294, 1398,  381,  618, 1489, 6222, 6222,  948,  982,
			 6222, 6222, 6222,  940, 1280,  930,  922,  916,  906, 1280,
			  422, 6222, 1524, 1352, 1477, 1483, 6222, 1530, 1547, 1557,
			 1489, 1575, 6222,    0,  877, 1586, 1600, 1604, 1608, 1626,
			 1630, 1634, 1659, 1664, 1679, 1686, 1615, 1706, 1713, 1731,
			 1739, 1746, 1753, 1761, 1781, 1770, 1798, 1807, 1813, 1828,
			 1837, 1843, 1853, 1852, 1876, 1880, 1898, 1905, 1923, 1930,

			 1938, 1956, 1960, 1974,  857, 1972, 1985, 6222,  837,  958,
			  955,    0, 1996, 2008, 1057, 1665, 1243,  971, 2005, 1032,
			 1020, 1323, 1685, 1065, 1121, 1130, 1325, 2006, 2007, 1154,
			  791, 2017, 1889, 1869, 1166, 1204, 1207, 1215, 2018, 2021,
			 1609, 1328, 1780,    0, 1327, 1315, 1520, 2008, 1584, 1514,
			 1522, 2031, 1658, 1513, 1580,  779, 2043, 2044, 2056,    0,
			 1688,  388, 2061, 1963,  706, 2057, 1688, 2067, 2075, 2079,
			 6222,  830, 2094, 6222,  842, 1081,  825, 2099, 6222, 6222,
			 2111, 6222, 6222, 6222, 6222, 6222, 2117, 2149, 2162, 2168,
			 2174, 2180, 2202, 2186, 2208, 2225, 2234, 2240, 2246,    0,

			  783, 2268, 2272, 2286, 2290, 2304, 2320, 2334, 2342, 2349,
			 2369, 1731, 2375, 2383, 2389, 2403, 2417, 2421, 2435, 2455,
			 2108, 2388, 2465, 2477, 2501, 2517, 2531, 2551, 2557, 2487,
			 2501, 1847, 2541, 2579, 2584, 2588, 2604,  512, 2615, 2640,
			    0, 1613,  455, 2270, 2632, 1657, 2551, 1732, 1748, 2401,
			 2217,    0, 1746, 1764, 2265, 2606, 2637, 1818, 1838, 2299,
			 1839, 1836, 1847, 1873, 2526, 2617, 2607, 1907, 2638, 1907,
			 1924, 2652, 2662,    0,    0, 2314, 2319, 1962, 2001, 2644,
			 2658, 2675,  774, 2387, 2708, 2725, 2731, 2737,  712, 2743,
			 2753, 2765, 2771, 2788, 2794,  423, 2805, 2813, 2665,  486,

			  657, 2835, 2839, 2844, 2853, 2869, 2878, 2883, 2861, 2898,
			  623, 2916, 2923, 2938, 2956, 2964, 2970, 2984, 6222, 3001,
			 3009, 3015, 3031, 3044, 2329, 3053, 3067, 3071, 3093, 2883,
			  620, 1712, 1839, 6222,  869,    0,  577, 2431, 2786, 2032,
			 2496, 2051, 2065, 2858, 2706, 2114, 2549, 2874, 2900,    0,
			 2111, 2707, 2176, 2178, 2174,    0, 2882, 2978, 3066, 2179,
			 2979, 2227, 2256, 3068, 2980, 2262, 2308, 2320, 2372, 2982,
			 3060, 3127, 3133, 3139, 2654, 3146, 3152, 3163, 3173, 3179,
			 3192, 3198, 3209, 3219, 1494, 6222, 3225,    0, 3247, 3252,
			 3266, 3280, 3286, 3295, 3311, 3320, 2931, 3325, 3329, 3347,

			 3351, 3355, 3377, 3386, 6222,  605, 3409, 3413, 3427, 3441,
			 3234, 3236, 3279,  104, 6222, 6222, 1735, 1159, 2484,    0,
			 3075, 2501,    0, 3076, 3077, 2566, 2574,    0, 3172, 3386,
			 3173, 2577, 2641, 2657, 2657, 3406, 3189, 3416, 2659, 3411,
			 2768, 2829, 3241, 3432,    0, 2832, 2850, 2919, 3245, 3426,
			 3485, 3491, 3497, 3508, 3519, 3525, 3531, 3023, 3537, 3543,
			  612, 3549, 3555, 3565, 6222, 3571, 3588,    0, 3597, 3611,
			 3474, 3615, 3619, 3265, 3633, 3641, 3650, 3658, 3666, 3680,
			 3643, 3685, 3694, 3700,  578,  538,  519,  512,    0, 2910,
			 2924, 3679,    0, 3028, 3361, 3617,    0,    0,    0,  866,

			 3436, 3624, 3676,    0, 3689, 3062,    0, 3699, 3709, 3143,
			 3188, 3199, 3710,  459, 3755, 3761, 3767, 3773, 3779, 3790,
			  426, 2138, 3801, 2455, 3807, 3813, 3824,  450, 3835, 3850,
			 3857, 6222, 3734, 3872, 3820, 3877, 3894, 3903, 3884, 3892,
			 3893, 3894,  432, 3258, 3279, 3897, 3299, 3824,    0, 3839,
			 3309, 3915, 3332, 3334,    0, 3918, 3946,  361, 3963, 3969,
			 3975, 3986, 3992, 3998, 6222, 4009,    0, 4020, 4034, 4038,
			 4053, 6222, 4060, 4067, 4038, 4044, 4045, 4047, 2793, 3348,
			 3387, 4069,    0, 4027, 3402, 4068,    0, 3407, 4076, 4099,
			  350, 4105, 4128,    0, 4150, 4155, 4159, 4164,  521, 6222,

			 1931,  305, 6222, 3435,  947, 4120, 3450, 4157,  965, 2091,
			 4174,  688, 4196, 4211, 4215, 4237, 3692, 3911, 4173, 3550,
			    0, 4077,    0, 4125, 3586, 4227, 4235,    0,  234, 4259,
			 4263, 4222, 4238, 4244,  979, 3646, 3887,    0, 3104, 4281,
			 4290,  278,  271,  696, 3679,    0, 4299, 3745, 6222,  707,
			 4308, 4330, 4273, 4307, 3822, 4340, 4347, 4369, 4347, 4348,
			    0, 4360, 3947,  144,  126, 4381, 4387, 4399, 6222, 3928,
			 4382, 4404, 4415, 4400, 4401, 4421, 4285, 6222, 6222, 4439,
			 4445, 4458, 6222, 4464, 4475, 4481, 4487, 6222, 4527, 4579,
			 4631, 4683, 4735, 4787, 4823, 4861, 4906, 4956, 5008, 5060,

			 5112, 5163, 5213, 5265, 5317, 5363, 5413, 5465, 5510, 5559,
			 5594, 5644, 5685, 5734, 5784, 5833, 5883, 5919, 5958, 5992,
			 6025, 6059, 6098, 6132, 6171, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  887,    1,  888,  888,  889,  889,  890,  890,  887,
			    9,  891,  891,  887,  887,  887,  887,  887,  892,  887,
			  893,  894,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  896,  887,  887,  897,  887,  887,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,  887,  887,  887,  898,  887,  887,  887,  898,
			  898,  898,  898,  898,  899,  887,  899,  900,  887,  901,
			  887,  901,  901,  887,  902,  903,  887,  887,  887,  887,

			  892,  887,  904,  904,  904,  905,  906,  887,  887,  887,
			  887,  907,  887,  887,  887,  887,  887,  887,  887,  895,
			  908,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,   48,
			  895,  895,  895,  895,   48,  895,  895,  895,  895,  895,
			  895,  896,  896,  897,  887,  887,  887,   58,  887,  157,
			  157,  157,   58,   58,   58,   58,   58,  157,   58,  157,
			  157,   58,   58,  157,  157,   58,   58,  157,  157,   58,
			   58,  157,   58,  157,  157,  157,   58,   58,   58,  157,
			   58,  157,   58,  157,  157,   58,   58,  157,  157,   58,

			   58,  157,  157,   58,   58,  157,   58,  157,   58,  887,
			  898,  887,  887,  887,  887,  898,  898,  898,  898,  898,
			  899,  887,  899,  900,  887,  900,  901,  901,  887,  887,
			  887,  887,  887,  887,  902,  903,  887,  887,  235,  909,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  910,  908,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  887,  895,  895,  895,
			  895,  895,  895,  895,  895,  887,  895,  286,  286,  286,
			  286,  142,  142,  142,  895,  895,  895,  895,  895,  895,

			  895,  895,  895,  895,  887,  896,  896,  887,  887,  157,
			  157,  157,  887,  157,   58,   58,   58,  157,   58,  157,
			  157,   58,   58,  157,  157,  157,   58,   58,   58,  157,
			  157,   58,   58,  887,  157,  157,  157,  157,   58,   58,
			   58,  157,   58,  157,   58,  157,  157,   58,   58,  157,
			  157,   58,   58,  157,  157,  157,   58,   58,   58,  157,
			   58,  157,   58,  898,  898,  898,  898,  898,  898,  898,
			  887,  911,  911,  887,  911,  911,  911,  909,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  912,

			  908,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  887,  895,  895,  895,  895,  895,  895,  895,  887,
			  286,  142,  286,  139,  286,  139,  887,  286,  286,  895,
			  895,  887,  895,  895,  895,  895,  895,  913,  896,  896,
			  914,  157,  157,   58,   58,  157,   58,  157,  157,   58,
			   58,  157,  157,  157,   58,   58,   58,  157,  157,   58,
			  157,  157,  157,  157,   58,   58,   58,  157,   58,  157,
			  157,   58,   58,  157,  157,   58,   58,  157,  157,  157,
			   58,   58,  157,   58,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  907,  887,  887,  887,

			  912,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  887,  895,  895,  895,  895,  895,  895,  895,  887,  286,
			  286,  887,  286,  522,  887,  895,  895,  895,  895,  910,
			  887,  915,  913,  887,  887,  157,  157,   58,   58,  157,
			   58,  157,  157,   58,   58,  157,  157,   58,   58,  157,
			  157,   58,  157,  157,  157,  157,   58,   58,   58,  157,
			   58,  157,  157,   58,   58,  157,  157,  157,  157,   58,
			   58,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  916,  917,  895,  895,
			  895,  895,  895,  895,  895,  895,  887,  895,  895,  895,

			  895,  895,  895,  286,  887,  887,  895,  895,  895,  895,
			  887,  912,  912,  915,  887,  887,  887,  887,  157,  157,
			   58,  157,  157,   58,   58,  157,  157,  157,   58,   58,
			   58,  157,  157,  157,  157,   58,   58,   58,  157,   58,
			  157,  157,   58,   58,  157,  157,  157,  157,   58,   58,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  918,  895,  895,
			  895,  895,  895,  887,  895,  895,  895,  895,  895,  895,
			  887,  895,  895,  895,  887,  887,  912,  912,  919,  157,
			  157,   58,  157,  157,   58,   58,  157,  157,  157,  157,

			   58,   58,   58,  157,   58,  157,  157,   58,   58,  157,
			  157,  157,   58,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  918,  895,  895,
			  895,  887,  895,  895,  887,  895,  895,  895,  887,  887,
			  917,  917,  920,  157,  157,   58,  157,   58,  157,   58,
			  157,   58,  157,  157,  157,   58,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  921,  895,  895,  895,
			  895,  887,  895,  895,  887,  887,  918,  918,  887,  157,
			  157,   58,  157,   58,  157,   58,  157,  157,   58,  887,
			  887,  887,  887,  922,  895,  895,  895,  895,  887,  887,

			  918,  918,  887,  157,  157,   58,  157,   58,  157,  887,
			  887,  922,  895,  895,  895,  895,  887,  887,  918,  157,
			  157,   58,  157,   58,  157,  887,  887,  923,  887,  895,
			  895,  887,  887,  918,  157,  157,  887,  924,  887,  895,
			  895,  887,  887,  918,  157,  157,  887,  887,  887,  924,
			  887,  895,  887,  887,  157,  887,  887,  895,  887,  887,
			  157,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,    0,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,

			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  887,  887,  887,  887,  887, yy_Dummy>>)
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
			    0,    0,    0,  133,  131,    1,    2,   15,  115,   18,
			  131,   16,   17,    7,    6,   13,    5,   11,    8,  106,
			  106,   14,   12,   29,   10,   30,   20,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   83,   98,
			   98,   98,   98,   22,   31,   23,    9,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,   24,   21,   25,  119,  120,  121,  122,  119,
			  119,  119,  119,  119,  132,  104,  132,  132,  132,  132,
			   70,  132,  132,   72,  132,  132,   97,    1,    2,   28,

			  115,  114,  129,  129,  129,    0,    3,   33,  110,   32,
			    0,    0,  106,    0,  106,   27,   26,   19,    0,   98,
			   92,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   40,   98,
			   91,   91,   82,   91,   91,   98,   98,   98,   98,   98,
			   98,    0,    0,    0,  105,    0,    0,  101,    0,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,   40,  101,   40,  101,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  102,
			  119,  121,  120,  117,  116,  118,  119,  119,  119,  119,
			    0,  104,    0,    0,  103,    0,    0,    0,   72,   70,
			    0,   69,    0,   68,    0,    0,   97,   95,   95,    0,
			   96,  129,  123,  129,  129,  129,  129,  129,  129,    0,
			    4,   34,  110,    0,    0,    0,  108,  110,  108,  106,
			    0,    0,   92,    0,    0,   98,   98,   39,   98,   98,
			   98,   98,   98,   98,   98,   98,    0,   98,   98,   98,
			   98,   98,   42,   98,   98,    0,   83,   84,   83,   83,
			   83,   90,   98,   90,   90,   90,   98,   98,   98,   98,

			   98,   98,   41,   98,    0,    0,    0,  100,    0,  101,
			  101,   39,   73,   73,  101,  101,   39,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,    0,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,   42,   42,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,   41,
			   41,  101,  101,  119,  119,  119,  119,  119,  119,  119,
			  103,    0,    0,   71,   69,   68,   72,    0,  127,  130,
			  130,  128,  124,  125,  126,   93,  110,    0,  110,    0,
			    0,  110,    0,    0,    0,  109,  106,    0,    0,    0,

			   99,   98,   98,   98,   98,   98,   38,   98,   98,   98,
			   98,    0,   98,   98,   98,   98,   98,   98,   98,    0,
			   98,   82,   98,   98,   98,   98,    0,   82,   82,   82,
			   37,    0,   44,   98,   98,   98,   98,   67,    0,    0,
			   63,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,   38,  101,  101,   38,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,   37,   44,   37,   44,  101,  101,  101,
			  101,  101,  101,  101,  110,  110,    0,    0,  107,  110,
			    0,  109,    0,  109,    0,    0,    0,  106,   79,    0,

			    0,   60,   98,   98,   98,   98,   98,   98,   45,   98,
			    0,   98,   98,   98,   36,   98,   98,   98,   84,   84,
			   83,    0,   98,   98,    0,   98,   98,   98,   98,    0,
			   67,   67,    0,   66,   66,   60,  101,   60,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,   45,
			  101,   45,  101,  101,  101,   36,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,    0,  110,    0,  113,  110,  109,    0,    0,  109,
			    0,    0,  108,    0,    0,   79,    0,    0,   98,   61,
			   98,   62,   98,   98,   47,   98,    0,   98,   98,   98,

			   98,   98,   98,   98,   82,    0,   53,   98,   98,   98,
			    0,    0,    0,    0,   65,   64,    0,    0,  101,   61,
			   61,  101,   62,  101,   62,  101,  101,   47,  101,  101,
			   47,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,   53,  101,  101,  101,   53,  101,
			    0,  110,    0,    0,    0,  109,    0,  113,  109,    0,
			   81,    0,    0,    0,  111,  113,  111,    0,   98,   98,
			   59,   98,   46,    0,   43,   58,   98,   35,   98,   51,
			    0,   98,   98,   98,    0,    0,    0,    0,    0,  101,
			  101,  101,   59,  101,   59,  101,   46,   43,   58,  101,

			   43,   58,  101,   35,   35,  101,   51,  101,   51,  101,
			  101,  101,  101,  113,    0,  113,    0,  109,    0,    0,
			  112,    0,    0,   78,  113,    0,  112,    0,   98,   98,
			   98,   87,   54,   98,    0,   98,   98,   55,    0,    0,
			    0,    0,    0,  101,  101,  101,  101,  101,   54,   54,
			  101,  101,  101,  101,   55,  101,  113,  112,    0,  112,
			    0,    0,    0,    0,   78,  112,    0,   98,   98,   48,
			   98,   86,   52,   98,    0,    0,    0,    0,    0,  101,
			  101,  101,   48,   48,  101,  101,   52,  101,   52,  112,
			   80,    0,   78,    0,   98,   98,   98,   98,   85,   85,

			   85,   85,   94,  101,  101,  101,  101,  101,  101,    0,
			    0,    0,   98,   50,   49,   98,    0,    0,    0,  101,
			   50,   50,   49,   49,  101,    0,    0,    0,    0,   98,
			   98,    0,    0,    0,  101,  101,   77,    0,    0,   98,
			   56,    0,    0,    0,  101,   56,    0,    0,   77,    0,
			   74,   98,    0,    0,  101,    0,    0,   57,    0,    0,
			   57,    0,   76,    0,    0,    0,    0,    0,   76,    0,
			    0,    0,    0,    0,    0,    0,   75,   88,   89,    0,
			    0,    0,   75,    0,   75,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6222
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 887
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 888
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
