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
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
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
--|#line 297 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 297")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 301 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 301")
end
 -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of dADL
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)

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

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 348 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 348")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
--|#line 354 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 354")
end
 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			
end
end
else
if yy_act <= 84 then
if yy_act <= 82 then
if yy_act = 81 then
--|#line 358 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 358")
end
 		-- match final segment
				in_buffer.append_string (text)
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
 			
else
--|#line 368 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 368")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 83 then
--|#line 375 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 375")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 380 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 380")
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
else
if yy_act <= 86 then
if yy_act = 85 then
	yy_end := yy_end - 1
--|#line 395 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 395")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 396 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 396")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
--|#line 397 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 397")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
end
else
if yy_act <= 101 then
if yy_act <= 94 then
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act = 88 then
	yy_end := yy_end - 1
--|#line 401 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 401")
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
--|#line 402 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 402")
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
--|#line 403 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 403")
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
--|#line 423 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 423")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 427 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 427")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 433 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 433")
end
in_buffer.append_character ('\')
end
else
--|#line 434 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 434")
end
in_buffer.append_character ('"')
end
end
else
if yy_act <= 98 then
if yy_act <= 96 then
if yy_act = 95 then
--|#line 435 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 435")
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
--|#line 449 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 449")
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
if yy_act = 97 then
--|#line 463 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 463")
end
in_buffer.append_string (text)
else
--|#line 464 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 464")
end
in_lineno := in_lineno + 1	-- match LF in line
end
end
else
if yy_act <= 100 then
if yy_act = 99 then
--|#line 465 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 465")
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
--|#line 476 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 476")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
--|#line 484 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 484")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
end
end
else
if yy_act <= 108 then
if yy_act <= 105 then
if yy_act <= 103 then
if yy_act = 102 then
--|#line 485 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 485")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
--|#line 486 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 486")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 104 then
--|#line 487 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 487")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
--|#line 488 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 488")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
end
else
if yy_act <= 107 then
if yy_act = 106 then
--|#line 489 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 489")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 490 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 490")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
--|#line 491 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 491")
end
last_token := V_CHARACTER; last_character_value := '"'
end
end
else
if yy_act <= 112 then
if yy_act <= 110 then
if yy_act = 109 then
--|#line 492 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 492")
end

				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			
else
--|#line 497 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 497")
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
if yy_act = 111 then
--|#line 507 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 507")
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
--|#line 517 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 517")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 114 then
if yy_act = 113 then
--|#line 518 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 518")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 522 "cadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_scanner.l' at line 522")
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

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 3834)
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
			   73,   78,   78,   74,   74,   88,   75,   75,   90,  705,
			   90,   90,   96,   97,  100,  147,  101,  103,  271,  104,

			  272,  105,  110,  110,  157,  110,   88,  110,  110,  339,
			  110,  339,   79,   79,  340,  110,  110,  209,  110,  271,
			  708,  271,  148,  112,  187,  128,   76,   76,  112,  708,
			  209,  158,   98,  187,  106,  271,  112,  272,   89,  699,
			   80,   80,   81,   82,   83,   81,   82,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   84,   89,
			   81,  134,   81,   81,   81,   81,   81,   81,  111,  131,
			  210,  149,  153,  165,  132,  167,  110,  110,  181,  110,
			  159,  160,  150,  210,  154,  643,  161,  183,  134,  269,
			   81,   81,   86,   81,  490,  111,  131,  112,  151,  155,

			  166,  132,  168,  205,  205,  182,  205,  162,  163,  152,
			  113,  156,  114,  164,  184,  187,  269,   81,   81,   81,
			   81,   82,   83,   81,   82,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   84,  113,   81,  114,
			   81,   81,   81,   81,   81,   81,  110,  110,  169,  110,
			  681,  110,  110,  681,  110,  270,  110,  110,  188,  110,
			  663,  170,  110,  110,  429,  110,  348,  112,   81,   81,
			   86,   81,  112,  195,  613,  171,  115,  112,  419,  269,
			  116,  118,  270,  112,  110,  110,  198,  110,  172,  110,
			  110,  117,  110,  119,  120,   81,   81,   81,  110,  110,

			  319,  110,  428,  115,  196,  112,  273,  116,  118,  124,
			  112,  420,  641,  110,  110,  173,  110,  196,  117,  112,
			  119,  120,  607,  174,  121,  122,  110,  110,  177,  110,
			  123,  199,  197,  178,  112,  125,  124,  270,  110,  110,
			  126,  110,  175,  135,  135,  197,  275,  112,  135,  135,
			  176,  121,  122,  127,  275,  179,  277,  123,  129,  112,
			  180,  191,  125,  229,  274,  192,  130,  126,   90,  607,
			   90,   90,  277,  275,  230,  133,  110,  110,  605,  110,
			  127,  276,  283,  277,  135,  129,  200,  201,  191,  200,
			  191,  191,  420,  130,  234,  639,  231,  112,  624,  280,

			  623,  230,  133,  139,  140,  235,  284,  283,  193,  283,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  141,
			  139,  142,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  235,  284,  285,  203,  139,  143,  143,  144,
			  143,  143,  143,  143,  143,  143,  145,  143,  146,  143,
			  143,  143,  143,  143,  144,  143,  143,  143,  143,  139,
			  140,  284,  288,  288,  295,  554,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  286,  288,
			  292,  295,  139,  143,  143,  143,  143,  143,  143,  143,

			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  186,  186,  610,  186,  186,
			  186,  187,  189,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  186,  188,  186,  186,  186,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  186,  186,  186,  201,  201,  219,  201,  204,  201,  220,

			  204,  204,  201,  103,  204,  104,  554,  236,  221,  135,
			  135,  205,  206,  110,  110,  205,  110,  207,  266,  608,
			  495,  207,  110,  110,  187,  110,  603,  547,  110,  110,
			  547,  110,  427,  278,  112,  295,  297,  297,  222,  279,
			  106,  246,  203,  112,  555,  553,  203,  223,  267,  112,
			  203,  212,  212,  224,  212,  106,  552,  225,  187,  226,
			  278,  330,  296,  297,  298,  428,  279,  188,  187,  331,
			  332,  260,  289,  299,  213,  290,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  260,  289,

			  299,  188,  290,  300,  207,  207,  227,  207,  227,  227,
			  346,  188,  346,  323,  415,  347,  323,  424,  548,  424,
			  450,  450,  425,  450,  516,  317,  516,  214,  215,  215,
			  300,  215,  215,  215,  215,  217,  215,  215,  216,  215,
			  215,  215,  215,  215,  215,  215,  215,  218,  215,  215,
			  215,  215,  215,  215,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  215,  215,  215,  215,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  215,  215,  215,  110,  110,  502,  110,
			  110,  110,  493,  110,  110,  110,  491,  110,  110,  110,
			  278,  110,  110,  110,  299,  110,  279,  112,  425,  110,
			  110,  112,  110,  103,  289,  112,  487,  290,  239,  112,
			  238,  110,  110,  112,  110,  110,  110,  281,  110,  242,
			  112,  301,  486,  282,  240,  243,  300,  110,  110,  241,
			  110,  293,  112,  244,  294,  239,  112,  238,  110,  110,
			  449,  110,  449,  430,  110,  110,  242,  110,  112,  247,
			  485,  240,  243,  302,  248,  245,  241,  249,  303,  112,
			  244,  304,  347,  303,  426,  112,  110,  110,  422,  110,

			  110,  110,  187,  110,  110,  110,  247,  110,  304,  309,
			  421,  248,  245,  420,  249,  303,  251,  112,  304,  250,
			  305,  112,  340,  128,  417,  112,  327,  253,  110,  110,
			  489,  110,  254,  255,  309,  306,  309,  256,  252,  414,
			  257,  111,  408,  251,  408,  188,  258,  313,  313,  112,
			  110,  110,  387,  110,  253,  110,  110,  259,  110,  254,
			  255,  312,  307,  490,  256,  252,  308,  257,  111,  110,
			  110,  112,  110,  258,  313,  314,  112,  315,  110,  110,
			  315,  110,  307,  261,  259,  195,  308,  262,  186,  307,
			  112,  200,  201,  308,  200,  264,  198,  387,  263,  112,

			  190,  338,  318,  375,  315,  201,  201,  316,  201,  310,
			  261,  374,  230,  311,  262,  343,  196,  204,  201,  103,
			  204,  104,  264,  348,  265,  263,  344,  196,  492,  204,
			  201,  205,  204,  190,  231,  324,  324,  207,  324,  230,
			  203,  376,  376,  205,  197,  378,  357,  378,  345,  207,
			  380,  265,  708,  344,  203,  197,  106,  357,  213,  110,
			  110,  428,  110,  349,  342,  341,  203,  357,  376,  377,
			  337,  336,  378,  330,  379,  335,  334,  380,  203,  333,
			  112,  331,  332,  329,  357,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,

			  139,  139,  139,  139,  139,  139,  139,  320,  321,  322,
			  320,  321,  320,  320,  320,  320,  320,  320,  320,  320,
			  320,  320,  205,  110,  110,  320,  110,  320,  323,  320,
			  320,  320,  320,  110,  110,  547,  110,  381,  110,  110,
			  328,  110,  110,  110,  112,  110,  110,  110,  327,  110,
			  110,  110,  325,  110,  112,  320,  320,  203,  320,  112,
			  350,  551,  352,  112,  381,  382,  351,  112,  420,  110,
			  110,  112,  110,  380,  110,  110,  353,  110,  110,  110,
			  708,  110,  320,  320,  320,  212,  212,  350,  212,  352,
			  112,  199,  382,  351,  490,  112,  365,  356,  291,  112,

			  383,  207,  207,  353,  207,  291,  287,  360,  213,  246,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  110,  110,  360,  110,  110,  110,  546,  110,
			  546,  110,  110,  547,  110,  110,  110,  381,  110,  110,
			  110,  382,  110,  112,  268,  110,  110,  112,  110,  386,
			  138,  214,  112,  554,  110,  110,  112,  110,  110,  110,
			  112,  110,  386,  354,  384,  358,  112,  355,  385,  359,
			  110,  110,  361,  110,  266,  112,  386,  110,  110,  112,
			  110,  362,  110,  110,  237,  110,  428,  364,  363,  388,

			  354,  112,  358,  232,  355,  366,  359,  228,  112,  361,
			  367,  110,  110,  112,  110,  389,  368,  390,  362,  227,
			  110,  110,  216,  110,  364,  363,  110,  110,   94,  110,
			  110,  110,  112,  110,  110,  110,  391,  110,  392,   91,
			  369,  112,  389,  368,  390,  389,  268,  112,  390,  110,
			  110,  112,  110,  357,  199,  112,  391,  396,  396,  370,
			  398,  399,  398,  391,  357,  392,  371,  369,  185,  399,
			  112,  402,  393,  403,  357,  394,  402,  403,  406,  407,
			  406,  372,  407,  395,  396,  397,  370,  398,  399,  400,
			  411,  357,  411,  371,  452,  373,  401,  556,  402,  556,

			  403,  418,  554,  404,  405,  406,  407,  409,  138,  410,
			  321,  322,  230,  321,  437,  201,  201,  411,  201,  412,
			  423,  452,  373,  187,  205,  437,  324,  324,  365,  324,
			  323,  344,  109,  108,  231,  437,  413,  107,  111,  230,
			  452,  454,  102,  413,  413,  413,  413,  413,  413,  708,
			   99,  454,  437,  345,   94,  607,   92,  456,  344,  203,
			  110,  110,   91,  110,  203,  111,  188,  453,  454,  413,
			  413,  413,  413,  413,  413,  413,  110,  110,  455,  110,
			  708,  112,  110,  110,  456,  110,  110,  110,  490,  110,
			  110,  110,  708,  110,  640,  110,  110,  112,  110,  110,

			  110,  457,  110,  112,  431,  110,  110,  112,  110,  432,
			  708,  112,  110,  110,  456,  110,  112,  457,  110,  110,
			  112,  110,  110,  110,  435,  110,  112,  420,  457,  433,
			  436,  431,  434,  112,  110,  110,  432,  110,  366,  112,
			  708,  458,  439,  112,  459,  438,  110,  110,  111,  110,
			  708,  435,  111,  708,  440,  112,  433,  436,  441,  434,
			  708,  110,  110,  367,  110,  708,  442,  112,  708,  439,
			  460,  708,  438,  111,  708,  111,  708,  111,  708,  111,
			  111,  440,  112,  461,  460,  441,  443,  110,  110,  708,
			  110,  110,  110,  442,  110,  110,  110,  460,  110,  463,

			  111,  444,  110,  110,  111,  110,  464,  111,  112,  465,
			  461,  462,  112,  443,  110,  110,  112,  110,  466,  110,
			  110,  463,  110,  112,  464,  465,  463,  470,  444,  470,
			  446,  472,  473,  464,  449,  112,  465,  472,  445,  447,
			  112,  473,  476,  477,  478,  466,  476,  477,  467,  418,
			  448,  468,  469,  517,  470,  479,  471,  446,  472,  473,
			  484,  488,  517,  708,  474,  445,  447,  488,  475,  476,
			  477,  478,  494,  480,  481,  519,  519,  448,  344,  604,
			  517,  604,  479,  482,  605,  110,  110,  484,  110,  518,
			  482,  482,  482,  482,  482,  482,  606,  708,  606,  494,

			  345,  607,  519,  522,  513,  344,  112,  110,  110,  708,
			  110,  110,  110,  525,  110,  513,  482,  482,  482,  482,
			  482,  482,  482,  110,  110,  514,  110,  708,  112,  708,
			  110,  110,  112,  110,  110,  110,  496,  110,  708,  498,
			  525,  708,  513,  497,  112,  526,  110,  110,  708,  110,
			  527,  112,  499,  110,  110,  112,  110,  110,  110,  528,
			  110,  526,  110,  110,  500,  110,  498,  112,  501,  708,
			  497,  612,  526,  612,  112,  503,  613,  527,  112,  499,
			  520,  504,  644,  112,  110,  110,  528,  110,  529,  527,
			  505,  500,  521,  110,  110,  501,  110,  110,  110,  708,

			  110,  708,  503,  110,  110,  112,  110,  520,  504,  110,
			  110,  708,  110,  506,  112,  428,  530,  505,  112,  521,
			  528,  532,  110,  110,  112,  110,  508,  520,  450,  450,
			  112,  450,  509,  507,  110,  110,  532,  110,  510,  521,
			  506,  708,  708,  112,  708,  534,  535,  531,  532,  534,
			  535,  538,  539,  508,  523,  112,  540,  541,  538,  509,
			  507,  539,  511,  533,  549,  510,  524,  708,  708,  577,
			  708,  512,  534,  535,  708,  578,  536,  537,  538,  539,
			  603,  488,  558,  540,  541,  542,  231,  578,  543,  511,
			  515,  549,  550,  559,  110,  110,  577,  110,  512,  544,

			  110,  110,  578,  110,  708,  708,  544,  544,  544,  544,
			  544,  544,  580,  420,  579,  112,  708,  664,  581,  550,
			  559,  112,  708,  110,  110,  560,  110,  610,  110,  110,
			  708,  110,  544,  544,  544,  544,  544,  544,  544,  580,
			  110,  110,  565,  110,  112,  581,  580,  708,  561,  112,
			  490,  708,  560,  110,  110,  581,  110,  562,  708,  565,
			  428,  112,  708,  565,  110,  110,  708,  110,  110,  110,
			  708,  110,  708,  582,  112,  561,  563,  110,  110,  708,
			  110,  584,  583,  575,  562,  112,  565,  564,  708,  112,
			  110,  110,  708,  110,  575,  187,  708,  567,  112,  110,

			  110,  708,  110,  563,  576,  566,  110,  110,  584,  110,
			  638,  112,  110,  110,  564,  110,  708,  708,  708,  568,
			  112,  575,  110,  110,  567,  110,  585,  112,  570,  576,
			  708,  569,  566,  112,  571,  708,  110,  110,  188,  110,
			  576,  586,  587,  112,  110,  110,  568,  110,  585,  586,
			  576,  587,  591,  585,  591,  570,  593,  112,  569,  594,
			  593,  571,  572,  573,  594,  112,  597,  576,  586,  587,
			  598,  599,  574,  597,  708,  588,  589,  708,  590,  591,
			  609,  592,  708,  593,  611,  641,  594,  595,  625,  572,
			  573,  596,  626,  597,  708,  609,  708,  598,  599,  574,

			  600,  601,  345,  110,  110,  708,  110,  609,  601,  601,
			  601,  601,  601,  601,  708,  625,  708,  345,  490,  626,
			  110,  110,  609,  110,  112,  110,  110,  708,  110,  110,
			  110,  617,  110,  708,  601,  601,  601,  601,  601,  601,
			  601,  112,  708,  614,  110,  110,  112,  110,  617,  708,
			  112,  708,  617,  626,  615,  708,  616,  110,  110,  708,
			  110,  110,  110,  708,  110,  112,  110,  110,  708,  110,
			  614,  110,  110,  708,  110,  617,  110,  110,  112,  110,
			  627,  615,  112,  616,  708,  110,  110,  112,  110,  708,
			  110,  110,  112,  110,  708,  110,  110,  112,  110,  110,

			  110,  708,  110,  628,  628,  630,  112,  630,  632,  632,
			  634,  112,  618,  635,  636,  634,  112,  708,  653,  620,
			  112,  619,  110,  110,  642,  110,  642,  621,  622,  643,
			  628,  629,  630,  553,  631,  632,  633,  634,  708,  618,
			  635,  636,  637,  112,  609,  653,  620,  654,  619,  645,
			  708,  654,  656,  708,  621,  622,  110,  110,  708,  110,
			  708,  110,  110,  708,  110,  651,  345,  110,  110,  651,
			  110,  609,  110,  110,  654,  110,  645,  112,  655,  656,
			  110,  110,  112,  110,  110,  110,  651,  110,  112,  646,
			  647,  110,  110,  112,  110,  656,  651,  658,  652,  648,

			  658,  112,  652,  660,  661,  112,  660,  669,  649,  708,
			  708,  669,  112,  650,  708,  708,  646,  647,  708,  652,
			  110,  110,  657,  110,  658,  708,  648,  659,  669,  652,
			  660,  661,  671,  662,  672,  649,  110,  110,  669,  110,
			  650,  112,  110,  110,  708,  110,  110,  110,  708,  110,
			  110,  110,  665,  110,  708,  110,  110,  112,  110,  671,
			  670,  672,  672,  112,  670,  674,  674,  112,  676,  110,
			  110,  112,  110,  682,  683,  667,  112,  683,  666,  665,
			  708,  670,  110,  110,  708,  110,  708,  685,  685,  673,
			  112,  670,  674,  675,  687,  676,  691,  668,  677,  692,

			  682,  683,  667,  112,  684,  666,  110,  110,  696,  110,
			  110,  110,  708,  110,  685,  686,  110,  110,  708,  110,
			  708,  687,  708,  691,  668,  677,  692,  112,  678,  110,
			  110,  112,  110,  110,  110,  696,  110,  112,  110,  110,
			  690,  110,  110,  110,  697,  110,  700,  679,  690,  695,
			  112,  708,  708,  703,  112,  678,  680,  695,  688,  112,
			  708,  690,  708,  112,  708,  110,  110,  708,  110,  708,
			  695,  697,  708,  700,  679,  690,  689,  708,  110,  110,
			  703,  110,  708,  680,  695,  688,  112,  708,  693,  110,
			  110,  702,  110,  708,  694,  708,  708,  110,  110,  112,

			  110,  708,  702,  689,  110,  110,  704,  110,  708,  708,
			  112,  706,  702,  707,  708,  693,  698,  704,  112,  708,
			  708,  694,  708,  708,  708,  112,  701,  704,  706,  702,
			  707,  416,  706,  708,  707,  708,  416,  416,  416,  416,
			  416,  416,  483,  698,  704,  708,  708,  483,  483,  483,
			  483,  483,  483,  701,  708,  706,  708,  707,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,

			   72,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   93,   93,  708,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			  708,   93,   93,   93,   93,   93,   95,   95,  708,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,  111,
			  111,  111,  708,  708,  708,  708,  708,  708,  111,  708,
			  708,  111,  708,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  708,  708,  111,  111,  111,

			  136,  136,  708,  136,  136,  708,  136,  708,  708,  708,
			  708,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  708,  708,  136,  136,  136,  137,  137,
			  708,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  186,  186,  708,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186>>,
			1, 3000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,

			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  708,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  202,  202,  202,  708,  708,  708,  202,
			  202,  708,  202,  708,  708,  708,  708,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  708,
			  202,  202,  202,  202,  208,  208,  208,  208,  208,  208,

			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  215,  215,  708,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,

			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  233,  233,  233,  233,
			  233,  233,  233,  233,  708,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,

			  233,  233,  233,  233,  233,  233,  233,  233,  233,  135,
			  135,  708,  135,  135,  708,  135,  135,  708,  708,  708,
			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  708,  708,  135,  135,  135,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  214,  214,  214,  708,  708,  708,  708,  708,  708,  708,

			  708,  708,  708,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  708,  708,  708,  708,
			  708,  214,  326,  708,  326,  708,  708,  326,  326,  326,
			  326,  326,  326,  326,  326,  326,  326,  326,  326,  326,
			  326,  326,  326,  326,  326,  326,  326,  326,  326,  708,
			  708,  326,  326,  326,  320,  320,  320,  320,  320,  320,
			  708,  320,  320,  320,  320,  320,  320,  320,  320,  320,
			  320,  320,  320,  320,  320,  320,  320,  320,  320,  320,
			  320,  320,  320,  320,  320,  320,  320,  320,  320,  320,

			  320,  320,  708,  320,  320,  320,  320,  451,  451,  451,
			  708,  708,  708,  451,  451,  708,  451,  708,  708,  708,
			  708,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  708,  708,  451,  451,  451,  375,  375,
			  375,  708,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  708,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  545,  708,  708,  708,  708,  545,  545,  545,  545,

			  545,  545,  557,  557,  557,  557,  557,  557,  557,  557,
			  708,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  602,  708,  708,  708,  708,
			  602,  602,  602,  602,  602,  602,   13,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,

			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708>>,
			1, 835, 3000)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 3834)
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
			    4,    5,    6,    3,    4,   11,    3,    4,   15,  704,
			   15,   15,   20,   20,   27,   57,   27,   29,  144,   29,

			  144,   29,   37,   37,   60,   37,   12,   46,   46,  230,
			   46,  230,    5,    6,  230,   50,   50,   87,   50,  271,
			  188,  271,   57,   37,  188,   46,    3,    4,   46,  193,
			  208,   60,   20,  193,   29,  272,   50,  272,   11,  695,
			    5,    6,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,   12,
			    9,   50,    9,    9,    9,    9,    9,    9,   48,   48,
			   87,   58,   59,   62,   48,   63,   36,   36,   67,   36,
			   61,   61,   58,  208,   59,  642,   61,   68,   50,  141,
			    9,    9,    9,    9,  641,   48,   48,   36,   58,   59,

			   62,   48,   63,  205,  205,   67,  205,   61,   61,   58,
			   36,   59,   36,   61,   68,   72,  141,    9,    9,    9,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   36,   10,   36,
			   10,   10,   10,   10,   10,   10,   39,   39,   64,   39,
			  669,   38,   38,  669,   38,  142,   40,   40,   72,   40,
			  639,   64,   41,   41,  348,   41,  348,   39,   10,   10,
			   10,   10,   38,   77,  612,   64,   38,   40,  340,  145,
			   39,   40,  142,   41,   43,   43,   79,   43,   64,   42,
			   42,   39,   42,   40,   41,   10,   10,   10,   44,   44,

			  199,   44,  610,   38,   77,   43,  145,   39,   40,   43,
			   42,  340,  608,   45,   45,   65,   45,   79,   39,   44,
			   40,   41,  607,   65,   42,   42,   47,   47,   66,   47,
			   42,  199,   77,   66,   45,   44,   43,  146,   49,   49,
			   45,   49,   65,   51,   51,   79,  147,   47,   51,   51,
			   65,   42,   42,   45,  148,   66,  149,   42,   47,   49,
			   66,   76,   44,  101,  146,   76,   47,   45,   90,  606,
			   90,   90,  151,  147,  101,   49,  110,  110,  604,  110,
			   45,  148,  153,  149,   51,   47,   82,   82,  191,   82,
			  191,  191,  603,   47,  104,  602,  101,  110,  576,  151,

			  575,  101,   49,   55,   55,  104,  154,  155,   76,  153,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,  104,  154,  155,   82,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   56,
			   56,  156,  159,  162,  165,  556,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,  156,  159,
			  162,  165,   56,   56,   56,   56,   56,   56,   56,   56,

			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   75,   75,  555,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   83,   83,   98,   83,   84,   84,   98,

			   84,   85,   85,  105,   85,  105,  554,  105,   98,  136,
			  136,   84,   84,  111,  111,   85,  111,   84,  136,  552,
			  430,   85,  120,  120,  186,  120,  548,  547,  130,  130,
			  546,  130,  347,  150,  111,  166,  167,  168,   98,  150,
			  105,  120,   83,  120,  493,  491,   84,   98,  136,  130,
			   85,   88,   88,   98,   88,  430,  490,   98,  189,   98,
			  150,  221,  166,  167,  168,  347,  150,  186,  318,  221,
			  221,  130,  160,  169,   88,  160,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,  130,  160,

			  169,  189,  160,  170,  207,  207,  227,  207,  227,  227,
			  235,  318,  235,  323,  323,  235,  323,  344,  486,  344,
			  374,  374,  344,  374,  453,  189,  452,   88,   96,   96,
			  170,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   96,   96,   96,   96,   96,   96,  113,  113,  437,  113,
			  114,  114,  428,  114,  115,  115,  426,  115,  116,  116,
			  152,  116,  117,  117,  171,  117,  152,  113,  424,  118,
			  118,  114,  118,  422,  163,  115,  421,  163,  114,  116,
			  113,  121,  121,  117,  121,  119,  119,  152,  119,  117,
			  118,  171,  420,  152,  115,  117,  172,  122,  122,  116,
			  122,  163,  121,  118,  163,  114,  119,  113,  123,  123,
			  412,  123,  411,  349,  124,  124,  117,  124,  122,  121,
			  419,  115,  117,  172,  122,  119,  116,  122,  173,  123,
			  118,  174,  346,  175,  345,  124,  125,  125,  342,  125,

			  126,  126,  638,  126,  127,  127,  121,  127,  176,  178,
			  341,  122,  119,  419,  122,  173,  124,  125,  174,  123,
			  175,  126,  339,  128,  327,  127,  326,  126,  129,  129,
			  425,  129,  127,  128,  180,  176,  178,  128,  125,  320,
			  128,  128,  312,  124,  309,  638,  128,  181,  182,  129,
			  131,  131,  286,  131,  126,  133,  133,  129,  133,  127,
			  128,  180,  177,  425,  128,  125,  177,  128,  128,  132,
			  132,  131,  132,  128,  181,  182,  133,  183,  134,  134,
			  184,  134,  179,  131,  129,  194,  179,  131,  190,  177,
			  132,  200,  200,  177,  200,  133,  196,  284,  132,  134,

			  190,  229,  190,  268,  183,  201,  201,  184,  201,  179,
			  131,  266,  229,  179,  131,  234,  194,  202,  202,  236,
			  202,  236,  133,  236,  134,  132,  234,  196,  427,  204,
			  204,  202,  204,  190,  229,  213,  213,  202,  213,  229,
			  200,  269,  273,  204,  194,  275,  246,  276,  234,  204,
			  277,  134,  139,  234,  201,  196,  236,  246,  213,  239,
			  239,  427,  239,  237,  232,  231,  202,  246,  269,  273,
			  226,  225,  275,  332,  276,  224,  223,  277,  204,  222,
			  239,  332,  332,  220,  246,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,

			  139,  139,  139,  139,  139,  139,  139,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  238,  238,  206,  238,  206,  206,  206,
			  206,  206,  206,  241,  241,  485,  241,  278,  240,  240,
			  219,  240,  242,  242,  238,  242,  245,  245,  218,  245,
			  252,  252,  217,  252,  241,  206,  206,  206,  206,  240,
			  238,  489,  241,  242,  278,  279,  240,  245,  485,  258,
			  258,  252,  258,  280,  249,  249,  242,  249,  255,  255,
			  212,  255,  206,  206,  206,  209,  209,  238,  209,  241,
			  258,  197,  279,  240,  489,  249,  255,  245,  164,  255,

			  280,  415,  415,  242,  415,  161,  158,  249,  209,  157,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  243,  243,  249,  243,  244,  244,  484,  244,
			  484,  247,  247,  484,  247,  248,  248,  281,  248,  250,
			  250,  282,  250,  243,  140,  253,  253,  244,  253,  283,
			  137,  209,  247,  492,  251,  251,  248,  251,  254,  254,
			  250,  254,  285,  243,  281,  247,  253,  244,  282,  248,
			  259,  259,  250,  259,  135,  251,  283,  256,  256,  254,
			  256,  251,  257,  257,  106,  257,  492,  254,  253,  285,

			  243,  259,  247,  103,  244,  256,  248,  100,  256,  250,
			  257,  260,  260,  257,  260,  288,  259,  289,  251,   99,
			  261,  261,   95,  261,  254,  253,  262,  262,   93,  262,
			  263,  263,  260,  263,  264,  264,  290,  264,  291,   91,
			  260,  261,  288,  259,  289,  292,  287,  262,  293,  265,
			  265,  263,  265,  287,   80,  264,  294,  295,  296,  261,
			  299,  300,  301,  290,  287,  291,  262,  260,   69,  302,
			  265,  303,  292,  304,  287,  293,  305,  306,  307,  308,
			  310,  263,  311,  294,  295,  296,  261,  299,  300,  301,
			  315,  287,  316,  262,  376,  265,  302,  494,  303,  494,

			  304,  338,  494,  305,  306,  307,  308,  310,   54,  311,
			  321,  321,  338,  321,  357,  322,  322,  315,  322,  316,
			  343,  376,  265,  317,  321,  357,  324,  324,  365,  324,
			  321,  343,   35,   34,  338,  357,  317,   32,  365,  338,
			  377,  378,   28,  317,  317,  317,  317,  317,  317,  324,
			   26,  379,  357,  343,   18,  551,   17,  381,  343,  321,
			  350,  350,   16,  350,  322,  365,  317,  377,  378,  317,
			  317,  317,  317,  317,  317,  317,  351,  351,  379,  351,
			   13,  350,  352,  352,  381,  352,  353,  353,  551,  353,
			  354,  354,    0,  354,  605,  355,  355,  351,  355,  359,

			  359,  382,  359,  352,  350,  356,  356,  353,  356,  351,
			    0,  354,  358,  358,  384,  358,  355,  385,  360,  360,
			  359,  360,  361,  361,  355,  361,  356,  605,  382,  353,
			  356,  350,  354,  358,  362,  362,  351,  362,  366,  360,
			    0,  384,  359,  361,  385,  358,  363,  363,  366,  363,
			    0,  355,  366,    0,  360,  362,  353,  356,  361,  354,
			    0,  364,  364,  367,  364,    0,  362,  363,    0,  359,
			  386,    0,  358,  367,    0,  366,    0,  367,    0,  366,
			  367,  360,  364,  387,  388,  361,  363,  368,  368,    0,
			  368,  369,  369,  362,  369,  370,  370,  386,  370,  389,

			  367,  364,  371,  371,  367,  371,  390,  367,  368,  391,
			  387,  388,  369,  363,  372,  372,  370,  372,  392,  373,
			  373,  393,  373,  371,  394,  395,  389,  396,  364,  397,
			  371,  398,  399,  390,  373,  372,  391,  400,  370,  372,
			  373,  401,  406,  407,  408,  392,  409,  410,  393,  418,
			  372,  394,  395,  454,  396,  408,  397,  371,  398,  399,
			  418,  429,  455,    0,  400,  370,  372,  423,  401,  406,
			  407,  408,  429,  409,  410,  456,  458,  372,  423,  549,
			  454,  549,  408,  413,  549,  431,  431,  418,  431,  455,
			  413,  413,  413,  413,  413,  413,  550,    0,  550,  429,

			  423,  550,  456,  458,  449,  423,  431,  432,  432,    0,
			  432,  433,  433,  461,  433,  449,  413,  413,  413,  413,
			  413,  413,  413,  434,  434,  449,  434,    0,  432,    0,
			  435,  435,  433,  435,  436,  436,  431,  436,    0,  433,
			  461,    0,  449,  432,  434,  463,  438,  438,    0,  438,
			  464,  435,  434,  439,  439,  436,  439,  440,  440,  465,
			  440,  467,  441,  441,  434,  441,  433,  438,  436,    0,
			  432,  559,  463,  559,  439,  438,  559,  464,  440,  434,
			  457,  439,  613,  441,  442,  442,  465,  442,  467,  468,
			  440,  434,  457,  443,  443,  436,  443,  444,  444,    0,

			  444,    0,  438,  445,  445,  442,  445,  457,  439,  446,
			  446,    0,  446,  442,  443,  613,  468,  440,  444,  457,
			  469,  470,  447,  447,  445,  447,  444,  459,  450,  450,
			  446,  450,  445,  443,  448,  448,  471,  448,  446,  459,
			  442,  451,  451,  447,  451,  472,  473,  469,  470,  474,
			  475,  476,  477,  444,  459,  448,  478,  479,  480,  445,
			  443,  481,  447,  471,  487,  446,  459,    0,    0,  516,
			    0,  448,  472,  473,    0,  517,  474,  475,  476,  477,
			  640,  488,  495,  478,  479,  480,  487,  518,  481,  447,
			  451,  487,  488,  495,  500,  500,  516,  500,  448,  482,

			  496,  496,  517,  496,    0,    0,  482,  482,  482,  482,
			  482,  482,  519,  640,  518,  500,    0,  643,  520,  488,
			  495,  496,    0,  497,  497,  496,  497,  644,  498,  498,
			    0,  498,  482,  482,  482,  482,  482,  482,  482,  519,
			  499,  499,  502,  499,  497,  520,  522,    0,  497,  498,
			  643,    0,  496,  501,  501,  523,  501,  498,    0,  502,
			  644,  499,    0,  502,  503,  503,    0,  503,  504,  504,
			    0,  504,    0,  522,  501,  497,  499,  505,  505,    0,
			  505,  525,  523,  513,  498,  503,  502,  501,    0,  504,
			  506,  506,    0,  506,  513,  601,    0,  504,  505,  507,

			  507,    0,  507,  499,  513,  503,  508,  508,  525,  508,
			  601,  506,  509,  509,  501,  509,    0,    0,    0,  505,
			  507,  513,  510,  510,  504,  510,  526,  508,  507,  514,
			    0,  506,  503,  509,  508,    0,  511,  511,  601,  511,
			  514,  527,  528,  510,  512,  512,  505,  512,  529,  530,
			  514,  531,  532,  526,  533,  507,  534,  511,  506,  535,
			  536,  508,  510,  511,  537,  512,  539,  514,  527,  528,
			  540,  541,  512,  543,    0,  529,  530,    0,  531,  532,
			  553,  533,    0,  534,  558,  664,  535,  536,  577,  510,
			  511,  537,  578,  539,    0,  558,    0,  540,  541,  512,

			  543,  544,  553,  560,  560,    0,  560,  553,  544,  544,
			  544,  544,  544,  544,    0,  577,    0,  558,  664,  578,
			  561,  561,  558,  561,  560,  562,  562,    0,  562,  563,
			  563,  565,  563,    0,  544,  544,  544,  544,  544,  544,
			  544,  561,    0,  560,  564,  564,  562,  564,  565,    0,
			  563,    0,  565,  579,  561,    0,  563,  566,  566,    0,
			  566,  567,  567,    0,  567,  564,  568,  568,    0,  568,
			  560,  569,  569,    0,  569,  565,  571,  571,  566,  571,
			  579,  561,  567,  563,    0,  570,  570,  568,  570,    0,
			  572,  572,  569,  572,    0,  573,  573,  571,  573,  574,

			  574,    0,  574,  581,  583,  587,  570,  590,  593,  595,
			  597,  572,  568,  598,  599,  600,  573,    0,  625,  572,
			  574,  570,  614,  614,  609,  614,  609,  573,  574,  609,
			  581,  583,  587,  611,  590,  593,  595,  597,    0,  568,
			  598,  599,  600,  614,  611,  625,  572,  626,  570,  614,
			    0,  627,  628,    0,  573,  574,  615,  615,    0,  615,
			    0,  616,  616,    0,  616,  623,  611,  618,  618,  623,
			  618,  611,  619,  619,  626,  619,  614,  615,  627,  628,
			  620,  620,  616,  620,  621,  621,  623,  621,  618,  615,
			  616,  622,  622,  619,  622,  629,  623,  632,  624,  619,

			  633,  620,  624,  634,  635,  621,  637,  651,  620,    0,
			    0,  651,  622,  621,    0,    0,  615,  616,    0,  624,
			  645,  645,  629,  645,  632,    0,  619,  633,  651,  624,
			  634,  635,  653,  637,  654,  620,  646,  646,  651,  646,
			  621,  645,  647,  647,    0,  647,  648,  648,    0,  648,
			  649,  649,  645,  649,    0,  650,  650,  646,  650,  653,
			  652,  654,  655,  647,  652,  658,  659,  648,  661,  665,
			  665,  649,  665,  671,  672,  648,  650,  673,  646,  645,
			    0,  652,  666,  666,    0,  666,    0,  674,  675,  655,
			  665,  652,  658,  659,  676,  661,  682,  650,  665,  687,

			  671,  672,  648,  666,  673,  646,  667,  667,  691,  667,
			  668,  668,    0,  668,  674,  675,  677,  677,    0,  677,
			    0,  676,    0,  682,  650,  665,  687,  667,  666,  678,
			  678,  668,  678,  679,  679,  691,  679,  677,  680,  680,
			  681,  680,  688,  688,  692,  688,  696,  667,  681,  690,
			  678,    0,    0,  700,  679,  666,  668,  690,  677,  680,
			    0,  681,    0,  688,    0,  689,  689,    0,  689,    0,
			  690,  692,    0,  696,  667,  681,  680,    0,  693,  693,
			  700,  693,    0,  668,  690,  677,  689,    0,  688,  694,
			  694,  699,  694,    0,  689,    0,    0,  698,  698,  693,

			  698,    0,  699,  680,  701,  701,  702,  701,    0,    0,
			  694,  705,  699,  706,    0,  688,  693,  702,  698,    0,
			    0,  689,    0,    0,    0,  701,  698,  702,  705,  699,
			  706,  734,  705,    0,  706,    0,  734,  734,  734,  734,
			  734,  734,  737,  693,  702,    0,    0,  737,  737,  737,
			  737,  737,  737,  698,    0,  705,    0,  706,  709,  709,
			  709,  709,  709,  709,  709,  709,  709,  709,  709,  709,
			  709,  709,  709,  709,  709,  709,  709,  709,  709,  709,
			  709,  709,  709,  709,  709,  709,  709,  709,  709,  709,
			  709,  709,  709,  709,  709,  709,  709,  709,  709,  709,

			  709,  710,  710,  710,  710,  710,  710,  710,  710,  710,
			  710,  710,  710,  710,  710,  710,  710,  710,  710,  710,
			  710,  710,  710,  710,  710,  710,  710,  710,  710,  710,
			  710,  710,  710,  710,  710,  710,  710,  710,  710,  710,
			  710,  710,  710,  710,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  711,  711,
			  711,  711,  711,  711,  711,  711,  711,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,

			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  712,  712,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  713,  713,  713,
			  713,  713,  713,  714,  714,    0,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,

			  714,  714,  714,  714,  714,  714,  714,  714,  714,  714,
			    0,  714,  714,  714,  714,  714,  715,  715,    0,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  716,
			  716,  716,    0,    0,    0,    0,    0,    0,  716,    0,
			    0,  716,    0,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,    0,    0,  716,  716,  716,

			  717,  717,    0,  717,  717,    0,  717,    0,    0,    0,
			    0,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  717,  717,  717,    0,    0,  717,  717,  717,  718,  718,
			    0,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  718,  718,  718,  718,  718,  718,  718,  718,  718,
			  718,  719,  719,    0,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,  719,  719>>,
			1, 3000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  719,  719,  719,  719,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  719,  719,  719,  719,  719,  719,
			  719,  719,  719,  719,  720,  720,  720,  720,  720,  720,
			  720,  720,  720,  720,  720,  720,  720,  720,  720,  720,
			  720,  720,  720,  720,  720,  720,  720,  720,  720,  720,
			  720,  720,  720,  720,  720,  720,  720,  720,  720,  720,
			  720,  720,  720,  720,  720,  720,  720,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,

			  721,  721,  721,  721,  721,  721,  721,  721,  721,  721,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,    0,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  722,  722,  722,  722,  722,  722,  722,
			  722,  722,  722,  723,  723,  723,    0,    0,    0,  723,
			  723,    0,  723,    0,    0,    0,    0,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,  723,
			  723,  723,  723,  723,  723,  723,  723,  723,  723,    0,
			  723,  723,  723,  723,  724,  724,  724,  724,  724,  724,

			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  724,  724,  724,
			  724,  724,  724,  724,  724,  724,  724,  725,  725,  725,
			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  725,  725,  725,  725,  725,  725,  725,  725,  725,  725,
			  726,  726,    0,  726,  726,  726,  726,  726,  726,  726,
			  726,  726,  726,  726,  726,  726,  726,  726,  726,  726,

			  726,  726,  726,  726,  726,  726,  726,  726,  726,  726,
			  726,  726,  726,  726,  726,  726,  726,  726,  726,  726,
			  726,  726,  726,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  727,  727,  727,  727,
			  727,  727,  727,  727,  727,  727,  728,  728,  728,  728,
			  728,  728,  728,  728,    0,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,
			  728,  728,  728,  728,  728,  728,  728,  728,  728,  728,

			  728,  728,  728,  728,  728,  728,  728,  728,  728,  729,
			  729,    0,  729,  729,    0,  729,  729,    0,    0,    0,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  729,    0,    0,  729,  729,  729,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  730,  730,  730,  730,  730,  730,  730,
			  731,  731,  731,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  731,  731,  731,    0,    0,    0,    0,
			    0,  731,  732,    0,  732,    0,    0,  732,  732,  732,
			  732,  732,  732,  732,  732,  732,  732,  732,  732,  732,
			  732,  732,  732,  732,  732,  732,  732,  732,  732,    0,
			    0,  732,  732,  732,  733,  733,  733,  733,  733,  733,
			    0,  733,  733,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  733,  733,  733,  733,  733,  733,  733,  733,
			  733,  733,  733,  733,  733,  733,  733,  733,  733,  733,

			  733,  733,    0,  733,  733,  733,  733,  735,  735,  735,
			    0,    0,    0,  735,  735,    0,  735,    0,    0,    0,
			    0,  735,  735,  735,  735,  735,  735,  735,  735,  735,
			  735,  735,  735,  735,  735,  735,  735,  735,  735,  735,
			  735,  735,  735,    0,    0,  735,  735,  735,  736,  736,
			  736,    0,  736,  736,  736,  736,  736,  736,  736,  736,
			  736,  736,    0,  736,  736,  736,  736,  736,  736,  736,
			  736,  736,  736,  736,  736,  736,  736,  736,  736,  736,
			  736,  736,  736,  736,  736,  736,  736,  736,  736,  736,
			  736,  738,    0,    0,    0,    0,  738,  738,  738,  738,

			  738,  738,  739,  739,  739,  739,  739,  739,  739,  739,
			    0,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  739,  739,  739,  739,  739,
			  739,  739,  739,  739,  739,  740,    0,    0,    0,    0,
			  740,  740,  740,  740,  740,  740,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,

			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708>>,
			1, 835, 3000)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   77,   62,   63,    0,    0,  141,
			  219,   60,   81, 1480, 3756,   86, 1459, 1432, 1447, 3756,
			   82, 3756, 3756, 3756, 3756, 3756, 1433,   76, 1423,   81,
			 3756, 3756, 1413, 3756, 1409, 1406,  174,  100,  249,  244,
			  254,  260,  287,  282,  296,  311,  105,  324,  131,  336,
			  113,  331, 3756, 3756, 1356,  383,  439,   68,  135,  145,
			   70,  143,  146,  136,  219,  281,  290,  139,  139, 1349,
			 3756, 3756,  208, 3756, 3756,  514,  358,  254, 3756,  267,
			 1304, 3756,  384,  591,  595,  599, 3756,   92,  649, 3756,
			  366, 1336, 3756, 1321, 3756, 1311,  727,    0,  588, 1316,

			 1289,  343, 3756, 1283,  374,  587, 1274, 3756, 3756, 3756,
			  374,  611, 3756,  804,  808,  812,  816,  820,  827,  843,
			  620,  839,  855,  866,  872,  894,  898,  902,  903,  926,
			  626,  948,  967,  953,  976, 1263,  597, 1208, 3756, 1031,
			 1235,  153,  225,    0,   80,  243,  307,  304,  312,  313,
			  604,  329,  791,  346,  364,  371,  419, 1188, 1185,  422,
			  643, 1152,  423,  805, 1145,  420,  591,  592,  593,  644,
			  673,  795,  826,  857,  846,  862,  863,  927,  878,  947,
			  903,  905,  906,  929,  932, 3756,  617, 3756,  117,  651,
			  980,  386, 3756,  126,  966, 3756,  977, 1141, 3756,  281,

			  989, 1003, 1015, 3756, 1027,  201, 1106,  702,  105, 1183,
			 3756, 3756, 1155, 1033, 3756, 3756, 3756, 1078, 1126, 1129,
			 1072,  650, 1068, 1065, 1064, 1060, 1059,  704, 3756,  981,
			   94, 1045, 1044, 3756,  995,  695, 1003, 1043, 1121, 1057,
			 1136, 1131, 1140, 1230, 1234, 1144, 1020, 1239, 1243, 1172,
			 1247, 1262, 1148, 1253, 1266, 1176, 1285, 1290, 1167, 1278,
			 1309, 1318, 1324, 1328, 1332, 1347,  990, 3756,  984, 1002,
			    0,  101,  117, 1003,    0, 1015, 1017, 1019, 1101, 1122,
			 1142, 1211, 1208, 1216,  944, 1229,  899, 1327, 1279, 1281,
			 1301, 1303, 1309, 1312, 1321, 1328, 1329,    0,    0, 1315,

			 1330, 1317, 1338, 1333, 1342, 1338, 1346, 1337, 1337,  891,
			 1339, 1340,  889,    0,    0, 1342, 1344, 1416,  661, 3756,
			  936, 1408, 1413,  711, 1424,    0,  904,  913, 3756, 3756,
			 3756, 3756, 1062, 3756, 3756, 3756, 3756, 3756, 1381,  902,
			  258,  890,  878, 1400,  702,  874,  872,  612,  246,  853,
			 1458, 1474, 1480, 1484, 1488, 1493, 1503, 1388, 1510, 1497,
			 1516, 1520, 1532, 1544, 1559, 1408, 1518, 1543, 1585, 1589,
			 1593, 1600, 1612, 1617,  718,    0, 1348, 1394, 1406, 1416,
			    0, 1412, 1457,    0, 1469, 1473, 1539, 1556, 1553, 1564,
			 1561, 1571, 1580, 1586, 1579, 1587, 1593, 1595, 1589, 1590,

			 1595, 1599,    0,    0,    0,    0, 1597, 1613, 1617, 1601,
			 1617,  855,  853, 1663, 3756, 1199,    0, 3756, 1629,  860,
			  832,  816,  817, 1647,  808,  910,  796, 1008,  792, 1641,
			  602, 1683, 1705, 1709, 1721, 1728, 1732,  787, 1744, 1751,
			 1755, 1760, 1782, 1791, 1795, 1801, 1807, 1820, 1832, 1678,
			 1826, 1839,  673,  671, 1615, 1624, 1645, 1749, 1646, 1796,
			    0, 1677,    0, 1714, 1720, 1724,    0, 1730, 1759, 1785,
			 1790, 1805, 1803, 1815, 1807, 1819, 1820, 1821, 1814, 1818,
			 1827, 1830, 1879,    0, 1223, 1115,  698, 1833, 1861, 1141,
			  636,  625, 1243,  624, 1382, 1862, 1898, 1921, 1926, 1938,

			 1892, 1951, 1916, 1962, 1966, 1975, 1988, 1997, 2004, 2010,
			 2020, 2034, 2042, 1957, 2003, 3756, 1842, 1848, 1860, 1881,
			 1880,    0, 1915, 1917,    0, 1945, 1983, 2010, 1998, 2005,
			 2018, 2007, 2009, 2011, 2025, 2029, 2029, 2034,    0, 2024,
			 2041, 2041,    0, 2031, 2081,    0,  610,  607,  606, 1664,
			 1681, 1435,  599, 2049,  586,  497,  445, 3756, 2064, 1756,
			 2101, 2118, 2123, 2127, 2142, 2105, 2155, 2159, 2164, 2169,
			 2183, 2174, 2188, 2193, 2197,  383,  381, 2046, 2056, 2117,
			    0, 2174,    0, 2175,    0,    0,    0, 2157,    0,    0,
			 2159,    0,    0, 2170,    0, 2171,    0, 2179, 2179, 2183,

			 2184, 1988,  373,  339,  358, 1474,  349,  302,  292, 2209,
			  249, 2213,  254, 1762, 2220, 2254, 2259, 3756, 2265, 2270,
			 2278, 2282, 2289, 2239, 2272, 2189, 2212, 2216, 2221, 2264,
			    0,    0, 2268, 2271, 2273, 2273,    0, 2276,  895,  249,
			 1860,  141,  165, 1897, 1907, 2318, 2334, 2340, 2344, 2348,
			 2353, 2281, 2334, 2298, 2290, 2318,    0,    0, 2334, 2335,
			    0, 2324,    0, 3756, 2065, 2367, 2380, 2404, 2408,  248,
			 3756, 2342, 2326, 2329, 2344, 2345, 2346, 2414, 2427, 2431,
			 2436, 2414, 2352,    0,    0,    0,    0, 2359, 2440, 2463,
			 2423, 2360, 2413, 2476, 2487,  118, 2406,    0, 2495, 2465,

			 2422, 2502, 2480,    0,   68, 2485, 2487, 3756, 3756, 2557,
			 2600, 2643, 2686, 2729, 2772, 2815, 2857, 2895, 2937, 2980,
			 3023, 3066, 3109, 3151, 3193, 3236, 3279, 3322, 3365, 3404,
			 3446, 3488, 3521, 3563, 2520, 3605, 3647, 2531, 3680, 3701,
			 3734>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  708,    1,  709,  709,  710,  710,  711,  711,  712,
			  712,  713,  713,  708,  708,  708,  708,  708,  714,  708,
			  715,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,   42,  716,
			  716,  717,  708,  708,  718,  708,  708,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,  708,
			  708,  708,  719,  708,  708,  708,  720,  721,  708,  721,
			  722,  708,  723,  708,  723,  723,  708,  724,  725,  708,
			  708,  708,  708,  714,  708,  726,  708,  726,  726,  727,

			  708,  708,  708,  708,  728,  708,  708,  708,  708,  708,
			  708,  716,  708,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,   42,  716,
			  716,  716,  716,  716,  716,  729,  717,  718,  708,   56,
			  708,  139,  139,   56,   56,   56,   56,  139,   56,  139,
			  139,   56,   56,  139,  139,   56,   56,  139,   56,  139,
			  139,  139,   56,   56,   56,  139,   56,  139,   56,  139,
			  139,   56,   56,  139,  139,   56,   56,  139,  139,   56,
			   56,  139,   56,  139,   56,  708,  719,  708,  720,  719,
			   75,  708,  708,  720,  721,  708,  721,  722,  708,  722,

			  723,  708,  723,  708,  708,  708,  730,  708,  724,  725,
			  708,  708,  209,  731,  708,  708,  708,  708,  732,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  716,  716,
			  716,  716,  716,  716,  716,  716,  708,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  708,  708,  708,  139,
			  139,  708,  139,   56,   56,  139,   56,  139,  139,  139,
			   56,   56,   56,  139,  139,   56,   56,  708,  139,  139,
			  139,  139,   56,   56,   56,  139,   56,  139,   56,  139,

			  139,   56,   56,  139,  139,   56,   56,  139,  139,  139,
			   56,   56,   56,  139,   56,  139,   56,  719,  719,  708,
			  733,  733,  708,  733,  731,  734,  732,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  716,  716,  716,  716,  716,  716,  716,  708,  716,  716,
			  716,  716,  716,  716,  716,  128,  128,  128,  716,  716,
			  716,  716,  716,  716,  735,  736,  139,   56,  139,   56,
			  139,  139,  139,   56,   56,   56,  139,  139,   56,  139,
			  139,  139,  139,   56,   56,   56,  139,   56,  139,  139,

			   56,   56,  139,  139,   56,   56,  139,  139,  139,   56,
			   56,  139,   56,  317,  708,  708,  737,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  728,
			  708,  716,  716,  716,  716,  716,  716,  708,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  708,
			  708,  735,  139,   56,  139,   56,  139,  139,   56,   56,
			  139,  139,   56,  139,  139,  139,  139,   56,   56,   56,
			  139,   56,  139,  139,   56,   56,  139,  139,  139,  139,
			   56,   56,  317,  738,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  739,  716,  716,  716,  716,

			  716,  716,  708,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  708,  708,  708,  139,  139,   56,  139,
			  139,  139,   56,   56,   56,  139,  139,  139,  139,   56,
			   56,   56,  139,   56,  139,  139,   56,   56,  139,  139,
			  139,  139,   56,   56,  317,  740,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  716,  716,  716,  716,  716,  708,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  708,  708,  139,  139,   56,
			  139,  139,   56,   56,  139,  139,  139,  139,   56,   56,
			   56,  139,   56,  139,  139,   56,   56,  139,  139,  139,

			   56,  719,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  716,  716,  716,  708,  716,  716,
			  716,  716,  716,  708,  708,  139,  139,   56,  139,   56,
			  139,   56,  139,   56,  139,  139,  139,   56,  719,  708,
			  708,  708,  708,  708,  708,  716,  716,  716,  716,  716,
			  716,  708,  708,  139,  139,   56,  139,   56,  139,   56,
			  139,  139,   56,  708,  708,  716,  716,  716,  716,  708,
			  708,  139,  139,   56,  139,   56,  139,  716,  716,  716,
			  716,  708,  139,  139,   56,  139,   56,  139,  716,  716,
			  708,  139,  139,  716,  716,  708,  139,  139,  716,  708,

			  139,  716,  708,  139,  708,  708,  708,  708,    0,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708,  708,  708,  708,  708,  708,  708,  708,  708,  708,
			  708>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    1,    1,    5,    6,    1,    1,    7,    8,    9,   10,
			   11,   12,   13,   14,    1,   15,    1,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,    1,
			   38,   39,    1,   11,   11,   11,   11,   11,   11,   11,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   41,   42,    1,    1,   43>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  116,  114,    1,    2,   15,   92,   18,
			  114,   16,   17,    7,    6,   13,    5,   11,    8,   83,
			   14,   12,   29,   10,   30,   20,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   69,   77,   77,   77,
			   77,   22,   31,   23,    9,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   24,
			   21,   25,   97,  100,   99,   97,  100,  115,   81,  115,
			  115,  115,  115,  115,  115,  115,   66,  115,  115,   76,
			    1,    2,   28,   92,   91,  112,  112,  112,  112,    3,

			   33,   87,   32,    0,    0,   83,    0,   27,   26,   19,
			    0,   77,   73,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   40,   77,   77,
			   77,   77,   77,   77,   77,    0,    0,    0,   82,   78,
			    0,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   40,   78,   40,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   79,   97,   99,    0,   97,
			   97,   98,   94,   93,    0,   81,    0,    0,   80,    0,

			    0,    0,    0,   66,    0,   64,    0,   63,    0,    0,
			   76,   74,   74,    0,   75,  112,  101,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,    4,   34,   87,
			    0,    0,    0,   85,   87,   85,   83,    0,   77,   39,
			   77,   77,   77,   77,   77,   77,    0,   77,   77,   77,
			   77,   77,   42,   77,   77,   69,   69,   69,   69,   77,
			   77,   77,   77,   77,   41,   77,    0,   67,    0,   78,
			   39,   68,   68,   78,   39,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,    0,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   42,   42,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   41,   41,   78,   78,   97,   95,   80,
			    0,    0,   65,   63,    0,    0,    0,    0,  108,  106,
			  109,  113,  113,  107,  105,  102,  103,  104,   87,    0,
			   87,    0,    0,   87,    0,    0,    0,   86,   83,    0,
			   77,   77,   38,   77,   77,   77,   77,    0,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   37,   44,
			   77,   77,   77,   77,   62,   60,   78,   78,   78,   78,
			   38,   78,   78,   38,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   37,   44,   37,   44,   78,   78,   78,   78,
			   78,   78,   78,   97,   65,   63,    0,  110,   87,   87,
			    0,    0,   84,   87,    0,   86,    0,   86,    0,    0,
			    0,   77,   77,   77,   77,   45,   77,    0,   77,   77,
			   77,   36,   77,   77,   77,   77,   77,   77,   77,    0,
			   62,    0,   78,   78,   78,   78,   78,   78,   78,   78,
			   45,   78,   45,   78,   78,   78,   36,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   97,    0,    0,   87,    0,   90,   87,   86,
			    0,    0,   86,    0,   85,    0,   77,   77,   77,   77,

			   47,   77,    0,   77,   77,   77,   77,   77,   77,   53,
			   77,   77,   77,    0,    0,   61,   78,   78,   78,   78,
			   78,   47,   78,   78,   47,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   53,   78,
			   78,   78,   53,   78,   97,    0,    0,   87,    0,    0,
			    0,   86,    0,   90,   86,    0,    0,   88,   90,   88,
			   77,   77,   59,   77,   46,    0,   43,   58,   77,   35,
			   77,   51,   77,   77,   77,    0,    0,   78,   78,   78,
			   59,   78,   59,   78,   46,   43,   58,   78,   43,   58,
			   78,   35,   35,   78,   51,   78,   51,   78,   78,   78,

			   78,   97,    0,   90,    0,   90,    0,   86,    0,    0,
			   89,   90,    0,   89,   77,   77,   77,   71,   54,   77,
			   77,   77,   55,    0,    0,   78,   78,   78,   78,   78,
			   54,   54,   78,   78,   78,   78,   55,   78,   96,    0,
			   90,   89,    0,   89,   89,   77,   77,   48,   77,   52,
			   77,    0,    0,   78,   78,   78,   48,   48,   78,   78,
			   52,   78,   52,  111,   89,   77,   77,   77,   77,   70,
			   70,   78,   78,   78,   78,   78,   78,   77,   50,   49,
			   77,    0,   78,   50,   50,   49,   49,   78,   77,   77,
			    0,   78,   78,   77,   56,    0,   78,   56,   77,    0,

			   78,   57,    0,   57,    0,    0,    0,   72,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 3756
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 708
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 709
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

	yyNb_rules: INTEGER is 115
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 116
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
