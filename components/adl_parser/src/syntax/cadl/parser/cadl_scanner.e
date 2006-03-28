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
if yy_act <= 58 then
if yy_act <= 29 then
if yy_act <= 15 then
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
--|#line 86 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 86")
end
last_token := Exclamation_code
end
end
end
else
if yy_act <= 22 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 87 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 87")
end
last_token := Left_parenthesis_code
else
--|#line 88 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 88")
end
last_token := Right_parenthesis_code
end
else
if yy_act = 18 then
--|#line 89 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 89")
end
last_token := Dollar_code
else
--|#line 91 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 91")
end
last_token := SYM_DT_UNKNOWN
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 92 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 92")
end
last_token := Question_mark_code
else
--|#line 94 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 94")
end
last_token := SYM_INTERVAL_DELIM
end
else
--|#line 96 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 96")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 26 then
if yy_act <= 24 then
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
else
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
end
else
if yy_act <= 28 then
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
else
--|#line 106 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 106")
end
last_token := SYM_LT
end
end
end
end
else
if yy_act <= 44 then
if yy_act <= 37 then
if yy_act <= 33 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 107 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 107")
end
last_token := SYM_GT
else
--|#line 109 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 109")
end
last_token := SYM_MODULO
end
else
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
end
else
if yy_act <= 35 then
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
else
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
end
end
else
if yy_act <= 41 then
if yy_act <= 39 then
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
else
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
end
else
if yy_act <= 43 then
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
else
--|#line 137 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 137")
end
last_token := SYM_TRUE
end
end
end
else
if yy_act <= 51 then
if yy_act <= 48 then
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
else
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
--|#line 153 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 153")
end
last_token := SYM_ORDERED
end
end
else
if yy_act <= 55 then
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
else
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
--|#line 167 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 167")
end
last_token := SYM_INCLUDE
end
end
end
end
end
else
if yy_act <= 87 then
if yy_act <= 73 then
if yy_act <= 66 then
if yy_act <= 62 then
if yy_act <= 60 then
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
else
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
end
else
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
end
else
if yy_act <= 70 then
if yy_act <= 68 then
if yy_act = 67 then
--|#line 244 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 244")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 250 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 250")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
end
else
if yy_act = 69 then
--|#line 257 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 257")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 265 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 265")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 72 then
if yy_act = 71 then
--|#line 272 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 272")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 279 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 279")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
--|#line 291 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 291")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 80 then
if yy_act <= 77 then
if yy_act <= 75 then
if yy_act = 74 then
--|#line 296 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 296")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 300 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 300")
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
if yy_act = 76 then
--|#line 332 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 332")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 337 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 337")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 79 then
if yy_act = 78 then
--|#line 342 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 342")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 348 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 348")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
--|#line 354 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 354")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
end
else
if yy_act <= 84 then
if yy_act <= 82 then
if yy_act = 81 then
--|#line 360 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 360")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
else
--|#line 364 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 364")
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
else
if yy_act = 83 then
--|#line 374 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 374")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 381 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 381")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
else
if yy_act <= 86 then
if yy_act = 85 then
--|#line 386 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 386")
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
--|#line 401 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 401")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
--|#line 402 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 402")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
end
else
if yy_act <= 102 then
if yy_act <= 95 then
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act = 88 then
--|#line 403 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 403")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_end := yy_end - 1
--|#line 407 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 407")
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
if yy_act = 90 then
--|#line 408 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 408")
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
--|#line 409 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 409")
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
if yy_act <= 93 then
if yy_act = 92 then
--|#line 429 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 429")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 433 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 433")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
if yy_act = 94 then
--|#line 439 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 439")
end
in_buffer.append_character ('\')
else
--|#line 440 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 440")
end
in_buffer.append_character ('"')
end
end
end
else
if yy_act <= 99 then
if yy_act <= 97 then
if yy_act = 96 then
--|#line 441 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 441")
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
--|#line 455 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 455")
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
else
if yy_act = 98 then
--|#line 469 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 469")
end
in_buffer.append_string (text)
else
--|#line 471 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 471")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
end
end
else
if yy_act <= 101 then
if yy_act = 100 then
--|#line 476 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 476")
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
--|#line 487 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 487")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
end
end
else
if yy_act <= 109 then
if yy_act <= 106 then
if yy_act <= 104 then
if yy_act = 103 then
--|#line 496 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 496")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 497 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 497")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 105 then
--|#line 498 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 498")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 499 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 499")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
end
else
if yy_act <= 108 then
if yy_act = 107 then
--|#line 500 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 500")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 501 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 501")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
--|#line 502 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 502")
end
last_token := V_CHARACTER; last_character_value := '"'
end
end
else
if yy_act <= 113 then
if yy_act <= 111 then
if yy_act = 110 then
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
else
--|#line 508 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 508")
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
if yy_act = 112 then
--|#line 518 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 518")
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
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 115 then
if yy_act = 114 then
--|#line 529 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 529")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 533 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 533")
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
			create an_array.make (0, 5028)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   14,   19,
			   14,   20,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   37,   39,   40,   37,   41,   42,   37,   43,   44,   45,
			   46,   37,   37,   37,   47,   48,   37,   49,   50,   51,
			   52,   53,   54,   14,   55,   56,   57,   56,   58,   59,
			   56,   60,   61,   56,   62,   63,   64,   56,   56,   56,
			   56,   65,   66,   56,   67,   68,   69,   70,   71,   73,
			   73,   78,   78,   74,   74,   88,   75,   75,   90,  708,
			   90,   90,   96,   97,  100,  702,  101,  103,  322,  104,

			  646,  105,  110,  110,  498,  110,   88,  110,  110,  342,
			  110,  342,   79,   79,  343,  110,  110,  191,  110,  191,
			  191,  202,  203,  112,  202,  128,   76,   76,  112,  201,
			  189,  493,   98,  211,  106,  274,  112,  274,   89,  106,
			   80,   80,   81,   82,   83,   81,   82,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   84,   89,
			   81,  134,   81,   81,   81,   81,   81,   81,  111,  131,
			  205,  188,  167,  190,  132,  141,  110,  110,  141,  110,
			  141,  666,  159,  193,  141,  321,  212,  141,  134,  616,
			   81,   81,   86,   81,  431,  111,  131,  112,  145,  168,

			  644,  132,  145,  207,  207,  145,  207,  145,  610,  160,
			  113,  145,  114,  145,  145,  194,  193,   81,   81,   81,
			   81,   82,   83,   81,   82,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   84,  113,   81,  114,
			   81,   81,   81,   81,   81,   81,  110,  110,  610,  110,
			  139,  110,  110,  139,  110,  608,  110,  110,  195,  110,
			  140,  141,  110,  110,  423,  110,  333,  112,   81,   81,
			   86,   81,  112,  169,  334,  335,  115,  112,  211,  189,
			  116,  118,  642,  112,  110,  110,  627,  110,  145,  110,
			  110,  117,  110,  119,  120,   81,   81,   81,  110,  110,

			  170,  110,  197,  115,  236,  112,  626,  116,  118,  124,
			  112,  557,  613,  110,  110,  237,  110,  231,  117,  112,
			  119,  120,  190,  557,  121,  122,  110,  110,  232,  110,
			  123,  212,  611,  198,  112,  125,  124,  200,  110,  110,
			  126,  110,  237,  135,  135,  149,  606,  112,  135,  135,
			  233,  121,  122,  127,  141,  232,  141,  123,  129,  112,
			  684,  199,  125,  684,  141,  179,  130,  126,  198,  550,
			  180,  189,  150,  189,  145,  133,  203,  203,  333,  203,
			  127,  145,  550,  145,  135,  129,  334,  335,  151,  145,
			  141,  145,  181,  130,  422,  558,  199,  182,   90,  152,

			   90,   90,  133,  139,  206,  203,  139,  206,  145,  556,
			  555,  135,  135,  140,  190,  153,  190,  145,  207,  208,
			  268,  141,  142,  145,  209,  205,  154,  423,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  143,  141,  144,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  269,  551,  505,  205,  141,  145,  145,  146,  145,  145,
			  145,  145,  145,  145,  147,  145,  148,  145,  145,  145,
			  145,  145,  146,  145,  145,  145,  145,  155,  430,  496,
			  141,  110,  110,  141,  110,  171,  141,  141,  141,  156,
			  161,  162,  141,  141,  494,  141,  163,  488,  172,  183,

			  175,  432,  112,  351,  157,  141,  145,  145,  176,  428,
			  145,  431,  173,  145,  145,  145,  158,  164,  165,  145,
			  145,  145,  145,  166,  141,  174,  184,  177,  103,  103,
			  423,  104,  145,  238,  490,  178,  141,  110,  110,  489,
			  110,  110,  110,  139,  110,  185,  139,  209,  209,  139,
			  209,  145,  139,  140,  191,  433,  191,  191,  112,  140,
			  248,  139,  112,  145,  139,  350,  106,  229,  248,  229,
			  229,  140,  186,  188,  188,  429,  188,  188,  188,  189,
			  192,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  193,

			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  188,  190,  188,  188,  188,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  188,  188,
			  188,  206,  203,  221,  206,  110,  110,  222,  110,  110,
			  110,  425,  110,  424,  197,  207,  223,  110,  110,  343,
			  110,  209,  420,  492,  327,  327,  112,  327,  110,  110,
			  112,  110,  110,  110,  330,  110,  495,  241,  112,  240,
			  417,  110,  110,  378,  110,  198,  224,  215,  377,  112,

			  205,  214,  214,  112,  214,  225,  493,  189,  352,  345,
			  139,  226,  112,  139,  241,  227,  240,  228,  252,  431,
			  140,  262,  242,  199,  215,  246,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  262,  242,
			  190,  349,  246,  349,  110,  110,  350,  110,  344,  110,
			  110,  294,  110,  139,  326,  418,  139,  326,  453,  453,
			  340,  453,  339,  140,  320,  112,  338,  216,  217,  217,
			  112,  217,  217,  217,  217,  219,  217,  217,  218,  217,
			  217,  217,  217,  217,  217,  217,  217,  220,  217,  217,

			  217,  217,  217,  217,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  217,  217,  217,  217,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  217,  217,  217,  110,  110,  337,  110,
			  110,  110,  336,  110,  110,  110,  332,  110,  110,  110,
			  200,  110,  141,  110,  110,  331,  110,  112,  103,  421,
			  104,  112,  351,  330,  141,  112,  427,  244,  427,  112,
			  487,  428,  328,  245,  112,  110,  110,  243,  110,  145,

			  250,  198,  139,  251,  247,  139,  249,  110,  110,  711,
			  110,  145,  140,  201,  244,  106,  112,  487,  110,  110,
			  245,  110,  110,  110,  243,  110,  189,  250,  112,  199,
			  251,  247,  139,  249,  128,  139,  272,  253,  189,  112,
			  290,  271,  140,  112,  257,  255,  141,  270,  258,  254,
			  256,  259,  111,  110,  110,  138,  110,  260,  141,  110,
			  110,  268,  110,  272,  253,  110,  110,  239,  110,  550,
			  234,  257,  255,  145,  112,  258,  254,  256,  259,  111,
			  112,  230,  261,  390,  260,  145,  112,  110,  110,  229,
			  110,  218,  263,   94,  265,  360,  264,  110,  110,  491,

			  110,  139,  423,  274,  139,  275,  360,   91,  112,  261,
			  497,  140,  141,  141,  141,  201,  360,  273,  112,  263,
			  141,  265,  272,  264,  141,  141,  141,  266,  139,  273,
			  554,  139,  141,  360,  141,  278,  187,  497,  140,  145,
			  145,  145,  138,  267,  277,  139,  141,  145,  139,  276,
			  280,  145,  145,  145,  266,  140,  273,  139,  440,  145,
			  139,  145,  279,  493,  141,  109,  281,  140,  278,  440,
			  267,  139,  282,  145,  139,  139,  141,  283,  139,  440,
			  141,  140,  141,  108,  281,  140,  280,  107,  102,  286,
			  282,  145,  141,  284,  141,  278,  440,  287,  139,  285,

			  368,  139,   99,  145,   94,  286,  557,  145,  140,  145,
			  111,  281,   92,  280,  141,  287,  288,  282,   91,  145,
			  139,  145,  141,  139,  289,  711,  141,  291,  327,  327,
			  140,  327,  286,  141,  141,  292,  291,  111,  293,  431,
			  141,  145,  287,  110,  110,  141,  110,  292,  294,  145,
			  293,  711,  141,  145,  295,  711,  139,  298,  141,  139,
			  145,  145,  296,  291,  112,  297,  140,  145,  139,  711,
			  141,  139,  145,  139,  292,  300,  139,  293,  140,  145,
			  141,  711,  302,  140,  299,  145,  139,  202,  203,  139,
			  202,  141,  141,  711,  303,  552,  140,  145,  298,  711,

			  302,  139,  301,  141,  139,  139,  711,  145,  139,  304,
			  300,  140,  141,  610,  303,  140,  306,  233,  145,  145,
			  141,  305,  552,  139,  141,  298,  139,  302,  110,  110,
			  145,  110,  141,  140,  306,  711,  205,  300,  307,  145,
			  711,  303,  141,  308,  307,  139,  493,  145,  139,  112,
			  310,  145,  141,  189,  311,  140,  310,  355,  141,  145,
			  311,  306,  312,  139,  141,  309,  139,  316,  641,  145,
			  141,  307,  139,  140,  312,  139,  711,  313,  141,  145,
			  711,  314,  140,  310,  355,  145,  643,  311,  711,  315,
			  141,  145,  203,  203,  317,  203,  190,  145,  711,  318,

			  711,  312,  341,  316,  346,  145,  139,  206,  203,  139,
			  206,  206,  203,  232,  206,  347,  140,  145,  318,  423,
			  141,  207,  274,  711,  275,  207,  319,  209,  711,  711,
			  316,  209,  379,  110,  110,  233,  110,  348,  711,  711,
			  232,  205,  347,  139,  711,  318,  139,  145,  711,  209,
			  209,  368,  209,  140,  112,  711,  205,  711,  711,  380,
			  205,  323,  324,  325,  323,  324,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  207,  110,  110,  323,
			  110,  323,  326,  323,  323,  323,  323,  110,  110,  711,
			  110,  139,  110,  110,  139,  110,  110,  110,  112,  110,

			  549,  140,  549,  110,  110,  550,  110,  141,  112,  323,
			  323,  205,  323,  112,  353,  711,  711,  112,  399,  141,
			  354,  356,  110,  110,  112,  110,  647,  606,  110,  110,
			  361,  110,  110,  110,  145,  110,  323,  323,  323,  214,
			  214,  353,  214,  112,  711,  399,  145,  354,  356,  112,
			  369,  711,  711,  112,  359,  453,  453,  361,  453,  431,
			  423,  363,  215,  357,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  110,  110,  363,  110,
			  357,  110,  110,  711,  110,  110,  110,  711,  110,  110,

			  110,  667,  110,  110,  110,  711,  110,  112,  110,  110,
			  711,  110,  112,  711,  711,  216,  112,  711,  110,  110,
			  112,  110,  711,  141,  112,  362,  365,  358,  364,  112,
			  110,  110,  384,  110,  493,  141,  370,  367,  491,  112,
			  110,  110,  613,  110,  110,  110,  366,  110,  644,  553,
			  145,  112,  362,  365,  358,  364,  711,  110,  110,  387,
			  110,  112,  145,  612,  367,  112,  371,  110,  110,  372,
			  110,  110,  110,  366,  110,  431,  553,  711,  112,  110,
			  110,  493,  110,  373,  139,  348,  711,  139,  112,  711,
			  612,  711,  112,  371,  140,  139,  372,  374,  139,  141,

			  112,  711,  381,  139,  139,  140,  139,  139,  711,  139,
			  373,  141,  139,  140,  140,  559,  711,  559,  375,  140,
			  557,  379,  711,  381,  374,  376,  145,  141,  141,  382,
			  421,  383,  383,  203,  203,  141,  203,  711,  145,  141,
			  141,  232,  711,  384,  385,  385,  139,  141,  379,  139,
			  381,  389,  376,  141,  145,  145,  140,  271,  386,  383,
			  711,  711,  145,  233,  360,  141,  145,  145,  232,  711,
			  384,  388,  385,  139,  145,  360,  139,  711,  391,  390,
			  145,  139,  205,  140,  139,  360,  139,  389,  711,  139,
			  139,  140,  145,  139,  141,  711,  140,  141,  711,  141,

			  140,  141,  360,  392,  141,  394,  141,  392,  393,  141,
			  141,  141,  399,  141,  389,  393,  141,  139,  711,  394,
			  139,  145,  141,  395,  145,  711,  145,  140,  145,  711,
			  396,  145,  398,  145,  392,  397,  145,  145,  145,  400,
			  145,  139,  393,  145,  139,  141,  394,  711,  711,  145,
			  395,  140,  141,  711,  141,  711,  402,  141,  139,  139,
			  401,  139,  139,  401,  141,  405,  141,  711,  140,  140,
			  402,  711,  145,  141,  711,  711,  711,  406,  711,  145,
			  711,  145,  711,  404,  145,  141,  139,  401,  406,  139,
			  403,  145,  407,  145,  405,  139,  140,  402,  139,  139,

			  145,  141,  139,  711,  408,  140,  141,  711,  711,  140,
			  141,  711,  145,  141,  139,  406,  410,  139,  141,  711,
			  409,  405,  141,  711,  140,  409,  711,  141,  145,  607,
			  711,  607,  711,  145,  608,  410,  411,  145,  711,  141,
			  145,  324,  325,  413,  324,  145,  426,  412,  414,  145,
			  411,  568,  409,  139,  145,  207,  139,  347,  711,  711,
			  414,  326,  410,  140,  110,  110,  145,  110,  568,  711,
			  110,  110,  568,  110,  711,  415,  711,  110,  110,  348,
			  110,  711,  369,  139,  347,  112,  139,  414,  189,  711,
			  205,  112,  111,  140,  141,  568,  111,  435,  112,  110,

			  110,  416,  110,  711,  110,  110,  141,  110,  416,  416,
			  416,  416,  416,  416,  434,  711,  457,  711,  711,  111,
			  112,  145,  711,  111,  435,  112,  110,  110,  711,  110,
			  711,  190,  711,  145,  416,  416,  416,  416,  416,  416,
			  416,  434,  436,  457,  711,  711,  437,  112,  139,  110,
			  110,  139,  110,  711,  711,  438,  110,  110,  140,  110,
			  110,  110,  711,  110,  110,  110,  609,  110,  609,  436,
			  112,  610,  711,  437,  439,  110,  110,  112,  110,  711,
			  711,  112,  438,  110,  110,  112,  110,  139,  711,  441,
			  139,  110,  110,  615,  110,  615,  112,  140,  616,  139,

			  443,  439,  139,  442,  112,  110,  110,  370,  110,  140,
			  711,  444,  112,  711,  561,  445,  441,  111,  711,  110,
			  110,  111,  110,  711,  111,  562,  112,  443,  711,  460,
			  442,  446,  110,  110,  711,  110,  110,  110,  444,  110,
			  112,  711,  445,  455,  111,  447,  110,  110,  111,  110,
			  711,  111,  562,  112,  141,  711,  460,  112,  446,  110,
			  110,  711,  110,  711,  491,  711,  141,  112,  110,  110,
			  455,  110,  447,  455,  449,  347,  141,  711,  141,  448,
			  112,  145,  139,  452,  450,  139,  457,  141,  141,  112,
			  141,  711,  140,  145,  459,  451,  711,  348,  711,  141,

			  456,  449,  347,  145,  460,  145,  448,  711,  711,  139,
			  711,  450,  139,  458,  145,  145,  711,  145,  711,  140,
			  139,  461,  451,  139,  141,  459,  145,  711,  463,  139,
			  140,  462,  139,  711,  139,  711,  141,  139,  463,  140,
			  139,  141,  711,  139,  140,  464,  139,  711,  711,  139,
			  140,  145,  459,  141,  711,  465,  140,  711,  141,  467,
			  711,  139,  466,  145,  139,  463,  466,  141,  145,  711,
			  141,  140,  464,  711,  711,  711,  468,  467,  468,  141,
			  145,  139,  469,  141,  139,  145,  471,  141,  711,  466,
			  473,  140,  711,  470,  145,  141,  711,  145,  711,  141,

			  141,  475,  475,  468,  467,  472,  145,  141,  139,  469,
			  145,  139,  141,  473,  145,  476,  620,  474,  140,  141,
			  139,  711,  145,  139,  141,  711,  145,  145,  475,  477,
			  140,  711,  711,  620,  145,  139,  141,  620,  139,  145,
			  473,  711,  478,  141,  139,  140,  145,  139,  476,  139,
			  141,  145,  139,  480,  140,  141,  711,  452,  711,  140,
			  620,  479,  141,  145,  711,  711,  139,  141,  711,  139,
			  145,  711,  480,  711,  481,  476,  140,  145,  479,  141,
			  484,  452,  145,  110,  110,  482,  110,  711,  483,  145,
			  110,  110,  139,  110,  145,  139,  711,  711,  645,  480,

			  645,  481,  140,  646,  112,  479,  145,  110,  110,  711,
			  110,  112,  482,  485,  711,  110,  110,  711,  110,  711,
			  485,  485,  485,  485,  485,  485,  500,  711,  112,  139,
			  711,  711,  139,  711,  499,  501,  112,  110,  110,  140,
			  110,  711,  110,  110,  502,  110,  485,  485,  485,  485,
			  485,  485,  485,  500,  110,  110,  503,  110,  112,  711,
			  693,  141,  501,  112,  110,  110,  711,  110,  693,  110,
			  110,  502,  110,  141,  711,  112,  504,  110,  110,  518,
			  110,  693,  507,  503,  711,  112,  110,  110,  145,  110,
			  112,  110,  110,  506,  110,  693,  110,  110,  112,  110,

			  145,  139,  508,  504,  139,  110,  110,  112,  110,  507,
			  711,  140,  112,  139,  711,  509,  139,  112,  110,  110,
			  506,  110,  711,  140,  141,  511,  112,  110,  110,  508,
			  110,  510,  110,  110,  512,  110,  141,  711,  516,  112,
			  711,  537,  509,  141,  711,  711,  614,  513,  112,  516,
			  519,  145,  511,  112,  520,  141,  711,  612,  510,  517,
			  711,  512,  139,  145,  519,  139,  711,  514,  537,  515,
			  145,  711,  140,  711,  513,  139,  516,  139,  139,  348,
			  139,  521,  145,  141,  612,  140,  522,  140,  141,  141,
			  711,  711,  523,  529,  514,  141,  515,  711,  520,  711,

			  141,  141,  139,  522,  524,  139,  523,  711,  711,  711,
			  145,  139,  140,  525,  139,  145,  145,  711,  524,  526,
			  532,  140,  145,  141,  711,  520,  530,  145,  145,  139,
			  522,  527,  139,  523,  141,  141,  528,  711,  139,  140,
			  529,  139,  531,  141,  711,  524,  141,  535,  140,  139,
			  145,  711,  139,  533,  141,  141,  711,  530,  538,  140,
			  581,  145,  145,  528,  141,  139,  141,  529,  139,  534,
			  145,  531,  141,  145,  536,  140,  141,  711,  535,  537,
			  139,  145,  145,  139,  530,  540,  139,  582,  711,  139,
			  140,  145,  139,  145,  538,  139,  140,  139,  531,  145,

			  139,  711,  140,  145,  141,  535,  539,  140,  541,  541,
			  141,  711,  711,  711,  542,  542,  141,  110,  110,  578,
			  110,  538,  141,  110,  110,  711,  110,  711,  711,  711,
			  578,  145,  543,  711,  544,  545,  541,  145,  112,  579,
			  579,  546,  542,  145,  112,  711,  711,  711,  563,  145,
			  579,  711,  711,  711,  711,  110,  110,  578,  110,  543,
			  579,  544,  547,  110,  110,  711,  110,  141,  711,  547,
			  547,  547,  547,  547,  547,  563,  112,  579,  584,  141,
			  564,  711,  110,  110,  112,  110,  711,  110,  110,  711,
			  110,  711,  565,  711,  145,  547,  547,  547,  547,  547,

			  547,  547,  711,  112,  711,  586,  145,  564,  112,  110,
			  110,  711,  110,  110,  110,  711,  110,  711,  566,  565,
			  698,  567,  110,  110,  711,  110,  110,  110,  698,  110,
			  112,  711,  110,  110,  112,  110,  711,  110,  110,  711,
			  110,  698,  570,  112,  711,  566,  139,  112,  567,  139,
			  569,  110,  110,  112,  110,  698,  140,  711,  112,  110,
			  110,  573,  110,  139,  571,  574,  139,  572,  705,  570,
			  711,  580,  112,  140,  711,  110,  110,  569,  110,  705,
			  112,  711,  110,  110,  711,  110,  711,  139,  573,  705,
			  139,  571,  574,  711,  572,  141,  112,  140,  580,  575,

			  711,  139,  576,  112,  139,  139,  705,  141,  139,  141,
			  577,  140,  581,  583,  711,  140,  711,  139,  711,  711,
			  139,  141,  145,  711,  711,  139,  575,  140,  139,  576,
			  583,  711,  711,  711,  145,  140,  145,  577,  141,  581,
			  585,  584,  139,  139,  711,  139,  139,  711,  145,  711,
			  141,  587,  140,  140,  588,  141,  711,  583,  556,  589,
			  141,  711,  141,  711,  711,  145,  588,  141,  584,  612,
			  139,  589,  141,  139,  141,  711,  594,  145,  587,  590,
			  140,  591,  145,  711,  711,  590,  592,  145,  709,  145,
			  711,  348,  139,  588,  145,  139,  612,  139,  589,  145,

			  139,  145,  140,  595,  141,  709,  593,  140,  596,  709,
			  141,  594,  590,  597,  139,  141,  141,  139,  711,  711,
			  139,  596,  141,  139,  140,  597,  139,  141,  711,  139,
			  140,  145,  709,  711,  711,  598,  140,  145,  594,  711,
			  599,  139,  145,  145,  139,  711,  141,  711,  596,  145,
			  711,  140,  597,  601,  145,  141,  110,  110,  141,  110,
			  600,  600,  110,  110,  629,  110,  711,  141,  711,  602,
			  711,  110,  110,  145,  110,  711,  139,  112,  711,  139,
			  601,  711,  145,  112,  711,  145,  140,  600,  603,  711,
			  618,  630,  112,  711,  145,  711,  602,  604,  110,  110, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  141,  110,  617,  711,  604,  604,  604,  604,  604,  604,
			  711,  711,  141,  711,  711,  711,  711,  618,  711,  112,
			  110,  110,  711,  110,  711,  619,  711,  145,  711,  617,
			  604,  604,  604,  604,  604,  604,  604,  110,  110,  145,
			  110,  112,  110,  110,  711,  110,  110,  110,  711,  110,
			  110,  110,  619,  110,  110,  110,  711,  110,  112,  110,
			  110,  711,  110,  112,  711,  110,  110,  112,  110,  711,
			  711,  112,  711,  711,  711,  112,  110,  110,  711,  110,
			  112,  110,  110,  711,  110,  139,  112,  141,  139,  631,
			  622,  711,  621,  139,  623,  140,  139,  112,  711,  141,

			  711,  139,  112,  140,  139,  711,  141,  711,  624,  711,
			  625,  140,  139,  711,  145,  139,  632,  622,  141,  621,
			  139,  623,  140,  139,  141,  628,  145,  629,  631,  139,
			  140,  139,  139,  145,  139,  624,  141,  625,  711,  140,
			  139,  140,  711,  139,  141,  145,  141,  711,  711,  711,
			  140,  145,  628,  711,  629,  631,  141,  139,  141,  139,
			  139,  711,  139,  145,  141,  633,  711,  140,  141,  140,
			  711,  145,  711,  145,  711,  635,  141,  633,  139,  139,
			  141,  139,  139,  145,  139,  145,  711,  139,  140,  140,
			  711,  145,  634,  635,  140,  145,  139,  141,  711,  139,

			  711,  637,  636,  145,  633,  711,  140,  145,  637,  141,
			  638,  110,  110,  639,  110,  711,  711,  711,  110,  110,
			  635,  110,  110,  110,  145,  110,  110,  110,  640,  110,
			  711,  711,  112,  711,  711,  637,  145,  638,  648,  112,
			  639,  110,  110,  112,  110,  110,  110,  112,  110,  110,
			  110,  649,  110,  711,  711,  650,  110,  110,  711,  110,
			  654,  711,  112,  655,  654,  648,  112,  655,  651,  139,
			  112,  711,  139,  652,  711,  711,  141,  112,  649,  140,
			  139,  654,  650,  139,  655,  653,  711,  711,  141,  141,
			  140,  654,  711,  711,  655,  651,  656,  657,  141,  711,

			  652,  141,  659,  145,  139,  672,  711,  139,  139,  672,
			  141,  139,  653,  657,  140,  145,  145,  139,  140,  141,
			  139,  661,  711,  656,  658,  145,  672,  140,  145,  660,
			  711,  141,  711,  659,  711,  661,  672,  145,  711,  139,
			  657,  139,  139,  711,  139,  663,  145,  141,  662,  140,
			  663,  140,  110,  110,  711,  110,  711,  711,  145,  141,
			  659,  711,  661,  711,  110,  110,  673,  110,  664,  711,
			  673,  711,  663,  112,  145,  110,  110,  665,  110,  110,
			  110,  711,  110,  711,  668,  112,  145,  673,  110,  110,
			  711,  110,  711,  711,  711,  664,  112,  673,  110,  110,

			  112,  110,  139,  141,  139,  139,  669,  139,  670,  112,
			  141,  668,  140,  139,  140,  141,  139,  711,  711,  112,
			  675,  139,  141,  140,  139,  711,  711,  141,  711,  711,
			  145,  140,  141,  669,  674,  670,  677,  145,  139,  141,
			  671,  139,  145,  711,  141,  711,  675,  676,  140,  145,
			  677,  711,  139,  711,  145,  139,  711,  110,  110,  145,
			  110,  674,  140,  678,  711,  139,  145,  671,  139,  110,
			  110,  145,  110,  675,  711,  140,  711,  677,  112,  110,
			  110,  711,  110,  141,  110,  110,  680,  110,  139,  139,
			  112,  139,  139,  139,  679,  141,  139,  711,  140,  140,

			  112,  711,  141,  140,  686,  112,  110,  110,  711,  110,
			  145,  686,  141,  680,  141,  681,  711,  685,  688,  711,
			  682,  679,  145,  711,  141,  110,  110,  112,  110,  145,
			  683,  687,  711,  139,  688,  690,  139,  711,  686,  145,
			  711,  145,  681,  140,  685,  689,  112,  682,  691,  110,
			  110,  145,  110,  110,  110,  139,  110,  683,  139,  141,
			  711,  688,  690,  139,  711,  140,  139,  711,  711,  139,
			  112,  141,  139,  140,  112,  691,  711,  711,  711,  140,
			  110,  110,  711,  110,  110,  110,  145,  110,  711,  139,
			  139,  692,  139,  139,  711,  707,  711,  694,  145,  140,

			  140,  112,  711,  711,  711,  112,  707,  695,  711,  110,
			  110,  711,  110,  697,  711,  711,  707,  711,  692,  700,
			  110,  110,  139,  110,  694,  139,  696,  711,  139,  711,
			  112,  139,  140,  707,  695,  699,  110,  110,  140,  110,
			  697,  112,  139,  711,  711,  139,  700,  701,  110,  110,
			  711,  110,  140,  696,  711,  710,  139,  112,  711,  139,
			  703,  711,  699,  711,  711,  704,  140,  711,  711,  112,
			  711,  706,  710,  419,  701,  711,  710,  711,  419,  419,
			  419,  419,  419,  419,  711,  711,  711,  703,  711,  711,
			  711,  711,  704,  711,  711,  711,  711,  711,  706,  710,

			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,

			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   93,   93,  711,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,  711,   93,   93,   93,   93,   93,   95,   95,
			  711,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,  111,  111,  111,  711,  711,  711,  711,  711,  711,
			  111,  711,  711,  111,  711,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  711,  711,  111,
			  111,  111,  136,  136,  711,  136,  136,  711,  136,  711,
			  711,  711,  711,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  711,  711,  136,  136,  136,
			  137,  137,  711,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,

			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  188,  188,  711,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  190,  190,  711,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,

			  190,  190,  190,  190,  190,  190,  190,  190,  190,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  711,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  204,  204,  204,  711,  711,

			  711,  204,  204,  711,  204,  711,  711,  711,  711,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  711,  204,  204,  204,  204,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  217,  217,  711,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,  235,  235,
			  235,  235,  235,  235,  235,  235,  711,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  135,  135,  711,  135,  135,  711,  135,  135,  711,
			  711,  711,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135,  135,  711,  711,  135,  135,  135,  141,
			  711,  141,  141,  711,  711,  711,  711,  711,  141,  711,

			  711,  711,  711,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  711,  711,  141,  141,  141,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  216,  216,  216,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,

			  216,  216,  216,  216,  216,  216,  216,  216,  216,  711,
			  711,  711,  711,  711,  216,  329,  711,  329,  711,  711,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  711,  711,  329,  329,  329,  323,  323,  323,
			  323,  323,  323,  711,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  711,  323,  323,  323,  323,
			  454,  454,  454,  711,  711,  711,  454,  454,  711,  454,

			  711,  711,  711,  711,  454,  454,  454,  454,  454,  454,
			  454,  454,  454,  454,  454,  454,  454,  454,  454,  454,
			  454,  454,  454,  454,  454,  454,  711,  711,  454,  454,
			  454,  378,  378,  378,  711,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  711,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  486,  711,  711,  711,  711,  486,
			  486,  486,  486,  486,  486,  548,  711,  711,  711,  711,
			  548,  548,  548,  548,  548,  548,  560,  560,  560,  560,

			  560,  560,  560,  560,  711,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  605,
			  711,  711,  711,  711,  605,  605,  605,  605,  605,  605,
			   13,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,

			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711, yy_Dummy>>,
			1, 2029, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5028)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    4,    5,    6,    3,    4,   11,    3,    4,   15,  707,
			   15,   15,   20,   20,   27,  698,   27,   29,  201,   29,

			  645,   29,   37,   37,  433,   37,   12,   46,   46,  232,
			   46,  232,    5,    6,  232,   50,   50,   73,   50,   73,
			   73,   82,   82,   37,   82,   46,    3,    4,   46,  201,
			   72,  644,   20,   87,   29,  274,   50,  274,   11,  433,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   12,
			    9,   50,    9,    9,    9,    9,    9,    9,   48,   48,
			   82,  193,   62,   72,   48,   60,   36,   36,   56,   36,
			   56,  642,   60,  193,   62,  193,   87,   60,   50,  615,
			    9,    9,    9,    9,  613,   48,   48,   36,   56,   62,

			  611,   48,   60,  207,  207,   56,  207,   56,  610,   60,
			   36,   62,   36,   56,   60,   76,  193,    9,    9,    9,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   36,   10,   36,
			   10,   10,   10,   10,   10,   10,   39,   39,  609,   39,
			  139,   38,   38,  139,   38,  607,   40,   40,   76,   40,
			  139,   63,   41,   41,  606,   41,  223,   39,   10,   10,
			   10,   10,   38,   63,  223,  223,   38,   40,  210,  188,
			   39,   40,  605,   41,   43,   43,  579,   43,   63,   42,
			   42,   39,   42,   40,   41,   10,   10,   10,   44,   44,

			   63,   44,   77,   38,  104,   43,  578,   39,   40,   43,
			   42,  559,  558,   45,   45,  104,   45,  101,   39,   44,
			   40,   41,  188,  557,   42,   42,   47,   47,  101,   47,
			   42,  210,  555,   77,   45,   44,   43,   79,   49,   49,
			   45,   49,  104,   51,   51,   57,  551,   47,   51,   51,
			  101,   42,   42,   45,   57,  101,   57,   42,   47,   49,
			  672,   77,   44,  672,   66,   66,   47,   45,   79,  550,
			   66,  321,   57,  641,   57,   49,   83,   83,  335,   83,
			   45,   57,  549,   57,   51,   47,  335,  335,   58,   57,
			   58,   66,   66,   47,  343,  496,   79,   66,   90,   58,

			   90,   90,   49,   55,   84,   84,   55,   84,   58,  494,
			  493,  136,  136,   55,  321,   58,  641,   58,   84,   84,
			  136,   55,   55,   58,   84,   83,   58,  343,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			  136,  489,  440,   84,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   59,  350,  431,
			   61,  110,  110,   64,  110,   64,   59,   67,   59,   59,
			   61,   61,   61,   65,  429,   64,   61,  422,   64,   67,

			   65,  351,  110,  351,   59,   65,   59,   61,   65,  427,
			   64,  350,   64,   59,   67,   59,   59,   61,   61,   61,
			   65,   59,   64,   61,   68,   64,   67,   65,  425,  105,
			  422,  105,   65,  105,  424,   65,   68,  111,  111,  423,
			  111,  120,  120,  141,  120,   68,  141,  209,  209,  159,
			  209,   68,  159,  141,  191,  352,  191,  191,  111,  159,
			  120,  273,  120,   68,  273,  349,  105,  229,  159,  229,
			  229,  273,   68,   75,   75,  348,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   85,   85,   98,   85,  113,  113,   98,  113,  114,
			  114,  345,  114,  344,  196,   85,   98,  123,  123,  342,
			  123,   85,  330,  428,  215,  215,  113,  215,  130,  130,
			  114,  130,  115,  115,  329,  115,  430,  114,  123,  113,
			  323,  118,  118,  271,  118,  196,   98,  215,  268,  130,

			   85,   88,   88,  115,   88,   98,  428,  192,  239,  234,
			  163,   98,  118,  163,  114,   98,  113,   98,  123,  430,
			  163,  130,  115,  196,   88,  118,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,  130,  115,
			  192,  237,  118,  237,  241,  241,  237,  241,  233,  254,
			  254,  163,  254,  300,  326,  326,  300,  326,  377,  377,
			  228,  377,  227,  300,  192,  241,  226,   88,   96,   96,
			  254,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,  116,  116,  225,  116,
			  117,  117,  224,  117,  119,  119,  222,  119,  121,  121,
			  198,  121,  145,  122,  122,  221,  122,  116,  238,  421,
			  238,  117,  238,  220,  145,  119,  347,  117,  347,  121,
			  421,  347,  219,  117,  122,  124,  124,  116,  124,  145,

			  122,  198,  143,  122,  119,  143,  121,  125,  125,  214,
			  125,  145,  143,  199,  117,  238,  124,  421,  126,  126,
			  117,  126,  127,  127,  116,  127,  195,  122,  125,  198,
			  122,  119,  287,  121,  128,  287,  143,  124,  190,  126,
			  160,  142,  287,  127,  128,  126,  160,  140,  128,  125,
			  127,  128,  128,  129,  129,  137,  129,  128,  160,  131,
			  131,  135,  131,  143,  124,  132,  132,  106,  132,  488,
			  103,  128,  126,  160,  129,  128,  125,  127,  128,  128,
			  131,  100,  129,  287,  128,  160,  132,  133,  133,   99,
			  133,   95,  131,   93,  132,  248,  131,  134,  134,  432,

			  134,  144,  488,  146,  144,  146,  248,   91,  133,  129,
			  432,  144,  146,  147,  148,   80,  248,  148,  134,  131,
			  150,  132,  147,  131,  146,  147,  148,  133,  149,  144,
			  492,  149,  150,  248,  153,  150,   69,  432,  149,  146,
			  147,  148,   54,  134,  148,  151,  153,  150,  151,  147,
			  153,  146,  147,  148,  133,  151,  144,  152,  360,  150,
			  152,  153,  150,  492,  154,   35,  154,  152,  149,  360,
			  134,  155,  154,  153,  155,  156,  154,  153,  156,  360,
			  157,  155,  158,   34,  152,  156,  151,   32,   28,  157,
			  152,  154,  157,  154,  158,  149,  360,  158,  161,  154,

			  368,  161,   26,  154,   18,  155,  495,  157,  161,  158,
			  368,  152,   17,  151,  164,  156,  157,  152,   16,  157,
			  162,  158,  166,  162,  158,   13,  164,  164,  327,  327,
			  162,  327,  155,  165,  166,  165,  161,  368,  165,  495,
			  168,  164,  156,  260,  260,  165,  260,  162,  166,  166,
			  162,  327,  168,  164,  164,    0,  167,  168,  170,  167,
			  165,  166,  165,  161,  260,  165,  167,  168,  169,    0,
			  170,  169,  165,  171,  162,  170,  171,  162,  169,  168,
			  173,    0,  173,  171,  168,  170,  172,  202,  202,  172,
			  202,  174,  173,    0,  174,  490,  172,  170,  167,    0,

			  171,  176,  170,  174,  176,  175,    0,  173,  175,  173,
			  169,  176,  177,  554,  172,  175,  177,  490,  174,  173,
			  178,  174,  490,  179,  177,  167,  179,  171,  243,  243,
			  174,  243,  178,  179,  175,    0,  202,  169,  178,  177,
			    0,  172,  181,  177,  176,  180,  554,  178,  180,  243,
			  181,  177,  184,  604,  181,  180,  179,  243,  182,  178,
			  179,  175,  182,  183,  184,  178,  183,  184,  604,  181,
			  182,  176,  185,  183,  180,  185,    0,  181,  186,  184,
			    0,  181,  185,  179,  243,  182,  608,  179,    0,  182,
			  186,  184,  203,  203,  184,  203,  604,  182,    0,  186,

			    0,  180,  231,  183,  236,  186,  275,  204,  204,  275,
			  204,  206,  206,  231,  206,  236,  275,  186,  185,  608,
			  276,  204,  275,    0,  275,  206,  186,  204,    0,    0,
			  183,  206,  276,  257,  257,  231,  257,  236,    0,    0,
			  231,  203,  236,  316,    0,  185,  316,  276,    0,  418,
			  418,  257,  418,  316,  257,    0,  204,    0,    0,  276,
			  206,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  240,  240,  208,
			  240,  208,  208,  208,  208,  208,  208,  244,  244,    0,
			  244,  298,  242,  242,  298,  242,  249,  249,  240,  249,

			  487,  298,  487,  247,  247,  487,  247,  277,  244,  208,
			  208,  208,  208,  242,  240,    0,    0,  249,  298,  277,
			  242,  244,  245,  245,  247,  245,  616,  643,  251,  251,
			  249,  251,  258,  258,  277,  258,  208,  208,  208,  211,
			  211,  240,  211,  245,    0,  298,  277,  242,  244,  251,
			  258,    0,    0,  258,  247,  453,  453,  249,  453,  616,
			  643,  251,  211,  245,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  246,  246,  251,  246,
			  245,  250,  250,    0,  250,  252,  252,    0,  252,  253,

			  253,  646,  253,  255,  255,    0,  255,  246,  256,  256,
			    0,  256,  250,    0,    0,  211,  252,    0,  259,  259,
			  253,  259,    0,  284,  255,  250,  253,  246,  252,  256,
			  261,  261,  284,  261,  646,  284,  259,  256,  491,  259,
			  262,  262,  647,  262,  263,  263,  255,  263,  667,  491,
			  284,  261,  250,  253,  246,  252,    0,  264,  264,  284,
			  264,  262,  284,  556,  256,  263,  261,  265,  265,  262,
			  265,  266,  266,  255,  266,  647,  491,    0,  264,  267,
			  267,  667,  267,  263,  272,  556,    0,  272,  265,    0,
			  556,    0,  266,  261,  272,  278,  262,  264,  278,  279,

			  267,    0,  279,  280,  282,  278,  280,  282,    0,  281,
			  263,  279,  281,  280,  282,  497,    0,  497,  265,  281,
			  497,  272,    0,  278,  264,  267,  279,  283,  285,  279,
			  341,  283,  280,  325,  325,  288,  325,    0,  279,  283,
			  285,  341,    0,  281,  285,  282,  286,  288,  272,  286,
			  278,  288,  267,  289,  283,  285,  286,  290,  283,  280,
			    0,    0,  288,  341,  290,  289,  283,  285,  341,    0,
			  281,  285,  282,  291,  288,  290,  291,    0,  288,  289,
			  289,  292,  325,  291,  292,  290,  293,  286,    0,  293,
			  294,  292,  289,  294,  295,    0,  293,  297,    0,  296,

			  294,  301,  290,  295,  317,  297,  295,  291,  296,  297,
			  299,  296,  299,  301,  286,  292,  317,  302,    0,  293,
			  302,  295,  299,  294,  297,    0,  296,  302,  301,    0,
			  295,  317,  297,  295,  291,  296,  297,  299,  296,  299,
			  301,  303,  292,  317,  303,  304,  293,    0,    0,  299,
			  294,  303,  305,    0,  308,    0,  305,  304,  306,  307,
			  302,  306,  307,  304,  305,  308,  308,    0,  306,  307,
			  303,    0,  304,  309,    0,    0,    0,  309,    0,  305,
			    0,  308,    0,  305,  304,  309,  310,  302,  307,  310,
			  304,  305,  308,  308,  306,  311,  310,  303,  311,  312,

			  309,  314,  312,    0,  309,  311,  313,    0,    0,  312,
			  315,    0,  309,  314,  318,  307,  314,  318,  313,    0,
			  313,  306,  315,    0,  318,  310,    0,  319,  314,  552,
			    0,  552,    0,  313,  552,  311,  315,  315,    0,  319,
			  314,  324,  324,  314,  324,  313,  346,  313,  319,  315,
			  312,  505,  310,  383,  319,  324,  383,  346,    0,    0,
			  318,  324,  311,  383,  354,  354,  319,  354,  505,    0,
			  353,  353,  505,  353,    0,  319,    0,  355,  355,  346,
			  355,    0,  369,  381,  346,  354,  381,  318,  320,    0,
			  324,  353,  369,  381,  386,  505,  369,  354,  355,  356,

			  356,  320,  356,    0,  357,  357,  386,  357,  320,  320,
			  320,  320,  320,  320,  353,    0,  381,    0,    0,  369,
			  356,  386,    0,  369,  354,  357,  358,  358,    0,  358,
			    0,  320,    0,  386,  320,  320,  320,  320,  320,  320,
			  320,  353,  356,  381,    0,    0,  357,  358,  405,  359,
			  359,  405,  359,    0,    0,  358,  361,  361,  405,  361,
			  362,  362,    0,  362,  363,  363,  553,  363,  553,  356,
			  359,  553,    0,  357,  359,  364,  364,  361,  364,    0,
			    0,  362,  358,  365,  365,  363,  365,  385,    0,  361,
			  385,  366,  366,  562,  366,  562,  364,  385,  562,  379,

			  363,  359,  379,  362,  365,  367,  367,  370,  367,  379,
			    0,  364,  366,    0,  498,  365,  361,  370,    0,  371,
			  371,  370,  371,    0,  370,  498,  367,  363,    0,  385,
			  362,  366,  372,  372,    0,  372,  373,  373,  364,  373,
			  371,    0,  365,  379,  370,  367,  374,  374,  370,  374,
			    0,  370,  498,  372,  380,    0,  385,  373,  366,  375,
			  375,    0,  375,    0,  426,    0,  380,  374,  376,  376,
			  379,  376,  367,  380,  374,  426,  387,    0,  382,  373,
			  375,  380,  384,  376,  375,  384,  382,  388,  387,  376,
			  382,    0,  384,  380,  387,  375,    0,  426,    0,  388,

			  380,  374,  426,  387,  388,  382,  373,    0,    0,  389,
			    0,  375,  389,  382,  388,  387,    0,  382,    0,  389,
			  390,  387,  375,  390,  391,  384,  388,    0,  391,  392,
			  390,  388,  392,    0,  393,    0,  391,  393,  389,  392,
			  394,  397,    0,  394,  393,  390,  395,    0,    0,  395,
			  394,  391,  384,  397,    0,  391,  395,    0,  396,  397,
			    0,  401,  392,  391,  401,  389,  396,  398,  397,    0,
			  396,  401,  390,    0,    0,    0,  394,  393,  398,  398,
			  397,  399,  395,  400,  399,  396,  397,  403,    0,  392,
			  400,  399,    0,  396,  398,  400,    0,  396,    0,  403,

			  404,  401,  403,  394,  393,  398,  398,  407,  402,  395,
			  400,  402,  404,  399,  403,  404,  568,  400,  402,  407,
			  406,    0,  400,  406,  408,    0,  403,  404,  401,  403,
			  406,    0,    0,  568,  407,  409,  408,  568,  409,  404,
			  399,    0,  404,  412,  410,  409,  407,  410,  402,  411,
			  413,  408,  411,  413,  410,  412,    0,  415,    0,  411,
			  568,  412,  413,  408,    0,    0,  414,  415,    0,  414,
			  412,    0,  410,    0,  411,  402,  414,  413,  409,  415,
			  413,  414,  412,  434,  434,  411,  434,    0,  412,  413,
			  435,  435,  463,  435,  415,  463,    0,    0,  612,  410,

			  612,  411,  463,  612,  434,  409,  415,  436,  436,    0,
			  436,  435,  411,  416,    0,  437,  437,    0,  437,    0,
			  416,  416,  416,  416,  416,  416,  435,    0,  436,  469,
			  454,  454,  469,  454,  434,  436,  437,  438,  438,  469,
			  438,    0,  439,  439,  437,  439,  416,  416,  416,  416,
			  416,  416,  416,  435,  442,  442,  437,  442,  438,    0,
			  684,  465,  436,  439,  441,  441,    0,  441,  684,  443,
			  443,  437,  443,  465,    0,  442,  439,  444,  444,  454,
			  444,  684,  442,  437,    0,  441,  445,  445,  465,  445,
			  443,  446,  446,  441,  446,  684,  447,  447,  444,  447,

			  465,  475,  443,  439,  475,  448,  448,  445,  448,  442,
			    0,  475,  446,  455,    0,  445,  455,  447,  449,  449,
			  441,  449,    0,  455,  456,  447,  448,  450,  450,  443,
			  450,  446,  451,  451,  448,  451,  456,    0,  452,  449,
			    0,  475,  445,  458,    0,    0,  561,  449,  450,  452,
			  456,  456,  447,  451,  458,  458,    0,  561,  446,  452,
			    0,  448,  457,  456,  455,  457,    0,  450,  475,  451,
			  458,    0,  457,    0,  449,  459,  452,  460,  459,  561,
			  460,  458,  458,  461,  561,  459,  461,  460,  462,  470,
			    0,    0,  462,  470,  450,  461,  451,    0,  457,    0,

			  462,  470,  464,  459,  462,  464,  460,    0,    0,    0,
			  461,  466,  464,  461,  466,  462,  470,    0,  460,  462,
			  470,  466,  461,  471,    0,  457,  471,  462,  470,  467,
			  459,  462,  467,  460,  472,  471,  464,    0,  468,  467,
			  466,  468,  472,  474,    0,  460,  472,  474,  468,  473,
			  471,    0,  473,  471,  478,  474,    0,  467,  478,  473,
			  521,  472,  471,  464,  477,  476,  478,  466,  476,  472,
			  474,  468,  521,  472,  474,  476,  477,    0,  473,  477,
			  479,  478,  474,  479,  467,  478,  480,  521,    0,  480,
			  479,  477,  481,  478,  476,  481,  480,  482,  468,  521,

			  482,    0,  481,  477,  483,  473,  477,  482,  483,  479,
			  484,    0,    0,    0,  484,  480,  483,  503,  503,  516,
			  503,  476,  484,  499,  499,    0,  499,    0,    0,    0,
			  516,  483,  481,    0,  482,  483,  479,  484,  503,  517,
			  516,  484,  480,  483,  499,    0,    0,    0,  499,  484,
			  517,    0,    0,    0,    0,  500,  500,  516,  500,  481,
			  517,  482,  485,  501,  501,    0,  501,  526,    0,  485,
			  485,  485,  485,  485,  485,  499,  500,  517,  526,  526,
			  500,    0,  502,  502,  501,  502,    0,  504,  504,    0,
			  504,    0,  501,    0,  526,  485,  485,  485,  485,  485,

			  485,  485,    0,  502,    0,  526,  526,  500,  504,  506,
			  506,    0,  506,  507,  507,    0,  507,    0,  502,  501,
			  693,  504,  508,  508,    0,  508,  509,  509,  693,  509,
			  506,    0,  510,  510,  507,  510,    0,  511,  511,    0,
			  511,  693,  507,  508,    0,  502,  519,  509,  504,  519,
			  506,  512,  512,  510,  512,  693,  519,    0,  511,  513,
			  513,  510,  513,  524,  508,  511,  524,  509,  702,  507,
			    0,  519,  512,  524,    0,  514,  514,  506,  514,  702,
			  513,    0,  515,  515,    0,  515,    0,  520,  510,  702,
			  520,  508,  511,    0,  509,  527,  514,  520,  519,  513,

			    0,  522,  514,  515,  522,  523,  702,  527,  523,  525,
			  515,  522,  520,  525,    0,  523,    0,  528,    0,    0,
			  528,  525,  527,    0,    0,  529,  513,  528,  529,  514,
			  522,    0,    0,    0,  527,  529,  525,  515,  532,  520,
			  525,  523,  530,  531,    0,  530,  531,    0,  525,    0,
			  532,  528,  530,  531,  532,  533,    0,  522,  614,  533,
			  536,    0,  534,    0,    0,  532,  529,  533,  523,  614,
			  535,  530,  536,  535,  534,    0,  536,  532,  528,  534,
			  535,  532,  533,    0,    0,  531,  533,  536,  708,  534,
			    0,  614,  537,  529,  533,  537,  614,  538,  530,  536,

			  538,  534,  537,  536,  539,  708,  534,  538,  539,  708,
			  540,  535,  531,  540,  541,  545,  539,  541,    0,    0,
			  542,  537,  540,  542,  541,  538,  543,  545,    0,  543,
			  542,  539,  708,    0,    0,  539,  543,  540,  535,    0,
			  540,  544,  545,  539,  544,    0,  546,    0,  537,  540,
			    0,  544,  538,  543,  545,  582,  564,  564,  546,  564,
			  542,  546,  563,  563,  582,  563,    0,  582,    0,  544,
			    0,  565,  565,  546,  565,    0,  583,  564,    0,  583,
			  543,    0,  582,  563,    0,  546,  583,  542,  546,    0,
			  564,  582,  565,    0,  582,    0,  544,  547,  566,  566, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  585,  566,  563,    0,  547,  547,  547,  547,  547,  547,
			    0,    0,  585,    0,    0,    0,    0,  564,    0,  566,
			  567,  567,    0,  567,    0,  566,    0,  585,    0,  563,
			  547,  547,  547,  547,  547,  547,  547,  569,  569,  585,
			  569,  567,  570,  570,    0,  570,  571,  571,    0,  571,
			  572,  572,  566,  572,  573,  573,    0,  573,  569,  574,
			  574,    0,  574,  570,    0,  575,  575,  571,  575,    0,
			    0,  572,    0,    0,    0,  573,  576,  576,    0,  576,
			  574,  577,  577,    0,  577,  580,  575,  586,  580,  586,
			  573,    0,  571,  581,  575,  580,  581,  576,    0,  586,

			    0,  584,  577,  581,  584,    0,  591,    0,  576,    0,
			  577,  584,  587,    0,  586,  587,  586,  573,  591,  571,
			  588,  575,  587,  588,  592,  580,  586,  581,  584,  589,
			  588,  590,  589,  591,  590,  576,  592,  577,    0,  589,
			  594,  590,    0,  594,  593,  591,  595,    0,    0,    0,
			  594,  592,  580,    0,  581,  584,  593,  596,  595,  597,
			  596,    0,  597,  592,  598,  593,    0,  596,  599,  597,
			    0,  593,    0,  595,    0,  598,  598,  590,  601,  600,
			  599,  601,  600,  593,  602,  595,    0,  602,  601,  600,
			    0,  598,  593,  596,  602,  599,  633,  603,    0,  633,

			    0,  603,  598,  598,  590,    0,  633,  599,  600,  603,
			  601,  617,  617,  602,  617,    0,    0,    0,  618,  618,
			  596,  618,  621,  621,  603,  621,  619,  619,  603,  619,
			    0,    0,  617,    0,    0,  600,  603,  601,  617,  618,
			  602,  622,  622,  621,  622,  623,  623,  619,  623,  625,
			  625,  618,  625,    0,    0,  619,  624,  624,    0,  624,
			  626,    0,  622,  627,  626,  617,  623,  627,  622,  628,
			  625,    0,  628,  623,    0,    0,  634,  624,  618,  628,
			  629,  626,  619,  629,  627,  624,    0,    0,  634,  630,
			  629,  626,    0,    0,  627,  622,  628,  630,  632,    0,

			  623,  630,  632,  634,  631,  654,    0,  631,  635,  654,
			  632,  635,  624,  629,  631,  634,  630,  637,  635,  636,
			  637,  636,    0,  628,  630,  632,  654,  637,  630,  632,
			    0,  636,    0,  631,    0,  635,  654,  632,    0,  638,
			  629,  639,  638,    0,  639,  637,  636,  640,  636,  638,
			  640,  639,  648,  648,    0,  648,    0,    0,  636,  640,
			  631,    0,  635,    0,  649,  649,  655,  649,  638,    0,
			  655,    0,  637,  648,  640,  650,  650,  640,  650,  651,
			  651,    0,  651,    0,  648,  649,  640,  655,  652,  652,
			    0,  652,    0,    0,    0,  638,  650,  655,  653,  653,

			  651,  653,  656,  658,  657,  656,  649,  657,  651,  652,
			  660,  648,  656,  659,  657,  658,  659,    0,    0,  653,
			  658,  661,  660,  659,  661,    0,    0,  665,    0,    0,
			  658,  661,  662,  649,  656,  651,  662,  660,  663,  665,
			  653,  663,  658,    0,  662,    0,  657,  658,  663,  660,
			  661,    0,  664,    0,  665,  664,    0,  668,  668,  662,
			  668,  656,  664,  662,    0,  675,  665,  653,  675,  669,
			  669,  662,  669,  657,    0,  675,    0,  661,  668,  670,
			  670,    0,  670,  676,  671,  671,  668,  671,  674,  679,
			  669,  674,  679,  677,  664,  676,  677,    0,  674,  679,

			  670,    0,  678,  677,  676,  671,  680,  680,    0,  680,
			  676,  675,  687,  668,  678,  669,    0,  674,  678,    0,
			  670,  664,  676,    0,  687,  681,  681,  680,  681,  678,
			  671,  676,    0,  686,  677,  679,  686,    0,  675,  687,
			    0,  678,  669,  686,  674,  678,  681,  670,  680,  682,
			  682,  687,  682,  683,  683,  685,  683,  671,  685,  689,
			    0,  677,  679,  688,    0,  685,  688,    0,    0,  690,
			  682,  689,  690,  688,  683,  680,    0,    0,    0,  690,
			  691,  691,    0,  691,  692,  692,  689,  692,    0,  694,
			  695,  683,  694,  695,    0,  705,    0,  685,  689,  694,

			  695,  691,    0,    0,    0,  692,  705,  690,    0,  696,
			  696,    0,  696,  692,    0,    0,  705,    0,  683,  695,
			  697,  697,  699,  697,  685,  699,  691,    0,  700,    0,
			  696,  700,  699,  705,  690,  694,  701,  701,  700,  701,
			  692,  697,  703,    0,    0,  703,  695,  696,  704,  704,
			    0,  704,  703,  691,    0,  709,  706,  701,    0,  706,
			  699,    0,  694,    0,    0,  701,  706,    0,    0,  704,
			    0,  703,  709,  738,  696,    0,  709,    0,  738,  738,
			  738,  738,  738,  738,    0,    0,    0,  699,    0,    0,
			    0,    0,  701,    0,    0,    0,    0,    0,  703,  709,

			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,

			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,

			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  717,  717,    0,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,  717,    0,  717,  717,  717,  717,  717,  718,  718,
			    0,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,

			  718,  719,  719,  719,    0,    0,    0,    0,    0,    0,
			  719,    0,    0,  719,    0,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,    0,    0,  719,
			  719,  719,  720,  720,    0,  720,  720,    0,  720,    0,
			    0,    0,    0,  720,  720,  720,  720,  720,  720,  720,
			  720,  720,  720,  720,  720,  720,  720,  720,  720,  720,
			  720,  720,  720,  720,  720,    0,    0,  720,  720,  720,
			  721,  721,    0,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,

			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  722,  722,    0,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  723,  723,    0,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,

			  723,  723,  723,  723,  723,  723,  723,  723,  723,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,    0,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  725,  726,  726,  726,    0,    0,

			    0,  726,  726,    0,  726,    0,    0,    0,    0,  726,
			  726,  726,  726,  726,  726,  726,  726,  726,  726,  726,
			  726,  726,  726,  726,  726,  726,  726,  726,  726,  726,
			  726,    0,  726,  726,  726,  726,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,

			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  728,  729,  729,    0,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,

			  730,  730,  730,  730,  730,  730,  730,  730,  731,  731,
			  731,  731,  731,  731,  731,  731,    0,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  732,  732,    0,  732,  732,    0,  732,  732,    0,
			    0,    0,  732,  732,  732,  732,  732,  732,  732,  732,
			  732,  732,  732,  732,  732,  732,  732,  732,  732,  732,
			  732,  732,  732,  732,    0,    0,  732,  732,  732,  733,
			    0,  733,  733,    0,    0,    0,    0,    0,  733,    0,

			    0,    0,    0,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  733,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  733,  733,  733,    0,    0,  733,  733,  733,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,
			  734,  734,  734,  735,  735,  735,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  735,  735,  735,  735,
			  735,  735,  735,  735,  735,  735,  735,  735,  735,  735,

			  735,  735,  735,  735,  735,  735,  735,  735,  735,    0,
			    0,    0,    0,    0,  735,  736,    0,  736,    0,    0,
			  736,  736,  736,  736,  736,  736,  736,  736,  736,  736,
			  736,  736,  736,  736,  736,  736,  736,  736,  736,  736,
			  736,  736,    0,    0,  736,  736,  736,  737,  737,  737,
			  737,  737,  737,    0,  737,  737,  737,  737,  737,  737,
			  737,  737,  737,  737,  737,  737,  737,  737,  737,  737,
			  737,  737,  737,  737,  737,  737,  737,  737,  737,  737,
			  737,  737,  737,  737,  737,    0,  737,  737,  737,  737,
			  739,  739,  739,    0,    0,    0,  739,  739,    0,  739,

			    0,    0,    0,    0,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,    0,    0,  739,  739,
			  739,  740,  740,  740,    0,  740,  740,  740,  740,  740,
			  740,  740,  740,  740,  740,    0,  740,  740,  740,  740,
			  740,  740,  740,  740,  740,  740,  740,  740,  740,  740,
			  740,  740,  740,  740,  740,  740,  740,  740,  740,  740,
			  740,  740,  740,  740,  741,    0,    0,    0,    0,  741,
			  741,  741,  741,  741,  741,  742,    0,    0,    0,    0,
			  742,  742,  742,  742,  742,  742,  743,  743,  743,  743,

			  743,  743,  743,  743,    0,  743,  743,  743,  743,  743,
			  743,  743,  743,  743,  743,  743,  743,  743,  743,  743,
			  743,  743,  743,  743,  743,  743,  743,  743,  743,  743,
			  743,  743,  743,  743,  743,  743,  743,  743,  743,  744,
			    0,    0,    0,    0,  744,  744,  744,  744,  744,  744,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,

			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711, yy_Dummy>>,
			1, 2029, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   77,   62,   63,    0,    0,  141,
			  219,   60,   81, 1125, 4950,   86, 1115, 1088, 1097, 4950,
			   82, 4950, 4950, 4950, 4950, 4950, 1085,   76, 1069,   81,
			 4950, 4950, 1063, 4950, 1059, 1039,  174,  100,  249,  244,
			  254,  260,  287,  282,  296,  311,  105,  324,  131,  336,
			  113,  331, 4950, 4950,  990,  401,  142,  318,  352,  450,
			  148,  453,  145,  234,  456,  466,  327,  460,  497, 1017,
			 4950, 4950,  123,  115, 4950,  572,  208,  283, 4950,  318,
			  965, 4950,  119,  374,  402,  649, 4950,  108,  699, 4950,
			  396, 1004, 4950,  986, 4950,  980,  777,    0,  646,  986,

			  963,  297, 4950,  950,  284,  513,  947, 4950, 4950, 4950,
			  479,  535, 4950,  653,  657,  680,  854,  858,  689,  862,
			  539,  866,  871,  665,  893,  905,  916,  920,  914,  951,
			  676,  957,  963,  985,  995,  940,  399,  903, 4950,  248,
			  934,  541,  922,  900,  999,  845,  985,  986,  987, 1026,
			  993, 1043, 1055, 1007, 1037, 1069, 1073, 1053, 1055,  547,
			  919, 1096, 1118,  708, 1087, 1106, 1095, 1154, 1113, 1166,
			 1131, 1171, 1184, 1153, 1164, 1203, 1199, 1185, 1193, 1221,
			 1243, 1215, 1231, 1261, 1225, 1270, 1251, 4950,  272, 4950,
			  931,  552,  700,  163, 4950,  919,  645, 4950,  851,  863,

			 4950,   79, 1185, 1290, 1305, 4950, 1309,  201, 1360,  545,
			  253, 1437, 4950, 4950,  884,  672, 4950, 4950, 4950,  818,
			  861,  864,  855,  255,  851,  847,  765,  761,  759,  565,
			 4950, 1282,   94,  738,  689, 4950, 1284,  736,  862,  688,
			 1375,  752, 1390, 1226, 1385, 1420, 1484, 1401,  969, 1394,
			 1489, 1426, 1493, 1497,  757, 1501, 1506, 1331, 1430, 1516,
			 1141, 1528, 1538, 1542, 1555, 1565, 1569, 1577,  677, 4950,
			 4950,  674, 1582,  559,  117, 1304, 1293, 1380, 1593, 1572,
			 1601, 1607, 1602, 1600, 1496, 1601, 1644,  930, 1608, 1626,
			 1638, 1671, 1679, 1684, 1688, 1667, 1672, 1670, 1389, 1683,

			  761, 1674, 1715, 1739, 1718, 1725, 1756, 1757, 1727, 1746,
			 1784, 1793, 1797, 1779, 1774, 1783, 1341, 1677, 1812, 1800,
			 1881,  364, 4950,  687, 1839, 1631,  762, 1126,    0,  662,
			  661, 4950, 4950, 4950, 4950,  367, 4950, 4950, 4950, 4950,
			 4950, 1610,  649,  374,  643,  641, 1826,  871,  555,  545,
			  458,  483,  535, 1868, 1862, 1875, 1897, 1902, 1924, 1947,
			 1032, 1954, 1958, 1962, 1973, 1981, 1989, 2003, 1080, 1862,
			 1987, 2017, 2030, 2034, 2044, 2057, 2066,  766,    0, 1997,
			 2027, 1881, 2051, 1851, 2080, 1985, 1867, 2049, 2060, 2107,
			 2118, 2097, 2127, 2132, 2138, 2144, 2131, 2114, 2140, 2179,

			 2156, 2159, 2206, 2160, 2173, 1946, 2218, 2180, 2197, 2233,
			 2242, 2247, 2216, 2223, 2264, 2240, 2293, 4950, 1347,    0,
			 4950,  859,  477,  519,  514,  512, 2044,  489,  653,  474,
			  666,  459,  979,   86, 2281, 2288, 2305, 2313, 2335, 2340,
			  431, 2362, 2352, 2367, 2375, 2384, 2389, 2394, 2403, 2416,
			 2425, 2430, 2412, 1453, 2328, 2411, 2397, 2460, 2416, 2473,
			 2475, 2456, 2461, 2290, 2500, 2334, 2509, 2527, 2536, 2327,
			 2462, 2496, 2507, 2547, 2516, 2399, 2563, 2537, 2527, 2578,
			 2584, 2590, 2595, 2577, 2583, 2642,    0, 1385,  949,  431,
			 1164, 1518, 1010,  390,  389, 1086,  375, 1600, 1994, 2621,

			 2653, 2661, 2680, 2615, 2685, 1825, 2707, 2711, 2720, 2724,
			 2730, 2735, 2749, 2757, 2773, 2780, 2593, 2613, 4950, 2744,
			 2785, 2533, 2799, 2803, 2761, 2782, 2640, 2768, 2815, 2823,
			 2840, 2841, 2811, 2828, 2835, 2868, 2833, 2890, 2895, 2877,
			 2883, 2912, 2918, 2924, 2939, 2888, 2919, 2977,    0,  362,
			  349,  326, 1814, 1951, 1193,  312, 1532,  303,  292,  291,
			 4950, 2426, 1978, 2960, 2954, 2969, 2996, 3018, 2190, 3035,
			 3040, 3044, 3048, 3052, 3057, 3063, 3074, 3079,  289,  269,
			 3083, 3091, 2928, 2974, 3099, 2973, 3060, 3110, 3118, 3127,
			 3129, 3079, 3097, 3117, 3138, 3119, 3155, 3157, 3137, 3141,

			 3177, 3176, 3182, 3170, 1246,  260,  211,  235, 1266,  228,
			  188,  180, 2283,  141, 2838,  169, 1406, 3209, 3216, 3224,
			 4950, 3220, 3239, 3243, 3254, 3247, 3234, 3237, 3267, 3278,
			 3262, 3302, 3271, 3194, 3249, 3306, 3292, 3315, 3337, 3339,
			 3320,  366,  170, 1407,   78,   80, 1481, 1522, 3350, 3362,
			 3373, 3377, 3386, 3396, 3279, 3340, 3400, 3402, 3376, 3411,
			 3383, 3419, 3405, 3436, 3450, 3400, 4950, 1528, 3455, 3467,
			 3477, 3482,  358, 4950, 3486, 3463, 3456, 3491, 3475, 3487,
			 3504, 3523, 3547, 3551, 2334, 3553, 3531, 3485, 3561, 3532,
			 3567, 3578, 3582, 2694, 3587, 3588, 3607, 3618,   74, 3620,

			 3626, 3634, 2742, 3640, 3646, 3569, 3654,   68, 2862, 3629,
			 4950, 4950, 3699, 3742, 3785, 3828, 3871, 3914, 3957, 3999,
			 4037, 4079, 4122, 4165, 4208, 4251, 4293, 4335, 4378, 4421,
			 4464, 4507, 4546, 4587, 4629, 4671, 4704, 4746, 3662, 4788,
			 4830, 4863, 4874, 4895, 4928, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  711,    1,  712,  712,  713,  713,  714,  714,  715,
			  715,  716,  716,  711,  711,  711,  711,  711,  717,  711,
			  718,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,   42,  719,
			  719,  720,  711,  711,  721,  711,   55,   55,   55,   55,
			   59,   59,   59,   59,   59,   59,   61,   59,   59,  711,
			  711,  711,  722,  711,  711,  711,  723,  724,  711,  724,
			  725,  711,  726,  711,  726,  726,  711,  727,  728,  711,
			  711,  711,  711,  717,  711,  729,  711,  729,  729,  730,

			  711,  711,  711,  711,  731,  711,  711,  711,  711,  711,
			  711,  719,  711,  719,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,   42,  719,
			  719,  719,  719,  719,  719,  732,  720,  721,  711,  711,
			  711,  733,  711,  733,  733,   59,   59,   59,   59,  733,
			   59,  733,  733,   59,   59,  733,  733,   59,   59,  733,
			   59,  733,  733,  733,   59,   59,   59,  733,   59,  733,
			   59,  733,  733,   59,   59,  733,  733,   59,   59,  733,
			  733,   59,   59,  733,   59,  733,   59,  711,  722,  711,
			  723,  711,  722,   75,  711,  723,  724,  711,  724,  725,

			  711,  725,  726,  711,  726,  711,  711,  711,  734,  711,
			  727,  728,  711,  711,  211,  735,  711,  711,  711,  711,
			  736,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  719,  719,  719,  719,  719,  719,  719,  719,  711,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,  711,  711,
			  711,  711,  733,  733,  711,  733,   59,   59,  733,   59,
			  733,  733,  733,   59,   59,   59,  733,  733,   59,   59,
			  711,  733,  733,  733,  733,   59,   59,   59,  733,   59,

			  733,   59,  733,  733,   59,   59,  733,  733,   59,   59,
			  733,  733,  733,   59,   59,   59,  733,   59,  733,   59,
			  722,  722,  711,  737,  737,  711,  737,  735,  738,  736,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  719,  719,  719,  719,  719,  719,  719,
			  711,  719,  719,  719,  719,  719,  719,  719,  128,  128,
			  128,  719,  719,  719,  719,  719,  719,  739,  740,  733,
			   59,  733,   59,  733,  733,  733,   59,   59,   59,  733,
			  733,   59,  733,  733,  733,  733,   59,   59,   59,  733,

			   59,  733,  733,   59,   59,  733,  733,   59,   59,  733,
			  733,  733,   59,   59,  733,   59,  320,  711,  711,  741,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  731,  711,  719,  719,  719,  719,  719,  719,
			  711,  719,  719,  719,  719,  719,  719,  719,  719,  719,
			  719,  719,  711,  711,  739,  733,   59,  733,   59,  733,
			  733,   59,   59,  733,  733,   59,  733,  733,  733,  733,
			   59,   59,   59,  733,   59,  733,  733,   59,   59,  733,
			  733,  733,  733,   59,   59,  320,  742,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  743,  719,

			  719,  719,  719,  719,  719,  711,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  711,  711,  711,  733,
			  733,   59,  733,  733,  733,   59,   59,   59,  733,  733,
			  733,  733,   59,   59,   59,  733,   59,  733,  733,   59,
			   59,  733,  733,  733,  733,   59,   59,  320,  744,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  719,  719,  719,  719,  719,  711,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,  711,  711,
			  733,  733,   59,  733,  733,   59,   59,  733,  733,  733,
			  733,   59,   59,   59,  733,   59,  733,  733,   59,   59,

			  733,  733,  733,   59,  722,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  719,  719,  719,
			  711,  719,  719,  719,  719,  719,  711,  711,  733,  733,
			   59,  733,   59,  733,   59,  733,   59,  733,  733,  733,
			   59,  722,  711,  711,  711,  711,  711,  711,  719,  719,
			  719,  719,  719,  719,  711,  711,  733,  733,   59,  733,
			   59,  733,   59,  733,  733,   59,  711,  711,  719,  719,
			  719,  719,  711,  711,  733,  733,   59,  733,   59,  733,
			  719,  719,  719,  719,  711,  733,  733,   59,  733,   59,
			  733,  719,  719,  711,  733,  733,  719,  719,  711,  733,

			  733,  719,  711,  733,  719,  711,  733,  711,  711,  711,
			  711,    0,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    8,    9,    1,   10,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   21,   22,
			   23,   24,   25,   26,    1,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   33,   33,   36,   37,   38,   39,
			   40,   41,   42,   43,   44,   45,   33,   46,   47,   48,
			   33,   49,   50,   51,   52,   53,    1,   54,   55,   56,

			   57,   58,   59,   60,   61,   62,   60,   60,   63,   64,
			   65,   66,   67,   68,   69,   70,   71,   72,   60,   73,
			   74,   75,   60,   76,   77,   78,    1,    1,    1,    1,
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
			   11,   12,   13,   14,    1,   15,    1,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,    1,
			   38,   39,    1,   11,   11,   11,   11,   11,   11,   11,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   41,   42,    1,    1,   43, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  117,  115,    1,    2,   15,   93,   18,
			  115,   16,   17,    7,    6,   13,    5,   11,    8,   84,
			   14,   12,   29,   10,   30,   20,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   69,   77,   77,   77,
			   77,   22,   31,   23,    9,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   24,
			   21,   25,   98,   99,  100,   98,  101,  116,   82,  116,
			  116,  116,  116,  116,  116,  116,   66,  116,  116,   76,
			    1,    2,   28,   93,   92,  113,  113,  113,  113,    3,

			   33,   88,   32,    0,    0,   84,    0,   27,   26,   19,
			    0,   77,   73,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   40,   77,   77,
			   77,   77,   77,   77,   77,    0,    0,    0,   83,    0,
			    0,   79,    0,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   40,   79,   40,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   80,   98,  100,
			    0,   99,   98,   98,   95,   94,    0,   82,    0,    0,

			   81,    0,    0,    0,    0,   66,    0,   64,    0,   63,
			    0,    0,   76,   74,   74,    0,   75,  113,  102,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,    4,
			   34,   88,    0,    0,    0,   86,   88,   86,   84,    0,
			   77,   39,   77,   77,   77,   77,   77,   77,    0,   77,
			   77,   77,   77,   77,   42,   77,   77,   69,   69,   69,
			   69,   77,   77,   77,   77,   77,   41,   77,    0,   67,
			   78,    0,   79,   39,   68,   68,   79,   39,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			    0,   79,   79,   79,   79,   79,   79,   79,   79,   79,

			   42,   42,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   41,   41,   79,   79,
			   98,   96,   81,    0,    0,   65,   63,    0,    0,    0,
			    0,  109,  107,  110,  114,  114,  108,  106,  103,  104,
			  105,   88,    0,   88,    0,    0,   88,    0,    0,    0,
			   87,   84,    0,   77,   77,   38,   77,   77,   77,   77,
			    0,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   37,   44,   77,   77,   77,   77,   62,   60,   79,
			   79,   79,   79,   38,   79,   79,   38,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,

			   79,   79,   79,   79,   79,   37,   44,   37,   44,   79,
			   79,   79,   79,   79,   79,   79,   98,   65,   63,    0,
			  111,   88,   88,    0,    0,   85,   88,    0,   87,    0,
			   87,    0,    0,    0,   77,   77,   77,   77,   45,   77,
			    0,   77,   77,   77,   36,   77,   77,   77,   77,   77,
			   77,   77,    0,   62,    0,   79,   79,   79,   79,   79,
			   79,   79,   79,   45,   79,   45,   79,   79,   79,   36,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   98,    0,    0,   88,    0,
			   91,   88,   87,    0,    0,   87,    0,   86,    0,   77,

			   77,   77,   77,   47,   77,    0,   77,   77,   77,   77,
			   77,   77,   53,   77,   77,   77,    0,    0,   61,   79,
			   79,   79,   79,   79,   47,   79,   79,   47,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   53,   79,   79,   79,   53,   79,   98,    0,    0,
			   88,    0,    0,    0,   87,    0,   91,   87,    0,    0,
			   89,   91,   89,   77,   77,   59,   77,   46,    0,   43,
			   58,   77,   35,   77,   51,   77,   77,   77,    0,    0,
			   79,   79,   79,   59,   79,   59,   79,   46,   43,   58,
			   79,   43,   58,   79,   35,   35,   79,   51,   79,   51,

			   79,   79,   79,   79,   98,    0,   91,    0,   91,    0,
			   87,    0,    0,   90,   91,    0,   90,   77,   77,   77,
			   71,   54,   77,   77,   77,   55,    0,    0,   79,   79,
			   79,   79,   79,   54,   54,   79,   79,   79,   79,   55,
			   79,   97,    0,   91,   90,    0,   90,   90,   77,   77,
			   48,   77,   52,   77,    0,    0,   79,   79,   79,   48,
			   48,   79,   79,   52,   79,   52,  112,   90,   77,   77,
			   77,   77,   70,   70,   79,   79,   79,   79,   79,   79,
			   77,   50,   49,   77,    0,   79,   50,   50,   49,   49,
			   79,   77,   77,    0,   79,   79,   77,   56,    0,   79,

			   56,   77,    0,   79,   57,    0,   57,    0,    0,    0,
			   72,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 4950
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 711
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 712
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

	yyNb_rules: INTEGER is 116
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 117
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
