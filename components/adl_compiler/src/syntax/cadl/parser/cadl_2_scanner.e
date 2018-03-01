note
	component:   "openEHR ADL Tools"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_2_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_2_TOKENS
		export
			{NONE} all
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_EXTERNAL_VALUE_SET_DEF)
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
			inspect yy_act
when 1 then
--|#line 74 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 74")
end
-- Ignore separators
when 2 then
--|#line 75 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 75")
end
in_lineno := in_lineno + text_count
when 3 then
--|#line 80 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 80")
end
-- Ignore comments
when 4 then
--|#line 81 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 81")
end
in_lineno := in_lineno + 1
when 5 then
--|#line 85 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 85")
end
last_token := Minus_code
when 6 then
--|#line 86 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 86")
end
last_token := Plus_code
when 7 then
--|#line 87 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 87")
end
last_token := Star_code
when 8 then
--|#line 88 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 88")
end
last_token := Slash_code
when 9 then
--|#line 89 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 89")
end
last_token := Caret_code
when 10 then
--|#line 90 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 90")
end
last_token := Equal_code
when 11 then
--|#line 91 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 91")
end
last_token := Dot_code
when 12 then
--|#line 92 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 92")
end
last_token := Semicolon_code
when 13 then
--|#line 93 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 93")
end
last_token := Comma_code
when 14 then
--|#line 94 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 94")
end
last_token := Colon_code
when 15 then
--|#line 95 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 95")
end
last_token := Exclamation_code
when 16 then
--|#line 96 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 96")
end
last_token := Left_parenthesis_code
when 17 then
--|#line 97 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 97")
end
last_token := Right_parenthesis_code
when 18 then
--|#line 98 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 98")
end
last_token := Dollar_code
when 19 then
--|#line 100 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 100")
end
last_token := Question_mark_code
when 20 then
--|#line 102 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 102")
end
last_token := SYM_INTERVAL_DELIM
when 21 then
--|#line 104 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 104")
end
last_token := Left_bracket_code
when 22 then
--|#line 105 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 105")
end
last_token := Right_bracket_code
when 23 then
--|#line 107 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 107")
end
last_token := SYM_START_CBLOCK
when 24 then
--|#line 108 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 108")
end
last_token := SYM_END_CBLOCK
when 25 then
--|#line 110 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 110")
end
last_token := SYM_GE
when 26 then
--|#line 111 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 111")
end
last_token := SYM_LE
when 27 then
--|#line 112 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 112")
end
last_token := SYM_NE
when 28 then
--|#line 114 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 114")
end
last_token := SYM_LT
when 29 then
--|#line 115 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 115")
end
last_token := SYM_GT
when 30 then
--|#line 117 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 117")
end
last_token := SYM_MODULO
when 31 then
--|#line 118 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 118")
end
last_token := SYM_DIV
when 32 then
--|#line 120 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 120")
end
last_token := SYM_ELLIPSIS
when 33 then
--|#line 121 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 121")
end
last_token := SYM_LIST_CONTINUE
when 34 then
--|#line 125 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 125")
end
last_token := SYM_MATCHES
when 35 then
--|#line 127 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 127")
end
last_token := SYM_MATCHES
when 36 then
--|#line 131 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 131")
end
last_token := SYM_THEN
when 37 then
--|#line 133 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 133")
end
last_token := SYM_ELSE
when 38 then
--|#line 135 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 135")
end
last_token := SYM_AND
when 39 then
--|#line 137 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 137")
end
last_token := SYM_OR
when 40 then
--|#line 139 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 139")
end
last_token := SYM_XOR
when 41 then
--|#line 141 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 141")
end
last_token := SYM_NOT
when 42 then
--|#line 143 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 143")
end
last_token := SYM_IMPLIES
when 43 then
--|#line 145 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 145")
end
last_token := SYM_TRUE
when 44 then
--|#line 147 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 147")
end
last_token := SYM_FALSE
when 45 then
--|#line 149 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 149")
end
last_token := SYM_FORALL
when 46 then
--|#line 151 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 151")
end
last_token := SYM_EXISTS
when 47 then
--|#line 155 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 155")
end
last_token := SYM_EXISTENCE
when 48 then
--|#line 157 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 157")
end
last_token := SYM_OCCURRENCES
when 49 then
--|#line 159 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 159")
end
last_token := SYM_CARDINALITY
when 50 then
--|#line 161 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 161")
end
last_token := SYM_ORDERED
when 51 then
--|#line 163 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 163")
end
last_token := SYM_UNORDERED
when 52 then
--|#line 165 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 165")
end
last_token := SYM_UNIQUE
when 53 then
--|#line 167 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 167")
end
last_token := SYM_USE_NODE
when 54 then
--|#line 169 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 169")
end
last_token := SYM_USE_ARCHETYPE
when 55 then
--|#line 171 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 171")
end
last_token := SYM_ALLOW_ARCHETYPE
when 56 then
--|#line 173 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 173")
end
last_token := SYM_INCLUDE
when 57 then
--|#line 175 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 175")
end
last_token := SYM_EXCLUDE
when 58 then
--|#line 177 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 177")
end
last_token := SYM_AFTER
when 59 then
--|#line 179 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 179")
end
last_token := SYM_BEFORE
when 60 then
--|#line 181 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 181")
end
last_token := SYM_CLOSED
when 61 then
--|#line 184 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 184")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
when 62 then
--|#line 190 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 190")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
when 63 then
--|#line 196 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 196")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
when 64 then
--|#line 202 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 202")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
when 65 then
--|#line 208 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 208")
end

		last_token := V_VALUE_DEF
		last_string_value := text_substring (2, text_count - 1)
	
when 66 then
--|#line 214 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 214")
end

		last_token := V_VALUE_SET_REF_ASSUMED
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
when 67 then
--|#line 222 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 222")
end

		last_token := V_EXT_REF
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
when 68, 69, 70 then
--|#line 231 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 231")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
when 71, 72 then
--|#line 240 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 240")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
when 73, 74 then
--|#line 248 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 248")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
when 75, 76 then
--|#line 256 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 256")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
when 77 then
--|#line 269 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 269")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
when 78 then
--|#line 279 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 279")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
when 79 then
--|#line 284 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 284")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 80 then
--|#line 294 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 294")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
when 81 then
--|#line 300 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 300")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 82 then
--|#line 311 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 311")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
when 83 then
--|#line 320 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 320")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
when 84 then
--|#line 326 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 326")
end

				last_string_value := text
				if is_primitive_type (last_string_value) then
					last_token := V_PRIMITIVE_TYPE_ID
				else
					last_token := V_TYPE_ID
				end
			
when 85 then
--|#line 336 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 336")
end

					last_token := V_GENERIC_TYPE_ID
					last_string_value := text
			
when 86 then
--|#line 342 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 342")
end

					last_token := V_FEATURE_CALL_ID
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
when 87 then
--|#line 349 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 349")
end

					last_token := V_ATTRIBUTE_ID
					last_string_value := text
			
when 88 then
--|#line 355 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 355")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
when 89 then
--|#line 361 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 361")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
when 90 then
--|#line 367 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 367")
end

			last_token := V_URI
			last_string_value := text
		
when 91 then
--|#line 373 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 373")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
when 92 then
--|#line 380 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 380")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
when 93 then
--|#line 384 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 384")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
when 94 then
--|#line 388 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 388")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
when 95 then
--|#line 392 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 392")
end
 		-- match final segment
				in_buffer.append_string (text)

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
	
when 96 then
--|#line 404 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 404")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
when 97 then
--|#line 411 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 411")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
when 98 then
--|#line 416 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 416")
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
			
when 99, 100 then
--|#line 431 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 431")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
when 101, 102, 103 then
--|#line 436 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 436")
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
			
when 104 then
--|#line 472 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 472")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 105 then
--|#line 481 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 481")
end
 -- match second last line with ';' termination (assumed value)
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(';')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			is_assumed_code := True -- for next code, not the one just parsed
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	
when 106 then
--|#line 496 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 496")
end
	-- match any line, with ',' termination
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(',')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	
when 107 then
--|#line 511 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 511")
end
in_lineno := in_lineno + text_count
when 108 then
--|#line 514 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 514")
end
in_lineno := in_lineno + 1
when 109 then
--|#line 516 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 516")
end
 -- match final line, terminating in ']'
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(']')
		if is_assumed_code then
			if last_term_constraint_parse_structure_value.has_code (str_) and not last_term_constraint_parse_structure_value.is_single then
				last_term_constraint_parse_structure_value.set_assumed_code (str_)
				last_token := V_EXPANDED_VALUE_SET_DEF
			else
				last_token := ERR_VALUE_SET_DEF_ASSUMED
				err_str.append (str_)
			end
		elseif not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			last_token := V_EXPANDED_VALUE_SET_DEF
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
		end
		set_start_condition (INITIAL)
	
when 110 then
--|#line 539 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 539")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 111 then
--|#line 549 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 549")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	
when 112 then
--|#line 565 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 565")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 113 then
--|#line 574 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 574")
end
 -- match second last line with ';' termination (assumed value)
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(';')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			is_assumed_code := True -- for next code, not the one just parsed
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	
when 114 then
--|#line 589 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 589")
end
	-- match any line, with ',' termination
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(',')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	
when 115 then
--|#line 604 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 604")
end
in_lineno := in_lineno + text_count
when 116 then
--|#line 607 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 607")
end
in_lineno := in_lineno + 1
when 117 then
--|#line 609 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 609")
end
 -- match final line, terminating in ']'
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(']')
		if is_assumed_code then
			if last_term_constraint_parse_structure_value.has_code (str_) and not last_term_constraint_parse_structure_value.is_single then
				last_term_constraint_parse_structure_value.set_assumed_code (str_)
				last_token := V_EXTERNAL_VALUE_SET_DEF
			else
				last_token := ERR_VALUE_SET_DEF_ASSUMED
				err_str.append (str_)
			end
		elseif not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			last_token := V_EXTERNAL_VALUE_SET_DEF
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
		end
		set_start_condition (INITIAL)
	
