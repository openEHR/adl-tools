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
--|#line 470 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 470")
end
in_lineno := in_lineno + 1	-- match LF in line
end
end
else
if yy_act <= 101 then
if yy_act = 100 then
--|#line 471 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 471")
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
--|#line 482 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 482")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
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
--|#line 491 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 491")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 492 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 492")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 105 then
--|#line 493 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 493")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 494 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 494")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
end
else
if yy_act <= 108 then
if yy_act = 107 then
--|#line 495 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 495")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 496 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 496")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
--|#line 497 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 497")
end
last_token := V_CHARACTER; last_character_value := '"'
end
end
else
if yy_act <= 113 then
if yy_act <= 111 then
if yy_act = 110 then
--|#line 498 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 498")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
else
--|#line 503 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 503")
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
--|#line 513 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 513")
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
--|#line 523 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 523")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 115 then
if yy_act = 114 then
--|#line 524 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 524")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 528 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 528")
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
			create an_array.make (0, 4957)
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

			  711,  105,  110,  110,  189,  110,   88,  110,  110,  342,
			  110,  342,   79,   79,  343,  110,  110,   90,  110,   90,
			   90,  202,  203,  112,  202,  128,   76,   76,  112,  201,
			  189,  711,   98,  211,  106,  189,  112,  274,   89,  274,
			   80,   80,   81,   82,   83,   81,   82,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   84,   89,
			   81,  134,   81,   81,   81,   81,   81,   81,  111,  131,
			  205,  188,  167,  190,  132,  141,  110,  110,  141,  110,
			  141,  646,  159,  192,  141,  321,  212,  141,  134,  493,
			   81,   81,   86,   81,  666,  111,  131,  112,  145,  168,

			  616,  132,  145,  207,  207,  145,  207,  145,  431,  160,
			  113,  145,  114,  145,  145,  189,  192,   81,   81,   81,
			   81,   82,   83,   81,   82,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   84,  113,   81,  114,
			   81,   81,   81,   81,   81,   81,  110,  110,  644,  110,
			  139,  110,  110,  139,  110,  610,  110,  110,  190,  110,
			  140,  141,  110,  110,  432,  110,  351,  112,   81,   81,
			   86,   81,  112,  169,  610,  193,  115,  112,  211,  194,
			  116,  118,  608,  112,  110,  110,  423,  110,  145,  110,
			  110,  117,  110,  119,  120,   81,   81,   81,  110,  110,

			  170,  110,  197,  115,  236,  112,  642,  116,  118,  124,
			  112,  498,  627,  110,  110,  237,  110,  231,  117,  112,
			  119,  120,  195,  626,  121,  122,  110,  110,  232,  110,
			  123,  212,  557,  198,  112,  125,  124,  200,  110,  110,
			  126,  110,  237,  135,  135,  149,  106,  112,  135,  135,
			  233,  121,  122,  127,  141,  232,  141,  123,  129,  112,
			  684,  199,  125,  684,  141,  179,  130,  126,  198,  613,
			  180,  189,  150,  189,  145,  133,  203,  203,  333,  203,
			  127,  145,  557,  145,  135,  129,  334,  335,  151,  145,
			  141,  145,  181,  130,  422,  611,  199,  182,  193,  152,

			  193,  193,  133,  139,  206,  203,  139,  206,  145,  606,
			  550,  135,  135,  140,  190,  153,  190,  145,  207,  208,
			  268,  141,  142,  145,  209,  205,  154,  423,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  143,  141,  144,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  269,  550,  558,  205,  141,  145,  145,  146,  145,  145,
			  145,  145,  145,  145,  147,  145,  148,  145,  145,  145,
			  145,  145,  146,  145,  145,  145,  145,  155,  430,  556,
			  141,  110,  110,  141,  110,  171,  141,  141,  141,  156,
			  161,  162,  141,  141,  555,  141,  163,  197,  172,  183,

			  175,  488,  112,  551,  157,  141,  145,  145,  176,  505,
			  145,  431,  173,  145,  145,  145,  158,  164,  165,  145,
			  145,  145,  145,  166,  141,  174,  184,  177,  198,  103,
			  496,  104,  145,  238,  423,  178,  141,  110,  110,  494,
			  110,  110,  110,  139,  110,  185,  139,  209,  209,  139,
			  209,  145,  139,  140,  110,  110,  199,  110,  112,  140,
			  248,  139,  112,  145,  139,  428,  106,  229,  248,  229,
			  229,  140,  186,  188,  188,  112,  188,  188,  188,  189,
			  191,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  192,

			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  188,  190,  188,  188,  188,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  188,  188,
			  188,  206,  203,  221,  206,  110,  110,  222,  110,  110,
			  110,  103,  110,  490,  200,  207,  223,  110,  110,  489,
			  110,  209,  433,  492,  327,  327,  112,  327,  110,  110,
			  112,  110,  110,  110,  350,  110,  495,  241,  112,  240,
			  429,  110,  110,  425,  110,  198,  224,  215,  424,  112,

			  205,  214,  214,  112,  214,  225,  493,  189,  343,  420,
			  139,  226,  112,  139,  241,  227,  240,  228,  252,  431,
			  140,  262,  242,  199,  215,  246,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  262,  242,
			  190,  349,  246,  349,  110,  110,  350,  110,  330,  110,
			  110,  294,  110,  139,  326,  418,  139,  326,  453,  453,
			  417,  453,  378,  140,  320,  112,  377,  216,  217,  217,
			  112,  217,  217,  217,  217,  219,  217,  217,  218,  217,
			  217,  217,  217,  217,  217,  217,  217,  220,  217,  217,

			  217,  217,  217,  217,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  217,  217,  217,  217,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  217,  217,  217,  110,  110,  352,  110,
			  110,  110,  345,  110,  110,  110,  344,  110,  110,  110,
			  340,  110,  141,  110,  110,  421,  110,  112,  103,  491,
			  104,  112,  351,  333,  141,  112,  487,  244,  339,  112,
			  497,  334,  335,  245,  112,  110,  110,  243,  110,  145,

			  250,  338,  139,  251,  247,  139,  249,  110,  110,  337,
			  110,  145,  140,  487,  244,  106,  112,  497,  110,  110,
			  245,  110,  110,  110,  243,  110,  336,  250,  112,  332,
			  251,  247,  139,  249,  128,  139,  272,  253,  331,  112,
			  290,  330,  140,  112,  257,  255,  141,  328,  258,  254,
			  256,  259,  111,  110,  110,  711,  110,  260,  141,  110,
			  110,  201,  110,  272,  253,  110,  110,  271,  110,  550,
			  270,  257,  255,  145,  112,  258,  254,  256,  259,  111,
			  112,  138,  261,  390,  260,  145,  112,  110,  110,  268,
			  110,  239,  263,  234,  265,  360,  264,  110,  110,  230,

			  110,  139,  423,  274,  139,  275,  360,  229,  112,  261,
			  218,  140,  141,  141,  141,  552,  360,  273,  112,  263,
			  141,  265,  272,  264,  141,  141,  141,  266,  139,  273,
			  554,  139,  141,  360,  141,  278,   94,  233,  140,  145,
			  145,  145,  552,  267,  277,  139,  141,  145,  139,  276,
			  280,  145,  145,  145,  266,  140,  273,  139,  440,  145,
			  139,  145,  279,  493,  141,   91,  281,  140,  278,  440,
			  267,  139,  282,  145,  139,  139,  141,  283,  139,  440,
			  141,  140,  141,  201,  281,  140,  280,  187,  138,  286,
			  282,  145,  141,  284,  141,  278,  440,  287,  139,  285,

			  368,  139,  109,  145,  108,  286,  557,  145,  140,  145,
			  111,  281,  107,  280,  141,  287,  288,  282,  102,  145,
			  139,  145,  141,  139,  289,   99,  141,  291,  327,  327,
			  140,  327,  286,  141,  141,  292,  291,  111,  293,  431,
			  141,  145,  287,  110,  110,  141,  110,  292,  294,  145,
			  293,  711,  141,  145,  295,   94,  139,  298,  141,  139,
			  145,  145,  296,  291,  112,  297,  140,  145,  139,   92,
			  141,  139,  145,  139,  292,  300,  139,  293,  140,  145,
			  141,   91,  302,  140,  299,  145,  139,  202,  203,  139,
			  202,  141,  141,  711,  303,  612,  140,  145,  298,  711,

			  302,  139,  301,  141,  139,  139,  711,  145,  139,  304,
			  300,  140,  141,  610,  303,  140,  306,  348,  145,  145,
			  141,  305,  612,  139,  141,  298,  139,  302,  110,  110,
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
			  232,  205,  347,  139,  711,  318,  139,  145,  711,  711,
			  427,  368,  427,  140,  112,  428,  205,  711,  711,  380,
			  205,  323,  324,  325,  323,  324,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  207,  110,  110,  323,
			  110,  323,  326,  323,  323,  323,  323,  110,  110,  711,
			  110,  139,  110,  110,  139,  110,  110,  110,  112,  110,

			  549,  140,  549,  110,  110,  550,  110,  141,  112,  323,
			  323,  205,  323,  112,  353,  711,  711,  112,  399,  141,
			  354,  356,  110,  110,  112,  110,  647,  606,  110,  110,
			  361,  110,  110,  110,  145,  110,  323,  323,  323,  214,
			  214,  353,  214,  112,  711,  399,  145,  354,  356,  112,
			  369,  711,  711,  112,  359,  209,  209,  361,  209,  431,
			  423,  363,  215,  357,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  110,  110,  363,  110,
			  357,  110,  110,  711,  110,  110,  110,  711,  110,  110,

			  110,  667,  110,  110,  110,  613,  110,  112,  110,  110,
			  711,  110,  112,  711,  711,  216,  112,  711,  110,  110,
			  112,  110,  711,  141,  112,  362,  365,  358,  364,  112,
			  110,  110,  384,  110,  493,  141,  370,  367,  431,  112,
			  110,  110,  711,  110,  110,  110,  366,  110,  711,  711,
			  145,  112,  362,  365,  358,  364,  711,  110,  110,  387,
			  110,  112,  145,  141,  367,  112,  371,  110,  110,  372,
			  110,  110,  110,  366,  110,  141,  139,  139,  112,  139,
			  139,  139,  141,  373,  139,  381,  140,  140,  112,  390,
			  145,  140,  112,  371,  141,  644,  372,  374,  139,  141,

			  711,  139,  145,  383,  139,  381,  711,  139,  140,  145,
			  373,  141,  382,  379,  140,  384,  711,  376,  375,  141,
			  711,  145,  141,  711,  374,  141,  145,  383,  493,  711,
			  386,  141,  381,  139,  141,  385,  139,  141,  145,  711,
			  379,  389,  384,  140,  376,  385,  145,  139,  271,  145,
			  139,  711,  145,  139,  383,  360,  139,  140,  145,  711,
			  711,  145,  388,  140,  145,  711,  360,  139,  391,  711,
			  139,  141,  385,  711,  389,  139,  360,  140,  139,  139,
			  392,  392,  139,  141,  141,  140,  559,  393,  559,  140,
			  141,  557,  394,  360,  203,  203,  141,  203,  145,  393,

			  394,  389,  141,  141,  711,  399,  139,  396,  392,  139,
			  145,  145,  395,  141,  393,  141,  140,  145,  401,  398,
			  711,  711,  711,  145,  141,  141,  397,  394,  402,  145,
			  145,  401,  400,  711,  139,  402,  141,  139,  139,  395,
			  145,  139,  145,  205,  140,  401,  711,  711,  140,  141,
			  711,  145,  145,  141,  711,  404,  139,  406,  403,  139,
			  405,  141,  402,  145,  711,  141,  140,  406,  139,  139,
			  405,  139,  139,  141,  711,  711,  145,  141,  140,  140,
			  145,  711,  711,  711,  408,  141,  141,  407,  145,  141,
			  141,  409,  145,  139,  406,  409,  139,  405,  141,  411,

			  145,  410,  141,  140,  145,  711,  711,  141,  410,  141,
			  711,  711,  145,  145,  711,  711,  145,  145,  412,  141,
			  411,  141,  409,  324,  325,  145,  324,  421,  413,  145,
			  414,  426,  711,  711,  145,  410,  145,  207,  232,  414,
			  711,  139,  347,  326,  139,  711,  145,  711,  145,  110,
			  110,  140,  110,  139,  711,  711,  139,  415,  110,  110,
			  233,  110,  711,  140,  348,  232,  414,  189,  139,  347,
			  112,  139,  205,  110,  110,  711,  110,  711,  140,  112,
			  416,  110,  110,  711,  110,  455,  711,  416,  416,  416,
			  416,  416,  416,  434,  112,  139,  453,  453,  139,  453,

			  110,  110,  112,  110,  711,  140,  435,  711,  110,  110,
			  190,  110,  455,  416,  416,  416,  416,  416,  416,  416,
			  434,  112,  110,  110,  436,  110,  711,  110,  110,  112,
			  110,  110,  110,  435,  110,  110,  110,  438,  110,  369,
			  711,  711,  437,  112,  711,  711,  711,  439,  112,  111,
			  141,  436,  112,  111,  110,  110,  112,  110,  110,  110,
			  441,  110,  141,  711,  438,  110,  110,  443,  110,  437,
			  110,  110,  711,  110,  439,  112,  111,  145,  442,  112,
			  111,  141,  370,  711,  711,  139,  112,  441,  139,  145,
			  444,  112,  111,  141,  443,  140,  111,  445,  446,  111,

			  110,  110,  711,  110,  711,  442,  110,  110,  145,  110,
			  447,  110,  110,  480,  110,  110,  110,  444,  110,  111,
			  145,  112,  711,  111,  445,  446,  111,  112,  110,  110,
			  711,  110,  112,  141,  711,  711,  112,  447,  711,  141,
			  480,  110,  110,  449,  110,  141,  711,  457,  711,  112,
			  568,  141,  455,  450,  448,  139,  452,  141,  139,  711,
			  145,  711,  112,  711,  451,  140,  145,  568,  711,  141,
			  449,  568,  145,  139,  458,  459,  139,  711,  145,  456,
			  450,  448,  139,  140,  145,  139,  141,  711,  457,  711,
			  139,  451,  140,  139,  568,  141,  145,  516,  141,  711,

			  140,  139,  461,  460,  139,  141,  468,  141,  516,  463,
			  711,  140,  711,  145,  711,  457,  459,  141,  517,  463,
			  110,  110,  145,  110,  460,  145,  464,  711,  139,  711,
			  462,  139,  145,  472,  145,  516,  465,  139,  140,  139,
			  139,  112,  139,  459,  145,  139,  463,  140,  139,  140,
			  141,  460,  141,  464,  491,  140,  711,  141,  466,  711,
			  141,  466,  141,  139,  141,  553,  139,  473,  139,  141,
			  467,  139,  141,  140,  711,  468,  711,  145,  140,  145,
			  467,  469,  711,  139,  145,  470,  139,  145,  466,  145,
			  711,  145,  553,  140,  474,  473,  145,  471,  711,  145,

			  139,  711,  468,  139,  141,  141,  711,  467,  469,  711,
			  140,  479,  110,  110,  711,  110,  141,  141,  141,  475,
			  476,  711,  473,  475,  139,  141,  711,  139,  480,  711,
			  141,  145,  145,  112,  140,  711,  479,  141,  479,  711,
			  476,  711,  491,  145,  145,  145,  477,  478,  452,  481,
			  475,  139,  145,  347,  139,  484,  711,  145,  141,  711,
			  482,  140,  139,  483,  145,  139,  452,  476,  110,  110,
			  141,  110,  140,  711,  711,  348,  481,  561,  110,  110,
			  347,  110,  711,  110,  110,  145,  110,  482,  562,  112,
			  139,  110,  110,  139,  110,  693,  711,  145,  485,  112,

			  140,  711,  711,  693,  112,  485,  485,  485,  485,  485,
			  485,  501,  112,  519,  500,  562,  693,  711,  711,  499,
			  711,  110,  110,  711,  110,  504,  110,  110,  711,  110,
			  693,  485,  485,  485,  485,  485,  485,  485,  501,  711,
			  711,  500,  112,  110,  110,  711,  110,  112,  110,  110,
			  502,  110,  504,  110,  110,  506,  110,  110,  110,  711,
			  110,  711,  503,  711,  112,  711,  518,  110,  110,  112,
			  110,  507,  141,  711,  112,  522,  711,  502,  112,  711,
			  711,  508,  506,  141,  141,  711,  509,  139,  112,  503,
			  139,  110,  110,  510,  110,  141,  511,  140,  507,  145,

			  110,  110,  525,  110,  110,  110,  711,  110,  508,  519,
			  145,  145,  112,  509,  110,  110,  139,  110,  711,  139,
			  510,  112,  145,  511,  711,  112,  140,  141,  654,  512,
			  711,  514,  654,  513,  139,  112,  581,  139,  520,  141,
			  139,  141,  711,  139,  140,  523,  711,  711,  141,  654,
			  140,  515,  520,  141,  145,  711,  512,  524,  514,  654,
			  513,  139,  522,  582,  139,  521,  145,  139,  145,  523,
			  139,  140,  526,  139,  711,  145,  139,  140,  515,  520,
			  145,  524,  139,  140,  527,  139,  141,  711,  711,  522,
			  529,  141,  140,  141,  530,  528,  523,  711,  141,  711,

			  531,  531,  529,  141,  139,  141,  139,  139,  524,  139,
			  530,  141,  711,  145,  140,  535,  140,  532,  145,  711,
			  145,  533,  528,  141,  711,  145,  711,  531,  534,  529,
			  145,  711,  145,  535,  711,  141,  711,  530,  145,  538,
			  141,  139,  536,  607,  139,  607,  537,  141,  608,  711,
			  145,  140,  141,  139,  139,  537,  139,  139,  139,  141,
			  535,  139,  145,  140,  140,  141,  540,  145,  140,  541,
			  538,  141,  141,  537,  145,  139,  542,  141,  139,  145,
			  711,  711,  539,  541,  141,  140,  145,  542,  110,  110,
			  711,  110,  145,  543,  711,  711,  545,  538,  145,  145,

			  711,  711,  711,  546,  145,  110,  110,  711,  110,  112,
			  541,  145,  544,  609,  542,  609,  110,  110,  610,  110,
			  543,  578,  711,  711,  110,  110,  112,  110,  139,  711,
			  563,  139,  578,  110,  110,  711,  110,  112,  140,  544,
			  547,  564,  579,  110,  110,  112,  110,  547,  547,  547,
			  547,  547,  547,  565,  112,  139,  711,  563,  139,  578,
			  110,  110,  711,  110,  112,  140,  711,  711,  564,  566,
			  711,  711,  711,  547,  547,  547,  547,  547,  547,  547,
			  565,  112,  579,  711,  569,  110,  110,  711,  110,  110,
			  110,  711,  110,  579,  567,  711,  566,  110,  110,  711,

			  110,  110,  110,  579,  110,  711,  112,  711,  711,  711,
			  112,  569,  110,  110,  570,  110,  110,  110,  112,  110,
			  579,  567,  112,  110,  110,  139,  110,  711,  139,  139,
			  573,  571,  139,  112,  711,  140,  711,  112,  572,  140,
			  574,  570,  711,  711,  112,  110,  110,  711,  110,  110,
			  110,  615,  110,  615,  580,  711,  616,  573,  571,  139,
			  711,  584,  139,  575,  711,  572,  112,  574,  139,  140,
			  112,  139,  576,  139,  141,  141,  139,  577,  140,  583,
			  711,  580,  711,  140,  581,  584,  141,  141,  584,  645,
			  575,  645,  711,  139,  646,  139,  139,  583,  139,  576,

			  711,  145,  145,  140,  577,  140,  585,  587,  711,  711,
			  711,  581,  586,  145,  145,  139,  141,  141,  139,  141,
			  711,  589,  589,  141,  583,  140,  141,  139,  141,  141,
			  139,  141,  588,  141,  587,  141,  588,  140,  141,  711,
			  590,  711,  594,  145,  145,  141,  145,  711,  592,  589,
			  145,  139,  711,  145,  139,  145,  145,  590,  145,  591,
			  145,  140,  145,  588,  711,  145,  141,  593,  594,  595,
			  596,  139,  145,  141,  139,  141,  597,  711,  141,  139,
			  596,  140,  139,  614,  590,  141,  711,  141,  139,  140,
			  600,  139,  620,  145,  612,  594,  711,  598,  140,  597,

			  145,  139,  145,  599,  139,  145,  141,  596,  631,  620,
			  711,  140,  145,  620,  145,  601,  348,  603,  141,  600,
			  711,  612,  110,  110,  711,  110,  597,  110,  110,  602,
			  110,  110,  110,  145,  110,  632,  620,  110,  110,  711,
			  110,  711,  601,  112,  139,  145,  600,  139,  112,  711,
			  110,  110,  112,  110,  140,  655,  602,  604,  112,  655,
			  139,  618,  617,  139,  604,  604,  604,  604,  604,  604,
			  140,  112,  711,  711,  711,  711,  655,  619,  110,  110,
			  711,  110,  110,  110,  628,  110,  655,  711,  618,  617,
			  604,  604,  604,  604,  604,  604,  604,  110,  110,  112, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  110,  711,  711,  112,  619,  110,  110,  711,  110,  110,
			  110,  628,  110,  110,  110,  711,  110,  711,  112,  110,
			  110,  672,  110,  711,  141,  672,  112,  711,  110,  110,
			  112,  110,  110,  110,  112,  110,  141,  711,  141,  711,
			  112,  711,  672,  621,  139,  622,  141,  139,  623,  112,
			  141,  145,  672,  112,  140,  629,  139,  711,  141,  139,
			  624,  625,  711,  145,  139,  145,  140,  139,  141,  711,
			  621,  711,  622,  145,  140,  623,  139,  145,  629,  139,
			  141,  139,  630,  631,  139,  145,  140,  624,  625,  139,
			  141,  140,  139,  139,  139,  145,  139,  139,  139,  140,

			  141,  139,  141,  140,  140,  629,  141,  145,  140,  141,
			  631,  633,  141,  139,  711,  711,  139,  145,  141,  711,
			  635,  141,  139,  140,  711,  139,  556,  145,  711,  145,
			  635,  139,  140,  145,  139,  633,  145,  612,  634,  145,
			  141,  140,  637,  139,  637,  145,  139,  636,  145,  711,
			  711,  711,  141,  140,  638,  110,  110,  635,  110,  348,
			  639,  711,  633,  711,  612,  110,  110,  145,  110,  637,
			  698,  640,  110,  110,  139,  110,  112,  139,  698,  145,
			  711,  638,  648,  711,  140,  711,  112,  639,  711,  110,
			  110,  698,  110,  112,  110,  110,  711,  110,  649,  110,

			  110,  650,  110,  110,  110,  698,  110,  711,  139,  648,
			  112,  139,  711,  110,  110,  112,  110,  711,  140,  139,
			  112,  651,  139,  139,  112,  649,  139,  652,  650,  140,
			  141,  711,  653,  140,  112,  656,  711,  139,  657,  711,
			  139,  141,  141,  711,  141,  659,  661,  140,  651,  711,
			  661,  711,  657,  141,  652,  711,  141,  145,  711,  653,
			  139,  711,  656,  139,  141,  658,  659,  663,  145,  145,
			  140,  145,  660,  662,  711,  139,  141,  661,  139,  657,
			  145,  110,  110,  145,  110,  140,  110,  110,  663,  110,
			  711,  145,  711,  659,  665,  110,  110,  711,  110,  711,

			  711,  711,  112,  145,  664,  110,  110,  112,  110,  110,
			  110,  711,  110,  668,  711,  663,  112,  110,  110,  139,
			  110,  673,  139,  141,  711,  673,  112,  141,  669,  140,
			  112,  664,  711,  139,  670,  141,  139,  711,  112,  141,
			  668,  141,  673,  140,  675,  677,  139,  711,  711,  139,
			  145,  674,  673,  141,  145,  669,  140,  141,  711,  671,
			  139,  670,  145,  139,  139,  711,  145,  139,  145,  141,
			  140,  676,  678,  139,  140,  675,  139,  711,  674,  711,
			  145,  711,  711,  140,  145,  139,  671,  711,  139,  677,
			  110,  110,  711,  110,  711,  140,  145,  110,  110,  711,

			  110,  705,  675,  110,  110,  711,  110,  110,  110,  141,
			  110,  112,  705,  141,  685,  679,  677,  139,  112,  680,
			  139,  141,  705,  139,  112,  141,  139,  140,  112,  688,
			  686,  711,  711,  140,  709,  139,  145,  711,  139,  705,
			  145,  685,  679,  681,  682,  140,  680,  711,  145,  711,
			  711,  709,  145,  683,  711,  709,  689,  687,  110,  110,
			  711,  110,  711,  686,  688,  110,  110,  711,  110,  711,
			  681,  682,  110,  110,  139,  110,  711,  139,  709,  112,
			  683,  690,  110,  110,  140,  110,  112,  711,  711,  139,
			  686,  688,  139,  112,  141,  139,  711,  141,  139,  140,

			  691,  139,  707,  112,  139,  140,  141,  711,  690,  141,
			  711,  140,  711,  707,  110,  110,  694,  110,  711,  139,
			  692,  145,  139,  707,  145,  110,  110,  691,  110,  140,
			  711,  711,  711,  145,  139,  112,  145,  139,  711,  695,
			  707,  711,  711,  694,  140,  711,  112,  692,  110,  110,
			  711,  110,  110,  110,  697,  110,  110,  110,  139,  110,
			  696,  139,  710,  700,  139,  699,  695,  139,  140,  112,
			  711,  711,  139,  112,  140,  139,  711,  112,  711,  710,
			  711,  697,  140,  710,  711,  704,  701,  696,  110,  110,
			  700,  110,  699,  711,  139,  711,  703,  139,  711,  711,

			  711,  706,  711,  711,  140,  711,  710,  711,  711,  112,
			  419,  711,  704,  701,  711,  419,  419,  419,  419,  419,
			  419,  711,  711,  703,  711,  711,  711,  711,  706,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,

			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,

			   85,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   93,   93,  711,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,  711,   93,   93,   93,   93,   93,   95,   95,  711,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  111,  111,  111,  711,  711,  711,  711,  711,  711,  111,
			  711,  711,  111,  711,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  711,  711,  111,  111,
			  111,  136,  136,  711,  136,  136,  711,  136,  711,  711,
			  711,  711,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,

			  136,  136,  136,  136,  711,  711,  136,  136,  136,  137,
			  137,  711,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  188,  188,  711,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  190,  190,  190,  190,  190,

			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  711,  199,  199,  199,  199,  199,  199,  199,  199,  199,

			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  204,  204,  204,  711,  711,  711,
			  204,  204,  711,  204,  711,  711,  711,  711,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  711,  204,  204,  204,  204,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,

			  210,  210,  210,  210,  210,  210,  210,  210,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  217,  217,  711,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,  235,  235,  235,
			  235,  235,  235,  235,  235,  711,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  135,  135,  711,  135,  135,  711,  135,  135,  711,  711,
			  711,  135,  135,  135,  135,  135,  135,  135,  135,  135,

			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135,  711,  711,  135,  135,  135,  141,  711,
			  141,  141,  711,  711,  711,  711,  711,  141,  711,  711,
			  711,  711,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  711,  711,  141,  141,  141,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,

			  208,  208,  216,  216,  216,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  711,  711,
			  711,  711,  711,  216,  329,  711,  329,  711,  711,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  711,  711,  329,  329,  329,  323,  323,  323,  323,
			  323,  323,  711,  323,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  323,  323,  323,

			  323,  323,  323,  323,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  711,  323,  323,  323,  323,  454,
			  454,  454,  711,  711,  711,  454,  454,  711,  454,  711,
			  711,  711,  711,  454,  454,  454,  454,  454,  454,  454,
			  454,  454,  454,  454,  454,  454,  454,  454,  454,  454,
			  454,  454,  454,  454,  454,  711,  711,  454,  454,  454,
			  378,  378,  378,  711,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  711,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,

			  378,  378,  378,  486,  711,  711,  711,  711,  486,  486,
			  486,  486,  486,  486,  548,  711,  711,  711,  711,  548,
			  548,  548,  548,  548,  548,  560,  560,  560,  560,  560,
			  560,  560,  560,  711,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  605,  711,
			  711,  711,  711,  605,  605,  605,  605,  605,  605,   13,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,

			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711, yy_Dummy>>,
			1, 1958, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 4957)
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

			  190,   29,   37,   37,  190,   37,   12,   46,   46,  232,
			   46,  232,    5,    6,  232,   50,   50,   90,   50,   90,
			   90,   82,   82,   37,   82,   46,    3,    4,   46,  201,
			   72,  195,   20,   87,   29,  195,   50,  274,   11,  274,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   12,
			    9,   50,    9,    9,    9,    9,    9,    9,   48,   48,
			   82,  192,   62,   72,   48,   60,   36,   36,   56,   36,
			   56,  645,   60,  192,   62,  192,   87,   60,   50,  644,
			    9,    9,    9,    9,  642,   48,   48,   36,   56,   62,

			  615,   48,   60,  207,  207,   56,  207,   56,  613,   60,
			   36,   62,   36,   56,   60,  188,  192,    9,    9,    9,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   36,   10,   36,
			   10,   10,   10,   10,   10,   10,   39,   39,  611,   39,
			  139,   38,   38,  139,   38,  610,   40,   40,  188,   40,
			  139,   63,   41,   41,  351,   41,  351,   39,   10,   10,
			   10,   10,   38,   63,  609,   76,   38,   40,  210,   76,
			   39,   40,  607,   41,   43,   43,  606,   43,   63,   42,
			   42,   39,   42,   40,   41,   10,   10,   10,   44,   44,

			   63,   44,   77,   38,  104,   43,  605,   39,   40,   43,
			   42,  433,  579,   45,   45,  104,   45,  101,   39,   44,
			   40,   41,   76,  578,   42,   42,   47,   47,  101,   47,
			   42,  210,  559,   77,   45,   44,   43,   79,   49,   49,
			   45,   49,  104,   51,   51,   57,  433,   47,   51,   51,
			  101,   42,   42,   45,   57,  101,   57,   42,   47,   49,
			  672,   77,   44,  672,   66,   66,   47,   45,   79,  558,
			   66,  321,   57,  641,   57,   49,   83,   83,  223,   83,
			   45,   57,  557,   57,   51,   47,  223,  223,   58,   57,
			   58,   66,   66,   47,  343,  555,   79,   66,  193,   58,

			  193,  193,   49,   55,   84,   84,   55,   84,   58,  551,
			  550,  136,  136,   55,  321,   58,  641,   58,   84,   84,
			  136,   55,   55,   58,   84,   83,   58,  343,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			  136,  549,  496,   84,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   59,  350,  494,
			   61,  110,  110,   64,  110,   64,   59,   67,   59,   59,
			   61,   61,   61,   65,  493,   64,   61,  196,   64,   67,

			   65,  422,  110,  489,   59,   65,   59,   61,   65,  440,
			   64,  350,   64,   59,   67,   59,   59,   61,   61,   61,
			   65,   59,   64,   61,   68,   64,   67,   65,  196,  105,
			  431,  105,   65,  105,  422,   65,   68,  111,  111,  429,
			  111,  120,  120,  141,  120,   68,  141,  209,  209,  159,
			  209,   68,  159,  141,  241,  241,  196,  241,  111,  159,
			  120,  273,  120,   68,  273,  427,  105,  229,  159,  229,
			  229,  273,   68,   75,   75,  241,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   85,   85,   98,   85,  113,  113,   98,  113,  114,
			  114,  425,  114,  424,  198,   85,   98,  123,  123,  423,
			  123,   85,  352,  428,  215,  215,  113,  215,  130,  130,
			  114,  130,  115,  115,  349,  115,  430,  114,  123,  113,
			  348,  118,  118,  345,  118,  198,   98,  215,  344,  130,

			   85,   88,   88,  115,   88,   98,  428,  191,  342,  330,
			  163,   98,  118,  163,  114,   98,  113,   98,  123,  430,
			  163,  130,  115,  198,   88,  118,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,  130,  115,
			  191,  237,  118,  237,  254,  254,  237,  254,  329,  260,
			  260,  163,  260,  300,  326,  326,  300,  326,  377,  377,
			  323,  377,  271,  300,  191,  254,  268,   88,   96,   96,
			  260,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,  116,  116,  239,  116,
			  117,  117,  234,  117,  119,  119,  233,  119,  121,  121,
			  228,  121,  145,  122,  122,  421,  122,  116,  238,  432,
			  238,  117,  238,  335,  145,  119,  421,  117,  227,  121,
			  432,  335,  335,  117,  122,  124,  124,  116,  124,  145,

			  122,  226,  143,  122,  119,  143,  121,  125,  125,  225,
			  125,  145,  143,  421,  117,  238,  124,  432,  126,  126,
			  117,  126,  127,  127,  116,  127,  224,  122,  125,  222,
			  122,  119,  287,  121,  128,  287,  143,  124,  221,  126,
			  160,  220,  287,  127,  128,  126,  160,  219,  128,  125,
			  127,  128,  128,  129,  129,  214,  129,  128,  160,  131,
			  131,  199,  131,  143,  124,  132,  132,  142,  132,  488,
			  140,  128,  126,  160,  129,  128,  125,  127,  128,  128,
			  131,  137,  129,  287,  128,  160,  132,  133,  133,  135,
			  133,  106,  131,  103,  132,  248,  131,  134,  134,  100,

			  134,  144,  488,  146,  144,  146,  248,   99,  133,  129,
			   95,  144,  146,  147,  148,  490,  248,  148,  134,  131,
			  150,  132,  147,  131,  146,  147,  148,  133,  149,  144,
			  492,  149,  150,  248,  153,  150,   93,  490,  149,  146,
			  147,  148,  490,  134,  148,  151,  153,  150,  151,  147,
			  153,  146,  147,  148,  133,  151,  144,  152,  360,  150,
			  152,  153,  150,  492,  154,   91,  154,  152,  149,  360,
			  134,  155,  154,  153,  155,  156,  154,  153,  156,  360,
			  157,  155,  158,   80,  152,  156,  151,   69,   54,  157,
			  152,  154,  157,  154,  158,  149,  360,  158,  161,  154,

			  368,  161,   35,  154,   34,  155,  495,  157,  161,  158,
			  368,  152,   32,  151,  164,  156,  157,  152,   28,  157,
			  162,  158,  166,  162,  158,   26,  164,  164,  327,  327,
			  162,  327,  155,  165,  166,  165,  161,  368,  165,  495,
			  168,  164,  156,  266,  266,  165,  266,  162,  166,  166,
			  162,  327,  168,  164,  164,   18,  167,  168,  170,  167,
			  165,  166,  165,  161,  266,  165,  167,  168,  169,   17,
			  170,  169,  165,  171,  162,  170,  171,  162,  169,  168,
			  173,   16,  173,  171,  168,  170,  172,  202,  202,  172,
			  202,  174,  173,   13,  174,  556,  172,  170,  167,    0,

			  171,  176,  170,  174,  176,  175,    0,  173,  175,  173,
			  169,  176,  177,  554,  172,  175,  177,  556,  174,  173,
			  178,  174,  556,  179,  177,  167,  179,  171,  243,  243,
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
			  231,  203,  236,  316,    0,  185,  316,  276,    0,    0,
			  347,  257,  347,  316,  257,  347,  204,    0,    0,  276,
			  206,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  240,  240,  208,
			  240,  208,  208,  208,  208,  208,  208,  244,  244,    0,
			  244,  298,  242,  242,  298,  242,  249,  249,  240,  249,

			  487,  298,  487,  247,  247,  487,  247,  277,  244,  208,
			  208,  208,  208,  242,  240,    0,    0,  249,  298,  277,
			  242,  244,  245,  245,  247,  245,  616,  643,  251,  251,
			  249,  251,  258,  258,  277,  258,  208,  208,  208,  211,
			  211,  240,  211,  245,    0,  298,  277,  242,  244,  251,
			  258,    0,    0,  258,  247,  418,  418,  249,  418,  616,
			  643,  251,  211,  245,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  246,  246,  251,  246,
			  245,  250,  250,    0,  250,  252,  252,    0,  252,  253,

			  253,  646,  253,  255,  255,  647,  255,  246,  256,  256,
			    0,  256,  250,    0,    0,  211,  252,    0,  259,  259,
			  253,  259,    0,  284,  255,  250,  253,  246,  252,  256,
			  261,  261,  284,  261,  646,  284,  259,  256,  647,  259,
			  262,  262,    0,  262,  263,  263,  255,  263,    0,    0,
			  284,  261,  250,  253,  246,  252,    0,  264,  264,  284,
			  264,  262,  284,  289,  256,  263,  261,  265,  265,  262,
			  265,  267,  267,  255,  267,  289,  272,  278,  264,  272,
			  278,  281,  279,  263,  281,  279,  272,  278,  265,  289,
			  289,  281,  267,  261,  279,  667,  262,  264,  280,  283,

			    0,  280,  289,  283,  282,  278,    0,  282,  280,  279,
			  263,  283,  279,  272,  282,  281,    0,  267,  265,  285,
			    0,  279,  301,    0,  264,  288,  283,  280,  667,    0,
			  283,  285,  278,  286,  301,  285,  286,  288,  283,    0,
			  272,  288,  281,  286,  267,  282,  285,  291,  290,  301,
			  291,    0,  288,  292,  280,  290,  292,  291,  285,    0,
			    0,  301,  285,  292,  288,    0,  290,  293,  288,    0,
			  293,  295,  282,    0,  286,  302,  290,  293,  302,  294,
			  295,  291,  294,  295,  297,  302,  497,  292,  497,  294,
			  296,  497,  297,  290,  325,  325,  297,  325,  295,  296,

			  293,  286,  296,  299,    0,  299,  303,  295,  291,  303,
			  295,  297,  294,  304,  292,  299,  303,  296,  302,  297,
			    0,    0,    0,  297,  305,  304,  296,  293,  305,  296,
			  299,  304,  299,    0,  306,  303,  305,  306,  307,  294,
			  304,  307,  299,  325,  306,  302,    0,    0,  307,  308,
			    0,  305,  304,  309,    0,  305,  310,  309,  304,  310,
			  308,  308,  303,  305,    0,  309,  310,  307,  311,  312,
			  306,  311,  312,  315,    0,    0,  308,  313,  311,  312,
			  309,    0,    0,    0,  309,  315,  314,  308,  308,  313,
			  317,  313,  309,  318,  307,  310,  318,  306,  314,  315,

			  315,  314,  317,  318,  313,    0,    0,  386,  311,  319,
			    0,    0,  315,  314,    0,    0,  313,  317,  313,  386,
			  312,  319,  310,  324,  324,  314,  324,  341,  314,  317,
			  319,  346,    0,    0,  386,  311,  319,  324,  341,  318,
			    0,  379,  346,  324,  379,    0,  386,    0,  319,  353,
			  353,  379,  353,  383,    0,    0,  383,  319,  355,  355,
			  341,  355,    0,  383,  346,  341,  318,  320,  405,  346,
			  353,  405,  324,  354,  354,    0,  354,    0,  405,  355,
			  320,  356,  356,    0,  356,  379,    0,  320,  320,  320,
			  320,  320,  320,  353,  354,  406,  453,  453,  406,  453,

			  357,  357,  356,  357,    0,  406,  354,    0,  358,  358,
			  320,  358,  379,  320,  320,  320,  320,  320,  320,  320,
			  353,  357,  359,  359,  356,  359,    0,  361,  361,  358,
			  361,  363,  363,  354,  363,  362,  362,  358,  362,  369,
			    0,    0,  357,  359,    0,    0,    0,  359,  361,  369,
			  407,  356,  363,  369,  364,  364,  362,  364,  366,  366,
			  361,  366,  407,    0,  358,  365,  365,  363,  365,  357,
			  367,  367,    0,  367,  359,  364,  369,  407,  362,  366,
			  369,  408,  370,    0,    0,  410,  365,  361,  410,  407,
			  364,  367,  370,  408,  363,  410,  370,  365,  366,  370,

			  371,  371,    0,  371,    0,  362,  372,  372,  408,  372,
			  367,  373,  373,  410,  373,  374,  374,  364,  374,  370,
			  408,  371,    0,  370,  365,  366,  370,  372,  375,  375,
			    0,  375,  373,  380,    0,    0,  374,  367,    0,  382,
			  410,  376,  376,  374,  376,  380,    0,  382,    0,  375,
			  505,  382,  380,  375,  373,  381,  376,  387,  381,    0,
			  380,    0,  376,    0,  375,  381,  382,  505,    0,  387,
			  374,  505,  380,  384,  382,  387,  384,    0,  382,  380,
			  375,  373,  385,  384,  387,  385,  388,    0,  381,    0,
			  389,  375,  385,  389,  505,  398,  387,  452,  388,    0,

			  389,  390,  387,  388,  390,  391,  398,  398,  452,  391,
			    0,  390,    0,  388,    0,  381,  384,  391,  452,  389,
			  438,  438,  398,  438,  385,  388,  390,    0,  392,    0,
			  388,  392,  391,  398,  398,  452,  391,  393,  392,  394,
			  393,  438,  394,  384,  391,  395,  389,  393,  395,  394,
			  396,  385,  397,  390,  491,  395,    0,  465,  396,    0,
			  400,  392,  396,  399,  397,  491,  399,  400,  409,  465,
			  397,  409,  400,  399,    0,  394,    0,  396,  409,  397,
			  393,  395,    0,  401,  465,  396,  401,  400,  392,  396,
			    0,  397,  491,  401,  400,  399,  465,  397,    0,  400,

			  402,    0,  394,  402,  403,  404,    0,  393,  395,    0,
			  402,  409,  444,  444,    0,  444,  403,  404,  412,  403,
			  404,    0,  399,  401,  411,  413,    0,  411,  413,    0,
			  412,  403,  404,  444,  411,    0,  412,  413,  409,    0,
			  402,    0,  426,  403,  404,  412,  403,  404,  415,  411,
			  401,  414,  413,  426,  414,  413,    0,  412,  415,    0,
			  411,  414,  455,  412,  413,  455,  414,  402,  434,  434,
			  415,  434,  455,    0,    0,  426,  411,  498,  435,  435,
			  426,  435,    0,  436,  436,  415,  436,  411,  498,  434,
			  463,  439,  439,  463,  439,  684,    0,  415,  416,  435,

			  463,    0,    0,  684,  436,  416,  416,  416,  416,  416,
			  416,  436,  439,  455,  435,  498,  684,  454,  454,  434,
			  454,  437,  437,    0,  437,  439,  441,  441,    0,  441,
			  684,  416,  416,  416,  416,  416,  416,  416,  436,    0,
			    0,  435,  437,  442,  442,    0,  442,  441,  443,  443,
			  437,  443,  439,  446,  446,  441,  446,  445,  445,    0,
			  445,    0,  437,    0,  442,    0,  454,  447,  447,  443,
			  447,  442,  461,    0,  446,  461,    0,  437,  445,    0,
			    0,  443,  441,  456,  461,    0,  445,  469,  447,  437,
			  469,  450,  450,  446,  450,  456,  447,  469,  442,  461,

			  448,  448,  461,  448,  449,  449,    0,  449,  443,  456,
			  456,  461,  450,  445,  451,  451,  457,  451,    0,  457,
			  446,  448,  456,  447,    0,  449,  457,  458,  626,  448,
			    0,  450,  626,  449,  459,  451,  521,  459,  458,  458,
			  460,  462,    0,  460,  459,  462,    0,    0,  521,  626,
			  460,  451,  457,  462,  458,    0,  448,  462,  450,  626,
			  449,  464,  459,  521,  464,  458,  458,  468,  462,  460,
			  468,  464,  462,  466,    0,  521,  466,  468,  451,  457,
			  462,  460,  467,  466,  462,  467,  470,    0,    0,  459,
			  470,  471,  467,  472,  471,  464,  460,    0,  470,    0,

			  468,  472,  466,  471,  473,  472,  475,  473,  460,  475,
			  467,  474,    0,  470,  473,  474,  475,  470,  471,    0,
			  472,  471,  464,  474,    0,  470,    0,  468,  472,  466,
			  471,    0,  472,  473,    0,  478,    0,  467,  474,  478,
			  477,  476,  474,  552,  476,  552,  475,  478,  552,    0,
			  474,  476,  477,  481,  479,  477,  481,  479,  480,  527,
			  473,  480,  478,  481,  479,  483,  478,  477,  480,  483,
			  476,  527,  484,  475,  478,  482,  484,  483,  482,  477,
			    0,    0,  477,  479,  484,  482,  527,  480,  503,  503,
			    0,  503,  483,  481,    0,    0,  483,  476,  527,  484,

			    0,    0,    0,  484,  483,  499,  499,    0,  499,  503,
			  479,  484,  482,  553,  480,  553,  500,  500,  553,  500,
			  481,  516,    0,    0,  501,  501,  499,  501,  524,    0,
			  499,  524,  516,  502,  502,    0,  502,  500,  524,  482,
			  485,  500,  516,  506,  506,  501,  506,  485,  485,  485,
			  485,  485,  485,  501,  502,  541,    0,  499,  541,  516,
			  504,  504,    0,  504,  506,  541,    0,    0,  500,  502,
			    0,    0,    0,  485,  485,  485,  485,  485,  485,  485,
			  501,  504,  517,    0,  506,  507,  507,    0,  507,  508,
			  508,    0,  508,  517,  504,    0,  502,  509,  509,    0,

			  509,  510,  510,  517,  510,    0,  507,    0,    0,    0,
			  508,  506,  511,  511,  507,  511,  512,  512,  509,  512,
			  517,  504,  510,  513,  513,  523,  513,    0,  523,  519,
			  510,  508,  519,  511,    0,  523,    0,  512,  509,  519,
			  511,  507,    0,    0,  513,  514,  514,    0,  514,  515,
			  515,  562,  515,  562,  519,    0,  562,  510,  508,  520,
			    0,  523,  520,  513,    0,  509,  514,  511,  522,  520,
			  515,  522,  514,  528,  526,  525,  528,  515,  522,  525,
			    0,  519,    0,  528,  520,  526,  526,  525,  523,  612,
			  513,  612,    0,  530,  612,  529,  530,  522,  529,  514,

			    0,  526,  525,  530,  515,  529,  525,  528,    0,    0,
			    0,  520,  526,  526,  525,  531,  532,  533,  531,  545,
			    0,  533,  530,  534,  522,  531,  536,  535,  532,  533,
			  535,  545,  532,  585,  528,  534,  529,  535,  536,    0,
			  534,    0,  536,  532,  533,  585,  545,    0,  533,  530,
			  534,  537,    0,  536,  537,  532,  533,  531,  545,  532,
			  585,  537,  534,  529,    0,  536,  539,  534,  535,  536,
			  539,  538,  585,  540,  538,  546,  540,    0,  539,  542,
			  537,  538,  542,  561,  531,  540,    0,  546,  543,  542,
			  546,  543,  568,  539,  561,  535,    0,  539,  543,  538,

			  540,  544,  546,  540,  544,  539,  586,  537,  586,  568,
			    0,  544,  540,  568,  546,  543,  561,  546,  586,  542,
			    0,  561,  563,  563,    0,  563,  538,  564,  564,  544,
			  564,  565,  565,  586,  565,  586,  568,  567,  567,    0,
			  567,    0,  543,  563,  580,  586,  542,  580,  564,    0,
			  566,  566,  565,  566,  580,  627,  544,  547,  567,  627,
			  583,  564,  563,  583,  547,  547,  547,  547,  547,  547,
			  583,  566,    0,    0,    0,    0,  627,  566,  569,  569,
			    0,  569,  570,  570,  580,  570,  627,    0,  564,  563,
			  547,  547,  547,  547,  547,  547,  547,  571,  571,  569, yy_Dummy>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  571,    0,    0,  570,  566,  572,  572,    0,  572,  573,
			  573,  580,  573,  574,  574,    0,  574,    0,  571,  575,
			  575,  654,  575,    0,  591,  654,  572,    0,  576,  576,
			  573,  576,  577,  577,  574,  577,  591,    0,  592,    0,
			  575,    0,  654,  571,  581,  573,  582,  581,  575,  576,
			  592,  591,  654,  577,  581,  582,  584,    0,  582,  584,
			  576,  577,    0,  591,  587,  592,  584,  587,  595,    0,
			  571,    0,  573,  582,  587,  575,  588,  592,  581,  588,
			  595,  589,  582,  584,  589,  582,  588,  576,  577,  590,
			  593,  589,  590,  594,  596,  595,  594,  596,  597,  590,

			  599,  597,  593,  594,  596,  581,  634,  595,  597,  598,
			  584,  593,  599,  600,    0,    0,  600,  593,  634,    0,
			  598,  598,  601,  600,    0,  601,  614,  599,    0,  593,
			  596,  602,  601,  634,  602,  590,  598,  614,  593,  599,
			  603,  602,  600,  633,  603,  634,  633,  598,  598,    0,
			    0,    0,  603,  633,  601,  617,  617,  596,  617,  614,
			  602,    0,  590,    0,  614,  618,  618,  603,  618,  600,
			  693,  603,  619,  619,  639,  619,  617,  639,  693,  603,
			    0,  601,  617,    0,  639,    0,  618,  602,    0,  621,
			  621,  693,  621,  619,  622,  622,    0,  622,  618,  623,

			  623,  619,  623,  624,  624,  693,  624,    0,  628,  617,
			  621,  628,    0,  625,  625,  622,  625,    0,  628,  629,
			  623,  622,  629,  635,  624,  618,  635,  623,  619,  629,
			  630,    0,  624,  635,  625,  628,    0,  631,  630,    0,
			  631,  632,  630,    0,  636,  632,  636,  631,  622,    0,
			  635,    0,  629,  632,  623,    0,  636,  630,    0,  624,
			  637,    0,  628,  637,  640,  630,  631,  640,  632,  630,
			  637,  636,  632,  636,    0,  638,  640,  635,  638,  629,
			  632,  648,  648,  636,  648,  638,  649,  649,  637,  649,
			    0,  640,    0,  631,  640,  650,  650,    0,  650,    0,

			    0,    0,  648,  640,  638,  651,  651,  649,  651,  652,
			  652,    0,  652,  648,    0,  637,  650,  653,  653,  656,
			  653,  655,  656,  660,    0,  655,  651,  658,  649,  656,
			  652,  638,    0,  657,  651,  660,  657,    0,  653,  658,
			  648,  662,  655,  657,  658,  662,  659,    0,    0,  659,
			  660,  656,  655,  662,  658,  649,  659,  665,    0,  653,
			  661,  651,  660,  661,  663,    0,  658,  663,  662,  665,
			  661,  658,  662,  664,  663,  657,  664,    0,  656,    0,
			  662,    0,    0,  664,  665,  674,  653,    0,  674,  661,
			  668,  668,    0,  668,    0,  674,  665,  669,  669,    0,

			  669,  702,  657,  670,  670,    0,  670,  671,  671,  676,
			  671,  668,  702,  678,  674,  664,  661,  675,  669,  668,
			  675,  676,  702,  677,  670,  678,  677,  675,  671,  678,
			  676,    0,    0,  677,  708,  679,  676,    0,  679,  702,
			  678,  674,  664,  669,  670,  679,  668,    0,  676,    0,
			    0,  708,  678,  671,    0,  708,  678,  676,  680,  680,
			    0,  680,    0,  675,  677,  681,  681,    0,  681,    0,
			  669,  670,  682,  682,  685,  682,    0,  685,  708,  680,
			  671,  679,  683,  683,  685,  683,  681,    0,    0,  686,
			  675,  677,  686,  682,  687,  688,    0,  689,  688,  686,

			  680,  690,  705,  683,  690,  688,  687,    0,  679,  689,
			    0,  690,    0,  705,  691,  691,  685,  691,    0,  694,
			  683,  687,  694,  705,  689,  692,  692,  680,  692,  694,
			    0,    0,    0,  687,  695,  691,  689,  695,    0,  690,
			  705,    0,    0,  685,  695,    0,  692,  683,  696,  696,
			    0,  696,  697,  697,  692,  697,  701,  701,  699,  701,
			  691,  699,  709,  695,  700,  694,  690,  700,  699,  696,
			    0,    0,  703,  697,  700,  703,    0,  701,    0,  709,
			    0,  692,  703,  709,    0,  701,  696,  691,  704,  704,
			  695,  704,  694,    0,  706,    0,  699,  706,    0,    0,

			    0,  703,    0,    0,  706,    0,  709,    0,    0,  704,
			  738,    0,  701,  696,    0,  738,  738,  738,  738,  738,
			  738,    0,    0,  699,    0,    0,    0,    0,  703,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,

			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  714,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,

			  715,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  717,  717,    0,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,    0,  717,  717,  717,  717,  717,  718,  718,    0,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,

			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  719,  719,  719,    0,    0,    0,    0,    0,    0,  719,
			    0,    0,  719,    0,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,    0,    0,  719,  719,
			  719,  720,  720,    0,  720,  720,    0,  720,    0,    0,
			    0,    0,  720,  720,  720,  720,  720,  720,  720,  720,
			  720,  720,  720,  720,  720,  720,  720,  720,  720,  720,

			  720,  720,  720,  720,    0,    0,  720,  720,  720,  721,
			  721,    0,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  722,  722,    0,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  723,  723,  723,  723,  723,

			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			    0,  725,  725,  725,  725,  725,  725,  725,  725,  725,

			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  726,  726,  726,    0,    0,    0,
			  726,  726,    0,  726,    0,    0,    0,    0,  726,  726,
			  726,  726,  726,  726,  726,  726,  726,  726,  726,  726,
			  726,  726,  726,  726,  726,  726,  726,  726,  726,  726,
			    0,  726,  726,  726,  726,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,

			  727,  727,  727,  727,  727,  727,  727,  727,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  729,  729,    0,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  730,  730,  730,  730,  730,  730,

			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  731,  731,  731,
			  731,  731,  731,  731,  731,    0,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  732,  732,    0,  732,  732,    0,  732,  732,    0,    0,
			    0,  732,  732,  732,  732,  732,  732,  732,  732,  732,

			  732,  732,  732,  732,  732,  732,  732,  732,  732,  732,
			  732,  732,  732,    0,    0,  732,  732,  732,  733,    0,
			  733,  733,    0,    0,    0,    0,    0,  733,    0,    0,
			    0,    0,  733,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  733,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  733,  733,    0,    0,  733,  733,  733,  734,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,
			  734,  734,  734,  734,  734,  734,  734,  734,  734,  734,

			  734,  734,  735,  735,  735,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  735,  735,  735,  735,  735,
			  735,  735,  735,  735,  735,  735,  735,  735,  735,  735,
			  735,  735,  735,  735,  735,  735,  735,  735,    0,    0,
			    0,    0,    0,  735,  736,    0,  736,    0,    0,  736,
			  736,  736,  736,  736,  736,  736,  736,  736,  736,  736,
			  736,  736,  736,  736,  736,  736,  736,  736,  736,  736,
			  736,    0,    0,  736,  736,  736,  737,  737,  737,  737,
			  737,  737,    0,  737,  737,  737,  737,  737,  737,  737,
			  737,  737,  737,  737,  737,  737,  737,  737,  737,  737,

			  737,  737,  737,  737,  737,  737,  737,  737,  737,  737,
			  737,  737,  737,  737,    0,  737,  737,  737,  737,  739,
			  739,  739,    0,    0,    0,  739,  739,    0,  739,    0,
			    0,    0,    0,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,    0,    0,  739,  739,  739,
			  740,  740,  740,    0,  740,  740,  740,  740,  740,  740,
			  740,  740,  740,  740,    0,  740,  740,  740,  740,  740,
			  740,  740,  740,  740,  740,  740,  740,  740,  740,  740,
			  740,  740,  740,  740,  740,  740,  740,  740,  740,  740,

			  740,  740,  740,  741,    0,    0,    0,    0,  741,  741,
			  741,  741,  741,  741,  742,    0,    0,    0,    0,  742,
			  742,  742,  742,  742,  742,  743,  743,  743,  743,  743,
			  743,  743,  743,    0,  743,  743,  743,  743,  743,  743,
			  743,  743,  743,  743,  743,  743,  743,  743,  743,  743,
			  743,  743,  743,  743,  743,  743,  743,  743,  743,  743,
			  743,  743,  743,  743,  743,  743,  743,  743,  744,    0,
			    0,    0,    0,  744,  744,  744,  744,  744,  744,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,

			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711, yy_Dummy>>,
			1, 1958, 3000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   77,   62,   63,    0,    0,  141,
			  219,   60,   81, 1193, 4879,   86, 1178, 1145, 1148, 4879,
			   82, 4879, 4879, 4879, 4879, 4879, 1108,   76, 1099,   81,
			 4879, 4879, 1088, 4879, 1080, 1076,  174,  100,  249,  244,
			  254,  260,  287,  282,  296,  311,  105,  324,  131,  336,
			  113,  331, 4879, 4879, 1036,  401,  142,  318,  352,  450,
			  148,  453,  145,  234,  456,  466,  327,  460,  497, 1068,
			 4879, 4879,  123, 4879, 4879,  572,  272,  283, 4879,  318,
			 1033, 4879,  119,  374,  402,  649, 4879,  108,  699, 4879,
			  115, 1062, 4879, 1029, 4879,  999,  777,    0,  646, 1004,

			  981,  297, 4879,  973,  284,  513,  971, 4879, 4879, 4879,
			  479,  535, 4879,  653,  657,  680,  854,  858,  689,  862,
			  539,  866,  871,  665,  893,  905,  916,  920,  914,  951,
			  676,  957,  963,  985,  995,  968,  399,  929, 4879,  248,
			  957,  541,  948,  900,  999,  845,  985,  986,  987, 1026,
			  993, 1043, 1055, 1007, 1037, 1069, 1073, 1053, 1055,  547,
			  919, 1096, 1118,  708, 1087, 1106, 1095, 1154, 1113, 1166,
			 1131, 1171, 1184, 1153, 1164, 1203, 1199, 1185, 1193, 1221,
			 1243, 1215, 1231, 1261, 1225, 1270, 1251, 4879,  208, 4879,
			   97,  700,  163,  396, 4879,  128,  478, 4879,  645,  911,

			 4879,   79, 1185, 1290, 1305, 4879, 1309,  201, 1360,  545,
			  253, 1437, 4879, 4879,  930,  672, 4879, 4879, 4879,  873,
			  919,  927,  918,  367,  915,  898,  890,  877,  859,  565,
			 4879, 1282,   94,  846,  842, 4879, 1284,  736,  862,  838,
			 1375,  552, 1390, 1226, 1385, 1420, 1484, 1401,  969, 1394,
			 1489, 1426, 1493, 1497,  752, 1501, 1506, 1331, 1430, 1516,
			  757, 1528, 1538, 1542, 1555, 1565, 1141, 1569,  755, 4879,
			 4879,  753, 1574,  559,  119, 1304, 1293, 1380, 1575, 1555,
			 1596, 1579, 1602, 1572, 1496, 1592, 1631,  930, 1598, 1536,
			 1629, 1645, 1651, 1665, 1677, 1644, 1663, 1657, 1389, 1676,

			  761, 1595, 1673, 1704, 1686, 1697, 1732, 1736, 1722, 1726,
			 1754, 1766, 1767, 1750, 1759, 1746, 1341, 1763, 1791, 1782,
			 1860,  364, 4879,  767, 1821, 1692,  762, 1126,    0,  736,
			  698, 4879, 4879, 4879, 4879,  872, 4879, 4879, 4879, 4879,
			 4879, 1807,  688,  374,  678,  673, 1811, 1335,  670,  664,
			  458,  246,  652, 1847, 1871, 1856, 1879, 1898, 1906, 1920,
			 1032, 1925, 1933, 1929, 1952, 1963, 1956, 1968, 1080, 1919,
			 1962, 1998, 2004, 2009, 2013, 2026, 2039,  766,    0, 1839,
			 2006, 2053, 2012, 1851, 2071, 2080, 1780, 2030, 2059, 2088,
			 2099, 2078, 2126, 2135, 2137, 2143, 2123, 2125, 2068, 2161,

			 2133, 2181, 2198, 2177, 2178, 1866, 1893, 1923, 1954, 2166,
			 1983, 2222, 2191, 2198, 2249, 2231, 2278, 4879, 1453,    0,
			 4879,  855,  481,  649,  643,  645, 2222,  545,  653,  519,
			  666,  510,  859,  293, 2266, 2276, 2281, 2319, 2118, 2289,
			  488, 2324, 2341, 2346, 2210, 2355, 2351, 2365, 2398, 2402,
			 2389, 2412, 2071, 1894, 2315, 2260, 2356, 2414, 2400, 2432,
			 2438, 2345, 2414, 2288, 2459, 2130, 2471, 2480, 2465, 2385,
			 2459, 2464, 2466, 2502, 2484, 2504, 2539, 2513, 2508, 2552,
			 2556, 2551, 2573, 2538, 2545, 2620,    0, 1385,  949,  483,
			  984, 2134, 1010,  474,  459, 1086,  432, 1671, 2257, 2603,

			 2614, 2622, 2631, 2586, 2658, 2024, 2641, 2683, 2687, 2695,
			 2699, 2710, 2714, 2721, 2743, 2747, 2595, 2656, 4879, 2727,
			 2757, 2409, 2766, 2723, 2626, 2748, 2747, 2532, 2771, 2793,
			 2791, 2813, 2789, 2790, 2796, 2825, 2799, 2849, 2869, 2839,
			 2846, 2653, 2877, 2886, 2899, 2792, 2848, 2937,    0,  431,
			  390,  389, 2528, 2598, 1193,  375, 1164,  362,  349,  312,
			 4879, 2863, 2736, 2920, 2925, 2929, 2948, 2935, 2866, 2976,
			 2980, 2995, 3003, 3007, 3011, 3017, 3026, 3030,  306,  295,
			 2942, 3042, 3019, 2958, 3054, 2806, 2879, 3062, 3074, 3079,
			 3087, 2997, 3011, 3063, 3091, 3041, 3092, 3096, 3082, 3073,

			 3111, 3120, 3129, 3113, 1246,  284,  233,  262, 1266,  254,
			  235,  228, 2774,  155, 3106,  180, 1406, 3153, 3163, 3170,
			 4879, 3187, 3192, 3197, 3201, 3211, 2402, 2929, 3206, 3217,
			 3203, 3235, 3214, 3141, 3079, 3221, 3217, 3258, 3273, 3172,
			 3237,  366,  183, 1407,  136,  161, 1481, 1485, 3279, 3284,
			 3293, 3303, 3307, 3315, 2995, 3295, 3317, 3331, 3300, 3344,
			 3296, 3358, 3314, 3362, 3371, 3330, 4879, 1575, 3388, 3395,
			 3401, 3405,  358, 4879, 3383, 3415, 3382, 3421, 3386, 3433,
			 3456, 3463, 3470, 3480, 2269, 3472, 3487, 3467, 3493, 3470,
			 3499, 3512, 3523, 3144, 3517, 3532, 3546, 3550,   74, 3556,

			 3562, 3554, 3375, 3570, 3586, 3476, 3592,   68, 3408, 3536,
			 4879, 4879, 3628, 3671, 3714, 3757, 3800, 3843, 3886, 3928,
			 3966, 4008, 4051, 4094, 4137, 4180, 4222, 4264, 4307, 4350,
			 4393, 4436, 4475, 4516, 4558, 4600, 4633, 4675, 3599, 4717,
			 4759, 4792, 4803, 4824, 4857, yy_Dummy>>)
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
			  723,  722,   75,  711,  711,  723,  724,  711,  724,  725,

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
			   21,   25,   98,  101,  100,   98,  101,  116,   82,  116,
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
			    0,   98,   98,   99,   95,   94,    0,   82,    0,    0,

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

	yyJam_base: INTEGER is 4879
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