when 118 then
--|#line 632 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 632")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 119 then
--|#line 644 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 644")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
when 120 then
--|#line 649 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 649")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 121 then
--|#line 657 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 657")
end
in_buffer.append_character ('\')
when 122 then
--|#line 659 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 659")
end
in_buffer.append_character ('"')
when 123 then
--|#line 661 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 661")
end

				in_buffer.append_string (text)
	
when 124 then
--|#line 665 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 665")
end
in_buffer.append_string (text)
when 125 then
--|#line 667 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 667")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
when 126 then
--|#line 672 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 672")
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
			
when 127 then
--|#line 683 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 683")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 128 then
--|#line 691 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 691")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
when 129 then
--|#line 693 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 693")
end
last_token := V_CHARACTER; last_character_value := '%N'
when 130 then
--|#line 694 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 694")
end
last_token := V_CHARACTER; last_character_value := '%R'
when 131 then
--|#line 695 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 695")
end
last_token := V_CHARACTER; last_character_value := '%T'
when 132 then
--|#line 696 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 696")
end
last_token := V_CHARACTER; last_character_value := '%''
when 133 then
--|#line 697 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 697")
end
last_token := V_CHARACTER; last_character_value := '%H'
when 134, 135 then
--|#line 699 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 699")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
when 136 then
--|#line 704 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 704")
end
;
when 137 then
--|#line 0 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 0")
end
default_action
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2 then
--|#line 703 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 703")
end
terminate
when 1 then
--|#line 684 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 684")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 3 then
--|#line 540 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 540")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 4 then
--|#line 633 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 633")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4929)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			yy_nxt_template_10 (an_array)
			yy_nxt_template_11 (an_array)
			yy_nxt_template_12 (an_array)
			yy_nxt_template_13 (an_array)
			yy_nxt_template_14 (an_array)
			yy_nxt_template_15 (an_array)
			yy_nxt_template_16 (an_array)
			yy_nxt_template_17 (an_array)
			yy_nxt_template_18 (an_array)
			yy_nxt_template_19 (an_array)
			yy_nxt_template_20 (an_array)
			yy_nxt_template_21 (an_array)
			yy_nxt_template_22 (an_array)
			yy_nxt_template_23 (an_array)
			yy_nxt_template_24 (an_array)
			yy_nxt_template_25 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
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
			   12,   12,   12,   74,   83,  102,   83,   75,   74,  117,

			   87,   88,   75,   87,   87,   88,   96,   87,   96,   96,
			  128,  117,  117,   89,  215,  122,  105,   89,  106,  106,
			  106,  106,  106,  106,  123,  117,  117,  117,  117,  132,
			   84,   85,   84,   85,  178,  118,  121,  148,  128,  119,
			  103,  120,  145,  122,   76,  150,  179,  146,  182,   76,
			  136,  117,  123,  151,  152,  236,   90,  132,  236,  117,
			   90,  216,  180,  118,  121,  236,  148,  119,  236,  120,
			  145,  277,  424,  117,  181,  146,  183,  997,   77,   78,
			   79,   80,   81,   77,   78,   79,   80,   81,   91,   92,
			   93,   91,   92,   91,   91,   91,   91,   91,   91,   91, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   91,   91,   94,   95,   91,   95,   95,   95,   95,   95,
			   95,   91,   91,   91,   91,   91,   91,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   91,   91,   91,   91,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			  109,  986,  110,  303,  111,  111,  111,  111,  111,  111,
			  109,  117,  110,  117,  113,  113,  113,  113,  113,  113,

			  117,  117,  117,  117,  124,  117,  126,  129,  130,  134,
			  191,  143,  193,  131,  207,  125, 1010,  133,  127,  144,
			  306,  147,  135,  112,  214,  213,  214,  214,   96,  213,
			   96,   96,  124,  112,  126,  129,  130,  134,  192,  143,
			  194,  131,  208, 1007,  125,  133,  127,  144,  209,  147,
			  135,  136,  137,  137,  137,  137,  137,  137,  168,  158,
			  117,  170,  213,  158,  174,  158,  158,  138,  203,  195,
			  171,  199,  158,  204,  139,  175,  433,  210,  117,  200,
			  223,  140,  196,  141,  227,  142,  169,  164,  257,  172,
			  230,  164,  176,  164,  164,  138,  205,  197,  173,  201, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  164,  206,  139,  155,  177,  218,  155,  202,  220,  220,
			  198,  156,  141, 1004,  142,  155,  224,  225,  155,  117,
			  213,  228,  229,  156,  258,  213,  224,  225,  213,  817,
			  157,  158,  158,  158,  158,  158,  158,  159,  117,  272,
			  217,  217,  217,  158,  158,  158,  158,  158,  160,  158,
			  158,  158,  161,  158,  162,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  163,  272,  818,  280,
			  158,  164,  164,  164,  164,  164,  165,  164,  164,  164,
			  166,  164,  167,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  155,  960,  117,  155,  219,  219,

			  219,  117,  156,  221,  221,  221,  117,  957,  218,  157,
			  158,  158,  158,  158,  158,  158,  159,  213,  297,  267,
			  270,  999,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  163,  297,  267,  270,  158,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  184,  185,  231,  997,  239,  231,  186,
			  239,  239,  996,  303,  239,  214,  311,  214,  214,  240,
			  241,  613,  613,  240,  187,  217,  217,  217,  117,  246, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  242,  188,  189,  117,  242,  268,  117,  190,  247,  247,
			  247,  247,  247,  247,  311,  269,  254,  254,  254,  254,
			  254,  254,  259,  259,  259,  259,  259,  259,  302,  307,
			  243,  232,  255,  268,  243,  260,  260,  260,  260,  260,
			  260,  990,  117,  269,  248,  264,  264,  264,  264,  264,
			  264,  261,  117,  890,  891,  256,  117,  302,  271,  249,
			  255,  117,  109,  250,  110,  251,  262,  262,  262,  262,
			  262,  262,  263,  266,  275,  276,  109,  117,  110,  261,
			  262,  262,  262,  262,  262,  262,  271,  117,  117,  117,
			  117,  117,  988,  273,  278,  279,  117,  283,  561,  274,

			  117,  266,  275,  276,  136,  112,  562,  284, 1013,  281,
			  117,  282,  363,  117,  303,  301,  117,  136,  300,  112,
			  136,  273,  278,  279,  286,  283,  117,  274,  298,  117,
			  312,  287,  299,  138,  290,  284,  138,  281,  116,  282,
			  288,  363,  289,  301,  313,  311,  300,  290,  312,  141,
			  290,  240,  286,  303,  240,  117,  298,  646,  312,  287,
			  299,  138,  313,  295,  138,  986,  296,  319,  319,  288,
			  321,  289,  313,  316,  223,  322,  317,  136,  141,  136,
			  291,  291,  291,  291,  291,  291,  117,  321,  117,  304,
			  318,  295,  322,  138,  296,  319,  320,  325,  321,  292, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  139,  325,  293,  322,  305,  331,  326,  290,  294,  141,
			  224,  225,  327,  326,  332,  323,  331,  332,  336,  327,
			  324,  138,  337,  242,  494,  325,  242,  292,  139,  328,
			  293,  336,  337,  331,  326,  343,  294,  343,  141, 1013,
			  327,  329,  332,  345,  333,  334,  336,  330,  560,  561,
			  337,  339,  340,  340,  340,  340,  340,  562,  985,  341,
			  342,  372,  213,  343,  252,  344,  252,  252,  345,  347,
			  348,  345,  347,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  346,  347,  348,  348,

			  349,  351,  352,  351,  352,  355,  357,  355,  357,  356,
			  361,  356,  361,  363,  213,  230,  227,  213,  374,  231,
			  213,  450,  231,  381,  380,  496,  381,  350,  496,  351,
			  352,  353,  354,  355,  357,  358,  360,  356,  361,  359,
			  362,  975,  364,  365,  366,  367,  368,  369,  617,  450,
			  117,  224,  225,  228,  229,  228,  229,  376,  377,  377,
			  377,  377,  377,  413,  239,  239,  117,  239,  239,  391,
			  391,  391,  391,  391,  391,  232,  240,  240,  385,  386,
			  386,  386,  386,  386,  386,  255,  411,  242,  242,  112,
			  972,  413,  217,  217,  217,  370,  370,  370,  371,  371, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  371,  394,  394,  394,  394,  394,  394,  603,  256,  382,
			  380,  960,  382,  255,  411,  604,  959,  243,  243,  378,
			  379,  380,  378,  379,  378,  378,  378,  378,  378,  378,
			  378,  378,  381,  241,  241,  378,  241,  241,  241,  241,
			  241,  241,  378,  382,  378,  378,  378,  378,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  378,  378,  383,  378,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  378,

			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  392,  117,  392,  893,  894,  393,  393,  393,  393,
			  393,  393,  397,  397,  397,  397,  397,  397,  398,  398,
			  398,  398,  398,  398,  404,  404,  404,  404,  404,  117,
			  401,  957,  401,  416,  399,  402,  402,  402,  402,  402,
			  402,  109,  418,  110,  117,  403,  403,  403,  403,  403,
			  403,  405,  405,  405,  405,  405,  405,  400,  117,  117,
			  408,  117,  399,  117,  117,  117,  407,  117,  410,  417,
			  418,  412,  117,  117,  117,  409,  117,  419,  421,  117,
			  417,  117,  136,  303,  112,  414,  420,  415,  408,  423, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  417,  117,  720,  451,  407,  422,  410,  117,  541,  412,
			  721,  492,  117,  409,  956,  419,  421,  437,  417,  117,
			  618,  294,  432,  414,  420,  415,  952,  423,  951,  447,
			  435,  451,  868,  422,  425,  425,  425,  425,  425,  425,
			  492,  157,  117,  426,  426,  426,  426,  426,  426,  294,
			  432,  117,  427,  427,  427,  427,  427,  427,  435,  428,
			  117,  428, 1013,  424,  116,  116,  116,  116,  116,  116,
			  136,  117,  424,  939,  869,  117,  117,  448,  117,  117,
			  492,  424,  429,  434,  450,  430,  451,  456,  456,  458,
			  436,  431,  459,  293,  458,  459,  462,  463,  464,  294,

			  462,  438,  440,  441,  441,  441,  441,  441,  303,  493,
			  429,  434,  454,  430,  455,  456,  457,  458,  436,  431,
			  459,  293,  460,  461,  462,  463,  464,  294,  465,  463,
			  438,  442,  443,  443,  443,  443,  443,  303,  444,  445,
			  446,  446,  446,  446,  303,  464,  468,  468,  310,  471,
			  472,  473,  471,  213,  472,  477,  477,  466,  479,  474,
			  417,  340,  340,  340,  340,  340,  340,  480,  479,  480,
			  483,  417,  484,  467,  468,  470,  483,  471,  472,  473,
			  475,  417,  476,  477,  478,  484,  479,  487,  488,  487,
			  488,  213,  558,  213,  776,  480,  481,  482,  483,  417, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  484,  213,  777,  303,  485,  213,  117,  495,  213,  117,
			  495,  498,  117,  486,  498,  487,  488,  490,  491,  496,
			  558,  497,  495,  379,  380,  495,  379,  529,  517,  518,
			  498,  217,  217,  217,  496,  381,  497,  555,  377,  377,
			  377,  377,  377,  377,  941,  498,  382,  385,  386,  386,
			  386,  386,  386,  386,  255,  529,  517,  928,  518,  942,
			  499,  393,  393,  393,  393,  393,  393,  915,  916,  219,
			  219,  219,  220,  220,  913,  499,  383,  256,  912,  221,
			  221,  221,  255,  217,  217,  217,  217,  217,  217,  500,
			  500,  500,  500,  500,  500,  502,  502,  502,  502,  502,

			  502,  505,  505,  505,  505,  505,  505,  506,  506,  506,
			  506,  506,  506,  509,  509,  509,  509,  509,  509,  559,
			  117,  558,  567,  399,  507,  907,  507,  904,  501,  508,
			  508,  508,  508,  508,  508,  402,  402,  402,  402,  402,
			  402,  117,  550,  900,  439,  550,  400,  439,  559,  565,
			  567,  399,  510,  510,  510,  510,  510,  510,  512,  513,
			  519,  514,  514,  514,  514,  514,  514,  515,  515,  515,
			  515,  515,  515,  516,  516,  516,  516,  516,  516,  117,
			  117,  117,  117,  117,  526,  117,  117,  521,  519,  525,
			  524,  511,  520,  117,  117,  526,  117,  542,  527,  117, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  117,  559,  888,  522,  523,  526,  538,  530,  775,  567,
			  569,  570,  531,  117,  569,  521,  528,  525,  524,  532,
			  520,  549,  117,  526,  549,  536,  527,  570,  890,  891,
			  566,  522,  523,  550,  538,  530,  536,  568,  569,  570,
			  531,  117,  571,  719,  528,  862,  536,  532,  291,  291,
			  291,  291,  291,  291,  861,  572,  117,  425,  425,  425,
			  425,  425,  425,  537,  536,  117,  426,  426,  426,  426,
			  426,  426,  286,  427,  427,  427,  427,  427,  427,  533,
			  533,  533,  533,  533,  533,  855,  547,  850,  288,  602,
			  603,  537,  117,  573,  303,  287,  539,  116,  604,  574,

			  286,  534,  534,  534,  534,  534,  534,  540,  573,  117,
			  535,  535,  535,  535,  535,  535,  543,  288,  117,  543,
			  117,  573,  117,  287,  539,  548,  116,  574,  543,  609,
			  544,  543,  560,  653,  574,  540,  575,  577,  303,  545,
			  543,  562,  544,  543,  441,  441,  441,  441,  441,  441,
			  303,  545,  547,  602,  443,  443,  443,  443,  443,  443,
			  303,  549,  576,  545,  549,  577,  578,  560,  549,  546,
			  157,  549,  654,  550,  577,  551,  580,  581,  822,  582,
			  550,  546,  553,  303,  446,  446,  446,  446,  446,  446,
			  303,  548,  560,  561,  578,  563,  564,  564,  564,  564, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  564,  562,  579,  821,  580,  581,  549,  582,  580,  549,
			  581,  587,  587,  589,  552,  590,  589,  590,  550,  593,
			  551,  554,  446,  446,  446,  446,  446,  446,  303,  583,
			  584,  584,  584,  584,  584,  594,  585,  595,  586,  587,
			  588,  589,  593,  590,  591,  592,  594,  593,  596,  495,
			  117,  117,  495,  376,  599,  599,  599,  599,  599,  552,
			  614,  496,  614,  594,  117,  595,  781,  637,  655,  630,
			  597,  615,  498,  778,  598,  772,  596,  600,  600,  600,
			  600,  600,  600,  601,  601,  601,  601,  601,  601,  391,
			  391,  391,  391,  391,  391,  637,  655,  630,  771,  616,

			  602,  603,  499,  605,  606,  606,  606,  606,  606,  604,
			  607,  607,  607,  607,  607,  607,  501,  508,  508,  508,
			  508,  508,  508,  117,  655,  973,  399,  608,  608,  608,
			  608,  608,  608,  610,  610,  610,  610,  610,  610,  611,
			  611,  611,  611,  611,  611,  117,  657,  117,  545,  400,
			  117,  545,  656,  117,  399,  612,  612,  612,  612,  612,
			  612,  619,  620,  625,  654,  117,  609,  607,  607,  607,
			  607,  607,  607,  627,  657,  893,  894,  513,  511,  514,
			  514,  514,  514,  514,  514,  117,  117,  117,  658,  619,
			  620,  625,  621,  622,  117,  623,  117,  117,  117,  657, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  117,  627,  629,  628,  641,  631,  634,  624,  533,  533,
			  533,  533,  533,  533,  925,  926,  658,  633,  117,  636,
			  621,  622,  778,  623,  117,  778,  117,  659,  633,  117,
			  629,  628,  635,  631,  634,  624,  632,  428,  633,  428,
			  117,  534,  534,  534,  534,  534,  534,  636,  658,  117,
			  535,  535,  535,  535,  535,  535,  633,  638,  661,  662,
			  635,  661,  667,  430,  632,  668,  669,  668,  638,  431,
			  669,  663,  116,  915,  916,  542,  660,  944,  639,  440,
			  640,  640,  640,  640,  640,  303,  661,  662,  758,  664,
			  667,  430,  945,  668,  669,  670,  638,  431,  671,  663,

			  116,  442,  642,  642,  642,  642,  642,  303,  444,  644,
			  644,  644,  644,  644,  303,  444,  645,  644,  644,  644,
			  644,  303,  560,  653,  662,  564,  564,  564,  564,  564,
			  564,  562,  672,  672,  875,  474,  663,  584,  584,  584,
			  584,  584,  584,  674,  675,  674,  675,  678,  679,  680,
			  681,  678,  665,  679,  684,  684,  684,  684,  684,  684,
			  672,  673,  654,  875,  666,  692,  692,  692,  692,  692,
			  692,  674,  675,  676,  677,  678,  679,  680,  681,  682,
			  495,  683,  117,  495,  602,  688,  607,  607,  607,  607,
			  607,  607,  496,  604,  497,  703,  599,  599,  599,  599, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  599,  599,  690,  498,  602,  688,  257,  606,  606,  606,
			  606,  606,  606,  604,  691,  691,  691,  691,  691,  691,
			  881,  881,  881,  703,  689,  697,  697,  697,  697,  697,
			  690,  750,  117,  499,  693,  693,  693,  693,  693,  693,
			  925,  926,  157,  117,  689,  694,  694,  694,  694,  694,
			  694,  701,  705,  609,  695,  695,  695,  695,  695,  695,
			  696,  696,  696,  696,  696,  696,  698,  698,  698,  698,
			  698,  698,  117,  117,  117,  704,  699,  700,  117,  701,
			  705,  117,  261,  117,  117,  724,  706,  117,  117,  702,
			  725,  708,  704,  117,  709,  713,  704,  714,  729,  712,

			  715,  707,  976,  711,  699,  700,  719,  720,  714,  729,
			  261,  715,  731,  724,  706,  721,  653,  702,  715,  708,
			  704,  715,  709,  713,  562,  718,  729,  712,  969,  707,
			  543,  711,  716,  543,  117,  732,  714,  730,  731,  715,
			  731,  689, 1000,  970,  544,  710,  640,  640,  640,  640,
			  640,  640,  303,  545,  547,  654,  642,  642,  642,  642,
			  642,  642,  303,  732,  732,  117,  733,  117,  549,  719,
			  720,  549,  722,  723,  723,  723,  723,  723,  721,  117,
			  550,  783,  551,  546,  644,  644,  644,  644,  644,  644,
			  303,  549,  734,  548,  549,  727,  728,  728,  728,  728, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  728,  735,  736,  550,  737,  553,  736,  644,  644,  644,
			  644,  644,  644,  303,  737,  740,  982,  740,  742,  743,
			  742,  552,  743,  746,  747,  748,  746,  511,  687,  735,
			  736,  983,  737,  501,  738,  600,  600,  600,  600,  600,
			  600,  474,  739,  740,  554,  741,  742,  743,  744,  649,
			  745,  746,  747,  748,  749,  752,  753,  753,  753,  753,
			  753,  754,  757,  754,  652,  649,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  756,  756,
			  756,  756,  756,  756,  648,  400,  802,  802,  802,  802,
			  757,  611,  611,  611,  611,  611,  611,  759,  759,  759,

			  759,  759,  759,  760,  760,  760,  760,  760,  760,  117,
			  117,  609,  761,  761,  761,  761,  761,  761,  117,  765,
			  117,  767,  763,  117,  764,  117,  117,  784,  757,  762,
			  787,  768,  787,  770,  117,  766,  765,  769,  767,  626,
			  765,  789,  767,  773,  774,  774,  774,  774,  774,  117,
			  763,  400,  764,  775,  776,  784,  757,  762,  787,  768,
			  788,  770,  777,  766,  765,  769,  767,  719,  782,  789,
			  789,  791,  791,  793,  719,  782,  721,  723,  723,  723,
			  723,  723,  723,  721,  653,  794,  728,  728,  728,  728,
			  728,  728,  562,  795,  793,  688,  875,  117,  790,  791, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  792,  793,  117,  604,  109,  810,  541,  783,  541,  804,
			  805,  804,  805,  794,  783,  755,  755,  755,  755,  755,
			  755,  795,  796,  654,  688,  876,  753,  753,  753,  753,
			  753,  753,  604,  810,  689,  755,  755,  755,  755,  755,
			  755,  799,  799,  799,  799,  799,  799,  800,  806,  800,
			  117,  826,  801,  801,  801,  801,  801,  801,  993,  994,
			  993,  994,  809,  689,  803,  803,  803,  803,  803,  803,
			  807,  807,  807,  807,  807,  807,  117,  117,  812,  826,
			  117,  117,  808,  811,  815,  557,  757,  813,  815,  814,
			  809,  828,  816,  828,  830,  812,  816,  995,  830,  812,

			  921,  921,  921,  921,  921,  815, 1005,  117,  117,  400,
			  808,  811,  832,  816,  757,  813,  815,  814,  832,  828,
			  834,  829,  830,  812,  816,  817,  831,  774,  774,  774,
			  774,  774,  774,  824,  825,  825,  825,  825,  825,  835,
			  832,  834,  117,  117,  406,  968,  833,  504,  834,  801,
			  801,  801,  801,  801,  801,  838,  838,  838,  838,  838,
			  838,  380,  380,  373,  818,  489,  489,  835,  474,  836,
			  839,  839,  839,  839,  839,  839,  616,  616,  616,  616,
			  616,  616,  840,  840,  840,  840,  840,  840,  841,  841,
			  841,  841,  841,  841,  609,  842,  842,  842,  842,  842, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  842,  117,  117,  117,  847,  117,  848,  854,  847,  856,
			  848,  757,  843,  845,  773,  849,  849,  849,  849,  849,
			  782,  469,  469,  844,  846,  847,  856,  848,  721,  858,
			  858,  453,  860,  449,  400,  854,  847,  856,  848,  757,
			  843,  845,  782,  439,  825,  825,  825,  825,  825,  825,
			  721,  844,  846,  117,  857,  117,  117,  858,  859,  783,
			  860,  799,  799,  799,  799,  799,  799,  863,  863,  863,
			  863,  863,  863,  117,  117,  866,  873,  804,  865,  804,
			  117,  783,  841,  841,  841,  841,  841,  841,  842,  842,
			  842,  842,  842,  842,  117,  877,  877,  879,  867,  117,

			  609,  883,  864,  866,  873,  902,  817,  865,  849,  849,
			  849,  849,  849,  849,  117,  889,  806,  882,  882,  882,
			  882,  882,  882,  877,  878,  885,  879,  867,  886,  883,
			  864,  884,  892,  885,  902,  905,  886,  895,  895,  895,
			  895,  895,  895,  889,  117,  818,  885,  917,  117,  886,
			  806,  806,  806,  806,  806,  806,  897,  898,  899,  884,
			  892,  885,  406,  905,  886,  898,  899,  929,  117,  896,
			  908,  396,  908, 1013,  117,  917,  390,  389,  898,  899,
			  388,  909,  922,  387,  897,  911,  918,  918,  918,  918,
			  918,  918,  384,  898,  899,  929,  238,  375,  896,  919, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  919,  919,  919,  919,  919,  233,  235,  372,  373,  910,
			  922,  923,  924,  911,  920,  920,  920,  920,  920,  920,
			  372,  213,  923,  924,  934,  934,  934,  934,  934,  934,
			  338,  338,  923,  924,  930,  931,  335,  918,  918,  918,
			  918,  918,  918,  935,  935,  935,  935,  935,  935,  277,
			  923,  924,  932,  933,  936,  919,  919,  919,  919,  919,
			  919,  937,  948,  315,  948,  936,  940,  940,  940,  940,
			  940,  940,  937,  949,  654,  936,  943,  943,  943,  943,
			  943,  943,  937,  946,  946,  946,  946,  946,  946,  310,
			  308,  154,  689,  936,  947,  947,  947,  947,  947,  947,

			  937,  950,  953,  953,  953,  953,  953,  953,  954,  955,
			  303,  940,  940,  940,  940,  940,  940,  930,  958,  285,
			  943,  943,  943,  943,  943,  943,  932,  961,  117,  946,
			  946,  946,  946,  946,  946,  910,  910,  910,  910,  910,
			  910,  962,  962,  962,  962,  962,  962,  964,  783,  963,
			  963,  963,  963,  963,  965,  966,  967,  654,  953,  953,
			  953,  953,  953,  953,  964,  253,  689,  252,  964,  245,
			  100,  965,   97,  980,  238,  965,  971,  971,  971,  971,
			  971,  971,  974,  974,  974,  974,  974,  974,  235,  234,
			  980,  233,  964,  213,  980,  968,  211,  154,  117,  965, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  977,  977,  977,  977,  977,  977,  978,  978,  978,  978,
			  978,  978,  979,  979,  979,  979,  979,  979,  980,  981,
			  984,  984,  984,  984,  984,  984,  954,  987,  115,  971,
			  971,  971,  971,  971,  971,  114,  981,  107,  104,  100,
			  981,  989,  989,  989,  989,  989,  989,  930,   98,   97,
			  974,  974,  974,  974,  974,  974,  991,  991,  991,  991,
			  991,  991, 1013, 1013,  981,  932,  783, 1013,  977,  977,
			  977,  977,  977,  977,  992,  992,  992,  992,  992,  992,
			 1013, 1013, 1013, 1013, 1013,  966,  998,  654,  984,  984,
			  984,  984,  984,  984, 1001, 1001, 1001, 1001, 1001, 1001,

			 1013, 1013, 1013, 1013, 1013,  689,  989,  989,  989,  989,
			  989,  989,  991,  991,  991,  991,  991,  991,  950,  950,
			  950,  950,  950,  950, 1013,  968, 1002, 1002, 1002, 1002,
			 1002, 1002, 1003, 1003, 1003, 1003, 1003, 1003, 1013, 1013,
			 1013, 1013, 1013,  654, 1013, 1013, 1013, 1013, 1013,  689,
			 1006, 1006, 1006, 1006, 1006, 1006, 1008, 1008, 1008, 1008,
			 1008, 1008,  954, 1013, 1013, 1001, 1001, 1001, 1001, 1001,
			 1001, 1009, 1009, 1009, 1009, 1009, 1009,  993, 1013,  993,
			 1013, 1013, 1003, 1003, 1003, 1003, 1003, 1003, 1011, 1011,
			 1011, 1011, 1011, 1011, 1008, 1008, 1008, 1008, 1008, 1008, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  966, 1013,  783, 1006, 1006, 1006, 1006, 1006, 1006, 1012,
			 1012, 1012, 1012, 1012, 1012, 1013,  995, 1011, 1011, 1011,
			 1011, 1011, 1011,  995,  995,  995,  995,  995,  995,  108,
			 1013,  783, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			  968,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			 1013, 1013, 1013, 1013,  968,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   99,   99, 1013,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99, 1013,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,  101,  101, 1013,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  101,  101,  101,  101,  101,  116,  116,  116,  116, 1013,
			  116,  116,  116,  116, 1013, 1013,  116,  116,  116,  116,
			  116,  116,  116,  116,  116,  149,  149, 1013,  149, 1013,
			  149,  149,  149, 1013, 1013,  149,  149,  149,  149, 1013,
			 1013,  149,  149,  149,  149,  149,  149,  149,  149,  149,
			  153,  153, 1013,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  212,  212, 1013,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,

			 1013,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  237, 1013,  237, 1013, 1013, 1013, 1013,  237, 1013,  237,
			  237,  237, 1013, 1013,  237,  237,  237,  237, 1013, 1013,
			  237,  237,  237,  237,  237,  237,  237,  237,  237,  244, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  244, 1013,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  108,
			  108,  108,  108, 1013, 1013,  108,  108,  108,  108,  108,
			 1013,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  265, 1013, 1013,  265,  265,  265,  265,  265,  265,  265,
			  265,  265, 1013, 1013,  265,  265,  265,  265,  265,  265,

			  265,  265,  265,  309,  309,  309,  309,  309,  309,  309,
			  309,  309,  314,  314,  314,  314, 1013, 1013,  314,  314,
			  314,  314,  314,  314,  314,  314,  314,  224,  224,  224,
			  224,  224,  224,  224,  224,  224, 1013,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  395,  395,  395,
			  395, 1013, 1013,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  309,  309,  309,  309, 1013, 1013,  309,  309,
			  309,  309,  309, 1013,  309,  309,  309,  309,  309,  309,
			  309,  309,  309,  452,  452,  452, 1013, 1013,  452,  452,
			  452,  452, 1013, 1013,  452,  452,  452,  452,  452,  452,
			  452,  452,  452,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,

			  378,  378,  378,  503,  503,  503, 1013, 1013,  503,  503,
			  503,  503, 1013, 1013,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  556,  556,  556,  556, 1013, 1013,  556,
			  556,  556,  556,  556,  556,  556,  556,  556,  449,  449,
			  449, 1013, 1013,  449,  449,  449,  449,  449,  449,  449,
			  449, 1013, 1013,  449,  449,  449,  449, 1013, 1013,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  643, 1013,
			  643, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013,  643,  643,  643,  643, 1013, 1013,  643,  643,
			  643,  643,  643,  643,  643,  643,  643,  647,  647,  647, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1013, 1013,  647,  647,  647,  647, 1013, 1013,  647,  647,
			  647,  647,  647,  647,  647,  647,  647,  650,  650,  650,
			 1013, 1013,  650,  650,  650,  650, 1013, 1013,  650,  650,
			  650,  650,  650,  650,  650,  650,  650,  651,  651,  651,
			 1013, 1013,  651,  651,  651,  651, 1013, 1013,  651,  651,
			  651,  651,  651,  651,  651,  651,  651,  685,  685,  685,
			 1013, 1013,  685,  685,  685,  685, 1013, 1013,  685,  685,
			  685,  685,  685,  685,  685,  685,  685,  686,  686,  686,
			 1013, 1013,  686,  686,  686,  686, 1013, 1013,  686,  686,
			  686,  686,  686,  686,  686,  686,  686,  717,  717,  717,

			 1013, 1013,  717,  717,  717,  717, 1013, 1013,  717,  717,
			  717,  717,  717,  717,  717,  717,  717,  726,  726,  726,
			  726, 1013, 1013,  726,  726,  726,  726,  726,  726,  726,
			  726,  726,  751,  751,  751,  751, 1013, 1013,  751,  751,
			  751,  751,  751,  751,  751,  751,  751,  779,  779,  779,
			 1013, 1013,  779,  779,  779,  779, 1013, 1013,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  780,  780,  780,
			 1013, 1013,  780,  780,  780,  780, 1013, 1013,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  785,  785,  785,
			  785, 1013, 1013,  785,  785,  785,  785,  785,  785,  785, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  785,  785,  786,  786,  786, 1013, 1013,  786,  786,  786,
			  786, 1013, 1013,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  797,  797,  797,  797, 1013, 1013,  797,  797,
			  797,  797,  797,  797,  797,  797,  797,  798,  798,  798,
			 1013, 1013,  798,  798,  798,  798, 1013, 1013,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  819,  819,  819,
			 1013, 1013,  819,  819,  819,  819, 1013, 1013,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  820,  820,  820,
			 1013, 1013,  820,  820,  820,  820, 1013, 1013,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  823,  823,  823,

			  823, 1013, 1013,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  827,  827,  827, 1013, 1013,  827,  827,  827,
			  827, 1013, 1013,  827,  827,  827,  827,  827,  827,  827,
			  827,  827,  837,  837,  837, 1013, 1013,  837,  837,  837,
			  837, 1013, 1013,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  851,  851,  851,  851, 1013, 1013,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  852,  852,  852,
			  852, 1013, 1013,  852,  852,  852,  852,  852,  852,  852,
			  852,  852,  853,  853,  853, 1013, 1013,  853,  853,  853,
			  853, 1013, 1013,  853,  853,  853,  853,  853,  853,  853, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_nxt_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  853,  853,  870,  870,  870,  870, 1013, 1013,  870,  870,
			  870,  870,  870,  870,  870,  870,  870,  871,  871,  871,
			 1013, 1013,  871,  871,  871,  871, 1013, 1013,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  872,  872,  872,
			 1013, 1013,  872,  872,  872,  872, 1013, 1013,  872,  872,
			  872,  872,  872,  872,  872,  872,  872,  874,  874,  874,
			 1013, 1013,  874,  874,  874,  874, 1013, 1013,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  880,  880,  880,
			 1013, 1013,  880,  880,  880,  880, 1013, 1013,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  887,  887,  887,

			 1013, 1013,  887,  887,  887,  887, 1013, 1013,  887,  887,
			  887,  887,  887,  887,  887,  887,  887,  901,  901,  901,
			 1013, 1013,  901,  901,  901,  901, 1013, 1013,  901,  901,
			  901,  901,  901,  901,  901,  901,  901,  903,  903,  903,
			 1013, 1013,  903,  903,  903,  903, 1013, 1013,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  906,  906,  906,
			 1013, 1013,  906,  906,  906,  906, 1013, 1013,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  914,  914,  914,
			 1013, 1013,  914,  914,  914,  914, 1013, 1013,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  927,  927,  927, yy_Dummy>>,
			1, 200, 4600)
		end

	yy_nxt_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1013, 1013,  927,  927,  927,  927, 1013, 1013,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  938,  938,  938,
			 1013, 1013,  938,  938,  938,  938, 1013, 1013,  938,  938,
			  938,  938,  938,  938,  938,  938,  938,   11, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,

			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, yy_Dummy>>,
			1, 130, 4800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4929)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			yy_chk_template_11 (an_array)
			yy_chk_template_12 (an_array)
			yy_chk_template_13 (an_array)
			yy_chk_template_14 (an_array)
			yy_chk_template_15 (an_array)
			yy_chk_template_16 (an_array)
			yy_chk_template_17 (an_array)
			yy_chk_template_18 (an_array)
			yy_chk_template_19 (an_array)
			yy_chk_template_20 (an_array)
			yy_chk_template_21 (an_array)
			yy_chk_template_22 (an_array)
			yy_chk_template_23 (an_array)
			yy_chk_template_24 (an_array)
			yy_chk_template_25 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
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
			    1,    1,    1,    3,    5,   18,    6,    3,    4,   41,

			    7,    7,    4,    7,    8,    8,   13,    8,   13,   13,
			   41,   37,   50,    7,   76,   37,   25,    8,   25,   25,
			   25,   25,   25,   25,   37,   43,   35,   48,   36,   43,
			    5,    5,    6,    6,   60,   35,   36,   50,   41,   35,
			   18,   35,   48,   37,    3,   51,   60,   48,   61,    4,
			  294,  286,   37,   51,   51,   92,    7,   43,   92,  294,
			    8,   76,   60,   35,   36,  236,   50,   35,  236,   35,
			   48,  128,  286,  128,   60,   48,   61, 1010,    3,    3,
			    3,    3,    3,    4,    4,    4,    4,    4,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			   27, 1007,   27,  151,   27,   27,   27,   27,   27,   27,
			   28,   39,   28,   42,   28,   28,   28,   28,   28,   28,

			   47,   44,   40,   45,   39,   49,   40,   42,   42,   45,
			   63,   47,   64,   42,   68,   39, 1004,   44,   40,   47,
			  151,   49,   45,   27,   74,   78,   74,   74,   96,   80,
			   96,   96,   39,   28,   40,   42,   42,   45,   63,   47,
			   64,   42,   68,  999,   39,   44,   40,   47,   69,   49,
			   45,   46,   46,   46,   46,   46,   46,   46,   56,   56,
			   46,   57,   77,   56,   59,   56,   57,   46,   67,   65,
			   57,   66,   57,   67,   46,   59,  296,   69,  296,   66,
			   82,   46,   65,   46,   84,   46,   56,   56,  108,   57,
			   85,   56,   59,   56,   57,   46,   67,   65,   57,   66, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   57,   67,   46,  155,   59,   78,  155,   66,   80,   80,
			   65,  155,   46,  996,   46,   55,   82,   82,   55,  124,
			   79,   84,   84,   55,  108,   81,   85,   85,  366,  773,
			   55,   55,   55,   55,   55,   55,   55,   55,  131,  124,
			   77,   77,   77,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  124,  773,  131,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   58,  990,  144,   58,   79,   79,

			   79,  122,   58,   81,   81,   81,  119,  988,  366,   58,
			   58,   58,   58,   58,   58,   58,   58,  218,  144,  119,
			  122,  985,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,  144,  119,  122,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   62,   62,   87,  983,   94,   87,   62,
			   94,   95,  982,  152,   95,  214,  160,  214,  214,   94,
			   94,  512,  512,   95,   62,  218,  218,  218,  120,  103, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   94,   62,   62,  148,   95,  120,  121,   62,  103,  103,
			  103,  103,  103,  103,  160,  121,  106,  106,  106,  106,
			  106,  106,  109,  109,  109,  109,  109,  109,  148,  152,
			   94,   87,  106,  120,   95,  110,  110,  110,  110,  110,
			  110,  975,  123,  121,  103,  112,  112,  112,  112,  112,
			  112,  110,  118,  874,  874,  106,  127,  148,  123,  103,
			  106,  126,  111,  103,  111,  103,  111,  111,  111,  111,
			  111,  111,  111,  118,  126,  127,  113,  129,  113,  110,
			  113,  113,  113,  113,  113,  113,  123,  125,  132,  130,
			  133,  134,  972,  125,  129,  130,  147,  134,  651,  125,

			  135,  118,  126,  127,  138,  111,  651,  135,  137,  132,
			  146,  133,  209,  138,  555,  147,  145,  139,  146,  113,
			  141,  125,  129,  130,  137,  134,  139,  125,  145,  141,
			  161,  137,  145,  139,  138,  135,  141,  132,  137,  133,
			  137,  209,  137,  147,  162,  165,  146,  139,  166,  139,
			  141,  240,  137,  150,  240,  143,  145,  555,  161,  137,
			  145,  139,  167,  143,  141,  970,  143,  168,  169,  137,
			  170,  137,  162,  165,  222,  171,  166,  142,  139,  140,
			  140,  140,  140,  140,  140,  140,  142,  172,  140,  150,
			  167,  143,  173,  142,  143,  168,  169,  174,  170,  140, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  142,  176,  140,  171,  150,  178,  175,  142,  140,  142,
			  222,  222,  175,  177,  179,  172,  180,  181,  184,  177,
			  173,  142,  185,  242,  372,  174,  242,  140,  142,  176,
			  140,  188,  189,  178,  175,  191,  140,  192,  142,  158,
			  175,  177,  179,  193,  180,  181,  184,  177,  452,  452,
			  185,  187,  187,  187,  187,  187,  187,  452,  969,  188,
			  189,  372,  217,  191,  252,  192,  252,  252,  194,  195,
			  196,  193,  197,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  194,  195,  196,  198,

			  197,  199,  200,  201,  202,  203,  204,  205,  206,  203,
			  207,  205,  208,  210,  219,  225,  226,  220,  228,  231,
			  221,  311,  231,  381,  381,  496,  381,  198,  496,  199,
			  200,  201,  202,  203,  204,  205,  206,  203,  207,  205,
			  208,  959,  210,  217,  217,  217,  217,  217,  516,  311,
			  273,  225,  225,  226,  226,  228,  228,  235,  235,  235,
			  235,  235,  235,  273,  237,  239,  271,  237,  239,  254,
			  254,  254,  254,  254,  254,  231,  237,  239,  247,  247,
			  247,  247,  247,  247,  247,  254,  271,  237,  239,  516,
			  956,  273,  219,  219,  219,  220,  220,  220,  221,  221, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  221,  256,  256,  256,  256,  256,  256,  686,  254,  382,
			  382,  945,  382,  254,  271,  686,  944,  237,  239,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,

			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  255,  276,  255,  880,  880,  255,  255,  255,  255,
			  255,  255,  259,  259,  259,  259,  259,  259,  260,  260,
			  260,  260,  260,  260,  263,  263,  263,  263,  263,  278,
			  261,  942,  261,  276,  260,  261,  261,  261,  261,  261,
			  261,  262,  278,  262,  267,  262,  262,  262,  262,  262,
			  262,  264,  264,  264,  264,  264,  264,  260,  266,  269,
			  267,  270,  260,  272,  279,  274,  266,  275,  270,  277,
			  278,  272,  281,  283,  280,  269,  300,  279,  281,  518,
			  277,  284,  293,  307,  262,  274,  280,  275,  267,  284, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  277,  293,  780,  312,  266,  283,  270,  295,  438,  272,
			  780,  363,  298,  269,  941,  279,  281,  300,  277,  438,
			  518,  293,  295,  274,  280,  275,  937,  284,  936,  307,
			  298,  312,  847,  283,  287,  287,  287,  287,  287,  287,
			  363,  309,  287,  288,  288,  288,  288,  288,  288,  293,
			  295,  288,  289,  289,  289,  289,  289,  289,  298,  291,
			  289,  291,  291,  287,  290,  290,  290,  290,  290,  290,
			  292,  299,  288,  926,  847,  297,  302,  309,  922,  292,
			  364,  289,  291,  297,  316,  291,  317,  319,  320,  321,
			  299,  291,  322,  292,  323,  324,  325,  326,  327,  292,

			  328,  302,  304,  304,  304,  304,  304,  304,  304,  364,
			  291,  297,  316,  291,  317,  319,  320,  321,  299,  291,
			  322,  292,  323,  324,  325,  326,  327,  292,  328,  329,
			  302,  305,  305,  305,  305,  305,  305,  305,  306,  306,
			  306,  306,  306,  306,  306,  330,  331,  333,  335,  336,
			  337,  338,  341,  365,  342,  343,  344,  329,  347,  340,
			  335,  340,  340,  340,  340,  340,  340,  348,  349,  350,
			  351,  335,  352,  330,  331,  333,  353,  336,  337,  338,
			  341,  335,  342,  343,  344,  354,  347,  355,  356,  358,
			  359,  367,  450,  368,  820,  348,  349,  350,  351,  335, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  352,  369,  820,  447,  353,  370,  408,  376,  371,  407,
			  376,  498,  420,  354,  498,  355,  356,  358,  359,  376,
			  450,  376,  377,  379,  379,  377,  379,  420,  407,  408,
			  376,  365,  365,  365,  377,  379,  377,  447,  377,  377,
			  377,  377,  377,  377,  930,  377,  379,  386,  386,  386,
			  386,  386,  386,  386,  391,  420,  407,  916,  408,  930,
			  376,  392,  392,  392,  392,  392,  392,  901,  901,  367,
			  367,  367,  368,  368,  899,  377,  379,  391,  898,  369,
			  369,  369,  391,  370,  370,  370,  371,  371,  371,  393,
			  393,  393,  393,  393,  393,  394,  394,  394,  394,  394,

			  394,  397,  397,  397,  397,  397,  397,  398,  398,  398,
			  398,  398,  398,  400,  400,  400,  400,  400,  400,  451,
			  897,  454,  456,  398,  399,  894,  399,  891,  393,  399,
			  399,  399,  399,  399,  399,  401,  401,  401,  401,  401,
			  401,  409,  550,  887,  439,  550,  398,  439,  451,  454,
			  456,  398,  402,  402,  402,  402,  402,  402,  403,  403,
			  409,  403,  403,  403,  403,  403,  403,  404,  404,  404,
			  404,  404,  404,  405,  405,  405,  405,  405,  405,  411,
			  410,  413,  415,  414,  417,  416,  418,  411,  409,  416,
			  415,  402,  410,  422,  419,  417,  421,  439,  418,  436, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  423,  455,  872,  413,  414,  417,  436,  421,  871,  457,
			  458,  459,  422,  866,  460,  411,  419,  416,  415,  423,
			  410,  549,  865,  417,  549,  433,  418,  461,  903,  903,
			  455,  413,  414,  549,  436,  421,  433,  457,  458,  459,
			  422,  435,  460,  853,  419,  839,  433,  423,  424,  424,
			  424,  424,  424,  424,  837,  461,  424,  425,  425,  425,
			  425,  425,  425,  435,  433,  425,  426,  426,  426,  426,
			  426,  426,  425,  427,  427,  427,  427,  427,  427,  428,
			  428,  428,  428,  428,  428,  827,  442,  819,  425,  503,
			  503,  435,  437,  463,  442,  427,  437,  426,  503,  464,

			  425,  429,  429,  429,  429,  429,  429,  437,  466,  429,
			  430,  430,  430,  430,  430,  430,  440,  425,  430,  440,
			  813,  463,  810,  427,  437,  442,  426,  464,  441,  799,
			  440,  441,  563,  563,  467,  437,  466,  468,  440,  440,
			  543,  563,  441,  543,  441,  441,  441,  441,  441,  441,
			  441,  441,  443,  798,  443,  443,  443,  443,  443,  443,
			  443,  444,  467,  543,  444,  468,  469,  786,  445,  440,
			  783,  445,  563,  444,  470,  444,  471,  472,  779,  473,
			  445,  441,  445,  444,  445,  445,  445,  445,  445,  445,
			  445,  443,  453,  453,  469,  453,  453,  453,  453,  453, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  453,  453,  470,  777,  471,  472,  446,  473,  475,  446,
			  476,  477,  478,  479,  444,  480,  481,  482,  446,  487,
			  446,  445,  446,  446,  446,  446,  446,  446,  446,  474,
			  474,  474,  474,  474,  474,  488,  475,  489,  476,  477,
			  478,  479,  490,  480,  481,  482,  491,  487,  489,  495,
			  531,  540,  495,  497,  497,  497,  497,  497,  497,  446,
			  515,  495,  515,  488,  770,  489,  721,  540,  567,  531,
			  490,  515,  495,  718,  491,  715,  489,  500,  500,  500,
			  500,  500,  500,  501,  501,  501,  501,  501,  501,  502,
			  502,  502,  502,  502,  502,  540,  567,  531,  714,  515,

			  504,  504,  495,  504,  504,  504,  504,  504,  504,  504,
			  506,  506,  506,  506,  506,  506,  500,  507,  507,  507,
			  507,  507,  507,  709,  568,  957,  506,  508,  508,  508,
			  508,  508,  508,  509,  509,  509,  509,  509,  509,  510,
			  510,  510,  510,  510,  510,  707,  569,  520,  545,  506,
			  525,  545,  568,  519,  506,  511,  511,  511,  511,  511,
			  511,  519,  520,  525,  957,  527,  508,  513,  513,  513,
			  513,  513,  513,  527,  569,  906,  906,  514,  510,  514,
			  514,  514,  514,  514,  514,  521,  522,  523,  570,  519,
			  520,  525,  521,  522,  530,  523,  528,  532,  537,  571, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  539,  527,  530,  528,  545,  532,  537,  523,  533,  533,
			  533,  533,  533,  533,  914,  914,  570,  536,  706,  539,
			  521,  522,  778,  523,  538,  778,  705,  571,  536,  703,
			  530,  528,  538,  532,  537,  523,  533,  534,  536,  534,
			  701,  534,  534,  534,  534,  534,  534,  539,  572,  534,
			  535,  535,  535,  535,  535,  535,  536,  541,  573,  574,
			  538,  575,  578,  534,  533,  580,  581,  585,  541,  534,
			  586,  574,  535,  927,  927,  778,  572,  932,  541,  544,
			  544,  544,  544,  544,  544,  544,  573,  574,  695,  575,
			  578,  534,  932,  580,  581,  585,  541,  534,  586,  574,

			  535,  547,  547,  547,  547,  547,  547,  547,  551,  551,
			  551,  551,  551,  551,  551,  553,  553,  553,  553,  553,
			  553,  553,  564,  564,  576,  564,  564,  564,  564,  564,
			  564,  564,  587,  588,  856,  584,  576,  584,  584,  584,
			  584,  584,  584,  589,  590,  591,  592,  593,  594,  595,
			  596,  597,  576,  598,  601,  601,  601,  601,  601,  601,
			  587,  588,  564,  856,  576,  609,  609,  609,  609,  609,
			  609,  589,  590,  591,  592,  593,  594,  595,  596,  597,
			  599,  598,  625,  599,  605,  605,  607,  607,  607,  607,
			  607,  607,  599,  605,  599,  625,  599,  599,  599,  599, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  599,  599,  607,  599,  606,  606,  689,  606,  606,  606,
			  606,  606,  606,  606,  608,  608,  608,  608,  608,  608,
			  862,  862,  862,  625,  605,  615,  615,  615,  615,  615,
			  607,  685,  627,  599,  610,  610,  610,  610,  610,  610,
			  938,  938,  654,  622,  606,  612,  612,  612,  612,  612,
			  612,  622,  627,  608,  613,  613,  613,  613,  613,  613,
			  614,  614,  614,  614,  614,  614,  617,  617,  617,  617,
			  617,  617,  618,  620,  623,  626,  618,  620,  628,  622,
			  627,  629,  617,  630,  635,  649,  628,  631,  637,  623,
			  650,  630,  626,  636,  631,  637,  626,  638,  657,  636,

			  639,  629,  960,  635,  618,  620,  647,  647,  638,  659,
			  617,  639,  661,  649,  628,  647,  727,  623,  638,  630,
			  626,  639,  631,  637,  727,  646,  657,  636,  954,  629,
			  640,  635,  641,  640,  634,  662,  638,  659,  664,  639,
			  661,  960,  986,  954,  640,  633,  640,  640,  640,  640,
			  640,  640,  640,  640,  642,  727,  642,  642,  642,  642,
			  642,  642,  642,  662,  665,  624,  664,  621,  644,  648,
			  648,  644,  648,  648,  648,  648,  648,  648,  648,  619,
			  644,  986,  644,  640,  644,  644,  644,  644,  644,  644,
			  644,  645,  665,  642,  645,  653,  653,  653,  653,  653, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  653,  667,  668,  645,  669,  645,  670,  645,  645,  645,
			  645,  645,  645,  645,  671,  672,  966,  673,  674,  675,
			  676,  644,  677,  679,  680,  681,  683,  611,  604,  667,
			  668,  966,  669,  600,  670,  684,  684,  684,  684,  684,
			  684,  583,  671,  672,  645,  673,  674,  675,  676,  566,
			  677,  679,  680,  681,  683,  688,  688,  688,  688,  688,
			  688,  690,  693,  690,  562,  559,  690,  690,  690,  690,
			  690,  690,  691,  691,  691,  691,  691,  691,  692,  692,
			  692,  692,  692,  692,  557,  693,  758,  758,  758,  758,
			  693,  694,  694,  694,  694,  694,  694,  696,  696,  696,

			  696,  696,  696,  697,  697,  697,  697,  697,  697,  700,
			  699,  691,  698,  698,  698,  698,  698,  698,  702,  704,
			  708,  710,  700,  711,  702,  713,  712,  724,  698,  699,
			  729,  711,  730,  713,  529,  708,  704,  712,  710,  526,
			  704,  732,  710,  716,  716,  716,  716,  716,  716,  524,
			  700,  698,  702,  717,  717,  724,  698,  699,  729,  711,
			  730,  713,  717,  708,  704,  712,  710,  722,  722,  732,
			  734,  742,  744,  746,  723,  723,  722,  723,  723,  723,
			  723,  723,  723,  723,  728,  747,  728,  728,  728,  728,
			  728,  728,  728,  748,  749,  752,  857,  764,  734,  742, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  744,  746,  517,  752,  505,  764,  493,  722,  492,  760,
			  760,  760,  760,  747,  723,  754,  754,  754,  754,  754,
			  754,  748,  749,  728,  753,  857,  753,  753,  753,  753,
			  753,  753,  753,  764,  752,  755,  755,  755,  755,  755,
			  755,  756,  756,  756,  756,  756,  756,  757,  760,  757,
			  763,  784,  757,  757,  757,  757,  757,  757,  979,  979,
			  979,  979,  763,  753,  759,  759,  759,  759,  759,  759,
			  761,  761,  761,  761,  761,  761,  762,  766,  767,  784,
			  768,  769,  762,  766,  771,  448,  761,  768,  771,  769,
			  763,  787,  772,  788,  789,  767,  772,  979,  790,  767,

			  909,  909,  909,  909,  909,  771,  997,  434,  432,  761,
			  762,  766,  791,  772,  761,  768,  771,  769,  792,  787,
			  793,  788,  789,  767,  772,  774,  790,  774,  774,  774,
			  774,  774,  774,  782,  782,  782,  782,  782,  782,  794,
			  791,  796,  431,  412,  406,  997,  792,  396,  793,  800,
			  800,  800,  800,  800,  800,  801,  801,  801,  801,  801,
			  801,  383,  378,  374,  774,  360,  357,  794,  339,  796,
			  802,  802,  802,  802,  802,  802,  803,  803,  803,  803,
			  803,  803,  804,  804,  804,  804,  804,  804,  805,  805,
			  805,  805,  805,  805,  801,  807,  807,  807,  807,  807, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  807,  808,  809,  814,  815,  811,  816,  826,  815,  828,
			  816,  807,  808,  811,  817,  817,  817,  817,  817,  817,
			  824,  334,  332,  809,  814,  815,  829,  816,  824,  832,
			  833,  315,  835,  310,  807,  826,  815,  828,  816,  807,
			  808,  811,  825,  303,  825,  825,  825,  825,  825,  825,
			  825,  809,  814,  844,  829,  845,  301,  832,  833,  824,
			  835,  838,  838,  838,  838,  838,  838,  840,  840,  840,
			  840,  840,  840,  846,  282,  845,  854,  841,  844,  841,
			  864,  825,  841,  841,  841,  841,  841,  841,  842,  842,
			  842,  842,  842,  842,  843,  858,  859,  860,  846,  268,

			  838,  864,  843,  845,  854,  889,  849,  844,  849,  849,
			  849,  849,  849,  849,  867,  873,  841,  863,  863,  863,
			  863,  863,  863,  858,  859,  868,  860,  846,  869,  864,
			  843,  867,  879,  868,  889,  892,  869,  881,  881,  881,
			  881,  881,  881,  873,  883,  849,  868,  902,  884,  869,
			  882,  882,  882,  882,  882,  882,  884,  885,  886,  867,
			  879,  868,  265,  892,  869,  885,  886,  917,  896,  883,
			  895,  258,  895,  257,  911,  902,  251,  250,  885,  886,
			  249,  895,  911,  248,  884,  896,  904,  904,  904,  904,
			  904,  904,  246,  885,  886,  917,  238,  234,  883,  907, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  907,  907,  907,  907,  907,  233,  232,  229,  227,  895,
			  911,  912,  913,  896,  908,  908,  908,  908,  908,  908,
			  224,  212,  912,  913,  920,  920,  920,  920,  920,  920,
			  190,  186,  912,  913,  918,  918,  183,  918,  918,  918,
			  918,  918,  918,  921,  921,  921,  921,  921,  921,  182,
			  912,  913,  919,  919,  923,  919,  919,  919,  919,  919,
			  919,  924,  935,  163,  935,  923,  928,  928,  928,  928,
			  928,  928,  924,  935,  918,  923,  931,  931,  931,  931,
			  931,  931,  924,  933,  933,  933,  933,  933,  933,  159,
			  156,  153,  919,  923,  934,  934,  934,  934,  934,  934,

			  924,  935,  939,  939,  939,  939,  939,  939,  940,  940,
			  149,  940,  940,  940,  940,  940,  940,  943,  943,  136,
			  943,  943,  943,  943,  943,  943,  946,  946,  116,  946,
			  946,  946,  946,  946,  946,  947,  947,  947,  947,  947,
			  947,  948,  948,  948,  948,  948,  948,  951,  940,  949,
			  949,  949,  949,  949,  952,  953,  953,  943,  953,  953,
			  953,  953,  953,  953,  951,  105,  946,  104,  951,  101,
			   99,  952,   97,  964,   93,  952,  955,  955,  955,  955,
			  955,  955,  958,  958,  958,  958,  958,  958,   90,   89,
			  964,   88,  951,   73,  964,  953,   70,   54,   38,  952, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  961,  961,  961,  961,  961,  961,  962,  962,  962,  962,
			  962,  962,  963,  963,  963,  963,  963,  963,  964,  965,
			  967,  967,  967,  967,  967,  967,  971,  971,   33,  971,
			  971,  971,  971,  971,  971,   31,  965,   26,   24,   16,
			  965,  973,  973,  973,  973,  973,  973,  974,   15,   14,
			  974,  974,  974,  974,  974,  974,  976,  976,  976,  976,
			  976,  976,   11,    0,  965,  977,  971,    0,  977,  977,
			  977,  977,  977,  977,  978,  978,  978,  978,  978,  978,
			    0,    0,    0,    0,    0,  984,  984,  974,  984,  984,
			  984,  984,  984,  984,  987,  987,  987,  987,  987,  987,

			    0,    0,    0,    0,    0,  977,  989,  989,  989,  989,
			  989,  989,  991,  991,  991,  991,  991,  991,  992,  992,
			  992,  992,  992,  992,    0,  984,  993,  993,  993,  993,
			  993,  993,  994,  994,  994,  994,  994,  994,    0,    0,
			    0,    0,    0,  989,    0,    0,    0,    0,    0,  991,
			  998,  998,  998,  998,  998,  998, 1000, 1000, 1000, 1000,
			 1000, 1000, 1001,    0,    0, 1001, 1001, 1001, 1001, 1001,
			 1001, 1002, 1002, 1002, 1002, 1002, 1002, 1003,    0, 1003,
			    0,    0, 1003, 1003, 1003, 1003, 1003, 1003, 1005, 1005,
			 1005, 1005, 1005, 1005, 1008, 1008, 1008, 1008, 1008, 1008, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1006,    0, 1001, 1006, 1006, 1006, 1006, 1006, 1006, 1009,
			 1009, 1009, 1009, 1009, 1009,    0, 1003, 1011, 1011, 1011,
			 1011, 1011, 1011, 1012, 1012, 1012, 1012, 1012, 1012, 1019,
			    0, 1008,    0,    0,    0,    0,    0,    0,    0,    0,
			 1006, 1019, 1019, 1019, 1019, 1019, 1019, 1019, 1019, 1019,
			    0,    0,    0,    0, 1011, 1014, 1014, 1014, 1014, 1014,
			 1014, 1014, 1014, 1014, 1014, 1014, 1014, 1014, 1014, 1014,
			 1014, 1014, 1014, 1014, 1014, 1014, 1014, 1014, 1014, 1014,
			 1014, 1014, 1014, 1014, 1014, 1015, 1015, 1015, 1015, 1015,
			 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015,

			 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015,
			 1015, 1015, 1015, 1015, 1015, 1016, 1016, 1016, 1016, 1016,
			 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016,
			 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016,
			 1016, 1016, 1016, 1016, 1016, 1017, 1017,    0, 1017, 1017,
			 1017, 1017, 1017, 1017, 1017, 1017, 1017, 1017, 1017, 1017,
			 1017, 1017, 1017, 1017, 1017,    0, 1017, 1017, 1017, 1017,
			 1017, 1017, 1017, 1017, 1017, 1018, 1018,    0, 1018, 1018,
			 1018, 1018, 1018, 1018, 1018, 1018, 1018, 1018, 1018, 1018,
			 1018, 1018, 1018, 1018, 1018, 1018, 1018, 1018, 1018, 1018, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1018, 1018, 1018, 1018, 1018, 1020, 1020, 1020, 1020,    0,
			 1020, 1020, 1020, 1020,    0,    0, 1020, 1020, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1021, 1021,    0, 1021,    0,
			 1021, 1021, 1021,    0,    0, 1021, 1021, 1021, 1021,    0,
			    0, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021,
			 1022, 1022,    0, 1022, 1022, 1022, 1022, 1022, 1022, 1022,
			 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022,
			 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022,
			 1023, 1023,    0, 1023, 1023, 1023, 1023, 1023, 1023, 1023,
			 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023,

			    0, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023,
			 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024,
			 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024,
			 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024, 1024,
			 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025,
			 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025,
			 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025, 1025,
			 1026,    0, 1026,    0,    0,    0,    0, 1026,    0, 1026,
			 1026, 1026,    0,    0, 1026, 1026, 1026, 1026,    0,    0,
			 1026, 1026, 1026, 1026, 1026, 1026, 1026, 1026, 1026, 1027, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1027,    0, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027,
			 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027,
			 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1028,
			 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028,
			 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028,
			 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1028, 1029,
			 1029, 1029, 1029,    0,    0, 1029, 1029, 1029, 1029, 1029,
			    0, 1029, 1029, 1029, 1029, 1029, 1029, 1029, 1029, 1029,
			 1030,    0,    0, 1030, 1030, 1030, 1030, 1030, 1030, 1030,
			 1030, 1030,    0,    0, 1030, 1030, 1030, 1030, 1030, 1030,

			 1030, 1030, 1030, 1031, 1031, 1031, 1031, 1031, 1031, 1031,
			 1031, 1031, 1032, 1032, 1032, 1032,    0,    0, 1032, 1032,
			 1032, 1032, 1032, 1032, 1032, 1032, 1032, 1033, 1033, 1033,
			 1033, 1033, 1033, 1033, 1033, 1033,    0, 1033, 1033, 1033,
			 1033, 1033, 1033, 1033, 1033, 1033, 1033, 1033, 1033, 1033,
			 1033, 1033, 1033, 1033, 1033, 1033, 1033, 1034, 1034, 1034,
			 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034,
			 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034,
			 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1035, 1035, 1035,
			 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035,
			 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1036, 1036, 1036,
			 1036,    0,    0, 1036, 1036, 1036, 1036, 1036, 1036, 1036,
			 1036, 1036, 1037, 1037, 1037, 1037,    0,    0, 1037, 1037,
			 1037, 1037, 1037,    0, 1037, 1037, 1037, 1037, 1037, 1037,
			 1037, 1037, 1037, 1038, 1038, 1038,    0,    0, 1038, 1038,
			 1038, 1038,    0,    0, 1038, 1038, 1038, 1038, 1038, 1038,
			 1038, 1038, 1038, 1039, 1039, 1039, 1039, 1039, 1039, 1039,
			 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039,
			 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039,

			 1039, 1039, 1039, 1040, 1040, 1040,    0,    0, 1040, 1040,
			 1040, 1040,    0,    0, 1040, 1040, 1040, 1040, 1040, 1040,
			 1040, 1040, 1040, 1041, 1041, 1041, 1041,    0,    0, 1041,
			 1041, 1041, 1041, 1041, 1041, 1041, 1041, 1041, 1042, 1042,
			 1042,    0,    0, 1042, 1042, 1042, 1042, 1042, 1042, 1042,
			 1042,    0,    0, 1042, 1042, 1042, 1042,    0,    0, 1042,
			 1042, 1042, 1042, 1042, 1042, 1042, 1042, 1042, 1043,    0,
			 1043,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, 1043, 1043, 1043, 1043,    0,    0, 1043, 1043,
			 1043, 1043, 1043, 1043, 1043, 1043, 1043, 1044, 1044, 1044, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0, 1044, 1044, 1044, 1044,    0,    0, 1044, 1044,
			 1044, 1044, 1044, 1044, 1044, 1044, 1044, 1045, 1045, 1045,
			    0,    0, 1045, 1045, 1045, 1045,    0,    0, 1045, 1045,
			 1045, 1045, 1045, 1045, 1045, 1045, 1045, 1046, 1046, 1046,
			    0,    0, 1046, 1046, 1046, 1046,    0,    0, 1046, 1046,
			 1046, 1046, 1046, 1046, 1046, 1046, 1046, 1047, 1047, 1047,
			    0,    0, 1047, 1047, 1047, 1047,    0,    0, 1047, 1047,
			 1047, 1047, 1047, 1047, 1047, 1047, 1047, 1048, 1048, 1048,
			    0,    0, 1048, 1048, 1048, 1048,    0,    0, 1048, 1048,
			 1048, 1048, 1048, 1048, 1048, 1048, 1048, 1049, 1049, 1049,

			    0,    0, 1049, 1049, 1049, 1049,    0,    0, 1049, 1049,
			 1049, 1049, 1049, 1049, 1049, 1049, 1049, 1050, 1050, 1050,
			 1050,    0,    0, 1050, 1050, 1050, 1050, 1050, 1050, 1050,
			 1050, 1050, 1051, 1051, 1051, 1051,    0,    0, 1051, 1051,
			 1051, 1051, 1051, 1051, 1051, 1051, 1051, 1052, 1052, 1052,
			    0,    0, 1052, 1052, 1052, 1052,    0,    0, 1052, 1052,
			 1052, 1052, 1052, 1052, 1052, 1052, 1052, 1053, 1053, 1053,
			    0,    0, 1053, 1053, 1053, 1053,    0,    0, 1053, 1053,
			 1053, 1053, 1053, 1053, 1053, 1053, 1053, 1054, 1054, 1054,
			 1054,    0,    0, 1054, 1054, 1054, 1054, 1054, 1054, 1054, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_chk_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1054, 1054, 1055, 1055, 1055,    0,    0, 1055, 1055, 1055,
			 1055,    0,    0, 1055, 1055, 1055, 1055, 1055, 1055, 1055,
			 1055, 1055, 1056, 1056, 1056, 1056,    0,    0, 1056, 1056,
			 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1057, 1057, 1057,
			    0,    0, 1057, 1057, 1057, 1057,    0,    0, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1058, 1058, 1058,
			    0,    0, 1058, 1058, 1058, 1058,    0,    0, 1058, 1058,
			 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1059, 1059, 1059,
			    0,    0, 1059, 1059, 1059, 1059,    0,    0, 1059, 1059,
			 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1060, 1060, 1060,

			 1060,    0,    0, 1060, 1060, 1060, 1060, 1060, 1060, 1060,
			 1060, 1060, 1061, 1061, 1061,    0,    0, 1061, 1061, 1061,
			 1061,    0,    0, 1061, 1061, 1061, 1061, 1061, 1061, 1061,
			 1061, 1061, 1062, 1062, 1062,    0,    0, 1062, 1062, 1062,
			 1062,    0,    0, 1062, 1062, 1062, 1062, 1062, 1062, 1062,
			 1062, 1062, 1063, 1063, 1063, 1063,    0,    0, 1063, 1063,
			 1063, 1063, 1063, 1063, 1063, 1063, 1063, 1064, 1064, 1064,
			 1064,    0,    0, 1064, 1064, 1064, 1064, 1064, 1064, 1064,
			 1064, 1064, 1065, 1065, 1065,    0,    0, 1065, 1065, 1065,
			 1065,    0,    0, 1065, 1065, 1065, 1065, 1065, 1065, 1065, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_chk_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1065, 1065, 1066, 1066, 1066, 1066,    0,    0, 1066, 1066,
			 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1067, 1067, 1067,
			    0,    0, 1067, 1067, 1067, 1067,    0,    0, 1067, 1067,
			 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1068, 1068, 1068,
			    0,    0, 1068, 1068, 1068, 1068,    0,    0, 1068, 1068,
			 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1069, 1069, 1069,
			    0,    0, 1069, 1069, 1069, 1069,    0,    0, 1069, 1069,
			 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1070, 1070, 1070,
			    0,    0, 1070, 1070, 1070, 1070,    0,    0, 1070, 1070,
			 1070, 1070, 1070, 1070, 1070, 1070, 1070, 1071, 1071, 1071,

			    0,    0, 1071, 1071, 1071, 1071,    0,    0, 1071, 1071,
			 1071, 1071, 1071, 1071, 1071, 1071, 1071, 1072, 1072, 1072,
			    0,    0, 1072, 1072, 1072, 1072,    0,    0, 1072, 1072,
			 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1073, 1073, 1073,
			    0,    0, 1073, 1073, 1073, 1073,    0,    0, 1073, 1073,
			 1073, 1073, 1073, 1073, 1073, 1073, 1073, 1074, 1074, 1074,
			    0,    0, 1074, 1074, 1074, 1074,    0,    0, 1074, 1074,
			 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1075, 1075, 1075,
			    0,    0, 1075, 1075, 1075, 1075,    0,    0, 1075, 1075,
			 1075, 1075, 1075, 1075, 1075, 1075, 1075, 1076, 1076, 1076, yy_Dummy>>,
			1, 200, 4600)
		end

	yy_chk_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0, 1076, 1076, 1076, 1076,    0,    0, 1076, 1076,
			 1076, 1076, 1076, 1076, 1076, 1076, 1076, 1077, 1077, 1077,
			    0,    0, 1077, 1077, 1077, 1077,    0,    0, 1077, 1077,
			 1077, 1077, 1077, 1077, 1077, 1077, 1077, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,

			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, yy_Dummy>>,
			1, 130, 4800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1077)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			yy_base_template_4 (an_array)
			yy_base_template_5 (an_array)
			yy_base_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   90,   95,   77,   79,   98,  102,  187,
			    0, 3262, 4837,  104, 3246, 3221, 3232, 4837,   86, 4837,
			 4837, 4837, 4837, 4837, 3223,  100, 3220,  266,  276, 4837,
			 4837, 3208, 4837, 3201, 4837,  100,  102,   85, 3172,  265,
			  276,   73,  267,   99,  275,  277,  334,  274,  101,  279,
			   86,   87, 4837, 4837, 3141,  413,  324,  331,  492,  325,
			  104,  111,  533,  280,  270,  337,  334,  327,  272,  297,
			 3179, 4837, 4837, 3186,  322, 4837,  107,  355,  318,  413,
			  322,  418,  363, 4837,  367,  373, 4837,  573, 3188, 3174,
			 3113, 4837,  153, 3171,  575,  579,  326, 3169, 4837, 3163,

			 4837, 3160,    0,  590, 3164, 3149,  598, 4837,  371,  604,
			  617,  648,  627,  662, 4837, 4837, 3102,    0,  626,  480,
			  572,  580,  475,  616,  393,  661,  635,  630,  147,  651,
			  663,  412,  662,  664,  665,  674, 3036,  691,  687,  700,
			  762,  703,  760,  729,  470,  690,  684,  670,  577, 3086,
			  729,  259,  559, 3035, 4837,  401, 3079,    0,  815, 3072,
			  539,  691,  711, 2997,    0,  698,  709,  729,  732,  733,
			  725,  733,  742,  750,  751,  774,  755,  781,  766,  769,
			  777,  772, 3025, 3012,  775,  790, 2974,  833,  788,  800,
			 2973,  788,  790,  796,  821,  837,  837,  840,  866,  867, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  854,  869,  856,  867,  872,  869,  874,  865,  867,  661,
			  862, 4837, 3014, 4837,  583, 4837, 4837,  855,  510,  907,
			  910,  913,  757, 4837, 2966,  898,  899, 2953,  901, 2953,
			 4837,  917, 2931, 3002, 2994,  939,  163,  962, 2993,  963,
			  749, 1018,  821, 4837, 4837, 4837, 2983,  961, 2974, 2971,
			 2968, 2967,  862, 4837,  951, 1098,  983, 2956, 2905, 1104,
			 1110, 1127, 1137, 1116, 1143, 2934, 1142, 1128, 2873, 1143,
			 1145,  940, 1147,  924, 1149, 1151, 1086, 1150, 1113, 1148,
			 1158, 1156, 2848, 1157, 1165, 4837,  125, 1216, 1225, 1234,
			 1246, 1245, 1253, 1175,  133, 1181,  352, 1249, 1186, 1245,

			 1160, 2830, 1250, 2819, 1284, 1313, 1320, 1169, 4837, 1224,
			 2816,  887, 1161,    0,    0, 2770, 1250, 1244,    0, 1245,
			 1246, 1256, 1246, 1261, 1249, 1262, 1258, 1252, 1266, 1290,
			 1299, 1300, 2765, 1301, 2764, 1331, 1310, 1311, 1313, 2752,
			 1343, 1313, 1315, 1323, 1324,    0,    0, 1310, 1333, 1320,
			 1335, 1329, 1338, 1335, 1351, 1343, 1343, 2709, 1345, 1345,
			 2708,    0,    0, 1160, 1229, 1346,  421, 1384, 1386, 1394,
			 1398, 1401,  807, 4837, 2708, 4837, 1405, 1420, 2759, 1421,
			 4837,  921, 1007, 2758, 4837, 4837, 1430, 4837, 4837, 4837,
			 4837, 1420, 1443, 1471, 1477,    0, 2686, 1483, 1489, 1511, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1495, 1517, 1534, 1543, 1549, 1555, 2716, 1383, 1380, 1515,
			 1554, 1553, 2717, 1555, 1557, 1556, 1559, 1555, 1560, 1568,
			 1386, 1570, 1567, 1574, 1630, 1639, 1648, 1655, 1661, 1683,
			 1692, 2716, 2682, 1596, 2681, 1615, 1573, 1666, 1193, 1542,
			 1714, 1726, 1670, 1736, 1759, 1766, 1804, 1379, 2619,    0,
			 1347, 1470,  833, 1777, 1476, 1552, 1477, 1564, 1572, 1577,
			 1576, 1593,    0, 1645, 1652,    0, 1660, 1687, 1703, 1736,
			 1740, 1738, 1729, 1738, 1811, 1770, 1762, 1774, 1775, 1768,
			 1770, 1771, 1772,    0,    0,    0,    0, 1771, 1802, 1807,
			 1794, 1813, 2593, 2591, 4837, 1847,  923, 1835, 1409, 4837,

			 1859, 1865, 1871, 1674, 1885, 2590, 1892, 1899, 1909, 1915,
			 1921, 1937,  573, 1949, 1961, 1847,  932, 2576, 1163, 1927,
			 1921, 1959, 1960, 1961, 2523, 1924, 2515, 1939, 1970, 2508,
			 1968, 1824, 1971, 1990, 2023, 2032, 1988, 1972, 1998, 1974,
			 1825, 2028, 4837, 1738, 2061, 1946, 4837, 2083, 4837, 1619,
			 1540, 2090, 4837, 2097, 4837,  690,    0, 2423,    0, 2408,
			    0,    0, 2440, 1717, 2107,    0, 2392, 1834, 1890, 1905,
			 1955, 1958, 2015, 2025, 2025, 2028, 2090,    0, 2023,    0,
			 2031, 2033,    0, 2425, 2119, 2033, 2037, 2098, 2099, 2098,
			 2110, 2100, 2112, 2113, 2114, 2104, 2108, 2117, 2119, 2178, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2376, 2136,    0,    0, 2404, 2169, 2189, 2168, 2196, 2147,
			 2216, 2370, 2227, 2236, 2242, 2207, 4837, 2248, 2246, 2353,
			 2247, 2341, 2217, 2248, 2339, 2156, 2246, 2206, 2252, 2255,
			 2257, 2261, 4837, 2321, 2308, 2258, 2267, 2262, 2268, 2271,
			 2328, 2257, 2338,    0, 2366, 2389, 2301, 2291, 2354, 2255,
			 2275,  682,    0, 2377, 2225,    0,    0, 2268,    0, 2279,
			    0, 2278, 2294,    0, 2304, 2323,    0, 2362, 2356, 2370,
			 2360, 2380, 2369, 2371, 2384, 2386, 2386, 2389,    0, 2378,
			 2392, 2392,    0, 2381, 2417, 2216,  991,    0, 2437, 2189,
			 2448, 2454, 2460, 2428, 2473, 2073, 2479, 2485, 2494, 2484,

			 2483, 2014, 2492, 2003, 2490, 2000, 1992, 1919, 2494, 1897,
			 2492, 2497, 2500, 2499, 1883, 1860, 2525, 2538, 1849,    0,
			    0, 1842, 2552, 2559, 2482,    0,    0, 2300, 2568, 2491,
			 2493,    0, 2509,    0, 2538,    0,    0,    0,    0,    0,
			    0,    0, 2530,    0, 2531,    0, 2539, 2548, 2559, 2560,
			    0,    0, 2579, 2608, 2597, 2617, 2623, 2634, 2468, 2646,
			 2596, 2652, 2650, 2624, 2571, 4837, 2651, 2649, 2654, 2655,
			 1838, 2655, 2663,  413, 2709,    0,    0, 1779, 2020, 1763,
			 1186,    0, 2715, 1753, 2619,    0, 1752, 2653, 2655, 2660,
			 2664, 2680, 2686, 2687, 2705,    0, 2708,    0, 1738, 1672, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2731, 2737, 2752, 2758, 2764, 2770, 4837, 2777, 2775, 2776,
			 1696, 2779, 4837, 1694, 2777, 2775, 2777, 2796, 4837, 1672,
			 1378,    0,    0,    0, 2804, 2826, 2770, 1669, 2762, 2779,
			    0,    0, 2795, 2796,    0, 2785,    0, 1638, 2843, 1598,
			 2849, 2864, 2870, 2868, 2827, 2829, 2847, 1227, 4837, 2890,
			    0,    0,    0, 1628, 2842,    0, 2083, 2545, 2849, 2850,
			 2846,    0, 2202, 2899, 2854, 1596, 1587, 2888, 2896, 2899,
			    0, 1593, 1586, 2868,  638,    0,    0,    0,    0, 2889,
			 1099, 2919, 2932, 2918, 2922, 2928, 2929, 1527,    0, 2854,
			    0, 1450, 2901,    0, 1448, 2957, 2942, 1494, 1454, 1450,

			    0, 1452, 2904, 1613, 2968,    0, 1960, 2981, 2996, 2682,
			 4837, 2948, 2982, 2983, 1999,    0, 1380, 2933, 3019, 3037,
			 3006, 3025, 1252, 3025, 3032,    0, 1196, 2058, 3048,    0,
			 1386, 3058, 2019, 3065, 3076, 3049, 1204, 1202, 2225, 3084,
			 3093, 1147, 1081, 3102,  949,  951, 3111, 3117, 3123, 3131,
			 4837, 3118, 3125, 3140, 2270, 3158,  919, 1909, 3164,  870,
			 2286, 3182, 3188, 3194, 3144, 3190, 2358, 3202, 4837,  791,
			  705, 3211,  627, 3223, 3232,  576, 3238, 3250, 3256, 2645,
			 4837, 4837,  515,  516, 3270,  450, 2326, 3276,  449, 3288,
			  437, 3294, 3300, 3308, 3314, 4837,  342, 2690, 3332,  278, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3338, 3347, 3353, 3364,  251, 3370, 3385,  223, 3376, 3391,
			  119, 3399, 3405, 4837, 3454, 3484, 3514, 3544, 3574, 3419,
			 3594, 3619, 3649, 3679, 3709, 3739, 3768, 3798, 3828, 3849,
			 3872, 3881, 3896, 3926, 3956, 3986, 4001, 4022, 4042, 4072,
			 4092, 4107, 4137, 4166, 4186, 4206, 4226, 4246, 4266, 4286,
			 4301, 4316, 4336, 4356, 4371, 4391, 4406, 4426, 4446, 4466,
			 4481, 4501, 4521, 4536, 4551, 4571, 4586, 4606, 4626, 4646,
			 4666, 4686, 4706, 4726, 4746, 4766, 4786, 4806, yy_Dummy>>,
			1, 78, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1077)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			yy_def_template_5 (an_array)
			yy_def_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0, 1013,    1, 1014, 1014, 1015, 1015, 1016, 1016, 1013,
			    9, 1013, 1013, 1013, 1013, 1013, 1017, 1013, 1018, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1019, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1020, 1020, 1020, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020,
			 1020, 1021, 1013, 1013, 1022, 1013,   55,   55, 1013,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			 1013, 1013, 1013, 1023, 1013, 1013, 1013, 1023, 1023, 1023,
			 1023, 1023, 1024, 1013, 1025, 1024, 1013, 1013, 1013, 1013,
			 1013, 1013, 1026, 1013, 1026, 1026, 1013, 1013, 1013, 1017,

			 1013, 1027, 1027, 1027, 1028, 1013, 1013, 1013, 1029, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1020, 1030, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1013,   46, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1021,
			 1021, 1021, 1021, 1022, 1013, 1013, 1013, 1031,   58, 1013,
			  158,  158,  158, 1032,   58,   58,   58,   58,  158,   58,
			  158,  158,   58,   58,  158,  158,   58,   58,  158,  158,
			   58,   58,  158,   58,  158,  158,  158,   58,   58,   58,
			   58,  158,   58,  158,   58,  158,  158,   58,   58,  158, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  158,   58,   58,  158,  158,   58,   58,  158,   58,  158,
			   58, 1013, 1023, 1013, 1013, 1013, 1013, 1023, 1023, 1023,
			 1023, 1023, 1024, 1013, 1033, 1024, 1025, 1034, 1025, 1033,
			 1013, 1013, 1013, 1013, 1035, 1013, 1026, 1026, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1019, 1036, 1013,
			 1013, 1013, 1013, 1013, 1013, 1030, 1020, 1020, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1013, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1013, 1020, 1020, 1020, 1020,
			  140,  140, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020,

			 1020, 1020, 1020, 1013, 1021, 1021, 1021, 1021, 1013, 1037,
			 1013,  158,  158,  158, 1038, 1038,   58,   58,   58,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			   58,  158,  158,   58,   58, 1013,  158,  158,  158,  158,
			  158,   58,   58,  158,   58,  158,   58,  158,  158,   58,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			   58,  158,   58,  158,   58, 1023, 1023, 1023, 1023, 1023,
			 1023, 1023, 1033, 1013, 1034, 1013, 1013, 1013, 1039, 1039,
			 1013, 1039, 1039, 1039, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1040, 1040, 1013, 1013, 1013, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1013, 1013, 1013, 1013, 1013, 1013, 1030, 1020, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1013, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020,  425,  425, 1013, 1020,
			 1020, 1020, 1020, 1013, 1020, 1020, 1020, 1020, 1020, 1013,
			 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1041, 1042,
			  158,  158, 1038, 1038,   58,   58,  158,   58,  158,  158,
			   58,   58,  158,  158,  158,   58,   58,   58,  158,  158,
			   58,  158,  158,  158, 1013,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,  158,
			   58,   58,  158,   58, 1013, 1013, 1013, 1013, 1013, 1013,

			 1013, 1013, 1013, 1040, 1040, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1020, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1013, 1020, 1020, 1020,
			 1020, 1020, 1020, 1013, 1020,  534, 1013, 1020, 1020, 1020,
			 1020, 1013, 1013, 1013, 1021, 1013, 1013, 1021, 1013, 1013,
			 1043, 1021, 1013, 1021, 1013, 1021, 1044, 1044,  158,  158,
			 1045, 1046, 1013, 1038, 1038,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,   58,
			  158,  158,  158, 1013, 1013,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,  158,  158,   58,   58, 1013, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1013, 1013, 1047, 1048, 1013, 1040, 1040, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1020, 1020,
			 1020, 1020, 1020, 1020, 1020, 1020, 1013, 1020, 1020, 1020,
			 1020, 1020, 1013, 1013, 1020, 1020, 1020, 1020, 1013, 1013,
			 1021, 1013, 1021, 1049, 1021, 1021, 1021, 1044, 1044,  158,
			 1045, 1046, 1050, 1046, 1013,  158,   58,  158,  158,   58,
			   58,  158,  158,  158,   58,   58,   58,  158,  158,  158,
			   58,   58,  158,   58,  158,  158,   58,   58,  158,  158,
			  158,  158,   58,   58, 1013, 1047, 1048, 1051, 1048, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1020,

			 1020, 1020, 1020, 1020, 1013, 1020, 1020, 1020, 1020, 1020,
			 1013, 1020, 1020, 1020, 1013, 1013, 1013, 1049, 1013, 1052,
			 1053, 1013, 1044, 1044,  158, 1054, 1055, 1046, 1046,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			  158,   58,  158,  158,   58,   58,  158,  158,  158,   58,
			 1056, 1057, 1048, 1048, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1020, 1020, 1020, 1013, 1020, 1013, 1020, 1020,
			 1020, 1013, 1013, 1013, 1013, 1058, 1059, 1013, 1013, 1052,
			 1053, 1060, 1053, 1013,  158, 1061, 1055,  158,   58,  158,
			   58,  158,   58,  158,  158,  158,   58, 1062, 1057, 1013, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1020, 1020,
			 1020, 1020, 1013, 1020, 1020, 1013, 1013, 1013, 1013, 1058,
			 1059, 1063, 1064, 1065, 1053, 1053,  158, 1061,  158,   58,
			  158,   58,  158,   58,  158,  158,   58, 1062, 1013, 1013,
			 1013, 1013, 1013, 1020, 1020, 1020, 1020, 1013, 1013, 1013,
			 1066, 1067, 1068, 1065,  158, 1069,  158,   58,  158,   58,
			  158, 1070, 1013, 1013, 1020, 1020, 1020, 1020, 1013, 1013,
			 1071, 1067, 1068,  158, 1069,  158,   58,  158,   58,  158,
			 1070, 1013, 1013, 1020, 1020, 1013, 1013, 1071, 1072,  158,
			 1073, 1013,  158, 1074, 1013, 1013, 1020, 1020, 1013, 1013,

			 1075, 1072,  158, 1073, 1013,  158, 1074, 1013, 1013, 1013,
			 1013, 1020, 1013, 1013, 1075, 1076, 1013,  158, 1013, 1013,
			 1013, 1013, 1020, 1013, 1013, 1077, 1013, 1076, 1013,  158,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1077, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, yy_Dummy>>,
			1, 200, 800)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013,    0, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, yy_Dummy>>,
			1, 78, 1000)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 256)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
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
			   87,   87,    1,    1,   88,   88,   88,   88,   88,   88, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   89,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   91,   92,   92,   92,   92,   92,   92,   92,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,    9,   10,   11,   11,
			   11,   11,   12,   13,    1,    1,   14,    1,   15,    1,
			   16,   16,   17,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   18,
			   16,   16,   19,   20,   21,    5,    5,   11,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1013)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			yy_accept_template_4 (an_array)
			yy_accept_template_5 (an_array)
			yy_accept_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,   92,   92,    0,    0,    0,
			    0,  138,  136,    1,    2,   15,  120,   18,  136,   16,
			   17,    7,    6,   13,    5,   11,    8,   97,   97,   14,
			   12,   28,   10,   29,   19,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   76,   84,   84,   84,
			   84,   21,   30,   22,    9,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   23,   20,   24,  124,  125,  126,  127,  124,  124,  124,
			  124,  124,   92,   95,  137,   92,  110,  110,  107,  110,
			  110,  118,  118,  115,  118,  118,    1,    2,   27,  120,

			  119,  134,  134,  134,    3,   32,  103,   31,   88,    0,
			    0,   97,    0,   97,   26,   25,   84,    0,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   39,    0,   84,   83,   83,
			   75,   83,   83,   84,   84,   84,   84,   84,   84,    0,
			    0,    0,    0,    0,   96,    0,    0,    0,   87,    0,
			   87,   87,   87,    0,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   39,   87,   39,   87, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   91,  124,  126,  125,  122,  121,  123,  124,  124,
			  124,  124,   92,   95,    0,   92,    0,    0,    0,   93,
			   94,    0,    0,  107,    0,    0,    0,    0,  115,    0,
			  114,    0,  113,  117,  134,  128,  134,  134,  134,  134,
			  134,  134,    4,   33,  103,    0,    0,    0,    0,    0,
			   99,    0,   97,    0,    0,    0,   84,   84,   38,   84,
			   84,   84,   84,   84,   84,   84,   84,    0,   84,   84,
			   84,   84,   41,   84,   84,   82,   76,   76,   76,   76,
			   83,   84,   83,   83,   83,   84,   84,   84,   84,   84,

			   84,   40,   84,    0,    0,    0,    0,    0,   86,   89,
			    0,   87,   87,   38,    0,    0,   87,   87,   38,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,    0,   87,   87,   87,   63,
			   63,   87,   87,   87,   87,   41,   41,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   40,   40,   87,   87,  124,  124,  124,  124,  124,
			  124,  124,    0,   93,   94,  108,    0,    0,    0,    0,
			  116,  114,  113,  117,  132,  135,  135,  133,  129,  130,
			  131,  103,    0,  103,    0,    0,    0,    0,   99,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  102,   97,    0,    0,   85,   84,   84,   84,
			   84,   84,   37,   84,   84,   84,   84,    0,   84,   84,
			   84,   84,   84,   84,   75,   84,   84,   84,    0,   75,
			   75,   75,   36,    0,   43,   84,   84,   84,   84,  112,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   90,
			   87,   87,    0,    0,   87,   87,   87,   87,   87,   87,
			   87,   87,   37,   87,   87,   37,   87,   87,   87,   87,
			   87,   87,   87,   87,    0,   87,   87,   87,   87,   87,
			   87,   87,   87,   36,   43,   36,   43,   87,   87,   87,
			   87,   87,   87,   87,   94,    0,  106,    0,  105,  109,

			  103,    0,    0,    0,    0,   98,   99,    0,  100,    0,
			  102,    0,    0,    0,   97,   72,    0,   58,   84,   84,
			   84,   84,   84,   84,   44,   84,    0,   84,   84,   35,
			   84,   84,   84,    0,   84,   84,    0,   84,   84,   84,
			   84,    0,  111,    0,    0,    0,   64,    0,   65,    0,
			    0,    0,   62,    0,   61,    0,    0,    0,   58,   87,
			    0,    0,    0,    0,    0,   58,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   44,   87,   44,
			   87,   87,   35,   63,   63,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,    0, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  103,    0,    0,    0,    0,    0,    0,   99,  100,    0,
			    0,  102,    0,    0,    0,    0,   72,    0,   84,   59,
			   84,   60,   84,   84,   46,   84,    0,   84,   84,   84,
			   84,   84,   75,    0,   52,   84,   84,   84,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   87,
			    0,    0,    0,    0,    0,   59,   59,   87,   60,   87,
			   60,   87,   87,   46,   87,   87,   46,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   52,   87,
			   87,   87,   52,   87,    0,    0,    0,    0,    0,   88,
			    0,  100,    0,  103,    0,   74,    0,    0,  101,   84,

			   84,   57,   84,   45,    0,   42,   56,   34,   84,   50,
			    0,   84,   84,   84,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   87,    0,    0,    0,    0,   87,
			   87,   57,   87,   57,   87,   45,   42,   56,   42,   56,
			   34,   34,   87,   50,   87,   50,   87,   87,   87,   87,
			    0,    0,    0,    0,    0,  100,    0,    0,    0,    0,
			   71,  101,   84,   84,   84,   79,   84,    0,   84,   84,
			   53,    0,    0,    0,    0,    0,    0,    0,  104,    0,
			    0,    0,    0,   89,   87,    0,    0,   87,   87,   87,
			   87,   87,   87,   87,   87,   53,   87,    0,    0,  102, yy_Dummy>>,
			1, 200, 600)
		end

	yy_accept_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,  102,    0,    0,    0,    0,   71,  101,   84,   84,
			   47,   84,   78,   51,   84,    0,    0,    0,   66,    0,
			    0,    0,    0,    0,    0,    0,   87,    0,   87,   87,
			   47,   47,   87,   87,   51,   87,   51,    0,  102,   73,
			    0,   71,  101,   84,   84,   84,   84,   77,   77,    0,
			    0,    0,    0,    0,   87,    0,   87,   87,   87,   87,
			   87,    0,    0,    0,   84,   49,   48,   84,    0,    0,
			    0,    0,    0,   87,    0,   49,   49,   48,   48,   87,
			    0,    0,    0,   84,   84,    0,    0,    0,    0,   87,
			    0,    0,   87,    0,    0,   70,   84,   54,    0,    0,

			    0,    0,   87,    0,    0,   54,    0,    0,    0,    0,
			   70,   84,    0,    0,    0,    0,    0,   87,    0,    0,
			    0,    0,   55,    0,    0,    0,    0,    0,    0,   55,
			    0,    0,    0,    0,    0,   69,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   69,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   67,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   68,
			   80,   81,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   68,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 800)
		end

	yy_accept_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   68,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, yy_Dummy>>,
			1, 14, 1000)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4837
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1013
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1014
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

	yyNb_rules: INTEGER = 137
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 138
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_REGEXP1: INTEGER = 2
	IN_EXPANDED_VALUE_SET_DEF: INTEGER = 3
	IN_EXTERNAL_VALUE_SET_DEF: INTEGER = 4
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
			create str_.make_empty
			create last_string_value.make_empty
			create last_term_constraint_parse_structure_value.make
		end

feature -- Commands

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
		end

feature -- Access

	ref_model: BMM_MODEL
		attribute
			create Result.default_create
		end

	aom_profile: detachable AOM_PROFILE

	in_buffer: STRING
			-- Buffer for lexical tokens.

	in_lineno: INTEGER
			-- Current line number.

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

	source_start_line: INTEGER
			-- Offset of source in other document, else 0.

	err_str: STRING
		attribute
			create Result.make (0)
		end

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER = 1024
				-- Initial size for `in_buffer'

	is_assumed_code: BOOLEAN
			-- True if next code parsed is assumed code

	is_primitive_type (a_type_name: STRING): BOOLEAN
		do
			Result := attached aom_profile as aomp and then aomp.has_aom_primitive_type (a_type_name) or 
				c_primitive_subtypes.has (a_type_name.as_upper) or 
				ref_model.has_class_definition (a_type_name) and then ref_model.is_enumerated_type (a_type_name)
		end

end
